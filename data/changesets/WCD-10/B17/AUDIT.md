# WCD-10-B17 Research 审计

- 任务：TASK-122 / DEC-070
- 日期：2026-10-14
- 范围：记录B17已通过的实际数据独立审查；本审计不代表WCD-10阶段完成或Public Release获准。
- 正式迁移：`0052_wcd10_b17_author_works.sql`
- 主库SHA-256：基线 `bf814eb0796ad27db76349a4f166ba3ca40be3df47f22373e6e094e34bdf632e`；apply后 `1bc4695f6c77cad166b5229572f73490006b9e4392379e0017f799049e5aceb0`。

## 批次增量与边界

三位作者的冻结候选按AUTHOR_FREEZE_INPUTS规定顺序整合。正式数据增量为16个对象、62项事实、16项关系、7条新来源、25张Research卡和26个研究缺口。10条来源候选中7条登记为新来源，另外3条明确复用既有canonical来源`SRC-0245`、`SRC-0246`、`SRC-0248`，原来源行未改。16项关系增量为新对象创建所带入的隐式`CREATED`关系；额外关系计数为0，不应据此描述为“无新增关系”。

coverage保留25条主作品记录，9个既有作品的来源、事实、关系和卡片引用闭包逐值保全。9条旧card joins由完整old facts中的`card_id`、`fact_id`、`admission_status`重建，并与冻结SQLite中9条既有joins逐项核对；它们是既有闭包，不是新候选关系。另保留2条`deferred_objects`记录；对应候选包中的deferred计数为1，二者口径分别记录。全部新增内容保持Research-only。候选proof IDs、builder alias与正式fact IDs之间的映射依审查记录核验，正式ID顺序不用于推导或覆盖作者proof ID。旧有hold与合理gap继续保留。

## 实际数据独立审查

母方disposable-clone SQL审查以462项检查通过（审查记录见[SQL_INDEPENDENT_REVIEW.json](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B17/SQL_INDEPENDENT_REVIEW.json)）；随后母方实际数据审查于2026-10-14给出`PASS_ACTUAL_DATA_REVIEW`，512项检查全部通过，绑定后库SHA `1bc4695f6c77cad166b5229572f73490006b9e4392379e0017f799049e5aceb0`。核验覆盖原始执行流与17项命令、SQLite完整性与外键、迁移回放、19张旧表逐值保全、新旧sources/facts/card引用、角色闭包、重复导出、公开产物和Web JSON副本。审查报告本身SHA-256：`974c95588c845992231d2e7ff1af77c51e3c24bde8a7896626ddad973a6d6d6b`。

母方报告的主要表增量：entities +16、facts +62、relationships +16、sources +7、content_cards +25、gaps +26。99条fact_sources、46条card_sources及28条relationship_sources增量覆盖本批所有来源引用，包含3条canonical复用来源的连接，不能全部归为7条新来源；另新增28条relationship_evidence与62条card_facts。全部19个既有表的旧行保留，未改变schema或metadata版本。

## 执行记录与发布状态

0052仅实际apply一次，任务/审核者记录为`TASK-122` / `Codex-parent-independent-review`。16步post-apply QA全部通过。52项迁移全量重放与19表逐表一致；JSON、CSV、XLSX各19表；22个checkpoint导出文件和重复导出逐字节一致；在`2026-10-08T00:00:00Z`固定时间构建的177个公共文件逐字节一致。公开包仍为127个公开对象和139条路由，B17新增公开对象为0。manifest.json与site_data.json两文件经校验后复制并逐字节核对。

数据库与Research数据版本保持`Research 1.5.0 development`、`Schema 0.4`；Web Data schema `v2-web-0.3`，Web产品`0.6.0 Development`。`Public Release`继续暂停。后库总量743 entities、2499 facts、715 relationships、762 sources、753 content cards、602 gaps。WCD-10-B01—B17累计新增366对象、1472 facts、381 relationships，17/21批、51/61作者；尚余4批10作者。W03版本注记与直接归属回补、B08共同对象归属、TASK-127仍是后续义务；本批结果不代表WCD-10整体阶段完成。

## 可复核记录

- 本地批次材料：[CHECKPOINT_REVIEW.json](./CHECKPOINT_REVIEW.json)、[INTEGRATION_MAP.json](./INTEGRATION_MAP.json)、[CANDIDATES.json](./CANDIDATES.json)、[COVERAGE.json](./COVERAGE.json)。
- WT正式审计产物：[VALIDATION.md](./VALIDATION.md)、[EXECUTION_REVIEW.md](./EXECUTION_REVIEW.md)。
- ROOT独立审查：[ACTUAL_DATA_INDEPENDENT_REVIEW.json](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B17/ACTUAL_DATA_INDEPENDENT_REVIEW.json)。
- ROOT执行与QA汇总：[INTEGRATOR_APPLY_QA.json](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B17/INTEGRATOR_APPLY_QA.json)、[QA_STEPS.json](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B17/QA_STEPS.json)、[APPLY_EXECUTION.json](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B17/APPLY_EXECUTION.json)。
- 完整52迁移replay的原始stdout SHA为`98f112889be2c0bf6436bfee1c7148c78d9985cbafb6dcee35e6f07960e7f2ec`；格式化replay日志SHA为`6c5fdc7dd20c899490d2c0f2ca55c37ba2c281136c51d7f3473c95b939995282`。格式化日志列明raw流路径及hash，原始正文另存于ROOT `B17/qa_logs/`，两种artifact不混同。
