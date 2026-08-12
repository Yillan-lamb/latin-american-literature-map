#!/usr/bin/env python3
"""Build a public static deployment candidate from the frozen V2 Web Data."""

from __future__ import annotations

import argparse
import json
import shutil
from html import escape
from pathlib import Path
from urllib.parse import urljoin


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_DATA = ROOT / "data/v2/web/site_data.json"
SITE_FILES = ("app.js", "styles.css")


def slugify(value: str) -> str:
    import re
    import unicodedata

    normalized = unicodedata.normalize("NFD", value or "literature")
    ascii_text = normalized.encode("ascii", "ignore").decode("ascii").lower()
    slug = re.sub(r"[^a-z0-9]+", "-", ascii_text).strip("-")
    return slug or "literature"


def route_for(payload: dict[str, object], target_type: str, target_id: str) -> str:
    entities = {item["entity_id"]: item for item in payload["research"]["entities"]}
    places = {item["place_id"]: item for item in payload["map"]["places"]}
    item = entities.get(target_id) or places.get(target_id) or {}
    slug = slugify(item.get("original_name") or item.get("name_zh") or target_id)
    folder = {"author": "authors", "work": "works", "country": "countries", "place": "places", "fictional_space": "places"}.get(target_type, "explore")
    return f"{folder}/{slug}/"


def page_shell(kind: str, target_id: str | None, title: str, description: str, canonical: str, site_base: str, path_slug: str | None = None) -> str:
    attrs = [f'data-route-kind="{escape(kind)}"']
    if target_id:
        attrs.append(f'data-route-id="{escape(target_id)}"')
    if path_slug:
        attrs.append(f'data-path-slug="{escape(path_slug)}"')
    return f'''<!doctype html>
<html lang="zh-CN"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><meta name="theme-color" content="#f3eee4"><meta name="description" content="{escape(description)}"><meta property="og:type" content="website"><meta property="og:locale" content="zh_CN"><meta property="og:site_name" content="拉丁美洲文学地图"><meta property="og:title" content="{escape(title)}"><meta property="og:description" content="{escape(description)}"><meta name="twitter:card" content="summary"><link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64'%3E%3Crect width='64' height='64' rx='14' fill='%2396342b'/%3E%3Cpath d='M18 16h8v25h20v7H18z' fill='%23fffdf8'/%3E%3C/svg%3E"><link rel="canonical" href="{escape(canonical)}"><title>{escape(title)}｜拉丁美洲文学地图</title><link rel="stylesheet" href="{escape(urljoin(site_base, 'styles.css'))}"></head><body {' '.join(attrs)}><div class="site-frame"><header class="site-header"><a class="wordmark" href="{escape(site_base)}"><span class="wordmark-mark">LATAM</span><span class="wordmark-name">拉丁美洲文学地图</span></a><nav id="main-nav" class="main-nav" aria-label="主要导航"><a href="{escape(site_base)}">地图</a><a href="{escape(urljoin(site_base, 'search/'))}">搜索</a><a href="{escape(urljoin(site_base, 'timeline/'))}">时间线</a><a href="{escape(urljoin(site_base, 'about/'))}">关于项目</a></nav><button class="menu-toggle" type="button" aria-expanded="false" aria-controls="main-nav">菜单</button></header><main id="app" tabindex="-1" aria-live="polite"><div class="loading-state"><span class="loading-dot"></span>正在打开文学地图……</div></main><footer class="site-footer"><div><span class="footer-kicker">A literary map of Latin America</span><span>从地点进入文学，从来源继续研究</span></div><a href="{escape(urljoin(site_base, 'about/'))}">关于项目与研究方法</a></footer></div><script type="module" src="{escape(urljoin(site_base, 'app.js'))}"></script></body></html>
'''


def clean_public_data(source: Path) -> dict[str, object]:
    payload = json.loads(source.read_text(encoding="utf-8"))
    def take(item: dict[str, object], keys: tuple[str, ...]) -> dict[str, object]:
        return {key: item.get(key) for key in keys if item.get(key) not in (None, "", [])}

    entities = [take(item, ("entity_id", "entity_type", "name_zh", "original_name")) for item in payload["research"]["entities"]]
    cards = [take(item, ("subject_id", "card_type", "country_or_region", "genre_or_form", "language", "period_bucket")) for item in payload["research"]["content_cards"]]
    facts = []
    for item in payload["research"]["facts"]:
        compact = take(item, ("subject_id", "fact_field", "value_text"))
        compact["sources"] = [take(source, ("source_id",)) for source in item.get("sources", [])]
        facts.append(compact)
    relationships = []
    for item in payload["research"]["relationships"]:
        compact = take(item, ("subject_id", "object_id", "relation_type", "description_zh"))
        compact["evidence"] = [take(evidence, ("source_id",)) for evidence in item.get("evidence", [])]
        relationships.append(compact)
    sources = [take(item, ("source_id", "title", "author_or_editor", "publisher", "publication_year", "canonical_url")) for item in payload["research"]["sources"]]
    places = [take(item, ("place_id", "entity_id", "name_zh", "original_name", "country_code", "place_kind", "parent_place_id", "reality_status", "map_status", "latitude", "longitude")) for item in payload["map"]["places"]]
    map_relations = [take(item, ("source_entity_id", "target_place_id", "relation_type", "map_relation_role", "description_zh", "source_refs")) for item in payload["map"]["relations"]]
    entries = [take(item, ("target_id", "field_key", "content_zh", "source_refs")) for item in payload["curation"]["entries"]]
    selections = [take(item, ("target_id", "selection_key", "selection_value", "sort_order")) for item in payload["curation"]["selections"] if item.get("selection_key") in {"featured_author", "featured_work"}]
    recommendations = [take(item, ("from_target_id", "to_target_id", "recommendation_kind", "recommendation_reason", "sort_order")) for item in payload["curation"]["recommendations"]]
    timeline = [
        {
            "node_type": item["node_type"],
            "year_label": item.get("year_label"),
            "entity": take(item["entity"], ("entity_id", "entity_type", "name_zh", "original_name")),
        }
        for item in payload["timeline"]
    ]
    presentation = {key: value for key, value in payload["presentation"].items() if key in {"site", "reading_paths", "timeline_periods", "why_read", "next_reads"}}
    for group in ("reading_paths", "timeline_periods", "why_read", "next_reads"):
        presentation[group] = [{key: value for key, value in item.items() if key not in {"review_status", "basis"}} for item in presentation.get(group, [])]
    return {
        "research": {"entities": entities, "content_cards": cards, "facts": facts, "relationships": relationships, "sources": sources},
        "curation": {"entries": entries, "selections": selections, "recommendations": recommendations},
        "presentation": presentation,
        "map": {"places": places, "relations": map_relations},
        "search_index": payload["search_index"],
        "timeline": timeline,
        "public_release": {"review_queue_exposed": False},
    }


def write_sitemap(output: Path, origin: str, routes: list[str]) -> None:
    base = origin.rstrip("/") + "/"
    urls = [urljoin(base, route) for route in routes]
    body = "\n".join(f"  <url><loc>{url}</loc></url>" for url in urls)
    (output / "sitemap.xml").write_text(f'<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n{body}\n</urlset>\n', encoding="utf-8")
    (output / "robots.txt").write_text(f"User-agent: *\nAllow: /\nSitemap: {urljoin(base, 'sitemap.xml')}\n", encoding="utf-8")


def build(output: Path, data_path: Path, origin: str | None) -> dict[str, object]:
    if origin and not origin.startswith("https://"):
        raise ValueError("--origin must be a confirmed HTTPS origin")
    output.mkdir(parents=True, exist_ok=True)
    for name in ("index.html", *SITE_FILES):
        shutil.copy2(ROOT / "site" / name, output / name)
    shutil.copytree(ROOT / "site" / "assets", output / "assets", dirs_exist_ok=True)
    public_data_dir = output / "data/v2/web"
    public_data_dir.mkdir(parents=True, exist_ok=True)
    public_data = clean_public_data(data_path)
    (public_data_dir / "site_data.json").write_text(json.dumps(public_data, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    public_manifest = {"site": "拉丁美洲文学地图", "review_queue_exposed": False}
    (public_data_dir / "manifest.json").write_text(json.dumps(public_manifest, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    base = origin.rstrip("/") + "/" if origin else "/"
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
    seen = set()
    for route, kind, target_id, title, description, path_slug in static_pages:
        if route in seen:
            continue
        seen.add(route)
        routes.append(route)
        target = output / route
        target.mkdir(parents=True, exist_ok=True)
        canonical = urljoin(base, route)
        (target / "index.html").write_text(page_shell(kind, target_id, title, description, canonical, base, path_slug), encoding="utf-8")
    (output / "404.html").write_text(page_shell("not-found", None, "页面未找到", "这条文学路径尚未开放。", urljoin(base, "404.html"), base), encoding="utf-8")
    if origin:
        write_sitemap(output, origin, routes)
    return {"output": str(output), "files": sum(1 for path in output.rglob("*") if path.is_file()), "routes": len(routes), "review_queue_exposed": False, "sitemap": bool(origin)}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--data", type=Path, default=DEFAULT_DATA)
    parser.add_argument("--origin", default=None, help="Confirmed HTTPS origin; enables sitemap.xml and robots.txt")
    args = parser.parse_args()
    if not args.data.is_file():
        raise FileNotFoundError(args.data)
    print(json.dumps({"status": "PASS", **build(args.output, args.data, args.origin)}, ensure_ascii=False))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
