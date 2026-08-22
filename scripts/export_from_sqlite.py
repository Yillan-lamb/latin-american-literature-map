#!/usr/bin/env python3
"""Export a master SQLite database to deterministic CSV, JSON and XLSX files."""

from __future__ import annotations

import argparse
import csv
import hashlib
import json
import os
import re
import sqlite3
import tempfile
import zipfile
from datetime import datetime
from pathlib import Path


def qident(value: str) -> str:
    return '"' + value.replace('"', '""') + '"'


def table_names(conn: sqlite3.Connection) -> list[str]:
    return [
        row[0]
        for row in conn.execute(
            "SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%' ORDER BY name"
        )
    ]


def table_rows(conn: sqlite3.Connection, table: str) -> tuple[list[str], list[dict[str, object]]]:
    info = conn.execute(f"PRAGMA table_info({qident(table)})").fetchall()
    fields = [row[1] for row in info]
    primary = [row[1] for row in sorted(info, key=lambda row: row[5]) if row[5]]
    order = primary or fields
    order_sql = ", ".join(qident(field) for field in order)
    records = conn.execute(f"SELECT * FROM {qident(table)} ORDER BY {order_sql}").fetchall()
    return fields, [{field: record[index] for index, field in enumerate(fields)} for record in records]


def write_xlsx(path: Path, tables: dict[str, tuple[list[str], list[dict[str, object]]]]) -> None:
    try:
        from openpyxl import Workbook
    except ImportError as exc:
        raise SystemExit("XLSX export requires the bundled openpyxl runtime") from exc
    workbook = Workbook()
    workbook.remove(workbook.active)
    fixed_time = datetime(2000, 1, 1)
    workbook.properties.created = fixed_time
    workbook.properties.modified = fixed_time
    for table, (fields, records) in tables.items():
        sheet = workbook.create_sheet(table[:31])
        sheet.append(fields)
        for record in records:
            sheet.append([record[field] for field in fields])
        sheet.freeze_panes = "A2"
        sheet.auto_filter.ref = sheet.dimensions
    workbook.save(path)
    # XLSX is a ZIP archive. Normalize entry timestamps so a rebuild from the
    # same SQLite bytes is byte-identical across separate invocations.
    with zipfile.ZipFile(path, "r") as source:
        entries = [(info, source.read(info.filename)) for info in source.infolist()]
    with tempfile.NamedTemporaryFile(dir=path.parent, suffix=".xlsx", delete=False) as handle:
        temporary = Path(handle.name)
    try:
        with zipfile.ZipFile(temporary, "w", compression=zipfile.ZIP_DEFLATED, compresslevel=6) as target:
            for info, payload in entries:
                if info.filename == "docProps/core.xml":
                    payload = re.sub(
                        rb"(<dcterms:modified\b[^>]*>)[^<]*(</dcterms:modified>)",
                        rb"\g<1>2000-01-01T00:00:00Z\g<2>",
                        payload,
                    )
                normalized = zipfile.ZipInfo(info.filename, date_time=(1980, 1, 1, 0, 0, 0))
                normalized.compress_type = zipfile.ZIP_DEFLATED
                normalized.external_attr = info.external_attr
                normalized.create_system = info.create_system
                normalized.comment = info.comment
                target.writestr(normalized, payload, compress_type=zipfile.ZIP_DEFLATED, compresslevel=6)
        os.replace(temporary, path)
    finally:
        if temporary.exists():
            temporary.unlink()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("database", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--version", default="unversioned")
    parser.add_argument(
        "--release-status",
        choices=("development_candidate", "released"),
        default="released",
        help="Mark the export as a development candidate or a formal release.",
    )
    parser.add_argument("--without-xlsx", action="store_true")
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()
    if not args.database.is_file():
        parser.error(f"database not found: {args.database}")
    if args.output.exists() and any(args.output.iterdir()) and not args.force:
        parser.error(f"output directory is not empty: {args.output}; use --force only for a deliberate rebuild")
    args.output.mkdir(parents=True, exist_ok=True)

    conn = sqlite3.connect(args.database)
    conn.row_factory = sqlite3.Row
    try:
        tables = {table: table_rows(conn, table) for table in table_names(conn)}
        metadata = {}
        if "metadata" in tables:
            metadata = {row["key"]: row["value"] for row in conn.execute("SELECT key, value FROM metadata")}
    finally:
        conn.close()

    for table, (fields, records) in tables.items():
        with (args.output / f"{table}.csv").open("w", encoding="utf-8", newline="") as handle:
            writer = csv.DictWriter(handle, fieldnames=fields, lineterminator="\n")
            writer.writeheader()
            writer.writerows(records)

    database_sha256 = hashlib.sha256(args.database.read_bytes()).hexdigest()
    payload = {
        "metadata": {
            "schema_version": metadata.get("schema_version"),
            "source_database_sha256": database_sha256,
            "export_version": args.version,
            "release_status": args.release_status,
            "generation_policy": "deterministic_from_sqlite",
        },
        "columns": {table: fields for table, (fields, _) in tables.items()},
        "tables": {table: records for table, (_, records) in tables.items()},
    }
    (args.output / "data.json").write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")

    if not args.without_xlsx:
        write_xlsx(args.output / f"V1_{args.version}_EXPORT.xlsx", tables)

    manifest = args.output / "MANIFEST.md"
    for _ in range(10):
        files = sorted(path for path in args.output.iterdir() if path.is_file() and path.name != "MANIFEST.md")
        lines = [
            f"# Export manifest ({args.version})",
            "",
            f"- Release status: `{'DEVELOPMENT / CANDIDATE' if args.release_status == 'development_candidate' else 'RELEASED'}`",
            "- Generation policy: `deterministic_from_sqlite`",
            f"- Source database SHA-256: `{database_sha256}`",
            "",
            "| # | 文件名 | 字节数 | SHA-256 |",
            "|---:|---|---:|---|",
        ]
        for index, path in enumerate(files, start=1):
            lines.append(f"| {index} | {path.name} | {path.stat().st_size} | {hashlib.sha256(path.read_bytes()).hexdigest()} |")
        if manifest.exists():
            lines.append(f"| {len(files) + 1} | MANIFEST.md | {manifest.stat().st_size} | SELF |")
        else:
            lines.append(f"| {len(files) + 1} | MANIFEST.md | 0 | SELF |")
        content = "\n".join(lines) + "\n"
        before = manifest.read_text(encoding="utf-8") if manifest.exists() else None
        manifest.write_text(content, encoding="utf-8")
        if before == content:
            break
    return 0


if __name__ == "__main__":
    main()
