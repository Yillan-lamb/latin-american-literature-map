# V1-S3-B01：墨西哥三作家研究里程碑包

- task_id: `V1-S3-B01`
- parent_tasks: `V1-S3-1XX/2XX/3XX`
- task_type: `web_source_verification / structured_research / candidate_extraction`
- package_profile: `FULL`
- assignee: `EXT-AI-02（ZCode；交付时登记实际模型及版本）`
- status: `done / pass`
- dependency: `V1-N2-001 done`
- schema: `docs/data/阶段2_试行Schema与迁移规则.md` 0.2（冻结）
- completed_by: `EXT-AI-02（ZCode / deepseek-v4-flash，版本 unknown）`
- pm_review: `work/external-ai/reviews/V1-S3-B01_PM_REVIEW.md`

## 1. 目标

一次完成埃莱娜·加罗、罗萨里奥·卡斯特利亚诺斯、胡安·鲁尔福三位墨西哥作家的来源池、九部作品覆盖、候选实体、来源事实、关系候选和内容卡事实素材，为 Codex 关键门禁与暂存整合提供单一里程碑交付包。

本包合并来源发现、来源级整理、候选抽取、批内查重和覆盖统计，不拆成多个小任务。页码、章节和逐页 OCR 不是普遍要求。

## 2. 固定作家与作品

### 埃莱娜·加罗

1. `Los recuerdos del porvenir`（《未来的回忆》）
2. `La semana de colores`
3. `Testimonios sobre Mariana`

### 罗萨里奥·卡斯特利亚诺斯

1. `Balún Canán`
2. `Oficio de tinieblas`
3. `Poesía no eres tú`

### 胡安·鲁尔福

1. `Pedro Páramo`（《佩德罗·巴拉莫》）
2. `El Llano en llamas`（《燃烧的原野》）
3. `El gallo de oro`

不得自行换作家或删除作品。发现译名分歧时保留原文名并提交译名候选，不擅自冻结中文译名。

## 3. 必读输入

1. `project/governance/PROJECT_CHARTER.md`
2. `project/tasks/TASKS.md`
3. `project/archive/阶段0_研究与数据规范.md`
4. `docs/data/阶段2_试行Schema与迁移规则.md`（0.2）
5. `project/ai/外部AI执行工作流与自检手册.md`
6. `project/ai/外部AI任务分工与交接手册.md`
7. `data/catalog/SOURCE_REGISTRY.csv`
8. `data/staging/v1_s2_pilot/ENTITIES.csv`
9. `data/staging/v1_s2_pilot/RELATIONSHIPS.csv`
10. `data/staging/v1_s2_pilot/RELATION_HOLDS.csv`
11. `data/staging/v1_s2_pilot/FACTS.csv`
12. `work/external-ai/阶段3_作家来源批次矩阵.csv`

任一治理文件或 Schema 不可见时停止，不凭聊天摘要重建规则。

## 4. 来源要求

- 每位作家至少 4 个候选来源，其中至少 2 个 A/B 级来源；三人合计建议 15—30 个来源。
- 每部作品至少有 1 个 A/B 级书目或机构来源；解释性研究关系优先寻找 A 级论文或学术专著。
- 优先顺序：墨西哥国家图书馆/大学/档案馆、作家基金会、出版社、DOI 论文、权威图书馆目录。
- 普通媒体、博客、百科只作发现线索，不作为解释性关系唯一依据。
- 每个来源记录页面标题、机构/作者、URL、访问日期、语言、建议等级、访问状态和覆盖作品。
- 不绕过登录、订阅、验证码、robots 或访问限制；不下载或交付受版权保护的整书全文。

## 5. 数据规则

1. 只生成 `B01-` 候选 ID，不分配 SRC、STG、ENT、REL 正式编号。
2. 严格使用 Schema 0.2 的实体类型和关系词；不得发明新枚举。
3. `work`、`collection`、`edition`、`adaptation` 必须分开；同名不自动合并。
4. 直接事实关系可由一个合格来源形成候选。
5. 解释性关系原则上需要两个独立合格来源：
   - 两来源支持同一三元组时，分行记录并共享 `relation_group_id`；
   - 只有一个来源时标 `needs_second_source`；
   - 不得把关键词、标题或执行方理解提升为事实。
6. 证据最低定位到来源名称或论文/网页标题；locator、页码和短摘录可选。
7. 与既有暂存实体查重，但不得修改或覆盖 `data/staging/`。

## 6. 主体交付物

1. `SOURCE_CANDIDATES.csv`
2. `WORK_COVERAGE.csv`
3. `SOURCE_NOTES.md`
4. `ENTITY_CANDIDATES.csv`
5. `FACT_CANDIDATES.csv`
6. `RELATION_CANDIDATES.csv`
7. `RELATION_GROUP_SUMMARY.csv`
8. `CONTENT_CARD_DRAFTS.md`
9. `DUPLICATE_CANDIDATES.csv`
10. `COVERAGE_SUMMARY.md`
11. `README.md`
12. `STATUS.md`
13. `QA_REPORT.md`
14. `ISSUES.md`
15. `HANDOFF.md`
16. `MANIFEST.md`

## 7. 最低成果量

- 三位作家和九部作品全部覆盖，不重不漏；
- 每位作家至少 4 个来源、每部作品至少 1 个 A/B 级来源；
- 候选实体建议 40—100 条；
- 原子事实建议 45—90 条；
- 关系候选建议 30—60 行；不得为了达到数量制造弱关系；
- 3 张作家卡 + 9 张作品/作品集卡事实草稿；
- 所有统计必须从最终 CSV 机械重算，不在文档中保留过时数字。

若可靠材料不足，应如实低于建议数量并登记缺口，不能用低质量来源补数。

## 8. 必须验证

1. 所有 CSV 使用标准解析，表头和每行列数一致；包含逗号、引号或换行的字段正确转义。
2. 候选 ID、关系 ID 和关系组 ID 唯一；关系端点全部存在。
3. 来源 ID 在本包内唯一，所有事实和关系来源均能回指 `SOURCE_CANDIDATES.csv` 或既有正式 SRC。
4. 三位作家、九部作品、来源数量、A/B 数量、语言和机构数量可机械重算。
5. 解释性关系的双来源/单来源状态与关系组汇总一致。
6. 抽样每位作家 2 个来源、每部作品 1 条事实、每类关系 2 条，确认没有把推断写成事实。
7. 批内查重与既有 `data/staging/v1_s2_pilot/ENTITIES.csv` 查重；只报告，不删除。
8. 运行共享 `FULL` 验证，errors/warnings 均为空；QA 不得自行写 Codex `pass`。
9. 目录不含 PDF/EPUB/整书 OCR、Cookie、密钥、inputs、`.DS_Store`。

## 9. 过程与交接要求

- STATUS 终态只能写 `done` 或 `blocked`，不得写项目经理验收通过。
- HANDOFF 必须报告实际执行方、平台、模型、时间、最终机械统计、阻塞、待 Codex 决策和公开边界。
- ISSUES 最多把需要 Codex 决定的重点压缩为 5 项；普通信息不伪装成决策。
- MANIFEST 登记全部 16 项文件及尺寸，不登记本地缓存或临时文件。
- 不修改 TASKS、Schema、章程、决策记录、既有任务包、data/staging、CHANGELOG 或 GitHub。

## 10. Codex 门禁

Codex 只复核：

1. 文件/CSV/ID/引用和公开安全；
2. 来源身份、合法访问、三作家九作品覆盖；
3. 每位作家和各关系类型的语义样本；
4. 重复、解释性关系分层和暂存准入。

不逐页、不逐条复做外部 AI 工作；只有抽样失败才扩大相应范围。
