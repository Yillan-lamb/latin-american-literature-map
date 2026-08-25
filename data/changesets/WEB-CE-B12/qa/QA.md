# WEB-CE-B12 QA

日期：2026-08-21

## Research / SQLite

- Fresh-context Review：`review/REVIEW.md` 初审 `REVISE` 后逐项修订，follow-up 最终 `PASS`；修订内容包括 Siete casas vacías 来源范围、©2014 与首版年份区分、缺口持久化及 Mapocho PDF 的作者/页码元数据。
- Migration rehearsal：`0017_web_ce_b12_luna_max.sql` 从 B11 主库副本演练成功，SHA-256 `8a02e0a56bf234a55aa790482954a79f64962681bf308ec5b48a1117e2494078`。
- 正式主库：`integrity_check=ok`，`foreign_key_check` 为空；`scripts/validate_master.py data/master/V1_MASTER.sqlite`：PASS。
- B12 实际增量：12 entities（3 authors、6 works、3 collections）、33 facts、12 relationships、10 sources、12 cards、24 card-source rows；无新地点、无虚构空间；新增 5 个 research gaps。
- 迁移后主库计数：305 entities、815 facts、233 relationships、238 sources、195 cards、21 gaps、17 migration rows；relationship evidence/source rows 均为 260。
- 审批时间戳/身份：B12 change set 的实体、来源及顶层 metadata 均为 `created_at=2026-08-21`、`reviewed_at=2026-08-21`、`reviewer=LUNA-MAX-B12-REVIEW`、`review_status=PASS`；没有自动伪造 `USER` 审批。

## Geo / Curation / Web

- Geo：新增 3 条作者—国家关系投影（`V2-GEO-REL-062`—`064`），分别指向阿根廷与智利；没有坐标或虚构空间。
- Review package：当前汇总为 46 authors、123 works、25 places；B12 新增的 3 authors、9 works 全部为 `user_review` / `UNREVIEWED`。
- Formal public projection：B12 新增 0 authors、0 works；`public_scope` 仍为 25 authors、60 works、26 places，未将待审策展内容公开。
- `validate_v2_content_quality.py data/v2/curation/PUBLIC_CONTENT.json`：PASS（similarity 0）。
- Web Data：固定 `generated_at=2026-08-21T09:00:00Z` 构建两次，`site_data.json` 与 `manifest.json` 字节一致；`validate_v2_web_data.py`：PASS。
- Review preview：`build_v2_user_review_preview.py`、`validate_v2_public_bundle.py`、`qa_v2_public_ui.py` 均 PASS；bundle 219 files / 211 routes，未暴露 review queue；B12 12 个实体均出现在 preview search 与 sitemap route。

## Browser / Engineering

- `node --check site/app.js`：PASS。
- `git diff --check`：PASS；仅报告未纳入提交的外部 CSV 的既存 CRLF warning。
- Chromium desktop + mobile Playwright：30/30 PASS（使用当前 preview 服务器 `V2_QA_BASE_URL=http://127.0.0.1:4175/`；此前错误端口运行的失败结果不计入 QA）。
- 浏览器覆盖首页、地图、国家/地点、搜索、时间线、作者/作品/来源路由、全 sitemap、public boundary，并静态核对 B12 12 个新 route。

## Known scope notes

- 本批没有修改 `project/governance/PROJECT_CHARTER.md` 或通用前端逻辑；未执行 Release、tag、push 或 production deployment。
- 工作区中的 `project/audits/web/V2_RC5_CURATION_USER_REVIEW.md` 与 `work/external-ai/deliveries/` CSV 是其他任务/既存修改，未纳入 B12 commit。

## Gate

`BATCH_PASS`：Review、migration、主库、Geo/Curation/Web Data、public boundary、浏览器与工程 QA 全部通过。
