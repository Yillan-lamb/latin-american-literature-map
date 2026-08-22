# REVIEW — WEB-CE-B01 包 1（A/B/C 作家研究）独立复核

- 评审任务：WEB-CE-B01-REVIEW-ABC
- 角色：Independent Reviewer（fresh context, V4 Pro, high）
- 日期：2026-08-18
- 输入：`candidates/A_fuentes/`、`B_mistral/`、`C_paz/` 各 8 文件；`review/PM_SUPPLEMENT_VERIFICATION.md`；`PREFLIGHT.md`
- 核对方式：只读 sqlite3 查询 `data/master/V1_MASTER.sqlite`（entities/facts/relationships/sources 词表与既有 ID）；未写主库、未分配正式 ID、未改候选文件、无 git 操作、未评审 D 目录。
- 判词语义：PASS=候选行可进入 staging；REVISE=候选/审计行须修复（下附 delta）；HOLD=证据不足或冲突未决，不进正式数据（写明缺什么）。`admission_status=gap` 的行非候选，单列统计"正确排除"，不计入 PASS/REVISE/HOLD。

## 0. 主库核验结论（只读）

- 既有实体核对无误：帕斯 V1-ENT-0059（无 facts/relationships，补事实合法）、墨西哥 V1-ENT-0051、墨西哥城 V1-ENT-0056、智利 V1-ENT-0123、圣地亚哥 V1-ENT-0128、文学爆炸 V1-ENT-0130、墨西哥革命小说 V1-ENT-0064、现代主义 V1-ENT-0131、先锋派 V1-ENT-0132、1982 诺奖 V1-ENT-0112、主题 V1-ENT-0107/0108、聂鲁达 V1-ENT-0115 及《二十首情诗…》V1-ENT-0119 均存在。
- fact_field 词表（DISTINCT）：**无 `birth_place`**（有 key_place / setting_place / first_publication_year / first_book_edition_year / event_year_range / entity_layer / award / research_note 等）→ 支持 D1 论证；无 PUBLISHED_IN/BORN_IN 关系词（库内关系仅 9 词在用，均在 13 词内）。
- CREATED 端点先例：V1-REL-0062 = 聂鲁达 author→collection（《二十首情诗…》），author→collection 的 CREATED 合法；ASSOCIATED_WITH_PLACE 先例 V1-REL-0071/0056 evidence_count=1 → 单直接来源即够（非解释型）。
- 事件先例：V1-ENT-0112（1982 诺奖）确无 facts；event_year_range 用法见 V1-FCT-0221。运动库无超现实主义实体 → D2 的 entity_gap 成立。
- 下一序号与 PREFLIGHT 一致（ENT-0145+ / FCT-0260+ / REL-0077+ / SRC-0087+）。

## 1. 目录 A（富恩特斯）逐项 verdict

### 1.1 SOURCE_CANDIDATES（7 行：2 pass / 5 blocked，全部如实）
| item_id | verdict | 理由 |
|---|---|---|
| CAND-A-SRC-01 | PASS | BnF data 权威记录真实（URL/ark/VIAF 齐全），access_pass 与实际一致，B 级匹配；birthPlace=Paris 与通行说冲突已如实标注并转 hold，未当定论 |
| CAND-A-SRC-02 | PASS | BnF 检索页真实打开；限注明：会话快照 URL（jsessionid）不适长期引用，整合时应改引目录记录页或保留 access_date 快照注记 |
| CAND-A-SRC-03~07 | PASS | Britannica/LC/BBC/Guardian/Wikipedia 均如实标 access_blocked，无假装核验，不作证据 |

### 1.2 ENTITY_CANDIDATES（4 行）
| item_id | verdict | 理由 |
|---|---|---|
| CAND-A-ENT-01 | PASS | 作者身份正确（1928–2012，墨西哥），BnF 双来源归名；通行中译名'富恩特斯' |
| CAND-A-ENT-02 | PASS | 《最明净的地区》work 层级正确；TRANSLATION_PENDING 由 PM 核验解除（见 REVISE-1） |
| CAND-A-ENT-03 | HOLD | 《奥拉》pending 成立：本轮零已核验来源（BnF 可见面未现、其余被拦），实体不进正式数据；缺作品级来源（BnF 作品记录页或 Britannica） |
| CAND-A-ENT-04 | PASS | 《阿尔特米奥·克罗斯之死》work 层级正确；TRANSLATION_PENDING 同 REVISE-1 |

### 1.3 FACT_CANDIDATES（23 行：7 candidate + 1 hold + 15 gap）
| item_id | verdict | 理由 |
|---|---|---|
| CAND-A-FCT-01/02/03 | PASS | birth_year 1928 / death_year 2012 / country_or_region 墨西哥，均直引 BnF JSON-LD（birthDate/deathDate/nationality），A/B 单源合格 |
| CAND-A-FCT-05/06 | PASS | one_sentence_summary / career_note 为 BnF description 直译最小版，来源直接支持 |
| CAND-A-FCT-10/19 | PASS | bibliographic_note 仅证目录归名（8/5 条记录），未夸大出版细节，写法合规 |
| CAND-A-FCT-07 | HOLD | 出生地冲突（BnF 巴黎 vs 通行巴拿马城）按 packet 以 hold 记录、禁 BORN_IN——处置正确；缺第二独立来源仲裁，禁止把"巴黎"当定论入库 |
| CAND-A-FCT-04/08/09/11~18/20~23 | gap 正确排除 | 15 条 gap 全部如实（语言/国籍史/奖项/首版年/体裁/释义/场景/人物均待核），无一条冒充候选；FCT-22 通行说法显式标注"不得直接采用" |

### 1.4 RELATION_CANDIDATES（9 行）
| item_id | verdict | 理由 |
|---|---|---|
| CAND-A-REL-01/02 | PASS | CREATED→两作品，BnF 目录归名即直接书目来源（B 级单源满足最低证据） |
| CAND-A-REL-03 | HOLD | CREATED→《奥拉》0 来源，hold/NEEDS_SOURCE 正确；缺作品级来源 |
| CAND-A-REL-04/08/09 | HOLD | 文学爆炸 / 墨西哥革命小说（解释型）0 来源，hold_needs_second_source 正确 |
| CAND-A-REL-05 | HOLD | 墨西哥城 0 来源（BnF 仅 Mexico 国家层级），缺直接关联性质证据 |
| CAND-A-REL-06 | HOLD（可从宽） | 墨西哥仅国籍单源即 hold——偏保守但可接受；按库内惯例（V1-REL-0071/0056 单源）与 packet（ASSOCIATED_WITH_PLACE 非解释型双来源清单），整合时可解除 hold，非强制 |
| CAND-A-REL-07 | HOLD | SET_IN 墨西哥城 0 直接场景证据，缺原作或合格来源说明 |

### 1.5 TRANSLATION_AUDIT（3 行）
| item_id | verdict | 理由 |
|---|---|---|
| CAND-A-ENT-02（最明净的地区） | REVISE | 见 REVISE-1：须并入 PM 核验数据（徐少军/云南人民/1993/ISBN 7-222-01047-5），status→verified_old_edition，禁止以 pending 入库 |
| CAND-A-ENT-04（阿尔特米奥·克罗斯之死） | REVISE | 见 REVISE-1：并入 PM 核验（亦潜/外国文学/1983，ISBN 未确认留 pending 注记），status→verified_old_edition |
| CAND-A-ENT-03（奥拉） | HOLD | 中译零核验且实体无来源，维持 pending；缺任何中文书目页 |

## 2. 目录 B（米斯特拉尔）逐项 verdict

### 2.1 SOURCE_CANDIDATES（11 行：3 pass / 8 blocked/pending，全部如实）
| item_id | verdict | 理由 |
|---|---|---|
| CAND-B-SRC-001/002/003 | PASS | Nobel 官网 Facts（英/中）+ Bibliography 三页 access_pass 属实；002 与 001 同源不单独计数——处置正确；书目页三集首版（1922/1924/1938）为直接书目来源 |
| CAND-B-SRC-004~007 | PASS | Britannica/Memoria Chilena/UGR/CORE 均如实 blocked，仅作线索不作证据 |
| CAND-B-SRC-008~011 | PASS | 豆瓣/河北 ILAS/广州/无锡四线索页均未打开如实 pending；注意 SRC-008 的豆瓣 subject/33437469 与 PM 核验页 subject/2266691 非同一页，整合时以 PM 页为准（并入 REVISE-2） |

### 2.2 ENTITY_CANDIDATES（6 行）
| item_id | verdict | 理由 |
|---|---|---|
| CAND-B-ENT-001 | PASS | 作者身份正确（Lucila Godoy Alcayaga，1889–1957），Nobel 官方来源 |
| CAND-B-ENT-002/003/004 | PASS | 三集为 collection（原版诗集层级），与 PREFLIGHT 一致；author→collection 的 CREATED 有 V1-REL-0062 先例 |
| CAND-B-ENT-005 | PASS | 1945 诺奖事件实体命名/类型参照 V1-ENT-0112，属 PREFLIGHT 授权候选新事件 |
| CAND-B-ENT-006 | PASS | 比库尼亚（Vicuña）真实地点（科金博大区 Elqui 河谷）；坐标未核验如实标 coords_pending，交 Geo 层 |

### 2.3 FACT_CANDIDATES（25 行，全部 candidate）
| item_id | verdict | 理由 |
|---|---|---|
| CAND-B-FCT-001~011 | PASS | 生卒年/国籍/语言/本名/笔名/履历/奖项/获奖理由/entity_layer 均直引 Nobel 页；'南美洲（拉丁美洲）首位'与原文 South America's first… 等价（1945 年前无任何拉美作家获奖），可接受 |
| CAND-B-FCT-012 | PASS（条件于 D1） | birth_place 新字段候选按 SOP-B 第 8 条提出，字段批准见 D1 verdict；建议 value 收敛为地点名'比库尼亚（Vicuña）'，河谷/大区细节移 usage_note；同信息由 REL-005 承载，禁 BORN_IN——合规 |
| CAND-B-FCT-013~023 | PASS | 三集首版年（1922/1924/1938）/体裁/书目注记/释义均直引 Nobel 书目页与 Facts 页 |
| CAND-B-FCT-024/025 | PASS | 事件 event_year_range=1945 与 one_sentence_summary，参照 V1-FCT-0221 写法 |

### 2.4 RELATION_CANDIDATES（6 行）
| item_id | verdict | 理由 |
|---|---|---|
| CAND-B-REL-001/002/003 | PASS | CREATED×3，Nobel Facts 作品段+书目页双页直接支持（≥1 合格来源） |
| CAND-B-REL-004/005 | PASS | ASSOCIATED_WITH_PLACE 智利/比库尼亚，单直接来源符合库内惯例（V1-REL-0071/0056）与 packet 非解释型要求 |
| CAND-B-REL-006 | HOLD | 现代主义归属仅 Nobel 1 项来源，UGR/CORE 未打开——hold_needs_second_source 正确；缺第二独立来源（建议补开 UGR 论文或 Britannica） |

### 2.5 TRANSLATION_AUDIT（3 行）
| item_id | verdict | 理由 |
|---|---|---|
| CAND-B-ENT-002（绝望集） | HOLD | 无独立单行本线索；中译诗选覆盖待核，status 维持 pending |
| CAND-B-ENT-003（柔情集） | HOLD | 见 REVISE-2：PM 已核漓江《柔情》（赵振江，首版 1992，多版次），但**收录范围未核验**，不得定 verified_collection，维持 pending |
| CAND-B-ENT-004（塔拉集） | HOLD | 见 REVISE-2：Worker B 记 not_found、PM 记 pending（线索=漓江选本可能收录）——统一为 pending 待目录页核验；未核验前不建任何 verified 状态 |

## 3. 目录 C（帕斯）逐项 verdict

### 3.1 SOURCE_CANDIDATES（15 行：6 pass / 9 blocked，全部如实）
| item_id | verdict | 理由 |
|---|---|---|
| CAND-C-SRC-001/002/003 | PASS | Nobel 官网 Facts/1990 主页面/Bibliography，A 级官方来源，access_pass 属实 |
| CAND-C-SRC-004 | PASS | poets.org（B）传记页，双来源角色清晰；'Modernist' 指国际现代主义、不映射库内 modernismo——处理正确 |
| CAND-C-SRC-005 | PASS | 内大图书馆 OPAC（B）MARC 细节完整（题名/译者赵振江王秋石/燕山 2014/ISBN 978-7-5402-3630-4/丛编'天下大师·帕斯作品'）；注意 OPAC 为机构服务地址，长期引用稳定性一般，建议整合时保留 access_date 快照 |
| CAND-C-SRC-006 | PASS | 豆瓣（D）仅用于《弓与琴》中译书目存在性，不作文学事实——合规 |
| CAND-C-SRC-007~015 | PASS | Britannica/Poetry Foundation/Biblio/Open Library/Encyclopedia.com/CVC/人大/北大医学/FCE 均如实 blocked，无假装核验 |

### 3.2 ENTITY_CANDIDATES（4 行）
| item_id | verdict | 理由 |
|---|---|---|
| CAND-C-W-001 | PASS | 《孤独的迷宫》work，1950 随笔集，双来源确认 |
| CAND-C-W-002 | PASS | 《弓与琴》work，1956 诗论，双来源确认 |
| CAND-C-W-003 | PASS | 《太阳石》work，1957 长诗，双来源确认 |
| CAND-C-EV-001 | PASS | 1990 诺奖事件实体，参照 V1-ENT-0112 格式，属授权候选新事件 |

### 3.3 FACT_CANDIDATES（25 行，全部 candidate）
| item_id | verdict | 理由 |
|---|---|---|
| CAND-C-FCT-001~004 | PASS | 生卒年/国籍/语言直引 Nobel Facts 页 |
| CAND-C-FCT-005 | PASS（条件于 D1） | birth_place=墨西哥城新字段候选，同 D1 处理 |
| CAND-C-FCT-006 | PASS | award 写法对齐 V1-FCT-0122 格式 |
| CAND-C-FCT-007/008 | PASS | 概括/履历由 Nobel+poets.org 双来源综合，逐项可回指 |
| CAND-C-FCT-009~023 | PASS | 三作品 entity_layer/首版年（1950/1956/1957）/体裁/释义/书目注记均直引 A/B 来源；Tezontle(FCE 诗丛)1957 与 FCE 1957 两说相容，未作冲突——处理正确 |
| CAND-C-FCT-024/025 | PASS | 事件年份与授奖理由（引 Nobel 官方中文转述），research_note 级 |

### 3.4 RELATION_CANDIDATES（8 行）
| item_id | verdict | 理由 |
|---|---|---|
| CAND-C-REL-001/002/003 | PASS | CREATED×3，Nobel+poets.org 双来源，端点 author→work 正确 |
| CAND-C-REL-004 | PASS | 墨西哥城关联（出生/逝世地、主要生活创作之城），双来源、关联性质具体可说明 |
| CAND-C-REL-005 | PASS | 墨西哥关联（获奖时居住国），单直接人物事实，符合库内惯例 |
| CAND-C-REL-006 | HOLD | 先锋派仅 poets.org 1 源（Barandal），缺第二来源，hold_needs_second_source 正确 |
| CAND-C-REL-007 | HOLD | 超现实主义双来源已备（Nobel A + poets.org B）但库内无此运动实体 → entity_gap hold 正确，不新建实体（D2） |
| CAND-C-REL-008 | HOLD | 《孤独的迷宫》→面具主题 0 直接来源（现有来源仅证'墨西哥历史与文化分析'），hold_needs_second_source 正确；缺论及'Máscaras mexicanas'的专门学术来源 |

### 3.5 TRANSLATION_AUDIT（3 行）
| item_id | verdict | 理由 |
|---|---|---|
| CAND-C-W-001 | PASS | verified_single_volume：B 级馆藏 OPAC 核验（赵振江、王秋石/燕山 2014/ISBN），译名变体《寂寞的迷宫》未核验到实例、只记 aliases 不建实体——合规 |
| CAND-C-W-002 | PASS | verified_single_volume：仅 D 级豆瓣书目支撑（赵振江等/燕山 2014-10/ISBN 9787540236311），按优先级可证存在与书目，可接受；建议后续以馆藏目录复核译者名单与 ISBN 以强化（不阻塞） |
| CAND-C-W-003 | HOLD | 《太阳石》中译 pending：燕山系列检索+豆瓣条目仅线索，未开任何中文书目页，单行本/选本未定；缺书目页核验（PM 亦未打开） |

## 4. 汇总计数

口径：PASS=候选行获批；REVISE=须修复；HOLD=挂起不进正式数据；gap 行单列（正确排除）。

| 目录 | PASS | REVISE | HOLD | gap（正确排除） | 行数合计 |
|---|---|---|---|---|---|
| A 富恩特斯 | 19（SRC 7 / ENT 3 / FCT 7 / REL 2） | 2（翻译 2） | 10（ENT 1 / FCT 1 / REL 7 / 翻译 1） | 15 | 46 |
| B 米斯特拉尔 | 47（SRC 11 / ENT 6 / FCT 25 / REL 5） | 0 | 4（REL 1 / 翻译 3） | 0 | 51 |
| C 帕斯 | 51（SRC 15 / ENT 4 / FCT 25 / REL 5 / 翻译 2） | 0 | 4（REL 3 / 翻译 1） | 0 | 55 |
| **合计** | **117** | **2** | **18** | **15** | **152** |

（注：SRC 行全部如实记录，均计 PASS；A 目录 HANDOFF 自称'8 条 candidate'，实际 candidate_for_staging_review 为 7 条（FCT-01/02/03/05/06/10/19），属 QA 计数笔误，不影响数据，整合时核对即可。）

## 5. REVISE delta 清单

- **REVISE-1（A 目录翻译行 ×2，必须修复，禁止以 pending 入库）**：
  - CAND-A-ENT-02《最明净的地区》：回填 PM 核验书目（译者 徐少军，另有王小方并见待 MARC 复核；云南人民出版社；1993；ISBN 7-222-01047-5；核验来源=金陵图书馆 MARC + 豆瓣 subject/1784891），translation_status → `verified_old_edition`；同步解除 ENT-02 的 TRANSLATION_PENDING issue_code。
  - CAND-A-ENT-04《阿尔特米奥·克罗斯之死》：回填 PM 核验书目（译者 亦潜；外国文学出版社；1983，页内另有 1987/1988 版次；ISBN 未确认，首印年留 pending 注记；核验来源=豆瓣 subject/2033810 + archive.org 扫描件），translation_status → `verified_old_edition`（含注记）；同步解除 ENT-04 的 TRANSLATION_PENDING。
  - 重新验证要求：两书均不得仅凭 PM 摘要入库，整合时以 PM 记录的 MARC/ISBN 字段原样迁移并挂到对应来源行。
- **REVISE-2（B 目录翻译行 ×3，必须修复/保持不变）**：
  - CAND-B-ENT-003《柔情》：核验来源更新为 PM 打开页（豆瓣 subject/2266691），回填 译者 赵振江 / 漓江出版社 / 首版 1992（多版次 2000/2005/2015/2016/2019）；status 保持 `pending`——**禁止新增 verified_collection**，直至目录页确认是否完整收入《绝望集》《柔情集》《塔拉集》。
  - CAND-B-ENT-002《绝望集》：status 保持 `pending`（线索=漓江选本可能收录，未核验）。
  - CAND-B-ENT-004《塔拉集》：Worker B 记 `not_found`、PM 记 `pending` 冲突 → 统一为 `pending`（线索=同一漓江选本，未核验），待目录页核验后复核；未核验前不建任何 verified 状态。
  - 保持不变：三行均不得因'计划称合集型'而先行定 verified_collection。

## 6. HOLD 清单与缺失证据

| 对象 | 缺失证据 | 解锁条件 |
|---|---|---|
| 《奥拉》实体 + CREATED + 中译（A） | 作品级来源 0 项（BnF 检索可见面未现；PM 未打开任何《奥拉》中文书目页） | 打开 BnF 作品记录页或 Britannica 条目证明作品存在与归属；中译按优先级补验 |
| 富恩特斯出生地值（A FCT-07） | BnF 标巴黎（单项可信度存疑）vs 通行巴拿马城，缺第二独立权威来源 | 重试 Britannica/LC/Wikipedia 任一并仲裁后定值 |
| 富恩特斯解释型/场景关系 ×6（REL-04/05/06/07/08/09） | 文学爆炸、墨西哥城、墨西哥、SET_IN、墨西哥革命小说均无或仅 1 来源 | 网络恢复后构建双来源证据组或直接场景证据 |
| 富恩特斯 15 条 gap（首版年/体裁/释义等） | 全部无已打开来源（BnF 作品记录页未开） | 补开作品级记录页 |
| 米斯特拉尔现代主义归属（B REL-006） | 仅 Nobel 1 源；UGR/CORE 学术文档未打开 | 打开 UGR 论文（posmodernista 归类）或 CORE 文档（modernista 渊源）任一项构成第二来源 |
| 米斯特拉尔三集中译 verified 状态（B 翻译 3 行） | 漓江《柔情》收录范围未核验（是否完整覆盖三集） | 打开漓江版目录页/出版社书目确认收录范围后定 verified_collection |
| 帕斯先锋派关联（C REL-006） | 仅 poets.org 1 源（Barandal） | 补第二独立来源（Britannica 403/CVC 404 重试或学术来源） |
| 帕斯超现实主义关联（C REL-007） | 双来源已备，缺库内运动实体 | 由 PM/后续批次决策是否新建超现实主义实体（D2） |
| 帕斯面具主题（C REL-008） | 0 直接来源；'Máscaras mexicanas' 需专门学术评论 | 补专门学术来源（≥2 独立） |
| 《太阳石》中译（C W-003） | 燕山'天下大师·帕斯作品'系列条目与豆瓣同名条目均未开页，单行本/选本未定 | 打开中文书目页确认译者/出版社/年份/ISBN |

## 7. 对 PM 决策草案的 verdict

- **D1（`birth_place` 作为新 fact_field 使用）→ PASS（有条件）**。依据充分：SOP-B 第 8 条明示'出生地先存为有来源的 birth_place 事实'；主库词表确认无此字段，属手册认可的事实字段扩展而非 Schema 关系词变更。条件：(a) 迁移时在 README/迁移日志注明依据（SOP-B §8 与本评审）；(b) 字段值收敛为地点名（B FCT-012 建议'比库尼亚（Vicuña）'，大区/河谷细节移 usage_note；C FCT-005 '墨西哥城（Ciudad de México）'可接受）；(c) 出生地一律不建 BORN_IN 关系（两包均合规）；(d) 富恩特斯出生地因冲突未决不写入本批（见 HOLD）。若 PM 最终不批准新字段，回退方案为并入既有 `key_place` 或 personal_note，B/C 两条事实须同步改写。
- **D2（帕斯超现实主义运动关联本批 hold，entity_gap）→ PASS**。库内确认无超现实主义 movement 实体（现有 8 运动：ultraísmo/墨西哥革命小说/魔幻现实主义/美洲神奇现实/新巴洛克/文学爆炸/现代主义/先锋派）；双来源（Nobel A + poets.org B）已备且独立，CAND-C-REL-007 的 hold+entity_gap 标注正确。本批不新建运动实体、不扩大范围——符合预检约束；建议后续批次作为独立决策项新建实体后解锁。
- **D3（《奥拉》不占正式作品额度，实体+CREATED 一并 hold）→ PASS**。与 A 目录实际产出一致：本轮无任何《奥拉》作品级来源（BnF 可见面未现、其余来源被拦、PM 未开页），hold 是唯一正确处置；富恩特斯本批入库 2 部作品（最明净的地区、阿尔特米奥·克罗斯之死）与 PM 草案一致，不凑数原则得到遵守。

## 8. 其他说明（供整合参考，非阻断）

- 跨 worker 一致性：ASSOCIATED_WITH_PLACE 证据门槛——B（智利/比库尼亚，单源 candidate）与 C（墨西哥，单源 candidate）与库内先例（V1-REL-0071/0056 单源）一致；A 的 REL-06（墨西哥，单源 hold）偏保守，非错误，整合时可按惯例解除。
- A 目录 HANDOFF QA 计数笔误（8 candidate vs 实际 7）——文档级问题，整合时核对。
- 引用稳定性：A SRC-02（BnF 检索会话 URL）、C SRC-005（内大 OPAC IP 地址）长期可引用性一般，建议来源行保留 access_date 与快照注记；B SRC-008 的豆瓣 subject 号与 PM 核验页不一致，以 PM 页（subject/2266691）为准。
- 版权边界：全部释义为低剧透单句级；Nobel 获奖理由为官方短引（research_note 级），无全文摘录。合规。
- 无任何将 hold_needs_second_source 写成 candidate 的项；无 AI 记忆冒充来源（中译线索均显式标注'非来源'）；gap 行未冒充候选。

## 9. 结论

- **目录 A（富恩特斯）**：数据主体 PASS（作者+2 作品实体、7 事实、2 CREATED）；2 条翻译行 REVISE（并入 PM 核验书目）；《奥拉》与全部解释型/场景关系维持 HOLD；15 gap 正确排除。
- **目录 B（米斯特拉尔）**：PASS（作者+3 诗集 collection+1945 诺奖事件+比库尼亚、25 事实、3 CREATED+2 地点关系）；现代主义归属 HOLD；三集中译 3 行 HOLD（收录范围未核验，禁 verified_collection）。
- **目录 C（帕斯）**：PASS（3 作品+1990 诺奖事件、25 事实、3 CREATED+2 地点关系）；先锋派/超现实主义/面具主题 3 关系 HOLD；《太阳石》中译 HOLD。
- PM 草案 D1 PASS（有条件）、D2 PASS、D3 PASS。
- 本批可进入正式数据的规模（在 REVISE-1/2 修复后）：实体 13（作者 2 新 + 作品 5 + 诗集 3 + 事件 2 + 地点 1，帕斯复用 V1-ENT-0059 不计新）、事实 57（A 7 / B 25 / C 25）、关系 12（A 2 / B 5 / C 5）、翻译核验 4 行 verified（2 verified_old_edition + 2 verified_single_volume）；其余 18 项 HOLD、15 项 gap 留待补验批次。
