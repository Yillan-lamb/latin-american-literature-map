#!/usr/bin/env python3
"""Render the remaining rc.5 curation questions after the USER Sol review."""

from __future__ import annotations

import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CONTENT = ROOT / "data/v2/curation/PUBLIC_CONTENT.json"
PRESENTATION = ROOT / "data/v2/presentation/PUBLIC_PRESENTATION.json"
OUTPUT = ROOT / "docs/V2_RC5_CURATION_USER_REVIEW.md"

PENDING_PATH_QUESTIONS = {
    "PATH-001": "USER 文件要求路径具有最终问题，但未给出该句具体文本",
    "PATH-002": "Codex 根据既有路径导语补写",
    "PATH-003": "Codex 根据既有路径导语补写",
    "PATH-004": "Codex 根据既有路径导语补写",
    "PATH-005": "Codex 根据既有路径导语补写",
}


def main() -> int:
    content = json.loads(CONTENT.read_text(encoding="utf-8"))
    presentation = json.loads(PRESENTATION.read_text(encoding="utf-8"))
    paths = {item["id"]: item for item in presentation["reading_paths"]}
    counts = {group: len(content[group]) for group in ("authors", "works", "places")}
    lines = [
        "# V2.0.0-rc.5 策展内容集中 USER_REVIEW",
        "",
        "- 任务：`V2-N4-R04 / Phase B`",
        "- 日期：2026-08-14",
        "- 当前状态：`👤 USER_REVIEW`",
        "- 原则：只列本轮由 Codex 自行新增、未在 USER 文件中明确给出的文学判断。",
        "",
        "## 已按 USER 指示执行，不重复请求审核",
        "",
        f"已按 USER 指定文件录入 {counts['authors']} 位作家、{counts['works']} 部作品、{counts['places']} 个地点和 {len(paths)} 条首页路径的明确内容。三处指定修订、17 条专属阅读方法、17 个作品问题、19 条地点路线及五段‘约’式文学时期均已落实。",
        "",
        "这些内容仍然只属于 Curation Data，不写入 Research Data，也不创建 Formal Relationship。",
        "",
        "## 本轮新增待审项",
        "",
        "| ID | 页面 | 文案 | 为什么需要 USER | 建议 |",
        "|---|---|---|---|---|",
    ]
    for index, (path_id, reason) in enumerate(PENDING_PATH_QUESTIONS.items(), start=1):
        item = paths[path_id]
        lines.append(f"| RC5-PATH-Q-{index:03d} | {item['title']} | {item['guiding_question']} | {reason} | approve / revise |")
    lines += [
        "",
        "上述 5 个问题使完整首页路径继续保留在 USER_REVIEW 预览中。它们未被写成研究事实，也不表示 V2-N4 已通过。",
        "",
        "## 已知审核边界",
        "",
        "- 旧版 `literary_profile`、作者级 `literary_features`、作品级 `narrative_features`、`literary_significance` 与部分 `location_note` 未因本轮内容扩张被顺带批准；其原审核状态保持不变。",
        "- 布宜诺斯艾利斯、海地、卡努杜斯、哈瓦那只进入研究缺口文档，不进入当前地图。",
        "- 当前可体验产物是本地 USER_REVIEW preview，不是正式 public bundle。",
        "",
    ]
    OUTPUT.write_text("\n".join(lines), encoding="utf-8")
    print(OUTPUT)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
