# WCD-10-B02 独立准入审计

2026-09-28；Reviewer：wcd10_b01_review，只读，无写库或Git。限定研究候选，不是学术完备或公开准入。

## 初审与差量

原CANDIDATES `2c04d08f9904bfe2300ed46f7e5254a24397d79bb6810e504f2707018fff8163` 内容PASS；19来源全部实际打开，Perus PDF独立打开并读完9页。10原作/合集、40事实、11直接关系与7deferred均在证据范围内。

原COVERAGE `b01bfa412903b185265e2f73b8902c77b975dc299738fe0212efef814eab6f63` 为REVISIONS_REQUIRED：遗漏《金鸡》SRC-0074/V1-CS-0080和《霍乱时期的爱情》SRC-0291/V1-REL-0309限定历史研究。返修不改旧卡、hold、事实或来源行，只修当前覆盖报告，不能称这两对象完全无A级研究。另移除W10情节的目录S09引用，仅保留直接支持S17。

独立差量在内存逆向恢复后，hash精确回到原包，确认只有指定变化；最终PASS：

- CANDIDATES `3acb01b237a75a7393519efff5558d2eb874278918575a297755de58935877f4`
- COVERAGE `7687cdbb6307a77905a71b85a18864fbab1f8ff5fb4d663cb91964b7993daa8c`
- SOURCE_REGISTRATION `dfb9371c05b0d74f4ecb7f282b14e745f356ad5a0915905e42cd4de748096e7d`

覆盖22对象：7个有限历史研究保留、15个学术研究gap；历史保留不是本轮重审或完整覆盖。S05复用SRC-0026；FCE署名转载非第二独立研究；Perus会议研究B级/同行评议NOT_VERIFIED；《金鸡》写作年争议、合集/单篇、首刊/书版与中文暂译边界保持。

Reviewer另审来源复用prepare窄差量 `e962027dbd506f13e0b1216236c6a7abeccc9002cac9f593c74393c7d5f92cd5`、共享QA `4fb9f16e16f03a6d3fd81b9e8b6eb3dc1adc0f91042c53ff640363870982a101` 和B01冻结导出测试 `9f1a1eec497c2f35a7388d86ab14ce7b5cf1d38c2a0b9de2754bcf137311ef5a` 源码PASS；PM实际70/70测试与B01QA复跑PASS，不称Reviewer运行写库测试。

## 整合门禁

候选准入通过不批准未审SQL或apply。生成0037后必须单独hash绑定审查；实际整合与验证结果另行追加。源登记文件保留生产时文字，实际独立审查结论以本审计和REVIEW_GATE为准。

## 独立SQL Review PASS

2026-09-28，Reviewer只读pure prepare逐字比较SQL/逐字段mapping，独立解析12增量表并核对主键、事实/状态/来源/卡链接。获批SQL `ffcedb4d7fbd15eebce42456bd24b908e7ce91f52b6a97fbb67ea01ae70172dc`，mapping `f2e0562660d9a0843c9eae3e9863879ecb289cebe615421c3679c642d22c8c09`，基库 `98b914d5421d40b2f20488fe988e52fb165fc02967ec1e7e816f9280ce5071d1`。

18来源全B，S05复用不改旧行；10实体/40事实/16卡/25卡源/48事实源/11关系/12证据/22gap精确对应获批候选。F08独立research_note_only；不覆盖写作年、体裁、旧研究/hold，不推导电影或解释关系。只有metadata检查点日期/批次/计数更新，版本/历史hash/公开范围不变。Reviewer没有执行SQL；PM前置8项事务/prepare/回滚/重复/来源复用/精确oracle测试实际PASS，实际写入后仍须完成全量执行QA。

## 实际执行后独立QA PASS

Reviewer绑定后库SHA `83435075f1da42f07bf03b98dd934f182fdcb75f969cf87e48e46359290cd498`、前库98b914…、已审SQLffcedb…及QA报告SHA `3e71e22c139c01593bba12338f1191296505877c34f95390790b2adc21129df3`。

不执行SQL，独立解析新增记录并与前后库19表逐值multiset比较，含metadata及仅新增0037日志，完全相同；integrity/FK PASS。19表JSON/CSV/XLSX逐值一致、22二次导出byte-identical、177公共文件byte-identical、127公开对象/新实体泄漏0。B02 QA wrapper固定基库/mapping/SQL及任务；盘点器新增卡源与关系证据入口，实际只读核对SRC-0074/SRC-0291可见，不只依赖fact_sources。窄源码差量PASS，Reviewer未运行写库测试。

PM在修正同参数构建比较后，实际完成全Python80/80、37迁移replay、validators、导出与真实production双视口Chromium60/60。详见VALIDATION；本结论不表示全61位、学术覆盖完备或新Curation批准。
