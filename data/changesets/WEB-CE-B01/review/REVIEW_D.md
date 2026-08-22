# REVIEW — WEB-CE-B01 包 2（Worker D 建议池 11 部 + PM 替换候选）独立复核

- 评审任务：WEB-CE-B01-REVIEW-D
- 角色：Independent Reviewer（fresh context, V4 Pro, high）
- 日期：2026-08-18
- 输入：`candidates/D_existing_additions/`（8 文件）、`candidates/PM_replacements/`（5 文件）、`review/PM_SUPPLEMENT_VERIFICATION.md`、`REVIEW_ABC.md`（仅背景）
- 核对方式：只读 sqlite3 查 `V1_MASTER.sqlite`（entities/sources/relationships/facts 词表与既有 ID）；HTTP 核验全部关键 URL。未写主库、未分配正式 ID、未改候选文件、无 git 操作、未研究包外对象。
- 判词语义：PASS=可进入 staging；REVISE=候选/审计行须修复（下附 delta）；HOLD=证据不足或冲突未决，不进正式数据；REJECT(SUPERSEDED)=被替换，不入正式数据（仅限两部卡彭铁尔计划作品相关行）；`admission_status=gap` 行非候选，单列「正确排除」，不计入 PASS/REVISE/HOLD。

## 0. 证据核验（只读）摘要

- **主库实体**：作者 V1-ENT-0002/0072/0073/0074/0114/0115/0016 全部存在；地点 0095 哥伦比亚、0124 秘鲁；运动 0099 魔幻现实主义、0130 文学爆炸、0101 新巴洛克；主题 0136 爱情体验；V1-ENT-0119《二十首情诗和一支绝望的歌》——D 全部端点引用正确。
- **SRC-0066 reuse 一致性**：sources 表存在，标题含「Las armas secretas, 1959」，ark:/12148/cb352151483；与 D 的 reuse 标注一致，CAND-D-ENT-09/FCT-47/REL-05 复用合法。
- **HTTP 核验**：12 个 BnF ark（D 8 个 + 合订本 cb354902694 + SRC-0066 + PM 3 个）全部 200，关键记录内容抽查匹配（El amor…/García Márquez/1985；El Acoso/Carpentier/1956；Guerra del tiempo 1998/1982）；3 条 BnF SRU 全部 200；20 个中文书目/译者页/书店页/微信读书/缺书网全部 200，内容抽查匹配（沙之书 王永年/上海译文/9787532762927；绿房子 孙家孟/马林春/1983/书号10208；南方高速 收录秘密武器/万火归一/克罗诺皮奥；时间之战 陈皓/人民文学/9787020165223/2021-07-01；追击 works 页 人民文学2025陈皓+中央编译2004晓林；柔情 赵振江/漓江/9787540786717/2019.8/四集目录；太阳石 赵振江/燕山/2014）。
- **新增发现**：豆瓣《太阳石》页（25962160）可见 ISBN **9787540236274**（2014-9 北京燕山），可补 PM 补验的 ISBN pending 注记。

## 1. D 目录逐项 verdict

### 1.1 SOURCE_CANDIDATES（25 行：PASS 14 / REVISE-minor 11 / HOLD 0）

| item_id | verdict | 理由 |
|---|---|---|
| CAND-D-SRC-01~04、07、09~11 | PASS | BnF 稳定 ark 页全部 HTTP 200，作者归名/年份/ISBN 抽查匹配，B 级匹配 |
| CAND-D-SRC-05、06、08 | PASS | BnF SRU 快照全部 HTTP 200，可证作品存在与归名；SRC-05 定位为 SRC-0066 补充不重复建源——正确 |
| CAND-D-SRC-10、11 | PASS | 记录本身真实合规（ark 200、Carpentier 归名、1974）；其支撑的实体虽被替换弃用，来源行仍可保留作书目注记 |
| CAND-D-SRC-12~20、23 | REVISE（minor） | 豆瓣页全部 200、书目数据抽查匹配，用途合规（仅证中译存在与书目）；但 `source_level=C` 与手册 §6.3（聚合页→D）及包 1 惯例（REVIEW_ABC：豆瓣=D）不符，整合时改 D（delta REVISE-D1） |
| CAND-D-SRC-21 | REVISE（minor） | 译者个人页（faculty.ndhu.edu.tw）真实 200，仅作繁体译本佐证；`source_level=B` 偏高，建议 C（delta REVISE-D1） |
| CAND-D-SRC-22 | PASS | 中国作家网转载中华读书报书讯真实 200，C 级匹配，仅作合卷出版线索——用途克制 |
| CAND-D-SRC-24、25 | PASS | 三民书局/百度百科均如实标 access_blocked，未假装核验，不作证据——合规 |

### 1.2 ENTITY_CANDIDATES（11 行：PASS 9 / REJECT 2）

| item_id | verdict | 理由 |
|---|---|---|
| CAND-D-ENT-01/02 | PASS | 马尔克斯《霍乱》《族长》work 层级正确；BnF 归名（1985/1975）+ 中译书目（南海 2022 杨玲/2021 轩乐）双面支撑 |
| CAND-D-ENT-03 | PASS | 《绿房子》work；BnF 西语多版归名 + 中译旧版（外国文学 1983 孙家孟/马林春）；1966 首版年裁决见 FCT-13（HOLD），不影响实体 |
| CAND-D-ENT-04 | PASS | 《潘达雷昂》work；Seix Barral 1973 直接归名 + 人民文学 2009/2021 两版次同一实体不建重复——正确 |
| CAND-D-ENT-07/08 | PASS | 博尔赫斯《沙之书》《布罗迪报告》collection（短篇集）层级正确；BnF + 上海译文 2015 王永年 |
| CAND-D-ENT-09 | PASS | 《秘密武器》collection；主源 reuse:SRC-0066 + 中译合卷（《南方高速》2017 收录）核验；未因合卷名另建实体——正确 |
| CAND-D-ENT-10 | PASS | 《一百首爱情十四行诗》collection（诗集）；与 V1-ENT-0119《二十首情诗…》确为不同作品；规范名用 packet 名、台版/通行译名只记 aliases——合规（ISSUES §3 的命名问题由本评审裁定：规范名《一百首爱情十四行诗》，别名保留两种） |
| CAND-D-ENT-11 | PASS | 《隐秘的幸福》collection（短篇集）；BnF 'contos' + 人民文学 2018 闵雪飞；中译单行本系精选集（篇目覆盖待核）已在 edition_notes/CROSS_AUDIT 如实标注 |
| CAND-D-ENT-05/06 | REJECT(SUPERSEDED) | 《方法的资源》《巴洛克协奏曲》：全批次检索无中译本（not_found），按计划规则由 PM 替换候选顶替；实体不入正式数据 |

### 1.3 FACT_CANDIDATES（59 行：PASS 22 / HOLD 1 / REJECT 6 / gap 30）

| item_id | verdict | 理由 |
|---|---|---|
| FCT-01/07/19/37/55 | PASS | first_publication_year（1985/1975/1973/1975/1971）high，BnF 记录直接标注，抽查匹配 |
| FCT-02/08/38/43/48/53 | PASS | genre_or_form medium，均直引 BnF 题名体裁标注（roman/[nouvelles]/sonetos），来源直接支持 |
| FCT-03/09/15/21/39/44/49/54/57 | PASS | bibliographic_note 仅证目录存在与归名，未夸大出版细节（FCT-21/49/57 为直接书目记录 high） |
| FCT-47 | PASS | 秘密武器 first_publication_year=1959，reuse:SRC-0066（标题含 'Las armas secretas, 1959'），复用一致性核验通过 |
| FCT-56 | PASS | 隐秘的幸福 genre 'contos'，BnF 记录直接标注，high 成立 |
| FCT-13 | **HOLD** | 《绿房子》first_publication_year=1966：BnF 版本史（4e éd.1967/6a ed.1968）只直接支持「首版≤1967」，1966 为间接推断；按 fail-closed 与 ISSUES §1 自标（待第二来源定 high），本行降级 hold——实体/CREATED 不受影响，解锁条件=第二独立来源（既有 SRC-0047 Nobel 2010 或出版社书目）直接确认 |
| FCT-25/26/27、31/32/33 | REJECT(SUPERSEDED) | 两部卡彭铁尔计划作品的全部事实行随实体一并替换弃用 |
| FCT-04/05/06、10/11/12、14、16/17/18、20、22/23/24、28/29/30、34/35/36、40/41、42、45/46、50/51、52、58/59 | gap 正确排除 | 30 行全部为 story_premise/setting_place/key_character/部分 genre/未证实首版年（布罗迪 1970、十四行诗 1959），均如实「待核」并注明通行说法不得直接采用，无一冒充候选——合规 |

### 1.4 RELATION_CANDIDATES（19 行：PASS 9 / HOLD 8 / REJECT 2）

| item_id | verdict | 理由 |
|---|---|---|
| CAND-D-REL-01~09 | PASS | CREATED×9，端点 author→work/collection 正确（有 V1-REL-0062 author→collection 先例），各配 BnF 直接书目来源（REL-05 主源 reuse:SRC-0066）满足单来源最低证据 |
| CAND-D-REL-10/11 | REJECT(SUPERSEDED) | 卡彭铁尔→方法/巴洛克 的 CREATED 随实体替换弃用 |
| CAND-D-REL-12 | HOLD | SET_IN 霍乱→哥伦比亚 0 来源；缺直接场景证据且目标「卡塔赫纳」实体不在主库——标注成立 |
| CAND-D-REL-13 | HOLD | SET_IN 绿房子→秘鲁 0 来源；缺直接场景证据且「皮乌拉」实体不在主库——标注成立 |
| CAND-D-REL-14/15 | HOLD | 霍乱/族长→魔幻现实主义 0 来源，hold_needs_second_source 成立 |
| CAND-D-REL-16 | HOLD | 秘密武器→文学爆炸仅 1 项 C 级来源（中国作家网书讯），<2 独立来源——hold_needs_second_source 成立 |
| CAND-D-REL-17 | HOLD | 绿房子→文学爆炸 0 来源，hold_needs_second_source 成立 |
| CAND-D-REL-18 | HOLD | 巴洛克协奏曲→新巴洛克 0 来源，hold_needs_second_source 成立（随实体替换本行已无实际意义，但标注本身正确） |
| CAND-D-REL-19 | HOLD | 霍乱→爱情主题 0 来源，hold_needs_second_source 成立 |

### 1.5 TRANSLATION_AUDIT（11 行：PASS 9 / REJECT 2）

| item_id | verdict | 理由 |
|---|---|---|
| CAND-D-ENT-07/08/01/02/03/04/11 | PASS | verified_single_volume / verified_old_edition 均词表合法；豆瓣具体版本页核验译者/出版社/年份/ISBN 抽查匹配；绿房子 1983 旧版标 verified_old_edition 正确 |
| CAND-D-ENT-09 | PASS | verified_collection：无独立单行本，收入南海《南方高速》2017（内容简介明确收录三部短篇集，已抽查匹配）；合卷不建重复实体——合规 |
| CAND-D-ENT-10 | PASS | verified_traditional_chinese：九歌 1999 陈黎/张芬龄繁体单行本核验（ISBN 9789575606022）；简体版线索（三民书局 blocked）如实不作证据 |
| CAND-D-ENT-05/06 | REJECT(SUPERSEDED) | not_found 行随替换决策弃用；负证据（豆瓣作者页 19 项书目均不含两部）记录规范 |

## 2. PM 替换候选逐项 verdict（17 行：PASS 13 / REVISE 3 / gap 1）

| item_id | verdict | 理由 |
|---|---|---|
| CAND-PM-SRC-01 | PASS | BnF ark cb31909635j 200，内容抽查确认 El Acoso/Carpentier (1904-1980)/1956——归名与年份直接证据，B 级匹配 |
| CAND-PM-SRC-02 | PASS | BnF ark cb37550508c（1998）200，1982 版 ark cb347971092 亦 200；作者归名证据，B 级匹配 |
| CAND-PM-SRC-03 | PASS | 文轩网页 200，抽查确认 时间之战/陈皓/人民文学/9787020165223/2021-07-01；书业目录等级 B 偏宽建议 C（不阻塞，仅用于中译核验） |
| CAND-PM-SRC-04 | PASS | 豆瓣 works 页 200，抽查确认 追击 两中文版（人民文学 2025 陈皓、中央编译 2004 晓林）；D 级匹配、仅证书目——合规 |
| CAND-PM-ENT-01 | **REVISE** | 《时间之战》entity_type 应改 **collection**（短篇集）：BnF 题名 'Guerra del tiempo y otros relatos' + 自身 genre_or_form=短篇小说集，且与批次惯例（短篇集一律 collection）一致（delta REVISE-D2） |
| CAND-PM-ENT-02 | PASS | 《追击》work（中篇/novella）层级正确，BnF 1956 归名 |
| CAND-PM-FCT-01 | **REVISE** | entity_layer=work 随 ENT-01 改 collection（delta REVISE-D2） |
| CAND-PM-FCT-02 | PASS | bibliographic_note 仅证两版目录存在与归名，未写 first_publication_year——fail-closed 正确 |
| CAND-PM-FCT-03 | gap 正确排除 | first_publication_year 待核，如实 gap——正确 |
| CAND-PM-FCT-04 | PASS | genre 短篇小说集 medium：BnF 题名 'y otros relatos' 直接标示合集性质，可接受 |
| CAND-PM-FCT-05 | PASS | 追击 entity_layer=work 正确 |
| CAND-PM-FCT-06 | PASS | first_publication_year=1956 high：BnF 记录年份直接标注且与通行初版年一致（抽查确认 dateEdit=1956） |
| CAND-PM-FCT-07 | **REVISE** | genre_or_form=中篇小说 **无直接来源**：经核验 BnF El Acoso 记录无体裁标注（页内 'nouvelle' 均为模板词 'nouvelle fenêtre'）；通行归类不独立成据，按批次 fail-closed 惯例（cf. D FCT-14/20）降为 gap_note 待核（delta REVISE-D2） |
| CAND-PM-REL-01/02 | PASS | CREATED×2，BnF 归名单来源满足最低证据；端点 author→work/collection 正确（REL-01 对象按 REVISE-D2 改 collection 后端点仍合法） |
| CAND-PM-ENT-01（翻译行） | PASS | verified_single_volume：文轩网核验 陈皓/人民文学 2021-07/9787020165223/228 页；原版短篇集不写 first_publication_year——正确 |
| CAND-PM-ENT-02（翻译行） | PASS | verified_single_volume：豆瓣 works 页核验两中文版（陈皓 2025-4 人民文学、晓林 2004 中央编译）同实体两版次；ISBN 待补注记合理 |

## 3. 替换决策 verdict

**成立（REJECT(SUPERSEDED) 12 行：D ENT-05/06、FCT-25/26/27/31/32/33、REL-10/11、翻译 CAND-D-ENT-05/06）。**

- 依据：两部计划作品《方法的资源》《巴洛克协奏曲》经全批次检索均无任何中译本（not_found；豆瓣作者页 19 项中文书目负证据 + BnF 书目双面支撑）；符合计划规则「无可靠中译→同作者已验证作品替换」。
- 替换候选《时间之战》《追击》经普通标准审核基本通过（BnF ark 证据 + 中译核验来源均实；ENT-01 层级 REVISE-D2 修复后入库）。
- 建议池最终 11 部 = 9 部 verified + 2 部替换，与 PM 补验第三波一致；已有作家追加合计 14 部（帕斯 3 + 建议池 11），符合 USER 方案 B 授权。
- 备注：被替换的两部作品 BnF 书目记录（SRC-10/11）真实有效，建议保留为书目注记来源而非删除。

## 4. 三处证据升级最终 verdict

1. **帕斯《太阳石》（CAND-C-W-003 翻译行）→ verified_single_volume（解除 HOLD）**。PM 补验第二波（豆瓣 25962160 + 微信读书 f0b328c0811e1ad18g012636，均 HTTP 200）成立；本评审抽查确认豆瓣页 太阳石/赵振江/北京燕山/2014-9，微信读书 太阳石/燕山。译者赵振江、出版社北京燕山出版社、2014（另见 2015 版次）。**ISBN 可补 9787540236274**（豆瓣页可见，2014-9 版）；若整合要求更严，保留 pending 注记亦可。丛书「天下大师·帕斯作品」四卷（太阳石/孤独的迷宫/弓与琴/批评的激情）佐证为单卷本。
2. **米斯特拉尔三集翻译行（CAND-B-ENT-002/003/004）→ 三行 verified_collection（解除 HOLD×3）**。PM 补验第二波（缺书网目录页 queshu.com/book/41897712）成立；本评审抽查确认：漓江出版社 2019.8、赵振江译、ISBN 9787540786717、目录分卷收录《绝望集》《柔情集》《塔拉集》《葡萄压榨机》+ 附录——三集均被漓江《柔情》完整收录。建议整合时注记：2019.8 为多版次之一（首版 1992），收录范围以该版目录为准；《塔拉集》原 not_found 同步改为 verified_collection。
3. **A 富恩特斯两翻译行**：本包范围外（REVISE-1 已由 PM 补验第一波给出全部字段），整合时原样迁移（徐少军/云南人民 1993/ISBN 7-222-01047-5；亦潜/外国文学 1983），不重审。

## 5. 计数汇总

口径：PASS=获批；REVISE=须修复；HOLD=挂起；REJECT(SUPERSEDED)=替换弃用；gap 单列「正确排除」。

| 目录 | PASS | REVISE | HOLD | REJECT | gap | 行数 |
|---|---|---|---|---|---|---|
| D SOURCE | 14 | 11 | 0 | 0 | 0 | 25 |
| D ENTITY | 9 | 0 | 0 | 2 | 0 | 11 |
| D FACT | 22 | 0 | 1 | 6 | 30 | 59 |
| D RELATION | 9 | 0 | 8 | 2 | 0 | 19 |
| D TRANSLATION | 9 | 0 | 0 | 2 | 0 | 11 |
| D 小计 | 63 | 11 | 9 | 12 | 30 | 125 |
| PM SOURCE | 4 | 0 | 0 | 0 | 0 | 4 |
| PM ENTITY | 1 | 1 | 0 | 0 | 0 | 2 |
| PM FACT | 4 | 2 | 0 | 0 | 1 | 7 |
| PM RELATION | 2 | 0 | 0 | 0 | 0 | 2 |
| PM TRANSLATION | 2 | 0 | 0 | 0 | 0 | 2 |
| PM 小计 | 13 | 3 | 0 | 0 | 1 | 17 |
| **合计** | **76** | **14** | **9** | **12** | **31** | **142** |

（D 的 14 行 REVISE 均为等级标签类 minor；PM 的 3 行 REVISE 为实体层级/体裁来源修复。文档级笔误：D HANDOFF §3 自称事实 33 candidate/26 gap，实际 29/30；CROSS_AUDIT 引「《游戏终局》V1-ENT-0083」实为主库《游戏的终结》、《40 个实体》实为 39 个——整合时核对。）

## 6. REVISE delta 清单

- **REVISE-D1（非阻塞，等级校准）**：CAND-D-SRC-12~20、SRC-23 豆瓣 source_level C→D（手册 §6.3 聚合页；包 1 惯例豆瓣=D）；CAND-D-SRC-21 陈黎个人页 B→C（个人页非机构目录，仅佐证）。不影响准入（豆瓣中译核验为 packet 明示合法用途，与等级无关）。
- **REVISE-D2（阻塞，PM 替换候选）**：
  - CAND-PM-ENT-01 entity_type work→**collection**（短篇集；与 genre_or_form=短篇小说集及批次惯例一致）；
  - CAND-PM-FCT-01 entity_layer work→collection（随上）；
  - CAND-PM-FCT-07 genre_or_form=中篇小说 无直接来源（BnF 记录无体裁标注），降为 gap_note 待核，禁止以通行归类入库。

## 7. HOLD 清单与缺失证据

| 对象 | 缺失证据 | 解锁条件 |
|---|---|---|
| 绿房子 first_publication_year=1966（D FCT-13） | BnF 版本史仅直接支持「首版≤1967」，1966 为推断 | 第二独立来源（既有 SRC-0047 Nobel 2010 或出版社书目）直接确认 |
| SET_IN 霍乱→哥伦比亚/卡塔赫纳（REL-12） | 0 来源；卡塔赫纳实体不在主库 | 原作或合格来源直接说明场景 + 地点实体齐备 |
| SET_IN 绿房子→秘鲁/皮乌拉（REL-13） | 0 来源；皮乌拉实体不在主库 | 同上 |
| 解释型关系 ×6（REL-14/15/16/17/18/19） | 魔幻现实主义×2、文学爆炸×2（其一仅 1 项 C 级来源）、新巴洛克×1、爱情主题×1，均 <2 独立来源 | 各补第二独立合格来源（REL-18 随实体替换已无意义） |

（全部 8 条关系 hold 自标成立；无「该 hold 却写成 candidate」的项。）

## 8. gap 正确排除清单

- D FACT 30 行：FCT-04/05/06、10/11/12、14、16/17/18、20、22/23/24、28/29/30、34/35/36、40/41、42、45/46、50/51、52、58/59（story_premise/setting_place/key_character 全部待核；布罗迪 1970、十四行诗 1959 首版年待核；绿房子/潘达雷昂体裁无直接标注）。
- PM FACT 1 行：CAND-PM-FCT-03（时间之战首版年待核）。
- 全部如实标注「待核/通行说法不得直接采用」，无冒充候选。

## 9. 一致性/纪律核查（CROSS_AUDIT 抽查）

- 聂鲁达情诗合卷：九歌《聶魯達雙情詩》与 V1-ENT-0119《二十首情诗…》交叉包含风险已标；D 只为《一百首爱情十四行诗》建实体（九歌 1999 单行本核验），未建合集重复实体——合规。
- 科塔萨尔《南方高速》合卷：仅建《秘密武器》实体，明确不另建《南方高速》实体、不发明 CONTAINS_WORK——合规。
- 潘达雷昂 2009/2021 两版次、追击 2004/2025 两版次均同一实体两版次，不建重复——合规。
- 版权边界：全部释义类字段为 gap 或 bibliographic_note 单句级；无全文摘录、无高剧透内容——合规。
- 无 AI 记忆冒充来源（access_blocked 页全部如实标注）；gap 行未冒充候选；PM 候选按普通标准审核未自审。
- PM 决策草案 D1/D2/D3 属包 1 范围，已在 REVIEW_ABC 裁决（D1 PASS 有条件、D2 PASS、D3 PASS），本包无新的 birth_place/超现实主义/《奥拉》行，引用即可。

## 10. 结论

- **D 目录**：数据主体 PASS（9 实体 + 22 事实 + 9 CREATED + 9 翻译行）；两部卡彭铁尔计划作品全部 12 行 REJECT(SUPERSEDED) 成立；绿房子 1966 首版年 HOLD（间接推断）；8 条解释/场景关系 HOLD 标注成立；30 行 gap 正确排除；14 行 REVISE 均为来源等级标签类 minor，不阻断。
- **PM 替换候选**：《时间之战》《追击》实体+CREATED+中译核验证据充分，PASS（ENTITY-01 层级改 collection 后入库；FCT-07 体裁降 gap）。
- **三处升级**：太阳石 → verified_single_volume（ISBN 可补 9787540236274）；米斯特拉尔三集 → verified_collection×3（漓江《柔情》2019.8 完整收录四集）；富恩特斯两行范围外原样迁移。
- 本批可进入正式数据（在 REVISE-D1/D2 修复后）：实体 9+2（PM）= 11 部作品；事实 22+4（PM）= 26 条；关系 9+2 = 11 条 CREATED；翻译核验 9+2 = 11 行（另有太阳石/米斯特拉尔三行属包 1 升级）。12 行 REJECT、9 项 HOLD、31 行 gap 留待后续。
