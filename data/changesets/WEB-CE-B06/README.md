# WEB-CE-B06

本目录记录 Batch 06「现代主义与安第斯诗歌」的独立执行包。

- Task ID：`WEB-CE-B06`
- 执行模式：Luna Max；以 Sol 审计通过的 B02–B05 提交 `ea531ff` 为基线，并在 B06 开始时重新 Preflight。
- 范围：塞萨尔·巴列霍、鲁文·达里奥、何塞·马蒂；每位作家三部代表作品。
- 研究边界：只写入已打开的机构/大学图书馆或文化机构来源直接支持的作者身份、书目、形态和年份；不把现代主义等文学史定位升级为 accepted relationship。
- 中文展示：保留原文题名，使用路线图中的通行中文展示名；`display_name_status` 与版本学字段分离，译者、出版社、ISBN 不构成本批门槛。
- Geo：复用秘鲁与古巴国家节点，新增尼加拉瓜国家节点；不把出生地自动当作作品场景，不创建虚构坐标。
- 特殊缺口：`Los heraldos negros` 的机构页面同时出现 1918 编目与 1919 实际印行说明，写入 medium/conflict 事实并建立 `V1-GAP-0015`，不静默选择。
- Review：fresh-context Reviewer 结论及返修记录见 `review/REVIEW.md`。
- Git：本批单独 migration、QA 和 commit；不修改 `PROJECT_CHARTER.md`，不执行发布、部署或 tag。

文件：

- `PREFLIGHT.md`：B06 开始时对主库的查重、ID 和覆盖调整。
- `RESEARCH_CHANGE_SET.json`：候选实体、事实、关系、来源、中文展示状态和缺口。
- `review/REVIEW.md`：独立 Reviewer 结论。
- `FINAL_BATCH_REPORT.md`：Batch Gate、实际增量、产品影响和剩余缺口。
- `qa/QA.md`：本批 QA 记录。

## 返修记录

- 初次独立 Reviewer：`REVISE`（2026-08-21）；问题集中在来源可访问性与事实—来源映射，结构、去重、作品层级、关系方向、年份 gap 与 Geo 约束通过。
- 最小返修：更新 `SRC-0178` 至 Casa/PUCP 2019 PDF；新增可直接读取的 `SRC-0187` Martí 作者页；将 `SRC-0179`、`SRC-0184` 标为 `access_limited`；收窄 Vallejo/Darío/Martí 职业与出生地表述；把 Darío 地理关系改接 `SRC-0181`；替换 GeoNames 国家页 URL。
