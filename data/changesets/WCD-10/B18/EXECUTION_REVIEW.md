# WCD-10-B18 执行审查记录

- 任务/决策：TASK-123 / DEC-070
- WT分支：`codex/wcd-10-author-deepening`
- 实际迁移：`0053_wcd10_b18_author_works.sql`，唯一一次apply，exit 0。
- 数据库SHA-256：基线`1bc4695f6c77cad166b5229572f73490006b9e4392379e0017f799049e5aceb0`；执行后`8e2c26422a219990c8e397005ebd4e2c8499181f657b63f53cdb70af3e99d016`。

## 门禁与执行流

prepare使用的是WT内`REVIEW_GATE.json`，SHA-256 `e7a79aef82383cdf5e22fd764546f0972b237e10a35c5982949c3193b45808f6`。disposable-clone SQL审查通过后产生的`CHECKPOINT_REVIEW.json`，SHA-256 `c50ff8a205918f8cba03820afe9f25b4a111f1a5e2a34b7850c05b5c1f178395`，是actual apply的审查门禁；两者用途不同。

Actual apply命令由Python 3.14运行，cwd为授权WT，TASK-123、reviewer `Codex-parent-independent-review`，exit 0。原始stdout SHA-256为`5a86b7f97d2349370a864d793346edcbce8e2a35b819b50ceb08dea5faf203ad`，原始stderr为空（空流SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`）。执行后零参数QA wrapper只运行一次，16步全部exit 0。执行参数、运行时、cwd、退出码、raw流路径及hash见本地B18的`APPLY_EXECUTION.json`、`QA_WRAPPER_INVOCATION.json`、`QA_STEPS.json`与`INTEGRATOR_APPLY_QA.json`。

Full-53 migration replay的raw stdout SHA-256为`587a6476f591d3a39defdd6f811ecd926da03b0120ba1b67d88772e63674ce7e`；格式化replay日志SHA-256为`2839e365fae66710f6eda76b0979e009c0ceabc531e94c0e6cfcd86f64fc76c6`。formatted log记录命令、退出码、raw流路径和hash，不是raw stdout本身。

## 独立审核与证据限制

父级`ACTUAL_DATA_INDEPENDENT_REVIEW.json`对实际主库、执行记录、16步QA、全53迁移/19表重放、19表三种导出、22个重复导出及177个公共文件完成553项检查，全部通过；报告SHA-256 `8b1fce61c65386d1134602acda5019ee666e504754c1e5f2d8ee2591747b91ef`。检查也确认ROOT数据库和原有24项tracked文件未改。

**NOT_VERIFIED：** `RUNTIME_NOTES.json`记录Ribeyro R0原始validator报告和manifest在归档前被实际重跑覆盖，因此原始报告字节/manifest不能验证。R0重建说明、manifest及raw rerun留存；R1真实报告与hash经独立验证。本限制不由重建材料消除，也不影响本批最终冻结输入、B18实际数据独立审核结论。

## 阶段边界

本记录只覆盖B18执行与验收。WCD-10仍有3批7位作者未完成，W03版本注记与直接归属回补、B08共同对象归属及TASK-127仍待处理。Research 1.5.0 development、Schema 0.4、Web Data 0.3、Web 0.6.0及Public Release暂停不变。未进行Git写操作、发版或部署。
