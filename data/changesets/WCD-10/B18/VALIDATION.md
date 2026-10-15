# WCD-10-B18 验证记录

## 实际主库

- `0053_wcd10_b18_author_works.sql` 在授权 WT 主库仅执行一次，exit 0；数据库从SHA-256 `1bc4695f6c77cad166b5229572f73490006b9e4392379e0017f799049e5aceb0`更新至`8e2c26422a219990c8e397005ebd4e2c8499181f657b63f53cdb70af3e99d016`。
- SQLite integrity check为`ok`，foreign-key errors为0；`validate_master.py`通过，schema 0.4。主库共764 entities、2568 facts、736 relationships、768 sources、777 content cards、633 gaps；migration_log包含53条迁移记录。
- 新增量为21 entities、69 facts、21 relationships、6 sources、24 content cards、31 gaps；9条来源候选中另有3条复用SRC-0253、SRC-0254、SRC-0256。30条coverage主作品记录与9个旧作闭包保留。

## QA与重放

零参数运行已完整读取的`run_required_qa.py`一次，16步全部exit 0。完整53迁移独立重放成功，19张表与主库一致且完整性/外键检查通过。JSON、CSV、XLSX导出均为19张表；22个重复导出文件逐字节一致。固定日期构建的177个公共文件逐字节相同，仍为127个公开对象、139条路由；B18新对象公开0。两个校验通过的Web JSON文件完成逐字节复制与验证。

父级`ACTUAL_DATA_INDEPENDENT_REVIEW.json`结论为`PASS_ACTUAL_DATA_REVIEW`，553项检查无失败；报告SHA-256：`8b1fce61c65386d1134602acda5019ee666e504754c1e5f2d8ee2591747b91ef`。

## 版本边界

Data 1.5.0 development candidate、Research Schema 0.4、Web Data 0.3、Web 0.6.0不变。没有公开新对象，也没有发版或部署。WCD-10尚余3批7位作者；W03版本注记与直接归属回补、B08共同对象归属及TASK-127仍待完成。
