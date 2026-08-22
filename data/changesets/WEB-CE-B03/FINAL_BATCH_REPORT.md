# WEB-CE-B03 Batch Report

## Batch gate

- Task ID: WEB-CE-B03
- 执行模式：Luna Max；独立串行闭环
- Git 基线：fd325ea（已完成并独立固化的 WEB-CE-B02）
- Reviewer：fresh-context 初判 REVISE；按 review/REMEDIATION.md 完成最小整改，follow-up verdict PASS
- 最终门禁：BATCH_PASS
- Git：本报告与 QA 记录将在本批独立 commit；未执行 push、PR、发布、部署或 tag

## 实际数据增量

以下数字由 B02 commit 的数据库与当前 data/master/V1_MASTER.sqlite 机器提取：

| 项目 | B03 新增 | B03 完成后总量 |
|---|---:|---:|
| entities | 14（3 authors、9 works、1 country place、1 fictional place） | 195 |
| facts | 41 | 434 |
| relationships | 12（9 CREATED、3 ASSOCIATED_WITH_PLACE） | 125 |
| sources | 12（11 原计划来源 + SRC-0152） | 150 |
| content cards | 12 | 87 |
| card_sources | 24 | 158 |
| relation_holds | 1（V1-HOLD-0051） | 51 |
| relation_hold_evidence | 1 | 44 |
| Geo place nodes | 2 | 29 places |
| Geo accepted place relations | 3（作者—国家） | 36 |
| Curation target entries | 14（3 authors、9 works、2 places） | 54 entries |

关系线索 V1-REL-0127 未计入正式 relationships：其证据只支持 Santa María 文学空间的建立，不足以关闭 SET_IN 语义门槛，已转为 HOLD。

## 执行范围与研究边界

完成路线图中的三位新作家及九部代表作：Juan Carlos Onetti（乌拉圭）、José Donoso（智利）、Ernesto Sábato（阿根廷）。原文题名始终保留，中文名作为读者展示候选；译者、出版社、译本年份和 ISBN 未作为本批门槛。只写入可由已打开的 Cervantes、Memoria Chilena、阿根廷国家图书馆、CONICET 和 GeoNames 页面直接支持的原子事实。

本批没有建立影响、文学运动、强主题或跨作家关系。Sabato 的 Sobre héroes y tumbas 存在 Cervantes 页面标为 1962、而阿根廷国家图书馆/CONICET 支持 1961 的来源差异；正式事实保留 1961，并在审计材料中记录差异。

## Reviewer 返修及整合

1. 删除 accepted La vida breve → Santa María SET_IN，转为 V1-HOLD-0051；补充 SRC-0152 作为 Santa María 平行/虚构文学空间的明确来源。Geo 不暴露该 HOLD 关系。
2. 将 Los adioses 的体裁从短篇小说改为中篇小说 / novela corta。
3. 将原文姓名规范化为 Ernesto Sábato，并在 normalization_basis 中保留无重音搜索变体。
4. 将职业事实收敛为“作家、画家；受过物理学训练并曾任教”。
5. 补写 Santa María Geo 分类来源，保持 fictional_place / fictional / hidden，纬度和经度为空。

## 产品影响

- 3 位新作者、9 部新作品、乌拉圭国家节点进入 Search、作者页、作品页、国家页、Research Evidence 和时间线。
- Santa María 作为隐藏虚构文学空间保留文字层入口，不生成现实坐标。
- 前端只扩展浏览器 QA 的 B03 代表路由样本；没有新增单个作者特例或硬编码研究事实。

## HOLD / research_gap

- V1-HOLD-0051：La vida breve 与 Santa María 的 SET_IN 关系，等待直接场景证据。
- 九部作品中文版本学字段（译者、出版社、ISBN、中文出版年）继续不构成本批 HOLD。
- 主题、文学地位、影响与文学运动判断继续留待后续来源/策展审阅。
- 既有 13 个 research gaps 未因本批减少。

## 结论

B03 migration 副本与主库通过完整性、外键、来源引用、Geo 边界、Web Data、公共边界和 Chromium desktop/mobile QA。B03 达到 BATCH_PASS，允许进入 B04 的全新 Preflight；Sol 仍应在五批交接时独立复核本批的来源、书目年份差异和 HOLD 关系。
