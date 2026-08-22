-- WEB-CE-B15: Luna Max; Julio Ramón Ribeyro, Juan José Saer, Reinaldo Arenas.

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0254','B15-SRC-0254','Julio Ramón Ribeyro','Julio Ramón Ribeyro','Centro Cultural Inca Garcilaso del Ministerio de Relaciones Exteriores','','Ministerio de Relaciones Exteriores del Perú','','','web_page','','es','B','access_pass','WEB-CE-B15','Ribeyro 1929–1994; Peruvian identity; Los gallinazos sin plumas 1955; Silvio en El Rosedal 1989; La palabra del mudo editions 1973, 1977, 1992; story-collection descriptions','remote_only','','https://www.ccincagarcilaso.gob.pe/la-palabra-escrita/julio-ramon-ribeyro/'),
('SRC-0255','B15-SRC-0255','Soberanía y sumisión en ‘Los gallinazos sin plumas’ de Julio Ramón Ribeyro','Soberanía y sumisión en Los gallinazos sin plumas de Julio Ramón Ribeyro','Santiago López Maguiña','','Universidad Nacional Mayor de San Marcos, Revista Letras','','','web_page','','es','A','access_pass','WEB-CE-B15','Peer-reviewed abstract calls Los gallinazos sin plumas Ribeyro’s first urban story book and dates publication to 1955','remote_only','','https://revistaletras.unmsm.edu.pe/index.php/le/article/view/1369'),
('SRC-0256','B15-SRC-0256','Juan José Saer: un narrador en busca de poesía','Juan José Saer: un narrador en busca de poesía','Secretaría de Cultura, Presidencia de la Nación Argentina','','Argentina.gob.ar','','','web_page','','es','B','access_pass','WEB-CE-B15','Saer 1937–2005; Argentine identity; El limonero real 1974; El entenado 1983; Glosa 1986; novel and poetry context','remote_only','','https://www.argentina.gob.ar/noticias/juan-jose-saer-un-narrador-en-busca-de-poesia'),
('SRC-0257','B15-SRC-0257','The effect of exile in works of Juan José Saer and Daniel Moyano. Methodological proposal to analyze writing and archival processes','The effect of exile in works of Juan José Saer and Daniel Moyano. Methodological proposal to analyze writing and archival processes','Diego Vigna; Verónica Bernabei','','Universidad Nacional del Litoral, El Taco en la Brea','','','web_page','','es','A','access_limited','WEB-CE-B15','UNL journal article/table dates El limonero real 1974, El entenado 1983 and Glosa 1986 and distinguishes writing/genesis from publication; article-view page is stable while direct PDF access was limited during review','remote_only','','https://bibliotecavirtual.unl.edu.ar/publicaciones/index.php/ElTacoenlaBrea/en/article/view/7752/11186'),
('SRC-0258','B15-SRC-0258','Arenas, Reinaldo, 1943-1990 / Reinaldo Arenas Papers','Arenas, Reinaldo, 1943-1990','Princeton University Library','','Princeton University Library, Manuscripts Division','','','web_page','','en','B','access_pass','WEB-CE-B15','Finding-aid entry identifies Reinaldo Arenas 1943–1990 and lists manuscripts of novels, short stories, poetry, plays and essays','remote_only','','https://static-prod.lib.princeton.edu/scsites/aids/msslist/colls1.htm.back'),
('SRC-0259','B15-SRC-0259','Forms of dissidence: ‘Celestino antes del alba’ and ‘El mundo alucinante’ by Reinaldo Arenas','Forms of dissidence: Celestino antes del alba and El mundo alucinante by Reinaldo Arenas','Joey Whitfield','','Cardiff University Press, New Readings','','','web_page','','en','A','access_pass','WEB-CE-B15','Scholarly article identifies Celestino antes del alba 1967 and El mundo alucinante 1968 as Arenas’s first two novels','remote_only','','https://orca.cardiff.ac.uk/id/eprint/120697/'),
('SRC-0260','B15-SRC-0260','Arciniegas: revisión bibliográfica sobre Antes que anochezca de Reinaldo Arenas y sus reescrituras (1993-2022)','Arciniegas: revisión bibliográfica sobre Antes que anochezca de Reinaldo Arenas y sus reescrituras','Lina María Arciniegas','','Universidad de Antioquia, Lingüística y Literatura','','','web_page','','es','A','access_pass','WEB-CE-B15','Scholarly review states Antes que anochezca was originally published in Spanish in 1992 by Tusquets and describes its autobiographical structure','remote_only','','https://revistas.udea.edu.co/index.php/lyl/article/view/354780/20816600');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0332','author','胡利奥·拉蒙·里贝罗','Julio Ramón Ribeyro','candidate','1','CAND-B15-RIBEYRO-AUTHOR','B15 Peruvian Ministry cultural biography and UNMSM article; Chinese display candidate','NONE'),
('V1-ENT-0333','author','胡安·何塞·萨埃尔','Juan José Saer','candidate','1','CAND-B15-SAER-AUTHOR','B15 Argentina government cultural biography and UNL scholarly research; Chinese display candidate','NONE'),
('V1-ENT-0334','author','雷纳尔多·阿雷纳斯','Reinaldo Arenas','candidate','1','CAND-B15-ARENAS-AUTHOR','B15 Princeton finding-aid and university research; Chinese display candidate','NONE'),
('V1-ENT-0335','collection','《没有羽毛的秃鹫》','Los gallinazos sin plumas','candidate','1','CAND-B15-RIBEYRO-W01','B15 official bibliography and UNMSM article; collection layer','NONE'),
('V1-ENT-0336','collection','《西尔维奥在玫瑰园》','Silvio en El Rosedal','candidate','1','CAND-B15-RIBEYRO-W02','B15 official bibliography; collection layer','NONE'),
('V1-ENT-0337','collection','《无言之词》','La palabra del mudo','candidate','1','CAND-B15-RIBEYRO-W03','B15 official bibliography; collection layer; edition-year note','NONE'),
('V1-ENT-0338','work','《皇家柠檬树》','El limonero real','candidate','1','CAND-B15-SAER-W01','B15 Argentina government and UNL scholarly bibliography; work layer','NONE'),
('V1-ENT-0339','work','《继子》','El entenado','candidate','1','CAND-B15-SAER-W02','B15 Argentina government and UNL scholarly bibliography; work layer','NONE'),
('V1-ENT-0340','work','《格洛萨》','Glosa','candidate','1','CAND-B15-SAER-W03','B15 Argentina government and UNL scholarly bibliography; 1985/1986 year gap retained','DISPUTED-YEAR'),
('V1-ENT-0341','work','《黎明前的塞莱斯蒂诺》','Celestino antes del alba','candidate','1','CAND-B15-ARENAS-W01','B15 Cardiff University Press article; work layer','NONE'),
('V1-ENT-0342','work','《幻梦世界》','El mundo alucinante','candidate','1','CAND-B15-ARENAS-W02','B15 Cardiff University Press article; work layer','NONE'),
('V1-ENT-0343','work','《夜幕降临前》','Antes que anochezca','candidate','1','CAND-B15-ARENAS-W03','B15 Universidad de Antioquia review; autobiographical work layer','NONE');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0332','CAND-B15-RIBEYRO-AUTHOR','WEB-CE-B15','CAND-B15-RIBEYRO-AUTHOR','V1-ENT-0332','create','B15 fresh-context Reviewer PASS (LUNA-MAX-B15-REVIEW, 2026-08-21); Peruvian Ministry and UNMSM sources'),
('V1-EMAP-0333','CAND-B15-SAER-AUTHOR','WEB-CE-B15','CAND-B15-SAER-AUTHOR','V1-ENT-0333','create','B15 fresh-context Reviewer PASS (LUNA-MAX-B15-REVIEW, 2026-08-21); Argentina government and UNL sources'),
('V1-EMAP-0334','CAND-B15-ARENAS-AUTHOR','WEB-CE-B15','CAND-B15-ARENAS-AUTHOR','V1-ENT-0334','create','B15 fresh-context Reviewer PASS (LUNA-MAX-B15-REVIEW, 2026-08-21); Princeton and university sources'),
('V1-EMAP-0335','CAND-B15-RIBEYRO-W01','WEB-CE-B15','CAND-B15-RIBEYRO-W01','V1-ENT-0335','create','B15 fresh-context Reviewer PASS (LUNA-MAX-B15-REVIEW, 2026-08-21); official bibliography and scholarly article'),
('V1-EMAP-0336','CAND-B15-RIBEYRO-W02','WEB-CE-B15','CAND-B15-RIBEYRO-W02','V1-ENT-0336','create','B15 fresh-context Reviewer PASS (LUNA-MAX-B15-REVIEW, 2026-08-21); official bibliography'),
('V1-EMAP-0337','CAND-B15-RIBEYRO-W03','WEB-CE-B15','CAND-B15-RIBEYRO-W03','V1-ENT-0337','create','B15 fresh-context Reviewer PASS (LUNA-MAX-B15-REVIEW, 2026-08-21); official bibliography'),
('V1-EMAP-0338','CAND-B15-SAER-W01','WEB-CE-B15','CAND-B15-SAER-W01','V1-ENT-0338','create','B15 fresh-context Reviewer PASS (LUNA-MAX-B15-REVIEW, 2026-08-21); Argentina government and UNL sources'),
('V1-EMAP-0339','CAND-B15-SAER-W02','WEB-CE-B15','CAND-B15-SAER-W02','V1-ENT-0339','create','B15 fresh-context Reviewer PASS (LUNA-MAX-B15-REVIEW, 2026-08-21); Argentina government and UNL sources'),
('V1-EMAP-0340','CAND-B15-SAER-W03','WEB-CE-B15','CAND-B15-SAER-W03','V1-ENT-0340','create','B15 fresh-context Reviewer PASS (LUNA-MAX-B15-REVIEW, 2026-08-21); 1986 retained provisionally with gap'),
('V1-EMAP-0341','CAND-B15-ARENAS-W01','WEB-CE-B15','CAND-B15-ARENAS-W01','V1-ENT-0341','create','B15 fresh-context Reviewer PASS (LUNA-MAX-B15-REVIEW, 2026-08-21); Cardiff scholarly article'),
('V1-EMAP-0342','CAND-B15-ARENAS-W02','WEB-CE-B15','CAND-B15-ARENAS-W02','V1-ENT-0342','create','B15 fresh-context Reviewer PASS (LUNA-MAX-B15-REVIEW, 2026-08-21); Cardiff scholarly article'),
('V1-EMAP-0343','CAND-B15-ARENAS-W03','WEB-CE-B15','CAND-B15-ARENAS-W03','V1-ENT-0343','create','B15 fresh-context Reviewer PASS (LUNA-MAX-B15-REVIEW, 2026-08-21); Universidad de Antioquia review');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0220','','V1-ENT-0332','author','胡利奥·拉蒙·里贝罗','胡利奥·拉蒙·里贝罗','Julio Ramón Ribeyro','秘鲁','es','1929–1994','小说家与短篇小说家','WEB-CE-B15','meets','NONE','### 胡利奥·拉蒙·里贝罗｜Julio Ramón Ribeyro — official Peruvian cultural sources establish the author entry.'),
('V1-CARD-0221','','V1-ENT-0333','author','胡安·何塞·萨埃尔','胡安·何塞·萨埃尔','Juan José Saer','阿根廷','es','1937–2005','小说家与诗人','WEB-CE-B15','meets','NONE','### 胡安·何塞·萨埃尔｜Juan José Saer — Argentina government and UNL sources establish the author entry.'),
('V1-CARD-0222','','V1-ENT-0334','author','雷纳尔多·阿雷纳斯','雷纳尔多·阿雷纳斯','Reinaldo Arenas','古巴','es','1943–1990','小说家与流亡写作者','WEB-CE-B15','meets','NONE','### 雷纳尔多·阿雷纳斯｜Reinaldo Arenas — Princeton and university research establish the author entry.'),
('V1-CARD-0223','','V1-ENT-0335','collection','《没有羽毛的秃鹫》','胡利奥·拉蒙·里贝罗','Los gallinazos sin plumas','秘鲁','es','1955','短篇小说集','WEB-CE-B15','meets','NONE','### 《没有羽毛的秃鹫》｜Los gallinazos sin plumas — official and peer-reviewed sources identify the 1955 urban story collection.'),
('V1-CARD-0224','','V1-ENT-0336','collection','《西尔维奥在玫瑰园》','胡利奥·拉蒙·里贝罗','Silvio en El Rosedal','秘鲁','es','1989','短篇小说集','WEB-CE-B15','meets','NONE','### 《西尔维奥在玫瑰园》｜Silvio en El Rosedal — the official Peruvian cultural page lists the 1989 edition and gathered stories.'),
('V1-CARD-0225','','V1-ENT-0337','collection','《无言之词》','胡利奥·拉蒙·里贝罗','La palabra del mudo','秘鲁','es','1973 edition','短篇小说集','WEB-CE-B15','meets','NONE','### 《无言之词》｜La palabra del mudo — the official page identifies the 1973 Tomos I–II edition; the year is kept as an edition anchor.'),
('V1-CARD-0226','','V1-ENT-0338','work','《皇家柠檬树》','胡安·何塞·萨埃尔','El limonero real','阿根廷','es','1974','小说','WEB-CE-B15','meets','NONE','### 《皇家柠檬树》｜El limonero real — Argentina government and UNL sources date the novel to 1974.'),
('V1-CARD-0227','','V1-ENT-0339','work','《继子》','胡安·何塞·萨埃尔','El entenado','阿根廷','es','1983','小说','WEB-CE-B15','meets','NONE','### 《继子》｜El entenado — Argentina government and UNL sources date the novel to 1983.'),
('V1-CARD-0228','','V1-ENT-0340','work','《格洛萨》','胡安·何塞·萨埃尔','Glosa','阿根廷','es','1986','小说','WEB-CE-B15','meets','DISPUTED-YEAR','### 《格洛萨》｜Glosa — 1986 is retained from Argentina government and UNL sources; an unlocated, unverified 1985 discovery lead remains open for Sol review.'),
('V1-CARD-0229','','V1-ENT-0341','work','《黎明前的塞莱斯蒂诺》','雷纳尔多·阿雷纳斯','Celestino antes del alba','古巴','es','1967','小说','WEB-CE-B15','meets','NONE','### 《黎明前的塞莱斯蒂诺》｜Celestino antes del alba — Cardiff scholarship identifies the 1967 first novel.'),
('V1-CARD-0230','','V1-ENT-0342','work','《幻梦世界》','雷纳尔多·阿雷纳斯','El mundo alucinante','古巴','es','1968','小说','WEB-CE-B15','meets','NONE','### 《幻梦世界》｜El mundo alucinante — Cardiff scholarship identifies the 1968 second novel.'),
('V1-CARD-0231','','V1-ENT-0343','work','《夜幕降临前》','雷纳尔多·阿雷纳斯','Antes que anochezca','古巴','es','1992','自传','WEB-CE-B15','meets','NONE','### 《夜幕降临前》｜Antes que anochezca — Universidad de Antioquia scholarship dates the Spanish original to 1992 and identifies its autobiographical form.');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-0890','WEB-CE-B15','V1-CARD-0220','V1-ENT-0332','birth_year','1929','fact','SRC-0254','high','candidate_for_staging_review','Peruvian Ministry cultural page identifies Ribeyro as Lima 1929.'),
('V1-FCT-0891','WEB-CE-B15','V1-CARD-0220','V1-ENT-0332','death_year','1994','fact','SRC-0254','high','candidate_for_staging_review','Peruvian Ministry cultural page identifies Ribeyro death in 1994.'),
('V1-FCT-0892','WEB-CE-B15','V1-CARD-0220','V1-ENT-0332','career_note','小说家、短篇小说家、剧作家与散文家','fact','SRC-0254','high','candidate_for_staging_review','Official page describes cuentos, novelas, teatro and ensayos.'),
('V1-FCT-0893','WEB-CE-B15','V1-CARD-0223','V1-ENT-0335','entity_layer','collection','metadata','SRC-0255','high','candidate_for_staging_review','UNMSM article calls the title Ribeyro’s first urban story book.'),
('V1-FCT-0894','WEB-CE-B15','V1-CARD-0223','V1-ENT-0335','first_publication_year','1955','bibliographic','SRC-0255','high','candidate_for_staging_review','Peer-reviewed UNMSM abstract dates publication to 1955.'),
('V1-FCT-0895','WEB-CE-B15','V1-CARD-0223','V1-ENT-0335','genre_or_form','短篇小说集','bibliographic','SRC-0255','high','candidate_for_staging_review','UNMSM article describes the title as a first book of urban tales.'),
('V1-FCT-0896','WEB-CE-B15','V1-CARD-0224','V1-ENT-0336','entity_layer','collection','metadata','SRC-0254','high','candidate_for_staging_review','Official page describes the volume as gathered stories.'),
('V1-FCT-0897','WEB-CE-B15','V1-CARD-0224','V1-ENT-0336','first_publication_year','1989','bibliographic','SRC-0254','high','candidate_for_staging_review','Official bibliography lists the Barcelona Tusquets edition in 1989.'),
('V1-FCT-0898','WEB-CE-B15','V1-CARD-0224','V1-ENT-0336','genre_or_form','短篇小说集','bibliographic','SRC-0254','high','candidate_for_staging_review','Official page says the volume gathers stories from Ribeyro’s work as a short-story writer.'),
('V1-FCT-0899','WEB-CE-B15','V1-CARD-0225','V1-ENT-0337','entity_layer','collection','metadata','SRC-0254','high','candidate_for_staging_review','Official bibliography presents La palabra del mudo as multi-volume story collections.'),
('V1-FCT-0900','WEB-CE-B15','V1-CARD-0225','V1-ENT-0337','first_book_edition_year','1973','bibliographic','SRC-0254','medium','candidate_for_staging_review','1973 is the Madrid Milla Batres Tomos I–II edition year; the title covers stories from 1952–1972 and is not assigned a first-publication year.'),
('V1-FCT-0901','WEB-CE-B15','V1-CARD-0225','V1-ENT-0337','genre_or_form','短篇小说集','bibliographic','SRC-0254','high','candidate_for_staging_review','Official page identifies the multi-volume production as cuentos.'),
('V1-FCT-0902','WEB-CE-B15','V1-CARD-0221','V1-ENT-0333','birth_year','1937','fact','SRC-0256','high','candidate_for_staging_review','Argentina government cultural page identifies Saer born in 1937.'),
('V1-FCT-0903','WEB-CE-B15','V1-CARD-0221','V1-ENT-0333','death_year','2005','fact','SRC-0256','high','candidate_for_staging_review','Argentina government cultural page records Saer death in 2005.'),
('V1-FCT-0904','WEB-CE-B15','V1-CARD-0221','V1-ENT-0333','career_note','小说家、短篇小说家、诗人和散文家','fact','SRC-0256','high','candidate_for_staging_review','Argentina government page lists his cuento, novel, poetry and essay production.'),
('V1-FCT-0905','WEB-CE-B15','V1-CARD-0226','V1-ENT-0338','entity_layer','work','metadata','SRC-0256','high','candidate_for_staging_review','Argentina government page lists El limonero real among Saer novels; UNL table corroborates the bibliography.'),
('V1-FCT-0906','WEB-CE-B15','V1-CARD-0226','V1-ENT-0338','first_publication_year','1974','bibliographic','SRC-0257','high','candidate_for_staging_review','UNL scholarly table dates El limonero real to 1974.'),
('V1-FCT-0907','WEB-CE-B15','V1-CARD-0226','V1-ENT-0338','genre_or_form','小说','bibliographic','SRC-0256','high','candidate_for_staging_review','Argentina government page lists El limonero real among Saer novels; UNL table corroborates the bibliography.'),
('V1-FCT-0908','WEB-CE-B15','V1-CARD-0227','V1-ENT-0339','entity_layer','work','metadata','SRC-0256','high','candidate_for_staging_review','Argentina government page lists El entenado among Saer novels; UNL table corroborates the bibliography.'),
('V1-FCT-0909','WEB-CE-B15','V1-CARD-0227','V1-ENT-0339','first_publication_year','1983','bibliographic','SRC-0257','high','candidate_for_staging_review','UNL scholarly table dates El entenado to 1983.'),
('V1-FCT-0910','WEB-CE-B15','V1-CARD-0227','V1-ENT-0339','genre_or_form','小说','bibliographic','SRC-0256','high','candidate_for_staging_review','Argentina government page lists El entenado among Saer novels; UNL table corroborates the bibliography.'),
('V1-FCT-0911','WEB-CE-B15','V1-CARD-0228','V1-ENT-0340','entity_layer','work','metadata','SRC-0256','high','candidate_for_staging_review','Argentina government page lists Glosa among Saer novels; UNL table corroborates the bibliography.'),
('V1-FCT-0912','WEB-CE-B15','V1-CARD-0228','V1-ENT-0340','first_publication_year','1986','bibliographic','SRC-0257','medium','candidate_for_staging_review','UNL table dates Glosa to 1986; an unlocated, unverified 1985 discovery lead remains in the B15 research gap.'),
('V1-FCT-0913','WEB-CE-B15','V1-CARD-0228','V1-ENT-0340','genre_or_form','小说','bibliographic','SRC-0256','high','candidate_for_staging_review','Argentina government page lists Glosa among Saer novels; UNL table corroborates the bibliography.'),
('V1-FCT-0914','WEB-CE-B15','V1-CARD-0222','V1-ENT-0334','birth_year','1943','fact','SRC-0258','high','candidate_for_staging_review','Princeton finding-aid identifies Arenas 1943–1990.'),
('V1-FCT-0915','WEB-CE-B15','V1-CARD-0222','V1-ENT-0334','death_year','1990','fact','SRC-0258','high','candidate_for_staging_review','Princeton finding-aid identifies Arenas 1943–1990.'),
('V1-FCT-0916','WEB-CE-B15','V1-CARD-0222','V1-ENT-0334','career_note','小说家、诗人、剧作家与散文家','fact','SRC-0258','high','candidate_for_staging_review','Princeton finding-aid lists Arenas novels, short stories, poetry, plays and essays.'),
('V1-FCT-0917','WEB-CE-B15','V1-CARD-0229','V1-ENT-0341','entity_layer','work','metadata','SRC-0259','high','candidate_for_staging_review','Cardiff scholarly article identifies Celestino antes del alba as a novel.'),
('V1-FCT-0918','WEB-CE-B15','V1-CARD-0229','V1-ENT-0341','first_publication_year','1967','bibliographic','SRC-0259','high','candidate_for_staging_review','Cardiff article dates the first novel to 1967.'),
('V1-FCT-0919','WEB-CE-B15','V1-CARD-0229','V1-ENT-0341','genre_or_form','小说','bibliographic','SRC-0259','high','candidate_for_staging_review','Cardiff article explicitly calls it a novel.'),
('V1-FCT-0920','WEB-CE-B15','V1-CARD-0230','V1-ENT-0342','entity_layer','work','metadata','SRC-0259','high','candidate_for_staging_review','Cardiff scholarly article identifies El mundo alucinante as a novel.'),
('V1-FCT-0921','WEB-CE-B15','V1-CARD-0230','V1-ENT-0342','first_publication_year','1968','bibliographic','SRC-0259','high','candidate_for_staging_review','Cardiff article dates the second novel to 1968.'),
('V1-FCT-0922','WEB-CE-B15','V1-CARD-0230','V1-ENT-0342','genre_or_form','小说','bibliographic','SRC-0259','high','candidate_for_staging_review','Cardiff article explicitly calls it a novel.'),
('V1-FCT-0923','WEB-CE-B15','V1-CARD-0231','V1-ENT-0343','entity_layer','work','metadata','SRC-0260','high','candidate_for_staging_review','Universidad de Antioquia review identifies the work as an autobiography.'),
('V1-FCT-0924','WEB-CE-B15','V1-CARD-0231','V1-ENT-0343','first_publication_year','1992','bibliographic','SRC-0260','high','candidate_for_staging_review','Universidad de Antioquia review states the Spanish original was published in 1992.'),
('V1-FCT-0925','WEB-CE-B15','V1-CARD-0231','V1-ENT-0343','genre_or_form','自传','bibliographic','SRC-0260','high','candidate_for_staging_review','The review describes the work as an autobiografía.');

INSERT INTO fact_sources (fact_id,source_id,source_title)
SELECT fact_id, origin_id, '' FROM facts WHERE fact_id BETWEEN 'V1-FCT-0890' AND 'V1-FCT-0925';
UPDATE fact_sources SET source_title=(SELECT title FROM sources WHERE sources.source_id=fact_sources.source_id) WHERE fact_id BETWEEN 'V1-FCT-0890' AND 'V1-FCT-0925';

INSERT INTO card_facts (card_id,fact_id,admission_status)
SELECT card_id, fact_id, 'candidate_for_staging_review' FROM facts WHERE fact_id BETWEEN 'V1-FCT-0890' AND 'V1-FCT-0925';

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0438','','V1-CARD-0220','SRC-0254','B','both','yes','yes','SRC-0254','used','NONE'),
('V1-CS-0439','','V1-CARD-0220','SRC-0255','A','both','yes','yes','SRC-0255','used','NONE'),
('V1-CS-0440','','V1-CARD-0221','SRC-0256','B','both','yes','yes','SRC-0256','used','NONE'),
('V1-CS-0441','','V1-CARD-0221','SRC-0257','A','both','yes','yes','SRC-0257','used','NONE'),
('V1-CS-0442','','V1-CARD-0222','SRC-0258','B','both','yes','yes','SRC-0258','used','NONE'),
('V1-CS-0443','','V1-CARD-0222','SRC-0259','A','both','yes','yes','SRC-0259','used','NONE'),
('V1-CS-0444','','V1-CARD-0222','SRC-0260','A','both','yes','yes','SRC-0260','used','NONE'),
('V1-CS-0445','','V1-CARD-0223','SRC-0254','B','both','yes','yes','SRC-0254','used','NONE'),
('V1-CS-0446','','V1-CARD-0223','SRC-0255','A','both','yes','yes','SRC-0255','used','NONE'),
('V1-CS-0447','','V1-CARD-0224','SRC-0254','B','both','yes','yes','SRC-0254','used','NONE'),
('V1-CS-0448','','V1-CARD-0225','SRC-0254','B','both','yes','yes','SRC-0254','used','NONE'),
('V1-CS-0449','','V1-CARD-0226','SRC-0256','B','both','yes','yes','SRC-0256','used','NONE'),
('V1-CS-0450','','V1-CARD-0226','SRC-0257','A','both','yes','yes','SRC-0257','used','NONE'),
('V1-CS-0451','','V1-CARD-0227','SRC-0256','B','both','yes','yes','SRC-0256','used','NONE'),
('V1-CS-0452','','V1-CARD-0227','SRC-0257','A','both','yes','yes','SRC-0257','used','NONE'),
('V1-CS-0453','','V1-CARD-0228','SRC-0256','B','both','yes','yes','SRC-0256','used','DISPUTED-YEAR'),
('V1-CS-0454','','V1-CARD-0228','SRC-0257','A','both','yes','yes','SRC-0257','used','DISPUTED-YEAR'),
('V1-CS-0455','','V1-CARD-0229','SRC-0258','B','both','yes','yes','SRC-0258','used','NONE'),
('V1-CS-0456','','V1-CARD-0229','SRC-0259','A','both','yes','yes','SRC-0259','used','NONE'),
('V1-CS-0457','','V1-CARD-0230','SRC-0258','B','both','yes','yes','SRC-0258','used','NONE'),
('V1-CS-0458','','V1-CARD-0230','SRC-0259','A','both','yes','yes','SRC-0259','used','NONE'),
('V1-CS-0459','','V1-CARD-0231','SRC-0260','A','both','yes','yes','SRC-0260','used','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0260','WEB-CE-B15','CAND-B15-0260','V1-ENT-0332','CREATED','V1-ENT-0335','胡利奥·拉蒙·里贝罗创作《没有羽毛的秃鹫》（Los gallinazos sin plumas）','high','accepted','WEB-CE-B15','1','NONE'),
('V1-REL-0261','WEB-CE-B15','CAND-B15-0261','V1-ENT-0332','CREATED','V1-ENT-0336','胡利奥·拉蒙·里贝罗创作《西尔维奥在玫瑰园》（Silvio en El Rosedal）','high','accepted','WEB-CE-B15','1','NONE'),
('V1-REL-0262','WEB-CE-B15','CAND-B15-0262','V1-ENT-0332','CREATED','V1-ENT-0337','胡利奥·拉蒙·里贝罗编写《无言之词》（La palabra del mudo）','high','accepted','WEB-CE-B15','1','NONE'),
('V1-REL-0263','WEB-CE-B15','CAND-B15-0263','V1-ENT-0333','CREATED','V1-ENT-0338','胡安·何塞·萨埃尔创作《皇家柠檬树》（El limonero real）','high','accepted','WEB-CE-B15','1','NONE'),
('V1-REL-0264','WEB-CE-B15','CAND-B15-0264','V1-ENT-0333','CREATED','V1-ENT-0339','胡安·何塞·萨埃尔创作《继子》（El entenado）','high','accepted','WEB-CE-B15','1','NONE'),
('V1-REL-0265','WEB-CE-B15','CAND-B15-0265','V1-ENT-0333','CREATED','V1-ENT-0340','胡安·何塞·萨埃尔创作《格洛萨》（Glosa）','high','accepted','WEB-CE-B15','1','DISPUTED-YEAR'),
('V1-REL-0266','WEB-CE-B15','CAND-B15-0266','V1-ENT-0334','CREATED','V1-ENT-0341','雷纳尔多·阿雷纳斯创作《黎明前的塞莱斯蒂诺》（Celestino antes del alba）','high','accepted','WEB-CE-B15','1','NONE'),
('V1-REL-0267','WEB-CE-B15','CAND-B15-0267','V1-ENT-0334','CREATED','V1-ENT-0342','雷纳尔多·阿雷纳斯创作《幻梦世界》（El mundo alucinante）','high','accepted','WEB-CE-B15','1','NONE'),
('V1-REL-0268','WEB-CE-B15','CAND-B15-0268','V1-ENT-0334','CREATED','V1-ENT-0343','雷纳尔多·阿雷纳斯创作《夜幕降临前》（Antes que anochezca）','high','accepted','WEB-CE-B15','1','NONE'),
('V1-REL-0269','WEB-CE-B15','CAND-B15-0269','V1-ENT-0332','ASSOCIATED_WITH_PLACE','V1-ENT-0124','胡利奥·拉蒙·里贝罗与秘鲁关联','high','accepted','WEB-CE-B15','1','NONE'),
('V1-REL-0270','WEB-CE-B15','CAND-B15-0270','V1-ENT-0333','ASSOCIATED_WITH_PLACE','V1-ENT-0001','胡安·何塞·萨埃尔与阿根廷关联','high','accepted','WEB-CE-B15','1','NONE'),
('V1-REL-0271','WEB-CE-B15','CAND-B15-0271','V1-ENT-0334','ASSOCIATED_WITH_PLACE','V1-ENT-0096','雷纳尔多·阿雷纳斯与古巴关联','high','accepted','WEB-CE-B15','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0260','SRC-0254'),('V1-REL-0260','SRC-0255'),('V1-REL-0261','SRC-0254'),('V1-REL-0262','SRC-0254'),
('V1-REL-0263','SRC-0256'),('V1-REL-0263','SRC-0257'),('V1-REL-0264','SRC-0256'),('V1-REL-0264','SRC-0257'),('V1-REL-0265','SRC-0256'),('V1-REL-0265','SRC-0257'),
('V1-REL-0266','SRC-0258'),('V1-REL-0266','SRC-0259'),('V1-REL-0267','SRC-0258'),('V1-REL-0267','SRC-0259'),('V1-REL-0268','SRC-0258'),('V1-REL-0268','SRC-0260'),
('V1-REL-0269','SRC-0254'),('V1-REL-0270','SRC-0256'),('V1-REL-0271','SRC-0258'),('V1-REL-0271','SRC-0260');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0285','V1-REL-0260','CAND-B15-0260','SRC-0255','','','UNMSM peer-reviewed abstract links Los gallinazos sin plumas to Ribeyro and dates it 1955.','high','eligible_evidence','WEB-CE-B15'),
('V1-EV-0286','V1-REL-0261','CAND-B15-0261','SRC-0254','','','Official Peruvian cultural page links Silvio en El Rosedal to Ribeyro.','high','eligible_evidence','WEB-CE-B15'),
('V1-EV-0287','V1-REL-0262','CAND-B15-0262','SRC-0254','','','Official bibliography links La palabra del mudo to Ribeyro.','high','eligible_evidence','WEB-CE-B15'),
('V1-EV-0288','V1-REL-0263','CAND-B15-0263','SRC-0256','','','Argentina government cultural page links El limonero real to Saer.','high','eligible_evidence','WEB-CE-B15'),
('V1-EV-0289','V1-REL-0264','CAND-B15-0264','SRC-0256','','','Argentina government cultural page links El entenado to Saer.','high','eligible_evidence','WEB-CE-B15'),
('V1-EV-0290','V1-REL-0265','CAND-B15-0265','SRC-0256','','','Argentina government cultural page links Glosa to Saer; 1986 year conflict is tracked separately.','high','eligible_evidence','WEB-CE-B15'),
('V1-EV-0291','V1-REL-0266','CAND-B15-0266','SRC-0259','','','Cardiff scholarly article identifies Celestino antes del alba as an Arenas novel.','high','eligible_evidence','WEB-CE-B15'),
('V1-EV-0292','V1-REL-0267','CAND-B15-0267','SRC-0259','','','Cardiff scholarly article identifies El mundo alucinante as an Arenas novel.','high','eligible_evidence','WEB-CE-B15'),
('V1-EV-0293','V1-REL-0268','CAND-B15-0268','SRC-0260','','','Universidad de Antioquia review identifies Antes que anochezca as an Arenas autobiography.','high','eligible_evidence','WEB-CE-B15'),
('V1-EV-0294','V1-REL-0269','CAND-B15-0269','SRC-0254','','','Official Peruvian cultural institution identifies Ribeyro as Peruvian.','high','eligible_evidence','WEB-CE-B15'),
('V1-EV-0295','V1-REL-0270','CAND-B15-0270','SRC-0256','','','Argentina government cultural profile identifies Saer as Argentine.','high','eligible_evidence','WEB-CE-B15'),
('V1-EV-0296','V1-REL-0271','CAND-B15-0271','SRC-0258','','','Princeton finding-aid identifies the Cuban author context for Arenas.','high','eligible_evidence','WEB-CE-B15');

UPDATE relationship_evidence SET source_title=(SELECT title FROM sources WHERE sources.source_id=relationship_evidence.source_id) WHERE evidence_id BETWEEN 'V1-EV-0285' AND 'V1-EV-0296';

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0022','B15-GAP-01-0340','bibliographic_dispute','V1-ENT-0340.first_publication_year','open_research','SRC-0256 and SRC-0257 use 1986 for Glosa; an unlocated teaching-material lead mentions 1985 but is not a citable source. Current 1986 fact is provisional pending edition-level reconciliation.','1','SOL_REVIEW','Keep 1986 medium and label 1985 only as an unverified discovery lead; do not claim an uncontested year in public prose.','DISPUTED-YEAR');

INSERT INTO metadata (key,value) VALUES ('last_change_set','WEB-CE-B15') ON CONFLICT(key) DO UPDATE SET value=excluded.value;
UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';
