# WCD-02 Research Preflight

- Task: `WCD-02 Literary Space & Relationship Deepening`
- Baseline: `main@bf6e7970c622f3dd4e36d2f9ea13ef7a52dd5427`
- Research baseline: `Data 1.2.0 candidate`
- Schema: `0.3`（不新增 relation type）
- Scope: D/E 类增量；新增地点实体、把已有直接地点事实正式化为合法关系
- Excluded: Batch 18、作者扩张、WCD-03、WCD-04、V3、Public Release

## Classification and deduplication

| Change set | Scope | Deduplication result |
|---|---|---|
| `WCD02-CS01` | Core Literary Cities | 布宜诺斯艾利斯、蒙得维的亚、哈瓦那在 Research `entities` 中不存在；9 条作者—城市与 1 条作品—城市三元组均不存在 |
| `WCD02-CS02` | Work Spatial Deepening | 巴黎在 Research `entities` 中不存在；3 条 `SET_IN` 三元组均不存在；墨西哥城、古巴复用既有实体 |

查重结论为 `new` 或 `reuse`；不存在 `possible_duplicate`。巴黎与法国不建立新的国家父级 Research 实体，Geo 层保留为站外延伸地点。

## Evidence boundary

- 作者—城市关系只把已入主库的 `birth_place` 原子事实正式化为 `ASSOCIATED_WITH_PLACE`，关系描述明确写“出生地关联”，不发明 `BORN_IN`，也不把出生地扩写成长期创作中心。
- `SET_IN` 只使用已有、已审核的作品 `setting_place` 事实及其直接来源。
- 《跳房子》的巴黎与布宜诺斯艾利斯拆成两个稳定三元组，均由同一出版社内容介绍直接支持。
- 《最明净的地区》→墨西哥城使用两个独立 B 级机构/出版社来源。
- 《光明世纪》只正式化到来源直接支持的古巴国家层，不把宽泛的加勒比海、瓜德罗普或哈瓦那强行精确化。
- 不关闭 Santa María、霍乱时期的爱情、绿房子三个既有 `SET_IN` hold。

## Change-set gates

每个 change set 均需：候选 JSON、独立 Reviewer verdict、独立 migration、Master QA、migration replay、导出与 Web downstream rebuild。Reviewer PASS 前不得应用到正式 master。
