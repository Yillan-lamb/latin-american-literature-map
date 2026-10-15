"""Focused tests for legacy coverage preservation rows."""
import copy
import importlib.util
import json
import shutil
import sqlite3
import sys
import tempfile
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BUILDER_PATH = ROOT / "scripts" / "build_wcd10_migration.py"
sys.path.insert(0, str(BUILDER_PATH.parent))
SPEC = importlib.util.spec_from_file_location("build_wcd10_migration", BUILDER_PATH)
builder = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(builder)


class CoverageSnapshotTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.baseline = ROOT / "data" / "master" / "V1_MASTER.sqlite"
        cls.conn = sqlite3.connect(cls.baseline.resolve().as_uri() + "?mode=ro", uri=True)
        cls.conn.row_factory = sqlite3.Row
        cls.ref = "V1-ENT-0207"
        cls.snapshot = builder.legacy_object_snapshot_from_database(cls.conn, cls.ref)

    @classmethod
    def tearDownClass(cls):
        cls.conn.close()

    def make_primary(self, snapshot=None):
        snapshot = copy.deepcopy(snapshot if snapshot is not None else self.snapshot)
        sources_by_fact = {}
        for row in snapshot["fact_sources"]:
            sources_by_fact.setdefault(row["fact_id"], []).append(row)
        return {
            "object_ref": self.ref,
            "entity": snapshot["entity"],
            "research_status": "catalog_only",
            "research_refs": ["WCD-10-B08-S001"],
            "old_facts": [{"fact": row, "source_chain": sources_by_fact.get(row["fact_id"], [])}
                          for row in snapshot["facts"]],
            "cards": snapshot["cards"],
            "card_sources": snapshot["card_sources"],
            "relations": snapshot["relations"],
            "relationship_sources": snapshot["relationship_sources"],
            "relationship_evidence": snapshot["relationship_evidence"],
            "source_objects": snapshot["source_objects"],
            "candidate_facts": [{"candidate_id": "WCD-10-B08-F001"}],
        }

    def make_wrapper(self, snapshot=None):
        return {
            "object_ref": self.ref,
            "legacy_object_snapshot": copy.deepcopy(snapshot if snapshot is not None else self.snapshot),
            "research_status": "catalog_only",
            "research_refs": [],
            "fresh_review": "Historical baseline preservation only.",
        }

    def test_ordinary_single_rows_keep_coverage_behavior(self):
        primary = self.make_primary()
        new = {"object_ref": "WCD-10-B08-W001", "research_status": "researched",
               "research_refs": ["WCD-10-B08-S002"]}
        rows = [primary, new]
        result = builder.classify_coverage_objects(rows, {self.ref, new["object_ref"]},
                                                   {new["object_ref"]}, self.conn)
        self.assertEqual(result, rows)
        self.assertIs(result[0], primary)
        self.assertEqual(len(rows), 2)

    def test_valid_existing_wrapper_is_preserved_but_not_primary(self):
        primary = self.make_primary()
        wrapper = self.make_wrapper()
        rows = [wrapper, primary]
        result = builder.classify_coverage_objects(rows, {self.ref}, set(), self.conn)
        self.assertEqual(result, [primary])
        self.assertEqual(len(rows), 2)
        self.assertIs(rows[0], wrapper)

    def test_accepts_historical_b08_origin_id_from_baseline(self):
        with tempfile.TemporaryDirectory() as tempdir:
            cloned = Path(tempdir) / "baseline.sqlite"
            shutil.copy2(self.baseline, cloned)
            conn = sqlite3.connect(cloned)
            conn.row_factory = sqlite3.Row
            source_id = self.snapshot["source_objects"][0]["source_id"]
            conn.execute("UPDATE sources SET temporary_id=? WHERE source_id=?",
                         ("WCD10-B08-S-HISTORICAL", source_id))
            conn.commit()
            snapshot = builder.legacy_object_snapshot_from_database(conn, self.ref)
            rows = [self.make_primary(snapshot), self.make_wrapper(snapshot)]
            result = builder.classify_coverage_objects(rows, {self.ref}, set(), conn)
            self.assertEqual(result, [rows[0]])
            self.assertEqual(rows[1]["legacy_object_snapshot"]["source_objects"][0]["temporary_id"],
                             "WCD10-B08-S-HISTORICAL")
            conn.close()

    def test_snapshot_array_reordering_is_not_a_content_change(self):
        primary = self.make_primary()
        snapshot = copy.deepcopy(self.snapshot)
        for value in snapshot.values():
            if isinstance(value, list):
                value.reverse()
        wrapper = self.make_wrapper(snapshot)
        self.assertEqual(builder.classify_coverage_objects([primary, wrapper], {self.ref}, set(), self.conn),
                         [primary])

    def test_rejects_wrapper_for_new_candidate_ref(self):
        ref = "WCD-10-B08-W001"
        wrapper = self.make_wrapper()
        wrapper["object_ref"] = ref
        wrapper["legacy_object_snapshot"]["entity"]["entity_id"] = ref
        primary = self.make_primary()
        primary["object_ref"] = ref
        with self.assertRaisesRegex(ValueError, "new candidate ref"):
            builder.classify_coverage_objects([primary, wrapper], {ref}, {ref}, self.conn)

    def test_rejects_duplicate_main_and_duplicate_snapshot(self):
        primary = self.make_primary()
        with self.assertRaisesRegex(ValueError, "exactly one main row"):
            builder.classify_coverage_objects([primary, copy.deepcopy(primary)], {self.ref}, set(), self.conn)
        with self.assertRaisesRegex(ValueError, "duplicate legacy_object_snapshot"):
            builder.classify_coverage_objects([primary, self.make_wrapper(), self.make_wrapper()],
                                              {self.ref}, set(), self.conn)

    def test_rejects_wrapper_research_refs_and_hidden_research_fields(self):
        wrapper = self.make_wrapper()
        wrapper["research_refs"] = ["WCD-10-B08-S099"]
        with self.assertRaisesRegex(ValueError, "research_refs must be empty"):
            builder.classify_coverage_objects([self.make_primary(), wrapper], {self.ref}, set(), self.conn)
        for forbidden in ("research_refs", "candidate_facts"):
            wrapper = self.make_wrapper()
            wrapper["legacy_object_snapshot"][forbidden] = []
            with self.assertRaisesRegex(ValueError, "exact legacy closure fields"):
                builder.classify_coverage_objects([self.make_primary(), wrapper], {self.ref}, set(), self.conn)

    def test_rejects_snapshot_mutation_even_when_main_row_is_mutated_too(self):
        primary = self.make_primary()
        wrapper = self.make_wrapper()
        wrapper["legacy_object_snapshot"]["facts"][0]["value_text"] += " altered"
        primary["old_facts"][0]["fact"]["value_text"] += " altered"
        with self.assertRaisesRegex(ValueError, "differs from read-only baseline database"):
            builder.classify_coverage_objects([primary, wrapper], {self.ref}, set(), self.conn)

    def test_rejects_missing_or_extra_roster_refs(self):
        with self.assertRaisesRegex(ValueError, "unique candidate roster"):
            builder.classify_coverage_objects([self.make_primary()], {self.ref, "WCD-10-B08-W999"}, set(), self.conn)


if __name__ == "__main__":
    unittest.main()
