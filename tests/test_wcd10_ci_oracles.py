import shutil
import sqlite3
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from qa_wcd10_type_correction import BASELINE_EXPORT, verify_delta_from_export


class Wcd10CiOracleTests(unittest.TestCase):
    def test_tracked_0057_export_verifies_exact_current_0058_delta(self):
        result = verify_delta_from_export(ROOT / "data/master/V1_MASTER.sqlite")
        self.assertEqual(result["tables_compared"], 19)
        self.assertEqual(result["exact_changes"], {
            "entities": 15, "content_cards": 15, "metadata": 1, "migration_log": 1})

    def test_same_count_changes_outside_approved_fields_fail(self):
        for table, field, key, value in (
            ("facts", "value_text", "fact_id", "V1-FCT-2691"),
            ("entities", "name_zh", "entity_id", "V1-ENT-0460"),
            ("content_cards", "country_or_region", "card_id", "V1-CARD-0384"),
            ("sources", "title", "source_id", "SRC-0797"),
        ):
            with self.subTest(table=table), tempfile.TemporaryDirectory() as temporary:
                database = Path(temporary) / "changed.sqlite"
                shutil.copy2(ROOT / "data/master/V1_MASTER.sqlite", database)
                with sqlite3.connect(database) as conn:
                    conn.execute(f'UPDATE "{table}" SET "{field}"=? WHERE "{key}"=?', ("unauthorized change", value))
                with self.assertRaisesRegex(ValueError, "unapproved row/field difference"):
                    verify_delta_from_export(database)

    def test_changed_baseline_export_is_rejected(self):
        with tempfile.TemporaryDirectory() as temporary:
            changed = Path(temporary) / "data.json"
            changed.write_bytes(BASELINE_EXPORT.read_bytes() + b" ")
            with self.assertRaisesRegex(ValueError, "baseline export hash drift"):
                verify_delta_from_export(ROOT / "data/master/V1_MASTER.sqlite", changed)
