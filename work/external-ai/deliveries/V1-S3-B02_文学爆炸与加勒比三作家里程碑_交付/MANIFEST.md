# MANIFEST：V1-S3-B02 文件清单（R1）

- 任务：V1-S3-B02；2026-08-10（R0）；R1 同日返修；本清单与实际交付目录逐文件一致（16 项），不含本地缓存或临时文件。

| # | 文件名 | 用途 | 敏感性 |
|---|---|---|---|
| 1 | README.md | 交付包说明：范围、交付物、R0/R1 历史、关键数字、边界 | 公开 |
| 2 | STATUS.md | 过程状态时间线（R0 + R1）与终态 done | 公开 |
| 3 | SOURCE_CANDIDATES.csv | 15 个来源候选（题名/机构/URL/访问/等级/覆盖；R1 修正 SRC-0006 作者） | 公开（书目级） |
| 4 | WORK_COVERAGE.csv | 九部固定作品覆盖矩阵 | 公开 |
| 5 | SOURCE_NOTES.md | 来源级材料整理与中文释义；被拦截站点记录 | 公开 |
| 6 | ENTITY_CANDIDATES.csv | 43 个实体候选（R1 落实 I-003 实体名规范） | 公开 |
| 7 | FACT_CANDIDATES.csv | 68 条原子事实候选（R1 删除 15 条无来源事实、修正 3 条、新增 1 条） | 公开 |
| 8 | RELATION_CANDIDATES.csv | 34 行关系候选（R1 删除 SET_IN 1 行） | 公开 |
| 9 | RELATION_GROUP_SUMMARY.csv | 34 组关系汇总（eligible 19/hold 15） | 公开 |
| 10 | CONTENT_CARD_DRAFTS.md | 12 张内容卡事实草稿（49 个 FACT-ID）+ 结构附注 | 公开 |
| 11 | DUPLICATE_CANDIDATES.csv | 13 条跨批次查重（existing_id 已全部展开） | 公开 |
| 12 | COVERAGE_SUMMARY.md | 覆盖汇总（R1 机械统计） | 公开 |
| 13 | QA_REPORT.md | 自检报告（R0 问题 + R1 修复历史；等待 Codex 复检） | 公开 |
| 14 | ISSUES.md | 5 项待 Codex 决策/裁决记录 + 已解决记录 | 公开 |
| 15 | HANDOFF.md | 交接三行摘要、遗留决策、公开边界、机械统计 | 公开 |
| 16 | MANIFEST.md | 本清单 | 公开 |

## 不包含

- 无 PDF/EPUB/整书 OCR/全文提取件；无 inputs/；无 Cookie、密钥或账号信息；无 `.DS_Store`；无未登记文件。
- 生成脚本（/tmp/lalm_b02/gen_b02.py）为本地构建工具，不属于交付物；如需可复现，Codex 可要求另行交付。
