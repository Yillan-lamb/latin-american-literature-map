"""The runtime pin must reject source tampering and a host library fallback."""
import sys
import unittest
from pathlib import Path
from unittest.mock import MagicMock, patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
import prepare_wcd10_sqlite_runtime as RUNTIME


class Wcd10SqliteRuntimeTests(unittest.TestCase):
    def test_source_archive_tampering_is_rejected(self):
        with self.assertRaisesRegex(ValueError, "archive SHA-256 mismatch"):
            RUNTIME.verified_source(b"unexpected archive bytes")

    def test_host_sqlite_version_fallback_is_rejected(self):
        with patch.object(RUNTIME.sqlite3, "sqlite_version", "3.45.1"):
            with self.assertRaisesRegex(ValueError, "checkpoint runtime must be SQLite"):
                RUNTIME.verify_loaded_runtime()

    def test_secure_delete_default_drift_is_rejected(self):
        connection = MagicMock()
        connection.__enter__.return_value = connection
        connection.execute.return_value.fetchone.side_effect = [(RUNTIME.SOURCE_ID,), (1,)]
        with patch.object(RUNTIME.sqlite3, "sqlite_version", RUNTIME.VERSION), \
                patch.object(RUNTIME.sqlite3, "connect", return_value=connection):
            with self.assertRaisesRegex(ValueError, "secure_delete=0"):
                RUNTIME.verify_loaded_runtime()
