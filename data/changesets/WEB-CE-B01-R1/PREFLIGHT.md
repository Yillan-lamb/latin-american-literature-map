# WEB-CE-B01-R1 Preflight

- Baseline: `origin/main` at `88903bb` (`feat(web): deepen map-based literary discovery (#6)`)
- Branch: `content/batch-01-r1-fuentes`
- Scope: Carlos Fuentes + at most two works; no Geo, schema, frontend, release, or deployment changes.
- PR #7: `FAILED EXECUTION / UNTRUSTED RESULT`; only its URLs and identifiers were used as discovery leads, and every admitted source below was reopened independently.

## Preserved archive snapshot

- Original workspace: local `FAILED_RUN_ARCHIVE / PR7_REFERENCE` workspace (preserved; absolute path intentionally omitted)
- Branch / HEAD: `content/batch-01-paz-fuentes-mistral` at `649e18e`
- Preserved untracked paths: `DSH_LALM_Harness_ReadyPack/`, `artifacts/v2-rc5/`, and `拉丁美洲文学地图_60位作家扩充计划_中译本优先版.md`
- The original workspace remains the `FAILED_RUN_ARCHIVE / PR7_REFERENCE`; no reset, clean, stash, move, deletion, or development edit was performed there.

## Entity dedup

| Candidate | Result | Basis |
|---|---|---|
| Carlos Fuentes / 卡洛斯·富恩特斯 | new | No matching Chinese/original name in `entities` or current Web Data. |
| La región más transparente / 《最明净的地区》 | new | No matching original/Chinese title in master or current Web Data. |
| La muerte de Artemio Cruz / 《阿尔特米奥·克罗斯之死》 | new | No matching original/Chinese title in master or current Web Data. |

## Database baseline

- Master: `data/master/V1_MASTER.sqlite`
- Schema: `0.3`; SQLite `user_version=0`
- Migrations: 2 applied; next migration number is `0003`
- Counts: entities 144; facts 259; relationships 76; sources 85; content cards 40
- Maximum IDs: `V1-ENT-0144`, `V1-FCT-0259`, `V1-REL-0076`, `SRC-0086`, `V1-CARD-0040`
- Baseline validator: PASS; `integrity_check=ok`, `foreign_key_errors=0`
- SQLite connections default to `foreign_keys=0`; rehearsal/application must explicitly enable foreign keys (the project migration tool does so).

## Product baseline

- PUBLIC_CONTENT: 10 authors, 17 works, 19 places; content-quality validator PASS.
- Curation: existing review package remains authoritative; new judgment-heavy copy must remain `user_review`.
- Geo: unchanged; this batch has no coordinate or place-relation requirement.
- Web Data: committed deterministic outputs are `data/v2/web/site_data.json` and `manifest.json`.
- CI: PR runs master/content validation, isolated deterministic Web Data rebuild, JS/whitespace checks, preview build, and Chromium desktop/mobile smoke.
- Browser artifact: `artifacts/v2-rc5/user-review-preview` built by `scripts/build_v2_user_review_preview.py`.
- Coverage drift found before integration: `validate_v2_content_quality.py` hard-codes 10 author/17 work IDs; `validate_v2_web_data.py` hard-codes 10/17/19 counts. This batch does not change PUBLIC_CONTENT or public scope, so neither validator should be expanded for Fuentes.
- Existing release-only mismatch: rebuilding `origin/main` partitions several required author/work fields into `user_review`, leaving `public_scope.authors/works` empty, while `validate_v2_web_data.py` expects 10/17. The current PR workflow does not invoke that release-only validator. This pre-existing release baseline issue is recorded, not silently fixed or used to bypass PR gates.

## Checkout note

Fresh checkout exposed 21 historical delivery CSVs whose committed CRLF blobs conflict with current `*.csv text eol=lf`. They are outside this batch and are isolated in this worktree index so they cannot enter the diff. No historical file, PR #7 file, or user artifact was copied, overwritten, deleted, moved, or stashed.

Status: `IN_PROGRESS` pending independent review, migration rehearsal, integration, official local gates, PR, and GitHub Actions.
