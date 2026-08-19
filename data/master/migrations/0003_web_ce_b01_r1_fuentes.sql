INSERT INTO entities (entity_id, entity_type, name_zh, original_name, canonical_status, origin_count, origin_refs, normalization_basis, issue_codes) VALUES
('V1-ENT-0145','author','卡洛斯·富恩特斯','Carlos Fuentes','retained','1','CAND-R1-ENT-01','WEB-CE-B01-R1 independent review PASS','NONE'),
('V1-ENT-0146','work','《最明净的地区》','La región más transparente','retained','1','CAND-R1-ENT-02','WEB-CE-B01-R1 independent review PASS; Chinese title verified by library MARC','NONE'),
('V1-ENT-0147','work','《阿尔特米奥·克罗斯之死》','La muerte de Artemio Cruz','retained','1','CAND-R1-ENT-03','WEB-CE-B01-R1 independent review PASS; Chinese edition year remains field-level HOLD','TRANSLATION-YEAR-HOLD');

INSERT INTO entity_id_map (mapping_id, preview_entity_ref, origin_layer, origin_ref, entity_id, mapping_action, mapping_basis) VALUES
('V1-EMAP-0147','CAND-R1-ENT-01','WEB-CE-B01-R1','CAND-R1-ENT-01','V1-ENT-0145','retain_as_formal_candidate','Independent review PASS'),
('V1-EMAP-0148','CAND-R1-ENT-02','WEB-CE-B01-R1','CAND-R1-ENT-02','V1-ENT-0146','retain_as_formal_candidate','Independent review PASS'),
('V1-EMAP-0149','CAND-R1-ENT-03','WEB-CE-B01-R1','CAND-R1-ENT-03','V1-ENT-0147','retain_as_formal_candidate','Independent review PASS; translation publication year excluded');

INSERT INTO sources (source_id, temporary_id, title, original_title, author_or_editor, translator, publisher, publication_year, isbn, format, page_count, language, source_level, processing_status, source_task, public_content_scope, local_asset_status, persistent_id, canonical_url) VALUES
('SRC-0087','CAND-R1-SRC-01','Carlos Fuentes','','El Colegio Nacional','','El Colegio Nacional','','','webpage','','es','B','access_pass','WEB-CE-B01-R1','metadata_and_summary','remote_only','','https://colnal.mx/integrantes/carlos-fuentes/'),
('SRC-0088','CAND-R1-SRC-02','Carlos Fuentes - Detalle del autor','','Berenice Granados / Fundación para las Letras Mexicanas','','Enciclopedia de la Literatura en México','2017','','webpage','','es','B','access_pass','WEB-CE-B01-R1','metadata_and_summary','remote_only','','https://www.elem.mx/autor/datos/1162'),
('SRC-0089','CAND-R1-SRC-03','La región más transparente - Detalle de la obra','','Fabiola Camacho / Fundación para las Letras Mexicanas','','Enciclopedia de la Literatura en México','','','webpage','','es','B','access_pass','WEB-CE-B01-R1','metadata_and_summary','remote_only','','https://www.elem.mx/obra/datos/2611'),
('SRC-0090','CAND-R1-SRC-04','La región más transparente','','Carlos Fuentes','','Fondo de Cultura Económica','2006','9789681677886','publisher_page','','es','B','access_pass','WEB-CE-B01-R1','metadata_and_summary','remote_only','ISBN 9789681677886','https://www.fcede.es/site/es/libros/detalles.aspx?id_libro=5894'),
('SRC-0091','CAND-R1-SRC-05','La muerte de Artemio Cruz - Detalle de la obra','','Fundación para las Letras Mexicanas','','Enciclopedia de la Literatura en México','','','webpage','','es','B','access_pass','WEB-CE-B01-R1','metadata_and_summary','remote_only','','https://www.elem.mx/obra/datos/195029'),
('SRC-0092','CAND-R1-SRC-06','La muerte de Artemio Cruz','','OCLC member libraries','','WorldCat','1962','','library_catalog','','es','B','access_pass','WEB-CE-B01-R1','metadata_and_summary','remote_only','OCLC 1482365986','https://search.worldcat.org/title/1035925077'),
('SRC-0093','CAND-R1-SRC-07','La Muerte de Artemio Cruz','','Carlos Fuentes','','Penguin Books','1996','9780140255829','publisher_page','','es','B','access_pass','WEB-CE-B01-R1','metadata_and_summary','remote_only','ISBN 9780140255829','https://www.penguinrandomhouse.com/books/328758/la-muerte-de-artemio-cruz-by-carlos-fuentes/'),
('SRC-0094','CAND-R1-ENT-02-TRANSLATION','《最明净的地区》MARC 记录','La región más transparente','吉林省图书馆','','云南人民出版社','1993.3','7-222-01047-5','library_catalog','','zh','B','access_pass','WEB-CE-B01-R1','metadata_only','remote_only','ISBN 7-222-01047-5','http://opac.jllib.cn/opac/show_format_marc.php?marc_no=56375362523356610064003202655a370138573a'),
('SRC-0095','CAND-R1-ENT-03-TRANSLATION','《阿尔特米奥·克罗斯之死》采购目录记录','La muerte de Artemio Cruz','','亦潜','人民文学出版社','','9787020150168','catalog_pdf','','zh','B','access_pass','WEB-CE-B01-R1','metadata_only','remote_only','ISBN 9787020150168','https://bid.snapshot.qudaobao.com.cn/f5832aa685ad553bd0c8080277dd10a82975e0f6.pdf');

INSERT INTO content_cards (card_id, origin_card_id, subject_id, card_type, title_zh, author_label, original_title, country_or_region, language, period_bucket, genre_or_form, input_layer, source_minimum_status, issue_code, content_markdown) VALUES
('V1-CARD-0041','WEB-CE-B01-R1-CARD-01','V1-ENT-0145','author','卡洛斯·富恩特斯','卡洛斯·富恩特斯','Carlos Fuentes','墨西哥','es','1928-2012','—','WEB-CE-B01-R1','meets','NONE','### 卡洛斯·富恩特斯\n\n墨西哥小说家、短篇小说家、散文家与剧作家，是拉丁美洲文学爆炸的重要作者。生于 1928 年 11 月 11 日，卒于 2012 年 5 月 15 日。\n\n本卡仅使用独立审核通过的人物事实；不生成出生地或文学运动关系。'),
('V1-CARD-0042','WEB-CE-B01-R1-CARD-02','V1-ENT-0146','work','《最明净的地区》','卡洛斯·富恩特斯','La región más transparente','墨西哥','es','1958','长篇小说','WEB-CE-B01-R1','meets','NONE','### 《最明净的地区》\n\n1958 年首版的长篇小说。作品以多重人物声音与社会群像构成一幅不断移动的墨西哥城图景，在城市日常中追问革命后的社会与身份。\n\n中文书目：徐少军、王小芳译，云南人民出版社，1993.3，ISBN 7-222-01047-5（吉林省图书馆 MARC 核验）。'),
('V1-CARD-0043','WEB-CE-B01-R1-CARD-03','V1-ENT-0147','work','《阿尔特米奥·克罗斯之死》','卡洛斯·富恩特斯','La muerte de Artemio Cruz','墨西哥','es','1962','长篇小说','WEB-CE-B01-R1','meets','TRANSLATION-YEAR-HOLD','### 《阿尔特米奥·克罗斯之死》\n\n1962 年首版的长篇小说。权势人物阿尔特米奥·克罗斯临终回望自己从革命参与者走向财富与腐败的一生；叙事交替使用三种人称，并在过去、现在与未来之间切换。\n\n中文书目：亦潜译，人民文学出版社，ISBN 9787020150168。采购目录未直接显示出版年份，该字段保持 HOLD。');

INSERT INTO facts (fact_id, origin_material_id, card_id, subject_id, fact_field, value_text, material_class, origin_id, confidence, admission_status, usage_note) VALUES
('V1-FCT-0260','CAND-R1-FCT-01','V1-CARD-0041','V1-ENT-0145','birth_date','1928-11-11','fact','SRC-0087','high','batch_retained_candidate','Independent review PASS; two institutional biographies'),
('V1-FCT-0261','CAND-R1-FCT-02','V1-CARD-0041','V1-ENT-0145','death_date','2012-05-15','fact','SRC-0087','high','batch_retained_candidate','Independent review PASS; two institutional biographies'),
('V1-FCT-0262','CAND-R1-FCT-03','V1-CARD-0041','V1-ENT-0145','country_or_region','墨西哥','fact','SRC-0088','high','batch_retained_candidate','Mexican identity; not a birthplace assertion'),
('V1-FCT-0263','CAND-R1-FCT-04','V1-CARD-0041','V1-ENT-0145','one_sentence_summary','墨西哥小说家、短篇小说家、散文家与剧作家，是拉丁美洲文学爆炸的重要作者。','fact','SRC-0087','high','batch_retained_candidate','Minimal synthesis of institutional biographies'),
('V1-FCT-0264','CAND-R1-FCT-05','V1-CARD-0042','V1-ENT-0146','first_publication_year','1958','fact','SRC-0089','high','batch_retained_candidate','First-edition record'),
('V1-FCT-0265','CAND-R1-FCT-06','V1-CARD-0042','V1-ENT-0146','genre_or_form','长篇小说','fact','SRC-0089','high','batch_retained_candidate','ELEM classification'),
('V1-FCT-0266','CAND-R1-FCT-07','V1-CARD-0042','V1-ENT-0146','story_premise','小说以多个人物与社会阶层的声音拼合二十世纪中叶墨西哥城，在城市日常中追问革命后的社会与身份。','publisher_paraphrase','SRC-0089','high','batch_retained_candidate','Low-spoiler institutional and publisher paraphrase'),
('V1-FCT-0267','CAND-R1-FCT-08','V1-CARD-0042','V1-ENT-0146','setting_place','墨西哥城','fact','SRC-0089','high','batch_retained_candidate','No Geo entity or SET_IN relation created'),
('V1-FCT-0268','CAND-R1-FCT-09','V1-CARD-0042','V1-ENT-0146','narrative_feature','以多重人物声音与社会群像构成一幅不断移动的墨西哥城图景。','research_note','SRC-0089','high','batch_retained_candidate','Revised direct paraphrase; independent review PASS'),
('V1-FCT-0269','CAND-R1-FCT-10','V1-CARD-0043','V1-ENT-0147','first_publication_year','1962','fact','SRC-0091','high','batch_retained_candidate','Institutional and library records'),
('V1-FCT-0270','CAND-R1-FCT-11','V1-CARD-0043','V1-ENT-0147','genre_or_form','长篇小说','fact','SRC-0091','high','batch_retained_candidate','ELEM and WorldCat classifications'),
('V1-FCT-0271','CAND-R1-FCT-12','V1-CARD-0043','V1-ENT-0147','story_premise','权势人物阿尔特米奥·克罗斯临终回望自己从革命参与者走向财富与腐败的一生。','publisher_paraphrase','SRC-0091','high','batch_retained_candidate','Low-spoiler institutional and publisher paraphrase'),
('V1-FCT-0272','CAND-R1-FCT-13','V1-CARD-0043','V1-ENT-0147','key_character','阿尔特米奥·克罗斯','fact','SRC-0091','high','batch_retained_candidate','Title character and catalogue summary'),
('V1-FCT-0273','CAND-R1-FCT-14','V1-CARD-0043','V1-ENT-0147','narrative_feature','叙事交替使用第一、第二、第三人称，并在过去、现在与未来之间切换。','research_note','SRC-0091','high','batch_retained_candidate','Revised direct paraphrase; independent review PASS');

INSERT INTO fact_sources (fact_id, source_id, source_title) VALUES
('V1-FCT-0260','SRC-0087','Carlos Fuentes'),
('V1-FCT-0260','SRC-0088','Carlos Fuentes - Detalle del autor'),
('V1-FCT-0261','SRC-0087','Carlos Fuentes'),
('V1-FCT-0261','SRC-0088','Carlos Fuentes - Detalle del autor'),
('V1-FCT-0262','SRC-0087','Carlos Fuentes'),
('V1-FCT-0262','SRC-0088','Carlos Fuentes - Detalle del autor'),
('V1-FCT-0263','SRC-0087','Carlos Fuentes'),
('V1-FCT-0263','SRC-0088','Carlos Fuentes - Detalle del autor'),
('V1-FCT-0264','SRC-0089','La región más transparente - Detalle de la obra'),
('V1-FCT-0265','SRC-0089','La región más transparente - Detalle de la obra'),
('V1-FCT-0266','SRC-0089','La región más transparente - Detalle de la obra'),
('V1-FCT-0266','SRC-0090','La región más transparente'),
('V1-FCT-0267','SRC-0089','La región más transparente - Detalle de la obra'),
('V1-FCT-0267','SRC-0090','La región más transparente'),
('V1-FCT-0268','SRC-0089','La región más transparente - Detalle de la obra'),
('V1-FCT-0269','SRC-0091','La muerte de Artemio Cruz - Detalle de la obra'),
('V1-FCT-0269','SRC-0092','La muerte de Artemio Cruz'),
('V1-FCT-0270','SRC-0091','La muerte de Artemio Cruz - Detalle de la obra'),
('V1-FCT-0270','SRC-0092','La muerte de Artemio Cruz'),
('V1-FCT-0271','SRC-0091','La muerte de Artemio Cruz - Detalle de la obra'),
('V1-FCT-0271','SRC-0093','La Muerte de Artemio Cruz'),
('V1-FCT-0272','SRC-0091','La muerte de Artemio Cruz - Detalle de la obra'),
('V1-FCT-0272','SRC-0092','La muerte de Artemio Cruz'),
('V1-FCT-0273','SRC-0091','La muerte de Artemio Cruz - Detalle de la obra');

INSERT INTO card_facts (card_id, fact_id, admission_status) VALUES
('V1-CARD-0041','V1-FCT-0260','batch_retained_candidate'),
('V1-CARD-0041','V1-FCT-0261','batch_retained_candidate'),
('V1-CARD-0041','V1-FCT-0262','batch_retained_candidate'),
('V1-CARD-0041','V1-FCT-0263','batch_retained_candidate'),
('V1-CARD-0042','V1-FCT-0264','batch_retained_candidate'),
('V1-CARD-0042','V1-FCT-0265','batch_retained_candidate'),
('V1-CARD-0042','V1-FCT-0266','batch_retained_candidate'),
('V1-CARD-0042','V1-FCT-0267','batch_retained_candidate'),
('V1-CARD-0042','V1-FCT-0268','batch_retained_candidate'),
('V1-CARD-0043','V1-FCT-0269','batch_retained_candidate'),
('V1-CARD-0043','V1-FCT-0270','batch_retained_candidate'),
('V1-CARD-0043','V1-FCT-0271','batch_retained_candidate'),
('V1-CARD-0043','V1-FCT-0272','batch_retained_candidate'),
('V1-CARD-0043','V1-FCT-0273','batch_retained_candidate');

INSERT INTO card_sources (card_source_id, origin_matrix_id, card_id, source_id, source_level, source_role, bibliographic_support, research_support, independent_source_key, usage_status, issue_code) VALUES
('V1-CS-0081','WEB-CE-B01-R1-CS-01','V1-CARD-0041','SRC-0087','B','both','yes','yes','El Colegio Nacional','used','NONE'),
('V1-CS-0082','WEB-CE-B01-R1-CS-02','V1-CARD-0041','SRC-0088','B','both','yes','yes','ELEM-FLM','used','NONE'),
('V1-CS-0083','WEB-CE-B01-R1-CS-03','V1-CARD-0042','SRC-0089','B','both','yes','yes','ELEM-FLM','used','NONE'),
('V1-CS-0084','WEB-CE-B01-R1-CS-04','V1-CARD-0042','SRC-0090','B','both','yes','yes','FCE','used','NONE'),
('V1-CS-0085','WEB-CE-B01-R1-CS-05','V1-CARD-0042','SRC-0094','B','bibliographic','yes','no','Jilin Provincial Library','used','NONE'),
('V1-CS-0086','WEB-CE-B01-R1-CS-06','V1-CARD-0043','SRC-0091','B','both','yes','yes','ELEM-FLM','used','NONE'),
('V1-CS-0087','WEB-CE-B01-R1-CS-07','V1-CARD-0043','SRC-0092','B','both','yes','yes','WorldCat','used','NONE'),
('V1-CS-0088','WEB-CE-B01-R1-CS-08','V1-CARD-0043','SRC-0093','B','both','yes','yes','Penguin Random House','used','NONE'),
('V1-CS-0089','WEB-CE-B01-R1-CS-09','V1-CARD-0043','SRC-0095','B','bibliographic','yes','no','Procurement catalogue PDF','used','TRANSLATION-YEAR-HOLD');

INSERT INTO relationships (relationship_id, origin_layer, origin_relation_group_id, subject_id, relation_type, object_id, description_zh, confidence, review_status, upstream_review_status, evidence_count, issue_code) VALUES
('V1-REL-0077','WEB-CE-B01-R1','CAND-R1-REL-01','V1-ENT-0145','CREATED','V1-ENT-0146','卡洛斯·富恩特斯创作《最明净的地区》','high','accepted_by_reviewer','independent_review_pass','2','NONE'),
('V1-REL-0078','WEB-CE-B01-R1','CAND-R1-REL-02','V1-ENT-0145','CREATED','V1-ENT-0147','卡洛斯·富恩特斯创作《阿尔特米奥·克罗斯之死》','high','accepted_by_reviewer','independent_review_pass','2','NONE');

INSERT INTO relationship_sources (relationship_id, source_id) VALUES
('V1-REL-0077','SRC-0087'),
('V1-REL-0077','SRC-0089'),
('V1-REL-0078','SRC-0087'),
('V1-REL-0078','SRC-0091');

INSERT INTO relationship_evidence (evidence_id, relationship_id, origin_evidence_id, source_id, source_title, locator, evidence_note, confidence, evidence_status, evidence_origin) VALUES
('V1-EV-0092','V1-REL-0077','CAND-R1-REL-01-EV-01','SRC-0087','Carlos Fuentes','Works list','Institutional author page lists La región más transparente among Carlos Fuentes works.','high','direct','WEB-CE-B01-R1_REVIEW_PASS'),
('V1-EV-0093','V1-REL-0077','CAND-R1-REL-01-EV-02','SRC-0089','La región más transparente - Detalle de la obra','Work record','ELEM work page directly identifies Carlos Fuentes as author.','high','direct','WEB-CE-B01-R1_REVIEW_PASS'),
('V1-EV-0094','V1-REL-0078','CAND-R1-REL-02-EV-01','SRC-0087','Carlos Fuentes','Works list','Institutional author page lists La muerte de Artemio Cruz among Carlos Fuentes works.','high','direct','WEB-CE-B01-R1_REVIEW_PASS'),
('V1-EV-0095','V1-REL-0078','CAND-R1-REL-02-EV-02','SRC-0091','La muerte de Artemio Cruz - Detalle de la obra','Work record','ELEM work page directly identifies Carlos Fuentes as author.','high','direct','WEB-CE-B01-R1_REVIEW_PASS');

UPDATE metadata SET value='147' WHERE key='entity_count';
UPDATE metadata SET value='273' WHERE key='fact_count';
UPDATE metadata SET value='78' WHERE key='eligible_relationship_count';
UPDATE metadata SET value='94' WHERE key='source_count';
UPDATE metadata SET value='43' WHERE key='card_count';
UPDATE metadata SET value='2026-08-19' WHERE key='generated_at';
INSERT OR REPLACE INTO metadata (key,value) VALUES
('last_change_set','WEB-CE-B01-R1'),
('research_version','1.1.0');
