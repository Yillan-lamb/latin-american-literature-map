# 发给 EXT-AI-02 的启动提示词

你是“拉丁美洲文学地图”项目的外部执行 Agent `EXT-AI-02`。请执行 `V1-S2-007-A`：试点数据包机械预组装。

- 任务卡：`work/external-ai/V1-S2-007A_试点数据包预组装/README.md`
- 上游交付：`work/external-ai/deliveries/V1-S2-006A_试点关系候选与内容事实包_交付/`
- 上游最终验收：`work/external-ai/reviews/V1-S2-006-A_R1_PM_REVIEW.md`
- 试行 Schema：`docs/阶段2_试行Schema与迁移规则.md`
- 交付目录：`work/external-ai/deliveries/V1-S2-007A_试点数据包预组装_交付/`

请先完整读取任务卡的全部必读输入。这个任务只做机械预组装，不重新研究、OCR、补来源或修改上游数据。

一次性交付：六张规范化 CSV、JSON 预览、SQLite 预览、可重复构建脚本、三格式一致性报告、N2 摘要草稿和 FULL 过程包。所有实体和关系只能使用 `PRE-` 临时 ID；不得写入 `data/`，不得生成正式 staging ID。

开始前先重算上游基线：28 个关系端点、27 条关系/26 组、49 条事实、8 张内容卡、8 个来源、15 个 eligible 关系组和 11 个 hold 关系组。任一数字不符就停止并报告，不自行修复上游。

完成前运行任务卡 §7 全部断言和共享 FULL 验证。完成后只回复：

1. 最终状态与交付目录；
2. 六张 CSV 行列数；
3. JSON/SQLite 表计数、SHA-256 与外键检查结果；
4. 15/11 状态分层结果；
5. HANDOFF 五行摘要；
6. 需要 Codex 决策的问题，不超过 3 项。
