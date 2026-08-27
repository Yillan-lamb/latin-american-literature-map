# 拉丁美洲文学地图

**Latin American Literature Map**

一个面向中文读者的研究型数字文学项目，通过可追溯的数据连接拉丁美洲的作家、作品、城市、国家、文学运动、历史事件与文学主题。

[浏览 GitHub Pages 开发预览](https://yillan-lamb.github.io/latin-american-literature-map/)

## 项目是什么

这个项目不是简单的作家百科，也不是把文学史机械搬到网页上。它尝试把空间、时间、人物、作品和思想之间的关系组织成可以探索的研究网络，帮助读者理解：

- 拉丁美洲文学如何在不同国家、城市和时代之间演变；
- 作家、作品与文学运动之间存在怎样的影响和回应；
- 革命、独裁、殖民、现代化、流亡与记忆如何进入文学；
- 魔幻现实主义之外，还有哪些重要传统、形式与叙事实验；
- 中文读者可以沿哪些作品、地点或主题进入这些文学世界。

## 可以探索什么

项目围绕作家、作品、国家、城市、文学运动、历史事件和主题建立连接，并逐步形成：

- 地图：观察文学地点、作家迁移和跨地域关系；
- 时间线：比较作家生平、作品发表与历史事件；
- 关系网络：追踪人物、作品、运动、地点与主题之间的联系；
- 研究数据库：保存规范实体、事实、关系、来源与审核状态；
- 策展阅读：提供专题路径、作品入口和面向中文读者的阅读说明。

它是一个 **Map + Timeline + Network + Research Database + Curated Reading Experience** 的组合式数字人文项目。

## 当前内容规模

以下数字由当前 `main` 的 Research Database 与完整开发预览重新核验：

| 内容 | 数量 |
| --- | ---: |
| 规范实体 | 371 |
| 研究事实 | 998 |
| 实体关系 | 306 |
| 来源记录 | 278 |
| 内容卡 | 255 |
| 开发预览中的作者 | 61 |
| 开发预览中的作品 / 合集 | 168 |

数据库还包含地点、文学运动、事件、主题、人物、角色、改编与版本等实体。开发数据库的完整实体数与网页当前展示范围并不等同：网页只消费已进入相应公开或预览范围的数据。

## 数据如何形成

```text
Sources
   ↓
Research Facts
   ↓
Canonical Entities & Relationships
   ↓
Research Database
   ↓
Curated Web Data
   ↓
Map / Timeline / Pages / Search
```

- 公开研究事实原则上都应能追溯到来源；
- AI 生成内容不直接作为研究事实进入数据库；
- 研究事实、证据材料、策展文字和网页展示数据分层保存；
- 网站内容从研究数据和策展数据构建，不在前端另行维护一套文学事实；
- 尚不确定或未完成审核的内容进入 hold / review，不被强行发布。

## 项目状态

项目已完成第一阶段研究数据库建设，目前处于持续扩充与数字展览开发阶段。

- **正式 Research Data Release**：`Data V1.0.0`，保留为已发布的历史基线；
- **当前 Development Data**：`Data 1.3.0 development candidate`，主库已扩展至上表规模；
- **当前 Web Development**：`Web 0.3.0 Development`，已完成文学空间与地点关系深化，并具备地图、时间线、搜索、作家/作品/地点页面和专题阅读入口；
- **公开状态**：GitHub Pages 提供开发预览，正式 Public Release 仍暂停，预览不等同于正式研究数据发布。

详细变更见 [CHANGELOG](./CHANGELOG.md) 和 [版本文档](./docs/releases)。

## 仓库结构

```text
data/       研究数据库、来源目录、变更集和导出数据
site/       数字文学地图静态前端
scripts/    数据构建、转换、验证和发布工具
tests/      自动化测试与浏览器 QA
templates/  研究协作与交付模板
docs/       研究方法、数据、网站和版本的正式说明
project/    项目治理、计划、任务、决策、审计和 AI 协作记录
```

## 研究方法与来源原则

项目优先使用可靠出版物、研究论文、图书馆或文化机构目录及权威网页。书籍记录书名，论文记录论文名，网页记录标题与 URL；页码、章节和段落定位作为可选增强。事实、解释和面向读者的策展文字分别管理，以避免把研究过程语言直接带入普通页面。

详细说明见 [研究方法](./docs/methodology)、[数据模型与维护](./docs/data) 和 [数据主库说明](./data/master/README.md)。

## 技术结构

- SQLite 作为长期 Research Database；
- CSV、JSON 和 Excel 用于审核、交换与版本导出；
- Research Data 与 Curation Data 构建为独立 Web Data；
- 静态前端消费构建结果，可部署到 GitHub Pages；
- Python 验证脚本检查数据库、迁移链、内容质量和部署包；
- Playwright 与 Lighthouse 用于浏览器、响应式、可访问性和基础性能 QA。

网站数据流与部署结构见 [Web 文档](./docs/web)；本地开发入口见 [site/README](./site/README.md)。

## 文档入口

- [项目文档总览](./docs/README.md)
- [研究方法与来源原则](./docs/methodology)
- [数据模型与维护](./docs/data)
- [网站架构与数据流](./docs/web)
- [版本与发布说明](./docs/releases)
- [CHANGELOG](./CHANGELOG.md)

内部项目治理、任务、审计和 AI 协作记录见 [`project/`](./project)。

## 公开与版权边界

仓库只保存可公开的结构化数据、必要短摘录、引用信息、项目文档和程序代码，不保存用户提供的原始书籍、扫描件、未获授权的作品全文、私有批注、账号信息或密钥。公开展示优先使用释义、书目信息、来源题名和必要的短引文，并保持来源可追溯。

## License

本仓库采用多许可证体系：

- 项目原创软件代码采用 [MIT License](./LICENSES/MIT.txt)；
- 项目原创研究数据、文档和策展内容采用 [Creative Commons Attribution 4.0 International（CC BY 4.0）](./LICENSES/CC-BY-4.0.txt)；
- 第三方图片、引文、书籍封面、文本、数据集、地图及其他外部材料不受上述许可证覆盖，除非具体文件另有明确说明。

详细适用范围、推荐署名方式与第三方材料边界见[许可证与版权说明](./docs/LICENSES.md)。
