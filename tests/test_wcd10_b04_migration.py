from __future__ import annotations

import copy
import hashlib
import json
import shutil
import sqlite3
import subprocess
import sys
import tempfile
import unittest
from contextlib import closing
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from build_wcd10_migration import literal, prepare
from export_from_sqlite import table_names, table_rows
from qa_wcd10_checkpoint import verify_reviewed_delta
from qa_wcd10_b04_checkpoint import BASELINE_SHA256, SQL_SHA256, MIGRATION_NAME
from validate_master import validate_database


class B04MigrationTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(prefix="wcd10-b04-test-")
        self.addCleanup(self.tmp.cleanup)
        self.repo = Path(self.tmp.name)
        self.database = self.repo / "data/master/V1_MASTER.sqlite"
        self.database.parent.mkdir(parents=True)
        self.database.write_bytes(subprocess.check_output([
            "git", "show", "05f3372c69a54ec331d31b05d16c8288d6d3a993:data/master/V1_MASTER.sqlite"], cwd=ROOT))
        for batch, migration in (("b01", "0036_wcd10_b01_author_works"), ("b02", "0037_wcd10_b02_author_works"), ("b03", "0038_wcd10_b03_author_works")):
            snapshot = json.loads((ROOT / f"data/exports/wcd10-{batch}-checkpoint/data.json").read_text())
            record = next(r for r in snapshot["tables"]["migration_log"] if r["migration_id"] == migration)
            log_sql = "INSERT INTO migration_log (" + ",".join(record) + ") VALUES (" + ",".join(literal(v) for v in record.values()) + ");"
            self.transaction((ROOT / "data/master/migrations" / (migration + ".sql")).read_text() + "\n" + log_sql)
        self.assertEqual(self.digest(), BASELINE_SHA256)
        self.baseline = self.repo / "B03.sqlite"
        shutil.copy2(self.database, self.baseline)
        curation = self.repo / "data/v2/curation/PUBLIC_CONTENT.json"
        curation.parent.mkdir(parents=True)
        shutil.copy2(ROOT / "data/v2/curation/PUBLIC_CONTENT.json", curation)
        self.batch = self.repo / "data/changesets/WCD-10/B04"
        shutil.copytree(ROOT / "data/changesets/WCD-10/B04", self.batch)
        self.sql = (ROOT / "data/master/migrations" / MIGRATION_NAME).read_text()
        self.mapping = json.loads((self.batch / "INTEGRATION_MAP.json").read_text())

    def digest(self):
        return hashlib.sha256(self.database.read_bytes()).hexdigest()

    def transaction(self, sql):
        with closing(sqlite3.connect(self.database)) as conn:
            conn.execute("PRAGMA foreign_keys=ON")
            try:
                conn.executescript("BEGIN;\n" + sql + "\nCOMMIT;")
            except Exception:
                conn.rollback()
                raise

    def test_prepare_exact_readonly_and_legacy_metadata_provenance(self):
        before = self.digest()
        sql, mapping = prepare(self.repo, self.batch)
        self.assertEqual(sql, self.sql)
        self.assertEqual(mapping, self.mapping)
        self.assertEqual(self.digest(), before)
        self.assertEqual([(r["author_id"], r["field"], r["existing_card_ids"]) for r in mapping["author_metadata_fallbacks"]],
                         [("V1-ENT-0115", "language", ["V1-CARD-0037"]), ("V1-ENT-0145", "language", ["V1-CARD-0041"])])

    def test_all_old_rows_preserved_and_master_valid(self):
        with closing(sqlite3.connect(self.database)) as conn:
            old = {t: set(conn.execute("SELECT * FROM " + t)) for t in table_names(conn) if t != "metadata"}
        self.transaction(self.sql)
        validation = validate_database(self.database)
        self.assertEqual(validation["verdict"], "pass", validation)
        with closing(sqlite3.connect(self.database)) as conn:
            for table, rows in old.items():
                self.assertTrue(rows <= set(conn.execute("SELECT * FROM " + table)), table)
            for table, count in (("entities", 418), ("facts", 1209), ("relationships", 386), ("sources", 392), ("content_cards", 328), ("gaps", 122)):
                self.assertEqual(conn.execute("SELECT COUNT(*) FROM " + table).fetchone()[0], count)
            self.assertEqual(conn.execute("SELECT value FROM metadata WHERE key='generated_at'").fetchone()[0], "2026-09-29")

    def test_changed_auxiliary_packages_rejected_readonly(self):
        before = self.digest()
        for filename in ("COVERAGE.json", "SOURCE_REGISTRATION.json"):
            path = self.batch / filename
            original = path.read_bytes()
            path.write_bytes(original + b" ")
            with self.assertRaisesRegex(ValueError, "changed auxiliary package"):
                prepare(self.repo, self.batch)
            self.assertEqual(self.digest(), before)
            path.write_bytes(original)

    def test_new_gate_requires_auxiliary_hash_bindings(self):
        path = self.batch / "REVIEW_GATE.json"
        original = path.read_bytes()
        gate = json.loads(original)
        for field in ("coverage_sha256", "registration_sha256"):
            changed = dict(gate)
            del changed[field]
            path.write_text(json.dumps(changed))
            with self.assertRaisesRegex(ValueError, "changed auxiliary package"):
                prepare(self.repo, self.batch)
        path.write_bytes(original)

    def test_changed_legacy_candidate_cannot_reuse_frozen_research_note_exception(self):
        candidate = self.batch / "CANDIDATES.json"
        candidate.write_bytes(candidate.read_bytes() + b" ")
        gate_path = self.batch / "REVIEW_GATE.json"
        gate = json.loads(gate_path.read_text(encoding="utf-8"))
        gate["packages"][0]["sha256"] = hashlib.sha256(candidate.read_bytes()).hexdigest()
        gate_path.write_text(json.dumps(gate), encoding="utf-8")
        with self.assertRaisesRegex(ValueError, "exact frozen, reviewed package file/SHA set"):
            prepare(self.repo, self.batch)

    def test_source_reuse_research_note_and_book_date_boundaries(self):
        self.transaction(self.sql)
        with closing(sqlite3.connect(self.database)) as conn:
            self.assertEqual(conn.execute("SELECT COUNT(*) FROM sources WHERE canonical_url='https://cvc.cervantes.es/literatura/escritores/neruda/bibliografia/default.htm'").fetchone()[0], 1)
            fid = self.mapping["id_map"]["WCD10-B04-F07"]
            self.assertEqual(conn.execute("SELECT fact_field, admission_status FROM facts WHERE fact_id=?", (fid,)).fetchone(), ("research_note", "research_note_only"))
            self.assertEqual(conn.execute("SELECT COUNT(*) FROM facts WHERE subject_id='V1-ENT-0122' AND fact_field='first_publication_year'").fetchone()[0], 0)
            self.assertEqual(conn.execute("SELECT value_text FROM facts WHERE subject_id='V1-ENT-0122' AND fact_field='first_book_edition_year'").fetchone()[0], "1947")
            self.assertEqual(conn.execute("SELECT admission_status FROM facts WHERE fact_id=?", (self.mapping["id_map"]["WCD10-B04-F11"],)).fetchone()[0], "batch_retained_candidate")

    def test_bad_fk_rolls_back(self):
        before = self.digest()
        with self.assertRaises(sqlite3.IntegrityError):
            self.transaction(self.sql.replace("'SRC-0070'", "'SRC-9999'"))
        self.assertEqual(self.digest(), before)

    def test_duplicate_execution_rejected(self):
        self.transaction(self.sql)
        before = self.digest()
        with self.assertRaises(sqlite3.IntegrityError):
            self.transaction(self.sql)
        self.assertEqual(self.digest(), before)

    def test_baseline_drift_rejected(self):
        with closing(sqlite3.connect(self.database)) as conn:
            conn.execute("UPDATE metadata SET value='wrong' WHERE key='last_change_set'")
            conn.commit()
        before = self.digest()
        with self.assertRaises(sqlite3.IntegrityError):
            self.transaction(self.sql)
        self.assertEqual(self.digest(), before)

    def test_exact_oracle_rejects_same_count_wrong_value(self):
        self.transaction(self.sql + "\nINSERT INTO migration_log VALUES ('0039_wcd10_b04_author_works','TASK-109','wcd10_b01_review','test-timestamp','" + SQL_SHA256 + "','0.4');")
        with closing(sqlite3.connect(self.database)) as conn:
            conn.row_factory = sqlite3.Row
            tables = {table: table_rows(conn, table) for table in table_names(conn)}
        verify_reviewed_delta(ROOT, tables, self.mapping, baseline_path=self.baseline,
                              migration_name=MIGRATION_NAME, reviewed_sha256=SQL_SHA256)
        bad = copy.deepcopy(tables)
        bad["facts"][1][-1]["value_text"] = "wrong same-count value"
        with self.assertRaisesRegex(ValueError, "exact replay mismatch: facts"):
            verify_reviewed_delta(ROOT, bad, self.mapping, baseline_path=self.baseline,
                                  migration_name=MIGRATION_NAME, reviewed_sha256=SQL_SHA256)
