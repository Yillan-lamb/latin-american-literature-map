# WEB-CE-B03 Preflight

## 基线

- 基线 commit：`fd325ea`（已完成并独立固化的 WEB-CE-B02）。
- 主库：`data/master/V1_MASTER.sqlite`。
- B02 后机器计数：entities 181；facts 393；relationships 113；sources 138；content_cards 75；card_sources 134；relation_holds 50；gaps 13。
- 主库在进入 B03 前通过 `validate_master.py`、`PRAGMA integrity_check` 和 foreign-key check。

## 路线图与查重

计划 Batch 03 为：

1. Juan Carlos Onetti（乌拉圭）：`La vida breve`、`El astillero`、`Los adioses`；
2. José Donoso（智利）：`El obsceno pájaro de la noche`、`El lugar sin límites`、`Coronación`；
3. Ernesto Sabato（阿根廷）：`El túnel`、`Sobre héroes y tumbas`、`Abaddón el exterminador`。

在 B02 最新主库中按作者原文名、作品原文题名、中文展示名和 `CREATED` 关系逐项复核：三位作者、九部作品均不存在；既有正式阿根廷节点 `V1-ENT-0001` 和智利节点 `V1-ENT-0123` 可复用；尚无正式乌拉圭国家节点。B03 新增乌拉圭国家节点，不创建出生地或一般生平地点。

## 本批执行范围

- 新增 3 位作者、9 部作品、1 个正式乌拉圭国家节点和 1 个虚构文学空间 Santa María。
- 只入库作者生卒/国家/来源直接身份事实、作品实体层、首版年份、书目说明、`CREATED`、作者—国家关联；`La vida breve → Santa María` 的 `SET_IN` 线索因语义证据不足转为关系 HOLD。
- Onetti 的 CVC chronology 与 Santa María 页面明确将 `La vida breve` 与 Santa María 的建立/平行文学空间相连；这支持虚构空间分类，但不关闭 `SET_IN` HOLD。Santa María 不写现实经纬度。
- 中文展示名采用当前可读的候选名称；题名存在多个中文版本的对象保留原文锚点，译本元数据继续留待后续版本学轮次。
- 不建立“代表”“奠定”“影响”“文学运动”或强主题关系；相关线索留在策展或 HOLD。
