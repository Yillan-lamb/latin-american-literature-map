# 内部项目管理

此目录保存项目治理、计划、任务、决策、审计、AI 协作及历史执行记录，不属于项目对外成果展示主线。

## 目录职责

- [`governance/`](./governance)：项目总章程、规则冲突清单和章程修改提案；
- [`plans/`](./plans)：阶段计划、产品说明书、扩充计划和研究缺口；
- [`tasks/`](./tasks)：V1、V2 动态任务状态；
- [`decisions/`](./decisions)：项目决策、取代关系与影响记录；
- [`ai/`](./ai)：AI 协作规则、接管提示词、分工与交接说明；
- [`audits/`](./audits)：Research / Web 审计、QA、Gate、Review 和 Handoff；
- [`archive/`](./archive)：已经完成历史使命、不能作为当前执行入口的材料。

新增内部文档应先选择上述职责目录，不应放回仓库根目录或 `docs/`。对外长期解释项目成果的材料应放在 [`docs/`](../docs/)；与单个数据变更集紧密绑定的证据和审核文件继续与该变更集共置于 `data/changesets/`。
