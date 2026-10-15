from __future__ import annotations

import copy
import hashlib
import json
import sys
import shutil
import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from wcd10_inventory import inventory
from validate_wcd10_candidates import validate


class WCD10Tests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.package = json.loads((ROOT / "data/changesets/WCD-10/B01/CANDIDATES.json").read_text(encoding="utf-8"))
        cls.temporary = tempfile.TemporaryDirectory(prefix="wcd10-reviewed-baseline-")
        cls.addClassCleanup(cls.temporary.cleanup)
        cls.baseline = Path(cls.temporary.name)
        database = cls.baseline / "data/master/V1_MASTER.sqlite"
        database.parent.mkdir(parents=True)
        database.write_bytes(subprocess.check_output([
            "git", "show", cls.package["baseline_commit"] + ":data/master/V1_MASTER.sqlite"], cwd=ROOT))
        curation = cls.baseline / "data/v2/curation/PUBLIC_CONTENT.json"
        curation.parent.mkdir(parents=True)
        shutil.copy2(ROOT / "data/v2/curation/PUBLIC_CONTENT.json", curation)

    def test_inventory_is_readonly_and_matches_roster(self):
        db = ROOT / "data/master/V1_MASTER.sqlite"
        before = hashlib.sha256(db.read_bytes()).hexdigest()
        report = inventory(ROOT)
        self.assertEqual(report["counts"]["core_authors"], 61)
        self.assertEqual(report["counts"]["batches"], 21)
        self.assertEqual(report["authors"][0]["author"]["entity_id"], "V1-ENT-0002")
        self.assertEqual(report["authors"][-1]["batch_id"], "WCD-10-B21")
        self.assertEqual(hashlib.sha256(db.read_bytes()).hexdigest(), before)

    def test_candidate_baseline_passes_mechanical_checks_only(self):
        report = validate(self.baseline, self.package)
        self.assertEqual(report["errors"], [])
        self.assertEqual(report["verdict"], "pass")
        self.assertIn("independent Reviewer", report["warnings"][0])

    def test_created_description_override_must_be_a_nonblank_string(self):
        for invalid in (None, [], "", " \t\n"):
            with self.subTest(value=invalid):
                package = copy.deepcopy(self.package)
                package["new_entities"][0]["created_description_zh"] = invalid
                report = validate(self.baseline, package)
                self.assertTrue(any("invalid created_description_zh override" in error
                                    for error in report["errors"]))

    def test_separate_supplement_has_no_candidate_id_or_database_collisions(self):
        package = copy.deepcopy(self.package)
        supplement = json.loads((ROOT / "data/changesets/WCD-10/B01/SUPPLEMENT.json").read_text(encoding="utf-8"))
        for key in ("sources", "new_entities", "existing_facts", "extra_relationships"):
            package[key].extend(supplement[key])
        report = validate(self.baseline, package)
        self.assertEqual(report["errors"], [])
        self.assertEqual(report["counts"]["new_entity_candidates"], 10)
        self.assertEqual(report["counts"]["new_fact_candidates"], 49)

    def test_combined_publication_year_rejected(self):
        package = copy.deepcopy(self.package)
        package["new_entities"][0]["facts"][0]["value"] = "1923/1969"
        self.assertTrue(any("non-atomic year" in e for e in validate(self.baseline, package)["errors"]))

    def test_inventory_keeps_card_only_research_not_just_fact_sources(self):
        author = next(a for a in inventory(ROOT)["authors"] if a["author"]["entity_id"] == "V1-ENT-0031")
        work = next(w for w in author["works"] if w["entity"]["entity_id"] == "V1-ENT-0040")
        self.assertTrue(any(s["source_id"] == "SRC-0074" and s["research_support"] == "yes" for s in work["card_sources"]))
        self.assertIn("SRC-0074", {s["source_id"] for s in work["source_objects"]})

    def test_inventory_keeps_relationship_only_research_evidence(self):
        author = next(a for a in inventory(ROOT)["authors"] if a["author"]["entity_id"] == "V1-ENT-0072")
        work = next(w for w in author["works"] if w["entity"]["entity_id"] == "V1-ENT-0158")
        self.assertTrue(any(s["source_id"] == "SRC-0291" and s["evidence_status"] == "eligible_evidence" for s in work["relationship_evidence"]))
        self.assertIn("SRC-0291", {s["source_id"] for s in work["source_objects"]})

    def test_missing_source_is_rejected(self):
        package = copy.deepcopy(self.package)
        package["new_entities"][0]["facts"][0]["source_refs"] = ["missing"]
        self.assertTrue(validate(self.baseline, package)["errors"])

    def test_existing_work_requires_reuse(self):
        package = copy.deepcopy(self.package)
        package["new_entities"][0]["original_name"] = "Ficciones"
        self.assertTrue(any("already exists" in e for e in validate(self.baseline, package)["errors"]))

    def test_interpretive_relation_cannot_use_direct_path(self):
        package = copy.deepcopy(self.package)
        package["extra_relationships"][0]["relation_type"] = "EXPLORES_THEME"
        self.assertTrue(any("dedicated semantic evidence" in e for e in validate(self.baseline, package)["errors"]))

    def test_wrong_set_in_layer_rejected(self):
        package = copy.deepcopy(self.package)
        package["extra_relationships"][0]["object_id"] = "V1-ENT-0016"
        self.assertTrue(any("invalid SET_IN" in e for e in validate(self.baseline, package)["errors"]))

    def test_peripheral_author_cannot_enter_batch(self):
        package = copy.deepcopy(self.package)
        package["author_ids"][0] = "V1-ENT-0005"
        self.assertTrue(any("roster" in e for e in validate(self.baseline, package)["errors"]))

    def test_unimplemented_relation_path_fails_closed(self):
        package = copy.deepcopy(self.package)
        package["extra_relationships"][0]["relation_type"] = "APPEARS_IN"
        self.assertTrue(any("lacks reviewed admission rules" in e for e in validate(self.baseline, package)["errors"]))

    def test_extra_relationship_cannot_escape_batch(self):
        package = copy.deepcopy(self.package)
        package["extra_relationships"][0]["subject_id"] = "V1-ENT-0002"
        self.assertTrue(any("outside batch" in e for e in validate(self.baseline, package)["errors"]))


if __name__ == "__main__":
    unittest.main()
