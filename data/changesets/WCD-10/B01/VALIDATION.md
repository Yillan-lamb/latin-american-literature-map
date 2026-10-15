# WCD-10-B01 执行验证

2026-09-28；本机隔离分支，非CI或线上发布证明。

## 输入与写入

- 基线main `05f3372c69a54ec331d31b05d16c8288d6d3a993`，基库SHA `a8c54e3c0e04a347f310d7f0f969dfba758f575008fa64c1789e43b26bf378cc`。
- 审核SQL `0036_wcd10_b01_author_works.sql`，SHA `2bbb93a2b2bfd3a8ffed9906c5db11d94b08d2d78d363c295aa310658eed0ffc`；被拒初版未执行。
- 用apply_migration.py、TASK-106、Reviewer wcd10_b01_review实际写入；后库SHA `98b914d5421d40b2f20488fe988e52fb165fc02967ec1e7e816f9280ce5071d1`，迁移日志hash吻合。
- 当前387实体、1076事实、345关系、339来源、280卡、48gap；旧研究行未删/覆写。

## 实际门禁

| 检查 | 结果 |
| --- | --- |
| validate_master.py | PASS；integrity OK、外键0 |
| unittest全Python，ResourceWarning作为error | 63/63 PASS |
| validate_migration_replay.py | PASS；36迁移、19表完全相同 |
| 检查点development_candidate导出 | JSON/CSV/XLSX各19表逐值等于SQLite；XLSX无公式 |
| 同一库重复导出 | 22文件SHA完全相同；历史快照未覆写 |
| qa_wcd10_checkpoint.py | PASS；审核SQL精确重放比较所有表/metadata，日志hash/Reviewer匹配，旧行/hold保留 |
| 完整Web Data构建/validator | PASS；来源当前主库，不等于扩大公开范围 |
| production bundle构建/public validator | PASS；139路由、127公开对象、82趣闻，禁止字段0 |
| 基库与新库分别构建production | 177文件byte-identical；10新Research对象公开泄漏0 |
| 真实production桌面/移动Chromium | public-product.spec.cjs 60/60 PASS，含全sitemap遍历、地图/搜索/时间线/来源及公开边界 |
| git diff --check | PASS |

无前端变更，全部公共文件byte-identical；本轮适用浏览器检查为production Chromium双视口，未复跑Firefox/WebKit或Lighthouse，不声称新的四浏览器/性能验收。

## 独立QA与边界

独立只读Reviewer另核验19表所有导出、21非SELF manifest文件、296条SQL新增记录实值、许可metadata/hold、迁移日志、26对象覆盖及24gap、公开目录无共享inode、22重复导出文件，限定已知证据结论PASS。QA随后补强拒绝同目录、精确审核SQL重放保护全部表/metadata、日志绑定；错误值负例改为真实value_text列，并实际重跑。

新增卡保持research_gap，F18独立research_note_only，19对象研究gap/5deferred保留，没有新Curation批准。TASK-105/最终TASK-127未完成。Research1.5.0未发布development train、Schema0.4、Web Data v2-web-0.3、Web0.6.0保持；无PR、push、合并、Tag、Release或部署，Public Release暂停不变。

治理：CHANGELOG/当前README/主库README/Spec及本批记录更新，USER持久TASKS/交接同步。DECISIONS无需追加，沿用DEC-060及现有章程版本规则；锁定Charter、无关外部CSV未触碰。
