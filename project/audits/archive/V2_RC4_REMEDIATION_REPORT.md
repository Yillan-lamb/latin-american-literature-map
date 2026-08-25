# V2.0.0-rc.4 独立终审返修报告

- 日期：2026-08-13
- 任务：`V2-N4-R03`
- 结论：P1-01 至 P1-07 已按最小范围修复并完成本地复测；最终提交由 PR CI 生成唯一候选 Manifest。
- 治理状态：`release_state = pending_v2_n4`；`V2-N4 = USER_REVIEW`

## A. Candidate Identity

| 项目 | 当前值 |
|---|---|
| branch | `codex/v1-n3` |
| PR | `#4` |
| RC | `V2.0.0-rc.4` |
| PR head / RC commit | 最终返修提交推送后由 PR #4 head 唯一确定 |
| Manifest commit | CI 脱离式 Manifest 的 `candidate_commit_sha` 必须等于 `$GITHUB_SHA` 与 PR head |
| 本地预检 | `artifacts/v2-rc4/V2.0.0-rc.4.preflight.manifest.json`，明确标记 `local_worktree_preflight`，不冒充 Git 候选 |
| release state | `pending_v2_n4` |
| N4 | `USER_REVIEW` |

rc.3 的旧提交锚定不再有效。rc.4 的正式证明只由最终 PR head 对应的 CI 工件 `v2-rc4-candidate-<full SHA>` 提供；Pages 也在同一次运行中构建一次、验证一次并上传同一个 `dist/`。

## B. Findings Resolution Matrix

| Audit ID | 原问题 | 修复方式 | 文件/页面 | 测试证据 | 当前状态 |
|---|---|---|---|---|---|
| P1-01 | 37 条 `user_review` 被去状态公开 | Web Data 在源阶段按显式状态分区；公开四组均只接收 `auto_approved`；deploy builder 再次 fail-closed | `build_v2_web_data.py`、`validate_v2_web_data.py`、`build_v2_deploy_bundle.py` | 源队列 5/5/17/10；public 0/0/0/0；bundle 禁止键扫描 0 | CLOSED |
| P1-02 | 作家页缺核心模块，低覆盖页伪装完整页 | 公开作者范围要求完整卡片、地点关系及至少一部完整作品入口；新增为什么认识、事实型写作线索、按发表年份排列的作品入口和自然文学关系；当前公开 7 位 | `site/app.js`、`public_scope.authors` | 指定作者抽查；不完整作者不进入搜索/sitemap；全量动态路由通过 | CLOSED |
| P1-03 | 作品页学术化、主题/地点/延伸闭环不足 | 学术观点下沉研究层；公开作品收紧为 14 部；用正式人物/地点/研究事实形成阅读线索；未批跨作品推荐改为同作者正式书目导航 | `CURATION_ENTRIES.csv`、`site/app.js`、public scope builder | 重点作品与随机作品浏览器抽查；完整页均有至少 2 项事实型阅读线索 | CLOSED |
| P1-04 | 马孔多只返回单实体；中文主题 slug 冲突 | 为所有公开节点生成一层关系邻接；搜索按直接结果优先再扩展；路由由原文转写与实体 ID 共同构成 | Web builder、frontend、bundle builder | 搜索马孔多同时出现地点、百年孤独、马尔克斯；42 个实体 URL 唯一且语义匹配 | CLOSED |
| P1-05 | PR head 与 Manifest 候选不一致 | 采用正式脱离式 Manifest：干净 HEAD、PR head、`$GITHUB_SHA`、Manifest SHA 同值；仓库文件仅为不可部署控制规则 | release control、CI、Pages | CI 工件名含完整 commit，Manifest 同时核对 checkout HEAD 与 `$GITHUB_SHA`；本地预检不声明 commit | CLOSED |
| P1-06 | verifier 验 Git blob 而部署吃工作树 | 同时比对 Git blob、工作树和最终 dist 清单；工作树冻结范围脏即失败；tamper 回归修改 dist 字节后验证必败 | release manifest builder、public bundle validator、CI | 本地 32 项输入、54 个 bundle 文件通过；篡改 `site_data.json` 后拒绝 | CLOSED |
| P1-07 | 浏览器/Lighthouse 不可复现 | 锁定 Node、Playwright、浏览器 revision 与 Lighthouse；配置 JSON/HTML reporter、失败截图/视频/trace；CI Chromium smoke + RC 全矩阵 | `package-lock.json`、Playwright 配置、CI | Playwright 28/28，逐条渲染全部 sitemap 路由；Lighthouse 原始 JSON/HTML | CLOSED |

## C. USER Review Queue

审核队列仍为：阅读路径 5、为什么值得读 17、下一步阅读 10、文学时期 5，共 37 项。另有既有 Curation 推荐 `user_review` 1 项和 `hold` 1 项。逐项文案与依据见 `project/audits/archive/V2_RC4_CURATION_USER_REVIEW.md`。

证明未进入 public bundle：

- Web Data：`presentation_review_queue` 保存 37 项，`presentation` 对应四组均为 0；
- public data：不存在 `presentation_review_queue`、`review_queue`、`review_status`、`user_review`；
- 构建器如果发现非 `auto_approved` 进入 public presentation，会立即失败；
- validator 要求公开索引精确等于 `public_scope`，不能通过删除状态字段绕过。

## D. Test Results

实际复测入口和原始工件：

- 数据：`validate_master.py`、Web Data rebuild/validator；
- 路由/边界：`validate_v2_public_bundle.py`、`qa_v2_public_ui.py`；
- 浏览器：`npm run qa:browser`，4 个项目 × 7 项 = 28/28；其中一项逐条渲染全部 46 条 sitemap 路由；原始结果 `artifacts/v2-rc4/browser/playwright-results.json`；
- Lighthouse：`npm run qa:lighthouse`；首页为 92/100/100/100，作品页为 93/100/100/100；原始 JSON/HTML 位于 `artifacts/v2-rc4/lighthouse/`；
- 来源：68 个 URL，64 reachable、1 automated access restricted、3 network/timeout；见 `artifacts/v2-rc4/source-url-audit.json`；未因机器访问失败删除来源；
- Manifest：本地 worktree preflight PASS；单字节追加后 tamper regression FAIL（预期）；最终 commit 模式由 CI 执行。

## E. Public Bundle Inventory

| 项目 | 值 |
|---|---:|
| 文件数 | 54 |
| 总大小 | 411,872 bytes |
| 最大文件 | `data/v2/web/site_data.json`，199,957 bytes |
| public data | 199,957 bytes |
| 静态路由 | 46 |
| 公开实体页面 | 42 |
| 搜索完整作者 | 7 |
| 搜索完整作品 | 14 |
| 公开地点/国家/文学空间 | 19 |
| 公开主题节点 | 2 |
| public review queue | 0 |
| Public Boundary | PASS |

最终提交后 CI Manifest 会记录每个文件的字节数与 SHA-256，并随工件提供总量复核所需的完整 inventory。

## F. Remaining Issues

- 37 条编辑性策展仍需 USER 集中审核，当前未公开；因此首页使用空间/形式/语言区域/时间四个事实型入口，时间线使用中性年代段。
- 李斯佩克朵、科塔萨尔因当前没有正式作家地点关系，聂鲁达因当前没有达到完整标准的作品入口，暂不作为完整公开作者页进入搜索/sitemap；研究数据和可独立成立的作品页保留。
- 《消逝的足迹》《光明世纪》《酒吧长谈》因当前公开导入主要依赖学术观点且线索不足，暂不进入完整公开作品范围；研究数据保留。
- Britannica 返回 403，三项学术站点超时或 DNS 失败；这只能说明自动访问受限，不能据此认定书目失效。
- 正式 HTTPS origin、Pages 设置、部署后网络性能均仍属 N4 后外部条件；本轮没有部署。
