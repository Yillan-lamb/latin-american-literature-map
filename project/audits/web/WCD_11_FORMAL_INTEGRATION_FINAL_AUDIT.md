# WCD-11 正式集成最终独立审计（TASK-128 / PR #37）

- 日期：2026-09-24
- 审查对象：`codex/wcd-11-formal-integration` 相对 `main @ 6e1d882` 的正式 `site/`、构建器、素材、测试及治理差量；不把已关闭的 #36 preview 当作生产输出。
- 结论：**INDEPENDENT REVIEW PASS / READY_TO_MERGE**。经审计的代码 head `32a2321` 两项适用 CI 已成功；最终治理收口提交仍须在合并前重新核对该提交的适用 CI、无冲突和无未解决 Review。
- BLOCKER：0（下述两项最小修复后）；NON-BLOCKING：1（首页 LCP）。

## Gate A · 视觉与无障碍

无 development-preview 横幅的正式子路径包生成 139 条 sitemap 路由。`qa_wcd11_visual_matrix.cjs` 在 15 类路由的 1440×900 与 390×844 生成 30 张截图，外加 320px 宽度、图片及错误检查，共 45/45 PASS；人工逐类复核了生成图，首页无中心星形罗盘、时间线及目录、About、国家／现实地点／虚构空间／阅读路径／explore node／404 未见旧模板、遮挡或断图。缩放专项以 720 CSS px、DPR 2 模拟 1440 物理宽度下 200% zoom，首页、作者、作品、目录、时间线、About、地图 7/7 PASS；修复了普通目录页头部负边距造成的 2px 横向溢出。聚焦菜单可由 Enter 展开，焦点边框可见；完整浏览器矩阵验证地图键盘选择、时间线方向键、搜索／筛选与 `details/summary`。

`prefers-reduced-motion: reduce` 生效；现有动画仅为非实质过渡，无强制长时运动。主要实色 token 对比度：正文／纸张 13.09:1、次级文字／纸张 6.00:1、强调红／纸张 6.75:1、白字／深红 9.55:1。Lighthouse 首页及作品页 Accessibility 100；纸纹上的局部文字仍应在未来真实设备回归中持续留意，但未见本次明显低对比阻断。

## Gate B · 正式 Lighthouse

同一 production build、移动模拟的最新报告位于可再生的本地 `artifacts/v2-rc5/lighthouse/`（不提交生成 HTML/JSON）。

| 页面 | Performance | Accessibility | Best Practices | SEO | LCP | CLS |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| 首页 | 75 | 100 | 100 | 100 | 12.0 s | 0 |
| 作品详情 | 79 | 100 | 100 | 100 | 5.7 s | 0 |

旧报告的首页 LCP 约 12.7 s；本次为新有效报告，并非继续 `NOT_VERIFIED`。LCP 元素是约 181 KB 的首页主拼贴图，已在初始 HTML preload，`fetchpriority=high`、非 lazy，初始请求可发现；TBT 0 ms，主线程工作约 0.5 s，关键请求链无外部服务依赖。图片型文化站点的首屏 LCP 仍偏慢，但未发现异常大 LCP 图、错误优先级、重复加载或 JS/地图阻塞首屏的工程缺陷。依 DEC-068 作为本次合并非阻塞性能债接受，不宣称达到未来 Public Release 性能预算。

## Gate C · 素材来源与许可

独立核对正式肖像的 Commons 原页，重点抽查此前未逐页复核的博尔赫斯、科塔萨尔、聂鲁达、略萨、鲁尔福、李斯佩克朵、吉马朗埃斯·罗萨、比奥伊·卡萨雷斯、若热·亚马多、多诺索和萨瓦托；核对人物、作者／馆藏、Public Domain 或 CC 标签与站内可见署名。萨瓦托原页明确提示美国版权可能恢复，已撤回该图及映射，正式作家页保留文字占位、公开包返回 404；多诺索及罗萨署名按原页细化。AST-024 继续不入包。7 项 editorial（含无中心星形的罗盘 v2）为项目自有 AI 辅助生成／编辑装饰，不冒称历史地图或外部照片；正式地理图层仍是 Natural Earth。22 张正式肖像均有 fallback；CC 肖像可见缩放／色调处理说明。详见 `docs/web/WCD_11_ASSET_ADMISSION.md`。

## Gate D · 代码、数据与行为

独立复核 `site/app.js`、`scripts/build_v2_deploy_bundle.py`、`site/styles.css` 和本 PR 测试 diff。肖像缺图文字 fallback 不猜身份，公开数据文本在 HTML 中转义；首页 Hero 先于 Web Data 和 Natural Earth 完成时可见，地图失败只影响地图区域；作品集进入作品档案路由，稳定路由与子路径、canonical 和预加载资源由正式构建器生成。搜索未截断索引；时间线类型与年代窗口按公开事件筛选、明确“文学爆炸年代”不是作者流派归属。事件绑定只作用于当次渲染节点；全站路由、404、分页、地图、来源展开在四浏览器测试中有行为断言。

最终本地门禁：Web Data 确定性重建与 validator PASS；public bundle validator PASS（127 公开实体、139 sitemap、82 则趣闻、无审核字段泄漏）；WCD-09 权威底图 `--check` PASS，资产 SHA-256 `9a225c6b…`、L1 48／L2 13／背景 35；Playwright Chromium desktop/mobile、Firefox desktop、WebKit mobile **120 PASS / 8 EXPECTED SKIP**；视觉 45/45；200% 7/7；前端语法与 diff 检查 PASS。经审计代码 head `32a2321` 的 `development-baseline-integrity` 与 `web-pr-browser-smoke` 均 SUCCESS；`release-integrity`、`rc-browser-matrix` 为当前 Development PR 的 EXPECTED SKIP，不人为触发 release/RC gate。

本轮 diff 不修改 Research Master、Schema、Curation 审核结果或公开收录数量。Web minor `0.6.0 Development` 仅为产品版本元数据；生成器重建输出与当前 Web Data 字节一致。`project/internal/TASKS.md` 和 `DECISIONS.md` 是本地 ignored 权威源，已按 TASK-128 / DEC-068 同步，不复制进 Git。Charter 冻结且规则未变，故不修改；README、CHANGELOG、WCD-11 Spec 与素材台账按各自职责收口。Public Release 独立暂停，不创建 Tag、Release 或部署。
