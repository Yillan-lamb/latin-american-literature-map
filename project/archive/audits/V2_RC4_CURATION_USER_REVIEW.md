# V2.0.0-rc.4 策展 USER_REVIEW 队列

- 日期：2026-08-13
- 状态：全部继续 `USER_REVIEW`；没有改成 approved，没有进入 public bundle。
- 完整逐项文案、依据和建议沿用 `project/audits/archive/V2_RC3_CURATION_USER_REVIEW.md`；rc.4 未修改这些候选内容，只修复其发布门禁。

## 结构化队列

| 类型 | ID | 数量 | 当前公众处理 | 建议 |
|---|---|---:|---|---|
| 阅读路径 | PATH-001—PATH-005 | 5 | 全部排除；首页改用事实型探索入口 | 逐项批准/返修/hold |
| 为什么值得读 | WHY-001—WHY-017 | 17 | 全部排除；作品页仅显示正式事实与关系生成的阅读线索 | 逐项批准/返修/hold |
| 读完之后读什么 | NEXT-001—NEXT-010 | 10 | 全部排除；只显示同作者正式书目关系 | 逐项批准/返修/hold |
| 文学时期 | PERIOD-001—PERIOD-005 | 5 | 全部排除；时间线改为中性年代分段 | 逐项批准/返修/hold |

每一项的对象、公众文案、判断内容、研究依据与原建议都在 rc.3 逐项表中，源数据仍在 `data/v2/presentation/PUBLIC_PRESENTATION.json`。rc.4 Web Data 把它们放在 `presentation_review_queue`，而 public bundle 不含该键和这些记录。

## 既有 Curation 队列

| ID | 状态 | 内容 | 公众处理 |
|---|---|---|---|
| V2-CUR-REC-001 | user_review | 《星辰时刻》→《佩德罗·巴拉莫》下一步阅读 | 排除 |
| V2-CUR-REC-002 | hold | 《百年孤独》与《佩德罗·巴拉莫》虚构空间比较 | 排除 |

## 机器证明

`validate_v2_web_data.py` 要求公开 presentation 只能包含 `auto_approved`，并验证公开/待审分区互斥；`build_v2_deploy_bundle.py` 再次 fail-closed；`validate_v2_public_bundle.py` 扫描实际 dist，禁止审核状态和队列键进入。
