-- WCD-03 patch-version metadata correction.
-- 0030 updated the package label but left the separate research_version key stale.

UPDATE metadata SET value='1.3.1' WHERE key='research_version';
UPDATE metadata SET value='2026-08-30' WHERE key='generated_at';
