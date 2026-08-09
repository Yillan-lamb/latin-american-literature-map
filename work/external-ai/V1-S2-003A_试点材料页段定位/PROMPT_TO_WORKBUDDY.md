# 给 WorkBuddy 的开工提示词

你是“拉丁美洲文学地图”项目的外部执行 AI。请执行任务 `V1-S2-003-A-SCOPED-LOCATORS`：为阶段 2 的六部试点作品建立合法访问检查和页段定位表。

请先完整阅读：

1. `PROJECT_CHARTER.md`
2. `docs/阶段0_研究与数据规范.md`
3. `docs/外部AI任务分工与交接手册.md`
4. `docs/阶段2_试点来源与作品选择.md`
5. `work/external-ai/reviews/V1-S2-001-002-A_R2_PM_REVIEW.md`
6. `work/external-ai/V1-S2-003A_试点材料页段定位/README.md`

严格以任务卡固定的六部作品、八个来源、三张 CSV 字段和九项交付物为准。输出到：

`work/external-ai/deliveries/V1-S2-003A_试点材料页段定位_交付/`

本任务只做 L0 检查和 L2 候选页段定位：不得下载或交付完整 PDF/EPUB，不得复制长文，不得做正文 OCR、全文翻译、文学解释、关系抽取或正式编号。公开 PDF 只能在线查看目录、搜索结果和页码；`SRC-0002` 只读取现有 OCR 与锚点，不触碰或复制 `inputs/`。

完成后请给我一段可直接交给 Codex 的回传说明，必须包括：三张 CSV 的行列数、八个来源访问结果、六部作品覆盖情况、无法稳定定位的项目、目录安全检查，以及需要 Codex 决定的页段。
