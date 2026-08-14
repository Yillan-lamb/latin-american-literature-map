#!/usr/bin/env python3
"""Render the concentrated rc.5 curation USER_REVIEW package."""

from __future__ import annotations

import json
import sqlite3
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CONTENT = ROOT / "data/v2/curation/PUBLIC_CONTENT.json"
PRESENTATION = ROOT / "data/v2/presentation/PUBLIC_PRESENTATION.json"
OUTPUT = ROOT / "docs/V2_RC5_CURATION_USER_REVIEW.md"


def names():
    with sqlite3.connect(ROOT / "data/master/V1_MASTER.sqlite") as conn:
        return dict(conn.execute("SELECT entity_id, name_zh FROM entities"))


def render(value):
    if isinstance(value, str):
        return value
    if isinstance(value, list):
        parts = []
        for item in value:
            if isinstance(item, dict):
                parts.append(" / ".join(str(item.get(key)) for key in ("title", "text", "target_id", "reason") if item.get(key)))
            else:
                parts.append(str(item))
        return "；".join(parts)
    return json.dumps(value, ensure_ascii=False)


def main():
    payload = json.loads(CONTENT.read_text(encoding="utf-8"))
    presentation = json.loads(PRESENTATION.read_text(encoding="utf-8"))
    labels = names()
    lines = [
        "# V2.0.0-rc.5 策展内容集中 USER_REVIEW",
        "",
        "- 任务：`V2-N4-R04`",
        "- 状态：`👤 USER_REVIEW / Phase A`",
        "- 边界：本文件中的编辑判断尚未进入 public bundle；事实释义与编辑判断在数据层分开保存。",
        "- 审核方式：USER 可一次回复“批准本审核包全部 approve 建议”，或按对象列出 `revise / hold`。未明确批准的项目继续排除。",
        "",
        "## 审核摘要",
        "",
        "| 类别 | 对象数 | 待审字段 | 建议 |",
        "|---|---:|---:|---|",
        "| 作家页 | 10 | 30 | approve，必要时逐项 revise |",
        "| 作品页 | 17 | 85 | approve，必要时逐项 revise |",
        "| 地点页 | 19 | 38 | approve，必要时逐项 revise |",
        "| 首页阅读路径 | 5 | 5 | approve |",
        "| 文学时期 | 5 | 5 | approve 或修改边界 |",
        "| 既有作品延伸阅读 | 10 | 10 | approve |",
        "",
        "## 作家页",
        "",
    ]
    for item in payload["authors"]:
        target_id = item["target_id"]
        lines += [f"### {labels.get(target_id, target_id)}", ""]
        for key, title in (("why_know", "为什么值得认识"), ("core_themes", "核心主题"), ("start_here", "从哪里开始读")):
            value = item[key]
            lines += [f"- **{title}**：{render(value['content'])}", f"- **依据**：`{' / '.join(value['research_refs'])}`；`{' / '.join(value['source_refs'])}`", "- **建议**：`approve`", ""]
    lines += ["## 作品页", ""]
    for item in payload["works"]:
        target_id = item["target_id"]
        lines += [f"### {labels.get(target_id, target_id)}", "", f"- **低剧透导读（已来源核验）**：{render(item['story_intro']['content'])}"]
        for key, title in (("why_read", "为什么值得读"), ("theme_explanations", "主题解释"), ("next_reads", "读完之后读什么"), ("reading_tips", "阅读提示")):
            value = item[key]
            lines += [f"- **{title}**：{render(value['content'])}"]
        sources = sorted({source for key, value in item.items() if isinstance(value, dict) for source in value.get("source_refs", [])})
        refs = sorted({ref for key, value in item.items() if isinstance(value, dict) for ref in value.get("research_refs", [])})
        lines += [f"- **依据**：`{' / '.join(refs)}`；`{' / '.join(sources)}`", "- **建议**：`approve`", ""]
    lines += ["## 地点空间意义与阅读路径", ""]
    for item in payload["places"]:
        target_id = item["target_id"]
        lines += [f"### {labels.get(target_id, '巴西' if target_id == 'V2-GEO-BR' else target_id)}", "", f"- **文学导语（已来源核验）**：{render(item['literary_intro']['content'])}", f"- **空间意义**：{render(item['spatial_meaning']['content'])}", f"- **读者路径**：{render(item['reader_path']['content'])}", "- **建议**：`approve`", ""]
    lines += ["## 首页阅读路径", ""]
    for item in presentation["reading_paths"]:
        lines += [f"- **{item['title']}**：{item['description']}（对象：{'、'.join(labels.get(value, value) for value in item['target_ids'])}）— 建议 `approve`"]
    lines += ["", "## 文学时期", ""]
    for item in presentation["timeline_periods"]:
        lines += [f"- **{item['title']}**（{item['start']}—{item['end']}）— 建议 `approve`；年代边界如需调整请注明"]
    lines += ["", "## 审核后动作", "", "USER 明确批准后，CODEX 只把相应字段从 `user_review` 改为 USER 审核通过状态并重建 public bundle；不会把策展推荐写入 Research Data，也不会改变 hold 或正式关系。", ""]
    OUTPUT.write_text("\n".join(lines), encoding="utf-8")
    print(OUTPUT)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
