# WCD-02 文学空间与关系深化审计

- 任务：`WCD-02 Literary Space & Relationship Deepening`
- 日期：2026-08-27
- 基线：`main@bf6e7970c622f3dd4e36d2f9ea13ef7a52dd5427`
- 结论：`PASS`
- Research 结果：`Data 1.3.0 development candidate`
- Web 结果：`Web 0.3.0 — Development`
- Public Release：`PAUSED BY USER`

## 1. Baseline

本轮从指定的最新 `main` 基线启动，不创建 Batch 18，不扩大作者名单，不进入 WCD-03、WCD-04 或 V3。基线主库 SHA-256 为 `95e72dbf80a6d0f3dc8619979a34ff36582832175a0006bdcf1cf49b06fbb1ec`，包含 367 entities、998 facts、293 relationships、278 sources、255 content cards、31 个 Research place 和 78 条 place relationship。Geo 层有 33 个节点和 78 条地点关系。

61 位作者 / 168 部作品范围的基线盘点显示：58 位作者已有地点关系，但仅 7 位达到 city/region 粒度，51 位仍只有 country 粒度，3 位没有地点关系；9 部作品已有 `SET_IN`，155 部作品没有可直接消费的空间关系。78 条地点关系中 69 条为 author→place，9 条为 work→place；77 条只有一个来源，1 条有两个来源。既有 3 条 `SET_IN` hold 保持不变。

## 2. Audit Findings

主要缺口不是继续增加作者，而是把已存在、已有来源的出生城市和作品发生地从来源文字转成 Schema 0.3 允许的正式关系。城市粒度集中缺失于布宜诺斯艾利斯、蒙得维的亚、哈瓦那等高价值文学节点；作品空间缺口集中于《跳房子》的布宜诺斯艾利斯/巴黎双城结构、《最明净的地区》的墨西哥城和《光明世纪》的古巴。

movement、event、theme 等解释性关系没有达到本轮的证据门槛：现有候选多为单一来源、无直接场景证据或仍在 hold。WCD-02 不以策展文字替代研究事实，也不把作者出生地扩写为长期创作中心。

## 3. Priority Matrix

| 优先级 | 对象 | 判定 | 结果 |
|---|---|---|---|
| P0 | 已有直接来源、页面价值高的城市与作品发生地 | 可在 Schema 0.3 内直接建模 | 完成：4 个城市节点、4 条作品地点关系 |
| P1 | 已有出生地证据但仅有国家关系的作者 | 只登记可核验的出生地点关联 | 完成：9 条 author→city 关系 |
| P2 | movement / event / theme 与解释性空间 | 需至少两条独立来源或更直接证据 | 未升级；保持 review/hold |
| P3 | 其余出生城市、广义生活轨迹与更多作品空间 | 页面价值存在，但证据与批量边界需另案整理 | 进入后续 research backlog |
| DEFER | 既有 3 条 `SET_IN` hold、宽泛背景地、虚构空间现实定位 | 直接证据不足或违反空间边界 | 原样保留，不迁移、不补坐标 |

## 4. Research Changes

变更集位于 `data/changesets/WCD-02/`，经过候选、独立审核与正式迁移三层处理。

- 新增 entities：4（Buenos Aires、Montevideo、Havana、Paris）；
- 新增 facts：0；
- 新增 relationships：13；
- 新增 relationship evidence：14；
- 新增 sources：0，全部复用主库内可回溯来源；
- 新增 holds / gaps：0；
- 作者地点关系：新增 9 条出生城市 `ASSOCIATED_WITH_PLACE`；
- 作品地点关系：新增《跳房子》→布宜诺斯艾利斯、巴黎，《最明净的地区》→墨西哥城，《光明世纪》→古巴，共 4 条 `SET_IN`。

独立 Reviewer 结论为 `PASS`：关系方向、Schema 0.3 词表、实体 ID、去重、来源与证据计数一致；出生地语义没有被扩大为长期创作中心；作品地点均有直接支持；未新增缺证的 movement/theme/event 关系。

## 5. Migration Summary

迁移链只追加、不改写历史：

- `0028_wcd02_core_literary_cities.sql`，SHA-256 `01d71c12e09bf4da78e13a5fa12dbe7db139ec9132cc6baebf4655cd11ee736c`；
- `0029_wcd02_work_place_relations.sql`，SHA-256 `a1ee59d7955c8768bc4e280430776f3365200fd6a61c49c0525d8292c796e0c3`。

迁移后主库为 371 entities、998 facts、306 relationships、278 sources、255 content cards、35 个 Research place；主库 SHA-256 为 `2755bc6dc0526fcd0886449e992de599c39581694cb98fe17965c86fe40cd5c1`。完整 migration replay 覆盖 29 个迁移、19 张表，结果与正式主库一致；SQLite integrity 与 foreign key 检查通过。

## 6. Geo

Geo 层新增 4 个 Research city 节点和 1 个仅用于父级结构的 France technical node，并投影新增 13 条正式地点关系。Buenos Aires、Montevideo、Havana、Paris 使用 GeoNames 可回溯坐标；虚构空间仍为 0 个带现实坐标。

Geo 原始层由 33 增至 38 个节点，地点关系由 78 增至 91；其中 35 个为 Research place、3 个为 technical place，34 个 real、3 个 fictional、1 个 unknown。原始 `map_status` 为 eligible 13 / featured 18 / hidden 7；Web 构建叠加既有 Curation selection 后为 eligible 13 / featured 19 / hidden 6。

## 7. Curation

为四个新城市各新增一条低判断 `literary_place_note` 和一条 map selection，共 8 条记录。它们只转写直接支撑具体文本的正式关系和来源，不包含阅读排序、强文学判断或未经 USER 批准的推荐，因此可进入 `auto_approved`。高判断策展、既有 `user_review` 与 `hold` 状态不变。

PR #16 的针对性 provenance 返修全量审计了 WCD-02 向既有 `PUBLIC_CONTENT` 字段新增的 16 个 `research_refs`。原构建逻辑按 `target_place` 汇总后回填同一地点的全部关系，错误地把“关系存在”当成“关系支持该字段表达”。本次删除 14 个与具体文案无关的引用：里约热内卢 4 个字段中的 `V1-REL-0299`、利马 4 个字段中的 `V1-REL-0296`、圣地亚哥 4 个字段中的 `V1-REL-0298`，以及古巴 `literary_intro` / `spatial_meaning` 中的 `V1-REL-0308`。仅在古巴 `reader_path` / `exploration_route` 保留 `V1-REL-0308`，因为两处文本都直接写到《光明世纪》。

构建器现改用 `PUBLIC_CONTENT_PLACE_PROVENANCE.json` 的字段级显式映射，并由 content-quality validator 与回归测试共同校验。原则是：ref 必须实际支撑对应字段的表达；地点相同不能构成自动追加依据；无法自动判断语义对应关系时保持原有 `research_refs` 不变。该返修不改 Research relationships、迁移 `0028` / `0029`、Geo Data、正文或审核状态。

## 8. Web Impact

Web Data 确定性重建后为 371 entities、998 facts、306 relationships、278 sources、255 content cards、38 places、91 place relations、58 curation entries 和 23 curation selections。Schema 保持 `v2-web-0.2`；产品版本升级为 `Web 0.3.0 — Development`。

浏览器验收发现拉普拉塔河口及古巴的国家/城市标签碰撞；保留 Buenos Aires、Montevideo、Havana 的可聚焦地图点、无障碍名称、详情页和关系入口，仅在总览图隐藏三处城市文字标签，避免与国家名及彼此重叠。

61 位作者范围内，city/region 覆盖从 7 增至 16，country-only 从 51 降至 42；有地点关系作者仍为 58，3 位无地点关系作者未被弱证据强行补齐。完整 Research work→place 关系从 9 增至 13；当前 168 部作品预览范围内 `SET_IN` 从 9 增至 11，另有正式关系服务于该范围外的既有 Research 页面。Curation review package 仍为 61 位作者、168 部作品和 25 个富内容地点；正式 public scope 为 25 位作者、60 部作品、32 个地点和 2 个关联节点；Web 地图为 38 个节点。新增城市通过低判断 Curation、Web 页面与搜索投影进入开发预览，三种计数口径不混用。

## 9. Version

- Research：`Data 1.3.0 development candidate`，新增 append-only 全量导出 `data/exports/v1.3.0-candidate/`；不替代 `Data V1.0.0` 正式 Release。
- Web：`Web 0.3.0 — Development`；关系与地图消费层发生实质扩张，但 Schema 不变。
- Public：仍为 `PAUSED BY USER`；不创建 tag、GitHub Release 或 production deployment。

## 10. Deferred

- 既有 3 条 `SET_IN` hold 保持原状态；其中无来源或缺少直接场景证据者不迁移。
- movement、theme、event 解释性关系没有达到双来源或直接证据门槛，不在本轮升级。
- 更广泛的作者迁居、流亡、创作中心和作品背景地需要独立 Research Change Set，不能从出生地或简介推断。
- WCD-03 中文展示名整合、WCD-04 覆盖再平衡、V3 和 Public Release 均未开始。

## 11. Gate Result

Research 主库、29 个迁移重放 / 19 张表一致性、CSV/JSON/XLSX 全量导出、Geo/Curation/Web Data、content quality、128 路由 public bundle、17 项单元测试、前端语法、84 项 Chromium desktop/mobile + Firefox desktop + WebKit mobile 浏览器矩阵、固定时间确定性重建与任务范围差异检查全部通过。本轮完成后：`WCD-03 Chinese Display Name Consolidation = READY / NOT STARTED`。
