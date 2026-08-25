# WEB-CE-B03 QA

## Data layer

- B03 migration copy with foreign keys enabled: PASS.
- data/master/V1_MASTER.sqlite migration application: PASS.
- python3 scripts/validate_master.py data/master/V1_MASTER.sqlite: PASS.
- PRAGMA integrity_check: ok.
- PRAGMA foreign_key_check: empty.
- B03 entity, original-title, source, relationship-endpoint and source-title checks: PASS.
- Geo CSV audit: PASS (29 places; 36 accepted map relations; Santa María fictional/hidden with blank latitude and longitude).
- B03 relation semantic gate: PASS after follow-up reviewer; V1-REL-0127 is held as V1-HOLD-0051 and is absent from public Geo relations.

## Web data and public boundary

- python3 scripts/build_v2_public_content.py: PASS.
- python3 scripts/validate_v2_content_quality.py: PASS (review_package).
- python3 scripts/build_v2_web_data.py --generated-at 2026-08-20T00:00:00+08:00: PASS.
- python3 scripts/validate_v2_web_data.py: PASS.
- Public deploy bundle build: PASS (99 files / 91 routes / 92 HTML files with confirmed HTTPS origin).
- Public bundle validator: PASS (public_entities 87; forbidden_keys empty; sitemap 91 URLs).
- Public UI governance-language scan: PASS (92 HTML files).
- Deterministic generated timestamp: PASS (2026-08-20T00:00:00+08:00).

## Browser

- Chromium desktop + mobile core paths: npm run qa:browser:chromium -> 28 passed.
- Coverage includes home/map, Search, country, author, work, source/evidence, timeline, fictional-space safety, B01/B02 samples and B03 Onetti/Donoso/Sabato/works/Uruguay routes.
- No map, route, or general template logic was changed; Firefox/WebKit expansion was not required for this batch.

## Engineering checks

- node --check site/app.js: PASS.
- node --check tests/browser/public-product.spec.cjs: PASS.
- git diff --check on B03 scoped paths: PASS.
- No project/governance/PROJECT_CHARTER.md change, secret, production deployment, release tag, or local absolute path entered the batch files.

## QA coverage adjustment

The existing public browser smoke test was extended from B01/B02 samples to include B03 author, work and Uruguay routes. It remains data-driven for country count and sitemap route parsing; no single-author frontend special case was added.
