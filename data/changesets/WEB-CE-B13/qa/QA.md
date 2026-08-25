# WEB-CE-B13 QA

日期：2026-08-21

## Research / SQLite

- Fresh-context Review：`review/REVIEW.md` 初审 `REVISE` 后完成 focused follow-up，最终 `PASS`。修订内容为收窄 `SRC-0246` 支持范围，并将纪廉三部作品的出版年份、CREATED evidence 与卡片来源统一锚定 `SRC-0245`；未把无直接来源支持的两条柯艾略体裁事实写入正式 migration。
- Migration rehearsal：`0018_web_ce_b13_luna_max.sql` 从 B12 主库副本演练成功，SHA-256 `f14ea750c1f6dcfa2777cac42a2a68f91911ce0415439bcfc3ba4c7cb35165f9`。
- 正式主库：`integrity_check=ok`，`foreign_key_check` 为空；`scripts/validate_master.py data/master/V1_MASTER.sqlite`：PASS。
- B13 实际增量：12 entities（3 authors、6 works、3 collections）、34 facts、12 relationships、6 sources、12 content cards、24 card-source rows；无新地点、无虚构空间、无新增 research gap。
- 迁移后主库计数：317 entities、849 facts、245 relationships、244 sources、207 cards、21 gaps、18 migration rows；relationship evidence/source rows 均为 272。
- 纪廉三部作品的 `first_publication_year`（1930/1931/1934）均以 `SRC-0245` 为 `origin_id`；`SRC-0246` 仅承担作者身份、生卒年和 poemario 语境。
- 审批时间戳/身份：B13 change set 的实体、来源及顶层 metadata 均为 `created_at=2026-08-21`、`reviewed_at=2026-08-21`、`reviewer=LUNA-MAX-B13-REVIEW`、`review_status=PASS`；没有自动伪造 `USER` 审批。

## Geo / Curation / Web

- Geo：新增 3 条作者—国家关系投影（`V2-GEO-REL-065`—`067`），分别指向巴西、巴西和古巴；无坐标、无虚构空间。
- Review package：当前汇总为 49 authors、132 works、25 places；B13 新增的 3 authors、9 works 全部为 `user_review` / `UNREVIEWED`。
- Formal public projection：B13 新增 0 authors、0 works；`public_scope` 仍为 25 authors、60 works、26 places，未将待审策展内容公开。
- `validate_v2_content_quality.py data/v2/curation/PUBLIC_CONTENT.json`：PASS（similarity 0）。
- Web Data：固定 `generated_at=2026-08-21T10:00:00Z` 构建两次，`site_data.json` 与 `manifest.json` 字节一致；`validate_v2_web_data.py`：PASS。
- Review preview：`build_v2_user_review_preview.py`、`validate_v2_public_bundle.py`、`qa_v2_public_ui.py` 均 PASS；bundle 231 files / 223 routes，未暴露 review queue；B13 12 个新实体均有 preview 搜索文本和正式 route。

## Browser / Engineering

- `node --check site/app.js`：PASS。
- `git diff --check`：PASS；仅报告未纳入提交的外部 CSV 的既存 CRLF warning。
- Chromium desktop + mobile Playwright：30/30 PASS（`V2_QA_BASE_URL=http://127.0.0.1:4175/`）；覆盖首页、地图、国家/地点、搜索、时间线、作者/作品/来源路由、全 sitemap、public boundary，并核对 B13 12 个新 route。

## Known scope notes

- 本批没有修改 `project/governance/PROJECT_CHARTER.md` 或通用前端逻辑；未执行 Release、tag、push 或 production deployment。
- 工作区中的 `project/audits/web/V2_RC5_CURATION_USER_REVIEW.md`、`work/external-ai/deliveries/` CSV 与 `artifacts/v2-rc5/` 是其他任务/QA 产物，未纳入 B13 commit。

## Gate

`BATCH_PASS`：Review、migration、主库、Geo/Curation/Web Data、public boundary、浏览器与工程 QA 全部通过。
