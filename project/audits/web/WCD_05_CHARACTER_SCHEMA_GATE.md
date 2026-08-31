# WCD-05 Character Relationship Schema Gate

Status: **USER_REVIEW**
Date: 2026-08-31
Current schema: Research Relationship Schema 0.3

## Decision requested

Approve or reject the minimal Option A extension:

```text
APPEARS_IN
character -> work
```

WCD-05 recommends Option A, but does **not** implement it without an explicit USER
decision. Character coverage therefore remains 0/10 in this delivery.

## Current limitation

Schema 0.3 defines 13 relation types but no legal character endpoint. The master has
10 character entities and 15 `key_character` facts across 15 work subjects. Six of
those fact rows contain the names represented by all 10 existing character entities.
Those facts are candidate evidence, not relationships, and cannot be projected as a
network edge under the current schema.

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

## Migration impact if approved later

Approval would require a separate CS04 after this gate:

1. update the frozen-at-version relation schema through a new Decision Record;
2. update endpoint and relation-type validators;
3. add an append-only migration after the then-current migration head;
4. convert only verified existing character/work pairs into candidates;
5. run a fresh independent review before assigning formal relationship IDs;
6. rebuild Research exports and Web Data;
7. test duplicate triples, invalid endpoints, missing endpoints, and deterministic
   projection.

No schema SQL or speculative CS04 migration is included in WCD-05.

## Web impact and backward compatibility

Option A is additive. Current consumers already ignore unsupported relation types and
filter relationships whose endpoints are unavailable to a view, so existing public
pages remain compatible. A later Web Data version could expose character-to-work
edges in the research layer without generating reader-facing prose. Older clients
would continue to consume all existing 0.3 relations.

No-change is also technically safe, but leaves all 10 character entities zero-degree
and prevents the relationship network from representing a basic factual connection.

## Conversion feasibility

The six matching `key_character` fact rows cover all 10 existing character entities:

- 《阿尔特米奥·克罗斯之死》: 弗朗西斯科·罗萨斯、胡利娅·安德拉德
- 《佩德罗·巴拉莫》: 胡安·普雷西亚多、佩德罗·巴拉莫
- 《没有人给他写信的上校》: 上校、奥古斯丁
- 《一桩事先张扬的凶杀案》: 圣地亚哥·纳萨尔
- 《人间王国》: 马康达尔、亨利·克里斯托夫
- 《世界末日之战》: 劝世者

Feasibility is high, but conversion remains conditional on source-link validation and
independent review after USER approval.

## Gate result

```text
Recommendation: APPROVE OPTION A
USER decision: PENDING
Implemented: NO
WCD-05: USER_REVIEW
WCD-06: LOCKED
```
