# WEB-CE-B05 Independent Fresh Review

- Reviewer：`CODEX-REVIEW`（fresh context；未修改主库、候选包或迁移）
- 审核日期：2026-08-20
- 审核范围：`PREFLIGHT.md`、`RESEARCH_CHANGE_SET.json`、`0008_web_ce_b05_luna_max.sql` 及迁移后的临时副本（仓库外）
- 方法：逐项重新打开登记的 ABL、BNDigital、公共图书馆、公共文化机构、GeoNames 和 MEC 入口；核对来源对象、原文题名/年份、中文展示名、实体层、事实、关系方向、来源挂接和地图边界。

## 总体判词：REVISE

本批主体范围和数据结构成立：3 位作者、7 部 `work`、2 部 `collection`，共 12 个新实体、12 张卡片、42 条事实和 12 条关系；正式巴西节点 `V1-ENT-0183` 被正确复用，没有新增出生地或作品地点节点。所有 `CREATED` 关系均为作者 → 作品/作品集，3 条作者 → 巴西关系均为 `ASSOCIATED_WITH_PLACE`，方向和端点正确。

但当前仍有 4 项最小修复项，因此不能给整包 `PASS`：

1. `SRC-0176` 登记为 `access_pass` 的 MEC 直链在独立重开时返回抓取错误/403，不能按当前 URL 作为已打开来源使用。
2. Machado 三张作品卡的 `genre_or_form=小说` 没有与当前卡片来源完全对齐：ABL `Bibliografia` 页面直接列题名和年份，但不在这些条目处标明体裁；`V1-CARD-0102`、`V1-CARD-0103` 更只挂了 `SRC-0166`。
3. `V1-FCT-0497` 的值已收窄为“作家”，但其唯一 `origin_id/fact_source` 仍是 ABL `Perfil`（`SRC-0168`）；该页直接给出生卒、出生地和巴西，不直接写职业。ABL 相关报道 `SRC-0170` 明确称 Rosa 为 `escritor`，应把事实挂到直接来源。
4. BNDigital 页面可打开且直接列出 Graciliano 的生卒、出生地和三部作品，但页面正文末尾明确写 `Fonte: https://pt.wikipedia.org/wiki/Graciliano_Ramos`。本批没有把该页的评价性文字写成事实，这是正确的；不过 `V1-REL-0146`—`V1-REL-0148` 的唯一关系证据仍是 `SRC-0171`，应补挂同批可打开的公共图书馆/市文化来源，避免让作者—作品关系只依赖 Wikipedia 署名段落。

上述均为局部来源/映射修复，不构成整批拒绝。

## 1. 迁移、规模和去重检查

在迁移后的临时副本（仓库外）上：

- `python3 scripts/validate_master.py <temporary-copy>`：`verdict=pass`；无 errors/warnings；`schema_version=0.3`。
- `PRAGMA integrity_check`：`ok`；`PRAGMA foreign_key_check`：0 条。
- 计数：entities 220、facts 518、relationships 149、sources 174、content_cards 111；与 B04 基线及 B05 增量一致。
- B05 新增范围实际为 12 entities、12 entity maps、12 cards、42 facts、12 relationships、12 sources、28 card-source rows；所有端点和外键有效。
- 按原文作者名、作品名、重音变体、中文展示名和 `subject + relation_type + object` 查重，没有发现与 B04 主库或 B05 内部重复。
- `V1-ENT-0183` 是既有正式巴西国家实体；没有把 Rio de Janeiro、Cordisburgo、Quebrangulo 或作品中的区域自动写成地图地点，也没有虚构坐标或 `SET_IN`/出生关系。

## 2. 来源身份、可打开性与证据对象

### 通过的来源

- `SRC-0165`：[ABL Machado de Assis - Biografia](https://www.academia.org.br/academicos/machado-de-assis/biografia) 可打开；页面直接给出 Machado 的 1839/1908、生于 Rio de Janeiro，以及 jornalista、contista、romancista、poeta、teatrólogo 等职业身份。
- `SRC-0166`：[ABL Machado de Assis - Bibliografia](https://www.academia.org.br/academicos/machado-de-assis/bibliografia) 可打开；直接列出 `Memórias póstumas de Brás Cubas`（1881）、`Quincas Borba`（1891）和 `Dom Casmurro`（1899）。
- `SRC-0167`：[ABL Textos escolhidos](https://www.academia.org.br/academicos/machado-de-assis/textos-escolhidos) 可打开；选文页在选段末直接标注 `Memórias póstumas de Brás Cubas, 1881`，可作作品文本/年份补充，不替代书目页。
- `SRC-0168`：[ABL João Guimarães Rosa profile](https://www.academia.org.br/academicos/joao-guimaraes-rosa) 可打开；直接给出 1908-06-27、Cordisburgo - MG、Brasil 和 1967-11-19。
- `SRC-0169`：[ABL Guimarães Rosa - Bibliografia](https://www.academia.org.br/academicos/joao-guimaraes-rosa/bibliografia) 可打开，并直接标出 `Sagarana, contos (1946)`、`Grande sertão: Veredas, romance (1956)`、`Primeiras estórias, contos (1962)`；Guimarães 的 `work/collection` schema 与年份有直接支持。
- `SRC-0170`：[ABL related article](https://www.academia.org.br/noticias/abl-na-midia-esquerda-grande-sertao-veredas-faz-70-anos-e-permanece-instigante) 可由 ABL profile 的相关链接打开；页面题名、正文和日期均与 ABL 对象一致，并直接称 Rosa 为 `escritor`。该页的评价性语句没有被本批升级为 Research fact，处理正确。
- `SRC-0171`：[BNDigital Graciliano Ramos](https://bndigital.bn.gov.br/graciliano-ramos/) 可打开；页面直接列出 Graciliano Ramos、1892/1953、Quebrangulo，以及 1934 `São Bernardo`、1936 `Angústia`、1938 `Vidas Secas`。但页面第一个正文来源脚注明确指向 Wikipedia（见第 4 节），其文学评价不能作为独立机构研究使用。
- `SRC-0172`：[Biblioteca Pública do Paraná - Making of Vidas Secas](https://www.bpp.pr.gov.br/Candido/Pagina/Making-Vidas-Secas) 可打开；直接写出 `Vidas secas` 于 1938 出版，并回溯 `São Bernardo (1934)`、`Angústia (1936)`。
- `SRC-0173`：[Prefeitura de São Paulo cultural page](https://prefeitura.sp.gov.br/web/cultura/w/133-anos-de-graciliano-ramos-5-obras-para-voc%C3%AA-conhecer-a-ess%C3%AAncia-liter%C3%A1ria-do-escritor-que-faz-anivers%C3%A1rio-nesta-segunda-27-smc) 可打开；页面直接把三部作品分别列为 1934、1936、1938 的 romance，并支持三部作品的 `work` schema 和卡片体裁。
- `SRC-0174`：[Itaú Cultural - Os 70 anos da morte de Graciliano Ramos](https://www.itaucultural.org.br/secoes/series/os-70-anos-da-morte-de-graciliano-ramos) 可打开；直接给出生卒、Quebrangulo、作者身份和三部作品书目/体裁补充。
- `SRC-0175` GeoNames URL 仅作为既有巴西国家节点的地理身份来源，未被误用为作者或作品文学证据。

### 需要返修的来源

`SRC-0176` 登记为 [MEC Machado text-fonte download](https://machado.mec.gov.br/obra-completa-lista/item/download/16_ff646a924421ea897f27cf6d21e6bb23)，但独立打开该下载 URL 得到内部抓取错误；对 `machado.mec.gov.br` 入口的直接打开也返回 403。当前 `source_registry` 和迁移仍把它标为 `access_pass`，并在 `V1-CS-0191` 挂为已使用来源。

最小修复：要么补一个实际可打开的官方 MEC 原文入口并更新 URL/标题/访问状态，要么改用可打开的官方 [MEC Romance category page](https://machado.mec.gov.br/obra-completa-lista/itemlist/category/23-romance)（该页直接列出三部 Machado 小说及 1881/1891/1899），并同步更新 source metadata 与 card-source 映射。若不再需要文本入口，则应从 `V1-CARD-0101` 移除 `SRC-0176`，不能继续保留 `access_pass`。

## 3. 实体、原文题名、中文展示名和 work/collection schema

### 通过

- Machado：`V1-ENT-0211` 为 `author`，三部作品 `V1-ENT-0214`—`0216` 为 `work`；ABL 书目题名与年份一致。
- Guimarães：`V1-ENT-0212` 为 `author`，`Grande Sertão: Veredas` 为 `work`，`Sagarana` 与 `Primeiras Estórias` 为 `collection`；ABL 书目明确区分 `romance` 与 `contos`，schema 正确。
- Graciliano：`V1-ENT-0213` 为 `author`，三部小说为 `work`；公共文化页面将三部目标标题列为 romance，schema 正确。
- `马查多·德·阿西斯` 与 `若昂·吉马朗埃斯·罗萨` 均是路线图中可接受的中文读者展示候选；中文名不是原文规范字段，且每张卡/实体均保留葡萄牙语原文锚点。Guimarães 在中文出版/百科语境另见“吉马良斯/吉马朗伊斯”等转写，但当前候选并不造成实体歧义，无需因译名变体拆分实体。
- Graciliano 的 `格拉西利亚诺·拉莫斯`、作品的中文名也均作为读者展示候选使用，没有把译名当作版本学事实。未发现标题因中文展示名而重复或错配。

### 需要返修的体裁证据映射

`V1-CARD-0101`—`V1-CARD-0103` 的 `genre_or_form` 均为“小说”，正文也写“小说形态”。但当前 `SRC-0166` 的 ABL `Bibliografia` 页面只逐项列题名和年份，没有在这三个条目处给出 `romance`/小说体裁；`SRC-0167` 是选文页，也不是三部作品的体裁目录。`V1-CARD-0102`、`V1-CARD-0103` 的 SQL card/source 映射甚至只有 `SRC-0166`（`V1-CS-0192`、`V1-CS-0193`）。

最小修复：使用可打开的 MEC Romance 目录或其他直接权威体裁来源，并至少把同一直接来源挂到三张 Machado 作品卡；同时把 `SRC-0166.public_content_scope` 和 `V1-FCT-0484/0487/0490` 的说明收敛为来源实际直接支持的题名/年份，或明确补上体裁来源。不能仅凭常识或标题把“小说”写入卡片。

## 4. 事实与来源支持

### 通过的事实

- Machado 的 1839、1908、Rio de Janeiro 和职业事实可由 `SRC-0165` 直接回查；三部作品年份可由 `SRC-0166`，其中 1881 另有 `SRC-0167`。
- Guimarães 的 1908、1967、Cordisburgo 和 Brazil 可由 `SRC-0168` 直接回查；三部作品的形态和年份可由 `SRC-0169`。
- Graciliano 的 1892、1953、Quebrangulo、作者身份和三部作品年份/体裁可由 `SRC-0171`、`SRC-0172`、`SRC-0173`、`SRC-0174` 交叉回查；BNDigital 的 Wikipedia footer 没有被错误升级为文学史评价。
- 所有出生地均保留为 `birth_place` 事实，没有生成不存在的 `BORN_IN` 关系；没有把作者出生地转成作品场景。

### `V1-FCT-0497` 的 Guimarães career_note

当前值“作家”本身已经是克制、可接受的最小表述，但 SQL 中 `origin_id='SRC-0168'` 且 `fact_sources` 只有 `SRC-0168`。ABL profile 页是学术档案数据页，直接显示日期、出生地和 Brazil，没有直接职业标签；ABL 相关报道 `SRC-0170` 正文明确出现“apesar de ter sido escritor”。

最小修复：把 `V1-FCT-0497` 的 `origin_id/fact_source` 改挂 `SRC-0170`，或补挂 `SRC-0170` 并在 usage note 中准确说明；保留“作家”即可，不要恢复外交官、医生等本批未由该事实来源直接承载的履历。

## 5. 关系方向、证据和 Brazil 复用

### 通过

- `V1-REL-0140`—`0148` 均为 `author → CREATED → work/collection`，没有反向端点，也没有主题、运动、影响、事件或地点解释关系。ABL 书目、BPP/Prefeitura/BNDigital 的直接作品列举足以支持结构型关系。
- `V1-REL-0149`—`0151` 均为 `author → ASSOCIATED_WITH_PLACE → V1-ENT-0183`。Guimarães ABL profile 明确写 `Brasil`；Machado 和 Graciliano 的身份/出生地与巴西语境来源相符；国家节点正确复用，未新造地点。
- 关系 evidence/source ID 均存在，`evidence_count=1` 与实际 evidence 行一致，SQL source URL 与 JSON registry URL 逐项一致（包括 Prefeitura URL 的编码）。

### BNDigital footer 下的关系证据

`V1-REL-0146`（Vidas Secas）、`V1-REL-0147`（São Bernardo）和 `V1-REL-0148`（Angústia）目前的唯一 `relationship_evidence`/`relationship_sources` 是 `SRC-0171`。BNDigital 页虽为可识别的国家图书馆数字页面，但正文在末尾明确以 Wikipedia 为来源；这不影响页面直接显示的日期/题名作为待核事实线索，却不应让三条结构关系只依赖该 Wikipedia-attributed 文本。

最小修复：为三条关系各补挂 `SRC-0172` 或 `SRC-0173` 的直接作品书目证据（两页均已在本批 card/source 中使用且可打开），并在 evidence note 中说明其支持作者—作品对应；BNDigital 可保留为补充来源。不要引用 BNDigital 的“最伟大”“Romance de 30”或类似评价来扩大关系语义。

## 6. SQL card/source 映射复核

通过项：

- `V1-CARD-0100`—`0103` 的 Machado 作者/作品主体映射正确；`V1-CARD-0104`—`0107` 的 Guimarães 映射正确；`V1-CARD-0108`—`0111` 的 Graciliano 映射正确。
- `V1-CS-0186`—`V1-CS-0213` 共 28 行，均指向存在的 card/source，且来源级别、用途状态、`bibliographic_support`/`research_support` 字段没有悬空外键。
- JSON source registry 与 SQL `sources.canonical_url` 逐项相同；没有发现 URL 被错挂到别的 `SRC`。

需随上列修复同步：

- `V1-CS-0191` 当前指向不可独立打开且仍为 `access_pass` 的 `SRC-0176`。
- `V1-CS-0192`、`V1-CS-0193` 未挂可直接支持“小说”体裁的来源；若用 MEC Romance 目录，应补到 `V1-CARD-0102`、`V1-CARD-0103`，并复核 `V1-CARD-0101` 的来源角色。
- `V1-FCT-0497` 的事实来源应与 `SRC-0170` 对齐。
- `V1-EV-0168`—`V1-EV-0170` 应增加 `SRC-0172/0173` 的交叉证据，或明确改用可直接支撑关系的公共文化来源。

## 7. 最小返修清单与最终结论

1. 修正/替换 `SRC-0176` 的不可打开 URL 和 `access_pass` 状态；同步 `source_registry`、SQL source metadata 和 `V1-CS-0191`。
2. 为 `V1-CARD-0101`—`0103` 的“小说”体裁补直接来源并修正 card/source 映射；收敛 ABL `SRC-0166` 的 `public_content_scope`，使其不再声称页面直接标注体裁。
3. 将 `V1-FCT-0497` 的来源挂到直接称 Rosa 为 `escritor` 的 `SRC-0170`；值保持“作家”。
4. 为 Graciliano 三条 `CREATED` 关系补挂 `SRC-0172` 或 `SRC-0173` 的直接公共文化证据；BNDigital 只保留为有明确 provenance 注记的补充来源，不使用其 Wikipedia-derived 评价。
5. 返修后在新副本重跑迁移、`validate_master.py`、integrity/FK check，并做上述四项 focused follow-up review。

**当前整包 verdict：REVISE。**

## 8. 返修后 focused follow-up（2026-08-20）

本节取代上文基于旧迁移副本的 REVISE 判词。返修后的 fresh migration 临时副本位于仓库外；本次复核未修改主库、候选包或迁移。

### 返修项核验

- `SRC-0176` 已改为可识别的官方 MEC `Machado de Assis - Romance` 目录，标题和 URL 均为 `https://machado.mec.gov.br/obra-completa-lista/itemlist/category/23-romance`，有效状态为 `access_pass`。该目录直接列出 `Memórias Póstumas de Brás Cubas`（1881）、`Quincas Borba`（1891）和 `Dom Casmurro`（1899），并标明 Romance；`SRC-0166` 的范围已收窄为三部作品的题名与首版年份。
- Machado 的 `V1-CARD-0101`—`V1-CARD-0103` 均已挂 `SRC-0176`；`V1-FCT-0484`、`0487`、`0490` 的 `origin_id` 与新增 `fact_sources` 均对齐 `SRC-0176`，卡片体裁“小说”有直接来源支撑。
- `V1-FCT-0497` 的值仍为最小表述“作家”，`origin_id` 已改为 `SRC-0170`，且 `fact_sources` 已补挂 ABL 相关报道；该页直接出现 `escritor`，未扩写外交或医学履历。
- `V1-REL-0146`—`V1-REL-0148` 的 `evidence_count` 均为 2，且 `relationship_evidence`/`relationship_sources` 均同时包含 BNDigital `SRC-0171` 与 Prefeitura `SRC-0173`；公共文化页面作为第二条直接作者—作品书目证据，关系语义仍限定为 `CREATED`。

### focused 机器结果

- `python3 scripts/validate_master.py <temporary-remediation-copy>`：`verdict=pass`，无 errors/warnings，schema `0.3`。
- `PRAGMA integrity_check`：`ok`；`PRAGMA foreign_key_check`：0 条。
- B05 增量仍精确为 12 entities、42 facts、12 relationships、12 sources、12 content cards；返修后 card-source 总量为 30，外键与来源 ID 均有效。
- 12 个新实体中 3 个 `author`、7 个 `work`、2 个 `collection`；原文题名、年份、中文展示名均与研究变更集一致。`Sagarana`、`Primeiras Estórias` 保持 `collection`，其 ABL 书目形态为 `contos`。
- 9 条 `CREATED` 关系均为作者 → 作品/作品集；3 条 `ASSOCIATED_WITH_PLACE` 均为作者 → 已有巴西节点 `V1-ENT-0183`。未新增地点、出生/场景关系或坐标。

**最终 verdict：PASS。**
