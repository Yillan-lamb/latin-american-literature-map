import json
import sqlite3
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DB = ROOT / "data/master/V1_MASTER.sqlite"
WEB = ROOT / "data/v2/web/site_data.json"


class SolAuditB16B17RegressionTests(unittest.TestCase):
    def setUp(self):
        self.connection = sqlite3.connect(DB)
        self.connection.row_factory = sqlite3.Row

    def tearDown(self):
        self.connection.close()

    def test_resolved_years_and_source_mappings(self):
        birth = self.connection.execute(
            "SELECT value_text, confidence, origin_id FROM facts WHERE fact_id='V1-FCT-0962'"
        ).fetchone()
        self.assertEqual(dict(birth), {"value_text": "1918", "confidence": "high", "origin_id": "SRC-0277"})

        gaps = self.connection.execute(
            "SELECT gap_id, current_status, issue_code FROM gaps WHERE gap_id IN ('V1-GAP-0023','V1-GAP-0024') ORDER BY gap_id"
        ).fetchall()
        self.assertEqual([(row["gap_id"], row["current_status"], row["issue_code"]) for row in gaps], [
            ("V1-GAP-0023", "verified", "NONE"),
            ("V1-GAP-0024", "verified", "NONE"),
        ])

        icaza = self.connection.execute(
            "SELECT origin_id FROM facts WHERE fact_id BETWEEN 'V1-FCT-0981' AND 'V1-FCT-0989'"
        ).fetchall()
        self.assertEqual(len(icaza), 9)
        self.assertTrue(all(row["origin_id"] == "SRC-0274" for row in icaza))

    def test_display_names_and_web_projection(self):
        expected = {
            "V1-ENT-0344": "路易斯·塞普尔维达",
            "V1-ENT-0347": "《读爱情故事的老人》",
            "V1-ENT-0348": "《教海鸥飞翔的猫》",
            "V1-ENT-0349": "《世界尽头的世界》",
        }
        rows = self.connection.execute(
            "SELECT entity_id, name_zh FROM entities WHERE entity_id BETWEEN 'V1-ENT-0344' AND 'V1-ENT-0349'"
        ).fetchall()
        actual = {row["entity_id"]: row["name_zh"] for row in rows if row["entity_id"] in expected}
        self.assertEqual(actual, expected)

        payload = json.loads(WEB.read_text(encoding="utf-8"))
        projected = {row["entity_id"]: row["name_zh"] for row in payload["research"]["entities"] if row["entity_id"] in expected}
        self.assertEqual(projected, expected)

        lygia = next(row for row in payload["research"]["entities"] if row["entity_id"] == "V1-ENT-0358")
        birth = next(row for row in lygia["facts"] if row["fact_field"] == "birth_year")
        self.assertEqual((birth["value_text"], birth["origin_id"]), ("1918", "SRC-0277"))

    def test_b01_card_projection_cleanup(self):
        rows = self.connection.execute(
            "SELECT card_id, country_or_region, period_bucket, genre_or_form FROM content_cards WHERE card_id IN ('V1-CARD-0044','V1-CARD-0048','V1-CARD-0063') ORDER BY card_id"
        ).fetchall()
        self.assertEqual([dict(row) for row in rows], [
            {"card_id": "V1-CARD-0044", "country_or_region": "智利", "period_bucket": "1889–1957", "genre_or_form": ""},
            {"card_id": "V1-CARD-0048", "country_or_region": "墨西哥", "period_bucket": "1914–1998", "genre_or_form": ""},
            {"card_id": "V1-CARD-0063", "country_or_region": "", "period_bucket": "1962", "genre_or_form": "中篇小说 / novela corta"},
        ])


if __name__ == "__main__":
    unittest.main()
