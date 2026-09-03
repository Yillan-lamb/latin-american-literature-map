# AI 协作指南

- 文件性质：跨版本长期协作规则
- 适用范围：Codex、外部 AI、Worker、Reviewer、脚本和与项目交付有关的其他 Agent
- 最高约束：[`../PROJECT_CHARTER.md`](../PROJECT_CHARTER.md)

本指南只说明可长期复用的协作方法，不记录当前任务、当前版本、临时提示或动态统计。动态项目管理统一放在被忽略的 `project/internal/`。

## 1. 开工前的阅读顺序

1. 读取 `project/PROJECT_CHARTER.md`，确认使命、权限、数据和公开边界。
2. 按任务类型读取相关稳定文档：数据任务读取 `docs/data/`，网站任务读取 `project/plans/` 与 `docs/web/`，来源任务读取 `docs/methodology/`。
3. 读取 `project/internal/TASKS.md` 和 `project/internal/DECISIONS.md`，确认任务登记、依赖和已生效决策；两者只在本地可见。
4. 需要历史背景时才读取 `project/archive/` 或正式审计，不把历史材料当作当前指令。

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
- `project/internal/DECISIONS.md` 是当前决策记录；旧决策正文不因路径迁移而改写。
- 临时 prompt、handoff、scratchpad 和 review 放在 `project/internal/prompts/`、`handoffs/`、`reviews/` 等目录。
- 需要公开追踪的正式审计、发布结论和可复核交付仍放在 Git 跟踪的相应目录；过程性交接不复制到公开目录。
- 任何动态状态只保留一个来源；README、产品说明书和稳定 SOP 不写另一套当前任务表。

## 5. Git 与 PR 协作

在 `codex/` 分支或 USER 指定分支上工作，保持变更范围清晰。若同一范围已有 PR，继续使用原分支并在同一 PR 内完成治理、文档、验证和审计修订，不另建 PR。使用追加提交，不强制推送、改写历史或 squash 他人提交；不得把内部忽略文件当作公开交付。

每次交付前检查活动链接、`git diff --check`、敏感信息、归档完整性、内部目录未被追踪，以及适用的数据、Schema、Web、构建和浏览器门禁。治理或文档整理不应顺手增加无关公开文学内容或改变研究数据。

## 6. 版本与发布

Research Data、Research Schema、Web Data schema 和 Web Product 独立编号。仅路径迁移、文档整理、构建/验证修复或没有新增读者向内容的 Research-only 投影，不自动升级 Data/Schema；Web Product 按其公开影响选择 patch、minor 或 major。所有版本建议都应有变更说明、验证证据和必要的决策记录。

开发预览不等于 Public Release。未批准的 `user_review`、`hold`、研究缺口和工作稿不得进入公开包；正式 Tag、GitHub Release 和生产部署必须由 USER 明确开启并批准 Public Release Gate。

## 7. 版权与安全

只使用合法可访问的来源和明确允许的材料。公开仓库不得包含原始书籍、扫描件、未获授权全文、私有批注、账号信息、Cookie、密钥或本地环境配置。遇到版权、隐私、来源身份或事实层级的不确定性时停止确定化，记录问题并升级到 Reviewer 或 USER。
