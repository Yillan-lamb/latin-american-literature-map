# 拉丁美洲文学地图 V2.0.0-rc.4 候选说明

> 当前状态：独立终审返修候选；`V2-N4 = USER_REVIEW`，`release_state = pending_v2_n4`。未部署、未创建 tag 或 GitHub Release。

rc.4 保留 Research / Geo / Curation / Web Data 架构，修复未审批策展内容公开、作者/作品完整页标准、关系搜索、语义路由、候选身份、部署字节验证和可复现浏览器 QA。

公众候选仅索引达到最低产品标准的 7 位作者、14 部作品、19 个国家/地点/文学空间和 2 个正式主题。37 条编辑性策展继续等待 USER 审核；首页和时间线暂用可由正式事实机械支持的入口，不以删状态或改状态绕过审核。

静态路由具备页面级 title、description、canonical、绝对 `og:url` 和 sitemap。`V2 CI` 绑定最终 PR head，构建一次 dist、逐字节生成脱离式 Manifest、验证同一目录并保存浏览器/Lighthouse 原始工件。正式 Pages 工作流继续要求 USER 批准状态和 HTTPS origin。

已知限制见 `docs/V2_RC4_REMEDIATION_REPORT.md`：两位作者与三部作品因页面依据不足暂不进入完整公开索引；4 个来源自动访问受限或超时；37 条策展尚待集中审核。
