# WEB-CE-B08 Final Batch Report

## Scope

- Task：`WEB-CE-B08`；基线：B07 commit `77a1d0a`。
- 3 位作者（José María Arguedas、Sergio Pitol、Juan José Arreola）、9 部作品/作品集。
- 独立 fresh-context Reviewer：`PASS`；临时库完整性与外键通过。

## Actual Delta

| 项目 | 增量 |
|---|---:|
| authors | 3 |
| works / collections | 9 |
| entities | 12 |
| facts | 42 |
| relationships | 12 |
| sources | 8 |
| content cards | 12 |
| card_sources | 23 |
| relationship evidence | 12 |
| research gaps | 0 |
| Geo places | 0 |
| Geo place relations | 3 |

数字以正式 master、Geo CSV 与 Web Data 机器计数为准。

## Integration and Product Impact

- migration：`data/master/migrations/0011_web_ce_b08_luna_max.sql`；正式 master 写入后计数为 entities 257、facts 644、relationships 185、sources 202、content_cards 147、gaps 15。
- Curation review package 增长至 34 authors、87 works、25 places；B08 新内容继续为 `user_review`。
- Web Data 计数为 257 entities、644 facts、185 relationships、202 sources、147 cards、31 places、51 place relations。
- 复用秘鲁、墨西哥国家节点；新增 3 条作者—国家关系；无新现实坐标、无虚构空间坐标。
- Arreola 的 `Bestiario` 保留为作者特定 collection，与现有 Cortázar 同名实体分开。

## Holds / Next Review Focus

- 本批没有新增 gap；中文版本学字段继续按展示优先策略不设门槛。
- Sol 应重点重开 BNP、Casa de la Literatura Peruana、Instituto Cervantes/CVC 与 Fonoteca Nacional 来源，并跨批确认同名 `Bestiario` 的作者锚点。

## QA / Gate

- 临时迁移副本及正式 master：`integrity_check=ok`、`foreign_key_check` 空集；`validate_master.py` PASS。
- `validate_v2_content_quality.py` PASS（34 authors、87 works、25 places）。
- 固定 `generated_at=2026-08-21T04:00:00Z` 两次重建 Web Data 字节一致；Web validator PASS。
- user-review preview bundle PASS（163 sitemap routes）。
- Chromium desktop/mobile 核心 QA：28/28 PASS；B08 12 个作者/作品路由、作者搜索、秘鲁/墨西哥地图上下文 desktop/mobile 定向检查 PASS。
- `node --check site/app.js`、`qa_v2_public_ui.py`、`git diff --check` PASS。

## Batch Gate

`BATCH_PASS`。本批已完成独立 migration、Geo/Curation/Web Data 重建与 QA，允许进入 B09 Preflight。
