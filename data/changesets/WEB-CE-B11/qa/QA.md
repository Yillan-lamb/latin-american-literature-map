# WEB-CE-B11 QA

日期：2026-08-21

## Research / SQLite

- Migration rehearsal：`0016_web_ce_b11_luna_max.sql` 从 B06–B10 基线副本重放成功，SHA-256 `bcfde33d73153aa4cce4b5cdd2824fd89b171d38ef9185a6539da66b668308a7`。
- 正式主库：`integrity_check=ok`，`foreign_key_check` 为空。
- `scripts/validate_master.py data/master/V1_MASTER.sqlite`：PASS。
- B11 实际增量：12 entities（3 authors、9 works/collections）、53 facts、12 relationships、6 sources、12 cards；无新地点、无虚构空间。
- 迁移后主库计数：293 entities、782 facts、221 relationships、228 sources、183 cards、16 migration rows。

## Geo / Curation / Web

- Geo：新增 3 条作者—阿根廷关系投影（`V2-GEO-REL-059`—`061`）；未新增坐标或作品地点。
- Review package：43 authors、114 works、25 places；B11 新增的 3 authors、9 works 全部保持 `user_review` / `UNREVIEWED`。
- Formal public projection：B11 新增 0 authors、0 works；`public_scope` 仍只消费 `auto_approved` 内容（25 authors、60 works、26 places）。
- USER_REVIEW preview：B11 12 个实体均有可搜索条目与正式 route；preview search index 185 条。
- Web Data：固定 `generated_at=2026-08-21T08:00:00Z` 构建两次，`site_data.json` 与 `manifest.json` 字节一致；Web validator PASS。
- Public bundle：使用仅用于 QA 的 `https://preview.invalid` origin 构建；bundle validator、public UI QA 均 PASS，review queue 未暴露。

## Browser / Engineering

- `node --check site/app.js`：PASS。
- `git diff --check`：PASS；仅有既存外部 CSV 的 CRLF warning，未纳入本批提交。
- Chromium desktop + mobile Playwright：30/30 PASS（首次受 macOS Chromium 沙箱权限影响的启动失败已在本机权限下重跑通过）。
- 浏览器覆盖了首页、地图、搜索、时间线、作者/作品/地点路由、全 sitemap 及 public-boundary 断言；另以静态断言逐项核对 B11 12 个 preview routes。

## Known scope notes

- 本批没有修改 `PROJECT_CHARTER.md` 或前端通用逻辑。
- 工作区中 `docs/V2_RC5_CURATION_USER_REVIEW.md` 与 `work/external-ai/deliveries/` CSV 为既存或其他任务变更，未纳入 B11 commit。
