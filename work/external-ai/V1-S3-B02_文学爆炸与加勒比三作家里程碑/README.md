# V1-S3-B02：文学爆炸与加勒比三作家研究里程碑包

- task_id: `V1-S3-B02`
- parent_tasks: `V1-S3-1XX/2XX/3XX`
- task_type: `web_source_verification / structured_research / candidate_extraction`
- package_profile: `FULL`
- assignee: `EXT-AI-02（交付时登记实际平台、模型及版本）`
- status: `done / pass（R1）`
- dependency: `V1-S3-B01 Codex gate pass`
- schema: `docs/data/阶段2_试行Schema与迁移规则.md` 0.2（冻结）
- completed_by: `EXT-AI-02（ZCode / deepseek-v4-flash，版本 unknown）`
- r0_pm_review: `work/external-ai/reviews/V1-S3-B02_PM_REVIEW.md`
- r1_pm_review: `work/external-ai/reviews/V1-S3-B02_R1_PM_REVIEW.md`

## 1. 目标

一次完成加西亚·马尔克斯、胡利奥·科塔萨尔、阿莱霍·卡彭铁尔三位作家的来源池、九部作品覆盖、候选实体、来源事实、关系候选和内容卡事实素材，为 Codex关键门禁与暂存整合提供单一里程碑交付包。

本包合并来源发现、合法访问核验、来源级整理、候选抽取、跨批次查重和覆盖统计，不拆成多个小任务。页码、章节、逐页 OCR 和整书全文整理均不是本任务要求。

## 2. 固定作家与作品

### 加西亚·马尔克斯

1. `Cien años de soledad`（《百年孤独》）
2. `El coronel no tiene quien le escriba`（《没有人给他写信的上校》）
3. `Crónica de una muerte anunciada`（《一桩事先张扬的凶杀案》）

### 胡利奥·科塔萨尔

1. `Rayuela`（《跳房子》）
2. `Bestiario`（作品集）
3. `Final del juego`（作品集）

### 阿莱霍·卡彭铁尔

1. `El reino de este mundo`（《人间王国》）
2. `Los pasos perdidos`（《消逝的足迹》）
3. `El siglo de las luces`（《光明世纪》）

不得自行换作家、删作品或增加核心作品。发现译名分歧时保留原文名并提交译名候选，不擅自冻结中文译名。

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
12. `work/external-ai/deliveries/V1-S1-003_正式来源ID回填_交付/ENTITY_CANDIDATES.csv`
13. `work/external-ai/deliveries/V1-S3-B01_墨西哥三作家研究里程碑_交付/ENTITY_CANDIDATES.csv`
14. `work/external-ai/reviews/V1-S3-B01_PM_REVIEW.md`
15. `work/external-ai/阶段3_作家来源批次矩阵.csv`

任一治理文件或 Schema 不可见时停止，不凭聊天摘要重建规则。B01 交付仅用于跨批次查重和沿用已确认的类型边界，不得修改。

## 4. 来源要求

- 每位作家至少 5 个候选来源，其中至少 3 个为 A/B 级；三人合计建议 15—30 个来源。
- 每部作品至少有 1 个 A/B 级书目或机构来源；解释性关系优先使用同行评审论文、大学出版社专著页面或权威研究机构资料。
- 优先寻找哥伦比亚、阿根廷、古巴和拉丁美洲本地机构的西语来源；可用高质量英语来源交叉核验，但不得让英语来源完全替代本地来源。
- 优先顺序：国家图书馆/大学/作家基金会或档案馆、权威文学机构、出版社、DOI 论文、权威图书馆目录。
- 普通媒体、博客、百科只作发现线索，不作为解释性关系唯一依据。
- 每个来源记录页面标题、机构/作者、URL、访问日期、语言、建议等级、访问状态和覆盖作品。
- 不绕过登录、订阅、验证码、robots 或访问限制；不下载、复制或交付受版权保护的整书全文。

## 5. B02 专项语义边界

1. `Rayuela`、`Cien años de soledad` 等独立小说使用 `work`；`Bestiario`、`Final del juego` 使用 `collection`。其中收录的短篇若因可靠来源需要建实体，必须与作品集分层，并使用 `CONTAINS_WORK`。
2. “拉丁美洲文学爆炸”“魔幻现实主义”“神奇现实/美洲神奇现实”等概念不能因常识或关键词直接建立关系：
   - `ASSOCIATED_WITH_MOVEMENT` 必须有明确文学史判断；
   - `EXPLORES_THEME` 必须有来源明确作出主题判断；
   - 类型无法稳定判断时写入 `ISSUES.md`，不得自创新枚举。
3. 卡彭铁尔的 `lo real maravilloso` 只有在合格来源明确界定对象和关系时才建立候选；不要自动把它与“魔幻现实主义”合并。
4. 历史人物、地名、历史事件和文学人物必须分型；现实地点与虚构地点无法可靠区分时标 `unclear`，不得强行归一。
5. 作品出版年、初刊年、版本年和译本年必须区分；有冲突时保留各来源说法并登记争议。

## 6. 数据规则

1. 只生成 `B02-` 候选 ID，不分配 `SRC/STG/ENT/REL` 正式编号。
2. 严格使用 Schema 0.2 的实体类型和关系词，不得发明新枚举或 `PROPOSED:` 关系词。
3. `work`、`collection`、`edition`、`adaptation`、`character` 必须分开；同名不自动合并。
4. 直接事实关系可由一个明确合格来源形成候选。
5. 解释性关系原则上需要两个独立合格来源：
   - 两来源支持同一三元组时分行记录，并共享 `relation_group_id`；
   - 只有一个来源时标 `needs_second_source`，在关系组汇总中置为 `hold`；
   - 不得把标题、关键词共现或执行方理解提升为事实。
6. 证据最低定位到书名、论文名或网页标题和 URL；locator、页码、章节和短摘录均为可选增强。
7. 与 S1 候选、现有 staging 和 B01 候选查重，只报告 `exact/possible/type_conflict/new`，不得修改或覆盖输入数据。

## 7. 主体交付物

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

交付目录固定为：

`work/external-ai/deliveries/V1-S3-B02_文学爆炸与加勒比三作家里程碑_交付/`

## 8. 最低成果量

- 三位作家和九部作品全部覆盖，不重不漏；
- 每位作家至少 5 个来源、每部作品至少 1 个 A/B 级来源；
- 候选实体建议 40—100 条；
- 原子事实建议 45—100 条；
- 关系候选建议 30—65 行，不得为达到数量制造弱关系；
- 3 张作家卡 + 9 张作品/作品集卡事实草稿；
- 所有统计必须从最终 CSV 机械重算，过程文档不得保留过时数字。

若可靠材料不足，应如实低于建议数量并登记缺口，不能使用低质量来源补数。

## 9. 必须验证

1. 所有 CSV 标准解析，表头和每行列数一致；包含逗号、引号或换行的字段正确转义。
2. 候选 ID、关系 ID和关系组 ID 唯一；关系端点全部存在。
3. 来源 ID 在本包内唯一，所有事实和关系来源均能回指 `SOURCE_CANDIDATES.csv` 或既有正式来源。
4. 三位作家、九部作品、来源数量、A/B 数量、语言和机构数量可机械重算。
5. 解释性关系的双来源/单来源状态与关系组汇总严格一致。
6. 抽样每位作家 2 个来源、每部作品 1 条事实、每类关系 2 条，确认没有把推断写成事实。
7. 批内查重，并与 S1、staging、B01 候选查重；同名但类型不同的对象不得标为可直接合并的 `exact`。
8. 运行共享 `FULL` 验证，errors/warnings 均为空；QA 不得自行写 Codex `pass`。
9. 目录不含 PDF/EPUB/整书 OCR、Cookie、密钥、inputs、`.DS_Store`。

## 10. 过程与交接要求

- STATUS 终态只能写 `done` 或 `blocked`，不得写项目经理验收通过。
- HANDOFF 必须登记实际执行方、平台、模型、版本、时间、最终机械统计、阻塞、待 Codex 决策和公开边界。
- ISSUES 最多保留 5 项真正需要 Codex 决定的问题；普通信息不伪装成决策。
- MANIFEST 登记全部 16 项文件及实际尺寸，不登记本地缓存或临时文件。
- 不修改 TASKS、Schema、章程、决策记录、既有任务包、`data/staging`、CHANGELOG、Git 或 GitHub。

## 11. Codex 门禁

Codex 只复核：

1. 文件、CSV、ID、引用完整性和公开安全；
2. 来源身份、合法访问和三作家九作品覆盖；
3. 每位作家及各关系类型的语义样本；
4. 作品/作品集分层、跨批次重复、解释性关系分层和暂存准入。

Codex 不逐页、不逐条复做外部 AI 工作；只有抽样失败才扩大相应范围。
