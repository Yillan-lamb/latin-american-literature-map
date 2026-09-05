from __future__ import annotations

import importlib.util
import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    assert spec.loader is not None
    spec.loader.exec_module(module)
    return module


BUILD = load_module("build_v2_deploy_bundle", ROOT / "scripts/build_v2_deploy_bundle.py")


class PublicDeployBoundaryTests(unittest.TestCase):
    def test_clean_bundle_is_scoped_to_public_ids_and_safe_fact_states(self) -> None:
        payload = BUILD.clean_public_data(BUILD.DEFAULT_DATA)
        public_ids = {item["target_id"] for item in payload["search_index"]}
        wcd07a_ids = {f"V1-ENT-{index:04d}" for index in range(374, 380)}

        self.assertTrue(wcd07a_ids.isdisjoint({item["entity_id"] for item in payload["research"]["entities"]}))
        self.assertTrue(wcd07a_ids.isdisjoint({item["subject_id"] for item in payload["research"]["content_cards"]}))
        self.assertTrue(wcd07a_ids.isdisjoint({item["subject_id"] for item in payload["research"]["facts"]}))
        self.assertTrue(
            wcd07a_ids.isdisjoint(
                {item["subject_id"] for item in payload["research"]["relationships"]}
                | {item["object_id"] for item in payload["research"]["relationships"]}
            )
        )
        self.assertTrue(
            all(item["entity_id"] in public_ids for item in payload["research"]["entities"])
        )
        self.assertTrue(
            all(item["public_evidence_status"] in {"verified", "provisional"} for item in payload["research"]["facts"])
        )
        self.assertNotIn("admission_status", json.dumps(payload, ensure_ascii=False))

        public_place_ids = {
            item["place_id"]
            for item in payload["map"]["places"]
            if item["place_id"] in public_ids or item.get("entity_id") in public_ids
        }
        map_place_ids = {item["place_id"] for item in payload["map"]["places"]}
        self.assertNotIn("V2-GEO-ES", public_ids)
        self.assertNotIn("V2-GEO-FR", public_ids)
        self.assertIn("V2-GEO-ES", map_place_ids)
        self.assertIn("V2-GEO-FR", map_place_ids)
        self.assertEqual(map_place_ids - public_place_ids, {"V2-GEO-ES", "V2-GEO-FR"})
        self.assertTrue(
            all(
                not item.get("parent_place_id") or item["parent_place_id"] in map_place_ids
                for item in payload["map"]["places"]
            )
        )

    def test_validator_rejects_non_public_research_rows(self) -> None:
        with tempfile.TemporaryDirectory(prefix="lalm-public-boundary-") as temporary:
            root = Path(temporary)
            BUILD.build(root, BUILD.DEFAULT_DATA, "https://example.invalid/", True)
            data_path = root / "data/v2/web/site_data.json"
            payload = json.loads(data_path.read_text(encoding="utf-8"))
            payload["research"]["entities"].append(
                {
                    "entity_id": "V1-ENT-0374",
                    "entity_type": "work",
                    "name_zh": "《我们的土地》",
                    "original_name": "Terra Nostra",
                }
            )
            data_path.write_text(json.dumps(payload, ensure_ascii=False) + "\n", encoding="utf-8")
            result = subprocess.run(
                [sys.executable, str(ROOT / "scripts/validate_v2_public_bundle.py"), str(root)],
                cwd=ROOT,
                capture_output=True,
                text=True,
                check=False,
            )
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("non-public targets", result.stderr + result.stdout)

    def test_validator_rejects_missing_safe_fact_status(self) -> None:
        with tempfile.TemporaryDirectory(prefix="lalm-public-status-") as temporary:
            root = Path(temporary)
            BUILD.build(root, BUILD.DEFAULT_DATA, "https://example.invalid/", True)
            data_path = root / "data/v2/web/site_data.json"
            payload = json.loads(data_path.read_text(encoding="utf-8"))
            payload["research"]["facts"][0].pop("public_evidence_status")
            data_path.write_text(json.dumps(payload, ensure_ascii=False) + "\n", encoding="utf-8")
            result = subprocess.run(
                [sys.executable, str(ROOT / "scripts/validate_v2_public_bundle.py"), str(root)],
                cwd=ROOT,
                capture_output=True,
                text=True,
                check=False,
            )
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("safe evidence status", result.stderr + result.stdout)

    def test_validator_rejects_missing_map_parent(self) -> None:
        with tempfile.TemporaryDirectory(prefix="lalm-map-parent-") as temporary:
            root = Path(temporary)
            BUILD.build(root, BUILD.DEFAULT_DATA, "https://example.invalid/", True)
            data_path = root / "data/v2/web/site_data.json"
            payload = json.loads(data_path.read_text(encoding="utf-8"))
            madrid = next(item for item in payload["map"]["places"] if item["place_id"] == "V1-ENT-0129")
            madrid["parent_place_id"] = "V2-GEO-MISSING"
            data_path.write_text(json.dumps(payload, ensure_ascii=False) + "\n", encoding="utf-8")
            result = subprocess.run(
                [sys.executable, str(ROOT / "scripts/validate_v2_public_bundle.py"), str(root)],
                cwd=ROOT,
                capture_output=True,
                text=True,
                check=False,
            )
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("missing_parents", result.stderr + result.stdout)

    def test_validator_rejects_unrelated_non_public_map_place(self) -> None:
        with tempfile.TemporaryDirectory(prefix="lalm-map-scope-") as temporary:
            root = Path(temporary)
            BUILD.build(root, BUILD.DEFAULT_DATA, "https://example.invalid/", True)
            data_path = root / "data/v2/web/site_data.json"
            payload = json.loads(data_path.read_text(encoding="utf-8"))
            payload["map"]["places"].append(
                {"place_id": "V2-GEO-UNRELATED", "entity_id": None, "parent_place_id": None}
            )
            data_path.write_text(json.dumps(payload, ensure_ascii=False) + "\n", encoding="utf-8")
            result = subprocess.run(
                [sys.executable, str(ROOT / "scripts/validate_v2_public_bundle.py"), str(root)],
                cwd=ROOT,
                capture_output=True,
                text=True,
                check=False,
            )
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("unrelated_non_public_places", result.stderr + result.stdout)


if __name__ == "__main__":
    unittest.main()
