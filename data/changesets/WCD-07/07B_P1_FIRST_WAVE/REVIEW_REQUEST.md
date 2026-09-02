# CODEX-REVIEW-WCD07B Request

Review date target: 2026-09-02
Reviewer role: new fresh-context, read-only, independent
Scope: WCD-07B exact 17-item P1 first-wave only

The reviewer did not participate in candidate generation, source search, or
drafting. Review all 17 rows against the live master and every file in this
directory. For each work and every supplied source, fact, and relationship use
only `PASS`, `REVISE`, `REJECT`, `DEFER`, or `USER_DECISION`.

The integrator proposes three PASS items and fourteen DEFER items. This is not
an approval target. Reject or revise any of the three if two intellectually
independent direct reliable sources do not actually establish canonical
identity, author, entity type, and first publication. Promote none of the
fourteen without the same evidence in the submitted package.

Required checks: canonical identity, author attribution, entity type, original
title, first publication, normalized duplicate status, collection/work
hierarchy, edition overlap, Chinese-title collision, source accessibility and
quality, intellectual independence, fact support, relationship support, and
Schema 0.4 endpoint compatibility.

Specific challenges:

1. `Inundación castálida`: decide whether the manifestation record, original
   facsimile, and independent CASS context support a 1689 collection. Do not
   infer that the existing `Primero sueño` is a contained work.
2. `Cantos para soldados y sones para turistas`: decide whether Britannica and
   BVMC independently support the 1937 poetry collection. The Chinese title is
   a provisional display gloss, not a claimed full translation.
3. `Todos los fuegos el fuego`: distinguish the missing original collection
   from existing child story `V1-ENT-0084`. Reuse `SRC-0066`; do not recreate
   the story or approve `CONTAINS_WORK` without direct contents evidence.
4. Confirm all other 14 have formal DEFER dispositions for source insufficiency
   and that no P1 later/P2/P3 item entered scope.
5. Approve no alias, edition, character, place, theme, movement, event, series,
   section, reader-route, or public-content expansion.

Only per-row PASS items may receive formal IDs and enter a migration. Write the
review to `../review/CODEX-REVIEW-WCD07B.md`; do not edit candidate files,
migrations, exports, site data, or the master database.
