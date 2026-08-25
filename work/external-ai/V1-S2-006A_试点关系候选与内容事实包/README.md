# V1-S2-006-A：试点关系候选与内容事实包

- task_id: `V1-S2-006-A`
- parent_task: `V1-S2-006`
- assignment_id: `V1-S2-006-A-RELATION-FACT-BUNDLE`
- task_type: `relation_candidate_extract / content_fact_summary / mechanical_qa`
- package_profile: `FULL`
- execution_scope: `milestone_bundle`
- assignee: `EXT-AI-02（ZCode；必须登记实际模型及版本）`
- status: `done_r1_pass`
- dependencies: `V1-S2-003-004-B pass`, `阶段2试行 Schema 0.1-draft`

## 1. 目标

基于已经通过门禁的八来源笔记和 122 条实体候选，一次完成 20—30 条关系候选、两位作家与六部作品的来源化事实素材、内容卡草稿和覆盖检查。不得重新做 OCR、扩大来源池或直接确认关系。

## 2. 必读输入

1. `project/governance/PROJECT_CHARTER.md`
2. `project/tasks/TASKS.md`（只读）
3. `project/archive/阶段0_研究与数据规范.md`
4. `project/ai/外部AI执行工作流与自检手册.md`
5. `docs/data/阶段2_试行Schema与迁移规则.md`
6. `data/catalog/SOURCE_REGISTRY.csv`
7. `work/external-ai/reviews/V1-S2-003-004-B_PM_REVIEW.md`
8. `work/external-ai/deliveries/V1-S2-003-004B_试点来源整理与候选抽取_交付/SOURCE_NOTES.md`
9. `work/external-ai/deliveries/V1-S2-003-004B_试点来源整理与候选抽取_交付/ENTITY_CANDIDATES.csv`
10. 同一交付包的 `QA_REPORT.md`、`ISSUES.md`、`HANDOFF.md`
11. `work/external-ai/deliveries/V1-S1-003_正式来源ID回填_交付/ENTITY_CANDIDATES.csv`（仅用于端点查重，不重做 387 条审核）

如本机看不到第 7—11 项，立即停止并报告缺失路径，不凭聊天摘要重建输入。

## 3. 固定范围

- 作家：博尔赫斯、李斯佩克朵。
- 作品：短篇《阿莱夫》、《小径分岔的花园》、《虚构集》、《活水》、《星辰时刻》、《家庭纽带》。同名作品集、译本和电影只在关系确有来源支持时作为结构端点。
- 来源：只用 `SRC-0002`、`SRC-0007`~`SRC-0013`。
- 解释性关系重点使用原作或 A 级论文；`SRC-0007` 不得支持主题、影响或文学运动判断。
- 不要求章节和页码；来源 ID 与来源题名必须准确。

## 4. 工作单元

### A. 关系候选

生成 20—30 条来源化关系候选：

- 8—12 条直接/结构关系，例如创作、作品集收录、版本、译本、改编；
- 8—14 条主题、地点、回应或文学史候选；
- 其余用于有明确证据的跨作品、人物或地点关系。

每行只保存一个来源证据。同一三元关系若有两个独立来源，使用两行和相同 `relation_group_id`。不得为达到数量制造关系。

`RELATION_CANDIDATES.csv` 固定 17 列：

```text
task_id,relation_candidate_id,relation_group_id,subject_candidate_id,subject_label,relation_type,object_candidate_id,object_label,description_zh,source_id,source_title,optional_locator,optional_evidence_note,confidence,dispute_status,issue_notes,extracted_by
```

- `relation_candidate_id`：`CAND-S2-REL-0001` 起连续唯一编号。
- `relation_group_id`：按规范化三元关系分组，格式 `RG-S2-0001`；相同三元关系必须相同。
- `relation_type` 只能使用试行 Schema 第 3 节允许值。
- `optional_evidence_note` 只写短中文释义，不复制长段原文。

### B. 内容事实素材

围绕两位作家和六部作品生成 30—50 条原子事实候选，一行只表达一个字段值和一个来源：

```text
task_id,fact_candidate_id,subject_candidate_id,subject_label,fact_field,value_candidate,source_id,source_title,confidence,dispute_status,issue_notes,extracted_by
```

允许的 `fact_field`：`birth_year`、`death_year`、`country_or_region`、`language`、`entity_layer`、`first_publication_year`、`genre_or_form`、`bibliographic_note`、`one_sentence_summary`、`key_character`、`key_place`、`research_note`。

- 冲突值分行保留并标 `disputed`，不得自行抹平。
- 短篇《阿莱夫》的 1949 不得写成已核定首发年。
- `El tamaño de mi esperanza` 的规范年采用 1926；本任务若无直接需要，不必重复抽取。
- UESB 页码不是本任务必填字段。

### C. 内容卡草稿与覆盖

生成 `CONTENT_CARD_DRAFTS.md`：两位作家、六部作品各一节。每节只使用事实候选表内容，采用简短中文要点，不写最终策展文案；每一点在行末标 `[FACT-ID]`。

生成 `EVIDENCE_COVERAGE.csv`：每个关系组/内容卡对象记录来源数、A/B/C/D 来源构成、是否需要第二来源、主要缺口。不得把同一来源的两个页面当成两个独立来源。

## 5. 必须交付（10 项）

1. `README.md`
2. `STATUS.md`
3. `RELATION_CANDIDATES.csv`
4. `CONTENT_FACT_CANDIDATES.csv`
5. `CONTENT_CARD_DRAFTS.md`
6. `EVIDENCE_COVERAGE.csv`
7. `QA_REPORT.md`
8. `ISSUES.md`
9. `HANDOFF.md`
10. `MANIFEST.md`

## 6. 必须验证

1. 三张 CSV 均可标准解析、行列一致；关系 ID、事实 ID 唯一。
2. 关系候选为 20—30 条；事实候选为 30—50 条；不是为凑数量制造内容。
3. 所有关系端点都存在于本轮 122 条或既有 387 条候选中；端点 ID 与标签一致。
4. `relation_type`、`confidence`、`dispute_status`、`fact_field` 枚举合法。
5. 所有 `source_id` 与 `source_title` 和登记表一致，来源集合不超出固定八来源。
6. 同一 `relation_group_id` 的主体、关系词、客体完全一致；不同三元关系不得共用 group ID。
7. 解释性关系不存在“只有标题/关键词却写成事实”；单来源解释关系均标 `needs_second_source`。
8. 两位作家和六部作品内容卡不重不漏，每条要点引用有效 FACT-ID。
9. 不把短篇、作品集、译本、改编混为同一端点；重点断言《阿莱夫》和《星辰时刻》分层正确。
10. 目录恰为 10 个文件，无 PDF/EPUB/OCR/inputs/长摘录/Cookie/密钥/`.DS_Store`。
11. 运行共享脚本：`python3 scripts/validate_external_delivery.py <交付目录> --profile FULL`，把真实结果写入 QA。
12. QA 只报告 Worker 自检；最终 `pass/revise/reject` 留给 Codex。

## 7. 禁止事项

- 不修改章程、TASKS、试行 Schema、来源登记表、既有交付包、决策记录、CHANGELOG 或 GitHub。
- 不新增来源，不重新 OCR，不下载或交付全文，不绕过访问限制。
- 不分配正式实体/关系 ID，不直接进入 `data/staging` 或主数据库。
- 不自行宣布解释性关系成立，不把内容卡写成最终展览文案。
- 不再处理已裁决的 exact/possible 查重清单，除非发现会造成关系端点错误的新证据。

## 8. HANDOFF 只需回答

1. 关系候选、事实候选的最终机械统计；
2. 两位作家和六部作品是否全部覆盖；
3. 哪些关系组已有双来源，哪些仍需第二来源；
4. 是否发现实体层级或端点冲突；
5. 共享验证是否通过，是否具备 Codex关键门禁复核条件。

## 9. R0 验收状态

- R0 结论：`revise`（2026-08-10），只做窄范围 R1。
- 验收记录：`work/external-ai/reviews/V1-S2-006-A_PM_REVIEW.md`。
- R1 提示词：`work/external-ai/V1-S2-006A_试点关系候选与内容事实包/R1_REVISION_PROMPT.md`。
- R1 复检：2026-08-10 结论 `pass`。
- R1 验收记录：`work/external-ai/reviews/V1-S2-006-A_R1_PM_REVIEW.md`。
