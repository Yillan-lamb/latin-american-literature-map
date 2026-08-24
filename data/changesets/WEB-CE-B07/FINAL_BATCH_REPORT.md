# WEB-CE-B07 Final Batch Report

## Scope

- Task：`WEB-CE-B07`；基线：B06 commit `f1448b5`。
- 3 位作者（Parra、Pizarnik、Benedetti）、9 部作品/作品集；复用智利、阿根廷、乌拉圭国家节点。
- 独立 Reviewer：`PASS`；临时库完整性与外键通过。

## Actual Delta

| 项目 | 增量 |
|---|---:|
| authors | 3 |
| works / collections | 9 |
| entities | 12 |
| facts | 42 |
| relationships | 12 |
| sources | 9 |
| content cards | 12 |
| card_sources | 21 |
| relationship evidence | 12 |
| research gaps | 0 |
| Geo places | 0 |
| Geo place relations | 3 |

数字以正式 master、Geo CSV 与 Web Data 机器计数为准。

## Integration and Product Impact

- migration：`data/master/migrations/0010_web_ce_b07_luna_max.sql`；正式 master 写入后计数为 entities 245、facts 602、relationships 173、sources 194、content_cards 135、gaps 15。
- Curation review package 增长至 31 authors、78 works、25 places；B07 新内容仍为 `user_review`。
- Web Data 计数为 245 entities、602 facts、173 relationships、194 sources、135 cards、31 places、48 place relations。
- 3 条作者—国家关系进入地图数据；无新现实坐标、无虚构空间坐标。

## Holds / Next Review Focus

- 本批没有新增 gap；中文版本学字段继续按展示优先策略不设门槛。
- Sol 应重点重开 Parra 的 Memoria Chilena/Universidad de Chile 书目、Pizarnik 的 CVC 书目，以及 Benedetti Foundation 的作品页，确认页面身份和首版年份表述保持一致。
- Sol 还应跨批检查 `Montevideanos`、乌拉圭节点及 `ASSOCIATED_WITH_PLACE` 关系是否与 B06 的 Quiroga/Roa 记录重复或冲突。

## QA / Gate

详见 `qa/QA.md`。B07 migration、master、Curation、Web Data、确定性重建、公共预览、浏览器核心路径与 diff check 通过后，批次状态为 `BATCH_PASS`。
