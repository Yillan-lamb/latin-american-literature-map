#!/usr/bin/env python3
"""Audit WCD-02 place and relationship coverage from authoritative inputs."""

from __future__ import annotations

import argparse
import csv
import json
import sqlite3
from collections import Counter, defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(encoding="utf-8", newline="") as handle:
        return list(csv.DictReader(handle))


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--database", type=Path, default=ROOT / "data/master/V1_MASTER.sqlite")
    parser.add_argument("--geo-dir", type=Path, default=ROOT / "data/v2/geo")
    parser.add_argument(
        "--public-content",
        type=Path,
        default=ROOT / "data/v2/curation/PUBLIC_CONTENT.json",
    )
    args = parser.parse_args()

    places = read_csv(args.geo_dir / "PLACES_GEO.csv")
    place_relations = read_csv(args.geo_dir / "PLACE_RELATIONS.csv")
    public_content = json.loads(args.public_content.read_text(encoding="utf-8"))
    author_ids = {row["target_id"] for row in public_content["authors"]}
    work_ids = {row["target_id"] for row in public_content["works"]}
    geo_by_entity = {row["entity_id"]: row for row in places if row["entity_id"]}

    connection = sqlite3.connect(f"file:{args.database}?mode=ro", uri=True)
    connection.row_factory = sqlite3.Row
    entity_counts = Counter(
        dict(connection.execute("SELECT entity_type, COUNT(*) FROM entities GROUP BY entity_type"))
    )
    relationships = list(
        connection.execute(
            "SELECT r.*, s.entity_type AS subject_type, o.entity_type AS object_type "
            "FROM relationships r JOIN entities s ON s.entity_id=r.subject_id "
            "JOIN entities o ON o.entity_id=r.object_id"
        )
    )
    relationships_by_subject: dict[str, list[sqlite3.Row]] = defaultdict(list)
    for row in relationships:
        relationships_by_subject[row["subject_id"]].append(row)
    facts_by_subject: dict[str, list[sqlite3.Row]] = defaultdict(list)
    for row in connection.execute("SELECT * FROM facts"):
        facts_by_subject[row["subject_id"]].append(row)

    author_coverage = Counter()
    for author_id in author_ids:
        place_links = [
            row
            for row in relationships_by_subject[author_id]
            if row["relation_type"] == "ASSOCIATED_WITH_PLACE"
        ]
        kinds = [geo_by_entity.get(row["object_id"], {}).get("place_kind") for row in place_links]
        has_country = "country" in kinds
        has_fine_place = any(kind in {"city", "region", "locality", "street"} for kind in kinds)
        has_birth_place = any(
            row["fact_field"] == "birth_place" and row["admission_status"] not in {"hold", "gap"}
            for row in facts_by_subject[author_id]
        )
        created = {
            row["object_id"]
            for row in relationships_by_subject[author_id]
            if row["relation_type"] == "CREATED"
        }
        has_work_space = any(
            any(link["relation_type"] == "SET_IN" for link in relationships_by_subject[work_id])
            for work_id in created
        )
        author_coverage.update(
            country=has_country,
            city_or_region=has_fine_place,
            birth_place_fact=has_birth_place,
            any_place_relation=bool(place_links),
            work_space=has_work_space,
            country_only=bool(place_links) and has_country and not has_fine_place,
            no_place_relation=not place_links,
        )

    work_coverage = Counter()
    for work_id in work_ids:
        links = relationships_by_subject[work_id]
        set_in = [row for row in links if row["relation_type"] == "SET_IN"]
        place_facts = [
            row
            for row in facts_by_subject[work_id]
            if row["fact_field"] in {"setting_place", "key_place"}
            and row["admission_status"] not in {"hold", "gap"}
        ]
        work_coverage.update(
            set_in=bool(set_in),
            place_fact=bool(place_facts),
            fictional_space=any(
                geo_by_entity.get(row["object_id"], {}).get("reality_status") == "fictional"
                for row in set_in
            ),
            event=any(row["relation_type"] == "BASED_ON_EVENT" for row in links),
            movement=any(row["relation_type"] == "ASSOCIATED_WITH_MOVEMENT" for row in links),
            theme=any(row["relation_type"] == "EXPLORES_THEME" for row in links),
            no_space=not set_in and not place_facts,
        )

    place_relationship_ids = {
        row["relationship_id"]
        for row in relationships
        if row["relation_type"] in {"ASSOCIATED_WITH_PLACE", "SET_IN"}
    }
    evidence_counts = Counter()
    for relationship_id, count in connection.execute(
        "SELECT r.relationship_id, COUNT(DISTINCT e.source_id) "
        "FROM relationships r LEFT JOIN relationship_evidence e "
        "ON e.relationship_id=r.relationship_id "
        "WHERE r.relation_type IN ('ASSOCIATED_WITH_PLACE','SET_IN') "
        "GROUP BY r.relationship_id"
    ):
        evidence_counts[str(count)] += 1
    place_hold_count = connection.execute(
        "SELECT COUNT(*) FROM relation_holds h JOIN entities o ON o.entity_id=h.object_id "
        "WHERE h.relation_type IN ('ASSOCIATED_WITH_PLACE','SET_IN') OR o.entity_type='place'"
    ).fetchone()[0]

    result = {
        "scope": {"authors": len(author_ids), "works": len(work_ids)},
        "research": {
            "entities": sum(entity_counts.values()),
            "places": entity_counts["place"],
            "relationships": len(relationships),
            "place_relationships": len(place_relationship_ids),
            "author_place_relationships": sum(
                row["subject_type"] == "author" and row["relation_type"] == "ASSOCIATED_WITH_PLACE"
                for row in relationships
            ),
            "work_place_relationships": sum(
                row["subject_type"] in {"work", "collection"} and row["relation_type"] == "SET_IN"
                for row in relationships
            ),
            "place_relation_source_count": dict(sorted(evidence_counts.items())),
            "place_relation_holds": place_hold_count,
        },
        "geo": {
            "places": len(places),
            "research_places": sum(bool(row["entity_id"]) for row in places),
            "technical_places": sum(not row["entity_id"] for row in places),
            "reality_status": dict(sorted(Counter(row["reality_status"] for row in places).items())),
            "place_kind": dict(sorted(Counter(row["place_kind"] for row in places).items())),
            "map_status": dict(sorted(Counter(row["map_status"] for row in places).items())),
            "real_with_coordinates": sum(
                row["reality_status"] == "real" and bool(row["latitude"] and row["longitude"])
                for row in places
            ),
            "real_without_coordinates": sum(
                row["reality_status"] == "real" and not row["latitude"] and not row["longitude"]
                for row in places
            ),
            "fictional_with_coordinates": sum(
                row["reality_status"] == "fictional" and bool(row["latitude"] or row["longitude"])
                for row in places
            ),
            "place_relations": len(place_relations),
        },
        "author_coverage": dict(sorted(author_coverage.items())),
        "work_coverage": dict(sorted(work_coverage.items())),
    }
    print(json.dumps(result, ensure_ascii=False, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
