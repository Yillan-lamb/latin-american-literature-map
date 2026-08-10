# V1-S2-003-A 项目经理验收记录

- task_id: `V1-S2-003-A`
- assignment_id: `V1-S2-003-A-SCOPED-LOCATORS`
- reviewer: `CODEX-PM`
- reviewed_at: `2026-08-09`
- verdict: `revise`

## 1. 结论

成果的来源访问、作品覆盖和 locator 引用关系实质可用，但交付包尚未通过 CSV 标准解析门禁，因此本轮结论为窄范围 `revise`。只修复一处 CSV 转义和受影响的自检记录，不重做来源核验、页段定位或作品矩阵。

## 2. 已通过项目

1. `SECTION_LOCATORS.csv` 标准解析为 18 行 × 13 列，`LOC-S2-001`~`018` 唯一，`manual_check_needed=yes` 共 9 条。
2. `WORK_SOURCE_MATRIX.csv` 标准解析为 14 行 × 8 列；六部作品覆盖数为 4/3/3/2/1/1，矩阵引用 locator 零悬空。
3. `LOC-S2-007` 对应的博尔赫斯中心官方 PDF 已独立打开：题名为 Silvia Rosman 的 *Politics of the Name: On Borges's “El Aleph”*，共 15 页，可将整篇作为一个 L2 内容单元。
4. `LOC-S2-010` 的 IMS 独立条目页可访问，页面明确标示《Água viva》、1973 年及撰稿人 Clarisse Fukelman。
5. 交付目录为 9 个登记文件，未发现 PDF、EPUB、inputs、长篇全文或敏感凭据。

## 3. 必须修复

1. 文件：`MATERIAL_ACCESS_LOG.csv`；位置：第 3 个物理行，`source_ref=DISC-BOR-002`。
   - 问题：`notes` 中 `Ficciones (1944, revised 1956)` 的英文逗号未按 CSV 规则转义，标准解析得到 13 列，而表头是 12 列。这与 `QA_REPORT.md` 的“8×12、无错列、12/12 通过”相矛盾。
   - 修复：使用标准 CSV writer 重写该记录或全表，确保 8 行数据均为 12 列；不得改变字段语义和其他记录。
2. 同步更新受影响的 `STATUS.md`、`QA_REPORT.md`、`HANDOFF.md` 和 `MANIFEST.md`：保留 R0 自检遗漏记录，写明 R1 已修复并重新运行共享验证脚本；不得自行把最终结论写成 `pass`。

## 4. 保持不变与禁止新增

- 保持不变：8 个来源、18 条 locator、14 条矩阵关系、所有来源判断和 URL、三表字段、现有可选页段信息。
- 禁止新增：下载文件、逐页定位、全文 OCR、文学解释、关系抽取、正式 `SRC-` 编号、主数据库或 GitHub 修改。
- 不要求处理：SRC-0002 页码偏移、USP/SciELO/UNESP/UESB 的细页段。这些在来源级证据标准下均不阻塞。

## 5. 重新验证

1. 运行 `python3 scripts/validate_external_delivery.py <交付目录> --profile FULL`，结果必须为 `pass`。
2. 标准解析三张 CSV，确认分别为 8×12、18×13、14×8。
3. 确认 locator ID 唯一、矩阵引用零悬空、六部作品覆盖数仍为 4/3/3/2/1/1。
4. 确认目录仍为 9 个登记文件且无禁止内容。

## 6. 项目经理决策

- A：接受 `LOC-S2-007` 全文 15 页作为一个 L2 单位，不再要求缩窄页段。
- B：`SRC-0002` 的核心文本范围止于正文 178；179 页 Bibliografía 可作为可选书目附录，不是 L2 必处理内容，也不影响验收。
- C：Britannica 可作为 B 级英文译本/合集书目信息的交叉来源；不能单独证明西语初版信息或文学解释。
- D：页码不再是准入门槛；若保留该可选元数据，以 UNESP 官方与 Crossref 一致的 222–243 为准，并在后续来源档案正常化时修正旧记录。
