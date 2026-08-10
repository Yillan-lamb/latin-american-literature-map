# V1-S3-B03：安第斯与诗歌双作家研究里程碑包

- task_id: `V1-S3-B03`
- parent_tasks: `V1-S3-1XX/2XX/3XX`
- task_type: `web_source_verification / structured_research / candidate_extraction`
- package_profile: `FULL`
- assignee: `EXT-AI-02（交付时登记实际平台、模型及版本）`
- status: `done`
- dependency: `V1-S3-B02 R1 Codex gate pass`
- schema: `docs/阶段2_试行Schema与迁移规则.md` 0.2（冻结）
- created_at: `2026-08-10`
- gate_result: `R1 pass（2026-08-10）`

## 1. 目标

一次完成马里奥·巴尔加斯·略萨、巴勃罗·聂鲁达两位作家的来源池、六部固定作品覆盖、候选实体、来源事实、关系候选和内容卡事实素材，为 Codex 关键门禁、阶段 3 全局规范化与后续暂存整合提供一个里程碑交付包。

本包合并来源发现、合法访问核验、来源级整理、候选抽取、跨批次查重和覆盖统计，不拆成来源/OCR/实体/关系小任务。页码、章节、逐页 OCR、整书全文整理和正式展览文案均不属于本任务。

## 2. 固定作家与作品

### 马里奥·巴尔加斯·略萨

1. `La ciudad y los perros`（《城市与狗》）
2. `Conversación en La Catedral`（《酒吧长谈》；保留原文名，中文译名作为候选）
3. `La guerra del fin del mundo`（《世界末日之战》）

### 巴勃罗·聂鲁达

1. `Veinte poemas de amor y una canción desesperada`（《二十首情诗和一首绝望的歌》）
2. `Residencia en la tierra`（《大地上的居所》）
3. `Canto general`（《漫歌》/《总歌》；中文译名作为候选，不擅自冻结）

不得换作家、删作品或增加核心作品。发现译名、版本名或出版年差异时保留原文名、来源说法和候选译名，不自行消解冲突。

## 3. 必读输入

1. `PROJECT_CHARTER.md`
2. `TASKS.md`
3. `docs/阶段0_研究与数据规范.md`
4. `docs/阶段2_试行Schema与迁移规则.md`（0.2）
5. `docs/外部AI执行工作流与自检手册.md`
6. `docs/外部AI任务分工与交接手册.md`
7. `data/catalog/SOURCE_REGISTRY.csv`
8. `data/staging/v1_s2_pilot/ENTITIES.csv`
9. `data/staging/v1_s2_pilot/RELATIONSHIPS.csv`
10. `data/staging/v1_s2_pilot/RELATION_HOLDS.csv`
11. `data/staging/v1_s2_pilot/FACTS.csv`
12. `work/external-ai/deliveries/V1-S1-003_正式来源ID回填_交付/ENTITY_CANDIDATES.csv`
13. `work/external-ai/deliveries/V1-S3-B01_墨西哥三作家研究里程碑_交付/ENTITY_CANDIDATES.csv`
14. `work/external-ai/deliveries/V1-S3-B02_文学爆炸与加勒比三作家里程碑_交付/ENTITY_CANDIDATES.csv`
15. `work/external-ai/reviews/V1-S3-B01_PM_REVIEW.md`
16. `work/external-ai/reviews/V1-S3-B02_R1_PM_REVIEW.md`
17. `work/external-ai/阶段3_作家来源批次矩阵.csv`

任一治理文件、Schema 或 B02 R1 验收不可见时停止，不凭聊天摘要重建规则。历史交付只用于查重、类型边界和已核定决策，不得修改。

## 4. 来源要求

- 每位作家至少 5 个候选来源，其中至少 3 个为 A/B 级；两人合计建议 12—24 个来源。
- 每部固定作品至少有 1 个 A/B 级直接书目或研究来源；只覆盖作家生平但未涉及作品的页面不能代替作品来源。
- 优先使用秘鲁、智利及拉丁美洲本地机构的西语来源：国家图书馆、大学、作家基金会/档案馆、权威文学机构、出版社、DOI 论文和权威图书馆目录。
- 诺贝尔奖官网等国际权威机构可用于人物基础事实和获奖事实；不能仅凭诺贝尔简介建立作品主题、影响或文学运动关系。
- 普通媒体、百科、搜索摘要、书商聚合页和 AI 摘要只作发现线索，不作为解释性关系唯一依据。
- 每个来源记录页面题名、机构/作者、URL、访问日期、语言、建议等级、访问状态、覆盖对象和实际可见信息边界。
- 页面被拦截、重定向错误或只有摘要时如实记录并寻找合法替代；不得绕过登录、订阅、验证码、robots 或访问限制。
- 不下载、复制或交付受版权保护的整书、整部诗集或论文全文；可交付书目级信息和中文释义。

## 5. B03 专项语义与分层边界

### 5.1 小说、诗集与单篇诗

1. 三部长篇小说使用 `work`。
2. `Veinte poemas de amor y una canción desesperada`、`Residencia en la tierra`、`Canto general` 原则上使用 `collection`，不得因日常中文统称“作品”而误标为单篇 `work`。
3. 单篇诗只有在合格来源明确研究该诗且后续关系确有需要时才建 `work`；必须与诗集分层，并仅在权威目录直接支持时使用 `CONTAINS_WORK`。
4. 抒情主体、诗中“我”和现实作者不得自动合并为同一人物。

### 5.2 历史、政治和地点

1. 军事独裁、秘鲁军校、卡努杜斯战争、拉丁美洲历史、殖民与政治身份等内容必须区分人物事实、作品背景、历史事件和解释性主题。
2. `La guerra del fin del mundo` 与卡努杜斯战争的联系只有在合格来源直接说明时才记录；冻结关系词中没有通用 `BASED_ON_EVENT`，不得发明新关系或拿 `SET_IN` 代替历史事件关系。
3. `SET_IN` 只用于来源明确说明的作品地点；`ASSOCIATED_WITH_PLACE` 不得拿来表达政治立场、国籍或历史事件。
4. “文学爆炸”“现代主义/先锋派”“超现实主义”“政治诗人”等文学史归类必须有明确来源，不得由年代、国籍或关键词推断。

### 5.3 版本、译名和年代

1. 作品首版年、分卷出版年、增订年、中文译本年必须分别记录，不得把后续版本年写成创作或首发年。
2. `Residencia en la tierra`、`Canto general` 等存在组成、分卷或版本问题时，优先记录来源明确支持的最低事实；不确定项进入 `ISSUES.md`。
3. 略萨 2025 年逝世信息必须回到诺贝尔奖官网、学院/作家机构或同等级权威来源；不得沿用媒体转载而不核验。
4. 聂鲁达生平、外交经历、政治身份和诺贝尔奖属于不同事实字段；只记录当前来源直接显示的内容。

## 6. 数据规则

1. 只生成 `B03-` 候选 ID，例如 `B03-SRC-0001`、`B03-ENT-0001`、`B03-FCT-0001`、`B03-REL-0001`、`RG-B03-0001`；不分配正式 `SRC/STG/ENT/REL`。
2. 严格使用 Schema 0.2 的实体类型和关系词，不得发明新枚举或 `PROPOSED:` 关系词。
3. `work`、`collection`、`edition`、`adaptation`、`character`、`person`、`event` 必须分开；同名、同题或收录关系不自动合并。
4. 直接事实关系可由一个明确合格来源形成候选。
5. `EXPLORES_THEME`、`INFLUENCED_BY`、`RESPONDS_TO_WORK`、`ASSOCIATED_WITH_MOVEMENT` 等解释性关系原则上需要两个独立合格来源：
   - 同一三元组的多个来源分行记录并共享 `relation_group_id`；
   - 只有一个来源时标 `needs_second_source`，关系组置为 `hold_needs_second_source`；
   - 标题、关键词共现、执行方常识或阅读感受不能升格为事实。
6. 证据最低定位到书名、论文名或网页标题和 URL；locator、页码、章节与短摘录均为可选增强。
7. 与 S1、现有 staging、B01、B02 候选全量查重，只报告 `exact/possible/type_conflict/new`，不得修改输入数据。`existing_id` 必须写完整 ID，多值用分号分隔，不得用 `/`、`等` 或缩写。
8. 外部 AI 不裁决正式中文译名、正式来源等级、正式实体合并和暂存准入；这些决定留给 Codex。

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

`work/external-ai/deliveries/V1-S3-B03_安第斯与诗歌双作家里程碑_交付/`

## 8. 最低成果量

- 两位作家和六部作品全部覆盖，不重不漏；
- 每位作家至少 5 个来源、每部作品至少 1 个 A/B 级来源；
- 候选实体建议 28—75 条；
- 原子事实建议 40—90 条；
- 关系候选建议 24—55 行，不得为达到数量制造弱关系；
- 2 张作家卡 + 6 张小说/诗集卡事实草稿；
- 所有统计必须从最终 CSV 机械重算，过程文档不得保留旧数字或手填估算。

可靠材料不足时可以低于建议数量并登记缺口，不能用低质量来源、常识或重复事实补数。

## 9. 必须验证

1. 所有 CSV 标准解析，表头和每行列数一致；含逗号、引号、换行和西语重音符号的字段正确转义。
2. 来源、实体、事实、关系、关系组和查重 ID 唯一；事实主体、关系端点及来源引用零悬空。
3. 两位作家、六部作品、来源数量、A/B 数量、语言、机构和作品类型可机械重算。
4. 三部诗集均为 `collection`；如建立单篇诗，必须为独立 `work` 且收录关系有直接来源。
5. 解释性关系的双来源/单来源状态与关系组汇总严格一致。
6. 抽样每位作家至少 2 个来源、每部作品至少 1 条事实、每种关系至少 1—2 条，确认未把推断写成事实。
7. 查重覆盖 S1、staging、B01、B02；所有 `existing_id` 完整存在，同名不同类型不得标为可直接合并的 exact。
8. 内容卡恰为 8 张；FACT-ID 清单全部存在、唯一且与卡片对象一致。
9. D 级或仅用于发现的来源不得支撑事实或关系。
10. 运行共享 `FULL` 验证，errors/warnings 均为空；QA 不得自行写 Codex `pass`。
11. 目录不含 PDF/EPUB/整书或整部诗集 OCR、论文全文、Cookie、密钥、inputs、`.DS_Store` 或未登记文件。
12. 未修改章程、TASKS、Schema、SOURCE_REGISTRY、既有交付、data/staging、决策记录、CHANGELOG、Git 或 GitHub。

## 10. 过程与交接要求

- STATUS 终态只能写 `done` 或 `blocked`，不得写项目经理验收通过。
- HANDOFF 必须登记实际执行方、平台、模型/版本、执行时间、只读输入、最终机械统计、共享验证结果、待决策项和公开边界。
- ISSUES 最多保留 5 项真正需要 Codex 决定的问题；普通信息不伪装成决策。
- QA_REPORT 保留实际自检方法、脚本结果、抽样对象和已知限制；不得写“全部高质量”等不可复核结论。
- MANIFEST 登记全部 16 项文件及实际尺寸，不登记本地缓存、临时脚本或受版权保护材料。
- 外部执行方署名不得覆盖；Codex 项目经理验收另存于 `work/external-ai/reviews/`。

## 11. Codex 关键门禁

Codex 只复核：

1. 文件、CSV、ID、引用完整性和公开安全；
2. 来源身份、合法访问和两位作家六部作品覆盖；
3. 每位作家、每部作品和各关系类型的代表性语义样本；
4. 小说/诗集/单篇诗分层、跨批次重复、解释性关系分层和暂存准入。

Codex 不逐页、不逐条复做外部 AI 工作；只有抽样失败才扩大到相应来源或字段。
