#!/usr/bin/env python3
"""Validate a project master SQLite database without V1 snapshot counts.

This validator checks structural and semantic invariants that remain valid as
the database grows. Fixed V1 counts belong in validate_v1_candidate.py, not
here.
"""

from __future__ import annotations

import argparse
import json
import re
import sqlite3
import sys
from pathlib import Path


ALLOWED_RELATIONS = {
    "CREATED",
    "CONTAINS_WORK",
    "EDITION_OF",
    "TRANSLATION_OF",
    "ADAPTED_FROM",
    "DIRECTED",
    "SET_IN",
    "ASSOCIATED_WITH_PLACE",
    "ASSOCIATED_WITH_MOVEMENT",
    "EXPLORES_THEME",
    "RESPONDS_TO_WORK",
    "INFLUENCED_BY",
    "BASED_ON_EVENT",
}

REQUIRED_TABLES = {
    "metadata",
    "sources",
    "source_holds",
    "entities",
    "entity_id_map",
    "relationships",
    "relationship_evidence",
    "relationship_sources",
    "relation_holds",
    "relation_hold_evidence",
    "facts",
    "fact_sources",
    "content_cards",
    "card_facts",
    "card_sources",
    "gaps",
    "n3_decisions",
    "legacy_relation_groups",
}


def qident(value: str) -> str:
    return '"' + value.replace('"', '""') + '"'


def rows(conn: sqlite3.Connection, table: str) -> list[sqlite3.Row]:
    return conn.execute(f"SELECT * FROM {qident(table)}").fetchall()


def primary_columns(conn: sqlite3.Connection, table: str) -> list[str]:
    info = conn.execute(f"PRAGMA table_info({qident(table)})").fetchall()
    return [row[1] for row in sorted(info, key=lambda row: row[5]) if row[5]]


def validate_database(path: Path, expected_schema: str = "0.3") -> dict:
    errors: list[str] = []
    warnings: list[str] = []
    conn = sqlite3.connect(path)
    conn.row_factory = sqlite3.Row
    conn.execute("PRAGMA foreign_keys=ON")

    try:
        table_names = {
            row[0]
            for row in conn.execute(
                "SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%'"
            )
        }
        missing = sorted(REQUIRED_TABLES - table_names)
        if missing:
            errors.append("missing tables: " + ", ".join(missing))

        metadata = {}
        if "metadata" in table_names:
            metadata = dict(conn.execute("SELECT key, value FROM metadata"))
            if expected_schema and metadata.get("schema_version") != expected_schema:
                errors.append(
                    f"schema_version={metadata.get('schema_version')!r}, expected {expected_schema!r}"
                )

        counts: dict[str, int] = {}
        for table in sorted(table_names):
            table_rows = rows(conn, table)
            counts[table] = len(table_rows)
            pks = primary_columns(conn, table)
            if pks:
                seen: set[tuple] = set()
                for row in table_rows:
                    key = tuple(row[column] for column in pks)
                    if key in seen:
                        errors.append(f"duplicate primary key in {table}: {key}")
                    seen.add(key)

        integrity = conn.execute("PRAGMA integrity_check").fetchone()[0]
        if integrity != "ok":
            errors.append(f"integrity_check={integrity}")
        foreign_errors = conn.execute("PRAGMA foreign_key_check").fetchall()
        if foreign_errors:
            errors.append(f"foreign_key_check returned {len(foreign_errors)} row(s)")

        if {"entities", "sources", "relationships"} <= table_names:
            entities = {row["entity_id"]: row["entity_type"] for row in rows(conn, "entities")}
            source_titles = {row["source_id"]: row["title"] for row in rows(conn, "sources")}
            for row in rows(conn, "relationships"):
                relation = row["relation_type"]
                if relation not in ALLOWED_RELATIONS:
                    errors.append(f"illegal relation_type {relation!r} on {row['relationship_id']}")
                subject_type = entities.get(row["subject_id"])
                object_type = entities.get(row["object_id"])
                if subject_type is None or object_type is None:
                    errors.append(f"broken relationship endpoint {row['relationship_id']}")
                if relation == "BASED_ON_EVENT" and (subject_type != "work" or object_type != "event"):
                    errors.append(
                        f"BASED_ON_EVENT endpoint mismatch on {row['relationship_id']}: "
                        f"{subject_type}->{object_type}"
                    )

            for table in ("relationship_evidence", "relation_hold_evidence", "fact_sources", "card_sources"):
                if table not in table_names:
                    continue
                for row in rows(conn, table):
                    source_id = row["source_id"]
                    if source_id not in source_titles:
                        errors.append(f"orphan source {source_id!r} in {table}")
                    elif "source_title" in row.keys() and row["source_title"] != source_titles[source_id]:
                        errors.append(f"source_title mismatch for {source_id} in {table}")

        if {"relationships", "relationship_evidence"} <= table_names:
            evidence_counts = {
                row[0]: row[1]
                for row in conn.execute(
                    "SELECT relationship_id, COUNT(*) FROM relationship_evidence GROUP BY relationship_id"
                )
            }
            for row in rows(conn, "relationships"):
                if int(row["evidence_count"] or 0) != evidence_counts.get(row["relationship_id"], 0):
                    errors.append(f"relationship evidence_count mismatch on {row['relationship_id']}")

        if {"relation_holds", "relation_hold_evidence"} <= table_names:
            evidence_counts = {
                row[0]: row[1]
                for row in conn.execute(
                    "SELECT relation_hold_id, COUNT(*) FROM relation_hold_evidence GROUP BY relation_hold_id"
                )
            }
            for row in rows(conn, "relation_holds"):
                if int(row["evidence_count"] or 0) != evidence_counts.get(row["relation_hold_id"], 0):
                    errors.append(f"hold evidence_count mismatch on {row['relation_hold_id']}")

        patterns = {
            "sources": ("source_id", re.compile(r"^SRC-\d{4}$")),
            "entities": ("entity_id", re.compile(r"^V1-ENT-\d{4}$")),
            "relationships": ("relationship_id", re.compile(r"^V1-REL-\d{4}$")),
            "facts": ("fact_id", re.compile(r"^V1-FCT-\d{4}$")),
            "content_cards": ("card_id", re.compile(r"^V1-CARD-\d{4}$")),
        }
        for table, (column, pattern) in patterns.items():
            if table in table_names:
                for row in rows(conn, table):
                    if not pattern.fullmatch(row[column] or ""):
                        errors.append(f"invalid {column} {row[column]!r} in {table}")

        report = {
            "verdict": "pass" if not errors else "fail",
            "errors": errors,
            "warnings": warnings,
            "database": str(path),
            "schema_version": metadata.get("schema_version"),
            "tables": counts,
            "integrity_check": integrity,
            "foreign_key_errors": len(foreign_errors),
        }
        return report
    finally:
        conn.close()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("database", type=Path)
    parser.add_argument("--expected-schema", default="0.3")
    args = parser.parse_args()
    if not args.database.is_file():
        print(json.dumps({"verdict": "fail", "errors": [f"database not found: {args.database}"]}, ensure_ascii=False, indent=2))
        return 1
    report = validate_database(args.database, args.expected_schema)
    print(json.dumps(report, ensure_ascii=False, indent=2))
    return 0 if report["verdict"] == "pass" else 1


if __name__ == "__main__":
    sys.exit(main())
