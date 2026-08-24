# 拉丁美洲文学地图

一个面向中文读者的研究型数字文学项目，用可追溯的数据连接拉丁美洲的作家、作品、城市、国家、文学运动、历史事件和反复出现的文学主题。

这个项目不是简单的作家百科，也不是把文学史搬到网页上。它希望回答：

- 拉丁美洲文学如何在不同国家、城市和时代之间演变？
- 作家、作品和文学运动之间存在怎样的影响和回应关系？
- 革命、独裁、殖民、现代化、流亡和记忆如何进入文学？
- 魔幻现实主义之外，拉美文学还有哪些重要传统和叙事实验？
- 中文读者可以沿着哪些路径进入这些作品？

## 最高项目规范

[PROJECT_CHARTER.md](./PROJECT_CHARTER.md) 是本项目的最高、冻结治理文件，规定长期目标、完整阶段流程、角色权限、最终成果和质量门槛。未经用户明确授权，任何 AI、Agent 或脚本不得修改该文件。V1 动态进度以 `TASKS.md` 为准，V2 动态进度以 `V2_TASKS.md` 为准，不能用更新进度为由改写总章程。

## 当前阶段

Research Data 的正式发布基线仍为 `Data V1.0.0`。USER 已于 2026-08-11 批准该数据版本正式发布；它包含 74 个来源、144 个规范实体、76 个经审核关系、40 个 hold、238 条事实素材和 40 张内容卡，并提供 CSV、JSON、SQLite 和 18 工作表 Excel。该历史 Release 不因后续开发主库增长而改写。

B01—B17 已于 2026-08-22 完成。当前 development master 已扩充至 367 entities、998 facts、293 relationships、278 sources 和 255 content cards，对应本轮 61 位计划作者与 168 部作品/合集。该主库尚未形成新的正式 Research Release；当前全量导出候选为 `Data 1.2.0 candidate`（`data/exports/v1.2.0-candidate/`），明确属于 `DEVELOPMENT / CANDIDATE`，是否发布仍由 USER 决定。

V1 将建立：

- 约 10 位作家、30 部作品和 10 个主题的研究数据；
- 国家、城市、作家、作品、运动、事件和主题之间的关系；
- 能回到具体书籍、论文或网页的来源证据；书籍记录书名，论文记录论文名，网页记录页面标题和 URL，页码/章节为可选增强；
- SQLite 主数据库、Excel/CSV 审核表和网站 JSON；
- 支持后续地图、时间轴、关系图和专题展览的数据接口。

网站和小程序不属于 V1。内容数据库通过节点审核后，再进入数字展览开发。

### 当前 V2 网站建设阶段

`V1 / V2 / V3` 是项目阶段编号，不是网站产品版本。V2 表示网站 / 数字文学展览建设阶段；B01—B17 完成后，当前 Web Product 为 `Web 0.2.0 — Development Baseline`。它表示大规模 Research Expansion 已形成稳定开发基线，不表示正式上线、GitHub Release、production Pages deployment 或公开宣传。

`Web 0.1.0` 与 `V2.0.0-rc.1`—`V2.0.0-rc.5` 作为历史开发记录完整保留。正式发布状态、当前开发 Research 主库与 Web Product 版本是三个独立概念：`Data V1.0.0` 仍是正式 Research Release，`Data 1.2.0 candidate` 是当前开发导出候选，`Web 0.2.0` 是网站开发基线。原 V2-N4 发布流程已由 USER 暂停，未来正式公开发布须单独重新开启 `V2-PUBLIC-RELEASE` Gate。站点继续保持 Research / Geo / Curation / Web Data 分层；`user_review` 与 `hold` 不因开发基线合并而自动批准。

V2 的详细产品与开发规范以 [V2 网站产品决策与开发总说明书](./V2_网站产品决策与开发总说明书.md) 为准，执行状态以 [V2 任务源](./V2_TASKS.md) 为准。当前坚持静态优先和 Research Data + Curation Data → Web Data → Frontend 分层；网页增长主要来自 Research Data 增长，不在前端另行手写研究事实。

## 工作方式

项目采用 Codex 项目经理与其他 AI 分工协作：基础 OCR、资料清单、书目初填、格式整理和候选抽取优先交给其他 AI；Schema、证据判断、关系审核、主数据库、跨来源整合、版本和 GitHub 由 Codex 负责。连续的机械工作优先合并成里程碑任务包，机械任务使用 LITE，OCR、研究和数据库任务使用 FULL。Codex只审文件安全、来源覆盖、语义样本和入库/发布四类关键门禁，不逐页重做外部 AI 工作。

用户只在四个关键节点审核：

1. 项目范围和首版内容；
2. 知识模型与试点样例；
3. V1 候选数据包；
4. 正式版本发布。

节点之间的普通研究、补证、纠错和批次合并由 AI 自动推进。

详细流程见 [AI 协同工作计划](./拉丁美洲文学地图_AI协同工作计划.md)，已确定与备选方案见 [项目决策记录](./拉丁美洲文学地图_项目决策记录.md)。V1 任务状态以 [V1 统一任务源](./TASKS.md) 为准，V2 动态状态以 [V2 任务源](./V2_TASKS.md) 为准。

**重要：** V1.0.0 发布后的新增、补证、纠错、hold 补证、批量维护和版本发布，统一按 [《数据新增与版本维护操作手册》](./docs/数据新增与版本维护操作手册.md) 执行。这是未来 Codex、其他 AI 和人工维护者的首要操作入口；[V1 工作流程审计摘要](./docs/V1_工作流程审计摘要.md) 和 [旧规则冲突与淘汰清单](./docs/旧规则冲突与淘汰清单.md) 只用于理解本次标准化依据。长期主数据基线位于 `data/master/V1_MASTER.sqlite`，`data/staging/v1_candidate/` 保留为 V1.0.0 历史发布快照。

## 版本与修改记录规则

GitHub 是本项目公开版本历史的权威来源。普通任务与返修先在本地累积；当 `GIT-V1-S3`、`GIT-V1-N3` 或 `GIT-V1-N4` 的门禁满足时，Codex 按公开白名单和 fail-closed 检查自动提交并推送，无需用户逐次通知。N3、N4 本身仍须用户审核通过。

每个版本必须同步记录两类信息：

### 决策内容

记录为什么采用某种范围、结构、来源、技术或策展方案，以及有哪些备选项。决策写入 `拉丁美洲文学地图_项目决策记录.md`，已有决定不得静默覆盖；如改变，必须新增决策并说明取代关系和影响。

### 修改内容

实际新增、修改、删除、修复和迁移内容写入 `CHANGELOG.md`。每个版本至少记录：

- 版本号和日期；
- 新增、修改、删除和修复；
- 本次发生的决策变化；
- 数据结构或兼容性影响；
- 已完成的验证；
- 已知问题和下一步。

Research Data 与 Web Product 分别维护版本，不得互相覆盖历史。Web Product 在 1.0 前采用以下 SemVer 风格：

- `Web 0.2.x`：当前 Web 0.2 开发基线上的 UI 修复、文案优化和小范围策展增强；`Web 0.1.x` 仅保留为历史开发线；
- `Web 0.2.0`、`Web 0.3.0`：多个新国家/地区、大量新作家作品或新一批成熟专题路径等明显内容规模增长；
- `Web 1.0.0`：只有 USER 明确开启并批准 Public Release Gate 后使用。

正式发布前由 AI 生成一页版本摘要，用户可以直接看到“改了什么、为什么改、还有什么没解决”。

## 公开与版权边界

本仓库只保存公开成果、结构化数据、必要短摘录、引用信息、项目文档和程序代码。

以下内容不得提交到公开仓库：

- 用户提供的 PDF、EPUB、扫描件和原始书籍文件；
- 未获授权的作品全文或大段版权文本；
- 私有批注、账号信息、密钥、Cookie 和环境配置；
- 不能公开的中间材料。

公开展示优先使用释义、书目信息、来源题名和必要的短引文，并保持来源可追溯；页码在已有且确有价值时展示。

## 项目文档

- `PROJECT_CHARTER.md`：项目最高总章程；冻结文件，未经用户明确授权不得修改；
- `拉丁美洲文学地图_AI协同工作计划.md`：完整实施与协同方案；
- `拉丁美洲文学地图_项目决策记录.md`：选项、决定和取代关系；
- `docs/数据新增与版本维护操作手册.md`：V1.0.0 发布后的首要执行手册；
- `TASKS.md`：V1 唯一任务状态源；
- `V2_TASKS.md`：V2 唯一动态任务状态源；
- `V2_网站产品决策与开发总说明书.md`：V2 网站阶段最高专项说明书；
- `V2_执行体系与任务清单.md`：V2 阶段任务依赖和验收清单；
- `docs/V2_N3_FULL_TEST_SITE_REVIEW.md`：当前完整测试站 N3 审核包；
- `docs/V2_HOME_FULL.md`、`docs/V2_MAP_FULL.md`、`docs/V2_PAGES_FULL_QA.md`、`docs/V2_SEARCH_FULL_QA.md`、`docs/V2_TIMELINE_FULL_QA.md`、`docs/V2_RESEARCH_EVIDENCE_QA.md`、`docs/V2_RESPONSIVE_A11Y_QA.md`：V2 完整站模块与 QA 记录；
- `docs/V2_RC4_REMEDIATION_REPORT.md`、`docs/V2_RC4_CURATION_USER_REVIEW.md`、`docs/V2_RC4_BROWSER_PERFORMANCE_QA.md`、`docs/V2_RC4_RELEASE_INTEGRITY_QA.md`：V2.0.0-rc.4 独立终审返修材料；rc.3 文档保留为历史审计记录；
- `docs/V2_RC5_CONTENT_DENSITY_QA.md`、`docs/V2_RC5_CURATION_USER_REVIEW.md`、`docs/V2_RC5_MAP_EXPANSION_RESEARCH_GAPS.md`：rc.5 内容深化与 USER_REVIEW 预览记录；rc.1—rc.5 均为 Web 0.1.0 形成前的历史开发候选；
- `SOL_FINAL_PREMERGE_AUDIT_WEB_0_2.md`：PR #11 的 Web 0.2.0 独立终审、整改、门禁与合并结论；
- `docs/外部AI任务分工与交接手册.md`：可直接交给其他 AI 的工作说明；
- `docs/外部AI执行工作流与自检手册.md`：外部 AI 执行、自检和差量返修规则；
- `work/external-ai/新外部AI_项目接管与首任务提示词.md`：新执行方无需聊天上下文即可接管的首条提示词；
- `work/external-ai/后续任务安排_新外部AI.md`：从当前任务到 V1 发布的外部 AI 里程碑路线图；
- `data/staging/v1_candidate/N3_审核包.md`：当前 N3 四项用户决策材料；
- `docs/N3_审核结论.md`：N3 B/A/A/A 的正式结论与实施结果；
- `data/staging/v1_candidate/V1_CANDIDATE.xlsx`：V1 候选版 Excel 审核表；
- `docs/V1_版本摘要.md`、`docs/V1_已知问题.md`：当前 N4 审核入口；
- `docs/N4_正式发布结论.md`、`docs/V1_正式发布说明.md`：V1.0.0 正式发布记录；
- `docs/N1-OCR-001_R2验收摘要.md`：首个外部任务包的公开验收结论与限制；
- `docs/阶段1_首批资料汇总与缺口报告.md`：阶段 1 完成结论、资料覆盖与后续缺口；
- `data/catalog/SOURCE_REGISTRY.csv`：首批六份资料的正式来源编号表；
- `templates/external-ai/`：外部 AI 过程文件和交接模板；
- `scripts/validate_external_delivery.py`：LITE/FULL 交付包机械检查；
- `CHANGELOG.md`：每个版本的实际修改；
- `docs/archive/v1-foundation/`：已完成的阶段 0、N1、N2、阶段 3 和旧提案历史材料；
- `README.md`：项目目的、当前状态和版本纪律。
