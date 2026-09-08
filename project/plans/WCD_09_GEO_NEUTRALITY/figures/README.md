# figures/ 图注（N-07）

本目录 8 张图为**投影/几何候选的轮廓比较证据**，尺寸均 1320×840。

- **用途限定**：仅供比对各候选投影在相同 geometry / 相同窗口 / 相同画布下的**轮廓与失真观感**（配合 06/07 数值表），**不是成品视觉验收材料**。
- 图面未经过真实 UI 排版与标签避让优化：未反映最终配色与字体。若用于正式 USER Gate 的**视觉**裁决，需另出无重叠标签、相同裁切边界、附量化指标表的版本（见 15 的 B-1 裁决项）；数值判定以 06/07 与 CH-24 机械校验为准。
- 生成脚本为 `generate_projection_evidence.py`；`generate_aeqd_evidence.py` 仅保留为兼容入口。脚本计算固定七点的 `ew_ns_scale_ratio`（方向代理）、`principal_axis_ratio`（完整 J 奇异值比）和 `area_factor=abs(detJ)`，并为每张图提供 `--check` SHA-256 校验。

各图对照（B-1）：
- `candidate_projection_1_equirect.png` — Equirect（备胎，非等积）
- `candidate_projection_2_laea.png` — LAEA（综合首选，等积；不是完整形状最小）
- `candidate_projection_3_equal_earth.png` — Equal Earth（等积参考，完整主轴形变较大）
- `candidate_projection_4_aeqd.png` — AEQD（方位等距候选；完整主轴比更优但非等积）
- `current_projection.png` — 现状各向异性线性（待替换）
- `extra_natural_earth_projection.png` — Natural Earth I（参考，非等积且含剪切）
- `candidate_projection_5_albers.png` — Albers（等积圆锥参考，跨赤道形变较大）
- `candidate_projection_6_mercator.png` — Mercator（保角对照，非主图候选）

所有候选使用同一 28-feature geometry、同一窗口 `lon=-118..-32; lat=-56..33` 和统一等比适配。数值以 `07_PROJECTION_SAMPLE_METRICS.csv` 为准；AEQD 不保面积，不能用画布等比缩放替代 `area_factor` 验收。所有图仍是研究比较图，不是成品 UI 或视觉验收材料。
