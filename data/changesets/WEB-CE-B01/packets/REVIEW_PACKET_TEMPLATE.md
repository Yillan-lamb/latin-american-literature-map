# REVIEW_PACKET — WEB-CE-B01（模板,待 Worker 交付后由 PM 填充并交给 fresh Reviewer）

- task ID：`WEB-CE-B01-REVIEW`
- 角色：Independent Reviewer（fresh context,V4 Pro, high）。只审 packet,不重跑 Research,不写主库。
- 判词：仅 `PASS` / `REVISE` / `HOLD`(逐项)。

## 输入(PM 填充)

- candidate 目录:A/B/C(及后续 D)下的 SOURCE_CANDIDATES.csv、ENTITY_CANDIDATES.csv、FACT_CANDIDATES.csv、RELATION_CANDIDATES.csv、TRANSLATION_AUDIT.csv、SOURCE_NOTES.md、ISSUES.md
- 预检与规则:`data/changesets/WEB-CE-B01/PREFLIGHT.md`
- 既有实体/关系摘录(PM 附查询结果)

## 审核清单(每项候选逐条给 verdict + 理由)

1. source identity:来源是具体对象(书目页/馆藏/学术文献),非搜索摘要;URL/ISBN/持久标识真实;access_status 一致;等级(A/B/C/D)与实际出版形态匹配。
2. entity identity:作者/作品身份正确;work / collection / edition 层级正确;与主库及跨 worker 无重复;同名不同层未误并。
3. bibliographic accuracy:首版年份、体裁、原文名、中译名、别名记录准确;出版年字段拆分正确(禁 PUBLISHED_IN)。
4. claim-to-evidence fit:每条 fact/relation 的来源确实直接支持该断言;无 AI 记忆冒充;无常识补写。
5. relationship endpoints:relation_type 属于 Schema 0.3 十三词;端点类型匹配(BASED_ON_EVENT 仅 work→event);CREATED 有直接书目来源。
6. interpretive evidence:ASSOCIATED_WITH_MOVEMENT / EXPLORES_THEME 等是否两项真正独立来源,否则必须 hold_needs_second_source。
7. Chinese-title/translation conflicts:中译核验逐作品完整(译者/出版社/年份/ISBN 可确认时);translation_status 词表合法;译名变体记 aliases 而未建重复实体;跨 worker 译名冲突已标出。
8. copyright / public boundary:候选不含全文/整书 OCR/受限材料;释义为低剧透公众导读级。

## 输出

- `data/changesets/WEB-CE-B01/review/REVIEW.md`:逐项 verdict 表(item_id → PASS/REVISE/HOLD + reason),汇总 verdict、REVISE delta 清单、HOLD 清单。
- REVISE 项只返失败 delta(必须修复/保持不变/禁止新增/重新验证),由 PM 转回对应 worker;不重跑整批。

## 禁止

- 写 V1_MASTER.sqlite;分配正式 ID;批准自己的研究;改候选文件本身(结论写在 REVIEW.md);研究 packet 外对象。
