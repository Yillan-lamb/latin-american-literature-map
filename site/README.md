# 拉丁美洲文学地图网站

`site/` 是公共网站的设计与交互源码。公众页面只呈现文学内容、自然语言研究说明和可读书目；研究状态、数据字段、审核队列与发布治理不进入阅读界面。

网站保持静态优先，并由 Research Data、Geo Data、Curation Data 和独立 Presentation Layer 生成。开发时可从项目根目录提供静态文件并访问 `/site/`；正式候选应通过 `scripts/build_v2_deploy_bundle.py` 生成，因为该步骤会：

- 生成作家目录、作品目录、趣闻索引、作家详情、作品详情、国家、地点、阅读路径、搜索、时间线与 About 的静态可索引路由；
- 为各页写入 title、description、canonical 与 Open Graph 信息；
- 生成 sitemap 与 robots 文件；
- 压缩公共数据，并物理移除审核队列、状态字段和内部统计；
- 复制 Natural Earth 5.1.1 Admin 0 Countries 1:50m 衍生底图；运行时采用以 75°W / 11.5°S 为中心的 LAEA 投影，并把无公开文学内容的地区保留为非交互 L1 背景。

WCD-09 底图可按固定来源归档与 SHA-256 确定性重建：

```bash
python3 -m pip install -r requirements-wcd09.txt
python3 scripts/build_wcd09_basemap.py --source-zip /path/to/ne_50m_admin_0_countries.zip --check
python3 scripts/validate_wcd09_implementation.py
```

旧 `site/assets/latin-america-countries.geojson` 只作为回滚资产保留，不再是活动地图入口。

当前 [Pages 工作流](../.github/workflows/v2-pages.yml) 在 `main` 更新后自动部署开发预览，也支持手动触发。它先由 `build_v2_user_review_preview.py` 在临时输入中生成 USER_REVIEW 预览，再由 deploy builder 使用仓库 HTTPS origin 和 `--development-preview` 生成经过裁剪的 `dist/`；只有通过公开包与研究隔离检查的 `dist/` 被上传。

该开发预览为 271 个对象、288 条路由；默认策展输入生成的标准公开包为 127 个对象、139 条路由。两者的用途及字段边界见[开发预览说明](../docs/web/DEVELOPMENT_PREVIEW_BOUNDARY.md)。正式 Public Release 仍须 USER 单独开启并批准，不能将当前自动预览工作流视作正式发布批准。本目录本身不执行部署。
