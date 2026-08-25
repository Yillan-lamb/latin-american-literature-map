# V1-S2-001-002-A：博尔赫斯与李斯佩克朵试点来源候选清单

- task_id: `V1-S2-001-002-A`
- parent_tasks: `V1-S2-001`, `V1-S2-002`
- assignment_id: `V1-S2-001-002-A-PILOT-SOURCE-DISCOVERY`
- task_type: `catalog / web source verification`
- assignee: `WorkBuddy`
- dependencies: `V1-S1-007 done`
- targets: `豪尔赫·路易斯·博尔赫斯`, `克拉丽丝·李斯佩克朵`

## 任务目标

为阶段 2 双作家知识模型试点建立一个可核验的候选来源池，供 Codex 最终选择约 6 部作品的试点材料。你只负责来源发现、书目核验、访问状态和版权/取得方式记录；不做文学解释、全文下载、OCR、候选实体或关系抽取，也不分配正式 `SRC-` ID。

李斯佩克朵部分必须优先补足葡萄牙语来源缺口。博尔赫斯部分应优先利用权威书目、图书馆、出版社、大学或作家研究机构，并说明与现有 `SRC-0002` 西语选文的互补关系。

## 必读文件

1. `project/governance/PROJECT_CHARTER.md`；
2. `project/archive/阶段0_研究与数据规范.md`；
3. `project/ai/外部AI任务分工与交接手册.md` 的 G 类任务规范；
4. `project/audits/research/阶段1_首批资料汇总与缺口报告.md`；
5. `data/catalog/SOURCE_REGISTRY.csv`；
6. 本任务卡。

## 输出目录

新建：

`work/external-ai/deliveries/V1-S2-001-002A_试点来源候选清单_交付/`

不得覆盖任何既有任务包。

## 必须交付

共 9 个文件：

1. `README.md`、`STATUS.md`、`QA_REPORT.md`、`ISSUES.md`、`HANDOFF.md`、`MANIFEST.md`；
2. `PILOT_SOURCE_CANDIDATES.csv`：候选来源明细；
3. `PILOT_SOURCE_SUMMARY.md`：两位作家各自的来源覆盖、可取得性和风险摘要，不超过 1,500 个中文字；
4. `ACCESS_PLAN.csv`：把候选分为“可直接合法访问”“需用户提供/购买/借阅”“仅作发现线索”。

## 候选数量与覆盖要求

- 每位作家至少 8 条候选来源，总计至少 16 条；同一出版物的重复网页不得凑数。
- 每位作家至少包含：2 条 A 级候选、3 条 B 级候选；其余可为 C/D 级线索。
- 李斯佩克朵至少 5 条葡萄牙语来源，其中至少 2 条来自巴西图书馆、出版社、大学、档案馆或作家研究机构。
- 每位作家须覆盖至少 3 部明确命名的作品，并说明哪个候选来源可以核验作品书目、原文或研究背景；“覆盖”只表示来源适合核验，不表示已取得全文。
- 网络页面必须实际打开，不得用搜索结果摘要代替页面内容。

## PILOT_SOURCE_CANDIDATES.csv 固定列

```text
candidate_id,target_author,language,title,original_title,author_or_editor,source_type,publisher_or_institution,publication_year,isbn_doi_or_catalog_id,url,page_title,accessed_at,proposed_source_level,covered_works,coverage_role,access_status,rights_or_access_note,proposed_processing,verification_notes
```

填写规则：

- `candidate_id` 只用 `DISC-BOR-001...` 或 `DISC-LIS-001...`，不得使用 `SRC-`。
- `proposed_source_level` 只可为 A/B/C/D，且只是建议，最终等级由 Codex 决定。
- `access_status` 只可为 `open_access`、`catalog_only`、`preview_only`、`purchase_or_borrow`、`discovery_only`、`unavailable`。
- `proposed_processing` 只可为 `bibliographic_verification`、`web_evidence`、`user_acquisition_then_L1`、`user_acquisition_then_scoped_L2`、`discovery_only`。
- 页面标题、机构、URL、访问日期必须完整；打不开的链接仍保留并在 `ISSUES.md` 记录。
- 不复制长段原文；`verification_notes` 只写书目或访问核验事实。

## ACCESS_PLAN.csv 固定列

```text
candidate_id,target_author,access_bucket,required_user_action,recommended_priority,reason,next_codex_decision
```

- `access_bucket` 只可为 `legal_open_access`、`user_supply_purchase_or_borrow`、`discovery_only`。
- `recommended_priority` 只可为 `high`、`medium`、`low`。
- 不得把目录页、试读页或搜索摘要误写为已取得全文。

## 来源优先级

优先检索并打开：出版社、国家/大学图书馆、大学出版社、大学研究中心、作家基金会或档案馆、DOI/Crossref 等权威目录。普通百科、电商和无署名网页只能作发现线索，不能覆盖权威书目。

## 必须验证

1. 两位作家各至少 8 条候选，ID 唯一，固定列完整且 CSV 可标准解析；
2. 李斯佩克朵至少 5 条葡语来源，且机构类型满足要求；
3. 每位作家至少覆盖 3 部命名作品，并能回指候选行；
4. 每个 URL 均记录实际访问结果、页面标题、机构和访问日期；抽查至少每位作家 5 条；
5. 来源等级建议与阶段 0 A/B/C/D 定义一致；
6. `ACCESS_PLAN.csv` 中每个 candidate_id 都存在于候选表，且不得出现未登记 ID；
7. 目录不得含 PDF、EPUB、下载全文、OCR、`inputs/`、Cookie、账号、密钥或 `.DS_Store`；
8. 确认没有修改 `project/governance/PROJECT_CHARTER.md`、`project/tasks/TASKS.md`、来源登记表、既有任务包、决策记录、CHANGELOG 或 GitHub。

## 禁止事项

- 禁止从 Z-Library、网盘、盗版站或其他未授权来源下载、链接或推荐书籍全文。
- 禁止绕过登录、付费墙、DRM、地区限制或访问控制。
- 禁止做文学价值判断、影响关系推断、人物消歧或关系抽取。
- 禁止自行决定最终试点来源、正式来源等级或正式 `SRC-` ID。
- 禁止执行 Git 提交或 GitHub 上传。

## 过程要求

- 开始、约 50%、结束时更新 `STATUS.md`；
- 书目冲突、链接失效、访问限制和版权不明项进入 `ISSUES.md`；
- 完成后更新 `QA_REPORT.md`、`HANDOFF.md`、`MANIFEST.md`；
- 终态只可为 `done`、`blocked` 或 `failed`。
