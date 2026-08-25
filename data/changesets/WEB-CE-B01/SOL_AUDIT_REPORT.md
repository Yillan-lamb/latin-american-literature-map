# SOL Audit Report — WEB-CE-B01

**Audit ID:** `SOL-AUDIT-WEB-CE-B01-REMEDIATION`
**Audit date:** 2026-08-20
**Git baseline:** `origin/main @ c1881f36ce63280ba29358bec37cdf4803960f38`
**Result:** `PASS WITH REMEDIATION`

## Scope

The task request described a five-Batch audit, but the worktree and repository contain only one complete Batch boundary: `WEB-CE-B01`. `project/tasks/V2_TASKS.md` also records `NEXT_BATCH_NOT_STARTED=true`. No B02–B05 handoffs or migrations exist. This report therefore audits the actual accumulated B01 delta and records the mismatch as `SCOPE_DRIFT`; it does not represent absent Batches as completed.

The original Hy3 branch was based before the independently reviewed Fuentes R1 work now on `main`. Directly committing that branch would have replaced accepted mainline data. Integration was therefore reconstructed against the current main baseline, preserving the accepted Fuentes R1 records and applying the valid B01 remainder through a new append-only migration.

Untracked MCP/CodeBuddy settings, browser artifacts, dependency changes, and local absolute-path files in the original worktree are `OUT_OF_SCOPE_WORKTREE_CHANGE` and are excluded from the audited unit.

## Actual Delta

Machine-reconstructed accepted delta relative to the current main baseline:

| Batch | Authors | Works / collections | Facts | Relationships | Sources | Cards | Geo places | Geo relations | Curation entries | Holds |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| WEB-CE-B01 | 1 | 18 | 81 | 23 | 34 | 20 | 1 | 6 | 3 | 10 |
| B02–B05 | NOT_PRESENT | NOT_PRESENT | NOT_PRESENT | NOT_PRESENT | NOT_PRESENT | NOT_PRESENT | NOT_PRESENT | NOT_PRESENT | NOT_PRESENT | NOT_PRESENT |
| **Total accepted** | **1** | **18** | **81** | **23** | **34** | **20** | **1** | **6** | **3** | **10** |

The accepted database grows from 147 to 167 entities, 273 to 354 facts, 78 to 101 relationships, 94 to 128 sources, and 43 to 63 content cards. The two empty Nobel event shells from the Hy3 branch are not integrated. One duplicate Nobel-language URL and two unused sources are consolidated/omitted, so the accepted source count differs from the hand-written Batch reports (`REPORT_DRIFT`).

Web projection grows from 10 to 13 public authors, 17 to 24 public works/collections, and 19 to 21 public places. The research database still contains additional `research_gap` entities that are intentionally not exposed as complete public pages.

## Audit Method

- Read the charter, task ledger, data-maintenance manual, product specification, Chinese-display-title roadmap, current SQLite master, all B01 handoff/review/research/QA files, both B01 migrations, Geo, Curation, Web Data, and frontend projection paths.
- Rebuilt the delta from SQLite rows, migrations, files, and generated Web Data rather than trusting report totals.
- Checked 100% of 23 accepted relationships, 10 new holds, 6 Geo relations, all new source identities/tier labels/duplicate keys, all Chinese display-title rows, all high-interpretation claims, and all content fields crossing the Research/Curation/public boundary.
- Reopened primary or institutional pages for the disputed/high-risk claims. Sampled ordinary bibliographic facts across Mistral, Paz, and Fuentes/Aura; the sample covered identity, publication year, title, birthplace, and direct `CREATED` relations. The sample was expanded when the Paz influence note and Aura edition claim failed support matching.
- Re-ran SQLite integrity/foreign-key/master validation, deterministic exports, content-quality validation, Web Data rebuild/validation, syntax checks, frontend tests, and browser checks after remediation.

## Findings

### P0

None.

### P1

1. **Unsupported claim bundling:** the Paz career fact appended a strong multi-tradition influence list not supported by its cited Nobel facts page. The unsupported clause was removed.
2. **Unsupported edition detail:** the Aura fact added English translator/publisher metadata not directly established by its cited ELEM/Internet Archive records. The nonessential edition clause was removed.
3. **Public-content gate bypass:** Aura had been manually inserted as wholly `auto_approved` content despite unsupported “masterpiece,” “magical realism entry,” and recommendation language. Factual fields were rebuilt from admitted Research Data; interpretive/editorial fields remain `user_review`.
4. **Website public-scope regression:** the builder recognized only the new content-field shape, silently removing the previously approved 10-author/17-work baseline from search. The builder now accepts both valid v0.3 shapes and treats collections as works; the validator now protects baseline IDs as a subset rather than freezing stale exact counts.

### P2

1. **Geo overstatement:** Paz–Mexico City was stronger than the cited evidence and is now limited to documented birth/death. Aura's Mexico City confidence is reduced from high to medium. The inferior pre-R1 Fuentes Geo relation is not integrated.
2. **Source governance:** Nobel institutional web pages are normalized to tier B under the current manual. Duplicate language/entry URLs for the same Nobel facts page are consolidated.
3. **QA coverage gap:** two validators contained exact legacy counts and therefore either rejected legitimate growth or could be patched to an equally stale new number. They now enforce accepted baseline preservation plus dynamic expansion checks.

### P3

- Several interpretive links remain in HOLD pending a second independent scholarly source. This is expected and does not block continued expansion.
- Country/genre/region balance remains a roadmap-level concern, not a reason to manufacture content in this audit.

## Remediation

- Added append-only migration `0004_web_ce_b01_sol_integrated.sql`; historical migrations remain unchanged.
- Preserved the accepted Fuentes R1 data already on main and integrated only non-conflicting B01 records.
- Removed/weakend unsupported Paz and Aura clauses; omitted empty event shells; consolidated duplicate/unused sources; normalized source tiers.
- Corrected Geo descriptions/confidence and retained fictional-space no-coordinate safeguards.
- Rebuilt Curation and PUBLIC_CONTENT from the admitted database. Editorial judgments remain in the review queue.
- Repaired Web Data scope generation and both growth-sensitive validators; regenerated exports, coverage plan, and site data.
- Repaired the Mexico City label collision and added B01-specific author/work/collection/Geo browser assertions. Final matrix: 56/56 passed across Chromium desktop, Chromium mobile, Firefox desktop, and WebKit mobile; all 64 sitemap routes rendered without governance-language leakage.

## Hy3 Quality Assessment

Hy3 did not show a system-wide SQLite integrity failure or a general pattern of fabricated entities. Migration structure and basic bibliographic capture were mostly stable. However, the run showed repeatable overreach at the boundary between plausible literary interpretation and directly supported evidence, plus an unsafe tendency to auto-approve projection prose. Geo was broadly correct but needed confidence/wording calibration. The Chinese-display-name strategy was substantially correct: original titles remain anchors and missing translator/publisher/ISBN metadata is not treated as a blocker.

Engineering QA was not independently trustworthy before this audit because hard-coded counts masked/caused coverage drift and the public-scope regression was not asserted. After remediation, the database and projection pipeline are safe to extend.

## Remaining HOLD / Research Gaps

- 10 new relationship candidates remain in HOLD, principally influence/theme/location interpretations awaiting stronger or second-source support.
- Existing project-level gaps remain unchanged; no gap was promoted merely to make the website appear fuller.
- Editorial reading-route, theme, significance, and recommendation fields introduced in B01 remain `user_review` where they exceed direct Research Data.

## Next-cycle Guidance

Hy3 may continue for the next cycle, with a small prompt adjustment:

1. Do not mark interpretive public copy `auto_approved`; only project admitted factual fields automatically.
2. Quote or pinpoint the exact supporting passage before admitting influence/theme/significance language; otherwise HOLD it.
3. Run growth validators against preserved baseline IDs, never by replacing one exact expected count with another.
4. Do not make Git commits during Batch production, and always start the next Batch from the current audited mainline.

Roadmap suggestion only: keep the next selection attentive to Brazil, the Caribbean, the Andes, Central America, women writers, poetry, and drama. No rewrite of the 60+ roadmap is required.

## Final Gate

`PASS WITH REMEDIATION`: no P0 or unresolved P1 remains. This audited unit may proceed to branch, commit, push, and PR. It does not authorize merge, release, tag, Pages production, or production deployment.
