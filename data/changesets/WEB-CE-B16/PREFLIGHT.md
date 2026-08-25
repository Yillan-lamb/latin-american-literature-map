# WEB-CE-B16 Preflight

日期：2026-08-22

## Baseline

- Git baseline：`a3dd71c` (`fix(audit): remediate WEB-CE-B11-B15`) on `codex/sol-audit-b11-b15`.
- Sol B11–B15 audit/remediation is present: `project/audits/web/SOL_AUDIT_B11-B15.md`, `data/changesets/SOL-AUDIT-B11-B15/REMEDIATION.md`, and migration `0021_sol_audit_b11_b15_remediation.sql`.
- Migration log contains `0001`–`0021`; current master counts are 341 entities, 919 facts, 269 relationships, 258 sources, 231 cards and 22 research gaps. `integrity_check=ok`; foreign-key check is empty; the B11–B15 Web Data/browser baseline is recorded in the Sol report.
- This batch reserves, pending final re-query: authors `V1-ENT-0344`–`V1-ENT-0346`; works/collections `V1-ENT-0347`–`V1-ENT-0355`; sources `SRC-0261`–`SRC-0269`; facts `V1-FCT-0926`–`V1-FCT-0961`; cards `V1-CARD-0232`–`V1-CARD-0243`; relationships `V1-REL-0272`–`V1-REL-0283`; evidence `V1-EV-0297`–`V1-EV-0308`; gap `V1-GAP-0023`.

## Roadmap and scope decision

The roadmap default for B16 is retained: Luis Sepúlveda, Guadalupe Nettel and Cristina Peri Rossi, up to three works each. Peri Rossi’s third work is the poetry book `Descripción de un naufragio` (1975), chosen to address the project’s poetry imbalance while remaining directly listed in the Cervantes chronology and bibliography.

For Nettel, the roadmap’s Chinese label `《真正的孤独》` is not treated as a Spanish title. The selected Spanish entity is `Pétalos y otras historias incómodas` (Anagrama, 2008); `《真正的孤独》` remains a provisional display label only. `La hija única` and `El matrimonio de los peces rojos` are separately established Spanish titles from publisher pages. Original titles are retained for all three.

## Deduplication

- Author name, accent, alias and country checks found no existing Luis Sepúlveda, Guadalupe Nettel or Cristina Peri Rossi entity.
- Original-title checks found no existing `Un viejo que leía novelas de amor`, `Historia de una gaviota y del gato que le enseñó a volar`, `Mundo del fin del mundo`, `La hija única`, `El matrimonio de los peces rojos`, `Pétalos y otras historias incómodas`, `Los amores equivocados`, `La tarde del dinosaurio` or `Descripción de un naufragio`.
- The Chile, Mexico and Uruguay country nodes are reused (`V1-ENT-0123`, `V1-ENT-0051`, `V1-ENT-0196`); no new place entity is proposed.
- Canonical URL and title checks found no duplicate source among the nine B16 sources. Formal evidence uses only the reopened A/B sources; Chinese retail/catalogue discovery is not a Research source.

## Evidence and semantic boundaries

- Memoria Chilena directly lists a 1989 Madrid edition of `Un viejo que leía novelas de amor`; the BND academic article lists a later 1993 Tusquets edition among Sepúlveda’s initial books. The migration records `first_book_edition_year=1989`, creates `V1-GAP-0023`, and does not assert a first-publication year.
- The BND article directly lists `Mundo del fin del mundo` (1994) and `Historia de una gaviota y del gato que le enseñó a volar` (1996), and distinguishes travel narrative/children’s novel forms. No stronger ecological or post-boom claim is written as a Research fact.
- Anagrama and Páginas de Espuma pages establish Nettel’s author identity and the Spanish titles/forms/years of the three selected books. The Chinese label for `Pétalos...` is display-only and provisional.
- Instituto Cervantes biography, chronology and bibliography establish Peri Rossi’s 1941 Uruguayan identity, `Los amores equivocados` (2015), `La tarde del dinosaurio` (1976), and `Descripción de un naufragio` (1975 poetry). No influence or literary-movement relation is added.

## Coverage note

B16 adds three authors (two women and one man), one poetry collection, four additional collections and four work-layer entries, and reuses three country map nodes without fabricating coordinates. It improves Uruguay and Chile visibility and adds a contemporary Mexican woman author; it does not claim to solve the remaining Venezuela/Ecuador/city coverage gaps, which remain for B17 Preflight.
