-- WEB-CE-B14: Luna Max; José Lezama Lima, Guillermo Cabrera Infante, Sor Juana Inés de la Cruz.

-- Traceable cross-batch remediation discovered during B14 fresh-context review:
-- WEB-CE-B13 assigned Nicolás Guillén's Cuban geography relationship to the
-- Nicaragua node V1-ENT-0235. The current master identifies Cuba as V1-ENT-0096.
-- Keep the correction in this new migration rather than rewriting B13 history.
UPDATE relationships
SET object_id='V1-ENT-0096', description_zh='尼古拉斯·纪廉与古巴关联'
WHERE relationship_id='V1-REL-0247';
UPDATE relationship_evidence
SET evidence_note='CVC establishes Guillén in the Cuban context; target node corrected to V1-ENT-0096 during WEB-CE-B14 review.'
WHERE evidence_id='V1-EV-0272';

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0247','B14-SRC-0247','Paradiso y Oppiano Licario: una «guía» de Lezama','Paradiso y Oppiano Licario: una «guía» de Lezama','Remedios Mataix','','Biblioteca Virtual Miguel de Cervantes','','','web_page','','es','A','access_limited','WEB-CE-B14','Paradiso 1966, Oppiano Licario 1977, their continuation and Lezama poetics; deep page intermittently timed out during review, so not sole support','remote_only','','https://www.cervantesvirtual.com/obra-visor/paradiso-y-oppiano-licario--una-gua-de-lezama-0/html/ff2fc5aa-82b1-11df-acc7-002185ce6064_19.html'),
('SRC-0248','B14-SRC-0248','About José Lezama Lima','About José Lezama Lima','Academy of American Poets','','Academy of American Poets','','','web_page','','en','B','access_pass','WEB-CE-B14','Cuban identity, 1910–1976, Paradiso 1966, Oppiano Licario 1977, and La expresión americana 1957','remote_only','','https://poets.org/poet/jose-lezama-lima'),
('SRC-0249','B14-SRC-0249','Guillermo Cabrera Infante','Guillermo Cabrera Infante','Escritores.org','','Escritores.org','','','web_page','','es','C','access_pass','WEB-CE-B14','Cuban birth/death and bibliography for Tres tristes tigres 1967, Vista del amanecer en el trópico 1974, and La Habana para un infante difunto 1979','remote_only','','https://www.escritores.org/biografias/437-guillermo-cabrera-infante'),
('SRC-0250','B14-SRC-0250','Guillermo Cabrera Infante: Two Islands, Many Worlds','Guillermo Cabrera Infante: Two Islands, Many Worlds','Raymond D. Souza','','University of Texas Press','1996','','book','','en','B','access_pass','WEB-CE-B14','Scholarly biography identifies the Cuban author and the three selected works','remote_only','','https://utpress.utexas.edu/9780292777088/'),
('SRC-0251','B14-SRC-0251','Primero sueño','Primero sueño','Sor Juana Inés de la Cruz; José Luis Ibáñez','','Universidad Nacional Autónoma de México','2021','','web_page','','es','B','access_pass','WEB-CE-B14','Sor Juana 1651–1695, Primero sueño, original publication 1692, poem form and related works; canonical UNAM repository resource','remote_only','','https://repositorio.unam.mx/contenidos/5059605'),
('SRC-0252','B14-SRC-0252','Carta a Sor Filotea de la Cruz','Carta a Sor Filotea de la Cruz','Juana Inés de la Cruz','','Universidad Nacional Autónoma de México, Coordinación de Difusión Cultural','2008','','web_page','','es','B','access_pass','WEB-CE-B14','Respuesta a Sor Filotea de la Cruz completed 1 March 1691, epistle form and Mexico context','remote_only','','https://librosoa.unam.mx/handle/123456789/575'),
('SRC-0253','B14-SRC-0253','Conversación sobre Sor Juana Inés de la Cruz, en Vindictas','Conversación sobre Sor Juana Inés de la Cruz, en Vindictas','Isabel Revuelta Poo','','CulturaUNAM','2021','','web_page','','es','B','access_pass','WEB-CE-B14','Sor Juana literary identity, Amor es más laberinto premiere in 1689, and Respuesta context','remote_only','','https://unamglobal.unam.mx/global_revista/conversacion-sobre-sor-juana-ines-de-la-cruz-en-vindictas/');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0320','author','何塞·莱萨马·利马','José Lezama Lima','candidate','1','CAND-B14-LEZAMA-AUTHOR','B14 AAP and Cervantes Virtual profiles; Chinese display candidate','NONE'),
('V1-ENT-0321','author','吉列尔莫·卡夫雷拉·因凡特','Guillermo Cabrera Infante','candidate','1','CAND-B14-CABRERA-AUTHOR','B14 bibliography and University of Texas Press profile; Chinese display candidate','NONE'),
('V1-ENT-0322','author','索尔·胡安娜·伊内斯·德·拉·克鲁斯','Sor Juana Inés de la Cruz','candidate','1','CAND-B14-SORJUANA-AUTHOR','B14 UNAM institutional profiles; Chinese display candidate','NONE'),
('V1-ENT-0323','work','《天堂》','Paradiso','candidate','1','CAND-B14-LEZAMA-W01','B14 bibliography; work layer','NONE'),
('V1-ENT-0324','work','《奥皮亚诺·利卡里奥》','Oppiano Licario','candidate','1','CAND-B14-LEZAMA-W02','B14 bibliography; work layer','NONE'),
('V1-ENT-0325','work','《美洲的表达》','La expresión americana','candidate','1','CAND-B14-LEZAMA-W03','B14 AAP lecture/publication profile; work layer','NONE'),
('V1-ENT-0326','work','《三只忧伤的老虎》','Tres tristes tigres','candidate','1','CAND-B14-CABRERA-W01','B14 bibliography; work layer','NONE'),
('V1-ENT-0327','work','《热带黎明景观》','Vista del amanecer en el trópico','candidate','1','CAND-B14-CABRERA-W02','B14 bibliography supports title/year; form left open; display label corrected to match the original title','NONE'),
('V1-ENT-0328','work','《哈瓦那，一个早夭婴儿的回忆》','La Habana para un infante difunto','candidate','1','CAND-B14-CABRERA-W03','B14 bibliography supports title/year; form left open','NONE'),
('V1-ENT-0329','work','《第一梦》','Primero sueño','candidate','1','CAND-B14-SORJUANA-W01','B14 UNAM repository; work layer','NONE'),
('V1-ENT-0330','work','《答索尔·菲洛特娅》','Respuesta a Sor Filotea de la Cruz','candidate','1','CAND-B14-SORJUANA-W02','B14 UNAM repository; work layer','NONE'),
('V1-ENT-0331','work','《爱情是更大的迷宫》','Amor es más laberinto','candidate','1','CAND-B14-SORJUANA-W03','B14 UNAM institutional profile; work layer','NONE');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0320','CAND-B14-LEZAMA-AUTHOR','WEB-CE-B14','CAND-B14-LEZAMA-AUTHOR','V1-ENT-0320','create','B14 fresh-context Reviewer PASS; institutional sources'),
('V1-EMAP-0321','CAND-B14-CABRERA-AUTHOR','WEB-CE-B14','CAND-B14-CABRERA-AUTHOR','V1-ENT-0321','create','B14 fresh-context Reviewer PASS; bibliography and scholarly biography'),
('V1-EMAP-0322','CAND-B14-SORJUANA-AUTHOR','WEB-CE-B14','CAND-B14-SORJUANA-AUTHOR','V1-ENT-0322','create','B14 fresh-context Reviewer PASS; UNAM institutional sources'),
('V1-EMAP-0323','CAND-B14-LEZAMA-W01','WEB-CE-B14','CAND-B14-LEZAMA-W01','V1-ENT-0323','create','B14 fresh-context Reviewer PASS; bibliography'),
('V1-EMAP-0324','CAND-B14-LEZAMA-W02','WEB-CE-B14','CAND-B14-LEZAMA-W02','V1-ENT-0324','create','B14 fresh-context Reviewer PASS; bibliography'),
('V1-EMAP-0325','CAND-B14-LEZAMA-W03','WEB-CE-B14','CAND-B14-LEZAMA-W03','V1-ENT-0325','create','B14 fresh-context Reviewer PASS; AAP profile'),
('V1-EMAP-0326','CAND-B14-CABRERA-W01','WEB-CE-B14','CAND-B14-CABRERA-W01','V1-ENT-0326','create','B14 fresh-context Reviewer PASS; bibliography'),
('V1-EMAP-0327','CAND-B14-CABRERA-W02','WEB-CE-B14','CAND-B14-CABRERA-W02','V1-ENT-0327','create','B14 fresh-context Reviewer PASS; bibliography; form left open'),
('V1-EMAP-0328','CAND-B14-CABRERA-W03','WEB-CE-B14','CAND-B14-CABRERA-W03','V1-ENT-0328','create','B14 fresh-context Reviewer PASS; bibliography'),
('V1-EMAP-0329','CAND-B14-SORJUANA-W01','WEB-CE-B14','CAND-B14-SORJUANA-W01','V1-ENT-0329','create','B14 fresh-context Reviewer PASS; UNAM repository'),
('V1-EMAP-0330','CAND-B14-SORJUANA-W02','WEB-CE-B14','CAND-B14-SORJUANA-W02','V1-ENT-0330','create','B14 fresh-context Reviewer PASS; UNAM repository'),
('V1-EMAP-0331','CAND-B14-SORJUANA-W03','WEB-CE-B14','CAND-B14-SORJUANA-W03','V1-ENT-0331','create','B14 fresh-context Reviewer PASS; UNAM profile');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0208','','V1-ENT-0320','author','何塞·莱萨马·利马','何塞·莱萨马·利马','José Lezama Lima','古巴','es','1910–1976','诗人、散文家与小说家','WEB-CE-B14','meets','NONE','### 何塞·莱萨马·利马｜José Lezama Lima — AAP and Cervantes Virtual establish the Cuban author entry.'),
('V1-CARD-0209','','V1-ENT-0321','author','吉列尔莫·卡夫雷拉·因凡特','吉列尔莫·卡夫雷拉·因凡特','Guillermo Cabrera Infante','古巴','es','1929–2005','古巴小说家与散文家','WEB-CE-B14','meets','NONE','### 吉列尔莫·卡夫雷拉·因凡特｜Guillermo Cabrera Infante — bibliography and UT Press establish the author entry.'),
('V1-CARD-0210','','V1-ENT-0322','author','索尔·胡安娜·伊内斯·德·拉·克鲁斯','索尔·胡安娜·伊内斯·德·拉·克鲁斯','Sor Juana Inés de la Cruz','墨西哥','es','1651–1695','新西班牙诗人、剧作家与散文家','WEB-CE-B14','meets','NONE','### 索尔·胡安娜·伊内斯·德·拉·克鲁斯｜Sor Juana Inés de la Cruz — UNAM sources establish the author entry.'),
('V1-CARD-0211','','V1-ENT-0323','work','《天堂》','何塞·莱萨马·利马','Paradiso','古巴','es','1966','小说','WEB-CE-B14','meets','NONE','### 《天堂》｜Paradiso — the scholarly bibliography records the 1966 novel.'),
('V1-CARD-0212','','V1-ENT-0324','work','《奥皮亚诺·利卡里奥》','何塞·莱萨马·利马','Oppiano Licario','古巴','es','1977','小说','WEB-CE-B14','meets','NONE','### 《奥皮亚诺·利卡里奥》｜Oppiano Licario — the scholarly bibliography records the 1977 work.'),
('V1-CARD-0213','','V1-ENT-0325','work','《美洲的表达》','何塞·莱萨马·利马','La expresión americana','古巴','es','1957','讲演系列','WEB-CE-B14','meets','NONE','### 《美洲的表达》｜La expresión americana — the AAP profile dates the five-part lecture series to 1957; this is not presented as a first-publication year.'),
('V1-CARD-0214','','V1-ENT-0326','work','《三只忧伤的老虎》','吉列尔莫·卡夫雷拉·因凡特','Tres tristes tigres','古巴','es','1967','小说','WEB-CE-B14','meets','NONE','### 《三只忧伤的老虎》｜Tres tristes tigres — the bibliography records the 1967 novel.'),
('V1-CARD-0215','','V1-ENT-0327','work','《热带黎明景观》','吉列尔莫·卡夫雷拉·因凡特','Vista del amanecer en el trópico','古巴','es','1974','作品','WEB-CE-B14','meets','NONE','### 《热带黎明景观》｜Vista del amanecer en el trópico — the bibliography records the 1974 title; form remains open.'),
('V1-CARD-0216','','V1-ENT-0328','work','《哈瓦那，一个早夭婴儿的回忆》','吉列尔莫·卡夫雷拉·因凡特','La Habana para un infante difunto','古巴','es','1979','作品','WEB-CE-B14','meets','NONE','### 《哈瓦那，一个早夭婴儿的回忆》｜La Habana para un infante difunto — the bibliography records the 1979 title; form remains open.'),
('V1-CARD-0217','','V1-ENT-0329','work','《第一梦》','索尔·胡安娜·伊内斯·德·拉·克鲁斯','Primero sueño','墨西哥','es','1692','长诗','WEB-CE-B14','meets','NONE','### 《第一梦》｜Primero sueño — the UNAM repository records its original publication in 1692.'),
('V1-CARD-0218','','V1-ENT-0330','work','《答索尔·菲洛特娅》','索尔·胡安娜·伊内斯·德·拉·克鲁斯','Respuesta a Sor Filotea de la Cruz','墨西哥','es','1691','书信/散文','WEB-CE-B14','meets','NONE','### 《答索尔·菲洛特娅》｜Respuesta a Sor Filotea de la Cruz — the UNAM record dates the letter to 1691.'),
('V1-CARD-0219','','V1-ENT-0331','work','《爱情是更大的迷宫》','索尔·胡安娜·伊内斯·德·拉·克鲁斯','Amor es más laberinto','墨西哥','es','1689','戏剧','WEB-CE-B14','meets','NONE','### 《爱情是更大的迷宫》｜Amor es más laberinto — UNAM records the comedy premiere in 1689.');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-0855','WEB-CE-B14','V1-CARD-0208','V1-ENT-0320','birth_year','1910','fact','SRC-0248','high','candidate_for_staging_review','AAP identifies Lezama Lima as born in Havana in 1910.'),
('V1-FCT-0856','WEB-CE-B14','V1-CARD-0208','V1-ENT-0320','death_year','1976','fact','SRC-0248','high','candidate_for_staging_review','AAP records Lezama Lima death in Havana in 1976.'),
('V1-FCT-0857','WEB-CE-B14','V1-CARD-0208','V1-ENT-0320','career_note','诗人、散文家与小说家','fact','SRC-0248','high','candidate_for_staging_review','AAP identifies Lezama Lima as poet, essayist and novelist.'),
('V1-FCT-0858','WEB-CE-B14','V1-CARD-0211','V1-ENT-0323','entity_layer','work','metadata','SRC-0247','high','candidate_for_staging_review','Scholarly article treats Paradiso as a novel.'),
('V1-FCT-0859','WEB-CE-B14','V1-CARD-0211','V1-ENT-0323','first_publication_year','1966','bibliographic','SRC-0247','high','candidate_for_staging_review','Scholarly article dates Paradiso to 1966.'),
('V1-FCT-0860','WEB-CE-B14','V1-CARD-0211','V1-ENT-0323','genre_or_form','小说','bibliographic','SRC-0247','high','candidate_for_staging_review','Scholarly article calls Paradiso a novela.'),
('V1-FCT-0861','WEB-CE-B14','V1-CARD-0212','V1-ENT-0324','entity_layer','work','metadata','SRC-0247','high','candidate_for_staging_review','Scholarly article treats Oppiano Licario as a novel.'),
('V1-FCT-0862','WEB-CE-B14','V1-CARD-0212','V1-ENT-0324','first_publication_year','1977','bibliographic','SRC-0247','high','candidate_for_staging_review','Scholarly article dates Oppiano Licario to 1977.'),
('V1-FCT-0863','WEB-CE-B14','V1-CARD-0212','V1-ENT-0324','genre_or_form','小说','bibliographic','SRC-0247','high','candidate_for_staging_review','Scholarly article calls Oppiano Licario a novela.'),
('V1-FCT-0864','WEB-CE-B14','V1-CARD-0213','V1-ENT-0325','entity_layer','work','metadata','SRC-0248','high','candidate_for_staging_review','AAP describes La expresión americana as a lecture series later published as a work.'),
('V1-FCT-0865','WEB-CE-B14','V1-CARD-0213','V1-ENT-0325','composition_year','1957','bibliographic','SRC-0248','high','candidate_for_staging_review','AAP dates the five-part lecture series to 1957; this is the lecture year, not a first-publication claim.'),
('V1-FCT-0866','WEB-CE-B14','V1-CARD-0213','V1-ENT-0325','genre_or_form','讲演系列','bibliographic','SRC-0248','medium','candidate_for_staging_review','AAP identifies the work as a five-part lecture series; the card uses the directly supported lecture label.'),
('V1-FCT-0867','WEB-CE-B14','V1-CARD-0209','V1-ENT-0321','birth_year','1929','fact','SRC-0249','high','candidate_for_staging_review','Escritores.org records Cabrera Infante born in Gibara in 1929.'),
('V1-FCT-0868','WEB-CE-B14','V1-CARD-0209','V1-ENT-0321','death_year','2005','fact','SRC-0249','high','candidate_for_staging_review','Escritores.org records his death in London in 2005.'),
('V1-FCT-0869','WEB-CE-B14','V1-CARD-0209','V1-ENT-0321','career_note','小说家、散文家与电影评论/编剧','fact','SRC-0250','high','candidate_for_staging_review','UT Press biography describes novels, essays, short stories and film scripts.'),
('V1-FCT-0870','WEB-CE-B14','V1-CARD-0214','V1-ENT-0326','entity_layer','work','metadata','SRC-0249','high','candidate_for_staging_review','Bibliography lists Tres tristes tigres as a title by Cabrera Infante.'),
('V1-FCT-0871','WEB-CE-B14','V1-CARD-0214','V1-ENT-0326','first_publication_year','1967','bibliographic','SRC-0249','high','candidate_for_staging_review','Escritores.org lists Tres tristes tigres in 1967.'),
('V1-FCT-0872','WEB-CE-B14','V1-CARD-0214','V1-ENT-0326','genre_or_form','小说','bibliographic','SRC-0250','medium','candidate_for_staging_review','UT Press biography includes the title among Cabrera Infante novels.'),
('V1-FCT-0873','WEB-CE-B14','V1-CARD-0215','V1-ENT-0327','entity_layer','work','metadata','SRC-0249','high','candidate_for_staging_review','Bibliography lists Vista del amanecer en el trópico as a title; form remains open.'),
('V1-FCT-0874','WEB-CE-B14','V1-CARD-0215','V1-ENT-0327','first_publication_year','1974','bibliographic','SRC-0249','medium','candidate_for_staging_review','Escritores.org lists a 1974 Vista del amanecer en el trópico entry, while the same page also shows a 1987 entry; retain 1974 as a provisional bibliographic year pending independent confirmation.'),
('V1-FCT-0875','WEB-CE-B14','V1-CARD-0216','V1-ENT-0328','entity_layer','work','metadata','SRC-0249','high','candidate_for_staging_review','Bibliography lists La Habana para un infante difunto as a title by Cabrera Infante.'),
('V1-FCT-0876','WEB-CE-B14','V1-CARD-0216','V1-ENT-0328','first_publication_year','1979','bibliographic','SRC-0249','high','candidate_for_staging_review','Escritores.org lists La Habana para un infante difunto in 1979.'),
('V1-FCT-0878','WEB-CE-B14','V1-CARD-0210','V1-ENT-0322','birth_year','1651','fact','SRC-0251','high','candidate_for_staging_review','UNAM repository identifies Sor Juana as born in 1651.'),
('V1-FCT-0879','WEB-CE-B14','V1-CARD-0210','V1-ENT-0322','death_year','1695','fact','SRC-0251','high','candidate_for_staging_review','UNAM repository identifies Sor Juana as dying in 1695.'),
('V1-FCT-0880','WEB-CE-B14','V1-CARD-0210','V1-ENT-0322','career_note','诗人、剧作家与宗教写作者','fact','SRC-0251','high','candidate_for_staging_review','UNAM materials identify Sor Juana as a religious writer and list poetry and drama.'),
('V1-FCT-0881','WEB-CE-B14','V1-CARD-0217','V1-ENT-0329','entity_layer','work','metadata','SRC-0251','high','candidate_for_staging_review','UNAM repository presents Primero sueño as a poem.'),
('V1-FCT-0882','WEB-CE-B14','V1-CARD-0217','V1-ENT-0329','first_publication_year','1692','bibliographic','SRC-0251','high','candidate_for_staging_review','UNAM repository states Primero sueño was originally published in 1692.'),
('V1-FCT-0883','WEB-CE-B14','V1-CARD-0217','V1-ENT-0329','genre_or_form','长诗','bibliographic','SRC-0251','high','candidate_for_staging_review','UNAM repository describes the 975-line poem.'),
('V1-FCT-0884','WEB-CE-B14','V1-CARD-0218','V1-ENT-0330','entity_layer','work','metadata','SRC-0252','high','candidate_for_staging_review','UNAM repository presents the Response as an epistle.'),
('V1-FCT-0885','WEB-CE-B14','V1-CARD-0218','V1-ENT-0330','composition_year','1691','bibliographic','SRC-0252','high','candidate_for_staging_review','UNAM repository dates completion of the letter to 1 March 1691; this is not a first-publication claim.'),
('V1-FCT-0886','WEB-CE-B14','V1-CARD-0218','V1-ENT-0330','genre_or_form','书信/散文','bibliographic','SRC-0252','high','candidate_for_staging_review','UNAM classifies the item under ensayo and epístola.'),
('V1-FCT-0887','WEB-CE-B14','V1-CARD-0219','V1-ENT-0331','entity_layer','work','metadata','SRC-0253','high','candidate_for_staging_review','UNAM describes Amor es más laberinto as a comedy.'),
('V1-FCT-0888','WEB-CE-B14','V1-CARD-0219','V1-ENT-0331','composition_year','1689','bibliographic','SRC-0253','high','candidate_for_staging_review','UNAM Global dates the premiere of Amor es más laberinto to 1689; this is a premiere year, not a first-publication claim.'),
('V1-FCT-0889','WEB-CE-B14','V1-CARD-0219','V1-ENT-0331','genre_or_form','戏剧','bibliographic','SRC-0253','high','candidate_for_staging_review','UNAM describes the title as a comedia.');

INSERT INTO fact_sources (fact_id,source_id,source_title)
SELECT fact_id, origin_id, '' FROM facts WHERE fact_id BETWEEN 'V1-FCT-0855' AND 'V1-FCT-0889';
UPDATE fact_sources SET source_title=(SELECT title FROM sources WHERE sources.source_id=fact_sources.source_id) WHERE fact_id BETWEEN 'V1-FCT-0855' AND 'V1-FCT-0889';

INSERT INTO card_facts (card_id,fact_id,admission_status)
SELECT card_id, fact_id, 'candidate_for_staging_review' FROM facts WHERE fact_id BETWEEN 'V1-FCT-0855' AND 'V1-FCT-0889';

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0416','','V1-CARD-0208','SRC-0247','A','both','yes','yes','SRC-0247','used','NONE'),
('V1-CS-0417','','V1-CARD-0208','SRC-0248','B','both','yes','yes','SRC-0248','used','NONE'),
('V1-CS-0418','','V1-CARD-0209','SRC-0249','C','both','yes','yes','SRC-0249','used','NONE'),
('V1-CS-0419','','V1-CARD-0209','SRC-0250','B','both','yes','yes','SRC-0250','used','NONE'),
('V1-CS-0420','','V1-CARD-0210','SRC-0251','B','both','yes','yes','SRC-0251','used','NONE'),
('V1-CS-0421','','V1-CARD-0210','SRC-0252','B','both','yes','yes','SRC-0252','used','NONE'),
('V1-CS-0422','','V1-CARD-0210','SRC-0253','B','both','yes','yes','SRC-0253','used','NONE'),
('V1-CS-0423','','V1-CARD-0211','SRC-0247','A','both','yes','yes','SRC-0247','used','NONE'),
('V1-CS-0424','','V1-CARD-0211','SRC-0248','B','both','yes','yes','SRC-0248','used','NONE'),
('V1-CS-0425','','V1-CARD-0212','SRC-0247','A','both','yes','yes','SRC-0247','used','NONE'),
('V1-CS-0426','','V1-CARD-0212','SRC-0248','B','both','yes','yes','SRC-0248','used','NONE'),
('V1-CS-0427','','V1-CARD-0213','SRC-0248','B','both','yes','yes','SRC-0248','used','NONE'),
('V1-CS-0428','','V1-CARD-0214','SRC-0249','C','both','yes','yes','SRC-0249','used','NONE'),
('V1-CS-0429','','V1-CARD-0214','SRC-0250','B','both','yes','yes','SRC-0250','used','NONE'),
('V1-CS-0430','','V1-CARD-0215','SRC-0249','C','both','yes','yes','SRC-0249','used','NONE'),
('V1-CS-0431','','V1-CARD-0215','SRC-0250','B','both','yes','yes','SRC-0250','used','NONE'),
('V1-CS-0432','','V1-CARD-0216','SRC-0249','C','both','yes','yes','SRC-0249','used','NONE'),
('V1-CS-0433','','V1-CARD-0216','SRC-0250','B','both','yes','yes','SRC-0250','used','NONE'),
('V1-CS-0434','','V1-CARD-0217','SRC-0251','B','both','yes','yes','SRC-0251','used','NONE'),
('V1-CS-0435','','V1-CARD-0218','SRC-0252','B','both','yes','yes','SRC-0252','used','NONE'),
('V1-CS-0436','','V1-CARD-0218','SRC-0253','B','both','yes','yes','SRC-0253','used','NONE'),
('V1-CS-0437','','V1-CARD-0219','SRC-0253','B','both','yes','yes','SRC-0253','used','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0248','WEB-CE-B14','CAND-B14-0248','V1-ENT-0320','CREATED','V1-ENT-0323','何塞·莱萨马·利马创作《天堂》（Paradiso）','high','accepted','WEB-CE-B14','1','NONE'),
('V1-REL-0249','WEB-CE-B14','CAND-B14-0249','V1-ENT-0320','CREATED','V1-ENT-0324','何塞·莱萨马·利马创作《奥皮亚诺·利卡里奥》（Oppiano Licario）','high','accepted','WEB-CE-B14','1','NONE'),
('V1-REL-0250','WEB-CE-B14','CAND-B14-0250','V1-ENT-0320','CREATED','V1-ENT-0325','何塞·莱萨马·利马创作《美洲的表达》（La expresión americana）','high','accepted','WEB-CE-B14','1','NONE'),
('V1-REL-0251','WEB-CE-B14','CAND-B14-0251','V1-ENT-0321','CREATED','V1-ENT-0326','吉列尔莫·卡夫雷拉·因凡特创作《三只忧伤的老虎》（Tres tristes tigres）','high','accepted','WEB-CE-B14','1','NONE'),
('V1-REL-0252','WEB-CE-B14','CAND-B14-0252','V1-ENT-0321','CREATED','V1-ENT-0327','吉列尔莫·卡夫雷拉·因凡特创作《热带黎明景观》（Vista del amanecer en el trópico）','high','accepted','WEB-CE-B14','1','NONE'),
('V1-REL-0253','WEB-CE-B14','CAND-B14-0253','V1-ENT-0321','CREATED','V1-ENT-0328','吉列尔莫·卡夫雷拉·因凡特创作《哈瓦那，一个早夭婴儿的回忆》（La Habana para un infante difunto）','high','accepted','WEB-CE-B14','1','NONE'),
('V1-REL-0254','WEB-CE-B14','CAND-B14-0254','V1-ENT-0322','CREATED','V1-ENT-0329','索尔·胡安娜·伊内斯·德·拉·克鲁斯创作《第一梦》（Primero sueño）','high','accepted','WEB-CE-B14','1','NONE'),
('V1-REL-0255','WEB-CE-B14','CAND-B14-0255','V1-ENT-0322','CREATED','V1-ENT-0330','索尔·胡安娜·伊内斯·德·拉·克鲁斯创作《答索尔·菲洛特娅》（Respuesta a Sor Filotea de la Cruz）','high','accepted','WEB-CE-B14','1','NONE'),
('V1-REL-0256','WEB-CE-B14','CAND-B14-0256','V1-ENT-0322','CREATED','V1-ENT-0331','索尔·胡安娜·伊内斯·德·拉·克鲁斯创作《爱情是更大的迷宫》（Amor es más laberinto）','high','accepted','WEB-CE-B14','1','NONE'),
('V1-REL-0257','WEB-CE-B14','CAND-B14-0257','V1-ENT-0320','ASSOCIATED_WITH_PLACE','V1-ENT-0096','何塞·莱萨马·利马与古巴关联','high','accepted','WEB-CE-B14','1','NONE'),
('V1-REL-0258','WEB-CE-B14','CAND-B14-0258','V1-ENT-0321','ASSOCIATED_WITH_PLACE','V1-ENT-0096','吉列尔莫·卡夫雷拉·因凡特与古巴关联','high','accepted','WEB-CE-B14','1','NONE'),
('V1-REL-0259','WEB-CE-B14','CAND-B14-0259','V1-ENT-0322','ASSOCIATED_WITH_PLACE','V1-ENT-0051','索尔·胡安娜·伊内斯·德·拉·克鲁斯与墨西哥关联','high','accepted','WEB-CE-B14','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0248','SRC-0247'),('V1-REL-0248','SRC-0248'),('V1-REL-0249','SRC-0247'),('V1-REL-0249','SRC-0248'),('V1-REL-0250','SRC-0248'),
('V1-REL-0251','SRC-0249'),('V1-REL-0251','SRC-0250'),('V1-REL-0252','SRC-0249'),('V1-REL-0252','SRC-0250'),('V1-REL-0253','SRC-0249'),('V1-REL-0253','SRC-0250'),
('V1-REL-0254','SRC-0251'),('V1-REL-0255','SRC-0252'),('V1-REL-0255','SRC-0253'),('V1-REL-0256','SRC-0253'),('V1-REL-0257','SRC-0248'),('V1-REL-0258','SRC-0249'),('V1-REL-0258','SRC-0250'),('V1-REL-0259','SRC-0251'),('V1-REL-0259','SRC-0252');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0273','V1-REL-0248','CAND-B14-0248','SRC-0247','','','Scholarly article links Paradiso to Lezama and dates the novel to 1966.','high','eligible_evidence','WEB-CE-B14'),
('V1-EV-0274','V1-REL-0249','CAND-B14-0249','SRC-0247','','','Scholarly article links Oppiano Licario to Lezama and dates the work to 1977.','high','eligible_evidence','WEB-CE-B14'),
('V1-EV-0275','V1-REL-0250','CAND-B14-0250','SRC-0248','','','AAP lists La expresión americana as a 1957 Lezama work.','high','eligible_evidence','WEB-CE-B14'),
('V1-EV-0276','V1-REL-0251','CAND-B14-0251','SRC-0249','','','Escritores.org bibliography links Tres tristes tigres to Cabrera Infante.','high','eligible_evidence','WEB-CE-B14'),
('V1-EV-0277','V1-REL-0252','CAND-B14-0252','SRC-0249','','','Escritores.org bibliography links Vista del amanecer en el trópico to Cabrera Infante.','high','eligible_evidence','WEB-CE-B14'),
('V1-EV-0278','V1-REL-0253','CAND-B14-0253','SRC-0249','','','Escritores.org bibliography links La Habana para un infante difunto to Cabrera Infante.','high','eligible_evidence','WEB-CE-B14'),
('V1-EV-0279','V1-REL-0254','CAND-B14-0254','SRC-0251','','','UNAM repository identifies Primero sueño as Sor Juana work.','high','eligible_evidence','WEB-CE-B14'),
('V1-EV-0280','V1-REL-0255','CAND-B14-0255','SRC-0252','','','UNAM repository identifies the Response to Sor Filotea as Sor Juana work.','high','eligible_evidence','WEB-CE-B14'),
('V1-EV-0281','V1-REL-0256','CAND-B14-0256','SRC-0253','','','UNAM Global identifies Amor es más laberinto as Sor Juana comedy.','high','eligible_evidence','WEB-CE-B14'),
('V1-EV-0282','V1-REL-0257','CAND-B14-0257','SRC-0248','','','AAP identifies Lezama as Cuban.','high','eligible_evidence','WEB-CE-B14'),
('V1-EV-0283','V1-REL-0258','CAND-B14-0258','SRC-0249','','','Escritores.org identifies Cabrera Infante as born in Cuba.','high','eligible_evidence','WEB-CE-B14'),
('V1-EV-0284','V1-REL-0259','CAND-B14-0259','SRC-0251','','','UNAM repository identifies Sor Juana as a Mexican writer.','high','eligible_evidence','WEB-CE-B14');

UPDATE relationship_evidence SET source_title=(SELECT title FROM sources WHERE sources.source_id=relationship_evidence.source_id) WHERE evidence_id BETWEEN 'V1-EV-0273' AND 'V1-EV-0284';

INSERT INTO metadata (key,value) VALUES ('last_change_set','WEB-CE-B14') ON CONFLICT(key) DO UPDATE SET value=excluded.value;
UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';
