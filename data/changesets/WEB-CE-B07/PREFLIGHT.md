# WEB-CE-B07 Preflight

## 时间与基线

- Batch 开始：2026-08-21（Asia/Shanghai）
- Git 基线：`f1448b5`（WEB-CE-B06 BATCH_PASS）
- 主库：`data/master/V1_MASTER.sqlite`
- 当前迁移序列：`0001`–`0009`；下一独立迁移：`0010_web_ce_b07_luna_max.sql`
- B06 完成后的完整性：`integrity_check=ok`；`foreign_key_check` 为空。

## 主库机器快照

| 表 | B07 开始行数 |
|---|---:|
| entities | 233 |
| facts | 560 |
| relationships | 161 |
| sources | 185 |
| content_cards | 123 |
| card_sources | 231 |
| relationship_evidence | 188 |
| gaps | 15 |

## 路线图查重

以下原文姓名、题名在 `entities.original_name`、`entities.name_zh` 和现有关系中均未发现正式实体或重复关系：

- Nicanor Parra：`Poemas y antipoemas`、`Versos de salón`、`Discursos de sobremesa`
- Alejandra Pizarnik：`Árbol de Diana`、`Los trabajos y las noches`、`Extracción de la piedra de locura`
- Mario Benedetti：`La tregua`、`Gracias por el fuego`、`Montevideanos`

可复用国家节点：智利 `V1-ENT-0123`、阿根廷 `V1-ENT-0001`、乌拉圭 `V1-ENT-0196`。不新增 PLACES_GEO 行；仅在 `PLACE_RELATIONS.csv` 增加三条作者—国家关系。

## 本批执行范围

- 3 位新作者、9 部代表作品；12 个新 entity、42 个 facts、12 条 relationships、9 个 sources、12 个 cards 为计划上限，最终以实际迁移和 Review 为准。
- 9 条 `CREATED`（作者 → 作品）和 3 条 `ASSOCIATED_WITH_PLACE`（作者 → 国家）；不新增 `INFLUENCED`、主题或作品故事地点关系。
- 中文名按 `common_title` 展示策略登记，原文题名始终保留。

## 来源准入

- Parra：Memoria Chilena 作者专题、Universidad de Chile 主题站书目、Memoria Chilena `Discursos de sobremesa` 书目页。
- Pizarnik：Argentina.gob.ar Cultura 作者文章、Cervantes Virtual CVC 书目与作品页。
- Benedetti：Fundación Mario Benedetti 作者传记、1959–1965 作品页及总书目 PDF。
- 搜索结果只作 discovery；事实 refs 使用已打开的正文或正式书目页。未把 Wikipedia、豆瓣或普通聚合页面写入正式来源。
