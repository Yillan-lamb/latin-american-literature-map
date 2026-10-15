# WCD-10-B21 验证记录

## 实际主库

- `0056_wcd10_b21_author_works.sql`在授权WT主库仅执行一次，exit 0；数据库从冻结SHA-256 `db16fe4f5faaafcfca3b02b42c52d56bb9b11d63704d2de49201d1f328e0a0ba`更新至`559b1858b7b5e647b4b313f841be8d2960cf3a5eacf2a2dd92c6161668da706c`。
- SQLite integrity check为`ok`，foreign-key errors为0，Research Schema为0.4；迁移日志56条。当前795 entities、2683 facts、768 relationships、794 sources、823 content cards、690 gaps。
- 本批增量为8 entities、28 facts、8条普通CREATED relationships、3个新来源、11张Research卡和12个研究缺口；另复用SRC-0275。无额外关系。3个既有作品闭包、11条coverage主记录和1项候选延期经审核保全。

## 必要QA

零参数QA wrapper仅在apply成功后运行一次，exit 0；16步全部exit 0，QA报告为`PASS`。母级实际数据独立审查328项检查通过。过程记录保留17条紧凑命令（一次apply加16步QA）的原始argv、解析runtime、cwd、exit及分离raw stdout/stderr路径与SHA；详见[内部执行绑定](<../../../../../../../project/internal/WCD_10_WORKSPACE/B21/INTEGRATOR_APPLY_QA.json>)、[QA步骤原始记录](<../../../../../../../project/internal/WCD_10_WORKSPACE/B21/QA_STEPS.json>)和[实际审查](<../../../../../../../project/internal/WCD_10_WORKSPACE/B21/ACTUAL_DATA_INDEPENDENT_REVIEW.json>)。

- 独立完整重放56条迁移，19张表一致，完整性检查通过且外键错误为0；reviewed checkpoint核验正式SQL精确重放及旧行保留。
- JSON、CSV、XLSX各导出19张表；22个主导出文件与独立重复导出逐字节一致。
- 既有177个公共文件逐字节一致；B21新增公开对象0，仍为127个公开对象和139条路由。
- `manifest.json`与`site_data.json`通过校验后复制至开发Web数据目录，两个副本逐字节一致。

全56迁移重放的raw stdout SHA-256为`4b139c7f31eb6fe66e606c89568110e2fa2be16ea6ea1c42c76cd38169bf3932`；格式化replay日志SHA-256为`2353d7eb5200018046b8989b8d0bfa7e2424aa73718f517c55ad590fe09bf959`。原始stdout与格式化日志是不同产物；后者仅汇总实际命令、exit、raw路径和SHA，不替代raw stdout。QA报告SHA-256为`a40de6e2ca81ab99774bc44400108d3975f6b7771172ba984671a72deda04b37`。浏览器全矩阵及无关unittest未运行，按DEC-070不属于本批必要QA；无工具或产品代码变更。
