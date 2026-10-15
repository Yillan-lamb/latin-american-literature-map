#!/usr/bin/env python3
"""Prepare (never apply) a reviewed WCD-10 change set as append-only SQL.

Candidate content hashes are bound to an independent review. Registration and
the generated SQL still need an independent migration review before applying.
No existing entity, fact, card, evidence or hold is overwritten.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import sqlite3
from collections import defaultdict
from contextlib import closing
from pathlib import Path

from validate_wcd10_candidates import canonical_url, validate


LEGACY_RESEARCH_NOTE_BATCHES = {"WCD-10-B01", "WCD-10-B02", "WCD-10-B03", "WCD-10-B04"}
LEGACY_RESEARCH_NOTE_PACKAGES_SHA256 = {
    "WCD-10-B01": {
        "CANDIDATES.json": "46b0739aa42e57a5e5b7598907de02a5205e83abd667c373582435ec2ffb092a",
        "SUPPLEMENT.json": "afca3a2a81012943fd92fef4babd4207abaa6dec1e8cc8be03f38e0e46a12e3d",
    },
    "WCD-10-B02": {
        "CANDIDATES.json": "3acb01b237a75a7393519efff5558d2eb874278918575a297755de58935877f4",
    },
    "WCD-10-B03": {
        "CANDIDATES.json": "0beaea57073ee14b1450613004f033d6ec68bed337745bdb7afc47453c306d4b",
    },
    "WCD-10-B04": {
        "CANDIDATES.json": "c62fcbfe5c99a627ed20e5978e7d8175c35213f1031ba7c2742f866a2a511e22",
    },
}
RESEARCH_NOTE_CLASS_BY_GRADE = {"A": "scholarly_paraphrase", "B": None, "C": None}
LEGACY_SNAPSHOT_WRAPPER_KEYS = {
    "object_ref", "legacy_object_snapshot", "research_status", "research_refs", "fresh_review",
}
LEGACY_SNAPSHOT_KEYS = {
    "entity", "facts", "fact_sources", "cards", "card_facts", "card_sources", "relations",
    "relationship_sources", "relationship_evidence", "relation_holds", "relation_hold_evidence",
    "source_objects", "gaps",
}
LEGACY_SNAPSHOT_FORBIDDEN_KEYS = {"candidate_facts", "research_refs"}


def sha256(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def literal(value):
    if value is None:
        return "NULL"
    return "'" + str(value).replace("'", "''") + "'"


def checkpoint_date(package, gate):
    """Bind new checkpoints to review, without changing frozen B01/B02 SQL."""
    value = gate.get("checkpoint_date")
    if value is None and package["batch_id"] in {"WCD-10-B01", "WCD-10-B02"}:
        return "2026-09-28"  # Historical SQL byte-for-byte replay boundary.
    if not isinstance(value, str) or not re.fullmatch(r"\d{4}-\d{2}-\d{2}", value):
        raise ValueError("new batch needs an explicit reviewed checkpoint_date")
    from datetime import date
    date.fromisoformat(value)
    return value


def reviewed_source_reuse(conn, source, profile, scope):
    """Resolve a reviewed canonical-URL match; never create its duplicate."""
    matches = [dict(row) for row in conn.execute("SELECT source_id,canonical_url,source_level FROM sources")
               if canonical_url(row["canonical_url"] or "") == canonical_url(source["url"])]
    requested = source.get("reuse_existing_source") or profile.get("reuse_existing_source")
    if scope.get("disposition") == "reuse":
        requested = requested or scope.get("related_existing_source")
    if not matches:
        if requested:
            raise ValueError("reviewed reuse does not match existing canonical URL")
        return None
    if len(matches) != 1:
        raise ValueError("ambiguous existing canonical URL; source review required")
    row = matches[0]
    if requested != row["source_id"]:
        raise ValueError("canonical URL already exists; explicit reviewed reuse required")
    if source["source_level"] != row["source_level"]:
        raise ValueError("reuse cannot silently change existing source grade")
    return row["source_id"]


def author_metadata(conn, existing_facts, author_id, field):
    """Reuse explicit legacy author metadata; never infer missing values."""
    values = {row["value_text"] for row in existing_facts
              if row["subject_id"] == author_id and row["fact_field"] == field}
    if values:
        if len(values) != 1 or not next(iter(values)):
            raise ValueError("ambiguous author metadata: " + author_id + "/" + field)
        return next(iter(values)), []
    if field not in {"country_or_region", "language"}:
        raise ValueError("unsupported author card fallback: " + field)
    rows = conn.execute('SELECT card_id, "' + field + '" FROM content_cards '
                        "WHERE subject_id=? AND card_type='author' ORDER BY card_id", (author_id,)).fetchall()
    values = {row[1] for row in rows}
    if len(values) != 1 or not next(iter(values)):
        raise ValueError("missing or ambiguous author card metadata: " + author_id + "/" + field)
    return next(iter(values)), [row[0] for row in rows]


def _canonical_rows(rows):
    """Compare JSON record collections without treating array order as data."""
    return sorted(json.dumps(row, sort_keys=True, ensure_ascii=False, separators=(",", ":")) for row in rows)


def _legacy_snapshots_match(snapshot, actual):
    """Compare closure records field-for-field while ignoring row order."""
    if snapshot.get("entity") != actual.get("entity"):
        return False
    array_fields = LEGACY_SNAPSHOT_KEYS - {"entity"}
    return all(_canonical_rows(snapshot.get(field, [])) == _canonical_rows(actual.get(field, []))
               for field in array_fields)


def _table_rows(conn, table, where, params):
    cursor = conn.execute(f'SELECT * FROM "{table}" WHERE {where}', params)
    columns = [item[0] for item in cursor.description]
    return [dict(zip(columns, row)) for row in cursor.fetchall()]


def legacy_object_snapshot_from_database(conn, object_ref):
    """Read the complete legacy object closure from the read-only baseline."""
    entities = _table_rows(conn, "entities", "entity_id=?", (object_ref,))
    if len(entities) != 1:
        raise ValueError("legacy_object_snapshot entity must resolve to one baseline entity: " + object_ref)
    facts = _table_rows(conn, "facts", "subject_id=?", (object_ref,))
    fact_ids = {item["fact_id"] for item in facts}
    fact_sources = []
    if fact_ids:
        fact_sources = _table_rows(conn, "fact_sources", "fact_id IN (" + ",".join("?" for _ in fact_ids) + ")",
                                   tuple(sorted(fact_ids)))
    cards = _table_rows(conn, "content_cards", "subject_id=?", (object_ref,))
    card_ids = {item["card_id"] for item in cards}
    card_facts = []
    card_sources = []
    if card_ids:
        placeholders = ",".join("?" for _ in card_ids)
        card_facts = _table_rows(conn, "card_facts", "card_id IN (" + placeholders + ")", tuple(sorted(card_ids)))
        card_sources = _table_rows(conn, "card_sources", "card_id IN (" + placeholders + ")", tuple(sorted(card_ids)))
    relations = _table_rows(conn, "relationships", "object_id=? OR subject_id=?", (object_ref, object_ref))
    relation_ids = {item["relationship_id"] for item in relations}
    relationship_sources = []
    relationship_evidence = []
    if relation_ids:
        placeholders = ",".join("?" for _ in relation_ids)
        params = tuple(sorted(relation_ids))
        relationship_sources = _table_rows(conn, "relationship_sources", "relationship_id IN (" + placeholders + ")", params)
        relationship_evidence = _table_rows(conn, "relationship_evidence", "relationship_id IN (" + placeholders + ")", params)
    relation_holds = _table_rows(conn, "relation_holds", "object_id=? OR subject_id=?", (object_ref, object_ref))
    hold_ids = {item["relation_hold_id"] for item in relation_holds}
    relation_hold_evidence = []
    if hold_ids:
        placeholders = ",".join("?" for _ in hold_ids)
        relation_hold_evidence = _table_rows(
            conn, "relation_hold_evidence", "relation_hold_id IN (" + placeholders + ")", tuple(sorted(hold_ids)))
    source_ids = {item["source_id"] for rows in (fact_sources, card_sources, relationship_sources,
                                                  relationship_evidence, relation_hold_evidence) for item in rows}
    source_objects = []
    if source_ids:
        placeholders = ",".join("?" for _ in source_ids)
        source_objects = _table_rows(conn, "sources", "source_id IN (" + placeholders + ")", tuple(sorted(source_ids)))
    all_gaps = _table_rows(conn, "gaps", "1=1", ())
    gaps = [item for item in all_gaps
            if object_ref in str(item.get("gap_key") or "") or object_ref in str(item.get("origin_gap_id") or "")]
    return {
        "entity": entities[0], "facts": facts, "fact_sources": fact_sources, "cards": cards,
        "card_facts": card_facts, "card_sources": card_sources, "relations": relations,
        "relationship_sources": relationship_sources, "relationship_evidence": relationship_evidence,
        "relation_holds": relation_holds, "relation_hold_evidence": relation_hold_evidence,
        "source_objects": source_objects, "gaps": gaps,
    }


def _assert_primary_matches_legacy_snapshot(primary, snapshot, object_ref):
    """Ensure the research-bearing main row and preservation snapshot agree."""
    if primary.get("entity") != snapshot["entity"]:
        raise ValueError("legacy_object_snapshot entity differs from the unique main row: " + object_ref)
    old_facts = primary.get("old_facts")
    if not isinstance(old_facts, list):
        raise ValueError("legacy_object_snapshot requires main-row old_facts: " + object_ref)
    primary_facts = []
    primary_fact_sources = []
    for item in old_facts:
        if not isinstance(item, dict) or not isinstance(item.get("fact"), dict) or not isinstance(item.get("source_chain"), list):
            raise ValueError("legacy_object_snapshot main-row fact/source chain is malformed: " + object_ref)
        primary_facts.append(item["fact"])
        primary_fact_sources.extend(item["source_chain"])
    if _canonical_rows(primary_facts) != _canonical_rows(snapshot["facts"]):
        raise ValueError("legacy_object_snapshot facts differ from the unique main row: " + object_ref)
    if _canonical_rows(primary_fact_sources) != _canonical_rows(snapshot["fact_sources"]):
        raise ValueError("legacy_object_snapshot fact source chain differs from the unique main row: " + object_ref)
    for field in ("cards", "card_sources", "relations", "relationship_sources", "relationship_evidence", "source_objects"):
        if _canonical_rows(primary.get(field, [])) != _canonical_rows(snapshot[field]):
            raise ValueError("legacy_object_snapshot " + field + " differ from the unique main row: " + object_ref)


def classify_coverage_objects(objects, expected_refs, new_candidate_refs, conn):
    """Return one research-bearing main row per ref, validating explicit legacy wrappers.

    Ordinary coverage rows remain unchanged. A duplicate row is accepted only when it
    is a strictly shaped, empty-ref legacy snapshot wrapper for an existing baseline
    entity and its complete closure matches the unique main row and baseline database.
    """
    if not isinstance(objects, list):
        raise ValueError("coverage objects must be a list")
    new_refs = set(new_candidate_refs)
    expected = set(expected_refs)
    baseline_entity_ids = {row[0] for row in conn.execute("SELECT entity_id FROM entities")}
    grouped = defaultdict(lambda: {"main": [], "snapshots": []})
    for row in objects:
        if not isinstance(row, dict) or not isinstance(row.get("object_ref"), str) or not row["object_ref"]:
            raise ValueError("coverage row requires a nonempty object_ref")
        ref = row["object_ref"]
        if "legacy_object_snapshot" not in row:
            grouped[ref]["main"].append(row)
            continue
        if set(row) != LEGACY_SNAPSHOT_WRAPPER_KEYS:
            raise ValueError("legacy_object_snapshot wrapper contains non-preservation fields: " + ref)
        if ref in new_refs:
            raise ValueError("new candidate ref cannot carry legacy_object_snapshot: " + ref)
        if ref not in baseline_entity_ids:
            raise ValueError("legacy_object_snapshot ref is not an existing baseline entity: " + ref)
        if not isinstance(row.get("research_refs"), list) or row["research_refs"]:
            raise ValueError("legacy_object_snapshot wrapper research_refs must be empty: " + ref)
        snapshot = row["legacy_object_snapshot"]
        if not isinstance(snapshot, dict) or set(snapshot) != LEGACY_SNAPSHOT_KEYS:
            raise ValueError("legacy_object_snapshot must contain the exact legacy closure fields: " + ref)

        def has_forbidden(value):
            if isinstance(value, dict):
                return any(key in LEGACY_SNAPSHOT_FORBIDDEN_KEYS or has_forbidden(item)
                           for key, item in value.items())
            if isinstance(value, list):
                return any(has_forbidden(item) for item in value)
            return False

        if has_forbidden(snapshot):
            raise ValueError("legacy_object_snapshot cannot contain candidate facts or research/source refs: " + ref)
        if not isinstance(snapshot["entity"], dict) or snapshot["entity"].get("entity_id") != ref:
            raise ValueError("legacy_object_snapshot entity_id must equal object_ref: " + ref)
        if row.get("research_status") in (None, ""):
            raise ValueError("legacy_object_snapshot wrapper must preserve research_status: " + ref)
        grouped[ref]["snapshots"].append(row)

    if set(grouped) != expected:
        missing = sorted(expected - set(grouped))
        extra = sorted(set(grouped) - expected)
        raise ValueError(f"coverage refs do not match the unique candidate roster; missing={missing}; extra={extra}")
    for ref, rows in grouped.items():
        mains = rows["main"]
        snapshots = rows["snapshots"]
        if len(mains) != 1:
            raise ValueError(f"coverage ref requires exactly one main row: {ref} (found {len(mains)})")
        if len(snapshots) > 1:
            raise ValueError("coverage ref has duplicate legacy_object_snapshot rows: " + ref)
        if snapshots:
            main = mains[0]
            wrapper = snapshots[0]
            if wrapper.get("research_status") != main.get("research_status"):
                raise ValueError("legacy_object_snapshot research_status differs from main row: " + ref)
            snapshot = wrapper["legacy_object_snapshot"]
            _assert_primary_matches_legacy_snapshot(main, snapshot, ref)
            actual = legacy_object_snapshot_from_database(conn, ref)
            if not _legacy_snapshots_match(snapshot, actual):
                raise ValueError("legacy_object_snapshot closure differs from read-only baseline database: " + ref)
    return [row for row in objects if "legacy_object_snapshot" not in row]


def load_package(directory):
    gate = json.loads((directory / "REVIEW_GATE.json").read_text(encoding="utf-8"))
    packages = []
    for reviewed in gate["packages"]:
        path = directory / reviewed["file"]
        if reviewed["verdict"] != "PASS" or sha256(path) != reviewed["sha256"]:
            raise ValueError("unreviewed or changed candidate package: " + reviewed["file"])
        packages.append(json.loads(path.read_text(encoding="utf-8")))
    base = packages[0]
    for extra in packages[1:]:
        if extra["batch_id"] != base["batch_id"]:
            raise ValueError("supplement belongs to a different batch")
        for field in ("sources", "new_entities", "existing_facts", "extra_relationships"):
            base[field].extend(extra[field])
    return base, gate


def reviewed_research_note_classes(package, gate):
    """Require a field/source-grade review binding for newly prepared notes.

    B01-B04 are immutable historical replays. Their mappings are deliberately
    preserved byte-for-byte; every later batch must bind each research_note to
    the exact referenced A-grade sources in REVIEW_GATE.json.
    """
    notes = []
    for entity in package["new_entities"]:
        for index, item in enumerate(entity.get("facts", []), start=1):
            if item.get("field") == "research_note":
                # This is the same stable temporary ID used when facts are
                # emitted below; nested fact records do not carry candidate_id.
                notes.append((entity["candidate_id"] + f"-F{index:02d}", item))
    for item in package.get("existing_facts", []):
        if item.get("field") == "research_note":
            candidate_id = item.get("candidate_id")
            if not isinstance(candidate_id, str) or not candidate_id:
                raise ValueError("existing_facts research_note requires a stable candidate_id")
            notes.append((candidate_id, item))
    if not notes:
        return {}
    if package["batch_id"] in LEGACY_RESEARCH_NOTE_BATCHES:
        reviewed_packages = {item.get("file"): item.get("sha256") for item in gate.get("packages", [])}
        if reviewed_packages != LEGACY_RESEARCH_NOTE_PACKAGES_SHA256[package["batch_id"]]:
            raise ValueError("legacy research_note replay requires the exact frozen, reviewed package file/SHA set")
        return {candidate_id: "scholarly_paraphrase" for candidate_id, _ in notes}

    policy = gate.get("research_note_gate")
    expected_policy = {
        "field": "research_note",
        "source_grade_rule": RESEARCH_NOTE_CLASS_BY_GRADE,
        "material_class": "scholarly_paraphrase",
    }
    if not isinstance(policy, dict) or any(policy.get(key) != value for key, value in expected_policy.items()):
        raise ValueError("new research_note requires explicit field/source-grade policy in REVIEW_GATE.json")

    sources = {item["candidate_id"]: item for item in package["sources"]}
    entries = policy.get("entries")
    if not isinstance(entries, list):
        raise ValueError("research_note gate entries must enumerate every research_note")
    entry_by_id = {}
    for entry in entries:
        if not isinstance(entry, dict) or not isinstance(entry.get("candidate_id"), str):
            raise ValueError("invalid research_note gate entry")
        candidate_id = entry["candidate_id"]
        if candidate_id in entry_by_id:
            raise ValueError("duplicate research_note gate entry: " + candidate_id)
        entry_by_id[candidate_id] = entry

    notes_by_id = dict(notes)
    if len(notes_by_id) != len(notes):
        raise ValueError("research_note review keys must be unique")
    if set(entry_by_id) != set(notes_by_id):
        raise ValueError("research_note gate must enumerate the exact research_note candidate IDs")

    classes = {}
    for candidate_id, note in notes_by_id.items():
        entry = entry_by_id[candidate_id]
        refs = note.get("source_refs")
        entry_refs = entry.get("source_refs")
        if (not isinstance(refs, list) or not all(isinstance(ref, str) for ref in refs)
                or not isinstance(entry_refs, list) or not all(isinstance(ref, str) for ref in entry_refs)):
            raise ValueError("research_note gate source refs must be explicit lists: " + candidate_id)
        if sorted(entry_refs) != sorted(refs):
            raise ValueError("research_note gate source refs mismatch: " + candidate_id)
        expected_grades = {}
        for source_id in refs:
            source = sources.get(source_id)
            if source is None:
                raise ValueError("research_note references unregistered source: " + source_id)
            expected_grades[source_id] = source.get("source_level")
        if entry.get("source_grades") != expected_grades:
            raise ValueError("research_note gate source grades mismatch: " + candidate_id)
        if any(RESEARCH_NOTE_CLASS_BY_GRADE.get(grade) != "scholarly_paraphrase"
               for grade in expected_grades.values()):
            raise ValueError("research_note requires A-grade sources; B/C/unknown grade cannot be scholarly_paraphrase: "
                             + candidate_id)
        if entry.get("material_class") != "scholarly_paraphrase":
            raise ValueError("research_note gate material class mismatch: " + candidate_id)
        classes[candidate_id] = "scholarly_paraphrase"
    return classes


def prepare(repo, directory):
    package, gate = load_package(directory)
    if package["batch_id"] not in LEGACY_RESEARCH_NOTE_BATCHES and gate.get("verdict") != "PASS":
        raise ValueError("new batch REVIEW_GATE overall verdict must be PASS")
    generated_at = checkpoint_date(package, gate)
    database = repo / "data/master/V1_MASTER.sqlite"
    if sha256(database) != gate["baseline_database_sha256"]:
        raise ValueError("baseline database changed; rebase and review before allocating IDs")
    for field, filename in (("coverage_sha256", "COVERAGE.json"),
                            ("registration_sha256", "SOURCE_REGISTRATION.json")):
        expected = gate.get(field)
        if expected is None and package["batch_id"] in {"WCD-10-B01", "WCD-10-B02"}:
            continue  # Historical gates relied on separate frozen SQL/mapping review.
        if expected is None or sha256(directory / filename) != expected:
            raise ValueError("unreviewed or changed auxiliary package: " + filename)
    report = validate(repo, package, conflict_review=gate.get("conflict_review"))
    if report["errors"]:
        raise ValueError("candidate validation failed: " + repr(report["errors"]))
    research_note_classes = reviewed_research_note_classes(package, gate)
    registration = json.loads((directory / "SOURCE_REGISTRATION.json").read_text(encoding="utf-8"))
    coverage = json.loads((directory / "COVERAGE.json").read_text(encoding="utf-8"))
    profiles = {item["candidate_id"]: item for item in registration["profiles"]}
    if len(profiles) != len(registration["profiles"]):
        raise ValueError("duplicate source registration profile")
    statements = ["-- Prepared WCD-10 research-only migration; independent SQL review required.",
                  "-- Candidate review: " + gate["reviewer"],
                  "-- Registration sha256: " + sha256(directory / "SOURCE_REGISTRATION.json"),
                  "CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));"]
    inserts = defaultdict(list)
    mapping = {"task_id": package["task_id"], "batch_id": package["batch_id"],
               "candidate_review": gate, "registration_sha256": sha256(directory / "SOURCE_REGISTRATION.json"),
               "migration_status": "PREPARED_PENDING_INDEPENDENT_SQL_REVIEW", "id_map": {},
               "coverage_sha256": sha256(directory / "COVERAGE.json"),
               "coverage": coverage,
               "metadata_hash_boundary": "metadata.sha256 is the unchanged V1.0.0 historical snapshot table-hash set, not a current-table digest. Current integrity uses baseline database SHA, reviewed SQL SHA, migration log, replay and deterministic exports.",
               "sources": [], "facts": [], "cards": [], "relationships": [], "gaps": [],
               "public_boundary": package["public_boundary"]}

    def guard(condition):
        statements.append("INSERT INTO wcd10_guard VALUES (CASE WHEN " + condition + " THEN 1 ELSE 0 END);")

    with closing(sqlite3.connect(database.resolve().as_uri() + "?mode=ro", uri=True)) as conn:
        conn.row_factory = sqlite3.Row
        table_counts = {row[0]: conn.execute('SELECT COUNT(*) FROM "' + row[0] + '"').fetchone()[0]
                        for row in conn.execute("SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%'")}
        metadata = dict(conn.execute("SELECT key,value FROM metadata"))
        entities = {row["entity_id"]: dict(row) for row in conn.execute("SELECT * FROM entities")}
        existing_facts = [dict(row) for row in conn.execute("SELECT * FROM facts")]
        next_ids = {}

        def allocate(table, field, prefix):
            if table not in next_ids:
                values = [row[0] for row in conn.execute('SELECT "' + field + '" FROM "' + table + '"')]
                next_ids[table] = max((int(v.rsplit("-", 1)[1]) for v in values), default=0)
            next_ids[table] += 1
            return prefix + f"{next_ids[table]:04d}"

        def add(table, **record):
            inserts[table].append(record)

        for table, count in sorted(table_counts.items()):
            guard('(SELECT COUNT(*) FROM "' + table + '") = ' + str(count))
        for key in ("schema_version", "last_change_set", "research_version"):
            guard("(SELECT value FROM metadata WHERE key=" + literal(key) + ") = " + literal(metadata[key]))

        def author_field(author_id, field):
            value, card_ids = author_metadata(conn, existing_facts, author_id, field)
            if card_ids:
                provenance = {"author_id": author_id, "field": field, "value": value,
                              "existing_card_ids": card_ids, "boundary": "Legacy card metadata reused; no new author fact"}
                fallback = mapping.setdefault("author_metadata_fallbacks", [])
                if provenance not in fallback:
                    fallback.append(provenance)
            return value

        used_sources = set()
        for entity in package["new_entities"]:
            used_sources.update(entity["created_source_refs"])
            for item in entity["facts"]:
                used_sources.update(item["source_refs"])
        for item in package["existing_facts"] + package["extra_relationships"]:
            used_sources.update(item["source_refs"])
        source_by_id = {item["candidate_id"]: item for item in package["sources"]}
        # Coverage is part of the reviewed research record. Candidate source
        # references listed there must pass the same registration/reuse/grade
        # checks as sources attached directly to admitted facts or relations.
        # A historical snapshot wrapper is retained in mapping as preservation
        # evidence, but only its one validated main row can drive source use or
        # work-level gap creation.
        existing_authors = {}
        for row in conn.execute("SELECT subject_id,object_id FROM relationships WHERE relation_type='CREATED'"):
            if row["subject_id"] in package["author_ids"]:
                existing_authors.setdefault(row["object_id"], set()).add(row["subject_id"])
        expected_coverage_refs = {entity["candidate_id"] for entity in package["new_entities"]}
        expected_coverage_refs.update(existing_authors)
        coverage_primary_objects = classify_coverage_objects(
            coverage["objects"], expected_coverage_refs,
            {entity["candidate_id"] for entity in package["new_entities"]}, conn)
        coverage_source_refs = {ref for item in coverage_primary_objects
                                for ref in item.get("research_refs", [])}
        used_sources.update(ref for ref in coverage_source_refs if ref in source_by_id)
        evidence_titles = {cid: source["title"] for cid, source in source_by_id.items()}
        decisions = {cid: item for item in package.get("source_scope_decisions", []) for cid in item["candidate_ids"]}
        for cid in sorted(used_sources):
            if cid not in source_by_id:
                raise ValueError("source reference is not registered in candidate package: " + cid)
            if cid not in profiles:
                raise ValueError("source reference has no SOURCE_REGISTRATION profile: " + cid)
            source, profile = source_by_id[cid], profiles[cid]
            if profile.get("admission") == "deferred_only_not_registered":
                raise ValueError("deferred-only source used by admitted content: " + cid)
            if "publisher" not in profile or not isinstance(profile["publisher"], str):
                raise ValueError("invalid source registration publisher: " + cid)
            if any(not isinstance(profile.get(k), str) or not profile[k].strip()
                   for k in ("format", "language")):
                raise ValueError("incomplete source registration: " + cid)
            scope = decisions.get(cid) or {k: profile[k] for k in ("related_existing_source", "disposition", "notes") if k in profile}
            if scope.get("related_existing_source"):
                if conn.execute("SELECT 1 FROM sources WHERE source_id=?", (scope["related_existing_source"],)).fetchone() is None:
                    raise ValueError("related source is not in baseline")
            reused = reviewed_source_reuse(conn, source, profile, scope)
            if reused:
                # Evidence titles must match the unchanged formal source, not a candidate alias.
                evidence_titles[cid] = conn.execute("SELECT title FROM sources WHERE source_id=?", (reused,)).fetchone()[0]
                mapping["id_map"][cid] = reused
                mapping["sources"].append({"candidate_id": cid, "source_id": reused,
                                           "disposition": "reuse_without_modifying_source", "scope_decision": scope,
                                           "accessed_at": registration["accessed_at"], "verified_by": registration["verified_by"],
                                           "copyright_boundary": registration["copyright_boundary"], "locator": source["locator"],
                                           "usage": source["usage"], "notes": profile.get("notes", "")})
                continue
            sid = allocate("sources", "source_id", "SRC-")
            mapping["id_map"][cid] = sid
            guard("NOT EXISTS (SELECT 1 FROM sources WHERE source_id=" + literal(sid) + " OR canonical_url=" + literal(source["url"]) + ")")
            add("sources", source_id=sid, temporary_id=cid, title=source["title"], original_title=source["title"],
                author_or_editor=source["author_or_editor"], translator="", publisher=profile["publisher"],
                publication_year=profile["publication_year"], isbn=profile.get("isbn", ""), format=profile["format"],
                page_count=profile.get("page_count", ""), language=profile["language"], source_level=source["source_level"],
                processing_status="access_pass", source_task=package["batch_id"],
                public_content_scope=registration["public_content_scope"], local_asset_status=registration["local_asset_status"],
                persistent_id=profile.get("persistent_id", ""), canonical_url=source["url"])
            mapping["sources"].append({"candidate_id": cid, "source_id": sid, "scope_decision": scope,
                                       "accessed_at": registration["accessed_at"], "verified_by": registration["verified_by"],
                                       "copyright_boundary": registration["copyright_boundary"], "locator": source["locator"],
                                       "usage": source["usage"], "notes": profile.get("notes", source.get("bibliographic_notes", ""))})

        entities_by_subject = {}
        for entity in package["new_entities"]:
            cid = entity["candidate_id"]
            eid = allocate("entities", "entity_id", "V1-ENT-")
            mapping["id_map"][cid] = eid
            entities_by_subject[eid] = entity
            guard("NOT EXISTS (SELECT 1 FROM entities WHERE entity_id=" + literal(eid)
                  + " OR (entity_type=" + literal(entity["entity_type"]) + " AND original_name=" + literal(entity["original_name"]) + "))")
            add("entities", entity_id=eid, entity_type=entity["entity_type"], name_zh=entity["name_zh_candidate"],
                original_name=entity["original_name"], canonical_status="candidate", origin_count="1", origin_refs=cid,
                normalization_basis=entity["rationale"] + "; " + entity["name_policy"], issue_codes="PROVISIONAL-ZH-DISPLAY")
            add("entity_id_map", mapping_id=allocate("entity_id_map", "mapping_id", "V1-EMAP-"),
                preview_entity_ref=cid, origin_layer=package["batch_id"], origin_ref=cid, entity_id=eid,
                mapping_action="retain_as_formal_candidate", mapping_basis="Independent candidate review PASS; Research-only, no Curation admission")

        by_subject = defaultdict(list)
        for entity in package["new_entities"]:
            eid = mapping["id_map"][entity["candidate_id"]]
            for index, item in enumerate(entity["facts"], start=1):
                by_subject[eid].append(dict(item, candidate_id=entity["candidate_id"] + f"-F{index:02d}"))
        for item in package["existing_facts"]:
            by_subject[item["subject_id"]].append(item)
        for subject, items in by_subject.items():
            new = entities_by_subject.get(subject)
            entity = new or entities[subject]
            author_ids = {new["author_id"]} if new else existing_authors.get(subject, set())
            if len(author_ids) != 1:
                raise ValueError("ambiguous work author: " + subject)
            author_id = next(iter(author_ids))
            name = entity.get("name_zh_candidate") or entity["name_zh"]
            layer = entity["entity_type"]
            field_values = {item["field"]: item["value"] for item in items}
            year = field_values.get("first_publication_year", "")
            genre = field_values.get("genre_or_form", "")
            card_id = allocate("content_cards", "card_id", "V1-CARD-")
            card_sources = {cid for item in items for cid in item["source_refs"]}
            lines = ["### " + name + "｜" + entity["original_name"], "", "- 对象类型：" + layer,
                     "- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。"]
            for item in items:
                if item["field"] != "research_note":
                    lines.append("- " + item["field"] + "：" + item["value"])
            research_notes = [item for item in items if item["field"] == "research_note"]
            if research_notes:
                lines.extend(["", "#### 署名研究说明（research_note_only）", ""])
                lines.extend("- " + item["value"] for item in research_notes)
            lines.extend(["", "#### 未关闭的研究边界", "", "本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。"])
            add("content_cards", card_id=card_id, origin_card_id=package["batch_id"] + ":" + subject,
                subject_id=subject, card_type=layer, title_zh=name, author_label=entities[author_id]["name_zh"],
                original_title=entity["original_name"], country_or_region=author_field(author_id, "country_or_region"),
                language=author_field(author_id, "language"), period_bucket=year, genre_or_form=genre,
                input_layer=package["batch_id"], source_minimum_status="research_gap", issue_code="RESEARCH-ONLY-NOT-CURATED",
                content_markdown="\n".join(lines))
            mapping["cards"].append({"subject_id": subject, "card_id": card_id, "preserves_existing_cards": True})
            for item in items:
                fid = allocate("facts", "fact_id", "V1-FCT-")
                mapping["id_map"][item["candidate_id"]] = fid
                field = item["field"]
                material = research_note_classes[item["candidate_id"]] if field == "research_note" else (
                    "bibliographic" if field.endswith("_year") or field == "genre_or_form" else (
                        "bibliographic_note" if field == "bibliographic_note" else "institutional_paraphrase"))
                guard("NOT EXISTS (SELECT 1 FROM facts WHERE fact_id=" + literal(fid)
                      + " OR (subject_id=" + literal(subject) + " AND fact_field=" + literal(field)
                      + " AND value_text=" + literal(item["value"]) + "))")
                add("facts", fact_id=fid, origin_material_id=item["candidate_id"], card_id=card_id, subject_id=subject,
                    fact_field=field, value_text=item["value"], material_class=material, origin_id=package["batch_id"],
                    confidence="high", admission_status="research_note_only" if field == "research_note" else "batch_retained_candidate",
                    usage_note=item.get("boundary", "Research-only; independent candidate review PASS; no public admission"))
                add("card_facts", card_id=card_id, fact_id=fid,
                    admission_status="research_note_only" if field == "research_note" else "batch_retained_candidate")
                for cid in item["source_refs"]:
                    add("fact_sources", fact_id=fid, source_id=mapping["id_map"][cid], source_title=evidence_titles[cid])
                mapping["facts"].append({"candidate_id": item["candidate_id"], "fact_id": fid, "subject_id": subject, "field": field})
            for cid in sorted(card_sources):
                source = source_by_id[cid]
                has_research_note = any(item["field"] == "research_note" and cid in item["source_refs"] for item in items)
                source_fields = {item["field"] for item in items if cid in item["source_refs"]}
                bib_support = any(field.endswith("_year") or field in {"genre_or_form", "bibliographic_note"} for field in source_fields)
                scope = decisions.get(cid, {})
                independent_key = scope.get("related_existing_source") or profiles[cid].get("related_existing_source") or mapping["id_map"][cid]
                add("card_sources", card_source_id=allocate("card_sources", "card_source_id", "V1-CS-"),
                    origin_matrix_id=cid, card_id=card_id, source_id=mapping["id_map"][cid],
                    source_level=source["source_level"], source_role="attributed_study" if has_research_note else "bibliography_or_bounded_description",
                    bibliographic_support="yes" if bib_support else "no", research_support="yes" if has_research_note else "no",
                    independent_source_key=independent_key, usage_status="accepted", issue_code="SCOPE-OVERLAP-NOT-INDEPENDENT" if scope else "NONE")

        relations = [dict(candidate_id=entity["candidate_id"] + "-CREATED", subject_id=entity["author_id"],
                          relation_type="CREATED", object_id=entity["candidate_id"],
                          description_zh=entity.get("created_description_zh",
                                                     entities[entity["author_id"]]["name_zh"] + "创作 " + entity["original_name"]),
                          source_refs=entity["created_source_refs"]) for entity in package["new_entities"]]
        relations.extend(package["extra_relationships"])
        for item in relations:
            rid = allocate("relationships", "relationship_id", "V1-REL-")
            subject = mapping["id_map"].get(item["subject_id"], item["subject_id"])
            obj = mapping["id_map"].get(item["object_id"], item["object_id"])
            guard("NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id=" + literal(rid)
                  + " OR (subject_id=" + literal(subject) + " AND relation_type=" + literal(item["relation_type"])
                  + " AND object_id=" + literal(obj) + "))")
            add("relationships", relationship_id=rid, origin_layer=package["batch_id"], origin_relation_group_id=item["candidate_id"],
                subject_id=subject, relation_type=item["relation_type"], object_id=obj, description_zh=item["description_zh"],
                confidence="high", review_status="accepted", upstream_review_status=gate["reviewer"] + ":PASS",
                evidence_count=str(len(item["source_refs"])), issue_code="NONE")
            for cid in item["source_refs"]:
                sid = mapping["id_map"][cid]
                add("relationship_sources", relationship_id=rid, source_id=sid)
                add("relationship_evidence", evidence_id=allocate("relationship_evidence", "evidence_id", "V1-EV-"),
                    relationship_id=rid, origin_evidence_id=cid, source_id=sid, source_title=evidence_titles[cid],
                    locator=source_by_id[cid]["locator"], evidence_note=item["description_zh"], confidence="high",
                    evidence_status="eligible_evidence", evidence_origin=package["batch_id"])
            mapping["id_map"][item["candidate_id"]] = rid
            mapping["relationships"].append({"candidate_id": item["candidate_id"], "relationship_id": rid,
                                               "subject_id": subject, "relation_type": item["relation_type"], "object_id": obj})

        for index, deferred in enumerate(package["deferred"], start=1):
            gid = allocate("gaps", "gap_id", "V1-GAP-")
            add("gaps", gap_id=gid, origin_gap_id=package["batch_id"] + f"-G{index:02d}", gap_type="research_gap",
                gap_key=deferred["key"], current_status="open", evidence_basis=deferred["reason"], attempts_or_count="",
                owner_decision="Independent Reviewer: preserve " + deferred["disposition"],
                downstream_effect="No confirmed relation, edition or public admission generated.", issue_code="WCD10-DEFERRED")
            mapping["gaps"].append({"gap_id": gid, "key": deferred["key"]})

        existing_gap_keys = {row[0] for row in conn.execute("SELECT gap_key FROM gaps")}
        for item in coverage["objects"]:
            subject = mapping["id_map"].get(item["object_ref"], item["object_ref"])
            item["formal_subject_id"] = subject
        for item in coverage_primary_objects:
            subject = mapping["id_map"].get(item["object_ref"], item["object_ref"])
            for ref in item["research_refs"]:
                if ref not in mapping["id_map"] and conn.execute("SELECT 1 FROM sources WHERE source_id=?", (ref,)).fetchone() is None:
                    raise ValueError("coverage refers to an unknown source: " + ref)
            if item["research_status"] in {"catalog_only", "institutional_commentary"}:
                key = "WCD10:work_level_research:" + subject
                if key in existing_gap_keys:
                    raise ValueError("research gap requires reuse, not duplicate insertion: " + key)
                gid = allocate("gaps", "gap_id", "V1-GAP-")
                add("gaps", gap_id=gid, origin_gap_id=package["batch_id"] + ":" + item["object_ref"], gap_type="research_gap",
                    gap_key=key, current_status="open", evidence_basis=item["remaining"], attempts_or_count="not_claimed_exhaustive",
                    owner_decision="CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only",
                    downstream_effect="No inferred literary interpretation or public scope expansion.", issue_code="WCD10-WORK-RESEARCH-GAP")
                item["gap_id"] = gid
                mapping["gaps"].append({"gap_id": gid, "key": key})

    order = ("sources", "entities", "entity_id_map", "content_cards", "facts", "fact_sources", "card_facts", "card_sources",
             "relationships", "relationship_sources", "relationship_evidence", "gaps")
    for table in order:
        records = inserts[table]
        if not records:
            continue
        fields = list(records[0])
        statements.append("INSERT INTO " + table + " (" + ",".join(fields) + ") VALUES\n" + ",\n".join(
            "(" + ",".join(literal(record[field]) for field in fields) + ")" for record in records) + ";")
    # Deliberate development checkpoint, not a new formal version or release.
    for key, value in (("last_change_set", package["batch_id"]), ("generated_at", generated_at)):
        statements.append("UPDATE metadata SET value=" + literal(value) + " WHERE key=" + literal(key) + ";")
    for key, table in (("entity_count", "entities"), ("fact_count", "facts"), ("source_count", "sources"),
                       ("card_count", "content_cards"), ("eligible_relationship_count", "relationships")):
        statements.append("UPDATE metadata SET value=(SELECT COUNT(*) FROM " + table + ") WHERE key=" + literal(key) + ";")
    for table in order:
        guard('(SELECT COUNT(*) FROM "' + table + '") = ' + str(table_counts[table] + len(inserts[table])))
    statements.append("DROP TABLE wcd10_guard;")
    mapping["counts"] = {table: len(records) for table, records in inserts.items()}
    return "\n\n".join(statements) + "\n", mapping


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument("--batch", default="B01")
    parser.add_argument("--sql", type=Path, required=True)
    parser.add_argument("--mapping", type=Path, required=True)
    parser.add_argument("--replace-prepared", action="store_true", help="Regenerate only an unapplied, owned preparation artifact")
    args = parser.parse_args()
    directory = args.repo / "data/changesets/WCD-10" / args.batch
    sql, mapping = prepare(args.repo, directory)
    for path in (args.sql, args.mapping):
        if path.exists() and not args.replace_prepared:
            parser.error("refusing to overwrite generated artifact: " + str(path))
        path.parent.mkdir(parents=True, exist_ok=True)
    args.sql.write_text(sql, encoding="utf-8")
    args.mapping.write_text(json.dumps(mapping, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"status": "prepared_only", "counts": mapping["counts"], "sql_sha256": sha256(args.sql)}, ensure_ascii=False))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
