# QA_REPORT：V1-S3-B02 自检报告（R0 + R1）

- 任务：V1-S3-B02；执行方：EXT-AI-02（ZCode / deepseek-v4-flash，版本 unknown）；2026-08-10
- 结论：**等待 Codex 复检；本报告不自行写 pass**。

## 0. R1 返修记录（按 REVIEW §3 逐项落实）

| 返修项 | 落实 |
|---|---|
| §3.1 来源作者 | B02-SRC-0006 作者统一为 Jérôme Dulou（SOURCE_CANDIDATES.csv、SOURCE_NOTES.md）；全目录 grep 无 “Florencia Dulou” 残留 |
| §3.2 原子事实 | FCT-0014 改为 SRC-0007 单源（跳房子/碎片/读者），梦境/早期幻想拆至新增 FCT-0083（SRC-0006 单源）；FCT-0025 删除“马孔多兴衰/家族史诗”（SRC-0001 不支持），仅留伦理/圣经神话判断；FCT-0049 删除具体篇目清单，仅留 UB 题名支持的最低表述；内容卡 4/5/7/8/9/10/11 一句话简介与 FACT-ID 清单同步 |
| §3.3 基础事实 | 补核尝试（Nobel GGM 个人页 URL 变体、CVC 展览子页 cronologia/biografia/obra/vida.htm）均 404/不可得；按规则二删除 15 条（13 low 生卒年/首发年 + FCT-0011 国籍 + FCT-0026 马孔多场景）；ISSUES I-001 保留缺口；内容卡同步删除对应事实点 |
| §3.4 SET_IN | RG-B02-0016（百年孤独→马孔多）未取得直接说明来源，REL-0016 行与 RG-0016 组成对删除 |
| §3.5 查重 ID | 13 行 existing_id 全部展开为完整 ID（分号分隔、无“等”）；与 S1-003 候选表机械核对：全部存在且类型一致（author→Author、work→Work、place→Place、movement→Movement） |
| §3.6 文档同步 | 机械重算后同步 README/STATUS/QA/ISSUES/HANDOFF/MANIFEST/COVERAGE_SUMMARY/SOURCE_NOTES；QA 保留 R0 问题与 R1 修复记录 |
| §6 裁决落实 | I-001 删除路径；I-002 改编链保留为原始补充候选；I-003 实体名规范（美洲神奇现实、圣地亚哥·纳萨尔、上校（《没有人给他写信的上校》人物））；I-004/I-005 接受并记录 |

## 1. 自检方法

七张主体 CSV 由可复现脚本生成并内置断言（ID 唯一、端点存在、来源回指、枚举合法、组状态一致）；目录安全与共享验证用项目共享脚本；统计全部从最终 CSV 机械重算。

### 1.1 共享 FULL 验证（R1 复跑）

```text
python3 scripts/validate_external_delivery.py <交付目录> --profile FULL
result: pass | errors: 0 | warnings: 0 | files: 16
```

### 1.2 目录安全终检

- 目录恰为任务卡登记的 16 项文件；无 PDF/EPUB/整书 OCR、无 inputs、无 Cookie、无密钥、无 `.DS_Store`、无未登记文件。

### 1.3 脚本断言（生成时全部通过）

1. 来源/实体/事实/关系/组/查重 ID 全部唯一；关系端点与事实主体全部存在；来源引用全部回指 `SOURCE_CANDIDATES.csv`。
2. 关系词 ⊆ Schema 0.2 冻结词表；实体类型 ⊆ Schema 0.2 类型；dispute_status ⊆ 枚举（R1 后事实 dispute 全部为 none）。
3. 组状态与 dispute 一致：全部 `none` → eligible（19 组）；含 `needs_second_source` → hold（15 组）。
4. 类型端点约束：ADAPTED_FROM 主体均为 adaptation、DIRECTED 主体均为 person、客体均为 adaptation。

## 2. 机械统计（R1，从最终 CSV 重算）

| 指标 | 数值 |
|---|---|
| 来源 | 15（A×10、B×2、D×3；ok×15；es×13/en×1/pt×1；机构 13） |
| 覆盖 | 9 部作品，每部 ≥1 个 A/B 级来源，不重不漏 |
| 实体 | 43（author 3/work 9/collection 2/adaptation 2/person 2/character 5/place 5/movement 3/theme 10/event 1/institution 1） |
| 事实 | 68（high 64/medium 4；dispute 全部 none；D 级来源未支撑任何事实） |
| 关系 | 34 行 / 34 组（CREATED 11/ADAPTED_FROM 2/DIRECTED 2/ASSOCIATED_WITH_PLACE 4/ASSOCIATED_WITH_MOVEMENT 3/EXPLORES_THEME 12；SET_IN 0） |
| 状态分层 | eligible_for_staging_review×19、hold_needs_second_source×15 |
| 内容卡 | 12 张（3 作家 + 9 作品/作品集），清单合计 49 个不重复 FACT-ID（清单行每 ID 一次；正文辅助引用不计入），全部存在于 `FACT_CANDIDATES.csv` |
| 查重 | 13 条（exact×12、type_conflict×1），existing_id 全展开且经 S1 核对 |

## 3. 抽样复核记录（R1 重抽，每作家 2 来源、每作品 1 事实、每类关系 2 条）

### 3.1 来源抽样（6/15）

- B02-SRC-0001（Javeriana）：落地页 200，摘要核验——伦理/圣经神话判断与修改后 FCT-0025 一致 ✅
- B02-SRC-0004（CVC）：页面正文核验——阿卡塔卡、马孔多、1982 诺贝尔、魔幻现实主义代表判断 ✅
- B02-SRC-0006（Orbis Tertius）：落地页 200，作者 Jérôme Dulou（与 UNLP 官方页一致），摘要核验——梦境主题与 FCT-0083/RG-B02-0028/0029 一致 ✅
- B02-SRC-0007（Passagens）：摘要核验——跳房子/碎片/读者与修改后 FCT-0014/RG-B02-0027 一致 ✅
- B02-SRC-0011（RFRM）：摘要核验——古巴、美洲神奇现实、neobarroco、Mackandal 与实体/关系一致 ✅
- B02-SRC-0013（Letras）：摘要核验——1962 年、艺术/启蒙批判与 RG-B02-0033 一致 ✅

### 3.2 作品事实抽样（9/9 各 1 条）

- 《百年孤独》FCT-0025（伦理/圣经神话）← SRC-0001 摘要 ✅（R1 已删马孔多表述）
- 《上校》FCT-0030（等待/斗鸡/被动抵抗）← SRC-0002 摘要 ✅
- 《凶杀案》FCT-0035（前文本/原始之罪）← SRC-0003 PDF 首页 ✅
- 《跳房子》FCT-0040（碎片叙事/读者）← SRC-0007 摘要 ✅
- 《动物寓言集》FCT-0045（梦境/幻想）← SRC-0006 摘要 ✅
- 《游戏的终结》FCT-0049（面具游戏/自我折叠）← SRC-0009 题名 ✅（R1 已删篇目清单）
- 《人间王国》FCT-0053（跨文化/人物）← SRC-0011 摘要 ✅
- 《消逝的足迹》FCT-0058（Kehre/美洲）← SRC-0012 PDF 首页 ✅
- 《光明世纪》FCT-0063（ecfrasis/启蒙批判）← SRC-0013 摘要 ✅

### 3.3 关系类型抽样（6 类中每类全部核验）

- CREATED×11：全部回到论文标题/摘要明示作品归属，无推断 ✅
- ADAPTED_FROM×2 / DIRECTED×2：SRC-0008 摘要明示 ✅
- ASSOCIATED_WITH_PLACE×4：CVC/RFRM 明示 ✅
- ASSOCIATED_WITH_MOVEMENT×3：CVC/RFRM 明确文学史判断，单来源标 needs_second_source ✅
- EXPLORES_THEME×12：全部回到论文摘要/标题的明确主题判断，单来源标 needs_second_source ✅
- SET_IN：R1 后为 0（原 1 组因无直接来源删除）✅

### 3.4 未把推断写成事实（R1 复核）

- 事实表 68 条逐条核对：不再存在“来源未直接显示”仍挂该来源并作为事实保留的记录；D 级来源未支撑任何事实或关系 ✅
- 13 条查重 existing_id 与 S1 候选类型机械核对一致 ✅
- 12 张卡片 FACT-ID 清单全部存在且唯一 ✅

## 4. 已知限制（如实）

1. B02-SRC-0009（UB）正文摘要不可得，主题关系 RG-B02-0030 以标题为据，置信度 medium（FCT-0049 已降为题名支持的最低表述）。
2. B02-SRC-0008（Anclajes）涉及的两短篇在《Todos los fuegos el fuego》（1966），非本批 9 部固定作品；按 REVIEW I-002 保留为原始补充候选，未生成卡片。
3. 基础事实缺口（生卒年×6、首发年×7、科塔萨尔国籍、马孔多场景）：R1 已删除，登记于 ISSUES I-001，待阶段 4 或定向合法补证。
4. 本批无 EDITION_OF/TRANSLATION_OF/INFLUENCED_BY/RESPONDS_TO_WORK 候选——来源未提供相应证据，未为凑数制造弱关系。

## 5. 历史

- R0（2026-08-10）：首版交付；共享 FULL pass；Codex 审计 `revise`，问题为：①SRC-0006 作者名错误；②FCT-0014/0025/0049 原子事实边界；③15 条无来源基础事实；④RG-B02-0016 证据不足；⑤查重 ID 缩写；⑥文档数字同步。
- R1（2026-08-10）：六项全部落实（见 §0），机械重算与共享 FULL 复跑通过；是否最终 pass 由 Codex 决定。
