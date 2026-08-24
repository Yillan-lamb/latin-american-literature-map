# WEB-CE-B04 Independent Review

## Verdict

`REVISE` (initial review; superseded by the focused follow-up below)

This is a fresh-context review of the B04 research package and the dry-run migration. The package is structurally sound and most of the source-backed facts are usable, but two research-layer issues must be corrected before the batch can receive `PASS`:

1. `La invención de Morel` has an unresolved 1940/1941 publication-year conflict between two Instituto Cervantes pages.
2. The three Horacio Quiroga titles are short-story collections, but the candidate and migration classify them as ordinary `work` entities and write `entity_layer=work`.

These are minimum, local corrections; no wholesale re-research is required.

## Review scope and method

- Candidate: `data/changesets/WEB-CE-B04/RESEARCH_CHANGE_SET.json`
- Preflight: `data/changesets/WEB-CE-B04/PREFLIGHT.md`
- Migration: `data/master/migrations/0007_web_ce_b04_luna_max.sql`
- Dry-run database: `/private/tmp/lalm-b04-preflight.sqlite`
- Baseline database: `data/master/V1_MASTER.sqlite` at B03 (`97fe225`)
- Sources were opened directly where possible; official/institutional pages were preferred.
- The dry-run database was checked with `PRAGMA integrity_check`, foreign-key check, entity/source/reference checks, and normalized-name duplicate checks.

## Checks that passed

### Scope, IDs, and deduplication

- Three new authors, nine new title entities, and one Paraguay country node are present in the candidate.
- No duplicate author, work, collection, or place was found against the latest B03 database, including punctuation and accent variants checked for the planned names.
- The proposed entity, card, fact, source, relationship, and evidence ID ranges are unique in the dry-run database.
- All 42 B04 facts have a source reference; all 12 B04 relationships have valid endpoints and evidence.
- All relationship types are existing schema values. The batch adds only `CREATED` and `ASSOCIATED_WITH_PLACE`; no unsupported interpretive relationship was found.

### Sources and factual support

- `SRC-0153` (Instituto Cervantes) directly supports Bioy Casares's Buenos Aires birth, 1914–1999 dates, and Argentine writer identity: <https://www.cervantes.es/bibliotecas_documentacion_espanol/biografias/cairo_adolfo_bioy_casares.htm>
- The canonical `www` version of the Biblioteca Virtual Miguel de Cervantes chronology directly lists `La invención de Morel` in 1940, `Plan de evasión` in 1945, and `El sueño de los héroes` in 1954: <https://www.cervantesvirtual.com/portales/adolfo_bioy_casares/autor_cronologia/>
- The Cervantes Virtual novel catalogue directly lists the three Bioy titles and attributes them to Bioy Casares: <https://www.cervantesvirtual.com/portales/adolfo_bioy_casares/su_obra_novelas/>
- The Biblioteca Nacional Mariano Moreno PDF directly identifies `Plan de evasión` as a 1945 novel: <https://www.bn.gov.ar/micrositios/admin_assets/issues/files/0bf5f84a1743cfd560d46326fbf7f3cd.pdf>
- Centro Virtual Cervantes supports Roa Bastos's Asunción birth, Paraguayan identity, and the 1960/1974 chronology for `Hijo de hombre` and `Yo el Supremo`: <https://cvc.cervantes.es/actcult/roa/biografia.htm>, <https://cvc.cervantes.es/actcult/roa/cronologia/cronologia02.htm>
- The CVC study directly identifies `Hijo de hombre` (1960), `Yo, el Supremo` (1974), and `El fiscal` (1993) as novels in the Paraguayan trilogy: <https://cvc.cervantes.es/actcult/roa/acerca/acercade05.htm>
- The Fundación Augusto Roa Bastos page directly supports the 1993 publication of `El fiscal` and the author's 1917–2005 biographical span: <https://fundacionroabastos.org/augusto-roa-bastos/>
- ASALE directly supports `Yo el Supremo` as a 1974 work by Augusto Roa Bastos: <https://www.asale.org/obras-academicas/ediciones-conmemorativas/yo-el-supremo>
- Uruguay's Ministry of Education and Culture / Academia Nacional de Letras page directly supports Quiroga's 1878–1937 dates, Salto birth, and the 1917/1918/1926 title-year entries: <https://www.gub.uy/ministerio-educacion-cultura/academia-nacional-letras/sillones-academicos/horacio-quiroga>
- No unsupported story setting or fictional-space coordinate was introduced in this research package. The Paraguay GeoNames node is a country node only: <https://www.geonames.org/3437598/republic-of-paraguay.html>

### Display names

The Chinese names are plausible reader-facing display candidates and the original-language titles are retained. Missing translator, publisher, ISBN, and Chinese-edition-year metadata is not a defect at this project stage. No obvious title collision was found.

## Findings requiring revision

### P1 — `V1-ENT-0201` / `V1-FCT-0443`: Bioy publication year conflict

The migration records `first_publication_year=1940`, sourced to `SRC-0154`. The opened Cervantes Virtual chronology supports 1940. However, the separately opened Instituto Cervantes biography in `SRC-0153` says that Bioy published `La invención de Morel` in 1941. The 1941 entry in the chronology refers to the municipal prize, but the biography's wording is an explicit publication-year statement, so this cannot be silently ignored.

Minimum fix:

- Keep the candidate's 1940 only if the record explicitly preserves the 1940/1941 source discrepancy and explains the choice as a bibliography/publication-versus-prize issue; otherwise move the year fact to `disputed`/HOLD until an authoritative bibliography resolves it.
- Add the conflicting source to the fact's evidence set if the schema permits, or record it in a traceable hold/remediation note. Do not present 1940 as uncontested.
- Normalize `SRC-0154` to the opened canonical URL with `www` and correct its title metadata to the page heading `Adolfo Bioy Casares. Cronología de obras` (or document the chosen source title).

### P1 — `V1-ENT-0207`–`V1-ENT-0209`: Quiroga collection classification

The candidate and migration use `entity_type=work` and `entity_layer=work` for:

- `Cuentos de amor de locura y de muerte`;
- `Cuentos de la selva`;
- `Los desterrados`.

The official Uruguay page describes these as a book of stories, a children's story production, and a book/collection context. The current project schema already uses `collection` for comparable short-story and poetry books (for example `Ficciones`, `El Llano en llamas`, and `Guerra del tiempo`). The cards' `短篇小说集` labels therefore conflict with the research entity layer.

Minimum fix:

- Change the three entity rows and corresponding `entity_layer` facts to `collection`.
- Keep the existing `CREATED` relationships and publication years; no new research is needed.
- Update the candidate, migration, cards, and any generated Web Data consistently, then rerun the master/content validators.

## Lower-priority metadata notes

- `SRC-0154` is stored without `www` and with a shortened title; canonicalize it as part of the year remediation.
- `SRC-0159` is a valid CVC chronology page and directly contains the 1960 and 1974 entries, but its stored title omits the colon in the page heading. This is a metadata cleanup, not a research failure.
- GeoNames returned a cache miss when opened directly in this review, although the `3437598` identifier is corroborated by GeoNames search results and other geographic indexes. Reconfirm the canonical country page or RDF endpoint when the Geo CSV is integrated.

## Geo and relation review

- Paraguay is correctly modeled as a real country node, not a city or inferred work setting.
- No fictional place was assigned real coordinates.
- The three author-country relations are directionally coherent and use existing `ASSOCIATED_WITH_PLACE`; no work-location relation is asserted.

## Required follow-up

After the two P1 corrections, rerun the migration on a fresh copy of the B03 master, check integrity and foreign keys, and perform a focused re-review of the affected Bioy year and Quiroga entity layers. The batch may then be reconsidered for `PASS`.

## Follow-up verdict

`PASS`

The remediation was re-reviewed against the updated candidate, migration `0007_web_ce_b04_luna_max.sql`, and the fresh copy `/private/tmp/lalm-b04-remed.sqlite`; the formal B04 master database was not modified by this review.

- `SRC-0154` now has the canonical URL `https://www.cervantesvirtual.com/portales/adolfo_bioy_casares/autor_cronologia/` and the title `Adolfo Bioy Casares. Cronología de obras`.
- `V1-FCT-0443` retains 1940 with `medium` confidence, explicitly records the 1940/1941 conflict in its usage note, and has both `SRC-0153` and `SRC-0154` in `fact_sources`. `V1-GAP-0014` remains an intentional `open_research` / `SOL_REVIEW` gap, and its downstream note prohibits presenting 1940 as uncontested.
- `V1-ENT-0207`–`V1-ENT-0209` are consistently `collection`; their `entity_layer` facts (`V1-FCT-0470`, `V1-FCT-0473`, `V1-FCT-0476`), cards (`V1-CARD-0097`–`0099`), and `CREATED` relationships are aligned. The regenerated Web Data projection exposes all three as collections.
- The remediation copy reports `PRAGMA integrity_check = ok` and an empty foreign-key check; no fictional-space coordinate was introduced.

The remaining bibliographic gap is deliberately handed to Sol and is not a remediation failure. Final focused reviewer conclusion: **PASS**.
