# SOURCE_NOTES — WEB-CE-B01 / Worker B（米斯特拉尔）

访问日期统一为 2026-08-18。claim→evidence 映射如下。

## 已核验来源（access_pass）

### CAND-B-SRC-001 — NobelPrize.org, Gabriela Mistral – Facts（英文页）
URL: https://www.nobelprize.org/prizes/literature/1945/mistral/facts/
等级 B（官方奖项机构）。claim→evidence：
- 本名/身份 → Life 段："Lucila Godoy Alcayaga was born in 1889 in Vicuna, Coquimbo in Chile"；笔名取自 Gabriele D'Annunzio 与 Frédéric Mistral。
- 出生/逝世 → 页面字段 "Born: 7 April 1889, Vicuña, Chile / Died: 10 January 1957, Hempstead, NY, USA"。
- 教育/职业 → "began working as a teacher in her home district at the age of just 15"；"served as the Chilean consul in several countries"。
- 获奖 → "Nobel Prize in Literature 1945"；Prize motivation 原文 "for her lyric poetry which, inspired by powerful emotions, has made her name a symbol of the idealistic aspirations of the entire Latin American world"。
- 语言 → "Language: Spanish"。
- 首位性 → "Mistral was South America's first ever Nobel Laureate in Literature"（南美洲首位；1945 年前无拉美国家作家获奖，与 packet 的"拉丁美洲首位"表述一致）。
- 三部诗集 → Work 段："first major work was Desolación, published in 1922. In 1924 came Ternura (Tenderness), which contains lullabies and rhymes for children, and later Tala (Felling) in 1938, which employs unusual imagery and free verse"。
- 运动（来源 1/2）→ "They are also influenced by the modernist movement."（仅此 1 项合格来源，第二来源未核验，见 ISSUES-002）。
- 主题线索（备查，未建 EXPLORES_THEME）→ "central themes are love, deceit, sorrow, nature, travel, and love for children"。

### CAND-B-SRC-002 — NobelPrize.org, Gabriela Mistral – Facts（中文页）
URL: https://www.nobelprize.org/prizes/literature/1945/mistral/facts/?lang=zh
等级 B。与 SRC-001 同源（同一官方内容的中文版），不单独计为独立来源。用于获奖理由中文引文（CAND-B-FCT-010）与"南美洲首位"中文表述佐证。

### CAND-B-SRC-003 — NobelPrize.org, Gabriela Mistral – Bibliography（书目页）
URL: https://www.nobelprize.org/prizes/literature/1945/mistral/bibliography/
等级 B。三集首版书目（直接来源，供 CREATED 与 first_publication_year/bibliographic_note）：
- Desolación. – New York : Instituto de las Españas, 1922
- Ternura : canciones de niños. – Madrid : Saturnino Calleja, 1924
- Tala. – Buenos Aires : Sur, 1938

## 未核验/受阻来源（access_blocked / pending）

### CAND-B-SRC-004 — Britannica, Gabriela Mistral
Cloudflare 人机验证拦截，未获内容。计划用途：运动归属第二来源、《绝望集》作品释义（one_sentence_summary）。→ 相应条目保持 hold / 缺口。

### CAND-B-SRC-005 — Memoria Chilena（智利国家图书馆）
w3-article-3308 URL 打开后重定向至无关条目（Arturo Prat），未获米斯特拉尔内容。计划用途：智利官方第二来源。→ 缺口。

### CAND-B-SRC-006 — UGR 学位论文（Literatura Hispanoamericana Contemporánea, digibug）
下载两次均超时（60s / 30s）。搜索片段称 Mistral 为 "posmodernista"（与 Storni 并列），仅作线索。→ 运动归属第二来源未凑齐。

### CAND-B-SRC-007 — CORE 学术文档（Desolación 现代主义渊源，意文）
下载 0 字节（重定向未跟随成功）。搜索片段称评论界在 Desolación 早期诗作中看到 "filiazione modernista"，仅作线索。→ 同上。

### CAND-B-SRC-008/009/010/011 — 中译书目线索（豆瓣/河北省图书馆 ILAS/广州图书馆/无锡市图书馆）
均未打开（PM 收尾指令禁止新抓取）。仅可确证存在《柔情》中文书目线索（ILAS 标题显示著者"加布列拉·米斯特拉尔"、译者赵振江），出版社/年份/ISBN/收录范围均待核验。按 AGENTS.md 翻译核验优先级（出版社书目 > 国图/权威馆藏 > ISBN/书业 > 豆瓣 > 书商/媒体），下一轮应从漓江出版社书目或国图目录优先复核。
