# WCD-10 B07 execution audit

**Checkpoint:** 2026-10-10 · **Task:** TASK-112 · **Scope:** Sabato R3, Bioy R8, and Roa R5 admitted under the exact B07 review gate. Actual prepare, independent SQL review, apply, and QA were performed by the Codex parent fallback after the Luna terminal reached its usage limit. This audit records those parent-executed results; it does not claim that this integrator performed them. Status: `PASS_BOUNDED_B07_EXECUTION_AND_GOVERNANCE`.

## Admitted scope and preserved boundaries

The batch contributes 54 work/collection objects, 200 facts, 54 `CREATED` relationships, 63 content cards, and 76 gaps. It contains 105 source candidates: 96 used in candidate facts, CREATED attribution, or coverage; eight reuse existing source rows without modifying them; nine occur only in deferred records and receive no formal source ID. The migration adds 88 source rows. All 41 deferred records remain in the candidate package; no deferred-only source receives a source ID. The 63 coverage rows retain their previous source references and remaining-work text. No extra relationships were proposed.

Candidate source/fact/reference content and source profiles remained bound to the reviewed input package. The parent merged review passed 1,815 assertions against CANDIDATES SHA `35c653123fcf944a8c333f7d76bf39496867fb4c8507724e16598a9bbfc57aeb` and Gate SHA `266745b1ea95999a9943ed176d15ca354d3f1a6d9dc85f908c014c3e4a5ab49c`. The final merge provenance also records the additive normalization of Sabato's deferred `status` field into the builder's `disposition` field while preserving all original fields and the frozen author package. The exact source packages and review report hashes are recorded in `EXECUTION_REVIEW.json`.

The five Bioy R8 source profiles with unknown publisher values (S131, S136, S142, S144, and S149) retain empty publisher strings; no organization or hosting platform was substituted. The parent-approved helper accepts an explicitly present empty value as unknown.

The approved role descriptions survived into the SQL and map: W117 is Bioy as compiler of *De jardines ajenos*; W119 records Bioy as diary/notebook author with Daniel Martino as selector of *Descanso de caminantes, Diarios íntimos*; W120 identifies *Borges* as selected from Bioy's diary and edited by Martino, with Borges as the person recorded; W217 identifies Roa as compiler of *Las culturas condenadas*. Existing W128 co-authorship and W129 compilation/translation/preface descriptions were preserved. Parent's six-object SQL role supplement review passed for W117, W119, W120, W128, W129, and W217.

## Exact gate, SQL, and database binding

- Candidate SHA: `35c653123fcf944a8c333f7d76bf39496867fb4c8507724e16598a9bbfc57aeb`.
- Candidate `REVIEW_GATE.json` SHA: `266745b1ea95999a9943ed176d15ca354d3f1a6d9dc85f908c014c3e4a5ab49c` (verdict `PASS`).
- Baseline WT database SHA: `ea9e01b41b4faaef727a6159b6d34ba7d9121a9992fda1cb993c6574f91f6a27`.
- Migration `0042_wcd10_b07_author_works.sql` SHA: `4110d4c32fb5f418636640f2f6ecb4f32853a0c12431ebcdd2e7b2fdc34c66c7`.
- `INTEGRATION_MAP.json` SHA: `7fbf2e238c959d80ffdc1b58fefce128d6124cd21c241cd73b8297b053a9cef1`.
- Checkpoint Gate SHA: `8fa3725d8e3bbaba26bca2b007349293692acab42f6740e4856ef9a5ee7eedae`.

The SQL added formal source IDs `SRC-0459`–`SRC-0546` (88 records), entity IDs `V1-ENT-0457`–`V1-ENT-0510` (54), fact IDs `V1-FCT-1377`–`V1-FCT-1576` (200), card IDs `V1-CARD-0381`–`V1-CARD-0443` (63), relationship IDs `V1-REL-0426`–`V1-REL-0479` (54), and gap IDs `V1-GAP-0195`–`V1-GAP-0270` (76). Eight candidate source IDs reuse existing rows: S001→SRC-0148, S002→SRC-0149, S003→SRC-0150, S102→SRC-0154, S103→SRC-0155, S104→SRC-0153, S215→SRC-0160, and S219→SRC-0159. Deferred-only candidates S018, S024–S028, S126, S139, and S217 map to no source ID.

Parent independently applied the exact migration to a disposable baseline clone and passed 732 SQL assertions. The separately authorized actual apply then exited 0. The resulting WT master SHA is `0150e68ee98e28714a7719129aab7d47e137fc692e8e46a5e1db29540f5dbc07`; the root database remained at `a8c54e3c0e04a347f310d7f0f969dfba758f575008fa64c1789e43b26bf378cc`.

## Actual table changes

Parent's SQL review compared the frozen baseline clone with the reviewed migration. Its table deltas match the actual database review across all 19 tables.

| Table | Before | Delta | After |
| --- | ---: | ---: | ---: |
| `card_facts` | 1,349 | +200 | 1,549 |
| `card_sources` | 752 | +195 | 947 |
| `content_cards` | 380 | +63 | 443 |
| `entities` | 454 | +54 | 508 |
| `entity_id_map` | 452 | +54 | 506 |
| `fact_sources` | 1,523 | +355 | 1,878 |
| `facts` | 1,370 | +200 | 1,570 |
| `gaps` | 194 | +76 | 270 |
| `legacy_relation_groups` | 15 | 0 | 15 |
| `metadata` | 16 | 0 | 16 |
| `migration_log` | 41 | +1 | 42 |
| `n3_decisions` | 4 | 0 | 4 |
| `relation_hold_evidence` | 58 | 0 | 58 |
| `relation_holds` | 51 | 0 | 51 |
| `relationship_evidence` | 521 | +152 | 673 |
| `relationship_sources` | 550 | +152 | 702 |
| `relationships` | 423 | +54 | 477 |
| `source_holds` | 4 | 0 | 4 |
| `sources` | 456 | +88 | 544 |

All old non-metadata rows were preserved; metadata changed only the approved checkpoint keys. The schema remains 0.4. This is a Research checkpoint in the existing 1.5.0 development train, not a new formal Data release.

## Execution and QA evidence

The actual database passed the independent clone comparison and the parent checkpoint QA: 19-table SQLite integrity passed, foreign-key errors were zero, and JSON/CSV/XLSX each contained all 19 tables. All old non-metadata rows were preserved; metadata changed only the approved checkpoint keys. The exact reviewed SQL replayed successfully. The deterministic export repeat matched all 22 files. The fixed-parameter Web Data build used `generated_at=2026-10-08T00:00:00Z`; 177 public artifacts remained byte-identical, the public projection remained at 127 entities and 139 routes, and no new B07 entity became public. The temporary loopback server was stopped with Ctrl-C and exited 0.

The full post-apply Python suite passed 161 tests in 33.877 seconds. Migration replay passed all 42 migrations with 19 tables equal, SQLite integrity `ok`, and zero foreign-key errors. Chromium desktop and mobile each passed 30 tests; four existing preview-only tests were explicitly skipped; there were zero unexpected failures. Parent reviewed all 64 browser records. The local static server was bound only to `127.0.0.1:4187`, then stopped with Ctrl-C and exit 0; it was not deployed. The final internal `data/v2/web/site_data.json` matched the validated B07 after-build byte-for-byte (SHA `6f5cfc7fe2e81941c8729cae6b621e4100c0cc7123e717f3141f92a1a11907f0`). Parent's artifact check passed strict parsing of the 11 then-present JSON artifacts, credential-pattern scan, and actual diff-check.

Operational failures are retained in the logs. The Luna terminal had reached its usage limit, so the parent executed prepare, review, apply, and QA. Initial parent prepare invocations had argument/cwd contract errors and a `KeyError` because Sabato's frozen deferred rows used `status`; the additive normalization mapped that value to `disposition` without rewriting frozen rows or original values. A read-only SQL query initially named the wrong column, then was corrected before the complete role review. The first default-sandbox HTTP server bind logged `PermissionError`; the explicit escalated local-server invocation succeeded on loopback. An initial build with a relative `--db` path failed; the absolute-path rerun succeeded. These failures produced no successful apply; the resolved prepare and actual apply logs are separately preserved.

## Remaining boundary

Parent execution, SQL, actual database, export, replay, test, and browser reviews passed. Parent final execution and governance synchronization passed. TASK-112 is DONE under bounded research acceptance, and B08 is unlocked for fresh inventory and author research. This conclusion does not mark the WCD-10 stage complete. Stage-wide obligations remain: the USER's W03 cross-language first-publication policy and actual backfill, plus the B07 coauthor same-object re-entry review for existing works 0493 (*Los que aman odian*) and 0494 (*Antología*). Bioy's reviewed roles do not create the missing Silvina Ocampo / Borges `CREATED` edges. The B14 Ocampo work and TASK-127 controlled migration remain required. No Curation, public admission, schema change, formal release, Git operation, or deployment is recorded here.
