"""Guarded correction: reproduce the15 layer conflicts and reject stale input."""
from pathlib import Path
import json
import sqlite3
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
SQL = (ROOT / 'data/master/migrations/0058_wcd10_collection_type_correction.sql').read_text()
CANDIDATE = json.loads((ROOT / 'data/changesets/WCD-10/TYPE_CORRECTION/CANDIDATES.json').read_text())


class CollectionTypeCorrectionTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.db = sqlite3.connect(Path(self.tmp.name) / 'baseline.sqlite')
        self.addCleanup(self.db.close)
        # Reconstruct all19 pre-correction tables from the immutable0057 export,
        # never from a mutable or ignored local baseline database.
        source = json.loads((ROOT / 'data/exports/wcd10-final-reentry/data.json').read_text())
        for table, columns in source['columns'].items():
            self.db.execute('CREATE TABLE "' + table + '" (' + ','.join('"' + c + '" TEXT' for c in columns) + ')')
            self.db.executemany('INSERT INTO "' + table + '" VALUES (' + ','.join('?' for _ in columns) + ')',
                                [[r[c] for c in columns] for r in source['tables'][table]])
        self.db.commit()

    def state(self):
        return {t: self.db.execute('SELECT * FROM "' + t + '"').fetchall() for t, in self.db.execute("SELECT name FROM sqlite_master WHERE type='table'")}

    def apply(self):
        try:
            self.db.executescript('BEGIN;\n' + SQL + '\nCOMMIT;')
        except sqlite3.IntegrityError:
            self.db.rollback()
            raise

    def test_corrects_containers_and_cards_preserves_texts_sources_and_roles(self):
        before = self.state()
        self.apply()
        after = self.state()
        for table in set(before) - {'entities', 'content_cards', 'metadata'}:
            self.assertEqual(before[table], after[table], table)
        for row in CANDIDATE['rows']:
            eid = row['entity_before']['entity_id']
            self.assertEqual(self.db.execute('SELECT entity_type FROM entities WHERE entity_id=?', (eid,)).fetchone()[0], 'collection')
            for card in row['cards_after']:
                actual = self.db.execute('SELECT card_type,content_markdown FROM content_cards WHERE card_id=?', (card['card_id'],)).fetchone()
                self.assertEqual(actual, ('collection', card['content_markdown']))

    def test_drift_near_end_rolls_back_earlier_corrections(self):
        self.db.execute("UPDATE content_cards SET content_markdown='unexpected edit' WHERE card_id='V1-CARD-0516'")
        self.db.commit()
        before = self.state()
        with self.assertRaises(sqlite3.IntegrityError):
            self.apply()
        self.assertEqual(before, self.state())

    def test_second_apply_rejected_without_further_changes(self):
        self.apply()
        before = self.state()
        with self.assertRaises(sqlite3.IntegrityError):
            self.apply()
        self.assertEqual(before, self.state())


if __name__ == '__main__':
    unittest.main()
