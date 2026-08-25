# WEB-CE-B03 Fresh Review

- Reviewer: `LUNA-MAX-B03-REVIEW`（fresh context）
- Review date: 2026-08-20
- Scope: B03 `RESEARCH_CHANGE_SET.json`、`0006_web_ce_b03_luna_max.sql`、B03 Preflight；主库未写入。
- Verdict: **REVISE**

## Review method

我重新读取了 `project/governance/PROJECT_CHARTER.md`、`project/tasks/V2_TASKS.md` 和《数据新增与版本维护操作手册》，按作者、作品、来源、事实、关系、中文展示名和文学空间逐项检查了本批变更。11 个登记 URL 均重新打开并核对了页面身份与正文信息，包括 Instituto Cervantes / CVC、Memoria Chilena、阿根廷国家图书馆、CONICET 和 GeoNames。将迁移应用到 `/private/tmp/lalm-b03-review.sqlite` 进行副本演练，结果为：

- `validate_master.py`: PASS；`PRAGMA integrity_check`: `ok`；foreign-key errors: `0`；
- 迁移后计数：entities 195、facts 434、relationships 126、sources 149、content_cards 87；
- B03 内没有发现原文作者名、作品名或 `subject + relation_type + object` 的重复；9 部作品均有一个 `CREATED` 关系；
- 没有修改正式主库、Web Data、前端或其他 Batch 文件。

## Evidence checks that pass

1. Onetti：Instituto Cervantes 页面直接给出 Montevideo、1909–1994 和 `Escritor uruguayo`；CVC bibliography 明确说明采用首版书目，并列出 `La vida breve` 1950、`Los adioses` 1954、`El astillero` 1961。CVC chronology 也直接记录 1950、1954、1961 的出版事件。
2. Donoso：Memoria Chilena 作者档案直接标为 1924–1996、智利叙事作家，并能回查 `Coronación` 1957、`El lugar sin límites` 1966、`El obsceno pájaro de la noche` 1970；三部作品页的身份和出版线索可打开。
3. Sabato：阿根廷国家图书馆页面支持 Rojas、1911、2011、`El túnel` 1948 和 `Sobre héroes y tumbas` 1961；CONICET 书目记录三部小说 1948/1961/1974。Cervantes 页面支持其作家、画家身份和物理学训练背景。
4. 来源均为可识别的国家/大学/官方文化机构或官方书目页面，登记为 B 类没有发现把搜索摘要、Wikipedia 或普通聚合页冒充正式依据的情况。
5. B03 没有写入影响、代表、文学运动或强主题关系；中文展示名都保留了原文题名锚点，译者、出版社、ISBN 等版本学字段未被错误地设为准入门槛。

## Required revisions

### P1 — `V1-REL-0127` 的关系类型和证据不匹配

当前迁移把：

```text
V1-ENT-0187 La vida breve --SET_IN--> V1-ENT-0197 Santa María
```

登记为 accepted/high。`SRC-0143` 的原文确实说 `La vida breve` 标志 Santa María 的建立，并说 Santa María 是**后续**叙事的大部分场景；这足以支持“建立/创设文学空间”的研究线索，但不足以直接支持“《短暂的生命》的故事设定于 Santa María”这一 `SET_IN` 语义。按项目手册，`SET_IN` 必须由原作或合格来源明确说明场景，不能由“建立一个空间”推导。

请在正式入库前采取其一：

- 找到直接说明该作品与 Santa María 场景关系的合格来源，并把证据写入关系；或
- 删除/转为 `hold` 或 Geo/Curation 候选，暂不建立 accepted `SET_IN`。

可供补证的官方 CVC 入口是 [CVC Santa María](https://cvc.cervantes.es/literatura/escritores/onetti/santa_maria/default.htm) 和 [Teodosio Fernández 的 CVC 文章](https://cvc.cervantes.es/literatura/escritores/onetti/acerca/fernandez.htm)，但新增来源后仍需重新判断关系词是否准确，不能只因为来源提到 Santa María 就自动改成 `SET_IN`。

### P2 — `Los adioses` 的体裁卡片写成“短篇小说”

`V1-CARD-0079.genre_or_form` 当前为 `短篇小说`。CVC 作者传记直接称其为 `novela corta`，CVC 书目也把它放在 `Novelas y novelas cortas` 下。应改为“中篇小说 / novela corta”或项目现有等价枚举；“短篇小说”会把 novella 与 cuento 混同。

### P2 — Sabato 原文姓名重音与职业表述需修正或明确记录

- `V1-ENT-0186.original_name` 当前为 `Ernesto Sabato`，但阿根廷国家图书馆和 CONICET 页面使用 `Ernesto Sábato`。请将带重音形式作为规范原文锚点，并在可用的规范化说明/搜索策略中保留无重音变体；不能让无重音版本静默覆盖来源中的规范拼写。
- `V1-FCT-0427` 写成“作家、画家、物理学家”。来源直接称其为作家和画家，并说明其物理学学习、博士和任教经历；“物理学家”是身份强度更高的归纳。建议改为“作家、画家；受过物理学训练并曾任教”，或拆成有来源的训练/职业事实。

### P2 — Santa María 的虚构分类需要来源登记更清楚

当前 `RESEARCH_CHANGE_SET.json` 把 Santa María 标为 `fictional_place` 且不写坐标，这个无坐标安全规则是正确的；但 `SRC-0143` 的登记文本没有直接使用“fictional”一词，主要支持其为叙事空间。若继续进入 Geo，应补登记一个明确称其为虚构/想象城市的合格来源，或把该分类标为 provisional/hold，直到补证。无论如何不得生成现实经纬度。

## Source and semantic notes

- Sabato 的 Cervantes 页面把 `Sobre héroes y tumbas` 写为 1962，而阿根廷国家图书馆和 CONICET 给出 1961。当前迁移对该作品年份使用 1961，并没有把 Cervantes 页面当作该年份证据，这是可接受的；请在 Batch Report/后续冲突记录中保留这一来源差异。
- Donoso 作者档案中包含较强文学史表述，但 B03 当前卡片和事实没有把“boom”“最重要”等扩展成正式关系；这一点通过。
- B03 Geo CSV 在本次 review 时尚不存在，因此乌拉圭国家行、Santa María 虚构行和关系行仍需在 Geo 阶段另行检查；尤其检查 Santa María 的 `latitude`/`longitude` 保持为空、`reality_status=fictional`，以及乌拉圭坐标/边界来源与国家节点一致。

## Follow-up gate

在 P1 关系语义、`Los adioses` 体裁和 Sabato 姓名/职业问题完成差量整改并重新运行副本迁移与主库 QA 后，才能将本批 reviewer 结论更新为 `PASS`。当前结论不是拒绝整个 Batch；作者、作品和大部分书目事实可以保留，先按最小差量整改处理。

## Follow-up review — 2026-08-20

已复核整改单、更新后的 JSON、迁移和 Geo CSV，结论更新为：**PASS**。

### Remediation verification

1. `V1-REL-0127` 已从正式 `relationships` 删除，迁移最终状态为 `V1-HOLD-0051`，`review_status=hold_needs_direct_scene_evidence`、`issue_code=HOLD_REQUIRED`，并有一条 `relation_hold_evidence` 使用 `SRC-0152`。因此未把 `SET_IN` 语义不足的关系暴露为正式关系。
2. `SRC-0152` 为可打开的 Centro Virtual Cervantes 页面。页面将 Santa María称为 Onetti 文学中的“平行世界”，并说明其在 `La vida breve` 中完成建立；它足以支持虚构文学空间分类，但没有被误用来关闭 `SET_IN` hold。
3. `V1-CARD-0079.genre_or_form` 已改为 `中篇小说 / novela corta`，与 CVC 对 `Los adioses` 的直接分类一致。
4. `V1-ENT-0186.original_name` 已改为 `Ernesto Sábato`；`V1-FCT-0427` 已改为“作家、画家；受过物理学训练并曾任教”，避免把教育/任教经历过度概括为更强的职业身份。
5. `PLACES_GEO.csv` 的乌拉圭行使用 GeoNames `3439705`，Santa María 行为 `fictional_place` / `fictional` / `hidden`，纬度和经度均为空，分类来源为 `SRC-0152` 对应 CVC 页面；`PLACE_RELATIONS.csv` 只加入 B03 的三个作者—国家关系，没有把处于 HOLD 的 `V1-REL-0127` 伪装成地图故事关系。
6. 在 `/private/tmp/lalm-b03-review2.sqlite` 上重新应用迁移：`validate_master.py` PASS，`PRAGMA integrity_check=ok`，foreign-key errors 为 0；最终计数为 entities 195、facts 434、relationships 125、sources 150、content_cards 87、relation_holds 51、relation_hold_evidence 44。`V1-REL-0127` accepted relationship 数为 0，`V1-HOLD-0051` 数为 1。

### Follow-up conclusion

本批整改已关闭原 P1/P2 阻塞项。当前没有发现新的 P0/P1 数据、来源、实体、关系或 Geo 问题。Santa María 仍应在后续产品层保持 hidden，直到有直接场景证据决定是否关闭 hold；这不阻止 B03 以本次范围进入下一阶段 QA。Reviewer 结论：**PASS**。
