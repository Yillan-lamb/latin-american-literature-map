#!/usr/bin/env python3
"""Mechanical acceptance checks for the WCD-09 map implementation."""

from __future__ import annotations

import csv
import hashlib
import json
import math
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
ASSET = ROOT / "site/assets/natural-earth-5.1.1-admin0-50m-latin-america.geojson"
WEB_DATA = ROOT / "data/v2/web/site_data.json"
GEO_CSV = ROOT / "data/v2/geo/PLACES_GEO.csv"
APP = ROOT / "site/app.js"
STYLES = ROOT / "site/styles.css"
EXPECTED_ASSET_SHA256 = "9a225c6be6b217bf67ab4ed687598563e8d7c405a827bcca78ede99439c67cd6"
EXPECTED_FEATURES = 48
EXPECTED_PARTS = 180
EXPECTED_L2_CODES = 13
EXPECTED_L1_ONLY = 35
EXPECTED_BLOCKED_NAMES = {"ATG", "BRB", "DMA", "FLK", "GRD", "KNA", "LCA", "VCT"}
WINDOW = (-118.0, -56.0, -32.0, 33.0)
MAP_WIDTH, MAP_HEIGHT, MAP_PADDING = 880.0, 560.0, 22.0
SAMPLES = ((-99.13, 19.43), (-82.38, 23.13), (-75.0, -11.5), (-58.38, -34.60), (-70.65, -33.46), (-68.0, -54.0), (-117.0, 32.5))
PERMANENT_GEONAMES = {
    "V1-ENT-0022": "3451190", "V1-ENT-0053": "3530367", "V1-ENT-0054": "3526674",
    "V1-ENT-0056": "3530597", "V1-ENT-0057": "8582212", "V1-ENT-0098": "3689759",
    "V1-ENT-0125": "3936456", "V1-ENT-0126": "3947322", "V1-ENT-0127": "3877146",
    "V1-ENT-0128": "3871336", "V1-ENT-0129": "3117735", "V1-ENT-0153": "3868308",
    "V1-ENT-0370": "3435910", "V1-ENT-0371": "3441575", "V1-ENT-0372": "3553478",
    "V1-ENT-0373": "2988507",
}


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def coordinates(value: object):
    if isinstance(value, list) and len(value) >= 2 and all(isinstance(item, (int, float)) for item in value[:2]):
        yield value
    elif isinstance(value, list):
        for item in value:
            yield from coordinates(item)


def laea(lon: float, lat: float) -> tuple[float, float]:
    lam, phi, lam0, phi0 = map(math.radians, (lon, lat, -75.0, -11.5))
    delta = lam - lam0
    k = math.sqrt(2.0 / (1.0 + math.sin(phi0) * math.sin(phi) + math.cos(phi0) * math.cos(phi) * math.cos(delta)))
    return k * math.cos(phi) * math.sin(delta), k * (math.cos(phi0) * math.sin(phi) - math.sin(phi0) * math.cos(phi) * math.cos(delta))


def local_metrics(lon: float, lat: float) -> tuple[float, float, float]:
    step = 0.25
    step_rad = math.radians(step)
    west, east = laea(lon - step, lat), laea(lon + step, lat)
    south, north = laea(lon, lat - step), laea(lon, lat + step)
    j00 = (east[0] - west[0]) / (2 * step_rad * math.cos(math.radians(lat)))
    j10 = (east[1] - west[1]) / (2 * step_rad * math.cos(math.radians(lat)))
    j01 = (north[0] - south[0]) / (2 * step_rad)
    j11 = (north[1] - south[1]) / (2 * step_rad)
    ew, ns = math.hypot(j00, j10), math.hypot(j01, j11)
    a, b, c = j00 * j00 + j10 * j10, j00 * j01 + j10 * j11, j01 * j01 + j11 * j11
    discriminant = math.sqrt(max(0.0, (a - c) ** 2 + 4 * b * b))
    principal = math.sqrt(((a + c + discriminant) / 2) / ((a + c - discriminant) / 2))
    return ew / ns, principal, abs(j00 * j11 - j01 * j10)


def relative_luminance(hex_color: str) -> float:
    channels = [int(hex_color[index:index + 2], 16) / 255 for index in (1, 3, 5)]
    linear = [channel / 12.92 if channel <= 0.04045 else ((channel + 0.055) / 1.055) ** 2.4 for channel in channels]
    return 0.2126 * linear[0] + 0.7152 * linear[1] + 0.0722 * linear[2]


def contrast(first: str, second: str) -> float:
    high, low = sorted((relative_luminance(first), relative_luminance(second)), reverse=True)
    return (high + 0.05) / (low + 0.05)


def main() -> int:
    raw = ASSET.read_bytes()
    asset = json.loads(raw)
    provenance = asset["wcd09_provenance"]
    require(hashlib.sha256(raw).hexdigest() == EXPECTED_ASSET_SHA256, "basemap output SHA-256 drift")
    require(provenance["source_archive_sha256"] == "5fed433373581fa648920435f937d95f2d3c0200e067409c6478dcdf1b853139", "source SHA missing")
    require(provenance["release"] == "5.1.1" and provenance["retrieved_at"] == "2026-09-08", "release provenance mismatch")
    require(len(asset["features"]) == EXPECTED_FEATURES, "unexpected L1 feature count")
    require(sum(len(feature["properties"]["PART_IDS"]) for feature in asset["features"]) == EXPECTED_PARTS, "unexpected polygon part count")
    feature_ids = [feature["properties"]["FEATURE_ID"] for feature in asset["features"]]
    part_ids = [part for feature in asset["features"] for part in feature["properties"]["PART_IDS"]]
    require(len(feature_ids) == len(set(feature_ids)) and len(part_ids) == len(set(part_ids)), "unstable or duplicate geometry IDs")
    blocked_names = {feature["properties"]["ADM0_A3"] for feature in asset["features"] if not feature["properties"]["NAME_ZH"]}
    require(blocked_names == EXPECTED_BLOCKED_NAMES, "blocked sensitive/unverified names drifted")
    projected_geometry = []
    for feature in asset["features"]:
        for lon, lat, *_ in coordinates(feature["geometry"]["coordinates"]):
            require(math.isfinite(lon) and math.isfinite(lat), "geometry contains NaN/Infinity")
            require(WINDOW[0] <= lon <= WINDOW[2] and WINDOW[1] <= lat <= WINDOW[3], f"out-of-window geometry: {feature['id']}")
            x, y = laea(lon, lat)
            require(math.isfinite(x) and math.isfinite(y), f"projection failed: {feature['id']}")
            projected_geometry.append((x, y))
    min_x, max_x = min(point[0] for point in projected_geometry), max(point[0] for point in projected_geometry)
    min_y, max_y = min(point[1] for point in projected_geometry), max(point[1] for point in projected_geometry)
    scale = min((MAP_WIDTH - 2 * MAP_PADDING) / (max_x - min_x), (MAP_HEIGHT - 2 * MAP_PADDING) / (max_y - min_y))
    offset_x = (MAP_WIDTH - (max_x - min_x) * scale) / 2
    offset_y = (MAP_HEIGHT - (max_y - min_y) * scale) / 2
    screen_geometry = [(offset_x + (x - min_x) * scale, MAP_HEIGHT - offset_y - (y - min_y) * scale) for x, y in projected_geometry]
    require(all(0 <= x <= MAP_WIDTH and 0 <= y <= MAP_HEIGHT for x, y in screen_geometry), "geometry falls outside fitted viewport")

    web = json.loads(WEB_DATA.read_text(encoding="utf-8"))
    public_ids = {item["target_id"] for item in web["search_index"]}
    country_places = [item for item in web["map"]["places"] if item["place_kind"] == "country"]
    l2 = [item for item in country_places if item["map_status"] != "hidden" and item["reality_status"] != "unknown" and item["place_id"] in public_ids]
    codes = [item["country_code"] for item in l2]
    require(len(codes) == EXPECTED_L2_CODES and len(codes) == len(set(codes)), "L2 country count/uniqueness mismatch")
    require(EXPECTED_FEATURES - len(codes) == EXPECTED_L1_ONLY, "L1-only background count mismatch")
    require(not any(item["place_id"] == "V2-GEO-BR" for item in web["map"]["places"]), "legacy Brazil node remains active")
    rio = next(item for item in web["map"]["places"] if item["place_id"] == "V1-ENT-0022")
    require(rio["parent_place_id"] == "V1-ENT-0183", "Rio is not attached to canonical Brazil")
    europe = {item["place_id"]: item for item in web["map"]["places"] if item["place_id"] in {"V1-ENT-0129", "V1-ENT-0373"}}
    require(set(europe) == {"V1-ENT-0129", "V1-ENT-0373"}, "Madrid/Paris data routes missing")
    require(all(not (WINDOW[0] <= item["longitude"] <= WINDOW[2] and WINDOW[1] <= item["latitude"] <= WINDOW[3]) for item in europe.values()), "Madrid/Paris unexpectedly entered map window")
    for item in web["map"]["places"]:
        if item.get("place_kind") == "country" or item.get("reality_status") != "real" or item.get("latitude") is None or item["place_id"] in europe:
            continue
        if WINDOW[0] <= item["longitude"] <= WINDOW[2] and WINDOW[1] <= item["latitude"] <= WINDOW[3]:
            raw_x, raw_y = laea(item["longitude"], item["latitude"])
            screen_x = offset_x + (raw_x - min_x) * scale
            screen_y = MAP_HEIGHT - offset_y - (raw_y - min_y) * scale
            require(0 <= screen_x <= MAP_WIDTH and 0 <= screen_y <= MAP_HEIGHT, f"map point falls outside fitted viewport: {item['place_id']}")

    with GEO_CSV.open(encoding="utf-8-sig", newline="") as handle:
        geo_rows = {row["place_id"]: row for row in csv.DictReader(handle)}
    for place_id, geoname_id in PERMANENT_GEONAMES.items():
        require(geo_rows[place_id]["coordinate_source_url"] == f"https://www.geonames.org/{geoname_id}/", f"noncanonical GeoNames URL: {place_id}")
    require(geo_rows["V1-ENT-0052"]["coordinate_source_url"] == "https://www.chiapas.gob.mx/ubicacion/", "blocked Chiapas source was changed")

    metrics = [local_metrics(lon, lat) for lon, lat in SAMPLES]
    ew = [item[0] for item in metrics]
    principal = [item[1] for item in metrics]
    area = [item[2] for item in metrics]
    center_area = local_metrics(-75.0, -11.5)[2]
    area_relative_to_center = [value / center_area for value in area]
    require(0.95748 <= min(ew) <= 0.95751 and 1.14379 <= max(ew) <= 1.14382, "LAEA ew/ns metric drift")
    require(0.99999 <= min(principal) <= 1.00001 and 1.32707 <= max(principal) <= 1.32710, "LAEA principal-axis metric drift")
    require(max(area) - min(area) < 0.00001 and all(0.99998 <= value <= 1.00001 for value in area), "LAEA area factor drift")
    require(all(0.99999 <= value <= 1.00001 for value in area_relative_to_center), "LAEA relative-to-center area factor drift")

    app = APP.read_text(encoding="utf-8")
    styles = STYLES.read_text(encoding="utf-8")
    require("data-projection=\"LAEA\"" in app and "preserveAspectRatio=\"xMidYMid meet\"" in app, "SVG projection metadata missing")
    require("((longitude + 118) / 86)" not in app and "((33 - latitude) / 89)" not in app, "legacy affine projection remains active")
    require("当前暂无收录作家或作品" in app and "不构成法律" in app, "legend/disclaimer missing")
    require("V1-ENT-0129" not in app and "V1-ENT-0373" not in app, "off-map Europe IDs are hard-coded into map DOM")
    require("Falkland Islands" not in app, "EN-only sensitive tooltip remains")
    require("最终勘界" not in app, "unverified final-demarcation claim remains")
    require("stroke-dasharray" in styles, "L1/L2 states rely on color alone")
    require(contrast("#a64b36", "#dbe5df") >= 3.0, "interactive map fill lacks 3:1 graphical contrast")
    print(json.dumps({
        "status": "PASS", "asset_sha256": EXPECTED_ASSET_SHA256, "l1_features": EXPECTED_FEATURES,
        "polygon_parts": EXPECTED_PARTS, "l2_country_codes": EXPECTED_L2_CODES,
        "l1_only_backgrounds": EXPECTED_L1_ONLY,
        "projection": {"id": "LAEA", "center": [-75, -11.5], "ew_ns_scale_ratio": [min(ew), max(ew)], "principal_axis_ratio": [min(principal), max(principal)], "area_factor": [min(area), max(area)], "area_relative_to_center": [min(area_relative_to_center), max(area_relative_to_center)]},
    }, ensure_ascii=False, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
