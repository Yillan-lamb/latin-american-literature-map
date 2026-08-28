#!/usr/bin/env python3
"""Validate literary content by derived readiness without forcing filler copy."""

from __future__ import annotations

import argparse
import json
import re
from collections import Counter
from difflib import SequenceMatcher
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_CONTENT = ROOT / "data/v2/curation/PUBLIC_CONTENT.json"
DEFAULT_PRESENTATION = ROOT / "data/v2/presentation/PUBLIC_PRESENTATION.json"
DEFAULT_PLACE_PROVENANCE = ROOT / "data/v2/curation/PUBLIC_CONTENT_PLACE_PROVENANCE.json"
BASELINE_AUTHOR_IDS = {
    "V1-ENT-0002", "V1-ENT-0016", "V1-ENT-0029", "V1-ENT-0030", "V1-ENT-0031",
    "V1-ENT-0072", "V1-ENT-0073", "V1-ENT-0074", "V1-ENT-0114", "V1-ENT-0115",
}
BASELINE_WORK_IDS = {
    "V1-ENT-0003", "V1-ENT-0004", "V1-ENT-0017", "V1-ENT-0018", "V1-ENT-0032",
    "V1-ENT-0035", "V1-ENT-0038", "V1-ENT-0075", "V1-ENT-0076", "V1-ENT-0077",
    "V1-ENT-0078", "V1-ENT-0079", "V1-ENT-0080", "V1-ENT-0081", "V1-ENT-0116",
    "V1-ENT-0117", "V1-ENT-0118",
}
FORBIDDEN = (
    "可以从形式进入", "可以留意人物、声音与时间", "本页只采用已有事实",
    "跨作品推荐仍在整理", "现有资料尚不足", "同一作者作品",
)
LOW_VALUE_PATTERNS = (
    "先确认原文题名和年份", "先确认原文题名与年份", "从官方书目进入",
    "先从官方书目确认", "作品时间线如何帮助", "一本作品如何从书目记录进入文学地图",
    "主题留待后续研究", "主题留待后续来源", "主题与人物关系留待",
    "社会主题留待来源", "按书目事实进入", "书目事实进入",
)
REQUIRED_FIELDS = {
    "authors": (
        "reader_lede", "why_know", "literary_features", "core_themes", "start_here",
        "reader_fit", "signature_keywords", "reading_route", "guiding_question",
    ),
    "works": (
        "story_intro", "why_read", "theme_explanations", "next_reads", "location_note",
        "reading_approach", "guiding_question",
    ),
    "places": ("literary_intro", "spatial_meaning", "exploration_route"),
}
CURATION_GATE_FIELDS = {
    "authors": ("why_know", "core_themes", "start_here", "reader_fit", "signature_keywords", "reading_route", "guiding_question"),
    "works": ("story_intro", "why_read", "theme_explanations", "next_reads", "reading_approach", "guiding_question"),
    "places": ("literary_intro", "spatial_meaning", "exploration_route"),
}
# These fields can encode literary value, reading order, audience fit, or
# interpretive synthesis. They may only bypass USER_REVIEW when the repository
# carries an explicit historical USER approval.
HIGH_JUDGMENT_FIELDS = {
    "authors": {
        "why_know", "literary_profile", "start_here", "core_themes",
        "literary_connections", "reader_fit", "signature_keywords",
        "reading_route", "guiding_question",
    },
    "works": {
        "why_read", "theme_explanations", "literary_significance",
        "reading_tips", "reading_approach", "guiding_question", "next_reads",
    },
    "places": {"literary_intro", "spatial_meaning", "reader_path", "exploration_route"},
}
HIGH_JUDGMENT_PRESENTATION_GROUPS = {"reading_paths", "why_read", "next_reads"}
PLACE_CONTENT_FIELDS = ("literary_intro", "spatial_meaning", "reader_path", "exploration_route")


def text(value: object) -> str:
    if isinstance(value, str):
        return value
    if isinstance(value, list):
        return " ".join(text(item) for item in value)
    if isinstance(value, dict):
        return " ".join(text(item) for item in value.values())
    return ""


def wrapper(
    record: dict[str, object],
    field: str,
    group: str | None = None,
) -> dict[str, object] | None:
    item = record.get(field)
    if not isinstance(item, dict) or item.get("status") not in {"auto_approved", "user_review", "hold"}:
        return None
    reviewer = item.get("reviewer")
    batch_reviewer = isinstance(reviewer, str) and re.fullmatch(r"LUNA-MAX-B\d{2}-REVIEW", reviewer)
    if item.get("status") == "auto_approved" and reviewer not in {"CODEX-REVIEW", "USER"} and not batch_reviewer:
        raise ValueError(f"{record.get('target_id')} approved {field} lacks reviewer")
    if (
        group
        and item.get("status") == "auto_approved"
        and field in HIGH_JUDGMENT_FIELDS[group]
        and reviewer != "USER"
    ):
        raise ValueError(
            f"{record.get('target_id')} high-judgment {field} lacks explicit USER approval"
        )
    return item


def structurally_complete(group: str, target_id: str, record: dict[str, object]) -> bool:
    items = {field: wrapper(record, field, group) for field in REQUIRED_FIELDS[group]}
    if any(item is None or item.get("status") == "hold" for item in items.values()):
        return False
    values = {field: item.get("content") for field, item in items.items() if item}
    if group == "authors":
        baseline = target_id in BASELINE_AUTHOR_IDS
        return (
            len(text(values["reader_lede"])) >= (60 if baseline else 35)
            and len(text(values["why_know"])) >= (45 if baseline else 25)
            and isinstance(values["literary_features"], list) and len(values["literary_features"]) >= 2
            and isinstance(values["core_themes"], list) and len(values["core_themes"]) >= 2
            and isinstance(values["start_here"], list) and len(values["start_here"]) >= 2
            and len(text(values["reader_fit"])) >= 25
            and isinstance(values["signature_keywords"], list) and len(values["signature_keywords"]) == 3
            and isinstance(values["reading_route"], list) and len(values["reading_route"]) >= 2
            and text(values["guiding_question"]).endswith("？")
        )
    if group == "works":
        baseline = target_id in BASELINE_WORK_IDS
        return (
            len(text(values["story_intro"])) >= (80 if baseline else 25)
            and isinstance(values["why_read"], list) and 2 <= len(values["why_read"]) <= 4
            and isinstance(values["theme_explanations"], list) and len(values["theme_explanations"]) >= 1
            and isinstance(values["next_reads"], list) and len(values["next_reads"]) >= 2
            and len(text(values["location_note"])) >= 12
            and len(text(values["reading_approach"])) >= (25 if baseline else 18)
            and text(values["guiding_question"]).endswith("？")
        )
    route = text(values["exploration_route"])
    return (
        len(text(values["literary_intro"])) >= 35
        and len(text(values["spatial_meaning"])) >= 25
        and len(route) >= 25
        and "从本页进入相关作家与作品" not in route
    )


def derive_readiness(group: str, record: dict[str, object]) -> str:
    target_id = str(record.get("target_id"))
    for field in REQUIRED_FIELDS[group]:
        item = wrapper(record, field, group)
        if item and any(pattern in text(item.get("content")) for pattern in LOW_VALUE_PATTERNS):
            if item.get("status") != "hold":
                raise ValueError(f"low-value template was not held: {target_id}.{field}")
            return "research_basic"
    if not structurally_complete(group, target_id, record):
        return "research_basic"
    gated = [wrapper(record, field, group) for field in CURATION_GATE_FIELDS[group]]
    if all(
        item and item.get("status") == "auto_approved"
        and item.get("research_refs") and item.get("source_refs")
        for item in gated
    ):
        return "curation_ready"
    return "reader_ready"


def validate_presentation_reviews(presentation: dict[str, object]) -> None:
    for group in ("reading_paths", "timeline_periods", "why_read", "next_reads"):
        for item in presentation.get(group, []):
            status = item.get("review_status")
            if status not in {"auto_approved", "user_review", "hold"}:
                raise ValueError(f"invalid presentation review status: {item.get('id')}")
            if (
                status == "auto_approved"
                and group in HIGH_JUDGMENT_PRESENTATION_GROUPS
                and item.get("reviewer") != "USER"
            ):
                raise ValueError(
                    f"{item.get('id')} high-judgment presentation lacks explicit USER approval"
                )


def validate_place_provenance(
    places: dict[str, dict[str, object]], provenance_path: Path
) -> None:
    """Require field-level evidence mappings for generated place curation."""
    payload = json.loads(provenance_path.read_text(encoding="utf-8"))
    if payload.get("schema_version") != "v2-public-content-place-provenance-0.1":
        raise ValueError("unexpected place provenance schema")
    mappings = payload.get("places")
    if not isinstance(mappings, dict):
        raise ValueError("invalid place provenance mappings")
    for target_id, mapping in mappings.items():
        record = places.get(target_id)
        if record is None or not isinstance(mapping, dict) or "default" not in mapping:
            raise ValueError(f"invalid place provenance target: {target_id}")
        for field_key in PLACE_CONTENT_FIELDS:
            item = wrapper(record, field_key, "places")
            expected = mapping.get(field_key, mapping["default"])
            if item is None or item.get("research_refs") != expected:
                raise ValueError(
                    f"place provenance mismatch: {target_id}.{field_key}"
                )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("path", type=Path, nargs="?", default=DEFAULT_CONTENT)
    parser.add_argument("--presentation", type=Path, default=DEFAULT_PRESENTATION)
    parser.add_argument("--require-public", action="store_true", help="Validate the curation-ready public subset")
    args = parser.parse_args()
    payload = json.loads(args.path.read_text(encoding="utf-8"))
    if payload.get("schema_version") != "v2-curation-content-0.3":
        raise ValueError("unexpected public content schema")
    groups = {
        "authors": {item["target_id"]: item for item in payload.get("authors", [])},
        "works": {item["target_id"]: item for item in payload.get("works", [])},
        "places": {item["target_id"]: item for item in payload.get("places", [])},
    }
    if not BASELINE_AUTHOR_IDS <= set(groups["authors"]) or not BASELINE_WORK_IDS <= set(groups["works"]) or len(groups["places"]) < 19:
        raise ValueError(
            f"coverage mismatch authors={len(groups['authors'])} works={len(groups['works'])} places={len(groups['places'])}"
        )
    validate_place_provenance(groups["places"], DEFAULT_PLACE_PROVENANCE)

    readiness: dict[str, Counter[str]] = {group: Counter() for group in groups}
    corpus: list[tuple[str, str]] = []
    approaches: list[str] = []
    for group, records in groups.items():
        for target_id, record in records.items():
            for field in record:
                if field != "target_id":
                    wrapper(record, field, group)
            level = derive_readiness(group, record)
            readiness[group][level] += 1
            if level == "research_basic":
                continue
            if args.require_public and level != "curation_ready":
                continue
            if group == "authors":
                corpus.append((
                    target_id,
                    f"{text(wrapper(record, 'reader_lede').get('content'))} "
                    f"{text(wrapper(record, 'why_know').get('content'))}",
                ))
            elif group == "works":
                intro = text(wrapper(record, "story_intro").get("content"))
                approaches.append(text(wrapper(record, "reading_approach").get("content")))
                corpus.append((target_id, intro))

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
        raise ValueError(f"highly similar reader-ready copy: {too_similar[:5]}")
    if len(set(approaches)) != len(approaches):
        raise ValueError("reader-ready work reading approaches are duplicated")

    presentation = json.loads(args.presentation.read_text(encoding="utf-8"))
    validate_presentation_reviews(presentation)
    paths = presentation.get("reading_paths", [])
    if len(paths) < 8:
        raise ValueError(f"homepage reading paths below gate: {len(paths)}")
    for path in paths:
        if (
            len(path.get("intro", "")) < 18
            or len(path.get("ordered_targets", [])) < 3
            or not path.get("guiding_question", "").endswith("？")
        ):
            raise ValueError(f"incomplete homepage reading path: {path.get('id')}")

    print(json.dumps({
        "status": "PASS",
        "phase": "public_subset" if args.require_public else "review_package",
        "counts": {group: len(records) for group, records in groups.items()},
        "content_readiness": {group: dict(sorted(levels.items())) for group, levels in readiness.items()},
        "reader_ready_approaches": len(set(approaches)),
        "reading_paths": len(paths),
        "similar_pairs": 0,
    }, ensure_ascii=False, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
