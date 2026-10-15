"""A replay must fail on unhealthy databases or same-count data/schema drift."""
import sqlite3
import sys
import unittest
from pathlib import Path
from unittest.mock import Mock

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
from validate_migration_replay import assert_database_health, compare_databases


class MigrationReplayValidationTests(unittest.TestCase):
    def pair(self):
        pair = [sqlite3.connect(":memory:") for _ in range(2)]
        for conn in pair:
            self.addCleanup(conn.close)
            conn.executescript("CREATE TABLE parent(id TEXT PRIMARY KEY);"
                               "CREATE TABLE child(id TEXT REFERENCES parent(id));"
                               "INSERT INTO parent VALUES('valid'); INSERT INTO child VALUES('valid');")
        return pair

    def test_healthy_equal_tables_pass(self):
        self.assertEqual(compare_databases(*self.pair(), expected_tables=2), 2)

    def test_same_count_wrong_value_fails(self):
        master, replay = self.pair()
        replay.execute("UPDATE parent SET id='wrong'")
        replay.execute("UPDATE child SET id='wrong'")
        with self.assertRaisesRegex(ValueError, "table differs"):
            compare_databases(master, replay)

    def test_changed_column_definition_fails(self):
        master, replay = self.pair()
        replay.executescript("ALTER TABLE child RENAME TO old; CREATE TABLE child(id VARCHAR REFERENCES parent(id));"
                            "INSERT INTO child SELECT * FROM old; DROP TABLE old;")
        with self.assertRaisesRegex(ValueError, "schema differs"):
            compare_databases(master, replay)

    def test_equal_but_orphaned_rows_fail(self):
        pair = self.pair()
        for conn in pair:
            conn.execute("INSERT INTO child VALUES('orphan')")
        with self.assertRaisesRegex(ValueError, "foreign_key_check failed"):
            compare_databases(*pair)

    def test_integrity_error_after_first_ok_result_fails(self):
        connection = Mock()
        connection.execute.return_value.fetchall.return_value = [("ok",), ("corrupt page",)]
        with self.assertRaisesRegex(ValueError, "integrity_check failed"):
            assert_database_health(connection, "fixture")

    def test_expected_table_count_fails_closed(self):
        with self.assertRaisesRegex(ValueError, "expected 19 tables"):
            compare_databases(*self.pair(), expected_tables=19)

    def test_only_migration_execution_time_is_nondeterministic(self):
        pair = self.pair()
        for i, conn in enumerate(pair):
            conn.execute("CREATE TABLE migration_log(migration_id TEXT, applied_at TEXT, sql_sha256 TEXT)")
            conn.execute("INSERT INTO migration_log VALUES('one',?,'same hash')", (str(i),))
        self.assertEqual(compare_databases(*pair), 3)
        pair[1].execute("UPDATE migration_log SET sql_sha256='changed'")
        with self.assertRaisesRegex(ValueError, "migration_log"):
            compare_databases(*pair)
