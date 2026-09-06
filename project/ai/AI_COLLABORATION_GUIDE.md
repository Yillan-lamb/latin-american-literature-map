# AI 协作指南

- 文件性质：跨版本长期协作规则
- 适用范围：Codex、外部 AI、Worker、Reviewer、脚本和与项目交付有关的其他 Agent
- 项目自动发现与用户级映射：[`../../AGENTS.md`](../../AGENTS.md)
- 项目最高长期约束：[`../PROJECT_CHARTER.md`](../PROJECT_CHARTER.md)（位于 USER 当前指示和适用用户级基线之下）

本指南只说明可长期复用的协作方法，不记录当前任务、当前版本、临时提示或动态统计。动态项目管理统一放在被忽略的 `project/internal/`。

## 1. 开工前的阅读顺序

1. 读取 `project/PROJECT_CHARTER.md`，确认使命、权限、数据和公开边界。
2. 读取 `project/internal/TASKS.md`，确认当前任务 ID、状态、目标、验收标准和依赖。
3. 只读取当前任务相关的 `project/internal/DECISIONS.md` 部分，确认已生效决策和取代关系。
4. 读取相关 `project/plans/` Spec 及稳定领域文档：数据任务读取 `docs/data/`，网站任务读取 `project/plans/` 与 `docs/web/`，来源任务读取 `docs/methodology/`。
5. 读取 `CHANGELOG.md` 中最近且与当前任务相关的条目，再检查实际代码、数据和测试。
6. 需要历史背景时才读取 `project/archive/` 或旧审计，不把历史材料当作当前指令。

无需每次通读全部历史。完成上述阅读后，开工前明确确认当前项目阶段、任务、范围、验收标准和必要依赖；信息缺失或互相冲突时不得静默猜测。

### Internal-state fallback

If `project/internal/TASKS.md` or `project/internal/DECISIONS.md` is absent from
the current workspace, the Agent must not infer the current task or current
effective internal decisions from Git history, `CHANGELOG.md`, old task files,
or `project/archive/`. The Agent must restore the files from the persistent
internal workspace designated by USER, or request the current task context from
USER. Archive material, legacy TASKS, and historical decisions may support
historical tracing only; they must not automatically restore current execution
state.

发生冲突时遵循 USER 明确指示、章程、正式决策、稳定领域规则、公开事实、内部记录、历史材料的顺序；内部任务记录不能覆盖章程或稳定 Schema。

## 2. 角色与权限

- `USER` 决定使命、重大范围、重大 Schema/数据政策、版权与公开边界、不可逆操作和正式发布。
- `CODEX-PM` 负责任务编排、范围控制、内部任务/决策登记、验收和 PR 收口。
- `CODEX-DATA` 负责候选整合、SQLite 迁移、导出和数据不变量。
- `CODEX-REVIEW` 独立复核来源对象、证据层级、语义、版权和公开准入。
- 外部 AI / Worker 只生产明确授权的候选或机械结果，不能分配正式 ID、写主库、改变 Schema/公开状态或操作 GitHub。

外部交付必须包含任务说明、范围、来源、主体成果、自检、问题清单和 `HANDOFF.md`。Worker 的自检不是 Reviewer 的最终结论；有争议的内容必须保留为候选、`hold`、`disputed` 或 `research_gap`。

## 3. 标准数据与内容链路

```text
合法来源 → 来源登记 → 候选实体/事实/关系
→ Worker 机械自检 → 独立 Reviewer
→ 版本化 SQLite 迁移 → 导出与全量 QA
→ Curation 审核 → Web Data 构建 → 页面/公开包验证
```

Research Data、Curation Data、Web Data 和读者向文字必须分层。AI 可以提出释义或策展草稿，但不能用写作替代研究证据，也不能把策展推荐写成 Research relationship。前端不得硬编码研究事实；虚构空间不得伪造现实坐标。

## 4. 内部记录与任务包

- `project/internal/TASKS.md` 是唯一连续全局任务源，使用 `TASK-001` 形式的三位数字编号，并在每条记录保留 `Legacy ID`。
- 正式活跃任务至少包含稳定 ID、目标、状态和验收标准；必要时增加依赖、关联 DEC 和 Spec。历史完成任务可指向正式审计/归档交付，不为补格式而改写。
- `project/internal/DECISIONS.md` 是当前决策记录；旧决策正文不因路径迁移而改写。
- 新的重要决策至少记录背景、决定、理由和影响；取代旧决策时保留旧记录并明确新的取代关系。
- 重大功能、核心架构/数据模型、跨模块重构、主要用户流程变更或多阶段/多 Agent 任务，在 `project/plans/` 建立 Spec，按“背景 → 目标 → 非目标 → 方案 → 验收标准”组织。小型修复、局部优化和普通内容调整无需额外 Spec。
- 临时 prompt、handoff、scratchpad 和 review 放在 `project/internal/prompts/`、`handoffs/`、`reviews/` 等目录。
- 需要公开追踪的正式审计、发布结论和可复核交付仍放在 Git 跟踪的相应目录；过程性交接不复制到公开目录。
- 任何动态状态只保留一个来源；README、产品说明书和稳定 SOP 不写另一套当前任务表。

## 5. Git 与 PR 协作

在 `codex/` 分支或 USER 指定分支上工作，保持变更范围清晰。若同一范围已有 PR，继续使用原分支并在同一 PR 内完成治理、文档、验证和审计修订，不另建 PR。使用追加提交，不强制推送、改写历史或 squash 他人提交；不得把内部忽略文件当作公开交付。

首次创建 commit 前，CODEX-PM 必须执行章程规定的治理同步门禁，并在交接或 PR 描述中逐项记录：

- `CHANGELOG.md`：为本次所有 Git 跟踪的可交付变更新增带日期的当前开发条目；版本不变也要说明实际变化与不变边界，禁止改写历史条目。
- `project/internal/TASKS.md`：任务状态、依赖、范围、产物或 Gate 有变化时先在本地持久工作区更新；无变化时注明 `N/A` 及理由。
- `project/internal/DECISIONS.md`：出现新的长期规则、范围选择、Schema/版本判断、公开边界或发布门禁时追加决策；无此类判断时注明 `N/A` 及理由。
- README、manifest、版本说明、正式审计和稳定领域文档：按实际影响同步；不得为“看起来一致”而改写历史事实。

如在 commit 后发现遗漏，须在同一分支/PR 内追加治理修复并在合并前闭合；如合并后才发现，立即创建窄修复，不得留给下一任务。`project/internal/` 虽被 Git 忽略，仍必须先完成本地同步；不得因其不会出现在 PR diff 中而跳过。

每次交付前检查活动链接、`git diff --check`、敏感信息、归档完整性、内部目录未被追踪，以及适用的数据、Schema、Web、构建和浏览器门禁。治理或文档整理不应顺手增加无关公开文学内容或改变研究数据。

凡可验证的结果必须运行实际验证；无法验证或未完成验证的结果明确标记 `NOT_VERIFIED` 及原因。如需在假设下继续，在任务或交接中写明假设和适用边界。任务只有在验收标准满足、必要验证通过、治理检查/同步完成后才能标记 `DONE`；中断时必须在持久项目文件中留下状态、剩余工作和验证结果。

## 6. 版本与发布

Research Data、Research Schema、Web Data schema 和 Web Product 独立编号。仅路径迁移、文档整理、构建/验证修复或没有新增读者向内容的 Research-only 投影，不自动升级 Data/Schema；Web Product 按其公开影响选择 patch、minor 或 major。所有版本建议都应有变更说明、验证证据和必要的决策记录。

开发预览不等于 Public Release。未批准的 `user_review`、`hold`、研究缺口和工作稿不得进入公开包；正式 Tag、GitHub Release 和生产部署必须由 USER 明确开启并批准 Public Release Gate。

## 7. 版权与安全

只使用合法可访问的来源和明确允许的材料。公开仓库不得包含原始书籍、扫描件、未获授权全文、私有批注、账号信息、Cookie、密钥或本地环境配置。遇到版权、隐私、来源身份或事实层级的不确定性时停止确定化，记录问题并升级到 Reviewer 或 USER。
