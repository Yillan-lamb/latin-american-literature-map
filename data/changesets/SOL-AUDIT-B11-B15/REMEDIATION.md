# SOL-AUDIT-B11-B15 Remediation

日期：2026-08-21

审计范围：`WEB-CE-B11`—`WEB-CE-B15`
执行者：`CODEX-SOL-AUDIT`

## 原则

本整改不改写 Luna 的 `0016`—`0020` 历史 migration，也不改变作者、作品、facts、relationships、sources、cards、Geo 或审核状态的批次数量。所有修复均为当前层的可追溯差量。

## 已执行

1. 新增 `0021_sol_audit_b11_b15_remediation.sql`：为 `V1-FCT-0912`（《格洛萨》1986）补登记已在下游使用、且可直接支持该年份的 `SRC-0256`，并同步收窄 usage note。
2. 修正 B14 当前 Curation 投影：将错误的“1979 年《热带黎明景观》”改为“1979 年《哈瓦那，一个早夭婴儿的回忆》”。
3. 修正 B15 当前 Curation 投影：不再把未定位的 1985 discovery lead 写成“不同目录给出 1985 或 1986”，并明确其不能与正式来源支持的 1986 混同。
4. 新增 B11—B15 浏览器回归：覆盖 60 个新实体的 formal-public boundary、review queue 完整性、代表性作者/作品路由、搜索，以及上述两条错误措辞的反向断言。
5. 用固定时间戳 `2026-08-21T12:00:00Z` 重建 Web Data；未修改 public approval 状态。

## 验证

- corrective migration 在主库副本 dry-run、正式副本应用和正式主库应用均成功；SHA-256：`636fa3f9d589817d792bf2d12aee409e5bcafcabe043d03b2b10f42ab5d977e7`。
- master validator、SQLite integrity、foreign keys、migration-chain unit tests：PASS。
- content quality、Web Data validator、public bundle、public UI、deterministic rebuild：PASS。
- Chromium desktop/mobile：32/32 PASS。

## 未改变

- `V1-GAP-0022` 继续保持 open research；1986 仍为 medium，1985 仍只是未定位线索。
- 60 个 B11—B15 作者/作品 Curation 实体（450 个字段）全部保持 `user_review` / `UNREVIEWED`。
- 未创建 Public Release、GitHub Release 或 production deployment。
