#!/usr/bin/env python3
"""Allocate the Codex-approved V1-S4 source IDs and append registry rows.

The script is deliberately fail-closed: it only runs against a registry ending
at SRC-0016 and refuses duplicate candidate IDs, URLs, persistent IDs, or output
paths that already exist.
"""

from __future__ import annotations

import csv
import re
from pathlib import Path
from urllib.parse import urlsplit, urlunsplit


ROOT = Path(__file__).resolve().parents[1]
REGISTRY = ROOT / "data/catalog/SOURCE_REGISTRY.csv"
OUTPUT_MAP = ROOT / "data/catalog/SOURCE_ID_MAP_V1_S3_S4.csv"
NUMBERING = ROOT / (
    "work/external-ai/deliveries/"
    "V1-S4-A02_全局机械规范化与开放目录补核_交付/"
    "SOURCE_NUMBERING_CANDIDATES.csv"
)
OPEN_RECHECK = ROOT / (
    "work/external-ai/deliveries/"
    "V1-S4-A02_全局机械规范化与开放目录补核_交付/"
    "OPEN_AUTHORITY_RECHECK.csv"
)

SOURCE_FILES = {
    "V1-S3-B01": ROOT / "work/external-ai/deliveries/V1-S3-B01_墨西哥三作家研究里程碑_交付/SOURCE_CANDIDATES.csv",
    "V1-S3-B02": ROOT / "work/external-ai/deliveries/V1-S3-B02_文学爆炸与加勒比三作家里程碑_交付/SOURCE_CANDIDATES.csv",
    "V1-S3-B03": ROOT / "work/external-ai/deliveries/V1-S3-B03_安第斯与诗歌双作家里程碑_交付/SOURCE_CANDIDATES.csv",
    "V1-S4-A01": ROOT / "work/external-ai/deliveries/V1-S4-A01_阶段4权威补证与兼容性研究包_交付/SOURCE_CANDIDATES.csv",
}

REGISTRY_FIELDS = [
    "source_id",
    "temporary_id",
    "title",
    "original_title",
    "author_or_editor",
    "translator",
    "publisher",
    "publication_year",
    "isbn",
    "format",
    "page_count",
    "language",
    "source_level",
    "processing_status",
    "source_task",
    "public_content_scope",
    "local_asset_status",
    "persistent_id",
    "canonical_url",
]

MAP_FIELDS = [
    "legacy_candidate_id",
    "source_id",
    "source_title",
    "source_level",
    "source_task",
    "mapping_action",
    "master_candidate_id",
    "proposed_order",
    "mapping_note",
]


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(encoding="utf-8-sig", newline="") as handle:
        return list(csv.DictReader(handle))


def normalize_url(value: str) -> str:
    if not value:
        return ""
    parts = urlsplit(value.strip())
    path = parts.path.rstrip("/") or "/"
    return urlunsplit((parts.scheme.lower(), parts.netloc.lower(), path, parts.query, ""))


def persistent_id(row: dict[str, str]) -> str:
    notes = row.get("notes", "")
    match = re.search(r"\bDOI\s+(10\.\d{4,9}/[^；;，,\s]+)", notes, re.I)
    if match:
        return f"DOI {match.group(1).rstrip('.')}"
    url = row.get("url", "")
    match = re.search(r"/ark:/12148/([^/?#]+)", url)
    if match:
        return f"ark:/12148/{match.group(1)}"
    return ""


def publication_year(row: dict[str, str]) -> str:
    notes = row.get("notes", "").strip()
    match = re.match(r"^(1[89]\d{2}|20\d{2})(?:\b|[,，])", notes)
    return match.group(1) if match else ""


def source_type_from_url(url: str) -> str:
    host = urlsplit(url).netloc.lower()
    if "bnf.fr" in host:
        return "library_catalog"
    if "cervantes.es" in host:
        return "institutional_web"
    if "persee.fr" in host:
        return "journal_article"
    return "institutional_web"


def collect_metadata() -> dict[str, dict[str, str]]:
    metadata: dict[str, dict[str, str]] = {}
    for task, path in SOURCE_FILES.items():
        for row in read_csv(path):
            candidate_id = row["source_id"]
            if candidate_id in metadata:
                raise RuntimeError(f"duplicate candidate metadata: {candidate_id}")
            row = dict(row)
            row["source_task"] = task
            metadata[candidate_id] = row

    evidentiary = [
        row
        for row in read_csv(OPEN_RECHECK)
        if row["result_status"] in {"verified", "conflict"}
    ]
    for row in evidentiary:
        candidate_id = row["source_candidate_id"]
        if candidate_id in metadata:
            raise RuntimeError(f"duplicate recheck metadata: {candidate_id}")
        metadata[candidate_id] = {
            "source_id": candidate_id,
            "title": row["source_title"],
            "author_or_org": row["author_or_org"],
            "url": row["url"],
            "accessed_at": row["accessed_at"],
            "access_status": "ok",
            "language": "fr" if "bnf.fr" in row["url"] or "persee.fr" in row["url"] else "es",
            "proposed_level": row["proposed_level"],
            "source_type": source_type_from_url(row["url"]),
            "notes": row["evidence_note"],
            "source_task": "V1-S4-A02",
        }
    return metadata


def registry_row(formal_id: str, candidate_id: str, row: dict[str, str]) -> dict[str, str]:
    remote_format = "pdf" if row["url"].lower().split("?", 1)[0].endswith(".pdf") else "html"
    return {
        "source_id": formal_id,
        "temporary_id": candidate_id,
        "title": row["title"],
        "original_title": "",
        "author_or_editor": row["author_or_org"],
        "translator": "不适用",
        "publisher": "",
        "publication_year": publication_year(row),
        "isbn": "",
        "format": remote_format,
        "page_count": "N/A",
        "language": row.get("language", ""),
        "source_level": row.get("proposed_level", ""),
        "processing_status": "access_pass",
        "source_task": row["source_task"],
        "public_content_scope": "metadata_and_summary",
        "local_asset_status": "remote_only",
        "persistent_id": persistent_id(row),
        "canonical_url": row["url"],
    }


def main() -> None:
    if OUTPUT_MAP.exists():
        raise RuntimeError(f"refusing to overwrite existing map: {OUTPUT_MAP}")

    registry = read_csv(REGISTRY)
    if list(registry[0]) != REGISTRY_FIELDS:
        raise RuntimeError("unexpected SOURCE_REGISTRY.csv schema")
    existing_numbers = [int(row["source_id"].split("-")[1]) for row in registry]
    if existing_numbers != list(range(1, 17)):
        raise RuntimeError("registry must contain exactly SRC-0001 through SRC-0016")

    numbering = read_csv(NUMBERING)
    if len(numbering) != 61:
        raise RuntimeError("expected 61 numbering decisions")
    if any(row["formal_source_id"] for row in numbering):
        raise RuntimeError("external numbering table must still have blank formal_source_id")

    metadata = collect_metadata()
    candidate_ids = [row["candidate_source_id"] for row in numbering]
    if len(candidate_ids) != len(set(candidate_ids)):
        raise RuntimeError("duplicate candidate_source_id in numbering table")
    missing = set(candidate_ids) - set(metadata)
    if missing:
        raise RuntimeError(f"missing source metadata: {sorted(missing)}")

    new_decisions = sorted(
        (row for row in numbering if row["action_suggestion"] == "new_sequence_candidate"),
        key=lambda row: int(row["proposed_order"]),
    )
    if len(new_decisions) != 56:
        raise RuntimeError("expected 56 new source decisions")
    formal_by_candidate = {
        row["candidate_source_id"]: f"SRC-{number:04d}"
        for number, row in enumerate(new_decisions, start=17)
    }
    if list(formal_by_candidate.values()) != [f"SRC-{number:04d}" for number in range(17, 73)]:
        raise RuntimeError("formal ID sequence did not close at SRC-0072")

    # Fail closed on duplicate canonical URLs and persistent identifiers.
    existing_urls = {normalize_url(row["canonical_url"]) for row in registry if row["canonical_url"]}
    existing_pids = {row["persistent_id"].casefold() for row in registry if row["persistent_id"]}
    new_registry_rows: list[dict[str, str]] = []
    seen_urls: set[str] = set()
    seen_pids: set[str] = set()
    for decision in new_decisions:
        candidate_id = decision["candidate_source_id"]
        output = registry_row(formal_by_candidate[candidate_id], candidate_id, metadata[candidate_id])
        url_key = normalize_url(output["canonical_url"])
        pid_key = output["persistent_id"].casefold()
        if url_key in existing_urls or url_key in seen_urls:
            raise RuntimeError(f"duplicate canonical URL for {candidate_id}: {url_key}")
        if pid_key and (pid_key in existing_pids or pid_key in seen_pids):
            raise RuntimeError(f"duplicate persistent ID for {candidate_id}: {pid_key}")
        seen_urls.add(url_key)
        if pid_key:
            seen_pids.add(pid_key)
        new_registry_rows.append(output)

    map_rows: list[dict[str, str]] = []
    for decision in sorted(
        numbering,
        key=lambda row: (
            row["proposed_order"] == "",
            int(row["proposed_order"]) if row["proposed_order"] else 9999,
            row["numbering_candidate_id"],
        ),
    ):
        candidate_id = decision["candidate_source_id"]
        action = decision["action_suggestion"]
        master = decision["existing_source_id"] if decision["existing_source_id"] != "无" else ""
        if action == "new_sequence_candidate":
            formal_id = formal_by_candidate[candidate_id]
            note = "按 A02 R1 REVIEW 批准顺序分配新正式来源 ID"
        elif action == "reuse_existing":
            if master not in formal_by_candidate:
                raise RuntimeError(f"reuse master has no formal ID: {candidate_id} -> {master}")
            formal_id = formal_by_candidate[master]
            note = f"同文复用 {master} 的正式来源记录"
        elif action == "hold":
            formal_id = ""
            note = "D 级查询页继续 hold，不分配正式来源 ID"
        else:
            raise RuntimeError(f"unsupported action: {action}")
        source = metadata[candidate_id]
        map_rows.append(
            {
                "legacy_candidate_id": candidate_id,
                "source_id": formal_id,
                "source_title": source["title"],
                "source_level": source.get("proposed_level", ""),
                "source_task": source["source_task"],
                "mapping_action": action,
                "master_candidate_id": master,
                "proposed_order": decision["proposed_order"],
                "mapping_note": note,
            }
        )

    with REGISTRY.open("w", encoding="utf-8-sig", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=REGISTRY_FIELDS)
        writer.writeheader()
        writer.writerows(registry + new_registry_rows)
    with OUTPUT_MAP.open("w", encoding="utf-8-sig", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=MAP_FIELDS)
        writer.writeheader()
        writer.writerows(map_rows)

    print("allocated_new=56")
    print("reused=2")
    print("held=3")
    print("registry_rows=72")
    print(f"map_rows={len(map_rows)}")


if __name__ == "__main__":
    main()
