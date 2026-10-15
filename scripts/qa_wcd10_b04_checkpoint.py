#!/usr/bin/env python3
"""B04 checkpoint: explicit immutable baseline, reviewed SQL and mapping."""
from __future__ import annotations

import argparse
import json
from pathlib import Path

from qa_wcd10_checkpoint import digest, verify

BASELINE_SHA256 = "079deee47063d2435bdaafe1b3c1dca24ca8b6c7353acc1427075bf0ce86746d"
SQL_SHA256 = "4d8428f7cea7ebb731867c903facf5d27a0e821951ed5c44e5ea243b87c6a356"
MAPPING_SHA256 = "d454f71ac1dae66e20a68b2629d0d302ba9dcb3eaee7ba462dfe6ae1c69a0e3a"
MIGRATION_NAME = "0039_wcd10_b04_author_works.sql"


def verify_b04(repo, exports, before_public, after_public, baseline):
    mapping_path = repo / "data/changesets/WCD-10/B04/INTEGRATION_MAP.json"
    if digest(baseline) != BASELINE_SHA256 or digest(mapping_path) != MAPPING_SHA256:
        raise ValueError("B04 baseline or reviewed mapping binding mismatch")
    mapping = json.loads(mapping_path.read_text(encoding="utf-8"))
    if mapping["task_id"] != "TASK-109" or mapping["batch_id"] != "WCD-10-B04":
        raise ValueError("B04 task/batch mismatch")
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
    result = verify_b04(args.repo, args.exports, args.before_public, args.after_public, args.baseline_database)
    content = json.dumps(result, ensure_ascii=False, indent=2) + "\n"
    if args.report:
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(content, encoding="utf-8")
    print(content)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
