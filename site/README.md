# 拉丁美洲文学地图 V2 完整测试站

这是静态优先的完整测试站。页面通过 `../data/v2/web/site_data.json` 读取 Web Data，不在前端写入研究事实；公共策展只消费 `auto_approved`，待审记录留在独立队列。

当前覆盖首页、完整地图、国家/地点/作者/作品页、研究缺口回退、关联节点页、分组搜索、作家/作品/背景时间线和研究证据层。

本地预览时请从项目根目录启动任意静态服务器，再打开 `/site/`。不要直接双击 `index.html`，浏览器会阻止它读取上级目录的数据 JSON。

正式静态部署候选包由 `python3 scripts/build_v2_deploy_bundle.py --output <dist> --origin <https-origin>` 生成；部署根目录版本会自动读取同级 `data/v2/web/site_data.json`。正式域名和部署动作需在 V2-N4 通过后执行。
