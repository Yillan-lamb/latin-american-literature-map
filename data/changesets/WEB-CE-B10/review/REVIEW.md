# WEB-CE-B10 独立复核

## 结论：REVISE

本批的来源可访问性、关键年份、作者/作品去重、作品层级、关系端点、关系类型、Geo 边界和策展准入总体通过；但候选、卡片与迁移之间仍有三处可复核不一致，且迁移文件当前不能通过项目规定的 `apply_migration.py` 门禁。修复并重放迁移前不应进入正式 master。

## 复核范围与临时数据库

- 在 fresh-context 中读取 `RESEARCH_CHANGE_SET.json`、`0013_web_ce_b10_luna_max.sql`、`curation/PUBLIC_CONTENT.json`、B10 README/PREFLIGHT，以及当前正式 `data/master/V1_MASTER.sqlite`。
- 将正式 master 复制到 `/private/tmp/lalm-b10-review-agent.sqlite` 后应用 0013 SQL；未修改正式 master、候选、迁移、Geo 或公开导出。
- 临时数据库新增 11 sources、12 entities、42 facts、12 content cards、12 relationships；`scripts/validate_master.py` 返回 `verdict=pass`，`integrity_check=ok`，`foreign_key_check` 无错误。

## 11 个登记来源的重新打开与证据

以下登记 URL 本次均能重新打开；来源身份、登记 URL 和 `access_pass` 状态与候选/临时数据库一致。

| source | 重新打开后可定位的证据 |
|---|---|
| `SRC-0214` [Uruguay Educa](https://uruguayeduca.anep.edu.uy/efemerides/nace-eduardo-galeano) | 官方 ANEP 页面确认 Galeano 生于 Montevideo（1940），年表列出 `Las venas abiertas...`（1971）、`Memoria del fuego I. Los nacimientos`（1982）和 `El libro de los abrazos`（1989）。 |
| `SRC-0215` [Argentina Cultura](https://www.cultura.gob.ar/eduardo-galeano-uruguayo-de-nacimiento-latinoamericano-por-opcion-11057/) | 官方文化部页面确认乌拉圭身份、1940/2015 生卒与 Montevideo，并列出 1971 作品、`Memorias del fuego` 三部曲和 `El libro de los abrazos`。 |
| `SRC-0216` [乌拉圭议会图书馆目录](https://pmb.parlamento.gub.uy/pmb/opac_css/index.php?id=315&l_typdoc=&lvl=author_see&nb_per_page_custom=25&nbr_lignes=100&page=3) | 作者页能打开并列出 `El libro de los abrazos`；`Memoria del fuego` 目录记录可沿页面链接打开，明确显示 Galeano、3 卷及内容 `Los nacimientos ... v. 1`。 |
| `SRC-0217` [Piglia 作者/作品页](https://piglia.pubpub.org/) | 作者维护页确认 Adrogué、1940，并在作品段落同时列出 `Respiración Artificial (1980)`、`Plata quemada (1997)`、`Blanco nocturno (2010)`。 |
| `SRC-0218` [Princeton University Library](https://library.princeton.edu/about/library-news/2018/now-open-research-papers-ricardo-piglia-distinguished-latin-american) | Princeton 页面确认 Piglia 为 Argentine author and critic，列出 `Respiración artificial`、`Blanco nocturno`，并提到 `Plata quemada`。 |
| `SRC-0219` [UNLP《La Plata: Una geografía literaria》](https://www.memoria.fahce.unlp.edu.ar/libros/pm.895/pm.895.pdf) | PDF 的 Piglia 条目确认 Adrogué、1940/2017，并列出五部小说中的 `Respiración artificial (1980)`、`Plata quemada (1997)`、`Blanco nocturno (2010)`。 |
| `SRC-0220` [阿根廷国家图书馆](https://www.bn.gov.ar/noticias/23-de-febrero-de-1949-nace-cesar-aira) | Biblioteca Nacional 页面确认 Aira 于 1949 年出生于 Coronel Pringles，并称其为阿根廷作家。 |
| `SRC-0221` [Fundación Konex](https://www.fundacionkonex.org/b2344-cesar-aira) | Konex 作者页确认 Aira 1949 年出生、译者/小说家等身份，并列出 `Ema la cautiva`、`Una novela china`、`El congreso de literatura`。 |
| `SRC-0222` [Dialnet 学术论文 PDF](https://dialnet.unirioja.es/descarga/articulo/5228514.pdf) | 论文摘要明确写出 `Una novela china (1987), de César Aira`，并讨论其小说/中国主题。 |
| `SRC-0223` [UNLP 学术论文 PDF](https://www.memoria.fahce.unlp.edu.ar/trab_eventos/ev.11711/ev.11711.pdf) | PDF 书目信息显示作者 María Belén Riveiro；正文明确写出 Aira 的第一本书 `Ema, la cautiva` 于 1981 年出版。 |
| `SRC-0224` [Dialnet 学术论文 PDF](https://dialnet.unirioja.es/descarga/articulo/7047139.pdf) | 论文题名和摘要明确写出 `El congreso de literatura de César Aira (1997)`，并称其为 novela corta、情节在委内瑞拉文学会议展开。 |

### 重点年份复核

- Galeano：`1971 / 1982 / 1989` 均可在 `SRC-0214` 年表直接定位；`SRC-0215` 和 `SRC-0216` 对相应题名/书目提供补充支持。
- Piglia：`1980 / 1997 / 2010` 可在 `SRC-0217` 作者页和 `SRC-0219` UNLP PDF 直接定位，`SRC-0218` 补充作品身份。
- Aira：`1981` 可在 `SRC-0223` 直接定位，`1987` 可在 `SRC-0222` 直接定位，`1997` 可在 `SRC-0224` 直接定位；`SRC-0221` 补充三部作品与作者归属。

## 已通过检查

### 实体、去重与作品层级

- 候选包含 3 位 author、9 部 work/collection；临时库中为 `V1-ENT-0272`—`V1-ENT-0283` 共 12 个新实体。
- 与正式 master 的 `original_name`、`name_zh` 及作者—作品端点核对，没有作者或作品重复实体。
- `V1-ENT-0276`（`Memoria del fuego I. Los nacimientos`）和 `V1-ENT-0277`（`El libro de los abrazos`）标为 `collection`；其余 7 部作品标为 `work`。实体 `entity_type`、`entity_layer` fact 和 card `card_type` 一致。

### Facts、sources、cards 与 relationships

- 42 个 B10 facts 均有合法 subject、card、origin source，并各有 `fact_sources` 与 `card_facts` 链接；来源标题与登记标题一致。
- 12 条关系均有合法 source、evidence，`evidence_count=1` 与实际 evidence 行一致；无悬空端点或重复 source link。
- 关系恰为 9 条作者 → 作品的 `CREATED` 和 3 条作者 → 国家节点的 `ASSOCIATED_WITH_PLACE`；关系类型均在 schema 允许集合内，无 `INFLUENCED_BY` 或虚构主题关系。
- 中文作者/作品展示名与路线图现有标签总体一致，原文题名均保留，`common_title` 没有伪装成特定中译版本、译者或出版社事实。

### Geo 与 Curation

- 候选 `places=[]`，迁移没有插入新地点或坐标；3 条地点关系复用既有乌拉圭 `V1-ENT-0196` 和阿根廷 `V1-ENT-0001` 国家节点。没有新的现实坐标、虚构故事坐标或越界 Geo 行。
- `PUBLIC_CONTENT.json` 有 3 个作者条目、9 个作品条目；递归检查到的 90 个带状态字段全部为 `user_review`，reviewer 全部为 `UNREVIEWED`。所有 research/source/target 引用均能在临时数据库解析。

## 必须修订的最小项目

### P1：`V1-ENT-0277` 的候选来源没有完整进入 card_sources

候选 `RESEARCH_CHANGE_SET.json` 给 `V1-ENT-0277` 的 `source_ids` 为 `SRC-0214,SRC-0215,SRC-0216`；但迁移后 `V1-CARD-0165` 只有 `SRC-0214` 和 `SRC-0216` 两条 `card_sources`，缺少 `SRC-0215`。这不是无关来源：`SRC-0215` 正文明确把 `El libro de los abrazos` 列为 Galeano 的重要作品。

最小修复：新增一条 `V1-CARD-0165`—`SRC-0215` card-source（下一个可用 ID，例如 `V1-CS-0343`），并同步候选/矩阵；或者明确从候选 work 的 `source_ids` 删除 `SRC-0215` 并同步所有引用。按当前来源正文，建议补 card-source。

### P1：Galeano 的 `country_or_region` 候选字段缺少 fact

候选作者 `V1-ENT-0272` 明确写有 `country_or_region: 乌拉圭`，且卡片、`V1-REL-0209` 和其 evidence 均使用该身份；但迁移 facts 只有 `birth_year`、`death_year`、`birth_place`、`career_note`、`literary_identity`，没有 `country_or_region=乌拉圭` fact。Piglia 和 Aira 的同名字段均有 facts，造成批内不一致，也使候选作者字段没有完整的 fact/source 链。

最小修复：新增 Galeano 的 `country_or_region=乌拉圭` fact，以 `SRC-0215` 为 origin，补 `fact_sources` 和 `card_facts`，并重新核对计数；或者若项目决定只以国家关系承载该字段，则从候选作者字段中删除它并同步 curation/card 语义，不能保持当前半隐式状态。

### P2：中文展示名的罗马数字与路线图不一致

路线图使用 `《火的记忆Ⅰ：创世纪》`（Unicode `Ⅰ`、无空格），但候选、迁移实体/card/relationship 以及 curation 文本使用 `《火的记忆 I：创世纪》`（ASCII `I`、前有空格）。这会造成 reader-facing label 的不一致，虽不影响原文题名 `Memoria del fuego I. Los nacimientos`。

最小修复：将候选、migration、cards、relationship description 和 curation 中的中文展示标签统一为路线图的 `《火的记忆Ⅰ：创世纪》`；只改展示名，不改 original title、卷册层级或年份。

### P2：0013 迁移无法通过项目规定的 apply_migration 门禁

`data/master/migrations/README.md` 明确规定迁移文件不得包含 `BEGIN`/`COMMIT`，事务由 `scripts/apply_migration.py` 管理；而 `0013_web_ce_b10_luna_max.sql` 第 2 行和第 166 行包含这两个事务控制语句。复现：

```text
python3 scripts/apply_migration.py ... 0013_web_ce_b10_luna_max.sql --task-id WEB-CE-B10 --reviewer B10-review --dry-run
→ migration SQL must not contain transaction control statements
```

本次为满足复核要求用 sqlite3 在临时副本中重放，故数据库完整性验证通过，但正式入库前应移除迁移文件自身的事务包装，并通过 `apply_migration.py` 重新 dry-run/正式重放和验证。

### P2：`SRC-0223` 的来源作者元数据应与 PDF 书目信息对齐

`SRC-0223` PDF 首页明确署名 María Belén Riveiro，且后续写出其 CONICET/UBA 所属；当前 migration 的 `author_or_editor` 却填为 `Universidad Nacional de La Plata`，同时把同一机构填为 publisher。机构可作为发布/收录方，但不能替代已明确的作者身份。

最小修复：将 `SRC-0223.author_or_editor` 改为 `María Belén Riveiro`，publisher 保留为 UNLP/Facultad 的实际发布方，并同步候选来源登记后重跑来源身份检查。该元数据不影响 Ema 1981 的事实结论，但会影响来源身份可追溯性。

## 复核结语

除上述修订项外，本批关键来源均可打开，Galeano/Piglia/Aira 指定年份均有直接证据，作者/作品去重、work/collection 层级、FK 与 evidence 链、关系类型/端点、无新增 Geo 坐标以及全量 `user_review` 均通过。修复后应重新复制当前正式 master、重放 0013、运行 `apply_migration.py` 与 `validate_master.py`，再进行一次 fresh-context follow-up；本次未修改 candidate、migration、master 或 Geo。

## Follow-up review（fresh-context，2026-08-21）

### Follow-up verdict：PASS

本次只读取修复后的 `RESEARCH_CHANGE_SET.json`、`0013_web_ce_b10_luna_max.sql`、`curation/PUBLIC_CONTENT.json`、B10 README/PREFLIGHT 和正式 `data/master/V1_MASTER.sqlite`，并将正式 master 复制为 `/private/tmp/lalm-b10-followup-fresh.sqlite`。未写入正式 master、candidate、migration、Geo 或公开导出；本节是对上轮 REVISE 项的独立复核。

### 修复项逐项复核

- `V1-CARD-0165` 的 `card_sources` 现在正好包含 `SRC-0214`、`SRC-0215`、`SRC-0216`；候选 `V1-ENT-0277.source_ids` 与之逐项相等，新增 `V1-CS-0343` 已生效。
- Galeano 的 `V1-FCT-0731` 为 `country_or_region=乌拉圭`，`origin_id=SRC-0215`，对应 1 条 `fact_sources` 和 1 条 `card_facts`；该 fact 的 subject/card 均为 `V1-ENT-0272`/`V1-CARD-0160`。
- 候选、迁移实体与 card、`V1-REL-0201` relationship description、策展文本均统一使用 `《火的记忆Ⅰ：创世纪》`；对 JSON、SQL、cards、relationships 和 curation 的字符串扫描未发现 ASCII `《火的记忆 I：创世纪》` 变体。原文题名 `Memoria del fuego I. Los nacimientos`、`collection` 层级和 1982 年未改变。
- 迁移文件无 `BEGIN`、`COMMIT` 或 `ROLLBACK`。从当前 master 新复制的临时副本上，`apply_migration.py --dry-run` 成功（sha256=`a5090c783c90c2a2d115accf2b8d77116ecd807eb9d1a9cb45838ee48e88e64a`），随后正式重放成功；正式重放后的 `migration_log` 记录 task `WEB-CE-B10`、reviewer `B10-followup-review`。脚本后置验证通过，`PRAGMA integrity_check` 为 `ok`，`PRAGMA foreign_key_check` 为空。
- `SRC-0223` 已改为 `author_or_editor=María Belén Riveiro`，`publisher=Universidad Nacional de La Plata`，`publication_year=2018`；与 PDF 首页书目信息一致。

### 批量结构与来源复核

- 临时库本批精确新增/写入 11 sources、12 entities、43 facts、12 content cards、12 relationships（上轮 42 facts 加入 Galeano country fact 后为 43）。候选字段与数据库逐字段核对无差异；12 entities 为 3 author、7 work、2 collection，所有作品的 `entity_layer` fact、entity type 与 card type 一致。
- 11 个登记来源 URL 均重新打开且标题、来源级别、`access_pass` 与 registry/数据库一致：`SRC-0214` ANEP 年表支持 Galeano 1940、1971/1982/1989；`SRC-0215` 阿根廷文化部支持乌拉圭身份、1940/2015、1971 作品及 `El libro de los abrazos`；`SRC-0216` 乌拉圭议会目录确认 Galeano 作者身份、`Memoria del fuego` 的 `Los nacimientos` 第一卷层级及 `El libro de los abrazos`；`SRC-0217` Piglia 作者页列出 1980/1997/2010 三部小说；`SRC-0218` Princeton（页面年份 2018）确认 Argentine author/critic 及三部作品；`SRC-0219` UNLP PDF 确认 Adrogué、1940/2017 与 1980/1997/2010；`SRC-0220` 阿根廷国家图书馆（页面年份 2026）确认 Aira 1949、Coronel Pringles、阿根廷身份；`SRC-0221` Konex 确认 Aira 1949、译者/小说家及三部作品；`SRC-0222` Dialnet 论文（2013）明确 `Una novela china (1987), de César Aira`；`SRC-0223` UNLP 论文（2018）署名 María Belén Riveiro，并明确 `Ema, la cautiva` 为 Aira 1981 年第一本书；`SRC-0224` Dialnet 论文（2017）明确 `El congreso de literatura` 为 1997 年的短篇小说。上述来源身份、登记年份和事实年份均可回溯。
- 43 个 facts 均有合法 subject/card/origin source，并各有 `fact_sources`、`card_facts`；来源标题与 `sources.title` 无不一致。12 条关系均有合法 source 与 evidence，`evidence_count=1` 等于实际 evidence 行数，未发现悬空端点、重复 source link 或非法关系类型。关系仍恰为 9 条 author→work `CREATED` 和 3 条 author→既有国家节点 `ASSOCIATED_WITH_PLACE`：乌拉圭 `V1-ENT-0196`、阿根廷 `V1-ENT-0001`。
- Geo 复核确认候选 `places=[]`，本次 12 个新实体中无 place 类型、无新增坐标/地点行；3 个地点关系只复用上述既有国家节点，未把小说中的中国、委内瑞拉梅里达等叙事/出版语境伪造为 Geo 节点。
- `PUBLIC_CONTENT.json` 仍为 3 authors、9 works；递归检查 90 个带状态字段全部为 `user_review`，reviewer 全部为 `UNREVIEWED`，所有 `target_id`、`research_refs`、`source_refs` 和 `next_reads` 引用均能解析到本批实体、事实、关系或来源。

综上，首轮 REVISE 的五项修复均已落地并经临时副本正式重放验证；来源、年份、实体层级、关系端点、Geo 边界和策展状态没有发现新的阻断项。本 Follow-up verdict 为 **PASS**；正式 master 仍未被本次复核写入。
