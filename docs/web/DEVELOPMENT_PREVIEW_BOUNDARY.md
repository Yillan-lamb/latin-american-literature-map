# 开发预览与研究数据边界

GitHub Pages 展示开发预览，Public Release 仍暂停。开发预览与标准公开包采用不同的策展输入；比较研究变更的影响时，必须分别比较同模式的 base/head 产物。

| 构建层 | 输入与用途 | 是否直接上传 Pages |
| --- | --- | --- |
| 完整研究 Web Data | SQLite、Geo、Curation、Presentation；保留研究事实、卡片、关系及独立审核队列 | 否 |
| 标准公开包 | 默认策展状态经 `build_v2_web_data.py` 和 `build_v2_deploy_bundle.py` 投影、裁剪 | 否，当前 Pages 使用下述开发模式 |
| USER_REVIEW Web Data | `build_v2_user_review_preview.py` 在临时副本中将 `PUBLIC_CONTENT` 字段状态和指定 Presentation 组状态转为 `auto_approved`，用于检查既有待审策展文案 | 否，仍包含完整研究数据 |
| Pages 实际包 | 上述 USER_REVIEW Web Data 再经 deploy builder，使用仓库 HTTPS origin、`--development-preview` 和 `.nojekyll` | 只上传此 `dist/` |

预览转换不写回源 Curation、Presentation 或 SQLite，不修改研究事实的 admission 状态。它不授权 WCD-10 内容公开；Research-only 标记仍优先于 subject 或关系端点的可见性。`hold`、研究缺口、研究说明及未准入事实不能通过研究层备用正文、时间线、搜索或关系旁路进入部署包。开发预览中可见的既有待审策展文案属于该模式的设计，不能据此推定正式发布批准。

Pages 的第二次构建会重新裁剪 Research、移除原始策展包装及审核字段，为每个页面添加开发预览标识，并生成带仓库子路径的 canonical/sitemap。中间目录 `artifacts/v2-rc5/user-review-preview-web/` 与本地预览目录均不是 Pages 上传目录。

## 自动验证

在具有完整 Git 历史的全新 checkout 中执行。Ubuntu CI 还需 C 编译器，以及经校验的冻结 SQLite writer；它只安装到临时目录，不修改系统 SQLite：

```bash
python3 scripts/prepare_wcd10_sqlite_runtime.py --output /tmp/wcd10-sqlite
export LD_LIBRARY_PATH="/tmp/wcd10-sqlite:${LD_LIBRARY_PATH:-}"
python3 scripts/prepare_wcd10_sqlite_runtime.py --verify
python3 -m pip install -r requirements-wcd10-ci.txt
python3 -m unittest discover -s tests -v
python3 scripts/validate_migration_replay.py --expected-migrations 58 --expected-tables 19
python3 scripts/qa_wcd10_ci.py --output-dir artifacts/wcd10-integrity
```

- 历史物理 SHA 绑定 SQLite 3.53.1 和 `secure_delete=0`。Ubuntu 3.45.1 的默认 `secure_delete=1` 会产生逻辑 19 表相同但文件字节不同的临时检查点；不能通过改写预期 SHA、数据库文件头或放宽断言解决。bootstrap 校验固定源码包 SHA-256 和[官方 sqlite3.c SHA3](https://www.sqlite.org/releaselog/3_53_1.html)，编译原 writer 并在新 Python 进程验证实际版本、source ID 和删除配置。macOS 加载对应临时库使用 `DYLD_LIBRARY_PATH`；已有完全匹配的运行时可直接通过 `--verify`。这些环境变量只用于当前测试进程和子进程，不进入部署包。
- 历史测试基库来自固定 Git 提交、已跟踪迁移和冻结导出，不读取 ignored SQLite 备份或内部治理源。完整 Python discovery 包含所有 WCD-10 测试，以及既有非 WCD-10 回归。
- 重放从 SHA-256 固定的 V1 基线逐条调用正式迁移工具；检查全部表的列定义和行多重集、主库和重放库的完整性及外键。仅 `migration_log.applied_at` 因真实执行时刻不同而不参与逐值比较；SQL hash、task、reviewer 和其他值仍必须一致。
- 0058 的精确差量复用原 QA 核心；CI 使用另有固定文件 SHA 的 tracked 0057 JSON oracle，不依赖本地历史 SQLite 页布局。原 SQLite 基库 hash 门禁保持。漂移回滚、重复执行拒绝和未授权字段修改均有失败回归。
- QA 重新验证当前 JSON/CSV/XLSX 各 19 表，构建标准包与实际 Pages 模式，独立检查允许投影的事实、卡片和关系多重集，并检查原始审核字段、部署文件清单及预览标识。测试向既有公开作品和仅预览可见作品注入研究 canary，比较研究前后完整部署字节。
- PR 浏览器 Job 在 `/latin-american-literature-map/` 子路径运行实际 Pages 包的 Chromium 桌面和手机回归。Pages 工作流在上传前对自己的 `dist/` 运行同一个边界检查。

需要审计整个 PR 时，可向 `qa_wcd10_ci.py` 增加 `--base-repo`，指向独立的精确 base checkout；两端使用各自构建代码、数据库和策展文件，固定相同时间和 origin，逐文件比较标准包与 Pages 包。默认 CI 的 head 构建检查和研究 canary 回归不要求未来合法的产品变更与旧前端逐字节相同。

新增迁移或经批准的策展范围变化时，应在独立任务中更新相应检查点契约与预期；不得通过删除测试、忽略异常或将 Research-only 改为公开状态来通过验证。PR #38 的具体同模式比较见[合并前审计](../../project/audits/web/PR38_PREMERGE_INTEGRITY.md)。
