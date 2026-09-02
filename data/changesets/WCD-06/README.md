# WCD-06 Change Set

This directory is the traceable Author & Work Descriptive Content Completion
package rebased from `main@f47ab5793101f85437a793ab45cd0e241ad6cc73`.

- `PREFLIGHT.md` and `WCD06_CURRENT_DESCRIPTION_MATRIX.csv`: current-main baseline.
- `EXTERNAL_WCD06_REBASE.csv`: all 1723 external field candidates rebased; the external directories remain read only.
- `EXTERNAL_READONLY_SHA256.csv`: path, size, and SHA-256 manifest used to recheck that both ignored external directories remain unchanged during review and finalization.
- `CS01_LOW_JUDGMENT_REVIEW.csv`: 06A review-queue decisions.
- `CS02_BIBLIOGRAPHIC_REWRITES.csv`: 06B page-level rewrite/gap decisions.
- `CS03_MISSING_MINIMUM_CONTENT.csv`: 06C zero-content decisions.
- `CS04_AUTHOR_PROFILE_ENRICHMENT.csv`: 06D author profile and connection decisions.
- `WCD06_RESEARCH_GAPS.csv`: 06E research handoff; not approved WCD-07 work.
- `curation/PUBLIC_CONTENT_PATCH.json`: formal field-level overrides and additions consumed by the deterministic Curation builder.
- `review/`: fresh-context independent review request and final verdict.

Research Master, migrations, Data version, and Schema are unchanged. Public
Release remains paused.
