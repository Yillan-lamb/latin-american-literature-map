# V1-S1-007A：首批资料覆盖矩阵初稿

- task_id: `V1-S1-007-A`
- parent_task: `V1-S1-007`
- assignment_id: `V1-S1-007-A-COVERAGE-DRAFT`
- task_type: `catalog / structured_summary`
- assignee: `WorkBuddy`
- dependencies: `V1-S1-003 done` 且 `V1-S1-006 done`
- source_ids: `SRC-0001`~`SRC-0006`
- allowed_scope: 仅对已验收的首批六份来源做结构化覆盖统计与缺口标注。

## 任务目标

为 Codex 完成阶段 1 汇总提供一个可机读、可复核的首批资料覆盖矩阵。你只能对现有已验收的书目字段、目录结构、候选表的计数和位置类型进行汇总；不做新的文学研究、新关系抽取或网络检索。

## 必读文件

1. 仓库根目录 `project/governance/PROJECT_CHARTER.md`；
2. `project/archive/阶段0_研究与数据规范.md`；
3. `project/ai/外部AI任务分工与交接手册.md`；
4. 本任务卡 `README.md`；
5. `data/catalog/SOURCE_REGISTRY.csv`；
6. `work/external-ai/deliveries/V1-S1-003_正式来源ID回填_交付/SOURCE_MANIFEST.csv`、`SOURCE_RECORD.md`、`ENTITY_CANDIDATES.csv`、`RELATION_CANDIDATES.csv`。

## 输出目录

新建：

`work/external-ai/deliveries/V1-S1-007A_首批资料覆盖矩阵初稿_交付/`

不得覆盖任何既有任务包。不得复制 `inputs/`、PDF、EPUB、`OCR.md` 正文或整书提取件。

## 必须交付

1. `README.md`、`STATUS.md`、`QA_REPORT.md`、`ISSUES.md`、`HANDOFF.md`、`MANIFEST.md`；
2. `COVERAGE_MATRIX.csv`：恰好 6 行，每行对应一个 `SRC-0001`~`SRC-0006`；
3. `COVERAGE_SUMMARY.md`：不超过 1,200 个中文字，仅总结计数、来源类型、已知限制与后续缺口；
4. `GAP_REGISTER.csv`：缺口每行必须区分“从现有资料不足得出”与“已经证明不存在”；不得把前者写成后者。

## COVERAGE_MATRIX.csv 固定列

```text
source_id,title,format,publication_year,source_level,languages,entity_candidate_count,relation_candidate_count,recorded_locator_types,source_form,known_scope_from_record,known_limitations,proposed_phase2_use,verification_basis
```

填写规则：

- `entity_candidate_count` 和 `relation_candidate_count` 只能从两张候选表按 `source_id` 计数。必须分别得到：

| source_id | 实体候选 | 关系候选 |
|---|---:|---:|
| SRC-0001 | 101 | 22 |
| SRC-0002 | 90 | 40 |
| SRC-0003 | 37 | 11 |
| SRC-0004 | 91 | 16 |
| SRC-0005 | 34 | 8 |
| SRC-0006 | 34 | 20 |

- `recorded_locator_types`、`known_scope_from_record`、`known_limitations` 只能来自 `SOURCE_RECORD.md` 或合法的统计；不得用模型常识补写。
- `source_form` 仅可用：`research_collection` 、`course_reader` 、`introductory_history` 、`contemporary_novel_study` 、`general_audience_introduction` 、`intellectual_history` 、`other`。
- `proposed_phase2_use` 仅可写“候选用途”，不构成立即纳入、立即研究或主数据判定。
- 不得复制 `evidence_or_paraphrase` 的原文或产生大段书籍摘录。

## GAP_REGISTER.csv 固定列

```text
gap_id,gap_dimension,statement,classification,affected_source_ids,basis,priority,proposed_follow_up,notes
```

- `classification` 只可为 `not_covered_by_current_package` 或 `confirmed_absence` 。
- 没有直接证据时，一律使用 `not_covered_by_current_package`。
- 不得新建实体、关系、主题事实或正式 ID。

## 必须验证

1. 清单为 6 行、列数一致、来源 ID 不重不漏；
2. 每个来源的两个候选数量与上表一致，总计为 387 个实体候选和 117 条关系候选；
3. 抽样 6 行的 `title`、`format`、`publication_year`、`source_level` 与 `SOURCE_REGISTRY.csv` 一致；
4. 抽样每个来源的一项 `known_scope_from_record` 或 `known_limitations` 可回指 `SOURCE_RECORD.md` 的章节或字段；
5. 全文检查交付目录不含 PDF、EPUB、`inputs/`、`.DS_Store`、`OCR.md` 或书籍全文；
6. 确认没有修改输入任务包、`project/tasks/TASKS.md`、主数据、决策记录、CHANGELOG 或 GitHub。

## 禁止事项

- 不做网络检索、不添加网络来源、不评价文学史实。
- 不修改、移动或重命名 `project/governance/PROJECT_CHARTER.md`；不更改任何原始输入或既有交付。
- 不将候选写入 `data/staging` 或主数据库；不分配新的 `SRC-`、实体或关系 ID。
- 不执行 Git 提交或 GitHub 上传。

## 过程要求

- 开始、约 50%、结束时更新 `STATUS.md`；
- 无法确认的字段、缺口分类或计数差异必须写入 `ISSUES.md`；
- 完成后编写 `QA_REPORT.md`、`HANDOFF.md`、`MANIFEST.md`，终态只可为 `done`、`blocked` 或 `failed`。
