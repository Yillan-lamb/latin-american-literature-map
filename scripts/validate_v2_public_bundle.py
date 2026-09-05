#!/usr/bin/env python3
"""Validate public routes, metadata, sitemap semantics, and public-boundary status gates."""

from __future__ import annotations

import argparse
import json
import re
import xml.etree.ElementTree as ET
from pathlib import Path
from urllib.parse import urlparse


FORBIDDEN_KEYS = {"review_status", "admission_status", "source_minimum_status", "schema_version", "review_queue", "presentation_review_queue", "public_content_review_queue", "content_zh", "basis_note", "reviewer"}
PUBLIC_FACT_EVIDENCE_STATUS = {"verified", "provisional"}


def keys(value: object) -> set[str]:
    if isinstance(value, dict):
        return set(value) | set().union(*(keys(item) for item in value.values()))
    if isinstance(value, list):
        return set().union(*(keys(item) for item in value)) if value else set()
    return set()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("root", type=Path)
    args = parser.parse_args()
    payload = json.loads((args.root / "data/v2/web/site_data.json").read_text(encoding="utf-8"))
    found = keys(payload)
    leaked = sorted(found & FORBIDDEN_KEYS)
    if leaked:
        raise ValueError(f"public data exposes forbidden governance keys: {leaked}")
    if "public_content" in payload or not isinstance(payload.get("reader_content"), dict):
        raise ValueError("public bundle must expose reader_content instead of raw public_content wrappers")
    search_index = payload.get("search_index", [])
    public_ids = {item.get("target_id") for item in search_index}
    if None in public_ids or len(public_ids) != len(search_index):
        raise ValueError("public search index must contain unique target IDs")

    research = payload.get("research", {})
    hidden_entities = sorted({item.get("entity_id") for item in research.get("entities", []) if item.get("entity_id") not in public_ids})
    hidden_cards = sorted({item.get("subject_id") for item in research.get("content_cards", []) if item.get("subject_id") not in public_ids})
    hidden_facts = sorted({item.get("subject_id") for item in research.get("facts", []) if item.get("subject_id") not in public_ids})
    hidden_relationships = sorted({target for item in research.get("relationships", []) for target in (item.get("subject_id"), item.get("object_id")) if target not in public_ids})
    if hidden_entities or hidden_cards or hidden_facts or hidden_relationships:
        raise ValueError(
            "public research contains non-public targets: "
            f"entities={hidden_entities}, cards={hidden_cards}, facts={hidden_facts}, relationships={hidden_relationships}"
        )

    invalid_fact_status = sorted({item.get("public_evidence_status") for item in research.get("facts", []) if item.get("public_evidence_status") not in PUBLIC_FACT_EVIDENCE_STATUS})
    if invalid_fact_status:
        raise ValueError(f"public facts must carry a safe evidence status: {invalid_fact_status}")

    timeline_entities = [item.get("entity", {}).get("entity_id") for item in payload.get("timeline", [])]
    hidden_timeline = sorted({item for item in timeline_entities if item not in public_ids})
    if hidden_timeline:
        raise ValueError(f"public timeline contains non-public targets: {hidden_timeline}")

    for group in ("authors", "works", "places"):
        hidden_reader = sorted({item.get("target_id") for item in payload["reader_content"].get(group, []) if item.get("target_id") not in public_ids})
        hidden_evidence = sorted({item.get("target_id") for item in payload.get("content_evidence", {}).get(group, []) if item.get("target_id") not in public_ids})
        if hidden_reader or hidden_evidence:
            raise ValueError(f"public {group} projection contains non-public targets: reader={hidden_reader}, evidence={hidden_evidence}")

    map_places = payload.get("map", {}).get("places", [])
    map_places_by_id = {item.get("place_id"): item for item in map_places}
    map_place_ids = set(map_places_by_id)
    public_map_place_ids = {
        item.get("place_id")
        for item in map_places
        if item.get("place_id") in public_ids or item.get("entity_id") in public_ids
    }
    allowed_map_place_ids = set(public_map_place_ids)
    for place_id in public_map_place_ids:
        seen = set()
        current_id = place_id
        while current_id:
            if current_id in seen:
                raise ValueError(f"public map contains a parent cycle at {current_id}")
            seen.add(current_id)
            place = map_places_by_id.get(current_id)
            if place is None:
                break
            parent_id = place.get("parent_place_id")
            if not parent_id:
                break
            allowed_map_place_ids.add(parent_id)
            current_id = parent_id
    missing_map_parents = sorted(
        f"{item.get('place_id')} -> {item.get('parent_place_id')}"
        for item in map_places
        if item.get("parent_place_id") and item.get("parent_place_id") not in map_place_ids
    )
    hidden_map_places = sorted(map_place_ids - allowed_map_place_ids)
    invalid_map_relations = sorted(
        f"{item.get('source_entity_id')} -> {item.get('target_place_id')}"
        for item in payload.get("map", {}).get("relations", [])
        if item.get("source_entity_id") not in public_ids
        or item.get("target_place_id") not in map_place_ids
    )
    if missing_map_parents or hidden_map_places or invalid_map_relations:
        raise ValueError(
            "public map closure failed: "
            f"missing_parents={missing_map_parents}, "
            f"unrelated_non_public_places={hidden_map_places}, "
            f"invalid_relations={invalid_map_relations}"
        )

    source_ids = {item.get("source_id") for item in research.get("sources", [])}
    dangling_fact_sources = sorted({source.get("source_id") for item in research.get("facts", []) for source in item.get("sources", []) if source.get("source_id") not in source_ids})
    dangling_relation_sources = sorted({source.get("source_id") for item in research.get("relationships", []) for source in item.get("evidence", []) if source.get("source_id") not in source_ids})
    if dangling_fact_sources or dangling_relation_sources:
        raise ValueError(f"public research has dangling source references: facts={dangling_fact_sources}, relationships={dangling_relation_sources}")

    discovery = payload.get("presentation", {}).get("discovery", {})
    for group in ("authors", "works"):
        ranked_ids = [item.get("target_id") for item in discovery.get(group, [])]
        reader_ids = {item.get("target_id") for item in payload["reader_content"].get(group, [])}
        if not ranked_ids or len(ranked_ids) != len(set(ranked_ids)) or set(ranked_ids) != reader_ids:
            raise ValueError(f"public discovery does not exactly cover reader catalog: {group}")
    routes = {item["target_id"]: item["public_route"] for item in search_index}
    if len(routes) != len(set(routes.values())):
        raise ValueError("two public entities share a route")
    for target_id, route in routes.items():
        page = args.root / route / "index.html"
        if not page.is_file():
            raise ValueError(f"missing public page: {target_id} -> {route}")
        html = page.read_text(encoding="utf-8")
        body_id = re.search(r'data-route-id="([^"]+)"', html)
        if not body_id or body_id.group(1) != target_id:
            raise ValueError(f"semantic route mismatch: {route}")
        canonical = re.search(r'<link rel="canonical" href="([^"]+)"', html)
        og_url = re.search(r'<meta property="og:url" content="([^"]+)"', html)
        if not canonical or not og_url or canonical.group(1) != og_url.group(1) or not urlparse(canonical.group(1)).scheme:
            raise ValueError(f"invalid canonical/og:url: {route}")
    sitemap = ET.parse(args.root / "sitemap.xml")
    sitemap_nodes = sitemap.findall("{http://www.sitemaps.org/schemas/sitemap/0.9}url/{http://www.sitemaps.org/schemas/sitemap/0.9}loc")
    sitemap_paths = [urlparse(node.text or "").path for node in sitemap_nodes]
    if not sitemap_paths:
        raise ValueError("sitemap has no URLs")
    site_base = sitemap_paths[0]
    if not site_base.endswith("/"):
        raise ValueError("sitemap root URL must end with a slash")
    if any(not path.startswith(site_base) for path in sitemap_paths):
        raise ValueError("sitemap URLs do not share the deployment base path")
    sitemap_urls = {path[len(site_base):] for path in sitemap_paths}
    if not set(routes.values()).issubset(sitemap_urls):
        raise ValueError("sitemap omits public entity routes")
    result = {"status": "PASS", "public_entities": len(routes), "sitemap_urls": len(sitemap_urls), "forbidden_keys": leaked}
    print(json.dumps(result, ensure_ascii=False, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
