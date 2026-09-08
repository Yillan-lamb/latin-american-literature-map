# WCD-09 Map Governance and Geographic Neutrality

- Canonical task: `TASK-099 / WCD-09`
- Status: `IN_PROGRESS / USER_GATE`
- Integration target: current `origin/main`
- Independent audit: `project/audits/web/WCD_09_GEO_NEUTRALITY_RESEARCH_AUDIT.md`
- Release boundary: `V2-PUBLIC-RELEASE` remains `PAUSED BY USER`

## Background

WCD-09 replaces the current map's unversioned Natural Earth derivative and affine longitude/latitude rendering with a reproducible, licensed and geographically neutral implementation. It also closes known coverage, place-coordinate, naming, accessibility and political-risk gaps before any future Public Release.

The material in this directory began as an external-AI research package. After iterative remediation, Codex independently recomputed its mechanical claims, checked its cross-file gates and dependencies, reviewed its source and neutrality boundaries, and issued a final `YES` audit. The accepted artifacts are promoted here as the tracked implementation specification; the ignored `work/external-ai/` copy remains provenance and process history, not the canonical task location.

## Goals

1. Establish a versioned and reproducible basemap acquisition and transformation chain.
2. Separate background coverage (L1) from literary interaction eligibility (L2).
3. Select and implement a projection using measurable distortion criteria.
4. Correct coordinate provenance, duplicate geography entities and off-canvas interaction.
5. Apply case-specific neutral naming, line treatment, disclosure and licensing rules.
6. Finish CH-01 through CH-25 with mechanical, browser and independent-review evidence.

## Non-goals

- This promotion does not choose any of the 17 pending USER Gate options.
- It does not modify `site/`, Research Data, Curation, Web Data, versions or public scope.
- It does not authorize a tag, GitHub Release, deployment or removal of the Public Release pause.
- `CANNOT_VERIFY` facts are not upgraded by inclusion in this tracked specification.

## Canonical artifacts

- `00_PREFLIGHT.md` through `13_DISCLAIMER_OPTIONS.md`: baseline, evidence and policy analysis.
- `14_GIT_BACKLOG.md`: CH-01 through CH-25, dependencies and acceptance criteria.
- `15_USER_DECISION_GATES.md`: the 17 stable USER decisions and recording slots.
- `16_EVIDENCE_APPENDIX.md`: reproducibility notes and case-by-case evidence status.
- `generate_projection_evidence.py` and `generate_aeqd_evidence.py`: deterministic projection evidence generator/checker.
- `validate_wcd09_package.py`: structural, semantic, cross-reference and dependency validator.
- `figures/`: deterministic projection comparison outputs.

Historical remediation reports, superseded audits and external handoff notes are intentionally not promoted. Current audit status is recorded only in the formal audit linked above.

## Implementation sequence

1. USER records A-1 through E-1 in `15_USER_DECISION_GATES.md`; C-8 is the scope meta-decision.
2. Implement the selected paths in the dependency order defined by `14_GIT_BACKLOG.md`.
3. Run the package validator and projection evidence checker after any specification/evidence change.
4. Run the CH-specific repository and browser acceptance gates.
5. Obtain a fresh independent WCD-09 implementation audit before marking `TASK-099` done.

## Research-package verification

```bash
cd project/plans/WCD_09_GEO_NEUTRALITY
python3 validate_wcd09_package.py
MPLCONFIGDIR=/private/tmp/wcd09-mplconfig python3 generate_aeqd_evidence.py --check
```

Both commands must pass. The second command is read-only in `--check` mode.
