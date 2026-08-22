# WEB-CE-B14 remediation record

## Cross-batch Cuba node correction

The B14 fresh-context Reviewer found that the existing WEB-CE-B13 Nicolás Guillén geography relationship (`V1-REL-0247`) and its Geo projection (`V2-GEO-REL-067`) pointed to `V1-ENT-0235`, which is the Nicaragua node. The current master identifies Cuba as `V1-ENT-0096`.

This is a traceable correction, not a rewrite of B13 history:

- migration `0019_web_ce_b14_luna_max.sql` updates `V1-REL-0247` and its evidence note;
- `PLACE_RELATIONS.csv` updates `V2-GEO-REL-067` and records the correction in its description;
- the same corrected Cuba node is used for B14 Lezama and Cabrera relations (`V1-REL-0257`/`0258`);
- the old B13 migration remains unchanged and replayable.

## Other B14 review corrections

- The Chinese display labels for `Vista del amanecer en el trópico` and `La Habana para un infante difunto` were swapped in the candidate, migration, cards, and curation projection.
- `La Habana para un infante difunto` keeps its work/entity layer but leaves form open; the unsupported novel fact was removed.
- 1957 for `La expresión americana`, 1691 for `Respuesta a Sor Filotea de la Cruz`, and 1689 for `Amor es más laberinto` are recorded as `composition_year` with explicit lecture/completion/premiere notes, not `first_publication_year`.
- SRC-0247 is marked `access_limited` because the deep Cervantes Virtual page timed out during review; SRC-0248 independently supports the key Lezama dates. SRC-0251 uses the canonical UNAM repository URL.
