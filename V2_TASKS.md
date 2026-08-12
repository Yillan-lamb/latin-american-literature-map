# 拉丁美洲文学地图 V2 任务源

- **版本**：1.0.0
- **最后更新**：2026-08-12
- **状态**：ACTIVE
- **唯一动态状态源**：本文件
- **上位文件**：
  - `PROJECT_CHARTER.md`
  - `V2_网站产品决策与开发总说明书.md`
  - `V2_执行体系与任务清单.md`

## 当前执行摘要

- **当前阶段**：阶段 8：V2-N4 正式发布准备
- **当前节点**：`V2-N1`、`V2-N2`、`V2-N3` 已完成；当前用户节点为 `V2-N4`
- **当前任务**：`V2-N4` 正式公开发布审核（👤 USER_REVIEW）
- **下一任务**：等待 USER 集中审核 rc.3 策展项、产品一致性与是否正式公开发布
- **当前阻塞**：无；正式部署仍受 USER 批准、HTTPS origin 与 Pages 设置约束
- **需要 USER**：待 R02 完成后集中审核策展项与 `V2.0.0-rc.3`，并决定是否正式公开发布
- **最近完成**：`V2-N4-R02` 产品一致性差量返修；形成 `V2.0.0-rc.3`，rc.2 作为历史候选保留

## 任务状态规则

- `✅ DONE`：已完成并通过内部验收；
- `🔵 IN_PROGRESS`：当前正在执行；
- `⏳ READY`：依赖已满足，可以执行；
- `🔒 LOCKED`：因上游任务或用户节点未通过而锁定；
- `⚠️ REVISION`：验收未通过，需要差量返修；
- `👤 USER_REVIEW`：等待 USER 节点审核；
- `✅ APPROVED`：USER 节点已通过并解锁下游；
- `⛔ BLOCKED`：存在外部依赖或无法自主解决的问题。

同一时间原则上只保留一个 `IN_PROGRESS` 任务。每完成一个任务，必须在本文件登记状态、产物、验证结果和下游解锁情况。

## 阶段 0：V2 执行体系初始化

### ✅ V2-S0-001：V2 治理与执行体系初始化

- **负责人**：`CODEX-PM`
- **依赖**：V2-N1 已批准
- **完成内容**：
  - `PROJECT_CHARTER.md` 按 USER 明确授权由 1.4.0 增量升级至 1.5.0；
  - 登记 V2 最高专项说明书和 V2 执行体系；
  - 建立本 V2 唯一动态任务源；
  - 新增 DEC-040；
  - 同步 `CHANGELOG.md` 与 `README.md`；
  - 完成 Charter V1 规则保留、V2 必要条款和格式自检。
- **产物**：`V2_TASKS.md`、`PROJECT_CHARTER.md`、DEC-040、同步后的 `CHANGELOG.md` 与 `README.md`
- **验证**：`git diff --check` 通过；V1 来源、数据、版权和 GitHub 规则仍存在；V2 治理关键词和节点齐全。
- **状态**：`✅ DONE`

## 阶段 1：V2 数据准备

### ✅ V2-S1-001：V2 网站数据适配审计

- **负责人**：`CODEX-DATA / CODEX-PM`
- **依赖**：V2-S0-001
- **目标**：基于 V1.0.0 正式数据，审计作者、作品、地点、主题、运动、事件、关系、事实、内容卡、来源、hold 和 research gap 对网站的可用性。
- **产物**：`docs/V2_DATA_READINESS_AUDIT.md`
- **验收**：结论逐项来自正式 V1 数据；页面可用性、地图字段、文学地点关系、策展字段、AI 审核分层、N2 样本和阻断问题均有明确分类。
- **下游**：通过后解锁 V2-S1-002。
- **完成结果**：`docs/V2_DATA_READINESS_AUDIT.md` 已生成；基于 V1.0.0 主库完成实体、页面、地图、策展、AI 审核和 N2 阻断审计；主库验证 pass。
- **状态**：`✅ DONE`

### ✅ V2-S1-002：地图数据补充与 QA

- **负责人**：`CODEX-DATA / CODEX-REVIEW`
- **依赖**：V2-S1-001
- **产物**：`data/v2/geo/`、`docs/V2_MAP_DATA_QA.md`
- **验收**：现实/虚构分类、国家到地点层级、可靠坐标来源、地图状态和文学地点关系可追溯；虚构空间无伪精确现实坐标。
- **完成结果**：已生成 `PLACES_GEO.csv` 与 `PLACE_RELATIONS.csv`；覆盖 22 个 V1 地点实体和 25 条 V1 地点关系；完成现实/虚构/待定分类、父级技术节点、坐标精度、来源登记、地图状态和虚构空间无坐标 QA。
- **验证**：CSV 字段宽度一致；V1 地点实体 22/22 覆盖；V1 地点关系 25/25 一一对应；`v1_relationship_id` 全部可回溯；虚构空间坐标为空；`git diff --check` 通过。
- **下游**：解锁 V2-S2-001。
- **状态**：`✅ DONE`

## 阶段 2：V2 网站数据层

### ✅ V2-S2-001：建立 Curation Data Schema

- **负责人**：`CODEX-DATA / CODEX-PM`
- **依赖**：V2-S1-002
- **产物**：`docs/V2_CURATION_SCHEMA.md`、`data/v2/curation/`
- **验收**：Research Data 与 Curation Data 分离，支持 `auto_approved`、`user_review`、`hold`，策展推荐不写入研究关系。
- **完成结果**：固定三类策展文件 `CURATION_ENTRIES.csv`、`CURATION_SELECTIONS.csv`、`CURATION_RECOMMENDATIONS.csv`；明确字段、目标 ID、来源引用、展示范围、双层阅读和审核门禁；当前仅保留表头，内容留到 N2 样本阶段。
- **验证**：Schema、README 和三个 CSV 表头已建立；Research/Curation 边界、三类审核状态和推荐不入研究关系规则已写明。
- **下游**：解锁 V2-S2-002。
- **状态**：`✅ DONE`

### ✅ V2-S2-002：建立 Web Data Schema 与构建流程

- **负责人**：`CODEX-DATA`
- **依赖**：V2-S2-001
- **产物**：`docs/V2_WEB_DATA_SCHEMA.md`、构建/QA 脚本、`data/v2/web/`
- **验收**：Research Data + Curation Data 可重复生成面向页面消费的 Web Data；前端无研究事实硬编码；QA 可发现悬空引用和缺字段。
- **完成结果**：建立 `scripts/build_v2_web_data.py` 与 `scripts/validate_v2_web_data.py`，生成 `data/v2/web/site_data.json` 和 `manifest.json`；输出页面、地图、搜索、时间线和研究回溯数据。
- **验证**：Web Data 构建成功；Web QA `PASS`；V1 主库验证 `pass`；本次输出包含 144 实体、40 内容卡、238 事实、76 关系、24 地点行、25 地点关系、74 来源；公共策展状态限定为 `auto_approved_only`。
- **下游**：解锁 V2-S3-001。
- **状态**：`✅ DONE`

## 阶段 3：V2-N2 原型内容准备

### ✅ V2-S3-001：确定 N2 真实样本集

- **负责人**：`CODEX-PM`
- **依赖**：V2-S2-002
- **产物**：`docs/V2_N2_SAMPLE_SET.md`
- **验收**：至少覆盖 2—3 个国家、3—4 位作家、4—6 部作品、2 个现实地点、1—2 个文学虚构空间和少量时间节点。
- **完成结果**：确定巴西、墨西哥、哥伦比亚三国；4 位作者；6 部有 V1 内容卡且 `meets` 的作品；4 个现实地点；科马拉、马孔多 2 个虚构空间；2 个保留现有审核状态的事件节点；页面覆盖矩阵已登记。
- **验证**：所有样本 ID 可在 V1 主库或 V2 地图技术层回溯；research gap 作品未进入主样本；巴西国家层使用技术父级，不新增 V1 研究实体。
- **下游**：解锁 V2-S3-002。
- **状态**：`✅ DONE`

### ✅ V2-S3-002：生成 N2 最小策展包

- **负责人**：`CODEX-PM / CODEX-REVIEW`
- **依赖**：V2-S3-001
- **产物**：N2 样本对应的 `data/v2/curation/` 数据
- **验收**：有明确依据的内容进入 `auto_approved`；价值判断、跨作品比较和阅读推荐统一进入 `user_review`；依据不足保持 `hold`。
- **完成结果**：生成 16 条自动准入文案、19 条 N2 展示选择、1 条 `user_review` 阅读推荐和 1 条 `hold` 跨作品比较；明确排除 research gap 作品和候选事件导语。
- **验证**：CSV 字段宽度一致；Web Data 构建与 QA `PASS`；公共策展仅含 `auto_approved`，两条待审记录单独进入 `review_queue`；虚构空间仍无现实坐标。
- **产物补充**：`docs/V2_N2_MINIMAL_CURATION_QA.md`。
- **下游**：解锁 V2-S4-001。
- **状态**：`✅ DONE`

## 阶段 4：V2-N2 核心交互原型

### ✅ V2-S4-001：技术选型与网站基础框架

- **负责人**：`CODEX`
- **依赖**：V2-S3-002
- **产物**：技术选择说明、基础网站工程、路由骨架、基础设计系统
- **范围**：静态优先、Web Data 驱动、支持地图和移动端，不建设无必要后端。
- **完成结果**：建立 `site/` 静态单页框架、hash 路由、响应式设计系统、Web Data 加载入口和双层阅读容器；技术选型与边界见 `docs/V2_TECHNICAL_FOUNDATION.md`。
- **验证**：Web Data 构建/QA `PASS`；`node --check site/app.js` 通过；`git diff --check` 通过。
- **下游**：解锁 V2-S4-002。
- **状态**：`✅ DONE`

### ✅ V2-S4-002：首页与两级文学地图原型

- **负责人**：`CODEX`
- **依赖**：V2-S4-001、V2-S1-002
- **产物**：首页、国家级地图、国家到地点交互、精选作家和策展入口原型
- **完成结果**：首页以地图为主入口，消费 `place_kind`、`parent_place_id`、`map_status`、`map_relation_role` 和策展精选数据；已实现国家→地点下钻、现实/虚构筛选、精选作者/作品入口。
- **验证**：真实 Web Data 加载；巴西技术父级、墨西哥、哥伦比亚国家层可见；虚构空间不显示现实坐标；前端未写入样本实体事实；响应式与可见焦点样式已建立。
- **产物补充**：`docs/V2_HOME_MAP_PROTOTYPE.md`。
- **下游**：解锁 V2-S4-003。
- **状态**：`✅ DONE`

### ✅ V2-S4-003：核心页面模板原型

- **负责人**：`CODEX`
- **依赖**：V2-S4-001、V2-S3-002
- **产物**：国家页、现实地点页、文学虚构空间页、作家页、作品页模板
- **完成结果**：建立国家页、现实地点页、虚构空间页、作者页、作品页及 hash 路由；页面接入阅读/研究双层，关系、坐标、状态和来源均来自 Web Data。
- **验证**：五类路由和真实 N2 ID 可消费；现实/虚构视觉边界与无坐标规则已接入；研究层面板可展开；`node --check site/app.js` 通过。
- **产物补充**：`docs/V2_PAGE_TEMPLATES.md`。
- **下游**：解锁 V2-S4-004。
- **状态**：`✅ DONE`

### ✅ V2-S4-004：搜索与时间线原型

- **负责人**：`CODEX`
- **依赖**：V2-S4-001、V2-S2-002
- **产物**：基础搜索与文学时期到具体节点的时间线原型
- **完成结果**：建立 `#/search`、带查询参数的搜索结果、`#/timeline` 时间线；搜索消费 `search_index`，时间线以 28 个文学作品节点为主体并保留 5 个历史背景节点的审核状态。
- **验证**：中文名/原文名搜索路径、作品节点、历史背景弱化和状态展示已接入；Web Data 构建/QA `PASS`；`node --check site/app.js` 通过。
- **产物补充**：`docs/V2_SEARCH_TIMELINE.md`。
- **下游**：解锁 V2-S4-005。
- **状态**：`✅ DONE`

### ✅ V2-S4-005：N2 原型 QA 与审核包

- **负责人**：`CODEX-REVIEW / CODEX-PM`
- **依赖**：V2-S4-002、V2-S4-003、V2-S4-004
- **产物**：`docs/V2_N2_PROTOTYPE_REVIEW.md`
- **验收**：数据引用、地图坐标、链接、移动端基础表现、hold/gap、图片许可、策展审核状态和前端硬编码检查通过。
- **完成结果**：完成自动化数据 QA、Web Data 构建 QA、前端硬编码/远程资产扫描、静态入口 smoke test 和 N2 手工审核矩阵；未发现阻断问题。
- **验证**：V1 主库 `pass`；Web Data QA `PASS`；`node --check site/app.js` 通过；`git diff --check` 通过；静态 HTTP 入口与 Web Data 均返回 200。
- **下游**：提交 V2-N2 USER_REVIEW。
- **状态**：`✅ DONE`

### ✅ APPROVED V2-N2：核心交互原型审核

- **依赖**：V2-S4-005
- **状态**：`✅ APPROVED`
- **审核包**：`docs/V2_N2_PROTOTYPE_REVIEW.md`
- **USER 决定**：USER 于 2026-08-11 回复“可以，继续执行”，同意继续 V2 完整数据接入与网站开发。
- **USER 重点审核**：产品感觉、首页、地图、国家到地点逻辑、文学可读性、页面探索路径、研究层和手机端基本体验。
- **通过效果**：解锁阶段 5—7；阶段 8、N4 仍需后续用户节点。

## 阶段 5：完整数据与策展接入

### ✅ V2-S5-001：完整页面覆盖计划

- **负责人**：`CODEX-PM / CODEX-DATA`
- **依赖**：V2-N2 已批准
- **产物**：`docs/V2_FULL_PAGE_COVERAGE.md`、`data/v2/qa/V2_PAGE_COVERAGE.csv`
- **验收**：逐项标明作者、作品、地点、国家和关联节点的页面级别、内容卡状态、地图状态、研究缺口和后续动作；不把缺卡实体静默当作完整页。
- **完成结果**：生成 145 行覆盖清单，明确 7 个国家页、10 个完整作者页、17 个完整作品页、3 个研究缺口页、16 个地点/虚构空间页、5 个时间线背景节点和关联节点策略。
- **验证**：V1 144 个实体全部覆盖；CSV 主键、字段宽度和页面状态 QA `PASS`；研究缺口、无卡实体、无坐标地点和隐藏节点均保留边界。
- **产物补充**：`docs/V2_FULL_PAGE_COVERAGE.md`、`scripts/build_v2_coverage_plan.py`。
- **下游**：解锁 V2-S5-002。
- **状态**：`✅ DONE`

### ✅ V2-S5-002：批量生成策展草稿

- **负责人**：`CODEX-DATA / CODEX-REVIEW`
- **依赖**：V2-S5-001
- **产物**：完整站所需 Curation Data 草稿、生成记录和 QA
- **验收**：有明确依据的内容进入 `auto_approved`；强判断和推荐进入 `user_review`；依据不足保持 `hold`。
- **完成结果**：批量生成 51 条策展文案，其中 47 条 `auto_approved`、4 条 `hold`；保留原有 1 条 `user_review` 推荐和 1 条 `hold` 比较；没有覆盖 N2 已审核记录。
- **验证**：批量生成报告、CSV 字段 QA、Web Data 构建与 Web QA `PASS`；research gap 作品和阿什格罗夫分类问题保持 hold；策展推荐未写入研究关系。
- **产物补充**：`docs/V2_FULL_CURATION_DRAFTS_QA.md`、`scripts/build_v2_full_curation_drafts.py`。
- **下游**：解锁 V2-S5-003。
- **状态**：`✅ DONE`

### ✅ V2-S5-003：策展 USER_REVIEW 汇总

- **负责人**：`CODEX-PM`
- **依赖**：V2-S5-002
- **产物**：批量策展审核汇总包
- **验收**：所有待审内容集中、可回溯、说明需要 USER 判断的原因；不零散打断用户。
- **完成结果**：集中整理 1 条 `user_review` 阅读推荐、1 条 `hold` 跨作品比较、3 条研究缺口作品和 1 条未确认地点分类；明确 Codex 建议与公共发布门禁。
- **验证**：6 条记录均可在 Web Data `review_queue` 回溯；未批准内容未进入公共策展层；不阻塞不消费这些记录的完整站开发。
- **产物补充**：`docs/V2_CURATION_USER_REVIEW.md`。
- **下游**：解锁 V2-S6-001。
- **状态**：`✅ DONE`

## 阶段 6：完整网站开发

### ✅ V2-S6-001：首页完整化

- **负责人**：`CODEX`
- **依赖**：V2-S5-003
- **产物**：完整首页、入口排序、专题/筛选入口、首页 QA
- **验收**：完整数据覆盖进入首页但不把数据库全集平铺；首页精选、阅读路径和研究层入口可追溯。
- **完成结果**：首页保留 4 位精选作者和 6 部精选作品，同时接入 10 位完整作者、17 部完整作品的继续发现入口；地图、搜索、时间线和研究层入口均由 Web Data 驱动。
- **验证**：`docs/V2_HOME_FULL.md`；Web Data 构建与 QA `PASS`；`node --check site/app.js` 通过；`git diff --check` 通过。
- **下游**：解锁 V2-S6-002。
- **状态**：`✅ DONE`

### ✅ V2-S6-002：地图完整化

- **负责人**：`CODEX`
- **依赖**：V2-S6-001、V2-S1-002
- **产物**：完整 V2 地图范围、国家→地点交互、现实/虚构空间边界、地图 QA
- **验收**：地图只使用三类 V2 空间；坐标、父级、状态、来源和隐藏规则一致。
- **完成结果**：地图默认消费 20 个非隐藏节点；国家→地点下钻、作者地理/故事空间/虚构空间筛选和现实/虚构坐标边界均接入。
- **验证**：`docs/V2_MAP_FULL.md`；Web Data QA `PASS`；地图关系角色与 Web Data 一致；`node --check site/app.js` 通过。
- **下游**：解锁 V2-S6-003。
- **状态**：`✅ DONE`

### ✅ V2-S6-003：作家、作品、地点页面完整化

- **负责人**：`CODEX`
- **依赖**：V2-S6-002、V2-S5-002
- **产物**：完整页面集合、研究缺口页、关联节点回退、链接 QA
- **验收**：覆盖计划逐项落地；缺卡、gap、hold 和无坐标节点不被静默确定化。
- **完成结果**：五类路由覆盖国家、地点、作者、作品和研究关联节点；研究缺口、无卡关联节点、作品集模块、地图关系和来源证据均保留对应状态。
- **验证**：`docs/V2_PAGES_FULL_QA.md`；Web Data QA `PASS`；`node --check site/app.js` 通过；`git diff --check` 通过。
- **下游**：解锁 V2-S6-004。
- **状态**：`✅ DONE`

### ✅ V2-S6-004：搜索完整化

- **负责人**：`CODEX`
- **依赖**：V2-S6-003、V2-S2-002
- **产物**：完整搜索索引、类型分组、空结果与回退状态
- **验收**：作者、作品、地点、国家和关联节点可检索；结果不引入前端硬编码事实。
- **完成结果**：搜索索引覆盖 144 个研究实体和 2 个技术地图父节点；加入类型分组、类型筛选、结果计数、空状态及关联节点回退路由。
- **验证**：`docs/V2_SEARCH_FULL_QA.md`；Web Data QA `PASS`；`node --check site/app.js` 通过。
- **下游**：解锁 V2-S6-005。
- **状态**：`✅ DONE`

### ✅ V2-S6-005：时间线完整化

- **负责人**：`CODEX / CODEX-REVIEW`
- **依赖**：V2-S6-004
- **产物**：正式文学时期、作品节点、必要背景节点和时间线 QA
- **验收**：文学节点为主体；历史事件弱化；年份和时期均可回溯；不把候选事实写成确定性编年。
- **完成结果**：时间线加入 10 个作家节点、28 个作品节点和 5 个历史背景节点，按时期分组，并保留具体年份与研究状态。
- **验证**：`docs/V2_TIMELINE_FULL_QA.md`；Web Data QA `PASS`；`node --check site/app.js` 通过。
- **下游**：解锁 V2-S6-006。
- **状态**：`✅ DONE`

### ✅ V2-S6-006：研究证据层完整化

- **负责人**：`CODEX-DATA / CODEX-REVIEW`
- **依赖**：V2-S6-005
- **产物**：页面研究层、来源入口、事实/关系状态、gap/hold 展示规则
- **验收**：已展示研究判断均能回到 V1 来源或 V2 地理来源；策展推荐与研究关系分离。
- **完成结果**：事实、关系、策展依据、坐标来源和分类来源均可在页面研究层回查；研究缺口、关联节点、hold 与 user_review 不被公共策展层确定化。
- **验证**：`docs/V2_RESEARCH_EVIDENCE_QA.md`；Web Data QA `PASS`；`node --check site/app.js` 通过。
- **下游**：解锁 V2-S6-007。
- **状态**：`✅ DONE`

### ✅ V2-S6-007：响应式与可访问性优化

- **负责人**：`CODEX`
- **依赖**：V2-S6-006
- **产物**：桌面/平板/手机适配、键盘路径、焦点、错误/空状态和性能基础 QA
- **验收**：核心路径在窄屏可读可操作；减少动画设置生效；无外部未许可资产；404/fallback 可用。
- **完成结果**：补齐窄屏单列、移动导航、焦点、`aria-live`、`aria-pressed`、减动画滚动、加载/空/404/研究缺口状态和无外部资产门禁。
- **验证**：`docs/V2_RESPONSIVE_A11Y_QA.md`；HTTP smoke test 入口与 Web Data 均 `200`；前端事实扫描、远程资产扫描、Web Data QA、`node --check` 和 `git diff --check` 均通过。
- **下游**：解锁阶段 7 完整测试站 QA。
- **状态**：`✅ DONE`

- 阶段 6 详细任务已按依赖完成；以下 N3 USER_REVIEW 记录为历史节点快照。

## 阶段 7：V2-N3 完整测试站

### ✅ V2-S7-001：完整测试站内部 QA

- **完成结果**：完成 Web Data、HTTP、前端事实扫描、外部资产扫描、路由契约、可访问性契约、语法和差异检查。
- **验证**：入口与 Web Data 均返回 `200`；Web Data schema `v2-web-0.2`；`node --check`、`git diff --check` 和 Web QA 均通过。
- **状态**：`✅ DONE`

### ✅ V2-S7-002：N3 完整测试站审核包

- **产物**：`docs/V2_N3_FULL_TEST_SITE_REVIEW.md`
- **完成结果**：整理完整站模块矩阵、自动化 QA、已知非阻断待审项和 USER 体验审核重点。
- **下游**：提交 `V2-N3` USER_REVIEW。
- **状态**：`✅ DONE`

### 👤 V2-N3：完整测试站审核

- **审核包**：`docs/V2_N3_FULL_TEST_SITE_REVIEW.md`
- **状态**：`👤 USER_REVIEW`
- **等待内容**：首页、完整地图、页面边界、搜索、时间线、研究层和手机端体验意见。

### ✅ APPROVED V2-N3：完整测试站审核

- **USER 决定**：USER 于 2026-08-11 回复“通过，继续执行”，确认完整测试站达到发布准备条件。
- **通过效果**：解锁阶段 8；正式公开发布仍需 V2-N4 单独批准。

## 阶段 8：V2-N4 正式发布准备

### ✅ V2-S8-001：发布前数据与内容冻结（rc.1 历史候选）

- **产物**：`data/v2/release/V2.0.0_RELEASE_MANIFEST.json`、`docs/V2_RELEASE_DATA_FREEZE.md`
- **完成结果**：固定 V2.0.0-rc.1 的 12 个输入文件、SHA-256、Web Data 统计和排除规则；候选状态为 `pending_v2_n4`。该候选在 Sol 审计后由 R01 生成新候选替代。
- **验证**：冻结清单生成成功；Web Data schema `v2-web-0.2`；无静默替换规则。
- **状态**：`✅ DONE`

### ✅ V2-S8-002：版权与公开边界终审

- **产物**：`docs/V2_PUBLIC_BOUNDARY_QA.md`
- **完成结果**：V2 候选范围不纳入 PDF、EPUB、原书全文、整书 OCR、inputs、Cookie、密钥或环境变量；公共部署副本移除 `review_queue`，仅保留 `auto_approved` 策展层。
- **验证**：发布候选范围、站点资产和敏感文件扫描通过。
- **状态**：`✅ DONE`

### ✅ V2-S8-003：生产部署候选验证

- **产物**：`.github/workflows/v2-pages.yml`、`scripts/build_v2_deploy_bundle.py`、`docs/V2_DEPLOYMENT_PREP.md`
- **完成结果**：建立需手动触发、需确认 `V2_SITE_ORIGIN` 的 GitHub Pages 部署候选流程；根目录静态包、404、JS、CSS、manifest 和公开 Web Data 本地验证通过。
- **边界**：正式 HTTPS 域名、Pages 设置、公开 URL 和实际部署等待 N4，不在 N4 前产生外部发布动作。
- **状态**：`✅ DONE`

### ✅ V2-S8-004：生成 V2 发布说明（rc.1 历史候选）

- **产物**：`docs/V2_RELEASE_NOTES.md`
- **完成结果**：整理 V2.0 实现范围、与 V1 数据库关系、已知问题、部署前置条件和后续 backlog；原候选版本标记为 `V2.0.0-rc.1`，R01 后更新为 rc.2。
- **状态**：`✅ DONE`

### ✅ V2-S8-R01：Sol 独立审计整改

- **输入**：`docs/V2_SOL_AUDIT_REPORT.md`。
- **范围**：修复地图布局与路由、国家关系聚合、unknown/hidden 地点语义、sitemap、冻结候选校验、构建脚本帮助/干运行和治理文档漂移；不确认 research gap、hold、user_review 或未确认地点分类。
- **产物**：修复后的 `site/`、V2 数据/构建脚本、`V2.0.0-rc.2` 冻结清单、更新后的 QA 与发布说明。
- **验证**：V1 主库验证、Web Data 重建/校验、页面覆盖重建、release manifest SHA-256 校验、公开部署副本边界、前端语法与 `git diff --check` 均通过；pending 候选被部署门禁拒绝。
- **状态**：`✅ DONE`

### ✅ V2-N4-R02：V2.0 产品一致性与公开发布差量返修

- **性质**：独立返修；不以 PR #4、rc.2 或历史 N3 通过结论替代最高产品说明书核验。
- **目标**：保留 Research / Geo / Curation / Web Data、构建脚本和双层数据架构，只修复公众产品层、静态发布层与发布完整性缺口，形成 `V2.0.0-rc.3`。
- **成果包**：
  - `R02-A Public Product Cleanup`：清理公众界面的版本、阶段、内部字段、审核状态和数据库语言；
  - `R02-B Author / Work Product Pages`：补齐文学探索式作家页和文学导读式作品页；
  - `R02-C Homepage Curation`：补首页正式策展阅读入口；
  - `R02-D Real Literary Map`：引入真实拉丁美洲国家边界底图与真实坐标投影；
  - `R02-E Timeline & Search Productization`：将搜索和时间线转换为普通读者可理解的文学探索入口；
  - `R02-F Static Routes & SEO`：生成可索引静态路由、页面 meta 与 sitemap；
  - `R02-G Release Integrity`：修复 Git commit 锚定、manifest verifier、发布冻结范围与 PR CI；
  - `R02-H Browser / Performance QA`：执行 Chromium、Firefox、WebKit、桌面/移动端与 Lighthouse 验收。
- **强制审计材料**：`docs/V2_RC3_PRODUCT_AUDIT.md`、`docs/V2_RC3_PUBLIC_UI_QA.md`、`docs/V2_RC3_CURATION_USER_REVIEW.md`、`docs/V2_RC3_BROWSER_PERFORMANCE_QA.md`、`docs/V2_RC3_RELEASE_INTEGRITY_QA.md`。
- **发布边界**：不 merge、不创建 tag、不创建 GitHub Release、不执行 Pages 正式部署、不发布正式 URL、不将 V2-N4 标为 USER APPROVED。
- **最终状态**：内部 QA 完成后，本任务转 `✅ DONE`，`V2-N4` 必须重新停在 `👤 USER_REVIEW`。
- **完成结果**：公共身份统一为“拉丁美洲文学地图”；新增 Presentation Layer、5 条阅读路径、17 部作品 why_read、10 条 next_read、5 个文学时期；真实国家边界地图、公众化作家/作品/地点/搜索/时间线/About、146 条静态路由与页面 SEO 已落地。公共部署包物理剥离内部状态字段，Git 候选提交锚定、PR CI 和 Pages 门禁完成加固。
- **验证**：V1/Web Data/静态包/公共语言/Release Manifest 内部门禁通过；Chromium、Firefox、WebKit 在桌面和 390px 的 9 条核心路径全部通过；Lighthouse 98/100/100/100；审计材料见 `docs/V2_RC3_*.md`。
- **产物**：`V2.0.0-rc.3`、`data/v2/presentation/PUBLIC_PRESENTATION.json`、真实底图、静态路由构建、发布完整性脚本、V2 CI 与 5 份 rc.3 审计/QA 文档。
- **状态**：`✅ DONE`

### 👤 V2-N4：正式公开发布审核

- **审核包**：`docs/V2_RC3_PRODUCT_AUDIT.md`、`docs/V2_RC3_PUBLIC_UI_QA.md`、`docs/V2_RC3_CURATION_USER_REVIEW.md`、`docs/V2_RC3_BROWSER_PERFORMANCE_QA.md`、`docs/V2_RC3_RELEASE_INTEGRITY_QA.md`
- **状态**：`👤 USER_REVIEW`
- **等待内容**：USER 审核 rc.3 策展项、产品一致性与是否创建 V2.0.0 正式版本并公开部署。当前 manifest 仍为 `pending_v2_n4`。

## 当前执行边界

- 当前推进到阶段 8；`V2-N4-R02` 已完成，当前停在 `V2-N4 = 👤 USER_REVIEW`。
- 在 N4 通过前，不创建 V2.0.0 tag、不推送发布分支、不执行 Pages 部署、不发布正式公开 URL。
- 不提前开发复杂知识图谱、3D 地图、用户系统、AI 问答、CMS、小程序、多语言或个性化推荐。
- 不在前端硬编码研究事实，不用策展写作补造研究事实，不为虚构空间伪造现实坐标。
- 普通机械工作由 Codex 自主推进；产品定位、核心用户、地图主结构、研究证据标准、V2.0 范围、重要无依据策展判断和 N3—N4 节点由 USER 决定。
