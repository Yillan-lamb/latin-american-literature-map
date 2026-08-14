#!/usr/bin/env python3
"""Validate rc.5 public literary content coverage and non-template quality."""

from __future__ import annotations

import argparse
import json
from difflib import SequenceMatcher
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_CONTENT = ROOT / "data/v2/curation/PUBLIC_CONTENT.json"
AUTHOR_IDS = {
    "V1-ENT-0002", "V1-ENT-0016", "V1-ENT-0029", "V1-ENT-0030", "V1-ENT-0031",
    "V1-ENT-0072", "V1-ENT-0073", "V1-ENT-0074", "V1-ENT-0114", "V1-ENT-0115",
}
WORK_IDS = {
    "V1-ENT-0003", "V1-ENT-0004", "V1-ENT-0017", "V1-ENT-0018", "V1-ENT-0032",
    "V1-ENT-0035", "V1-ENT-0038", "V1-ENT-0075", "V1-ENT-0076", "V1-ENT-0077",
    "V1-ENT-0078", "V1-ENT-0079", "V1-ENT-0080", "V1-ENT-0081", "V1-ENT-0116",
    "V1-ENT-0117", "V1-ENT-0118",
}
FORBIDDEN = (
    "可以从形式进入", "可以留意人物、声音与时间", "本页只采用已有事实",
    "跨作品推荐仍在整理", "现有资料尚不足", "同一作者作品",
)


def text(value: object) -> str:
    if isinstance(value, str):
        return value
    if isinstance(value, list):
        return " ".join(text(item) for item in value)
    if isinstance(value, dict):
        return " ".join(text(item) for item in value.values())
    return ""


def reviewed(record: dict[str, object], field: str, require_public: bool) -> object:
    item = record.get(field)
    if not isinstance(item, dict) or item.get("status") not in {"auto_approved", "user_review"}:
        raise ValueError(f"{record.get('target_id')} missing reviewed draft {field}")
    if require_public and item.get("status") != "auto_approved":
        raise ValueError(f"{record.get('target_id')} {field} is not approved for public use")
    if require_public and (not item.get("research_refs") or not item.get("source_refs")):
        raise ValueError(f"{record.get('target_id')} {field} lacks evidence/reviewer")
    if item.get("status") == "auto_approved" and item.get("reviewer") != "CODEX-REVIEW":
        raise ValueError(f"{record.get('target_id')} approved {field} lacks reviewer")
    return item.get("content")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("path", type=Path, nargs="?", default=DEFAULT_CONTENT)
    parser.add_argument("--require-public", action="store_true", help="Require all release-blocking fields to be auto_approved")
    args = parser.parse_args()
    payload = json.loads(args.path.read_text(encoding="utf-8"))
    if payload.get("schema_version") != "v2-curation-content-0.2":
        raise ValueError("unexpected public content schema")
    authors = {item["target_id"]: item for item in payload.get("authors", [])}
    works = {item["target_id"]: item for item in payload.get("works", [])}
    places = {item["target_id"]: item for item in payload.get("places", [])}
    if set(authors) != AUTHOR_IDS or set(works) != WORK_IDS or len(places) < 19:
        raise ValueError(f"coverage mismatch authors={len(authors)} works={len(works)} places={len(places)}")
    corpus: list[tuple[str, str]] = []
    for target_id, record in authors.items():
        lede = text(reviewed(record, "reader_lede", args.require_public))
        why = text(reviewed(record, "why_know", args.require_public))
        features = reviewed(record, "literary_features", args.require_public)
        themes = reviewed(record, "core_themes", args.require_public)
        starts = reviewed(record, "start_here", args.require_public)
        if len(lede) < 60 or len(why) < 45 or not isinstance(features, list) or len(features) < 2 or not isinstance(themes, list) or len(themes) < 2 or not isinstance(starts, list) or len(starts) < 2:
            raise ValueError(f"incomplete author content: {target_id}")
        corpus.append((target_id, f"{lede} {why}"))
    for target_id, record in works.items():
        intro = text(reviewed(record, "story_intro", args.require_public))
        why = reviewed(record, "why_read", args.require_public)
        themes = reviewed(record, "theme_explanations", args.require_public)
        next_reads = reviewed(record, "next_reads", args.require_public)
        location = text(reviewed(record, "location_note", args.require_public))
        if len(intro) < 80 or not isinstance(why, list) or not 2 <= len(why) <= 4 or not isinstance(themes, list) or len(themes) < 2 or not isinstance(next_reads, list) or len(next_reads) < 2 or len(location) < 12:
            raise ValueError(f"incomplete work content: {target_id}")
        corpus.append((target_id, intro))
    for target_id, record in places.items():
        if len(text(reviewed(record, "literary_intro", args.require_public))) < 35 or len(text(reviewed(record, "spatial_meaning", args.require_public))) < 25:
            raise ValueError(f"incomplete place content: {target_id}")
    for target_id, value in corpus:
        if any(phrase in value for phrase in FORBIDDEN):
            raise ValueError(f"forbidden template phrase in {target_id}")
    too_similar = []
    for index, (left_id, left) in enumerate(corpus):
        for right_id, right in corpus[index + 1:]:
            ratio = SequenceMatcher(None, left, right).ratio()
            if ratio >= 0.78:
                too_similar.append((left_id, right_id, round(ratio, 3)))
    if too_similar:
        raise ValueError(f"highly similar public copy: {too_similar[:5]}")
    print(json.dumps({"status": "PASS", "phase": "public" if args.require_public else "review_package", "authors": len(authors), "works": len(works), "places": len(places), "similar_pairs": 0}, ensure_ascii=False))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
