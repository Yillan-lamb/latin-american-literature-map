# WEB-CE-B05 Final Batch Report

## Batch gate

`BATCH_PASS` — Luna Max serial execution completed the Brazilian classic-skeleton batch after fresh-context review and four-item remediation. The next batch must not be started in this cycle.

## Scope and baseline

- Task: `WEB-CE-B05` / Batch 05（巴西经典骨架）
- Preflight baseline: B04 commit `d3c7ea6`
- Formal migration: `data/master/migrations/0008_web_ce_b05_luna_max.sql`
- Reviewer: `LUNA-MAX-B05-REVIEW`; initial verdict `REVISE`, focused follow-up verdict `PASS`
- No `project/governance/PROJECT_CHARTER.md` change; no release/deploy/tag.

## Actual data delta

Machine-extracted B05 additions:

| layer | count | detail |
|---|---:|---|
| entities | 12 | 3 authors, 7 works, 2 collections |
| facts | 42 | atomic author/work bibliographic facts |
| relationships | 12 | 9 `CREATED`, 3 author → existing Brazil node |
| sources | 12 | ABL, library, public-culture, GeoNames and official MEC |
| content cards | 12 | 3 author cards, 9 work/collection cards |
| card-source rows | 30 | includes direct MEC genre mappings |
| Geo places | 0 | existing Brazil node reused |
| Geo relations | 3 | Machado, Guimarães Rosa, Graciliano Ramos → Brazil |
| curation entries | 0 formal rows | generated public projection expanded for the 12 new cards |
| holds / gaps | 0 new | inherited holds/gaps remain unchanged |

Final master counts are entities 220, facts 518, relationships 149, sources 174, content cards 111, gaps 14, relation holds 51.

## Review and remediation

The independent reviewer found no duplicate entities, invalid endpoints, fictional coordinates, or unsupported interpretive relationships. Four local issues were corrected in the migration and documented in `review/REMEDIATION.md`:

1. `SRC-0176` now points to the open official MEC `Machado de Assis - Romance` category page.
2. Machado’s three “小说” card/fact mappings now carry direct MEC genre evidence; ABL bibliography scope is narrowed to title/year support.
3. Guimarães Rosa’s minimal career fact `作家` now uses the ABL article that directly says `escritor`.
4. Graciliano’s three `CREATED` relationships now have direct Prefeitura cross-evidence in addition to the BNDigital record with explicit Wikipedia provenance.

## Product impact

- Public curation projection: 25 authors, 60 works, 24 places, 60 distinct reading approaches, 10 reading paths.
- Web Data: 220 entities, 111 cards, 30 places and 42 place relations.
- Deploy candidate: 124 files / 116 routes; public bundle and UI scanner pass.
- Browser QA confirms search, author/work/collection routes, Brazil country aggregation, map boundary and mobile navigation.

## Remaining state

- No new B05 HOLD or research gap.
- Existing project-level review items remain for Sol’s later cross-Batch audit, notably B03 Santa María `SET_IN` hold and B04 Bioy year dispute `V1-GAP-0014`.
- Chinese display names remain reader-facing candidates; translator/publisher/edition metadata was intentionally not treated as a B05 gate.

## Git

- B05 commit SHA: `286aff7` (`feat(data): complete WEB-CE-B05`).
