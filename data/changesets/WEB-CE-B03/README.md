# WEB-CE-B03

本目录记录《60+作家分批扩充计划》Batch 03（Onetti / Donoso / Sabato）的独立执行包。

- 执行模式：Luna Max；基于 B02 commit 后主库重新 Preflight。
- 范围：3 位新作家、每位 3 部路线图代表作；不重复建立已有实体。
- 中文展示名：保留原文题名，中文名仅作读者展示候选；译者、出版社、译本年份和 ISBN 不是本批门槛。
- 研究边界：只写入可由已打开的国家图书馆、大学/研究机构或 Cervantes 机构页面直接支持的原子事实；文学运动、影响关系和强主题留在策展/HOLD。
- Geo：新增正式乌拉圭国家节点及有直接来源支持的虚构 Santa María；虚构空间不落现实坐标。
- Git 边界：本批独立 migration、Review、QA 和 commit；不修改 `project/governance/PROJECT_CHARTER.md`，不执行发布、部署或 tag。

文件：

- `PREFLIGHT.md`：基于 B02 最新主库的查重、ID 和执行范围确认。
- `RESEARCH_CHANGE_SET.json`：候选实体、来源、原子事实、关系、Geo 及展示名说明。
- `review/REVIEW.md`：独立 fresh-context Reviewer 结论。
- `review/REMEDIATION.md`：如有返修，记录最小闭环。
- `FINAL_BATCH_REPORT.md`：迁移、产品影响、HOLD 和批次门禁。
- `qa/QA.md`：本批复验记录。
