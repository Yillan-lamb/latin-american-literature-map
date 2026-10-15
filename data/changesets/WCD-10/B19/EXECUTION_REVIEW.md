# WCD-10-B19 执行审查记录

- 任务/决策：TASK-124 / DEC-070
- WT分支：`codex/wcd-10-author-deepening`
- 实际迁移：`0054_wcd10_b19_author_works.sql`，唯一一次apply，exit 0。
- 数据库SHA-256：基线`8e2c26422a219990c8e397005ebd4e2c8499181f657b63f53cdb70af3e99d016`；执行后`264385afd29d43f6d160d852a9dc6ad685fa2bd5fa25e3e7d7575168ebb72032`。

## 门禁与SQL位置

- Prepare使用WT中的`REVIEW_GATE.json`，SHA-256 `6a338e18690db0b56efeabc937db03d9aabc2a01284e4f9cb18a048e86c8f279`。它授权builder生成待审SQL与map，不是实际apply门禁。
- disposable-clone SQL审查通过后生成的`CHECKPOINT_REVIEW.json`，SHA-256 `b534e48c05d4f20eb70381c80a360e70f6ece92995bf66127863ca8720647739`，绑定SQL SHA `881fdb063ea462bbe5d916a81197fa4887653a79c5144137f4255e180c5d03a4`、map SHA `4e79bfa2de2e39de29ae5284679fe1326822b6f180dbe4f3fbeb99dead1a5041`和冻结基库SHA；该独立checkpoint review才授权实际apply。
- Builder真实prepare命令记录在本地`INTEGRATOR_PREPARE.json`，exit 0。builder最初将SQL输出到`data/changesets/WCD-10/B19/0054_wcd10_b19_author_works.sql`；获准后将文件byte-identical移至正式迁移目录`data/master/migrations/0054_wcd10_b19_author_works.sql`。原件保存在本地Integrator `PREPARED_INITIAL_SQL.sql`。两份文件SHA均为`881fdb063ea462bbe5d916a81197fa4887653a79c5144137f4255e180c5d03a4`。移位证据SHA-256 `19c68dfb8282909cb0b93287060e7fe7b9aa65b4ca18d4435196e15f843392b8`；原prepare命令及其原始流记录保持原样，真实反映最初输出位置。
- Prepare原始stdout SHA-256为`546dde5fd7d88ccc64b7836f469de8db506c0044623441afe302b2e06cebd337`；stderr为空，SHA-256为`e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`。stdout报告`prepared_only`和13 sources、13 entities、16 cards、42 facts、13 relationships、23 gaps。

## Apply与QA原始记录

Actual apply使用Python 3.14（`/opt/homebrew/opt/python@3.14/bin/python3.14`），cwd为授权WT；命令将实际主库与正式迁移路径作为位置参数，并传入`--task-id TASK-124 --reviewer Codex-parent-independent-review`。exit 0，数据库只apply一次。原始stdout为109 bytes，SHA-256 `2bf8eb93e8f1cf2f543333f0f2338c20495ef19a967185fae123e4f7f67c9686`；stderr为0 bytes，SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`。执行细节及逐字节原始流见ROOT B19 `APPLY_EXECUTION.json`、`APPLY.stdout.raw`和`APPLY.stderr.raw`。

成功apply后，完整读取ROOT B19 `run_required_qa.py`，以零参数运行一次；16项全部exit 0。外层stdout报告`ALL_REQUIRED_STEPS_PASS`，SHA-256 `07a54ae3b4b42ef25577278ddcb780eb6607681e3c2c9d4312a1c280dcac3eba`。完整QA命令、运行时、cwd、退出码、raw流路径及SHA保存在`QA_STEPS.json`与`INTEGRATOR_APPLY_QA.json`；QA_STEPS文件SHA-256为`de8b6f2d6fe72ec6e778c90b32e07f1b18170feb3c26ea4d5ea766034ec25240`。

全54迁移独立重放的实际raw stdout SHA-256为`eade9e2b63c9cface495275bc0f1b5893195d50b49b758da5ccccd67e9e78fd4`，结果为54 migrations、19 tables、integrity `ok`、0 foreign-key errors。格式化实际命令日志SHA-256为`91801072f1a422faa3668457909fd9299ccd7374db6f5101b8916f0ff884a98e`。两者不同：格式化日志记录命令、退出码、raw流路径与哈希，并含真实raw正文；它不代替raw stdout。QA报告SHA-256为`00eb2133dcf99d5adea980c4bbe2a0e932f9aaf7716a431da40e7ed8a75f3902`。

## 独立审核及证据限制

母级`ACTUAL_DATA_INDEPENDENT_REVIEW.json`对实际数据、真实执行流、全54迁移/19表重放、三格式导出、22项重复导出、177个公共文件、新公开对象边界和两个Web JSON副本完成410项检查，全部PASS；报告SHA-256 `a562bf5b5ecb9ff86ab6adf509d8c02d10a25ebad69f8e4ed348c6af9781959e`。

三位作者最终修订版冻结输入按规定顺序使用。合包过程曾将批级顶层`status`和`public_boundary`归一为获准的统一候选边界；原作者JSON文档及manifest/hash资料保留在merge provenance与ROOT冻结材料中。首次merge preflight因作者包顶层`status`不同而在写出合包文件前停止；只保存了combined输出字符串，未分别保留stdout/stderr raw文件，流分离为`NOT_VERIFIED`（combined-output SHA-256 `5ab10d81d513012d5c595ac91fd98f172080d01541a1ce4ddb4b6be803aeb1c7`）。该限制不代表最终整合或实际审核失败，也不被重建材料消除。

## 阶段边界

本文记录B19实际执行与本批验收。WCD-10现为19/21批、57/61作者；余2批4作者，W03版本注记与直接归属回补、B08共同对象归属及TASK-127仍未完成。Research 1.5.0 development、Schema 0.4、Web Data 0.3、Web 0.6.0及Public Release暂停不变。未进行Git提交、push、合并、发布或部署。
