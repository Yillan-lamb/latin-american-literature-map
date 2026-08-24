# REVIEW_PACKET — WEB-CE-B01（包 2:建议池 Worker D + PM 替换候选）

- task ID:`WEB-CE-B01-REVIEW-D`
- 角色:Independent Reviewer(fresh context,V4 Pro, high)。只审本包,不重跑 Research,不写主库。
- 判词:每项候选仅 `PASS` / `REVISE` / `HOLD`(gap 行单列「正确排除」)。

## 输入文件(只读)

- `data/changesets/WEB-CE-B01/candidates/D_existing_additions/`(SOURCE/ENTITY/FACT/RELATION_CANDIDATES.csv、TRANSLATION_AUDIT.csv、SOURCE_NOTES.md、ISSUES.md、CROSS_AUDIT.md、HANDOFF.md 如有)
- `data/changesets/WEB-CE-B01/candidates/PM_replacements/`(SOURCE/ENTITY/FACT/RELATION_CANDIDATES.csv、TRANSLATION_AUDIT.csv;PM 以受限补验身份撰写的替换候选,按普通候选同等审核,不自审)
- `data/changesets/WEB-CE-B01/review/PM_SUPPLEMENT_VERIFICATION.md`(补验三波:富恩特斯 2 版、太阳石、柔情目录、建议池替换决策)
- 既有包 1 结论 `review/REVIEW_ABC.md` 仅作背景,不重审。

## 背景摘录

- Schema 0.3 十三关系词;CREATED 一项直接书目来源即可;解释型(ASSOCIATED_WITH_MOVEMENT/EXPLORES_THEME 等)需两项独立来源,否则 hold_needs_second_source;SET_IN 需原作/合格来源直接说明;豆瓣/书店页可证中文版存在与书目,不作文学事实依据。
- 中译 status 词表:verified_single_volume / verified_collection / verified_old_edition / verified_traditional_chinese / pending / not_found。
- 已有作者 ID:博尔赫斯 V1-ENT-0002、马尔克斯 V1-ENT-0072、科塔萨尔 V1-ENT-0073、略萨 V1-ENT-0114、聂鲁达 V1-ENT-0115、李斯佩克朵 V1-ENT-0016、卡彭铁尔 V1-ENT-0074;主题/运动/地点可只读 sqlite3 核对。
- 可复用来源:SRC-0066(BnF 目录含 Las armas secretas),D 的 reuse 标注请核对一致性。

## 特殊审核事项

1. **替换决策(计划规则:无可靠中译→同作者已验证作品替换)**:
   - D 的 CAND-D-ENT-05《方法的资源》/ CAND-D-ENT-06《巴洛克协奏曲》及 REL-10/11、对应翻译行(not_found)→ 判定 `REJECT(SUPERSEDED)`:不入正式数据,理由=全批次检索无中译本;替换为 PM 的 CAND-PM-ENT-01《时间之战》/ CAND-PM-ENT-02《追击》。
   - PM 替换候选逐项按普通标准审核(BnF ark 证据、中译核验来源)。
2. **包 1 结论的三处证据升级(PM 补验第二/三波后)**:
   - C_paz《太阳石》(CAND-C-W-003)翻译行:HOLD(pending)→ 请按 PM 补验(豆瓣 25962160 + 微信读书,燕山 2014,赵振江)给出最终 verdict。
   - B_mistral 三集翻译行:HOLD(pending)→ 请按 PM 补验(queshu 目录页:漓江《柔情》2019.8 完整收录四集,ISBN 9787540786717)给出最终 verdict(建议三行 verified_collection)。
   - A_fuentes 两翻译行 REVISE-1 已在 PM 补验第一波给出全部字段,整合时原样迁移,不属本包范围。
3. D 目录事实行:FCT 的 gap 行(gap_note/gap)单列确认「正确排除」;《绿房子》first_publication_year 1966 为间接推断(medium),请裁决 PASS 或降级 hold。
4. D 的解释/场景关系(REL-12~19)全部 hold 自标,核对标注是否成立、有无该 hold 却写成 candidate 的项。
5. CROSS_AUDIT 与三目录翻译行一致性抽查。

## 输出

写 `data/changesets/WEB-CE-B01/review/REVIEW_D.md`:逐项 verdict 表(item_id → PASS/REVISE/HOLD/REJECT + 一行理由)、计数汇总、REVISE delta、HOLD 清单、替换决策 verdict、三处升级的最终 verdict。聊天中只返回 compact 摘要。

禁止:写 V1_MASTER.sqlite、分配正式 ID、修改候选文件、git 操作、研究本包外对象。
