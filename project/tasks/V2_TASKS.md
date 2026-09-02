# 拉丁美洲文学地图 V2 任务源

- **版本**：1.4.3
- **最后更新**：2026-08-31
- **状态**：ACTIVE
- **唯一动态状态源**：本文件
- **上位文件**：
  - `project/governance/PROJECT_CHARTER.md`
  - `project/plans/V2_网站产品决策与开发总说明书.md`
  - `project/plans/V2_执行体系与任务清单.md`

## 当前执行摘要

- **当前阶段**：V2 网站建设阶段 / Web 0.x 持续内容建设期
- **当前 Web 版本**：`Web 0.3.3 — DEVELOPMENT`
- **当前产品状态**：`DEVELOPMENT`
- **Public Release**：`PAUSED BY USER`
- **当前任务**：WCD-06 Author & Work Descriptive Content Completion（DONE）
- **下一任务**：WCD-07 READY / NOT STARTED；本 PR 不执行
- **后续顺序**：WCD-05 DONE → WCD-06 DONE → WCD-07 READY
- **路线边界**：顺序固定，不新增 WCD-08；旧 Global Audit 的 Data 1.2.0 / Web 0.2.1 数字只作历史输入，不得覆盖 WCD-04 在最新 `main` 上重算的 current baseline
- **需要 USER**：无需为合并开发基线立即审核全部 `user_review`；未来 Public Build 仍须排除未批准策展内容
- **最近完成**：`WEB-CONTENT-EXPANSION` B01—B17；rc.1—rc.5 与 Web 0.1.0 均作为历史开发记录保留

## 任务状态规则

- `✅ DONE`：已完成并通过内部验收；
- `🔵 IN_PROGRESS`：当前正在执行；
- `⏳ READY`：依赖已满足，可以执行；
- `🔒 LOCKED`：因上游任务或用户节点未通过而锁定；
- `⚠️ REVISION`：验收未通过，需要差量返修；
- `👤 USER_REVIEW`：等待 USER 节点审核；
- `✅ APPROVED`：USER 节点已通过并解锁下游；
- `⏸ PAUSED`：由 USER 暂停，只有 USER 明确重新开启后才恢复；
- `HISTORICAL`：仅保留历史与审计意义，不是当前任务；
- `⛔ BLOCKED`：存在外部依赖或无法自主解决的问题。

同一时间原则上只保留一个 `IN_PROGRESS` 任务。每完成一个任务，必须在本文件登记状态、产物、验证结果和下游解锁情况。

## 阶段 0：V2 执行体系初始化

### ✅ V2-S0-001：V2 治理与执行体系初始化

- **负责人**：`CODEX-PM`
- **依赖**：V2-N1 已批准
- **完成内容**：
  - `project/governance/PROJECT_CHARTER.md` 按 USER 明确授权由 1.4.0 增量升级至 1.5.0；
  - 登记 V2 最高专项说明书和 V2 执行体系；
  - 建立本 V2 唯一动态任务源；
  - 新增 DEC-040；
  - 同步 `CHANGELOG.md` 与 `README.md`；
  - 完成 Charter V1 规则保留、V2 必要条款和格式自检。
- **产物**：`project/tasks/V2_TASKS.md`、`project/governance/PROJECT_CHARTER.md`、DEC-040、同步后的 `CHANGELOG.md` 与 `README.md`
- **验证**：`git diff --check` 通过；V1 来源、数据、版权和 GitHub 规则仍存在；V2 治理关键词和节点齐全。
- **状态**：`✅ DONE`

## 阶段 1：V2 数据准备

### ✅ V2-S1-001：V2 网站数据适配审计

- **负责人**：`CODEX-DATA / CODEX-PM`
- **依赖**：V2-S0-001
- **目标**：基于 V1.0.0 正式数据，审计作者、作品、地点、主题、运动、事件、关系、事实、内容卡、来源、hold 和 research gap 对网站的可用性。
- **产物**：`project/audits/web/V2_DATA_READINESS_AUDIT.md`
- **验收**：结论逐项来自正式 V1 数据；页面可用性、地图字段、文学地点关系、策展字段、AI 审核分层、N2 样本和阻断问题均有明确分类。
- **下游**：通过后解锁 V2-S1-002。
- **完成结果**：`project/audits/web/V2_DATA_READINESS_AUDIT.md` 已生成；基于 V1.0.0 主库完成实体、页面、地图、策展、AI 审核和 N2 阻断审计；主库验证 pass。
- **状态**：`✅ DONE`

### ✅ V2-S1-002：地图数据补充与 QA

- **负责人**：`CODEX-DATA / CODEX-REVIEW`
- **依赖**：V2-S1-001
- **产物**：`data/v2/geo/`、`project/audits/web/V2_MAP_DATA_QA.md`
- **验收**：现实/虚构分类、国家到地点层级、可靠坐标来源、地图状态和文学地点关系可追溯；虚构空间无伪精确现实坐标。
- **完成结果**：已生成 `PLACES_GEO.csv` 与 `PLACE_RELATIONS.csv`；覆盖 22 个 V1 地点实体和 25 条 V1 地点关系；完成现实/虚构/待定分类、父级技术节点、坐标精度、来源登记、地图状态和虚构空间无坐标 QA。
- **验证**：CSV 字段宽度一致；V1 地点实体 22/22 覆盖；V1 地点关系 25/25 一一对应；`v1_relationship_id` 全部可回溯；虚构空间坐标为空；`git diff --check` 通过。
- **下游**：解锁 V2-S2-001。
- **状态**：`✅ DONE`

## 阶段 2：V2 网站数据层

### ✅ V2-S2-001：建立 Curation Data Schema

- **负责人**：`CODEX-DATA / CODEX-PM`
- **依赖**：V2-S1-002
- **产物**：`docs/data/V2_CURATION_SCHEMA.md`、`data/v2/curation/`
- **验收**：Research Data 与 Curation Data 分离，支持 `auto_approved`、`user_review`、`hold`，策展推荐不写入研究关系。
- **完成结果**：固定三类策展文件 `CURATION_ENTRIES.csv`、`CURATION_SELECTIONS.csv`、`CURATION_RECOMMENDATIONS.csv`；明确字段、目标 ID、来源引用、展示范围、双层阅读和审核门禁；当前仅保留表头，内容留到 N2 样本阶段。
- **验证**：Schema、README 和三个 CSV 表头已建立；Research/Curation 边界、三类审核状态和推荐不入研究关系规则已写明。
- **下游**：解锁 V2-S2-002。
- **状态**：`✅ DONE`

### ✅ V2-S2-002：建立 Web Data Schema 与构建流程

- **负责人**：`CODEX-DATA`
- **依赖**：V2-S2-001
- **产物**：`docs/web/V2_WEB_DATA_SCHEMA.md`、构建/QA 脚本、`data/v2/web/`
- **验收**：Research Data + Curation Data 可重复生成面向页面消费的 Web Data；前端无研究事实硬编码；QA 可发现悬空引用和缺字段。
- **完成结果**：建立 `scripts/build_v2_web_data.py` 与 `scripts/validate_v2_web_data.py`，生成 `data/v2/web/site_data.json` 和 `manifest.json`；输出页面、地图、搜索、时间线和研究回溯数据。
- **验证**：Web Data 构建成功；Web QA `PASS`；V1 主库验证 `pass`；本次输出包含 144 实体、40 内容卡、238 事实、76 关系、24 地点行、25 地点关系、74 来源；公共策展状态限定为 `auto_approved_only`。
- **下游**：解锁 V2-S3-001。
- **状态**：`✅ DONE`

## 阶段 3：V2-N2 原型内容准备

### ✅ V2-S3-001：确定 N2 真实样本集

- **负责人**：`CODEX-PM`
- **依赖**：V2-S2-002
- **产物**：`project/audits/archive/V2_N2_SAMPLE_SET.md`
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
- **产物补充**：`project/audits/archive/V2_N2_MINIMAL_CURATION_QA.md`。
- **下游**：解锁 V2-S4-001。
- **状态**：`✅ DONE`

## 阶段 4：V2-N2 核心交互原型

### ✅ V2-S4-001：技术选型与网站基础框架

- **负责人**：`CODEX`
- **依赖**：V2-S3-002
- **产物**：技术选择说明、基础网站工程、路由骨架、基础设计系统
- **范围**：静态优先、Web Data 驱动、支持地图和移动端，不建设无必要后端。
- **完成结果**：建立 `site/` 静态单页框架、hash 路由、响应式设计系统、Web Data 加载入口和双层阅读容器；技术选型与边界见 `docs/web/V2_TECHNICAL_FOUNDATION.md`。
- **验证**：Web Data 构建/QA `PASS`；`node --check site/app.js` 通过；`git diff --check` 通过。
- **下游**：解锁 V2-S4-002。
- **状态**：`✅ DONE`

### ✅ V2-S4-002：首页与两级文学地图原型

- **负责人**：`CODEX`
- **依赖**：V2-S4-001、V2-S1-002
- **产物**：首页、国家级地图、国家到地点交互、精选作家和策展入口原型
- **完成结果**：首页以地图为主入口，消费 `place_kind`、`parent_place_id`、`map_status`、`map_relation_role` 和策展精选数据；已实现国家→地点下钻、现实/虚构筛选、精选作者/作品入口。
- **验证**：真实 Web Data 加载；巴西技术父级、墨西哥、哥伦比亚国家层可见；虚构空间不显示现实坐标；前端未写入样本实体事实；响应式与可见焦点样式已建立。
- **产物补充**：`project/audits/archive/V2_HOME_MAP_PROTOTYPE.md`。
- **下游**：解锁 V2-S4-003。
- **状态**：`✅ DONE`

### ✅ V2-S4-003：核心页面模板原型

- **负责人**：`CODEX`
- **依赖**：V2-S4-001、V2-S3-002
- **产物**：国家页、现实地点页、文学虚构空间页、作家页、作品页模板
- **完成结果**：建立国家页、现实地点页、虚构空间页、作者页、作品页及 hash 路由；页面接入阅读/研究双层，关系、坐标、状态和来源均来自 Web Data。
- **验证**：五类路由和真实 N2 ID 可消费；现实/虚构视觉边界与无坐标规则已接入；研究层面板可展开；`node --check site/app.js` 通过。
- **产物补充**：`project/audits/archive/V2_PAGE_TEMPLATES.md`。
- **下游**：解锁 V2-S4-004。
- **状态**：`✅ DONE`

### ✅ V2-S4-004：搜索与时间线原型

- **负责人**：`CODEX`
- **依赖**：V2-S4-001、V2-S2-002
- **产物**：基础搜索与文学时期到具体节点的时间线原型
- **完成结果**：建立 `#/search`、带查询参数的搜索结果、`#/timeline` 时间线；搜索消费 `search_index`，时间线以 28 个文学作品节点为主体并保留 5 个历史背景节点的审核状态。
- **验证**：中文名/原文名搜索路径、作品节点、历史背景弱化和状态展示已接入；Web Data 构建/QA `PASS`；`node --check site/app.js` 通过。
- **产物补充**：`project/audits/archive/V2_SEARCH_TIMELINE.md`。
- **下游**：解锁 V2-S4-005。
- **状态**：`✅ DONE`

### ✅ V2-S4-005：N2 原型 QA 与审核包

- **负责人**：`CODEX-REVIEW / CODEX-PM`
- **依赖**：V2-S4-002、V2-S4-003、V2-S4-004
- **产物**：`project/audits/archive/V2_N2_PROTOTYPE_REVIEW.md`
- **验收**：数据引用、地图坐标、链接、移动端基础表现、hold/gap、图片许可、策展审核状态和前端硬编码检查通过。
- **完成结果**：完成自动化数据 QA、Web Data 构建 QA、前端硬编码/远程资产扫描、静态入口 smoke test 和 N2 手工审核矩阵；未发现阻断问题。
- **验证**：V1 主库 `pass`；Web Data QA `PASS`；`node --check site/app.js` 通过；`git diff --check` 通过；静态 HTTP 入口与 Web Data 均返回 200。
- **下游**：提交 V2-N2 USER_REVIEW。
- **状态**：`✅ DONE`

### ✅ APPROVED V2-N2：核心交互原型审核

- **依赖**：V2-S4-005
- **状态**：`✅ APPROVED`
- **审核包**：`project/audits/archive/V2_N2_PROTOTYPE_REVIEW.md`
- **USER 决定**：USER 于 2026-08-11 回复“可以，继续执行”，同意继续 V2 完整数据接入与网站开发。
- **USER 重点审核**：产品感觉、首页、地图、国家到地点逻辑、文学可读性、页面探索路径、研究层和手机端基本体验。
- **通过效果**：解锁阶段 5—7；阶段 8、N4 仍需后续用户节点。

## 阶段 5：完整数据与策展接入

### ✅ V2-S5-001：完整页面覆盖计划

- **负责人**：`CODEX-PM / CODEX-DATA`
- **依赖**：V2-N2 已批准
- **产物**：`project/plans/V2_FULL_PAGE_COVERAGE.md`、`data/v2/qa/V2_PAGE_COVERAGE.csv`
- **验收**：逐项标明作者、作品、地点、国家和关联节点的页面级别、内容卡状态、地图状态、研究缺口和后续动作；不把缺卡实体静默当作完整页。
- **完成结果**：生成 145 行覆盖清单，明确 7 个国家页、10 个完整作者页、17 个完整作品页、3 个研究缺口页、16 个地点/虚构空间页、5 个时间线背景节点和关联节点策略。
- **验证**：V1 144 个实体全部覆盖；CSV 主键、字段宽度和页面状态 QA `PASS`；研究缺口、无卡实体、无坐标地点和隐藏节点均保留边界。
- **产物补充**：`project/plans/V2_FULL_PAGE_COVERAGE.md`、`scripts/build_v2_coverage_plan.py`。
- **下游**：解锁 V2-S5-002。
- **状态**：`✅ DONE`

### ✅ V2-S5-002：批量生成策展草稿

- **负责人**：`CODEX-DATA / CODEX-REVIEW`
- **依赖**：V2-S5-001
- **产物**：完整站所需 Curation Data 草稿、生成记录和 QA
- **验收**：有明确依据的内容进入 `auto_approved`；强判断和推荐进入 `user_review`；依据不足保持 `hold`。
- **完成结果**：批量生成 51 条策展文案，其中 47 条 `auto_approved`、4 条 `hold`；保留原有 1 条 `user_review` 推荐和 1 条 `hold` 比较；没有覆盖 N2 已审核记录。
- **验证**：批量生成报告、CSV 字段 QA、Web Data 构建与 Web QA `PASS`；research gap 作品和阿什格罗夫分类问题保持 hold；策展推荐未写入研究关系。
- **产物补充**：`project/audits/web/V2_FULL_CURATION_DRAFTS_QA.md`、`scripts/build_v2_full_curation_drafts.py`。
- **下游**：解锁 V2-S5-003。
- **状态**：`✅ DONE`

### ✅ V2-S5-003：策展 USER_REVIEW 汇总

- **负责人**：`CODEX-PM`
- **依赖**：V2-S5-002
- **产物**：批量策展审核汇总包
- **验收**：所有待审内容集中、可回溯、说明需要 USER 判断的原因；不零散打断用户。
- **完成结果**：集中整理 1 条 `user_review` 阅读推荐、1 条 `hold` 跨作品比较、3 条研究缺口作品和 1 条未确认地点分类；明确 Codex 建议与公共发布门禁。
- **验证**：6 条记录均可在 Web Data `review_queue` 回溯；未批准内容未进入公共策展层；不阻塞不消费这些记录的完整站开发。
- **产物补充**：`project/audits/web/V2_CURATION_USER_REVIEW.md`。
- **下游**：解锁 V2-S6-001。
- **状态**：`✅ DONE`

## 阶段 6：完整网站开发

### ✅ V2-S6-001：首页完整化

- **负责人**：`CODEX`
- **依赖**：V2-S5-003
- **产物**：完整首页、入口排序、专题/筛选入口、首页 QA
- **验收**：完整数据覆盖进入首页但不把数据库全集平铺；首页精选、阅读路径和研究层入口可追溯。
- **完成结果**：首页保留 4 位精选作者和 6 部精选作品，同时接入 10 位完整作者、17 部完整作品的继续发现入口；地图、搜索、时间线和研究层入口均由 Web Data 驱动。
- **验证**：`project/audits/web/V2_HOME_FULL.md`；Web Data 构建与 QA `PASS`；`node --check site/app.js` 通过；`git diff --check` 通过。
- **下游**：解锁 V2-S6-002。
- **状态**：`✅ DONE`

### ✅ V2-S6-002：地图完整化

- **负责人**：`CODEX`
- **依赖**：V2-S6-001、V2-S1-002
- **产物**：完整 V2 地图范围、国家→地点交互、现实/虚构空间边界、地图 QA
- **验收**：地图只使用三类 V2 空间；坐标、父级、状态、来源和隐藏规则一致。
- **完成结果**：地图默认消费 20 个非隐藏节点；国家→地点下钻、作者地理/故事空间/虚构空间筛选和现实/虚构坐标边界均接入。
- **验证**：`project/audits/web/V2_MAP_FULL.md`；Web Data QA `PASS`；地图关系角色与 Web Data 一致；`node --check site/app.js` 通过。
- **下游**：解锁 V2-S6-003。
- **状态**：`✅ DONE`

### ✅ V2-S6-003：作家、作品、地点页面完整化

- **负责人**：`CODEX`
- **依赖**：V2-S6-002、V2-S5-002
- **产物**：完整页面集合、研究缺口页、关联节点回退、链接 QA
- **验收**：覆盖计划逐项落地；缺卡、gap、hold 和无坐标节点不被静默确定化。
- **完成结果**：五类路由覆盖国家、地点、作者、作品和研究关联节点；研究缺口、无卡关联节点、作品集模块、地图关系和来源证据均保留对应状态。
- **验证**：`project/audits/web/V2_PAGES_FULL_QA.md`；Web Data QA `PASS`；`node --check site/app.js` 通过；`git diff --check` 通过。
- **下游**：解锁 V2-S6-004。
- **状态**：`✅ DONE`

### ✅ V2-S6-004：搜索完整化

- **负责人**：`CODEX`
- **依赖**：V2-S6-003、V2-S2-002
- **产物**：完整搜索索引、类型分组、空结果与回退状态
- **验收**：作者、作品、地点、国家和关联节点可检索；结果不引入前端硬编码事实。
- **完成结果**：搜索索引覆盖 144 个研究实体和 2 个技术地图父节点；加入类型分组、类型筛选、结果计数、空状态及关联节点回退路由。
- **验证**：`project/audits/web/V2_SEARCH_FULL_QA.md`；Web Data QA `PASS`；`node --check site/app.js` 通过。
- **下游**：解锁 V2-S6-005。
- **状态**：`✅ DONE`

### ✅ V2-S6-005：时间线完整化

- **负责人**：`CODEX / CODEX-REVIEW`
- **依赖**：V2-S6-004
- **产物**：正式文学时期、作品节点、必要背景节点和时间线 QA
- **验收**：文学节点为主体；历史事件弱化；年份和时期均可回溯；不把候选事实写成确定性编年。
- **完成结果**：时间线加入 10 个作家节点、28 个作品节点和 5 个历史背景节点，按时期分组，并保留具体年份与研究状态。
- **验证**：`project/audits/web/V2_TIMELINE_FULL_QA.md`；Web Data QA `PASS`；`node --check site/app.js` 通过。
- **下游**：解锁 V2-S6-006。
- **状态**：`✅ DONE`

### ✅ V2-S6-006：研究证据层完整化

- **负责人**：`CODEX-DATA / CODEX-REVIEW`
- **依赖**：V2-S6-005
- **产物**：页面研究层、来源入口、事实/关系状态、gap/hold 展示规则
- **验收**：已展示研究判断均能回到 V1 来源或 V2 地理来源；策展推荐与研究关系分离。
- **完成结果**：事实、关系、策展依据、坐标来源和分类来源均可在页面研究层回查；研究缺口、关联节点、hold 与 user_review 不被公共策展层确定化。
- **验证**：`project/audits/web/V2_RESEARCH_EVIDENCE_QA.md`；Web Data QA `PASS`；`node --check site/app.js` 通过。
- **下游**：解锁 V2-S6-007。
- **状态**：`✅ DONE`

### ✅ V2-S6-007：响应式与可访问性优化

- **负责人**：`CODEX`
- **依赖**：V2-S6-006
- **产物**：桌面/平板/手机适配、键盘路径、焦点、错误/空状态和性能基础 QA
- **验收**：核心路径在窄屏可读可操作；减少动画设置生效；无外部未许可资产；404/fallback 可用。
- **完成结果**：补齐窄屏单列、移动导航、焦点、`aria-live`、`aria-pressed`、减动画滚动、加载/空/404/研究缺口状态和无外部资产门禁。
- **验证**：`project/audits/web/V2_RESPONSIVE_A11Y_QA.md`；HTTP smoke test 入口与 Web Data 均 `200`；前端事实扫描、远程资产扫描、Web Data QA、`node --check` 和 `git diff --check` 均通过。
- **下游**：解锁阶段 7 完整测试站 QA。
- **状态**：`✅ DONE`

- 阶段 6 详细任务已按依赖完成；以下 N3 USER_REVIEW 记录为历史节点快照。

## 阶段 7：V2-N3 完整测试站

### ✅ V2-S7-001：完整测试站内部 QA

- **完成结果**：完成 Web Data、HTTP、前端事实扫描、外部资产扫描、路由契约、可访问性契约、语法和差异检查。
- **验证**：入口与 Web Data 均返回 `200`；Web Data schema `v2-web-0.2`；`node --check`、`git diff --check` 和 Web QA 均通过。
- **状态**：`✅ DONE`

### ✅ V2-S7-002：N3 完整测试站审核包

- **产物**：`project/audits/web/V2_N3_FULL_TEST_SITE_REVIEW.md`
- **完成结果**：整理完整站模块矩阵、自动化 QA、已知非阻断待审项和 USER 体验审核重点。
- **下游**：提交 `V2-N3` USER_REVIEW。
- **状态**：`✅ DONE`

### 👤 V2-N3：完整测试站审核

- **审核包**：`project/audits/web/V2_N3_FULL_TEST_SITE_REVIEW.md`
- **状态**：`👤 USER_REVIEW`
- **等待内容**：首页、完整地图、页面边界、搜索、时间线、研究层和手机端体验意见。

### ✅ APPROVED V2-N3：完整测试站审核

- **USER 决定**：USER 于 2026-08-11 回复“通过，继续执行”，确认完整测试站达到发布准备条件。
- **通过效果**：解锁阶段 8；正式公开发布仍需 V2-N4 单独批准。

## 阶段 8：V2-N4 正式发布准备

### ✅ V2-S8-001：发布前数据与内容冻结（rc.1 历史候选）

- **产物**：`data/v2/release/V2.0.0_RELEASE_MANIFEST.json`、`docs/releases/V2_RELEASE_DATA_FREEZE.md`
- **完成结果**：固定 V2.0.0-rc.1 的 12 个输入文件、SHA-256、Web Data 统计和排除规则；候选状态为 `pending_v2_n4`。该候选在 Sol 审计后由 R01 生成新候选替代。
- **验证**：冻结清单生成成功；Web Data schema `v2-web-0.2`；无静默替换规则。
- **状态**：`✅ DONE`

### ✅ V2-S8-002：版权与公开边界终审

- **产物**：`project/audits/web/V2_PUBLIC_BOUNDARY_QA.md`
- **完成结果**：V2 候选范围不纳入 PDF、EPUB、原书全文、整书 OCR、inputs、Cookie、密钥或环境变量；公共部署副本移除 `review_queue`，仅保留 `auto_approved` 策展层。
- **验证**：发布候选范围、站点资产和敏感文件扫描通过。
- **状态**：`✅ DONE`

### ✅ V2-S8-003：生产部署候选验证

- **产物**：`.github/workflows/v2-pages.yml`、`scripts/build_v2_deploy_bundle.py`、`project/audits/web/V2_DEPLOYMENT_PREP.md`
- **完成结果**：建立需手动触发、需确认 `V2_SITE_ORIGIN` 的 GitHub Pages 部署候选流程；根目录静态包、404、JS、CSS、manifest 和公开 Web Data 本地验证通过。
- **边界**：正式 HTTPS 域名、Pages 设置、公开 URL 和实际部署等待 N4，不在 N4 前产生外部发布动作。
- **状态**：`✅ DONE`

### ✅ V2-S8-004：生成 V2 发布说明（rc.1 历史候选）

- **产物**：`docs/releases/V2_RELEASE_NOTES.md`
- **完成结果**：整理 V2.0 实现范围、与 V1 数据库关系、已知问题、部署前置条件和后续 backlog；原候选版本标记为 `V2.0.0-rc.1`，R01 后更新为 rc.2。
- **状态**：`✅ DONE`

### ✅ V2-S8-R01：Sol 独立审计整改

- **输入**：`project/audits/web/V2_SOL_AUDIT_REPORT.md`。
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
- **强制审计材料**：`project/audits/archive/V2_RC3_PRODUCT_AUDIT.md`、`project/audits/archive/V2_RC3_PUBLIC_UI_QA.md`、`project/audits/archive/V2_RC3_CURATION_USER_REVIEW.md`、`project/audits/archive/V2_RC3_BROWSER_PERFORMANCE_QA.md`、`project/audits/archive/V2_RC3_RELEASE_INTEGRITY_QA.md`。
- **发布边界**：不 merge、不创建 tag、不创建 GitHub Release、不执行 Pages 正式部署、不发布正式 URL、不将 V2-N4 标为 USER APPROVED。
- **最终状态**：内部 QA 完成后，本任务转 `✅ DONE`，`V2-N4` 必须重新停在 `👤 USER_REVIEW`。
- **完成结果**：公共身份统一为“拉丁美洲文学地图”；新增 Presentation Layer、5 条阅读路径、17 部作品 why_read、10 条 next_read、5 个文学时期；真实国家边界地图、公众化作家/作品/地点/搜索/时间线/About、146 条静态路由与页面 SEO 已落地。公共部署包物理剥离内部状态字段，Git 候选提交锚定、PR CI 和 Pages 门禁完成加固。
- **验证**：V1/Web Data/静态包/公共语言/Release Manifest 内部门禁通过；Chromium、Firefox、WebKit 在桌面和 390px 的 9 条核心路径全部通过；Lighthouse 98/100/100/100；审计材料见 `project/audits/archive/V2_RC3_*.md`。
- **产物**：`V2.0.0-rc.3`、`data/v2/presentation/PUBLIC_PRESENTATION.json`、真实底图、静态路由构建、发布完整性脚本、V2 CI 与 5 份 rc.3 审计/QA 文档。
- **状态**：`✅ DONE`

### ⏸ V2-N4：正式公开发布审核（历史节点，已暂停）

- **审核包**：`project/audits/archive/V2_RC4_REMEDIATION_REPORT.md`、`project/audits/archive/V2_RC4_CURATION_USER_REVIEW.md`、`project/audits/archive/V2_RC4_BROWSER_PERFORMANCE_QA.md`、`project/audits/archive/V2_RC4_RELEASE_INTEGRITY_QA.md`
- **状态**：`PAUSED BY USER`（2026-08-17 起由 `V2-PUBLIC-RELEASE` 未来 USER Gate 取代）
- **历史说明**：rc.1—rc.5 的审核包、`pending_v2_n4` manifest 与发布门禁继续保留用于审计；它们不再表示项目即将正式发布。

### ✅ V2-N4-R03：独立终审发布阻断返修

- **性质**：基于独立终审 `DO NOT APPROVE V2-N4` 结论执行的最小范围返修；不继承 rc.3 的 PASS 结论。
- **范围**：关闭 P1-01 至 P1-07，并在不改写已审核研究事实、不批准 `user_review`、不重建双层数据架构的前提下同步处理相关 P2。
- **强制门禁**：未批准策展内容不得进入 public bundle；公开完整页必须达到最低产品标准；搜索关系扩展与唯一语义路由必须可测试；候选身份和实际部署字节必须可机器验证；浏览器与 Lighthouse 必须有锁定依赖和原始工件。
- **候选**：`V2.0.0-rc.4`；`release_state` 继续为 `pending_v2_n4`。正式候选 Manifest 由最终 PR head 的 CI 工件生成。
- **发布边界**：允许在当前返修分支提交、推送并更新 PR；禁止 merge、tag、GitHub Release、正式 Pages 部署及将 V2-N4 标为通过。
- **结果**：37 条待审策展全部退出 public bundle；公开范围收紧至 7 位有完整作品入口的作者、14 部作品、19 个地点/国家/文学空间和 2 个主题；搜索关系扩展与语义路由通过；四种浏览器/尺寸 28/28，覆盖全部 46 条 sitemap 路由动态渲染；Lighthouse 首页 92/100/100/100、作品页 93/100/100/100；dist 篡改被 Manifest verifier 拒绝。
- **产物**：`project/audits/archive/V2_RC4_REMEDIATION_REPORT.md`、`project/audits/archive/V2_RC4_CURATION_USER_REVIEW.md`、`project/audits/archive/V2_RC4_BROWSER_PERFORMANCE_QA.md`、`project/audits/archive/V2_RC4_RELEASE_INTEGRITY_QA.md`、`artifacts/v2-rc4/`。
- **状态**：`✅ DONE`（返修任务完成；`V2-N4` 仍为 `👤 USER_REVIEW`，不代表发布批准）

### ✅ V2-N4-R04：V2.0.0-rc.5 内容深化与视觉返修（历史候选）

- **性质**：针对 rc.4 公开范围过度收缩、内容模板化、核心策展缺位、纸张质感不足及 PR CI 候选身份漂移的发布阻断返修。
- **目标**：保持 Research / Curation / Web Data 三层架构和 SQLite 单一事实源，以可追溯变更集深化 10 位核心作家、17 部核心作品和现有地点内容，形成 `V2.0.0-rc.5` 候选。
- **范围**：研究与来源补强、Curation Schema 加法兼容升级、公众内容页与首页/时间线深化、纸张视觉系统、内容质量门禁、候选身份一致性、跨浏览器与性能 QA。
- **强制产物**：`project/audits/web/V2_RC5_CONTENT_RESEARCH_REPORT.md`、`project/audits/web/V2_RC5_CURATION_USER_REVIEW.md`、`project/audits/web/V2_RC5_VISUAL_DESIGN_QA.md`、`project/audits/web/V2_RC5_PRODUCT_AUDIT.md`、`project/audits/web/V2_RC5_BROWSER_PERFORMANCE_QA.md`、`project/audits/web/V2_RC5_RELEASE_INTEGRITY_QA.md`、`artifacts/v2-rc5/`。
- **研究边界**：新增事实与来源必须经过候选变更集、独立 Reviewer、版本化 SQLite 迁移及全量导出；策展内容不得伪装成研究关系，未经批准的 `user_review` 不进入 public bundle。
- **发布边界**：允许提交、推送并更新 PR #5；禁止 merge、tag、GitHub Release、正式 Pages 部署及将 V2-N4 标为通过。
- **Phase B：内容密度与策展扩张**：`✅ DONE`。按 USER 指定的 `V2_RC5_CURATION_SOL_REVIEW_AND_EXPANSION.md` 保留并深化 10 位作家、17 部作品和 19 个地点；补齐 reader fit、3 个关键词、阅读路线、作品专属 reading approach、阅读问题、地点探索路线和 10 条首页路径；未新增 Research Relationship 或地图坐标。
- **Phase B QA**：`project/audits/web/V2_RC5_CONTENT_DENSITY_QA.md`；地图补点边界见 `project/plans/V2_RC5_MAP_EXPANSION_RESEARCH_GAPS.md`；仅 5 个由 Codex 补写的既有首页路径问题继续列入 `project/audits/web/V2_RC5_CURATION_USER_REVIEW.md`。
- **Phase B 预览**：`artifacts/v2-rc5/user-review-preview/`，仅供本地 USER_REVIEW，不是正式 public bundle。
- **PR 纠正**：当前候选为 PR #5；PR #4 已被 rc.5 完整继承并作为历史记录关闭。
- **状态**：`✅ DONE / HISTORICAL`（由 `WEB-0.1-BASELINE` 接续）

## Web 0.x 持续内容建设期

### ✅ WEB-0.1-BASELINE：Web 0.1.0 产品与内容开发基线

- **含义**：V2 网站阶段的第一套稳定产品模型已经建立；当前网站产品版本重新基线为 `Web 0.1.0`。
- **已成立能力**：国家 → 地点两级地图、现实/虚构空间区分、作家/作品/地点页、搜索、文学时间线、10 条策展阅读路径、Research / Curation / Web Data 分层、普通阅读层 + 研究依据层、静态页面与基础 SEO、响应式网站和基础自动 QA。
- **历史关系**：`V2.0.0-rc.1`—`V2.0.0-rc.5` 是 Web 0.1.0 形成前的历史开发候选，完整保留，不删除、不篡改、不重写。
- **合并边界**：PR #5 可合并到 `main`，作为后续 Research / Curation / Web Data 扩张的代码基线；合并不代表正式上线、GitHub Release、production Pages deployment 或公开宣传。
- **策展边界**：现有 `user_review` 与 `hold` 保持原状态；内部环境允许构建 USER_REVIEW preview，正式 Public Build 仍不得包含未批准策展内容。
- **状态**：`✅ DONE`

### ✅ WEB-0.1-UX-P0：地图文学发现体验优化

- **性质**：Web 0.1.x 已完成差量任务；不替代 `WEB-CONTENT-EXPANSION`，不新增第二个 `IN_PROGRESS`。
- **任务内容**：在既有地图方案上补充动态文学 Context Panel、虚构空间 inset、国家/地点即时发现、读者向 Hero / About 文案，并返修跨国家选中状态、国家聚合口径、筛选失效状态与交互式 SVG 无障碍语义。
- **产物**：`site/app.js`、`site/styles.css`、`tests/browser/public-product.spec.cjs`、`.github/workflows/v2-ci.yml`、`CHANGELOG.md`；Research / Geo / Curation / Web Data / Frontend 分层不变。
- **验证结果**：Research Data 完整性、内容质量、Web Data 确定性重建与 validator、public bundle / language scan、前端语法与差异检查均通过；Chromium PR smoke 为 26/26，Chromium / Firefox / WebKit 完整矩阵为 52/52。
- **发布边界**：未修改研究事实、既有文学关系、虚构空间坐标规则、`project/governance/PROJECT_CHARTER.md`、Web 0.1.0 开发基线或 `V2-PUBLIC-RELEASE = PAUSED`；不创建 tag、Release 或 production deployment。
- **状态**：`✅ DONE`

### ✅ WEB-CONTENT-EXPANSION：研究数据库与策展内容持续扩张

- **目标**：以 Research Data 增长驱动网页覆盖、内容密度与策展路径增长，不以在前端手写研究事实弥补数据库不足。
- **固定流程**：Research → Research Review → SQLite → Curation → Web Data → Frontend。
- **版本规则**：`Web 0.1.x` 用于小型内容批次、UI 修复、文案优化与小范围策展增强；出现多个新国家/地区、大量新作家作品或新一批成熟专题路径时升级为 `Web 0.2.0`，后续依此演进。
- **发布边界**：`V2-PUBLIC-RELEASE = PAUSED`；Lighthouse、Manifest、GitHub Pages、GitHub Release 与 production deployment 门禁保留，但不是当前主任务。`Web 1.0.0` 只能由 USER 明确开启并批准 Public Release Gate 后使用。
- **状态**：`✅ DONE`
- **完成结果**：B01—B17 全部完成；形成 61 位计划作者、168 部作品/合集，当前 master 为 367 entities、998 facts、293 relationships、278 sources、255 content cards。Research / Geo / Curation / Web Data 已形成稳定开发基线。
- **审计入口**：`project/audits/web/SOL_REVIEW_B01-B17_PR.md`、`project/audits/web/SOL_AUDIT_B02-B05.md`、`project/audits/web/SOL_AUDIT_B06-B10.md`、`project/audits/web/SOL_AUDIT_B11-B15.md`、`project/audits/web/SOL_AUDIT_B16-B17.md`。
- **整改结论**：多轮 Sol audit 与 corrective migrations 已完成；migration chain 保持 append-only；当前无 unresolved P0。
- **版本结果**：Web Product 升级为 `Web 0.2.0 — Development Baseline`；Research 全量数据使用 `Data 1.2.0 candidate` 表示，不构成正式 Release。
- **终审结论**：PR #11 的读者展示、证据折叠、首页全量目录、地图中文国名、浏览器矩阵与治理一致性由 `project/audits/web/SOL_FINAL_PREMERGE_AUDIT_WEB_0_2.md` 记录；迁移链追加至 `0027`，Public Release 状态不变。

### 🔵 WEB-CONTENT-DEEPENING：文学空间、关系与策展纵向深化

- **目标**：在现有 61 位作者 / 168 部作品基础上，从横向扩大作家数量转向纵向深化文学空间、研究关系、策展质量与中文读者入口；不创建 Batch 18。
- **✅ WCD-01 Global Curation Triage**：完成 2268 条全策展层审核记录的机器盘点与全局分层；`auto_approved / user_review / hold` 从 `498 / 1744 / 26` 调整为 `519 / 1723 / 26`。仅恢复 21 条有明确历史 USER 证据的 Presentation 记录（16 条 why_read、5 条首页路径），修复 1 条 source/research 引用分类错误，并新增高判断 USER 门禁与全层引用校验。Research DB SHA-256 前后均为 `95e72dbf80a6d0f3dc8619979a34ff36582832175a0006bdcf1cf49b06fbb1ec`；public bundle 新增 21 条 Presentation 记录、移除 0 条，Web Product 升级为 `Web 0.2.1 — Development`。产物：`project/audits/web/WCD_01_GLOBAL_CURATION_TRIAGE.md`、DEC-046、重建后的 Web Data/manifest。验证：Research DB、Curation、Web Data、content quality、public bundle、单元/浏览器 QA、确定性重建与 `git diff --check` 均通过。状态：`✅ DONE`。
- **✅ WCD-02 Literary Space & Relationship Deepening**：完成 61 位作者 / 168 部作品及完整 Research/Geo 关系审计，建立 P0—P3/DEFER 矩阵；经独立 Reviewer PASS 后追加迁移 `0028`—`0029`，新增 4 个城市实体、9 条 author→city、4 条 work→place 与 14 条证据，主库达到 371 entities / 306 relationships。Geo 达到 38 places / 91 place relations，虚构空间仍无现实坐标；新增 8 条低判断 Curation 记录。Curation review package 为 61 authors / 168 works / 25 places，formal public scope 为 25 authors / 60 works / 32 places / 2 nodes；Web Product 为 `Web 0.3.0 — Development`，Research 为 `Data 1.3.0 development candidate`。针对性返修已删除 14 个不支撑具体文案的 `PUBLIC_CONTENT.research_refs`，构建器改为字段级显式 provenance，且不改变 Research、迁移或 Geo。既有 3 条 `SET_IN` hold 与证据不足的 movement/theme/event 关系不升级。产物：`project/audits/web/WCD_02_LITERARY_SPACE_RELATIONSHIP_DEEPENING.md`、DEC-047、WCD-02 changeset/review、迁移与全量导出。状态：`✅ DONE`。
- **✅ WCD-03 Chinese Display Name Consolidation**：完成 371 个实体全量名称矩阵；最终分类为 PASS 225 / PROVISIONAL 126 / REPLACE 11 / NO_CHINESE_NAME_NEEDED 6 / ALIAS 2 / HOLD 1。经独立 Reviewer 从 `REVISE` 修订后最终 `PASS`；在合并前重建单一 append-only 迁移 `0030_wcd03_chinese_display_names`，更正 1 个作者名与 10 个作品/合集名，新增 10 条中文展示名来源。Research 升至 `Data 1.3.1 development candidate`，Web 升至 `Web 0.3.1 — Development`；实体 ID、原文名、facts、relationship 端点/类型/证据、Schema 与公开范围均不变，关系描述中的旧中文名机械同步。当前 Schema 无 alias 字段，因此仅记录别名候选，不擅自扩展。产物：`project/audits/web/WCD_03_CHINESE_DISPLAY_NAME_CONSOLIDATION.md`、全量矩阵、WCD-03 changeset/review、全量导出。状态：`✅ DONE`。
- **✅ WCD-04 Coverage Rebalancing**：基于 `main@cbb0b571`、`Data 1.3.1 development candidate` 与 `Web 0.3.1 — Development` 完成最新基线机器快照、34 项 External Audit Rebase、八维覆盖审计与正式 Current Priority Matrix。当前 master 为 371 entities / 998 facts / 306 relationships / 288 sources / 255 content cards；Curation 为 527 auto / 1723 user_review / 26 hold；formal public scope 为 25 authors / 60 works / 32 places / 2 nodes。WCD-02 已解决 Buenos Aires、Montevideo、Havana、Paris 与《跳房子》双城关系；WCD-03 名称问题已取代旧外部清单。仍确认 61 zero-degree、225 weak-degree、51 relationship holds、45 行 bibliographic-copy、6 个 P0 与 49 个 P1 major-work research candidates。关系路由按价值校准为实体 P0 10 / P1 79 / P2 201 / P3 11 / DEFER 70，另有 51 条 hold 为 P1；type diversity=1 不再自动等于 P1。生成 422 行 relationship routing、302 行 description routing、239 行 major-work priority 与 17 项最终优先矩阵；239 项仅完成 exact-title / current-author precheck，来源完整性、语义重复、版本与合集层级统一交由 WCD-07 复核；未修改 Research/Curation/Web semantic output。产物：`project/audits/web/WCD_04_COVERAGE_REBALANCING.md` 及 5 个正式 CSV。状态：`✅ DONE`。
- **✅ WCD-05 Entity & Relationship Network Remediation（既有实体与关系网络补全）**：系统审计已存在于 Research Data、但零关系、弱关系、关系语义单一，或已有 character / movement / theme / event / person / place entity 却未形成可消费研究网络的实体；同时处理 relationship holds、remaining high-value place / `SET_IN` 等关系网络缺口。目标不是消灭孤立节点，而是让每个高价值孤立或弱关系实体获得“补关系 / legitimate isolated / hold / defer”的可追溯判断。
  - **当前 known baseline**：WCD-04 逐实体重算为 61 zero-degree / 225 weak-degree / 85 connected；zero-degree 包括 theme 27、character 10、movement 8、institution 6、event 4、peripheral author 3、person 2、place 1。accepted relationships 为 306，其中 `CREATED 202 / ASSOCIATED_WITH_PLACE 78 / SET_IN 13`；8 个 movement 无 accepted relation，29 个 theme 只有 2 条 `EXPLORES_THEME`，51 条 hold 为 theme 31 / movement 14 / SET_IN 3 / INFLUENCED_BY 3。正式输入为 `WCD_04_RELATIONSHIP_ROUTING.csv` 的 371 个实体 + 51 条 hold 共 422 行。
  - **优先级**：P0 Character→Work 等最基础核心关系与最小 Schema 判断；P1 movement/theme/event、relationship holds、核心作者/作品/虚构空间高价值关系；P2 weak-degree 语义多样性与剩余城市关系；P3 Person / Peripheral Author / institution 的必要性治理；缺少直接证据、页面价值低或纯文学推断者 DEFER。
  - **Schema 与证据门禁**：USER 已批准最小 Option A；Schema 0.4 仅新增 `APPEARS_IN`，端点严格为 character→work，不保存 inverse，不扩展到 collection/place/character/adaptation/edition。`key_character` fact 只作 candidate seed，须逐条直接来源与独立 Reviewer PASS。不得按 AI 常识补关系，不把出生地扩大为创作中心，不把短暂居留扩大为长期文学关联；虚构空间始终保持无现实坐标。
  - **执行与产物**：`0031`—`0033` 新增 10 sources / 12 relationships / 23 relationship evidence，12 holds resolved、1 hold rejected with history retained；CS04 经独立 Reviewer 10/10 PASS 后追加 `0034`，新增 10 条 `APPEARS_IN` 与 10 条直接证据。zero-degree 61→41、weak 225→238、connected 85→92；character 0/10→10/10、movement 0/8→5/8、theme 2/29→4/29。Research 保持 Data 1.4.0 development candidate，Schema 升至 0.4；Web 保持 0.3.2 Development，仅 Research layer 投影。审计见 `project/audits/web/WCD_05_ENTITY_RELATIONSHIP_GAP_REMEDIATION.md`。状态：`✅ DONE`。
- **✅ WCD-06 Author & Work Descriptive Content Completion（作家与作品描述性内容补全）**：系统审计现有核心作者与作品的 reader-facing descriptive coverage，区分 missing、`auto_approved`、`user_review`、`hold`、public-visible、non-public、template-like 与 evidence-insufficient；优先保证核心作者 `reader_lede` 和核心作品 `story_intro` 的最低公开可读覆盖，再在 Research Evidence 足够时补充低判断、对象特异的描述。不得把字段填满率作为 KPI，也不得用新写文案替代已有内容审核。
  - **当前 known baseline**：WCD-04 已按当前页面重算：2276 条策展记录为 527 auto / 1723 user_review / 26 hold；61 位核心作者 `reader_lede` 为 15 auto / 46 review，168 部策展范围作品 `story_intro` 为 60 auto / 108 review。302 行 author/work/collection/place 路由中，25 PUBLIC_STRONG、23 PUBLIC_BASIC、45 PUBLIC_BIBLIOGRAPHIC_COPY、150 USER_REVIEW_HIGH_JUDGMENT、5 USER_REVIEW_LOW_JUDGMENT、26 MISSING、23 RESEARCH_INSUFFICIENT、5 HOLD。正式输入为 `WCD_04_DESCRIPTION_ROUTING.csv`，不得继续引用 WCD-01 快照替代现状。
  - **处理顺序与门禁**：保留既有 `auto_approved` → 复用 USER 已批准内容 → 审计既有 `user_review` 的低判断/高判断属性 → 查明 `hold` 的 research gap → 仅对真正 missing 内容考虑新写。稳定事实转写、作品基本介绍和已审核 Research 的保守重述可考虑自动准入；`why_read`、`reader_fit`、`reading_route`、`next_reads`、带“最佳入门”判断的 `start_here`、跨作品比较及强文学判断继续执行 USER_REVIEW 门禁。
  - **最低可读页面**：Author 第一层硬门槛为 `reader_lede`，并以基本文学定位和已有作品入口作为深化目标；Work 第一层硬门槛为 `story_intro`，并以对象特异的叙事/主题/地点描述和作者入口作为深化目标。Research 不足时登记 Research Gap，走 Source Research → Candidate → Reviewer → Research Master → Curation，不得凭 AI 常识补写后自动批准。
  - **未来执行分组**：`06A Reader Content Review Queue Recovery`；`06B Bibliographic-copy Rewrite`；`06C Core Zero-content Work Remediation`；`06D Author Profile / Literary Connections`；`06E Research Gap Handoff`。
  - **执行与产物**：完成 229 行 current description matrix 与 1723 行 external rebase；12 条低判断地点说明、9 个作者导语和 2 个零内容作品进入正式差量包。独立 Reviewer 经两轮 REVISE 后最终 PASS：4 条地点说明收窄，2 条作品改写撤回，69 条缺口移交 Research。作品策展范围 168→170，公开作品 60→62；Research / Schema 不变，Web 升至 0.3.3。审计见 `project/audits/web/WCD_06_AUTHOR_WORK_DESCRIPTIVE_CONTENT_COMPLETION.md`。状态：`✅ DONE`。
- **⏳ WCD-07 Major Works Research Expansion（核心作家重要作品补全）**：作为独立 Research 阶段，只处理 WCD-04 已列入优先级、且 exact-title / current-author precheck 未发现 current-master match 的 major-work research candidates。6 个 P0 与 49 个 P1 只是候选优先级，不是已批准入库项目，也不得把该预检解释为语义无重复；每一项仍须完整走 `duplicate check → source verification → entity/collection overlap check → Chinese edition check（辅助）→ candidate changeset → independent reviewer → SQLite migration`，即 Research → Review → SQLite Migration 治理链。
  - **输入与分组**：`WCD_04_MAJOR_WORKS_PRIORITY.csv` 共 239 行；`WCD-07A` 为 6 个 P0 canonical omissions，`WCD-07B` 为 49 个 P1 high-impact candidates，`WCD-07C` 为 85 个 P2 + 65 个 P3 optional candidates；34 个 DEFER 不排期。07C 执行前必须再次裁剪，不以清单补完为目标。
  - **治理前置**：博尔赫斯《阿莱夫》短篇/同名集、《马丘比丘高地》/《漫歌》、里贝罗总集/单篇、《火的记忆》卷级、波拉尼奥中文选编/西语原集等先完成 collection/work/edition hierarchy 与 display duplication 判断；不得直接导入 External AI CSV。
  - **依赖与状态**：WCD-06 已完成；Research/Data/Web 版本只在未来实际迁移与语义输出变化后按规则决定。本轮不执行。状态：`⏳ READY / NOT STARTED`。
- **状态**：`🔵 IN_PROGRESS`

## 当前执行边界

- 当前处于 V2 网站建设阶段 / Web 0.x 内容建设期；`WEB-CONTENT-DEEPENING` 是当前任务。
- `V2-PUBLIC-RELEASE = PAUSED`；不创建 Web 1.0.0 tag、GitHub Release，不执行 production Pages 部署，不发布或宣传正式公开 URL。
- 不提前开发复杂知识图谱、3D 地图、用户系统、AI 问答、CMS、小程序、多语言或个性化推荐。
- 不在前端硬编码研究事实，不用策展写作补造研究事实，不为虚构空间伪造现实坐标。
- 普通机械工作由 Codex 自主推进；产品定位、核心用户、地图主结构、研究证据标准、Web Product 范围、重要无依据策展判断和重新开启/批准 Public Release Gate 由 USER 决定。
