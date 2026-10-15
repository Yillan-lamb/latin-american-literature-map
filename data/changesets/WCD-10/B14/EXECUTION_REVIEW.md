# WCD-10-B14 执行审查（TASK-119）

## 实际apply

实际执行的apply命令（照正式执行记录原样）：

```sh
python3 scripts/apply_migration.py data/master/V1_MASTER.sqlite data/master/migrations/0049_wcd10_b14_author_works.sql --task-id TASK-119 --reviewer Codex-parent-independent-SQL-review
```

工作目录：`/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/work/codex-worktrees/latin-american-literature-map-wcd10`。命令入口为`python3`，实际解析运行时为`/opt/homebrew/opt/python@3.14/bin/python3.14`（Python 3.14.5）。实际apply一次，exit code `0`；stdout SHA-256 `6fa39badfd7d46ca9deda19b456b1d25c72b23ce20ac10b924d7cc56fc81427f`，stderr SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`。原始流和exit记录：[/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/qa_logs/actual_apply.stdout](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/qa_logs/actual_apply.stdout)、[/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/qa_logs/actual_apply.stderr](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/qa_logs/actual_apply.stderr)、[/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/qa_logs/actual_apply.exit](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/qa_logs/actual_apply.exit)。形式化记录[/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/APPLY_EXECUTION.json](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/APPLY_EXECUTION.json)把它绑定到Gate `2c9e9842a89f6a6454b459ed1cb3237596e74600608c9769f1a938ca5865c6f6`、SQL `f9b2f3049c04b37a3590046614103c734df990e2bb88d0467230971ee318b95b`、map `b37121daae664084d6d822c291ab741c09306b482ab95a4a9fe824d03150e956`和基线 `c7b5951beb2e2a30053b08d84e07931547b8909a1e5a180086fafeedebaea677`。母方实际apply前后复核通过。

## Post-apply QA和全量重放

读取`run_required_qa.py`源码后，以零参数运行正式wrapper一次；外层exit code 0，16步实际记录全部成功，原始stdout/stderr和外层执行记录保存在[/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/QA_WRAPPER_EXECUTION.json](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/QA_WRAPPER_EXECUTION.json)、[/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/QA_STEPS.json](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/QA_STEPS.json)及[/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/qa_logs](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/qa_logs)。所有详细命令、运行目录、运行时、exit code、stdout/stderr与哈希聚合在[/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/INTEGRATOR_APPLY_QA.json](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/INTEGRATOR_APPLY_QA.json)。

全量49迁移重放的原始stdout SHA-256为`5e0114c4899e3ae93a465759275b1d5b5bb6142b38be84d42a70d04f40be31f1`。约定格式化日志[`B14_MIGRATION_REPLAY.log`](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/work/codex-worktrees/latin-american-literature-map-wcd10/work/wcd10-qa/B14_MIGRATION_REPLAY.log) SHA-256为`42f6e1612392d2150d111f37502f37d96ad070de934202bcce619d7eb17a50da`；它以真实argv、exit code和原始stdout/stderr生成，格式化日志哈希与原始stdout哈希分别记录。重放结果为49 migrations、19 tables相等、integrity `ok`、foreign-key errors 0。

## 仅B14执行过程例外

准备过程3次合包命令错误和2次只读post-merge审计读取器错误均有原始流和exit文件，见Integrator证据目录[`wave-11/integrator`](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/orchestration/wave-11/integrator)：第一次输入基线SHA值错误，第二次按旧接口读取source-scope字段，第三次机械规范化脚本变量遮蔽。父方首次merged-reader还因Puig输入wrapper未内嵌`source_objects`失败；之后从冻结SQLite来源闭包解析并通过，stderr保留在[/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/parent_logs/01_merged_review.stderr](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/parent_logs/01_merged_review.stderr)。这些均发生在最终准备和apply之前。最终builder exit 0、最终候选validator PASS、最终migration builder exit 0、实际apply exit 0、正式QA 16/16 PASS；没有准备、apply或QA失败。

输入边界保留：Aira R1不支持的页面打开声明/1998说法仍标`NOT_VERIFIED`，最终R3的New Directions直接作品页支持2008英文版信息作为版次注记。Ocampo原R2冻结附件没有更改；母审批准的独立合作者附件仅把SRC-0512定位改为59–60行并删除独立性措辞，保持同机构来源边界。全部unknown first-publication-year值保持空，不将版本年推断为首发年。

本次母方文档首审指出AUDIT未点名El tilo延期边界；窄修正已补全该名称，并将失败访问对象标注为“页面打开声明”，表示未能访问页面内容，不指作品正文。实际审核stderr保存在[/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/parent_logs/05_documents_precloseout_review.stderr](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/parent_logs/05_documents_precloseout_review.stderr)。本轮只修订文档，不重跑QA。
