# 15_USER_DECISION_GATES — USER 决策清单（稳定 ID、选项与记录槽）

> 本文件是可执行的 USER 决策清单，不替 USER 选择。每个稳定 ID 都有互斥选项、影响的 CH、未裁决后果和所需证据；在 USER 记录选项前，状态保持 `PENDING_USER`。任何选项若依赖外部事实而证据不足，安全选项都是延后敏感呈现并保持不实施。
>
> 稳定 ID：`A-1…A-3`、`B-1`、`C-1…C-8`、`D-1…D-4`、`E-1`。业务行只能引用完整 ID；章节标题可以使用分组名称，但不编号的分组名称不是授权。

## 1. Ledger 总览

| ID | 决策对象 | 当前状态 | 直接影响的 CH | 未裁决后果 |
|---|---|---|---|---|
| A-1 | 底图几何主源 | `PENDING_USER` | CH-01; CH-02; CH-03; CH-05; CH-06; CH-21; CH-22; CH-23; CH-24 | 不得锁定供给源或补缺几何 |
| A-2 | 坐标来源与引用规范化 | `PENDING_USER` | CH-13; CH-21 | 不得修改 Data/Curation 引用字段 |
| A-3 | 版本、日期与处理链记录 | `PENDING_USER` | CH-01; CH-02; CH-03; CH-05; CH-06; CH-20; CH-21 | provenance 缺口保留 |
| B-1 | 投影候选及参数 | `PENDING_USER` | CH-07; CH-08; CH-09; CH-10; CH-24 | 不得锁定投影或验收指标 |
| C-8 | L1 范围元决策 | `PENDING_USER` | CH-02; CH-03; CH-04; CH-14; CH-15; CH-16; CH-18; CH-23; CH-24; CH-25 | C-1…C-7 和所有 L1 状态只能保持条件式 |
| C-1 | 无文学数据地区的 L2 处理 | `PENDING_USER` | CH-14; CH-23; CH-24 | 不得把无数据地区变为已授权交互 |
| C-2 | 特立尼达和多巴哥 L2 | `PENDING_USER` | CH-03 | 不得因邻接或作家关联自动开放交互；当前几何已存在，需先有内容证据和 L1 前提 |
| C-3 | 法属圭亚那/法国 polygon 的 L1 处理 | `PENDING_USER` | CH-02; CH-22 | 不得决定法国归属呈现 |
| C-4 | 美国南部背景几何或 keep-out 说明 | `PENDING_USER` | CH-04; CH-22; CH-24 | 不得选择窗外陆地分支 |
| C-5 | 马德里/巴黎图外点处理 | `PENDING_USER` | CH-10; CH-11; CH-24 | 不得确定地图交互入口 |
| C-6 | 加勒比微型主权国及海外领地 L1/L2 | `PENDING_USER` | CH-03; CH-15; CH-16; CH-22; CH-23 | 不得扩展几何或交互 |
| C-7 | 南乔治亚、纳瓦萨、克利珀顿 keep-out | `PENDING_USER` | CH-04; CH-22; CH-24 | 不得把候选 keep-out 变成已决 |
| D-1 | 福克兰/马尔维纳斯双名形态、次序与符号 | `PENDING_USER` | CH-16 | 不得选定名称或顺序 |
| D-2 | 争议线型/叠层的一般规则 | `PENDING_USER` | CH-17; CH-22; CH-24 | 不得增加、删除或改样式争议线 |
| D-3 | 逐案争议注记与处置 | `PENDING_USER` | CH-17; CH-22; CH-24 | 不得以通用披露替代逐案判断 |
| D-4 | 通用免责声明与署名文案 | `PENDING_USER` | CH-17; CH-21; CH-22 | 不得落固定披露文案 |
| E-1 | 中国大陆发布场景专业评估记录方式 | `PENDING_USER` | CH-19 | 保持 `CANNOT_VERIFY`，不实施大陆发布路径 |

## 2. 语义映射和引用规则

| 来源 | 允许的引用 | 规则 |
|---|---|---|
| `05.USER_DECISION_REQUIRED` | 完整 Gate ID 或 `NONE` | 争议/未决勘界案用 D-2/D-3/D-4；RISK-19、RISK-20 不用 D-1 |
| `08.l1_gate` | C-8，必要时加 C-3/C-4/C-6/C-7 | 所有 L1 行必须保持条件状态并含 C-8 |
| `08.l2_gate` | C-1…C-8 或 `NONE` | L2 与 L1 分列；`CONDITIONAL_*` 不等于已授权 |
| `10.USER_GATE` | D-1、C-3、C-6 或 `NO` | NAME-06 才用 D-1；NAME-24 的执行项是 CH-15; CH-16 |
| `14` 依赖栏 | 完整 Gate ID 与完整 `CH-01` 形式 | 禁止以斜杠连接 CH ID 的缩写形式；A-2 才能支持 Data/Curation 引用变更 |

### 2.1 15↔14 Gate/CH 交叉引用政策

`15` Ledger 的「直接影响的 CH」与 `14` 主表依赖栏采用**双向精确反向索引**：对每个 Gate，15 列出的 CH 集合必须等于 14 中明确写出该 Gate 的 CH 行集合。只因传递性前置而受影响的 CH 不重复登记；只有该 CH 的当前工作项确实等待该 Gate 时才列入。校验器对两侧集合执行等集检查，发现不一致即失败；本规则不替 USER 裁决 Gate。

机械校验必须检查：每个 ID 存在、每个 Gate 有选项和记录槽、引用主题与决策对象相符、CH 依赖使用完整形式且无环。

### 2.2 Option-level CH 影响政策

每个 `*-OPT-*` 行的「CH 影响」只列出**选择该选项后会实施、复核或明确阻塞的直接工作项**。该集合必须是同一 Gate Ledger 集合的子集，并且每个列出的 CH 必须在 `14` 依赖栏中明确等待该 Gate。Ledger 可以保留并非每个具体选项都会触发、但 `14` 工作项直接等待该 Gate 的共享验收或安全阻塞项；纯传递性依赖不得进入 Ledger。因此「Ledger-only」不要求每个选项重复列出，但 option-only 不得悬空。keep-out/延后选项不虚挂新资产许可或几何 QA，只有实际选择引入资产或执行 QA 的选项才列 `CH-22; CH-24`。

本轮语义约束：A-1 的 geoBoundaries 选项若保留逐文件署名则触发 CH-21；C-3 的 France 几何选项触发 CH-22，而仅记录缺口的选项不触发 CH-05；C-4/C-7 的 keep-out 选项不触发资产许可/几何 QA，新增几何选项才分别触发 `CH-22; CH-24`；D-1 的名称来源证据由 CH-16 吸收，不另挂 CH-21；E-1 只处理发布法律评估，不触发资产许可复核。

## 3. Gate A — 底图、坐标与 provenance

### A-1 底图几何主源

| 选项 | 互斥方案 | 推荐 | CH 影响 | 所需证据与未裁决后果 |
|---|---|---|---|---|
| A-1-OPT-1 | Natural Earth Admin 0 Countries 50m，按 CH-05 脚本化处理 | 推荐 | CH-01; CH-02; CH-03; CH-05; CH-06 | MAPSRC-05 许可/覆盖证据；未选前不补 France 或加勒比几何 |
| A-1-OPT-2 | geoBoundaries，逐文件复核 CC BY 4.0 后采用 | 替代 | CH-01; CH-02; CH-03; CH-05; CH-21 | 逐文件 URL、许可和 part 归属；任一文件 `LICENSE_UNCLEAR` 则不供给 |
| A-1-OPT-3 | 延后/拒绝新增几何，保留当前 110m 作为只读回滚资产 | 延后/拒绝 | CH-02; CH-03; CH-05 不实施 | 明确接受缺岛风险；在裁决前不能把当前覆盖说成完整 |

记录槽：`A-1: option=___; evidence=___; rationale=___; status=PENDING_USER; date=___; decider=___`

### A-2 坐标来源与引用规范化

| 选项 | 互斥方案 | 推荐 | CH 影响 | 所需证据与未裁决后果 |
|---|---|---|---|---|
| A-2-OPT-1 | 10 个可定位弱引用换永久 GeoNames ID；V1-ENT-0052 恰帕斯保持 BLOCKED/CANNOT_VERIFY；6 个永久源只规范化 | 推荐 | CH-13; CH-21 | 每个 ID 的永久 URL、标题/坐标和检索日期；恰帕斯未核验前不得转换或 promote |
| A-2-OPT-2 | 保留现有 URL，仅建立逐行证据登记，不改 Data/Curation 字段 | 替代 | CH-13 仅做登记；CH-21 记录现状 | 需要保留每个弱 URL 和限制；弱引用风险继续存在 |
| A-2-OPT-3 | 延后整个坐标引用变更并阻塞 CH-13 | 延后 | CH-13; CH-21 不实施 | 不需要猜测实体；正式 Gate 未通过前不得修改 Data/Curation |

记录槽：`A-2: option=___; ten_convertible=___; blocked_case=V1-ENT-0052; six_normalize=___; evidence=___; status=PENDING_USER; date=___; decider=___`

### A-3 版本、日期与处理链

| 选项 | 互斥方案 | 推荐 | CH 影响 | 所需证据与未裁决后果 |
|---|---|---|---|---|
| A-3-OPT-1 | 记录 release、获取日期、下载/解压/explode/窗口筛选/量化和 SHA | 推荐 | CH-01; CH-05; CH-06; CH-20; CH-21 | 上游 release 页面、日期、脚本常量和可复算 SHA；缺一仍 `PROVENANCE_GAP` |
| A-3-OPT-2 | 只记录上游版本与日期，处理步骤另存 evidence appendix | 替代 | CH-01; CH-20 | 处理链仍须在 16 留完整步骤；不能声称 provenance 完整 |
| A-3-OPT-3 | 延后 provenance 记录并阻塞底图实现 | 延后 | CH-01; CH-05; CH-20 不实施 | 不以当前文件推断上游版本；保持 `PROVENANCE_GAP` |

记录槽：`A-3: option=___; release=___; retrieval_date=___; process_record=___; sha=___; status=PENDING_USER; date=___; decider=___`

## 4. Gate B — 投影与比例

### B-1 投影候选及参数

若任一候选的参数或复算证据不足，安全路径是延后 B-1、保持当前投影只读，并不实施依赖投影的敏感呈现。

| 选项 | 互斥方案 | 推荐 | CH 影响 | 所需证据与未裁决后果 |
|---|---|---|---|---|
| B-1-OPT-1 | LAEA，中心 75°W/11.5°S | 推荐候选 | CH-07; CH-08; CH-09; CH-10; CH-24 | 自身 7 点 `ew_ns_scale_ratio=0.957492–1.143802`（方向代理）、`principal_axis_ratio=1.000000–1.327088`（完整形状）、`area_factor=0.999998–0.999998`、相对中心 `0.999999–1.000000`；未选前不得锁定 LAEA |
| B-1-OPT-2 | Equirect，标准纬线 −11.5° | 替代候选 | CH-07; CH-08; CH-09; CH-10; CH-24 | 使用自身 `ew_ns_scale_ratio=1.000000–1.667147`、`principal_axis_ratio=1.000000–1.667147`、`area_factor=1.000000–1.667147`；不得套用 LAEA 验收 |
| B-1-OPT-3 | AEQD，中心 75°W/11.5°S | 替代候选 | CH-07; CH-08; CH-09; CH-10; CH-24 | 07 的 7 点 `ew_ns_scale_ratio=0.971319–1.093284`、`principal_axis_ratio=1.000000–1.205492`、`area_factor=1.000000–1.205491`；完整形状更好但面积非等积 |

所有选项都必须分别验收 SVG `preserveAspectRatio`、`ew_ns_scale_ratio`（方向代理）、`principal_axis_ratio`（完整局部形状）和 `area_factor`；画布等比不替代面积因子检查，方向代理也不得冒充完整形状。

记录槽：`B-1: option=___; candidate_id=___; parameters=___; canvas_check=___; shape_check=___; area_check=___; status=PENDING_USER; date=___; decider=___`

## 5. Gate C — L1/L2 范围与交互

### C-8 L1 范围元决策（必须先于 C-1…C-7）

| 选项 | 互斥方案 | 推荐 | CH 影响 | 所需证据与未裁决后果 |
|---|---|---|---|---|
| C-8-OPT-1 | `Latin America` 历史文化口径，另列属地规则 | 待 USER | CH-02; CH-03; CH-04; CH-14; CH-15; CH-18; CH-23; CH-24; CH-25 | 03 候选分类与属地规则；未选前 08 所有 L1 行保持条件 |
| C-8-OPT-2 | UN M49 `Latin America and the Caribbean` 统计口径，另列属地规则 | 待 USER | CH-02; CH-03; CH-04; CH-14; CH-15; CH-18; CH-23; CH-24; CH-25 | M49 primary URL 与成员表；不得自动推出 L2 交互 |
| C-8-OPT-3 | 延后范围裁决，继续阻塞所有依赖 L1 的实施 | 安全延后 | CH-02; CH-03; CH-04; CH-14; CH-15; CH-18; CH-23; CH-24; CH-25 | 不需要假定范围；03/08/12/14 保持条件式 |

记录槽：`C-8: option=___; L1_definition=___; territories=___; adjacent_land=___; evidence=___; status=PENDING_USER; date=___; decider=___`

### C-1 无文学数据地区 L2

| 选项 | 互斥方案 | 推荐 | CH 影响 | 所需证据与未裁决后果 |
|---|---|---|---|---|
| C-1-OPT-1 | 保留 C-8 选定 L1 的中性无内容背景，L2 不交互并加入图例 | 推荐 | CH-14; CH-23; CH-24 | 08 成员和文学数据核对；未选前不将条件行改成已授权 |
| C-1-OPT-2 | 暂不渲染无内容候选，待内容证据补足 | 替代 | CH-14; CH-23 | 记录缺失几何；不得称为永久范围外 |
| C-1-OPT-3 | 延后 C-1，所有相应 L2 保持阻塞 | 延后 | CH-14; CH-23; CH-24 不实施 | 保留条件状态和无内容风险 |

记录槽：`C-1: option=___; member_set=___; evidence=___; status=PENDING_USER; date=___; decider=___`

### C-2 特立尼达和多巴哥 L2

| 选项 | 互斥方案 | 推荐 | CH 影响 | 所需证据与未裁决后果 |
|---|---|---|---|---|
| C-2-OPT-1 | L1 条件背景保留，L2 暂不交互 | 推荐 | CH-03 | 文学数据和 L1 前提证据；未选前不自动开放 |
| C-2-OPT-2 | 在 C-8 后按内容证据开放 L2 | 替代 | CH-03 | 内容来源和标签；证据不足则延后 |
| C-2-OPT-3 | 延后或拒绝该地区 L2 | 延后/拒绝 | CH-03 不实施 | 保持条件背景或不渲染，不作范围结论 |

记录槽：`C-2: option=___; literary_evidence=___; L1_prerequisite=___; status=PENDING_USER; date=___; decider=___`

### C-3 法属圭亚那/France polygon

| 选项 | 互斥方案 | 推荐 | CH 影响 | 所需证据与未裁决后果 |
|---|---|---|---|---|
| C-3-OPT-1 | C-8 选择纳入后，France polygon 作为法国关联背景呈现 | 待 USER | CH-02; CH-22 | A-1/NE 50m part 证据、归属字段和逐文件许可复核；未选前不补入 |
| C-3-OPT-2 | C-8 选择纳入但先保留几何缺口，待证据/数据复核后再补 | 替代 | CH-02 | 只记录几何缺口；不得把空洞写成范围外结论，也不提前触发 CH-05 |
| C-3-OPT-3 | 延后/拒绝该 polygon 的呈现 | 延后/拒绝 | CH-02 不实施 | 保持空洞并在图例说明候选状态，不宣称授权 |

记录槽：`C-3: option=___; C-8_dependency=___; geometry_evidence=___; status=PENDING_USER; date=___; decider=___`

### C-4 美国南部窗内背景

| 选项 | 互斥方案 | 推荐 | CH 影响 | 所需证据与未裁决后果 |
|---|---|---|---|---|
| C-4-OPT-1 | 保持 keep-out，并加范围中性说明 | 推荐候选 | CH-04 | 视窗 bbox 与图例文案；未选前不将陆地当海面结论 |
| C-4-OPT-2 | 经 A-1/许可后加入背景几何，仍不交互 | 替代候选 | CH-04; CH-22; CH-24 | 许可、part 归属和裁剪证据；不得把背景变为 L2 |
| C-4-OPT-3 | 延后 C-4，阻塞任何 USA 窗内呈现 | 延后 | CH-04 不实施 | 保持 mismatch 风险并标明待决 |

记录槽：`C-4: option=___; keepout_or_geometry=___; evidence=___; status=PENDING_USER; date=___; decider=___`

### C-5 马德里/巴黎图外点

| 选项 | 互斥方案 | 推荐 | CH 影响 | 所需证据与未裁决后果 |
|---|---|---|---|---|
| C-5-OPT-1 | 改为作家页/关系列表入口，不在地图中放置不可见可聚焦点 | 推荐 | CH-10; CH-11; CH-24 | 09 像素与键盘 Tab 复核；未选前保留可见性阻塞 |
| C-5-OPT-2 | 扩展 viewport 至欧洲 | 替代 | CH-10; CH-11; CH-24 | 新窗口和投影指标；不得只凭当前点位扩大范围 |
| C-5-OPT-3 | 延后并阻塞两个点的地图交互 | 延后 | CH-10; CH-11 不实施 | 允许非地图数据入口继续存在，但不进入不可见地图 Tab |

记录槽：`C-5: option=___; Madrid=___; Paris=___; bbox_evidence=___; status=PENDING_USER; date=___; decider=___`

### C-6 加勒比微型主权国及海外领地

| 选项 | 互斥方案 | 推荐 | CH 影响 | 所需证据与未裁决后果 |
|---|---|---|---|---|
| C-6-OPT-1 | C-8 后纳入候选 L1 几何；L2 逐地区仍需文学证据 | 待 USER | CH-03; CH-15; CH-22 | 08 成员、A-1 part 与许可证据；Puerto Rico 任何描述性地位说明须在 C-6 记录槽留存并核验 primary URL/标题/检索日期；证据不足则仅保留中文名称、不写地位，其他证据不足仅保留条件项 |
| C-6-OPT-2 | 暂只纳入已有可核验几何，其余保持 keep-out/无内容候选 | 替代 | CH-03; CH-15; CH-22 | 每个 feature 的来源和缺口；Puerto Rico status 仍须 C-6 记录槽 primary URL/标题/检索日期并核验，否则只做中文名称、不写地位；不将缺失写成政治结论 |
| C-6-OPT-3 | 延后整个加勒比扩展 | 延后 | CH-03; CH-15 不实施 | 08 保持 conditional，阻塞敏感标签/交互；未来如写 Puerto Rico 描述性地位，仍须补 C-6 记录槽 primary URL/标题/检索日期并核验，否则只做中文名称、不写地位 |

记录槽：`C-6: option=___; member_set=___; L1_evidence=___; L2_evidence=___; status=PENDING_USER; date=___; decider=___`

### C-7 南乔治亚、纳瓦萨、克利珀顿

| 选项 | 互斥方案 | 推荐 | CH 影响 | 所需证据与未裁决后果 |
|---|---|---|---|---|
| C-7-OPT-1 | 50m 保持明确 keep-out，10m 另行复核 | 推荐 | CH-04 | 08 candidate rows 与分辨率证据；未选前不作外部地位判断 |
| C-7-OPT-2 | 只在有独立来源和许可时加入背景几何，不开放 L2 | 替代 | CH-04; CH-22; CH-24 | primary URL、许可、part 归属和可见性 QA；任何外部地位仍可 CANNOT_VERIFY |
| C-7-OPT-3 | 延后所有 keep-out/geometry 决策 | 延后 | CH-04 不实施 | 保持条件记录，不把当前缺失视为永久范围外 |

记录槽：`C-7: option=___; SGS=___; USR=___; CPT=___; evidence=___; status=PENDING_USER; date=___; decider=___`

## 6. Gate D — 争议、命名与披露

### D-1 福克兰/马尔维纳斯双名

| 选项 | 双名形态 | 推荐 | CH 影响 | 所需证据与未裁决后果 |
|---|---|---|---|---|
| D-1-OPT-1 | 斜杠双名：`A / B`；斜杠弱化层级，但先后顺序仍可能产生显著性，USER 必须定序 | 候选 | CH-16 | 官方中文名源或明确记录的名称证据由 CH-16 吸收；未选前不落双名次序 |
| D-1-OPT-2 | 括号双名：`A（B）`；括号形成层级，USER 必须定主名/次名顺序 | 候选 | CH-16 | 官方中文名源由 CH-16 吸收；未选前不使用候选顺序 |
| D-1-OPT-3 | 延后双名并保持非敏感占位/阻塞 tooltip | 延后 | CH-16 不实施 | 缺证据时不呈现可能误导的敏感顺序 |

记录槽：`D-1: option=___; first_name=___; second_name=___; separator=___; source_evidence=___; status=PENDING_USER; date=___; decider=___`

### D-2 一般争议线型/叠层

| 选项 | 互斥方案 | 推荐 | CH 影响 | 所需证据与未裁决后果 |
|---|---|---|---|---|
| D-2-OPT-1 | 对经审查的争议段添加统一中性虚线/叠层，保留 de facto 基线 | 候选 | CH-17; CH-22; CH-24 | 05 风险矩阵、图例和线型可访问性；外部事实不足时不新增敏感线 |
| D-2-OPT-2 | 只保留来源的 de facto 线，靠图例说明其不是法律裁决 | 候选 | CH-17; CH-22 | 逐案证据和可读性 QA；不以通用披露替代 D-3 |
| D-2-OPT-3 | 延后所有争议线型，敏感叠层不实施 | 安全延后 | CH-17; CH-22 不实施 | 外部证据不足时默认安全；维持 CANNOT_VERIFY |

记录槽：`D-2: option=___; line_style=___; legend_text=___; evidence=___; status=PENDING_USER; date=___; decider=___`

### D-3 逐案子记录（每案独立选择）

> 每个风险案都必须单独记录；不能用一个 `D-3=___` 覆盖全部案件。外部事实为 `CANNOT_VERIFY` 时，必须选择“延后/不实施敏感注记”或留下新的 primary 证据后再选展示项。

| 案件 | D-3-A：延后/不实施敏感注记（默认安全） | D-3-B：只展示已留 primary 证据的程序性中性注记 | D-3-C：证据补齐后再展示逐案说明 | 所需证据 |
|---|---|---|---|---|
| RISK-02 Essequibo | 保留 de facto 基线，不加程序状态 | 仅在 16 有 ICJ 文书/快照时标注程序状态 | 补齐 Case 171 primary snapshot 后再决定 | Case 171 URL、标题、日期、文书/hash；当前不足则延后 |
| RISK-03 Belize–Guatemala | 保留普通线，不加逐案说明 | 仅依据留存 Case 177 文书作中性注记 | 补齐边界/程序 primary record 后再决定 | Case 177 文书/日期/hash；当前不足则延后 |
| RISK-14 Navassa | 50m keep-out，不加地位或主权注记 | 仅在未来 10m primary record 留存后标程序事实 | 10m 几何与 primary status 证据齐备后再决定 | 10m feature、primary status URL/hash；当前不足则延后 |
| RISK-15 New River Triangle | 保留 de facto 基线，不加主张注记 | 仅依据留存 boundary record 作中性程序注记 | 补齐双方 primary boundary/程序证据后再决定 | primary boundary document、日期/hash；当前不足则延后 |
| RISK-19 Sapodilla Cayes | 不单独渲染/不加程序注记，先做几何 QA | 仅在 Case 185 文书/快照留存后标程序事实 | 几何可见性与 primary case record 均补齐后再决定 | 50m/10m geometry QA、Case 185 URL、标题、日期、snapshot/hash |
| RISK-20 Southern Patagonian Ice Field | 保留 ARG/CHL 基础线，不加局部敏感注记或最终勘界表述 | 仅依据两方外交部 primary URL 的 pending demarcation 事实作中性注记 | 几何 QA 与 D-2/D-3/D-4 规则齐备后再决定局部线型/注记 | Argentina MFA 与 Chile MFA URL、标题、2026-09-07 检索记录；证据或几何不足则延后 |

逐案记录槽：

```text
D-3/RISK-02: option=___; evidence=___; annotation=___; status=PENDING_USER; date=___; decider=___
D-3/RISK-03: option=___; evidence=___; annotation=___; status=PENDING_USER; date=___; decider=___
D-3/RISK-14: option=___; evidence=___; annotation=___; status=PENDING_USER; date=___; decider=___
D-3/RISK-15: option=___; evidence=___; annotation=___; status=PENDING_USER; date=___; decider=___
D-3/RISK-19: option=___; evidence=___; annotation=___; status=PENDING_USER; date=___; decider=___
D-3/RISK-20: option=___; evidence=___; annotation=___; status=PENDING_USER; date=___; decider=___
```

### D-4 通用免责声明与署名

若来源、范围或适用场景证据不足，延后固定文案，不实施敏感披露呈现；不得以免责声明代替事实核验。

| 选项 | 文案（来自 13） | 推荐 | CH 影响 | 所需证据与未裁决后果 |
|---|---|---|---|---|
| D-4-OPT-1 | “本地图仅呈现地理事实与文学关联，不代表对任何争议边界、领土归属或政治地位的立场。边界采用 Natural Earth（公有领域）的 de facto 数据呈现，文学地点坐标来自 GeoNames。” | 推荐 | CH-17; CH-21; CH-22 | 来源、版本和日期；未选前不落固定文案 |
| D-4-OPT-2 | “地图边界与名称不代表任何主权立场；地理数据来源见署名行。” | 替代 | CH-17; CH-21 | 署名行和适用范围；不能替代 D-3 |
| D-4-OPT-3 | “本地图的边界与坐标来自公开地理数据（Natural Earth、GeoNames）；来源选择不等于对任何争议地区的中立或主权判断。地图不代表对任何争议地区的立场；收录范围与文学关联详见关于页。” | 替代 | CH-17; CH-21 | 来源与范围条件式说明；不能把文案当作事实核验 |

记录槽：`D-4: option=___; map_text=___; attribution_text=___; placement=___; evidence=___; status=PENDING_USER; date=___; decider=___`

## 7. Gate E — 中国大陆发布场景

### E-1 中国大陆发布场景专业评估记录方式

| 选项 | 互斥方案 | 推荐 | CH 影响 | 所需证据与未裁决后果 |
|---|---|---|---|---|
| E-1-OPT-1 | 记录三问并委托中国法专业人员评估，评估完成前不面向大陆发布 | 推荐/安全 | CH-19 | 发布主体、部署、功能、受众及专业意见；不推出任何合规结论 |
| E-1-OPT-2 | 暂不记录专业意见，但明确继续阻塞大陆发布和相关技术实施 | 替代/阻塞 | CH-19 | 记录阻塞决定；仍为 `CANNOT_VERIFY`，不得写无需资质或一概禁止 |
| E-1-OPT-3 | 明确本阶段不面向大陆发布，待未来需求出现再启动专业评估 | 延后 | CH-19 | 发布范围声明；不将其解释为当前合规结论 |

记录槽：`E-1: option=___; professional_scope=___; questions=publication/审图/资质; evidence=___; status=PENDING_USER; date=___; decider=___`

## 8. 完整裁决记录模板

每个 ID 必须有一行；D-3 必须有六个逐案子槽（RISK-02、RISK-03、RISK-14、RISK-15、RISK-19、RISK-20）。未填写的 `option` 不得用于实现。

```text
A-1: option=___; evidence=___; status=PENDING_USER; date=___; decider=___
A-2: option=___; ten_convertible=___; blocked=V1-ENT-0052; six_normalize=___; evidence=___; status=PENDING_USER; date=___; decider=___
A-3: option=___; release=___; retrieval_date=___; process_record=___; sha=___; status=PENDING_USER; date=___; decider=___
B-1: option=___; candidate_id=___; parameters=___; canvas=___; shape=___; area=___; status=PENDING_USER; date=___; decider=___
C-8: option=___; L1_definition=___; territories=___; adjacent_land=___; status=PENDING_USER; date=___; decider=___
C-1: option=___; member_set=___; evidence=___; status=PENDING_USER; date=___; decider=___
C-2: option=___; literary_evidence=___; status=PENDING_USER; date=___; decider=___
C-3: option=___; geometry_evidence=___; status=PENDING_USER; date=___; decider=___
C-4: option=___; keepout_or_geometry=___; status=PENDING_USER; date=___; decider=___
C-5: option=___; Madrid=___; Paris=___; status=PENDING_USER; date=___; decider=___
C-6: option=___; member_set=___; L1_evidence=___; L2_evidence=___; status=PENDING_USER; date=___; decider=___
C-7: option=___; SGS=___; USR=___; CPT=___; status=PENDING_USER; date=___; decider=___
D-1: option=___; first_name=___; second_name=___; separator=___; status=PENDING_USER; date=___; decider=___
D-2: option=___; line_style=___; legend_text=___; status=PENDING_USER; date=___; decider=___
D-3/RISK-02: option=___; evidence=___; annotation=___; status=PENDING_USER; date=___; decider=___
D-3/RISK-03: option=___; evidence=___; annotation=___; status=PENDING_USER; date=___; decider=___
D-3/RISK-14: option=___; evidence=___; annotation=___; status=PENDING_USER; date=___; decider=___
D-3/RISK-15: option=___; evidence=___; annotation=___; status=PENDING_USER; date=___; decider=___
D-3/RISK-19: option=___; evidence=___; annotation=___; status=PENDING_USER; date=___; decider=___
D-3/RISK-20: option=___; evidence=___; annotation=___; status=PENDING_USER; date=___; decider=___
D-4: option=___; map_text=___; attribution_text=___; status=PENDING_USER; date=___; decider=___
E-1: option=___; professional_scope=___; questions=publication/审图/资质; status=PENDING_USER; date=___; decider=___
```
