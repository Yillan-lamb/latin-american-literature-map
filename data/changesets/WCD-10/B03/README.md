# WCD-10-B03 有边界候选

TASK-108；2026-09-29。独立候选、SQL及工具返修PASS后已实际apply；PM执行QA、独立执行/浏览器证据/治理审计均PASS，有边界执行验收完成；不是公开准入或学术完备。

- 科塔萨尔 V1-ENT-0073、卡彭铁尔 V1-ENT-0074、巴尔加斯·略萨 V1-ENT-0114。
- 基库是 B02 后库 SHA `83435075f1da42f07bf03b98dd934f182fdcb75f969cf87e48e46359290cd498`；已有17作品/合集逐项保留来源链。
- CANDIDATES：22来源候选（SRC-0039复用）、12新作品/合集、54原子事实、12 CREATED、8 SET_IN；10项 deferred。COVERAGE：全部29对象，不把出版目录当A级研究。SOURCE_REGISTRATION区分网页年、作品年、现版年。
- MECHANICAL_CHECK、独立候选、0038 SQL/map和工具返修均PASS；实际apply后库SHA079deee47063d2435bdaafe1b3c1dca24ca8b6c7353acc1427075bf0ce86746d；PM完整执行门禁见[AUDIT](AUDIT.md)与[VALIDATION](VALIDATION.md)。冻结mapping的准备期状态不回写。
- 新增中文名称仅候选暂译；两单篇有归属Dillon说明仍为research_note_only，同一论文不是第二来源。旧hold不升级，电影情节不倒灌原作；首刊/书版不确定性明确保留。
- 日期、唯一非空旧作者卡metadata回退/provenance及辅助包hash强校验均独立PASS，旧批精确重放不变。准备期尚未登记0038引发链失败，实际入库后99/99复跑通过，未弱化断言。38迁移/19表重放、19表三格式、22确定性导出、177公共文件byte-identical/新增对象泄漏0、Chromium60 PASS/4预览SKIP；目录证据不等于学术全集完备。

仅隔离Research库追加0038，Curation/公开范围不变。沿用未发布Research development train；不创建PR/合并/发布。动态状态及后批解锁只在USER持久根目录的project/internal/TASKS.md，不能复制ignored治理文件到Git。
