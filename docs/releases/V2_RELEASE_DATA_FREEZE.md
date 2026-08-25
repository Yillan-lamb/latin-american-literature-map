# V2.0 发布候选数据冻结与公开边界

> **Historical**：本文件与既有 Manifest 保留为 Web 0.1.0 形成前的发布候选审计记录。自 2026-08-17 起，`V2-PUBLIC-RELEASE = PAUSED`；以下生产部署门禁不再是当前任务，待 USER 未来重新开启 Public Release Gate 时再使用。

## 1. 任务信息

- 任务：`V2-S8-001` 发布前数据与内容冻结
- 日期：2026-08-11
- 候选版本：`V2.0.0-rc.2`
- 状态：`✅ DONE`
- 冻结清单：`data/v2/release/V2.0.0_RELEASE_MANIFEST.json`

## 2. 冻结范围

本候选包固定使用：

- V1 主数据库 `data/master/V1_MASTER.sqlite`；
- V2 地图 `PLACES_GEO.csv`、`PLACE_RELATIONS.csv`；
- V2 三张策展表；
- Web Data `v2-web-0.2` 及其 manifest；
- `site/` 的 HTML、CSS、JS 和说明文件。

冻结清单为 15 个发布输入文件，逐项记录文件大小、SHA-256、构建统计和当前 Git HEAD。除数据和站点文件外，清单还锁定 Web Data 构建器、部署包构建器和 Pages 工作流。后续任何数据、策展、前端或部署输入修改都必须重新生成候选清单，不得静默替换冻结文件。

## 3. 策展冻结规则

- 公共策展只允许 `auto_approved`；
- 4 条 hold 文案和 2 条待审推荐不进入公共部署 Web Data；
- research gap、无卡关联节点、未确认地点分类继续保留原状态；
- 虚构空间仍不生成现实坐标。

## 4. 公开部署包

`scripts/build_v2_deploy_bundle.py` 从冻结 Web Data 构建根目录静态包：

- 将站点文件（含 `site/README.md`）放到部署根目录；
- 生成 `404.html`；
- 从公开数据副本移除 `review_queue`，保留 `auto_approved` 公共策展层；
- 只有在传入已确认 HTTPS origin 时才生成 `sitemap.xml` 与 `robots.txt`；当前 hash 路由 sitemap 只登记真实文档 URL，不登记 `/search` 等不存在的服务端路径。

部署前还必须执行 `python3 scripts/build_v2_release_manifest.py --verify --require-release-state approved_v2_n4`。因此 `pending_v2_n4` 候选无法被 Pages 工作流公开部署。
