# WEB-CE-B12 修复后独立 Follow-up Review

## 复核范围

本次 fresh-context 复核读取 B12 `PREFLIGHT.md`、`RESEARCH_CHANGE_SET.json`、`0017_web_ce_b12_luna_max.sql`，并检查指定临时数据库 `/private/tmp/lalm-b12-remed.sqlite`。未修改 master、migration、候选或临时数据库；仅更新本文件。

## 临时数据库门禁

`python3 scripts/validate_master.py /private/tmp/lalm-b12-remed.sqlite` 返回 `verdict=pass`、`integrity_check=ok`、`foreign_key_errors=0`。独立执行 `PRAGMA integrity_check` 返回 `ok`，`PRAGMA foreign_key_check` 无结果。临时库包含 B12 修复后的 21 条 gap、815 facts、195 cards、233 relationships、238 sources。

## 四项返修核对

### 1. `SRC-0232` mapping/supports

事实和卡片映射已修复：`V1-FCT-0801.origin_id=SRC-0232`，`V1-CARD-0189` 的两个 sources 为 `SRC-0231`、`SRC-0232`。当前 JSON 与 `0017` migration 的 source supports 均明确列出 `Siete casas vacías / Seven Empty Houses`。

Follow-up 重建后已修复：指定临时库的 `SRC-0232.public_content_scope` 现在明确包含 `Pájaros en la boca, Siete casas vacías / Seven Empty Houses, and Distancia de rescate`，与当前 research change set、migration、`V1-FCT-0801` 及 `V1-CARD-0189` source mapping 一致。

### 2. `©2014` 限定与 `V1-GAP-0021`

通过。`V1-FCT-0796` 已改为 `bibliographic_note=版权页标注 ©2014（不等同于首版年份）`，`origin_id=SRC-0231`、`confidence=medium`，usage note 明确不作首版主张；实体 `V1-ENT-0299` 不再带裸年份。`V1-GAP-0021` 已持久化，`gap_key=V1-ENT-0299.first_publication_year`、`current_status=open_research`、`issue_code=HOLD-YEAR`。

### 3. `V1-GAP-0017..0021`

通过。五条 gap 均已写入临时库，分别覆盖 `V1-ENT-0300`、`0301`、`0304`、`0303` 与 `0299` 的 `first_publication_year`，状态均为 `open_research`，并保留来源依据及 downstream effect；与 JSON 的 B12-GAP-01/02/03 formal gap 映射一致。

### 4. `SRC-0240` metadata/locators

通过。临时库 `SRC-0240` 已记录 `publication_year=2011`、`page_count=254`、`format=web_pdf`，public scope 标明 `Mapocho. Revista de Humanidades, N°69, Primer Semestre de 2011`。`V1-EV-0255`—`V1-EV-0257` 均有 `locator=impreso p. 91; PDF p. 79`，source_id 均为 `SRC-0240`。

## 其他结构核对

- B12 仍为 3 位作者、9 个作品条目；无新增 place、坐标或虚构地点关系。
- 作品层级、作者—作品关系端点及 evidence 链在临时库中无悬空；12 条关系均有 evidence，source links 与 relationship sources 可解析。
- 中文展示名保持 provisional，未把当前版本日期、版权年或奖项年伪装成首版年。
- JSON 的 review metadata 仍为 `reviewer=UNREVIEWED`、`review_status=PENDING`、`reviewed_at=null`，符合审核前约束。B12 当前 curation 目录无可核验的公开策展条目，不能以 cards 的 `meets` 或关系 `accepted` 替代策展审核。

## Follow-up 验证

重建后的 `/private/tmp/lalm-b12-remed.sqlite` 再次通过 `scripts/validate_master.py`（`verdict=pass`、`integrity_check=ok`、`foreign_key_errors=0`）；独立 `PRAGMA integrity_check` 为 `ok`，`PRAGMA foreign_key_check` 为空。四项返修均已闭环，未发现新的阻断项。

## 最终判定：PASS
