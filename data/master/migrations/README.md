# 主库迁移文件

按四位数字和小写说明命名：`0001_lowercase_description.sql`。文件只包含数据定义/数据变更语句，不包含 `BEGIN`、`COMMIT`、`ATTACH`、`DETACH`、`VACUUM` 或 schema 绕过语句；事务和完整性检查由 `scripts/apply_migration.py` 负责。
