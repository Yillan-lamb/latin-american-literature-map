# SOURCE_NOTES — Worker D（WEB-CE-B01-R-D）

## 1. 来源构成与访问纪律

- 网络执行纪律：每页 curl 超时 20 秒、至多重试 1 次；打不开标 access_blocked，不反复重试。豆瓣书页使用 UA `Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 Chrome/120 Safari/537.36` 可正常开页。
- 访问状态统计：access_pass 23（CAND-D-SRC-01~23），access_blocked 2（CAND-D-SRC-24 三民书局 JS 验证、CAND-D-SRC-25 百度百科 403 安全验证）。
- 禁止以搜索摘要/AI 记忆冒充来源：所有书目事实均来自已开页记录；通行说法一律只入 gap_note 或 ISSUES 线索，不入候选。

## 2. 逐来源说明

### BnF（A/B 级，11 个作品书目来源，access_pass）
- 核验方式双通道：① `catalogue.bnf.fr/api/SRU`（recordSchema=dublincore）检索快照；② 对关键记录开稳定 ark 页确认 HTTP 200 与题名/作者/出版信息。
- 已开页确认的 ark（HTTP 200）：
  - cb352339603 El Libro de arena / Jorge Luis Borges（西语 1975）
  - cb34923644w El Amor en los tiempos del cólera / Gabriel García Márquez（西语 1985，ISBN 8402106408）
  - cb352227127 El Otoño del patriarca / por Gabriel García Márquez（西语 1975，ISBN 8401301556）
  - cb35424958x Felicidade clandestina, contos / Clarice Lispector（Rio de Janeiro : Sabiá, 1971）
  - cb37515697g El recurso del método : novela / Alejo Carpentier（西语 1974）
  - cb37546280h Concierto barroco / Alejo Carpentier（西语 1974）
  - cb35234561k Pantaleón y las visitadoras / Mario Vargas Llosa（Barcelona : Seix Barral, 1973，309 p.，Biblioteca breve ; 352，ISBN 84-322-0252-5）
- 其余（El informe de Brodie、Las armas secretas、La casa verde、Cien sonetos de amor）以 SRU 快照为准（快照 URL 已记入 canonical_url；Las armas secretas 另给合订本 ark cb354902694 线索）。
- 局限：SRU 快照可证作品存在与作者归名，但首版年信息对部分作品不直接（见 ISSUES §1）。

### 复用来源
- **SRC-0066（reuse）**：BnF 目录记录 `Relatos : Bestiario, 1951, Las armas secretas, 1959, Final del juego, 1964, Todos los fuegos el fuego, 1966`（ark:/12148/cb352151483）。已只读查询 sources 表确认记录存在；标题直接含「Las armas secretas, 1959」，故《秘密武器》的 CREATED 与 first_publication_year=1959 均以 reuse:SRC-0066 为主源（CAND-D-SRC-05 为本轮 SRU 补充快照，不重复建源）。
- 计划复用但**本轮未开页**（列入 ISSUES 下一轮核验线索，不冒充已用）：SRC-0035/SRC-0064（CVC 马尔克斯，可用于《霍乱/族长》作品页与释义）、SRC-0056（诺贝尔 1982 马尔克斯）、SRC-0047/0048（诺贝尔 2010 略萨）、SRC-0054/0055（诺贝尔 1971 聂鲁达）、SRC-0070（CVC 聂鲁达书目，可核《Cien sonetos de amor》1959 初版）、SRC-0009/0016（IMS 李斯佩克朵，可核 Felicidade clandestina 书目与释义）。

### 豆瓣（C 级，仅证书目；11 个中译核验来源）
- 每部中译均开豆瓣具体版本页核验译者/出版社/年份/ISBN/页数；豆瓣不作文学事实/解释依据（符合 AGENTS.md）。
- 《秘密武器》无独立单行本：开《南方高速》（subject/27079479）页，内容简介明确「本卷收录《秘密武器》《克罗诺皮奥和法玛的故事》《万火归一》三部短篇集」，核为 verified_collection。
- 卡彭铁尔：开作者作品页（book.douban.com/author/4528595）列出 19 项中文书目可见项均不含《方法的资源》《巴洛克协奏曲》；开《卡彭铁尔作品集》（subject/1756103，云南人民 1993）确认仅收《光明世纪》《消逝的足迹》——两部作品标 not_found 的负证据基础。

### 其他
- CAND-D-SRC-21 陈黎个人页（译者本人，big5 编码，iconv 转码后核验）：确认九歌《聶魯達雙情詩》（一百首愛的十四行詩 + 二十首情詩和一首絕望的歌，陳黎·張芬齡譯）——佐证繁体译本，与 CAND-D-SRC-20（豆瓣九歌 1999 单行本）互相印证。
- CAND-D-SRC-22 中国作家网转载中华读书报 2017 书讯：科塔萨尔短篇小说全集出版计划（预告《秘密武器》等将出版）——出版线索，C 级，仅作《秘密武器》合卷中译辅助证据。
- CAND-D-SRC-24/25 为 access_blocked 线索页（三民书局简体《聂鲁达情诗》ISBN 9787521750867；百度百科《一百首爱的十四行诗》《方法的根源》），记录在案供下一轮核验，不作证据。

## 3. 数据完整性

- 25 个来源候选全部有真实 URL/持久标识与访问状态；11 部作品均至少 1 个 BnF（A/B 级）书目来源 + 1 个豆瓣中译来源（not_found 的两部卡彭铁尔作品以豆瓣作者页负证据 + BnF 书目双面支撑）。
