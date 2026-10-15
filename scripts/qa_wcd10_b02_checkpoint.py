#!/usr/bin/env python3
"""B02-specific bindings; never uses B01 CLI defaults for a later checkpoint."""
from __future__ import annotations

import argparse
import json
from pathlib import Path

from qa_wcd10_checkpoint import digest, verify

BASELINE_SHA256 = "98b914d5421d40b2f20488fe988e52fb165fc02967ec1e7e816f9280ce5071d1"
SQL_SHA256 = "ffcedb4d7fbd15eebce42456bd24b908e7ce91f52b6a97fbb67ea01ae70172dc"
MAPPING_SHA256 = "f2e0562660d9a0843c9eae3e9863879ecb289cebe615421c3679c642d22c8c09"
MIGRATION_NAME = "0037_wcd10_b02_author_works.sql"


def verify_b02(repo, exports, before_public, after_public, baseline):
    mapping_path = repo / "data/changesets/WCD-10/B02/INTEGRATION_MAP.json"
    if digest(baseline) != BASELINE_SHA256 or digest(mapping_path) != MAPPING_SHA256:
        raise ValueError("B02 baseline or reviewed mapping binding mismatch")
    mapping = json.loads(mapping_path.read_text(encoding="utf-8"))
    if mapping["task_id"] != "TASK-107" or mapping["batch_id"] != "WCD-10-B02":
        raise ValueError("B02 task/batch mismatch")
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
    result = verify_b02(args.repo, args.exports, args.before_public, args.after_public, args.baseline_database)
    content = json.dumps(result, ensure_ascii=False, indent=2) + "\n"
    if args.report:
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(content, encoding="utf-8")
    print(content)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
