#!/usr/bin/env python3
"""Build a public static deployment candidate from the frozen V2 Web Data."""

from __future__ import annotations

import argparse
import json
import shutil
from pathlib import Path
from urllib.parse import urljoin


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_DATA = ROOT / "data/v2/web/site_data.json"


def clean_public_data(source: Path) -> dict[str, object]:
    payload = json.loads(source.read_text(encoding="utf-8"))
    payload.pop("review_queue", None)
    payload["public_release"] = {
        "review_queue_exposed": False,
        "public_curation_status": "auto_approved_only",
    }
    return payload


def write_sitemap(output: Path, origin: str) -> None:
    base = origin.rstrip("/") + "/"
    # The site uses hash routing. Fragments are not sitemap URLs, so only expose
    # the real document URL until the site adopts server-routable pages.
    urls = [base]
    body = "\n".join(f"  <url><loc>{url}</loc></url>" for url in urls)
    (output / "sitemap.xml").write_text(f'<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n{body}\n</urlset>\n', encoding="utf-8")
    (output / "robots.txt").write_text(f"User-agent: *\nAllow: /\nSitemap: {urljoin(base, 'sitemap.xml')}\n", encoding="utf-8")


def build(output: Path, data_path: Path, origin: str | None) -> dict[str, object]:
    if origin and not origin.startswith("https://"):
        raise ValueError("--origin must be a confirmed HTTPS origin")
    output.mkdir(parents=True, exist_ok=True)
    for name in ("index.html", "app.js", "styles.css"):
        shutil.copy2(ROOT / "site" / name, output / name)
    shutil.copy2(ROOT / "site" / "README.md", output / "README.md")
    shutil.copy2(ROOT / "site" / "index.html", output / "404.html")
    public_data_dir = output / "data/v2/web"
    public_data_dir.mkdir(parents=True, exist_ok=True)
    public_data = clean_public_data(data_path)
    (public_data_dir / "site_data.json").write_text(json.dumps(public_data, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    manifest = json.loads((ROOT / "data/v2/web/manifest.json").read_text(encoding="utf-8"))
    manifest["public_release"] = {"review_queue_exposed": False, "source_data": str(data_path.relative_to(ROOT))}
    (public_data_dir / "manifest.json").write_text(json.dumps(manifest, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    if origin:
        write_sitemap(output, origin)
    return {"output": str(output), "files": 7 + (2 if origin else 0), "review_queue_exposed": False, "sitemap": bool(origin)}


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
