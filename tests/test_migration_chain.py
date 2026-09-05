from __future__ import annotations

import hashlib
import re
import sqlite3
import unittest
from contextlib import closing
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
MIGRATION_DIR = ROOT / "data" / "master" / "migrations"
MASTER_DB = ROOT / "data" / "master" / "V1_MASTER.sqlite"
TRANSACTION_CONTROL = re.compile(r"\b(?:BEGIN|COMMIT|ROLLBACK)\b", re.IGNORECASE)


class MigrationChainTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.migrations = sorted(MIGRATION_DIR.glob("[0-9][0-9][0-9][0-9]_*.sql"))

    def test_migration_numbers_are_contiguous(self) -> None:
        numbers = [int(path.name[:4]) for path in self.migrations]
        self.assertEqual(numbers, list(range(1, len(numbers) + 1)))

    def test_migrations_delegate_transaction_control_to_the_official_tool(self) -> None:
        offenders = [
            path.name
            for path in self.migrations
            if TRANSACTION_CONTROL.search(path.read_text(encoding="utf-8"))
        ]
        self.assertEqual(offenders, [])

    def test_master_log_covers_current_migrations_and_hashes(self) -> None:
        with closing(sqlite3.connect(f"file:{MASTER_DB}?mode=ro", uri=True)) as connection:
            logged = {
                migration_id: digest
                for migration_id, digest in connection.execute(
                    "SELECT migration_id, sql_sha256 FROM migration_log"
                )
            }

        expected_ids = {path.stem for path in self.migrations}
        self.assertEqual(set(logged), expected_ids)
        for path in self.migrations:
            digest = hashlib.sha256(path.read_bytes()).hexdigest()
            self.assertEqual(logged[path.stem], digest, path.name)


if __name__ == "__main__":
    unittest.main()
