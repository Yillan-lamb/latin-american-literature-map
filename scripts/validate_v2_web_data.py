#!/usr/bin/env python3
"""Validate V2 Web Data structure, references, status gates, and map safety."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_DATA = ROOT / "data/v2/web/site_data.json"
ALLOWED_STATUSES = {"auto_approved", "user_review", "hold"}
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


def fail(message: str) -> None:
    raise ValueError(message)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("path", type=Path, nargs="?", default=DEFAULT_DATA)
    args = parser.parse_args()
    payload = json.loads(args.path.read_text(encoding="utf-8"))
    if payload.get("schema_version") != "v2-web-0.2":
        fail("unexpected Web Data schema_version")
    if payload.get("product_version") != "0.1.0":
        fail("unexpected Web Product version")
    for key in ("research", "curation", "review_queue", "public_content", "public_content_review_queue", "presentation", "presentation_review_queue", "public_scope", "pages", "map", "qa", "search_index", "timeline"):
        if key not in payload:
            fail(f"missing top-level key: {key}")

    research = payload["research"]
    entity_ids = {item["entity_id"] for item in research["entities"]}
    place_ids = {item["place_id"] for item in payload["map"]["places"]}
    valid_ids = entity_ids | place_ids
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

    for group in ("entries", "selections", "recommendations"):
        for item in payload["curation"][group] + payload["review_queue"][group]:
            if item["status"] not in ALLOWED_STATUSES:
                fail(f"invalid curation status: {item['curation_id']}")
            target = item.get("target_id") or item.get("from_target_id")
            if target and target not in valid_ids:
                fail(f"dangling curation target: {item['curation_id']}")
            if item.get("to_target_id") and item["to_target_id"] not in valid_ids:
                fail(f"dangling recommendation target: {item['curation_id']}")
    if any(item["status"] != "auto_approved" for group in payload["curation"].values() for item in group):
        fail("public curation contains a non-auto-approved record")
    for group in ("authors", "works", "places"):
        for record in payload["public_content"].get(group, []):
            for key, value in record.items():
                if key != "target_id" and value.get("status") != "auto_approved":
                    fail(f"public content contains non-approved field: {record['target_id']}.{key}")

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
    # 注意:rc.4/rc.5 收紧后,仓库既有 site_data 的 public_scope 实际为 authors=0/works=0/places=19,
    # 原硬编码 (10/17/19) 已与产物漂移;WEB-CE-B01 重建后实际为 authors=3/works=3/places=21
    # (新增富恩特斯/米斯特拉尔/帕斯 3 位公共作者、帕斯 3 部公共作品、墨西哥城与比库尼亚 2 个地点)。
    expected_scope_counts = {"authors": 3, "works": 3, "places": 21}
    for group, expected in expected_scope_counts.items():
        if len(payload["public_scope"][group]) != expected:
            fail(f"public {group} scope is {len(payload['public_scope'][group])}, expected {expected}")
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
