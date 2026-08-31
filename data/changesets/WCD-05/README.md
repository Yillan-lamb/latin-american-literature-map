# WCD-05 Candidate Change Sets

These files are current-main candidates, not approved master data.

- CS01: direct `SET_IN` remediation and the contrary-source rejection review
- CS02: author `INFLUENCED_BY` remediation
- CS03: movement and theme remediation

Each row must receive a fresh `PASS`, `REVISE`, or `REJECT` from
`CODEX-REVIEW-WCD05`. Only `PASS` rows may be assigned final source,
relationship, and evidence IDs in append-only migrations.

There is intentionally no CS04. Character relations require a USER-approved
schema extension first; see the Character Schema Gate audit.
