# 拉丁美洲文学地图：V1 统一任务源

版本：1.0.1

任务状态权威来源：本文件

最后更新：2026-08-11

最高治理文件：`project/governance/PROJECT_CHARTER.md`。本任务源只记录动态状态，任何任务或外部交接不得改变总章程；来源级证据、效率规则、V1 节点式 GitHub 自动发布及 N3 关系门槛调整均已获用户明确授权，章程当前版本为 1.4.0。

## 当前执行摘要

- 当前阶段：V1.0.0 正式发布完成。
- 当前进度：USER 已批准 N4；阶段 5 最终一致性审计 pass，版本摘要、已知问题和正式发布说明均已形成。V1 为 74 来源、144 实体、76 经审核关系、40 hold、238 事实和 40 卡片。
- 当前任务：V1 已收口；后续新增关系进入 V1.1，网站、地图与展览交互进入 V2，须另行立项。
- 审计修订：V1.0.0 工作流审计已收口；`data/master/V1_MASTER.sqlite`、动态 QA、迁移入口和通用导出工具已建立，后续增量按《数据新增与版本维护操作手册》执行。
- 当前门禁：author→event 不建模；政治诗歌维持 3/1/1；阶段 3 的 29 个单来源解释关系仍全部 hold，不因 N3 通过而确定化。
- 证据最低标准：书籍到书名、论文到论文名、网页到页面标题和 URL；页码/章节可选。
- GitHub：`GIT-V1-S3`、`GIT-V1-N3`、`GIT-V1-N4` 均已完成；`v1-n3` 与 `v1.0.0` 构成候选版和正式版节点。

## 1. 状态规则

| 标记 | 状态 | 含义 |
|---|---|---|
| ✅ | done | 已完成并通过最低检查 |
| 🔵 | in_progress | 正在执行，必须有负责人和交接路径 |
| ⬜ | ready | 依赖满足，可领取 |
| ⏳ | blocked | 依赖或用户节点未满足 |
| 🟡 | review | 已交付，等待复核或整合 |
| ⚪ | deferred | 本版本延期 |

只有 Codex 项目经理可以修改本文件中的任务状态。其他 AI 在自己的 `STATUS.md` 记录进度，不直接修改本任务源。

## 2. 角色代码

- `USER`：用户节点审核；
- `CODEX-PM`：项目管理、规范、验收和 GitHub 收口；
- `CODEX-DATA`：Schema、数据库和整合；
- `EXT-OCR`：外部 AI OCR 与结构整理；
- `EXT-CATALOG`：外部 AI 来源建档与书目整理；
- `EXT-EXTRACT`：外部 AI 候选实体/关系抽取；
- `EXT-QA`：外部 AI 机械复核；
- `CODEX-REVIEW`：研究证据、语义与数据最终复核。

## 3. 阶段 0：章程与任务底座

### ✅ V1-S0-001：建立项目章程

- 负责人：`CODEX-PM`
- 产物：冻结总章程 `project/governance/PROJECT_CHARTER.md`；阶段 0 支持文档 `project/archive/v1-foundation/阶段0_项目章程.md`
- 验收：明确使命、V1 范围、成功标准、角色、节点和版权边界。

### ✅ V1-S0-002：建立研究、OCR、来源与数据规范

- 负责人：`CODEX-PM`
- 产物：`project/archive/v1-foundation/阶段0_研究与数据规范.md`（历史规范；当前增量执行以《数据新增与版本维护操作手册》为准）
- 验收：包含来源等级、来源级证据、可选 OCR 页码锚点、候选数据、受控词表、QA 和退回条件。

### ✅ V1-S0-003：建立统一任务源和编号规则

- 负责人：`CODEX-PM`
- 产物：`project/tasks/TASKS.md`
- 验收：阶段、依赖、负责人、交付物和验收标准可追溯。

### ✅ V1-S0-004：建立外部 AI 工作包与模板

- 负责人：`CODEX-PM`
- 产物：`project/ai/外部AI任务分工与交接手册.md`、`templates/external-ai/`
- 验收：用户可以把任务文档和模板直接交给其他 AI 开工。

### ✅ V1-S0-005：形成 N1 范围基线审核包

- 负责人：`CODEX-PM`
- 产物：`project/archive/v1-foundation/N1_范围基线审核包.md`
- 验收：用户只需对范围、名单、主题、资料策略和分工做节点决定。

### ✅ V1-S0-006：建立 V1 节点式 GitHub 自动发布规则

- 负责人：`CODEX-PM`
- 用户授权：2026-08-10 明确批准修改 `project/governance/PROJECT_CHARTER.md`。
- 产物：章程 1.3.0、DEC-031、GitHub 节点与 fail-closed 门禁。
- 自动节点：`GIT-V1-S3`、`GIT-V1-N3`、`GIT-V1-N4`；普通任务不单独上传。

## 4. N1：范围基线

### ✅ V1-N1-001：用户审核范围基线

- 负责人：`USER`
- 依赖：V1-S0-001 至 V1-S0-005
- 输入：`project/archive/v1-foundation/N1_范围基线审核包.md`
- 决定：批准、批准并提出调整、暂不批准。
- 通过后解锁：阶段 1 全部任务。
- 审核结果：用户于 2026-08-04 批准按建议范围执行；结论见 `project/archive/v1-foundation/N1_审核结论.md`。

## 5. 阶段 1：资料接收、盘点和 OCR

### 首批交付证据与正式编号

- 证据包：`N1-OCR-001` R2；Codex 独立复检结论为 `pass`（2026-08-04）。
- 支持任务：`V1-S1-001`、`V1-S1-003`、`V1-S1-004`、`V1-S1-005`。
- 公开验收摘要：`project/audits/research/N1-OCR-001_R2验收摘要.md`。
- 正式编号：`SRC-0001`~`SRC-0006`；登记表见 `data/catalog/SOURCE_REGISTRY.csv`。
- 当前约束：正式 ID 回填及 Codex 独立复核均已通过；候选可进入后续整合准备流程，但不自动写入 `data/staging` 或主数据库。

### ✅ V1-S1-001：建立首批资料接收清单

- 负责人：`EXT-CATALOG`
- 依赖：V1-N1-001；用户提交第一批资料
- 输入：用户提供的文件目录，不要求先阅读全文
- 产物：`SOURCE_MANIFEST.csv`、`STATUS.md`、`ISSUES.md`、`HANDOFF.md`
- 验收：每个文件有临时序号、文件名、格式、页数/大小、语言、疑似题名、处理建议和敏感性标记。
- 完成证据：`N1-OCR-001` R2 已通过复检；6 份资料清单完整。

### ✅ V1-S1-002：分配正式来源 ID

- 负责人：`CODEX-PM`
- 依赖：V1-S1-001
- 产物：正式来源编号表
- 验收：同一版本不重复编号，不同版次/译本分别编号。
- 完成结果：按接收顺序分配 `SRC-0001`~`SRC-0006`；产物为 `data/catalog/SOURCE_REGISTRY.csv`。

### ✅ V1-S1-003：逐份建立来源档案

- 负责人：`EXT-CATALOG`
- 依赖：V1-S1-002
- 执行：每个来源一个子任务包
- 产物：`SOURCE_RECORD.md`、书目信息与来源说明、QA 和 HANDOFF 信息
- 验收：核心书目信息能回到具体书籍/论文/网页来源，无法确认项进入问题清单；页码不是强制项。
- 已通过内容：`N1-OCR-001` R2 的六份来源档案已通过内容复检。
- 正式 ID 回填：`V1-S1-003-N1-BACKFILL` 交付已于 2026-08-04 通过 Codex 项目经理验收；映射、数量、引用完整性及 R2 规范化差分均通过。
- 派单目录：`work/external-ai/V1-S1-003_正式来源ID回填/`。
- 本地验收记录：`work/external-ai/reviews/V1-S1-003-N1-BACKFILL_PM_REVIEW.md`。

### ✅ V1-S1-004：进行文字层和 OCR 可用性检查

- 负责人：`EXT-OCR`
- 依赖：V1-S1-002
- 产物：每份来源的可读性、版式、语言、来源范围和 OCR 等级建议；页码仅在现成可得时记录
- 验收：明确 L0/L1/L2/L3 建议，不自行扩大到全文 OCR。
- 完成证据：六份来源的文字层、版式、语言和 OCR 层级建议已通过 R2 复检。

### ✅ V1-S1-005：执行目录、版权页和指定页 OCR

- 负责人：`EXT-OCR`
- 依赖：V1-S1-004；任务卡明确页段
- 产物：`OCR.md`、`QA_REPORT.md`、`ISSUES.md`、`HANDOFF.md`、`MANIFEST.md`
- 验收：来源和任务范围清楚，专名/年份/数字抽查，正文未被改写；页码锚点仅在任务卡明确要求时检查。
- 完成证据：四本 PDF 的 L1 页面及两本 EPUB 摘要已通过 R2 复检。

### ✅ V1-S1-006：阶段 1 外部成果机械复核

- 负责人：`CODEX-REVIEW`（用户批准由 Codex 执行复核）
- 依赖：相应 OCR/建档任务交付
- 约束：Reviewer 不得审核自己完成的任务
- 产物：独立 `REVIEW.md`
- 验收：给出 `pass`、`revise` 或 `reject`，列出可定位的问题。
- 完成结果：Codex 作为与 WorkBuddy 回填者分离的 Reviewer 已结束只读复核，结论 `pass`。
- 交付目录：`work/external-ai/deliveries/V1-S1-006_正式ID回填独立复核_交付/`。

### ✅ V1-S1-007：阶段 1 汇总与缺口报告

- 负责人：`CODEX-PM`
- 依赖：首批 S1 任务完成
- 产物：来源目录、资料覆盖矩阵、OCR 缺口和阶段摘要
- 验收：所有结果可回到任务 ID 和来源 ID，不把原始资料提交公开仓库。
- 完成结果：支持子任务 `V1-S1-007-A` R1 已通过 Codex 独立复检；阶段汇总、缺口判断和后续处置已形成。
- 子任务卡：`work/external-ai/V1-S1-007A_首批资料覆盖矩阵初稿/`。
- 子任务状态：R0 结论 `revise`；R1 于 2026-08-04 复检结论 `pass`。
- 返修单：`work/external-ai/reviews/V1-S1-007-A_PM_REVIEW.md`。
- R1 验收：`work/external-ai/reviews/V1-S1-007-A_R1_PM_REVIEW.md`。
- 阶段报告：`project/audits/research/阶段1_首批资料汇总与缺口报告.md`。

## 6. 阶段 2：知识模型试点

### ✅ V1-S2-001：选择博尔赫斯试点资料

- 负责人：`CODEX-PM`
- 依赖：阶段 1 首批汇总
- 产物：试点来源清单和任务卡
- 当前工作：与 `V1-S2-002` 合并派发支持任务 `V1-S2-001-002-A`，由 WorkBuddy 建立合法、权威、可核验的候选来源池；最终选择保留给 Codex。
- 任务卡：`work/external-ai/V1-S2-001-002A_试点来源候选清单/`。
- 子任务状态：R2 已通过 Codex 独立复检；博尔赫斯正式选择《阿莱夫》《小径分岔的花园》《虚构集》三部试点作品，并完成候选等级核定。
- 返修单：`work/external-ai/reviews/V1-S2-001-002-A_PM_REVIEW.md`。
- R1 复检：`work/external-ai/reviews/V1-S2-001-002-A_R1_PM_REVIEW.md`。
- R2 提示词：`work/external-ai/V1-S2-001-002A_试点来源候选清单/R2_REVISION_PROMPT.md`。
- R2 验收：`work/external-ai/reviews/V1-S2-001-002-A_R2_PM_REVIEW.md`。
- 选择记录：`project/audits/research/阶段2_试点来源与作品选择.md`。

### ✅ V1-S2-002：选择李斯佩克朵试点资料

- 负责人：`CODEX-PM`
- 依赖：阶段 1 首批汇总
- 产物：试点来源清单和任务卡
- 当前工作：同 `V1-S2-001-002-A`；优先补入葡语权威来源，解决阶段 1 的葡语覆盖缺口。
- 任务卡：`work/external-ai/V1-S2-001-002A_试点来源候选清单/`。
- 子任务状态：R2 已通过；正式选择《活水》《星辰时刻》《家庭纽带》三部试点作品。9 条葡语来源、7 个巴西机构达到阶段 2 补强要求。

### ✅ V1-S2-003：试点材料文本整理与来源级引用

- 负责人：`EXT-OCR`
- 依赖：V1-S2-001、V1-S2-002
- 产物：约 6 部作品相关的来源级 L2 文本整理交接包
- 验收：每项内容关联来源 ID 和来源题名，可直接用于候选抽取；不强制页码或逐页锚点。
- 已完成子任务：`V1-S2-003-A` R1 于 2026-08-09 通过。共享脚本、三表结构、18 个唯一 locator、零悬空引用、六作品覆盖和目录安全全部通过；既有页段数据只作增强信息。
- 任务卡：`work/external-ai/V1-S2-003A_试点材料页段定位/README.md`。
- 外部 AI 提示词：`work/external-ai/V1-S2-003A_试点材料页段定位/PROMPT_TO_WORKBUDDY.md`。
- 验收记录：`work/external-ai/reviews/V1-S2-003-A_PM_REVIEW.md`。
- R1 差量提示词：`work/external-ai/V1-S2-003A_试点材料页段定位/R1_REVISION_PROMPT.md`。
- R1 验收：`work/external-ai/reviews/V1-S2-003-A_R1_PM_REVIEW.md`。
- 正式来源：`SRC-0007`~`SRC-0013`，映射见 `data/catalog/SOURCE_ID_MAP_V1_S2.csv`。
- 后续执行粒度：`V1-S2-003` 的来源级 L2 整理与 `V1-S2-004` 的机械候选抽取已合并为 `V1-S2-003-004-B`；Codex只在语义样本、查重冲突和暂存准入门禁复核。
- 当前执行方：`EXT-AI-02`（临时代号；首份 README/STATUS 必须登记真实供应方和模型）。WorkBuddy 不再领取新任务，历史交付保持原署名。
- 接管提示词：`project/ai/新外部AI_项目接管与首任务提示词.md`。
- 后续路线图：`project/ai/后续任务安排_新外部AI.md`。
- 完成结果：`V1-S2-003-004-B` R0 于 2026-08-10 通过关键门禁；八来源笔记和六作品摘要可用于候选层研究。
- 验收记录：`work/external-ai/reviews/V1-S2-003-004-B_PM_REVIEW.md`。

### ✅ V1-S2-004：机械抽取候选实体与书目信息

- 负责人：`EXT-EXTRACT`
- 依赖：`V1-S2-003-A` 已通过；与 `V1-S2-003` 剩余来源整理在同一里程碑包内按顺序执行
- 产物：`ENTITY_CANDIDATES.csv`、`ISSUES.md`、`HANDOFF.md`
- 验收：只抽取文本明确出现的信息，不推断影响关系；每条至少关联来源 ID 和来源题名，页码可空。
- 合并任务卡：`work/external-ai/V1-S2-003-004B_试点来源整理与候选抽取/README.md`。
- 有效启动提示词：`project/ai/新外部AI_项目接管与首任务提示词.md`。
- 完成结果：EXT-AI-02（ZCode / deepseek-v4-flash，版本 unknown）交付 122 条唯一候选，共享 FULL 验证和 Codex语义抽样通过；候选暂不进入 `data/staging`。
- 验收记录：`work/external-ai/reviews/V1-S2-003-004-B_PM_REVIEW.md`。

### ✅ V1-S2-005：设计试行 Schema 和受控词表

- 负责人：`CODEX-DATA`
- 依赖：V1-S2-003
- 产物：Schema、数据字典、迁移规则草案
- 当前重点：区分 `work`、`collection`、`edition`、`adaptation`，形成去重、证据关联和候选转暂存规则。
- 完成结果：形成 N2 前 `0.1-draft`，包括实体分层、11 个允许关系词、证据/置信度规则、规范化种子和候选迁移门禁。
- 产物：`docs/data/阶段2_试行Schema与迁移规则.md`。

### ✅ V1-S2-006：提取并审核 20—30 条试点关系

- 负责人：`CODEX-REVIEW`
- 依赖：V1-S2-004、V1-S2-005
- 产物：证据化关系样例、争议清单和中文摘要样稿
- 外部支持任务：`V1-S2-006-A`，由 EXT-AI-02 生成关系候选、事实候选、内容卡草稿和证据覆盖表；Codex保留最终语义与暂存准入权。
- 任务卡：`work/external-ai/V1-S2-006A_试点关系候选与内容事实包/README.md`。
- 启动提示词：`work/external-ai/V1-S2-006A_试点关系候选与内容事实包/PROMPT_TO_EXT_AI_02.md`。
- R0 状态：2026-08-10 结论 `revise`，机械结构通过，关系语义与过程统计需窄范围 R1。
- R0 验收：`work/external-ai/reviews/V1-S2-006-A_PM_REVIEW.md`。
- R1 提示词：`work/external-ai/V1-S2-006A_试点关系候选与内容事实包/R1_REVISION_PROMPT.md`。
- R1 完成：2026-08-10 复检 `pass`；27 条关系候选/26 组、49 条事实、8 张内容卡和覆盖表通过门禁。
- R1 验收：`work/external-ai/reviews/V1-S2-006-A_R1_PM_REVIEW.md`。

### ✅ V1-S2-007：生成 SQLite/CSV/JSON 试点包

- 负责人：`CODEX-DATA`
- 依赖：V1-S2-006
- 产物：试点数据库、审核表、JSON 和一致性报告
- 当前执行：外部支持任务 `V1-S2-007-A` 只做 PRE 层机械预组装；`CODEX-DATA` 负责复核、正式暂存 ID、最终 SQLite/CSV/JSON 和 N2 包。
- 外部任务卡：`work/external-ai/V1-S2-007A_试点数据包预组装/README.md`。
- 启动提示词：`work/external-ai/V1-S2-007A_试点数据包预组装/PROMPT_TO_EXT_AI_02.md`。
- 外部支持任务状态：2026-08-10 R0 `pass`；28 个 PRE 实体、26 个关系组、27 条证据、49 条事实、8 张卡片和 8 个来源三格式一致。
- 验收记录：`work/external-ai/reviews/V1-S2-007-A_PM_REVIEW.md`。
- Codex 收口：只迁移 15 个 eligible 关系组；11 个 hold 继续留在候选层。N2 新增 1949 年作品集《阿莱夫》结构型简卡，最终试点卡片为 9 张。
- 完成：2026-08-10；生成 `data/staging/v1_s2_pilot/`，包含 28 个实体、15 个 N2 可审核关系、11 个 hold、52 条事实、9 张卡片、11 个来源及 CSV/JSON/SQLite。
- 验证：引用完整、SQLite integrity/FK 通过、JSON 与 SQLite 可重复构建；一致性报告见暂存目录。

## 7. N2：模型试点审核

### ✅ V1-N2-001：用户审核试点模型

- 负责人：`USER`
- 依赖：V1-S2-007
- 决定：Schema、关系粒度、证据标准和中文风格是否通过。
- 审核包：`project/archive/v1-foundation/N2_知识模型试点审核包.md`。
- 结论：用户于 2026-08-10 按建议通过；冻结 V1 Schema 0.2，新增 `DIRECTED`，保持解释性关系原则上双来源和来源级定位。
- 结果：阶段 3 已解锁。

## 8. 阶段 3：多批次研究

### ✅ V1-S3-001：生成作家/来源批次矩阵

- 负责人：`CODEX-PM`
- 依赖：V1-N2-001
- 产物：每批 2—3 位作家或 2—3 本书的任务分组、依赖和 Agent 路由。
- 完成：2026-08-10；矩阵见 `work/external-ai/阶段3_作家来源批次矩阵.csv`。
- 批次：B01 墨西哥三作家 9 部作品；B02 文学爆炸/加勒比三作家 9 部；B03 安第斯两作家 6 部。加上阶段 2 六部，合计 10 位作家、30 部作品。

### ✅ V1-S3-B01：墨西哥三作家研究里程碑

- 负责人：`EXT-AI-02`
- 依赖：V1-N2-001、V1-S3-001
- 作家：埃莱娜·加罗、罗萨里奥·卡斯特利亚诺斯、胡安·鲁尔福
- 作品：固定 9 部，详见任务卡
- 合并范围：来源发现与合法访问、来源笔记、实体/事实/关系候选、内容卡事实草稿、批内查重和覆盖统计
- 任务卡：`work/external-ai/V1-S3-B01_墨西哥三作家研究里程碑/README.md`
- 启动提示词：`work/external-ai/V1-S3-B01_墨西哥三作家研究里程碑/PROMPT_TO_EXT_AI_02.md`
- 完成：2026-08-10 R0 `pass`；15 来源、44 实体、81 事实、31 关系组、12 卡片通过门禁。
- 验收：`work/external-ai/reviews/V1-S3-B01_PM_REVIEW.md`。
- 分层：24 个 eligible 进入 Codex 暂存审核；7 个单来源解释关系继续 hold。

### ✅ V1-S3-B02：文学爆炸与加勒比三作家里程碑

- 负责人：`EXT-AI-02`
- 依赖：V1-S3-B01 Codex gate pass
- 作家：加西亚·马尔克斯、胡利奥·科塔萨尔、阿莱霍·卡彭铁尔
- 作品：固定 9 部，见阶段 3 批次矩阵
- 任务卡：`work/external-ai/V1-S3-B02_文学爆炸与加勒比三作家里程碑/README.md`
- 启动提示词：`work/external-ai/V1-S3-B02_文学爆炸与加勒比三作家里程碑/PROMPT_TO_EXT_AI_02.md`
- 状态：2026-08-10 R0 `revise`；同日 R1 `pass`，任务完成。
- R0 返修单：`work/external-ai/reviews/V1-S3-B02_PM_REVIEW.md`。
- R1 验收：`work/external-ai/reviews/V1-S3-B02_R1_PM_REVIEW.md`。
- 完成结果：15 来源、43 实体、68 事实、34 关系组、12 卡片通过门禁；19 个关系进入后续暂存审核，15 个单来源解释关系继续 hold。基础事实缺口留待阶段 4 集中补核。

### ✅ V1-S3-B03：安第斯与诗歌双作家里程碑

- 负责人：`EXT-AI-02`
- 依赖：V1-S3-B02 Codex gate pass
- 作家：马里奥·巴尔加斯·略萨、巴勃罗·聂鲁达
- 作品：固定 6 部，见阶段 3 批次矩阵
- 合并范围：来源发现与合法访问、来源笔记、实体/事实/关系候选、8 张内容卡事实草稿、跨批次查重和覆盖统计
- 任务卡：`work/external-ai/V1-S3-B03_安第斯与诗歌双作家里程碑/README.md`
- 启动提示词：`work/external-ai/V1-S3-B03_安第斯与诗歌双作家里程碑/PROMPT_TO_EXT_AI_02.md`
- 状态：2026-08-10 R0 `revise`；同日 R1 `pass`，任务完成。
- R0 返修单：`work/external-ai/reviews/V1-S3-B03_PM_REVIEW.md`。
- R1 验收：`work/external-ai/reviews/V1-S3-B03_R1_PM_REVIEW.md`。
- 完成结果：12 来源、31 实体、59 事实、23 个关系组、8 张卡片通过门禁；16 个关系进入后续暂存审核，7 个单来源解释关系继续 hold。

### ✅ V1-S3-006：阶段 3 汇总与公开边界审计

- 负责人：`CODEX-PM`
- 产物：`project/archive/v1-foundation/阶段3_多作家研究汇总与缺口报告.md`
- 结果：B01—B03 合计 42 来源、118 实体候选、208 事实、88 个关系组、32 张卡片草稿；阶段 2 和阶段 3 合计达到 10 位作家、30 部作品基线。
- Git 节点：`GIT-V1-S3` 门禁满足；只发布治理、书目级与结构化公开成果。

### ⏳ V1-S3-1XX：批次 OCR 与结构整理（循环任务）

- 负责人：`EXT-OCR`
- 依赖：相应批次任务卡
- 产物：标准 OCR 交接包

### ⏳ V1-S3-2XX：批次候选实体抽取（循环任务）

- 负责人：`EXT-EXTRACT`
- 依赖：相应 OCR 通过 QA
- 产物：候选实体、书目信息和明确事实表

### ⏳ V1-S3-3XX：批次候选关系和证据定位（循环任务）

- 负责人：能力合格的 `EXT-EXTRACT`；复杂解释由 `CODEX-REVIEW`
- 产物：候选关系、来源 ID 与来源题名、置信度和争议标记；详细 locator/短证据可选
- 验收：解释性关系不得只凭单一低等级来源。

### ⏳ V1-S3-4XX：批次独立复核（循环任务）

- 负责人：`EXT-QA` 或 `CODEX-REVIEW`
- 约束：不得由原 Worker 自审
- 产物：`REVIEW.md` 和修订要求

### ⏳ V1-S3-5XX：批次整合（循环任务）

- 负责人：`CODEX-DATA`
- 依赖：复核通过
- 产物：主数据库增量、导出物和变更摘要

## 9. 阶段 4：综合编目与内容深化

### ✅ V1-S4-A01：权威补证与兼容性研究包

- 负责人：`EXT-AI-02`
- 依赖：阶段 3 汇总完成
- 合并范围：B01—B03 基础事实权威补核、`BASED_ON_EVENT` 兼容性证据矩阵、政治诗歌作品级主题补证。
- 任务卡：`work/external-ai/V1-S4-A01_阶段4权威补证与兼容性研究包/README.md`
- 启动提示词：`work/external-ai/V1-S4-A01_阶段4权威补证与兼容性研究包/PROMPT_TO_EXT_AI_02.md`
- 边界：外部 AI 不修改 Schema、不分配正式 ID、不写 data/staging；Codex 在关键门禁裁决。
- R0 交付：2026-08-10；机械结构、来源抽检和安全边界通过，语义与 MANIFEST 存在 3 项可修复问题，结论 `revise`。
- R0 返修单：`work/external-ai/reviews/V1-S4-A01_PM_REVIEW.md`。
- R1 完成：2026-08-10；人物误并、标题级事件证据误标和 MANIFEST 表格/尺寸问题均已差量修复，六项重新验证通过。
- R1 验收：`work/external-ai/reviews/V1-S4-A01_R1_PM_REVIEW.md`。
- 准入分层：9 条 high 基础事实进入 Codex 全局规范化和暂存审核；`A01-FCT-0007` 继续 hold；`A01-FCT-0011` 仅作建模说明；事件关系只进入 N3 兼容性提案；政治诗歌维持 hold/gap。

### ✅ V1-S4-A02：全局机械规范化与开放目录补核

- 负责人：`EXT-AI-02`
- 依赖：`V1-S4-A01` R1 pass
- 合并范围：跨 S1、N2、B01—B03、A01 的译名/原名/别名候选、重复实体与来源、类型冲突、来源编号候选，以及 9 项有边界开放权威目录补核。
- 任务卡：`work/external-ai/V1-S4-A02_全局机械规范化与开放目录补核/README.md`
- 启动提示词：`work/external-ai/V1-S4-A02_全局机械规范化与开放目录补核/PROMPT_TO_EXT_AI_02.md`
- 边界：外部 AI 只生成候选、分组和映射建议；不得分配正式 `SRC-`/实体 ID，不得执行实体合并、类型定稿、Schema 修改或 staging 写入。
- R0 交付：2026-08-10；共享 FULL 与主体解析通过，但 gap 主键、首发语义、补核来源身份/编号联动、Dialnet 编号建议和 MANIFEST 表格需要差量修复，结论 `revise`。
- R0 返修单：`work/external-ai/reviews/V1-S4-A02_PM_REVIEW.md`。
- R1 提示词：`work/external-ai/V1-S4-A02_全局机械规范化与开放目录补核/R1_REVISION_PROMPT.md`。
- R1 完成：2026-08-10；9 个 gap/16 次尝试、上校双年份冲突、9 个补核来源候选、四条 BnF 稳定 ARK、Dialnet hold、类型/原名裁决与 MANIFEST 均完成差量修复。
- R1 验收：`work/external-ai/reviews/V1-S4-A02_R1_PM_REVIEW.md`；共享 FULL 和 Codex 59 条专门断言均通过，结论 `pass`。
- 后续裁决：56 条新来源进入 `SRC-0017`~`SRC-0072` 正式编号队列；两条同文复用既有主记录，三条 Dialnet 继续 hold；《上校》拆为 1958 杂志刊载与 1961 书版两个事实字段。正式写入由 Codex 后续执行。

### ✅ V1-S4-001：译名、原名和别名候选对照

- 负责人：`EXT-CATALOG`
- 产物：候选对照表及每项来源；最终合并由 Codex决定。
- 执行：已并入 `V1-S4-A02` 里程碑大包；以 A02 交付和 Codex 门禁结果收口。
- 完成结果：A02 R1 已通过；候选对照进入 Codex 后续正式映射与暂存准入审核。

### ✅ V1-S4-002：重复实体和重复来源机械检测

- 负责人：`EXT-QA`
- 产物：疑似重复清单，不自行删除。
- 执行：已并入 `V1-S4-A02` 里程碑大包；正式合并、来源编号和删除决定均保留给 Codex。
- 完成结果：A02 R1 已通过；机械重复与类型冲突候选收口，正式执行仍由 Codex负责。

### ✅ V1-S4-A03（原 V1-S4-003）：关系词统一与争议处理

- 负责人：`CODEX-REVIEW`、`CODEX-DATA`
- 依赖：`V1-S4-A02` R1 pass（已满足）
- 兼容性：评估 `BASED_ON_EVENT` 的端点、证据、迁移和向后兼容；未经用户节点不修改冻结 Schema 0.2。
- 启动范围：先完成 56 条新来源的正式编号与映射，再统一关系词、处理 29 个 hold 及 A01/A02 新增补证结果，形成 N3 兼容性提案。
- 完成结果：正式来源扩展至 `SRC-0072`；12 个关系词保持不变；阶段 3 的 29 个 hold 全部维持；恢复 1 个 `SET_IN` 候选；22 条事实裁决为 20/1/1；政治诗歌保持 3/1/1。
- 产物：`work/codex/V1-S4-A03_关系词统一与争议处理/`；验证脚本 `scripts/validate_v1_s4_a03.py` 结果 `pass`。
- 决策：`DEC-033`；`BASED_ON_EVENT` 提案留待 N3 用户节点，不修改 Schema 0.2。

### ✅ V1-S4-A04（原 V1-S4-004，并入 V1-S4-005 审计）：事实卡、内容卡与策展覆盖审计

- 负责人：`EXT-AI-02`（素材与机械审计）、`CODEX-REVIEW`（最终门禁）
- 依赖：`V1-S4-A03` pass（已满足）
- 合并范围：10 位作家、30 部核心作品的事实卡/内容卡素材；国家、语言、性别、时代、体裁、十大主题、来源最低标准与关系规模审计。
- 任务卡：`work/external-ai/V1-S4-A04_事实卡内容卡与策展覆盖审计/README.md`
- 启动提示词：`work/external-ai/V1-S4-A04_事实卡内容卡与策展覆盖审计/PROMPT_TO_EXT_AI_02.md`
- 边界：只使用已通过的本地成果，不新增检索；覆盖不足必须报告 gap，不得发明数据或把 legacy/hold 计入 eligible。
- R0 交付：2026-08-10；共享 FULL、40 卡固定范围、来源引用、关系与覆盖差距统计基本通过，但内容卡准入分栏、单来源解释措辞、《金鸡》日期字段、来源回填计数和 CARD-36 来源展示需窄范围修复，结论 `revise`。
- R0 返修单：`work/external-ai/reviews/V1-S4-A04_PM_REVIEW.md`。
- R1 完成：2026-08-10；准入分栏、单来源解释措辞、《金鸡》日期、来源计数和卡片来源清单完成窄范围修复；共享 FULL 与 Codex 专项复检通过。
- R1 验收：`work/external-ai/reviews/V1-S4-A04_R1_PM_REVIEW.md`，结论 `pass`。
- 完成结果：40 张目标卡、238 条事实素材、77 条卡片来源矩阵、22 条覆盖审计；关系规模如实为 75 eligible/accepted、40 hold、legacy 117，章程门槛差距 75。

### ✅ V1-S4-005：策展覆盖与平衡审计（已并入 V1-S4-A04）

- 负责人：`CODEX-PM`
- 验收：国家、语言、性别、时代、体裁和主题达到章程门槛。
- 政治诗歌：只接受明确指向具体作品的来源；作者总体风格不自动下推，单来源解释性候选继续 hold。
- 执行：随 A04 同包交付；以 A04 的 COVERAGE_AUDIT/COVERAGE_GAPS 和 Codex 门禁结果收口。

### ✅ V1-S4-A05：legacy 关系迁移审计与差量补证

- 负责人：`EXT-AI-02`（迁移候选与补证）、`CODEX-REVIEW`（准入门禁）
- 依赖：`V1-S4-A04` R1 pass（已满足）
- 合并范围：S1 legacy 117 条 Schema 0.2 逐行迁移审计；7 部 research_gap 每部最多 1—2 个合法开放 A 级入口；《消逝的足迹》1953 最多 2 个权威书目入口。
- 任务卡：`work/external-ai/V1-S4-A05_legacy关系迁移审计与差量补证/README.md`
- 启动提示词：`work/external-ai/V1-S4-A05_legacy关系迁移审计与差量补证/PROMPT_TO_EXT_AI_02.md`
- 边界：legacy 不整批平移；只统计去重后的净新增 eligible；解释性单来源继续 hold；外部 AI 不分配正式 ID、不改 Schema、不写 staging/主数据库。
- 后续：A05 通过后由 Codex 启动 A06 候选包组装；《上校》双字段在 A06 写入暂存候选，政治诗歌与 `BASED_ON_EVENT` 编入 N3 两张独立决策卡。
- R0 交付：2026-08-10；FULL、117 行可逆审计、165 端点、15 组关系与 75+0 预测通过，但 GAP-02 的同名短篇研究不能替代作品集级依据，GAP-06 的会议摘要未证明 A 级完整/同行评议论文身份，结论 `revise`。
- R0 返修单：`work/external-ai/reviews/V1-S4-A05_PM_REVIEW.md`；R1 只允许使用 GAP-02/GAP-06 各自剩余的第 2 次尝试预算，不重做 legacy 或重置其他补核预算。
- R1 完成：2026-08-10；GAP-02 降为短篇级 `partial_support`，GAP-06 降为 C 级摘要线索；两次 A2 分别为作品层级不足与访问受阻，未越过预算或访问边界。
- R1 验收：`work/external-ai/reviews/V1-S4-A05_R1_PM_REVIEW.md`，结论 `pass`。
- 完成结果：legacy 净新增 eligible=0，预测保持 75/150；唯一关闭的研究缺口为《金鸡》，其余 5 个 not_found、1 个 partial 和《消逝的足迹》hold 随 N3 缺口说明呈现。

### ✅ V1-S4-A06-A：V1 候选包 PRE 预组装与 N3 材料

- 负责人：`EXT-AI-02`（机械预组装）、`CODEX-REVIEW`（数据与语义门禁）
- 父任务：`V1-S4-006`
- 依赖：`V1-S4-A05` R1 pass（已满足）
- 任务卡：`work/external-ai/V1-S4-A06A_V1候选包预组装与N3材料/README.md`
- 启动提示词：`work/external-ai/V1-S4-A06A_V1候选包预组装与N3材料/PROMPT_TO_EXT_AI_02.md`
- 交付：PRE 实体引用、238 条事实素材、75/40 关系分层、关系证据与 legacy 附加证据、40 张卡、来源准入建议、缺口表、四项 N3 决策材料和同源 JSON。
- 边界：只组装既有通过成果；不研究、不补证、不分配正式 ID、不执行实体合并、不修改 Schema、不写 `data/`，不生成 SQLite/Excel 正式包。
- R0 交付：2026-08-10；11 张 CSV、同源 JSON、75/40 关系分层、A04 原文复制、legacy 零增量、N3 四项材料和目录安全通过，但 STATUS/QA 把事实分层 50/161/20/2/1/4 错写为 49/未列/20/2/1/3，ISSUES 将 0001/0003 的 A/A 等级误写为 A/C，结论 `revise`。
- R0 返修单：`work/external-ai/reviews/V1-S4-A06-A_PM_REVIEW.md`。
- R1 提示词：`work/external-ai/V1-S4-A06A_V1候选包预组装与N3材料/R1_REVISION_PROMPT.md`；只允许修改 STATUS、QA_REPORT、ISSUES、MANIFEST。
- R1 完成：2026-08-10；事实分层 50/161/20/2/1/2/1/1、237/238 来源覆盖、A05-SRC-0001/0003 的 A/A 等级和 22 项 MANIFEST 已修正，主体 18 项与 R0 零改动。
- R1 验收：`work/external-ai/reviews/V1-S4-A06-A_R1_PM_REVIEW.md`，共享 FULL 为 0 错误/0 警告，结论 `pass`。

### ✅ V1-S4-006：生成 V1 候选包

- 负责人：`CODEX-DATA`
- 依赖：`V1-S4-A06-A` Codex gate pass
- 完成结果：Codex 分配 `SRC-0073`、`SRC-0074`，保留 A05-SRC-0002 为 C 级线索；146 个 PRE 实体引用规范为 144 个 `V1-ENT` 候选，el Consejero 与历史人物保持分离。
- 产物：SQLite、Excel/CSV、JSON、数据字典、来源目录和质量报告。
- 交付目录：`data/staging/v1_candidate/`；17 张 CSV 与 JSON/SQLite/Excel 同源，另含数据字典、来源目录、质量报告、Excel QA、N3 审核包和 MANIFEST。
- 验证：`scripts/validate_v1_candidate.py` 结果 `pass`，0 错误/0 警告；SQLite integrity `ok`、外键错误 0；Excel 18 个工作表、公式错误 0。
- 决策：`DEC-036`、`DEC-037`。本包已按 N3 结论重建并冻结为 N4 前候选版；仍不等于 N4 正式发布。

## 10. N3：V1 候选版审核

### ✅ V1-N3-001：用户审核 V1 候选包

- 负责人：`USER`
- 依赖：V1-S4-006
- 决定：是否存在必须调整的方向性问题。
- 审核材料：`data/staging/v1_candidate/N3_审核包.md`、`V1_CANDIDATE.xlsx` 和 `QUALITY_REPORT.md`。
- 本节点只需决定 `N3-DEC-001~004`，不要求逐行审核；通过后才触发 `GIT-V1-N3`。
- 审核结果：USER 于 2026-08-11 回复 B/A/A/A；明确批准修改 `project/governance/PROJECT_CHARTER.md` 的 V1 关系门槛，并批准 Schema 加法兼容升级。
- 结论文件：`project/audits/research/N3_审核结论.md`；实施后 Schema 0.3、关系 76/75，author→event 不建模，政治诗歌维持 3/1/1。

## 11. 阶段 5：冻结与发布

### ✅ V1-S5-001：处理 N3 修订意见

- 负责人：`CODEX-PM`、`CODEX-DATA`、适配的外部 AI
- 完成结果：章程升级至 1.4.0；Schema 升级至 0.3；新增 `V1-REL-0076 BASED_ON_EVENT`；N3 四项决定写入数据包和缺口登记。

### ✅ V1-S5-002：运行最终一致性和引用审计

- 负责人：`CODEX-REVIEW`
- 完成结果：`project/audits/research/阶段5_最终一致性与引用审计.md`，结论 pass；四格式、外键、引用、Schema 和公开边界均通过。

### ✅ V1-S5-003：生成版本摘要和已知问题清单

- 负责人：`CODEX-PM`
- 产物：`docs/releases/V1_版本摘要.md`、`docs/releases/V1_已知问题.md`。

### ✅ V1-S5-004：同步决策记录、CHANGELOG 和 README

- 负责人：`CODEX-PM`
- 完成结果：TASKS、DEC-037/038、CHANGELOG、README 和接管提示词同步至 N4 候选状态。

## 12. N4：正式发布

### ✅ V1-N4-001：用户批准正式版本

- 负责人：`USER`
- 依赖：阶段 5 全部任务
- 审核材料：`docs/releases/V1_版本摘要.md`、`docs/releases/V1_已知问题.md`、`project/audits/research/阶段5_最终一致性与引用审计.md`。
- 完成结果：USER 于 2026-08-11 明确批准 V1-N4 正式发布，允许创建 `v1.0.0` 标签和 GitHub Release。

### ✅ V1-S5-005：创建 V1 标签并上传 GitHub

- 负责人：`CODEX-PM`
- 依赖：V1-N4-001
- 产物：`project/audits/research/N4_正式发布结论.md`、`v1.0.0` 标签和 GitHub Release。
- 完成结果：正式发布提交合并至 `origin/main`；`v1.0.0` 标签与 GitHub Release 构成 V1 权威发布点。

## 13. V1 发布后维护标准化

### ✅ V1-MNT-001：V1.0.0 工作流程审计修订与主库工具链基线

- 负责人：`CODEX-PM`、`CODEX-DATA`、`CODEX-REVIEW`
- 依赖：`V1-N4-001`、`V1-S5-005`
- 产物：`docs/data/数据新增与版本维护操作手册.md`、`project/audits/research/V1_工作流程审计摘要.md`、`project/governance/旧规则冲突与淘汰清单.md`、`data/master/`、`scripts/validate_master.py`、`scripts/apply_migration.py`、`scripts/export_from_sqlite.py`。
- 完成结果：V1.0.0 SQLite 以字节一致副本迁移为 `data/master/V1_MASTER.sqlite`；动态主库验证通过；CSV/JSON/XLSX 导出可重复生成；当前误导性实施文档已修正，历史章程、决策、REVIEW 和主体数据快照保持不变，快照说明文件仅作发布后口径修正并重收 MANIFEST。
- 验收：`validate_v1_candidate.py`、`validate_master.py` 均 pass；SQLite integrity/foreign key 检查通过；导出重复构建的 CSV、JSON、XLSX 字节一致。

## 14. 外部 AI 领取规则

1. 每次只领取一张明确任务卡，不从本文件自行挑选尚未解锁任务。
2. 开工前复制 `templates/external-ai/` 对应模板到任务目录。
3. 不修改本文件、主数据库、决策记录或 GitHub。
4. 完成后提交完整任务包，不接受只有聊天结论的交付。
5. Codex 根据 `HANDOFF.md`、QA、问题清单和成果文件决定通过、退回或整合。
6. 任务卡必须声明 `package_profile: LITE|FULL`；机械任务优先 LITE，高风险研究/OCR/数据库任务使用 FULL。
7. 返修采用差量模式；外部 AI 不得重做已通过范围。
8. 当前只有一名外部执行 AI 时仍采用单队列，但每张卡优先覆盖 2—4 个相邻机械子任务，形成一个里程碑任务包；状态只由 Codex 更新本文件。
9. Codex默认只审四个门禁：文件结构与安全、来源身份与覆盖、语义抽样与冲突、暂存/发布准入；页码和逐记录复核仅在抽样失败时升级。
