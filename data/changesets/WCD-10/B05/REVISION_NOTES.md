# B05 整合候选差量（R3 + F16 + W03 deferred）

- 日期：2026-10-07（Asia/Shanghai）。
- 整合前48事实draft已逐文件冻结于 inputs/B05_WITH_F16_PRE_POLICY/；外部冻结B05_R3输入未修改。
- 差量：active new_entities撤下W03《El mono gramático》及其4条嵌套事实；由builder生成的W03 CREATED随之不生成。当前活跃为8新对象、44事实（31嵌套+13既有对象）、1条SET_IN；coverage为9既有对象+8活跃新增对象，共17。
- W03完整原对象、四条原matrix rows、原coverage对象、来源候选S07/S12/S18、profiles、旧deferred条目、旧文件hash和1972/1974证据拆分见 W03_DEFERRED_CANDIDATE.json。状态DEFERRED_NOT_ADMITTED / USER_POLICY_PENDING；1972仅是冻结draft中的未准入提议，1974仅为西语原文版证据。本次不选择任一年，且在TASK-127完成前必须回补。
- CANDIDATES保留唯一原policy gap key；将Codex裁决措辞改为USER未裁决及最终整合义务。COVERAGE保留独立W04 deferred，另列W03 deferred_objects，不增加第二条W03 gap或正式对象ID。
- S18仅供W03 deferred追溯，profile标为deferred_only_not_registered；S07/S12复用项仍支持活跃对象。
- 父审核指出的F16来源表述已在派生coverage中窄修：S23 ELEM结构化字段支持1950 Cuadernos Americanos/1959 FCE；FCE新闻转载只作C级旁证。F16原子值与refs、旧行、原链接和HOLD-0043均未改，未称旧链接已修复。
- 保持F16追加式边界。已真实运行候选验证器，不提供conflict_review gate，MECHANICAL_CHECK记录F16同对象同字段冲突FAIL；无真实REVIEW_GATE、SQL prepare/apply、主库写入、map/public bundle变化。
