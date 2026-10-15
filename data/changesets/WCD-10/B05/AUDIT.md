# WCD-10 B05 audit record

**Checkpoint:** 2026-10-07 · **Task:** TASK-110 · **Scope:** bounded B05 integration subset. This record supplements the preserved R1/R2/R3 package history; it does not rewrite those checkpoints.

## Decision and scope

The reviewed integration subset contains eight new work entities, 44 fact candidates, eight implicit `CREATED` relationships, and one `SET_IN` relationship. The 44 facts comprise 31 facts nested in new entities and 13 facts on existing entities. Coverage contains nine existing objects plus the eight admitted objects. The migration map resolves 14 inserted source rows, eight entity IDs, 15 cards, and nine relationships. The exact independent SQL review reports expected table deltas and a passing temporary SQL oracle.

W03 (`El mono gramático`) is **DEFERRED_NOT_ADMITTED / USER_POLICY_PENDING**, not cancelled or removed from the original WCD-10 objective. Its entire pre-policy proposal, four evidence rows, source/coverage trail, and 1972/1974 distinction remain frozen in `W03_DEFERRED_CANDIDATE.json`. ELEM 8815 records a 1972 French edition and a 1974 Spanish-original first edition; neither year is selected for `first_publication_year` until USER decides the field semantics. W03 has no formal entity ID, source ID for S18, facts, or `CREATED` in this subset. `V1-GAP-0123` is allocated once to the policy key `WCD10:B05:Paz:El_mono_gramatico:first_publication_semantics`; it records the unresolved obligation, not its resolution. W03 must undergo fresh re-entry and independent review before TASK-127 completion. Advancing these eight entities does not satisfy that requirement or complete the original phase target.

F16 (`WCD10-B05-F16`) is an append-only bibliographic correction candidate for `V1-ENT-0154/bibliographic_note`, supported by ELEM 205027: 1950 Cuadernos Americanos first edition and 1959 FCE other edition. The precise conflict review approves this addition. Historical `V1-FCT-0309`, its existing source link(s), and `HOLD-0043` are preserved; this does not claim that their provenance is repaired or that a structured supersession has been created.

## Review basis and boundaries

- The frozen external R1/R2/R3 materials remain historical inputs. R1/R2 reviews document earlier semantic and assertion revisions; R3 independently accepted the narrow W09 version-boundary repair. They are not replaced by this checkpoint.
- The 2026-10-07 source-delta review reopened ELEM 205027 for F16; ELEM 8815 for W03's edition distinction; FCE 2290 and 479 for current citation/profile alignment; and ELEM 5746 to compare against the previously reviewed W09 boundary. That delta review confirms evidence direction only. It does not claim that all 26 registered source pages were freshly opened in this turn.
- Current candidate, coverage, source registration, evidence matrix, W03 deferred record, and migration map are bound by `REVIEW_GATE.json` and `CHECKPOINT_REVIEW.json`. Candidate SHA-256: `5447e33567284bb7d60c7525674d67fd7da35a5505025f88e1510e0b7fcb8ffe`; baseline database SHA-256: `45e8d72c3656f762f4a34f664c822c33685be925b53553b91b19041d6835b47d`.
- The independent candidate/integration review is `PASS_BOUNDED_SUBSET`; the independent SQL/map review is `PASS` for the exact migration SHA-256 `6ba19bc5aaa9b688ef99aefdcba18c1f8407ffa1969b9727a6d1c22ae505eb4a` and map SHA-256 `179dbc2b01ff753e5d51464da7eab7f9affca3737c3d455ecec972578bd202c8`. These reviews cover the exact bounded delta and do not decide W03 policy or authorize calling W03 complete.
- The ordinary `MECHANICAL_CHECK.json` deliberately remains `fail` on the F16 same-object/same-field conflict. The exact, separately reviewed append-only conflict path is recorded in `REVIEWED_MECHANICAL_CHECK.json` and `REVIEW_GATE.json`; that scoped pass must not overwrite or be represented as the ordinary validator's result.
- Research-only boundary remains in force. No schema, Curation, public-scope, or reader-facing policy change is approved here.

## First actual QA failure and repair history

Migration 0040 has been applied to the implementation database. The first actual checkpoint QA **FAILED**: its exact migration-log reviewer check compared the SQL apply reviewer (`Codex-parent-independent-SQL-review`, matching `CHECKPOINT_REVIEW.json`) against the candidate-review reviewer (`Codex-parent-independent-review`, in `INTEGRATION_MAP.json`). This is a QA binding defect, not evidence that the log row or approved SQL is wrong. A narrowly scoped QA patch now passes all 16 portable reviewed-checkpoint tests on a disposable reconstructed B04 fixture, including the distinct candidate/SQL reviewer case and wrong/missing reviewer rejection. Parent review of that patch is pending; actual B05 QA has not been rerun. Post-fix exact QA, export/public rebuild, and browser verification remain **PENDING / NOT_VERIFIED**. No batch acceptance, TASK-110 completion, or phase completion is claimed.


## Final independent execution acceptance

Parent approved the exact reviewer-role patch after reading the code and running its 16 portable tests. Parent then actually reran the full Python suite: 154 PASS, exit0. Independent actual DB audit passed161 assertions, including all19 tables replayed from45e8 baseline with approved0040 and the independently bound actual SQL log; oldrows, all44 candidate values/sourceIDs, historical hash, FCT0309 and source links remained exact. Parent actual reviewed checkpoint QA passed all19 tables in JSON/CSV/XLSX, exact SQL/log,177 byte-identical public files and zero new entities public. Formal22-file checkpoint matches repeated exports; full internal Web Data rebuilt and validated.

Luna executed production Chromium desktop/mobile:60 PASS,4 explicit WCD08 preview-only SKIP,zero unexpected/flaky/errors,51.765s. Parent independently audited64 actual report records and applicable assertions; parent did not rerun browser or claim Firefox/WebKit/Lighthouse. Browser SHA `9fece5e56bbd6cb59c2e5611ac7d6b96cad788615df2d8925d767d219db30268`.

B05/TASK110 is accepted as a bounded batch,5/21 complete after governance synchronization. W03 remains unresolved, preserved and mandatory before phase acceptance. Only B06/TASK111 now unlocks. Final evidence is recorded in EXECUTION_REVIEW.json; master SHA0185f6c8. CHANGELOG/TASKS/README/masterREADME/hand-off updated; existing DEC060/069 and mandatory re-entry Spec retained, no new field policy or Charter change. No Git operation, release or public admission.
