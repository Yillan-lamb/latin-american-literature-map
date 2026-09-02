# WCD-07 Preflight

Date: 2026-09-02
Launch baseline: `origin/main@f00f6177999f6c75d2fd6370b027e5a73aac6ff2`
Master SHA-256: `2d78e94e6f8acf50d7d3fc1cf279af4c4b09d4a916057b2bb12b78995b032e01`

## Governance and scope

WCD-07 is a Research expansion only. The 6 P0 and exact 17-row
`P1-FIRST-WAVE` set from the external CSV are candidates, not approvals. P2,
P3, the remaining 31 P1 rows, WCD-06's 69 depth gaps, character expansion,
place expansion, schema expansion, public release, and any WCD-08 work are out
of scope. The external research directories were consumed read-only and are
not migration inputs by themselves.

Research Master is the sole formal source. Candidate packages are gated in
order: WCD-07A, fresh-context independent review, migration; then WCD-07B,
another fresh-context independent review, migration. Only per-row `PASS`
decisions may receive formal IDs.

## Current-main baseline

| Item | Value |
|---|---:|
| Research | Data 1.4.0 development candidate |
| Relationship schema | 0.4 |
| Web | Web 0.3.3 Development |
| Entities | 371 |
| Works | 134 |
| Collections | 69 |
| Facts | 998 |
| Relationships | 328 |
| Sources | 298 |
| Content cards | 255 |
| Latest migration | `0034_wcd05_character_relations` |

The exact 23-row semantic rebase is recorded in
`WCD07_CURRENT_MAIN_REBASE.csv`. It searched normalized original and Chinese
titles across entities, content cards, and facts; checked author attribution,
year, entity type, edition/collection identity, existing author `CREATED`
edges, source identity, and candidate-bound records.

Result: 22 `STILL_MISSING`; one `COLLECTION_OVERLAP`. The overlap is
`Todos los fuegos el fuego`: the original collection is missing, but its story
`El otro cielo` / 《另一个天空》 already exists as `V1-ENT-0084`. This is not a
reason to reject the collection, but it forbids recreating the story and
requires a separately supported `CONTAINS_WORK` decision.

## Required hierarchy decisions

- `El Aleph`: `V1-ENT-0004` is the 1945 story (`work`) and
  `V1-ENT-0012` the 1949 collection. The same Chinese display title is not
  identity evidence; neither entity may be merged. No unsupported containment
  edge is added in WCD-07.
- `Alturas de Macchu Picchu` / `Canto General`: the current work/collection
  split (`V1-ENT-0122` / `V1-ENT-0121`) is retained. `Odas elementales` is a
  different collection. WCD-07 does not repair their missing containment edge.
- `Memoria del fuego`: the database has volume I (`V1-ENT-0276`); candidates
  II and III are parallel individual `collection` entities. Schema 0.4 has no
  `series` entity type, so no trilogy grouping entity is invented.
- Bolaño: `Nocturno de Chile` is an independent Spanish-language work. It is
  not a Chinese publisher selection, posthumous compilation, or edition.
- Story/collection checks: among these 23 candidates only `Todos los fuegos el
  fuego` has a known existing child-work overlap. Chinese selected editions do
  not substitute for original-language collections.
- Pitol correction: `El arte de la fuga` begins Pitol's memory trilogy and is
  proposed as a single hybrid essay-memoir `work`, not a container entity. The
  three Pitol novels currently in the master belong to the separate carnival
  trilogy; adding this book would not complete one shared trilogy.

## Name and bibliography cautions

- Use 《逃亡的艺术》 as the supported Chinese display candidate;
  《逃逸的艺术》 and 《赋格曲艺》 remain alias candidates only.
- `Versos libres` has no verified standalone Chinese edition. 《自由诗》 and
  《自由的诗》 remain display/alias candidates rather than edition identities.
- For `Terras do sem-fim`, institutional and scholarly evidence was compared.
  Brazil's National Library and the SciELO-hosted scholarly article both state
  1943; the less specific Itaú author timeline is the lone 1942 statement.
  WCD-07A therefore proposes 1943 while preserving the 1942 conflict in the
  audit. An English translation year is not the original publication year.
- Regional and publisher-specific Chinese titles remain alias or
  edition-specific candidates in the audit. Schema 0.4 is not expanded to add
  an alias field.

## Migration readiness

At preflight, no candidate is approved and no formal ID is allocated. The
actual migration chain ends at `0034`; the next number will be assigned only
after the corresponding fresh-context review passes. Public Release remains
`PAUSED BY USER`.
