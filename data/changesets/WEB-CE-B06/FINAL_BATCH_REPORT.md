# WEB-CE-B06 Final Batch Report

## Scope

- Task：`WEB-CE-B06`；主题：现代主义与安第斯诗歌。
- 执行对象：César Vallejo、Rubén Darío、José Martí；9 部作品/作品集；1 个尼加拉瓜国家地点节点。
- Git baseline：`ea531ff7ff6c31cce4611d809e7efc537259ae06`。
- Review：`LUNA-MAX-B06-REVIEW`，最终 `PASS`；初次 `REVISE` 的返修过程保留在 `review/REVIEW.md`。

## Actual Delta

与 B06 开始时 HEAD 的机器差量：

| 项目 | 增量 |
|---|---:|
| authors | 3 |
| works / collections | 9 |
| entities（含尼加拉瓜地点） | 13 |
| facts | 42 |
| relationships | 12 |
| sources | 11 |
| content cards | 12 |
| card_sources | 21 |
| relationship evidence | 12 |
| research gaps | 1 |
| Geo places | 1 |
| Geo place relations | 3 |

报告数字以正式 master、Geo CSV 与 Web Data 实际计数为准，而非候选报告手写估计。

## Integration

- migration：`data/master/migrations/0009_web_ce_b06_luna_max.sql`，正式写入 `data/master/V1_MASTER.sqlite`。
- 新作品层级经 Review 修正为 8 个 `collection` 与 1 个 `work`；CREATED 关系端点、方向、source evidence 对齐。
- Vallejo 的 1918/1919 书目冲突进入 `V1-GAP-0015`；Darío 的尼加拉瓜关系使用直接 Memoria Chilena 页面；Martí 的 Havana/身份/`Ismaelillo` 使用直接 Cervantes Virtual 作者页。
- `SRC-0179` 与 `SRC-0184` 不再被正式 facts、cards 或 relationships 使用；仅保留 access-limited 记录供后续研究。

## Product Impact

- Research / review package 增长到 28 authors、69 works、25 places 的可策展字段；B06 新作者/作品仍为 `user_review`，不会被误当作正式公开内容。
- Web Data 研究层增长到 233 entities、560 facts、161 relationships、185 sources、123 cards、31 places；公开边界仍由 `auto_approved_only` 控制。
- 新增尼加拉瓜国家地图节点及 3 条作者—国家文学地理关系；没有新增虚构空间坐标。
- `scripts/build_v2_public_content.py` 现在动态加载 `WEB-CE-B*` 扩展包并拒绝重复 ID，保证后续批次可增量重建。
- 为公共读者边界增加通用内部 ID 清理：关系说明中的 `V1-ENT-*` 不再出现在页面文字。

## Holds / Next Review Focus

- `V1-GAP-0015` 的年份冲突必须由 Sol 复核来源和下游显示。
- Sol 应重开 0178/0181/0185/0186/0187 的正文及 0179/0184 的 access-limited 状态，确认 source tier 与事实范围没有漂移。
- B06 新作者/作品的中文展示名仍按展示优先策略保留，译者、出版社、ISBN 未作为本批门槛。

## QA / Gate

详见 `qa/QA.md`。主库、Curation、Web Data、公共预览 bundle、Node syntax、Chromium desktop/mobile 与 diff check 均通过；正式 release bundle 仍因项目暂停的 review governance gate 不公开 user_review 内容。

**Batch status：`BATCH_PASS`。**

Git commit SHA 由本批独立提交后写入 `project/audits/web/SOL_AUDIT_HANDOFF_B06-B10.md`。
