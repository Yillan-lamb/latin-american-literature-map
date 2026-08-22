-- Web 0.2.0 final consolidation: identify the expanded master as Data 1.2.0 candidate.
UPDATE metadata SET value = '1.2.0' WHERE key = 'research_version';
UPDATE metadata SET value = 'development_candidate' WHERE key = 'status';
UPDATE metadata SET value = '2026-08-22' WHERE key = 'generated_at';
UPDATE metadata SET value = 'WEB-0.2.0-FINAL-CONSOLIDATION' WHERE key = 'last_change_set';
