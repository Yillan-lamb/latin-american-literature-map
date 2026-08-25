# SOL Audit Handoff — WEB-CE-B16–B17

日期：2026-08-22
执行模式：Luna Max，串行 Batch；本交接包不启动 B18。
仓库分支：`codex/sol-audit-b11-b15`
Sol 审计对象：B16、B17 的独立提交及其累积数据/产品投影。

## 1. Scope and baseline

- B16 上一基线：B15 完成后的主库；B16 独立迁移为 `0022_web_ce_b16_luna_max.sql`。
- B16 独立提交：`5f3b00c`（`feat(data): complete WEB-CE-B16`）。
- B17 基于 B16 正式主库重新 Preflight，独立迁移为 `0023_web_ce_b17_luna_max.sql`。
- B17 独立提交：`160853c`（`feat(data): complete WEB-CE-B17`）。本文件随后独立作为审计交接提交保存。
- 既有 B11–B15 Sol 整改基线仍在当前历史中：`a3dd71c`；交接文档提交为 `1b2a4c1`。
- 当前工作区还存在其他任务的文档、外部交付 CSV 和 `artifacts/v2-rc5/`；均未纳入本次 B16/B17 提交。

## 2. Batch change matrix

| Batch | 实际新增作者 | 作品/作品集 | Facts | Relationships | Sources | Cards | Geo 新地点 | Geo 关系行 | Research gap | Migration | Commit |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---|---|
| B16 | 3 | 9 | 36 | 12 | 9 | 12 | 0 | 3 | 1 | `0022_web_ce_b16_luna_max.sql` | `5f3b00c` |
| B17 | 3 | 9 | 42 | 12 | 7 | 12 | 2 | 3 | 1 | `0023_web_ce_b17_luna_max.sql` | `160853c` |

B16 的作者为 Luis Sepúlveda、Guadalupe Nettel、Cristina Peri Rossi；B17 的作者为 Lygia Fagundes Telles、Jorge Icaza、Rómulo Gallegos。B17 的九个作品节点中八个为 `work`，一个（`Antes do baile verde`）为 `collection`。B17 新增厄瓜多尔、委内瑞拉国家节点；没有伪造坐标。

## 3. Cumulative final state

当前正式主库 `data/master/V1_MASTER.sqlite` 机器计数：

| Table / projection | Count |
|---|---:|
| entities | 367 |
| facts | 997 |
| relationships | 293 |
| sources | 274 |
| content cards | 255 |
| research gaps | 24 |
| migration log rows | 23 |
| relationship evidence rows | 320 |
| card-source rows | 489 |

B16–B17 合计相对于 B15 基线新增：6 authors、18 works/collections、78 facts、24 relationships、16 sources、24 cards、2 个新地点实体、6 条 Geo relationship projection、2 个 research gaps。B17 的迁移包含 21 条 card-source rows、12 条 relationship-evidence rows；B16 包含 17 条 card-source rows、12 条 relationship-evidence rows。

当前 Web Data（固定 `generated_at=2026-08-22T12:00:00Z`）为：367 entities、255 cards、997 facts、293 relationships、274 sources、33 places、78 place-relations、24 gaps、timeline 269。两次固定时间重建字节一致。

## 4. Review package versus formal public

- Review package：61 authors、168 works、25 literary places；B16/B17 新增内容均为 `user_review` / `UNREVIEWED`，不等于 USER 批准。
- Formal public projection：25 authors、60 works、28 places；B17 的 Ecuador/Venezuela 国家入口可以进入正式地图/国家范围，但三位 B17 作者和九部作品未被错误放入正式 public author/work scope。
- B17 curation 的 3 author entries、9 work entries 全部保持 `user_review`；没有 `reviewer=USER` 伪造，也没有把 internal preview 当作 public approval。
- 正式 bundle：115 public entities、119 sitemap URLs；审核预览 bundle：259 public preview entities、273 sitemap URLs。正式 bundle 不含 review queue。

## 5. High-risk items for Sol

### Open gaps / disputed facts

1. `V1-GAP-0023`（B16）：Luis Sepúlveda《一个老人读爱情小说》存在 1989 Madrid edition 与 1993 Tusquets citation 的书目年份差异；当前保留 1989 的 `first_book_edition_year` 线索和 1993 来源注记，不宣称无争议的首版年。
2. `V1-GAP-0024`（B17）：Lygia Fagundes Telles 出生年冲突。ABL profile 支持 1923；Biblioteca Nacional authority line 显示 `1918–2022`。当前 1923 为 medium-confidence 候选，gap 状态为 `open_research` / `SOL_REVIEW`，未把冲突压平为正式无争议事实。

### Source and interpretation risk

- B17 正式来源均为 B-level 的官方机构、国家/大学目录、大学论文或文化机构页面；没有 D-level 来源进入正式 evidence。建议 Sol 重新打开 SRC-0270–SRC-0276：
  - [ABL profile](https://www2.academia.org.br/academicos/lygia-fagundes-telles)（SRC-0270）
  - [ABL bibliography](https://www.academia.org.br/academicos/lygia-fagundes-telles/bibliografia)（SRC-0271）
  - [Biblioteca Nacional record](https://acervo.bn.gov.br/sophia_web/acervo/detalhe/1724755)（SRC-0272）
  - [Casa de la Cultura Ecuatoriana catalogue](https://biblioteca.casadelacultura.gob.ec/bib/10452)（SRC-0273）
  - [UCE thesis PDF](https://www.dspace.uce.edu.ec/server/api/core/bitstreams/c4493f6a-e702-4d00-8f4f-653644f5a4a9/content)（SRC-0274）
  - [Fundación Empresas Polar profile](https://bibliofep.fundacionempresaspolar.org/dhv/entradas/g/gallegos-romulo/)（SRC-0275）
  - [Universidad de Carabobo profile](https://viceacademico.uc.edu.ve/efemerides/historia/gallegos)（SRC-0276）
- B16/B17 没有 `INFLUENCED`、文学运动、历史因果或高强度主题关系；关系限于作者—作品和作者—国家。Sol 可抽查原子出版年、形式及作者—作品端点。
- 所有 B17 中文作品名为 `provisional_title`，原文题名始终保留；不得在后续策展或 public 文案中升级为已核实出版译名。

## 6. Cross-Batch integrity and governance risks

- B16/B17 的正式 ID、来源、关系端点、evidence 和 card-source 映射无重复；B17 正确复用已有巴西国家节点，并新建 Ecuador/Venezuela 两个 country place 节点。
- B17 的 `Antes do baile verde` 使用 `collection` 层级，避免与单篇作品混淆；B16 的诗集/作品集层级也已由 Reviewer 复核。
- 未发现中文同名合并、同一原作重复实体、同一来源多入口洗成独立证据或虚构空间伪造现实坐标。
- B17 的 Lygia 日期 gap 与 B16 的 Sepúlveda 版本 gap 相互独立；后批未静默改写前批事实。
- 连续重放 `0022` + `0023` 与正式主库逐表一致（除 `migration_log.applied_at`），两者 `integrity_check=ok`、foreign-key check 为空。

## 7. Geo / coverage notes

- B16 新增 3 条作者—国家投影，无新地点实体；B17 新增 Ecuador、Venezuela 两个 polygon-only 国家节点和 3 条作者—国家投影。
- 所有 B16/B17 新 Geo 行的 relationship/source/endpoint 与 SQLite 正式关系一致；没有出生地冒充文学空间、没有虚构空间现实坐标。
- 覆盖改善：新增巴西女性作者，并把 Ecuador、Venezuela 纳入地图入口；体裁仍以小说/叙事散文为主，B16 有诗集与作品集，B17 有一部短篇小说集。
- 仍需关注：女性诗人、加勒比、中美洲、安第斯、现实城市文学空间和虚构文学空间的覆盖；本周期未改写 60+ roadmap。

## 8. QA evidence

- B16、B17 fresh-context Review：最终均为 `PASS`。
- 每批 migration 副本演练通过；B16–B17 连续 replay 通过；master validator、content-quality validator、Web Data validator、integrity/FK 检查通过。
- 固定生成时间 Web Data 两次字节一致，正式 `data/v2/web` 与重建输出一致。
- 正式 bundle validator/UI QA：115 entities、119 sitemap、120 HTML，PASS。
- USER_REVIEW preview validator/UI QA：259 entities、273 sitemap、274 HTML，PASS；Chromium desktop/mobile 36/36 PASS。
- 正式公共 Chromium desktop/mobile 核心路径 28/28 PASS；`qa_v2_browser.cjs` 的 Chromium、Firefox、WebKit desktop/mobile 六矩阵 PASS，无 HTTP、console、page error 或治理语言泄漏。
- `node --check site/app.js` 与浏览器测试语法检查 PASS；B16/B17 拟提交文件 `git diff --check` 无 whitespace error。
- 测试没有依赖旧作者/作品硬编码；B17 浏览器测试覆盖 Ecuador/Venezuela 入口、审核预览作者/作品 route、搜索、时间线和 review boundary。

## 9. Sol audit priorities and next-cycle guidance

建议 Sol 首先复核两项日期冲突及其 gap 状态，然后抽查 B17 ABL/BN/UCE/Polar 来源正文、B16 的 1989/1993 版本关系、collection 层级和 Geo polygon-only 规则。若审计通过，可继续沿用当前 SQLite → Geo/Curation → Web Data 链路；下一周期继续保持每批独立 migration、fresh-context Review、`user_review` 与 formal public 分离，并优先补诗歌、女性作者、加勒比/中美洲/安第斯和城市文学空间。

本交接包不建议修改章程、roadmap 或 release 状态，也不包含任何 public release、tag、push、deployment 或 B18 启动操作。

## 10. Handoff status

`FIVE_BATCH_EXECUTION_COMPLETE`（本次实际收尾批次为 B17；B16 已完成并纳入本交接范围）。
B17 达到 `BATCH_PASS`，待 Sol 独立审计；当前数据库可在 Sol 审计前安全保留，不应继续启动 B18。
