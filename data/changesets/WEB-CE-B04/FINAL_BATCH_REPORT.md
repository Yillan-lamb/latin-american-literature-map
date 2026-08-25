# WEB-CE-B04 Final Batch Report

## Gate

`BATCH_PASS`

- 执行模式：Luna Max；基于 `WEB-CE-B03` commit `97fe225` 的最新主库重新 Preflight。
- fresh-context Reviewer 初审：`REVISE`；Integrator 完成差量整改后 follow-up：`PASS`。
- 正式迁移：`data/master/migrations/0007_web_ce_b04_luna_max.sql`。
- 未修改 `project/governance/PROJECT_CHARTER.md`；未执行 push、PR、release、tag 或部署。

## 实际增量（B03 → B04）

| 层 | 增量 | B04 累计 |
|---|---:|---:|
| entities | 13（3 authors、9 works、1 country） | 208 |
| facts | 42 | 476 |
| relationships | 12（9 CREATED、3 author-country） | 137 |
| sources | 12 | 162 |
| content cards | 12 | 99 |
| card_sources | 22 | 180 |
| relationship evidence | 12 | 161 |
| relation holds | 0 | 51 |
| research gaps | 1（V1-GAP-0014） | 14 |
| Geo places | 1（巴拉圭） | 30 |
| Geo relations | 3 | 39 |
| public content records | 13（3 authors、9 works、1 place；技术节点继续投影） | 22 authors / 51 works / 24 places |
| formal curation entries | 0；保留既有策展门禁 | 54 |

## Research / Review

- Bioy Casares、Roa Bastos、Horacio Quiroga 三位作者及九部作品均通过最新主库查重。
- 解释性文学史关系、作品故事地点和虚构空间没有越过直接证据门槛。
- `La invención de Morel` 的 1940/1941 冲突由 `V1-FCT-0443` 双来源和 `V1-GAP-0014` 可追溯记录；当前沿用规范时间线的 1940，但降为 medium confidence，公开文案明确提示待 Sol 复核。
- `Cuentos de amor de locura y de muerte`、`Cuentos de la selva`、`Los desterrados` 已统一为 `collection`，包括实体、`entity_layer` facts、cards 和 Web 投影。
- 中文展示名继续以读者可读性为目标；译者、出版社、ISBN 和中文出版年份未作为本批准入门槛。

## Geo / Product

- 新增巴拉圭国家节点 `V1-ENT-0210`，使用 GeoNames 3437598；不虚构中心点坐标。
- 新增三条作者—国家 Geo 关系：Bioy→阿根廷、Roa→巴拉圭、Quiroga→乌拉圭。
- 没有新增虚构空间，也没有给虚构空间赋现实坐标。
- Web Data 已重新生成；新增作者、作品、巴拉圭国家页和代表作品页均进入搜索/路由/时间线投影。
- 公开文案中的内部字段名已在 QA 发现后改为面向读者的“研究缺口”表述。

## QA

- `validate_master.py`：PASS；`PRAGMA integrity_check`：ok；foreign keys：0。
- 内容质量 validator（review package）：PASS，22 authors / 51 works / 24 places / 51 distinct reading approaches / 10 reading paths。
- Web Data rebuild + validator：PASS；208 entities / 99 cards / 476 facts / 137 relationships / 14 gaps / 162 sources / 30 places / 39 place relations。
- Public deploy bundle：PASS；112 files / 104 routes；public bundle validator 与 UI text scanner 均 PASS。
- Chromium desktop + mobile：28/28 PASS；覆盖 B04 作者、作品、巴拉圭路线以及 sitemap 全量页面治理语言扫描。
- Python syntax、Node syntax、Geo CSV audit、`git diff --check`：PASS。

## HOLD / research_gap

- `V1-GAP-0014`：Bioy《莫雷尔的发明》1940/1941 首版年份冲突，owner decision `SOL_REVIEW`。
- 强文学史关系、文学运动归属、影响关系、强主题判断和具体作品场景仍按本批 HOLD；未为数量目标强行入库。
- 九部作品中文版本学字段继续按项目政策留作可选补充，不构成 Research HOLD。

## Next handoff

B04 已闭环并提交；下一批必须基于 B04 最新主库重新 Preflight。Sol 审计时优先重开 `SRC-0153`、`SRC-0154`、`V1-FCT-0443` 与 `V1-GAP-0014`，并抽查三个 Quiroga collection 的 Web/Research 一致性。
