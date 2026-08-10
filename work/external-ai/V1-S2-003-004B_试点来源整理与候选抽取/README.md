# V1-S2-003-004-B：八来源整理与六作品候选实体抽取

- task_id: `V1-S2-003-004-B`
- parent_tasks: `V1-S2-003`, `V1-S2-004`
- assignment_id: `V1-S2-003-004-B-L2-ENTITY-BUNDLE`
- task_type: `source_level_research_notes / scoped_ocr / entity_extract`
- package_profile: `FULL`
- execution_scope: `milestone_bundle`
- assignee: `EXT-AI-02（新外部执行方；首次交付必须填写真实平台、执行方和模型）`
- status: `ready`
- dependencies: `V1-S2-003-A R1 pass`, `SRC-0007~SRC-0013 assigned`

## 1. 目标

一次性完成八个正式来源的来源级材料整理、六部试点作品的结构化事实摘要和候选实体抽取，为 Codex 设计 Schema、抽样审核和暂存准入提供一个交付包。不要再拆成逐来源小任务，也不生成逐页定位表。

## 2. 必读文件

1. `PROJECT_CHARTER.md`；
2. `docs/阶段0_研究与数据规范.md`；
3. `docs/外部AI任务分工与交接手册.md`；
4. `docs/外部AI执行工作流与自检手册.md`；
5. `docs/阶段2_试点来源与作品选择.md`；
6. `data/catalog/SOURCE_REGISTRY.csv`；
7. `data/catalog/SOURCE_ID_MAP_V1_S2.csv`；
8. `work/external-ai/reviews/V1-S2-003-A_R1_PM_REVIEW.md`；
9. `work/external-ai/deliveries/V1-S2-003A_试点材料页段定位_交付/MATERIAL_ACCESS_LOG.csv`；
10. `work/external-ai/deliveries/V1-S2-003A_试点材料页段定位_交付/WORK_SOURCE_MATRIX.csv`；
11. `work/external-ai/deliveries/V1-S1-003_正式来源ID回填_交付/ENTITY_CANDIDATES.csv`（仅用于查重）。
12. `work/external-ai/新外部AI_项目接管与首任务提示词.md`；
13. `work/external-ai/后续任务安排_新外部AI.md`。

## 3. 固定来源与作品

只处理：`SRC-0002`、`SRC-0007`~`SRC-0013`。

只围绕：`El Aleph`、`El jardín de senderos que se bifurcan`、`Ficciones`、`Água viva`、`A hora da estrela`、`Laços de família`。

所有新成果只用正式 `SRC-` ID；legacy `DISC-` ID 只可在 HANDOFF 的迁移说明中出现。

## 4. 连续执行的三个工作单元

### A. 来源级材料整理

- 每个来源在 `SOURCE_NOTES.md` 建一个来源标题；保存正式来源 ID、精确题名、作者/机构、URL/DOI、涉及作品、可确认事实、限制和中文释义。
- 来源最低定位到书名、论文名或网页标题与 URL；不要求页码、章节、逐页锚点或 DOM locator。
- `SRC-0007` 只做书目/生平交叉信息，不将其提升为文学解释来源。
- `SRC-0008` 可把 15 页论文作为一个整体研究单元。
- `SRC-0009` 只整理与三部试点作品直接相关的 IMS 页面。
- `SRC-0010`~`0013` 只整理与六部作品直接相关的摘要、正文内容单元和书目信息。

### B. SRC-0002 两篇作品的窄范围处理

- 从用户本地原件 `N1阅读材料/拉丁美洲文学教程 阅读篇 (郑书九主编) (z-library.sk, 1lib.sk, z-lib.sk).pdf` 中识别 UNIDAD 8 的 `El jardín de senderos que se bifurcan` 与 `El Aleph` 两个正文单元。
- 可做必要的临时 OCR 以理解正文，但交付包不得保存原 PDF、整篇西语正文或逐页 OCR；只交付中文释义、人物/地点/作品等候选和必要的极短证据说明。
- 核心正文止于 Bibliografía 之前；参考文献可用于发现书目，但不是必处理内容。
- 不要求把 PDF 页码偏移写入成果。

### C. 候选实体抽取与查重

- 从 `SOURCE_NOTES.md` 和上述两篇作品处理中抽取候选实体；允许类型：`author`、`work`、`collection`、`character`、`place`、`institution`、`event`、`movement`、`theme`。
- 候选 ID 使用 `CAND-S2-ENT-0001` 起连续编号；不是正式实体 ID。
- 对照既有 387 条候选查重。疑似已有项仍可写入，但在 `issue_notes` 记录既有 candidate ID 或“需 Codex 合并”；不得自行合并正式实体。
- 只抽取来源明确出现或能够直接释义的信息，不建立关系，不把主题解释写成已确认事实。

## 5. 必须交付（8 项）

1. `README.md`
2. `STATUS.md`
3. `SOURCE_NOTES.md`
4. `ENTITY_CANDIDATES.csv`
5. `QA_REPORT.md`
6. `ISSUES.md`
7. `HANDOFF.md`
8. `MANIFEST.md`

`ENTITY_CANDIDATES.csv` 固定使用：

```text
task_id,candidate_id,entity_type,canonical_name_candidate,original_name,aliases,language,country_or_region,date_info,source_id,source_title,optional_locator,optional_evidence_note,confidence,issue_notes,extracted_by
```

`optional_locator` 可以留空。`optional_evidence_note` 以中文释义为主，不复制长句。

## 6. 验收门禁

1. `SOURCE_NOTES.md` 覆盖 8 个正式来源和 6 部作品，每个事实能回到来源 ID 与题名。
2. 候选表可标准解析，16 列，candidate ID 唯一；source_id 只能是 `SRC-0002`、`SRC-0007`~`SRC-0013`，source_title 必须与登记表一致。
3. 六部作品至少各有一个可用候选或明确说明“该来源只支持书目事实”；不为凑数制造候选。
4. 对已有候选做机械查重并报告 exact/possible/new 数量；无法确定的合并进入 ISSUES。
5. 不生成 `RELATION_CANDIDATES.csv`，不确认文学关系、主题关系或影响关系。
6. 交付目录恰为 8 个登记文件，不含 PDF、EPUB、原始资料、整篇 OCR、长摘录、Cookie、密钥或 `.DS_Store`。
7. 运行项目共享验证脚本 `--profile FULL` 并在 QA 写入实际命令、错误、警告和终态；另断言八来源、六作品、ID、列数、来源集合和目录安全。
8. QA 只写 Worker 自检结果，最终 `pass/revise/reject` 留给 Codex。

## 7. 禁止事项

- 不修改 `PROJECT_CHARTER.md`、`TASKS.md`、来源登记表、决策记录、既有交付包、主数据库或 GitHub。
- 不新增第九个来源，不分配正式实体或关系 ID，不进入 `data/staging`。
- 不绕过登录、付费墙、验证码、DRM 或访问限制。
- 不保存、公开或交付用户原件、整篇论文、整篇作品、整书 OCR 或大段原文。
- 不为了补页码、章节或 locator 扩大工作量。
- 不覆盖或改写 WorkBuddy 的历史交付包、REVIEW 或署名；新成果必须登记真实执行方与模型。

## 8. HANDOFF 只需回答

1. 八来源和六作品是否全部覆盖；
2. 候选总数及 exact/possible/new 查重数；
3. 哪些候选需要 Codex做语义或合并判断；
4. 共享验证脚本是否通过；
5. 是否满足进入 Codex 关键门禁审核的条件。
