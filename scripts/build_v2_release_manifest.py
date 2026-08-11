#!/usr/bin/env python3
"""Build a deterministic V2.0 release-candidate manifest without publishing anything."""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
from datetime import datetime, timezone
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_OUTPUT = ROOT / "data/v2/release/V2.0.0_RELEASE_MANIFEST.json"
FREEZE_AT = "2026-08-11T00:00:00+08:00"
RELEASE_FILES = (
    "data/master/V1_MASTER.sqlite",
    "data/v2/geo/PLACES_GEO.csv",
    "data/v2/geo/PLACE_RELATIONS.csv",
    "data/v2/curation/CURATION_ENTRIES.csv",
    "data/v2/curation/CURATION_SELECTIONS.csv",
    "data/v2/curation/CURATION_RECOMMENDATIONS.csv",
    "data/v2/web/site_data.json",
    "data/v2/web/manifest.json",
    "site/index.html",
    "site/app.js",
    "site/styles.css",
    "site/README.md",
    "scripts/build_v2_web_data.py",
    "scripts/build_v2_deploy_bundle.py",
    ".github/workflows/v2-pages.yml",
)
RELEASE_STATES = {"pending_v2_n4", "approved_v2_n4"}
EXCLUDED_PATTERNS = (
    "N1阅读材料/",
    "N1-OCR-*/",
    "*/inputs/",
    "*.pdf",
    "*.epub",
    "*.mobi",
    "*.azw",
    "*.azw3",
    "*.env",
    "*.key",
    "*.pem",
    "*cookie*",
    "*secret*",
    "*token*",
    "__pycache__/",
    ".DS_Store",
)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def git_value(*args: str) -> str | None:
    try:
        result = subprocess.run(["git", *args], cwd=ROOT, check=True, capture_output=True, text=True)
    except (OSError, subprocess.CalledProcessError):
        return None
    return result.stdout.strip() or None


def build_manifest(output: Path, freeze_at: str, release_state: str) -> dict[str, object]:
    if release_state not in RELEASE_STATES:
        raise ValueError(f"invalid release state: {release_state}")
    files = []
    for relative in RELEASE_FILES:
        path = ROOT / relative
        if not path.is_file():
            raise FileNotFoundError(f"release file missing: {relative}")
        files.append({"path": relative, "bytes": path.stat().st_size, "sha256": sha256(path)})

    site_data = json.loads((ROOT / "data/v2/web/site_data.json").read_text(encoding="utf-8"))
    return {
        "manifest_version": "v2-release-manifest-0.1",
        "release_candidate": "V2.0.0-rc.2",
        "release_state": release_state,
        "freeze_at": freeze_at,
        "generated_at": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "git": {"branch": git_value("branch", "--show-current"), "head": git_value("rev-parse", "HEAD")},
        "release_scope": files,
        "web_data": {
            "schema_version": site_data["schema_version"],
            "counts": site_data["counts"],
            "public_curation_status": "auto_approved_only",
            "review_queue_present_in_source_web_data": True,
            "review_queue_not_consumed_by_frontend": True,
        },
        "excluded_patterns": list(EXCLUDED_PATTERNS),
        "external_release_prerequisites": [
            "USER approval at V2-N4",
            "a confirmed HTTPS deployment origin",
            "production Pages/deployment settings enabled by the repository owner",
        ],
    }


def verify_manifest(path: Path, required_state: str | None) -> dict[str, object]:
    manifest = json.loads(path.read_text(encoding="utf-8"))
    if manifest.get("release_candidate") != "V2.0.0-rc.2":
        raise ValueError("unexpected release candidate")
    state = manifest.get("release_state")
    if state not in RELEASE_STATES:
        raise ValueError("invalid manifest release_state")
    if required_state and state != required_state:
        raise ValueError(f"release state must be {required_state}, got {state}")
    scope = manifest.get("release_scope", [])
    paths = tuple(item.get("path") for item in scope)
    if paths != RELEASE_FILES:
        raise ValueError("release scope does not match the required deployment inputs")
    for item in scope:
        target = ROOT / item["path"]
        if not target.is_file():
            raise FileNotFoundError(f"release file missing: {item['path']}")
        if target.stat().st_size != item["bytes"] or sha256(target) != item["sha256"]:
            raise ValueError(f"release file hash mismatch: {item['path']}")
    return {"status": "PASS", "output": str(path.relative_to(ROOT)), "files": len(scope), "release_state": state}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--freeze-at", default=FREEZE_AT)
    parser.add_argument("--release-state", choices=sorted(RELEASE_STATES), default="pending_v2_n4")
    parser.add_argument("--verify", action="store_true", help="Verify a frozen manifest without writing files")
    parser.add_argument("--require-release-state", choices=sorted(RELEASE_STATES), default=None)
    args = parser.parse_args()
    if args.verify:
        print(json.dumps(verify_manifest(args.output, args.require_release_state), ensure_ascii=False))
        return 0
    args.output.parent.mkdir(parents=True, exist_ok=True)
    manifest = build_manifest(args.output, args.freeze_at, args.release_state)
    args.output.write_text(json.dumps(manifest, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"status": "PASS", "output": str(args.output.relative_to(ROOT)), "files": len(manifest["release_scope"])}, ensure_ascii=False))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
