# SOL_AUDIT_B06-B10

## Executive Conclusion

**PASS WITH REMEDIATION**

The current SQLite content is internally healthy, the B06-B10 data is present, and the confirmed content defect has been corrected. The P0 migration-provenance defect was subsequently closed with explicit USER authorization: only the transaction wrappers in `0010`-`0012` were removed, original and normalized hashes were recorded, and corrective migration `0015` reconstructed the missing formal log entries. A clean B05-to-`0015` replay now succeeds through the required migration tool.

No evidence was found of systematic source downgrading, interpretive overreach, relationship inflation, Curation-to-Research leakage, or Geo fictionalization. Luna's research quality was otherwise stable. The primary systemic drift was QA/governance drift: B07-B09 reports claimed a formal migration path that the handed-off repository could not reproduce. That defect is now remediated and regression-checked.

## Audit Scope

- Batches: `WEB-CE-B06` through `WEB-CE-B10`
- Handoff: `project/audits/web/SOL_AUDIT_HANDOFF_B06-B10.md` at `fc533a8`
- Batch commits: B06 `f1448b5`; B07 `77a1d0a`; B08 `309806e`; B09 `6c24191`; B10 `fc4b090`
- Luna migrations: `0009` through `0013`
- Corrective migrations: `0014_sol_audit_b06_b10_remediation.sql` and `0015_sol_audit_b06_b10_migration_reconciliation.sql`
- Ground truth: Git history, all five change sets, current `data/master/V1_MASTER.sqlite`, generated Curation/Web data, and USER_REVIEW preview

All Preflight, Review, QA, final reports, Research, Geo, Curation, migration, commit, and web-projection changes were inspected independently; report totals were not accepted as ground truth.

## Data Growth

| Batch | Authors | Works / collections | Facts | Relations | Sources | Cards | Geo | Curation | Commit |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---|
| B06 | 3 | 9 | 42 | 12 | 11 | 12 | 1 place + 3 relations | 13 records | `f1448b5` |
| B07 | 3 | 9 | 42 | 12 | 9 | 12 | 3 relations | 12 records | `77a1d0a` |
| B08 | 3 | 9 | 42 | 12 | 8 | 12 | 3 relations | 12 records | `309806e` |
| B09 | 3 | 9 | 42 | 12 | 9 | 12 | 3 relations | 12 records | `6c24191` |
| B10 | 3 | 9 | 43 | 12 | 11 | 12 | 3 relations | 12 records | `fc4b090` |
| **Total** | **15** | **45** | **211** | **60** | **48** | **60** | **1 real place + 15 relations** | **61 records** | — |

Additional machine totals for the audit range:

- 61 entities: 15 authors, 45 works/collections, and Nicaragua as one real country node
- 125 card-source links, 216 fact-source links, and 60 relationship-evidence links
- 0 fictional spaces
- 2 research gaps/disputed bibliographic questions: *Los heraldos negros* (1918 cover / 1919 appearance) and *Tinísima* (1991 / 1992)
- 0 new relationship HOLD records and 0 new `research_hold` items
- 490 Curation fields across 61 records, all retained as `user_review`; none was silently auto-approved

## SQLite and Migration Integrity

### Current master database

- `PRAGMA integrity_check`: `ok`
- Foreign-key violations: 0
- No dangling fact subjects, relationship endpoints, content-card subjects, or evidence references
- Entity/source/relationship IDs are unique
- No cross-batch duplicate relationship triple
- Current database after remediation: 281 entities, 729 facts, 209 relationships, 222 sources, 171 cards, 16 gaps, 51 pre-existing HOLD records, and 15 continuous migration-log records

### P0 migration provenance defect — remediated

The audited master originally contained `0009`, then jumped to `0013`; `0010`, `0011`, and `0012` were absent. Those three SQL files contained `BEGIN;` / `COMMIT;`, which `scripts/apply_migration.py` explicitly rejects.

Before remediation, a clean replay from the B05 baseline produced this result:

- `0009`: accepted by the formal tool
- `0010`-`0012`: rejected by the formal tool
- `0013`: accepted by the formal tool

After explicit USER authorization, Sol removed only those wrappers and preserved every data statement. Original and normalized hashes are recorded in `data/changesets/SOL-AUDIT-B06-B10/REMEDIATION.md`. Corrective migration `0015` backfills the existing master's missing rows with reviewer `SOL-AUDIT-RECONSTRUCTED`; on a clean replay, `INSERT OR IGNORE` preserves the rows already written by the formal tool.

Starting from the B05 master at `286aff7`, `scripts/apply_migration.py` applied `0009` through `0015` consecutively. All 18 non-log tables matched the repaired formal-master copy row for row. The migration chain and current provenance are therefore reproducible and continuous.

## Research Quality

### Sources

- 48 new sources: B06-B09 are level B; B10 contains 4 level A and 7 level B sources.
- No level C or D source supports formal B06-B10 Research claims.
- No duplicate canonical URL or normalized source identity was found within the audit range.
- No evidence of citation laundering, search-snippet substitution, or a monotonic decline in source grade.
- Two B06 registry-only URLs were not retrievable by the audit crawler, but neither supports a fact, relationship, or content card; they do not contaminate formal Research.

All higher-risk items were checked in full: interpretive relationships, gaps/disputed items, Reviewer `REVISE` cases, Geo literary relations, and important single-source claims. Ordinary dates, genres, and identities were risk-sampled across every batch.

### Confirmed P1 factual defect — remediated

B09 recorded *2666* as first published in 2005 by reading a Memoria Chilena “Archivo 2005” award page as a publication statement. Memoria Chilena's author page and Anagrama's publisher record place publication in 2004. Corrective migration `0014` changes the formal fact, note, evidence link, content card, Curation text, Web Data, timeline, and preview to 2004.

### Literary semantics

- The 60 relationships are 45 mechanical `CREATED` links and 15 author-country `ASSOCIATED_WITH_PLACE` links.
- No B06-B10 `INFLUENCED` or comparable causal/interpretive relationship was introduced.
- Relation types, subject/object direction, endpoint identities, and evidence links are correct.
- Searches for strong claims such as “开创”, “奠定”, “标志”, “深刻影响”, “转折点”, and “最重要” found no unsupported Research assertions in the audit range.
- The two disputed publication-year questions are correctly retained as gaps rather than forced into false certainty.

Result: one isolated `UNSUPPORTED` bibliographic year was found and fixed; no batch-wide `OVERSTATED`, `MISCLASSIFIED`, or `HOLD_REQUIRED` pattern was found.

## Cross-Batch Integrity

- Author names, original names, accent-insensitive variants, aliases, and Spanish/Portuguese ordering produced no erroneous duplicate author.
- Work titles and Chinese display names produced no erroneous merge or split. Apparent collisions such as *El Aleph*, *Pedro Páramo*, and *Bestiario* represent different entity types or distinct works by different authors.
- Original-language titles are preserved; no Chinese/original-title mismatch was found.
- No duplicate source identity or normalized relationship triple was introduced.
- One duplicate card-source pair exists in older out-of-scope data (`V1-CARD-0036` / `SRC-0046`); B06-B10 did not create or extend it.

## Geo / Curation / Web

### Geo

- The only new place is Nicaragua, correctly modeled as a real country with code `NI` and no fabricated point coordinate.
- No fictional space was assigned a real coordinate.
- All 15 new author-country relations align with author nationality/context evidence.
- No Geo evidence-lowering trend was found.

### Research / Curation boundary

- All 61 new Curation records remain `user_review`; all 490 individual field decisions remain pending USER review.
- No recommendation language was promoted into formal Research.
- No approval status was lowered to bypass the public boundary.

### Website consumption

The projection pipeline is functioning:

- all 60 new author/work entities have generated pages and timeline entries;
- Nicaragua has a place page and map node;
- all 15 Geo relations are projected;
- the USER_REVIEW preview exposes all 61 audited entities and supports their routes/search;
- the formal public search exposes Nicaragua but correctly withholds the 60 author/work drafts while they remain `user_review`.

Thus the data is not trapped in SQLite. The apparent lack of formal reader-facing growth is an approval-boundary effect, not a frontend hard-code or projection failure. Publishing the 60 author/work records requires a separate USER decision and was not performed in this audit.

## Coverage

- Countries: Mexico 4 authors; Argentina 3; Uruguay, Chile, and Peru 2 each; Cuba and Nicaragua 1 each.
- Gender: 2 women among 15 authors (13.3%).
- Work-form mix: 21 novels and 13 poetry collections, with the remainder spanning short fiction, essays, history, and mixed forms.
- Strengths: meaningful Andean, poetry, and Nicaragua additions.
- Remaining skew: Mexico/Argentina account for 7 of 15 authors; the Caribbean and Central America remain thin; Ecuador and Venezuela are absent; women remain sharply underrepresented.

The next planned Argentina-heavy block would worsen country and gender concentration. The roadmap should not be rewritten, but the order should be lightly adjusted by bringing forward women and authors from Ecuador, Venezuela, the Caribbean, and Central America, while splitting rather than discarding the Argentina candidates.

## QA and Test Effectiveness

The following were rerun after remediation:

- master validation, SQLite integrity, foreign keys, and content-quality validation
- deterministic Curation and Web Data rebuild with byte comparison
- Web Data validator and public-boundary checks
- frontend and Playwright syntax checks
- USER_REVIEW preview build and validation
- public UI checks against formal data and preview
- Chromium desktop/mobile, Firefox desktop, and WebKit mobile browser suite

Active validators do not hard-code the pre-B06 author/work counts. However, the committed browser coverage previously stopped at B05; B06-B10 additions were not protected by a repeatable route/search/map/timeline test. A new regression test now covers formal boundary behavior and the full USER_REVIEW preview path.

Running the repository-root bundle validator against the source tree still fails by design because the source tree contains governance fields; the generated public/preview bundle passes its proper validator. This is not treated as a product failure.

## Systemic Luna Findings

| Drift category | Finding |
|---|---|
| Source drift | No |
| Expression drift | No |
| Review drift | No clear semantic drift; B09/B10 reviews produced substantive revisions |
| HOLD drift | No |
| Schema drift | No content-schema drift |
| Curation drift | No |
| Geo drift | No |
| QA drift | **Yes, from B07 through B09:** migration QA did not detect or truthfully represent the formal-tool rejection; B06-B10 browser coverage was also not committed |

The QA/provenance defect received the authorized retrospective repair described below. Other data categories do not require broad rollback.

## Issue Register

1. **P0 — fixed:** B07-B09 migrations are accepted by the official tool, their original/normalized hashes are documented, and reconstructed log rows are explicitly labeled.
2. **P1 — fixed:** B09 *2666* first-publication year was incorrectly recorded as 2005 instead of 2004.
3. **P2 — fixed:** committed browser coverage stopped at B05 and did not exercise B06-B10 routes, search, map, timeline, or boundary behavior.
4. **P2 — USER decision:** 60 author/work records are intentionally hidden from formal public search while all Curation fields remain `user_review`.
5. **P3 — recommendation:** author-country and gender coverage remains concentrated; the next roadmap order should be lightly rebalanced.

## Remediation

- Added and formally applied `0014_sol_audit_b06_b10_remediation.sql` after a copy rehearsal.
- Corrected *2666* to 2004 across Research, evidence mapping, card, Curation, Web Data, timeline, and preview.
- Deterministically regenerated dependent Curation/Web artifacts.
- Added a browser regression for the entire B06-B10 public-boundary and preview path.
- With explicit USER authorization, normalized only the transaction wrappers in historical migrations `0010`-`0012`; every original and replacement hash is preserved in the remediation record.
- Added and formally applied `0015` to reconcile the existing master while preserving clean-replay behavior.

Full trace: `data/changesets/SOL-AUDIT-B06-B10/REMEDIATION.md`.

## Remaining Risks and USER Decisions

1. Independently approve, revise, or reject the 61 Curation records before formal public exposure. This does not block continued Research expansion.
2. Decide whether to bring forward underrepresented women and Ecuador/Venezuela/Caribbean/Central American authors before an Argentina-heavy next block.

## Recommendation

The P0 provenance issue is closed. B11 may begin safely under stricter migration constraints: every migration must omit transaction control, pass a copy rehearsal through `scripts/apply_migration.py`, and have its log row verified before commit. The current data model, SQLite rows, source quality, Geo projection, and USER_REVIEW preview are suitable for continued expansion. Do not publish or deploy as part of this audit.
