# WEB-CE-B06 独立复核

## 结论

**REVISE**。本批的实体范围、去重结果、作品层级、关系端点方向、年份争议保留方式和数据库迁移完整性均可通过；但若干被标为 `access_pass` 的来源无法在 fresh-context 中直接重开，且事实与来源的对应存在明显越界。修复前不应进入正式 master。

## 审阅元数据

- `origin_batch`：`WEB-CE-B06`
- 审阅时间：2026-08-21（Asia/Shanghai）
- 审阅者：`LUNA-MAX-B06-REVIEW`（fresh-context independent reviewer）
- 复核基线：当前工作树的 B06 README、PREFLIGHT、`RESEARCH_CHANGE_SET.json`、`0009_web_ce_b06_luna_max.sql`、项目 schema 与 `scripts/validate_master.py` / `scripts/apply_migration.py`
- 迁移 SHA-256：`54433fb0f17051405f04223d58f400d10ae0eb200a4da7024d60381c76f82a43`

## 已通过项目

### 实体、去重与层级

- 3 位作者、9 部作品/作品集和 1 个尼加拉瓜国家节点均为新 ID；按规范化原文名、中文名及既有实体复核，没有与 master 的作者/作品碰撞。
- 作品层级正确：8 个 `collection`（Vallejo、Darío、Martí 的诗集/文集）与 1 个 `work`（`Nuestra América` essay），没有把 collection 当单篇作品，也没有把 essay 错写为 collection。
- 原文题名保留；中文名与 cards 对齐；候选实体和 cards 的 status 均保持 candidate/meets。未发现因中文展示名而改变版本学字段的情形。

### 关系、Geo 与缺口

- 9 条 `CREATED` 均为作者 → 作品；3 条 `ASSOCIATED_WITH_PLACE` 均为作者 → 国家，端点存在且方向正确，没有新增作品故事地点或虚构的 `INFLUENCED` 关系。
- 秘鲁 `V1-ENT-0124`、古巴 `V1-ENT-0096` 被正确复用；尼加拉瓜 `V1-ENT-0235` 为国家节点。新增 `PLACES_GEO.csv` 行不含经纬度，`country_polygon_required` 与 `real` 标记符合“无虚构坐标”要求。
- `Los heraldos negros` 保留 `1918/1919`、`medium/conflict`、`DISPUTED-YEAR` 和 `V1-GAP-0015`；没有静默选定单一年份，gap 的状态和 downstream effect 与 README 约束一致。

### Migration / FK

以 `data/master/V1_MASTER.sqlite` 副本重新执行当前 `0009_web_ce_b06_luna_max.sql`，事务应用成功；`validate_master.py` 返回 `verdict=pass`、`integrity_check=ok`、`foreign_key_errors=0`。迁移后新增范围为 13 entities、42 facts、12 relationships、10 sources、12 cards，关系 evidence_count 与 source/FK 链接完整。这里仅验证，不向 master 写回。

## 必须返修的来源与事实链

### P1：Vallejo 作品来源不可复核

当前 `SRC-0178` 的 URL：
`https://www.casadelaliteratura.gob.pe/page/88/?cat=qfgzfilxojqf`
直接打开返回安全 URL 错误，无法核验其所谓的三部作品题名、年份及 1918/1919 说明。当前 `SRC-0178` 被用于 `FCT-0536`—`FCT-0544`、`REL-0152`—`REL-0154` 及相应 cards。

可直接打开的官方替代材料为 Casa de la Literatura / PUCP PDF：
`https://www.casadelaliteratura.gob.pe/wp-content/uploads/2019/04/Historia-de-la-literatura-Vol-4.pdf`
其中正文直接列出 `Trilce (1922)`、`Los heraldos negros` 1919 印行并说明图像标作 1918、以及 `Poemas humanos` 1939。应新增该来源并批量重映射，或原位更新 `SRC-0178` 的 title/URL/scope（同时同步 JSON、migration 和所有 source refs），不得继续以失效旧页作为 `access_pass` 证据。

`SRC-0179`（
`https://www.casadelaliteratura.gob.pe/wp-content/uploads/2023/08/Bitacora_Ya-viene-el-dia_Cesar-Vallejo.pdf`
）直接内容超出复核工具可读取上限，故本次不能独立确认 `FCT-0525` 的“诗人、作家”。至少应提供可直接读取的替代页并将该事实收窄至已确认的“诗人”，或补充可复核证据。

### P1：Darío 的作者/地点映射越过来源正文

`SRC-0180`（
`https://www.memoriachilena.gob.cl/602/w3-propertyvalue-166318.html`
）直接正文确认 `Darío, Rubén, 1867-1916` 及书目，但没有当前事实所需的尼加拉瓜、Metapa 或“今 Ciudad Darío”正文支持。当前 `FCT-0528`、`FCT-0529`、`REL-0162` 以及 Geo 关系行引用 `SRC-0180`，证据不足。

直接可打开的 `SRC-0181`：
`https://www.memoriachilena.gob.cl/602/w3-article-3699.html`
正文明确写出 Rubén Darío 生于 Metapa、Nicaragua（1867），并写出 `Azul` 于 1888 年出版。应把国家/出生地事实、作者—尼加拉瓜关系及 Geo source ref 改接 `SRC-0181`；若无其他直接材料，不要保留“今 Ciudad Darío”括注。`FCT-0530` 的“记者”也未在该页直接出现，应收窄职业表述或补充来源。

`SRC-0182`（
`https://www.memoriachilena.gob.cl/archivos2/pdfs/MC0011355.pdf`
）正文可直接核验 `Prosas profanas` 1896 与 `Cantos de vida y esperanza` 1905；但 registry 把 `publication_year` 写成“持续更新（2026-08-21 访问）”，这不是该 PDF 的出版年。应改为真实出版信息或未知值（P2）。

### P1：Martí 的 Havana、职业与 Ismaelillo 不能由当前 refs 支撑

当前 `SRC-0183`：
`https://www.cervantesvirtual.com/obra-visor/los-monstruos-del-latinoamericanismo-arielista-variaciones-del-apetito-en-la-periferia-neocolonial/html/1cbb2714-8b3b-407a-adb0-42b16db79e0a_13.html`
可直接打开，正文能确认 Martí 的 1853–1895 及古巴思想语境，但没有 Havana 出生地和本批目标作品书目。`SRC-0184`：
`https://www.cervantesvirtual.com/descargaPdf/jose-marti-a-proposito-de-su-ismaelillo/`
直接读取发生 Unicode 解码错误。

可直接打开的 Cervantes Virtual 作者页：
`https://www.cervantesvirtual.com/portales/traducciones_hispanoamericanas/traductores/`
正文写出 `José Martí (La Habana, 1853 – ... 1895)`、诗人/作家/政治人物等身份，并列 `Ismaelillo (1882)`、`Versos sencillos (1891)`。应将 `FCT-0534`、`FCT-0535`、`FCT-0554`—`FCT-0556`、`REL-0158`、Martí 的地点关系和 cards 的 source refs 接到该直接来源；职业至少移除当前来源不能直接支持的“记者”，不得把 essay 中的思想语境扩写成职业事实。

`SRC-0185` 年表页可直接核验 `Ismaelillo` 1882、`Versos sencillos` 与 `Nuestra América` 1891，因此 `FCT-0557`—`FCT-0562` 及 `REL-0159`—`REL-0160` 的题名/年份链条可保留。

### P2：GeoNames 需再次建立可访问的直接证据

`SRC-0186` 的 GeoNames URL：
`https://www.geonames.org/3617696/republic-of-nicaragua.html`
本次直接请求为 cache miss/internal error。Geo 行自身没有虚构坐标，节点类型和 polygon 约束通过；但在最终入 master 前应重新直接打开该 URL，或换用稳定的官方国家页并同步 source registry，避免把无法访问的 GeoNames 页标为 `access_pass`。

## 最小返修清单

1. 为 Vallejo 三部作品换成可直接读取的官方 Casa/PUCP 材料，并同步 `SRC-0178`（或新增 source）及所有 facts/cards/CREATED/gap source refs；处理 `SRC-0179` 的不可读状态并收窄无直接依据的职业事实。
2. 将 Darío 的国家、Metapa、作者—尼加拉瓜关系及 Geo source ref 改接 `SRC-0181`；删除或另证“今 Ciudad Darío”，收窄“记者”；修正 `SRC-0182.publication_year`。
3. 将 Martí 的 Havana、职业、Ismaelillo 事实/关系/card refs 改接可直接读取的 Cervantes Virtual 作者页；继续用 `SRC-0185` 支撑另外两项 1891 书目事实。
4. 重新直接验证或替换 GeoNames 来源；完成后重新执行 migration 与 `validate_master.py`，再提交新的 Review。

## 最终判定

**REVISE**：结构和迁移门禁通过，但来源可访问性与 source-to-fact 对应尚未达到本批 README 的“直接来源”门槛。未修改候选 JSON、正式 master、migration 或 Geo 文件。

---

## Follow-up 复核（2026-08-21）

### Follow-up 范围与结论

针对最小返修重新读取了当前 `RESEARCH_CHANGE_SET.json`、migration 和 `/private/tmp/lalm-b06-remed.sqlite`，并直接重开以下关键来源：

- Casa/PUCP PDF `SRC-0178`：`https://www.casadelaliteratura.gob.pe/wp-content/uploads/2019/04/Historia-de-la-literatura-Vol-4.pdf`。正文直接列出 `Trilce (1922)`，说明 `Los heraldos negros` 图像标 1918 但实际 1919 出现，并在年表列出 `Poemas humanos` 1939；1918/1919 gap 可继续保留。
- Memoria Chilena `SRC-0181`：`https://www.memoriachilena.gob.cl/602/w3-article-3699.html`。正文直接写出 Darío 生于 Metapa、Nicaragua（1867），以及 `Azul` 1888；Darío 的国家、出生地、职业和国家关系改接正确。
- Cervantes Virtual `SRC-0185`：`https://www.cervantesvirtual.com/obra-visor/las-letras-hispanoamericanas-en-el-siglo-xix--0/html/ff2fae94-82b1-11df-acc7-002185ce6064_5.html`。年表直接列出 Martí 的 `Nuestra América`、`Versos Sencillos`（1891）。
- Cervantes Virtual `SRC-0187`：`https://www.cervantesvirtual.com/portales/traducciones_hispanoamericanas/traductores/`。正文直接写出 Martí 的 La Habana、1853–1895、诗人/作家/政治人物以及 `Ismaelillo (1882)`、`Versos sencillos (1891)`。
- GeoNames `SRC-0186`：`https://www.geonames.org/countries/NI/nicaragua.html`。页面直接显示 Nicaragua、ISO `NI`，没有要求虚构坐标；Geo 行的国家节点约束仍正确。
- 另外重开 `SRC-0183` 与原 Darío 作者页；前者直接写出“cubano José Martí (1853–1895)”，后者直接确认 `Darío, Rubén, 1867-1916`。当前保留它们支撑的作者年份/国家语境范围没有越界。

副本 `lalm-b06-remed.sqlite` 的 source registry 与候选 JSON 在 0177–0187 的 title/URL/access 状态逐项一致；`validate_master.py` 返回 `pass`、`integrity_check=ok`、`foreign_key_errors=0`。事实、`fact_sources`、关系 evidence/source refs 已按修复方案接入：0179/0184 不再被 facts 或 relationship evidence 引用，Martí 的 Havana/职业/Ismaelillo 使用 0187，Darío 国家/Metapa/Geo 关系使用 0181。

**Follow-up 结论仍为 REVISE，尚不能 PASS。**

### 未通过的最小项目

1. `card_sources` 仍有一条正式使用中的 access-limited 来源：`V1-CS-0218` 将 `SRC-0179` 挂到 `V1-CARD-0112`，`usage_status='used'`，且 `bibliographic_support='yes'`、`research_support='yes'`。这违反返修目标中“`SRC-0179` 标 access_limited 且不再作为正式 refs”；应删除该 card-source 行，或改接已直接复核的 `SRC-0177`/`SRC-0178`，并同步候选矩阵（不得仅保留 access_limited 的 used ref）。
2. `V1-CARD-0115` 有 `V1-CS-0225`、`V1-CS-0226` 两条完全相同的 `(card_id, source_id) = (V1-CARD-0115, SRC-0178)`；`V1-CARD-0117` 同样有 `V1-CS-0228`、`V1-CS-0229` 重复对。虽然主键不同而使 FK/完整性门禁通过，但不符合 card-source 去重，应各删除一条并重新跑 migration/validate。

上述两项修复后，source-to-fact、source-to-card、source-to-relationship、Geo、作者/作品层级及 1918/1919 gap 均可升级为 PASS；本次 follow-up 未修改候选 JSON、正式 migration、master 或 Geo 文件。

## Final follow-up verdict（2026-08-21）

已核对最新 `/private/tmp/lalm-b06-remed.sqlite`：`validate_master.py` 返回 `pass`，`integrity_check=ok`，`foreign_key_errors=0`，`card_sources=231`。B06 卡片范围 `V1-CARD-0112`—`V1-CARD-0123` 已无 `(card_id, source_id)` 重复；`SRC-0179`、`SRC-0184` 均无 card-source、fact-source 或 relationship-evidence 正式引用。B06 的 12 条关系 source refs 仍分别正确指向 `SRC-0178/0181/0182/0187/0185/0177/0183`，端点与方向未变。

**最终结论：PASS。**

审阅者：`LUNA-MAX-B06-REVIEW`；`origin_batch=WEB-CE-B06`；审阅日期：2026-08-21。以上为 review 记录追加，不修改候选 JSON、migration、master 或 Geo 文件。
