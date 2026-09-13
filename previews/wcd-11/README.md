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

## Full editorial template preview

The current review pass applies the reference-driven editorial system to the
complete public author/work surface, not only to two showcase records:

- home / literary map;
- complete author catalog and all 25 public author details;
- complete work catalog and all 62 public work/collection details;
- complete 127-entry public search index;
- complete 87-entry public author/work timeline;
- anecdotes;
- about.

Their shared editorial system is isolated in `styles/master.css`, while
`imagery/master-pages.js` provides data-driven catalog, author, work, search and
timeline templates. Borges and *One Hundred Years of Solitude* retain their
bespoke showcase compositions inside the same system. Country, place, reading
path and other exploration nodes continue to use the existing data-driven
renderer and are not claimed as formally integrated.

`capture-masters.mjs` writes 22 full-page screenshots for 11 representative
masters at 1440×900 and 390×844 to `screenshots/`, plus a machine-readable
`screenshots/visual-regression.json`. It also fails on a wrong master renderer,
page-level horizontal overflow, broken images, HTTP/console errors, missing
master regions, incomplete catalog/search/timeline counts, or non-responsive
map/search/timeline controls.

Current scope:

- parchment and archival background system;
- nautical map plate with the existing interactive geography rendered above it;
- licensed author portraits and project-owned editorial imagery;
- larger reading-path typography and author portraits on the home page;
- muted anecdote red with WCAG-level text contrast;
- desktop/mobile static routes, including direct `file://` navigation compatibility;
- asset provenance in `ASSET_REGISTER.csv`.

This is a **Draft PR review artifact**, not the formal WCD-11 integration. Do not merge it as a release or treat it as approval of the Web `0.6.0` recommendation. Formal integration remains subject to the WCD-11 Spec, independent review, production build/validator, browser matrix, Lighthouse, map gates, and explicit USER approval.
