# V2.0.0-rc.4 静态部署候选验证

部署工作流仅允许手动触发，并要求仓库内 release control 已由 USER 明确改为 `approved_v2_n4`，同时配置确认后的 HTTPS `V2_SITE_ORIGIN`。当前 `pending_v2_n4` 会被拒绝。

发布链路固定为：从当前完整 SHA checkout → 确认 Web Data 可重复重建 → 构建唯一 `dist/` → public UI/route/sitemap/boundary 扫描 → 对 Git blob、工作树和该 `dist/` 的实际字节生成脱离式 Manifest → 验证 → 上传同一个 `dist/`。验证后没有第二次构建。

候选使用真实静态目录路由，不再使用 hash 路由。每个公开实体的 URL 由原文 slug 与稳定实体 ID 组成，避免中文主题转写为空导致碰撞；canonical、`og:url`、搜索结果与 sitemap 共用 Web Data 的 `public_route`。

本地 rc.4 public bundle 为 54 个文件、46 条静态路由、42 个公开实体页面；Public Boundary、内部语言、路由唯一性和语义映射通过。最终文件 inventory 与 SHA-256 由最终提交的 CI Manifest 工件给出。
