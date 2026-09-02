# CODEX-REVIEW-WCD07A

Reviewer identity: **CODEX-REVIEW-WCD07A**
Role: fresh-context independent reviewer; not involved in candidate generation, source retrieval, or drafting
Scope: WCD-07A P0 only
Baseline checked: `origin/main@f00f6177999f6c75d2fd6370b027e5a73aac6ff2`
Review date: 2026-09-02

## Overall decision and migration gate

**PASS — MIGRATION GATE OPEN FOR `PASS` ROWS ONLY.**

The six canonical work identities are supportable. The initial source-identity, metadata, support-scope, and composition-date defects were corrected during focused follow-up and now pass. One fact (WCD07A-F025) remains correctly deferred for lack of direct support. WCD07A-S17 now supplies the exact Itaú conflict URL and locator, but remains a non-migrating audit-only source because the current dynamic page returned 403 to this independent reviewer. No `DEFER` row may be migrated.

Migration is authorized only under all of the following conditions:

1. Migrate only rows marked `PASS` below. Exclude WCD07A-F025 and WCD07A-S17.
2. Preserve the corrected F014 wording: almost all poems around 1882, posthumously published in 1913. Do not restore the unsupported 1878-1882 range.
3. Preserve the W06 conflict resolution: S14 and S15 support the formal 1943 year; S17 remains audit-only and must not create a second `first_publication_year` fact or a formal source ID in this migration.
4. Preserve the corrected reuse semantics: WCD07A-S04 is existing `SRC-0201`, and WCD07A-S16 is existing `SRC-0281`; neither receives a new formal ID or overwrites master metadata.
5. Preserve all scope exclusions: no aliases, editions, characters, places, themes, movements, events, containment/trilogy entities, or public-reader changes.

Subject to those conditions, the six work rows, S01-S16, F001-F024 and F026-F030, and R01-R06 may proceed to ID allocation/migration according to their individual `PASS` decisions. S04 and S16 reuse existing IDs rather than receiving IDs. S17 and F025 remain outside migration.

## Read-only baseline findings

- The checked worktree HEAD and merge base are the required baseline commit.
- The live master contains 371 entities, and normalized checks of original titles and Chinese display names found no existing entity for any of the six candidates.
- All six author endpoints exist as `author`. Existing author-work relationships do not duplicate the proposed six `CREATED` triples.
- `CREATED` is a Schema 0.4 relation and permits `author -> work/collection`. All six proposed endpoints and directions are compatible.
- The master already contains the same CVC Pitol bibliography as `SRC-0201` and the same China Writers page as `SRC-0281`.

## Work candidates

| Candidate | Decision | Review finding |
|---|---|---|
| WCD07A-W01 | PASS | *Terra Nostra* is Carlos Fuentes's single 1975 novel. The three named sections do not justify child entities. The original title, author, year, `work` layer, and Chinese display are supported; no normalized duplicate or edition collision was found. |
| WCD07A-W02 | PASS | *El arte de la fuga* is correctly modeled as one hybrid `work`, not a collection container. The current Pitol novels are the separate carnival trilogy; they must not be represented as volumes of the memory trilogy. `《逃亡的艺术》` is the supported display candidate; the two other renderings remain audit-only aliases. |
| WCD07A-W03 | PASS | *Versos libres* is a posthumously published original poetry `collection`, distinct from existing *Versos sencillos* (`V1-ENT-0233`). The 1913 publication is distinct from composition time. `《自由诗》` is only a Chinese display gloss: no independently verified standalone full-collection Chinese edition exists, and neither `《自由诗》` nor `《自由的诗》` may be used to create an edition or anthology entity. |
| WCD07A-W04 | PASS | *La fiesta del Chivo* is Mario Vargas Llosa's single 2000 novel. Later Chinese publications are editions, not separate works. No title or author collision was found. |
| WCD07A-W05 | PASS | *El zorro de arriba y el zorro de abajo* is José María Arguedas's single posthumous 1971 novel; the novel/diary composition does not create multiple entities. The Chinese label is a display candidate only; the claimed 2024 edition boundary is not admitted as a formal edition fact in this package. |
| WCD07A-W06 | PASS | *Terras do sem-fim* is Jorge Amado's single Portuguese-language novel. BNDigital and the SciELO-hosted scholarly article independently converge on 1943; the English translation and stage adaptation remain distinct. The 1942 dissent is audit-only and must not become a competing formal year. |

## Source candidates

| Candidate | Decision | Review finding |
|---|---|---|
| WCD07A-S01 | PASS | ELEM directly supports Fuentes, title, first edition in Mexico, Joaquín Mortiz/Seix Barral, 1975, Spanish, and novel identity. |
| WCD07A-S02 | PASS | UNAM directly supports Fuentes, 1975, the three-section structure, and the bounded premise. Independent of ELEM for the relevant claims. |
| WCD07A-S03 | PASS | China Writers directly records `《我们的土地》`, Carlos Fuentes, 作家出版社, July 2021, and ISBN. Use only for Chinese-edition/display facts. |
| WCD07A-S04 | PASS | Corrected to mirror existing `SRC-0201` (including B level, title, responsibility, and URL). Reuse only; do not allocate a new source ID or overwrite the master row. |
| WCD07A-S05 | PASS | Corrected source year to 1998 and narrowed scope. The UNAM journal review directly supports book identity, Mexico/Era/1996, and heterogeneous memory/autobiographical content. |
| WCD07A-S06 | PASS | The recorded Guangming/China Reading Weekly review is suitable only for the Chinese title, translator, and Chinese-publication scope. It is not an independent original-publication source. |
| WCD07A-S07 | PASS | Carlos Javier Morales's critical study directly supports posthumous publication in 1913 and composition of almost all poems around 1882. BVMC is the host; the intellectual source is Morales's 1995 study. |
| WCD07A-S08 | PASS | Corrected to Roberto Fernández Retamar's “Introducción a la literatura cubana” within *América sin Nombre* No. 2. It directly supports 1913, the contrast with *Versos sencillos*, and the formal features. |
| WCD07A-S09 | PASS | Nobel's official bibliography directly supports author, original title, Madrid/Alfaguara, and 2000. |
| WCD07A-S10 | PASS | The publisher catalog directly supports title, author, novel classification, a 2000 work date, and the bounded Trujillo/Dominican premise. Its displayed sale edition is 2013, so it must not alone be treated as the first-edition record. |
| WCD07A-S11 | PASS | China Writers directly records `《公羊的节日》`, author, Shanghai Translation Publishing House, August 2009, and ISBN. Use only for Chinese-edition/display facts. |
| WCD07A-S12 | PASS | BNP Digital directly identifies Arguedas, title, novel identity, Spanish, and 1971. |
| WCD07A-S13 | PASS | Corrected scope is limited to author/title, novel identity, 1971, and Losada's literary-testament characterization; the unsupported diary/Chimbote claim was removed. |
| WCD07A-S14 | PASS | The Brazilian National Library article directly lists *Terras do sem-fim* among Amado's novels with 1943 and identifies the cocoa-region setting. |
| WCD07A-S15 | PASS | The independent SciELO-hosted scholarly article directly identifies Amado, novel identity, composition in 1941, publication in 1943, and the cocoa-land/coronelismo premise. |
| WCD07A-S16 | PASS | Corrected to mirror existing `SRC-0281` (including C level, title, format, and HTTPS URL). Reuse only; no new ID or metadata overwrite. Its scope is now limited to Chinese author-name/reception context, not canonical work bibliography or original year. |
| WCD07A-S17 | DEFER | Exact Itaú URL and quoted conflict locator are now recorded, satisfying traceability of the 1942 dissent. The current dynamic page returned 403 to this independent review, and the row is explicitly `EXCLUDE_CONFLICT_ONLY`; keep it audit-only, assign no formal ID, and do not use it as a formal fact source. |

Source independence note: S07 and S08 share BVMC hosting but are different intellectual works by different authors; they are not independent merely because they have different URLs, but they are independent because their underlying publications and authorship differ. S14 and S15 are likewise institutionally and intellectually distinct and converge on 1943.

## Fact candidates

| Candidate | Decision | Review finding |
|---|---|---|
| WCD07A-F001 | PASS | Single novel at `work` layer. |
| WCD07A-F002 | PASS | First publication year 1975 is directly supported by S01 and S02. |
| WCD07A-F003 | PASS | Novel classification is direct in S01. |
| WCD07A-F004 | PASS | Mexico, Joaquín Mortiz/Seix Barral, 1975 is direct in S01. |
| WCD07A-F005 | PASS | Three-part bounded description is direct in S02; it creates no theme or child-entity relation. |
| WCD07A-F006 | PASS | One hybrid book at `work` layer; not a trilogy/container entity. At migration, resolve S04 to existing `SRC-0201`. |
| WCD07A-F007 | PASS | Era, Mexico, 1996 is directly supported. At migration, resolve S04 to `SRC-0201`. |
| WCD07A-F008 | PASS | Corrected to `复合型散文`, matching S05's express refusal to reduce the book to memoir. |
| WCD07A-F009 | PASS | Existing `SRC-0201` directly supports Era/Mexico/1996; do not create S04 as a new source. |
| WCD07A-F010 | PASS | The bounded synthesis of criticism, reading memory, and autobiographical narration is supported by S05. |
| WCD07A-F011 | PASS | Posthumous original poetry collection; not a Chinese selection or edition. |
| WCD07A-F012 | PASS | 1913 is supported by both underlying studies and is not the writing year. |
| WCD07A-F013 | PASS | Poetry collection classification is supported. |
| WCD07A-F014 | PASS | Corrected to the directly supported statement that almost all poems were composed around 1882 and were published posthumously in 1913. The unsupported 1878-1882 range was removed. |
| WCD07A-F015 | PASS | Retamar directly supports unrhymed hendecasyllables, strong enjambment, and violent imagery. No movement relation is created. |
| WCD07A-F016 | PASS | Single novel at `work` layer. |
| WCD07A-F017 | PASS | Nobel's bibliography directly supports Madrid/Alfaguara/2000; S10 independently labels the work 2000. |
| WCD07A-F018 | PASS | Publisher classifies it as a novel. |
| WCD07A-F019 | PASS | Exact Nobel bibliography statement is supported. |
| WCD07A-F020 | PASS | Publisher directly supports the bounded Trujillo/Dominican-dictatorship premise; no event or place relation is created. |
| WCD07A-F021 | PASS | Single novel at `work` layer. |
| WCD07A-F022 | PASS | 1971 is directly recorded by BNP Digital. |
| WCD07A-F023 | PASS | Novel classification is directly supported by BNP Digital and Losada. |
| WCD07A-F024 | PASS | Corrected to the directly supported 1971 publication and Losada literary-testament description; the unsupported diary-year sentence was removed. |
| WCD07A-F025 | DEFER | The current S13 page does not directly state that the novel alternates/interweaves narrative with Chimbote diaries. Add a direct source before admission; otherwise omit this fact. |
| WCD07A-F026 | PASS | Single novel at `work` layer. |
| WCD07A-F027 | PASS | 1943 is independently and directly supported by BNDigital and SciELO. The two sources are stronger than the lone 1942 timeline statement. |
| WCD07A-F028 | PASS | Both sources identify the book as a novel. |
| WCD07A-F029 | PASS | Corrected formal fact now states only the convergent BNDigital/SciELO 1943 result. The 1942 dissent remains outside formal facts and is traceable through audit-only S17. |
| WCD07A-F030 | PASS | Cocoa-region land conflict and local coronelismo are directly supported by S14/S15; no place/theme relation is created. |

## Relationship candidates

| Candidate | Decision | Review finding |
|---|---|---|
| WCD07A-R01 | PASS | Existing author `V1-ENT-0145 -> CREATED -> WCD07A-W01`; direct sources, valid Schema 0.4 direction and endpoint types, no duplicate triple. |
| WCD07A-R02 | PASS | Existing author `V1-ENT-0249 -> CREATED -> WCD07A-W02`; direct sources and valid endpoints. Resolve S04 to existing `SRC-0201`; do not create a source. |
| WCD07A-R03 | PASS | Existing author `V1-ENT-0225 -> CREATED -> WCD07A-W03`; author-to-collection is valid, directly supported, and distinct from the existing *Versos sencillos* triple. |
| WCD07A-R04 | PASS | Existing author `V1-ENT-0114 -> CREATED -> WCD07A-W04`; direct sources, valid endpoints, no duplicate triple. |
| WCD07A-R05 | PASS | Existing author `V1-ENT-0248 -> CREATED -> WCD07A-W05`; direct sources, valid endpoints, no duplicate triple. |
| WCD07A-R06 | PASS | Existing author `V1-ENT-0172 -> CREATED -> WCD07A-W06`; two direct independent sources, valid endpoints, no duplicate triple. |

## Duplicate, hierarchy, edition, and Chinese-name boundaries

- W01: PASS — one novel; do not split sections or add an English-edition entity.
- W02: PASS — one hybrid `work`; do not add alias entities or falsely join the three existing carnival-trilogy novels to the memory trilogy.
- W03: PASS — one posthumous original `collection`; do not confuse it with *Versos sencillos* or promote a later Chinese selection to a full-collection edition. The Chinese display remains a gloss, not proof of a standalone translated edition.
- W04: PASS — one novel; Chinese publications remain edition-level context only.
- W05: PASS — one novel; do not split diaries or add an edition entity in this package. The shorter Chinese title remains edition-specific/audit-only.
- W06: PASS — one novel; do not add translation or adaptation entities. Keep 1942 only as a traceable audit conflict and 1943 as the admitted original-publication year.

No alias, edition, character, place, theme, movement, event, public-release, or `CONTAINS_WORK` expansion is approved by this review.
