# WEB-CE-B06 QA

## Gate

`BATCH_PASS`。本批独立 Reviewer 的最终结论为 `PASS`；返修后的 migration 已在副本演练并写入正式 master。没有 P0/P1 阻断，不执行发布、部署或 tag。

## Research / SQLite

- `python3 scripts/validate_master.py data/master/V1_MASTER.sqlite`：PASS；`integrity_check=ok`；foreign-key errors=0。
- `PRAGMA integrity_check`：`ok`；`PRAGMA foreign_key_check`：空集。
- migration：`0009_web_ce_b06_luna_max.sql`；task=`WEB-CE-B06`；reviewer=`LUNA-MAX-B06-REVIEW`。
- 正式 migration SHA-256：`da07e7d7eab2daecd10fea2efd40f133e47ab1c38094b855644ceebf2b40b050`。
- B06 master 计数：entities 233、facts 560、relationships 161、sources 185、content_cards 123、gaps 15、card_sources 231、relationship_evidence 188、migration_log 9。

## Web Data / Curation

- `validate_v2_content_quality.py data/v2/curation/PUBLIC_CONTENT.json`：PASS（review package：28 authors、69 works、25 places、69 reading approaches、10 reading paths）。
- Web Data 重建两次（固定 `generated_at=2026-08-21T02:00:00Z`）后 `site_data.json` 字节一致；`validate_v2_web_data.py`：PASS。
- 正式 Web Data 计数：content_cards 123、curation_entries 54、curation_recommendations 2、curation_selections 19、entities 233、facts 560、gaps 15、place_relations 45、places 31、relation_holds 51、relationships 161、sources 185。
- B06 的作者/作品策展字段均保持 `user_review`，没有越过 Curation Gate；因此本批新增作者/作品进入 review package，不进入正式 `public_scope`。尼加拉瓜国家地点作为公开地图节点进入 Web Data。
- `validate_v2_public_bundle.py .` 仍按当前暂停发布治理规则拒绝工作区 Web Data 中的 `user_review`/review queue 及治理字段；这是 Web 0.x 的预期边界，不作为本批失败。用本批生成的本地 user-review preview deploy bundle 验证：`validate_v2_public_bundle.py artifacts/v2-rc5/user-review-preview`：PASS（139 sitemap routes、无 forbidden keys）。

## Frontend / Browser

- `node --check site/app.js`：PASS。
- `python3 scripts/qa_v2_public_ui.py site`：PASS。
- 初次 Chromium QA 暴露 B06 关系说明显示内部 `V1-ENT-*` ID；已在 `site/app.js` 的通用 `publicText` 清理器中最小修复，并重建本地 preview。
- 修复后 `npm run qa:browser:chromium`（Chromium desktop + mobile）：28/28 PASS；覆盖地图、国家/地点、搜索、时间线、作者/作品路由、内部 ID 公共边界和 sitemap 全路由。
- 未改地图/搜索/路由通用逻辑以外的产品行为；Firefox/WebKit 留至本五批周期最终或涉及通用前端改动时扩大测试。
- `git diff --check`：PASS（本批相关文件）。

## Holds / Research Gaps

- `V1-GAP-0015`：`Los heraldos negros` 的 1918 编目/1919 实际印行冲突，保持 `medium/conflict`，未静默选年。
- `SRC-0179`、`SRC-0184` 保留为 `access_limited` discovery/support context，均无正式 fact、card-source 或 relationship-evidence 引用。
- 本批不新增强解释性关系；无虚构空间现实坐标。

## Batch Gate

上述验证完成后，B06 允许独立提交并进入 B07 Preflight。Sol 审计仍需在 B06–B10 全部完成后独立重开来源与跨批数据。
