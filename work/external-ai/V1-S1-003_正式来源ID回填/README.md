# V1-S1-003：首批六份来源正式 ID 回填

- task_id: `V1-S1-003`
- assignment_id: `V1-S1-003-N1-BACKFILL`
- task_type: `catalog / metadata migration`
- assignee: `EXT-CATALOG`（建议 WorkBuddy 或其他擅长表格与 Markdown 的外部 AI）
- dependency: `V1-S1-002 done`
- input_task: `N1-OCR-001 R2 pass`
- source_ids: `SRC-0001`~`SRC-0006`
- allowed_scope: 仅回填正式来源 ID 和同步过程文档

## 输入

1. 项目根目录 `project/governance/PROJECT_CHARTER.md`；
2. 项目根目录 `N1-OCR-001_首批资料清单建档与L1OCR/`；
3. 项目根目录 `data/catalog/SOURCE_REGISTRY.csv`；
4. 本目录 `SOURCE_ID_MAP.csv`；
5. `project/archive/阶段0_研究与数据规范.md`；
6. `project/ai/外部AI任务分工与交接手册.md`；
7. `templates/external-ai/`。

## 目标

在不改变已经通过验收的 OCR 正文、候选内容和证据定位的前提下，把 `TMP-001`~`TMP-006` 对应的正式来源 ID 回填到派生交付包中。

## 输出目录

新建独立目录：

`work/external-ai/deliveries/V1-S1-003_正式来源ID回填_交付/`

不得覆盖或改写原始 `N1-OCR-001` R2 任务包；不得复制 `inputs/`。

## 必须交付

- `README.md`
- `STATUS.md`
- `HANDOFF.md`
- `QA_REPORT.md`
- `ISSUES.md`
- `MANIFEST.md`
- `SOURCE_ID_MAP.csv`
- `SOURCE_MANIFEST.csv`
- `SOURCE_RECORD.md`
- `OCR.md`
- `ENTITY_CANDIDATES.csv`
- `RELATION_CANDIDATES.csv`

## 允许修改

1. `SOURCE_MANIFEST.csv`：新增正式 `source_id` 列，同时保留 `temporary_file_id`；六条映射必须与 `SOURCE_ID_MAP.csv` 一致。
2. `SOURCE_RECORD.md`：每份记录的 `source_id` 改为正式 ID，并保留 `legacy_temporary_id`。
3. `OCR.md`：只允许修改来源元数据和来源节标题中的 ID；单页锚点及 OCR 正文不得变化。
4. `ENTITY_CANDIDATES.csv`、`RELATION_CANDIDATES.csv`：只替换 `source_id` 列中的 TMP 值；候选 ID、关系类型、locator、证据、置信度、争议状态和备注不得变化。
5. 过程文档：更新任务 ID、正式来源 ID、文件数量、验证结果和交接说明。

## 禁止修改

- 不修改、移动、重命名或删除 `project/governance/PROJECT_CHARTER.md`；
- 不修改、删除或补写 OCR 正文；
- 不改变 112 个页码锚点；
- 不改变 387 个实体候选或 117 条关系候选的内容、数量和候选 ID；
- 不改变 locator、证据、置信度、关系类型或争议状态；
- 不分配正式实体 ID；
- 不把任何候选写入 `data/staging`；
- 不修改原 R2 任务包、`project/tasks/TASKS.md`、决策记录、主数据库或 GitHub；
- 不复制或公开上传原始 PDF、EPUB、`inputs/`、完整提取件或整书 OCR。

## 必须验证

1. `SOURCE_MANIFEST.csv` 标准解析为 6 行数据，每行列数一致；正式 ID 与临时 ID 一一对应。
2. `SOURCE_RECORD.md` 六份来源均同时保留正式 ID 和临时 ID。
3. 两张候选表的 `source_id` 只出现 `SRC-0001`~`SRC-0006`，不出现 TMP 值。
4. 实体仍为 387 条且 ID 全部唯一；关系仍为 117 条且引用断裂为 0。
5. OCR 仍有 TMP 对应的六个来源内容单元、112 个唯一单页锚点；来源标识改为正式 ID 后，正文和锚点不变。
6. 对修改前后文件做“把 SRC 映射还原为 TMP 后”的规范化比较；除允许的元数据字段、标题 ID 和过程文档外，不得出现差异。
7. 输出目录不含 `inputs/`、PDF、EPUB、`.DS_Store`、整书全文或未列入 MANIFEST 的文件。

## 过程要求

- 开始、约 50% 和结束时更新 `STATUS.md`；
- 自检结果写入 `QA_REPORT.md`，不得只写“已完成”；
- 无法判断的问题写入 `ISSUES.md`，不得自行扩大范围；
- 最终填写 `HANDOFF.md` 与 `MANIFEST.md`；
- 终态只能为 `done`、`blocked` 或 `failed`。
