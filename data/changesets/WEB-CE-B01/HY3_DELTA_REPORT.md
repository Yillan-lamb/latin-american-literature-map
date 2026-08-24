# WEB-CE-B01-HY3 Delta Report（《奥拉》公共化增补）

- **Delta ID**: WEB-CE-B01-HY3
- **Parent Batch**: WEB-CE-B01（其 `FINAL_BATCH_REPORT.md` 未被改写，本文件为独立增补报告）
- **branch**: `content/batch-01-paz-fuentes-mistral`
- **Reviewer**: HY3-REVIEW（迁移）/ CODEX-REVIEW（public_content 字段 auto_approved）
- **Date**: 2026-08-20

## 决策背景
原 Batch-01 报告将《奥拉》记为 `pending-hold | 无作品级来源,不入库`。本周期（HY3）按 USER 选择 **"Promote to public"**，为《奥拉》补齐经过评审的公开导读内容，使其获得：

- 公共作品页（`/works/aura-v1-ent-0169/`）
- 站点搜索命中
- 富恩特斯「读什么」网格中的公共作品（富恩特斯名下唯一公共作品）

此增补为**加法**，不覆盖 Batch-01 任何迁移或 Batch Report，符合 `不要覆盖前序 Batch migration` / `不得覆盖其 Batch Report` 约束。

## 变更清单

### 主库（V1_MASTER.sqlite，迁移 0004）
- 迁移文件 `data/master/migrations/0004_web_ce_b01_aura.sql`（未覆盖 0001–0003）。
- 实体 `V1-ENT-0169`《奥拉》(work, candidate)；卡片 `V1-CARD-0063`（`source_minimum_status=meets`）。
- 事实 `V1-FCT-0340`—`0347`（首版年 1962 / 体裁 novela / 场景 墨西哥城 / 第二人称叙述 / 人物费利佩·莫内罗 等），全部 `candidate_for_staging_review`。
- 关系 `V1-REL-0101`（富恩特斯 CREATED 奥拉）、`V1-REL-0102`（奥拉 SET_IN 墨西哥城 `V1-ENT-0056`），`review_status=accepted`。
- 来源 `SRC-0123`（ELEM 书目）/ `SRC-0124`（Internet Archive 书目）/ `SRC-0125`（Cultura Genial 赏析）。
- `migration_log` 计数 +1（现 4）。

### 地理层（data/v2/geo/PLACE_RELATIONS.csv）
- 新增 `V2-GEO-REL-031`：奥拉 SET_IN 墨西哥城（work_setting, real, high, accepted），引用 `V1-REL-0102` / `SRC-0125`。

### 策展层
- `CURATION_ENTRIES.csv`：富恩特斯条目 `V2-CUR-ENT-017` 的 `page_lede` 增补「与《奥拉》」并追加 `research_refs`/`source_refs`（一致性 delta，不覆盖 Batch-01 内容）。
- `PUBLIC_CONTENT.json`：works 由 23 → 24，新增 `target_id=V1-ENT-0169` 条目；`story_intro` / `narrative_features` / `location_note` 等全部字段 `status=auto_approved`（reviewer CODEX-REVIEW，research_refs 取 V1-FCT-0340/0341/0343/0344/0345/0346，source_refs 取 SRC-0123/0124/0125）。

### Web 产物（确定性重建）
- `site_data.json` / `manifest.json` 由 `build_v2_web_data.py` 重建（`generated_at` 2026-08-20）。
- `public_scope.works`: 3 → 4（新增 `V1-ENT-0169`）；`search_index` 29 → 30。
- Aura 进入 `public_scope.works` 与 `search_index`，`isPublic(V1-ENT-0169)=true`。
- 富恩特斯公共作品数 = 1（《最明净的地区》《阿尔特米奥·克罗斯之死》无 public_content 条目，仍为非公共）。

### QA 脚本微调（minimal necessary adaptation）
- `scripts/validate_v2_web_data.py`：`expected_scope_counts.works` 3→4，并在注释中注明 WEB-CE-B01-HY3 增订；`authors=3` / `places=21` 不变。未改动 Batch-01 其它逻辑或其 Batch Report。

## 部署产物（dist 静态生成）
作者/作品/地点等深链页面由 `scripts/build_v2_deploy_bundle.py` 以 SSG 方式预渲染为
`dist/{public_route}/index.html`（其 `<body>` 带 `data-route-kind`/`data-route-id`，
`app.js` 的 `initialRoute()` 据此水合）。仅复制 `data/v2/web/site_data.json` 不足以让
深链可见——必须重跑 SSG 以生成 Aura 的 `dist/works/aura-v1-ent-0169/index.html`
（本 delta 已重跑，产出 40 文件 / 34 路由，含 Aura 静态页）。`dist` 为 gitignore 的
构建产物，不随本 commit 入库，部署时由该脚本重新生成。

## QA 结果
- `validate_master.py`：**PASS**（integrity ok；foreign_key_errors 0；entities 169 / facts 347 / relationships 102；migration_log=4）。
- `validate_v2_web_data.py`：**PASS**（schema v2-web-0.2；references / status gates / search_index 与 public_scope 完全对齐；public routes 唯一且非空）。
- `validate_v2_content_quality.py`：**FAIL（既有，与 Aura 无关）** — 硬编码 coverage `AUTHOR_IDS`/`WORK_IDS`=10/17，实际 `PUBLIC_CONTENT` 已为 authors=13 / works=24 / places=19。Batch-01 已将其扩张至 13/23，本增补 +1 至 24。属 Batch-01 基线漂移，按 no-overwrite 约束**不在本 delta 内修订**。
- 浏览器端到端冒烟（Playwright MCP，正确静态服务 + 非陈旧 dist + 新浏览器上下文）：**PASS** —
  - Aura 作品页 `/works/aura-v1-ent-0169/` 完整渲染（标题《奥拉》/ Aura、作者卡洛斯·富恩特斯、1962、体裁、完整故事导读、叙事特征「第二人称」、发生地「墨西哥城」），控制台无错误；
  - 富恩特斯作者页 `/authors/carlos-fuentes-v1-ent-0145/`「读什么」网格含《奥拉》；
  - 搜索「奥拉」可命中 Aura；首页正常加载。
  - 说明：早期判定为 BLOCKED 实为验证脚手架缺陷（自写的 SPA 服务器未对目录回退 `index.html`，
    复用浏览器会话的陈旧缓存导致 `./app.js` 误解析到子路径的 MIME 报错），非站点缺陷。

## 边界确认
- 未覆盖 0001–0003 任一迁移；未改写 `WEB-CE-B01/FINAL_BATCH_REPORT.md`。
- 对 `site/index.html` 新增单行 `<base href="/">`（commit `d4f4d69`）：纯防御性修复，使根
  `index.html` 在作为 SPA fallback 于子路径提供时资源仍解析到站点根，避免深链模块脚本
  MIME 错误；静态实体页本就用绝对 `/app.js`，故此改动不影响 Batch 内容。如坚持「site/ 零改动」可单独 revert 该提交。
- 未创建 tag / release / deployment；未 merge / 未 push；未启动 Batch 02。
- Aura 的 facts 仍保持 `candidate_for_staging_review`（仅公开导读内容 auto_approved），符合「可进入公共阅读层」但研究事实留待 staging 评审的既定分层。

**HY3_DELTA_COMPLETE = true**
