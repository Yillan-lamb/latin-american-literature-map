#!/usr/bin/env python3
"""WCD-08 公开边界机械 QA（public bundle leakage 检查）。

断言：
1. 候选池保留原始 USER_REVIEW 快照，正式 Curation 精确记录 95 条 USER 批准与 38 条 hold；
2. 正式 site_data.json 只投影当前公开作者范围内的 82 条批准内容，且不携带治理字段；
3. 本地 USER_REVIEW 预览（若存在）包含预览标记且逐条带 status/risk_level；
4. 候选正文不包含内部流程语言（auto_approved / review_status / V1- / SRC- 字面引用）；teaser 长度与来源门禁符合 08A。
任何断言失败都以非零码退出（fail-closed）。
"""
from __future__ import annotations

import json
import re
import sys
from urllib.parse import urlsplit
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
CANDIDATES = REPO / "work/wcd08/WCD08_ANECDOTE_CANDIDATES.json"
PREVIEW = REPO / "work/wcd08/preview/data/v2/web/site_data.json"
SOURCES = REPO / "work/wcd08/WCD08_SOURCES.json"
ALLOWED_STATUSES = {"user_review", "hold"}
FORMAL = REPO / "data/v2/curation/CURATION_ANECDOTES.json"
FORMAL_SOURCES = REPO / "data/v2/curation/CURATION_ANECDOTE_SOURCES.json"
INTERNAL_PATTERNS = re.compile(r"auto_approved|user_review|review_status|SRC-\d|V1-ENT-|research_refs|basis_note")


def find_anecdote_keys(node, path="$"):
    hits = []
    if isinstance(node, dict):
        for key, value in node.items():
            if key == "anecdotes":
                hits.append(f"{path}.{key}")
            hits.extend(find_anecdote_keys(value, f"{path}.{key}"))
    elif isinstance(node, list):
        for i, item in enumerate(node):
            hits.extend(find_anecdote_keys(item, f"{path}[{i}]"))
    return hits


def main() -> int:
    failures: list[str] = []
    checks = 0

    # 1. candidate statuses
    doc = json.loads(CANDIDATES.read_text(encoding="utf-8"))
    cands = doc.get("candidates", [])
    source_doc = json.loads(SOURCES.read_text(encoding="utf-8"))
    sources = {source["source_id"]: source for source in source_doc.get("sources", [])}
    checks += 1
    bad_status = [c["candidate_anecdote_id"] for c in cands if c.get("status") not in ALLOWED_STATUSES]
    if bad_status:
        failures.append(f"candidates with disallowed status: {bad_status[:5]}")

    # 1b. 08A content/risk/source gates.
    checks += 1
    bad_teasers = [c["candidate_anecdote_id"] for c in cands if not 60 <= len(c.get("teaser_zh", "")) <= 160]
    if bad_teasers:
        failures.append(f"teaser_zh outside 60-160 chars: {bad_teasers}")
    bad_gate = []
    bad_refs = []
    for candidate in cands:
        cid = candidate["candidate_anecdote_id"]
        refs = candidate.get("source_refs", [])
        if not refs or any(ref not in sources for ref in refs):
            bad_refs.append(cid)
        risk = candidate.get("risk_level")
        if risk == "HIGH" and candidate.get("status") != "hold":
            bad_gate.append(f"{cid}: HIGH must be hold")
        if risk in {"LOW", "MEDIUM"}:
            if len(refs) < 2 and candidate.get("status") != "hold":
                bad_gate.append(f"{cid}: single-source {risk} must be hold")
            if len(refs) >= 2 and not any(sources[ref].get("source_grade") in {"A", "A/B", "B"} for ref in refs):
                bad_gate.append(f"{cid}: lacks A/B source")
    if bad_refs:
        failures.append(f"dangling/empty source_refs: {bad_refs[:10]}")
    if bad_gate:
        failures.append(f"source/risk gate failures: {bad_gate[:10]}")

    # Every source object must have explicit nullable metadata and a locatable
    # page/catalog URL; a site root cannot be used as a claim locator.
    checks += 1
    source_required = {"author_or_publisher", "year", "isbn", "url", "access_date", "locator_status", "locator", "supports", "notes"}
    source_failures = []
    for sid, source in sources.items():
        if source_required - set(source):
            source_failures.append(f"{sid}: missing keys")
            continue
        url = source.get("url")
        parsed = urlsplit(url or "")
        if not url or not parsed.scheme or not parsed.netloc or (parsed.path in {"", "/"} and not parsed.query):
            source_failures.append(f"{sid}: non-locatable URL")
    if source_failures:
        failures.append(f"source locator failures: {source_failures[:10]}")

    # 2. Formal decision and source closure.
    checks += 1
    formal = json.loads(FORMAL.read_text(encoding="utf-8"))
    formal_sources = {
        item["source_id"] for item in json.loads(FORMAL_SOURCES.read_text(encoding="utf-8"))["sources"]
    }
    formal_rows = formal.get("anecdotes", [])
    approved = [item for item in formal_rows if item.get("status") == "auto_approved"]
    held = [item for item in formal_rows if item.get("status") == "hold"]
    if len(approved) != 95 or len(held) != 38:
        failures.append(f"formal decision counts drifted: approved={len(approved)}, hold={len(held)}")
    if any(item.get("reviewer") != "USER" or not item.get("reviewed_at") for item in approved):
        failures.append("formal approved records lack USER decision metadata")
    dangling = [item["anecdote_id"] for item in formal_rows if any(ref not in formal_sources for ref in item.get("source_refs", []))]
    if dangling:
        failures.append(f"formal source refs are dangling: {dangling[:10]}")

    # 3. Production reader projection is approved-only and governance-free.
    checks += 1
    site_data = json.loads((REPO / "data/v2/web/site_data.json").read_text(encoding="utf-8"))
    projected = [
        item
        for author in site_data.get("reader_content", {}).get("authors", [])
        for item in author.get("anecdotes", [])
    ]
    projected_ids = {item.get("anecdote_id") for item in projected}
    approved_ids = {item["anecdote_id"] for item in approved}
    forbidden = {"status", "reviewer", "reviewed_at", "risk_level", "fact_status", "fact_boundary", "source_refs"}
    if len(projected) != 82 or not projected_ids.issubset(approved_ids):
        failures.append(f"production projection gate drifted: projected={len(projected)}")
    leaked = [item.get("anecdote_id") for item in projected if set(item) & forbidden]
    if leaked:
        failures.append(f"production anecdotes expose governance fields: {leaked[:10]}")

    # 4. preview sanity (optional presence)
    if PREVIEW.exists():
        checks += 1
        preview = json.loads(PREVIEW.read_text(encoding="utf-8"))
        items = [a for r in preview.get("reader_content", {}).get("authors", []) for a in r.get("anecdotes", [])]
        if not items:
            failures.append("preview contains no anecdote items (unexpected)")
        for item in items:
            if not item.get("status") or not item.get("risk_level") or not item.get("preview_mode"):
                failures.append(f"preview item missing gate fields: {item.get('anecdote_id')}")
            if item.get("status") == "hold" and not item.get("hold_reason"):
                failures.append(f"preview hold missing hold_reason: {item.get('anecdote_id')}")
        index = REPO / "work/wcd08/preview/index.html"
        checks += 1
        index_html = index.read_text(encoding="utf-8")
        if "data-review-preview-banner" not in index_html:
            failures.append("preview index lacks review banner")
        if "<body><div data-review-preview-banner" not in index_html:
            failures.append("preview review banner is not the first body child")

    # 5. internal language scan of candidate prose
    checks += 1
    flagged = []
    for c in cands:
        blob = c["title_zh"] + c["teaser_zh"] + c["story_zh"]
        if INTERNAL_PATTERNS.search(blob):
            flagged.append(c["candidate_anecdote_id"])
    if flagged:
        failures.append(f"candidates contain internal/流程语言: {flagged}")

    print(json.dumps({"checks": checks, "candidates": len(cands), "failures": failures}, ensure_ascii=False, indent=1))
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
