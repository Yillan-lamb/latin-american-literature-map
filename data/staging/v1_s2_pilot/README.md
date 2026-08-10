# V1-S2 Pilot Staging Package

这是 Codex 基于 `V1-S2-007-A` 已通过 PRE 包生成的 N2 审核暂存数据，不是正式发布主数据库。

- 28 个规范实体；
- 15 个 `accepted_for_n2` 关系；
- 11 个 `hold_needs_second_source` 关系，单独保存；
- 52 条来源事实；
- 9 张内容卡，其中第 9 张为 1949 年作品集《阿莱夫》结构型简卡；
- 11 个来源，其中 3 个为 Codex 权威来源补充；
- CSV、JSON、SQLite 由本脚本单源生成。

`STG-` ID 仅在 N2 审核期稳定。N2 通过后才冻结 V1 Schema 和正式 ID 策略。
