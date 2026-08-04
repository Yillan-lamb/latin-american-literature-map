# V1-S1-007-A 项目经理验收记录

- task_id: `V1-S1-007-A`
- assignment_id: `V1-S1-007-A-COVERAGE-DRAFT`
- reviewer: `CODEX-PM`
- reviewed_at: `2026-08-04`
- verdict: `revise`

## 结论

机械数据和目录安全检查全部通过，但公开摘要和缺口表包含一处明确计数误述、两处缺少结构化字段支撑的覆盖判断，并且 SRC-0004 章题遗留项已经 Codex 目视核对解决。任务可精确返修，无需重做矩阵或重新统计。

## 已通过范围

- `COVERAGE_MATRIX.csv` 标准解析为 6 行数据、14 列，`SRC-0001`~`SRC-0006` 不重不漏。
- 实体候选计数为 101/90/37/91/34/34，合计 387；关系候选计数为 22/40/11/16/8/20，合计 117。
- 六行 `title`、`format`、`publication_year`、`source_level` 与 `SOURCE_REGISTRY.csv` 全部一致。
- 六行 `known_scope_from_record` 和 `known_limitations` 均可回指 `SOURCE_RECORD.md` 对应 §1—6。
- `GAP_REGISTER.csv` 为 7 行、9 列，7 条均为 `not_covered_by_current_package`，无 `confirmed_absence`。
- 交付目录恰好 9 个文件，无 PDF、EPUB、`inputs/`、`.DS_Store`、`OCR.md`、全文提取件或未登记文件。
- 未发现 Worker 修改输入包、项目治理文件或 GitHub 的证据。
- `COVERAGE_SUMMARY.md` 全文中文字符数为 646，未超过 1,200 上限。

## 必须修复

1. `COVERAGE_SUMMARY.md:6`：文件自述“约 900 中文字”，实际全文中文字符为 646，与 HANDOFF、QA、MANIFEST 不一致。改为“646 中文字符”或删除文件内的静态字数说明。
2. `COVERAGE_SUMMARY.md:16`：“实体 101/关系 22 为六源之最”错误。只有实体 101 为最高；关系最高是 SRC-0002 的 40。改为“实体 101 为六源最高，关系 22”。
3. `GAP_REGISTER.csv:4`（G03）：三位核心作家的中西文名称在 387 条实体候选全字段检索中均为 0，这是全包缺口；`affected_source_ids` 不应只写 SRC-0004/0005/0006。改为全部六源，并将 basis 改为“ENTITY_CANDIDATES 候选名称/原名/别名全量检索”，不要写成仅“按 source_id 分布”。
4. `GAP_REGISTER.csv:5`（G04）：候选表没有性别字段，`entity_type` 分布不能证明“女性作家条目主要来自 SRC-0001/0004”。删除该来源分布断言，改为“现有候选结构没有性别字段，无法机械核验是否达到至少 3 位女性作家基线，待 Codex 实体审核”，`affected_source_ids` 改为全部或不适用。
5. `GAP_REGISTER.csv:8` 和 `COVERAGE_SUMMARY.md:31`（G07）：每条关系候选只有一个 `source_id`，但实体尚未消歧/合并，不能据此证明“多为单一来源支持”。改为：“关系候选行当前只保存单一 `source_id`；是否存在语义等价的第二来源，须在实体消歧和关系去重后审核。”
6. `COVERAGE_MATRIX.csv:5`、`GAP_REGISTER.csv:7`、`ISSUES.md` I004 及相关 HANDOFF：Codex 已目视核对 SRC-0004 原 PDF 目录，确认第六章题为“卓有建树的女作家”，起页 293（PDF 物理页 16，印刷目录页 3）。在矩阵中用准确章题替换“第六章女性作家”概述，删除“章题未见明确行”限制；G06 中移除 SRC-0004 该项；I004 改为 resolved。不修改输入 `SOURCE_RECORD.md`。
7. `MANIFEST.md:23`、`QA_REPORT.md:16`：实际为 3 项主体成果 + 6 个过程文档 = 9 个文件，不是“4 + 6”。修正计数并同步 STATUS、HANDOFF、QA、ISSUES、MANIFEST 中的结论和数字。

## 保持不变

- 六行矩阵的来源 ID、书名、格式、年份、来源等级、候选计数和 source_form；
- 387/117 总计和按来源计数；
- G01、G02、G05 的实质结论；
- 7 条缺口均保持 `not_covered_by_current_package`，不新增 `confirmed_absence`；
- 公开边界和不含原文摘录的范围。

## 禁止新增

- 不新做 OCR、文学研究、网络检索、新候选或数据库写入；
- 不修改输入任务包、`SOURCE_RECORD.md`、`TASKS.md`、`PROJECT_CHARTER.md`、决策记录、CHANGELOG 或 GitHub；
- 不复制 PDF、EPUB、OCR 正文或 `inputs/`。

## R1 重新验证

1. 重跑矩阵 6×14、ID、书目字段和 387/117 计数；
2. 检查摘要内部不再存在“22 为最高”矛盾；
3. 检查 G03/G04/G07 的 basis 与字段能力一致，不将无法机械证明的事项写成事实；
4. 检查 SRC-0004 矩阵行已使用“卓有建树的女作家”与起页 293，I004 为 resolved；
5. 检查交付总数为 9，过程文档数字一致；
6. 重新检查无禁止文件或输入修改。

返修后更新：`STATUS.md`、`QA_REPORT.md`、`ISSUES.md`、`HANDOFF.md`、`MANIFEST.md`、`COVERAGE_MATRIX.csv`、`COVERAGE_SUMMARY.md`、`GAP_REGISTER.csv`。
