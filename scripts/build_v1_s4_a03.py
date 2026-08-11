#!/usr/bin/env python3
"""Build the Codex-led V1-S4-A03 audit tables from approved inputs."""

from __future__ import annotations

import csv
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / "work/codex/V1-S4-A03_关系词统一与争议处理"
SOURCE_MAP = ROOT / "data/catalog/SOURCE_ID_MAP_V1_S3_S4.csv"
A01 = ROOT / "work/external-ai/deliveries/V1-S4-A01_阶段4权威补证与兼容性研究包_交付"
A02 = ROOT / "work/external-ai/deliveries/V1-S4-A02_全局机械规范化与开放目录补核_交付"

BATCHES = {
    "B01": ROOT / "work/external-ai/deliveries/V1-S3-B01_墨西哥三作家研究里程碑_交付",
    "B02": ROOT / "work/external-ai/deliveries/V1-S3-B02_文学爆炸与加勒比三作家里程碑_交付",
    "B03": ROOT / "work/external-ai/deliveries/V1-S3-B03_安第斯与诗歌双作家里程碑_交付",
}

VOCABULARY = {
    "CREATED": ("author → work/collection", "direct_fact"),
    "CONTAINS_WORK": ("collection → work", "structural_fact"),
    "EDITION_OF": ("edition → work/collection", "bibliographic_fact"),
    "TRANSLATION_OF": ("edition → work/collection", "bibliographic_fact"),
    "ADAPTED_FROM": ("adaptation → work", "adaptation_fact"),
    "DIRECTED": ("person/author → adaptation", "direct_fact"),
    "SET_IN": ("work → place", "setting_fact"),
    "ASSOCIATED_WITH_PLACE": ("author/work → place", "context_fact"),
    "ASSOCIATED_WITH_MOVEMENT": ("author/work → movement", "interpretive"),
    "EXPLORES_THEME": ("work → theme", "interpretive"),
    "RESPONDS_TO_WORK": ("work → work", "interpretive"),
    "INFLUENCED_BY": ("author/work → author/work", "interpretive"),
}


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(encoding="utf-8-sig", newline="") as handle:
        return list(csv.DictReader(handle))


def write_csv(name: str, fieldnames: list[str], rows: list[dict[str, str]]) -> None:
    path = OUTPUT / name
    with path.open("w", encoding="utf-8-sig", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def main() -> None:
    OUTPUT.mkdir(parents=True, exist_ok=True)
    mapping_rows = read_csv(SOURCE_MAP)
    source_map = {
        row["legacy_candidate_id"]: row["source_id"]
        for row in mapping_rows
        if row["source_id"]
    }

    all_groups: list[dict[str, str]] = []
    hold_rows: list[dict[str, str]] = []
    for batch, folder in BATCHES.items():
        groups = read_csv(folder / "RELATION_GROUP_SUMMARY.csv")
        all_groups.extend(groups)
        for row in groups:
            if row["review_status"] != "hold_needs_second_source":
                continue
            candidate_sources = [value for value in row["source_ids"].split(";") if value]
            missing = [value for value in candidate_sources if value not in source_map]
            if missing:
                raise RuntimeError(f"unmapped hold evidence in {row['relation_group_id']}: {missing}")
            hold_rows.append(
                {
                    "audit_id": f"A03-HOLD-{len(hold_rows) + 1:04d}",
                    "batch": batch,
                    "relation_group_id": row["relation_group_id"],
                    "subject_label": row["subject_label"],
                    "relation_type": row["relation_type"],
                    "object_label": row["object_label"],
                    "description_zh": row["description_zh"],
                    "candidate_source_ids": ";".join(candidate_sources),
                    "formal_source_ids": ";".join(source_map[value] for value in candidate_sources),
                    "evidence_count": row["evidence_count"],
                    "confidence": row["confidence"],
                    "original_status": row["review_status"],
                    "a03_status": "remain_hold_needs_second_source",
                    "new_evidence_checked": "A01/A02 admitted evidence",
                    "a03_reason": "A01/A02 新增来源未对同一解释性三元关系提供第二个独立且明确的合格来源；不得因基础事实或题名近似升级",
                }
            )
    if len(all_groups) != 88 or len(hold_rows) != 29:
        raise RuntimeError(f"expected 88 groups and 29 holds, got {len(all_groups)} and {len(hold_rows)}")

    write_csv(
        "RELATION_HOLD_AUDIT.csv",
        [
            "audit_id",
            "batch",
            "relation_group_id",
            "subject_label",
            "relation_type",
            "object_label",
            "description_zh",
            "candidate_source_ids",
            "formal_source_ids",
            "evidence_count",
            "confidence",
            "original_status",
            "a03_status",
            "new_evidence_checked",
            "a03_reason",
        ],
        hold_rows,
    )

    status_counts = Counter((row["relation_type"], row["review_status"]) for row in all_groups)
    type_counts = Counter(row["relation_type"] for row in all_groups)
    unknown_types = set(type_counts) - set(VOCABULARY)
    if unknown_types:
        raise RuntimeError(f"unknown relation types: {sorted(unknown_types)}")
    vocabulary_rows: list[dict[str, str]] = []
    for relation_type, (endpoint, evidence_class) in VOCABULARY.items():
        vocabulary_rows.append(
            {
                "relation_type": relation_type,
                "allowed_endpoint": endpoint,
                "evidence_class": evidence_class,
                "stage3_group_count": str(type_counts[relation_type]),
                "eligible_group_count": str(status_counts[(relation_type, "eligible_for_staging_review")]),
                "hold_group_count": str(status_counts[(relation_type, "hold_needs_second_source")]),
                "a03_added_candidate_count": "1" if relation_type == "SET_IN" else "0",
                "a03_decision": "retain_schema_0_2_term",
                "compatibility_note": "词义和端点保持不变；不以近义词拆分或合并",
            }
        )
    write_csv(
        "RELATION_VOCABULARY_AUDIT.csv",
        [
            "relation_type",
            "allowed_endpoint",
            "evidence_class",
            "stage3_group_count",
            "eligible_group_count",
            "hold_group_count",
            "a03_added_candidate_count",
            "a03_decision",
            "compatibility_note",
        ],
        vocabulary_rows,
    )

    relation_addition = [
        {
            "relation_candidate_id": "A03-REL-0001",
            "relation_group_id": "RG-A03-0001",
            "subject_candidate_id": "B02-ENT-0004",
            "subject_label": "《百年孤独》",
            "relation_type": "SET_IN",
            "object_candidate_id": "B02-ENT-0027",
            "object_label": "马孔多",
            "description_zh": "《百年孤独》的虚构城市为马孔多",
            "candidate_source_id": "A01-SRC-0002",
            "formal_source_id": source_map["A01-SRC-0002"],
            "evidence_note": "ANPHLAC 摘要直接称 Macondo 为小说中的虚构城市（a cidade fictícia do romance）",
            "confidence": "high",
            "review_status": "eligible_for_staging_review",
            "a03_decision": "restore_candidate_after_A01_direct_evidence",
        }
    ]
    write_csv(
        "RELATION_ADDITIONS.csv",
        list(relation_addition[0]),
        relation_addition,
    )

    fact_rows: list[dict[str, str]] = []
    for row in read_csv(A01 / "FACT_SUPPLEMENTS.csv"):
        if row["supplement_id"] == "A01-FCT-0007":
            decision = "hold"
            reason = "仅参考文献书目支持 1953，等待权威书目交叉"
        elif row["supplement_id"] == "A01-FCT-0011":
            decision = "research_note_only"
            reason = "人物原型/历史对应建模说明；不得准入别名或实体合并"
        else:
            decision = "candidate_for_staging_review"
            reason = "A01 R1 已通过的 high/none 事实候选"
        fact_rows.append(
            {
                "decision_id": f"A03-FCT-{len(fact_rows) + 1:04d}",
                "origin_id": row["supplement_id"],
                "subject_ref": row["subject_ref"],
                "subject_label": row["subject_label"],
                "fact_field": row["fact_field"],
                "value_candidate": row["value_candidate"],
                "candidate_source_id": row["source_id"],
                "formal_source_id": source_map[row["source_id"]],
                "confidence": row["confidence"],
                "original_dispute_status": row["dispute_status"],
                "a03_decision": decision,
                "a03_reason": reason,
            }
        )

    verified = {
        row["gap_id"]: row
        for row in read_csv(A02 / "OPEN_AUTHORITY_RECHECK.csv")
        if row["result_status"] in {"verified", "conflict"}
    }
    a02_fact_specs = [
        ("GAP-01", "first_periodical_publication_year", "1958", "拆分杂志首次刊载字段"),
        ("GAP-01", "first_book_edition_year", "1961", "拆分首个书版本字段"),
        ("GAP-02", "first_publication_year", "1963", "Persée 书目脚注直接载年份"),
        ("GAP-03", "first_publication_year", "1951", "BnF 稳定书目记录载 Bestiario 1951"),
        ("GAP-04", "first_publication_year", "1956", "BnF 稳定书目记录载 J. Pablos 1956"),
        ("GAP-05", "first_publication_year", "1949", "Persée 书目脚注载原版年 1949"),
        ("GAP-06", "birth_year", "1904", "将生卒年拆为原子字段"),
        ("GAP-06", "death_year", "1980", "将生卒年拆为原子字段"),
        ("GAP-07", "nationality_history", "阿根廷；1981年入法国籍", "保留 BnF 权威记录中的双重国别信息"),
        ("GAP-08", "bibliographic_scope_note", "Residencia en la tierra 1925-1931；Tercera residencia, 1935-1945", "只记录 CVC 明示题名，不推断完整分卷结构"),
        ("GAP-09", "event_year_range", "1926-1929", "BnF 主题标目直接载年份范围"),
    ]
    for gap_id, field, value, reason in a02_fact_specs:
        row = verified[gap_id]
        fact_rows.append(
            {
                "decision_id": f"A03-FCT-{len(fact_rows) + 1:04d}",
                "origin_id": gap_id,
                "subject_ref": row["subject_ref"],
                "subject_label": row["subject_label"],
                "fact_field": field,
                "value_candidate": value,
                "candidate_source_id": row["source_candidate_id"],
                "formal_source_id": source_map[row["source_candidate_id"]],
                "confidence": "high" if row["proposed_level"] == "A" else "medium",
                "original_dispute_status": row["result_status"],
                "a03_decision": "candidate_for_staging_review",
                "a03_reason": reason,
            }
        )
    if len(fact_rows) != 22:
        raise RuntimeError(f"expected 22 fact decisions, got {len(fact_rows)}")
    write_csv(
        "FACT_ADMISSION_DECISIONS.csv",
        [
            "decision_id",
            "origin_id",
            "subject_ref",
            "subject_label",
            "fact_field",
            "value_candidate",
            "candidate_source_id",
            "formal_source_id",
            "confidence",
            "original_dispute_status",
            "a03_decision",
            "a03_reason",
        ],
        fact_rows,
    )

    poetry_rows: list[dict[str, str]] = []
    for row in read_csv(A01 / "POLITICAL_POETRY_EVIDENCE.csv"):
        candidate_source = row["source_id"] if row["source_id"].startswith("A01-SRC-") else ""
        poetry_rows.append(
            {
                "evidence_id": row["evidence_id"],
                "work_ref": row["work_ref"],
                "work_label": row["work_label"],
                "theme_label": row["theme_label"],
                "candidate_source_id": candidate_source,
                "formal_source_id": source_map[candidate_source] if candidate_source else "",
                "source_scope": row["source_scope"],
                "independent_source_count": row["independent_source_count"],
                "a03_decision": row["recommendation"],
                "a03_reason": "A02 未顺带取得同一作品级主题的第二独立来源；保持 A01 R1 分层",
            }
        )
    write_csv(
        "POLITICAL_POETRY_DECISIONS.csv",
        list(poetry_rows[0]),
        poetry_rows,
    )

    event_rows: list[dict[str, str]] = []
    for row in read_csv(A01 / "EVENT_RELATION_EVIDENCE.csv"):
        counted = "yes" if row["evidence_id"] in {"A01-EV-0001", "A01-EV-0002"} else "no_same_source_as_EV_0001"
        strength = "direct" if row["evidence_id"] == "A01-EV-0001" else "indirect"
        event_rows.append(
            {
                "evidence_id": row["evidence_id"],
                "work_ref": row["work_ref"],
                "event_ref": row["event_ref"],
                "candidate_source_id": row["source_id"],
                "formal_source_id": source_map[row["source_id"]],
                "evidence_strength": strength,
                "independent_source_counted": counted,
                "a03_decision": "compatibility_evidence_only_pending_N3",
                "a03_reason": "Schema 0.2 无 BASED_ON_EVENT；不生成正式关系",
            }
        )
    write_csv(
        "EVENT_COMPATIBILITY_DECISIONS.csv",
        list(event_rows[0]),
        event_rows,
    )

    print("stage3_groups=88")
    print("holds_audited=29")
    print("holds_upgraded=0")
    print("relation_additions=1")
    print("fact_decisions=22")
    print("political_poetry_decisions=5")
    print("event_compatibility_evidence=3")


if __name__ == "__main__":
    main()
