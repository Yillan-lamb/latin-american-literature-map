# V1-S2-001-002-A R1 项目经理复检记录

- task_id: `V1-S2-001-002-A`
- assignment_id: `V1-S2-001-002-A-PILOT-SOURCE-DISCOVERY`
- revision: `R1`
- reviewer: `CODEX-PM`
- reviewed_at: `2026-08-04`
- verdict: `revise`

## 结论

R1 已修复非法枚举、五条书目/机构错误、访问桶和主要汇总数字；两张 CSV 的结构、ID、总数、语言覆盖及目录安全均通过复检。但 `DISC-BOR-004` 仍是期刊索引而非具体论文，且交付文件明确承认同行评审未获证实，不能据此核定为 A 级；同时 `QA_REPORT.md` 的分作家 `access_status` 数字与最终 CSV 不一致。结论为 `revise`，仅需做窄范围 R2，不重做其余检索。

## 已通过范围

- 交付目录恰为 9 个文件，无子目录、PDF、EPUB、全文、`inputs/`、Cookie、密钥或 `.DS_Store`。
- `PILOT_SOURCE_CANDIDATES.csv` 标准解析为 21 行、20 列；`ACCESS_PLAN.csv` 为 21 行、7 列；ID 全部唯一且一一对应，枚举值合法。
- 机械重算结果为：博尔赫斯 11 条（A2/B6/C3，es6/en3/zh2，唯一机构 9）；李斯佩克朵 10 条（A4/B6，pt9/en1，唯一机构 8；葡语来源涉及巴西唯一机构 7 个）。
- 访问桶为 `legal_open_access=15`、`user_supply_purchase_or_borrow=5`、`discovery_only=1`；优先级为 high7/medium9/low5。
- 摘要正文按项目口径为 959 个汉字；主体摘要、HANDOFF 和 MANIFEST 的总量及访问桶统计与 CSV 一致。
- `DISC-BOR-005` 已改为阿根廷国家图书馆第 13 期《Cuestión Borges》；`DISC-LIS-005/006/009/010` 的 UFF、Rocco、UNESP、UESB 书目信息和主要落地页已按返修要求修正。
- 两位作家均有至少 3 部命名作品；李斯佩克朵葡语与巴西机构覆盖达到阶段 1 缺口补强要求。

## 必须修复

1. `PILOT_SOURCE_CANDIDATES.csv:5`（`DISC-BOR-004`）：当前对象是 `Borges Studies Online` 索引页，且 `verification_notes` 明示“同行评审未在索引页明示”。按照阶段 0 A 级定义，不能把期刊索引本身核定为同行评审文章。保持 `candidate_id` 和总量 21 不变，将本行改成一条可定位的具体开放论文。推荐使用 Silvia Rosman, *Politics of the Name: On Borges's “El Aleph”*, `Variaciones Borges` 14 (2002), pp. 7–21；官方开放文件：`https://borges.pitt.edu/bsol/documents/1401.pdf`，期号交叉记录：`https://www.jstor.org/stable/i24880275`。同步填写作者、年份、期号/页码、`covered_works=El Aleph`、访问状态和核验说明。若不采用该论文，则必须将 BOR-004 降为 B，并在现有 21 行内替换另一条为可核验的 A 级具体论文；不得新增第 22 条。
2. `QA_REPORT.md:41`：分作家的 `access_status` 统计仍沿用错误分配。按最终 R1 CSV 应改为：博尔赫斯 `open_access=8, purchase_or_borrow=1, catalog_only=1, preview_only=1`；李斯佩克朵 `open_access=7, catalog_only=2, purchase_or_borrow=1`；合计仍为 `open_access=15, catalog_only=3, preview_only=1, purchase_or_borrow=2`。
3. 因 BOR-004 的对象将从“期刊索引”变为“具体论文”，同步更新 `PILOT_SOURCE_SUMMARY.md`、`ACCESS_PLAN.csv`、`ISSUES.md`、`HANDOFF.md`、`QA_REPORT.md`、`README.md`、`STATUS.md` 和 `MANIFEST.md` 中直接受影响的描述。等级、语言、桶和优先级数字须从最终 CSV 重算；无变化也要在 QA 中记录复算结果。

## 保持不变

- 候选总数保持 21，`candidate_id` 不变；除 BOR-004 及直接同步字段外，不改写其余 20 条候选。
- 不撤销已通过的 BOR-005、LIS-005、LIS-006、LIS-009、LIS-010 返修。
- 任务仍是来源发现和书目核验；不下载或交付全文，不做 OCR、文学研究、实体/关系抽取或 `SRC-` 编号。
- 李斯佩克朵保持 9 条葡语来源和现有巴西机构覆盖。

## 禁止新增

- 不新增第 22 条候选，不扩大到其他作家或作品。
- 不购买、预约、登录机构资源，不绕过付费墙、DRM 或访问控制。
- 不修改 `PROJECT_CHARTER.md`、`TASKS.md`、来源注册表、既有任务包、决策记录、CHANGELOG 或 GitHub。

## R2 重新验证

1. 核对 BOR-004 已变为具体论文，作者、题名、期号、年份、页码、作品、URL 和开放边界均可复核。
2. 确认博尔赫斯至少 2 条符合 A 级定义的具体候选，仍为 11 条且总候选仍为 21 条。
3. 标准解析两张 CSV，确认 21×20、21×7，ID 唯一且一一对应，枚举合法。
4. 重算作家、语言、等级、`access_status`、访问桶、优先级和唯一机构；核对 SUMMARY、QA、HANDOFF、MANIFEST 无矛盾。
5. 检查九个交付文件已经同步，不含旧的“BSOL 索引即 A 级”结论。
6. 重查目录安全边界；确认未修改任何输入或治理文件。

## 遗留决策状态

R2 通过前，暂不选定试点作品、不核定正式来源等级，也不启动购买、档案预约、材料处理或 OCR。
