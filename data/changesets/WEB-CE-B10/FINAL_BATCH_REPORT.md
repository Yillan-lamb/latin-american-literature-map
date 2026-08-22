# WEB-CE-B10 Final Batch Report

## Scope

- Task：`WEB-CE-B10`；基线：B09 commit `6c2419164ef6bef89cd61e4e45ef0d309e5dce9f`。
- 3 位作者：Eduardo Galeano、Ricardo Piglia、César Aira；9 部作品/作品集。
- 复用乌拉圭 `V1-ENT-0196`、阿根廷 `V1-ENT-0001` 国家节点；不新增地点实体。
- Fresh-context Reviewer 初轮 `REVISE`，完成差量修复后 follow-up `PASS`；正式主库仅在 follow-up 通过后写入。

## Actual Delta

| 项目 | 增量 |
|---|---:|
| authors | 3 |
| works / collections | 9 |
| entities | 12 |
| facts | 43 |
| relationships | 12 |
| sources | 11 |
| content cards | 12 |
| card_sources | 28 |
| fact_sources | 43 |
| relationship evidence | 12 |
| research gaps | 0 |
| Geo places | 0 |
| Geo place relations | 3 |

初始研究包为 42 facts；Reviewer 要求为 Galeano 补充 `country_or_region=乌拉圭` fact 及两条链接后，正式增量为 43 facts。数字由正式 master、迁移和 Geo CSV 机器计数确认。

## Integration and Product Impact

- 独立 migration：`data/master/migrations/0013_web_ce_b10_luna_max.sql`，通过 `apply_migration.py` 正式写入。
- 正式 master 写入后：entities 281、facts 729、relationships 209、sources 222、content_cards 171、gaps 16。
- 新实体为 3 authors、7 works、2 collections；`V1-ENT-0276` 与 `V1-ENT-0277` 保持 `collection`，其余 7 部为 `work`。
- Curation review package：40 authors、105 works、25 places；B10 新增作者/作品字段全部保持 `user_review`，没有越过公共内容准入。
- Web Data：281 entities、729 facts、209 relationships、222 sources、171 cards、31 places、57 place relations。
- 新增 3 条作者—国家文学地理关系；没有新增现实坐标，也没有虚构空间坐标。
- 中文展示名统一为路线图标签 `《火的记忆Ⅰ：创世纪》`，原文题名与卷册层级保留；译者、出版社、ISBN 仍未被设为本批门槛。

## Remediation / Review

初轮 Reviewer 的五项问题均已差量修复：

1. 为 `V1-CARD-0165` 补入 `SRC-0215`（`V1-CS-0343`），与候选 `source_ids` 对齐。
2. 新增 `V1-FCT-0731` 及 `fact_sources`、`card_facts`，使 Galeano 的国家字段完整可回溯。
3. 候选、迁移、card、relationship 与策展文本统一使用 `《火的记忆Ⅰ：创世纪》`。
4. 移除迁移内 `BEGIN`/`COMMIT`，通过项目 `apply_migration.py` 门禁。
5. 将 `SRC-0223.author_or_editor` 修正为 María Belén Riveiro，publisher 保留为 Universidad Nacional de La Plata。

Follow-up Reviewer 重新核对 11 个来源、43 facts、实体层级、关系端点、Geo 边界和 90 个策展状态，最终 verdict 为 `PASS`。本批没有新增 HOLD 或 research gap。

## QA / Gate

- 临时迁移副本与正式 master：`PRAGMA integrity_check=ok`、`PRAGMA foreign_key_check` 空集、`scripts/validate_master.py` PASS。
- `scripts/build_v2_public_content.py` 与 `scripts/validate_v2_content_quality.py`：PASS（40 authors、105 works、25 places）。
- 固定 `generated_at=2026-08-21T06:00:00Z` 重建 Web Data 两次字节一致；Web validator PASS。
- user-review preview bundle：PASS（195 files、187 sitemap routes，review queue 未暴露到公共页面）。
- Chromium desktop/mobile 核心 QA：28/28 PASS；B10 12 个作者/作品路由、12 个搜索、乌拉圭/阿根廷国家页与地图上下文定向检查均 PASS。
- `node --check site/app.js`、`python3 scripts/qa_v2_public_ui.py site`、preview public UI scan、`git diff --check`：PASS。
- 外部 AI 交付 CSV 的既有 CRLF-only 工作区提示未纳入本批。

## Batch Gate

`BATCH_PASS`。本批已完成独立 migration、Geo/Curation/Web Data 重建和 QA；不得启动 B11，等待五批交接给 Sol。
