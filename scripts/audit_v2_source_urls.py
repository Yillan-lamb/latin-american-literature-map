#!/usr/bin/env python3
"""Audit source URLs without treating automated-access rejection as bibliographic invalidity."""

from __future__ import annotations

import argparse
import json
import sqlite3
import subprocess
from collections import Counter
from concurrent.futures import ThreadPoolExecutor
from datetime import date
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def check(item: tuple[str, str]) -> dict[str, object]:
    source_id, url = item
    result = subprocess.run([
        "curl", "-L", "-I", "--max-time", "20", "--connect-timeout", "8",
        "-A", "Mozilla/5.0 (compatible; LatinAmericanLiteratureMapSourceAudit/2.0)", url,
    ], capture_output=True, text=True)
    codes = [line.split()[1] for line in result.stdout.splitlines() if line.startswith("HTTP/") and len(line.split()) > 1]
    status = int(codes[-1]) if codes and codes[-1].isdigit() else None
    category = "reachable" if status and 200 <= status < 400 else "access_restricted" if status in {401, 403, 405, 406, 429} else "server_error" if status and status >= 500 else "network_or_timeout" if result.returncode else "not_found_or_other"
    return {"source_id": source_id, "url": url, "http_status": status, "curl_exit": result.returncode, "category": category, "note": "Automated access result only; source validity requires human/bibliographic review."}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    with sqlite3.connect(ROOT / "data/master/V1_MASTER.sqlite") as conn:
        rows = conn.execute("SELECT source_id, canonical_url FROM sources WHERE canonical_url IS NOT NULL AND canonical_url <> '' ORDER BY source_id").fetchall()
    with ThreadPoolExecutor(max_workers=8) as pool:
        results = list(pool.map(check, rows))
    categories = Counter(item["category"] for item in results)
    payload = {"audited_at": str(date.today()), "count": len(results), "categories": dict(sorted(categories.items())), "results": results, "policy": "Do not remove a source solely because an automated HEAD request is blocked or times out."}
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"status": "PASS", "count": len(results), "categories": payload["categories"], "output": str(args.output)}, ensure_ascii=False))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
