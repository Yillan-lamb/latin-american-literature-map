import sqlite3
import sys
import unittest
from contextlib import closing
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
from build_wcd10_migration import author_metadata


class AuthorMetadataTests(unittest.TestCase):
    def connection(self, rows):
        conn = sqlite3.connect(":memory:")
        conn.execute("CREATE TABLE content_cards(card_id,subject_id,card_type,country_or_region,language)")
        conn.executemany("INSERT INTO content_cards VALUES (?,?,?,?,?)", rows)
        return conn

    def test_existing_unique_fact_has_no_fallback(self):
        with closing(self.connection([])) as conn:
            facts = [{"subject_id": "A", "fact_field": "language", "value_text": "es"}]
            self.assertEqual(author_metadata(conn, facts, "A", "language"), ("es", []))

    def test_missing_fact_reuses_explicit_author_card_with_provenance(self):
        with closing(self.connection([("C", "A", "author", "阿根廷", "es")])) as conn:
            self.assertEqual(author_metadata(conn, [], "A", "country_or_region"), ("阿根廷", ["C"]))

    def test_conflicting_facts_do_not_use_card(self):
        with closing(self.connection([("C", "A", "author", "阿根廷", "es")])) as conn:
            facts = [{"subject_id": "A", "fact_field": "language", "value_text": v} for v in ("es", "fr")]
            with self.assertRaises(ValueError):
                author_metadata(conn, facts, "A", "language")

    def test_conflicting_or_empty_author_cards_rejected(self):
        for values in (("es", "fr"), ("",), ()):
            with closing(self.connection([(str(i), "A", "author", "阿根廷", v) for i, v in enumerate(values)])) as conn:
                with self.assertRaises(ValueError):
                    author_metadata(conn, [], "A", "language")

    def test_non_author_or_other_author_cannot_supply_fallback(self):
        with closing(self.connection([("C", "A", "work", "阿根廷", "es"), ("D", "B", "author", "阿根廷", "es")])) as conn:
            with self.assertRaises(ValueError):
                author_metadata(conn, [], "A", "language")

    def test_unsupported_field_rejected(self):
        with closing(self.connection([])) as conn:
            with self.assertRaises(ValueError):
                author_metadata(conn, [], "A", "birth_year")
