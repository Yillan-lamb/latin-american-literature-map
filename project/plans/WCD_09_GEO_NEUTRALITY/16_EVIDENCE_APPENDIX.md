# 16_EVIDENCE_APPENDIX — 核验证据附录（V2 整改）

> 本附录区分仓库内事实、外部一手事实和无法复核项。外部事实只有在包内留下精确 primary URL/文书、标题、检索日期，并记录本轮实时打开证据或可复核快照/hash 时才可标为 `VERIFIED_PRIMARY`; 否则标 `CANNOT_VERIFY`。本轮不把旧报告中的“浏览器实取”描述当作当前可复核证据。

## 1. 仓库内机械证据

| 证据 | 位置/方法 | 结果 |
|---|---|---|
| 底图 SHA-256/字节数/feature/顶点数 | `site/assets/latin-america-countries.geojson`，SHA-256 `478f3ebc2d30ae8669a8caea05dad6a82b507f8e629443c6c3b643e369c00511` | 37,938 B；28 features；1,509 vertices；以当前仓库读取为准 |
| 当前投影 | `site/app.js` 的 `project()` 公式 | `x=(lon+118)/86*880`；`y=(33-lat)/89*560`；旧映射各向异性 |
| 七点投影指标 | `generate_projection_evidence.py`；`07_PROJECTION_SAMPLE_METRICS.csv` | 8 个数值候选 × 7 点；固定 0.25° 中央差分，`J=[P_lambda/cos(phi),P_phi]`；同时记录方向代理 `ew_ns_scale_ratio`、完整 `principal_axis_ratio`、原始 `area_factor` 与相对中心列 |
| LAEA/AEQD 关键抽样 | `07_PROJECTION_SAMPLE_METRICS.csv` | LAEA Tijuana `0.957492 / 1.327088 / 0.999998`；AEQD Tijuana `0.971319 / 1.205492 / 1.205491`（依次为方向代理/完整主轴比/面积因子） |
| 投影候选图 | `figures/` 8 张 PNG | 同一 geometry、同一窗口、统一等比 fit；研究比较图，不是成品 UI |
| 出画点 | 旧公式按 09 的经纬度重算 | 马德里 `(1169.6,-46.7)`、巴黎 `(1231.5,-99.8)`；二者超出 880×560 |
| 08 覆盖表 | `08_COUNTRY_TERRITORY_COVERAGE_AUDIT.csv` | 54 rows；`l1_status`/`l1_gate` 与 `l2_status`/`l2_gate` 分列；C-8 未决时无已授权 L1 TRUE |
| 05 风险表 | `05_GEOGRAPHIC_NEUTRALITY_RISK_REGISTER.csv` | 20 rows；17 columns；case_id 唯一；关键枚举和 Gate ID 由包内校验脚本检查 |

## 2. B-04 20 案逐案证据矩阵

`repository_evidence` 只证明包/仓库里的当前表示，不证明外部主权、条约或程序事实。所有没有包内快照/hash 的外部事实均保留 `CANNOT_VERIFY`，不得写成一手核验完成。

| case_id | fact_scope | repository_evidence | primary_url_or_document | source_title | retrieval_date | evidence_status | capture_or_hash | limitation |
|---|---|---|---|---|---|---|---|---|
| RISK-01 | 福克兰几何/英文 tooltip；英阿主权与 UN 命名 | `02` feature 5；`10` NAME-06 | `https://www.un.org/dppa/decolonization/en/content/falkland-islands-malvinas` | UN Decolonization: Falkland Islands (Malvinas) | 2026-09-07 attempted | CANNOT_VERIFY | NOT_RETAINED | 当前包没有 HTML/PDF/截图/hash；中文名次序不可据此确定 |
| RISK-02 | 埃塞奎博 de facto 线；ICJ Case 171 程序状态 | `02` features 19–21；`05` RISK-02 | `https://www.icj-cij.org/case/171` | Arbitral Award of 3 October 1899 (Guyana v. Venezuela) | 2026-09-07 attempted | CANNOT_VERIFY | NOT_RETAINED | 2026 听证/判决状态未留下可复核文书或快照 |
| RISK-03 | 伯利兹-危地马拉边界/ICJ Case 177 状态 | `02` features 17–18；`05` RISK-03 | `https://www.icj-cij.org/case/177` | Guatemala's Territorial, Insular and Maritime Claim (Guatemala/Belize) | 2026-09-07 attempted | CANNOT_VERIFY | NOT_RETAINED | 2022 Order 等外部细节未留文书快照 |
| RISK-04 | 法属圭亚那在当前资产中为空洞；法国行政分类 | `01` §1.2；`02` 无 France feature | `https://www.insee.fr/fr/metadonnees/definition/c2316`；`https://www.outre-mer.gouv.fr/territoires/guyane` | INSEE: Départements, régions et collectivités d’outre-mer；法国海外部：Guyane | 2026-09-07 | VERIFIED_PRIMARY | PRIMARY_URLS_OPENED_2026-09-07 | 两个 primary record 仅核验 Article 73 DROM / Guyane collectivité territoriale unique 行政分类；不裁决边界、主权、C-8 范围或 C-3 实施授权 |
| RISK-05 | 波多黎各背景 feature；地位描述 | `02` feature 23；`05` RISK-05 | NOT_RETAINED | Puerto Rico status | 2026-09-07 | CANNOT_VERIFY | NOT_APPLICABLE | 不从 ISO/feature 推出主权或 status 文案 |
| RISK-06 | 荷属加勒比 50m 候选 parts | `01` §1.2；`08` ABW/CUW/BES rows | NOT_RETAINED | Kingdom of the Netherlands territorial status | 2026-09-07 | CANNOT_VERIFY | NOT_APPLICABLE | 50m part 与行政地位未在包内保存 primary snapshot |
| RISK-07 | 法属加勒比候选 parts/文学相关性 | `08` GLP/MTQ rows；`05` RISK-07 | NOT_RETAINED | French Caribbean administrative/literary status | 2026-09-07 | CANNOT_VERIFY | NOT_APPLICABLE | 不以文学相关性自动授权 L1/L2 |
| RISK-08 | 未把南极 claim sectors 合并进 AR/CL | `02` feature set；`05` RISK-08 | NOT_RETAINED | Antarctic Treaty/claim status | 2026-09-07 | CANNOT_VERIFY | NOT_APPLICABLE | 仓库几何行为可复核；外部条约事实未留文书 |
| RISK-09 | 无 maritime layer | `01` §4；`02` land-only features | NOT_RETAINED | ICJ Bolivia–Chile maritime access outcome | 2026-09-07 | CANNOT_VERIFY | NOT_APPLICABLE | 不以当前无海域图层证明法律结果 |
| RISK-10 | 无 Colombia–Nicaragua maritime lines | `01` §4；`02` land-only features | NOT_RETAINED | ICJ Colombia–Nicaragua judgments | 2026-09-07 | CANNOT_VERIFY | NOT_APPLICABLE | 外部判决/管辖事实未留 primary capture |
| RISK-11 | USA viewport/background mismatch | `01` §1.2/§4；当前 GeoJSON feature list | `REPOSITORY_ONLY` | Current asset viewport comparison | 2026-09-07 | REPOSITORY_VERIFIED | `478f3e…00511` | 不推断 C-4 的最终范围政策 |
| RISK-12 | South Georgia keep-out candidate | `02` feature list；`08` SGS row | NOT_RETAINED | South Georgia territorial status | 2026-09-07 | CANNOT_VERIFY | NOT_APPLICABLE | 当前不渲染是仓库事实；外部地位仍未核验 |
| RISK-13 | Guantanamo Bay 未单独表示 | `01` §4；`02` feature scale | NOT_RETAINED | Lease/status history | 2026-09-07 | CANNOT_VERIFY | NOT_APPLICABLE | 未保存租借/争议 primary record |
| RISK-14 | Navassa 50m keep-out candidate | `08` USR row；`05` RISK-14 | NOT_RETAINED | Navassa Island claim history | 2026-09-07 | CANNOT_VERIFY | NOT_APPLICABLE | 10m 未来触发项不提前作事实结论 |
| RISK-15 | New River Triangle de facto line | `02` Guyana/Suriname features；`05` RISK-15 | NOT_RETAINED | Guyana–Suriname claim/administration status | 2026-09-07 | CANNOT_VERIFY | NOT_APPLICABLE | 无 primary boundary document/hash |
| RISK-16 | Caribbean seven-state completeness candidate | `08` ATG/DMA/GRD/LCA/VCT/BRB/KNA rows | NOT_RETAINED | UN membership/50m feature source | 2026-09-07 | CANNOT_VERIFY | NOT_APPLICABLE | 成员集合与 50m 几何未在本包留一手快照 |
| RISK-17 | Mexico–US / Mexico–Belize–Guatemala reference lines | `02` current land features | NOT_RETAINED | Treaty/settlement status | 2026-09-07 | CANNOT_VERIFY | NOT_APPLICABLE | 仅凭线形不证明边界法律已定 |
| RISK-18 | SVG aria/title wording | `01` §3/§4；源码审计记录 | `REPOSITORY_ONLY` | Current map description text | 2026-09-07 | REPOSITORY_VERIFIED | `01` source reading | 仅证明仓库文案，不证明未来 C-8 范围 |
| RISK-19 | Sapodilla Cayes geometry visibility；ICJ Case 185 程序 | `05` RISK-19；`08` candidate rows | `https://www.icj-cij.org/case/185` | Sovereignty over the Sapodilla Cayes (Belize v. Honduras: Guatemala intervening) | 2026-09-07 attempted | CANNOT_VERIFY | NOT_RETAINED | 2026-03-19 介入程序等细节没有 retained judgment/page snapshot；50m 可见性必须另做 geometry QA |
| RISK-20 | Southern Patagonian Ice Field / Campo de Hielo Sur；Fitz Roy–Cerro Daudet demarcation work | `02` adjacent ARG/CHL features；`05` RISK-20 | `https://cancilleria.gob.ar/es/actualidad/noticias/inventario-nacional-de-glaciares-en-la-zona-de-hielos-continentales`；`https://www.minrel.gob.cl/sala-de-prensa/comunicado-por-inventario-nacional-de-glaciares-de-argentina` | Argentina MFA: Inventario Nacional de Glaciares en la zona de Hielos Continentales；Chile MFA: Comunicado por Inventario Nacional de Glaciares de Argentina | 2026-09-07 | VERIFIED_PRIMARY | PRIMARY_URLS_OPENED_2026-09-07 | Official sources support pending bilateral demarcation/cartographic work for the Fitz Roy–Cerro Daudet segment; they do not constitute a sovereignty adjudication. Retain the base line without claiming final demarcation; CH-17、CH-24 still require neutral rendering and geometry QA. |

**B-04 状态**：逐案矩阵覆盖 20/20；状态计数为 `CANNOT_VERIFY` 16、`VERIFIED_PRIMARY` 2（RISK-04、RISK-20）、`REPOSITORY_VERIFIED` 2（RISK-11、RISK-18）。这关闭“缺少逐案矩阵/误称全部一手核验”的结构问题，但不把 16 个无法包内复核的外部事实升级为已核验。

## 3. 来源与许可复核记录

| 目标 | URL/渠道 | 结果 |
|---|---|---|
| Natural Earth terms | `https://www.naturalearthdata.com/about/terms-of-use/` | 记录为 public domain；页面未使用 CC0，不能改写为 CC0 |
| Natural Earth downloads | `https://naciscdn.org/naturalearth/` | 下载渠道记录在 04；上游 release/处理链仍由 A-3 负责 |
| UNSD M49 | `https://unstats.un.org/unsd/methodology/m49/` | 仅证明统计分组存在，不替代 C-8 范围裁决 |
| UN Geospatial | `https://www.un.org/en/geospatial/` | 当前访问限制；许可为 `LICENSE_UNCLEAR`，不作为数据供给 |
| MNR 标准地图 | `http://bsm.mnr.gov.cn/` | 当前不可达；再分发为 `LICENSE_UNCLEAR`，未知不等于禁止；E-1 待专业评估 |
| 法属圭亚那行政分类（INSEE） | `https://www.insee.fr/fr/metadonnees/definition/c2316`；标题 `Départements, régions et collectivités d’outre-mer`；检索日 2026-09-07 | 页面列举法国宪法第 73 条 DROM（含 Guyane、Guadeloupe、Martinique）；本包本轮仅将 Guyane 行政分类用于 RISK-04 的 `VERIFIED_PRIMARY`，不自动升级其他属地；不裁决边界、主权、范围或 C-3 授权 |
| 法属圭亚那行政组织（法国海外部） | `https://www.outre-mer.gouv.fr/territoires/guyane`；标题 `Guyane`；检索日 2026-09-07 | 记录 Guyane 为 `collectivité territoriale unique`、行使 department/region 职权；仅证明行政组织，不裁决边界、主权、范围或 C-3 授权；`VERIFIED_PRIMARY` |
| E-1 中国地图法条文 | 元典法律检索（检索日 2026-09-07）；《地图管理条例》第二条、第三十三条、第三十八条；《测绘法》第三十八条；《地图审核管理规定》第十条 | 记录条文范围/义务类型，不据此判断本站是否属于公开地理信息、互联网地图服务或需资质/审核；发布主体、部署、功能、受众事实不足，保持 `CANNOT_VERIFY` |
| GeoNames RDF | `https://sws.geonames.org/{id}/about.rdf` | 10 个可定位弱引用与 6 个永久源须按 A-2、CH-13 分支分别保存逐条可复核证据；恰帕斯 `V1-ENT-0052` 保持 `BLOCKED/CANNOT_VERIFY`，不得转换 |

## 4. Option-level Gate/CH 证据交叉表

15 的 option-level「CH 影响」不是另一个授权层，而是所选分支会实施、复核或明确阻塞的直接工作项；每个列出的 CH 均须在同 Gate 的 Ledger 集合和 14 依赖栏中出现。Ledger-only 项仅可作为跨选项共享验收或安全阻塞项，且 14 工作项必须直接等待该 Gate；纯传递性前置不得进入 Ledger。

| 选项分支 | 直接 CH 影响 | 证据/边界 |
|---|---|---|
| A-1-OPT-2 geoBoundaries | CH-01; CH-02; CH-03; CH-05; CH-21 | 04 的逐文件来源/许可核对与 11 §4 署名要求；选择该来源才触发 CH-21 的逐文件署名，不把该影响扩散到其他 A-1 选项 |
| C-3-OPT-1 France polygon | CH-02; CH-22 | 08/10 的 France polygon 归属字段和 11 §2.3 的逐文件许可复核；几何未选定前不补入 |
| C-3-OPT-2 保留几何缺口 | CH-02 | 仅记录 France 几何缺口；CH-05 是底图重建总工作，不因记录缺口而等待 C-3 |
| C-4-OPT-1 keep-out | CH-04 | 只执行范围中性说明和 bbox 记录，不引入资产，因此不虚挂许可或新增几何 QA |
| C-4-OPT-2 背景几何 | CH-04; CH-22; CH-24 | 新背景资产需要逐文件许可复核，并需要几何/可见性 QA |
| C-7-OPT-1 keep-out | CH-04 | 只保持候选 keep-out 和分辨率记录，不引入资产，因此不触发 `CH-22; CH-24` |
| C-7-OPT-2 新背景几何 | CH-04; CH-22; CH-24 | 新几何触发逐文件许可复核及几何/可见性 QA |
| D-1 双名形态 | CH-16 | 名称来源证据由 CH-16 吸收；D-1 不另行触发 CH-21 的一般署名工作 |
| E-1 任一发布评估分支 | CH-19 | 只记录中国大陆发布场景的专业评估前置；不引入地图资产，不触发许可复核 |

以上分支仍为 `PENDING_USER`；表中 `CH` 影响不构成实施授权，证据不足时按对应安全延后/阻塞路径处理。

## 5. 复算指引

1. 用 `python3 generate_aeqd_evidence.py`（兼容入口，实际调用 `generate_projection_evidence.py`）重建 8 个候选 × 7 点 CSV 与 8 张 PNG；脚本只写本包 evidence 输出。
2. 用 `csv.reader` 检查 02/04/05/07/08/09/10 逐行宽度、首列 ID 非空唯一；用 `validate_wcd09_package.py` 检查关键枚举、Gate 语义、交叉引用和 CH 对应。
3. 旧投影像素按 `x=(lon+118)/86*880; y=(33-lat)/89*560` 重算；新投影必须以 B-1 所选候选的 `ew_ns_scale_ratio`、`principal_axis_ratio`、`area_factor` 和相对中心列为准，不能把画布等比当成面积证明。
4. 外部来源复验时须把 URL、标题、检索日期、文书/HTML/截图和 hash 一并保存；否则仍标 `CANNOT_VERIFY`。

## 6. 限制

- 上游 NE release/处理链未锚定，保留 `PROVENANCE_GAP`，不得因当前 CDN 版本推断历史版本。
- 2026 ICJ 动态事实没有 retained primary snapshot，RISK-02、RISK-03、RISK-19 的动态状态均为 `CANNOT_VERIFY`。
- Gate 决议仍由 USER 控制；本包的条件式 L1/L2/Gate 状态不构成实施授权。
