import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
from build_wcd10_migration import checkpoint_date


class CheckpointDateTests(unittest.TestCase):
    def test_frozen_historical_batches_keep_exact_date(self):
        for batch in ("WCD-10-B01", "WCD-10-B02"):
            self.assertEqual(checkpoint_date({"batch_id": batch}, {}), "2026-09-28")

    def test_new_batch_requires_reviewed_date(self):
        with self.assertRaisesRegex(ValueError, "explicit reviewed"):
            checkpoint_date({"batch_id": "WCD-10-B03"}, {})

    def test_new_batch_uses_explicit_date_not_clock(self):
        self.assertEqual(checkpoint_date({"batch_id": "WCD-10-B03"}, {"checkpoint_date": "2026-09-29"}), "2026-09-29")

    def test_bad_or_nonexistent_dates_rejected(self):
        for value in ("2026-9-29", "2026-02-30", "now", None, 20260929):
            with self.assertRaises(ValueError):
                checkpoint_date({"batch_id": "WCD-10-B03"}, {"checkpoint_date": value})


if __name__ == "__main__":
    unittest.main()
