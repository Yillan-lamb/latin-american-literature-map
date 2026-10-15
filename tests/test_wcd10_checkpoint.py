from __future__ import annotations

import copy
import json
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from qa_wcd10_checkpoint import verify, verify_reviewed_delta


class WCD10CheckpointTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.mapping = json.loads((ROOT / "data/changesets/WCD-10/B01/INTEGRATION_MAP.json").read_text(encoding="utf-8"))
        # Audit the immutable B01 snapshot even after subsequent batches land.
        snapshot = json.loads((ROOT / "data/exports/wcd10-b01-checkpoint/data.json").read_text(encoding="utf-8"))
        cls.tables = {table: (snapshot["columns"][table], rows) for table, rows in snapshot["tables"].items()}

    def test_frozen_b01_checkpoint_exact_replay(self):
        verify_reviewed_delta(ROOT, self.tables, self.mapping)

    def test_same_count_wrong_fact_rejected(self):
        tables = copy.deepcopy(self.tables)
        row = tables["facts"][1][-1]
        self.assertIn("value_text", row)
        row["value_text"] = "wrong same-count value"
        with self.assertRaisesRegex(ValueError, "exact replay mismatch: facts"):
            verify_reviewed_delta(ROOT, tables, self.mapping)

    def test_unapproved_metadata_change_rejected(self):
        tables = copy.deepcopy(self.tables)
        next(row for row in tables["metadata"][1] if row["key"] == "research_version")["value"] = "999"
        with self.assertRaisesRegex(ValueError, "exact replay mismatch: metadata"):
            verify_reviewed_delta(ROOT, tables, self.mapping)

    def test_migration_log_hash_change_rejected(self):
        tables = copy.deepcopy(self.tables)
        tables["migration_log"][1][-1]["sql_sha256"] = "0" * 64
        with self.assertRaisesRegex(ValueError, "does not bind"):
            verify_reviewed_delta(ROOT, tables, self.mapping)

    def test_same_public_directory_rejected_before_any_read(self):
        with self.assertRaisesRegex(ValueError, "must be distinct"):
            verify(ROOT, ROOT, ROOT, ROOT, ROOT)
