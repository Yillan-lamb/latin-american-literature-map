# SOL AUDIT B16–B17

日期：2026-08-22

审计人：Codex / Sol independent audit

结论：`PASS WITH REMEDIATION`

## Executive Conclusion

B16–B17 的数据库结构、迁移链、实体唯一性、关系端点、Geo 安全边界、Curation 审核边界和 Web Data 投影整体健康；未发现 P0、数据库污染、跨 Batch 实体重复、虚构空间现实化、策展内容越权公开或不可复现迁移。

独立语义审计发现 1 项 P1 与 4 组 P2：Lygia Fagundes Telles 出生年错误；把不同版次误判为年份争议；Jorge Icaza 三部作品的年份/体裁 facts 映射到不直接给出这些字段的目录来源；Luis Sepúlveda 与三部作品的中文展示名未采用已有正式出版用名；一条转载自 BuscaBiografias 的大学页面被高估为 B 类独立来源。上述问题均已通过新 corrective migration `0024_sol_audit_remediation_b16_b17.sql` 差量修复，未重写 Luna 的 `0022`、`0023` 历史。

因此，本轮不是无条件 `PASS`，但整改完成后可以安全进入下一组 Batch。正式 public 层仍不展示 B16–B17 的 6 位作者与 18 部作品，这是 180 个 Curation 字段继续保持 `user_review` 的正确边界行为，不是 Web Data 故障；是否公开需要 USER 决定。

## Audit Scope

- Batch：`WEB-CE-B16`、`WEB-CE-B17`。
- Luna commits：
  - B16：`5f3b00caec0d90cf7808187045171ac12a955459`
  - B17：`160853c1e8dc132c862b037efc09359590293fff`
  - handoff：`5745c133eacf50b5be88c4115cb8a293d52545ad`
- Luna migrations：
  - `0022_web_ce_b16_luna_max.sql`，SHA-256 `523b442d403af4f0dc376c2a065e45f78c3cafc55b65b36367146f069985d7d9`
  - `0023_web_ce_b17_luna_max.sql`，SHA-256 `327eb5f4d2e535dd4450e14e8c14e3a6b89ce18a9d80f59f5af23c3df5e3faf7`
- Sol corrective migration：`0024_sol_audit_remediation_b16_b17.sql`，SHA-256 `f0805bf7311e62afc36379bb9751d883e044f969e6f3f517998edeb88694f175`。
- 事实状态：Git commits、当前 `data/master/V1_MASTER.sqlite`、实际 Geo/Curation/Web Data、正式 bundle 与 USER_REVIEW preview；未仅依赖 Batch Report。
- 基线：B16 前的已审计 ancestor `a3dd71ce6c9c900c17e2bd38095e4420e1a7dd55`。

## Data Growth

以下为从 migration 与数据库重算的 Luna 原始增量，不使用 Batch Report 手写数字：

| Batch | 作者 | 作品/合集 | Facts | Relations | Sources | Cards | Geo（地点/关系） | Curation | Commit |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---|
| B16 | 3 | 9（4 work / 5 collection） | 36 | 12 | 9 | 12 | 0 / 3 | 12 entries / 90 fields | `5f3b00c` |
| B17 | 3 | 9（8 work / 1 collection） | 42 | 12 | 7 | 12 | 2 / 3 | 12 entries / 90 fields | `160853c` |
| 合计 | 6 | 18 | 78 | 24 | 16 | 24 | 2 / 6 | 24 entries / 180 fields | — |

状态重算：

- Luna 原始新增 `research_gap/disputed`：B16 1 条书目 gap，B17 1 条出生年 disputed gap；两条经审计均已转为 `verified / NONE`。
- 新增 HOLD：0。
- 新增 `user_review`：180/180 个 Curation 字段，reviewer 均为 `UNREVIEWED`，无 USER 身份或预先批准时间戳。
- Sol 整改净增：4 sources、1 个用于补齐既有 `1949–2020` 展示的 `death_year` fact、8 个 card-source mappings；作者、作品、关系、地点和 Curation entry 数不变。
- 整改后主库：367 entities、998 facts、293 relationships、278 sources、255 content cards、24 gaps、24 migrations。

## SQLite and Migration Integrity

- `PRAGMA integrity_check`：`ok`。
- `PRAGMA foreign_key_check`：0 rows。
- facts、fact_sources、relationship endpoints、relationship_sources、relationship_evidence、content cards、card facts、card sources 的 dangling references：全部为 0。
- ID 冲突：0；B16/B17 migration 间主键冲突：0。
- 从 B16 前基线连续 replay `0022 → 0023 → 0024` 后，19 张业务表与正式主库逐表一致；仅排除 `migration_log.applied_at` 的运行时间差。
- migration_log 中三条 SQL hash 与实际文件一致。
- 未发现后续 Batch 在结构性错误上继续扩张。

## Research Quality

### Source audit

- 16 个 Luna 新增来源均核对来源身份、入口与使用范围；B16 为 A×1、B×8，B17 原标 B×7。
- B17 `SRC-0276` 页面正文注明来源为 BuscaBiografias，大学域名并未把转载内容自动升级为独立学术来源。现降为 C，只保留低风险佐证用途。
- 未发现 D 类来源进入正式 Research、搜索摘要直接充当正文、DOI/ISBN/canonical URL 重复编号，或同一来源不同入口被伪装为独立双来源。
- B16 的 BNE/Memoria Chilena 记录分别清楚列出 1989 Júcar 版；1993 Tusquets 是后续版，不构成冲突：[BNE authority record](https://datos.bne.es/resource/XX2185232)、[Memoria Chilena bibliography](https://www.memoriachilena.gob.cl/602/w3-propertyvalue-128650.html)。
- Lygia 的民事登记材料明确为 1918，巴西国家图书馆权威数据独立一致：[ANOREG/BR civil-registry report](https://www.anoreg.org.br/site/o-registro-civil-de-lygia-fagundes-telles/)、[Biblioteca Nacional record](https://acervo.bn.gov.br/sophia_web/acervo/detalhe/1724755)。旧 ABL 1923 页面保留在 provenance，但不再作为等权候选。
- Icaza 的 CCE 目录支持作者—作品关联，但不直接给出三部作品各自年份；年份与小说体裁改由实际列出 1934/1935/1958 的 [Universidad Central del Ecuador thesis PDF](https://www.dspace.uce.edu.ec/server/api/core/bitstreams/c4493f6a-e702-4d00-8f4f-653644f5a4a9/content) 承担。

### Literary semantics

- 24 条新增 relationships 全部为低风险机械关系：18 条 `CREATED`、6 条 `ASSOCIATED_WITH_PLACE`；没有 `INFLUENCED`、运动归属、事件因果、主题推导或历史定位关系。
- 所有关系方向、relation type、端点、evidence count 和 Geo 投影一致；规范化三元组重复为 0。
- Research facts 为原子生平、身份、年份、体裁字段；未发现“开创、奠定、最重要、直接回应”等强解释写入正式 Research。
- 语义问题的主要模式不是文学解释越界，而是“来源确实存在，但 Reviewer 没有把证据精确落到字段/版本层级”。

## Cross-Batch Integrity

- 作者：按中文名、原文名、去重音、空格/姓名顺序归一化，无重复候选。
- 作品：按原题名、中文名、版次与 work/collection 层级检查，无重复建立或错误合并。
- 来源：canonical URL、ISBN、persistent ID、题名+作者+年份查重，无重复来源。
- 关系：`subject_id + relation_type + object_id` 查重，无重复三元组。
- B16 的“1989/1993 争议”没有污染 B17 实体或关系；B17 的出生年问题也没有继续扩张到作品年份。

## Chinese Display Names

已修复：

- `路易斯·塞普尔韦达` → `路易斯·塞普尔维达`
- `《一个老人读爱情小说》` → `《读爱情故事的老人》`
- `《一只海鸥和教它飞翔的猫》` → `《教海鸥飞翔的猫》`
- `《世界尽头》` → `《世界尽头的世界》`

依据包括 [中国作家网](https://www.chinawriter.com.cn/n1/2020/0416/c404090-31676734.html) 与高校图书馆目录；原文名、原题名和稳定 route slug 全部保留。Guadalupe Nettel 三部作品已确认存在 2025 年广西师范大学出版社中文套装，Curation 中的“暂译”状态改为“已出版中文书名”；没有因缺译者、ISBN 等完整版本字段而删除正确 Research entity。

## Geo / Curation / Web

### Geo

- B16 只复用智利、墨西哥、乌拉圭国家节点；B17 新增厄瓜多尔、委内瑞拉两个真实国家节点。
- 两个新国家均为 polygon-only，坐标为空；无伪精确中心点、无新城市、无虚构空间、无现实/虚构混淆。
- 6 条 author-country Geo 关系与 SQLite endpoints/source refs 一致。

### Research / Curation boundary

- B16/B17 共 24 条 Curation records、180 个字段全部维持 `user_review / UNREVIEWED`。
- 未发现把推荐语写入 Research、把 user_review 降为 auto_approved、伪造 USER reviewer 或让 review queue 泄漏进正式 bundle。
- 两条已解决 gap 的 Curation 文案已同步去除“尚未解决争议”叙述；中文正式书名状态同步修正。

### Website consumption

- Research → Geo → Curation → Web Data → Frontend 链路完整；新增实体没有困在 SQLite。
- USER_REVIEW preview：61 authors、168 works、25 literary places；B16/B17 作者与作品的 route、搜索、时间线与 Research Evidence 均可访问。
- 正式 public bundle：25 authors、60 works、28 place/country entries；厄瓜多尔、委内瑞拉国家页已公开消费，B16/B17 作者与作品因未获 USER Curation 批准而保持隐藏。
- 正式层与 review preview 的差异是审核门禁的预期结果。若 USER 希望普通读者立即感知这 24 个新入口，应审核/批准 Curation，而不是前端硬编码。

## Coverage

B16–B17 在国家分布上明显优于前几组集中式增长：6 位作者分别来自智利、墨西哥、乌拉圭、巴西、厄瓜多尔、委内瑞拉；新增 3 位女性作者，批内为 3/6。体裁仍明显偏叙事文学：18 个作品/合集只有 1 个诗集节点，其余以小说、短篇集、儿童小说和旅行叙事为主。

当前 61 位作者按卡片国家统计，阿根廷 13、墨西哥 10、巴西 8、智利 7、古巴 6、乌拉圭 5、秘鲁 4；其余国家各 1，另有 2 条早期卡片国家字段为空。阿根廷+墨西哥合计 23/61（37.7%），中美洲仍主要只有危地马拉、尼加拉瓜各 1；厄瓜多尔、委内瑞拉本轮才各到 1。作品层的标准“诗集”仅 23/168，小说/长篇小说等叙事门类占明显多数。

数据模型没有可机器统计的 gender 字段，因此全项目性别占比不能做到与国家/体裁相同的自动审计；本报告只对 B16–B17 的 3/6 做人工核验，不伪造全库数字。

## Systemic Luna Findings

| Drift type | Finding | Start | Impact | Backfill / next constraint |
|---|---|---|---|---|
| Source drift | 未证明来源整体逐批下降；但 B17 有 1 条转载页被域名高估为 B | B17 | 低风险生平佐证 | 已降 C；以后必须追溯页面自报原始出处 |
| Expression drift | 未发现 | — | — | 保持原子 facts 规则 |
| Review drift | 有限但真实：连续两批都把可解决的版本/权威记录问题留成 gap；B17 另有字段—来源映射失准 | B16 | 书目年份、出生年、source mapping | 已回溯 B16/B17；后续 Review 增加版次识别与逐字段 locator |
| HOLD drift | 未发现为完成率减少 HOLD；反而出现两条不必要 open gap | B16 | gap 噪声 | 已转 verified；禁止把“不同版次”默认当争议 |
| Schema drift | 未发现 | — | — | 保持 CREATED / ASSOCIATED_WITH_PLACE 精确类型 |
| Curation drift | 未发现 | — | — | 继续锁定 user_review |
| Geo drift | 未发现 | — | — | 继续 polygon-only / no fabricated coordinates |
| QA drift | 没有跳过自动化；但 validators 对语义和 source-to-field 精度存在盲区 | B16 | 自动 PASS 未发现上述问题 | 已增加 B16/B17 回归测试；自动 PASS 继续不得替代语义审计 |

结论：Luna 的结构性执行稳定，文学解释也克制；但独立 Review 已出现“小范围形式化”信号，尤其是看到两个权威入口便保留 conflict，而没有继续判断它们是否为不同版次、旧资料与新民事记录，或是否真正支持具体字段。这需要约束升级，但不构成整批失败。

## Findings and Remediation

| ID | Priority | Finding | Disposition |
|---|---|---|---|
| SOL-B16B17-01 | P1 | Lygia birth_year 写为 1923 medium，并错误保留 unresolved dispute | 改为 1918 high；加入民事登记来源；gap verified；移除卡片/关系 dispute marker |
| SOL-B16B17-02 | P2 | 1989 Júcar 与 1993 Tusquets 不同版次被写成争议 | 保留 first_book_edition_year=1989 high；gap verified；移除 dispute marker |
| SOL-B16B17-03 | P2 | Icaza 9 个 work facts 的 origin 指向不直接给年份/体裁的 CCE 目录 | origin 与 fact_sources 改为直接列出字段的 UCE thesis；CCE 仍支持 CREATED 关系 |
| SOL-B16B17-04 | P2 | Sepúlveda 作者/三部作品展示名未采用已出版中文用名；Nettel 中文书名仍标“暂译” | 更新 entity/card/relation/Geo/Curation/Web Data；保留原题与 route slug |
| SOL-B16B17-05 | P2 | `SRC-0276` 转载自 BuscaBiografias，却标为独立 B | 降为 C，限低风险佐证 |
| SOL-B16B17-06 | P2 | Sepúlveda 卡片已展示 1949–2020，但缺 death_year fact | 新增 2020 high fact 与 card/fact/source mapping |
| SOL-B16B17-07 | P3 | 测试未锁定上述语义修复；全库无 gender 可统计字段 | 已增加本轮 regression；gender schema 仅列后续治理建议，不在本轮改 Schema |

## QA and Test Effectiveness

整改后的实测结果：

- master validator：PASS；integrity `ok`；foreign keys 0。
- 连续 migration replay：19/19 业务表一致。
- Web Data fixed-time rebuild：连续两次 SHA-256 完全一致；validator PASS。
- content quality：PASS（review package 61 authors / 168 works / 25 literary places）。
- formal public bundle：127 files、119 routes；bundle validator 与 public UI QA PASS。
- USER_REVIEW preview：281 files、273 routes；bundle validator 与 public UI QA PASS。
- unit/regression：5/5 PASS；新增检查 1918、两条 verified gap、Icaza source mapping、中文名和 Web projection。
- Chromium desktop：18/18 PASS；Chromium mobile：18/18 PASS；B16/B17 专项 4/4 PASS。
- cross-browser smoke：Chromium、Firefox、WebKit × desktop/mobile 六矩阵 PASS；所有 journey HTTP 200，无 console/page error、无治理语言泄漏。
- frontend syntax、Python compile、targeted `git diff --check`：PASS。
- 测试未硬编码旧作者/作品总数；B16/B17 测试按 entity IDs 与 review boundary 检查。原有测试能覆盖 route/search/timeline，但不能判断来源是否真正支持字段，这是本轮新增回归与人工语义审计的原因。

## Remaining Risks / USER Decisions

1. 180 个 B16/B17 Curation 字段仍待 USER 审核；这是唯一直接影响正式网站是否展示 6 位作者和 18 部作品的决定。
2. 中文展示来源中的 C 类材料只承担展示/基础书目用途，不应在后续 Batch 被升级为文学史、主题或影响判断证据。
3. 全库两个早期作者卡片缺国家字段、gender 不可机器统计，属于跨项目治理项；本轮未扩大 Schema 整改。
4. 本次只有 B16–B17 两批，足以确认局部 Review drift，但不足以证明长期来源等级单调下降；下一组审计应继续观察。

## Recommendation

可以继续下一组 Luna Batch，但增加以下硬约束：

1. 每个年份/体裁 fact 必须记录“直接给出该字段”的 source 与 locator；列出书名的目录不能自动承担年份。
2. 遇到同题名不同年份时，先检查出版社、城市、版本、合集/单篇层级，再决定 `disputed`；不同版次不得自动建 gap。
3. 权威资料冲突必须查后出的民事记录、国家图书馆 authority record 或勘误；旧机构简介不得与更新的一手记录默认等权。
4. 来源等级按内容生产链而非域名判断；大学站转载聚合文不得升为 B。
5. 中文展示名在入库前增加中国国家图书馆/高校馆藏/出版社/中国作家网交叉检查；published/common/provisional 必须与证据一致。
6. 每批 Review 增加一张 `fact_id → exact source → locator → supported wording` 表，并对 Reviewer `PASS` 后发生的 Curation/Research correction 重新跑 Review gate。
7. 保持 Geo polygon-only、Curation `user_review`、无前端硬编码和固定时间双重 rebuild。

若 60+ 计划后仍继续扩充，建议仅微调排序，不重写 roadmap：优先女性诗人，以及加勒比、中美洲、安第斯低覆盖国家；下一组减少阿根廷/墨西哥小说家和纯小说节点，优先诗歌、散文、早期传统与有可靠城市文学证据的作者。

审计至此停止；未启动 B18，未创建 Release、tag 或 deployment。
