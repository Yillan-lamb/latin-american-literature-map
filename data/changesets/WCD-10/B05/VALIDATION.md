# WCD-10 B05 validation ledger

2026-10-07 · TASK-110 · **PASS_BOUNDED_BATCH**. Actual execution and independent parent review complete; W03 policy and actual re-entry remain mandatory before TASK-127 final PASS.

| Gate | Actual result |
| --- | --- |
| Default validator | FAIL preserved: F16 conflicts with old bibliographic_note; no gate bypass |
| Explicit F16 reviewed conflict path | PASS: only exact append-only correction |
| Candidate/coverage/registration/evidence | Parent65 assertions PASS;8 entities44 facts |
| SQL/map | Parent177 clone assertions PASS; exact0040/map hashes below |
| Actual apply | exit0; TASK110 SQL reviewer matches CHECKPOINT_REVIEW; master0185f6c8 |
| Actual database independent review | Parent161 assertions PASS; all19 table values replay, old rows/holds preserved |
| First actual reviewed QA | FAIL retained: tool equated candidate reviewer with SQL reviewer |
| Reviewer-role correction | Parent code review and16 targeted tests PASS; historical default retained; wrong/missing reviewer rejected |
| Full Python tests after repair | Parent154 PASS, exit0,16.557s |
| Migration replay | Actual40 migrations,19 tables equal; integrity ok,0 FK errors |
| Checkpoint exports | JSON/CSV/XLSX each19 tables equal;22 files deterministic; new directory, old exports retained |
| Parent actual reviewed checkpoint QA | PASS;177 public files byte-identical;127 public entities;8 new entities public0 |
| Full internal Web Data | Rebuilt from actual master and validated;426 entities1253 facts395 relationships406 sources343 cards151 gaps |
| Production browser | Luna Chromium desktop/mobile60 PASS/4 explicit preview SKIP/0 failures; parent independently reviewed64 records and assertions |
| Governance | TASKS/CHANGELOG/README/masterREADME/hand-off updated; DECISIONS=N/A existingDEC060/069; Spec obligation retained; Charter unchanged |

Candidate SHA `5447e33567284bb7d60c7525674d67fd7da35a5505025f88e1510e0b7fcb8ffe`.
Baseline SHA `45e8d72c3656f762f4a34f664c822c33685be925b53553b91b19041d6835b47d`.
SQL SHA `6ba19bc5aaa9b688ef99aefdcba18c1f8407ffa1969b9727a6d1c22ae505eb4a`.
Map SHA `179dbc2b01ff753e5d51464da7eab7f9affca3737c3d455ecec972578bd202c8`.
Actual master SHA `0185f6c81ebe1dce1d761e7e9d8780f65baf1b3ed5769987f92f977fdfbdd868`.
Browser SHA `9fece5e56bbd6cb59c2e5611ac7d6b96cad788615df2d8925d767d219db30268`.

Actual apply: `python3 scripts/apply_migration.py data/master/V1_MASTER.sqlite data/master/migrations/0040_wcd10_b05_author_works.sql --task-id TASK-110 --reviewer Codex-parent-independent-SQL-review --expected-schema 0.4 --pre-schema 0.4`.

Formal exports: `data/exports/wcd10-b05-checkpoint/`. Actual QA/browser and retained initial failure: `work/wcd10-qa/B05_PARENT_QA.json`, `B05_QA.json`, `B05_PLAYWRIGHT.json`, `B05_REVIEWED_CHECKPOINT_QA_FAILURE.json`. Static parent assertions and exact QA binding are in `EXECUTION_REVIEW.json`. Public QA uses identical Oct3 generation/origin parameters; current complete internal Web Data uses Oct7 generation time. Chromium covered navigation/search/filters/timeline/map/fictional space/320px and sitemap reader scope; no Firefox/WebKit/Lighthouse rerun is claimed.

Delta:14 sources,8 entities,15 cards,44 facts,9 relationships,29 gaps. All old rows remain, including FCT0309/SRC0099/HOLD0043. New F16 fact1259 is an additive bibliographic note, not old provenance repair or structured supersession. W03 is absent from formal entities/facts/CREATED, S18 unregistered; unique policy gap0123 remains open. After USER policy, re-entry must cite existing gap ID/key without duplicate gap and undergo fresh independent review/integration. B05 bounded acceptance permits B06, while the stage remains active and cannot pass without W03 actual re-entry. Versions/public scope unchanged; no commit/push/merge/release/deployment.
