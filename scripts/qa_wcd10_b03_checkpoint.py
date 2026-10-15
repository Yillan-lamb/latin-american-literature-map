#!/usr/bin/env python3
"""B03 checkpoint: explicit immutable baseline, reviewed SQL and mapping."""
from __future__ import annotations

import argparse
import json
from pathlib import Path

from qa_wcd10_checkpoint import digest, verify

BASELINE_SHA256 = "83435075f1da42f07bf03b98dd934f182fdcb75f969cf87e48e46359290cd498"
SQL_SHA256 = "50d1fc78562a7915312b8213c9b974ad4f5d1b8d5e60f6ea745280aafd92a241"
MAPPING_SHA256 = "01a156ada6c7ed6ec919681f262d504ac7404d31ff5bb9af1ee7da611d50b9f5"
MIGRATION_NAME = "0038_wcd10_b03_author_works.sql"


def verify_b03(repo, exports, before_public, after_public, baseline):
    mapping_path = repo / "data/changesets/WCD-10/B03/INTEGRATION_MAP.json"
    if digest(baseline) != BASELINE_SHA256 or digest(mapping_path) != MAPPING_SHA256:
        raise ValueError("B03 baseline or reviewed mapping binding mismatch")
    mapping = json.loads(mapping_path.read_text(encoding="utf-8"))
    if mapping["task_id"] != "TASK-108" or mapping["batch_id"] != "WCD-10-B03":
        raise ValueError("B03 task/batch mismatch")
    return verify(repo, exports, before_public, after_public, mapping_path, baseline_path=baseline,
                  migration_name=MIGRATION_NAME, reviewed_sha256=SQL_SHA256)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument("--exports", type=Path, required=True)
    parser.add_argument("--before-public", type=Path, required=True)
    parser.add_argument("--after-public", type=Path, required=True)
    parser.add_argument("--baseline-database", type=Path, required=True)
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()
    result = verify_b03(args.repo, args.exports, args.before_public, args.after_public, args.baseline_database)
    content = json.dumps(result, ensure_ascii=False, indent=2) + "\n"
    if args.report:
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(content, encoding="utf-8")
    print(content)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
