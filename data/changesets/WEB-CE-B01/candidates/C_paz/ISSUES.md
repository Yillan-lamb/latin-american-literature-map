# ISSUES — Worker C（帕斯）· WEB-CE-B01

## 1. 查重结论（无冲突）
- 作者：V1-ENT-0059 奥克塔维奥·帕斯（author）主库无任何 facts/relationships/cards，本次仅补候选，不新建实体。
- 三部作品：以 `LIKE '%迷宫%'`、`%弓与琴%`、`%太阳石%`、`%寂寞%`、`%laberinto%`、`%arco y la lira%`、`%piedra de sol%` 查主库 entities，均无同名 → `new`，无重复风险。
- 译名变体《寂寞的迷宫》：未核验到实例，未建别名实体；若后续出现应记入 aliases 而非新建实体。

## 2. Hold / 缺口（fail-closed）
- CAND-C-REL-006 ASSOCIATED_WITH_MOVEMENT 先锋派（V1-ENT-0132）：仅 poets.org 一项独立来源提及先锋派杂志 Barandal；Britannica（403）、CVC（404）未取得第二来源 → `hold_needs_second_source`。
- CAND-C-REL-007 超现实主义语境：Nobel Facts（A）+ poets.org（B）双来源已够解释级，但库内无超现实主义 movement 实体、本 packet 亦未分配新建 → `hold` + `entity_gap`，是否新建实体请 PM/Reviewer 裁决。
- CAND-C-REL-008 EXPLORES_THEME《孤独的迷宫》→ V1-ENT-0107（面具游戏与自我的折叠）：未获双来源直接论及"面具（máscaras）"主题；现有来源仅证"墨西哥历史与文化分析"主题（更接近 V1-ENT-0108 跨文化与美洲身份，但同样无双来源直接支撑，均不提出）→ `hold_needs_second_source`（evidence_count=0）。《孤独的迷宫》含著名章节「Máscaras mexicanas」，建议后续补专门学术来源。
- 《太阳石》中译：translation_status=`pending`。检索线索显示燕山「天下大师·帕斯作品」系列含《太阳石》、豆瓣存在同名条目，但未打开任何中文书目页（PM 收尾指令禁止新抓取），译者/出版社/年份/ISBN 未确认，单行本抑或收入诗选亦未确认。

## 3. 未决问题 / 冲突
- fact_field 词表缺口：`SELECT DISTINCT fact_field FROM facts` 无 `birth_place`。packet 明确"出生地作 fact，禁止 BORN_IN 关系"，故 CAND-C-FCT-005 使用 `birth_place` 字段并如实标注词表差异；由 Reviewer 裁决新增字段或并入既有字段（如 key_place）。
- 《孤独的迷宫》《弓与琴》原版出版社：Nobel 书目页未列西语原版；poets.org 标 FCE 1950/1956，FCE 产品页未能打开（404）→ bibliographic_note 仅记英译与来源标注，原版出版社条目待补。
- Piedra de sol 初版出版社：Nobel 书目页（A）标 Tezontle 1957，poets.org 标 FCE 1957；Tezontle 系 FCE 诗丛印行，两说相容，不作冲突处理。
- 事件 V1-ENT-0112（1982 诺奖）用法参照：主库中该事件实体本身无 facts/relationships，诺奖惯例是作者级 `award` fact（V1-FCT-0122/0171/0180）。本包照此办理：事件实体候选 CAND-C-EV-001 + 作者 award fact CAND-C-FCT-006；未建作者→事件关系（词表无对应关系词）。
- poets.org 的 "Modernist" 指国际现代主义，不可映射为库内 V1-ENT-0131 modernismo（西语现代主义），未据此建关系。

## 4. 证据强度说明
- 全部直接书目/人物事实均有 A/B 级来源（Nobel 官网 ×3、poets.org、大学馆藏目录）；豆瓣仅用于《弓与琴》中译书目（D 级）。
- 搜索摘要未作为来源；所有 access_pass 页面均实际打开并记录关键原文。
