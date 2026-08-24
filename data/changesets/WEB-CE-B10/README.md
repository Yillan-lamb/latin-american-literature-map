# WEB-CE-B10

本目录记录 Batch 10「历史书写、阿根廷现代小说与艾拉」的独立执行包。

- Task ID：`WEB-CE-B10`；执行模式：Luna Max；基线为 B09 独立提交 `6c24191`。
- 范围：Eduardo Galeano、Ricardo Piglia、César Aira；9 部作品/作品集。
- 研究边界：只写入已打开机构/学术来源直接支持的作者、书目、形态与年份，不把“代表”“奠定”等评价写成 accepted fact。
- 中文展示：保留原文题名，使用路线图读者标签并标为 `common_title`；不把译者、出版社、ISBN 缺失当作 HOLD。
- Geo：复用乌拉圭、阿根廷国家节点，新增 3 条作者—国家关系；无新增现实坐标或虚构空间。
- Curation：3 位作者、9 部作品的策展字段保持 `user_review`，不越过公共内容准入门槛。
- Review：fresh-context Reviewer 初轮 `REVISE`，已完成 5 项最小修复；follow-up `PASS` 后才入库。修复包括 card-source、Galeano 国家 fact、`《火的记忆Ⅰ：创世纪》` 展示名、迁移门禁和 SRC-0223 作者元数据。
- Git：本批独立 migration、QA 和 commit；不修改 `PROJECT_CHARTER.md`，不执行发布、部署、push、PR 或 tag。
