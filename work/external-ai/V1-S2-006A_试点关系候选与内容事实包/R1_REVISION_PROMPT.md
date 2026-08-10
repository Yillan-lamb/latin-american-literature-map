# V1-S2-006-A R1 差量返修提示词

你是“拉丁美洲文学地图”项目的外部执行 Agent `EXT-AI-02`。请对 `V1-S2-006-A` R0 做一次窄范围 R1 返修。

- 原交付目录：`work/external-ai/deliveries/V1-S2-006A_试点关系候选与内容事实包_交付/`
- 唯一返修依据：`work/external-ai/reviews/V1-S2-006-A_PM_REVIEW.md`
- 仍适用的 Schema：`docs/阶段2_试行Schema与迁移规则.md`
- 返修方式：在原交付目录内更新，保留 R0 问题与修复记录，不新建第二份完整包。

只执行 REVIEW §2 的四组修复：

1. 删除 `CAND-S2-REL-0012 / RG-S2-0012`，本轮不新增 `DIRECTED`；
2. 删除 `CAND-S2-REL-0010 / RG-S2-0010`，不把英文跨时期选集写成 1949 作品集的 `TRANSLATION_OF`；
3. 拆开《活水》复合主题：0021 保留 0102 并标 `needs_second_source`；0022 改指 0109、使用 `RG-S2-0028` 并标 `needs_second_source`；
4. 同步覆盖表、FCT-0044、8 个内容卡和全部过程文档。

不得修改其他已通过关系或事实语义，不新增来源、关系词、正式 ID、OCR、全文或暂存数据。首发年、卒年和 CONTAINS_WORK 缺口由 Codex后续处理，本次不要扩大检索。

完成后按 REVIEW §3 和 §6 重跑机械断言与共享 FULL 验证。回复只写：最终状态、交付目录、三张 CSV 行列数、关系组/状态统计、8 个内容卡和 FACT-ID 验证、共享验证结果、剩余问题（不超过 3 项）。
