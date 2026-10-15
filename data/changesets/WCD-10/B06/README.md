# WCD-10 B06 checkpoint

**Date:** 2026-10-08 · **Task:** TASK-111 · **Status:** PASS / bounded Research execution acceptance; parent independent final review complete. This is an internal Research checkpoint, not a new formal Data release.

The admitted batch contains 28 work/collection objects and zero author entities, 117 facts, 28 `CREATED` relationships, 37 cards, 50 new sources, and 43 gaps. The 59 source candidates include eight reuses and 51 non-reuse candidates; 50 source rows were created. S219 (`Cuatro para Delfina`) remains deferred-only: it has no assigned source ID or source row. Coverage includes 38 existing/new objects. Eighteen deferred items and the scoped B-only research gaps remain recorded.

The parent approved the merged candidate gate and exact SQL/map. Migration `0041_wcd10_b06_author_works.sql` was applied to the implementation master; the actual master is SHA-256 `ea9e01b41b4faaef727a6159b6d34ba7d9121a9992fda1cb993c6574f91f6a27`. Parent independent review verified the exact SQL on a clone and the actual 19-table database. Exported checkpoint files are in `data/exports/wcd10-b06-checkpoint/`; the prior B01–B05 snapshots remain separate.

Execution QA passed: 154 Python `unittest` checks, 41-migration replay, master and Web Data validators, all 19 tables in JSON/CSV/XLSX, a 22-file deterministic export repeat, and the reviewed-checkpoint QA. The fixed-parameter public bundle has 177 files byte-identical to the B06 before bundle; no new B06 entity appears publicly. Chromium desktop and mobile each report 30 passed plus two existing WCD-08 preview skips, for 60 passed / four allowed skips / zero unexpected failures.

The public bundle builder exited 0 but produced an empty derived copy of `assets/portraits/v1-ent-0213.jpg`. The source, B06 before bundle, and B05 after bundle all had 94,777 bytes and SHA-256 `c575c0fe309aeefff7c16a8335c96b595b71bb8e53aadb3d6f6987889d784041`. Only the generated B06 after copy was restored from that source; the first failing QA report is retained, and the parent independently reran the generic checkpoint QA successfully. The record does not infer why the builder wrote the empty copy.

The first browser attempts are also retained, including the local HTTP connectivity failure (`net::ERR_EMPTY_RESPONSE`) and the retry with an incomplete run. The final serial Chromium runs used a local server with its access log redirected to a file after verifying all 177 HTTP response bodies against their local file lengths. This sequence passed; it does not establish a cause for the earlier intermittent response failure.

Research 1.5.0 development train, Schema 0.4, Web Data 0.3, Web 0.6.0, Curation, and public scope are unchanged. Final independent parent review and governance synchronization passed. TASK-111 has bounded acceptance; B07 inventory/research is unlocked and B08+ retain their sequential dependencies. W03 policy and actual re-entry remain required before WCD-10 stage acceptance.

See [VALIDATION.md](VALIDATION.md) for actual commands and evidence, and [AUDIT.md](AUDIT.md) for the preservation and review boundaries.
