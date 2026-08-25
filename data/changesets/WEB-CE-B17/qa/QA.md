# WEB-CE-B17 QA

日期：2026-08-22
状态：`PASS`

## Research / SQLite

- Fresh-context Review：`review/REVIEW.md` 最终 verdict 为 `PASS`；七个来源逐一重开，来源身份、事实支持、实体层级、中文展示名、Geo 与 Research/Curation 边界均通过。
- Migration rehearsal：`0023_web_ce_b17_luna_max.sql` 在 `/private/tmp/lalm-b17-rehearsal.sqlite` 上演练通过；最终迁移 SHA-256 为 `327eb5f4d2e535dd4450e14e8c14e3a6b89ce18a9d80f59f5af23c3df5e3faf7`。
- 正式主库：`scripts/validate_master.py data/master/V1_MASTER.sqlite`：PASS；显式启用 foreign keys 后 `PRAGMA integrity_check=ok`，`PRAGMA foreign_key_check` 为空。
- B17 实际增量：14 entities（2 country places、3 authors、8 works、1 collection）、42 facts、12 relationships（9 CREATED、3 ASSOCIATED_WITH_PLACE）、7 sources、12 cards、21 card-source rows、12 relationship-evidence rows、1 research gap。
- 迁移后主库计数：367 entities、997 facts、293 relationships、274 sources、255 cards、24 gaps、23 migration rows；relationship evidence 320，card-source rows 489。
- B17 gap：`V1-GAP-0024` 保持 `open_research` / `SOL_REVIEW`，记录 ABL 1923 与 Biblioteca Nacional authority line 1918–2022 的出生年份冲突。
- 审批时间戳/身份：候选 Research change set 共 90 个 audit metadata 记录，均为 `created_at=2026-08-22`、`reviewed_at=2026-08-22`、`reviewer=LUNA-MAX-B17-REVIEW`、`review_status=PASS`；Curation 3 authors/9 works 的 90 个字段均为 `user_review` / `UNREVIEWED`，没有伪造 USER 审批。

## Continuous replay

- 从 B16 前一批基线 `/private/tmp/lalm-b16-pre-review.sqlite` 连续重放 `0022_web_ce_b16_luna_max.sql` 与 `0023_web_ce_b17_luna_max.sql`，两次迁移均成功。
- 连续 replay 与正式主库的全部业务表逐表一致（`migration_log.applied_at` 按预期不比较）；两者均为 `integrity_check=ok`、foreign-key check 为空，`validate_master.py` PASS。

## Geo / Curation / Web Data

- Geo：新增 2 个国家节点（厄瓜多尔、委内瑞拉），3 条作者—国家投影（`V2-GEO-REL-077`—`079`）；国家节点使用 polygon-only 规则，坐标为空，没有伪造中心点、出生地或虚构空间坐标。
- Geo 一致性：3 条新增 CSV 行的 relationship/source/endpoint 与 SQLite `V1-REL-0293`—`0295` 完全一致。
- Review package：当前为 61 authors、168 works、25 literary places；B17 新增的 3 authors、9 works 全部保持 `user_review` / `UNREVIEWED`。
- Formal public projection：25 authors、60 works、28 places；新增的 Ecuador/Venezuela 国家节点可作为地图/国家入口，B17 作者与作品未进入正式 public author/work scope。
- `validate_v2_content_quality.py data/v2/curation/PUBLIC_CONTENT.json --presentation data/v2/presentation/PUBLIC_PRESENTATION.json`：PASS（168 distinct reading approaches、10 reading paths）。
- Web Data：固定 `generated_at=2026-08-22T12:00:00Z` 两次重建字节一致，并与正式 `data/v2/web` 输出一致；`validate_v2_web_data.py`：PASS；timeline 由 257 增至 269。
- Public/review boundary：formal bundle `validate_v2_public_bundle.py` 与 `qa_v2_public_ui.py` 均 PASS（115 public entities、119 sitemap URLs、120 HTML）；USER_REVIEW preview 同样 PASS（259 public preview entities、273 sitemap URLs、274 HTML），review queue 未进入正式 bundle。

## Browser / engineering checks

- `node --check site/app.js`：PASS。
- USER_REVIEW preview：Chromium desktop/mobile Playwright 36/36 PASS，覆盖 B17 国家入口、B17 author/work preview routes、时间线、搜索和审核边界。
- Formal public bundle：排除仅要求 review queue 的 preview 专项后，Chromium desktop/mobile 核心公共路径 28/28 PASS；完整跨浏览器烟测 `qa_v2_browser.cjs` 在 Chromium、Firefox、WebKit 的 desktop/mobile 六个矩阵均 PASS（HTTP 200、无 console/page error、无治理语言泄漏）。
- `git diff --check`：B17 相关拟提交文件无 whitespace error；外部 delivery CSV 的既存 CRLF warning 保持 out-of-scope。

## Known scope notes

- B17 未修改 `project/governance/PROJECT_CHARTER.md`、通用前端逻辑或 roadmap；未执行 Release、tag、push 或 production deployment。
- `project/audits/web/V2_RC5_CURATION_USER_REVIEW.md`、`work/external-ai/deliveries/` CSV 与 `artifacts/v2-rc5/` 为其他任务/QA 产物，未纳入 B17 commit。

## Gate

`BATCH_PASS`：Review、migration、连续 replay、主库、Geo/Curation/Web Data、public boundary、preview、浏览器与工程 QA 全部通过。
