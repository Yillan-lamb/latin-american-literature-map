# V1-S1-006：正式来源 ID 回填独立复核

- task_id: `V1-S1-006`
- assignment_id: `V1-S1-006-N1-QA`
- task_type: `independent_review`
- assignee: `EXT-QA`
- dependency: `V1-S1-003-N1-BACKFILL done`
- independence: Reviewer 必须不同于回填 Worker，至少不得使用原 Worker 的同一对话
- allowed_scope: 只读检查，不覆盖 Worker 交付物

## 输入

1. `project/governance/PROJECT_CHARTER.md`；
2. `work/external-ai/deliveries/V1-S1-003_正式来源ID回填_交付/`；
3. 原 R2 任务包 `N1-OCR-001_首批资料清单建档与L1OCR/`；
4. `data/catalog/SOURCE_REGISTRY.csv`；
5. `work/external-ai/V1-S1-003_正式来源ID回填/SOURCE_ID_MAP.csv`；
6. 阶段 0 规范和外部 AI 交接手册。

## 输出目录

新建：

`work/external-ai/deliveries/V1-S1-006_正式ID回填独立复核_交付/`

必须包含：`README.md`、`STATUS.md`、`REVIEW.md`、`QA_REPORT.md`、`ISSUES.md`、`HANDOFF.md`、`MANIFEST.md`。

## 检查项目

1. 对照正式登记表，全量核验 TMP→SRC 六组映射；不得存在串号或一对多。
2. 标准解析 `SOURCE_MANIFEST.csv`，确认 6 行数据、列数一致，同时保留正式 ID 和临时 ID。
3. 全量验证 387 个实体候选 ID 唯一，117 条关系两端引用存在且唯一。
4. 全量验证两张候选表 `source_id` 只使用 `SRC-0001`~`SRC-0006`。
5. ENTITY、RELATION 各抽 20 条，覆盖六个来源；对照 R2 原记录，除 `source_id` 外其他字段必须逐字一致。
6. 验证 `OCR.md` 六个来源单元和 112 个唯一单页锚点仍存在；抽查每个来源至少 2 个页段，确认只有来源标识变化，正文、顺序和 locator 未变化。
7. 执行规范化差异检查：把正式 ID 按映射还原为 TMP 后，比较 R2 与回填版本；任何正文、候选、证据、置信度或关系语义差异都属于阻断问题。
8. 核对输出包不含 `inputs/`、PDF、EPUB、`.DS_Store`、整书提取件或未登记文件。
9. 核对 Worker 的 STATUS、QA、ISSUES、HANDOFF、MANIFEST 与实际交付一致。

## 结论规则

- `pass`：映射正确，结构完整，除允许的 ID/元数据变化外无内容差异。
- `revise`：存在可定位、可修复的串号、漏填、结构或过程文档问题。
- `reject`：输出破坏原始证据、发生大范围无关改写、缺少主要成果或无法可靠追溯。

Reviewer 不得直接修改 Worker 交付物。问题必须写明文件、行号/记录 ID、问题、建议和重新验证项。

Reviewer 不得修改、移动、重命名或删除 `project/governance/PROJECT_CHARTER.md`。
