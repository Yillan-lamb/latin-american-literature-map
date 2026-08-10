# ISSUES：问题与待 Codex 决策清单

- task_id: `V1-S3-B01`
- 编写：EXT-AI-02（2026-08-10）；按任务卡 §9 压缩为 5 项待决策，其余为说明项

## 待 Codex 决策（5 项）

### I-001（需决策）：同名实体合并判定
- DUPLICATE_CANDIDATES.csv 共 9 条：与既有 S1 候选 exact 6 条（胡安·鲁尔福↔CAND-AUTHOR-0022、佩德罗·巴拉莫↔CAND-WORK-0005×2、墨西哥↔CAND-PLACE-0001、奥克塔维奥·帕斯↔CAND-AUTHOR-0062、墨西哥革命小说↔CAND-MOV-0005）；与 staging v1_s2_pilot exact 1 条（主题"记忆与遗忘"↔STG-ENT-0014，S2 试点已暂存该主题，B01 新建端点建议并入暂存实体）。
- 请 Codex 裁决合并方式；本包未删除任何候选。

### I-002（需决策）：《佩德罗·巴拉莫》作品/人物分层确认
- B01-ENT-0010（work）与 B01-ENT-0022（character）同名分层候选（批内查重 2 条）；按 Schema 0.2 不合并，作为 work/character 分层测试点，请 Codex 确认端点命名（人物显示名"佩德罗·巴拉莫（人物）"）。

### I-003（需决策）：四部作品的专论来源补证
- 《关于玛丽安娜的证词》《黑暗的职守》《金鸡》《诗歌不是你》目前以 ELEM 词条/作品页（B 级书目）为主；如需进入解释性关系，请 Codex 在后续批次安排 A 级专论补证或接受 B 级书目状态。

### I-004（需决策）：7 组单来源解释性关系的处置
- EXPLORES_THEME×6 + ASSOCIATED_WITH_MOVEMENT×1（墨西哥革命小说）为单来源，全部标 needs_second_source；按 Schema 0.2 §4 保留为待审候选，请 Codex 决定保留/补证/暂缓。

### I-005（需决策）：被拦截来源的替代是否接受
- SciELO Chile/Argentina 摘要页（Cloudflare/DNS 拦截）、Fundación Juan Rulfo 官网（域名不可达）、Cervantes Virtual（403）、HAL（反爬）未纳入；已用等价 A/B 级替代（UNAM《墨西哥文学》期刊、ELEM、FCE、智利大学期刊）。若 Codex 需要 Fundación Juan Rulfo 或 SciELO 特定论文，请指示后续补抓方式。

## 说明项（非决策）

### I-006（已说明）：书目待核字段
- 基督战争年份（1926-1929）为通行史实、来源未直接给出；《金鸡》体裁、《燃烧的原野》篇数、多部作品中文译名（《彩色的一周》《黑暗的职守》《关于玛丽安娜的证词》等）标"待核"，未冻结译名。

### I-007（已说明）：Schema 0.2 新枚举使用
- `person` 类型与 `DIRECTED` 关系词首次使用（导演 Arturo Ripstein → 1968 年电影 adaptation），符合冻结 Schema 0.2；未新增任何枚举。
