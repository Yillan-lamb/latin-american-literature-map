# WCD-10-B20 执行审查记录

- 任务/决策：TASK-125 / DEC-070
- WT分支：`codex/wcd-10-author-deepening`
- 实际迁移：`0055_wcd10_b20_author_works.sql`，仅apply一次，exit 0。
- 数据库SHA-256：基线`264385afd29d43f6d160d852a9dc6ad685fa2bd5fa25e3e7d7575168ebb72032`；执行后`db16fe4f5faaafcfca3b02b42c52d56bb9b11d63704d2de49201d1f328e0a0ba`。

## Prepare与实际apply门禁

- Prepare使用WT `REVIEW_GATE.json`（SHA-256 `bd86dd8e96eb18bc8d98ac508d28600cd93efe332e64194adf40109561ecd915`），它仅授权prepare和候选SQL审核，不是实际apply门禁。
- disposable-clone SQL/关系/来源审核通过后生成WT `CHECKPOINT_REVIEW.json`（SHA-256 `c737cd9dfc59374af2d887bf0914e293a4106e540a6f693f8404da220f6befbe`）；它绑定基线、正式SQL SHA-256 `2f288075cac14d73f38075fe41ac12ca353e2e5194069c2ab89a881d6df2bdc3`和mapping SHA-256 `064253f82fbcea513180180727c2d604b116f0f1252166f1782284d12eba3a87`，并授权唯一一次WT实际apply。母422项实际数据独立审查随后通过。
- Apply由解析后的Python 3.14绝对runtime `/opt/homebrew/Cellar/python@3.14/3.14.5/Frameworks/Python.framework/Versions/3.14/bin/python3.14`执行；cwd为授权WT。真实argv、hash绑定、执行前后数据库SHA及原始输出记录于ROOT B20 `APPLY_EXECUTION.json`（SHA-256 `89bb519059145b3d67963007dd13a9c3556a50da7175f4f8333fb4fa05a413b1`）。raw stdout 109 bytes，SHA-256 `cc8033caac59f566a0772ca076cec4ae4d3d54aa3872f9536112bd81429802b5`；raw stderr 0 bytes，SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`。stdout与stderr原始文件分别保存，没有重跑apply。

## QA命令和流

完整读取ROOT B20 `run_required_qa.py`后，以零脚本参数运行一次；wrapper外层exit 0并报告`ALL_REQUIRED_STEPS_PASS`，16步全部exit 0。wrapper执行记录与raw流在ROOT B20 `QA_WRAPPER_EXECUTION.json`、`QA_WRAPPER.stdout.raw`和`QA_WRAPPER.stderr.raw`；完整命令表在`QA_STEPS.json`（SHA-256 `5b12efc73bc4358a808a157fe753636d93529ab4592c7fe2edf0ea8e5a95bffc`）。compact的apply加16项QA共17命令，记录于`INTEGRATOR_APPLY_QA.json`（SHA-256 `4d68716acc6789171d86af8575a1dcd11dae7f9fbb312f6d644cd3d57d72d07e`）。每项原始stdout/stderr分开保存并记录路径与SHA。

全55迁移重放的raw stdout SHA-256为`3f5769a41bac5c99b7756c4062168acdb1ce2a2f6c3c645d596f3d8d2177361a`；格式化replay日志SHA-256为`4c48eeb4d8e6668075b19531c0c127fc9f251adc6c87b85a59a88a99840c6746`。两者是不同产物：原始流按wrapper日志文件保存；格式化日志以实际QA记录组织命令、exit、raw流路径和SHA，不替代或冒充raw stdout。55迁移、19表、JSON/CSV/XLSX三格式19表、22个重复导出、177个公开文件逐字节核验均通过；新公开对象为0，仍为127个公开对象和139条路由，两个通过校验的Web JSON副本逐字节一致。

## 保留的过程证据与限制

准备阶段的原始泛化prepare执行记录把`python3`的`resolved_runtime`错误解析为不存在的WT相对路径；该历史字段标记为`NOT_VERIFIED`并保留原记录，未为修正显示而重跑泛化prepare。随后受控追加和实际apply均使用实测绝对runtime。共同作品补边曾有两次fail-closed尝试，分别因SRC-0638不是本批候选source id-map成员、以及关系最终计数guard匹配数不符而停止；两次stderr和命令记录保留，R2才成功，未改普通来源或关系输入。prepare过程遇到一次usage-limit中断；中断期间未执行apply，USER指示继续后，按CHECKPOINT_REVIEW实际apply一次。Peri作者包初次validator的单作者roster输出未保留原始分离流，完整性记为`NOT_VERIFIED`；最终冻结合包与真实validator通过，最终流已保存。可选PDF截图尝试因缓存未命中未验证图像，但已打开并核查的文本证据支撑有界来源审核。原作者raw源内容未另存为Integrator副本；冻结输入、manifest/hash和母实际审查记录仍保留。具体记录见ROOT B20 `RUNTIME_NOTES.json`，SHA-256 `026e4f696909ef62b9a346b84ba4be1f44dc2495dd3794d3bc712bec9d4a1ed4`。

## 阶段边界

WCD-10-B20后累计新增410个对象、1628项事实和426项关系，完成20/21批、60/61作者，余Gallegos（B21）1批1作者。W03版本注记与直接归属回补、B08 Amado0172→既有0591归属仍待实际回补和TASK-127仍待完成。Research 1.5.0 development、Schema 0.4、Web Data 0.3、Web 0.6.0及Public Release暂停不变。未进行Git提交、push、合并、发版或部署。
