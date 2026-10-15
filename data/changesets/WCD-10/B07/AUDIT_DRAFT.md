# WCD-10 B07 merged candidate audit draft

Status: `MERGED_CANDIDATE_ONLY_PARENT_GATE_PENDING` (draft; not a Gate or approval).

Inputs were frozen author packages Sabato R3, Bioy R8, and Roa R5 in author order 0186 → 0198 → 0199. Their exact candidate and parent review hashes, full frozen input paths, and source file hashes are recorded in `MERGE_PROVENANCE.json`.

Counts: `{"coverage_objects": 63, "created_relationships": 54, "created_role_overrides": 4, "deferred": 41, "existing_facts": 24, "extra_relationships": 0, "nested_facts": 176, "new_entities": 54, "proposed_facts_total": 200, "source_profiles": 105, "source_scope_decisions": 39, "sources": 105}`. Source use accounting finds 96 candidate source IDs referenced by facts, CREATED, or coverage; 8 explicit existing-source reuses and 9 candidates used only by deferred records. That leaves 88 eligible new source records for downstream consideration; no unused source is silently removed from this candidate package. The parent estimates 76 gap records after de-duplication (35 institutional-commentary and 41 deferred); formal gap keys/IDs remain unallocated here.

Four exact `created_description_zh` overrides were added for W117, W119, W120, and W217. Existing Bioy W128/W129 descriptions remain unchanged. Source profiles and fact values/source refs are copied unchanged. No additional relationship proposals were added.

Roa's frozen R5 contains no separate `created_relationships` matrix. Its canonical CREATED rows map the reviewed direct-attribution semantics from each object's original `created_source_refs`; provenance explicitly records this structural mapping.

Bioy R8 contains source-valid empty `publisher` values on S131/S136/S142/S144/S149. The parent-approved helper fix accepts a present empty value as unknown; parent independently reports 13 targeted and 161 full regression tests passing. These exact values remain unchanged and no publisher is inferred.

No `REVIEW_GATE`, SQL, formal ID allocation, or database apply is included. The baseline database remains read-only. Parent independent merged-candidate review is pending.
