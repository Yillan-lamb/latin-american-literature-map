# Project Agent Instructions

本文件是用户级 `~/.codex/AGENTS.md` 与 `~/.agents/AGENTS.md` 在本项目的自动发现入口。它只负责路由和项目特定映射，不复制另一套动态状态或取代项目章程。

## 治理入口映射

| 用户级标准入口 | 本项目权威路径 | 责任 |
| --- | --- | --- |
| `PROJECT_CHARTER.md` | `project/PROJECT_CHARTER.md` | 长期使命、边界、角色、门禁和版本规则 |
| `TASKS.md` | `project/internal/TASKS.md` | USER 指定的本地持久工作区中的唯一当前/后续任务源 |
| `DECISIONS.md` | `project/internal/DECISIONS.md` | 本地当前决策及追加式取代关系 |
| `specs/` | `project/plans/` | 活跃产品说明、重大功能、架构/数据模型和跨模块方案 |
| `CHANGELOG.md` | `CHANGELOG.md` | 已实际发生的变更、原因和影响；历史条目只读 |

`project/internal/` 整体被 Git 忽略，但仍是 USER 的正式本地治理源。不得为了让 GitHub 自包含而复制或推断其动态内容。

## 必读顺序

1. `project/PROJECT_CHARTER.md`
2. `project/internal/TASKS.md`
3. 当前任务相关的 `project/internal/DECISIONS.md`
4. 相关 `project/plans/` Spec 和稳定领域文档
5. `CHANGELOG.md` 中最近且相关的条目
6. 实际代码、数据和测试

无需每次读取全部历史。若本地 TASKS 或 DECISIONS 缺失，不得从 Git 历史、CHANGELOG、archive 或旧任务文件自行恢复“当前状态”；应从 USER 指定的持久工作区恢复，或请 USER 提供当前任务上下文。

## 执行与收口

- 开工前确认项目阶段、当前任务、范围、验收标准和必要依赖。
- 正式活跃任务至少记录稳定 ID、目标、状态和验收标准；重要决策至少记录背景、决定、理由和影响。
- 重大功能、核心架构/数据模型、跨模块、主要用户流程或多阶段/多 Agent 任务，在 `project/plans/` 建立 Spec，至少包含背景、目标、非目标、方案和验收标准。
- 凡可验证的结果必须实际验证；未验证的结果明确标记 `NOT_VERIFIED`。不得静默猜测；如基于假设继续，必须明示记录。
- 任务只有在验收标准满足、必要验证通过、治理同步完成后才能标记 `DONE`。
- 任何 tracked 交付按章程执行提交前 `CHANGELOG / TASKS / DECISIONS / 其他受影响入口` 检查；只更新真正受影响的文件。
- 同一范围已有 PR 时继续原分支和 PR。本项目的详细 Git、数据、审核与发布门禁以章程和 `project/ai/AI_COLLABORATION_GUIDE.md` 为准。

发现治理文件、实际实现和可验证状态不一致时，先核实真实状态，再修正相关入口；不得为了文字一致而改写历史。
