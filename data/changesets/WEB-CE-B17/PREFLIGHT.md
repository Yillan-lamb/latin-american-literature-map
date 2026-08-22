# WEB-CE-B17 Preflight

日期：2026-08-22

## Baseline

- Git baseline：`5f3b00c` (`feat(data): complete WEB-CE-B16`) on `codex/sol-audit-b11-b15`.
- B16 is closed at `BATCH_PASS`; its migration `0022_web_ce_b16_luna_max.sql`, review, curation, Web Data and browser QA are committed.
- Current master counts before B17: 353 entities, 955 facts, 281 relationships, 267 sources, 243 cards and 23 research gaps. `PRAGMA integrity_check` is `ok`; foreign-key check is empty; migration log ends at `0022_web_ce_b16_luna_max`.
- The workspace contains unrelated USER/external-delivery changes. They are out of scope and will not be staged.

## Roadmap and scope decision

The B17 roadmap is a dynamic close-out batch. The selected backup candidates are the roadmap-listed Lygia Fagundes Telles (Brazil), Jorge Icaza (Ecuador), and Rómulo Gallegos (Venezuela). This is a minimum necessary adjustment: Ecuador and Venezuela currently have no formal V1 country nodes, while the selection adds one Brazilian woman author and keeps twentieth-century novel/short-fiction coverage. No broad roadmap rewrite is made.

The batch reserves two country entities (`V1-ENT-0356` Ecuador and `V1-ENT-0357` Venezuela), three authors (`V1-ENT-0358`–`V1-ENT-0360`) and nine works/collections (`V1-ENT-0361`–`V1-ENT-0369`). It reserves sources `SRC-0270`–`SRC-0276`, facts `V1-FCT-0962`–`V1-FCT-1003`, cards `V1-CARD-0244`–`V1-CARD-0255`, relationships `V1-REL-0284`–`V1-REL-0295`, evidence `V1-EV-0309`–`V1-EV-0320`, card-source rows `V1-CS-0477`–`V1-CS-0497`, and gap `V1-GAP-0024`, pending final reviewer re-query.

## Deduplication

- Author checks across Chinese labels, original names, accents and aliases found no existing Lygia Fagundes Telles, Jorge Icaza or Rómulo Gallegos entity.
- Original-title checks found no existing `Ciranda de pedra`, `Antes do baile verde`, `As meninas`, `Huasipungo`, `En las calles`, `El chulla Romero y Flores`, `Doña Bárbara`, `Cantaclaro` or `Canaima` entity.
- Brazil is reused as `V1-ENT-0183`; Ecuador and Venezuela require new country nodes. Country nodes use polygon-only Geo records and no fabricated center coordinates.
- Source URL/title checks found no duplicate among the seven reopened A/B-level records. The BN catalogue is retained as a second authority record only because it conflicts with the ABL birth year; it is not silently collapsed.

## Evidence and semantic boundaries

- ABL profile and bibliography directly support Lygia's identity and the three selected Portuguese titles/forms/years. The BN catalogue authority line states 1918–2022, so the 1923 birth fact is medium confidence and tracked in `V1-GAP-0024`.
- The Ecuadorian CCE catalogue lists the selected Icaza novels; the Universidad Central del Ecuador thesis supplies life dates and publication years. Research uses the conservative identity “厄瓜多尔小说家与剧作家” and does not turn the thesis's indigenismo discussion into a strong movement relationship.
- Fundación Empresas Polar and Universidad de Carabobo profiles directly support Gallegos's Venezuelan identity, life dates, and the three selected novels. No influence or “founder/representative” relation is added.
- Chinese labels use `provisional_title`; original titles remain the entity anchors. No translator, publisher, ISBN or Chinese publication claim is required.

## Coverage note

B17 is expected to add three authors (one woman), nine works/collections, two country nodes and three author–country Geo relations. It improves the missing Ecuador/Venezuela coverage and Brazilian gender balance without claiming to solve the broader poetry, Caribbean, city or regional gaps. Those remain roadmap inputs for a later cycle and are not changed here.

## Preflight gate

`PREFLIGHT_PASS` — no duplicate entity, relation or source was found; the only planned research gap is the explicit Lygia birth-year dispute.
