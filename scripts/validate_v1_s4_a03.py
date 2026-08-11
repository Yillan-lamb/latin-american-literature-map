#!/usr/bin/env python3
"""Validate the Codex-led V1-S4-A03 source, relation, and fact decisions."""

from __future__ import annotations

import csv
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
PACKAGE = ROOT / "work/codex/V1-S4-A03_关系词统一与争议处理"


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(encoding="utf-8-sig", newline="") as handle:
        return list(csv.DictReader(handle))


def main() -> None:
    registry = read_csv(ROOT / "data/catalog/SOURCE_REGISTRY.csv")
    mapping = read_csv(ROOT / "data/catalog/SOURCE_ID_MAP_V1_S3_S4.csv")
    formal_ids = {row["source_id"] for row in registry}
    # A03 froze its own source slice at SRC-0072.  Later milestones may append
    # sources, so validate that historical prefix without making this audit
    # incompatible with a growing registry.
    assert len(registry) >= 72
    assert [row["source_id"] for row in registry[:72]] == [f"SRC-{number:04d}" for number in range(1, 73)]
    assert len(mapping) == 61
    assert Counter(row["mapping_action"] for row in mapping) == {
        "new_sequence_candidate": 56,
        "reuse_existing": 2,
        "hold": 3,
    }
    assert all(not row["source_id"] for row in mapping if row["mapping_action"] == "hold")
    assert all(row["source_id"] in formal_ids for row in mapping if row["source_id"])

    holds = read_csv(PACKAGE / "RELATION_HOLD_AUDIT.csv")
    assert len(holds) == 29 == len({row["relation_group_id"] for row in holds})
    assert Counter(row["batch"] for row in holds) == {"B01": 7, "B02": 15, "B03": 7}
    assert Counter(row["relation_type"] for row in holds) == {
        "EXPLORES_THEME": 22,
        "ASSOCIATED_WITH_MOVEMENT": 7,
    }
    assert all(row["a03_status"] == "remain_hold_needs_second_source" for row in holds)
    for row in holds:
        assert all(value in formal_ids for value in row["formal_source_ids"].split(";") if value)

    vocabulary = read_csv(PACKAGE / "RELATION_VOCABULARY_AUDIT.csv")
    assert len(vocabulary) == 12 == len({row["relation_type"] for row in vocabulary})
    assert sum(int(row["stage3_group_count"]) for row in vocabulary) == 88
    assert sum(int(row["eligible_group_count"]) for row in vocabulary) == 59
    assert sum(int(row["hold_group_count"]) for row in vocabulary) == 29
    assert all(row["a03_decision"] == "retain_schema_0_2_term" for row in vocabulary)

    additions = read_csv(PACKAGE / "RELATION_ADDITIONS.csv")
    assert len(additions) == 1
    assert additions[0]["relation_type"] == "SET_IN"
    assert additions[0]["review_status"] == "eligible_for_staging_review"
    assert additions[0]["formal_source_id"] in formal_ids

    facts = read_csv(PACKAGE / "FACT_ADMISSION_DECISIONS.csv")
    assert len(facts) == 22 == len({row["decision_id"] for row in facts})
    assert Counter(row["a03_decision"] for row in facts) == {
        "candidate_for_staging_review": 20,
        "hold": 1,
        "research_note_only": 1,
    }
    assert all(row["formal_source_id"] in formal_ids for row in facts)
    colonel = [row for row in facts if row["origin_id"] == "GAP-01"]
    assert {(row["fact_field"], row["value_candidate"]) for row in colonel} == {
        ("first_periodical_publication_year", "1958"),
        ("first_book_edition_year", "1961"),
    }

    poetry = read_csv(PACKAGE / "POLITICAL_POETRY_DECISIONS.csv")
    assert len(poetry) == 5
    assert Counter(row["a03_decision"] for row in poetry) == {
        "hold": 3,
        "not_work_level": 1,
        "gap": 1,
    }
    assert all(row["formal_source_id"] in formal_ids for row in poetry if row["formal_source_id"])

    events = read_csv(PACKAGE / "EVENT_COMPATIBILITY_DECISIONS.csv")
    assert len(events) == 3
    assert Counter(row["evidence_strength"] for row in events) == {"direct": 1, "indirect": 2}
    assert len({row["formal_source_id"] for row in events}) == 2
    assert all(row["a03_decision"] == "compatibility_evidence_only_pending_N3" for row in events)

    manifest_text = (PACKAGE / "MANIFEST.md").read_text(encoding="utf-8")
    table_rows = [line for line in manifest_text.splitlines() if line.startswith("|")]
    assert len(table_rows) == 13  # header + separator + 11 files
    manifest_names: list[str] = []
    for line in table_rows[2:]:
        columns = [value.strip() for value in line.strip("|").split("|")]
        name, size_text = columns[0], columns[3]
        manifest_names.append(name)
        assert int(size_text) == (PACKAGE / name).stat().st_size
    assert sorted(manifest_names) == sorted(path.name for path in PACKAGE.iterdir() if path.is_file())

    forbidden = {".pdf", ".epub", ".sqlite"}
    assert all(path.suffix.lower() not in forbidden for path in PACKAGE.iterdir() if path.is_file())
    print("V1-S4-A03 VALIDATION PASS")
    print(f"a03_source_prefix=72 current_registry={len(registry)} mapping=61(new56/reuse2/hold3)")
    print("stage3_relations=88(eligible59/hold29) a03_relation_additions=1")
    print("fact_decisions=22(candidate20/hold1/research_note1)")
    print("political_poetry=5(hold3/not_work_level1/gap1)")
    print("event_evidence=3(direct1/indirect2/independent_sources2)")


if __name__ == "__main__":
    main()
