# WEB-CE-B09 独立复核

## 结论：REVISE

本批的实体范围、关系边界和研究层/策展层分离总体通过，但当前不能无条件 PASS：至少一个登记来源在本次复核中无法重新打开，且 `Tinísima` 的争议年份证据链需要在入库前再次确认。

## 已核对并通过

- SQLite 快照 `integrity_check=ok`，`foreign_key_check` 无返回。
- 3 位作者（Poniatowska、Pacheco、Bolaño）及 9 部作品/作品集均存在且无重复；实体数量为 3 author + 7 work + 2 collection。
- 关系恰为 9 条 `CREATED` 与 3 条 `ASSOCIATED_WITH_PLACE`；端点均正确，未发现 `INFLUENCED`、运动或强主题关系。作者—国家关系复用 `V1-ENT-0051`（墨西哥）和 `V1-ENT-0123`（智利），未新增地点或坐标。
- `El principio del placer` 与 `No me preguntes cómo pasa el tiempo` 的 `entity_layer=collection`，其余作品为 `work`，与变更说明一致。
- 作者出生/死亡年份、出生地、国家字段和作品年份均有 `facts`，并通过 `fact_sources`/`card_facts` 关联；关系亦有 `relationship_evidence` 与 `relationship_sources`。`CREATED` 关系的 `Tinísima` 条目标记 `DISPUTED-YEAR`。
- `V1-GAP-0016` 为 `open_research`，明确记录 SRC-0206 的 1992 与 SRC-0207 的 1991 冲突；事实保留 `1991/1992`，没有静默选择单一年份。策展 JSON 全部保持 `user_review`，未越过公共内容准入。
- 重新打开的机构来源中，UNAM Voz Viva PDF、UNAM 性别平等页面、Cervantes、El Colegio Nacional、CEPE-UNAM、Memoria Chilena 作者页/作品页/2005 档案页均能定位到登记页面（部分页面正文抓取不完整，但 URL/机构身份可确认）。

## 必须修订后再通过

1. 重新验证 `SRC-0207`（Gaceta UNAM）可访问性及其明确的 `Tinísima`=1991 证据。该 URL 本次重新打开返回 Internal Error；在无法打开时，不应继续把来源标为 `access_pass` 并作为争议年份的唯一 1991 支持。应提供可复核的同一机构页面/快照，或将该来源降级并补充可打开的一手机构来源。
2. 复核 `SRC-0206` 页面中 `Tinísima`=1992 的具体定位，并在 `fact_sources`/`relationship_evidence` 的说明中保持“一源一事实”的可追溯性。确认两边确实分别支持 1991、1992 后，保留 `1991/1992` 与 `V1-GAP-0016` 的现状即可。
3. 修订后重新运行完整迁移 QA（完整来源 URL 检查、事实—来源、关系—证据、策展引用和坐标检查）；通过后才可将本批状态改为 PASS。

## 复核范围说明

本复核只写入本文件，未修改 candidate、migration、master DB、Geo、Web 或 curation 文件。

## Follow-up 复核（2026-08-21）

### 结论：PASS

本节明确 supersede 上述初次复核的 `REVISE` 结论。修订后的来源、年份证据链和临时迁移 QA 均已通过。

### 已复核事项

- `SRC-0207` 已改为 Instituto Cervantes 页面：<https://www.cervantes.es/bibliotecas_documentacion_espanol/creadores/poniatowska_elena.htm>。页面明确支持 Elena Poniatowska 生于 1932 年、拥有墨西哥国籍、`La noche de Tlatelolco` 1971，以及 `Tinísima` 1991。
- `SRC-0206` UNAM 页面：<https://coordinaciongenero.unam.mx/2022/05/elenisima-literaria-contadora-de-vidas-elena-poniatowska/> 可打开，并明确列出 `Tinísima` 1992；因此 `1991/1992` 冲突及 `V1-GAP-0016` 的 `open_research` 状态应继续保留，未静默选定单一年份。
- 临时数据库在应用 `0012_web_ce_b09_luna_max.sql` 后通过完整验证：`integrity_check=ok`、`foreign_key_check` 无错误、结构化 validator `verdict=pass`，且 B09 新增来源、实体和关系的端点与来源关联完整。
- 全部 9 个登记来源 URL 均可重新打开；未发现链接失效。作品集/作品层级、事实—来源、关系—证据、策展引用和无新增坐标约束均保持通过。

本次 Follow-up 仅追加于本复核文件；未修改 candidate、migration、master DB、Geo、Web 或 curation 文件。
