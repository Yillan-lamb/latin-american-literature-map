# V1 主数据基线

本目录是 V1.0.0 发布快照迁移出的长期主数据基线。

- 基线数据库：`V1_MASTER.sqlite`
- 基线来源：`v1.0.0` 标签的 `data/staging/v1_candidate/V1_CANDIDATE.sqlite`
- 基线 SHA-256：`e82533519dcfe2ae1a1c6d02f60c5d775dd95f49e0506c2cbeb6c649a89fb853`
- Schema：0.3
- 建立日期：2026-08-11

后续正式增量只能通过 `scripts/apply_migration.py` 写入此主库；CSV、JSON、Excel 和网站数据必须由 `scripts/export_from_sqlite.py` 从主库重建。不得在图形化 SQLite 工具、CSV、Excel 或 JSON 中静默修改事实。

`data/staging/v1_candidate/` 保留为 V1.0.0 历史发布快照，不原地覆写。

## 当前开发主库

截至 2026-08-30，开发主库已通过 append-only migration `0001`—`0030` 扩展为 `Data 1.3.1 development candidate`：371 entities、998 facts、306 relationships、288 sources、255 content cards。当前 SHA-256 为 `4d90e7e49c58def1549be18af693685610983816d5113a1e5c91c9582937fb7c`；对应全量导出位于 `data/exports/v1.3.1-candidate/`。WCD-03 仅治理既有实体的中文展示名及其直接证据，不改变实体身份、facts、relationship 端点/类型/证据或 Schema；关系中的旧中文名仅作机械同步。未合并的 0030/0031 已在 PR 内整理为单一最终 0030，不保留纠正型 0031/0032。该状态不是新的正式 Research Release，V1.0.0 历史基线及其校验值保持不变。
