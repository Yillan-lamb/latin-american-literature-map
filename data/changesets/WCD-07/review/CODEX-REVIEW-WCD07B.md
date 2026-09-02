# CODEX-REVIEW-WCD07B

Reviewer identity: **CODEX-REVIEW-WCD07B**
Role: fresh-context independent reviewer; not involved in candidate generation, source retrieval, or drafting
Scope: exact WCD-07B 17-item P1 first wave only
Baseline checked: live `data/master/V1_MASTER.sqlite`, Schema 0.4
Review date: 2026-09-02

## Overall decision and migration gate

**DEFER — MIGRATION GATE CLOSED.**

The submitted package does not presently permit an independent reviewer to confirm the required two intellectually independent, direct, reliable sources for any of the three proposed-PASS works. The underlying bibliographic propositions are plausible and the duplicate/hierarchy analysis is mostly sound, but plausibility and source reputation do not substitute for reviewable evidence.

In this review session, the corrected BnF record for `SRC-0066` was directly accessible and its page metadata visibly identifies Julio Cortázar and lists *Todos los fuegos el fuego, 1966*. The BVMC, Britannica and CASS candidate URLs returned HTTP 403 to direct retrieval; the Biblioteca Nacional Mariano Moreno URL could not be verified because its TLS certificate was expired. The package contains claim-scope assertions but no preserved quotations, page images, catalog export, checksum-bound snapshot, or other evidence artifact from which the claimed author, entity layer and first-publication statements can be independently rechecked.

Accordingly:

1. No WCD-07B work row may receive a formal entity ID or enter a migration on this review.
2. Preserve the corrected WCD07B-S06 reuse record: it now points to the live-master `SRC-0066` URL `https://catalogue.bnf.fr/ark:/12148/cb352151483`, and the erroneous candidate `publication_year=1970` has been cleared. This correction was made during review and is accepted.
3. Re-submit W01-W03 with two independently reviewable direct sources per work. An accessible institutional page is sufficient; otherwise include a stable local evidence artifact with exact locator and provenance.
4. Keep W04-W17 deferred. The package supplies no source, fact, or relationship candidates for those rows and therefore cannot meet the admission gate.
5. Do not migrate `WCD07B-F013` as a formal fact. Its content is an internal hierarchy/audit boundary; keep it in the review or migration notes, not the facts table.
6. Preserve all stated exclusions: no alias, edition, character, place, theme, movement, event, series, section, reader-route, public-content, or unsupported `CONTAINS_WORK` expansion.

## Read-only baseline findings

- The live master reports `schema_version=0.4`.
- Author endpoints `V1-ENT-0322`, `V1-ENT-0310`, and `V1-ENT-0073` exist and are typed `author`.
- `V1-ENT-0084` exists as the `work` *El otro cielo* / 《另一个天空》, authored by `V1-ENT-0073`; it must not be recreated.
- `V1-ENT-0329` exists separately as the `work` *Primero sueño* / 《第一梦》. Nothing in the WCD-07B package directly proves a `CONTAINS_WORK` relation from *Inundación castálida* to that existing work.
- No exact original-title or submitted Chinese-display-title entity was found for W01-W03 in the live master.
- `SRC-0066` exists in the live master at BnF ark `cb352151483`. The initially submitted S06 ark `cb35154419r` was a different record and could not validly be labeled `REUSE_SRC_0066`; the candidate row was corrected during review.
- `CREATED` is an allowed Schema 0.4 predicate and the proposed direction `author -> work/collection` is compatible. Endpoint compatibility does not cure the source gate.
- The 17 submitted work rows exactly match the declared P1 first-wave scope. No later-P1, P2, or P3 work entered this package.

## Work candidates

| Candidate | Decision | Review finding |
|---|---|---|
| WCD07B-W01 | DEFER | The primary 1689 facsimile plus independent CASS context could in principle establish the collection, but the package provides no reviewable evidence extract and all three submitted URLs were unavailable to this reviewer. S01 and S02 are not intellectually independent merely because the BVMC catalog record and its hosted facsimile have different URLs. Do not infer that existing *Primero sueño* is contained in this manifestation. The Chinese title remains a provisional display gloss, not a canonical edition or alias. |
| WCD07B-W02 | DEFER | Britannica and BVMC are institutionally independent and could satisfy the gate if their pages directly show Guillén, poetry-book/collection identity and 1937. Both returned 403 in this review, and the package preserves no inspectable evidence. Keep `《给士兵的歌·给游客的颂调》` provisional and do not infer a full Chinese translation or edition. |
| WCD07B-W03 | DEFER | The original collection is distinct from existing child story `V1-ENT-0084`, and the corrected BnF record directly supports Cortázar plus the title/year 1966. The second claimed direct source, S07, was not independently inspectable, so the two-source work gate is not met in the reviewable package. Reuse `SRC-0066`; create neither the story nor `CONTAINS_WORK`. Keep `《万火归一》` as a display candidate unless a Chinese-edition source is separately admitted. |
| WCD07B-W04 | DEFER | No submitted direct sources. The proposed independent-work/not-*El arco y la lira*-edition boundary is reasonable but unverified. |
| WCD07B-W05 | DEFER | No submitted direct sources. Preserve the distinction from both existing *El Aleph* story and collection layers; no merge or containment change. |
| WCD07B-W06 | DEFER | No submitted direct original-language sources. A 2022 Chinese edition clue cannot establish the original work record by itself. |
| WCD07B-W07 | DEFER | No submitted direct sources. Multi-voice or epistolary form would not itself create a collection layer, but the work record is not admission-ready. |
| WCD07B-W08 | DEFER | No submitted direct sources. Treat as a possible volume-level collection parallel to existing volume I; Schema 0.4 has no `series` entity type. |
| WCD07B-W09 | DEFER | No submitted direct sources. Same boundary as W08; do not create or imply a series entity. |
| WCD07B-W10 | DEFER | No submitted direct sources. The likely single-novel identity and Chinese title remain unverified for migration. |
| WCD07B-W11 | DEFER | No submitted direct sources. Preserve the existing *Canto General* collection / *Alturas de Macchu Picchu* work split; do not infer containment. |
| WCD07B-W12 | DEFER | No submitted direct sources. Do not substitute a Chinese selection or posthumous compilation for the Spanish original work. |
| WCD07B-W13 | DEFER | No submitted direct sources. The Chinese publishing series is not a collection entity, and the alternate Chinese title remains an alias candidate only. |
| WCD07B-W14 | DEFER | No submitted direct sources. Regional Chinese titles are edition-specific candidates, not separate works or approved aliases. |
| WCD07B-W15 | DEFER | No submitted direct sources. Intertextual connection with Macondo works does not establish collection or edition hierarchy. |
| WCD07B-W16 | DEFER | No submitted direct sources. A completed memoir volume may be one work; do not create a series, and keep Chinese publication-month conflict at edition level. |
| WCD07B-W17 | DEFER | No submitted direct sources. Preserve the work/movement distinction and treat 1993/2021 Chinese publications only as edition leads. |

## Source candidates

| Candidate | Decision | Review finding |
|---|---|---|
| WCD07B-S01 | DEFER | BVMC manifestation record is a potentially strong catalog source, but returned 403 and no evidence artifact is supplied. It is not intellectually independent from S02 merely because its source key differs. |
| WCD07B-S02 | DEFER | The 1689 facsimile is potentially decisive primary evidence, but returned 403 and the title page is not preserved in the package. Add an accessible facsimile or a checksum-bound title-page image/PDF locator. |
| WCD07B-S03 | DEFER | CASS is institutionally independent and potentially useful for Chinese display and collection context, but the HTTP page returned 403 and the package contains no exact passage. Its stated scope does not claim complete first-publication metadata. |
| WCD07B-S04 | DEFER | Britannica is independent of BVMC and potentially suitable as B-level bibliography/context, but returned 403 and no evidence passage is preserved. |
| WCD07B-S05 | DEFER | BVMC is potentially suitable as an A-level work record, but returned 403 and no inspectable record export or evidence extract is supplied. |
| WCD07B-S06 | PASS | Corrected to exact live-master `SRC-0066` identity and URL. The accessible BnF record names Cortázar and lists *Todos los fuegos el fuego, 1966*. Reuse only; allocate no new source ID and do not overwrite the master row. |
| WCD07B-S07 | DEFER | The BVMC scholarly bibliography would be intellectually independent of BnF, but returned 403 and the cited PDF pages/entry are not preserved. Add page number plus accessible or local evidence artifact. |
| WCD07B-S08 | DEFER | Supplemental BNMM cross-check was not verifiable because the site's TLS certificate was expired. It is not needed if S06 plus a reviewable S07 are supplied; do not bypass the certificate warning. |

## Fact candidates

| Candidate | Decision | Review finding |
|---|---|---|
| WCD07B-F001 | DEFER | Collection-layer conclusion depends on presently unreviewable S01/S02 and independent context. |
| WCD07B-F002 | DEFER | 1689 is visible in the candidate metadata but not independently rechecked from two reviewable direct sources. |
| WCD07B-F003 | DEFER | `诗文集` classification requires the unavailable CASS passage or another direct contents/catalog statement. |
| WCD07B-F004 | DEFER | Madrid/Juan García Infanzón/1689/title-page note requires an inspectable title page or catalog export. |
| WCD07B-F005 | DEFER | Collection identity depends on unavailable S04/S05 evidence. |
| WCD07B-F006 | DEFER | 1937 depends on unavailable S04/S05 evidence. |
| WCD07B-F007 | DEFER | Poetry-collection classification depends on unavailable S04/S05 evidence. |
| WCD07B-F008 | DEFER | Bibliographic sentence is not independently reviewable; retain the explicit no-Chinese-edition boundary. |
| WCD07B-F009 | DEFER | BnF supports a separately dated title within the omnibus record, but S07 is needed to independently establish original short-story-collection layer. |
| WCD07B-F010 | DEFER | BnF visibly supports 1966; defer until the independent S07 entry is reviewable. |
| WCD07B-F011 | DEFER | Short-story-collection classification requires the reviewable S07 entry or another direct source. |
| WCD07B-F012 | DEFER | S07 alone is cited and was not inspectable; add exact page/entry evidence. |
| WCD07B-F013 | REVISE | This is an internal hierarchy/audit instruction, not a source-derived formal fact. Retain it outside the facts table. Its substance is correct: `V1-ENT-0084` exists, must not be duplicated, and no containment edge is approved. |

## Relationship candidates

| Candidate | Decision | Review finding |
|---|---|---|
| WCD07B-R01 | DEFER | Schema-compatible `V1-ENT-0322 -> CREATED -> WCD07B-W01`, but its cited evidence was not independently inspectable and the object work row is deferred. |
| WCD07B-R02 | DEFER | Schema-compatible `V1-ENT-0310 -> CREATED -> WCD07B-W02`, but its cited evidence was not independently inspectable and the object work row is deferred. |
| WCD07B-R03 | DEFER | Schema-compatible `V1-ENT-0073 -> CREATED -> WCD07B-W03`; BnF directly supports authorship, but the object work row remains deferred under the package's two-source admission rule. Reuse `SRC-0066` if later admitted. |

## Duplicate, hierarchy, edition, Chinese-name, and scope decisions

- Duplicate audit: PASS as a read-only audit result for the exact 17 rows. No normalized exact original-title match was found for the proposed new works. W03's child-work overlap is correctly separated from duplicate identity.
- W01 hierarchy: PASS. Do not infer *Primero sueño* membership from co-presence, chronology, or common authorship.
- W03 hierarchy: PASS. The missing collection may eventually be added without recreating `V1-ENT-0084`; `CONTAINS_WORK` remains unapproved until a direct contents source is reviewed.
- W05 and W11 hierarchy cautions: PASS. Preserve the existing story/collection and work/collection distinctions.
- W08-W09 series boundary: PASS. Schema 0.4 does not authorize a `series` entity.
- Chinese-name/edition boundary: PASS only as an audit boundary. W01-W03 Chinese strings may be retained as provisional display candidates; this review approves no formal alias or edition record.
- Scope control: PASS. Exactly 17 P1-first-wave rows were submitted; no P1-later, P2, P3, or public-content expansion is approved.

## Conditions for re-review

The smallest sufficient follow-up is:

1. For each of W01-W03, provide two independent direct sources with exact evidence locator for author, canonical title, entity layer and first publication.
2. If a live page is access-controlled or anti-bot protected, include a lawful local snapshot or catalog export, capture date, canonical URL, and page/field locator so the reviewer can inspect the evidence without bypassing access controls.
3. For W03, keep S06 as reuse of `SRC-0066`; add no duplicate source row. Supply S07's exact bibliography page and entry.
4. Move F013 to an audit/migration note rather than a formal fact candidate.

Until those conditions are met and a fresh re-review returns per-row `PASS`, the WCD-07B migration gate remains closed.
