# V1-S4-A01：阶段 4 权威补证与兼容性研究包

- task_id: `V1-S4-A01`
- assignee: `EXT-AI-02`
- status: `ready`
- profile: `FULL`
- dependency: `V1-S3-B01/B02/B03 pass`

## 目标

用一个里程碑包集中处理三个相邻缺口：阶段 3 基础事实权威补核、历史事件关系证据与 `BASED_ON_EVENT` 兼容性资料、政治诗歌主题的作品级补证。任务只生成证据和候选，不修改 Schema、TASKS、正式编号或暂存数据库。

## 工作流 A：权威基础事实

汇总 B01—B03 REVIEW/ISSUES 中的缺失或待核值，优先处理人物生卒年、作品首发年、诗集分卷/版本、必要国家信息和卡努杜斯战争时间。每个值必须回到官方机构、国家图书馆、大学、出版社、DOI 论文或同等级权威页面；找不到时保留缺口，不用常识补齐。

## 工作流 B：历史事件关系兼容性

围绕《世界末日之战》与卡努杜斯战争等已登记问题，整理来源是否直接表达“以某历史事件为题材/基础/重述”。输出端点类型、来源措辞中文释义、可用现有关系词与否、拟议 `BASED_ON_EVENT` 的迁移对象和兼容性影响。不得自行新增关系词或修改 Schema 0.2。

## 工作流 C：政治诗歌主题

只检索明确指向《二十首情诗和一首绝望的歌》《大地上的居所》《漫歌》或具体单篇诗的权威研究来源。作者级“政治诗人”等总体描述不得自动下推到作品。每个解释性候选标明独立来源数量：一源为 hold，两源才建议 eligible。

## 主体交付

1. `SOURCE_CANDIDATES.csv`
2. `FACT_SUPPLEMENTS.csv`
3. `EVENT_RELATION_EVIDENCE.csv`
4. `POLITICAL_POETRY_EVIDENCE.csv`
5. `COVERAGE_SUMMARY.md`
6. `README.md`
7. `STATUS.md`
8. `QA_REPORT.md`
9. `ISSUES.md`
10. `HANDOFF.md`
11. `MANIFEST.md`

交付目录：`work/external-ai/deliveries/V1-S4-A01_阶段4权威补证与兼容性研究包_交付/`

## 门禁

- 所有 CSV 标准解析、ID 唯一、引用零悬空；统计从最终表机械重算。
- 每项事实或关系证据至少定位到书名、论文名或网页标题与 URL；页码可选。
- 不把搜索摘要、AI 摘要、普通百科或受阻页面当作唯一证据。
- 不上传 PDF、论文全文、书籍、OCR、inputs、Cookie、密钥或 local_only 内容。
- 不修改既有交付、章程、TASKS、决策记录、Schema、data/staging、Git 或 GitHub。
- 完成共享 `FULL` 检查，QA 只写自检结果，不自行宣布 Codex `pass`。
