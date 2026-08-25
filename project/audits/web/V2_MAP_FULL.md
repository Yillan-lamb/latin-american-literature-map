# V2 完整地图 QA

## 1. 任务信息

- 任务：`V2-S6-002` 地图完整化
- 日期：2026-08-11
- 状态：`✅ DONE`
- 入口：`site/app.js` 的 `mapMarkup()`
- 数据：`data/v2/web/site_data.json`

## 2. 交互范围

- 默认展示所有 `map_status != hidden` 的国家、现实地点和虚构空间节点；不再只展示 N2 的精选节点；
- 点击国家后进入 `parent_place_id` 下的地点层，国家与地点之间的父子关系来自 V2 Geo Data；
- 四个筛选状态对应：全部节点、作者地理、故事空间、虚构空间；
- `author_geography` 只消费 `map_relation_role=author_geography`；
- `story_setting` 只消费 `map_relation_role=story_setting`；
- `fictional_space` 消费 `fictional_setting` 与 `fictional_space`，虚构节点保持无现实坐标；
- 节点标签显示空间类型和正式地图关系数量，点击进入地点页；
- 隐藏地点不会进入默认地图，但仍可通过研究索引或已有关系回查。

## 3. 当前地图数据 QA

| 项目 | 结果 |
|---|---:|
| 地图地点总行数 | 24 |
| 非隐藏公开节点 | 20 |
| 国家入口 | 7 |
| 现实地点/国家 | 18 |
| 虚构文学空间 | 2 |
| 地图文学关系 | 25 |
| 作者地理关系 | 16 |
| 故事空间关系 | 5 |
| 虚构空间关系 | 4 |

## 4. 安全门禁

- 虚构空间的 `latitude`、`longitude` 为空；
- 所有地点父级均指向现有 `place_id`；
- 公开地图节点均有关系目标或国家层身份；
- 地图关系的 `v1_relationship_id` 保留 V1 正式关系回溯；
- 前端不写入坐标、实体名、地点名或关系事实常量。

## 5. 验证

- `python3 scripts/validate_v2_web_data.py`：`PASS`；
- 地图过滤角色与 Web Data `map_relation_role` 集合一致；
- `node --check site/app.js`：通过；
- `git diff --check`：通过。
