# CODEX-REVIEW-WCD07A Request

Review date target: 2026-09-02
Reviewer role: fresh-context, read-only, independent
Scope: WCD-07A P0 only

The reviewer did not participate in candidate generation, source search, or
drafting. Review all six rows against the live master and the files in this
directory. For every work, source, fact, and relationship candidate, use only
`PASS`, `REVISE`, `REJECT`, `DEFER`, or `USER_DECISION`.

Required checks: canonical identity, author attribution, entity type, original
title, first publication, normalized duplicate status, collection/work
hierarchy, edition overlap, Chinese-title collision, directness and quality of
each source, intellectual independence, fact support, relationship support,
and Schema 0.4 endpoint compatibility.

Specific challenges:

1. Decide whether the single hybrid book `El arte de la fuga` is correctly
   represented as `work`; reject the external pack's false claim that the
   current three Pitol novels belong to its memory trilogy.
2. Verify that two convergent stronger sources justify 1943 for
   `Terras do sem-fim`, while the lone 1942 statement remains an audited
   conflict rather than a second fact.
3. Confirm `Versos libres` is a posthumous original poetry collection distinct
   from `Versos sencillos` and from later Chinese selections.
4. Do not approve any alias, edition, character, place, theme, movement, event,
   or public-reader expansion.

Only per-row `PASS` items may be assigned formal IDs and migrated. Write the
review result to `../review/CODEX-REVIEW-WCD07A.md`; do not edit candidate files
or the master database.
