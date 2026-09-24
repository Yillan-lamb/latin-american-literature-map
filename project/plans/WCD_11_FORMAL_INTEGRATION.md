# WCD-11 正式网站集成规格（TASK-128）

- 状态：`APPROVED_VISUAL / READY_TO_MERGE`（合并前复核最终文档提交的 CI）
- 基线：`origin/main @ 6e1d88216d262f573993dbc776df52d638239936`（2026-09-17 建立分支时）
- 视觉母版：[已关闭、未合并的 PR #36](https://github.com/Yillan-lamb/latin-american-literature-map/pull/36)，head `3a72600d6a4d7fcf8dcd4911cab6a3049675947d`
- 关联：`TASK-128 / DEC-067`

## 背景

USER 已通过 PR #36 的视觉预览，但该 PR 的 `previews/wcd-11/` 与正式 `site/`、Web Data、production bundle 和 release artifacts 隔离。直接合并只会保存实验性预览，不会升级网站。PR #36 因而关闭而不合并；其源码、22 张桌面／移动端截图和素材登记表保留为设计证据。本 Spec 只定义正式集成及验收，不把预览候选误写为生产事实。

## 目标

1. 将已批准的暖白档案纸、报刊档案版式、图像、字级与层次，接入正式网站所有页面类型；首页、目录、作家、作品、趣闻、搜索、时间线、关于项目以 #36 为视觉母版。
2. 保持生产 Web Data 为唯一公开内容输入，并保留既有稳定路由、SEO 元数据、来源入口、公开边界和 WCD-09 地图几何／中立性／L1-L2 行为。
3. 把预览的长 CSS 级联与后置 override 折叠为可维护的正式 token、基础、组件和响应式规则，不原封不动复制预览包。
4. 将视觉设计扩展、核验至 PR #36 尚未声称完成的国家、地点、虚构空间、阅读路径及其他探索节点。
5. 时间线可按类型和年代窗口组合筛选；显示为 `1960–1979｜文学爆炸年代` 等年代导航，不暗示在该窗口出生的作家属于某文学运动。对作家按生年、作品按首版年分段的定义应可见、可测试。

## 非目标

- 不导入研究候选、修改 SQLite、Schema、Curation 审核结论、Web Data schema 或公开收录范围。
- 不把预览 `data.js` / `geo-data.js` 快照、静态壳、截图和实验性 QA 目录直接复制到生产构建；生产仍从当前正式数据与权威 Natural Earth 资产生成。
- 不因视觉批准创建 Tag、GitHub Release、生产部署或开启 `V2-PUBLIC-RELEASE`；这些是独立 USER Gate。
- 不以预览图中的书籍封面或新文学史叙述替代可核验的来源；无权利依据时继续使用项目原创图块／排版 fallback。

## 方案

### 1. 权威边界与迁移路径

| 层 | 正式权威 | 从 #36 迁入的内容 | 不迁入的内容 |
| --- | --- | --- | --- |
| 事实、路由、来源 | `data/v2/web/site_data.json` 与现有 `scripts/build_v2_deploy_bundle.py` | 仅经过核验的表现逻辑 | 预览 `data.js`、页面壳与固定计数 |
| 地图 | WCD-09 的 Natural Earth 50m、LAEA、L1/L2、GeoNames | 不含政治几何的罗盘／纸张装饰 | 预览内联 GeoJSON 替换权威地图 |
| UI | `site/`、正式构建及公共 bundle | 已批准版式、图像、可读性、交互细节 | `previews/` 整包和累积 override |
| 图像 | 正式 `site/assets/` 与公开许可登记 | 逐件通过身份、许可、署名、体积审计的素材 | 身份未确认或权利不明的肖像、假封面 |

正式实现继续由 production build 生成直接可访问的静态路由壳，再由正式渲染层使用公开投影。任何新图像只作展示，不生成研究事实、坐标或文学关系。图片须有宽高、合适加载优先级、失效 fallback 与可读署名；预览台账中 `WITHDRAWN_IDENTITY_UNVERIFIED` 的素材不得进入公共 bundle。

### 2. 页面矩阵

| 页面类型 | 核心验收 |
| --- | --- |
| 首页／地图 | 设计母版结构、暖白纸纹、放大阅读路径／作家头像、柔和趣闻；WCD-09 48 个 L1、13 个 L2、35 个无内容背景及键盘／过滤／重置行为不变 |
| 作家目录／全部作家详情 | 当前正式公开作家全覆盖；肖像可用且有 fallback；01–04 桌面均衡，05 趣闻通栏；来源与相关链接不丢失 |
| 作品目录／全部作品详情 | 当前正式公开作品／合集全覆盖；无授权原书封面；作品事实、作者、地点、主题、关系及研究依据保留 |
| 趣闻 | 与正式审核白名单及公开作家范围一致；标题、正文、作者入口和来源可读；对比度达标 |
| 搜索 | 当前公开索引全覆盖，不以 `.slice(0, 80)` 截断无查询结果；查询、分类、关联与空状态可用 |
| 时间线 | 当前公开作者／作品事件全覆盖；类型＋年代窗口组合筛选、计数、空状态、键盘操作可用；文学爆炸为年代提示而非流派归属 |
| About | 项目叙述及 Natural Earth、GeoNames、de facto、非法律裁决、版权与来源说明完整 |
| 国家、地点、虚构空间、阅读路径、其他节点、404 | 共享视觉系统；真实／虚构空间分离、父子关系、公开来源、稳定 URL 和异常状态保留 |

目录和搜索的验收以正式 Web Data 实际公开范围为准；PR #36 的 `25 / 62 / 127 / 87` 只是当时预览快照，不是可覆盖正式数据的常量。

### 3. 实施顺序

1. `P-A`：建立本 Spec、资产／路由差异清单、正式 CSS 结构与设计 token；独立确认可复用素材的身份、许可、署名、体积和 fallback。
2. `P-B`：正式站点 shell、首页／地图、目录、作家和作品详情接入；保留原有数据映射、研究依据和 WCD-09 地图行为。
3. `P-C`：趣闻、搜索、时间线、About、国家／地点／路径／节点补齐；修正文学阶段标签语义和完整计数。
4. `P-D`：折叠 CSS override、响应式和无障碍加固；增加生产路由／交互／素材／对比度回归。
5. `P-E`：production build、validators、全浏览器矩阵、Lighthouse、地图门禁、截图对照和独立审计；只在全绿后讨论非 Draft、版本判定及合并。

同一正式集成范围继续在 `codex/wcd-11-formal-integration` 分支和同一个 Draft PR 内追加提交；不向已关闭的 #36 追加代码。若审计要求拆分独立范围，先在 TASKS 记录原因和验收边界。

### 4. 版本与回退

正式系统性 redesign 已实质改变读者体验和搜索／时间线能力，最终验收按 `DEC-068` 将 Web `0.5.0 Development → 0.6.0 Development`。Research Data `1.5.0 development candidate`、Research Schema `0.4`、Web Data schema `v2-web-0.3` 保持不变，除非后续另有明确审批。回退以正式集成 PR 的变更集为边界，不删除 PR #36 预览素材；禁止因回退恢复旧地图几何或放宽公开数据门禁。

## 验收标准与证据

- [x] `site/` 和 production bundle 实际使用正式新 UI；不依赖 `previews/` 才能显示。
- [x] 生产构建、Web Data validator、public bundle validator、WCD-09 basemap `--check` 与 implementation validator 全部 PASS。
- [x] 当前正式 sitemap／搜索／作家／作品／时间线记录全量可达，无 404、缺图、JS 错误、审核字段泄漏或非预期减少。
- [x] Chromium 桌面／移动、Firefox 桌面、WebKit 移动完成项目完整 Playwright matrix；对地图、搜索、时间线、目录、趣闻和阅读路径断言功能结果，而非只断言节点存在。
- [x] 1440×900、390×844 至少覆盖全部上述页面类型的截图对照；320px 无页面级横向溢出；键盘、焦点、对比度、缩放及 `prefers-reduced-motion` 有记录。
- [x] Lighthouse 在正式构建上运行并记录与既有基线的差异；回退项须说明理由，不用 preview 分数代替 production。
- [x] 图片许可、署名、身份、宽高、失效 fallback 与体积预算通过独立抽查；WCD-09 几何、48/13/35 分层、中立性说明和 de facto 边界继续 PASS。
- [x] 独立 Reviewer 明确 PASS，PR diff 范围、CHANGELOG／TASKS／DECISIONS／公开入口同步，适用 CI 全绿；USER 再判断正式集成与版本／合并，Public Release 仍单独暂停。

最终独立审计见 `project/audits/web/WCD_11_FORMAL_INTEGRATION_FINAL_AUDIT.md`。经审计的代码 head `32a2321` 两项适用 GitHub CI 均成功；最后的治理收口提交仍须在合并前重新核对该提交的适用 CI、无冲突及无未解决 Review。`READY_TO_MERGE` 不等于已合并或 `TASK-128 DONE`，Public Release 仍单独暂停。

## 2026-09-18 阶段检查点（不等于验收）

- 已接入：生产 shell、暖白档案纸／首页拼贴、共享视觉 token、作家目录与详情肖像及可见来源署名、01–04 双列＋05 趣闻通栏、公开搜索完整索引、时间线完整公开记录及类型＋年代窗口。未核实身份的 AST-024 明确不迁入。
- 正式 [Draft PR #37](https://github.com/Yillan-lamb/latin-american-literature-map/pull/37) 已创建，同一正式分支继续承载作品目录和详情的原创策展版封面、10 部作品集归入作品档案、首页四位重要作家肖像栏及二级页刊头装饰。原创版式须一直标注“非原书封面”，不得误导为出版物图像；这些增量仍受该 PR 的 CI 与独立审查门禁约束。
- 已验证：development-preview 参数生成的正式构建链产出 139 条路由；public bundle、Web Data、WCD-09 implementation、底图确定性 `--check` 均 PASS；四浏览器 Playwright matrix 96/96 PASS。纸纹 WebP 编码将请求体由约 1.9 MB 缩至约 100 KB，不改变母版视觉意图。
- 仍未验收：作品及国家／地点／阅读路径等全路由视觉对照、缩放／动效专项、CSS 最终归并、第三方肖像独立身份／许可抽查、独立 Reviewer、正式 PR CI。12 类代表页面 320px 测试已纳入四浏览器完整矩阵；在非首页不加载地图几何并稳定加载态页脚后，正式开发包矩阵 108/108 PASS，62 条作品路由 320px 抽查 PASS。#37 前一 head `dd6a536` 的 CI 因作品集测试固定断言 10 部而失败：CI 审核预览实际含 53 部；现已按构建动态断言，CI 同源预览的定向 Chromium 桌面／移动 2/2 PASS，远端复跑待核。Lighthouse 本地移动模拟首页 performance 75、作品页 80，CLS 均为 0；首页 LCP 12.1 秒仍未达性能门禁，需继续优化或给出审计解释。所有验收复选框仍保持未勾选。
- 2026-09-22 增量检查：About 已按视觉母版接入专用 Hero、带许可肖像拼贴与五模块＋研究入口布局，保留完整中立性／资料边界；相关四浏览器定向测试 4/4、完整矩阵 108/108 PASS。阿根廷、马孔多与“三座不存在的城镇”完成代表性桌面截图对照，未发现内容遗漏或模板断裂；它们只是样本，不关闭全路由截图门禁。正式构建、public bundle、Web Data、WCD-09 implementation 及确定性底图均再次 PASS。#37 仍为 Draft；首页 LCP、全量视觉／素材复核与独立 Reviewer 继续开放。
- 2026-09-23 加载检查：首页以 Web Data 为首屏依赖，Natural Earth 请求继续并行但不再阻塞 Hero；地图加载／失败状态局部收口。四浏览器通过“挂起地图请求仍先显示 Hero，恢复后地图可用”的新断言，完整矩阵 112/112 PASS，public bundle、Web Data 与 WCD-09 implementation validators 继续 PASS。Lighthouse 首页／作品 performance 为 75／79，其他传统类别 100、CLS 0；首页 LCP 12.7 秒仍由主拼贴图触发，故性能复选框继续不勾选。
- 2026-09-23 素材检查：6 项 editorial 与 23 张肖像哈希闭包复算一致；AST-032 正式用途记录已纠正。Commons 样本复核确认 3 项 CC 与 1 项权利人 Public Domain 页面声明，并补上所有 CC 肖像“缩放／色调处理”的可见改动说明及浏览器断言。其余肖像的独立来源／身份／许可抽查仍未完成，素材复选框继续不勾选。
- 2026-09-23 首屏补充：首页 Hero 先于公开数据响应渲染；数据到达后保留 Hero 节点并补全地图和正文，避免大 JSON 请求决定首屏图文出现时机。首页拼贴肖像现复用统一来源／许可／处理说明组件。公开数据和地图请求分别被挂起时，四浏览器专项 8/8 PASS；完整矩阵 116/116、139 路由构建和 public bundle PASS。本机 Lighthouse 连续两次停在 Chromium 启动后的阶段，未产生新报告，因此 LCP 是否改善仍为 `NOT_VERIFIED`，性能复选框继续不勾选。
- 2026-09-23 正式包复核：再次以不带 development-preview 横幅的参数生成 139 路由公共包，public bundle 与 Web Data validators、WCD-09 implementation 和权威 Natural Earth 确定性 `--check` 均 PASS；对这份正式输出重跑完整 Chromium 桌面／移动、Firefox 桌面、WebKit 移动矩阵 116/116 PASS，四浏览器各自遍历 sitemap 全部路由并检查公开文本和控制台错误。前四项可机械验证的验收框据此关闭；截图／缩放／对比度、Lighthouse、素材独立抽查、独立 Reviewer 与 USER 最终 Gate 继续开放。PR #37 head `46ae5f2` 的两项适用 CI 已 SUCCESS，状态 CLEAN，仍为 Draft。
- 2026-09-23 视觉矩阵与交互返修：新增可重复运行的 `scripts/qa_wcd11_visual_matrix.cjs`，对 15 类正式路由在 1440×900、390×844 各生成截图，并在 320×768 追加无溢出检查；45 次检查涵盖 HTTP、页面宽度、图片加载、控制台／脚本错误以及时间线键盘横向滚动。最终正式包 45/45 PASS、30 张截图；人工逐一审视这 15 类页面的双视口截图，未发现旧模板回退或断图。审视发现时间线横向内容缺少可见操作提示、移动 WebKit 不会自动用方向键滚动聚焦轨道、作品目录小屏“下一页”曾被页码区挤压；已分别加提示／显式按键处理／可收缩页码容器。修正后时间线专项与 320px 分页专项各在四浏览器 4/4 PASS，最终正式包完整矩阵 116 PASS／8 个既有预览条件 SKIP。截图现为本机临时 QA 产物，可由脚本再生，并非已完成独立视觉对照；200% 缩放、对比度、动效及独立 Reviewer 仍未验证，故截图／无障碍总复选框保持开放。
- 2026-09-23 罗盘地图返修：按 USER 最新视觉反馈，为首页真实 SVG 地图下方增加无大陆／国界／地名的手绘航海罗盘底纹 AST-036，地图国家改用偏赭色、墨线与站内衬线字。桌面空状态侧栏延伸至地图底端，不再露出异色背景；手机虚构空间入口由覆盖地图改为位于地图之后，避免遮蔽南部地理轮廓。视觉矩阵增加罗盘资源、13 个可交互国家和双视口布局断言后 45/45 PASS、30 张截图，正式站点子路径构建 139 路由，public bundle、Web Data、WCD-09 implementation PASS，完整四浏览器矩阵 116 PASS／8 个既有预览条件 SKIP。Natural Earth 源 ZIP 确定性重建本轮因网络不可达而 `NOT_VERIFIED`，但活动 GeoJSON 哈希和 48/13/35 分层再验未变；最终视觉／无障碍、Lighthouse、独立素材审核与 Reviewer 继续开放，PR 仍 Draft。
- 2026-09-24 中心图案删改：USER 保留罗盘地图总体设计，但要求去掉中央星形罗盘。AST-036 以原图局部编辑为无星形的 v2；外围刻度、放射线与航海装饰保留，旧 v1 仅可从 Git 历史回退，正式 CSS 及视觉断言改指 v2。此为视觉范围内的局部修改，不替换 WCD-09 权威几何；生产、浏览器和最终独立门禁仍须以新资产重跑或继续开放。
