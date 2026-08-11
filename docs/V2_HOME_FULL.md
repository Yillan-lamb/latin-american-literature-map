# V2 完整首页与入口 QA

## 1. 任务信息

- 任务：`V2-S6-001` 首页完整化
- 日期：2026-08-11
- 状态：`✅ DONE`
- 入口：`site/index.html`、`site/app.js`
- 数据：`data/v2/web/site_data.json`

## 2. 首页结构

首页保留 N2 已审核的精选入口，同时把完整数据接入可继续探索的层级，不直接把数据库全集平铺：

1. 文学地图：消费完整公开地图节点，支持国家下钻和三类地图语义筛选；
2. 本期入口：消费 `featured_author` 选择；
3. 从一部作品开始：消费 `featured_work` 选择；
4. 完整范围：展示公开作者页、作品页、地图节点和时间线节点统计；
5. 继续发现：展示未进入 N2 精选但已满足最低来源门槛的作者和作品；
6. 时间入口：展示完整时间线的前两个节点，并引导到 `#/timeline`；
7. 搜索入口：完整索引承担其余作者、作品和关联节点的检索路径。

## 3. 当前覆盖结果

| 首页入口 | 当前数量 | 来源 |
|---|---:|---|
| 精选作者 | 4 | `data/v2/curation/CURATION_SELECTIONS.csv` |
| 精选作品 | 6 | `data/v2/curation/CURATION_SELECTIONS.csv` |
| 满足最低来源门槛的作者 | 10 | V1 `content_cards.source_minimum_status=meets` |
| 满足最低来源门槛的作品 | 17 | V1 `content_cards.source_minimum_status=meets` |
| 非隐藏地图节点 | 20 | V2 `PLACES_GEO.csv` + Web Data |
| 时间线节点 | 43 | 10 作家 + 28 作品 + 5 背景事件 |

## 4. 状态门禁

- 研究缺口作品不进入完整作者/作品统计，也不由首页策展文案确定化；
- `user_review` 推荐和 `hold` 比较不进入公共首页；
- 虚构空间只以文学空间节点出现，不生成现实坐标；
- 首页文案、作者名、作品名、地点名和年份均来自 Web Data，不写入前端事实常量。

## 5. 验证

- `python3 scripts/build_v2_web_data.py --generated-at 2026-08-11T00:00:00+08:00`：通过；
- `python3 scripts/validate_v2_web_data.py`：`PASS`；
- `node --check site/app.js`：通过；
- `git diff --check`：通过；
- 首页使用本地 CSS、JS 和 Web Data，无外部图片或远程资产依赖。
