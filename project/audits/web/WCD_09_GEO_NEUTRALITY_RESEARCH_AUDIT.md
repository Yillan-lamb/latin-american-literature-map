# WCD-09 地图治理与地理中立性研究独立审计

- 审计日期：2026-09-08（Asia/Shanghai）
- 原始审计对象：`work/external-ai/V2-WCD-09-GEO-NEUTRALITY-RESEARCH-PACK/`
- 正式晋升对象：`project/plans/WCD_09_GEO_NEUTRALITY/`
- 指定代码基线：`origin/main = 0c361fe`
- 当前仓库状态提示：审计时 `HEAD`/`origin/main` 已为 `d629185c87dbdc7ecb05c780225d6ff73c9a4835`；本报告对指定基线使用 `git show 0c361fe:<path>` 取证，并另行确认当前工作树底图资产与基线逐字节相同。`0c361fe..HEAD` 对 `site/app.js` 的变化是目录/趣闻功能，未改变本次复核的 `project()` 公式；实施前仍应按当前文件重新定位语义位置，不能机械依赖旧行号。
- 审计角色：独立审计方；整改由外部 Luna Max 子任务执行，最终结论及所有复算由本审计方独立作出。
- 审计纪律：审计阶段未修改站点代码、产品数据或治理文件。旧审计稿与整改报告只保留在 ignored 外部交付区，不进入正式任务目录，也不代表当前状态。

## 1. 总裁决

**YES。** 当前研究包可以作为 WCD-09 Integration 的可靠输入。

本结论的严格边界是：研究包已经可靠地定义了证据、候选方案、17 个 USER Gate、CH-01…CH-25 及验收标准；它**不是**对 17 个 `PENDING_USER` Gate 的代选，也不授权在 Gate 未记录前直接实施相应分支。`CANNOT_VERIFY` 项必须继续走包内安全延后/阻塞路径。

最终未关闭问题统计：

| 严重度 | 未关闭数 | 结论 |
|---|---:|---|
| BLOCKER | 0 | 无 |
| MAJOR | 0 | 无 |
| MINOR | 0 | 无 |
| SUSPECTED / CANNOT_VERIFY | 6 类 | 均已显式进入 Gate、阻塞或证据补录流程，不构成研究包可靠性缺陷 |

## 2. BLOCKER（实施前必须修）

**无未关闭 BLOCKER。**

首轮和再审报告所列四项阻塞问题已关闭：CSV 结构与语义、Gate 收口、CH 可验收性/投影数学、逐案证据矩阵均通过当前包校验和本审计方独立抽查。关闭不等于把外部政治或法律事实升级为已核验；相关限制见第 6 节。

## 3. MAJOR（影响一个或多个 CH 项）

**无未关闭 MAJOR。**

### 3.1 CONFIRMED-PROBLEM — CLOSED：投影“shape factor”曾不是完整形状指标

- 位置：整改后见 `06_PROJECTION_AND_GEOMETRY_AUDIT.md:28-41,63-82`、`07_PROJECTION_CANDIDATES.csv:1-9`、`07_PROJECTION_SAMPLE_METRICS.csv:1-57`、`14_GIT_BACKLOG.md:26,63,97,114`。
- 原问题：旧代理只比较局部东西/南北列范数，不能捕捉斜轴投影的非正交和剪切，却曾被当成完整 shape factor；这会错误支持“LAEA 形状最优”。
- 验证方法：以球面 `R=1`、固定 `h=0.25°`、局部单位球正交基重算 Jacobian；对完整 `J` 取奇异值比，并以 `abs(det J)` 复核面积。独立计算 CURRENT、Equirect、LAEA、AEQD 的样点值，与 CSV 最大误差小于 `3e-6`。
- 当前结果：四个字段已分离为 `ew_ns_scale_ratio`、`principal_axis_ratio`、`area_factor`、`area_factor_relative_to_center`。LAEA 主轴比范围 `1.000000–1.327088`、相对中心面积约 `1`；AEQD 主轴比更好（最大 `1.205492`），但最远样点面积因子约 `1.205491`。推荐理由已改为“等积与可接受形变的综合优选”，B-1 仍由 USER 决定。
- 修正建议：已落实；Integration 只能按 B-1 所选候选自身的指标范围验收。

### 3.2 CONFIRMED-PROBLEM — CLOSED：Gate/CH option 影响曾与直接依赖不一致

- 位置：整改后见 `15_USER_DECISION_GATES.md:11-27,39-49,65-75`、`14_GIT_BACKLOG.md:15-64,85-115`、`16_EVIDENCE_APPENDIX.md:61-77`。
- 原问题：若 option-level CH 影响、Gate Ledger 和 14 的直接依赖不一致，选择某选项时会漏做许可、几何 QA 或误挂传递依赖。
- 验证方法：独立解析 15 的 17 个 Gate Ledger 与 14 的 25 个主工作项，对每个 Gate 作双向集合等值比较；再检查 48 个 option 的 CH 集合均为 Ledger 子集，且每项均在 14 中直接等待该 Gate。
- 当前结果：17/17 Gate 精确反向索引一致，48/48 option 无悬空影响，CH 依赖图无环。
- 修正建议：已落实；后续变更继续由自动校验器执行等集检查。

### 3.3 CONFIRMED-PROBLEM — CLOSED：法属圭亚那与波多黎各证据边界曾不足

- 位置：整改后见 `05_GEOGRAPHIC_NEUTRALITY_RISK_REGISTER.csv:5-6`、`08_COUNTRY_TERRITORY_COVERAGE_AUDIT.csv:30`、`14_GIT_BACKLOG.md:16,44-45,92,105-106`、`15_USER_DECISION_GATES.md:18,21,135-169`、`16_EVIDENCE_APPENDIX.md:27-28,56-57`。
- 原问题：行政地位、边界/主权、范围授权和 UI 文案存在被合并推断的风险；波多黎各描述性地位文案缺少明确的一手证据前置。
- 验证方法：2026-09-08 重新打开 INSEE 与法国海外部官方页面。INSEE 页面明确列 Guyane 为法国宪法第 73 条 DROM；法国海外部页面明确其为行使 département/région 职权的 `collectivité territoriale unique`。两页均不足以替 USER 决定 C-8 范围、C-3 几何授权或争议边界。逐项检查 C-6 和 CH-15 对波多黎各文案的阻塞条件。
- 当前结果：只把 Guyane 行政分类标为 `VERIFIED_PRIMARY`；边界、主权、范围和实施授权不随之升级。波多黎各没有 primary URL/标题/检索日时只能使用中文名称，不得写描述性地位。
- 修正建议：已落实。

## 4. MINOR（笔误、引用号、计数）

**无未关闭 MINOR。**

### 4.1 CONFIRMED-PROBLEM — CLOSED：B-04 状态计数残留为 17

- 位置：`16_EVIDENCE_APPENDIX.md:22-45`；同步断言见 `validate_wcd09_package.py`。
- 问题：本轮最终复审时，摘要仍写“其余 17 个外部事实”，与 20 行矩阵的当前状态不符。
- 验证方法：用 Markdown 表格字段机械计数，实际为 `CANNOT_VERIFY=16`、`VERIFIED_PRIMARY=2`（RISK-04、RISK-20）、`REPOSITORY_VERIFIED=2`（RISK-11、RISK-18）。
- 修正：Luna Max 已改为 16/2/2，并把计数断言加入 `validate_wcd09_package.py`；本审计方复跑通过。

## 5. OK 项摘要

### 5.1 OK — 底图机械指纹与逐 feature 对照

- 对指定基线 `0c361fe:site/assets/latin-america-countries.geojson` 独立复算：SHA-256 为 `478f3ebc2d30ae8669a8caea05dad6a82b507f8e629443c6c3b643e369c00511`，37,938 bytes，28 features，1,509 vertices。
- 与 `00_PREFLIGHT.md:41`、`01_CURRENT_MAP_INVENTORY.md:10-15` 一致。
- `02_CURRENT_BASEMAP_FEATURES.csv` 28 行的零基 `feature_index`、ADMIN、ISO_A2、ADM0_A3、geometry type、顶点数和 bbox 均与基线 GeoJSON 对上；当前工作树资产与基线逐字节相同。

### 5.2 OK — 旧投影像素与出画结论

- 按 `06_PROJECTION_AND_GEOMETRY_AUDIT.md:8-20` 的公式，对 `09_PLACE_COORDINATE_AUDIT.csv` 全部 17 个有数值坐标的地点重算；四舍五入误差不超过 `0.05 px`，`in_viewbox` 全部一致。
- 三个必抽城市：墨西哥城 `193.1,85.4`（TRUE，CSV 行 11）；圣地亚哥 `484.5,418.2`（TRUE，行 22）；布宜诺斯艾利斯 `610.1,425.4`（TRUE，行 35）。
- 马德里 `1169.6,-46.7`（FALSE，行 23）、巴黎 `1231.5,-99.8`（FALSE，行 38），出画结论成立。

### 5.3 OK — 投影裁决及候选完整性

- 8 个候选、每候选 7 点，共 56 行；候选汇总范围与样点极值逐字段一致，所有 `principal_axis_ratio >= 1`。
- CURRENT 主轴比最高 `2.766735`；Equirect 最高 `1.667147`，作为低改动 fallback 合理；LAEA 等积且主轴比最高 `1.327088`；AEQD 形状更优但面积最高约 `+20.5%`；Equal Earth 在本窗口主轴形变高于 LAEA；Albers 跨赤道形变较大；Mercator 面积因子最高约 `2.894471`，否决合理。
- 加入 AEQD、Natural Earth I、Albers 后，对本项目“面积中立 + 拉美窗口轮廓 + 浏览器实现”目标未发现明显更优但被漏评的常见候选。此结论不是数学上的全球最优证明，B-1 保留 USER 取舍是正确做法。
- 8 张 PNG 均为 1320×840，逐张目视检查可辨认同一 28-feature 几何和候选间轮廓差异；图底说明与南端轮廓有轻微接近/重叠，但 `figures/README.md:3-19` 已明确它们只是研究比较图，不作为成品 UI 或视觉验收，故不构成实施误导。

### 5.4 OK — 许可矩阵（官方页复验日 2026-09-08）

| 项 | 结论 | 本审计复验 |
|---|---|---|
| Natural Earth | OK | [官方 Terms of Use](https://www.naturalearthdata.com/about/terms-of-use/) 明示 raster/vector 数据为 public domain，可修改、电子分发及商业使用，无需许可或署名；04 CSV 行 6、11:15-21 的“Public Domain，非 CC0”准确。 |
| geoBoundaries | OK | [官网](https://www.geoboundaries.org/) 明示 CC BY 4.0，并要求 acknowledgement；04 CSV 行 7、11:27-30 的采用条件准确。 |
| GADM | OK | [官方许可页](https://gadm.org/license.html) 明示免费范围为学术及其他非商业用途，未经许可不得再分发或商业使用；04 CSV 行 8、11:32-33 的排除成立。 |
| OpenStreetMap | OK（限定结论） | [OSMF 官方指引](https://osmfoundation.org/wiki/Licence/Attribution_Guidelines) 明示 ODbL 和署名义务，并说明具体呈现/数据库场景不同；04 CSV 行 9、11:35-37 没有说 OSM “违法”，而是因 ODbL 个案负担、数据异质性和中立性治理不匹配而作项目级排除，表述合理。 |

### 5.5 OK — 中立性风险与证据状态

- `05_GEOGRAPHIC_NEUTRALITY_RISK_REGISTER.csv` 为 20 行、17 列；覆盖原有 18 案，并加入 Sapodilla Cayes（RISK-19）和 Southern Patagonian Ice Field 未决勘界段（RISK-20）。
- `16_EVIDENCE_APPENDIX.md:22-45` 对 20/20 案逐行区分仓库事实与外部事实，状态机械计数为 16/2/2。2026-09-08 复验 Chile MFA 官方页；Argentina MFA 直开一度超时，但官方搜索结果可取得标题、日期和正文摘要，且与 Chile MFA 对未完成共同制图/勘界工作的表述相互印证。包内没有把这些材料写成主权裁决。
- 福克兰双名次序未预设；D-1 要求 USER 结合名称来源选择。D-2（线型）、D-3（逐案处置）、D-4（通用披露）互不替代；免责声明不能替代逐案判断。
- 对当前比例尺、窗口和既有问题清单抽查后，没有发现仍未登记的明显高风险地区。该结论不是对世界全部争议的穷尽保证；未来换比例尺、扩大窗口或增加海域层会触发重新审计。

### 5.6 OK — 54 行覆盖表与两层模型

- `08_COUNTRY_TERRITORY_COVERAGE_AUDIT.csv` 为 54 行、16 列；13 个现有交互 code 唯一。
- 所有条件式 L1 行均含 C-8；法属圭亚那 L1 为 C-8+C-3、L2 为 C-1；Trinidad and Tobago L2 为 C-2；加勒比属地走 C-6；USA 背景走 C-4；South Georgia/Navassa/Clipperton 的 keep-out 走 C-7。
- L1 背景完整性与 L2 文学交互资格分列，未把“有几何”自动推成“可点击”，与 `03_SCOPE_AND_COVERAGE_POLICY_RESEARCH.md:37-40,55-57` 自洽。
- 05/08/10/11 中出现的 Gate ID 均存在于 15；未发现散落且未登记的 USER 决策点。

### 5.7 OK — CH 可实施性、交叉引用与数量摘要

- 14 中 CH-01…CH-25 在主表各一次、验收表各一次，共 50 条；25/25 有可观察 PASS 条件和 FAIL 条件（`14_GIT_BACKLOG.md:85-115`）。
- 解析显式 CH 依赖未发现环；所有直接等待 Gate 的 CH 均在 15 Ledger 反向列出，反之亦然。
- 05→10 NAME、12→03/05/06/07、14→文件号/稳定 ID 的引用抽查与无悬空 ID 检查通过；未发现张冠李戴的当前引用。
- 机械复算确认 20 risks、54 coverage rows、38 coordinate rows/19 columns、37 name rows、8 candidates/56 metrics/8 figures、25 CH 均与实物一致；Gate 依赖摘要与 14/15 一致。
- 12 的政策建议均能映射到 14 工作项，14 没有绕过 12 的条件式政策；未发现冲突或未标 Gate 的实质工作项。

## 6. SUSPECTED / CANNOT_VERIFY（保留限制，不是已证实缺陷）

以下事项没有足够证据升级为事实结论。本报告不以常识补证；其共同判定为 **SUSPECTED / CANNOT_VERIFY**，但研究包已经正确阻塞，因此不降低总裁决：

| 编号 | 文件/位置 | 无法验证事项 | 当前安全收口与建议 |
|---|---|---|---|
| S-01 | `01_CURRENT_MAP_INVENTORY.md:22-28`、`11:9`、`16:88` | 当前仓库资产的历史上游 release、原获取日期和量化处理链 | A-3 与 CH-05 要求版本化重取、记录处理步骤和 SHA；在完成前保持 `PROVENANCE_GAP`。 |
| S-02 | `16_EVIDENCE_APPENDIX.md:24-43,89` | 该矩阵中 16 项 `CANNOT_VERIFY` 外部政治、条约或 2026 ICJ 动态事实未保留可复核快照/hash | 保持 `CANNOT_VERIFY`；只有补齐 primary URL、标题、检索日和快照/hash 后才可升级。 |
| S-03 | `01:22-28`、`08` 候选属地行、`16:29-30,39,42` | NE 50m 中若干候选 part/小岛的精确成员关系和可见性 | A-1、C-3、C-6、C-7 与 CH-05、CH-22、CH-24 先做 explode、part 归属、许可和可见性 QA。 |
| S-04 | `09_PLACE_COORDINATE_AUDIT.csv` V1-ENT-0052、`12:91-92`、`14:37,71,103,122` | 恰帕斯弱引用的正确永久实体 | 保持 `BLOCKED/CANNOT_VERIFY`；不得编造 ID 或 promote。 |
| S-05 | `11_MAP_ASSET_LICENSE_AUDIT.md:42-46`、`16:58`、`15:27,240-249` | 中国大陆发布、地图审核、互联网地图服务资质是否适用于本站 | 元典检索仅支持相关条文定位；缺发布主体、部署、功能和受众事实，E-1 必须由专业人员结合事实评估。不得写成“无需资质”或“一概禁止”。 |
| S-06 | `11:23-25,42-46,56,61`、`16:54-55` | UN Geospatial 与自然资源部标准地图资产的具体再分发许可 | 保持 `LICENSE_UNCLEAR`，不作为数据供给；未知不等于禁止。 |

## 7. 验证记录

包内门禁：

```text
python3 validate_wcd09_package.py
WCD-09 PACKAGE VALIDATION: PASS
- CSV widths and key uniqueness: PASS
- 02/05/08/07/09/10 semantic and cross-file checks: PASS
- Gate ledger, CH-01..25 mapping, and dependency acyclicity: PASS
- B-04 20-case matrix, license wording, projection policy, and text hygiene: PASS
```

投影/图件只读重算：

```text
MPLCONFIGDIR=/private/tmp/wcd09-mplconfig python3 generate_aeqd_evidence.py --check
check PASS candidates=8 metric_rows=56 samples_per_candidate=7
ew_ns=0.754899..2.766735
principal_axis=1.000000..2.766735
area_factor=0.891063..2.894471
area_relative_to_center=0.999997..2.779413
```

本审计另以独立短脚本完成：基线 SHA/features/vertices；02 每 feature 属性/顶点/bbox；09 全部 17 个数值坐标；8 个 CSV 行列宽；07 汇总范围；20 行 B-04 状态计数；17 Gate 注册与 15↔14 反向索引；48 option 子集；CH-01…25 双表计数和 DAG；D-3 六个逐案记录槽；54 行 L1/L2 关键不变量；稳定 ID 无悬空引用。所有检查通过。

## 8. 放行条件

1. 本研究包的独立审计已通过，研究材料无需再整改。
2. 开始具体 CH 前，必须先由 USER 在 15 的记录槽完成该 CH 所依赖 Gate；未决 Gate 继续阻塞相应分支。
3. Integration 使用当前 `origin/main` 时，应先做一次语义定位/漂移检查；不得假设 `0c361fe` 的行号仍全部有效。
4. 任何新的外部事实、比例尺、视窗、海域层或数据源变更，都需按 16 的证据规则重新核验，不继承本报告的 OK。

**最终裁决：YES。**
