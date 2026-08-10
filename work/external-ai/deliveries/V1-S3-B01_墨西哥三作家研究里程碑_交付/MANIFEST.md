# MANIFEST：交付文件清单与敏感性

- task_id: `V1-S3-B01`
- 交付目录：`work/external-ai/deliveries/V1-S3-B01_墨西哥三作家研究里程碑_交付/`
- 文件数：**恰 16 个**（与任务卡登记一致；无子目录、无隐藏文件、无未登记文件；尺寸为字节）

| # | 文件名 | 尺寸 | 用途 | 敏感性 |
|---|---|---|---|---|
| 1 | README.md | — | 任务身份、执行方登记、机械结果摘要、安全边界 | 可公开 |
| 2 | STATUS.md | — | 时间线与终态 done | 可公开 |
| 3 | SOURCE_CANDIDATES.csv | 4454 | 15 个来源候选（11 列） | 可公开（URL/题录/访问记录） |
| 4 | WORK_COVERAGE.csv | 963 | 九部作品覆盖矩阵（7 列） | 可公开 |
| 5 | SOURCE_NOTES.md | 11795 | 15 来源笔记与中文释义 | 可公开（释义无长摘录） |
| 6 | ENTITY_CANDIDATES.csv | 11727 | 44 条实体候选（15 列，B01-ENT） | 可公开 |
| 7 | FACT_CANDIDATES.csv | 15111 | 81 条原子事实候选（11 列，B01-FCT） | 可公开 |
| 8 | RELATION_CANDIDATES.csv | 8770 | 31 行关系候选（16 列，B01-REL） | 可公开 |
| 9 | RELATION_GROUP_SUMMARY.csv | 5518 | 31 组折叠汇总（10 列） | 可公开 |
| 10 | CONTENT_CARD_DRAFTS.md | 6724 | 12 张事实卡草稿（3 作家 + 9 作品） | 可公开（草稿素材） |
| 11 | DUPLICATE_CANDIDATES.csv | 1580 | 9 条查重候选（8 列） | 可公开 |
| 12 | COVERAGE_SUMMARY.md | 2695 | 覆盖汇总（机械统计） | 可公开 |
| 13 | QA_REPORT.md | — | 12 项自检、§8 断言、抽样记录 | 可公开 |
| 14 | ISSUES.md | — | 5 项待决策 + 说明项 | 可公开 |
| 15 | HANDOFF.md | — | 机械统计与五行摘要 | 可公开 |
| 16 | MANIFEST.md | — | 本文件 | 可公开 |

## 未交付（按要求保留在交付包外）

- 原 PDF/EPUB、整书 OCR、论文全文、长摘录：未复制入包。
- 正式 SRC/STG/ENT/REL ID、`data/staging/` 写入、主数据库产物：本任务不产生。
- Cookie、密钥、账号、`.DS_Store`、inputs：无。

## 敏感性与 Git/GitHub

- 本包仅含书目层、释义与结构化候选，无受限内容；按章程 DEC-015，是否提交 GitHub 由用户明确通知后由 Codex 批量执行，本执行方未执行任何 Git 操作。
