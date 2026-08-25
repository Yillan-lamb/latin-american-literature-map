# TASK_PACKET — WEB-CE-B01 / Worker C（奥克塔维奥·帕斯）

- task ID：`WEB-CE-B01-R-C`
- 批次目标：拉美文学地图 WEB-CONTENT-EXPANSION Batch 01（新作家富恩特斯、米斯特拉尔；已有作家帕斯补作品；已有作家追加 14 部）。
- 角色：Research Worker（V4 Flash, high）。只生产 candidates，不自审。
- 停止条件：本 packet 全部对象产出候选或明确标记 hold/pending/gap 后停止；不得研究 packet 外对象；不启动 Batch 02。

## 分配对象（全部未开始）

1. **已有作家实体（reuse，禁止新建）**：奥克塔维奥·帕斯 = `V1-ENT-0059`（author，主库现状：无事实、无卡片、无 CREATED）。本任务为其补事实，不重复建实体。
2. 三部作品实体（type=work）：
   - 《孤独的迷宫》El laberinto de la soledad（1950，散文/随笔）
   - 《弓与琴》El arco y la lira（1956，诗论/散文）
   - 《太阳石》Piedra de sol（1957，长诗）
3. CREATED 关系候选：V1-ENT-0059 → 3 部作品。
4. 中文译本核验：每部作品的规范中文名、别名、译者、出版社、出版年份、ISBN（可确认时）、translation_status、核验来源。计划称三部均有中译（如《孤独的迷宫》《弓与琴》中文单行本、《太阳石》收入帕斯诗选等），请实际核验书目页，勿凭记忆。
5. 事实候选（作者）：birth_year（1914）、death_year（1998）、country_or_region（墨西哥）、language（西班牙语）、出生地（墨西哥城，以 fact 记录，禁止 BORN_IN 关系）、one_sentence_summary、career_note（诗人/散文家/外交官）、award（1990 年诺贝尔文学奖，需诺贝尔官网等可靠来源）。
6. 事实候选（作品）：first_publication_year、genre_or_form、story_premise/one_sentence_summary（仅据来源释义）、bibliographic_note。
7. 事件候选：`Premio Nobel de Literatura 1990`（entity_type=event；参考主库既有事件 V1-ENT-0112 的写法与用法——只读查询其 facts/relationships 决定是否以及如何建候选）。
8. 解释/地点关系**候选**（从严）：ASSOCIATED_WITH_PLACE 墨西哥城（V1-ENT-0056，需具体可说明关联）、ASSOCIATED_WITH_MOVEMENT 先锋派（V1-ENT-0132）/超现实主义语境（仅两项独立合格来源时提出，否则 `hold_needs_second_source`）；《孤独的迷宫》与墨西哥身份/面具主题（V1-ENT-0107）的 EXPLORES_THEME 仅双来源时提出。

## 允许文件与动作

- 只读 sqlite3 查询 `data/master/V1_MASTER.sqlite`（查重、看既有用法；严禁任何写操作）。
- 可读：`data/changesets/WEB-CE-B01/PREFLIGHT.md`、`DSH_LALM_Harness_ReadyPack/AGENTS.md`（如需核对规则原文）。
- 输出只写入 `data/changesets/WEB-CE-B01/candidates/C_paz/`。
- 网络：用 web_search 发现线索，用 curl 打开原页核验（记录 access_status：access_pass / access_blocked）；打不开的页面不得假装已核验。

## 禁止

写 `V1_MASTER.sqlite`；分配 `V1-ENT/V1-FCT/V1-REL/SRC-` 正式 ID（只用 CAND-C-* 临时 ID；作者实体只引用既有 V1-ENT-0059）；批准自己的输出；修改 `project/governance/PROJECT_CHARTER.md`/`project/tasks/TASKS.md`/`project/tasks/V2_TASKS.md`/`CHANGELOG.md`；git 操作；改 `site/`；研究 packet 外对象。

## 规则与 Schema（摘要，权威原文见 PREFLIGHT.md）

- 关系词仅限 Schema 0.3 十三词（CREATED/CONTAINS_WORK/EDITION_OF/TRANSLATION_OF/ADAPTED_FROM/DIRECTED/SET_IN/ASSOCIATED_WITH_PLACE/ASSOCIATED_WITH_MOVEMENT/EXPLORES_THEME/RESPONDS_TO_WORK/INFLUENCED_BY/BASED_ON_EVENT）。不得自创。
- 证据：直接书目/人物事实一项合格 A/B 来源即可；解释型关系需两项独立来源；AI 记忆不是来源；搜索摘要不是来源；豆瓣可证中文版存在与书目，不得作文学事实/解释唯一依据。
- 层级：区分 work / collection / edition；不同中译名不建重复实体，译名记入 aliases。
- 状态词：candidate / hold / disputed / research_gap / pending / reject；不确定就 fail-closed。

## 既有实体摘要（查重用）

- 帕斯：`exists` V1-ENT-0059（reuse）。
- 三部作品：`new`（主库无同名实体；请再以 LIKE 自查一遍，含《孤独的迷宫》/《寂寞的迷宫》等译名变体）。
- 可复用地点：墨西哥 V1-ENT-0051、墨西哥城 V1-ENT-0056。
- 可复用运动：先锋派 V1-ENT-0132、现代主义 V1-ENT-0131。
- 主题参考：面具游戏与自我的折叠 V1-ENT-0107、跨文化与美洲身份 V1-ENT-0108、美洲与西方传统 V1-ENT-0109（是否适用由证据决定）。

## 必需输出（写入 candidates/C_paz/）

1. `SOURCE_CANDIDATES.csv` — 列：temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url,access_status,access_date,used_for
2. `ENTITY_CANDIDATES.csv` — 列：temporary_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes
3. `FACT_CANDIDATES.csv` — 列：temporary_id,origin_material_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note（subject_id 可指向 V1-ENT-0059 或 CAND-C-* 作品临时 ID；fact_field 先 `SELECT DISTINCT fact_field FROM facts` 复核既有词表）
4. `RELATION_CANDIDATES.csv` — 列：temporary_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,evidence_count,issue_code,source_temporary_ids,evidence_notes
5. `TRANSLATION_AUDIT.csv` — 每作品一行：temporary_work_id,original_title,name_zh,aliases_zh,translator,publisher,publication_year,isbn,translation_status,verification_source_temporary_id,verification_url,access_date,edition_notes（status 词表：verified_single_volume / verified_collection / verified_old_edition / verified_traditional_chinese / pending / not_found）
6. `SOURCE_NOTES.md` — 每个来源的 claim-to-evidence 映射与引用要点。
7. `ISSUES.md` — 重复风险、hold、gap、冲突、未决问题。
8. `HANDOFF.md` — 状态、QA 自查（ID 唯一、CSV 可解析、引用回指）、文件清单、下一步。
9. 聊天中只返回 compact handoff（对象数、来源数、关键 hold）。

## 验收标准

- 每列枚举合法、临时 ID 唯一且互指有效；来源有真实 URL/ISBN/持久标识与访问状态；CREATED 有直接书目来源；解释关系有 2 独立来源或显式 hold；中译核验逐作品给出 translation_status 与核验来源；无 AI 记忆冒充来源；未写主库。

## 停止条件

- 全部对象完成候选或显式 hold/pending/gap；不得为凑数降级证据；不碰主库与治理文件；不回传完整长篇原文。
