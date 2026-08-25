# 拉丁美洲文学地图 V2 独立审计报告

> 审计快照：2026-08-11  
> 审计角色：独立审计者（Sol）  
> 范围：V2 治理、V1 基线、Geo/Curation/Web Data、构建脚本、静态站点、QA 与发布候选。  
> 本文保留审计发现的原始快照；后续整改结果另记于文末，不倒改审计事实。

## A. 总体结论

**原始结论：不通过正式发布审核。**

V2-N1 至 V2-N3 的主要数据、网站和候选材料已经形成，Web Data 重建与候选文件哈希可对账；但地图可用性、分类语义、国家页聚合、sitemap 与发布候选锁定均存在 P1 问题。审计时的正式状态仍为 `V2-N4 = USER_REVIEW`，候选仅为 `V2.0.0-rc.1`，`release_state = pending_v2_n4`，不构成正式发布。

## B. V2 阶段过程复盘

| 阶段 | 结论 | 状态分类 |
|---|---|---|
| V2-N1 产品与治理 | Charter、任务与 DEC-040 授权链存在 | 已实现、已验证 |
| V2-N2 原型与 Web Data 契约 | Geo/Curation/Web Data 分层及 DEC-041—042 存在 | 已实现、已验证 |
| V2-N3 完整测试站 | 主路由与核心页面存在，但地图与国家页有实测缺陷 | 已实现、部分已验证 |
| 阶段 8 候选 | 12 文件清单、冻结时间与 SHA-256 自洽 | 已实现、已验证 |
| V2-N4 正式发布 | 仍待用户批准 | 待用户决定 |

## C. 文件与生成材料清单

审计覆盖：`project/governance/PROJECT_CHARTER.md`、`project/tasks/V2_TASKS.md`、V2 执行体系、产品总说明书、项目决策记录、`data/master/V1_MASTER.sqlite`、`data/v2/geo/`、`data/v2/curation/`、`data/v2/web/`、`scripts/build_v2_*.py`、`scripts/validate_v2_web_data.py`、`site/`、`.github/workflows/v2-pages.yml`、V2 QA 和发布候选材料。

发布候选原清单固定：V1 主库、两张 Geo 表、三张 Curation 表、两份 Web Data、`site/index.html`、`site/app.js`、`site/styles.css`、`site/README.md`，共 12 项。

## D. 数据血缘和数量对账

`validate_master.py data/master/V1_MASTER.sqlite` 的实际结果：144 entities、76 relationships、40 relation holds、238 facts、40 content cards、74 sources、13 gaps、91 relationship evidence；SQLite integrity 通过、外键错误为 0。

Web Data 实测：24 地点行、25 地点关系、51 条策展文案（47 auto approved / 4 hold）、19 selections、2 recommendations（1 user_review / 1 hold）、146 条搜索记录、43 条时间线记录。源 Web Data 的 `review_queue` 为 4 条 entries + 2 条 recommendations；临时公共部署包中该字段已移除。

固定 `generated_at` 在临时副本重建后，`site_data.json` 和 Web Data manifest 与审计快照哈希一致。原 12 项 release scope 的 SHA-256 也逐项匹配。

## E. 网站路由与功能核验

桌面与 390×844 移动端实际核验了首页、国家、地点、虚构空间、作者、作品、关联节点、搜索、时间线、研究缺口和 404；移动导航可展开，未见横向溢出或控制台错误。

但地图节点发生重叠，实测点击“墨西哥”可被上层“马孔多”截获；国家节点被错误导向普通地点页；国家页遗漏直接指向国家的关系；未知分类地点被标为现实地点；隐藏技术节点 Spain 可经搜索进入独立国家页。

## F. QA 命令和证据复核

| 命令或检查 | 结果 |
|---|---|
| `python3 scripts/validate_master.py` | 失败：缺数据库参数 |
| `python3 scripts/validate_master.py data/master/V1_MASTER.sqlite` | 通过 |
| 固定时间重建 Web Data | 通过，哈希一致 |
| `python3 scripts/validate_v2_web_data.py` | 通过 |
| 固定时间重建 release manifest | 通过，范围和哈希一致 |
| `node --check site/app.js` | 通过 |
| `git diff --check` | 通过 |
| 静态 HTTP 资源 | 主资源 200；sitemap 中三个 hash 路由 404 |

`build_v2_coverage_plan.py` 与 `build_v2_full_curation_drafts.py` 的 `--help` 会直接执行并写回。审计中曾触发该行为，随后按临时快照逐字节还原；最终未留下审计新增修改。

## G. 公开边界与发布准备核验

已验证：公共部署包不含 PDF、EPUB、OCR、`inputs/`、Cookie、密钥或 `review_queue`；工作流为手动触发，且有 HTTPS origin 门禁。

审计发现：工作流未校验 release manifest、会从当前分支重新构建；部署脚本复制根 `README.md`，而候选冻结的是 `site/README.md`；sitemap 写入了不存在的非 hash 路由；Git HEAD 尚未锚定 V2 内容；Parral 的官方地理来源前置条件仍未满足。

## H. 文档声称与实际实现的差异

- `project/tasks/V2_TASKS.md` 同时保留 N3 和 N4 的动态状态表述；
- `project/plans/V2_执行体系与任务清单.md` 仍引用不存在的 `V2_N3_TEST_SITE_REVIEW.md` 与 `V2_RELEASE_QA.md`，并写下一节点为 N2；
- 产品总说明书仍保留“下一节点 N2”的历史文字；
- 决策记录的总表只列至 DEC-042，正文已有 DEC-043、DEC-044；
- `V2_FULL_CURATION_DRAFTS_QA.md` 对 review queue 的数量表述少计一条 hold recommendation；
- N4 所要求的跨浏览器与性能实测没有证据。

## I. P0/P1/P2/P3 问题清单

| 编号 | 严重级别 | 状态分类 | 精确位置 | 事实证据 | 影响与建议 |
|---|---|---|---|---|---|
| P1-01 | P1 | 已验证 | `site/app.js` `mapPosition()` | 多个节点使用相同后备位置，点击命中错误节点 | 地图不可可靠探索；应做无重叠布局和点击测试 |
| P1-02 | P1 | 已验证 | `site/app.js` `bindHomeInteractions()`、`renderCountry()` | 国家节点走 `#/place`，直接国家关系未计入 | 修正路由和国家聚合 |
| P1-03 | P1 | 已验证 | `PLACES_GEO.csv` Ashgrove；`renderPlace()` | `unknown + hidden` 被标“现实地点” | 独立未知模板，不得确定化 |
| P1-04 | P1 | 已验证 | Spain 技术节点；Web Data 搜索构建 | hidden 技术父节点可搜索和打开 | 排除独立公开入口 |
| P1-05 | P1 | 已验证 | `build_v2_deploy_bundle.py` sitemap | `/search`、`/timeline`、`/about` HTTP 404 | sitemap 只列真实可访问 URL |
| P1-06 | P1 | 已验证 | Pages workflow、release manifest、deploy builder | 未锁定冻结候选，README 来源不一致 | 部署前验证哈希与状态，统一输入 |
| P1-07 | P1 | 外部依赖 | Parral Geo 行、`V2_MAP_DATA_QA.md` | 官方来源尚未补充 | 补源或从公共地图隐藏 |
| P1-08 | P1 | 仅文档声称 | N4 QA 条目 | 无跨浏览器、性能实测 | 补充实际 QA 证据 |
| P2-01 | P2 | 已验证 | `validate_v2_web_data.py` | 未校验多个语义与引用边界 | 扩展 validator |
| P2-02 | P2 | 已验证 | 两个生成脚本 | `--help` 会写回 | 加 argparse 与 dry-run |
| P2-03 | P2 | 已实现但未验证 | `site/app.js` 首次数据加载 | 首屏读取完整 Web Data | 做性能实测并视结果分包 |
| P2-04 | P2 | 已验证 | 任务、执行、决策文档 | 动态状态和索引漂移 | 清理 ACTIVE 文档 |
| P2-05 | P2 | 已验证 | Curation map_status override | 覆盖未在 QA 报告中显式输出 | 输出并校验 override |
| P3-01 | P3 | 已验证 | `site/app.js` hashchange | 路由变更未移动焦点 | 聚焦 main/标题 |
| P3-02 | P3 | 已验证 | `renderCountry()` | `dt/dd` 未包在 `dl` | 修正语义 |
| P3-03 | P3 | 已验证 | 审计 handoff 命令 | 漏写 V1 数据库参数 | 修正文档命令 |

## J. 对 V2-N4 的建议

**审计快照建议：暂缓。**

即便所有可修复问题完成，N4 仍须保留以下待决或外部事项：正式发布批准、HTTPS origin、Pages 部署、正式 tag/Release、公开 URL；并继续保留 13 个 research gap、40 个 relationship hold、4 个 curation hold entries、1 个 hold recommendation 和 1 个 user_review recommendation，不能改写为已确认。

## 整改记录

本报告保存后，仓库进入整改。整改只处理代码、构建、公开边界和文档一致性；不确认 research gap、hold、user_review 或未证实地点分类，也不执行部署、tag、Release 或公开 URL 发布。

### 2026-08-11 整改结果

| 原问题 | 整改结果 |
|---|---|
| P1-01 地图重叠 | 已加入稳定锚点和碰撞偏移，避免相同坐标的可点击节点重叠。 |
| P1-02 国家路由与聚合 | 国家节点走 `#/country`；国家页合并直接国家关系与可见子地点关系。 |
| P1-03/P1-04 分类与隐藏节点 | `unknown` 使用待确认模板；hidden 技术父节点不进入搜索或独立路由。 |
| P1-05 sitemap | 仅保留真实根 URL。 |
| P1-06 发布候选锁定 | rc.2 清单扩至 15 项；Pages 先重建、校验 Web Data、验证 SHA-256，并要求 `approved_v2_n4`。 |
| P1-07 Parral | 不补造来源；在官方来源补齐前从公开地图隐藏。 |
| P1-08 QA 证据 | 已完成代码、数据、HTTP 和移动布局回归；Safari、Firefox 与 Lighthouse 仍是 N4 前建议补充的独立环境验证。 |
| P2/P3 | 已加入更严格 validator、构建脚本 `--help` / `--dry-run`、路由焦点、语义 `dl`、文档状态和计数修正。 |

整改后的内部状态：`V2.0.0-rc.2`，`release_state = pending_v2_n4`，`V2-N4 = USER_REVIEW`。这不是正式发布；HTTPS origin、Pages、tag、Release 和公开 URL 仍待 USER 决定。
