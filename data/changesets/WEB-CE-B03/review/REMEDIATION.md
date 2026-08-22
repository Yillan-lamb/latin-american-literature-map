# WEB-CE-B03 Sol/Luna Remediation

## Initial reviewer state

Fresh-context reviewer LUNA-MAX-B03-REVIEW initially returned REVISE. The blocking issue was the semantic mismatch between an accepted SET_IN relation and evidence that only established Santa María as a literary space. Three lower-level corrections were also required.

## Minimal corrections

1. V1-REL-0127 was removed from formal relationships and retained as V1-HOLD-0051 with relation_hold_evidence V1-HEV-0044. It remains a SET_IN research lead with hold_needs_direct_scene_evidence; it is not exposed in PLACE_RELATIONS.csv.
2. Added SRC-0152, the directly opened Centro Virtual Cervantes Santa María page, as the explicit fictional-space classification source. The Santa María Geo row remains fictional_place / fictional / hidden with blank latitude and longitude.
3. Changed V1-CARD-0079.genre_or_form from 短篇小说 to 中篇小说 / novela corta.
4. Normalized V1-ENT-0186.original_name to Ernesto Sábato while documenting the unaccented search variant in normalization_basis.
5. Narrowed V1-FCT-0427 to 作家、画家；受过物理学训练并曾任教.
6. Recorded the 1961/1962 source-year variance for Sobre héroes y tumbas in the review trail; the formal 1961 value is supported by the Argentine National Library and CONICET sources.

## Re-verification

- Migration copy: validate_master.py PASS; PRAGMA integrity_check=ok; foreign-key check empty.
- Master after migration: entities 195; facts 434; relationships 125; sources 150; cards 87; relation holds 51; hold evidence 44.
- Follow-up reviewer verdict: PASS; no new P0/P1 issue.
- B03 gate after remediation: BATCH_PASS.
