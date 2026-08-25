# TASK_PACKET — WEB-CE-B01 / Worker D（已有作家追加 11 部 + 全批次中译查重）

- task ID：`WEB-CE-B01-R-D`
- 批次目标：拉美文学地图 WEB-CONTENT-EXPANSION Batch 01。USER 已授权方案 B：已有作家追加共 14 部（帕斯 3 部由 Worker C 负责 + 本 packet 建议池 11 部）。
- 角色：Research Worker（V4 Flash, high）。只生产 candidates，不自审。
- 启动时机：Worker A/B/C 完成后运行（PM 会给你 A/B/C 的 TRANSLATION_AUDIT.csv 路径做交叉查重）。
- 停止条件：本 packet 全部对象产出候选或明确标记 hold/pending/gap 后停止；不得研究 packet 外对象；不启动 Batch 02。

## 分配对象（11 部，全部未开始；已有作者全部 reuse）

| 作者（正式 ID） | 作品 | 原文 | 类型建议 |
|---|---|---|---|
| 博尔赫斯 V1-ENT-0002 | 《沙之书》 | El libro de arena（1975，短篇集） | collection |
| 博尔赫斯 V1-ENT-0002 | 《布罗迪报告》 | El informe de Brodie（1970，短篇集） | collection |
| 马尔克斯 V1-ENT-0072 | 《霍乱时期的爱情》 | El amor en los tiempos del cólera（1985，长篇小说） | work |
| 马尔克斯 V1-ENT-0072 | 《族长的秋天》 | El otoño del patriarca（1975，长篇小说） | work |
| 科塔萨尔 V1-ENT-0073 | 《秘密武器》 | Las armas secretas（1959，短篇集） | collection |
| 略萨 V1-ENT-0114 | 《绿房子》 | La casa verde（1966，长篇小说） | work |
| 略萨 V1-ENT-0114 | 《潘达雷昂上尉与劳军女郎》 | Pantaleón y las visitadoras（1973，长篇小说） | work |
| 聂鲁达 V1-ENT-0115 | 《一百首爱情十四行诗》 | Cien sonetos de amor（1959，诗集） | collection |
| 李斯佩克朵 V1-ENT-0016 | 《隐秘的幸福》 | Felicidade clandestina（1971，短篇集） | collection |
| 卡彭铁尔 V1-ENT-0074 | 《方法的资源》 | El recurso del método（1974，长篇小说） | work |
| 卡彭铁尔 V1-ENT-0074 | 《巴洛克协奏曲》 | Concierto barroco（1974，中篇） | work |

- 实体层级以实际文献形态为准（work / collection / edition 区分；同名不同层分开）。
- CREATED 关系候选：各作者 → 各自作品。
- 中文译本核验：逐部核验规范中文名、别名、译者、出版社、年份、ISBN（可确认时）、translation_status、核验来源。
- 事实候选（作品）：first_publication_year、genre_or_form、story_premise（仅据来源释义）、setting_place、key_character、bibliographic_note。
- 解释/地点关系候选（从严）：例如《霍乱时期的爱情》SET_IN（卡塔赫纳等，需直接证据）、《绿房子》SET_IN（皮乌拉等，需直接证据）、ASSOCIATED_WITH_PLACE；解释型（EXPLORES_THEME/运动）仅两项独立合格来源时提出，否则 hold_needs_second_source。无证据不要硬凑。
- 交叉查重：核对 Worker A/B/C 的 TRANSLATION_AUDIT.csv（PM 提供路径），报告全批次译名/别名冲突与重复作品风险（例如米斯特拉尔中文合集同时收录《绝望集》等，不得再建重复实体）。

## 允许文件与动作

- 只读 sqlite3 查询 `data/master/V1_MASTER.sqlite`（查重、看既有用法；严禁任何写操作）。
- 可读：`data/changesets/WEB-CE-B01/PREFLIGHT.md`、`data/changesets/WEB-CE-B01/candidates/*/TRANSLATION_AUDIT.csv`、`DSH_LALM_Harness_ReadyPack/AGENTS.md`（如需核对规则原文）。
- 输出只写入 `data/changesets/WEB-CE-B01/candidates/D_existing_additions/`。
- 网络：用 web_search 发现线索，用 curl 打开原页核验（记录 access_status：access_pass / access_blocked）；打不开的页面不得假装已核验。

## 禁止

写 `V1_MASTER.sqlite`；分配 `V1-ENT/V1-FCT/V1-REL/SRC-` 正式 ID（只用 CAND-D-* 临时 ID；作者实体只引用既有 V1 正式 ID）；批准自己的输出；修改 `project/governance/PROJECT_CHARTER.md`/`project/tasks/TASKS.md`/`project/tasks/V2_TASKS.md`/`CHANGELOG.md`；git 操作；改 `site/`；研究 packet 外对象。

## 规则与 Schema（摘要，权威原文见 PREFLIGHT.md）

- 关系词仅限 Schema 0.3 十三词；不得自创。
- 证据：直接书目事实一项合格 A/B 来源即可；解释型关系需两项独立来源；AI 记忆不是来源；搜索摘要不是来源；豆瓣可证中文版存在与书目，不得作文学事实/解释唯一依据。
- 可复用来源线索：SRC-0066（BnF 目录，含 Bestiario 与 Las armas secretas 记录，可直接复用为《秘密武器》书目来源）；其余既有 BnF/CVC/诺贝尔官网/出版社页按需复用（只读查询 sources 表核对）。
- 状态词：candidate / hold / disputed / research_gap / pending / reject；不确定就 fail-closed。

## 必需输出（写入 candidates/D_existing_additions/）

1. `SOURCE_CANDIDATES.csv` — 列：temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url,access_status,access_date,used_for（复用既有 SRC 时在 used_for 注明 reuse:<SRC-ID>，不重复建候选）
2. `ENTITY_CANDIDATES.csv` — 列：temporary_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes
3. `FACT_CANDIDATES.csv` — 列：temporary_id,origin_material_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note
4. `RELATION_CANDIDATES.csv` — 列：temporary_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,evidence_count,issue_code,source_temporary_ids,evidence_notes
5. `TRANSLATION_AUDIT.csv` — 每作品一行：temporary_work_id,original_title,name_zh,aliases_zh,translator,publisher,publication_year,isbn,translation_status,verification_source_temporary_id,verification_url,access_date,edition_notes（status 词表：verified_single_volume / verified_collection / verified_old_edition / verified_traditional_chinese / pending / not_found）
6. `CROSS_AUDIT.md` — 全批次（含 A/B/C 输出）译名/别名冲突与重复实体风险报告。
7. `SOURCE_NOTES.md`、`ISSUES.md`、`HANDOFF.md` — 同 A/B/C 要求。
8. 聊天中只返回 compact handoff（对象数、来源数、复用 SRC、关键 hold）。

## 验收标准

- 每列枚举合法、临时 ID 唯一且互指有效；来源有真实 URL/ISBN/持久标识与访问状态；CREATED 有直接书目来源；解释关系有 2 独立来源或显式 hold；中译核验逐作品给出 translation_status 与核验来源；无 AI 记忆冒充来源；未写主库。

## 停止条件

- 全部对象完成候选或显式 hold/pending/gap；不得为凑数降级证据；不碰主库与治理文件；不回传完整长篇原文。
