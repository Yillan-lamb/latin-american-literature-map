# WCD-05 Entity & Relationship Network Remediation

Status: **USER_REVIEW**
Research remediation: **PASS / completed**
Character schema: **pending USER**
Date: 2026-08-31

## Baseline

| Item | Before | After |
|---|---|---|
| Git launch baseline | `origin/main@a9cd702fb851b295abc64b42210e8b49253f7ed3` | working branch `codex/wcd-05-relationship-network-remediation` |
| Research | Data 1.3.1 development candidate | Data 1.4.0 development candidate |
| Web | Web 0.3.1 Development | Web 0.3.2 Development |
| master SHA-256 | `4d90e7e49d…` | `7bba73dd7b1a3e7ba46406c7fef5b7978903988c975415db6907bdd17263068d` |
| schema | 0.3 | 0.3 (unchanged) |
| entities / facts / cards | 371 / 998 / 255 | unchanged |
| sources | 288 | 298 |
| accepted relationships | 306 | 318 |
| hold records | 51 | 51 (history retained) |
| active holds | 51 | 38 |

The task prompt named `main@7ee22c0`; formal execution rebased again to the latest
remote main before any candidate work. The complete recomputation and source-identity
deduplication are recorded in `data/changesets/WCD-05/PREFLIGHT.md`.

## External Research consumption

The external package was treated as candidate research, not as approved master data.
All 51 hold rows were rebased to the live master; all IDs and triples still existed and
none was already resolved.

| External class | Reviewed | WCD-05 result |
|---|---:|---|
| READY_FOR_REVIEW | 14 | 12 released; 2 kept hold |
| KEEP_HOLD | 35 | 35 kept hold |
| REJECT_RELATIONSHIP | 1 | rejected with contrary evidence/history retained |
| NEEDS_SCHEMA_DECISION | 1 | kept hold; no schema inference |

Six external candidates duplicated existing formal sources (RS-02/06/14/15/17/24).
Fresh review found one additional duplicate: RS-07 / WCD05-SRC-07 is exactly
`SRC-0041`. None received a second formal ID. An unstable external Green House link
was replaced with an accessible INCI institutional record.

## Independent review

`CODEX-REVIEW-WCD05` was created with fresh context and did not participate in
candidate generation. The first gate was `REVISE`:

- replace search-index-only setting evidence with the live UNAL thesis;
- record exact pages for the HOLD-0046 contrary evidence;
- remove the duplicate `SRC-0041` identity from the second-source count for
  `V1-HOLD-0029` and use an independent article.

After those changes, the reviewer issued final `PASS` for all 13 candidate actions.
Current 403 conditions for the Kafka and Chesterton article URLs are explicitly stored
in source provenance; their previously verified full-text evidence and precise identity
remain sufficient under the reviewer decision.

## Holds before / after

| Result | Count |
|---|---:|
| released to relationship | 12 |
| rejected, historical row retained | 1 |
| active hold retained | 38 |

Active holds after remediation are `EXPLORES_THEME 29`,
`ASSOCIATED_WITH_MOVEMENT 8`, and `SET_IN 1`. All three `INFLUENCED_BY` holds
met the two-independent-source threshold and were resolved. `V1-HOLD-0036`
(Neruda/avant-garde) and `V1-HOLD-0041` (Mistral/modernism) remain holds because
the newly found material supports stylistic resemblance, early-period influence, or a
between-movements position more strongly than a stable movement association.
`V1-HOLD-0048` remains a work-level hold because author-level Boom evidence cannot
be projected to a work endpoint.

No hold row was deleted. Resolution/rejection state, reviewer result, target relation,
new evidence, exact locator, and reason remain queryable in the master.

## Relationships integrated

| Relation type | Added | Before → after |
|---|---:|---:|
| SET_IN | 2 | 13 → 15 |
| INFLUENCED_BY | 3 | 0 → 3 |
| ASSOCIATED_WITH_MOVEMENT | 5 | 0 → 5 |
| EXPLORES_THEME | 2 | 2 → 4 |
| BASED_ON_EVENT | 0 | 1 → 1 |
| other | 0 | unchanged |

Descriptions are deliberately bounded: Borges’s ultraismo and Neruda’s modernism
are time-limited; Paz is associated through documented surrealist activity; work themes
remain tied to work-specific criticism. WCD-05 added no event edge because the package
did not provide a direct A-level statement that a work is based on or fictionalizes a
specific event.

## Network coverage

The WCD-04 definitions are retained: weak means degree at most 1 **or** only one
semantic relationship type.

| Metric | Before | After |
|---|---:|---:|
| zero-degree | 61 | 51 |
| weak-degree | 225 | 230 |
| connected | 85 | 90 |
| character | 0/10 (0.0%) | 0/10 (0.0%) |
| movement | 0/8 (0.0%) | 5/8 (62.5%) |
| theme | 2/29 (6.9%) | 4/29 (13.8%) |
| event | 1/5 (20.0%) | 1/5 (20.0%) |
| author, any relation | 61/64 (95.3%) | 64/64 (100.0%) |
| influence-participating authors | 0/64 | 4/64 |
| place, any relation | 34/35 | 34/35 |
| author-place | 58/64 | 58/64 |
| fictional/unknown-fictional place | 3/4 | 3/4 |

Weak-degree increases by five because ten formerly isolated entities gained their first
edge while five entities crossed into multi-edge/multi-type connected status. It is not a
regression: zero-degree fell by ten and connected rose by five. Santa María remains the
single zero-degree fictional-place entity; it was not silently linked to a work without a
verified candidate.

## Character schema

The formal gate is `project/audits/web/WCD_05_CHARACTER_SCHEMA_GATE.md`.

```text
Recommendation: Option A — APPEARS_IN, character -> work, no inverse
USER decision: PENDING
Implemented: NO
```

Schema 0.3, validators, master, migrations, and Web schema contain no character
extension. Ten current character entities remain zero-degree. The six matching
`key_character` fact rows show that a later conversion is feasible, but not authorized.
Because character schema is a necessary WCD-05 gate, the task cannot truthfully be
marked DONE.

## Migrations and research change

- `0031_wcd05_direct_relation_remediation`
- `0032_wcd05_influence_relations`
- `0033_wcd05_movement_theme_relations`

Net formal change: 10 sources, 12 relationships, 23 relationship-evidence rows, and
14 hold-evidence rows. Data 1.4.0 is used because this is a reviewed multi-family
semantic network expansion (movement, influence, theme, and setting), not a small
metadata correction. Schema remains backward-compatible 0.3.

## Geo / Curation / Web impact

The two new `SET_IN` relationships project as two Geo relationship rows:

- 《霍乱时期的爱情》 → 哥伦比亚
- 《绿房子》 → 秘鲁

Geo rises from 91 to 93 place relations without adding map coordinates or featured map
points. Research relationships, sources, evidence, and preserved hold states rebuild into
the Web research layer. No high-judgment prose, public-scope object, Curation approval,
search entity, route, or page type was added. Web therefore advances by patch to 0.3.2,
not 0.4.0; Web Data schema remains `v2-web-0.2`.

## Remaining gaps and deferrals

- 38 active relationship holds remain legitimate evidence/semantic gaps.
- Character network remains a USER-gated schema gap.
- 3 movement, 25 theme, 4 event, 6 institution, 10 character, and other lower-value
  entities remain zero-degree where evidence or structural value is insufficient.
- Event, person, institution, and fictional-place edges were not invented to improve a
  numeric KPI.
- The WCD-06 triage/rewrite package is available but was not executed.
- The WCD-07 P0/P1 research package is available but no work/entity was added.
- Public Release remains `PAUSED BY USER`.

## Validation result

| Check | Result |
|---|---|
| master integrity / foreign keys / schema 0.3 | PASS |
| migration replay, 33 migrations / 19 tables equal | PASS |
| Data 1.4.0 export rebuild including XLSX | PASS, byte-identical |
| Curation public-content rebuild | PASS, byte-identical |
| Web Data deterministic rebuild | PASS, byte-identical at fixed `generated_at` |
| Web Data validator | PASS, 371 entities / 318 relationships / 298 sources / 93 place relations |
| content-quality public subset | PASS |
| deploy bundle build / public-boundary validator | PASS, 135 routes / 0 review queue exposure |
| frontend syntax | PASS |
| Python unit tests | PASS, 20/20 |
| Playwright browser matrix | PASS, 84/84 (Chromium desktop/mobile, Firefox desktop, WebKit mobile) |
| `git diff --check` | PASS |

The first public-bundle validation omitted the required HTTPS test origin; the bundle
was rebuilt with a non-production test origin and passed. Initial browser invocations
also confirmed the harness requires both permission to launch browsers and a served
deploy bundle; the final run used the rebuilt `dist` bundle on localhost and passed all
84 tests. These setup failures did not indicate a semantic product failure.

## Gate

```text
Research Remediation = PASS / completed
Character Schema = USER_REVIEW
WCD-05 = USER_REVIEW
WCD-06 = LOCKED
WCD-07 = LOCKED
```
