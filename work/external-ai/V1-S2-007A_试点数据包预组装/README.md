# V1-S2-007-A：试点数据包机械预组装

- task_id: `V1-S2-007-A`
- parent_task: `V1-S2-007`
- assignment_id: `V1-S2-007-A-PREVIEW-ASSEMBLY`
- task_type: `data_normalization_preview / csv_json_sqlite_build / consistency_qa`
- package_profile: `FULL`
- execution_scope: `milestone_bundle`
- assignee: `EXT-AI-02（ZCode；必须登记实际模型及版本）`
- status: `done / pass`
- dependencies: `V1-S2-006-A R1 pass`, `试行 Schema 0.1-draft`, `DEC-024`
- completed_by: `EXT-AI-02（ZCode / deepseek-v4-flash，版本 unknown）`
- pm_review: `work/external-ai/reviews/V1-S2-007-A_PM_REVIEW.md`

## 1. 目标

把已经通过 Codex 门禁的实体端点、关系候选、事实候选、内容卡和来源机械预组装为 CSV、JSON、SQLite 三格式预览包，为 Codex 最终规范化、正式暂存和 N2 用户审核节省工作量。

本任务只生成 `PRE-` 临时预览数据，不生成正式实体 ID、关系 ID或 staging 数据，不修改 `data/`。

## 2. 必读输入

1. `project/governance/PROJECT_CHARTER.md`
2. `project/tasks/TASKS.md`（只读）
3. `project/archive/阶段0_研究与数据规范.md`
4. `project/ai/外部AI执行工作流与自检手册.md`
5. `docs/data/阶段2_试行Schema与迁移规则.md`
6. `project/decisions/拉丁美洲文学地图_项目决策记录.md` 中 DEC-022~024
7. `data/catalog/SOURCE_REGISTRY.csv`
8. `work/external-ai/reviews/V1-S2-006-A_R1_PM_REVIEW.md`
9. `work/external-ai/deliveries/V1-S2-006A_试点关系候选与内容事实包_交付/RELATION_CANDIDATES.csv`
10. 同目录 `CONTENT_FACT_CANDIDATES.csv`、`CONTENT_CARD_DRAFTS.md`、`EVIDENCE_COVERAGE.csv`
11. `work/external-ai/deliveries/V1-S2-003-004B_试点来源整理与候选抽取_交付/ENTITY_CANDIDATES.csv`
12. `work/external-ai/deliveries/V1-S1-003_正式来源ID回填_交付/ENTITY_CANDIDATES.csv`

任何必读文件不可见时立即停止并报告，不凭聊天摘要重建数据。

## 3. 固定输入基线

- 关系端点：28 个唯一候选 ID；
- 关系候选：27 行、26 个 `relation_group_id`；
- 关系状态：15 组可进入暂存审核、11 组 `needs_second_source` 待补证；
- 事实候选：49 行；
- 内容卡：8 张；
- 来源：`SRC-0002`、`SRC-0007`~`SRC-0013` 共 8 个。

如果机械重算不等于上述基线，停止生成并在 STATUS/HANDOFF 报告，不自行修复上游包。

## 4. 临时 ID 和规范化规则

### 4.1 临时 ID

- 28 个端点按 `candidate_id` 字典序排列，依次分配 `PRE-ENT-0001`~`PRE-ENT-0028`。
- 26 个关系组按 `relation_group_id` 字典序排列，依次分配 `PRE-REL-0001`~`PRE-REL-0026`。
- 8 张内容卡按 R1 内容卡现有顺序分配 `PRE-CARD-0001`~`PRE-CARD-0008`。
- `PRE-` ID 只用于本交付预览，不是正式 ID，Codex不得被迫沿用。

### 4.2 类型和显示名

- 默认类型和名称取候选池；但必须应用以下已决裁决：
  - `CAND-S2-ENT-0069`、`0071`、`0089` → `collection`；
  - `CAND-S2-ENT-0092` → `adaptation`；
  - `CAND-S2-ENT-0003` → `work`，显示名 `《阿莱夫》（1945 年短篇）`；
  - `CAND-S2-ENT-0071` → 显示名 `《阿莱夫》（1949 年作品集）`；
  - `CAND-S2-ENT-0088` → 显示名 `《星辰时刻》（1977 年小说）`；
  - `CAND-S2-ENT-0092` → 显示名 `《星辰时刻》（1985 年电影）`。
- 其他端点的 `display_name_zh` 使用规范名称候选，不自行改译名。
- 不把两个 candidate ID 合并为一个 PRE 实体；发现疑似重复只写 `issue_notes`，由 Codex决定。
- `normalization_status` 全部填写 `preview_only`，不得在该字段表达已准入。

### 4.3 关系状态

- 同组全部为 `dispute_status=none`：`review_status=eligible_for_staging_review`。
- 组内任何行为 `needs_second_source`：`review_status=hold_needs_second_source`。
- R1 基线应得到 15 个 eligible、11 个 hold。
- 不使用 `confirmed`、`approved`、`official` 等可能误解为正式入库的状态。

### 4.4 关系组折叠

- 每组 `description_zh` 取组内 `relation_candidate_id` 最小行的描述。
- `confidence` 取组内最低置信度，顺序为 `low < medium < high`。
- `source_ids` 按组内 relation candidate 顺序首次出现去重后用分号连接。
- `issue_notes` 合并组内非空说明、去重后用分号连接；不得新增语义判断。

## 5. 必须生成的主体成果

### A. 六张规范化 CSV

`ENTITY_NORMALIZATION_PROPOSALS.csv`（28×11）：

```text
preview_entity_id,candidate_id,entity_type,canonical_name_candidate,display_name_zh,original_name,language,country_or_region,date_info,normalization_status,issue_notes
```

`RELATION_GROUP_PROPOSALS.csv`（26×11）：

```text
preview_relation_id,relation_group_id,subject_preview_entity_id,relation_type,object_preview_entity_id,description_zh,review_status,confidence,evidence_count,source_ids,issue_notes
```

`RELATION_EVIDENCE.csv`（27×8）：

```text
preview_relation_id,relation_candidate_id,source_id,source_title,optional_locator,optional_evidence_note,confidence,dispute_status
```

`FACT_PROPOSALS.csv`（49×9）：

```text
fact_candidate_id,subject_preview_entity_id,fact_field,value_candidate,source_id,source_title,confidence,dispute_status,issue_notes
```

`CONTENT_CARDS.csv`（8×8）：

```text
card_id,subject_preview_entity_id,card_type,title_zh,content_points_json,fact_ids,source_ids,review_status
```

`SOURCE_SNAPSHOT.csv`（8×8）：

```text
source_id,title,original_title,source_level,format,language,persistent_id,canonical_url
```

`content_points_json` 必须是有效 JSON 数组字符串；`fact_ids`、`source_ids` 使用分号连接并按首次出现顺序去重。

- 8 行 `review_status` 均写 `source_fact_draft`。
- R1 Markdown 末尾的 1949 年作品集《阿莱夫》是“不计入内容卡”的结构附注，不生成第 9 张卡；其两条事实仍保留在 `FACT_PROPOSALS.csv`，但不塞入短篇《阿莱夫》的卡片，也不计入 8 张卡的 `fact_ids`。

### B. 三格式预览

1. `PILOT_PREVIEW.json`：顶层必须含 `metadata`、`sources`、`entities`、`relationships`、`relationship_evidence`、`facts`、`content_cards`。
2. `PILOT_PREVIEW.sqlite`：必须含以下 7 张表：
   - `metadata`
   - `sources`
   - `entities`
   - `relationships`
   - `relationship_evidence`
   - `facts`
   - `content_cards`
3. SQLite/JSON 内容必须由六张 CSV 机械生成，不得单独手填第二套数据。

### C. 构建、报告与 N2 草稿

1. `build_preview.py`：只读取本交付六张 CSV，生成 JSON、SQLite 和一致性摘要；使用 Python 标准库，不安装依赖，不访问网络，不修改工作区其他文件。
2. `EXPORT_CONSISTENCY_REPORT.md`：记录每张逻辑表在 CSV/JSON/SQLite 中的行数、主键集合、规范化内容 SHA-256，以及外键/枚举/状态检查结果。
3. `N2_REVIEW_SUMMARY_DRAFT.md`：只做机械草稿，包含：范围统计、实体类型分布、关系类型与状态分布、8 张卡片标题、11 个待补证关系组、已知缺口。不得代替 Codex提出最终结论或要求用户逐条审核。

## 6. 交付物（17 项）

1. `README.md`
2. `STATUS.md`
3. `ENTITY_NORMALIZATION_PROPOSALS.csv`
4. `RELATION_GROUP_PROPOSALS.csv`
5. `RELATION_EVIDENCE.csv`
6. `FACT_PROPOSALS.csv`
7. `CONTENT_CARDS.csv`
8. `SOURCE_SNAPSHOT.csv`
9. `PILOT_PREVIEW.json`
10. `PILOT_PREVIEW.sqlite`
11. `build_preview.py`
12. `EXPORT_CONSISTENCY_REPORT.md`
13. `N2_REVIEW_SUMMARY_DRAFT.md`
14. `QA_REPORT.md`
15. `ISSUES.md`
16. `HANDOFF.md`
17. `MANIFEST.md`

## 7. 必须验证

1. 六张 CSV 标准解析，行列数严格为 28×11、26×11、27×8、49×9、8×8、8×8。
2. PRE 实体、PRE 关系、卡片 ID 唯一且按规则连续；没有 `STG-`、`ENT-`、`REL-` 等正式 ID。
3. 所有关系端点、事实主体和内容卡主体都引用存在的 PRE 实体。
4. 每个关系组恰有一个 PRE 关系；27 条证据全部映射到正确组；`evidence_count` 与证据表一致。
5. 15 个 `eligible_for_staging_review`、11 个 `hold_needs_second_source`；待补证组不出现在 eligible 集合。
6. 类型覆盖和四个同名显示名符合 §4.2；0092 为 adaptation，0003/0071、0088/0092 不混同。
7. 49 条事实全部保留，`FCT-0044` 的值仍为 `collection`；事实来源与标题不变。
8. 8 张内容卡顺序、标题和各卡 FACT-ID 引用与 R1 Markdown 一致；所有 `content_points_json` 可解析。0071 附注不生成卡片，其事实只存在于事实表。
9. 来源快照只含固定八来源，字段与登记表逐项一致。
10. JSON 与 SQLite 七个逻辑表的主键、行数和规范化 SHA-256 与 CSV 一致；SQLite `PRAGMA foreign_key_check` 为空、`PRAGMA integrity_check` 为 `ok`。
11. `build_preview.py` 在一个空临时输出目录可重复生成相同 JSON/SQLite；不得依赖 `/tmp` 中的旧脚本或隐藏状态。
12. 运行共享 FULL 验证，errors/warnings 均为空；另检查目录恰为 17 个登记文件。

## 8. 禁止事项

- 不修改 `data/`、TASKS、Schema、章程、决策记录、既有任务包、REVIEW、CHANGELOG 或 GitHub。
- 不分配正式实体、关系或暂存 ID，不把 `eligible_for_staging_review` 写成已批准。
- 不新增或删除上游实体、关系、事实、卡片或来源；发现问题写 ISSUES，不越权修复上游。
- 不重新检索、OCR、下载全文或补证；本任务是机械预组装，不是研究任务。
- 不在 JSON/SQLite 中加入 CSV 不存在的隐藏字段或额外事实。
- 不交付原书、论文全文、长摘录、Cookie、密钥、`.DS_Store` 或任何 inputs 目录。

## 9. HANDOFF 只需回答

1. 六张 CSV 和三格式预览的最终计数；
2. 15/11 关系状态分层是否一致；
3. CSV/JSON/SQLite 哈希与外键检查是否全部通过；
4. 是否发现会阻止 Codex正式暂存的上游问题；
5. 是否具备进入 Codex数据包门禁的条件。
