#!/usr/bin/env python3
"""Rebuild the historical V1.0.0 package from the approved A06-A PRE package.

This is a release-snapshot regression builder. It is not the authoring path for
post-V1 increments; use apply_migration.py and export_from_sqlite.py instead.
"""

from __future__ import annotations

import csv
import hashlib
import json
import sqlite3
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PRE = ROOT / "work/external-ai/deliveries/V1-S4-A06A_V1候选包预组装与N3材料_交付"
A05 = ROOT / "work/external-ai/deliveries/V1-S4-A05_legacy关系迁移审计与差量补证_交付"
A01 = ROOT / "work/external-ai/deliveries/V1-S4-A01_阶段4权威补证与兼容性研究包_交付"
REGISTRY = ROOT / "data/catalog/SOURCE_REGISTRY.csv"
S3S4_MAP = ROOT / "data/catalog/SOURCE_ID_MAP_V1_S3_S4.csv"
A05_MAP = ROOT / "data/catalog/SOURCE_ID_MAP_V1_S4_A05.csv"
OUT = ROOT / "data/staging/v1_candidate"

ALLOWED_RELATIONS = {
    "CREATED", "CONTAINS_WORK", "EDITION_OF", "TRANSLATION_OF",
    "ADAPTED_FROM", "DIRECTED", "SET_IN", "ASSOCIATED_WITH_PLACE",
    "ASSOCIATED_WITH_MOVEMENT", "EXPLORES_THEME", "RESPONDS_TO_WORK",
    "INFLUENCED_BY",
    "BASED_ON_EVENT",
}

CSV_FILES = [
    "SOURCES.csv",
    "SOURCE_HOLDS.csv",
    "ENTITIES.csv",
    "ENTITY_ID_MAP.csv",
    "RELATIONSHIPS.csv",
    "RELATION_EVIDENCE.csv",
    "RELATION_SOURCES.csv",
    "RELATION_HOLDS.csv",
    "RELATION_HOLD_EVIDENCE.csv",
    "FACTS.csv",
    "FACT_SOURCES.csv",
    "CONTENT_CARDS.csv",
    "CARD_FACTS.csv",
    "CARD_SOURCES.csv",
    "GAPS.csv",
    "N3_DECISIONS.csv",
    "LEGACY_RELATION_GROUPS.csv",
]


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(encoding="utf-8-sig", newline="") as handle:
        return list(csv.DictReader(handle))


def write_csv(path: Path, rows: list[dict[str, str]], fields: list[str]) -> None:
    with path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, lineterminator="\n")
        writer.writeheader()
        writer.writerows(rows)


def norm_sha(rows: list[dict[str, str]]) -> str:
    payload = json.dumps(
        [sorted(row.items()) for row in rows],
        ensure_ascii=False,
        sort_keys=True,
        separators=(",", ":"),
    ).encode("utf-8")
    return hashlib.sha256(payload).hexdigest()


def split_values(value: str) -> list[str]:
    return [part.strip() for part in (value or "").split(";") if part.strip()]


def parse_card_markdown(path: Path) -> list[str]:
    text = path.read_text(encoding="utf-8")
    parts = text.split("\n### ")[1:]
    if len(parts) != 40:
        raise AssertionError(f"expected 40 card sections, got {len(parts)}")
    return ["### " + part for part in parts]


def build_entities(pre_entities: list[dict[str, str]]):
    merge_to = {
        "PRE-ENT-0097": "PRE-ENT-0001",  # Argentina, A02 exact
        "PRE-ENT-0067": "PRE-ENT-0014",  # memory/forgetting, A02 exact
    }
    by_preview = {row["preview_entity_ref"]: row for row in pre_entities}
    groups: dict[str, list[dict[str, str]]] = defaultdict(list)
    for row in pre_entities:
        representative = merge_to.get(row["preview_entity_ref"], row["preview_entity_ref"])
        groups[representative].append(row)

    entity_id_by_rep: dict[str, str] = {}
    for index, representative in enumerate(sorted(groups), start=1):
        entity_id_by_rep[representative] = f"V1-ENT-{index:04d}"

    entities = []
    entity_map = []
    preview_to_entity: dict[str, str] = {}
    for representative in sorted(groups):
        members = groups[representative]
        entity_id = entity_id_by_rep[representative]
        primary = by_preview[representative]
        original_name = next((m["original_name"] for m in members if m["original_name"]), "")
        bases = []
        issues = []
        for member in members:
            if member["normalization_basis"] not in bases:
                bases.append(member["normalization_basis"])
            if member["issue_code"] != "NONE" and member["issue_code"] not in issues:
                issues.append(member["issue_code"])
        if len(members) > 1:
            bases.append("A02 exact merge approved for formal V1 candidate mapping")
        entities.append({
            "entity_id": entity_id,
            "entity_type": primary["entity_type"],
            "name_zh": primary["name_zh"],
            "original_name": original_name,
            "canonical_status": "merged_exact" if len(members) > 1 else "retained",
            "origin_count": str(len(members)),
            "origin_refs": ";".join(m["origin_ref"] for m in members),
            "normalization_basis": ";".join(bases),
            "issue_codes": ";".join(issues) if issues else "NONE",
        })
        for member in members:
            preview_to_entity[member["preview_entity_ref"]] = entity_id
            entity_map.append({
                "mapping_id": f"V1-EMAP-{len(entity_map) + 1:04d}",
                "preview_entity_ref": member["preview_entity_ref"],
                "origin_layer": member["origin_layer"],
                "origin_ref": member["origin_ref"],
                "entity_id": entity_id,
                "mapping_action": "merge_exact" if len(members) > 1 else "retain_as_formal_candidate",
                "mapping_basis": "A02 exact normalization" if len(members) > 1 else member["normalization_basis"],
            })
    assert len(entities) == 144
    assert len(entity_map) == 146
    return entities, entity_map, preview_to_entity


def main() -> None:
    OUT.mkdir(parents=True, exist_ok=True)
    pre_entities = read_csv(PRE / "ENTITY_REFERENCE_PRE.csv")
    pre_facts = read_csv(PRE / "FACT_MATERIALS_PRE.csv")
    pre_rel = read_csv(PRE / "RELATION_ELIGIBLE_PRE.csv")
    pre_hold = read_csv(PRE / "RELATION_HOLD_PRE.csv")
    pre_ev = read_csv(PRE / "RELATION_EVIDENCE_PRE.csv")
    pre_legacy = read_csv(PRE / "LEGACY_EVIDENCE_LINK_PROPOSALS.csv")
    pre_cards = read_csv(PRE / "CONTENT_CARD_INDEX_PRE.csv")
    pre_card_sources = read_csv(PRE / "CARD_SOURCE_LINKS_PRE.csv")
    pre_gaps = read_csv(PRE / "GAP_REGISTER.csv")
    pre_n3 = read_csv(PRE / "N3_DECISION_ITEMS.csv")
    event_evidence = read_csv(A01 / "EVENT_RELATION_EVIDENCE.csv")
    legacy_groups = read_csv(A05 / "LEGACY_RELATION_GROUPS.csv")
    sources = read_csv(REGISTRY)

    assert [row["source_id"] for row in sources] == [f"SRC-{i:04d}" for i in range(1, 75)]
    source_ids = {row["source_id"] for row in sources}
    source_by_id = {row["source_id"]: row for row in sources}

    entities, entity_map, preview_to_entity = build_entities(pre_entities)
    origin_to_entity = {row["origin_ref"]: row["entity_id"] for row in entity_map}
    relation_id_map = {
        row["preview_relation_id"]: f"V1-REL-{index:04d}"
        for index, row in enumerate(pre_rel, start=1)
    }
    hold_id_map = {
        row["preview_relation_id"]: f"V1-HOLD-{index:04d}"
        for index, row in enumerate(pre_hold, start=1)
    }
    card_id_map = {
        row["preview_card_id"]: f"V1-CARD-{index:04d}"
        for index, row in enumerate(pre_cards, start=1)
    }
    origin_card_to_id = {
        row["origin_card_id"]: card_id_map[row["preview_card_id"]] for row in pre_cards
    }

    eligible_evidence = []
    hold_evidence = []
    for row in pre_ev:
        if row["preview_relation_id"] in relation_id_map:
            source_id = row["formal_source_id"]
            assert source_id in source_ids
            eligible_evidence.append({
                "evidence_id": f"V1-EV-{len(eligible_evidence) + 1:04d}",
                "relationship_id": relation_id_map[row["preview_relation_id"]],
                "origin_evidence_id": row["origin_evidence_id"],
                "source_id": source_id,
                "source_title": row["source_title"],
                "locator": row["locator"],
                "evidence_note": row["evidence_note"],
                "confidence": row["confidence"],
                "evidence_status": row["evidence_status"],
                "evidence_origin": "A06_PRE",
            })
        else:
            source_id = row["formal_source_id"]
            assert row["preview_relation_id"] in hold_id_map
            assert source_id in source_ids
            hold_evidence.append({
                "evidence_id": f"V1-HEV-{len(hold_evidence) + 1:04d}",
                "relation_hold_id": hold_id_map[row["preview_relation_id"]],
                "origin_evidence_id": row["origin_evidence_id"],
                "source_id": source_id,
                "source_title": row["source_title"],
                "locator": row["locator"],
                "evidence_note": row["evidence_note"],
                "confidence": row["confidence"],
                "evidence_status": row["evidence_status"],
            })

    for row in pre_legacy:
        source_id = row["legacy_source"]
        assert source_id in source_ids
        eligible_evidence.append({
            "evidence_id": f"V1-EV-{len(eligible_evidence) + 1:04d}",
            "relationship_id": relation_id_map[row["target_preview_relation_id"]],
            "origin_evidence_id": row["legacy_row_id"],
            "source_id": source_id,
            "source_title": next(s["title"] for s in sources if s["source_id"] == source_id),
            "locator": row["legacy_locator"],
            "evidence_note": row["legacy_evidence"],
            "confidence": "",
            "evidence_status": "legacy_additional_evidence",
            "evidence_origin": "A05_LEGACY",
        })

    event_relation_id = "V1-REL-0076"
    event_source_map = {"A01-SRC-0003": "SRC-0046", "A01-SRC-0010": "SRC-0063"}
    for row in event_evidence:
        source_id = event_source_map[row["source_id"]]
        eligible_evidence.append({
            "evidence_id": f"V1-EV-{len(eligible_evidence) + 1:04d}",
            "relationship_id": event_relation_id,
            "origin_evidence_id": row["evidence_id"],
            "source_id": source_id,
            "source_title": source_by_id[source_id]["title"],
            "locator": "正文" if row["evidence_id"] == "A01-EV-0001" else "论文标题",
            "evidence_note": row["source_quote_zh"] + "；" + row["compatibility_note"],
            "confidence": "high" if row["evidence_id"] == "A01-EV-0001" else "medium",
            "evidence_status": "direct" if row["evidence_id"] == "A01-EV-0001" else "indirect",
            "evidence_origin": "N3_APPROVED_EVENT",
        })

    evidence_counts = Counter(row["relationship_id"] for row in eligible_evidence)
    hold_evidence_counts = Counter(row["relation_hold_id"] for row in hold_evidence)
    relationships = []
    for row in pre_rel:
        relationship_id = relation_id_map[row["preview_relation_id"]]
        assert row["relation_type"] in ALLOWED_RELATIONS
        relationships.append({
            "relationship_id": relationship_id,
            "origin_layer": row["origin_layer"],
            "origin_relation_group_id": row["origin_relation_group_id"],
            "subject_id": preview_to_entity[row["subject_preview_entity_ref"]],
            "relation_type": row["relation_type"],
            "object_id": preview_to_entity[row["object_preview_entity_ref"]],
            "description_zh": row["description_zh"],
            "confidence": row["confidence"],
            "review_status": "accepted_at_n3",
            "upstream_review_status": row["review_status"],
            "evidence_count": str(evidence_counts[relationship_id]),
            "issue_code": row["issue_code"],
        })
    relationships.append({
        "relationship_id": event_relation_id,
        "origin_layer": "N3",
        "origin_relation_group_id": "V1-S4-A03-PROP-001",
        "subject_id": origin_to_entity["B03-ENT-0005"],
        "relation_type": "BASED_ON_EVENT",
        "object_id": origin_to_entity["B03-ENT-0026"],
        "description_zh": "《世界末日之战》以卡努杜斯战争为历史题材并将该冲突虚构化",
        "confidence": "high",
        "review_status": "accepted_at_n3",
        "upstream_review_status": "N3-DEC-002 approved by USER",
        "evidence_count": str(evidence_counts[event_relation_id]),
        "issue_code": "NONE",
    })

    relation_holds = []
    for row in pre_hold:
        hold_id = hold_id_map[row["preview_relation_id"]]
        assert row["relation_type"] in ALLOWED_RELATIONS
        relation_holds.append({
            "relation_hold_id": hold_id,
            "origin_layer": row["origin_layer"],
            "origin_relation_group_id": row["origin_relation_group_id"],
            "subject_id": preview_to_entity[row["subject_preview_entity_ref"]],
            "relation_type": row["relation_type"],
            "object_id": preview_to_entity[row["object_preview_entity_ref"]],
            "description_zh": row["description_zh"],
            "confidence": row["confidence"],
            "review_status": "hold_needs_second_source",
            "evidence_count": str(hold_evidence_counts[hold_id]),
            "issue_code": row["issue_code"],
        })

    relation_sources = sorted(
        {
            (row["relationship_id"], row["source_id"])
            for row in eligible_evidence
        }
    )
    relation_sources_rows = [
        {"relationship_id": rel_id, "source_id": source_id}
        for rel_id, source_id in relation_sources
    ]

    card_sections = parse_card_markdown(PRE / "CONTENT_CARD_DRAFTS_PRE.md")
    cards = []
    for index, row in enumerate(pre_cards):
        cards.append({
            "card_id": card_id_map[row["preview_card_id"]],
            "origin_card_id": row["origin_card_id"],
            "subject_id": preview_to_entity[row["subject_preview_entity_ref"]],
            "card_type": row["card_type"],
            "title_zh": row["title_zh"],
            "author_label": row["author_label"],
            "original_title": row["original_title"],
            "country_or_region": row["country_or_region"],
            "language": row["language"],
            "period_bucket": row["period_bucket"],
            "genre_or_form": row["genre_or_form"],
            "input_layer": row["input_layer"],
            "source_minimum_status": row["source_minimum_status"],
            "issue_code": row["issue_code"],
            "content_markdown": card_sections[index],
        })

    facts = []
    fact_sources = []
    card_facts = []
    for index, row in enumerate(pre_facts, start=1):
        fact_id = f"V1-FCT-{index:04d}"
        card_id = origin_card_to_id[row["target_card_id"]]
        facts.append({
            "fact_id": fact_id,
            "origin_material_id": row["material_id"],
            "card_id": card_id,
            "subject_id": preview_to_entity[
                next(
                    entity["preview_entity_ref"]
                    for entity in pre_entities
                    if entity["origin_ref"] == row["subject_ref"]
                )
            ],
            "fact_field": row["fact_field"],
            "value_text": row["value_text"],
            "material_class": row["material_class"],
            "origin_id": row["origin_id"],
            "confidence": row["confidence"],
            "admission_status": row["admission_status"],
            "usage_note": row["usage_note"],
        })
        source_list = split_values(row["formal_source_id"])
        for source_id in source_list:
            assert source_id in source_ids
            fact_sources.append({
                "fact_id": fact_id,
                "source_id": source_id,
                "source_title": source_by_id[source_id]["title"],
            })
        card_facts.append({
            "card_id": card_id,
            "fact_id": fact_id,
            "admission_status": row["admission_status"],
        })

    card_sources = []
    for row in pre_card_sources:
        for source_id in split_values(row["formal_source_id"]):
            assert source_id in source_ids
            card_sources.append({
                "card_source_id": f"V1-CS-{len(card_sources) + 1:04d}",
                "origin_matrix_id": row["origin_matrix_id"],
                "card_id": origin_card_to_id[row["target_card_id"]],
                "source_id": source_id,
                "source_level": row["source_level"] or source_by_id[source_id]["source_level"],
                "source_role": row["source_role"],
                "bibliographic_support": row["bibliographic_support"],
                "research_support": row["research_support"],
                "independent_source_key": source_id,
                "usage_status": row["usage_status"],
                "issue_code": row["issue_code"],
            })

    title_to_card = {row["title_zh"]: row["card_id"] for row in cards}
    card_sources.extend([
        {
            "card_source_id": f"V1-CS-{len(card_sources) + 1:04d}",
            "origin_matrix_id": "A05-SRC-0001",
            "card_id": title_to_card["《彩色的一周》"],
            "source_id": "SRC-0073",
            "source_level": "A",
            "source_role": "research_partial_story_level",
            "bibliographic_support": "no",
            "research_support": "partial",
            "independent_source_key": "SRC-0073",
            "usage_status": "partial_support",
            "issue_code": "STORY-LEVEL-ONLY",
        },
        {
            "card_source_id": f"V1-CS-{len(card_sources) + 2:04d}",
            "origin_matrix_id": "A05-SRC-0003",
            "card_id": title_to_card["《金鸡》"],
            "source_id": "SRC-0074",
            "source_level": "A",
            "source_role": "research",
            "bibliographic_support": "no",
            "research_support": "yes",
            "independent_source_key": "SRC-0074",
            "usage_status": "used",
            "issue_code": "NONE",
        },
    ])

    source_holds = []
    for row in read_csv(S3S4_MAP):
        if row["mapping_action"] == "hold":
            source_holds.append({
                "source_hold_id": f"V1-SH-{len(source_holds) + 1:04d}",
                "candidate_id": row["legacy_candidate_id"],
                "title": row["source_title"],
                "source_level": row["source_level"],
                "source_task": row["source_task"],
                "hold_reason": row["mapping_note"],
            })
    for row in read_csv(A05_MAP):
        if row["mapping_action"] == "hold":
            source_holds.append({
                "source_hold_id": f"V1-SH-{len(source_holds) + 1:04d}",
                "candidate_id": row["legacy_candidate_id"],
                "title": row["source_title"],
                "source_level": row["source_level"],
                "source_task": row["source_task"],
                "hold_reason": row["mapping_note"],
            })

    gaps = []
    for index, row in enumerate(pre_gaps, start=1):
        gaps.append({
            "gap_id": f"V1-GAP-{index:04d}",
            "origin_gap_id": row["gap_register_id"],
            "gap_type": row["gap_type"],
            "gap_key": row["gap_key"],
            "current_status": row["current_status"],
            "evidence_basis": row["evidence_basis"],
            "attempts_or_count": row["attempts_or_count"],
            "owner_decision": row["owner_decision"],
            "downstream_effect": row["downstream_effect"],
            "issue_code": row["issue_code"],
        })
    gap_by_key = {row["gap_key"]: row for row in gaps}
    gap_by_key["charter_150_vs_current_75"].update({
        "current_status": "resolved_at_n3_threshold_75",
        "attempts_or_count": "76/75",
        "owner_decision": "USER@N3",
        "downstream_effect": "V1 门槛已满足；150 转为 V1.1 扩展目标",
        "issue_code": "RESOLVED-N3",
    })
    gap_by_key["based_on_event_work_event"].update({
        "current_status": "resolved_implemented_schema_0_3",
        "owner_decision": "USER@N3",
        "downstream_effect": "生成 V1-REL-0076；端点严格为 work→event",
        "issue_code": "RESOLVED-N3",
    })
    gap_by_key["author_event_x4"].update({
        "current_status": "resolved_keep_explanatory_only",
        "owner_decision": "USER@N3",
        "downstream_effect": "不新增 author→event 关系词，不进入正式关系表",
        "issue_code": "RESOLVED-N3",
    })
    gap_by_key["political_poetry_3_1_1"].update({
        "current_status": "resolved_keep_3_1_1_layering",
        "owner_decision": "USER@N3",
        "downstream_effect": "维持 hold×3、作者级×1、gap×1 的展示边界",
        "issue_code": "RESOLVED-N3",
    })
    n3_decisions = [
        {
            "decision_id": row["n3_decision_id"],
            "decision_topic": row["decision_topic"],
            "current_state": row["current_state"],
            "evidence_summary": row["evidence_summary"],
            "options": row["options"],
            "codex_recommendation": row["codex_recommendation_draft"],
            "user_decision_required": row["user_decision_required"],
            "downstream_effect": row["downstream_effect"],
        }
        for row in pre_n3
    ]
    # At the actual N3 node the earlier PRE wording "decide at N3" would be
    # circular.  Provide a concrete PM recommendation while preserving USER
    # authority and the frozen charter until explicit approval.
    n3_decisions[0]["codex_recommendation"] = (
        "建议 B：由用户明确批准把 V1 最低门槛从 ≥150 调整为 ≥75 条经审核关系，"
        "150 作为 V1.1 扩展目标；不以 hold、legacy 或 pending 补数。"
        "用户批准前不修改 project/governance/PROJECT_CHARTER.md（草案，非用户结论）"
    )
    for row, choice in zip(n3_decisions, ["B", "A", "A", "A"]):
        row["user_decision_required"] = "no"
        row["user_choice"] = choice
        row["decision_status"] = "approved_by_user"
        row["decided_at"] = "2026-08-11"

    tables = {
        "sources": sources,
        "source_holds": source_holds,
        "entities": entities,
        "entity_id_map": entity_map,
        "relationships": relationships,
        "relationship_evidence": eligible_evidence,
        "relationship_sources": relation_sources_rows,
        "relation_holds": relation_holds,
        "relation_hold_evidence": hold_evidence,
        "facts": facts,
        "fact_sources": fact_sources,
        "content_cards": cards,
        "card_facts": card_facts,
        "card_sources": card_sources,
        "gaps": gaps,
        "n3_decisions": n3_decisions,
        "legacy_relation_groups": legacy_groups,
    }

    assert len(relationships) == 76
    assert len(relation_holds) == 40
    assert len(eligible_evidence) == 91
    assert len(hold_evidence) == 40
    assert len(facts) == 238
    assert len(cards) == 40
    assert len(card_sources) == 80
    assert len(sources) == 74
    assert len(source_holds) == 4
    assert len(gaps) == 13
    assert len(n3_decisions) == 4
    assert sum(row["relation_type"] == "BASED_ON_EVENT" for row in relationships) == 1
    assert not any(row["relation_type"] == "BASED_ON_EVENT" for row in relation_holds)
    assert all(row["user_decision_required"] == "no" for row in n3_decisions)
    assert Counter(row["admission_status"] for row in facts) == {
        "accepted_for_n2": 50,
        "batch_retained_candidate": 161,
        "candidate_for_staging_review": 20,
        "hold": 2,
        "gap": 2,
        "research_note_only": 1,
        "not_work_level": 1,
        "pending_n3": 1,
    }

    file_map = {
        "SOURCES.csv": "sources",
        "SOURCE_HOLDS.csv": "source_holds",
        "ENTITIES.csv": "entities",
        "ENTITY_ID_MAP.csv": "entity_id_map",
        "RELATIONSHIPS.csv": "relationships",
        "RELATION_EVIDENCE.csv": "relationship_evidence",
        "RELATION_SOURCES.csv": "relationship_sources",
        "RELATION_HOLDS.csv": "relation_holds",
        "RELATION_HOLD_EVIDENCE.csv": "relation_hold_evidence",
        "FACTS.csv": "facts",
        "FACT_SOURCES.csv": "fact_sources",
        "CONTENT_CARDS.csv": "content_cards",
        "CARD_FACTS.csv": "card_facts",
        "CARD_SOURCES.csv": "card_sources",
        "GAPS.csv": "gaps",
        "N3_DECISIONS.csv": "n3_decisions",
        "LEGACY_RELATION_GROUPS.csv": "legacy_relation_groups",
    }
    for filename, key in file_map.items():
        rows = tables[key]
        write_csv(OUT / filename, rows, list(rows[0].keys()))

    metadata = {
        "package": "V1 formal candidate package",
        "schema_version": "0.3",
        "generated_at": "2026-08-11",
        "status": "accepted_at_n3",
        "relationship_threshold": 75,
        "v1_1_expansion_target": 150,
        "eligible_relationship_count": 76,
        "relationship_gap": 0,
        "source_count": 74,
        "entity_count": 144,
        "fact_count": 238,
        "card_count": 40,
        "n3_decision_count": 4,
        "sha256": {key: norm_sha(value) for key, value in tables.items()},
    }
    payload = {"metadata": metadata}
    payload.update(tables)
    (OUT / "V1_CANDIDATE.json").write_text(
        json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8"
    )

    build_sqlite(OUT / "V1_CANDIDATE.sqlite", tables, metadata)
    write_docs(tables, metadata)
    write_manifest()
    print(json.dumps({key: len(value) for key, value in tables.items()}, ensure_ascii=False, indent=2))


def build_sqlite(path: Path, tables: dict[str, list[dict[str, str]]], metadata: dict) -> None:
    if path.exists():
        path.unlink()
    connection = sqlite3.connect(path)
    connection.execute("PRAGMA foreign_keys=ON")
    connection.execute("CREATE TABLE metadata (key TEXT PRIMARY KEY, value TEXT NOT NULL)")
    connection.executemany(
        "INSERT INTO metadata VALUES (?, ?)",
        [(key, json.dumps(value, ensure_ascii=False) if isinstance(value, (dict, list)) else str(value))
         for key, value in metadata.items()],
    )

    definitions = {
        "sources": ("source_id", {}),
        "source_holds": ("source_hold_id", {}),
        "entities": ("entity_id", {}),
        "entity_id_map": ("mapping_id", {"entity_id": ("entities", "entity_id")}),
        "relationships": ("relationship_id", {
            "subject_id": ("entities", "entity_id"),
            "object_id": ("entities", "entity_id"),
        }),
        "relationship_evidence": ("evidence_id", {
            "relationship_id": ("relationships", "relationship_id"),
            "source_id": ("sources", "source_id"),
        }),
        "relationship_sources": (None, {
            "relationship_id": ("relationships", "relationship_id"),
            "source_id": ("sources", "source_id"),
        }),
        "relation_holds": ("relation_hold_id", {
            "subject_id": ("entities", "entity_id"),
            "object_id": ("entities", "entity_id"),
        }),
        "relation_hold_evidence": ("evidence_id", {
            "relation_hold_id": ("relation_holds", "relation_hold_id"),
            "source_id": ("sources", "source_id"),
        }),
        "content_cards": ("card_id", {"subject_id": ("entities", "entity_id")}),
        "facts": ("fact_id", {
            "card_id": ("content_cards", "card_id"),
            "subject_id": ("entities", "entity_id"),
        }),
        "fact_sources": (None, {
            "fact_id": ("facts", "fact_id"),
            "source_id": ("sources", "source_id"),
        }),
        "card_facts": (None, {
            "card_id": ("content_cards", "card_id"),
            "fact_id": ("facts", "fact_id"),
        }),
        "card_sources": ("card_source_id", {
            "card_id": ("content_cards", "card_id"),
            "source_id": ("sources", "source_id"),
        }),
        "gaps": ("gap_id", {}),
        "n3_decisions": ("decision_id", {}),
        "legacy_relation_groups": ("legacy_group_id", {}),
    }
    order = [
        "sources", "source_holds", "entities", "entity_id_map", "relationships",
        "relationship_evidence", "relationship_sources", "relation_holds",
        "relation_hold_evidence", "content_cards", "facts", "fact_sources",
        "card_facts", "card_sources", "gaps", "n3_decisions",
        "legacy_relation_groups",
    ]
    for name in order:
        rows = tables[name]
        fields = list(rows[0].keys())
        primary, foreign = definitions[name]
        columns = []
        for field in fields:
            clause = f'"{field}" TEXT'
            if field == primary:
                clause += " PRIMARY KEY"
            if field in foreign:
                target_table, target_field = foreign[field]
                clause += f' REFERENCES "{target_table}"("{target_field}")'
            columns.append(clause)
        if name in {"relationship_sources", "fact_sources", "card_facts"}:
            columns.append(f'PRIMARY KEY ("{fields[0]}", "{fields[1]}")')
        connection.execute(f'CREATE TABLE "{name}" ({", ".join(columns)})')
        placeholders = ",".join("?" for _ in fields)
        connection.executemany(
            f'INSERT INTO "{name}" VALUES ({placeholders})',
            [[row[field] for field in fields] for row in rows],
        )
    assert connection.execute("PRAGMA integrity_check").fetchone()[0] == "ok"
    assert connection.execute("PRAGMA foreign_key_check").fetchall() == []
    connection.commit()
    connection.close()


def write_docs(tables: dict[str, list[dict[str, str]]], metadata: dict) -> None:
    counts = {key: len(value) for key, value in tables.items()}
    (OUT / "README.md").write_text(
        "# 拉丁美洲文学地图 V1.0.0 发布快照\n\n"
        "本目录保留 V1.0.0 正式发布快照；目录名 v1_candidate 为建设期遗留命名。长期增量主库已迁移至 data/master/V1_MASTER.sqlite。\n\n"
        f"- 正式来源：{counts['sources']}；来源 hold：{counts['source_holds']}；\n"
        f"- 规范实体：{counts['entities']}，由 {counts['entity_id_map']} 个上游引用映射而来；\n"
        f"- 可审核关系：{counts['relationships']}；主 hold：{counts['relation_holds']}；\n"
        f"- 事实素材：{counts['facts']}；内容卡：{counts['content_cards']}；\n"
        f"- 缺口登记：{counts['gaps']}；N3 用户决策：{counts['n3_decisions']} 项均已完成。\n\n"
        "CSV、JSON、SQLite 由 scripts/build_v1_candidate.py 同源生成；该脚本仅用于 V1.0.0 历史回归。"
        "后续增量必须通过 data/master/V1_MASTER.sqlite 的版本化迁移和通用导出工具完成。\n",
        encoding="utf-8",
    )

    dictionary_lines = [
        "# V1 候选包数据字典",
        "",
        "- Schema：0.3；N3 已批准并实现 BASED_ON_EVENT（work→event）加法升级。",
        "- 所有 V1-ENT / V1-REL / V1-FCT / V1-CARD ID 在 V1.0.0 发布时冻结；后续修改必须通过版本化迁移、动态 QA 和新的版本记录。",
        "",
        "## 逻辑表",
        "",
    ]
    for name, rows in tables.items():
        dictionary_lines.append(f"### {name}（{len(rows)} 行）")
        dictionary_lines.append("")
        dictionary_lines.append("字段：" + "、".join(rows[0].keys()) + "。")
        dictionary_lines.append("")
    (OUT / "DATA_DICTIONARY.md").write_text("\n".join(dictionary_lines), encoding="utf-8")

    source_counts = Counter(row["source_level"] for row in tables["sources"])
    task_counts = Counter(row["source_task"] for row in tables["sources"])
    catalog = [
        "# V1 来源目录",
        "",
        f"正式来源共 {len(tables['sources'])} 项；等级分布：" +
        "、".join(f"{key}×{value}" for key, value in sorted(source_counts.items())) + "。",
        "",
        "来源任务分布：" + "、".join(f"{key}×{value}" for key, value in sorted(task_counts.items())) + "。",
        "",
        "| 来源 ID | 等级 | 题名 | 稳定 URL |",
        "|---|---|---|---|",
    ]
    for row in tables["sources"]:
        catalog.append(
            f"| {row['source_id']} | {row['source_level']} | "
            f"{row['title'].replace('|', '／')} | {row['canonical_url']} |"
        )
    catalog.extend([
        "",
        "## 未编号线索",
        "",
        "| 候选 ID | 等级 | 题名 | 原因 |",
        "|---|---|---|---|",
    ])
    for row in tables["source_holds"]:
        catalog.append(
            f"| {row['candidate_id']} | {row['source_level']} | "
            f"{row['title'].replace('|', '／')} | {row['hold_reason'].replace('|', '／')} |"
        )
    (OUT / "SOURCE_CATALOG.md").write_text("\n".join(catalog), encoding="utf-8")

    n3 = [
        "# N3：V1 候选版审核结论",
        "",
        "USER 于 2026-08-11 回复 B/A/A/A，四项决定均已生效。",
        "",
    ]
    for decision in tables["n3_decisions"]:
        n3.extend([
            f"## {decision['decision_id']}：{decision['decision_topic']}",
            "",
            f"- 当前状态：{decision['current_state']}",
            f"- 证据摘要：{decision['evidence_summary']}",
            f"- 选项：{decision['options']}",
            f"- Codex 建议：{decision['codex_recommendation']}",
            f"- 用户选择：{decision['user_choice']}",
            f"- 决策状态：{decision['decision_status']}（{decision['decided_at']}）",
            f"- 下游影响：{decision['downstream_effect']}",
            "",
        ])
    n3.extend([
        "## 实施结果",
        "",
        "- V1 最低关系门槛调整为 75；150 转为 V1.1 扩展目标。",
        "- Schema 升级为 0.3，新增 BASED_ON_EVENT，生成 V1-REL-0076。",
        "- author→event 不建模；政治诗歌维持 3/1/1 分层。",
        "- 本文件记录 N3 决策；V1.0.0 正式发布见 docs/releases/V1_正式发布说明.md。",
    ])
    (OUT / "N3_审核包.md").write_text("\n".join(n3), encoding="utf-8")

    quality = [
        "# V1 候选包质量报告",
        "",
        "- 构建结果：pass",
        "- SQLite integrity_check：ok",
        "- SQLite foreign_key_check：0",
        "- 关系词：全部属于 Schema 0.3 的 13 词；BASED_ON_EVENT 仅有 1 条 work→event。",
        "- 关系规模：76/75，V1 门槛满足；150 为 V1.1 扩展目标；hold、legacy 和 pending 均未补数。",
        "- 事实分层：" + "、".join(
            f"{key}×{value}" for key, value in Counter(
                row["admission_status"] for row in tables["facts"]
            ).items()
        ) + "。",
        "",
        "## 表计数与规范化 SHA-256",
        "",
        "| 表 | 行数 | SHA-256 |",
        "|---|---:|---|",
    ]
    for key, rows in tables.items():
        quality.append(f"| {key} | {len(rows)} | {norm_sha(rows)} |")
    (OUT / "QUALITY_REPORT.md").write_text("\n".join(quality), encoding="utf-8")


def write_manifest() -> None:
    for _ in range(10):
        files = sorted(path for path in OUT.iterdir() if path.is_file())
        rows = [
            "# MANIFEST：V1 候选包",
            "",
            "| # | 文件名 | 字节数 | SHA-256 |",
            "|---:|---|---:|---|",
        ]
        for index, path in enumerate(files, start=1):
            size = path.stat().st_size
            # MANIFEST cannot contain its own final SHA-256 without changing
            # that hash again.  Record the self-row explicitly and converge on
            # the actual byte size; all other files retain ordinary SHA-256.
            digest = (
                "SELF"
                if path.name == "MANIFEST.md"
                else hashlib.sha256(path.read_bytes()).hexdigest()
            )
            rows.append(f"| {index} | {path.name} | {size} | {digest} |")
        content = "\n".join(rows) + "\n"
        manifest = OUT / "MANIFEST.md"
        before = manifest.read_text(encoding="utf-8") if manifest.exists() else None
        manifest.write_text(content, encoding="utf-8")
        if before == content:
            break


if __name__ == "__main__":
    main()
