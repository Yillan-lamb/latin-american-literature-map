# V2.0 静态部署候选验证

## 1. 任务信息

- 任务：`V2-S8-003` 生产部署验证
- 日期：2026-08-11
- 状态：`✅ DONE（候选包验证；正式部署待 N4）`
- 候选平台：GitHub Pages 静态部署
- 工作流：`.github/workflows/v2-pages.yml`

## 2. 部署设计

- 工作流目前只允许 `workflow_dispatch`，不会因普通分支提交自动公开；
- 运行前必须配置仓库变量 `V2_SITE_ORIGIN`，确认 HTTPS origin 后才生成 sitemap/robots；
- Web Data 在工作流中用固定冻结时间重新构建，并通过 `validate_v2_web_data.py`；
- 工作流随后执行 release manifest SHA-256 校验，并要求 `release_state=approved_v2_n4`；因此 N4 前的 pending 候选不能部署；
- 部署包将 `site/` 复制为站点根目录，并将公开 Web Data 放到 `data/v2/web/`；
- `review_queue` 在部署副本中移除；
- `404.html` 复用站点入口，兼容 hash 路由；
- Actions 使用 Pages 官方构建、上传和部署动作，不需要项目密钥。

## 3. 本地候选验证

使用 `scripts/build_v2_deploy_bundle.py` 生成根目录候选包后，已验证：

| 路径 | HTTP |
|---|---:|
| `/` | 200 |
| `/index.html` | 200 |
| `/404.html` | 200 |
| `/app.js` | 200 |
| `/styles.css` | 200 |
| `/data/v2/web/site_data.json` | 200 |

公开副本 schema 为 `v2-web-0.2`，不含 `review_queue`。

当前 hash 路由的 sitemap 只列部署根 URL；`#/search`、`#/timeline` 和 `#/about` 是浏览器片段，不作为服务端 URL 写入 sitemap。

## 4. 尚待 N4 的外部条件

- 仓库所有者配置并确认 `V2_SITE_ORIGIN`；
- GitHub Pages 项目设置可用；
- USER 在 `V2-N4` 明确批准正式公开发布；
- N4 通过后才执行正式 commit、tag、Pages workflow 和公开版本记录。
