# WEB-CE-B08 QA

## Research / SQLite

- B08 临时迁移副本与正式 master 均通过 `PRAGMA integrity_check`、`PRAGMA foreign_key_check` 和 `scripts/validate_master.py`。
- 新增 12 entities、42 facts、12 relationships、8 sources、12 cards；source/fact/evidence/card links 无悬空引用。
- 作品层级、关系端点和同名 `Bestiario` 作者分离均通过 Reviewer 与本地查询复核。

## Curation / Web Data

- `scripts/validate_v2_content_quality.py data/v2/curation/PUBLIC_CONTENT.json`：PASS（34 authors、87 works、25 places）。
- 固定 `generated_at=2026-08-21T04:00:00Z` 重建两次：`site_data.json` 与 `manifest.json` 字节一致。
- `scripts/validate_v2_web_data.py data/v2/web/site_data.json`：PASS；计数 257 entities、644 facts、185 relationships、202 sources、147 cards、51 place relations。
- `validate_v2_public_bundle.py artifacts/v2-rc5/user-review-preview`：PASS（163 sitemap routes）。

## Frontend / Browser

- `node --check site/app.js`：PASS。
- `python3 scripts/qa_v2_public_ui.py site`：PASS。
- `V2_QA_BASE_URL=http://127.0.0.1:4174/ npm run qa:browser:chromium`：28/28 PASS（Chromium desktop + mobile）。
- B08 代表作者/作品路由、阿格达斯搜索、秘鲁/墨西哥地图上下文的 desktop/mobile 定向检查 PASS。
- 本批未修改通用地图、搜索、路由或模板逻辑；新增内容由数据层驱动，未硬编码研究事实。
- `git diff --check`：PASS（本批相关文件）。

## Batch Gate

`BATCH_PASS`。允许进入 B09 Preflight。
