# V1-S2-001-002-A 项目经理验收记录

- task_id: `V1-S2-001-002-A`
- assignment_id: `V1-S2-001-002-A-PILOT-SOURCE-DISCOVERY`
- reviewer: `CODEX-PM`
- reviewed_at: `2026-08-04`
- verdict: `revise`

## 结论

目录安全、CSV 结构、候选数量和总体葡语覆盖已经达标，但存在一条非法枚举值、两处可复核的书目/机构错误，以及 SUMMARY、HANDOFF、QA 与实际 CSV 之间的多组计数矛盾。任务可以精确返修，不需要重做全部检索，也不应增加候选数量。

## 已通过范围

- 交付目录恰为 9 个文件，无子目录、PDF、EPUB、全文、`inputs/`、Cookie、密钥或 `.DS_Store`。
- `PILOT_SOURCE_CANDIDATES.csv` 标准解析为 21 行、20 列，21 个 `candidate_id` 全部唯一；带逗号的作者字段可正常解析。
- 博尔赫斯 11 条、李斯佩克朵 10 条；按候选表实际值，李斯佩克朵葡语来源为 9 条，明显达到至少 5 条要求。
- 候选表等级枚举仅为 A/B/C；按当前标注为博尔赫斯 A2/B6/C3、李斯佩克朵 A4/B6。最终等级仍由 Codex 核定。
- `ACCESS_PLAN.csv` 21 个 ID 与候选表一一对应，无未登记或缺失 ID；桶值和优先级枚举本身合法。
- 两位作家均有至少 3 部命名作品可回指候选行。
- 抽核确认 IMS、USP、Rocco、UESB、Borges Center、JSTOR 和阿根廷国家图书馆等真实来源可用于后续书目核验；未发现盗版来源或下载产物。

## 必须修复

1. `PILOT_SOURCE_CANDIDATES.csv:5`（DISC-BOR-004）：`access_status=open_access（部分）` 不在任务卡允许枚举内，且 QA 错误声称全部合法。改为合法值；如果仍将该候选计为 A，必须把“Variaciones Borges 期刊”和“Borges Studies Online about 页面”的对象、URL、开放范围分开说明，或替换为一条实际期刊文章/期号记录。不得用期刊介绍页冒充可直接访问的同行评审文章。
2. `PILOT_SOURCE_CANDIDATES.csv:6`（DISC-BOR-005）：国家图书馆官方目录显示博尔赫斯专刊为 `La Biblioteca` 第 13 期 `Cuestión Borges`，不是 9–10 期；9–10 期是其他主题。将题名、原题名、期号、出版年、ISSN/目录号、URL、page_title、covered_works 和 verification_notes 按官方第 13 期页面重核。优先使用官方落地页：`https://www.bn.gov.ar/micrositios/revistas/biblioteca/la-biblioteca-no-13-cuestion-borges`。
3. `PILOT_SOURCE_CANDIDATES.csv:16`（DISC-LIS-005）：该文正式书目信息为 Cristina Marcos，`Revista do Departamento de Psicologia, UFF` 19(1), 215–226 (2007)，DOI `10.1590/S0104-80232007000100016`；当前 `publisher_or_institution` 写为 PUC-Minas 不正确。按 DOI/期刊页修正机构、标识符、URL 和 verification_notes；作者个人任职机构不得替代期刊出版机构。
4. `PILOT_SOURCE_CANDIDATES.csv:17`（DISC-LIS-006）：候选描述的是具体图书 `Clarice Lispector entrevista`，当前 URL 却是旧作者页。改用 Rocco 官方产品页 `https://rocco.com.br/produto/clarice-lispector-entrevista/`，并重核页面标题、出版日期和 ISBN；不要把作者聚合页当作单书书目页。
5. `PILOT_SOURCE_CANDIDATES.csv:20-21`（DISC-LIS-009/010）：CAPES 聚合页可以保留为交叉记录，但主要 URL 应优先使用原期刊落地页。至少为 LIS-009 补官方 UNESP 文章页，为 LIS-010 使用 `https://periodicos2.uesb.br/folio/article/view/7437` 或 DOI 落地页，并同步 page_title/verification_notes。
6. `PILOT_SOURCE_SUMMARY.md:12-57`：按最终 CSV 机械重算并统一所有数字。当前错误包括：标题范围漏写 BOR-011；博尔赫斯 B 级表格写 5、实际 6；李斯佩克朵葡语写 8、实际 9；巴西机构写 5/6 两套口径；访问桶摘要与 `ACCESS_PLAN.csv` 实际 16/4/1 不一致；博尔赫斯与李斯佩克朵的 open_access/目录/预约分项亦未覆盖全部 21 行。机构数量必须说明“唯一机构”统计口径，或删除非必要计数。
7. `ACCESS_PLAN.csv:5,22`：根据 BOR-004 和 BOR-011 的真实访问边界重新确定桶。只有预览、印刷订阅或机构订阅才能取得全文的候选，不应默认写成完整 `legal_open_access`；必须在 `required_user_action` 和 `next_codex_decision` 中保持一致。
8. 同步更新 `README.md`、`STATUS.md`、`QA_REPORT.md`、`ISSUES.md`、`HANDOFF.md`、`MANIFEST.md`：删除“8 项全部通过”“无已知错误”等已被复检推翻的结论，记录 R0 问题和 R1 自检结果。所有计数只能从最终 CSV 重新计算，不能手工沿用旧数字。

## 保持不变

- 任务仍为来源发现和书目核验，不下载全文、不做 OCR、不做文学解释、不抽取实体/关系、不分配 `SRC-`。
- 候选总量保持 21 条；除为修复 BOR-004 的 A 级有效性而替换候选外，不新增候选凑数。
- `candidate_id` 保持 21 个且不改编号；两位作家的目标范围不变。
- 李斯佩克朵葡语来源不少于 5 条；两位作家各至少 3 部命名作品。
- 已确认正确的 IMS、USP、FCRB、Britannica 等条目不做无关改写。

## 禁止新增

- 不访问或推荐 Z-Library、网盘、盗版站；不下载 PDF、EPUB 或书籍全文。
- 不绕过登录、付费墙、DRM 或机构访问控制。
- 不修改 `PROJECT_CHARTER.md`、`TASKS.md`、`SOURCE_REGISTRY.csv`、既有任务包、决策记录、CHANGELOG 或 GitHub。
- 不执行正式来源选择、正式等级核定、购买、预约、OCR 或数据库写入。

## R1 重新验证

1. 标准解析两张 CSV；确认 21×20、21×7、ID 唯一且一一对应，所有枚举值合法。
2. 逐项重算作家、语言、等级、访问状态、访问桶和唯一机构数量，并与 SUMMARY/HANDOFF/QA/MANIFEST 完全一致。
3. 实际打开并核对 BOR-004、BOR-005、LIS-005、LIS-006、LIS-009、LIS-010 的最终 URL、页面标题、机构、日期、标识符和访问边界。
4. 确认博尔赫斯至少有 2 条真正符合 A 级定义的候选；若 BOR-004 不满足，则在原 21 条范围内替换，不新增第 22 条。
5. 每位作家再抽 5 条 URL，确认不是搜索摘要、错误落地页或机构错配。
6. 重查交付目录安全边界和 9 文件 MANIFEST；确认未修改任何输入或治理文件。

## 遗留决策状态

在 R1 通过前，Codex 暂不选定约 6 部试点作品，不核定正式来源等级，也不建议用户购买、订阅或预约档案。
