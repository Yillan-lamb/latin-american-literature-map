-- WEB-CE-B16: Luna Max; Luis Sepúlveda, Guadalupe Nettel, Cristina Peri Rossi.

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0261','B16-SRC-0261','Sepúlveda, Luis','Sepúlveda, Luis','Biblioteca Nacional de Chile, Memoria Chilena','','Biblioteca Nacional de Chile','','','web_page','','es','B','access_pass','WEB-CE-B16','Luis Sepúlveda bibliography; Chilean author context; Un viejo que leía novelas de amor Madrid Azanca/Ediciones Júcar 1989 edition','remote_only','','https://www.memoriachilena.gob.cl/602/w3-propertyvalue-128650.html'),
('SRC-0262','B16-SRC-0262','La narrativa del chileno Luis Sepúlveda','La narrativa del chileno Luis Sepúlveda','Juan Gabriel Araya G.','','Universidad del Bío-Bío / Biblioteca Nacional Digital de Chile','','','web_page','','es','A','access_pass','WEB-CE-B16','Sepúlveda 1949; Un viejo que leía novelas de amor cited in a 1993 Tusquets initial-books list; Mundo del fin del mundo 1994; Historia de una gaviota y del gato que le enseñó a volar 1996; novel/travel narrative and children''s-novel distinctions','remote_only','','https://www.bibliotecanacionaldigital.gob.cl/colecciones/BND/00/RC/RC0049657.pdf'),
('SRC-0263','B16-SRC-0263','Guadalupe Nettel','Guadalupe Nettel','Editorial Anagrama','','Editorial Anagrama','','','web_page','','es','B','access_pass','WEB-CE-B16','Guadalupe Nettel, Ciudad de México 1973; bibliography including Pétalos y otras historias incómodas, El cuerpo en que nací, La hija única and El matrimonio de los peces rojos','remote_only','','https://www.anagrama-ed.es/autor/nettel-guadalupe-785'),
('SRC-0264','B16-SRC-0264','La hija única','La hija única','Editorial Anagrama','','Editorial Anagrama','','','web_page','','es','B','access_pass','WEB-CE-B16','La hija única title, Guadalupe Nettel attribution, novel form and 16 September 2020 publication','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/la-hija-unica/9788433999061/NH_652'),
('SRC-0265','B16-SRC-0265','El matrimonio de los peces rojos','El matrimonio de los peces rojos','Editorial Páginas de Espuma','','Páginas de Espuma','','','web_page','','es','B','access_pass','WEB-CE-B16','El matrimonio de los peces rojos title, Guadalupe Nettel attribution, May 2013 publication and five-narration story-collection description','remote_only','','https://paginasdeespuma.com/libro/el-matrimonio-de-los-peces-rojos/'),
('SRC-0266','B16-SRC-0266','Petals and other awkward stories','Pétalos y otras historias incómodas','Editorial Anagrama','','Editorial Anagrama','','','web_page','','en','B','access_pass','WEB-CE-B16','Pétalos y otras historias incómodas original title, Guadalupe Nettel attribution, short-story description and 4 February 2008 publication','remote_only','','https://www.anagrama-ed.es/foreign-rights/book/narrativas-hispanicas/petalos-y-otras-historias-incomodas/9788433971661/NH_428'),
('SRC-0267','B16-SRC-0267','Cristina Peri Rossi. Biografía','Cristina Peri Rossi. Biografía','Instituto Cervantes, Departamento de Bibliotecas y Documentación','','Instituto Cervantes','','','web_page','','es','B','access_pass','WEB-CE-B16','Cristina Peri Rossi born Montevideo, Uruguay 1941; writer, journalist and activist; works across prose and poetry including Descripción de un naufragio','remote_only','','https://www.cervantes.es/bibliotecas_documentacion_espanol/creadores/peri_rossi_cristina.htm'),
('SRC-0268','B16-SRC-0268','Cristina Peri Rossi. Cronología de obras','Cristina Peri Rossi. Cronología de obras','Instituto Cervantes, Departamento de Bibliotecas y Documentación','','Instituto Cervantes','','','web_page','','es','B','access_pass','WEB-CE-B16','Peri Rossi chronology: Descripción de un naufragio 1975 poetry; La tarde del dinosaurio 1976 relatos; Los amores equivocados 2015 relatos; author genre context','remote_only','','https://www.cervantes.es/bibliotecas_documentacion_espanol/creadores/peri_rossi_cristina_cronologia.htm'),
('SRC-0269','B16-SRC-0269','BIBLIOGRAFÍA DE CRISTINA PERI ROSSI','BIBLIOGRAFÍA DE CRISTINA PERI ROSSI','Instituto Cervantes, Departamento de Bibliotecas y Documentación','','Instituto Cervantes','','','web_page','','es','B','access_pass','WEB-CE-B16','Bibliographic records for Descripción de un naufragio 1975 Lumen poetry edition and La tarde del dinosaurio 1976 Planeta story edition','remote_only','','https://www.cervantes.es/imagenes/File/biblioteca/bibliografias/peri_rossi_cristina_bibliografia_2021.pdf');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0344','author','路易斯·塞普尔韦达','Luis Sepúlveda','candidate','1','CAND-B16-SEPULVEDA-AUTHOR','Memoria Chilena bibliography and Biblioteca Nacional Digital academic article; Chinese label remains provisional','NONE'),
('V1-ENT-0347','work','《一个老人读爱情小说》','Un viejo que leía novelas de amor','candidate','1','CAND-B16-SEPULVEDA-W01','Memoria Chilena lists the 1989 Madrid Azanca edition; the BND article cites a later 1993 Tusquets edition, so the edition distinction is retained','BIBLIOGRAPHIC-DISPUTE'),
('V1-ENT-0348','work','《一只海鸥和教它飞翔的猫》','Historia de una gaviota y del gato que le enseñó a volar','candidate','1','CAND-B16-SEPULVEDA-W02','BND academic bibliography calls it a 1996 children''s novel','NONE'),
('V1-ENT-0349','work','《世界尽头》','Mundo del fin del mundo','candidate','1','CAND-B16-SEPULVEDA-W03','BND academic bibliography dates the title to 1994 and distinguishes its travel-narrative form','NONE'),
('V1-ENT-0345','author','瓜达卢佩·内特尔','Guadalupe Nettel','candidate','1','CAND-B16-NETTEL-AUTHOR','Editorial Anagrama author page identifies the Mexican author and her novel/story bibliography; Chinese labels remain provisional','NONE'),
('V1-ENT-0350','work','《独生女儿》','La hija única','candidate','1','CAND-B16-NETTEL-W01','Anagrama catalogue identifies the title as a novel and dates its publication to 16 September 2020','NONE'),
('V1-ENT-0351','collection','《红鱼之姻》','El matrimonio de los peces rojos','candidate','1','CAND-B16-NETTEL-W02','Páginas de Espuma catalogue dates the book to May 2013 and describes five narrations','NONE'),
('V1-ENT-0352','collection','《真正的孤独》','Pétalos y otras historias incómodas','candidate','1','CAND-B16-NETTEL-W03','Anagrama foreign-rights page establishes the Spanish original and 2008 publication; the Chinese label is provisional and is not used as a Spanish-title fact','NONE'),
('V1-ENT-0346','author','克里斯蒂娜·佩里·罗西','Cristina Peri Rossi','candidate','1','CAND-B16-PERI-ROSSI-AUTHOR','Instituto Cervantes biography, chronology and bibliography; Chinese labels remain provisional','NONE'),
('V1-ENT-0353','collection','《错爱》','Los amores equivocados','candidate','1','CAND-B16-PERI-ROSSI-W01','Cervantes chronology lists the 2015 relatos title; Chinese label is provisional','NONE'),
('V1-ENT-0354','collection','《恐龙的下午》','La tarde del dinosaurio','candidate','1','CAND-B16-PERI-ROSSI-W02','Cervantes chronology lists the 1976 relatos title and bibliography gives the 1976 Planeta story edition','NONE'),
('V1-ENT-0355','collection','《沉船记》','Descripción de un naufragio','candidate','1','CAND-B16-PERI-ROSSI-W03','Cervantes chronology classifies the 1975 title under poetry and the bibliography records its Lumen poetry edition','NONE');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0344','CAND-B16-SEPULVEDA-AUTHOR','WEB-CE-B16','CAND-B16-SEPULVEDA-AUTHOR','V1-ENT-0344','create','B16 fresh-context Reviewer PASS (LUNA-MAX-B16-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0347','CAND-B16-SEPULVEDA-W01','WEB-CE-B16','CAND-B16-SEPULVEDA-W01','V1-ENT-0347','create','B16 fresh-context Reviewer PASS (LUNA-MAX-B16-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0348','CAND-B16-SEPULVEDA-W02','WEB-CE-B16','CAND-B16-SEPULVEDA-W02','V1-ENT-0348','create','B16 fresh-context Reviewer PASS (LUNA-MAX-B16-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0349','CAND-B16-SEPULVEDA-W03','WEB-CE-B16','CAND-B16-SEPULVEDA-W03','V1-ENT-0349','create','B16 fresh-context Reviewer PASS (LUNA-MAX-B16-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0345','CAND-B16-NETTEL-AUTHOR','WEB-CE-B16','CAND-B16-NETTEL-AUTHOR','V1-ENT-0345','create','B16 fresh-context Reviewer PASS (LUNA-MAX-B16-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0350','CAND-B16-NETTEL-W01','WEB-CE-B16','CAND-B16-NETTEL-W01','V1-ENT-0350','create','B16 fresh-context Reviewer PASS (LUNA-MAX-B16-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0351','CAND-B16-NETTEL-W02','WEB-CE-B16','CAND-B16-NETTEL-W02','V1-ENT-0351','create','B16 fresh-context Reviewer PASS (LUNA-MAX-B16-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0352','CAND-B16-NETTEL-W03','WEB-CE-B16','CAND-B16-NETTEL-W03','V1-ENT-0352','create','B16 fresh-context Reviewer PASS (LUNA-MAX-B16-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0346','CAND-B16-PERI-ROSSI-AUTHOR','WEB-CE-B16','CAND-B16-PERI-ROSSI-AUTHOR','V1-ENT-0346','create','B16 fresh-context Reviewer PASS (LUNA-MAX-B16-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0353','CAND-B16-PERI-ROSSI-W01','WEB-CE-B16','CAND-B16-PERI-ROSSI-W01','V1-ENT-0353','create','B16 fresh-context Reviewer PASS (LUNA-MAX-B16-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0354','CAND-B16-PERI-ROSSI-W02','WEB-CE-B16','CAND-B16-PERI-ROSSI-W02','V1-ENT-0354','create','B16 fresh-context Reviewer PASS (LUNA-MAX-B16-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0355','CAND-B16-PERI-ROSSI-W03','WEB-CE-B16','CAND-B16-PERI-ROSSI-W03','V1-ENT-0355','create','B16 fresh-context Reviewer PASS (LUNA-MAX-B16-REVIEW, 2026-08-22); source/evidence and migration replay verified');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0232','','V1-ENT-0344','author','路易斯·塞普尔韦达','路易斯·塞普尔韦达','Luis Sepúlveda','智利','es','1949–2020','智利小说家与旅行写作者','WEB-CE-B16','meets','NONE','### 路易斯·塞普尔韦达｜Luis Sepúlveda — source-backed author entry for WEB-CE-B16.'),
('V1-CARD-0233','','V1-ENT-0347','work','《一个老人读爱情小说》','路易斯·塞普尔韦达','Un viejo que leía novelas de amor','智利','es','first_book_edition_year=1989','小说','WEB-CE-B16','meets','BIBLIOGRAPHIC-DISPUTE','### 《一个老人读爱情小说》｜Un viejo que leía novelas de amor — source-backed 小说 entry; original title retained.'),
('V1-CARD-0234','','V1-ENT-0348','work','《一只海鸥和教它飞翔的猫》','路易斯·塞普尔韦达','Historia de una gaviota y del gato que le enseñó a volar','智利','es','1996','儿童小说','WEB-CE-B16','meets','NONE','### 《一只海鸥和教它飞翔的猫》｜Historia de una gaviota y del gato que le enseñó a volar — source-backed 儿童小说 entry; original title retained.'),
('V1-CARD-0235','','V1-ENT-0349','work','《世界尽头》','路易斯·塞普尔韦达','Mundo del fin del mundo','智利','es','1994','旅行叙事','WEB-CE-B16','meets','NONE','### 《世界尽头》｜Mundo del fin del mundo — source-backed 旅行叙事 entry; original title retained.'),
('V1-CARD-0236','','V1-ENT-0345','author','瓜达卢佩·内特尔','瓜达卢佩·内特尔','Guadalupe Nettel','墨西哥','es','1973–present','墨西哥小说家与短篇小说家','WEB-CE-B16','meets','NONE','### 瓜达卢佩·内特尔｜Guadalupe Nettel — source-backed author entry for WEB-CE-B16.'),
('V1-CARD-0237','','V1-ENT-0350','work','《独生女儿》','瓜达卢佩·内特尔','La hija única','墨西哥','es','2020','小说','WEB-CE-B16','meets','NONE','### 《独生女儿》｜La hija única — source-backed 小说 entry; original title retained.'),
('V1-CARD-0238','','V1-ENT-0351','collection','《红鱼之姻》','瓜达卢佩·内特尔','El matrimonio de los peces rojos','墨西哥','es','2013','短篇小说集','WEB-CE-B16','meets','NONE','### 《红鱼之姻》｜El matrimonio de los peces rojos — source-backed 短篇小说集 entry; original title retained.'),
('V1-CARD-0239','','V1-ENT-0352','collection','《真正的孤独》','瓜达卢佩·内特尔','Pétalos y otras historias incómodas','墨西哥','es','2008','短篇小说集','WEB-CE-B16','meets','NONE','### 《真正的孤独》｜Pétalos y otras historias incómodas — source-backed 短篇小说集 entry; original title retained.'),
('V1-CARD-0240','','V1-ENT-0346','author','克里斯蒂娜·佩里·罗西','克里斯蒂娜·佩里·罗西','Cristina Peri Rossi','乌拉圭','es','1941–present','乌拉圭诗人、小说家与短篇小说家','WEB-CE-B16','meets','NONE','### 克里斯蒂娜·佩里·罗西｜Cristina Peri Rossi — source-backed author entry for WEB-CE-B16.'),
('V1-CARD-0241','','V1-ENT-0353','collection','《错爱》','克里斯蒂娜·佩里·罗西','Los amores equivocados','乌拉圭','es','2015','短篇小说集','WEB-CE-B16','meets','NONE','### 《错爱》｜Los amores equivocados — source-backed 短篇小说集 entry; original title retained.'),
('V1-CARD-0242','','V1-ENT-0354','collection','《恐龙的下午》','克里斯蒂娜·佩里·罗西','La tarde del dinosaurio','乌拉圭','es','1976','短篇小说集','WEB-CE-B16','meets','NONE','### 《恐龙的下午》｜La tarde del dinosaurio — source-backed 短篇小说集 entry; original title retained.'),
('V1-CARD-0243','','V1-ENT-0355','collection','《沉船记》','克里斯蒂娜·佩里·罗西','Descripción de un naufragio','乌拉圭','es','1975','诗集','WEB-CE-B16','meets','NONE','### 《沉船记》｜Descripción de un naufragio — source-backed 诗集 entry; original title retained.');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-0926','WEB-CE-B16','V1-CARD-0232','V1-ENT-0344','birth_year','1949','fact','SRC-0262','high','candidate_for_staging_review','Official source identifies Luis Sepúlveda birth year.'),
('V1-FCT-0927','WEB-CE-B16','V1-CARD-0232','V1-ENT-0344','career_note','小说家、记者与旅行作家','fact','SRC-0262','high','candidate_for_staging_review','Source-backed career description for Luis Sepúlveda.'),
('V1-FCT-0928','WEB-CE-B16','V1-CARD-0232','V1-ENT-0344','literary_identity','智利小说家与旅行写作者','fact','SRC-0262','high','candidate_for_staging_review','Conservative literary identity derived from the cited author/chronology source.'),
('V1-FCT-0929','WEB-CE-B16','V1-CARD-0233','V1-ENT-0347','entity_layer','work','metadata','SRC-0261','high','candidate_for_staging_review','Entity layer is recorded as work.'),
('V1-FCT-0930','WEB-CE-B16','V1-CARD-0233','V1-ENT-0347','first_book_edition_year','1989','bibliographic','SRC-0261','medium','candidate_for_staging_review','1989 is retained as a book-edition anchor; first-publication chronology remains open.'),
('V1-FCT-0931','WEB-CE-B16','V1-CARD-0233','V1-ENT-0347','genre_or_form','小说','bibliographic','SRC-0261','high','candidate_for_staging_review','Cited source supports the conservative form label 小说.'),
('V1-FCT-0932','WEB-CE-B16','V1-CARD-0234','V1-ENT-0348','entity_layer','work','metadata','SRC-0262','high','candidate_for_staging_review','Entity layer is recorded as work.'),
('V1-FCT-0933','WEB-CE-B16','V1-CARD-0234','V1-ENT-0348','first_publication_year','1996','bibliographic','SRC-0262','high','candidate_for_staging_review','Cited source dates the title to 1996.'),
('V1-FCT-0934','WEB-CE-B16','V1-CARD-0234','V1-ENT-0348','genre_or_form','儿童小说','bibliographic','SRC-0262','high','candidate_for_staging_review','Cited source supports the conservative form label 儿童小说.'),
('V1-FCT-0935','WEB-CE-B16','V1-CARD-0235','V1-ENT-0349','entity_layer','work','metadata','SRC-0262','high','candidate_for_staging_review','Entity layer is recorded as work.'),
('V1-FCT-0936','WEB-CE-B16','V1-CARD-0235','V1-ENT-0349','first_publication_year','1994','bibliographic','SRC-0262','high','candidate_for_staging_review','Cited source dates the title to 1994.'),
('V1-FCT-0937','WEB-CE-B16','V1-CARD-0235','V1-ENT-0349','genre_or_form','旅行叙事','bibliographic','SRC-0262','high','candidate_for_staging_review','Cited source supports the conservative form label 旅行叙事.'),
('V1-FCT-0938','WEB-CE-B16','V1-CARD-0236','V1-ENT-0345','birth_year','1973','fact','SRC-0263','high','candidate_for_staging_review','Official source identifies Guadalupe Nettel birth year.'),
('V1-FCT-0939','WEB-CE-B16','V1-CARD-0236','V1-ENT-0345','career_note','小说家、短篇小说家与散文作者','fact','SRC-0263','high','candidate_for_staging_review','Source-backed career description for Guadalupe Nettel.'),
('V1-FCT-0940','WEB-CE-B16','V1-CARD-0236','V1-ENT-0345','literary_identity','墨西哥小说家与短篇小说家','fact','SRC-0263','high','candidate_for_staging_review','Conservative literary identity derived from the cited author/chronology source.'),
('V1-FCT-0941','WEB-CE-B16','V1-CARD-0237','V1-ENT-0350','entity_layer','work','metadata','SRC-0264','high','candidate_for_staging_review','Entity layer is recorded as work.'),
('V1-FCT-0942','WEB-CE-B16','V1-CARD-0237','V1-ENT-0350','first_publication_year','2020','bibliographic','SRC-0264','high','candidate_for_staging_review','Cited source dates the title to 2020.'),
('V1-FCT-0943','WEB-CE-B16','V1-CARD-0237','V1-ENT-0350','genre_or_form','小说','bibliographic','SRC-0264','high','candidate_for_staging_review','Cited source supports the conservative form label 小说.'),
('V1-FCT-0944','WEB-CE-B16','V1-CARD-0238','V1-ENT-0351','entity_layer','collection','metadata','SRC-0265','high','candidate_for_staging_review','Entity layer is recorded as collection.'),
('V1-FCT-0945','WEB-CE-B16','V1-CARD-0238','V1-ENT-0351','first_publication_year','2013','bibliographic','SRC-0265','high','candidate_for_staging_review','Cited source dates the title to 2013.'),
('V1-FCT-0946','WEB-CE-B16','V1-CARD-0238','V1-ENT-0351','genre_or_form','短篇小说集','bibliographic','SRC-0265','high','candidate_for_staging_review','Cited source supports the conservative form label 短篇小说集.'),
('V1-FCT-0947','WEB-CE-B16','V1-CARD-0239','V1-ENT-0352','entity_layer','collection','metadata','SRC-0266','high','candidate_for_staging_review','Entity layer is recorded as collection.'),
('V1-FCT-0948','WEB-CE-B16','V1-CARD-0239','V1-ENT-0352','first_publication_year','2008','bibliographic','SRC-0266','high','candidate_for_staging_review','Cited source dates the title to 2008.'),
('V1-FCT-0949','WEB-CE-B16','V1-CARD-0239','V1-ENT-0352','genre_or_form','短篇小说集','bibliographic','SRC-0266','high','candidate_for_staging_review','Cited source supports the conservative form label 短篇小说集.'),
('V1-FCT-0950','WEB-CE-B16','V1-CARD-0240','V1-ENT-0346','birth_year','1941','fact','SRC-0267','high','candidate_for_staging_review','Official source identifies Cristina Peri Rossi birth year.'),
('V1-FCT-0951','WEB-CE-B16','V1-CARD-0240','V1-ENT-0346','career_note','作家、记者与活动家','fact','SRC-0267','high','candidate_for_staging_review','Source-backed career description for Cristina Peri Rossi.'),
('V1-FCT-0952','WEB-CE-B16','V1-CARD-0240','V1-ENT-0346','literary_identity','乌拉圭诗人、小说家与短篇小说家','fact','SRC-0267','high','candidate_for_staging_review','Conservative literary identity derived from the cited author/chronology source.'),
('V1-FCT-0953','WEB-CE-B16','V1-CARD-0241','V1-ENT-0353','entity_layer','collection','metadata','SRC-0268','high','candidate_for_staging_review','Entity layer is recorded as collection.'),
('V1-FCT-0954','WEB-CE-B16','V1-CARD-0241','V1-ENT-0353','first_publication_year','2015','bibliographic','SRC-0268','high','candidate_for_staging_review','Cited source dates the title to 2015.'),
('V1-FCT-0955','WEB-CE-B16','V1-CARD-0241','V1-ENT-0353','genre_or_form','短篇小说集','bibliographic','SRC-0268','high','candidate_for_staging_review','Cited source supports the conservative form label 短篇小说集.'),
('V1-FCT-0956','WEB-CE-B16','V1-CARD-0242','V1-ENT-0354','entity_layer','collection','metadata','SRC-0268','high','candidate_for_staging_review','Entity layer is recorded as collection.'),
('V1-FCT-0957','WEB-CE-B16','V1-CARD-0242','V1-ENT-0354','first_publication_year','1976','bibliographic','SRC-0268','high','candidate_for_staging_review','Cited source dates the title to 1976.'),
('V1-FCT-0958','WEB-CE-B16','V1-CARD-0242','V1-ENT-0354','genre_or_form','短篇小说集','bibliographic','SRC-0268','high','candidate_for_staging_review','Cited source supports the conservative form label 短篇小说集.'),
('V1-FCT-0959','WEB-CE-B16','V1-CARD-0243','V1-ENT-0355','entity_layer','collection','metadata','SRC-0268','high','candidate_for_staging_review','Entity layer is recorded as collection.'),
('V1-FCT-0960','WEB-CE-B16','V1-CARD-0243','V1-ENT-0355','first_publication_year','1975','bibliographic','SRC-0268','high','candidate_for_staging_review','Cited source dates the title to 1975.'),
('V1-FCT-0961','WEB-CE-B16','V1-CARD-0243','V1-ENT-0355','genre_or_form','诗集','bibliographic','SRC-0268','high','candidate_for_staging_review','Cited source supports the conservative form label 诗集.');

INSERT INTO fact_sources (fact_id,source_id,source_title) SELECT fact_id,origin_id,'' FROM facts WHERE fact_id BETWEEN 'V1-FCT-0926' AND 'V1-FCT-0961';
UPDATE fact_sources SET source_title=(SELECT title FROM sources WHERE sources.source_id=fact_sources.source_id) WHERE fact_id BETWEEN 'V1-FCT-0926' AND 'V1-FCT-0961';
INSERT INTO card_facts (card_id,fact_id,admission_status) SELECT card_id,fact_id,'candidate_for_staging_review' FROM facts WHERE fact_id BETWEEN 'V1-FCT-0926' AND 'V1-FCT-0961';

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0460','','V1-CARD-0232','SRC-0261','B','both','yes','yes','SRC-0261','used','NONE'),
('V1-CS-0461','','V1-CARD-0232','SRC-0262','A','both','yes','yes','SRC-0262','used','NONE'),
('V1-CS-0462','','V1-CARD-0233','SRC-0261','B','both','yes','yes','SRC-0261','used','BIBLIOGRAPHIC-DISPUTE'),
('V1-CS-0463','','V1-CARD-0233','SRC-0262','A','both','yes','yes','SRC-0262','used','BIBLIOGRAPHIC-DISPUTE'),
('V1-CS-0464','','V1-CARD-0234','SRC-0262','A','both','yes','yes','SRC-0262','used','NONE'),
('V1-CS-0465','','V1-CARD-0235','SRC-0262','A','both','yes','yes','SRC-0262','used','NONE'),
('V1-CS-0466','','V1-CARD-0236','SRC-0263','B','both','yes','yes','SRC-0263','used','NONE'),
('V1-CS-0467','','V1-CARD-0237','SRC-0264','B','both','yes','yes','SRC-0264','used','NONE'),
('V1-CS-0468','','V1-CARD-0238','SRC-0265','B','both','yes','yes','SRC-0265','used','NONE'),
('V1-CS-0469','','V1-CARD-0239','SRC-0266','B','both','yes','yes','SRC-0266','used','NONE'),
('V1-CS-0470','','V1-CARD-0240','SRC-0267','B','both','yes','yes','SRC-0267','used','NONE'),
('V1-CS-0471','','V1-CARD-0240','SRC-0268','B','both','yes','yes','SRC-0268','used','NONE'),
('V1-CS-0472','','V1-CARD-0241','SRC-0268','B','both','yes','yes','SRC-0268','used','NONE'),
('V1-CS-0473','','V1-CARD-0242','SRC-0268','B','both','yes','yes','SRC-0268','used','NONE'),
('V1-CS-0474','','V1-CARD-0242','SRC-0269','B','both','yes','yes','SRC-0269','used','NONE'),
('V1-CS-0475','','V1-CARD-0243','SRC-0268','B','both','yes','yes','SRC-0268','used','NONE'),
('V1-CS-0476','','V1-CARD-0243','SRC-0269','B','both','yes','yes','SRC-0269','used','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0272','WEB-CE-B16','V1-REL-0272','V1-ENT-0344','CREATED','V1-ENT-0347','路易斯·塞普尔韦达创作《一个老人读爱情小说》（Un viejo que leía novelas de amor）','high','accepted','WEB-CE-B16','1','BIBLIOGRAPHIC-DISPUTE'),
('V1-REL-0273','WEB-CE-B16','V1-REL-0273','V1-ENT-0344','CREATED','V1-ENT-0348','路易斯·塞普尔韦达创作《一只海鸥和教它飞翔的猫》（Historia de una gaviota y del gato que le enseñó a volar）','high','accepted','WEB-CE-B16','1','NONE'),
('V1-REL-0274','WEB-CE-B16','V1-REL-0274','V1-ENT-0344','CREATED','V1-ENT-0349','路易斯·塞普尔韦达创作《世界尽头》（Mundo del fin del mundo）','high','accepted','WEB-CE-B16','1','NONE'),
('V1-REL-0275','WEB-CE-B16','V1-REL-0275','V1-ENT-0345','CREATED','V1-ENT-0350','瓜达卢佩·内特尔创作《独生女儿》（La hija única）','high','accepted','WEB-CE-B16','1','NONE'),
('V1-REL-0276','WEB-CE-B16','V1-REL-0276','V1-ENT-0345','CREATED','V1-ENT-0351','瓜达卢佩·内特尔创作《红鱼之姻》（El matrimonio de los peces rojos）','high','accepted','WEB-CE-B16','1','NONE'),
('V1-REL-0277','WEB-CE-B16','V1-REL-0277','V1-ENT-0345','CREATED','V1-ENT-0352','瓜达卢佩·内特尔创作《真正的孤独》（Pétalos y otras historias incómodas）','high','accepted','WEB-CE-B16','1','NONE'),
('V1-REL-0278','WEB-CE-B16','V1-REL-0278','V1-ENT-0346','CREATED','V1-ENT-0353','克里斯蒂娜·佩里·罗西创作《错爱》（Los amores equivocados）','high','accepted','WEB-CE-B16','1','NONE'),
('V1-REL-0279','WEB-CE-B16','V1-REL-0279','V1-ENT-0346','CREATED','V1-ENT-0354','克里斯蒂娜·佩里·罗西创作《恐龙的下午》（La tarde del dinosaurio）','high','accepted','WEB-CE-B16','1','NONE'),
('V1-REL-0280','WEB-CE-B16','V1-REL-0280','V1-ENT-0346','CREATED','V1-ENT-0355','克里斯蒂娜·佩里·罗西创作《沉船记》（Descripción de un naufragio）','high','accepted','WEB-CE-B16','1','NONE'),
('V1-REL-0281','WEB-CE-B16','V1-REL-0281','V1-ENT-0344','ASSOCIATED_WITH_PLACE','V1-ENT-0123','路易斯·塞普尔韦达与智利关联','high','accepted','WEB-CE-B16','1','NONE'),
('V1-REL-0282','WEB-CE-B16','V1-REL-0282','V1-ENT-0345','ASSOCIATED_WITH_PLACE','V1-ENT-0051','瓜达卢佩·内特尔与墨西哥关联','high','accepted','WEB-CE-B16','1','NONE'),
('V1-REL-0283','WEB-CE-B16','V1-REL-0283','V1-ENT-0346','ASSOCIATED_WITH_PLACE','V1-ENT-0196','克里斯蒂娜·佩里·罗西与乌拉圭关联','high','accepted','WEB-CE-B16','1','NONE');
INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0272','SRC-0261'),
('V1-REL-0272','SRC-0262'),
('V1-REL-0273','SRC-0262'),
('V1-REL-0274','SRC-0262'),
('V1-REL-0275','SRC-0264'),
('V1-REL-0276','SRC-0265'),
('V1-REL-0277','SRC-0266'),
('V1-REL-0278','SRC-0268'),
('V1-REL-0279','SRC-0268'),
('V1-REL-0279','SRC-0269'),
('V1-REL-0280','SRC-0268'),
('V1-REL-0280','SRC-0269'),
('V1-REL-0281','SRC-0261'),
('V1-REL-0281','SRC-0262'),
('V1-REL-0282','SRC-0263'),
('V1-REL-0283','SRC-0267'),
('V1-REL-0283','SRC-0268');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0297','V1-REL-0272','V1-REL-0272','SRC-0261','','','Sepúlveda, Luis directly links the author and cited work/place relation.','high','eligible_evidence','WEB-CE-B16'),
('V1-EV-0298','V1-REL-0273','V1-REL-0273','SRC-0262','','','La narrativa del chileno Luis Sepúlveda directly links the author and cited work/place relation.','high','eligible_evidence','WEB-CE-B16'),
('V1-EV-0299','V1-REL-0274','V1-REL-0274','SRC-0262','','','La narrativa del chileno Luis Sepúlveda directly links the author and cited work/place relation.','high','eligible_evidence','WEB-CE-B16'),
('V1-EV-0300','V1-REL-0275','V1-REL-0275','SRC-0264','','','La hija única directly links the author and cited work/place relation.','high','eligible_evidence','WEB-CE-B16'),
('V1-EV-0301','V1-REL-0276','V1-REL-0276','SRC-0265','','','El matrimonio de los peces rojos directly links the author and cited work/place relation.','high','eligible_evidence','WEB-CE-B16'),
('V1-EV-0302','V1-REL-0277','V1-REL-0277','SRC-0266','','','Petals and other awkward stories directly links the author and cited work/place relation.','high','eligible_evidence','WEB-CE-B16'),
('V1-EV-0303','V1-REL-0278','V1-REL-0278','SRC-0268','','','Cristina Peri Rossi. Cronología de obras directly links the author and cited work/place relation.','high','eligible_evidence','WEB-CE-B16'),
('V1-EV-0304','V1-REL-0279','V1-REL-0279','SRC-0268','','','Cristina Peri Rossi. Cronología de obras directly links the author and cited work/place relation.','high','eligible_evidence','WEB-CE-B16'),
('V1-EV-0305','V1-REL-0280','V1-REL-0280','SRC-0268','','','Cristina Peri Rossi. Cronología de obras directly links the author and cited work/place relation.','high','eligible_evidence','WEB-CE-B16'),
('V1-EV-0306','V1-REL-0281','V1-REL-0281','SRC-0262','','','The BND article identifies Sepúlveda as Chilean and supports the author–Chile association.','high','eligible_evidence','WEB-CE-B16'),
('V1-EV-0307','V1-REL-0282','V1-REL-0282','SRC-0263','','','Guadalupe Nettel directly links the author and cited work/place relation.','high','eligible_evidence','WEB-CE-B16'),
('V1-EV-0308','V1-REL-0283','V1-REL-0283','SRC-0267','','','Cristina Peri Rossi. Biografía directly links the author and cited work/place relation.','high','eligible_evidence','WEB-CE-B16');
UPDATE relationship_evidence SET source_title=(SELECT title FROM sources WHERE sources.source_id=relationship_evidence.source_id) WHERE evidence_id BETWEEN 'V1-EV-0297' AND 'V1-EV-0308';

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0023','B16-GAP-01-0347','bibliographic_dispute','V1-ENT-0347.first_publication_year','open_research','SRC-0261 lists a Madrid Azanca/Ediciones Júcar 1989 edition while SRC-0262 cites a 1993 Tusquets edition in its initial-books list; edition-level chronology is not reconciled in this batch.','1','SOL_REVIEW','Use first_book_edition_year=1989, keep 1993 as a source note only, and do not assert an uncontested first-publication year in public prose.','BIBLIOGRAPHIC-DISPUTE');

INSERT INTO metadata (key,value) VALUES ('last_change_set','WEB-CE-B16') ON CONFLICT(key) DO UPDATE SET value=excluded.value;
UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';
