# WCD-10-B21 审计记录

- 任务/决策：TASK-126 / DEC-070
- 日期：2026-10-15
- 范围：Rómulo Gallegos（V1-ENT-0360）单作者批次；不表示WCD-10 umbrella已完成。
- 冻结基线：`db16fe4f5faaafcfca3b02b42c52d56bb9b11d63704d2de49201d1f328e0a0ba`
- 实际检查点：`559b1858b7b5e647b4b313f841be8d2960cf3a5eacf2a2dd92c6161668da706c`

本批新增8个Research对象（6部作品、2部合集）、28项事实和8条普通CREATED关系。4项来源候选由3个新来源与既有SRC-0275复用组成；新增11张Research卡和12个研究缺口。无额外关系或受控共同作品附件。冻结coverage中的3部既有作品来源、事实、关系与卡片引用闭包逐值保全；11条coverage主作品记录和1项延期候选保留。来源、候选与coverage见[候选包](./CANDIDATES.json)、[coverage](./COVERAGE.json)、[来源登记](./SOURCE_REGISTRATION.json)、[证据矩阵](./EVIDENCE_MATRIX.json)及[整合映射](./INTEGRATION_MAP.json)。

实际数据库为795 entities、2683 facts、768 relationships、794 sources、823 content cards、690 gaps；相对基线增量分别为+8、+28、+8、+3、+11、+12。母级实际数据独立审查328项检查`PASS_ACTUAL_DATA_REVIEW`，审查记录可见[内部实际审查](<../../../../../../../project/internal/WCD_10_WORKSPACE/B21/ACTUAL_DATA_INDEPENDENT_REVIEW.json>)。实际迁移与QA范围见[验证记录](./VALIDATION.md)及[执行审查](./EXECUTION_REVIEW.md)。

公开范围保持不变：B21新增公开对象0，仍为127个公开对象和139条路由；177个既有公共文件逐字节一致。`manifest.json`与`site_data.json`通过校验后逐字节复制至开发Web数据目录。Research 1.5.0 development candidate、Research Schema 0.4、Web Data 0.3、Web 0.6.0及Public Release暂停状态不变。
