# HANDOFF — Worker A（卡洛斯·富恩特斯）WEB-CE-B01-R-A

## 状态总览
- 按 PM 收尾指令提前终止网络研究并落盘：**只写入实际核验（页面打开成功）的内容**；未核验项一律 pending/hold/gap，fail-closed。
- 本轮有效核验来源仅 2 个（均为 BnF：data.bnf.fr 权威记录 + catalogue.bnf.fr 检索页）；5 个计划来源（Britannica/LC/BBC/Guardian/Wikipedia）被 Cloudflare 拦截或超时，如实标 access_blocked。
- 产出：4 实体候选（1 author + 3 work，其中《奥拉》pending）、23 事实候选（其中 8 条 candidate、1 条 hold、14 条 gap）、9 关系候选（2 CREATED candidate、7 hold）、3 行中译核验（全部 pending）。

## QA 自查（本 worker 不自审，以下为提交前机械检查）
- [x] 临时 ID 全部 CAND-A-* 前缀（CAND-A-SRC-01/02…、CAND-A-ENT-01~04、CAND-A-FCT-01~23、CAND-A-REL-01~09）；未分配任何 V1-ENT/V1-FCT/V1-REL/SRC- 正式 ID。
- [x] CSV 列名严格按 packet（逐列核对：SOURCE_CANDIDATES 21 列、ENTITY_CANDIDATES 9 列、FACT_CANDIDATES 10 列、RELATION_CANDIDATES 11 列、TRANSLATION_AUDIT 13 列），Python csv 模块生成，引号/UTF-8 合规。
- [x] 引用回指：FACT/REL 引用的 origin_material_id / source_temporary_ids / subject_id / object_id 均可回指到对应候选行或主库既有 ID（V1-ENT-0051/0056/0064/0130）。
- [x] 枚举合法：关系词仅用 Schema 0.3 十三词中允许者（CREATED/ASSOCIATED_WITH_MOVEMENT/ASSOCIATED_WITH_PLACE/SET_IN/EXPLORES_THEME）；fact_field 均取自主库既有词表（birth_year/death_year/country_or_region/language/one_sentence_summary/career_note/personal_note/nationality_history/award/bibliographic_note/first_publication_year/genre_or_form/story_premise/setting_place/key_character）；admission_status 用既有取值（candidate_for_staging_review/hold/gap）。
- [x] 来源真实：SRC-01/02 有 canonical_url + persistent_id（ark/VIAF/LC/GND/ISNI）与 access_status=access_pass、access_date=2026-08-18；blocked 来源如实记录，无假装核验。
- [x] 未写主库、未 git、未改治理文件与 site/。
- [x] 承认度：CREATED 仅 2 条且为目录级单来源（B 级，满足 CREATED 最低证据）；解释型关系全部 hold_needs_second_source 或 NEEDS_SOURCE；无 AI 记忆冒充来源（ISSUES.md 中的中译线索已显式标注"非来源"）。

## 文件清单（data/changesets/WEB-CE-B01/candidates/A_fuentes/）
1. SOURCE_CANDIDATES.csv — 7 行（2 access_pass + 5 access_blocked）
2. ENTITY_CANDIDATES.csv — 4 行
3. FACT_CANDIDATES.csv — 23 行
4. RELATION_CANDIDATES.csv — 9 行
5. TRANSLATION_AUDIT.csv — 3 行（全部 pending）
6. SOURCE_NOTES.md — claim→evidence 映射
7. ISSUES.md — 冲突（出生地巴黎 vs 巴拿马城）、hold、gap、待核线索、未决问题
8. HANDOFF.md — 本文件

## 下一步（交 PM/Reviewer/后续轮次）
1. Reviewer：按 packet 验收标准复核；重点看出生地冲突（1.1）与《奥拉》实体 pending（ISSUES 5.2）。
2. 网络恢复后优先重试：Britannica biography（出生地/生平/奖项）、LC n80022904（第二权威身份来源）、en.wikipedia（作品释义与主题证据）。
3. 补验 BnF 作品级记录：La región más transparente / Aura / La muerte de Artemio Cruz 各自的目录记录页（首版年、体裁、出版细节），并核验《奥拉》实体来源。
4. 中译核验：按 PREFLIGHT 优先级（出版社书目 > 国图/权威馆藏 > ISBN/书业目录 > 豆瓣具体版本页）逐一补验三书，回填 TRANSLATION_AUDIT 的 translator/publisher/year/isbn/translation_status。
5. 解释型关系（文学爆炸、墨西哥革命小说、SET_IN 墨西哥城）构建双来源证据组后解除 hold。

## 停止条件确认
- 本 packet 全部对象均已产出候选或显式 hold/pending/gap；未凑数降级证据；未研究 packet 外对象；未启动 Batch 02。
