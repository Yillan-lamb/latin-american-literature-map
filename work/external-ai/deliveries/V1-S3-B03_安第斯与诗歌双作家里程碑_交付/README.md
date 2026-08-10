# V1-S3-B03 交付包说明（README，R1）

- task_id: `V1-S3-B03`
- 交付目录：`work/external-ai/deliveries/V1-S3-B03_安第斯与诗歌双作家里程碑_交付/`
- 执行方：EXT-AI-02（ZCode / deepseek-v4-flash，版本 unknown）
- 交付日期：2026-08-10（R0）；2026-08-10（R1 窄范围返修）
- package_profile: `FULL`；依赖：`V1-S3-B02 R1 Codex gate pass`（B02 R1 REVIEW 已 pass 并解锁本任务）

## 返修历史

- R0（2026-08-10）：首版交付，Codex 审计结论 `revise`（`work/external-ai/reviews/V1-S3-B03_PM_REVIEW.md`）。
- R1（2026-08-10）：按 REVIEW §3 五项修复：①B03-SRC-0002 完整题名（含 `(1967) de García Márquez`）与卷期（`Vol. 2 Núm. 3 (2014)`，官方页发布日期 2015-01-14）按官方页统一；②B03-SRC-0008 降为 C 级/`other`（官方栏目 Reseña 书评），全包等级 A×7/B×4/C×1、《漫歌》A/B 数 4→3；③FCT-0037 拆分（仅留 CVC 部分），新增 FCT-0059 由 B03-SRC-0010 单源支持，FCT-0056 删除未核验的 Antônio Conselheiro 同一性；④MANIFEST 逐项登记实际字节数；⑤机械重算同步全部过程文档（QA 保留 R0 问题与 R1 修复记录）。保持不变：两作家、六作品、31 实体、23 组、7 hold、RG-B03-0023 双源 eligible、10 条查重。

## 范围

一次完成马里奥·巴尔加斯·略萨、巴勃罗·聂鲁达两位作家的来源发现与合法访问核验、来源笔记、候选实体/事实/关系抽取、8 张内容卡事实草稿、跨批次查重与覆盖统计。本包只生成 `B03-` 候选 ID，不分配正式 `SRC/STG/ENT/REL` 编号；不修改治理文件、既有任务包、`data/staging/`、Git 或 GitHub。

## 交付物（16 项）

1. `README.md` 本说明
2. `STATUS.md` 过程状态
3. `SOURCE_CANDIDATES.csv`（12×11）
4. `WORK_COVERAGE.csv`（6×7）
5. `SOURCE_NOTES.md` 来源级材料整理
6. `ENTITY_CANDIDATES.csv`（31×15）
7. `FACT_CANDIDATES.csv`（59×11）
8. `RELATION_CANDIDATES.csv`（24×16）
9. `RELATION_GROUP_SUMMARY.csv`（23×10）
10. `CONTENT_CARD_DRAFTS.md` 8 张卡事实草稿
11. `DUPLICATE_CANDIDATES.csv`（10×9）
12. `COVERAGE_SUMMARY.md` 覆盖汇总
13. `QA_REPORT.md` 自检报告（等待 Codex R1 复检，不自行写 pass）
14. `ISSUES.md` 问题与待 Codex 决策项
15. `HANDOFF.md` 交接摘要
16. `MANIFEST.md` 文件清单（含实际字节数）

## 关键数字（R1，从最终 CSV 机械重算）

- 来源 12：A×7、B×4、C×1；每作家 6 个；每作家 ≥3 个 A/B 级；六部作品每部 ≥1 个 A/B 级。
- 实体 31：author×2、work×4（含单篇诗 1）、collection×3、place×7、movement×3、theme×6、event×2、character×1、person×2、institution×1。
- 事实 59（high×53、medium×6）；关系 24 行/23 组：eligible×16、hold_needs_second_source×7（7 个 hold 全部为单来源解释性关系）。
- 内容卡 8 张（2 作家 + 3 小说 + 3 诗集），清单共 46 个不重复 FACT-ID；查重 10 条（exact×7、type_conflict×3）。

## 本包亮点与边界

- 略萨逝世信息（2025-04-13，利马）由诺贝尔奖官网 Facts 页直接核验；聂鲁达生卒（1904-1973）由 Nobel + CVC 双来源。
- 六部固定作品每部至少 1 个 A/B 级直接来源（UCM、Pitt、UGR、Sevilla、UdeC、Persée 论文 + Nobel/CVC 机构页）。
- 三部诗集全部为 `collection`；单篇诗《马丘比丘高地》为独立 `work`，与诗集分层，CONTAINS_WORK 因无权威目录直接支持未建。
- 《世界末日之战》与卡努杜斯战争：关系词表无“基于事件”词，未发明关系词、未用 SET_IN 代替，仅以事实与 ISSUES 记录（任务卡 §5.2、REVIEW I-003）。
- 文学爆炸（Catedral Tomada 论文明确）、现代主义/先锋派（CVC 明确）均有来源判断；“超现实主义”无来源，未建。
- 《漫歌》大陆命运/美洲史诗主题为双来源解释性关系（Nobel + CVC，RG-B03-0023，eligible），展示双源机制。
- 被拦截/不可达站点（秘鲁本地机构、SciELO、laRepública）如实记录，未绕过限制（ISSUES I-004）。

## 生成与验证

- 七张主体 CSV 由可复现脚本 `/tmp/lalm_b02/gen_b03.py` 生成（脚本不在交付目录；统计与断言在生成时输出，全部通过）。
- 共享 FULL 验证与目录安全终检见 `QA_REPORT.md`（R1 复跑 `pass`，errors/warnings 均为空）。
