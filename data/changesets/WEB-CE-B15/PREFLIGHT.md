# WEB-CE-B15 Preflight

日期：2026-08-21

## Roadmap scope

本批按 60+ 计划的“秘鲁短篇 + 阿根廷‘客观主义’ + 古巴流亡写作”执行：胡利奥·拉蒙·里贝罗、胡安·何塞·萨埃尔、雷纳尔多·阿雷纳斯，各 3 部代表作。计划中的中文名只作读者入口，不作为事实来源。

## Baseline

- Git baseline：B14 commit `566fe5a`，分支 `codex/web-ce-b11-b15-luna-max`。
- 主库计数：329 entities、883 facts、257 relationships、251 sources、219 cards、21 gaps；migration log 19。
- 正式主库完整性：B14 已验证 `integrity_check=ok`、foreign key check 为空；Sol B06–B10 remediation 与 audit commits 已在基线。
- 本批正式 ID 预留：authors `V1-ENT-0332`—`0334`，works/collections `V1-ENT-0335`—`0343`；来源 `SRC-0254`—`SRC-0260`；facts `V1-FCT-0890` 起；relationships `V1-REL-0260`—`0271`；cards `V1-CARD-0220`—`0231`。正式写入前再次以主库查重和最新序列核对。

## Deduplication

- 通过原文姓名、中文姓名、重音符号和作者别名查询，Julio Ramón Ribeyro、Juan José Saer、Reinaldo Arenas 均未存在。
- 通过原文题名查询，`Los gallinazos sin plumas`、`Silvio en El Rosedal`、`La palabra del mudo`、`El limonero real`、`El entenado`、`Glosa`、`Celestino antes del alba`、`El mundo alucinante`、`Antes que anochezca` 均未存在。
- 本批不新增地点实体；作者—国家关系复用当前主库秘鲁 `V1-ENT-0124`、阿根廷 `V1-ENT-0001`、古巴 `V1-ENT-0096`。
- 关系规范化查询未发现本批作者—作品 `CREATED` 或作者—国家 `ASSOCIATED_WITH_PLACE` 重复；来源 canonical URL 也未与现有来源重复。

## Evidence and scope decision

- 秘鲁外交部 Centro Cultural Inca Garcilaso 页面直接提供 Ribeyro 1929–1994、生平及 `Los gallinazos sin plumas`（1955）、`Silvio en El Rosedal`（1989）、`La palabra del mudo` 版本条目；UNMSM《Letras》同行评议文章进一步确认 `Los gallinazos sin plumas` 是 1955 年的城市短篇集。三者均按 collection 层登记。
- 阿根廷政府文化页面和 UNL 学术研究资料共同列出 Saer 的 `El limonero real`（1974）、`El entenado`（1983）、`Glosa`（1986）。存在未定位、未核实的 1985 discovery lead；正式事实保留 1986（medium），并新增可追溯 research gap，要求 Sol 复核版本/版次差异。
- Princeton University Library finding-aid 记录 Arenas 1943–1990；Cardiff University Press 论文直接确认 `Celestino antes del alba`（1967）与 `El mundo alucinante`（1968）为其前两部小说；Universidad de Antioquia 综述直接确认 `Antes que anochezca` 西语首刊于 1992，并说明其自传体形式。仅建立作者—作品和作者—古巴关系，不建立流亡因果或影响关系。
- 文学运动、影响关系、所谓“客观主义”定位和强主题判断不进入 Research；中文展示名全部使用 `provisional_title`。

## Coverage note

本批补入秘鲁短篇集、阿根廷小说与古巴流亡写作，新增三位男性作者，体裁上增加短篇集和自传体，区域上补强秘鲁与阿根廷，并延续古巴覆盖。本批不新增城市或虚构空间；作品级地点证据仅在来源明确时保留在策展说明，不伪造坐标。
