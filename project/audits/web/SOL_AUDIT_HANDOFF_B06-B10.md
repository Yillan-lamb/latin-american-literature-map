# SOL_AUDIT_HANDOFF_B06-B10

## 1. Scope and Git baseline

- 审计交接范围：`WEB-CE-B06`、`WEB-CE-B07`、`WEB-CE-B08`、`WEB-CE-B09`、`WEB-CE-B10`。
- Git baseline：B05 Sol 审计提交 `ea531ff7ff6c31cce4611d809e7efc537259ae06`。
- 当前分支：`codex/web-ce-b06-b10-luna-max`；当前 HEAD：B10 commit `fc4b090`。
- 五批按独立 migration、独立 Review、独立 QA、独立 commit 串行完成；本交接包不包含 Sol 最终 verdict。
- 工作区仍有既有 `work/external-ai/deliveries/...` CSV 的 CRLF-only 修改；它们未暂存、未纳入五批 commit，也不属于本审计范围。
- 未执行 push、PR、merge、tag、Release 或 production deployment。

## 2. Per-batch overview and commits

| Batch | 主题 / 作家 | 实际新增 authors | works / collections | entities | facts | relationships | sources | cards | Geo places / rels | gaps | commit |
|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---|
| B06 | César Vallejo、Rubén Darío、José Martí | 3 | 9 | 13（含 1 个尼加拉瓜地点） | 42 | 12 | 11 | 12 | 1 / 3 | 1 | `f1448b5` |
| B07 | Nicanor Parra、Alejandra Pizarnik、Mario Benedetti | 3 | 9 | 12 | 42 | 12 | 9 | 12 | 0 / 3 | 0 | `77a1d0a` |
| B08 | José María Arguedas、Sergio Pitol、Juan José Arreola | 3 | 9 | 12 | 42 | 12 | 8 | 12 | 0 / 3 | 0 | `309806e` |
| B09 | Elena Poniatowska、José Emilio Pacheco、Roberto Bolaño | 3 | 9 | 12 | 42 | 12 | 9 | 12 | 0 / 3 | 1 | `6c24191` |
| B10 | Eduardo Galeano、Ricardo Piglia、César Aira | 3 | 9 | 12 | 43 | 12 | 11 | 12 | 0 / 3 | 0 | `fc4b090` |

Batch 级详细材料位于各自 `data/changesets/WEB-CE-B0[6-9]` 与 `data/changesets/WEB-CE-B10` 目录，migration 为 `0009`—`0013_web_ce_*_luna_max.sql`。

## 3. Cumulative actual delta (machine extracted)

以 B05 baseline master 与当前 master 的表计数差为准：

| 研究/产品表 | B05 baseline | B10 final | cumulative delta |
|---|---:|---:|---:|
| entities | 220 | 281 | +61 |
| facts | 518 | 729 | +211 |
| relationships | 149 | 209 | +60 |
| sources | 174 | 222 | +48 |
| content_cards | 111 | 171 | +60 |
| card_sources | 210 | 335 | +125 |
| fact_sources | 537 | 753 | +216 |
| relationship_evidence | 176 | 236 | +60 |
| gaps | 14 | 16 | +2 |

实体增量由 15 authors、45 works/collections 与 1 个新国家地点（尼加拉瓜）构成。Geo CSV 由 42 行增至 57 行：新增 1 个地点实体、15 条作者—国家/地点关系，五批均没有虚构空间现实坐标。Curation review package 由 25 authors / 60 works / 24 places 增至 40 / 105 / 25，增量为 15 / 45 / 1；五批新增策展字段均保持 `user_review`。

Web Data 由 220 entities、518 facts、149 relationships、174 sources、111 cards、30 places、42 place relations 增至 281、729、209、222、171、31、57；`public_curation_status=auto_approved_only`，review queue 未投影进公共页面。

## 4. High-risk items for Sol

### Open research gaps / disputes

- `V1-GAP-0015`：`V1-ENT-0226.first_publication_year`，Vallejo《黑色先驱者》（`Los heraldos negros`）保留 1918 编目 / 1919 实际印行冲突；当前 `open_research`，owner `SOL_REVIEW`。
- `V1-GAP-0016`：`V1-ENT-0265.first_publication_year`，Poniatowska《蒂娜》（`Tinísima`）保留 1991 / 1992 冲突；当前 `open_research`，owner `SOL_REVIEW`。

两项都要求公共文案继续显示冲突，不得静默选择单一年份。

### Reviewer remediation already performed

- B06 初轮来源可访问性、source-to-fact 越界、access-limited card-source 与 card-source 重复均已通过 final follow-up 修复；`SRC-0179`、`SRC-0184` 不再作为正式 fact/card/relationship evidence 引用。
- B09 将无法稳定重开的 Gaceta UNAM `SRC-0207` 替换为可重开的 Instituto Cervantes 页面，并保留 UNAM `1992` 证据，最终 `PASS`。
- B10 初轮 `REVISE` 的五项修复已由 follow-up `PASS` 确认：`V1-CS-0343`、`V1-FCT-0731`、`《火的记忆Ⅰ：创世纪》` 统一、迁移门禁、`SRC-0223` 作者元数据。

### Source risks worth reopening

- B06：重点重开 `SRC-0178`、`SRC-0181`、`SRC-0185`、`SRC-0186`、`SRC-0187` 的正文与 source tier；`SRC-0179`/`SRC-0184` 仅作为 access-limited 历史记录保留。
- B07：Memoria Chilena、Universidad de Chile、CVC 与 Fundación Mario Benedetti 的作者/书目页。
- B08：BNP、Casa de la Literatura Peruana、Instituto Cervantes/CVC、Fonoteca Nacional；特别注意 Arreola `Bestiario` 与既有 Cortázar `Bestiario` 的作者锚点。
- B09：Instituto Cervantes、UNAM 的 `Tinísima` 双年份证据链和 `V1-GAP-0016` 下游显示。
- B10：官方机构页、作者档案与学术 PDF 的来源身份/等级；尤其 `SRC-0223` 的作者为 María Belén Riveiro，publisher 才是 Universidad Nacional de La Plata。

## 5. Cross-batch risks

- 国家节点被多批复用：乌拉圭（B06 Quiroga、B07 Benedetti、B10 Galeano）、阿根廷（B06 Sabato、B07 Pizarnik、B10 Piglia/Aira）、智利（B06/B07/B09）、秘鲁（B06/B08）、墨西哥（B08/B09）。请按 `subject + relation_type + object` 检查作者—国家关系，避免把重复地理关联误判为重复作者实体。
- 同名作品：B08 Arreola 的 `Bestiario` 与既有 Cortázar `Bestiario` 已分开，Sol 应复核原文题名与作者端点。
- 作品层级：B06/B07/B08/B09/B10 同时包含 work 与 collection；B10 的 `Memoria del fuego I. Los nacimientos`、`El libro de los abrazos` 明确为 collection，不能因中文展示名或网站路径合并。
- 中文展示名均按展示优先策略登记，原文题名保留；译者、出版社、ISBN 缺失不是 HOLD，但同一原作的不同中文名仍应作为后续去重检查点。
- 五批没有新增 `INFLUENCED` 或强解释关系；关系主要为 `CREATED` 与作者—国家 `ASSOCIATED_WITH_PLACE`。Sol 可抽查文学解释性策展文案是否越过 Research 层。

## 6. Website and map changes

- 新增作者可从 Search、作者页、国家页和时间线发现；新增作品均有独立作品页与 Research Evidence 回溯。
- Map 增加尼加拉瓜国家节点；五批新增 15 条作者—国家/地点关系，未伪造虚构空间坐标。
- B10 预览 bundle：195 files、187 sitemap routes；B10 定向 desktop/mobile 检查覆盖 12 个作者/作品路由、12 个中文搜索、乌拉圭/阿根廷国家页及地图国家上下文。
- 通用前端、地图、搜索、路由和模板逻辑未因这五批新增特例；增长由 Research → Geo/Curation → Web Data 数据投影驱动。

## 7. QA summary

- 每批均完成独立 migration replay、`integrity_check`、foreign-key check、master validator、Curation validator、Web Data validator 与 deterministic rebuild。
- B06—B10 的 Chromium desktop/mobile 核心测试均为 28/28 PASS；B10 另有 targeted routes/search/map checks PASS。
- `node --check site/app.js`、public UI governance scan、`git diff --check` 均 PASS。外部 AI 交付目录的 CRLF-only 修改保持未暂存。
- 当前正式主库 `data/master/V1_MASTER.sqlite` 可继续作为下一周期输入，但 B11 不应在本交接包之后自动启动。

## 8. Suggested Sol audit focus (not a verdict)

1. 先全量重开 `V1-GAP-0015` / `V1-GAP-0016` 两组争议年份的来源与下游展示。
2. 抽查 B06/B08 的 source replacement、collection 层级和同名作品去重。
3. 抽查 B10 11 个来源及 43 facts 的原子性、来源等级和中文展示名状态。
4. 机器化复核五批累计实体、来源、card-source、Geo relation 与 Web Data 计数，确认无报告漂移。
5. 检查所有新增 Curation 仍为 `user_review`，并确认公共 bundle 未泄露内部治理字段。

## 9. Handoff state

五批状态：`BATCH_PASS`（各批独立）。本文件仅为 Sol 独立审计交接，不代表 Sol 已作最终审计结论。按用户指令，完成 B10 后停止，不启动 B11、不调用 Sol、不执行 push/PR/release。
