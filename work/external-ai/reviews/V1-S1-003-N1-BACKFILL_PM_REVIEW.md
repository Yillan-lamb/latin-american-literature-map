# V1-S1-003-N1-BACKFILL 项目经理验收记录

- task_id: `V1-S1-003`
- assignment_id: `V1-S1-003-N1-BACKFILL`
- reviewer: `CODEX-PM`
- review_type: `acceptance_audit`
- reviewed_at: `2026-08-04`
- verdict: `pass`

## 验收结论

本任务通过项目经理验收。回填结果与 `SOURCE_ID_MAP.csv` 及 `data/catalog/SOURCE_REGISTRY.csv` 一致，且未发现超出任务卡允许范围的 OCR 正文、候选内容或证据变更。

## 七项复核结果

| # | 复核项 | 结果 | 可复核证据 |
|---|---|---|---|
| 1 | `SOURCE_MANIFEST.csv` 解析和映射 | pass | 标准 CSV 解析为表头 + 6 行数据，全部为 16 列；`TMP-001`~`TMP-006` 与 `SRC-0001`~`SRC-0006` 逐行一对一，与任务映射表、正式登记表一致。 |
| 2 | `SOURCE_RECORD.md` 双 ID | pass | 6 份来源各有 1 条正式 `source_id` 和 1 条 `legacy_temporary_id`，无缺失、重复或串号。 |
| 3 | 候选表来源 ID | pass | 两表 `source_id` 取值集合均严格为 `SRC-0001`~`SRC-0006`；全单元格检索无 `TMP-` 残留。 |
| 4 | 实体唯一性与关系引用 | pass | 实体 387 条，`candidate_id` 唯一数 387；关系 117 条，主体和客体均引用已存在且唯一的实体 ID，断裂数 0；主客体对无重复。 |
| 5 | OCR 内容单元与页锚 | pass | `### SRC-0001`~`### SRC-0006` 六个来源单元齐全。四个 PDF 来源各有 28 个不重复单页锚点，共 112 个。文档说明区另有一个 `<!-- page: N -->` 格式示例，不计入内容页锚。 |
| 6 | R2 规范化差分 | pass | `SOURCE_MANIFEST.csv` 去除新增 `source_id` 列后与 R2 逐行一致；实体和关系表去除 `source_id` 列后其余列逐行一致；OCR 过滤 ID 元数据行后 1660 行逐行一致；`SOURCE_RECORD.md` 过滤 ID 字段后 404 行逐行一致。直接差分只涉及允许的 ID 元数据、来源列表和节标题。 |
| 7 | 目录与公开边界 | pass | 实际为 13 个文件（12 项必需交付 + 1 个转换脚本），全部在 `MANIFEST.md` 登记；无子目录、`inputs/`、PDF、EPUB、`.DS_Store` 或整书全文文件。 |

## 附加抽核

- 实体、关系各按六个来源做分层抽样，来源覆盖 6/6；抽中记录的 locator、证据/意译字段均非空，关系两端均可解析。
- 两张候选表在去除 `source_id` 列后与 R2 基准完全相同，因此不重复对已经 R2 通过的文学内容做二次改写。

## 遗留项决定

1. `V1-S1-003-I001`：保留 `__backfill_convert.py` 作为本地可复现审计工具。该脚本包含本地绝对路径，故标记为仅本地使用，不进入公开上传批次。
2. `V1-S1-003-I002`：原 R2 任务包继续作为不可变基准本地保留；在 `V1-S1-006` 独立复核通过前不移动、不删除、不公开。
3. `V1-S1-003-I003`：保留 OCR 原始 `produced_by` 和 OCR 后端字段，以免改写原始处理溯源；本次回填链由新增 `source_ids` 行及本任务的 STATUS、QA、HANDOFF 记录，无需追加 OCR 正文元数据。

## 后续门禁

- `V1-S1-003` 可标记为 done。
- 解锁 `V1-S1-006` 独立机械复核，Reviewer 必须与 WorkBuddy 的原回填会话分离。
- `V1-S1-006` 通过前，387 个实体候选和 117 条关系候选不写入 `data/staging`，更不进入主数据库。
- 本次验收不执行 Git 提交或 GitHub 上传。
