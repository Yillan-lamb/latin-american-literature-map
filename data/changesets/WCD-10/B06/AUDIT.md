# WCD-10 B06 audit record

**Checkpoint:** 2026-10-08 · **Task:** TASK-111 · **Scope:** Amado R3, Onetti R3, and Donoso R2 admitted under the exact B06 review gate. Execution, independent parent audit, and governance synchronization passed; bounded Research acceptance.

## Admitted scope and preserved boundaries

The reviewed batch contributes 28 work/collection objects and zero author entities, 117 facts, 28 `CREATED` relationships, 37 cards, and 43 gaps. It has 59 source candidates: eight map to existing sources, 51 are non-reuse candidates, and 50 source rows are inserted. S219 (the *Cuatro para Delfina* page) is present only in deferred material and has no source ID or source row. Coverage has 38 objects. The 18 deferred items and the B-only research gaps remain explicit; no claim of full author or source coverage is made. The 117 fact values, references, nested fact IDs, full pre-existing source chains, source profiles, and evidence matrix were preserved as approved.

The complete merge provenance is in `MERGE_PROVENANCE.json`, including `source_scope_decision_normalization`, nested and existing fact-ID mappings, research-status mappings, excluded coverage rows, and every entry in `normalization_differences`. Those entries record: copying legacy `candidate_source_id(s)` to `candidate_ids` only where the shared builder requires it while retaining original decision objects; normalizing per-author evidence-matrix rows to global fact entries while retaining original rows under `source_evidence`; mapping Amado's local nested fact IDs to canonical IDs without changing values or refs; canonicalizing V1-ENT-0187's `SRC-0282` research ref while preserving its note; mapping coverage statuses to `institutional_commentary`, `bounded_direct_study`, and `preserved_existing_A_not_fresh` for their respective reviewed scopes; retaining *Cuatro para Delfina* only in deferred material; copying source profiles unchanged with webpage `publication_year` distinct from work publication year; and removing obsolete pending-review prefixes on 16 rows while preserving their substantive remaining text and review status.

The exact gate SHA is `004ff6e28dc494baa94203738594bb28d948606af2a63331121fc6ae899ea4dd`, bound to baseline SHA `0185f6c81ebe1dce1d761e7e9d8780f65baf1b3ed5769987f92f977fdfbdd868`. Parent's source-package and merged-candidate reviews are recorded outside this branch under the root B06 review reports. The exact migration and mapping hashes are listed in `VALIDATION.md`.

## Actual table changes

Counts below compare `work/wcd10-qa/B06_BASELINE.sqlite` with the post-apply master. Parent separately compared all 19 table values against an independent apply clone and verified retention of pre-existing rows.

| Table | Before | Delta | After |
| --- | ---: | ---: | ---: |
| `card_facts` | 1,232 | +117 | 1,349 |
| `card_sources` | 663 | +89 | 752 |
| `content_cards` | 343 | +37 | 380 |
| `entities` | 426 | +28 | 454 |
| `entity_id_map` | 424 | +28 | 452 |
| `fact_sources` | 1,354 | +169 | 1,523 |
| `facts` | 1,253 | +117 | 1,370 |
| `gaps` | 151 | +43 | 194 |
| `legacy_relation_groups` | 15 | 0 | 15 |
| `metadata` | 16 | 0 | 16 |
| `migration_log` | 40 | +1 | 41 |
| `n3_decisions` | 4 | 0 | 4 |
| `relation_hold_evidence` | 58 | 0 | 58 |
| `relation_holds` | 51 | 0 | 51 |
| `relationship_evidence` | 456 | +65 | 521 |
| `relationship_sources` | 485 | +65 | 550 |
| `relationships` | 395 | +28 | 423 |
| `source_holds` | 4 | 0 | 4 |
| `sources` | 406 | +50 | 456 |

No Schema, Curation, Research train, Web Data schema, Web version, or public-scope change was made. The earlier B01–B05 snapshots and 0040 migration are preserved. The checkpoint exports are in a new B06 directory.

## Actual QA and deviations

The migration was applied only after the exact gate, SQL, and mapping passed independent parent review. The implementation master and independent clone both passed database checks; the full suite, migration replay, export comparisons, public validators, and reviewed-checkpoint QA passed. Chromium desktop/mobile each completed the 30-test project: 60 passed, four existing WCD-08 preview skips, zero unexpected failures.

The public bundle's first build exited 0 but left one generated portrait copy empty. Hash checks showed the source, B06 before, and B05 after bytes were the same; only the B06 derived after copy was restored. The initial failed checkpoint QA is retained, and the parent reran the exact generic QA after the repair and passed. No underlying builder cause was established.

The first browser attempt failed with a local HTTP connectivity error (`net::ERR_EMPTY_RESPONSE`); its report remains. A later retry recorded an unfinished local response for the Venezuela route plus worker termination and did not finish all test records. Direct curl and an isolated Chromium smoke later read the Venezuela page's full 3,007 bytes. The final QA server logged to a file; all 177 files were pre-read and length-checked, and desktop/mobile were run serially. Both complete reports passed. This is the observed sequence; it does not establish a causal diagnosis for the intermittent earlier response.

The final temporary QA server bound only to `127.0.0.1` and was stopped after QA (Ctrl-C, process exit 130). No claim is made here about the earlier server bind address. No Firefox, WebKit, Lighthouse, or production deployment was run or is claimed. No test assertion or production application code was changed for this QA.

## Remaining review boundary

Parent independently reviewed the actual execution evidence, database, reports, and governance synchronization. B06 has bounded acceptance; B07 inventory/research is unlocked. See EXECUTION_REVIEW.json for the hash-bound final conclusion. W03 policy and actual re-entry remain mandatory before WCD-10 stage acceptance.
