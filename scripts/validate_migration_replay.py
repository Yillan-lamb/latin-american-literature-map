#!/usr/bin/env python3
"""Replay every append-only migration from V1.0.0 and compare final tables."""

from __future__ import annotations

import argparse
import hashlib
import json
import shutil
import sqlite3
import subprocess
import sys
import tempfile
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_BASE = ROOT / "data/staging/v1_candidate/V1_CANDIDATE.sqlite"
DEFAULT_MASTER = ROOT / "data/master/V1_MASTER.sqlite"
DEFAULT_MIGRATIONS = ROOT / "data/master/migrations"
APPLY = ROOT / "scripts/apply_migration.py"
BASE_SHA256 = "e82533519dcfe2ae1a1c6d02f60c5d775dd95f49e0506c2cbeb6c649a89fb853"


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def quoted(identifier: str) -> str:
    return '"' + identifier.replace('"', '""') + '"'


def tables(connection: sqlite3.Connection) -> list[str]:
    return [
        row[0]
        for row in connection.execute(
            "SELECT name FROM sqlite_master WHERE type='table' "
            "AND name NOT LIKE 'sqlite_%' ORDER BY name"
        )
    ]


def comparable_rows(connection: sqlite3.Connection, table: str) -> Counter[tuple[object, ...]]:
    columns = [row[1] for row in connection.execute(f"PRAGMA table_info({quoted(table)})")]
    if table == "migration_log":
        columns = [column for column in columns if column != "applied_at"]
    selected = ", ".join(quoted(column) for column in columns)
    return Counter(connection.execute(f"SELECT {selected} FROM {quoted(table)}").fetchall())


def assert_database_health(connection: sqlite3.Connection, label: str) -> None:
    integrity = connection.execute("PRAGMA integrity_check").fetchall()
    if integrity != [("ok",)]:
        raise ValueError(f"{label} integrity_check failed: {integrity}")
    foreign_keys = connection.execute("PRAGMA foreign_key_check").fetchall()
    if foreign_keys:
        raise ValueError(f"{label} foreign_key_check failed: {foreign_keys}")


def compare_databases(master: sqlite3.Connection, rebuilt: sqlite3.Connection,
                      expected_tables: int | None = None) -> int:
    """Compare schemas and row multisets; only log execution time may differ."""
    assert_database_health(master, "master")
    assert_database_health(rebuilt, "replay")
    names = tables(master)
    if names != tables(rebuilt):
        raise ValueError("replayed database table set differs from master")
    if expected_tables is not None and len(names) != expected_tables:
        raise ValueError(f"expected {expected_tables} tables, found {len(names)}")
    for table in names:
        definition = f"PRAGMA table_info({quoted(table)})"
        if master.execute(definition).fetchall() != rebuilt.execute(definition).fetchall():
            raise ValueError(f"replayed table schema differs from master: {table}")
        if comparable_rows(master, table) != comparable_rows(rebuilt, table):
            raise ValueError(f"replayed table differs from master: {table}")
    return len(names)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--base", type=Path, default=DEFAULT_BASE)
    parser.add_argument("--master", type=Path, default=DEFAULT_MASTER)
    parser.add_argument("--migrations", type=Path, default=DEFAULT_MIGRATIONS)
    parser.add_argument("--expected-migrations", type=int)
    parser.add_argument("--expected-tables", type=int)
    args = parser.parse_args()

    if digest(args.base) != BASE_SHA256:
        raise ValueError("V1.0.0 replay base does not match the frozen baseline SHA-256")

    migration_files = sorted(args.migrations.glob("[0-9][0-9][0-9][0-9]_*.sql"))
    if args.expected_migrations is not None and len(migration_files) != args.expected_migrations:
        raise ValueError(f"expected {args.expected_migrations} migrations, found {len(migration_files)}")
    with sqlite3.connect(f"file:{args.master}?mode=ro", uri=True) as master:
        log = {
            migration_id: (task_id, reviewer, schema_version)
            for migration_id, task_id, reviewer, schema_version in master.execute(
                "SELECT migration_id, task_id, reviewer, schema_version FROM migration_log"
            )
        }
    if [path.stem for path in migration_files] != sorted(log):
        raise ValueError("master migration log and migration directory do not match")

    with tempfile.TemporaryDirectory(prefix="lalm-migration-replay-") as temporary:
        replay = Path(temporary) / "V1_MASTER_REPLAY.sqlite"
        shutil.copy2(args.base, replay)
        for migration in migration_files:
            task_id, reviewer, target_schema = log[migration.stem]
            with sqlite3.connect(replay) as replay_connection:
                current_schema = replay_connection.execute(
                    "SELECT value FROM metadata WHERE key='schema_version'"
                ).fetchone()[0]
            subprocess.run(
                [
                    sys.executable,
                    str(APPLY),
                    str(replay),
                    str(migration),
                    "--task-id",
                    task_id,
                    "--reviewer",
                    reviewer,
                    "--pre-schema",
                    current_schema,
                    "--expected-schema",
                    target_schema,
                ],
                cwd=ROOT,
                check=True,
                capture_output=True,
                text=True,
            )

        with (
            sqlite3.connect(f"file:{args.master}?mode=ro", uri=True) as master,
            sqlite3.connect(f"file:{replay}?mode=ro", uri=True) as rebuilt,
        ):
            table_count = compare_databases(master, rebuilt, args.expected_tables)

    print(json.dumps({
        "status": "PASS",
        "base_sha256": BASE_SHA256,
        "migrations_replayed": len(migration_files),
        "tables_equal": table_count,
        "integrity_check": "ok",
        "foreign_key_errors": 0,
        "master_integrity_check": "ok",
        "master_foreign_key_errors": 0,
        "ignored_columns": ["migration_log.applied_at"],
    }, ensure_ascii=False, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
