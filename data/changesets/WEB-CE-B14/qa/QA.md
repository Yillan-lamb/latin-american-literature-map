# WEB-CE-B14 QA

日期：2026-08-21

## Research / SQLite

- Fresh-context Review：初审 `REVISE`，第二次 focused follow-up 最终 `PASS`；复审记录保留在 `review/REVIEW.md`。
- Migration rehearsal：从 B13 主库副本重放 `0019_web_ce_b14_luna_max.sql` 成功，SHA-256 `68e48f2ce45796694e8217153606beb7ca5702929e15ec5b033fc16cbdc8077d`。
- 正式主库：`PRAGMA integrity_check=ok`，`foreign_key_check` 为空；`scripts/validate_master.py data/master/V1_MASTER.sqlite`：PASS。
- 迁移后主库计数：329 entities、883 facts、257 relationships、251 sources、219 cards、21 gaps、19 migration rows；relationship evidence 284，relationship sources 292。
- B14 实际增量：12 entities（3 authors、9 works）、34 facts、12 relationships、7 sources、12 cards、22 card-source rows；无新增 research gap。
- B14 fact-field audit：3 个 `composition_year`（1957 讲演年、1691 书信完成年、1689 首演年），6 个直接或候选书目 `first_publication_year`；`V1-FCT-0877` 不存在。
- 跨批次整改：B13 `V1-REL-0247` 与 `V2-GEO-REL-067` 从错误的 Nicaragua 节点改为 Cuba `V1-ENT-0096`，由本批 migration 明确记录，B13 历史 migration 未改写。
- 审批时间戳/身份：B14 change set 的实体、来源和顶层 metadata 均为 `created_at=2026-08-21`、`reviewed_at=2026-08-21`、`reviewer=LUNA-MAX-B14-REVIEW`、`review_status=PASS`；策展仍为 `user_review`/`UNREVIEWED`，没有伪造 USER 审批。

## Sources / semantic boundary

- `SRC-0247` 标记 `access_limited`，不作为 Lezama 书目事实的唯一证据；`SRC-0248`承担可直接核验的作者与作品序列。
- `SRC-0251` 使用可复核的 UNAM canonical URL `/contenidos/5059605`。
- `SRC-0249` 为 C 类补充书目来源；`Vista...` 的 1974 条目与页面另列的 1987 条目已在 usage note 中说明，1974 fact 降为 medium provisional。
- `La expresión americana` 的形式为来源直接支持的“讲演系列”；`La Habana para un infante difunto` 形式保持开放。

## Geo / Curation / Web

- Geo：新增 `V2-GEO-REL-068`—`070` 三条作者—国家关系，分别指向 Cuba、Cuba、México；无新坐标、无虚构空间。
- Review package：当前 52 authors、141 works、25 places；B14 新增 3 authors、9 works 全部为 `user_review`/`UNREVIEWED`。
- Formal public projection：`public_scope` 仍为 25 authors、60 works、26 places；B14 不增加正式公开作者/作品。
- Curation quality：`validate_v2_content_quality.py data/v2/curation/PUBLIC_CONTENT.json` PASS，similarity 0。
- Web Data：固定 `generated_at=2026-08-21T11:00:00Z` 构建；第二次固定时间重建与正式目录字节一致；`validate_v2_web_data.py data/v2/web/site_data.json` PASS。
- Web Data counts：329 entities、883 facts、257 relationships、251 sources、219 cards、69 place relations；内部 review package 可消费 B14 数据。
- Review preview：`build_v2_user_review_preview.py`、`validate_v2_public_bundle.py`、`qa_v2_public_ui.py` 均 PASS；243 files / 235 routes，未暴露 review queue；B14 12 个新实体均有 preview 搜索文本和正式 route。

## Browser / Engineering

- Chromium desktop + mobile Playwright：30/30 PASS（`V2_QA_BASE_URL=http://127.0.0.1:4175/`）；覆盖首页、地图、国家/地点、搜索、时间线、作者/作品/来源路由、全 sitemap、public boundary，并核对 B14 12 个新 route。
- `node --check site/app.js`：PASS。
- `git diff --check`：PASS；仅报告未纳入提交的外部 CSV 既存 CRLF warning。

## Known scope notes

- 本批没有修改 `project/governance/PROJECT_CHARTER.md`、通用前端逻辑或 roadmap；未执行 Release、tag、push 或 production deployment。
- 工作区中 `project/audits/web/V2_RC5_CURATION_USER_REVIEW.md`、`work/external-ai/deliveries/` CSV 与 `artifacts/v2-rc5/` 为其他任务/QA 产物，未纳入 B14 commit。

## Gate

`BATCH_PASS`：Review、schema-correct migration、主库、跨批次 Geo remediation、Curation/Web Data、public boundary、浏览器与工程 QA 全部通过。
