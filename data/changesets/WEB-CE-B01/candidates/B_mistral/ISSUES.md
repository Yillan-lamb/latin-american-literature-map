# ISSUES — WEB-CE-B01 / Worker B（米斯特拉尔）

## 一、Holds（显式挂起）

- **HOLD-001（运动归属）**：CAND-B-REL-006（米斯特拉尔 ↔ 现代主义 V1-ENT-0131）→ `hold_needs_second_source`。仅 Nobel 官网 1 项合格来源（"influenced by the modernist movement"）；UGR（CAND-B-SRC-006）与 CORE（CAND-B-SRC-007）两项学术来源未打开核验，两项独立来源未凑齐。按 packet 规则显式 hold，不降级通过。先锋派（V1-ENT-0132）未发现任何合格来源支持，不提出。
  - 补充线索（供 Reviewer/下一轮）：UGR 文档搜索片段将 Mistral 与 Alfonsina Storni 并列为 "posmodernistas"；CORE 文档片段称评论界在 Desolación 早期诗作中看到 "filiazione modernista"。两者表述互补（现代主义影响 + 后现代主义归类），若开页核验成功可构成第二来源。

## 二、Gaps / pending

- **GAP-001（中译核验未完成）**：TRANSLATION_AUDIT 三行分别为 pending / pending / not_found。原因：PM 收尾指令禁止新网页抓取，仅存的豆瓣/图书馆目录线索页未打开。最关键的未决问题：中文《柔情》（线索：赵振江译、疑漓江出版社）是否完整收入三集（即计划所称"合集型"），须开页核验实际收录范围后方可定 verified_collection。
- **GAP-002（《绝望集》释义）**：CAND-B-ENT-002 的 one_sentence_summary 未提出（Britannica topic 页被 Cloudflare 拦截）；现仅有 Nobel"first major work"表述（归入 CREATED 证据与 career 语境）。待补。
- **GAP-003（比库尼亚坐标）**：CAND-B-ENT-006 无坐标。按 AGENTS.md，坐标为 Geo 层职责；Research 层不伪造坐标。下一轮需以权威地理来源（GeoNames 等）核验后由 Geo 阶段补入。
- **GAP-004（事件关系缺口）**：13 词关系词表无"获奖者→奖项事件"关系类型（PARTICIPATED_IN_EVENT 等禁用），故 1945 诺奖事件实体（CAND-B-ENT-005）与米斯特拉尔的关联仅经 author 的 `award` fact（CAND-B-FCT-009）承载；事件实体自身仅挂 event_year_range/one_sentence_summary 事实。BASED_ON_EVENT 仅适用于 work→event，本对象不适用（无作品以该事件为题材）。

## 三、重复风险 / 命名冲突（自查结论）

- 主库 LIKE 自查（%Mistral%、%米斯特拉尔%、%绝望%、%柔情%、%塔拉%、Desolación/Ternura/Tala）：**无同名实体**。唯一近似命中为聂鲁达《二十首情诗和一支绝望的歌》（V1-ENT-0119）——其中文名含"绝望"二字，但与《绝望集》Desolación 为不同作品；入库后别名/搜索层面可能并现，非实体重复，无需合并。建议 Reviewer 知悉即可。
- 事件实体与既有 V1-ENT-0112（1982 年诺贝尔文学奖）为不同年份、不同获奖者，命名模式一致（"YYYY 年诺贝尔文学奖"），不重复。
- 智利 V1-ENT-0123、圣地亚哥 V1-ENT-0128 复用，不新建。

## 四、Schema / 词表问题（需 PM/Reviewer 决策）

- **VOCAB-001（birth_place 字段缺失）**：既有 fact_field 词表（SELECT DISTINCT 复核）无 `birth_place`。packet 要求出生地作 fact（"如 birth_place 类既有字段"）。本包以 CAND-B-FCT-012 提出 `birth_place` 为新增字段候选（admission_status=candidate_for_staging_review），同一信息另经 ASSOCIATED_WITH_PLACE→比库尼亚（CAND-B-REL-005，符合库内作者出生地既有惯例，如马尔克斯→阿卡塔卡）承载。是否批准新字段由 Reviewer/PM 决定；若不批准，出生地信息可由 one_sentence_summary 与关系描述覆盖。
- **VOCAB-002（award 事实写法核对）**：CAND-B-FCT-009 沿用 V1-FCT-0122 的 `award=诺贝尔文学奖（1945）` 写法，无新增字段。

## 五、其他未决

- 主题关系（EXPLORES_THEME → V1-ENT-0024/0027）**未提出**：Nobel 页有主题线索（love/sorrow/nature/children 等）但仅 1 项来源，且与 packet 分配的主题参考（无限与不可言说、女性写作）无 2 源支撑；按从严原则留 research_gap，不凑数。
- 出生地"Elqui 河谷"与"比库尼亚"关系：本包以单一 place（比库尼亚，Elqui 河谷内）承载，未另建 Elqui 河谷实体；如需河谷级地点由 PM 裁定。
- 豆瓣仅作书目存在性线索（CAND-B-SRC-008），未用作任何文学事实/解释证据。

## 六、停止条件核对

- packet 全部对象已产出候选或显式 hold/pending/gap；未研究 packet 外对象；未写主库；未分配正式 ID；未改治理文件；无 git 操作。
