from __future__ import annotations

import json
import shutil
import unittest
from unittest.mock import patch

import test_wcd10_b04_migration as B04
import build_v2_web_data as WEB
from build_v2_deploy_bundle import clean_public_data

ROOT = B04.ROOT


class Wcd10PublicBoundaryTests(unittest.TestCase):
    def test_b04_on_existing_public_subject_does_not_change_any_public_projection(self):
        fixture = B04.B04MigrationTests()
        fixture.setUp()
        self.addCleanup(fixture.doCleanups)
        repo = fixture.repo
        for name in ("geo", "curation", "presentation"):
            target = repo / "data/v2" / name
            if target.exists():
                shutil.copytree(ROOT / "data/v2" / name, target, dirs_exist_ok=True)
            else:
                shutil.copytree(ROOT / "data/v2" / name, target)
        def build():
            with patch.object(WEB, "ROOT", repo):
                payload = WEB.build_data(
                    fixture.database, repo / "data/v2/geo", repo / "data/v2/curation",
                    repo / "data/v2/presentation/PUBLIC_PRESENTATION.json",
                    repo / "data/v2/curation/PUBLIC_CONTENT.json", "2026-09-29T00:00:00Z")
            source = repo / "site_data.json"
            source.write_text(json.dumps(payload), encoding="utf-8")
            return payload, clean_public_data(source)
        before, public_before = build()
        fixture.transaction(fixture.sql)
        after, public_after = build()
        self.assertEqual(after["counts"]["facts"] - before["counts"]["facts"], 39)
        fid = fixture.mapping["id_map"]["WCD10-B04-F10"]
        research_fact = next(row for row in after["research"]["facts"] if row["fact_id"] == fid)
        self.assertEqual(research_fact["subject_id"], "V1-ENT-0149")
        self.assertEqual(research_fact["admission_status"], "batch_retained_candidate")
        self.assertIn("V1-ENT-0149", after["public_scope"]["works"])
        self.assertEqual(public_before, public_after)
        self.assertNotIn(research_fact["value_text"], json.dumps(public_after, ensure_ascii=False))

    def test_research_only_markers_do_not_disable_legacy_provisional_facts(self):
        self.assertFalse(WEB.is_research_only({"admission_status": "batch_retained_candidate", "origin_id": "legacy"}))
        for field in ("origin_id", "origin_layer", "input_layer"):
            self.assertTrue(WEB.is_research_only({field: "WCD-10-B99"}))
        self.assertTrue(WEB.is_research_only({"issue_code": "RESEARCH-ONLY-NOT-CURATED"}))


if __name__ == "__main__":
    unittest.main()
