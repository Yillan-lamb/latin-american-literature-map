from __future__ import annotations

import csv
import sqlite3
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
REBASE = ROOT / "data/changesets/WCD-07/WCD07_CURRENT_MAIN_REBASE.csv"
PACKAGES = {
    "P0": ROOT / "data/changesets/WCD-07/07A_P0/WORK_CANDIDATES.csv",
    "P1": ROOT / "data/changesets/WCD-07/07B_P1_FIRST_WAVE/WORK_CANDIDATES.csv",
}


class WCD07RebaseTests(unittest.TestCase):
    def test_author_names_match_current_master(self) -> None:
        with REBASE.open(encoding="utf-8-sig", newline="") as handle:
            rebase = list(csv.DictReader(handle))

        db_uri = (ROOT / "data/master/V1_MASTER.sqlite").resolve().as_uri() + "?mode=ro"
        connection = sqlite3.connect(db_uri, uri=True)
        try:
            entities = {
                entity_id: name_zh
                for entity_id, name_zh in connection.execute(
                    "SELECT entity_id, name_zh FROM entities"
                )
            }
        finally:
            connection.close()

        self.assertTrue(entities)
        for row in rebase:
            candidate_id = row["candidate_id"]
            author_id = row["author_id"]
            self.assertIn(author_id, entities, candidate_id)
            self.assertEqual(row["author_name"], entities[author_id], candidate_id)

    def test_rebase_candidate_ids_are_complete_unique_and_joinable(self) -> None:
        with REBASE.open(encoding="utf-8-sig", newline="") as handle:
            rebase = list(csv.DictReader(handle))

        self.assertEqual(len(rebase), 23)
        candidate_ids = [row["candidate_id"] for row in rebase]
        self.assertTrue(all(candidate_ids))
        self.assertEqual(len(candidate_ids), len(set(candidate_ids)))

        for tier, package_path in PACKAGES.items():
            with package_path.open(encoding="utf-8-sig", newline="") as handle:
                package = {row["candidate_id"]: row for row in csv.DictReader(handle)}
            tier_rows = [row for row in rebase if row["tier"] == tier]
            self.assertEqual({row["candidate_id"] for row in tier_rows}, set(package))
            for row in tier_rows:
                candidate = package[row["candidate_id"]]
                self.assertEqual(row["author_id"], candidate["author_id"])
                self.assertEqual(row["original_title"], candidate["original_title"])
                self.assertEqual(row["recommended_name_zh"], candidate["name_zh_candidate"])
                self.assertEqual(row["recommended_entity_type"], candidate["recommended_entity_type"])
                self.assertEqual(row["publication_year"], candidate["first_publication_year"])

        self.assertEqual(
            {row["candidate_id"] for row in rebase if row["tier"] == "P0"},
            {f"WCD07A-W{index:02d}" for index in range(1, 7)},
        )
        self.assertEqual(
            {row["candidate_id"] for row in rebase if row["tier"] == "P1"},
            {f"WCD07B-W{index:02d}" for index in range(1, 18)},
        )


if __name__ == "__main__":
    unittest.main()
