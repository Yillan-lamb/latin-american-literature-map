#!/usr/bin/env python3
"""WCD-08 USER_REVIEW 本地预览构建器。

把候选趣闻（全部默认 user_review）注入 site_data 副本并输出到本地预览目录，
供 USER 在浏览器中查看作者页“作家的另一面”板块候选效果。

边界（DEC-054）：
- 输出目录默认 `work/wcd08/preview/`（gitignored），绝不写入 `data/`、`dist/`；
- 主构建 `build_v2_web_data.py` 与公开 bundle 不读取本脚本输出；
- 预览页顶部固定 REVIEW 横幅，明确标注非公开。
"""
from __future__ import annotations

import argparse
import json
import shutil
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
DEFAULT_CANDIDATES = REPO / "work/wcd08/WCD08_ANECDOTE_CANDIDATES.json"
DEFAULT_SOURCES = REPO / "work/wcd08/WCD08_SOURCES.json"
DEFAULT_OUT = REPO / "work/wcd08/preview"
BANNER_TEXT = "WCD-08 USER_REVIEW 预览（非公开包）：以下“作家的另一面”板块内容尚未经 USER 批准，禁止用于正式站点。"

TYPE_ZH = {
    "work_genesis": "作品诞生", "writing_habit": "写作习惯", "reading_influence": "阅读影响",
    "friendship": "作家交往", "literary_rivalry": "作家冲突", "publishing": "出版传播",
    "career": "职业经历", "travel_exile": "旅行流亡", "family_background": "家庭出身",
    "love_relationship": "感情婚姻", "humor_personality": "性格幽默", "political_life": "政治人生",
    "accident_turning_point": "意外转折", "public_life": "公共生活",
}


def type_label(types: str) -> str:
    parts = [p for p in types.split("/") if p]
    return TYPE_ZH.get(parts[0], parts[0]) if parts else "人物故事"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--candidates", type=Path, default=DEFAULT_CANDIDATES)
    parser.add_argument("--sources", type=Path, default=DEFAULT_SOURCES)
    parser.add_argument("--out", type=Path, default=DEFAULT_OUT)
    args = parser.parse_args()

    candidates_doc = json.loads(args.candidates.read_text(encoding="utf-8"))
    sources_doc = json.loads(args.sources.read_text(encoding="utf-8"))
    src_index = {s["source_id"]: s for s in sources_doc.get("sources", [])}

    site_data = json.loads((REPO / "data/v2/web/site_data.json").read_text(encoding="utf-8"))
    public_authors = {a["target_id"] for a in site_data.get("reader_content", {}).get("authors", [])}

    by_author: dict[str, list[dict]] = {}
    for c in candidates_doc.get("candidates", []):
        if c.get("status") not in {"user_review", "hold"}:
            continue
        if c.get("author_id") not in public_authors:
            continue  # 非公开范围作者的候选不进入预览
        src_parts = []
        for sid in c.get("source_refs", []):
            s = src_index.get(sid, {})
            grade = s.get("source_grade", "?")
            title = s.get("title", sid)
            src_parts.append(f"{title}（{grade} 级）")
        by_author.setdefault(c["author_id"], []).append(
            {
                "anecdote_id": c["candidate_anecdote_id"],
                "title": c["title_zh"],
                "teaser": c["teaser_zh"],
                "story": c["story_zh"],
                "time_label": c.get("time_label") or "",
                "location_label": c.get("location_label") or "",
                "type_label": type_label(c.get("anecdote_type") or ""),
                "sources_label": "；".join(src_parts),
                "status": c.get("status"),
                "risk_level": c.get("risk_level"),
                "hold_reason": c.get("hold_reason") or "",
                "preview_mode": True,
            }
        )

    projected = 0
    for record in site_data.get("reader_content", {}).get("authors", []):
        items = by_author.get(record.get("target_id", ""), [])
        if items:
            record["anecdotes"] = items
            projected += len(items)

    out: Path = args.out
    if out.exists():
        shutil.rmtree(out)
    out.mkdir(parents=True)
    data_dir = out / "data/v2/web"
    data_dir.mkdir(parents=True)
    (data_dir / "site_data.json").write_text(
        json.dumps(site_data, ensure_ascii=False, indent=1), encoding="utf-8"
    )

    site_dir = REPO / "site"
    for name in ("app.js", "styles.css"):
        shutil.copy2(site_dir / name, out / name)
    assets_src = site_dir / "assets"
    if assets_src.exists():
        shutil.copytree(assets_src, out / "assets", dirs_exist_ok=True)
    banner = (
        f'<div data-review-preview-banner role="alert" style="position:sticky;top:0;z-index:99;'
        f'background:#96342b;color:#fffdf8;padding:10px 18px;font-size:13px;">{BANNER_TEXT}</div>'
    )
    base_html = (site_dir / "index.html").read_text(encoding="utf-8")
    (out / "index.html").write_text(base_html.replace("<body>", f"<body>{banner}", 1), encoding="utf-8")

    def author_page(target_id: str, name: str) -> str:
        return (
            base_html
            .replace('<body>', f'<body data-route-kind="author" data-route-id="{target_id}">{banner}', 1)
            .replace('src="./app.js"', 'src="../../app.js"')
            .replace('href="./styles.css"', 'href="../../styles.css"')
        )

    authors_dir = out / "authors"
    for target_id in by_author:
        page_dir = authors_dir / target_id
        page_dir.mkdir(parents=True, exist_ok=True)
        (page_dir / "index.html").write_text(author_page(target_id, target_id), encoding="utf-8")

    readme = [
        "# WCD-08 USER_REVIEW 预览",
        "",
        f"- 生成时间基准：main 基线 site_data.json + 候选池 {args.candidates.name}",
        f"- 预览候选：{projected} 条（仅公开范围作者、status=user_review/hold）",
        "- 边界：本目录为本地非公开预览；不进入 data/、dist/、公开 bundle。",
        "- 查看方式：`python3 -m http.server 4174 -d work/wcd08/preview` 后访问 http://127.0.0.1:4174/",
        "",
    ]
    (out / "README.md").write_text("\n".join(readme), encoding="utf-8")
    print(json.dumps({"preview_dir": str(out), "projected_anecdotes": projected, "authors_with_anecdotes": len(by_author)}, ensure_ascii=False))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
