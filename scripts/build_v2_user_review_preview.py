#!/usr/bin/env python3
"""Build a local-only rc.5 preview that exposes USER_REVIEW copy for inspection."""

from __future__ import annotations

import json
import subprocess
import tempfile
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CONTENT = ROOT / "data/v2/curation/PUBLIC_CONTENT.json"
WEB = ROOT / "artifacts/v2-rc5/user-review-preview-web"
BUNDLE = ROOT / "artifacts/v2-rc5/user-review-preview"


def main() -> int:
    payload = json.loads(CONTENT.read_text(encoding="utf-8"))
    for group in ("authors", "works", "places"):
        for record in payload[group]:
            for key, value in record.items():
                if key != "target_id":
                    value["status"] = "auto_approved"
                    value["reviewer"] = "LOCAL_USER_REVIEW_PREVIEW"
                    value["reviewed_at"] = None
    with tempfile.TemporaryDirectory(prefix="v2-rc5-review-") as temporary:
        draft = Path(temporary) / "PUBLIC_CONTENT.review-preview.json"
        draft.write_text(json.dumps(payload, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        subprocess.run([
            "python3", str(ROOT / "scripts/build_v2_web_data.py"),
            "--public-content", str(draft), "--output-dir", str(WEB),
            "--generated-at", "2026-08-13T00:00:00Z",
        ], cwd=ROOT, check=True)
    subprocess.run([
        "python3", str(ROOT / "scripts/build_v2_deploy_bundle.py"),
        "--data", str(WEB / "site_data.json"), "--output", str(BUNDLE),
    ], cwd=ROOT, check=True)
    index = BUNDLE / "index.html"
    html = index.read_text(encoding="utf-8")
    banner = '<div style="position:sticky;top:0;z-index:9999;padding:10px 16px;background:#7e281f;color:#fff;text-align:center;font:600 13px sans-serif">rc.5 本地审核预览｜文案尚未获得 USER 批准｜不是正式发布网站</div>'
    index.write_text(html.replace("<body>", f"<body>{banner}", 1), encoding="utf-8")
    print(BUNDLE)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
