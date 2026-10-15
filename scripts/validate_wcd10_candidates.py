#!/usr/bin/env python3
"""Mechanical WCD-10 checks; PASS is not independent semantic admission."""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import sqlite3
import unicodedata
from contextlib import closing
from pathlib import Path
from urllib.parse import urlsplit

from wcd10_inventory import inventory

FACT_FIELDS = {"first_publication_year", "first_periodical_publication_year", "first_book_edition_year",
               "genre_or_form", "story_premise", "one_sentence_summary", "bibliographic_note", "research_note"}
DIRECT_TYPES = {"SET_IN"}  # Other relation paths need their own reviewed layer/evidence rules.
INTERPRETIVE_TYPES = {"EXPLORES_THEME", "RESPONDS_TO_WORK", "INFLUENCED_BY", "ASSOCIATED_WITH_MOVEMENT"}
APPEND_ONLY_REVIEW_SCHEMA = "wcd10-append-only-conflict-review-1"
APPEND_ONLY_REVIEW_DECISION = "APPROVE_EXACT_APPEND_ONLY_CORRECTIONS"
APPEND_ONLY_ENTRY_DECISION = "APPEND_ONLY_BIBLIOGRAPHIC_CORRECTION"


def norm(value):
    return " ".join("".join(c for c in unicodedata.normalize("NFKD", value).casefold()
                            if not unicodedata.combining(c)).split())


def canonical_url(value):
    parsed = urlsplit(value)
    return parsed.netloc.lower().removeprefix("www.") + parsed.path.rstrip("/") + ("?" + parsed.query if parsed.query else "")


def canonical_candidate_sha256(package):
    """Hash the parsed candidate JSON independent of whitespace and key order."""
    canonical = json.dumps(package, ensure_ascii=False, sort_keys=True, separators=(",", ":"), allow_nan=False)
    return hashlib.sha256(canonical.encode("utf-8")).hexdigest()


def _strict_json_object(pairs):
    result = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _reject_json_constant(value):
    raise ValueError(f"non-standard JSON constant: {value}")


def _append_only_conflict_review(package, conflict_review, db_fact_rows, database_sha256):
    """Return exactly reviewed candidate IDs and review errors; no policy fallback."""
    errors = []
    if not isinstance(conflict_review, dict):
        return set(), ["append-only conflict review must be a JSON object"]

    required = {
        "schema", "decision", "reviewer", "reviewed_at", "baseline_database_sha256",
        "candidate_content_sha256", "reviewed_conflicts",
    }
    if set(conflict_review) != required:
        errors.append("append-only conflict review has missing or unexpected top-level fields")
    if conflict_review.get("schema") != APPEND_ONLY_REVIEW_SCHEMA:
        errors.append("append-only conflict review schema is invalid")
    if conflict_review.get("decision") != APPEND_ONLY_REVIEW_DECISION:
        errors.append("append-only conflict review decision is not an explicit approval")
    if not isinstance(conflict_review.get("reviewer"), str) or not conflict_review.get("reviewer", "").strip():
        errors.append("append-only conflict review is missing reviewer identity")
    if not re.fullmatch(r"\d{4}-\d{2}-\d{2}", str(conflict_review.get("reviewed_at", ""))):
        errors.append("append-only conflict review has invalid reviewed_at date")

    if database_sha256 is not None:
        if conflict_review.get("baseline_database_sha256") != database_sha256:
            errors.append("append-only conflict review database SHA-256 does not match current database")
        if package.get("baseline_database_sha256") != database_sha256:
            errors.append("candidate baseline database SHA-256 does not match current database for reviewed conflict")
    if conflict_review.get("candidate_content_sha256") != canonical_candidate_sha256(package):
        errors.append("append-only conflict review candidate content SHA-256 does not match candidate package")

    actual_conflicts = {}
    for record in package.get("existing_facts", []):
        if not isinstance(record, dict):
            continue
        candidate_id = record.get("candidate_id")
        subject_id, field, value = record.get("subject_id"), record.get("field"), record.get("value")
        existing = [
            {"fact_id": row["fact_id"], "value": row["value_text"]}
            for row in db_fact_rows.get((subject_id, field), [])
            if row["value_text"] != value
        ]
        if existing and isinstance(candidate_id, str):
            actual_conflicts[candidate_id] = {"record": record, "existing_facts": sorted(existing, key=lambda row: row["fact_id"])}

    entries = conflict_review.get("reviewed_conflicts")
    if not isinstance(entries, list):
        errors.append("append-only conflict review reviewed_conflicts must be an array")
        entries = []
    approved = set()
    seen = set()
    entry_fields = {
        "candidate_id", "subject_id", "field", "new_value", "source_refs", "existing_facts", "decision",
    }
    for entry in entries:
        if not isinstance(entry, dict) or set(entry) != entry_fields:
            errors.append("append-only conflict review entry has missing or unexpected fields")
            continue
        candidate_id = entry.get("candidate_id")
        if not isinstance(candidate_id, str) or candidate_id in seen:
            errors.append("append-only conflict review contains missing or duplicate candidate_id")
            continue
        seen.add(candidate_id)
        actual = actual_conflicts.get(candidate_id)
        if actual is None:
            errors.append(f"append-only conflict review entry is dangling or does not match a current conflict: {candidate_id}")
            continue
        record = actual["record"]
        if entry.get("decision") != APPEND_ONLY_ENTRY_DECISION:
            errors.append(f"append-only conflict review entry is not an approved append-only correction: {candidate_id}")
            continue
        if record.get("field") != "bibliographic_note" or entry.get("field") != "bibliographic_note":
            errors.append(f"append-only conflict review only permits bibliographic_note conflicts: {candidate_id}")
            continue
        exact = (
            entry.get("subject_id") == record.get("subject_id")
            and entry.get("new_value") == record.get("value")
            and entry.get("source_refs") == record.get("source_refs")
            and entry.get("existing_facts") == actual["existing_facts"]
        )
        if not exact:
            errors.append(f"append-only conflict review binding differs from candidate or current old facts: {candidate_id}")
            continue
        boundary = record.get("boundary")
        if not isinstance(boundary, str) or not all(row["fact_id"] in boundary for row in actual["existing_facts"]):
            errors.append(f"append-only correction boundary must cite every preserved old fact ID: {candidate_id}")
            continue
        approved.add(candidate_id)

    # Every review entry must correspond to an actual conflict. Unreviewed conflicts
    # remain blocked by the ordinary conflict rule below.
    return approved if not errors else set(), errors


def validate(repo, package, conflict_review=None):
    errors, warnings, dedup = [], [], []
    seen = set()
    def fail(message):
        errors.append(message)
    def candidate_id(record):
        cid = record.get("candidate_id", "")
        if not re.fullmatch(r"WCD10-B\d{2}-[SWFR]\d{2,3}", cid) or cid in seen:
            fail(f"invalid/duplicate candidate ID: {cid}")
        seen.add(cid)
    baseline = inventory(repo)
    batch_authors = {a["author"]["entity_id"] for a in baseline["authors"] if a["batch_id"] == package.get("batch_id")}
    if set(package.get("author_ids", [])) != batch_authors or len(package.get("author_ids", [])) != len(batch_authors):
        fail("batch roster does not match the frozen Curation order")
    if not re.fullmatch(r"[0-9a-f]{40}", package.get("baseline_commit", "")):
        fail("missing full baseline commit")
    if not re.fullmatch(r"\d{4}-\d{2}-\d{2}", package.get("accessed_at", "")):
        fail("missing access date")
    database = repo / "data/master/V1_MASTER.sqlite"
    database_sha_before_review = None
    if conflict_review is not None:
        try:
            database_sha_before_review = hashlib.sha256(database.read_bytes()).hexdigest()
        except OSError as exc:
            errors.append(f"append-only conflict review cannot hash database before validation: {exc}")
    with closing(sqlite3.connect((repo / "data/master/V1_MASTER.sqlite").resolve().as_uri() + "?mode=ro", uri=True)) as conn:
        conn.row_factory = sqlite3.Row
        entities = {r["entity_id"]: dict(r) for r in conn.execute("SELECT * FROM entities")}
        db_sources = [dict(r) for r in conn.execute("SELECT * FROM sources")]
        db_fact_rows = [dict(r) for r in conn.execute("SELECT fact_id,subject_id,fact_field,value_text FROM facts")]
        db_fact_rows_by_key = {}
        for row in db_fact_rows:
            db_fact_rows_by_key.setdefault((row["subject_id"], row["fact_field"]), []).append(row)
        db_facts = {(r["subject_id"], r["fact_field"], r["value_text"]) for r in db_fact_rows}
        db_relations = {(r["subject_id"], r["relation_type"], r["object_id"]) for r in conn.execute("SELECT * FROM relationships")}
    reviewed_conflicts = set()
    if conflict_review is not None:
        review_errors = []
        try:
            database_sha_after_review = hashlib.sha256(database.read_bytes()).hexdigest()
        except OSError as exc:
            database_sha_after_review = None
            review_errors.append(f"append-only conflict review cannot hash database after validation: {exc}")
        if database_sha_before_review is not None and database_sha_after_review != database_sha_before_review:
            review_errors.append("database SHA-256 changed while validating append-only conflict review")
        if isinstance(conflict_review, dict) and "_load_error" in conflict_review:
            review_errors.append(f"append-only conflict review could not be loaded: {conflict_review['_load_error']}")
        else:
            reviewed_conflicts, binding_errors = _append_only_conflict_review(package, conflict_review, db_fact_rows_by_key, database_sha_after_review)
            review_errors.extend(binding_errors)
        errors.extend(review_errors)
    sources = {}
    for source in package.get("sources", []):
        candidate_id(source)
        cid = source["candidate_id"]
        parsed = urlsplit(source.get("url", ""))
        if parsed.scheme not in {"http", "https"} or not parsed.netloc or not source.get("title") or not source.get("author_or_editor"):
            fail(f"invalid source object: {cid}")
        if source.get("access_status") != "OPENED" or source.get("source_level") not in {"A", "B", "C"} or not source.get("locator") or not source.get("usage"):
            fail(f"source has insufficient access/grade/locator/boundary: {cid}")
        matches = [r["source_id"] for r in db_sources if canonical_url(r.get("canonical_url") or "") == canonical_url(source["url"])]
        dedup.append({"candidate_id": cid, "kind": "source", "disposition": "reuse" if matches else "new", "matches": matches})
        sources[cid] = source
    pending = {r["candidate_id"]: r for r in package.get("new_entities", [])}
    def refs(record):
        values = record.get("source_refs", [])
        if not values or len(values) != len(set(values)) or any(s not in sources for s in values):
            fail(f"invalid/empty source refs: {record}")
    fact_keys = set()
    def fact(record, subject, candidate_record=None):
        field, value = record.get("field"), record.get("value")
        refs(record)
        if field not in FACT_FIELDS or not isinstance(value, str) or not value.strip():
            fail(f"invalid fact: {subject}/{field}")
        if field and field.endswith("_year") and not re.fullmatch(r"\d{4}", str(value)):
            fail(f"non-atomic year: {subject}/{field}/{value}")
        key = (subject, field, value)
        if key in fact_keys or key in db_facts:
            fail(f"duplicate fact requires reuse, not insert: {key}")
        fact_keys.add(key)
        other_values = [v for s, f, v in db_facts if s == subject and f == field and v != value]
        reviewed_id = candidate_record.get("candidate_id") if isinstance(candidate_record, dict) else None
        if other_values and reviewed_id not in reviewed_conflicts:
            fail(f"existing field values require explicit conflict review: {subject}/{field}: {other_values}")
    new_titles = set()
    for entity in package.get("new_entities", []):
        candidate_id(entity)
        cid = entity["candidate_id"]
        if "created_description_zh" in entity:
            description = entity["created_description_zh"]
            if not isinstance(description, str) or not description.strip():
                fail(f"invalid created_description_zh override; expected non-empty string: {cid}")
        if entity.get("author_id") not in batch_authors or entity.get("entity_type") not in {"work", "collection"}:
            fail(f"out-of-scope entity: {cid}")
        if not entity.get("original_name") or not entity.get("name_policy") or not entity.get("rationale"):
            fail(f"missing naming/priority boundary: {cid}")
        key = (entity.get("entity_type"), norm(entity.get("original_name", "")))
        if key in new_titles:
            fail(f"duplicate proposed title/type: {cid}")
        new_titles.add(key)
        matches = [r["entity_id"] for r in entities.values() if norm(r.get("original_name") or "") == key[1]]
        same_layer = [eid for eid in matches if entities[eid]["entity_type"] == key[0]]
        if same_layer:
            fail(f"proposed entity already exists; reuse required: {cid}: {same_layer}")
        dedup.append({"candidate_id": cid, "kind": "entity", "disposition": "keep_separate" if matches else "new", "matches": matches})
        fields = {f["field"] for f in entity.get("facts", [])}
        has_bibliographic_support = "first_publication_year" in fields or any(
            f.get("field") == "bibliographic_note"
            and isinstance(f.get("value"), str)
            and f["value"].strip()
            for f in entity.get("facts", [])
        )
        if "genre_or_form" not in fields or not fields.intersection({"story_premise", "one_sentence_summary"}) or not has_bibliographic_support:
            fail(f"new entity lacks bibliographic facts or bounded description: {cid}")
        refs({"source_refs": entity.get("created_source_refs", [])})
        for item in entity.get("facts", []):
            fact(item, cid)
    scoped_work_ids = {w["entity"]["entity_id"] for a in baseline["authors"] if a["author"]["entity_id"] in batch_authors for w in a["works"]}
    for item in package.get("existing_facts", []):
        candidate_id(item)
        if item.get("subject_id") not in scoped_work_ids | batch_authors:
            fail(f"existing fact outside batch: {item.get('subject_id')}")
        if not item.get("boundary"):
            fail("existing fact lacks conflict/scope boundary")
        fact(item, item.get("subject_id"), item)
    relation_keys = set()
    for relation in package.get("extra_relationships", []):
        candidate_id(relation)
        refs(relation)
        subject, obj, kind = relation.get("subject_id"), relation.get("object_id"), relation.get("relation_type")
        key = (subject, kind, obj)
        if key in relation_keys or key in db_relations:
            fail(f"duplicate relation: {key}")
        relation_keys.add(key)
        types = {eid: e["entity_type"] for eid, e in {**entities, **pending}.items()}
        if subject not in types or obj not in types:
            fail(f"unknown relation endpoint: {key}")
        if subject not in scoped_work_ids | set(pending):
            fail(f"extra relationship subject outside batch: {key}")
        if kind == "SET_IN" and (types.get(subject) != "work" or types.get(obj) != "place"):
            fail(f"invalid SET_IN layers: {key}")
        if kind not in DIRECT_TYPES | INTERPRETIVE_TYPES | {"BASED_ON_EVENT", "APPEARS_IN"}:
            fail(f"unknown relation type: {kind}")
        if kind in INTERPRETIVE_TYPES or kind == "BASED_ON_EVENT":
            fail(f"interpretive/special admission requires dedicated semantic evidence matrix: {key}")
        elif kind not in DIRECT_TYPES:
            fail(f"relation path lacks reviewed admission rules: {key}")
    warnings.append("Mechanical PASS does not admit sources/facts/relations; independent Reviewer remains required.")
    return {"verdict": "pass" if not errors else "fail", "errors": errors, "warnings": warnings,
            "counts": {"source_candidates": len(sources), "new_entity_candidates": len(pending),
                       "new_fact_candidates": len(fact_keys), "new_created_candidates": len(pending),
                       "extra_relationship_candidates": len(relation_keys), "deferred": len(package.get("deferred", []))}, "dedup": dedup}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("package", type=Path)
    parser.add_argument("--repo", type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument("--report", type=Path)
    parser.add_argument("--review-gate", type=Path, help="Main REVIEW_GATE.json (verdict PASS; nested conflict_review extracted); direct narrow review JSON is also accepted")
    args = parser.parse_args()
    package = json.loads(args.package.read_text(encoding="utf-8"))
    conflict_review = None
    if args.review_gate:
        try:
            gate_document = json.loads(
                args.review_gate.read_text(encoding="utf-8"),
                object_pairs_hook=_strict_json_object,
                parse_constant=_reject_json_constant,
            )
            if not isinstance(gate_document, dict):
                conflict_review = {"_load_error": "review gate must be a JSON object"}
            elif "conflict_review" in gate_document:
                if gate_document.get("verdict") != "PASS":
                    conflict_review = {"_load_error": "overall REVIEW_GATE verdict must be PASS"}
                elif not isinstance(gate_document.get("conflict_review"), dict):
                    conflict_review = {"_load_error": "REVIEW_GATE conflict_review must be a JSON object"}
                else:
                    conflict_review = gate_document["conflict_review"]
            elif gate_document.get("schema") == APPEND_ONLY_REVIEW_SCHEMA:
                # Compatibility for explicitly supplied narrow conflict-review documents.
                conflict_review = gate_document
            else:
                conflict_review = {"_load_error": "REVIEW_GATE is missing conflict_review"}
        except (OSError, ValueError) as exc:
            conflict_review = {"_load_error": str(exc)}
    report = validate(args.repo, package, conflict_review=conflict_review)
    if conflict_review is not None:
        report["reviewed_append_only_conflicts"] = len(
            conflict_review.get("reviewed_conflicts", []) if isinstance(conflict_review, dict) else []
        ) if report["verdict"] == "pass" else 0
    output = json.dumps(report, ensure_ascii=False, indent=2) + "\n"
    if args.report:
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(output, encoding="utf-8")
    print(output)
    return 0 if report["verdict"] == "pass" else 1


if __name__ == "__main__":
    raise SystemExit(main())
