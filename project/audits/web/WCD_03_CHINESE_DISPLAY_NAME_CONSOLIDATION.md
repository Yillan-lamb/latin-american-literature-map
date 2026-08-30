# WCD-03 Chinese Display Name Consolidation Audit

- Baseline: `main@937767a008ee12424da0f755e9dde826f42ef884`
- Research before / after: `Data 1.3.0 development candidate` → `Data 1.3.1 development candidate`
- Web before / after: `Web 0.3.0 Development` → `Web 0.3.1 Development`
- Final status: **PASS / DONE**
- Public Release: **PAUSED BY USER**

## 1. Scope and method

WCD-03 audited all 371 current Research entities before changing any name. The reproducible matrix is `WCD_03_CHINESE_NAME_REVIEW_MATRIX.csv`; its rows match the master entity IDs one-to-one, without duplicates or omissions.

| Decision | Count |
| --- | ---: |
| PASS | 225 |
| PROVISIONAL | 126 |
| REPLACE | 12 |
| NO_CHINESE_NAME_NEEDED | 6 |
| ALIAS | 1 |
| HOLD | 1 |
| Total | 371 |

Priorities are P0 formal public scope 118, P1 curation review scope 145, P2 remaining places 3 and P3 other Research-only entities 105. The public and review scopes overlap by design only through the P0 precedence rule; every entity receives exactly one priority.

The gate was conservative: a roadmap spelling, same original-language identity, or plausible transliteration was not enough by itself. A replacement required a source that directly displayed the exact Chinese author name or title. Translator, publisher, Chinese publication year and ISBN were captured when available but were not mandatory fields for every row.

## 2. Accepted replacements

| Entity | Before | After | Direct name evidence |
| --- | --- | --- | --- |
| V1-ENT-0172 | 豪尔赫·亚马多 | 若热·亚马多 | SRC-0281 / 中国作家网 |
| V1-ENT-0187 | 《短暂的生命》 | 《短暂的一生》 | SRC-0282 / 中文出版品目录 |
| V1-ENT-0190 | 《夜晚的淫鸟》 | 《污秽的夜鸟》 | SRC-0283 / 人民文学版本目录 |
| V1-ENT-0195 | 《阿巴顿，毁灭者》 | 《毁灭者亚巴顿》 | SRC-0284 / 四川文艺版本目录 |
| V1-ENT-0296 | 萨曼塔·施韦布林 | 萨曼塔·施维伯林 | SRC-0285 / SRC-0286 |
| V1-ENT-0299 | 《救援距离》 | 《营救距离》 | SRC-0285 / 人民文学版本目录 |
| V1-ENT-0300 | 《口中之鸟》 | 《吃鸟的女孩》 | SRC-0286 / 高校图书馆目录 |
| V1-ENT-0302 | 《我们在火中失去的东西》 | 《火中遗物》 | SRC-0287 / 塞万提斯学院北京 |
| V1-ENT-0303 | 《我们的夜晚》 | 《属于我们的夜晚》 | SRC-0288 / 外研社目录 |
| V1-ENT-0304 | 《床上吸烟的危险》 | 《床上抽烟危险》 | SRC-0289 / 高校图书馆目录 |
| V1-ENT-0306 | 《树木的私生活》 | 《树的隐秘生活》 | SRC-0290 / 中国作家网 |
| V1-ENT-0307 | 《回家的方式》 | 《回家的路》 | SRC-0290 / 中国作家网 |

Two author names and ten work/collection titles changed. No entity was merged or split. `entity_id`, `entity_type` and `original_name` remain stable.

## 3. Alias, provisional and HOLD boundary

- Julio Cortázar remains the charter-approved `胡利奥·科塔萨尔`. The roadmap variant `胡里奥·科塔萨尔` is only a future alias candidate.
- Roberto Arlt remains `罗贝托·阿尔特` on HOLD because the available variants are not supported consistently enough for a replacement.
- 126 working translations remain explicitly `PROVISIONAL`; WCD-03 does not manufacture publication claims for them.
- Six project-internal Chinese theme concepts require no foreign-language `original_name` and are classified `NO_CHINESE_NAME_NEEDED`.

The current Research schema has neither an alias table nor a display-name-status column. WCD-03 therefore records alias/status decisions in the audit/change set and proposes a future minimal additive alias model, but does not invent one inside this patch. Until such a model is separately governed, previous labels are not promised as searchable aliases.

## 4. Reviewer and migration

The independent fresh-context Reviewer first returned `REVISE`, correctly catching an entity-ID mapping error, three source-level errors, unsupported year precision and overstatement in alias/HOLD notes. After correction, the focused re-review returned `PASS`.

- `0030_wcd03_chinese_display_names.sql` SHA-256: `3d40813618ff7d0619458f4e9465d03129c1f6c51cea4380d4b251e4f40c1eb4`
- `0031_wcd03_patch_version_metadata.sql` SHA-256: `c70a3924c61d8fcfebb3641b1340b0768b260acb73d50e800c876a58992f70a1`
- Final master SHA-256: `3853ff56188c579c2a2a34d0cc357ea50c23d7ea100387a7ae6fdb5941831a67`

Migration 0031 is intentionally append-only: post-build QA found that 0030 had updated the package label but not the separate `research_version` key. The correction was independently reviewed and appended rather than silently rewriting 0030.

Final Research counts are 371 entities, 998 facts, 306 relationships, 288 sources and 255 content cards. Compared with WCD-02, facts and the relationship ID/endpoint/type/evidence set are unchanged; existing relationship and hold descriptions only receive the mechanical Chinese-name substitution. Ten display-name sources and thirteen card-source mappings were added.

## 5. Projection and route behavior

Curation, Geo and Web Data were rebuilt from the reviewed state. Historical WEB-CE change sets remain unchanged; the public-content builder applies the WCD-03 exact-name map during deterministic projection. This prevents old immutable change sets from reintroducing stale labels without rewriting their history.

The active V2 projections contain no stale instance of the 12 replaced names. Search labels, reader-visible author/work names, page titles and SEO names use the reviewed forms. Routes remain stable because slugs are generated from `original_name` plus entity ID, neither of which changed. Geo retains 38 places and 91 relations.

Review package scope remains 61 authors / 168 works / 25 places. Formal public scope remains 25 authors / 60 works / 32 places / 2 nodes. The WCD-03 manifest records these live counts; the historical `V2.0.0-rc.5` release-control manifest is intentionally not rewritten because it is a superseded historical candidate and Public Release remains paused.

## 6. Version decision

Research changes from `Data 1.3.0 development candidate` to `Data 1.3.1 development candidate`. This is a patch because it governs names and adds direct display-name evidence without large-scale entities, a new schema, a new family of facts/relationships, or material coverage expansion. `Data 1.4.0` is therefore not used.

Web changes from `Web 0.3.0 Development` to `Web 0.3.1 Development` because formal-public author/work labels, search results, page titles and SEO output change. The product model, public scope, route structure and `v2-web-0.2` schema remain unchanged, so `Web 0.4.0` is not used.

## 7. Validation and stop condition

All required gates passed: master integrity and foreign keys; replay of all 31 migrations with 19 tables equal; deterministic CSV/JSON/XLSX export; deterministic Curation and Web rebuild; content-quality and Web validators; 128-route public bundle and 129 HTML checks; frontend syntax; 17 unit tests; and 84 Playwright cases across Chromium desktop/mobile, Firefox desktop and WebKit mobile. Lighthouse passed with accessibility/best-practices/SEO at 100 for home and work samples; performance was 71 and agentic-browsing 89 under the existing development gate.

WCD-03 ends here. WCD-04 is `READY / NOT STARTED`; WCD-05 and WCD-06 remain locked. Public Release remains `PAUSED BY USER`.
