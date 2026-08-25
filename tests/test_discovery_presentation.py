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

    def test_institutions_are_allowed_as_literary_context(self) -> None:
        allowed = (
            "博尔赫斯曾任阿根廷国家图书馆馆长。",
            "小说写于他在大学任教期间。",
            "这场文学活动由 Fundación Cultural 举办。",
            "认识博尔赫斯，也可以从图书馆、迷宫和悖论进入。",
        )
        for sentence in allowed:
            with self.subTest(sentence=sentence):
                self.assertFalse(MODULE.contains_internal_reader_language(sentence))
                self.assertEqual(MODULE.clean_reader_value(sentence), sentence)
        borges = next(
            item for item in self.first["reader_content"]["authors"]
            if item["target_id"] == "V1-ENT-0002"
        )
        self.assertIn("图书馆、迷宫和悖论", borges["why_know"])

    def test_institution_source_process_language_is_rejected(self) -> None:
        forbidden = (
            "ABL 书目列出作品出版于 1956 年。",
            "国家图书馆页面确认该书出版于 1956 年。",
            "Universidad 档案记录了作品的首版年份。",
            "基金会资料支持这一作者关系。",
            "官方一句话释义仅覆盖其中两部作品。",
            "一部诗集如何被官方书目与获奖理由定义？",
            "先从官方书目进入，再决定是否补充具体文学地点。",
            "回看官方资料对其出版位置的说明。",
            "回到官方资料所说的玛雅传说来源。",
            "先读作品的书目位置，再看年代记录与文类标注。",
            "把文学评价与研究证据分开阅读。",
            "先从书目入口与书目事实进入。",
            "再读作品的 1958 年记录与 1964 年出版信息。",
        )
        for sentence in forbidden:
            with self.subTest(sentence=sentence):
                self.assertTrue(MODULE.contains_internal_reader_language(sentence))
                self.assertIsNone(MODULE.clean_reader_value(sentence))


if __name__ == "__main__":
    unittest.main()
