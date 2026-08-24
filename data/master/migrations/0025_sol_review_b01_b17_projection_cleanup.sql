-- SOL B01-B17 pre-PR consolidation cleanup.
-- Project already has the underlying facts; this migration only completes
-- three B01 content-card projections that remained blank.

UPDATE content_cards
SET country_or_region='智利', period_bucket='1889–1957'
WHERE card_id='V1-CARD-0044' AND subject_id='V1-ENT-0148';

UPDATE content_cards
SET country_or_region='墨西哥', period_bucket='1914–1998'
WHERE card_id='V1-CARD-0048' AND subject_id='V1-ENT-0059';

UPDATE content_cards
SET genre_or_form='中篇小说 / novela corta', period_bucket='1962'
WHERE card_id='V1-CARD-0063' AND subject_id='V1-ENT-0169';

UPDATE metadata SET value='SOL-REVIEW-B01-B17-PROJECTION-CLEANUP' WHERE key='last_change_set';
