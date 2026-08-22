# REVIEW_PACKET — WEB-CE-B01（包 1:A/B/C 作家研究）

- task ID:`WEB-CE-B01-REVIEW-ABC`
- 角色:Independent Reviewer(fresh context,V4 Pro, high)。只审本包,不重跑 Research,不写主库。
- 判词:每项候选仅 `PASS` / `REVISE` / `HOLD`,给一行理由。REVISE 只列失败 delta。

## 输入文件(只读)

- candidates:`data/changesets/WEB-CE-B01/candidates/A_fuentes/`、`B_mistral/`、`C_paz/`(各含 SOURCE_CANDIDATES.csv、ENTITY_CANDIDATES.csv、FACT_CANDIDATES.csv、RELATION_CANDIDATES.csv、TRANSLATION_AUDIT.csv、SOURCE_NOTES.md、ISSUES.md、HANDOFF.md)
- PM 补验与决策草案:`data/changesets/WEB-CE-B01/review/PM_SUPPLEMENT_VERIFICATION.md`
- 预检与规则:`data/changesets/WEB-CE-B01/PREFLIGHT.md`

## 背景摘录(权威规则已在 PREFLIGHT.md,此处为查重要点)

- Schema 0.3 关系词仅 13 个:CREATED、CONTAINS_WORK、EDITION_OF、TRANSLATION_OF、ADAPTED_FROM、DIRECTED、SET_IN、ASSOCIATED_WITH_PLACE、ASSOCIATED_WITH_MOVEMENT、EXPLORES_THEME、RESPONDS_TO_WORK、INFLUENCED_BY、BASED_ON_EVENT。BASED_ON_EVENT 仅 work→event。
- 证据:直接书目/人物事实一项合格 A/B 来源即可;解释型关系(ASSOCIATED_WITH_MOVEMENT/EXPLORES_THEME/RESPONDS_TO_WORK/INFLUENCED_BY)需两项真正独立来源,否则 hold_needs_second_source;SET_IN 需原作或合格来源直接说明;AI 记忆不是来源;豆瓣可证中文版存在与书目,不作文学事实/解释依据。
- 中译 status 词表:verified_single_volume / verified_collection / verified_old_edition / verified_traditional_chinese / pending / not_found。
- 事实字段以主库 facts 既有词表为准(可 sqlite3 只读查 DISTINCT fact_field);`birth_place` 为新字段值,依据操作手册 SOP-B 第 8 条(出生地存为 birth_place 事实),见 PM 决策草案 D1。
- 已有作者:帕斯 V1-ENT-0059(reuse);地点:墨西哥 V1-ENT-0051、墨西哥城 V1-ENT-0056、智利 V1-ENT-0123、圣地亚哥 V1-ENT-0128;运动:文学爆炸 V1-ENT-0130、墨西哥革命小说 V1-ENT-0064、先锋派 V1-ENT-0132、现代主义 V1-ENT-0131;事件模式:1982 诺奖 V1-ENT-0112。可用 sqlite3 只读核对。
- 本包范围外:建议池 11 部(Worker D,另行评审);不评审 D 目录。

## 逐项审核要求

对 A/B/C 三个目录的每个候选行给 verdict(可合并同类,但关键项须逐条):

1. source identity:具体对象、URL/ISBN 真实、access_status 与实际一致、等级匹配(A/B/C/D)。
2. entity identity:作者/作品/事件身份正确;work/collection/edition 层级;《奥拉》entity pending 是否成立;出生地冲突(BnF 巴黎 vs 通行巴拿马城)应判 disputed/hold 而非入库。
3. bibliographic accuracy:首版年、体裁、原文名、中译名与别名;出版年字段拆分。
4. claim-to-evidence:每条 fact/relation 的来源直接支持断言;无 AI 记忆冒充;gap 行不冒充候选。
5. relationship endpoints:词表合法、端点类型正确;CREATED 是否有直接书目来源。
6. interpretive evidence:hold 是否正确标注;有无该 hold 却写成 candidate 的项。
7. translation conflicts:TRANSLATION_AUDIT 与 PM 补验合并后,逐作品定 status 建议;译名变体是否只记 aliases。
8. copyright / public boundary:低剧透释义级,无全文摘录。

## 输出

写 `data/changesets/WEB-CE-B01/review/REVIEW_ABC.md`:
- 逐项 verdict 表(item_id → PASS/REVISE/HOLD + 一行理由)
- 汇总:每个目录的 PASS/REVISE/HOLD 计数
- REVISE delta 清单(每项:必须修复/保持不变/禁止新增/重新验证)
- HOLD 清单与缺失证据说明
- 对 PM 决策草案 D1/D2/D3 的 verdict

聊天中只返回 compact 摘要(计数与关键 REVISE/HOLD)。禁止:写 V1_MASTER.sqlite、分配正式 ID、修改候选文件本身、git 操作、研究本包外对象。
