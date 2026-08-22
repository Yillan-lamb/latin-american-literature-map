# WEB-CE-B04

本目录记录《60+作家分批扩充计划》Batch 04（Bioy Casares / Roa Bastos / Quiroga）的独立执行包。

- 执行模式：Luna Max；基于 B03 commit 后主库重新 Preflight。
- 范围：3 位新作家、每位 3 部路线图代表作；查重后不重复建立已有实体。
- 中文展示名：保留原文题名，中文名仅作读者展示候选；译本元数据不是本批 Research 门槛。
- 研究边界：只写入已打开的国家图书馆、大学/研究机构、Cervantes 或作者基金会页面直接支持的原子事实。
- Geo：新增巴拉圭国家节点及作者—国家关联；不把未有场景证据的地点写成作品坐标。
- Git 边界：本批独立 migration、Review、QA 和 commit；不修改 `PROJECT_CHARTER.md`，不执行发布、部署或 tag。

文件：

- `PREFLIGHT.md`：基于 B03 最新主库的查重、ID 和执行范围确认。
- `RESEARCH_CHANGE_SET.json`：候选实体、来源、Geo 及展示名说明。
- `review/REVIEW.md`：独立 fresh-context Reviewer 结论。
- `review/REMEDIATION.md`：如有返修，记录最小闭环。
- `FINAL_BATCH_REPORT.md`：迁移、产品影响、HOLD 和批次门禁。
- `qa/QA.md`：本批复验记录。
