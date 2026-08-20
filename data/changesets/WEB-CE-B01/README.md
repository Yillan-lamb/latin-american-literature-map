# WEB-CE-B01 Research change set

- 类型：A 新增来源 + B 新增作家 + C 新增作品 + D 补充已有实体事实 + E 新增关系 + H 批量新增（FULL）
- 批次：WEB-CONTENT-EXPANSION Batch 01（帕斯按已有作家处理；新作家富恩特斯、米斯特拉尔；已有作家追加 14 部 = 帕斯 3 + 建议池 11。USER 方案 B 授权）
- 去重：帕斯 `exists`（V1-ENT-0059，reuse）；富恩特斯、米斯特拉尔 `new`；20 部计划作品全部 `new`；聂鲁达情诗合卷/科塔萨尔《南方高速》合卷未另建重复实体。
- 来源：新增 SRC-0087—SRC-0121（36 个 access_pass）；复用 SRC-0066（Las armas secretas 书目）。被拦页面按 fail-closed 留作 ISSUES 线索，未入正式来源表。
- 候选事实/关系：入库事实 V1-FCT-0260—V1-FCT-0339（80）；关系 V1-REL-0077—V1-REL-0100（24：CREATED 18 + ASSOCIATED_WITH_PLACE 6）；hold 关系 V1-RH-0001 起 15 条；卡片 V1-CARD-0041—V1-CARD-0062（22）。
- Reviewer：独立 REVIEW_ABC.md（117 PASS / 2 REVISE / 18 HOLD）与 REVIEW_D.md（76 PASS / 14 REVISE / 9 HOLD / 12 REJECT(SUPERSEDED)）；REVISE-D1/D2 已在集成时修复（等级校准、时间之战改 collection、追击体裁降 gap）；D1 birth_place 字段按 SOP-B §8 落实（value 收敛为地点名）。
- 中译核验：帕斯 3/3 verified（燕山「天下大师·帕斯作品」）；富恩特斯 2/2 verified_old_edition（云南人民 1993 / 外国文学 1983），《奥拉》pending-hold；米斯特拉尔 3/3 verified_collection（漓江《柔情》2019.8 完整收录四集）；建议池 9 verified + 2 替换（《时间之战》人民文学 2021 陈皓 /《追击》人民文学 2025 陈皓，替换理由=计划两部无中译本）。
- 迁移：`data/master/migrations/0003_web_ce_b01_batch01.sql`（applied，sha256=fa61918cad2316a4d10c49be3d3adaf1e1f0bccb43562fb3e0cf54992375833e；task WEB-CE-B01 / reviewer CODEX-REVIEW）；应用前经 FK 强制排练副本验证。
- 导出：`data/exports/v1.1.0/`（从主库重建）。
- Geo：新增地点行 比库尼亚（V1-ENT-0153，real，GeoNames 3868308）；墨西哥城 hidden→eligible（新增帕斯关联）；新增 5 条 PLACE_RELATIONS（V2-GEO-REL-026—030）。虚构空间规则未动。
- 边界：不覆盖 `data/exports/v1.0.0/`、`data/exports/v1.0.1-rc5/`；未修改 PROJECT_CHARTER.md；未创建 Release/部署；B 目录 FACT CSV 存在未加引号逗号，集成时用 review/B_mistral_FACT_CANDIDATES_FIXED.csv 修复（Worker 原文件未改）。
