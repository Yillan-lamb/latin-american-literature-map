# WEB-CE-B10 QA

## Research / SQLite

- B10 migration 临时副本与正式 master 均通过 `apply_migration.py`、`PRAGMA integrity_check`、`PRAGMA foreign_key_check` 和 `scripts/validate_master.py`。
- 新增 12 entities、43 facts、12 relationships、11 sources、12 cards；card_sources 28、fact_sources 43、relationship evidence 12；无悬空引用。
- 3 author、7 work、2 collection 的实体、`entity_layer` fact 与 card type 对齐；3 条作者—国家关系端点复用既有国家节点。
- Follow-up Reviewer 确认 11 个来源可重开，来源身份、题名/年份、关系 evidence、展示名与候选字段一致。

## Curation / Web Data

- `scripts/validate_v2_content_quality.py data/v2/curation/PUBLIC_CONTENT.json`：PASS（40 authors、105 works、25 places）。
- 固定 `generated_at=2026-08-21T06:00:00Z` 两次重建：`site_data.json` 与 `manifest.json` 字节一致。
- `scripts/validate_v2_web_data.py data/v2/web/site_data.json`：PASS；计数 281 entities、729 facts、209 relationships、222 sources、171 cards、57 place relations。
- `validate_v2_public_bundle.py artifacts/v2-rc5/user-review-preview`：PASS（195 files、187 sitemap routes，review queue 未暴露）。

## Frontend / Browser

- `node --check site/app.js`：PASS。
- `python3 scripts/qa_v2_public_ui.py site` 与 preview bundle scan：PASS。
- `V2_QA_BASE_URL=http://127.0.0.1:4174/ npm run qa:browser:chromium`：28/28 PASS（Chromium desktop + mobile）。
- B10 定向检查：12 个作者/作品路由、12 个中文搜索、乌拉圭/阿根廷国家页及地图国家上下文，desktop/mobile 均 PASS；无 console/page error 或治理文字。
- 本批未修改通用地图、搜索、路由或模板逻辑；新增内容由数据层驱动，未硬编码研究事实。
- `git diff --check`：PASS；外部 AI 交付 CSV 的既有 CRLF-only 工作区变化未纳入本批。

## Batch Gate

`BATCH_PASS`。允许生成 `project/audits/web/SOL_AUDIT_HANDOFF_B06-B10.md`，不得启动 B11。
