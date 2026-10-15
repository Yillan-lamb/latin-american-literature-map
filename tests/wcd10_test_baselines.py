"""Rebuild immutable WCD-10 test checkpoints from tracked history inputs."""
from __future__ import annotations

import hashlib
import json
import sqlite3
import subprocess
from contextlib import closing
from pathlib import Path


SEED_COMMIT = "05f3372c69a54ec331d31b05d16c8288d6d3a993"
EXPECTED_B04_BASELINE_SHA256 = "079deee47063d2435bdaafe1b3c1dca24ca8b6c7353acc1427075bf0ce86746d"
EXPECTED_B05_BASELINE_SHA256 = "45e8d72c3656f762f4a34f664c822c33685be925b53553b91b19041d6835b47d"
WCD10_MIGRATIONS = (
    ("b01", "0036_wcd10_b01_author_works"),
    ("b02", "0037_wcd10_b02_author_works"),
    ("b03", "0038_wcd10_b03_author_works"),
    ("b04", "0039_wcd10_b04_author_works"),
)


def _sql_literal(value):
    if value is None:
        return "NULL"
    return "'" + str(value).replace("'", "''") + "'"


def _canonical_rows(rows):
    return sorted(json.dumps(row, ensure_ascii=False, sort_keys=True) for row in rows)


def _rebuild_baseline(
    repository: Path,
    destination: Path,
    *,
    migrations: tuple[tuple[str, str], ...],
    oracle_batch: str,
    expected_sha256: str,
) -> dict:
    """Recreate one immutable checkpoint from pinned Git history and tracked artifacts."""
    repository = Path(repository)
    destination = Path(destination)
    destination.parent.mkdir(parents=True, exist_ok=True)
    seed = subprocess.check_output(
        ["git", "show", f"{SEED_COMMIT}:data/master/V1_MASTER.sqlite"], cwd=repository
    )
    destination.write_bytes(seed)
    inputs = [f"git:{SEED_COMMIT}:data/master/V1_MASTER.sqlite"]

    with closing(sqlite3.connect(destination)) as conn:
        conn.execute("PRAGMA foreign_keys=ON")
        for batch, migration in migrations:
            snapshot_path = repository / f"data/exports/wcd10-{batch}-checkpoint/data.json"
            inputs.append(snapshot_path.relative_to(repository).as_posix())
            snapshot = json.loads(snapshot_path.read_text(encoding="utf-8"))
            record = next(
                row for row in snapshot["tables"]["migration_log"]
                if row["migration_id"] == migration
            )
            log_insert = (
                "INSERT INTO migration_log (" + ",".join(record) + ") VALUES ("
                + ",".join(_sql_literal(value) for value in record.values()) + ");"
            )
            sql_path = repository / "data/master/migrations" / f"{migration}.sql"
            inputs.append(sql_path.relative_to(repository).as_posix())
            conn.executescript(
                "BEGIN;\n" + sql_path.read_text(encoding="utf-8")
                + "\n" + log_insert + "\nCOMMIT;"
            )

    oracle_path = repository / f"data/exports/wcd10-{oracle_batch}-checkpoint/data.json"
    inputs.append(oracle_path.relative_to(repository).as_posix())
    expected = json.loads(oracle_path.read_text(encoding="utf-8"))["tables"]
    with closing(sqlite3.connect(destination)) as conn:
        conn.row_factory = sqlite3.Row
        actual_names = {
            row[0] for row in conn.execute(
                "SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%'"
            )
        }
        if actual_names != set(expected):
            raise AssertionError(f"reconstructed {oracle_batch.upper()} baseline table set differs from frozen export")
        mismatches = []
        for table in sorted(expected):
            rows = [dict(row) for row in conn.execute(f'SELECT * FROM "{table}"')]
            if _canonical_rows(rows) != _canonical_rows(expected[table]):
                mismatches.append(table)
        if mismatches:
            raise AssertionError(
                f"reconstructed {oracle_batch.upper()} baseline differs from frozen tables: "
                + ", ".join(mismatches)
            )

    digest = hashlib.sha256(destination.read_bytes()).hexdigest()
    return {
        "path": destination,
        "sha256": digest,
        "matches_expected_sha256": digest == expected_sha256,
        "verified_tables": len(expected),
        "inputs": inputs,
    }


def rebuild_b04_baseline(repository: Path, destination: Path) -> dict:
    """Recreate B04's post-B03 baseline and verify it against the frozen B03 export.

    This is the B04 migration pre-state. No ignored database snapshot is used.
    """
    return _rebuild_baseline(
        repository,
        destination,
        migrations=WCD10_MIGRATIONS[:3],
        oracle_batch="b03",
        expected_sha256=EXPECTED_B04_BASELINE_SHA256,
    )


def rebuild_b05_baseline(repository: Path, destination: Path) -> dict:
    """Recreate the post-B04 baseline from the pinned Git seed and tracked artifacts.

    The function intentionally has no dependency on ignored `work/wcd10-qa`
    database snapshots. It verifies every table against the frozen B04 export
    oracle before returning the reconstructed database digest.
    """
    return _rebuild_baseline(
        repository,
        destination,
        migrations=WCD10_MIGRATIONS,
        oracle_batch="b04",
        expected_sha256=EXPECTED_B05_BASELINE_SHA256,
    )
