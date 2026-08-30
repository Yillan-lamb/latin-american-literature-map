# WCD-03 Preflight

- Baseline: `main@937767a008ee12424da0f755e9dde826f42ef884`
- Research before: `Data 1.3.0 development candidate`
- Web before: `Web 0.3.0 Development`
- Scope: audit all 371 Research entities; normalize Chinese display names only where direct Chinese publication or institutional evidence supports the exact spelling/title.
- Excluded: new entity families, new fact/relationship types, Research schema expansion, literary-content rewriting, WCD-04, WCD-05, WCD-06 and Public Release.
- Identity rule: entity IDs and original-language anchors remain unchanged.
- Alias rule: the current Research schema has no alias field or alias table. WCD-03 records alias candidates in its audit, but does not invent an unapproved alias schema.
- Migration rule: only the independently reviewed candidate set may enter append-only migration `0030`; `0028`/`0029` remain untouched.

## Candidate disposition

- `REPLACE`: 11 names with direct published/institutional Chinese-name evidence and no direct evidence that the previous provisional label is a separate formal Chinese edition title.
- `ALIAS`: Julio Cortázar retains the charter-approved `胡利奥·科塔萨尔`; the roadmap variant `胡里奥·科塔萨尔` is recorded only as a future alias candidate. `V1-ENT-0187` retains the 作家出版社 title `《短暂的生命》`; the 麦田 title `《短暂的一生》` remains a future alias/edition-title candidate.
- `HOLD`: Roberto Arlt remains `罗贝托·阿尔特` because available variants are not supported consistently enough for replacement; no automatic replacement is authorized.
- All other rows are retained as `PASS`, `PROVISIONAL`, or `NO_CHINESE_NAME_NEEDED` in the full matrix.
