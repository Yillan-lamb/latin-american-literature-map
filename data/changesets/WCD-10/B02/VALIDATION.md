# WCD-10-B02 执行验证

2026-09-28；仅本机隔离分支，不是CI、合并或线上发布证明。

## 实际写入与边界

- 前置B01库SHA `98b914d5421d40b2f20488fe988e52fb165fc02967ec1e7e816f9280ce5071d1`；已有数据、hold和Curation不改写。
- 候选/来源/coverage差量及SQL均独立Review PASS。获批0037 SQL SHA `ffcedb4d7fbd15eebce42456bd24b908e7ce91f52b6a97fbb67ea01ae70172dc`，mapping SHA `f2e0562660d9a0843c9eae3e9863879ecb289cebe615421c3679c642d22c8c09`。
- apply_migration.py实际追加，task TASK-107，reviewer wcd10_b01_review；后库SHA `83435075f1da42f07bf03b98dd934f182fdcb75f969cf87e48e46359290cd498`。
- 新增10作品/合集、40事实、11直接关系、18来源、16卡、22gap；来源SRC-0026复用而非重新登记。当前397实体／1116事实／356关系／357来源／296卡／70gap。
- 22对象覆盖：7个有限既有研究保留（不是本轮fresh review），15学术gap与7deferred保持。《金鸡》写作年、旧卡研究状态一致性及《上校》首刊/书版边界不确定化。新署名会议研究保持B/research_note_only，中文新题名暂译。

## 实际门禁

| 检查 | 结果 |
| --- | --- |
| 全Python（ResourceWarning作为error） | 80/80 PASS，包括8项B02精确准备/来源复用/日期/回滚/重复/错误值负例 |
| Master integrity/FK | PASS；ok、0错误 |
| 全迁移replay | PASS；37迁移／19表完全一致 |
| 新检查点导出 | JSON/CSV/XLSX各19表与SQLite逐值相等；XLSX无公式 |
| 二次导出 | 22文件SHA完全相同；历史快照不覆写 |
| B02专用QA | 固定基库、mapping、SQL、task/batch；精确重放全部表、metadata、迁移日志，旧行/hold保持 |
| 完整Web Data / public validators | PASS；无禁止字段，139路由／127公开对象／82趣闻 |
| 同参数production前后对照 | 177文件byte-identical；新增10个研究对象公开泄漏0 |
| 真实production Chromium桌面/移动 | 60/60 PASS；地图、搜索、时间线、来源与全139条sitemap路由 |

第一次公开包比对正确拒绝了不同构建参数的比较：新包加了development-preview横幅，旧包没有。diff显示仅HTML横幅，公开数据SHA一致；按相同参数重新构建后177文件全部相同。并未更改策展或生产页面源文件来通过检查。

Reviewer独立读取前后库并解析已审SQL，不执行SQL，核验19表精确新增/metadata/log、19表三格式、22重复导出文件、177公开文件和hash闭包PASS。其未重跑PM写库测试或浏览器；80/80与60/60为PM实际执行证据。无前端变化且公共包全同，本轮没有复跑Firefox/WebKit/Lighthouse，不声称新的全浏览器或性能审计。

Research保持1.5.0未发布development train，Schema0.4／Web Data v2-web-0.3／Web0.6.0保持。未提交/push/PR/合并/发布；Public Release暂停。CHANGELOG、当前README、主库说明、Spec、批次审计及USER持久TASKS/交接同步；DECISIONS无需追加，沿用DEC-060。锁定Charter、根目录用户数据和无关外部CSV未触碰。
