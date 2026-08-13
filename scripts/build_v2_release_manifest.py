#!/usr/bin/env python3
"""Build or verify a detached rc.4 manifest for one exact Git commit and one exact dist directory."""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
from datetime import datetime, timezone
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_CONTROL = ROOT / "data/v2/release/V2.0.0_RELEASE_MANIFEST.json"
RELEASE_FILES = (
    "data/master/V1_MASTER.sqlite",
    "data/v2/geo/PLACES_GEO.csv", "data/v2/geo/PLACE_RELATIONS.csv",
    "data/v2/curation/CURATION_ENTRIES.csv", "data/v2/curation/CURATION_SELECTIONS.csv", "data/v2/curation/CURATION_RECOMMENDATIONS.csv",
    "data/v2/presentation/PUBLIC_PRESENTATION.json",
    "data/v2/web/site_data.json", "data/v2/web/manifest.json",
    "site/index.html", "site/app.js", "site/styles.css", "site/assets/latin-america-countries.geojson", "site/README.md",
    "scripts/validate_master.py", "scripts/build_v2_web_data.py", "scripts/validate_v2_web_data.py",
    "scripts/build_v2_deploy_bundle.py", "scripts/build_v2_release_manifest.py", "scripts/validate_v2_public_bundle.py",
    "scripts/qa_v2_public_ui.py", "scripts/qa_v2_browser.cjs", "scripts/qa_v2_lighthouse.cjs",
    "scripts/audit_v2_source_urls.py",
    "scripts/build_v2_coverage_plan.py", "tests/browser/public-product.spec.cjs",
    "package.json", "package-lock.json", "playwright.config.cjs",
    ".github/workflows/v2-ci.yml", ".github/workflows/v2-pages.yml",
    "data/v2/release/V2.0.0_RELEASE_MANIFEST.json",
)
RELEASE_STATES = {"pending_v2_n4", "approved_v2_n4"}
FORBIDDEN_PUBLIC_KEYS = {"review_status", "admission_status", "source_minimum_status", "schema_version", "review_queue", "presentation_review_queue"}


def digest_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def read_bytes(path: Path) -> bytes:
    return path.read_bytes()


def git(*args: str, check: bool = True) -> str:
    result = subprocess.run(["git", *args], cwd=ROOT, check=check, capture_output=True, text=True)
    return result.stdout.strip()


def git_blob(relative: str, commit: str) -> bytes:
    return subprocess.run(["git", "show", f"{commit}:{relative}"], cwd=ROOT, check=True, capture_output=True).stdout


def tree_keys(value: object) -> set[str]:
    if isinstance(value, dict):
        return set(value) | set().union(*(tree_keys(item) for item in value.values()))
    if isinstance(value, list):
        return set().union(*(tree_keys(item) for item in value)) if value else set()
    return set()


def require_clean_scope(commit: str | None, allow_worktree: bool = False) -> list[dict[str, object]]:
    if not commit:
        if not allow_worktree:
            raise ValueError("a candidate commit SHA is required unless --allow-worktree is explicitly used")
        entries = []
        for relative in RELEASE_FILES:
            path = ROOT / relative
            if not path.is_file():
                raise FileNotFoundError(relative)
            worktree = read_bytes(path)
            entries.append({"path": relative, "bytes": len(worktree), "sha256": digest_bytes(worktree)})
        return entries
    if git("rev-parse", "HEAD") != commit:
        raise ValueError("candidate commit is not the current HEAD")
    status = git("status", "--porcelain", "--", *RELEASE_FILES)
    if status:
        raise ValueError(f"frozen release scope has worktree changes:\n{status}")
    entries = []
    for relative in RELEASE_FILES:
        path = ROOT / relative
        if not path.is_file():
            raise FileNotFoundError(relative)
        worktree = read_bytes(path)
        blob = git_blob(relative, commit)
        if worktree != blob:
            raise ValueError(f"worktree bytes differ from candidate Git blob: {relative}")
        entries.append({"path": relative, "bytes": len(worktree), "sha256": digest_bytes(worktree), "git_blob_sha256": digest_bytes(blob)})
    return entries


def bundle_inventory(bundle: Path) -> list[dict[str, object]]:
    if not bundle.is_dir():
        raise FileNotFoundError(bundle)
    return [{"path": str(path.relative_to(bundle)), "bytes": path.stat().st_size, "sha256": digest_bytes(read_bytes(path))} for path in sorted(bundle.rglob("*")) if path.is_file()]


def verify_public_boundary(bundle: Path) -> dict[str, object]:
    public_data = json.loads((bundle / "data/v2/web/site_data.json").read_text(encoding="utf-8"))
    leaked = sorted(tree_keys(public_data) & FORBIDDEN_PUBLIC_KEYS)
    if leaked:
        raise ValueError(f"public boundary exposes governance keys: {leaked}")
    if public_data.get("public_release", {}).get("review_queue_exposed") is not False:
        raise ValueError("public bundle does not assert review_queue_exposed=false")
    return {"review_queue_exposed": False, "forbidden_keys": leaked}


def build_manifest(output: Path, bundle: Path, release_state: str, commit: str | None, allow_worktree: bool) -> dict[str, object]:
    if release_state not in RELEASE_STATES:
        raise ValueError("invalid release state")
    candidate = commit or (None if allow_worktree else git("rev-parse", "HEAD"))
    scope = require_clean_scope(candidate, allow_worktree)
    inventory = bundle_inventory(bundle)
    boundary = verify_public_boundary(bundle)
    control = json.loads(DEFAULT_CONTROL.read_text(encoding="utf-8"))
    if control.get("release_candidate") != "V2.0.0-rc.4" or control.get("release_state") != release_state:
        raise ValueError("release control file does not match requested rc/state")
    web = json.loads((ROOT / "data/v2/web/site_data.json").read_text(encoding="utf-8"))
    return {
        "manifest_version": "v2-release-manifest-0.3",
        "release_candidate": "V2.0.0-rc.4",
        "release_state": release_state,
        "candidate_commit_sha": candidate,
        "candidate_mode": "committed_clean_head" if candidate else "local_worktree_preflight",
        "git_branch": git("branch", "--show-current"),
        "generated_at": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "candidate_identity_protocol": "detached manifest is generated after checkout from clean HEAD and is attached to the CI run for that exact SHA",
        "release_scope": scope,
        "bundle": {"root": str(bundle.resolve()), "files": inventory},
        "web_data": {"schema_version": web["schema_version"], "counts": web["counts"]},
        "public_boundary": boundary,
    }


def verify_manifest(path: Path, bundle: Path, required_state: str | None, allow_worktree: bool) -> dict[str, object]:
    manifest = json.loads(path.read_text(encoding="utf-8"))
    if manifest.get("manifest_version") != "v2-release-manifest-0.3" or manifest.get("release_candidate") != "V2.0.0-rc.4":
        raise ValueError("unexpected manifest version or candidate")
    if required_state and manifest.get("release_state") != required_state:
        raise ValueError(f"release state must be {required_state}")
    commit = manifest.get("candidate_commit_sha")
    current_scope = require_clean_scope(commit, allow_worktree)
    if current_scope != manifest.get("release_scope"):
        raise ValueError("release input bytes differ from manifest")
    current_bundle = bundle_inventory(bundle)
    if current_bundle != manifest.get("bundle", {}).get("files"):
        raise ValueError("actual deployment bundle bytes differ from manifest")
    verify_public_boundary(bundle)
    return {"status": "PASS", "release_candidate": manifest["release_candidate"], "release_state": manifest["release_state"], "candidate_commit_sha": commit, "source_files": len(current_scope), "bundle_files": len(current_bundle)}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True, help="Detached manifest path; keep it outside the deployment bundle")
    parser.add_argument("--bundle", type=Path, required=True, help="Exact directory to verify and subsequently upload")
    parser.add_argument("--release-state", choices=sorted(RELEASE_STATES), default="pending_v2_n4")
    parser.add_argument("--candidate-commit-sha", default=None)
    parser.add_argument("--verify", action="store_true")
    parser.add_argument("--allow-worktree", action="store_true", help="Local preflight only: hash current worktree bytes without claiming a Git candidate")
    parser.add_argument("--require-release-state", choices=sorted(RELEASE_STATES))
    args = parser.parse_args()
    if args.verify:
        result = verify_manifest(args.output, args.bundle, args.require_release_state, args.allow_worktree)
    else:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        manifest = build_manifest(args.output, args.bundle, args.release_state, args.candidate_commit_sha, args.allow_worktree)
        args.output.write_text(json.dumps(manifest, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
        result = {"status": "PASS", "output": str(args.output), "candidate_commit_sha": manifest["candidate_commit_sha"], "source_files": len(manifest["release_scope"]), "bundle_files": len(manifest["bundle"]["files"])}
    print(json.dumps(result, ensure_ascii=False, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
