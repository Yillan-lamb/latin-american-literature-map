# WEB-CE-B13 Preflight

日期：2026-08-21

## Roadmap scope

本批按 60+ 计划的“巴西大众阅读 + 巴西现代诗 + 加勒比诗歌”执行：保罗·柯艾略、卡洛斯·德鲁蒙德·德·安德拉德、尼古拉斯·纪廉，各 3 部代表作。计划中的中文名仅作读者入口，不作为事实来源。

## Baseline

- Git baseline：B12 commit `20a27ee`，分支 `codex/web-ce-b11-b15-luna-max`。
- 主库计数：305 entities、815 facts、233 relationships、238 sources、195 cards、21 gaps；migration log 17。
- 本批正式 ID 预留：authors `V1-ENT-0308`—`0310`，works/collections `V1-ENT-0311`—`0319`；实际写入前再次以主库查重和最新序列核对。

## Deduplication

- 通过原文姓名、中文姓名、重音符号和作者别名查询，Paulo Coelho、Carlos Drummond de Andrade、Nicolás Guillén 均未存在。
- 通过原文题名查询，`O Alquimista`、`Veronika Decide Morrer`、`Onze Minutos`、`Alguma poesia`、`A rosa do povo`、`Claro enigma`、`Motivos de son`、`Sóngoro cosongo`、`West Indies, Ltd.` 均未存在。
- 本批不新增地点实体；作者—国家关系复用既有阿根廷/巴西/古巴国家节点（巴西 `V1-ENT-0183`、古巴 `V1-ENT-0235`）。
- 现有来源中未发现 ABL、BNDigital、USP Portal Latinoamericano 或 Biblioteca Virtual Miguel de Cervantes 的相同 canonical URL/来源身份；将登记 6 个新来源。
- 现有关系中无本批作者—作品 `CREATED` 或作者—国家重复关系。

## Evidence and scope decision

- ABL Paulo Coelho biography directly lists 1988/1998/2003 titles and identifies his Rio de Janeiro origin；USP portal independently repeats the bibliography。
- ABL `O ano Drummond` directly lists `Alguma poesia` (1930)、`A rosa do povo` (1945)、`Claro enigma` (1951)；BNDigital supplies author identity and poetry context。
- Cervantes Virtual bibliography directly records Guillén's three titles and years (1930/1931/1934)；CVC biography supplies Cuban identity and poem-collection context。
- 文学运动、影响关系、主题判断不进入 Research；保持为策展层 `user_review`。无来源不足对象需要 HOLD；日期冲突以来源明确字段为准，未把二手版本信息当首版年份。

## Coverage note

本批补入巴西与古巴，增加诗歌/诗集比例并改善加勒比覆盖；仍不新增城市或虚构空间。性别与区域平衡留待后续批次观察，不为达数量强行扩展。
