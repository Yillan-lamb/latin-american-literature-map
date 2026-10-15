# WCD-10-B01 独立准入与迁移审查

Reviewer：`wcd10_b01_review`，独立只读上下文；候选审查2026-09-26，迁移差量审查2026-09-28。Review不是执行证明。

## 候选内容

- 原包 SHA-256 `46b0739aa42e57a5e5b7598907de02a5205e83abd667c373582435ec2ffb092a`：PASS。9对象、45事实及10关系；F09撤回首书版限定，仅记1979 UNAM书版。来源范围重叠、不算双独立研究及 S24原刊/PDF署名/OJS差异明确。
- 补证 SHA-256 `afca3a2a81012943fd92fef4babd4207abaa6dec1e8cc8be03f38e0e46a12e3d`：PASS。S25—27、1952随笔集 Otras inquisiciones及其3事实/CREATED、F19沙之书集合描述；不混同1925作品、同名短篇、当代再版。
- SOURCE_REGISTRATION SHA-256 `adb2a168f2b82bffcdddef563b27d1af00e88d0a94d961f5c87e161a280ac65a`：PASS。未知页面年空值、具体版次不冒充页面日期；S06正文西语。仅25实际使用来源分SRC，S19/20保留版本hold不入正式来源。

## 迁移返修及最终 PASS

初版SQL未执行。Reviewer发现card_sources错误列及缺主键、card_facts漏状态、F18未单列栏目；返修后独立差量结论PASS，无剩余阻止此次迁移的问题。

- SQL `0036_wcd10_b01_author_works.sql` SHA-256 `2bbb93a2b2bfd3a8ffed9906c5db11d94b08d2d78d363c295aa310658eed0ffc`。
- COVERAGE SHA-256 `a976218827c047b4a8cc005418d23e4a83d0fbbc7d0ba1145548e03cd2de4428`。
- INTEGRATION_MAP SHA-256 `563a7cd8aa89c91cb6898f16ee15543b7d713788cd1a97821e96b767061ba2f3`。
- 生成器 SHA-256 `f5963a2cb529d6f292be92af019113921440f8aae90161ded10291c5a6a72523`。
- 迁移前主库 SHA-256 `a8c54e3c0e04a347f310d7f0f969dfba758f575008fa64c1789e43b26bf378cc`。

Reviewer实际只读EXPLAIN 19/19、117前置guard、静态主键/引用/49卡事实状态检查均通过，纯内存prepare重建SQL及映射一致。卡来源26正式ID从现有最大后缀分配，只有F18来源研究支持yes；IMS/CVC关联落实独立性键。F18在独立research_note_only栏目，不形成自动策展批准。

26作品（16旧+10新）逐对象覆盖记录完整；19目录/机构评论对象学术缺口另记，连同5 deferred新增24 gap。既有A级研究仅沿用，不冒称新核验；Testimonios书目缺口、原hold、预算、公开边界保持。可据此做有边界的批次执行收口，不要求强行补足新研究，不得称作品学术覆盖完备。

metadata.sha256为未改动的V1.0.0历史表hash，不能作为当前内容digest。当前完整性由基库SHA、SQL审核SHA、迁移日志、replay和确定性导出承担。

## PM执行验证

临时库实测17/17原候选/迁移测试通过，含实际执行、原行保留、失败回滚、重复执行拦截及reviewed hash gate；补QA负例后WCD-10共22测试、全Python63/63。实际apply/replay/exports/公开边界及治理见`VALIDATION.md`。

2026-09-28独立只读实际QA结论PASS（有边界执行）：19表导出逐值一致、21非SELF manifest文件hash/size一致、296条SQL新增记录逐行命中、旧行/许可metadata/hold保留；177公开文件前后目录不同且无共享inode，全部byte-identical，127公开对象新实体泄漏0。原QA弱断言经精确SQL重放和metadata/日志/同目录保护补强；负例测试返修为修改真实value_text列。Reviewer未重跑PM浏览器或会写临时库的测试，不冒称独立重跑。

不授权Public Release、Tag、合并或部署；独立审核通过只是Research-only整合准入。
