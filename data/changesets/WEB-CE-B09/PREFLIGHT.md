# WEB-CE-B09 Preflight

## 时间与基线

- Batch 开始：2026-08-21（Asia/Shanghai）
- Git 基线：`309806e`（WEB-CE-B08 BATCH_PASS）。
- 主库：`data/master/V1_MASTER.sqlite`；B08 后 `integrity_check=ok`、`foreign_key_check` 为空。
- 当前迁移序列：`0001`–`0011`；下一独立迁移：`0012_web_ce_b09_luna_max.sql`。

## 主库机器快照

| 表 | B09 开始行数 |
|---|---:|
| entities | 257 |
| facts | 644 |
| relationships | 185 |
| sources | 202 |
| content_cards | 147 |
| gaps | 15 |

## 路线图查重

在 `entities.original_name`、`entities.name_zh` 与关系端点中未发现以下 3 位作者及 9 部作品的正式实体或重复 `CREATED` 关系：Elena Poniatowska、José Emilio Pacheco、Roberto Bolaño；`La noche de Tlatelolco`、`Hasta no verte Jesús mío`、`Tinísima`、`Las batallas en el desierto`、`El principio del placer`、`No me preguntes cómo pasa el tiempo`、`Los detectives salvajes`、`2666`、`Estrella distante`。

可复用国家节点：墨西哥 `V1-ENT-0051`、智利 `V1-ENT-0123`；本批不新增地点实体，只新增 3 条作者—国家关系。

## 本批执行范围

- 3 位新作者、9 部代表作品；计划上限为 12 个新 entity、42 个 facts、12 条 relationships、9 个 sources、12 个 cards。
- 关系限于 9 条 `CREATED` 与 3 条 `ASSOCIATED_WITH_PLACE`，不新增 `INFLUENCED`、文学运动或强主题关系。
- `El principio del placer`、`No me preguntes cómo pasa el tiempo` 按作品集 `collection`；其余本批作品按 `work`。
- `Tinísima` 的机构页面出现 1991/1992 年差异；保留 `1991/1992` 中等置信事实并建立 `V1-GAP-0016`，不静默选定单一年份。
- 中文名采用路线图展示策略并标为 `common_title`；译者、出版社、ISBN 不构成本批门槛。

## 来源准入

本批使用 UNAM Voz Viva、UNAM 性别平等协调处、Instituto Cervantes、El Colegio Nacional、CEPE-UNAM、Memoria Chilena/Biblioteca Nacional de Chile 等已打开的机构页面；搜索摘要只作 discovery，正式 facts 与 relationships 仅引用登记来源。
