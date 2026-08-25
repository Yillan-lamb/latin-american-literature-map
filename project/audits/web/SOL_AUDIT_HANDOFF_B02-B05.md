# SOL_AUDIT_HANDOFF_B02-B05

## 1. Scope and Git baseline

- Audit handoff scope: serial `WEB-CONTENT-EXPANSION` B02, B03, B04 and B05.
- Baseline: B01 Sol-audited commit `e804f4e` (database counts: 167 entities, 354 facts, 101 relationships, 128 sources, 63 cards).
- Branch: `codex/web-ce-b02-b05-luna-max`.
- Batch commits:
  - B02 `fd325ea` — `feat(data): complete WEB-CE-B02`
  - B03 `97fe225` — `feat(data): complete WEB-CE-B03`
  - B04 `d3c7ea6` — `feat(data): complete WEB-CE-B04`
  - B05 `286aff7` — `feat(data): complete WEB-CE-B05`
- No push, PR, merge, release, tag, production deployment, or `project/governance/PROJECT_CHARTER.md` edit was performed.

## 2. Machine-extracted batch matrix

Counts below are from the committed SQLite snapshots, not hand-written reports.

| Batch | Authors / works / places in scope | entities | facts | relationships | sources | cards | card-source rows | relationship evidence | new gaps | new relation holds |
|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| B02 | Asturias, Allende, Amado; 9 works; 2 country nodes | 14 | 39 | 12 | 10 | 12 | 18 | 12 | 0 | 0 |
| B03 | Onetti, Donoso, Sábato; 9 works; Uruguay + Santa María | 14 | 41 | 12 | 12 | 12 | 24 | 12 | 0 | 1 |
| B04 | Bioy Casares, Roa Bastos, Quiroga; 9 works; Paraguay | 13 | 42 | 12 | 12 | 12 | 22 | 12 | 1 | 0 |
| B05 | Machado, Guimarães Rosa, Graciliano; 9 works/collections; no new place | 12 | 42 | 12 | 12 | 12 | 30 | 15 | 0 | 0 |
| **B02–B05 cumulative** | **12 authors, 36 works/collections, 5 new Geo place nodes** | **53** | **164** | **48** | **46** | **48** | **94** | **51** | **1** | **1** |

The cumulative card-source increase is 94 (the per-Batch reports previously counted B02–B04 pre-remediation mappings; the committed snapshots are authoritative). Final B05 master totals: 220 entities, 518 facts, 149 relationships, 174 sources, 111 cards, 210 card-source rows, 176 relationship-evidence rows, 14 gaps, 51 relation holds.

## 3. Batch boundaries and traceability

- Each batch had a separate Preflight, change set, migration, fresh-context Review, QA and commit.
- Every next Preflight used the previous batch’s committed master.
- No B02–B05 migration overwrote an earlier migration; IDs are monotonic and endpoint foreign keys pass.
- Cross-batch reuse was intentional: the formal Brazil node `V1-ENT-0183` was reused by B02 and B05; no duplicate country entity was created.
- Collection schema was preserved where the sources identify story collections: B04 Quiroga collections and B05 `Sagarana` / `Primeiras Estórias`.

## 4. High-risk items for Sol

1. **B03 Santa María hold** — `V1-HOLD-0051` keeps `La vida breve → SET_IN → Santa María` out of accepted relations. Santa María remains a hidden fictional space with no coordinates; the source supports the literary-space classification but not the stronger scene relation.
2. **B04 Bioy year dispute** — `V1-GAP-0014` (`bibliographic_dispute`, `open_research`, owner `SOL_REVIEW`) preserves the 1940/1941 conflict for `La invención de Morel`; `V1-FCT-0443` has both sources and medium confidence, and public copy flags the dispute.
3. **B05 Machado source/genre mapping** — `SRC-0176` is now the open official MEC `Romance` catalogue page, and cards/facts for all three Machado novels carry it. Reopen the page and verify the title/year/genre mapping independently.
4. **B05 BNDigital provenance** — `SRC-0171` is a readable Fundação Biblioteca Nacional page but its footer attributes material to Wikipedia. B05 retains it as supplementary evidence and adds direct Prefeitura evidence to Graciliano `CREATED` relationships; Sol should verify that no evaluative text leaked into Research.
5. **B03 Sábato year variance / title variants** — B03 retained the institutionally supported 1961 value while recording a Cervantes 1962 variance; B02 recorded ABL/Compañhia title variants for `Capitães da Areia` without duplicate entities.

## 5. Source-risk summary

- Sources are primarily ABL/Cervantes/Memoria Chilena, national or university libraries, official cultural institutions and GeoNames.
- B02’s inaccessible/weak entries were replaced or remapped during its review; B03’s CVC/CONICET and national-library records were reopened; B04’s canonical Cervantes Virtual URL was corrected; B05’s inaccessible MEC download was replaced by the open category page.
- Automated URL probing in the final B05 run returned only network timeouts in this environment. The accepted source status therefore rests on the fresh Reviewer’s direct re-open records, not on the timeout-only probe.
- Chinese display names remain reader-facing candidates. Missing translator, publisher, ISBN and Chinese-edition year is intentional and is not a Research failure for this cycle.

## 6. Cross-Batch coverage and risks

- Country/region growth is broad: B02 added Guatemala, Chile and Brazil coverage; B03 Uruguay, Chile and Argentina; B04 Paraguay and Argentina/Uruguay reuse; B05 deepened Brazil without creating a duplicate country node.
- The cycle adds both long-form works and collections, and keeps the literary-space boundary explicit. It does not claim that author birthplace equals story setting.
- Potential Sol duplicate checks: Brazil author cluster (Jorge Amado from B02 vs B05 authors), title/diacritic variants (`Grande Sertão`, `São Bernardo`, `Capitães da Areia`), and country-place relation reuse.
- The cycle remains weighted toward narrative prose; poetry, drama and additional Caribbean/Andean coverage remain roadmap work, not a reason to alter these commits.

## 7. Website and product projection

From the B01 baseline to B05:

- Public curation: 13 → 25 authors, 24 → 60 works, 19 → 24 places; 60 distinct work reading approaches and 10 reading paths.
- Web Data: 167 → 220 entities, 63 → 111 cards, 25 → 30 Geo places, 30 → 42 place relations.
- B05 deploy candidate: 124 files / 116 routes; 112 public entities; 116 sitemap URLs; review queue is not exposed.
- Search, author pages, work/collection pages, country aggregation, timeline, Research Evidence and map boundary were exercised. Browser QA covers desktop and mobile Chromium.

## 8. QA record

- B02: master/Web validators, Geo boundary, public bundle and Chromium desktop/mobile pass; dynamic projection assertions fixed a prior hard-coded-count coverage gap.
- B03: master/Web validators, Santa María fictional-space boundary, public bundle and 28 Chromium tests pass.
- B04: master/Web validators, Bioy dispute presentation, collection projection, public bundle and 28 Chromium tests pass.
- B05: fresh-copy and formal migration, master validator, content-quality validator, Web Data validator, public bundle/UI scanner, Geo CSV audit, Node/Python syntax, and 28 Chromium desktop/mobile tests pass.

## 9. Recommended next-cycle checks

- Keep the serial fresh-Preflight and fresh-context Reviewer pattern.
- Reopen the B03/B04 high-risk records before accepting any new interpretive relation.
- Continue using direct source mappings for genre/form and preserve `work` vs `collection` at entity, fact, card and Web layers.
- Keep the current Chinese-display policy: preserve original titles and correct display names, but do not turn edition metadata into a Batch gate.
- Do not begin B06 as part of this handoff; Sol should audit this unit first.
