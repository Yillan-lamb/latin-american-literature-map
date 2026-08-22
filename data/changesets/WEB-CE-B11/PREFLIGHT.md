# WEB-CE-B11 Preflight

- Task: `WEB-CE-B11`
- Batch start: `2026-08-21`
- Baseline: `484d6b6` (`codex/sol-audit-b06-b10`), Sol B06-B10 remediation already present.
- Plan slice: Manuel Puig / Silvina Ocampo / Roberto Arlt; nine roadmap works.
- Current master before research: 281 entities, 729 facts, 209 relationships, 222 sources, 171 cards; migration log 0001–0015.

## Deduplication

- Author exact/normalized checks (Chinese names, original names, accent-insensitive forms, aliases): no existing Puig, Ocampo, or Arlt author entity.
- Work checks (original title, Chinese display label, collection/work layer, author endpoint): none of the nine selected works exists in the master; no existing `CREATED` relation for these author/title pairs.
- Source checks: the six selected institutional sources are not present under their canonical URLs or normalized title/institution keys; they are registered as new B11 sources.
- Relationship checks: the three Argentina author-place relations are new triples; the Argentina place node `V1-ENT-0001` is reused.

## Scope adjustment

The roadmap was followed without adding interpretive relationships or new places. All Chinese labels are reader-facing provisional/common labels only; original-language titles remain the entity anchors. No translator, publisher, ISBN, or full Chinese edition audit was made a gate.

## Risk notes

- All formal claims are limited to directly stated identity, bibliographic year, work layer, and author–work/author–Argentina relations.
- Ocampo's and Arlt's literary descriptions are kept at source wording; stronger claims about the Argentine “edge tradition”, popular culture, or influence remain curation/user-review candidates, not Research facts.
- No story-setting or fictional-place relation is accepted in this batch; no coordinate is added.
