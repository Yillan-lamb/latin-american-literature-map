# 审计、QA 与交接记录

本目录保存正式研究或网站执行过程中的审核证据，不承担对外项目介绍。

- [`research/`](./research)：Research Data 的阶段审核、来源复核、发布结论和一致性审计；
- [`web/`](./web)：Web Data、页面、浏览器、公开边界、内容扩充与合并审核；
- [`archive/`](./archive)：已被后续迭代取代的原型、早期 RC 和旧审核包。

单个 changeset 的 `PREFLIGHT`、`QA`、`REVIEW`、`REMEDIATION` 与来源说明继续留在对应 `data/changesets/<id>/`，以保持数据包自身可追溯；跨批次或阶段总审计才进入本目录。
