# WCD-10-B03 执行验证

2026-09-29；TASK-108。PM本机隔离执行门禁、独立post-apply数据/浏览器证据/治理核对均PASS；有边界执行收口，不是CI、合并或线上发布证明。

## 实际写入与审核边界

- 独立候选/coverage/来源登记、0038 SQL/map及工具返修均PASS；前库SHA `83435075f1da42f07bf03b98dd934f182fdcb75f969cf87e48e46359290cd498`。
- 0038 SQL SHA `50d1fc78562a7915312b8213c9b974ad4f5d1b8d5e60f6ea745280aafd92a241`，mapping SHA `01a156ada6c7ed6ec919681f262d504ac7404d31ff5bb9af1ee7da611d50b9f5`；builder SHA `1b37cda5c6cc13d5f0f4abf9809cb32c8ee90df506a7b72f093f87a1e1acbf45`。
- apply_migration实际追加，task TASK-108/reviewer wcd10_b01_review，日志日期2026-09-29T02:07:40+00:00。后库SHA `079deee47063d2435bdaafe1b3c1dca24ca8b6c7353acc1427075bf0ce86746d`。
- 新增12作品/合集、54事实、20关系、21来源、19卡、28gap；409实体/1170事实/376关系/378来源/315卡/98gap。旧行与hold全部保持；同一Dillon论文SRC-0039复用，署名F04/F08维持research_note_only。18目录限定对象学术gap与10deferred保留，不称研究全集/完备。
- 两单篇原作/电影、合集/单篇、引用版/首版分开；La casa verde1966明确支持，代理1967、Las armas1964及旁支错年排除。新中文题名暂译，Curation和公开范围不变。

## PM实际验证

| 检查 | 结果 |
| --- | --- |
| 全Python/ResourceWarning作为error | 99/99 PASS；含9项B03精确prepare/回滚/重复/drift/逐值oracle/辅助包hash负例，日期4项、作者metadata6项 |
| Master integrity/FK | PASS；ok、0错误 |
| 全迁移replay | PASS；38迁移、19表逐值相同 |
| 导出一致性 | JSON/CSV/XLSX各19表与SQLite精确相等；无公式 |
| 重复导出 | 22文件byte-identical；历史检查点未覆写 |
| B03专用QA | PASS；固定基库/SQL/map/task，全部旧行保留与精确SQL重放、metadata/日志闭包 |
| Web Data/public validators | PASS；139路由/127公开对象/82趣闻，不含禁止字段 |
| production前后 | 177文件byte-identical；新研究对象公开泄漏0 |
| production Chromium桌面/移动 | 60 PASS、4既有预览条件SKIP；包含全139条sitemap路由 |

QA报告SHA `729fd175c94d3e9f252f07b1c635d943ad5db854e98fb887601847f0be008ac0`（work/wcd10-qa/B03_QA.json）。PM浏览器JSON另保存在work/wcd10-qa/B03_PLAYWRIGHT.json。无前端diff、公开文件全同，本轮未重跑Firefox/WebKit/Lighthouse，不宣称全浏览器或性能审计。

Reviewer独立只读将已审SQL在纯内存基库重放，19表与实际库逐值相等；独立核对19表导出/22重复文件/177公开文件/manifest哈希、旧行/hold保留及新12对象不公开均PASS。浏览器报告SHA `806f81fcb8fd12f38ef7735c9dfb0a012b9ffea7e04fa9dfa80d4a49cd7f0050`：桌面/移动各30 PASS和2预览条件SKIP、0unexpected/flaky/errors、无retry，46.386秒；独立检查相关断言与skip条件、治理当前入口后最终PASS。Reviewer没有重跑PM99Python/60浏览器，不混同证据来源。README/主库说明/Spec/CHANGELOG及本地TASKS/交接同步；DECISIONS=N/A（沿用DEC-060），Charter锁定不改。

准备期完整链测试曾因0038文件存在但尚未登记而失败，入库后99/99全部通过；未弱化链断言。before-public首次省略HTTPS origin得到175文件，与原177文件比较正确失败；使用同一origin、无preview flag重建后177文件全同，没有改公共内容绕过比较。局部测试服务器仅127.0.0.1，验证后停止。

Research保持1.5.0未发布development train；Schema0.4、Web Data v2-web-0.3、Web0.6.0不变，Public Release暂停。无commit/push/PR/合并/Tag/Release/部署；Charter锁定，根目录用户改动及21历史外部CSV不触碰。动态状态只在USER持久project/internal/TASKS.md。
