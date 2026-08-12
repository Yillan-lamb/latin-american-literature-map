# V2.0.0-rc.3 发布完整性 QA

- 日期：2026-08-12
- 结论：**候选源码门禁通过；正式发布仍锁定**

## 冻结范围

rc.3 Release Manifest 冻结 22 项关键输入，包括：V1 主库、Geo/Curation/Presentation/Web Data、三项站点源码、Natural Earth 底图、Web Data 构建器与验证器、Release Manifest 构建器/验证器、部署包构建器、公共 UI 与浏览器 QA 脚本、PR CI 和 Pages 工作流。

每项记录字节数和 SHA-256；验证器同时检查：候选版本、release state、文件集合、文件 hash、Web Data schema/计数、公共数据边界和 Git commit。

## Git 锚定协议

把一个 commit 的 SHA 写入该 commit 自身在 Git 中是循环且不可实现的。rc.3 因此采用可复核的两阶段协议：

1. 先提交完整候选源码，得到唯一 `approved_commit_sha`；
2. 在后续“manifest control commit”中记录该 SHA 与候选文件 hash；
3. CI 和 Pages 工作流先把 manifest 复制到临时位置，再 checkout `approved_commit_sha`；
4. 验证器此时要求 `git rev-parse HEAD`、`approved_commit_sha` 和 manifest `git.head` 三者完全一致；
5. 任一不一致即 DEPLOY FAIL。

这避免 rc.2 中“manifest 只记录生成时旧 HEAD、却仍对当前 PR head 看似有效”的漏洞，也不会声称存在数学上不可能的自包含 commit。

## PR CI

新增独立 V2 CI，在 push / pull request 执行：

- V1 master validator；
- Web Data 重建与 validator；
- JavaScript 语法检查；
- 静态路由与部署包构建；
- 公共界面内部语言扫描；
- checkout 冻结源码提交后执行 Release Manifest 验证；
- `git diff --check`。

CI 不执行 Pages 部署。

## Pages 门禁

正式工作流仍仅允许手动触发，并要求：

- 用户将 manifest `release_state` 明确改为 `approved_v2_n4`；
- `V2_SITE_ORIGIN` 是已确认的 HTTPS 地址；
- checkout 冻结源码提交后，Web Data 重建、validator 和 manifest verifier 全部通过；
- 随后才可生成 Pages artifact。

本轮未触发该工作流。

## 本地验证结果

- V1 主库：PASS；
- Web Data 重建与校验：PASS；
- 22 项冻结 hash：PASS；
- approved source commit 精确 checkout 验证：PASS；
- 公开静态包边界：PASS；
- pending 候选对 `approved_v2_n4` 要求：预期拒绝；
- 正式部署、tag、GitHub Release：未执行。

## 最终状态

`release_state = pending_v2_n4`

`V2-N4 = USER_REVIEW`
