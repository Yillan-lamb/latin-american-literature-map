# 外部 AI 执行工作流与自检手册（拉丁美洲文学地图项目）

- 版本：`0.4.3`

> **用途**：本手册是“拉丁美洲文学地图”项目所有外部 AI Worker 的操作总纲，不绑定具体供应方。接任何新任务前先通读本手册，登记真实平台/模型，按流程执行并自检，避免被 Codex 反复返工。
> **适用范围**：V1 阶段外部派单（N1-*、V1-S1-*、V1-S2-* 等）。
> **权威层级**：用户明确指示 > `PROJECT_CHARTER.md` > 项目决策记录 > `docs/阶段0_研究与数据规范.md` > `TASKS.md` > 具体任务卡 > 本手册。任务卡不得突破总章程和研究规范。

---

## 一、任务总流程（8 步）

1. **读任务卡**：完整读取 `work/external-ai/<任务ID>/README.md`，确认任务类型、`execution_scope`、范围、交付物、固定字段、验证项、禁止事项。里程碑包可能连续完成 2—4 个相邻机械子任务，但不得越过任务卡边界。
2. **读必读文件**：按任务卡指定，一般含 `PROJECT_CHARTER.md`、`docs/阶段0_研究与数据规范.md`、`docs/外部AI任务分工与交接手册.md`、相关阶段报告、`data/catalog/SOURCE_REGISTRY.csv`、本手册。
3. **建任务清单**：用 TaskCreate 拆解（读文件 / 主体工作 / 生成交付物 / 验证收尾），逐项推进。
4. **执行**：严格完成任务卡列出的整个里程碑范围；不自行扩展到卡外，也不自行做保留给 Codex 的决策（试点、正式等级、关系确认、入库等写进 ISSUES）。
5. **生成交付物**：按任务卡的 `package_profile` 交付。LITE 使用 README + 主体成果 + 合并 HANDOFF；FULL 使用完整过程文档。
6. **自检**（**必做，交付前**）：先运行 `scripts/validate_external_delivery.py`，再按任务卡补充专门断言；LITE 写入 HANDOFF，FULL 写入 QA_REPORT。
7. **交付**：新建 `work/external-ai/deliveries/<任务ID>_<主题>_交付/`（不得覆盖既有包、不得复制 inputs/ 除非任务卡要求）；完成后在**对话框**发一段「可直接复制发给 Codex 的审计提示词」（**精简原则见第五章**；**提示词不留档文件**）。
8. **返修**：Codex 出 REVIEW（verdict=revise）→ 按返修单逐项修 → 更新 STATUS/QA/ISSUES/HANDOFF/MANIFEST（保留历史，不自行写 pass）→ 重新交付并给复检提示词。可多轮（R1/R2/…）。

---

## 二、交付物规范（通用）

### 目录结构与命名
- 交付目录：`work/external-ai/deliveries/<任务ID>_<主题>_交付/`，与本手册同级的既有交付包不得覆盖。
- LITE：README + 主体成果 + HANDOFF；HANDOFF 合并状态、QA、问题和文件清单。
- FULL：主体成果 + README/STATUS/QA/ISSUES/HANDOFF/MANIFEST；任务卡规定 N 个文件就交付 N 个，**不新增未登记文件**。

### 过程文档要点
| 文档 | 关键要求 |
|---|---|
| README.md | 任务身份、范围、返修历史说明 |
| STATUS.md | 开始/中间/结束时间线；终态只可为 done/blocked/failed；返修轮次单独记录 |
| QA_REPORT.md | 自检方法、抽样记录、R0/R1/R2 问题历史 + 本次自检结果；**不自行写最终 pass** |
| ISSUES.md | 疑问/冲突/访问限制/待 Codex 决策项；已解决项保留并标 resolved |
| HANDOFF.md | 三行摘要：已完成 / 未变化 / 下一步 |
| MANIFEST.md | 与实际目录**逐文件一致**（数量、文件名、用途、敏感性） |

### 枚举值（常见，具体以任务卡为准）
- `access_status`：open_access / catalog_only / preview_only / purchase_or_borrow / discovery_only / unavailable
- `access_bucket`：legal_open_access / user_supply_purchase_or_borrow / discovery_only
- `recommended_priority`：high / medium / low
- `proposed_processing`：bibliographic_verification / web_evidence / user_acquisition_then_L1 / user_acquisition_then_scoped_L2 / discovery_only
- 来源等级建议：A/B/C/D（**只是建议**，最终由 Codex 核定）
- 禁止自创枚举（如"open_access（部分）"曾导致返工）

---

## 三、高频错误与 Codex 修改意见（返修教训库）

> 以下全部来自实际 REVIEW。按"错误 → Codex 意见 → 正确做法"组织。新任务照此规避。

### A 类：数字与结论不一致（出现频率最高）
- **手工沿用旧数字**：SUMMARY/QA/HANDOFF 里写"葡语 8 条"但 CSV 实际 9 条、B 级写 5 实际 6、访问桶写 16/4/1 实际 15/5/1。
  - Codex：所有计数只能从最终 CSV 机械重算，不能手填。
  - 正确做法：改动任何一行后，用脚本重算全部统计（作家/语言/等级/状态/桶/优先级/唯一机构），再断言每个文档包含对应数字；修复后 `grep` 全目录旧数字残留。
- **静态字数漂移**：摘要里写死"959 中文字"，内容一改就失准。
  - Codex：删除文件内静态字数说明（或写"≤上限"），避免每次修订后失真。
- **过程文档结论被推翻**：写"8 项验证全部通过/无已知错误"，但 REVIEW 发现错误。
  - Codex：只写实际验证过的；被推翻结论在 QA 中留档为历史，当前状态文档不得出现。
- **自述与事实不符**：摘要自述"约 900 字"实际 646；"关系 22 为六源之最"实际最高是 40。
  - 正确做法：数字一律以脚本输出为准，不凭印象。

### B 类：CSV 结构与枚举
- **手写 CSV 含英文逗号未转义**（作者名 "Homem, Maria Lúcia"）→ 整行错列。
  - 正确做法：永远用标准 `csv.writer`（QUOTE_MINIMAL）写出，写后标准解析验证行数×列数。
- **非法枚举值**："open_access（部分）"不在允许枚举内。
  - 正确做法：枚举字段写完后脚本断言 ⊆ 任务卡枚举集合。
- **重复 ID / 复合记录 / 断裂引用**：实体 ID 重复、一条记录塞两个对象、关系两端引用不存在的实体。
  - 正确做法：生成后断言 ID 唯一、关系 broken=0、两端实体存在。

### C 类：对象与页面错配（书目/网络类任务高频）
- **期刊索引 ≠ 具体论文**：把 Borges Studies Online 索引页当 A 级同行评审文章（"同行评审未明示"不能核定为 A）。
  - Codex：A 级候选必须是可识别的具体学术文献（作者+题名+期刊/机构+年份+DOI或稳定URL）；卷期页码在现成可得时保留，不作强制门槛。
- **聚合页 ≠ 原落地页**：CAPES 聚合记录代替 UNESP/UESB 原期刊页。
  - 正确做法：主 URL 用原期刊/原机构落地页，聚合页可保留为交叉记录。
- **作者聚合页 ≠ 单书产品页**：Rocco /autor/ 页代替 /produto/ 单书页。
- **作者任职机构 ≠ 期刊出版机构**：作者在 PUC-Minas 教书，期刊是 UFF 出版，机构字段写 UFF。
- **期号/专刊张冠李戴**：博尔赫斯专刊误标 9-10 期，实际是《La Biblioteca》第 13 期（2013，ISSN 0329-1588）。
  - 正确做法：期号/ISSN/出版年以官方页面为准并交叉确认（图书馆馆藏、ORBi 等）。

### D 类：访问与核验不实
- 未打开页面就记录"可访问"；被 reCAPTCHA/付费墙拦截仍写"可访问"。
  - 正确做法：实际打开核验；打不开/被拦截如实写进 verification_notes 和 ISSUES，不编造访问结果。
- 把目录页/试读页/预览当"已取得全文"。
  - 正确做法：access_status 与 bucket 如实反映（catalog_only/preview_only/discovery_only）。
- 官方开放 PDF 可以核验元数据（Author/Title/CreationDate），比只记 URL 更扎实；但**只记录，不下载**。

### E 类：结论表述过强 / 越权
- **无字段支撑的断言**：候选表没有性别字段就断言"女性作家主要来自 X 来源"。
  - 正确做法：写"现有结构无此字段，无法机械核验，待 Codex 实体审核"。
- **把问题句提升为事实**：教材中的疑问句被建成确定关系（《孤独的迷宫》-EXPLORES_THEME-帕斯）。
  - 正确做法：无原文证据支撑的语义关系删除或标 `PROPOSED:`，不升格。
- **用常识补写**：无法从原页确认的页码/文字写 `[待核]`，不自行补。
- **越权决策**：自行分配 SRC/实体 ID、自行恢复置信度 high、自行进 staging、自行宣布阶段解锁——全部留给 Codex。

### F 类：脚本/构建逻辑缺陷
- 循环内重复写入同一内容（TMP-002 p9-13 每个锚点下都挂整套目录）。
- 读取了数据但忘记写入输出（EPUB 两节读了没写）。
- 生成脚本按 glob 遍历文件，空文本页（图像页）不生成 → 循环未覆盖。
  - 正确做法：生成脚本按"计划清单"遍历（不是 glob），产物用锚点/行数/关键串断言验证；脚本保留在交付目录并登记 MANIFEST。

---

## 四、任务完成后自检清单（交付前必做，12 项）

> 每项都用脚本断言，全部通过才算完成；结果写入 QA_REPORT。必须包含项目共享验证脚本的实际命令和终态，不能只写自制脚本“12/12 通过”。这能让 Codex直接采信机械结果，把用量留给关键语义门禁。

1. **交付物完整性**：任务卡要求的文件全部存在、数量正确（N 个就 N 个）；无未登记文件、无 .DS_Store。
2. **CSV 标准解析**：所有 CSV 用标准解析器读取，行数×列数与预期一致；无错列、无匿名/null 列。
3. **ID 唯一性**：候选/实体/关系 ID 全部唯一；ACCESS_PLAN 的 ID 与候选表一一对应、无未登记 ID。
4. **枚举合法**：access_status / access_bucket / proposed_processing / recommended_priority / 等级 等全部 ⊆ 任务卡枚举集合。
5. **引用完整性**：关系两端实体均存在（broken=0）；外键/引用字段非空。
6. **数字一致性**：从最终 CSV 机械重算全部统计（作家/语言/等级/状态/桶/优先级/唯一机构），并断言 SUMMARY/QA/HANDOFF/MANIFEST/STATUS 含对应数字；`grep` 全目录确认无旧数字残留（如被推翻的 5/6、8/9、16/4/1）。
7. **关键字段抽查**：书名/作者/年份/ISBN/DOI/URL 与来源文件一致（抽样每来源 1-3 条，或按 REVIEW 指定页/行）。
8. **URL 核验记录**：每个 URL 有访问结果/页面标题/机构/访问日期；无法访问或被拦截的如实登记于 ISSUES。
9. **来源/结构完整性**：来源 ID 与来源题名完整；矩阵行数、列数符合任务卡。只有任务卡特别要求时才检查逐页锚点。
10. **目录安全**：无 PDF/EPUB/全文提取件/inputs（除非任务卡要求）/Cookie/密钥/账号信息；未修改 PROJECT_CHARTER.md、TASKS.md、SOURCE_REGISTRY、决策记录、CHANGELOG 或 GitHub。
11. **无静态字数/过时结论**：文档无写死数字（字数/条数）除非有更新机制；当前状态文档不含被推翻的结论（如"全部通过/无已知错误"）。
12. **状态与交接**：STATUS 终态 done（或 blocked/failed），含开始/结束时间与完成范围；HANDOFF 三行摘要准确；QA 自检结果"等待 Codex 复检"，不自行写 pass。

---

## 五、审计提示词编写规范（精简原则）

> 目的：省 token、提效率。Codex 只看"需要它知道和需要它拍板"的，其余不写。

### 必须包含（四要素，按此顺序）
1. **任务信息**：任务 ID（含轮次）、交付目录路径——2~3 行。
2. **本次做了什么**：改动/成果清单，**每项一行**，附一个关键证据数字（如"BOR-004 改为 Rosman 论文（Variaciones Borges 14, 2002），官方 PDF 已核验元数据"）；没做的不用提。
3. **请抽检什么**：直接引用 REVIEW「重新验证项」编号或一句话点出关键检查点（如"按 R2 重验 6 项抽核，关键数字：21 条/博 A2/B6/C3/桶 15-5-1"）。
4. **需要 Codex 决策什么**：只列**本次**待拍板项（≤3~4 项）；历史已决策的不重复。

### 必须删除（省 token 重点）
- **所有"未做事项"负面对照**：Codex 没提、我也没做的（未修改章程、未 git、未上传 GitHub、未下载全文、未分配 SRC、未进 staging……）一律不写；除非 Codex 在 REVIEW 中**明确要求验证该项**且确实做了，才写一句带证据。
- 大段背景复述、完整枚举表、长篇表格、REVIEW 原文转述。
- 解释性话术（"为了……""考虑到……"）。

### 格式与轮次
- 结构固定为：**任务信息 → 本次改动 → 抽检项 → 待决策 → 结论要求**（一行："请给出 pass/revise/reject 并附可复核理由；如需退回按手册 §11 返修单格式"）。
- 初版提示词 ≈ 30~40 行内；**返修轮次（R1/R2…）更短**：只写"返修了哪几项 + 证据 + 重新验证项 + 遗留决策"，Codex 已有 REVIEW 上下文，无需复述。
- 边界提醒（如版权材料不上传）仅在交付物确实含版权内容且 Codex 需知晓时保留一句。

### 精简示例（返修轮）
```
你是"拉丁美洲文学地图"项目的 Codex 项目经理。V1-S2-001-002-A 已按你的 R1 REVIEW 完成 R2 返修，请复检。

- 交付位置：work/external-ai/deliveries/V1-S2-001-002A_试点来源候选清单_交付/
- 本次改动：①DISC-BOR-004 改为具体论文 Rosman, Politics of the Name (Variaciones Borges 14, 2002, pp.7-21)，官方开放 PDF 已核验元数据；②QA 分作家 access_status 修正（博 8/1/1/1、李 7/2/1）；③8 个交付文件同步、机械重算（博 es5/en4/zh2、机构 8；桶 15/5/1）
- 请按 REVIEW「R2 重新验证」6 项抽核
- 待你决策：BOR-004 的 A 级核定；JSTOR 期号交叉记录被反爬拦截（I009）可人工复核；试点来源选择
- 结论：pass/revise/reject 附可复核理由；退回按手册 §11 返修单格式
```

## 六、返修（REVIEW）规则

- 返修单位置：`work/external-ai/reviews/<任务ID>_PM_REVIEW.md`（R1 为 `<任务ID>_R1_PM_REVIEW.md`），**以返修单为唯一依据**，只修列出的问题，不扩大范围。
- 逐项对照返修单执行，每项在 QA_REPORT/HANDOFF 记录"返修项 → 落实"。
- 返修只更新受影响的主体成果和过程记录；LITE 更新 HANDOFF，FULL 按需更新 STATUS/QA/ISSUES/HANDOFF/MANIFEST。不得为了同步无关重写已通过文件；Codex写的历史审查内容**不得修改**。
- 保持范围不变（如"候选总量 21 不变""只改指定行"）；Reviewer 目视确认的事实（如章题"卓有建树的女作家"起页 293）可作为返修依据使用，但不得修改输入来源文件。
- 返修完成后重跑任务卡的"重新验证项"（脚本断言），再重新交付并给复检提示词。

---

## 七、边界与禁止事项（全程适用）

- 不修改：`PROJECT_CHARTER.md`、`TASKS.md`、`data/catalog/SOURCE_REGISTRY.csv`、既有任务包、决策记录、CHANGELOG、GitHub。
- 不下载/不推荐：Z-Library、网盘、盗版全文；不绕过登录/付费墙/DRM/地区限制。
- 不做：OCR（除非任务卡授权 L 级）、文学研究/价值判断、实体关系抽取（除非是任务）、正式 `SRC-`/实体 ID 分配、购买/预约/订阅。
- 不自行决定：试点来源、正式等级、主题定稿、关系成立、置信度恢复。
- 版权边界：用户提供的原件、全文提取件和整书 OCR 仅本地流转（local_only），**不上传公开仓库**；公开网络来源按其许可使用，可公开书目级信息、URL 与结构化摘要。
- 无法确认的事项一律写 `[无法识别]`/`[待核]` 或进 ISSUES，不凭常识补写。

---

## 八、常用命令与脚本要点

- Python venv：`/Users/zyy/.workbuddy/binaries/python/envs/default/bin/python3`（pypdf、pymupdf 已装）。
- 扫描件 OCR：`legal-ocr` 技能（MinerU 轻量接口，单文件 ≤10MB，超限先拆批）；后台任务用 `run_in_background`；当前模型不支持读图，无法目视校对。
- CSV 写出：一律 `csv.writer(..., quoting=csv.QUOTE_MINIMAL)` + `utf-8-sig`；读入同样标准解析。
- 验证脚本要点：表头列索引动态取（`idx={h:i}`），不硬编码；先输出基准值再断言各文档；REVIEW 指定数字（如分作家 access_status）与机械重算冲突时，以 REVIEW 为准核对 CSV 分布。
- SOURCE_REGISTRY.csv 列序：0 id, 1 tmp, 2 title, 3 orig, 4 author, 5 translator, 6 publisher, 7 year, 8 isbn, 9 format, 10 pages, 11 lang, 12 level, 13 status…
- 工作记忆：项目每日日志 `.workbuddy/memory/YYYY-MM-DD.md`（append-only），跨项目习惯在 `~/.workbuddy/MEMORY.md`。
