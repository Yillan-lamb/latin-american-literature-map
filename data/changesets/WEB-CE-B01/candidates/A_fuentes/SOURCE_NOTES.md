# SOURCE_NOTES — Worker A（卡洛斯·富恩特斯）WEB-CE-B01-R-A

- 访问日期：2026-08-18
- 网络状态：仅 BnF（data.bnf.fr + catalogue.bnf.fr）成功打开；Britannica / LC / BBC / Guardian / Wikipedia 均被拦截或超时。

## 已核验来源（access_pass）

### CAND-A-SRC-01 — BnF data 权威记录（人物）
- canonical_url：https://data.bnf.fr/11903714/carlos_fuentes/
- persistent_id：ark:/12148/cb119037146；VIAF 43057803；LC n80022904；GND 118703420；ISNI 0000000121301089
- 页面内 schema.org Person JSON-LD（原样提取）：
  - name: "Carlos Fuentes (1928-2012)"
  - birthDate: 11-11-1928；birthPlace: **Paris**
  - deathDate: 15-05-2012；deathPlace: Mexico
  - nationality: **Mexique**
  - description: "Romancier, essayiste, dramaturge. - Ambassadeur du Mexique en France de 1975 à 1977, professeur de littérature à Harvard (en 1985)"
- claim→evidence 映射：
  - birth_year 1928 ← birthDate 11-11-1928（high）
  - death_year 2012 ← deathDate 15-05-2012（high）
  - country_or_region 墨西哥 ← nationality Mexique（high）
  - career_note（1975–77 驻法大使；1985 哈佛教授）← description（medium）
  - one_sentence_summary（小说家/散文家/剧作家）← description 直译（medium）
  - 出生地冲突 ← birthPlace Paris vs 任务假定"巴拿马城"（low / hold，见 ISSUES.md）
- 注意：本页为 JS 渲染页面，正文区文本稀少，但 JSON-LD 完整可提取；出生地 "Paris" 与主流传记记载（巴拿马城）冲突，BnF 此项可信度存疑，必须第二来源仲裁。

### CAND-A-SRC-02 — BnF 目录检索结果页（catalogue.bnf.fr）
- canonical_url：https://catalogue.bnf.fr/rechercher.do?motRecherche=Carlos+Fuentes
- 页面面（facet）原样提取：
  - 作者面：`Fuentes, Carlos (1928-2012) (223)` —— 该作者名下 223 条目录记录
  - 作品面：`Fuentes, Carlos (1928-2012) La región más transparente (8)`；`... La muerte de Artemio Cruz (5)`；`... Terra nostra (6)`
  - 页面可见面中**未出现** Aura（第 10 条结果页只展示部分面）
- claim→evidence 映射：
  - 作者存在且生卒 1928-2012（与 SRC-01 相互印证）
  - CREATED：富恩特斯 → La región más transparente（目录归名，8 条）
  - CREATED：富恩特斯 → La muerte de Artemio Cruz（目录归名，5 条）
  - 作品实体书目存在（bibliographic_note）
- 局限：检索结果页为"快照"性页面（jsessionid 参数），不适合长期引用；作为目录级归名证据等级为 B，且仅证明作品归属作者，不含首次出版年份等书目细节。

## 尝试但未核验来源（access_blocked，如实记录）

| temp id | URL | 失败原因 |
|---|---|---|
| CAND-A-SRC-03 | https://www.britannica.com/biography/Carlos-Fuentes | Cloudflare "Just a moment..." 挑战拦截 |
| CAND-A-SRC-04 | https://id.loc.gov/authorities/names/n80022904.html | Cloudflare 拦截 |
| CAND-A-SRC-05 | https://www.bbc.com/news/world-latin-america-18081034 | curl 超时（exit 28），重试一次仍失败 |
| CAND-A-SRC-06 | https://www.theguardian.com/books/2012/may/15/carlos-fuentes | curl 超时（exit 28） |
| CAND-A-SRC-07 | https://en.wikipedia.org/wiki/Carlos_Fuentes | 抓取中止/超时 |

- 以上页面**均未取得正文**，不构成证据；不得以搜索摘要替代。相关工作项已标 hold/pending/gap。

## 未建立来源（本轮完全未核验）
- 三部作品的中译本书目页（译者/出版社/年份/ISBN）——TRANSLATION_AUDIT 全部 pending；待核线索见 ISSUES.md，且明确标注为"非来源线索"。
