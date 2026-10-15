#!/usr/bin/env python3
"""Read-only WCD-10 inventory. Flags are research prompts, not review verdicts."""
from __future__ import annotations

import argparse
import hashlib
import json
import sqlite3
from collections import Counter
from contextlib import closing
from pathlib import Path

PERIPHERAL = {"V1-ENT-0005", "V1-ENT-0006", "V1-ENT-0007"}
YEARS = {"first_publication_year", "first_book_edition_year", "first_periodical_publication_year"}
DESCRIPTIONS = {"one_sentence_summary", "story_premise"}


def rows(conn, table):
    return [dict(row) for row in conn.execute(f'SELECT * FROM "{table}"')]


def inventory(repo: Path):
    database = repo / "data/master/V1_MASTER.sqlite"
    curation_path = repo / "data/v2/curation/PUBLIC_CONTENT.json"
    curation = json.loads(curation_path.read_text(encoding="utf-8"))
    ids = [author["target_id"] for author in curation["authors"]]
    if len(ids) != 61 or len(set(ids)) != 61 or PERIPHERAL.intersection(ids):
        raise ValueError("WCD-10 roster must contain exactly 61 unique core authors, no peripheral nodes")
    with closing(sqlite3.connect(database.resolve().as_uri() + "?mode=ro", uri=True)) as conn:
        conn.row_factory = sqlite3.Row
        entities = {row["entity_id"]: row for row in rows(conn, "entities")}
        facts, relations = rows(conn, "facts"), rows(conn, "relationships")
        cards, holds, gaps = rows(conn, "content_cards"), rows(conn, "relation_holds"), rows(conn, "gaps")
        fact_sources = rows(conn, "fact_sources")
        card_sources = rows(conn, "card_sources")
        relationship_sources = rows(conn, "relationship_sources")
        relationship_evidence = rows(conn, "relationship_evidence")
        source_objects = {row["source_id"]: row for row in rows(conn, "sources")}
        metadata = dict(conn.execute("SELECT key,value FROM metadata"))
    authors = []
    for index, author_id in enumerate(ids):
        entity = entities.get(author_id)
        if not entity or entity["entity_type"] != "author":
            raise ValueError(f"invalid core author: {author_id}")
        created = [rel for rel in relations if rel["subject_id"] == author_id and rel["relation_type"] == "CREATED"]
        work_ids = sorted({rel["object_id"] for rel in created})
        works = []
        for work_id in work_ids:
            work = entities[work_id]
            if work["entity_type"] not in {"work", "collection"}:
                raise ValueError(f"CREATED object has invalid type: {work_id}")
            work_facts = [fact for fact in facts if fact["subject_id"] == work_id]
            work_cards = [card for card in cards if card["subject_id"] == work_id]
            work_relations = [rel for rel in relations if rel["subject_id"] == work_id or rel["object_id"] == work_id]
            card_ids = {card["card_id"] for card in work_cards}
            relation_ids = {rel["relationship_id"] for rel in work_relations}
            work_fact_sources = [source for source in fact_sources if source["fact_id"] in {f["fact_id"] for f in work_facts}]
            work_card_sources = [source for source in card_sources if source["card_id"] in card_ids]
            work_relation_sources = [source for source in relationship_sources if source["relationship_id"] in relation_ids]
            work_evidence = [e for e in relationship_evidence if e["relationship_id"] in relation_ids]
            source_ids = {source["source_id"] for source in work_fact_sources + work_card_sources + work_relation_sources + work_evidence}
            fields = {fact["fact_field"] for fact in work_facts}
            flags = []
            if not fields.intersection(YEARS):
                flags.append("publication_year_missing")
            if "genre_or_form" not in fields:
                flags.append("genre_missing")
            if not fields.intersection(DESCRIPTIONS):
                flags.append("object_description_fact_missing")
            if not work_cards:
                flags.append("content_card_missing")
            works.append({"entity": work, "facts": work_facts, "cards": work_cards,
                          "relations": work_relations, "fact_sources": work_fact_sources,
                          "card_sources": work_card_sources, "relationship_sources": work_relation_sources,
                          "relationship_evidence": work_evidence,
                          "source_objects": [source_objects[sid] for sid in sorted(source_ids)],
                          "flags": flags})
        scope = {author_id, *work_ids}
        author_curation = curation["authors"][index]
        authors.append({"batch_id": f"WCD-10-B{index // 3 + 1:02}", "task_id": f"TASK-{106 + index // 3}",
                        "author": entity, "works": works,
                        "facts": [f for f in facts if f["subject_id"] == author_id],
                        "relations": [r for r in relations if r["subject_id"] == author_id or r["object_id"] == author_id],
                        "holds": [h for h in holds if h["subject_id"] in scope or h["object_id"] in scope],
                        "gaps": [g for g in gaps if any(target in json.dumps(g, ensure_ascii=False) for target in scope)],
                        "curation_statuses": dict(Counter(v["status"] for v in author_curation.values() if isinstance(v, dict) and "status" in v)),
                        "inventory_status": "MECHANICAL_ONLY_NOT_LITERARY_COVERAGE_REVIEW"})
    return {"schema": "wcd10-inventory-1", "database_sha256": hashlib.sha256(database.read_bytes()).hexdigest(),
            "curation_sha256": hashlib.sha256(curation_path.read_bytes()).hexdigest(),
            "research_version": metadata.get("research_version"), "authors": authors,
            "counts": {"core_authors": len(authors), "batches": (len(authors) + 2) // 3,
                       "unique_linked_works": len({w["entity"]["entity_id"] for a in authors for w in a["works"]}),
                       "flagged_works": sum(bool(w["flags"]) for a in authors for w in a["works"])}}


def markdown(report):
    lines = ["# WCD-10 全量机械基线", "", f"数据库 SHA-256：`{report['database_sha256']}`。", "",
             "仅检查现有记录；不是完整作品谱系审计，不代表任何批次完成。描述标志只检查直接事实字段，不能说明已有内容卡无价值。", "",
             "| 批次 | 任务 | 作家 | 现有作品/合集 | 有机械缺项的作品 | 策展字段状态 |", "| --- | --- | --- | ---: | ---: | --- |"]
    for author in report["authors"]:
        lines.append(f"| {author['batch_id']} | {author['task_id']} | {author['author']['name_zh']} | {len(author['works'])} | {sum(bool(w['flags']) for w in author['works'])} | {json.dumps(author['curation_statuses'], ensure_ascii=False)} |")
    for author in report["authors"][:3]:
        lines.extend(["", f"## 首批：{author['author']['name_zh']}", ""])
        for work in author["works"]:
            entity = work["entity"]
            lines.append(f"- `{entity['entity_id']}` · {entity['name_zh']} / {entity['original_name']} · `{entity['entity_type']}` · {', '.join(work['flags']) or '无机械缺项'}")
    return "\n".join(lines) + "\n"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    report = inventory(args.repo)
    args.output.mkdir(parents=True, exist_ok=True)
    (args.output / "BASELINE_INVENTORY.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    (args.output / "BASELINE_INVENTORY.md").write_text(markdown(report), encoding="utf-8")
    print(json.dumps(report["counts"], ensure_ascii=False))


if __name__ == "__main__":
    main()
