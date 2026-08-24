# WEB-CE-B12 Preflight

- Task: `WEB-CE-B12`
- Batch start: `2026-08-21`
- Baseline: `7b26f86` (`codex/web-ce-b11-b15-luna-max`), B11 is independently committed and its Sol-audited parent is `484d6b6`.
- Current master before B12 research: 293 entities, 782 facts, 221 relationships, 228 sources, 183 cards; migration log through `0016_web_ce_b11_luna_max`.
- Plan slice: Samanta Schweblin (Argentina), Mariana Enriquez (Argentina), Alejandro Zambra (Chile); three representative works per author.

## Deduplication

- Author exact, normalized, accent-insensitive, and alias checks found no existing entity for Samanta Schweblin, Mariana Enriquez, or Alejandro Zambra.
- Work checks against original titles, Chinese labels, work/collection layer, and existing `CREATED` triples found no duplicate for the nine selected titles.
- Source checks use canonical institutional/publisher URLs; no matching URL or normalized title/institution key is present in the current source table.
- The Argentina place node `V1-ENT-0001` and Chile place node `V1-ENT-0123` are reused. The three author–place triples are new.

## Scope adjustment

The roadmap was followed without adding interpretive relationships or new places. Chinese labels are reader-facing provisional labels; original-language titles remain entity anchors. No translator, ISBN, publisher, or Chinese-edition audit was used as a gate.

## Evidence and risk notes

- Research is limited to directly stated identity, birth year, country, work title, work layer, selected publication/award years, and author–work/author–country relations.
- The Argentine Ministry of Education source explicitly copyright-dates `Distancia de rescate` to 2014 and lists Schweblin's story collections; current PRH edition dates are not used as first-publication years.
- Anagrama directly identifies Enriquez's selected books as a novel or story collections; only the 2016 publication statement for `Las cosas que perdimos en el fuego` and the 2019 Herralde award year for `Nuestra parte de noche` are retained.
- Zambra's 2006/2007/2011 chronology is directly stated by Anagrama and independently corroborated by Memoria Chilena's article. No setting relationship or coordinate is inferred from publisher summaries.
- No fictional or work-level location is accepted in this batch; only author-to-country Geo relations are projected.
