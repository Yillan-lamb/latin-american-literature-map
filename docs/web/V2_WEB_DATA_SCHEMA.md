# V2 Web Data Schema 与构建流程

> 本文件定义 Web Data 的稳定结构、构建边界和 QA 规则。产品版本、当前数据统计和 Public Release 状态属于当前公开事实，应以根目录 README、数据/Web manifest、CHANGELOG 和正式审计为准；它们不在本 Schema 中重复维护。

## 1. 任务信息

- 任务：`V2-S2-002`
- 日期：2026-08-11
- 状态：`✅ DONE`
- 输入：`data/master/V1_MASTER.sqlite`、`data/v2/geo/`、`data/v2/curation/`
- 输出：`data/v2/web/site_data.json`、`data/v2/web/manifest.json`
- 构建：`python3 scripts/build_v2_web_data.py --generated-at 2026-08-11T00:00:00+08:00`
- QA：`python3 scripts/validate_v2_web_data.py`

## 2. 原则

Web Data 是前端页面的消费层，不是新的研究主库。构建脚本每次从 V1 Research Data、V2 地图技术补充和 Curation Data 重新生成；前端不得直接查询 SQLite，也不得在组件中写作者、作品、地点、年份、关系或坐标等事实。

```text
data/master/V1_MASTER.sqlite ─┐
data/v2/geo/ ──────────────────┼─> build_v2_web_data.py ─> site_data.json ─> Frontend
data/v2/curation/ ─────────────┘
```

## 3. 顶层结构

| 键 | 用途 |
|---|---|
| `schema_version` | 当前 `v2-web-0.2` |
| `generated_at` | 构建时间；发布构建应固定记录 |
| `data_sources` | 输入文件与数据库路径 |
| `counts` | 构建统计，供 QA 和审核包使用 |
| `research` | 研究层投影：实体、卡片、事实、关系、来源、hold、gap |
| `curation` | 仅含 `auto_approved` 的公共策展记录 |
| `review_queue` | `user_review` 与 `hold` 独立队列，不进入普通阅读层 |
| `reader_content` | 从已准入内容和结构化事实生成的结论式读者投影；禁止来源核验、审核过程和工作台语言 |
| `pages` | 作者、作品、地点、事件的页面消费集合 |
| `map` | 地点节点与文学地点关系；兼容现实点、国家层和无坐标虚构空间 |
| `search_index` | 实体和内容卡的基础搜索索引 |
| `timeline` | 作家、作品等文学节点，以及必要的历史背景节点；每个节点保留年份/时期与当前研究状态 |
| `presentation.discovery` | 覆盖全部公开作者/作品的确定性排序、分数因子、稳定 tie-break 与每页数量 |

## 4. 页面消费约定

- `pages.authors`、`pages.works`、`pages.events` 保留 V1 `entity_id`，并附上相关内容卡、事实、入出关系。
- `map.places` 同时保留 `place_id`、`entity_id`、`reality_status`、`parent_place_id`、坐标来源和 `map_status`。
- `map.relations` 的 `v1_relationship_id` 指向 V1 正式关系，`map_relation_role` 指向 V2 三类地图语义。
- `search_index` 只承载检索字段与目标 ID；地点实体在索引中归一为 `country`、`place` 或 `fictional_space`，关联节点保留原实体类型；页面路由由前端路由层决定，不在数据中硬编码外部 URL。
- `timeline` 以作家和作品文学节点为主体，不创建独立事件地图；必要的历史背景事件可以在作品页和时间线中消费。
- `research` 可以包含 `hold`、`research_gap` 等状态，但普通阅读组件只能消费已审核或明确允许的字段。

## 5. 双层阅读

前端应将 Web Data 分成：

1. **阅读层**：页面导语、作品简介、地图卡片和全量目录统一消费 `reader_content`；语言自然，不展示来源机构、书目核验、审核过程或数据库内部字段。
2. **研究层**：来源、事实字段、关系类型、置信度、审核状态、研究缺口和回溯 ID；用户主动展开后查看。

两层引用同一 Web Data，不复制两套事实。研究层发现错误时，回到 V1 Research Data 或 V2 Curation Data 修复并重新构建。

## 6. 构建与 QA

构建脚本会在生成前检查：

- CSV 表头、ID 唯一性、坐标成对出现；
- 父地点和地图关系目标存在；
- 虚构地点没有现实坐标；
- 策展目标 ID 可回溯，状态使用受控枚举；
- 公共策展结果只含 `auto_approved`；
- 推荐记录不写入研究关系；
- 研究实体全部进入搜索索引。

`validate_v2_web_data.py` 对生成结果再次检查悬空引用、数量、状态门禁和虚构空间坐标安全。任何失败都应阻止进入 S3/S4。

## 7. 构建记录与历史快照

每次构建的版本、输入、统计、公开边界和验证结果应写入对应的正式审计或发布候选记录；不要把构建结果手工复制到本稳定 Schema 文档中。

### Historical initial build snapshot（2026-08-11）

初始构建使用 V1 正式数据库、S1-002 地图数据和阶段 5 完整策展草稿，输出 144 个研究实体、40 张内容卡、238 条事实、76 条正式关系、24 个地图节点、25 条文学地点关系、74 个来源、51 条策展记录；该数字仅用于解释 `V2-S2-002` 的历史验收，不代表当前开发主库。

该快照只用于解释早期 `V2-S2-002` 的历史验收，不代表当前开发数据；当前构建应通过脚本从明确输入重建并由审计记录。
