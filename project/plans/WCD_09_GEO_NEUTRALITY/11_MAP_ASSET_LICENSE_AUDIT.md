# 11_MAP_ASSET_LICENSE_AUDIT — 地图资产许可审计

核心问题（任务卡 §26）：**是否允许把处理后的 GeoJSON 放进公开 GitHub 仓库并通过 GitHub Pages 分发？** 每个候选数据源按 10 维记录；凡不明确者标 `LICENSE_UNCLEAR`，不得进入首选方案。

## 1. 当前资产（现状）

| 资产 | 声称来源 | 实测鉴定 | 许可 | 署名现状 | 缺口 |
|---|---|---|---|---|---|
| `site/assets/latin-america-countries.geojson` (SHA-256 478f3ebc…) | 内部命名 natural_earth_110m | NE 110m 家族（顶点数逐 feature 一致；±1e-5 量化往返痕迹）；上游 release 与处理步骤不可从仓库锚定 | NE 本体为 Public Domain（官网 terms 页 2026-09-07 复核：原文 "public domain"，**未用 "CC0"**） | **`docs/LICENSES.md` 已登记**（来源 Natural Earth Admin 0 Countries 1:110m、PD、不重新授权、上游链接）；About 页有一句读者署名 | 残留 `PROVENANCE_GAP`：缺上游 release 版本号、获取日期、处理步骤（量化往返无记录）——不违反 NE 许可（PD 无强制署名），但未满足 TASK-099「记录版本/日期」门禁的完备性 |

**结论**：现状在许可上**基本合规且有部分登记**（LICENSES.md 条目 + About 署名），残留缺口是可追溯性三要素（版本/日期/处理链）与底图内容选择缺口（法属圭亚那等，属几何完整性而非许可）。修复方式是**版本化重取 + 登记链补全**（见 12/14）。

## 2. 候选数据源逐项

### 2.1 Natural Earth（首选，MAP-B）
- copyright：无（Public Domain，NACIS 维护；官网 terms-of-use 页明示）；license：**public domain（terms 页原文用 "public domain"，未用 "CC0" 一词）**——不作 CC0 表述（在线复核 2026-09-07）；
- commercial use：允许；modification：允许；redistribution：允许（无强制署名，惯例署名 "Natural Earth"）；
- share-alike：无；审阅页面将各站点版本呈为 public domain，未在该页面识别到单独的 database-right restriction；其他法域的 database-rights 适用性未作独立分析，不从 Public Domain 页面推断；
- download restrictions：无（naciscdn.org 公开 CDN；本会话实测 110m/50m/10m 全部可下载）；
- **GitHub Pages 分发：允许 ✓**（含处理后派生文件）；
- 使用条件：建议（非义务）保留署名 + 版本 + 日期 —— 与治理门禁一致。

### 2.2 UN Geospatial / UN Cartographic Section（MAP-A 参考）
- 官方权威，但公开再分发条款**本会话未能核验**（un.org geospatial 页 403）→ `LICENSE_UNCLEAR`；
- 角色：争议描绘惯例/线型参考（D-2/D-4），**不作为底图数据供给**，直至条款核验通过。

### 2.3 geoBoundaries（MAP-B 备选）
- 许可：产品级多为 CC BY 4.0（须逐文件在下载页复核）；
- commercial/modification/redistribution：CC BY 4.0 下允许（署名+许可链接）；
- GitHub Pages：允许 ✓；风险：逐文件许可可能不同（有 CC BY-NC 历史变体）→ 下载时逐文件复核，`LICENSE_UNCLEAR` 的文件不得采用。

### 2.4 GADM（MAP-B）——**排除**
- 学术/非商业免费；**商业使用需另行许可**；站点托管于公开 GitHub Pages 且项目可能涉及商业场景 → 许可条件不匹配，**不采用**。

### 2.5 OpenStreetMap（MAP-C 边界用途）
- ODbL 1.0：署名 + **share-alike**——把 OSM 派生边界打包进站点 bundle **可能触发**衍生数据库义务；是否构成及开放范围需作个案（case-specific） ODbL 评估；
- 边界主题无中立性政策 → **边界用途不采用**；城市点坐标交叉核对可作为次要渠道，但点提取的 ODbL 归类及是否触发义务同样需作个案（case-specific）评估，不能预断；仍建议避免混入 bundle。

### 2.6 Overture（MAP-C）
- CDLA-Permissive 2.0（宽松、可再分发）；数据含 OSM 血统；当前用途不匹配（体量大、divisions 尚不成熟）→ 不采用，留观。

### 2.7 中国大陆官方渠道（MAP-A，E-1 专用维度）
- **自然资源部标准地图服务**：官方页面允许标准地图免费下载、不编辑使用时标注审图号；改绘（裁切、拼接、放大缩小）按说明应送审。**关于「把标准地图图面原样放入 GitHub 仓库再分发」是否被明确禁止，本审计未找到足以支撑 `NOT-REDISTRIBUTABLE` 结论的许可证文本或权利人回复 → 标 `LICENSE_UNCLEAR`（M-09），不作为数据供给**；网站页脚的禁止复制/镜像 ≠ 具体下载图面的许可条款。
- **地图管理条例（2015）/测绘法**：面向中国大陆公众的互联网地图出版/传播，涉及「是否送审」「是否构成互联网地图服务并需相应资质」「标准地图使用方式」三问。**审计未能据此判定本站「资质必需」或「全球版不受影响」——这三问的事实收集（发布主体、部署、功能、受众）与中国法适用性评估须由中国法专业人员完成，未评估前标 `CANNOT_VERIFY`（M-08）**。
- **E-1 条文定位记录（元典法律检索，检索日 2026-09-07）**：当前有效文本的《地图管理条例》第二条界定在中国境内从事相关活动的范围；第三十三条涉及公开地理信息、用户上传/标注、地图数据库开发及互联网地图出版审核/资质事项；第三十八条涉及审核通过地图的使用；《测绘法》第三十八条涉及地图展示、出版、更新；《地图审核管理规定》第十条列申请材料及例外。该记录只证明条文范围和义务类型，不判断本站是否落入这些类别；发布主体、部署、功能和受众事实仍待专业人员评估，保持 `CANNOT_VERIFY`。
- 结论：**当前不复制任何中国标准地图资产进仓库**，是稳妥的条件性选择（不改变）；**E-1 不作为「已判定不需要资质」或「已判定禁止」的确定结论**，只登记三问待专业人员评估（见 15）。

### 2.8 文学地点坐标（GeoNames）
- CC BY 4.0：允许再分发（署名）；站点 bundle 中只携带坐标数值+溯源 URL，不复制 GeoNames 数据库内容 → 合规成本低；建议在数据来源文档登记 "GeoNames CC BY 4.0" 一次即可。

## 3. 汇总表

| 源 | 许可 | 再分发到 GitHub Pages | 署名义务 | 汇总值 |
|---|---|---|---|---|
| Natural Earth | Public Domain | ✓ | 建议（版本+日期，纳入署名政策） | SAFE |
| UN Geospatial/Cartographic | 未能核验 | ? | ? | LICENSE_UNCLEAR（仅参考用途） |
| geoBoundaries | CC BY 4.0（逐文件复核） | ✓ | 必须 | SAFE（逐文件确认后） |
| GADM | 非商业 | ✗（条件不符） | 必须 | UNSAFE-FOR-THIS-USE |
| OSM（边界） | ODbL share-alike | 有负担 | 必须 | CONDITIONAL-UNATTRACTIVE |
| Overture | CDLA-Permissive 2.0 | ✓ | 必须 | SAFE（但当前不适用） |
| MNR 标准地图 | 官方允许下载/查看 + 改绘送审；仓库原样再分发条款未获明确文本（M-09） | `LICENSE_UNCLEAR`（不作供给） | 审图号要求待 E-1 评估 | `LICENSE_UNCLEAR`（E-1 参考专用，非数据供给；未知不等于禁止） |
| GeoNames 坐标 | CC BY 4.0 | ✓（数值+溯源） | 登记 | SAFE |

## 4. 署名政策建议（并入 12）

地图页/About 页固定署名行：`底图几何：Natural Earth（公有领域），版本 x.y.z，获取日期 YYYY-MM-DD；地点坐标：GeoNames（CC BY 4.0）`。若采用 geoBoundaries 任何文件，逐文件追加其署名。版本与获取日期写入构建脚本常量并随 CHANGELOG 记录。
