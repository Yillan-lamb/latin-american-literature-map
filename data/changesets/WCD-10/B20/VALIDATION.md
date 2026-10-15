# WCD-10-B20 验证记录

## 实际主库

- `0055_wcd10_b20_author_works.sql` 在授权WT主库仅执行一次，exit 0；数据库从冻结SHA-256 `264385afd29d43f6d160d852a9dc6ad685fa2bd5fa25e3e7d7575168ebb72032`更新至`db16fe4f5faaafcfca3b02b42c52d56bb9b11d63704d2de49201d1f328e0a0ba`。
- SQLite integrity check为`ok`，foreign-key errors为0，Research Schema为0.4；迁移日志55条。当前787 entities、2655 facts、760 relationships、791 sources、812 content cards、678 gaps。
- 本批新增10 entities、45 facts、10条普通CREATED relationships及1条受控共同作品参与作者关系、10个新来源、19张Research卡、22个研究缺口；另复用SRC-0267、SRC-0268、SRC-0271。受控边V1-REL-0762使用旧SRC-0638及SRC-0271；不代表新增来源。9个既有作品闭包、19条coverage主记录和3项候选延期通过审核。

## 必要QA

完整读取ROOT `run_required_qa.py`后，成功apply之后以零参数运行一次。wrapper SHA-256 `cc23b141f0b33b40ce5755d3e97f26a3738e2995cfbee4d230882d2dd2167a94`；外层结果`ALL_REQUIRED_STEPS_PASS`，16步全部exit 0。QA报告SHA-256 `73a1ab7fc8c0418ba0727221a483b372dc8e78ff947febeb0b384593030575f9`。

- 独立重放55条迁移，19张表一致，完整性检查通过且外键错误为0；reviewed checkpoint核验SQL精确重放及旧行保留。
- JSON、CSV、XLSX各导出19张表；22个主导出文件与独立重复导出逐字节一致。
- 既有177个公开文件逐字节一致；B20新增公开对象0，仍为127个公开对象和139条路由。
- `manifest.json`与`site_data.json`通过校验后复制至开发Web数据目录，两个副本均逐字节一致。

母级实际数据独立审查`PASS_ACTUAL_DATA_REVIEW`，422项检查通过；报告SHA-256 `9453306ddb6ff222fac88e0464a241307c903eec01c8d8171336649d602f5329`。母克隆审核及Telles受限角色、双来源闭包通过。发布范围与版本未改变。
