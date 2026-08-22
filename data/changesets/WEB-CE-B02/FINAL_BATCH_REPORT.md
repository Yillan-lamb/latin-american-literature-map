# WEB-CE-B02 Batch Report

## Batch gate

- Task ID：`WEB-CE-B02`
- 执行模式：Luna Max；独立闭环
- Git 基线：`e804f4e`（B01 Sol 审计分支）
- Reviewer：fresh-context reviewer 初判 `REVISE`；按 `review/REMEDIATION.md` 完成最小返修与复验
- 最终门禁：`BATCH_PASS`
- Git：待本报告与 QA 记录加入本批 commit；未执行 push、PR、发布、部署或 tag

## 实际数据增量

以下数字由当前 `data/master/V1_MASTER.sqlite` 与 `WEB-CE-B02` 来源标记机器提取，非手写计划数：

| 项目 | B02 新增 | B02 完成后总量 |
|---|---:|---:|
| entities | 14（3 authors、9 works/collection、2 country places） | 181 |
| facts | 39 | 393 |
| relationships | 12（9 `CREATED`、3 `ASSOCIATED_WITH_PLACE`） | 113 |
| sources | 10 | 138 |
| content cards | 12 | 75 |
| card_sources | 18 | 134 |
| Geo country nodes | 2 | 27 places |
| Geo place relations | 3 | 33 |
| Curation target entries | 14（3 authors、9 works、2 places） | 54 entries |

B02 没有新增 `relation_holds` 或 `gaps`；主库仍保留 50 个关系 HOLD、13 个 research gaps。网站投影相对基线新增 14 个可检索实体、12 个时间线对象；当前总搜索索引 74、时间线 89。

## 执行范围与研究边界

完成路线图中的三位新作家及九部代表作：Miguel Ángel Asturias（危地马拉）、Isabel Allende（智利）、Jorge Amado（巴西）。原文题名始终保留，中文名作为展示层候选；没有为译者、出版社、译本年份或 ISBN 额外设门槛。没有新增影响、文学运动、强主题或故事空间关系。

## Reviewer 返修及整合

已关闭的最小返修：

1. 用可直接打开的法国国家图书馆书目、危地马拉圣卡洛斯大学人文图书馆、Companhia das Letras 资料替换受阻的来源；删除无直接事实依赖的失效来源，并把 Allende 生平/智利关联改挂官方时间线。
2. 删除无直接证据的 Asturias 具体出生城市事实；收敛 Asturias 书目事实，修正来源名称和复合表述。
3. 将 `Capitães da Areia` 的出版者规范题名与 ABL 的 `Capitães de areia` 变体记录在同一实体上，不拆分作品。
4. 将危地马拉 GeoNames URL 从错误的 Belize ID `3582678` 改为 Guatemala ID `3595528`，同步变更集和 Geo CSV。

## 产品影响

- 新作者、作品和两个国家节点进入 Search、作者页、作品页、国家页、Research Evidence 与时间线的数据投影。
- 现实地图只新增国家级多边形节点；没有把出生地或一般生平地点冒充作品空间，也没有给虚构空间伪造坐标。
- `V2-GEO-BR` 技术父节点继续隐藏并与正式巴西国家节点分离。
- 本批未修改通用前端逻辑；仅将浏览器 QA 的旧硬编码计数/域名断言改为从数据动态推导，修复 `QA_COVERAGE_GAP`。

## HOLD / research_gap

强解释关系、文学运动、影响、强主题和中文版本学字段继续留待后续研究；本批没有把证据不足的线索写成正式关系。既有 HOLD / gap 不因本批而减少。

## 结论

迁移副本与主库均通过完整性、外键、重复和 Web 投影复验。B02 达到 `BATCH_PASS`，允许进入 B03 的全新 Preflight；Sol 仍应在五批交接时重新独立核验来源与题名变体。
