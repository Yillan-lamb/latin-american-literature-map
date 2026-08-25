# WEB-CE-B05

本目录记录《60+作家分批扩充计划》Batch 05（巴西经典骨架）的独立执行包。

- 执行模式：Luna Max；以 B04 `d3c7ea6` 后主库重新 Preflight。
- 范围：马查多·德·阿西斯、若昂·吉马朗埃斯·罗萨、格拉西利亚诺·拉莫斯各 3 部代表作；巴西国家节点复用既有 `V1-ENT-0183`。
- 中文展示名：沿路线图采用读者展示候选；原文题名始终保留，译者、出版社、译本年份和 ISBN 不作为本批 Research 门槛。
- 研究边界：仅写入已打开的 ABL、国家/州级图书馆、公共文化机构和官方文本页面直接支持的原子事实；不建立影响、文学运动或强主题关系。
- Geo：只新增 3 条作者—巴西关联，不把出生地或作品情节地点自动转成地图坐标。
- Git 边界：本批独立 migration、Review、QA 和 commit；不修改 `project/governance/PROJECT_CHARTER.md`，不执行发布、部署或 tag。

文件：

- `PREFLIGHT.md`：基于 B04 最新主库的逐项查重、ID 和执行范围确认。
- `RESEARCH_CHANGE_SET.json`：候选实体、来源、Geo 及展示名说明。
- `review/REVIEW.md`：独立 fresh-context Reviewer 结论。
- `FINAL_BATCH_REPORT.md`：迁移、产品影响、HOLD 和批次门禁。
- `qa/QA.md`：本批复验记录。
