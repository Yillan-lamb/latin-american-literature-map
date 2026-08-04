# 外部 AI 任务说明

- task_id: `<TASK-ID>`
- title: `<任务标题>`
- task_type: `<catalog|source_record|ocr|qa|entity_extract|name_check|bibliography_check>`
- assignee: `<平台/Agent 名称>`
- model: `<模型名称与版本；不知道则写 unknown>`
- created_at: `<YYYY-MM-DD HH:MM 时区>`
- source_ids: `<SRC-XXXX；未分配则写 pending>`
- input_files: `<逐项列出>`
- allowed_scope: `<页码、章节、字段>`
- dependencies: `<任务 ID 或 none>`

## 目标

<一句话说明必须完成什么。>

## 必读文件

1. `PROJECT_CHARTER.md`（最高冻结章程，未经用户明确授权不得修改）
2. `docs/阶段0_研究与数据规范.md`
3. `docs/外部AI任务分工与交接手册.md`
4. 本文件

## 必须交付

- [ ] `STATUS.md`
- [ ] `QA_REPORT.md`
- [ ] `ISSUES.md`
- [ ] `HANDOFF.md`
- [ ] `MANIFEST.md`
- [ ] `<任务主体成果文件>`

## 验收标准

- [ ] <标准 1>
- [ ] <标准 2>
- [ ] 所有事实有来源 ID 和定位
- [ ] 未确认内容已进入 `ISSUES.md`
- [ ] 没有超出允许范围

## 禁止事项

- 不修改、移动、重命名或删除 `PROJECT_CHARTER.md`；
- 不修改原始文件；
- 不修改 `TASKS.md`、主数据库、决策记录或 GitHub；
- 不公开上传资料；
- 不猜测缺字、页码或出版信息；
- 不用聊天摘要替代文件交付。
