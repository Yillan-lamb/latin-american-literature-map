# B05 整合准备差量说明（R3 + FCT-0309 F16）

- 日期：2026-10-03（Asia/Shanghai）｜Integrator 准备阶段
- 候选基线：`inputs/B05_R3/`（冻结输入；未改动）。本顶层文件由冻结 R3 复制后增补一项经独立核支持的 F16 候选。
- R3 的 W09 R2-01 修订及原有内容保留。唯一研究事实差量是 `existing_facts` 新增 `WCD10-B05-F16`；新增并更新 FCT-0309 deferred 追溯、更新旧 layering deferred 文案及 `COVERAGE` 中 V1-ENT-0154 remaining 说明；EVIDENCE_MATRIX 从 48 增至 49 entries（48 facts + 1 relationship）。

## F16｜V1-ENT-0154 bibliographic_note｜追加式更正候选

新增候选值：“首版：墨西哥城 Cuadernos Americanos，1950；Fondo de Cultura Económica 版，1959。”唯一来源为 `WCD10-B05-S23`（ELEM 205027），其结构化版次字段将 Cuadernos Americanos 1950 列为首版、FCE 1959 列为其他版。该来源及旧行边界见冻结 R3 输入及 `ERRATA_CANDIDATE.json`（SHA-256 `efcc91016cc1f6cfa840832fa5ecc695349d8e0e9335340afd31dea12266499d`）。

保留旧 `V1-FCT-0309` 行、旧 source links 与既有 hold；旧 link 错配尚未修复，留待后续历史证据清理。该候选不声称结构化 supersession，不代表已 apply。

## 状态与门禁

候选状态为 `CANDIDATE_PENDING_POLICY`，因为 W03 跨语种首发字段口径仍待 USER 回复。F16 的来源语义由独立 Reviewer 核支持。真实候选机械报告为 `MECHANICAL_CHECK.json`；整合/准入门禁由 Codex-PM 编写，本说明不写 `REVIEW_GATE PASS`。真实验证器已运行但返回 FAIL：通用冲突检查拒绝 V1-ENT-0154/bibliographic_note 与旧值并存（旧值为“诺贝尔书目页未列西语原版；英译 The Labyrinth of Solitude（tr. Lysander Kemp）Penguin 1985；poets.org 标初版 FCE 1950”）。该失败来自追加更正与现存字段值冲突，候选边界与旧行保留说明已记录；未修改验证器或绕过门禁。未生成或执行 SQL、未写主库。
