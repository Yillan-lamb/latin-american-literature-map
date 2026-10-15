# WCD-10-B16 Research 审计（TASK-121）

## 范围与结论

本批按DEC-070进行有界作者作品研究整合，冻结作者顺序为Alejandro Zambra、Paulo Coelho、Carlos Drummond de Andrade。候选、来源记录、coverage、证据矩阵及合包按已批准输入机械整合，文学主张与作者source profiles未改写；母集中来源内容审查与合包独立审查通过。

正式增量为17个作品/合集、65项事实、17条CREATED关系、13个新来源并复用4条canonical来源（SRC-0239、SRC-0242、SRC-0243、SRC-0244）；新增25张Research卡和28个研究缺口。9个既有作品及其来源、事实、关系闭包保全；coverage保留26条作品主行，2项deferred原样保留。新增内容全为Research-only。

证据矩阵原73行按65个fact groups和6个CREATED归属组分类。独立审核读取器按同一事实聚合两来源refs，用于核对候选source_refs；原矩阵及网页投影均未改动。Coelho既有卡片关联从数据库旧facts复核。S103辅助DEDUP原拟登记新来源，正式候选显式复用SRC-0242；差异及理由记入provenance，候选冻结内容未改。SOURCE_REGISTRATION所需执行元数据机械展平到根字段；原作者注册文档、冻结包与MERGED_INITIAL均保留。

## 数据边界与未决事项

复用来源的正式行保持不变；新增来源仅支撑本批经审核登记的事实与关系，不声称学术全集。旧closure、holds和合理研究缺口均保留；本批28个新gap维持研究状态。新卡片不获得Research以外的准入，Public Release仍暂停。

母审阅接口03/04/05的读取尝试失败流已保留；后续06 merged内容审查、07 disposable-clone SQL审查和08 actual data审查均PASS。失败尝试没有替代后续独立审查，也没有导致再次apply或重跑QA。

## 证据入口

- [候选数据](./CANDIDATES.json)、[coverage](./COVERAGE.json)、[来源登记](./SOURCE_REGISTRATION.json)、[证据矩阵](./EVIDENCE_MATRIX.json)
- [去重记录](./DEDUP.json)、[来源访问日志](./SOURCE_ACCESS_LOG.json)、[合并来源记录](./MERGE_PROVENANCE.json)、[integration map](./INTEGRATION_MAP.json)
- [验证记录](./VALIDATION.md)、[执行审查](./EXECUTION_REVIEW.md)、[SQL迁移](../../../../data/master/migrations/0051_wcd10_b16_author_works.sql)
- 本地执行证据位于`project/internal/WCD_10_WORKSPACE/B16/`，包括`APPLY_EXECUTION.json`、原始流、`QA_STEPS.json`、`INTEGRATOR_APPLY_QA.json`及母方`ACTUAL_DATA_INDEPENDENT_REVIEW.json`。
