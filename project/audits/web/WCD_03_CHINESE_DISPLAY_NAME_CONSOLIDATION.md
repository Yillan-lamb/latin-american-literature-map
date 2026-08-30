# WCD-03 Chinese Display Name Consolidation Audit

- Baseline: `main@937767a008ee12424da0f755e9dde826f42ef884`
- Research before / after: `Data 1.3.0 development candidate` → `Data 1.3.1 development candidate`
- Web before / after: `Web 0.3.0 Development` → `Web 0.3.1 Development`
- Final status: **PASS / DONE（待 PR 最终验收）**
- Public Release: **PAUSED BY USER**

## Scope, rule and final decisions

All 371 Research entities remain represented one-to-one in `WCD_03_CHINESE_NAME_REVIEW_MATRIX.csv`.

| Decision | Count |
| --- | ---: |
| PASS | 225 |
| PROVISIONAL | 126 |
| REPLACE | 11 |
| NO_CHINESE_NAME_NEEDED | 6 |
| ALIAS | 2 |
| HOLD | 1 |
| Total | 371 |

REPLACE 不仅要求 new name 有直接证据，还要求 old name 不属于需要保留的正式中文出版译名；多正式译名进入 alias/edition-title 治理，不通过覆盖解决。若自动审计不能确认 old/new 的版本语义，则保持原展示名，不执行全局替换。

The 12 original REPLACE rows were rechecked individually in `data/changesets/WCD-03/REPLACE_MULTI_EDITION_RECHECK.csv`. Apart from V1-ENT-0187, no other old label produced a direct formal Chinese-edition/name record. The other 11 old labels were also confirmed to originate under the historical `provisional_title` policy, which expressly made no Chinese-edition bibliographic claim.

## V1-ENT-0187 multi-edition disposition

`V1-ENT-0187 / La vida breve` is `ALIAS`, not `REPLACE`:

- retain current `name_zh = 《短暂的生命》` (作家出版社 2024; ISBN `9787521229967`);
- record `《短暂的一生》` (麦田出版社) as a future alias/edition-title candidate;
- do not add an alias field or table in Schema 0.3;
- do not delete the D-level discovery record;
- do not force-replace cards, relationships, hold evidence, Curation, Web, search, titles or SEO;
- keep routes based on `original_name + entity_id` unchanged.

No mainland-versus-Taiwan canonical-selection rule was invented: the existing current title is retained because both are real versions and the schema cannot model editions yet.

## Final accepted replacements

| Entity | Before | After | Direct evidence |
| --- | --- | --- | --- |
| V1-ENT-0172 | 豪尔赫·亚马多 | 若热·亚马多 | SRC-0281 / 中国作家网 |
| V1-ENT-0190 | 《夜晚的淫鸟》 | 《污秽的夜鸟》 | SRC-0283 / 政府采购书目 |
| V1-ENT-0195 | 《阿巴顿，毁灭者》 | 《毁灭者亚巴顿》 | SRC-0284 / 内蒙古政府采购书目 |
| V1-ENT-0296 | 萨曼塔·施韦布林 | 萨曼塔·施维伯林 | SRC-0285 / SRC-0286 |
| V1-ENT-0299 | 《救援距离》 | 《营救距离》 | SRC-0285 / 河南政府采购书目 |
| V1-ENT-0300 | 《口中之鸟》 | 《吃鸟的女孩》 | SRC-0286 / 高校图书馆 |
| V1-ENT-0302 | 《我们在火中失去的东西》 | 《火中遗物》 | SRC-0287 / 塞万提斯学院北京 |
| V1-ENT-0303 | 《我们的夜晚》 | 《属于我们的夜晚》 | SRC-0288 / 外研社目录 |
| V1-ENT-0304 | 《床上吸烟的危险》 | 《床上抽烟危险》 | SRC-0289 / 高校图书馆 |
| V1-ENT-0306 | 《树木的私生活》 | 《树的隐秘生活》 | SRC-0290 / 中国作家网 |
| V1-ENT-0307 | 《回家的方式》 | 《回家的路》 | SRC-0290 / 中国作家网 |

## D-level evidence remediation

The Data SOP defines D as discovery-only. Final handling is:

- `WCD03-SRC-02`: D, `discovery_only`; retained in the change-set audit only and absent from formal `sources`/`card_sources`.
- `WCD03-SRC-04`: replaced by B-level government procurement bibliographic evidence for `《毁灭者亚巴顿》`, author, publisher and ISBN.
- `WCD03-SRC-05`: replaced by B-level government procurement bibliographic evidence for `《营救距离》`, author, publisher and ISBN.
- `WCD03-SRC-11`: new B-level direct record supporting continued use of `《短暂的生命》`.

No D source is the sole formal basis of a replacement. Final whole-master source-level distribution is A 48 / B 219 / C 10 / D 11; the 10 formal WCD-03 additions are B 8 / C 2 / D 0.

## Migration, projection and technical debt

Because 0030/0031 had not entered main, the final migration chain was rebuilt from the main baseline into one corrected `0030`; the metadata-only 0031 was folded into it and removed. No 0032 reversal exists.

- `0030_wcd03_chinese_display_names.sql` SHA-256: `06058fb16faba54c53b3aee16e997fa31a6fb675b36c7ea88f52e2db83fdf08d`
- Final master SHA-256: `4d90e7e49c58def1549be18af693685610983816d5113a1e5c91c9582937fb7c`
- Final Research counts: 371 entities / 998 facts / 306 relationships / 288 sources / 255 cards / 30 migrations.

Entity IDs/types/original names, all facts, relationship IDs/endpoints/types/evidence, migrations 0028/0029 and Geo Data are unchanged. Curation → Web Data → the 128-route public bundle were rebuilt. Public/search/page-title/SEO output now consistently uses `《短暂的生命》`; route paths are unchanged.

`WCD03_DISPLAY_REPLACEMENTS` contains only the 11 accepted canonical replacements. The hard-coded map is a compatibility bridge for immutable historical change sets, not a second permanent name truth source. A future governed alias/display-name model should replace it with data-driven projection rather than extending the map indefinitely.

## Version, QA and stop condition

Research remains `Data 1.3.1 development candidate` and Web remains `Web 0.3.1 Development`; this PR-internal correction does not increment either patch again. They are patches because only compatible Chinese display names/evidence and reader-visible labels change—no schema, large entity set, new fact/relationship family or coverage expansion justifies `1.4.0` / `0.4.0`.

Local final-candidate gates passed: master integrity/FK; replay of all 30 migrations with 19 tables equal; byte-deterministic exports, Curation and Web rebuilds; content/Web/public-bundle validators; 129 HTML files and 128 sitemap routes; frontend syntax; 20 unit tests; 84 Playwright tests across Chromium desktop/mobile, Firefox desktop and WebKit mobile; Lighthouse accessibility/best-practices/SEO 100, performance 71 and agentic-browsing 89; `git diff --check`. GitHub Actions checks are a fail-closed merge gate and must be green for the exact pushed candidate before merge.

WCD-03 remains `DONE（待 PR 最终验收）`; WCD-04 is `READY / NOT STARTED`; WCD-05 and WCD-06 remain `LOCKED`; Public Release remains `PAUSED BY USER`.
