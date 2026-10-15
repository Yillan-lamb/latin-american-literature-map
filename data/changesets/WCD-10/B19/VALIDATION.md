# WCD-10-B19 验证记录

## 实际主库

- `0054_wcd10_b19_author_works.sql` 在授权 WT 主库仅执行一次，exit 0；数据库从冻结SHA-256 `8e2c26422a219990c8e397005ebd4e2c8499181f657b63f53cdb70af3e99d016` 更新至`264385afd29d43f6d160d852a9dc6ad685fa2bd5fa25e3e7d7575168ebb72032`。
- SQLite integrity check为`ok`，foreign-key errors为0，Research Schema为0.4。主库现有777 entities、2610 facts、749 relationships、781 sources、793 content cards、656 gaps；迁移日志共54条。
- 本批新增13 entities、42 facts、13 CREATED relationships、13个新来源、16张Research卡和23个研究缺口；另有6条既有来源复用。22条coverage主作品记录与9个既有作品闭包通过实际数据审查。

## 必要QA

已完整读取ROOT `run_required_qa.py`并在成功apply后以零参数运行一次。外层结果为`ALL_REQUIRED_STEPS_PASS`；16个QA步骤全部exit 0且符合预期。

- 独立重放54条迁移，19张表一致，完整性检查通过且外键错误为0。
- JSON、CSV、XLSX导出各覆盖19张表；主导出及重复导出各22个文件，逐字节一致。
- 既有177个公共文件逐字节一致；B19新增公开对象为0，仍为127个公开对象和139条路由。
- `manifest.json`与`site_data.json`通过校验后复制至开发Web数据目录，两个副本均逐字节一致。

QA报告位于本WT的`work/wcd10-qa/B19_CHECKPOINT_QA.json`，SHA-256：`00eb2133dcf99d5adea980c4bbe2a0e932f9aaf7716a431da40e7ed8a75f3902`。母级实际数据独立审查为PASS，410项检查全部通过；报告SHA-256：`a562bf5b5ecb9ff86ab6adf509d8c02d10a25ebad69f8e4ed348c6af9781959e`。

## 版本与范围边界

Research 1.5.0 development candidate、Research Schema 0.4、Web Data 0.3、Web 0.6.0保持不变。本批没有新增公开对象，也没有发版或部署。WCD-10当前完成19/21批、57/61位作者，余2批4位作者；W03版本注记与直接归属回补、B08共同对象归属及TASK-127仍待完成。
