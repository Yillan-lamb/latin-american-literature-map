#!/usr/bin/env python3
"""Append evidence-bound full-site curation drafts while preserving existing N2 records."""

from __future__ import annotations

import argparse
import csv
import json
import re
import sqlite3
from collections import defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DB = ROOT / "data/master/V1_MASTER.sqlite"
CURATION = ROOT / "data/v2/curation"
GEO = ROOT / "data/v2/geo/PLACES_GEO.csv"
REPORT = ROOT / "data/v2/qa/V2_CURATION_BATCH_BUILD.json"
DATE = "2026-08-11"
SCHEMA = "v2-curation-0.1"

ENTRY_FIELDS = ["curation_id", "target_type", "target_id", "field_key", "content_zh", "status", "draft_origin", "research_refs", "source_refs", "basis_note", "display_scope", "sort_order", "created_at", "reviewed_at", "reviewer", "review_note", "schema_version"]


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(encoding="utf-8-sig", newline="") as handle:
        return list(csv.DictReader(handle))


def write_csv(path: Path, fields: list[str], rows: list[dict[str, str]]) -> None:
    with path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def summary_from_card(markdown: str) -> str:
    for line in markdown.splitlines():
        if "一句话简介" in line:
            return line.split("：", 1)[1].strip() if "：" in line else line.strip()
    return ""


def source_ids_for_card(conn: sqlite3.Connection, card_id: str) -> list[str]:
    return [row[0] for row in conn.execute("SELECT source_id FROM card_sources WHERE card_id=? AND usage_status='used' ORDER BY source_id", (card_id,))]


def main(dry_run: bool = False) -> int:
    entries_path = CURATION / "CURATION_ENTRIES.csv"
    entries = read_csv(entries_path)
    existing_keys = {(row["target_id"], row["field_key"]) for row in entries}
    next_id = max([int(match.group(1)) for row in entries for match in [re.search(r"(\d+)$", row["curation_id"])] if match] + [0]) + 1
    created: list[dict[str, str]] = []
    counts = defaultdict(int)

    with sqlite3.connect(DB) as conn:
        conn.row_factory = sqlite3.Row
        cards = [dict(row) for row in conn.execute("SELECT * FROM content_cards WHERE card_type IN ('author','work') ORDER BY card_id")]
        relation_source_map: dict[str, list[str]] = defaultdict(list)
        for row in conn.execute("SELECT relationship_id, source_id FROM relationship_sources ORDER BY relationship_id, source_id"):
            relation_source_map[row[0]].append(row[1])
        relation_rows = [dict(row) for row in conn.execute("SELECT relationship_id, subject_id, object_id, relation_type, description_zh, confidence, review_status FROM relationships WHERE relation_type IN ('ASSOCIATED_WITH_PLACE','SET_IN') ORDER BY relationship_id")]

    geo = {row["place_id"]: row for row in read_csv(GEO)}
    place_names = {row["place_id"]: row["name_zh"] for row in geo.values()}
    relation_by_place: dict[str, list[dict[str, str]]] = defaultdict(list)
    for relation in relation_rows:
        relation["target_name_zh"] = place_names.get(relation["object_id"], relation["object_id"])
        relation_by_place[relation["object_id"]].append(relation)

    def add_entry(target_type: str, target_id: str, field_key: str, content: str, status: str, research_refs: list[str], source_refs: list[str], basis: str, note: str) -> None:
        nonlocal next_id
        if (target_id, field_key) in existing_keys:
            counts["skipped_existing"] += 1
            return
        curation_id = f"V2-CUR-FULL-{next_id:03d}"
        next_id += 1
        row = {
            "curation_id": curation_id,
            "target_type": target_type,
            "target_id": target_id,
            "field_key": field_key,
            "content_zh": content,
            "status": status,
            "draft_origin": "codex",
            "research_refs": ";".join(research_refs),
            "source_refs": ";".join(source_refs),
            "basis_note": basis,
            "display_scope": "detail;search" if target_type in {"author", "work"} else "map;detail",
            "sort_order": "",
            "created_at": DATE,
            "reviewed_at": DATE,
            "reviewer": "CODEX",
            "review_note": note,
            "schema_version": SCHEMA,
        }
        created.append(row)
        existing_keys.add((target_id, field_key))
        counts[status] += 1

    for card in cards:
        target_id = card["subject_id"]
        summary = summary_from_card(card["content_markdown"] or "")
        sources = source_ids_for_card(conn, card["card_id"])
        if card["card_type"] == "author":
            field_key = "page_lede"
            target_type = "author"
        else:
            field_key = "one_line_summary"
            target_type = "work"
        if card["source_minimum_status"] == "meets" and summary:
            basis = "由 V1 内容卡的一句话简介机械转换；不新增研究事实。"
            if "来源论文观点" in summary:
                basis += "保留内容卡的来源归属措辞。"
            add_entry(target_type, target_id, field_key, summary, "auto_approved", [card["card_id"]], sources, basis, "批量来源核验通过；可进入公共阅读层")
        else:
            reason = "V1 内容卡标记为 research_gap" if card["source_minimum_status"] == "research_gap" else "没有可安全转换的一句话简介"
            content = f"当前页面保留研究状态：{reason}。暂不生成确定性策展导语。"
            add_entry(target_type, target_id, field_key, content, "hold", [card["card_id"]], sources, "依据不足，批量草稿保持 hold，不用写作替代研究补证。", "保持 hold；不进入公共阅读层")

    for target_id, relations in relation_by_place.items():
        location = geo.get(target_id, {})
        target_type = "fictional_space" if location.get("reality_status") == "fictional" else "place"
        relation_ids = [relation["relationship_id"] for relation in relations]
        source_ids = sorted({source_id for relation in relations for source_id in relation_source_map.get(relation["relationship_id"], [])})
        descriptions = [relation["description_zh"] for relation in relations if relation["description_zh"]]
        if location.get("classification_status") == "hold" or location.get("reality_status") == "unknown":
            content = f"该地点保留 V1 文学关系，但现实/虚构分类仍待核验；当前不生成确定性地点导语。"
            add_entry(target_type, target_id, "literary_place_note", content, "hold", relation_ids, source_ids, "地点分类未完成；不以策展文字代替地理与文学证据。", "保持 hold；不进入公共阅读层")
        else:
            prefix = "文学关系中，" if target_type == "fictional_space" else "V1 已审核地点关系显示，"
            content = prefix + "；".join(descriptions) + (" 当前作为文学虚构空间呈现，不使用现实坐标。" if target_type == "fictional_space" else "")
            add_entry(target_type, target_id, "literary_place_note" if target_type == "place" else "fictional_space_note", content, "auto_approved", relation_ids, source_ids, "由 V1 已审核地点关系聚合；不增加关系类型或地点事实。", "来源核验通过；可进入公共阅读层")

    entries.extend(created)
    report = {
        "generated_at": DATE,
        "output": str(entries_path.relative_to(ROOT)),
        "existing_entries": len(entries) - len(created),
        "created_entries": len(created),
        "total_entries": len(entries),
        "status_counts_created": dict(sorted(counts.items())),
        "rule": "V1 content cards and accepted place relations only; research gaps and unresolved place classification remain hold",
    }
    if not dry_run:
        write_csv(entries_path, ENTRY_FIELDS, entries)
        REPORT.parent.mkdir(parents=True, exist_ok=True)
        REPORT.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report, ensure_ascii=False, sort_keys=True))
    return 0


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--dry-run", action="store_true", help="Compute the curation batch without writing files")
    args = parser.parse_args()
    raise SystemExit(main(args.dry_run))
