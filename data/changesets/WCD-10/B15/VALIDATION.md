# WCD-10-B15 验证记录（TASK-120）

## 独立审核与正式apply

父方对冻结内容/合包审查通过；生成的SQL在disposable clone上通过381项独立检查。审查绑定baseline `651f89688eeba195a4332ee6611cc51478c2c3aeae7fd5b2391069283a0cea92`、SQL SHA `4f0803e185dcf9c2409caf171c4218f52921b926d6248a2e2461c72b79d13c9d`、map SHA `9e5e4cecd482994ad500448a87e84f9006c332189ee8610264435cb4bdca52f9`及Gate SHA `e225d5d54cfa1ceeaa7e567d65815fd5fedd8adee31cabe86d8e14107a379169`。0050仅apply一次，task `TASK-120`，reviewer `Codex-parent-independent-review`，exit 0。实际数据库SHA为`51966400aa4e9de43867e2b5c684b873be811857945151a6bc5592c2b915e7fb`；父426项实际数据独立审查PASS。

当前主库共710 entities、2372 facts、682 relationships、742 sources、703 content cards、548 gaps。B15净增14 entities、47 facts、14 relationships、11 sources、17 cards和25 gaps；4条来源复用。新增事实和关系引用由migration map追踪，旧holds无变化。

## 必要QA

正式post-apply wrapper以零参数运行一次，16/16步骤exit 0。检查包括：公开基线快照一致性、master校验、checkpoint与重复导出22文件逐字节一致、固定时间Web Data与deploy bundle校验、reviewed checkpoint QA、公共包177文件一致、新Web JSON复制校验，以及全50迁移/19表重放与最终master完整性/外键校验。JSON/CSV/XLSX各19表导出通过；公共包仍为127个对象/139条路由，B15新对象公开数为0。checkpoint QA SHA：`3f0aaacc3c7c2bdaa965f03672ab7506f0b439b87da2007a4682398023202c31`。

父审计最初三次reader接口尝试失败：compact QA命令绑定形状、apply command绝对路径字段、以及replay格式标签。原始失败流保存在父方证据；Integrator没有重跑apply或QA。父方后续exact compact-shape验证通过。50迁移重放raw stdout SHA为`654bf41c05404174aad03ef901793840656e47d91a346ee73dfd3e3cc12c950a`；replay格式化日志SHA为`bce0e4302007bcfa6a6c7aa2d7853d0ed2af629c7509ef816b6127a59452953d`。两者是不同工件，分别用于绑定命令原始输出与可读重放记录。

## 可复核文件

[候选](./CANDIDATES.json)、[coverage](./COVERAGE.json)、[来源登记](./SOURCE_REGISTRATION.json)、[证据矩阵](./EVIDENCE_MATRIX.json)、[SQL](../../../../data/master/migrations/0050_wcd10_b15_author_works.sql)、[map](./INTEGRATION_MAP.json)、[checkpoint QA](../../../../work/wcd10-qa/B15_CHECKPOINT_QA.json)、[格式化迁移重放](../../../../work/wcd10-qa/B15_MIGRATION_REPLAY.log)。完整执行流及独立审查记录位于项目本地持久工作区`project/internal/WCD_10_WORKSPACE/B15/`。
