-- WEB-CE-B11: Luna Max serial batch; Manuel Puig, Silvina Ocampo and Roberto Arlt.

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0225','B11-SRC-0225','28 de diciembre de 1932: nace Manuel Puig — Biblioteca Nacional','28 de diciembre de 1932: nace Manuel Puig','Biblioteca Nacional Mariano Moreno','','Biblioteca Nacional Mariano Moreno','','','web_page','','es','B','access_pass','WEB-CE-B11','Puig identity, 1932–1990, and 1968/1969/1976 works','remote_only','','https://www.bn.gov.ar/noticias/28-de-diciembre-de-1932-nace-manuel-puig'),
('SRC-0226','B11-SRC-0226','Documentos con el autor Puig, Manuel — Catálogo Bibliográfico','Documentos con el autor Puig, Manuel','Dirección General de Bibliotecas de la Ciudad de Buenos Aires','','Gobierno de la Ciudad de Buenos Aires','','','web_catalog','','es','B','access_pass','WEB-CE-B11','Puig author identity and library records for the three selected titles','remote_only','','https://catalogobibliotecas.buenosaires.gob.ar/pergamo/opac.php?a=bsqAutor&n=Puig%2C+Manuel'),
('SRC-0227','B11-SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar','Silvina Ocampo: el viaje olvidado','Ministerio de Educación de la Nación Argentina','','Educ.ar','','','web_page','','es','B','access_pass','WEB-CE-B11','Ocampo identity, bibliography, and 1937/1959/1961 dates','remote_only','','https://www.educ.ar/recursos/109330/silvina-ocampo-el-viaje-olvidado'),
('SRC-0228','B11-SRC-0228','Fantástica y misteriosa Silvina — Cultura','Fantástica y misteriosa Silvina','Ministerio de Cultura de la Nación Argentina','','Cultura Argentina','','','web_page','','es','B','access_pass','WEB-CE-B11','Ocampo identity, life dates, and selected story collections','remote_only','','https://www.cultura.gob.ar/silvina-ocampo-10848/'),
('SRC-0229','B11-SRC-0229','26 de abril de 1900: nace Roberto Arlt — Biblioteca Nacional','26 de abril de 1900: nace Roberto Arlt','Biblioteca Nacional Mariano Moreno','','Biblioteca Nacional Mariano Moreno','','','web_page','','es','B','access_pass','WEB-CE-B11','Arlt identity, 1900–1942, and 1926/1929/1931 novels','remote_only','','https://www.bn.gov.ar/noticias/26-de-abril-de-1900-nace-roberto-arlt'),
('SRC-0230','B11-SRC-0230','Roberto Arlt — Biblioteca del Congreso de la Nación','Roberto Arlt','Biblioteca del Congreso de la Nación Argentina','','Biblioteca del Congreso de la Nación','','','web_page','','es','B','access_pass','WEB-CE-B11','Arlt identity, publication chronology, and novel sequence','remote_only','','https://bcn.gob.ar/roberto-arlt');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0284','author','曼努埃尔·普伊格','Manuel Puig','candidate','1','CAND-B11-PUIG-AUTHOR','B11 Biblioteca Nacional and Buenos Aires library catalog; Chinese display candidate','NONE'),
('V1-ENT-0285','author','西尔维娜·奥坎波','Silvina Ocampo','candidate','1','CAND-B11-OCAMPO-AUTHOR','B11 Educ.ar and Argentina Culture profiles; Chinese display candidate','NONE'),
('V1-ENT-0286','author','罗贝托·阿尔特','Roberto Arlt','candidate','1','CAND-B11-ARLT-AUTHOR','B11 Biblioteca Nacional and Biblioteca del Congreso profiles; Chinese display candidate','NONE'),
('V1-ENT-0287','work','《蜘蛛女之吻》','El beso de la mujer araña','candidate','1','CAND-B11-PUIG-W01','B11 institutional bibliography; work layer','NONE'),
('V1-ENT-0288','work','《丽塔·海华丝的背叛》','La traición de Rita Hayworth','candidate','1','CAND-B11-PUIG-W02','B11 institutional bibliography; work layer','NONE'),
('V1-ENT-0289','work','《红唇》','Boquitas pintadas','candidate','1','CAND-B11-PUIG-W03','B11 institutional bibliography; work layer','NONE'),
('V1-ENT-0290','collection','《被遗忘的旅程》','Viaje olvidado','candidate','1','CAND-B11-OCAMPO-W01','B11 institutional bibliography; collection layer','NONE'),
('V1-ENT-0291','collection','《愤怒》','La furia','candidate','1','CAND-B11-OCAMPO-W02','B11 institutional bibliography; collection layer','NONE'),
('V1-ENT-0292','collection','《邀请》','Las invitadas','candidate','1','CAND-B11-OCAMPO-W03','B11 institutional bibliography; collection layer','NONE'),
('V1-ENT-0293','work','《七个疯子》','Los siete locos','candidate','1','CAND-B11-ARLT-W01','B11 institutional bibliography; work layer','NONE'),
('V1-ENT-0294','work','《火焰喷射器》','Los lanzallamas','candidate','1','CAND-B11-ARLT-W02','B11 institutional bibliography; work layer','NONE'),
('V1-ENT-0295','work','《疯玩具》','El juguete rabioso','candidate','1','CAND-B11-ARLT-W03','B11 institutional bibliography; work layer','NONE');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0284','CAND-B11-PUIG-AUTHOR','WEB-CE-B11','CAND-B11-PUIG-AUTHOR','V1-ENT-0284','create','B11 Reviewer pending; source-backed candidate'),
('V1-EMAP-0285','CAND-B11-OCAMPO-AUTHOR','WEB-CE-B11','CAND-B11-OCAMPO-AUTHOR','V1-ENT-0285','create','B11 Reviewer pending; source-backed candidate'),
('V1-EMAP-0286','CAND-B11-ARLT-AUTHOR','WEB-CE-B11','CAND-B11-ARLT-AUTHOR','V1-ENT-0286','create','B11 Reviewer pending; source-backed candidate'),
('V1-EMAP-0287','CAND-B11-PUIG-W01','WEB-CE-B11','CAND-B11-PUIG-W01','V1-ENT-0287','create','B11 Reviewer pending; source-backed candidate'),
('V1-EMAP-0288','CAND-B11-PUIG-W02','WEB-CE-B11','CAND-B11-PUIG-W02','V1-ENT-0288','create','B11 Reviewer pending; source-backed candidate'),
('V1-EMAP-0289','CAND-B11-PUIG-W03','WEB-CE-B11','CAND-B11-PUIG-W03','V1-ENT-0289','create','B11 Reviewer pending; source-backed candidate'),
('V1-EMAP-0290','CAND-B11-OCAMPO-W01','WEB-CE-B11','CAND-B11-OCAMPO-W01','V1-ENT-0290','create','B11 Reviewer pending; source-backed candidate'),
('V1-EMAP-0291','CAND-B11-OCAMPO-W02','WEB-CE-B11','CAND-B11-OCAMPO-W02','V1-ENT-0291','create','B11 Reviewer pending; source-backed candidate'),
('V1-EMAP-0292','CAND-B11-OCAMPO-W03','WEB-CE-B11','CAND-B11-OCAMPO-W03','V1-ENT-0292','create','B11 Reviewer pending; source-backed candidate'),
('V1-EMAP-0293','CAND-B11-ARLT-W01','WEB-CE-B11','CAND-B11-ARLT-W01','V1-ENT-0293','create','B11 Reviewer pending; source-backed candidate'),
('V1-EMAP-0294','CAND-B11-ARLT-W02','WEB-CE-B11','CAND-B11-ARLT-W02','V1-ENT-0294','create','B11 Reviewer pending; source-backed candidate'),
('V1-EMAP-0295','CAND-B11-ARLT-W03','WEB-CE-B11','CAND-B11-ARLT-W03','V1-ENT-0295','create','B11 Reviewer pending; source-backed candidate');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0172','','V1-ENT-0284','author','曼努埃尔·普伊格','曼努埃尔·普伊格','Manuel Puig','阿根廷','es','1932–1990','小说、剧本与戏剧','WEB-CE-B11','meets','NONE','### 曼努埃尔·普伊格｜Manuel Puig — 以国家图书馆与布宜诺斯艾利斯图书馆资料建立阿根廷小说入口。'),
('V1-CARD-0173','','V1-ENT-0285','author','西尔维娜·奥坎波','西尔维娜·奥坎波','Silvina Ocampo','阿根廷','es','1903–1993','短篇小说、诗歌与戏剧','WEB-CE-B11','meets','NONE','### 西尔维娜·奥坎波｜Silvina Ocampo — 以 Educ.ar 与阿根廷文化部资料建立短篇小说入口。'),
('V1-CARD-0174','','V1-ENT-0286','author','罗贝托·阿尔特','罗贝托·阿尔特','Roberto Arlt','阿根廷','es','1900–1942','小说、新闻与戏剧','WEB-CE-B11','meets','NONE','### 罗贝托·阿尔特｜Roberto Arlt — 以国家图书馆与国会图书馆年表建立都市小说入口。'),
('V1-CARD-0175','','V1-ENT-0287','work','《蜘蛛女之吻》','曼努埃尔·普伊格','El beso de la mujer araña','阿根廷','es','1976','小说','WEB-CE-B11','meets','NONE','### 《蜘蛛女之吻》｜El beso de la mujer araña — 国家图书馆资料记录 1976 年。'),
('V1-CARD-0176','','V1-ENT-0288','work','《丽塔·海华丝的背叛》','曼努埃尔·普伊格','La traición de Rita Hayworth','阿根廷','es','1968','小说','WEB-CE-B11','meets','NONE','### 《丽塔·海华丝的背叛》｜La traición de Rita Hayworth — 国家图书馆资料记录 1968 年。'),
('V1-CARD-0177','','V1-ENT-0289','work','《红唇》','曼努埃尔·普伊格','Boquitas pintadas','阿根廷','es','1969','小说','WEB-CE-B11','meets','NONE','### 《红唇》｜Boquitas pintadas — 国家图书馆资料记录 1969 年。'),
('V1-CARD-0178','','V1-ENT-0290','collection','《被遗忘的旅程》','西尔维娜·奥坎波','Viaje olvidado','阿根廷','es','1937','短篇小说集','WEB-CE-B11','meets','NONE','### 《被遗忘的旅程》｜Viaje olvidado — Educ.ar 与文化部资料记录 1937 年及故事集层级。'),
('V1-CARD-0179','','V1-ENT-0291','collection','《愤怒》','西尔维娜·奥坎波','La furia','阿根廷','es','1959','短篇小说集','WEB-CE-B11','meets','NONE','### 《愤怒》｜La furia — Educ.ar 与文化部资料记录 1959 年故事集。'),
('V1-CARD-0180','','V1-ENT-0292','collection','《邀请》','西尔维娜·奥坎波','Las invitadas','阿根廷','es','1961','短篇小说集','WEB-CE-B11','meets','NONE','### 《邀请》｜Las invitadas — Educ.ar 与文化部资料记录 1961 年故事集。'),
('V1-CARD-0181','','V1-ENT-0293','work','《七个疯子》','罗贝托·阿尔特','Los siete locos','阿根廷','es','1929','小说','WEB-CE-B11','meets','NONE','### 《七个疯子》｜Los siete locos — 国家图书馆与国会图书馆资料记录 1929 年。'),
('V1-CARD-0182','','V1-ENT-0294','work','《火焰喷射器》','罗贝托·阿尔特','Los lanzallamas','阿根廷','es','1931','小说','WEB-CE-B11','meets','NONE','### 《火焰喷射器》｜Los lanzallamas — 国会图书馆资料记录 1931 年及续作层级。'),
('V1-CARD-0183','','V1-ENT-0295','work','《疯玩具》','罗贝托·阿尔特','El juguete rabioso','阿根廷','es','1926','小说','WEB-CE-B11','meets','NONE','### 《疯玩具》｜El juguete rabioso — 国家图书馆与国会图书馆资料记录 1926 年。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-0732','WEB-CE-B11','V1-CARD-0172','V1-ENT-0284','birth_year','1932','fact','SRC-0225','high','candidate_for_staging_review','Biblioteca Nacional page records Puig born in 1932.'),
('V1-FCT-0733','WEB-CE-B11','V1-CARD-0172','V1-ENT-0284','death_year','1990','fact','SRC-0225','high','candidate_for_staging_review','Biblioteca Nacional page records Puig died in 1990.'),
('V1-FCT-0734','WEB-CE-B11','V1-CARD-0172','V1-ENT-0284','birth_place','将军维列加斯（General Villegas）','fact','SRC-0225','high','candidate_for_staging_review','Biblioteca Nacional page names General Villegas as birthplace.'),
('V1-FCT-0735','WEB-CE-B11','V1-CARD-0172','V1-ENT-0284','country_or_region','阿根廷','fact','SRC-0225','high','candidate_for_staging_review','Biblioteca Nacional presents Puig as an Argentine author.'),
('V1-FCT-0736','WEB-CE-B11','V1-CARD-0172','V1-ENT-0284','career_note','小说家、编剧与剧作家','fact','SRC-0225','high','candidate_for_staging_review','Biblioteca Nacional describes Puig as novelist, screenwriter and playwright.'),
('V1-FCT-0737','WEB-CE-B11','V1-CARD-0172','V1-ENT-0284','literary_identity','小说、剧本与戏剧作者','fact','SRC-0225','medium','candidate_for_staging_review','Description is a conservative synthesis of the listed roles.'),
('V1-FCT-0738','WEB-CE-B11','V1-CARD-0175','V1-ENT-0287','entity_layer','work','metadata','SRC-0226','high','candidate_for_staging_review','Library catalog records the title as a Puig literary work.'),
('V1-FCT-0739','WEB-CE-B11','V1-CARD-0175','V1-ENT-0287','first_publication_year','1976','bibliographic','SRC-0225','high','candidate_for_staging_review','Biblioteca Nacional page records the work in 1976.'),
('V1-FCT-0740','WEB-CE-B11','V1-CARD-0175','V1-ENT-0287','genre_or_form','小说','bibliographic','SRC-0225','high','candidate_for_staging_review','Biblioteca Nacional calls the selected Puig titles novels.'),
('V1-FCT-0741','WEB-CE-B11','V1-CARD-0175','V1-ENT-0287','bibliographic_note','机构资料支持题名、作者归属、小说层级与 1976 年；未推断故事地点。','bibliographic','SRC-0226','high','candidate_for_staging_review','Sources support only the stated bibliographic fields.'),
('V1-FCT-0742','WEB-CE-B11','V1-CARD-0176','V1-ENT-0288','entity_layer','work','metadata','SRC-0226','high','candidate_for_staging_review','Library catalog records the title as a Puig literary work.'),
('V1-FCT-0743','WEB-CE-B11','V1-CARD-0176','V1-ENT-0288','first_publication_year','1968','bibliographic','SRC-0225','high','candidate_for_staging_review','Biblioteca Nacional page records the first novel in 1968.'),
('V1-FCT-0744','WEB-CE-B11','V1-CARD-0176','V1-ENT-0288','genre_or_form','小说','bibliographic','SRC-0225','high','candidate_for_staging_review','Biblioteca Nacional calls the title a novel.'),
('V1-FCT-0745','WEB-CE-B11','V1-CARD-0176','V1-ENT-0288','bibliographic_note','机构资料支持题名、作者归属、小说层级与 1968 年；未推断故事地点。','bibliographic','SRC-0226','high','candidate_for_staging_review','Sources support only the stated bibliographic fields.'),
('V1-FCT-0746','WEB-CE-B11','V1-CARD-0177','V1-ENT-0289','entity_layer','work','metadata','SRC-0226','high','candidate_for_staging_review','Library catalog records the title as a Puig literary work.'),
('V1-FCT-0747','WEB-CE-B11','V1-CARD-0177','V1-ENT-0289','first_publication_year','1969','bibliographic','SRC-0225','high','candidate_for_staging_review','Biblioteca Nacional page records the work in 1969.'),
('V1-FCT-0748','WEB-CE-B11','V1-CARD-0177','V1-ENT-0289','genre_or_form','小说','bibliographic','SRC-0225','high','candidate_for_staging_review','Biblioteca Nacional calls the title a novel.'),
('V1-FCT-0749','WEB-CE-B11','V1-CARD-0177','V1-ENT-0289','bibliographic_note','机构资料支持题名、作者归属、小说层级与 1969 年；未推断故事地点。','bibliographic','SRC-0226','high','candidate_for_staging_review','Sources support only the stated bibliographic fields.'),
('V1-FCT-0750','WEB-CE-B11','V1-CARD-0173','V1-ENT-0285','birth_year','1903','fact','SRC-0228','high','candidate_for_staging_review','Argentina Culture page records Ocampo born in 1903.'),
('V1-FCT-0751','WEB-CE-B11','V1-CARD-0173','V1-ENT-0285','death_year','1993','fact','SRC-0228','high','candidate_for_staging_review','Argentina Culture page records Ocampo died in 1993.'),
('V1-FCT-0752','WEB-CE-B11','V1-CARD-0173','V1-ENT-0285','birth_place','布宜诺斯艾利斯（Buenos Aires）','fact','SRC-0228','high','candidate_for_staging_review','Argentina Culture page records Buenos Aires as her place of life and death; birthplace wording kept conservative.'),
('V1-FCT-0753','WEB-CE-B11','V1-CARD-0173','V1-ENT-0285','country_or_region','阿根廷','fact','SRC-0227','high','candidate_for_staging_review','Educ.ar identifies Ocampo in Argentine literary context.'),
('V1-FCT-0754','WEB-CE-B11','V1-CARD-0173','V1-ENT-0285','career_note','作家、诗人、翻译家','fact','SRC-0227','high','candidate_for_staging_review','Educ.ar lists stories, poems, translations and theatre.'),
('V1-FCT-0755','WEB-CE-B11','V1-CARD-0173','V1-ENT-0285','literary_identity','短篇小说、诗歌与戏剧作者','fact','SRC-0227','medium','candidate_for_staging_review','Description stays at the forms explicitly listed by Educ.ar.'),
('V1-FCT-0756','WEB-CE-B11','V1-CARD-0178','V1-ENT-0290','entity_layer','collection','metadata','SRC-0227','high','candidate_for_staging_review','Educ.ar calls Viaje olvidado her first book of stories.'),
('V1-FCT-0757','WEB-CE-B11','V1-CARD-0178','V1-ENT-0290','first_publication_year','1937','bibliographic','SRC-0227','high','candidate_for_staging_review','Educ.ar records Viaje olvidado in 1937.'),
('V1-FCT-0758','WEB-CE-B11','V1-CARD-0178','V1-ENT-0290','genre_or_form','短篇小说集','bibliographic','SRC-0227','high','candidate_for_staging_review','Educ.ar calls it a first book of stories.'),
('V1-FCT-0759','WEB-CE-B11','V1-CARD-0178','V1-ENT-0290','bibliographic_note','机构资料支持题名、故事集层级与 1937 年；未添加主题或地点判断。','bibliographic','SRC-0228','high','candidate_for_staging_review','Sources support only the stated bibliographic fields.'),
('V1-FCT-0760','WEB-CE-B11','V1-CARD-0179','V1-ENT-0291','entity_layer','collection','metadata','SRC-0228','high','candidate_for_staging_review','Argentina Culture lists La furia y otros cuentos as a story collection.'),
('V1-FCT-0761','WEB-CE-B11','V1-CARD-0179','V1-ENT-0291','first_publication_year','1959','bibliographic','SRC-0228','high','candidate_for_staging_review','Argentina Culture records the collection in 1959.'),
('V1-FCT-0762','WEB-CE-B11','V1-CARD-0179','V1-ENT-0291','genre_or_form','短篇小说集','bibliographic','SRC-0228','high','candidate_for_staging_review','The source identifies the selected volume as cuentos.'),
('V1-FCT-0763','WEB-CE-B11','V1-CARD-0179','V1-ENT-0291','bibliographic_note','机构资料支持题名、故事集层级与 1959 年；未添加主题或地点判断。','bibliographic','SRC-0227','high','candidate_for_staging_review','Sources support only the stated bibliographic fields.'),
('V1-FCT-0764','WEB-CE-B11','V1-CARD-0180','V1-ENT-0292','entity_layer','collection','metadata','SRC-0227','high','candidate_for_staging_review','Educ.ar lists Las invitadas among Ocampo story books.'),
('V1-FCT-0765','WEB-CE-B11','V1-CARD-0180','V1-ENT-0292','first_publication_year','1961','bibliographic','SRC-0227','high','candidate_for_staging_review','Educ.ar records Las invitadas in 1961.'),
('V1-FCT-0766','WEB-CE-B11','V1-CARD-0180','V1-ENT-0292','genre_or_form','短篇小说集','bibliographic','SRC-0227','high','candidate_for_staging_review','The source places the title in Ocampo story bibliography.'),
('V1-FCT-0767','WEB-CE-B11','V1-CARD-0180','V1-ENT-0292','bibliographic_note','机构资料支持题名、故事集层级与 1961 年；未添加主题或地点判断。','bibliographic','SRC-0228','high','candidate_for_staging_review','Sources support only the stated bibliographic fields.'),
('V1-FCT-0768','WEB-CE-B11','V1-CARD-0174','V1-ENT-0286','birth_year','1900','fact','SRC-0229','high','candidate_for_staging_review','Biblioteca Nacional records Arlt born in 1900.'),
('V1-FCT-0769','WEB-CE-B11','V1-CARD-0174','V1-ENT-0286','death_year','1942','fact','SRC-0230','high','candidate_for_staging_review','Biblioteca del Congreso records Arlt died in 1942.'),
('V1-FCT-0771','WEB-CE-B11','V1-CARD-0174','V1-ENT-0286','country_or_region','阿根廷','fact','SRC-0229','high','candidate_for_staging_review','Biblioteca Nacional presents Arlt as an Argentine writer.'),
('V1-FCT-0772','WEB-CE-B11','V1-CARD-0174','V1-ENT-0286','career_note','小说家、记者与剧作家','fact','SRC-0230','high','candidate_for_staging_review','Biblioteca del Congreso records novels, journalism and theatre.'),
('V1-FCT-0773','WEB-CE-B11','V1-CARD-0174','V1-ENT-0286','literary_identity','小说、新闻与戏剧作者','fact','SRC-0230','medium','candidate_for_staging_review','Description stays at forms listed in the institutional profile.'),
('V1-FCT-0774','WEB-CE-B11','V1-CARD-0181','V1-ENT-0293','entity_layer','work','metadata','SRC-0230','high','candidate_for_staging_review','Biblioteca del Congreso identifies Los siete locos as a novel.'),
('V1-FCT-0775','WEB-CE-B11','V1-CARD-0181','V1-ENT-0293','first_publication_year','1929','bibliographic','SRC-0230','high','candidate_for_staging_review','Biblioteca del Congreso records publication in 1929.'),
('V1-FCT-0776','WEB-CE-B11','V1-CARD-0181','V1-ENT-0293','genre_or_form','小说','bibliographic','SRC-0229','high','candidate_for_staging_review','Biblioteca Nacional describes the title as a novel.'),
('V1-FCT-0777','WEB-CE-B11','V1-CARD-0181','V1-ENT-0293','bibliographic_note','机构资料支持题名、小说层级与 1929 年；未推断故事地点。','bibliographic','SRC-0230','high','candidate_for_staging_review','Sources support only the stated bibliographic fields.'),
('V1-FCT-0778','WEB-CE-B11','V1-CARD-0182','V1-ENT-0294','entity_layer','work','metadata','SRC-0230','high','candidate_for_staging_review','Biblioteca del Congreso identifies Los lanzallamas as the second part of the novel sequence.'),
('V1-FCT-0779','WEB-CE-B11','V1-CARD-0182','V1-ENT-0294','first_publication_year','1931','bibliographic','SRC-0230','high','candidate_for_staging_review','Biblioteca del Congreso records publication in 1931.'),
('V1-FCT-0780','WEB-CE-B11','V1-CARD-0182','V1-ENT-0294','genre_or_form','小说','bibliographic','SRC-0229','high','candidate_for_staging_review','Biblioteca Nacional presents the title among Arlt novels.'),
('V1-FCT-0781','WEB-CE-B11','V1-CARD-0182','V1-ENT-0294','bibliographic_note','国会图书馆明确说明其为《七个疯子》的后续部分，并记录 1931 年。','bibliographic','SRC-0230','high','candidate_for_staging_review','Source supports sequel description and year only.'),
('V1-FCT-0782','WEB-CE-B11','V1-CARD-0183','V1-ENT-0295','entity_layer','work','metadata','SRC-0229','high','candidate_for_staging_review','Biblioteca Nacional identifies El juguete rabioso as Arlt first novel.'),
('V1-FCT-0783','WEB-CE-B11','V1-CARD-0183','V1-ENT-0295','first_publication_year','1926','bibliographic','SRC-0229','high','candidate_for_staging_review','Biblioteca Nacional records publication in 1926.'),
('V1-FCT-0784','WEB-CE-B11','V1-CARD-0183','V1-ENT-0295','genre_or_form','小说','bibliographic','SRC-0229','high','candidate_for_staging_review','Biblioteca Nacional calls it Arlt first novel.'),
('V1-FCT-0785','WEB-CE-B11','V1-CARD-0183','V1-ENT-0295','bibliographic_note','机构资料支持题名、小说层级与 1926 年；未推断故事地点。','bibliographic','SRC-0230','high','candidate_for_staging_review','Sources support only the stated bibliographic fields.');

INSERT INTO fact_sources (fact_id,source_id,source_title)
SELECT fact_id, origin_id, '' FROM facts WHERE fact_id BETWEEN 'V1-FCT-0732' AND 'V1-FCT-0785';
UPDATE fact_sources SET source_title=(SELECT title FROM sources WHERE sources.source_id=fact_sources.source_id) WHERE fact_id BETWEEN 'V1-FCT-0732' AND 'V1-FCT-0785';

INSERT INTO card_facts (card_id,fact_id,admission_status)
SELECT card_id, fact_id, 'candidate_for_staging_review' FROM facts WHERE fact_id BETWEEN 'V1-FCT-0732' AND 'V1-FCT-0785';

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0344','','V1-CARD-0172','SRC-0225','B','both','yes','yes','SRC-0225','used','NONE'),('V1-CS-0345','','V1-CARD-0172','SRC-0226','B','both','yes','yes','SRC-0226','used','NONE'),
('V1-CS-0346','','V1-CARD-0173','SRC-0227','B','both','yes','yes','SRC-0227','used','NONE'),('V1-CS-0347','','V1-CARD-0173','SRC-0228','B','both','yes','yes','SRC-0228','used','NONE'),
('V1-CS-0348','','V1-CARD-0174','SRC-0229','B','both','yes','yes','SRC-0229','used','NONE'),('V1-CS-0349','','V1-CARD-0174','SRC-0230','B','both','yes','yes','SRC-0230','used','NONE'),
('V1-CS-0350','','V1-CARD-0175','SRC-0225','B','both','yes','yes','SRC-0225','used','NONE'),('V1-CS-0351','','V1-CARD-0175','SRC-0226','B','both','yes','yes','SRC-0226','used','NONE'),
('V1-CS-0352','','V1-CARD-0176','SRC-0225','B','both','yes','yes','SRC-0225','used','NONE'),('V1-CS-0353','','V1-CARD-0176','SRC-0226','B','both','yes','yes','SRC-0226','used','NONE'),
('V1-CS-0354','','V1-CARD-0177','SRC-0225','B','both','yes','yes','SRC-0225','used','NONE'),('V1-CS-0355','','V1-CARD-0177','SRC-0226','B','both','yes','yes','SRC-0226','used','NONE'),
('V1-CS-0356','','V1-CARD-0178','SRC-0227','B','both','yes','yes','SRC-0227','used','NONE'),('V1-CS-0357','','V1-CARD-0178','SRC-0228','B','both','yes','yes','SRC-0228','used','NONE'),
('V1-CS-0358','','V1-CARD-0179','SRC-0227','B','both','yes','yes','SRC-0227','used','NONE'),('V1-CS-0359','','V1-CARD-0179','SRC-0228','B','both','yes','yes','SRC-0228','used','NONE'),
('V1-CS-0360','','V1-CARD-0180','SRC-0227','B','both','yes','yes','SRC-0227','used','NONE'),('V1-CS-0361','','V1-CARD-0180','SRC-0228','B','both','yes','yes','SRC-0228','used','NONE'),
('V1-CS-0362','','V1-CARD-0181','SRC-0229','B','both','yes','yes','SRC-0229','used','NONE'),('V1-CS-0363','','V1-CARD-0181','SRC-0230','B','both','yes','yes','SRC-0230','used','NONE'),
('V1-CS-0364','','V1-CARD-0182','SRC-0229','B','both','yes','yes','SRC-0229','used','NONE'),('V1-CS-0365','','V1-CARD-0182','SRC-0230','B','both','yes','yes','SRC-0230','used','NONE'),
('V1-CS-0366','','V1-CARD-0183','SRC-0229','B','both','yes','yes','SRC-0229','used','NONE'),('V1-CS-0367','','V1-CARD-0183','SRC-0230','B','both','yes','yes','SRC-0230','used','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0212','WEB-CE-B11','CAND-B11-0212','V1-ENT-0284','CREATED','V1-ENT-0287','曼努埃尔·普伊格创作《蜘蛛女之吻》（El beso de la mujer araña）','high','accepted','WEB-CE-B11','1','NONE'),
('V1-REL-0213','WEB-CE-B11','CAND-B11-0213','V1-ENT-0284','CREATED','V1-ENT-0288','曼努埃尔·普伊格创作《丽塔·海华丝的背叛》（La traición de Rita Hayworth）','high','accepted','WEB-CE-B11','1','NONE'),
('V1-REL-0214','WEB-CE-B11','CAND-B11-0214','V1-ENT-0284','CREATED','V1-ENT-0289','曼努埃尔·普伊格创作《红唇》（Boquitas pintadas）','high','accepted','WEB-CE-B11','1','NONE'),
('V1-REL-0215','WEB-CE-B11','CAND-B11-0215','V1-ENT-0285','CREATED','V1-ENT-0290','西尔维娜·奥坎波创作《被遗忘的旅程》（Viaje olvidado）','high','accepted','WEB-CE-B11','1','NONE'),
('V1-REL-0216','WEB-CE-B11','CAND-B11-0216','V1-ENT-0285','CREATED','V1-ENT-0291','西尔维娜·奥坎波创作《愤怒》（La furia）','high','accepted','WEB-CE-B11','1','NONE'),
('V1-REL-0217','WEB-CE-B11','CAND-B11-0217','V1-ENT-0285','CREATED','V1-ENT-0292','西尔维娜·奥坎波创作《邀请》（Las invitadas）','high','accepted','WEB-CE-B11','1','NONE'),
('V1-REL-0218','WEB-CE-B11','CAND-B11-0218','V1-ENT-0286','CREATED','V1-ENT-0293','罗贝托·阿尔特创作《七个疯子》（Los siete locos）','high','accepted','WEB-CE-B11','1','NONE'),
('V1-REL-0219','WEB-CE-B11','CAND-B11-0219','V1-ENT-0286','CREATED','V1-ENT-0294','罗贝托·阿尔特创作《火焰喷射器》（Los lanzallamas）','high','accepted','WEB-CE-B11','1','NONE'),
('V1-REL-0220','WEB-CE-B11','CAND-B11-0220','V1-ENT-0286','CREATED','V1-ENT-0295','罗贝托·阿尔特创作《疯玩具》（El juguete rabioso）','high','accepted','WEB-CE-B11','1','NONE'),
('V1-REL-0221','WEB-CE-B11','CAND-B11-0221','V1-ENT-0284','ASSOCIATED_WITH_PLACE','V1-ENT-0001','曼努埃尔·普伊格与阿根廷关联','high','accepted','WEB-CE-B11','1','NONE'),
('V1-REL-0222','WEB-CE-B11','CAND-B11-0222','V1-ENT-0285','ASSOCIATED_WITH_PLACE','V1-ENT-0001','西尔维娜·奥坎波与阿根廷关联','high','accepted','WEB-CE-B11','1','NONE'),
('V1-REL-0223','WEB-CE-B11','CAND-B11-0223','V1-ENT-0286','ASSOCIATED_WITH_PLACE','V1-ENT-0001','罗贝托·阿尔特与阿根廷关联','high','accepted','WEB-CE-B11','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0212','SRC-0225'),('V1-REL-0213','SRC-0225'),('V1-REL-0214','SRC-0225'),
('V1-REL-0215','SRC-0227'),('V1-REL-0216','SRC-0228'),('V1-REL-0217','SRC-0227'),
('V1-REL-0218','SRC-0229'),('V1-REL-0219','SRC-0230'),('V1-REL-0220','SRC-0229'),
('V1-REL-0221','SRC-0225'),('V1-REL-0222','SRC-0227'),('V1-REL-0223','SRC-0229');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0237','V1-REL-0212','CAND-B11-0212','SRC-0225','','','Biblioteca Nacional page lists El beso de la mujer araña as a Puig work.','high','eligible_evidence','WEB-CE-B11'),
('V1-EV-0238','V1-REL-0213','CAND-B11-0213','SRC-0225','','','Biblioteca Nacional page lists La traición de Rita Hayworth as Puig first novel.','high','eligible_evidence','WEB-CE-B11'),
('V1-EV-0239','V1-REL-0214','CAND-B11-0214','SRC-0225','','','Biblioteca Nacional page lists Boquitas pintadas as a Puig work.','high','eligible_evidence','WEB-CE-B11'),
('V1-EV-0240','V1-REL-0215','CAND-B11-0215','SRC-0227','','','Educ.ar bibliography lists Viaje olvidado under Silvina Ocampo.','high','eligible_evidence','WEB-CE-B11'),
('V1-EV-0241','V1-REL-0216','CAND-B11-0216','SRC-0228','','','Argentina Culture bibliography lists La furia y otros cuentos under Ocampo.','high','eligible_evidence','WEB-CE-B11'),
('V1-EV-0242','V1-REL-0217','CAND-B11-0217','SRC-0227','','','Educ.ar bibliography lists Las invitadas under Ocampo.','high','eligible_evidence','WEB-CE-B11'),
('V1-EV-0243','V1-REL-0218','CAND-B11-0218','SRC-0229','','','Biblioteca Nacional page lists Los siete locos as an Arlt novel.','high','eligible_evidence','WEB-CE-B11'),
('V1-EV-0244','V1-REL-0219','CAND-B11-0219','SRC-0230','','','Biblioteca del Congreso chronology lists Los lanzallamas under Arlt.','high','eligible_evidence','WEB-CE-B11'),
('V1-EV-0245','V1-REL-0220','CAND-B11-0220','SRC-0229','','','Biblioteca Nacional page lists El juguete rabioso as Arlt first novel.','high','eligible_evidence','WEB-CE-B11'),
('V1-EV-0246','V1-REL-0221','CAND-B11-0221','SRC-0225','','','Biblioteca Nacional identifies Puig as Argentine.','high','eligible_evidence','WEB-CE-B11'),
('V1-EV-0247','V1-REL-0222','CAND-B11-0222','SRC-0227','','','Educ.ar presents Ocampo in Argentine literary context.','high','eligible_evidence','WEB-CE-B11'),
('V1-EV-0248','V1-REL-0223','CAND-B11-0223','SRC-0229','','','Biblioteca Nacional presents Arlt as an Argentine writer.','high','eligible_evidence','WEB-CE-B11');

UPDATE relationship_evidence SET source_title=(SELECT title FROM sources WHERE sources.source_id=relationship_evidence.source_id) WHERE evidence_id BETWEEN 'V1-EV-0237' AND 'V1-EV-0248';

INSERT INTO metadata (key,value) VALUES ('last_change_set','WEB-CE-B11') ON CONFLICT(key) DO UPDATE SET value=excluded.value;
UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';
