# SOL-AUDIT-B06-B10 Remediation

- Audit scope: `WEB-CE-B06` through `WEB-CE-B10`
- Auditor: Sol / Codex independent audit
- Baseline handoff: `fc533a8`
- Content corrective migration: `data/master/migrations/0014_sol_audit_b06_b10_remediation.sql`
- Content migration SHA-256: `6823a6f9b17c6f6a7fa025a941f5ccb125f7c20955b13b4667eff7b01ce297a6`
- Provenance corrective migration: `data/master/migrations/0015_sol_audit_b06_b10_migration_reconciliation.sql`
- Provenance migration SHA-256: `bd8b799bf5a7fa8c651ccc457dbf2f07f625874b18845bbed49f89111481fa5c`

## Applied corrections

1. Corrected the first-publication year of Roberto Bolaño's *2666* from 2005 to 2004 in facts, fact-source links, the content card, curation projection, web data, timeline, and USER_REVIEW preview. Memoria Chilena's author page states 2004; the previously used 2005 archive heading describes a later award record rather than first publication.
2. Added a repeatable browser regression covering the B06-B10 public boundary, USER_REVIEW preview routes and search, Nicaragua map projection, and the corrected *2666* timeline year.
3. With explicit USER authorization, removed only the `BEGIN;` / `COMMIT;` wrappers from migrations `0010`-`0012`; no data statement was changed.
4. Added migration `0015` to reconstruct the three missing formal log rows on the existing master while remaining a no-op for those rows during a clean replay.

## Application method

Both corrective migrations were first applied to copies of the master database and validated. Migration `0015` was then applied to the formal master with `scripts/apply_migration.py`.

The original and normalized SHA-256 values for the three USER-authorized historical edits are:

| Migration | Original SHA-256 | Normalized SHA-256 |
|---|---|---|
| `0010` | `cd7df0e6eafe6608897a5b96960de70c57927452afb7c6be95adda56676d545d` | `544c735aa12a7cf9ed6e0dfc68574d51466c3fea6dbaadb45e91e6ae06fb6191` |
| `0011` | `458f7799e9612c7e6d5adb56ffb942b25cdf144d0bb8a7b655dc39cd2c889db2` | `66f9efb38fc5cf0e5a056b00ee6f227e1e4ed8ff49fd021f8f9532f6aebd9769` |
| `0012` | `a070ef2f4aa7e5fae6f8fd9d629c57d665897479840d1252014c74cda45fa95c` | `c51341d2ed62e48229adfbe73b78fed8d3101d71efa015b31a17453d89574b3c` |

## Replay evidence

Starting from the B05 master at commit `286aff7`, the official migration tool applied `0009` through `0015` consecutively. All 18 non-log tables matched the repaired formal-master copy row for row. The formal master now contains a continuous `0001`-`0015` log; backfilled B07-B09 rows are truthfully labeled `SOL-AUDIT-RECONSTRUCTED`.
