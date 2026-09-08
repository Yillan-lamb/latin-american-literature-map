# 01_CURRENT_MAP_INVENTORY — 当前地图实现源码级审计（main @ 0c361fe）

> 全部结论来自对 `0c361fe` 工作树源码的逐行读取与机械计算（脚本与数字见 00_PREFLIGHT、02、06）。本文不使用网页截图判断。

## 1. Basemap（底图资产）

| 项 | 值 |
|---|---|
| file | `site/assets/latin-america-countries.geojson` |
| file SHA-256 | `478f3ebc2d30ae8669a8caea05dad6a82b507f8e629443c6c3b643e369c00511`（37,938 字节） |
| dataset claimed | FeatureCollection name = `latin_america_countries_natural_earth_110m`（仅内部命名） |
| dataset version | **无法从仓库证明** → `PROVENANCE_GAP` |
| resolution | Natural Earth 110m 家族（几何鉴定证实，见下） |
| feature count | 28（21 个拉美/加勒比地理桶主权国家〔含巴哈马〕 + 5 个非拉丁语主权国家〔伯利兹、圭亚那、苏里南、牙买加、特立尼达和多巴哥〕 + 2 个属地；完整清单见 02） |
| vertices | 1,509 |
| properties | 仅 `ADMIN` / `ISO_A2` / `ADM0_A3` 三字段 |
| license | 数据本体若确为 Natural Earth 则为 Public Domain（NE 官网 terms 页确认）；**`docs/LICENSES.md` 已登记**该文件「来源为 Natural Earth Admin 0 Countries 1:110m，Public Domain，本项目不重新授权」（第 44 行区段）；`site/app.js` renderAbout() 亦有一句面向读者的「地图边界来自公共领域的 Natural Earth 数据」 |
| upstream provenance | 已有：来源数据集+比例尺+PD 状态+上游链接（LICENSES.md）。**仍缺：上游 release 版本号、获取日期、处理步骤**（git 唯一来源为 Web 0.1.0 基线提交 `9e755e8`（2026-08-17），commit message 无数据说明；文件坐标存在 1e5 量化往返痕迹，处理步骤无记录）→ 残留 `PROVENANCE_GAP`（版本/日期/处理链三项，见下"鉴定"） |

### 1.1 版本鉴定（本包实测，非猜测）

与 Natural Earth 官方 CDN（naciscdn.org，当前分发版本 **5.1.1**，VERSION.txt 读取）`ne_110m_admin_0_countries` 逐点比对：

- 28/28 feature 全部找到对应 ADMIN，**顶点数逐一完全一致**（如 Argentina 121=121、Brazil 203=203、Mexico 170=170）；
- 22/28 feature 的坐标存在 ≤1e-5 的系统性微漂移（如 `(-65.11804,-41.06432)` vs NE `(-65.11804,-41.06431)`），6/28 逐点完全一致；
- 与 50m/10m 顶点数不符（非其来源）。

**结论**：当前文件 = Natural Earth 110m admin_0_countries 原始几何（未做进一步抽稀）经一次 **TopoJSON 风格 1e5 量化往返**（delta 编码→回写 GeoJSON，产生 ±1e-5 漂移）。上游具体 release 无法仅凭仓库锚定（5.1.1 为当前 CDN 版本、与 2026-08-17 引入时间相容），量化处理步骤无记录 → 记 `PROVENANCE_GAP`（残留项：release 版本号 + 获取日期 + 处理步骤），建议在正式底图更新时以「版本化下载 + 记录」一次性消除。

### 1.2 底图内容选择缺口（重点）

NE 110m 在当前 viewport（lon 118°W–32°W / lat 33°N–56°S）内与当前文件对比：NE 侧 31 个 feature 中有 1 个（斐济）为反子午线 bbox 跨 ±180° 的检测假阳性（其陆地实际位于 177°E 以东，不在窗内）；**真实缺口为 2 项**：

1. **France（含法属圭亚那 polygon）**——法属圭亚那的 Article 73 DROM / Guyane 行政组织分类已由 16 的 INSEE 与法国海外部 primary records 标为 `VERIFIED_PRIMARY`；该证据仅证明行政分类，不证明边界、主权或 C-8/C-3 授权。NE 三个尺度按其 source-defined France polygon/part 提供。当前地图上它在南美洲北缘形成一块**无底图空洞**（巴西-苏里南之间）。这是 feature 挑选遗漏，不是数据缺失。
2. **United States of America**——viewport 内可见美国南部（德州南部/佛州/加州角）。当前底图无美国几何 → 美国一侧是"空白海面"。这是范围决策（可接受），但需要作为「背景几何层」明确登记，而不是隐式缺省。

**小安的列斯岛弧整体缺失**（110m 分辨率固有）：安提瓜和巴布达、多米尼克、格林纳达、圣卢西亚、圣文森特和格林纳丁斯、巴巴多斯、圣基茨和尼维斯 7 个**主权国家**及阿鲁巴、库拉索、开曼、特克斯和凯科斯、美/英属维尔京、安圭拉、蒙特塞拉特、辛特马滕、圣马丁等属地全部无几何（50m 全部具备，见 08/分辨率研究）。纯数据层面 110m 也无 Bonaire（属 NL）。

## 2. Projection（投影）

`site/app.js:142-144`：

```javascript
function project([longitude, latitude]) {
  return [((longitude + 118) / 86) * 880, ((33 - latitude) / 89) * 560];
}
```

| 项 | 值 |
|---|---|
| 类型 | **自定义线性映射**（等距圆柱/plate carrée 家族的仿射变体），非任何标准投影参数化 |
| 经度范围 | −118° → −32°（86°）→ x: 0 → 880；x 比例 = 880/86 = **10.2326 px/°** |
| 纬度范围 | 33°N → 56°S（89°）→ y: 0 → 560；y 比例 = 560/89 = **6.2921 px/°** |
| SVG | `viewBox="0 0 880 560"`（app.js:297），容器 CSS `width:100%; height:100%; min-height:590px`，浏览器按 `preserveAspectRatio` 默认 `xMidYMid meet` **等比**缩放（CSS 本身不产生额外变形） |
| 各向异性 | **是**。x/y 比例比 = 10.2326/6.2921 = **1.6265**（等度数映射应为 cos(φ0)；区域中位纬度 11.5°S 处应为 0.98） |
| 等效标准纬线 | 1/1.6265 = 0.6148 → φ0 ≈ **±52.1°**——适合南极附近，对以 11.5°S 为中心的拉美完全不适用 |
| 裁切 | viewport 度窗覆盖全部 28 个 feature（02 逐项 `current_in_viewport=TRUE`），无 feature 被裁；但马德里/巴黎两点投影出画（见 §4/09） |
| 形状失真 | 定量：EW/NS 局部形变系数 **1.66（区域中心）→ 2.77（火地岛）**；即"当前地图有没有被横向拉伸？"——**有，横向拉伸约 1.66–2.77 倍（相对局部真实形状），越往高纬越严重**。完整计算见 06 |
| 面积失真 | 以区域中心为基准，火地岛一带面积相对膨胀 ~1.67×（同位度量见 06） |

**等价表述**（便于实施理解）：当前实现 = 「以 11.5°S 为标准纬线的等距圆柱投影」再整体**横向拉伸 1.66 倍**（或纵向压缩 1.66 倍）。浏览器层的 SVG 缩放是等比的，失真全部来自该公式。

## 3. Interactive Geography（地理层语义区分）

| 层 | 实现 | 说明 |
|---|---|---|
| 背景几何 | GeoJSON 中 `ISO_A2` 未匹配到 web data 国家的 feature：绘制 `.country-shape`（米色 #f7f2e8），`aria-hidden="true"`、title 原文 ADMIN，不可交互 | 现有 15 个：HT DO BS FK MX 以外的非数据国家等（见 02 逐项） |
| 可交互国家 | `ISO_A2` 匹配 `data.map.places` 中 `place_kind=country && map_status!=hidden && reality_status!=unknown` 的 feature：`.country-shape.available`（橙褐 #d79c71，hover/focus/active 变 --coral），`tabindex=0 role=button` | 当前 13 国：AR MX CO CU CL PE BR GT UY PY NI EC VE。**注意 BR 双实体**（V2-GEO-BR 与 V1-ENT-0183 均 featured；app.js 的 Map 构造使后者覆盖前者，且里约 parent 指向前者 → 选中巴西时里约不显示，见 09/14） |
| 现实文学地点 | `.map-point`（绿点 r=6 + 中文标签），坐标经 `project()` 投影；`visibleRealMapPlaces()` 按 `map_relation_role`（author_geography/story_setting）与 mapFilter 过滤 | 17 个带坐标点中 15 个在画布内；马德里/巴黎出画但仍可聚焦（§4） |
| 虚构空间 | 独立 HTML inset「写出来的地方」，**不使用现实坐标**（构建器强制校验 fictional↔coordinates 互斥）；按钮样式与地图点明确区分 | 马孔多、科马拉 featured；圣玛丽亚/阿什格罗夫 hidden |
| 国家中文标签 | `automaticCountryLabelPoint`（投影后最大外环质心）+ 7 国硬编码像素 override（app.js:20-28 `COUNTRY_LABEL_OVERRIDES`：GT NI CU VE EC CL UY） | override 为**当前投影专属像素值**，换投影即失效（14 号文件列入变更） |
| 标签防碰撞 | CSS 对 8 个地点隐藏文字标签（styles.css `.map-point[data-place-id=…] text{display:none}`） | 圆点仍钉在真实投影位置（符合 DEC-055「偏移不得冒充坐标」），但规则为硬编码 place_id 清单 |

## 4. 本轮新发现的问题（源码级，证据充分）

1. **P0-候选 · 投影各向异性失真**（§2）：横向拉伸 1.66–2.77×，违反 TASK-099 比例门禁「保持权威参考的地理轮廓…宽高比例；不得非等比拉伸」。
2. **P0-候选 · 法属圭亚那空洞**：底图 feature 挑选遗漏 France(FR) → 南美北缘出现无底图区域；违反「选定范围内国家/地区原则上全部保留在底图中」。
3. **P1 · 巴西国家实体重复**：`V2-GEO-BR` 与 `V1-ENT-0183` 同 cc=BR 同 featured；交互匹配 ISO_A2→后者、里约 parent→前者，选中巴西后里约从地图消失（`visibleRealMapPlaces` parent 过滤）且国家页 children 为空。
4. **P1 · 出画地点不可见但可聚焦**：马德里 (x=1169.6, y=−46.7)、巴黎 (1231.5, −99.8) 投影在 viewBox 外，SVG 裁剪使其不可见，但 `tabindex=0 role=button` 保留 → 键盘用户会 Tab 到"看不见的按钮"（WCAG 2.4.7 焦点可见性风险）。
5. **P1 · 图例未解释无内容国家**：图例仅 3 项（可探索国家/现实地点/文学虚构空间）；米色背景国家（15 个 feature，含海地、牙买加等 13 个无数据国家 + 波多黎各/福克兰属地）无「当前暂无收录作家或作品」说明——TASK-099 明确要求该图例。
6. **P1 · 标签 override 与投影耦合**：7 国像素级 override + 8 个地点 CSS 藏标签清单均为当前投影/布局专属常量，投影或尺寸变化即漂移。
7. **P2 · 坐标溯源弱引用**：17 个带坐标地点中，10 个可定位弱引用（搜索页/高级搜索页或帕拉尔镜像）可在 A-2 通过后换为永久 GeoNames ID；V1-ENT-0052 恰帕斯为第 11 个弱引用，但当前 `BLOCKED_CANNOT_VERIFY`，在找到并核验正确永久实体前不得转换或 promote。另有 6 个已引用永久 ID 的地点仅需 URL 规范化，并经本会话重取 RDF **逐一精确复核一致**（Δ=0~4m）。
8. **许可/署名缺口（经核对收窄）**：`docs/LICENSES.md` 已有底图条目（来源+比例尺+PD+不重新授权），About 页有一句读者署名；残留缺口为上游 release 版本号、获取日期、处理步骤三要素（见 11）。

## 5. 与 TASK-099 门禁的对照速览

| 门禁 | 当前状态 |
|---|---|
| 权威底图门禁 | 未满足：`PROVENANCE_GAP` 仅余上游 release 版本号、获取日期、处理步骤三项；来源数据集、比例尺、Public Domain 状态和上游链接已登记 |
| 比例与尺寸门禁 | 未满足：各向异性失真 1.66–2.77× |
| 地点准确性门禁 | 基本满足：坐标有溯源字段、虚构空间无坐标、投影链可复算；弱点为弱引用 URL 与巴西双实体 parent 断裂 |
| 完整国别展示门禁 | 未满足：法属圭亚那空洞 + 小安的列斯 7 主权国无几何 + 无内容国家无图例说明 |
| 交互与视觉边界门禁 | 部分满足：hover 不改边界形状 ✓、状态非仅颜色（形状+光标+aria）基本 ✓、对比度/色盲专项未验证（09E 范围）、出画可聚焦点 ✗ |

## 6. 文档声明核对

`site/app.js` renderAbout()：「地图边界来自公共领域的 Natural Earth 数据」——与实测鉴定一致（NE 110m 家族），但缺版本与日期；「文学虚构空间则始终与现实坐标分开」与实现一致（构建器强制）。无其他地图相关声明。
