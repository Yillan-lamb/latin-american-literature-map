# 项目文档

`docs/` 保存对读者、研究者、数据使用者和开发者具有长期解释价值的正式文档。这里不保存动态任务状态、临时计划、临时 Gate 状态/节点状态、过程性 QA/Handoff 或 AI 协作过程记录；长期适用的 Public Release Gate 规则属于治理和发布制度文档。动态内部材料统一位于被 `.gitignore` 忽略的 `project/internal/`，长期 AI 协作规则见 [`project/ai/`](../project/ai/)，正式审计与可追踪 QA/交付见 [`project/audits/`](../project/audits/) 或对应的 `data/changesets/`。

## 目录

- [`methodology/`](./methodology)：研究方法、来源选择、证据与公开原则；
- [`data/`](./data)：数据模型、策展结构、Schema 与数据维护；
- [`web/`](./web)：Research Data → Web Data → Frontend 流程和技术架构；
- [`releases/`](./releases)：正式数据版本和 Web 候选阶段说明。
- [`LICENSES.md`](./LICENSES.md)：多许可证体系、署名方式与第三方材料边界。

与具体数据包绑定的 README、Manifest 和数据字典继续与数据共置于 [`data/`](../data)；前端运行说明继续位于 [`site/README.md`](../site/README.md)。

新增文档前应先判断它是否长期解释项目成果。若主要记录负责人、任务进度或一次性执行过程，应放入被忽略的 `project/internal/`；若属于需要 Git 追踪的正式审计或交付结论，应放入 `project/audits/` 或对应的 `data/changesets/`，而不是 `docs/`。
