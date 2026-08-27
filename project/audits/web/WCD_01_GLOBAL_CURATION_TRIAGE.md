# WCD-01 Global Curation Triage

- 执行日期：2026-08-27
- Git 基线：`origin/main@895e7b2`
- Research 基线：`Data 1.2.0 candidate`
- Research DB SHA-256（前后相同）：`95e72dbf80a6d0f3dc8619979a34ff36582832175a0006bdcf1cf49b06fbb1ec`
- Web 基线：`Web 0.2.0 — Development Baseline`
- Web 结果：`Web 0.2.1 — Development`
- Public Release：`PAUSED BY USER`（未改变）

## 1. 执行摘要

本次完整遍历三个 Curation CSV、`PUBLIC_CONTENT.json` 的全部包装字段、B06—B17 策展 changeset、Presentation Data、Web Data、三个 review queue 以及 public bundle。Research 主库未修改，也未新增作者、作品、事实、关系、路径或文学文案。

审核恢复了 21 条已有明确 USER 决定、但 Presentation 状态仍误留为 `user_review` 的记录：16 条与 USER 已批准包装字段逐字一致的 `why_read`，以及 `PATH-006`—`PATH-010` 五条由 USER 指定文件提供的完整首页路径。其余不一致或没有逐条批准证据的判断继续留在审核层。另修复 `V2-CUR-ENT-015` 将研究关系 ID 误写进 `source_refs` 的引用分类错误，并增加持续门禁。

## 2. 审核前统计

统计单位为独立审核记录：CSV 行、`PUBLIC_CONTENT` 包装字段、Presentation 条目各计一条。

| 状态 | 数量 |
|---|---:|
| `auto_approved` | 498 |
| `user_review` | 1744 |
| `hold` | 26 |
| 合计 | 2268 |

### 2.1 数据源与对象分布

| 数据源 | 对象/记录分布 | 状态分布 |
|---|---|---|
| `CURATION_ENTRIES.csv` | author 13；work 20；place 19；fictional_space 2 | auto 50；hold 4 |
| `CURATION_SELECTIONS.csv` | author 4；work 6；country 3；place 4；fictional_space 2 | auto 19 |
| `CURATION_RECOMMENDATIONS.csv` | work 2 | user_review 1；hold 1 |
| `PUBLIC_CONTENT.json` | author 61 / 599 字段；work 168 / 1452 字段；place 25 / 100 字段 | auto 424；user_review 1706；hold 21 |
| `PUBLIC_PRESENTATION.json` | homepage path 10；timeline 5；why_read 17；next_reads 10 | auto 5；user_review 37 |

CSV 字段分布：`page_lede` 13、`one_line_summary` 20、`literary_place_note` 19、`fictional_space_note` 2；`featured_author` 4、`featured_work` 6、`map_status` 9；`next_read` 1、`thematic_path` 1。

### 2.2 PUBLIC_CONTENT 字段分布

下表顺序均为 `auto / user_review / hold`；省略的状态为 0。

| 对象 | 字段分布 |
|---|---|
| author | reader_lede 15/46/0；why_know 10/47/4；literary_profile 0/25/0；literary_features 15/46/0；start_here 10/51/0；core_themes 10/51/0；literary_connections 0/25/0；reader_fit 10/51/0；signature_keywords 10/51/0；reading_route 10/51/0；guiding_question 10/48/3 |
| work | story_intro 60/108/0；reading_premise 0/69/0；why_read 17/151/0；narrative_features 43/26/0；theme_explanations 17/150/1；literary_significance 0/69/0；reading_tips 17/48/4；reading_approach 17/147/4；guiding_question 17/147/4；next_reads 17/151/0；location_note 43/125/0 |
| place | literary_intro 19/5/1；spatial_meaning 19/6/0；reader_path 19/6/0；exploration_route 19/6/0 |

## 3. 审核规则

- `auto_approved`：仅接受可回溯到已审核 Research/Source、没有超出依据且主要属于事实转写或低判断展示的内容；高判断内容还必须有明确 USER 批准记录。
- `user_review`：阅读推荐、入门排序、读者匹配、跨作品比较、主题路径、强文学解释和批评性问题默认留审；证据充分不自动等于策展判断获批。
- `hold`：引用悬空、证据不足、表达超出证据、现实/虚构边界不清、证据层级错误或依赖当前 research gap 的内容不得进入公开层。
- USER 决定优先：只按可定位的历史记录恢复状态；内容不一致时保留审核状态并登记冲突，不自行替 USER 作新的文学判断。

## 4. 审核结果

| 状态 | 审核后 | 变化 |
|---|---:|---:|
| `auto_approved` | 519 | +21 |
| `user_review` | 1723 | -21 |
| `hold` | 26 | 0 |
| 合计 | 2268 | 0 |

Web Data 仍严格分区：普通 public 只含 `auto_approved`；`user_review` 与 `hold` 只进入内部 review queue。新增验证会阻止高判断包装字段在没有 `reviewer=USER` 时自动公开，也会检查 Curation、PUBLIC_CONTENT 与 Presentation 的 Research/Source 引用是否真实存在。

## 5. 状态变更矩阵

| Before \ After | auto_approved | user_review | hold |
|---|---:|---:|---:|
| auto_approved | 498 | 0 | 0 |
| user_review | 21 | 1723 | 0 |
| hold | 0 | 0 | 26 |

`user_review → auto_approved` 的 21 条不是机械升级：

- `WHY-001`—`WHY-008`、`WHY-010`—`WHY-017` 共 16 条，与 `PUBLIC_CONTENT.works[*].why_read` 中已有 `reviewer=USER`、`reviewed_at=2026-08-14` 的批准内容逐字一致；
- `PATH-006`—`PATH-010` 共 5 条，来自 USER 指定文件，且历史审核明确说明只有为既有前五条路径补写的五个问题尚待审核。

冲突保护：`WHY-009` 与已批准包装字段存在措辞差异，10 条 Presentation `next_reads` 与已批准包装字段的理由也不一致，故全部继续 `user_review`。

## 6. USER_REVIEW 队列

### P1：首页核心路径

- `PATH-001`—`PATH-005`：路径主体已有 USER 输入，但最终 guiding question 是 Codex 新增判断；建议只审核这 5 个问题。

### P2：重点作品继续探索

- `WHY-009`：决定保留旧版“两个世界相遇”，还是采用已批准包装字段的“不平等并置”版本。
- `NEXT-001`—`NEXT-010`：旧版推荐理由与已批准 `PUBLIC_CONTENT.next_reads` 不同；建议成组选择保留、替换或继续不公开。
- `V2-CUR-REC-001`：跨作品 next-read 推荐继续单独审核。

### P3：一般策展增强

- `PUBLIC_CONTENT` 仍有 1706 个包装字段处于 `user_review`，主要来自扩展批次的作家/作品长文案与推荐字段。建议未来按页面批次抽取高价值子集，不要求 USER 一次性审核全部内容。

## 7. Hold / WCD-02 Research Gap

当前 26 条 hold 全部保留。其中需要后续研究支持的重点为：

- 作品 `V1-ENT-0034`、`V1-ENT-0036`、`V1-ENT-0040` 的一句话简介证据不足；
- 地点 `V1-ENT-0008` 的地点分类尚未完成；
- `V2-CUR-REC-002` 的 thematic path 属于跨作品比较，现有依据不足；
- 7 位 research-basic 作者、9 部 research-basic 作品与 1 个 research-basic 地点仍有低价值模板字段被 hold，需作品级或地点级证据后再写作。

这些项目登记为 WCD-02 或独立 Research Change Set 输入；本任务未修改 Research DB，也未提前研究。

## 8. Public Bundle 影响

- 新进入 public：21 条 Presentation 记录（5 条首页路径、16 条作品 why_read）。
- 退出 public：0 条。
- 页面影响：首页新增 5 个已批准阅读路径入口；16 个重点作品的 Presentation why_read 可进入公开消费；时间线、作者/地点 Reader Content 与 Research 数据不变。
- 引用影响：`V2-CUR-ENT-015.source_refs` 移除误放的 `V1-REL-0034`，关系引用仍保留在 `research_refs`；公开 evidence 字节相应修正。
- 版本结果：public semantic output 与字节均变化，因此按治理规则升级为 `Web 0.2.1 — Development`。

## 9. 验证与确定性

完成门禁包括 Research DB、PUBLIC_CONTENT 构建与内容质量、Web Data 构建与引用/状态验证、public bundle 边界、单元测试、前端语法、浏览器 QA、差异检查。构建固定使用 `generated_at=2026-08-27T12:00:00Z`；同一输入二次构建必须得到相同语义与相同文件哈希。最终结果见任务源与本次验证记录。

## 10. 后续边界

`WCD-02 Literary Space & Relationship Deepening = READY / NOT STARTED`。`V2-PUBLIC-RELEASE` 继续暂停；本次不创建 tag、GitHub Release 或 production deployment。
