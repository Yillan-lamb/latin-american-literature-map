# WCD-10 wave-19 reentry candidate handoff

- Date: 2026-10-15
- Producer: GPT-6 Luna high, same-host subagent
- Task: TASK-127, DEC-069/070
- State: candidate package produced; parent independent review pending

## Baseline and candidate result

The actual read-only database at `work/codex-worktrees/latin-american-literature-map-wcd10/data/master/V1_MASTER.sqlite` has SHA-256 `559b1858b7b5e647b4b313f841be8d2960cf3a5eacf2a2dd92c6161668da706c`, 56 migration rows, and 19 tables. The actual B05 roster remains Paz (`V1-ENT-0059`), Asturias (`V1-ENT-0170`), and Allende (`V1-ENT-0171`). The refreshed closure records all 17 existing works for those authors, with full baseline snapshots and source/evidence/card/relation/hold/gap links. The actual builder `classify_coverage_objects` contract also passed read-only: 35 input rows, 18 primary rows and 17 full legacy wrappers, with wrapper `research_status` synchronized to each main row while inner historical closure values remain unchanged; raw command streams and argv are in `COVERAGE_CLASSIFICATION_EXECUTION.json`.

The ordinary candidate validator passed with no errors: 3 source candidates, 1 new work, 3 facts, and the implicit `CREATED` candidate. Existing source URLs resolve to full-row reuse `SRC-0099` and `SRC-0300`; ELEM S18 is the only new source candidate. The validator is mechanical and does not replace independent review.

W03 is represented as candidate `WCD10-B05-W027` while the original temporary identifier `WCD10-B05-W03` and the four original evidence rows remain preserved verbatim in `ORIGINAL_W03_DEFERRED_CANDIDATE.json` and the copied original B05 evidence matrix. The candidate has a form, a bounded summary, and an edition note separating the 1972 French translation from the 1974 Spanish-original edition. Its atomic `first_publication_year` is omitted under DEC-070. The actual existing row `V1-GAP-0123` is preserved; the old deferred key is not submitted for a duplicate gap. No formal entity or relationship ID is allocated.

The Amado file is a separate controlled append attachment for `V1-ENT-0172 CREATED V1-ENT-0591`. It reuses existing work `O mistério dos MMM` (`entity_type=work`) and source `SRC-0652`; the bounded role is one of ten chapter authors, with no chapter guessed. No new object, source, fact, card, or formal relationship ID is created. This cross-batch edge is outside the fixed-author ordinary validator's claim. Telles `V1-ENT-0358 → V1-ENT-0592` is read-only confirmed as existing `V1-REL-0762`; no duplicate candidate is present.

## Source access and limits

ELEM 8815, Nobel bibliography, and Nobel biography are successful historical B05 accesses dated 2026-10-07. Their validator-required `access_status: OPENED` records that historical success only; none claims fresh 2026-10-15 access. The parent’s 2026-10-15 ELEM reopen returned Timeout. The parent freshly opened the SRC-0652 PDF on 2026-10-15; its direct locator is PDF p.4 / printed p.557 / lines 134–156, as recorded in `project/internal/WCD_10_WORKSPACE/FINAL_REENTRY/PARENT_SOURCE_READS.json` (web.open `turn0view1`); the wave-18 historical extract is not represented as this fresh access.

The preserved old coverage rows are marked `preserved_existing`, and their complete current gaps are included in closure snapshots, avoiding builder-created duplicate work-level gaps for existing objects. W03 remains `institutional_commentary`; ordinary builder behavior may create a distinct generic work-level research gap for the new work. Parent should distinguish that from the existing field-policy gap `V1-GAP-0123` during independent review.

## Validation and handoff

`VALIDATOR_EXECUTION.json` freezes the actual argv, cwd, Python runtime, exit code, and raw stdout/stderr hashes; `VALIDATOR_STDOUT.raw` and `VALIDATOR_STDERR.raw` preserve the streams. `VALIDATOR_REPORT.json` records the actual validator output. The parent reviewer/integrator must perform its own semantic and package review. No migration prepare/apply, master database write, worktree write, Git action, install, release, publication, or automation operation occurred.
