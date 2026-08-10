# QA_REPORT：V1-S3-B03 自检报告（R0 + R1）

- 任务：V1-S3-B03；执行方：EXT-AI-02（ZCode / deepseek-v4-flash，版本 unknown）；2026-08-10
- 结论：**等待 Codex R1 复检；本报告不自行写 pass**。

## 0. R1 返修记录（按 REVIEW §3 逐项落实）

| 返修项 | 落实 |
|---|---|
| §3.1 SRC-0002 元数据 | 打开官方页复核：完整题名含 `"Cien años de soledad" (1967) de García Márquez`；卷期 `Vol. 2 Núm. 3 (2014)`；官方页发布日期 `2015-01-14`；pp.92-115。SOURCE_CANDIDATES.csv 与 SOURCE_NOTES.md 同步；全包 grep 确认旧卷期值已清除 |
| §3.2 SRC-0008 等级/类型 | 官方落地页栏目为 `Reseña`（书评）：建议等级 A→C、source_type journal_article→other、notes 注明仅作书目/作品题名补充；全包等级重算 A×7/B×4/C×1；《漫歌》A/B 数 4→3（WORK_COVERAGE limitation 注明）；README/COVERAGE_SUMMARY/HANDOFF 等级表述同步为 A×7/B×4/C×1 |
| §3.3 原子事实与回指 | FCT-0037 仅保留 CVC（SRC-0012）支持部分；新增 FCT-0059（SRC-0010 单源：Araya 论文“两个先前标题”）；FCT-0056 删除“通行对应 Antônio Conselheiro，待核”，issue_notes 说明同一性未核验未进入事实；《二十首情诗》内容卡 FACT-ID 增加 0059（8 卡共 46 个） |
| §3.4 MANIFEST 与文档 | MANIFEST 16 项逐项登记实际字节数（生成后重新计算自身尺寸）；README/STATUS/QA/ISSUES/HANDOFF/COVERAGE_SUMMARY/SOURCE_NOTES 按最终 CSV 重算同步；QA 保留 R0 问题与 R1 修复记录 |
| §6 裁决落实 | I-001 缺口并入阶段 4 补核包；I-002 诗集 collection 归并；I-003 卡努杜斯不建关系、BASED_ON_EVENT 留待 N3 前兼容性提案；I-004 替代方案接受；I-005 仅保留作者层研究事实 |

## 1. 自检方法

七张主体 CSV 由可复现脚本生成并内置断言；目录安全与共享验证用项目共享脚本；统计全部从最终 CSV 机械重算。

### 1.1 共享 FULL 验证（R1 复跑）

```text
python3 scripts/validate_external_delivery.py <交付目录> --profile FULL
result: pass | errors: 0 | warnings: 0 | files: 16
```

### 1.2 目录安全终检

- 目录恰为任务卡登记的 16 项文件；无 PDF/EPUB/整书或整部诗集 OCR、无论文全文、无 inputs、无 Cookie、无密钥、无 `.DS_Store`、无未登记文件。

### 1.3 脚本断言（R1 生成时全部通过）

1. 来源/实体/事实/关系/组/查重 ID 全部唯一；关系端点与事实主体全部存在；来源引用全部回指 `SOURCE_CANDIDATES.csv`。
2. 关系词 ⊆ Schema 0.2 冻结词表；实体类型 ⊆ Schema 0.2 类型；dispute_status ⊆ 枚举（事实全部 none）。
3. 组状态与 dispute 一致：全部 `none` → eligible（16 组）；含 `needs_second_source` → hold（7 组）。
4. 双源组 RG-B03-0023 恰为 2 行（Nobel + CVC）。
5. 查重 exact 行与 S1 候选类型机械核对一致；type_conflict 行（诗集 collection vs S1 Work）保持冲突。
6. 新增 FCT-0059 唯一来源为 B03-SRC-0010；FCT-0037 唯一来源为 B03-SRC-0012；FCT-0056 断言值不含未核验同一性。

## 2. 机械统计（R1，从最终 CSV 重算）

| 指标 | 数值 |
|---|---|
| 来源 | 12（A×7、B×4、C×1；ok×12；es×8/en×3/fr×1；机构 10） |
| 覆盖 | 6 部作品，每部 ≥1 个 A/B 级来源；《漫歌》A/B 数 3 |
| 实体 | 31（author 2/work 4/collection 3/place 7/movement 3/theme 6/event 2/character 1/person 2/institution 1） |
| 事实 | 59（high 53/medium 6；dispute 全部 none） |
| 关系 | 24 行 / 23 组（CREATED 7/SET_IN 1/ASSOCIATED_WITH_PLACE 7/ASSOCIATED_WITH_MOVEMENT 3/EXPLORES_THEME 6） |
| 状态分层 | eligible_for_staging_review×16、hold_needs_second_source×7 |
| 内容卡 | 8 张，清单合计 46 个不重复 FACT-ID（清单行每 ID 一次），全部存在于 `FACT_CANDIDATES.csv` |
| 查重 | 10 条（exact×7、type_conflict×3），existing_id 全为完整 ID |

## 3. 抽样复核记录（R1 重抽）

### 3.1 来源抽样

- B03-SRC-0002（Catedral Tomada）：官方页复核 `Vol. 2 Núm. 3 (2014)`、发布日期 2015-01-14、完整题名（含 1967 García Márquez）✅
- B03-SRC-0008（Anales U. Chile）：落地页栏目为 Reseña（书评），等级 C/other ✅
- B03-SRC-0004（Nobel 略萨 Facts）：Born 1936-03-28 / Died 2025-04-13 / Peruvian author ✅
- B03-SRC-0003（Letral）：1981 年出版、Consejero、Canudos 标题 ✅

### 3.2 作品事实抽样（6/6 各 1 条）

- 《城市与狗》FCT-0021 ← SRC-0001 ✅；《酒吧长谈》FCT-0026 ← SRC-0002 ✅；《世界末日之战》FCT-0030 ← SRC-0003 ✅；《二十首情诗》FCT-0036 ← SRC-0006 ✅（FCT-0037 仅 CVC、FCT-0059 仅 SRC-0010 各单源 ✅）；《大地上的居所》FCT-0040 ← SRC-0007 ✅；《漫歌》FCT-0044 ← SRC-0012（Nobel 交叉）✅

### 3.3 关系类型抽样

- CREATED×7、SET_IN×1、ASSOCIATED_WITH_PLACE×7：全部回到论文/机构页明示 ✅
- ASSOCIATED_WITH_MOVEMENT×3：单来源 needs_second_source，hold ✅
- EXPLORES_THEME×6：4 单源 hold + 双源组 RG-B03-0023 eligible；无推断 ✅

### 3.4 未把推断写成事实（R1 复核）

- 事实表逐条核对：FCT-0056 断言值无“Antônio Conselheiro”同一性内容；无“通行/待核”值残留（59 条中 issue_notes 仅作说明）✅
- 查重 10 条 existing_id 与 S1 机械核对 ✅
- 8 张卡片 FACT-ID 清单全部存在且唯一 ✅

## 4. 已知限制（如实）

1. B03-SRC-0007（Atenea Concha）与 B03-SRC-0008（Anales Jofré，C 级书评）正文摘要本站不可得，作品覆盖以题名为据；B03-SRC-0008 不支撑任何事实或关系。
2. 《大地上的居所》分卷构成（Residencia I/II 等）来源未直接列明，未建首发年/分卷年事实（ISSUES I-001）。
3. 本批无 EDITION_OF/TRANSLATION_OF/INFLUENCED_BY/RESPONDS_TO_WORK/CONTAINS_WORK 候选——来源未提供相应证据，未为凑数制造弱关系。

## 5. 历史

- R0（2026-08-10）：首版交付；共享 FULL pass；Codex 审计 `revise`，问题为：①SRC-0002 卷期/题名元数据错误；②SRC-0008 误标 A 级论文（实为 Reseña 书评）；③FCT-0037 多源合并且回指不全；④FCT-0056 未核验同一性进入断言值；⑤MANIFEST 缺实际尺寸。
- R1（2026-08-10）：五项全部落实（见 §0），机械重算与共享 FULL 复跑通过；是否最终 pass 由 Codex 决定。
