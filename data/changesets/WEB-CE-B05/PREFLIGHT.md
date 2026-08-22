# WEB-CE-B05 Preflight

## 基线

- 基线 commit：`d3c7ea6`（已完成并独立固化的 WEB-CE-B04）。
- 主库：`data/master/V1_MASTER.sqlite`。
- B04 后机器计数：entities 208；facts 476；relationships 137；sources 162；content_cards 99；card_sources 180；relation_holds 51；gaps 14。
- 进入 B05 前主库通过 master validator、`PRAGMA integrity_check` 和 foreign-key check。

## 路线图与逐项查重

计划 Batch 05 为：

1. Machado de Assis（马查多·德·阿西斯，巴西）：`Memórias Póstumas de Brás Cubas`、`Quincas Borba`、`Dom Casmurro`；
2. João Guimarães Rosa（若昂·吉马朗埃斯·罗萨，巴西）：`Grande Sertão: Veredas`、`Sagarana`、`Primeiras Estórias`；
3. Graciliano Ramos（格拉西利亚诺·拉莫斯，巴西）：`Vidas Secas`、`São Bernardo`、`Angústia`。

基于 B04 最新数据库按原文姓名、重音变体、中文展示名、原文题名和 `CREATED` 关系逐项查重：三位作者和九部作品均不存在。正式巴西国家节点 `V1-ENT-0183` 已存在并复用；不新增出生城市或作品场景节点。

## 来源与研究边界

- Machado：ABL 作者档案、ABL 书目、ABL 选文页及官方 MEC `Romance` 目录支持生卒、作者身份、三部作品题名、小说体裁和年份；目录只作为书目/体裁入口，不推导文学史结论。
- Guimarães Rosa：ABL 作者档案、ABL 书目和 ABL 纪念页面支持生卒、巴西身份、三部作品题名、形态和年份；不将新闻中的评价性语句写入 Research fact。
- Graciliano Ramos：BNDigital、巴拉那州公共图书馆、圣保罗市文化部门、Itaú Cultural 页面支持生卒、出生地和三部作品书目；BNDigital 页面含 Wikipedia 参考脚注，故本批不以它单独支撑文学史评价，相关事实优先与公共文化页面交叉记录。
- GeoNames Brazil 仅作为既有国家节点的地理身份来源，不作为作家或作品文学证据。

## 预期 ID 边界

- entities：`V1-ENT-0211`–`V1-ENT-0222`（3 作者、9 作品；无新 place）。
- entity maps：`V1-EMAP-0211`–`V1-EMAP-0222`。
- cards：`V1-CARD-0100`–`V1-CARD-0111`。
- facts：`V1-FCT-0479`–`V1-FCT-0520`（每位作者 5 项基础事实，每部作品 3 项书目/形态事实）。
- relationships：`V1-REL-0140`–`V1-REL-0151`（9 CREATED、3 作者—巴西关联）。
- relationship evidence：`V1-EV-0162`–`V1-EV-0173`。
- sources：`SRC-0165`–`SRC-0176`。
- card sources：从 `V1-CS-0186` 顺延；实际数量以迁移和机器计数为准。

如 Reviewer 发现书目年份、来源身份、中文展示名或国家关联证据不足，只做差量弱化、修正或转 HOLD；不为满足计划数量降低证据门槛。
