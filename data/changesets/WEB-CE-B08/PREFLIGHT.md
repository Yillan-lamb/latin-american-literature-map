# WEB-CE-B08 Preflight

## 时间与基线

- Batch 开始：2026-08-21（Asia/Shanghai）。
- Git 基线：`77a1d0a`（B07 已独立 Review、QA、commit）。
- 主库：`data/master/V1_MASTER.sqlite`；下一独立 migration：`0011_web_ce_b08_luna_max.sql`。

## 主库机器快照

| 表 | B08 基线行数 |
|---|---:|
| entities | 245 |
| facts | 602 |
| relationships | 173 |
| sources | 194 |
| content_cards | 135 |
| gaps | 15 |

`PRAGMA integrity_check` 为 `ok`，`PRAGMA foreign_key_check` 为空集。

## 路线图查重与调整

- José María Arguedas、Sergio Pitol、Juan José Arreola 三位作者在 master 中均不存在。
- `Yawar fiesta`、`Los ríos profundos`、`Todas las sangres`、`El desfile del amor`、`Domar a la divina garza`、`La vida conyugal`、`Confabulario`、`La feria` 均无现有同题作品关系。
- `Bestiario` 已作为 Cortázar 的作品存在，但本批将 Arreola 的同名作品建立为另一实体，由作者—作品关系区分；Reviewer 必须重点确认同名不同作者没有错误合并。
- 秘鲁与墨西哥国家节点已存在：`V1-ENT-0124`、`V1-ENT-0051`；不新增地点或坐标，仅添加 3 条作者—国家关系。

## 本批执行范围

- 3 位新作者、9 部作品；42 facts、12 relationships、8 sources、12 cards 的候选规模。
- 作品层：Arguedas 三部小说为 `work`；Pitol 三部小说为 `work`；Arreola 的 `Confabulario` 与 `Bestiario` 为 `collection`，`La feria` 为 `work`。
- 关系只使用 9 条 `CREATED` 与 3 条 `ASSOCIATED_WITH_PLACE`；不新增 `INFLUENCED` 或强解释性关系。
- 中文展示名沿用路线图通行名称，标为 `common_title`；译者、出版社、ISBN 不构成本批门槛。

## 来源准入

本批使用 Biblioteca Nacional del Perú、Casa de la Literatura Peruana、Instituto Cervantes/CVC、Fonoteca Nacional de México 等已打开的机构页面。搜索摘要只作 discovery，正式 facts 与 relationships 仅引用登记来源。
