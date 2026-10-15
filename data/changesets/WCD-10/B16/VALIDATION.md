# WCD-10-B16 验证记录（TASK-121）

## 独立审核与正式apply

冻结输入、来源内容和合包经母方审核通过。正式迁移0051在disposable clone上通过484项独立SQL检查，绑定baseline `51966400aa4e9de43867e2b5c684b873be811857945151a6bc5592c2b915e7fb`、SQL SHA `37dd5715090c5fdc71bcefa99b90ffb5d67e23c386f25c96c9ec7eb074a9e2ec`、map SHA `d4a42d9e3c5e0f04096ad1b4c81a341b6a0585abbdc76899fe6297fc5415c86d`及Gate SHA `a45b9c5cc2844e7043880cce19002973485e9107082ef23c86208441163d58a0`。Integrator按TASK-121与批准reviewer将0051 apply一次，exit 0。母方531项实际数据独立审查PASS，数据库SHA与apply后记录一致：`bf814eb0796ad27db76349a4f166ba3ca40be3df47f22373e6e094e34bdf632e`。

主库现有727 entities、2437 facts、699 relationships、755 sources、728 content cards、576 gaps。B16净增17 entities、65 facts、17 relationships、13 sources、25 cards、28 gaps；4条复用来源行与所有旧数据保持不变。9个旧作品闭包、26条coverage主作品行、2项deferred及旧holds保全。

## 必要QA

`run_required_qa.py`在apply成功后以零参数执行一次，16/16 post-apply步骤均exit 0。QA同时核验基线公共快照、主库完整性与外键、checkpoint导出与重复导出、固定时间Web数据和deploy bundle、审核版checkpoint、新Web JSON副本以及全51迁移重放。JSON、CSV、XLSX各导出19表；22个重复导出文件逐字节一致。177个公共文件与既有基线逐字节一致，仍为127个公开对象和139条路由；新B16对象公开数为0。完整重放保持19表且完整性与外键检查通过。

母实际数据审查将QA_STEPS、compact报告、apply记录、全部原始流、迁移、导出和数据库结果逐项绑定，531项检查全部通过。QA_STEPS SHA `6ae4335ab5e93fbf05c134207fb11d28a95a8f5336f46dfff33e83ccdf8a2de6`；compact报告SHA `9d84d9e0e1bbfd47d23f15f5adab6ba5477ffc4a2f41920fbe6181d9cbec347d`；checkpoint QA SHA `b6e52f2b0d5703874b1f152f34cb149ec970d42533e348a89cfa90fd2dfe7904`。格式化迁移重放日志另见`work/wcd10-qa/B16_MIGRATION_REPLAY.log`。

## 可复核文件

[候选](./CANDIDATES.json)、[coverage](./COVERAGE.json)、[来源登记](./SOURCE_REGISTRATION.json)、[证据矩阵](./EVIDENCE_MATRIX.json)、[SQL](../../../../data/master/migrations/0051_wcd10_b16_author_works.sql)、[integration map](./INTEGRATION_MAP.json)、[checkpoint QA](../../../../work/wcd10-qa/B16_CHECKPOINT_QA.json)、[迁移重放日志](../../../../work/wcd10-qa/B16_MIGRATION_REPLAY.log)。完整执行及独立审查证据位于项目本地持久工作区`project/internal/WCD_10_WORKSPACE/B16/`。
