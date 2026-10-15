# FINAL_REENTRY 审计记录

本检查点完成 TASK-127 的 W03 版本注记与直接归属回补，并以受控附件方式记录 Amado 对既有作品的参与关系。候选内容属于研究数据；本次未扩大公开范围。

## 实际新增与保全

普通候选使用 task `TASK-127`、batch `WCD-10-B05`，固定作者名单为 Paz、Asturias、Allende。新增作品为 W03（`V1-ENT-0798`），新增三项事实 `V1-FCT-2690`—`V1-FCT-2692`，Paz→W03 的普通 CREATED 关系 `V1-REL-0771`，新来源 `SRC-0797`（ELEM S18），Research 卡 `V1-CARD-0824`，以及作品研究缺口 `V1-GAP-0691`。原子首发年未写入事实；既有 `V1-GAP-0123` 未变。没有为本批登记 S07 或 S12 候选来源。

受控追加记录 Amado→既有 `V1-ENT-0591` 的参与关系 `V1-REL-0772`，复用既有 `SRC-0652`，新增证据 `V1-EV-1156`。`V1-ENT-0591` 的既有实体类型 `work` 保持不变；增量仅限关系、来源连接和证据。

本次数据库为 796 entities、2686 facts、770 relationships、795 sources、824 cards、691 gaps；WCD-10 B01—B21 加本次回补累计新增419 objects、1659 facts、436 relationships。TASK-127 尚待终审，WCD-10 umbrella 仍为 `IN_PROGRESS`。

## 数据库与审查绑定

- 前置数据库 SHA-256：`559b1858b7b5e647b4b313f841be8d2960cf3a5eacf2a2dd92c6161668da706c`
- 完成后数据库 SHA-256：`5a410850fed0ffa936db1de135e3872fa1f53a5a3a3b294927eb902db2b3b12c`
- Migration：`0057_wcd10_final_reentry.sql`，SHA-256：`798f243e820dc6ac0093642279ec751b94888acfef5cecc1d630a10783ab47f5`
- Mapping：`INTEGRATION_MAP.json`，SHA-256：`0419d88b34984cdf299d903055188aeb2b67d2f009441009e9dcacee85dc1a06`
- Actual apply 授权：[CHECKPOINT_REVIEW.json](./CHECKPOINT_REVIEW.json)，SHA-256 `c4ac464058bb39a25d1694efa1f8798112742d1e71a6682a6e517a29c7352264`
- 候选审核门：[REVIEW_GATE.json](./REVIEW_GATE.json)，SHA-256 `5e9ff08faa4ed395efbe32308889c06f882cf949ccac92ed619508a958ad3ed5`

母级 source/content 独审21项、SQL disposable-clone 独审72项、actual 数据独审89项均通过。SQL 与 mapping 的具体增量由上述检查点映射和独立审查记录约束。
