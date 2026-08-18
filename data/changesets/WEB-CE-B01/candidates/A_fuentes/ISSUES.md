# ISSUES — Worker A（卡洛斯·富恩特斯）WEB-CE-B01-R-A

## 1. 关键冲突（须 Reviewer / 下一轮仲裁）

### 1.1 出生地冲突：BnF 标"巴黎"，通行说法为"巴拿马城"
- BnF 权威记录（CAND-A-SRC-01，JSON-LD birthPlace=Paris）标注出生地为巴黎；
- 任务假定与主流传记（Britannica / BBC / Wikipedia 等通行记载）为巴拿马城（父亲为墨西哥外交官，时任驻巴拿马公使馆）；但本轮这些页面全部被拦截/超时，**未能直接核验**；
- 处理：`CAND-A-FCT-07`（personal_note）以 hold 记录冲突；出生地不建 BORN_IN 关系；待第二来源（建议重试 Britannica 或打开 LC/Wikipedia）仲裁后再定值。
- 风险提示：BnF 此项 birthPlace 可信度存疑，禁止把"巴黎"当定论写入主库。

## 2. Hold / 待第二来源（解释型关系全部未达双来源门槛）

| 候选 | 类型 | 状态 | 原因 |
|---|---|---|---|
| CAND-A-REL-03 CREATED→《奥拉》 | 结构 | hold/NEEDS_SOURCE | 无任何已核验来源（BnF 可见面未现 Aura） |
| CAND-A-REL-04 文学爆炸 | 解释 | hold_needs_second_source | 0 来源 |
| CAND-A-REL-05 ASSOCIATED_WITH_PLACE 墨西哥城 | 解释 | hold_needs_second_source | 0 来源；BnF 仅标 Mexico 国家层级 |
| CAND-A-REL-06 ASSOCIATED_WITH_PLACE 墨西哥 | 解释 | hold_needs_second_source | 仅国籍单源 |
| CAND-A-REL-07 SET_IN 墨西哥城 | 结构 | hold/NEEDS_SOURCE | 无直接场景证据 |
| CAND-A-REL-08/09 墨西哥革命小说 | 解释 | hold_needs_second_source | 0 来源 |

- 未处理的主题关系（时间与历史、暴力与语言、城市浪漫与偶然、面具游戏等）：本轮 0 来源，不凑数，一律不产出候选；如后续有来源，建议按 EXPLORES_THEME 从严走双来源流程。

## 3. Gap / 未核验清单（fail-closed，勿当证据）

- 三部作品首次出版年（1958 / 1962 / 1962）：全部 pending，无已打开来源确认。
- 三部作品 genre_or_form / story_premise / setting_place / key_character：全部 gap（CAND-A-FCT-11~23）。
- author language（es）：gap（CAND-A-FCT-04）。
- nationality_history、award：gap（CAND-A-FCT-08/09）。
- 中文译本：三行全部 `pending`（TRANSLATION_AUDIT.csv），零核验。
- 中译待核线索（**非来源、勿当证据**，需下一轮打开书目页确认）：
  - 《最明净的地区》：通行记载云南人民出版社曾有中译本（译者/年份/ISBN 未知）；
  - 《奥拉》：通行记载常与《盲人之歌》合集出中译；
  - 《阿尔特米奥·克罗斯之死》：通行记载外国文学出版社曾有旧版中译。
  - 注意：以上三条来自任务包提示与 AI 记忆，仅作检索线索，不构成任何书目事实。

## 4. 重复风险
- 已用 LIKE 自查（%富恩特斯%、%Fuentes%、%regi%n m%、%Aura%、%Artemio Cruz%、%最明净%、%奥拉%、%阿尔特米奥%、%克罗斯%）：主库无同名实体，与 PREFLIGHT 查重矩阵一致，无重复风险。
- 译名规范化风险：三部作品不同中译名（如《阿尔特米奥·克罗斯之死》vs 可能的《阿尔特米奥·克鲁兹之死》等异译）不得拆成多个作品实体；正式命名时以已核验通行译本为准，异译入 aliases。

## 5. 未决问题（交 Reviewer / 下一轮）
1. 出生地到底值（巴黎 vs 巴拿马城 vs 其他）——需 Britannica/LC/Wikipedia 任一打开并仲裁。
2. 《奥拉》实体是否保留：暂无来源支撑，建议下一轮优先补 BnF 作品记录（Aura 在 BnF 有独立记录，本轮检索可见面未展示）或 Britannica 条目；补不到来源则按研究 gap 处理。
3. 中译三行全 pending，须按 PREFLIGHT 来源优先级（出版社书目 > 国图/权威馆藏 > ISBN/书业目录 > 豆瓣具体版本页）逐一补验后再定 translation_status。
4. 解释型关系（文学爆炸、墨西哥革命小说、SET_IN 墨西哥城）的潜在双来源组合待下一轮网络恢复后构建。

## 6. 合规备注
- 未写主库、未分配正式 ID、未做 git 操作、未改治理文件；本 worker 不自审自己的候选（交独立 Reviewer）。
