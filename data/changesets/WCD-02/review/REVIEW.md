# WCD-02 Independent Research Review

- Reviewer: `CODEX-REVIEW / fresh context`
- Date: `2026-08-27`
- Scope: `WCD02-CS01`、`WCD02-CS02` 候选与迁移；正式 master 在本次 review 中未修改
- Verdict: **PASS**

## Semantic verdict

1. 9 条作者出生地关系均为合法 `author → ASSOCIATED_WITH_PLACE → place`，描述明确限定为“出生地关联”；未创建 `BORN_IN`，也未扩写为长期生活或创作中心。该模式与既有米斯特拉尔→比库尼亚等已审核关系一致。
2. 4 条作品场景关系均有直接来源：`SRC-0076` 支持《跳房子》的巴黎—布宜诺斯艾利斯双城空间；`SRC-0089` 与 `SRC-0090` 独立支持《最明净的地区》→墨西哥城；`SRC-0086` 直接支持《光明世纪》的十八世纪末古巴故事空间。本轮只正式化到来源支持的粒度。
3. 哈瓦那只承载何塞·马蒂出生地关系；《光明世纪》仍关联古巴国家层。Santa María 与另外两个既有 `SET_IN` hold 保持不变。

## Structural verdict

- 基线最大 ID：`V1-ENT-0369`、`V1-REL-0295`、`V1-EV-0320`；新 ID 连续且无冲突。
- 4 个地点实体与 13 个规范化三元组均无重复；关系端点和 relation type 均合法。
- `V1-REL-0307` 的 `evidence_count=2`，其余新关系为 1；与 `relationship_sources`、`relationship_evidence` 实际行数一致。
- 所有实体、事实和来源引用均存在；没有非法关系词、虚构地点现实坐标或关系粒度越权。

## Migration replay

- `0028_wcd02_core_literary_cities.sql`：`sha256=01d71c12e09bf4da78e13a5fa12dbe7db139ec9132cc6baebf4655cd11ee736c`
- `0029_wcd02_work_place_relations.sql`：`sha256=a1ee59d7955c8768bc4e280430776f3365200fd6a61c49c0525d8292c796e0c3`
- 临时副本按 0028→0029 dry-run 与正式重放均成功。
- `validate_master=pass`、warnings 为空、`integrity_check=ok`、foreign key errors=0。
- 预期最终计数：371 entities、306 relationships、363 relationship_sources、334 relationship_evidence。

结论：两个 change set 可由 Data Integrator 按顺序写入正式 master；本 PASS 不构成 Research 正式 Release、Web Public Release 或任何未批准 Curation 判断的公开授权。
