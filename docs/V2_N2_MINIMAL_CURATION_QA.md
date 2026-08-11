# V2-N2 最小策展包 QA

## 1. 任务信息

- 任务：`V2-S3-002`
- 日期：2026-08-11
- 状态：`✅ DONE`
- 上游：`docs/V2_N2_SAMPLE_SET.md`、`docs/V2_CURATION_SCHEMA.md`
- 输出：`data/v2/curation/CURATION_ENTRIES.csv`、`CURATION_SELECTIONS.csv`、`CURATION_RECOMMENDATIONS.csv`

## 2. 规模与状态

| 文件 | 总数 | `auto_approved` | `user_review` | `hold` |
|---|---:|---:|---:|---:|
| `CURATION_ENTRIES.csv` | 16 | 16 | 0 | 0 |
| `CURATION_SELECTIONS.csv` | 19 | 19 | 0 | 0 |
| `CURATION_RECOMMENDATIONS.csv` | 2 | 0 | 1 | 1 |
| 合计 | 37 | 35 | 1 | 1 |

`auto_approved` 只包含 V1 内容卡、已审核关系、V1 来源或 S1-002 已登记地理来源可以直接支持的表达。推荐记录全部独立于 V1 `relationships`，没有把策展判断写回研究关系。

## 3. 自动准入检查

- 4 位作者导语直接来自 `V1-CARD-0002`、`V1-CARD-0017`、`V1-CARD-0013`、`V1-CARD-0021`。
- 6 部作品导语直接来自有 `source_minimum_status=meets` 的 V1 内容卡。
- 4 条现实地点导语逐条引用 V1 地点关系；没有把作者—地点关联改写为出生地、居住地等更强语义。
- 科马拉与马孔多的虚构空间说明明确禁止使用现实坐标；V2 地图技术层也通过同一门禁。
- 19 条展示选择均注明“仅用于 N2 样本覆盖/交互路径，不表示文学地位或价值排名”。

## 4. 待审与 hold 检查

- `V2-CUR-REC-001`：从《星辰时刻》到《佩德罗·巴拉莫》的“下一本读什么”路径，属于跨作品阅读推荐，进入 `user_review`。
- `V2-CUR-REC-002`：将《百年孤独》和《佩德罗·巴拉莫》概括为共同主题路径，属于跨作品比较，依据不足，保持 `hold`。
- 两条记录都进入 Web Data 的 `review_queue`，不进入公共 `curation`。
- 时间线事件 `V1-ENT-0065`、`V1-ENT-0139` 的年份事实当前为 `candidate_for_staging_review`，本任务没有生成自动准入的事件导语。

## 5. 构建验证

运行：

```text
python3 scripts/build_v2_web_data.py --generated-at 2026-08-11T00:00:00+08:00
python3 scripts/validate_v2_web_data.py
```

结果：`PASS`。

当前 Web Data 统计：144 实体、40 张内容卡、238 条事实、76 条关系、40 条关系 hold、13 个 gap、74 个来源、24 个地图节点（含 2 个技术父级）、25 条地图关系、16 条策展文案、19 条展示选择、2 条策展推荐。

## 6. 结论

N2 原型所需的最小策展内容已具备；强判断和依据不足的内容没有被自动发布。`V2-S3-002 = ✅ DONE`，解锁 `V2-S4-001`。
