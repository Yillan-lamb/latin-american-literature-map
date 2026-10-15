# WCD-10 B09 validation ledger

2026-10-12 · TASK-114 · Research-only bounded acceptance under DEC-070.

| Check | Actual result |
| --- | --- |
| Direct content/source review | Parent independently opened ordinary source pages/PDFs, checked object titles, years, authorship and bounded descriptions. Ramos R1 narrow corrections and Darío full collection title retained. |
| Batch admission | Exact Ramos R1 → Vallejo → Darío merge and full-roster validator PASS:8 new objects/42 facts/8 CREATED/9 candidate sources.17 primary coverage rows plus3 old snapshots; no deferred candidates. |
| Prepare | Sole Luna Integrator prepare exit0; master remained the pinned B09 baseline. |
| SQL clone review | Parent actual disposable clone apply and328 source/fact/card/role/old19-table checks PASS. |
| Actual apply/data review | Luna applied approved0044 once, exit0. Parent333 actual-data/evidence checks PASS, including exact42 fact aliases and8 author relations. |
| Master | SQLite integrity ok, FK0, Schema0.4;607 entities/1935 facts/576 relationships/660 sources/560 cards/373 gaps. |
| Full migration replay | Separate validator actually replayed44 migrations from V1.0.0;19 tables equal, integrity ok/FK0. |
| Exports | JSON/CSV/XLSX each19 tables equal. Independent22-file repeat byte-identical. |
| Public boundary | Fixed generated_at2026-10-08T00:00:00Z;177 deployment files byte-identical,127 public objects/139 routes/82 anecdotes,0 new research objects public. |
| Internal Web Data | Both validated AFTER JSON files copied byte-identically to data/v2/web and revalidated. |
| Applicable tests | No product/tool changes. Browser matrix and unrelated engineering tests not repeated per DEC-070; old test runs are not claimed as current. |
| Preserved corrections | Parent optional-proof-ID comparison and formatted-log/raw-stream guard errors corrected without input changes. Initial generic QA verified only0044 against its baseline; omitted full replay was run separately, and original command report/log retained. |

Actual post database SHA: `41f895012a71cec9cab831e1717e5f3ec0306100d95acf2ac34c9eccac5a4d3b`. B09 adds8 entities/42 facts/8 relationships/4 sources/17 cards/17 open gaps. Five existing sources are reused unchanged. Nine existing works and their complete old source chains, all prior cards, holds and gaps remain.

SQL SHA: `82f99b8c8d185fef52695e07f12237d616afd5f7d8dde3b8b0e97ca7d7cfad2b`. Mapping SHA: `3f9ac782fd367cf0821d7f806b784becf60d4370421651fc0b4bf12b85063f95`. Checkpoint QA SHA: `3012feceaa03e80a22d2b74ae5eeb44ec5fe12566a347b96da10eac82b0fca20`. The full command/exit/output records and predecessor reports remain in the local ignored B09 workspace. Independent formal bindings are in [EXECUTION_REVIEW.json](./EXECUTION_REVIEW.json), [CHECKPOINT_REVIEW.json](./CHECKPOINT_REVIEW.json) and [INTEGRATION_MAP.json](./INTEGRATION_MAP.json).

Source-access limit: the parent could not reopen the BNP catalog record used by Vallejo W102; the worker directly opened it, and the parent independently corroborated the title/year1939 in the Casa de la Literatura publication-history page. Parent access to that particular BNP URL is NOT_VERIFIED; it is not represented as a successful parent reopen.

This checkpoint completes27 of61 authors in9 of21 batches with reasonable gaps retained. B10—B21, W03 actual object/version-note/CREATED backfill with atomic1972/1974 choice still undecided, and same-object coauthor re-entry0493/0494/0591/0592 remain stage obligations before TASK-127. Research1.5.0 development, Schema0.4, Web Data0.3/Web0.6.0 and Public Release pause remain unchanged. No Git commit/push/merge/release/deploy.
