# WEB-CE-B09 QA

## Research / SQLite

- B09 临时迁移副本与正式 master 均通过 `PRAGMA integrity_check`、`PRAGMA foreign_key_check` 和 `scripts/validate_master.py`。
- 新增 12 entities、42 facts、12 relationships、9 sources、12 cards；card_sources 32、fact_sources 43、relationship evidence 12；无悬空引用。
- 作品/作品集层级、作者—国家关系端点和 `Tinísima` 争议年份由 Reviewer Follow-up 复核通过。

## Curation / Web Data

- `scripts/validate_v2_content_quality.py data/v2/curation/PUBLIC_CONTENT.json`：PASS（37 authors、96 works、25 places）。
- 固定 `generated_at=2026-08-21T05:00:00Z` 重建两次：`site_data.json` 与 `manifest.json` 字节一致。
- `scripts/validate_v2_web_data.py data/v2/web/site_data.json`：PASS；计数 269 entities、686 facts、197 relationships、211 sources、159 cards、54 place relations。
- `validate_v2_public_bundle.py artifacts/v2-rc5/user-review-preview`：PASS（175 sitemap routes，review queue 未暴露）。

## Frontend / Browser

- `node --check site/app.js`：PASS。
- `python3 scripts/qa_v2_public_ui.py site`：PASS。
- `V2_QA_BASE_URL=http://127.0.0.1:4174/ npm run qa:browser:chromium`：28/28 PASS（Chromium desktop + mobile）。
- B09 12 个作者/作品路由、3 个作者搜索、墨西哥/智利国家地图上下文的 desktop/mobile 定向检查 PASS；页面无 console/page error 或治理文字。
- 本批未修改通用地图、搜索、路由或模板逻辑；新增内容由数据层驱动，未硬编码研究事实。
- `git diff --check`：PASS；外部 AI 交付 CSV 的 CRLF-only 工作区变化未纳入本批。

## Batch Gate

`BATCH_PASS`。允许进入 B10 Preflight。
