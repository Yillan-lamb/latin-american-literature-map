# WEB-CE-B07

本目录记录 Batch 07「智利反诗歌、阿根廷诗歌与乌拉圭小说」的独立执行包。

- Task ID：`WEB-CE-B07`；执行模式：Luna Max；基线为 B06 独立提交 `f1448b5`。
- 范围：Nicanor Parra、Alejandra Pizarnik、Mario Benedetti；9 部作品/作品集。
- 研究边界：仅写入已打开的国家图书馆、大学、文化机构和作家基金会来源直接支持的作者、书目、形态与年份；不新增强解释性文学史关系。
- 中文展示：保留原文题名，采用路线图中文展示名并标为 `common_title`；译者、出版社、ISBN 不构成本批门槛。
- 作品层：诗集及短篇集为 `collection`；`La tregua` 与 `Gracias por el fuego` 为 `work`。
- Geo：复用智利、阿根廷、乌拉圭国家节点，新增 3 条作者—国家关系；不新增坐标或虚构空间。
- Curation：3 位作者、9 部作品的策展字段保留 `user_review`，不越过公共内容准入门槛。
- Review：fresh-context Reviewer 结论为 `PASS`，见 `review/REVIEW.md`。
- Git：本批独立 migration、QA 和 commit；不修改 `PROJECT_CHARTER.md`，不执行发布、部署或 tag。

文件：`PREFLIGHT.md`、`RESEARCH_CHANGE_SET.json`、`review/REVIEW.md`、`FINAL_BATCH_REPORT.md`、`qa/QA.md`、`curation/PUBLIC_CONTENT.json`。
