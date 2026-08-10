# COVERAGE_SUMMARY：V1-S3-B02 覆盖汇总（机械统计，R1）

- 数据源：本包七张主体 CSV；全部数字由脚本从最终 CSV 重算（2026-08-10，R1 修订后重算）。
- R1 说明：按 `V1-S3-B02_PM_REVIEW.md` 删除 15 条无直接来源的基础事实（生卒年×6、首发年×7、科塔萨尔国籍、马孔多场景）与 SET_IN 关系 1 组；修正 FCT-0014/0025/0049；新增 FCT-0083；查重 ID 全部展开。

## 1. 来源

- 来源候选：15 个（A×10、B×2、D×3）；每作家 5 个；A/B 级 12 个。
- 访问状态：ok×15；语言 es×13、en×1、pt×1；唯一机构 13 个。
- 来源身份：论文 10（均为同行评审期刊落地页）、机构网页 2（CVC、NobelPrize.org）、索引 3（Dialnet，D 级，仅发现线索）。R1：B02-SRC-0006 作者按 UNLP 官方页面统一为 Jérôme Dulou。

## 2. 九部作品覆盖

| 作品 | 覆盖来源数 | A/B 数 | 主来源 |
|---|---|---|---|
| 《百年孤独》（Cien años de soledad） | 3 | 3 | B02-SRC-0001 |
| 《没有人给他写信的上校》（El coronel no tiene quien le escriba） | 1 | 1 | B02-SRC-0002 |
| 《一桩事先张扬的凶杀案》（Crónica de una muerte anunciada） | 1 | 1 | B02-SRC-0003 |
| 《跳房子》（Rayuela） | 1 | 1 | B02-SRC-0007 |
| 《动物寓言集》（Bestiario） | 1 | 1 | B02-SRC-0006 |
| 《游戏的终结》（Final del juego） | 2 | 2 | B02-SRC-0009 |
| 《人间王国》（El reino de este mundo） | 3 | 1 | B02-SRC-0011 |
| 《消逝的足迹》（Los pasos perdidos） | 1 | 1 | B02-SRC-0012 |
| 《光明世纪》（El siglo de las luces） | 1 | 1 | B02-SRC-0013 |

九部固定作品全部覆盖，不重不漏；每部作品至少 1 个 A/B 级来源（A 级论文专论）。

## 3. 实体/事实/关系

- 实体候选：43 条；类型分布：author×3、work×9、collection×2、adaptation×2、person×2、character×5、place×5、movement×3、theme×10、event×1、institution×1（R1 落实 REVIEW I-003：实体名规范为“美洲神奇现实”“上校（《没有人给他写信的上校》人物）”“圣地亚哥·纳萨尔”）
- 原子事实候选：68 条（high×64、medium×4；dispute 全部 none；D 级来源未支撑任何事实）
- 关系候选：34 行 / 34 组；类型分布：CREATED×11、ADAPTED_FROM×2、DIRECTED×2、ASSOCIATED_WITH_PLACE×4、ASSOCIATED_WITH_MOVEMENT×3、EXPLORES_THEME×12（R1：SET_IN×1 因无直接来源成对删除）
- 关系状态：eligible_for_staging_review×19、hold_needs_second_source×15（15 个 hold 恰为 ASSOCIATED_WITH_MOVEMENT×3 + EXPLORES_THEME×12，全部为单来源解释性关系，未混入 eligible）

## 4. 查重

- `DUPLICATE_CANDIDATES.csv` 共 13 条：与既有 S1 候选 exact 12 条（三位作家、五部作品、哥伦比亚/阿根廷/古巴/马孔多、魔幻现实主义）；type_conflict 1 条（美洲神奇现实与“魔幻现实主义”概念不同，不得合并，任务卡 §5.3、REVIEW I-003）。
- R1：13 行 `existing_id` 全部展开为完整真实 ID（分号分隔，无“等”），经与 S1-003 候选表机械核对全部存在且类型一致。
- 与 staging v1_s2_pilot、B01 候选：无新增同名命中。
- 未删除任何候选；合并判定全部留给 Codex。

## 5. 已知缺口

1. 基础事实缺口（REVIEW I-001）：三位作家生卒年（1927-2014/1914-1984/1904-1980）、七部作品首发年（1967/1961/1963/1951/1956/1949/1953）、科塔萨尔国籍、马孔多与《百年孤独》场景关系——本批未取得直接来源，R1 已从事实表与关系表删除；ISSUES I-001 保留缺口，待阶段 4 或定向合法补证。
2. “拉丁美洲文学爆炸”运动归属无来源明确判断，未建实体与关系（任务卡 §5.2、REVIEW I-005）。
3. 《动物寓言集》《游戏的终结》篇目明细未逐篇建实体（来源未列明全部篇目；FCT-0049 已降为题名支持的最低表述）。
4. 古巴本地机构（Fundación Alejo Carpentier、Casa de las Américas、BNJM）网络不可达，卡彭铁尔 B 级机构页缺口由 3 个 A 级论文 + D 级索引补足（REVIEW I-004 已接受替代方案）。
5. 无 EDITION_OF/TRANSLATION_OF 候选（本批来源未提供具体版次书目信息）；无 INFLUENCED_BY 候选（无来源直接论断）。
