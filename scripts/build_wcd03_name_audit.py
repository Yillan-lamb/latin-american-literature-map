#!/usr/bin/env python3
"""Build the WCD-03 all-entity Chinese display-name review matrix."""

from __future__ import annotations

import csv
import json
import sqlite3
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DB = ROOT / "data/master/V1_MASTER.sqlite"
OUTPUT = ROOT / "project/audits/web/WCD_03_CHINESE_NAME_REVIEW_MATRIX.csv"

CHANGES = {
    "V1-ENT-0172": ("若热·亚马多", "WCD03-SRC-01", "published Chinese author spelling"),
    "V1-ENT-0190": ("《污秽的夜鸟》", "WCD03-SRC-03", "published Chinese title"),
    "V1-ENT-0195": ("《毁灭者亚巴顿》", "WCD03-SRC-04", "published Chinese title"),
    "V1-ENT-0296": ("萨曼塔·施维伯林", "WCD03-SRC-05;WCD03-SRC-06", "published Chinese author spelling"),
    "V1-ENT-0299": ("《营救距离》", "WCD03-SRC-05", "published Chinese title"),
    "V1-ENT-0300": ("《吃鸟的女孩》", "WCD03-SRC-06", "published Chinese title"),
    "V1-ENT-0302": ("《火中遗物》", "WCD03-SRC-07", "published Chinese title"),
    "V1-ENT-0303": ("《属于我们的夜晚》", "WCD03-SRC-08", "published Chinese title"),
    "V1-ENT-0304": ("《床上抽烟危险》", "WCD03-SRC-09", "published Chinese title"),
    "V1-ENT-0306": ("《树的隐秘生活》", "WCD03-SRC-10", "published Chinese title"),
    "V1-ENT-0307": ("《回家的路》", "WCD03-SRC-10", "published Chinese title"),
}

SPECIAL = {
    "V1-ENT-0286": (
        "HOLD",
        "available variants are not supported consistently enough for replacement; retain current name pending user decision",
        "low",
        "yes",
    ),
    "V1-ENT-0073": (
        "ALIAS",
        "retain charter-approved 胡利奥·科塔萨尔; roadmap variant 胡里奥 is only a future alias candidate, and the current schema has no alias field",
        "high",
        "no",
    ),
}

MULTI_EDITION = {
    "V1-ENT-0187": {
        "evidence": "WCD03-SRC-11;WCD03-SRC-02",
        "notes": (
            "retain the current mainland edition title 《短暂的生命》; "
            "the Taiwan edition title 《短暂的一生》 remains a future alias/edition-title candidate"
        ),
    },
}


def walk(value):
    if isinstance(value, dict):
        yield value
        for child in value.values():
            yield from walk(child)
    elif isinstance(value, list):
        for child in value:
            yield from walk(child)


def historical_statuses() -> dict[str, tuple[str, str]]:
    statuses: dict[str, tuple[str, str]] = {}
    for path in sorted((ROOT / "data/changesets").glob("WEB-CE-B*/RESEARCH_CHANGE_SET.json")):
        data = json.loads(path.read_text(encoding="utf-8"))
        default = data.get("display_name_policy", {}).get("default_status", "")
        for node in walk(data):
            entity_id = node.get("entity_id")
            if not entity_id:
                continue
            status = node.get("display_name_status") or default
            if status:
                statuses[entity_id] = (status, path.parent.name)
    return statuses


def scopes() -> tuple[set[str], set[str]]:
    site = json.loads((ROOT / "data/v2/web/site_data.json").read_text(encoding="utf-8"))
    public = {item for values in site["public_scope"].values() for item in values}
    curation = json.loads((ROOT / "data/v2/curation/PUBLIC_CONTENT.json").read_text(encoding="utf-8"))
    review = {
        item["target_id"]
        for key in ("authors", "works", "places")
        for item in curation[key]
        if item.get("target_id")
    }
    return public, review


def main() -> None:
    statuses = historical_statuses()
    public, review = scopes()
    conn = sqlite3.connect(DB)
    conn.row_factory = sqlite3.Row
    entities = conn.execute("SELECT * FROM entities ORDER BY entity_id").fetchall()
    rows = []
    for entity in entities:
        entity_id = entity["entity_id"]
        status, batch = statuses.get(entity_id, ("canonical_candidate", "legacy/master governance"))
        priority = "P0" if entity_id in public else "P1" if entity_id in review else "P2" if entity["entity_type"] == "place" else "P3"
        core_scope = "formal_public" if entity_id in public else "curation_review" if entity_id in review else "research_only"
        decision, confidence, needs = "PASS", "high", "no"
        proposed, evidence, issue, action, notes = entity["name_zh"], entity["origin_refs"], "none", "retain", ""
        if entity_id in MULTI_EDITION:
            evidence = MULTI_EDITION[entity_id]["evidence"]
            decision, confidence, needs = "ALIAS", "high", "no"
            issue = "multiple documented Chinese edition titles"
            action = "retain current label; record the other edition title as a future alias candidate"
            notes = MULTI_EDITION[entity_id]["notes"]
            status = "published_title"
        elif entity_id in CHANGES:
            proposed, evidence, reason = CHANGES[entity_id]
            decision, confidence, needs = "REPLACE", "high", "no"
            issue, action = "documented Chinese publication usage differs from current label", f"replace with {reason}"
            notes = f"previous label should become an alias candidate when an alias schema exists: {entity['name_zh']}"
            status = "published_title" if entity["entity_type"] in {"work", "collection"} else "published_name"
        elif entity_id in SPECIAL:
            decision, notes, confidence, needs = SPECIAL[entity_id]
            issue = "translation/spelling variant"
            action = "retain current label; record governance disposition"
        elif not entity["original_name"]:
            decision, confidence = "NO_CHINESE_NAME_NEEDED", "high"
            issue, action = "project-internal Chinese concept has no foreign-language source title", "retain Chinese canonical label"
        elif status == "provisional_title":
            decision, confidence = "PROVISIONAL", "medium"
            issue, action = "working Chinese display label; no Chinese-edition claim", "retain provisional label and original-name anchor"
        rows.append({
            "entity_id": entity_id,
            "entity_type": entity["entity_type"],
            "original_name": entity["original_name"],
            "current_name_zh": entity["name_zh"],
            "proposed_name_zh": proposed,
            "display_name_status": status,
            "current_evidence": evidence,
            "issue_type": issue,
            "recommended_action": action,
            "audit_decision": decision,
            "confidence": confidence,
            "requires_research": needs,
            "priority": priority,
            "core_scope": core_scope,
            "origin_batch": batch,
            "notes": notes,
        })
    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    with OUTPUT.open("w", encoding="utf-8", newline="") as fh:
        writer = csv.DictWriter(fh, fieldnames=list(rows[0]))
        writer.writeheader()
        writer.writerows(rows)
    print(f"wrote {len(rows)} rows to {OUTPUT.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
