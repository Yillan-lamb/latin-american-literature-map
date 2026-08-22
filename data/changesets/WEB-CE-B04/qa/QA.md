# WEB-CE-B04 QA

## Data gate

- Fresh-copy migration replay: PASS (`/private/tmp/lalm-b04-remed.sqlite`).
- Formal master migration `0007_web_ce_b04_luna_max.sql`: PASS.
- `scripts/validate_master.py data/master/V1_MASTER.sqlite`: PASS。
- `PRAGMA integrity_check`: `ok`；`PRAGMA foreign_key_check`: empty。
- Final counts: entities 208; facts 476; relationships 137; sources 162; cards 99; gaps 14; relation holds 51。

## Research / Curation / Web

- `scripts/validate_v2_content_quality.py data/v2/curation/PUBLIC_CONTENT.json`: PASS。
- `scripts/build_v2_web_data.py`（绝对路径输入，避免相对路径 provenance 错误）：PASS。
- `scripts/validate_v2_web_data.py data/v2/web/site_data.json`: PASS。
- Web counts: 208 entities; 99 content cards; 476 facts; 137 relationships; 14 gaps; 162 sources; 30 places; 39 place relations。
- `scripts/build_v2_deploy_bundle.py --origin https://latin-american-literature-map.example`: PASS。
- `scripts/validate_v2_public_bundle.py`: PASS（100 public entities / 104 sitemap URLs）。
- `scripts/qa_v2_public_ui.py`: PASS（105 HTML files；governance language failures 0）。

## Browser

- Temporary local preview served from `/private/tmp/lalm-b04-bundle` on port 4174。
- `V2_QA_BASE_URL=http://127.0.0.1:4174/ npm run qa:browser:chromium`: **28/28 PASS**。
- Desktop/mobile route assertions include Bioy, Roa, Quiroga, `La invención de Morel`, `Hijo de hombre`, `Cuentos de la selva` and Paraguay.
- First run surfaced the internal token `research_gap` in a public location note; the note was changed to reader-facing “研究缺口”, Web Data/bundle rebuilt, and the complete 28-test run passed.

## Static / Geo

- `python3 -m py_compile scripts/build_v2_public_content.py scripts/build_v2_web_data.py scripts/build_v2_deploy_bundle.py`: PASS。
- Browser spec Node syntax check: PASS。
- Geo CSV audit: 30 places / 39 relations; fictional places with coordinates: 0; B04 Paraguay node and three B04 Geo relations present。
- `git diff --check`: PASS（排除既有 out-of-scope external delivery changes）。
