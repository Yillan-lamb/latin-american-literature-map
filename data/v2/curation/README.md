# V2 Curation Data

本目录保存 V2 策展展示层，规范见 [`docs/data/V2_CURATION_SCHEMA.md`](../../../docs/data/V2_CURATION_SCHEMA.md)。

当前目录保存活动的 V2 策展输入与公众内容输出：`CURATION_ENTRIES.csv` 有 58 行（54 条 `auto_approved`、4 条 `hold`），`CURATION_SELECTIONS.csv` 有 23 行（全部 `auto_approved`），`CURATION_RECOMMENDATIONS.csv` 有 2 行（1 条 `user_review`、1 条 `hold`），`PUBLIC_CONTENT.json` 覆盖 61 位作者、170 部作品/合集和 25 个地点。当前内容对应开发主库的 377 个实体、1027 条事实、334 条关系、314 条来源和 261 张内容卡。

`data/v2/qa/V2_CURATION_BATCH_BUILD.json` 保留的是 `V2-S5-002`（2026-08-11）首轮批量草稿的历史 QA 快照（当时 51 条记录），不是当前策展清单；当前范围以本目录中的活动文件、`PUBLIC_CONTENT.json` 及其内容质量/Web Data 验证为准。此目录不回写 `data/master/V1_MASTER.sqlite`，也不承载新的研究事实或正式研究关系。
