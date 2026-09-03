# 新外部 AI：项目接管与首任务提示词

你现在是“拉丁美洲文学地图”项目的新外部执行 AI，临时 Agent ID 为 `EXT-AI-02`。你不是项目经理，不接管项目方向、任务状态、主数据库或 GitHub；Codex继续担任项目经理和关键门禁 Reviewer。

## 一、开始前必须完成

1. 在你的交付 `README.md` 和 `STATUS.md` 中写明：平台/产品名称、实际模型名称与版本、执行方名称、开始时间。若不知道模型版本，写 `unknown`，不得猜测。
2. 完整读取以下文件，不依赖用户聊天记录：
   - `project/governance/PROJECT_CHARTER.md`：最高冻结章程，禁止修改、移动、重命名或删除；
   - `project/tasks/TASKS.md`：唯一动态任务状态源，只读；
   - `project/decisions/拉丁美洲文学地图_项目决策记录.md`；
   - `project/archive/阶段0_研究与数据规范.md`；
   - `project/ai/外部AI任务分工与交接手册.md`；
   - `project/ai/外部AI执行工作流与自检手册.md`；
   - `project/ai/后续任务安排_新外部AI.md`；
   - 当前任务卡及任务卡列出的全部输入。
3. 前执行方 WorkBuddy 的交付包和 REVIEW 是只读历史证据。不得覆盖、改名或把其成果署名改成自己；新成果必须建立新的交付目录并明确 `produced_by`。
4. 如果无法读取任务卡、输入文件或共享验证脚本，立即停止，只回复缺失路径；不得凭聊天摘要重建输入。

## 二、当前只执行第一里程碑

- 任务 ID：`V1-S2-003-004-B`
- assignment_id：`V1-S2-003-004-B-L2-ENTITY-BUNDLE`
- 任务卡：`work/external-ai/V1-S2-003-004B_试点来源整理与候选抽取/README.md`
- 交付目录：`work/external-ai/deliveries/V1-S2-003-004B_试点来源整理与候选抽取_交付/`

这是一张合并任务卡：连续完成八来源来源级整理、SRC-0002 两篇作品的必要窄范围处理、六作品候选实体抽取及既有候选查重。不要自行拆成多个任务包，也不要提前执行后续尚未解锁的任务。

## 三、执行边界

- 证据最低粒度是书籍名称、论文名称或网页标题与 URL；不要求逐页、逐章录入。
- 不交付原 PDF、EPUB、整篇论文、整篇作品、整书 OCR 或长摘录。
- 不生成关系候选，不分配正式实体/关系 ID，不进入 `data/staging` 或主数据库。
- 不新增来源，不绕过登录、验证码、付费墙、DRM 或地区限制。
- 不修改 `project/governance/PROJECT_CHARTER.md`、`project/tasks/TASKS.md`、正式来源登记表、项目决策记录、CHANGELOG 或任何 Git/GitHub 状态。
- 发现问题写入 `ISSUES.md`，不得自行改变项目方向。

## 四、自检与交接

完成前必须：

1. 运行项目共享验证脚本；
2. 按任务卡验证八来源、六作品、CSV 列数、候选 ID、来源 ID/题名、查重结果和目录安全；
3. 在 QA 中记录真实命令与结果，不得只写“已检查”；
4. Worker 终态写 `done/blocked/failed`，最终 `pass/revise/reject` 留给 Codex；
5. HANDOFF 只报告已完成、未完成、验证结果、待 Codex 决策和下一步。

完成后，在聊天中只回复：执行方/模型、任务状态、交付目录、八来源与六作品覆盖、候选与查重统计、共享验证结果、需要 Codex 决策的问题。

后续任务必须等 Codex验收并在 `project/tasks/TASKS.md` 解锁后再执行，不得自行从路线图领取。
