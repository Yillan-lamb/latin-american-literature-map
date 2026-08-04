# V1-S2-003-A：试点材料合法访问与页段定位

- task_id: `V1-S2-003-A`
- parent_task: `V1-S2-003`
- assignment_id: `V1-S2-003-A-SCOPED-LOCATORS`
- task_type: `catalog / document inspection / scoped locator planning`
- assignee: `WorkBuddy`
- dependencies: `V1-S2-001 done`, `V1-S2-002 done`

## 任务目标

为两位作家、六部试点作品建立可复核的材料访问与页段定位表，供 Codex 派发后续窄范围 L2 整理任务。本任务只检查合法访问、文字层、目录/章节结构和作品相关页段，不复制长文、不下载整书、不做 OCR 正文、不做文学解释或关系抽取。

## 必读文件

1. `PROJECT_CHARTER.md`；
2. `docs/阶段0_研究与数据规范.md`；
3. `docs/外部AI任务分工与交接手册.md`；
4. `docs/阶段2_试点来源与作品选择.md`；
5. `work/external-ai/reviews/V1-S2-001-002-A_R2_PM_REVIEW.md`；
6. 本任务卡。

## 固定范围

作品：`El Aleph`、`El jardín de senderos que se bifurcan`、`Ficciones`、`Água viva`、`A hora da estrela`、`Laços de família`。

来源仅限：SRC-0002、DISC-BOR-002、DISC-BOR-004、DISC-LIS-003、DISC-LIS-004、DISC-LIS-005、DISC-LIS-009、DISC-LIS-010。具体 URL 从已通过的 R2 候选表读取，不得自行加入第九个来源。

## 必须交付（9 项）

1. `README.md`、`STATUS.md`、`QA_REPORT.md`、`ISSUES.md`、`HANDOFF.md`、`MANIFEST.md`；
2. `MATERIAL_ACCESS_LOG.csv`：八个来源的访问、格式、文字层、页数/栏目、权利和限制；
3. `SECTION_LOCATORS.csv`：每个相关章节/页段的来源 ID、作品、标题、起止页或网页锚点、定位依据、建议处理深度；
4. `WORK_SOURCE_MATRIX.csv`：六部作品与八个来源的覆盖矩阵。

## 固定字段

`MATERIAL_ACCESS_LOG.csv`：

```text
source_ref,title,url,accessed_at,access_result,format,text_layer,page_or_section_count,rights_note,local_copy_created,recommended_next_action,notes
```

`SECTION_LOCATORS.csv`：

```text
locator_id,source_ref,target_author,target_work,section_title,start_locator,end_locator,locator_type,relevance_basis,proposed_depth,confidence,manual_check_needed,notes
```

`WORK_SOURCE_MATRIX.csv`：

```text
target_author,target_work,publication_year,source_ref,coverage_type,locator_ids,usable_now,limitation
```

## 执行规则

- 先对每个来源做 L0：能否访问、是否为正确落地页、文件/网页格式、是否有文字层、页数或栏目数。
- 只定位与六部作品直接相关的章节、摘要、目录项或页段；不得从标题推断不存在的内容。
- `SRC-0002` 只读取既有本地 OCR 和页码锚点，不复制 `inputs/`，不扩展原书 OCR 范围。
- 对公开 PDF 可在线查看目录、搜索和页码，但本任务不得把完整 PDF 保存进交付目录；`local_copy_created` 必须为 `no`。
- `proposed_depth` 只可为 `metadata_only`、`L1_locator_only`、`scoped_L2_candidate`、`do_not_process`。
- 若一个来源无法提供稳定页码，使用网页标题、章节标题或 DOM/段落锚点，并在 `locator_type` 说明。
- 不复制超过核验所需的短句；`relevance_basis` 只写“标题/目录/摘要明确提到某作品”等机械事实。

## 验收标准

1. 八个来源不重不漏，六部作品全部至少关联一个来源；
2. 所有 URL 实际访问并记录结果，无法访问的来源如实标记；
3. 每条定位可由页码、章节标题或稳定网页栏目回查；
4. 不把整篇文章或整本论文默认列为 L2，必须缩到必要章节/页段；
5. 三张 CSV 可标准解析、ID 唯一、枚举合法、引用完整；
6. 交付目录恰为 9 个文件，无 PDF、EPUB、原始资料、长摘录、Cookie、密钥或 `.DS_Store`；
7. 不修改章程、TASKS、来源注册表、候选任务包、决策记录、CHANGELOG 或 GitHub；
8. 终态写 `done`、`blocked` 或 `failed`，不得自行宣告项目经理验收通过。

## 禁止事项

- 不下载整书、整篇论文或付费内容；不绕过登录、验证码、付费墙、DRM 或地区限制。
- 不做正文 OCR、全文翻译、摘要改写、文学价值判断、主题推断、实体/关系抽取。
- 不分配 `SRC-`、实体或关系正式 ID。
