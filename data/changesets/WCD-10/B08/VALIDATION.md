# WCD-10 B08 validation ledger

2026-10-12 · TASK-113 · Research-only bounded acceptance under DEC-070.

| Check | Actual result |
| --- | --- |
| Author/source review | Frozen Quiroga R5, Machado R6 and Rosa R5 independent PASS reused; literary candidate, source registration and matrix unchanged from prior approved package. |
| Batch admission | Parent aggregate review and full-roster validator PASS; candidate124 sources/91 objects/323 facts/91 CREATED/16 deferrals. Coverage103 evidence rows=100 primary+3 preserved old snapshots. |
| Prepare | Luna prepare exit0. Three previous real failures and all predecessor packages preserved; R3 completes15 coverage interfaces without changing literary candidates. |
| SQL clone | Parent applied exact0043 to disposable B08 baseline and read back facts, source chains, cards, role descriptions and old19-table records; PASS. Proof/builder aliases retained without reordering. |
| Actual apply | Luna applied once, exit0; exact approved SQL/map and reviewer matched migration log. |
| Master and replay | SQLite integrity ok, FK0, schema0.4; full43-migration replay has19 equal tables. |
| Exports | JSON/CSV/XLSX each19 equal tables; independent22-file repeat byte-identical. |
| Public boundary | Fixed generated_at2026-10-08T00:00:00Z;177 public files byte-identical,127 public objects,139 routes,82 anecdotes,0 new research objects public. |
| Internal Web Data | Validated AFTER site_data/manifest copied byte-identically to data/v2/web. |
| Applicable tests | No product/tool changes. Browser matrix and unrelated engineering tests not repeated per DEC-070; their old PASS is not claimed as a new test run. |
| Preserved failed checks | First inline parent guard assumed only two new interface fields; corrected to full approved interface additions and exact old-field preservation. One content-quality command used Web Data instead of its Curation input, exit1; original log retained, correct PUBLIC_CONTENT input exit0. |

Actual post database SHA: `af6c293aa32d86143f2be6f4c4ed414799086f8878df22b13a7356397ebd6050`. Totals:599 entities/1893 facts/568 relationships/656 sources/543 cards/356 gaps. Added91 entities/323 facts/91 relationships/112 sources/100 cards/86 gaps;116 candidate sources mapped, including4 old-source reuses. Eight deferred-only sources receive no formal ID.

SQL SHA: `b71c94b09d41ce019bacabb2efc69afcaeff110b20c67480a06bcb6e52d8bd15`. Mapping SHA: `51ca756a7aed18caba1b2ee9ad2006a15fe10c9486f35eeddc8e6b99db7c6ddb`. Checkpoint QA SHA: `3d768a478a71beeec086e2f98448eee78e1072300de461fbdfcbd2290ce41232`. Full actual command/exit/hash record remains in the local ignored B08 workspace; independent formal execution bindings are in [EXECUTION_REVIEW.json](./EXECUTION_REVIEW.json) and [CHECKPOINT_REVIEW.json](./CHECKPOINT_REVIEW.json).

Reasonable gaps and16 deferrals retained. This is an actual local research checkpoint, not exhaustive scholarship or completion of all61 authors. W03 object/version-note/CREATED backfill remains required with atomic1972/1974 choice explicitly undecided; it may proceed without a year. Controlled same-object coauthor re-entry remains required: B07 objects0493/0494 and B08 objects0591/0592. Research1.5.0 development, Schema0.4, Web Data0.3, Web0.6.0, Curation and Public Release pause remain unchanged. No Git commit/push/merge/release/deploy.
