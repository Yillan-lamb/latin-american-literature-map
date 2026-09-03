# 项目治理与协作文档

当前项目文档按稳定规则、公开事实、正式审计和本地项目管理分层。最高规则见 [`PROJECT_CHARTER.md`](./PROJECT_CHARTER.md)。

```text
project/
├── PROJECT_CHARTER.md       # 活跃总章程
├── README.md                # 本目录入口
├── plans/                   # 活跃的稳定产品/领域计划
├── ai/                      # 跨版本 AI 协作指南
├── audits/                  # 正式、可追踪的研究与网站审计
├── archive/                 # 已完成阶段、旧提案和历史审计
└── internal/                # 本地管理区，整体被 .gitignore 忽略
```

`project/internal/` 是唯一的动态项目管理区：`TASKS.md` 保存连续的全局任务登记，`DECISIONS.md` 保存当前决策记录，`prompts/`、`handoffs/` 和 `reviews/` 保存临时提示词、交接与内部复核。它们服务于本地协作，不进入 GitHub、发布包或公开链接。

角色边界由章程和 [`ai/AI_COLLABORATION_GUIDE.md`](./ai/AI_COLLABORATION_GUIDE.md) 说明；活动文档只引用稳定入口，历史材料从 [`archive/`](./archive/) 进入，不把归档文件当作当前执行指令。
