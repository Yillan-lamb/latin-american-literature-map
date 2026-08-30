import csv
import json
import sqlite3
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


class WCD03NameGovernanceTests(unittest.TestCase):
    def test_la_vida_breve_retains_current_edition_title(self):
        with sqlite3.connect(ROOT / "data/master/V1_MASTER.sqlite") as conn:
            name = conn.execute(
                "SELECT name_zh FROM entities WHERE entity_id='V1-ENT-0187'"
            ).fetchone()[0]
        self.assertEqual(name, "《短暂的生命》")

        builder = (ROOT / "scripts/build_v2_public_content.py").read_text(encoding="utf-8")
        self.assertNotIn('"《短暂的生命》": "《短暂的一生》"', builder)

        migration = (ROOT / "data/master/migrations/0030_wcd03_chinese_display_names.sql").read_text(encoding="utf-8")
        self.assertNotIn("'《短暂的生命》','《短暂的一生》'", migration)

    def test_multi_edition_decision_and_formal_sources(self):
        with (ROOT / "project/audits/web/WCD_03_CHINESE_NAME_REVIEW_MATRIX.csv").open(
            encoding="utf-8", newline=""
        ) as handle:
            rows = {row["entity_id"]: row for row in csv.DictReader(handle)}
        self.assertEqual(rows["V1-ENT-0187"]["audit_decision"], "ALIAS")
        self.assertEqual(sum(row["audit_decision"] == "REPLACE" for row in rows.values()), 11)

        with (ROOT / "data/changesets/WCD-03/SOURCE_CANDIDATES.csv").open(
            encoding="utf-8", newline=""
        ) as handle:
            sources = {row["temporary_id"]: row for row in csv.DictReader(handle)}
        self.assertEqual(sources["WCD03-SRC-02"]["usage_status"], "discovery_only")
        self.assertEqual(sources["WCD03-SRC-04"]["source_level"], "B")
        self.assertEqual(sources["WCD03-SRC-05"]["source_level"], "B")

    def test_public_projection_uses_retained_title(self):
        site = json.loads((ROOT / "data/v2/web/site_data.json").read_text(encoding="utf-8"))
        entity = next(
            item for item in site["research"]["entities"] if item["entity_id"] == "V1-ENT-0187"
        )
        self.assertEqual(entity["name_zh"], "《短暂的生命》")
        search = next(item for item in site["search_index"] if item["target_id"] == "V1-ENT-0187")
        self.assertIn("《短暂的生命》", search["search_text"])


if __name__ == "__main__":
    unittest.main()
