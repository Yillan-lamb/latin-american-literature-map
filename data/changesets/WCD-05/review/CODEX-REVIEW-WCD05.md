# CODEX-REVIEW-WCD05

Date: 2026-08-31
Reviewer: CODEX-REVIEW-WCD05 (fresh-context, independent)
Scope: read-only review of the WCD-05 candidate package; this report is the only review-side write.

## Decision standard

Each row receives exactly one of `PASS`, `REVISE`, or `REJECT`. A relation row passes only when source identity, intellectual independence where required, direct semantic support, direction, endpoint legality, duplicate-triple status, description scope, and the applicable release threshold all pass. Search snippets and inaccessible, uninspected files are not direct evidence.

## Baseline and schema verification

- The live master contains 371 entities, 998 facts, 288 sources, 306 relationships, and 51 relationship holds, consistent with `PREFLIGHT.md`.
- Schema 0.3 has the stated 13 relation types. Every proposed relation uses a legal type and legal direction. All referenced endpoints exist and have the expected types.
- None of the 13 candidate triples already exists in `relationships`; the corresponding hold triple is not treated as an accepted-relation duplicate.
- Source-identity checks confirm the six rebase duplicates listed in `PREFLIGHT.md`. One additional candidate-package error exists: `WCD05-SRC-07` is the same source as `SRC-0041` (same title, author, journal, year, DOI, and article), despite being marked `NEW`.
- The latest migration remains `0030_wcd03_chinese_display_names`. No `0031` migration, schema SQL, validator change, relationship row, or export implements `APPEARS_IN`.
- Repository-wide `APPEARS_IN` occurrences are confined to the USER-gate/task prose. The character gate therefore remains correctly pending: `USER decision: PENDING`, `Implemented: NO`. **PASS**.

## Source-candidate decisions

| Source row | Decision | Identity / access / support finding |
|---|---|---|
| WCD05-SRC-01 | PASS | CVC institutional page; identity is distinct; direct 1921 ultraismo participation evidence. Live HTTP 200. |
| WCD05-SRC-02 | PASS | Distinct Almeida article in *Variaciones Borges*; direct, workmanlike study of the Borges-Schopenhauer relation. Live PDF HTTP 200. |
| WCD05-SRC-03 | PASS | Distinct Garcia article in *Fragmentos*; the locally captured evidence supports sustained Borges-Kafka engagement independently of `SRC-0002`. The direct URL currently returns HTTP 403 and must be flagged in provenance, but prior full-text verification is sufficiently specific for source registration. |
| WCD05-SRC-04 | PASS | Distinct Gayton proceedings article; explicit Chesterton influence, including a primary-source admission quoted in the study. The direct URL currently returns HTTP 403 and must be flagged in provenance. |
| WCD05-SRC-05 | PASS | Distinct Paz Soldan article. The journal record and abstract are live and directly state Carpentier's innovation, combination of magic and reality, rejection of European aesthetics, and search for an American expression. Record access must not be described as full-text access. |
| WCD05-SRC-06 | PASS | Distinct Casa de la Literatura Peruana critical page; live full text directly supports combinable structure and active reader participation. |
| WCD05-SRC-07 | REVISE | Duplicate identity of existing `SRC-0041`; do not allocate a new `SRC-` ID and do not count it as independent evidence. Reuse `SRC-0041`. |
| WCD05-SRC-08 | PASS | Distinct Monguio/Universidad de Chile critical archive; live full text supports the modernist inheritance of Neruda's early poetry with the necessary temporal limit. |
| WCD05-SRC-09 | REVISE | The source identity and semantics are valid, and the URL now redirects to a live UNAL PDF (HTTP 200). The row's `access_result=verified_external_pdf_current_url_blocked` is stale. Change it to an accurate currently-accessible PDF status and preferably store the resolved repository URL. |
| WCD05-SRC-09A | PASS | Distinct Nobel institutional biography; live HTTP 200; directly records Paz's activity with Breton and Peret. |
| WCD05-SRC-09B | REVISE | Source identity is plausible, but the supplied PDF URL currently returns HTTP 403 and the row admits only search-indexed verification. Search-indexed text is not an opened, qualified source under the evidence-pack rule. Obtain an accessible full record/text or do not use it for release. |
| WCD05-SRC-10 | PASS | Live INCI institutional record (HTTP 200) explicitly states that the novel occurs in Piura and Santa Maria de Nieva in the Amazon. |

Current-access warning: live checks returned HTTP 403 for WCD05-SRC-03, WCD05-SRC-04, and WCD05-SRC-09B. WCD05-SRC-09, which the candidate CSV labels blocked, currently resolves to a downloadable UNAL PDF. The external pack separately flags RS-02, RS-16, RS-18, RS-20, and RS-21 as blocked, and RS-19/RS-23/RS-24 as unverified; none may be silently counted toward a release threshold.

## Relation-candidate decisions

| Candidate | Decision | Independent review |
|---|---|---|
| WCD05-CS01-01 | REVISE | `work -> SET_IN -> place` is legal; endpoints exist; no accepted duplicate; the Colombian-Caribbean wording is supportable. However, the row now relies on inaccessible/search-index-only `WCD05-SRC-09B`, while `SRC-0064` is only auxiliary. Replace `WCD05-SRC-09B` with corrected `WCD05-SRC-09`, whose live PDF directly says the unnamed city combines cities and towns on Colombia's Caribbean coast. One direct qualified source then satisfies the threshold. |
| WCD05-CS01-02 | PASS | Legal direction and endpoints, no duplicate, no overclaim. The live INCI record directly names Piura and Santa Maria de Nieva/Amazonia, both in Peru. One direct qualified source satisfies `SET_IN`. |
| WCD05-CS01-03 | REVISE | The proposed rejection is semantically justified: the live UNAL thesis explicitly calls attempts to classify the novel as magical realism fruitless, says magical irruptions are removed apart from immaterial episodes, and describes a return toward nineteenth-century realism. Endpoint/direction and duplicate checks pass. Before closing/rejecting the hold, correct WCD05-SRC-09's stale access metadata and record a precise locator/quote; the current source row is not migration-ready as written. This is a revision of provenance, not a retreat from the rejection rationale. |
| WCD05-CS02-01 | PASS | Author-to-author `INFLUENCED_BY` is legal; no duplicate. `SRC-0002` makes the explicit influence judgment and Almeida is an independently authored specialist study. The restrained description avoids claiming doctrinal identity. Two-source threshold met. |
| WCD05-CS02-02 | PASS | Legal endpoints/direction, no duplicate. `SRC-0002` explicitly states influence; Garcia independently documents a roughly seven-decade engagement through reading, selection, commentary, and translation. The description does not repeat the known false claim that Borges translated the title story of *Metamorphosis*. Two-source threshold met. Current direct URL is 403 and must be noted. |
| WCD05-CS02-03 | PASS | Legal endpoints/direction, no duplicate. Existing explicit influence evidence plus Gayton's independently authored article and its quoted primary admission directly support notable Chesterton influence on Borges's fiction. Two-source threshold met. Current direct URL is 403 and must be noted. |
| WCD05-CS03-01 | PASS | Legal author-to-movement edge, no duplicate. `SRC-0002` supplies the 1919 encounter/1921 dissemination chronology; CVC independently documents 1921 manifesto, magazine, and proclamation participation. The 1919-1921 limit prevents lifelong-membership overclaim. |
| WCD05-CS03-02 | PASS | Legal author-to-movement edge, no duplicate. `SRC-0035` (CVC) and existing `SRC-0056` (Nobel) are distinct institutional judgments and both identify Garcia Marquez as a leading representative/interpreter of magical realism. No new source ID is needed. |
| WCD05-CS03-03 | PASS | Legal author-to-movement edge, no duplicate. `SRC-0041` and Paz Soldan are different authors in different peer-reviewed journals, notwithstanding common UCM hosting; intellectual independence is adequate. Both address the normalized Carpentier/lo real maravilloso relation. The proposed wording is bounded to formulation/development. |
| WCD05-CS03-04 | PASS | Legal work-to-theme edge, no duplicate. The existing UFF article and independent Casa de la Literatura page converge on fragmented/non-linear structure and active reader participation. The description stays within that shared scope. |
| WCD05-CS03-05 | REVISE | Direction/endpoints and triple are legal and non-duplicate, but `new_source_keys=WCD05-SRC-07` points to the exact same article already registered as `SRC-0041`. There is only one source identity, so the two-independent-research-output threshold fails. Replace the new source with truly independent Paz Soldan evidence (`WCD05-SRC-05`) and ensure the evidence note ties its American-expression claim to this work-specific theme; then re-review. |
| WCD05-CS03-06 | PASS | Legal author-to-movement edge, no duplicate. CVC and Monguio are independent; both support modernist inheritance only in Neruda's early poetry. The temporal restriction is essential and is retained. Two-source threshold met. |
| WCD05-CS03-07 | PASS | Legal author-to-movement edge, no duplicate. Poets.org independently supports an avant-garde magazine context; Nobel records direct activity/publication with Breton and Peret. The wording describes participation/association rather than formal membership in a single movement, avoiding overclaim. Two-source threshold met. |

## External-research rebase decisions (51-row coverage)

The following rebase rows are **PASS** because their route accurately preserves the hold or sends a supported candidate to review without itself authorizing migration:

`V1-HOLD-0001`-`V1-HOLD-0028`, except no exclusions; `V1-HOLD-0030`-`V1-HOLD-0043`; `V1-HOLD-0045`; `V1-HOLD-0047`-`V1-HOLD-0051`.

The following rebase rows are **REVISE**:

- `V1-HOLD-0029`: its CS03 route presently uses a duplicate source identity, so the note must not imply the independent-source threshold is already met.
- `V1-HOLD-0044`: the relation is supportable, but the current CS01 source route was changed to an inaccessible/search-index-only candidate; route it to corrected WCD05-SRC-09 or another opened direct source.
- `V1-HOLD-0046`: the `REJECT_RELATIONSHIP` rationale is supported, but the linked WCD05-SRC-09 access metadata is stale and must be corrected before a final hold-state migration.

No external-rebase row is `REJECT`: conservative `KEEP_HOLD` decisions, including 0036, 0041, 0048, and 0051, are appropriate. This grouping accounts for all 51 IDs exactly once.

## Migration gate

Rows permitted to integrate now, subject to normal ID allocation and append-only migration QA:

- `WCD05-CS01-02`
- `WCD05-CS02-01`, `WCD05-CS02-02`, `WCD05-CS02-03`
- `WCD05-CS03-01`, `WCD05-CS03-02`, `WCD05-CS03-03`, `WCD05-CS03-04`, `WCD05-CS03-06`, `WCD05-CS03-07`

Rows not permitted to integrate until revised and re-reviewed:

- `WCD05-CS01-01`: replace inaccessible WCD05-SRC-09B with corrected, opened WCD05-SRC-09 (or equivalent direct source).
- `WCD05-CS01-03`: correct WCD05-SRC-09 access/canonical metadata and add a precise contrary-evidence locator before rejecting the hold.
- `WCD05-CS03-05`: remove duplicate WCD05-SRC-07 as a supposed second source; use a genuinely independent source and re-run the two-source check.

Mandatory source handling:

- Do not create a formal source for WCD05-SRC-07; reuse `SRC-0041`.
- Do not use WCD05-SRC-09B in a migration while it remains unopened/inaccessible.
- Flag the current 403 status of WCD05-SRC-03 and WCD05-SRC-04 in provenance; their relation rows otherwise pass on the specifically captured prior full-text evidence.
- Character schema/data work remains locked pending an explicit USER decision. No character migration may be included in WCD-05.

**Overall package decision: REVISE.** Ten relation rows may proceed; three require the specific revisions above. The USER-gated character schema has not been implemented.

## Final re-review addendum

Re-review date: 2026-08-31
Scope: the integrator revisions to CS01-01, CS01-03, CS03-05, WCD05-SRC-07, WCD05-SRC-09, and the corresponding external-rebase notes. This addendum supersedes the earlier `REVISE` decisions and migration gate for those rows.

### Exact WCD05-SRC-09 locators

Source: Nini Johana Rivera Pulido, *Realismo decimonónico y novela sentimental como modos narrativos en El amor en los tiempos del cólera de Gabriel García Márquez* (Universidad Nacional de Colombia, 2018).

Resolved live repository URL:

`https://bffrepositorio.unal.edu.co/server/api/core/bitstreams/69020378-2940-4ae3-affd-d13b58363ebf/content`

Verified locators (printed page and PDF page numbers coincide):

- Setting evidence: Chapter 2, section 2, “La ciudad colonial y la ciudad moderna,” pp. 50–51. The discussion identifies the fictional city as the Colombian Caribbean setting, assembled from Cartagena, Barranquilla, Santa Marta, and other Caribbean-coast towns.
- Contrary movement evidence: Chapter 1, section 3, “Más allá de *Cien años de soledad*: la búsqueda de nuevos modos narrativos,” p. 28. Attempts to relate the novel to magical realism are expressly described as a fruitless classification exercise.
- Contrary movement evidence: Chapter 2 opening discussion, pp. 41–42. The study states that magical irruptions are removed apart from immaterial episodes and that the technique returns toward nineteenth-century realism.
- Conclusion-level confirmation: “Conclusiones,” p. 91. The critical reception is summarized as identifying the author's departure from his characteristic magical-realism style and a return to techniques closer to nineteenth-century realism.

### Revised-row decisions

| Row | Final decision | Re-review finding |
|---|---|---|
| WCD05-SRC-07 | PASS | It is now correctly marked `DUPLICATE_SRC-0041` with an explicit instruction not to formalize it. Deduplication is correct; the row is a reuse record, not a new-source candidate. |
| WCD05-SRC-09 | PASS | The canonical URL is now the resolved live UNAL repository endpoint; access is accurately recorded as HTTP 200; support scope includes exact sections/pages. Identity and provenance are migration-ready. |
| WCD05-CS01-01 | PASS | The row now uses opened WCD05-SRC-09 rather than inaccessible WCD05-SRC-09B and records Chapter 2 section 2, pp. 50–51. Direction, endpoints, semantic support, non-duplication, description scope, and the one-direct-source threshold all pass. |
| WCD05-CS01-03 | PASS | Exact locators are now recorded at p. 28, pp. 41–42, and p. 91. The contrary evidence directly supports rejection of this work-level magical-realism association. Provenance and rejection threshold pass. |
| WCD05-CS03-05 | PASS | The second source is now WCD05-SRC-05 (Paz Soldan), not duplicate WCD05-SRC-07/SRC-0041. Paz Soldan and Araujo Branco are different authors in different peer-reviewed journals; their research outputs are intellectually independent despite common UCM hosting. Existing work-specific transcultural analysis plus the independent American-expression/lo-real-maravilloso analysis support the bounded normalized triple. |
| EXTERNAL_RESEARCH_REBASE V1-HOLD-0029 | PASS | The note now accurately states an existing work-specific article plus an independent article on the work's American expression. |
| EXTERNAL_RESEARCH_REBASE V1-HOLD-0044 | PASS | The note now identifies opened direct UNAL thesis evidence rather than the inaccessible indexed candidate. |
| EXTERNAL_RESEARCH_REBASE V1-HOLD-0046 | PASS | The note now accurately characterizes the opened contrary scholarship. |

WCD05-SRC-09B remains **REVISE** as a standalone, currently inaccessible/search-index-only source candidate. It is no longer referenced by any relation candidate and **must not receive a formal source ID or enter the migration**. Its exclusion does not block the reviewed relation set.

### Final migration gate

**PASS.** All 13 relation candidate rows may integrate:

- `WCD05-CS01-01`, `WCD05-CS01-02`, `WCD05-CS01-03`
- `WCD05-CS02-01`, `WCD05-CS02-02`, `WCD05-CS02-03`
- `WCD05-CS03-01`, `WCD05-CS03-02`, `WCD05-CS03-03`, `WCD05-CS03-04`, `WCD05-CS03-05`, `WCD05-CS03-06`, `WCD05-CS03-07`

Integration conditions:

- Allocate no new source ID for WCD05-SRC-07; reuse `SRC-0041`.
- Exclude WCD05-SRC-09B entirely.
- Preserve the exact WCD05-SRC-09 locators above in relationship/hold evidence.
- Preserve the existing 403-access flags for WCD05-SRC-03 and WCD05-SRC-04 in provenance.
- Do not include any character schema, validator, data, or migration change. The USER character-schema gate remains pending and unimplemented.

**Final overall gate: PASS.** This final decision supersedes the earlier overall `REVISE` gate solely because the three blocking relation rows and their source/rebase dependencies were corrected and independently re-verified.
