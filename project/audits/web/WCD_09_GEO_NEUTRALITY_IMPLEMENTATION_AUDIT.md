# WCD-09 Geographic Neutrality Implementation Audit

- Task: `TASK-099 / WCD-09`
- Audit date: 2026-09-08
- Integration base: `origin/main` at `9e1572633cf51f80dc09391e717efdb71f8fdf35`
- Candidate branch: `codex/wcd09-map-implementation`
- Audit scope: implementation only; the earlier research-package audit remains separate
- Verdict: **READY FOR USER REVIEW / MERGE**

## 1. Executive result

The implementation executes the 17 recorded USER Gates and maps every CH-01 through CH-25 item to exactly `DONE` or `BLOCKED`. The active site now loads the versioned Natural Earth 50m derivative, projects it with parameterized LAEA centered at 75°W / 11.5°S, and separates 48 L1 background geometries from 13 L2 interactive country codes. The previous 110m asset remains available only for rollback.

No open implementation defect remains at BLOCKER, MAJOR or MINOR severity:

| Severity | Open | Result |
| --- | ---: | --- |
| BLOCKER | 0 | PASS |
| MAJOR | 0 | PASS |
| MINOR | 0 | PASS |
| NOTE | 3 | Controlled evidence/release boundaries listed in section 7 |

## 2. Audit method

The audit independently compared the candidate implementation with `14_GIT_BACKLOG.md`, the recorded ledger in `15_USER_DECISION_GATES.md`, the source/coordinate/name/license evidence, and the current public-data boundary. It then:

1. rebuilt the basemap from the pinned upstream ZIP and byte-compared the output;
2. recomputed feature, polygon-part, bbox, stable-ID and SHA-256 values;
3. recomputed the selected projection's direction, principal-axis and area metrics at seven audit points;
4. inspected active asset routing, L1/L2 state, canonical IDs, names, tooltips, disclaimers and licenses;
5. rebuilt complete Web Data and a production-shaped static bundle;
6. ran Python, package, public-boundary and four-browser acceptance suites;
7. visually inspected desktop and 390 px mobile captures.

## 3. USER Gate compliance

| Gate | Implemented result | Audit |
| --- | --- | --- |
| A-1 | Natural Earth Admin 0 Countries 50m | PASS |
| A-2 | 10 weak GeoNames references converted; 6 permanent URLs normalized; Chiapas unchanged | PASS |
| A-3 | Release, date, source/archive SHA, transformation chain and output SHA recorded | PASS |
| B-1 | LAEA, center 75°W / 11.5°S, uniform viewport fit | PASS |
| C-1 | No-content regions remain non-interactive L1 with explicit legend | PASS |
| C-2 | Trinidad and Tobago remains L1-only | PASS |
| C-3 | France geometry supplies French Guiana as France-related background, not a new country entity | PASS |
| C-4 | USA southern land remains out; scope note is visible | PASS |
| C-5 | Madrid and Paris remain available through non-map routes and never enter the SVG focus order | PASS |
| C-6 | Approved Caribbean geometries enter L1; no evidence-free L2 promotion or status prose | PASS |
| C-7 | South Georgia, Navassa and Clipperton remain out of the 50m asset | PASS |
| C-8 | L1 uses the selected historical-cultural Latin America scope | PASS |
| D-1 | Falkland/Malvinas dual-name and tooltip remain suppressed pending verified Chinese-name evidence and ordering | PASS |
| D-2 | Natural Earth de facto linework retained; no unverified dispute overlay added | PASS |
| D-3 | All six sensitive cases follow the recorded safe no-annotation path | PASS |
| D-4 | Fixed neutrality disclosure and complete source attribution appear on the map and About page | PASS |
| E-1 | No mainland-China release implementation or compliance conclusion; professional assessment remains prerequisite | PASS |

## 4. CH-01—CH-25 status matrix

| CH | Status | Verified implementation/evidence |
| --- | --- | --- |
| CH-01 | DONE | Versioned NE 50m active asset and source metadata |
| CH-02 | DONE | France feature contributes French Guiana only as an aria-hidden L1 background |
| CH-03 | BLOCKED | Approved geometry is present, but NAME-31—37 remain unnamed/non-interactive because their primary Chinese-name evidence is `CANNOT_VERIFY` |
| CH-04 | DONE | C-4/C-7 keep-outs and visible neutral scope statement |
| CH-05 | DONE | Deterministic explode/select/quantize/stable-ID/regroup builder; source and output SHA checks |
| CH-06 | DONE | Old 110m file retained; active filename includes 5.1.1 and 50m |
| CH-07 | DONE | Parameterized LAEA and uniform SVG fit; four projection acceptance dimensions pass |
| CH-08 | DONE | Old hard-coded country pixel overrides removed; source label coordinates are projected and collision-adjusted generically |
| CH-09 | DONE | Eight place-ID CSS hide rules removed; point labels use data-driven collision suppression |
| CH-10 | DONE | All retained geometry and in-window points fit; Madrid/Paris are confirmed out of the map window |
| CH-11 | DONE | No Madrid/Paris map DOM or invisible focus target |
| CH-12 | DONE | Canonical Brazil is `V1-ENT-0183`; Rio parent is rewritten and browser interaction remains populated |
| CH-13 | DONE | Required 10 conversions and 6 normalizations complete; the mandated Chiapas subcase remains blocked without fabricated ID |
| CH-14 | DONE | 35 no-content L1 backgrounds are non-interactive and explained in the legend |
| CH-15 | DONE | Puerto Rico exposes Chinese name only; no unverified political-status prose |
| CH-16 | BLOCKED | All active tooltips are Chinese, while Falkland dual-name and seven unverified Caribbean labels remain suppressed as Gate D-1/NAME-31—37 require |
| CH-17 | DONE | De facto baseline plus fixed disclosure; no unsupported case annotation or final-demarcation claim |
| CH-18 | DONE | SVG title/description and visible scope text match the selected range |
| CH-19 | BLOCKED | Mainland-China publication remains blocked until the E-1 professional assessment exists; no technical release change was made |
| CH-20 | DONE | LICENSES records NE release, retrieval date, transformation script/steps and hashes |
| CH-21 | DONE | Map and About attribution identify NE 50m 5.1.1/PD and GeoNames/CC BY 4.0 |
| CH-22 | DONE | The only new geometry asset is covered by the verified NE public-domain source; no new overlay asset was admitted |
| CH-23 | DONE | Browser assertions separately enforce 48 L1, 13 unique L2 codes, 35 no-content and zero duplicate interactive codes |
| CH-24 | DONE | Mechanical and browser gates cover bbox/fit, NaN, blocked names/tooltips, off-map focus, neutral wording and all projection metrics |
| CH-25 | DONE | L1 uses dashed outlines and non-interactive semantics in addition to color; interactive fill/water graphical contrast is at least 3:1 |

The three `BLOCKED` rows are faithful execution of explicit USER Gate/evidence boundaries, not unresolved defects in the delivered implementation.

## 5. Mechanical results

| Check | Recomputed result |
| --- | --- |
| Upstream archive SHA-256 | `5fed433373581fa648920435f937d95f2d3c0200e067409c6478dcdf1b853139` |
| Output asset SHA-256 | `9a225c6be6b217bf67ab4ed687598563e8d7c405a827bcca78ede99439c67cd6` |
| L1 features / polygon parts | 48 / 180 |
| L2 unique country codes / no-content L1 | 13 / 35 |
| LAEA `ew_ns_scale_ratio` | 0.9574916821–1.1438021748 |
| LAEA `principal_axis_ratio` | 1.0000000946–1.3270883482 |
| LAEA `area_factor` | 0.9999975960–0.9999983735 |
| LAEA area relative to center | 0.9999992771–1.0000000546 |
| Geometry viewport | all coordinates finite and inside the approved bbox and fitted SVG |
| Interactive country-code duplication | 0 |

## 6. Verification record

- WCD-09 research-package validator: PASS.
- Projection/AEQD evidence `--check`: PASS.
- New basemap deterministic build and `--check`: PASS.
- Ordinary PR CI installs the pinned WCD-09 dependency and runs the deterministic basemap `--check`: CONFIGURED; GitHub Actions result is the merge gate.
- `validate_wcd09_implementation.py`: PASS.
- Research master and content-quality validators: PASS.
- Python unit suite: 41/41 PASS.
- Web Data build and validator: PASS; product `0.5.0`, schema `v2-web-0.3`; the committed-data validator is also configured in ordinary PR CI.
- Static public bundle: 140 HTML files, 139 sitemap URLs, zero forbidden governance keys: PASS.
- Chromium desktop/mobile, Firefox desktop and WebKit mobile: 88 PASS, 8 expected conditional skips, 0 FAIL.
- Desktop and 390 px mobile visual inspection: PASS; no material label collision, clipping or hidden focus target observed.

## 7. Controlled notes

1. `V1-ENT-0052` retains its existing Chiapas government URL and `CANNOT_VERIFY` status. No GeoNames identifier was guessed.
2. Falkland/Malvinas and NAME-31—37 remain silent L1 geometry only. Future names require new primary evidence and, for the dual name, a new USER ordering decision.
3. China-mainland publication remains outside this implementation. `V2-PUBLIC-RELEASE` is still `PAUSED BY USER`; this candidate creates no tag, release or deployment.

## 8. Final verdict

**READY FOR USER REVIEW / MERGE.** The candidate has zero open BLOCKER, MAJOR or MINOR audit findings. The three retained `BLOCKED` CH classifications are required controls and do not prevent the WCD-09 development implementation from merging.
