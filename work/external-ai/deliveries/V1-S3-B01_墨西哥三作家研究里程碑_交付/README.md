# README：V1-S3-B01 墨西哥三作家研究里程碑包（交付包）

- task_id: `V1-S3-B01`；parent_tasks: `V1-S3-1XX/2XX/3XX`
- task_type: `web_source_verification / structured_research / candidate_extraction`
- package_profile: `FULL`；execution_scope: `milestone_bundle`
- produced_by: **EXT-AI-02（ZCode 平台，产品 ZCode CLI；模型 deepseek-v4-flash，版本 unknown；开始约 2026-08-10 11:25 CST，结束 ~11:50 CST，以文件时间戳为准）**
- status: `done`（Worker 终态；最终 pass/revise/reject 由 Codex 关键门禁给出）
- 交付目录：`work/external-ai/deliveries/V1-S3-B01_墨西哥三作家研究里程碑_交付/`

## 0. 执行方登记

| 项 | 值 |
|---|---|
| 平台 | ZCode；产品 ZCode CLI |
| 实际模型 | deepseek-v4-flash（内部 ID `3713d8ef-16b6-49c5-b555-6d3b72c34a77`；版本 unknown，不猜测） |
| 执行方 | EXT-AI-02 |
| 时间 | 2026-08-10 ~11:25–11:50 CST |

## 1. 任务范围

- 固定作家 3：埃莱娜·加罗、罗萨里奥·卡斯特利亚诺斯、胡安·鲁尔福；固定作品 9（见 WORK_COVERAGE.csv）。
- 一包完成：来源发现与合法访问核验（15 个 A/B 级来源）→ 来源笔记 → 候选实体（44）→ 原子事实（81）→ 关系候选（31 行/31 组）→ 内容卡事实草稿（12 张）→ 批内查重与既有候选/暂存查重（9 条）→ 覆盖汇总。
- 冻结 Schema 0.2（N2 已通过）：实体类型与关系词未越界；`person` 类型（导演 Ripstein）与 `DIRECTED` 关系词已按 0.2 使用。
- 只生成 `B01-` 候选 ID；未分配 SRC/STG/ENT/REL 正式编号；未修改 `data/staging/`。

## 2. 交付物（16 项，目录内恰 16 个文件）

README / STATUS / SOURCE_CANDIDATES.csv / WORK_COVERAGE.csv / SOURCE_NOTES.md / ENTITY_CANDIDATES.csv / FACT_CANDIDATES.csv / RELATION_CANDIDATES.csv / RELATION_GROUP_SUMMARY.csv / CONTENT_CARD_DRAFTS.md / DUPLICATE_CANDIDATES.csv / COVERAGE_SUMMARY.md / QA_REPORT.md / ISSUES.md / HANDOFF.md / MANIFEST.md

## 3. 机械结果摘要（脚本从最终 CSV 重算）

- 来源 15（A×4、B×11）；每作家 5 个、全部 A/B 级；访问状态全部 ok（HTTP 200 落地页核验）。
- 九部作品全部覆盖且每部 ≥1 个 A/B 级来源；主来源见 WORK_COVERAGE.csv。
- 实体 44：author 4、work 10、collection 3、edition 2、character 4、place 7、person 1、institution 4、movement 1、event 2、theme 6。
- 事实 81：entity_layer 22、one_sentence_summary 12、first_publication_year 11、genre_or_form 9、research_note 6、bibliographic_note 4、birth/death_year 各 3、country/language 各 3、key_character 2、key_place 3。
- 关系 31 行 / 31 组：CREATED 11、EXPLORES_THEME 6、ASSOCIATED_WITH_PLACE 5、SET_IN 3、EDITION_OF 2、CONTAINS_WORK 1、ADAPTED_FROM 1、DIRECTED 1、ASSOCIATED_WITH_MOVEMENT 1。
- 关系状态：`eligible_for_staging_review` 24 组（直接/结构/背景事实）、`hold_needs_second_source` 7 组（全部为单来源解释性：EXPLORES_THEME×6 + ASSOCIATED_WITH_MOVEMENT×1）。
- 内容卡 12 张（3 作家 + 9 作品），引用 65 个 FACT-ID 全部有效。
- 查重 9 条：批内分层 2（《佩德罗·巴拉莫》work/character）、既有 S1 候选 exact 6（鲁尔福、佩德罗·巴拉莫×2、墨西哥、帕斯、墨西哥革命小说）、staging exact 1（记忆与遗忘→STG-ENT-0014）。

## 4. 诚实缺口（未为凑数补来源）

- 《关于玛丽安娜的证词》《黑暗的职守》《金鸡》《诗歌不是你》以 ELEM 词条/作品页（B 级书目）为主，专论研究来源待后续批次补证（COVERAGE_SUMMARY §5）。
- 《燃烧的原野》篇目明细、《金鸡》体裁表述无来源支持，未建对应事实。
- indigenismo/魔幻现实主义等运动归属无来源直接支持，未建运动候选。
- 被反爬/DNS 不可达的候选来源（SciELO Chile/Argentina、Fundación Juan Rulfo、Cervantes Virtual、HAL）未纳入，改采等价 A/B 级替代（UNAM《墨西哥文学》期刊、ELEM、FCE、智利大学期刊）。

## 5. 安全边界声明

- 未修改 TASKS、Schema、章程、决策记录、既有任务包、`data/staging/`、CHANGELOG；未执行 Git 命令。
- 未分配正式 SRC/STG/ENT/REL ID；未下载或交付整书全文；未绕过访问限制。
- 交付包无 PDF/EPUB/整书 OCR、Cookie、密钥、inputs、`.DS_Store`。
