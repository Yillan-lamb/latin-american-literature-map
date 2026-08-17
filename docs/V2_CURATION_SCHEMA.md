# V2 Curation Data Schema

## 1. 任务信息

- 任务：`V2-S2-001`
- 日期：2026-08-11
- 状态：`✅ DONE`
- 上游：`docs/V2_DATA_READINESS_AUDIT.md`、`docs/V2_MAP_DATA_QA.md`
- 下游：`V2-S2-002` Web Data Schema 与构建流程

本 Schema 固定 V2 策展展示层的最小数据契约。它回答“研究内容应该重点说什么、怎样呈现给读者”，不保存或改写 V1 研究事实。研究事实仍只来自 `data/master/V1_MASTER.sqlite` 及其正式来源；策展内容只通过引用 ID 使用研究数据。

## 2. 数据流与目录

```text
V1 Research Data + V2 Geo Technical Data
                 │ 只读引用
                 ▼
        data/v2/curation/
                 │ 生成 Web Data
                 ▼
        data/v2/web/ → Frontend
```

当前目录下的三个结构化文件分别承载不同语义：

| 文件 | 作用 | 是否可写研究事实 |
|---|---|---|
| `CURATION_ENTRIES.csv` | 作家、作品、地点、国家、时间线、首页等页面文案和标签 | 否 |
| `CURATION_SELECTIONS.csv` | 精选、排序、地图/首页/时间线展示开关 | 否 |
| `CURATION_RECOMMENDATIONS.csv` | 入门作品、延伸阅读、跨作品阅读路径及推荐理由 | 否 |

Schema 初始阶段只保留表头；`V2-S3-002` 已按 N2 样本生成最小内容。后续扩展仍必须遵守本文件的字段和状态门禁，不以批量文案替代研究补证。

## 3. 公共字段与审核状态

三个文件均必须保留以下治理字段：

| 字段 | 必填 | 说明 |
|---|---|---|
| `curation_id` | 是 | V2 策展记录唯一 ID，前缀按文件区分 |
| `target_type` | 是 | `author` / `work` / `place` / `country` / `fictional_space` / `timeline_node` / `homepage` |
| `target_id` | 是 | 目标实体 ID；优先使用 V1 `entity_id`，地点技术节点使用 V2 `place_id` |
| `field_key` | 是 | 策展字段或展示用途的受控键 |
| `status` | 是 | 仅允许 `auto_approved`、`user_review`、`hold` |
| `draft_origin` | 是 | `ai_draft`、`codex`、`user`、`imported` |
| `research_refs` | 条件必填 | 支持该记录的 V1 事实、关系、内容卡或缺口 ID；多个值用 `;` 分隔 |
| `source_refs` | 条件必填 | 支持该记录的 `source_id` 或公开来源 URL；多个值用 `;` 分隔 |
| `basis_note` | 是 | 说明记录依据、表达边界或保留原因 |
| `display_scope` | 是 | `home`、`map`、`detail`、`timeline`、`search` 的一个或多个 |
| `sort_order` | 否 | 同一展示范围内的排序值 |
| `created_at` | 是 | ISO 日期 |
| `reviewed_at` | 否 | Codex 或 USER 审核日期 |
| `reviewer` | 是 | `CODEX`、`USER` 或 `UNREVIEWED` |
| `review_note` | 是 | 审核结论；没有补充说明时写 `none`，不得留空 |
| `schema_version` | 是 | 当前为 `v2-curation-0.1` |

### 状态门禁

| 状态 | 可进入 Web Data | 规则 |
|---|---|---|
| `auto_approved` | 是 | 有明确研究事实/关系/正式来源支持；Codex 已完成来源核验，不改变研究结论 |
| `user_review` | 否，除非专门作为待审项输出 | 价值判断、跨作品比较、阅读推荐、新主题归纳或新文学概括，等待 USER 审核 |
| `hold` | 否 | 证据不足、来源争议、研究缺口、现实/虚构分类未定或当前不适合展示 |

`status` 不是研究数据库的 `review_status` 的替代字段；前者只决定策展展示准入，后者只决定研究数据的审核状态。

## 4. `CURATION_ENTRIES.csv`

### 4.1 字段

```text
curation_id,target_type,target_id,field_key,content_zh,status,draft_origin,research_refs,source_refs,basis_note,display_scope,sort_order,created_at,reviewed_at,reviewer,review_note,schema_version
```

允许的 `field_key`：

- `page_lede`：作家、作品、地点或国家页面导语；
- `one_line_summary`：作品一句话导语；
- `what_it_is_about`：作品“它讲了什么”；
- `why_read`：阅读价值表达；有明显价值判断时必须 `user_review`；
- `literary_place_note`：现实地点的文学导语；
- `fictional_space_note`：虚构空间说明；不得把文学空间写成现实地点；
- `theme_label`：主题展示标签；新主题归纳须 `user_review`；
- `timeline_note`：时间线节点说明；只能消费已审核时间事实；
- `display_tag`：读者可见标签；
- `homepage_intro`、`homepage_section_intro`：首页导语或专题导语。

`content_zh` 是面向读者的短文本，不得嵌入无法回溯的事实。事实型内容必须在 `research_refs` 或 `source_refs` 中给出回溯入口。

## 5. `CURATION_SELECTIONS.csv`

### 5.1 字段

```text
curation_id,target_type,target_id,selection_key,selection_value,status,draft_origin,research_refs,source_refs,basis_note,display_scope,sort_order,created_at,reviewed_at,reviewer,review_note,schema_version
```

允许的 `selection_key`：

- `featured_author`、`featured_work`：首页或国家页精选；
- `featured_place`：地图或地点入口精选；
- `map_status`：`featured`、`eligible`、`hidden`；
- `timeline_status`：`featured`、`eligible`、`hidden`；
- `homepage_status`：`featured`、`eligible`、`hidden`；
- `page_priority`：页面入口优先级；
- `period_bucket`：展示分组，不得改写原始年份；
- `display_layer`：`reading` 或 `research`。

S1-002 的 `PLACES_GEO.csv.map_status` 是地图补充层的可见性初判；S2-001 后，正式 Web Data 应以此文件中针对具体目标的 `map_status` 为准。若两层冲突，必须在 `basis_note` 说明并附研究或来源引用；构建 QA 必须逐项输出 override。缺少依据或枚举非法时，构建必须报错，不能静默覆盖。

## 6. `CURATION_RECOMMENDATIONS.csv`

### 6.1 字段

```text
curation_id,from_target_type,from_target_id,to_target_type,to_target_id,recommendation_kind,recommendation_reason,status,draft_origin,research_refs,source_refs,basis_note,display_scope,sort_order,created_at,reviewed_at,reviewer,review_note,schema_version
```

`recommendation_kind` 允许：

- `entry_point`：入门作品；
- `next_read`：读完之后读什么；
- `thematic_path`：主题阅读路径；
- `country_path`：国家/地点探索路径。

推荐记录是策展判断，不得写入 V1 `relationships`，不得伪装成 `RELATED_TO`、`INFLUENCED` 或其他研究关系。除非只是机械复述已审核事实，推荐记录默认 `user_review`；依据不足则 `hold`。

## 7. 角色边界

| 内容 | Research Data | Curation Data | Web Data |
|---|---:|---:|---:|
| 作者、作品、地点、事件身份 | 主来源 | 只引用 | 页面消费投影 |
| 出版年、生卒年、正式关系 | 主来源 | 只引用 | 页面消费投影 |
| 页面导语、展示标签、排序 | 不保存 | 主来源 | 页面消费投影 |
| 地图精选/隐藏 | 不保存为研究事实 | 主来源 | 页面消费投影 |
| “下一本读什么” | 不保存为研究关系 | 主来源 | 页面消费投影 |
| 证据不足、研究 gap、hold | 主来源 | 可记录保留说明 | 默认不进入普通阅读层 |

阅读层可显示经审核的简明表达；研究层必须能够回到 `research_refs`、`source_refs`、V1 数据字典和来源目录。两层不能互相替代。

## 8. AI 策展流程

```text
AI draft
  ├─ 明确来源/事实支持 → 来源核验 → Codex 审核 → auto_approved
  ├─ 强判断/跨作品比较/推荐 → user_review
  └─ 证据不足/争议/分类未定 → hold
```

AI 不能修改 V1 主库，不能把策展文案中的新判断升级为正式关系，不能用现实地点资料替代虚构空间证据。`UNREVIEWED` 记录不得进入普通阅读层。

## 9. 机械验收要求

S2-002 的构建与 QA 至少检查：

1. 三个文件表头与本 Schema 一致，ID 唯一且字段宽度一致；
2. `target_id`、`from_target_id`、`to_target_id` 均能回溯到 V1 实体或 V2 地理节点；
3. `status`、`draft_origin`、`display_scope`、`selection_key` 等枚举合法；
4. `auto_approved` 有 `basis_note` 且至少有一类研究/来源引用；
5. `user_review` 和 `hold` 不被默认构建为普通阅读内容；
6. 策展推荐不会写入研究关系表；
7. 研究事实在 Web Data 中带来源入口，前端代码无事实硬编码；
8. 虚构空间没有被坐标字段或现实地点父级关系伪装成现实点位。

## 10. 当前结论

`V2-S2-001 = ✅ DONE`。Schema 已将研究事实、地图技术补充、策展展示判断和 Web 消费投影分层，并为后续 N2 样本、最小策展、Web Data 构建和 QA 提供稳定的字段与审核契约。

## 11. rc.5 加法兼容内容契约

`data/v2/curation/PUBLIC_CONTENT.json` 使用 `v2-curation-content-0.3`，作为三个既有 CSV 的加法扩展，不替换旧字段。它保存作家、作品和地点的公众长内容模块，但不保存或改写研究事实。

顶层包含 `authors`、`works`、`places`。每个对象必须有稳定 `target_id`，每个内容字段使用统一审核包装：

```json
{
  "content": "面向公众的中文文案或结构化数组",
  "status": "auto_approved | user_review | hold",
  "research_refs": ["V1-FCT-...", "V1-REL-..."],
  "source_refs": ["SRC-...."],
  "basis_note": "该文案如何由研究材料转写",
  "reviewer": "CODEX-REVIEW | USER | UNREVIEWED",
  "created_at": "YYYY-MM-DD",
  "reviewed_at": "YYYY-MM-DD | null"
}
```

作者允许字段：`reader_lede`、`why_know`、`literary_profile`、`literary_features`、`start_here`、`core_themes`、`literary_connections`、`reader_fit`、`signature_keywords`、`reading_route`、`guiding_question`。作品允许字段：`story_intro`、`reading_premise`、`why_read`、`narrative_features`、`theme_explanations`、`literary_significance`、`reading_tips`、`reading_approach`、`guiding_question`、`next_reads`、`location_note`。地点允许字段：`literary_intro`、`spatial_meaning`、`reader_path`、`exploration_route`。

构建器只把 `auto_approved` 字段投影到 public bundle；`user_review` 与 `hold` 进入内部审核队列。前端不得根据事实字段临时拼接上述核心文学模块。
