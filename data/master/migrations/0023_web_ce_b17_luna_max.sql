-- WEB-CE-B17: Luna Max dynamic close-out; Lygia Fagundes Telles, Jorge Icaza, Rómulo Gallegos.
-- Candidate metadata is retained in the accompanying Research Change Set and fresh-context review.

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0270','B17-SRC-0270','Lygia Fagundes Telles | Academia Brasileira de Letras','Lygia Fagundes Telles | Academia Brasileira de Letras','Academia Brasileira de Letras','','Academia Brasileira de Letras','','','web_page','','pt','B','access_pass','WEB-CE-B17','ABL profile: Lygia Fagundes Telles born 19 April 1923 in São Paulo; death 3 April 2022; Brazilian author identity','remote_only','','https://www2.academia.org.br/academicos/lygia-fagundes-telles'),
('SRC-0271','B17-SRC-0271','Bibliografia | Lygia Fagundes Telles','Bibliografia | Lygia Fagundes Telles','Academia Brasileira de Letras','','Academia Brasileira de Letras','','','web_page','','pt','B','access_pass','WEB-CE-B17','ABL bibliography: Ciranda de pedra romance 1954; Antes do baile verde contos 1970; As meninas romance 1973','remote_only','','https://www.academia.org.br/academicos/lygia-fagundes-telles/bibliografia'),
('SRC-0272','B17-SRC-0272','Os contos','Os contos','Lygia Fagundes Telles; posfácio de Walnice Nogueira Galvão','','Companhia das Letras / Biblioteca Nacional do Brasil catalogue','2018','9788535931808','catalog_record','','pt','B','access_pass','WEB-CE-B17','BN catalogue record for Os contos; authority line lists Lygia Fagundes Telles 1918–2022, retained as conflicting birth-year evidence','remote_only','','https://acervo.bn.gov.br/sophia_web/acervo/detalhe/1724755'),
('SRC-0273','B17-SRC-0273','Jorge Icaza : frontera del relato indiginista','Jorge Icaza : frontera del relato indiginista','Manuel Corrales','','Pontificia Universidad Católica del Ecuador / Casa de la Cultura Ecuatoriana','1974','','catalog_record','','es','B','access_pass','WEB-CE-B17','CCE catalogue describes the 1974 monograph and lists Huasipungo, En las calles and El Chulla Romero y Flores','remote_only','','https://biblioteca.casadelacultura.gob.ec/bib/10452'),
('SRC-0274','B17-SRC-0274','Análisis comparativo dialectal de los cuentos El malo de Enrique Gil Gilbert y Barranca Grande de Jorge Icaza','Análisis comparativo dialectal de los cuentos El malo de Enrique Gil Gilbert y Barranca Grande de Jorge Icaza','Ivonne Verónica Mena Reina','','Universidad Central del Ecuador','2021','','pdf','','es','B','access_pass','WEB-CE-B17','UCE thesis biography: Jorge Icaza born Quito 1906, died Quito 1978; novels Huasipungo 1934, En las calles 1935 and El chulla Romero y Flores 1958','remote_only','','https://www.dspace.uce.edu.ec/server/api/core/bitstreams/c4493f6a-e702-4d00-8f4f-653644f5a4a9/content'),
('SRC-0275','B17-SRC-0275','Gallegos, Rómulo','Gallegos, Rómulo','Fundación Empresas Polar','','Fundación Empresas Polar','','','web_page','','es','B','access_pass','WEB-CE-B17','Polar profile: Rómulo Gallegos Caracas 1884–1969; writer, educator and politician; Doña Bárbara 1929, Cantaclaro 1934, Canaima 1935','remote_only','','https://bibliofep.fundacionempresaspolar.org/dhv/entradas/g/gallegos-romulo/'),
('SRC-0276','B17-SRC-0276','NACIMIENTO DE DON RÓMULO GALLEGOS','NACIMIENTO DE DON RÓMULO GALLEGOS','Universidad de Carabobo, Vicerrectorado Académico','','Universidad de Carabobo','2018','','web_page','','es','B','access_pass','WEB-CE-B17','University profile: Gallegos born Caracas 1884, died Caracas 1969; Doña Bárbara 1929 and Canaima 1935','remote_only','','https://viceacademico.uc.edu.ve/efemerides/historia/gallegos');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0356','place','厄瓜多尔','Ecuador','candidate','1','CAND-B17-ECUADOR-PLACE','B17 country coverage node for Jorge Icaza; country polygon only; no center coordinate','NONE'),
('V1-ENT-0357','place','委内瑞拉','Venezuela','candidate','1','CAND-B17-VENEZUELA-PLACE','B17 country coverage node for Rómulo Gallegos; country polygon only; no center coordinate','NONE'),
('V1-ENT-0358','author','莉吉娅·法贡德斯·特莱斯','Lygia Fagundes Telles','candidate','1','CAND-B17-LYGIA-AUTHOR','ABL profile and bibliography establish the author and three selected books; BN authority record lists 1918–2022, so the birth year remains disputed.','DISPUTED-YEAR'),
('V1-ENT-0361','work','《石头圆舞》','Ciranda de pedra','candidate','1','CAND-B17-LYGIA-FAGUNDES-TELLES-61','ABL bibliography lists Ciranda de pedra as a romance in 1954; Chinese label is provisional.','NONE'),
('V1-ENT-0362','collection','《绿色舞会之前》','Antes do baile verde','candidate','1','CAND-B17-LYGIA-FAGUNDES-TELLES-62','ABL bibliography lists Antes do baile verde as contos in 1970; Chinese label is provisional.','NONE'),
('V1-ENT-0363','work','《姑娘们》','As meninas','candidate','1','CAND-B17-LYGIA-FAGUNDES-TELLES-63','ABL bibliography lists As meninas as a romance in 1973; Chinese label is provisional.','NONE'),
('V1-ENT-0359','author','豪尔赫·伊卡萨','Jorge Icaza','candidate','1','CAND-B17-ICAZA-AUTHOR','Ecuadorian library catalogue and Universidad Central del Ecuador thesis establish the author, country and conservative bibliography.','NONE'),
('V1-ENT-0364','work','《瓦西蓬戈》','Huasipungo','candidate','1','CAND-B17-JORGE-ICAZA-64','CCE catalogue lists Huasipungo and the UCE thesis dates the novel to 1934; Chinese label is provisional.','NONE'),
('V1-ENT-0365','work','《在街头》','En las calles','candidate','1','CAND-B17-JORGE-ICAZA-65','CCE catalogue lists En las calles and the UCE thesis dates the novel to 1935; Chinese label is provisional.','NONE'),
('V1-ENT-0366','work','《乔洛·罗梅罗与弗洛雷斯》','El chulla Romero y Flores','candidate','1','CAND-B17-JORGE-ICAZA-66','CCE catalogue lists El Chulla Romero y Flores and the UCE thesis dates the novel to 1958; Chinese label is provisional.','NONE'),
('V1-ENT-0360','author','罗慕洛·加列戈斯','Rómulo Gallegos','candidate','1','CAND-B17-GALLEGOS-AUTHOR','Fundación Empresas Polar and Universidad de Carabobo profiles establish the Venezuelan author, life dates and selected novels.','NONE'),
('V1-ENT-0367','work','《堂娜·芭芭拉》','Doña Bárbara','candidate','1','CAND-B17-RÓMULO-GALLEGOS-67','Polar and Universidad de Carabobo profiles date Doña Bárbara to 1929; Chinese label is provisional.','NONE'),
('V1-ENT-0368','work','《唱歌者》','Cantaclaro','candidate','1','CAND-B17-RÓMULO-GALLEGOS-68','Polar profile dates Cantaclaro to 1934; Chinese label is provisional.','NONE'),
('V1-ENT-0369','work','《卡奈玛》','Canaima','candidate','1','CAND-B17-RÓMULO-GALLEGOS-69','Polar and Universidad de Carabobo profiles date Canaima to 1935; Chinese label is provisional.','NONE');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0356','CAND-B17-ECUADOR-PLACE','WEB-CE-B17','CAND-B17-ECUADOR-PLACE','V1-ENT-0356','create','B17 fresh-context Reviewer PASS (LUNA-MAX-B17-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0357','CAND-B17-VENEZUELA-PLACE','WEB-CE-B17','CAND-B17-VENEZUELA-PLACE','V1-ENT-0357','create','B17 fresh-context Reviewer PASS (LUNA-MAX-B17-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0358','CAND-B17-LYGIA-AUTHOR','WEB-CE-B17','CAND-B17-LYGIA-AUTHOR','V1-ENT-0358','create','B17 fresh-context Reviewer PASS (LUNA-MAX-B17-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0361','CAND-B17-LYGIA-FAGUNDES-TELLES-61','WEB-CE-B17','CAND-B17-LYGIA-FAGUNDES-TELLES-61','V1-ENT-0361','create','B17 fresh-context Reviewer PASS (LUNA-MAX-B17-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0362','CAND-B17-LYGIA-FAGUNDES-TELLES-62','WEB-CE-B17','CAND-B17-LYGIA-FAGUNDES-TELLES-62','V1-ENT-0362','create','B17 fresh-context Reviewer PASS (LUNA-MAX-B17-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0363','CAND-B17-LYGIA-FAGUNDES-TELLES-63','WEB-CE-B17','CAND-B17-LYGIA-FAGUNDES-TELLES-63','V1-ENT-0363','create','B17 fresh-context Reviewer PASS (LUNA-MAX-B17-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0359','CAND-B17-ICAZA-AUTHOR','WEB-CE-B17','CAND-B17-ICAZA-AUTHOR','V1-ENT-0359','create','B17 fresh-context Reviewer PASS (LUNA-MAX-B17-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0364','CAND-B17-JORGE-ICAZA-64','WEB-CE-B17','CAND-B17-JORGE-ICAZA-64','V1-ENT-0364','create','B17 fresh-context Reviewer PASS (LUNA-MAX-B17-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0365','CAND-B17-JORGE-ICAZA-65','WEB-CE-B17','CAND-B17-JORGE-ICAZA-65','V1-ENT-0365','create','B17 fresh-context Reviewer PASS (LUNA-MAX-B17-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0366','CAND-B17-JORGE-ICAZA-66','WEB-CE-B17','CAND-B17-JORGE-ICAZA-66','V1-ENT-0366','create','B17 fresh-context Reviewer PASS (LUNA-MAX-B17-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0360','CAND-B17-GALLEGOS-AUTHOR','WEB-CE-B17','CAND-B17-GALLEGOS-AUTHOR','V1-ENT-0360','create','B17 fresh-context Reviewer PASS (LUNA-MAX-B17-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0367','CAND-B17-RÓMULO-GALLEGOS-67','WEB-CE-B17','CAND-B17-RÓMULO-GALLEGOS-67','V1-ENT-0367','create','B17 fresh-context Reviewer PASS (LUNA-MAX-B17-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0368','CAND-B17-RÓMULO-GALLEGOS-68','WEB-CE-B17','CAND-B17-RÓMULO-GALLEGOS-68','V1-ENT-0368','create','B17 fresh-context Reviewer PASS (LUNA-MAX-B17-REVIEW, 2026-08-22); source/evidence and migration replay verified'),
('V1-EMAP-0369','CAND-B17-RÓMULO-GALLEGOS-69','WEB-CE-B17','CAND-B17-RÓMULO-GALLEGOS-69','V1-ENT-0369','create','B17 fresh-context Reviewer PASS (LUNA-MAX-B17-REVIEW, 2026-08-22); source/evidence and migration replay verified');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0244','','V1-ENT-0358','author','莉吉娅·法贡德斯·特莱斯','莉吉娅·法贡德斯·特莱斯','Lygia Fagundes Telles','巴西','pt','1923–2022','巴西小说家与短篇小说家','WEB-CE-B17','meets','DISPUTED-YEAR','### 莉吉娅·法贡德斯·特莱斯｜Lygia Fagundes Telles — source-backed author entry for WEB-CE-B17.'),
('V1-CARD-0245','','V1-ENT-0361','work','《石头圆舞》','莉吉娅·法贡德斯·特莱斯','Ciranda de pedra','巴西','pt','1954','小说','WEB-CE-B17','meets','NONE','### 《石头圆舞》｜Ciranda de pedra — source-backed 小说 entry; original title retained.'),
('V1-CARD-0246','','V1-ENT-0362','collection','《绿色舞会之前》','莉吉娅·法贡德斯·特莱斯','Antes do baile verde','巴西','pt','1970','短篇小说集','WEB-CE-B17','meets','NONE','### 《绿色舞会之前》｜Antes do baile verde — source-backed 短篇小说集 entry; original title retained.'),
('V1-CARD-0247','','V1-ENT-0363','work','《姑娘们》','莉吉娅·法贡德斯·特莱斯','As meninas','巴西','pt','1973','小说','WEB-CE-B17','meets','NONE','### 《姑娘们》｜As meninas — source-backed 小说 entry; original title retained.'),
('V1-CARD-0248','','V1-ENT-0359','author','豪尔赫·伊卡萨','豪尔赫·伊卡萨','Jorge Icaza','厄瓜多尔','es','1906–1978','厄瓜多尔小说家与剧作家','WEB-CE-B17','meets','NONE','### 豪尔赫·伊卡萨｜Jorge Icaza — source-backed author entry for WEB-CE-B17.'),
('V1-CARD-0249','','V1-ENT-0364','work','《瓦西蓬戈》','豪尔赫·伊卡萨','Huasipungo','厄瓜多尔','es','1934','小说','WEB-CE-B17','meets','NONE','### 《瓦西蓬戈》｜Huasipungo — source-backed 小说 entry; original title retained.'),
('V1-CARD-0250','','V1-ENT-0365','work','《在街头》','豪尔赫·伊卡萨','En las calles','厄瓜多尔','es','1935','小说','WEB-CE-B17','meets','NONE','### 《在街头》｜En las calles — source-backed 小说 entry; original title retained.'),
('V1-CARD-0251','','V1-ENT-0366','work','《乔洛·罗梅罗与弗洛雷斯》','豪尔赫·伊卡萨','El chulla Romero y Flores','厄瓜多尔','es','1958','小说','WEB-CE-B17','meets','NONE','### 《乔洛·罗梅罗与弗洛雷斯》｜El chulla Romero y Flores — source-backed 小说 entry; original title retained.'),
('V1-CARD-0252','','V1-ENT-0360','author','罗慕洛·加列戈斯','罗慕洛·加列戈斯','Rómulo Gallegos','委内瑞拉','es','1884–1969','委内瑞拉小说家与教育家','WEB-CE-B17','meets','NONE','### 罗慕洛·加列戈斯｜Rómulo Gallegos — source-backed author entry for WEB-CE-B17.'),
('V1-CARD-0253','','V1-ENT-0367','work','《堂娜·芭芭拉》','罗慕洛·加列戈斯','Doña Bárbara','委内瑞拉','es','1929','小说','WEB-CE-B17','meets','NONE','### 《堂娜·芭芭拉》｜Doña Bárbara — source-backed 小说 entry; original title retained.'),
('V1-CARD-0254','','V1-ENT-0368','work','《唱歌者》','罗慕洛·加列戈斯','Cantaclaro','委内瑞拉','es','1934','小说','WEB-CE-B17','meets','NONE','### 《唱歌者》｜Cantaclaro — source-backed 小说 entry; original title retained.'),
('V1-CARD-0255','','V1-ENT-0369','work','《卡奈玛》','罗慕洛·加列戈斯','Canaima','委内瑞拉','es','1935','小说','WEB-CE-B17','meets','NONE','### 《卡奈玛》｜Canaima — source-backed 小说 entry; original title retained.');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-0962','WEB-CE-B17','V1-CARD-0244','V1-ENT-0358','birth_year','1923','fact','SRC-0270','medium','candidate_for_staging_review','Source-backed birth year for Lygia Fagundes Telles.'),
('V1-FCT-0963','WEB-CE-B17','V1-CARD-0244','V1-ENT-0358','death_year','2022','fact','SRC-0270','high','candidate_for_staging_review','Source-backed death year for Lygia Fagundes Telles.'),
('V1-FCT-0964','WEB-CE-B17','V1-CARD-0244','V1-ENT-0358','country_or_region','巴西','fact','SRC-0270','high','candidate_for_staging_review','Source-backed country association for Lygia Fagundes Telles.'),
('V1-FCT-0965','WEB-CE-B17','V1-CARD-0244','V1-ENT-0358','career_note','小说家与短篇小说家','fact','SRC-0271','high','candidate_for_staging_review','Conservative career description for Lygia Fagundes Telles.'),
('V1-FCT-0966','WEB-CE-B17','V1-CARD-0244','V1-ENT-0358','literary_identity','巴西小说家与短篇小说家','fact','SRC-0271','medium','candidate_for_staging_review','Conservative literary identity for Lygia Fagundes Telles; no movement or influence claim.'),
('V1-FCT-0967','WEB-CE-B17','V1-CARD-0245','V1-ENT-0361','entity_layer','work','metadata','SRC-0271','high','candidate_for_staging_review','Entity layer recorded as work.'),
('V1-FCT-0968','WEB-CE-B17','V1-CARD-0245','V1-ENT-0361','first_publication_year','1954','bibliographic','SRC-0271','high','candidate_for_staging_review','Cited source dates Ciranda de pedra to 1954.'),
('V1-FCT-0969','WEB-CE-B17','V1-CARD-0245','V1-ENT-0361','genre_or_form','小说','bibliographic','SRC-0271','high','candidate_for_staging_review','Cited source supports the conservative form label 小说.'),
('V1-FCT-0970','WEB-CE-B17','V1-CARD-0246','V1-ENT-0362','entity_layer','collection','metadata','SRC-0271','high','candidate_for_staging_review','Entity layer recorded as collection.'),
('V1-FCT-0971','WEB-CE-B17','V1-CARD-0246','V1-ENT-0362','first_publication_year','1970','bibliographic','SRC-0271','high','candidate_for_staging_review','Cited source dates Antes do baile verde to 1970.'),
('V1-FCT-0972','WEB-CE-B17','V1-CARD-0246','V1-ENT-0362','genre_or_form','短篇小说集','bibliographic','SRC-0271','high','candidate_for_staging_review','Cited source supports the conservative form label 短篇小说集.'),
('V1-FCT-0973','WEB-CE-B17','V1-CARD-0247','V1-ENT-0363','entity_layer','work','metadata','SRC-0271','high','candidate_for_staging_review','Entity layer recorded as work.'),
('V1-FCT-0974','WEB-CE-B17','V1-CARD-0247','V1-ENT-0363','first_publication_year','1973','bibliographic','SRC-0271','high','candidate_for_staging_review','Cited source dates As meninas to 1973.'),
('V1-FCT-0975','WEB-CE-B17','V1-CARD-0247','V1-ENT-0363','genre_or_form','小说','bibliographic','SRC-0271','high','candidate_for_staging_review','Cited source supports the conservative form label 小说.'),
('V1-FCT-0976','WEB-CE-B17','V1-CARD-0248','V1-ENT-0359','birth_year','1906','fact','SRC-0274','high','candidate_for_staging_review','Source-backed birth year for Jorge Icaza.'),
('V1-FCT-0977','WEB-CE-B17','V1-CARD-0248','V1-ENT-0359','death_year','1978','fact','SRC-0274','high','candidate_for_staging_review','Source-backed death year for Jorge Icaza.'),
('V1-FCT-0978','WEB-CE-B17','V1-CARD-0248','V1-ENT-0359','country_or_region','厄瓜多尔','fact','SRC-0274','high','candidate_for_staging_review','Source-backed country association for Jorge Icaza.'),
('V1-FCT-0979','WEB-CE-B17','V1-CARD-0248','V1-ENT-0359','career_note','小说家与剧作家','fact','SRC-0274','high','candidate_for_staging_review','Conservative career description for Jorge Icaza.'),
('V1-FCT-0980','WEB-CE-B17','V1-CARD-0248','V1-ENT-0359','literary_identity','厄瓜多尔小说家与剧作家','fact','SRC-0274','medium','candidate_for_staging_review','Conservative literary identity for Jorge Icaza; no movement or influence claim.'),
('V1-FCT-0981','WEB-CE-B17','V1-CARD-0249','V1-ENT-0364','entity_layer','work','metadata','SRC-0273','high','candidate_for_staging_review','Entity layer recorded as work.'),
('V1-FCT-0982','WEB-CE-B17','V1-CARD-0249','V1-ENT-0364','first_publication_year','1934','bibliographic','SRC-0273','high','candidate_for_staging_review','Cited source dates Huasipungo to 1934.'),
('V1-FCT-0983','WEB-CE-B17','V1-CARD-0249','V1-ENT-0364','genre_or_form','小说','bibliographic','SRC-0273','high','candidate_for_staging_review','Cited source supports the conservative form label 小说.'),
('V1-FCT-0984','WEB-CE-B17','V1-CARD-0250','V1-ENT-0365','entity_layer','work','metadata','SRC-0273','high','candidate_for_staging_review','Entity layer recorded as work.'),
('V1-FCT-0985','WEB-CE-B17','V1-CARD-0250','V1-ENT-0365','first_publication_year','1935','bibliographic','SRC-0273','high','candidate_for_staging_review','Cited source dates En las calles to 1935.'),
('V1-FCT-0986','WEB-CE-B17','V1-CARD-0250','V1-ENT-0365','genre_or_form','小说','bibliographic','SRC-0273','high','candidate_for_staging_review','Cited source supports the conservative form label 小说.'),
('V1-FCT-0987','WEB-CE-B17','V1-CARD-0251','V1-ENT-0366','entity_layer','work','metadata','SRC-0273','high','candidate_for_staging_review','Entity layer recorded as work.'),
('V1-FCT-0988','WEB-CE-B17','V1-CARD-0251','V1-ENT-0366','first_publication_year','1958','bibliographic','SRC-0273','high','candidate_for_staging_review','Cited source dates El chulla Romero y Flores to 1958.'),
('V1-FCT-0989','WEB-CE-B17','V1-CARD-0251','V1-ENT-0366','genre_or_form','小说','bibliographic','SRC-0273','high','candidate_for_staging_review','Cited source supports the conservative form label 小说.'),
('V1-FCT-0990','WEB-CE-B17','V1-CARD-0252','V1-ENT-0360','birth_year','1884','fact','SRC-0275','high','candidate_for_staging_review','Source-backed birth year for Rómulo Gallegos.'),
('V1-FCT-0991','WEB-CE-B17','V1-CARD-0252','V1-ENT-0360','death_year','1969','fact','SRC-0275','high','candidate_for_staging_review','Source-backed death year for Rómulo Gallegos.'),
('V1-FCT-0992','WEB-CE-B17','V1-CARD-0252','V1-ENT-0360','country_or_region','委内瑞拉','fact','SRC-0275','high','candidate_for_staging_review','Source-backed country association for Rómulo Gallegos.'),
('V1-FCT-0993','WEB-CE-B17','V1-CARD-0252','V1-ENT-0360','career_note','作家、教育家与政治人物','fact','SRC-0275','high','candidate_for_staging_review','Conservative career description for Rómulo Gallegos.'),
('V1-FCT-0994','WEB-CE-B17','V1-CARD-0252','V1-ENT-0360','literary_identity','委内瑞拉小说家与教育家','fact','SRC-0275','medium','candidate_for_staging_review','Conservative literary identity for Rómulo Gallegos; no movement or influence claim.'),
('V1-FCT-0995','WEB-CE-B17','V1-CARD-0253','V1-ENT-0367','entity_layer','work','metadata','SRC-0275','high','candidate_for_staging_review','Entity layer recorded as work.'),
('V1-FCT-0996','WEB-CE-B17','V1-CARD-0253','V1-ENT-0367','first_publication_year','1929','bibliographic','SRC-0275','high','candidate_for_staging_review','Cited source dates Doña Bárbara to 1929.'),
('V1-FCT-0997','WEB-CE-B17','V1-CARD-0253','V1-ENT-0367','genre_or_form','小说','bibliographic','SRC-0275','high','candidate_for_staging_review','Cited source supports the conservative form label 小说.'),
('V1-FCT-0998','WEB-CE-B17','V1-CARD-0254','V1-ENT-0368','entity_layer','work','metadata','SRC-0275','high','candidate_for_staging_review','Entity layer recorded as work.'),
('V1-FCT-0999','WEB-CE-B17','V1-CARD-0254','V1-ENT-0368','first_publication_year','1934','bibliographic','SRC-0275','high','candidate_for_staging_review','Cited source dates Cantaclaro to 1934.'),
('V1-FCT-1000','WEB-CE-B17','V1-CARD-0254','V1-ENT-0368','genre_or_form','小说','bibliographic','SRC-0275','high','candidate_for_staging_review','Cited source supports the conservative form label 小说.'),
('V1-FCT-1001','WEB-CE-B17','V1-CARD-0255','V1-ENT-0369','entity_layer','work','metadata','SRC-0275','high','candidate_for_staging_review','Entity layer recorded as work.'),
('V1-FCT-1002','WEB-CE-B17','V1-CARD-0255','V1-ENT-0369','first_publication_year','1935','bibliographic','SRC-0275','high','candidate_for_staging_review','Cited source dates Canaima to 1935.'),
('V1-FCT-1003','WEB-CE-B17','V1-CARD-0255','V1-ENT-0369','genre_or_form','小说','bibliographic','SRC-0275','high','candidate_for_staging_review','Cited source supports the conservative form label 小说.');

INSERT INTO fact_sources (fact_id,source_id,source_title) SELECT fact_id,origin_id,'' FROM facts WHERE fact_id BETWEEN 'V1-FCT-0962' AND 'V1-FCT-1003';
INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES ('V1-FCT-0962','SRC-0272','');
UPDATE fact_sources SET source_title=(SELECT title FROM sources WHERE sources.source_id=fact_sources.source_id) WHERE fact_id BETWEEN 'V1-FCT-0962' AND 'V1-FCT-1003';
INSERT INTO card_facts (card_id,fact_id,admission_status) SELECT card_id,fact_id,'candidate_for_staging_review' FROM facts WHERE fact_id BETWEEN 'V1-FCT-0962' AND 'V1-FCT-1003';
INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0477','','V1-CARD-0244','SRC-0270','B','both','yes','yes','SRC-0270','used','DISPUTED-YEAR'),
('V1-CS-0478','','V1-CARD-0244','SRC-0271','B','both','yes','yes','SRC-0271','used','DISPUTED-YEAR'),
('V1-CS-0479','','V1-CARD-0244','SRC-0272','B','both','yes','yes','SRC-0272','used','DISPUTED-YEAR'),
('V1-CS-0480','','V1-CARD-0245','SRC-0271','B','both','yes','yes','SRC-0271','used','NONE'),
('V1-CS-0481','','V1-CARD-0246','SRC-0271','B','both','yes','yes','SRC-0271','used','NONE'),
('V1-CS-0482','','V1-CARD-0247','SRC-0271','B','both','yes','yes','SRC-0271','used','NONE'),
('V1-CS-0483','','V1-CARD-0248','SRC-0274','B','both','yes','yes','SRC-0274','used','NONE'),
('V1-CS-0484','','V1-CARD-0248','SRC-0273','B','both','yes','yes','SRC-0273','used','NONE'),
('V1-CS-0485','','V1-CARD-0249','SRC-0273','B','both','yes','yes','SRC-0273','used','NONE'),
('V1-CS-0486','','V1-CARD-0249','SRC-0274','B','both','yes','yes','SRC-0274','used','NONE'),
('V1-CS-0487','','V1-CARD-0250','SRC-0273','B','both','yes','yes','SRC-0273','used','NONE'),
('V1-CS-0488','','V1-CARD-0250','SRC-0274','B','both','yes','yes','SRC-0274','used','NONE'),
('V1-CS-0489','','V1-CARD-0251','SRC-0273','B','both','yes','yes','SRC-0273','used','NONE'),
('V1-CS-0490','','V1-CARD-0251','SRC-0274','B','both','yes','yes','SRC-0274','used','NONE'),
('V1-CS-0491','','V1-CARD-0252','SRC-0275','B','both','yes','yes','SRC-0275','used','NONE'),
('V1-CS-0492','','V1-CARD-0252','SRC-0276','B','both','yes','yes','SRC-0276','used','NONE'),
('V1-CS-0493','','V1-CARD-0253','SRC-0275','B','both','yes','yes','SRC-0275','used','NONE'),
('V1-CS-0494','','V1-CARD-0253','SRC-0276','B','both','yes','yes','SRC-0276','used','NONE'),
('V1-CS-0495','','V1-CARD-0254','SRC-0275','B','both','yes','yes','SRC-0275','used','NONE'),
('V1-CS-0496','','V1-CARD-0255','SRC-0275','B','both','yes','yes','SRC-0275','used','NONE'),
('V1-CS-0497','','V1-CARD-0255','SRC-0276','B','both','yes','yes','SRC-0276','used','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0284','WEB-CE-B17','V1-REL-0284','V1-ENT-0358','CREATED','V1-ENT-0361','莉吉娅·法贡德斯·特莱斯创作《石头圆舞》（Ciranda de pedra）','high','accepted','WEB-CE-B17','1','DISPUTED-YEAR'),
('V1-REL-0285','WEB-CE-B17','V1-REL-0285','V1-ENT-0358','CREATED','V1-ENT-0362','莉吉娅·法贡德斯·特莱斯创作《绿色舞会之前》（Antes do baile verde）','high','accepted','WEB-CE-B17','1','NONE'),
('V1-REL-0286','WEB-CE-B17','V1-REL-0286','V1-ENT-0358','CREATED','V1-ENT-0363','莉吉娅·法贡德斯·特莱斯创作《姑娘们》（As meninas）','high','accepted','WEB-CE-B17','1','NONE'),
('V1-REL-0287','WEB-CE-B17','V1-REL-0287','V1-ENT-0359','CREATED','V1-ENT-0364','豪尔赫·伊卡萨创作《瓦西蓬戈》（Huasipungo）','high','accepted','WEB-CE-B17','1','NONE'),
('V1-REL-0288','WEB-CE-B17','V1-REL-0288','V1-ENT-0359','CREATED','V1-ENT-0365','豪尔赫·伊卡萨创作《在街头》（En las calles）','high','accepted','WEB-CE-B17','1','NONE'),
('V1-REL-0289','WEB-CE-B17','V1-REL-0289','V1-ENT-0359','CREATED','V1-ENT-0366','豪尔赫·伊卡萨创作《乔洛·罗梅罗与弗洛雷斯》（El chulla Romero y Flores）','high','accepted','WEB-CE-B17','1','NONE'),
('V1-REL-0290','WEB-CE-B17','V1-REL-0290','V1-ENT-0360','CREATED','V1-ENT-0367','罗慕洛·加列戈斯创作《堂娜·芭芭拉》（Doña Bárbara）','high','accepted','WEB-CE-B17','1','NONE'),
('V1-REL-0291','WEB-CE-B17','V1-REL-0291','V1-ENT-0360','CREATED','V1-ENT-0368','罗慕洛·加列戈斯创作《唱歌者》（Cantaclaro）','high','accepted','WEB-CE-B17','1','NONE'),
('V1-REL-0292','WEB-CE-B17','V1-REL-0292','V1-ENT-0360','CREATED','V1-ENT-0369','罗慕洛·加列戈斯创作《卡奈玛》（Canaima）','high','accepted','WEB-CE-B17','1','NONE'),
('V1-REL-0293','WEB-CE-B17','V1-REL-0293','V1-ENT-0358','ASSOCIATED_WITH_PLACE','V1-ENT-0183','莉吉娅·法贡德斯·特莱斯与巴西关联','high','accepted','WEB-CE-B17','1','NONE'),
('V1-REL-0294','WEB-CE-B17','V1-REL-0294','V1-ENT-0359','ASSOCIATED_WITH_PLACE','V1-ENT-0356','豪尔赫·伊卡萨与厄瓜多尔关联','high','accepted','WEB-CE-B17','1','NONE'),
('V1-REL-0295','WEB-CE-B17','V1-REL-0295','V1-ENT-0360','ASSOCIATED_WITH_PLACE','V1-ENT-0357','罗慕洛·加列戈斯与委内瑞拉关联','high','accepted','WEB-CE-B17','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0284','SRC-0271'),
('V1-REL-0285','SRC-0271'),
('V1-REL-0286','SRC-0271'),
('V1-REL-0287','SRC-0273'),
('V1-REL-0287','SRC-0274'),
('V1-REL-0288','SRC-0273'),
('V1-REL-0288','SRC-0274'),
('V1-REL-0289','SRC-0273'),
('V1-REL-0289','SRC-0274'),
('V1-REL-0290','SRC-0275'),
('V1-REL-0290','SRC-0276'),
('V1-REL-0291','SRC-0275'),
('V1-REL-0292','SRC-0275'),
('V1-REL-0292','SRC-0276'),
('V1-REL-0293','SRC-0270'),
('V1-REL-0293','SRC-0271'),
('V1-REL-0294','SRC-0274'),
('V1-REL-0294','SRC-0273'),
('V1-REL-0295','SRC-0275'),
('V1-REL-0295','SRC-0276');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0309','V1-REL-0284','V1-REL-0284','SRC-0271','','','莉吉娅·法贡德斯·特莱斯创作《石头圆舞》（Ciranda de pedra） is directly supported by the cited source(s); no influence claim is made.','high','eligible_evidence','WEB-CE-B17'),
('V1-EV-0310','V1-REL-0285','V1-REL-0285','SRC-0271','','','莉吉娅·法贡德斯·特莱斯创作《绿色舞会之前》（Antes do baile verde） is directly supported by the cited source(s); no influence claim is made.','high','eligible_evidence','WEB-CE-B17'),
('V1-EV-0311','V1-REL-0286','V1-REL-0286','SRC-0271','','','莉吉娅·法贡德斯·特莱斯创作《姑娘们》（As meninas） is directly supported by the cited source(s); no influence claim is made.','high','eligible_evidence','WEB-CE-B17'),
('V1-EV-0312','V1-REL-0287','V1-REL-0287','SRC-0273','','','豪尔赫·伊卡萨创作《瓦西蓬戈》（Huasipungo） is directly supported by the cited source(s); no influence claim is made.','high','eligible_evidence','WEB-CE-B17'),
('V1-EV-0313','V1-REL-0288','V1-REL-0288','SRC-0273','','','豪尔赫·伊卡萨创作《在街头》（En las calles） is directly supported by the cited source(s); no influence claim is made.','high','eligible_evidence','WEB-CE-B17'),
('V1-EV-0314','V1-REL-0289','V1-REL-0289','SRC-0273','','','豪尔赫·伊卡萨创作《乔洛·罗梅罗与弗洛雷斯》（El chulla Romero y Flores） is directly supported by the cited source(s); no influence claim is made.','high','eligible_evidence','WEB-CE-B17'),
('V1-EV-0315','V1-REL-0290','V1-REL-0290','SRC-0275','','','罗慕洛·加列戈斯创作《堂娜·芭芭拉》（Doña Bárbara） is directly supported by the cited source(s); no influence claim is made.','high','eligible_evidence','WEB-CE-B17'),
('V1-EV-0316','V1-REL-0291','V1-REL-0291','SRC-0275','','','罗慕洛·加列戈斯创作《唱歌者》（Cantaclaro） is directly supported by the cited source(s); no influence claim is made.','high','eligible_evidence','WEB-CE-B17'),
('V1-EV-0317','V1-REL-0292','V1-REL-0292','SRC-0275','','','罗慕洛·加列戈斯创作《卡奈玛》（Canaima） is directly supported by the cited source(s); no influence claim is made.','high','eligible_evidence','WEB-CE-B17'),
('V1-EV-0318','V1-REL-0293','V1-REL-0293','SRC-0270','','','莉吉娅·法贡德斯·特莱斯与巴西关联 is directly supported by the cited source(s); no influence claim is made.','high','eligible_evidence','WEB-CE-B17'),
('V1-EV-0319','V1-REL-0294','V1-REL-0294','SRC-0274','','','豪尔赫·伊卡萨与厄瓜多尔关联 is directly supported by the cited source(s); no influence claim is made.','high','eligible_evidence','WEB-CE-B17'),
('V1-EV-0320','V1-REL-0295','V1-REL-0295','SRC-0275','','','罗慕洛·加列戈斯与委内瑞拉关联 is directly supported by the cited source(s); no influence claim is made.','high','eligible_evidence','WEB-CE-B17');

UPDATE relationship_evidence SET source_title=(SELECT title FROM sources WHERE sources.source_id=relationship_evidence.source_id) WHERE evidence_id BETWEEN 'V1-EV-0309' AND 'V1-EV-0320';
INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0024','B17-GAP-01-0358','disputed_fact','V1-ENT-0358.birth_year','open_research','SRC-0270 ABL profile states 19 April 1923, while SRC-0272 Biblioteca Nacional catalogue authority line states 1918–2022; the birth-year conflict is not reconciled in this batch.','1','SOL_REVIEW','Retain 1923 as a medium-confidence candidate with a visible dispute marker; do not present an uncontested birth year in formal public prose until Sol reconciles the authority records.','DISPUTED-YEAR');

UPDATE metadata SET value='WEB-CE-B17' WHERE key='last_change_set';
UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';
