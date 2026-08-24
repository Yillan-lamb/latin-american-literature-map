-- WEB-CE-B13: Luna Max; Paulo Coelho, Carlos Drummond de Andrade, Nicolás Guillén.

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0241','B13-SRC-0241','Paulo Coelho | Academia Brasileira de Letras','Paulo Coelho','Academia Brasileira de Letras','','Academia Brasileira de Letras','','','web_page','','pt','B','access_pass','WEB-CE-B13','Author identity, Rio de Janeiro 1947, and 1988/1998/2003 bibliography','remote_only','','https://www.academia.org.br/academicos/paulo-coelho/biografia'),
('SRC-0242','B13-SRC-0242','Coelho, Paulo - Portal Contemporâneo da América Latina e Caribe','Coelho, Paulo','Portal Contemporâneo da América Latina e Caribe','','Universidade de São Paulo','','','web_page','','pt','B','access_pass','WEB-CE-B13','Brazilian author identity and independent bibliography for O Alquimista, Veronika Decide Morrer, and Onze Minutos','remote_only','','https://sites.usp.br/portalatinoamericano/en/coelho-paulo'),
('SRC-0243','B13-SRC-0243','O ano Drummond','O ano Drummond','Antonio Olinto','','Academia Brasileira de Letras','','','web_page','','pt','B','access_pass','WEB-CE-B13','ABL Poesias list with Alguma poesia 1930, A rosa do povo 1945, Claro enigma 1951','remote_only','','https://www.academia.org.br/artigos/o-ano-drummond'),
('SRC-0244','B13-SRC-0244','Carlos Drummond de Andrade','Carlos Drummond de Andrade','Biblioteca Nacional Digital do Brasil','','Fundação Biblioteca Nacional','','','web_page','','pt','B','access_pass','WEB-CE-B13','Authority profile, Itabira 1902–Rio de Janeiro 1987, Brazilian poet and selected poetry context','remote_only','','https://bndigital.bn.gov.br/carlos-drummond-de-andrade/'),
('SRC-0245','B13-SRC-0245','Bibliografía - Nicolás Guillén','Bibliografía - Nicolás Guillén','Nancy Morejón','','Biblioteca Virtual Miguel de Cervantes','','','web_page','','es','B','access_pass','WEB-CE-B13','Bibliography records Motivos de son 1930, Sóngoro cosongo 1931, and West Indies, Ltd. 1934','remote_only','','https://www.cervantesvirtual.com/portales/nicolas_guillen/su_obra_bibliografia/'),
('SRC-0246','B13-SRC-0246','CVC. Nicolás Guillén. Biografía','CVC. Nicolás Guillén. Biografía','Instituto Cervantes','','Centro Virtual Cervantes','','','web_page','','es','B','access_pass','WEB-CE-B13','Cuban identity, 1902–1989, and biographical/poemario context; not the primary publication-year source','remote_only','','https://cvc.cervantes.es/literatura/escritores/guillen/biografia.htm');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0308','author','保罗·柯艾略','Paulo Coelho','candidate','1','CAND-B13-COELHO-AUTHOR','B13 ABL and USP profiles; Chinese display candidate','NONE'),
('V1-ENT-0309','author','卡洛斯·德鲁蒙德·德·安德拉德','Carlos Drummond de Andrade','candidate','1','CAND-B13-DRUMMOND-AUTHOR','B13 ABL and BNDigital profiles; Chinese display candidate','NONE'),
('V1-ENT-0310','author','尼古拉斯·纪廉','Nicolás Guillén','candidate','1','CAND-B13-GUILLEN-AUTHOR','B13 Cervantes Virtual and CVC profiles; Chinese display candidate','NONE'),
('V1-ENT-0311','work','《牧羊少年奇幻之旅》','O Alquimista','candidate','1','CAND-B13-COELHO-W01','B13 institutional bibliography; work layer','NONE'),
('V1-ENT-0312','work','《维罗妮卡决定去死》','Veronika Decide Morrer','candidate','1','CAND-B13-COELHO-W02','B13 institutional bibliography; work layer','NONE'),
('V1-ENT-0313','work','《十一分钟》','Onze Minutos','candidate','1','CAND-B13-COELHO-W03','B13 institutional bibliography; work layer','NONE'),
('V1-ENT-0314','collection','《某种诗》','Alguma poesia','candidate','1','CAND-B13-DRUMMOND-W01','B13 ABL poetry list; collection layer','NONE'),
('V1-ENT-0315','collection','《人民的玫瑰》','A rosa do povo','candidate','1','CAND-B13-DRUMMOND-W02','B13 ABL poetry list; collection layer','NONE'),
('V1-ENT-0316','collection','《明晰之谜》','Claro enigma','candidate','1','CAND-B13-DRUMMOND-W03','B13 ABL poetry list; collection layer','NONE'),
('V1-ENT-0317','collection','《松调》','Motivos de son','candidate','1','CAND-B13-GUILLEN-W01','B13 Cervantes bibliography; collection layer','NONE'),
('V1-ENT-0318','collection','《桑戈罗·科松戈》','Sóngoro cosongo','candidate','1','CAND-B13-GUILLEN-W02','B13 Cervantes bibliography; collection layer','NONE'),
('V1-ENT-0319','collection','《西印度公司》','West Indies, Ltd.','candidate','1','CAND-B13-GUILLEN-W03','B13 Cervantes bibliography; collection layer','NONE');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0308','CAND-B13-COELHO-AUTHOR','WEB-CE-B13','CAND-B13-COELHO-AUTHOR','V1-ENT-0308','create','B13 fresh-context Reviewer PASS; institutional sources'),
('V1-EMAP-0309','CAND-B13-DRUMMOND-AUTHOR','WEB-CE-B13','CAND-B13-DRUMMOND-AUTHOR','V1-ENT-0309','create','B13 fresh-context Reviewer PASS; institutional sources'),
('V1-EMAP-0310','CAND-B13-GUILLEN-AUTHOR','WEB-CE-B13','CAND-B13-GUILLEN-AUTHOR','V1-ENT-0310','create','B13 fresh-context Reviewer PASS; institutional sources'),
('V1-EMAP-0311','CAND-B13-COELHO-W01','WEB-CE-B13','CAND-B13-COELHO-W01','V1-ENT-0311','create','B13 fresh-context Reviewer PASS; institutional bibliography'),
('V1-EMAP-0312','CAND-B13-COELHO-W02','WEB-CE-B13','CAND-B13-COELHO-W02','V1-ENT-0312','create','B13 fresh-context Reviewer PASS; institutional bibliography'),
('V1-EMAP-0313','CAND-B13-COELHO-W03','WEB-CE-B13','CAND-B13-COELHO-W03','V1-ENT-0313','create','B13 fresh-context Reviewer PASS; institutional bibliography'),
('V1-EMAP-0314','CAND-B13-DRUMMOND-W01','WEB-CE-B13','CAND-B13-DRUMMOND-W01','V1-ENT-0314','create','B13 fresh-context Reviewer PASS; ABL poetry list'),
('V1-EMAP-0315','CAND-B13-DRUMMOND-W02','WEB-CE-B13','CAND-B13-DRUMMOND-W02','V1-ENT-0315','create','B13 fresh-context Reviewer PASS; ABL poetry list'),
('V1-EMAP-0316','CAND-B13-DRUMMOND-W03','WEB-CE-B13','CAND-B13-DRUMMOND-W03','V1-ENT-0316','create','B13 fresh-context Reviewer PASS; ABL poetry list'),
('V1-EMAP-0317','CAND-B13-GUILLEN-W01','WEB-CE-B13','CAND-B13-GUILLEN-W01','V1-ENT-0317','create','B13 fresh-context Reviewer PASS; Cervantes bibliography'),
('V1-EMAP-0318','CAND-B13-GUILLEN-W02','WEB-CE-B13','CAND-B13-GUILLEN-W02','V1-ENT-0318','create','B13 fresh-context Reviewer PASS; Cervantes bibliography'),
('V1-EMAP-0319','CAND-B13-GUILLEN-W03','WEB-CE-B13','CAND-B13-GUILLEN-W03','V1-ENT-0319','create','B13 fresh-context Reviewer PASS; Cervantes bibliography');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0196','','V1-ENT-0308','author','保罗·柯艾略','保罗·柯艾略','Paulo Coelho','巴西','pt','1947–','小说家与作词人','WEB-CE-B13','meets','NONE','### 保罗·柯艾略｜Paulo Coelho — ABL and USP profiles establish the Brazilian author entry.'),
('V1-CARD-0197','','V1-ENT-0309','author','卡洛斯·德鲁蒙德·德·安德拉德','卡洛斯·德鲁蒙德·德·安德拉德','Carlos Drummond de Andrade','巴西','pt','1902–1987','现代诗人','WEB-CE-B13','meets','NONE','### 卡洛斯·德鲁蒙德·德·安德拉德｜Carlos Drummond de Andrade — ABL and BNDigital establish the poet entry.'),
('V1-CARD-0198','','V1-ENT-0310','author','尼古拉斯·纪廉','尼古拉斯·纪廉','Nicolás Guillén','古巴','es','1902–1989','诗人与诗歌作者','WEB-CE-B13','meets','NONE','### 尼古拉斯·纪廉｜Nicolás Guillén — Cervantes Virtual and CVC establish the Cuban poet entry.'),
('V1-CARD-0199','','V1-ENT-0311','work','《牧羊少年奇幻之旅》','保罗·柯艾略','O Alquimista','巴西','pt','1988','作品','WEB-CE-B13','meets','NONE','### 《牧羊少年奇幻之旅》｜O Alquimista — ABL and USP record the 1988 title.'),
('V1-CARD-0200','','V1-ENT-0312','work','《维罗妮卡决定去死》','保罗·柯艾略','Veronika Decide Morrer','巴西','pt','1998','作品','WEB-CE-B13','meets','NONE','### 《维罗妮卡决定去死》｜Veronika Decide Morrer — ABL and USP record the 1998 title.'),
('V1-CARD-0201','','V1-ENT-0313','work','《十一分钟》','保罗·柯艾略','Onze Minutos','巴西','pt','2003','作品','WEB-CE-B13','meets','NONE','### 《十一分钟》｜Onze Minutos — ABL and USP record the 2003 title.'),
('V1-CARD-0202','','V1-ENT-0314','collection','《某种诗》','卡洛斯·德鲁蒙德·德·安德拉德','Alguma poesia','巴西','pt','1930','诗集','WEB-CE-B13','meets','NONE','### 《某种诗》｜Alguma poesia — ABL and BNDigital record the 1930 poetry collection.'),
('V1-CARD-0203','','V1-ENT-0315','collection','《人民的玫瑰》','卡洛斯·德鲁蒙德·德·安德拉德','A rosa do povo','巴西','pt','1945','诗集','WEB-CE-B13','meets','NONE','### 《人民的玫瑰》｜A rosa do povo — ABL and BNDigital record the 1945 poetry collection.'),
('V1-CARD-0204','','V1-ENT-0316','collection','《明晰之谜》','卡洛斯·德鲁蒙德·德·安德拉德','Claro enigma','巴西','pt','1951','诗集','WEB-CE-B13','meets','NONE','### 《明晰之谜》｜Claro enigma — ABL and BNDigital record the 1951 poetry collection.'),
('V1-CARD-0205','','V1-ENT-0317','collection','《松调》','尼古拉斯·纪廉','Motivos de son','古巴','es','1930','诗集','WEB-CE-B13','meets','NONE','### 《松调》｜Motivos de son — Cervantes bibliography records the 1930 volume.'),
('V1-CARD-0206','','V1-ENT-0318','collection','《桑戈罗·科松戈》','尼古拉斯·纪廉','Sóngoro cosongo','古巴','es','1931','诗集','WEB-CE-B13','meets','NONE','### 《桑戈罗·科松戈》｜Sóngoro cosongo — Cervantes bibliography records the 1931 volume.'),
('V1-CARD-0207','','V1-ENT-0319','collection','《西印度公司》','尼古拉斯·纪廉','West Indies, Ltd.','古巴','es','1934','诗集','WEB-CE-B13','meets','NONE','### 《西印度公司》｜West Indies, Ltd. — Cervantes bibliography records the 1934 volume.');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-0819','WEB-CE-B13','V1-CARD-0196','V1-ENT-0308','birth_year','1947','fact','SRC-0241','high','candidate_for_staging_review','ABL identifies Coelho as born in Rio de Janeiro in 1947.'),
('V1-FCT-0820','WEB-CE-B13','V1-CARD-0196','V1-ENT-0308','country_or_region','巴西','fact','SRC-0241','high','candidate_for_staging_review','ABL institutional profile identifies the Brazilian context.'),
('V1-FCT-0821','WEB-CE-B13','V1-CARD-0196','V1-ENT-0308','career_note','作家、记者、作词人','fact','SRC-0241','high','candidate_for_staging_review','ABL biography describes work in literature, journalism, theater and music.'),
('V1-FCT-0822','WEB-CE-B13','V1-CARD-0199','V1-ENT-0311','entity_layer','work','metadata','SRC-0241','high','candidate_for_staging_review','ABL bibliography lists the title as a work by Coelho.'),
('V1-FCT-0823','WEB-CE-B13','V1-CARD-0199','V1-ENT-0311','first_publication_year','1988','bibliographic','SRC-0241','high','candidate_for_staging_review','ABL states that O Alquimista was published in 1988.'),
('V1-FCT-0824','WEB-CE-B13','V1-CARD-0199','V1-ENT-0311','genre_or_form','小说','bibliographic','SRC-0241','medium','candidate_for_staging_review','ABL explicitly calls O Alquimista a romance.'),
('V1-FCT-0825','WEB-CE-B13','V1-CARD-0200','V1-ENT-0312','entity_layer','work','metadata','SRC-0241','high','candidate_for_staging_review','ABL bibliography lists the title as a work by Coelho.'),
('V1-FCT-0826','WEB-CE-B13','V1-CARD-0200','V1-ENT-0312','first_publication_year','1998','bibliographic','SRC-0241','high','candidate_for_staging_review','ABL lists Veronika Decide Morrer in 1998.'),
('V1-FCT-0828','WEB-CE-B13','V1-CARD-0201','V1-ENT-0313','entity_layer','work','metadata','SRC-0241','high','candidate_for_staging_review','ABL bibliography lists the title as a work by Coelho.'),
('V1-FCT-0829','WEB-CE-B13','V1-CARD-0201','V1-ENT-0313','first_publication_year','2003','bibliographic','SRC-0241','high','candidate_for_staging_review','ABL lists Onze Minutos in 2003.'),
('V1-FCT-0831','WEB-CE-B13','V1-CARD-0197','V1-ENT-0309','birth_year','1902','fact','SRC-0244','high','candidate_for_staging_review','BNDigital identifies Drummond as born in 1902.'),
('V1-FCT-0832','WEB-CE-B13','V1-CARD-0197','V1-ENT-0309','death_year','1987','fact','SRC-0244','high','candidate_for_staging_review','BNDigital records death in Rio de Janeiro in 1987.'),
('V1-FCT-0833','WEB-CE-B13','V1-CARD-0197','V1-ENT-0309','career_note','诗人、作家与记者','fact','SRC-0244','high','candidate_for_staging_review','BNDigital identifies the author as a Brazilian poet and writer.'),
('V1-FCT-0834','WEB-CE-B13','V1-CARD-0202','V1-ENT-0314','entity_layer','collection','metadata','SRC-0243','high','candidate_for_staging_review','ABL places Alguma poesia under Poesias.'),
('V1-FCT-0835','WEB-CE-B13','V1-CARD-0202','V1-ENT-0314','first_publication_year','1930','bibliographic','SRC-0243','high','candidate_for_staging_review','ABL records the first edition of Alguma poesia in 1930.'),
('V1-FCT-0836','WEB-CE-B13','V1-CARD-0202','V1-ENT-0314','genre_or_form','诗集','bibliographic','SRC-0243','high','candidate_for_staging_review','ABL section heading and title list identify a poetry volume.'),
('V1-FCT-0837','WEB-CE-B13','V1-CARD-0203','V1-ENT-0315','entity_layer','collection','metadata','SRC-0243','high','candidate_for_staging_review','ABL places A rosa do povo under Poesias.'),
('V1-FCT-0838','WEB-CE-B13','V1-CARD-0203','V1-ENT-0315','first_publication_year','1945','bibliographic','SRC-0243','high','candidate_for_staging_review','ABL lists A rosa do povo as 1945.'),
('V1-FCT-0839','WEB-CE-B13','V1-CARD-0203','V1-ENT-0315','genre_or_form','诗集','bibliographic','SRC-0243','high','candidate_for_staging_review','ABL section heading identifies a poetry volume.'),
('V1-FCT-0840','WEB-CE-B13','V1-CARD-0204','V1-ENT-0316','entity_layer','collection','metadata','SRC-0243','high','candidate_for_staging_review','ABL places Claro enigma under Poesias.'),
('V1-FCT-0841','WEB-CE-B13','V1-CARD-0204','V1-ENT-0316','first_publication_year','1951','bibliographic','SRC-0243','high','candidate_for_staging_review','ABL lists Claro enigma as 1951.'),
('V1-FCT-0842','WEB-CE-B13','V1-CARD-0204','V1-ENT-0316','genre_or_form','诗集','bibliographic','SRC-0243','high','candidate_for_staging_review','ABL section heading identifies a poetry volume.'),
('V1-FCT-0843','WEB-CE-B13','V1-CARD-0198','V1-ENT-0310','birth_year','1902','fact','SRC-0246','high','candidate_for_staging_review','CVC identifies Guillén as born in Camagüey in 1902.'),
('V1-FCT-0844','WEB-CE-B13','V1-CARD-0198','V1-ENT-0310','death_year','1989','fact','SRC-0246','high','candidate_for_staging_review','CVC records Guillén death in 1989.'),
('V1-FCT-0845','WEB-CE-B13','V1-CARD-0198','V1-ENT-0310','career_note','诗人、记者与文化工作者','fact','SRC-0246','high','candidate_for_staging_review','CVC biography records poetry, journalism and cultural work.'),
('V1-FCT-0846','WEB-CE-B13','V1-CARD-0205','V1-ENT-0317','entity_layer','collection','metadata','SRC-0246','high','candidate_for_staging_review','CVC biography calls Motivos de son an early poemario.'),
('V1-FCT-0847','WEB-CE-B13','V1-CARD-0205','V1-ENT-0317','first_publication_year','1930','bibliographic','SRC-0245','high','candidate_for_staging_review','Cervantes bibliography records Motivos de son in 1930.'),
('V1-FCT-0848','WEB-CE-B13','V1-CARD-0205','V1-ENT-0317','genre_or_form','诗集','bibliographic','SRC-0246','high','candidate_for_staging_review','CVC describes the title as a poemario.'),
('V1-FCT-0849','WEB-CE-B13','V1-CARD-0206','V1-ENT-0318','entity_layer','collection','metadata','SRC-0246','high','candidate_for_staging_review','CVC biography describes Sóngoro cosongo as a book of poems.'),
('V1-FCT-0850','WEB-CE-B13','V1-CARD-0206','V1-ENT-0318','first_publication_year','1931','bibliographic','SRC-0245','high','candidate_for_staging_review','Cervantes bibliography records Sóngoro cosongo in 1931.'),
('V1-FCT-0851','WEB-CE-B13','V1-CARD-0206','V1-ENT-0318','genre_or_form','诗集','bibliographic','SRC-0246','high','candidate_for_staging_review','CVC biography describes the title as a poemario.'),
('V1-FCT-0852','WEB-CE-B13','V1-CARD-0207','V1-ENT-0319','entity_layer','collection','metadata','SRC-0246','high','candidate_for_staging_review','CVC biography describes West Indies Ltd. as a poemario.'),
('V1-FCT-0853','WEB-CE-B13','V1-CARD-0207','V1-ENT-0319','first_publication_year','1934','bibliographic','SRC-0245','high','candidate_for_staging_review','Cervantes bibliography records West Indies, Ltd. in 1934.'),
('V1-FCT-0854','WEB-CE-B13','V1-CARD-0207','V1-ENT-0319','genre_or_form','诗集','bibliographic','SRC-0246','high','candidate_for_staging_review','CVC biography describes the title as a poemario.');

INSERT INTO fact_sources (fact_id,source_id,source_title)
SELECT fact_id, origin_id, '' FROM facts WHERE fact_id BETWEEN 'V1-FCT-0819' AND 'V1-FCT-0854';
UPDATE fact_sources SET source_title=(SELECT title FROM sources WHERE sources.source_id=fact_sources.source_id) WHERE fact_id BETWEEN 'V1-FCT-0819' AND 'V1-FCT-0854';

INSERT INTO card_facts (card_id,fact_id,admission_status)
SELECT card_id, fact_id, 'candidate_for_staging_review' FROM facts WHERE fact_id BETWEEN 'V1-FCT-0819' AND 'V1-FCT-0854';

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0392','','V1-CARD-0196','SRC-0241','B','both','yes','yes','SRC-0241','used','NONE'),
('V1-CS-0393','','V1-CARD-0196','SRC-0242','B','both','yes','yes','SRC-0242','used','NONE'),
('V1-CS-0394','','V1-CARD-0197','SRC-0243','B','both','yes','yes','SRC-0243','used','NONE'),
('V1-CS-0395','','V1-CARD-0197','SRC-0244','B','both','yes','yes','SRC-0244','used','NONE'),
('V1-CS-0396','','V1-CARD-0198','SRC-0245','B','both','yes','yes','SRC-0245','used','NONE'),
('V1-CS-0397','','V1-CARD-0198','SRC-0246','B','both','yes','yes','SRC-0246','used','NONE'),
('V1-CS-0398','','V1-CARD-0199','SRC-0241','B','both','yes','yes','SRC-0241','used','NONE'),
('V1-CS-0399','','V1-CARD-0199','SRC-0242','B','both','yes','yes','SRC-0242','used','NONE'),
('V1-CS-0400','','V1-CARD-0200','SRC-0241','B','both','yes','yes','SRC-0241','used','NONE'),
('V1-CS-0401','','V1-CARD-0200','SRC-0242','B','both','yes','yes','SRC-0242','used','NONE'),
('V1-CS-0402','','V1-CARD-0201','SRC-0241','B','both','yes','yes','SRC-0241','used','NONE'),
('V1-CS-0403','','V1-CARD-0201','SRC-0242','B','both','yes','yes','SRC-0242','used','NONE'),
('V1-CS-0404','','V1-CARD-0202','SRC-0243','B','both','yes','yes','SRC-0243','used','NONE'),
('V1-CS-0405','','V1-CARD-0202','SRC-0244','B','both','yes','yes','SRC-0244','used','NONE'),
('V1-CS-0406','','V1-CARD-0203','SRC-0243','B','both','yes','yes','SRC-0243','used','NONE'),
('V1-CS-0407','','V1-CARD-0203','SRC-0244','B','both','yes','yes','SRC-0244','used','NONE'),
('V1-CS-0408','','V1-CARD-0204','SRC-0243','B','both','yes','yes','SRC-0243','used','NONE'),
('V1-CS-0409','','V1-CARD-0204','SRC-0244','B','both','yes','yes','SRC-0244','used','NONE'),
('V1-CS-0410','','V1-CARD-0205','SRC-0245','B','both','yes','yes','SRC-0245','used','NONE'),
('V1-CS-0411','','V1-CARD-0205','SRC-0246','B','both','yes','yes','SRC-0246','used','NONE'),
('V1-CS-0412','','V1-CARD-0206','SRC-0245','B','both','yes','yes','SRC-0245','used','NONE'),
('V1-CS-0413','','V1-CARD-0206','SRC-0246','B','both','yes','yes','SRC-0246','used','NONE'),
('V1-CS-0414','','V1-CARD-0207','SRC-0245','B','both','yes','yes','SRC-0245','used','NONE'),
('V1-CS-0415','','V1-CARD-0207','SRC-0246','B','both','yes','yes','SRC-0246','used','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0236','WEB-CE-B13','CAND-B13-0236','V1-ENT-0308','CREATED','V1-ENT-0311','保罗·柯艾略创作《牧羊少年奇幻之旅》（O Alquimista）','high','accepted','WEB-CE-B13','1','NONE'),
('V1-REL-0237','WEB-CE-B13','CAND-B13-0237','V1-ENT-0308','CREATED','V1-ENT-0312','保罗·柯艾略创作《维罗妮卡决定去死》（Veronika Decide Morrer）','high','accepted','WEB-CE-B13','1','NONE'),
('V1-REL-0238','WEB-CE-B13','CAND-B13-0238','V1-ENT-0308','CREATED','V1-ENT-0313','保罗·柯艾略创作《十一分钟》（Onze Minutos）','high','accepted','WEB-CE-B13','1','NONE'),
('V1-REL-0239','WEB-CE-B13','CAND-B13-0239','V1-ENT-0309','CREATED','V1-ENT-0314','卡洛斯·德鲁蒙德·德·安德拉德创作《某种诗》（Alguma poesia）','high','accepted','WEB-CE-B13','1','NONE'),
('V1-REL-0240','WEB-CE-B13','CAND-B13-0240','V1-ENT-0309','CREATED','V1-ENT-0315','卡洛斯·德鲁蒙德·德·安德拉德创作《人民的玫瑰》（A rosa do povo）','high','accepted','WEB-CE-B13','1','NONE'),
('V1-REL-0241','WEB-CE-B13','CAND-B13-0241','V1-ENT-0309','CREATED','V1-ENT-0316','卡洛斯·德鲁蒙德·德·安德拉德创作《明晰之谜》（Claro enigma）','high','accepted','WEB-CE-B13','1','NONE'),
('V1-REL-0242','WEB-CE-B13','CAND-B13-0242','V1-ENT-0310','CREATED','V1-ENT-0317','尼古拉斯·纪廉创作《松调》（Motivos de son）','high','accepted','WEB-CE-B13','1','NONE'),
('V1-REL-0243','WEB-CE-B13','CAND-B13-0243','V1-ENT-0310','CREATED','V1-ENT-0318','尼古拉斯·纪廉创作《桑戈罗·科松戈》（Sóngoro cosongo）','high','accepted','WEB-CE-B13','1','NONE'),
('V1-REL-0244','WEB-CE-B13','CAND-B13-0244','V1-ENT-0310','CREATED','V1-ENT-0319','尼古拉斯·纪廉创作《西印度公司》（West Indies, Ltd.）','high','accepted','WEB-CE-B13','1','NONE'),
('V1-REL-0245','WEB-CE-B13','CAND-B13-0245','V1-ENT-0308','ASSOCIATED_WITH_PLACE','V1-ENT-0183','保罗·柯艾略与巴西关联','high','accepted','WEB-CE-B13','1','NONE'),
('V1-REL-0246','WEB-CE-B13','CAND-B13-0246','V1-ENT-0309','ASSOCIATED_WITH_PLACE','V1-ENT-0183','卡洛斯·德鲁蒙德·德·安德拉德与巴西关联','high','accepted','WEB-CE-B13','1','NONE'),
('V1-REL-0247','WEB-CE-B13','CAND-B13-0247','V1-ENT-0310','ASSOCIATED_WITH_PLACE','V1-ENT-0235','尼古拉斯·纪廉与古巴关联','high','accepted','WEB-CE-B13','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0236','SRC-0241'),('V1-REL-0237','SRC-0241'),('V1-REL-0238','SRC-0241'),
('V1-REL-0239','SRC-0243'),('V1-REL-0240','SRC-0243'),('V1-REL-0241','SRC-0243'),
('V1-REL-0242','SRC-0245'),('V1-REL-0243','SRC-0245'),('V1-REL-0244','SRC-0245'),
('V1-REL-0245','SRC-0241'),('V1-REL-0246','SRC-0244'),('V1-REL-0247','SRC-0246');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0261','V1-REL-0236','CAND-B13-0236','SRC-0241','','','ABL bibliography links O Alquimista to Coelho.','high','eligible_evidence','WEB-CE-B13'),
('V1-EV-0262','V1-REL-0237','CAND-B13-0237','SRC-0241','','','ABL bibliography links Veronika Decide Morrer to Coelho.','high','eligible_evidence','WEB-CE-B13'),
('V1-EV-0263','V1-REL-0238','CAND-B13-0238','SRC-0241','','','ABL bibliography links Onze Minutos to Coelho.','high','eligible_evidence','WEB-CE-B13'),
('V1-EV-0264','V1-REL-0239','CAND-B13-0239','SRC-0243','','','ABL Poesias list links Alguma poesia to Drummond.','high','eligible_evidence','WEB-CE-B13'),
('V1-EV-0265','V1-REL-0240','CAND-B13-0240','SRC-0243','','','ABL Poesias list links A rosa do povo to Drummond.','high','eligible_evidence','WEB-CE-B13'),
('V1-EV-0266','V1-REL-0241','CAND-B13-0241','SRC-0243','','','ABL Poesias list links Claro enigma to Drummond.','high','eligible_evidence','WEB-CE-B13'),
('V1-EV-0267','V1-REL-0242','CAND-B13-0242','SRC-0245','','','Cervantes bibliography links Motivos de son to Guillén.','high','eligible_evidence','WEB-CE-B13'),
('V1-EV-0268','V1-REL-0243','CAND-B13-0243','SRC-0245','','','Cervantes bibliography links Sóngoro cosongo to Guillén.','high','eligible_evidence','WEB-CE-B13'),
('V1-EV-0269','V1-REL-0244','CAND-B13-0244','SRC-0245','','','Cervantes bibliography links West Indies, Ltd. to Guillén.','high','eligible_evidence','WEB-CE-B13'),
('V1-EV-0270','V1-REL-0245','CAND-B13-0245','SRC-0241','','','ABL identifies Coelho as a Brazilian author from Rio de Janeiro.','high','eligible_evidence','WEB-CE-B13'),
('V1-EV-0271','V1-REL-0246','CAND-B13-0246','SRC-0244','','','BNDigital establishes Drummond in the Brazilian author context.','high','eligible_evidence','WEB-CE-B13'),
('V1-EV-0272','V1-REL-0247','CAND-B13-0247','SRC-0246','','','CVC establishes Guillén in the Cuban context.','high','eligible_evidence','WEB-CE-B13');

UPDATE relationship_evidence SET source_title=(SELECT title FROM sources WHERE sources.source_id=relationship_evidence.source_id) WHERE evidence_id BETWEEN 'V1-EV-0261' AND 'V1-EV-0272';

INSERT INTO metadata (key,value) VALUES ('last_change_set','WEB-CE-B13') ON CONFLICT(key) DO UPDATE SET value=excluded.value;
UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';
