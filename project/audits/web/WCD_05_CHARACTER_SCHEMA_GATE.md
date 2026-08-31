# WCD-05 Character Relationship Schema Gate

Status: **DONE / USER APPROVED OPTION A**
Date: 2026-08-31
Current schema: Research Relationship Schema 0.4

## Decision

USER approved the minimal Option A extension:

```text
APPEARS_IN
character -> work
```

The implementation is additive and complete. Character coverage is 10/10 after
independent row-level review and append-only migration `0034`.

## Pre-decision limitation

Schema 0.3 defined 13 relation types but no legal character endpoint. The master had
10 character entities and 15 `key_character` facts across 15 work subjects. Six of
those fact rows contain the names represented by all 10 existing character entities.
Those facts were candidate evidence, not relationships, and could not be projected as
a network edge under Schema 0.3.

## Options

| Item | Option A — minimal edge | Alternative B — broader family | No-change option |
|---|---|---|---|
| Relation name | `APPEARS_IN` | `APPEARS_IN` plus character-place and character-character types | none |
| Direction | character -> work | multiple directions | n/a |
| Allowed subject | character only | character plus new endpoint combinations | unchanged |
| Allowed object | work only | work/place/character according to each new type | unchanged |
| Evidence | one qualified, direct work/edition/authority source identifying the character in the work | separate rules per relation family | facts remain non-network evidence |
| Duplicate rule | unique `(character, APPEARS_IN, work)` triple | unique triple per relation type | n/a |
| Inverse | none | would require new inverse policy | n/a |
| Risk | low and bounded | high; unclear semantics and UI requirements | character network stays empty |

## Recommendation

Adopt **Option A** only:

- relation: `APPEARS_IN`;
- direction: `character -> work`;
- no stored inverse;
- no `character -> place` or `character -> character` relation in this decision;
- endpoint validation must reject collections, adaptations, editions, places, and
  characters as objects;
- direct factual relation threshold: one qualified source that explicitly identifies
  the character as appearing in that work;
- a `key_character` fact may seed a candidate only when the named character maps
  unambiguously to an existing entity and the fact has eligible source linkage;
- multiple spellings or aliases do not create duplicate character entities or edges.

## Alternative B

Broader character relations could encode meetings, kinship, opposition, location, or
fictional-space membership. The external proposal does not establish stable names,
directions, endpoint rules, or evidence thresholds for those semantics. Alternative B
is therefore deferred, not rejected permanently.

## Implemented migration impact

The approved option was implemented through CS04:

1. DEC-050 records the USER decision and Schema 0.4 boundary;
2. master and Web validators accept `APPEARS_IN` only for `character -> work`;
3. CS04 separates all 10 candidates and validates formal fact-source linkage;
4. fresh-context `CODEX-REVIEW-WCD05-CS04` returned 10/10 `PASS`;
5. `0034_wcd05_character_relations.sql` adds `V1-REL-0321`—`0330` and one
   direct evidence row for each relation;
6. Research exports and Web Data were deterministically rebuilt;
7. regression tests reject non-character subjects and collection, place, character,
   adaptation, or edition objects.

## Web impact and backward compatibility

Option A is additive. Current consumers ignore unsupported relation types and filter
relationships whose endpoints are unavailable to a view, so existing public pages
remain compatible. Web Data now exposes character-to-work edges only in the research
layer; it does not generate reader-facing prose, routes, search entities, or Curation
approval. Older clients continue to consume all existing 0.3 relations.

## Conversion feasibility

The six matching `key_character` fact rows cover all 10 existing character entities:

- 《未来的回忆》: 弗朗西斯科·罗萨斯、胡利娅·安德拉德
- 《佩德罗·巴拉莫》: 胡安·普雷西亚多、佩德罗·巴拉莫
- 《没有人给他写信的上校》: 上校、奥古斯丁
- 《一桩事先张扬的凶杀案》: 圣地亚哥·纳萨尔
- 《人间王国》: 马康达尔、亨利·克里斯托夫
- 《世界末日之战》: 劝世者

The initial proposed mapping of the first two characters to
《阿尔特米奥·克罗斯之死》 was rejected. `V1-FCT-0079`, `SRC-0020`, and the
ELEM work record directly place both characters in 《未来的回忆》. All 10 corrected
candidates passed source-link validation and independent review; no name-only mapping
was migrated.

## Gate result

```text
USER decision: OPTION A APPROVED
Implemented: YES / Schema 0.4 / migration 0034
Character coverage: 10/10
WCD-05: DONE
WCD-06: READY / NOT STARTED
WCD-07: LOCKED
Public Release: PAUSED BY USER
```
