# WCD-11 imagery design preview

This directory is a review-only snapshot of the current TASK-128 / WCD-11 visual candidate.
It is intentionally separate from `site/`, the production build, Web Data, and release artifacts.

## Run locally

From the repository root:

```bash
python3 -m http.server 8188 --bind 127.0.0.1
```

Then open `http://127.0.0.1:8188/previews/wcd-11/imagery/`.

## Rebuild and verify

```bash
node previews/wcd-11/imagery/build.mjs
BASE=http://127.0.0.1:8188/previews/wcd-11/imagery node previews/wcd-11/qa-imagery.mjs
BASE=http://127.0.0.1:8188/previews/wcd-11/imagery node previews/wcd-11/capture-masters.mjs
```

## Six visual masters

The current review pass reconstructs six reference-driven visual masters only:

- home / literary map;
- Jorge Luis Borges author detail;
- *One Hundred Years of Solitude* work detail;
- anecdotes;
- timeline;
- about.

Their shared editorial system is isolated in `styles/master.css`, while
`imagery/master-pages.js` intercepts only the two named detail records and the
three named index routes. The remaining generated route shells continue to use
the existing generic renderers and must not be treated as visually approved.

`capture-masters.mjs` writes full-page screenshots for each master at 1440×900
and 390×844 to `screenshots/`, plus a machine-readable
`screenshots/visual-regression.json`. It also fails on a wrong master renderer,
page-level horizontal overflow, broken images, HTTP/console errors, missing
master regions, or non-responsive map/timeline controls.

Current scope:

- parchment and archival background system;
- nautical map plate with the existing interactive geography rendered above it;
- licensed author portraits and project-owned editorial imagery;
- desktop/mobile static routes, including direct `file://` navigation compatibility;
- asset provenance in `ASSET_REGISTER.csv`.

This is a **Draft PR review artifact**, not the formal WCD-11 integration. Do not merge it as a release or treat it as approval of the Web `0.6.0` recommendation. Formal integration remains subject to the WCD-11 Spec, independent review, production build/validator, browser matrix, Lighthouse, map gates, and explicit USER approval.
