from __future__ import annotations

import shutil
import sqlite3
import tempfile
import unittest
from pathlib import Path

from scripts.validate_master import validate_database


ROOT = Path(__file__).resolve().parents[1]
MASTER_DB = ROOT / "data" / "master" / "V1_MASTER.sqlite"


class CharacterRelationshipSchemaTest(unittest.TestCase):
    def validate_mutation(self, sql: str, expected_fragment: str) -> None:
        with tempfile.TemporaryDirectory(prefix="lalm-character-schema-") as temporary:
            database = Path(temporary) / "master.sqlite"
            shutil.copy2(MASTER_DB, database)
            with sqlite3.connect(database) as connection:
                connection.executescript(sql)
            report = validate_database(database, "0.4")
            self.assertEqual(report["verdict"], "fail")
            self.assertTrue(
                any(expected_fragment in error for error in report["errors"]),
                report["errors"],
            )

    def test_current_master_accepts_character_to_work(self) -> None:
        report = validate_database(MASTER_DB, "0.4")
        self.assertEqual(report["verdict"], "pass", report["errors"])

    def test_appears_in_rejects_non_character_subject(self) -> None:
        self.validate_mutation(
            "UPDATE relationships SET subject_id='V1-ENT-0002' "
            "WHERE relationship_id='V1-REL-0321'",
            "APPEARS_IN endpoint mismatch",
        )

    def test_appears_in_rejects_forbidden_object_types(self) -> None:
        forbidden = {
            "collection": "V1-ENT-0011",
            "place": "V1-ENT-0001",
            "character": "V1-ENT-0048",
            "adaptation": "V1-ENT-0021",
        }
        with sqlite3.connect(f"file:{MASTER_DB}?mode=ro", uri=True) as connection:
            actual = {
                entity_id: connection.execute(
                    "SELECT entity_type FROM entities WHERE entity_id=?", (entity_id,)
                ).fetchone()[0]
                for entity_id in forbidden.values()
            }
        self.assertEqual(set(actual.values()), set(forbidden))
        for entity_type, entity_id in forbidden.items():
            with self.subTest(entity_type=entity_type):
                self.validate_mutation(
                    "UPDATE relationships SET object_id='{}' "
                    "WHERE relationship_id='V1-REL-0321'".format(entity_id),
                    "APPEARS_IN endpoint mismatch",
                )

    def test_appears_in_rejects_edition_object(self) -> None:
        self.validate_mutation(
            "INSERT INTO entities (entity_id,entity_type,name_zh) "
            "VALUES ('V1-ENT-9999','edition','测试版次');"
            "UPDATE relationships SET object_id='V1-ENT-9999' "
            "WHERE relationship_id='V1-REL-0321';",
            "APPEARS_IN endpoint mismatch",
        )


if __name__ == "__main__":
    unittest.main()
