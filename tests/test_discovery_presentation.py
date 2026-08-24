from __future__ import annotations

import importlib.util
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location(
    "build_v2_web_data",
    ROOT / "scripts" / "build_v2_web_data.py",
)
MODULE = importlib.util.module_from_spec(SPEC)
assert SPEC.loader is not None
SPEC.loader.exec_module(MODULE)


class DiscoveryPresentationTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.first = MODULE.build_data(
            MODULE.DEFAULT_DB,
            MODULE.DEFAULT_GEO,
            MODULE.DEFAULT_CURATION,
            MODULE.DEFAULT_PRESENTATION,
            MODULE.DEFAULT_PUBLIC_CONTENT,
            "2026-08-22T12:00:00Z",
        )
        cls.second = MODULE.build_data(
            MODULE.DEFAULT_DB,
            MODULE.DEFAULT_GEO,
            MODULE.DEFAULT_CURATION,
            MODULE.DEFAULT_PRESENTATION,
            MODULE.DEFAULT_PUBLIC_CONTENT,
            "2026-08-22T12:00:00Z",
        )

    def test_ranking_is_deterministic_and_covers_public_catalogs(self) -> None:
        first = self.first["presentation"]["discovery"]
        second = self.second["presentation"]["discovery"]
        self.assertEqual(first, second)
        self.assertEqual(first["algorithm_version"], "web-0.2-popularity-v1")
        self.assertEqual(first["tie_break"], "target_id_ascending")
        for group in ("authors", "works"):
            rows = first[group]
            self.assertEqual(
                {item["target_id"] for item in rows},
                set(self.first["public_scope"][group]),
            )
            self.assertEqual([item["rank"] for item in rows], list(range(1, len(rows) + 1)))
            self.assertEqual(rows, sorted(rows, key=lambda item: (-item["score"], item["target_id"])))
            for item in rows:
                self.assertEqual(item["score"], sum(item["factors"].values()))

    def test_reader_projection_covers_catalogs_without_process_language(self) -> None:
        for group in ("authors", "works"):
            records = self.first["reader_content"][group]
            self.assertEqual(
                {item["target_id"] for item in records},
                set(self.first["public_scope"][group]),
            )
            for record in records:
                self.assertFalse(MODULE.contains_internal_reader_language(record), record["target_id"])


if __name__ == "__main__":
    unittest.main()
