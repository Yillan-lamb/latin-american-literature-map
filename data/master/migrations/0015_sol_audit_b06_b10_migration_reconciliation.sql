-- SOL-AUDIT-B06-B10: reconstruct missing B07-B09 migration provenance.
-- On a clean replay, the official migration tool has already inserted these rows,
-- so INSERT OR IGNORE makes this migration a no-op for the reconstructed entries.

INSERT OR IGNORE INTO migration_log
  (migration_id, task_id, reviewer, applied_at, sql_sha256, schema_version)
VALUES
  ('0010_web_ce_b07_luna_max', 'WEB-CE-B07', 'SOL-AUDIT-RECONSTRUCTED', '2026-08-21T06:37:39+00:00', '544c735aa12a7cf9ed6e0dfc68574d51466c3fea6dbaadb45e91e6ae06fb6191', '0.3'),
  ('0011_web_ce_b08_luna_max', 'WEB-CE-B08', 'SOL-AUDIT-RECONSTRUCTED', '2026-08-21T06:37:39+00:00', '66f9efb38fc5cf0e5a056b00ee6f227e1e4ed8ff49fd021f8f9532f6aebd9769', '0.3'),
  ('0012_web_ce_b09_luna_max', 'WEB-CE-B09', 'SOL-AUDIT-RECONSTRUCTED', '2026-08-21T06:37:39+00:00', 'c51341d2ed62e48229adfbe73b78fed8d3101d71efa015b31a17453d89574b3c', '0.3');
