# B01–B17 Consolidated Pre-PR Review

日期：2026-08-22

结论：`READY FOR PR WITH CONSOLIDATION REMEDIATION`

## Scope

- `WEB-CE-B01` through `WEB-CE-B17`.
- Independent audit/remediation checkpoints: B01, B02–B05, B06–B10, B11–B15, B16–B17.
- Git base: `origin/main` at `c1881f36ce63280ba29358bec37cdf4803960f38`.
- Previous B01 PR: #10, head `e804f4efdc40158eef56550da8d2f415b084a97f`.

## B01 PR comparison

- PR #10 head is an ancestor of the consolidated branch.
- B01-specific changeset files, migration `0004`, and the historical `v1.1.0` export snapshot are byte-identical between PR #10 and the consolidated branch.
- The consolidated branch adds B02–B17 plus all subsequent Sol remediation migrations.
- Pre-PR projection audit additionally found three blank B01 card fields despite underlying facts being present: Mistral/Paz country and life-period projections, and `Aura` genre/period projection. Migration `0025_sol_review_b01_b17_projection_cleanup.sql` corrects these without changing research facts.
- PR #10 therefore has no unique work that must remain open and is superseded by the B01–B17 PR.

## Consolidated integrity

- Migration chain `0004` through `0025` replays from current `origin/main` without conflict.
- Replayed database and committed master match across all 19 business tables, excluding only migration application timestamps.
- SQLite integrity and foreign keys pass.
- Cross-batch audits found no unresolved P0; confirmed P1/P2 findings have corrective migrations rather than rewritten history.
- Web Data rebuild is deterministic; public/review boundary remains fail-closed.

## Product and coverage notes

- Review package: 61 authors, 168 works, 25 literary places.
- Formal public projection intentionally remains smaller because later Curation fields are `user_review`; merging this PR does not constitute USER content approval or a production release.
- Coverage is broader than the pre-expansion baseline but still favors Argentina/Mexico and narrative prose. A future sequence should prioritize women poets and lower-coverage Caribbean, Central American, and Andean countries.
- The historical `data/exports/v1.1.0` directory is the B01 snapshot recorded by its manifest; it is not presented as a current B17 export.

## Release boundary

This PR is a data/content integration PR only. It must not automatically create a tag, GitHub Release, public content approval, or production deployment.
