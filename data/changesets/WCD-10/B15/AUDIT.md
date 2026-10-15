# WCD-10-B15 Research 审计（TASK-120）

## 范围与结论

本批按DEC-070执行一轮有界来源审查，目标是为三位作者补充可核实的作品书目、体裁、作者归属及直接来源描述，不追求学术全集。冻结作者顺序为Roberto Arlt、Samanta Schweblin、Mariana Enríquez。冻结候选分别由Arlt FINAL（SHA `af6c05433fbec8f908a444b110ef9b0fc1a21ffe8c75c982ab69eef6982d5304`）、Schweblin R1（SHA `206c890678733d28777a891a320563b4f3559f855009480da6718f38eb6025df`）、Enríquez R1（SHA `de8d2946d9e2b6c1feeb70ec0e13735905c05953a4d55c081dc2128c06546ba5`）提供；其来源访问记录见本地持久执行证据中的`INTEGRATOR_MERGE.json`和作者冻结包清单。Integrator按批准的机械合并规则保留文学字段、source profiles、证据矩阵和旧作闭包原值；冻结内容、来源及合包均已通过母方独立审核。

本批新增14个作品/合集、47项事实、14条CREATED关系、11个新来源；复用SRC-0230、SRC-0238、SRC-0236、SRC-0237四条既有来源。新增17张Research卡和25个研究缺口。9个旧作品V1-ENT-0293—0295、V1-ENT-0299—0301、V1-ENT-0302—0304的关系、来源、事实及引用闭包经父审核验保全。候选覆盖原始24行，其中V1-ENT-0286是作者身份行；批准后将其完整原值保存在`MERGE_PROVENANCE.auxiliary_author_coverage`，最终主作品roster为23行。

## 来源边界与未决事项

来源注册遵循冻结source scope：11项新来源形成SRC-0734—SRC-0744，4项canonical reuse为SRC-0230、SRC-0238、SRC-0236、SRC-0237并保持原记录，不改旧元数据。来源只支撑本批已登记的书目字段和描述；没有据此声称覆盖全部作品或完成学术全集。两项deferred维持原reason/disposition；未知或冲突信息不推断，既有holds及合理研究缺口不升级。新内容全部为Research-only，无新对象获得公开准入。

候选及冻结输入校验、辅助作者行处理、deferred补齐和source reuse决策的逐项记录见[合并来源](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B15/INTEGRATOR_MERGE.json)与本地`MERGE_PROVENANCE.json`。最终formal entity ID为V1-ENT-0699—0712；integration map保存proof/candidate/formal fact ID别名及source ID映射。作品、事实、关系和source joins可由SQL及map逐项复核。

## 证据入口

- [候选数据](./CANDIDATES.json)
- [覆盖和闭包](./COVERAGE.json)
- [来源登记](./SOURCE_REGISTRATION.json)
- [证据矩阵](./EVIDENCE_MATRIX.json)
- [去重记录](./DEDUP.json)
- [来源访问日志](./SOURCE_ACCESS_LOG.json)
- [合并来源记录](./MERGE_PROVENANCE.json)
- [integration map](./INTEGRATION_MAP.json)
- 本地执行证据：`project/internal/WCD_10_WORKSPACE/B15/INTEGRATOR_MERGE.json`、`INTEGRATOR_PREPARE.json`、`APPLY_EXECUTION.json`、`INTEGRATOR_APPLY_QA.json`及`ACTUAL_DATA_INDEPENDENT_REVIEW.json`。
