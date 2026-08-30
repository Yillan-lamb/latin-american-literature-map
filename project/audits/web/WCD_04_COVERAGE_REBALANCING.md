# WCD-04 Coverage Rebalancing & External Audit Rebase

- Task: `WCD-04 Coverage Rebalancing`
- Date: `2026-08-30`
- Git baseline: `main@cbb0b571f61117166a6c2ddeb6ea95fac88dcea5`
- Research: `Data 1.3.1 development candidate` (unchanged)
- Web: `Web 0.3.1 — Development` (unchanged)
- Public Release: `PAUSED BY USER` (unchanged)
- Result: `PASS / DONE`
- Nature: decision-quality audit; no Research expansion, migration, Curation approval, Reader Content rewrite, frontend change, release or deployment

## 1. Executive Summary

当前最严重的问题不是实体数量不足，而是三层不均衡同时存在：

1. **已有内容没有转化为公开阅读体验。** 当前 2276 条策展审核记录中，`1723` 条仍为 `user_review`；61 位核心作者只有 25 位、168 部策展范围作品只有 60 部进入 Reader Content 公开范围。大量页面“看起来空”，首先是审核与公开准入问题，不是缺少 Research entity。
2. **关系数量增长没有解决语义单一。** WCD-02 将关系从 293 增至 306，并实质改善文学城市与作品空间，但 `CREATED=202`、`ASSOCIATED_WITH_PLACE=78`、`SET_IN=13` 仍占绝大多数。10 个 character 全部零关系，8 个 movement 没有 accepted relation，29 个 theme 只有 2 条 accepted relation，51 条 hold 原样存在。
3. **核心作者作品覆盖仍有少量高价值候选缺口。** 239 条外部候选完成当前 master 的精确题名 / 当前作者归属预检后，6 个 P0 与 49 个 P1 没有发现 exact current-master match。但它们只是 future Research candidates；语义重复、版本重叠与合集包含关系尚未解决，不能视为已批准新增。
4. **外部审计已有重要过期项。** Buenos Aires、Montevideo、Havana、Paris 以及《跳房子》双城关系已由 WCD-02 解决；中文展示名问题已由 WCD-03 的 371 实体全量矩阵取代。这些旧项不再进入当前 backlog。

因此，本轮正式确定顺序：

```text
WCD-05 Entity & Relationship Network Remediation
↓
WCD-06 Author & Work Descriptive Content Completion
↓
WCD-07 Major Works Research Expansion
```

WCD-07 已创建但保持 `LOCKED`；本轮不执行任何候选研究或迁移。

## 2. Current Baseline

### 2.1 Reproducible snapshot

| Item | Current |
|---|---:|
| Git | `cbb0b571f61117166a6c2ddeb6ea95fac88dcea5` |
| Research version | `Data 1.3.1 development candidate` |
| Web version | `Web 0.3.1 — Development` |
| Research Schema | `0.3` |
| Web Schema | `v2-web-0.2` |
| master SHA-256 | `4d90e7e49c58def1549be18af693685610983816d5113a1e5c91c9582937fb7c` |
| entities | 371 |
| facts | 998 |
| relationships | 306 |
| sources | 288 |
| content cards | 255 |
| gaps | 24 |
| relationship holds | 51 |
| source holds | 4 |
| migrations | 30; latest `0030_wcd03_chinese_display_names` |

### 2.2 Entity distribution

| Type | Count | Type | Count |
|---|---:|---|---:|
| work | 134 | collection | 69 |
| author | 64 | place | 35 |
| theme | 29 | character | 10 |
| movement | 8 | institution | 6 |
| person | 5 | event | 5 |
| adaptation | 4 | edition | 2 |

64 个 author 包括 61 位拉美核心作者与 3 位 influence/peripheral author。作品页研究范围为 134 work + 69 collection = 203。

### 2.3 Relationship distribution

| Relation | Count |
|---|---:|
| `CREATED` | 202 |
| `ASSOCIATED_WITH_PLACE` | 78 |
| `SET_IN` | 13 |
| `ADAPTED_FROM` | 4 |
| `DIRECTED` | 3 |
| `EXPLORES_THEME` | 2 |
| `EDITION_OF` | 2 |
| `CONTAINS_WORK` | 1 |
| `BASED_ON_EVENT` | 1 |

51 条 hold 为 `EXPLORES_THEME 31 / ASSOCIATED_WITH_MOVEMENT 14 / SET_IN 3 / INFLUENCED_BY 3`。WCD-04 未释放 hold、未补第二来源、未新增 relation type。

### 2.4 Curation and Web

当前独立审核记录口径为：三个 Curation CSV、`PUBLIC_CONTENT` 包装字段与 Presentation 条目各计一条。

| Status | Count |
|---|---:|
| `auto_approved` | 527 |
| `user_review` | 1723 |
| `hold` | 26 |
| Total | 2276 |

当前 formal public scope：25 authors / 60 works / 32 places / 2 nodes。Web Data 页面范围为 64 authors / 203 works-and-collections / 38 map nodes；`search_index=119`、`timeline=269`。这些口径分别表示公开阅读范围、研究页面范围与技术地图范围，不应混用。

## 3. External Audit Rebase

34 个标准化 finding 已写入 `WCD_04_EXTERNAL_AUDIT_REBASE.csv`：

| Status | Count |
|---|---:|
| `RESOLVED` | 5 |
| `PARTIALLY_RESOLVED` | 1 |
| `STILL_VALID` | 23 |
| `CHANGED` | 3 |
| `SUPERSEDED` | 1 |
| `DEFER` | 1 |

### 3.1 Resolved by WCD-02

- Buenos Aires、Montevideo、Havana、Paris 已成为 Research place 与 Geo node，并有 accepted relationships；
- 《跳房子》已建立 Buenos Aires + Paris 两条 `SET_IN`；
- city/region 作者地点覆盖和作品地点关系得到实质改善，但城市文学空间总体覆盖只判为 `PARTIALLY_RESOLVED`。

### 3.2 Superseded by WCD-03

外部报告中的中文译名/展示名线索不再作为当前 backlog。WCD-03 已对全部 371 个实体作正式审计，执行 11 个替换、保留 2 个 alias/多版本治理项，并维持稳定 ID。后续名称判断以 WCD-03 矩阵为准。

### 3.3 Still current

- `1723 user_review` 积压没有下降；
- 10 character 零关系、movement/theme 网络不足和 51 holds 未改变；
- 6 P0 / 49 P1 major-work candidates 尚未进入 Research Master；
- collection/work hierarchy、thin Research、女性诗歌、戏剧、19 世纪及 post-Boom 世代连续性仍需后续判断。

## 4. Geographic Coverage

| Region/tradition | Conclusion | Current reading |
|---|---|---|
| Mexico | `STRONG` | 作者、时期与体裁入口相对完整；不需要以数量为理由继续扩张 |
| Río de la Plata | `STRONG` | 作者最密集；WCD-02 已补 Buenos Aires / Montevideo 与《跳房子》双城关系 |
| Brazil | `ADEQUATE` | 葡语文学入口成立，但 Brazilian Modernism 的历史链条仍偏薄 |
| Andes / Chile | `ADEQUATE` | 诗歌与小说都有核心锚点；秘鲁女性传统和若干代际仍不显著 |
| Caribbean | `ADEQUATE` | 古巴作者群可见，Havana 已补；movement/theme 解释层仍弱 |
| Colombia / Venezuela | `THIN` | 哥伦比亚高度集中于 GGM；委内瑞拉入口单薄 |
| Central America | `THIN` | 危地马拉、尼加拉瓜有锚点，但区域传统连续性不足 |
| 当前空白国家/地区 | `DEFER` | 国家空白不自动产生“每国一位作者”任务 |

当前判断是：哥伦比亚非 GGM 传统、Central America 与 Brazilian Modernism 具有未来研究价值，但均只登记为 `FUTURE AUTHOR COVERAGE CANDIDATE`，不创建 Batch 18，也不在 WCD-07 混入作者扩张。

## 5. Period / Generation Coverage

- colonial 由索尔·胡安娜提供单一但重要锚点；
- 1700—1870 的作品时间段仍近乎空白，19 世纪浪漫主义、高乔文学与独立后传统形成有文学意义的断层；
- modernismo、vanguardia、regionalismo、Boom 是当前最强部分；
- post-Boom、dictatorship/exile 有若干强作者，但 1950—1960 出生世代链条稀薄；
- McOndo / Crack 相邻世代与 contemporary 入口存在但不连续。

结论：1950—1960 出生世代的稀薄不是凭直方图即可决定“加人”的硬缺口，但与 19 世纪断层结合后，足以成为 P2 定向研究候选。优先研究“缺失的文学转折与传统”，而不是补齐每个年代格子。

## 6. Genre / Form Coverage

| Form | Conclusion |
|---|---|
| novel / short story | `STRONG`，当前主干 |
| poetry | `ADEQUATE`，但女性诗歌谱系与部分地区传统不可见 |
| essay | `THIN`，已有帕斯、加莱亚诺等锚点，近期不必追求数量 |
| chronicle / testimonio | `THIN`，文学史价值明确但产品优先级低于 reader-content recovery |
| drama | `MEANINGFUL_GAP`，当前近乎不可见，是最明确的体裁结构缺口 |
| memoir / autobiography / hybrid | `THIN`，应通过高价值作品选择补充，不单设数量 KPI |

戏剧是未来作者/作品覆盖中最值得专门核验的体裁缺口；testimonio、chronicle、essay 与 hybrid writing 保持 P2 候选，不在本轮执行。

## 7. Gender / Literary Tradition

当前 61 位核心作者中女性 14 位。此数字不构成比例 KPI。真正的问题是：

- 女性诗歌谱系缺乏 Storni、Ibarbourou、Agustini、Meireles 等相邻传统入口；
- 古巴、秘鲁、哥伦比亚女性文学传统在当前作者层不可见；
- 已有女性作者更多集中于小说/短篇与少数国家，容易使读者把女性写作理解成孤立个体而非文学传统。

结论为 `MEANINGFUL_GAP / P2 FUTURE AUTHOR COVERAGE CANDIDATE`。未来研究必须按文学史谱系选择，不按性别比例机械补人。

## 8. Major Author / Work Coverage

### 8.1 Rebase result

外部 239 条候选已全部重新执行本轮允许的轻量预检：

- 当前 master 精确题名匹配；
- 作者 `CREATED` 归属匹配；
- WCD-03 当前作者名映射；
- collection/work/edition 边界风险提示。

结果仍为：P0 6 / P1 49 / P2 85 / P3 65 / DEFER 34，精确题名 / 当前作者归属预检命中为 0。`already_in_db=no_exact_current_master_match` 只表示未发现相同作者下的 exact-title current-master match，不表示语义上不存在重复。语义重复、版本重叠、合集包含关系及外部来源完整性均未在 WCD-04 核验；239 行统一标为 `SOURCE_REVERIFY_IN_WCD07`，由 WCD-07 执行完整治理。

### 8.2 WCD-07A P0 candidates

1. 卡洛斯·富恩特斯 — *Terra Nostra* / 《我们的土地》；
2. 塞尔希奥·皮托尔 — *El arte de la fuga* / 《逃逸的艺术》；
3. 何塞·马蒂 — *Versos libres* / 《自由的诗》候选译名；
4. 马里奥·巴尔加斯·略萨 — *La fiesta del Chivo* / 《公羊的节日》；
5. 何塞·玛丽亚·阿格达斯 — *El zorro de arriba y el zorro de abajo* / 《山上的狐狸与山下的狐狸》候选译名；
6. 若热·亚马多 — *Terras do sem-fim* / 《无边的土地》。

`P0` 只表示 highest-priority research candidate，不表示 USER 已批准新增。WCD-07 必须重新走 duplicate/source/overlap/reviewer/migration 全链路。

## 9. Relationship Coverage

详细路由表包含 371 个当前实体 + 51 条 holds，共 422 行。

| Network state | Count | Main composition |
|---|---:|---|
| zero-degree | 61 | theme 27、character 10、movement 8、institution 6、event 4、author 3、person 2、place 1 |
| weak-degree | 225 | work 119、collection 67、place 27，其余 12 |
| connected | 85 | author 58、work 15、place 7，其余 5 |

实体路由优先级为：P0 10 / P1 79 / P2 201 / P3 11 / DEFER 70；另有 51 条 relationship hold 全部为 P1。P0 仅用于 character schema / foundational relation，P1 用于 holds 与核心零连接、高价值缺口，P2 是普通弱连接语义多样性复核，P3 是外围 author/person/institution 必要性复核。

“weak” 表示 degree≤1 或语义类型只有 1 种，是审计入口，不等于 P1，也不等于必须补关系。WCD-05 必须为每个高价值实体给出 `accepted / legitimate-isolated / hold / defer` 判断；已经完成有限功能、人工加密无额外价值的节点应保持 DEFER，不能以消灭孤立节点为 KPI。

WCD-05 正式范围扩展为 **Entity & Relationship Network Remediation**：zero-degree、weak-degree、character schema/network、movement、theme、event、holds、peripheral author/person、fictional place 和剩余高价值地点关系统一进入同一治理任务。

## 10. Reader Content Coverage

### 10.1 Primary fields

- 61 位核心作者：`reader_lede = 15 auto_approved / 46 user_review`；
- 168 部策展范围作品：`story_intro = 60 auto_approved / 108 user_review`；
- formal Reader Content：25 authors / 60 works。

### 10.2 All current author/work/collection/place rows

`WCD_04_DESCRIPTION_ROUTING.csv` 覆盖 64 author + 134 work + 69 collection + 35 place = 302 行：

| Classification | Count |
|---|---:|
| `PUBLIC_STRONG` | 25 |
| `PUBLIC_BASIC` | 23 |
| `PUBLIC_BIBLIOGRAPHIC_COPY` | 45 |
| `USER_REVIEW_HIGH_JUDGMENT` | 150 |
| `USER_REVIEW_LOW_JUDGMENT` | 5 |
| `MISSING` | 26 |
| `RESEARCH_INSUFFICIENT` | 23 |
| `HOLD` | 5 |

对外部审计的“9 authors + 36 works”做了当前文本语义复核；三条未进入旧 224 行 description CSV、但在旧报告总数中明确计入的 B03 作品也重新抽样，仍属于书目元数据转写。因此当前正式确认仍为 45 行，路由 `WCD-06B REWRITE`。

WCD-06 分为：

- 06A Reader Content Review Queue Recovery；
- 06B Bibliographic-copy Rewrite；
- 06C Core Zero-content Work Remediation；
- 06D Author Profile / Literary Connections；
- 06E Research Gap Handoff。

## 11. Thin Research

事实少不是自动补研究的理由。本轮使用三类判断：

- **thin but acceptable**：书目节点、edition/adaptation、低页面价值关联实体，能够完成其有限功能；
- **thin and high-value**：核心作者/作品、重要文学空间或未来 WCD-07 candidate，薄研究直接阻碍读者内容或关系；
- **thin and misleading**：有公开 bibliographic-copy、却缺少对象特异 reader content 的 45 行，以及会让页面看似“已有导语”但实际只重复目录信息的对象。

302 行 description routing 中 23 行被标为 `RESEARCH_INSUFFICIENT`。这些项目先进入 WCD-06E handoff，不得通过直接写作补平。

## 12. Current Priority Matrix

正式矩阵共 17 个决策单元：P0 4 / P1 5 / P2 5 / DEFER 1 / RESOLVED 2。最高优先级是：

1. 1723 条 review queue 的分层恢复；
2. 45 行 bibliographic-copy 重写；
3. character schema/network；
4. 6 个 canonical major-work research candidates。

完整 finding、evidence、blocking、route 与 notes 见 `WCD_04_COVERAGE_PRIORITY_MATRIX.csv`。

## 13. Routing

### WCD-05 — READY

- 422 行 network/hold routing；
- 61 zero-degree 与 225 weak-degree 逐实体判断；
- character、movement、theme、event、holds、peripheral author/person、fictional place；
- 剩余高价值 city/place gaps；
- 需要时先提交最小 Schema Extension Proposal。

### WCD-06 — LOCKED

- 302 行 description routing；
- 1723 条 review queue；
- 45 行 bibliographic-copy；
- 26 missing、23 research-insufficient、5 hold；
- 低判断与高判断内容分开处理。

### WCD-07 — CREATED / LOCKED

- WCD-07A: 6 P0 canonical omissions；
- WCD-07B: 49 P1 high-impact candidates；
- WCD-07C: 85 P2 + 65 P3 optional candidates，实际执行前必须再裁剪；
- 34 DEFER 不排期；
- 数据层级/重复治理必须先于相关迁移。

## 14. Coverage Expansion Candidates

以下只登记为 `FUTURE AUTHOR COVERAGE CANDIDATE`：

- 19 世纪浪漫主义 / 高乔文学与独立后传统；
- drama；
- 女性诗歌谱系；
- Colombia beyond GGM；
- Central America；
- Brazilian Modernism；
- post-Boom / McOndo / Crack 相邻世代连续性。

不创建作者、不新增作品、不创建 Batch 18、不新增 WCD-08。

## 15. Version and Semantic-output Guard

- Research: `Data 1.3.1 development candidate` unchanged；
- Web: `Web 0.3.1 — Development` unchanged；
- Public Release: `PAUSED BY USER` unchanged；
- master DB SHA-256 before/after identical；
- 本 PR 不包含 `data/master/`、`migrations/`、`data/v2/curation/`、`data/v2/web/` 或 `site/` 的语义内容变化。

## 16. Validation

| Gate | Result | Evidence |
|---|---|---|
| Master validation | `PASS` | Schema 0.3; integrity `ok`; 0 foreign-key errors |
| Migration replay | `PASS` | 30 migrations; 19 tables equal; integrity `ok` |
| Current Web Data validation | `PASS` | 371/998/306/288/255 counts; `v2-web-0.2` |
| Curation/content-quality validation | `PASS` | 61 authors / 168 works / 25 places; readiness rules pass |
| Current public bundle rebuild | `PASS` | temporary development-preview build: 128 routes / 119 public entities / no review queue or forbidden governance keys |
| Checked-in historical `dist/` | `FAIL / DEFER` | current validator finds stale `content_zh` / `reviewer` keys; this confirms the old external deployment-staleness finding and is prohibited from repair while Public Release is paused |
| Audit CSV width/count/ID references | `PASS` | 34 / 17 / 422 / 302 / 239 rows; all entity and hold IDs resolve |
| Exact-title / current-author precheck | `PASS` | 239/239 prechecks complete; no exact current-master match under the current author. Semantic duplicate, edition overlap and collection containment remain for WCD-07 |
| Semantic-output guard | `PASS` | master SHA unchanged; no Research/Curation/Web/site semantic files changed |
| `git diff --check` | `PASS` | no whitespace errors |

`dist/` 的失败不是 WCD-04 引入的回归，也不阻断本审计交付：以当前 Web Data 在临时目录重建的 public bundle 已通过同一 validator；仓库内历史 `dist/` 保持不动，待 USER 重新开启 Public Release 后按 Research → Curation → Web Data → dist → QA 全链重建。

## 17. Deliverables

- `WCD_04_COVERAGE_REBALANCING.md`
- `WCD_04_EXTERNAL_AUDIT_REBASE.csv` — 34 rows
- `WCD_04_COVERAGE_PRIORITY_MATRIX.csv` — 17 rows
- `WCD_04_RELATIONSHIP_ROUTING.csv` — 422 rows
- `WCD_04_DESCRIPTION_ROUTING.csv` — 302 rows
- `WCD_04_MAJOR_WORKS_PRIORITY.csv` — 239 rows
- `project/tasks/V2_TASKS.md` — WCD-04 DONE; WCD-05 READY; WCD-06/WCD-07 LOCKED

外部 `work/external-ai/` 文件只作为 candidate input，未进入 Research Master，也不纳入正式提交。
