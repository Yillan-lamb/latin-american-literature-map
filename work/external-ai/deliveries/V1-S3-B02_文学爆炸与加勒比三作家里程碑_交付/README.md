# V1-S3-B02 交付包说明（README，R1）

- task_id: `V1-S3-B02`
- 交付目录：`work/external-ai/deliveries/V1-S3-B02_文学爆炸与加勒比三作家里程碑_交付/`
- 执行方：EXT-AI-02（ZCode / deepseek-v4-flash，版本 unknown）
- 交付日期：2026-08-10（R0）；2026-08-10（R1 窄范围返修）
- package_profile: `FULL`；依赖：`V1-S3-B01 Codex gate pass`（B01 REVIEW 已 pass 并解锁本任务）

## 返修历史

- R0（2026-08-10）：首版交付，Codex 审计结论 `revise`（`work/external-ai/reviews/V1-S3-B02_PM_REVIEW.md`）。
- R1（2026-08-10）：按 REVIEW §3 六项修复：①B02-SRC-0006 作者统一为 Jérôme Dulou；②FCT-0014/0025/0049 原子事实边界修正（拆分/删超源表述）；③删除 15 条无直接来源的基础事实（13 条 low 生卒年/首发年 + 科塔萨尔国籍 + 马孔多场景），ISSUES 保留缺口；④RG-B02-0016（SET_IN 百年孤独→马孔多）未取得直接来源，成对删除；⑤查重 13 行 existing_id 全部展开为完整 ID；⑥机械重算同步全部过程文档。保持不变：三位作家、九部作品、43 实体分层、15 个解释性关系 hold、D 级来源不支撑事实/关系的边界。

## 范围

一次完成加西亚·马尔克斯、胡利奥·科塔萨尔、阿莱霍·卡彭铁尔三位作家的来源发现与合法访问核验、来源笔记、候选实体/事实/关系抽取、12 张内容卡事实草稿、跨批次查重与覆盖统计。本包只生成 `B02-` 候选 ID，不分配正式 `SRC/STG/ENT/REL` 编号；不修改治理文件、既有任务包、`data/staging/`、Git 或 GitHub。

## 交付物（16 项）

1. `README.md` 本说明
2. `STATUS.md` 过程状态
3. `SOURCE_CANDIDATES.csv`（15×11）
4. `WORK_COVERAGE.csv`（9×7）
5. `SOURCE_NOTES.md` 来源级材料整理
6. `ENTITY_CANDIDATES.csv`（43×15）
7. `FACT_CANDIDATES.csv`（68×11）
8. `RELATION_CANDIDATES.csv`（34×16）
9. `RELATION_GROUP_SUMMARY.csv`（34×10）
10. `CONTENT_CARD_DRAFTS.md` 12 张卡事实草稿
11. `DUPLICATE_CANDIDATES.csv`（13×9）
12. `COVERAGE_SUMMARY.md` 覆盖汇总
13. `QA_REPORT.md` 自检报告（等待 Codex 复检，不自行写 pass）
14. `ISSUES.md` 问题与待 Codex 决策项
15. `HANDOFF.md` 交接摘要
16. `MANIFEST.md` 文件清单

## 关键数字（R1，从最终 CSV 机械重算）

- 来源 15：A×10、B×2、D×3；每作家 5 个；每作家 ≥3 个 A/B 级；九部作品每部 ≥1 个 A/B 级。
- 实体 43：author×3、work×9、collection×2、adaptation×2、person×2、character×5、place×5、movement×3、theme×10、event×1、institution×1。
- 事实 68（high×64、medium×4）；关系 34 行/34 组：eligible×19、hold_needs_second_source×15（15 个 hold 全部为单来源解释性关系）。
- 内容卡 12 张（3 作家 + 9 作品/作品集），清单共 49 个不重复 FACT-ID；查重 13 条（exact×12、type_conflict×1，ID 已展开）。

## 本包亮点与边界

- 九部固定作品每部均有 1 篇 A 级同行评审论文专论（Javeriana、UCA-Managua、U. Concepción×2、UNLP、UFF、UNLPam、UB、UCM、UNMSM）。
- Schema 0.2 分层示例：短篇/作品集/改编/导演/人物分层（Anclajes 论文支撑的《另一个天空》→《水晶天空》→妮娜·格罗塞链条；按 REVIEW I-002 保留为原始补充候选）。
- “文学爆炸”因无来源明确判断未建实体关系（REVIEW I-005 本轮不补）；“美洲神奇现实”与“魔幻现实主义”按任务卡 §5.3、REVIEW I-003 分开建模（查重表 type_conflict 提醒）。
- 古巴本地机构网络不可达，卡彭铁尔 B 级机构页缺口如实登记于 ISSUES（REVIEW I-004 已接受替代方案）。
- 基础事实（生卒年/首发年/国籍）无直接来源，R1 已删除并登记缺口（REVIEW I-001），未以常识值挂靠来源。

## 生成与验证

- 七张主体 CSV 由可复现脚本 `/tmp/lalm_b02/gen_b02.py` 生成（脚本不在交付目录；统计与断言在生成时输出，全部通过）。
- 共享 FULL 验证与目录安全终检见 `QA_REPORT.md`（R1 复跑 `pass`，errors/warnings 均为空）。
