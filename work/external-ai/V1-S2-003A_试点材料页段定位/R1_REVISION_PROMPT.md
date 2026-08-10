# V1-S2-003-A R1 差量返修提示词

你是“拉丁美洲文学地图”项目的外部 AI Worker。`V1-S2-003-A-SCOPED-LOCATORS` 已由 Codex 审计，结论为窄范围 `revise`。

- 返修依据：`work/external-ai/reviews/V1-S2-003-A_PM_REVIEW.md`
- 原交付目录：`work/external-ai/deliveries/V1-S2-003A_试点材料页段定位_交付/`

只执行以下工作：

1. 修复 `MATERIAL_ACCESS_LOG.csv` 第 3 个物理行（`DISC-BOR-002`）：`notes` 内英文逗号未正确转义，导致该行被解析为 13 列。必须用标准 CSV writer 输出，使全表为 8 行数据 × 12 列，且不改变字段语义。
2. 不修改 `SECTION_LOCATORS.csv`、`WORK_SOURCE_MATRIX.csv` 的内容；重新验证它们仍为 18×13、14×8，locator 唯一且矩阵引用零悬空。
3. 仅同步受影响的 `STATUS.md`、`QA_REPORT.md`、`HANDOFF.md`、`MANIFEST.md`：记录 R0 漏检与 R1 修复；不要自行写最终 `pass`。
4. 运行：`python3 scripts/validate_external_delivery.py "work/external-ai/deliveries/V1-S2-003A_试点材料页段定位_交付" --profile FULL`，必须取得 `pass`，并把命令及结果写入 QA。

保持 8 个来源、18 条 locator、14 条矩阵关系和 9 个交付文件不变。不得补页码、下载资料、扩展研究、抽取关系、分配正式 ID、修改治理文件或操作 GitHub。

完成后只回复：修改文件、三表解析结果、共享验证脚本结果、交付目录。
