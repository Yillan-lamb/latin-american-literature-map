# V2-N4-R04 Research change set

- 类型：A 新增来源 + D 补充已有实体事实（FULL）
- 目标：只补 rc.5 作品公众导读缺少的叙事情境、人物与空间基础；不新增实体，不升级 hold，不改正式解释关系。
- 去重：10 个出版社页面均以 ISBN、页面 Product Details 与 canonical URL 查重，结论为 `new`；目标作品实体全部 `reuse`。`SRC-0076` 页面 URL 不含 ISBN 尾段，但页面 Product Details 明示 `9780394752846`。核验日期为 2026-08-13。
- 来源：`SRC-0075`—`SRC-0078`、`SRC-0080`—`SRC-0085`，Penguin Random House / Vintage / Pantheon / Debolsillo / Penguin Classics 书目或阅读指南页面；未形成事实闭环的 `SRC-0079` 已在 Reviewer 返修中删除，ID 不另分配。
- 候选事实：`V1-FCT-0239`—`V1-FCT-0256`；全部为来源可直接支持的低剧透释义。
- Reviewer：独立 `CODEX-REVIEW` 初审结论 `REVISE`，要求删除未使用来源、收窄两条释义、沿用既有状态枚举并明确保留年份 hold；返修后再次复审。Worker 不自审。
- 迁移：`data/master/migrations/0001_rc5_work_context_sources.sql`。
- 边界：不覆盖 `data/exports/v1.0.0/`；迁移后导出到新版本目录；Curation 价值判断另走 USER_REVIEW。
- 年份边界：《消逝的足迹》1953 年仍保留既有 hold；`SRC-0077` 的评论性文字不作为独立书目交叉依据，本变更集不新增或升级该年份事实。
