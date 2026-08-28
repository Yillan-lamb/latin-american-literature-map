from __future__ import annotations

import csv
import importlib.util
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location(
    "build_v2_public_content",
    ROOT / "scripts" / "build_v2_public_content.py",
)
MODULE = importlib.util.module_from_spec(SPEC)
assert SPEC.loader is not None
SPEC.loader.exec_module(MODULE)


class PublicContentProvenanceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.payload = MODULE.build()

    def test_wcd02_place_refs_require_field_level_semantic_support(self) -> None:
        occurrences: dict[str, list[tuple[str, str, object]]] = {}
        for record in self.payload["places"]:
            for field_key, wrapped in record.items():
                if field_key == "target_id":
                    continue
                for ref in wrapped.get("research_refs", []):
                    if ref.startswith("V1-REL-029") or ref == "V1-REL-0308":
                        occurrences.setdefault(ref, []).append(
                            (record["target_id"], field_key, wrapped.get("content"))
                        )

        self.assertNotIn("V1-REL-0296", occurrences)
        self.assertNotIn("V1-REL-0298", occurrences)
        self.assertNotIn("V1-REL-0299", occurrences)
        self.assertEqual(
            occurrences.get("V1-REL-0308"),
            [
                (
                    "V1-ENT-0096",
                    "reader_path",
                    "阿莱霍·卡彭铁尔 → 《人间王国》 / 《光明世纪》 / 《消逝的足迹》，以加勒比、革命、音乐与时间作为四个继续探索入口。",
                ),
                (
                    "V1-ENT-0096",
                    "exploration_route",
                    "阿莱霍·卡彭铁尔 → 《人间王国》 / 《光明世纪》 / 《消逝的足迹》，以加勒比、革命、音乐与时间作为四个继续探索入口。",
                ),
            ],
        )

    def test_new_city_notes_keep_direct_relationship_provenance(self) -> None:
        with (ROOT / "data/v2/curation/CURATION_ENTRIES.csv").open(
            encoding="utf-8-sig", newline=""
        ) as handle:
            entries = list(csv.DictReader(handle))
        notes = {
            row["target_id"]: row
            for row in entries
            if row["curation_id"].startswith("WCD02-CUR-")
        }
        self.assertEqual(set(notes), {"V1-ENT-0370", "V1-ENT-0371", "V1-ENT-0372", "V1-ENT-0373"})
        for row in notes.values():
            self.assertTrue(row["research_refs"])
            self.assertIn("WCD-02", row["review_note"])


if __name__ == "__main__":
    unittest.main()
