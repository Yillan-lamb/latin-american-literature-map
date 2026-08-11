# V2 研究证据层完整化 QA

## 1. 任务信息

- 任务：`V2-S6-006` 研究证据层完整化
- 日期：2026-08-11
- 状态：`✅ DONE`
- 入口：`site/app.js` 的 `researchPanel()`、来源显示与状态回退

## 2. 证据呈现

- 事实行显示字段、事实值、准入状态和对应 V1 来源；
- 正式关系显示关系类型、两端实体、审核状态和关系证据来源；
- 来源有 `canonical_url` 时提供安全的新窗口回查链接；
- 地点页显示坐标、坐标精度、坐标来源和分类来源；
- 公共策展导语显示其 `source_refs`，但不把策展文本写入 Research Data；
- `research_gap`、`related_only`、`hold` 和 `user_review` 在公共页面中分别保留边界；
- 公共 Web Data 的 `curation` 只消费 `auto_approved`，其他记录留在 `review_queue`。

## 3. 分层边界

| 层 | 消费内容 |
|---|---|
| 阅读层 | 已准入策展导语、地图标签、页面入口和作品/作家摘要 |
| 研究层 | 事实、关系、审核状态、置信度、来源、研究缺口和回溯 ID |
| 待审层 | `user_review` 推荐、`hold` 比较、研究缺口和未确认地点分类，不进入普通阅读层 |

## 4. 验证

- Web Data `curation` 公共状态门禁：`PASS`；
- `review_queue` 与研究关系分离：`PASS`；
- `python3 scripts/validate_v2_web_data.py`：`PASS`；
- `node --check site/app.js`：通过；
- `git diff --check`：通过。

