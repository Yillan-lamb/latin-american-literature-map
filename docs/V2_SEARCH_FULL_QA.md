# V2 搜索完整化 QA

## 1. 任务信息

- 任务：`V2-S6-004` 搜索完整化
- 日期：2026-08-11
- 状态：`✅ DONE`
- 入口：`site/app.js` 的 `renderSearch()`
- 数据：`data/v2/web/site_data.json.search_index`

## 2. 搜索能力

- 搜索索引覆盖 144 个 V1 研究实体，并补充 2 个技术地图父节点；
- 目标类型按页面消费归一为作者、作品、国家、现实地点、虚构空间、事件和关联节点；
- 支持中文名、原文名、内容卡标题、国家/地区和时期字段检索；
- 结果按类型分组，并显示结果数量；
- 结果类型筛选不改变数据，只改变当前展示集合；
- 无结果时提供明确空状态；
- 可进入完整作者/作品/地点页，或进入关联研究节点回退页。

## 3. 路由门禁

| 搜索结果类型 | 路由 |
|---|---|
| author | `#/author/{id}` |
| work | `#/work/{id}` |
| country | `#/country/{id}` |
| place / fictional_space | `#/place/{id}` |
| event / collection / theme / 其他关联类型 | `#/node/{id}` |

## 4. 验证

- Web Data QA `PASS`，研究实体全部进入搜索索引；
- 搜索筛选类型来自 Web Data 类型字段，前端未写实体事实；
- `node --check site/app.js`：通过；
- `git diff --check`：通过；
- `aria-live="polite"` 用于结果计数，动态结果变化可被辅助技术感知。

