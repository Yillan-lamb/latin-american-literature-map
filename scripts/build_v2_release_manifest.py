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
FREEZE_AT = "2026-08-12T00:00:00+08:00"
RELEASE_FILES = (
    "data/master/V1_MASTER.sqlite",
    "data/v2/geo/PLACES_GEO.csv",
    "data/v2/geo/PLACE_RELATIONS.csv",
    "data/v2/curation/CURATION_ENTRIES.csv",
    "data/v2/curation/CURATION_SELECTIONS.csv",
    "data/v2/curation/CURATION_RECOMMENDATIONS.csv",
    "data/v2/presentation/PUBLIC_PRESENTATION.json",
    "data/v2/web/site_data.json",
    "data/v2/web/manifest.json",
    "site/index.html",
    "site/app.js",
    "site/styles.css",
    "site/assets/latin-america-countries.geojson",
    "site/README.md",
    "scripts/build_v2_web_data.py",
    "scripts/validate_v2_web_data.py",
    "scripts/build_v2_release_manifest.py",
    "scripts/build_v2_deploy_bundle.py",
    "scripts/qa_v2_public_ui.py",
    "scripts/qa_v2_browser.cjs",
    ".github/workflows/v2-ci.yml",
    ".github/workflows/v2-pages.yml",
)
RELEASE_STATES = {"pending_v2_n4", "approved_v2_n4"}
FORBIDDEN_PUBLIC_KEYS = {"review_status", "admission_status", "source_minimum_status", "schema_version", "counts", "qa"}
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


def git_file_bytes(relative: str, commit: str) -> bytes:
    result = subprocess.run(["git", "show", f"{commit}:{relative}"], cwd=ROOT, check=True, capture_output=True)
    return result.stdout


def git_value(*args: str) -> str | None:
    try:
        result = subprocess.run(["git", *args], cwd=ROOT, check=True, capture_output=True, text=True)
    except (OSError, subprocess.CalledProcessError):
        return None
    return result.stdout.strip() or None


def build_manifest(output: Path, freeze_at: str, release_state: str, approved_commit_sha: str | None) -> dict[str, object]:
    if release_state not in RELEASE_STATES:
        raise ValueError(f"invalid release state: {release_state}")
    approved_commit = approved_commit_sha or git_value("rev-parse", "HEAD")
    if not approved_commit or git_value("cat-file", "-t", approved_commit) != "commit":
        raise ValueError("approved commit SHA does not identify a Git commit")
    files = []
    for relative in RELEASE_FILES:
        path = ROOT / relative
        if not path.is_file():
            raise FileNotFoundError(f"release file missing: {relative}")
        frozen = git_file_bytes(relative, approved_commit)
        files.append({"path": relative, "bytes": len(frozen), "sha256": hashlib.sha256(frozen).hexdigest()})

    site_data = json.loads((ROOT / "data/v2/web/site_data.json").read_text(encoding="utf-8"))
    return {
        "manifest_version": "v2-release-manifest-0.2",
        "release_candidate": "V2.0.0-rc.3",
        "release_state": release_state,
        "freeze_at": freeze_at,
        "generated_at": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "git": {"branch": git_value("branch", "--show-current"), "head": approved_commit},
        "approved_commit_sha": approved_commit,
        "commit_anchor_protocol": "manifest-control-commit-checks-out-approved-source-commit-before-verification",
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
    if manifest.get("release_candidate") != "V2.0.0-rc.3":
        raise ValueError("unexpected release candidate")
    if manifest.get("manifest_version") != "v2-release-manifest-0.2":
        raise ValueError("unexpected manifest version")
    state = manifest.get("release_state")
    if state not in RELEASE_STATES:
        raise ValueError("invalid manifest release_state")
    if required_state and state != required_state:
        raise ValueError(f"release state must be {required_state}, got {state}")
    scope = manifest.get("release_scope", [])
    paths = tuple(item.get("path") for item in scope)
    if paths != RELEASE_FILES:
        raise ValueError("release scope does not match the required deployment inputs")
    current_head = git_value("rev-parse", "HEAD")
    approved_commit = manifest.get("approved_commit_sha")
    if not approved_commit or approved_commit != current_head or manifest.get("git", {}).get("head") != current_head:
        raise ValueError(f"Git commit mismatch: manifest={approved_commit}, current={current_head}")
    for item in scope:
        target = ROOT / item["path"]
        if not target.is_file():
            raise FileNotFoundError(f"release file missing: {item['path']}")
        frozen = git_file_bytes(item["path"], current_head)
        if len(frozen) != item["bytes"] or hashlib.sha256(frozen).hexdigest() != item["sha256"]:
            raise ValueError(f"release file hash mismatch: {item['path']}")
    site_data = json.loads((ROOT / "data/v2/web/site_data.json").read_text(encoding="utf-8"))
    if site_data.get("schema_version") != manifest.get("web_data", {}).get("schema_version") or site_data.get("counts") != manifest.get("web_data", {}).get("counts"):
        raise ValueError("Web Data no longer matches manifest")
    from build_v2_deploy_bundle import clean_public_data

    public_data = clean_public_data(ROOT / "data/v2/web/site_data.json")
    def public_keys(value: object) -> set[str]:
        if isinstance(value, dict):
            return set(value) | set().union(*(public_keys(item) for item in value.values()))
        if isinstance(value, list):
            return set().union(*(public_keys(item) for item in value)) if value else set()
        return set()
    if "review_queue" in public_keys(public_data) or public_keys(public_data) & FORBIDDEN_PUBLIC_KEYS:
        raise ValueError("public boundary verification failed")
    return {"status": "PASS", "output": str(path), "files": len(scope), "release_state": state, "approved_commit_sha": approved_commit}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--freeze-at", default=FREEZE_AT)
    parser.add_argument("--release-state", choices=sorted(RELEASE_STATES), default="pending_v2_n4")
    parser.add_argument("--approved-commit-sha", default=None, help="Exact source commit to freeze; defaults to current HEAD")
    parser.add_argument("--verify", action="store_true", help="Verify a frozen manifest without writing files")
    parser.add_argument("--require-release-state", choices=sorted(RELEASE_STATES), default=None)
    args = parser.parse_args()
    if args.verify:
        print(json.dumps(verify_manifest(args.output, args.require_release_state), ensure_ascii=False))
        return 0
    args.output.parent.mkdir(parents=True, exist_ok=True)
    manifest = build_manifest(args.output, args.freeze_at, args.release_state, args.approved_commit_sha)
    args.output.write_text(json.dumps(manifest, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"status": "PASS", "output": str(args.output.relative_to(ROOT)), "files": len(manifest["release_scope"])}, ensure_ascii=False))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
