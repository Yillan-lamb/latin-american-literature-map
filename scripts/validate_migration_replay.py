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


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--base", type=Path, default=DEFAULT_BASE)
    parser.add_argument("--master", type=Path, default=DEFAULT_MASTER)
    parser.add_argument("--migrations", type=Path, default=DEFAULT_MIGRATIONS)
    args = parser.parse_args()

    if digest(args.base) != BASE_SHA256:
        raise ValueError("V1.0.0 replay base does not match the frozen baseline SHA-256")

    migration_files = sorted(args.migrations.glob("[0-9][0-9][0-9][0-9]_*.sql"))
    with sqlite3.connect(f"file:{args.master}?mode=ro", uri=True) as master:
        log = {
            migration_id: (task_id, reviewer)
            for migration_id, task_id, reviewer in master.execute(
                "SELECT migration_id, task_id, reviewer FROM migration_log"
            )
        }
    if [path.stem for path in migration_files] != sorted(log):
        raise ValueError("master migration log and migration directory do not match")

    with tempfile.TemporaryDirectory(prefix="lalm-migration-replay-") as temporary:
        replay = Path(temporary) / "V1_MASTER_REPLAY.sqlite"
        shutil.copy2(args.base, replay)
        for migration in migration_files:
            task_id, reviewer = log[migration.stem]
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
                    "--expected-schema",
                    "0.3",
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
            master_tables = tables(master)
            if master_tables != tables(rebuilt):
                raise ValueError("replayed database table set differs from master")
            for table in master_tables:
                if comparable_rows(master, table) != comparable_rows(rebuilt, table):
                    raise ValueError(f"replayed table differs from master: {table}")
            integrity = rebuilt.execute("PRAGMA integrity_check").fetchone()[0]
            foreign_key_errors = len(rebuilt.execute("PRAGMA foreign_key_check").fetchall())

    print(json.dumps({
        "status": "PASS",
        "base_sha256": BASE_SHA256,
        "migrations_replayed": len(migration_files),
        "tables_equal": len(master_tables),
        "integrity_check": integrity,
        "foreign_key_errors": foreign_key_errors,
    }, ensure_ascii=False, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
