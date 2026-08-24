# WEB-CE-B05 QA

## Data gate

- Fresh-copy migration replay: PASS (temporary copy outside the repository).
- Formal migration `0008_web_ce_b05_luna_max.sql`: PASS; migration SHA-256 `f69ecf06ad52ab702898a645fa5b57cc029a2018b76f8a1398513f0a317f4cb1`.
- `scripts/validate_master.py data/master/V1_MASTER.sqlite`: PASS; no errors or warnings.
- `PRAGMA integrity_check`: `ok`; `PRAGMA foreign_key_check`: empty.
- Final master counts: entities 220; facts 518; relationships 149; sources 174; content_cards 111; card_sources 210; relationship_evidence 176; gaps 14; relation_holds 51.
- B05 delta: 12 entities (3 authors, 7 works, 2 collections), 42 facts, 12 relationships, 12 sources, 12 cards; no new research gap or relation hold.

## Research / Curation / Web

- `scripts/build_v2_public_content.py`: PASS.
- `scripts/validate_v2_content_quality.py data/v2/curation/PUBLIC_CONTENT.json`: PASS — 25 authors, 60 works, 24 curation places, 60 distinct reading approaches, 10 reading paths.
- `scripts/build_v2_web_data.py` with absolute master/public-content paths: PASS.
- `scripts/validate_v2_web_data.py data/v2/web/site_data.json`: PASS.
- Web counts: 220 entities; 111 content cards; 518 facts; 149 relationships; 14 gaps; 174 sources; 30 Geo places; 42 place relations; 54 curation entries; 2 recommendations; 19 selections.
- `scripts/build_v2_deploy_bundle.py`: PASS (temporary bundle outside the repository, 124 files / 116 routes).
- `scripts/validate_v2_public_bundle.py`: PASS (112 public entities / 116 sitemap URLs; review queue not exposed).
- `scripts/qa_v2_public_ui.py`: PASS (117 HTML files; forbidden governance language failures 0).

## Browser

- Preview served from a temporary bundle outside the repository on port 4174.
- `V2_QA_BASE_URL=http://127.0.0.1:4174/ npm run qa:browser:chromium`: PASS after authorized Chromium launch; 28/28 desktop + mobile tests passed.
- B05 route/search assertions include Machado, Guimarães Rosa, Graciliano Ramos, their representative works/collections, and the reused Brazil country node.
- The first sandboxed browser attempt failed at Chromium process launch (`MachPortRendezvousServer` permission), not in an application assertion; the authorized rerun passed all 28 tests.

## Geo / static

- Geo CSV audit: 30 places / 42 relations; B05 relations `V2-GEO-REL-041`–`043` present; fictional places with coordinates: 0.
- `python3 -m py_compile scripts/build_v2_public_content.py scripts/build_v2_web_data.py scripts/build_v2_deploy_bundle.py`: PASS.
- `node --check tests/browser/public-product.spec.cjs`: PASS.
- `git diff --check` on the in-scope B05 paths: PASS.
- Source URL audit ran separately; automated network checks were all environment timeouts, so source acceptance relies on the fresh Reviewer’s direct re-open log rather than that network probe.

## Gate

`BATCH_PASS` — B05 migration, content projection, public bundle, Geo boundary, and Chromium desktop/mobile QA are green. No release, deploy, tag, or PROJECT_CHARTER change was performed.
