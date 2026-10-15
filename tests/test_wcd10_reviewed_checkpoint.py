from __future__ import annotations

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
from qa_wcd10_reviewed_checkpoint import verify_reviewed_checkpoint
from qa_wcd10_checkpoint import digest
from validate_master import validate_database
from wcd10_test_baselines import rebuild_b04_baseline

B04_EXPORTS = ROOT / "data/exports/wcd10-b04-checkpoint"
B03_EXPORTS = ROOT / "data/exports/wcd10-b03-checkpoint"
B04_SQL_NAME = "0039_wcd10_b04_author_works.sql"
B04_MAPPING_REL = "data/changesets/WCD-10/B04/INTEGRATION_MAP.json"
B04_BASELINE_SHA256 = "079deee47063d2435bdaafe1b3c1dca24ca8b6c7353acc1427075bf0ce86746d"
B04_SQL_SHA256 = "4d8428f7cea7ebb731867c903facf5d27a0e821951ed5c44e5ea243b87c6a356"
B04_MAPPING_SHA256 = "d454f71ac1dae66e20a68b2629d0d302ba9dcb3eaee7ba462dfe6ae1c69a0e3a"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


class ReviewedCheckpointTests(unittest.TestCase):
    @staticmethod
    def run_command(args):
        return subprocess.run(
            [str(arg) for arg in args], capture_output=True, text=True, check=True,
        )

    @classmethod
    def build_public_bundle(cls, database: Path, output: Path) -> Path:
        web_data = output / "web_data"
        bundle = output / "deploy_bundle"
        cls.run_command([
            sys.executable, cls.repo / "scripts/build_v2_web_data.py",
            "--db", database,
            "--geo-dir", cls.repo / "data/v2/geo",
            "--curation-dir", cls.repo / "data/v2/curation",
            "--presentation", cls.repo / "data/v2/presentation/PUBLIC_PRESENTATION.json",
            "--public-content", cls.repo / "data/v2/curation/PUBLIC_CONTENT.json",
            "--output-dir", web_data,
            "--generated-at", "2026-10-03T00:00:00Z",
        ])
        cls.run_command([
            sys.executable, cls.repo / "scripts/validate_v2_web_data.py",
            web_data / "site_data.json",
        ])
        cls.run_command([
            sys.executable, cls.repo / "scripts/build_v2_deploy_bundle.py",
            "--output", bundle,
            "--data", web_data / "site_data.json",
            "--origin", "https://yillan-lamb.github.io/latin-american-literature-map/",
        ])
        cls.run_command([
            sys.executable, cls.repo / "scripts/validate_v2_public_bundle.py", bundle,
        ])
        return bundle

    @classmethod
    def setUpClass(cls):
        cls.temp = tempfile.TemporaryDirectory(prefix="wcd10-reviewed-checkpoint-")
        cls.addClassCleanup(cls.temp.cleanup)
        cls.repo = Path(cls.temp.name).resolve()
        cls.baseline = cls.repo / "work/wcd10-qa/B04_BASELINE.sqlite"
        cls.database = cls.repo / "data/master/V1_MASTER.sqlite"
        cls.migration = cls.repo / "data/master/migrations" / B04_SQL_NAME
        cls.mapping = cls.repo / B04_MAPPING_REL
        cls.exports = cls.repo / "data/exports/wcd10-b04-checkpoint"
        cls.before = cls.repo / "work/wcd10-qa/B04_BEFORE_PUBLIC"
        cls.after = cls.repo / "work/wcd10-qa/B04_AFTER_PUBLIC"
        cls.gate_path = cls.repo / "data/changesets/WCD-10/B04/CHECKPOINT_REVIEW.json"

        for path in (cls.baseline.parent, cls.database.parent, cls.migration.parent,
                     cls.mapping.parent, cls.exports.parent, cls.before.parent,
                     cls.after.parent, cls.gate_path.parent):
            path.mkdir(parents=True, exist_ok=True)
        # Builders derive ROOT from their script location. Copy only tracked
        # build inputs into this disposable repository so the real builders run
        # against temporary databases and write only temporary bundles.
        tracked_inputs = subprocess.check_output(
            ["git", "ls-files", "--", "scripts/build_v2_web_data.py",
             "scripts/validate_v2_web_data.py", "scripts/build_v2_deploy_bundle.py",
             "scripts/validate_v2_public_bundle.py", "site", "data/v2/geo",
             "data/v2/curation", "data/v2/presentation"],
            cwd=ROOT, text=True,
        ).splitlines()
        for relative in tracked_inputs:
            source = ROOT / relative
            if not source.is_file():
                raise AssertionError("tracked public-build input is missing: " + relative)
            destination = cls.repo / relative
            destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(source, destination)
        rebuilt = rebuild_b04_baseline(ROOT, cls.baseline)
        if not rebuilt["matches_expected_sha256"] or rebuilt["sha256"] != B04_BASELINE_SHA256:
            raise AssertionError("reconstructed post-B03 baseline is not the frozen B04 pre-state: " + repr(rebuilt))
        shutil.copy2(ROOT / "data/master/migrations" / B04_SQL_NAME, cls.migration)
        shutil.copy2(ROOT / B04_MAPPING_REL, cls.mapping)
        shutil.copytree(B04_EXPORTS, cls.exports)

        # Build the post-B03 and post-B04 public bundles from real databases and
        # tracked inputs; never consume ignored before/after public snapshots.
        if sha256(cls.migration) != B04_SQL_SHA256:
            raise AssertionError("frozen B04 SQL hash changed")
        if sha256(cls.mapping) != B04_MAPPING_SHA256:
            raise AssertionError("frozen B04 mapping hash changed")
        snapshot = json.loads((B04_EXPORTS / "data.json").read_text(encoding="utf-8"))
        log = next(row for row in snapshot["tables"]["migration_log"]
                   if row["migration_id"] == Path(B04_SQL_NAME).stem)
        cls.sql_reviewer = log["reviewer"]
        mapping_data = json.loads(cls.mapping.read_text(encoding="utf-8"))
        mapping_data["candidate_review"]["reviewer"] = "fixture-candidate-reviewer"
        if mapping_data["candidate_review"]["reviewer"] == cls.sql_reviewer:
            raise AssertionError("fixture must exercise distinct candidate and SQL reviewers")
        cls.mapping.write_text(json.dumps(mapping_data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        shutil.copy2(cls.baseline, cls.database)
        with closing(sqlite3.connect(cls.database)) as conn:
            conn.execute("PRAGMA foreign_keys=ON")
            conn.executescript("BEGIN;\n" + cls.migration.read_text(encoding="utf-8") + "\nCOMMIT;")
            columns = list(log)
            conn.execute(
                "INSERT INTO migration_log (" + ",".join(columns) + ") VALUES (" +
                ",".join("?" for _ in columns) + ")",
                [log[column] for column in columns],
            )
            conn.commit()
        # SQLite page layout may vary while table rows are identical. Rebind only
        # this disposable export fixture to its test-replayed DB hash; reviewed
        # baseline, SQL and mapping hashes above remain fixed frozen constants.
        data_path = cls.exports / "data.json"
        data = json.loads(data_path.read_text(encoding="utf-8"))
        data["metadata"]["source_database_sha256"] = digest(cls.database)
        data_path.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        validation = validate_database(cls.database)
        if validation["verdict"] != "pass":
            raise AssertionError(validation)
        cls.before = cls.build_public_bundle(cls.baseline, cls.before)
        cls.after = cls.build_public_bundle(cls.database, cls.after)

        cls.gate = {
            "verdict": "PASS",
            "task_id": "TASK-109",
            "batch_id": "WCD-10-B04",
            "baseline_database_sha256": sha256(cls.baseline),
            "migration_name": B04_SQL_NAME,
            "migration_sha256": sha256(cls.migration),
            "mapping_path": B04_MAPPING_REL,
            "mapping_sha256": sha256(cls.mapping),
            "reviewer": cls.sql_reviewer,
        }
        cls.write_gate(cls.gate)
        cls.source_master_path = ROOT / "data/master/V1_MASTER.sqlite"
        cls.source_master_before = sha256(cls.source_master_path)

    @classmethod
    def write_gate(cls, gate):
        cls.gate_path.write_text(json.dumps(gate, indent=2) + "\n", encoding="utf-8")

    def verify(self, **overrides):
        args = {
            "repo": self.repo,
            "exports": self.exports,
            "before_public": self.before,
            "after_public": self.after,
            "mapping_path": self.mapping,
            "baseline_path": self.baseline,
            "migration_name": B04_SQL_NAME,
            "review_gate_path": self.gate_path,
        }
        args.update(overrides)
        return verify_reviewed_checkpoint(**args)

    def test_frozen_b04_end_to_end_oracle_and_master_read_only(self):
        before = sha256(self.database)
        report = self.verify()
        self.assertEqual(report["status"], "PASS")
        mapping = json.loads(self.mapping.read_text(encoding="utf-8"))
        self.assertNotEqual(mapping["candidate_review"]["reviewer"], self.gate["reviewer"])
        self.assertEqual(self.gate["reviewer"], self.sql_reviewer)
        self.assertTrue(report["reviewed_sql_exact_replay"])
        self.assertEqual(report["independent_review_binding"]["batch_id"], "WCD-10-B04")
        self.assertEqual(sha256(self.database), before)
        self.assertEqual(sha256(self.source_master_path), self.source_master_before)

    def test_wrong_sql_review_reviewer_rejected(self):
        broken = dict(self.gate)
        broken["reviewer"] = "wrong-sql-reviewer"
        self.write_gate(broken)
        self.addCleanup(lambda: self.write_gate(self.gate))
        with self.assertRaisesRegex(ValueError, "migration log does not bind approved SQL and reviewer"):
            self.verify()

    def test_frozen_b04_cli_writes_only_explicit_report(self):
        report_path = self.repo / "work/wcd10-qa/reports/B04_CHECKPOINT.json"
        result = __import__("subprocess").run(
            [sys.executable, str(ROOT / "scripts/qa_wcd10_reviewed_checkpoint.py"),
             "--repo", str(self.repo), "--exports", str(self.exports),
             "--before-public", str(self.before), "--after-public", str(self.after),
             "--baseline-database", str(self.baseline), "--mapping", str(self.mapping),
             "--migration-name", B04_SQL_NAME, "--review-gate", str(self.gate_path),
             "--report", str(report_path)],
            capture_output=True, text=True, check=True,
        )
        self.assertEqual(json.loads(result.stdout)["status"], "PASS")
        self.assertEqual(json.loads(report_path.read_text(encoding="utf-8"))["status"], "PASS")

    def test_same_count_wrong_export_value_rejected(self):
        data_path = self.exports / "data.json"
        original = data_path.read_bytes()
        self.addCleanup(lambda: data_path.write_bytes(original))
        data = json.loads(original)
        rows = data["tables"]["facts"]
        self.assertGreater(len(rows), 0)
        rows[0]["value_text"] = "wrong same-count value"
        data_path.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        with self.assertRaisesRegex(ValueError, "JSON mismatch: facts"):
            self.verify()

    def test_missing_binding_rejected(self):
        for field in ("verdict", "task_id", "batch_id", "baseline_database_sha256",
                      "migration_name", "migration_sha256", "mapping_path",
                      "mapping_sha256", "reviewer"):
            with self.subTest(field=field):
                broken = dict(self.gate)
                del broken[field]
                self.write_gate(broken)
                with self.assertRaisesRegex(ValueError, "missing or invalid binding: " + field):
                    self.verify()
        self.write_gate(self.gate)

    def test_wrong_task_or_batch_rejected(self):
        for field, wrong in (("task_id", "TASK-110"), ("batch_id", "WCD-10-B05")):
            with self.subTest(field=field):
                broken = dict(self.gate)
                broken[field] = wrong
                self.write_gate(broken)
                expected = "integration mapping task/batch" if field == "task_id" else "review gate must be CHECKPOINT_REVIEW"
                with self.assertRaisesRegex(ValueError, expected):
                    self.verify()
        self.write_gate(self.gate)

    def test_mapping_hash_mismatch_rejected(self):
        broken = dict(self.gate)
        broken["mapping_sha256"] = "0" * 64
        self.write_gate(broken)
        self.addCleanup(lambda: self.write_gate(self.gate))
        with self.assertRaisesRegex(ValueError, "mapping differs from independent review gate hash"):
            self.verify()

    def test_migration_sql_hash_mismatch_rejected(self):
        broken = dict(self.gate)
        broken["migration_sha256"] = "0" * 64
        self.write_gate(broken)
        self.addCleanup(lambda: self.write_gate(self.gate))
        with self.assertRaisesRegex(ValueError, "migration SQL differs"):
            self.verify()

    def test_mapping_candidate_review_baseline_binding_mismatch_rejected(self):
        original = self.mapping.read_bytes()
        mapping = json.loads(original)
        mapping["candidate_review"]["baseline_database_sha256"] = "0" * 64
        self.mapping.write_text(json.dumps(mapping, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        broken_gate = dict(self.gate)
        broken_gate["mapping_sha256"] = sha256(self.mapping)
        self.write_gate(broken_gate)
        self.addCleanup(lambda: (self.mapping.write_bytes(original), self.write_gate(self.gate)))
        with self.assertRaisesRegex(ValueError, "candidate_review baseline differs"):
            self.verify()

    def test_migration_name_mismatch_rejected(self):
        with self.assertRaisesRegex(ValueError, "migration name differs"):
            self.verify(migration_name="0038_wcd10_b03_author_works.sql")

    def test_mapping_path_batch_escape_or_mismatch_rejected(self):
        broken = dict(self.gate)
        broken["mapping_path"] = "../B03/INTEGRATION_MAP.json"
        self.write_gate(broken)
        self.addCleanup(lambda: self.write_gate(self.gate))
        with self.assertRaisesRegex(ValueError, "mapping_path must bind"):
            self.verify()

    def test_mapping_outside_repo_rejected(self):
        with tempfile.TemporaryDirectory(prefix="wcd10-outside-mapping-") as outside:
            outside_map = Path(outside) / "INTEGRATION_MAP.json"
            outside_map.write_text("{}", encoding="utf-8")
            with self.assertRaisesRegex(ValueError, "--mapping must resolve inside canonical --repo"):
                self.verify(mapping_path=outside_map)

    def test_gate_must_be_inside_reviewed_batch_directory(self):
        other_gate = self.repo / "data/changesets/WCD-10/B04/OTHER_REVIEW.json"
        other_gate.write_bytes(self.gate_path.read_bytes())
        with self.assertRaisesRegex(ValueError, "must be CHECKPOINT_REVIEW.json"):
            self.verify(review_gate_path=other_gate)

    def test_same_public_directory_rejected(self):
        with self.assertRaisesRegex(ValueError, "public before and after directories must be distinct"):
            self.verify(after_public=self.before)

    def test_baseline_cannot_be_current_database(self):
        with self.assertRaisesRegex(ValueError, "baseline database must be distinct from current master"):
            self.verify(baseline_path=self.database)

    def test_missing_baseline_cli_argument_is_required(self):
        result = __import__("subprocess").run(
            [sys.executable, str(ROOT / "scripts/qa_wcd10_reviewed_checkpoint.py"),
             "--repo", str(self.repo), "--exports", str(self.exports),
             "--before-public", str(self.before), "--after-public", str(self.after),
             "--mapping", str(self.mapping), "--migration-name", B04_SQL_NAME,
             "--review-gate", str(self.gate_path)],
            capture_output=True, text=True,
        )
        self.assertEqual(result.returncode, 2)
        self.assertIn("--baseline-database", result.stderr)


if __name__ == "__main__":
    unittest.main()
