#!/usr/bin/env python3
"""Build deterministic, page-oriented V2 Web Data from V1 Research Data + Curation Data."""

from __future__ import annotations

import argparse
import csv
import json
import sqlite3
import re
import unicodedata
from collections import defaultdict
from datetime import date, datetime, timezone
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_DB = ROOT / "data/master/V1_MASTER.sqlite"
DEFAULT_GEO = ROOT / "data/v2/geo"
DEFAULT_CURATION = ROOT / "data/v2/curation"
DEFAULT_OUTPUT = ROOT / "data/v2/web"
DEFAULT_PRESENTATION = ROOT / "data/v2/presentation/PUBLIC_PRESENTATION.json"
DEFAULT_PUBLIC_CONTENT = ROOT / "data/v2/curation/PUBLIC_CONTENT.json"
SCHEMA_VERSION = "v2-web-0.2"
PRODUCT_VERSION = "0.2.1"
CURATION_SCHEMA_VERSION = "v2-curation-0.1"
ALLOWED_CURATION_STATUSES = {"auto_approved", "user_review", "hold"}
PRESENTATION_GROUPS = ("reading_paths", "timeline_periods", "why_read", "next_reads")
DISCOVERY_RANKING_VERSION = "web-0.2-popularity-v1"
DISCOVERY_PAGE_SIZE = 9
INTERNAL_READER_INSTITUTION = (
    r"(?:\b(?:ABL|BNE|CVC|CONICET|UNAM|MEC)\b|Instituto Cervantes|Biblioteca Virtual|"
    r"Memoria Chilena|Itaú Cultural|poets\.org|Passagens|RFRM|Universidad|Fundaci[oó]n|"
    r"Polar|BNDigital|(?:国家)?图书馆|国家机构|公共文化(?:机构)?|大学|基金会|机构|官网)"
)
INTERNAL_READER_PROCESS = (
    r"(?:书目|目录|页面|资料|档案|年表|时间线|题名|年份|记录|确认|核验|核对|支持|依据|"
    r"显示|标注|列出|列为|区分|检索|回溯|可回溯|可复核|可核验)"
)
INTERNAL_READER_LANGUAGE = re.compile(
    rf"(?:"
    # An institution is ordinary literary context until it is coupled with
    # evidence-handling prose.  This preserves biographies such as “曾任国家
    # 图书馆馆长” while still rejecting “ABL 书目列出……”.
    rf"{INTERNAL_READER_INSTITUTION}[^。；\n]{{0,40}}{INTERNAL_READER_PROCESS}|"
    r"Nobel\s+Facts|Facts\s*页|"
    r"(?:书目|目录|页面|资料|(?<!笔名)来源|档案|时间线|论文)[^。；\n]{0,32}"
    r"(?:列出|列为|记录|确认|核验|核对|支持|依据|显示|标注|认为|指出|解读|分析|讨论|区分|回溯|可回溯|可复核|可核验)|"
    r"(?:Memoria Chilena|巴西文学院)[^。；\n]{0,40}(?:提供|描述)|"
    r"书目(?:中)?形成[^。；\n]{0,24}(?:时间线|序列)|"
    r"(?:原文版|译本|年份|题名|首版|英译)[^。；]{0,20}记录|"
    r"(?:作品页|作者页|机构年表|作品档案|作者档案|档案事实|档案记录)|"
    r"(?:字段|层级|节点|条目|本卡|争议提示|年份争议)|"
    r"研究(?:层|资料|实体|锚点|关系|依据|流程|说明|强调|认为|指出|显示|支持|材料|事实|线索|证据)|后续研究|"
    r"(?:书目位置|书目入口|书目事实|年代记录|文类标注|可检索的时间线)|"
    r"\d{4}\s*年(?:记录|书目|出版信息)|"
    r"(?:核对|确认|标注|记录|定位|检索)[^。；]{0,24}"
    r"(?:原文题名|题名|年份|首版|出版|首发|作品集|小说层级|层级|字段|节点|条目|信息|日期|作者关系)|"
    r"(?:原文题名|年份|首版|出版|首发|西语首刊|作品|小说|戏剧)[^。；]{0,16}"
    r"(?:记录|核对|确认|标注)|正式(?:研究|地点|关联|关系|作品|主题|实体)|"
    r"(?:可回查|可核实|已核实|暂译)|(?:待|留待)[^。；]{0,24}(?:研究|补充|上线|确认|核对)|"
    r"不(?:把|将)[^。；]{0,30}(?:冒充|写成|升级为|推导|外推)[^。；]{0,20}(?:事实|关系|结论|定论|评价)|"
    r"(?:正式|作者级)[^。；]{0,12}关系|国家父级|导航所需|已经公开|"
    r"支撑[^。；]{0,8}事实|公开[^。；]{0,8}关系|作品空间作用|"
    r"中文(?:名|展示名)[^。；]{0,24}(?:展示|读者)|本页|可核回|"
    r"官方书目|官方(?:一句话)?(?:释义|时间线|页面|资料)[^。；]{0,24}(?:列出|记录|确认|支持|显示|覆盖|定义|说明|来源)|"
    r"机构(?:来源|资料|传记)[^。；]{0,24}(?:列出|记录|确认|支持|显示)|公共文化页面[^。；]{0,24}(?:列出|记录|确认|支持|显示)|"
    r"(?:书目|目录|页面|资料|来源|档案|时间线)(?:列出|记录|确认|支持|显示)|"
    r"(?:再次确认|交叉支持|直接支持|直接列出|直接记录|可回溯|可复核|可核验)|"
    r"(?:直接作品|书目|研究|事实|机构)来源|来源(?:将|所说|列出|记录|支持|确认|显示|中)|"
    r"(?:实体层|字段层|工作层)(?:使用|采用|保留)?|\bcollection\b|"
    r"(?:主库|本批|审核层|审阅|审核|复核|核验|准入|待复核|来源边界|年份冲突记录)|"
    r"(?:Research\s*(?:Data|fact)?|source_id|fact_id|reviewer|reviewed|verified|provisional|gap\s*台账)|"
    r"(?:据\s*(?:Nobel|诺贝尔|[A-Za-z.]+)|根据(?:某|该|现有)?(?:资料|来源|数据库|页面|书目|目录|机构|图书馆)|依据(?:资料|来源|书目|目录|机构|图书馆))"
    r")",
    re.IGNORECASE,
)


def rows(conn: sqlite3.Connection, sql: str) -> list[dict[str, Any]]:
    conn.row_factory = sqlite3.Row
    return [dict(row) for row in conn.execute(sql)]


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(encoding="utf-8-sig", newline="") as handle:
        return list(csv.DictReader(handle))


def split_refs(value: str | None) -> list[str]:
    if not value:
        return []
    return [item.strip() for item in value.split(";") if item.strip()]


def number_or_none(value: str | None) -> float | None:
    if value in (None, ""):
        return None
    return float(value)


def stable_slug(original_name: str | None, target_type: str, target_id: str) -> str:
    normalized = unicodedata.normalize("NFD", original_name or "")
    ascii_text = normalized.encode("ascii", "ignore").decode("ascii").lower()
    base = re.sub(r"[^a-z0-9]+", "-", ascii_text).strip("-")
    identity = re.sub(r"[^a-z0-9]+", "-", target_id.lower()).strip("-")
    return f"{base}-{identity}" if base else f"{target_type}-{identity}"


def public_route(target_type: str, target_id: str, original_name: str | None) -> str:
    folder = {"author": "authors", "work": "works", "collection": "works", "country": "countries", "place": "places", "fictional_space": "places"}.get(target_type, "explore")
    return f"{folder}/{stable_slug(original_name, target_type, target_id)}/"


def required_text(row: dict[str, str], key: str, path: Path, line: int) -> str:
    value = row.get(key, "").strip()
    if not value:
        raise ValueError(f"{path}:{line}: missing required field {key}")
    return value


def contains_internal_reader_language(value: object) -> bool:
    if isinstance(value, str):
        return bool(INTERNAL_READER_LANGUAGE.search(value))
    if isinstance(value, list):
        return any(contains_internal_reader_language(item) for item in value)
    if isinstance(value, dict):
        return any(contains_internal_reader_language(item) for item in value.values())
    return False


def clean_reader_value(value: object) -> object | None:
    """Keep literary conclusions and remove optional evidence-process prose.

    The source wrapper remains untouched in ``public_content``.  This function
    only produces the presentation projection consumed by reader-facing DOM.
    """
    if isinstance(value, str):
        normalized = value.strip()
        return normalized if normalized and not contains_internal_reader_language(normalized) else None
    if isinstance(value, list):
        cleaned = [clean_reader_value(item) for item in value]
        return [item for item in cleaned if item not in (None, "", [], {})] or None
    if isinstance(value, dict):
        if contains_internal_reader_language(value):
            return None
        cleaned = {key: clean_reader_value(item) for key, item in value.items()}
        return {key: item for key, item in cleaned.items() if item not in (None, "", [], {})} or None
    return value


def wrapped_content(record: dict[str, Any], key: str) -> object | None:
    value = record.get(key)
    return value.get("content") if isinstance(value, dict) else None


def load_geo(geo_dir: Path) -> tuple[list[dict[str, Any]], list[dict[str, Any]]]:
    place_rows = read_csv(geo_dir / "PLACES_GEO.csv")
    relation_rows = read_csv(geo_dir / "PLACE_RELATIONS.csv")
    places: list[dict[str, Any]] = []
    place_ids: set[str] = set()
    for line, row in enumerate(place_rows, 2):
        place_id = required_text(row, "place_id", geo_dir / "PLACES_GEO.csv", line)
        if place_id in place_ids:
            raise ValueError(f"duplicate place_id: {place_id}")
        place_ids.add(place_id)
        latitude = number_or_none(row.get("latitude"))
        longitude = number_or_none(row.get("longitude"))
        if (latitude is None) != (longitude is None):
            raise ValueError(f"{place_id}: latitude/longitude must be both set or both empty")
        reality_status = required_text(row, "reality_status", geo_dir / "PLACES_GEO.csv", line)
        if reality_status == "fictional" and (latitude is not None or longitude is not None):
            raise ValueError(f"{place_id}: fictional place cannot have real coordinates")
        places.append(
            {
                "place_id": place_id,
                "entity_id": row.get("entity_id") or None,
                "name_zh": required_text(row, "name_zh", geo_dir / "PLACES_GEO.csv", line),
                "original_name": row.get("original_name") or None,
                "place_kind": required_text(row, "place_kind", geo_dir / "PLACES_GEO.csv", line),
                "reality_status": reality_status,
                "country_code": row.get("country_code") or None,
                "parent_place_id": row.get("parent_place_id") or None,
                "latitude": latitude,
                "longitude": longitude,
                "coordinate_precision": row.get("coordinate_precision") or None,
                "coordinate_source_url": row.get("coordinate_source_url") or None,
                "coordinate_retrieved_at": row.get("coordinate_retrieved_at") or None,
                "map_status": required_text(row, "map_status", geo_dir / "PLACES_GEO.csv", line),
                "source_kind": row.get("source_kind") or None,
                "classification_status": row.get("classification_status") or None,
                "classification_source_url": row.get("classification_source_url") or None,
                "classification_note": row.get("classification_note") or None,
            }
        )
    for place in places:
        parent_id = place["parent_place_id"]
        if parent_id and parent_id not in place_ids:
            raise ValueError(f"{place['place_id']}: dangling parent_place_id {parent_id}")

    place_relations: list[dict[str, Any]] = []
    relation_ids: set[str] = set()
    for line, row in enumerate(relation_rows, 2):
        relation_id = required_text(row, "relation_id", geo_dir / "PLACE_RELATIONS.csv", line)
        if relation_id in relation_ids:
            raise ValueError(f"duplicate map relation_id: {relation_id}")
        relation_ids.add(relation_id)
        target_place_id = required_text(row, "target_place_id", geo_dir / "PLACE_RELATIONS.csv", line)
        if target_place_id not in place_ids:
            raise ValueError(f"{relation_id}: dangling target_place_id {target_place_id}")
        place_relations.append(
            {
                "relation_id": relation_id,
                "v1_relationship_id": required_text(row, "v1_relationship_id", geo_dir / "PLACE_RELATIONS.csv", line),
                "source_entity_id": required_text(row, "source_entity_id", geo_dir / "PLACE_RELATIONS.csv", line),
                "source_name_zh": required_text(row, "source_name_zh", geo_dir / "PLACE_RELATIONS.csv", line),
                "target_place_id": target_place_id,
                "target_name_zh": required_text(row, "target_name_zh", geo_dir / "PLACE_RELATIONS.csv", line),
                "relation_type": required_text(row, "relation_type", geo_dir / "PLACE_RELATIONS.csv", line),
                "map_relation_role": required_text(row, "map_relation_role", geo_dir / "PLACE_RELATIONS.csv", line),
                "space_kind": required_text(row, "space_kind", geo_dir / "PLACE_RELATIONS.csv", line),
                "confidence": row.get("confidence") or None,
                "review_status": row.get("review_status") or None,
                "description_zh": row.get("description_zh") or None,
                "source_reference": required_text(row, "source_reference", geo_dir / "PLACE_RELATIONS.csv", line),
            }
        )
    return places, place_relations


def load_curation(curation_dir: Path, valid_target_ids: set[str]) -> dict[str, list[dict[str, Any]]]:
    files = {
        "entries": ("CURATION_ENTRIES.csv", "curation_id"),
        "selections": ("CURATION_SELECTIONS.csv", "curation_id"),
        "recommendations": ("CURATION_RECOMMENDATIONS.csv", "curation_id"),
    }
    result: dict[str, list[dict[str, Any]]] = {}
    seen: set[str] = set()
    for group, (filename, id_key) in files.items():
        path = curation_dir / filename
        loaded: list[dict[str, Any]] = []
        for line, row in enumerate(read_csv(path), 2):
            curation_id = required_text(row, id_key, path, line)
            if curation_id in seen:
                raise ValueError(f"duplicate curation_id: {curation_id}")
            seen.add(curation_id)
            status = required_text(row, "status", path, line)
            if status not in ALLOWED_CURATION_STATUSES:
                raise ValueError(f"{path}:{line}: invalid curation status {status}")
            schema_version = required_text(row, "schema_version", path, line)
            if schema_version != CURATION_SCHEMA_VERSION:
                raise ValueError(f"{path}:{line}: expected {CURATION_SCHEMA_VERSION}, got {schema_version}")
            target_id = row.get("target_id") or row.get("from_target_id")
            if target_id and target_id not in valid_target_ids:
                raise ValueError(f"{path}:{line}: dangling target id {target_id}")
            if row.get("to_target_id") and row["to_target_id"] not in valid_target_ids:
                raise ValueError(f"{path}:{line}: dangling to_target_id {row['to_target_id']}")
            normalized = dict(row)
            for key in ("research_refs", "source_refs", "display_scope"):
                if key in normalized:
                    normalized[key] = split_refs(normalized[key])
            if "sort_order" in normalized:
                normalized["sort_order"] = int(normalized["sort_order"]) if normalized["sort_order"] else None
            loaded.append(normalized)
        result[group] = loaded
    return result


def build_reader_content(
    content_public: dict[str, list[dict[str, Any]]],
    curation_public: dict[str, list[dict[str, Any]]],
    entity_by_id: dict[str, dict[str, Any]],
    facts_by_subject: dict[str, list[dict[str, Any]]],
    relations_by_subject: dict[str, list[dict[str, Any]]],
    relations_by_object: dict[str, list[dict[str, Any]]],
    public_author_ids: set[str],
    public_work_ids: set[str],
    public_place_ids: set[str],
) -> dict[str, list[dict[str, Any]]]:
    """Create the conclusion-only projection consumed by ordinary pages."""

    def fact_value(target_id: str, *fields: str) -> str | None:
        item = next((fact for fact in facts_by_subject.get(target_id, []) if fact.get("fact_field") in fields), None)
        return str(item["value_text"]).strip() if item and item.get("value_text") else None

    def curation_text(target_id: str, field_key: str) -> str | None:
        entry = next(
            (
                item for item in curation_public.get("entries", [])
                if item.get("target_id") == target_id and item.get("field_key") == field_key
            ),
            None,
        )
        value = str(entry.get("content_zh") or "").strip() if entry else ""
        return value if value and not contains_internal_reader_language(value) else None

    def first_clean(*values: object) -> object | None:
        for value in values:
            cleaned = clean_reader_value(value)
            if cleaned not in (None, "", [], {}):
                return cleaned
        return None

    def normalized_identity(target_id: str) -> str:
        raw = fact_value(target_id, "career_note", "literary_identity") or "作家"
        raw = re.sub(r"[（(](?:来源|机构)[^）)]*[）)]", "", raw)
        raw = raw.replace("/", "、").strip(" 、；。")
        return raw or "作家"

    def publication_year(target_id: str) -> int:
        value = fact_value(target_id, "first_publication_year", "publication_year") or ""
        match = re.search(r"\d{4}", value)
        return int(match.group()) if match else 9999

    def author_lede(target_id: str, record: dict[str, Any]) -> str:
        approved = first_clean(
            wrapped_content(record, "reader_lede"),
            curation_text(target_id, "page_lede"),
            fact_value(target_id, "one_sentence_summary"),
        )
        if isinstance(approved, str):
            return approved
        item = entity_by_id[target_id]
        birth = fact_value(target_id, "birth_year")
        death = fact_value(target_id, "death_year")
        country = fact_value(target_id, "country_or_region")
        identity = normalized_identity(target_id)
        years = f"（{birth}—{death}）" if birth and death else f"（生于 {birth} 年）" if birth else ""
        prefix = f"{item['name_zh']}{years}是{country or '拉丁美洲'}{identity}。"
        works = [
            entity_by_id[relation["object_id"]]
            for relation in relations_by_subject.get(target_id, [])
            if relation.get("relation_type") == "CREATED" and relation.get("object_id") in public_work_ids
        ]
        works.sort(key=lambda work: (publication_year(work["entity_id"]), work["entity_id"]))
        titles = "、".join(work["name_zh"] for work in works[:3])
        return f"{prefix}{f'可以从{titles}开始阅读。' if titles else ''}"

    def work_intro(target_id: str, record: dict[str, Any]) -> str:
        approved = first_clean(
            wrapped_content(record, "story_intro"),
            curation_text(target_id, "one_line_summary"),
            fact_value(target_id, "story_premise", "one_sentence_summary"),
        )
        if isinstance(approved, str):
            return approved
        item = entity_by_id[target_id]
        author = next(
            (
                entity_by_id.get(relation["subject_id"])
                for relation in relations_by_object.get(target_id, [])
                if relation.get("relation_type") == "CREATED"
            ),
            None,
        )
        year = fact_value(target_id, "first_publication_year", "publication_year")
        genre = fact_value(target_id, "genre_or_form")
        if author and genre and year:
            return f"{item['name_zh']}是{author['name_zh']}创作的{genre}，出版于 {year} 年。"
        if author and year:
            return f"{item['name_zh']}由{author['name_zh']}创作，出版于 {year} 年。"
        if year:
            return f"{item['name_zh']}出版于 {year} 年。"
        return f"从{item['name_zh']}进入这位作家的作品世界。"

    reader: dict[str, list[dict[str, Any]]] = {"authors": [], "works": [], "places": []}
    public_ids = {
        "authors": public_author_ids,
        "works": public_work_ids,
        "places": public_place_ids,
    }
    for group in ("authors", "works", "places"):
        for record in content_public[group]:
            target_id = record["target_id"]
            if target_id not in public_ids[group]:
                continue
            projected: dict[str, Any] = {"target_id": target_id}
            for key, wrapper in record.items():
                if key == "target_id":
                    continue
                cleaned = clean_reader_value(wrapper.get("content"))
                if cleaned not in (None, "", [], {}):
                    projected[key] = cleaned
            if group == "authors":
                projected["reader_lede"] = author_lede(target_id, record)
            elif group == "works":
                intro = work_intro(target_id, record)
                projected["story_intro"] = intro
                projected["reading_premise"] = first_clean(
                    curation_text(target_id, "one_line_summary"), intro
                )
            reader[group].append(projected)
    return reader


def build_discovery_ranking(
    content_public: dict[str, list[dict[str, Any]]],
    reader_content: dict[str, list[dict[str, Any]]],
    facts_by_subject: dict[str, list[dict[str, Any]]],
    relations_by_subject: dict[str, list[dict[str, Any]]],
    relations_by_object: dict[str, list[dict[str, Any]]],
    public_author_ids: set[str],
    public_work_ids: set[str],
    presentation_public: dict[str, Any],
) -> dict[str, Any]:
    """Build deterministic, explainable discovery order without external metrics."""

    raw_records = {
        group: {record["target_id"]: record for record in content_public[group]}
        for group in ("authors", "works")
    }
    reader_records = {
        group: {record["target_id"]: record for record in reader_content[group]}
        for group in ("authors", "works")
    }
    path_ids = {
        target_id
        for path in presentation_public.get("reading_paths", [])
        for target_id in path.get("target_ids", [])
    }

    def source_depth(record: dict[str, Any]) -> int:
        return len({
            source_id
            for key, wrapper in record.items()
            if key != "target_id" and isinstance(wrapper, dict)
            for source_id in wrapper.get("source_refs", [])
        })

    def award_weight(target_id: str) -> int:
        awards = " ".join(
            str(item.get("value_text") or "")
            for item in facts_by_subject.get(target_id, [])
            if item.get("fact_field") in {"award", "award_year"}
        )
        if "诺贝尔文学奖" in awards:
            return 40
        if "塞万提斯" in awards or "Cervantes" in awards:
            return 30
        return 15 if awards.strip() else 0

    author_rows = []
    for target_id in public_author_ids:
        raw = raw_records["authors"].get(target_id, {"target_id": target_id})
        readable = reader_records["authors"].get(target_id, {"target_id": target_id})
        public_works = {
            relation["object_id"]
            for relation in relations_by_subject.get(target_id, [])
            if relation.get("relation_type") == "CREATED" and relation.get("object_id") in public_work_ids
        }
        factors = {
            "major_award": award_weight(target_id),
            "chinese_reader_access": min(24, len(public_works) * 4),
            "reader_content_depth": min(24, max(0, len(readable) - 1) * 3),
            "evidence_depth": min(12, source_depth(raw)),
            "reading_path": 8 if target_id in path_ids else 0,
        }
        author_rows.append({"target_id": target_id, "score": sum(factors.values()), "factors": factors})
    author_rows.sort(key=lambda item: (-item["score"], item["target_id"]))
    for rank, item in enumerate(author_rows, 1):
        item["rank"] = rank
    author_score = {item["target_id"]: item["score"] for item in author_rows}

    work_rows = []
    for target_id in public_work_ids:
        raw = raw_records["works"].get(target_id, {"target_id": target_id})
        readable = reader_records["works"].get(target_id, {"target_id": target_id})
        creators = [
            relation["subject_id"]
            for relation in relations_by_object.get(target_id, [])
            if relation.get("relation_type") == "CREATED"
        ]
        fields = {item.get("fact_field") for item in facts_by_subject.get(target_id, [])}
        completeness = 4 * sum(
            bool(fields & candidates)
            for candidates in (
                {"first_publication_year", "publication_year"},
                {"genre_or_form"},
                {"story_premise", "one_sentence_summary"},
            )
        )
        factors = {
            "author_recognition": min(24, max((author_score.get(author, 0) for author in creators), default=0) // 4),
            "reader_content_depth": min(24, max(0, len(readable) - 1) * 3),
            "bibliographic_completeness": completeness,
            "reading_guidance": 8 if any(key in readable for key in ("why_read", "reading_approach")) else 0,
            "reading_path": 12 if target_id in path_ids else 0,
            "literary_connections": min(10, len(relations_by_subject.get(target_id, [])) + len(relations_by_object.get(target_id, []))),
        }
        work_rows.append({"target_id": target_id, "score": sum(factors.values()), "factors": factors})
    work_rows.sort(key=lambda item: (-item["score"], item["target_id"]))
    for rank, item in enumerate(work_rows, 1):
        item["rank"] = rank

    return {
        "algorithm_version": DISCOVERY_RANKING_VERSION,
        "page_size": DISCOVERY_PAGE_SIZE,
        "tie_break": "target_id_ascending",
        "authors": author_rows,
        "works": work_rows,
    }


def build_data(db_path: Path, geo_dir: Path, curation_dir: Path, presentation_path: Path, public_content_path: Path, generated_at: str) -> dict[str, Any]:
    places, place_relations = load_geo(geo_dir)
    with sqlite3.connect(db_path) as conn:
        entities = rows(conn, "SELECT * FROM entities ORDER BY entity_id")
        cards = rows(conn, "SELECT * FROM content_cards ORDER BY card_id")
        facts = rows(conn, "SELECT * FROM facts ORDER BY fact_id")
        relations = rows(conn, "SELECT * FROM relationships ORDER BY relationship_id")
        sources = rows(conn, "SELECT source_id, title, author_or_editor, publisher, publication_year, source_level, canonical_url FROM sources ORDER BY source_id")
        relation_evidence = rows(conn, "SELECT relationship_id, source_id, source_title, locator, evidence_note, evidence_status FROM relationship_evidence ORDER BY evidence_id")
        fact_sources = rows(conn, "SELECT fact_id, source_id, source_title FROM fact_sources ORDER BY fact_id, source_id")
        card_facts = rows(conn, "SELECT card_id, fact_id, admission_status FROM card_facts ORDER BY card_id, fact_id")
        relation_holds = rows(conn, "SELECT * FROM relation_holds ORDER BY relation_hold_id")
        gaps = rows(conn, "SELECT * FROM gaps ORDER BY gap_id")

    entity_by_id = {entity["entity_id"]: entity for entity in entities}
    place_by_entity_id = {item["entity_id"]: item for item in places if item.get("entity_id")}
    valid_target_ids = set(entity_by_id) | {place["place_id"] for place in places}
    curation = load_curation(curation_dir, valid_target_ids)
    presentation = json.loads(presentation_path.read_text(encoding="utf-8"))
    if presentation.get("schema_version") != "v2-public-presentation-0.1":
        raise ValueError("unexpected public presentation schema")
    for group in PRESENTATION_GROUPS:
        for item in presentation.get(group, []):
            status = item.get("review_status")
            if status not in ALLOWED_CURATION_STATUSES:
                raise ValueError(f"{group} item lacks an explicit valid review_status: {item.get('id')}")
    content = json.loads(public_content_path.read_text(encoding="utf-8"))
    if content.get("schema_version") != "v2-curation-content-0.3":
        raise ValueError("unexpected public content schema")
    content_public: dict[str, list[dict[str, Any]]] = {}
    content_review_queue: dict[str, list[dict[str, Any]]] = {}
    for group in ("authors", "works", "places"):
        public_records = []
        queue_records = []
        for record in content.get(group, []):
            target_id = record.get("target_id")
            if target_id not in valid_target_ids:
                raise ValueError(f"dangling public content target: {target_id}")
            public_item = {"target_id": target_id}
            queue_item = {"target_id": target_id}
            for key, value in record.items():
                if key == "target_id":
                    continue
                if not isinstance(value, dict) or value.get("status") not in ALLOWED_CURATION_STATUSES:
                    raise ValueError(f"invalid content field {target_id}.{key}")
                (public_item if value["status"] == "auto_approved" else queue_item)[key] = value
            public_records.append(public_item)
            if len(queue_item) > 1:
                queue_records.append(queue_item)
        content_public[group] = public_records
        content_review_queue[group] = queue_records
    for path in presentation.get("reading_paths", []):
        for target_id in path.get("target_ids", []):
            if target_id not in valid_target_ids:
                raise ValueError(f"dangling public reading path target: {path.get('id')} -> {target_id}")

    cards_by_subject: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for card in cards:
        cards_by_subject[card["subject_id"]].append(card)
    facts_by_subject: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for fact in facts:
        facts_by_subject[fact["subject_id"]].append(fact)
    relations_by_subject: dict[str, list[dict[str, Any]]] = defaultdict(list)
    relations_by_object: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for relation in relations:
        relations_by_subject[relation["subject_id"]].append(relation)
        relations_by_object[relation["object_id"]].append(relation)
    evidence_by_relation: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for evidence in relation_evidence:
        evidence_by_relation[evidence["relationship_id"]].append(evidence)
    sources_by_fact: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for fact_source in fact_sources:
        sources_by_fact[fact_source["fact_id"]].append(fact_source)
    fact_ids_by_card: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for card_fact in card_facts:
        fact_ids_by_card[card_fact["card_id"]].append(card_fact)

    enriched_cards = []
    for card in cards:
        item = dict(card)
        item["facts"] = fact_ids_by_card.get(card["card_id"], [])
        enriched_cards.append(item)

    enriched_relations = []
    for relation in relations:
        item = dict(relation)
        item["evidence"] = evidence_by_relation.get(relation["relationship_id"], [])
        enriched_relations.append(item)

    enriched_facts = []
    for fact in facts:
        item = dict(fact)
        item["sources"] = sources_by_fact.get(fact["fact_id"], [])
        enriched_facts.append(item)

    curation_public = {
        group: [item for item in values if item.get("status") == "auto_approved"]
        for group, values in curation.items()
    }
    curation_review_queue = {
        group: [item for item in values if item.get("status") != "auto_approved"]
        for group, values in curation.items()
    }
    presentation_public = {
        key: value for key, value in presentation.items()
        if key not in PRESENTATION_GROUPS
    }
    presentation_review_queue: dict[str, list[dict[str, Any]]] = {}
    for group in PRESENTATION_GROUPS:
        presentation_public[group] = [item for item in presentation.get(group, []) if item.get("review_status") == "auto_approved"]
        presentation_review_queue[group] = [item for item in presentation.get(group, []) if item.get("review_status") != "auto_approved"]

    selections_by_target: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for item in curation["selections"]:
        target = item.get("target_id")
        if target:
            selections_by_target[target].append(item)
    places_for_web = []
    map_status_overrides = []
    relations_by_place: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for relation in place_relations:
        relations_by_place[relation["target_place_id"]].append(relation)
    for place in places:
        item = dict(place)
        item["curation_selections"] = selections_by_target.get(place["place_id"], [])
        map_selection = next((selection for selection in item["curation_selections"] if selection.get("selection_key") == "map_status" and selection.get("status") == "auto_approved"), None)
        if map_selection:
            if map_selection.get("selection_value") not in {"featured", "eligible", "hidden"}:
                raise ValueError(f"invalid map_status selection: {map_selection.get('curation_id')}")
            if map_selection.get("selection_value") != place["map_status"]:
                if not map_selection.get("basis_note") or not (map_selection.get("research_refs") or map_selection.get("source_refs")):
                    raise ValueError(f"unjustified map_status override: {map_selection.get('curation_id')}")
                map_status_overrides.append(
                    {
                        "place_id": place["place_id"],
                        "from_status": place["map_status"],
                        "to_status": map_selection["selection_value"],
                        "curation_id": map_selection["curation_id"],
                        "basis_note": map_selection["basis_note"],
                    }
                )
            item["map_status"] = map_selection.get("selection_value")
        item["literary_relations"] = relations_by_place.get(place["place_id"], [])
        places_for_web.append(item)

    page_entities = {
        "authors": [entity for entity in entities if entity["entity_type"] == "author"],
        "works": [entity for entity in entities if entity["entity_type"] in {"work", "collection"}],
        "places": places_for_web,
        "events": [entity for entity in entities if entity["entity_type"] == "event"],
    }

    for entity in page_entities["authors"] + page_entities["works"] + page_entities["events"]:
        entity["content_cards"] = cards_by_subject.get(entity["entity_id"], [])
        entity["facts"] = facts_by_subject.get(entity["entity_id"], [])
        entity["outgoing_relations"] = relations_by_subject.get(entity["entity_id"], [])
        entity["incoming_relations"] = relations_by_object.get(entity["entity_id"], [])

    full_author_card_ids = {card["subject_id"] for card in cards if card.get("source_minimum_status") == "meets" and card.get("card_type") == "author"}
    full_work_card_ids = {
        card["subject_id"] for card in cards
        if card.get("source_minimum_status") == "meets" and card.get("card_type") in {"work", "collection"}
    }
    # PUBLIC_CONTENT v0.3 contains two compatible editorial shapes.  The
    # original reader-facing records use why_know/core_themes and
    # story_intro/reading_approach; the B01 expansion uses the more explicitly
    # research-backed reader_lede/literary_features and
    # story_intro/narrative_features/location_note fields.  Treat either full
    # shape as publishable so a content expansion cannot silently remove the
    # already-approved baseline from search and routing.
    content_author_ids = {
        item["target_id"] for item in content_public["authors"]
        if (
            item.get("reader_lede") and item.get("literary_features")
        ) or (
            item.get("why_know") and item.get("core_themes") and item.get("start_here")
        )
    }
    content_work_ids = {
        item["target_id"] for item in content_public["works"]
        if item.get("story_intro") and (
            item.get("narrative_features") and item.get("location_note")
            or item.get("reading_approach") and item.get("theme_explanations")
        )
    }
    public_work_ids: set[str] = set()
    for entity in page_entities["works"]:
        target_id = entity["entity_id"]
        if target_id not in full_work_card_ids or target_id not in content_work_ids:
            continue
        if relations_by_object[target_id]:
            public_work_ids.add(target_id)
    public_author_ids = {
        entity["entity_id"] for entity in page_entities["authors"]
        if entity["entity_id"] in full_author_card_ids
        and entity["entity_id"] in content_author_ids
        and sum(relation["relation_type"] == "CREATED" for relation in relations_by_subject[entity["entity_id"]]) >= 2
    }
    public_place_ids = {
        item["place_id"] for item in places_for_web
        if item["map_status"] != "hidden" and item["reality_status"] != "unknown"
        and (item["place_kind"] == "country" or bool(item["literary_relations"]))
    }
    public_node_ids = {
        entity["entity_id"] for entity in entities
        if entity["entity_type"] in {"theme", "movement"}
        and (relations_by_subject.get(entity["entity_id"]) or relations_by_object.get(entity["entity_id"]))
    }
    public_page_ids = public_author_ids | public_work_ids | public_place_ids | public_node_ids

    reader_content = build_reader_content(
        content_public,
        curation_public,
        entity_by_id,
        facts_by_subject,
        relations_by_subject,
        relations_by_object,
        public_author_ids,
        public_work_ids,
        public_place_ids,
    )
    presentation_public["discovery"] = build_discovery_ranking(
        content_public,
        reader_content,
        facts_by_subject,
        relations_by_subject,
        relations_by_object,
        public_author_ids,
        public_work_ids,
        presentation_public,
    )

    search_index = []
    graph_neighbors: dict[str, set[str]] = defaultdict(set)
    for relation in relations:
        graph_neighbors[relation["subject_id"]].add(relation["object_id"])
        graph_neighbors[relation["object_id"]].add(relation["subject_id"])
    for relation in place_relations:
        graph_neighbors[relation["source_entity_id"]].add(relation["target_place_id"])
        graph_neighbors[relation["target_place_id"]].add(relation["source_entity_id"])
    for entity in entities:
        if entity["entity_id"] not in public_page_ids:
            continue
        cards_for_entity = cards_by_subject.get(entity["entity_id"], [])
        card_titles = [card["title_zh"] for card in cards_for_entity if card.get("title_zh")]
        card_context = [value for card in cards_for_entity for value in (card.get("country_or_region"), card.get("period_bucket")) if value]
        mapped_place = place_by_entity_id.get(entity["entity_id"])
        if mapped_place:
            target_type = "country" if mapped_place["place_kind"] == "country" else "fictional_space" if mapped_place["reality_status"] == "fictional" else "place"
        else:
            target_type = entity["entity_type"]
        search_index.append(
            {
                "target_id": entity["entity_id"],
                "target_type": target_type,
                "name_zh": entity["name_zh"],
                "original_name": entity["original_name"],
                "search_text": " ".join(filter(None, [entity["name_zh"], entity["original_name"], *card_titles, *card_context])),
                "related_ids": sorted(graph_neighbors[entity["entity_id"]] & public_page_ids),
                "public_route": public_route(target_type, entity["entity_id"], entity.get("original_name")),
            }
        )
    for place in places_for_web:
        if place["place_id"] not in entity_by_id and place["place_id"] in public_page_ids:
            if place["source_kind"] == "technical_parent_node" and place["map_status"] == "hidden":
                continue
            search_index.append(
                {
                    "target_id": place["place_id"],
                    "target_type": "country" if place["place_kind"] == "country" else "place",
                    "name_zh": place["name_zh"],
                    "original_name": place["original_name"],
                    "search_text": " ".join(filter(None, [place["name_zh"], place["original_name"]])),
                    "related_ids": sorted(graph_neighbors[place["place_id"]] & public_page_ids),
                    "public_route": public_route("country" if place["place_kind"] == "country" else "place", place["place_id"], place.get("original_name")),
                }
            )

    timeline_nodes = []
    for author in page_entities["authors"]:
        author_cards = cards_by_subject.get(author["entity_id"], [])
        card = author_cards[0] if author_cards else None
        if not card or card.get("source_minimum_status") != "meets":
            continue
        timeline_nodes.append(
            {
                "node_type": "literary_author",
                "entity": author,
                "facts": facts_by_subject.get(author["entity_id"], []),
                "period_bucket": card.get("period_bucket"),
                "year_label": card.get("period_bucket") or "待核查",
                "status": "card_period_only",
            }
        )
    for work in page_entities["works"]:
        work_facts = facts_by_subject.get(work["entity_id"], [])
        year_fact = next((fact for fact in work_facts if fact["fact_field"] in {"first_publication_year", "publication_year"}), None)
        card = cards_by_subject.get(work["entity_id"], [None])[0]
        timeline_nodes.append(
            {
                "node_type": "literary_work",
                "entity": work,
                "facts": work_facts,
                "period_bucket": card.get("period_bucket") if card else None,
                "year_label": year_fact["value_text"] if year_fact else (card.get("period_bucket") if card else "待核查"),
                "status": year_fact["admission_status"] if year_fact else "card_period_only",
            }
        )
    for event in page_entities["events"]:
        event_facts = facts_by_subject.get(event["entity_id"], [])
        year_fact = next((fact for fact in event_facts if fact["fact_field"] == "event_year_range"), None)
        timeline_nodes.append(
            {
                "node_type": "historical_background",
                "entity": event,
                "facts": event_facts,
                "period_bucket": None,
                "year_label": year_fact["value_text"] if year_fact else "待核查",
                "status": year_fact["admission_status"] if year_fact else "entity_only",
            }
        )

    def timeline_sort_key(item: dict[str, Any]) -> tuple[int, str]:
        label = str(item.get("year_label") or "")
        digits = "".join(character for character in label[:4] if character.isdigit())
        return (int(digits) if len(digits) == 4 else 9999, item["entity"]["entity_id"])

    timeline_nodes.sort(key=timeline_sort_key)

    return {
        "product_version": PRODUCT_VERSION,
        "schema_version": SCHEMA_VERSION,
        "generated_at": generated_at,
        "data_sources": {
            "research_database": str(db_path.relative_to(ROOT)),
            "geo_data": str(geo_dir.relative_to(ROOT)),
            "curation_data": str(curation_dir.relative_to(ROOT)),
        },
        "counts": {
            "entities": len(entities),
            "content_cards": len(cards),
            "facts": len(facts),
            "relationships": len(relations),
            "relation_holds": len(relation_holds),
            "gaps": len(gaps),
            "sources": len(sources),
            "places": len(places),
            "place_relations": len(place_relations),
            "curation_entries": len(curation["entries"]),
            "curation_selections": len(curation["selections"]),
            "curation_recommendations": len(curation["recommendations"]),
        },
        "research": {
            "entities": entities,
            "content_cards": enriched_cards,
            "facts": enriched_facts,
            "relationships": enriched_relations,
            "sources": sources,
            "relation_holds": relation_holds,
            "gaps": gaps,
        },
        "curation": curation_public,
        "review_queue": curation_review_queue,
        "public_content": content_public,
        "public_content_review_queue": content_review_queue,
        "reader_content": reader_content,
        "presentation": presentation_public,
        "presentation_review_queue": presentation_review_queue,
        "public_scope": {
            "authors": sorted(public_author_ids),
            "works": sorted(public_work_ids),
            "places": sorted(public_place_ids),
            "nodes": sorted(public_node_ids),
        },
        "pages": page_entities,
        "map": {"places": places_for_web, "relations": place_relations},
        "qa": {"map_status_overrides": map_status_overrides},
        "search_index": search_index,
        "timeline": timeline_nodes,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--db", type=Path, default=DEFAULT_DB)
    parser.add_argument("--geo-dir", type=Path, default=DEFAULT_GEO)
    parser.add_argument("--curation-dir", type=Path, default=DEFAULT_CURATION)
    parser.add_argument("--presentation", type=Path, default=DEFAULT_PRESENTATION)
    parser.add_argument("--public-content", type=Path, default=DEFAULT_PUBLIC_CONTENT)
    parser.add_argument("--output-dir", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--generated-at", default=None)
    args = parser.parse_args()
    generated_at = args.generated_at or datetime.now(timezone.utc).isoformat(timespec="seconds")
    payload = build_data(args.db, args.geo_dir, args.curation_dir, args.presentation, args.public_content, generated_at)
    args.output_dir.mkdir(parents=True, exist_ok=True)
    output_path = args.output_dir / "site_data.json"
    output_path.write_text(json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    manifest = {
        "product_version": PRODUCT_VERSION,
        "schema_version": SCHEMA_VERSION,
        "generated_at": generated_at,
        "entrypoint": "site_data.json",
        "counts": payload["counts"],
        "public_curation_status": "auto_approved_only",
        "review_queue_separate": True,
    }
    (args.output_dir / "manifest.json").write_text(json.dumps(manifest, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(manifest, ensure_ascii=False, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
