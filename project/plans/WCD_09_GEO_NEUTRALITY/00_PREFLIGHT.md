# 00_PREFLIGHT — WCD-09 Authoritative Map Geometry & Geographic Neutrality

任务：WCD-09 外部研究包（External Geographic Research Auditor / Cartographic Evidence Researcher / Geographic Neutrality Reviewer）
执行方：EXT-AI-02（平台 ZCode；运行时模型标识 `builtin:bigmodel-start-plan/GLM-5.3-Flash`，版本 unknown，不猜测）
开始时间：2026-09-06（Asia/Shanghai）
性质：READ-ONLY 审计研究。成果只写入本目录（`work/` 为 .gitignore 覆盖区），不 commit、不 branch、不 push、不改任何 tracked 文件。

---

## 1. CURRENT MAIN BASELINE（以实际 Git 重新读取，不依赖提示词 SHA）

| 项 | 值 | 证据 |
|---|---|---|
| 提示词最近已知基线 | `0c361fe97c240da088d27ac95eb413ff17f3f6cc` | 任务提示词 |
| 实际 origin/main（本地远端跟踪 ref） | `0c361fe97c240da088d27ac95eb413ff17f3f6cc` | `git rev-parse origin/main` |
| 本地 main 检出 | `fea9d8d6bd71eb22febaec27da1de288eb5acce7`（落后 origin/main 3 个提交：`f1ed112`、`5adce3e`、`0c361fe`，即 PR #29「wcd-08-approved-integration」；main 可 fast-forward 至 origin/main） | `git log main..origin/main` |
| 审计读取基线 | `0c361fe`（**detached worktree `/tmp/lalm-wcd09-main`**，不移动用户主检出的 HEAD——吸取 2026-09 同目录多 agent 并发事故教训） | `git worktree add --detach /tmp/lalm-wcd09-main 0c361fe` |
| 网络限制记录 | 会话内 `git fetch origin` 一次失败（github.com:443 连接超时）；`origin/main` ref 为此前 fetch 所得，与提示词基线一致。若远端在 `0c361fe` 后又有新提交，本包无法感知——列为本包限制。github raw 域名本机不可达；naciscdn.org / naturalearthdata.com / geonames / unstats.un.org 可达（外研走 WebFetch/curl 双通道）。 | 本节 |

**与提示词基线的差异结论：无实质差异**——提示词所给 `0c361fe` 即当前远端 main。本地检出落后的 3 个提交仅为 WCD-08 批准集成（趣闻内容接线），地图相关文件以 `0c361fe` 快照为准逐字节读取。

### 版本基线（读自 `0c361fe`）

| 项 | 值 | 证据 |
|---|---|---|
| Research Data | 1.5.0 development candidate | CHANGELOG.md 顶部条目 |
| Research Schema | 0.4 | 同上 |
| Web | 0.4.0 Development | `package.json` version=0.4.0；`data/v2/web/site_data.json` product_version=0.4.0 |
| Web Data Schema | v2-web-0.3 | `site_data.json` schema_version |
| Web Data generated_at | 2026-09-06T12:00:20+08:00 | 同上 |
| public counts | 377 entities / 1027 facts / 334 relationships / 314 sources / 261 cards / 38 places / 93 place_relations | `site_data.json` counts |
| Public Release | **PAUSED BY USER**（WCD-09 为强制前置门禁之一） | CHANGELOG「Gate / release boundary」+ DECISIONS DEC-055 |
| WCD-09 状态（启动时） | TASK-099 `LOCKED / NOT STARTED`；USER 本轮确认解锁本研究包 | `project/internal/TASKS.md`（本地动态区，只读）+ DEC-055 |

## 2. 当前正式地图相关文件定位（全部读自 `0c361fe`）

### 地图构建直接参与

| 文件 | 角色 | 指纹/规模 |
|---|---|---|
| `site/assets/latin-america-countries.geojson` | 唯一底图几何资产；FeatureCollection name=`latin_america_countries_natural_earth_110m` | SHA-256 `478f3ebc2d30ae8669a8caea05dad6a82b507f8e629443c6c3b643e369c00511`，37,938 字节，28 features / 1,509 顶点 |
| `site/app.js` | 投影 `project()`（L142–144）、多边形→SVG path（L146–153）、质心标签点（L155–188）、国家交互匹配 `ISO_A2`（L265–297）、虚构空间 inset（L295–296） | 620 行 |
| `site/styles.css` | 国家填色/描边/图例/焦点样式（L118–169 区段） | 424 行 |
| `site/index.html` | 静态壳 + `#app` 挂载 | 45 行 |
| `data/v2/geo/PLACES_GEO.csv` | 地点层源数据（38 行）：坐标、coordinate_precision、coordinate_source_url、coordinate_retrieved_at、map_status、reality_status | git 跟踪 |
| `data/v2/geo/PLACE_RELATIONS.csv` | 地图关系源数据（93 行）：map_relation_role 三类语义 | git 跟踪 |
| `scripts/build_v2_web_data.py` | 地图段构建器：fictional 无坐标强校验（L189–190）、parent 悬挂校验（L213–216）、坐标成对校验（L184–187） | 1,140 行 |
| `data/v2/web/site_data.json` | 构建产物，前端实际消费（`map.places` / `map.relations`） | git 跟踪 |

### 校验 / 测试 / 文档

| 文件 | 与地图相关的断言 |
|---|---|
| `tests/browser/public-product.spec.cjs` | `.country-shape.available` 数量=投影国家数；中文标签逐国核对；「newly public GeoJSON country receives an automatic Chinese label」回归测试 |
| `scripts/qa_v2_browser.cjs` | 多引擎冒烟：`.country-shape` / `.country-shape.available` 计数 |
| `scripts/validate_v2_web_data.py` | Web Data schema 校验（含 map 段） |
| `docs/web/V2_WEB_DATA_SCHEMA.md` | `map` 段契约：地点节点+文学地点关系；兼容现实点/国家层/无坐标虚构空间 |
| `docs/web/V2_TECHNICAL_FOUNDATION.md` | Web 技术底座说明 |
| `site/app.js` renderAbout() | 唯一的对外声明：「地图边界来自公共领域的 Natural Earth 数据」——**无版本、无日期、无处理记录** |

### 治理入口（只读）

- `project/PROJECT_CHARTER.md`（正式 tracked 治理入口；实施时以当前版本为准）
- `project/plans/V2_网站产品决策与开发总说明书.md`：地图为主入口；「国家→地点」两级；空间类型三分（现实/虚构/国家）；历史事件不设独立空间层；地图是策展选择而非全量投影
- `project/internal/TASKS.md` TASK-099（六道门禁 + 09A–09F 执行包定义）
- `project/internal/DECISIONS.md` **DEC-055**（WCD-09 canonical：权威参考门禁、比例/投影/地点可追溯链门禁、完整国别+视觉中立门禁、09A–09F 顺序、Public Release 前置门禁）；DEC-007 系历史裁决：项目名为「拉丁美洲文学地图」，**不仅限南美洲**

## 3. Git 完整性基线（任务起止对照）

外部研究任务开始时的主检出（HEAD=`fea9d8d`）：

```text
git status --short   →   （空，clean）
```

技术说明（防误读）：仓库历史提交中 `work/external-ai/deliveries/V1-S3-B0*/` 下的 21 个 CSV 在特定 `autocrlf` 配置的新 checkout/worktree 中可能显示为只有行尾变化的 `M`。该历史现象不属于 WCD-09 范围；实施时不得把它混入 WCD-09 changeset。

原始独立审计以 detached worktree @ `0c361fe` 取证；正式实施须再以当前 `origin/main` 做语义定位与漂移检查。

## 4. WCD-09 六道门禁 → 本研究包映射

| 门禁（TASK-099 / DEC-055） | 本研究包对应产出 |
|---|---|
| 权威底图门禁（来源登记：机构/版本/日期/适用范围/许可/限制；对现有 NE 逐项差异审计） | `04_AUTHORITATIVE_MAP_SOURCE_MATRIX.csv`、`01_CURRENT_MAP_INVENTORY.md`、`02_CURRENT_BASEMAP_FEATURES.csv`（28 feature 逐项）、`11_MAP_ASSET_LICENSE_AUDIT.md` |
| 比例与尺寸门禁（投影/坐标范围/宽高比；禁止非等比拉伸裁切） | `06_PROJECTION_AND_GEOMETRY_AUDIT.md`（定量）、`07_PROJECTION_CANDIDATES.csv`、`figures/` |
| 地点准确性门禁（source→coordinate→projected→rendered 可追溯链；标签偏移不冒充坐标） | `09_PLACE_COORDINATE_AUDIT.csv`（含投影后像素坐标与 viewport 判定） |
| 完整国别展示门禁（无内容国家保留+中性色+图例说明） | `08_COUNTRY_TERRITORY_COVERAGE_AUDIT.csv`、`03_SCOPE_AND_COVERAGE_POLICY_RESEARCH.md`（两层模型）、`12_RECOMMENDED_MAP_POLICY.md` |
| 交互与视觉边界门禁（颜色语义、对比度、hover 不形变） | `01_CURRENT_MAP_INVENTORY.md` §Fill、`05_GEOGRAPHIC_NEUTRALITY_RISK_REGISTER.csv`、`12` |
| 地理中立性（争议边界/属地/名称；不做主权裁决） | `05_GEOGRAPHIC_NEUTRALITY_RISK_REGISTER.csv`、`10_GEOGRAPHIC_NAME_AUDIT.csv`、`13_DISCLAIMER_OPTIONS.md`、`15_USER_DECISION_GATES.md` |

## 5. 本包范围与限制声明

1. Research first / Audit first / Evidence first；实现建议一律为 candidate，不构成 USER 批准。
2. 不做主权裁决；争议区只做 `identify / document / compare / classify / recommend display policy`。
3. 外部权威源核验以「可达渠道」为准（本会话 github raw 不可达）；凡未能直接核验的项一律标 `PROVENANCE_GAP` / `CANNOT_VERIFY`，不以常识补齐。
4. 坐标核验容忍度按地点类型分级（city_centroid ≤ ~2km 级、region_centroid 更宽），重点抓 wrong country / wrong hemisphere / large displacement / parent mismatch（详见 09 文件头）。
