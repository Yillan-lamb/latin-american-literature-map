# WEB-CE-B01-R1 / fuentes 独立审核

- Reviewer：`CODEX-REVIEW`（fresh context；未采用 PR #7 的 verdict、migration 或 public copy）
- 审核日期：2026-08-19
- 审核范围：`candidates/fuentes/` 下四个 CSV 与 `HANDOFF.md`；准入依据为 `project/governance/PROJECT_CHARTER.md` 1.6.0 与《数据新增与版本维护操作手册》1.1
- 判定口径：逐一重新打开候选 URL；核对来源身份、对象层级、证据直接性、中文释义边界、关系来源要求、中文书目状态和批次规模。无法核验即 fail-closed。
- 初审 verdict：**REVISE（部分可准入）**。来源、事实和关系主体证据链总体成立，但初审识别出的 1 条来源元数据、2 条释义型事实及 2 条中文书目审计记录须返修后复审。返修复审及整包最终 verdict 见第 9 节。

## 1. URL 复核与来源候选 verdict

| ID | verdict | 独立复核结果 |
|---|---|---|
| `CAND-R1-SRC-01` | **PASS** | 已重开 [El Colegio Nacional 人物页](https://colnal.mx/integrantes/carlos-fuentes/)；页面对象是 Carlos Fuentes，机构身份明确，直接显示作家身份、1928-11-11、2012-05-15、体裁活动及两部目标作品。B 级机构人物页及候选用途匹配。 |
| `CAND-R1-SRC-02` | **PASS** | 已重开 [ELEM 作者页](https://www.elem.mx/autor/datos/1162)；页面署名 Berenice Granados，并显示 FLM/ELEM、更新日期、人物生卒信息、墨西哥身份语境、体裁活动、boom 与两部作品的作品级段落。B 级机构百科页成立。候选 `2017` 可理解为页面所示 2017-12-05 更新年。 |
| `CAND-R1-SRC-03` | **REVISE** | 已重开 [ELEM 作品页](https://www.elem.mx/obra/datos/2611)；对象、作者、1958 首版、小说体裁、墨西哥城与形式分析均可核验，但页面明确署名 **Fabiola Camacho**。候选把 `author_or_editor` 仅写为“Fundación para las Letras Mexicanas”，遗漏页面作者。返修为个人作者 + 机构载体后可准入。 |
| `CAND-R1-SRC-04` | **PASS** | 已重开 [FCE 出版社页](https://www.fcede.es/site/es/libros/detalles.aspx?id_libro=5894)；直接显示书名、Carlos Fuentes、ISBN 9789681677886、2006 版信息，并明确以墨西哥城为作品场景。对象是具体版本页，B 级与用途匹配。 |
| `CAND-R1-SRC-05` | **PASS** | 已重开 [ELEM 作品页](https://www.elem.mx/obra/datos/195029)；直接显示作者、1962 首版、小说体裁，并汇集有版本归属说明的作品简介和叙事形式说明。作为具体机构作品页，B 级成立；引用其版本文案时应保留“页面汇集版本文案”的来源性质，不把所有文字误称为 ELEM 自撰研究。 |
| `CAND-R1-SRC-06` | **PASS** | 已重开 [WorldCat 记录](https://search.worldcat.org/title/1035925077)；直接显示 Carlos Fuentes、1962、1. ed.、Fondo de Cultura Económica、小说摘要及 OCLC 1482365986。对象层级为具体版次/馆藏记录，B 级书目用途成立。 |
| `CAND-R1-SRC-07` | **PASS** | 已重开 [Penguin Random House 版本页](https://www.penguinrandomhouse.com/books/328758/la-muerte-de-artemio-cruz-by-carlos-fuentes/)；直接显示书名、作者、1996、Penguin Books、ISBN 9780140255829 及低剧透简介。对象层级为具体版本页，B 级与用途匹配。 |

来源小计：**PASS 6 / REVISE 1 / HOLD 0（共 7）**。

## 2. 事实候选 verdict

| ID | verdict | 独立复核结果 |
|---|---|---|
| `CAND-R1-FCT-01` | **PASS** | 两个机构人物页均直接显示出生日期 1928-11-11。 |
| `CAND-R1-FCT-02` | **PASS** | 两个机构人物页均直接显示逝世日期 2012-05-15。 |
| `CAND-R1-FCT-03` | **PASS** | ELEM 明列长期居住/归化国家为 México，并在正文明确其墨西哥身份；“墨西哥”作为 `country_or_region` 有直接依据。不得由此改写出生地（出生地仍为巴拿马城）。 |
| `CAND-R1-FCT-04` | **PASS** | 两页直接支持其小说、短篇、散文、戏剧创作及 boom 成员身份；“重要作者”是对机构页重要性判断的克制合并，没有新增具体排名或影响关系。 |
| `CAND-R1-FCT-05` | **PASS** | ELEM 作品页直接显示第一版年份 1958。 |
| `CAND-R1-FCT-06` | **PASS** | ELEM 直接分类为 `Narrativa - Novela - Libros individuales`，译为“长篇小说”适当。 |
| `CAND-R1-FCT-07` | **PASS** | ELEM 作品分析直接涉及多阶层人物、不同声音、后革命社会与身份问题；FCE 具体作品页直接以墨西哥城及其社会类型为核心。中文是低剧透释义，未生成主题/事件关系。 |
| `CAND-R1-FCT-08` | **PASS** | ELEM 与 FCE 均直接把墨西哥城识别为作品城市/场景；作为 `setting_place` 事实可准入。本批未越权生成坐标或 `SET_IN` 关系。 |
| `CAND-R1-FCT-09` | **REVISE** | “多声部”“社会群像”“移动的城市镶嵌图”有 ELEM 直接依据，但“**非线性片段**”不是候选所列两页对本作的直接明确表述，属于额外形式判断。建议改为：“以多重人物声音与社会群像构成一幅不断移动的墨西哥城图景。”另：`SRC-02` 与 `SRC-03` 同属 ELEM/FLM，不能写成两项独立机构研究，不过本事实本身不要求双来源。 |
| `CAND-R1-FCT-10` | **PASS** | ELEM 与 WorldCat 均直接显示首版年份 1962。 |
| `CAND-R1-FCT-11` | **PASS** | ELEM 直接分类为小说；WorldCat 分类为 fiction。“长篇小说”可准入。 |
| `CAND-R1-FCT-12` | **PASS** | ELEM 版本文案直接显示临终回忆、革命经历、权力/财富与腐败；Penguin 页直接显示临终富有权势人物回忆其腐败一生。释义没有越出作品简介范围。 |
| `CAND-R1-FCT-13` | **PASS** | ELEM 与 WorldCat 的具体作品摘要均直接以 Artemio Cruz 为中心人物。 |
| `CAND-R1-FCT-14` | **REVISE** | ELEM 作品页直接支持三种叙述人称以及过去、现在、未来的交替；ELEM 作者页支持“三个叙述者、三个时间”。但“**呈现记忆与意识的断裂**”是进一步解释，候选两来源又属于同一 ELEM/FLM 来源体系，不能以“两项机构描述独立同意”加强它。建议缩为：“叙事交替使用第一、第二、第三人称，并在过去、现在与未来之间切换。” |

事实小计：**PASS 12 / REVISE 2 / HOLD 0（共 14）**。

## 3. 关系候选 verdict

| ID | verdict | 独立复核结果 |
|---|---|---|
| `CAND-R1-REL-01` | **PASS** | `author → CREATED → work` 端点和 Schema 0.3 相容。El Colegio Nacional 人物页与 ELEM 具体作品页均直接把 Carlos Fuentes 与 *La región más transparente* 对应；结构型关系无需双来源，但现有证据已充分。 |
| `CAND-R1-REL-02` | **PASS** | `author → CREATED → work` 端点和 Schema 0.3 相容。El Colegio Nacional、ELEM 具体作品页及 WorldCat 具体版次记录均直接对应 Carlos Fuentes 与 *La muerte de Artemio Cruz*。 |

关系小计：**PASS 2 / REVISE 0 / HOLD 0（共 2）**。本批没有解释型关系，因此不存在必须补第二独立来源却被旁路的关系。

## 4. 中文书目与 `TRANSLATION_AUDIT.csv`

| Work ID | verdict | 独立复核结果 |
|---|---|---|
| `CAND-R1-ENT-02` | **REVISE** | 候选把《最明净的地区》保持 `hold_catalogue_detail_pending` 的理由已不成立：本次已直接重开其 [吉林省图书馆 MARC 页](http://opac.jllib.cn/opac/show_format_marc.php?marc_no=56375362523356610064003202655a370138573a)。MARC 200/210/010 字段直接显示题名《最明净的地区》、作者卡洛斯·富恩特斯、译者 **徐少军、王小芳**、**云南人民出版社**、**1993.3**、ISBN **7-222-01047-5**，并在 300 字段回指原文题名。应把审计行由 HOLD 返修为已核验目录记录并补齐字段；在候选文件未返修前不得入库。 |
| `CAND-R1-ENT-03` | **REVISE** | 已直接下载并读取候选所列采购目录 PDF；目录明确显示《阿尔特米奥·克罗斯之死》、`[墨]卡洛斯·富恩特斯 著；亦潜 译`、人民文学出版社、ISBN 9787020150168，故这些字段通过。但该 PDF 对应表格行**没有显示出版年份 2019**；候选却填入 2019。按 fail-closed，应删除/保持 `publication_year` 为 HOLD，或补充能直接显示 2019 的具体出版社/图书馆来源后再填。状态不应以 `verified_catalogue` 覆盖未核年份。 |

中文书目小计：**PASS 0 / REVISE 2 / HOLD 0（共 2 行）**。字段级 HOLD：`CAND-R1-ENT-03.publication_year = 2019`，直至补证。原先 `CAND-R1-ENT-02` 的整行 HOLD **不再正确**。

## 5. HANDOFF、对象层级与规模审计

- **范围 PASS**：1 位作者 + 2 部作品；14 条事实恰好等于 HANDOFF 声明的 hard limit；2 条关系均为直接 `CREATED`，没有新增主题、运动、影响、事件、奖项、坐标或 Geo 候选。未发现为凑量降低证据标准。
- **对象层级 PASS**：人物事实使用人物页；作品年份、体裁、简介、角色和形式使用具体作品/版次页；未把作者籍贯推成作品地点，未把版本出版年混成作品首版年。
- **关系门槛 PASS**：两条均为结构型 `CREATED`，不要求两项独立来源；本批没有解释型关系。ELEM 作者页与 ELEM 作品页不可当作两个独立研究成果，但这一点不影响两条结构型关系准入。
- **HANDOFF REVISE**：其中“7 independently reopened”可作为 Worker 当时访问记录，但 Reviewer 不据此直接采信；本次重开结果如上。中文边界说明需更新：`ENT-02` 已可核验；`ENT-03` 仅出版年份仍缺直接证据。

## 6. 可入库清单（返修隔离后）

以下记录语义审核通过，可由 Integrator 在变更集返修/关闭后处理；Reviewer 不分配正式 ID、不写 SQLite：

- 来源：`CAND-R1-SRC-01`、`02`、`04`、`05`、`06`、`07`。
- 事实：`CAND-R1-FCT-01`—`08`、`10`—`13`。
- 关系：`CAND-R1-REL-01`、`02`。
- 中文书目字段（须以返修后的审计行表达）：
  - `ENT-02`：中文题名、徐少军/王小芳、云南人民出版社、1993.3、ISBN 7-222-01047-5；
  - `ENT-03`：中文题名、亦潜、人民文学出版社、ISBN 9787020150168；**不含 2019 年**。

## 7. REVISE / HOLD 清单

必须 REVISE：

1. `SRC-03` 补 Fabiola Camacho 为页面作者，并保留 ELEM/FLM 为机构载体。
2. `FCT-09` 删除未被直接明确支持的“非线性片段”，并避免把同一 ELEM/FLM 体系表述为独立双来源。
3. `FCT-14` 删除“记忆与意识的断裂”或另补直接作品级研究来源；现阶段使用缩窄表述。
4. `ENT-02` 取消过时的整行 HOLD，按已重开的 MARC 补齐目录字段。
5. `ENT-03` 删除/挂起未被采购目录 PDF 直接显示的 `publication_year=2019`，或另补直接来源。
6. 同步更新 HANDOFF 的中文书目边界说明；不得把本 REVIEW 的通过部分理解为整包已 PASS。

继续 HOLD：

- `ENT-03.publication_year=2019`（字段级），直到取得能直接显示年份的具体出版社或权威目录来源。
- 除上述字段外，无需新增关系或解释性 HOLD。

## 8. 总计与最终结论

| 类别 | PASS | REVISE | HOLD | 总数 |
|---|---:|---:|---:|---:|
| 来源 | 6 | 1 | 0 | 7 |
| 事实 | 12 | 2 | 0 | 14 |
| 关系 | 2 | 0 | 0 | 2 |
| 中文书目审计行 | 0 | 2 | 0 | 2 |
| **合计** | **20** | **5** | **0** | **25** |

字段级另有 1 项 HOLD：`ENT-03.publication_year=2019`。

**初审明确 verdict：REVISE。** 初审时允许保留上列 PASS 记录，但要求 5 项返修完成、中文出版年份缺口正确隔离并同步 HANDOFF 后再作整包复审。

## 9. 五项返修独立复审（2026-08-19）

本节为当前有效的最终门禁结论。Reviewer 重新读取返修后的 `SOURCE_CANDIDATES.csv`、`FACT_CANDIDATES.csv`、`TRANSLATION_AUDIT.csv` 与 `HANDOFF.md`，并再次打开必要原始来源；未修改候选文件、HANDOFF、SQLite 或其他文件。

| 复审项 | 最终 verdict | 复审依据 |
|---|---|---|
| `CAND-R1-SRC-03` 署名 | **PASS** | 候选已改为 `Fabiola Camacho / Fundación para las Letras Mexicanas`，机构载体仍为 ELEM。重新打开 ELEM 作品页后，页面明确显示 Fabiola Camacho、ELEM (FLM) 与 Fundación para las Letras Mexicanas，来源身份和层级均已修正。 |
| `CAND-R1-FCT-09` | **PASS** | 已删除初审指出的“非线性片段”和虚假的双独立来源表达，改为单一 `SRC-03` 支持的“以多重人物声音与社会群像构成一幅不断移动的墨西哥城图景”。ELEM 作品页直接描述片段式叙事、多种见证、复调、众多社会阶层、城市图景与人物/片段的连续展开；该中文释义克制且未生成解释性关系。 |
| `CAND-R1-FCT-14` | **PASS** | 已删除“记忆与意识的断裂”，改为单一 `SRC-05` 支持的“三种人称 + 过去、现在、未来切换”。重新打开 ELEM 作品页，其具体版本文案直接写明使用三种叙述人称以及过去、现在和未来；表述对象层级与证据完全一致。 |
| `CAND-R1-ENT-02` 中文书目 | **PASS** | 已再次直接重开吉林省图书馆 MARC。010、200、210、300 字段分别直接支持 ISBN 7-222-01047-5、题名/作者/徐少军与王小芳、云南人民出版社/1993.3、原文题名。返修后的 `verified_catalogue` 及各字段准确，原整行 HOLD 已正确解除。 |
| `CAND-R1-ENT-03` 中文书目 | **PASS** | 已再次直接读取采购目录 PDF；表格行直接显示中文题名、卡洛斯·富恩特斯、亦潜、人民文学出版社、ISBN 9787020150168，仍不显示年份。返修已把 `publication_year` 留空，并以 `verified_catalogue_year_hold` 和 review note 显式保留字段级 HOLD；没有再把 2019 确定化。 |
| `HANDOFF.md` | **PASS** | 已同步说明 `ENT-02` 的 MARC 核验结果及 `ENT-03` 年份字段 HOLD；保留 1 作者 + 2 作品、14 事实、2 条直接 `CREATED`、7 来源的原范围；没有新增解释关系、Geo、奖项或其他越界内容。末行明确 Worker 返修后等待独立复审且“不构成 PASS”，符合 Reviewer 独立门禁。 |

### 9.1 复审后的可入库清单

- 来源：`CAND-R1-SRC-01`—`CAND-R1-SRC-07`，**7/7 PASS**。
- 事实：`CAND-R1-FCT-01`—`CAND-R1-FCT-14`，**14/14 PASS**。
- 关系：`CAND-R1-REL-01`—`CAND-R1-REL-02`，**2/2 PASS**。
- 中文书目审计行：`CAND-R1-ENT-02`、`CAND-R1-ENT-03`，**2/2 PASS**；其中 `ENT-03.publication_year` 继续保持空值和字段级 HOLD，不属于获准写入的确定事实。

### 9.2 复审总计

| 类别 | PASS | REVISE | 行级 HOLD | 总数 |
|---|---:|---:|---:|---:|
| 来源 | 7 | 0 | 0 | 7 |
| 事实 | 14 | 0 | 0 | 14 |
| 关系 | 2 | 0 | 0 | 2 |
| 中文书目审计行 | 2 | 0 | 0 | 2 |
| **合计** | **25** | **0** | **0** | **25** |

已知但正确隔离的字段级 HOLD：`CAND-R1-ENT-03.publication_year`。该字段为空，不得由 Integrator 补写 2019 或其他年份，除非取得新的直接权威来源并再次审核。

**整包最终 verdict：PASS。** 初审所列返修均已完成并通过独立复审；候选包现满足来源身份、对象层级、证据直接性、释义边界、关系门槛、中文书目状态和规模上限要求。允许 Data Integrator 仅按第 9.1 节准入清单进入后续正式 ID/迁移流程；本 REVIEW 本身不写 SQLite，也不构成发布授权。
