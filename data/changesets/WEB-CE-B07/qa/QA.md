# WEB-CE-B07 QA

## Research / SQLite

- `sqlite3 data/master/V1_MASTER.sqlite "PRAGMA integrity_check; PRAGMA foreign_key_check;"`：`ok`，外键空集。
- `python3 scripts/validate_master.py data/master/V1_MASTER.sqlite`：PASS。
- B07 临时迁移副本与正式 master 均通过；新增 12 entities、42 facts、12 relationships、9 sources、12 cards。
- B07 作品层、关系端点、fact/source、relationship evidence、card_facts/card_sources 无重复或悬空引用。

## Curation / Web Data

- `python3 scripts/validate_v2_content_quality.py data/v2/curation/PUBLIC_CONTENT.json`：PASS（31 authors、78 works、25 places）。
- 固定 `generated_at=2026-08-21T03:00:00Z` 重建 Web Data 两次：`site_data.json` 与 `manifest.json` 字节一致。
- `python3 scripts/validate_v2_web_data.py data/v2/web/site_data.json`：PASS；计数 245 entities、602 facts、173 relationships、194 sources、135 cards、48 place relations。
- `validate_v2_public_bundle.py .` 仍受暂停发布治理字段/`user_review` 规则阻断；这是 Web 0.x 预期边界。B07 user-review preview bundle 作为内部预览单独验证。
- `python3 scripts/build_v2_user_review_preview.py` 后 `validate_v2_public_bundle.py artifacts/v2-rc5/user-review-preview`：PASS（151 sitemap routes）。

## Frontend / Browser

- `node --check site/app.js`：PASS。
- `python3 scripts/qa_v2_public_ui.py site`：PASS。
- `V2_QA_BASE_URL=http://127.0.0.1:4174/ npm run qa:browser:chromium`：28/28 PASS（Chromium desktop + mobile）。
- 针对 B07 的 desktop/mobile 代表路由（Parra/Pizarnik、`Poemas y antipoemas`、`La tregua`）及 Parra 搜索：PASS；智利、阿根廷、乌拉圭地图国家上下文选择：PASS。
- 本批未修改通用地图、搜索、路由或模板逻辑；新增作者、作品和三条国家关系由数据层驱动，未硬编码研究事实。
- `git diff --check`：PASS（本批相关文件）。

## Batch Gate

`BATCH_PASS`。本批已完成独立 migration、Web Data 重建和 QA，允许进入 B08 Preflight。
