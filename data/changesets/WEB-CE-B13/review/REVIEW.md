# WEB-CE-B13 Fresh-context Review

日期：2026-08-21
Reviewer：独立 fresh-context reviewer（不修改候选、不修改主库）
范围：`data/changesets/WEB-CE-B13/RESEARCH_CHANGE_SET.json`、B13 Preflight/README；当前主库查重与现有 schema；六个登记来源。

## 初步判定

**REVISE**

候选对象、ID 预留、作者—作品关系方向和中文展示名策略总体可接受；但来源登记中有一处需要在正式 migration 前修正的支持范围问题：`SRC-0246` 的登记说明把 CVC 传记页写成了三部作品（1930/1931/1934）年代的直接依据。重新打开该页后，能确认 Nicolás Guillén 的古巴身份、生卒年和传记/诗歌语境，但未在页面正文中找到这三部书的逐项书目与年份；三部作品的直接书目信息来自 `SRC-0245` 的 Cervantes Virtual bibliography。

这不是要求撤下对象的研究失败，而是需要避免把一个传记来源包装成作品年代的独立证据。

## 主库与边界检查

- B13 预留的 3 位作者、9 个作品/诗集 ID 当前尚未存在于主库；原文题名、中文名、重音和关系三元组均未发现重复。
- 当前主库 `validate_master.py`：PASS；`PRAGMA integrity_check`：`ok`；foreign-key check：0 条错误。
- 关系类型均为现有 schema 中的 `CREATED` 或 `ASSOCIATED_WITH_PLACE`；端点方向符合“作者 → 作品/国家”，没有自环或候选对象之外的端点。
- Coelho 的 3 个实体为 `work`；Drummond 的 3 个实体为 `collection`；Guillén 的 3 个实体为 `collection`。原文题名全部保留，中文名均标注 `provisional_title`，未把暂译名声明为已出版译名。
- `created_at=2026-08-21` 与本批开始日期一致；审核前 `reviewed_at=null`、`reviewer=UNREVIEWED` 属于候选未放行状态，正式 PASS 后必须由集成方写入真实 reviewer 元数据，不得写成 USER 审批。
- 本文件仅审核 Research；B13 尚未提供 Geo/Curation，未对不存在的投影作 PASS 判断。

## 来源逐项核验

| Source | 重新打开结果与直接支持 | 结论 |
|---|---|---|
| `SRC-0241` ABL Paulo Coelho biography (`https://www.academia.org.br/academicos/paulo-coelho/biografia`) | 页面明确写出 Rio de Janeiro、1947 年及作家/记者/作词经历；正文逐项列出 `O Alquimista`（1988）、`Veronika Decide Morrer`（1998）、`Onze Minutos`（2003）。 | 身份与三项书目可用，B 类机构来源。 |
| `SRC-0242` USP Portal Latinoamericano (`https://sites.usp.br/portalatinoamericano/en/coelho-paulo`) | 页面标题为 `Coelho, Paulo`，写出 Rio de Janeiro (Brasil), 1947，并在作者简介中列出三部作品及 1988/1998/2003。 | 可作为独立 B 类交叉来源。 |
| `SRC-0243` ABL `O ano Drummond` (`https://www.academia.org.br/artigos/o-ano-drummond`) | 页面标题、作者和 `Poesias` 清单可核对；逐项列出 `Alguma poesia` 1930、`A rosa do povo` 1945、`Claro enigma` 1951。 | 直接支持 Drummond 三部诗集题名/年份，B 类。 |
| `SRC-0244` BNDigital Drummond (`https://bndigital.bn.gov.br/carlos-drummond-de-andrade/`) | BNDigital 权威页明确列出姓名、1902—1987，且正文列出 `Alguma Poesia`、`A Rosa do Povo`、`Claro Enigma` 及诗歌语境。页面同时标出其传记段落引用外部网页；因此只把它用于页面直接可见的身份/书目/语境，不扩展成独立文学史判断。 | 基础事实可用，B 类；不得把页内外部引文再包装成 A 类研究。 |
| `SRC-0245` Cervantes Virtual bibliography (`https://www.cervantesvirtual.com/portales/nicolas_guillen/su_obra_bibliografia/`) | 页面标题为 `Bibliografía`，作者署名 Nancy Morejón；`Obras de Nicolás Guillén` 逐项列出 `Motivos de son` 1930、`Sóngoro cosongo; poemas mulatos` 1931、`West Indies, Ltd.` 1934。 | 三部 Guillén 作品题名/年份的直接依据，B 类。 |
| `SRC-0246` CVC Guillén biography (`https://cvc.cervantes.es/literatura/escritores/guillen/biografia.htm`) | 页面直接支持 Nicolás Cristóbal Guillén 的古巴身份、1902 年出生及 1989 年去世，并提供诗人/作品的传记语境；未找到三部本批书目的逐项年代。 | 作者身份可用；不能独立承担三部作品的年代支持。 |

六个 URL 均可打开并取得正文；未使用搜索摘要代替正文。来源等级、canonical URL 和页面身份总体正确。

## 必须修正项

### P1-01 — `SRC-0246` 的 supports 范围过宽

当前 `SRC-0246.supports` 写为：`Cuban identity, 1902–1989, poemario context and 1930/1931/1934 chronology`。重新打开的 CVC 传记页并未提供本批三部作品的逐项书目年代；这会造成来源支持范围漂移。

最小修正：

1. 将 `SRC-0246.supports` 收窄为作者身份、生卒年和传记/诗歌语境；
2. 将 `V1-ENT-0317`—`V1-ENT-0319` 的题名/年份正式 facts、CREATED relationships 和 card 书目依据明确锚定在 `SRC-0245`；`SRC-0246` 如仍保留在作品级 source list，只能作为作者/诗歌语境的辅助来源，不得被写成直接年代证据；
3. migration、card-source 和 evidence 中不得出现“0246 独立支持 1930/1931/1934”的说明。

完成以上差量修改后，请以 fresh follow-up reviewer 复核并将最终结论更新为 PASS。

## 已通过项目

- 作者与作品/诗集未重复创建；实体层与关系方向合理。
- Coelho 1988/1998/2003、Drummond 1930/1945/1951、Guillén 1930/1931/1934 的年份与直接来源对应关系明确（Guillén 年份直接来自 `SRC-0245`）。
- 关系仅为低解释强度的 `CREATED` 与作者—国家 `ASSOCIATED_WITH_PLACE`，未出现未经证明的影响、运动或主题关系。
- 中文名称均为读者入口的 provisional label，未冒充正式中译本；原文题名保留。
- 未将出生地、传记地点自动扩展为作品发生地；本批暂不新增文学地点，因此无虚构坐标问题。

## Focused Follow-up Review（修订后）

复核日期：2026-08-21

已核对候选 JSON 的修订：`SRC-0246.supports` 已收窄为 `Cuban identity, 1902–1989 and biographical/poemario context; not used as the primary source for the three publication years`，不再宣称该传记页直接提供 1930/1931/1934 的出版年代。Guillén 三部作品的候选 `source_ids` 仍同时保留 `SRC-0245` 与 `SRC-0246`，但前者是书目/年份主来源，后者仅可作为作者及诗歌语境辅助来源；三条 CREATED 关系的候选 `source_ids` 已为 `SRC-0245`。

正式集成时须保持这一边界：`V1-ENT-0317`—`V1-ENT-0319` 的年份 facts、CREATED relationship evidence、cards/card-source 以及相关 migration 说明必须以 `SRC-0245` 为直接主锚点，不能将 `SRC-0246` 写成三项年份的独立证据。该约束将在 migration rehearsal 和主库 QA 中再次检查。

### 最终判定：PASS

Research Change Set 在上述来源范围修订后通过 fresh-context follow-up。该 PASS 不替代后续 SQLite migration、Geo/Curation/Web Data 和 QA gate；这些步骤仍须按本批流程独立完成。
