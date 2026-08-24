# WEB-CE-B12 Batch Report

## Scope

- Task：`WEB-CE-B12`
- 主题：阿根廷当代小说/短篇与智利新小说；三位新作家 Samanta Schweblin、Mariana Enriquez、Alejandro Zambra。
- 计划与实际：3 位作者、9 部作品均完成；首版年份证据不足之处保留为 research gap，没有用当前版本日期替代首版年份。

## Actual delta

- 3 authors：萨曼塔·施韦布林、玛丽安娜·恩里克斯、亚历杭德罗·桑布拉。
- 9 works/collections：6 works、3 collections；中文名均保留原文题名并标为 `provisional_title`。
- 33 facts、12 CREATED / author-country relationships、10 sources、12 content cards、24 card-source rows。
- Geo：3 条作者—国家关系；无新现实坐标、无虚构空间。
- Research gaps：5（3 部作品首版年份、1 部作品首版/奖项边界、1 部版权年份与首版年份边界），无 HOLD、无 disputed。

## Product impact

- Research → Geo → Curation → Web Data 链路闭环。
- 12 个新增实体进入内部 review preview、搜索和正式 route；正式 public projection 不增加待审作者/作品。
- Curation extension 仍为 `user_review` / `UNREVIEWED`，未当作 USER 批准。

## Gate

Review follow-up 为 `PASS`；迁移 `0017_web_ce_b12_luna_max.sql` 已正式应用；QA 全部通过；B12 状态：`BATCH_PASS`。

## Git

- 建议 commit：`feat(data): complete WEB-CE-B12`
- 本报告生成后只 stage B12 changeset、migration、主库、Geo、Curation 与 Web Data；其他工作区修改排除。
