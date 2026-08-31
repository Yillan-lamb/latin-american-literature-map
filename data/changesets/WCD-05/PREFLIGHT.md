# WCD-05 Preflight

Date: 2026-08-30

## Current-main baseline

- Git baseline: `a9cd702fb851b295abc64b42210e8b49253f7ed3` (`origin/main` at task start)
- Research: Data 1.3.1 development candidate
- Web: Web 0.3.1 Development
- Master: `data/master/V1_MASTER.sqlite`
- Entities: 371
- Facts: 998
- Sources: 288
- Relationships: 306
- Relationship holds: 51
- Relationship schema: 0.3 (13 relation types; no character-to-work relation)

The launch prompt named `7ee22c0` as its baseline. The repository advanced before
formal execution, so WCD-05 was rebased to the then-current `origin/main` above.

## Hold baseline

| Relation type | Holds |
|---|---:|
| EXPLORES_THEME | 31 |
| ASSOCIATED_WITH_MOVEMENT | 14 |
| INFLUENCED_BY | 3 |
| SET_IN | 3 |
| **Total** | **51** |

All 51 external-package hold IDs still exist with matching subject, relation type,
and object. None had been resolved indirectly by WCD-02, WCD-03, or WCD-04.

## Network baseline

The WCD-04 definitions are retained: zero-degree means degree 0; weak-degree means
degree at most 1 **or** only one semantic relation type; connected means degree above
1 and more than one semantic relation type.

| Metric | Baseline |
|---|---:|
| zero-degree | 61 |
| weak-degree | 225 |
| connected | 85 |
| character coverage | 0 / 10 (0.0%) |
| movement coverage | 0 / 8 (0.0%) |
| theme coverage | 2 / 29 (6.9%) |
| event coverage | 1 / 5 (20.0%) |
| author coverage | 61 / 64 (95.3%) |
| place coverage | 34 / 35 (97.1%) |

`author-place coverage` is 58/64 authors with at least one
`ASSOCIATED_WITH_PLACE` edge. `fictional-place coverage` is 3/4 Geo-classified
fictional/unknown-fictional place entities participating in at least one Research
relationship; Santa María is the zero-degree fictional place. These scoped figures
were recomputed from the master rather than inferred from the WCD-04 totals.

## Schema and migration preflight

- Latest applied migration: `0030_wcd03_chinese_display_names`
- Next available migration number: `0031`
- Character entities: 10
- Existing `key_character` facts: 15 across 15 work subjects; 6 of those facts
  contain the names represented by all 10 current character entities
- No current relation type legally links `character -> work`.

Character remediation therefore remains a USER schema gate. It does not block the
review of relation types already legal under schema 0.3.

## External-source duplicate findings

The following external source candidates are the same source identity as an
existing formal source and must not receive another `SRC-` ID:

- RS-02 = SRC-0007
- RS-06 = SRC-0056
- RS-14 = SRC-0064
- RS-15 = SRC-0143
- RS-17 = SRC-0028
- RS-24 = SRC-0053

## Scope guard

WCD-06 rewrite/triage material and WCD-07 work candidates remain downstream input
only. No new work entities, reader prose, review approvals, release tag, or public
deployment is authorized by this change set.
