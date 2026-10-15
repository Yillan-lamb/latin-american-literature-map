# FINAL_REENTRY 验证记录

批准的零参数 QA wrapper 在实际 apply 后仅执行一次，16步全部 exit 0；实际验证摘要见[CHECKPOINT_QA.json](./CHECKPOINT_QA.json)。数据库最终 SHA-256 为 `5a410850fed0ffa936db1de135e3872fa1f53a5a3a3b294927eb902db2b3b12c`。

- migration `0057` apply 后，57 migrations / 19 tables 的完整独立 replay 通过；19表数据与实际数据库相符，所有旧行保全。完整 replay 原始 stdout 为199 bytes，SHA-256 `a48da3c9ff3bf162ca4b378c9a26984adab590dfb63842b130ead9c45d647232`。
- JSON、CSV、XLSX 三种格式各导出19张表；22个重复导出文件逐字节一致。
- QA 的 `before_public_snapshot_compare` 比较的是 ROOT 冻结的 B21 AFTER 与 WT 旧 B21 AFTER 快照；177个公开文件及2个 Web JSON 共179个路径的hash一致。这是既有B21快照核验，不代表本次FINAL_REENTRY的179文件与B21相同。
- 本次开发网页仍为127个公开对象、139条路由，新增公开对象0；177个公开文件与部署前字节一致。另将本次验证生成的 `manifest.json` 与 `site_data.json` 精确复制到开发 Web 数据目录，分别核对SHA-256为 `a05f54094bb0de102114d51efac13d3a7e578247f7edf21801a6dc2a998ecb72`、`ffd0d6fad29c3e063f3d9f6563b6b5776cea2e4c83ba9093d5ff62c703fb5683`；这两个本次after文件的hash不要求等同B21旧快照。
- 构建时间固定为 `2026-10-08T00:00:00Z`；`buildWeb` 使用绝对 WT 路径和实际主数据库。

本次没有重复运行浏览器或无关测试。QA wrapper 绑定本次嵌套 FINAL_REENTRY 路径与精确审核 Gate，并调用共享 `qa_wcd10_checkpoint.verify`；这是路径适配，不代表现有硬绑定 `WCD-10-BNN` 的 reviewed-checkpoint CLI 直接通过，也没有修改产品工具。
