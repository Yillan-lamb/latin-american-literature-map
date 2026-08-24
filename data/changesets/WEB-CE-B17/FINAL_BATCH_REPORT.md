# WEB-CE-B17 Final Batch Report

日期：2026-08-22
状态：`BATCH_PASS`

## Scope and actual delta

本批采用动态 close-out 选择：巴西女性作家 Lygia Fagundes Telles、厄瓜多尔作家 Jorge Icaza、委内瑞拉作家 Rómulo Gallegos。实际新增 2 个国家节点、3 位作者、9 部作品/作品集（其中 1 部为 collection），没有重复实体或关系。

| Item | Actual |
|---|---:|
| Authors | 3 |
| Works / collections | 9 |
| Facts | 42 |
| Relationships | 12 |
| Sources | 7 |
| Content cards | 12 |
| Geo places | 2 |
| Geo place relations | 3 |
| Research gaps | 1 |
| Curation author/work entries | 3 / 9 |

作品保留葡萄牙语/西班牙语原题名作为研究锚点；中文名称均为 `provisional_title`，不把工作性译名包装为正式出版版本。

## Review and findings

Fresh-context Reviewer 在七个来源逐一重开后给出 `PASS`。ABL 与 Biblioteca Nacional 的 Lygia 出生年份冲突没有被静默抹平，已落入 `V1-GAP-0024`；Icaza 与 Gallegos 的生平/书目事实由目录、大学论文和官方文化机构页面支持。Research 只写入原子事实、作者—作品关系和作者—国家关系，没有添加影响、文学运动、主题、故事空间或虚构坐标判断。

## Product impact

- Geo 新增厄瓜多尔、委内瑞拉两个国家级文学入口；两者无坐标，等待国家边界投影，不制造中心点。
- Review package 达到 61 authors、168 works、25 literary places；B17 新增作者/作品均处于 `user_review`，不等同 USER 批准。
- Formal public projection 保持 25 authors、60 works，国家/地点 public scope 增至 28（新增 Ecuador、Venezuela 国家入口）；timeline 增至 269。
- Web Data 固定时间两次重建一致，Research → Geo → Curation → Web Data 链路完整；正式 bundle 未暴露 review queue。

## QA and Git

- Migration：`data/master/migrations/0023_web_ce_b17_luna_max.sql`。
- QA：见 `qa/QA.md`；master、Web Data、content quality、public bundle、preview、Chromium、Firefox、WebKit 均通过。
- 本批未执行 Release、tag、push 或 production deployment；B17 是本轮最终批次，不启动 B18。

## Remaining holds / next cycle

- `V1-GAP-0024`：Lygia Fagundes Telles 出生年份 1923/1918 authority conflict，交 Sol 复核。
- 上一批 `V1-GAP-0023`：Sepúlveda《一个老人读爱情小说》的 1989/1993 书目争议继续交 Sol 复核。
- 女性诗人、加勒比、中美洲、安第斯和现实城市文学空间仍需后续 roadmap 规划；本批不擅自重写 60+ 计划。
