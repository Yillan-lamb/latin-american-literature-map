# COVERAGE_SUMMARY：V1-S3-B01 覆盖汇总（机械统计）

- 数据源：本包八张 CSV；全部数字由脚本从最终 CSV 重算（2026-08-10）。

## 1. 来源

- 来源候选：15 个（A×4、B×11）；每作家 5 个，全部为 A/B 级。
- 访问状态：ok×15。

## 2. 九部作品覆盖

| 作品 | 覆盖来源数 | A/B 数 | 主来源 |
|---|---|---|---|
| 《未来的回忆》（Los recuerdos del porvenir） | 4 | 4 | B01-SRC-0002 |
| 《彩色的一周》（La semana de colores） | 2 | 2 | B01-SRC-0001 |
| 《关于玛丽安娜的证词》（Testimonios sobre Mariana） | 1 | 1 | B01-SRC-0001 |
| 《巴伦坎南》（Balún Canán） | 3 | 3 | B01-SRC-0008 |
| 《黑暗的职守》（Oficio de tinieblas） | 2 | 2 | B01-SRC-0006 |
| 《诗歌不是你》（Poesía no eres tú） | 2 | 2 | B01-SRC-0006 |
| 《佩德罗·巴拉莫》（Pedro Páramo） | 3 | 3 | B01-SRC-0012 |
| 《燃烧的原野》（El Llano en llamas） | 2 | 2 | B01-SRC-0011 |
| 《金鸡》（El gallo de oro） | 2 | 2 | B01-SRC-0011 |

## 3. 实体/事实/关系

- 实体候选：44 条；类型分布 {'author': 4, 'work': 10, 'collection': 3, 'edition': 2, 'character': 4, 'place': 7, 'person': 1, 'institution': 4, 'movement': 1, 'event': 2, 'theme': 6}
- 原子事实候选：81 条
- 关系候选：31 行 / 31 组；类型分布 {'CREATED': 11, 'CONTAINS_WORK': 1, 'ADAPTED_FROM': 1, 'DIRECTED': 1, 'EDITION_OF': 2, 'SET_IN': 3, 'ASSOCIATED_WITH_PLACE': 5, 'ASSOCIATED_WITH_MOVEMENT': 1, 'EXPLORES_THEME': 6}
- 关系状态：eligible_for_staging_review ×24、hold_needs_second_source ×7（均为单来源解释性关系）

## 4. 查重

- `DUPLICATE_CANDIDATES.csv` 共 9 条：批内同名分层 2 条（《佩德罗·巴拉莫》work/character，不合并）；与既有 S1 候选 exact 6 条（胡安·鲁尔福、佩德罗·巴拉莫×2、墨西哥、奥克塔维奥·帕斯、墨西哥革命小说）；与 staging v1_s2_pilot exact 1 条（主题"记忆与遗忘"→STG-ENT-0014，需 Codex 合并判定）。
- 未删除任何候选；合并判定全部留给 Codex。

## 5. 已知缺口

1. 《关于玛丽安娜的证词》《黑暗的职守》《金鸡》《诗歌不是你》以 ELEM 词条/作品页（B 级书目）为主，专论研究来源待后续批次补证。
2. 《燃烧的原野》篇目明细与《金鸡》体裁表述来源未提供，未建对应事实。
3. indigenismo/魔幻现实主义等运动归属无来源直接支持，未建运动候选（仅建墨西哥革命小说，单来源标 needs_second_source）。
4. 电影《未来的回忆》(1968) 为唯一改编端点；《佩德罗·巴拉莫》等其余作品的改编信息待补。
