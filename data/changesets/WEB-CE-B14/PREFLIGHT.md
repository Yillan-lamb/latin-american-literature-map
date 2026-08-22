# WEB-CE-B14 Preflight

日期：2026-08-21

## Roadmap scope

本批按 60+ 计划的“古巴高现代主义 + 殖民时期墨西哥”执行：何塞·莱萨马·利马、吉列尔莫·卡夫雷拉·因凡特、索尔·胡安娜·伊内斯·德·拉·克鲁斯，各 3 部代表作。计划中的中文名仅作读者入口，不作为事实来源。

## Baseline

- Git baseline：B13 commit `a8f777e`，分支 `codex/web-ce-b11-b15-luna-max`。
- 主库计数：317 entities、849 facts、245 relationships、244 sources、207 cards、21 gaps；migration log 18。
- 本批正式 ID 预留：authors `V1-ENT-0320`—`0322`，works/collections `V1-ENT-0323`—`0331`；实际写入前再次以主库查重和最新序列核对。

## Deduplication

- 通过原文姓名、中文姓名、重音符号和作者别名查询，José Lezama Lima、Guillermo Cabrera Infante、Sor Juana Inés de la Cruz 均未存在。
- 通过原文题名查询，`Paradiso`、`Oppiano Licario`、`La expresión americana`、`Tres tristes tigres`、`Vista del amanecer en el trópico`、`La Habana para un infante difunto`、`Primero sueño`、`Respuesta a Sor Filotea de la Cruz`、`Amor es más laberinto` 均未存在。
- 本批不新增地点实体；作者—国家关系复用当前主库的古巴 `V1-ENT-0096` 与墨西哥 `V1-ENT-0051`。初始候选误指 `V1-ENT-0235`（尼加拉瓜），已在本批复审中纠正，并对 B13 纪廉关系同步建立可追溯整改。
- 现有来源中未发现本批 7 个 canonical URL/来源身份；关系中无本批作者—作品 `CREATED` 或作者—国家重复关系。

## Evidence and scope decision

- Academy of American Poets and a Biblioteca Virtual Miguel de Cervantes scholarly article establish Lezama's Cuban identity and the 1957/1966/1977 work sequence; no influence relationship is entered。
- University of Texas Press and the accessible Escritores.org bibliography establish Cabrera Infante's Cuban identity and the 1967/1974/1979 title entries; the page also shows a 1987 `Vista...` entry, so 1974 remains a medium-confidence bibliographic candidate. `Vista del amanecer en el trópico` is kept as a `work` with form open; no collection label is asserted。
- UNAM repository, UNAM Libros OA and UNAM Global establish Sor Juana's 1651–1695 identity and the 1692/1691/1689 work dates and forms；其中 1691 是书信完成年、1689 是首演年，不作为首版出版年写入。
- 文学运动、影响关系、殖民传统或“代表作”判断不进入 Research；保持为策展层 `user_review`。无来源不足对象需要 HOLD；中文展示名全部使用 `provisional_title`。

## Coverage note

本批补入两位古巴作家和一位殖民时期墨西哥女性作家，增加小说、散文/小品、诗歌和戏剧形式；不新增城市或虚构空间。女性与殖民时期覆盖得到改善，但不为纠偏强行改变后续 roadmap。
