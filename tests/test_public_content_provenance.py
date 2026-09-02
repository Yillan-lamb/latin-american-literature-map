from __future__ import annotations

import csv
import importlib.util
import sqlite3
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

    def test_wcd06_location_notes_have_exact_claim_level_provenance(self) -> None:
        expected = {
            "V1-ENT-0018": ("故事发生在里约热内卢；玛卡贝娅是一名生活困窘的打字员。", ["V1-FCT-0256"], ["SRC-0085"]),
            "V1-ENT-0032": ("伊斯特佩克是小说的核心村镇，并作为全知叙述者发声。", ["V1-FCT-0078"], ["SRC-0020"]),
            "V1-ENT-0035": ("故事发生在恰帕斯村镇，白人世界与 chontal 印第安世界的张力在这里展开。", ["V1-FCT-0092", "V1-REL-0033"], ["SRC-0023"]),
            "V1-ENT-0038": ("胡安·普雷西亚多前往科马拉寻找父亲，并逐渐听见这座村镇的过去。", ["V1-FCT-0255"], ["SRC-0084"]),
            "V1-ENT-0075": ("马孔多是小说中的虚构城镇，布恩迪亚—伊瓜兰家族在这里延续数代。", ["V1-FCT-0239"], ["SRC-0075"]),
            "V1-ENT-0076": ("故事发生在戒严中的哥伦比亚小村镇。", ["V1-FCT-0254"], ["SRC-0083"]),
            "V1-ENT-0077": ("故事发生在一座小镇；叙述者二十多年后重返这里，重新调查圣地亚哥·纳萨尔之死。", ["V1-FCT-0249"], ["SRC-0080"]),
            "V1-ENT-0081": ("故事跨越十八世纪末的古巴、加勒比海与瓜德罗普。", ["V1-FCT-0259"], ["SRC-0086"]),
            "V1-ENT-0117": ("圣地亚哥·萨瓦拉与安布罗西奥在名为“大教堂”的酒吧交谈，话题由此打开奥德里亚独裁时期的私人记忆与社会关系。", ["V1-FCT-0246"], ["SRC-0078"]),
            "V1-ENT-0118": ("故事围绕十九世纪巴西腹地的卡努杜斯共同体展开。", ["V1-FCT-0250"], ["SRC-0081"]),
            "V1-ENT-0019": ("作品从城市与家庭场景切入人物的内心生活与家庭关系。", ["V1-FCT-0045"], ["SRC-0009"]),
            "V1-ENT-0146": ("故事发生在墨西哥城，并通过城市日常与不同社会阶层的声音展开。", ["V1-FCT-0266", "V1-FCT-0267"], ["SRC-0089", "SRC-0090"]),
        }
        works = {item["target_id"]: item for item in self.payload["works"]}
        forbidden = (
            "当前地图", "现有地图", "正式地图关系", "地图坐标", "地图点",
            "现实坐标", "稳定映射", "正式准入", "只作区域说明", "不生成", "不伪造",
        )

        for target_id, (content, research_refs, source_refs) in expected.items():
            note = works[target_id]["location_note"]
            self.assertEqual(note["status"], "auto_approved", target_id)
            self.assertEqual(note["content"], content, target_id)
            self.assertEqual(note["research_refs"], research_refs, target_id)
            self.assertEqual(note["source_refs"], source_refs, target_id)
            self.assertFalse(any(token in content for token in forbidden), target_id)

        for target_id in ("V1-ENT-0017", "V1-ENT-0079"):
            self.assertEqual(works[target_id]["location_note"]["status"], "user_review")

        connection = sqlite3.connect(ROOT / "data" / "master" / "V1_MASTER.sqlite")
        try:
            for target_id, (_, research_refs, source_refs) in expected.items():
                linked_sources: set[str] = set()
                for research_ref in research_refs:
                    if research_ref.startswith("V1-FCT-"):
                        rows = connection.execute(
                            "SELECT source_id FROM fact_sources WHERE fact_id = ?", (research_ref,)
                        )
                    else:
                        rows = connection.execute(
                            "SELECT source_id FROM relationship_sources WHERE relationship_id = ?",
                            (research_ref,),
                        )
                    linked_sources.update(row[0] for row in rows)
                self.assertEqual(linked_sources, set(source_refs), target_id)
        finally:
            connection.close()

        with (ROOT / "data/changesets/WCD-06/review/LOCATION_NOTE_PROVENANCE_AUDIT.csv").open(
            encoding="utf-8", newline=""
        ) as handle:
            audit_rows = list(csv.DictReader(handle))
        self.assertEqual({row["target_id"] for row in audit_rows}, set(expected) | {"V1-ENT-0017", "V1-ENT-0079"})


if __name__ == "__main__":
    unittest.main()
