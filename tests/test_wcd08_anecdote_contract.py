import importlib.util
import json
import tempfile
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location("build_v2_web_data", ROOT / "scripts" / "build_v2_web_data.py")
MODULE = importlib.util.module_from_spec(SPEC)
assert SPEC.loader is not None
SPEC.loader.exec_module(MODULE)


def record(
    *,
    status="auto_approved",
    author_id="AUTH-1",
    reviewer="USER",
    reviewed_at="2026-09-05T00:00:00+08:00",
    fact_boundary=None,
):
    return {
        "anecdote_id": "A-001",
        "author_id": author_id,
        "status": status,
        "reviewer": reviewer,
        "reviewed_at": reviewed_at,
        "display_scope": "detail",
        "risk_level": "LOW",
        "fact_status": "confirmed",
        "fact_boundary": fact_boundary if fact_boundary is not None else [{"kind": "confirmed_fact", "note": "checked"}],
        "source_refs": ["SRC-001"],
        "title": "A title",
        "teaser": "A concise teaser",
        "story": "A complete story",
        "time_label": "1930",
        "location_label": "Buenos Aires",
        "type_label": "人物故事",
        "sources_label": "Source",
        "sort_order": 1,
    }


class Wcd08AnecdoteContractTests(unittest.TestCase):
    def write_doc(self, directory, rows):
        (directory / "CURATION_ANECDOTES.json").write_text(
            json.dumps({"schema_version": MODULE.ANECDOTE_SCHEMA_VERSION, "anecdotes": rows}),
            encoding="utf-8",
        )

    def load(self, directory):
        return MODULE.load_approved_anecdotes(
            directory,
            {"AUTH-1", "PLACE-1"},
            {"AUTH-1"},
        )

    def test_approved_projects_and_unapproved_does_not(self):
        with tempfile.TemporaryDirectory() as raw:
            directory = Path(raw)
            approved = record()
            unapproved = record(status="user_review", reviewer="UNREVIEWED", reviewed_at=None)
            unapproved["anecdote_id"] = "A-002"
            held = record(status="hold", reviewer="UNREVIEWED", reviewed_at=None)
            held["anecdote_id"] = "A-003"
            rejected = record(status="reject")
            rejected["anecdote_id"] = "A-004"
            self.write_doc(directory, [approved, unapproved, held, rejected])
            items = self.load(directory)
            self.assertEqual([item["anecdote_id"] for item in items], ["A-001"])
            reader = {"authors": [{"target_id": "AUTH-1"}]}
            MODULE.attach_anecdotes(reader, items, {"AUTH-1"})
            self.assertEqual(reader["authors"][0]["anecdotes"][0]["anecdote_id"], "A-001")

    def test_absent_formal_file_is_zero_projection(self):
        with tempfile.TemporaryDirectory() as raw:
            self.assertEqual(self.load(Path(raw)), [])
            reader = {"authors": [{"target_id": "AUTH-1"}]}
            MODULE.attach_anecdotes(reader, [], {"AUTH-1"})
            self.assertNotIn("anecdotes", reader["authors"][0])

    def test_auto_approved_requires_user_reviewer_and_timestamp(self):
        with tempfile.TemporaryDirectory() as raw:
            directory = Path(raw)
            bad = record(reviewer="CODEX")
            self.write_doc(directory, [bad])
            with self.assertRaises(ValueError):
                self.load(directory)

    def test_user_review_cannot_carry_user_approval_metadata(self):
        with tempfile.TemporaryDirectory() as raw:
            directory = Path(raw)
            bad = record(status="user_review")
            self.write_doc(directory, [bad])
            with self.assertRaises(ValueError):
                self.load(directory)

    def test_non_author_id_is_rejected_even_when_target_exists(self):
        with tempfile.TemporaryDirectory() as raw:
            directory = Path(raw)
            bad = record(author_id="PLACE-1")
            self.write_doc(directory, [bad])
            with self.assertRaises(ValueError):
                self.load(directory)

    def test_missing_boundary_is_rejected(self):
        with tempfile.TemporaryDirectory() as raw:
            directory = Path(raw)
            bad = record(fact_boundary=[])
            self.write_doc(directory, [bad])
            with self.assertRaises(ValueError):
                self.load(directory)


if __name__ == "__main__":
    unittest.main()
