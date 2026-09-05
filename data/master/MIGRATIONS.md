# 主库迁移记录

V1.0.0 发布快照是不可变历史基线；当前开发主库已在该基线上通过 append-only migration `0001`—`0035` 扩展。迁移文件位于 `migrations/`，可运行 `scripts/validate_migration_replay.py`，从 `data/staging/v1_candidate/V1_CANDIDATE.sqlite` 按序重放并与 `V1_MASTER.sqlite` 的全部表进行比较。

每个后续变更必须：

1. 在本目录的 `migrations/` 生成有序 SQL 文件，例如 `0001_add_source.sql`；
2. 先经过 Reviewer，记录 task ID、范围、来源和版本影响；
3. 用 `scripts/apply_migration.py` 在事务中执行；
4. 通过 `scripts/validate_master.py` 后，再用 `scripts/export_from_sqlite.py` 重建公开导出；
5. 将迁移文件、QA 报告、导出清单和 CHANGELOG 一并交给版本门禁。

迁移 ID 永不复用；实体合并/拆分必须保留映射或重定向，不能静默删除旧 ID。
