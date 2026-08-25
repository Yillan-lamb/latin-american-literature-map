# V1-S2-001-002-A R2 项目经理复检记录

- task_id: `V1-S2-001-002-A`
- assignment_id: `V1-S2-001-002-A-PILOT-SOURCE-DISCOVERY`
- revision: `R2`
- reviewer: `CODEX-PM`
- reviewed_at: `2026-08-04`
- verdict: `pass`

## 结论

R2 已完成 R1 复检要求的窄范围修复。`DISC-BOR-004` 已从期刊索引改为可定位的具体论文；官方开放文件和 JSTOR 第 14 期目录能够交叉确认作者、题名、年份和期号。两张 CSV 的结构、ID、枚举及全部机械统计一致，九个交付文件同步，安全边界通过。任务最终结论为 `pass`。

## 可复核理由

1. `DISC-BOR-004` 现为 Silvia Rosman, *Politics of the Name: On Borges's “El Aleph”*, `Variaciones Borges` 14 (2002), pp. 7–21；官方文件为 15 页英文论文，首页显示题名、作者和 `Variaciones Borges 14 (2002)`，JSTOR 第 14 期目录列有同名论文。
2. 博尔赫斯仍为 11 条候选，A 级具体学术候选为 BOR-004 和 BOR-011；全表仍为 21 条，未新增第 22 条。
3. `PILOT_SOURCE_CANDIDATES.csv` 标准解析为 21×20，`ACCESS_PLAN.csv` 为 21×7；两个 ID 集合相同且各自唯一，枚举值合法。
4. 独立重算结果：博尔赫斯 A2/B6/C3、es5/en4/zh2、唯一机构 8；李斯佩克朵 A4/B6、pt9/en1、唯一机构 8，其中巴西唯一机构 7。`access_status` 合计为 open15/catalog3/preview1/purchase2，访问桶为 legal15/user5/discovery1，优先级为 high7/medium9/low5。
5. SUMMARY、QA、HANDOFF、MANIFEST 与最终 CSV 一致；旧 BSOL 索引结论只保留在 R0/R1 历史和删除说明中，不再作为当前判断。
6. 交付目录恰为 9 个文件，无子目录、PDF、EPUB、全文、`inputs/`、Cookie、密钥或 `.DS_Store`；冻结章程哈希未变化。

## 等级核定说明

- 正式核定为 A：BOR-004、BOR-011、LIS-004、LIS-005、LIS-009、LIS-010。
- 正式核定为 B：BOR-001、BOR-002、BOR-003、BOR-005、BOR-007、BOR-009、LIS-001、LIS-002、LIS-003、LIS-006、LIS-007、LIS-008。
- 正式核定为 C：BOR-008。
- BOR-006、BOR-010 为社区型书目数据库/记录，不符合阶段 0 的 C 级定义，正式降为 D，仅作发现和版本线索。

详细试点选择和访问决策见 `project/audits/research/阶段2_试点来源与作品选择.md`。

## 非阻塞遗留项

- I009 已由 Codex 通过 JSTOR 第 14 期目录人工复核，不再构成元数据阻塞。
- BOR-011 的 JSTOR 全文仍需订阅或机构访问，本轮不采购，保留为后备 A 级来源。
- FCRB 档案预约和中文版全集购买均暂缓，不影响首轮开放材料试点。
