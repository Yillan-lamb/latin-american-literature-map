# WCD-08 Author Anecdote Integration Audit

- Canonical task: `TASK-098 / WCD-08`
- USER decision: approved, 2026-09-06T12:00:20+08:00
- Integration target: Web 0.4.0 Development / Web Data `v2-web-0.3`
- Research impact: none; Data remains 1.5.0 development candidate and Research Schema remains 0.4

## Decision applied

The approval applies to the 95 records that were in `user_review` when the decision was made. The 38 pre-existing `hold` records remain held, including `W08C-042`, the only HIGH-risk candidate. Formal Curation retains all 133 records so the decision boundary remains auditable.

Of the 95 approved records, 82 belong to authors already present in `public_scope.authors` and are projected to 24 author pages. Thirteen approved records belong to Roberto Bolaño, Alejandra Pizarnik, and Sor Juana Inés de la Cruz; those authors are outside the current public scope, so their records remain approved in Curation but are not projected. WCD-08 does not expand author scope.

## Formal data and public boundary

- `CURATION_ANECDOTES.json`: 133 records = 95 `auto_approved` + 38 `hold`; all approved records carry `reviewer=USER` and the exact decision timestamp.
- `CURATION_ANECDOTE_SOURCES.json`: 119 sources with stable WCD-08 source IDs; all 133 records have closed source references.
- `reader_content.authors[].anecdotes`: 82 records. The reader whitelist contains only ID, title, teaser, story, display labels, a reader-safe source label, and sort order.
- Status, reviewer, review time, risk level, fact status, fact boundary, legacy ID, source grade, and internal source references are not serialized into the public bundle.
- The HIGH-risk record, all other holds, and all approved records whose authors are outside public scope are absent from reader and deploy projections.

## Verification

- Deterministic promotion: `95 approved / 38 hold / 119 sources`.
- Web build and `validate_v2_web_data.py`: PASS; 82 projected anecdotes.
- WCD-08 boundary QA: 8/8 checks PASS.
- Python unit suite: 41/41 PASS.
- Public deploy build and `validate_v2_public_bundle.py`: PASS; 128 public entities, 82 public anecdotes, zero forbidden governance keys.
- Full Playwright matrix: 88 PASS / 8 expected private-preview SKIP across Chromium desktop/mobile, Firefox desktop, and WebKit mobile.
- Private decision preview: 2/2 PASS on Chromium desktop; 118 candidate records remain inspectable for the 25 public-scope candidate authors.
- `git diff --check`: PASS for the WCD-08 tracked changeset.

## Release and downstream state

This integration is development content only. `V2-PUBLIC-RELEASE` remains `PAUSED BY USER`; no tag, GitHub Release, or production deployment is authorized. `TASK-099 / WCD-09` remains `LOCKED / NOT STARTED` and continues to be a mandatory prerequisite for any future Public Release.
