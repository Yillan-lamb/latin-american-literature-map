# WEB-CE-B04 Remediation

## 触发

fresh-context Luna Reviewer 初审结论为 `REVISE`，未发现结构性污染；要求在正式入库前修复两个局部研究/建模问题。

## 修复项

1. `V1-FCT-0443`（`La invención de Morel` 首版年份）保留候选值 `1940`，但将置信度降为 `medium`，同时把 `SRC-0153`（Instituto Cervantes 传记，明写 1941）加入事实来源。`SRC-0154` 已规范为实际打开的 `www.cervantesvirtual.com` 规范 URL 和页面标题。新增 `V1-GAP-0014`，明确记录 1940/1941 冲突、当前选择依据及 `SOL_REVIEW` 决策；公开文案不得把该年份呈现为无争议事实。
2. `V1-ENT-0207`、`V1-ENT-0208`、`V1-ENT-0209`（Quiroga 三部故事集）在候选、迁移、正式实体、`entity_layer` 事实、卡片 `card_type` 与 Web 投影中统一为 `collection`；保留原有作者—作品 `CREATED` 关系及 1917/1918/1926 书目年份。

## 复验要求

- 从 B03 主库新拷贝重新应用 `0007_web_ce_b04_luna_max.sql`。
- 重新运行 master validator、完整性和 foreign-key 检查。
- 复核 Bioy 年份冲突已可追溯、Quiroga 三个实体层一致，且没有虚构地点坐标。
- 复核通过后才允许正式应用主库并进入 B04 `BATCH_PASS`。
