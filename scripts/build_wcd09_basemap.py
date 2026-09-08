#!/usr/bin/env python3
"""Build the WCD-09 Natural Earth 50m Latin America basemap.

The upstream archive is intentionally not vendored.  The builder pins its
release and SHA-256, explodes every input feature into polygon parts before
window selection, assigns stable part IDs, and then regroups retained parts by
Natural Earth admin-0 feature for compact browser rendering.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import tempfile
import urllib.request
import zipfile
from pathlib import Path

import shapefile


ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / "site/assets/natural-earth-5.1.1-admin0-50m-latin-america.geojson"
SOURCE_DATASET = "Natural Earth Admin 0 – Countries 1:50m"
SOURCE_RELEASE = "5.1.1"
SOURCE_RETRIEVED_AT = "2026-09-08"
SOURCE_PAGE = "https://www.naturalearthdata.com/downloads/50m-cultural-vectors/50m-admin-0-countries-2/"
SOURCE_URL = "https://naciscdn.org/naturalearth/50m/cultural/ne_50m_admin_0_countries.zip"
SOURCE_SHA256 = "5fed433373581fa648920435f937d95f2d3c0200e067409c6478dcdf1b853139"
SOURCE_BASENAME = "ne_50m_admin_0_countries"
QUANTIZATION_DECIMALS = 5
WINDOW = (-118.0, -56.0, -32.0, 33.0)  # west, south, east, north

# C-8-OPT-1 plus the C-3/C-6 candidate L1 set.  C-4-OPT-1 and C-7-OPT-1
# explicitly keep USA, South Georgia, Navassa and Clipperton out at 50m.
IN_SCOPE_A3 = {
    "AIA", "ARG", "ATG", "ABW", "BHS", "BLM", "BLZ", "BOL", "BRA", "BRB",
    "CHL", "COL", "CRI", "CUB", "CUW", "CYM", "DMA", "DOM", "ECU", "FLK",
    "FRA", "GRD", "GTM", "GUY", "HND", "HTI", "JAM", "KNA", "LCA", "MAF",
    "MEX", "MSR", "NIC", "NLD", "PAN", "PER", "PRI", "PRY", "SLV", "SUR",
    "SXM", "TCA", "TTO", "URY", "VCT", "VEN", "VGB", "VIR",
}

# Only names already accepted by the WCD-09 name audit are exposed.  The seven
# NAME-31…NAME-37 rows and Falkland/Malvinas remain deliberately unnamed because
# their required primary Chinese-name evidence is CANNOT_VERIFY.
VERIFIED_CHINESE_NAMES = {
    "AIA": "安圭拉", "ARG": "阿根廷", "ABW": "阿鲁巴", "BHS": "巴哈马",
    "BLM": "法属圣巴泰勒米", "BLZ": "伯利兹", "BOL": "玻利维亚", "BRA": "巴西",
    "CHL": "智利", "COL": "哥伦比亚", "CRI": "哥斯达黎加", "CUB": "古巴",
    "CUW": "库拉索", "CYM": "开曼群岛", "DOM": "多米尼加共和国", "ECU": "厄瓜多尔",
    "FRA": "法国关联背景", "GTM": "危地马拉", "GUY": "圭亚那", "HND": "洪都拉斯",
    "HTI": "海地", "JAM": "牙买加", "MAF": "法属圣马丁", "MEX": "墨西哥",
    "MSR": "蒙特塞拉特", "NIC": "尼加拉瓜", "NLD": "荷兰关联背景", "PAN": "巴拿马",
    "PER": "秘鲁", "PRI": "波多黎各", "PRY": "巴拉圭", "SLV": "萨尔瓦多",
    "SUR": "苏里南", "SXM": "荷属圣马丁", "TCA": "特克斯和凯科斯群岛",
    "TTO": "特立尼达和多巴哥", "URY": "乌拉圭", "VEN": "委内瑞拉",
    "VGB": "英属维尔京群岛", "VIR": "美属维尔京群岛",
}


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def intersects_window(rings: list[list[list[float]]]) -> bool:
    xs = [point[0] for ring in rings for point in ring]
    ys = [point[1] for ring in rings for point in ring]
    west, south, east, north = WINDOW
    return bool(xs and max(xs) >= west and min(xs) <= east and max(ys) >= south and min(ys) <= north)


def quantize_polygon(polygon: list[list[list[float]]]) -> list[list[list[float]]]:
    return [
        [[round(float(x), QUANTIZATION_DECIMALS), round(float(y), QUANTIZATION_DECIMALS)] for x, y in ring]
        for ring in polygon
    ]


def polygon_sort_key(polygon: list[list[list[float]]]) -> tuple[float, float, float, float, int]:
    points = [point for ring in polygon for point in ring]
    xs = [point[0] for point in points]
    ys = [point[1] for point in points]
    return (round(min(xs), 5), round(min(ys), 5), round(max(xs), 5), round(max(ys), 5), len(points))


def build(source_zip: Path) -> bytes:
    actual_sha = sha256(source_zip)
    if actual_sha != SOURCE_SHA256:
        raise SystemExit(f"source SHA-256 mismatch: expected {SOURCE_SHA256}, got {actual_sha}")

    with tempfile.TemporaryDirectory(prefix="wcd09-ne50-") as temp_dir:
        with zipfile.ZipFile(source_zip) as archive:
            archive.extractall(temp_dir)
        reader = shapefile.Reader(str(Path(temp_dir) / f"{SOURCE_BASENAME}.shp"))
        features = []
        retained_parts = 0
        for shape_record in reader.iterShapeRecords():
            record = shape_record.record.as_dict()
            adm0_a3 = record["ADM0_A3"]
            if adm0_a3 not in IN_SCOPE_A3:
                continue
            geometry = shape_record.shape.__geo_interface__
            polygons = [geometry["coordinates"]] if geometry["type"] == "Polygon" else list(geometry["coordinates"])
            selected = [quantize_polygon(list(polygon)) for polygon in polygons if intersects_window(list(polygon))]
            selected.sort(key=polygon_sort_key)
            if not selected:
                continue
            part_ids = [f"ne50-{SOURCE_RELEASE}-{adm0_a3.lower()}-{index:02d}" for index in range(1, len(selected) + 1)]
            retained_parts += len(selected)
            iso_a2 = record["ISO_A2"] if record["ISO_A2"] != "-99" else None
            features.append({
                "type": "Feature",
                "id": f"ne50-{SOURCE_RELEASE}-{adm0_a3.lower()}",
                "properties": {
                    "FEATURE_ID": f"ne50-{SOURCE_RELEASE}-{adm0_a3.lower()}",
                    "PART_IDS": part_ids,
                    "ADMIN": record["ADMIN"],
                    "ISO_A2": iso_a2,
                    "ADM0_A3": adm0_a3,
                    "SOV_A3": record["SOV_A3"],
                    "SOVEREIGNT": record["SOVEREIGNT"],
                    "NAME_ZH": VERIFIED_CHINESE_NAMES.get(adm0_a3),
                    "LABEL_LONGITUDE": round(float(record["LABEL_X"]), QUANTIZATION_DECIMALS),
                    "LABEL_LATITUDE": round(float(record["LABEL_Y"]), QUANTIZATION_DECIMALS),
                    "L1_STATUS": "background",
                },
                "geometry": {
                    "type": "Polygon" if len(selected) == 1 else "MultiPolygon",
                    "coordinates": selected[0] if len(selected) == 1 else selected,
                },
            })

    features.sort(key=lambda feature: feature["properties"]["ADM0_A3"])
    payload = {
        "type": "FeatureCollection",
        "wcd09_provenance": {
            "dataset": SOURCE_DATASET,
            "release": SOURCE_RELEASE,
            "retrieved_at": SOURCE_RETRIEVED_AT,
            "source_page": SOURCE_PAGE,
            "source_url": SOURCE_URL,
            "source_archive_sha256": SOURCE_SHA256,
            "processing": [
                "verify source archive SHA-256",
                "extract shapefile",
                "explode admin-0 features into polygon parts",
                "select approved admin-0 records and parts intersecting the WCD-09 window",
                f"quantize coordinates to {QUANTIZATION_DECIMALS} decimal places",
                "assign stable IDs to retained parts",
                "regroup retained parts by admin-0 feature for browser rendering",
            ],
            "selection_window_lonlat": list(WINDOW),
            "feature_count": len(features),
            "polygon_part_count": retained_parts,
        },
        "features": features,
    }
    return (json.dumps(payload, ensure_ascii=False, sort_keys=True, separators=(",", ":")) + "\n").encode()


def obtain_source(explicit: Path | None, directory: Path) -> Path:
    if explicit:
        return explicit
    destination = directory / f"{SOURCE_BASENAME}-{SOURCE_RELEASE}.zip"
    urllib.request.urlretrieve(SOURCE_URL, destination)
    return destination


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source-zip", type=Path)
    parser.add_argument("--output", type=Path, default=OUTPUT)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    with tempfile.TemporaryDirectory(prefix="wcd09-source-") as temp_dir:
        source = obtain_source(args.source_zip, Path(temp_dir))
        generated = build(source)
    if args.check:
        if not args.output.exists() or args.output.read_bytes() != generated:
            raise SystemExit(f"generated basemap differs from {args.output}")
        print(f"PASS: deterministic basemap {sha256(args.output)}")
        return
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_bytes(generated)
    print(f"wrote {args.output} ({sha256(args.output)})")


if __name__ == "__main__":
    main()
