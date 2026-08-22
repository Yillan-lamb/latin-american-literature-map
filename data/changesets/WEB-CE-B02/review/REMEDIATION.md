# WEB-CE-B02 Reviewer 返修闭环

- 原始 Reviewer 判词：`REVISE`（见同目录 `REVIEW.md`）。
- 返修执行者：Luna Max Integrator；未改动 `PROJECT_CHARTER.md`，未改动历史 migration。
- 返修日期：2026-08-20。

## 已关闭的返修项

1. **来源可访问性与身份**
   - `SRC-0130` 改为法国国家图书馆《Miguel Ángel Asturias – Bibliografía》PDF：<https://www.bnf.fr/sites/default/files/2024-07/Miguel%20Asturias.pdf>。
   - `SRC-0132` 改为危地马拉圣卡洛斯大学人文图书馆 `Hombres de maíz` 书目页：<https://bibliohumanidades.usac.edu.gt/library/index.php?title=9408>。
   - 删除无法直接打开且无正式事实依赖的 `SRC-0131`，并清理其事实、关系和卡片来源引用。
   - `SRC-0140` 改为 Companhia das Letras 出版资料 PDF：<https://www.companhiadasletras.com.br/trechos/80129.pdf>。
   - Allende 生年、出生地和智利生平关联改挂可直接打开的官方时间线 `SRC-0134`；删除无直接支持的职业事实。

2. **事实边界**
   - `V1-FCT-0362`、`V1-FCT-0368` 改为可回溯的法国国家图书馆书目说明，移除 Nobel Facts/Biographical 的误称和复合文学解释。
   - 删除仅由来源国家级描述无法支持的阿斯图里亚斯具体出生城市事实 `V1-FCT-0358`。
   - `V1-FCT-0395` 明确记录出版者规范题名 `Capitães da Areia` 与 ABL 书目出现的 `Capitães de areia` 变体，不拆分作品实体。

3. **GeoNames**
   - 危地马拉国家节点 `V1-ENT-0182` 的坐标/分类来源统一改为 GeoNames `3595528`：<https://www.geonames.org/3595528/republic-of-guatemala.html>；同步变更集和 `PLACES_GEO.csv`。

## 复验

- 迁移副本启用 foreign keys 后：`PRAGMA integrity_check = ok`，`PRAGMA foreign_key_check = []`。
- 迁移副本结果：14 个实体、9 部作品、39 条事实、12 条关系、10 个来源、12 张卡片；无新增重复实体。
- 直接来源重新打开：BnF、USAC、Companhia PDF 均取得正文/目录信息；GeoNames 国家 URL 已改正。
- 解释性关系、文学运动、影响和强主题判断仍留空；中文版本学字段继续按计划留待后续。

## 最终批次门

`BATCH_PASS`

允许将 `WEB-CE-B02` 独立写入主库并进入本轮下一批。Sol 总审计仍可重新审阅本批来源与题名变体。
