# 审计、QA 与正式交接记录

本目录保存仍需在当前仓库中可追踪的研究或网站正式审计，不承担每日项目管理。

- [`research/`](./research)：Research Data 的来源复核、发布结论和一致性审计；
- [`web/`](./web)：Web Data、页面、浏览器、公开边界和内容审计；
- [`../archive/audits/`](../archive/audits/)：已完成阶段、原型和旧 RC 审计包；
- `project/internal/reviews/`：本地忽略的过程性交接和内部复核。

单个 changeset 的 `PREFLIGHT`、`QA`、`REVIEW`、`REMEDIATION` 与来源说明继续留在对应 `data/changesets/<id>/`，以保持数据包自身可追溯；跨批次或阶段的正式结论才进入本目录。
