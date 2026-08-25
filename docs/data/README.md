# 数据模型与维护

项目使用 SQLite 主库保存规范实体、事实、关系、来源、内容卡、审核状态与迁移记录，并通过 CSV、JSON 和 Excel 支持审核、交换和版本导出。

## 主要入口

- [数据新增与版本维护操作手册](./数据新增与版本维护操作手册.md)
- [V1 试行 Schema 与迁移规则](./阶段2_试行Schema与迁移规则.md)
- [V2 Curation Data Schema](./V2_CURATION_SCHEMA.md)
- [主数据库说明](../../data/master/README.md)
- [数据库迁移说明](../../data/master/MIGRATIONS.md)

具体数据包的 Manifest、数据字典和 QA 文件与数据本身共置于 `data/`。本目录解释稳定的数据模型与维护原则，不接收单批次任务包、临时审核结论或一次性修复报告。
