# HANDOFF — Worker D（WEB-CE-B01-R-D，已有作家追加 11 部）

- 交付时间：2026-08-18（PM 收尾指令后落盘）
- 交付目录：`data/changesets/WEB-CE-B01/candidates/D_existing_additions/`

## 1. 对象完成度（11/11）

| 作品 | 实体 | CREATED | 中译核验 |
|---|---|---|---|
| 《沙之书》El libro de arena（博尔赫斯） | CAND-D-ENT-07 | CAND-D-REL-01 | verified_single_volume（上海译文 2015，王永年，9787532762927） |
| 《布罗迪报告》El informe de Brodie（博尔赫斯） | CAND-D-ENT-08 | CAND-D-REL-02 | verified_single_volume（上海译文 2015，王永年，9787532762910） |
| 《霍乱时期的爱情》（马尔克斯） | CAND-D-ENT-01 | CAND-D-REL-03 | verified_single_volume（南海 2022 插画版，杨玲，9787544269087） |
| 《族长的秋天》（马尔克斯） | CAND-D-ENT-02 | CAND-D-REL-04 | verified_single_volume（南海 2021，轩乐，9787544286060） |
| 《秘密武器》Las armas secretas（科塔萨尔） | CAND-D-ENT-09 | CAND-D-REL-05 | verified_collection（收入南海《南方高速》2017，9787544290678） |
| 《绿房子》La casa verde（略萨） | CAND-D-ENT-03 | CAND-D-REL-06 | verified_old_edition（外国文学 1983，孙家孟/马林春，书号 10208-141） |
| 《潘达雷昂上尉与劳军女郎》（略萨） | CAND-D-ENT-04 | CAND-D-REL-07 | verified_single_volume（人民文学 2009/2021，孙家孟，9787020077410/9787020159468） |
| 《一百首爱情十四行诗》（聂鲁达） | CAND-D-ENT-10 | CAND-D-REL-08 | verified_traditional_chinese（九歌 1999，陈黎/张芬龄，9789575606022；简体未核） |
| 《隐秘的幸福》Felicidade clandestina（李斯佩克朵） | CAND-D-ENT-11 | CAND-D-REL-09 | verified_single_volume（人民文学 2018，闵雪飞，9787020128969） |
| 《方法的资源》El recurso del método（卡彭铁尔） | CAND-D-ENT-05 | CAND-D-REL-10 | **not_found**（无中译；通行名《方法的根源》） |
| 《巴洛克协奏曲》Concierto barroco（卡彭铁尔） | CAND-D-ENT-06 | CAND-D-REL-11 | **not_found**（无中译） |

## 2. 文件与行数

| 文件 | 行数（含表头） |
|---|---|
| SOURCE_CANDIDATES.csv | 26 |
| ENTITY_CANDIDATES.csv | 12 |
| FACT_CANDIDATES.csv | 60 |
| RELATION_CANDIDATES.csv | 20 |
| TRANSLATION_AUDIT.csv | 12 |
| CROSS_AUDIT.md | 1 份（全批次交叉查重） |
| SOURCE_NOTES.md | 1 份 |
| ISSUES.md | 1 份 |
| HANDOFF.md | 本文件 |

## 3. 数字摘要

- 作品实体候选：11（work 6 / collection 5）
- CREATED 关系候选：**11**（全部有 BnF 直接书目来源；《秘密武器》主源 **reuse:SRC-0066**）
- 复用 SRC：**SRC-0066**（《秘密武器》书目 + first_publication_year=1959）；其余既有 BnF/CVC/Nobel 来源（SRC-0035/0047/0054/0056/0064/0070/0009 等）**已列为下一轮核验线索，本轮未开页、未claim reuse**。
- 来源候选：25（access_pass 23 / access_blocked 2）
- translation_status 分布：verified_single_volume 6、verified_collection 1、verified_old_edition 1、verified_traditional_chinese 1、pending 0、**not_found 2**（卡彭铁尔两部）
- 关系 hold：8（SET_IN×2 NEEDS_SOURCE、ASSOCIATED_WITH_MOVEMENT×5、EXPLORES_THEME×1，均为 hold_needs_second_source/NEEDS_SOURCE）
- 事实候选：59 行（candidate_for_staging_review 33 / gap 26）

## 4. 关键 hold / 需 PM 决策

1. **卡彭铁尔两部 not_found 占额问题**：无可靠中译本不占额度，替代作品（《时间之战》《追击》《千柱之城》等已出中译）由 PM/plan 层裁决。
2. **《绿房子》first_publication_year=1966 为推断**（BnF 版本史），需第二来源定 high。
3. **《布罗迪报告》1970、《一百首爱情十四行诗》1959 首版年待核**（gap，线索已列）。
4. **《聂鲁达情诗》简体版（9787521750867）未开页**（三民书局 access_blocked），简体中译待下一轮。
5. **《方法的资源/根源》中译名分歧**待 Reviewer 定规范名。
6. 解释型关系（SET_IN 卡塔赫纳/皮乌拉、魔幻现实主义、文学爆炸、新巴洛克、爱情主题）全部 hold，未凑数。
7. **跨批次风险**（详见 CROSS_AUDIT.md）：聂鲁达情诗合卷与 V1-ENT-0119 的交叉包含风险；《南方高速》合卷不另建实体。

## 5. 纪律确认

- 未写 `V1_MASTER.sqlite`（仅只读 sqlite3 查询）；未分配任何正式 ID（仅 CAND-D-*）；作者实体全部引用既有 V1 正式 ID；未改治理文件/site/未做 git；未自审；未研究 packet 外对象；未启动 Batch 02。
- 停止条件满足：11 部全部产出候选或显式 hold/pending/not_found。
