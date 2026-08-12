#!/usr/bin/env python3
"""Scan rendered public pages for internal project language."""

from __future__ import annotations

import argparse
import json
import re
from html.parser import HTMLParser
from pathlib import Path


TERMS = (
    r"\bV1\b", r"\bV2\b", r"\bN[1-4]\b", r"research_gap", r"auto_approved",
    r"user_review", r"candidate_for_staging_review", r"card_period_only",
    r"source_minimum_status", r"review_status", r"admission_status", r"map_status",
    r"entity_type", r"place_kind", r"\bschema\b", r"SQLite", r"Web Data",
    r"release candidate", r"完整测试站", r"测试站", r"当前样本",
)
PATTERN = re.compile("|".join(TERMS), re.IGNORECASE)


class VisibleText(HTMLParser):
    def __init__(self) -> None:
        super().__init__()
        self.hidden = 0
        self.parts: list[str] = []

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        if tag in {"script", "style", "template"}:
            self.hidden += 1

    def handle_endtag(self, tag: str) -> None:
        if tag in {"script", "style", "template"} and self.hidden:
            self.hidden -= 1

    def handle_data(self, data: str) -> None:
        if not self.hidden:
            self.parts.append(data)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("root", type=Path)
    args = parser.parse_args()
    failures = []
    files = list(args.root.rglob("*.html"))
    for path in files:
        visible = VisibleText()
        visible.feed(path.read_text(encoding="utf-8"))
        text = " ".join(visible.parts)
        matches = sorted({match.group(0) for match in PATTERN.finditer(text)})
        if matches:
            failures.append({"path": str(path.relative_to(args.root)), "matches": matches})
    result = {"status": "FAIL" if failures else "PASS", "html_files": len(files), "failures": failures}
    print(json.dumps(result, ensure_ascii=False, sort_keys=True))
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
