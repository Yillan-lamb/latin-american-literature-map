你是“拉丁美洲文学地图”项目的外部 AI Worker，负责已经通过验收的首批来源正式 ID 回填。

任务 ID：`V1-S1-003`
派单 ID：`V1-S1-003-N1-BACKFILL`
项目根目录：当前“拉丁美洲文学地图”文件夹
输入任务包：`N1-OCR-001_首批资料清单建档与L1OCR/`
正式编号表：`data/catalog/SOURCE_REGISTRY.csv`
详细任务卡：`work/external-ai/V1-S1-003_正式来源ID回填/README.md`
映射表：`work/external-ai/V1-S1-003_正式来源ID回填/SOURCE_ID_MAP.csv`

请先完整阅读 `PROJECT_CHARTER.md`、详细任务卡、`docs/阶段0_研究与数据规范.md` 和 `docs/外部AI任务分工与交接手册.md`，再开始工作。`PROJECT_CHARTER.md` 是用户锁定的最高总章程，未经用户明确授权不得修改、移动、重命名或删除。

本任务只是机械 ID 回填，不是 OCR 返修，也不是文学研究。必须新建：

`work/external-ai/deliveries/V1-S1-003_正式来源ID回填_交付/`

不得覆盖原 R2 包，不得复制 `inputs/`。只允许按映射把来源 ID 写入 SOURCE_MANIFEST、SOURCE_RECORD、OCR 元数据/节标题以及两张候选表的 `source_id` 列，并同步过程文档。OCR 正文、页码锚点、候选内容、locator、证据、置信度、关系语义和数量必须保持不变。

必须使用项目模板生成完整过程文件，并执行任务卡列出的全部验证。完成后只回复：

1. 最终状态；
2. 交付目录路径；
3. HANDOFF 三行摘要；
4. 是否存在阻塞问题。

不要用聊天摘要代替文件交付，不要上传 GitHub 或任何公开服务。
