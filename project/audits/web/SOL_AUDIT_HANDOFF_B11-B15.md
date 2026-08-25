# SOL_AUDIT_HANDOFF_B11-B15

## 1. Scope and execution baseline

- Batch scope：`WEB-CE-B11`—`WEB-CE-B15`。
- Git baseline：Sol B06—B10 baseline commit `484d6b621267bc31285023659ad6e46deb56326c`，其中已包含 Sol remediation `dea1003` 对应的内容与 migration reconciliation；本组执行分支为 `codex/web-ce-b11-b15-luna-max`。
- Final B15 commit：`5715af84cc5826401519dc92c6377ad9482a97be`。
- 当前主库：`data/master/V1_MASTER.sqlite`；migration log 20；未修改 `project/governance/PROJECT_CHARTER.md`；未执行 push、PR、Release、tag 或 production deployment。
- 工作区边界：`project/audits/web/V2_RC5_CURATION_USER_REVIEW.md`、`work/external-ai/deliveries/` 下外部 CSV 与 `artifacts/v2-rc5/` 预览产物为其他任务/QA 产物，未纳入五个 Batch commit。

## 2. Five-Batch change matrix

数字由最终 SQLite、各批候选 JSON、Geo CSV 和 migration 机器提取；每批均达到 `BATCH_PASS`。

| Batch | Authors | Works / collections | Facts | Relationships | Sources | Cards | Geo rows | Curation extension | Migration | Commit |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---|---|
| B11 | 3 | 9 | 53 | 12 | 6 | 12 | 3 | 3 / 9 / 0 | `0016_web_ce_b11_luna_max.sql` | `7b26f86c37183af765ae5f0a2909722b92b5bee6` |
| B12 | 3 | 9 | 33 | 12 | 10 | 12 | 3 | 3 / 9 / 0 | `0017_web_ce_b12_luna_max.sql` | `20a27eec5b2c0a69c6fb62b4ce42711c3f870c9` |
| B13 | 3 | 9 | 34 | 12 | 6 | 12 | 3 | 3 / 9 / 0 | `0018_web_ce_b13_luna_max.sql` | `a8f777ec78d30664d8d8b697c8ee8e6c618266b4` |
| B14 | 3 | 9 | 34 | 12 | 7 | 12 | 3 | 3 / 9 / 0 | `0019_web_ce_b14_luna_max.sql` | `566fe5a038c512d87ddabc9eaf7317d444e522f0` |
| B15 | 3 | 9 | 36 | 12 | 7 | 12 | 3 | 3 / 9 / 0 | `0020_web_ce_b15_luna_max.sql` | `5715af84cc5826401519dc92c6377ad9482a97be` |

Migration SHA-256：

- 0016：`bcfde33d73153aa4cce4b5cdd2824fd89b171d38ef9185a6539da66b668308a7`
- 0017：`8a02e0a56bf234a55aa790482954a79f64962681bf308ec5b48a1117e2494078`
- 0018：`f14ea750c1f6dcfa2777cac42a2a68f91911ce0415439bcfc3ba4c7cb35165f9`
- 0019：`68e48f2ce45796694e8217153606beb7ca5702929e15ec5b033fc16cbdc8077d`
- 0020 integrated：`de7184807164f0f076fc34567ad4af97f5457ae7b6ebc44668544c0c5729f050`

## 3. Cumulative delta from the B06—B10 Sol baseline

| Object | Baseline | Final | Delta |
|---|---:|---:|---:|
| entities | 281 | 341 | +60 |
| authors | — | — | +15 |
| works / collections | — | — | +45 |
| facts | 729 | 919 | +190 |
| relationships | 209 | 269 | +60 |
| sources | 222 | 258 | +36 |
| content cards | 171 | 231 | +60 |
| card-source rows | 335 | 451 | +116 |
| relationship evidence | 236 | 296 | +60 |
| relationship-source rows | 233 | 312 | +79 |
| research gaps | 16 | 22 | +6 |
| migration log rows | 15 | 20 | +5 |
| new place entities | — | — | 0 |
| new fictional spaces | — | — | 0 |

Final SQLite checks: `integrity_check=ok`, foreign-key check empty, `validate_master.py` PASS.

## 4. Coverage change

- Author countries represented in B11—B15：阿根廷、智利、古巴、巴西、墨西哥、秘鲁（6 个国家）。B11 阿根廷；B12 阿根廷/智利；B13 巴西/古巴；B14 古巴/墨西哥；B15 秘鲁/阿根廷/古巴。
- Gender coverage（按作者公开身份/roadmap 统计，不作为新 Research fact）：女性 4（Silvina Ocampo、Samanta Schweblin、Mariana Enriquez、Sor Juana Inés de la Cruz），男性 11；下一周期仍需优先补充女性作者与诗歌。
- 45 部新增作品/作品集的已登记形式：小说 20、短篇小说集 10、诗集 6、讲演系列 1、长诗 1、书信/散文 1、戏剧 1、自传 1；4 部作品仍未填形式，保持证据边界。
- 年代覆盖：B11 1926—1976、B12 2006—2016、B13 1930—2003、B14 含 1692—1979（含 composition/event semantics）、B15 1955—1992；B15 的 1973 为 `first_book_edition_year` 版本锚点，不是首版年份。
- Geo：五批各增加 3 条作者—国家关系投影，共 +15；没有新增现实地点或虚构空间坐标。B14 同时以可追溯方式纠正了 B13 Guillén 的 Cuba 节点。

## 5. Open gaps, disputes and holds

### New/open research gaps in this cycle

- B12：`V1-GAP-0017`（V1-ENT-0300）、`V1-GAP-0018`（0301）、`V1-GAP-0019`（0304）、`V1-GAP-0020`（0303）与 `V1-GAP-0021`（0299）均为 `open_research`，重点是首版年份与版权/奖项年份边界。
- B15：`V1-GAP-0022` / `V1-ENT-0340.first_publication_year` 为 `open_research` / `SOL_REVIEW`；正式来源给出 1986，未定位、未核实的 1985 discovery lead 不作为正式证据。
- 本周期新增 HOLD rows：0。B11 Arlt 出生地因来源正文未直接陈述而留空，没有推断地点。

### Disputed-year inventory relevant to Sol

- `V1-GAP-0014`：La invención de Morel，1940/1941。
- `V1-GAP-0015`：既有 1918/1919 版本冲突。
- `V1-GAP-0016`：既有 1991/1992 版本冲突。
- `V1-GAP-0022`：Glosa，1986 与未核实 1985 discovery lead。

### Existing hold inventory (unchanged by B11—B15)

- Source holds：`V1-SH-0001`—`V1-SH-0003`（V1-S3-B02 D 级查询页），`V1-SH-0004`（V1-S4-A05 C 级会议摘要线索）。
- Relationship holds：N2 `V1-HOLD-0001`—`0011`；B01 `0012`—`0018`；B02 `0019`—`0033`；B03 `0034`—`0040`；WEB-CE-B01 `0041`—`0050`；WEB-CE-B03 `0051`。本周期没有静默解除或改写这些 hold。

## 6. High-risk/source review targets

- B11：六个 B 类机构来源均已打开；Arlt 出生地不入库是有意保留的证据边界。
- B12：五个年份 gaps；`SRC-0232` 的 Siete casas vacías 支持范围、`©2014` 与首版年份边界、`SRC-0240` Mapocho 元数据/页码定位。
- B13：`SRC-0246` 只能支持 Guillén 身份、生卒年和诗歌语境；三部作品年份和 CREATED evidence 锚定 `SRC-0245`。
- B14：`SRC-0247` 为 `access_limited`；`SRC-0249` 为 C 类补充来源；`SRC-0251` canonical URL 已修正；`La expresión americana` 形式为讲演系列，`La Habana para un infante difunto` 形式仍开放。
- B15：`SRC-0257`（Diego Vigna; Verónica Bernabei）为西语、`access_limited`，使用 UNL article-view canonical URL；`La palabra del mudo` 1973 edition anchor；Glosa gap；Saer 形式/层级与年份分别使用 `SRC-0256`/`SRC-0257`。
- 所有 15 位新增作者、45 个作品/作品集的中文展示名为 `provisional_title`；未发现重复原文题名、中文同名误合并或暂译名冒充正式出版名。

## 7. Cross-Batch risks

- 阿根廷与古巴国家节点被多个 Batch 复用；必须按 `subject + relation_type + object` 去重。B14 已修正 B13 Guillén 的国家端点，B15 继续复用既有 Cuba/Argentina/Peru 节点。
- B11—B15 没有同一作者重复创建；没有新增作品级现实地点或虚构空间。
- 作品形式仍有 4 个 unknown；不要从题名或常识补齐。
- B12/B15 的年份 gaps 与 B14 的 composition-year 语义都必须在 Sol 审计中检查是否被 Web 文案重新增强。

## 8. Website growth and boundary

- Review package：55 authors、150 works、25 literary places；五批各自新增的 3/9 curation extension 均可回溯。
- Formal public projection：25 authors、60 works、26 places；B11—B15 没有增加 formal public author/work。
- Final Web Data：341 entities、919 facts、269 relationships、258 sources、231 cards、72 place relations；固定 `generated_at=2026-08-21T12:00:00Z` 两次重建字节一致。
- Internal review preview：255 files、247 routes；五批新增对象均可在 preview 中搜索、查看 Research Evidence、打开作者/作品 route 并出现在时间线消费路径；review queue 未暴露到 public bundle。
- Public search index 仍严格等于 `public_scope`；待审作者/作品未通过前端硬编码进入正式 public。

## 9. QA matrix

| Batch | Review | Migration / master | Curation / Web | Preview / browser |
|---|---|---|---|---|
| B11 | PASS | PASS | PASS | 30/30 Chromium PASS |
| B12 | REVISE → PASS | PASS；5 gaps persisted | PASS | 30/30 Chromium PASS |
| B13 | REVISE → PASS | PASS；Guillén source anchor corrected | PASS | 30/30 Chromium PASS |
| B14 | REVISE → PASS | PASS；cross-batch Cuba remediation | PASS | 30/30 Chromium PASS |
| B15 | REVISE → PASS（3 focused follow-ups） | PASS；continuous 0016—0020 replay | PASS | 30/30 Chromium PASS |

All five batches also passed `validate_master.py`, SQLite integrity/FK checks, curation quality, Web Data validator, deterministic rebuild, public-boundary bundle checks, `node --check site/app.js`, `git diff --check`, full sitemap HTML QA, and Chromium desktop/mobile core paths. No frontend logic was changed in B11—B15, so Firefox/WebKit expansion was not required by the batch gate.

## 10. Recommended Sol focus

1. Re-open B12’s five year gaps and B15’s Glosa gap; verify that edition/award/copyright years remain separated from first-publication years in Research, Curation and Timeline.
2. Re-open access-limited or C-level sources (`SRC-0232`, `SRC-0240`, `SRC-0247`, `SRC-0249`, `SRC-0257`) and confirm source identity/support scope rather than relying on URL existence.
3. Recheck cross-Batch country-node reuse and the B13→B14 Guillén remediation, plus B15’s three Geo rows against SQLite evidence.
4. Check that the 55/150 review package remains separate from the 25/60/26 formal public projection and that no `user_review` field was auto-approved.
5. Review coverage imbalance: 6-country expansion is positive, but poetry/Caribbean/Andean/Central American and female-author coverage still needs deliberate roadmap attention.

## 11. Handoff status

All five batches are independently committed and `BATCH_PASS`. This package is ready for Sol’s independent audit. Do not start B16 or alter the roadmap automatically.
