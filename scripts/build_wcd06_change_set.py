#!/usr/bin/env python3
"""Build the deterministic WCD-06 curation patch and audit packages."""

from __future__ import annotations

import csv
import hashlib
import importlib.util
import json
import sqlite3
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "data/changesets/WCD-06"
PATCH = OUT / "curation/PUBLIC_CONTENT_PATCH.json"
TRIAGE = ROOT / "work/external-ai/V2-WCD-EXTERNAL-RESEARCH-PACK/05_WCD06_REVIEW_TRIAGE/WCD06_USER_REVIEW_TRIAGE.csv"
ROUTING = ROOT / "project/audits/web/WCD_04_DESCRIPTION_ROUTING.csv"
DATE = "2026-08-31"

AUTHOR_REWRITES = {
    "V1-ENT-0170": "米格尔·安赫尔·阿斯图里亚斯（1899—1974）是危地马拉作家、小说家。他的创作时间线从《危地马拉传说》（1930）延伸到《总统先生》（1946）与《玉米人》（1949）。",
    "V1-ENT-0171": "伊莎贝尔·阿连德 1942 年生于秘鲁利马，是智利作家。《幽灵之家》（1982）、《爱情与阴影》（1984）与《伊娃·露娜》（1987）构成这里可循的早期创作线索。",
    "V1-ENT-0184": "胡安·卡洛斯·奥内蒂（1909—1994）是生于蒙得维的亚的乌拉圭作家。《短暂的生命》（1950）、《告别》（1954）与《造船厂》（1961）呈现了他的小说创作序列。",
    "V1-ENT-0186": "埃内斯托·萨瓦托（1911—2011）是阿根廷作家、画家，受过物理学训练并曾任教。他生于布宜诺斯艾利斯省罗哈斯，著有《隧道》《英雄与坟墓》和《毁灭者亚巴顿》。",
    "V1-ENT-0198": "阿道夫·比奥伊·卡萨雷斯（1914—1999）是生于布宜诺斯艾利斯的阿根廷小说家、短篇作家。《莫雷尔的发明》首版年份在来源间记为 1940 或 1941，另有《逃亡计划》和《英雄的梦》。",
    "V1-ENT-0199": "奥古斯托·罗亚·巴斯托斯（1917—2005）是生于亚松森的巴拉圭作家、记者和剧作家。他的小说包括《人子》（1960）、《我，最高统帅》（1974）与《检察官》（1993）。",
    "V1-ENT-0200": "奥拉西奥·基罗加（1878—1937）是生于萨尔托的乌拉圭作家。《爱情、疯狂和死亡的故事》《丛林故事》与《流放者》是这里收录的三部短篇小说集。",
    "V1-ENT-0211": "马查多·德·阿西斯（1839—1908）是生于里约热内卢的巴西作家，兼写小说、诗歌与戏剧。《布拉斯·库巴斯死后的回忆》《金卡斯·博尔巴》和《堂卡斯穆罗》依次出版于 1881、1891 与 1899 年。",
    "V1-ENT-0212": "若昂·吉马朗埃斯·罗萨（1908—1967）是生于米纳斯吉拉斯州科尔迪斯堡的巴西作家。他的作品形态横跨短篇集《萨加拉纳》《第一故事》与长篇小说《广阔腹地：条条小径》。",
}

AUTHOR_REFS = {
    "V1-ENT-0170": ("V1-FCT-0355;V1-FCT-0356;V1-FCT-0357;V1-FCT-0359;V1-REL-0103;V1-REL-0104;V1-REL-0105;V1-REL-0112;V1-FCT-0361;V1-FCT-0364;V1-FCT-0367", "SRC-0130"),
    "V1-ENT-0171": ("V1-FCT-0369;V1-FCT-0370;V1-FCT-0371;V1-REL-0106;V1-REL-0107;V1-REL-0108;V1-REL-0113;V1-REL-0296;V1-FCT-0374;V1-FCT-0377;V1-FCT-0380", "SRC-0133;SRC-0134;SRC-0135;SRC-0136;SRC-0137"),
    "V1-ENT-0184": ("V1-FCT-0396;V1-FCT-0397;V1-FCT-0398;V1-FCT-0399;V1-FCT-0400;V1-REL-0115;V1-REL-0116;V1-REL-0117;V1-REL-0124;V1-REL-0302;V1-FCT-0402;V1-FCT-0405;V1-FCT-0408", "SRC-0141;SRC-0142;SRC-0143"),
    "V1-ENT-0186": ("V1-FCT-0423;V1-FCT-0424;V1-FCT-0425;V1-FCT-0426;V1-FCT-0427;V1-REL-0121;V1-REL-0122;V1-REL-0123;V1-REL-0126;V1-FCT-0429;V1-FCT-0432;V1-FCT-0435", "SRC-0148;SRC-0149;SRC-0150"),
    "V1-ENT-0198": ("V1-FCT-0437;V1-FCT-0438;V1-FCT-0439;V1-FCT-0440;V1-FCT-0441;V1-REL-0128;V1-REL-0129;V1-REL-0130;V1-REL-0137;V1-REL-0300;V1-FCT-0446;V1-FCT-0449", "SRC-0153;SRC-0154;SRC-0155"),
    "V1-ENT-0199": ("V1-FCT-0451;V1-FCT-0452;V1-FCT-0453;V1-FCT-0454;V1-FCT-0455;V1-REL-0131;V1-REL-0132;V1-REL-0133;V1-REL-0138;V1-FCT-0457;V1-FCT-0460;V1-FCT-0463", "SRC-0157;SRC-0158;SRC-0159;SRC-0160;SRC-0161"),
    "V1-ENT-0200": ("V1-FCT-0465;V1-FCT-0466;V1-FCT-0467;V1-FCT-0468;V1-FCT-0469;V1-REL-0134;V1-REL-0135;V1-REL-0136;V1-REL-0139;V1-FCT-0471;V1-FCT-0474;V1-FCT-0477", "SRC-0162;SRC-0163"),
    "V1-ENT-0211": ("V1-FCT-0479;V1-FCT-0480;V1-FCT-0481;V1-FCT-0482;V1-FCT-0483;V1-REL-0140;V1-REL-0141;V1-REL-0142;V1-REL-0149;V1-REL-0299;V1-FCT-0485;V1-FCT-0488;V1-FCT-0491", "SRC-0165;SRC-0166"),
    "V1-ENT-0212": ("V1-FCT-0493;V1-FCT-0494;V1-FCT-0495;V1-FCT-0496;V1-FCT-0497;V1-REL-0143;V1-REL-0144;V1-REL-0145;V1-REL-0150;V1-FCT-0499;V1-FCT-0502;V1-FCT-0505", "SRC-0168;SRC-0169"),
}

LOCATION_PROMOTIONS = {
    "V1-ENT-0017", "V1-ENT-0018", "V1-ENT-0032", "V1-ENT-0035",
    "V1-ENT-0038", "V1-ENT-0075", "V1-ENT-0076", "V1-ENT-0077",
    "V1-ENT-0079", "V1-ENT-0081", "V1-ENT-0117", "V1-ENT-0118",
}

LOCATION_REWRITES = {
    "V1-ENT-0018": "故事发生在里约热内卢；玛卡贝娅是一名生活困窘的打字员，城市构成她日常生活的主要空间。",
    "V1-ENT-0035": "故事发生在恰帕斯村镇，白人世界与 chontal 印第安世界的张力在这里展开。",
    "V1-ENT-0075": "马孔多是小说创造的虚构城镇，布恩迪亚—伊瓜兰家族在这里延续数代；不使用现实坐标。",
    "V1-ENT-0077": "故事发生在未具名小镇；叙述者二十多年后重返此地调查圣地亚哥·纳萨尔之死，因此不指定现实坐标。",
}

WORK_REWRITES: dict[str, tuple[str, str, str]] = {}

NEW_WORKS = {
    "V1-ENT-0019": {
        "story_intro": ("《家庭纽带》（1960）是一部由 13 篇作品组成的短篇集，从城市与家庭场景切入人物的内心生活、家庭关系、沉默、姿态与突然显露的时刻。", "V1-FCT-0042;V1-FCT-0043;V1-FCT-0044;V1-FCT-0045;V1-REL-0007", "SRC-0009"),
        "narrative_features": (["以城市与家庭日常作为人物内心生活的入口", "围绕沉默、姿态与关系中的揭示时刻展开"], "V1-FCT-0045", "SRC-0009"),
        "location_note": ("空间集中在城市与家庭场景；现有资料未提供可稳定映射到单一坐标的作品地点。", "V1-FCT-0045", "SRC-0009"),
    },
    "V1-ENT-0146": {
        "story_intro": ("《最明净的地区》（1958）以多个人物和社会阶层的声音拼合二十世纪中叶的墨西哥城，在城市日常中追问革命后的社会结构与身份。", "V1-FCT-0264;V1-FCT-0265;V1-FCT-0266;V1-REL-0077", "SRC-0087;SRC-0088"),
        "narrative_features": (["多重人物声音并置", "以社会群像构成不断移动的墨西哥城图景"], "V1-FCT-0268", "SRC-0087;SRC-0088"),
        "location_note": ("故事空间明确落在墨西哥城，城市日常与不同社会阶层共同构成作品的叙事场域。", "V1-FCT-0266;V1-FCT-0267", "SRC-0087;SRC-0088"),
    },
}


def split_refs(value: str) -> list[str]:
    return [item for item in value.split(";") if item]


def wrapped(content: object, research: str, sources: str, basis: str) -> dict[str, object]:
    return {
        "content": content,
        "status": "auto_approved",
        "research_refs": split_refs(research),
        "source_refs": split_refs(sources),
        "basis_note": basis,
        "reviewer": "CODEX-REVIEW",
        "created_at": DATE,
        "reviewed_at": DATE,
    }


def load_builder():
    spec = importlib.util.spec_from_file_location("build_v2_public_content", ROOT / "scripts/build_v2_public_content.py")
    module = importlib.util.module_from_spec(spec)
    assert spec.loader
    spec.loader.exec_module(module)
    return module


def write_csv(path: Path, rows: list[dict[str, object]], fields: list[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def index_content(payload: dict[str, object]) -> dict[str, tuple[str, dict[str, object]]]:
    return {item["target_id"]: (group, item) for group in ("authors", "works", "places") for item in payload[group]}


def build_patch(baseline: dict[str, object]) -> dict[str, object]:
    idx = index_content(baseline)
    author_overrides = []
    for target_id, content in AUTHOR_REWRITES.items():
        research, sources = AUTHOR_REFS[target_id]
        author_overrides.append({"target_id": target_id, "reader_lede": wrapped(content, research, sources, "WCD-06 事实边界内的作者导语改写；独立复核轨迹见 review 目录")})
    work_overrides = []
    for target_id in sorted(LOCATION_PROMOTIONS):
        original = idx[target_id][1]["location_note"]
        promoted = dict(original)
        promoted["content"] = LOCATION_REWRITES.get(target_id, original["content"])
        promoted.update(status="auto_approved", basis_note="WCD-06 低判断地点说明逐项核证；未扩张地图关系", reviewer="CODEX-REVIEW", reviewed_at=DATE)
        work_overrides.append({"target_id": target_id, "location_note": promoted})
    for target_id, (content, research, sources) in WORK_REWRITES.items():
        work_overrides.append({"target_id": target_id, "story_intro": wrapped(content, research, sources, "WCD-06 对象级描述改写；未引入来源范围外情节")})
    additions = []
    for target_id, fields in NEW_WORKS.items():
        record = {"target_id": target_id}
        for field, (content, research, sources) in fields.items():
            record[field] = wrapped(content, research, sources, "WCD-06 核心零内容对象最小描述补齐；仅使用已准入对象级素材")
        additions.append(record)
    return {
        "schema_version": "v2-curation-content-patch-0.1",
        "change_set": "WCD-06",
        "overrides": {"authors": author_overrides, "works": work_overrides, "places": []},
        "additions": {"authors": [], "works": additions, "places": []},
    }


def page_class(group: str, record: dict[str, object]) -> str:
    wrappers = [value for key, value in record.items() if key != "target_id" and isinstance(value, dict) and value.get("status")]
    states = Counter(value["status"] for value in wrappers)
    primary = "reader_lede" if group == "authors" else "story_intro"
    text = str(record.get(primary, {}).get("content", ""))
    if not wrappers:
        return "MISSING"
    if states["hold"]:
        return "HOLD"
    if any(token in text for token in ("目录列出", "书目", "本批只公开", "按书目事实")):
        return "BIBLIOGRAPHIC_COPY"
    if states["auto_approved"] == len(wrappers):
        return "PUBLIC"
    if states["user_review"]:
        return "REVIEW"
    return "RESEARCH_INSUFFICIENT"


def main() -> int:
    OUT.mkdir(parents=True, exist_ok=True)
    builder = load_builder()
    baseline = builder.build(apply_wcd06=False)
    baseline_idx = index_content(baseline)
    patch = build_patch(baseline)
    PATCH.parent.mkdir(parents=True, exist_ok=True)
    PATCH.write_text(json.dumps(patch, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

    con = sqlite3.connect(ROOT / "data/master/V1_MASTER.sqlite")
    con.row_factory = sqlite3.Row
    names = {row["entity_id"]: row["name_zh"] for row in con.execute("select entity_id,name_zh from entities")}
    routing = list(csv.DictReader(ROUTING.open(encoding="utf-8-sig")))
    route_idx = {row["entity_id"]: row for row in routing}
    matrix = []
    for group in ("authors", "works"):
        for record in baseline[group]:
            route = route_idx[record["target_id"]]
            states = Counter(value.get("status") for key, value in record.items() if key != "target_id" and isinstance(value, dict))
            matrix.append({
                "target_id": record["target_id"], "target_type": group[:-1], "name_zh": names.get(record["target_id"], ""),
                "classification": route["classification"], "primary_field": route["primary_field"], "primary_status": route["primary_status"],
                "public_visible": "yes" if route["classification"].startswith("PUBLIC_") else "no",
                "template_like": "yes" if route["classification"] == "PUBLIC_BIBLIOGRAPHIC_COPY" else "no",
                "bibliographic_copy": "yes" if route["classification"] == "PUBLIC_BIBLIOGRAPHIC_COPY" else "no",
                "research_insufficient": "yes" if route["classification"] == "RESEARCH_INSUFFICIENT" else "no",
                "duplicate": "no", "auto_approved_fields": states["auto_approved"],
                "user_review_fields": states["user_review"], "hold_fields": states["hold"],
                "missing_required_fields": route["missing_required_fields"], "baseline_commit": "f47ab5793101f85437a793ab45cd0e241ad6cc73",
            })
    write_csv(OUT / "WCD06_CURRENT_DESCRIPTION_MATRIX.csv", matrix, list(matrix[0]))

    triage = list(csv.DictReader(TRIAGE.open(encoding="utf-8-sig")))
    rebase = []
    high_fields = {"signature_keywords", "why_read", "theme_explanations", "literary_intro", "literary_significance"}
    for row in triage:
        target_id, field = row["target_id"], row["field"]
        current = baseline_idx.get(target_id, ("", {}))[1].get(field, {})
        classification = row["classification"]
        if classification == "DUPLICATE_OR_REDUNDANT":
            status, reason = "DUPLICATE", "external duplicate classification retained"
        elif row["target_type"] == "place":
            status, reason = "OUT_OF_SCOPE", "WCD-06 author/work scope"
        elif classification == "LOW_JUDGMENT_EVIDENCE_SUFFICIENT" and field in high_fields:
            status, reason = "CONFLICT_WITH_CURRENT_CURATION", "field is high judgment under current validator"
        elif classification == "LOW_JUDGMENT_EVIDENCE_SUFFICIENT" and field == "story_intro":
            status, reason = "CONFLICT_WITH_WCD04_ROUTING", "page-level route identifies bibliographic copy; rewrite required"
        elif classification == "LOW_JUDGMENT_EVIDENCE_SUFFICIENT" and field == "location_note" and target_id not in LOCATION_PROMOTIONS:
            status, reason = "NEEDS_REVIEW", "negative/meta copy is not promoted as reader description"
        elif current and current.get("status") != row["current_status"]:
            status, reason = "CHANGED", "current status differs from external snapshot"
        else:
            status, reason = "STILL_VALID", "candidate remains useful after current-main rebase"
        rebase.append({**row, "wcd04_classification": route_idx.get(target_id, {}).get("classification", ""), "rebase_status": status, "rebase_reason": reason})
    write_csv(OUT / "EXTERNAL_WCD06_REBASE.csv", rebase, list(rebase[0]))

    low_rows = []
    for row in triage:
        if row["classification"] != "LOW_JUDGMENT_EVIDENCE_SUFFICIENT":
            continue
        if row["target_type"] == "place": decision = "OUT_OF_SCOPE"
        elif row["field"] == "location_note" and row["target_id"] in LOCATION_PROMOTIONS: decision = "PROMOTE"
        elif row["field"] == "story_intro": decision = "REWRITE_OR_RESEARCH"
        else: decision = "KEEP_USER_REVIEW_HIGH_JUDGMENT"
        low_rows.append({**row, "wcd06_decision": decision, "decision_basis": "current governance plus WCD-04 page route"})
    write_csv(OUT / "CS01_LOW_JUDGMENT_REVIEW.csv", low_rows, list(low_rows[0]))

    biblio = []
    rewritten = set(AUTHOR_REWRITES) | set(WORK_REWRITES)
    for row in routing:
        if row["classification"] != "PUBLIC_BIBLIOGRAPHIC_COPY": continue
        biblio.append({**row, "wcd06_decision": "REWRITE" if row["entity_id"] in rewritten else "RESEARCH_GAP", "replacement_field": "reader_lede" if row["entity_type"] == "author" else "story_intro"})
    write_csv(OUT / "CS02_BIBLIOGRAPHIC_REWRITES.csv", biblio, list(biblio[0]))

    missing = []
    for row in routing:
        if row["classification"] != "MISSING": continue
        missing.append({**row, "wcd06_decision": "ADD_MINIMUM_CONTENT" if row["entity_id"] in NEW_WORKS else "RESEARCH_GAP", "added_fields": "story_intro;narrative_features;location_note" if row["entity_id"] in NEW_WORKS else ""})
    write_csv(OUT / "CS03_MISSING_MINIMUM_CONTENT.csv", missing, list(missing[0]))

    profiles = []
    for target_id in AUTHOR_REWRITES:
        profiles.append({"target_id": target_id, "name_zh": names[target_id], "field": "reader_lede", "decision": "REWRITE", "judgment": "low_factual", "research_refs": AUTHOR_REFS[target_id][0], "source_refs": AUTHOR_REFS[target_id][1]})
        profiles.append({"target_id": target_id, "name_zh": names[target_id], "field": "literary_connections", "decision": "RESEARCH_GAP", "judgment": "high", "research_refs": "", "source_refs": ""})
    write_csv(OUT / "CS04_AUTHOR_PROFILE_ENRICHMENT.csv", profiles, list(profiles[0]))

    gaps = []
    for row in biblio:
        if row["wcd06_decision"] == "RESEARCH_GAP": gaps.append({"target_id": row["entity_id"], "target_type": row["entity_type"], "name_zh": row["display_name"], "field": row["primary_field"], "gap_type": "OBJECT_LEVEL_DESCRIPTION", "needed_evidence": "story premise, narrative feature or theme from at least two suitable sources", "handoff": "WCD-07_RESEARCH_INPUT"})
    for row in missing:
        if row["wcd06_decision"] == "RESEARCH_GAP": gaps.append({"target_id": row["entity_id"], "target_type": row["entity_type"], "name_zh": row["display_name"], "field": row["primary_field"], "gap_type": "MISSING_MINIMUM_CONTENT", "needed_evidence": "object-specific descriptive fact beyond bibliography", "handoff": "WCD-07_RESEARCH_INPUT"})
    for target_id in AUTHOR_REWRITES:
        gaps.append({"target_id": target_id, "target_type": "author", "name_zh": names[target_id], "field": "literary_connections", "gap_type": "HIGH_JUDGMENT_CONNECTION", "needed_evidence": "explicit accepted movement, influence or comparison evidence", "handoff": "WCD-07_RESEARCH_INPUT"})
    write_csv(OUT / "WCD06_RESEARCH_GAPS.csv", gaps, list(gaps[0]))

    status_counts = Counter(value.get("status") for group in ("authors", "works") for record in baseline[group] for key, value in record.items() if key != "target_id" and isinstance(value, dict))
    class_counts = Counter(row["classification"] for row in matrix)
    rebase_counts = Counter(row["rebase_status"] for row in rebase)
    preflight = f"""# WCD-06 Preflight\n\n- Baseline: `main@f47ab5793101f85437a793ab45cd0e241ad6cc73`\n- Scope: 61 authors and 168 curated works; external packages read only.\n- Field statuses: auto_approved={status_counts['auto_approved']}, user_review={status_counts['user_review']}, hold={status_counts['hold']}.\n- Current page classifications: {dict(sorted(class_counts.items()))}.\n- WCD-04 routing baseline: {dict(sorted(Counter(row['classification'] for row in routing).items()))}.\n- External field-level baseline: {dict(sorted(Counter(row['classification'] for row in triage).items()))}.\n- External rebase verdicts: {dict(sorted(rebase_counts.items()))}.\n\n## Reconciliation\n\nThe external 74 low-judgment rows are field-level candidates, while WCD-04's five low-judgment rows are page-level routes and all five are places. Current governance classifies signature keywords, why-read, themes, literary introductions and literary significance as high judgment. Therefore only 12 directly evidenced work location notes are promoted without rewriting; nine bibliographic story introductions require rewrite or research.\n"""
    (OUT / "PREFLIGHT.md").write_text(preflight, encoding="utf-8")
    review_dir = OUT / "review"
    review_dir.mkdir(exist_ok=True)
    (review_dir / "REVIEW_REQUEST.md").write_text("# CODEX-REVIEW-WCD06\n\nFresh-context review target: patch, CS01-CS04, research gaps, rebuilt public content, audit, and validation evidence. Reviewer may return only PASS, REVISE, or REJECT and must not draft prose.\n", encoding="utf-8")
    external_rows = []
    for directory in (
        ROOT / "work/external-ai/V2-WCD-EXTERNAL-RESEARCH-PACK",
        ROOT / "work/external-ai/V2-WCD-GLOBAL-GAP-AUDIT",
    ):
        for path in sorted(item for item in directory.rglob("*") if item.is_file()):
            external_rows.append({
                "path": path.relative_to(ROOT).as_posix(),
                "size_bytes": path.stat().st_size,
                "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
            })
    write_csv(OUT / "EXTERNAL_READONLY_SHA256.csv", external_rows, ["path", "size_bytes", "sha256"])
    print(json.dumps({"patch": str(PATCH), "matrix": len(matrix), "rebase": len(rebase), "gaps": len(gaps)}, ensure_ascii=False))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
