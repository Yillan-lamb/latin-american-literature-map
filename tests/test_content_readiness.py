from __future__ import annotations

import importlib.util
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location(
    "validate_v2_content_quality",
    ROOT / "scripts" / "validate_v2_content_quality.py",
)
MODULE = importlib.util.module_from_spec(SPEC)
assert SPEC.loader is not None
SPEC.loader.exec_module(MODULE)


def wrapped(content, status="user_review"):
    return {
        "content": content,
        "status": status,
        "research_refs": ["V1-FCT-TEST"],
        "source_refs": ["SRC-TEST"],
        "reviewer": "CODEX-REVIEW" if status != "user_review" else "UNREVIEWED",
    }


class ContentReadinessTests(unittest.TestCase):
    def test_research_basic_does_not_require_full_curation(self) -> None:
        record = {"target_id": "V1-ENT-TEST", "reader_lede": wrapped("基础事实")}
        self.assertEqual(MODULE.derive_readiness("authors", record), "research_basic")

    def test_low_value_advice_must_be_held(self) -> None:
        record = {"target_id": "V1-ENT-TEST"}
        for field in MODULE.REQUIRED_FIELDS["works"]:
            record[field] = wrapped("足够长的占位内容用于结构测试")
        record["reading_approach"] = wrapped("先确认原文题名与年份，再进入作品。")
        with self.assertRaisesRegex(ValueError, "low-value template was not held"):
            MODULE.derive_readiness("works", record)
        record["reading_approach"]["status"] = "hold"
        self.assertEqual(MODULE.derive_readiness("works", record), "research_basic")


if __name__ == "__main__":
    unittest.main()
