# V2.0.0-rc.4 浏览器与性能 QA

- 日期：2026-08-13
- 依赖：Node 24.14.0；`@playwright/test` 1.62.1；Lighthouse 13.4.1；精确依赖见 `package-lock.json`
- 结论：本地最终 public bundle 通过；最终提交将在 CI 重跑并保存同格式工件。

## 浏览器结果

| 项目 | 尺寸 | 结果 |
|---|---:|---:|
| Chromium desktop | 1440×1000 | 7/7 PASS |
| Chromium mobile | 390×844 | 7/7 PASS |
| Firefox desktop | 1440×1000 | 7/7 PASS |
| WebKit mobile | 390×844 | 7/7 PASS |

覆盖首页/地图/国家/现实地点/虚构空间/作者/作品/搜索/时间线/来源/404/返回/导航/菜单/键盘焦点/内部语言/控制台错误/语义路由/metadata，并逐条打开 46 条 sitemap 路由检查动态渲染。失败时保存截图、视频和 trace；最终 28/28 成功的机器可读原始结果为 `artifacts/v2-rc4/browser/playwright-results.json`。

## Lighthouse

| 页面 | Performance | Accessibility | Best Practices | SEO |
|---|---:|---:|---:|---:|
| 首页 | 92 | 100 | 100 | 100 |
| 《佩德罗·巴拉莫》 | 93 | 100 | 100 | 100 |

原始 JSON 与 HTML 位于 `artifacts/v2-rc4/lighthouse/`，不是从 Markdown 手写得出。分数来自本地静态服务，不替代正式部署后的网络复测。
