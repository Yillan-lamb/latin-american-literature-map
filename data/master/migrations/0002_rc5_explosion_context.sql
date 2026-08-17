INSERT INTO sources (source_id, temporary_id, title, original_title, author_or_editor, publisher, publication_year, isbn, format, page_count, language, source_level, processing_status, source_task, public_content_scope, local_asset_status, persistent_id, canonical_url) VALUES
('SRC-0086','','《光明世纪》英文版书目与内容介绍','Explosion in a Cathedral','Alejo Carpentier','Penguin Classics','2023','9780143133889','publisher_page','336','en','B','access_pass','V2-N4-R04','metadata_and_paraphrase','remote_only','ISBN 9780143133889','https://www.penguinrandomhouse.com/books/599205/explosion-in-a-cathedral-by-alejo-carpentier-translated-by-adrian-nathan-west-foreword-by-alejandro-zambra/9780143133889/');

INSERT INTO facts (fact_id, origin_material_id, card_id, subject_id, fact_field, value_text, material_class, origin_id, confidence, admission_status, usage_note) VALUES
('V1-FCT-0257','V2-N4-R04','V1-CARD-0032','V1-ENT-0081','story_premise','十八世纪末，来自马赛的商船水手维克多·于格抵达古巴，把法国革命的理想、野心与暴力带到三个克里奥尔孤儿的生活中。','publisher_paraphrase','SRC-0086','high','batch_retained_candidate','低剧透公众导读基础'),
('V1-FCT-0258','V2-N4-R04','V1-CARD-0032','V1-ENT-0081','key_character','维克多·于格、三个克里奥尔孤儿','publisher_paraphrase','SRC-0086','high','batch_retained_candidate','人物入口'),
('V1-FCT-0259','V2-N4-R04','V1-CARD-0032','V1-ENT-0081','setting_place','十八世纪末的古巴、加勒比海与瓜德罗普','publisher_paraphrase','SRC-0086','high','batch_retained_candidate','区域空间基础；不生成精确地图点');

INSERT INTO fact_sources (fact_id, source_id, source_title) VALUES
('V1-FCT-0257','SRC-0086','《光明世纪》英文版书目与内容介绍'),
('V1-FCT-0258','SRC-0086','《光明世纪》英文版书目与内容介绍'),
('V1-FCT-0259','SRC-0086','《光明世纪》英文版书目与内容介绍');

UPDATE metadata SET value='85' WHERE key='source_count';
UPDATE metadata SET value='259' WHERE key='fact_count';
INSERT OR REPLACE INTO metadata (key,value) VALUES ('last_change_set','V2-N4-R04'),('research_version','1.0.1-rc5');
