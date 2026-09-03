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

截至 2026-09-03，开发主库已通过 append-only migration `0001`—`0035` 扩展为 `Data 1.5.0 development candidate`：377 entities、1027 facts、334 relationships、314 sources、261 content cards。当前 SHA-256 为 `a8c54e3c0e04a347f310d7f0f969dfba758f575008fa64c1789e43b26bf378cc`；对应全量导出位于 `data/exports/v1.5.0-candidate/`。WCD-07 完成 6 个 P0 重要作品/合集的研究补全、来源治理和中文展示名 provenance，17 个 P1 first-wave 保持 DEFER；该状态不是新的正式 Research Release，V1.0.0 历史基线及其校验值保持不变。
