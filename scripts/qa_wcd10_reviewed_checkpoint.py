#!/usr/bin/env python3
"""Verify a WCD-10 checkpoint against an independent, file-bound review gate."""
from __future__ import annotations

import argparse
import hashlib
import json
import re
from pathlib import Path
from typing import Any

from qa_wcd10_checkpoint import verify

SHA256_RE = re.compile(r"^[0-9a-f]{64}$")
BATCH_RE = re.compile(r"^WCD-10-(B\d{2})$")
REQUIRED_GATE_FIELDS = (
    "verdict",
    "task_id",
    "batch_id",
    "baseline_database_sha256",
    "migration_name",
    "migration_sha256",
    "mapping_path",
    "mapping_sha256",
    "reviewer",
)


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _inside_repo(repo: Path, path: Path, label: str, *, must_exist: bool = True) -> Path:
    candidate = path if path.is_absolute() else repo / path
    try:
        resolved = candidate.resolve(strict=must_exist)
        resolved.relative_to(repo)
    except (OSError, ValueError) as exc:
        raise ValueError(f"{label} must resolve inside canonical --repo") from exc
    return resolved


def _required_text(gate: dict[str, Any], field: str) -> str:
    value = gate.get(field)
    if not isinstance(value, str) or not value.strip():
        raise ValueError("review gate missing or invalid binding: " + field)
    return value


def _required_sha(value: str, label: str) -> str:
    if not SHA256_RE.fullmatch(value):
        raise ValueError(label + " must be a lowercase SHA-256 hex digest")
    return value


def validate_bindings(
    repo: Path,
    *,
    exports: Path,
    before_public: Path,
    after_public: Path,
    baseline_path: Path,
    mapping_path: Path,
    review_gate_path: Path,
    migration_name: str,
) -> tuple[Path, dict[str, Any], Path, Path, Path, Path, Path]:
    """Validate all review bindings and return canonical paths and parsed mapping/gate."""
    repo = repo.resolve(strict=True)
    if not repo.is_dir():
        raise ValueError("--repo must be a directory")

    exports = _inside_repo(repo, exports, "--exports")
    before_public = _inside_repo(repo, before_public, "--before-public")
    after_public = _inside_repo(repo, after_public, "--after-public")
    baseline_path = _inside_repo(repo, baseline_path, "--baseline-database")
    mapping_path = _inside_repo(repo, mapping_path, "--mapping")
    review_gate_path = _inside_repo(repo, review_gate_path, "--review-gate")
    if not exports.is_dir() or not before_public.is_dir() or not after_public.is_dir():
        raise ValueError("exports and public inputs must be directories")
    if not baseline_path.is_file() or not mapping_path.is_file() or not review_gate_path.is_file():
        raise ValueError("baseline, mapping, and review gate must be files")

    if before_public == after_public or before_public.samefile(after_public):
        raise ValueError("public before and after directories must be distinct")
    current_database = _inside_repo(repo, Path("data/master/V1_MASTER.sqlite"), "current master")
    if not current_database.is_file():
        raise ValueError("current master database is missing")
    if baseline_path == current_database or baseline_path.samefile(current_database):
        raise ValueError("baseline database must be distinct from current master")

    gate = json.loads(review_gate_path.read_text(encoding="utf-8"))
    if not isinstance(gate, dict):
        raise ValueError("review gate must be a JSON object")
    values = {field: _required_text(gate, field) for field in REQUIRED_GATE_FIELDS}
    if values["verdict"] != "PASS":
        raise ValueError("review gate verdict must be PASS")
    for field in ("baseline_database_sha256", "migration_sha256", "mapping_sha256"):
        _required_sha(values[field], "review gate " + field)
    if Path(values["migration_name"]).name != values["migration_name"]:
        raise ValueError("review gate migration_name must be a filename")
    if values["migration_name"] != migration_name:
        raise ValueError("migration name differs from independent review gate")
    if Path(migration_name).name != migration_name or migration_name in {".", ".."}:
        raise ValueError("--migration-name must be a filename inside data/master/migrations")
    migration_path = _inside_repo(
        repo, Path("data/master/migrations") / migration_name, "migration"
    )
    migration_root = _inside_repo(repo, Path("data/master/migrations"), "migration directory")
    if migration_path.parent != migration_root or not migration_path.is_file():
        raise ValueError("migration must be a file directly inside data/master/migrations")
    if digest(migration_path) != values["migration_sha256"]:
        raise ValueError("migration SQL differs from independent review gate hash")
    if digest(baseline_path) != values["baseline_database_sha256"]:
        raise ValueError("baseline database differs from independent review gate hash")

    batch_match = BATCH_RE.fullmatch(values["batch_id"])
    if not batch_match:
        raise ValueError("review gate batch_id must use WCD-10-BNN")
    batch_directory = Path("data/changesets/WCD-10") / batch_match.group(1)
    expected_gate = _inside_repo(
        repo, batch_directory / "CHECKPOINT_REVIEW.json", "review gate", must_exist=False
    )
    if review_gate_path != expected_gate:
        raise ValueError("review gate must be CHECKPOINT_REVIEW.json inside its reviewed batch")
    expected_mapping_rel = (
        batch_directory / "INTEGRATION_MAP.json"
    ).as_posix()
    if values["mapping_path"] != expected_mapping_rel:
        raise ValueError("review gate mapping_path must bind its WCD-10 batch integration map")
    expected_mapping = _inside_repo(repo, Path(expected_mapping_rel), "review gate mapping")
    if mapping_path != expected_mapping:
        raise ValueError("CLI mapping path differs from independent review gate mapping path")
    if digest(mapping_path) != values["mapping_sha256"]:
        raise ValueError("integration mapping differs from independent review gate hash")

    mapping = json.loads(mapping_path.read_text(encoding="utf-8"))
    if not isinstance(mapping, dict):
        raise ValueError("integration mapping must be a JSON object")
    if mapping.get("task_id") != values["task_id"] or mapping.get("batch_id") != values["batch_id"]:
        raise ValueError("integration mapping task/batch differs from independent review gate")
    candidate_review = mapping.get("candidate_review")
    if not isinstance(candidate_review, dict):
        raise ValueError("integration mapping lacks candidate_review baseline binding")
    if candidate_review.get("task_id") != values["task_id"]:
        raise ValueError("candidate_review task_id differs from independent review gate")
    if candidate_review.get("baseline_database_sha256") != values["baseline_database_sha256"]:
        raise ValueError("candidate_review baseline differs from independent review gate")
    if values["baseline_database_sha256"] != digest(baseline_path):
        raise ValueError("candidate review does not bind the explicit baseline file")

    return repo, mapping, baseline_path, mapping_path, migration_path, before_public, after_public


def verify_reviewed_checkpoint(
    repo: Path,
    exports: Path,
    before_public: Path,
    after_public: Path,
    mapping_path: Path,
    baseline_path: Path,
    migration_name: str,
    review_gate_path: Path,
) -> dict[str, Any]:
    """Verify exact checkpoint only after all independent-review bindings match."""
    (repo, mapping, baseline_path, mapping_path, migration_path,
     before_public, after_public) = validate_bindings(
        repo,
        exports=exports,
        before_public=before_public,
        after_public=after_public,
        baseline_path=baseline_path,
        mapping_path=mapping_path,
        review_gate_path=review_gate_path,
        migration_name=migration_name,
    )
    exports = _inside_repo(repo, exports, "--exports")
    gate_path = _inside_repo(repo, review_gate_path, "--review-gate")
    gate = json.loads(gate_path.read_text(encoding="utf-8"))
    report = verify(
        repo,
        exports,
        before_public,
        after_public,
        mapping_path,
        baseline_path=baseline_path,
        migration_name=migration_name,
        reviewed_sha256=gate["migration_sha256"],
        reviewed_reviewer=gate["reviewer"],
    )
    report["independent_review_binding"] = {
        "verdict": gate["verdict"],
        "reviewer": gate["reviewer"],
        "task_id": gate["task_id"],
        "batch_id": gate["batch_id"],
        "baseline_database_sha256": gate["baseline_database_sha256"],
        "migration_name": gate["migration_name"],
        "migration_sha256": gate["migration_sha256"],
        "mapping_path": gate["mapping_path"],
        "mapping_sha256": gate["mapping_sha256"],
    }
    return report


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument("--exports", type=Path, required=True)
    parser.add_argument("--before-public", type=Path, required=True)
    parser.add_argument("--after-public", type=Path, required=True)
    parser.add_argument("--baseline-database", type=Path, required=True)
    parser.add_argument("--mapping", type=Path, required=True)
    parser.add_argument("--migration-name", required=True)
    parser.add_argument("--review-gate", type=Path, required=True)
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()
    report = verify_reviewed_checkpoint(
        args.repo, args.exports, args.before_public, args.after_public,
        args.mapping, args.baseline_database, args.migration_name, args.review_gate,
    )
    content = json.dumps(report, ensure_ascii=False, indent=2) + "\n"
    if args.report:
        repo = args.repo.resolve(strict=True)
        report_path = _inside_repo(repo, args.report, "--report", must_exist=False)
        protected_files = {
            _inside_repo(repo, args.baseline_database, "--baseline-database"),
            _inside_repo(repo, args.mapping, "--mapping"),
            _inside_repo(repo, args.review_gate, "--review-gate"),
            _inside_repo(repo, Path("data/master/V1_MASTER.sqlite"), "current master"),
            _inside_repo(repo, Path("data/master/migrations") / args.migration_name, "migration"),
        }
        protected_directories = {
            _inside_repo(repo, args.exports, "--exports"),
            _inside_repo(repo, args.before_public, "--before-public"),
            _inside_repo(repo, args.after_public, "--after-public"),
        }
        if report_path in protected_files or any(
            directory == report_path or directory in report_path.parents
            for directory in protected_directories
        ):
            raise ValueError("--report must not overwrite an input file")
        report_path.parent.mkdir(parents=True, exist_ok=True)
        report_path.write_text(content, encoding="utf-8")
    print(content)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
