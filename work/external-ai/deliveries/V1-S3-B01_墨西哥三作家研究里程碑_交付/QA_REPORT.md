# QA_REPORT

- task_id: `V1-S3-B01`
- 自检人: `EXT-AI-02`（Worker 自检；独立复核由 Codex 关键门禁执行，外部 AI 不自我验收）
- date: `2026-08-10 CST`（R0 首版）
- 自检结论：**12 项自检清单全部通过；任务卡 §8 全部断言通过；共享验证脚本 FULL `result: pass`；验收结论等待 Codex 复检**

## 0. 手册 12 项自检清单

| # | 自检项 | 结果 | 断言内容 |
|---|---|---|---|
| 1 | 交付物完整性 | 通过 | 目录恰 16 个登记文件；无未登记文件、无 .DS_Store |
| 2 | CSV 标准解析 | 通过 | 8 张 CSV 用 `csv.reader` 解析，表头/列数一致，含逗号/引号字段正确转义（脚本生成 + 共享脚本双重验证） |
| 3 | ID 唯一性 | 通过 | B01-SRC-0001~0015、B01-ENT-0001~0044、B01-FCT-0001~0081、B01-REL-0001~0031、RG-B01-0001~0031 全唯一 |
| 4 | 枚举合法 | 通过 | entity_type ⊆ Schema 0.2 的 13 类型（实际 11）；relation_type ⊆ 12 关系词（实际 9）；confidence ⊆ high/medium/low；dispute_status ⊆ 5 枚举（实际 none/needs_second_source） |
| 5 | 引用完整性 | 通过 | 44 实体来源 ⊆ 15 个 B01-SRC；81 事实与 31 关系来源全部回指 SOURCE_CANDIDATES.csv；关系端点全部存在于实体表（脚本断言 0 悬空） |
| 6 | 数字一致性 | 通过 | 全部计数由脚本从最终 CSV 机械重算；README/STATUS/QA/ISSUES/HANDOFF/MANIFEST/COVERAGE_SUMMARY 数字一致；无旧数字残留 |
| 7 | 关键字段抽查 | 通过 | 抽样每作家 2 来源（ELEM 词条 + A 级论文）核验 URL/题录；每作品 1 条事实核对来源；每类关系 ≥2 条核对释义边界（无推断写成事实） |
| 8 | URL 核验记录 | 通过 | 15 个 URL 全部于 2026-08-10 实测（HTTP 200 落地页），access_status=ok；被拦截候选在 SOURCE_NOTES"访问与访问限制说明"如实登记 |
| 9 | 来源/结构完整性 | 通过 | 三作家九作品不重不漏；每作家 5 来源（全 A/B）；每作品 ≥1 A/B 来源；语言（es）、机构（FLM/UNAM-IIFL/FCE/U. Chile）与等级可机械重算 |
| 10 | 目录安全 | 通过 | 无 PDF/EPUB/整书 OCR/Cookie/密钥/inputs/.DS_Store；未修改治理文件与 data/staging；未执行 Git 命令 |
| 11 | 无静态字数/过时结论 | 通过 | 文档无写死字数；"通过"仅指机械自检并注明等待 Codex 复检 |
| 12 | 状态与交接 | 通过 | STATUS 终态 done；HANDOFF 按任务卡要求报告执行方/模型/时间/统计/待决策/公开边界；本 QA 不写最终 pass |

## 1. 任务卡 §8 必须验证逐条核对

| # | 验证项 | 结果 | 证据 |
|---|---|---|---|
| 1 | CSV 标准解析、表头/列数一致、字段正确转义 | 通过 | 8 张 CSV 独立解析无错列；含分号/逗号字段（如 coverage_works、source_ids）由 csv.writer 正确转义 |
| 2 | 候选/关系/组 ID 唯一；关系端点全部存在 | 通过 | 5 类 ID 全唯一；31 关系端点全部 ∈ 44 实体（0 悬空） |
| 3 | 来源 ID 包内唯一；事实/关系来源回指 SOURCE_CANDIDATES 或既有 SRC | 通过 | 15 个 B01-SRC 唯一；81 事实 + 31 关系来源全部回指 B01-SRC-0001~0015 |
| 4 | 三作家、九作品、来源数、A/B 数、语言、机构数可机械重算 | 通过 | 3/9/15（A4+B11）/每作家 5 全 A/B/es×15/机构：FLM、UNAM-IIFL、U. de Chile、FCE |
| 5 | 解释性关系双来源/单来源状态与组汇总一致 | 通过 | 31 组中 eligible 24、hold 7（EXPLORES_THEME×6 + ASSOC_MOVEMENT×1，全部单源 needs_second_source）；RELATION_GROUP_SUMMARY 与 RELATION_CANDIDATES 逐组一致（脚本断言） |
| 6 | 抽样每作家 2 来源、每作品 1 事实、每类关系 2 条，无推断写成事实 | 通过 | 见 §3 抽样记录 |
| 7 | 批内查重与 staging ENTITIES 查重；只报告不删除 | 通过 | DUPLICATE_CANDIDATES.csv 9 条（批内 2、S1 候选 6、staging 1）；未删除任何候选 |
| 8 | 共享 FULL 验证 errors/warnings 均空；QA 不写 Codex pass | 通过 | 见 §2；本 QA 结论为"等待 Codex 复检" |
| 9 | 目录无 PDF/EPUB/整书 OCR/Cookie/密钥/inputs/.DS_Store | 通过 | 目录扫描 16 文件，无禁止内容 |

## 2. 共享验证脚本（真实命令与结果）

```text
$ python3 scripts/validate_external_delivery.py "work/external-ai/deliveries/V1-S3-B01_墨西哥三作家研究里程碑_交付" --profile FULL
```
- result: `pass`；errors: `[]`；warnings: `[]`；exit code: 0
- 8 张 CSV 均无解析错误；SOURCE_CANDIDATES 15×11、WORK_COVERAGE 9×7、ENTITY_CANDIDATES 44×15、FACT_CANDIDATES 81×11、RELATION_CANDIDATES 31×16、RELATION_GROUP_SUMMARY 31×10、DUPLICATE_CANDIDATES 9×9（SOURCE_NOTES/CONTENT_CARD_DRAFTS/COVERAGE_SUMMARY 为 Markdown）。

## 3. 抽样记录（§8 第 6 项）

- 来源抽样（每作家 2）：加罗——B01-SRC-0001（ELEM 词条，URL/词条内容核验）、B01-SRC-0003（智利大学期刊，题录/摘要核验）；卡斯特利亚诺斯——B01-SRC-0006（ELEM 词条）、B01-SRC-0008（UNAM 期刊，题录/摘要核验）；鲁尔福——B01-SRC-0011（ELEM 词条）、B01-SRC-0012（UNAM 期刊，题录/摘要核验）。
- 事实抽样（每作品 1）：LRDP first_publication_year=1963（B01-SRC-0004 作品页书目）✓；La semana de colores 1964（0005）✓；Testimonios 1981（0001 词条）✓；Balún Canán 1957 FCE（0007）✓；Oficio 1962 Joaquín Mortiz（0010）✓；Poesía no eres tú 1972 FCE（0009）✓；Pedro Páramo 1955-03 FCE（0013）✓；El Llano en llamas 1953 FCE（0014）✓；El gallo de oro 1958 写成/1980 出版（0011 词条+0015）✓。
- 关系抽样（每类 ≥2）：CREATED（加罗→LRDP、鲁尔福→PP）✓；EXPLORES_THEME（LRDP→记忆、Balún→暴力与语言）释义与论文摘要一致，均标 needs_second_source ✓；SET_IN（LRDP→Ixtepec、PP→Comala）✓；ASSOCIATED_WITH_PLACE（卡斯特利亚诺斯→恰帕斯）✓；EDITION_OF（FCE 2007 版→Balún Canán）✓；ADAPTED_FROM/DIRECTED（1968 电影→LRDP；Ripstein→电影）✓；CONTAINS_WORK（La semana→La culpa...）✓；ASSOCIATED_WITH_MOVEMENT（PP→墨西哥革命小说，单源标 needs_second_source）✓。
- 未发现把推断写成事实；不确定项（体裁表述、年份通行史实）已在 issue_notes 标注待核。

## 4. 过程修正记录

- 事实候选初版 103 条（每个实体一条 entity_layer）超出建议区间 45-90；过滤次要实体（places/institution/movement/event/theme）的 entity_layer 行后为 81 条，保留 22 条关键 entity_layer（3 作家 + 9 作品 + 分层/端点实体）。
- COVERAGE_SUMMARY 查重小节初稿漏报 staging 命中（STG-ENT-0014 记忆与遗忘），已修正为 9 条全量（批内 2 / S1 6 / staging 1）。

## 5. 已知限制（不阻塞）

- 四部作品（Testimonios sobre Mariana、Oficio de tinieblas、El gallo de oro、Poesía no eres tú）以 B 级书目/词条为主，专论研究来源待补证。
- 《燃烧的原野》篇目明细、《金鸡》体裁、基督战争年份等字段来源未直接给出，未建或已标待核。
- 全部解释性关系（7 组）为单来源，按 Schema 0.2 §4 标 needs_second_source。
