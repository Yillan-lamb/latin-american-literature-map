-- WEB-CE-B07: Luna Max serial batch; source-backed poetry and Uruguayan fiction data.

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0188','B07-SRC-0188','Nicanor Parra (1914-2018)','Nicanor Parra (1914-2018)','Biblioteca Nacional de Chile / Memoria Chilena','','Biblioteca Nacional de Chile','','','web_page','','es','B','access_pass','WEB-CE-B07','Parra 生卒、出生地、诗人身份与 Poemas y antipoemas、Versos de salón 书目','remote_only','','https://www.memoriachilena.gob.cl/602/w3-article-3629.html'),
('SRC-0189','B07-SRC-0189','Fichas bibliográficas I — Nicanor Parra','Fichas bibliográficas I — Nicanor Parra','Universidad de Chile','','Universidad de Chile','','','web_page','','es','B','access_pass','WEB-CE-B07','Parra 作品书目与 Discursos de sobremesa 1997 记录','remote_only','','https://www.nicanorparra.uchile.cl/bibliografia/bibliogr.html'),
('SRC-0190','B07-SRC-0190','Portada de Discursos de sobremesa, 1997','Discursos de sobremesa','Biblioteca Nacional de Chile / Memoria Chilena','','Biblioteca Nacional de Chile','1997','','web_page','174','es','B','access_pass','WEB-CE-B07','Discursos de sobremesa 题名、作者、出版地与 1997 年','remote_only','','https://www.memoriachilena.gob.cl/602/w3-article-71481.html'),
('SRC-0191','B07-SRC-0191','Alejandra Pizarnik, salvaje e indagadora','Alejandra Pizarnik, salvaje e indagadora','Argentina.gob.ar / Cultura','','Argentina.gob.ar','2021','','web_page','','es','B','access_pass','WEB-CE-B07','Pizarnik Avellaneda 1936、诗人身份与生平范围','remote_only','','https://www.cultura.gob.ar/alejandra-pizarnik-10448/'),
('SRC-0192','B07-SRC-0192','CVC. Alejandra Pizarnik. Bibliografía. Obras','Bibliografía. Obras','Centro Virtual Cervantes','','Instituto Cervantes','','','web_page','','es','B','access_pass','WEB-CE-B07','Árbol de Diana 1962、Los trabajos y las noches 1965、Extracción de la piedra de locura 1968','remote_only','','https://cvc.cervantes.es/literatura/escritores/pizarnik/bibliografia/default.htm'),
('SRC-0193','B07-SRC-0193','CVC. Alejandra Pizarnik. Obra','Obra de Alejandra Pizarnik','Centro Virtual Cervantes','','Instituto Cervantes','','','web_page','','es','B','access_pass','WEB-CE-B07','Pizarnik 作品形态与主要诗集/散文作品范围','remote_only','','https://cvc.cervantes.es/literatura/escritores/pizarnik/obra/'),
('SRC-0194','B07-SRC-0194','Mario Benedetti — Biografía','Mario Benedetti — Biografía','Fundación Mario Benedetti','','Fundación Mario Benedetti','','','web_page','','es','B','access_pass','WEB-CE-B07','Benedetti 1920–2009、出生地、乌拉圭身份与作家/诗人身份','remote_only','','https://fundacionmariobenedetti.uy/mariobenedettibio/'),
('SRC-0195','B07-SRC-0195','Su obra: 1959-1965','Su obra: 1959-1965','Fundación Mario Benedetti','','Fundación Mario Benedetti','','','web_page','','es','B','access_pass','WEB-CE-B07','Montevideanos 1959、La tregua 1960、Gracias por el fuego 1965 的题名、形态与首版','remote_only','','https://fundacionmariobenedetti.uy/obras-59-65/'),
('SRC-0196','B07-SRC-0196','Obras y libros — Fundación Mario Benedetti','Obras y libros','Fundación Mario Benedetti','','Fundación Mario Benedetti','','','web_page','','es','B','access_pass','WEB-CE-B07','Montevideanos 书目、收录篇目与版本目录辅助核对','remote_only','','https://fundacionmariobenedetti.uy/obras-y-libros/');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0236','author','尼卡诺尔·帕拉','Nicanor Parra','candidate','2','CAND-B07-PARRA-AUTHOR','B07 Memoria Chilena and Universidad de Chile bibliography; Chinese display candidate','NONE'),
('V1-ENT-0237','author','阿莱杭德拉·皮扎尼克','Alejandra Pizarnik','candidate','2','CAND-B07-PIZARNIK-AUTHOR','B07 Argentina Cultura and CVC author/works pages; Chinese display candidate','NONE'),
('V1-ENT-0238','author','马里奥·贝内德蒂','Mario Benedetti','candidate','2','CAND-B07-BENEDETTI-AUTHOR','B07 Fundación Mario Benedetti biography and bibliography; Chinese display candidate','NONE'),
('V1-ENT-0239','collection','《诗歌与反诗歌》','Poemas y antipoemas','candidate','1','CAND-B07-PARRA-W01','B07 Memoria Chilena title and 1954 publication','NONE'),
('V1-ENT-0240','collection','《沙龙篇》','Versos de salón','candidate','1','CAND-B07-PARRA-W02','B07 Memoria Chilena title and 1962 publication','NONE'),
('V1-ENT-0241','collection','《饭后演讲》','Discursos de sobremesa','candidate','1','CAND-B07-PARRA-W03','B07 Universidad de Chile bibliography and Memoria Chilena record; collection layer retained','NONE'),
('V1-ENT-0242','collection','《狄安娜之树》','Árbol de Diana','candidate','1','CAND-B07-PIZARNIK-W01','B07 CVC bibliography and 1962 publication','NONE'),
('V1-ENT-0243','collection','《作品与夜晚》','Los trabajos y las noches','candidate','1','CAND-B07-PIZARNIK-W02','B07 CVC bibliography and 1965 publication','NONE'),
('V1-ENT-0244','collection','《取出疯石》','Extracción de la piedra de locura','candidate','1','CAND-B07-PIZARNIK-W03','B07 CVC bibliography and works page; 1968 publication','NONE'),
('V1-ENT-0245','work','《休战》','La tregua','candidate','1','CAND-B07-BENEDETTI-W01','B07 Fundación Mario Benedetti first-edition record; novel layer','NONE'),
('V1-ENT-0246','work','《谢谢你的火》','Gracias por el fuego','candidate','1','CAND-B07-BENEDETTI-W02','B07 Fundación Mario Benedetti first-edition record; novel layer','NONE'),
('V1-ENT-0247','collection','《蒙得维的亚人》','Montevideanos','candidate','1','CAND-B07-BENEDETTI-W03','B07 Fundación Mario Benedetti first-edition record; short-story collection layer','NONE');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0236','CAND-B07-PARRA-AUTHOR','WEB-CE-B07','CAND-B07-PARRA-AUTHOR','V1-ENT-0236','create','B07 Reviewer pending; source-backed candidate'),
('V1-EMAP-0237','CAND-B07-PIZARNIK-AUTHOR','WEB-CE-B07','CAND-B07-PIZARNIK-AUTHOR','V1-ENT-0237','create','B07 Reviewer pending; source-backed candidate'),
('V1-EMAP-0238','CAND-B07-BENEDETTI-AUTHOR','WEB-CE-B07','CAND-B07-BENEDETTI-AUTHOR','V1-ENT-0238','create','B07 Reviewer pending; source-backed candidate'),
('V1-EMAP-0239','CAND-B07-PARRA-W01','WEB-CE-B07','CAND-B07-PARRA-W01','V1-ENT-0239','create','B07 Reviewer pending; source-backed candidate'),
('V1-EMAP-0240','CAND-B07-PARRA-W02','WEB-CE-B07','CAND-B07-PARRA-W02','V1-ENT-0240','create','B07 Reviewer pending; source-backed candidate'),
('V1-EMAP-0241','CAND-B07-PARRA-W03','WEB-CE-B07','CAND-B07-PARRA-W03','V1-ENT-0241','create','B07 Reviewer pending; source-backed candidate'),
('V1-EMAP-0242','CAND-B07-PIZARNIK-W01','WEB-CE-B07','CAND-B07-PIZARNIK-W01','V1-ENT-0242','create','B07 Reviewer pending; source-backed candidate'),
('V1-EMAP-0243','CAND-B07-PIZARNIK-W02','WEB-CE-B07','CAND-B07-PIZARNIK-W02','V1-ENT-0243','create','B07 Reviewer pending; source-backed candidate'),
('V1-EMAP-0244','CAND-B07-PIZARNIK-W03','WEB-CE-B07','CAND-B07-PIZARNIK-W03','V1-ENT-0244','create','B07 Reviewer pending; source-backed candidate'),
('V1-EMAP-0245','CAND-B07-BENEDETTI-W01','WEB-CE-B07','CAND-B07-BENEDETTI-W01','V1-ENT-0245','create','B07 Reviewer pending; source-backed candidate'),
('V1-EMAP-0246','CAND-B07-BENEDETTI-W02','WEB-CE-B07','CAND-B07-BENEDETTI-W02','V1-ENT-0246','create','B07 Reviewer pending; source-backed candidate'),
('V1-EMAP-0247','CAND-B07-BENEDETTI-W03','WEB-CE-B07','CAND-B07-BENEDETTI-W03','V1-ENT-0247','create','B07 Reviewer pending; source-backed candidate');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0124','','V1-ENT-0236','author','尼卡诺尔·帕拉','尼卡诺尔·帕拉','Nicanor Parra','智利','es','1914–2018','诗歌','WEB-CE-B07','meets','NONE','### 尼卡诺尔·帕拉｜Nicanor Parra — 本批以机构来源确认的生平与三部书目建立智利诗歌入口。'),
('V1-CARD-0125','','V1-ENT-0237','author','阿莱杭德拉·皮扎尼克','阿莱杭德拉·皮扎尼克','Alejandra Pizarnik','阿根廷','es','1936–1972','诗歌','WEB-CE-B07','meets','NONE','### 阿莱杭德拉·皮扎尼克｜Alejandra Pizarnik — 本批以作者资料与 CVC 书目建立三部诗集入口。'),
('V1-CARD-0126','','V1-ENT-0238','author','马里奥·贝内德蒂','马里奥·贝内德蒂','Mario Benedetti','乌拉圭','es','1920–2009','小说与短篇','WEB-CE-B07','meets','NONE','### 马里奥·贝内德蒂｜Mario Benedetti — 本批以基金会传记和作品目录建立乌拉圭小说/短篇入口。'),
('V1-CARD-0127','','V1-ENT-0239','collection','《诗歌与反诗歌》','尼卡诺尔·帕拉','Poemas y antipoemas','智利','es','1954','诗集','WEB-CE-B07','meets','NONE','### 《诗歌与反诗歌》｜Poemas y antipoemas — Memoria Chilena 与智利大学书目记录 1954 年题名。'),
('V1-CARD-0128','','V1-ENT-0240','collection','《沙龙篇》','尼卡诺尔·帕拉','Versos de salón','智利','es','1962','诗集','WEB-CE-B07','meets','NONE','### 《沙龙篇》｜Versos de salón — 机构作者专题和书目页记录 1962 年题名。'),
('V1-CARD-0129','','V1-ENT-0241','collection','《饭后演讲》','尼卡诺尔·帕拉','Discursos de sobremesa','智利','es','1997','诗歌/演讲体合集','WEB-CE-B07','meets','NONE','### 《饭后演讲》｜Discursos de sobremesa — 书目页记录 1997 年出版与作者信息。'),
('V1-CARD-0130','','V1-ENT-0242','collection','《狄安娜之树》','阿莱杭德拉·皮扎尼克','Árbol de Diana','阿根廷','es','1962','诗集','WEB-CE-B07','meets','NONE','### 《狄安娜之树》｜Árbol de Diana — CVC 书目页记录 1962 年题名。'),
('V1-CARD-0131','','V1-ENT-0243','collection','《作品与夜晚》','阿莱杭德拉·皮扎尼克','Los trabajos y las noches','阿根廷','es','1965','诗集','WEB-CE-B07','meets','NONE','### 《作品与夜晚》｜Los trabajos y las noches — CVC 书目页记录 1965 年题名。'),
('V1-CARD-0132','','V1-ENT-0244','collection','《取出疯石》','阿莱杭德拉·皮扎尼克','Extracción de la piedra de locura','阿根廷','es','1968','诗集','WEB-CE-B07','meets','NONE','### 《取出疯石》｜Extracción de la piedra de locura — CVC 书目与作品页共同支持题名和 1968 年。'),
('V1-CARD-0133','','V1-ENT-0245','work','《休战》','马里奥·贝内德蒂','La tregua','乌拉圭','es','1960','小说','WEB-CE-B07','meets','NONE','### 《休战》｜La tregua — Fundación Mario Benedetti 记录 1960 年首版和小说形态。'),
('V1-CARD-0134','','V1-ENT-0246','work','《谢谢你的火》','马里奥·贝内德蒂','Gracias por el fuego','乌拉圭','es','1965','小说','WEB-CE-B07','meets','NONE','### 《谢谢你的火》｜Gracias por el fuego — Fundación Mario Benedetti 记录 1965 年首版。'),
('V1-CARD-0135','','V1-ENT-0247','collection','《蒙得维的亚人》','马里奥·贝内德蒂','Montevideanos','乌拉圭','es','1959','短篇小说集','WEB-CE-B07','meets','NONE','### 《蒙得维的亚人》｜Montevideanos — Fundación Mario Benedetti 记录 1959 年首版与收录篇目。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-0563','WEB-CE-B07','V1-CARD-0124','V1-ENT-0236','birth_year','1914','fact','SRC-0188','high','candidate_for_staging_review','Memoria Chilena chronology directly records Parra birth year.'),
('V1-FCT-0564','WEB-CE-B07','V1-CARD-0124','V1-ENT-0236','death_year','2018','fact','SRC-0188','high','candidate_for_staging_review','Source title and author record identify 1914-2018.'),
('V1-FCT-0565','WEB-CE-B07','V1-CARD-0124','V1-ENT-0236','country_or_region','智利','fact','SRC-0188','high','candidate_for_staging_review','Memoria Chilena author subject is Chilean literature.'),
('V1-FCT-0566','WEB-CE-B07','V1-CARD-0124','V1-ENT-0236','birth_place','圣法比安·德·阿利科（San Fabián de Alico）','fact','SRC-0188','high','candidate_for_staging_review','Chronology directly names San Fabián de Alico.'),
('V1-FCT-0567','WEB-CE-B07','V1-CARD-0124','V1-ENT-0236','career_note','诗人','fact','SRC-0188','high','candidate_for_staging_review','Memoria Chilena directly calls Parra a poet.'),
('V1-FCT-0568','WEB-CE-B07','V1-CARD-0125','V1-ENT-0237','birth_year','1936','fact','SRC-0191','high','candidate_for_staging_review','Argentina Cultura directly records Pizarnik birth year.'),
('V1-FCT-0569','WEB-CE-B07','V1-CARD-0125','V1-ENT-0237','death_year','1972','fact','SRC-0191','high','candidate_for_staging_review','Argentina Cultura directly records death date and year.'),
('V1-FCT-0570','WEB-CE-B07','V1-CARD-0125','V1-ENT-0237','country_or_region','阿根廷','fact','SRC-0191','high','candidate_for_staging_review','Official Argentine culture page identifies the author in Argentina.'),
('V1-FCT-0571','WEB-CE-B07','V1-CARD-0125','V1-ENT-0237','birth_place','阿韦亚内达（Avellaneda）','fact','SRC-0191','high','candidate_for_staging_review','Official page names the Hospital Fiorito in Avellaneda.'),
('V1-FCT-0572','WEB-CE-B07','V1-CARD-0125','V1-ENT-0237','career_note','诗人','fact','SRC-0191','high','candidate_for_staging_review','Official culture article calls Pizarnik a poet.'),
('V1-FCT-0573','WEB-CE-B07','V1-CARD-0126','V1-ENT-0238','birth_year','1920','fact','SRC-0194','high','candidate_for_staging_review','Foundation biography records 14 September 1920.'),
('V1-FCT-0574','WEB-CE-B07','V1-CARD-0126','V1-ENT-0238','death_year','2009','fact','SRC-0194','high','candidate_for_staging_review','Foundation biography records death in Montevideo in 2009.'),
('V1-FCT-0575','WEB-CE-B07','V1-CARD-0126','V1-ENT-0238','country_or_region','乌拉圭','fact','SRC-0194','high','candidate_for_staging_review','Foundation identifies Benedetti as an Uruguayan author.'),
('V1-FCT-0576','WEB-CE-B07','V1-CARD-0126','V1-ENT-0238','birth_place','帕索德洛斯托罗斯（Paso de los Toros）','fact','SRC-0194','high','candidate_for_staging_review','Foundation biography directly names Paso de los Toros.'),
('V1-FCT-0577','WEB-CE-B07','V1-CARD-0126','V1-ENT-0238','career_note','作家、诗人','fact','SRC-0194','medium','candidate_for_staging_review','Foundation biography and work overview identify literary authorship and poetry.'),
('V1-FCT-0578','WEB-CE-B07','V1-CARD-0127','V1-ENT-0239','entity_layer','collection','metadata','SRC-0188','high','candidate_for_staging_review','Poetry book is represented as a collection.'),
('V1-FCT-0579','WEB-CE-B07','V1-CARD-0127','V1-ENT-0239','first_publication_year','1954','bibliographic','SRC-0188','high','candidate_for_staging_review','Memoria Chilena directly records publication in 1954.'),
('V1-FCT-0580','WEB-CE-B07','V1-CARD-0127','V1-ENT-0239','bibliographic_note','SRC-0188 与 SRC-0189 直接列出 Poemas y antipoemas；本批不从题名推导文学史判断。','bibliographic','SRC-0189','high','candidate_for_staging_review','Sources support title and bibliographic identity only.'),
('V1-FCT-0581','WEB-CE-B07','V1-CARD-0128','V1-ENT-0240','entity_layer','collection','metadata','SRC-0188','high','candidate_for_staging_review','Poetry book is represented as a collection.'),
('V1-FCT-0582','WEB-CE-B07','V1-CARD-0128','V1-ENT-0240','first_publication_year','1962','bibliographic','SRC-0188','high','candidate_for_staging_review','Memoria Chilena author page lists Versos de salón (1962).'),
('V1-FCT-0583','WEB-CE-B07','V1-CARD-0128','V1-ENT-0240','bibliographic_note','SRC-0188 与 SRC-0189 直接列出 Versos de salón；本批不扩写反诗理论。','bibliographic','SRC-0189','high','candidate_for_staging_review','Sources support title and bibliographic identity only.'),
('V1-FCT-0584','WEB-CE-B07','V1-CARD-0129','V1-ENT-0241','entity_layer','collection','metadata','SRC-0189','high','candidate_for_staging_review','Bibliographic collection of speeches retained as collection layer.'),
('V1-FCT-0585','WEB-CE-B07','V1-CARD-0129','V1-ENT-0241','first_publication_year','1997','bibliographic','SRC-0190','high','candidate_for_staging_review','Memoria Chilena record directly gives 1997.'),
('V1-FCT-0586','WEB-CE-B07','V1-CARD-0129','V1-ENT-0241','bibliographic_note','SRC-0189 与 SRC-0190 直接列出 Discursos de sobremesa；中文展示名仅作 common_title。','bibliographic','SRC-0190','high','candidate_for_staging_review','Sources support title, form and year only.'),
('V1-FCT-0587','WEB-CE-B07','V1-CARD-0130','V1-ENT-0242','entity_layer','collection','metadata','SRC-0192','high','candidate_for_staging_review','Poetry book is represented as a collection.'),
('V1-FCT-0588','WEB-CE-B07','V1-CARD-0130','V1-ENT-0242','first_publication_year','1962','bibliographic','SRC-0192','high','candidate_for_staging_review','CVC bibliography directly gives Árbol de Diana 1962.'),
('V1-FCT-0589','WEB-CE-B07','V1-CARD-0130','V1-ENT-0242','bibliographic_note','CVC 书目直接列出 Árbol de Diana；本批不把作品页描述升级为主题事实。','bibliographic','SRC-0192','high','candidate_for_staging_review','Source supports title and year.'),
('V1-FCT-0590','WEB-CE-B07','V1-CARD-0131','V1-ENT-0243','entity_layer','collection','metadata','SRC-0192','high','candidate_for_staging_review','Poetry book is represented as a collection.'),
('V1-FCT-0591','WEB-CE-B07','V1-CARD-0131','V1-ENT-0243','first_publication_year','1965','bibliographic','SRC-0192','high','candidate_for_staging_review','CVC bibliography directly gives Los trabajos y las noches 1965.'),
('V1-FCT-0592','WEB-CE-B07','V1-CARD-0131','V1-ENT-0243','bibliographic_note','CVC 书目直接列出 Los trabajos y las noches；本批不添加主题结论。','bibliographic','SRC-0192','high','candidate_for_staging_review','Source supports title and year.'),
('V1-FCT-0593','WEB-CE-B07','V1-CARD-0132','V1-ENT-0244','entity_layer','collection','metadata','SRC-0193','high','candidate_for_staging_review','Poetry book is represented as a collection.'),
('V1-FCT-0594','WEB-CE-B07','V1-CARD-0132','V1-ENT-0244','first_publication_year','1968','bibliographic','SRC-0192','high','candidate_for_staging_review','CVC bibliography directly gives Extracción de la piedra de locura 1968.'),
('V1-FCT-0595','WEB-CE-B07','V1-CARD-0132','V1-ENT-0244','bibliographic_note','CVC 书目与作品页均列出 Extracción de la piedra de locura；本批仅作书目事实。','bibliographic','SRC-0193','high','candidate_for_staging_review','Sources support title, form and year.'),
('V1-FCT-0596','WEB-CE-B07','V1-CARD-0133','V1-ENT-0245','entity_layer','work','metadata','SRC-0195','high','candidate_for_staging_review','Foundation identifies La tregua as a novel.'),
('V1-FCT-0597','WEB-CE-B07','V1-CARD-0133','V1-ENT-0245','first_publication_year','1960','bibliographic','SRC-0195','high','candidate_for_staging_review','Foundation records first edition in 1960.'),
('V1-FCT-0598','WEB-CE-B07','V1-CARD-0133','V1-ENT-0245','bibliographic_note','Fundación Mario Benedetti 直接列出 La tregua 的题名、小说形态和首版信息。','bibliographic','SRC-0195','high','candidate_for_staging_review','Source supports title, form and year only.'),
('V1-FCT-0599','WEB-CE-B07','V1-CARD-0134','V1-ENT-0246','entity_layer','work','metadata','SRC-0195','high','candidate_for_staging_review','Foundation identifies Gracias por el fuego as a novel.'),
('V1-FCT-0600','WEB-CE-B07','V1-CARD-0134','V1-ENT-0246','first_publication_year','1965','bibliographic','SRC-0195','high','candidate_for_staging_review','Foundation records first edition in May 1965.'),
('V1-FCT-0601','WEB-CE-B07','V1-CARD-0134','V1-ENT-0246','bibliographic_note','Fundación Mario Benedetti 直接列出 Gracias por el fuego 的题名、小说形态和首版信息。','bibliographic','SRC-0195','high','candidate_for_staging_review','Source supports title, form and year only.'),
('V1-FCT-0602','WEB-CE-B07','V1-CARD-0135','V1-ENT-0247','entity_layer','collection','metadata','SRC-0195','high','candidate_for_staging_review','Foundation identifies Montevideanos as a cuentos collection.'),
('V1-FCT-0603','WEB-CE-B07','V1-CARD-0135','V1-ENT-0247','first_publication_year','1959','bibliographic','SRC-0195','high','candidate_for_staging_review','Foundation records Alfa first edition in 1959.'),
('V1-FCT-0604','WEB-CE-B07','V1-CARD-0135','V1-ENT-0247','bibliographic_note','SRC-0195 与 SRC-0196 直接列出 Montevideanos 题名、短篇形态和收录篇目。','bibliographic','SRC-0196','high','candidate_for_staging_review','Sources support title, form and year only');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-0563','SRC-0188','WEB-CE-B07 source SRC-0188'),('V1-FCT-0564','SRC-0188','WEB-CE-B07 source SRC-0188'),('V1-FCT-0565','SRC-0188','WEB-CE-B07 source SRC-0188'),('V1-FCT-0566','SRC-0188','WEB-CE-B07 source SRC-0188'),('V1-FCT-0567','SRC-0188','WEB-CE-B07 source SRC-0188'),
('V1-FCT-0568','SRC-0191','WEB-CE-B07 source SRC-0191'),('V1-FCT-0569','SRC-0191','WEB-CE-B07 source SRC-0191'),('V1-FCT-0570','SRC-0191','WEB-CE-B07 source SRC-0191'),('V1-FCT-0571','SRC-0191','WEB-CE-B07 source SRC-0191'),('V1-FCT-0572','SRC-0191','WEB-CE-B07 source SRC-0191'),
('V1-FCT-0573','SRC-0194','WEB-CE-B07 source SRC-0194'),('V1-FCT-0574','SRC-0194','WEB-CE-B07 source SRC-0194'),('V1-FCT-0575','SRC-0194','WEB-CE-B07 source SRC-0194'),('V1-FCT-0576','SRC-0194','WEB-CE-B07 source SRC-0194'),('V1-FCT-0577','SRC-0194','WEB-CE-B07 source SRC-0194'),
('V1-FCT-0578','SRC-0188','WEB-CE-B07 source SRC-0188'),('V1-FCT-0578','SRC-0189','WEB-CE-B07 source SRC-0189'),('V1-FCT-0579','SRC-0188','WEB-CE-B07 source SRC-0188'),('V1-FCT-0580','SRC-0189','WEB-CE-B07 source SRC-0189'),
('V1-FCT-0581','SRC-0188','WEB-CE-B07 source SRC-0188'),('V1-FCT-0581','SRC-0189','WEB-CE-B07 source SRC-0189'),('V1-FCT-0582','SRC-0188','WEB-CE-B07 source SRC-0188'),('V1-FCT-0583','SRC-0189','WEB-CE-B07 source SRC-0189'),
('V1-FCT-0584','SRC-0189','WEB-CE-B07 source SRC-0189'),('V1-FCT-0585','SRC-0190','WEB-CE-B07 source SRC-0190'),('V1-FCT-0586','SRC-0190','WEB-CE-B07 source SRC-0190'),
('V1-FCT-0587','SRC-0192','WEB-CE-B07 source SRC-0192'),('V1-FCT-0588','SRC-0192','WEB-CE-B07 source SRC-0192'),('V1-FCT-0589','SRC-0192','WEB-CE-B07 source SRC-0192'),
('V1-FCT-0590','SRC-0192','WEB-CE-B07 source SRC-0192'),('V1-FCT-0591','SRC-0192','WEB-CE-B07 source SRC-0192'),('V1-FCT-0592','SRC-0192','WEB-CE-B07 source SRC-0192'),
('V1-FCT-0593','SRC-0193','WEB-CE-B07 source SRC-0193'),('V1-FCT-0594','SRC-0192','WEB-CE-B07 source SRC-0192'),('V1-FCT-0595','SRC-0193','WEB-CE-B07 source SRC-0193'),
('V1-FCT-0596','SRC-0195','WEB-CE-B07 source SRC-0195'),('V1-FCT-0597','SRC-0195','WEB-CE-B07 source SRC-0195'),('V1-FCT-0598','SRC-0195','WEB-CE-B07 source SRC-0195'),
('V1-FCT-0599','SRC-0195','WEB-CE-B07 source SRC-0195'),('V1-FCT-0600','SRC-0195','WEB-CE-B07 source SRC-0195'),('V1-FCT-0601','SRC-0195','WEB-CE-B07 source SRC-0195'),
('V1-FCT-0602','SRC-0195','WEB-CE-B07 source SRC-0195'),('V1-FCT-0602','SRC-0196','WEB-CE-B07 source SRC-0196'),('V1-FCT-0603','SRC-0195','WEB-CE-B07 source SRC-0195'),('V1-FCT-0604','SRC-0196','WEB-CE-B07 source SRC-0196');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0124','V1-FCT-0563','candidate_for_staging_review'),('V1-CARD-0124','V1-FCT-0564','candidate_for_staging_review'),('V1-CARD-0124','V1-FCT-0565','candidate_for_staging_review'),('V1-CARD-0124','V1-FCT-0566','candidate_for_staging_review'),('V1-CARD-0124','V1-FCT-0567','candidate_for_staging_review'),
('V1-CARD-0125','V1-FCT-0568','candidate_for_staging_review'),('V1-CARD-0125','V1-FCT-0569','candidate_for_staging_review'),('V1-CARD-0125','V1-FCT-0570','candidate_for_staging_review'),('V1-CARD-0125','V1-FCT-0571','candidate_for_staging_review'),('V1-CARD-0125','V1-FCT-0572','candidate_for_staging_review'),
('V1-CARD-0126','V1-FCT-0573','candidate_for_staging_review'),('V1-CARD-0126','V1-FCT-0574','candidate_for_staging_review'),('V1-CARD-0126','V1-FCT-0575','candidate_for_staging_review'),('V1-CARD-0126','V1-FCT-0576','candidate_for_staging_review'),('V1-CARD-0126','V1-FCT-0577','candidate_for_staging_review'),
('V1-CARD-0127','V1-FCT-0578','candidate_for_staging_review'),('V1-CARD-0127','V1-FCT-0579','candidate_for_staging_review'),('V1-CARD-0127','V1-FCT-0580','candidate_for_staging_review'),
('V1-CARD-0128','V1-FCT-0581','candidate_for_staging_review'),('V1-CARD-0128','V1-FCT-0582','candidate_for_staging_review'),('V1-CARD-0128','V1-FCT-0583','candidate_for_staging_review'),
('V1-CARD-0129','V1-FCT-0584','candidate_for_staging_review'),('V1-CARD-0129','V1-FCT-0585','candidate_for_staging_review'),('V1-CARD-0129','V1-FCT-0586','candidate_for_staging_review'),
('V1-CARD-0130','V1-FCT-0587','candidate_for_staging_review'),('V1-CARD-0130','V1-FCT-0588','candidate_for_staging_review'),('V1-CARD-0130','V1-FCT-0589','candidate_for_staging_review'),
('V1-CARD-0131','V1-FCT-0590','candidate_for_staging_review'),('V1-CARD-0131','V1-FCT-0591','candidate_for_staging_review'),('V1-CARD-0131','V1-FCT-0592','candidate_for_staging_review'),
('V1-CARD-0132','V1-FCT-0593','candidate_for_staging_review'),('V1-CARD-0132','V1-FCT-0594','candidate_for_staging_review'),('V1-CARD-0132','V1-FCT-0595','candidate_for_staging_review'),
('V1-CARD-0133','V1-FCT-0596','candidate_for_staging_review'),('V1-CARD-0133','V1-FCT-0597','candidate_for_staging_review'),('V1-CARD-0133','V1-FCT-0598','candidate_for_staging_review'),
('V1-CARD-0134','V1-FCT-0599','candidate_for_staging_review'),('V1-CARD-0134','V1-FCT-0600','candidate_for_staging_review'),('V1-CARD-0134','V1-FCT-0601','candidate_for_staging_review'),
('V1-CARD-0135','V1-FCT-0602','candidate_for_staging_review'),('V1-CARD-0135','V1-FCT-0603','candidate_for_staging_review'),('V1-CARD-0135','V1-FCT-0604','candidate_for_staging_review');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0240','','V1-CARD-0124','SRC-0188','B','both','yes','yes','SRC-0188','used','NONE'),('V1-CS-0241','','V1-CARD-0124','SRC-0189','B','both','yes','yes','SRC-0189','used','NONE'),
('V1-CS-0242','','V1-CARD-0125','SRC-0191','B','both','yes','yes','SRC-0191','used','NONE'),('V1-CS-0243','','V1-CARD-0125','SRC-0192','B','both','yes','yes','SRC-0192','used','NONE'),('V1-CS-0244','','V1-CARD-0125','SRC-0193','B','both','yes','yes','SRC-0193','used','NONE'),
('V1-CS-0245','','V1-CARD-0126','SRC-0194','B','both','yes','yes','SRC-0194','used','NONE'),('V1-CS-0246','','V1-CARD-0126','SRC-0195','B','both','yes','yes','SRC-0195','used','NONE'),
('V1-CS-0247','','V1-CARD-0127','SRC-0188','B','both','yes','yes','SRC-0188','used','NONE'),('V1-CS-0248','','V1-CARD-0127','SRC-0189','B','both','yes','yes','SRC-0189','used','NONE'),
('V1-CS-0249','','V1-CARD-0128','SRC-0188','B','both','yes','yes','SRC-0188','used','NONE'),('V1-CS-0250','','V1-CARD-0128','SRC-0189','B','both','yes','yes','SRC-0189','used','NONE'),
('V1-CS-0251','','V1-CARD-0129','SRC-0189','B','both','yes','yes','SRC-0189','used','NONE'),('V1-CS-0252','','V1-CARD-0129','SRC-0190','B','both','yes','yes','SRC-0190','used','NONE'),
('V1-CS-0253','','V1-CARD-0130','SRC-0192','B','both','yes','yes','SRC-0192','used','NONE'),
('V1-CS-0254','','V1-CARD-0131','SRC-0192','B','both','yes','yes','SRC-0192','used','NONE'),
('V1-CS-0255','','V1-CARD-0132','SRC-0192','B','both','yes','yes','SRC-0192','used','NONE'),('V1-CS-0256','','V1-CARD-0132','SRC-0193','B','both','yes','yes','SRC-0193','used','NONE'),
('V1-CS-0257','','V1-CARD-0133','SRC-0195','B','both','yes','yes','SRC-0195','used','NONE'),
('V1-CS-0258','','V1-CARD-0134','SRC-0195','B','both','yes','yes','SRC-0195','used','NONE'),
('V1-CS-0259','','V1-CARD-0135','SRC-0195','B','both','yes','yes','SRC-0195','used','NONE'),('V1-CS-0260','','V1-CARD-0135','SRC-0196','B','both','yes','yes','SRC-0196','used','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0164','WEB-CE-B07','CAND-B07-0164','V1-ENT-0236','CREATED','V1-ENT-0239','尼卡诺尔·帕拉 创作 《诗歌与反诗歌》（Poemas y antipoemas）','high','accepted','WEB-CE-B07','1','NONE'),
('V1-REL-0165','WEB-CE-B07','CAND-B07-0165','V1-ENT-0236','CREATED','V1-ENT-0240','尼卡诺尔·帕拉 创作 《沙龙篇》（Versos de salón）','high','accepted','WEB-CE-B07','1','NONE'),
('V1-REL-0166','WEB-CE-B07','CAND-B07-0166','V1-ENT-0236','CREATED','V1-ENT-0241','尼卡诺尔·帕拉 创作 《饭后演讲》（Discursos de sobremesa）','high','accepted','WEB-CE-B07','1','NONE'),
('V1-REL-0167','WEB-CE-B07','CAND-B07-0167','V1-ENT-0237','CREATED','V1-ENT-0242','阿莱杭德拉·皮扎尼克 创作 《狄安娜之树》（Árbol de Diana）','high','accepted','WEB-CE-B07','1','NONE'),
('V1-REL-0168','WEB-CE-B07','CAND-B07-0168','V1-ENT-0237','CREATED','V1-ENT-0243','阿莱杭德拉·皮扎尼克 创作 《作品与夜晚》（Los trabajos y las noches）','high','accepted','WEB-CE-B07','1','NONE'),
('V1-REL-0169','WEB-CE-B07','CAND-B07-0169','V1-ENT-0237','CREATED','V1-ENT-0244','阿莱杭德拉·皮扎尼克 创作 《取出疯石》（Extracción de la piedra de locura）','high','accepted','WEB-CE-B07','1','NONE'),
('V1-REL-0170','WEB-CE-B07','CAND-B07-0170','V1-ENT-0238','CREATED','V1-ENT-0245','马里奥·贝内德蒂 创作 《休战》（La tregua）','high','accepted','WEB-CE-B07','1','NONE'),
('V1-REL-0171','WEB-CE-B07','CAND-B07-0171','V1-ENT-0238','CREATED','V1-ENT-0246','马里奥·贝内德蒂 创作 《谢谢你的火》（Gracias por el fuego）','high','accepted','WEB-CE-B07','1','NONE'),
('V1-REL-0172','WEB-CE-B07','CAND-B07-0172','V1-ENT-0238','CREATED','V1-ENT-0247','马里奥·贝内德蒂 创作 《蒙得维的亚人》（Montevideanos）','high','accepted','WEB-CE-B07','1','NONE'),
('V1-REL-0173','WEB-CE-B07','CAND-B07-0173','V1-ENT-0236','ASSOCIATED_WITH_PLACE','V1-ENT-0123','尼卡诺尔·帕拉与智利关联','high','accepted','WEB-CE-B07','1','NONE'),
('V1-REL-0174','WEB-CE-B07','CAND-B07-0174','V1-ENT-0237','ASSOCIATED_WITH_PLACE','V1-ENT-0001','阿莱杭德拉·皮扎尼克与阿根廷关联','high','accepted','WEB-CE-B07','1','NONE'),
('V1-REL-0175','WEB-CE-B07','CAND-B07-0175','V1-ENT-0238','ASSOCIATED_WITH_PLACE','V1-ENT-0196','马里奥·贝内德蒂与乌拉圭关联','high','accepted','WEB-CE-B07','1','NONE');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0189','V1-REL-0164','CAND-B07-0164','SRC-0188','WEB-CE-B07 source SRC-0188','','Institutional author page directly lists Poemas y antipoemas.','high','eligible_evidence','WEB-CE-B07'),
('V1-EV-0190','V1-REL-0165','CAND-B07-0165','SRC-0188','WEB-CE-B07 source SRC-0188','','Institutional author page directly lists Versos de salón.','high','eligible_evidence','WEB-CE-B07'),
('V1-EV-0191','V1-REL-0166','CAND-B07-0166','SRC-0190','WEB-CE-B07 source SRC-0190','','National library record directly identifies Discursos de sobremesa and author.','high','eligible_evidence','WEB-CE-B07'),
('V1-EV-0192','V1-REL-0167','CAND-B07-0167','SRC-0192','WEB-CE-B07 source SRC-0192','','CVC bibliography directly lists Árbol de Diana.','high','eligible_evidence','WEB-CE-B07'),
('V1-EV-0193','V1-REL-0168','CAND-B07-0168','SRC-0192','WEB-CE-B07 source SRC-0192','','CVC bibliography directly lists Los trabajos y las noches.','high','eligible_evidence','WEB-CE-B07'),
('V1-EV-0194','V1-REL-0169','CAND-B07-0169','SRC-0192','WEB-CE-B07 source SRC-0192','','CVC bibliography directly lists Extracción de la piedra de locura.','high','eligible_evidence','WEB-CE-B07'),
('V1-EV-0195','V1-REL-0170','CAND-B07-0170','SRC-0195','WEB-CE-B07 source SRC-0195','','Foundation works page directly identifies La tregua as a novel.','high','eligible_evidence','WEB-CE-B07'),
('V1-EV-0196','V1-REL-0171','CAND-B07-0171','SRC-0195','WEB-CE-B07 source SRC-0195','','Foundation works page directly identifies Gracias por el fuego as a novel.','high','eligible_evidence','WEB-CE-B07'),
('V1-EV-0197','V1-REL-0172','CAND-B07-0172','SRC-0195','WEB-CE-B07 source SRC-0195','','Foundation works page directly identifies Montevideanos as a cuentos collection.','high','eligible_evidence','WEB-CE-B07'),
('V1-EV-0198','V1-REL-0173','CAND-B07-0173','SRC-0188','WEB-CE-B07 source SRC-0188','','Memoria Chilena author page supports Parra and Chile association.','high','eligible_evidence','WEB-CE-B07'),
('V1-EV-0199','V1-REL-0174','CAND-B07-0174','SRC-0191','WEB-CE-B07 source SRC-0191','','Official Argentine culture page supports Pizarnik and Argentina association.','high','eligible_evidence','WEB-CE-B07'),
('V1-EV-0200','V1-REL-0175','CAND-B07-0175','SRC-0194','WEB-CE-B07 source SRC-0194','','Foundation biography supports Benedetti and Uruguay association.','high','eligible_evidence','WEB-CE-B07');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0164','SRC-0188'),('V1-REL-0165','SRC-0188'),('V1-REL-0166','SRC-0190'),('V1-REL-0167','SRC-0192'),('V1-REL-0168','SRC-0192'),('V1-REL-0169','SRC-0192'),('V1-REL-0170','SRC-0195'),('V1-REL-0171','SRC-0195'),('V1-REL-0172','SRC-0195'),('V1-REL-0173','SRC-0188'),('V1-REL-0174','SRC-0191'),('V1-REL-0175','SRC-0194');

UPDATE fact_sources SET source_title=(SELECT title FROM sources WHERE sources.source_id=fact_sources.source_id) WHERE fact_id BETWEEN 'V1-FCT-0563' AND 'V1-FCT-0604';
UPDATE relationship_evidence SET source_title=(SELECT title FROM sources WHERE sources.source_id=relationship_evidence.source_id) WHERE evidence_id BETWEEN 'V1-EV-0189' AND 'V1-EV-0200';
INSERT OR REPLACE INTO metadata (key,value) VALUES ('last_change_set','WEB-CE-B07'),('research_version','1.1.0');
UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';
