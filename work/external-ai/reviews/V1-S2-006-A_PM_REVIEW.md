# V1-S2-006-A 项目经理验收记录（R0）

- 任务：试点关系候选与内容事实包
- 外部执行方：EXT-AI-02（ZCode / deepseek-v4-flash，版本 unknown）
- 验收日期：2026-08-10
- 结论：`revise`
- 返修范围：窄范围差量 R1，不重做来源整理、实体候选或全部关系

## 1. 已通过门禁

1. 共享 `FULL` 验证复跑为 `pass`，三张 CSV 分别为 29×17、49×12、36×8，目录恰为 10 个登记文件。
2. 关系候选 ID、事实候选 ID 唯一；27 个关系组三元组分组一致；来源 ID/题名与登记表一致。
3. 关系端点无悬空，标签与 122+387 候选池一致。
4. 《阿莱夫》短篇/作品集、《星辰时刻》原著/电影的核心端点 ID 没有互换。
5. 49 个内容卡 FACT-ID 引用均有效，未发现长摘录、原始资料或越过公开边界的文件。
6. `EXPLORES_THEME`、`INFLUENCED_BY` 抽样总体保持候选语气；单来源解释性关系使用了 `needs_second_source`，没有直接宣布为已确认事实。

## 2. 必须修复项

### R1-01：删除不兼容的导演关系

- 文件：`RELATION_CANDIDATES.csv`
- 定位：`CAND-S2-REL-0012` / `RG-S2-0012`
- 问题：试行 Schema 规定 `CREATED` 只用于 `author → work/collection`，但该行是“苏萨娜·阿马拉尔 → 1985 年电影”，实际是导演关系，客体层为 `adaptation`。本轮词表没有 `DIRECTED`，不得借用 `CREATED`。
- 修复：删除该关系行和对应覆盖行。本轮不新增 `DIRECTED`，导演信息仍可留在实体候选或以后 Schema 提案中。
- 关联矛盾：QA 声称 `0092` 只以 `ADAPTED_FROM` 出现，但 R0 中它同时是 `CREATED` 客体；删除后再更新断言。

### R1-02：删除题名推断的译本关系

- 文件：`RELATION_CANDIDATES.csv`
- 定位：`CAND-S2-REL-0010` / `RG-S2-0010`
- 问题：*The Aleph and Other Stories 1933–1969* 是跨时期二十篇作品及自传/评论组成的英文选集，不能仅凭题名认定为 1949 年西语作品集《阿莱夫》的完整译本。当前来源只提供题名级间接信息，达不到 `TRANSLATION_OF` 的书目事实门槛。
- 修复：删除该关系行和对应覆盖行；保留 `CAND-S2-ENT-0072` 作为英文选集/版次候选，不建立本轮关系。

### R1-03：拆开被误判为双来源的《活水》复合主题

- 文件：`RELATION_CANDIDATES.csv`
- 定位：`CAND-S2-REL-0021`、`0022` / `RG-S2-0021`
- 问题：SRC-0009 支持“时间、当下瞬间与沉默”复合主题；SRC-0011 主要支持“升华、沉默与女性写作”。两来源只有“沉默”部分重叠，不能作为完全相同复合主题三元组的独立双源证据。
- 修复：
  - `0021` 保留对象 `CAND-S2-ENT-0102`，改为 `needs_second_source`；
  - `0022` 改指 `CAND-S2-ENT-0109`，使用新组 `RG-S2-0028`，改为 `needs_second_source`；
  - 更新两行描述和证据释义，使其分别只表达各自来源直接支持的主题。
- 保持：`RG-S2-0022`《星辰时刻》双来源组可以保留为本轮唯一双来源解释关系。

### R1-04：同步覆盖、内容卡与过程文档

- `EVIDENCE_COVERAGE.csv`：删除 RG-S2-0010/0012，增加 RG-S2-0028；关系组覆盖行应为 26，连同 9 个对象共 35 行。直接/结构关系在一个合格来源已充分时，`needs_second_source` 应为 `no`，不能同时写“来源充分”和 `yes`；该字段必须与 Schema 证据规则及关系行状态一致。
- `CONTENT_FACT_CANDIDATES.csv`：`CAND-S2-FCT-0044.value_candidate` 只写枚举值 `collection`，解释文字移入 `issue_notes`。
- `CONTENT_CARD_DRAFTS.md`：R0 实际有 9 个二级内容卡章节，不是报告所称 8 个。保留两位作家+六部试点作品共 8 个 `##` 内容卡；1949 年作品集《阿莱夫》的两条结构事实可放在“不计入内容卡”的普通附注中，不与短篇合并。
- 更新 README、STATUS、QA、ISSUES、HANDOFF、MANIFEST 的最终统计和断言，不保留“0072 位于客体侧”等错误表述。

## 3. R1 预期机械基线

按以上差量修复后，应得到：

- 关系：27 行、26 组；
- 类型：CREATED 9、EXPLORES_THEME 9、SET_IN 3、INFLUENCED_BY 3、ADAPTED_FROM 1、ASSOCIATED_WITH_PLACE 1、ASSOCIATED_WITH_MOVEMENT 1；
- 争议状态：`none=16`、`needs_second_source=11`；
- 双来源解释关系：1 组（《星辰时刻》）；
- 事实：49 行、12 列；
- 覆盖：35 行、8 列；
- 内容卡：8 个二级章节，49 个 FACT-ID 均可保留且必须有效；
- 交付目录：仍为 10 个文件。

如实际修复采取同等正确但统计不同的方式，必须在 QA 明确解释，不能为匹配数字制造内容。

## 4. Codex 对遗留项的决定

1. **CONTAINS_WORK / RESPONDS_TO_WORK**：本轮维持零关系，不为覆盖词表而制造数据；不阻塞 N2。`CONTAINS_WORK` 可在进入暂存前使用国家图书馆或权威版本目录小范围补证，`RESPONDS_TO_WORK` 无明确材料时继续留空。
2. **首发年与卒年**：规范候选值确定为《小径分岔的花园》1941、《阿莱夫》短篇 1945、李斯佩克朵卒年 1977。由于前两项权威网页尚未分配正式来源 ID，不要求外部 R1 改事实表；由 Codex在后续来源登记/暂存整合时补入。1977 可由 IMS 官方页面补证，也不扩大本次 R1。
3. **消歧显示名**：暂存层采用“《星辰时刻》（1977 年小说）”“《星辰时刻》（1985 年电影）”“《阿莱夫》（1945 年短篇）”“《阿莱夫》（1949 年作品集）”。R1 不修改输入候选池标签，以 ID 和层级维持引用完整性。
4. **单来源解释关系**：全部保留为候选并标 `needs_second_source`，不在本轮继续检索；它们不得进入已确认关系集合。修复后预计为 11 个单来源解释组。
5. **英文选集关系**：`CAND-S2-REL-0010` 不接受。英文选集候选可保留，但不得与 1949 作品集建立 `TRANSLATION_OF`，除非后续权威书目逐项证明版本关系并采用更合适的建模方式。

### 核验来源

- 阿根廷国家图书馆：“El Aleph”于 1945 年发表于《Sur》第 131 期：`https://www.bn.gov.ar/agenda-cultural/revista-hispamerica-dedicada-a-el-aleph`
- 阿根廷国家图书馆资料：“El jardín de senderos que se bifurcan”发表于 1941 年并于 1944 年收入《Ficciones》：`https://www.bn.gov.ar/micrositios/admin_assets/issues/files/888ad4a8a0a9644a2b30859a16c3328b.pdf`
- IMS 官方资料：1977 年为李斯佩克朵去世之年：`https://site.claricelispector.ims.com.br/en/2018/05/15/manuscritos-de-um-sopro-de-vida/`
- WorldCat/Google Books 书目显示英文选集包含跨时期二十篇小说、评论及自传性文章，不是 1949 年作品集的简单一一译本：`https://search.worldcat.org/fr/title/aleph-and-other-stories-1933-1969-together-with-commentaries-and-an-autobiographical-essay/oclc/3896577`、`https://books.google.com/books?id=auMSAAAAYAAJ`

## 5. 保持不变与禁止新增

- 保持 122 条实体候选、八个正式来源、其余已通过关系和事实内容不变。
- 不新增来源、正式 ID、关系词、OCR、全文、最终策展文案或暂存数据。
- 不重跑前序来源研究，不修改输入交付包、Schema、TASKS、决策记录或 GitHub。

## 6. R1 重新验证

1. 复跑共享 FULL 验证，检查三表基线、目录安全和 ID 唯一性。
2. 重跑全部关系端点、标签和关系词端点类型兼容断言。
3. 检查 group 三元一致、覆盖表组数及 `needs_second_source` 与关系状态一致。
4. 复核 `0021/0022` 两条《活水》主题分别与 SRC-0009/SRC-0011 释义一致。
5. 确认内容卡恰为两位作家+六部作品，所有 FACT-ID 有效，FCT-0044 为纯枚举值。
6. 确认过程文档不存在 R0 的 29/27、双源 2 组、内容卡 8 节但实际 9 节等矛盾。
