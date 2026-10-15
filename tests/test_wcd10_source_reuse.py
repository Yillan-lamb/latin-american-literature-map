from __future__ import annotations

import sqlite3
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from build_wcd10_migration import reviewed_source_reuse


class SourceReuseTests(unittest.TestCase):
    def setUp(self):
        self.conn = sqlite3.connect(":memory:")
        self.addCleanup(self.conn.close)
        self.conn.row_factory = sqlite3.Row
        self.conn.execute("CREATE TABLE sources(source_id TEXT,canonical_url TEXT,source_level TEXT)")
        self.conn.execute("INSERT INTO sources VALUES ('SRC-0026','http://www.elem.mx/obra/datos/2336','B')")
        self.source = {"url": "https://elem.mx/obra/datos/2336/", "source_level": "B"}

    def test_http_https_www_and_slash_reuse_preserves_existing_row(self):
        before = list(self.conn.execute("SELECT * FROM sources"))
        result = reviewed_source_reuse(self.conn, self.source, {}, {"disposition": "reuse", "related_existing_source": "SRC-0026"})
        self.assertEqual(result, "SRC-0026")
        self.assertEqual(list(self.conn.execute("SELECT * FROM sources")), before)

    def test_existing_url_without_reviewed_policy_rejected(self):
        with self.assertRaisesRegex(ValueError, "explicit reviewed reuse"):
            reviewed_source_reuse(self.conn, self.source, {}, {})

    def test_wrong_reuse_target_rejected(self):
        self.source["reuse_existing_source"] = "SRC-9999"
        with self.assertRaisesRegex(ValueError, "explicit reviewed reuse"):
            reviewed_source_reuse(self.conn, self.source, {}, {})

    def test_duplicate_canonical_matches_fail_closed(self):
        self.conn.execute("INSERT INTO sources VALUES ('SRC-9999','https://elem.mx/obra/datos/2336/','B')")
        self.source["reuse_existing_source"] = "SRC-0026"
        with self.assertRaisesRegex(ValueError, "ambiguous"):
            reviewed_source_reuse(self.conn, self.source, {}, {})

    def test_grade_change_cannot_be_hidden_in_reuse(self):
        self.source.update(reuse_existing_source="SRC-0026", source_level="A")
        with self.assertRaisesRegex(ValueError, "source grade"):
            reviewed_source_reuse(self.conn, self.source, {}, {})

    def test_new_url_with_missing_reuse_target_rejected(self):
        self.source.update(url="https://elem.mx/obra/datos/450", reuse_existing_source="SRC-0026")
        with self.assertRaisesRegex(ValueError, "does not match"):
            reviewed_source_reuse(self.conn, self.source, {}, {})

    def test_new_source_returns_none_without_writing(self):
        self.source["url"] = "https://elem.mx/obra/datos/450"
        self.assertIsNone(reviewed_source_reuse(self.conn, self.source, {}, {}))
        self.assertEqual(self.conn.execute("SELECT COUNT(*) FROM sources").fetchone()[0], 1)
