# V2 地图数据补充与 QA

## 1. 任务信息

- 任务：`V2-S1-002`
- 日期：2026-08-11
- 状态：`✅ DONE`
- 上游：`project/audits/web/V2_DATA_READINESS_AUDIT.md`、V1 正式主库 `data/master/V1_MASTER.sqlite`
- 输出：`data/v2/geo/PLACES_GEO.csv`、`data/v2/geo/PLACE_RELATIONS.csv`

本任务只建立 V2 地图所需的独立地理补充层，不回写 V1 主库，不改变 V1 实体、关系、事实或审核状态。V2 前端后续只能消费本层及 Web Data，不得把事实写死在组件中。

## 2. 数据规模与覆盖

| 检查项 | 结果 |
|---|---:|
| V1 place 实体 | 22 |
| 地图地点行（含 2 个技术父级） | 24 |
| V1 地点关系 | 25 |
| V2 地点关系行 | 25 |
| V1 real | 19 |
| V1 fictional | 2 |
| V1 unknown / 待定 | 1 |
| 技术父级 real | 2 |
| 有公开坐标的地点 | 12 |
| 无坐标但允许继续保留为非点位节点 | 10 |
| `source_reference` 缺失 | 0 |
| 虚构空间误用现实坐标 | 0 |

22 个 V1 地点实体全部进入 `PLACES_GEO.csv`。`V2-GEO-BR` 与 `V2-GEO-ES` 是为里约热内卢、马德里作者地理路径设置的技术父级节点，不是 V1 研究实体，也不应单独作为文学地图卡片展示。

## 3. 允许的地图类型

本批数据只服务三种 V2 地图语义：

1. `author_geography`：作者与国家、城市或地区的关联。
2. `story_setting`：作品在现实地点中的故事空间。
3. `fictional_setting` / `fictional_space`：作品或作者关联的虚构文学空间。

历史事件仍留在 V1 数据库、页面与时间线中，本批不创建独立的事件地图层。

## 4. 坐标与分类规则

- 国家行使用 `country_polygon_required`，不把国家中心点冒充精确地点。
- 城市或地区坐标全部记录公开来源、抓取日期和精度；城市点仅表示城市/地区概览，不代表具体叙事场景。
- `科马拉`与`马孔多`保留为虚构空间，不写入现实坐标；`科马拉`不得因现实中存在同名城镇而自动合并。
- `阿什格罗夫`目前不能确认是可落地的现实地点，设为 `unknown + hidden`。
- `加雷街`虽属于现实街道名称，但当前证据不足以安全绑定到可用地图点，设为 `street_unresolved + hidden`。
- `墨西哥城`有候选现实坐标，但当前 V1 没有正式地点关系，因此保留候选点并隐藏，不制造新的文学关系。
- `帕拉尔`的当前点位来源为公开地理索引的 GeoNames 派生页面，标记为 `provisional`；在补充智利官方地理来源前保持 `hidden`，不进入公开地图。

## 5. 关系 QA

- `PLACE_RELATIONS.csv` 与 V1 的 25 条 `ASSOCIATED_WITH_PLACE` / `SET_IN` 关系逐条对应。
- `v1_relationship_id` 是回溯 V1 审核证据的唯一入口；当前全部保留原 V1 `accepted_at_n3` 状态及置信度。
- 17 条作者—地点关系被映射为 `author_geography`。
- 8 条作品—地点关系被映射为 `story_setting` 或 `fictional_setting`。
- `马孔多`的作者关联和作品设定分别保留，不合并为现实哥伦比亚地点。
- 没有为地图层新增 V1 没有的作者—地点、作品—地点事实。

## 6. 来源登记

坐标优先使用 GeoNames 等公开地理数据库的地点页或检索页；区域边界优先使用政府公开页面。文学空间分类以 V1 关系描述和可核验的公开文学/文化机构材料为依据。来源 URL 已直接写入 `coordinate_source_url` 或 `classification_source_url`，便于后续审查与替换。

本批使用的来源包括：

- [GeoNames Argentina](https://www.geonames.org/3865483/argentine-republic.html)、[GeoNames Brazil](https://www.geonames.org/3469034/federative-republic-of-brazil.html)、[GeoNames Mexico 检索](https://www.geonames.org/advanced-search.html?q=M%C3%A9xico)、[GeoNames Colombia 检索](https://www.geonames.org/advanced-search.html?q=colombia)。
- [GeoNames Rio de Janeiro 检索](https://www.geonames.org/search.html?country=BR)、[GeoNames Arequipa](https://www.geonames.org/3947322/arequipa.html)、[GeoNames Santiago 检索](https://www.geonames.org/search.html?q=Santiago)。
- [恰帕斯州政府位置说明](https://www.chiapas.gob.mx/ubicacion/)、[墨西哥国家人类学与历史研究所：科马拉](https://lugares.inah.gob.mx/en/node/4838)。
- [GeoNames Aracataca 检索](https://www.geonames.org/search.html?country=CO&startRow=100)、[Aracataca 公开地图索引](https://mapcarta.com/Aracataca)、[Parral 公开地理索引](https://geonames.en-academic.com/76511/Parral)。

## 7. N2 使用建议与遗留项

N2 地图原型优先使用有清晰关系与可解释坐标的节点：里约热内卢、恰帕斯、科米坦、伊斯特佩克、圣加布里埃尔、阿卡塔卡、利马、阿雷基帕、圣地亚哥、马德里，以及无坐标但可作为文学空间卡片的科马拉、马孔多。帕拉尔在补充官方来源前不进入默认地图。国家节点可作为作者地理的缩放层。

以下项不阻塞 S1-002，但必须在后续任务处理：

- S2-001：把 `place_kind`、`reality_status`、`map_status`、`map_relation_role`、父级关系和来源字段纳入正式 Curation Schema。
- S2-002：生成带可消费状态的 Web Data，明确隐藏节点和虚构空间的前端呈现规则。
- S3-001 / S3-002：从本层挑选 N2 样本并生成最小策展卡片；不得把本批地理分类直接当成完整策展文案。
- S4：地图组件必须支持无坐标文学空间卡片、来源展示、隐藏状态和移动端降级。
- 发布前：补充 Parral 官方来源后，才可将其重新纳入公开地图；并对所有显示节点做一次最终来源复核。

## 8. 结论

V1 地点关系已完成 V2 地图补充层的最小可用转换：关系可追溯、坐标来源可回查、虚构空间不伪造现实坐标、无充分证据的地点默认隐藏。`V2-S1-002 = ✅ DONE`，解锁 `V2-S2-001`。
