# 项目文档

`docs/` 保存对读者、研究者、数据使用者和开发者具有长期解释价值的正式文档。这里不保存任务状态、临时计划、Gate、QA、Handoff 或 AI 协作记录；这些内部材料统一位于 [`project/`](../project)。

## 目录

- [`methodology/`](./methodology)：研究方法、来源选择、证据与公开原则；
- [`data/`](./data)：数据模型、策展结构、Schema 与数据维护；
- [`web/`](./web)：Research Data → Web Data → Frontend 流程和技术架构；
- [`releases/`](./releases)：正式数据版本和 Web 候选阶段说明。

与具体数据包绑定的 README、Manifest 和数据字典继续与数据共置于 [`data/`](../data)；前端运行说明继续位于 [`site/README.md`](../site/README.md)。

新增文档前应先判断它是否长期解释项目成果。若主要记录负责人、任务进度、审核结论或一次性执行过程，应放入 `project/`，而不是 `docs/`。
