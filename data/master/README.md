# V1 主数据基线

本目录是 V1.0.0 发布快照迁移出的长期主数据基线。

- 基线数据库：`V1_MASTER.sqlite`
- 基线来源：`v1.0.0` 标签的 `data/staging/v1_candidate/V1_CANDIDATE.sqlite`
- 基线 SHA-256：`e82533519dcfe2ae1a1c6d02f60c5d775dd95f49e0506c2cbeb6c649a89fb853`
- Schema：0.3
- 建立日期：2026-08-11

后续正式增量只能通过 `scripts/apply_migration.py` 写入此主库；CSV、JSON、Excel 和网站数据必须由 `scripts/export_from_sqlite.py` 从主库重建。不得在图形化 SQLite 工具、CSV、Excel 或 JSON 中静默修改事实。

`data/staging/v1_candidate/` 保留为 V1.0.0 历史发布快照，不原地覆写。

## 当前开发主库

截至2026-10-15，当前WCD-10已追加迁移`0058_wcd10_collection_type_correction.sql`；共58迁移、19表。数据库为796 entities、2686 facts、770 relationships、795 sources、824 cards、691 gaps，SHA-256：`7ee4188756f4f18683f5e2e979d44d31f63c4682d782007af0e7c3ad7091a8ad`；当前全量导出为`data/exports/wcd10-type-correction/`。0058更正15个既有合集实体及15张卡片的对象类型；全部稳定ID、事实、来源、角色和缺口保全。61作者/21批内容与必要回补经[最终全量审计](../changesets/WCD-10/FINAL_AUDIT/FINAL_AUDIT.md)通过；58迁移19表全重放、三格式19表、22重复导出、研究终审时173项Python测试通过；PR #38 工程补强后，当前完整CI回归为193项。标准公开包127对象/139路由/177文件，Pages开发预览271对象/288路由/327文件；两种模式分别与PR base作固定时间比较，文件字节全同、新增研究公开内容0。详见[部署边界](../../docs/web/DEVELOPMENT_PREVIEW_BOUNDARY.md)。Research1.5.0development、Schema0.4、WebData0.3、Web0.6.0及PublicRelease暂停不变。`metadata.sha256`仍为V1历史表指纹，不是当前库摘要。0057及之前导出/审核包保留不覆写。

B04检查点为418实体／1209事实／386关系／392来源／328卡，SHA `45e8d72c3656f762f4a34f664c822c33685be925b53553b91b19041d6835b47d`；`data/exports/wcd10-b04-checkpoint/`保留不覆写。

B03检查点为409实体／1170事实／376关系／378来源／315卡，SHA `079deee47063d2435bdaafe1b3c1dca24ca8b6c7353acc1427075bf0ce86746d`；`data/exports/wcd10-b03-checkpoint/`保留不覆写。

B02检查点为397实体／1116事实／356关系／357来源／296卡，SHA `83435075f1da42f07bf03b98dd934f182fdcb75f969cf87e48e46359290cd498`；`data/exports/wcd10-b02-checkpoint/`保留不覆写。

B01检查点为387实体／1076事实／345关系／339来源／280卡，SHA `98b914d5421d40b2f20488fe988e52fb165fc02967ec1e7e816f9280ce5071d1`；`data/exports/wcd10-b01-checkpoint/`保留不覆写。

历史WCD-07检查点（2026-09-03）为迁移0001—0035、377实体／1027事实／334关系／314来源／261卡，SHA `a8c54e3c0e04a347f310d7f0f969dfba758f575008fa64c1789e43b26bf378cc`；其`data/exports/v1.5.0-candidate/`和V1.0.0快照均保留不覆写。17个P1 first-wave仍DEFER，不因本次Research扩充提升。
