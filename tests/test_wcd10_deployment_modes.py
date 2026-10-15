"""Exercise the real Pages pipeline, including review-only subjects and canary rows."""
import copy
import json
import shutil
import sqlite3
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from qa_wcd10_ci import SIGNATURES, build_modes, compare_modes, validate_bundle, validate_projection


class Wcd10DeploymentModeTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temp = tempfile.TemporaryDirectory(prefix="wcd10-deployment-modes-")
        cls.addClassCleanup(cls.temp.cleanup)
        cls.directory = Path(cls.temp.name)
        cls.repo = cls.directory / "repo"
        for relative in ("scripts", "site", "data/v2/geo", "data/v2/curation", "data/v2/presentation"):
            shutil.copytree(ROOT / relative, cls.repo / relative,
                            ignore=shutil.ignore_patterns("__pycache__"))
        cls.database = cls.repo / "data/master/V1_MASTER.sqlite"
        cls.database.parent.mkdir(parents=True)
        shutil.copy2(ROOT / "data/master/V1_MASTER.sqlite", cls.database)
        cls.before = cls.directory / "before"
        cls.after = cls.directory / "after"
        cls.before_report = build_modes(cls.repo, cls.before)
        standard = json.loads((cls.before / "standard/data/v2/web/site_data.json").read_text(encoding="utf-8"))
        cls.preview_data = cls.repo / "artifacts/v2-rc5/user-review-preview-web/site_data.json"
        preview = json.loads(cls.preview_data.read_text(encoding="utf-8"))
        standard_ids = {r["target_id"] for r in standard["search_index"]}
        cls.public_work = next(r["target_id"] for r in standard["reader_content"]["works"])
        cls.preview_work = next(r["target_id"] for r in preview["reader_content"]["works"]
                                if r["target_id"] not in standard_ids)
        author = standard["reader_content"]["authors"][0]["target_id"]
        # Put research cards/facts first in sort order to exercise reader
        # fallbacks, timeline years, search context and discovery ranking.
        with sqlite3.connect(cls.database) as conn:
            conn.row_factory = sqlite3.Row
            def insert(table, row):
                columns = ",".join('"' + key + '"' for key in row)
                conn.execute(f'INSERT INTO "{table}" ({columns}) VALUES ({",".join("?" for _ in row)})', list(row.values()))
            for i, subject in enumerate((cls.public_work, cls.preview_work)):
                card = dict(conn.execute("SELECT * FROM content_cards WHERE subject_id=? LIMIT 1", (subject,)).fetchone())
                card.update(card_id=f"0000-CI-CARD-{i}", input_layer="WCD-10-CI-CANARY",
                            issue_code="RESEARCH-ONLY-NOT-CURATED", source_minimum_status="meets",
                            genre_or_form=f"CANARY-GENRE-{i}", period_bucket="0001",
                            content_markdown=f"CANARY-CARD-COPY-{i}")
                insert("content_cards", card)
                for j, field in enumerate(("one_sentence_summary", "first_publication_year", "award")):
                    fact = dict(conn.execute("SELECT * FROM facts WHERE subject_id=? LIMIT 1", (subject,)).fetchone())
                    fact.update(fact_id=f"0000-CI-FACT-{i}-{j}", card_id=card["card_id"],
                                origin_id="WCD-10-CI-CANARY", fact_field=field,
                                value_text="0001" if field == "first_publication_year" else f"CANARY-FACT-COPY-{i}-{j}",
                                admission_status="batch_retained_candidate")
                    insert("facts", fact)
                relation = dict(conn.execute("SELECT * FROM relationships LIMIT 1").fetchone())
                relation.update(relationship_id=f"0000-CI-REL-{i}", origin_layer="WCD-10-CI-CANARY",
                                subject_id=author, object_id=subject, relation_type="CREATED",
                                description_zh=f"CANARY-RELATION-COPY-{i}")
                insert("relationships", relation)
        cls.after_report = build_modes(cls.repo, cls.after)
        cls.full = json.loads(cls.preview_data.read_text(encoding="utf-8"))
        cls.public = json.loads((cls.after / "pages/data/v2/web/site_data.json").read_text(encoding="utf-8"))

    def test_public_and_preview_only_subject_canaries_leave_every_deployed_byte_unchanged(self):
        self.assertNotEqual(self.public_work, self.preview_work)
        result = compare_modes(self.before, self.after)
        self.assertEqual(result["standard"]["identical_files"], 177)
        self.assertEqual(result["pages"]["identical_files"], 327)
        self.assertEqual(self.after_report["standard"]["routes"], 139)
        self.assertEqual(self.after_report["pages"]["routes"], 288)
        self.assertEqual(sum(r["origin_id"] == "WCD-10-CI-CANARY" for r in self.full["research"]["facts"]), 6)
        for table in ("facts", "content_cards", "relationships"):
            self.assertGreater(self.after_report["pages"]["isolation"][table]["research_only_on_deployed_subjects"], 0)

    def assert_rejects_research_row(self, table):
        public = copy.deepcopy(self.public)
        id_key = {"facts": "fact_id", "content_cards": "card_id", "relationships": "relationship_id"}[table]
        row = next(r for r in self.full["research"][table] if str(r.get(id_key)).startswith("0000-CI-"))
        # Match the compact deploy format: origin markers have already gone.
        public["research"][table].append({key: row[key] for key in SIGNATURES[table]})
        with self.assertRaisesRegex(ValueError, "non-admitted " + table):
            validate_projection(self.full, public)

    def test_guard_rejects_research_fact_after_origin_fields_are_stripped(self):
        self.assert_rejects_research_row("facts")

    def test_guard_rejects_research_card_after_origin_fields_are_stripped(self):
        self.assert_rejects_research_row("content_cards")

    def test_guard_rejects_research_relation_between_deployed_endpoints(self):
        self.assert_rejects_research_row("relationships")

    def test_nested_governance_field_is_rejected(self):
        public = copy.deepcopy(self.public)
        public["reader_content"]["works"][0]["reviewer"] = "private workflow state"
        with self.assertRaisesRegex(ValueError, "internal keys"):
            validate_projection(self.full, public)

    def test_raw_governance_file_cannot_be_uploaded_with_pages(self):
        bundle = self.after / "pages"
        unexpected = bundle / "project/internal/TASKS.md"
        unexpected.parent.mkdir(parents=True)
        unexpected.write_text("test-only private governance", encoding="utf-8")
        try:
            with self.assertRaisesRegex(ValueError, "unexpected deployment material"):
                validate_bundle(bundle, self.preview_data, development_preview=True)
        finally:
            unexpected.unlink()

    def test_file_comparison_rejects_actual_payload_changes(self):
        artifact = self.after / "pages/data/v2/web/site_data.json"
        original = artifact.read_bytes()
        try:
            artifact.write_bytes(original + b" ")
            with self.assertRaisesRegex(ValueError, "pages base/head deployment differs"):
                compare_modes(self.before, self.after)
        finally:
            artifact.write_bytes(original)
