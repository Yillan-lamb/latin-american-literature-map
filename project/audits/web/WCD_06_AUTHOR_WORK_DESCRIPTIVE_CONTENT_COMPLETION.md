# WCD-06 Author & Work Descriptive Content Completion

- Date: 2026-08-31
- Baseline: `main@f47ab5793101f85437a793ab45cd0e241ad6cc73`
- Research: `Data 1.4.0 development candidate`
- Research Schema: `0.4`
- Web: `0.3.2 Development` → `0.3.3 Development`
- Web Data Schema: `v2-web-0.2`
- Public Release: `PAUSED BY USER`

## Baseline

The deterministic preflight covers 61 authors and 168 curated works. In the
reader-content package, author fields were 100 auto-approved / 492 user-review /
7 hold; work fields were 248 / 1191 / 13. Primary coverage was 15 public and 46
review `reader_lede`, plus 60 public and 108 review `story_intro`.

WCD-04's 302 page routes remained the page-level baseline: 25 PUBLIC_STRONG,
23 PUBLIC_BASIC, 45 PUBLIC_BIBLIOGRAPHIC_COPY, 150 high-judgment review, 5
low-judgment review, 26 missing, 23 research-insufficient, and 5 hold.

## External AI Rebase

The two external directories were read-only. All 1723 field candidates were
rebased into `EXTERNAL_WCD06_REBASE.csv`: 1430 STILL_VALID, 11 CHANGED, 203
DUPLICATE, 49 CONFLICT_WITH_CURRENT_CURATION, 18 OUT_OF_SCOPE, 9
CONFLICT_WITH_WCD04_ROUTING, and 3 NEEDS_REVIEW.

`EXTERNAL_READONLY_SHA256.csv` records every file path, size, and SHA-256 in both
ignored external directories and is regenerated for final no-change comparison.

The apparent 74-versus-5 discrepancy is not a count conflict. The external 74
are field-level candidates; WCD-04's five are page-level routes and all five are
places. Under the current validator, 44 signature-keyword rows and five other
interpretive fields are high judgment. They therefore cannot be batch-promoted.

## 06A Review Queue Recovery

All 74 external low-judgment candidates were decided individually:

- 12 directly evidenced `location_note` fields were promoted;
- 52 interpretive fields remained USER_REVIEW;
- 9 bibliographic `story_intro` fields were routed to rewrite or research;
- 1 place row was out of the author/work scope.

Eight promotions preserve their original wording; four were narrowed after the
first independent review. All 12 preserve or tighten the original evidence
boundary. Negative or governance-facing location copy was not promoted merely
to improve a count.

## 06B Bibliographic-copy Rewrite

Of the 45 WCD-04 bibliographic pages, nine author `reader_lede` fields received
evidence-bounded rewrites. The proposed work rewrites for 《逃亡计划》 and
《丛林故事》 were withdrawn after independent review because current admitted
Research supports bibliography but not a source-free object-specific premise.
The remaining 36 pages are registered as gaps. The accepted rewrites avoid
source-name narration and do not introduce plot, movement, award, or comparison
claims absent from current Research.

## 06C Core Zero-content Work Remediation

Two current entities had sufficient object-level material for a minimum public
description and were added to formal Curation:

- `V1-ENT-0019` 《家庭纽带》;
- `V1-ENT-0146` 《最明净的地区》.

Each addition contains `story_intro`, `narrative_features`, and `location_note`
with field-level fact/relation/source references. The other 24 missing routes
remain research gaps. In particular, 《霍乱时期的爱情》《族长的秋天》《绿房子》
have useful bibliography or new place relations but still lack an admitted
object-level premise; 《燃烧的原野》《虚构集》 and similar research-gap cards were
not promoted from page emptiness alone.

## 06D Author Profile and Literary Connections

Nine author introductions now foreground concrete identity, career, birthplace,
form, or work sequence rather than source catalogues. No `literary_connections`
field was auto-approved: the current network contains creation and place links,
but not enough explicit movement, influence, or comparison evidence for that
high-judgment field. Nine author-connection gaps are handed forward.

## 06E Research Gap Handoff

`WCD06_RESEARCH_GAPS.csv` contains 69 traceable rows: 36 unresolved
bibliographic descriptions, 24 zero-content objects, and 9 high-judgment author
connections. These are research inputs, not approved WCD-07 entities. Major-work
candidates from the external WCD-07 package were not imported or executed.

## After

| Measure | Before | After |
|---|---:|---:|
| curated authors | 61 | 61 |
| curated works | 168 | 170 |
| author auto / review / hold fields | 100 / 492 / 7 | 100 / 492 / 7 |
| work auto / review / hold fields | 248 / 1191 / 13 | 266 / 1179 / 13 |
| public authors | 25 | 25 |
| public works | 60 | 62 |
| public places | 32 | 32 |
| search entities | 126 | 128 |

Primary coverage is now 15 public / 46 review / 0 missing author ledes and 62
public / 108 review / 0 missing story introductions inside the 170-object
curation package. Across the reader-content package, 1694 wrappers remain
USER_REVIEW; no high-judgment field was leaked into public output.

## Version Decision

Research master, migration chain, Data version, and Schema are unchanged. Web
advances by patch from 0.3.2 to 0.3.3 because two additional existing work pages
and eleven revised introductions are reader-visible. Product scope, page types,
routes, and Web Data schema are unchanged, so 0.4.0 is not warranted.

## Independent Review

Fresh-context reviewer identity: `CODEX-REVIEW-WCD06`. Round 1 returned REVISE:
four location notes were narrowed, two unsupported work rewrites were withdrawn,
and premature PASS/DONE records were corrected. Round 2 confirmed substantive
PASS but required two metadata corrections. Round 3 returned final PASS. The
reviewer did not draft or edit prose. All verdicts are stored under
`data/changesets/WCD-06/review/`.

## Validation

| Check | Result |
|---|---|
| Research master integrity / FK / Schema 0.4 | PASS |
| Curation deterministic rebuild | PASS, byte-identical |
| field-level Research and Source references | PASS |
| content-quality review package and public subset | PASS |
| Web deterministic rebuild at fixed timestamp | PASS, byte-identical |
| Web Data validator | PASS, 371 entities / 328 relationships / 298 sources / 93 place relations |
| deploy bundle and public boundary | PASS, 137 routes / 128 public entities / 0 review exposure |
| frontend syntax | PASS |
| Python unit tests | PASS, 24/24 |
| Playwright four-browser matrix | PASS, 84/84 |
| `git diff --check` | PASS |

The first master-validator invocation omitted its required database argument and
was rerun correctly. One deterministic Web comparison exposed a stale generated
file after a relationship-reference correction; rebuilding from the corrected
formal patch then passed byte-for-byte. Neither setup correction changed the
review boundary or Research data.

## Gate

```text
WCD-06 = DONE
WCD-07 = READY / NOT STARTED
Public Release = PAUSED BY USER
```
