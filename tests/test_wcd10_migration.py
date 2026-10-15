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
from build_wcd10_migration import prepare
from validate_master import validate_database

BATCH = ROOT / "data/changesets/WCD-10/B01"
MIGRATION = ROOT / "data/master/migrations/0036_wcd10_b01_author_works.sql"
_MISSING = object()


class WCD10MigrationTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory(prefix="wcd10-migration-test-")
        self.addCleanup(self.temporary.cleanup)
        self.repo = Path(self.temporary.name)
        self.b07_fixture_counter = 0
        self.database = self.repo / "data/master/V1_MASTER.sqlite"
        self.database.parent.mkdir(parents=True)
        self.database.write_bytes(subprocess.check_output([
            "git", "show", "05f3372c69a54ec331d31b05d16c8288d6d3a993:data/master/V1_MASTER.sqlite"], cwd=ROOT))
        curation = self.repo / "data/v2/curation/PUBLIC_CONTENT.json"
        curation.parent.mkdir(parents=True)
        shutil.copy2(ROOT / "data/v2/curation/PUBLIC_CONTENT.json", curation)
        self.batch = self.repo / "data/changesets/WCD-10/B01"
        shutil.copytree(BATCH, self.batch)
        self.sql = MIGRATION.read_text(encoding="utf-8")

    def apply_in_transaction(self, sql):
        with closing(sqlite3.connect(self.database)) as conn:
            conn.execute("PRAGMA foreign_keys=ON")
            try:
                conn.executescript("BEGIN;\n" + sql + "\nCOMMIT;")
            except Exception:
                conn.rollback()
                raise

    def make_b07_test_batch(self, created_description_zh_marker=_MISSING):
        self.b07_fixture_counter += 1
        batch = self.repo / "data/changesets/WCD-10" / f"B07-test-{self.b07_fixture_counter}"
        batch.mkdir(parents=True)
        baseline_sha = hashlib.sha256(self.database.read_bytes()).hexdigest()
        package = {
            "schema": "wcd10-candidate-change-set-1",
            "task_id": "TASK-112",
            "batch_id": "WCD-10-B07",
            "baseline_commit": "05f3372c69a54ec331d31b05d16c8288d6d3a993",
            "baseline_database_sha256": baseline_sha,
            "status": "candidate_only",
            "author_ids": ["V1-ENT-0186", "V1-ENT-0198", "V1-ENT-0199"],
            "accessed_at": "2026-10-10",
            "public_boundary": "Research-only; no Curation or public admission.",
            "source_scope_decisions": [],
            "sources": [{
                "candidate_id": "WCD10-B07-S001",
                "title": "Test source",
                "author_or_editor": "Test institution",
                "url": "https://example.org/wcd10-b07-test-source",
                "source_level": "B",
                "access_status": "OPENED",
                "locator": "Test locator",
                "usage": "Test-only direct attribution and bibliography support.",
            }],
            "new_entities": [{
                "candidate_id": "WCD10-B07-W001",
                "author_id": "V1-ENT-0186",
                "entity_type": "collection",
                "original_name": "Test Compiler Anthology",
                "name_zh_candidate": "《Test Compiler Anthology》",
                "name_policy": "Test-only title.",
                "rationale": "Test-only role-scoped collection candidate.",
                "created_source_refs": ["WCD10-B07-S001"],
                "facts": [
                    {"field": "first_publication_year", "value": "2001", "source_refs": ["WCD10-B07-S001"]},
                    {"field": "genre_or_form", "value": "anthology", "source_refs": ["WCD10-B07-S001"]},
                    {"field": "one_sentence_summary", "value": "A test anthology.", "source_refs": ["WCD10-B07-S001"]},
                ],
            }],
            "existing_facts": [],
            "extra_relationships": [],
            "deferred": [],
        }
        if created_description_zh_marker is not _MISSING:
            package["new_entities"][0]["created_description_zh"] = created_description_zh_marker
        package_path = batch / "CANDIDATES.json"
        package_path.write_text(json.dumps(package, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        with closing(sqlite3.connect(self.database)) as conn:
            legacy_work_ids = [row[0] for row in conn.execute(
                "SELECT DISTINCT object_id FROM relationships WHERE relation_type='CREATED' "
                "AND subject_id IN ('V1-ENT-0186','V1-ENT-0198','V1-ENT-0199') ORDER BY object_id"
            )]
        coverage_objects = [{"object_ref": work_id, "research_status": "preserved_existing_A_not_fresh",
                             "research_refs": []} for work_id in legacy_work_ids]
        coverage_objects.append({
            "object_ref": "WCD10-B07-W001",
            "entity": {"entity_id": "WCD10-B07-W001", "entity_type": "collection",
                       "name_zh": "《Test Compiler Anthology》", "original_name": "Test Compiler Anthology"},
            "bibliography": "Temporary test fixture.",
            "description": "Temporary test fixture.",
            "research_status": "bounded_direct_study",
            "research_refs": ["WCD10-B07-S001"],
            "old_facts": [], "cards": [], "card_sources": [], "relations": [], "source_objects": [],
            "fresh_review": {"candidate_status": "proposed"}, "remaining": [],
        })
        coverage = {
            "task_id": "TASK-112",
            "batch_id": "WCD-10-B07",
            "baseline_database_sha256": baseline_sha,
            "scope": "Temporary test fixture only.",
            "author_descriptions": {},
            "research_policy": {},
            "objects": coverage_objects,
            "deferred_objects": [],
            "author_context": {},
            "result": "Test-only fixture.",
        }
        registration = {
            "task_id": "TASK-112",
            "batch_id": "WCD-10-B07",
            "accessed_at": "2026-10-10",
            "verified_by": "WCD10 migration unit test",
            "source_year_policy": {},
            "public_content_scope": "Research-only; test fixture.",
            "local_asset_status": "remote_only",
            "copyright_boundary": "Test fixture; no public content admission.",
            "profiles": [{
                "candidate_id": "WCD10-B07-S001",
                "publisher": "Test institution",
                "format": "test_web_page",
                "language": "es",
                "publication_year": "",
                "notes": "Test-only source profile.",
                "disposition": "new",
            }],
            "author_registrations": {},
        }
        coverage_path = batch / "COVERAGE.json"
        registration_path = batch / "SOURCE_REGISTRATION.json"
        coverage_path.write_text(json.dumps(coverage, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        registration_path.write_text(json.dumps(registration, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        gate = {
            "verdict": "PASS",
            "task_id": "TASK-112",
            "batch_id": "WCD-10-B07",
            "reviewer": "WCD10 migration unit test",
            "reviewed_at": "2026-10-10",
            "checkpoint_date": "2026-10-10",
            "baseline_database_sha256": baseline_sha,
            "packages": [{"file": "CANDIDATES.json", "sha256": hashlib.sha256(package_path.read_bytes()).hexdigest(),
                          "verdict": "PASS"}],
            "coverage_sha256": hashlib.sha256(coverage_path.read_bytes()).hexdigest(),
            "registration_sha256": hashlib.sha256(registration_path.read_bytes()).hexdigest(),
        }
        (batch / "REVIEW_GATE.json").write_text(json.dumps(gate, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        return batch, package

    def update_test_source_profile(self, batch, key, value=_MISSING):
        registration_path = batch / "SOURCE_REGISTRATION.json"
        registration = json.loads(registration_path.read_text(encoding="utf-8"))
        profile = registration["profiles"][0]
        if value is _MISSING:
            profile.pop(key, None)
        else:
            profile[key] = value
        registration_path.write_text(json.dumps(registration, ensure_ascii=False, indent=2) + "\n",
                                     encoding="utf-8")
        gate_path = batch / "REVIEW_GATE.json"
        gate = json.loads(gate_path.read_text(encoding="utf-8"))
        gate["registration_sha256"] = hashlib.sha256(registration_path.read_bytes()).hexdigest()
        gate_path.write_text(json.dumps(gate, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

    def test_preparation_matches_reviewed_artifacts_without_writing_database(self):
        before = hashlib.sha256(self.database.read_bytes()).hexdigest()
        sql, mapping = prepare(self.repo, self.batch)
        self.assertEqual(sql, self.sql)
        self.assertEqual(mapping, json.loads((BATCH / "INTEGRATION_MAP.json").read_text(encoding="utf-8")))
        self.assertEqual(hashlib.sha256(self.database.read_bytes()).hexdigest(), before)

    def test_changed_candidate_cannot_bypass_hash_gate(self):
        path = self.batch / "CANDIDATES.json"
        path.write_text(path.read_text(encoding="utf-8") + "\n", encoding="utf-8")
        with self.assertRaisesRegex(ValueError, "unreviewed or changed"):
            prepare(self.repo, self.batch)

    def test_new_supplement_cannot_reuse_frozen_legacy_note_exception(self):
        supplement = self.batch / "SUPPLEMENT.json"
        supplement.write_bytes(supplement.read_bytes() + b" ")
        gate_path = self.batch / "REVIEW_GATE.json"
        gate = json.loads(gate_path.read_text(encoding="utf-8"))
        supplement_gate = next(item for item in gate["packages"] if item["file"] == "SUPPLEMENT.json")
        supplement_gate["sha256"] = hashlib.sha256(supplement.read_bytes()).hexdigest()
        gate_path.write_text(json.dumps(gate), encoding="utf-8")
        with self.assertRaisesRegex(ValueError, "exact frozen, reviewed package file/SHA set"):
            prepare(self.repo, self.batch)

    def test_real_execution_preserves_existing_rows_and_states(self):
        with closing(sqlite3.connect(self.database)) as conn:
            tables = ("entities", "facts", "content_cards", "card_facts", "card_sources", "relationships", "relation_holds", "source_holds")
            before = {table: set(conn.execute("SELECT * FROM " + table)) for table in tables}
        self.apply_in_transaction(self.sql)
        self.assertEqual(validate_database(self.database)["verdict"], "pass")
        with closing(sqlite3.connect(self.database)) as conn:
            for table, rows in before.items():
                self.assertTrue(rows <= set(conn.execute("SELECT * FROM " + table)), table)
            self.assertEqual(conn.execute("SELECT COUNT(*) FROM entities").fetchone()[0], 387)
            self.assertEqual(conn.execute("SELECT COUNT(*) FROM facts").fetchone()[0], 1076)
            self.assertEqual(conn.execute("SELECT COUNT(*) FROM sources").fetchone()[0], 339)
            self.assertEqual(conn.execute("SELECT COUNT(*) FROM relationships").fetchone()[0], 345)
            self.assertEqual(conn.execute("SELECT COUNT(*) FROM card_facts cf JOIN facts f USING(fact_id) WHERE cf.admission_status IS NULL OR cf.admission_status != f.admission_status").fetchone()[0], 0)
            self.assertEqual(conn.execute("SELECT COUNT(*) FROM card_sources WHERE card_source_id BETWEEN 'V1-CS-0537' AND 'V1-CS-0562' AND research_support='yes'").fetchone()[0], 1)
            legacy_created = conn.execute(
                "SELECT r.description_zh FROM relationships r "
                "JOIN entities e ON e.entity_id=r.object_id "
                "WHERE r.subject_id='V1-ENT-0002' AND r.relation_type='CREATED' "
                "AND e.original_name='Ficciones'"
            ).fetchone()[0]
            self.assertEqual(legacy_created, "博尔赫斯创作短篇集《虚构集》")
            card = conn.execute("SELECT content_markdown FROM content_cards WHERE card_id='V1-CARD-0279'").fetchone()[0]
            self.assertIn("#### 署名研究说明（research_note_only）", card)
            self.assertNotIn("first_book_edition_year", " ".join(r[0] for r in conn.execute("SELECT fact_field FROM facts WHERE subject_id='V1-ENT-0045'")))

    def test_role_specific_created_description_survives_prepare_and_clone_apply(self):
        batch, _ = self.make_b07_test_batch("Ernesto Sábato编选《Test Compiler Anthology》")
        sql, mapping = prepare(self.repo, batch)
        self.apply_in_transaction(sql)
        relationship_id = mapping["relationships"][0]["relationship_id"]
        source_id = mapping["id_map"]["WCD10-B07-S001"]
        with closing(sqlite3.connect(self.database)) as conn:
            stored = conn.execute("SELECT description_zh FROM relationships WHERE relationship_id=?",
                                  (relationship_id,)).fetchone()[0]
            publisher = conn.execute("SELECT publisher FROM sources WHERE source_id=?", (source_id,)).fetchone()[0]
        self.assertEqual(stored, "Ernesto Sábato编选《Test Compiler Anthology》")
        self.assertEqual(publisher, "Test institution")

    def test_empty_publisher_prepares_and_reads_back_from_temporary_clone(self):
        batch, _ = self.make_b07_test_batch()
        self.update_test_source_profile(batch, "publisher", "")
        sql, mapping = prepare(self.repo, batch)
        self.apply_in_transaction(sql)
        source_id = mapping["id_map"]["WCD10-B07-S001"]
        with closing(sqlite3.connect(self.database)) as conn:
            publisher = conn.execute("SELECT publisher FROM sources WHERE source_id=?", (source_id,)).fetchone()[0]
        self.assertEqual(publisher, "")
        self.assertEqual(validate_database(self.database)["verdict"], "pass")

    def test_missing_null_and_non_string_publishers_are_rejected_by_prepare(self):
        invalid_profiles = (
            ("missing", _MISSING),
            ("null", None),
            ("list", []),
        )
        for label, value in invalid_profiles:
            with self.subTest(value=label):
                batch, _ = self.make_b07_test_batch()
                self.update_test_source_profile(batch, "publisher", value)
                with self.assertRaisesRegex(ValueError, "invalid source registration publisher"):
                    prepare(self.repo, batch)

    def test_blank_non_string_format_and_language_are_rejected_by_prepare(self):
        invalid_values = (_MISSING, None, [], "", " \t ")
        for key in ("format", "language"):
            for value in invalid_values:
                with self.subTest(key=key, value=value):
                    batch, _ = self.make_b07_test_batch()
                    self.update_test_source_profile(batch, key, value)
                    with self.assertRaisesRegex(ValueError, "incomplete source registration"):
                        prepare(self.repo, batch)

    def test_new_entity_without_created_description_keeps_default_after_clone_apply(self):
        batch, package = self.make_b07_test_batch()
        entity = package["new_entities"][0]
        self.assertNotIn("created_description_zh", entity)
        with closing(sqlite3.connect(self.database)) as conn:
            author_name = conn.execute("SELECT name_zh FROM entities WHERE entity_id=?",
                                       (entity["author_id"],)).fetchone()[0]
        expected = author_name + "创作 " + entity["original_name"]

        sql, mapping = prepare(self.repo, batch)
        self.apply_in_transaction(sql)
        relationship_id = mapping["relationships"][0]["relationship_id"]
        with closing(sqlite3.connect(self.database)) as conn:
            stored = conn.execute("SELECT description_zh FROM relationships WHERE relationship_id=?",
                                  (relationship_id,)).fetchone()[0]
        self.assertEqual(stored, expected)

    def test_invalid_created_description_is_rejected_by_prepare(self):
        for invalid in (None, [], "", " \t "):
            with self.subTest(value=invalid):
                batch, _ = self.make_b07_test_batch(invalid)
                with self.assertRaisesRegex(ValueError, "invalid created_description_zh override"):
                    prepare(self.repo, batch)

    def test_precondition_drift_is_rejected_without_partial_insertion(self):
        with closing(sqlite3.connect(self.database)) as conn:
            conn.execute("UPDATE metadata SET value='other_change' WHERE key='last_change_set'")
            conn.commit()
        before = hashlib.sha256(self.database.read_bytes()).hexdigest()
        with self.assertRaises(sqlite3.IntegrityError):
            self.apply_in_transaction(self.sql)
        self.assertEqual(hashlib.sha256(self.database.read_bytes()).hexdigest(), before)

    def test_mid_migration_foreign_key_failure_rolls_back_all_rows(self):
        before = hashlib.sha256(self.database.read_bytes()).hexdigest()
        broken = self.sql.replace("'V1-ENT-0022','故事中", "'V1-ENT-9999','故事中")
        self.assertNotEqual(broken, self.sql)
        with self.assertRaises(sqlite3.IntegrityError):
            self.apply_in_transaction(broken)
        self.assertEqual(hashlib.sha256(self.database.read_bytes()).hexdigest(), before)

    def test_duplicate_migration_is_rejected(self):
        self.apply_in_transaction(self.sql)
        before = hashlib.sha256(self.database.read_bytes()).hexdigest()
        with self.assertRaises(sqlite3.IntegrityError):
            self.apply_in_transaction(self.sql)
        self.assertEqual(hashlib.sha256(self.database.read_bytes()).hexdigest(), before)


if __name__ == "__main__":
    unittest.main()
