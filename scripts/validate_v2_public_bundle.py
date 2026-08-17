#!/usr/bin/env python3
"""Validate public routes, metadata, sitemap semantics, and public-boundary status gates."""

from __future__ import annotations

import argparse
import json
import re
import xml.etree.ElementTree as ET
from pathlib import Path
from urllib.parse import urlparse


FORBIDDEN_KEYS = {"review_status", "admission_status", "source_minimum_status", "schema_version", "review_queue", "presentation_review_queue"}


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
    routes = {item["target_id"]: item["public_route"] for item in payload["search_index"]}
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
    sitemap_urls = {urlparse(node.text or "").path.lstrip("/") for node in sitemap.findall("{http://www.sitemaps.org/schemas/sitemap/0.9}url/{http://www.sitemaps.org/schemas/sitemap/0.9}loc")}
    if not set(routes.values()).issubset(sitemap_urls):
        raise ValueError("sitemap omits public entity routes")
    result = {"status": "PASS", "public_entities": len(routes), "sitemap_urls": len(sitemap_urls), "forbidden_keys": leaked}
    print(json.dumps(result, ensure_ascii=False, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
