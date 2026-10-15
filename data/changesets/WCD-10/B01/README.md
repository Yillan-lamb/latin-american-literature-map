# WCD-10-B01 · 有边界的研究整合检查点

2026-09-28；TASK-106；基线main `05f3372c69a54ec331d31b05d16c8288d6d3a993`。

博尔赫斯、李斯佩克朵、加罗已知证据范围经独立Review和返修，追加审核迁移0036并完成导出、验证。新增10作品/合集、49事实、11关系、25来源、19补充卡及24gap；既有行、hold和Curation保持。**这是有边界的批次执行收口，不是全集、学术研究完备或61位作者全任务完成。**

## 来源、覆盖与审核

- `CANDIDATES.json` / `SUPPLEMENT.json`：27来源候选、10新对象、49事实/11关系，两个内容包独立审核PASS；仅25实际使用来源登记，S19/20保留版本hold。
- `REVIEW_GATE.json` / `SOURCE_REGISTRATION.json`：内容审核hash和来源登记；包内生产时状态保留，不回写冻结输入，实际审核/执行以本目录审核与验证为准。
- `COVERAGE.json`：26对象（16既有、10新）逐项处置；19目录/机构评论对象保留学术研究gap，另5deferred。既有A级研究沿用，不称本轮重新核验。
- `INTEGRATION_MAP.json`：正式ID和计数；prepared状态是迁移前冻结事实，已执行状态在`VALIDATION.md`，不修改审核hash。
- `AUDIT.md` / `VALIDATION.md`：独立审核及实际执行QA。

关键限制：1979 UNAM《Felipe Ángeles》仅为该书版年份，不断言首书版；同名短篇/合集分层，再版日期不倒推首版，中文未核实译名标暂译。S24署名研究说明保存，历史逐稿双盲和冲突许可仍NOT_VERIFIED，不新增人物指控、自动主题关系或策展批准。IMS/CVC容器子页不算双独立解释来源。

## 实际验证

Master、36迁移/19表回放、审核SQL精确重放保护旧行PASS；JSON/CSV/XLSX各19表逐值等于SQLite，22导出文件重复生成byte-identical。公开production177文件前后byte-identical，127公开对象、新10实体泄漏0。桌面/移动Chromium生产构建60/60功能测试、Python63/63PASS（含错误新增值、metadata、日志hash、同目录伪比较负例）。

SQLite SHA：`98b914d5421d40b2f20488fe988e52fb165fc02967ec1e7e816f9280ce5071d1`。导出`data/exports/wcd10-b01-checkpoint/`为development_candidate，不覆写旧快照。完整研究Web投影重建，公共包仍不变。

Research保持1.5.0未发布development train检查点；Schema0.4、Web Data v2-web-0.3、Web0.6.0不变。无合并、Tag、Release或部署；后续动态执行状态仅在USER持久工作区唯一TASKS入口维护。
