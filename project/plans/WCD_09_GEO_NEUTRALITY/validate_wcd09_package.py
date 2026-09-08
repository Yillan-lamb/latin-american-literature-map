#!/usr/bin/env python3
"""Read-only structural and semantic checks for the WCD-09 research package.

The validator deliberately checks the package only.  It never edits source data,
site files, project governance files, or the immutable audit records.
"""

from __future__ import annotations

import csv
import math
import re
import sys
from collections import Counter
from pathlib import Path


PACK = Path(__file__).resolve().parent
IMMUTABLE: set[str] = set()
GATE_IDS = {
    *(f"A-{n}" for n in range(1, 4)),
    "B-1",
    *(f"C-{n}" for n in range(1, 9)),
    *(f"D-{n}" for n in range(1, 5)),
    "E-1",
}
CASE_IDS = {f"RISK-{n:02d}" for n in range(1, 21)}
CH_IDS = {f"CH-{n:02d}" for n in range(1, 26)}
UNNUMBERED_GATE = re.compile(r"\bGate\s+([A-E])(?!\s*[-–])\b")
STABLE_GATE = re.compile(r"\b[A-E]-[1-9]\d?\b")
CH_REF = re.compile(r"\bCH-(?:0?[1-9]|1\d|2[0-5])\b")
# Reject compact dependency notation; every dependency must repeat the complete CH identifier.
# Every business dependency must repeat the complete CH identifier.
CH_SHORT_REF = re.compile(
    r"\bCH-(?:0?[1-9]|1\d|2[0-5])/(?:CH-)?(?:0?[1-9]|1\d|2[0-5])\b"
)
COMPACT_RISK_REF = re.compile(r"\bRISK-\d{1,3}(?:/\d{1,3})+\b")
COMPACT_NAME_REF = re.compile(r"\bNAME-\d{1,3}(?:/\d{1,3})+\b")
COMPACT_MAPSRC_REF = re.compile(r"\bMAPSRC-\d{1,3}(?:/\d{1,3})+\b")

BASEMAP_RISK_MAP = {
    "Argentina": {"RISK-20"},
    "Chile": {"RISK-09", "RISK-20"},
    "Bolivia": {"RISK-09"},
    "Colombia": {"RISK-10"},
    "Nicaragua": {"RISK-10"},
    "Guatemala": {"RISK-03"},
    "Belize": {"RISK-03", "RISK-19"},
    "Venezuela": {"RISK-02"},
    "Guyana": {"RISK-02", "RISK-15"},
    "Suriname": {"RISK-15"},
    "Puerto Rico": {"RISK-05"},
    "Cuba": {"RISK-13"},
    "Falkland Islands": {"RISK-01"},
    "Mexico": {"RISK-17"},
}
BASEMAP_EXPECTED_BANDS = {
    "Argentina": "MEDIUM-HIGH",
    "Chile": "MEDIUM-HIGH",
    "Bolivia": "NONE",
    "Colombia": "NONE",
    "Nicaragua": "NONE",
    "Guatemala": "MEDIUM-LOW",
    "Belize": "LOW-MEDIUM",
    "Venezuela": "MEDIUM",
    "Guyana": "MEDIUM",
    "Suriname": "LOW-MEDIUM",
    "Puerto Rico": "LOW-MEDIUM",
    "Cuba": "NONE",
    "Falkland Islands": "MEDIUM-HIGH",
    "Mexico": "NONE",
}
RISK_NAME_REFS = {
    "RISK-01": {"NAME-06"},
    "RISK-04": {"NAME-29"},
    "RISK-05": {"NAME-24"},
    "RISK-06": {"NAME-30"},
    "RISK-16": {f"NAME-{n:02d}" for n in range(31, 38)},
}
CARIBBEAN_SEVEN = {
    "Antigua and Barbuda 安提瓜和巴布达",
    "Barbados 巴巴多斯",
    "Dominica 多米尼克",
    "Grenada 格林纳达",
    "Saint Kitts and Nevis 圣基茨和尼维斯",
    "Saint Lucia 圣卢西亚",
    "Saint Vincent and the Grenadines 圣文森特和格林纳丁斯",
}

CH13_CONVERTIBLE = {
    "V1-ENT-0022", "V1-ENT-0053", "V1-ENT-0054", "V1-ENT-0056",
    "V1-ENT-0057", "V1-ENT-0098", "V1-ENT-0125", "V1-ENT-0127",
    "V1-ENT-0128", "V1-ENT-0129",
}
CH13_BLOCKED = {"V1-ENT-0052"}
CH13_NORMALIZE = {
    "V1-ENT-0126", "V1-ENT-0153", "V1-ENT-0370", "V1-ENT-0371",
    "V1-ENT-0372", "V1-ENT-0373",
}


errors: list[str] = []
notes: list[str] = []


def fail(message: str) -> None:
    errors.append(message)


def read_csv(name: str) -> tuple[list[str], list[dict[str, str]]]:
    path = PACK / name
    try:
        with path.open(encoding="utf-8-sig", newline="") as handle:
            reader = csv.DictReader(handle)
            header = reader.fieldnames or []
            rows = list(reader)
    except Exception as exc:  # pragma: no cover - diagnostic path
        fail(f"{name}: cannot read CSV: {exc}")
        return [], []
    if any(value is None for value in header):
        fail(f"{name}: malformed header")
    raw_rows: list[list[str]] = []
    try:
        with path.open(encoding="utf-8-sig", newline="") as handle:
            raw_rows = list(csv.reader(handle))
    except Exception as exc:  # pragma: no cover - diagnostic path
        fail(f"{name}: cannot re-read CSV: {exc}")
    width = len(header)
    bad = [(line_no, len(row)) for line_no, row in enumerate(raw_rows[1:], 2) if len(row) != width]
    if bad:
        fail(f"{name}: row width mismatch {bad[:5]}")
    return header, rows


def check_unique_key(name: str, rows: list[dict[str, str]], key: str) -> None:
    values = [row.get(key, "").strip() for row in rows]
    if any(not value for value in values):
        fail(f"{name}: {key} has an empty value")
    duplicates = sorted({value for value in values if values.count(value) > 1})
    if duplicates:
        fail(f"{name}: {key} is not unique: {duplicates}")


def check_inventory_composition(data: dict[str, tuple[list[str], list[dict[str, str]]]]) -> None:
    """Keep the 28-feature bucket arithmetic and residual provenance wording honest."""
    _, rows02 = data["02_CURRENT_BASEMAP_FEATURES.csv"]
    first_bucket = {
        row.get("ADMIN", "")
        for row in rows02
        if row.get("territory_type") == "sovereign_state" or row.get("ADMIN") == "The Bahamas"
    }
    non_latin = {
        "Belize", "Guyana", "Suriname", "Jamaica", "Trinidad and Tobago"
    }
    territories = {"Falkland Islands", "Puerto Rico"}
    if len(rows02) != 28 or len(first_bucket) != 21 or len(non_latin) != 5 or len(territories) != 2:
        fail(
            "02/01 composition must be 28 = 21 geographic-bucket sovereigns + "
            f"5 non-Latin sovereigns + 2 territories; got rows={len(rows02)}, "
            f"buckets={len(first_bucket)}/{len(non_latin)}/{len(territories)}"
        )
    if first_bucket & non_latin or first_bucket & territories or non_latin & territories:
        fail("02/01 composition buckets overlap")
    inventory = (PACK / "01_CURRENT_MAP_INVENTORY.md").read_text(encoding="utf-8")
    for token in ("21 个", "5 个", "2 个", "28（"):
        if token not in inventory:
            fail(f"01: feature composition wording missing {token}")
    if "无来源登记" in inventory:
        fail("01: stale provenance phrase `无来源登记` remains")
    if not all(token in inventory for token in ("上游 release 版本号", "获取日期", "处理步骤")):
        fail("01: residual PROVENANCE_GAP must name release, retrieval date, and processing steps")
    try:
        version_section = inventory.split("### 1.1", 1)[1].split("### 1.2", 1)[0]
    except IndexError:
        fail("01: version-identification section markers are missing")
    else:
        if "残留项：release 版本号 + 获取日期 + 处理步骤" not in version_section:
            fail("01 §1.1: residual PROVENANCE_GAP must name release, retrieval date, and processing steps")


def check_basemap_risk_consistency(data: dict[str, tuple[list[str], list[dict[str, str]]]]) -> None:
    """Prevent 02 geometry rows from contradicting the corresponding 05 cases."""
    _, rows02 = data["02_CURRENT_BASEMAP_FEATURES.csv"]
    _, rows05 = data["05_GEOGRAPHIC_NEUTRALITY_RISK_REGISTER.csv"]
    risk_rows = {row["case_id"]: row for row in rows05}
    rows_by_admin = {row.get("ADMIN", ""): row for row in rows02}
    for admin, case_ids in BASEMAP_RISK_MAP.items():
        row = rows_by_admin.get(admin)
        if row is None:
            fail(f"02: expected risk-linked area is missing: {admin}")
            continue
        expected_band = BASEMAP_EXPECTED_BANDS[admin]
        actual_band = row.get("risk_flag", "").strip()
        if actual_band != expected_band:
            fail(f"02 {admin}: risk_flag={actual_band!r} contradicts 05 linked severity {expected_band!r}")
        note = row.get("sovereignty_or_status_note", "")
        if "CANNOT_VERIFY" not in note:
            fail(f"02 {admin}: external status must remain CANNOT_VERIFY")
        if not any(token in note.lower() for token in ("repository", "geometry", "polygon", "line")):
            fail(f"02 {admin}: note must distinguish repository geometry from external status")
        for case_id in case_ids:
            if case_id not in risk_rows:
                fail(f"02 {admin}: mapped case {case_id} is missing from 05")
    forbidden_status = re.compile(r"\b(?:settled|resolved|approved|decided|lease)\b|已解决|已裁决|已批准")
    for row in rows02:
        note = row.get("sovereignty_or_status_note", "")
        if forbidden_status.search(note):
            fail(f"02 {row.get('ADMIN')}: unsourced categorical status remains: {note}")


def check_projection_policy() -> None:
    text = (PACK / "12_RECOMMENDED_MAP_POLICY.md").read_text(encoding="utf-8")
    start = text.index("## 4. 投影政策")
    end = text.find("\n## 5.", start)
    section = text[start:] if end < 0 else text[start:end]
    for candidate in ("LAEA", "Equirect", "AEQD", "Equal Earth", "Natural Earth", "Albers"):
        if candidate not in section:
            fail(f"12 §4: B-1 selectable candidate {candidate} is missing")
    for token in (
        "ew_ns_scale_ratio", "principal_axis_ratio", "area_factor",
        "0.957492", "1.327088", "0.971319", "1.205492", "非等积",
    ):
        if token not in section:
            fail(f"12 §4: projection metric definition/example missing {token}")


def check_projection_recompute(data: dict[str, tuple[list[str], list[dict[str, str]]]]) -> None:
    """Recompute every fixed seven-point candidate and compare CSV/figure hashes."""
    try:
        import generate_projection_evidence as evidence

        expected_candidates, expected_metrics, expected_figures = evidence.expected_artifacts()
    except Exception as exc:  # pragma: no cover - diagnostic path
        fail(f"07 projection evidence: in-memory recomputation failed: {exc}")
        return
    _, stored_metrics = data["07_PROJECTION_SAMPLE_METRICS.csv"]
    _, stored_candidates = data["07_PROJECTION_CANDIDATES.csv"]
    if stored_metrics != expected_metrics:
        fail("07 projection metrics: stored seven-point Jacobian table differs from in-memory recomputation")
    if stored_candidates != expected_candidates:
        fail("07 projection candidates: stored ranges/metadata differ from in-memory recomputation")
    if evidence.verify(expected_candidates, expected_metrics, expected_figures) != 0:
        fail("07 projection figures/CSV: read-only generator check failed (including SHA-256)")


def check_license_wording() -> None:
    license_text = (PACK / "11_MAP_ASSET_LICENSE_AUDIT.md").read_text(encoding="utf-8")
    source_text = (PACK / "04_AUTHORITATIVE_MAP_SOURCE_MATRIX.csv").read_text(encoding="utf-8")
    for path_text, label in ((license_text, "11"), (source_text, "04")):
        if "case-specific" not in path_text:
            fail(f"{label}: ODbL wording must require case-specific assessment")
        for stale in ("会触发", "通常不触发", "database rights：无（美国侧无 DB 权问题）"):
            if stale in path_text:
                fail(f"{label}: categorical or unassessed license wording remains: {stale}")
    e1_text = license_text + "\n" + (PACK / "16_EVIDENCE_APPENDIX.md").read_text(encoding="utf-8")
    for token in (
        "元典法律检索", "2026-09-07", "《地图管理条例》第二条", "第三十三条", "第三十八条",
        "《测绘法》第三十八条", "《地图审核管理规定》第十条", "CANNOT_VERIFY",
    ):
        if token not in e1_text:
            fail(f"E-1: provision-text evidence token missing: {token}")


def check_pixel_threshold() -> None:
    text = (PACK / "06_PROJECTION_AND_GEOMETRY_AUDIT.md").read_text(encoding="utf-8")
    if ">17.7 km" not in text or "不能用 10 km" not in text:
        fail("06: pixel threshold must use the stated 17.7 km scale and qualify longitude")
    if re.search(r">\s*10\s*km[^\n]*(?:≥\s*1\s*px|>=\s*1\s*px)", text):
        fail("06: stale `>10 km ... >=1 px` claim remains")


def check_scope_status_wording() -> None:
    """03 may describe context, but political-status rows must not outrank 05/08 evidence."""
    text = (PACK / "03_SCOPE_AND_COVERAGE_POLICY_RESEARCH.md").read_text(encoding="utf-8")
    start = text.index("## 2. 边界地带逐一研究")
    end = text.index("## 3. 两层模型", start)
    names = (
        "Belize", "Guyana", "Suriname", "French Guiana", "Puerto Rico", "Aruba",
        "Guadeloupe", "The Bahamas", "Trinidad and Tobago", "Falkland Islands", "South Georgia",
    )
    for line in text[start:end].splitlines():
        if line.startswith("|") and any(name in line for name in names) and "CANNOT_VERIFY" not in line:
            fail(f"03: political-status row lacks CANNOT_VERIFY qualification: {line}")


def check_french_admin_consistency(data: dict[str, tuple[list[str], list[dict[str, str]]]]) -> None:
    """Keep the narrowly verified Guyane administrative fact distinct from unresolved status claims."""
    evidence = (PACK / "16_EVIDENCE_APPENDIX.md").read_text(encoding="utf-8")
    risk04_lines = [line for line in evidence.splitlines() if line.startswith("| RISK-04 |")]
    if len(risk04_lines) != 1:
        fail(f"16 RISK-04: expected one B-04 row, got {len(risk04_lines)}")
    else:
        cells = [cell.strip() for cell in risk04_lines[0].strip().strip("|").split("|")]
        if len(cells) < 9:
            fail("16 RISK-04: malformed evidence row")
        else:
            if cells[6] != "VERIFIED_PRIMARY":
                fail("16 RISK-04: Guyane administrative evidence must be VERIFIED_PRIMARY")
            for token in (
                "https://www.insee.fr/fr/metadonnees/definition/c2316",
                "https://www.outre-mer.gouv.fr/territoires/guyane",
                "Départements, régions et collectivités",
                "Guyane",
                "2026-09-07",
                "PRIMARY_URLS_OPENED_2026-09-07",
                "不裁决边界",
            ):
                if token not in "|".join(cells):
                    fail(f"16 RISK-04: missing primary/admin limitation token {token}")
    for token in (
        "https://www.insee.fr/fr/metadonnees/definition/c2316",
        "Départements, régions et collectivités d’outre-mer",
        "https://www.outre-mer.gouv.fr/territoires/guyane",
        "标题 `Guyane`",
        "检索日 2026-09-07",
        "VERIFIED_PRIMARY",
        "不自动升级其他属地",
    ):
        if token not in evidence:
            fail(f"16 §3: French administrative evidence record is missing {token}")

    inventory = (PACK / "01_CURRENT_MAP_INVENTORY.md").read_text(encoding="utf-8")
    inventory_line = next((line for line in inventory.splitlines() if "法属圭亚那的 Article 73" in line), "")
    if not inventory_line or not all(token in inventory_line for token in ("INSEE", "VERIFIED_PRIMARY", "不证明边界", "C-8/C-3")):
        fail("01 §1.2: Guyane administrative classification must be verified but non-adjudicative")

    scope = (PACK / "03_SCOPE_AND_COVERAGE_POLICY_RESEARCH.md").read_text(encoding="utf-8")
    guyane_line = next((line for line in scope.splitlines() if line.startswith("| French Guiana ")), "")
    if not guyane_line or not all(token in guyane_line for token in ("VERIFIED_PRIMARY", "CANNOT_VERIFY", "行政分类", "边界/范围")):
        fail("03 French Guiana: administrative evidence and unresolved boundary/scope must both be explicit")
    french_caribbean_line = next((line for line in scope.splitlines() if line.startswith("| Guadeloupe / Martinique ")), "")
    if not french_caribbean_line or "CANNOT_VERIFY" not in french_caribbean_line or "VERIFIED_PRIMARY" in french_caribbean_line:
        fail("03 Guadeloupe/Martinique: must remain outside the narrowly verified Guyane upgrade")

    _, rows05 = data["05_GEOGRAPHIC_NEUTRALITY_RISK_REGISTER.csv"]
    risk04 = next((row for row in rows05 if row.get("case_id") == "RISK-04"), None)
    if not risk04:
        fail("05 RISK-04: row is missing")
    else:
        if "VERIFIED_PRIMARY" not in risk04.get("claimants_or_status", ""):
            fail("05 RISK-04: claimants_or_status must record VERIFIED_PRIMARY Guyane administrative evidence")
        if not all(token in risk04.get("notes", "") for token in ("INSEE", "法国海外部", "CANNOT_VERIFY")):
            fail("05 RISK-04: notes must retain sources and unresolved implementation/scope limits")

    _, rows08 = data["08_COUNTRY_TERRITORY_COVERAGE_AUDIT.csv"]
    french08 = next((row for row in rows08 if row.get("territory") == "French Guiana 法属圭亚那"), None)
    if not french08 or not all(token in french08.get("sovereign_status", "") for token in ("VERIFIED_PRIMARY", "CANNOT_VERIFY")):
        fail("08 French Guiana: status cell must distinguish verified administration from unresolved boundary/scope")
    if french08 and not all(token in french08.get("note", "") for token in ("INSEE", "法国海外部", "不决定边界")):
        fail("08 French Guiana: note must point to primary records and preserve non-adjudicative limits")

    _, rows10 = data["10_GEOGRAPHIC_NAME_AUDIT.csv"]
    name29 = next((row for row in rows10 if row.get("name_id") == "NAME-29"), None)
    if not name29:
        fail("10 NAME-29: row is missing")
    else:
        status = name29.get("territory_status", "")
        if not all(token in status for token in ("French Guiana", "VERIFIED_PRIMARY", "CANNOT_VERIFY")):
            fail("10 NAME-29: status must verify only Guyane administration and retain unresolved status limits")
        for field in ("issue_found", "recommendation"):
            if "行政分类" not in name29.get(field, "") or "不据此" not in name29.get(field, ""):
                fail(f"10 NAME-29: {field} must preserve the administrative-only evidence boundary")

    policy = (PACK / "12_RECOMMENDED_MAP_POLICY.md").read_text(encoding="utf-8")
    policy_line = next((line for line in policy.splitlines() if line.startswith("| 法属圭亚那（Article 73")), "")
    if not policy_line or not all(token in policy_line for token in ("VERIFIED_PRIMARY", "CANNOT_VERIFY", "边界/范围")):
        fail("12: Guyane policy row must preserve verified-administration/unresolved-scope distinction")
    if "法国海外领土配色归属法国" in policy:
        fail("12: stale categorical French-territory rendering conclusion remains")

    backlog = (PACK / "14_GIT_BACKLOG.md").read_text(encoding="utf-8")
    ch02_lines = [line for line in backlog.splitlines() if line.startswith("| CH-02 |")]
    if len(ch02_lines) != 2:
        fail(f"14 CH-02: expected main and acceptance rows, got {len(ch02_lines)}")
    for line in ch02_lines:
        for token in ("VERIFIED_PRIMARY", "行政关联背景", "不据此裁决"):
            if token not in line:
                fail(f"14 CH-02: missing Guyane administrative evidence boundary token {token}")


def check_csv_basics() -> dict[str, tuple[list[str], list[dict[str, str]]]]:
    files = {
        "02_CURRENT_BASEMAP_FEATURES.csv": "feature_index",
        "04_AUTHORITATIVE_MAP_SOURCE_MATRIX.csv": "source_id",
        "05_GEOGRAPHIC_NEUTRALITY_RISK_REGISTER.csv": "case_id",
        "07_PROJECTION_CANDIDATES.csv": "candidate_id",
        "08_COUNTRY_TERRITORY_COVERAGE_AUDIT.csv": "territory",
        "09_PLACE_COORDINATE_AUDIT.csv": "place_id",
        "10_GEOGRAPHIC_NAME_AUDIT.csv": "name_id",
    }
    data: dict[str, tuple[list[str], list[dict[str, str]]]] = {}
    for name, key in files.items():
        header, rows = read_csv(name)
        data[name] = (header, rows)
        check_unique_key(name, rows, key)

    metrics_header, metrics_rows = read_csv("07_PROJECTION_SAMPLE_METRICS.csv")
    data["07_PROJECTION_SAMPLE_METRICS.csv"] = (metrics_header, metrics_rows)
    check_unique_key("07_PROJECTION_SAMPLE_METRICS.csv", metrics_rows, "sample_id")
    composites = [(row.get("candidate_id", ""), row.get("sample_name", "")) for row in metrics_rows]
    if any(not candidate or not sample for candidate, sample in composites):
        fail("07_PROJECTION_SAMPLE_METRICS.csv: candidate/sample key is empty")
    if len(composites) != len(set(composites)):
        fail("07_PROJECTION_SAMPLE_METRICS.csv: candidate_id+sample_name is not unique")
    return data


def check_semantics(data: dict[str, tuple[list[str], list[dict[str, str]]]]) -> None:
    header05, rows05 = data["05_GEOGRAPHIC_NEUTRALITY_RISK_REGISTER.csv"]
    expected05 = [
        "case_id", "area", "current_dataset_representation", "current_site_representation",
        "issue_type", "claimants_or_status", "map_a_references", "map_b_references",
        "current_risk", "recommended_neutral_rendering", "label_strategy", "boundary_style",
        "fill_strategy", "interaction_strategy", "legal_compliance_flag",
        "USER_DECISION_REQUIRED", "notes",
    ]
    if header05 != expected05:
        fail(f"05: semantic header mismatch: {header05}")
    if {row.get("case_id", "") for row in rows05} != CASE_IDS:
        fail("05: case_id set is not exactly RISK-01..RISK-20")
    if len(rows05) != 20:
        fail(f"05: expected 20 rows, got {len(rows05)}")
    allowed_compliance = {"NONE", "CONDITIONAL", "CANNOT_VERIFY", "LICENSE_UNCLEAR"}
    for row in rows05:
        if row.get("legal_compliance_flag") not in allowed_compliance:
            fail(f"05 {row.get('case_id')}: invalid legal_compliance_flag")
        decision = row.get("USER_DECISION_REQUIRED", "").strip()
        if decision != "NONE":
            refs = [part.strip() for part in decision.split(";") if part.strip()]
            if not refs or any(ref not in GATE_IDS for ref in refs):
                fail(f"05 {row.get('case_id')}: invalid USER_DECISION_REQUIRED={decision!r}")
        if not row.get("notes", "").strip():
            fail(f"05 {row.get('case_id')}: notes is empty")
        current_action_fields = (
            "recommended_neutral_rendering", "label_strategy", "boundary_style",
            "fill_strategy", "interaction_strategy",
        )
        invoked = set()
        for field in current_action_fields:
            invoked.update(STABLE_GATE.findall(row.get(field, "")))
        declared = {ref for ref in decision.split(";") if ref and ref != "NONE"}
        row_text = " ".join(row.values())
        if "FUTURE_TRIGGER_ONLY" not in row_text and not invoked.issubset(declared):
            fail(
                f"05 {row.get('case_id')}: current-action Gate refs "
                f"{sorted(invoked-declared)} are not declared in USER_DECISION_REQUIRED"
            )
    risk19 = next(row for row in rows05 if row["case_id"] == "RISK-19")
    if set(risk19["USER_DECISION_REQUIRED"].split(";")) != {"D-2", "D-3", "D-4"}:
        fail("05 RISK-19: must use exactly D-2;D-3;D-4")
    risk20 = next(row for row in rows05 if row["case_id"] == "RISK-20")
    if set(risk20["USER_DECISION_REQUIRED"].split(";")) != {"D-2", "D-3", "D-4"}:
        fail("05 RISK-20: must use exactly D-2;D-3;D-4")
    for required in (
        "Southern Patagonian Ice Field", "Fitz Roy", "Cerro Daudet",
        "pending", "not described as a war", "https://cancilleria.gob.ar/",
        "https://www.minrel.gob.cl/", "2026-09-07",
    ):
        if required not in " ".join(risk20.values()):
            fail(f"05 RISK-20: missing semantic evidence token {required}")
    risk01 = next(row for row in rows05 if row["case_id"] == "RISK-01")
    if "D-2" not in risk01["USER_DECISION_REQUIRED"].split(";"):
        fail("05 RISK-01: boundary_style invokes D-2 but USER_DECISION_REQUIRED omits it")
    risk10 = next(row for row in rows05 if row["case_id"] == "RISK-10")
    risk10_text = " ".join(risk10.values())
    if risk10["USER_DECISION_REQUIRED"] != "NONE" or "FUTURE_TRIGGER_ONLY" not in risk10_text or "no current WCD-09 Gate dependency" not in risk10_text:
        fail("05 RISK-10: future-only maritime trigger must be explicit and remain NONE")
    risk18 = next(row for row in rows05 if row["case_id"] == "RISK-18")
    if "C-8" not in risk18["USER_DECISION_REQUIRED"].split(";"):
        fail("05 RISK-18: scope-dependent action must register C-8")

    header08, rows08 = data["08_COUNTRY_TERRITORY_COVERAGE_AUDIT.csv"]
    expected08 = [
        "territory", "iso_or_a3", "sovereign_status", "present_in_geometry", "visible",
        "labelled_zh", "interactive", "literary_data_exists", "l1_status", "l1_gate",
        "l2_status", "l2_gate", "missing", "unexpected", "resolution_needed", "note",
    ]
    if header08 != expected08:
        fail(f"08: semantic header mismatch: {header08}")
    if len(rows08) != 54:
        fail(f"08: expected 54 rows, got {len(rows08)}")
    l1_allowed = {"CONDITIONAL_IN_SCOPE", "CONDITIONAL_OUT_OF_SCOPE"}
    l2_allowed = {"CONDITIONAL_ACTIVE", "CONDITIONAL_NON_INTERACTIVE", "OUT_OF_SCOPE"}
    for row in rows08:
        if row["l1_status"] not in l1_allowed:
            fail(f"08 {row['territory']}: invalid l1_status")
        if "C-8" not in row["l1_gate"].split(";"):
            fail(f"08 {row['territory']}: l1_gate lacks C-8")
        if row["l2_status"] not in l2_allowed:
            fail(f"08 {row['territory']}: invalid l2_status")
        l2_gate = row["l2_gate"]
        if l2_gate != "NONE" and any(ref not in GATE_IDS for ref in l2_gate.split(";")):
            fail(f"08 {row['territory']}: invalid l2_gate={l2_gate!r}")
        if not row["note"].strip():
            fail(f"08 {row['territory']}: note is empty")
        if row["sovereign_status"] != "see_02" and "CANNOT_VERIFY" not in (row["sovereign_status"] + " " + row["note"]):
            fail(f"08 {row['territory']}: non-02 status must be explicitly CANNOT_VERIFY")
    by_territory08 = {row["territory"]: row for row in rows08}
    french_guiana = by_territory08.get("French Guiana 法属圭亚那")
    if not french_guiana or set(french_guiana["l1_gate"].split(";")) != {"C-8", "C-3"} or french_guiana["l2_gate"] != "C-1":
        fail("08 French Guiana: C-3 must supplement C-8 on L1 and no-content L2 must use C-1")
    if french_guiana and ("C-3 仅控制 L1" not in french_guiana["note"] or "CANNOT_VERIFY" not in french_guiana["note"]):
        fail("08 French Guiana: note must state C-3 is L1-only and external status is CANNOT_VERIFY")
    puerto_rico = by_territory08.get("Puerto Rico")
    if not puerto_rico or set(puerto_rico["l1_gate"].split(";")) != {"C-8", "C-6"} or puerto_rico["l2_gate"] != "C-6":
        fail("08 Puerto Rico: C-6 must be registered on both its candidate L1 and intended L2 path")
    trinidad = by_territory08.get("Trinidad and Tobago")
    if not trinidad or set(trinidad["l1_gate"].split(";")) != {"C-8", "C-6"} or trinidad["l2_gate"] != "C-2":
        fail("08 Trinidad and Tobago: L1 must use C-8/C-6 and L2 must use C-2")
    for territory in CARIBBEAN_SEVEN:
        row = by_territory08.get(territory)
        if not row or set(row["l1_gate"].split(";")) != {"C-8", "C-6"} or row["l2_gate"] != "C-1":
            fail(f"08 {territory}: candidate L1 must use C-8/C-6 and no-content L2 must use C-1")
        elif "CANNOT_VERIFY" not in row["note"] or "candidate classification" not in row["sovereign_status"]:
            fail(f"08 {territory}: external status must remain CANNOT_VERIFY and not be asserted as settled")
    for row in rows08:
        gates_l1 = set(filter(None, row["l1_gate"].split(";")))
        if "C-3" in gates_l1 and row["territory"] != "French Guiana 法属圭亚那":
            fail(f"08 {row['territory']}: C-3 is reserved for French Guiana L1")
        if row["l2_gate"] == "C-2" and row["territory"] != "Trinidad and Tobago":
            fail(f"08 {row['territory']}: C-2 is reserved for Trinidad and Tobago L2")
        if "C-6" in gates_l1 and row["territory"] not in CARIBBEAN_SEVEN | {
            "Puerto Rico", "Trinidad and Tobago", "Aruba 阿鲁巴", "Curaçao 库拉索",
            "Bonaire / Sint Eustatius / Saba 博奈尔等（荷兰加勒比区）", "Guadeloupe 瓜德罗普",
            "Martinique 马提尼克", "Saint Martin 法属圣马丁", "Saint Barthélemy 法属圣巴泰勒米",
            "Sint Maarten 荷属圣马丁", "Cayman Islands 开曼群岛", "Turks and Caicos Islands 特克斯和凯科斯群岛",
            "United States Virgin Islands 美属维尔京群岛", "British Virgin Islands 英属维尔京群岛",
            "Anguilla 安圭拉", "Montserrat 蒙特塞拉特",
        }:
            fail(f"08 {row['territory']}: C-6 L1 assignment has no Caribbean topic basis")
    interactive = [row for row in rows08 if row["interactive"] == "TRUE"]
    codes = [row["iso_or_a3"] for row in interactive]
    if len(interactive) != 13 or len(set(codes)) != 13:
        fail(f"08: expected 13 unique conditional interactive codes, got {len(interactive)}/{len(set(codes))}")
    brazil = next((row for row in rows08 if row["territory"] == "Brazil"), None)
    if not brazil or "13" not in brazil["note"] or "unique" not in brazil["note"].lower():
        fail("08 Brazil: note must state the one unique code and distinguish source-entity duplication")

    header07, rows07 = data["07_PROJECTION_CANDIDATES.csv"]
    expected_candidate_ids = {
        "PROJ-CURRENT", "PROJ-EQ-fix", "PROJ-LAEA", "PROJ-AEQD",
        "PROJ-EQEARTH", "PROJ-NATEARTH", "PROJ-ALBERS", "PROJ-MERCATOR",
    }
    required_candidate_columns = {
        "candidate_id", "projection_parameters", "metric_status",
        "ew_ns_scale_ratio_range_measured", "principal_axis_ratio_range_measured",
        "area_factor_range_measured", "area_factor_relative_to_center_range_measured", "figure_file",
    }
    if len(rows07) != len(expected_candidate_ids) or {row["candidate_id"] for row in rows07} != expected_candidate_ids:
        fail("07: expected eight projection candidates with complete numeric coverage")
    if not required_candidate_columns.issubset(header07):
        fail(f"07 candidates: missing metric columns {sorted(required_candidate_columns - set(header07))}")
    if "shape_factor" in header07 or "area_distortion" in header07:
        fail("07 candidates: stale proxy/relative-area columns remain")

    metric_header, metric_rows = data["07_PROJECTION_SAMPLE_METRICS.csv"]
    expected_sample_names = {
        "Mexico City", "Havana", "center (center of viewport)", "Buenos Aires",
        "Santiago", "Tierra del Fuego", "Tijuana corner",
    }
    required_metric_columns = {
        "sample_id", "candidate_id", "sample_code", "sample_name", "lon_deg", "lat_deg",
        "window", "ew_ns_scale_ratio", "principal_axis_ratio", "area_factor",
        "area_factor_relative_to_center", "method",
    }
    if len(metric_rows) != len(expected_candidate_ids) * len(expected_sample_names):
        fail(f"07 metrics: expected {len(expected_candidate_ids) * len(expected_sample_names)} rows")
    if not required_metric_columns.issubset(metric_header):
        fail(f"07 metrics: missing metric columns {sorted(required_metric_columns - set(metric_header))}")
    if "shape_factor" in metric_header or "area_distortion" in metric_header:
        fail("07 metrics: stale proxy/relative-area columns remain")
    for candidate_id in expected_candidate_ids:
        rows_for_candidate = [row for row in metric_rows if row.get("candidate_id") == candidate_id]
        if len(rows_for_candidate) != len(expected_sample_names) or {row.get("sample_name") for row in rows_for_candidate} != expected_sample_names:
            fail(f"07 metrics {candidate_id}: fixed seven-point sample set differs")
        for row in rows_for_candidate:
            try:
                ew_ns = float(row["ew_ns_scale_ratio"])
                principal = float(row["principal_axis_ratio"])
                area = float(row["area_factor"])
                area_relative = float(row["area_factor_relative_to_center"])
            except (KeyError, ValueError):
                fail(f"07 metrics {candidate_id}/{row.get('sample_code')}: non-numeric metric")
                continue
            if not all(math.isfinite(value) for value in (ew_ns, principal, area, area_relative)):
                fail(f"07 metrics {candidate_id}/{row.get('sample_code')}: non-finite metric")
            if ew_ns <= 0:
                fail(f"07 metrics {candidate_id}/{row.get('sample_code')}: ew_ns_scale_ratio must be positive")
            if principal < 1.0 - 1e-6:
                fail(f"07 metrics {candidate_id}/{row.get('sample_code')}: principal_axis_ratio must be >= 1")
            if area <= 0:
                fail(f"07 metrics {candidate_id}/{row.get('sample_code')}: area_factor must be positive")
            if area_relative <= 0:
                fail(f"07 metrics {candidate_id}/{row.get('sample_code')}: relative area factor must be positive")
            if "central difference" not in row.get("method", "") or "P_lambda/cos(phi)" not in row.get("method", ""):
                fail(f"07 metrics {candidate_id}/{row.get('sample_code')}: method must document central J basis")

    def parse_range(value: str) -> tuple[float, float] | None:
        parts = value.split("–")
        if len(parts) != 2:
            return None
        try:
            return float(parts[0]), float(parts[1])
        except ValueError:
            return None

    candidate_by_id = {row.get("candidate_id"): row for row in rows07}
    for candidate_id in expected_candidate_ids:
        candidate = candidate_by_id.get(candidate_id, {})
        rows_for_candidate = [row for row in metric_rows if row.get("candidate_id") == candidate_id]
        for field, metric_field in (
            ("ew_ns_scale_ratio_range_measured", "ew_ns_scale_ratio"),
            ("principal_axis_ratio_range_measured", "principal_axis_ratio"),
            ("area_factor_range_measured", "area_factor"),
            ("area_factor_relative_to_center_range_measured", "area_factor_relative_to_center"),
        ):
            measured = parse_range(candidate.get(field, ""))
            if measured is None:
                fail(f"07 candidate {candidate_id}: malformed {field}")
                continue
            values = [float(row[metric_field]) for row in rows_for_candidate]
            expected = (min(values), max(values))
            if any(abs(a - b) > 5e-7 for a, b in zip(measured, expected)):
                fail(f"07 candidate {candidate_id}: {field} does not match sample metrics")
        if candidate.get("metric_status") != "NUMERIC_7_POINT":
            fail(f"07 candidate {candidate_id}: metric_status must be NUMERIC_7_POINT")
    if not any("not equal-area" in row["reason"] for row in rows07 if row["candidate_id"] == "PROJ-AEQD"):
        fail("07: AEQD reason must state that it is not equal-area")

    header09, rows09 = data["09_PLACE_COORDINATE_AUDIT.csv"]
    if len(header09) != 19 or len(rows09) != 38:
        fail(f"09: expected 19 columns/38 rows, got {len(header09)}/{len(rows09)}")
    ids09 = {row.get("place_id", "").strip() for row in rows09}
    if not CH13_CONVERTIBLE.issubset(ids09) or not CH13_BLOCKED.issubset(ids09) or not CH13_NORMALIZE.issubset(ids09):
        fail("09 CH-13: required 10-convertible/1-blocked/6-normalize IDs are incomplete")
    if CH13_CONVERTIBLE & CH13_BLOCKED or CH13_CONVERTIBLE & CH13_NORMALIZE or CH13_BLOCKED & CH13_NORMALIZE:
        fail("09 CH-13: branch ID sets overlap")
    for row in rows09:
        place_id = row.get("place_id", "").strip()
        recommendation = row.get("recommendation", "")
        if place_id in CH13_CONVERTIBLE:
            if "A-2 PENDING" not in recommendation or "permanent GeoNames" not in recommendation:
                fail(f"09 {place_id}: convertible branch must require a permanent GeoNames ID under A-2")
            if "do not change coordinates or entity identity" not in recommendation:
                fail(f"09 {place_id}: convertible branch must preserve coordinates/entity identity")
        elif place_id in CH13_BLOCKED:
            if row.get("status") != "BLOCKED_CANNOT_VERIFY":
                fail("09 V1-ENT-0052: status must be BLOCKED_CANNOT_VERIFY")
            if (
                "BLOCKED/CANNOT_VERIFY" not in recommendation
                or "do not convert" not in recommendation
                or not ("do not promote" in recommendation or "or promote" in recommendation)
            ):
                fail("09 V1-ENT-0052: blocked branch must prohibit conversion and promotion")
        elif place_id in CH13_NORMALIZE:
            if "A-2 PENDING" not in recommendation or "normalize" not in recommendation:
                fail(f"09 {place_id}: permanent-source branch must require URL normalization under A-2")
            if "no source conversion" not in recommendation:
                fail(f"09 {place_id}: permanent-source branch must prohibit source conversion")
    chiapas = next((row for row in rows09 if row["place_id"] == "V1-ENT-0052"), None)
    if not chiapas or "CANNOT_VERIFY" not in chiapas["recommendation"]:
        fail("09 V1-ENT-0052: must remain CANNOT_VERIFY")

    # Keep the three-way CH-13 interpretation synchronized across the canonical
    # specification documents; a stale document is evidence drift even when the CSV is sound.
    sync_files = [
        "01_CURRENT_MAP_INVENTORY.md", "12_RECOMMENDED_MAP_POLICY.md",
        "14_GIT_BACKLOG.md", "15_USER_DECISION_GATES.md", "16_EVIDENCE_APPENDIX.md",
    ]
    for name in sync_files:
        sync_text = (PACK / name).read_text(encoding="utf-8")
        for token in ("V1-ENT-0052", "CANNOT_VERIFY", "10 个", "6 个"):
            if token not in sync_text:
                fail(f"{name}: CH-13 three-way sync is missing {token}")

    header10, rows10 = data["10_GEOGRAPHIC_NAME_AUDIT.csv"]
    if len(rows10) != 37:
        fail(f"10: expected 37 rows, got {len(rows10)}")
    required_name_ids = {f"NAME-{n:02d}" for n in range(1, 38)}
    actual_name_ids = {row.get("name_id", "") for row in rows10}
    if actual_name_ids != required_name_ids:
        fail(f"10: name_id set mismatch: missing={sorted(required_name_ids-actual_name_ids)}, extra={sorted(actual_name_ids-required_name_ids)}")
    for row in rows10:
        if "CANNOT_VERIFY" not in row.get("territory_status", ""):
            fail(f"10 {row['name_id']}: territory_status must qualify external status as CANNOT_VERIFY")
        for gate in STABLE_GATE.findall(row.get("USER_GATE", "")):
            if gate not in GATE_IDS:
                fail(f"10 {row['name_id']}: unknown USER_GATE ID {gate}")
    name06 = next((row for row in rows10 if row["name_id"] == "NAME-06"), None)
    if not name06 or "D-1" not in name06.get("USER_GATE", ""):
        fail("10 NAME-06: must be the only naming row using D-1")
    name24 = next((row for row in rows10 if row["name_id"] == "NAME-24"), None)
    if not name24 or not {"CH-15", "CH-16"}.issubset(set(re.findall(r"CH-\d+", name24["recommendation"]))):
        fail("10 NAME-24: recommendation must reference CH-15 and CH-16")
    name19 = next((row for row in rows10 if row["name_id"] == "NAME-19"), None)
    if not name19:
        fail("10 NAME-19: Belize row is missing")
    else:
        recommendation = name19.get("recommendation", "")
        if "C-2" in recommendation:
            fail("10 NAME-19: Belize cannot attach to C-2, which is Trinidad and Tobago L2")
        if "C-1" not in recommendation:
            fail("10 NAME-19: Belize L2 recommendation must use C-1")
    name06_d1 = [row["name_id"] for row in rows10 if "D-1" in row.get("USER_GATE", "")]
    if name06_d1 != ["NAME-06"]:
        fail(f"10: only NAME-06 may use D-1, got {name06_d1}")
    seven_name_ids = {f"NAME-{n:02d}" for n in range(31, 38)}
    for row in rows10:
        if row["name_id"] in seven_name_ids:
            if row["USER_GATE"] != "C-6;C-8" or "CANNOT_VERIFY" not in row["chinese_name_source_basis"]:
                fail(f"10 {row['name_id']}: seven-state candidate row must be C-6;C-8 and CANNOT_VERIFY")
            if row["current_ui_label_zh"].lower().find("en-only") >= 0:
                fail(f"10 {row['name_id']}: English-only label path is prohibited")
            recommendation = row.get("recommendation", "")
            if not {"CH-03", "CH-16"}.issubset(set(re.findall(r"CH-\d+", recommendation))):
                fail(f"10 {row['name_id']}: CANNOT_VERIFY name row must explicitly block CH-03 and CH-16 additions")
            if "block" not in recommendation.lower() and "阻塞" not in recommendation:
                fail(f"10 {row['name_id']}: CANNOT_VERIFY name row must state a blocking action")
    name_ids = {row.get("name_id", "") for row in rows10}
    for case_id, required_refs in RISK_NAME_REFS.items():
        case = next((row for row in rows05 if row.get("case_id") == case_id), None)
        if case is None:
            fail(f"05→10: missing source case {case_id}")
            continue
        case_text = " ".join(case.values())
        missing_refs = sorted(ref for ref in required_refs if ref not in case_text)
        if missing_refs:
            fail(f"05 {case_id}: missing explicit NAME cross-reference(s) {missing_refs}")
        for ref in required_refs:
            if ref not in name_ids:
                fail(f"05 {case_id}: references nonexistent {ref}")


def ledger_ids() -> set[str]:
    text = (PACK / "15_USER_DECISION_GATES.md").read_text(encoding="utf-8")
    found = set(STABLE_GATE.findall(text))
    if found != GATE_IDS:
        fail(f"15: Gate ledger IDs differ from expected: missing={sorted(GATE_IDS-found)}, extra={sorted(found-GATE_IDS)}")
    return found


def check_decision_gate_options() -> None:
    """Require an executable option set and a decision slot for every Gate."""
    text = (PACK / "15_USER_DECISION_GATES.md").read_text(encoding="utf-8")
    heading_re = re.compile(r"^###\s+((?:A-[1-3])|B-1|(?:C-[1-8])|(?:D-[1-4])|E-1)\b", re.MULTILINE)
    headings = list(heading_re.finditer(text))
    sections: dict[str, str] = {}
    for index, match in enumerate(headings):
        end_candidates = [pos for pos in (text.find("\n### ", match.end()), text.find("\n## ", match.end())) if pos >= 0]
        end = min(end_candidates) if end_candidates else len(text)
        sections[match.group(1)] = text[match.end():end]

    for gate in GATE_IDS:
        body = sections.get(gate)
        if body is None:
            fail(f"15 {gate}: missing executable Gate section")
            continue
        if gate == "D-3":
            # D-3 is intentionally a per-case matrix, not one global option.
            expected_d3_risks = {"RISK-02", "RISK-03", "RISK-14", "RISK-15", "RISK-19", "RISK-20"}
            actual_d3_risks = set(re.findall(r"D-3/(RISK-\d+): option=", body))
            if actual_d3_risks != expected_d3_risks:
                fail(
                    "15 D-3: per-case slot set must equal "
                    f"{sorted(expected_d3_risks)}, got {sorted(actual_d3_risks)}"
                )
            for risk in sorted(expected_d3_risks):
                if f"D-3/{risk}: option=" not in body:
                    fail(f"15 D-3: missing decision record slot for {risk}")
                # Every case must expose the three mutually exclusive dispositions.
                case_line = next((line for line in body.splitlines() if risk in line and line.startswith("|")), "")
                cells = [cell.strip() for cell in case_line.strip().strip("|").split("|")]
                if len(cells) < 5 or any(not cells[index] for index in (1, 2, 3)):
                    fail(f"15 D-3/{risk}: missing per-case option set")
        else:
            option_ids = set(re.findall(rf"\b{re.escape(gate)}-OPT-[A-Z0-9-]+\b", body))
            if len(option_ids) < 2:
                fail(f"15 {gate}: fewer than two mutually exclusive options")
            if f"{gate}: option=" not in body:
                fail(f"15 {gate}: missing decision record slot")
        if not any(token in body for token in ("延后", "阻塞", "不实施", "CANNOT_VERIFY", "证据不足")):
            fail(f"15 {gate}: missing safe delay/non-implementation path")

    b1 = sections.get("B-1", "")
    for candidate in ("LAEA", "Equirect", "AEQD"):
        if candidate not in b1:
            fail(f"15 B-1: missing candidate option {candidate}")
    d3 = sections.get("D-3", "")
    if "CANNOT_VERIFY" not in d3 or "不实施敏感注记" not in d3:
        fail("15 D-3: evidence-insufficient safety wording is incomplete")
    e1 = sections.get("E-1", "")
    if "专业" not in e1 or "阻塞" not in e1 or "CANNOT_VERIFY" not in e1:
        fail("15 E-1: must offer professional-assessment and continued-blocking paths")


def check_backlog(known_gates: set[str]) -> None:
    text = (PACK / "14_GIT_BACKLOG.md").read_text(encoding="utf-8")
    main_start = text.index("## A. 底图数据")
    appendix_start = text.index("## 附：CH-13 坐标来源分类")
    main = text[main_start:appendix_start]
    acceptance_start = text.index("## 附 2：CH 验收标准")
    acceptance = text[acceptance_start:]
    main_rows: dict[str, list[str]] = {}
    acceptance_rows: dict[str, list[str]] = {}
    for line in main.splitlines():
        if not line.startswith("| CH-"):
            continue
        cells = [cell.strip() for cell in line.strip().strip("|").split("|")]
        main_rows[cells[0]] = cells
    for line in acceptance.splitlines():
        if not line.startswith("| CH-"):
            continue
        cells = [cell.strip() for cell in line.strip().strip("|").split("|")]
        acceptance_rows[cells[0]] = cells
    if set(main_rows) != CH_IDS:
        fail(f"14 main backlog CH set mismatch: missing={sorted(CH_IDS-set(main_rows))}, extra={sorted(set(main_rows)-CH_IDS)}")
    if set(acceptance_rows) != CH_IDS:
        fail(f"14 acceptance CH set mismatch: missing={sorted(CH_IDS-set(acceptance_rows))}, extra={sorted(set(acceptance_rows)-CH_IDS)}")
    for ch in ("CH-03", "CH-16"):
        acceptance_text = acceptance_rows.get(ch, ["", ""])[1]
        required_tokens = ("10 NAME", "名称来源证据", "CANNOT_VERIFY", "阻塞")
        if not all(token in acceptance_text for token in required_tokens):
            fail(
                f"14 {ch}: acceptance must require corresponding 10 NAME source evidence "
                "and block CANNOT_VERIFY Chinese-name additions"
            )
    ch15_main = main_rows.get("CH-15", ["", ""])[1]
    ch15_acceptance = acceptance_rows.get("CH-15", ["", ""])[1]
    ch15_tokens = ("C-6", "primary URL", "标题", "检索日期", "中文名称", "不写地位")
    for label, ch15_text in (("main", ch15_main), ("acceptance", ch15_acceptance)):
        if not all(token in ch15_text for token in ch15_tokens):
            fail(f"14 CH-15 {label}: Puerto Rico status text must require a verified C-6 primary record or omit status")
    gates_text = (PACK / "15_USER_DECISION_GATES.md").read_text(encoding="utf-8")
    c6_section = gates_text.split("### C-6", 1)[1].split("### C-7", 1)[0]
    c6_option_lines = [line for line in c6_section.splitlines() if line.startswith("| C-6-OPT-")]
    if len(c6_option_lines) != 3:
        fail(f"15 C-6: expected three option rows, got {len(c6_option_lines)}")
    for line in c6_option_lines:
        if not all(token in line for token in ("primary URL", "标题", "检索日期", "中文名称", "不写地位")):
            fail("15 C-6: every option evidence cell must require Puerto Rico primary status evidence or name-only fallback")
    graph = {ch: set() for ch in CH_IDS}
    for ch, cells in main_rows.items():
        if len(cells) < 5:
            fail(f"14 {ch}: malformed main row")
            continue
        deps = cells[3]
        if CH_SHORT_REF.search(deps):
            fail(f"14 {ch}: CH dependency uses shorthand; repeat the complete CH ID")
        for gate in STABLE_GATE.findall(deps):
            if gate not in known_gates:
                fail(f"14 {ch}: unknown Gate ID {gate}")
        graph[ch] = {ref for ref in CH_REF.findall(deps) if ref in CH_IDS}
    required = {
        "CH-02": {"C-8", "C-3"},
        "CH-07": {"B-1"},
        "CH-13": {"A-2"},
        "CH-21": {"A-1"},
        "CH-22": {"A-1", "C-3", "C-4", "C-6", "C-7", "D-2", "D-3", "D-4"},
        "CH-24": {"B-1", "C-4", "C-7", "C-8"},
    }
    for ch, wanted in required.items():
        deps = set(STABLE_GATE.findall(main_rows[ch][3]))
        if not wanted.issubset(deps):
            fail(f"14 {ch}: missing semantic dependencies {sorted(wanted-deps)}")
    ch13_deps = set(STABLE_GATE.findall(main_rows["CH-13"][3]))
    if "D-1" in ch13_deps:
        fail("14 CH-13: D-1 cannot authorize Data/Curation changes")
    ch22_deps = set(STABLE_GATE.findall(main_rows["CH-22"][3]))
    if "C-2" in ch22_deps:
        fail("14 CH-22: current dependency list contains an out-of-scope Gate")
    ch22_item_text = main_rows["CH-22"][1]
    ch22_acceptance_text = acceptance_rows["CH-22"][1]
    if "C-2" in ch22_item_text or "C-2" in ch22_acceptance_text:
        fail("14 CH-22: current item or acceptance text contains an out-of-scope Gate")
    ch03_summary = main_rows["CH-03"][1]
    if not all(token in ch03_summary for token in ("10 NAME", "名称来源证据", "CANNOT_VERIFY", "阻塞")):
        fail("14 CH-03: summary must block new Caribbean Chinese names without 10 NAME source evidence")
    if "CH-13" in graph["CH-13"]:
        fail("14 CH-13: self dependency")

    visiting: set[str] = set()
    visited: set[str] = set()

    def visit(node: str) -> None:
        if node in visiting:
            fail(f"14: dependency cycle through {node}")
            return
        if node in visited:
            return
        visiting.add(node)
        for dep in graph[node]:
            visit(dep)
        visiting.remove(node)
        visited.add(node)

    for ch in CH_IDS:
        visit(ch)


def check_gate_ch_crosswalk(known_gates: set[str]) -> None:
    """Enforce the documented exact reverse-index policy between 15 and 14."""
    backlog = (PACK / "14_GIT_BACKLOG.md").read_text(encoding="utf-8")
    main_start = backlog.index("## A. 底图数据")
    appendix_start = backlog.index("## 附：CH-13 坐标来源分类")
    reverse: dict[str, set[str]] = {gate: set() for gate in known_gates}
    for line in backlog[main_start:appendix_start].splitlines():
        if not line.startswith("| CH-"):
            continue
        cells = [cell.strip() for cell in line.strip().strip("|").split("|")]
        if len(cells) < 4:
            continue
        for gate in STABLE_GATE.findall(cells[3]):
            if gate in reverse:
                reverse[gate].add(cells[0])

    ledger = (PACK / "15_USER_DECISION_GATES.md").read_text(encoding="utf-8")
    ledger_start = ledger.index("## 1. Ledger 总览")
    ledger_end = ledger.index("## 2. 语义映射和引用规则")
    direct: dict[str, set[str]] = {}
    for line in ledger[ledger_start:ledger_end].splitlines():
        if not line.startswith("| "):
            continue
        cells = [cell.strip() for cell in line.strip().strip("|").split("|")]
        if len(cells) < 4 or cells[0] not in known_gates:
            continue
        direct[cells[0]] = set(CH_REF.findall(cells[3]))

    if set(direct) != known_gates:
        fail(f"15↔14 Gate/CH crosswalk: ledger rows missing={sorted(known_gates-set(direct))}")
    for gate in sorted(known_gates):
        ledger_ch = direct.get(gate, set())
        backlog_ch = reverse.get(gate, set())
        if ledger_ch != backlog_ch:
            fail(
                f"15↔14 Gate/CH crosswalk {gate}: "
                f"15={sorted(ledger_ch)} vs 14={sorted(backlog_ch)}"
            )
    if direct.get("C-2") != {"CH-03"} or reverse.get("C-2") != {"CH-03"}:
        fail(
            "15↔14 C-2: direct impact must be CH-03 only; "
            f"15={sorted(direct.get('C-2', set()))} vs 14={sorted(reverse.get('C-2', set()))}"
        )
    c2_section = (PACK / "15_USER_DECISION_GATES.md").read_text(encoding="utf-8").split("### C-2", 1)[1].split("### C-3", 1)[0]
    if "CH-22" in c2_section:
        fail("15 C-2: options and decision text contain an out-of-scope dependency")


def check_option_level_impacts(known_gates: set[str]) -> None:
    """Check option CH impacts against the aggregate ledger and 14 dependencies.

    Ledger rows are aggregate: they may include cross-option or transitive work.
    An option row, however, may not invent a CH impact or omit the corresponding
    Gate dependency from the 14 work item.  Targeted guards encode the asset/QA
    distinctions that are easy to regress into keep-out branches.
    """
    ledger = (PACK / "15_USER_DECISION_GATES.md").read_text(encoding="utf-8")
    ledger_start = ledger.index("## 1. Ledger 总览")
    ledger_end = ledger.index("## 2. 语义映射和引用规则")
    ledger_ch: dict[str, set[str]] = {}
    for line in ledger[ledger_start:ledger_end].splitlines():
        if not line.startswith("| "):
            continue
        cells = [cell.strip() for cell in line.strip().strip("|").split("|")]
        if len(cells) >= 4 and cells[0] in known_gates:
            ledger_ch[cells[0]] = set(CH_REF.findall(cells[3]))

    backlog = (PACK / "14_GIT_BACKLOG.md").read_text(encoding="utf-8")
    main_start = backlog.index("## A. 底图数据")
    appendix_start = backlog.index("## 附：CH-13 坐标来源分类")
    ch_gate_deps: dict[str, set[str]] = {}
    for line in backlog[main_start:appendix_start].splitlines():
        if not line.startswith("| CH-"):
            continue
        cells = [cell.strip() for cell in line.strip().strip("|").split("|")]
        if len(cells) >= 4:
            ch_gate_deps[cells[0]] = set(STABLE_GATE.findall(cells[3]))

    option_pattern = re.compile(r"^(?:A-[1-3]|B-1|C-[1-8]|D-[1-4]|E-1)-OPT-[A-Z0-9-]+$")
    option_ch: dict[str, set[str]] = {}
    for line in ledger.splitlines():
        if not line.startswith("| "):
            continue
        cells = [cell.strip() for cell in line.strip().strip("|").split("|")]
        if len(cells) < 4 or not option_pattern.fullmatch(cells[0]):
            continue
        refs = set(CH_REF.findall(cells[3]))
        if not refs:
            fail(f"15 {cells[0]}: option-level CH impact cell has no explicit CH ID")
            continue
        option_ch[cells[0]] = refs
        gate = cells[0].split("-OPT-", 1)[0]
        if gate not in known_gates:
            fail(f"15 {cells[0]}: option references unknown Gate {gate}")
            continue
        for ch in sorted(refs):
            if ch not in ledger_ch.get(gate, set()):
                fail(f"15 {cells[0]}: {ch} is not in the Gate Ledger impact set")
            if gate not in ch_gate_deps.get(ch, set()):
                fail(f"15 {cells[0]}: {ch} does not list {gate} in 14 dependencies")

    targeted_required = {
        "A-1-OPT-2": {"CH-21"},
        "C-3-OPT-1": {"CH-22"},
        "C-4-OPT-2": {"CH-22", "CH-24"},
        "C-7-OPT-2": {"CH-22", "CH-24"},
    }
    targeted_forbidden = {
        "C-3-OPT-2": {"CH-05"},
        "C-4-OPT-1": {"CH-22", "CH-24"},
        "C-7-OPT-1": {"CH-22", "CH-24"},
    }
    for option, required in targeted_required.items():
        missing = required - option_ch.get(option, set())
        if missing:
            fail(f"15 {option}: missing semantic CH impact(s) {sorted(missing)}")
    for option, forbidden in targeted_forbidden.items():
        present = forbidden & option_ch.get(option, set())
        if present:
            fail(f"15 {option}: keep-out/record-only option has spurious CH impact(s) {sorted(present)}")
    for option, refs in option_ch.items():
        if option.startswith("D-1-") and "CH-21" in refs:
            fail(f"15 {option}: D-1 name evidence is absorbed by CH-16, not CH-21")
        if option.startswith("E-1-") and "CH-22" in refs:
            fail(f"15 {option}: E-1 legal assessment must not trigger CH-22 asset review")


def check_evidence() -> None:
    text = (PACK / "16_EVIDENCE_APPENDIX.md").read_text(encoding="utf-8")
    rows = []
    for line in text.splitlines():
        if line.startswith("| RISK-"):
            cells = [cell.strip() for cell in line.strip().strip("|").split("|")]
            rows.append(cells)
    ids = {row[0] for row in rows if row}
    if ids != CASE_IDS or len(rows) != 20:
        fail(f"16: B-04 matrix must contain RISK-01..20 once: rows={len(rows)}, missing={sorted(CASE_IDS-ids)}")
    for row in rows:
        if len(row) < 9:
            fail(f"16 {row[0] if row else '<unknown>'}: malformed B-04 row")
        elif row[6] not in {"CANNOT_VERIFY", "REPOSITORY_VERIFIED", "VERIFIED_PRIMARY"}:
            fail(f"16 {row[0]}: invalid evidence_status={row[6]}")
    status_counts = Counter(row[6] for row in rows if len(row) >= 7)
    expected_status_counts = Counter({"CANNOT_VERIFY": 16, "VERIFIED_PRIMARY": 2, "REPOSITORY_VERIFIED": 2})
    if status_counts != expected_status_counts:
        fail(f"16: B-04 evidence_status counts drifted: expected={dict(expected_status_counts)}, got={dict(status_counts)}")
    risk20 = next((row for row in rows if row and row[0] == "RISK-20"), None)
    if not risk20 or len(risk20) < 9:
        fail("16 RISK-20: missing evidence row")
    else:
        if risk20[6] != "VERIFIED_PRIMARY":
            fail("16 RISK-20: two official URLs must be marked VERIFIED_PRIMARY")
        for token in (
            "https://cancilleria.gob.ar/", "https://www.minrel.gob.cl/",
            "Inventario Nacional de Glaciares", "Comunicado por Inventario Nacional",
            "2026-09-07", "PRIMARY_URLS_OPENED_2026-09-07",
        ):
            if token not in "|".join(risk20):
                fail(f"16 RISK-20: missing primary evidence token {token}")
    case_sync_files = [
        "12_RECOMMENDED_MAP_POLICY.md", "13_DISCLAIMER_OPTIONS.md",
        "14_GIT_BACKLOG.md", "15_USER_DECISION_GATES.md", "16_EVIDENCE_APPENDIX.md",
    ]
    for name in case_sync_files:
        sync_text = (PACK / name).read_text(encoding="utf-8")
        if "RISK-20" not in sync_text:
            fail(f"{name}: missing RISK-20 case synchronization")


def check_text_hygiene(known_gates: set[str]) -> None:
    forbidden = {
        "AEDQ": "AEQD spelling",
        "阿卡塔马": "阿卡塔卡 spelling",
        "等比即 area≈1": "canvas scale is not area proof",
        "任意两点 kx/ky": "arbitrary two-point ratio is not shape proof",
        "斜杠无主次": "slash does not eliminate ordering salience",
        "斜杠不表达主次": "slash does not eliminate ordering salience",
        "方案已定": "USER decision cannot be represented as finalized",
        "无来源登记": "stale provenance wording",
    }
    for path in PACK.rglob("*"):
        if not path.is_file() or path.name in IMMUTABLE or path.name == Path(__file__).name:
            continue
        if path.suffix.lower() not in {".md", ".csv", ".py"}:
            continue
        try:
            text = path.read_text(encoding="utf-8")
        except UnicodeDecodeError:
            continue
        for needle, description in forbidden.items():
            if needle in text:
                fail(f"{path.relative_to(PACK)}: forbidden wording {description}: {needle}")
        for line_no, line in enumerate(text.splitlines(), 1):
            if "斜杠" in line and "无主次" in line:
                fail(f"{path.relative_to(PACK)}:{line_no}: slash wording must not claim no ordering")
            if CH_SHORT_REF.search(line):
                fail(f"{path.relative_to(PACK)}:{line_no}: CH dependency uses shorthand; repeat the complete CH ID")
            for compact_re, label in (
                (COMPACT_RISK_REF, "RISK"),
                (COMPACT_NAME_REF, "NAME"),
                (COMPACT_MAPSRC_REF, "MAPSRC"),
            ):
                if compact_re.search(line):
                    fail(f"{path.relative_to(PACK)}:{line_no}: {label} reference uses compact slash form; repeat every full ID")
            for gate in STABLE_GATE.findall(line):
                if gate not in known_gates:
                    fail(f"{path.relative_to(PACK)}:{line_no}: unknown Gate ID {gate}")
            if UNNUMBERED_GATE.search(line):
                stripped = line.strip()
                # Section headings and the explicit pan-heading “Gate A–E” are allowed.
                if stripped.startswith("#") or "Gate A–E" in line or "Gate A-E" in line:
                    continue
                fail(f"{path.relative_to(PACK)}:{line_no}: unnumbered Gate reference: {stripped}")


def main() -> int:
    data = check_csv_basics()
    check_inventory_composition(data)
    check_semantics(data)
    check_basemap_risk_consistency(data)
    check_projection_policy()
    check_projection_recompute(data)
    check_license_wording()
    check_pixel_threshold()
    check_scope_status_wording()
    check_french_admin_consistency(data)
    known_gates = ledger_ids()
    check_decision_gate_options()
    check_backlog(known_gates)
    check_gate_ch_crosswalk(known_gates)
    check_option_level_impacts(known_gates)
    check_evidence()
    check_text_hygiene(known_gates)
    if errors:
        print("WCD-09 PACKAGE VALIDATION: FAIL")
        for error in errors:
            print(f"- {error}")
        return 1
    print("WCD-09 PACKAGE VALIDATION: PASS")
    print("- CSV widths and key uniqueness: PASS")
    print("- 02/05/08/07/09/10 semantic and cross-file checks: PASS")
    print("- Gate ledger, CH-01..25 mapping, and dependency acyclicity: PASS")
    print("- B-04 20-case matrix, license wording, projection policy, and text hygiene: PASS")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
