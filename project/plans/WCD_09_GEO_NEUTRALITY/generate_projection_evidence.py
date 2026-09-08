#!/usr/bin/env python3
"""Generate or verify the WCD-09 projection comparison evidence.

The local compatibility wrapper ``generate_aeqd_evidence.py`` calls this
module.  The module computes fixed seven-point metrics for every numeric
candidate in ``07_PROJECTION_CANDIDATES.csv`` and regenerates comparison
figures.

For a projection ``P(lambda, phi)`` (sphere radius R=1), the local Jacobian
uses central differences with a fixed 0.25-degree step and the orthonormal
unit-sphere basis::

    J = [ P_lambda / cos(phi), P_phi ]

``ew_ns_scale_ratio`` is the norm ratio of the two columns and is only a
directional proxy (it may be below one). ``principal_axis_ratio`` is
``smax(J) / smin(J)`` and is the complete local shape distortion (always at
least one). ``area_factor`` is ``abs(det(J))``; it is not inferred from the
canvas fit. ``--check`` is strictly read-only: it recomputes the CSV rows and
figure bytes in memory and compares every stored figure SHA-256.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import io
import json
import math
from pathlib import Path
from typing import Callable, Iterable

PACK = Path(__file__).resolve().parent
REPO = PACK.parents[2]
GEOJSON = REPO / "site/assets/latin-america-countries.geojson"
CANDIDATES_CSV = PACK / "07_PROJECTION_CANDIDATES.csv"
METRICS_CSV = PACK / "07_PROJECTION_SAMPLE_METRICS.csv"
W, H = 880.0, 560.0
WINDOW = "lon=-118..-32;lat=-56..33"
STEP_DEG = 0.25
STEP_RAD = math.radians(STEP_DEG)
# The old site formula's pixel constants reduce to this ratio.  A common
# uniform scale is omitted so area factors remain in projection units.
CURRENT_ANISOTROPY = (880.0 / 86.0) / (560.0 / 89.0)

Point = tuple[float, float]
Projection = Callable[[float, float], Point]

SAMPLES: tuple[tuple[str, str, float, float], ...] = (
    ("S01", "Mexico City", -99.13, 19.43),
    ("S02", "Havana", -82.38, 23.13),
    ("S03", "center (center of viewport)", -75.0, -11.5),
    ("S04", "Buenos Aires", -58.38, -34.60),
    ("S05", "Santiago", -70.65, -33.46),
    ("S06", "Tierra del Fuego", -68.0, -54.0),
    ("S07", "Tijuana corner", -117.0, 32.5),
)


def rad(value: float) -> float:
    return math.radians(value)


def current(lon: float, lat: float) -> Point:
    """The site's affine map in radians, with its north-south scale = 1."""

    return CURRENT_ANISOTROPY * rad(lon), rad(lat)


def equirect(lon: float, lat: float, phi1: float = -11.5) -> Point:
    return math.cos(rad(phi1)) * rad(lon), rad(lat)


def laea(lon: float, lat: float, lon0: float = -75.0, lat0: float = -11.5) -> Point:
    """Spherical Lambert azimuthal equal-area, R=1."""

    lam, phi, lam0, phi0 = map(rad, (lon, lat, lon0, lat0))
    dl = lam - lam0
    cos_c = math.sin(phi0) * math.sin(phi) + math.cos(phi0) * math.cos(phi) * math.cos(dl)
    k = math.sqrt(2.0 / max(1.0e-15, 1.0 + cos_c))
    return (
        k * math.cos(phi) * math.sin(dl),
        k * (math.cos(phi0) * math.sin(phi) - math.sin(phi0) * math.cos(phi) * math.cos(dl)),
    )


def aeqd(lon: float, lat: float, lon0: float = -75.0, lat0: float = -11.5) -> Point:
    """Spherical azimuthal equidistant, R=1."""

    lam, phi, lam0, phi0 = map(rad, (lon, lat, lon0, lat0))
    dl = lam - lam0
    cos_c = math.sin(phi0) * math.sin(phi) + math.cos(phi0) * math.cos(phi) * math.cos(dl)
    c = math.acos(max(-1.0, min(1.0, cos_c)))
    sin_c = math.sin(c)
    k = 1.0 if abs(sin_c) < 1.0e-12 else c / sin_c
    return (
        k * math.cos(phi) * math.sin(dl),
        k * (math.cos(phi0) * math.sin(phi) - math.sin(phi0) * math.cos(phi) * math.cos(dl)),
    )


def equal_earth(lon: float, lat: float) -> Point:
    """Equal Earth (Savric, Patterson & Jenny 2018), R=1."""

    lam, phi = rad(lon), rad(lat)
    a1, a2, a3, a4 = 1.340264, -0.081106, 0.000893, 0.003796
    m = math.sqrt(3.0) / 2.0
    theta = math.asin(max(-1.0, min(1.0, m * math.sin(phi))))
    theta2 = theta * theta
    theta6 = theta2 * theta2 * theta2
    polynomial_x = a1 + 3.0 * a2 * theta2 + theta6 * (7.0 * a3 + 9.0 * a4 * theta2)
    polynomial_y = a1 + a2 * theta2 + theta6 * (a3 + a4 * theta2)
    return (
        lam * math.cos(theta) / (m * polynomial_x),
        theta * polynomial_y,
    )


def natural_earth(lon: float, lat: float) -> Point:
    """Natural Earth I compromise projection, R=1."""

    lam, phi = rad(lon), rad(lat)
    phi2 = phi * phi
    phi4 = phi2 * phi2
    x = lam * (
        0.8707
        - 0.131979 * phi2
        + phi4 * (-0.013791 + phi4 * (0.003971 * phi2 - 0.001529 * phi4))
    )
    y = phi * (
        1.007226
        + phi2 * (0.015085 + phi4 * (-0.044475 + 0.028874 * phi2 - 0.005916 * phi4))
    )
    return x, y


def albers(lon: float, lat: float, lon0: float = -75.0, phi1: float = -5.0, phi2: float = -30.0) -> Point:
    """Spherical Albers equal-area conic, R=1, standard parallels -5/-30."""

    lam, phi = rad(lon), rad(lat)
    lam0 = rad(lon0)
    p1, p2 = rad(phi1), rad(phi2)
    n = (math.sin(p1) + math.sin(p2)) / 2.0
    c = math.cos(p1) ** 2 + 2.0 * n * math.sin(p1)
    phi_ref = (p1 + p2) / 2.0
    rho = math.sqrt(max(0.0, c - 2.0 * n * math.sin(phi))) / n
    rho_ref = math.sqrt(max(0.0, c - 2.0 * n * math.sin(phi_ref))) / n
    theta = n * (lam - lam0)
    return rho * math.sin(theta), rho_ref - rho * math.cos(theta)


def mercator(lon: float, lat: float) -> Point:
    """Spherical Mercator reference (rejected analytically)."""

    phi = rad(lat)
    return rad(lon), math.log(math.tan(math.pi / 4.0 + phi / 2.0))


PROJECTIONS: dict[str, Projection] = {
    "PROJ-CURRENT": current,
    "PROJ-EQ-fix": equirect,
    "PROJ-LAEA": laea,
    "PROJ-AEQD": aeqd,
    "PROJ-EQEARTH": equal_earth,
    "PROJ-NATEARTH": natural_earth,
    "PROJ-ALBERS": albers,
    "PROJ-MERCATOR": mercator,
}

FIGURES: dict[str, str] = {
    "PROJ-CURRENT": "current_projection.png",
    "PROJ-EQ-fix": "candidate_projection_1_equirect.png",
    "PROJ-LAEA": "candidate_projection_2_laea.png",
    "PROJ-EQEARTH": "candidate_projection_3_equal_earth.png",
    "PROJ-AEQD": "candidate_projection_4_aeqd.png",
    "PROJ-NATEARTH": "extra_natural_earth_projection.png",
    "PROJ-ALBERS": "candidate_projection_5_albers.png",
    "PROJ-MERCATOR": "candidate_projection_6_mercator.png",
}

FIGURE_TITLES: dict[str, str] = {
    "PROJ-CURRENT": "CURRENT site projection (custom anisotropic linear)",
    "PROJ-EQ-fix": "Candidate 1 - Equirectangular (standard parallel -11.5 deg)",
    "PROJ-LAEA": "Candidate 2 - Lambert azimuthal equal-area",
    "PROJ-AEQD": "Candidate 4 - Azimuthal equidistant",
    "PROJ-EQEARTH": "Candidate 3 - Equal Earth",
    "PROJ-NATEARTH": "Extra - Natural Earth I",
    "PROJ-ALBERS": "Candidate 5 - Albers equal-area conic",
    "PROJ-MERCATOR": "Candidate 6 - Mercator reference",
}


_CANDIDATE_METADATA: dict[str, dict[str, str]] = {
    "PROJ-CURRENT": {
        "name": "当前实现（自定义各向异性线性）",
        "math_type": "affine plate carree variant kx/ky=1.626246",
        "projection_parameters": "x=1.626246*lambda; y=phi; R=1; uniform scale omitted",
        "distance_behaviour": "EW and NS scales differ; EW/NS inflation varies with latitude",
        "direction_behaviour": "azimuths distorted except principal axes",
        "visual_balance_note": "southern cone is systematically too wide; distortion varies north-south",
        "caribbean_visibility": "same geometry/window",
        "central_america_visibility": "same geometry/window",
        "patagonia_visibility": "southern cone over-wide",
        "browser_implementation_complexity": "trivial (current)",
        "svg_compatibility": "yes",
        "library_requirement": "none",
        "performance": "trivial",
        "accessibility_notes": "current map description must not claim undistorted geometry",
        "verdict": "REJECTED / REPLACE",
        "reason": "violates the non-anisotropic proportion gate; numeric principal-axis ratio reaches 2.766735",
    },
    "PROJ-EQ-fix": {
        "name": "等距圆柱（标准纬线 -11.5°）",
        "math_type": "cylindrical equidistant",
        "projection_parameters": "standard parallel phi1=-11.5 deg; R=1",
        "distance_behaviour": "true scale on the -11.5 deg parallel only",
        "direction_behaviour": "E-W direction is true on the standard parallel",
        "visual_balance_note": "recognizable frame; high-latitude width inflation remains",
        "caribbean_visibility": "good",
        "central_america_visibility": "good",
        "patagonia_visibility": "acceptable but widened up to 1.667x",
        "browser_implementation_complexity": "trivial",
        "svg_compatibility": "yes",
        "library_requirement": "none",
        "performance": "trivial",
        "accessibility_notes": "description must state the standard parallel and residual distortion",
        "verdict": "FALLBACK (RECOMMENDED-2)",
        "reason": "smallest implementation change, but its high-latitude principal-axis and area inflation are structural",
    },
    "PROJ-LAEA": {
        "name": "Lambert 方位等积（中心 75°W 11.5°S）",
        "math_type": "azimuthal equal-area",
        "projection_parameters": "center lon0=-75 deg; lat0=-11.5 deg; R=1",
        "distance_behaviour": "true center-to-point great-circle distance only at the center radial",
        "direction_behaviour": "azimuths from the center are true; local axes rotate away from center",
        "visual_balance_note": "balanced continental composition; equal areas support size comparison",
        "caribbean_visibility": "excellent",
        "central_america_visibility": "excellent",
        "patagonia_visibility": "excellent; no cone exaggeration",
        "browser_implementation_complexity": "low (closed form)",
        "svg_compatibility": "full",
        "library_requirement": "none",
        "performance": "equal to current per point",
        "accessibility_notes": "description must state equal-area property and center",
        "verdict": "RECOMMENDED (PREFERRED)",
        "reason": "equal-area with acceptable complete local shape distortion; the combined area-neutrality/shape trade-off is preferred, not the shape minimum",
    },
    "PROJ-AEQD": {
        "name": "方位等距（中心 75°W 11.5°S）",
        "math_type": "azimuthal equidistant",
        "projection_parameters": "center lon0=-75 deg; lat0=-11.5 deg; R=1",
        "distance_behaviour": "great-circle distance from center is true",
        "direction_behaviour": "azimuth from center is true; radial/tangential scales diverge away from center",
        "visual_balance_note": "good balance; non-uniform radial area growth must be disclosed",
        "caribbean_visibility": "good",
        "central_america_visibility": "good",
        "patagonia_visibility": "good",
        "browser_implementation_complexity": "low (closed form)",
        "svg_compatibility": "full",
        "library_requirement": "none",
        "performance": "equal to LAEA",
        "accessibility_notes": "description must state non-equal-area center-distance property",
        "verdict": "ALTERNATIVE (USER CHOICE)",
        "reason": "complete shape distortion is better than LAEA at the sampled maximum (1.205492 vs 1.327088), but Tijuana area_factor is about 1.2055; not equal-area",
    },
    "PROJ-EQEARTH": {
        "name": "Equal Earth",
        "math_type": "equal-area pseudo-cylindrical (2018)",
        "projection_parameters": "Savric-Patterson-Jenny coefficients; R=1",
        "distance_behaviour": "neither global distance nor local scale is preserved",
        "direction_behaviour": "general pseudo-cylindrical directional distortion",
        "visual_balance_note": "world-map aesthetic; tropical EW compression and shear are visible",
        "caribbean_visibility": "good",
        "central_america_visibility": "good",
        "patagonia_visibility": "good",
        "browser_implementation_complexity": "low-medium (closed form)",
        "svg_compatibility": "full",
        "library_requirement": "none",
        "performance": "similar per-point cost",
        "accessibility_notes": "description must state equal-area but not imply shape preservation",
        "verdict": "ALTERNATIVE (REJECTED FOR MAIN)",
        "reason": "equal-area but the world-map compromise has larger local principal-axis distortion than LAEA here",
    },
    "PROJ-NATEARTH": {
        "name": "Natural Earth I",
        "math_type": "compromise pseudo-cylindrical",
        "projection_parameters": "Natural Earth I polynomial coefficients; R=1",
        "distance_behaviour": "neither global distance nor area is preserved",
        "direction_behaviour": "mixed pseudo-cylindrical distortion",
        "visual_balance_note": "pleasing world-map look; local shear and area changes remain",
        "caribbean_visibility": "good",
        "central_america_visibility": "good",
        "patagonia_visibility": "good",
        "browser_implementation_complexity": "low-medium (closed form)",
        "svg_compatibility": "full",
        "library_requirement": "none",
        "performance": "similar per-point cost",
        "accessibility_notes": "description must state compromise/non-equal-area behavior",
        "verdict": "REJECTED",
        "reason": "non-equal-area and higher complete shape distortion conflict with the map's size-neutrality goal",
    },
    "PROJ-ALBERS": {
        "name": "Albers 等积圆锥（75°W; 标准纬线 -5°/-30°）",
        "math_type": "conic equal-area",
        "projection_parameters": "lon0=-75 deg; standard parallels=-5/-30 deg; R=1",
        "distance_behaviour": "true scale is limited to the standard-parallel design",
        "direction_behaviour": "meridian convergence and away-from-parallel distortion",
        "visual_balance_note": "cross-equator 89-degree span creates a tilted, uneven frame",
        "caribbean_visibility": "acceptable",
        "central_america_visibility": "good",
        "patagonia_visibility": "acceptable but widened",
        "browser_implementation_complexity": "low (closed form)",
        "svg_compatibility": "full",
        "library_requirement": "none",
        "performance": "similar per-point cost",
        "accessibility_notes": "description must state conic parameters and equal-area property",
        "verdict": "REJECTED FOR MAIN",
        "reason": "equal-area but cross-equator cone geometry produces a large candidate principal-axis ratio",
    },
    "PROJ-MERCATOR": {
        "name": "Mercator（对照项，不计入主图候选）",
        "math_type": "cylindrical conformal",
        "projection_parameters": "spherical Mercator; R=1; no latitude cutoff in sample window",
        "distance_behaviour": "scale grows as sec(phi)",
        "direction_behaviour": "locally conformal; directions preserved",
        "visual_balance_note": "area inflation makes southern cone/caribbean comparison misleading",
        "caribbean_visibility": "ok",
        "central_america_visibility": "ok",
        "patagonia_visibility": "excessively enlarged by area",
        "browser_implementation_complexity": "low",
        "svg_compatibility": "full",
        "library_requirement": "none",
        "performance": "similar per-point cost",
        "accessibility_notes": "must disclose conformal/non-equal-area behavior if ever shown",
        "verdict": "REJECTED (ANALYTICAL)",
        "reason": "conformal does not make area neutral; area_factor reaches sec^2(phi) scale and is unsuitable",
    },
}


def singular_values_ratio(j00: float, j10: float, j01: float, j11: float) -> float:
    """Return smax/smin for a 2x2 matrix without a numpy dependency."""

    a = j00 * j00 + j10 * j10
    b = j00 * j01 + j10 * j11
    c = j01 * j01 + j11 * j11
    discriminant = math.sqrt(max(0.0, (a - c) ** 2 + 4.0 * b * b))
    largest = (a + c + discriminant) / 2.0
    smallest = (a + c - discriminant) / 2.0
    if smallest <= 0.0:
        return math.inf
    return math.sqrt(largest / smallest)


def local_metric(project: Projection, lon: float, lat: float) -> tuple[float, float, float]:
    """Compute proxy ratio, complete shape ratio, and raw area factor."""

    phi = rad(lat)
    west = project(lon - STEP_DEG, lat)
    east = project(lon + STEP_DEG, lat)
    south = project(lon, lat - STEP_DEG)
    north = project(lon, lat + STEP_DEG)
    j00 = (east[0] - west[0]) / (2.0 * STEP_RAD * math.cos(phi))
    j10 = (east[1] - west[1]) / (2.0 * STEP_RAD * math.cos(phi))
    j01 = (north[0] - south[0]) / (2.0 * STEP_RAD)
    j11 = (north[1] - south[1]) / (2.0 * STEP_RAD)
    ew = math.hypot(j00, j10)
    ns = math.hypot(j01, j11)
    if ew <= 0.0 or ns <= 0.0:
        raise ValueError(f"degenerate local Jacobian at lon={lon}, lat={lat}")
    return ew / ns, singular_values_ratio(j00, j10, j01, j11), abs(j00 * j11 - j01 * j10)


def metric_rows() -> list[dict[str, str]]:
    rows: list[dict[str, str]] = []
    for candidate_id, project in PROJECTIONS.items():
        measured: list[tuple[str, str, float, float, float, float, float]] = []
        for sample_code, sample_name, lon, lat in SAMPLES:
            ew_ns, principal, area = local_metric(project, lon, lat)
            if principal < 1.0 - 1.0e-10:
                raise ValueError(f"principal_axis_ratio < 1 for {candidate_id}/{sample_code}: {principal}")
            measured.append((sample_code, sample_name, lon, lat, ew_ns, principal, area))
        center_area = measured[2][6]
        if center_area <= 0.0:
            raise ValueError(f"non-positive center area factor for {candidate_id}: {center_area}")
        for sample_code, sample_name, lon, lat, ew_ns, principal, area in measured:
            rows.append(
                {
                    "sample_id": f"{candidate_id}-{sample_code}",
                    "candidate_id": candidate_id,
                    "sample_code": sample_code,
                    "sample_name": sample_name,
                    "lon_deg": f"{lon:.2f}",
                    "lat_deg": f"{lat:.2f}",
                    "window": WINDOW,
                    "ew_ns_scale_ratio": f"{ew_ns:.6f}",
                    "principal_axis_ratio": f"{principal:.6f}",
                    "area_factor": f"{area:.6f}",
                    "area_factor_relative_to_center": f"{area / center_area:.6f}",
                    "method": "0.25-degree central difference; J=[P_lambda/cos(phi),P_phi] in local unit-sphere orthonormal basis; spherical R=1; uniform canvas fit is not used in metrics",
                }
            )
    return rows


def range_text(rows: Iterable[dict[str, str]], field: str) -> str:
    values = [float(row[field]) for row in rows]
    return f"{min(values):.6f}–{max(values):.6f}"


def candidate_rows(rows: list[dict[str, str]]) -> list[dict[str, str]]:
    output: list[dict[str, str]] = []
    for candidate_id in PROJECTIONS:
        sample_rows = [row for row in rows if row["candidate_id"] == candidate_id]
        metadata = _CANDIDATE_METADATA[candidate_id]
        output.append(
            {
                "candidate_id": candidate_id,
                **metadata,
                "metric_status": "NUMERIC_7_POINT",
                "ew_ns_scale_ratio_range_measured": range_text(sample_rows, "ew_ns_scale_ratio"),
                "principal_axis_ratio_range_measured": range_text(sample_rows, "principal_axis_ratio"),
                "area_factor_range_measured": range_text(sample_rows, "area_factor"),
                "area_factor_relative_to_center_range_measured": range_text(sample_rows, "area_factor_relative_to_center"),
                "figure_file": f"figures/{FIGURES[candidate_id]}",
            }
        )
    return output


def csv_bytes(rows: list[dict[str, str]]) -> bytes:
    if not rows:
        return b""
    buffer = io.StringIO(newline="")
    writer = csv.DictWriter(buffer, fieldnames=list(rows[0]), lineterminator="\n")
    writer.writeheader()
    writer.writerows(rows)
    return buffer.getvalue().encode("utf-8")


def read_geometry() -> list[list[Point]]:
    data = json.loads(GEOJSON.read_text(encoding="utf-8"))
    rings: list[list[Point]] = []
    for feature in data["features"]:
        geometry = feature["geometry"]
        polygons = [geometry["coordinates"]] if geometry["type"] == "Polygon" else geometry["coordinates"]
        for polygon in polygons:
            rings.append([(float(lon), float(lat)) for lon, lat in polygon[0]])
    return rings


def projected_rings(project: Projection) -> list[list[Point]]:
    return [[project(lon, lat) for lon, lat in ring] for ring in read_geometry()]


def figure_bytes(candidate_id: str) -> bytes | None:
    try:
        import matplotlib

        matplotlib.use("Agg")
        import matplotlib.pyplot as plt
        from matplotlib.collections import PolyCollection
    except ImportError:
        return None

    rings = projected_rings(PROJECTIONS[candidate_id])
    xs = [x for ring in rings for x, _ in ring]
    ys = [y for ring in rings for _, y in ring]
    x0, x1, y0, y1 = min(xs), max(xs), min(ys), max(ys)
    scale = min(W / (x1 - x0), H / (y1 - y0))
    tx = (W - scale * (x1 - x0)) / 2.0 - scale * x0
    ty = (H - scale * (y1 - y0)) / 2.0 - scale * y0
    display = [[(x * scale + tx, y * scale + ty) for x, y in ring] for ring in rings]

    fig, ax = plt.subplots(figsize=(8.8, 5.6), dpi=150)
    ax.add_collection(PolyCollection(display, facecolor="#f7f2e8", edgecolor="#545952", linewidths=0.7))
    ax.set_xlim(0.0, W)
    ax.set_ylim(0.0, H)
    ax.set_aspect("equal")
    ax.axis("off")
    ax.set_facecolor("#dbe5df")
    ax.set_title(f"WCD-09 figure - {FIGURE_TITLES[candidate_id]}", fontsize=11)
    ax.text(
        W / 2.0,
        14.0,
        "Same 28-feature geometry/window; uniform-scale fit; J metrics in 07_PROJECTION_SAMPLE_METRICS.csv",
        fontsize=7.0,
        ha="center",
        color="#333333",
    )
    fig.subplots_adjust(left=0.0, right=1.0, bottom=0.0, top=0.94)
    buffer = io.BytesIO()
    fig.savefig(buffer, format="png", facecolor="#dbe5df")
    plt.close(fig)
    return buffer.getvalue()


def expected_artifacts() -> tuple[list[dict[str, str]], list[dict[str, str]], dict[str, bytes]]:
    metrics = metric_rows()
    candidates = candidate_rows(metrics)
    figures = {candidate_id: figure_bytes(candidate_id) for candidate_id in PROJECTIONS}
    if any(value is None for value in figures.values()):
        raise RuntimeError("matplotlib is required for figure generation/checking")
    return candidates, metrics, {key: value for key, value in figures.items() if value is not None}


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(encoding="utf-8", newline="") as handle:
        return list(csv.DictReader(handle))


def verify(expected_candidates: list[dict[str, str]], expected_metrics: list[dict[str, str]], expected_figures: dict[str, bytes]) -> int:
    if not CANDIDATES_CSV.exists() or not METRICS_CSV.exists():
        print("check failed: expected projection CSV outputs are missing")
        return 1
    stored_candidates = read_csv(CANDIDATES_CSV)
    stored_metrics = read_csv(METRICS_CSV)
    if stored_candidates != expected_candidates:
        print("check failed: 07_PROJECTION_CANDIDATES.csv differs from recomputed candidate ranges/metadata")
        return 1
    if stored_metrics != expected_metrics:
        print("check failed: 07_PROJECTION_SAMPLE_METRICS.csv differs from recomputed 7-point Jacobian metrics")
        return 1
    hashes: list[str] = []
    for candidate_id, rendered in expected_figures.items():
        figure = PACK / "figures" / FIGURES[candidate_id]
        if not figure.exists():
            print(f"check failed: expected figure is missing: {figure.name}")
            return 1
        expected_hash = hashlib.sha256(figure.read_bytes()).hexdigest()
        actual_hash = hashlib.sha256(rendered).hexdigest()
        if expected_hash != actual_hash:
            print(f"check failed: figure SHA-256 drift for {figure.name} (stored={expected_hash}, recomputed={actual_hash})")
            return 1
        hashes.append(f"{figure.name}={expected_hash}")
    all_ew = [float(row["ew_ns_scale_ratio"]) for row in expected_metrics]
    all_principal = [float(row["principal_axis_ratio"]) for row in expected_metrics]
    all_area = [float(row["area_factor"]) for row in expected_metrics]
    all_area_relative = [float(row["area_factor_relative_to_center"]) for row in expected_metrics]
    print(
        "check PASS "
        f"candidates={len(expected_candidates)} metric_rows={len(expected_metrics)} samples_per_candidate={len(SAMPLES)} "
        f"ew_ns={min(all_ew):.6f}..{max(all_ew):.6f} "
        f"principal_axis={min(all_principal):.6f}..{max(all_principal):.6f} "
        f"area_factor={min(all_area):.6f}..{max(all_area):.6f} "
        f"area_relative_to_center={min(all_area_relative):.6f}..{max(all_area_relative):.6f} "
        "figure_sha256="
        + ";".join(hashes)
    )
    return 0


def write_outputs(candidates: list[dict[str, str]], metrics: list[dict[str, str]], figures: dict[str, bytes]) -> None:
    CANDIDATES_CSV.write_bytes(csv_bytes(candidates))
    METRICS_CSV.write_bytes(csv_bytes(metrics))
    figure_dir = PACK / "figures"
    figure_dir.mkdir(parents=True, exist_ok=True)
    for candidate_id, rendered in figures.items():
        (figure_dir / FIGURES[candidate_id]).write_bytes(rendered)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="recompute and verify without writing files")
    args = parser.parse_args()
    candidates, metrics, figures = expected_artifacts()
    if args.check:
        return verify(candidates, metrics, figures)
    write_outputs(candidates, metrics, figures)
    print(f"wrote {CANDIDATES_CSV} rows={len(candidates)}")
    print(f"wrote {METRICS_CSV} rows={len(metrics)} candidates={len(PROJECTIONS)} samples_per_candidate={len(SAMPLES)}")
    for candidate_id in PROJECTIONS:
        digest = hashlib.sha256(figures[candidate_id]).hexdigest()
        print(f"wrote {PACK / 'figures' / FIGURES[candidate_id]} sha256={digest}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
