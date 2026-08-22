# WEB-CE-B15 Fresh-context Review

## 初步结论：REVISE

本批的三位作者、九个原文题名、作者—作品关系方向、作品层级、中文展示名策略、Geo 边界和 Curation 状态总体可成立；在临时副本上重放 `0020_web_ce_b15_luna_max.sql` 成功，未修改正式主库。但目前不能直接放行：`SRC-0257` 的来源作者元数据与正文身份不符，`La palabra del mudo` 把汇编版本年份写入 `first_publication_year`，且 `Glosa` 的 1985 变体没有可定位的来源。另有一个来源链接/登记规范问题及迁移文件预先声称 Reviewer PASS 的 provenance 问题，需在返修后再做 focused follow-up。

## 复核范围与临时副本

- fresh-context 读取 B15 `PREFLIGHT.md`、`RESEARCH_CHANGE_SET.json`、`0020_web_ce_b15_luna_max.sql`、`curation/PUBLIC_CONTENT.json`、README，以及当前正式 master。
- 对本批作者、作品、来源、关系端点、中文名和国家节点做独立查重；本批 12 个实体（3 author、3 collection、6 work）、7 sources、36 facts、12 relationships、12 cards、1 gap。
- 将正式 master 复制为 `<B15-master-copy>`，以项目 `apply_migration.py` dry-run/正式重放 `0020`。结果：dry-run 与正式重放均成功，SQL SHA-256=`ee7baabb1529318cd2f8ad72d46c1d6eb6a24fd5861bd6acc8bf001f92b18838`；临时库计数为 341 entities、919 facts、269 relationships、258 sources、231 cards、22 gaps、migration log 20。
- 临时库 `validate_master.py` 返回 `verdict=pass`、`integrity_check=ok`、`foreign_key_errors=0`；独立 `PRAGMA integrity_check` 为 `ok`，`foreign_key_check` 为空。正式 master、candidate、migration 和 Geo 均未由本 reviewer 修改。

## 来源重新打开与支持范围

| Source | fresh-context 结果 |
|---|---|
| `SRC-0254` [Centro Cultural Inca Garcilaso](https://www.ccincagarcilaso.gob.pe/la-palabra-escrita/julio-ramon-ribeyro/) | 官方页面可打开；明确列出 Ribeyro 1929–1994、`Los gallinazos sin plumas`（1955）、`Silvio en El Rosedal`（Barcelona, Tusquets, 1989）和 `La palabra del mudo` 1973 多卷版本，并说明相关条目为 cuentos/汇编。 |
| `SRC-0255` [Revista Letras UNMSM](https://revistaletras.unmsm.edu.pe/index.php/le/article/view/1369) | 页面可打开；同行评议文章摘要明确称 `Los gallinazos sin plumas` 为 Ribeyro 的第一部城市短篇集，出版于 1955。 |
| `SRC-0256` [Argentina.gob.ar](https://www.argentina.gob.ar/noticias/juan-jose-saer-un-narrador-en-busca-de-poesia) | 官方页面可打开；明确列出 Saer 1937–2005、阿根廷身份以及 `El limonero real`（1974）、`El entenado`（1983）、`Glosa`（1986），并将其列入小说书目。 |
| `SRC-0257` [UNL El Taco en la Brea issue/article](https://bibliotecavirtual.unl.edu.ar/publicaciones/index.php/ElTacoenlaBrea/en/article/view/7752/11186) | 官方期刊目录可打开，文章作者实际为 **Diego Vigna、Verónica Bernabei**；正文/索引表支持 Saer 作品的出版年与写作/出版时间区分。当前候选和 migration 错填为 `María Virginia Castro`，见 P1。登记的直链 PDF 在本次直接打开返回 internal error，需改用稳定 article-view URL 或记录 access limitation。 |
| `SRC-0258` [Princeton finding aid](https://static-prod.lib.princeton.edu/scsites/aids/msslist/colls1.htm.back) | 官方 finding-aid 可打开；条目明确为 Reinaldo Arenas 1943–1990，列出小说、短篇、诗歌、戏剧、散文及 `Antes que Anochezca` 自传手稿。 |
| `SRC-0259` [Cardiff ORCA](https://orca.cardiff.ac.uk/id/eprint/120697/) | Cardiff University Press 论文页面可打开；摘要明确称 `Celestino antes del alba`（1967）和 `El mundo alucinante`（1968）为 Arenas 的前两部小说。 |
| `SRC-0260` [Universidad de Antioquia](https://revistas.udea.edu.co/index.php/lyl/article/view/354780/20816600) | 页面可打开并重定向到期刊 HTML；正文/脚注明确指出 Tusquets 1992 年西语首版及其 autobiografía 体裁。 |

## 已通过项目

### 实体、去重与层级

- 当前正式 master 中没有三位作者或九个原文题名；临时副本的 12 个新实体与候选 ID 逐项一致。
- `Los gallinazos sin plumas`、`Silvio en El Rosedal`、`La palabra del mudo` 的实体、`entity_layer` fact 和 card 均为 `collection`；Saer 三部和 Arenas 三部均为 `work`，层级没有错配。
- 中文展示名全部为 `provisional_title`，原文题名均保留；未发现中译名冒充出版事实、作品重复或同名误合并。

### Facts、关系、证据与时间戳

- 36 facts 均有合法 subject/card/origin source，且均有 `fact_sources` 与 `card_facts`；12 条关系均有合法端点、关系类型、source 和一条 evidence，`evidence_count` 与实际行数一致。
- 关系仅为 9 条 author→work/collection `CREATED` 和 3 条 author→既有国家节点 `ASSOCIATED_WITH_PLACE`；没有未经证据支持的影响、文学运动或强主题关系。
- 候选新增对象的 `origin_batch=WEB-CE-B15`、`created_at=2026-08-21` 与批次开始日一致；审核前 `reviewed_at=null`/`PENDING` 未伪装成 USER 审批。Curation 递归发现 90 个状态字段全部为 `user_review`，reviewer 全部为 `UNREVIEWED`，不存在自动降级为公开批准的记录。

### Geo 与 Curation

- `places=[]` 正确表示本批没有新增 place 实体；没有作品级现实地点或虚构空间，也没有虚构坐标。三条作者—国家关系若进入 Geo，必须只新增复用秘鲁 `V1-ENT-0124`、阿根廷 `V1-ENT-0001`、古巴 `V1-ENT-0096` 的关系行，并逐项回指当前 `V1-REL-0269`—`0271` 和 source；不得新增作品坐标。
- B15 curation 的 research/source/next-read 引用均可在临时库解析；没有发现 Curation 重新强化 Research 未支持的“客观主义”、流亡因果或主题结论。

## 必须修订的最小项目

### P1-01 — `SRC-0257` 来源身份错误，且当前 source URL 不够稳定

候选、migration 和 source registry 将 `El efecto del exilio...` 的 `author_or_editor` 写为 `María Virginia Castro`。官方 UNL 期刊目录明确列出该文章作者为 **Diego Vigna、Verónica Bernabei**；这属于来源身份错误，不能以现有记录入库。

最小修正：

1. 在 `RESEARCH_CHANGE_SET.json`、`0020_web_ce_b15_luna_max.sql` 及相关 source/report 元数据中，将 `SRC-0257.author_or_editor` 统一改为 `Diego Vigna; Verónica Bernabei`（或项目现行的多作者规范格式）。
2. 将 canonical URL 规范到可复核的 UNL article-view 入口（例如上表链接）；如必须保留 PDF download URL，需另记为 alternate/locator，并把直接访问受限情况写入 source note，不要同时标成无条件 `access_pass`。
3. 修改后重新核对所有 `fact_sources`、`card_sources`、`relationship_sources` 和 `relationship_evidence.source_title`，确保来源标题/身份一致。

### P1-02 — `La palabra del mudo` 的 1973 是汇编首个书版本/版本锚点，不是已证明的 first publication year

`V1-FCT-0900` 当前写成 `fact_field=first_publication_year,value_text=1973`，但 `SRC-0254` 正文明确描述的是 Madrid, Milla Batres 的 1973 Tomos I–II 版，并说明该汇编收录 1952–1972 的故事以及此前已在 1955、1958、1964 出版的书。把该版本年写入 `first_publication_year` 会把版次年伪装成作品首版年，影响时间线和 Research Evidence。

最小修正：优先改为现有 schema 可表达的 `first_book_edition_year=1973`（或项目明确支持的 edition/publication 字段），并同步 card、Curation、Web Data 和 usage note；若当前 Web 投影不能安全消费该字段，则删除 `first_publication_year`，保留版本锚点为 gap/策展说明，不能继续声称“首版 1973”。

### P2-03 — `Glosa` 的 1985 变体没有可定位的来源

`V1-GAP-0022`、card 和 Curation 均说“some teaching materials use 1985”，但当前正式登记的 `SRC-0256`、`SRC-0257` 都给出 1986，且没有 source ID、题名或 URL 可以让 reviewer/Sol 打开核对该 1985 线索。保留 1986 medium 与 open gap 的总体方向可以接受，但未登记的 1985 说法不能在带有 0256/0257 引用的 Curation 文本中作为已证实变体出现。

最小修正：

- 要么登记一个可定位的 1985 版本/目录来源（必要时仅作 discovery，不作为正式事实证据），并在 gap 中注明其等级与局限；
- 要么将 gap/Curation 改为“存在未核实的 1985 线索，当前正式来源均为 1986”，并避免把 1985 写成有来源支持的出版记录。

### P2-04 — migration provenance 预先写成 Reviewer PASS

当前 migration 的 `entity_id_map.mapping_basis` 和关系映射说明多处写着 `B15 fresh-context Reviewer PASS`，但候选 review metadata 仍是 `PENDING`，本 fresh-context 结论为 `REVISE`。这会让审计轨迹倒置，也违反“先 Review PASS、再正式 migration”的批次门禁。

最小修正：在返修后的 follow-up PASS 之前，不得以当前文字作为已发生事实；可先改为 `B15 candidate pending fresh-context review`，或在最终 review PASS 后将其统一改为真实 reviewer 名称/时间戳。关系 `review_status=accepted` 也只能在正式放行版本中保留。

## Follow-up 要求

返修后必须重新以 fresh context 检查：

1. `SRC-0257` 作者、canonical URL、access 状态与所有 source link/evidence 一致；
2. `La palabra del mudo` 不再把 1973 作为无条件 `first_publication_year`；
3. `Glosa` gap 的 1985 线索可定位或明确标作未核实 discovery；
4. migration provenance 不再预先声称 PASS；
5. 临时副本重放、`integrity_check`、foreign-key check、master validator、层级/关系/中文名/Curation/Geo 断言重新通过。

本 reviewer 未修改正式 master、candidate、migration、Geo 或 Web Data。当前结论保持 **REVISE**；完成以上差量修正后再发起 focused follow-up。

## Focused Follow-up Review（返修后）

复核日期：2026-08-21。此次重新读取返修后的 candidate、migration、curation、PREFLIGHT，并从当前正式 master 新复制临时副本重放 `0020`；未修改正式 master。

### 已闭环项目

- `SRC-0257` 已改为 `Diego Vigna; Verónica Bernabei`，URL 已规范为 UNL article-view 入口，状态降为 `access_limited`。官方期刊目录可核对题名和作者；正文/索引支持 Saer 年份，但直接 PDF 在本次环境仍有限制，这一状态记录是合理的。
- `V1-FCT-0900` 已改为 `first_book_edition_year=1973`，`V1-ENT-0337` 不再有 `first_publication_year`；card period 为 `1973 edition`，Curation 明确这是版本锚点而非故事首版年。
- `V1-GAP-0022` 与 `V1-ENT-0340` 的 Curation 已将 1985 标作未定位、未核实 discovery lead，未把它作为正式来源或公开确定事实。
- `entity_id_map.mapping_basis` 已改为 `B15 candidate pending fresh-context review`，不再预先声称 Reviewer PASS。

### 副本重放与结构断言

- `apply_migration.py` dry-run 与正式重放成功；返修后 SQL SHA-256=`290ae50601bb9e68f2351a405e2e0ca93f6c12943389ef9abb3cea8317b65f8f`。
- 临时库计数：341 entities、919 facts、269 relationships、258 sources、231 content cards、22 gaps、migration log 20。
- `validate_master.py`：`verdict=pass`；`PRAGMA integrity_check=ok`；`PRAGMA foreign_key_check` 为空。
- 12 个新实体、36 facts、12 relationships、12 cards 的端点、来源链接、evidence_count、work/collection 层级和中文 provisional title 均保持一致；Curation 90 个状态字段仍全部为 `user_review`/`UNREVIEWED`，没有虚构坐标。

### 仍需返修的最小项目

#### P2-FU-01 — `SRC-0257` 的语言元数据错误

返修后的 migration 仍把 `SRC-0257.language` 写成 `en`。该 UNL 研究文章的正文/原始 PDF 为西班牙语；`/en/` 只是期刊界面的语言入口，不能据此把来源语言登记为英语。

最小修正：将 migration/source registry 的 `SRC-0257.language` 改为 `es`（如项目要记录双语界面，可在 usage/support note 另行说明），重新 dry-run 并核对 source identity。

#### P2-FU-02 — 1985 discovery lead 在 candidate/card/PREFLIGHT 中仍有旧表述

虽然 gap 与 Curation 已明确“未定位/未核实”，但以下返修后文本仍写成未加限定的 “some teaching materials use 1985” 或 “a 1985 teaching-material variant”：

- `RESEARCH_CHANGE_SET.json` 中 `V1-ENT-0340.audit_metadata.basis_note`；
- `PREFLIGHT.md` 的 coverage/evidence 描述；
- migration 中 `V1-CARD-0228` 的 content_markdown；
- migration 中 `V1-FCT-0912.usage_note`。

这些文本的 source refs 只有 `SRC-0256`/`SRC-0257`，二者都只支持 1986。请统一改为“未定位、未核实的 1985 discovery lead，不是正式来源”，避免报告、card 和 Research Evidence 之间发生 REPORT_DRIFT/unsupported wording。

#### P2-FU-03 — Saer 形式/层级 facts 的直接来源锚点需收紧

`V1-FCT-0905`、`0907`、`0908`、`0910`、`0911`、`0913` 的 `origin_id` 仍单独写为 `SRC-0257`。UNL 文章表格直接承担年份与写作/出版时间；“三部均为小说”这一形式/层级表述在本批已打开的正文中由 `SRC-0256` 阿根廷政府页面更直接支持。当前 usage note 却同时写“UNL table and Argentina government list”，但 fact source 只连 UNL，存在 source-support drift。

最小修正：将上述形式/层级 facts 的主 `origin_id` 改为 `SRC-0256`，或补充 `fact_sources`/`card_facts` 使 `SRC-0256` 成为直接支持来源；保留 `SRC-0257` 作为年份/学术书目辅助来源。年份 facts `0906`、`0909`、`0912` 可继续以 `SRC-0257` 为主。

### Follow-up 结论

本轮返修已解决原先的 P1 来源身份、版本年份字段、Glosa gap 表述和 provenance 问题；migration/SQLite/validator 均健康。但仍存在三个可定位的 P2 元数据/来源支持漂移项，故当前最终判定仍为 **REVISE**。正式主库不得应用 `0020`，直到上述项目完成并再次 focused follow-up；本 reviewer 未修改正式 master。

## Focused Follow-up Review（第二轮最小返修后，最终）

复核日期：2026-08-21。本次以 fresh context 重新读取最新的 `RESEARCH_CHANGE_SET.json`、`PREFLIGHT.md`、`curation/PUBLIC_CONTENT.json` 与 `0020_web_ce_b15_luna_max.sql`，并从当前正式 master 新复制临时数据库重放迁移。未修改正式 master、candidate、migration、Geo 或 Web Data。

### 三项返修逐项确认

1. **`SRC-0257` 语言与来源身份**：candidate 与 migration 均为 `Diego Vigna; Verónica Bernabei`、UNL article-view canonical URL、`language=es`、`access/access_status=access_limited`。`/en/` 是期刊界面入口，不再被错误登记为文章语言；年份与写作/出版时间区分的 usage note 保持与该来源支持范围一致。
2. **`Glosa` 1985/1986 gap 表述**：PREFLIGHT、`V1-ENT-0340` candidate basis、`V1-CARD-0228`、`V1-FCT-0912` 及 Curation 均明确：正式可回查记录为 1986，1985 只是“未定位、未核实的 discovery lead”，不是正式来源或已确认出版年。`V1-GAP-0022` 继续保持 `open_research`/`SOL_REVIEW`；没有把该线索提升为正式证据。
3. **Saer 形式/层级事实的来源锚点**：`V1-FCT-0905`、`0907`、`0908`、`0910`、`0911`、`0913` 的主 `origin_id` 均已改为直接列出小说书目的 `SRC-0256`；年份 facts `0906`、`0909`、`0912` 保留 `SRC-0257`，其中 `0912` 的 1986 与未核实 1985 gap 说明保持一致。未发现 source/fact support drift。

另复核：`La palabra del mudo` 仍以 `first_book_edition_year=1973` 和 `1973 edition` card period 表达版本锚点，而非无条件 `first_publication_year`；migration 的 entity mapping provenance 仍写为 `B15 candidate pending fresh-context review`，没有在 review 之前倒置声称 PASS。

### 副本重放与 QA

- 从当前 master 重放 `0020_web_ce_b15_luna_max.sql` 成功；本次确认的 SQL SHA-256 为 `954e26f0b1854c46532320048c8bbe4eb8459f2332d3b55510d77d67674902e6`。
- 临时库计数：341 entities、919 facts、269 relationships、258 sources、231 content cards、22 gaps、20 migration log；B15 增量仍为 12 entities（3 authors、3 collections、6 works）、36 facts、12 relationships、7 sources、12 cards、1 gap。
- `validate_master.py` 返回 `verdict=pass`；独立 `PRAGMA integrity_check` 为 `ok`；`PRAGMA foreign_key_check` 为空。实体层级、端点、source/card/fact 引用和 evidence_count 均通过。
- Curation 90 个状态字段仍全部为 `user_review`/`UNREVIEWED`；没有自动降级为 USER 或 formal public approval。Geo 仍无新增地点、无作品级坐标、无虚构空间坐标；如随后写入三条国家关系 Geo 投影，必须继续复用当前正式关系 `V1-REL-0269`—`0271` 与对应 source。

### 最终 Reviewer Verdict

**PASS**

此前初审和两轮 focused follow-up 中列出的 P1/P2 阻塞项均已关闭；本轮未发现新的 source identity、fact support、entity dedup、层级、关系方向、中文展示名、时间戳、Research/Curation 边界或 Geo 坐标问题。正式 master 尚未修改，可以进入 B15 的正式 integration gate。

正式应用迁移前，集成方须把 candidate/object metadata 的 `review_status`、`reviewed_at` 和 `reviewer` 与本次真实结论同步，并将 migration mapping provenance 从 `pending fresh-context review` 更新为实际的 B15 Reviewer PASS 记录；这属于通过后的可追溯集成步骤，不是本次 review 的新阻塞项。
