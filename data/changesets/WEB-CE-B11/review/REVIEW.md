# WEB-CE-B11 独立复核

## 结论

本批研究范围、迁移结构、证据链和策展准入均通过；未发现需要返修的阻断项。

## 复核范围与方法

- fresh-context 读取 `PREFLIGHT.md`、`RESEARCH_CHANGE_SET.json`、`0016_web_ce_b11_luna_max.sql`、B11 README、`curation/PUBLIC_CONTENT.json` 及正式 master。
- 将正式 master 复制为 `/private/tmp/lalm-b11-review.sqlite`，使用项目规定的 `scripts/apply_migration.py` 先 dry-run、再正式重放；未写入正式 master、候选、迁移、Geo 或公开导出。
- 复核结果：migration dry-run 与正式重放成功（sha256=`bcfde33d73153aa4cce4b5cdd2824fd89b171d38ef9185a6539da66b668308a7`）；`scripts/validate_master.py` 返回 `verdict=pass`、`integrity_check=ok`、`foreign_key_errors=0`；独立 `PRAGMA integrity_check` 为 `ok`，`PRAGMA foreign_key_check` 为空。

## 来源与元数据

六个登记来源 `SRC-0225`—`SRC-0230` 均为 B 级、`access_pass`，canonical URL 与 research change set 逐项一致，机构/发布方元数据与标题一致：

| 来源 | 登记机构与支持范围 |
|---|---|
| `SRC-0225` | Biblioteca Nacional Mariano Moreno；Puig 身份、生卒年及 1968/1969/1976 书目 |
| `SRC-0226` | Buenos Aires 城市图书馆目录；Puig 作者及三部书目记录 |
| `SRC-0227` | Educ.ar／阿根廷教育部；Ocampo 身份、书目及 1937/1959/1961 |
| `SRC-0228` | 阿根廷文化部；Ocampo 身份、生卒年及故事集书目 |
| `SRC-0229` | Biblioteca Nacional Mariano Moreno；Arlt 身份、生卒年及三部小说 |
| `SRC-0230` | Biblioteca del Congreso de la Nación；Arlt 身份、出版年表及小说序列 |

本环境 DNS 不可用，无法进行实时 HTTP 重开；因此 URL 可达性采用研究包已记录的 `access_pass` 与本地 registry 元数据核对，不把网络限制误判为来源内容问题。

## 实体、作品层级与去重

- 临时库新增实体精确为 12 个：3 位 author（Puig、Ocampo、Arlt）与 9 个选定条目。
- 作品层级为 6 个 `work`、3 个 `collection`（Ocampo 的 `Viaje olvidado`、`La furia`、`Las invitadas`）。
- 数据库实体清单逐项与 change set 一致：`0287`—`0289`、`0293`—`0295` 为 `work`；`0290`—`0292` 为 `collection`。无新增 place，且原文题名保留为实体锚点；中文标签均标记为 provisional title。
- 与正式 master 的原文题名、中文名及作者—作品端点核对未发现重复实体或既有 `CREATED` 冲突。

## Facts、关系、卡片与证据

- B11 精确 53 facts（`V1-FCT-0732`—`V1-FCT-0785`），每条均有合法 subject、card、origin source，并各有 1 条 `fact_sources` 与 1 条 `card_facts` 链接。
- 精确 12 条关系：9 条 author→work/collection `CREATED`，3 条 author→既有阿根廷节点 `ASSOCIATED_WITH_PLACE`；无新增地点、坐标、`SET_IN` 或解释性关系。12 条关系各有 1 条 evidence，端点、关系类型与 evidence_count 一致。
- 精确 12 张卡片（3 author、9 work/collection）；卡片 source links 共 24 条，均指向本批六个来源。卡片与实体类型、作品层级 fact 一致。
- Arlt 的出生地在 change set 中有意留空，迁移未添加未经来源直接陈述的地点事实。

## Review metadata 与 curation

- change set 顶层 `review_metadata` 为 `origin_batch=WEB-CE-B11`、`reviewer=UNREVIEWED`、`review_status=PENDING`、`reviewed_at=null`；作者及作品 audit metadata 同样保持 pending/unreviewed，符合 fresh-context 审核前约束。
- `PUBLIC_CONTENT.json` 含 3 个 author、9 个 work 条目；递归检查 90 个状态字段，全部为 `user_review`，reviewer 全部为 `UNREVIEWED`。其 research/source/target 引用均可在本批实体、事实、关系和来源集合中解析。
- 无公开批准、无 Geo 写入、无 `places` 条目；所有文学史解释仍处于用户审核层。

## 最终判定：PASS

无修复清单。正式 master 仍未被本次复核写入。
