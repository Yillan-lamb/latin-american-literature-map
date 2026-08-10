# MANIFEST：V1-S3-B03 文件清单（R1）

- 任务：V1-S3-B03；2026-08-10（R0）；R1 同日返修；本清单与实际交付目录逐文件一致（16 项），文件尺寸为实际字节数，不含本地缓存或临时文件。

| # | 文件名 | 尺寸（字节） | 用途 | 敏感性 |
| 1 | CONTENT_CARD_DRAFTS.md | 8166 | 8 张内容卡事实草稿（46 个 FACT-ID）+ 结构附注 | 公开 |
| 2 | COVERAGE_SUMMARY.md | 3984 | 覆盖汇总（R1 机械统计） | 公开 |
| 3 | DUPLICATE_CANDIDATES.csv | 2029 | 10 条跨批次查重（exact×7、type_conflict×3） | 公开 |
| 4 | ENTITY_CANDIDATES.csv | 10010 | 31 个实体候选 | 公开 |
| 5 | FACT_CANDIDATES.csv | 14142 | 59 条原子事实候选（R1：FCT-0037 拆分、新增 FCT-0059、FCT-0056 清理） | 公开 |
| 6 | HANDOFF.md | 3164 | 交接三行摘要、遗留项、公开边界、机械统计 | 公开 |
| 7 | ISSUES.md | 3631 | 5 项待 Codex 决策/安排 + 已解决记录 | 公开 |
| 8 | MANIFEST.md | 2198 | 本清单（含实际字节数） | 公开 |
| 9 | QA_REPORT.md | 6494 | 自检报告（R0 问题 + R1 修复历史；等待 Codex R1 复检） | 公开 |
| 10 | README.md | 4438 | 交付包说明：范围、交付物、R0/R1 历史、关键数字、边界 | 公开 |
| 11 | RELATION_CANDIDATES.csv | 7951 | 24 行关系候选（含组 ID、来源、争议状态） | 公开 |
| 12 | RELATION_GROUP_SUMMARY.csv | 3924 | 23 组关系汇总（eligible 16/hold 7） | 公开 |
| 13 | SOURCE_CANDIDATES.csv | 6154 | 12 个来源候选（R1：SRC-0002 卷期/题名修正、SRC-0008 降 C） | 公开 |
| 14 | SOURCE_NOTES.md | 11331 | 来源级材料整理与中文释义；被拦截站点记录 | 公开 |
| 15 | STATUS.md | 2944 | 过程状态时间线（R0 + R1）与终态 done | 公开 |
| 16 | WORK_COVERAGE.csv | 829 | 六部固定作品覆盖矩阵（《漫歌》A/B 数 3） | 公开 |

## 不包含

- 无 PDF/EPUB/整书或整部诗集 OCR/全文提取件；无 inputs/；无 Cookie、密钥或账号信息；无 `.DS_Store`；无未登记文件。
- 生成脚本（/tmp/lalm_b02/gen_b03.py）为本地构建工具，不属于交付物；如需可复现，Codex 可要求另行交付。
