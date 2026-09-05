#!/usr/bin/env python3
"""WCD-08 公开边界机械 QA（public bundle leakage 检查）。

断言：
1. 候选池全部条目 status ∈ {user_review, hold}（本任务不产生 auto_approved）；
2. 正式 site_data.json 与公开 bundle（若存在）中不出现任何 anecdote 投影；
3. 本地 USER_REVIEW 预览（若存在）包含预览标记且逐条带 status/risk_level；
4. 候选正文不包含内部流程语言（auto_approved / review_status / V1- / SRC- 字面引用）。
任何断言失败都以非零码退出（fail-closed）。
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
CANDIDATES = REPO / "work/wcd08/WCD08_ANECDOTE_CANDIDATES.json"
PREVIEW = REPO / "work/wcd08/preview/data/v2/web/site_data.json"
ALLOWED_STATUSES = {"user_review", "hold"}
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
    checks += 1
    bad_status = [c["candidate_anecdote_id"] for c in cands if c.get("status") not in ALLOWED_STATUSES]
    if bad_status:
        failures.append(f"candidates with disallowed status: {bad_status[:5]}")

    # 2. main site_data + public bundle must not contain anecdotes
    for name, path in (("data site_data", REPO / "data/v2/web/site_data.json"),
                       ("dist bundle", REPO / "dist/data/v2/web/site_data.json")):
        if not path.exists():
            continue
        checks += 1
        hits = find_anecdote_keys(json.loads(path.read_text(encoding="utf-8")))
        if hits:
            failures.append(f"{name} leaks anecdotes at {hits[:3]}")

    # 3. preview sanity (optional presence)
    if PREVIEW.exists():
        checks += 1
        preview = json.loads(PREVIEW.read_text(encoding="utf-8"))
        items = [a for r in preview.get("reader_content", {}).get("authors", []) for a in r.get("anecdotes", [])]
        if not items:
            failures.append("preview contains no anecdote items (unexpected)")
        for item in items:
            if not item.get("status") or not item.get("risk_level") or not item.get("preview_mode"):
                failures.append(f"preview item missing gate fields: {item.get('anecdote_id')}")
        index = REPO / "work/wcd08/preview/index.html"
        checks += 1
        if "data-review-preview-banner" not in index.read_text(encoding="utf-8"):
            failures.append("preview index lacks review banner")

    # 4. internal language scan of candidate prose
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
