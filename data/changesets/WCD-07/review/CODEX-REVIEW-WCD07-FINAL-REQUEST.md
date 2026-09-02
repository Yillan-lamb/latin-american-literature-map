# CODEX-REVIEW-WCD07-FINAL — Focused Request

## Scope

This is a fresh-context, focused governance re-review of the existing WCD-07
PR. It is not a rerun of WCD-07 research. Review only:

1. source-level compliance with Data SOP §6.3;
2. the six P0 source gates after regrading;
3. W05/W06 Chinese display provenance;
4. consistency among `07A_P0/SOURCE_CANDIDATES.csv`, migration 0035, the
   formal SQLite rows, exported `sources`/`card_sources`/`entities`, and Web
   Data counts;
5. the full local QA result.

Do not reopen the 17 WCD-07B candidates or alter their 17/17 DEFER result. Do
not research P1 later, P2, P3, WCD-06 gaps, or WCD-08. Do not change the six P0
entities, 29 admitted facts, or six `CREATED` relationships unless a defect is
directly caused by this focused remediation.

The only permitted final verdicts are `PASS`, `REVISE`, or `REJECT`.

## Source-level target state

The actual-source classification is:

- B: SRC-0301, SRC-0308, SRC-0309, SRC-0311, SRC-0312, SRC-0313,
  SRC-0315, SRC-0316 and reused SRC-0201;
- C: SRC-0302, SRC-0303, SRC-0304, SRC-0305, SRC-0310 and reused SRC-0281;
- A: SRC-0306, SRC-0307, SRC-0314.

`SRC-0304` remains `format=journal_review`: no inspected evidence establishes
that the reviewed object is a peer-reviewed research article, so the host
journal does not elevate it above C.

## Six P0 gate after regrading

| Candidate | Direct independent research pair | Gate rationale |
|---|---|---|
| W01 Terra Nostra | SRC-0301 B + SRC-0302 C | institutional work record plus independent university news/features page; claims remain bounded |
| W02 El arte de la fuga | SRC-0201 B + SRC-0304 C | institutional bibliography plus independent professional review; no high-intensity relation |
| W03 Versos libres | SRC-0306 A + SRC-0307 A | two independently authored studies |
| W04 La fiesta del Chivo | SRC-0308 B + SRC-0309 B | official bibliography plus publisher work catalog |
| W05 El zorro de arriba y el zorro de abajo | SRC-0311 B + SRC-0312 B | national-library record plus publisher catalog |
| W06 Terras do sem-fim | SRC-0313 B + SRC-0314 A | national-library article plus independent peer-reviewed study |

## Chinese display provenance

- `SRC-0315` / `WCD07A-S18`: Zhejiang Xinhua institutional
  library-acquisition catalog, People's Literature Publishing House, June
  2024, *《山上的狐狸，山下的狐狸》*, Zhu Jinyu, ISBN 9787020186723. Attached
  only as `source_role=chinese_display` to `V1-CARD-0260`.
- `SRC-0316` / `WCD07A-S19`: Fujian Jiangxia University Library catalog,
  Shanghai Translation Publishing House, 1992, *《无边的土地》*, Wu Lao,
  ISBN 7-5327-0345-2, parallel/original title *Terras do sem fim*. Attached
  only as `source_role=chinese_display` to `V1-CARD-0261`.

No edition entity was added. Both entity normalization bases explicitly record
the provenance linkage.

## Mechanical QA evidence

- master validator: PASS; integrity `ok`; foreign keys 0;
- migration replay: PASS; 35 migrations; 19 tables equal;
- deterministic SQLite export rebuild: PASS;
- deterministic Web Data rebuild and validator: PASS;
- content-quality validator: PASS;
- public deployment bundle: PASS; 137 routes, 128 public entities, no review
  queue exposure;
- Python unit tests: PASS, 25/25;
- full Playwright matrix: PASS, 84/84 across Chromium desktop/mobile, Firefox
  desktop, and WebKit mobile;
- frontend syntax and `git diff --check`: PASS.

Expected formal counts are 377 entities, 1027 facts, 334 relationships, 314
sources, 261 content cards, and 528 card-source links. Research remains Data
1.5.0 development candidate; Schema 0.4; Web 0.3.3 Development.
