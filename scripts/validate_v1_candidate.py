#!/usr/bin/env python3
"""Independent gate for the formal V1 candidate package."""

from __future__ import annotations

import csv
import hashlib
import json
import re
import sqlite3
import zipfile
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
PACKAGE = ROOT / "data/staging/v1_candidate"

FILE_MAP = {
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

EXPECTED_COUNTS = {
    "sources": 74,
    "source_holds": 4,
    "entities": 144,
    "entity_id_map": 146,
    "relationships": 76,
    "relationship_evidence": 91,
    "relationship_sources": 88,
    "relation_holds": 40,
    "relation_hold_evidence": 40,
    "facts": 238,
    "fact_sources": 238,
    "content_cards": 40,
    "card_facts": 238,
    "card_sources": 80,
    "gaps": 13,
    "n3_decisions": 4,
    "legacy_relation_groups": 15,
}

ALLOWED_RELATIONS = {
    "CREATED", "CONTAINS_WORK", "EDITION_OF", "TRANSLATION_OF",
    "ADAPTED_FROM", "DIRECTED", "SET_IN", "ASSOCIATED_WITH_PLACE",
    "ASSOCIATED_WITH_MOVEMENT", "EXPLORES_THEME", "RESPONDS_TO_WORK",
    "INFLUENCED_BY",
    "BASED_ON_EVENT",
}


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(encoding="utf-8-sig", newline="") as handle:
        return list(csv.DictReader(handle))


def norm_sha(rows: list[dict[str, str]]) -> str:
    payload = json.dumps(
        [sorted(row.items()) for row in rows],
        ensure_ascii=False,
        sort_keys=True,
        separators=(",", ":"),
    ).encode("utf-8")
    return hashlib.sha256(payload).hexdigest()


def assert_sequence(rows: list[dict[str, str]], field: str, prefix: str) -> None:
    expected = [f"{prefix}{index:04d}" for index in range(1, len(rows) + 1)]
    actual = [row[field] for row in rows]
    assert actual == expected, f"non-sequential {field}"


def validate_manifest() -> None:
    manifest = PACKAGE / "MANIFEST.md"
    lines = [line for line in manifest.read_text(encoding="utf-8").splitlines() if re.match(r"^\| \d+ \|", line)]
    actual_files = sorted(path.name for path in PACKAGE.iterdir() if path.is_file())
    assert len(lines) == len(actual_files) == 27
    listed = []
    for line in lines:
        cells = [cell.strip() for cell in line.strip("|").split("|")]
        _, name, size_text, digest = cells
        listed.append(name)
        path = PACKAGE / name
        assert path.stat().st_size == int(size_text), f"manifest size: {name}"
        if name == "MANIFEST.md":
            assert digest == "SELF"
        else:
            assert hashlib.sha256(path.read_bytes()).hexdigest() == digest, f"manifest hash: {name}"
    assert listed == actual_files


def main() -> None:
    tables = {key: read_csv(PACKAGE / filename) for filename, key in FILE_MAP.items()}
    assert {key: len(rows) for key, rows in tables.items()} == EXPECTED_COUNTS

    assert_sequence(tables["sources"], "source_id", "SRC-")
    assert_sequence(tables["entities"], "entity_id", "V1-ENT-")
    assert_sequence(tables["relationships"], "relationship_id", "V1-REL-")
    assert_sequence(tables["facts"], "fact_id", "V1-FCT-")
    assert_sequence(tables["content_cards"], "card_id", "V1-CARD-")

    entity_ids = {row["entity_id"] for row in tables["entities"]}
    source_ids = {row["source_id"] for row in tables["sources"]}
    relation_ids = {row["relationship_id"] for row in tables["relationships"]}
    hold_ids = {row["relation_hold_id"] for row in tables["relation_holds"]}
    fact_ids = {row["fact_id"] for row in tables["facts"]}
    card_ids = {row["card_id"] for row in tables["content_cards"]}

    assert source_ids == {f"SRC-{index:04d}" for index in range(1, 75)}
    assert not any(row["temporary_id"] == "A05-SRC-0002" for row in tables["sources"])
    assert any(row["temporary_id"] == "A05-SRC-0001" and row["source_id"] == "SRC-0073" for row in tables["sources"])
    assert any(row["temporary_id"] == "A05-SRC-0003" and row["source_id"] == "SRC-0074" for row in tables["sources"])

    assert len(tables["entities"]) == 144 and len(tables["entity_id_map"]) == 146
    assert sum(row["mapping_action"] == "merge_exact" for row in tables["entity_id_map"]) == 4
    assert all(row["entity_id"] in entity_ids for row in tables["entity_id_map"])
    consejero = [row for row in tables["entity_id_map"] if row["origin_ref"] == "B03-ENT-0028"]
    assert len(consejero) == 1 and consejero[0]["mapping_action"] != "merge_exact"

    assert all(row["relation_type"] in ALLOWED_RELATIONS for row in tables["relationships"])
    assert all(row["subject_id"] in entity_ids and row["object_id"] in entity_ids for row in tables["relationships"])
    event_relations = [row for row in tables["relationships"] if row["relation_type"] == "BASED_ON_EVENT"]
    assert len(event_relations) == 1
    assert event_relations[0]["relationship_id"] == "V1-REL-0076"
    assert event_relations[0]["subject_id"] == "V1-ENT-0118"
    assert event_relations[0]["object_id"] == "V1-ENT-0139"
    assert event_relations[0]["review_status"] == "accepted_at_n3"
    assert all(row["relationship_id"] in relation_ids and row["source_id"] in source_ids for row in tables["relationship_evidence"])
    assert sum(row["evidence_origin"] == "A05_LEGACY" for row in tables["relationship_evidence"]) == 11
    assert len({row["relationship_id"] for row in tables["relationship_evidence"] if row["evidence_origin"] == "A05_LEGACY"}) == 9
    event_evidence = [row for row in tables["relationship_evidence"] if row["relationship_id"] == "V1-REL-0076"]
    assert len(event_evidence) == 3
    assert Counter(row["evidence_status"] for row in event_evidence) == {"direct": 1, "indirect": 2}
    assert {row["source_id"] for row in event_evidence} == {"SRC-0046", "SRC-0063"}
    assert all(row["relationship_id"] in relation_ids and row["source_id"] in source_ids for row in tables["relationship_sources"])
    assert all(row["net_new_eligible"] == "0" for row in tables["legacy_relation_groups"] if row["legacy_group_id"] in {f"LG-A05-{index:04d}" for index in range(7, 16)})

    assert all(row["relation_type"] in ALLOWED_RELATIONS for row in tables["relation_holds"])
    assert all(row["subject_id"] in entity_ids and row["object_id"] in entity_ids for row in tables["relation_holds"])
    assert all(row["relation_hold_id"] in hold_ids and row["source_id"] in source_ids for row in tables["relation_hold_evidence"])

    fact_statuses = Counter(row["admission_status"] for row in tables["facts"])
    assert fact_statuses == Counter({
        "accepted_for_n2": 50,
        "batch_retained_candidate": 161,
        "candidate_for_staging_review": 20,
        "hold": 2,
        "research_note_only": 1,
        "gap": 2,
        "not_work_level": 1,
        "pending_n3": 1,
    })
    assert all(row["card_id"] in card_ids and row["subject_id"] in entity_ids for row in tables["facts"])
    sourced_facts = {row["fact_id"] for row in tables["fact_sources"]}
    assert len(sourced_facts) == 237 and fact_ids - sourced_facts == {"V1-FCT-0235"}
    assert all(row["fact_id"] in fact_ids and row["source_id"] in source_ids for row in tables["fact_sources"])
    assert all(row["card_id"] in card_ids and row["fact_id"] in fact_ids for row in tables["card_facts"])
    assert all(row["card_id"] in card_ids and row["source_id"] in source_ids for row in tables["card_sources"])

    decisions = tables["n3_decisions"]
    assert [row["decision_id"] for row in decisions] == [f"N3-DEC-{index:03d}" for index in range(1, 5)]
    assert all(row["user_decision_required"] == "no" for row in decisions)
    assert [row["user_choice"] for row in decisions] == ["B", "A", "A", "A"]
    assert all(row["decision_status"] == "approved_by_user" and row["decided_at"] == "2026-08-11" for row in decisions)

    gaps = {row["gap_key"]: row for row in tables["gaps"]}
    assert gaps["charter_150_vs_current_75"]["current_status"] == "resolved_at_n3_threshold_75"
    assert gaps["based_on_event_work_event"]["current_status"] == "resolved_implemented_schema_0_3"
    assert gaps["author_event_x4"]["current_status"] == "resolved_keep_explanatory_only"
    assert gaps["political_poetry_3_1_1"]["current_status"] == "resolved_keep_3_1_1_layering"

    payload = json.loads((PACKAGE / "V1_CANDIDATE.json").read_text(encoding="utf-8"))
    assert payload["metadata"]["schema_version"] == "0.3"
    assert payload["metadata"]["relationship_threshold"] == 75
    assert payload["metadata"]["v1_1_expansion_target"] == 150
    assert payload["metadata"]["eligible_relationship_count"] == 76
    assert payload["metadata"]["relationship_gap"] == 0
    for key, rows in tables.items():
        assert payload[key] == rows, f"JSON mismatch: {key}"
        assert payload["metadata"]["sha256"][key] == norm_sha(rows), f"JSON hash: {key}"

    connection = sqlite3.connect(PACKAGE / "V1_CANDIDATE.sqlite")
    assert connection.execute("PRAGMA integrity_check").fetchone()[0] == "ok"
    assert connection.execute("PRAGMA foreign_key_check").fetchall() == []
    for key, count in EXPECTED_COUNTS.items():
        assert connection.execute(f'SELECT COUNT(*) FROM "{key}"').fetchone()[0] == count
    connection.close()

    with zipfile.ZipFile(PACKAGE / "V1_CANDIDATE.xlsx") as archive:
        worksheet_files = [name for name in archive.namelist() if re.fullmatch(r"xl/worksheets/sheet\d+\.xml", name)]
        assert len(worksheet_files) == 18
        xml = b"\n".join(archive.read(name) for name in worksheet_files)
        assert not any(token in xml for token in [b"#REF!", b"#DIV/0!", b"#VALUE!", b"#NAME?", b"#N/A"])

    validate_manifest()
    print(json.dumps({
        "verdict": "pass",
        "errors": 0,
        "warnings": 0,
        "files": 27,
        "tables": EXPECTED_COUNTS,
        "sqlite_integrity": "ok",
        "sqlite_foreign_key_errors": 0,
        "xlsx_sheets": 18,
    }, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
