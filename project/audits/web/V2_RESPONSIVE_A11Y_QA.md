# V2 响应式、可访问性与基础性能 QA

## 1. 任务信息

- 任务：`V2-S6-007` 响应式与可访问性优化
- 日期：2026-08-11
- 状态：`✅ DONE`
- 入口：`site/index.html`、`site/styles.css`、`site/app.js`

## 2. 响应式

- 桌面、平板和窄屏均有布局断点；卡片、研究面板、国家入口和时间线在窄屏转为单列；
- 移动端导航使用可见按钮展开/关闭；
- 地图画布在窄屏降低最小高度，节点标签限制宽度；
- 搜索表单在窄屏转为纵向排列，按钮保持可操作高度；
- 页脚和长文本在窄屏不依赖横向滚动。

## 3. 可访问性

- `main#app` 使用 `aria-live="polite"`，搜索结果数量单独使用 `aria-live`；
- 菜单按钮绑定 `aria-controls` 与 `aria-expanded`；
- 地图节点、国家按钮、地图筛选和搜索筛选均为可聚焦的原生按钮，并有 `aria-label` / `aria-pressed`；
- 链接、按钮、输入框和 `summary` 均有可见 `:focus-visible` 样式；
- `prefers-reduced-motion: reduce` 同时控制 CSS 动画和路由滚动行为；
- 空结果、404、数据加载失败和研究缺口均有明确文本状态。

## 4. 性能与资产

- 站点为静态 HTML/CSS/JS + 单一 Web Data JSON，无运行时后端；
- 无外部图片、字体包或未许可远程资产依赖；
- 页面不加载地图 SDK，不创建不必要的第三方网络请求；
- `site/app.js` 通过 `node --check`，数据构建与 Web QA 均通过。

## 5. 验证

- `node --check site/app.js`：通过；
- `python3 scripts/validate_v2_web_data.py`：`PASS`；
- `git diff --check`：通过；
- 站点入口和 Web Data 静态 HTTP smoke test：入口 `200`、Web Data `200`；schema `v2-web-0.2`、时间线 43、搜索索引 146。
