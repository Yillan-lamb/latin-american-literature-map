# WEB-CE-B15 QA

日期：2026-08-21

## Research / SQLite

- Fresh-context Review：初审 `REVISE`，三轮 focused follow-up 最终 `PASS`；完整来源、返修和结论保留在 `review/REVIEW.md`。
- Migration rehearsal：从 B14 正式主库副本重放 `0020_web_ce_b15_luna_max.sql` 成功。Reviewer 复核的数据版本 SHA-256 为 `954e26f0b1854c46532320048c8bbe4eb8459f2332d3b55510d77d67674902e6`；集成时仅将 12 条 `entity_id_map.mapping_basis` 从 pending 改为真实 PASS provenance，最终迁移 SHA-256 为 `de7184807164f0f076fc34567ad4af97f5457ae7b6ebc44668544c0c5729f050`，并重新演练通过。
- 正式主库：`PRAGMA integrity_check=ok`，`foreign_key_check` 为空；`scripts/validate_master.py data/master/V1_MASTER.sqlite`：PASS。
- 迁移后主库计数：341 entities、919 facts、269 relationships、258 sources、231 cards、22 gaps、20 migration rows；relationship evidence 296，card-source rows 451。
- B15 实际增量：12 entities（3 authors、3 collections、6 works）、36 facts、12 relationships、7 sources、12 cards、22 card-source rows、1 research gap；无新增 place entity。
- 关键字段复核：`La palabra del mudo` 使用 `first_book_edition_year=1973`；`Glosa` 正式记录为 1986，1985 仅保留为未定位、未核实 discovery lead；Saer 形式/层级 facts 以 `SRC-0256` 为直接来源、年份 facts 以 `SRC-0257` 为辅助来源；`SRC-0257` 语言为 `es`、状态为 `access_limited`。
- 时间戳/身份：B15 candidate 的对象、来源和顶层 metadata 均为 `created_at=2026-08-21`、`reviewed_at=2026-08-21`、`reviewer=LUNA-MAX-B15-REVIEW`、`review_status=PASS`；Curation 仍为 `user_review`/`UNREVIEWED`，没有伪造 USER 审批。

## Continuous replay

- 从 Sol B06—B10 基线提交 `484d6b6` 的主库副本连续重放 0016（B11）至 0020（B15），五个 migration 全部成功。
- 连续 replay 最终计数与正式主库逐表一致；`integrity_check=ok`、foreign-key check 为空、`validate_master.py` PASS。`migration_log.applied_at` 因重放时间不同而不同，其余迁移字段与业务表逐表一致。

## Sources / semantic boundary

- `SRC-0257` 已统一为 Diego Vigna、Verónica Bernabei，使用 UNL article-view canonical URL，正文语言登记为西班牙语；直接 PDF 受限状态被保留。
- `SRC-0254` 的 `La palabra del mudo` 1973 仅作为 Madrid Milla Batres Tomos I–II 版本锚点，不进入首版年份；card 与 Curation 同步表达。
- `V1-GAP-0022` 保持 `open_research` / `SOL_REVIEW`，不把未定位的 1985 线索写成正式来源或确定出版年。

## Geo / Curation / Web

- Geo：新增 `V2-GEO-REL-071`—`073` 三条作者—国家投影，分别复用秘鲁、阿根廷、古巴既有国家节点；无新坐标、无虚构空间。
- Geo 一致性：三条新 CSV 行的 relationship/source/endpoint 与 SQLite `V1-REL-0269`—`0271` 完全一致。
- Review package：55 authors、150 works、25 literary places；B15 新增 3 authors、9 works 的策展字段全部为 `user_review` / `UNREVIEWED`。
- Formal public projection：`public_scope` 仍为 25 authors、60 works、26 places；B15 不增加正式公开作者/作品。Review queue 与 public projection 分离。
- `validate_v2_content_quality.py data/v2/curation/PUBLIC_CONTENT.json`：PASS（authors 55、works 150、places 25）。
- Web Data：固定 `generated_at=2026-08-21T12:00:00Z` 构建；第二次固定时间重建与正式目录字节一致；`validate_v2_web_data.py data/v2/web/site_data.json`：PASS。
- Web Data counts：341 entities、919 facts、269 relationships、258 sources、231 cards、72 place relations；review package 可消费 B15 数据，formal public scope 未被放宽。

## Preview / browser / engineering

- `build_v2_user_review_preview.py`、`validate_v2_public_bundle.py`、`qa_v2_public_ui.py`：均 PASS；预览包 255 files / 247 routes，review queue 未暴露。
- B15 新增作者与作品均在内部 preview 中具有搜索文本、Research Evidence、作者/作品 route 和时间线节点；正式 public search scope 未包含待审对象。
- Chromium desktop + mobile Playwright：30/30 PASS（`V2_QA_BASE_URL=http://127.0.0.1:4175/`）；覆盖首页、地图、国家/地点、搜索、时间线、作者/作品/来源路由、全 sitemap、public boundary。
- `node --check site/app.js`：PASS。
- `git diff --check`：无错误；仅报告未纳入提交的外部 CSV 既存 CRLF warning。

## Known scope notes

- B15 未修改 `project/governance/PROJECT_CHARTER.md`、通用前端逻辑或 roadmap；未执行 Release、tag、push 或 production deployment。
- 工作区中 `project/audits/web/V2_RC5_CURATION_USER_REVIEW.md`、`work/external-ai/deliveries/` CSV 与 `artifacts/v2-rc5/` 为其他任务/QA 产物，未纳入 B15 commit。

## Gate

`BATCH_PASS`：Fresh-context Review PASS、schema-correct migration、连续重放、主库、Geo/Curation/Web Data、public boundary、预览、浏览器与工程 QA 全部通过。
