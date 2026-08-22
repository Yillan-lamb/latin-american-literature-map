# SOL AUDIT B11—B15

审计日期：2026-08-21

审计人：Sol / `CODEX-SOL-AUDIT`
审计范围：`WEB-CE-B11`—`WEB-CE-B15`

## Executive Conclusion

**PASS WITH REMEDIATION**

B11—B15 的最终 Research 主体可以保留：未发现 P0、重复作者/作品、错误关系方向、现实/虚构空间混淆或解释性关系越界。五个 Luna migration 可从 B10 审计后基线连续重放，重放结果与审计前正式主库的全部业务表逐行一致。

本轮发现 4 项 P2：B14 一处年份—作品错配、B15 两处未核实年份线索的策展表述/来源映射问题，以及从 B11 开始缺少批次专项浏览器断言。四项均已差量修复；没有改写 `0016`—`0020` 历史 migration。

## Audit Scope

- 基线：`484d6b6`（B06—B10 Sol remediation 后状态）
- B11 commit：`7b26f86c37183af765ae5f0a2909722b92b5bee6`
- B12 commit：`20a27eec5b2c0a69c6fb62b4ce42711c3f870c9d`
- B13 commit：`a8f777ec78d30664d8d8b697c8ee8e6c618266b4`
- B14 commit：`566fe5a038c512d87ddabc9eaf7317d444e522f0`
- B15 commit：`5715af84cc5826401519dc92c6377ad9482a97be`
- Luna handoff：`1b2a4c1`
- Luna migrations：`0016`—`0020`
- Sol corrective migration：`0021_sol_audit_b11_b15_remediation.sql`
- 审计材料：每批 Preflight、Research Change Set、Review、Remediation（如有）、Curation、QA、Final Report，以及 Git diff、当前 SQLite、Geo、Web Data、preview 与测试代码。

## Data Growth

以下数字来自基线 SQLite、逐批 migration replay、当前 Geo/Curation 文件和 Git，而非 Batch Report 手写统计。

| Batch | 作者 | 作品 | Facts | Relations | Sources | Cards | Geo | Curation | Commit |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| B11 | 3（普伊格、奥坎波、阿尔特） | 9 | 53 | 12 | 6 | 12 | 3 | 12 实体 / 90 字段 | `7b26f86` |
| B12 | 3（施韦布林、恩里克斯、桑布拉） | 9 | 33 | 12 | 10 | 12 | 3 | 12 实体 / 90 字段 | `20a27ee` |
| B13 | 3（柯艾略、德鲁蒙德、纪廉） | 9 | 34 | 12 | 6 | 12 | 3 | 12 实体 / 90 字段 | `a8f777e` |
| B14 | 3（莱萨马、卡夫雷拉·因凡特、索尔·胡安娜） | 9 | 34 | 12 | 7 | 12 | 3 | 12 实体 / 90 字段 | `566fe5a` |
| B15 | 3（里贝罗、萨埃尔、阿雷纳斯） | 9 | 36 | 12 | 7 | 12 | 3 | 12 实体 / 90 字段 | `5715af8` |
| **合计** | **15** | **45** | **190** | **60** | **36** | **60** | **15** | **60 实体 / 450 字段** | — |

其他状态：

- 新增现实地点：0；新增虚构空间：0。
- HOLD：0；新增 open research gaps：6（B12 5、B15 1）。
- `research_gap` / `bibliographic_hold`：5；`bibliographic_dispute`：1。
- `disputed`：1 个作品年份轨迹（《格洛萨》）；正式年份仍以 1986 medium 记录。
- `user_review`：60 个作者/作品 Curation 实体、450 个字段；全部 reviewer=`UNREVIEWED`。

## SQLite and Migration Integrity

- 审计前主库：341 entities、919 facts、269 relationships、258 sources、231 cards、22 gaps、20 migrations。
- `PRAGMA integrity_check=ok`；foreign-key check 0 条。
- master validator PASS；主键唯一、fact/card/source/relationship endpoint 引用均可解析。
- 从 `484d6b6` 的 SQLite 副本依次应用 `0016`—`0020`，每个 migration 均成功；除 `migration_log.applied_at` 外，最终全部业务表与审计前正式主库逐行一致。
- B14 对 B13 纪廉古巴节点的跨批纠正最终方向正确，未发现后续批次继续沿用旧错误端点。
- 新 corrective migration `0021` 先在副本 dry-run 和正式应用，再进入主库；应用后 migration log 为 21 条，fact_sources 为 944 条。

## Cross-Batch Integrity

### Entities

- 对全部实体执行中文名、原文名、去重音/大小写/标点的规范化查重；B11—B15 未发现重复作者或重复作品。
- 全库唯一的同原文题名候选 `Bestiario` 经关系端点复核，分别属于科塔萨尔与阿雷奥拉，是不同作者的同名作品，不是重复实体。
- 45 部作品均保留原文题名；全部中文名保持 `provisional_title`，没有冒充正式中译本。

### Sources

- 36 个新增来源：A 5、B 30、C 1、D 0；`access_limited` 2，其余 `access_pass`。
- DOI/ISBN/persistent ID/canonical URL 未发现 B11—B15 重复编号。
- B14 的唯一 C 类来源 `SRC-0249` 仅承担基础身份/书目支持；其 1974/1987 双列问题已在 Research 中降为 medium provisional，没有承担高解释强度判断。

### Relationships

- 60 条新增关系全部为低风险 `CREATED` 或作者—国家 `ASSOCIATED_WITH_PLACE`；没有 `INFLUENCED`、运动归属、历史事件因果或主题解释性关系。
- 规范化三元组没有重复；subject/object 方向正确；relation type 均在现有 Schema 内。

## Research Quality

### Source reopening

对 B12—B15 所有曾 `REVISE` 的来源轨迹、两个 access-limited 来源、唯一 C 类来源、全部 Geo 关系及 6 个 gap/dispute 做了全量回查；B11 和普通低风险事实按批抽样。

独立打开结果与最终 Research 基本一致，例如：

- 阿根廷官方资料明确列出 Saer 的 `El limonero real (1974)`、`El entenado (1983)`、`Glosa (1986)`。
- 秘鲁外交部文化机构明确区分《无言之词》1973 年的两卷汇编版本与其中更早出版的故事集。
- Cardiff 学术条目直接支持 Arenas 前两部小说及 1967/1968 年；安蒂奥基亚大学文章支持《夜幕降临前》1992 年西语原版与自传分类。
- Academy of American Poets 直接支持《美洲的表达》是 1957 年五场讲演系列，最终 Research 使用“讲演系列”，没有恢复为偏强的“文化随笔”。

### Semantic verdict

- 文学主题、文学运动、文学史定位、影响关系和政治因果没有进入本轮正式 Research。
- B11—B15 Research 中未发现 `OVERSTATED`、`UNSUPPORTED` 或 `MISCLASSIFIED` 的正式事实需要删除。
- `V1-GAP-0022` 继续判为 open research；1985 仍是未定位 discovery lead，不作为正式来源。1986 有两个可回查来源，保持 medium 是保守且可接受的处理。

### Chinese display names

- 没有中文名—原文名错位或同一作品双建。
- 60 个中文展示名全部明确为 provisional；完整译者、出版社、中文年份、ISBN 的缺失未被错误用作 Research Entity 否决条件。
- 本轮不把路线图中文名升级成 published/common；后续如补到正式中文版书目，可单独升级状态。

## Geo / Curation / Web

### Geo

- 新增 15 条作者—国家投影，覆盖阿根廷、智利、巴西、古巴、墨西哥、秘鲁；全部复用既有国家节点。
- 无新增现实地点、坐标或虚构空间；不存在虚构空间伪精确现实化。
- B11—B15 的国家关系与 SQLite relationship/source 一致。

### Curation boundary

- 60 个新增 Curation 实体共 450 个字段，全部保持 `user_review` / `UNREVIEWED`。
- 没有把待审策展降级为 `auto_approved`，也没有进入 formal public scope。
- 修正了两处待审文案污染：B14 年份—作品错配；B15 把未定位线索写成“不同目录给出”的过度表述。

### Website consumption

- 当前 Review package：55 authors、150 works、25 literary places。
- USER_REVIEW preview：255 files、247 sitemap routes；B11—B15 的 60 个实体均有页面、搜索入口和证据回查，国家聚合与时间线可消费新增数据。
- Formal public projection 仍为 25 authors、60 works、26 places；B11—B15 未对公众展示是审核状态策略的正确结果，不是 SQLite→Web Data 丢失。
- 因此内部预览能感知内容增长；正式公众站在 USER 批准前不会感知这五批增长。若要公开，需要 USER 另行审定 Curation，不能通过前端硬编码绕过。

## QA Effectiveness

重新运行：

- master validation、SQLite integrity、foreign keys：PASS。
- migration replay、migration-chain tests：PASS。
- content quality、deterministic Web Data rebuild、Web Data validator：PASS。
- public boundary、public bundle、public UI、frontend syntax、scoped diff check：PASS。
- USER_REVIEW preview：PASS。
- Chromium desktop/mobile：32/32 PASS。

发现测试覆盖在 B10 后停止新增批次专项断言。通用 sitemap 测试会访问新路由，但不能证明 B11—B15 的 60 个实体完整进入 review queue、没有部分泄漏，并且不能专项覆盖新搜索路径。已新增对应回归测试。因本轮没有浏览器引擎相关代码、CSS 或交互逻辑改动，Firefox/WebKit 未追加；Chromium desktop/mobile 足以覆盖本次数据与断言变更。

## Systemic Luna Findings

### 来源漂移：未发现

后两批 A 类来源比例上升；仅 B14 有 1 个 C 类来源，且已限制用途。没有 D 类来源进入正式 Research。

### 表述漂移：Research 未发现；Curation 从 B14 出现轻微同步漂移

B14 出现年份—作品错配，B15 出现未核实线索被写成“不同目录给出”的表述。影响待审 Curation，不影响 formal Research；需要对下一组增加机械引用核对。

### Review 漂移：未发现形式化放水

B12—B15 的 Reviewer 均实际提出 REVISE，B14/B15 还进行了多轮 follow-up。问题是集成后的跨层同步仍有漏项，而不是 Reviewer 完全失效。

### HOLD 漂移：未发现

本轮虽无 relation/source HOLD，但对证据不足的年份建立了 6 个持久化 gap，没有为完成率强行写入确定事实。

### Schema 漂移：最终状态未发现

B14 曾出现 migration schema 不兼容，但在正式提交前修正；最终 `0016`—`0020` 可连续重放。

### Curation 漂移：存在，始于 B14，已整改

影响两个待审文案与 B15 一处事实来源映射。需要下一组强制做“文案中的题名/年份/来源与 research_refs 一一反查”。

### Geo 漂移：未发现

没有为了增加地图节点降低地点或坐标标准。

### QA 漂移：存在，始于 B11，已整改

批次专项浏览器测试停在 B10；已补 B11—B15 的边界、路由和搜索回归。

## Coverage Audit

- 国家：阿根廷 6、古巴 4、巴西 2、智利 1、墨西哥 1、秘鲁 1；阿根廷+古巴占 10/15（66.7%）。
- 性别：女性 4/15（26.7%）。
- 作品形式：小说 20、短篇小说集 10、诗集 6、长诗 1、讲演系列 1、书信/散文 1、戏剧 1、自传 1、形式未定 4。
- 地图：新增作者—国家关系 15，但现实地点和虚构空间均为 0，地图粒度没有随作者规模同步增长。

结论：作者和诗歌覆盖较 B06—B10 有改善，但国家仍明显偏向阿根廷/古巴，小说仍占最大份额，中美洲、厄瓜多尔、委内瑞拉仍无本组新增作者。下一组不应大改 60+ roadmap；可保留已准备的 B16，但 B17 应优先从委内瑞拉、厄瓜多尔或中美洲候选中选取，并提高女性、诗歌/散文与有可靠城市/文学空间证据的比例。

## Findings and Remediation

| Priority | Finding | Batch | Status |
| --- | --- | --- | --- |
| P2 | 1979 年错误配到《热带黎明景观》，实际 1979 节点为《哈瓦那，一个早夭婴儿的回忆》 | B14 Curation | 已修复 |
| P2 | 未定位的 1985 lead 被写成“不同目录给出 1985/1986” | B15 Curation | 已收窄 |
| P2 | `V1-FCT-0912` 下游使用两源，fact_sources 只登记 `SRC-0257` | B15 Research mapping | `0021` 已补 `SRC-0256` |
| P2 | 自动化专项测试停在 B10 | B11 起 QA | 已补 60 实体回归 |
| P3 | 国家/体裁/地图覆盖仍偏科 | B11—B15 | 下一组排序约束 |

P0：0。P1：0。P2：4，全部完成最小整改。P3：1，作为后续规划约束，不在本轮重写 roadmap。

## Remaining Risks

- 6 个 open gaps 尚未解决，其中 B12 5 个首版年份缺口、B15 1 个《格洛萨》年份研究轨迹。
- 4 部作品形式仍未确定，属于诚实留白，不是数据库错误。
- 60 个中文展示名均为 provisional，尚未做系统的正式中译本状态升级。
- 450 个新策展字段未获 USER 批准，formal public 网站仍不会展示 B11—B15 作者和作品。
- 无需 USER 决定的 P0/P1 阻断项；是否审批策展、是否调整 B17 排序由 USER 决定。

## Recommendation

可以安全继续下一组五 Batch，但应满足以下约束：

1. 每批 Curation 必须机械核对“题名—年份—research_refs—source_refs”四元组。
2. 未登记 source ID/URL 的 discovery lead 不得写成“来源/目录存在分歧”；只能标为 unverified lead 或建立 gap。
3. 正式 migration 前检查 fact_sources 与所有下游 Curation/Web Evidence 的来源集合一致。
4. 每批同步扩展 Playwright batch range、代表性 route、search、timeline 和 public-boundary 断言。
5. C 类/access-limited 来源继续限制在基础事实或辅助支持，不得独立承担高解释强度判断。
6. B17 优先补委内瑞拉、厄瓜多尔或中美洲，并提高女性、诗歌/散文和可证地点覆盖；不建议大幅改写 60+ roadmap。

本审计不授权启动 B16、Public Release、GitHub Release 或 production deployment。
