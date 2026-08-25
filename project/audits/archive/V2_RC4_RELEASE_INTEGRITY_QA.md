# V2.0.0-rc.4 发布完整性 QA

rc.4 不再把旧父提交称为当前候选。正式候选身份由 PR head 的完整 Git SHA 唯一确定；CI 从该 SHA 的干净 checkout 生成脱离式 Manifest，要求 `candidate_commit_sha = git rev-parse HEAD = GITHUB_SHA`。

验证范围包括 V1 validator、Web build/validator、coverage、static/deploy builder、Manifest、public UI、路由/sitemap validator、browser/Lighthouse、锁文件、CI、Pages。Manifest 对工作树字节与 Git blob分别取证，并逐文件记录最终 `dist/` SHA-256。

Pages 只允许：构建一次 dist → public QA → materialize Manifest → verify Manifest → 上传该同一 dist。任何重建都会产生未验证目录，因此工作流没有二次构建步骤。

本地预检：输入与 54 个 bundle 文件通过。篡改副本的 `data/v2/web/site_data.json` 后 verifier 返回 `actual deployment bundle bytes differ from manifest`。本地 preflight Manifest 明确没有 commit 身份；正式 commit 证明由 PR CI 工件生成。

当前仍为 `pending_v2_n4 / USER_REVIEW`，Pages 工作流会拒绝执行部署。
