# WEB-CE-B16 QA

日期：2026-08-22
状态：`PASS`

## Data and migration

- `0022_web_ce_b16_luna_max.sql` was rehearsed on a private copy before formal application and then applied to `data/master/V1_MASTER.sqlite`.
- Master validator: `PASS` (`schema_version=0.3`, no warnings).
- `PRAGMA integrity_check`: `ok`.
- `PRAGMA foreign_key_check`: empty.
- Final master counts: 353 entities, 955 facts, 281 relationships, 267 sources, 243 cards, 23 gaps.
- B16 delta: 12 entities, 36 facts, 12 relationships, 9 sources, 12 cards, 17 card-source rows, 12 relationship-evidence rows, and one open research gap (`V1-GAP-0023`).
- B16 Geo delta: three author–country relation rows (`V2-GEO-REL-074`–`076`); no new place entity and no fabricated coordinates.
- Approval metadata audit: 22 Research records and 90 curation field records checked; no pre-batch timestamps, reviewer-order violations, or unauthorized `reviewer=USER` values.

## Content and Web Data

- `validate_v2_content_quality.py data/v2/curation/PUBLIC_CONTENT.json`: `PASS` (58 authors, 159 works, 25 places; 159 distinct reading approaches; 10 review reading paths).
- Formal public scope remains unchanged from the B11–B15 baseline: 25 authors, 60 works, 26 places. B16 additions remain in the review package and are not public-approved content.
- Review package now contains 58 authors and 159 works; B16 adds three author entries and nine work entries, all `user_review`.
- Web Data rebuild with fixed `generated_at=2026-08-22T12:00:00Z`: `PASS`.
- Two independent fixed-time rebuilds were byte-identical; the formal `data/v2/web` output matched the rebuild.
- `validate_v2_web_data.py`: `PASS`.
- User-review preview build, public-bundle validator, and UI QA: all `PASS`; review queue is separate and not exposed as public content.

## Browser and engineering checks

- Chromium desktop/mobile Playwright: 34 tests passed.
- Cross-browser smoke (`qa_v2_browser.cjs`): Chromium, Firefox, and WebKit at desktop and mobile sizes all passed; all journeys returned HTTP 200, expected reader text, no console/page errors, and no governance language.
- The smoke harness had a stale About-page expectation (`这个项目是什么`); it was minimally corrected to the current stable heading (`为什么做一张`) and the full matrix was rerun successfully.
- `node --check site/app.js`: `PASS`.
- `git diff --check`: no whitespace errors in the B16 changes (pre-existing CRLF normalization warnings are confined to unrelated external delivery CSVs).

## Boundary and known gap

- No release, deployment, tag, or public approval was performed.
- `V1-GAP-0023` remains `open_research / SOL_REVIEW`: the 1989 Madrid edition and 1993 Tusquets citation for `Un viejo que leía novelas de amor` are both preserved without asserting an uncontested first-publication year.

## Batch gate

`BATCH_PASS` — B16 is closed and ready for the next batch Preflight.
