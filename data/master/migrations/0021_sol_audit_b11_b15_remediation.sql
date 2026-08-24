-- SOL-AUDIT-B11-B15: complete the traceable source mapping for Glosa (1986).
-- SRC-0256 and SRC-0257 independently record 1986; the B15 migration only
-- attached SRC-0257 to the fact even though both were used downstream.

INSERT OR IGNORE INTO fact_sources (fact_id, source_id, source_title)
SELECT 'V1-FCT-0912', source_id, title
FROM sources
WHERE source_id = 'SRC-0256';

UPDATE facts
SET usage_note = 'Argentina government bibliography and the UNL scholarly table date Glosa to 1986; the separate 1985 discovery lead remains unverified and is tracked in V1-GAP-0022.'
WHERE fact_id = 'V1-FCT-0912';

INSERT INTO metadata (key, value)
VALUES ('last_change_set', 'SOL-AUDIT-B11-B15')
ON CONFLICT(key) DO UPDATE SET value = excluded.value;
