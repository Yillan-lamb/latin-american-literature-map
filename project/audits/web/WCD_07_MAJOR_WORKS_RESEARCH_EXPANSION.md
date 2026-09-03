# WCD-07 Major Works Research Expansion

- Date: 2026-09-02
- Scope: WCD-07 only; WCD-08 not started
- Public Release: `PAUSED BY USER`
- Audit status: `DONE`; targeted governance remediation complete; full local Playwright matrix passes 84/84; fresh-context `CODEX-REVIEW-WCD07-FINAL` returns `PASS`; exact remediation commit CI passes.

## Baseline

| Layer | Baseline |
|---|---|
| Git | `main@f00f6177999f6c75d2fd6370b027e5a73aac6ff2` (worktree branch `codex/wcd-07-major-works-research-expansion`) |
| Research | Data 1.4.0 development candidate |
| Research Schema | 0.4 |
| Web | Web 0.3.3 Development |
| Research entities | 371 |
| Works / collections | 134 / 69 |
| Facts | 998 |
| Sources | 298 |
| Relationships | 328 |
| Content cards | 255 |

The baseline was checked against current `main` after WCD-06. External AI
directories remained read-only and were not imported as formal data.

## Candidate scope and rebase

WCD-04 supplied 239 major-work candidates: P0 6, P1 49, P2 85, P3 65, and
DEFER 34. This WCD reviewed exactly the six P0 rows and the exact 17 P1
first-wave rows. No P1 later, P2, P3, or WCD-06 existing-entity research gap
was executed.

`data/changesets/WCD-07/WCD07_CURRENT_MAIN_REBASE.csv` records all 23 current-
main dispositions. The semantic check covered original title, author, Chinese
display, publication year, entity type, existing facts/cards, source identity,
collection membership, and edition/anthology boundaries. The 23 rows were:

- P0: six `STILL_MISSING` after semantic rebase.
- P1: sixteen `STILL_MISSING`; `Todos los fuegos el fuego` was
  `COLLECTION_OVERLAP` because its child story `V1-ENT-0084` already exists,
  while the original collection itself is missing.
- No exact duplicate, semantic duplicate, edition duplicate, Chinese-display
  duplicate, identity-uncertain, or already-resolved row was admitted.

## External research consumption

The External WCD-07 P0 pack was used as candidate/source discovery only and was
corrected where the independent research and current master required it. The
External P1 first-wave was re-ranked on current main in
`07B_P1_FIRST_WAVE/PRIORITY_REBASE.csv`; the integrator proposed only three
conservative passes and fourteen deferrals. A different fresh-context reviewer
then returned `DEFER — MIGRATION GATE CLOSED` for the entire 17-row package.

## WCD-07A P0

Fresh-context `CODEX-REVIEW-WCD07A` returned final `PASS` (57 PASS; 2 DEFER).
Only the six PASS work rows were migrated in append-only
`data/master/migrations/0035_wcd07a_p0_major_works.sql`.

| Candidate | Canonical identity | Type / year | Duplicate and Chinese-title result | Sources / gate | Migration |
|---|---|---|---|---|---|
| Terra Nostra | Carlos Fuentes — 《我们的土地》 | work / 1975 | no duplicate; display supported by Chinese Writers | ELEM B + Gaceta UNAM C; PASS | added |
| El arte de la fuga | Sergio Pitol — 《逃亡的艺术》 | work / 1996 | distinct from 《逃亡计划》; no collection/series expansion | CVC B reuse + UNAM review C; PASS | added |
| Versos libres | José Martí — 《自由诗》 | collection / 1913 posthumous | distinct from `Versos sencillos`; provisional Chinese display only | two scholarly sources; PASS | added |
| La fiesta del Chivo | Mario Vargas Llosa — 《公羊的节日》 | work / 2000 | no duplicate; Chinese Writers edition/display support | Nobel B + Alfaguara B; PASS | added |
| El zorro de arriba y el zorro de abajo | José María Arguedas — 《山上的狐狸，山下的狐狸》 | work / 1971 | single novel; 2024 Chinese title has formal catalog provenance | BNP B + Losada B; PASS | added |
| Terras do sem-fim | Jorge Amado — 《无边的土地》 | work / 1943 | no duplicate; 1942 dissent stays audit-only; Chinese title linked to original | BNDigital B + SciELO A; PASS | added |

The two P0 review deferrals were not migrated: the Itaú 1942 conflict-only
source and the unsupported Arguedas structural premise. No aliases, editions,
characters, places, themes, events, series, or non-`CREATED` relations were
added.

### Targeted source-level governance remediation

The formal Data SOP classifies the actual inspected object, not the prestige of
its host. The unmerged 0035 migration was corrected in place; no 0036 rollback
migration was created.

| Source | Actual object | Before | Final |
|---|---|---:|---:|
| SRC-0301 | ELEM / Fundación institutional work page | A | B |
| SRC-0302 | Gaceta UNAM institutional news/features page | A | C |
| SRC-0303 | China Writers book-information web page | B | C |
| SRC-0304 | *Literatura Mexicana* book review; no evidence inspected that it is a peer-reviewed research article | A | C |
| SRC-0305 | *中华读书报* newspaper review | B | C |
| SRC-0306 | authored scholarly study | A | A |
| SRC-0307 | authored scholarly article | A | A |
| SRC-0308 | Nobel institutional bibliography | A | B |
| SRC-0309 | Alfaguara publisher catalog | A | B |
| SRC-0310 | China Writers book-information web page | B | C |
| SRC-0311 | Biblioteca Nacional del Perú record | A | B |
| SRC-0312 | Editorial Losada publisher catalog | A | B |
| SRC-0313 | Brazilian National Library article | A | B |
| SRC-0314 | peer-reviewed journal research article with DOI | A | A |
| SRC-0201 / SRC-0281 | reused institutional bibliography / media context | B / C | B / C |

Regrading does not mechanically remove entities. The gate was reassessed by
directness, reliability, independence, and claim intensity: W01 remains B+C;
W02 B+C; W03 A+A; W04 B+B; W05 B+B; and W06 B+A. C-level material is used only
for bounded review/context or Chinese bibliographic display, not as the sole
basis of a high-intensity interpretive claim. All six P0 entities, 29 facts and
six `CREATED` relationships therefore remain admissible.

### W05 / W06 Chinese display provenance

- `SRC-0315` is the Zhejiang Xinhua institutional library-acquisition catalog
  record for the People's Literature Publishing House June 2024 edition
  *《山上的狐狸，山下的狐狸》*: translator Zhu Jinyu, ISBN 9787020186723.
  It is B-level and attached to `V1-CARD-0260` with
  `source_role=chinese_display`.
- `SRC-0316` is the Fujian Jiangxia University Library catalog record for the
  1992 Shanghai Translation Publishing House edition *《无边的土地》*: translator
  Wu Lao, ISBN 7-5327-0345-2, with the parallel/original title
  *Terras do sem fim*. It is B-level and attached to `V1-CARD-0261` with
  `source_role=chinese_display`.

The two records support canonical Chinese display without creating edition
entities. Their `normalization_basis` fields now state the traceable edition
linkage; neither entity requires `PROVISIONAL-ZH-DISPLAY`.

## WCD-07B P1 first-wave

Fresh-context `CODEX-REVIEW-WCD07B` returned `DEFER — MIGRATION GATE CLOSED`.
All 17 works, all proposed facts, and all three proposed `CREATED` relations
remain un-migrated. Only the corrected candidate reuse of existing `SRC-0066`
was accepted as a source-row correction; it received no new formal source ID.

| Candidate | Work | Final disposition |
|---|---|---|
| WCD07B-W01 | Sor Juana — *Inundación castálida* | DEFER |
| WCD07B-W02 | Nicolás Guillén — *Cantos para soldados y sones para turistas* | DEFER |
| WCD07B-W03 | Julio Cortázar — *Todos los fuegos el fuego* | DEFER |
| WCD07B-W04 | Octavio Paz — *Los hijos del limo* | DEFER |
| WCD07B-W05 | Jorge Luis Borges — *El otro, el mismo* | DEFER |
| WCD07B-W06 | Ricardo Piglia — *La ciudad ausente* | DEFER |
| WCD07B-W07 | Mario Benedetti — *Primavera con una esquina rota* | DEFER |
| WCD07B-W08 | Eduardo Galeano — *Memoria del fuego II: Caras y máscaras* | DEFER |
| WCD07B-W09 | Eduardo Galeano — *Memoria del fuego III: El siglo del viento* | DEFER |
| WCD07B-W10 | Mario Vargas Llosa — *La tía Julia y el escribidor* | DEFER |
| WCD07B-W11 | Pablo Neruda — *Odas elementales* | DEFER |
| WCD07B-W12 | Roberto Bolaño — *Nocturno de Chile* | DEFER |
| WCD07B-W13 | Clarice Lispector — *Perto do coração selvagem* | DEFER |
| WCD07B-W14 | Gabriel García Márquez — *Del amor y otros demonios* | DEFER |
| WCD07B-W15 | Gabriel García Márquez — *La hojarasca* | DEFER |
| WCD07B-W16 | Gabriel García Márquez — *Vivir para contarla* | DEFER |
| WCD07B-W17 | José Donoso — *Historia personal del boom* | DEFER |

The reviewer found the hierarchy audit sound, but required two intellectually
independent, directly inspectable reliable sources per work. The live BnF
record for W03 is sufficient only as one source. BVMC/Britannica/CASS pages
were not independently inspectable in that review session, and no lawful local
evidence snapshots were supplied. The internal hierarchy note was removed from
the fact candidate file and remains an audit boundary only.

## Hierarchy and duplicate decisions

- `El Aleph` short story and `El Aleph` collection remain separate; Borges's
  *El otro, el mismo* was not merged with either layer.
- Neruda's `Alturas de Macchu Picchu` / `Canto General` split remains unchanged;
  no containment edge was inferred for *Odas elementales*.
- Galeano volume I remains the only admitted volume; volumes II and III were
  deferred as possible parallel collections, with no `series` entity.
- Bolaño's Spanish original, Chinese selected anthologies, and posthumous
  compilations remain distinct layers; no Chinese selection was promoted.
- Cortázar's missing original collection may eventually coexist with existing
  child story `V1-ENT-0084` 《另一个天空》. The story was not duplicated and no
  `CONTAINS_WORK` relation was created without direct contents evidence.
- Chinese strings in the candidate package are display candidates or alias/
  edition leads only. Schema 0.4 has no alias field, so no alias model was
  invented.
- No character, place, theme, movement, event, reader route, or public-content
  expansion was performed.

## Research change

| Measure | Before | After 0035 | Delta |
|---|---:|---:|---:|
| entities | 371 | 377 | +6 |
| works | 134 | 139 | +5 |
| collections | 69 | 70 | +1 |
| facts | 998 | 1027 | +29 |
| sources | 298 | 314 | +16 |
| content cards | 255 | 261 | +6 |
| relationships | 328 | 334 | +6 |
| `CREATED` added | — | 6 | +6 |
| `SET_IN` / other relation types added | — | 0 | 0 |

Research metadata is `Data 1.5.0 development candidate`, generated
2026-09-02, with migration chain ending at 0035. Schema remains 0.4.

## Curation / Web / public scope

The six new Research cards are not automatically admitted to reader-facing
curation. Curation was rebuilt from the existing reviewed package and its
quality validator remained PASS. Web Data was rebuilt from SQLite and the
existing curation package, so the Research layer now exposes 377 entities,
1027 facts, 334 relationships, 314 sources, and 261 cards. Web Data schema is
still `v2-web-0.2`, and Web remains the verified `0.3.3 Development` because
public reader scope and page types did not change. No new public reader entity
was admitted by WCD-07.

## Remaining backlog

- P1 later: 32 of the 49 P1 rows not in first-wave; not executed.
- P2: 85; not executed.
- P3: 65; not executed.
- DEFER: 34; not scheduled.
- WCD-06 existing-entity research gaps: 69; not mixed into WCD-07.
- No WCD-08 was created or started.

## Validation

| Check | Result |
|---|---|
| Research master validator | PASS |
| SQLite integrity / foreign keys | PASS (`integrity_check=ok`, 0 FK errors) |
| Append-only migration replay | PASS (35 migrations, 19 tables equal) |
| SQLite → CSV/JSON/XLSX export | PASS; `v1.5.0-candidate` built |
| Export deterministic rebuild | PASS; byte-identical temporary rebuild |
| Curation rebuild | PASS |
| Curation quality / provenance | PASS |
| Web Data build / validator | PASS at Web 0.3.3 / v2-web-0.2 |
| Frontend syntax (`node --check site/app.js`) | PASS |
| Deploy bundle / public-boundary validator | PASS (test origin; 137 routes, 128 public entities, no review queue exposure) |
| Python unit tests | PASS (25/25) |
| Browser / Playwright matrix | PASS (84/84; Chromium desktop/mobile, Firefox desktop, WebKit mobile; built public bundle) |
| `git diff --check` | PASS |
| GitHub CI | PASS for exact remediation commit `50ca5fe` ([run 33637514644](https://github.com/Yillan-lamb/latin-american-literature-map/actions/runs/33637514644)): development baseline integrity PASS; Chromium desktop/mobile smoke PASS; release-only jobs skipped as expected for a development PR |

The full local matrix ran with the repository's unmodified `npm run qa:browser`
entrypoint against the built public bundle; Chromium smoke was not substituted
for the matrix. The test origin `https://example.invalid/` was used only for
local preview validation; no production origin or deployment was used.

## Gate

Research gate: `PASS` for WCD-07A after source regrading; `CLOSED` for WCD-07B
(all 17 DEFER). 0035 is applied and replayable. Public Release remains `PAUSED
BY USER`. No tag, GitHub Release, production deployment, or WCD-08 was started.
The focused final reviewer returned `PASS`, and the exact pushed remediation
commit passed PR CI. `WCD-07 = DONE`; Public Release remains `PAUSED BY USER`;
no WCD-08 was created or started. Work stops here pending USER final audit;
this audit does not authorize merge.

## 2026-09-03 Governance Addendum

This addendum records the later governance/metadata synchronization without
rewriting the historical audit above.

- The original WCD-07 audit was performed against `Web 0.3.3 Development`; its
  historical QA table and validation descriptions remain at that state.
- After PR #24, Web product metadata was synchronized from `0.3.3` to `0.3.4`
  solely for governance/metadata synchronization; reader-facing scope did not
  change.
- PR #24 re-executed the applicable validators and CI for that
  governance/metadata synchronization.
- This supplementary verification does not change the original WCD-07 audit
  facts or conclusions.
