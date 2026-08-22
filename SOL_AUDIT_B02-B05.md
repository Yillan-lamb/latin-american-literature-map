# SOL AUDIT — WEB-CE-B02 至 WEB-CE-B05

- 审计日期：2026-08-21
- 审计角色：Sol / 独立高级 Reviewer-Auditor
- 结论：**PASS WITH REMEDIATION**
- 整改 commit：`dea1003`（`fix(audit): remediate B02-B05 curation projection`）
- 正式主库：`data/master/V1_MASTER.sqlite`

> 范围说明：任务标题与交接材料明确指定 `B02—B05`，实际是四个完整 Batch。任务正文多处出现“五批”，本报告以可定位的 `WEB-CE-B02`、`WEB-CE-B03`、`WEB-CE-B04`、`WEB-CE-B05` 四批为唯一审计边界，不把 B01 或尚未开始的 B06 混入增长统计。

## Executive Conclusion

四批 Research 主体质量总体稳定，未发现 P0、数据库污染、重复实体、migration 冲突、来源等级逐批下降或解释性关系失真。四个 migration 可从 B01 Sol 基线顺序重放，重放数据库与当前主库的全部 Research 表逐表一致。

审计发现两项重要的跨层 P1 问题和三项 P2 问题，均已作最小差量整改：一是 B03 Research 已经收窄的萨瓦托职业表述被公共策展生成器重新扩写；二是 B02—B05 新增的五个地点共 20 个策展字段被错误标记为 USER 已批准。其余问题为 Geo 来源投影、审批时间戳和中文展示名状态登记。SQLite 无需修改，因此未创建无意义的 corrective migration；Luna 历史 migration 和审计记录均保持不变。

最终结论为 **PASS WITH REMEDIATION**。在落实本报告对下一组 Batch 的约束后，可以继续 B06；不得据此自动发布。

## Audit Scope

### Batch、commit 与 migration

| Batch | Luna commit | Migration | 审计范围 |
|---|---|---|---|
| WEB-CE-B02 | `fd325ea` | `0005_web_ce_b02.sql` | Research、Geo、Curation、Web、QA、Review |
| WEB-CE-B03 | `97fe225` | `0006_web_ce_b03.sql` | Research、Geo、HOLD、Curation、Web、QA、Review |
| WEB-CE-B04 | `d3c7ea6` | `0007_web_ce_b04.sql` | Research、Geo、research_gap、Curation、Web、QA、Review |
| WEB-CE-B05 | `286aff7` | `0008_web_ce_b05.sql` | Research、Geo、Curation、Web、QA、Review |

交接文档 commits：`86d14d8`、`a777f59`。比较基线：B01 Sol commit `e804f4e`。

审计没有只依赖 Batch Report。逐项读取了四批 Preflight、Research/Geo/Curation/Web change set、Review Result、Remediation、QA、migration 和 `SOL_AUDIT_HANDOFF_B02-B05.md`，并以 Git、当前 SQLite 和生成文件反算最终状态。

## Data Growth

### 四 Batch 变化矩阵（机器反算）

| Batch | 作者 | 作品 | Facts | Relations | Sources | Cards | Geo | Curation | Commit |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---|
| B02 | 3 | 9 | 39 | 12 | 10 | 12 | 2 节点 / 3 关系 | 14 个 PUBLIC_CONTENT 对象 | `fd325ea` |
| B03 | 3 | 9 | 41 | 12 accepted | 12 | 12 | 2 节点 / 3 accepted；另 1 SET_IN HOLD | 14 个对象 | `97fe225` |
| B04 | 3 | 9 | 42 | 12 | 12 | 12 | 1 节点 / 3 关系 | 13 个对象 | `d3c7ea6` |
| B05 | 3 | 9 | 42 | 12 | 12 | 12 | 复用巴西 / 3 关系 | 12 个对象 | `286aff7` |
| **合计** | **12** | **36** | **164** | **48 accepted** | **46** | **48** | **5 新节点 / 12 accepted 关系** | **53 个对象** | — |

补充说明：

- 新增实体共 53：12 位作者、36 部作品/合集、4 个现实国家节点、1 个虚构空间 Santa María。
- 新增 `card_sources` 94、`relationship_evidence` 51。
- 新增 HOLD 1：`V1-HOLD-0051`；新增 research_gap 1：`V1-GAP-0014`。
- 新增 disputed 0；新增 USER 明确批准 0。
- 三个传统 Curation CSV 本轮未新增行；“Curation 53”指 PUBLIC_CONTENT 中对应 53 个 target 对象，不等于 53 条已获批准的公开策展判断。
- 主库由基线 167 entities / 354 facts / 101 relationships / 128 sources / 63 cards，增长为 220 / 518 / 149 / 174 / 111。

## SQLite 与 Migration Integrity

- `PRAGMA integrity_check`：`ok`。
- `PRAGMA foreign_key_check`：0 条。
- `validate_master.py`：PASS；schema `0.3`。
- 当前正式表计数：220 entities、518 facts、149 relationships、174 sources、111 cards、210 card_sources、176 relationship_evidence、14 gaps、51 relation_holds。
- ID 唯一性、dangling fact subject、relationship endpoint、card subject、source reference、HOLD evidence：均未发现 B02—B05 问题。
- 规范化三元组 `subject_id + relation_type + object_id`：无重复。
- 作者、作品按去重音符号、标点、大小写、中文名、原名与别名规范化：未发现跨 Batch 重复或错误合并。
- 来源按 URL、题名/机构/年份及 source identity 检查：未发现同一来源被多个入口洗成独立证据。
- `migration_log` 为 0001—0008 连续序列；0005—0008 的登记 SHA 与文件一致。
- 复现性：从 B01 Sol 主库副本依次执行 0005—0008，验证 PASS；除 `migration_log.applied_at` 运行时间外，所有 Research 表内容 hash 与当前主库完全一致。

结论：**当前 SQLite 健康，四批没有在前批错误基础上形成数据库级连锁污染。**

## Research Quality

### 来源

- 46 个新增来源全部为 B 级；没有 C/D 来源进入本轮 Research，也没有后批来源等级下降。
- 对 46 个来源的身份、字段支持和引用映射全量核对；另对其中 25 个机构 URL 作现场重开，18 个成功读取正文或 PDF，7 个在当前网络环境返回 403、502 或连接重置。
- 当前无法重开的项目包括部分 Companhia das Letras、CONICET、Cervantes Virtual、BNDigital、Prefeitura 与 MEC 页面。它们在 Luna 的审查记录中曾可访问，且身份/引用映射可由交接材料与其他机构来源交叉确认；本轮不因临时反爬或站点故障删除正确数据，但将可访问性列为剩余风险。
- 未发现搜索摘要被当正文、D 类来源进入正式 Research、citation laundering，或“来源 A 被扩写成 A+B+C”的 Research 事实。

### Facts 与语义强度

- 所有新增文学运动、文学史地位、影响、主题等高解释强度内容均未被写成 accepted Research fact；Luna 在这四批采用了偏保守的书目/身份策略。
- 全量审阅 Reviewer 曾 REVISE 的内容。最终 Research 中萨瓦托为“作家、画家；受过物理学训练并曾任教”，基罗加三项书目正确区分 collection，阿连德原文版年份与英译版年份边界清晰。
- `V1-GAP-0014` 正确保留《莫雷尔的发明》1940/1941 首版年份冲突；当前 1940 为 medium confidence，不应在公共文案中伪装成无争议事实。
- B03 的《英雄与坟墓》1961/1962 差异已按阿根廷国家图书馆与 CONICET 的 1961 正式书目处理，并保留 review trail。
- 中文展示名与原文题名逐项配对，无错位、无同作双实体、无不同作品被中文同名误合并。
- 四批原先没有明确登记 roadmap 要求的 `display_name_status`。已在每批 Research Change Set 添加适用于全部 works 的默认政策：`provisional_title`，并明确其只是 reader-facing label，不构成中文版本书目声明。

### Relationships

- 48 条 accepted 关系全部复核：36 条 `CREATED`、12 条 `ASSOCIATED_WITH_PLACE`；方向、端点、relation type 与来源均正确。
- 本轮没有 accepted `INFLUENCED`、文学运动因果、政治事件因果或解释性主题关系，因而不存在用单一 C 类来源支撑强关系的问题。
- `V1-HOLD-0051`（《短暂的生命》 `SET_IN` Santa María）正确保持 `hold_needs_direct_scene_evidence`。现有来源只足以支持 Santa María 的文学空间身份，不足以把作品—空间关系正式准入。
- Santa María 为 fictional、hidden、无坐标；没有为地图展示而伪精确现实化。

## Cross-Batch Integrity

未发现作者、作品、来源或 accepted relationship 的跨批重复。B03 创建的乌拉圭与 B04复用、B02 创建的巴西与 B05 复用，均是正确复用而非重复建点。后批 migration 未覆盖或静默改写前批记录。

发现的跨层问题不是 Research 数据重复，而是 Curation/Web 生成逻辑继承了旧的全局日期和 USER helper，导致后续 Batch 的审批元数据被污染；该问题从 B02 开始持续至 B05，详见下文。

## Geo / Curation / Web

### Geo

- 4 个现实国家节点的身份、国家代码、行政层级与关系方向正确。国家多边形地图不依赖伪造点坐标，因此节点坐标为空是合理设计。
- Santa María 与现实乌拉圭严格区分，无现实坐标，作品关系保持 HOLD。
- 发现 `PLACE_RELATIONS.csv` 中阿连德—智利仍引用整改前的 `SRC-0133`，而正式 SQLite 已使用 `SRC-0134`；已对齐为 `SRC-0134` 并重建 Web Data。

### Research / Curation 边界

发现两项 P1：

1. B03 Research 已将萨瓦托身份收窄为“作家、画家；受过物理学训练并曾任教”，但公共策展生成器又写成“作家、画家和物理学家”。判定 `OVERSTATED`，已按 Research 强度降级。
2. B02—B05 新增的危地马拉、巴西、乌拉圭、Santa María、巴拉圭五个地点，各 4 个策展字段，共 20 项，被 `user_field()` 错标为 `auto_approved / reviewer=USER / 2026-08-14`。这些对象在 2026-08-20 才随 Batch 创建，不可能已在 8 月 14 日获 USER 批准。已全部退回 `user_review / UNREVIEWED`，不会进入正式 public layer。

同时修复：

- B02—B05 作者/作品字段原先统一写成 2026-08-14，早于 Batch；现统一改为真实审阅日 2026-08-20。
- 132 个低风险自动字段经本轮独立复核后标记 `CODEX-REVIEW`；其余 412 个字段继续为 `user_review / UNREVIEWED`。
- 比奥伊作者页明确提示《莫雷尔的发明》1940/1941 冲突。
- 删除《流放者》“成熟期短篇集”这一未由本轮书目来源直接支持的策展强度。

### 网站消费

- 四批 12 位作者和 36 部作品全部进入 search index，全部进入 timeline 数据，并有静态作者/作品页面。
- 危地马拉、巴西、乌拉圭、巴拉圭均进入国家页与地图聚合；Santa María 因作品关系仍为 HOLD 而保持 hidden，不进入公开搜索和地图，这是正确的 fail-closed 行为。
- 正式 public bundle：124 个文件、116 条路由、112 个公开实体；`review_queue_exposed=false`，public boundary validator PASS。
- Chromium desktop/mobile、Firefox desktop、WebKit mobile 共 56/56 测试通过；覆盖搜索、时间线、地图、国家页、作者/作品页、静态路由、移动导航、键盘访问及逐条 sitemap 页面。
- 因此不存在“Research 只留在 SQLite、网站完全未消费”的系统性问题。真正的缺口是多数长篇策展字段仍处于 `user_review`，读者页面主要依靠经批准的低风险书目型字段，内容深度增长小于 Research 数据增长。

## Coverage Audit

### 本轮分布

- 国家：巴西 4 位作者；阿根廷、智利、乌拉圭各 2；危地马拉、巴拉圭各 1。
- 性别：女性 1/12（伊莎贝尔·阿连德，8.3%）。
- 形式：36 部作品全部属于叙事散文方向；卡片层为小说 17、长篇小说 4、短篇/故事集 6、中篇 1，另有 B02 的 8 张作品卡 `genre_or_form` 为空。
- 本轮没有诗歌、戏剧或散文作品；女性、诗歌、加勒比、中美洲和安第斯覆盖仍弱。
- 地图新增主要是国家级入口和 1 个虚构空间，城市/地方层增长有限。

判断：本轮明显偏向南锥体/巴西与小说传统。该偏科与 B02—B05 roadmap 选择有关，不是事实质量失败，但如果继续同类顺序会加剧 60+ 计划的性别和体裁失衡。

建议不大改 roadmap：保留 B06 的 Vallejo、Darío、Martí，以补诗歌、安第斯、中美洲与加勒比；同时考虑把 B07 的 Pizarnik 或另一位女性诗人提前，或把 B06/B07 作为同一覆盖窗口验收。B02 遗留的 8 张空体裁卡在下一次内容维护时补齐，但不应在缺乏明确来源映射时由本审计猜填。

## Systemic Luna Findings

| 漂移类型 | 结论 | 起点与影响 |
|---|---|---|
| 来源漂移 | 未发现 | 46 个新增来源全部 B 级，后批未降级 |
| 表述漂移 | Research 未发现；Curation 轻度存在 | B03 萨瓦托公共文案重新增强，已修复 |
| Review 漂移 | 未发现 Research review 形式化 | 多批有实质 REVISE、HOLD、gap；review trail 可回查 |
| HOLD 漂移 | 未发现 | B03 保留 1 HOLD，B04 保留 1 gap，没有为完成率强行 accepted |
| Schema 漂移 | 未发现 | accepted relation types 均符合 schema |
| Curation 漂移 | **发现，系统性** | 从 B02 开始，新地点继承旧 USER helper，20 字段假性批准；已回溯 B02—B05 修复 |
| Geo 漂移 | 未发现标准下降 | 虚构空间 hidden、无坐标；仅 1 条 stale source mapping 已修复 |
| QA 漂移 | 轻度 | B05 QA 将 review-package 的 60 个 reading approaches 表述为 public curation；实际 public build 只消费 auto-approved |

总体判断：Luna 的 **Research 质量稳定且偏保守**，系统性问题集中在 Research 之后的 Curation 审批元数据和 QA 术语，而非来源或 SQLite。

## Findings 与 Remediation

| ID | 级别 | 判定 | 状态 | 整改 |
|---|---|---|---|---|
| SOL-B02B05-01 | P1 | MISCLASSIFIED / false approval | CLOSED | 5 新地点 × 4 字段退回 `user_review` |
| SOL-B02B05-02 | P1 | OVERSTATED | CLOSED | 萨瓦托公共职业身份与 Research 对齐 |
| SOL-B02B05-03 | P2 | stale Geo evidence | CLOSED | 阿连德—智利投影改用 `SRC-0134` |
| SOL-B02B05-04 | P2 | traceability date drift | CLOSED | B02—B05 字段日期与 reviewer 重建 |
| SOL-B02B05-05 | P2 | missing display-name status | CLOSED | 四批 Change Set 登记默认 `provisional_title` 与 basis |
| SOL-B02B05-06 | P2 | QA semantic mismatch | OPEN-DOC | B05 的“public”统计实为 review-package；不改写历史 QA，后续须分开报告 |
| SOL-B02B05-07 | P3 | 8 张 B02 作品卡体裁为空 | OPEN | 下一内容维护轮次按来源补齐 |
| SOL-B02B05-08 | P3 | 7 个机构入口当前受阻 | OPEN | 下一轮要求保存 canonical locator 或稳定镜像，不据临时 403 删除数据 |
| SOL-B02B05-09 | P3 | 覆盖偏科 | OPEN | B06 保留诗歌/区域纠偏，并前移女性诗人验收窗口 |

本轮没有 SQLite 数据修复，故没有 corrective migration；所有整改均位于生成器、可重建 Curation/Web 投影、Geo 映射及 Change Set 元数据，并由 commit `dea1003` 追踪。

## QA 与测试有效性

已重新执行：

- master validator、SQLite integrity、foreign keys：PASS。
- 四 migrations 独立重放与逐表 hash 对比：PASS。
- content quality validator：PASS（明确为 `review_package`，不是全量 public approval）。
- Web Data 固定时间戳连续两次 rebuild：字节一致；validator PASS。
- PUBLIC_CONTENT 连续两次 rebuild：字节一致。
- public deploy bundle 与 public boundary：PASS；审核队列未暴露。
- frontend JavaScript 与 browser spec syntax：PASS。
- Playwright 4 projects × 14 tests：56/56 PASS。
- targeted diff check：PASS。
- USER_REVIEW preview：可构建；它只用于人工预览，不等于 USER 批准。

测试没有 hard-code 旧作者/作品总数。浏览器测试会读取投影数量，并已有 B01—B05 新实体专项和全 sitemap 路由测试。需要改进的是 QA 报告口径：必须同时写明 `review_package` 数量与 `auto_approved_only` 正式公开数量，不能把前者称作 public。

## Remaining Risks / USER Decisions

需要 USER 决定的只有产品/策展事项，不涉及数据库抢修：

1. 是否审阅并批准 B02—B05 仍为 `user_review` 的重要策展字段；本审计没有代替 USER 批准。
2. 是否接受 B06 后将女性诗人提前到 B07 前段，或把 B06+B07 作为同一覆盖窗口验收。
3. 是否在后续维护轮次补齐 B02 的 8 个 `genre_or_form` 空值，并为当前受阻机构来源配置稳定 locator/镜像策略。

## Recommendation

可以安全继续下一组 Batch，但增加以下硬约束：

1. 新实体必须写入 `origin_batch` 或等价可审计元数据；`created_at/reviewed_at` 不得早于 Batch。
2. `reviewer=USER` 只能来自可定位的 USER 审批记录；生成器不得用 helper 自动赋予 USER 身份。
3. 每批同时报告 review-package 与 formal public 两套数量，禁止混称。
4. Curation 自动文案必须逐字段与最终 Research wording 对齐；Reviewer 的降级修改要有跨层回归检查。
5. Geo source ID 必须由 SQLite relationship evidence 自动投影或做一致性校验，避免手工 CSV stale mapping。
6. 对当前容易 403/502 的机构入口，保存 canonical URL、页面题名、访问日期和稳定替代入口。
7. B06/B07 覆盖门禁增加性别、诗歌、加勒比/中美洲/安第斯指标；不改写整体 roadmap，只调整验收顺序。

**最终建议：允许开始 B06，但不得自动 Public Release、GitHub Release 或 production deployment。等待 USER 决定。**
