# WCD-10-B17 执行审查记录

- 任务/决策：TASK-122 / DEC-070
- 范围：记录本批实际apply及独立审查；本批结果不代表WCD-10整体阶段完成。
- WT分支：`codex/wcd-10-author-deepening`（既有受控工作分支）
- 实际apply：`0052_wcd10_b17_author_works.sql`，仅一次，exit 0。
- Actual-data independent review：512项检查全部通过；报告SHA-256 `974c95588c845992231d2e7ff1af77c51e3c24bde8a7896626ddad973a6d6d6b`。

## 执行结果

主库从基线SHA `bf814eb0796ad27db76349a4f166ba3ca40be3df47f22373e6e094e34bdf632e`变为`1bc4695f6c77cad166b5229572f73490006b9e4392379e0017f799049e5aceb0`。SQLite integrity check为`ok`、外键错误0；migration_log新增0052并绑定TASK-122、审核者`Codex-parent-independent-review`与批准SQL SHA。

QA wrapper `project/internal/WCD_10_WORKSPACE/B17/run_required_qa.py`完整阅读后仅作零参数调用一次，16步全部通过。Full52 replay PASS，19/19表相同；JSON/CSV/XLSX各19表；22项重复导出一致；177个公共文件逐字节不变，新B17对象公开0；两个Web JSON校验并精确复制。独立实际数据审核同时确认17项命令及原流绑定、来源/事实/卡片引用与角色闭包、19张旧表所有旧行保全及clone/replay一致。

## 本批读取与复核过程

本批父方三次内容/审查读取修正包括：preview记录需混合分类；旧card joins从完整old facts的`card_id`、`fact_id`、`admission_status`重建，并与冻结库9条既有joins核对，这些属于旧数据闭包而不是新增候选关系；出版社版本提示不能当作source网页显示日期。相关候选保持冻结，只有经授权的最小接口读取/closure适配，没有为满足审计接口改变文学事实、来源内容或作品值。随后母级真实数据审查通过。

另有一次actual接口读取适配：B17 compact report绑定原始流路径而非内嵌原始正文，apply记录以byte counts/hash表示流；母方据原始stdout/stderr和17命令记录复核并PASS。格式化replay日志记录raw流位置及hash，原始流独立留存；不要把formatted artifact当成raw stdout。Full52 replay raw stdout SHA `98f112889be2c0bf6436bfee1c7148c78d9985cbafb6dcee35e6f07960e7f2ec`，formatted replay artifact SHA `6c5fdc7dd20c899490d2c0f2ca55c37ba2c281136c51d7f3473c95b939995282`。

prepare实际使用WT内`data/changesets/WCD-10/B17/REVIEW_GATE.json`（SHA-256 `1e8ff2c95bd64a144ba443710901f26225630a98f3b8504cb64b72a3f3251cda`）。`CHECKPOINT_REVIEW.json`（SHA-256 `7431aa87145134a83eed26f5c407b6e2c4cbbae4b594c102e77690c1aa42c253`）是在SQL disposable-clone审查通过后创建，作为actual apply的授权检查点。最初曾在ROOT路径下查找Gate；母方明确正式Gate位于WT后，按此路径核验并完成prepare，没有失败prepare。apply及post-apply QA之后未重跑。

上述父级过程记录保存在本地`project/internal/WCD_10_WORKSPACE/B17/parent_logs/`，包括可见的`01_merged_review`、`02_merged_review_classified_previews`、`03_merged_review_card_joins`、`04_merged_review_preview_year_semantics`、`05_sql_clone_review`、`06_actual_data_review`、`07_actual_data_review_exact_raw_interface`记录。这里只报告当前目录实际保存的证据，不声称所有读取调用均有完整持久化raw stdout/stderr。

## 版本与未结义务

Research `1.5.0 development`、Schema `0.4`、Web Data `v2-web-0.3`、Web `0.6.0 Development`及Public Release暂停维持原状。B01—B17累计366对象、1472 facts、381 relationships；17/21批、51/61作者，余4批10作者。W03版本注记与直接归属回补、B08共同对象归属及TASK-127仍未完成。B17不改变这些阶段义务，也不代表阶段DONE。未执行Git写入、安装、发布、部署或自动化。

## 记录入口

- [B17审计](./AUDIT.md)；[B17验证](./VALIDATION.md)
- [apply记录](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B17/APPLY_EXECUTION.json)；[16步QA记录](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B17/QA_STEPS.json)；[实际数据独审](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B17/ACTUAL_DATA_INDEPENDENT_REVIEW.json)
