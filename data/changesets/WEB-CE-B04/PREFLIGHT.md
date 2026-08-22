# WEB-CE-B04 Preflight

## 基线

- 基线 commit：`97fe225`（已完成并独立固化的 WEB-CE-B03）。
- 主库：`data/master/V1_MASTER.sqlite`。
- B03 后机器计数：entities 195；facts 434；relationships 125；sources 150；content_cards 87；card_sources 158；relation_holds 51；gaps 13。
- 进入 B04 前主库通过 master validator、`PRAGMA integrity_check` 和 foreign-key check。

## 路线图与逐项查重

计划 Batch 04 为：

1. Adolfo Bioy Casares（阿根廷）：`La invención de Morel`、`Plan de evasión`、`El sueño de los héroes`；
2. Augusto Roa Bastos（巴拉圭）：`Hijo de hombre`、`Yo el Supremo`、`El fiscal`；
3. Horacio Quiroga（乌拉圭）：`Cuentos de amor de locura y de muerte`、`Cuentos de la selva`、`Los desterrados`。

基于 B03 最新数据库按原文姓名、重音变体、中文展示名、原文题名和 `CREATED` 关系逐项查重：三位作者和九部作品均不存在。正式阿根廷节点 `V1-ENT-0001`、乌拉圭节点 `V1-ENT-0196` 可复用；巴拉圭节点不存在，本批仅新增国家节点 `V1-ENT-0210`，不把作者出生地或一般生平地点强行变成地图节点。

## 本批执行范围

- 新增 3 位作者、9 部作品和 1 个巴拉圭国家节点。
- 只写入直接来源支持的作者生卒、出生地、国家/作家身份与作品书目/首版年份；不建立影响、文学运动、代表性或强主题关系。
- Geo 仅新增巴拉圭国家级节点与三条作者—国家关联；不新增未有直接场景证据的作品地点，不生成虚构地点坐标。
- 中文名作为读者展示候选；原文题名始终保留，译者、出版社、译本年份和 ISBN 不作为本批准入门槛。
- Roa Bastos 的三部作品可由机构来源作为书目关联核对，但“权力三部曲”等解释性概括仅保留为 HOLD/策展线索。

## 预期 ID 边界

- entities：`V1-ENT-0198`–`V1-ENT-0210`（3 作者、9 作品、1 国家）。
- cards：`V1-CARD-0088`–`V1-CARD-0099`。
- facts：`V1-FCT-0437`–`V1-FCT-0478`。
- relationships：`V1-REL-0128`–`V1-REL-0139`（9 CREATED、3 作者—国家关联）。
- sources：`SRC-0153`–`SRC-0164`。

若 Reviewer 发现书目年份、来源身份、中文展示名或地理关联证据不足，只做差量弱化、修正或转 HOLD；不为满足计划数量降低证据门槛。

## Reviewer 修订门

fresh-context Reviewer 初审为 `REVISE`，指出两项局部问题：`La invención de Morel` 的 1940/1941 来源冲突，以及 Quiroga 三个故事集的实体层误写为 `work`。Integrator 已在正式迁移前完成最小修订：规范化 SRC-0154，保留双来源并新增 `V1-GAP-0014` 交 Sol 复核；将 V1-ENT-0207–0209、对应事实和卡片统一改为 `collection`。迁移必须在 B03 新副本上重新演练并经复核后才可进入主库。
