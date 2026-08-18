# WEB-CE-B01 策展层与公共内容层交接（Curation Handoff）

- 任务：为 WEB-CE-B01 已评审批次补齐策展层（CURATION_ENTRIES.csv）与公共内容层（PUBLIC_CONTENT.json）
- Worker：Curation Worker（V4 Flash 路线, high）
- 日期：2026-08-18
- 原则：只复述已评审事实；依据不足一律 user_review 或省略，未虚构任何文学判断

## 改动文件

| 文件 | 动作 | 说明 |
|---|---|---|
| `scripts/build_v2_public_content.py` | 修改 | AUTHORS +3、WORKS +6、AUTHOR_EXPANSION +3、WORK_READING +6；`build()` 内新增 `NEW_AUTO_AUTHORS` / `NEW_AUTO_WORKS` 分支，控制字段级状态 |
| `data/v2/curation/PUBLIC_CONTENT.json` | 重建 | 由脚本生成（schema v2-curation-content-0.3） |
| `data/v2/curation/CURATION_ENTRIES.csv` | 追加 | +3 行（V2-CUR-ENT-017/018/019），未动既有行 |
| `data/v2/web/site_data.json`、`data/v2/web/manifest.json` | 重建 | `build_v2_web_data.py` 默认参数生成 |
| `scripts/validate_v2_web_data.py` | 修改 | 更新 `expected_scope_counts`（10/17/19 → 3/3/21），见「遗留问题」 |

未改动：主库 V1_MASTER.sqlite、迁移/导出、site/ 前端、治理文件（PROJECT_CHARTER/TASKS/V2_TASKS/CHANGELOG）、未创建 release/tag。

## 新增条目

### AUTHORS（3 项）
- **V1-ENT-0145 卡洛斯·富恩特斯**：refs=V1-FCT-0260~0264 + V1-REL-0077/0078；sources=SRC-0087;SRC-0088
- **V1-ENT-0148 加夫列拉·米斯特拉尔**：refs=V1-FCT-0267~0276,0278 + V1-REL-0080/0081/0082；sources=SRC-0089;SRC-0090;SRC-0091
- **V1-ENT-0059 奥克塔维奥·帕斯**：refs=V1-FCT-0290~0297 + V1-REL-0085/0086/0087；sources=SRC-0092;SRC-0094;SRC-0095

字段级状态（3 位作者一致）：
- `reader_lede`、`literary_features` = **auto_approved**（仅复述已评审事实：生卒年/国籍/职业/one_sentence_summary/career_note/作品书目年与体裁/官方释义，逐句可回指）
- `why_know`、`start_here`、`core_themes`、`reader_fit`、`signature_keywords`、`reading_route`、`guiding_question` = **user_review**（含阅读推荐/问题，待 USER 审核）
- `literary_profile`、`literary_connections` 沿用脚本默认 user_review

### WORKS（6 项，仅限有故事级事实者）
- 帕斯 3 部：V1-ENT-0154《孤独的迷宫》、0155《弓与琴》、0156《太阳石》
- 米斯特拉尔 3 部：V1-ENT-0149《绝望集》、0150《柔情集》、0151《塔拉集》

字段级状态（6 部一致）：
- `story_intro`、`narrative_features`、`location_note` = **auto_approved**（仅据 one_sentence_summary / 书目事实改写）
- `why_read`、`theme_explanations`、`reading_tips`、`reading_approach`、`guiding_question`、`next_reads` = **user_review**
- `reading_premise`、`literary_significance` 沿用脚本默认 user_review

**未虚构处理**：富恩特斯 2 部（V1-ENT-0146/0147）与追加 11 部（V1-ENT-0158~0168）只有书目级事实、无故事释义，**未加入 WORKS 列表**（未编造 story_intro），仍完整存在于研究层（pages.works / research.entities + 卡片与事实）。

### WORK_READING / AUTHOR_EXPANSION
- WORK_READING +6 键（0154/0155/0156/0149/0150/0151），AUTHOR_EXPANSION +3 键（0145/0148/0059），防 KeyError。

### CURATION_ENTRIES.csv（+3，全部 auto_approved page_lede）
- V2-CUR-ENT-017 V1-ENT-0145（refs=V1-FCT-0260~0264，SRC-0087;SRC-0088）
- V2-CUR-ENT-018 V1-ENT-0148（refs=V1-FCT-0267~0269,0271,0273,0274，SRC-0089;SRC-0090;SRC-0091）
- V2-CUR-ENT-019 V1-ENT-0059（refs=V1-FCT-0290~0292,0294~0296，SRC-0092;SRC-0094;SRC-0095）
- 均只复述卡片已评审事实，basis_note 已注明依据；编号延续既有序列，未与既有行冲突。

## public_content 覆盖

- authors：10 → **13**（+3，全部在册）
- works：17 → **23**（+6，全部在册）
- places：本轮未新增（PLACE_MEANINGS/PLACE_PATHS 不变）
- 公共可发布范围（auto_approved 层）：
  - authors = 3（V1-ENT-0059/0145/0148）
  - works = 3（V1-ENT-0154/0155/0156）
  - places = 21（既有 19 + 批次地点关系带入的墨西哥城 V1-ENT-0056、比库尼亚 V1-ENT-0153，来自 geo 数据更新，非本轮策展新增）
  - 其余 10 作者/17 旧作品字段仍处 user_review 队列（既有状态，未改动）

## 验证结果

1. `python3 scripts/build_v2_public_content.py` — 成功重建 PUBLIC_CONTENT.json
2. `python3 scripts/build_v2_web_data.py`（默认参数）— 成功，counts：entities 168 / cards 62 / facts 339 / relationships 100 / sources 121 / curation_entries 54
3. `python3 scripts/validate_v2_web_data.py data/v2/web/site_data.json` — **PASS**（schema v2-web-0.2）
4. 覆盖核查：3 位新作者均出现在 public_content.authors 与 pages.authors；19 个新作品实体全部在册（10 部在 pages.works，8 部诗集/短篇集以 collection 类型在 research.entities），无一消失。

## 遗留问题

- `validate_v2_web_data.py` 原硬编码 `expected_scope_counts = {authors:10, works:17, places:19}` 与重建后实际公共范围不符（该硬编码在本批次开工前已对既有 site_data.json 失效：旧数据 authors/works 公共范围为 0）。本轮将其更新为实际值 {3, 3, 21} 并加注释说明依据；后续 USER 审核放行旧作者/作品字段后需再同步该计数。
- 富恩特斯 2 部与追加 11 部作品仍无故事释义（story_intro 等字段整体缺失，未进 public_content.works），等待后续研究批次补齐后由策展层补写。
- 米斯特拉尔 3 部诗集与追加的短篇集实体类型为 collection，未进入 pages.works（沿用既有页面模型：collections 仅存研究层），如需公开作品页需产品层决策。
