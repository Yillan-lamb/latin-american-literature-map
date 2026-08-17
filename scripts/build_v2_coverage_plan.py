#!/usr/bin/env python3
"""Build the V2 full page coverage inventory from the V1 master and V2 geo layer."""

from __future__ import annotations

import argparse
import csv
import json
import sqlite3
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DB = ROOT / "data/master/V1_MASTER.sqlite"
GEO = ROOT / "data/v2/geo/PLACES_GEO.csv"
WEB = ROOT / "data/v2/web/site_data.json"
OUT = ROOT / "data/v2/qa/V2_PAGE_COVERAGE.csv"


def read_geo() -> dict[str, dict[str, str]]:
    with GEO.open(encoding="utf-8-sig", newline="") as handle:
        return {row["place_id"]: row for row in csv.DictReader(handle)}


def read_web_places() -> dict[str, dict[str, object]]:
    payload = json.loads(WEB.read_text(encoding="utf-8"))
    return {row["place_id"]: row for row in payload["map"]["places"]}


def main(output: Path = OUT, dry_run: bool = False) -> int:
    geo = read_geo()
    web_places = read_web_places()
    with sqlite3.connect(DB) as conn:
        conn.row_factory = sqlite3.Row
        entities = [dict(row) for row in conn.execute("SELECT * FROM entities ORDER BY entity_id")]
        cards = [dict(row) for row in conn.execute("SELECT * FROM content_cards ORDER BY card_id")]
        relation_counts = Counter(row[0] for row in conn.execute("SELECT object_id FROM relationships WHERE relation_type IN ('ASSOCIATED_WITH_PLACE','SET_IN')"))
        author_work_counts = Counter(row[0] for row in conn.execute("SELECT subject_id FROM relationships WHERE relation_type='CREATED'"))

    card_by_subject = {card["subject_id"]: card for card in cards}
    rows: list[dict[str, str | int]] = []

    def add(target_id: str, target_type: str, name_zh: str, page_type: str, page_status: str, card_id: str = "", card_status: str = "", issue_code: str = "", map_status: str = "", relation_count: int = 0, coordinate_status: str = "", page_action: str = "", notes: str = "") -> None:
        rows.append({
            "target_id": target_id,
            "target_type": target_type,
            "name_zh": name_zh,
            "page_type": page_type,
            "page_status": page_status,
            "card_id": card_id,
            "card_status": card_status,
            "issue_code": issue_code,
            "map_status": map_status,
            "relation_count": relation_count,
            "coordinate_status": coordinate_status,
            "page_action": page_action,
            "notes": notes,
        })

    for entity in entities:
        target_id = entity["entity_id"]
        target_type = entity["entity_type"]
        card = card_by_subject.get(target_id)
        if target_type == "author":
            if card and card["card_type"] == "author":
                add(target_id, target_type, entity["name_zh"], "author", "full", card["card_id"], card["source_minimum_status"], card["issue_code"], relation_count=author_work_counts[target_id], page_action="生成完整作者页", notes="V1 作者卡可直接支撑页面骨架")
            else:
                add(target_id, target_type, entity["name_zh"], "author", "related_only", page_action="保留关联节点", notes="无 V1 作者卡；不得用策展文案补足完整页")
        elif target_type == "work":
            if card and card["card_type"] == "work":
                status = "full" if card["source_minimum_status"] == "meets" else "research_gap"
                action = "生成完整作品页" if status == "full" else "生成研究缺口页"
                note = "内容卡满足最低来源状态" if status == "full" else "页面保留研究缺口，不自动生成确定性导语"
                add(target_id, target_type, entity["name_zh"], "work", status, card["card_id"], card["source_minimum_status"], card["issue_code"], relation_count=author_work_counts[target_id], page_action=action, notes=note)
            else:
                add(target_id, target_type, entity["name_zh"], "work", "related_only", page_action="保留关联节点", notes="无 V1 作品卡；不得用策展文案补足完整页")
        elif target_type == "place":
            row = {**geo.get(target_id, {}), **web_places.get(target_id, {})}
            relation_count = relation_counts[target_id]
            if row.get("place_kind") == "country":
                page_type = "country"
            elif row.get("reality_status") == "fictional":
                page_type = "fictional_space"
            elif row.get("reality_status") == "unknown":
                page_type = "unresolved_place"
            else:
                page_type = "real_place"
            if page_type == "country":
                status = "full"
                action = "生成国家页"
                note = "国家层由 parent_place_id 和作者/作品地点关系驱动"
            elif page_type == "unresolved_place":
                status = "research_only"
                action = "保留待确认地点页，不进入默认地图"
                note = "现实/虚构分类未确认；页面不得改写为现实地点或虚构空间"
            elif relation_count:
                status = "full_with_point" if row.get("latitude") and row.get("longitude") else "full_without_point"
                action = "生成文学空间页" if page_type == "fictional_space" else "生成地点页"
                note = "文学空间不使用现实坐标" if page_type == "fictional_space" else "坐标精度与来源在页面显示"
            else:
                status = "research_only"
                action = "保留研究节点，不进入默认地图"
                note = "V1 当前没有正式文学地点关系"
            add(target_id, target_type, entity["name_zh"], page_type, status, map_status=row.get("map_status", ""), relation_count=relation_count, coordinate_status=row.get("coordinate_precision", "none"), page_action=action, notes=note)
        elif target_type == "event":
            add(target_id, target_type, entity["name_zh"], "timeline_node", "background_only", page_action="进入时间线背景节点", notes="历史事件不生成独立地图层")
        elif target_type == "collection":
            add(target_id, target_type, entity["name_zh"], "collection_module", "module_only", card_id=card["card_id"] if card else "", card_status=card["source_minimum_status"] if card else "", issue_code=card["issue_code"] if card else "", page_action="进入作者/作品页关联模块", notes="V2-N2 不单独建设集合页")
        else:
            add(target_id, target_type, entity["name_zh"], "related_node", "research_only", page_action="保留研究关联节点", notes="当前无独立页面模板")

    for place_id, geo_row in geo.items():
        row = {**geo_row, **web_places.get(place_id, {})}
        if not row.get("entity_id") and row.get("place_kind") == "country" and row.get("map_status") != "hidden":
            add(place_id, "country", row["name_zh"], "country", "full", map_status=row.get("map_status", ""), coordinate_status=row.get("coordinate_precision", "none"), page_action="生成国家页", notes="V2 技术父级；不新增 V1 研究实体")

    fieldnames = ["target_id", "target_type", "name_zh", "page_type", "page_status", "card_id", "card_status", "issue_code", "map_status", "relation_count", "coordinate_status", "page_action", "notes"]
    if not dry_run:
        output.parent.mkdir(parents=True, exist_ok=True)
        with output.open("w", encoding="utf-8", newline="") as handle:
            writer = csv.DictWriter(handle, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(rows)

    summary = Counter((row["page_type"], row["page_status"]) for row in rows)
    print(f"coverage_rows={len(rows)}")
    for key, count in sorted(summary.items()):
        print(f"{key[0]}:{key[1]}={count}")
    return 0


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=OUT)
    parser.add_argument("--dry-run", action="store_true", help="Compute coverage without writing files")
    args = parser.parse_args()
    raise SystemExit(main(args.output, args.dry_run))
