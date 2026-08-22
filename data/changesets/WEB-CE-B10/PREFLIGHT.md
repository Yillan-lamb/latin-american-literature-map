# WEB-CE-B10 Preflight

## 时间与基线

- Batch 开始：2026-08-21（Asia/Shanghai）
- Git 基线：`6c24191`（WEB-CE-B09 BATCH_PASS）。
- 主库：`data/master/V1_MASTER.sqlite`；B09 后 `integrity_check=ok`、`foreign_key_check` 为空。
- 当前迁移序列：`0001`–`0012`；下一独立迁移：`0013_web_ce_b10_luna_max.sql`。

## 主库机器快照

| 表 | B10 开始行数 |
|---|---:|
| entities | 269 |
| facts | 686 |
| relationships | 197 |
| sources | 211 |
| content_cards | 159 |
| gaps | 16 |

## 路线图查重

在 `entities.original_name`、`entities.name_zh` 与 `CREATED` 关系端点中未发现 Eduardo Galeano、Ricardo Piglia、César Aira 及本批九部作品的正式实体或重复关系。复用国家节点：乌拉圭 `V1-ENT-0196`、阿根廷 `V1-ENT-0001`；本批不新增地点实体。

## 本批执行范围

- 3 位新作者、9 部代表作品/作品集；初始预期新增 12 entities、42 facts、12 relationships、11 sources、12 cards；Review remediation 另补 1 条 Galeano `country_or_region` fact，最终为 43 facts。
- 关系限于 9 条 `CREATED` 与 3 条 `ASSOCIATED_WITH_PLACE`，不新增 `INFLUENCED`、文学运动或强主题关系。
- Galeano 的 `Memoria del fuego I. Los nacimientos` 与 `El libro de los abrazos`、Piglia 三部小说、Aira 三部小说按来源分别标注 work/collection 层级。
- 中文展示名采用路线图读者标签并标为 `common_title`；译者、出版社、ISBN 不构成本批门槛。

## 来源准入

- Galeano：Uruguay Educa、阿根廷国家文化部、乌拉圭议会图书馆目录。
- Piglia：作者维护的作品/档案页、Princeton University Library、Universidad Nacional de La Plata 学术出版物。
- Aira：阿根廷国家图书馆、Fundación Konex、大学出版社/同行评议或学术期刊页面。
- 搜索结果只作 discovery；正式 facts 与 relationships 仅引用已打开并能定位题名或年份的登记来源。

## Review remediation before integration

- Follow-up Reviewer `LUNA-MAX-B10-REVIEW`：`PASS`。
- 补入 `V1-FCT-0731`（Galeano `country_or_region=乌拉圭`）及其 `fact_sources`/`card_facts`；补入 `V1-CS-0343`（`V1-CARD-0165`—`SRC-0215`）。
- 统一展示名为 `《火的记忆Ⅰ：创世纪》`；移除迁移事务控制语句；将 `SRC-0223.author_or_editor` 对齐为 María Belén Riveiro。
