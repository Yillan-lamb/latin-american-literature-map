#!/usr/bin/env python3
"""Build deterministic, page-oriented V2 Web Data from V1 Research Data + Curation Data."""

from __future__ import annotations

import argparse
import csv
import json
import sqlite3
from collections import defaultdict
from datetime import date, datetime, timezone
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_DB = ROOT / "data/master/V1_MASTER.sqlite"
DEFAULT_GEO = ROOT / "data/v2/geo"
DEFAULT_CURATION = ROOT / "data/v2/curation"
DEFAULT_OUTPUT = ROOT / "data/v2/web"
SCHEMA_VERSION = "v2-web-0.2"
CURATION_SCHEMA_VERSION = "v2-curation-0.1"
ALLOWED_CURATION_STATUSES = {"auto_approved", "user_review", "hold"}


def rows(conn: sqlite3.Connection, sql: str) -> list[dict[str, Any]]:
    conn.row_factory = sqlite3.Row
    return [dict(row) for row in conn.execute(sql)]


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(encoding="utf-8-sig", newline="") as handle:
        return list(csv.DictReader(handle))


def split_refs(value: str | None) -> list[str]:
    if not value:
        return []
    return [item.strip() for item in value.split(";") if item.strip()]


def number_or_none(value: str | None) -> float | None:
    if value in (None, ""):
        return None
    return float(value)


def required_text(row: dict[str, str], key: str, path: Path, line: int) -> str:
    value = row.get(key, "").strip()
    if not value:
        raise ValueError(f"{path}:{line}: missing required field {key}")
    return value


def load_geo(geo_dir: Path) -> tuple[list[dict[str, Any]], list[dict[str, Any]]]:
    place_rows = read_csv(geo_dir / "PLACES_GEO.csv")
    relation_rows = read_csv(geo_dir / "PLACE_RELATIONS.csv")
    places: list[dict[str, Any]] = []
    place_ids: set[str] = set()
    for line, row in enumerate(place_rows, 2):
        place_id = required_text(row, "place_id", geo_dir / "PLACES_GEO.csv", line)
        if place_id in place_ids:
            raise ValueError(f"duplicate place_id: {place_id}")
        place_ids.add(place_id)
        latitude = number_or_none(row.get("latitude"))
        longitude = number_or_none(row.get("longitude"))
        if (latitude is None) != (longitude is None):
            raise ValueError(f"{place_id}: latitude/longitude must be both set or both empty")
        reality_status = required_text(row, "reality_status", geo_dir / "PLACES_GEO.csv", line)
        if reality_status == "fictional" and (latitude is not None or longitude is not None):
            raise ValueError(f"{place_id}: fictional place cannot have real coordinates")
        places.append(
            {
                "place_id": place_id,
                "entity_id": row.get("entity_id") or None,
                "name_zh": required_text(row, "name_zh", geo_dir / "PLACES_GEO.csv", line),
                "original_name": row.get("original_name") or None,
                "place_kind": required_text(row, "place_kind", geo_dir / "PLACES_GEO.csv", line),
                "reality_status": reality_status,
                "country_code": row.get("country_code") or None,
                "parent_place_id": row.get("parent_place_id") or None,
                "latitude": latitude,
                "longitude": longitude,
                "coordinate_precision": row.get("coordinate_precision") or None,
                "coordinate_source_url": row.get("coordinate_source_url") or None,
                "coordinate_retrieved_at": row.get("coordinate_retrieved_at") or None,
                "map_status": required_text(row, "map_status", geo_dir / "PLACES_GEO.csv", line),
                "source_kind": row.get("source_kind") or None,
                "classification_status": row.get("classification_status") or None,
                "classification_source_url": row.get("classification_source_url") or None,
                "classification_note": row.get("classification_note") or None,
            }
        )
    for place in places:
        parent_id = place["parent_place_id"]
        if parent_id and parent_id not in place_ids:
            raise ValueError(f"{place['place_id']}: dangling parent_place_id {parent_id}")

    place_relations: list[dict[str, Any]] = []
    relation_ids: set[str] = set()
    for line, row in enumerate(relation_rows, 2):
        relation_id = required_text(row, "relation_id", geo_dir / "PLACE_RELATIONS.csv", line)
        if relation_id in relation_ids:
            raise ValueError(f"duplicate map relation_id: {relation_id}")
        relation_ids.add(relation_id)
        target_place_id = required_text(row, "target_place_id", geo_dir / "PLACE_RELATIONS.csv", line)
        if target_place_id not in place_ids:
            raise ValueError(f"{relation_id}: dangling target_place_id {target_place_id}")
        place_relations.append(
            {
                "relation_id": relation_id,
                "v1_relationship_id": required_text(row, "v1_relationship_id", geo_dir / "PLACE_RELATIONS.csv", line),
                "source_entity_id": required_text(row, "source_entity_id", geo_dir / "PLACE_RELATIONS.csv", line),
                "source_name_zh": required_text(row, "source_name_zh", geo_dir / "PLACE_RELATIONS.csv", line),
                "target_place_id": target_place_id,
                "target_name_zh": required_text(row, "target_name_zh", geo_dir / "PLACE_RELATIONS.csv", line),
                "relation_type": required_text(row, "relation_type", geo_dir / "PLACE_RELATIONS.csv", line),
                "map_relation_role": required_text(row, "map_relation_role", geo_dir / "PLACE_RELATIONS.csv", line),
                "space_kind": required_text(row, "space_kind", geo_dir / "PLACE_RELATIONS.csv", line),
                "confidence": row.get("confidence") or None,
                "review_status": row.get("review_status") or None,
                "description_zh": row.get("description_zh") or None,
                "source_reference": required_text(row, "source_reference", geo_dir / "PLACE_RELATIONS.csv", line),
            }
        )
    return places, place_relations


def load_curation(curation_dir: Path, valid_target_ids: set[str]) -> dict[str, list[dict[str, Any]]]:
    files = {
        "entries": ("CURATION_ENTRIES.csv", "curation_id"),
        "selections": ("CURATION_SELECTIONS.csv", "curation_id"),
        "recommendations": ("CURATION_RECOMMENDATIONS.csv", "curation_id"),
    }
    result: dict[str, list[dict[str, Any]]] = {}
    seen: set[str] = set()
    for group, (filename, id_key) in files.items():
        path = curation_dir / filename
        loaded: list[dict[str, Any]] = []
        for line, row in enumerate(read_csv(path), 2):
            curation_id = required_text(row, id_key, path, line)
            if curation_id in seen:
                raise ValueError(f"duplicate curation_id: {curation_id}")
            seen.add(curation_id)
            status = required_text(row, "status", path, line)
            if status not in ALLOWED_CURATION_STATUSES:
                raise ValueError(f"{path}:{line}: invalid curation status {status}")
            schema_version = required_text(row, "schema_version", path, line)
            if schema_version != CURATION_SCHEMA_VERSION:
                raise ValueError(f"{path}:{line}: expected {CURATION_SCHEMA_VERSION}, got {schema_version}")
            target_id = row.get("target_id") or row.get("from_target_id")
            if target_id and target_id not in valid_target_ids:
                raise ValueError(f"{path}:{line}: dangling target id {target_id}")
            if row.get("to_target_id") and row["to_target_id"] not in valid_target_ids:
                raise ValueError(f"{path}:{line}: dangling to_target_id {row['to_target_id']}")
            normalized = dict(row)
            for key in ("research_refs", "source_refs", "display_scope"):
                if key in normalized:
                    normalized[key] = split_refs(normalized[key])
            if "sort_order" in normalized:
                normalized["sort_order"] = int(normalized["sort_order"]) if normalized["sort_order"] else None
            loaded.append(normalized)
        result[group] = loaded
    return result


def build_data(db_path: Path, geo_dir: Path, curation_dir: Path, generated_at: str) -> dict[str, Any]:
    places, place_relations = load_geo(geo_dir)
    with sqlite3.connect(db_path) as conn:
        entities = rows(conn, "SELECT * FROM entities ORDER BY entity_id")
        cards = rows(conn, "SELECT * FROM content_cards ORDER BY card_id")
        facts = rows(conn, "SELECT * FROM facts ORDER BY fact_id")
        relations = rows(conn, "SELECT * FROM relationships ORDER BY relationship_id")
        sources = rows(conn, "SELECT source_id, title, source_level, canonical_url FROM sources ORDER BY source_id")
        relation_evidence = rows(conn, "SELECT relationship_id, source_id, source_title, locator, evidence_note, evidence_status FROM relationship_evidence ORDER BY evidence_id")
        fact_sources = rows(conn, "SELECT fact_id, source_id, source_title FROM fact_sources ORDER BY fact_id, source_id")
        card_facts = rows(conn, "SELECT card_id, fact_id, admission_status FROM card_facts ORDER BY card_id, fact_id")
        relation_holds = rows(conn, "SELECT * FROM relation_holds ORDER BY relation_hold_id")
        gaps = rows(conn, "SELECT * FROM gaps ORDER BY gap_id")

    entity_by_id = {entity["entity_id"]: entity for entity in entities}
    place_by_entity_id = {item["entity_id"]: item for item in places if item.get("entity_id")}
    valid_target_ids = set(entity_by_id) | {place["place_id"] for place in places}
    curation = load_curation(curation_dir, valid_target_ids)

    cards_by_subject: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for card in cards:
        cards_by_subject[card["subject_id"]].append(card)
    facts_by_subject: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for fact in facts:
        facts_by_subject[fact["subject_id"]].append(fact)
    relations_by_subject: dict[str, list[dict[str, Any]]] = defaultdict(list)
    relations_by_object: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for relation in relations:
        relations_by_subject[relation["subject_id"]].append(relation)
        relations_by_object[relation["object_id"]].append(relation)
    evidence_by_relation: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for evidence in relation_evidence:
        evidence_by_relation[evidence["relationship_id"]].append(evidence)
    sources_by_fact: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for fact_source in fact_sources:
        sources_by_fact[fact_source["fact_id"]].append(fact_source)
    fact_ids_by_card: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for card_fact in card_facts:
        fact_ids_by_card[card_fact["card_id"]].append(card_fact)

    enriched_cards = []
    for card in cards:
        item = dict(card)
        item["facts"] = fact_ids_by_card.get(card["card_id"], [])
        enriched_cards.append(item)

    enriched_relations = []
    for relation in relations:
        item = dict(relation)
        item["evidence"] = evidence_by_relation.get(relation["relationship_id"], [])
        enriched_relations.append(item)

    enriched_facts = []
    for fact in facts:
        item = dict(fact)
        item["sources"] = sources_by_fact.get(fact["fact_id"], [])
        enriched_facts.append(item)

    curation_public = {
        group: [item for item in values if item.get("status") == "auto_approved"]
        for group, values in curation.items()
    }
    curation_review_queue = {
        group: [item for item in values if item.get("status") != "auto_approved"]
        for group, values in curation.items()
    }

    selections_by_target: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for item in curation["selections"]:
        target = item.get("target_id")
        if target:
            selections_by_target[target].append(item)
    places_for_web = []
    map_status_overrides = []
    relations_by_place: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for relation in place_relations:
        relations_by_place[relation["target_place_id"]].append(relation)
    for place in places:
        item = dict(place)
        item["curation_selections"] = selections_by_target.get(place["place_id"], [])
        map_selection = next((selection for selection in item["curation_selections"] if selection.get("selection_key") == "map_status" and selection.get("status") == "auto_approved"), None)
        if map_selection:
            if map_selection.get("selection_value") not in {"featured", "eligible", "hidden"}:
                raise ValueError(f"invalid map_status selection: {map_selection.get('curation_id')}")
            if map_selection.get("selection_value") != place["map_status"]:
                if not map_selection.get("basis_note") or not (map_selection.get("research_refs") or map_selection.get("source_refs")):
                    raise ValueError(f"unjustified map_status override: {map_selection.get('curation_id')}")
                map_status_overrides.append(
                    {
                        "place_id": place["place_id"],
                        "from_status": place["map_status"],
                        "to_status": map_selection["selection_value"],
                        "curation_id": map_selection["curation_id"],
                        "basis_note": map_selection["basis_note"],
                    }
                )
            item["map_status"] = map_selection.get("selection_value")
        item["literary_relations"] = relations_by_place.get(place["place_id"], [])
        places_for_web.append(item)

    page_entities = {
        "authors": [entity for entity in entities if entity["entity_type"] == "author"],
        "works": [entity for entity in entities if entity["entity_type"] == "work"],
        "places": places_for_web,
        "events": [entity for entity in entities if entity["entity_type"] == "event"],
    }

    for entity in page_entities["authors"] + page_entities["works"] + page_entities["events"]:
        entity["content_cards"] = cards_by_subject.get(entity["entity_id"], [])
        entity["facts"] = facts_by_subject.get(entity["entity_id"], [])
        entity["outgoing_relations"] = relations_by_subject.get(entity["entity_id"], [])
        entity["incoming_relations"] = relations_by_object.get(entity["entity_id"], [])

    search_index = []
    for entity in entities:
        cards_for_entity = cards_by_subject.get(entity["entity_id"], [])
        card_titles = [card["title_zh"] for card in cards_for_entity if card.get("title_zh")]
        card_context = [value for card in cards_for_entity for value in (card.get("country_or_region"), card.get("period_bucket")) if value]
        mapped_place = place_by_entity_id.get(entity["entity_id"])
        if mapped_place:
            target_type = "country" if mapped_place["place_kind"] == "country" else "fictional_space" if mapped_place["reality_status"] == "fictional" else "place"
        else:
            target_type = entity["entity_type"]
        search_index.append(
            {
                "target_id": entity["entity_id"],
                "target_type": target_type,
                "name_zh": entity["name_zh"],
                "original_name": entity["original_name"],
                "search_text": " ".join(filter(None, [entity["name_zh"], entity["original_name"], *card_titles, *card_context])),
            }
        )
    for place in places_for_web:
        if place["place_id"] not in entity_by_id:
            if place["source_kind"] == "technical_parent_node" and place["map_status"] == "hidden":
                continue
            search_index.append(
                {
                    "target_id": place["place_id"],
                    "target_type": "country" if place["place_kind"] == "country" else "place",
                    "name_zh": place["name_zh"],
                    "original_name": place["original_name"],
                    "search_text": " ".join(filter(None, [place["name_zh"], place["original_name"]])),
                }
            )

    timeline_nodes = []
    for author in page_entities["authors"]:
        author_cards = cards_by_subject.get(author["entity_id"], [])
        card = author_cards[0] if author_cards else None
        if not card or card.get("source_minimum_status") != "meets":
            continue
        timeline_nodes.append(
            {
                "node_type": "literary_author",
                "entity": author,
                "facts": facts_by_subject.get(author["entity_id"], []),
                "period_bucket": card.get("period_bucket"),
                "year_label": card.get("period_bucket") or "待核查",
                "status": "card_period_only",
            }
        )
    for work in page_entities["works"]:
        work_facts = facts_by_subject.get(work["entity_id"], [])
        year_fact = next((fact for fact in work_facts if fact["fact_field"] in {"first_publication_year", "publication_year"}), None)
        card = cards_by_subject.get(work["entity_id"], [None])[0]
        timeline_nodes.append(
            {
                "node_type": "literary_work",
                "entity": work,
                "facts": work_facts,
                "period_bucket": card.get("period_bucket") if card else None,
                "year_label": year_fact["value_text"] if year_fact else (card.get("period_bucket") if card else "待核查"),
                "status": year_fact["admission_status"] if year_fact else "card_period_only",
            }
        )
    for event in page_entities["events"]:
        event_facts = facts_by_subject.get(event["entity_id"], [])
        year_fact = next((fact for fact in event_facts if fact["fact_field"] == "event_year_range"), None)
        timeline_nodes.append(
            {
                "node_type": "historical_background",
                "entity": event,
                "facts": event_facts,
                "period_bucket": None,
                "year_label": year_fact["value_text"] if year_fact else "待核查",
                "status": year_fact["admission_status"] if year_fact else "entity_only",
            }
        )

    def timeline_sort_key(item: dict[str, Any]) -> tuple[int, str]:
        label = str(item.get("year_label") or "")
        digits = "".join(character for character in label[:4] if character.isdigit())
        return (int(digits) if len(digits) == 4 else 9999, item["entity"]["entity_id"])

    timeline_nodes.sort(key=timeline_sort_key)

    return {
        "schema_version": SCHEMA_VERSION,
        "generated_at": generated_at,
        "data_sources": {
            "research_database": str(db_path.relative_to(ROOT)),
            "geo_data": str(geo_dir.relative_to(ROOT)),
            "curation_data": str(curation_dir.relative_to(ROOT)),
        },
        "counts": {
            "entities": len(entities),
            "content_cards": len(cards),
            "facts": len(facts),
            "relationships": len(relations),
            "relation_holds": len(relation_holds),
            "gaps": len(gaps),
            "sources": len(sources),
            "places": len(places),
            "place_relations": len(place_relations),
            "curation_entries": len(curation["entries"]),
            "curation_selections": len(curation["selections"]),
            "curation_recommendations": len(curation["recommendations"]),
        },
        "research": {
            "entities": entities,
            "content_cards": enriched_cards,
            "facts": enriched_facts,
            "relationships": enriched_relations,
            "sources": sources,
            "relation_holds": relation_holds,
            "gaps": gaps,
        },
        "curation": curation_public,
        "review_queue": curation_review_queue,
        "pages": page_entities,
        "map": {"places": places_for_web, "relations": place_relations},
        "qa": {"map_status_overrides": map_status_overrides},
        "search_index": search_index,
        "timeline": timeline_nodes,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--db", type=Path, default=DEFAULT_DB)
    parser.add_argument("--geo-dir", type=Path, default=DEFAULT_GEO)
    parser.add_argument("--curation-dir", type=Path, default=DEFAULT_CURATION)
    parser.add_argument("--output-dir", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--generated-at", default=None)
    args = parser.parse_args()
    generated_at = args.generated_at or datetime.now(timezone.utc).isoformat(timespec="seconds")
    payload = build_data(args.db, args.geo_dir, args.curation_dir, generated_at)
    args.output_dir.mkdir(parents=True, exist_ok=True)
    output_path = args.output_dir / "site_data.json"
    output_path.write_text(json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    manifest = {
        "schema_version": SCHEMA_VERSION,
        "generated_at": generated_at,
        "entrypoint": "site_data.json",
        "counts": payload["counts"],
        "public_curation_status": "auto_approved_only",
        "review_queue_separate": True,
    }
    (args.output_dir / "manifest.json").write_text(json.dumps(manifest, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(manifest, ensure_ascii=False, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
