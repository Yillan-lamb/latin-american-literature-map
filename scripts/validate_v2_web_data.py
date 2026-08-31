#!/usr/bin/env python3
"""Validate V2 Web Data structure, references, status gates, and map safety."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from build_v2_web_data import contains_internal_reader_language


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_DATA = ROOT / "data/v2/web/site_data.json"
ALLOWED_STATUSES = {"auto_approved", "user_review", "hold"}
HIGH_JUDGMENT_CURATION_KEYS = {
    "why_know", "literary_profile", "start_here", "core_themes",
    "literary_connections", "reader_fit", "signature_keywords", "reading_route",
    "guiding_question", "why_read", "theme_explanations", "literary_significance",
    "reading_tips", "reading_approach", "next_reads", "spatial_meaning",
    "reader_path", "exploration_route",
}
COUNT_PATHS = {
    "entities": ("research", "entities"),
    "content_cards": ("research", "content_cards"),
    "facts": ("research", "facts"),
    "relationships": ("research", "relationships"),
    "relation_holds": ("research", "relation_holds"),
    "gaps": ("research", "gaps"),
    "sources": ("research", "sources"),
    "places": ("map", "places"),
    "place_relations": ("map", "relations"),
}

# These IDs are the last independently accepted public baseline.  The validator
# protects them as a subset instead of freezing exact counts, so audited content
# expansions can add pages without making the check stale.
BASELINE_PUBLIC_SCOPE = {
    "authors": {
        "V1-ENT-0002", "V1-ENT-0016", "V1-ENT-0029", "V1-ENT-0030", "V1-ENT-0031",
        "V1-ENT-0072", "V1-ENT-0073", "V1-ENT-0074", "V1-ENT-0114", "V1-ENT-0115",
    },
    "works": {
        "V1-ENT-0003", "V1-ENT-0004", "V1-ENT-0017", "V1-ENT-0018", "V1-ENT-0032",
        "V1-ENT-0035", "V1-ENT-0038", "V1-ENT-0075", "V1-ENT-0076", "V1-ENT-0077",
        "V1-ENT-0078", "V1-ENT-0079", "V1-ENT-0080", "V1-ENT-0081", "V1-ENT-0116",
        "V1-ENT-0117", "V1-ENT-0118",
    },
}


def fail(message: str) -> None:
    raise ValueError(message)


def reader_strings(value: object, path: str = "reader_content"):
    if isinstance(value, str):
        yield path, value
    elif isinstance(value, list):
        for index, item in enumerate(value):
            yield from reader_strings(item, f"{path}[{index}]")
    elif isinstance(value, dict):
        for key, item in value.items():
            yield from reader_strings(item, f"{path}.{key}")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("path", type=Path, nargs="?", default=DEFAULT_DATA)
    args = parser.parse_args()
    payload = json.loads(args.path.read_text(encoding="utf-8"))
    if payload.get("schema_version") != "v2-web-0.2":
        fail("unexpected Web Data schema_version")
    if payload.get("product_version") != "0.3.2":
        fail("unexpected Web Product version")
    for key in ("research", "curation", "review_queue", "public_content", "public_content_review_queue", "reader_content", "presentation", "presentation_review_queue", "public_scope", "pages", "map", "qa", "search_index", "timeline"):
        if key not in payload:
            fail(f"missing top-level key: {key}")

    research = payload["research"]
    entity_ids = {item["entity_id"] for item in research["entities"]}
    entity_types = {item["entity_id"]: item["entity_type"] for item in research["entities"]}
    fact_ids = {item["fact_id"] for item in research["facts"]}
    relationship_ids = {item["relationship_id"] for item in research["relationships"]}
    relation_hold_ids = {item["relation_hold_id"] for item in research["relation_holds"]}
    card_ids = {item["card_id"] for item in research["content_cards"]}
    gap_ids = {item["gap_id"] for item in research["gaps"]}
    source_ids = {item["source_id"] for item in research["sources"]}
    place_ids = {item["place_id"] for item in payload["map"]["places"]}
    valid_ids = entity_ids | place_ids
    valid_research_refs = entity_ids | fact_ids | relationship_ids | relation_hold_ids | card_ids | gap_ids

    def validate_refs(item: dict[str, object], label: str) -> None:
        for ref in item.get("research_refs", []):
            if ref not in valid_research_refs:
                fail(f"dangling research ref in {label}: {ref}")
        for ref in item.get("source_refs", []):
            if ref not in source_ids and not str(ref).startswith(("https://", "http://")):
                fail(f"dangling source ref in {label}: {ref}")
    for count_key, (parent, child) in COUNT_PATHS.items():
        if len(payload[parent][child]) != payload["counts"][count_key]:
            fail(f"{count_key} count mismatch")
    if len(entity_ids) != len(research["entities"]):
        fail("duplicate research entity id")
    if len(place_ids) != len(payload["map"]["places"]):
        fail("duplicate place id")
    for place in payload["map"]["places"]:
        if place["parent_place_id"] and place["parent_place_id"] not in place_ids:
            fail(f"dangling place parent: {place['place_id']}")
        if place["reality_status"] == "fictional" and (place["latitude"] is not None or place["longitude"] is not None):
            fail(f"fictional place has coordinates: {place['place_id']}")
    for relation in payload["map"]["relations"]:
        if relation["target_place_id"] not in place_ids:
            fail(f"dangling map relation target: {relation['relation_id']}")
        if relation["source_entity_id"] not in entity_ids:
            fail(f"dangling map relation source: {relation['relation_id']}")

    for relation in research["relationships"]:
        if relation["subject_id"] not in entity_ids or relation["object_id"] not in entity_ids:
            fail(f"dangling research relationship: {relation['relationship_id']}")
        if relation["relation_type"] == "APPEARS_IN" and (
            entity_types[relation["subject_id"]] != "character"
            or entity_types[relation["object_id"]] != "work"
        ):
            fail(f"invalid APPEARS_IN endpoints: {relation['relationship_id']}")

    for group in ("entries", "selections", "recommendations"):
        for item in payload["curation"][group] + payload["review_queue"][group]:
            if item["status"] not in ALLOWED_STATUSES:
                fail(f"invalid curation status: {item['curation_id']}")
            target = item.get("target_id") or item.get("from_target_id")
            if target and target not in valid_ids:
                fail(f"dangling curation target: {item['curation_id']}")
            if item.get("to_target_id") and item["to_target_id"] not in valid_ids:
                fail(f"dangling recommendation target: {item['curation_id']}")
            validate_refs(item, item["curation_id"])
            judgment_key = item.get("field_key") or item.get("recommendation_kind")
            if (
                item["status"] == "auto_approved"
                and (group == "recommendations" or judgment_key in HIGH_JUDGMENT_CURATION_KEYS)
                and item.get("reviewer") != "USER"
            ):
                fail(f"high-judgment curation lacks USER approval: {item['curation_id']}")
    if any(item["status"] != "auto_approved" for group in payload["curation"].values() for item in group):
        fail("public curation contains a non-auto-approved record")
    for group in ("authors", "works", "places"):
        for partition in ("public_content", "public_content_review_queue"):
            for record in payload[partition].get(group, []):
                for key, value in record.items():
                    if key == "target_id":
                        continue
                    if partition == "public_content" and value.get("status") != "auto_approved":
                        fail(f"public content contains non-approved field: {record['target_id']}.{key}")
                    validate_refs(value, f"{partition}.{record['target_id']}.{key}")

    presentation = payload["presentation"]
    if presentation.get("schema_version") != "v2-public-presentation-0.1":
        fail("unexpected public presentation schema")
    presentation_groups = ("reading_paths", "timeline_periods", "why_read", "next_reads")
    for group in presentation_groups:
        if any(item.get("review_status") != "auto_approved" for item in presentation.get(group, [])):
            fail(f"public presentation contains a non-approved {group} item")
        if any(item.get("review_status") == "auto_approved" for item in payload["presentation_review_queue"].get(group, [])):
            fail(f"approved presentation item incorrectly remains in review queue: {group}")
        public_ids = {item.get("id") for item in presentation.get(group, [])}
        queue_ids = {item.get("id") for item in payload["presentation_review_queue"].get(group, [])}
        if None in public_ids or None in queue_ids or public_ids & queue_ids:
            fail(f"invalid presentation partition: {group}")
        for item in presentation.get(group, []) + payload["presentation_review_queue"].get(group, []):
            for ref in item.get("basis", []):
                if ref not in valid_research_refs and ref not in source_ids:
                    fail(f"dangling presentation basis in {item.get('id')}: {ref}")
    for path in presentation.get("reading_paths", []):
        if not path.get("target_ids") or any(target_id not in valid_ids for target_id in path["target_ids"]):
            fail(f"invalid public reading path: {path.get('id')}")
    for period in presentation.get("timeline_periods", []):
        if period.get("start") > period.get("end"):
            fail(f"invalid timeline period: {period.get('id')}")

    for group, count_key in (("entries", "curation_entries"), ("selections", "curation_selections"), ("recommendations", "curation_recommendations")):
        total = len(payload["curation"][group]) + len(payload["review_queue"][group])
        if total != payload["counts"][count_key]:
            fail(f"{count_key} count mismatch")

    overrides = payload["qa"]["map_status_overrides"]
    for override in overrides:
        if override["place_id"] not in place_ids or override["from_status"] == override["to_status"]:
            fail(f"invalid map status override: {override.get('curation_id')}")
        if not override.get("basis_note"):
            fail(f"map status override lacks basis: {override.get('curation_id')}")

    public_scope_ids = set().union(*(set(values) for values in payload["public_scope"].values()))
    for group, baseline_ids in BASELINE_PUBLIC_SCOPE.items():
        missing = baseline_ids - set(payload["public_scope"][group])
        if missing:
            fail(f"public {group} scope regressed; missing baseline IDs: {sorted(missing)}")

    reader_content = payload["reader_content"]
    for group in ("authors", "works", "places"):
        records = reader_content.get(group)
        if not isinstance(records, list):
            fail(f"reader content group missing: {group}")
        target_ids = [item.get("target_id") for item in records]
        if None in target_ids or len(target_ids) != len(set(target_ids)):
            fail(f"invalid reader content targets: {group}")
        if not set(target_ids).issubset(set(payload["public_scope"][group])):
            fail(f"reader content escapes public scope: {group}")
        if group in {"authors", "works"} and set(target_ids) != set(payload["public_scope"][group]):
            fail(f"reader content does not cover every public {group}")
    for path, value in reader_strings(reader_content):
        if contains_internal_reader_language(value):
            fail(f"internal evidence-process language leaked into {path}: {value[:80]}")

    discovery = presentation.get("discovery")
    if not isinstance(discovery, dict) or discovery.get("algorithm_version") != "web-0.2-popularity-v1":
        fail("missing or unexpected discovery ranking version")
    if discovery.get("tie_break") != "target_id_ascending":
        fail("discovery ranking tie-break is not explicit")
    if not isinstance(discovery.get("page_size"), int) or not 1 <= discovery["page_size"] <= 24:
        fail("invalid discovery page size")
    for group in ("authors", "works"):
        ranking = discovery.get(group)
        if not isinstance(ranking, list):
            fail(f"missing discovery ranking: {group}")
        target_ids = [item.get("target_id") for item in ranking]
        if len(target_ids) != len(set(target_ids)) or set(target_ids) != set(payload["public_scope"][group]):
            fail(f"discovery ranking does not exactly cover public {group}")
        if [item.get("rank") for item in ranking] != list(range(1, len(ranking) + 1)):
            fail(f"discovery ranks are not sequential: {group}")
        expected = sorted(ranking, key=lambda item: (-item["score"], item["target_id"]))
        if ranking != expected:
            fail(f"discovery order is not deterministic: {group}")
        for item in ranking:
            factors = item.get("factors")
            if not isinstance(factors, dict) or any(not isinstance(value, int) or value < 0 for value in factors.values()):
                fail(f"invalid discovery factors: {item.get('target_id')}")
            if sum(factors.values()) != item.get("score"):
                fail(f"discovery score is not explainable: {item.get('target_id')}")
    search_ids = {item["target_id"] for item in payload["search_index"]}
    if len(search_ids) != len(payload["search_index"]):
        fail("duplicate search index target")
    if search_ids != public_scope_ids:
        fail("search index does not exactly match public page scope")
    for item in payload["search_index"]:
        if item["target_id"] not in valid_ids:
            fail(f"dangling search target: {item['target_id']}")
    hidden_technical_ids = {item["place_id"] for item in payload["map"]["places"] if item["source_kind"] == "technical_parent_node" and item["map_status"] == "hidden"}
    if hidden_technical_ids & search_ids:
        fail("hidden technical node exposed through search")
    for item in payload["search_index"]:
        if any(target_id not in public_scope_ids for target_id in item.get("related_ids", [])):
            fail(f"search relation expansion exposes a non-public target: {item['target_id']}")
    routes = [item.get("public_route") for item in payload["search_index"]]
    if any(not route for route in routes) or len(routes) != len(set(routes)):
        fail("public routes are missing or not unique")

    for item in payload["timeline"]:
        if item["entity"]["entity_id"] not in entity_ids:
            fail(f"dangling timeline entity: {item['entity'].get('entity_id')}")
    print(json.dumps({"status": "PASS", "schema_version": payload["schema_version"], "counts": payload["counts"]}, ensure_ascii=False, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
