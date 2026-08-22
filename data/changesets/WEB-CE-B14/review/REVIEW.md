# WEB-CE-B14 Fresh-context Review

日期：2026-08-21
Reviewer：独立 fresh-context reviewer（不修改候选 JSON、migration 或主库）
范围：`data/changesets/WEB-CE-B14/RESEARCH_CHANGE_SET.json`、B14 `PREFLIGHT.md`/`README.md`、当前主库查重与国家节点、七个登记来源。

## 初步判定

**REVISE — SUPERSEDED BY FOCUSED FOLLOW-UP**

三位作者、九个作品实体的原文锚点和大部分来源身份可以成立；关系类型均为低解释强度的 `CREATED` 或作者—国家 `ASSOCIATED_WITH_PLACE`。但当前候选不能直接进入 migration：存在一个已核实的国家节点错误、两个中文展示名互换，以及把讲座/完成日期/首演日期当作作品年份的风险。这些问题会直接影响 Geo、时间线和 Research Evidence，必须在正式入库前差量修正。

## 主库与边界检查

- 当前主库 `validate_master.py`、`PRAGMA integrity_check` 和 foreign-key 检查均正常；B14 预留的三位作者、九个原文题名未在当前实体表中发现重复。
- 九个作品当前均为 `work`；`Vista del amanecer en el trópico` 暂不写 `genre_or_form` 是保守处理，可以接受。B14 `PREFLIGHT.md` 仍称该对象“保留为 collection”，与候选 JSON 的 `entity_type=work` 不一致，需在返修时同步文档，避免 migration 与报告漂移。
- 所有关系端点和关系类型形式上有效，但国家端点存在实质错误（见 P1-01）。
- 原文题名均保留；展示名均为 `provisional_title`，未冒充正式中译本。候选 `created_at=2026-08-21` 与批次开始日一致；本次候选的 `review_status=PENDING` 是审核前状态，正式放行时必须写入真实 Reviewer 元数据，不能写成 USER 审批。

## 来源逐项核验

| Source | 实际打开/核验结果 | 结论 |
|---|---|---|
| `SRC-0247` Biblioteca Virtual Miguel de Cervantes (`https://www.cervantesvirtual.com/obra-visor/paradiso-y-oppiano-licario--una-gua-de-lezama-0/html/ff2fc5aa-82b1-11df-acc7-002185ce6064_19.html`) | Cervantes Virtual 的作品目录页可打开，确认题名、作者 Remedios Mataix、2000 年 Alicante 大学版本及 Lezama 研究身份；登记的深层 HTML 页在本次复核中多次超时。搜索到的同一官方 HTML 片段明确把 `Paradiso (1966)` 与 `Oppiano Licario (1977)` 并列为两部小说，但不能把搜索片段替代为正式正文证据。 | 身份可核验；直接正文可访问性不能标为无条件 `access_pass`。应改用可稳定访问的官方记录/HTML 入口，或在 migration 中让 AAP 承担直接书目主证据。 |
| `SRC-0248` Academy of American Poets (`https://poets.org/poet/jose-lezama-lima`) | 正文明确写出 Lezama 为 Cuban poet/essayist/novelist，1910—1976；列出 `Paradiso` 1966、`Oppiano Licario` 1977，并说明 1957 年阅读五部分讲座、后来出版为 `La expresión americana`。 | 身份与前两部作品可用；对 `La expresión americana` 直接支持的是 1957 年讲座，不是无条件的首版年份。 |
| `SRC-0249` Escritores.org (`https://www.escritores.org/biografias/437-guillermo-cabrera-infante`) | 正文明确写出 Cabrera Infante 1929 年生于古巴、2005 年在伦敦去世；书目列出 `Tres tristes tigres` 1967、`Vista del amanecer en el trópico` 1974、`La Habana Para un Infante Difunto` 1979；同一页另有 `Vista... (1987)` 的重复书目行。正文明确称 `Tres tristes tigres` 为小说，但未为 `La Habana...` 给出形式。 | C 类可作为基础书目补充，但 1974/1987 需要说明为初版/后续书目项的区别；不能用本页独立支撑 `La Habana...` 的“小说”标签。 |
| `SRC-0250` University of Texas Press (`https://utpress.utexas.edu/9780292777088/`) | 出版社正文确认书名、Raymond D. Souza、Cabrera Infante 的古巴身份，并明确列出英文/西文对应的三部作品；页面未给出这三部作品的出版年份。 | B 类身份与题名交叉来源可用；不应把它写成年份的直接证据。 |
| `SRC-0251` UNAM Repositorio (`https://repositorio.unam.mx/contenidos/ficha/primero-sueno-5059605`) | 登记的 `/ficha/...` URL 在本次复核中返回错误；UNAM 可访问的记录 `/contenidos/5059605`（同一资源的带查询参数页面）正文明确写出 `Primero sueño`、Sor Juana 1651—1695、原发表于 1692、975 行诗及诗歌标签。 | B 类内容可用，但应把 source URL 规范到可复核的 `/contenidos/5059605`，并保留 1692 为首版年份。 |
| `SRC-0252` UNAM Libros OA (`https://librosoa.unam.mx/handle/123456789/575`) | 正文标题为 `Carta a Sor Filotea de la Cruz`，明确说明亦称 `Respuesta a sor Filotea de la Cruz`；写明 1691 年 3 月 1 日完成，并将其标为 ensayo/epístola。 | B 类直接支持题名别名、书信/散文形式和完成日期；完成日期不等于首版年份。 |
| `SRC-0253` UNAM Global/CulturaUNAM (`https://unamglobal.unam.mx/global_revista/conversacion-sobre-sor-juana-ines-de-la-cruz-en-vindictas/`) | 正文确认 Sor Juana 的身份与墨西哥语境；明确写出 1689 年首演 `Amor es más laberinto`，并提及 `Respuesta`。 | B 类可支持戏剧形式和 1689 首演年；不能单独支持 `first_publication_year=1689` 或 Sor Juana 生卒年。 |

## 必须修正项

### P1-01 — 古巴国家节点错误（候选及既有 B13 轨迹均受影响）

当前正式主库的地点表为：`V1-ENT-0096 = Cuba/古巴`，`V1-ENT-0235 = Nicaragua/尼加拉瓜`。B14 候选把 Lezama 和 Cabrera 的 `place_id` 以及两条 `ASSOCIATED_WITH_PLACE` 关系写成 `V1-ENT-0235`，会把古巴作者投影到尼加拉瓜。

最小修正：

1. B14 两位古巴作者及其 Geo/关系端点统一改为 `V1-ENT-0096`；Sor Juana 的 `V1-ENT-0051 = México` 正确。
2. B14 migration、Geo CSV、card/evidence 和 Web Data 不得继续出现 `V1-ENT-0235` 作为古巴端点。
3. 这是跨 Batch 数据治理问题：已提交的 B13 `V1-REL-0247`（Nicolás Guillén）也指向错误的 `V1-ENT-0235`，B13 `PREFLIGHT.md`/候选 JSON 同样误写。不得把该错误静默复制到 B14；请由集成方建立单独、可追溯的 remediation，或在当前允许的审计修复中明确记录后再继续。

### P1-02 — Cabrera Infante 两个中文展示名互换

当前候选为：

- `Vista del amanecer en el trópico` → `《哈瓦那，一个早夭婴儿的回忆》`；
- `La Habana para un infante difunto` → `《热带黎明景观》`。

这两个暂译名与原文对应关系相反：前者应对应“热带黎明景观”一类的工作性译名，后者才对应“哈瓦那／一个死去婴儿”的标题意象。即使采用 `provisional_title`，也不能留下这种实体错配。

最小修正：交换两条作品的 `name_zh`，并同步 cards、Curation、Web Data、route slug 和 migration；保留原文题名不变。

### P1-03 — 三个年份字段混淆了首版年与其他事件日期

当前项目 schema 使用 `first_publication_year` 表示作品首版年。候选需要逐项降级或拆分：

- `La expresión americana` 的 1957 来自 AAP 所述五部分讲座；页面只说后来出版，未给出首版年。不要把 1957 直接写成 `first_publication_year`。
- `Respuesta a Sor Filotea de la Cruz` 的 1691 是 UNAM 所述完成日期，不是该页面给出的首版年。不要直接写成 `first_publication_year`。
- `Amor es más laberinto` 的 1689 是 UNAM Global 所述首演年，不是出版年。不要直接写成 `first_publication_year`。

最小修正：将上述三个作品的首版年份留空并各建 `research_gap`（或使用现有明确的事件/完成/首演字段，若 schema 与 Web 投影确实支持），并在 usage note 中注明日期类型；不得从常识补成首版年。`Primero sueño=1692` 有 UNAM 直接支持，可保留。

### P2-04 — 形式标签和候选文档边界需同步

- `La Habana para un infante difunto` 的 `genre_or_form=小说` 在本次打开的两页中没有直接支持；请删除该标签或补充明确的 B/A 类形式来源。
- `La expresión americana=文化随笔` 的中文分类超出 AAP 页面直接措辞；请改为来源直接支持的“散文/讲座”类标签，或留空并将解释放到 Curation。
- `PREFLIGHT.md` 对 `Vista del amanecer en el trópico` 写成 collection，但候选按当前保守决定写成 work/null；请统一为一个可追溯决定，不得让报告与 migration 相互矛盾。

### P2-05 — 来源 metadata 规范化

- `SRC-0247` 的深层 HTML 当前复核超时；记录受限状态并使用稳定的官方目录/HTML 入口，不能继续无条件标 `access_pass`。
- `SRC-0251` 改用可打开的 UNAM canonical `/contenidos/5059605`，并在 source note 中记录 `/ficha/...` 入口不可复核。
- `SRC-0249` 为 C 类且存在 `Vista...` 的 1974/1987 双列；若保留 1974，migration 必须明确这是所选的初版书目年、1987 是另一个书目项，必要时将 confidence 降为 medium 或增加独立 B 类来源。

## 已通过项目

- 三位作者和九个原文题名当前未与主库重复；作者—作品关系方向正确，未出现影响关系或其他高强度解释性关系。
- `Paradiso`、`Oppiano Licario` 的 1966/1977，`Tres tristes tigres` 的 1967，`Primero sueño` 的 1692，在已打开来源中有直接或充分书目支持；其余年份需按 P1-03 重新分类。
- `Vista del amanecer en el trópico` 暂按 `work` 且不填形式，是比无证据写成 collection 更安全的候选处理；返修时只需同步文档决定。
- 中文展示名策略整体为 provisional，未冒充已出版中译本；但 Cabrera 两条展示名互换属于必须修复的实体映射错误。
- 未新增现实或虚构地点；因此没有本批虚构坐标伪造问题。正式 Geo 仍必须使用正确的 Cuba/México 节点并回指当前关系、source ID。

## 返修后复核要求

请仅返修上述明确项目后发起 fresh follow-up：至少重新检查 Cuba 节点、两条中文展示名、三个年份字段及 `SRC-0247`/`SRC-0251` 的 URL 状态；同步核对 migration、Geo、cards/evidence 和 Curation/Web Data 不得把被降级的年份或旧端点重新增强。当前结论保持 **REVISE**；本文件不代表主库或候选已放行。

## Focused Follow-up Review（整改后）

复核日期：2026-08-21
复核范围：更新后的 `RESEARCH_CHANGE_SET.json`、`0019_web_ce_b14_luna_max.sql`、`curation/PUBLIC_CONTENT.json`、`data/v2/geo/PLACE_RELATIONS.csv` 与 `remediation/REMEDIATION.md`。本次未修改 master DB、候选 JSON 或 migration。

### 已闭环的整改项

- **古巴节点**：B14 候选、B14 migration、`V2-GEO-REL-068`/`069` 均使用 `V1-ENT-0096`；墨西哥使用 `V1-ENT-0051`。`0019` 以可追溯方式修正既有 B13 `V1-REL-0247`，并更新其 evidence note；`V2-GEO-REL-067` 同步指向 `V1-ENT-0096`，旧 B13 migration 未被静默改写。
- **中文展示名与形式**：`V1-ENT-0327` 为 `Vista del amanecer en el trópico → 《热带黎明景观》`；`V1-ENT-0328` 为 `La Habana para un infante difunto → 《哈瓦那，一个早夭婴儿的回忆》`。候选、migration cards、关系描述和 Curation 均一致；`0328` 的 `genre_or_form`/形式 fact 已留空。
- **日期语义**：`V1-FCT-0865`、`V1-FCT-0885`、`V1-FCT-0888` 均使用 `composition_year`，usage note 分别明确为 1957 讲座年、1691 书信完成年、1689 首演年，未写成 `first_publication_year`。`V1-FCT-0877` 已从 migration 和 Curation 引用中删除；`Primero sueño=1692` 仍由 UNAM 直接支持。
- **来源 metadata**：`SRC-0247` 已标记 `access_limited`，并注明深层页面超时、不能作为唯一证据；`SRC-0251` 已改用 `https://repositorio.unam.mx/contenidos/5059605` canonical URL。
- **Curation/Geo 边界**：Curation 条目仍为 `user_review`/`UNREVIEWED`，没有把待审策展内容伪装成公开批准；Geo 只新增/修正作者—国家关系，没有虚构坐标。

### 剩余阻断项

#### P0-01 — `0019` migration 与当前正式 schema 不兼容

在当前 B13 master 副本（临时路径，未纳入仓库）上执行：

```text
python3 scripts/apply_migration.py <B13-master-copy> data/master/migrations/0019_web_ce_b14_luna_max.sql --task-id WEB-CE-B14 --reviewer LUNA-MAX-B14-REVIEW
```

结果为：

```text
sqlite3.OperationalError: table relationships has no column named origin_material_id
```

当前正式 schema 的 `relationships` 表使用的是：
`origin_layer`、`origin_relation_group_id`、`upstream_review_status`、`evidence_count` 等列；B14 migration 的关系 INSERT 仍使用旧/不存在的 `origin_material_id`、`origin_relation_id`、`admission_status`、`relationship_group_id`、`eligible_for_public` 列。由于 migration 在事务中失败，临时库回滚且 master 未被修改。

这不是内容语义问题，而是 migration 无法安全重放的 P0 级集成阻断。请按当前 B12/B13 migration 的关系列映射修正 `0019`，重新在副本上演练，并再次执行 integrity、foreign-key 和 master validator；在该修复完成前不能将本批标记为 PASS 或进入正式主库。

#### P2-02 — `La expresión americana` 的形式标签仍偏强

本次已正确把 1957 改为 `composition_year`，但 `V1-FCT-0866` 仍将 `genre_or_form` 写成“文化随笔”。AAP 正文直接支持的是“五部分讲座系列，后以作品形式出版”，并未直接给出“文化随笔”这一分类。建议在下次修订中改为来源可直接回溯的“讲演/散文”或留空；当前 Curation 的“文化论述作品入口”可以保留在 `user_review`，不应反向成为 Research 形式事实的依据。`0327`/`0328` 的形式留空则已通过。

### Follow-up 结论

研究整改本身已闭环，但 migration rehearsal 失败，故本次最终结论为：

**REVISE**

仅需修复 `0019` 的 relationships INSERT schema 映射并重新演练；不得修改 master DB 来绕过 migration。修复后需再次进行 focused follow-up，至少确认副本 migration 成功、`V1-REL-0247`/`V2-GEO-REL-067` 保持 Cuba `V1-ENT-0096`，且上述日期、展示名和 `0877` 删除状态未回归。

## Focused Follow-up Review（migration schema 修复后）

复核日期：2026-08-21
前一节的 `REVISE` 结论已由本次复核 superseded。复核仍未修改正式 master DB；仅在临时 B13 master 副本上重放 migration。

### Migration rehearsal

从当前 B13 master 副本重放：

```text
python3 scripts/apply_migration.py <B13-master-copy-followup> data/master/migrations/0019_web_ce_b14_luna_max.sql --task-id WEB-CE-B14 --reviewer LUNA-MAX-B14-REVIEW
```

结果：`applied 0019_web_ce_b14_luna_max`，SQL SHA-256 为 `68e48f2ce45796694e8217153606beb7ca5702929e15ec5b033fc16cbdc8077d`。

副本最终计数：`329 entities`、`883 facts`、`257 relationships`、`251 sources`、`219 content_cards`、`907 fact_sources`、`862 card_facts`、`429 card_sources`、`284 relationship_evidence`、`292 relationship_sources`、`migration_log=19`。相对 B13 基线的增量为 12 entities、34 facts、12 relationships、7 sources、12 cards；另包含 B13 地理关系的可追溯修正。

独立检查结果：

- `PRAGMA integrity_check`：`ok`；
- `PRAGMA foreign_key_check`：空；
- `python3 scripts/validate_master.py <B13-master-copy-followup>`：`verdict=pass`，无 errors/warnings。

### Focused assertions

- `V1-REL-0247`、`V2-GEO-REL-067`、`V1-REL-0257`、`V1-REL-0258` 均以 `V1-ENT-0096` 为 Cuba 端点；`V1-REL-0259` 以 `V1-ENT-0051` 为 México 端点。Geo CSV 与副本 relationships 的 subject/object 完全一致。
- 副本中的 `V1-ENT-0327` 为 `《热带黎明景观》 / Vista del amanecer en el trópico`，`V1-ENT-0328` 为 `《哈瓦那，一个早夭婴儿的回忆》 / La Habana para un infante difunto`；`0328` 没有 `genre_or_form` fact，`0327` 也保持形式开放。
- `V1-FCT-0865`、`V1-FCT-0885`、`V1-FCT-0888` 的 `fact_field` 均为 `composition_year`，usage note 分别限定讲座、书信完成和首演语义；不存在 `V1-FCT-0877`。
- `V1-FCT-0866` 已改为来源直接支持的 `讲演系列`；不再使用此前偏强的“文化随笔”标签。`SRC-0249` 对 1974/1987 双条目已降为 medium provisional，并在 usage note 中保留冲突说明。
- `SRC-0247` 的 `processing_status=access_limited`，`SRC-0251.canonical_url=https://repositorio.unam.mx/contenidos/5059605`；两项 metadata 与 remediation 一致。
- B14 Curation 的 3 个作者、9 个作品共 305 个 research/source refs 在已重放副本的 facts、relationships、sources 中全部可解析，且没有 `V1-FCT-0877`；全部仍是 `user_review`/`UNREVIEWED`，不构成 USER 批准或 formal public release。

### 最终 Follow-up 结论

前一轮的 P0 migration schema 阻断已修复并通过副本重放、完整性、外键和 master validator；研究语义与 Geo/Curation 断言也全部复核通过。

**最终判定：PASS**

该 PASS 仅表示 B14 fresh-context Research/Integration 复核通过；正式主库应用、Web Data、浏览器 QA 和独立 Git gate 仍须由集成流程继续完成。本次 reviewer 没有修改正式 master DB。
