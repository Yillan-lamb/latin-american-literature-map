from __future__ import annotations

import hashlib
import json
import shutil
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from build_wcd10_migration import prepare, reviewed_research_note_classes
from wcd10_inventory import inventory


def package_with_note(source_level="A", batch_id="WCD-10-B05"):
    return {
        "batch_id": batch_id,
        "new_entities": [{
            "candidate_id": "WCD10-B05-W01",
            "facts": [{
                "field": "research_note",
                "value": "研究者对该作品的署名解释。",
                "source_refs": ["WCD10-B05-S01"],
            }],
        }],
        "existing_facts": [],
        "sources": [{"candidate_id": "WCD10-B05-S01", "source_level": source_level}],
    }


def gate_for(source_level="A"):
    return {
        "reviewer": "CODEX-REVIEW",
        "research_note_gate": {
            "field": "research_note",
            "source_grade_rule": {"A": "scholarly_paraphrase", "B": None, "C": None},
            "material_class": "scholarly_paraphrase",
            "entries": [{
                "candidate_id": "WCD10-B05-W01-F01",
                "source_refs": ["WCD10-B05-S01"],
                "source_grades": {"WCD10-B05-S01": source_level},
                "material_class": "scholarly_paraphrase",
            }],
        },
    }


class WCD10ResearchNoteGateTests(unittest.TestCase):
    def test_a_grade_note_requires_and_accepts_explicit_field_source_gate(self):
        classes = reviewed_research_note_classes(package_with_note("A"), gate_for("A"))
        self.assertEqual(classes, {"WCD10-B05-W01-F01": "scholarly_paraphrase"})

    def test_b_grade_institutional_summary_cannot_be_promoted_to_scholarly(self):
        with self.assertRaisesRegex(ValueError, "requires A-grade sources"):
            reviewed_research_note_classes(package_with_note("B"), gate_for("B"))

    def test_source_grade_assertion_must_match_candidate_source(self):
        with self.assertRaisesRegex(ValueError, "source grades mismatch"):
            reviewed_research_note_classes(package_with_note("B"), gate_for("A"))

    def test_missing_gate_fails_closed_for_new_research_note(self):
        with self.assertRaisesRegex(ValueError, "explicit field/source-grade policy"):
            reviewed_research_note_classes(package_with_note("A"), {"reviewer": "CODEX-REVIEW"})

    def test_gate_must_bind_exact_note_source_refs(self):
        gate = gate_for("A")
        gate["research_note_gate"]["entries"][0]["source_refs"] = []
        with self.assertRaisesRegex(ValueError, "source refs mismatch"):
            reviewed_research_note_classes(package_with_note("A"), gate)

    def test_unknown_source_grade_fails_closed(self):
        with self.assertRaisesRegex(ValueError, "requires A-grade sources"):
            reviewed_research_note_classes(package_with_note("D"), gate_for("D"))

    def test_each_note_must_have_one_unique_gate_entry(self):
        package = package_with_note("A")
        package["new_entities"][0]["facts"].append({
            "candidate_id": "WCD10-B05-F02", "field": "research_note", "value": "Another note.",
            "source_refs": ["WCD10-B05-S01"],
        })
        with self.assertRaisesRegex(ValueError, "exact research_note candidate IDs"):
            reviewed_research_note_classes(package, gate_for("A"))


class WCD10NestedPrepareIntegrationTests(unittest.TestCase):
    def test_valid_b05_roster_nested_a_note_passes_validator_and_prepare(self):
        with tempfile.TemporaryDirectory(prefix="wcd10-nested-note-prepare-") as temporary:
            repo = Path(temporary)
            database = repo / "data/master/V1_MASTER.sqlite"
            database.parent.mkdir(parents=True)
            shutil.copy2(ROOT / "data/master/V1_MASTER.sqlite", database)
            curation = repo / "data/v2/curation/PUBLIC_CONTENT.json"
            curation.parent.mkdir(parents=True)
            shutil.copy2(ROOT / "data/v2/curation/PUBLIC_CONTENT.json", curation)
            baseline_sha = hashlib.sha256(database.read_bytes()).hexdigest()
            baseline_commit = "05f3372c69a54ec331d31b05d16c8288d6d3a993"
            batch_authors = [item for item in inventory(repo)["authors"] if item["batch_id"] == "WCD-10-B05"]
            author_ids = [item["author"]["entity_id"] for item in batch_authors]

            batch_dir = repo / "data/changesets/WCD-10/B05"
            batch_dir.mkdir(parents=True)
            source_id = "WCD10-B05-S01"
            work_id = "WCD10-B05-W01"
            sources = [{
                "candidate_id": source_id,
                "title": "Synthetic A-grade source for builder test",
                "author_or_editor": "Test Researcher",
                "url": "https://example.invalid/test-research-note",
                "source_level": "A",
                "access_status": "OPENED",
                "locator": "synthetic test locator",
                "usage": "Synthetic test evidence only; never admitted to project data.",
            }]
            note_value = "研究者对测试作品的署名解释。"
            package = {
                "schema": "wcd10-candidate-1",
                "task_id": "TASK-110",
                "batch_id": "WCD-10-B05",
                "baseline_commit": baseline_commit,
                "baseline_database_sha256": baseline_sha,
                "status": "CANDIDATE",
                "author_ids": author_ids,
                "accessed_at": "2026-10-03",
                "public_boundary": "Research-only synthetic test fixture; no public admission.",
                "source_scope_decisions": [],
                "sources": sources,
                "new_entities": [{
                    "candidate_id": work_id,
                    "author_id": author_ids[0],
                    "entity_type": "work",
                    "name_zh_candidate": "测试用作品",
                    "original_name": "Synthetic Work for WCD-10 Test",
                    "name_policy": "Explicit test-only temporary name.",
                    "rationale": "Exercise the nested new-entity fact contract.",
                    "created_source_refs": [source_id],
                    "facts": [
                        {"field": "first_publication_year", "value": "1999", "source_refs": [source_id], "boundary": "Synthetic test only."},
                        {"field": "genre_or_form", "value": "novel", "source_refs": [source_id], "boundary": "Synthetic test only."},
                        {"field": "one_sentence_summary", "value": "这是仅用于构建器测试的作品说明。", "source_refs": [source_id], "boundary": "Synthetic test only."},
                        {"field": "research_note", "value": note_value, "source_refs": [source_id], "boundary": "Attributed A-grade test note; no project admission."},
                    ],
                }],
                "existing_facts": [],
                "extra_relationships": [],
                "deferred": [],
            }
            candidate_path = batch_dir / "CANDIDATES.json"
            candidate_path.write_text(json.dumps(package, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

            registration = {
                "task_id": "TASK-110",
                "accessed_at": "2026-10-03",
                "verified_by": "TEST-ONLY",
                "source_year_policy": "Synthetic test source has no asserted publication year.",
                "public_content_scope": "Research-only; no public admission.",
                "local_asset_status": "none",
                "copyright_boundary": "Synthetic fixture contains no third-party source text.",
                "profiles": [{
                    "candidate_id": source_id,
                    "publisher": "Synthetic Test Repository",
                    "format": "journal_article",
                    "language": "es",
                    "publication_year": "",
                    "notes": "Synthetic test source only.",
                }],
            }
            registration_path = batch_dir / "SOURCE_REGISTRATION.json"
            registration_path.write_text(json.dumps(registration, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

            objects = [{
                "object_ref": work["entity"]["entity_id"],
                "research_status": "preserved_existing",
                "research_refs": [],
                "remaining": "Existing work retained for validation coverage.",
            } for author in batch_authors for work in author["works"]]
            objects.append({
                "object_ref": work_id,
                "research_status": "reviewed_attributed_study",
                "research_refs": [source_id],
                "remaining": "Synthetic test entry only.",
            })
            coverage = {"task_id": "TASK-110", "scope": "Synthetic fixture only.", "objects": objects}
            coverage_path = batch_dir / "COVERAGE.json"
            coverage_path.write_text(json.dumps(coverage, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

            gate = {
                "verdict": "PASS",
                "task_id": "TASK-110",
                "reviewer": "TEST-ONLY",
                "checkpoint_date": "2026-10-03",
                "baseline_database_sha256": baseline_sha,
                "packages": [{"file": "CANDIDATES.json", "sha256": hashlib.sha256(candidate_path.read_bytes()).hexdigest(), "verdict": "PASS"}],
                "coverage_sha256": hashlib.sha256(coverage_path.read_bytes()).hexdigest(),
                "registration_sha256": hashlib.sha256(registration_path.read_bytes()).hexdigest(),
                "research_note_gate": {
                    "field": "research_note",
                    "source_grade_rule": {"A": "scholarly_paraphrase", "B": None, "C": None},
                    "material_class": "scholarly_paraphrase",
                    "entries": [{
                        "candidate_id": work_id + "-F04",
                        "source_refs": [source_id],
                        "source_grades": {source_id: "A"},
                        "material_class": "scholarly_paraphrase",
                    }],
                },
            }
            (batch_dir / "REVIEW_GATE.json").write_text(json.dumps(gate, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

            validation = __import__("validate_wcd10_candidates").validate(repo, package)
            self.assertEqual(validation["verdict"], "pass", validation["errors"])
            before_sha = hashlib.sha256(database.read_bytes()).hexdigest()
            sql, mapping = prepare(repo, batch_dir)
            self.assertEqual(hashlib.sha256(database.read_bytes()).hexdigest(), before_sha)
            fact_id = mapping["id_map"][work_id + "-F04"]
            self.assertIn(f"('{fact_id}','{work_id}-F04'", sql)
            self.assertIn("'research_note','" + note_value + "','scholarly_paraphrase'", sql)
            self.assertIn("'A','attributed_study','yes','yes'", sql)
            source_row = next(item for item in mapping["cards"] if item["subject_id"] == mapping["id_map"][work_id])
            self.assertTrue(source_row["card_id"])


if __name__ == "__main__":
    unittest.main()
