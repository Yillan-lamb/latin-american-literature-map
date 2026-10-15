# WCD-10-B17 验证记录

- 任务：TASK-122 / DEC-070；日期：2026-10-14
- 结果：本次授权范围内的实际apply、16步post-apply QA与母级真实数据独立审查通过。
- SQL disposable-clone review：462项检查通过；actual-data independent review：`PASS_ACTUAL_DATA_REVIEW`，512/512检查通过，报告SHA-256 `974c95588c845992231d2e7ff1af77c51e3c24bde8a7896626ddad973a6d6d6b`。
- 实际数据库：冻结基线`bf814eb0796ad27db76349a4f166ba3ca40be3df47f22373e6e094e34bdf632e`曾在此前的冻结基线与SQL-clone审查中独立校验；0052 apply后数据库为`1bc4695f6c77cad166b5229572f73490006b9e4392379e0017f799049e5aceb0`。QA wrapper运行于apply之后，校验post-apply主库和最终主库，不负责冻结基线校验。

## 批次行数与状态

| 内容 | 本批增量 | 后库总量 |
| --- | ---: | ---: |
| entities | 16 | 743 |
| facts | 62 | 2499 |
| relationships | 16 | 715 |
| sources | 7 | 762 |
| content_cards | 25 | 753 |
| gaps | 26 | 602 |
| migration_log | 1 | 52 |

另外新增99条fact_sources、62条card_facts、46条card_sources及28条relationship_sources与28条relationship_evidence。99/46/28的来源连接覆盖本批全体来源，包含SRC-0245、SRC-0246、SRC-0248三条复用来源，不仅是7条新来源；三条旧source行未改。16条关系增量是对象创建带入的隐式CREATED关系；额外关系计数0。9个旧作品及其关系、来源、事实和卡片引用闭包逐值保全；coverage主作品记录25条，deferred_objects 2条（候选deferred为1）。

## Apply 与 post-apply QA

0052以批准的绝对WT数据库路径实际apply一次，exit 0；migration_log记录TASK-122及审核者`Codex-parent-independent-review`。QA wrapper源文件完整阅读后仅以零参数调用一次，exit 0；16/16必要步骤通过：

1. B17_BEFORE_PUBLIC与B16_AFTER_PUBLIC快照对比：177个deploy bundle文件及2个Web JSON均同名、逐字节一致。
2. apply后、checkpoint导出前的主库校验以及wrapper最后的主库校验，SQLite integrity `ok`、外键错误0；冻结基线已在先前的独立基线/SQL-clone审查中校验。
3. checkpoint导出22文件；独立重复导出22文件，名称及全部字节一致。
4. 固定`2026-10-08T00:00:00Z`构建Web Data和deploy bundle；生成数据、公共包及内容质量校验通过。
5. reviewed checkpoint QA通过；发布载荷177个文件逐字节一致。
6. 校验后的manifest.json与site_data.json复制到`data/v2/web/`后再次验证通过，两文件副本与源SHA完全相同。
7. `full_52_migration_replay`通过：52项迁移重放、19张表完全相等、integrity `ok`、foreign-key errors 0；最终主库校验通过。

版本与边界：Research `1.5.0 development`、Schema `0.4`、Web Data `v2-web-0.3`、Web `0.6.0 Development`保持不变；新B17对象公开0，公开总量127对象/139路由，Public Release仍暂停。

## 证据文件及哈希

- QA汇总：[INTEGRATOR_APPLY_QA.json](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B17/INTEGRATOR_APPLY_QA.json)，SHA-256 `249a8ee08a162573193d04e5afc81967b9f90849859a803fc65a114813d42fa0`。
- 16步原始记录：[QA_STEPS.json](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B17/QA_STEPS.json)，SHA-256 `3da7dbca3996fc5234f28a3353a93b28450fc578cfbca5b9a3c352435980aea5`。
- Checkpoint QA：`work/wcd10-qa/B17_CHECKPOINT_QA.json`，SHA-256 `628e0b002073005aa995f90933cfbbb3fbbc3696d0a322ccd410907fc4b250ef`。
- Full replay raw stdout SHA-256：`98f112889be2c0bf6436bfee1c7148c78d9985cbafb6dcee35e6f07960e7f2ec`；格式化replay日志SHA-256：`6c5fdc7dd20c899490d2c0f2ca55c37ba2c281136c51d7f3473c95b939995282`。格式化日志仅汇总命令、exit、raw路径/hash；完整原始stdout/stderr分开保存。
- apply原始执行记录：[APPLY_EXECUTION.json](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B17/APPLY_EXECUTION.json)。母实际审查的独立结论见[ACTUAL_DATA_INDEPENDENT_REVIEW.json](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B17/ACTUAL_DATA_INDEPENDENT_REVIEW.json)。
