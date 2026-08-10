#!/usr/bin/env python3
"""Validate an external-AI delivery package without modifying it."""

from __future__ import annotations

import argparse
import csv
import json
from pathlib import Path


FULL_REQUIRED = {
    "README.md",
    "STATUS.md",
    "QA_REPORT.md",
    "ISSUES.md",
    "HANDOFF.md",
    "MANIFEST.md",
}
LITE_REQUIRED = {"README.md", "HANDOFF.md"}
FORBIDDEN_SUFFIXES = {".pdf", ".epub", ".mobi", ".azw", ".azw3"}
FORBIDDEN_NAMES = {".DS_Store", ".env", "cookies.txt", "cookie.txt"}
UNIQUE_ID_COLUMNS = {
    "candidate_id",
    "locator_id",
    "temporary_file_id",
    "entity_id",
    "relation_id",
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="检查外部 AI 交付包的结构、CSV 和公开边界。"
    )
    parser.add_argument("delivery", type=Path, help="交付目录")
    parser.add_argument(
        "--profile",
        choices=("LITE", "FULL"),
        required=True,
        help="任务卡声明的 package_profile",
    )
    return parser.parse_args()


def validate_csv(path: Path) -> dict:
    result = {
        "file": path.name,
        "rows": 0,
        "columns": 0,
        "errors": [],
        "warnings": [],
    }
    try:
        with path.open("r", encoding="utf-8-sig", newline="") as handle:
            rows = list(csv.reader(handle))
    except (OSError, UnicodeError, csv.Error) as exc:
        result["errors"].append(f"CSV 无法解析: {exc}")
        return result

    if not rows:
        result["errors"].append("CSV 为空")
        return result

    header = rows[0]
    result["columns"] = len(header)
    result["rows"] = len(rows) - 1
    if not header or any(not cell.strip() for cell in header):
        result["errors"].append("表头包含空列名")
    if len(set(header)) != len(header):
        result["errors"].append("表头包含重复列名")

    for number, row in enumerate(rows[1:], start=2):
        if len(row) != len(header):
            result["errors"].append(
                f"第 {number} 行列数 {len(row)}，应为 {len(header)}"
            )

    for column in UNIQUE_ID_COLUMNS.intersection(header):
        index = header.index(column)
        values = [row[index].strip() for row in rows[1:] if len(row) > index]
        nonempty = [value for value in values if value]
        if len(nonempty) != len(set(nonempty)):
            result["errors"].append(f"{column} 存在重复值")

    source_columns = {"source_id", "source_ref"}.intersection(header)
    if source_columns and not {
        "source_title",
        "title",
        "page_title",
        "paper_title",
    }.intersection(header):
        result["warnings"].append(
            "存在来源 ID，但本表没有来源题名列；请确认可通过关联表解析题名"
        )
    return result


def main() -> int:
    args = parse_args()
    root = args.delivery.resolve()
    report = {
        "delivery": str(root),
        "profile": args.profile,
        "errors": [],
        "warnings": [],
        "files": [],
        "csv": [],
    }

    if not root.is_dir():
        report["errors"].append("交付目录不存在或不是目录")
        print(json.dumps(report, ensure_ascii=False, indent=2))
        return 1

    files = sorted(path for path in root.rglob("*") if path.is_file())
    report["files"] = [str(path.relative_to(root)) for path in files]
    top_level_names = {path.name for path in root.iterdir() if path.is_file()}
    required = FULL_REQUIRED if args.profile == "FULL" else LITE_REQUIRED
    missing = sorted(required - top_level_names)
    if missing:
        report["errors"].append(f"缺少必需文件: {', '.join(missing)}")

    if args.profile == "LITE" and len(files) < 3:
        report["errors"].append("LITE 包除 README/HANDOFF 外至少需要一个主体成果")

    for path in files:
        relative = path.relative_to(root)
        lowered = path.name.lower()
        if path.suffix.lower() in FORBIDDEN_SUFFIXES or path.name in FORBIDDEN_NAMES:
            report["errors"].append(f"发现禁止文件: {relative}")
        if lowered.endswith((".pem", ".key")) or "cookie" in lowered:
            report["errors"].append(f"发现疑似凭据文件: {relative}")
        if any(part.lower() == "inputs" for part in relative.parts):
            report["errors"].append(f"交付包不应包含 inputs/: {relative}")
        if path.suffix.lower() == ".csv":
            report["csv"].append(validate_csv(path))

    for csv_result in report["csv"]:
        report["errors"].extend(
            f"{csv_result['file']}: {message}" for message in csv_result["errors"]
        )
        report["warnings"].extend(
            f"{csv_result['file']}: {message}" for message in csv_result["warnings"]
        )

    report["result"] = "pass" if not report["errors"] else "revise"
    print(json.dumps(report, ensure_ascii=False, indent=2))
    return 0 if report["result"] == "pass" else 1


if __name__ == "__main__":
    raise SystemExit(main())
