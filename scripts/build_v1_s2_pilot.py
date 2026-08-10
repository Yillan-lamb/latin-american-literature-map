#!/usr/bin/env python3
"""Build the Codex-owned V1-S2 pilot staging package from the accepted PRE bundle."""

from __future__ import annotations

import argparse
import csv
import hashlib
import json
import shutil
import sqlite3
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
PRE = ROOT / "work/external-ai/deliveries/V1-S2-007A_试点数据包预组装_交付"
OUT = ROOT / "data/staging/v1_s2_pilot"
REGISTRY = ROOT / "data/catalog/SOURCE_REGISTRY.csv"


SUPPLEMENTAL_SOURCES = [
    {
        "source_id": "SRC-0014",
        "temporary_id": "CODEX-BOR-BN-001",
        "title": "阿根廷国家图书馆《博尔赫斯问题》书目",
        "original_title": "La Biblioteca No. 13: Cuestión Borges",
        "author_or_editor": "Biblioteca Nacional Mariano Moreno",
        "translator": "不适用",
        "publisher": "Biblioteca Nacional Mariano Moreno",
        "publication_year": "2013",
        "isbn": "ISSN 0329-1588",
        "format": "pdf",
        "page_count": "N/A",
        "language": "es",
        "source_level": "B",
        "processing_status": "access_pass",
        "source_task": "V1-S2-007",
        "public_content_scope": "metadata_and_summary",
        "local_asset_status": "remote_only",
        "persistent_id": "La Biblioteca Año 10 No.13",
        "canonical_url": "https://www.bn.gov.ar/micrositios/admin_assets/issues/files/6a0504ab40d7167a5b37b2467bf57845.pdf",
    },
    {
        "source_id": "SRC-0015",
        "temporary_id": "CODEX-BOR-BN-002",
        "title": "阿根廷国家图书馆《阿莱夫》80周年展览页",
        "original_title": "Infinita veneración, infinita lástima: 80 años de El Aleph",
        "author_or_editor": "Biblioteca Nacional Mariano Moreno",
        "translator": "不适用",
        "publisher": "Biblioteca Nacional Mariano Moreno",
        "publication_year": "2025",
        "isbn": "N/A",
        "format": "html",
        "page_count": "N/A",
        "language": "es",
        "source_level": "B",
        "processing_status": "access_pass",
        "source_task": "V1-S2-007",
        "public_content_scope": "metadata_and_summary",
        "local_asset_status": "remote_only",
        "persistent_id": "BNMM El Aleph 80 años",
        "canonical_url": "https://www.bn.gov.ar/agenda-cultural/infinita-veneracion-infinita-lastima-80-anos-de-el-aleph",
    },
    {
        "source_id": "SRC-0016",
        "temporary_id": "CODEX-LIS-IMS-001",
        "title": "IMS 李斯佩克朵生平简介",
        "original_title": "Sobre Clarice Lispector",
        "author_or_editor": "Instituto Moreira Salles",
        "translator": "不适用",
        "publisher": "Instituto Moreira Salles",
        "publication_year": "2017",
        "isbn": "N/A",
        "format": "html",
        "page_count": "N/A",
        "language": "pt",
        "source_level": "B",
        "processing_status": "access_pass",
        "source_task": "V1-S2-007",
        "public_content_scope": "metadata_and_summary",
        "local_asset_status": "remote_only",
        "persistent_id": "IMS 2017-06-01 Clarice",
        "canonical_url": "https://ims.com.br/2017/06/01/sobre-clarice-lispector/",
    },
]


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(encoding="utf-8-sig", newline="") as handle:
        return list(csv.DictReader(handle))


def write_csv(path: Path, rows: list[dict[str, str]], fields: list[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8-sig", newline="") as handle:
        writer = csv.DictWriter(
            handle,
            fieldnames=fields,
            extrasaction="ignore",
            lineterminator="\n",
        )
        writer.writeheader()
        writer.writerows(rows)


def split_ids(value: str) -> list[str]:
    return [item for item in value.split(";") if item]


def normalized_hash(rows: list[dict[str, str]], key: str) -> str:
    ordered = sorted(rows, key=lambda row: row[key])
    payload = json.dumps(ordered, ensure_ascii=False, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(payload.encode("utf-8")).hexdigest()


def sync_registry() -> None:
    rows = read_csv(REGISTRY)
    fields = list(rows[0])
    by_id = {row["source_id"]: row for row in rows}
    for source in SUPPLEMENTAL_SOURCES:
        if source["source_id"] in by_id and by_id[source["source_id"]] != source:
            raise ValueError(f"registry collision: {source['source_id']}")
        by_id[source["source_id"]] = source
    ordered = sorted(by_id.values(), key=lambda row: int(row["source_id"].split("-")[1]))
    write_csv(REGISTRY, ordered, fields)


def build(sync_catalog: bool = False) -> dict[str, int]:
    if sync_catalog:
        sync_registry()
    if OUT.exists():
        shutil.rmtree(OUT)
    OUT.mkdir(parents=True)

    pre_entities = read_csv(PRE / "ENTITY_NORMALIZATION_PROPOSALS.csv")
    pre_relations = read_csv(PRE / "RELATION_GROUP_PROPOSALS.csv")
    pre_evidence = read_csv(PRE / "RELATION_EVIDENCE.csv")
    pre_facts = read_csv(PRE / "FACT_PROPOSALS.csv")
    pre_cards = read_csv(PRE / "CONTENT_CARDS.csv")
    pre_sources = read_csv(PRE / "SOURCE_SNAPSHOT.csv")

    entity_map = {
        row["preview_entity_id"]: f"STG-ENT-{index:04d}"
        for index, row in enumerate(pre_entities, 1)
    }
    entities = []
    entity_id_map = []
    for row in pre_entities:
        candidate = row["candidate_id"]
        date_info = row["date_info"]
        notes = row["issue_notes"]
        if candidate == "CAND-S2-ENT-0003":
            date_info = "1945"
            notes = (notes + "; " if notes else "") + "首发年由 SRC-0015 核定为 1945"
        if candidate == "CAND-S2-ENT-0086":
            date_info = "1920-1977"
        entity_id = entity_map[row["preview_entity_id"]]
        entities.append({
            "entity_id": entity_id,
            "entity_type": row["entity_type"],
            "canonical_name": row["canonical_name_candidate"],
            "display_name_zh": row["display_name_zh"],
            "original_name": row["original_name"],
            "language": row["language"],
            "country_or_region": row["country_or_region"],
            "date_info": date_info,
            "staging_status": "n2_review",
            "issue_notes": notes,
        })
        entity_id_map.append({
            "entity_id": entity_id,
            "preview_entity_id": row["preview_entity_id"],
            "candidate_id": candidate,
        })

    eligible = [row for row in pre_relations if row["review_status"] == "eligible_for_staging_review"]
    holds = [row for row in pre_relations if row["review_status"] == "hold_needs_second_source"]
    relation_map = {
        row["preview_relation_id"]: f"STG-REL-{index:04d}"
        for index, row in enumerate(eligible, 1)
    }
    hold_map = {
        row["preview_relation_id"]: f"HOLD-REL-{index:04d}"
        for index, row in enumerate(holds, 1)
    }

    relationships = []
    relation_sources = []
    for row in eligible:
        relation_id = relation_map[row["preview_relation_id"]]
        relationships.append({
            "relation_id": relation_id,
            "relation_group_id": row["relation_group_id"],
            "subject_entity_id": entity_map[row["subject_preview_entity_id"]],
            "relation_type": row["relation_type"],
            "object_entity_id": entity_map[row["object_preview_entity_id"]],
            "description_zh": row["description_zh"],
            "confidence": row["confidence"],
            "review_status": "accepted_for_n2",
            "issue_notes": row["issue_notes"],
        })
        for source_id in split_ids(row["source_ids"]):
            relation_sources.append({"relation_id": relation_id, "source_id": source_id})

    relation_holds = []
    for row in holds:
        hold_id = hold_map[row["preview_relation_id"]]
        relation_holds.append({
            "hold_relation_id": hold_id,
            "relation_group_id": row["relation_group_id"],
            "subject_entity_id": entity_map[row["subject_preview_entity_id"]],
            "relation_type": row["relation_type"],
            "object_entity_id": entity_map[row["object_preview_entity_id"]],
            "description_zh": row["description_zh"],
            "confidence": row["confidence"],
            "review_status": "hold_needs_second_source",
            "issue_notes": row["issue_notes"],
        })

    relationship_evidence = []
    hold_evidence = []
    for row in pre_evidence:
        preview_id = row["preview_relation_id"]
        target = relationship_evidence if preview_id in relation_map else hold_evidence
        parent_id = relation_map.get(preview_id) or hold_map[preview_id]
        target.append({
            "relation_id": parent_id,
            "relation_candidate_id": row["relation_candidate_id"],
            "source_id": row["source_id"],
            "source_title": row["source_title"],
            "locator": row["optional_locator"],
            "evidence_note": row["optional_evidence_note"],
            "confidence": row["confidence"],
            "dispute_status": row["dispute_status"],
        })

    fact_rows = [dict(row) for row in pre_facts]
    fact_rows.extend([
        {
            "fact_candidate_id": "CODEX-S2-FCT-0050",
            "subject_preview_entity_id": "PRE-ENT-0003",
            "fact_field": "first_publication_year",
            "value_candidate": "1941",
            "source_id": "SRC-0014",
            "source_title": "阿根廷国家图书馆《博尔赫斯问题》书目",
            "confidence": "high",
            "dispute_status": "none",
            "issue_notes": "Codex 权威来源补充",
        },
        {
            "fact_candidate_id": "CODEX-S2-FCT-0051",
            "subject_preview_entity_id": "PRE-ENT-0004",
            "fact_field": "first_publication_year",
            "value_candidate": "1945",
            "source_id": "SRC-0015",
            "source_title": "阿根廷国家图书馆《阿莱夫》80周年展览页",
            "confidence": "high",
            "dispute_status": "none",
            "issue_notes": "Codex 权威来源补充；替代候选实体中的 1949 误值",
        },
        {
            "fact_candidate_id": "CODEX-S2-FCT-0052",
            "subject_preview_entity_id": "PRE-ENT-0016",
            "fact_field": "death_year",
            "value_candidate": "1977",
            "source_id": "SRC-0016",
            "source_title": "IMS 李斯佩克朵生平简介",
            "confidence": "high",
            "dispute_status": "none",
            "issue_notes": "Codex 权威来源补充",
        },
    ])
    facts = []
    fact_sources = []
    fact_id_map = {}
    for index, row in enumerate(fact_rows, 1):
        fact_id = f"STG-FCT-{index:04d}"
        fact_id_map[row["fact_candidate_id"]] = fact_id
        facts.append({
            "fact_id": fact_id,
            "fact_candidate_id": row["fact_candidate_id"],
            "subject_entity_id": entity_map[row["subject_preview_entity_id"]],
            "fact_field": row["fact_field"],
            "value": row["value_candidate"],
            "confidence": row["confidence"],
            "review_status": "accepted_for_n2" if row["dispute_status"] == "none" else row["dispute_status"],
            "issue_notes": row["issue_notes"],
        })
        fact_sources.append({"fact_id": fact_id, "source_id": row["source_id"]})

    cards = []
    card_facts = []
    card_sources = []
    for index, row in enumerate(pre_cards, 1):
        card_id = f"STG-CARD-{index:04d}"
        cards.append({
            "card_id": card_id,
            "subject_entity_id": entity_map[row["subject_preview_entity_id"]],
            "card_type": row["card_type"],
            "title_zh": row["title_zh"],
            "content_points_json": row["content_points_json"],
            "review_status": "n2_content_draft",
        })
        for order, candidate_id in enumerate(split_ids(row["fact_ids"]), 1):
            card_facts.append({"card_id": card_id, "fact_id": fact_id_map[candidate_id], "display_order": str(order)})
        for source_id in split_ids(row["source_ids"]):
            card_sources.append({"card_id": card_id, "source_id": source_id})

    collection_card_id = "STG-CARD-0009"
    collection_fact_candidates = ["CAND-S2-FCT-0029", "CAND-S2-FCT-0030"]
    collection_points = [
        {"fact_candidate_id": "CAND-S2-FCT-0029", "text": "实体层级：collection"},
        {"fact_candidate_id": "CAND-S2-FCT-0030", "text": "首次出版年：1949"},
    ]
    cards.append({
        "card_id": collection_card_id,
        "subject_entity_id": entity_map["PRE-ENT-0012"],
        "card_type": "structure_brief",
        "title_zh": "《阿莱夫》（1949 年作品集）",
        "content_points_json": json.dumps(collection_points, ensure_ascii=False),
        "review_status": "n2_incomplete_structure_card",
    })
    for order, candidate_id in enumerate(collection_fact_candidates, 1):
        card_facts.append({"card_id": collection_card_id, "fact_id": fact_id_map[candidate_id], "display_order": str(order)})
    card_sources.append({"card_id": collection_card_id, "source_id": "SRC-0002"})

    sources = [dict(row) for row in pre_sources]
    for source in SUPPLEMENTAL_SOURCES:
        sources.append({key: source[key] for key in pre_sources[0]})

    datasets = {
        "sources": (sources, "source_id"),
        "entities": (entities, "entity_id"),
        "entity_id_map": (entity_id_map, "entity_id"),
        "relationships": (relationships, "relation_id"),
        "relationship_evidence": (relationship_evidence, "relation_candidate_id"),
        "relationship_sources": (relation_sources, "relation_id"),
        "relation_holds": (relation_holds, "hold_relation_id"),
        "relation_hold_evidence": (hold_evidence, "relation_candidate_id"),
        "facts": (facts, "fact_id"),
        "fact_sources": (fact_sources, "fact_id"),
        "content_cards": (cards, "card_id"),
        "card_facts": (card_facts, "card_id"),
        "card_sources": (card_sources, "card_id"),
    }

    csv_names = {
        "sources": "SOURCES.csv",
        "entities": "ENTITIES.csv",
        "entity_id_map": "ENTITY_ID_MAP.csv",
        "relationships": "RELATIONSHIPS.csv",
        "relationship_evidence": "RELATION_EVIDENCE.csv",
        "relationship_sources": "RELATION_SOURCES.csv",
        "relation_holds": "RELATION_HOLDS.csv",
        "relation_hold_evidence": "RELATION_HOLD_EVIDENCE.csv",
        "facts": "FACTS.csv",
        "fact_sources": "FACT_SOURCES.csv",
        "content_cards": "CONTENT_CARDS.csv",
        "card_facts": "CARD_FACTS.csv",
        "card_sources": "CARD_SOURCES.csv",
    }
    for name, (rows, _) in datasets.items():
        write_csv(OUT / csv_names[name], rows, list(rows[0]))

    metadata = {
        "package_id": "V1-S2-PILOT-N2",
        "schema_version": "0.2-n2-review",
        "generated_by": "Codex",
        "generated_date": "2026-08-10",
        "source_package": "V1-S2-007-A R0 pass",
        "relationship_policy": "15 accepted_for_n2; 11 hold_needs_second_source",
    }
    json_payload = {"metadata": metadata}
    json_payload.update({name: rows for name, (rows, _) in datasets.items()})
    (OUT / "PILOT_N2.json").write_text(json.dumps(json_payload, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

    db_path = OUT / "PILOT_N2.sqlite"
    conn = sqlite3.connect(db_path)
    conn.execute("PRAGMA foreign_keys=ON")
    conn.executescript("""
    CREATE TABLE metadata(key TEXT PRIMARY KEY, value TEXT NOT NULL);
    CREATE TABLE sources(source_id TEXT PRIMARY KEY, title TEXT NOT NULL, original_title TEXT, source_level TEXT NOT NULL, format TEXT, language TEXT, persistent_id TEXT, canonical_url TEXT);
    CREATE TABLE entities(entity_id TEXT PRIMARY KEY, entity_type TEXT NOT NULL, canonical_name TEXT NOT NULL, display_name_zh TEXT NOT NULL, original_name TEXT, language TEXT, country_or_region TEXT, date_info TEXT, staging_status TEXT NOT NULL, issue_notes TEXT);
    CREATE TABLE entity_id_map(entity_id TEXT PRIMARY KEY REFERENCES entities(entity_id), preview_entity_id TEXT UNIQUE NOT NULL, candidate_id TEXT UNIQUE NOT NULL);
    CREATE TABLE relationships(relation_id TEXT PRIMARY KEY, relation_group_id TEXT UNIQUE NOT NULL, subject_entity_id TEXT NOT NULL REFERENCES entities(entity_id), relation_type TEXT NOT NULL, object_entity_id TEXT NOT NULL REFERENCES entities(entity_id), description_zh TEXT, confidence TEXT NOT NULL, review_status TEXT NOT NULL, issue_notes TEXT);
    CREATE TABLE relationship_evidence(relation_candidate_id TEXT PRIMARY KEY, relation_id TEXT NOT NULL REFERENCES relationships(relation_id), source_id TEXT NOT NULL REFERENCES sources(source_id), source_title TEXT NOT NULL, locator TEXT, evidence_note TEXT, confidence TEXT NOT NULL, dispute_status TEXT NOT NULL);
    CREATE TABLE relationship_sources(relation_id TEXT NOT NULL REFERENCES relationships(relation_id), source_id TEXT NOT NULL REFERENCES sources(source_id), PRIMARY KEY(relation_id, source_id));
    CREATE TABLE relation_holds(hold_relation_id TEXT PRIMARY KEY, relation_group_id TEXT UNIQUE NOT NULL, subject_entity_id TEXT NOT NULL REFERENCES entities(entity_id), relation_type TEXT NOT NULL, object_entity_id TEXT NOT NULL REFERENCES entities(entity_id), description_zh TEXT, confidence TEXT NOT NULL, review_status TEXT NOT NULL, issue_notes TEXT);
    CREATE TABLE relation_hold_evidence(relation_candidate_id TEXT PRIMARY KEY, relation_id TEXT NOT NULL REFERENCES relation_holds(hold_relation_id), source_id TEXT NOT NULL REFERENCES sources(source_id), source_title TEXT NOT NULL, locator TEXT, evidence_note TEXT, confidence TEXT NOT NULL, dispute_status TEXT NOT NULL);
    CREATE TABLE facts(fact_id TEXT PRIMARY KEY, fact_candidate_id TEXT UNIQUE NOT NULL, subject_entity_id TEXT NOT NULL REFERENCES entities(entity_id), fact_field TEXT NOT NULL, value TEXT NOT NULL, confidence TEXT NOT NULL, review_status TEXT NOT NULL, issue_notes TEXT);
    CREATE TABLE fact_sources(fact_id TEXT NOT NULL REFERENCES facts(fact_id), source_id TEXT NOT NULL REFERENCES sources(source_id), PRIMARY KEY(fact_id, source_id));
    CREATE TABLE content_cards(card_id TEXT PRIMARY KEY, subject_entity_id TEXT NOT NULL REFERENCES entities(entity_id), card_type TEXT NOT NULL, title_zh TEXT NOT NULL, content_points_json TEXT NOT NULL, review_status TEXT NOT NULL);
    CREATE TABLE card_facts(card_id TEXT NOT NULL REFERENCES content_cards(card_id), fact_id TEXT NOT NULL REFERENCES facts(fact_id), display_order INTEGER NOT NULL, PRIMARY KEY(card_id, fact_id));
    CREATE TABLE card_sources(card_id TEXT NOT NULL REFERENCES content_cards(card_id), source_id TEXT NOT NULL REFERENCES sources(source_id), PRIMARY KEY(card_id, source_id));
    """)
    conn.executemany("INSERT INTO metadata VALUES (?,?)", metadata.items())

    table_columns = {
        "sources": ["source_id", "title", "original_title", "source_level", "format", "language", "persistent_id", "canonical_url"],
        "entities": list(entities[0]),
        "entity_id_map": list(entity_id_map[0]),
        "relationships": list(relationships[0]),
        "relationship_evidence": ["relation_candidate_id", "relation_id", "source_id", "source_title", "locator", "evidence_note", "confidence", "dispute_status"],
        "relationship_sources": list(relation_sources[0]),
        "relation_holds": list(relation_holds[0]),
        "relation_hold_evidence": ["relation_candidate_id", "relation_id", "source_id", "source_title", "locator", "evidence_note", "confidence", "dispute_status"],
        "facts": list(facts[0]),
        "fact_sources": list(fact_sources[0]),
        "content_cards": list(cards[0]),
        "card_facts": list(card_facts[0]),
        "card_sources": list(card_sources[0]),
    }
    for name, (rows, _) in datasets.items():
        columns = table_columns[name]
        placeholders = ",".join("?" for _ in columns)
        sql = f"INSERT INTO {name} ({','.join(columns)}) VALUES ({placeholders})"
        conn.executemany(sql, [[row[column] for column in columns] for row in rows])
    conn.commit()
    fk = conn.execute("PRAGMA foreign_key_check").fetchall()
    integrity = conn.execute("PRAGMA integrity_check").fetchone()[0]
    conn.close()
    if fk or integrity != "ok":
        raise ValueError(f"SQLite validation failed: fk={fk}, integrity={integrity}")

    hashes = {name: normalized_hash(rows, key) for name, (rows, key) in datasets.items()}
    counts = {name: len(rows) for name, (rows, _) in datasets.items()}
    report = [
        "# V1-S2 试点正式暂存一致性报告",
        "",
        "- schema_version: `0.2-n2-review`",
        f"- sqlite_version: `{sqlite3.sqlite_version}`",
        "- SQLite integrity_check: `ok`",
        "- SQLite foreign_key_check: `0`",
        "",
        "## 表计数与规范化 SHA-256",
        "",
        "| 逻辑表 | 行数 | SHA-256 |",
        "|---|---:|---|",
    ]
    for name in datasets:
        report.append(f"| {name} | {counts[name]} | `{hashes[name]}` |")
    report.extend([
        "",
        "## 门禁结论",
        "",
        "- 28 个实体、15 个 N2 可审核关系、11 个待第二来源关系。",
        "- 52 条事实、9 张内容卡、11 个来源。",
        "- 所有来源、端点、事实和卡片引用由 SQLite 外键约束。",
        "- 跨环境可重复构建以逐表规范化哈希、完整性和外键结果为准，不要求 SQLite 文件原始哈希一致。",
    ])
    (OUT / "CONSISTENCY_REPORT.md").write_text("\n".join(report) + "\n", encoding="utf-8")

    readme = """# V1-S2 Pilot Staging Package

这是 Codex 基于 `V1-S2-007-A` 已通过 PRE 包生成的 N2 审核暂存数据，不是正式发布主数据库。

- 28 个规范实体；
- 15 个 `accepted_for_n2` 关系；
- 11 个 `hold_needs_second_source` 关系，单独保存；
- 52 条来源事实；
- 9 张内容卡，其中第 9 张为 1949 年作品集《阿莱夫》结构型简卡；
- 11 个来源，其中 3 个为 Codex 权威来源补充；
- CSV、JSON、SQLite 由本脚本单源生成。

`STG-` ID 仅在 N2 审核期稳定。N2 通过后才冻结 V1 Schema 和正式 ID 策略。
"""
    (OUT / "README.md").write_text(readme, encoding="utf-8")
    return counts


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--sync-registry", action="store_true")
    args = parser.parse_args()
    result = build(sync_catalog=args.sync_registry)
    print(json.dumps(result, ensure_ascii=False, sort_keys=True))
