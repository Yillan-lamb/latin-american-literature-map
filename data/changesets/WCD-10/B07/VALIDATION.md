# WCD-10 B07 validation ledger

**Date:** 2026-10-10 · **Task:** TASK-112 · **Execution:** PASS; executor was the Codex parent fallback after the Luna terminal usage-limit error. Parent final execution and governance review passed; TASK-112 is complete under bounded research acceptance. This ledger records evidence already produced; it does not re-run the migration or claim that this integrator executed it.

| Check | Actual result |
| --- | --- |
| Frozen author packages | Sabato R3, Bioy R8, and Roa R5 each had exact parent `PASS_BOUNDED_AUTHOR_PACKAGE` review status; their candidate SHA and frozen manifests were checked before merge. |
| Merged candidate review | Parent verdict `PASS_MERGED_CANDIDATE`, 1,815 assertions; `MERGED_INDEPENDENT_REVIEW.json` is in root local `project/internal/WCD_10_WORKSPACE/B07/`. |
| Candidate roster validator | Actual full B07 roster validation exited 0 with verdict `pass`; 105 sources, 54 new entities, 200 fact candidates, 54 CREATED candidates, zero extra relationships, and 41 deferred items. Parent's actual mechanical report is `MERGED_PARENT_MECHANICAL.json`. |
| Research-note and artifact checks | Candidate Gate binds 12 A-graded research notes. Parent artifact check passed strict parsing of the then-present 11 JSON artifacts, credential-pattern scan, and actual diff-check exit 0. This ledger and the two status JSON files were written afterward and parsed separately. |
| Exact candidate gate | Verdict `PASS`; `REVIEW_GATE.json` SHA `266745b1ea95999a9943ed176d15ca354d3f1a6d9dc85f908c014c3e4a5ab49c`, bound to candidate SHA `35c653123fcf944a8c333f7d76bf39496867fb4c8507724e16598a9bbfc57aeb` and baseline WT database SHA `ea9e01b41b4faaef727a6159b6d34ba7d9121a9992fda1cb993c6574f91f6a27`. |
| Prepare | Parent fallback used the WCD-10 builder with `--batch B07`, emitting SQL and `INTEGRATION_MAP.json`. The helper SHA was `0b3fea…8975`; the exact SQL and map hashes below were checked by the independent SQL reviewer. Sabato deferred `status` values were mapped additively to `disposition`; original fields and frozen package remained unchanged. |
| Prepare/contract failures | `PREPARE_CONTRACT_FAILURES.json` preserves the parent's unsuccessful argument/cwd attempts, the `KeyError` resolved by the additive deferred-field normalization, and the corrected read-only query. These attempts did not apply a migration or modify a database. The resolved prepare log and final SQL SHA are recorded in that report. |
| SQL and mapping | `0042_wcd10_b07_author_works.sql` SHA `4110d4c32fb5f418636640f2f6ecb4f32853a0c12431ebcdd2e7b2fdc34c66c7`; `INTEGRATION_MAP.json` SHA `7fbf2e238c959d80ffdc1b58fefce128d6124cd21c241cd73b8297b053a9cef1`. Parent applied this exact migration to a disposable baseline clone; SQL review passed 732 assertions and clone apply exited 0. |
| SQL role descriptions | Supplemental parent review verdict `PASS`. Six exact SQL/map description chains passed: W117, W119, W120, W128, W129, W217. The four approved role overrides stayed attached to the appropriate compiler/editor/diary-author role. |
| Actual apply | Parent fallback's actual apply exited 0. Actual master SHA `0150e68ee98e28714a7719129aab7d47e137fc692e8e46a5e1db29540f5dbc07`; root database stayed unchanged at SHA `a8c54e3c0e04a347f310d7f0f969dfba758f575008fa64c1789e43b26bf378cc`. Parent actual database review verdict `PASS_ACTUAL_DB_MATCHES_INDEPENDENT_CLONE` compared all 19 tables. |
| Actual master validation | Parent checkpoint QA `PASS`: schema 0.4; SQLite integrity `ok`; zero foreign-key errors; exact reviewed SQL replay; old non-metadata rows preserved and metadata changed only in approved checkpoint keys; JSON, CSV, and XLSX each had 19 equal table exports. Final totals: 508 entities, 1,570 facts, 477 relationships, 544 sources, 443 content cards, and 270 gaps. |
| Formal ID allocation and reuse | 88 new sources allocated `SRC-0459`–`SRC-0546`; 54 entities `V1-ENT-0457`–`V1-ENT-0510`; 200 facts `V1-FCT-1377`–`V1-FCT-1576`; 63 cards `V1-CARD-0381`–`V1-CARD-0443`; 54 relationships `V1-REL-0426`–`V1-REL-0479`; 76 gaps `V1-GAP-0195`–`V1-GAP-0270`. Eight candidate sources reuse existing SRC rows. The nine deferred-only source candidates S018, S024–S028, S126, S139, and S217 have no formal source IDs. |
| Export repeat | Parent deterministic repeat verdict `PASS`; all 22 files matched exactly. |
| Post-apply tests | `python -m unittest discover -s tests -v`; parent log reports 161 tests, exit 0, 33.877 seconds. Raw log: `work/wcd10-qa/B07_POST_APPLY_FULL_TESTS.log`. |
| Migration replay | Parent log: 42 migrations replayed, 19 tables equal, SQLite integrity `ok`, zero foreign-key errors; verdict `PASS`. Raw log: `work/wcd10-qa/B07_MIGRATION_REPLAY.log`. |
| Public projection | Fixed-parameter Web Data was rebuilt with `generated_at=2026-10-08T00:00:00Z`. Parent checkpoint QA confirms 177 public artifacts byte-identical, 127 public entities, zero new B07 entities public. The development public projection remains 139 routes. |
| Internal Web Data byte binding | `data/v2/web/site_data.json` is byte-identical to validated `work/wcd10-qa/B07_AFTER_PUBLIC/web_data/site_data.json`, SHA `6f5cfc7fe2e81941c8729cae6b621e4100c0cc7123e717f3141f92a1a11907f0`; `manifest.json` also matches, SHA `e2b69e84c0e311d5d0930befe7f6c73d251a25af56167603cba834077d10014f`. |
| Browser QA | Parent review covered all 64 Chromium records: desktop 30 passed / 2 explicit preview skips; mobile 30 passed / 2 explicit preview skips; zero unexpected or flaky results. Test server was the local static copy on `127.0.0.1:4187`; no deployment occurred. |
| Local server/build deviations | Initial default-sandbox bind logged `PermissionError`; the separately approved escalated local bind succeeded on loopback. An initial relative `--db` build invocation failed; the absolute-path rerun succeeded. Logs are preserved in `work/wcd10-qa/B07_HTTP_SERVER.log` and `B07_HTTP_SERVER_ESCALATED.log`. |
| Checkpoint boundary | This is a research checkpoint in Data 1.5.0 development, Research Schema 0.4. It does not create a formal Data release or change public scope, Curation, or Web Data schema. |

Parent final execution and governance review passed. TASK-112 is DONE under bounded research acceptance; B08 is unlocked for fresh inventory and author research. W03 cross-language first-publication policy plus actual backfill, and TASK-127/B14 controlled same-object coauthor re-entry for the missing Ocampo and Borges edges on works 0493 and 0494, remain required before the stage can complete. These stage obligations do not block B08 inventory. Final documentary review corrected the stale README batch label and the prepare argument to the actual `--batch B07`; original documentary files are preserved in the local review workspace.

## Hash-bound evidence

| Evidence | SHA-256 |
| --- | --- |
| Parent merged review | `3f032ce0551c99773235b5e3767ddb125abb3f8a058937bc74c70583cebb349f` |
| Parent SQL review | `41ef68624406bd9855e12c73362b72f0763517af0f12a4c5fd3ace1a8564c62b` |
| Parent role review | `b5abb5f6ea5b65f11e0b8e89fdfb9a0da6aa7caef4141340a4332806f53d8436` |
| Parent actual database review | `b41fdab57571ea99c0d6f723c1bffe9a84e85ebb37626fe4bbaaf34c3cdea953` |
| Parent checkpoint QA | `cdcfc902be376aa3c6b449f848e86d36596c90ba19510a29354e9d03a1049cc4` |
| Parent export repeat | `e0ce6117713fe0198a880e34101def0cd1d2687796eca577a6af3b4175026a21` |
| Parent browser review | `bd24160f228e856eb71a5c91f1e989414200bef9e12d6e69d5f34c66888a3690` |
| Post-apply full test log | `df4d37310e37b896a17b8249071f62d7091c6123b920736e65cb81e6aa12cf8c` |
| Migration replay log | `1442b5d2a2d4a01c5d5cd192c8c624f8720adc7ffe17aa96c6565e2a64aaecc7` |
| Parent prepare contract failures | `3f6b6a4d8f53b97fc14b4e9d8ceb604ae7a0edb271ed0a88ba5c18b8c6979ad8` |
