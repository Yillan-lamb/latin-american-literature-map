# WCD-03 Review and Targeted Remediation

- Initial independent reviewer: `FARADAY-WCD03-REVIEW`
- Targeted remediation reviewer: `CODEX-WCD03-TARGETED-REPAIR`
- Final verdict: **PASS**
- Scope: only PR #18 Chinese display-name decisions, direct name evidence, migration and projections; no WCD-04 work.

## Superseded first-pass conclusions

The initial review correctly found the Cortázar entity-ID error and corrected three retail/community sources from C to D, but incorrectly treated D-level discovery sources as sufficient for formal display-name replacement. It also treated `La vida breve` as a simple wrong-to-right replacement. Those conclusions are superseded by this remediation.

## Multi-edition rule and result

`REPLACE` requires both (a) direct qualified evidence for the new display name and (b) confirmation that the old name is not itself a formal Chinese publication title that must be retained. Multiple formal edition titles are governed as alias/edition-title candidates, not erased by overwrite.

The 12 original REPLACE rows were rechecked in `REPLACE_MULTI_EDITION_RECHECK.csv`. `V1-ENT-0187` is reclassified to `ALIAS`: the 作家出版社 2024 edition and government procurement record directly support `《短暂的生命》`, while the 麦田 edition supports `《短暂的一生》`. The current title is retained, and the latter remains recorded as a future alias/edition-title candidate without adding a schema field. The other 11 old labels originated under explicit `provisional_title` / no-Chinese-edition-claim policy; exact-name checks found no second direct formal-edition record, so their qualified replacements remain.

## D-level remediation

- `WCD03-SRC-02` remains a D-level discovery candidate for the 麦田 title and does not enter formal `sources` or `card_sources`.
- `WCD03-SRC-04` no longer relies on Douban. A B-level Inner Mongolia government procurement record directly shows `《毁灭者亚巴顿》`, 埃内斯托·萨瓦托, 四川文艺出版社 and ISBN `9787541159299`.
- `WCD03-SRC-05` no longer relies on Douban. A B-level Henan government procurement record directly shows `《营救距离》`, 萨曼塔·施维伯林, 人民文学出版社 and ISBN `9787020134663`.
- `WCD03-SRC-11` is the B-level Henan government procurement record for `《短暂的生命》`, 胡安·卡洛斯·奥内蒂, 作家出版社 and ISBN `9787521229967`.

No source was artificially upgraded. Final WCD-03 formal additions are 8 B and 2 C sources; whole-master distribution is A 48 / B 219 / C 10 / D 11.

## Migration and invariant review

Because PR #18 was not merged, the invalid 0030 and metadata-only 0031 were rebuilt into one clean final `0030_wcd03_chinese_display_names.sql` from `origin/main@937767a`. No 0032 reversal was created. Migration 0028/0029 and Geo Data are unchanged.

The final comparison against main confirms identical entity IDs/types/original names, complete facts, relationship IDs/endpoints/types/status/evidence counts, relationship evidence and relationship-source rows. Only the 11 accepted display replacements, their directly supporting sources/card mappings, and corresponding reader-visible descriptions change.
