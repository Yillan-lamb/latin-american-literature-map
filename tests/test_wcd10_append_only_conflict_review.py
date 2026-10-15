from __future__ import annotations

import copy
import hashlib
import json
import shutil
import sqlite3
import subprocess
import sys
import tempfile
import unittest
from contextlib import closing
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
sys.path.insert(0, str(ROOT / "tests"))
from wcd10_test_baselines import EXPECTED_B05_BASELINE_SHA256, rebuild_b05_baseline
from validate_wcd10_candidates import (  # noqa: E402
    APPEND_ONLY_ENTRY_DECISION,
    APPEND_ONLY_REVIEW_DECISION,
    APPEND_ONLY_REVIEW_SCHEMA,
    canonical_candidate_sha256,
    validate,
)


class WCD10AppendOnlyConflictReviewTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.package = json.loads((ROOT / "data/changesets/WCD-10/B05/CANDIDATES.json").read_text(encoding="utf-8"))
        cls.temporary = tempfile.TemporaryDirectory(prefix="wcd10-append-only-review-")
        cls.addClassCleanup(cls.temporary.cleanup)
        cls.repo = Path(cls.temporary.name)
        database = cls.repo / "data/master/V1_MASTER.sqlite"
        cls.baseline_info = rebuild_b05_baseline(ROOT, database)
        if cls.baseline_info["sha256"] != EXPECTED_B05_BASELINE_SHA256:
            # A platform may produce a different SQLite byte layout while the
            # full B04 checkpoint table oracle above still verifies exactly.
            if cls.baseline_info["verified_tables"] != 19:
                raise AssertionError("reconstructed B05 baseline lacks the complete B04 table oracle")
        curation = cls.repo / "data/v2/curation/PUBLIC_CONTENT.json"
        curation.parent.mkdir(parents=True)
        shutil.copy2(ROOT / "data/v2/curation/PUBLIC_CONTENT.json", curation)

    def old_facts(self, package=None):
        package = package or self.package
        item = next(f for f in package["existing_facts"] if f["candidate_id"] == "WCD10-B05-F16")
        database = self.repo / "data/master/V1_MASTER.sqlite"
        uri = database.resolve().as_uri() + "?mode=ro"
        with closing(sqlite3.connect(uri, uri=True)) as conn:
            rows = conn.execute(
                "SELECT fact_id,value_text FROM facts WHERE subject_id=? AND fact_field=? AND value_text<>? ORDER BY fact_id",
                (item["subject_id"], item["field"], item["value"]),
            ).fetchall()
        return [{"fact_id": row[0], "value": row[1]} for row in rows]

    def gate_for(self, package=None):
        package = package or self.package
        item = next(f for f in package["existing_facts"] if f["candidate_id"] == "WCD10-B05-F16")
        database = self.repo / "data/master/V1_MASTER.sqlite"
        return {
            "schema": APPEND_ONLY_REVIEW_SCHEMA,
            "decision": APPEND_ONLY_REVIEW_DECISION,
            "reviewer": "SYNTHETIC-TEST-REVIEWER",
            "reviewed_at": "2026-10-03",
            "baseline_database_sha256": hashlib.sha256(database.read_bytes()).hexdigest(),
            "candidate_content_sha256": canonical_candidate_sha256(package),
            "reviewed_conflicts": [{
                "candidate_id": item["candidate_id"],
                "subject_id": item["subject_id"],
                "field": item["field"],
                "new_value": item["value"],
                "source_refs": item["source_refs"],
                "existing_facts": self.old_facts(package),
                "decision": APPEND_ONLY_ENTRY_DECISION,
            }],
        }

    def test_current_fct_0309_conflict_fails_without_review_gate(self):
        before = hashlib.sha256((self.repo / "data/master/V1_MASTER.sqlite").read_bytes()).hexdigest()
        report = validate(self.repo, self.package)
        self.assertEqual(report["verdict"], "fail")
        self.assertTrue(any("existing field values require explicit conflict review: V1-ENT-0154/bibliographic_note" in error for error in report["errors"]))
        with closing(sqlite3.connect((self.repo / "data/master/V1_MASTER.sqlite").resolve().as_uri() + "?mode=ro", uri=True)) as conn:
            old = conn.execute(
                "SELECT fact_id,value_text,origin_id FROM facts WHERE fact_id='V1-FCT-0309'"
            ).fetchone()
            links = conn.execute("SELECT source_id FROM fact_sources WHERE fact_id='V1-FCT-0309' ORDER BY source_id").fetchall()
        self.assertEqual(old, (
            "V1-FCT-0309",
            "诺贝尔书目页未列西语原版；英译 The Labyrinth of Solitude（tr. Lysander Kemp）Penguin 1985；poets.org 标初版 FCE 1950",
            "SRC-0128",
        ))
        self.assertEqual(links, [("SRC-0099",)])
        self.assertEqual(hashlib.sha256((self.repo / "data/master/V1_MASTER.sqlite").read_bytes()).hexdigest(), before)

    def test_exact_review_gate_allows_only_append_only_bibliographic_note(self):
        before = hashlib.sha256((self.repo / "data/master/V1_MASTER.sqlite").read_bytes()).hexdigest()
        report = validate(self.repo, self.package, conflict_review=self.gate_for())
        self.assertEqual(report["errors"], [], report["errors"])
        self.assertEqual(report["verdict"], "pass")
        self.assertEqual(hashlib.sha256((self.repo / "data/master/V1_MASTER.sqlite").read_bytes()).hexdigest(), before)

    def test_stale_candidate_digest_is_rejected(self):
        gate = self.gate_for()
        package = copy.deepcopy(self.package)
        package["existing_facts"][0]["value"] += " 修改"
        report = validate(self.repo, package, conflict_review=gate)
        self.assertTrue(any("candidate content SHA-256" in error for error in report["errors"]))

    def test_database_digest_and_old_fact_snapshot_are_exact(self):
        gate = self.gate_for()
        gate["baseline_database_sha256"] = "0" * 64
        report = validate(self.repo, self.package, conflict_review=gate)
        self.assertTrue(any("database SHA-256" in error for error in report["errors"]))

        gate = self.gate_for()
        gate["reviewed_conflicts"][0]["existing_facts"][0]["fact_id"] = "V1-FCT-9999"
        report = validate(self.repo, self.package, conflict_review=gate)
        self.assertTrue(any("binding differs" in error for error in report["errors"]))

    def test_new_value_and_source_refs_cannot_drift_from_review(self):
        gate = self.gate_for()
        gate["reviewed_conflicts"][0]["new_value"] += " 篡改"
        report = validate(self.repo, self.package, conflict_review=gate)
        self.assertTrue(any("binding differs" in error for error in report["errors"]))

        gate = self.gate_for()
        gate["reviewed_conflicts"][0]["source_refs"] = ["WCD10-B05-S24"]
        report = validate(self.repo, self.package, conflict_review=gate)
        self.assertTrue(any("binding differs" in error for error in report["errors"]))

    def test_non_bibliographic_conflict_cannot_be_reviewed(self):
        package = copy.deepcopy(self.package)
        item = next(f for f in package["existing_facts"] if f["candidate_id"] == "WCD10-B05-F16")
        item["field"] = "first_publication_year"
        item["value"] = "1959"
        item["boundary"] += "；测试还核对 V1-FCT-0306。"
        gate = self.gate_for(package)
        report = validate(self.repo, package, conflict_review=gate)
        self.assertTrue(any("only permits bibliographic_note" in error for error in report["errors"]))
        self.assertTrue(any("existing field values require explicit conflict review" in error for error in report["errors"]))

    def test_dangling_review_entries_and_missing_old_ids_are_rejected(self):
        gate = self.gate_for()
        gate["reviewed_conflicts"].append(copy.deepcopy(gate["reviewed_conflicts"][0]))
        gate["reviewed_conflicts"][-1]["candidate_id"] = "WCD10-B05-F99"
        report = validate(self.repo, self.package, conflict_review=gate)
        self.assertTrue(any("dangling" in error for error in report["errors"]))

        package = copy.deepcopy(self.package)
        item = next(f for f in package["existing_facts"] if f["candidate_id"] == "WCD10-B05-F16")
        item["boundary"] = "只保留一般边界，没有旧事实ID。"
        report = validate(self.repo, package, conflict_review=self.gate_for(package))
        self.assertTrue(any("cite every preserved old fact ID" in error for error in report["errors"]))

    def test_cli_accepts_gate_file_but_default_cli_remains_blocked(self):
        with tempfile.TemporaryDirectory(prefix="wcd10-gate-cli-") as temp:
            tmp = Path(temp)
            candidate_path = tmp / "CANDIDATES.json"
            gate_path = tmp / "REVIEW_GATE.json"
            report_path = tmp / "REPORT.json"
            candidate_path.write_text(json.dumps(self.package, ensure_ascii=False), encoding="utf-8")
            gate_path.write_text(json.dumps(self.gate_for(), ensure_ascii=False), encoding="utf-8")
            script = ROOT / "scripts/validate_wcd10_candidates.py"
            default = subprocess.run(
                [sys.executable, str(script), str(candidate_path), "--repo", str(self.repo)],
                check=False, capture_output=True, text=True,
            )
            self.assertEqual(default.returncode, 1)
            missing_gate = subprocess.run(
                [sys.executable, str(script), str(candidate_path), "--repo", str(self.repo), "--review-gate", str(tmp / "missing.json")],
                check=False, capture_output=True, text=True,
            )
            self.assertEqual(missing_gate.returncode, 1)
            self.assertIn("could not be loaded", missing_gate.stdout)
            malformed_gate_path = tmp / "malformed.json"
            malformed_gate_path.write_text('{"schema":"one","schema":"two"}', encoding="utf-8")
            malformed = subprocess.run(
                [sys.executable, str(script), str(candidate_path), "--repo", str(self.repo), "--review-gate", str(malformed_gate_path)],
                check=False, capture_output=True, text=True,
            )
            self.assertEqual(malformed.returncode, 1)
            self.assertIn("duplicate JSON key", malformed.stdout)
            gated = subprocess.run(
                [sys.executable, str(script), str(candidate_path), "--repo", str(self.repo), "--review-gate", str(gate_path), "--report", str(report_path)],
                check=False, capture_output=True, text=True,
            )
            self.assertEqual(gated.returncode, 0, gated.stdout + gated.stderr)
            self.assertEqual(json.loads(report_path.read_text(encoding="utf-8"))["reviewed_append_only_conflicts"], 1)

            # The supported canonical input is the complete main REVIEW_GATE document.
            main_gate_path = tmp / "main-REVIEW_GATE.json"
            main_gate_path.write_text(json.dumps({"verdict": "PASS", "conflict_review": self.gate_for()}, ensure_ascii=False), encoding="utf-8")
            main_gated = subprocess.run(
                [sys.executable, str(script), str(candidate_path), "--repo", str(self.repo), "--review-gate", str(main_gate_path)],
                check=False, capture_output=True, text=True,
            )
            self.assertEqual(main_gated.returncode, 0, main_gated.stdout + main_gated.stderr)

            rejected_gate_path = tmp / "rejected-main-REVIEW_GATE.json"
            rejected_gate_path.write_text(json.dumps({"verdict": "FAIL", "conflict_review": self.gate_for()}, ensure_ascii=False), encoding="utf-8")
            rejected_main_gate = subprocess.run(
                [sys.executable, str(script), str(candidate_path), "--repo", str(self.repo), "--review-gate", str(rejected_gate_path)],
                check=False, capture_output=True, text=True,
            )
            self.assertEqual(rejected_main_gate.returncode, 1)
            self.assertIn("overall REVIEW_GATE verdict must be PASS", rejected_main_gate.stdout)

            missing_nested_path = tmp / "missing-conflict-review.json"
            missing_nested_path.write_text(json.dumps({"verdict": "PASS"}), encoding="utf-8")
            missing_nested = subprocess.run(
                [sys.executable, str(script), str(candidate_path), "--repo", str(self.repo), "--review-gate", str(missing_nested_path)],
                check=False, capture_output=True, text=True,
            )
            self.assertEqual(missing_nested.returncode, 1)
            self.assertIn("REVIEW_GATE is missing conflict_review", missing_nested.stdout)


if __name__ == "__main__":
    unittest.main()
