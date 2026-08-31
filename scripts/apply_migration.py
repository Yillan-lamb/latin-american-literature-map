#!/usr/bin/env python3
"""Apply one reviewed, versioned SQL migration to the master database."""

from __future__ import annotations

import argparse
import hashlib
import re
import sqlite3
import sys
from datetime import datetime, timezone
from pathlib import Path

from validate_master import validate_database


MIGRATION_ID = re.compile(r"^[0-9]{4}_[a-z0-9_]+$")
FORBIDDEN = re.compile(r"\b(?:ATTACH|DETACH|VACUUM|writable_schema)\b", re.IGNORECASE)


def sql_literal(value: str) -> str:
    return "'" + value.replace("'", "''") + "'"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("database", type=Path)
    parser.add_argument("migration", type=Path)
    parser.add_argument("--task-id", required=True)
    parser.add_argument("--reviewer", required=True)
    parser.add_argument("--expected-schema", default="0.4")
    parser.add_argument(
        "--pre-schema",
        help="Schema version expected before this migration; defaults to --expected-schema.",
    )
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    if not args.database.is_file():
        parser.error(f"database not found: {args.database}")
    if not args.migration.is_file():
        parser.error(f"migration not found: {args.migration}")
    migration_id = args.migration.stem
    if not MIGRATION_ID.fullmatch(migration_id):
        parser.error("migration filename must match 0001_lowercase_description.sql")
    sql = args.migration.read_text(encoding="utf-8")
    if FORBIDDEN.search(sql):
        parser.error("migration contains a forbidden database escape or schema override")
    if re.search(r"\b(?:BEGIN|COMMIT|ROLLBACK)\b", sql, re.IGNORECASE):
        parser.error("migration SQL must not contain transaction control statements")

    digest = hashlib.sha256(args.migration.read_bytes()).hexdigest()
    conn = sqlite3.connect(args.database)
    conn.execute("PRAGMA foreign_keys=ON")
    try:
        conn.execute(
            "CREATE TABLE IF NOT EXISTS migration_log ("
            "migration_id TEXT PRIMARY KEY, task_id TEXT NOT NULL, reviewer TEXT NOT NULL, "
            "applied_at TEXT NOT NULL, sql_sha256 TEXT NOT NULL, schema_version TEXT NOT NULL)"
        )
        if conn.execute("SELECT 1 FROM migration_log WHERE migration_id=?", (migration_id,)).fetchone():
            raise SystemExit(f"migration already applied: {migration_id}")
        pre = validate_database(args.database, args.pre_schema or args.expected_schema)
        if pre["verdict"] != "pass":
            raise SystemExit("pre-migration validation failed; inspect validate_master output")
        if args.dry_run:
            print(f"dry-run: {migration_id} sha256={digest}")
            return 0

        now = datetime.now(timezone.utc).replace(microsecond=0).isoformat()
        escaped_sql = (
            "BEGIN;\n"
            + sql
            + "\nINSERT INTO migration_log "
            "(migration_id, task_id, reviewer, applied_at, sql_sha256, schema_version) VALUES ("
            + ", ".join(sql_literal(value) for value in (migration_id, args.task_id, args.reviewer, now, digest, args.expected_schema))
            + ");\nCOMMIT;"
        )
        conn.executescript(escaped_sql)
    except Exception:
        conn.rollback()
        raise
    finally:
        conn.close()

    post = validate_database(args.database, args.expected_schema)
    if post["verdict"] != "pass":
        print("migration applied but post-migration validation failed", file=sys.stderr)
        return 1
    print(f"applied {migration_id}; sha256={digest}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
