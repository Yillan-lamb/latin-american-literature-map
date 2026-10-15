## 2026-10-15 — WCD-10最终审计与合集类型修正（TASK-127 / TASK-105）

- 61位固定作者、21批内容扩充与W03/共同作者必要回补完成有边界终审；初审15个多文本容器的work类型经新0058迁移改为collection，并同步15卡的类型及显示。实体ID、年份、来源、事实、关系角色和691合理gap保全，旧候选/迁移/审计不改写。
- 当前796实体、2686事实、770关系、795来源、824卡；累计WCD10新增419对象、1659事实、436关系。58迁移/19表完整重放、三格式各19表、22文件重复导出与173Python测试通过。固定时间重建177公共文件逐字节一致，仍127公开对象/139路由、新公开0；WebJSON按已验证输出更新。
- 新增漂移回滚/重复拒绝回归及精确类型修正QA；最终[审计](./data/changesets/WCD-10/FINAL_AUDIT/FINAL_AUDIT.md)和[逐作者矩阵](./data/changesets/WCD-10/FINAL_AUDIT/AUTHOR_MATRIX.md)形成可复核收口。Research-only边界工具与既有批次门禁一并交付；未将本地外部交付材料或内部治理源纳入提交。
- FINAL_REENTRY冻结验证流按精确字节制品保存，不对原始末尾换行做文本规范化；原流及既有SHA保持。
- 版本影响：保持Research1.5.0development、Schema0.4、WebData0.3和Web0.6.0；本次为同一Development内容目标下的分类型修正，没有新增公开能力。PublicRelease继续暂停，无合并、tag、release或部署。

## 2026-10-15 — WCD-10 FINAL_REENTRY 实际回补（TASK-127 / DEC-070）

- 基于B21后冻结库（SHA-256 `559b1858b7b5e647b4b313f841be8d2960cf3a5eacf2a2dd92c6161668da706c`）新增W03作品`V1-ENT-0798`、3项事实`V1-FCT-2690`—`2692`、Paz的普通CREATED关系`V1-REL-0771`、ELEM S18来源`SRC-0797`、Research卡`V1-CARD-0824`及作品研究缺口`V1-GAP-0691`。原子首发年没有新增事实，旧缺口`V1-GAP-0123`不变。
- 以受控追加为既有作品`V1-ENT-0591`记录Amado参与关系`V1-REL-0772`，复用`SRC-0652`并新增证据`V1-EV-1156`；原实体类型`work`未改。仅1条新来源；候选S07/S12未使用或登记。
- `0057_wcd10_final_reentry.sql`实际apply一次，数据库由上述基线更新至SHA-256 `5a410850fed0ffa936db1de135e3872fa1f53a5a3a3b294927eb902db2b3b12c`，当前796 entities、2686 facts、770 relationships、795 sources、824 cards、691 gaps。WCD-10 B01—B21加本次累计新增419 objects、1659 facts、436 relationships。
- source/content、SQL disposable-clone、actual独立审查分别通过21、72、89项检查。57迁移/19表全量重放通过，19表JSON/CSV/XLSX、22个重复导出、177个公开文件和2个Web JSON逐字节核验通过；新增公开对象0，保持127个公开对象/139条路由。零参数QA wrapper仅执行一次，16步全部exit 0。完整记录见[审计](./data/changesets/WCD-10/FINAL_REENTRY/AUDIT.md)、[验证](./data/changesets/WCD-10/FINAL_REENTRY/VALIDATION.md)和[执行审查](./data/changesets/WCD-10/FINAL_REENTRY/EXECUTION_REVIEW.md)。
- QA通过本地嵌套路径wrapper绑定FINAL_REENTRY审核Gate后调用共享`qa_wcd10_checkpoint.verify`；没有修改产品工具，不声称硬绑定BNN的reviewed-checkpoint CLI直接通过。TASK-127仍待终审，WCD-10 umbrella保持`IN_PROGRESS`。未执行Git操作或发布。
- 版本影响：继续保持Research 1.5.0 development、Schema 0.4、Web Data 0.3和Web 0.6.0；本次回补在已授权的Research扩充批次内完成，没有Schema或公开产品变化，Public Release继续暂停。


## 2026-10-15 — WCD-10-B21 Research实际整合（TASK-126 / DEC-070）

- Gallegos（V1-ENT-0360）单作者最终冻结包通过来源内容与actual数据独立审查：新增8个Research对象（6部作品、2部合集）、28项事实和8条普通CREATED关系；4项来源候选为3个新来源和SRC-0275复用；新增11张Research卡、12个研究缺口。3个既有作品完整闭包保全，11条coverage主作品记录和1项延期候选保留；没有额外关系或受控共同作品附件。
- 唯一0056迁移从冻结基线`db16fe4f5faaafcfca3b02b42c52d56bb9b11d63704d2de49201d1f328e0a0ba`实际apply一次，数据库更新至`559b1858b7b5e647b4b313f841be8d2960cf3a5eacf2a2dd92c6161668da706c`。正式SQL SHA-256 `da790a3b0b829f30969a67c6f4c2f58925e156e501ed4a53f68cff40580d2cee`，mapping SHA-256 `b4b742072eab15435f7e6cb86fe2016d41ed633a9c12c6f96e9ef150978dc8ea`。prepare用REVIEW_GATE；实际apply经独立clone CHECKPOINT_REVIEW授权。328项actual数据审查PASS。
- apply raw stdout为109 bytes，SHA-256 `f5f42b068a60cfb8c2e06fc824fae5864c9e5a54734a6e922581da0d1e97acf4`；raw stderr为0 bytes。零参数post-apply QA wrapper仅运行一次，16步全部exit 0；56迁移/19表独立完整重放通过。完整replay raw stdout SHA-256 `4b139c7f31eb6fe66e606c89568110e2fa2be16ea6ea1c42c76cd38169bf3932`；格式化replay日志SHA-256 `2353d7eb5200018046b8989b8d0bfa7e2424aa73718f517c55ad590fe09bf959`，格式化日志不代替raw stdout。19表JSON/CSV/XLSX一致，22个重复导出文件逐字节一致，177个公共文件逐字节一致；新增公开对象0，仍为127个公开对象和139条路由。两个校验通过的Web JSON已逐字节复制。QA报告SHA-256 `a40de6e2ca81ab99774bc44400108d3975f6b7771172ba984671a72deda04b37`。
- B21后累计新增418个对象、1656项事实和434项关系；批次/作者登记21/21、61/61完成。W03版本注记与直接归属回补、B08 Amado0172→既有0591归属仍待实际回补，TASK-127未完成，WCD-10 umbrella仍为`IN_PROGRESS`。Research 1.5.0 development、Schema 0.4、Web Data 0.3、Web 0.6.0及Public Release暂停不变；未执行Git提交、push、合并、发版或部署。

## 2026-10-14 — WCD-10-B20 Research实际整合（TASK-125 / DEC-070）

- Peri Rossi（V1-ENT-0346）、Telles（V1-ENT-0358）与Icaza（V1-ENT-0359）最终冻结输入按批准顺序整合：新增10个作品/合集对象、45项事实、10条普通CREATED关系和1条受控共同作品参与作者关系；13条来源候选中10条为新来源，另复用SRC-0267、SRC-0268、SRC-0271；新增19张Research卡和22个研究缺口。9个既有作品来源、事实、关系与卡片引用闭包保全，19条coverage主作品记录及3项候选延期保留。普通关系roster为10项；受控补边独立记录，不混入普通候选关系。
- Telles对既有作品V1-ENT-0592（《Os sete pecados capitais》）的V1-REL-0762仅表示参与作者，描述不主张独著。边使用既有SRC-0638及SRC-0271；未增添作品对象、事实、卡、来源或重写旧来源。母级422项实际数据独立审查PASS，复核实际源、事实、卡片、角色和旧闭包；数据库共787 entities、2655 facts、760 relationships、791 sources、812 cards、678 gaps。
- 0055迁移仅实际apply一次，exit 0；数据库从冻结基线`264385afd29d43f6d160d852a9dc6ad685fa2bd5fa25e3e7d7575168ebb72032`变为`db16fe4f5faaafcfca3b02b42c52d56bb9b11d63704d2de49201d1f328e0a0ba`。母审阅`REVIEW_GATE.json`（SHA-256 `bd86dd8e96eb18bc8d98ac508d28600cd93efe332e64194adf40109561ecd915`）授权prepare；disposable-clone复核后生成的`CHECKPOINT_REVIEW.json`（SHA-256 `c737cd9dfc59374af2d887bf0914e293a4106e540a6f693f8404da220f6befbe`）绑定实际apply。canonical SQL SHA-256 `2f288075cac14d73f38075fe41ac12ca353e2e5194069c2ab89a881d6df2bdc3`，mapping SHA-256 `064253f82fbcea513180180727c2d604b116f0f1252166f1782284d12eba3a87`。
- Apply raw stdout为109 bytes，SHA-256 `cc8033caac59f566a0772ca076cec4ae4d3d54aa3872f9536112bd81429802b5`；stderr为0 bytes，SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`。零参数post-apply QA wrapper仅运行一次，16步全部exit 0；55迁移/19表全量重放通过。完整replay raw stdout SHA-256 `3f5769a41bac5c99b7756c4062168acdb1ce2a2f6c3c645d596f3d8d2177361a`；格式化replay日志SHA-256 `4c48eeb4d8e6668075b19531c0c127fc9f251adc6c87b85a59a88a99840c6746`，格式化日志不代替raw stdout。19表JSON/CSV/XLSX一致，22个重复导出文件逐字节一致，177个公开文件字节一致；B20新增公开对象0，保持127个公开对象和139条路由。两个校验通过的Web JSON已逐字节复制。actual QA报告SHA-256 `73a1ab7fc8c0418ba0727221a483b372dc8e78ff947febeb0b384593030575f9`，母实际数据独立审查报告SHA-256 `9453306ddb6ff222fac88e0464a241307c903eec01c8d8171336649d602f5329`。
- B20完成后累计新增410个对象、1628项事实和426项关系；20/21批、60/61作者，余1批1作者。Gallegos（B21）及W03版本注记与直接归属回补、B08 Amado0172→既有0591归属仍待实际回补和TASK-127仍待完成。Research 1.5.0 development、Schema 0.4、Web Data 0.3、Web 0.6.0及Public Release暂停不变；未执行Git提交、push、合并、发版或部署。

## 2026-10-14 — WCD-10-B19 Research实际整合（TASK-124 / DEC-070）

- Arenas、Sepúlveda与Nettel最终冻结候选按批准顺序整合：新增13个作品对象、42项事实和13条CREATED关系；19条来源候选中13条为新来源，另复用SRC-0261至SRC-0266；新增16张Research卡和23个研究缺口。9个既有作品的来源、事实、关系与卡片引用闭包保全，22条coverage主作品记录保留，并保留1项候选延期和1条coverage延期。新增内容保持Research-only。
- 0054迁移仅实际apply一次，exit 0；数据库从冻结基线`8e2c26422a219990c8e397005ebd4e2c8499181f657b63f53cdb70af3e99d016`变为`264385afd29d43f6d160d852a9dc6ad685fa2bd5fa25e3e7d7575168ebb72032`。母级410项实际数据独立审查PASS。零参数post-apply QA共16步且全部exit 0；54迁移/19表全量重放、JSON/CSV/XLSX各19表、22个重复导出文件及177个公共文件逐字节核验通过；B19新增公开对象0，保持127个公开对象/139条路由。两个校验通过的Web JSON已复制并逐字节核对。
- prepare使用WT `REVIEW_GATE.json`（SHA-256 `6a338e18690db0b56efeabc937db03d9aabc2a01284e4f9cb18a048e86c8f279`）；disposable-clone SQL审查后生成的`CHECKPOINT_REVIEW.json`（SHA-256 `b534e48c05d4f20eb70381c80a360e70f6ece92995bf66127863ca8720647739`）用于actual apply。Apply raw stdout SHA-256 `2bf8eb93e8f1cf2f543333f0f2338c20495ef19a967185fae123e4f7f67c9686`，stderr为空。Full-54 replay raw stdout SHA-256 `eade9e2b63c9cface495275bc0f1b5893195d50b49b758da5ccccd67e9e78fd4`；格式化replay日志SHA-256 `91801072f1a422faa3668457909fd9299ccd7374db6f5101b8916f0ff884a98e`。母实际数据审查报告SHA-256 `a562bf5b5ecb9ff86ab6adf509d8c02d10a25ebad69f8e4ed348c6af9781959e`。
- 本批初次merge preflight在写出文件前因author candidate顶层status不同而停止；仅观察到combined输出字符串，stdout/stderr未分别保存，stream separation为`NOT_VERIFIED`。获准合并后按最终冻结包与统一批级边界完成，原作者文档及manifest/hash资料保留。WCD-10-B01—B19累计新增400对象、1583 facts、415 relationships；19/21批、57/61作者，余2批4作者。W03版本注记与直接归属回补、B08共同对象归属及TASK-127仍未完成。Research 1.5.0 development、Schema 0.4、Web Data 0.3、Web 0.6.0及Public Release暂停不变。未执行Git提交、push、合并、发版或部署。

## 2026-10-14 — WCD-10-B18 Research实际整合（TASK-123 / DEC-070）

- Sor Juana Inés de la Cruz、Julio Ramón Ribeyro与Juan José Saer冻结候选经来源/内容审查后按批准顺序整合：新增21个作品/合集、69项事实；9条来源候选中6条为新来源，另复用SRC-0253、SRC-0254、SRC-0256；新增24张Research卡和31个研究缺口。9个既有作品的来源、事实、关系与卡片引用闭包保全；30条coverage主作品记录保留。21条关系增量均为对象创建所带入的CREATED关系，额外关系计数为0。文学值、来源档案与事实来源映射按冻结输入保真。
- 0053迁移仅实际apply一次，exit 0；数据库从冻结基线`1bc4695f6c77cad166b5229572f73490006b9e4392379e0017f799049e5aceb0`变为`8e2c26422a219990c8e397005ebd4e2c8499181f657b63f53cdb70af3e99d016`。母级553项实际数据独立审查PASS。零参数post-apply QA共16步且全部exit 0；53迁移/19表全量重放、JSON/CSV/XLSX各19表、22个重复导出文件与177个公共文件逐字节核验通过；B18新增公开对象0，保持127个公开对象/139条路由。两个校验通过的Web JSON已复制并逐字节核对。
- prepare使用`REVIEW_GATE.json`（SHA-256 `e7a79aef82383cdf5e22fd764546f0972b237e10a35c5982949c3193b45808f6`）；disposable-clone SQL审查后生成的`CHECKPOINT_REVIEW.json`（SHA-256 `c50ff8a205918f8cba03820afe9f25b4a111f1a5e2a34b7850c05b5c1f178395`）用于actual apply。raw apply stdout SHA-256 `5a86b7f97d2349370a864d793346edcbce8e2a35b819b50ceb08dea5faf203ad`，stderr为空；格式化full-replay日志SHA-256 `2839e365fae66710f6eda76b0979e009c0ceabc531e94c0e6cfcd86f64fc76c6`，full-53 replay raw stdout SHA-256 `587a6476f591d3a39defdd6f811ecd926da03b0120ba1b67d88772e63674ce7e`。格式化日志不代替原始stdout。实际数据独审报告SHA-256 `8b1fce61c65386d1134602acda5019ee666e504754c1e5f2d8ee2591747b91ef`。
- 当前主库共764 entities、2568 facts、736 relationships、768 sources、777 cards、633 gaps。WCD-10-B01—B18累计新增387对象、1541 facts、402 relationships；18/21批、54/61作者，余3批7作者。Research 1.5.0 development、Schema 0.4、Web Data 0.3、Web 0.6.0及Public Release暂停不变；W03版本注记与直接归属回补、B08共同对象归属及TASK-127仍未完成。未执行Git提交、push、合并、发版或部署。

## 2026-10-14 — WCD-10-B17 Research实际整合（TASK-122 / DEC-070）

- Guillén、Lezama与Cabrera冻结候选经来源/内容审查后按批准顺序形成边界明确的Research增量：新增16个对象、62项事实；10条来源候选中7条为新来源，另复用SRC-0245、SRC-0246、SRC-0248；新增25张Research卡及26个研究缺口。9个既有作品的来源、事实、关系与卡片引用闭包保全；25条coverage主作品记录及2条deferred_objects记录保留，作者候选deferred为1项。16条关系增量为对象创建所带入的CREATED关系，额外关系计数0。来源、claim与候选ID映射、角色及卡片引用经母级实际数据核验，文学值未为适配审计接口而改写。
- 0052迁移按TASK-122及父审批准参数在WT主库仅实际apply一次，exit 0；数据库从冻结基线`bf814eb0796ad27db76349a4f166ba3ca40be3df47f22373e6e094e34bdf632e`变为`1bc4695f6c77cad166b5229572f73490006b9e4392379e0017f799049e5aceb0`。母512项实际数据独立审查PASS。16步post-apply QA全部exit 0；52迁移/19表全量重放、三格式各19表、22个重复导出文件与177个公共文件逐字节核验通过；B17新增对象公开0，保持127公开对象/139路由。两个校验通过的Web JSON已复制并逐字节核对。
- 全量执行记录列出唯一apply和16项QA命令。原始apply及QA流分别按路径/hash保存；格式化replay日志记录命令、退出码、raw流路径与SHA，不嵌入raw正文。完整52迁移replay的raw stdout SHA为`98f112889be2c0bf6436bfee1c7148c78d9985cbafb6dcee35e6f07960e7f2ec`，formatted replay日志SHA为`6c5fdc7dd20c899490d2c0f2ca55c37ba2c281136c51d7f3473c95b939995282`。母独立审查报告SHA为`974c95588c845992231d2e7ff1af77c51e3c24bde8a7896626ddad973a6d6d6b`。
- 本批过程记录3次内容/审查读取修正（preview混合分类；旧card joins按完整old facts字段重建并与冻结库9条joins核验；版本提示不等于来源网页日期）及1次实际审计接口读取形状适配；父方使用保存的实际流完成复核PASS。prepare实际使用WT的`REVIEW_GATE.json`（SHA `1e8ff2c95bd64a144ba443710901f26225630a98f3b8504cb64b72a3f3251cda`）；SQL disposable-clone审查通过后生成的`CHECKPOINT_REVIEW.json`（SHA `7431aa87145134a83eed26f5c407b6e2c4cbbae4b594c102e77690c1aa42c253`）授权actual apply。最初曾在ROOT路径下查找Gate，母方澄清WT正式Gate路径后完成核验与prepare，没有失败prepare。本文仅陈述可核实的本批记录，不推断所有读取调用均有完整持久化raw流。未重跑apply或QA。
- 后库共743 entities、2499 facts、715 relationships、762 sources、753 cards、602 gaps。WCD-10-B01—B17累计新增366对象、1472 facts、381 relationships；17/21批、51/61作者，余4批10作者。W03版本注记与直接归属回补、B08共同对象归属及TASK-127仍未完成。Research 1.5.0 development、Schema 0.4、Web Data 0.3、Web 0.6.0及Public Release暂停不变。无Git提交、push、合并、发版或部署。

## 2026-10-13 — WCD-10-B16 Research实际整合（TASK-121 / DEC-070）

- Zambra、Paulo Coelho、Carlos Drummond de Andrade的冻结候选按批准顺序形成有界Research增量：新增17个作品/合集、65项事实、17条CREATED关系、13个新来源并复用SRC-0239、SRC-0242、SRC-0243、SRC-0244；新增25张Research卡和28个研究缺口。9个旧作品及闭包保全，coverage保留26条作品主行，2项deferred不变。全部新内容保持Research-only。
- 来源注册沿用作者语义与来源档案，canonical reuse记录不改旧来源行。矩阵原73行按65个fact group及6个CREATED归属组分类；其中2条双来源claim的refs仅用于reader聚合。Coelho旧卡片关联从主库旧事实核验。S103的辅助DEDUP候选与实际SRC-0242复用差异记入provenance；SOURCE_REGISTRATION执行字段根展平，原作者注册文档与合包初稿均保留。母方读取接口03/04/05尝试失败流保全；06 merged内容审查、07 disposable-clone SQL审查、08 actual data审查通过。
- 0051由Integrator依TASK-121与父审批准参数apply一次，exit 0；数据库从baseline `51966400aa4e9de43867e2b5c684b873be811857945151a6bc5592c2b915e7fb`变为`bf814eb0796ad27db76349a4f166ba3ca40be3df47f22373e6e094e34bdf632e`。484项SQL克隆审查及531项实际数据独立审查均PASS。16步post-apply QA全部exit 0；51迁移/19表全量重放、三格式各19表、22个重复导出文件与177个公共文件逐字节核验通过，新B16对象公开0。
- 正式主库共727 entities、2437 facts、699 relationships、755 sources、728 content cards、576 gaps。B01—B16累计新增350个作品/合集、1410项事实和365项关系；16/21批、48/61作者，余5批13作者。W03版本注记与直接归属回补、B08相关工作及TASK-127仍未完成。Research 1.5.0 development、Schema 0.4、Web Data 0.3、Web 0.6.0、Curation边界及Public Release暂停不变。无Git提交、push、合并、发版或部署。

## 2026-10-13 — WCD-10-B15 Research实际整合（TASK-120 / DEC-070）

- Arlt、Schweblin、Enríquez的冻结候选按批准顺序形成边界明确的Research增量：新增14个作品/合集、47项事实、14条CREATED关系、11个新来源并复用4条既有来源；新增17张Research卡和25个研究缺口。9个既有作品及其来源、事实与关系闭包保全。登记的作者冻结包、候选、来源档案和证据矩阵均按父审绑定；source scope仅支持本批核实内容，不声称学术全集。
- 覆盖记录原始24行中，Arlt作者身份行V1-ENT-0286按批准保留于provenance附录，23个作品主行及顺序保留。两项延期和原有hold/gap维持；4项来源复用canonical记录，11项新来源写入，未升级来源等级或公开准入。正式实体ID为V1-ENT-0699—0712；事实ID映射、source joins、关系证据及旧对象闭包可由B15 integration map和审计记录追溯。
- 0050迁移由Integrator按TASK-120及父审批准参数实际apply一次，exit 0；数据库从基线`651f89688eeba195a4332ee6611cc51478c2c3aeae7fd5b2391069283a0cea92`变为`51966400aa4e9de43867e2b5c684b873be811857945151a6bc5592c2b915e7fb`。父381项disposable-clone SQL审查与426项实际数据独立审查均PASS。16步post-apply QA全部exit 0；50迁移/19表重放、三格式各19表、22个重复导出文件和177个公共文件均通过逐字节核验，新B15对象公开0。
- 父级compact reader的07/08/09接口尝试失败，分别涉及QA compact命令绑定、apply绝对路径字段及replay日志的stdout格式；失败原始流保全。Integrator未重跑apply或QA；父后续10号exact compact-shape验证PASS，并记录17项命令与原始流绑定。执行与完整replay原始stdout SHA分别为`bbbe3b414c4e801a0e4ae75661872b7c70a5a5a5de4f217c9876f3a8e9dbf079`（apply）及`654bf41c05404174aad03ef901793840656e47d91a346ee73dfd3e3cc12c950a`（50迁移重放）；格式化replay日志SHA为`bce0e4302007bcfa6a6c7aa2d7853d0ed2af629c7509ef816b6127a59452953d`。
- B01—B15累计新增333个作品/合集、1345项事实和348项关系；15/21批、45/61作者，余6批16作者。W03版本注记与直接归属回补、B08相关工作及TASK-127仍未完成。Research 1.5.0 development、Schema 0.4、Web Data 0.3、Web 0.6.0、Curation边界及Public Release暂停不变。无Git提交、push、合并、发版或部署。

## 2026-10-13 — WCD-10-B14 Research实际整合（TASK-119 / DEC-070）

- Aira、Puig、Ocampo的冻结候选按批准顺序写入0049：新增14个作品/合集、51项事实、17条CREATED关系、9个新来源、14张Research卡和25个研究缺口；SRC-0227与SRC-0228按批准canonical reuse复用，未改既有元数据。关系增量包括14条普通新对象归属，以及既有V1-ENT-0493、V1-ENT-0494上的3条共同作者/编者归属重入（V1-REL-0668—0670），没有重复建作品、事实或卡片；8条source joins与8条relationship evidence引用4个原有正式来源。
- 研究边界保持明确：Aira两项材料延期，三条出版社来源说明保留为版本信息而非首发年；《Autobiografía de Irene》的1946/1948及《Espacios métricos》的1942/1945年份分歧保留注记，首发年原子值留空。SCOPE/合理研究缺口与既有hold不被升级。全部新增内容保持Research-only。
- 数据库从基线`c7b5951beb2e2a30053b08d84e07931547b8909a1e5a180086fafeedebaea677`变为`651f89688eeba195a4332ee6611cc51478c2c3aeae7fd5b2391069283a0cea92`：696 entities、2325 facts、668 relationships、731 sources、686 cards、523 gaps。母方401项disposable-clone SQL审查、411项实际数据审查均PASS；主库integrity及foreign-key检查通过。正式apply一次且exit 0，16步post-apply QA全部exit 0；49迁移/19表全量重放、JSON/CSV/XLSX各19表、22个重复导出文件、177个公共文件均通过逐字节核验，新B14对象公开0。
- B14过程的3次合包命令错误、2次只读审计读取器接口错误及父首次`source_objects` reader失败均保留真实原始流；最后的合包、SQL准备、apply和QA均成功。Aira早期R1中无支持的开篇/1998主张保留为`NOT_VERIFIED`，最终R3以New Directions直接页面记录2008英文版信息；Ocampo冻结R2未改，母审批准的coauthor附件只修正SRC-0512定位至59–60行并移除独立性措辞。无Git提交、push、合并、发布或部署。
- WCD-10-B01—B14累计新增319个作品/合集对象、1298项事实和334项关系；14/21批、42/61作者，余7批/19作者。W03版本注记与直接归属回补、B08相关任务及TASK-127仍未完成。Research 1.5.0 development、Schema 0.4、Web Data 0.3、Web 0.6.0、Curation边界及Public Release暂停不变。

## 2026-10-13 — WCD-10-B13 Research实际整合（TASK-118 / DEC-070）

- Bolaño、Galeano、Piglia的冻结候选按批准顺序形成有边界的Research增量：新增24个作品/合集、104 facts、24个CREATED关系、22个新来源，并复用既有SRC-0211与SRC-0214；新增33张Research卡和36个研究缺口。9个既有作品及闭包保全，3项延期保留。该批只支持普通书目、体裁、归属和有界直接来源描述，不声称学术穷尽。
- 25个候选来源中24个映射；Anagrama的Bolaño作者页候选S002虽已实际阅读，但未支撑本批获准内容，因此不登记主库。书目目录来源只支持其记录范围；未确定首发年份继续留空，Jaulario暂缓，不推断未知信息或提升来源等级。
- 原始七文件合包分别保存在本地Integrator证据`/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/orchestration/wave-10/integrator/MERGED_INITIAL/`与ROOT `/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B13/MERGED_INITIAL/`。父审发现Galeano W102 research_refs含未映射S102，并发现Piglia coverage事实使用`refs`而正式候选契约为`source_refs`；获准后只移除该W102引用，并将33行104条coverage事实按候选身份、值、引用和顺序机械同步。候选及证据矩阵保持原哈希，作者冻结包未改。
- 0048迁移由Integrator实际apply一次，exit 0；数据库从B13 baseline `74a900c2988eec78a700467bc70c5e523a774cd4fa615cfc5edfdd16991ff8f7`变为`c7b5951beb2e2a30053b08d84e07931547b8909a1e5a180086fafeedebaea677`。父676项SQL克隆审查和686项实际数据独立审查均PASS。正式post-apply wrapper的16步全部exit 0；48迁移/19表全量重放、三格式各19表、22文件确定性重复导出、177个公共部署文件逐字节一致通过，新B13对象公开0。
- WCD-10-B13期间3次合包预检脚本错误均发生于任何输出之前；两次只读审计接口尝试因读取器形状假设退出，未写候选或数据库；第二次审计失败的独立原始流未找到，标记`NOT_VERIFIED`，本条不声称所有失败原流均已保存；一次辅助同步脚本错误也发生于写入前。父首次合包审核识别W102过期S102与coverage引用字段差异，获准同步后通过。父实际数据读取器两次格式适配失败及原始stderr均保存在/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B13/parent_logs；修正后独立审查PASS。Integrator失败证据见`/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/orchestration/wave-10/integrator/FAILED_*`；未复制B12的prepare或preapply-QA事件。
- 研究内容保持Research-only；catalog-only边界、未知年份留空、旧有hold及合理gap保留。Research 1.5.0 development、Schema 0.4、Web Data 0.3、Web 0.6.0、Curation范围及Public Release暂停不变。B01—B13累计305对象、1247 facts、317关系；13/21批、39/61作者，余8批22作者；W03、共同作品归属重入与TASK-127仍未收口。无Git提交、push、合并、发版或部署。

## 2026-10-13 — WCD-10 B12 Research实际整合（TASK-117 / DEC-070）

- Juan José Arreola、Elena Poniatowska、José Emilio Pacheco的冻结候选经父内容/来源与合包审核后，按0047迁移新增22个作品/合集、101 facts、22个CREATED关系、12个新来源、31张Research卡和37个研究缺口；3项来源按规范化URL复用既有记录且不改其元数据，9个旧作品及来源/事实闭包保全。16个来源候选档案中15个进入映射；CEPE作者页S203虽经阅读，但未用于任何获准内容，因此未登记为主库来源。6项延期保持明确：四项Pacheco作品首发年冲突保留待核，V1-ENT-0265既有争议年份标记只补其他获支持字段，*Tarde de agosto*的独立作品身份与首发年仍待直接书目依据；不推断首发年或独立作品身份。
- 合包coverage从原始32行修正为31个唯一主行：删除唯一一个空`candidate_facts`的重复W001辅助行，保留完整主行；31行candidate_facts均按冻结候选事实身份/值/引用机械同步。原始7文件合包保存在`MERGED_INITIAL`；作者冻结包、CANDIDATES和证据矩阵未改。SOURCE_REGISTRATION仅新增获授权的6项根级执行元数据，16个profiles逐值逐序不变；父已基于更新后的registration重新绑定Gate。
- 0047精确SQL仅apply一次，exit 0；数据库从基线SHA `7152ecc903ef7b610440a5173b0dd79d28ce25358b53ffa42512da6eb615db67`变为`74a900c2988eec78a700467bc70c5e523a774cd4fa615cfc5edfdd16991ff8f7`。父643项disposable-clone SQL审核与671项实际数据独立审核均PASS。正式post-apply QA为16项且全部exit 0；47迁移/19表重放、三格式19表、22文件重复导出、177个公共文件字节一致均通过，新B12对象公开0。
- 早期一次prepare因SOURCE_REGISTRATION缺少6项根元数据exit 1，未生成SQL/map或写库；R0原文/流保留，获准机械补齐后重绑Gate并重试成功。另一次误将无CLI的QA wrapper传`--help`导致11项preapply检查（10通过、reviewed checkpoint 1失败），当时主库仍为baseline且未apply；产物和全部raw streams已单独归档，不混入正式post-apply QA。父reader wrapper shape适配的首次失败也保留；未发生产品数据或正式工具修改。
- Research 1.5.0 development、Schema 0.4、Web Data 0.3、Web 0.6.0、Curation及Public Release暂停保持不变。WCD-10 B01—B12累计281对象、1143 facts、293 relations；12/21批、36/61作者，余9批/25作者；W03版本注记与直接归属回补、共同作者作品归属重入及TASK-127仍未收口。无Git提交、push、合并、发布或部署。

## 2026-10-13 — WCD-10 B11 Research实际整合（TASK-116 / DEC-070）

- Benedetti、Pitol、Arguedas三位作者的固定候选经一次父来源/内容审核后，按批准的0046迁移追加17个作品/合集、80事实、17个CREATED关系、9个新来源、28张Research卡和27个研究缺口；4个来源候选复用旧源，11部旧作完整保全，3项有边界延期保留。Arguedas传统故事条目保留编纂/记录者边界；普通作品版本缺口继续作为gap。新内容未获Curation或公开准入。
- 后库`7152ecc903ef7b610440a5173b0dd79d28ce25358b53ffa42512da6eb615db67`：636实体/2069事实/605关系/688来源/608卡/425 gap。父536项精确SQL克隆审核、546项实际数据独立审核及必要QA通过；SQLite/FK、46迁移19表全量重放、JSON/CSV/XLSX各19表、22文件重复导出和generic checkpoint QA通过。固定日期重建的177个公共部署文件逐字节相同，新17对象公开0，127公开对象/139路由/82趣闻保持。
- 合包coverage的`object_ref`与28条主行`candidate_facts`按已冻结作者候选机械同步；W002事实顺序按事实身份对应，W105补齐候选已有的F04书目注记。候选、作者原包、来源profiles、证据矩阵及既有旧事实闭包未改。父读取器针对作者matrix/profile/provenance既有形状仅修读取适配。一次相对数据库路径的Web构建退出1，随后绝对数据库路径重试退出0；apply本体实际exit 0且仅执行一次。STATUS相对路径写入失败保留证据；migration replay原始JSON输出与约定格式化日志均留存并绑定哈希。首次失败记录未被覆盖。
- Research 1.5.0 development、Schema 0.4、Web Data 0.3、Web 0.6.0、Curation和Public Release暂停不变。累计WCD-10 B01—B11为259对象/1042事实/271关系，11/21批、33/61作者；余10批28作者，W03版本注记及直接归属回补、共同对象归属重入和TASK-127尚未完成。无Git提交、push、合并、发版或部署。

# 变更日志

本文件记录拉丁美洲文学地图各版本的实际修改。格式参考 Keep a Changelog，版本号遵循语义化版本规则。

## 2026-10-12 — WCD-10 B10 Research实际整合（TASK-115 / DEC-070）

- Martí、Parra、Pizarnik三位作者候选经一次父来源/内容审核及窄修后，按批准的0045迁移追加12个作品/合集、54事实、12个CREATED关系、19新来源、20张Research卡和25个研究缺口；4个来源候选精确复用旧源，10部旧作完整保全，3项有边界延期保留。新增研究内容未获Curation或公开准入。
- 后库`062c0cb663e27765085a85eb8cb63baee848a91e6d94bb261550327b00a5036c`：619实体/1989事实/588关系/679来源/580卡/398 gap。父413项SQL克隆和418项实际数据审核通过；SQLite/FK、45迁移19表全量重放、JSON/CSV/XLSX各19表、22文件重复导出和generic checkpoint QA通过。固定日期重建的177个公共部署文件逐字节相同，新12对象公开0，127公开对象/139路由/82趣闻保持。
- 按DEC-070调整候选验证器：书目可由`first_publication_year`或非空`bibliographic_note`支撑，体裁、受限简介、事实值和来源引用仍分别校验；B10真实正例、移除年份与书目注记的负例及B09原基库正向兼容回归均通过。Martí W002 coverage漏同步的旧`entity_layer`行已冻结原稿，并只机械替换该行`candidate_facts`为冻结候选中的三项事实；原候选和证据矩阵未改。父W001别名/QA字段guard误判已限于父审脚本修正且历史记录保留。
- `Data 1.5.0 development candidate`、Schema0.4、Web Data0.3、Web0.6.0、Curation和Public Release暂停不变。累计WCD-10 B01—B10为242对象/962事实/254关系，10/21批；剩余11批31作者、W03版本注记及直接归属回补、共同对象0493/0494/0591/0592归属重入和TASK-127最终审计未完成。无Git提交、push、合并、发版或部署。

## 2026-10-12 — WCD-10 B09 Research实际整合（TASK-114 / DEC-070）

- 三位Luna隔离生产拉莫斯/巴列霍/达里奥候选，父一次批次来源与内容复核后由single Integrator实际0044追加8作品/合集、42事实、8 CREATED、4新来源、17卡和17gap，5旧源复用；9旧作及完整旧来源链保全。拉莫斯监禁时期表述收窄，达里奥保留完整合集题名，巴列霍1918/1919既有冲突不擅改。
- 后库`41f895012a71cec9cab831e1717e5f3ec0306100d95acf2ac34c9eccac5a4d3b`：607实体/1935事实/576关系/660来源/560卡/373gap。父328项SQL克隆、333项实际数据/证据审核、SQLite/FK、44迁移19表全量重放、三格式导出/22repeat和generic checkpoint QA通过；177公共文件逐字节相同，新8对象公开0，127公开对象/139路由/82趣闻保持。无工具/产品变化，不重复全站browser或无关tests。
- 初次父optional ID和日志格式guard误判、最初命令记录遗漏全量replay均留痕；仅修审计比较并实际补跑，原输入/历史报告保存。父BNP单页重开失败如实标明，其年份/对象另有已实读直接依据。
- README、主库说明、审计/验证、TASKS和交接同步，9/21批有边界验收；后续新聊天B10开始。W03年份未定的真实回补及共同对象0493/0494/0591/0592归属重入保持。Research1.5.0 development、Schema0.4、Web Data0.3/Web0.6.0、Curation与Public Release暂停不变，无Git提交/push/合并/发版/部署。

## 2026-10-12 — WCD-10 B08 Research实际整合（TASK-113 / DEC-070）

- 复用已审Quiroga R5/Machado R6/Rosa R5，一次批次集中复核合包与完整接口；普通有依据的内容无需重新文学研究。Luna按精确0043 SQL/map实际追加91作品/合集、323事实、91 CREATED、112来源、100卡及86gap；角色和旧来源链保真，16延期保留。
- 实际后库`af6c293aa32d86143f2be6f4c4ed414799086f8878df22b13a7356397ebd6050`：599实体/1893事实/568关系/656来源/543卡/356gap。独立SQL克隆与实际执行、SQLite/FK、43迁移19表重放、三格式导出/22文件repeat、generic checkpoint QA通过；177公共文件逐字节相同，127公开对象/139路由/82趣闻不变。未改工具/产品，按DEC070不重复全站浏览器矩阵或无关测试。
- 先前三次prepare失败/原包与父审guard误判、一次validator错输入均留痕；必要纠正后通过，不覆盖历史。共同作品正式0591/0592及直接证据已绑定，Amado/Telles归属重入仍开放；B07共同对象与W03回补也保留，1972/1974原子年份不擅选。
- README、主库说明、批次审计/验证、持久TASKS与交接同步；后续按批次新聊天。Research1.5.0 development、Schema0.4、Web Data0.3/Web0.6.0、Curation与Public Release暂停保持，未commit/push/合并/发版/部署。

## 2026-10-12 — WCD-10 实用内容扩充与聊天交接（DEC-070）

- 按USER指示调整后续执行：普通书目、归属及简介有一项可靠直接依据即可补入，作品专门学术研究可选，不再追求穷尽核验或多轮辅助字段返工。已抽看既有Reader与主库机构来源实例，Spec同步当前优先口径。
- 验证聚焦数据/引用/迁移/导出与公开边界，按实际工具/产品改动选择工程测试；合理未解项保留。年份未定可留空并分版本注记，避免整部作品因原子口径等待而缺失。旧冻结数据/报告保留。
- 建立持久接续文件，以新聊天承接剩余阶段，避免两个聊天并写。Research/Schema/Web版本和Public Release状态不改。

## 2026-10-12 — WCD-10 覆盖接口检查补全（TASK-113）

- B08第三次prepare实际exit1：15条Machado新增作品主行缺research_status/research_refs；无SQL/map及数据库写入。父前序审计漏查已更正留痕，原作者/合包与门禁、三次真实失败记录保留，新作者窄修待独审。
- 作者及合包检查要求每条主行研究状态、唯一可解析引用列表及适用的非空gap说明；补充Spec明确后增作品也须满足相同接口，不把来源A等级自动升格为学术覆盖。父实际Q5/Rosa5各1587/838断言PASS，MachadoR5实际1512断言检出30缺字段，不能称整批已准入。
- builder23a2a5e1、研究库0150e68e与既有版本/公开范围保持；Luna仅新R6修覆盖接口，B08未DONE。

## 2026-10-11 — WCD-10 coverage 历史快照严格保全（TASK-113）

- B08已审103条coverage包含100唯一作品主行与3条旧对象完整快照；原prepare因此退出1，未产生SQL/map或数据库写入，失败记录保留。修复builder明确分类主行与快照，原候选/coverage/Gate哈希不改、映射保留全部证据，只有主行参与来源及gap准入。
- 快照必须与唯一主行和只读基库entity/facts/cards/关系/来源/hold/gap逐值一致；拒绝新对象快照、重复主行/包装、潜藏研究引用与内容变异。旧origin ID合法保留、数组排序不作为内容差异。父独立审读与49项定向测试实际PASS，真实基库103→100+3分类PASS，DB0150e68e未动；B08再次prepare、SQL审计与入库QA尚待，不标批次DONE。
- 同步WCD-10 Spec。Research/Schema/Web版本、Curation和Public Release暂停保持，不改历史迁移、作者冻结包或原合包。

## 2026-10-10 — WCD-10 B07 Research检查点实际入库（TASK-112 / DEC-060 / DEC-069）

- 三位Luna作者的Sabato R3、Bioy R8、Roa R5经父来源语义审核，合并候选1815项逐值/旧链断言与机械exit0通过；0042 SQL克隆732项及六处角色描述/证据说明核验后实际追加54对象、200事实、54 CREATED、88来源、63卡、76研究缺口。编纂、选编、后编日记及合著角色显式限定，两个年份冲突保留对象级书目注记。
- 105来源候选中96用于准入内容/coverage（8复用、88新增），9仅延期不分配ID；41显式延期与35对象研究缺口保留。萨瓦托15项延期仅将原status逐字映射为disposition，原字段/作者冻结包不改；先前整包/Gate与失败准备日志保留。Luna Integrator首次SQL准备因usage-limit失败，父接管机械prepare/apply/QA，不能冒称由Luna实际执行。
- 当前SQLite SHA0150e68ee98e28714a7719129aab7d47e137fc692e8e46a5e1db29540f5dbc07，508实体/1570事实/477关系/544来源/443卡/270gap。实际19表与独立克隆一致（仅log时间不同）；42迁移19表重放、161项Python、JSON/CSV/XLSX各19表、22文件重复导出、generic checkpointQA均实际通过。
- 公开177文件逐字节不变，新54对象公开0；127公开对象/139路由/82趣闻保持。实际本地HTTP177文件字节比对和Chromium桌面/移动各30 PASS、2明确preview SKIP、0意外失败，完整64记录父核；仅127.0.0.1临时服务器验证后关闭。首轮sandbox端口绑定PermissionError及relative-db构建/准备参数错误保留，正确授权/参数后完整验证通过，不臆断原因。
- Root库a8c54e3c保持，Research1.5.0 development、Schema0.4/WebData0.3/Web0.6.0、Curation及Public Release暂停不变，无Git/发布/部署。W03 USER政策及真实回补、B07共同物件跨作者归属仍为TASK127必要项；本批最终执行证据及治理独审通过，有边界验收完成，7/21；下一批B08解锁盘点与研究，B09+仍逐批依赖，不称阶段完成。

## 2026-10-10 — WCD-10 未明确出版者值保真（TASK-112）

- 来源prepare允许明确登记的publisher空字符串，避免以host/机构推造出版者；字段缺失、null或非字符串仍拒绝，format/language仍要求非空字符串。既有Schema和数据库字段不变。
- 新增临时候选与精确Gate实际prepare、SQL克隆apply与空publisher读回，以及无效类型/缺失字段拒绝、默认出版者和历史B01兼容测试；父独立定向13项及全回归161项均实际PASS，含prepare/clone读回及默认兼容。
- 同步WCD-10 Spec；冻结作者包、候选source profile、原库/历史迁移、Curation和公开/版本范围不改。B07整包和SQL仍待独立准入。

## 2026-10-10 — WCD-10 直接关系角色描述窄修（TASK-112）

- 迁移构建器支持经审核候选的可选`created_description_zh`，将编纂、选编或日记作者等角色保存到既有CREATED描述/证据说明；缺省保持历史模板，避免角色限定在SQL阶段丢失。验证器拒绝空白或非字符串。
- 主代理实际重跑24项候选/迁移测试（含prepare→SQL→临时克隆库精确读回和缺省兼容），以及25项研究说明/来源复用/追加勘误门禁测试，全部通过；父实际完整Python回归158项亦通过。B07候选与实际整合仍待本批独立审核；原库/历史迁移未改。
- 同步WCD-10 Spec契约；Research/Data/Web/Schema版本、Curation、既有公开范围及Public Release暂停不变。


## [WCD-10-B06 execution checkpoint / versions unchanged] - 2026-10-08

### TASK-111 / DEC-060 / DEC-069 · 作者作品研究整合

- 父代理对Amado R3、Onetti R3、Donoso R2及合并候选独立审核通过后，按准确0041 SQL/map实际追加28实体、117事实、28 CREATED关系、50来源、37卡和43 gap；59来源候选中8复用、50新增入库，S219仅属延期材料且未分配来源ID。38对象coverage、18延期及B-only研究缺口保留；117条事实值/引用、旧来源链和来源profiles均按审核候选保真。
- 实际主库现为454实体、1370事实、423关系、456来源、380卡、194 gap，SHA `ea9e01b41b4faaef727a6159b6d34ba7d9121a9992fda1cb993c6574f91f6a27`。父代理核验19表与独立apply副本一致并通过实际数据库审计；41迁移/19表重放、154项Python unittest、JSON/CSV/XLSX各19表及22文件重复导出、固定参数Web/public验证均通过。
- 首次公开构建exit0但B06派生包的一个肖像副本为空；源文件、B06 BEFORE和B05 AFTER哈希相同，仅修复B06生成副本。首次QA失败保留，父代理修复后重跑generic checkpoint QA通过；不推断构建空文件的原因。首次浏览器端口冲突与未完整重试报告及trace保留；改用文件记录访问日志、预读并长度核对177项后串行运行desktop/mobile，各30项通过、各2个既有WCD08 preview条件跳过，零意外失败。早期间歇响应未被因果定位。
- 父代理最终执行证据/浏览器报告及治理审核PASS，B06有边界研究验收完成；累计77新对象343事实89关系142来源119卡170新gap，下一批仅解锁B07盘点/研究，B08+保留逐批依赖。Research1.5.0 development train、Schema0.4、Web Data0.3、Web0.6.0、Curation与公开范围不变，无公开发布。

## [WCD-10-B05 Research checkpoint / versions unchanged] - 2026-10-07

### TASK-110 / DEC-060 / DEC-069 · 第五批有边界研究整合

- 帕斯、阿斯图里亚斯、阿连德候选与精确0040 SQL/map经主代理独立审核后，由Luna Integrator实际追加8作品/合集、44事实、9关系、14来源、15卡和29gap；主代理65项候选、177项SQL克隆与161项实际整库断言通过。F16追加1950 Cuadernos Americanos/1959 FCE书目注记，旧FCT-0309、来源链与HOLD-0043保留，未作结构化取代或旧来源修复。
- W03《El mono gramático》完整候选冻结，1972法译/1974西语原版口径仍待USER；当前迁移不收入该对象，以唯一政策gap追溯。其裁决后真实回补仍是阶段最终验收的必要义务，不能以本批有边界收口代替。
- 首次实际QA因工具混同候选Reviewer与SQL Reviewer而拒绝正确日志；修复只将独立SQL Gate的Reviewer传入精确日志核验，历史默认行为保留，错误/缺失Reviewer仍拒绝。失败报告保留；主代理16项定向与154项全Python测试实际PASS，40迁移19表重放、JSON/CSV/XLSX各19表、22确定性导出及177公共文件逐字节相同通过。
- Luna实际production Chromium桌面/移动60 PASS、4既有preview条件SKIP、零失败；主代理独立核实际报告/断言及公开QA。内部完整Web Data重建为426实体/1253事实/395关系/406来源/343卡；127公开对象、139路由和82趣闻保持，新8对象公开泄漏0。
- 批次AUDIT/VALIDATION/EXECUTION_REVIEW、README、主库说明与本地TASKS/交接同步，沿用DEC060/069及既有Spec回补义务；Charter冻结不改。本批有边界DONE、5/21，下一批B06解锁；研究学术gap保留，不称61位或本阶段全部完成。
- Research1.5.0 development train、Schema0.4、Web Data0.3与Web0.6.0保持；未改变读者产品/公开范围，无commit/push/合并/Tag/Release/部署。

## [WCD-10 tooling final review / versions unchanged] - 2026-10-07

### TASK-110 / DEC-069 · 完整覆盖输入与逐批门禁

- 修复覆盖表独有候选来源未进入builder来源映射的问题：完整coverage引用现在经过相同登记、等级与URL复用校验；未知来源和不准登记的来源仍拒绝。新批主Review Gate必须整体PASS，不能用子包PASS覆盖主门禁失败。
- 勘误回归使用单独冻结的B05前置库，不再跟随未来可变主库；保留FCT-0309旧值及来源链断言。主代理独立重跑WCD-10全套111项测试PASS，包含完整B05 prepare和旧B01—B04 SQL/map精确重放；主库45e8d72c未变。
- 当前只完成工具及准备审核，未新写研究事实、SQL或真实PASS候选门禁。W03跨语种年份尚待USER；采用完整候选暂存方案准备其余整合，W03回补仍是阶段最终验收义务。
- Research1.5.0 development train、Schema0.4、Web Data0.3和Web0.6.0保持；修复不改变公开产品或字段政策，无Git提交、合并或正式发布。

## [WCD-10 remaining-batch execution / versions unchanged] - 2026-10-03

### TASK-105 / DEC-069 · 子代理执行与独立审计

- USER 授权 Codex 接手剩余 B05—B21 与全量审计，以 GPT-6 Luna 子代理实际执行、主代理独立审核；WCD-10 Spec 补充文件分工、串行基线和阶段验收，不解除候选、SQL、实际数据及公开边界门禁。
- builder 新增逐项绑定的 research_note 材料分类门禁，仅直接 A 级研究来源可映射 scholarly_paraphrase；新批次缺审核、等级错配或候选漂移均拒绝。旧 B01—B04 仅在完整冻结输入匹配时保持原 SQL/map。
- 新增通用 reviewed checkpoint QA，显式核对各批基库、SQL、map、任务和路径，复用既有逐表精确重放及三格式导出/公开包验证。主代理独立重跑研究注记 8 项与 checkpoint 15 项测试均 PASS，包含实际 prepare、历史回放与同计数错值拒绝。
- 尚未增加本轮正式研究事实。追加勘误入口仍在实现复核中，不将工具测试当作 B05 迁移准入；现有版本 train、Schema、Curation、公开范围与 Public Release 暂停不变。

## [WCD-10-B04 Research checkpoint / versions unchanged] - 2026-09-29

### TASK-109 / DEC-060 · 第四批候选研究

- 聂鲁达、富恩特斯、米斯特拉尔12旧对象按完整来源链盘点后，形成9新作品/合集、38事实、9 CREATED与1 SET_IN候选；15实际打开的使用来源中复用SRC-0070，其余14拟新增。21对象逐项coverage、版本/层级/首刊歧义及合理研究gap明确；机构、代理、出版社与讲演片段不冒称独立A级研究。
- 候选机械检查PASS，独立语义复核进行中；0039、实际写库、导出/生产QA仍NOT_VERIFIED，不能标记批次DONE或解锁后批。Research Master此阶段仍为B03后库，旧行/hold/已准入关系/Curation不改；版本及公开范围不变，无Git提交/发布。
- 独立初审要求将Loyola署名释义F07改为research_note分类，已返修并新增中性F11描述，当前39事实；Aura覆盖明确novella而非short story，等待精确hash差量批准。写库前Python99/99、精确数据库备份及177文件production基线核对通过，不能当作执行后验收。
- 上述返修三包已获独立精确hash PASS，0039与mapping只读准备完成。临时库发现复用来源证据标题不一致，生成器窄修为引用既有规范title，不修改候选包或旧sources；B04九项及B02/B03/B04组合26项测试PASS，旧批冻结SQL/map精确再现不变。SQL/工具差量独立审核中，尚未写库或完成本批。
- 独立SQL/工具复核PASS后实际追加0039：14来源、9作品/合集、39事实、10直接关系、13卡、24gap；旧行/hold/Curation与历史迁移保留。当前418实体/1209事实/386关系/392来源/328卡，导出为独立B04未发布检查点，不覆写旧包。
- 首次公开QA拦下Desolación的新研究描述进入既有公开subject的备用正文，并影响卡片/来源/搜索/排序。窄修Web与部署构建器的研究专用投影隔离，保留完整Research及原有非WCD10的provisional内容；新增“既有公开subject前后完整public payload不变”回归，不用新ID检查替代。导入兼容问题一并返修，110/110 Python、39迁移19表replay、19表三格式/22确定性导出、177public文件全同/新9实体泄漏0、production Chromium60 PASS/4既有预览SKIP；公开隔离及actual数据QA独立PASS，最终浏览器/治理门禁待收口。
- README、主库说明、Spec、批次审计/验证及本地TASKS/交接按实际执行同步。沿用DEC-060，Charter不改；Research1.5.0 development train、Schema0.4/Web Data0.3/Web0.6.0及公开范围保持，不因检查点或隔离修复升版，无commit/push/PR/合并/发布。
- 最终浏览器证据/治理独立PASS：实际64records/60PASS4条件SKIP、139路由断言、177public全同与数据hash确认，未冒称Reviewer重跑PM110/60。TASK109有边界DONE、进度4/21，保留24gap及旧hold；下一批仅解锁B05只读新基线与研究，B06+锁定，不表示全部61位或学术完备。

## [WCD-10-B03 Research checkpoint / versions unchanged] - 2026-09-29

### TASK-108 / DEC-060 · 第三批研究整合

- 科塔萨尔、卡彭铁尔、巴尔加斯·略萨的22来源候选、29对象coverage与0038独立Review通过后实际追加12作品/合集、54事实、20直接关系、21来源、19补充卡与28gap；Dillon公开全文新读仍复用SRC-0039，不算第二源，署名说明维持research_note_only。单篇/合集/电影/引用版分层、首刊/首书版疑点和旁支错年明确排除，所有旧行/hold/USER关系保留。
- 准备工具窄修检查点显式日期、旧作者卡唯一非空metadata fallback及provenance；独立Reviewer发现辅助包hash未实比后返修为新批强校验coverage/registration绑定，错值/缺失拒绝，旧B01/B02冻结SQL/map精确重放不变。九项B03迁移测试含回滚、重复、drift、同计数错值、辅助包篡改/缺hash负例。
- 当前409实体/1170事实/376关系/378来源/315卡；PM全Python99/99、38迁移/19表replay、JSON/CSV/XLSX各19表与SQLite逐值相同、22确定性导出文件、Web/public validators与production Chromium桌面/移动60 PASS/4预览条件SKIP。相同参数177公共文件byte-identical、新研究对象公开泄漏0；独立post-apply逐值审计、浏览器证据和治理核对最终PASS，TASK-108有边界执行收口，不声称学术完备或全61完成。Reviewer未重跑PM99/60。
- Research保持1.5.0未发布development train、Schema0.4/Web Data0.3/Web0.6.0及公开范围不变；旧检查点不覆写，目录证据不冒充学术完备。没有commit/push/PR/合并/发布。README、主库说明、Spec和批次审核验证同步，沿用DEC-060，不改锁定Charter或无关外部CSV。

## [WCD-10-B02 Research checkpoint / versions unchanged] - 2026-09-28

### TASK-107 / DEC-060 · 第二批有边界研究整合

- 卡斯特利亚诺斯、鲁尔福和马尔克斯候选、来源登记、覆盖差量与0037 SQL经独立Review PASS后实际追加：10作品/合集、40事实、11直接关系、18来源、16补充卡、22gap；同一ELEM来源复用SRC-0026，旧数据/hold/Curation不改写。《金鸡》写作年争议、《永恒的女性》首版/首演、《上校》首刊/书版保持；署名B级会议研究不提升A级或公开准入。
- 独立审查发现覆盖报告遗漏《金鸡》卡源研究SRC-0074与《霍乱时期的爱情》关系证据SRC-0291，修正为限定历史研究保留/not fresh review，非“没有A级研究”；22对象中7份既有研究保留、15学术gap与7deferred不称全部研究完成。盘点器增加卡源/关系证据/具体来源入口及回归，避免只看事实源产生遗漏。
- 当前研究库397实体／1116事实／356关系／357来源／296卡。独立实际逐值QA、全Python80/80、37迁移/19表replay、JSON/CSV/XLSX各19表、22导出文件确定性、Web/public validators与真实production Chromium桌面/移动60/60 PASS；同参数公开包177文件byte-identical、新实体泄漏0。一次不同预览横幅参数的QA拒绝已定位并按相同参数重建，未改读者内容绕过检查。
- 来源准入prepare增加canonical URL显式复用和拒绝歧义/错误目标/静默升格；B02专用QA固定自身基库/mapping/SQL/任务，B01导出回归保持冻结快照。同步README、主库说明、Spec、本批AUDIT/VALIDATION与USER持久TASKS/交接；DECISIONS无需追加，沿用DEC-060。Charter/无关外部CSV/根目录用户改动不动。
- Research仍为1.5.0未发布development train（最终正式Data判级在汇总节点），Schema0.4、Web Data v2-web-0.3、Web0.6.0不变，无Schema/reader-facing变化；不扩大公开范围，不提交/push/PR/合并/Tag/Release/部署，Public Release继续暂停。不表示61位或全集/学术覆盖完成。

## [WCD-10-B01 Research checkpoint / Data 1.5.0 development train] - 2026-09-28

### TASK-106 / DEC-060 · 首批有边界研究整合

- 博尔赫斯、李斯佩克朵和加罗候选/补证经独立语义Review，来源登记和SQL返修复核PASS；实际追加0036迁移，新增10作品/合集、49事实、11直接关系、25来源、19补充卡及24gap。原行、hold、Curation保留；1979 UNAM书版不称首书版，署名研究说明不构成自动策展批准。
- 当前研究库387实体／1076事实／345关系／339来源／280卡。新建wcd10-b01-checkpoint三格式导出不覆写旧快照；19表逐值相同，22文件确定性重建相同。36迁移/19表replay、Master、完整Web Data及public validators PASS；公共production177文件与基库构建byte-identical，127公开对象、新实体泄漏0。
- 增加hash准入、事务回滚、重复执行拦截及精确SQL重放/metadata/日志/错误新增值/同目录伪比较负例；全Python63/63、真实production桌面/移动Chromium60/60 PASS。独立Reviewer只读逐行核验新增SQL、导出和公开边界PASS，不冒称独立重跑PM测试。
- 同步README、主库说明、Spec、批次AUDIT/VALIDATION和本地ignored TASKS/交接。DECISIONS无需追加，沿用DEC-060及现有规则，锁定Charter/外部CSV未触碰。本批限已知证据执行收口，19对象研究gap和5deferred保留，不称61位或学术研究全完成。
- Research保持1.5.0未发布development train检查点，正式Data版本判断留待汇总交付；Schema0.4、Web Data v2-web-0.3、Web0.6.0保持（无Schema/reader-facing变化）。不改公开范围，不创建PR、push、合并、Tag、Release或部署，Public Release暂停不变。

## [WCD-10 research candidate checkpoint / versions unchanged] - 2026-09-26

### TASK-105 / TASK-106 · 61 位核心作家补全启动

- 按 USER 授权和固定 Curation 名单启动 21 批串行研究，在最新 main 的隔离分支建立 WCD-10 Spec、只读现状盘点器与候选机械验证器。完整机械基线为 61 位核心作家、208 个现有作品/合集关联对象；不将外围影响节点纳入，也不把机械盘点误标为文学覆盖完成。
- 首批博尔赫斯、李斯佩克朵和加罗形成 24 个实际打开的来源候选、9 个作品/合集候选、45 条事实/署名研究说明及 10 条关系候选；明确暂译、同名短篇/合集、首刊/书版、旁支错年、出版者描述和学术解读边界。首批剩余研究及独立 Reviewer 均开放，B02 不解锁。
- 原候选包冻结后另存补证包：3 个来源、《Otras inquisiciones》集合及《沙之书》集合描述；内存合并机械检查为 27 个来源、10 个新对象、49 条事实和 11 条关系候选，补证仍未独立审核。只读 Reviewer 已开始原冻结包的语义审查，不把来源重叠或首书版限定视为机械校验可裁决的问题。
- 新测试 11/11、完整 Python 测试 52/52，候选机械及既有 Master validators PASS；机械 PASS 不是语义准入。正式 SQLite、迁移、导出、Curation、Web Data、site、版本号、发布状态均未变；没有新建 PR、合并、Tag、Release 或部署。根目录用户既有改动与隔离工作区外部研究 CSV 不纳入本任务。

## [WCD-11 final audit / Web 0.6.0 Development] - 2026-09-24

### TASK-128 / DEC-068 · PR #37 最终合并门禁

- 独立 Reviewer 对正式 production bundle 的 15 类路由双视口截图和 320px 宽度共 45/45 检查进行人工复核；200% 缩放代表页 7/7 PASS，发现并修复普通目录页头部在缩放下约 2px 的横向溢出。完整四浏览器 Playwright 120 PASS／8 个仅用于预览的条件 SKIP，正式 139 路由、Web Data／public bundle／WCD-09 底图与实施校验通过。
- 重新取得有效 production Lighthouse：移动首页 Performance 75、LCP 12.0 秒、CLS 0；作品页 Performance 79、LCP 5.7 秒、CLS 0；两页 Accessibility／Best Practices／SEO 均为 100。首页拼贴主图已预加载并设置高优先级，页面无显著 JS 阻塞或外部依赖；LCP 仍偏慢，经 DEC-068 记录为非阻塞性能债，不延展为本 PR 的视觉／性能重构。
- 肖像独立来源抽查发现萨瓦托 AST-028 的 Commons 页面提示美国版权可能恢复，撤回本地图片和映射并验证作家页文字 fallback；同时按 Commons 来源细化多诺索、吉马朗埃斯·罗萨署名。正式肖像从 23 减至 22，AST-024 继续不进入公共包，作品、作家及搜索的公开数据范围不变。
- WCD-11 属于实质 reader-facing 能力变更，Web Product 按章程升至 `0.6.0 Development` 并同步版本元数据／README；Research Data、Research Schema、Web Data schema、Curation 和公开收录范围不变。新增正式独立审计，更新 Spec 与素材台账；本地 ignored TASKS／DECISIONS 已同步。经审计代码 head `32a2321` 的两项适用 GitHub CI 均 SUCCESS；最终治理文档提交仍须在合并前核对其 CI。本条不表示已合并，不创建 Tag、Release 或部署，Public Release 仍由 USER 单独把关。

## [WCD-11 formal integration in progress / Web 0.5.0 Development unchanged] - 2026-09-24

### TASK-128 · compass underlay refinement

- 按 USER 对罗盘中心的最新反馈，仅从 AST-036 底纹移除中央星形罗盘，补全原处羊皮纸纹、同心虚线与放射线；外围刻度、航海装饰以及权威 Natural Earth 交互地图保持。将正式站点与视觉回归指向无星形的 v2，更新素材哈希台账，v1 从公共包移除但仍可由 Git 历史恢复。此为同一 WCD-11 正式集成分支／Draft PR #37 内的局部视觉返修，不改变 Research Data、Schema、Web Data、地图几何／中立性、公开范围或 Public Release；Web 继续为 `0.5.0 Development`，正式合并门禁不因此自动通过。

## [WCD-11 formal integration in progress / Web 0.5.0 Development unchanged] - 2026-09-18

### TASK-128 / DEC-067 · visual approval and production integration contract

- USER 已批准 PR #36 的视觉候选，但判定其仅为 preview artifact、不得合并；#36 已关闭而未合并，预览分支与截图保留供正式实现对照。
- 从实时核实的 `origin/main @ 6e1d882` 建立独立 `codex/wcd-11-formal-integration` 分支，并新增 `project/plans/WCD_11_FORMAL_INTEGRATION.md`：约定生产数据与 WCD-09 地图权威边界、全路由矩阵、素材许可、CSS 整理、时间线年代语义以及构建/浏览器/Lighthouse/地图/独立审查门禁。
- 正式 `site/` 第一段已迁入母版暖白纸纹与首页文化图像、调整共同刊头／首页图版；素材逐件复算哈希并在 `docs/web/WCD_11_ASSET_ADMISSION.md` 留下许可与署名边界。公开搜索移除前 80 项截断，时间线展示全部公开作家／作品事件，新增类型＋年代组合筛选并将文学爆炸写作年代窗口而非流派归属；浏览器断言改为支持正式站点子路径。
- 生产构建器同步生成新版共享刊头、页脚与首页图片预加载，避免只改 `site/index.html` 时正式路由仍采用旧壳；23 张经母版核验的作家肖像接入正式目录及详情，图片下方显示来源、作者和许可，身份未核实并撤回的 AST-024 明确不迁入。作家页将 01–04 编排为双列专题、05 趣闻移至通栏，保留既有阅读与来源内容。档案纸原始 PNG 仅做 WebP quality 85 编码，正式资源由约 1.9 MB 降至约 100 KB，母版原件仍可从 #36 恢复。
- 当前生产衍生预览构建 139 条路由、127 个公开实体、82 则趣闻，public bundle/Web Data/WCD-09 implementation/deterministic basemap 校验通过；Chromium 桌面／移动、Firefox 桌面、WebKit 移动 96/96 浏览器用例通过。Lighthouse 本地移动模拟：首页 performance 70、作品页 76，其余传统类别均为 100；首页性能和全部页面的独立视觉／许可复审仍是开放门禁，不能据此判定 READY TO MERGE。
- 后续本地实施中，作品目录为全部 62 部公开作品／合集生成项目原创的排版式“策展版封面”，并明确标注它并非原书封面；构建器将 10 部作品集的静态路由归入作品档案模板，而非通用节点页。首页新增四位带可见来源署名的“重要作家”肖像栏，二级页刊头接入已有档案图像。针对 320px 检出的普通二级页约 3px 横向溢出，已调整装饰圆章位置；12 类代表页面的 320px 断言在四浏览器通过，更新后的完整 Playwright 矩阵 104/104 PASS，62 条作品路由移动端抽查 PASS。本段仍未通过独立视觉／许可审计。
- 非地图页不再为首屏加载约 274 KB 的 Natural Earth 地图几何，首页地图仍按需加载；加载态占满首屏，避免内容渲染时把页脚从可见区域挤走。最新正式开发构建的四浏览器矩阵 108/108 PASS；Lighthouse 本地移动模拟首页 performance 75、作品页 80，CLS 均为 0，较前一轮 70／76 有改善，但首页 LCP 12.1 秒，性能门禁仍开放。修正作品集回归测试对“正式公开包恰好 10 部”的错误硬编码，改为按构建数据检查全部作品集静态壳并抽查最多 10 部渲染；与 CI 同源的审核预览包含 53 部作品集，Chromium 桌面／移动定向测试 2/2 PASS。该审核预览仅供本地验证，不改变正式公开范围。
- “关于项目”不再沿用普通二级页长列表，而按已批准母版重组为左侧项目宣言、右侧文化图像／带署名米斯特拉尔肖像拼贴，以及下方五个阅读模块＋独立研究边界入口；原有 Natural Earth、GeoNames、de facto 边界、非法律裁决及版权说明未删减。新增浏览器断言覆盖 Hero 拼贴、肖像许可、五模块数量和研究依据展开；正式开发构建仍为 139 条 sitemap 路由、127 个公开实体、82 则趣闻，四浏览器完整矩阵 108/108 PASS，public bundle、Web Data、WCD-09 implementation 与确定性底图检查均 PASS。阿根廷国家入口、马孔多虚构空间和“三座不存在的城镇”阅读路径已完成代表性桌面视觉抽查，但这不等于国家／地点／路径全量视觉验收；首页 LCP、素材独立复核及最终 Reviewer 仍是开放门禁。
- 首页启动流程不再等待 Natural Earth 几何下载／解析完毕才显示 Hero：Web Data 就绪后先渲染首屏与地图占位，地图随后在局部挂载；地图请求失败时只显示地图内错误，不再抹去已经可读的整页内容。新增将地图请求主动挂起的四浏览器回归，确认 Hero 先出现、请求恢复后 LAEA 地图仍正常激活；完整矩阵更新为 112/112 PASS，正式包与 Web Data/WCD-09 validators 继续 PASS。Lighthouse 移动模拟为首页 75、作品页 79，传统质量项 100、CLS 0；首页 LCP 12.7 秒的元素仍是 180 KB 主拼贴图，因此本次只记为加载韧性改善，不宣称性能门禁通过。
- 素材台账复算 6 项 editorial 资源和 23 张肖像哈希闭包，并修正 AST-032 已用于普通二级页／About 却仍标为“未启用”的过期说明。Commons 许可样本抽查确认马尔克斯、奥内蒂、帕斯与阿连德条目的页面声明，同时发现 CC 肖像图注缺少改动说明；所有 CC BY／BY-SA 肖像现可见标注“缩放／色调处理”，并新增浏览器回归。其余外部身份／许可仍待独立 Reviewer 完成，不因本轮样本抽查关闭最终素材门禁。
- 首页 Hero 现于公开数据请求期间先行渲染，数据到达后保留同一 DOM 节点并追加地图与阅读内容；首页马尔克斯拼贴肖像改用统一署名组件，显示作者、原始来源、许可和处理说明。挂起公开数据及地图请求的四浏览器专项 8/8、完整矩阵 116/116、139 路由构建与 public bundle 校验通过。本机 Lighthouse 在 Chromium 启动后两次未完成报告，故本轮 LCP 改善 `NOT_VERIFIED`，性能验收仍开放。
- 对无 development-preview 横幅的正式输出再次执行 139 路由构建、public bundle、Web Data、WCD-09 implementation 和确定性底图检查，全部 PASS；同一输出的完整四浏览器矩阵 116/116 PASS，含 sitemap 全路由遍历和公开边界检查。WCD-11 Spec 据此关闭构建、路由和浏览器四项可机械验证的验收；视觉、性能、素材独立复核及最终审核继续开放。
- 新增正式路由视觉矩阵脚本：15 类页面的桌面／移动截图、320px 宽度、图片与控制台检查共 45 次，最终输出 30 张截图且 45/45 PASS；人工审视发现并修正时间线横向浏览提示不足、WebKit 移动端方向键不滚动和作品目录小屏“下一页”被挤压。时间线轨道与下拉框获得可见焦点，时间线显式处理左右方向键，移动目录页码容器可收缩；相应四浏览器专项各 4/4 PASS，最终正式包完整矩阵 116 PASS／8 个既有预览条件 SKIP。独立视觉／无障碍审核仍按 Spec 门禁，不把这轮代表性截图当作最终验收。
- USER 复核后要求将首页交互地图改为手绘罗盘图版。新增不含地理边界或文字的项目自有罗盘／海面底纹 AST-036，仅置于 Natural Earth SVG 之下；地图国家填色、墨线、衬线标签及图例协调到档案视觉系统。同步修正桌面地图右侧面板短于画布时露出异色底，以及手机端“写出来的地方”遮挡南部地图的问题，并在视觉矩阵加入底纹、13 国交互层和双视口布局断言。真实几何、投影、坐标、来源及 WCD-09 中立性边界保持不变；Web 继续为 `0.5.0 Development`，系统性 redesign 的版本判断仍待正式验收。
- 这仍是正式集成的早期 Draft 工作，不代表作家／作品／国家／地点／路径等全路由视觉验收完成，也不改变 Research Data、Research Schema、Curation、Web Data schema、公开范围或 Public Release。Web 保持 `0.5.0 Development`；系统性 redesign 的 `0.6.0 Development` 为后续实际实施后的待核建议，不因早期代码提交自动升版。

## [Data 1.5.0 / Web 0.5.0 — Development] - 2026-09-08

### TASK-099 / WCD-09 implementation

- 活动底图改为 Natural Earth 5.1.1 Admin 0 Countries 1:50m 衍生产物：源归档 SHA-256 `5fed433373581fa648920435f937d95f2d3c0200e067409c6478dcdf1b853139`，2026-09-08 获取；`scripts/build_wcd09_basemap.py` 固化下载、校验、polygon parts 拆分、批准范围与窗口筛选、五位小数量化、稳定 part ID 和重新分组，最终 GeoJSON SHA-256 为 `9a225c6be6b217bf67ab4ed687598563e8d7c405a827bcca78ede99439c67cd6`。旧 110m 文件保留为回滚资产，不再由活动页面加载。
- 地图渲染从 longitude/latitude affine 映射切换为参数化 LAEA（中心 `75°W / 11.5°S`）和统一 fit；国家标签使用 Natural Earth 经纬度锚点并经投影后通用避让，城市标签改为数据驱动碰撞处理。马德里与巴黎继续保留非地图页面/关系入口，但不再产生画布外可聚焦节点。
- 真实分离 L1/L2：48 个批准范围几何全部进入中性背景，13 个具有公开文学内容的唯一国家 code 才进入 L2 交互，35 个无内容背景保持非交互并新增“当前暂无收录作家或作品”图例。巴西统一映射为 `V1-ENT-0183`，里约热内卢父级随构建投影修正，旧 `V2-GEO-BR` 不再成为活动地图、搜索、页面或策展节点。
- 按 USER Gate 更新 16 个 GeoNames 永久实体 URL，其中 10 个弱引用转换、6 个既有永久源规范化；`V1-ENT-0052` 恰帕斯继续 `BLOCKED / CANNOT_VERIFY`。敏感或来源不足的加勒比中文名称、福克兰/马尔维纳斯双名及逐案争议注记继续不公开；地图保留 Natural Earth de facto 基线，并在地图固定区域与 About 页加入范围、来源、许可和非法律裁决说明。
- 新增 WCD-09 确定性资产构建器与实施 validator；普通 PR CI 安装锁定依赖并执行底图 `--check` 与 Web Data validator，浏览器门禁分别断言 48 个 L1、13 个 L2、35 个无内容背景、零重复 code、无背景 tooltip、LAEA 元数据、键盘可见性和标签无重叠。最终公共静态 bundle 通过 140 个 HTML / 139 条 sitemap 路由及零治理字段泄漏检查；Chromium 桌面/移动、Firefox 桌面和 WebKit 移动共 88 项 PASS、8 项按既有预览条件 SKIP。
- Web Product 因 reader-facing 底图、投影、交互模型、图例与中立性说明的实质变化，从 `0.4.1 Development` 升至 `0.5.0 Development`。Research Data 保持 `1.5.0 development candidate`，Research Schema 保持 `0.4`，Web Data schema 保持 `v2-web-0.3`；正式 `V2-PUBLIC-RELEASE` 继续 `PAUSED BY USER`，不创建 Tag、Release 或 production deployment。
- 新增 `project/audits/web/WCD_09_GEO_NEUTRALITY_IMPLEMENTATION_AUDIT.md`：CH-01—CH-25 已逐项归类为 DONE 或按 Gate 保持 BLOCKED，最终未关闭 BLOCKER / MAJOR / MINOR 均为 0，结论为 `READY FOR USER REVIEW / MERGE`。

## [Data 1.5.0 / Web 0.4.1 — Development] - 2026-09-08

### TASK-099 / Map governance and geographic neutrality

- 将经外部 AI 研究、Luna Max 整改及 Codex 独立终审通过的 WCD-09 成果，从 ignored `work/external-ai/` 晋升为 `project/plans/WCD_09_GEO_NEUTRALITY/` 下的正式实施规格；保留 00–16 证据与政策文件、17 个 USER Gate、CH-01—CH-25 工作项、可复算脚本和 8 张确定性投影图件。
- 新增 `project/audits/web/WCD_09_GEO_NEUTRALITY_RESEARCH_AUDIT.md`，记录最终裁决 `YES`、零未关闭 BLOCKER/MAJOR/MINOR，以及 6 类仍须按 Gate 或阻塞路径处理的 `CANNOT_VERIFY` 限制。
- USER 已裁决全部 17 个稳定 Gate：先选定 `C-8-OPT-1`，再授权其余 Gate 按研究包的推荐/安全路径记录。核心选择为 Natural Earth 50m、完整 provenance 链、LAEA 75°W/11.5°S、L1/L2 分离、无内容地区中性非交互背景、图外点改用非地图入口、无充分证据的敏感名称/逐案注记保持阻塞，以及大陆发布前专业评估。Gate 完成不免除来源、许可、证据、验收或独立审计，也不等于已经修改地图、数据或公开内容。
- TASK-099 进入 `IN_PROGRESS / USER_GATE`。依据 Charter 第 7 节对 governance/documentation/research-only 变更采用 Web patch 的规则，Web Product 从 `0.4.0 Development` 升至 `0.4.1 Development`；这是 WCD-09 research specification / governance-only patch，不替 USER 选择 Gate，不修改 reader-facing 内容、Research Data、Research Schema、Curation、Web Data schema 或公开范围。
- Research Data 保持 `1.5.0 development candidate`，Research Schema 保持 `0.4`，Web Data schema 保持 `v2-web-0.3`；`V2-PUBLIC-RELEASE` 继续 `PAUSED BY USER`，不创建 Tag、Release 或 deployment。

## [Data 1.5.0 / Web 0.4.0 — Development] - 2026-09-07

### TASK-103 / Author-page anecdote order

- 作者详情页将“作家的另一面”移动到“从哪里认识他 / 她”之前，使人物故事更早承接作者导语；趣闻内容、展开交互、来源面板及作者页其他板块保持不变。
- 本次仅调整既有作者页板块顺序并补充浏览器回归断言；不修改 Research、Curation、Web Data、路由、版本号、公开范围、WCD-09 或 Public Release 状态。

## [Data 1.5.0 / Web 0.4.0 — Development] - 2026-09-06

### Homepage and navigation refinement

- 主页移除完整的作家、作品目录，在“如何进入拉美文学”之后新增作家趣闻精选板块；作家页现有趣闻完整内容保持不变。
- 顶部主导航新增“作家 / 作品 / 趣闻”入口，并新增独立作家目录、作品目录和趣闻索引路由；所有路由继续仅使用既有公开投影。
- 这是已批准 Web 0.4.0 Development 范围内的布局收口；不改变 Research、Curation、Web Data schema、作家/作品/趣闻公开范围或 Public Release 暂停状态。

### WCD-08 / Author anecdotes

- USER 批准 WCD-08 Review Pack 中原 `user_review` 的 95 条候选；原有 38 条 `hold`（包括唯一 HIGH 风险项）继续暂缓，不因本次批准改变状态。
- 新增正式 `CURATION_ANECDOTES.json` 与 `CURATION_ANECDOTE_SOURCES.json`：完整登记 133 条趣闻及 119 项来源，以 USER 审核时间、正式来源 ID、事实边界和风险门禁保留可追溯性；Research Master、Research Data 版本与 Schema 0.4 均不变。
- 生产 reader projection 仅接入 `auto_approved + detail`，并进一步受现有公开作者范围约束：95 条已批准内容中 82 条投影至 24 位公开作者，另 13 条因对应作者不在公开范围而不投影。
- Web Data 升至 `v2-web-0.3`，Web 升至 `0.4.0 Development`；普通阅读层只携带标题、导语、正文、显示标签和可读来源说明，审核人、时间、风险等级、事实状态、事实边界及内部来源 ID 均不进入公开 bundle。

### Gate / release boundary

- 构建器、Web Data validator、public bundle validator、Python 契约测试与浏览器测试同步覆盖趣闻来源闭包、状态隔离、公开作者范围、字段白名单及零治理泄漏。
- `V2-PUBLIC-RELEASE = PAUSED BY USER` 保持不变；本次批准是内容接入批准，不创建 tag、GitHub Release 或 production deployment，也不自动启动 WCD-09。

## [Governance synchronization follow-up] - 2026-09-06

### Governance / process

- Charter `2.0.1` 先恢复并明确“提交前治理同步门禁”：所有可交付变更在首次 commit 前逐项检查并同步 `CHANGELOG.md`、本地 ignored `project/internal/TASKS.md`、`project/internal/DECISIONS.md` 及其他受影响入口；版本不变或 internal 不进入 Git 均不构成跳过理由。
- 依 USER 明确要求读取用户级 `~/.codex/AGENTS.md` 与 `~/.agents/AGENTS.md`（两者内容一致），将 Charter 进一步修订至 `2.0.2`；新增根 `AGENTS.md` 自动发现入口，明确标准治理文件到项目现有路径的映射，不取消 `project/internal/` 的 ignored 与本地持久边界。
- 补齐用户级基线要求：正式活跃任务必须包含目标/状态/验收标准，重要决策必须包含背景/决定/理由/影响，重大变更使用 `project/plans/` Spec，未验证结果标记 `NOT_VERIFIED`，且只有验收、验证和治理同步全部完成后才可标记 `DONE`。关联 `TASK-101 / DEC-058`。
- `scripts/safe-push.sh` 新增显式 `--allow-charter-change` 通道，解决冻结章程在 USER 已明确授权修订时仍无法走安全推送的问题；默认继续拒绝章程变更，且该参数不跳过 base、提交身份、diff 或远端 OID 校验。
- 追补 2026-09-05 已合并 [PR #27](https://github.com/Yillan-lamb/latin-american-literature-map/pull/27) 与 [PR #28](https://github.com/Yillan-lamb/latin-american-literature-map/pull/28) 当时遗漏的 CHANGELOG 记录；只新增本条，不修改 2026-09-03 及更早历史条目。
- 下述 PR #27/#28 内容严格按各自合并时点记录；PR #28 的 `USER_REVIEW` 是当时历史事实。后续 PR #29 已将 WCD-08 推进为 `DONE`，当前版本与公开边界以上方 Web `0.4.0` 条目为准。

### WCD-01—07 audit remediation / PR #27

- 修正 WCD-07 current-main rebase 候选映射与主库可追溯性，加固公开部署包对实体、事实、关系、来源状态及地图父级闭包的 fail-closed 边界，并补充相应回归测试和 QA 记录。
- Research Master、migration 与版本号未改变；Data 保持 `1.5.0 development candidate`，Research Schema 保持 `0.4`，Web 保持 `0.3.4 Development`，Web Data schema 保持 `v2-web-0.2`。

### WCD-08 guarded preview baseline / PR #28

- 新增数据驱动的作者页趣闻组件候选、本地 USER_REVIEW 预览构建器、趣闻候选/来源/风险泄漏检查及 preview-only 浏览器测试；生产 Web Data 在正式趣闻文件缺失或未获 USER 批准时继续 fail-closed。
- WCD-08 的 133 条本地候选仍保存在 ignored 工作区，其中 95 条 `user_review`、38 条 `hold`；未写入 Research Master、正式 Curation、生产 Web Data 或 public bundle。`TASK-098 / WCD-08` 保持 `USER_REVIEW`，并未完成或公开。
- 本轮不升级 Data、Research Schema、Web Data schema 或 Web Product；不创建 Tag、Release 或 production deployment。`TASK-099 / WCD-09` 继续 `LOCKED / NOT STARTED`，`V2-PUBLIC-RELEASE` 继续 `PAUSED BY USER`。

## [Data 1.5.0 / Web 0.3.4 — Development] - 2026-09-03

### Governance synchronization

- 依据历史 DEC-052 所形成、现已吸收进入 Charter 2.0.0 的规则与本次章程修订，补齐 WCD-07 PR #23 合并后的治理同步，并在 PR #24 内完成治理文档分层：更新任务登记、项目决策、README、当前网站版本元数据及本 CHANGELOG；旧章程和提案归档，历史内容不改写。
- 活跃总章程统一为 `project/PROJECT_CHARTER.md`（`2.0.0`）；V1/V2 任务映射统一收口到本地忽略的 `project/internal/TASKS.md`，决策记录统一收口到 `project/internal/DECISIONS.md`。
- 固化 Web 开发期版本规则：没有新增 reader-facing 内容的治理、文档、构建/验证、修复或 Research-only 投影变化使用 patch；新增公共内容或实质能力使用 minor；破坏公共契约或 USER 批准 Public Release 才考虑 major。

### Version / QA / boundary

- WCD-07 的 Research layer 当前为 377 entities / 1027 facts / 334 relationships / 314 sources / 261 content cards；公开 reader scope 未扩张，因此 Web 从 `0.3.3` 修订为 `0.3.4 Development`。Research 保持 `Data 1.5.0 development candidate`，Schema 保持 `0.4`，Web Data schema 保持 `v2-web-0.2`。
- WCD-07 已有完整 Playwright matrix 84/84 PASS、fresh-context `CODEX-REVIEW-WCD07-FINAL` PASS 与 PR #23 CI PASS 结论保持；本次不重新执行 WCD-07 Research，不重开 17 个 P1，不启动 P1 later / P2 / P3 / WCD-08。
- `WCD-07 = DONE`，`V2-PUBLIC-RELEASE = PAUSED BY USER`；不创建 tag、GitHub Release 或 production deployment，等待 USER 最终审计。

## [Data 1.5.0 / Web 0.3.3 — Development] - 2026-09-02

### Research / WCD-07

- 完成 WCD-07 current-main rebase：6 个 P0 与 17 个 P1 first-wave 全部完成语义去重、作品/合集/版本层级及中文展示名审计；P1 later、P2、P3 与 WCD-06 既有实体研究缺口未进入本轮。
- WCD-07A 经 fresh-context `CODEX-REVIEW-WCD07A` 最终 PASS，追加 append-only migration `0035_wcd07a_p0_major_works`；定向治理返修按正式 SOP 将 11 条来源从 A/B 校准为 B/C，并由 `CODEX-REVIEW-WCD07-FINAL` focused re-review 再次 PASS。Research 新增 6 个实体（5 work / 1 collection）、29 facts、16 sources（另复用 2 条）、6 content cards、6 条 author→CREATED 及完整关系/事实证据。
- 新增两条 B 级正式中文书目来源：人民文学出版社 2024 年《山上的狐狸，山下的狐狸》（朱金玉译，ISBN 9787020186723）与上海译文出版社 1992 年《无边的土地》（吴劳译，ISBN 7-5327-0345-2，并列原题 `Terras do sem fim`）；仅用于 `chinese_display` provenance，不创建 edition entity。
- WCD-07B 经全新 fresh-context `CODEX-REVIEW-WCD07B` 返回 `DEFER — MIGRATION GATE CLOSED`：17 项全部延后；仅修正并保留既有 `SRC-0066` 的 BnF 复用候选，不新增 P1 实体、事实或关系。内部层级说明未作为 fact 迁移。

### Version / Gate

- Research 升至 `Data 1.5.0 development candidate`；Research Schema 保持 `0.4`。
- Web Research layer 同步 377 entities / 1027 facts / 334 relationships / 314 sources / 261 content cards；公开 reader scope 未因本轮 Research 新增而扩张，Web 保持已验证的 `0.3.3 Development`，Web Data schema 保持 `v2-web-0.2`。
- Curation 重新构建并通过质量门禁；未为新增 Research 作品自动生成读者向策展内容。Public Release 继续 `PAUSED BY USER`，不创建 tag、GitHub Release 或 production deployment；不创建 WCD-08。部署包、公共边界、25/25 Python 测试与 diff 校验通过；项目原生 Full Playwright matrix 84/84 PASS（Chromium desktop/mobile、Firefox desktop、WebKit mobile）。


## [Web 0.3.3 — Development] - 2026-08-31

### Curation / Reader Content

- 完成 WCD-06：对 61 位作者、168 部现有策展作品以及 1723 条外部字段候选做 current-main rebase；外部包保持只读。
- location_note 定向二次审计后，10 条有直接地点证据的既有字段从 review 恢复为公开，2 条因引用未直接支撑地点判断而恢复 USER_REVIEW；另有 2 个新增作品/合集 location_note 维持公开。44 条 `signature_keywords` 等高判断候选未被误作低判断批量放行。
- 改写 9 个作者导语；为《家庭纽带》《最明净的地区》补入对象特异、逐字段可回溯的最小描述。作品策展范围 168→170，正式公开作品 60→62，公开搜索对象 126→128。
- 其余 36 个书目型描述、24 个零内容对象和 9 个作者文学连接登记为 69 条 Research Gap；未执行或导入 WCD-07 major-work candidates。

### Version / Gate

- Research 保持 `Data 1.4.0 development candidate`、Schema 0.4、371 entities / 998 facts / 328 relationships / 298 sources；无 migration 或 Research Master 修改。
- Web 升至 `0.3.3 Development`，Web Data schema 保持 `v2-web-0.2`；fresh-context `CODEX-REVIEW-WCD06` 经两轮 REVISE 差量修订后最终 PASS。
- `WCD-06 = DONE`，`WCD-07 = READY / NOT STARTED`；Public Release 继续 `PAUSED BY USER`，不创建 tag、Release 或 production deployment。

## [Web 0.3.2 — Development] - 2026-08-31

### Research / Network

- 完成 WCD-05 非 Schema 关系网络治理：External 51 条 hold 全量 rebase，经 fresh-context `CODEX-REVIEW-WCD05` 从 `REVISE` 修订至最终 `PASS`。
- append-only 新增迁移 `0031`—`0033`，新增 10 个去重后的来源、12 条正式关系、23 条关系证据与 14 条 hold 证据；关系增量为 `SET_IN 2 / INFLUENCED_BY 3 / ASSOCIATED_WITH_MOVEMENT 5 / EXPLORES_THEME 2`。
- 12 条 hold 标为 `resolved_to_relationship`，1 条《霍乱时期的爱情》—魔幻现实主义 hold 依据反证标为 `rejected`；全部历史 hold 保留，38 条继续 active hold。
- USER 批准 Character Schema Option A；Schema 由 0.3 加法升级至 0.4，仅新增 `APPEARS_IN`（character→work、无 inverse），并新增 DEC-050、关系类型与严格 endpoint validator。
- 建立 CS04 逐项核验 10 个 character candidate；fresh-context Reviewer 10/10 PASS 后 append-only 追加 `0034`，新增 10 条 `APPEARS_IN` 与 10 条直接证据。`key_character` facts 未批量转换；Francisco Rosas / Julia Andrade 依据正式来源纠正连接《未来的回忆》，未错误连接《阿尔特米奥·克罗斯之死》。
- zero-degree 61→41、weak-degree 225→238、connected 85→92；character 0/10→10/10、movement 0/8→5/8、theme 2/29→4/29、作者任意关系覆盖 61/64→64/64。Research 保持同一 `Data 1.4.0 development candidate`，不因 PR 内追加 CS04 机械再次 bump。

### Geo / Web / Gate

- Geo 新增《霍乱时期的爱情》→哥伦比亚、《绿房子》→秘鲁两条 `SET_IN` 投影，place relations 91→93；不新增坐标、featured point 或高判断 Curation 文案。
- Web Data research layer 同步 328 relationships / 298 sources，Web 保持 `0.3.2 Development`；`APPEARS_IN` 不生成 reader-facing prose，不改变 Curation approval、Web Schema、页面类型、公开范围与路由。
- `SOURCE_CANDIDATES.csv` 将 WCD05-SRC-03/04 访问状态统一为“此前已核验 / 当前 URL HTTP 403”，与 Reviewer 和正式 source provenance 一致；来源及已通过关系判断不变。
- WCD-05 状态为 `DONE`，WCD-06 解锁为 `READY / NOT STARTED`，WCD-07 保持 `LOCKED`。
- WCD-06 与 WCD-07 External Pack 仅登记为下游输入，未执行；Public Release 继续 `PAUSED BY USER`。

## [Web 0.3.1 — Development] - 2026-08-30

### Governance / Research Roadmap

- 完成 WCD-04 Coverage Rebalancing：将 Global Content Gap Audit rebase 到最新 Research Master，剔除 WCD-02/WCD-03 已解决或已取代事项，形成 Current Priority Matrix 以及 WCD-05 / WCD-06 / WCD-07 正式任务路由；旧审计数字不作为当前数据库状态真值。
- 后续路线固定为 `WCD-05 Entity & Relationship Network Remediation → WCD-06 Author & Work Descriptive Content Completion → WCD-07 Major Works Research Expansion`；WCD-05 为 `READY / NOT STARTED`，WCD-06 与 WCD-07 保持 `LOCKED`，不新增 WCD-08。
- WCD-07 新设为独立 Missing Major Works Research 阶段；6 个 P0 与 49 个 P1 仅为 research candidates，不是已批准入库项目，仍须完整经过 Research → Review → SQLite Migration。
- 本次只同步治理与研究规划文档，没有修改 Research DB、migration、Curation、Web Data、前端或公开范围；Research 继续为 `Data 1.3.1 development candidate`，Web 继续为 `Web 0.3.1 — Development`，不升级任何 Data/Web 版本。
- `V2-PUBLIC-RELEASE` 继续 `PAUSED BY USER`；不创建 tag、GitHub Release 或 production deployment。

### Research / Names

- 完成 WCD-03 对 371 个实体的中文展示名全量核验及 12 条原 REPLACE 的 multi-edition 复核；最终 11 条名称替换、2 条 alias 候选、1 条冲突名 HOLD。`V1-ENT-0187` 保留作家出版社题名《短暂的生命》，麦田题名《短暂的一生》登记为未来 alias/edition-title candidate。
- D 级来源仅作 discovery：豆瓣不再作为《毁灭者亚巴顿》《营救距离》的正式依据，两项改用政府采购直接书目；未合并的 `0030`/`0031` 重建为单一最终 migration `0030`。实体 ID、原文名、facts、relationship 端点/类型/证据与 Schema 不变；来源仍为 288。
- Research 从 `Data 1.3.0 development candidate` 升为 `Data 1.3.1 development candidate`；这是名称治理与小范围兼容修正，不是 1.4.0 所代表的研究范围扩张或结构性变化。

### Web / Boundary

- 核验后名称机械投影到 Curation、Geo、Web Data、搜索、页面标题和 SEO；原文名生成的稳定路由不变。
- Web 从 `Web 0.3.0 Development` 升为 `Web 0.3.1 Development`；读者可见名称发生兼容性变更，但产品范围、Web Schema 和公开对象数不变，因此不使用 0.4.0。
- `V2-PUBLIC-RELEASE` 继续 `PAUSED BY USER`；不创建 tag、GitHub Release 或 production deployment。WCD-04 仅解锁为 `READY / NOT STARTED`。

## [Web 0.3.0 — Development] - 2026-08-27

### Research

- 完成 WCD-02 全量文学空间与关系覆盖审计及 P0—P3/DEFER 优先级矩阵；不创建 Batch 18，不扩大 61 位作者 / 168 部作品范围。
- 经独立 Reviewer `PASS` 后，append-only 追加迁移 `0028`—`0029`：新增 Buenos Aires、Montevideo、Havana、Paris 4 个地点实体，9 条 author→city、4 条 work→place 与 14 条关系证据；复用既有来源，不新增 facts、sources、holds 或 gaps。
- master 达到 371 entities、998 facts、306 relationships、278 sources、255 content cards；生成 `Data 1.3.0 development candidate` 全量 CSV/JSON/XLSX 导出，V1.0.0 正式 Research Release 保持不变。

### Geo / Curation / Web

- Geo 增至 38 个节点和 91 条地点关系；四个新现实城市使用可回溯坐标，虚构空间继续为 0 个现实坐标。
- 新增 4 条低判断地点说明和 4 条地图选择；高判断内容、既有 `user_review`、3 条 `SET_IN` hold 及证据不足的解释性关系不升级。
- 针对性返修 `PUBLIC_CONTENT` evidence provenance：全量审计 WCD-02 新增的 16 个字段引用，删除 14 个仅因地点相同而机械回填、但不支撑具体文案的关系引用；仅在直接提及《光明世纪》的古巴 `reader_path` / `exploration_route` 保留 `V1-REL-0308`。
- 构建器改用字段级显式 provenance 映射；无法判断语义对应关系时保持原引用，不再把某地点全部 relationship IDs 自动追加到该地点所有内容字段。Research、迁移 `0028` / `0029` 与 Geo 均无变化。
- Web Data 增至 371 entities、306 relationships、38 places、91 place relations；Web Product 升级为 `Web 0.3.0 — Development`，Schema 保持 `v2-web-0.2`。
- 修复 Buenos Aires、Montevideo、Havana 与邻近国家名在地图总览中的文字重叠；保留城市点、键盘焦点、无障碍名称与详情入口。

### Validation / Boundary

- Research 主库、迁移重放、导出一致性、Geo/Curation/Web Data、content quality、public bundle、单元/浏览器 QA、确定性重建与前端语法验证通过。
- `V2-PUBLIC-RELEASE` 继续 `PAUSED BY USER`；不创建 tag、GitHub Release 或 production deployment。WCD-03 解锁为 `READY / NOT STARTED`。

## [Repository Multi-License Framework] - 2026-08-25

### Licensing

- 建立仓库分层授权：项目原创软件代码采用 MIT License；项目原创研究数据、文档与策展内容采用 CC BY 4.0。
- 新增仓库级多许可证说明、MIT 与 CC BY 4.0 标准全文及中文许可证边界说明。
- 明确第三方图片、引文、封面、论文、网页、数据库、地图、字体、图标及其他外部材料不因收录于仓库而被重新授权。
- `package.json` 的 `license: MIT` 仅描述私有 QA 软件包代码，不代表整个仓库采用单一 MIT License。

## [Repository Information Architecture Refactor] - 2026-08-25

### Documentation

- 将仓库对外成果说明与内部项目管理分层：`docs/` 聚焦研究方法、数据、网站与版本说明，治理、计划、任务、决策、审计和 AI 协作记录统一归入 `project/`。
- 将根 README 重写为项目主页，补充项目定位、探索维度、经数据库与完整开发预览核验的内容规模、Research → Data → Web 流程、产品状态及文档入口。
- 新增 `docs/README.md`、`project/README.md` 与 `project/audits/README.md` 等目录入口，并修复移动后的 Markdown、脚本和 CI 相关路径引用。
- 保留 `work/external-ai/` 的既有运行包路径，避免破坏仍在使用这些目录的构建脚本；仅迁移上层协作计划与接管说明。
- 本次未修改 Research Data、Schema、网站视觉或前端业务逻辑；正式 Public Release 状态继续暂停。

## [Web 0.2.1 — Development] - 2026-08-27

### Changed

- 完成 WCD-01 Global Curation Triage，对三个 Curation CSV、全部 `PUBLIC_CONTENT` 包装字段、Presentation、changeset、Web Data、review queue 与 public bundle 进行全局审核分层。
- 保护历史 USER 决定：仅恢复 16 条逐字一致的 why_read 与 5 条明确由 USER 指定的首页路径；内容不一致或缺少逐条批准证据的推荐继续留审。
- 修复 `V2-CUR-ENT-015` 将 Research Relationship ID 误列为 source ref 的分类错误。
- Web Product 从 `Web 0.2.0 — Development Baseline` 升级为 `Web 0.2.1 — Development`；Research Data 继续为 `Data 1.2.0 candidate`。

### Curation Review

- 2268 条审核记录由 `auto/user/hold = 498/1744/26` 调整为 `519/1723/26`；无内容从 public 降级或退出。
- 新增持续门禁：高判断字段没有明确 `reviewer=USER` 时不得自动公开；Curation、PUBLIC_CONTENT 与 Presentation 引用必须可回溯。
- 详细字段、对象、状态矩阵和 USER 冲突记录见 `project/audits/web/WCD_01_GLOBAL_CURATION_TRIAGE.md`。

### Public Content Impact

- public bundle 新增 5 条首页阅读路径与 16 条作品 why_read，移除 0 条；review queue 与 hold 继续不进入普通读者构建。
- 引用分类修复同步改变公开 evidence 字节，因此本次属于实际 public output 变化，而非仅文档审计。

### Validation

- Research DB、PUBLIC_CONTENT、content quality、Web Data、引用与状态门禁、public bundle、单元测试、浏览器 QA、确定性重建、前端语法与差异检查通过。

### Known / Deferred

- 前 5 条首页路径的新增问题、`WHY-009`、10 条旧版 next_reads 与大批扩展策展字段继续等待 USER；26 条 hold 不以写作替代研究补证。
- `V2-PUBLIC-RELEASE` 继续 `PAUSED BY USER`；本版本不创建 tag、GitHub Release 或 production deployment。

### Next

- `WCD-02 Literary Space & Relationship Deepening = READY / NOT STARTED`。

## [Web 0.2.0 — Development Baseline] - 2026-08-22

### Content

- 完成 `WEB-CONTENT-EXPANSION` B01—B17，当前 review package 覆盖 61 位作者、168 部作品/合集与 25 个文学地点；新增国家、作者、作品及跨层 Geo / Curation / Web Data 投影。
- Web Data、搜索、时间线、地图、作者/作品路由与 Research Evidence 继续消费 Research 主库的确定性构建结果。

### Research

- 当前 master 达到 367 entities、998 facts、293 relationships、278 sources 和 255 content cards。
- 保留全部 Sol audit、remediation 与历史 changeset；migration chain append-only 至版本元数据迁移 `0027`，不重写既有迁移。
- 终审追加 `0027_web_0_2_candidate_package_metadata`，把开发主库与全量导出的 package 口径修正为 `Data 1.2.0 development candidate package`；历史迁移保持不变。
- 新建 `Data 1.2.0 candidate` 全量导出，标记为 `DEVELOPMENT / CANDIDATE`；`Data V1.0.0` 仍是正式 Research Release，`v1.1.0` 仍是 B01 历史快照。

### Product

- Web Product 升级至 `Web 0.2.0 — Development Baseline`，不创建 Web tag、GitHub Release 或 production deployment。
- Review package 扩展至 61 authors / 168 works / 25 literary places；formal public scope 仍为 25 authors / 60 works / 28 places，Public layer 与 USER_REVIEW layer 继续分离。
- 内容质量验证器改为推导 `research_basic`、`reader_ready`、`curation_ready`；基础研究页不再被强制补齐文学推荐字段。
- 地图为全部可探索国家常驻中文名；移动端优先保留国家名并隐藏拥挤的地点文字，地点交互与无障碍名称不变。
- 首页按固定、可解释的 `web-0.2-popularity-v1` 规则分页展示全部 25 位公开作者和 60 部公开作品，不再依赖硬编码精选切片。
- 新增结论式 `reader_content` 投影，普通页面不再消费来源机构、书目核验或审核过程文案；研究与来源引用保留在默认收起的 Research Evidence 中。

### Known limitations

- Formal public layer 仍小于 Research coverage，大量 Curation 等待分层审核。
- 文学地点粒度、work/author → place 与解释性关系仍需深化；虚构空间继续不使用现实坐标。
- 国家、加勒比/中美洲/安第斯、女性诗人、诗歌及非叙事体裁覆盖仍不均衡。

### Next

- `WEB-CONTENT-DEEPENING`：WCD-01 Global Curation Triage、WCD-02 Literary Space & Relationship Deepening、WCD-03 Chinese Display Name Consolidation、WCD-04 Coverage Rebalancing。
- `V2-PUBLIC-RELEASE` 继续 `PAUSED`；Research 正式发布仍等待 USER 决定。

## [Web 0.1.x — Historical maintenance line]

> Historical：以下差量已被 Web 0.2.0 开发基线吸收，不是当前 Unreleased 版本。

### 地图阅读体验

- 首页地图新增动态文学 Context Panel：选择国家或现实地点时不立即跳页，而是在当前页面发现相关作家、作品与继续探索入口。
- 科马拉、马孔多等文学虚构空间改为地图画布内的独立 inset，并继续保持无现实经纬度；首页 Hero、About 预览及 About 页面同步调整为读者导向文案。
- 修正国家、现实地点与文学虚构空间之间的选中状态同步；国家文学聚合统一覆盖国家本身及其公开现实/虚构子地点，首页与国家详情页使用同一口径。
- 修正地图筛选导致现实地点失效时的状态冲突：节点消失后回退至当前国家文学语境；调整交互式 SVG 语义，保留国家/地点键盘操作、清晰焦点和 Context Panel 动态播报。
- Pull Request 新增 Chromium 桌面/移动浏览器 smoke 门禁；Firefox 与 WebKit 完整矩阵继续保留在本地验证及手动 release 级流程中，不改变 Public Release paused 状态。

## [Web 0.1.0 — Development Baseline] - 2026-08-17

### 版本治理

- 明确 `V1 / V2 / V3` 是项目阶段编号，不是网站产品语义版本；Research Data 继续沿用既有独立版本与导出命名，不重写历史。
- 将当前网站产品重新基线为 `Web 0.1.0`：产品模型已建立，进入 Web 0.x 持续内容建设期；该记录是内部开发基线，不是 GitHub Release 或公众发布。
- 将原 `V2-N4` 正式发布流程暂停为未来由 USER 单独重新开启的 `V2-PUBLIC-RELEASE` Gate；Lighthouse、Manifest、GitHub Pages、GitHub Release 与 production deployment 门禁保留但不再是当前主任务。
- `V2.0.0-rc.1`—`V2.0.0-rc.5` 继续作为 Web 0.1.0 形成前的历史开发候选保留，不删除、不篡改、不重写。
- `project/governance/PROJECT_CHARTER.md` 经 USER 明确授权由 1.5.0 最小增量升级至 1.6.0；SQLite 单一主数据、Research / Curation 分离、来源证据、版权、地图、USER 审核、GitHub 留痕及前端不得修改研究事实等既有规则不变。

### 当前状态

- 新增 `WEB-0.1-BASELINE` 与 `WEB-CONTENT-EXPANSION`；PR #5 可作为后续 Research / Curation / Web Data 扩张的开发基线合并，但合并不触发部署、标签、Release 或公开宣传。
- 保留全部 `user_review` 与 `hold` 状态；内部 USER_REVIEW preview 可继续构建，未来 Public Build 仍排除未批准策展内容。

## [Unreleased] - 2026-08-13

- 执行 `V2-N4-R03` 独立终审发布阻断返修，形成 `V2.0.0-rc.4`：`V2-N4` 仍为 `USER_REVIEW`，`release_state` 仍为 `pending_v2_n4`。
- 修复策展发布门禁：5 条阅读路径、5 个时期、17 组 why-read 和 10 条 next-read 全部保留原 `user_review` 状态并退出 public bundle；validator、deploy builder、public bundle scan 和 CI 均 fail-closed。
- 公开范围收紧为 7 位完整作者、14 部完整作品、19 个地点/国家/文学空间和 2 个正式主题节点；研究不足的节点保留于研究数据但不进入搜索与 sitemap。
- 搜索新增可复用的一层正式关系扩展；“马孔多”同时发现马孔多、《百年孤独》和马尔克斯。公开 URL 改为原文 slug + 稳定实体 ID，canonical、`og:url` 和 sitemap 使用同一规则。
- 发布证明改为与最终 PR head 完整 SHA 绑定的脱离式 Manifest；验证干净 Git 范围、工作树字节和同一个最终 dist，篡改回归已证实拒绝修改后的部署目录。
- 锁定 Playwright 1.62.1、Lighthouse 13.4.1 和完整 npm 依赖；本地 Chromium desktop/mobile、Firefox、WebKit 为 28/28，并逐条渲染全部 46 条 sitemap 路由；Lighthouse 首页为 92/100/100/100、作品页为 93/100/100/100，原始 JSON/HTML 与失败工件链已建立。

- 完成 `V2-N4-R02` 产品一致性差量返修，形成 `V2.0.0-rc.3` 候选；Research / Geo / Curation / Web Data 既有架构与已审核事实保持不变。
- 公共网站统一为“拉丁美洲文学地图”，移除版本、阶段、内部字段、审核状态、统计和测试站语言；新增独立 Presentation Layer，并在部署包中物理剥离内部状态字段。
- 首页改为品牌与真实地图优先，加入 5 条策展阅读路径；10 位作家页升级为文学探索结构，17 部资料达标作品补齐“为什么值得读”，并形成 10 条延伸阅读候选。
- 地图改用 Natural Earth 公共领域拉丁美洲国家边界和真实坐标投影；文学虚构空间保持独立视觉机制且不赋现实坐标。
- 生成 146 条静态可索引路由及页面级 title、description、canonical、Open Graph、sitemap 和 robots；搜索、时间线、地点与 About 页面完成公众化。
- 发布清单冻结范围扩至 22 项关键输入，加入候选源码提交锚定协议；PR CI 覆盖数据、构建、公开语言、静态路由和冻结一致性验证，手动 Pages 部署继续要求用户批准。
- 三浏览器、桌面/390px、9 条核心路径全部通过；Lighthouse 记录为 Performance 98、Accessibility 100、Best Practices 100、SEO 100。当前仍停在 `V2-N4 = USER_REVIEW`，未部署、未创建标签或 Release。

- 根据 `project/audits/web/V2_SOL_AUDIT_REPORT.md` 完成 V2-N4 前整改：地图采用稳定的防碰撞位置、国家节点进入国家页、国家页汇总直接与子地点关系；unknown 地点使用待确认模板，隐藏技术父节点不再进入搜索或独立路由。
- 修正 Parral 为 provisional 时保持公开地图隐藏；保留其研究状态，不补造官方来源或分类结论。
- 加固 Web Data validator、release manifest 与 Pages 工作流：候选升级为 `V2.0.0-rc.2`，冻结范围增至 15 个部署输入，部署前必须验证 SHA-256 且 `release_state=approved_v2_n4`。
- 修正 hash 路由 sitemap、部署 README 来源、构建脚本的 `--help` / `--dry-run` 行为，并清理 V2 动态状态、决策索引和 QA 计数漂移。
- USER 批准 V2-N1，并授权将已批准的 V2 产品方向、阶段结构、地图/数据/策展治理、V2-N2 至 V2-N4 审核节点和 Codex 权限纳入 `project/governance/PROJECT_CHARTER.md`；章程由 1.4.0 增量升级至 1.5.0。
- 新增 DEC-040，记录 V2 启动、V2 最高专项说明书地位、V2.0 范围控制、用户节点和当前下一节点 V2-N2。
- README 当前阶段同步为 V1.0.0 已发布、V2-N1 已批准、进入 N2 原型准备；V1 既有来源、数据、版权和 GitHub 治理规则保持不变。
- 完成 V2 数据适配审计、地图地理补充、Curation Data Schema、Web Data 构建、N2 真实样本和最小策展包；生成可回溯的 V2 地图、策展与 Web Data 输出。
- 新增 `site/` 静态优先 N2 原型：地图主入口、国家→地点交互、现实地点/虚构空间页、作者/作品页、基础搜索、文学时间线和阅读/研究双层；完成 V2-S4-005 QA，当前停在 `V2-N2 = USER_REVIEW`。
- USER 通过 N2 并授权继续执行；新增 DEC-042，解锁阶段 5—7，下一用户节点切换为 V2-N3；阶段 8 与 N4 继续锁定。
- 完成阶段 5—7：生成完整页面覆盖和策展草稿，Web Data 升级至 `v2-web-0.2`，完整站接入首页、全量地图、页面回退、类型搜索、作家/作品/背景时间线、来源证据层和响应式/可访问性门禁。
- 新增 `project/audits/web/V2_N3_FULL_TEST_SITE_REVIEW.md`；完整测试站入口与 Web Data HTTP smoke test 均返回 200，内部 QA 通过，当前停在 `V2-N3 = USER_REVIEW`，阶段 8 与 N4 不提前执行。
- USER 通过 V2-N3 并授权继续执行；完成 V2-S8-001 至 V2-S8-004，生成 V2.0.0-rc.1 冻结清单、公开边界 QA、GitHub Pages 候选工作流、根目录部署包和发布说明，当前停在 `V2-N4 = USER_REVIEW`。
- 根据 V1.0.0 工作流程审计，新增长期增量维护手册、审计摘要和旧规则淘汰清单。
- 修正 AI 协同计划、接管提示词、阶段 0/阶段 3 历史文档提示及 V1 发布快照说明，避免把 150 条门槛、Schema 0.2 或“N4 前候选”误作当前规则。
- 从 V1.0.0 SQLite 建立 `data/master/V1_MASTER.sqlite` 基线，新增事务迁移入口、动态主库验证器和 SQLite→CSV/JSON/Excel 通用导出工具。
- 保留 `data/staging/v1_candidate/` 的 V1.0.0 主体数据快照；仅修正发布后说明文件并重收 MANIFEST，未修改冻结章程、历史决策、历史 REVIEW、CSV/JSON/SQLite 或 Excel 主体内容。

## [1.0.0] - 2026-08-11

### 正式发布

- USER 明确批准 `V1-N4-001`，授权创建 `v1.0.0` 标签和 GitHub Release。
- 阶段 5 最终一致性与引用审计通过；V1 以 74 来源、144 实体、76 条经审核关系、40 hold、238 条事实素材和 40 张内容卡正式发布。
- 新增 `project/audits/research/N4_正式发布结论.md` 与 `docs/releases/V1_正式发布说明.md`；已知问题继续公开保留。
- 正式包继续由 `data/staging/v1_candidate/` 提供 CSV、JSON、SQLite、Excel、质量报告及可重复构建验证脚本；Git 标签冻结其 V1.0.0 内容。

### Git 节点

- `GIT-V1-N3` 已通过 PR #2 合并到 `origin/main`，合并提交 `1f2ad54`；`v1-n3` 已创建并推送。
- `GIT-V1-N4` 发布提交、`v1.0.0` 标签与 GitHub Release 共同构成 V1 权威发布点。

## [0.9.1] - 2026-08-11

### 阶段 5

- 完成最终一致性和引用审计：四格式计数、主键、规范化内容、SQLite 外键、Excel 公式、来源及实体引用全部通过。
- 新增 `docs/releases/V1_版本摘要.md`、`docs/releases/V1_已知问题.md` 和 `project/audits/research/阶段5_最终一致性与引用审计.md`。
- 明确披露 40 个关系 hold、5 个 research not_found、1 个 partial、《消逝的足迹》年份 hold、政治诗歌 3/1/1 和 author→event 说明级边界。
- 新增 DEC-038；阶段 5 完成，`V1-N4-001` 进入用户审核。

### Git 节点

- `GIT-V1-N3` 内容提交为 `5b1cec7`，经 PR #2 合并到 `origin/main`；`v1-n3` 已创建并推送。

## [0.9.0] - 2026-08-11

### N3 用户审核

- USER 以 B/A/A/A 通过 `V1-N3-001`，并明确授权修改冻结章程及对 Schema 作加法兼容升级。
- `project/governance/PROJECT_CHARTER.md` 升级至 1.4.0：V1 最低关系门槛由 150 调整为 75；150 转为 V1.1 扩展目标，不以 hold、legacy 或 pending 补数。
- Schema 由 0.2 升级至 0.3，新增 `BASED_ON_EVENT`，端点严格限定 `work → event`；author→event 不建模，政治诗歌维持 3/1/1 分层。

### 数据与验证

- 新增 `V1-REL-0076`：《世界末日之战》→卡努杜斯战争；包含直接证据 1、间接证据 2、独立来源 2。
- 正式候选包更新为 74 来源、144 实体、76 关系、40 hold、91 条关系证据、238 事实和 40 卡片。
- CSV、JSON、SQLite、Excel 已重建；SQLite integrity_check=ok、foreign_key_check=0，Excel 18 工作表、公式错误 0。

### 治理

- 新增 `project/audits/research/N3_审核结论.md` 与 DEC-037；`V1-S5-001` 完成，解锁 `GIT-V1-N3` 和阶段 5。

## [0.8.0] - 2026-08-10

### A06-A R1 门禁

- `V1-S4-A06-A` R1 通过：FULL 为 0 错误/0 警告；事实分层、237/238 来源覆盖、A05 两项 A 级编号候选和 22 项 MANIFEST 均与主体数据一致。
- R1 仅改变 STATUS、QA_REPORT、ISSUES、MANIFEST；其余 18 项与 R0 零改动。验收记录为 `work/external-ai/reviews/V1-S4-A06-A_R1_PM_REVIEW.md`。

### V1 正式候选包

- Codex 完成 `V1-S4-006`：A05-SRC-0001/0003 分配 `SRC-0073`/`SRC-0074`，A05-SRC-0002 继续作为 C 级线索不编号；正式来源扩展至 74 项。
- 146 个 PRE 实体引用规范为 144 个候选实体；关系保持 eligible×75、hold×40，11 行 legacy 证据回接 9 个既有关系但不增加关系数。
- 新增 `data/staging/v1_candidate/`：17 张 CSV、JSON、SQLite、18 工作表 Excel、数据字典、来源目录、质量报告、N3 审核包和 MANIFEST。
- 新增可重复构建/验证脚本；最终验证 0 错误/0 警告，SQLite 完整性 ok、外键错误 0，Excel 公式错误 0。

### N3 与治理

- 新增 DEC-036；`V1-N3-001` 进入用户 review，节点只审核 75/150、work→event、author→event 和政治诗歌 3/1/1 四项。
- 本次未修改冻结 `project/governance/PROJECT_CHARTER.md` 或 Schema 0.2，未触发 `GIT-V1-N3`。

## [0.7.2] - 2026-08-10

### A06-A R0 门禁

- A06-A 的 11 张 CSV、同源 JSON、75/40 关系分层、legacy 11 行零增量、A04 卡片/事实复制、N3 四项材料和隔离可重复构建均通过。
- R0 结论为窄范围 `revise`：STATUS、QA_REPORT 把真实事实分层 50/161/20/2/1/4 错写为 49/未列/20/2/1/3；ISSUES 把 A05-SRC-0001/0003 的 A/A 级误写为 A/C 级。
- R1 只允许修正三份过程文档并重收 MANIFEST；主体 CSV、JSON、构建脚本、卡片和 N3 材料保持不变。
- 父任务 `V1-S4-006` 继续锁定；本次未修改冻结章程或 Schema，未触发 `GIT-V1-N3`。

## [0.7.1] - 2026-08-10

### A05 R1 收口

- `V1-S4-A05` R1 通过关键门禁：FULL 为 0 错误/0 警告；117 行 legacy、165 端点、15 组关系和 75+0=75 预测保持不变。
- GAP-02 修正为作品集内同名短篇的 A 级局部支持；GAP-06 修正为 C 级会议摘要线索。7 个 research_gap 最终为 verified×1、partial_support×1、not_found×5。
- 《消逝的足迹》1953 继续 hold；已用尽的研究/访问预算不重置，未关闭缺口进入 N3 说明。

### A06 任务

- 新增 DEC-035 与 `V1-S4-A06-A` 外部 PRE 预组装任务卡、启动提示词。
- A06-A 只机械组装 40 张卡、238 条事实素材、75/40 关系分层、来源/缺口及四项 N3 材料；不研究、不分配正式 ID、不改 Schema、不写 `data/`。
- 正式 SQLite、Excel/CSV、JSON 仍由 `V1-S4-006` 在 A06-A 通过 Codex 门禁后生成。
- 本次未修改冻结章程或 Schema，未触发 `GIT-V1-N3`。

## [0.7.0] - 2026-08-10

### 阶段 4 A04 收口

- `V1-S4-A04` R1 通过关键门禁：40 张目标卡、238 条事实素材、77 条卡片来源矩阵和 22 条覆盖审计完成收口。
- 修复 hold/research_note_only 与准入事实混栏、单来源解释确定化、《金鸡》写作年/出版年混写、来源回填计数和卡片来源清单问题。
- 当前关系规模维持 eligible/accepted×75、hold×40、legacy×117；章程 150 条门槛真实差距仍为 75，不调整冻结章程。

### A05 差量补包

- 新增 DEC-034，解锁 `V1-S4-A05`：逐行审计 S1 legacy 117 条，按 Schema 0.2 和净新增口径预测可迁移关系。
- 同包对 7 部 research_gap 作品做每部最多 1—2 个开放 A 级入口补核，并对《消逝的足迹》1953 做最多 2 个权威书目入口交叉。
- A06 继续等待 A05 门禁；《上校》双字段留待 A06 暂存组装，政治诗歌与 `BASED_ON_EVENT` 留待 N3 两张独立决策卡。
- 本次未修改冻结章程或 Schema，未触发 `GIT-V1-N3`。

## [0.6.0] - 2026-08-10

### 阶段 4 A01—A03 收口

- `V1-S4-A01`、`V1-S4-A02` 均在 R1 通过关键门禁；人物原型误并、事件证据同源计数、开放目录补核、来源候选联动和 MANIFEST 问题完成差量修复。
- Codex 完成 `V1-S4-A03`：冻结 Schema 0.2 的 12 个关系词保持不变；阶段 3 的 29 个单来源解释关系经新增证据交叉后全部继续 hold；恢复一个《百年孤独》SET_IN 马孔多候选。
- 形成 22 条补证事实裁决：20 条进入暂存审核、1 条 hold、1 条 research note；《上校》拆为 1958 杂志刊载与 1961 书版两个字段，政治诗歌维持 hold/gap。
- 新增 `BASED_ON_EVENT` N3 兼容性提案；端点限定 `work → event`，用户节点批准前不修改 Schema 或生成正式关系。

### 来源与任务

- 正式来源由 `SRC-0016` 扩展至 `SRC-0072`；新增 56 条、同文复用 2 条、Dialnet hold 3 条，新增 `SOURCE_ID_MAP_V1_S3_S4.csv` 和可重复分配/验证脚本。
- 新增 DEC-033，并把 `project/tasks/TASKS.md` 更新为 0.6.0。
- 派发 `V1-S4-A04` 里程碑大包：汇总 10 位作家、30 部作品的事实卡/内容卡素材，并对策展覆盖、来源最低标准和关系规模进行诚实审计。
- 本次未修改冻结章程或 Schema，未触发 `GIT-V1-N3`。

## [0.5.5] - 2026-08-10

### 阶段 3 收口

- `V1-S3-B03` R1 通过关键门禁：12 来源、31 实体、59 事实、23 个关系组、8 张卡片和 10 条查重记录通过结构、来源、语义和 MANIFEST 复检。
- B01—B03 全部完成；阶段 3 合计 42 来源、118 实体候选、208 事实、88 个关系组、32 张卡片，覆盖 8 位作家、24 部作品。
- 新增阶段 3 汇总与缺口报告；59 个关系组进入阶段 4 暂存审核，29 个单来源解释关系继续 hold。

### 决策与阶段 4

- 新增 DEC-032：B03 准入、诗集类型归并、基础事实合并补核、`BASED_ON_EVENT` 兼容性评估和政治诗歌主题证据条件。
- 新建 `V1-S4-A01` 合并任务包和启动提示词，把三个相邻补证工作交给外部 AI 一次完成，Schema 与暂存准入仍由 Codex 裁决。
- `GIT-V1-S3` 自动节点门禁满足；按公开白名单收口阶段 3 及此前未上传的 N2 合规成果，并创建 `v1-s3` 标签。

## [0.5.4] - 2026-08-10

### 章程与 GitHub 工作流

- USER 明确批准 `project/governance/PROJECT_CHARTER.md` 修改提案；章程由 1.2.0 升级至 1.3.0。
- 新增 DEC-031，取代 DEC-015 的逐次上传通知规则；V1 从 `GIT-V1-S3` 起启用节点式自动审计、提交、推送和标签。
- 固定三个自动节点：阶段 3 完成标签 `v1-s3`、N3 通过标签 `v1-n3`、N4 正式发布标签 `v1.0.0` 和 GitHub Release。
- 明确逐文件暂存、公开白名单、禁止材料、远端检查和 fail-closed 停止条件；外部 AI 继续无权操作 Git/GitHub。
- 本次仅激活规则，不提前触发上传；下一次自动 GitHub 动作为 B03 与阶段 3 汇总通过后的 `GIT-V1-S3`。

## [0.5.3] - 2026-08-10

### 阶段 3 任务

- 新建 `V1-S3-B03` 安第斯与诗歌双作家里程碑任务卡和 EXT-AI-02 启动提示词；一包处理略萨、聂鲁达及固定六部作品。
- 明确三部聂鲁达诗集使用 `collection`，单篇诗另建 `work`；历史事件不得套用地点关系或自创新关系词。
- 把版本年代、政治/历史事实、文学运动和解释性主题的来源边界写入任务卡；查重一次覆盖 S1、staging、B01 和 B02。
- B03 依赖已满足，保持 ready，等待外部 AI 开工；本次未执行 Git 提交或 GitHub 上传。

## [0.5.2] - 2026-08-10

### 验收

- `V1-S3-B02` R1 通过关键门禁：15 个来源、43 个实体、68 条事实、34 个关系组、12 张卡片和 13 条查重记录通过结构、引用、来源与语义复检。
- R1 修正来源作者和三组原子事实，删除 15 条无直接来源事实及 1 组证据不足的 `SET_IN`；19 个关系进入后续暂存审核，15 个单来源解释关系继续 hold。
- Codex 独立核对 Jérôme Dulou 的 UNLP 官方来源身份，并确认 13 条展开查重 ID 均存在于 S1 候选表。

### 决策与任务

- 新增 DEC-030：B02 准入；基础事实集中到阶段 4 补核；neobarroco 与巴洛克、无名上校人物与同名作品保持分层；非固定作品改编链按阶段 4 专题决定迁移。
- B02 完成，B03 解锁；阶段 3 批次矩阵同步为 done/done/ready。
- 本次未执行 Git 提交或 GitHub 上传。

## [0.5.1] - 2026-08-10

### 验收

- `V1-S3-B01` R0 通过关键门禁：15 个 A/B 来源、44 个实体、81 条事实、31 个关系组、12 张卡片和 9 条查重候选通过结构、覆盖、来源与语义抽样。
- 24 个关系进入暂存审核，7 个单来源解释关系继续 hold；人物与同名作品保持分层。
- 接受 UNAM、智利大学、ELEM、FCE 对被拦截来源的替代，不为非必要站点绕过访问限制。

### 任务与决策

- 新增 DEC-029，记录 B01 准入、同名归并、作品/人物分层和四部作品的按需补证策略。
- B01 完成，B02 解锁；阶段3批次矩阵同步为 done/ready/blocked。
- 本次未执行 Git 提交或 GitHub 上传。

## [0.5.0] - 2026-08-10

### N2 节点

- 用户按建议通过 N2；冻结 V1 Schema 0.2，阶段 3 正式解锁。
- Schema 新增 `person` 支撑非作家人物，新增 `DIRECTED`；保持解释性关系原则上双来源、单来源 hold，以及来源级定位和可选页码。

### 阶段 3

- 完成 `V1-S3-001` 作家/来源批次矩阵：剩余 8 位作家分成 B01—B03 三个里程碑包，固定 24 部作品；与阶段 2 合计 10 位作家、30 部作品。
- 新建 `V1-S3-B01` 墨西哥三作家研究里程碑任务卡和 EXT-AI-02 短提示词；一包合并来源发现、合法访问、候选实体/事实/关系、卡片素材、查重和覆盖统计。
- 本次未执行 Git 提交或 GitHub 上传。

## [0.4.6] - 2026-08-10

### 数据包

- 完成 `V1-S2-007`：新增 `data/staging/v1_s2_pilot/`，包含 28 个实体、15 个 N2 可审核关系、11 个待补证关系、52 条事实、9 张内容卡和 11 个来源。
- 生成 CSV、JSON、SQLite 及可重复构建脚本；所有实体、来源、关系、事实和卡片引用由关联表及 SQLite 外键约束。
- 新增 SRC-0014~0016，补充《小径分岔的花园》1941、短篇《阿莱夫》1945、李斯佩克朵卒年 1977 的权威来源。

### N2 节点

- 新增 `project/archive/N2_知识模型试点审核包.md`，把用户审核压缩为实体分层、关系词与证据门槛、内容卡方向、来源定位粒度四项决定。
- 新增 DEC-027；`V1-N2-001` 进入 review，阶段 3 继续等待用户节点确认。
- 本次未执行 Git 提交或 GitHub 上传。

## [0.4.5] - 2026-08-10

### 验收

- `V1-S2-007-A` R0 通过数据包门禁：六张 CSV 为 28×11、26×11、27×8、49×9、8×8、8×8，PRE ID 连续，引用无悬空，15/11 状态分层正确。
- CSV、JSON、SQLite 六张逻辑表规范化哈希一致；SQLite 完整性和外键检查通过。
- 记录跨 SQLite 版本文件头可能不同：可重复构建以逻辑内容、规范化哈希和完整性为准，不以数据库文件原始哈希作为跨环境强制门槛。

### 决策与任务

- 新增 DEC-026：PRE 包准入；1949 年作品集《阿莱夫》在 N2 包单独建立第 9 张结构型简卡；DIRECTED 留作 N2 词表提案；英文选集不恢复无证据的 TRANSLATION_OF。
- `V1-S2-007-A` 完成；父任务 `V1-S2-007` 继续由 Codex执行正式暂存、来源关联表、权威来源补充和最终 N2 数据包。
- 本次未执行 Git 提交或 GitHub 上传。

## [0.4.4] - 2026-08-10

### 验收

- `V1-S2-003-004-B` R0 通过关键门禁：共享 FULL 验证、122×16 候选表、ID 唯一性、来源题名、六作品覆盖、语义样本和目录安全均通过。
- 接受 SRC-0007 的题名级书目交叉用途；Codex 独立复核 SRC-0008 官方论文全文，不要求外部执行方为访问拦截整包返修。
- 修正查重报告中的文字枚举差异，保留候选表与机械统计，不改变外部交付包。
- `V1-S2-006-A` R0 经窄范围返修后于 R1 通过：关系 27 行/26 组、事实 49 行、覆盖 35 行、内容卡 8 节，共享 FULL 验证和 Codex端点/语义门禁均通过。
- 删除不兼容的导演 `CREATED` 和题名推断的英文选集 `TRANSLATION_OF`；拆分《活水》复合主题，保留《星辰时刻》为唯一双来源解释关系。

### Schema 决策

- 新增 DEC-022：下一步试行 Schema 区分作品、作品集、版次/译本和改编，并明确同名《阿莱夫》短篇与作品集不得合并。
- 明确重复作者/作品候选采用“规范实体 + 多来源证据”；标题子串不自动合并。
- 核定李斯佩克朵生卒年为 1920—1977，`El tamaño de mi esperanza` 规范出版年为 1926；UESB 页码允许留空。
- 122 条记录仍为候选，不在 Schema 完成前进入 `data/staging`。

### 任务状态

- `V1-S2-003/004` 完成，`V1-S2-005` 进入执行；关系抽取继续等待 Schema 门禁。
- 完成 N2 前试行 Schema 0.1 草案，明确实体分层、关系词、解释性关系证据和候选迁移规则；`V1-S2-005` 完成。
- 新建 `V1-S2-006-A` 里程碑任务卡与 EXT-AI-02 短启动提示词，一包交付关系候选、事实候选、内容卡草稿和证据覆盖表。
- `V1-S2-006` 完成，`V1-S2-007` 进入执行；Codex负责正式暂存和最终 SQLite/CSV/JSON 数据包准入。
- 新建 `V1-S2-007-A` 外部支持任务：EXT-AI-02 机械生成 PRE 层六张 CSV、JSON/SQLite 预览、构建脚本和三格式一致性报告；Codex保留正式暂存和 N2 数据包准入权。
- 本次未执行 Git 提交或 GitHub 上传。

## [0.4.3] - 2026-08-09

### 外部执行方交接

- 用户决定停止向 WorkBuddy 派发新任务，新增 DEC-021；历史交付和署名保持不变。
- 尚未开始的 `V1-S2-003-004-B` 改派给新外部执行方 `EXT-AI-02`，首次交付必须登记真实平台、供应方和模型。
- 新增无需聊天上下文的项目接管与首任务提示词；原 WorkBuddy 启动提示词标记为停用。

### 后续任务安排

- 新增从当前任务到 V1 发布的外部 AI 路线图：M1 八来源与候选实体、M2 关系候选与内容事实、M3 多作家研究批次、M4 全局规范化、M5 按需差量修订。
- 保持“外部 AI 里程碑包 + Codex关键门禁 + 用户 N2/N3/N4 节点”的协作模式，不恢复逐页或逐项审核。
- 同步 TASKS、README、AI 协同计划、阶段支持文件和外部 AI 手册中的当前执行方表述。

### 章程与 GitHub

- 供应方更换不改变冻结总章程，因此未修改 `project/governance/PROJECT_CHARTER.md`。
- 本次修改仅在本地累积，未执行 Git 提交或 GitHub 上传。

## [0.4.2] - 2026-08-09

### 验收

- `V1-S2-003-A` R1 通过：共享 FULL 验证脚本 `result=pass`，三表分别为 8×12、18×13、14×8，locator 唯一、矩阵零悬空、六作品覆盖数 4/3/3/2/1/1。
- R1 保留 R0 漏检根因并正确把最终结论留给 Codex；目录为 9 个登记文件且无禁止内容。

### 来源与任务

- 新增 DEC-020，将七个已通过网络来源分配为 `SRC-0007`~`SRC-0013`；增加映射表。
- `SOURCE_REGISTRY.csv` 新增七个来源，并追加 `persistent_id`、`canonical_url` 两列；既有六个来源内容不变。
- 新建 `V1-S2-003-004-B` 里程碑任务卡，把八来源整理、SRC-0002 两篇作品窄范围处理、六作品候选实体抽取和既有候选查重合并交给 WorkBuddy。
- 后续 Codex只做语义样本、候选合并冲突和暂存准入审核，不逐页复做。

### GitHub

- 本次修改仅在本地累积，未执行 Git 提交或 GitHub 上传。

## [0.4.1] - 2026-08-09

### 验收

- 完成 `V1-S2-003-A-SCOPED-LOCATORS` R0 项目经理复检，结论为窄范围 `revise`。
- 独立确认 `SECTION_LOCATORS.csv` 为 18×13、locator 唯一，`WORK_SOURCE_MATRIX.csv` 为 14×8、引用零悬空，六部作品覆盖数为 4/3/3/2/1/1。
- 打开博尔赫斯中心官方 PDF，确认 Rosman 论文共 15 页；打开 IMS《Água viva》机构条目，确认作品、1973 年和撰稿信息。
- 发现 `MATERIAL_ACCESS_LOG.csv` 的 `DISC-BOR-002` 行因未转义英文逗号成为 13 列，与交付自检“8×12、12/12 通过”冲突；已生成差量返修单和 R1 提示词。

### 决策与效率

- 新增 DEC-019：保持 Codex + WorkBuddy 单队列，但把 2—4 个相邻机械子任务合并为一个里程碑任务包。
- Codex默认只审文件结构与安全、来源身份与覆盖、语义抽样与冲突、暂存/发布准入四个关键门禁；页码和可选 locator 不触发返修。
- Worker 必须记录项目共享验证脚本的实际终态；自制断言不能替代共享门禁。
- `V1-S2-003-A` R1 通过并分配正式来源 ID 后，计划把来源级 L2 整理与机械候选抽取合并派发。

### 章程与 GitHub

- 本次仅调整任务层执行粒度，不修改冻结的 `project/governance/PROJECT_CHARTER.md`。
- 修改仅在本地累积，未执行 Git 提交或 GitHub 上传。

## [0.4.0] - 2026-08-04

### 章程变更

- 用户明确授权把最低证据定位从页码/章节级调整为来源级；`project/governance/PROJECT_CHARTER.md` 从 1.1.0 升级为 1.2.0。
- 书籍最低记录来源 ID 和书名，论文最低记录来源 ID、论文题名及 DOI/稳定 URL（如有），网页最低记录页面标题、机构/作者、URL 和访问日期。
- 章节、页码、电子位置、段落锚点和短摘录改为可选增强信息，不再作为验收、暂存或主数据准入的强制门槛。
- 新增章程修改提案和 DEC-017；历史页码与 locator 保留，已通过任务不返工。

### 协作与效率

- 新增 DEC-018：当前采用 Codex + WorkBuddy 双 Agent 单任务队列，未来再按需要扩展并行 Worker。
- 外部任务包分为 `LITE` 与 `FULL`；机械任务合并过程信息，OCR、研究、关系和数据库任务保留完整交付包。
- 固化短启动提示词、差量返修、机械检查优先、Codex抽样读取和里程碑批量同步规则。
- 新增 `scripts/validate_external_delivery.py`，检查必需文件、CSV 结构、重复 ID、来源题名提醒和禁止文件。
- 新增 LITE HANDOFF 模板，更新候选 CSV、OCR、QA、来源记录、任务卡和提示词模板。
- `.gitignore` 新增 `.workbuddy/`，降低本地 Worker 状态误传风险。

### 阶段 2 调整

- `V1-S2-003` 改为“试点材料文本整理与来源级引用”。
- `V1-S2-003-A` 已交付的页段数据作为增强成果保留；Codex验收不再要求补齐待核页码。
- WorkBuddy 的下一批 L2 可以按书名、论文名、网页或内容单元限定，不需要逐页锚点。

### 验证与状态

- 同步总章程、任务源、研究规范、AI 协同计划、外部 AI 手册、执行自检手册、模板、阶段 0 支持文件、阶段 2 决策和 README。
- 记录章程 1.2.0 SHA-256：`bae3987e725da30c72bbdb4e636d6c4c17cc82049fb11f1d61f3e938520f90e2`。
- 验证脚本通过既有 `V1-S1-006` FULL 交付包测试；对当前 `V1-S2-003-A` 运行时发现 `MATERIAL_ACCESS_LOG.csv` 第 3 行 13 列、表头 12 列，证明自动检查能够提前暴露 Worker 自检遗漏；该问题留待正式验收差量处理。
- 跨规范关键词检查未发现仍把页码/章节作为默认强制准入门槛的现行规则。
- GitHub PR #1 已存在但仍为草稿、未合并；本次 0.4.0 修改仅本地累积，未提交或上传。

## [0.3.6] - 2026-08-04

### 新增

- 新增 `V1-S2-001-002-A` R2 项目经理复检记录，最终结论为 `pass`。
- 新增阶段 2 六部试点作品、八个首轮来源、正式等级和获取策略记录。
- 新增 `V1-S2-003-A` 试点材料合法访问与页段定位任务卡及 WorkBuddy 提示词。
- 新增 DEC-016，固定阶段 2 试点选择和先定位后 L2 的处理顺序。

### 修改

- `project/tasks/TASKS.md` 更新为 0.3.6：`V1-S2-001/002` 完成，`V1-S2-003` 解锁并进入页段定位子任务。
- README 和项目决策记录同步当前状态与版本。

### 验证

- 独立解析候选表 21×20、访问计划 21×7；确认 ID 唯一、一一对应、枚举合法。
- 重算作家、语言、等级、访问状态、访问桶、优先级和唯一机构，确认 SUMMARY、QA、HANDOFF、MANIFEST 一致。
- 通过官方开放论文和 JSTOR 第 14 期目录交叉核验 BOR-004 的作者、题名、年份和期号。
- 验证交付目录恰为 9 个书目级文件，无原文、下载文件或敏感信息；冻结章程哈希未变化。

### 已知问题

- BOR-011、FCRB 档案和中文版全集的付费/预约获取均暂缓，不阻塞首轮开放来源试点。
- 本版本仅本地更新，未执行 Git 提交或 GitHub 上传。

## [0.3.5] - 2026-08-04

### 新增

- 新增 `V1-S2-001-002-A` R1 项目经理复检记录，结论为窄范围 `revise`。
- 新增可直接交给 WorkBuddy 的 R2 精确返修提示词。

### 修改

- `project/tasks/TASKS.md` 更新为 0.3.5，记录 R1 已通过的范围、两项阻塞问题和 R2 状态。
- README 当前版本与阶段 2 状态同步更新。

### 验证

- 独立解析候选表 21×20、访问计划 21×7；确认 ID 唯一、一一对应且枚举合法。
- 重算作家、语言、等级、访问状态、访问桶、优先级和唯一机构；确认主体数据总量及葡语覆盖达标。
- 抽核六条返修来源及每位作家另外五条网址；确认 BOR-005、LIS-005、LIS-006、LIS-009、LIS-010 的主要返修成立。
- 发现 BOR-004 仍为未证明同行评审的期刊索引，不能据此核定 A 级；发现 QA 分作家访问状态数字与最终 CSV 不一致。
- 验证交付目录恰为 9 个书目级文件，无禁止文件。

### 已知问题

- R2 通过前不选定试点作品、不核定正式来源等级，也不启动购买、预约、材料处理或 OCR。
- 本版本仅本地更新，未执行 Git 提交或 GitHub 上传。

## [0.3.4] - 2026-08-04

### 新增

- 新增 `V1-S2-001-002-A` G 类项目经理验收记录，R0 结论为 `revise`。
- 新增可直接交给 WorkBuddy 的 R1 精确返修提示词。

### 修改

- `project/tasks/TASKS.md` 更新为 0.3.4，记录阶段 2 来源候选任务 R0 已交付但等待 R1。
- README 当前版本同步更新，阶段 2 仍处于试点来源选择阶段。

### 验证

- 标准解析候选表 21×20、访问计划 21×7，验证 ID 唯一且一一对应。
- 重算作家、等级、语言和访问桶；发现汇总文件与 CSV 存在多组计数矛盾。
- 每位作家抽核至少 5 个网络来源；确认阿根廷国家图书馆期号、SciELO/UFF 机构和 Rocco 落地页需要修正。
- 验证目录为 9 个书目级文件且没有下载材料或敏感文件。

### 已知问题

- R1 通过前不选定试点作品、不核定正式来源等级，也不启动购买、预约、OCR 或入库。
- 本版本仅本地更新，未执行 Git 提交或 GitHub 上传。

## [0.3.3] - 2026-08-04

### 新增

- 新增 `V1-S1-007-A` R1 项目经理复检记录，最终结论为 `pass`。
- 新增阶段 1 首批资料汇总与缺口报告，记录六份来源、387/117 候选规模、葡语与核心作家缺口及公开边界。
- 新增 `V1-S2-001-002-A` 外部任务卡和可直接交给 WorkBuddy 的提示词，用于博尔赫斯与李斯佩克朵试点来源发现和书目核验。

### 修改

- `project/tasks/TASKS.md` 升级为 0.3.3：`V1-S1-007` 更新为完成，`V1-S2-001`、`V1-S2-002` 更新为进行中。
- README 当前阶段更新为阶段 1 完成、阶段 2 双作家试点来源选择启动。

### 决策

- 李斯佩克朵及葡语来源缺口立即纳入阶段 2 试点来源候选任务。
- 埃莱娜·加罗、罗萨里奥·卡斯特利亚诺斯保留为阶段 3 补源项，不扩大当前博尔赫斯与李斯佩克朵双作家试点。
- 女性作家数量待实体消歧与审核后统计，不从缺少性别字段的候选表机械推断。

### 验证

- 独立重算覆盖矩阵为 6 行、14 列；书目字段与登记表一致。
- 独立重算实体候选 387 条、关系候选 117 条，分源计数全部一致。
- 验证 7 条缺口全部为 `not_covered_by_current_package`，三位缺失核心作家的中外文名称全量检索均为 0 命中。
- 验证 SRC-0004 章题、起页、I004 状态和过程文档计数均已修复。
- 验证交付目录恰为 9 文件且无 PDF、EPUB、OCR、`inputs/` 或全文提取件。

### 已知问题

- 候选实体和关系仍未进入暂存区或主数据库。
- 阶段 2 来源候选尚待 WorkBuddy 检索、Codex 验收与最终选择。
- 本版本仅本地更新；等待用户明确通知后才执行 Git 提交和 GitHub 上传。

## [0.3.2] - 2026-08-04

### 新增

- 新增章程修改提案，记录用户对 GitHub 上传时机的明确授权、影响和风险防护。

### 修改

- `project/governance/PROJECT_CHARTER.md` 从 1.0.0 升级为 1.1.0：不再以单个任务完成触发 Git 提交或 GitHub 上传，改为用户明确通知后的批量收口。
- README、决策记录、N1 审核包、阶段 0 支持章程和 AI 协同工作计划同步新规则。

### 决策

- 新增 DEC-015：GitHub 只在用户明确通知时才批量提交并上传；取代 DEC-009 的上传时机规则。

### 验证

- 核对总章程保留冻结、用户授权、版本记录和公开边界要求；仅更改 GitHub 上传时机。
- 记录修订后总章程 SHA-256：`e4fc776b682512830fcfaa72cb7bd25afe82cbc9bd9d3c1265d506b5698e9dfc`。
- 本版本不执行 Git 提交或 GitHub 上传，等待用户后续明确指令。

## [0.3.1] - 2026-08-04

### 新增

- 新增根目录 `project/governance/PROJECT_CHARTER.md`，统一记录项目使命、长期成果、V1 内容基线、完整阶段流程、角色权限、数据生命周期、质量门槛和最终完成定义。
- 建立章程冻结与修改程序：未经用户明确授权，任何 AI 不得修改、移动、重命名或删除总章程。

### 修改

- README、TASKS、阶段 0 章程、AI 协同计划、研究规范和外部 AI 手册统一声明总章程的最高效力。
- 外部 AI 任务模板新增总章程必读项和禁止修改条款。
- 项目支持文档版本同步更新为 0.3.1；动态项目状态仍只由 `project/tasks/TASKS.md` 维护。

### 决策

- 新增 DEC-014：将 `project/governance/PROJECT_CHARTER.md` 确立为用户锁定的最高项目规范。

### 验证

- 核对总章程覆盖项目目标、阶段 0—6、N1—N4、各角色权限、V1 交付物、完成定义、版权边界和变更程序。
- 核对外部 AI 入口文件均要求先阅读总章程。
- 核对总章程不包含需要随日常进度更新的动态任务状态。
- 记录冻结初始 SHA-256：`5aa2002bc23f9bf46ea26815bd0236c2982dd22d1a47a396ef57a8e452f46331`。

### 已知问题

- 文件级冻结依赖项目治理和 Git 历史审计；未来如需修改，必须先取得用户对 `project/governance/PROJECT_CHARTER.md` 的明确授权。

## [0.3.0] - 2026-08-04

### 新增

- 新增 N1 正式审核结论，记录用户批准、解锁效果和未授权事项。
- 新增首批来源登记表，为六份资料分配 `SRC-0001`~`SRC-0006`。
- 新增正式来源 ID 回填任务包和独立复核任务包，供外部 AI 按依赖执行。

### 修改

- N1 状态由等待审核更新为完成，阶段 1 正式启动。
- `V1-S1-001`、`V1-S1-002`、`V1-S1-004`、`V1-S1-005` 更新为完成。
- `V1-S1-003` 更新为进行中；`V1-S1-006` 等待正式 ID 回填交付。
- README、决策记录和 N1 审核包同步更新为 0.3.0。

### 决策

- 新增 DEC-012：用户批准 N1 建议范围，阶段 1 解锁。
- 新增 DEC-013：首批六份资料按接收顺序分配正式来源编号。

### 验证

- 核对六个正式来源 ID 唯一且连续，临时 ID 映射一一对应。
- 核对来源登记表不包含原始文件、整书 OCR、证据长摘录或本地私有路径。
- 核对外部 AI 回填任务不允许修改 OCR 正文、候选语义、locator、置信度或主数据。
- 核对独立 Reviewer 与回填 Worker 必须分离。

### 已知问题

- 正式来源 ID 尚未回填到外部任务包；完成回填及独立复核前，候选数据不进入 `data/staging`。
- 阶段 1 汇总与缺口报告需等待回填复核完成。

## [0.2.1] - 2026-08-04

### 新增

- 新增 `N1-OCR-001` R2 公开验收摘要，记录抽检范围、结构校验、最终结论和公开边界。
- 在统一任务源中登记该任务包为 `V1-S1-001/003/004/005` 的先行交付证据。

### 修改

- 将项目版本更新为 0.2.1；项目阶段仍为 N1 范围基线审核。
- 明确西语目录候选不批量恢复为高置信度，须在进入暂存前逐条复核。
- 增加外部任务包目录和压缩包的 Git 忽略规则，防止原始书籍与整书 OCR 误传公开仓库。

### 决策

- 新增 DEC-011：`N1-OCR-001` R2 通过验收并登记为先行证据，但不提前解锁阶段 1、不分配正式来源 ID、不进入暂存区。
- WEB-003 暂时保持 B；网络来源正式编号延后到入库任务统一处理。

### 验证

- 目视核对 TMP-002 原 PDF p9—p13，确认目录逐页边界、108 和 365 页码。
- 验证 4 本 PDF 共 112 个唯一单页锚点，TMP-001~006 六个来源节齐全。
- 标准解析来源清单为 6 行数据、15 列；验证 387 个实体候选 ID 唯一、117 条关系引用完整。
- ENTITY、RELATION 各抽 15 条并覆盖六个来源；核对六份来源档案的出版社、年份和 ISBN。
- 核对顶层 13 个文件、`inputs/` 中间产物数量及无 `.DS_Store`。

### 已知问题

- N1 尚待用户审核，阶段 1 仍未解锁，正式 `SRC-` 尚未分配。
- 一条帕斯与文学运动的解释性关系证据不足，进入暂存前须补直接证据或标为 `needs_second_source`。
- `N1-OCR-001` 的本地原件、`inputs/`、完整 EPUB 提取件和整书 OCR 不属于公开仓库内容。

## [0.2.0] - 2026-08-04

### 新增

- 完成阶段 0 项目章程，明确 V1 目标、范围、治理、节点和版权边界。
- 建立来源等级、OCR 页码锚点、候选数据、受控词表、QA 和退回规范。
- 建立 `project/tasks/TASKS.md` 作为 V1 唯一任务状态源，细化阶段 0—5 与 N1—N4 任务。
- 建立 N1 范围基线审核包。
- 建立外部 AI 任务分工与交接手册，覆盖资料清单、来源建档、OCR、质检、候选抽取、译名核对和书目核对。
- 建立外部 AI 的任务、状态、来源、OCR、QA、问题、交接、文件清单、Reviewer 和 CSV 模板。

### 修改

- 项目状态由“初始规划”更新为“阶段 0 完成、等待 N1 审核”。
- 将重复、基础、耗用上下文的 OCR 与整理工作优先路由给其他 AI。
- 将 Codex 工作集中到任务管理、Schema、证据判断、关系审核、数据库整合、质量与 GitHub 收口。
- 补充本地私有输入、外部 AI 工作目录和交接包的 Git 忽略规则。

### 决策

- 新增 DEC-010：采用“外部 AI 做基础处理，Codex 做结构、判断与整合”的跨平台分工。
- 外部 AI 只提交标准暂存交接包，不直接修改主数据、任务源或 GitHub。

### 验证

- 已核对项目章程、研究规范、任务源、外部 AI 手册和模板的任务 ID、状态和交付名称。
- 已确认外部 AI 的结果默认作为候选，必须经过独立 QA 和 Codex 整合。
- 已确认公开仓库忽略原始资料、私有工作目录和收到的任务包。

### 已知问题

- N1 尚待用户审核，阶段 1 任务暂未解锁。
- 第一批资料尚未接收，正式来源 ID 尚未分配。
- V1 Schema 仍需在 N2 试点后冻结。

## [0.1.0] - 2026-08-04

### 新增

- 建立项目说明和公开仓库文档结构。
- 建立 V1 内容数据库与后续数字展览的完整工作计划。
- 建立独立决策记录，保存全部已讨论选项和当前选择。
- 建立四节点用户审核机制。
- 建立 PM、研究 Agent、Reviewer Agent 和数据整合 Agent 的协同规则。
- 建立 SQLite、Excel/CSV、JSON 三层数据交付方向。
- 建立公开仓库的版权与私有资料隔离规则。

### 修改

- 将原“逐阶段用户审核”改为 N1—N4 关键节点审核。
- 将节点之间的资料整理、交叉审核、补证、纠错和合并授权给 AI 团队自动完成。

### 决策

- 项目范围确定为拉丁美洲，而非仅南美洲。
- V1 确定为精品规模的内容数据库。
- 资料策略确定为开放研究扩展。
- 策展主线确定为均衡文学地图，并保留“权力与正义”“形式与先锋”专题方向。
- GitHub 仓库确定为公开仓库，每次完成独立修改后提交并上传。

### 验证

- 已检查计划、决策记录、项目说明和变更日志之间的版本与术语一致性。
- 已确认公开仓库不包含用户书籍、版权全文或敏感配置。

### 已知问题

- 第一批书籍尚未提交，来源盘点、作家最终名单和试点数据尚未开始。
- V1 Schema 尚待 N2 试点后冻结。
