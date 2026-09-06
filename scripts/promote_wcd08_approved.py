#!/usr/bin/env python3
"""Promote the USER-reviewed WCD-08 candidate set into formal Curation data."""

from __future__ import annotations

import argparse
import json
from collections import Counter
from datetime import datetime
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_CANDIDATES = ROOT / "work/wcd08/WCD08_ANECDOTE_CANDIDATES.json"
DEFAULT_SOURCES = ROOT / "work/wcd08/WCD08_SOURCES.json"
DEFAULT_CURATION = ROOT / "data/v2/curation"
ANECDOTE_SCHEMA_VERSION = "v2-curation-anecdotes-0.1"
SOURCE_SCHEMA_VERSION = "v2-curation-anecdote-sources-0.1"
EXPECTED_STATUS_COUNTS = {"user_review": 95, "hold": 38}

TYPE_ZH = {
    "work_genesis": "作品诞生",
    "writing_habit": "写作习惯",
    "reading_influence": "阅读影响",
    "friendship": "作家交往",
    "literary_rivalry": "作家冲突",
    "publishing": "出版传播",
    "career": "职业经历",
    "travel_exile": "旅行流亡",
    "family_background": "家庭出身",
    "love_relationship": "感情婚姻",
    "humor_personality": "性格幽默",
    "political_life": "政治人生",
    "accident_turning_point": "意外转折",
    "public_life": "公共生活",
}


def type_label(raw: object) -> str:
    primary = str(raw or "").split("/", 1)[0]
    return TYPE_ZH.get(primary, primary or "人物故事")


def parse_reviewed_at(raw: str) -> str:
    value = raw.strip().replace("Z", "+00:00")
    parsed = datetime.fromisoformat(value)
    if parsed.tzinfo is None:
        raise ValueError("--reviewed-at must include a timezone")
    return parsed.isoformat(timespec="seconds")


def write_json(path: Path, value: object) -> None:
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--candidates", type=Path, default=DEFAULT_CANDIDATES)
    parser.add_argument("--sources", type=Path, default=DEFAULT_SOURCES)
    parser.add_argument("--curation-dir", type=Path, default=DEFAULT_CURATION)
    parser.add_argument("--reviewed-at", required=True)
    args = parser.parse_args()

    reviewed_at = parse_reviewed_at(args.reviewed_at)
    candidate_doc = json.loads(args.candidates.read_text(encoding="utf-8"))
    source_doc = json.loads(args.sources.read_text(encoding="utf-8"))
    candidates = candidate_doc.get("candidates", [])
    sources = source_doc.get("sources", [])
    status_counts = Counter(item.get("status") for item in candidates)
    if dict(status_counts) != EXPECTED_STATUS_COUNTS:
        raise ValueError(f"candidate decision baseline drifted: {dict(status_counts)}")
    if len(candidates) != 133 or len(sources) != 119:
        raise ValueError(f"candidate/source baseline drifted: {len(candidates)} candidates, {len(sources)} sources")

    sorted_sources = sorted(sources, key=lambda item: item["source_id"])
    source_id_map = {
        item["source_id"]: f"W08-SRC-{index:03d}"
        for index, item in enumerate(sorted_sources, 1)
    }
    formal_sources = []
    for item in sorted_sources:
        formal = dict(item)
        formal["legacy_candidate_source_id"] = formal.pop("source_id")
        formal["source_id"] = source_id_map[formal["legacy_candidate_source_id"]]
        formal_sources.append(formal)

    formal_anecdotes = []
    for item in sorted(candidates, key=lambda row: row["candidate_anecdote_id"]):
        approved = item["status"] == "user_review"
        formal_anecdotes.append(
            {
                "anecdote_id": item["candidate_anecdote_id"],
                "author_id": item["author_id"],
                "author_name_zh": item["author_name_zh"],
                "title": item["title_zh"],
                "teaser": item["teaser_zh"],
                "story": item["story_zh"],
                "time_label": item.get("time_label") or "",
                "location_label": item.get("location_label") or "",
                "type_label": type_label(item.get("anecdote_type")),
                "display_scope": item["display_scope"],
                "sort_order": item.get("sort_order") or 0,
                "status": "auto_approved" if approved else "hold",
                "risk_level": item["risk_level"],
                "fact_status": item["fact_status"],
                "fact_boundary": item["fact_boundary"],
                "source_refs": [source_id_map[source_id] for source_id in item["source_refs"]],
                "dispute_note": item.get("dispute_note") or "none",
                "reviewer": "USER" if approved else "UNREVIEWED",
                "reviewed_at": reviewed_at if approved else None,
                "review_note": "USER approved WCD-08 review pack" if approved else item.get("hold_reason") or item.get("review_note") or "hold retained",
                "legacy_candidate_id": item["candidate_anecdote_id"],
            }
        )

    approved = [item for item in formal_anecdotes if item["status"] == "auto_approved"]
    holds = [item for item in formal_anecdotes if item["status"] == "hold"]
    args.curation_dir.mkdir(parents=True, exist_ok=True)
    write_json(
        args.curation_dir / "CURATION_ANECDOTE_SOURCES.json",
        {
            "schema_version": SOURCE_SCHEMA_VERSION,
            "source_count": len(formal_sources),
            "sources": formal_sources,
        },
    )
    write_json(
        args.curation_dir / "CURATION_ANECDOTES.json",
        {
            "schema_version": ANECDOTE_SCHEMA_VERSION,
            "decision": {
                "reviewer": "USER",
                "reviewed_at": reviewed_at,
                "approved_count": len(approved),
                "hold_count": len(holds),
                "note": "Approval applies to the former user_review set only; pre-existing holds remain held.",
            },
            "anecdotes": formal_anecdotes,
        },
    )
    print(json.dumps({"approved": len(approved), "holds": len(holds), "sources": len(formal_sources), "reviewed_at": reviewed_at}, ensure_ascii=False, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
