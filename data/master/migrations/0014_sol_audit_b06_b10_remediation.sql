-- SOL-AUDIT-B06-B10: correct the first-publication year of Roberto Bolaño's 2666.
UPDATE facts
SET value_text = '2004',
    origin_id = 'SRC-0211',
    usage_note = 'Memoria Chilena records 2666 as a posthumous novel published in 2004.'
WHERE fact_id = 'V1-FCT-0684'
  AND subject_id = 'V1-ENT-0270'
  AND fact_field = 'first_publication_year';

UPDATE facts
SET value_text = 'Memoria Chilena 作者页记录《2666》于 2004 年身后出版；2005 年档案页对应后续获奖记录，不作为首版年份。',
    origin_id = 'SRC-0211',
    usage_note = 'Use the 2004 publication statement on the author page; do not infer publication year from the 2005 archive heading.'
WHERE fact_id = 'V1-FCT-0685'
  AND subject_id = 'V1-ENT-0270'
  AND fact_field = 'bibliographic_note';

DELETE FROM fact_sources
WHERE fact_id IN ('V1-FCT-0684', 'V1-FCT-0685');

INSERT INTO fact_sources (fact_id, source_id, source_title) VALUES
('V1-FCT-0684', 'SRC-0211', 'Roberto Bolaño (1953-2003) — Memoria Chilena'),
('V1-FCT-0685', 'SRC-0211', 'Roberto Bolaño (1953-2003) — Memoria Chilena');

UPDATE content_cards
SET period_bucket = '2004',
    content_markdown = '### 《2666》｜2666 — Memoria Chilena 记录作者身后出版于 2004 年。'
WHERE card_id = 'V1-CARD-0158'
  AND subject_id = 'V1-ENT-0270';
