# WEB-CE-B06 Preflight

## 时间与基线

- Batch 开始：2026-08-21（Asia/Shanghai）
- Git 基线：`ea531ff7ff6c31cce4611d809e7efc537259ae06`（B02–B05 Sol 审计报告已提交）
- 主库：`data/master/V1_MASTER.sqlite`
- 当前迁移序列：`0001`–`0008`，下一独立迁移为 `0009_web_ce_b06_luna_max.sql`
- 前置确认：`dea1003` 的 B02–B05 Curation/Web 整改已在基线；没有待合并的 Sol 修复阻断本批。

## 主库机器快照

| 表 | 基线行数 |
|---|---:|
| entities | 220 |
| facts | 518 |
| relationships | 149 |
| sources | 174 |
| content_cards | 111 |
| gaps | 14 |
| relation_holds | 51 |

`PRAGMA integrity_check` 返回 `ok`；`PRAGMA foreign_key_check` 返回空集。

## 路线图查重

对以下原文姓名和题名在 `entities.original_name`、`entities.name_zh` 及来源题名中查询，均无现存正式实体或作品关系：

- César Vallejo：`Los heraldos negros`、`Trilce`、`Poemas humanos`
- Rubén Darío：`Azul...`、`Prosas profanas`、`Cantos de vida y esperanza`
- José Martí：`Ismaelillo`、`Versos sencillos`、`Nuestra América`

已有国家节点可复用：`V1-ENT-0124` 秘鲁、`V1-ENT-0096` 古巴。尼加拉瓜尚无国家实体，因此新增一个国家级 Geo 节点并建立 Darío—Nicaragua 关系。

## 本批执行范围

- 3 位新作者、9 部作品/作品集；不追加已有作者池，避免在来源研究已足够前为了数量扩张。
- 作品层区分：八部诗歌/散文集型作品使用 `collection`；`Nuestra América` 作为作者的独立 essay `work`。
- 12 条 accepted 关系：9 条 `CREATED`、3 条作者—国家 `ASSOCIATED_WITH_PLACE`；无 `INFLUENCED`、无强主题关系。
- `Los heraldos negros` 年份冲突进入 `V1-GAP-0015`，前端文案不得呈现为无争议年份。

## 来源准入

本批使用 Casa de la Literatura Peruana、Biblioteca Nacional de Chile/Memoria Chilena、Biblioteca Virtual Miguel de Cervantes 与 GeoNames 的已打开页面或 PDF。搜索摘要仅作 discovery，不作为事实证据；来源身份和支持范围在 Reviewer 中逐项重开。

## Reviewer 返修前置

初次 fresh-context Review 于 2026-08-21 给出 `REVISE`：Vallejo 作品页失效、SRC-0179 与 SRC-0184 不可独立复核、Darío/Martí 的部分事实越过来源正文、GeoNames 旧 URL cache miss。返修保留既有 ID，改用可直接打开的 Casa/PUCP PDF、Memoria Chilena Azul 页、Cervantes Virtual Martí 作者页及 GeoNames 国家页；新增 `SRC-0187`，并将无独立复核的 PDF 标为 `access_limited`。
