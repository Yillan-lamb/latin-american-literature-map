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
from qa_wcd10_b02_checkpoint import BASELINE_SHA256, SQL_SHA256, MIGRATION_NAME
from validate_master import validate_database


class B02MigrationTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(prefix="wcd10-b02-test-")
        self.addCleanup(self.tmp.cleanup)
        self.repo = Path(self.tmp.name)
        self.database = self.repo / "data/master/V1_MASTER.sqlite"
        self.database.parent.mkdir(parents=True)
        self.database.write_bytes(subprocess.check_output([
            "git", "show", "05f3372c69a54ec331d31b05d16c8288d6d3a993:data/master/V1_MASTER.sqlite"], cwd=ROOT))
        # Reconstruct B01 with its historical log, so tests do not depend on a
        # mutable current master or an ignored local backup.
        snapshot = json.loads((ROOT / "data/exports/wcd10-b01-checkpoint/data.json").read_text())
        record = next(r for r in snapshot["tables"]["migration_log"] if r["migration_id"] == "0036_wcd10_b01_author_works")
        log_sql = "INSERT INTO migration_log (" + ",".join(record) + ") VALUES (" + ",".join(literal(v) for v in record.values()) + ");"
        self.transaction((ROOT / "data/master/migrations/0036_wcd10_b01_author_works.sql").read_text() + "\n" + log_sql)
        self.assertEqual(self.digest(), BASELINE_SHA256)
        self.baseline = self.repo / "B01.sqlite"
        shutil.copy2(self.database, self.baseline)
        curation = self.repo / "data/v2/curation/PUBLIC_CONTENT.json"
        curation.parent.mkdir(parents=True)
        shutil.copy2(ROOT / "data/v2/curation/PUBLIC_CONTENT.json", curation)
        self.batch = self.repo / "data/changesets/WCD-10/B02"
        shutil.copytree(ROOT / "data/changesets/WCD-10/B02", self.batch)
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

    def test_prepare_exact_and_readonly(self):
        before = self.digest()
        sql, mapping = prepare(self.repo, self.batch)
        self.assertEqual(sql, self.sql)
        self.assertEqual(mapping, self.mapping)
        self.assertEqual(self.digest(), before)

    def test_all_existing_rows_preserved_and_master_valid(self):
        with closing(sqlite3.connect(self.database)) as conn:
            tables = [t for t in table_names(conn) if t != "metadata"]
            old = {t: set(conn.execute("SELECT * FROM " + t)) for t in tables}
        self.transaction(self.sql)
        self.assertEqual(validate_database(self.database)["verdict"], "pass")
        with closing(sqlite3.connect(self.database)) as conn:
            for table, rows in old.items():
                self.assertTrue(rows <= set(conn.execute("SELECT * FROM " + table)), table)
            self.assertEqual(conn.execute("SELECT COUNT(*) FROM entities").fetchone()[0], 397)
            self.assertEqual(conn.execute("SELECT COUNT(*) FROM facts").fetchone()[0], 1116)
            self.assertEqual(conn.execute("SELECT COUNT(*) FROM sources").fetchone()[0], 357)

    def test_existing_source_reused_not_duplicated(self):
        self.transaction(self.sql)
        with closing(sqlite3.connect(self.database)) as conn:
            self.assertEqual(conn.execute("SELECT COUNT(*) FROM sources WHERE canonical_url LIKE '%/obra/datos/2336%'").fetchone()[0], 1)
            fid = self.mapping["id_map"]["WCD10-B02-F01"]
            self.assertEqual(conn.execute("SELECT source_id FROM fact_sources WHERE fact_id=?", (fid,)).fetchone()[0], "SRC-0026")

    def test_ambiguous_dates_and_research_note_not_promoted(self):
        self.transaction(self.sql)
        with closing(sqlite3.connect(self.database)) as conn:
            self.assertEqual(conn.execute("SELECT value_text FROM facts WHERE subject_id='V1-ENT-0040' AND fact_field='composition_year'").fetchone()[0], "1958")
            self.assertEqual(conn.execute("SELECT COUNT(*) FROM facts WHERE subject_id='V1-ENT-0044' AND fact_field='first_publication_year'").fetchone()[0], 0)
            fid = self.mapping["id_map"]["WCD10-B02-F08"]
            self.assertEqual(conn.execute("SELECT admission_status FROM facts WHERE fact_id=?", (fid,)).fetchone()[0], "research_note_only")
            self.assertEqual(conn.execute("SELECT COUNT(*) FROM facts WHERE subject_id='V1-ENT-0076' AND fact_field='first_publication_year'").fetchone()[0], 0)

    def test_bad_source_foreign_key_rolls_back_everything(self):
        before = self.digest()
        broken = self.sql.replace("'SRC-0026'", "'SRC-9999'")
        self.assertNotEqual(broken, self.sql)
        with self.assertRaises(sqlite3.IntegrityError):
            self.transaction(broken)
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

    def test_b02_exact_oracle_rejects_same_count_wrong_value(self):
        self.transaction(self.sql + "\nINSERT INTO migration_log VALUES ('0037_wcd10_b02_author_works','TASK-107','wcd10_b01_review','test-timestamp','" + SQL_SHA256 + "','0.4');")
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
