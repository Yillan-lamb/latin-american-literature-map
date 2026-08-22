# WEB-CE-B15 Batch Report

## Scope

- Task：`WEB-CE-B15`
- 主题：秘鲁短篇、阿根廷小说与古巴流亡写作；Julio Ramón Ribeyro、Juan José Saer、Reinaldo Arenas。
- 计划与实际：3 位新作者、9 个作品/作品集全部完成；中文展示名均为 `provisional_title`，原文题名保留。

## Actual delta

- 3 authors：胡利奥·拉蒙·里贝罗、胡安·何塞·萨埃尔、雷纳尔多·阿雷纳斯。
- 9 works/collections：`Los gallinazos sin plumas`、`Silvio en El Rosedal`、`La palabra del mudo`、`El limonero real`、`El entenado`、`Glosa`、`Celestino antes del alba`、`El mundo alucinante`、`Antes que anochezca`。
- 36 facts、12 relationships（9 author→work/collection、3 author→country）、7 sources、12 content cards、22 card-source rows、1 research gap。
- Geo：新增 3 条作者—国家投影；没有新增现实地点、虚构空间或坐标。

## Product impact

- Research → Geo → Curation → Web Data 链路闭环；B15 12 个新研究实体进入内部 review preview、搜索文本、Research Evidence、正式 route 和时间线，但未进入 formal public scope。
- Review package 从 B14 的 52 authors / 141 works 增至 55 / 150；B15 策展字段全部 `user_review` / `UNREVIEWED`。
- Formal public projection 仍为 25 authors / 60 works / 26 places；未把待审内容公开。
- 本批体裁覆盖为 3 个短篇小说集、5 部小说和 1 部自传；文学地图继续扩展秘鲁、阿根廷、古巴国家入口，但性别与诗歌平衡仍需下一周期关注。
- `La palabra del mudo` 1973 仅作为版本锚点；`Glosa` 的 1986/未核实 1985 线索保持 gap，不在页面中伪装为无争议年份。

## Gate

Fresh-context Review 经初审及三轮 focused follow-up 后为 `PASS`；0020 已正式应用；连续迁移重放、主库完整性、Geo、Curation、Web Data、public boundary、preview UI 和 Chromium 桌面/移动 QA 全部通过；B15 状态：`BATCH_PASS`。

## Git

- 本报告生成后只 stage B15 changeset、migration 0020、主库、Geo、Curation 与 Web Data；其他工作区修改排除。
- 本批未执行 push、PR、Release、tag 或 production deployment。
