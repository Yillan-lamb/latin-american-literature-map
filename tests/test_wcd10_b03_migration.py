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
from qa_wcd10_b03_checkpoint import BASELINE_SHA256, SQL_SHA256, MIGRATION_NAME
from validate_master import validate_database


class B03MigrationTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(prefix="wcd10-b03-test-")
        self.addCleanup(self.tmp.cleanup)
        self.repo = Path(self.tmp.name)
        self.database = self.repo / "data/master/V1_MASTER.sqlite"
        self.database.parent.mkdir(parents=True)
        self.database.write_bytes(subprocess.check_output([
            "git", "show", "05f3372c69a54ec331d31b05d16c8288d6d3a993:data/master/V1_MASTER.sqlite"], cwd=ROOT))
        for batch, migration in (("b01", "0036_wcd10_b01_author_works"), ("b02", "0037_wcd10_b02_author_works")):
            snapshot = json.loads((ROOT / f"data/exports/wcd10-{batch}-checkpoint/data.json").read_text())
            record = next(r for r in snapshot["tables"]["migration_log"] if r["migration_id"] == migration)
            log_sql = "INSERT INTO migration_log (" + ",".join(record) + ") VALUES (" + ",".join(literal(v) for v in record.values()) + ");"
            self.transaction((ROOT / "data/master/migrations" / (migration + ".sql")).read_text() + "\n" + log_sql)
        self.assertEqual(self.digest(), BASELINE_SHA256)
        self.baseline = self.repo / "B02.sqlite"
        shutil.copy2(self.database, self.baseline)
        curation = self.repo / "data/v2/curation/PUBLIC_CONTENT.json"
        curation.parent.mkdir(parents=True)
        shutil.copy2(ROOT / "data/v2/curation/PUBLIC_CONTENT.json", curation)
        self.batch = self.repo / "data/changesets/WCD-10/B03"
        shutil.copytree(ROOT / "data/changesets/WCD-10/B03", self.batch)
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
                         [("V1-ENT-0073", "country_or_region", ["V1-CARD-0025"]), ("V1-ENT-0114", "language", ["V1-CARD-0033"])])

    def test_all_old_rows_preserved_and_master_valid(self):
        with closing(sqlite3.connect(self.database)) as conn:
            old = {t: set(conn.execute("SELECT * FROM " + t)) for t in table_names(conn) if t != "metadata"}
        self.transaction(self.sql)
        self.assertEqual(validate_database(self.database)["verdict"], "pass")
        with closing(sqlite3.connect(self.database)) as conn:
            for table, rows in old.items():
                self.assertTrue(rows <= set(conn.execute("SELECT * FROM " + table)), table)
            for table, count in (("entities", 409), ("facts", 1170), ("relationships", 376), ("sources", 378), ("content_cards", 315), ("gaps", 98)):
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

    def test_article_reused_notes_not_promoted_and_story_first_dates_not_inferred(self):
        self.transaction(self.sql)
        with closing(sqlite3.connect(self.database)) as conn:
            self.assertEqual(conn.execute("SELECT COUNT(*) FROM sources WHERE canonical_url LIKE '%/article/view/7247%'").fetchone()[0], 1)
            for ref in ("F04", "F08"):
                fid = self.mapping["id_map"]["WCD10-B03-" + ref]
                self.assertEqual(conn.execute("SELECT admission_status FROM facts WHERE fact_id=?", (fid,)).fetchone()[0], "research_note_only")
                self.assertEqual(conn.execute("SELECT source_id FROM fact_sources WHERE fact_id=?", (fid,)).fetchone()[0], "SRC-0039")
            for eid in ("V1-ENT-0084", "V1-ENT-0085"):
                self.assertEqual(conn.execute("SELECT COUNT(*) FROM facts WHERE subject_id=? AND fact_field='first_publication_year'", (eid,)).fetchone()[0], 0)
            self.assertEqual(conn.execute("SELECT value_text FROM facts WHERE subject_id='V1-ENT-0160' AND fact_field='first_publication_year'").fetchone()[0], "1966")

    def test_bad_fk_rolls_back(self):
        before = self.digest()
        with self.assertRaises(sqlite3.IntegrityError):
            self.transaction(self.sql.replace("'SRC-0039'", "'SRC-9999'"))
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
        self.transaction(self.sql + "\nINSERT INTO migration_log VALUES ('0038_wcd10_b03_author_works','TASK-108','wcd10_b01_review','test-timestamp','" + SQL_SHA256 + "','0.4');")
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
