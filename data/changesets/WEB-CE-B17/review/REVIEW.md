# WEB-CE-B17 fresh-context review

## Verdict: PASS

I independently reopened all seven candidate URLs on 2026-08-22. The ABL profile confirms Lygia Fagundes Telles as born in São Paulo on 19 April 1923 and deceased in 2022; the ABL bibliography directly lists *Ciranda de pedra* (romance, 1954), *Antes do baile verde* (contos, 1970), and *As meninas* (romance, 1973). The Biblioteca Nacional record for *Os contos* is accessible and explicitly shows the authority string “Telles, Lygia Fagundes, 1918–2022”; retaining 1923 as a medium-confidence candidate with an open `DISPUTED-YEAR` gap is therefore correct. The dispute must remain visible and must not be flattened into an uncontested public date.

The CCE catalogue page lists the three Icaza titles. The UCE PDF biography and works list support Icaza (1906–1978), *Huasipungo* (1934), *En las calles* (1935), and *El chulla Romero y Flores* (1958). The Polar profile supports Gallegos’s *Doña Bárbara* (1929), *Cantaclaro* (1934), and *Canaima* (1935); the Universidad de Carabobo page independently supports 1884–1969 and the 1929/1935 dates. The selected author/work entity layers are conservative and correctly avoid adding movement, influence, setting, or thematic claims.

Chinese names are consistently marked as reader-facing `provisional_title`, with the Portuguese/Spanish original retained. The two new Geo rows are country-only, have null coordinates, and explicitly require a country polygon; no fabricated centroid or author birthplace is introduced. Relations are limited to author–work and author–country associations. Curation remains `user_review` and cites Research facts; it does not promote curator language into Research facts.

## IDs, migration, and rehearsal

- Candidate IDs, migration IDs, source IDs, fact/card/relationship IDs, and the `V1-ENT-0183` Brazil reuse are internally consistent; no duplicate B17 IDs were found.
- `0023_web_ce_b17_luna_max.sql` contains the expected seven sources, 14 new entities, 42 facts, 12 relationships, evidence/source links, and one open disputed-fact gap. It has no explicit transaction wrapper.
- `/private/tmp/lalm-b17-rehearsal.sqlite` reports `PRAGMA integrity_check = ok`; the B17 migration log row is present. Manual orphan checks for facts, fact_sources, card_facts, relationships, relationship_sources, and relationship_evidence all returned zero.
- The rehearsal connection reports `PRAGMA foreign_keys = 0` (disabled for that connection), so the FK result is “manual orphan checks pass; SQLite FK enforcement was not enabled in the inspection connection,” not an assertion that runtime FK enforcement was on.

No blocking data defect was found. Provenance follow-up completed before staging: the migration’s `mapping_basis` strings now identify the fresh-context PASS record (`LUNA-MAX-B17-REVIEW`, 2026-08-22), and the migration was rehashed and re-rehearsed. The final migration SHA-256 is `327eb5f4d2e535dd4450e14e8c14e3a6b89ce18a9d80f59f5af23c3df5e3faf7`. The rehearsal was rerun with explicit foreign-key enforcement; `integrity_check=ok` and `foreign_key_check` was empty.
