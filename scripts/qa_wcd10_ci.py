#!/usr/bin/env python3
"""Check tracked WCD-10 oracles and the exact standard/Pages build pipelines."""
from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import sys
import xml.etree.ElementTree as ET
from collections import Counter
from pathlib import Path
from urllib.parse import urlparse

from build_v2_deploy_bundle import SITE_FILES
from build_v2_web_data import is_research_only
from qa_wcd10_type_correction import verify_delta_from_export, verify_exports
from validate_v2_public_bundle import FORBIDDEN_KEYS, keys

ROOT = Path(__file__).resolve().parents[1]
GENERATED_AT = "2026-08-27T12:00:00Z"
ORIGIN = "https://yillan-lamb.github.io/latin-american-literature-map/"
SIGNATURES = {
    "facts": ("subject_id", "fact_field", "value_text"),
    "content_cards": ("subject_id", "card_type", "country_or_region", "genre_or_form", "language", "period_bucket"),
    "relationships": ("subject_id", "object_id", "relation_type", "description_zh"),
}
SAFE_FACT_STATES = {"accepted_for_n2", "batch_retained_candidate"}
INTERNAL_KEYS = FORBIDDEN_KEYS | {
    "input_layer", "origin_id", "origin_layer", "origin_material_id",
    "content_markdown", "usage_note", "relation_holds", "gaps",
}


def file_hashes(directory: Path) -> dict[str, str]:
    return {p.relative_to(directory).as_posix(): hashlib.sha256(p.read_bytes()).hexdigest()
            for p in sorted(directory.rglob("*")) if p.is_file()}


def run(repo: Path, script: str, *arguments: object) -> None:
    result = subprocess.run([sys.executable, str(repo / "scripts" / script), *map(str, arguments)],
                            cwd=repo, capture_output=True, text=True)
    if result.returncode:
        raise RuntimeError(f"{script} failed ({result.returncode})\n{result.stdout}\n{result.stderr}")


def validate_projection(full: dict, public: dict) -> dict:
    """Check row multisets independently of the deployment cleaner, including public subjects."""
    leaked = sorted(keys(public) & INTERNAL_KEYS)
    if leaked:
        raise ValueError(f"deployment exposes internal keys: {leaked}")
    if public["search_index"] != full["search_index"]:
        raise ValueError("deployment search scope differs from its input")
    public_ids = {r["target_id"] for r in public["search_index"]}
    counts = {}
    for table, columns in SIGNATURES.items():
        allowed = []
        research_only = []
        for row in full["research"][table]:
            if is_research_only(row):
                research_only.append(row)
                continue
            if row["subject_id"] not in public_ids:
                continue
            if table == "facts" and row.get("admission_status") not in SAFE_FACT_STATES:
                continue
            if table == "relationships" and row["object_id"] not in public_ids:
                continue
            allowed.append(tuple(row.get(c) or "" for c in columns))
        actual = Counter(tuple(row.get(c) or "" for c in columns) for row in public["research"][table])
        if actual - Counter(allowed):
            raise ValueError(f"deployment includes non-admitted {table}")
        counts[table] = {"research_only": len(research_only),
                         "research_only_on_deployed_subjects": sum(r["subject_id"] in public_ids for r in research_only),
                         "deployed": sum(actual.values())}
    return counts


def validate_bundle(bundle: Path, web_data: Path, *, development_preview: bool) -> dict:
    run(ROOT, "validate_v2_public_bundle.py", bundle)
    run(ROOT, "qa_v2_public_ui.py", bundle)
    full = json.loads(web_data.read_text(encoding="utf-8"))
    public = json.loads((bundle / "data/v2/web/site_data.json").read_text(encoding="utf-8"))
    isolation = validate_projection(full, public)
    routes = []
    origin_path = urlparse(ORIGIN).path
    for entry in ET.parse(bundle / "sitemap.xml").getroot():
        url = entry.findtext("{http://www.sitemaps.org/schemas/sitemap/0.9}loc")
        parsed = urlparse(url)
        if not url.startswith(ORIGIN) or not parsed.path.startswith(origin_path):
            raise ValueError("unexpected deployment sitemap origin")
        route = parsed.path[len(origin_path):]
        if ".." in Path(route).parts:
            raise ValueError("unsafe deployment route")
        routes.append(route)
    if not routes or len(routes) != len(set(routes)):
        raise ValueError("empty or duplicate deployment routes")
    allowed = set(SITE_FILES) | {"index.html", "404.html", "sitemap.xml", "robots.txt",
                                "data/v2/web/site_data.json", "data/v2/web/manifest.json"}
    allowed.update(route + "index.html" for route in routes)
    for asset in (ROOT / "site/assets").rglob("*"):
        if asset.is_file():
            if asset.suffix.lower() not in {".jpg", ".jpeg", ".png", ".webp", ".svg", ".avif", ".geojson", ".woff", ".woff2"}:
                raise ValueError("non-runtime material in site assets: " + asset.name)
            allowed.add("assets/" + asset.relative_to(ROOT / "site/assets").as_posix())
    if development_preview:
        allowed.add(".nojekyll")
        if not (bundle / ".nojekyll").is_file():
            raise ValueError("Pages artifact lacks .nojekyll")
    paths = file_hashes(bundle)
    unexpected = sorted(set(paths) - allowed)
    if unexpected or any(p.is_symlink() for p in bundle.rglob("*")):
        raise ValueError(f"unexpected deployment material: {unexpected}")
    if development_preview:
        for page in bundle.rglob("*.html"):
            if 'data-review-preview-banner' not in page.read_text(encoding="utf-8"):
                raise ValueError("development preview page lacks its label: " + str(page))
    return {"files": len(paths), "routes": len(routes), "deployed_targets": len(public["search_index"]),
            "isolation": isolation, "internal_fields_exposed": False, "unexpected_files": []}


def build_modes(repo: Path, output: Path) -> dict:
    """Mirror v2-pages.yml, including its second build and .nojekyll, without deployment."""
    output.mkdir(parents=True, exist_ok=False)
    protected = [repo / "data/master/V1_MASTER.sqlite"]
    for directory in ("curation", "presentation"):
        protected.extend(p for p in (repo / "data/v2" / directory).rglob("*") if p.is_file())
    before = {p: hashlib.sha256(p.read_bytes()).hexdigest() for p in protected}
    web = output / "standard-web"
    run(repo, "build_v2_web_data.py", "--output-dir", web, "--generated-at", GENERATED_AT)
    run(ROOT, "validate_v2_web_data.py", web / "site_data.json")
    standard = output / "standard"
    run(repo, "build_v2_deploy_bundle.py", "--data", web / "site_data.json", "--output", standard, "--origin", ORIGIN)
    run(repo, "build_v2_user_review_preview.py")
    preview_data = repo / "artifacts/v2-rc5/user-review-preview-web/site_data.json"
    run(ROOT, "validate_v2_web_data.py", preview_data)
    pages = output / "pages"
    run(repo, "build_v2_deploy_bundle.py", "--data", preview_data, "--output", pages,
        "--origin", ORIGIN, "--development-preview")
    (pages / ".nojekyll").touch()
    if before != {p: hashlib.sha256(p.read_bytes()).hexdigest() for p in protected}:
        raise ValueError("preview build changed source database or Curation/Presentation inputs")
    return {"standard": validate_bundle(standard, web / "site_data.json", development_preview=False),
            "pages": validate_bundle(pages, preview_data, development_preview=True)}


def compare_modes(base: Path, head: Path) -> dict:
    results = {}
    for mode in ("standard", "pages"):
        left, right = file_hashes(base / mode), file_hashes(head / mode)
        if not left or not right:
            raise ValueError("comparison needs two nonempty independently built artifacts")
        changed = sorted(p for p in set(left) | set(right) if left.get(p) != right.get(p))
        if changed:
            raise ValueError(f"{mode} base/head deployment differs: {changed}")
        # Identical files include all public JSON, HTML, assets and sitemap routes.
        results[mode] = {"identical_files": len(left), "changed_files": []}
    return results


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-dir", type=Path, default=ROOT / "artifacts/wcd10-ci")
    parser.add_argument("--base-repo", type=Path, help="Also compare separately built PR-base standard and Pages artifacts")
    parser.add_argument("--bundle", type=Path, help="Validate an already built Pages artifact before upload")
    parser.add_argument("--web-data", type=Path)
    args = parser.parse_args()
    if args.bundle:
        if not args.web_data:
            parser.error("--bundle requires --web-data")
        result = {"status": "PASS", "pages": validate_bundle(args.bundle, args.web_data, development_preview=True)}
    else:
        if args.web_data:
            parser.error("--web-data requires --bundle")
        if args.base_repo and args.base_repo.resolve() == ROOT:
            raise ValueError("base and head repositories must be distinct")
        args.output_dir.mkdir(parents=True, exist_ok=False)
        result = {"status": "PASS", "generated_at": GENERATED_AT, "origin": ORIGIN,
                  "type_correction": verify_delta_from_export(ROOT / "data/master/V1_MASTER.sqlite"),
                  "exports": verify_exports(ROOT / "data/master/V1_MASTER.sqlite", ROOT / "data/exports/wcd10-type-correction"),
                  "head": build_modes(ROOT, args.output_dir / "head")}
        if args.base_repo:
            result["base"] = build_modes(args.base_repo.resolve(), args.output_dir / "base")
            result["comparison"] = compare_modes(args.output_dir / "base", args.output_dir / "head")
        (args.output_dir / "report.json").write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result, ensure_ascii=False, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
