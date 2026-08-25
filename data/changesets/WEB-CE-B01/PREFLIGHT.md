# WEB-CE-B01 Preflight Artifact（Batch 01 差量恢复版）

- 任务 ID：`WEB-CE-B01`（WEB-CONTENT-EXPANSION Batch 01）
- 预检执行：PM（V4 Pro, high）· 2026-08-18
- 恢复说明：本批次此前已完成的 Phase 0 / Phase 1 结论全部复用；无任何旧 candidate / review / migration 草稿落盘，Research 及之后各阶段全部 NOT_STARTED。
- 依据：`AGENTS.md`、`project/governance/PROJECT_CHARTER.md`、`project/tasks/V2_TASKS.md`、`docs/data/数据新增与版本维护操作手册.md`、`project/plans/拉丁美洲文学地图_60位作家扩充计划_中译本优先版.md`、`literature-content-batch`、`lalm-*` skills。

## 1. 仓库与主库基线（COMPLETED_AND_REUSABLE）

- 当前分支：`codex/web01-map-experience` @ 17dfa23（= PR #6 合并内容；origin/main 为 PR #6 squash 88903bb，树内容一致）。批次分支将建为 `content/batch-01-paz-fuentes-mistral`。
- 工作树：仅有 3 个未跟踪项（ReadyPack、artifacts/v2-rc5、60 位作家扩充计划 md），无已跟踪修改；不得覆盖。
- 主库：`data/master/V1_MASTER.sqlite`，schema 0.3，PRAGMA 状态待 QA 复验。
- 迁移日志：已应用 `0001_rc5_work_context_sources`、`0002_rc5_explosion_context`（task V2-N4-R04）；**下一迁移号 = 0003**。
- 元数据：relationship_threshold=75，v1_1_expansion_target=150，research_version=1.0.1-rc5。
- 实体 144（author 14 / work 28 / collection 11 / theme 29 / movement 8 / place 22 / event 5 / institution 6 / person 5 / character 10 / adaptation 4 / edition 2）；关系 76；CREATED 38。
- 正式 ID 下一序号：entity `V1-ENT-0145+`、fact `V1-FCT-0260+`、relationship `V1-REL-0077+`、card `V1-CARD-0041+`、source `SRC-0087+`、evidence `V1-EV-0092+`。（以 live DB 复核为准。）

## 2. 范围决策（USER 已授权）

- 计划新作家 3 位 → 查重：**帕斯已存在**（V1-ENT-0059，author，无作品、无卡片、无事实）。
- USER 选择**方案 B**：帕斯按已有作家处理；已有作家追加扩至 **14 部**（帕斯 3 + 建议池 11，突破默认 11 部上限，USER 明确授权）；新作家 = 富恩特斯、米斯特拉尔 2 位；作品总量上限 20。
- 不扩大作者/作品范围；不启动 Batch 02。

## 3. 实体查重矩阵（COMPLETED_AND_REUSABLE）

| 对象 | 类型 | 查重结论 | 处理 |
|---|---|---|---|
| 奥克塔维奥·帕斯 | author | `exists` V1-ENT-0059（无作品/卡片/事实） | 复用实体，补事实+3 作品 |
| 卡洛斯·富恩特斯 | author | `new` | 新建 |
| 加夫列拉·米斯特拉尔 | author | `new` | 新建 |
| 《孤独的迷宫》《太阳石》《弓与琴》 | work | `new`（无同名实体） | 新建 work，CREATED→V1-ENT-0059 |
| 《奥拉》《阿尔特米奥·克罗斯之死》《最明净的地区》 | work | `new` | 新建，CREATED→富恩特斯 |
| 《绝望集》《柔情集》《塔拉集》 | collection | `new` | 新建 collection（原版诗集层级），CREATED→米斯特拉尔 |
| 建议池 11 部 | work/collection | `new`（28 部现存作品无冲突；聂鲁达既有《二十首情诗…》《大地上的居所》《漫歌》与《一百首爱情十四行诗》不同） | 新建，CREATED→各已有作者 |

- 已有作者 ID：博尔赫斯 V1-ENT-0002 / 马尔克斯 V1-ENT-0072 / 科塔萨尔 V1-ENT-0073 / 卡彭铁尔 V1-ENT-0074 / 略萨 V1-ENT-0114 / 聂鲁达 V1-ENT-0115 / 李斯佩克朵 V1-ENT-0016。
- 既有可复用来源线索：SRC-0066（BnF 目录，含 Bestiario/Las armas secretas）、SRC-0036（Nobel 1982 页面，米斯特拉尔 1945 需另建）、各作者 BnF/CVC/Nobel 既有来源按需复用。
- 地点基线：墨西哥 V1-ENT-0051、墨西哥城 V1-ENT-0056、智利 V1-ENT-0123、圣地亚哥 V1-ENT-0128、马德里 V1-ENT-0129、阿根廷 V1-ENT-0001。
- 运动基线：文学爆炸 V1-ENT-0130、墨西哥革命小说 V1-ENT-0064、魔幻现实主义 V1-ENT-0099、新巴洛克 V1-ENT-0101、先锋派 V1-ENT-0132、现代主义 V1-ENT-0131。
- 事件基线：1982 诺贝尔文学奖 V1-ENT-0112（1945 / 1990 诺奖为候选新事件）。

## 4. 中文译本预检（计划层，具体核验属 Worker）

- 三位作者按计划均为 T1；米斯特拉尔为「合集型」（中文《柔情》/诗选完整覆盖三集，具体版本由 Worker 核验）。
- 每部作品必须产出：规范中文名、别名、译者、出版社、年份、ISBN（可确认时）、translation_status（verified_single_volume / verified_collection / verified_old_edition / verified_traditional_chinese / pending / not_found）、核验来源。
- 核验来源优先级：出版社书目 > 国家图书馆/权威馆藏 > ISBN/书业目录 > 豆瓣具体版本页（仅证存在与书目，不作文学事实证据）。
- 无可靠中译本的作品：不占额度，由同作者中译可靠作品替代并说明理由；绝不凑数。

## 5. 证据与 Schema 规则（Worker 必守）

- 来源等级 A/B/C/D；直接书目事实可单来源（A/B）；解释型关系（ASSOCIATED_WITH_MOVEMENT / EXPLORES_THEME / INFLUENCED_BY / RESPONDS_TO_WORK）需两项独立可靠来源，否则 hold_needs_second_source。
- 结构关系最低证据：CREATED 一项直接作者—作品来源；SET_IN 原作或合格来源直接说明；BASED_ON_EVENT 仅 work→event 且 ≥1 项 A 级直接表达；ASSOCIATED_WITH_PLACE 需具体可说明的关联性质。
- 关系词仅限 Schema 0.3 的 13 词；不得自创（BORN_IN、PUBLISHED_IN、PARTICIPATED_IN_EVENT 等禁用）。
- 出生地写 `birth_place`-类事实（如既有 fact_field 允许），不建 BORN_IN；出版年用 first_publication_year / first_book_edition_year 等既有字段，不用 PUBLISHED_IN。
- AI 记忆不是来源；必须打开原页核验；搜索摘要只作线索；豆瓣不作解释性判断唯一依据。

## 6. 恢复状态清单

- COMPLETED_AND_REUSABLE：Phase 0 Orient；Phase 1 预检矩阵（本文件第 1—5 节）。
- REVIEW_PASS：无。
- NEEDS_REVISE：无。
- NOT_STARTED：批次分支、Worker A/B/C 研究、Worker D 池研究、独立 Reviewer、串行 Integration、Geo、Curation、Web Data、QA、Git/PR、Batch Report。
- STATUS_UNCLEAR：无（已核查 data/changesets 与全仓库，无遗留 Batch 01 产物）。
