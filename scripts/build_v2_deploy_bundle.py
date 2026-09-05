#!/usr/bin/env python3
"""Build a public static deployment candidate from the frozen V2 Web Data."""

from __future__ import annotations

import argparse
import json
import shutil
from html import escape
from pathlib import Path
from urllib.parse import urljoin, urlparse


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_DATA = ROOT / "data/v2/web/site_data.json"
SITE_FILES = ("app.js", "styles.css")
DEVELOPMENT_PREVIEW_BANNER = "Web 0.3.4 Development Preview｜包含待审内容｜正式 Public Release 仍暂停"

# The complete Web Data keeps the research admission vocabulary for internal
# review.  A deployment bundle may retain only facts that have a public-safe
# evidence state; raw admission statuses must never be serialized there.
PUBLIC_FACT_EVIDENCE_STATUS = {
    "accepted_for_n2": "verified",
    "batch_retained_candidate": "provisional",
}


def route_for(payload: dict[str, object], target_type: str, target_id: str) -> str:
    indexed = next((item for item in payload["search_index"] if item["target_id"] == target_id), None)
    if not indexed:
        raise ValueError(f"target has no public route: {target_id}")
    return indexed["public_route"]


def page_shell(kind: str, target_id: str | None, title: str, description: str, canonical: str, site_base: str, path_slug: str | None = None, development_preview: bool = False) -> str:
    attrs = [f'data-route-kind="{escape(kind)}"']
    if target_id:
        attrs.append(f'data-route-id="{escape(target_id)}"')
    if path_slug:
        attrs.append(f'data-path-slug="{escape(path_slug)}"')
    banner = f'<div data-review-preview-banner class="review-banner">{DEVELOPMENT_PREVIEW_BANNER}</div>' if development_preview else ""
    return f'''<!doctype html>
<html lang="zh-CN"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><meta name="theme-color" content="#f3eee4"><meta name="description" content="{escape(description)}"><meta property="og:type" content="website"><meta property="og:locale" content="zh_CN"><meta property="og:site_name" content="拉丁美洲文学地图"><meta property="og:title" content="{escape(title)}"><meta property="og:description" content="{escape(description)}"><meta property="og:url" content="{escape(canonical)}"><meta name="twitter:card" content="summary"><link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64'%3E%3Crect width='64' height='64' rx='14' fill='%2396342b'/%3E%3Cpath d='M18 16h8v25h20v7H18z' fill='%23fffdf8'/%3E%3C/svg%3E"><link rel="canonical" href="{escape(canonical)}"><title>{escape(title)}｜拉丁美洲文学地图</title><link rel="stylesheet" href="{escape(urljoin(site_base, 'styles.css'))}"></head><body {' '.join(attrs)}>{banner}<div class="site-frame"><header class="site-header"><a class="wordmark" href="{escape(site_base)}"><span class="wordmark-mark">LATAM</span><span class="wordmark-name">拉丁美洲文学地图</span></a><nav id="main-nav" class="main-nav" aria-label="主要导航"><a href="{escape(site_base)}">地图</a><a href="{escape(urljoin(site_base, 'search/'))}">搜索</a><a href="{escape(urljoin(site_base, 'timeline/'))}">时间线</a><a href="{escape(urljoin(site_base, 'about/'))}">关于项目</a></nav><button class="menu-toggle" type="button" aria-expanded="false" aria-controls="main-nav">菜单</button></header><main id="app" tabindex="-1" aria-live="polite"><div class="loading-state"><span class="loading-dot"></span>正在打开文学地图……</div></main><footer class="site-footer"><div><span class="footer-kicker">A literary map of Latin America</span><span>从地点进入文学，从作品继续阅读</span></div><a href="{escape(urljoin(site_base, 'about/'))}">关于这张地图</a></footer></div><script type="module" src="{escape(urljoin(site_base, 'app.js'))}"></script></body></html>
'''


def clean_public_data(source: Path) -> dict[str, object]:
    payload = json.loads(source.read_text(encoding="utf-8"))

    def take(item: dict[str, object], keys: tuple[str, ...]) -> dict[str, object]:
        return {key: item.get(key) for key in keys if item.get(key) not in (None, "", [])}

    search_index = payload["search_index"]
    public_ids = {item["target_id"] for item in search_index}
    if len(public_ids) != len(search_index):
        raise ValueError("public search index contains duplicate target IDs")

    entities = [
        take(item, ("entity_id", "entity_type", "name_zh", "original_name"))
        for item in payload["research"]["entities"]
        if item["entity_id"] in public_ids
    ]
    cards = [
        take(item, ("subject_id", "card_type", "country_or_region", "genre_or_form", "language", "period_bucket"))
        for item in payload["research"]["content_cards"]
        if item["subject_id"] in public_ids
    ]
    facts = []
    for item in payload["research"]["facts"]:
        if item["subject_id"] not in public_ids:
            continue
        public_status = PUBLIC_FACT_EVIDENCE_STATUS.get(item.get("admission_status"))
        if public_status is None:
            # hold/gap/research notes and facts awaiting staging review remain
            # in the complete Web Data, but are not copied into a deployment
            # artifact where their governance status would be unavailable.
            continue
        compact = take(item, ("subject_id", "fact_field", "value_text"))
        compact["public_evidence_status"] = public_status
        compact["sources"] = [take(source, ("source_id",)) for source in item.get("sources", [])]
        facts.append(compact)
    relationships = []
    for item in payload["research"]["relationships"]:
        if item["subject_id"] not in public_ids or item["object_id"] not in public_ids:
            continue
        compact = take(item, ("subject_id", "object_id", "relation_type", "description_zh"))
        compact["evidence"] = [take(evidence, ("source_id",)) for evidence in item.get("evidence", [])]
        relationships.append(compact)

    source_places = payload["map"]["places"]
    source_places_by_id = {item["place_id"]: item for item in source_places}
    public_place_ids = {
        item["place_id"]
        for item in source_places
        if item["place_id"] in public_ids or item.get("entity_id") in public_ids
    }
    included_place_ids = set(public_place_ids)
    pending_place_ids = list(public_place_ids)
    while pending_place_ids:
        place_id = pending_place_ids.pop()
        place = source_places_by_id[place_id]
        parent_id = place.get("parent_place_id")
        if not parent_id:
            continue
        if parent_id not in source_places_by_id:
            raise ValueError(f"public map place has missing parent: {place_id} -> {parent_id}")
        if parent_id not in included_place_ids:
            included_place_ids.add(parent_id)
            pending_place_ids.append(parent_id)
    places = [
        take(item, ("place_id", "entity_id", "name_zh", "original_name", "country_code", "place_kind", "parent_place_id", "reality_status", "map_status", "latitude", "longitude"))
        for item in source_places
        if item["place_id"] in included_place_ids
    ]
    map_relations = [
        take(item, ("source_entity_id", "target_place_id", "relation_type", "map_relation_role", "description_zh", "source_refs"))
        for item in payload["map"]["relations"]
        if item["source_entity_id"] in public_ids and item["target_place_id"] in included_place_ids
    ]

    # Reader prose comes exclusively from the conclusion-only reader projection.
    # Curation rows remain useful as evidence pointers, but their working copy
    # must never become a presentation fallback in the public bundle.
    entries = [
        take(item, ("target_id", "field_key", "source_refs"))
        for item in payload["curation"]["entries"]
        if item.get("target_id") in public_ids
    ]
    selections = [
        take(item, ("target_id", "selection_key", "selection_value", "sort_order"))
        for item in payload["curation"]["selections"]
        if item.get("selection_key") in {"featured_author", "featured_work"}
        and item.get("target_id") in public_ids
    ]
    recommendations = [
        take(item, ("from_target_id", "to_target_id", "recommendation_kind", "recommendation_reason", "sort_order"))
        for item in payload["curation"]["recommendations"]
        if item.get("from_target_id") in public_ids and item.get("to_target_id") in public_ids
    ]
    reader_content = {}
    content_evidence = {}
    for group in ("authors", "works", "places"):
        reader_content[group] = [
            item for item in payload["reader_content"].get(group, [])
            if item.get("target_id") in public_ids
        ]
        content_evidence[group] = []
        for record in payload["public_content"][group]:
            if record.get("target_id") not in public_ids:
                continue
            compact = {"target_id": record["target_id"]}
            for key, value in record.items():
                if key == "target_id" or not isinstance(value, dict):
                    continue
                refs = take(value, ("research_refs", "source_refs"))
                if refs:
                    compact[key] = refs
            content_evidence[group].append(compact)
    timeline = [
        {
            "node_type": item["node_type"],
            "year_label": item.get("year_label"),
            "entity": take(item["entity"], ("entity_id", "entity_type", "name_zh", "original_name")),
        }
        for item in payload["timeline"]
        if item["entity"]["entity_id"] in public_ids
    ]
    presentation = {key: value for key, value in payload["presentation"].items() if key in {"site", "reading_paths", "timeline_periods", "timeline_note", "why_read", "next_reads", "discovery"}}
    for group in ("reading_paths", "timeline_periods", "why_read", "next_reads"):
        if any(item.get("review_status") != "auto_approved" for item in presentation.get(group, [])):
            raise ValueError(f"public presentation gate failed for {group}")
        presentation[group] = [
            {
                key: value
                for key, value in item.items()
                if key not in {"review_status", "basis", "reviewer", "reviewed_at"}
            }
            for item in presentation.get(group, [])
        ]

    referenced_source_ids = {
        source["source_id"]
        for fact in facts
        for source in fact.get("sources", [])
        if source.get("source_id")
    }
    referenced_source_ids.update(
        evidence["source_id"]
        for relation in relationships
        for evidence in relation.get("evidence", [])
        if evidence.get("source_id")
    )
    referenced_source_ids.update(
        source_id
        for item in entries
        for source_id in item.get("source_refs", [])
        if str(source_id).startswith("SRC-")
    )
    for group in content_evidence.values():
        for record in group:
            for value in record.values():
                if isinstance(value, dict):
                    referenced_source_ids.update(
                        source_id
                        for source_id in value.get("source_refs", [])
                        if str(source_id).startswith("SRC-")
                    )
    sources = [
        take(item, ("source_id", "title", "author_or_editor", "publisher", "publication_year", "canonical_url"))
        for item in payload["research"]["sources"]
        if item["source_id"] in referenced_source_ids
    ]
    return {
        "research": {"entities": entities, "content_cards": cards, "facts": facts, "relationships": relationships, "sources": sources},
        "curation": {"entries": entries, "selections": selections, "recommendations": recommendations},
        "reader_content": reader_content,
        "content_evidence": content_evidence,
        "presentation": presentation,
        "map": {"places": places, "relations": map_relations},
        "search_index": search_index,
        "timeline": timeline,
        "public_release": {"review_queue_exposed": False},
    }


def write_sitemap(output: Path, origin: str, routes: list[str]) -> None:
    base = origin.rstrip("/") + "/"
    urls = [urljoin(base, route) for route in routes]
    body = "\n".join(f"  <url><loc>{url}</loc></url>" for url in urls)
    (output / "sitemap.xml").write_text(f'<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n{body}\n</urlset>\n', encoding="utf-8")
    (output / "robots.txt").write_text(f"User-agent: *\nAllow: /\nSitemap: {urljoin(base, 'sitemap.xml')}\n", encoding="utf-8")


def build(output: Path, data_path: Path, origin: str | None, development_preview: bool = False) -> dict[str, object]:
    if origin and not origin.startswith("https://"):
        raise ValueError("--origin must be a confirmed HTTPS origin")
    if output.exists():
        shutil.rmtree(output)
    output.mkdir(parents=True, exist_ok=True)
    for name in SITE_FILES:
        shutil.copy2(ROOT / "site" / name, output / name)
    shutil.copytree(ROOT / "site" / "assets", output / "assets", dirs_exist_ok=True)
    public_data_dir = output / "data/v2/web"
    public_data_dir.mkdir(parents=True, exist_ok=True)
    public_data = clean_public_data(data_path)
    (public_data_dir / "site_data.json").write_text(json.dumps(public_data, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    public_manifest = {"site": "拉丁美洲文学地图", "review_queue_exposed": False}
    (public_data_dir / "manifest.json").write_text(json.dumps(public_manifest, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    canonical_base = origin.rstrip("/") + "/" if origin else "/"
    site_base = urlparse(canonical_base).path if origin else "/"
    if not site_base.endswith("/"):
        site_base += "/"
    site = public_data["presentation"]["site"]
    (output / "index.html").write_text(page_shell("home", None, site["name"], site["description"], canonical_base, site_base, development_preview=development_preview), encoding="utf-8")
    routes = [""]
    static_pages = [("search/", "search", None, "搜索", "搜索作家、作品、地点与文学主题。", None), ("timeline/", "timeline", None, "文学时间线", "沿时期、作家与作品理解拉丁美洲文学。", None), ("about/", "about", None, "关于项目", "了解项目、研究方法、空间区分与来源版权。", None)]
    for path in public_data["presentation"]["reading_paths"]:
        static_pages.append((f"paths/{path['slug']}/", "path", None, path["title"], path["description"], path["slug"]))
    hidden_places = {item["place_id"] for item in public_data["map"]["places"] if item["map_status"] == "hidden" or item["reality_status"] == "unknown"}
    for item in public_data["search_index"]:
        if item["target_id"] in hidden_places:
            continue
        target_type = item["target_type"] if item["target_type"] in {"author", "work", "country", "place", "fictional_space"} else "node"
        path = route_for(public_data, target_type, item["target_id"])
        static_pages.append((path, target_type, item["target_id"], item["name_zh"], f"在拉丁美洲文学地图中探索{item['name_zh']}及其文学关联。", None))
    seen: dict[str, str | None] = {}
    for route, kind, target_id, title, description, path_slug in static_pages:
        if route in seen:
            raise ValueError(f"duplicate canonical route: {route} ({seen[route]} and {target_id})")
        seen[route] = target_id
        routes.append(route)
        target = output / route
        target.mkdir(parents=True, exist_ok=True)
        canonical = urljoin(canonical_base, route)
        (target / "index.html").write_text(page_shell(kind, target_id, title, description, canonical, site_base, path_slug, development_preview), encoding="utf-8")
    (output / "404.html").write_text(page_shell("not-found", None, "页面未找到", "这条文学路径尚未开放。", urljoin(canonical_base, "404.html"), site_base, development_preview=development_preview), encoding="utf-8")
    if origin:
        write_sitemap(output, origin, routes)
    return {"output": str(output), "files": sum(1 for path in output.rglob("*") if path.is_file()), "routes": len(routes), "review_queue_exposed": False, "sitemap": bool(origin), "site_base": site_base, "development_preview": development_preview}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--data", type=Path, default=DEFAULT_DATA)
    parser.add_argument("--origin", default=None, help="Confirmed HTTPS origin; enables sitemap.xml and robots.txt")
    parser.add_argument("--development-preview", action="store_true", help="Label every page as a non-release development preview")
    args = parser.parse_args()
    if not args.data.is_file():
        raise FileNotFoundError(args.data)
    print(json.dumps({"status": "PASS", **build(args.output, args.data, args.origin, args.development_preview)}, ensure_ascii=False))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
