# PR #38 合并前 CI 与部署边界审计

日期：2026-10-15。范围：TASK-129，承接已通过的 TASK-127 研究终审；仅修复验证和说明。精确 PR base 为 `05f3372c69a54ec331d31b05d16c8288d6d3a993`，原 head 为 `3e48c3a8327e3ad5a63df4813945d8c2cc148c8f`。本地验证使用 tracked checkout 加本次代码修改，不读取原 worktree 的 ignored 数据或未提交外部交付。

## 发现与处理

1. **验证缺口**：原 Actions 没有运行完整 173 项 Python 测试和全 58 迁移重放。新增独立 `wcd10-research-integrity` Job，安装固定 openpyxl 依赖、获取历史 fixture 所需 Git 历史，运行完整 discovery、重放、0058 精确差量、三格式导出及两种部署模式 QA。所有命令失败均返回非零；日志管道启用 `pipefail`。
2. **确认的验证器缺陷**：旧 replay 脚本只打印 integrity/FK 结果，并可能输出 PASS。现在主库和重放库的完整性或外键异常都会失败；同时核对表列定义和行多重集，增加坏外键、完整性错误、同计数错值、列定义变化等失败回归。
3. **验证缺口**：原 177 标准文件一致性证据没有覆盖实际 Pages 开发模式。新增同模式构建比较、部署投影及文件清单检查，在 Pages 上传前复用；PR 浏览器 Job 改测实际 Pages origin 子路径。
4. **符合既定设计**：USER_REVIEW 临时策展转换及 main 更新后的开发预览部署保持。没有证据表明现有 WCD-10 数据越界；未改策展状态、研究数据或既有预览路由。

## 本地实测

全新本地 checkout 原 173 项测试首先全部通过；补充后 190 项 Python 测试全部通过、无跳过。Python 3.14.5、SQLite 3.53.1、openpyxl 3.1.5；Actions 使用 Python 3.13。新增 17 项测试涵盖 replay 健康检查、0058 oracle 精确范围及真实部署 canary。完整 Python suite 同时保留原 0058 漂移回滚与重复执行拒绝。

- 冻结 V1 基线 SHA-256：`e82533519dcfe2ae1a1c6d02f60c5d775dd95f49e0506c2cbeb6c649a89fb853`；58 迁移执行成功，19 表列定义及全部行一致，主库/重放库 `integrity_check=ok`、`foreign_key_check=[]`。
- 唯一排除的非确定性列是迁移日志真实 `applied_at`，沿用原比较边界。迁移 SQL/hash、既有检查点、研究行及其余日志列未变。
- 0058 精确差量仍仅为 15 entities、15 cards、1 metadata 值及新增 1 migration_log；JSON/CSV/XLSX 各 19 表逐值匹配当前 SQLite。
- 主库 SHA-256 保持 `7ee4188756f4f18683f5e2e979d44d31f63c4682d782007af0e7c3ad7091a8ad`；Schema、版本号、来源、事实、关系、冻结包和全部历史迁移保持。

固定构建时间 `2026-08-27T12:00:00Z`，origin 均为 `https://yillan-lamb.github.io/latin-american-literature-map/`：

| 模式 | base → head 目标数 | base → head 路由 | 文件比较 |
| --- | --- | --- | --- |
| 标准公开包 | 127 → 127 | 139 → 139 | 177 文件逐字节相同 |
| 实际 Pages 开发预览 | 271 → 271 | 288 → 288 | 327 文件逐字节相同，包含 `.nojekyll` |

两种比较都覆盖完整 public JSON、HTML、sitemap、静态资源和文件清单；未归一化或忽略产物差异。两种模式之间的路由差异属于既有设计，不是本次缺陷。标准包与开发预览的同模式数据载荷均无变化。

完整研究投影仍保留 1659 条 WCD-10 facts、563 张 Research-only cards、436 条关系；其中 206 条 facts、117 张 cards 的 subject 在预览可见范围内，也没有进入部署投影。标准包与预览均通过非准入行/内部审核字段/原始治理文件检查。canary 回归覆盖既有公开作品、仅预览可见作品以及预览可见端点间的研究关系；注入后完整部署字节不变。

实际 Pages 子路径的 Chromium 桌面 30 项、手机 30 项产品测试通过，包含完整 sitemap 路由遍历。原有 4 项 WCD-08 专用候选预览用例仍依其原有环境开关跳过，属于另一种候选包模式；本次未修改该开关或测试。首次本机启动遇到沙箱权限、既有端口占用，随后手机 worker 被宿主 SIGKILL；保留各次失败记录，改用空闲端口并单独完成手机项目。没有为这些环境问题修改产品代码或测试断言。Actions 对当前提交再次执行完整桌面/手机 Job。

## CI 与治理边界

本文件记录提交前本地验收；[PR #38 Checks](https://github.com/Yillan-lamb/latin-american-literature-map/pull/38/checks) 的最终当前提交检查结果以 GitHub 为准。Research Integrity、Development Baseline 和实际 Pages 浏览器 Job 都必须成功；release-only Job 仍仅用于显式 workflow dispatch，不通过本任务开启。

`CHANGELOG` 已新增本次条目；唯一持久工作区 TASKS 登记 TASK-129；DECISIONS 无需更新，因为沿用既有研究/策展/版本/发布边界；新增稳定预览说明和本审计，冻结章程与 Spec 保持。内部治理正文不进入 Git。远端 CI 必须在推送后单独验收，不能以本地结果代替。

合理研究 gap、现有 USER_REVIEW 文案及 Public Release 暂停不构成本次 PR 的新增阻断。未执行 merge、tag、release 或 Pages 发布；由 USER 决定是否合并。
