# TASK_PACKET — WEB-CE-B01 / Worker A（卡洛斯·富恩特斯）

- task ID：`WEB-CE-B01-R-A`
- 批次目标：拉美文学地图 WEB-CONTENT-EXPANSION Batch 01（新作家富恩特斯、米斯特拉尔；已有作家帕斯补作品；已有作家追加 14 部）。
- 角色：Research Worker（V4 Flash, high）。只生产 candidates，不自审。
- 停止条件：本 packet 全部对象产出候选或明确标记 hold/pending/gap 后停止；不得研究 packet 外对象；不启动 Batch 02。

## 分配对象（全部未开始）

1. 新作家实体：卡洛斯·富恩特斯（Carlos Fuentes，墨西哥小说家/散文家，1928 巴拿马城出生，2012 墨西哥城逝世——**以上身份信息必须用来源核验，不得凭 AI 记忆直接入库**）。
2. 三部作品实体（type=work）：
   - 《最明净的地区》La región más transparente（1958，长篇小说）
   - 《奥拉》Aura（1962，中篇/novella）
   - 《阿尔特米奥·克罗斯之死》La muerte de Artemio Cruz（1962，长篇小说）
3. CREATED 关系候选：富恩特斯 → 3 部作品。
4. 中文译本核验：每部作品的规范中文名、别名、译者、出版社、出版年份、ISBN（可确认时）、translation_status、核验来源。已有中文版的通行版本请实际核验（如《阿尔特米奥·克罗斯之死》外国文学出版社旧版、《最明净的地区》云南人民版等，须打开书目页确认，勿凭记忆）。
5. 事实候选（作者）：birth_year、death_year、country_or_region、language、出生地（以 fact 记录，禁止 BORN_IN 关系）、one_sentence_summary、career_note、nationality_history、award（仅来源明确时）。
6. 事实候选（作品）：first_publication_year、genre_or_form、story_premise（低剧透导读，仅据来源释义）、setting_place、key_character、bibliographic_note。
7. 解释型关系**候选**（从严）：ASSOCIATED_WITH_MOVEMENT 文学爆炸（V1-ENT-0130）、《阿尔特米奥·克罗斯之死》与墨西哥革命小说的 EXPLORES_THEME/运动关联、SET_IN 墨西哥城（《最明净的地区》）、ASSOCIATED_WITH_PLACE 墨西哥城。解释型必须两项独立合格来源，凑不齐就标记 `hold_needs_second_source`；SET_IN 需原作或合格来源直接说明场景。

## 允许文件与动作

- 只读 sqlite3 查询 `data/master/V1_MASTER.sqlite`（查重、看既有用法；严禁任何写操作）。
- 可读：`data/changesets/WEB-CE-B01/PREFLIGHT.md`、`DSH_LALM_Harness_ReadyPack/AGENTS.md`（如需核对规则原文）。
- 输出只写入 `data/changesets/WEB-CE-B01/candidates/A_fuentes/`。
- 网络：用 web_search 发现线索，用 curl 打开原页核验（记录 access_status：access_pass / access_blocked）；打不开的页面不得假装已核验。

## 禁止

写 `V1_MASTER.sqlite`；分配 `V1-ENT/V1-FCT/V1-REL/SRC-` 正式 ID（只用 CAND-A-* 临时 ID）；批准自己的输出；修改 `PROJECT_CHARTER.md`/`TASKS.md`/`V2_TASKS.md`/`CHANGELOG.md`；git 操作；改 `site/`；研究 packet 外对象。

## 规则与 Schema（摘要，权威原文见 PREFLIGHT.md）

- 关系词仅限 Schema 0.3 十三词：CREATED、CONTAINS_WORK、EDITION_OF、TRANSLATION_OF、ADAPTED_FROM、DIRECTED、SET_IN、ASSOCIATED_WITH_PLACE、ASSOCIATED_WITH_MOVEMENT、EXPLORES_THEME、RESPONDS_TO_WORK、INFLUENCED_BY、BASED_ON_EVENT。不得自创。
- 证据：直接书目事实一项合格 A/B 来源即可；解释型关系需两项独立来源（同一 DOI 页/PDF/转载不算独立）；AI 记忆不是来源；搜索摘要不是来源；豆瓣可证中文版存在与书目，不得作文学事实/解释唯一依据。
- 层级：区分 work / collection / edition；不同中译名不建重复作品实体，译名记入 aliases。
- 状态词：candidate / hold / disputed / research_gap / pending / reject；不确定就 fail-closed。

## 既有实体摘要（查重用）

- 富恩特斯及三部作品：`new`（主库无同名实体；请再以 LIKE 自查一遍）。
- 可复用地点：墨西哥 V1-ENT-0051、墨西哥城 V1-ENT-0056、马德里 V1-ENT-0129。
- 可复用运动：文学爆炸 V1-ENT-0130、墨西哥革命小说 V1-ENT-0064、先锋派 V1-ENT-0132。
- 主题参考：暴力与语言 V1-ENT-0068、时间与历史 V1-ENT-0067、城市浪漫与偶然 V1-ENT-0111、面具游戏与自我的折叠 V1-ENT-0107（是否适用由证据决定）。

## 必需输出（写入 candidates/A_fuentes/）

1. `SOURCE_CANDIDATES.csv` — 列：temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url,access_status,access_date,used_for
2. `ENTITY_CANDIDATES.csv` — 列：temporary_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes
3. `FACT_CANDIDATES.csv` — 列：temporary_id,origin_material_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note（fact_field 用主库既有词表：birth_year/death_year/country_or_region/language/one_sentence_summary/career_note/nationality_history/award/personal_note/story_premise/setting_place/key_character/genre_or_form/first_publication_year/bibliographic_note 等，先 `SELECT DISTINCT fact_field FROM facts` 复核）
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
