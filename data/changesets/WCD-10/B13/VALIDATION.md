# WCD-10-B13 validation ledger

2026-10-13 · Batch `WCD-10-B13` · TASK-118 · Research-only bounded acceptance under DEC-070.

## Validation results

| Check | Actual result |
| --- | --- |
| Frozen candidate and coverage | The pinned CANDIDATES and post-sync COVERAGE were reviewed against the author packages. The candidate has 24 new entities, 104 facts, 24 CREATED relations and three deferrals. Coverage has 33 primary rows, including nine existing works. The authorized coverage sync preserved the original seven-file merge in `MERGED_INITIAL`; CANDIDATES and EVIDENCE_MATRIX remained unchanged. |
| Source registration | There are 25 candidate sources: 22 new source records and two exact reuses (`SRC-0211`, `SRC-0214`) are mapped; S002 was read but unused and remains unmapped. No reused source metadata was changed. |
| Parent content and merged review | Semantic review passed; merged-candidate independent review passed for 24 entities, 104 facts, 25 candidate sources and 33 primary coverage rows. |
| Disposable-clone SQL review | The parent’s independent disposable clone applied the exact reviewed SQL and passed 676 assertions. Baseline, SQL, integration map and checkpoint review bindings are recorded in `/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B13/SQL_INDEPENDENT_REVIEW.json` and WT `data/changesets/WCD-10/B13/CHECKPOINT_REVIEW.json`. |
| Actual apply and data review | `0048_wcd10_b13_author_works.sql` was applied exactly once with exit 0. The exact `migration_log` row binds TASK-118, reviewer `Codex-parent-independent-SQL-review` and the SQL hash. The parent’s actual-data review passed 686 checks. Baseline SHA: `74a900c2988eec78a700467bc70c5e523a774cd4fa615cfc5edfdd16991ff8f7`; final master SHA: `c7b5951beb2e2a30053b08d84e07931547b8909a1e5a180086fafeedebaea677`. |
| Master and table totals | SQLite integrity is `ok`, foreign-key errors are `0`, schema is `0.4`. Exact final totals and deltas from B12 are listed below. |
| Required QA wrapper | The source-read, zero-argument wrapper ran once. All 16 formal post-apply steps exited 0. The command ledger has exactly 17 commands: one apply plus those 16 steps. |
| Full migration replay | All 48 migrations replayed and all 19 tables matched; integrity is `ok`, foreign-key errors are `0`. Raw stdout SHA-256 is `3cf8d487e3857be112427ca8f269c1dac78c26cb204bd3ad7bfae4534903a060`; the separately formatted WT log SHA-256 is `e1a9d24d76f0a573715bfed5d0c7ddf631509189128b1b97899d6ae18f847112`. Formatting did not rerun replay. |
| Exports | JSON, CSV and XLSX each contain 19 tables. The repeat export produced 22 files byte-identical to the B13 checkpoint export. |
| Public boundary | Fixed-time Web Data/deploy and content-quality checks passed with `generated_at=2026-10-08T00:00:00Z`. All 177 before/after public deployment files are byte-identical; public totals remain 127 objects, 139 routes and 82 anecdotes. No new B13 entity is public. |
| Copied Web Data | `manifest.json` and `site_data.json` were copied byte-identically to `data/v2/web/`; the copied Web Data passed validation. |

## Exact final table totals and deltas

| Table | Final rows | Delta from B12 |
| --- | ---: | ---: |
| `card_facts` | 2253 | 104 |
| `card_sources` | 1362 | 45 |
| `content_cards` | 672 | 33 |
| `entities` | 682 | 24 |
| `entity_id_map` | 680 | 24 |
| `fact_sources` | 2768 | 112 |
| `facts` | 2274 | 104 |
| `gaps` | 498 | 36 |
| `legacy_relation_groups` | 15 | 0 |
| `metadata` | 16 | 0 |
| `migration_log` | 48 | 1 |
| `n3_decisions` | 4 | 0 |
| `relation_hold_evidence` | 58 | 0 |
| `relation_holds` | 51 | 0 |
| `relationship_evidence` | 984 | 32 |
| `relationship_sources` | 1013 | 32 |
| `relationships` | 651 | 24 |
| `source_holds` | 4 | 0 |
| `sources` | 722 | 22 |

The checkpoint QA report is WT `work/wcd10-qa/B13_CHECKPOINT_QA.json`, SHA-256 `7cda37b63df9febfe9fb88bb07d07b09cfa0bf2e68d4593a703f246f560aa983`. The execution report, resolved commands, Python runtime, exit codes, raw stdout/stderr and hashes are `/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B13/INTEGRATOR_APPLY_QA.json`. The parent’s actual-data review is `/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B13/ACTUAL_DATA_INDEPENDENT_REVIEW.json`.

B13 added 24 works/collections, 104 facts, 24 CREATED relations, 22 sources, 33 Research cards and 36 gaps. Nine existing works remain intact. Three questions remain deferred: the possible distinct coauthored work object and dual author roles for *Consejos de un discípulo de Morrison a un fanático de Joyce*; unresolved *Jaulario* identity; and the 1999/2000 *Formas breves* archive-year discrepancy, with atomic first-publication year blank and a source-limited note. The year discrepancy remains unresolved. No exhaustive completeness claim is made; catalog-only limits, uncertain dates and ordinary source boundaries remain explicit.
