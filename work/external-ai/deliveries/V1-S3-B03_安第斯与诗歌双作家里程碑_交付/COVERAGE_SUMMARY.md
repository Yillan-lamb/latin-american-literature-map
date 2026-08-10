# COVERAGE_SUMMARY：V1-S3-B03 覆盖汇总（机械统计，R1）

- 数据源：本包七张主体 CSV；全部数字由脚本从最终 CSV 重算（2026-08-10，R1 修订后重算）。
- R1 说明：按 `V1-S3-B03_PM_REVIEW.md` §3 落实——SRC-0002 卷期/题名修正（Vol. 2 Núm. 3 (2014)、发布日期 2015-01-14、完整题名含 (1967) de García Márquez）；SRC-0008 降为 C/other（官方栏目 Reseña）；FCT-0037 拆分并新增 FCT-0059（SRC-0010 单源）；FCT-0056 清理未核验同一性。

## 1. 来源

- 来源候选：12 个（A×7、B×4、C×1）；每作家 6 个；A/B 级 11 个（R1 后等级分布为 A×7、B×4、C×1）。
- 访问状态：ok×12；语言 es×8、en×3、fr×1；唯一机构 10 个。
- 来源身份：同行评审论文 7、机构网页 4（NobelPrize.org×3、CVC）、书评 1（Anales U. Chile，Reseña 栏目，C 级）。

## 2. 六部作品覆盖

| 作品 | 覆盖来源数 | A/B 数 | 主来源 |
|---|---|---|---|
| 《城市与狗》（La ciudad y los perros） | 1 | 1 | B03-SRC-0001 |
| 《酒吧长谈》（Conversación en La Catedral） | 1 | 1 | B03-SRC-0002 |
| 《世界末日之战》（La guerra del fin del mundo） | 1 | 1 | B03-SRC-0003 |
| 《二十首情诗和一支绝望的歌》（Veinte poemas de amor y una canción desesperada） | 3 | 3 | B03-SRC-0006 |
| 《大地上的居所》（Residencia en la tierra） | 1 | 1 | B03-SRC-0007 |
| 《漫歌》（Canto general） | 4 | 3 | B03-SRC-0009 |

六部固定作品全部覆盖，不重不漏；每部作品至少 1 个 A/B 级来源。《漫歌》A/B 数由 4 改为 3（B03-SRC-0008 降为 C 级书评，不计入；REVIEW §3.2）。

## 3. 实体/事实/关系

- 实体候选：31 条；类型分布：author×2、work×4、collection×3、place×7、movement×3、theme×6、event×2、character×1、person×2、institution×1
- 原子事实候选：59 条（high×53、medium×6；dispute 全部 none；R1 新增 FCT-0059 由 B03-SRC-0010 单源支持）
- 关系候选：24 行 / 23 组；类型分布：CREATED×7、SET_IN×1、ASSOCIATED_WITH_PLACE×7、ASSOCIATED_WITH_MOVEMENT×3、EXPLORES_THEME×6（其中 2 行共享 RG-B03-0023 双源组）
- 关系状态：eligible_for_staging_review×16、hold_needs_second_source×7（7 个 hold 恰为 ASSOCIATED_WITH_MOVEMENT×3 + 单源 EXPLORES_THEME×4，未混入 eligible；RG-B03-0023《漫歌》大陆命运/美洲史诗为本批唯一双来源解释性关系）

## 4. 查重

- `DUPLICATE_CANDIDATES.csv` 共 10 条：与既有 S1 候选 exact 7 条（略萨、聂鲁达、智利、秘鲁、文学爆炸、现代主义、先锋派）；type_conflict 3 条（三部诗集：S1 旧词表标 Work，Schema 0.2 下为 collection，不得按 work 直接合并）。
- 与 staging v1_s2_pilot、B01、B02 候选：无新增同名命中。
- 所有 `existing_id` 均为完整真实 ID（分号分隔），经与 S1-003 候选表机械核对存在；exact 行类型一致，type_conflict 行保持冲突状态。
- 未删除任何候选；合并判定全部留给 Codex。

## 5. 已知缺口

1. 《城市与狗》首发年 1963、《大地上的居所》分卷构成与各卷出版年、卡努杜斯战争年份（1896-1897）：本批来源未直接显示，未建对应事实（ISSUES I-001，并入阶段 4 补核包）。
2. 单篇诗《马丘比丘高地》与《漫歌》的收录关系无权威目录直接支持，CONTAINS_WORK 未建（ISSUES I-003）。
3. “政治与社会承诺”（CVC“poesía comprometida”）作为作者层研究事实保留，未建作品级主题关系（ISSUES I-005）。
4. 秘鲁本地机构（Casa de la Literatura Peruana、Academia Peruana de la Lengua）连接超时，BNP 站内搜索不可用——人物与获奖事实由诺贝尔官网承担（ISSUES I-004 替代方案已接受）。
5. 无 EDITION_OF/TRANSLATION_OF/INFLUENCED_BY/RESPONDS_TO_WORK 候选；“超现实主义”无来源明确判断，未建实体关系。
