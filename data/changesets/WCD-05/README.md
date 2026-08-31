# WCD-05 Candidate Change Sets

These files are current-main candidates, not approved master data.

- CS01: direct `SET_IN` remediation and the contrary-source rejection review
- CS02: author `INFLUENCED_BY` remediation
- CS03: movement and theme remediation
- CS04: USER-approved `APPEARS_IN` character -> work candidates, with one row
  per existing character and explicit source-link validation

Each row must receive a fresh `PASS`, `REVISE`, or `REJECT` from
`CODEX-REVIEW-WCD05`. Only `PASS` rows may be assigned final source,
relationship, and evidence IDs in append-only migrations.

CS04 exists only after the USER approved Character Schema Gate Option A. Its
`key_character` facts are candidate seeds, not automatic conversions. The two
Francisco Rosas / Julia Andrade seeds are normalized to the source-supported
work `V1-ENT-0032` (`Los recuerdos del porvenir`), not the incorrectly proposed
`V1-ENT-0147` (`La muerte de Artemio Cruz`). Only independently reviewed `PASS`
rows may enter the append-only migration.
