# WEB-CE-B02 Preflight

## 基线

- 基线分支：`codex/web-ce-b02-b05-luna-max`，起点为 B01 Sol 审计分支 `e804f4e`。
- 主库：`data/master/V1_MASTER.sqlite`。
- 主库验证：`scripts/validate_master.py` PASS；`PRAGMA integrity_check` 为 `ok`；foreign-key check 为 0。
- 基线计数（由 `e804f4e:data/master/V1_MASTER.sqlite` 机器提取）：entities 167；facts 354；relationships 101；sources 128；content_cards 63；card_sources 116；relation_holds 50；gaps 13。

## 路线图与去重

计划 Batch 02 为：

1. Miguel Ángel Asturias（危地马拉）：`El Señor Presidente`、`Hombres de maíz`、`Leyendas de Guatemala`；
2. Isabel Allende（智利）：`La casa de los espíritus`、`De amor y de sombras`、`Eva Luna`；
3. Jorge Amado（巴西）：`Dona Flor e seus dois maridos`、`Gabriela, cravo e canela`、`Capitães da Areia`。

在最新主库中按原文题名、作者原文名、中文名和 `CREATED` 关系复核：三位作家及上述九部作品均不存在；未发现可复用的同名实体或关系。既有智利地点 `V1-ENT-0123` 可复用。巴西原有 `V2-GEO-BR` 是里约父级技术节点，本批新增正式巴西国家节点以避免把技术节点当研究实体；该技术节点不删除。

## 本批调整

- 仍执行 3 位新作家 × 3 部作品，不强行加入“已有作家追加作品池”。
- 只入库出版年份、实体层、书目说明、作者生平基础事实和 `CREATED` / 作者国家关联；不入库未经充分来源支持的影响、文学运动、强主题或情节关系。
- `Leyendas de Guatemala` 明确作为短篇/传说汇编 `collection`；其余八部按路线图作为 `work`，如 Reviewer 认为某体裁证据不足，可仅下调/移除 `genre_or_form`，不影响实体保留。
- 中文名称采用路线图中的展示名；没有额外追查译者、出版社、ISBN，不构成 HOLD。
