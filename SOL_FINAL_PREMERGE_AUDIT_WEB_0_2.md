# PR #11 / Web 0.2.0 最终合并前独立审计

- Repository：`Yillan-lamb/latin-american-literature-map`
- Pull Request：`#11 feat(content): integrate audited WEB-CE B01-B17`
- Head branch：`codex/web-content-expansion-b01-b17`
- Target：`main`
- Audit date：2026-08-24
- Audit role：Independent Final Reviewer / Product Auditor / Data Integrator / Merge Gate Owner

## Executive Verdict

**READY TO MERGE**

本轮未继承此前 PASS，而是从 PR #11 审计起点 `a54d875a5c14aedb4d7653cffa55dd375604a4ce` 独立复核 Research、迁移、导出、Curation、Geo、Web Data、公开包、前端、浏览器、治理、安全与版权边界，并在独立工作树中完成合并前整改。

结论：没有 P0，没有未解决 P1；USER 四项产品反馈均已实现并建立回归门禁。PR 分支推送后仍须由 GitHub 对该精确提交运行 required checks；只有远端检查全绿，Merge Gate Owner 才执行正常合并，不 force、不 bypass branch protection。

本结论只批准 PR #11 合并进入开发主线，不批准 Public Release、production deployment、Web 1.0.0、GitHub Release 或公开宣传。

## USER Preview Feedback Resolution

### 1. Country labels

- 地图按 `country_code` 去重，为当前 13 个可探索国家常驻中文标签，不依赖 hover 或 click。
- 墨西哥、危地马拉、尼加拉瓜、古巴、哥伦比亚、委内瑞拉、厄瓜多尔、秘鲁、巴西、智利、阿根廷、乌拉圭、巴拉圭均有标签。
- 小国使用表现层引线；标签 `pointer-events: none`，不截获地图点击。
- 桌面端只隐藏与国家名发生实测碰撞的少数地点文字，地点圆点、点击、键盘角色和无障碍名称保持不变；移动端保留全部国家名与地点圆点，隐藏拥挤地点文字。
- 国家标签只存在于 SVG presentation layer，没有新增或修改 Research 坐标。
- Chromium、Firefox、WebKit 的桌面/移动测试均验证标签数量唯一、文字正确、无实质碰撞，国家及地点交互不受影响。

### 2. Reader / Research Evidence boundary

- 新增确定性 `reader_content` 投影：普通页面只消费文学结论与自然导语，不再读取带状态和来源说明的原始内容 wrapper。
- `PUBLIC_CONTENT.json` 与完整 Web Data 继续保留 `research_refs`、`source_refs`、status、reviewer 和 evidence；Public bundle 只输出结论式 `reader_content` 与单独的 `content_evidence` 引用映射。
- `Research Evidence` 默认收起，展开后仍能从页面结论回到具体 sources。
- Public bundle 物理剥离 review queue、策展工作稿 `content_zh`、reviewer、basis、reviewed_at 等治理字段。
- 数据 validator 递归拒绝来源机构、书目核验、审核流程等语言进入 `reader_content`；浏览器测试把默认普通 DOM 与展开后的 Research Evidence 分开检查。
- 全部 119 条 sitemap 路由逐页渲染通过，无 reader-facing 证据流程语言和治理语言泄漏。
- CI 使用的 USER_REVIEW 本地审核预览另含 61 位作家、168 部作品和 273 条路由；审核横幅作为测试工具单独标记，不计入读者正文，全部预览路由同样通过 reader / evidence 边界扫描。

### 3. Author pagination

- 首页作者区不再使用 `featured_author.slice(0, 8)`。
- 当前 25 位 eligible public authors 全部进入同一个确定性目录；每页 9 位，共 3 页（9 / 9 / 7）。
- 提供上一页、下一页、页码、`aria-current`、键盘操作、切页后标题聚焦和自然滚动。
- 自动测试断言所有页并集严格等于 public author scope，页间无重复、无遗漏，并覆盖第一页、中间页、最后一页。

### 4. Work pagination

- 首页作品区不再使用 `featured_work.slice(0, 6)`。
- 当前 60 部 eligible public works 全部进入确定性目录；每页 9 部，共 7 页（前 6 页各 9 部，末页 6 部）。
- 分页交互与作者目录使用相同的键盘、焦点、状态和覆盖率规则。
- 自动测试断言所有页并集严格等于 public work scope，页间无重复、无遗漏。

### 5. Popularity ranking

- Algorithm version：`web-0.2-popularity-v1`。
- Build-time derived，不修改 Research Schema 0.3，不在前端写死作者或作品顺序，不使用实时流量。
- Author factors：重大文学奖项、公开作品入口数量、reader content 深度、evidence 深度、reading path 连接。
- Work factors：作者 recognition、reader content 深度、书目字段完整度、阅读引导、reading path 连接、文学关系数量。
- 每项总分等于 factors 之和；全局先排序后分页；同分按 `target_id` 升序。
- 两次同输入重建结果完全一致；validator 与 unit tests 检查全量覆盖、连续 rank、factor 合计和稳定 tie-break。
- 普通首页只解释排序维度，不显示内部得分。

## Data Audit

`validate_master.py` 结果：

| Item | Result |
|---|---:|
| entities | 367 |
| facts | 998 |
| relationships | 293 |
| sources | 278 |
| content cards | 255 |
| relation holds | 51 |
| gaps | 24 |
| schema | 0.3 |
| SQLite integrity | ok |
| foreign-key errors | 0 |

- IDs、端点、受控关系类型、事实与来源引用、卡片映射继续通过动态主库 validator。
- 全部 Python unit / regression tests：10/10 PASS。
- 未发现数据库损坏、悬空 FK、迁移 hash 漂移或新的高风险语义错误。

## Migration Audit

- 追加 `0027_web_0_2_candidate_package_metadata.sql`，只把 `metadata.package` 修正为 `Data 1.2.0 development candidate package`。
- 迁移编号 0001—0027 连续，SQL 不自行控制事务，目录文件 SHA-256 与 `migration_log` 全部一致。
- 从冻结的 Data V1.0.0 基线 SQLite（SHA-256 `e82533519dcfe2ae1a1c6d02f60c5d775dd95f49e0506c2cbeb6c649a89fb853`）完整重放 27 个迁移。
- 重放结果与 development master 的 19 张业务表逐行相等；`migration_log.applied_at` 作为运行时间字段排除，其余字段相等。
- 重放库 integrity `ok`，FK errors `0`。

## Export Audit

- `Data 1.2.0 candidate` 已从迁移后的 SQLite 重新生成 CSV、JSON、XLSX 与 MANIFEST。
- package、migration log、数据库 SHA、文件字节数和各文件 SHA 已同步。
- 另建空临时目录用同一参数再次完整导出，目录级逐文件比较无差异。
- `Data V1.0.0` 仍是正式 Research Release；本次没有改写历史 release。

## Curation Audit

Review package：61 authors / 168 works or collections / 25 places。

| Group | curation_ready | reader_ready | research_basic |
|---|---:|---:|---:|
| authors | 10 | 44 | 7 |
| works | 17 | 142 | 9 |
| places | 19 | 5 | 1 |

- Formal public scope 保持 25 authors / 60 works / 28 places；分页只解决 discoverability，不绕过 approval。
- Public Curation 仍只包含 `auto_approved`；`user_review` 与 `hold` 继续留在完整 Web Data 的独立 queue，Public bundle 不暴露 queue。
- 无批量自动批准，无新增 Batch 18，无以策展文本伪造 Research fact 或 relationship。

## Geo Audit

- Geo 数据为 33 places / 78 place relations；父级、关系端点与坐标成对规则通过。
- fictional places 继续无现实坐标；unknown / hidden 技术节点不进入 public search 或 sitemap。
- 国家标签是视觉 label point / callout，不是文学坐标，不写回 Geo 或 Research Data。

## Product Audit

- Web Product：0.2.0；Web Data Schema：`v2-web-0.2`；没有创建 Schema 0.4。
- Web Data 确定性重建与 committed output 一致。
- Public bundle：115 个公开实体入口、119 个 sitemap URL、127 个文件；public bundle validator、可见 HTML 扫描和 pending manifest preflight 全部 PASS。
- Search、timeline、country/place/fictional-space、author/work、Research Evidence、mobile nav、canonical/OG、404 与全部内部链接均通过浏览器回归。
- 地图、分页和 evidence boundary 有独立机器断言，不依赖人工目测结论。

## Governance Audit

当前版本矩阵：

| Layer | Current |
|---|---|
| Project stage | V2 |
| Formal Research Release | Data V1.0.0 |
| Development Research | Data 1.2.0 candidate |
| Research Schema | 0.3 |
| Web Product | Web 0.2.0 Development Baseline |
| Web Data Schema | v2-web-0.2 |
| Curation Content Schema | v2-curation-content-0.3 |
| Public Release | PAUSED BY USER |
| Current Task | WEB-CONTENT-DEEPENING |
| Next | WCD-01 Global Curation Triage |

已修复：

- `V2_TASKS.md` → 1.1.1 / 2026-08-24，并登记最终终审入口；
- V2 Frozen Master Spec → 1.1.2 / 2026-08-24，仅做 USER 授权的 governance-only 勘误；
- README 明确 V1 → `TASKS.md`、V2 → `V2_TASKS.md`；
- candidate package metadata、export manifest 与 SHA 同步；
- `Web 0.1.x — Unreleased` 标记为 Historical / absorbed into Web 0.2.0；
- `V2_WEB_DATA_SCHEMA.md` 保留 144/238/76 为 Historical Initial Build Snapshot，并新增 Current Web 0.2.0 Build State；
- 旧 Sol review 文件保持历史原文，不重写。

## Browser QA

- Playwright final matrix：80/80 PASS。
  - Chromium desktop 1440×1000；
  - Chromium mobile 390×844；
  - Firefox desktop 1440×1000；
  - WebKit mobile 390×844。
- 独立 journey matrix：Chromium / Firefox / WebKit 各自运行 desktop 1440×1000 与 mobile 390×844，共 6 个组合、54 条用户旅程，全部 PASS。
- GitHub CI parity：USER_REVIEW 预览在 Chromium desktop / mobile 共 40/40 PASS；其 273 条 sitemap 路由逐页检查通过。
- 覆盖首页、国家标签、地图 click / keyboard、现实地点、虚构空间、作者与作品全页分页、search、timeline、作者页、作品页、evidence 展开、mobile nav、119 条 sitemap 路由与链接完整性。

## Security and Copyright

- Public bundle 递归禁止 review/status/schema/work-copy 等治理字段；review queue 不暴露。
- 修改范围 secret-pattern scan 无命中；没有私钥、token、Cookie 或账号配置。
- 仓库未新增或泄漏 PDF、EPUB、MOBI、原书全文或大段受版权保护文本；前端继续不使用作品封面或全文。
- 272 个 source URL 联网审计：209 reachable、25 access restricted、38 network/timeout；受限与超时不被误判为书目无效，未发现需要阻断本次合并的结构性来源错误。
- Manifest preflight 对 37 个冻结输入与 127 个 bundle 文件完成 hash；Public Release 仍为 pending/paused，不生成 approved production manifest。

## Remediation

本轮实际整改包括：

1. 结论式 reader projection 与证据引用分层；
2. 公开包治理字段物理剥离与 validator 加固；
3. 13 国常驻中文地图标签、callout 与跨浏览器防碰撞；
4. 25 位公开作者、60 部公开作品全量分页；
5. deterministic / explainable ranking 与覆盖率测试；
6. 迁移 `0027`、Data 1.2.0 candidate 全量重导出；
7. 当前状态、版本矩阵和历史快照文档勘误；
8. 完整迁移重放脚本、Web Data / public bundle / browser 回归门禁。

## Remaining Non-blocking Issues

- Formal public scope 仍小于 61 authors / 168 works review package；这是 Curation approval 边界，不是分页遗漏。
- 文学地点、解释性关系、女性诗人、诗歌与区域覆盖仍不均衡，按既定 WCD-02—WCD-04 后续处理。
- 25 个 URL 受自动访问限制、38 个 URL 在本轮超时或网络失败；记录为来源运维观察项，不等于 bibliographic invalidity。
- Public Release 仍暂停；Lighthouse、approved release manifest、production Pages 与 GitHub Release 不属于本次开发基线合并。

上述均为 P3 / 后续内容深化事项，不阻断 PR #11。

## Merge Recommendation

**READY TO MERGE**

合并条件：本文件及整改进入 PR #11 原分支后，该精确 head 的 required GitHub checks 必须全部成功。满足后可正常合并至 `main`；不得 force、不得绕过保护、不得重写历史。

合并后只做 main SHA、数据库、Web Data、国家标签、分页、reader/evidence boundary、任务状态与 Public Release 状态复核。随后停止；下一阶段为 WCD-01，但本轮不自动启动。

## Post-Merge Verification

- PR #11 已于 2026-08-24 合并；合并并完成复核时的 `main` SHA 为 `208b53806e25140967e8116738d833f3ca0db90f`。
- Post-merge `Web Development CI` 成功；本地复核中数据库完整性、27 次迁移重放、10 项 unit/regression、Web Data、public bundle 与公开页面验证均通过。
- `main = Web 0.2.0 Development Baseline`。
- `Public Release = PAUSED BY USER`；没有创建 production deployment、Web 1.0.0 tag 或 GitHub Release。
- 当前任务仍为 `WEB-CONTENT-DEEPENING`，下一任务仍为 `WCD-01 Global Curation Triage`；本次复核未启动 WCD-01。
