# WCD-10 B12 validation ledger

2026-10-13 · TASK-117 · Research-only bounded acceptance under DEC-070.

## Validation results

| Check | Actual result |
| --- | --- |
| Frozen inputs and candidate review | Arreola, Poniatowska and Pacheco inputs were merged in approved order. Parent source/content review passed. The candidate package contains 22 new entities, 101 facts, 22 CREATED relationships, 18 old-fact candidates for nine existing objects, and six explicit deferrals. |
| Coverage interface correction | Original concatenation was preserved. The obsolete empty-facts duplicate W001 row was removed; all 31 main-row candidate-facts interfaces were synchronized to frozen candidate facts by identity/value/refs. Candidate and evidence matrix hashes were unchanged. |
| Source registration | Six authorized root execution fields were added after the original R0 failure. The 16 profiles remained byte-value/order equivalent. The Gate was rebound by the parent after this mechanical root update. Of 16 candidate profiles, 15 sources are actually mapped (3 reused, 12 new); S203 remains unused and is not a formal source. |
| SQL clone review | Parent applied the exact reviewed SQL to a disposable baseline clone and passed 643 checks. Exact baseline, SQL, mapping, reviewer and task are bound in `CHECKPOINT_REVIEW.json`. |
| Apply and independent actual-data review | `0047_wcd10_b12_author_works.sql` was applied exactly once; exit code 0. The parent’s actual-data review passed 671 checks. Baseline SHA was `7152ecc903ef7b610440a5173b0dd79d28ce25358b53ffa42512da6eb615db67`; final master SHA is `74a900c2988eec78a700467bc70c5e523a774cd4fa615cfc5edfdd16991ff8f7`. |
| Master and table totals | SQLite integrity is `ok`, foreign-key errors are `0`, schema is `0.4`. Exact final totals and per-table deltas (including zeros) below are copied from the parent’s actual-data review. |
| Full migration replay | All 47 migrations replayed from the V1.0.0 base; all 19 tables match, integrity is `ok`, foreign-key errors are `0`. The raw stdout SHA is `108de80245f4870d5ec292ee04b5a444d4c2cc7c90fed6ae13c68e830289015c`. The formatted WT log SHA is `73f62d065fb2c584d081f9916b52a87da7b105f345ed739641de6d4643e13e67`. These are distinct files; formatting used the captured stdout and did not rerun replay. See [formatted replay log](../../../../work/wcd10-qa/B12_MIGRATION_REPLAY.log) and [raw replay stdout](../../../../work/wcd10-qa/B12_MIGRATION_REPLAY_RAW.log). |
| Exports | JSON, CSV and XLSX each contain 19 equal tables. The repeated export produced 22 files byte-identical to the checkpoint export. |
| Public boundary | The fixed-time Web Data/deploy/content-quality checks passed using `generated_at=2026-10-08T00:00:00Z`. All 177 before/after deployment files are byte-identical; 127 public entities and 139 routes remain, with 82 anecdotes. None of the 22 new B12 entities is public. |
| Copied Web Data | `manifest.json` and `site_data.json` were copied byte-identically to `data/v2/web/`; the copied Web Data passed validation. Its generated payload retains 82 anecdotes. |
| Formal command ledger | The official post-apply command list has exactly 17 commands: one apply plus 16 QA steps. All 17 exit codes are 0. The pre-apply incident is separately preserved and is not counted as official QA. |

## Exact final table totals and deltas

| Table | Final rows | Delta from B11 |
| --- | ---: | ---: |
| `card_facts` | 2149 | 101 |
| `card_sources` | 1317 | 49 |
| `content_cards` | 639 | 31 |
| `entities` | 658 | 22 |
| `entity_id_map` | 656 | 22 |
| `fact_sources` | 2656 | 132 |
| `facts` | 2170 | 101 |
| `gaps` | 462 | 37 |
| `legacy_relation_groups` | 15 | 0 |
| `metadata` | 16 | 0 |
| `migration_log` | 47 | 1 |
| `n3_decisions` | 4 | 0 |
| `relation_hold_evidence` | 58 | 0 |
| `relation_holds` | 51 | 0 |
| `relationship_evidence` | 952 | 31 |
| `relationship_sources` | 981 | 31 |
| `relationships` | 627 | 22 |
| `source_holds` | 4 | 0 |
| `sources` | 700 | 12 |


## Operational exceptions and preservation

The first PREPARE run exited 1 because `SOURCE_REGISTRATION.json` lacked six root-level execution metadata fields; no SQL/map was generated and the baseline database did not change. Its original log and source registration are preserved in `project/internal/WCD_10_WORKSPACE/B12/PREPARE_R0`. A parent-authorized mechanical root addition preserved all 16 profiles, after which the Gate was rebound and PREPARE retry exited 0.

An accidental `run_required_qa.py --help` invocation ran 11 checks on the unapplied baseline: 10 returned 0 and `reviewed_checkpoint_qa` returned 1. Master remained at baseline SHA `7152ecc903ef7b610440a5173b0dd79d28ce25358b53ffa42512da6eb615db67`. All incident outputs, QA step records and raw streams were moved intact to the separate `B12_PREAPPLY_QA_INCIDENT` archive; the parent independently verified the archive. The later official post-apply QA run has 16 checks, all exit 0. The migration was applied once and was not retried. No product data or formal tools were changed during documentation closeout.

The parent reader’s initial wrapper-shape mismatch (exit 1) and read-layer adaptation are preserved in `PARENT_READER_ADAPTATIONS.json`; there was no data mutation. No B11-specific failure is inherited or claimed for B12. No full browser matrix or unrelated engineering tests were run because no product code or tool changed under DEC-070.

Candidate SHA: `b9d2b605a1585946a5964a2d05ac537c023b3e6edebbd936652eb7deaa37e222`. Coverage SHA: `9d29975aa57e27b6e2be6c0be8e29f36fea0e5481e76cb44994bde6d8b345b2e`. Source registration SHA: `bc8d33bb60cdd1797261ce93315f57b562e56f04bab9812497eb16c31b0522d1`. Evidence matrix SHA: `76266aceea171ec6d00d2a92ebdecd35788aa523995807e521e815b281dfe7f0`. Review Gate SHA: `7505a3be24fa98ef6a9d59ddf8c0a50866f14f5acb9255ca9e7890b63b83165e`. Checkpoint Review SHA: `a0ef42452241344ff9b60d00540f12423e143942940e8139d60d782a1fb91ef7`. Migration SQL SHA: `61f052906048628561740d787e6f94abd156cfafea896ead79cf0bf0152b28b2`. Integration Map SHA: `f449f029c1b8875c21ced0f3d92a7418cc572b7bde27083316ea8ad3dc950e22`. Checkpoint QA SHA: `5332d60831165773fb9601f2857be6aefbd65b223baa157865ef40f2358a3e65`. Parent merged-candidate review SHA: `09ffc9dcd2111a06faeb21fd21c198dff1a0f0c741f297e41c984fea529d8fd5`. Parent SQL clone review SHA: `f8cc057407b0c1f51a5209580c97fb6c5c0eec99a36d84c616d80d06bd2ceba9`. Parent actual-data review SHA: `c959c9c01fdb4cdd6f0002d10a8e9fa29a6b99836616d24986894078822cecc9`. Integrator actual apply/QA report SHA: `0e4feea8bf5feef45b9cd19306c374ef6c5fa2d6381e373d8e813cc8da2ec76f`. Pre-apply archive manifest SHA: `e94e86ceb419c41c06689346b78f978978eb3100600b406ceed14ee2bc744943`.

Research 1.5.0 development, Schema 0.4, Web Data 0.3, Web 0.6.0, Curation scope and the Public Release pause remain unchanged. No Git or release/deployment operation occurred.
