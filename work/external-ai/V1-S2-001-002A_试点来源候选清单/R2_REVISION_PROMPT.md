# 给 WorkBuddy 的 R2 精确返修提示词

你是“拉丁美洲文学地图”项目的外部执行 AI。请对 `V1-S2-001-002-A` R1 交付包进行一次窄范围 R2 返修。以 `work/external-ai/reviews/V1-S2-001-002-A_R1_PM_REVIEW.md` 为唯一返修依据。

## 输入与输出

- 原目录返修：`work/external-ai/deliveries/V1-S2-001-002A_试点来源候选清单_交付/`
- 保持 9 个交付文件，不新增第 10 个交付文件。
- 不修改输入资料、治理文件、`TASKS.md`、`PROJECT_CHARTER.md`、决策记录、CHANGELOG 或 GitHub。

## 必须完成

1. 保持 `DISC-BOR-004` ID 不变，把对象从 BSOL 期刊索引改为具体论文：Silvia Rosman, *Politics of the Name: On Borges's “El Aleph”*, `Variaciones Borges` 14 (2002), pp. 7–21。
   - 官方开放文件：`https://borges.pitt.edu/bsol/documents/1401.pdf`
   - 期号交叉记录：`https://www.jstor.org/stable/i24880275`
   - 如实填写作者、题名、来源类型、出版机构、年份、期号/页码、URL、页面标题、`covered_works=El Aleph`、访问状态、权利说明和核验说明。
   - 只记录网页核验结果，不下载或交付 PDF。
   - `proposed_source_level=A` 仍只是建议，最终等级由 Codex 核定。
2. 修正 `QA_REPORT.md` 的分作家 `access_status`：
   - 博尔赫斯：`open_access=8, purchase_or_borrow=1, catalog_only=1, preview_only=1`；
   - 李斯佩克朵：`open_access=7, catalog_only=2, purchase_or_borrow=1`；
   - 合计：`open_access=15, catalog_only=3, preview_only=1, purchase_or_borrow=2`。
3. 同步更新 `PILOT_SOURCE_SUMMARY.md`、`ACCESS_PLAN.csv`、`ISSUES.md`、`HANDOFF.md`、`QA_REPORT.md`、`README.md`、`STATUS.md`、`MANIFEST.md` 中受 BOR-004 对象变化影响的描述。删除或改正所有把“BSOL 索引本身”当作 A 级候选的表述。
4. 从最终 CSV 重新机械计算全部数字，不手填沿用旧结果。若计数未变化，也在 QA 中记录复算值。

## 保持不变

- 总候选 21 条；博尔赫斯 11 条、李斯佩克朵 10 条；所有 candidate_id 不变。
- 除 BOR-004 及直接同步字段外，不改写其余 20 条候选。
- 不撤销 BOR-005、LIS-005、LIS-006、LIS-009、LIS-010 的 R1 修正。
- 不进行下载、OCR、文学研究、实体/关系抽取、正式来源编号、购买或档案预约。

## 交付前自检

1. 两张 CSV 标准解析分别为 21×20、21×7；ID 唯一且一一对应；所有枚举合法。
2. BOR-004 为具体论文，不再是期刊索引；作品指向 `El Aleph`，元数据可由两条给定来源复核。
3. 博尔赫斯仍有至少 2 条 A 级建议候选，且两条均为具体、可定位的学术文献。
4. SUMMARY、QA、HANDOFF、MANIFEST 的等级、语言、访问状态、访问桶、优先级、机构数量完全一致。
5. 交付目录仍恰为 9 个文件，无 PDF、EPUB、全文、`inputs/`、Cookie、密钥或 `.DS_Store`。
6. 更新 `STATUS.md` 为 R2 已完成、等待 Codex 复检；更新 QA、ISSUES、HANDOFF 和 MANIFEST，保留 R0/R1 问题历史，不自行写 `pass`。

完成后请回复：修改文件清单、BOR-004 最终字段摘要、机械复算结果、目录安全检查结果，以及供 Codex R2 复检的任务包说明。
