# 阶段 2：试行 Schema 与迁移规则

- 版本：`0.3`
- 状态：N2 冻结后经 N3 用户批准完成加法兼容升级
- 负责人：`CODEX-DATA`
- 生效范围：V1 阶段 3—5 的研究、暂存、数据库与导出
- 冻结节点：`V1-N2-001`（2026-08-10）；加法升级节点：`V1-N3-001`（2026-08-11）

## 1. 目的

本文件规定 V1 批量研究采用的实体分层、关系词、证据规则和迁移口径。N2 已通过；N3 按 V1-S4-A03-PROP-001 批准新增 `BASED_ON_EVENT`，其余实体层、关系词和既有数据不迁移。外部任务不得自行增加实体层或关系词；后续如需改变，仍须由 Codex形成兼容性提案并提交新的用户节点决定。

## 2. 实体类型

| 类型 | 含义 | 示例 |
|---|---|---|
| `author` | 作家或文本作者 | 博尔赫斯、李斯佩克朵 |
| `person` | 非作家的相关人物 | 导演、译者、编辑等 |
| `work` | 单篇作品或独立文学作品 | 短篇《阿莱夫》 |
| `collection` | 收录多个作品的作品集 | 1949 年作品集《阿莱夫》 |
| `edition` | 具体版次、译本或修订本 | *The Aleph and Other Stories 1933–1969* |
| `adaptation` | 电影、戏剧等改编成果 | 1985 年《星辰时刻》电影 |
| `character` | 文学人物 | 作品内人物 |
| `place` | 国家、城市或重要地点 | 布宜诺斯艾利斯 |
| `institution` | 出版、研究或文化机构 | IMS |
| `event` | 历史、文学或生平事件 | 出版、流亡等事件候选 |
| `movement` | 文学运动或较窄流派概念 | 西语美洲先锋派 |
| `theme` | 受控主题候选 | 记忆、身份、语言 |
| `source` | 研究资料来源 | 正式 `SRC-` 来源 |

同名不等于同一实体。短篇《阿莱夫》和 1949 年同名作品集必须分开；版本、译本和改编不得与原作合并。

## 3. 本轮允许的关系词

| 关系词 | 主体 → 客体 | 证据类别 |
|---|---|---|
| `CREATED` | author → work/collection | 直接事实 |
| `CONTAINS_WORK` | collection → work | 结构事实 |
| `EDITION_OF` | edition → work/collection | 书目事实 |
| `TRANSLATION_OF` | edition → work/collection | 书目事实 |
| `ADAPTED_FROM` | adaptation → work | 书目/改编事实 |
| `DIRECTED` | person/author → adaptation | 直接事实 |
| `SET_IN` | work → place | 原作或合格研究来源 |
| `ASSOCIATED_WITH_PLACE` | author/work → place | 人物/背景事实 |
| `ASSOCIATED_WITH_MOVEMENT` | author/work → movement | 文学史判断 |
| `EXPLORES_THEME` | work → theme | 解释性判断 |
| `RESPONDS_TO_WORK` | work → work | 解释性判断 |
| `INFLUENCED_BY` | author/work → author/work | 解释性判断 |
| `BASED_ON_EVENT` | work → event | 历史题材/虚构化事实 |

外部 AI 不得新增正式关系词。无法归类的内容写入 `ISSUES.md`，不使用 `PROPOSED:` 扩充词表。`CONTAINS_WORK` 同时承担作品集收录关系，不另设同义的 `COLLECTS_WORK`。

## 4. 证据与置信度

1. 每条关系候选必须关联有效来源 ID 和准确来源题名；页码、章节和 locator 可空。
2. `CREATED`、`CONTAINS_WORK`、`EDITION_OF`、`TRANSLATION_OF`、`ADAPTED_FROM` 等直接关系，可由一个明确、合格来源形成候选。`BASED_ON_EVENT` 必须至少有一个 A 级来源直接表达作品以该事件为题材、基础、重述或虚构化对象；只并置作品与事件的标题级材料不能单独建立关系。
3. `EXPLORES_THEME`、`RESPONDS_TO_WORK`、`INFLUENCED_BY`、`ASSOCIATED_WITH_MOVEMENT` 属解释性关系：
   - 只能由原作、A 级研究来源或明确作出该判断的合格来源支持；
   - 不得从标题、常识、关键词共现或 Worker 自己的阅读感受推断；
   - 原则上需要两个独立合格来源；只有一个来源时使用 `needs_second_source`，不得标为已确认；
   - 同一三元关系有两个独立来源时，分成两行并使用相同 `relation_group_id`。
4. `SRC-0007` 只承担书目和人物交叉事实，不支持解释性关系。
5. 置信度只允许 `high`、`medium`、`low`；争议状态只允许 `none`、`needs_second_source`、`disputed`、`unclear`、`rejected`。

## 5. 阶段 2 规范化种子

以下 ID 仅作为本轮关系端点的候选层种子，不是正式实体 ID：

| 对象 | 候选 ID | 层级 |
|---|---|---|
| 豪尔赫·路易斯·博尔赫斯 | `CAND-S2-ENT-0001` | author |
| 《小径分岔的花园》 | `CAND-S2-ENT-0002` | work |
| 短篇《阿莱夫》 | `CAND-S2-ENT-0003` | work；1949 不作为已核定首发年 |
| 《虚构集》 | `CAND-S2-ENT-0069` | collection |
| 1949 年作品集《阿莱夫》 | `CAND-S2-ENT-0071` | collection |
| 克拉丽丝·李斯佩克朵 | `CAND-S2-ENT-0086` | author |
| 《活水》 | `CAND-S2-ENT-0087` | work |
| 《星辰时刻》原著 | `CAND-S2-ENT-0088` | work |
| 《家庭纽带》 | `CAND-S2-ENT-0089` | work/collection 待 N2 最终命名，但不得与单篇混同 |
| 1985 年《星辰时刻》电影 | `CAND-S2-ENT-0092` | adaptation |

其余人物、地点、主题和运动端点可使用已交付候选 ID，但必须核对名称和类型。`CAND-S2-ENT-0085` 等重复作者行只作来源证据，不作为新的关系端点。

## 6. 候选转暂存规则

1. 外部交付只生成候选，不产生正式实体或关系 ID。
2. Codex先做端点规范化、同名分层、关系分组和语义抽样。
3. 被接受的候选在迁移表中记录 `candidate_id → staging_id`；重复候选只增加来源证据，不重复建实体。
4. 解释性关系在缺少第二来源时可以保留为待审候选，但不得进入“已确认关系”集合。
5. `disputed`、`unclear`、端点层级错误或标题子串误合并的记录不得进入暂存。

## 7. 内容卡与来源定位

1. 内容卡采用事实清楚、篇幅克制的中文资料卡，不要求外部 AI 直接写成正式展览文案。
2. 卡片至少包含对象类型、一句话简介、必要书目信息或关键内容、来源名称；研究说明必须与事实说明区分。
3. 书籍最低定位到书名，论文定位到论文名及 DOI/稳定链接，网页定位到页面标题、机构和 URL。
4. 页码、章节、段落锚点和短摘录均为可选增强，不作为批次通过的普遍门槛。
