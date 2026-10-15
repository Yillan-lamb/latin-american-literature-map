from __future__ import annotations

import hashlib
import json
import shutil
import sqlite3
import sys
import tempfile
import unittest
from contextlib import closing
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
sys.path.insert(0, str(ROOT / "tests"))
from wcd10_test_baselines import rebuild_b05_baseline
from build_wcd10_migration import prepare
from validate_wcd10_candidates import (
    APPEND_ONLY_ENTRY_DECISION,
    APPEND_ONLY_REVIEW_DECISION,
    APPEND_ONLY_REVIEW_SCHEMA,
    canonical_candidate_sha256,
)


class WCD10PrepareConflictReviewTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        baseline_temp = tempfile.TemporaryDirectory(prefix="wcd10-rebuilt-b05-baseline-")
        cls.addClassCleanup(baseline_temp.cleanup)
        cls.baseline_path = Path(baseline_temp.name) / "data/master/V1_MASTER.sqlite"
        cls.baseline_info = rebuild_b05_baseline(ROOT, cls.baseline_path)

    def fixture(self):
        temporary = tempfile.TemporaryDirectory(prefix="wcd10-prepare-conflict-review-")
        self.addCleanup(temporary.cleanup)
        repo = Path(temporary.name)
        database = repo / "data/master/V1_MASTER.sqlite"
        database.parent.mkdir(parents=True)
        shutil.copy2(self.baseline_path, database)
        curation = repo / "data/v2/curation/PUBLIC_CONTENT.json"
        curation.parent.mkdir(parents=True)
        shutil.copy2(ROOT / "data/v2/curation/PUBLIC_CONTENT.json", curation)

        source_dir = ROOT / "data/changesets/WCD-10/B05"
        batch_dir = repo / "data/changesets/WCD-10/B05"
        batch_dir.mkdir(parents=True)
        for name in ("CANDIDATES.json", "COVERAGE.json", "SOURCE_REGISTRATION.json"):
            shutil.copy2(source_dir / name, batch_dir / name)
        package_path = batch_dir / "CANDIDATES.json"
        package = json.loads(package_path.read_text(encoding="utf-8"))
        conflict = next(item for item in package["existing_facts"] if item["candidate_id"] == "WCD10-B05-F16")
        coverage_path = batch_dir / "COVERAGE.json"
        coverage = json.loads(coverage_path.read_text(encoding="utf-8"))
        database_sha = hashlib.sha256(database.read_bytes()).hexdigest()
        self.assertEqual(database_sha, self.baseline_info["sha256"])
        with closing(sqlite3.connect(database.resolve().as_uri() + "?mode=ro", uri=True)) as conn:
            rows = conn.execute(
                "SELECT fact_id,value_text FROM facts WHERE subject_id=? AND fact_field=? AND value_text<>? ORDER BY fact_id",
                (conflict["subject_id"], conflict["field"], conflict["value"]),
            ).fetchall()
        old_facts = [{"fact_id": row[0], "value": row[1]} for row in rows]
        review = {
            "schema": APPEND_ONLY_REVIEW_SCHEMA,
            "decision": APPEND_ONLY_REVIEW_DECISION,
            "reviewer": "SYNTHETIC-TEST-REVIEWER",
            "reviewed_at": "2026-10-03",
            "baseline_database_sha256": database_sha,
            "candidate_content_sha256": canonical_candidate_sha256(package),
            "reviewed_conflicts": [{
                "candidate_id": conflict["candidate_id"],
                "subject_id": conflict["subject_id"],
                "field": conflict["field"],
                "new_value": conflict["value"],
                "source_refs": conflict["source_refs"],
                "existing_facts": old_facts,
                "decision": APPEND_ONLY_ENTRY_DECISION,
            }],
        }
        gate = {
            "verdict": "PASS",
            "task_id": "TASK-110",
            "reviewer": "SYNTHETIC-TEST-REVIEWER",
            "checkpoint_date": "2026-10-03",
            "baseline_database_sha256": database_sha,
            "packages": [{
                "file": "CANDIDATES.json",
                "sha256": hashlib.sha256(package_path.read_bytes()).hexdigest(),
                "verdict": "PASS",
            }],
            "coverage_sha256": hashlib.sha256(coverage_path.read_bytes()).hexdigest(),
            "registration_sha256": hashlib.sha256((batch_dir / "SOURCE_REGISTRATION.json").read_bytes()).hexdigest(),
            "conflict_review": review,
        }
        gate_path = batch_dir / "REVIEW_GATE.json"
        gate_path.write_text(json.dumps(gate, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        return repo, batch_dir, package_path, package, gate_path, gate, review

    def test_rebuilt_fixture_uses_only_git_migrations_and_frozen_exports(self):
        self.assertEqual(self.baseline_info["verified_tables"], 19)
        inputs = self.baseline_info["inputs"]
        self.assertTrue(any(item.startswith("git:") for item in inputs))
        self.assertTrue(any(item.startswith("data/master/migrations/") for item in inputs))
        self.assertTrue(any(item.startswith("data/exports/") for item in inputs))
        self.assertTrue(all(not item.startswith(("work/", "project/internal/")) for item in inputs))
        isolated_root = self.baseline_path.parents[2]
        self.assertFalse((isolated_root / "work/wcd10-qa/B05_BASELINE.sqlite").exists())

    def save_package(self, path, package, gate_path, gate, *, update_raw_hash=True):
        path.write_text(json.dumps(package, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        if update_raw_hash:
            gate["packages"][0]["sha256"] = hashlib.sha256(path.read_bytes()).hexdigest()
        gate_path.write_text(json.dumps(gate, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

    def test_valid_f16_correction_prepares_and_preserves_exact_gate_in_mapping(self):
        repo, batch_dir, _, _, _, gate, review = self.fixture()
        before = hashlib.sha256((repo / "data/master/V1_MASTER.sqlite").read_bytes()).hexdigest()
        sql, mapping = prepare(repo, batch_dir)
        fact_id = mapping["id_map"]["WCD10-B05-F16"]
        self.assertIn(f"('{fact_id}','WCD10-B05-F16'", sql)
        self.assertIn("'bibliographic_note','首版：墨西哥城 Cuadernos Americanos，1950；Fondo de Cultura Económica 版，1959。'", sql)
        self.assertNotIn("UPDATE facts", sql)
        self.assertNotIn("DELETE FROM facts", sql)
        self.assertEqual(mapping["candidate_review"], gate)
        self.assertEqual(mapping["candidate_review"]["conflict_review"], review)
        original_coverage = json.loads((batch_dir / "COVERAGE.json").read_text(encoding="utf-8"))
        self.assertEqual(
            [item["research_refs"] for item in mapping["coverage"]["objects"]],
            [item["research_refs"] for item in original_coverage["objects"]],
        )
        mapped_sources = {item["candidate_id"]: item for item in mapping["sources"]}
        source_candidates = {item["candidate_id"]: item for item in json.loads(
            (batch_dir / "CANDIDATES.json").read_text(encoding="utf-8"))["sources"]}
        for source_id in ("WCD10-B05-S22", "WCD10-B05-S24", "WCD10-B05-S25"):
            self.assertIn(source_id, mapped_sources)
            grade = "B" if source_id.endswith("S22") else "C"
            self.assertEqual(source_candidates[source_id]["source_level"], grade)
            self.assertEqual(mapped_sources[source_id]["candidate_id"], source_id)
            source_id_formal = mapped_sources[source_id]["source_id"]
            source_row = next(line for line in sql.splitlines()
                              if line.startswith(f"('{source_id_formal}','{source_id}',"))
            self.assertIn(f",'{grade}','access_pass',", source_row)
        self.assertEqual(hashlib.sha256((repo / "data/master/V1_MASTER.sqlite").read_bytes()).hexdigest(), before)

    def test_unknown_coverage_source_is_rejected(self):
        repo, batch_dir, _, _, gate_path, gate, _ = self.fixture()
        coverage_path = batch_dir / "COVERAGE.json"
        coverage = json.loads(coverage_path.read_text(encoding="utf-8"))
        coverage["objects"][0]["research_refs"].append("WCD10-B05-S99")
        coverage_path.write_text(json.dumps(coverage, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        gate["coverage_sha256"] = hashlib.sha256(coverage_path.read_bytes()).hexdigest()
        gate_path.write_text(json.dumps(gate, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        with self.assertRaisesRegex(ValueError, "coverage refers to an unknown source: WCD10-B05-S99"):
            prepare(repo, batch_dir)

    def test_coverage_deferred_only_source_is_rejected(self):
        repo, batch_dir, _, _, gate_path, gate, _ = self.fixture()
        registration_path = batch_dir / "SOURCE_REGISTRATION.json"
        registration = json.loads(registration_path.read_text(encoding="utf-8"))
        profile = next(item for item in registration["profiles"] if item["candidate_id"] == "WCD10-B05-S22")
        profile["admission"] = "deferred_only_not_registered"
        registration_path.write_text(json.dumps(registration, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        gate["registration_sha256"] = hashlib.sha256(registration_path.read_bytes()).hexdigest()
        gate_path.write_text(json.dumps(gate, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        with self.assertRaisesRegex(ValueError, "deferred-only source used by admitted content: WCD10-B05-S22"):
            prepare(repo, batch_dir)

    def test_nonpassing_overall_gate_is_rejected_even_when_package_passes(self):
        repo, batch_dir, _, _, gate_path, gate, _ = self.fixture()
        gate["verdict"] = "FAIL"
        gate_path.write_text(json.dumps(gate, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        self.assertEqual(gate["packages"][0]["verdict"], "PASS")
        with self.assertRaisesRegex(ValueError, "new batch REVIEW_GATE overall verdict must be PASS"):
            prepare(repo, batch_dir)

    def test_tampered_candidate_value_is_rejected(self):
        repo, batch_dir, candidate_path, package, gate_path, gate, _ = self.fixture()
        fact = next(item for item in package["existing_facts"] if item["candidate_id"] == "WCD10-B05-F16")
        fact["value"] += " TAMpered"
        self.save_package(candidate_path, package, gate_path, gate)
        with self.assertRaisesRegex(ValueError, "candidate content SHA-256"):
            prepare(repo, batch_dir)

    def test_tampered_old_fact_snapshot_is_rejected(self):
        repo, batch_dir, _, _, gate_path, gate, _ = self.fixture()
        gate["conflict_review"]["reviewed_conflicts"][0]["existing_facts"][0]["fact_id"] = "V1-FCT-9999"
        gate_path.write_text(json.dumps(gate, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        with self.assertRaisesRegex(ValueError, "candidate validation failed"):
            prepare(repo, batch_dir)

    def test_tampered_candidate_source_is_rejected(self):
        repo, batch_dir, candidate_path, package, gate_path, gate, review = self.fixture()
        fact = next(item for item in package["existing_facts"] if item["candidate_id"] == "WCD10-B05-F16")
        fact["source_refs"] = ["WCD10-B05-S24"]
        review["candidate_content_sha256"] = canonical_candidate_sha256(package)
        self.save_package(candidate_path, package, gate_path, gate)
        with self.assertRaisesRegex(ValueError, "candidate validation failed"):
            prepare(repo, batch_dir)

    def test_tampered_review_baseline_is_rejected(self):
        repo, batch_dir, _, _, gate_path, gate, _ = self.fixture()
        gate["conflict_review"]["baseline_database_sha256"] = "0" * 64
        gate_path.write_text(json.dumps(gate, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        with self.assertRaisesRegex(ValueError, "candidate validation failed"):
            prepare(repo, batch_dir)

    def test_conflict_without_review_gate_is_rejected(self):
        repo, batch_dir, _, _, gate_path, gate, _ = self.fixture()
        del gate["conflict_review"]
        gate_path.write_text(json.dumps(gate, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        with self.assertRaisesRegex(ValueError, "existing field values require explicit conflict review"):
            prepare(repo, batch_dir)


if __name__ == "__main__":
    unittest.main()
