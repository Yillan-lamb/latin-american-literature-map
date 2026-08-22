# WEB-CE-B02 QA

## 数据层

- `python3 scripts/validate_master.py data/master/V1_MASTER.sqlite`：PASS
- `PRAGMA integrity_check`：`ok`
- `PRAGMA foreign_key_check`：空结果
- 迁移副本启用 foreign keys 演练：PASS
- B02 来源、事实、关系、卡片引用和实体端点：PASS
- B02 原文题名查重与 `subject + relation_type + object` 查重：PASS
- `Capitães da Areia` 题名变体保持单一实体：PASS

## Web Data / 公共边界

- `python3 scripts/build_v2_public_content.py`：PASS
- `python3 scripts/validate_v2_content_quality.py`：PASS
- `python3 scripts/build_v2_web_data.py --generated-at 2026-08-20T00:00:00+08:00`：PASS
- `python3 scripts/validate_v2_web_data.py`：PASS
- 内部临时预览 bundle 构建：PASS（86 files / 78 routes）
- 公共 bundle validator：PASS（public_entities 74；forbidden_keys 为空）
- 公共 UI 扫描：PASS（79 HTML）
- deterministic rebuild：PASS；生成时间固定为 `2026-08-20T00:00:00+08:00`

## 浏览器

- Chromium desktop + mobile 核心路径：`npm run qa:browser:chromium` → **28 passed**
- 覆盖首页、Search、新增 Asturias/Allende/Amado 作者页、新增代表作品页、国家页、地图、时间线和 Evidence 路径。
- 本批未修改地图、路由或通用页面模板，因此未扩展 Firefox/WebKit；浏览器测试使用本地临时预览，不涉及生产部署。

## QA 覆盖修正

`tests/browser/public-product.spec.cjs` 原有国家数量和 `example.invalid` sitemap 域名硬编码会在数据增长后失真。本批改为从 Web Data 动态统计国家代码，并解析任意 sitemap URL 的 pathname；这是测试覆盖修正，不是单个作者特例。

## 工作区卫生

- `git diff --check`（本批拟提交路径）：PASS
- 未提交任何 `PROJECT_CHARTER.md`、secret、绝对本地路径或生产发布元数据。
- 根工作区中已有的 `work/external-ai/deliveries/` 改动与 `artifacts/v2-rc5/` 未纳入本批提交。
