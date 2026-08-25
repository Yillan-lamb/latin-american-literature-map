# WEB-CE-B02 独立 Reviewer 复核

- 评审角色：fresh-context Independent Reviewer
- 评审日期：2026-08-20
- 输入：`project/governance/PROJECT_CHARTER.md`、`project/tasks/V2_TASKS.md`、`docs/data/数据新增与版本维护操作手册.md`、`project/plans/V2_网站产品决策与开发总说明书.md`、本批 `PREFLIGHT.md`、`RESEARCH_CHANGE_SET.json`、`0005_web_ce_b02_luna_max.sql`，以及现有主库和 Geo CSV。
- 方法：只读核对主库查重、静态变更集引用、事实/关系端点和 Geo 层；重新打开候选包列出的官方/机构网址。未写 SQLite、迁移脚本、网站或其他批次文件。

## 总体判词：REVISE

本批研究范围收敛正确，14 个候选实体（3 位作者、9 部作品/作品集、2 个国家地点）、12 张卡片、41 条事实和 12 条关系的结构可保留。没有发现作者、作品或 `CREATED` 重复，未把文学运动、影响、强主题或情节判断写成正式关系。返修是可局部完成的来源/地理元数据和题名证据对齐，不影响批次主体。

## 1. 来源身份、等级和重新核验

| 来源 | 身份/等级 | 2026-08-20 重新打开结果 | 结论与最小要求 |
|---|---|---|---|
| `SRC-0130`、`SRC-0131` | Nobel Prize Outreach / NobelPrize.org，B 级，页面身份正确 | Facts 与 Biographical URL 均返回 HTTP 403；搜索索引片段不能替代原页 | **REVISE**：不能继续标 `access_pass`。改为如实的 blocked 状态并保留候选，或换成可直接打开的官方/机构等价页面；在直接证据恢复前，不把依赖它们的事实/关系升级为已准入事实 |
| `SRC-0132` | 危地马拉文化与体育部 SICULTURA，B 级，机构身份正确 | 作者页返回 HTTP 403 | **REVISE**：同上；`Hombres de maíz` 的 1949 年、实体层和 `CREATED` 证据须改挂可打开来源，或维持候选状态 |
| `SRC-0133` | Isabel Allende 官方站，B 级 | `/en/bio` 外层页可打开，但正文只有通用说明；页面链接的完整传记和摘要 PDF 均返回 404 | **REVISE**：该页可作为官方入口记录，但不能单独直接支撑生年、出生地、职业或智利关系。具体字段改挂可直接打开的 `SRC-0134` 或新的官方来源；职业事实若无直接身份表述则删除/保留候选 |
| `SRC-0134` | Isabel Allende 官方时间线，B 级 | 可打开；明确显示 1942 年利马出生、1982/1984/1987 西语版出版和在智利成长/生活的时间线 | **PASS**：可支撑相应生平、出版年份和作者—智利关联 |
| `SRC-0135`–`SRC-0137` | Isabel Allende 官方作品页，B 级 | 均可打开；分别显示英文首版 1985/1987/1988 | **PASS**：迁移已用 `SRC-0134` 记录西语版首年，作品页只作英文版本对照，未混用年份 |
| `SRC-0138`、`SRC-0139` | Academia Brasileira de Letras，B 级 | Biografia 与 Bibliografia 均可打开；生卒、出生地和 1937/1958/1966 书目可回查 | **PASS**，但须处理 `Capitães` 题名变体（见下） |
| `SRC-0140` | Fundação Casa de Jorge Amado，B 级，机构身份正确 | 记录 URL 当前返回 404；搜索索引显示过 `Capitães da Areia — Romance, 1937`，但索引片段不能作为已打开来源 | **REVISE**：修正访问状态并提供可打开的官方/权威作品页；在此之前不能用它单独证明 `Capitães da Areia` 的精确题名 |

GeoNames 不是文学事实来源，仅作 Geo 坐标/边界来源。巴西 `3469034` 页面和检索结果确认为 Federative Republic of Brazil；但候选危地马拉 URL `https://www.geonames.org/3582678/republic-of-guatemala.html` 的 ID `3582678` 实际是 Belize，当前危地马拉国家记录为 `3595528`（或可使用 GeoNames 的 GT 国家页）。这是实质性链接错误，必须修正。

## 2. 实体、去重、原文题名和中文展示名

- **作者/作品去重：PASS。** 按作者原文名、作品原文题名、中文名和 `CREATED` 关系复核主库，三位作者及九部作品均无既有重复；Allende 正确复用既有智利节点 `V1-ENT-0123`。本批正式候选 ID 之间也无重复。
- **原文题名：总体 PASS，Amado 一项需题名对齐。** Asturias 的 `El Señor Presidente`、`Hombres de maíz`、`Leyendas de Guatemala` 和 Allende 三作均一致；ABL 页面列作 `Capitães de areia`，而候选及 Casa 页面采用 `Capitães da Areia`。这应记录为来源变体/规范化，而不是另建实体。当前 `V1-FCT-0395` 说“A​​BL 官方书目列出 `Capitães da Areia`”与 ABL 页面实际字样不符，必须改注或改挂 `SRC-0140` 的可打开证据。
- **中文展示名：PASS（候选展示层）。** 名称遵循路线图，翻译者、出版社、ISBN 和中文出版年按 PREFLIGHT 留待后续版本学轮次，不构成此次门槛；不要因《加布里埃拉》《沙滩船长》等展示名未覆盖全部副标题而另建实体。
- **实体层：PASS。** `Leyendas de Guatemala` 为 `collection`；其余八部为 `work`，卡片、`entity_layer` 事实和实体行一致。不要把技术 Geo 父节点当作作品/研究实体。
- **年份：PASS（在来源修复后保持）。** Asturias 1930/1946/1949、Allende 西语版 1982/1984/1987、Amado 1937/1958/1966 均与已核到的书目/时间线一致。Allende 作品页的英文首版年份已被正确写进说明而非替换原文首年；不应改成 1985/1987/1988。

## 3. 事实原子性、证据边界与关系

- **事实总体 PASS（候选状态）。** 41 条事实均有 `source_id`/`source_title`、字段粒度清楚且为 `candidate_for_staging_review`；作者生卒、国家、出生地和职业说明没有推导文学史地位。出生地作为 `birth_place` 事实处理，未自创 `BORN_IN` 关系，也没有把出生地自动当成作品故事地点。
- **需一并返修的事实说明。** `V1-FCT-0362` 的正文写“Nobel Facts”，但 `origin_id` 是 `SRC-0131`（Biographical）；应统一来源称谓。`V1-FCT-0368` 同时声称“第一部书、1930 年、源自玛雅传说的故事汇编”，且只挂 `SRC-0131`；应删去重复年份/拆分为可独立回指的书目说明，并准确写明实际页名/来源，不扩大证据。
- **解释/强关系边界：PASS。** 本批没有添加文学运动、影响、强主题或情节关系；卡片内容只写实体、作者、国家、语言和书目边界。所有 `CREATED` 均为作者→作品/作品集，九条端点层级正确，单条直接书目来源满足结构型关系最低要求；但 `SRC-0130`、`SRC-0132`、`SRC-0140` 被阻断的关系须在来源修复前保持候选。
- **作者—国家关系：PASS（来源修复条件）。** `V1-REL-0112` Asturias→Guatemala、`V1-REL-0113` Allende→既有 Chile、`V1-REL-0114` Amado→正式 Brazil，均为作者身份/生平关联，不是故事空间。0112 依赖 0130，0113 依赖具体内容不足的 0133，需按来源审计改挂或保留候选；0114 的 ABL 生平来源可回查。

## 4. Geo 节点和技术父节点检查

- **正式节点结构：PASS（除 Guatemala 来源 URL）。** 现有 `PLACES_GEO.csv` 已添加 `V1-ENT-0182`（Guatemala）和 `V1-ENT-0183`（Brazil），`PLACE_RELATIONS.csv` 已添加对应三条作者—国家关系；国家使用 `country_polygon_required`，不伪造中心坐标。
- **技术父节点规则：PASS。** `V2-GEO-BR` 保持 `hidden`、`technical_parent_node`、无 `entity_id`，仍只作为里约热内卢的技术父级；研究关系和迁移均指向正式 `V1-ENT-0183`，没有把 `V2-GEO-BR` 当正式研究实体，也没有删除它。
- **必须修复：** `V1-ENT-0182` 的 `coordinate_source_url` 和 `classification_source_url`、以及 `RESEARCH_CHANGE_SET.json` 的 `coordinate_source_url` 都把 Belize 的 GeoNames ID `3582678` 标成 Guatemala。换为可回查的 Guatemala ID `3595528`（或已打开的 GT 国家页）并重新检查 Geo CSV/网页投影一致性。出生地 Lima、Guatemala City、Itabuna 未被擅自制成地图节点，处理正确。

## 5. 最小返修清单

1. **修正来源访问状态和依赖关系。** 对 `SRC-0130/0131/0132/0140` 如实记录 403/404，或替换为当前可直接打开的官方/机构来源；相应事实与 `CREATED`/作者—国家关系在直接证据恢复前保持候选。对 `SRC-0133` 的生平字段和智利关系改挂 `SRC-0134`/新直接来源，职业事实无直接证据则移除或保留候选。
2. **修正 GeoNames。** 同步修正 `data/changesets/WEB-CE-B02/RESEARCH_CHANGE_SET.json`、`data/v2/geo/PLACES_GEO.csv` 两处 Guatemala 来源 URL；保留正式 `V1-ENT-0183` 和隐藏技术父节点 `V2-GEO-BR` 的现有分工。
3. **对齐 `Capitães da Areia` 题名证据。** 修正 `V1-FCT-0395` 的 ABL 题名表述，记录 `Capitães de areia` 为 ABL 页面变体，补入可打开的 `da Areia` 权威来源或规范化说明；不得因变体拆出第二个作品。
4. **校正事实说明的来源名和原子性。** 修正 `V1-FCT-0362` 的 Facts/Biographical 误称，收敛/拆分 `V1-FCT-0368` 的复合说明，并重新核对对应 `fact_sources`；其年份、实体层和展示名保持不变。

## 6. 返修后保持不变的范围

保留三位作者、九部作品/作品集、两国节点、九条 `CREATED`、三条作者—国家 `ASSOCIATED_WITH_PLACE`、Allende 的原文首年与英文版对照、所有强文学关系留空，以及卡片/事实的候选准入状态。完成上述四项最小返修并重新做来源/Geo 引用 QA 后，批次可进入下一整合门。

**最终结论：REVISE。**
