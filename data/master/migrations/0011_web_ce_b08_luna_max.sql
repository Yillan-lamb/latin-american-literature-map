-- WEB-CE-B08: Luna Max serial batch; Andean novels and Mexican short fiction.

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0197','B08-SRC-0197','BNP: Tayta Arguedas — José María Arguedas','José María Arguedas','Biblioteca Nacional del Perú','','Biblioteca Nacional del Perú','2024','','web_page','','es','B','access_pass','WEB-CE-B08','Arguedas 1911–1969、Andahuaylas、作家身份与生平背景','remote_only','','https://www.bnp.gob.pe/bnp-se-presenta-libro-tayta-arguedas-en-conmemoracion-de-los-113-anos-de-su-nacimiento/'),
('SRC-0198','B08-SRC-0198','Un recorrido por la obra literaria de José María Arguedas','Un recorrido por la obra literaria de José María Arguedas','Casa de la Literatura Peruana','','Casa de la Literatura Peruana','2011','','web_page','','es','B','access_pass','WEB-CE-B08','Yawar fiesta 1941、Los ríos profundos 1958、Todas las sangres 1964 书目','remote_only','','https://www.casadelaliteratura.gob.pe/un-recorrido-por-la-obra-literaria-de-jose-maria-arguedas/'),
('SRC-0199','B08-SRC-0199','José María Arguedas: puentes entre su vida y Los ríos profundos','José María Arguedas: puentes entre su vida y Los ríos profundos','Casa de la Literatura Peruana','','Casa de la Literatura Peruana','2023','','web_page','','es','B','access_pass','WEB-CE-B08','Arguedas 作者身份、Los ríos profundos 1958 与 Ernesto 故事简介','remote_only','','https://www.casadelaliteratura.gob.pe/jose-maria-arguedas-puentes-vida-los-rios-profundos/'),
('SRC-0200','B08-SRC-0200','Sergio Pitol. Biografía','Sergio Pitol. Biografía','Instituto Cervantes','','Instituto Cervantes','','','web_page','','es','B','access_pass','WEB-CE-B08','Pitol 1933–2018、Puebla、墨西哥身份与三部小说年份','remote_only','','https://www.cervantes.es/bibliotecas_documentacion_espanol/biografias/sofia_sergio_pitol.htm'),
('SRC-0201','B08-SRC-0201','CVC. Sergio Pitol. Bibliografía','CVC. Sergio Pitol. Bibliografía','Centro Virtual Cervantes','','Instituto Cervantes','','','web_page','','es','B','access_pass','WEB-CE-B08','El desfile del amor、Domar a la divina garza、La vida conyugal 书目与年份','remote_only','','https://cvc.cervantes.es/literatura/escritores/pitol/bibliografia.htm'),
('SRC-0202','B08-SRC-0202','Cien años de Juan José Arreola','Cien años de Juan José Arreola','Fonoteca Nacional de México','','Secretaría de Cultura de México','2018','','web_page','','es','B','access_pass','WEB-CE-B08','Arreola 1918–2001、Ciudad Guzmán、Confabulario、Bestiario、La feria','remote_only','','https://fonotecanacional.cultura.gob.mx/index.php/escucha/secciones-especiales/semblanzas/juan-jose-arreola'),
('SRC-0203','B08-SRC-0203','CVC. Juan José Arreola. Bibliografía','CVC. Juan José Arreola. Bibliografía','Centro Virtual Cervantes','','Instituto Cervantes','','','web_page','','es','B','access_pass','WEB-CE-B08','Confabulario、Bestiario、La feria 题名、形态与书目年份','remote_only','','https://cvc.cervantes.es/actcult/arreola/bibliografia/bibliografiabasica.htm'),
('SRC-0204','B08-SRC-0204','CVC. Juan José Arreola. Cronología','CVC. Juan José Arreola. Cronología','Centro Virtual Cervantes','','Instituto Cervantes','','','web_page','','es','B','access_pass','WEB-CE-B08','Arreola 生平阶段与 Confabulario、Bestiario 作品线索','remote_only','','https://cvc.cervantes.es/actcult/arreola/cronologia/');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0248','author','何塞·玛丽亚·阿格达斯','José María Arguedas','candidate','2','CAND-B08-ARGUEDAS-AUTHOR','B08 BNP and Casa de la Literatura sources; Chinese display candidate','NONE'),
('V1-ENT-0249','author','塞尔希奥·皮托尔','Sergio Pitol','candidate','2','CAND-B08-PITOL-AUTHOR','B08 Instituto Cervantes biography and bibliography; Chinese display candidate','NONE'),
('V1-ENT-0250','author','胡安·何塞·阿雷奥拉','Juan José Arreola','candidate','3','CAND-B08-ARREOLA-AUTHOR','B08 Fonoteca Nacional and CVC sources; Chinese display candidate','NONE'),
('V1-ENT-0251','work','《血的节日》','Yawar fiesta','candidate','1','CAND-B08-ARGUEDAS-W01','B08 Casa de la Literatura chronology; novel layer','NONE'),
('V1-ENT-0252','work','《深沉的河流》','Los ríos profundos','candidate','1','CAND-B08-ARGUEDAS-W02','B08 Casa de la Literatura bibliography and work page; novel layer','NONE'),
('V1-ENT-0253','work','《所有的血》','Todas las sangres','candidate','1','CAND-B08-ARGUEDAS-W03','B08 Casa de la Literatura chronology; novel layer','NONE'),
('V1-ENT-0254','work','《爱情游行》','El desfile del amor','candidate','1','CAND-B08-PITOL-W01','B08 Instituto Cervantes biography and bibliography; novel layer','NONE'),
('V1-ENT-0255','work','《驯服神圣苍鹭》','Domar a la divina garza','candidate','1','CAND-B08-PITOL-W02','B08 Instituto Cervantes biography and bibliography; novel layer','NONE'),
('V1-ENT-0256','work','《婚姻生活》','La vida conyugal','candidate','1','CAND-B08-PITOL-W03','B08 Instituto Cervantes biography and bibliography; novel layer','NONE'),
('V1-ENT-0257','collection','《孔法布拉里奥》','Confabulario','candidate','1','CAND-B08-ARREOLA-W01','B08 CVC bibliography; collection layer','NONE'),
('V1-ENT-0258','collection','《动物集》','Bestiario','candidate','1','CAND-B08-ARREOLA-W02','B08 CVC/Fonoteca sources; same title as Cortázar kept as author-specific entity','NONE'),
('V1-ENT-0259','work','《集市》','La feria','candidate','1','CAND-B08-ARREOLA-W03','B08 CVC bibliography and Fonoteca source; novel layer','NONE');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0248','CAND-B08-ARGUEDAS-AUTHOR','WEB-CE-B08','CAND-B08-ARGUEDAS-AUTHOR','V1-ENT-0248','create','B08 Reviewer pending; source-backed candidate'),
('V1-EMAP-0249','CAND-B08-PITOL-AUTHOR','WEB-CE-B08','CAND-B08-PITOL-AUTHOR','V1-ENT-0249','create','B08 Reviewer pending; source-backed candidate'),
('V1-EMAP-0250','CAND-B08-ARREOLA-AUTHOR','WEB-CE-B08','CAND-B08-ARREOLA-AUTHOR','V1-ENT-0250','create','B08 Reviewer pending; source-backed candidate'),
('V1-EMAP-0251','CAND-B08-ARGUEDAS-W01','WEB-CE-B08','CAND-B08-ARGUEDAS-W01','V1-ENT-0251','create','B08 Reviewer pending; source-backed candidate'),
('V1-EMAP-0252','CAND-B08-ARGUEDAS-W02','WEB-CE-B08','CAND-B08-ARGUEDAS-W02','V1-ENT-0252','create','B08 Reviewer pending; source-backed candidate'),
('V1-EMAP-0253','CAND-B08-ARGUEDAS-W03','WEB-CE-B08','CAND-B08-ARGUEDAS-W03','V1-ENT-0253','create','B08 Reviewer pending; source-backed candidate'),
('V1-EMAP-0254','CAND-B08-PITOL-W01','WEB-CE-B08','CAND-B08-PITOL-W01','V1-ENT-0254','create','B08 Reviewer pending; source-backed candidate'),
('V1-EMAP-0255','CAND-B08-PITOL-W02','WEB-CE-B08','CAND-B08-PITOL-W02','V1-ENT-0255','create','B08 Reviewer pending; source-backed candidate'),
('V1-EMAP-0256','CAND-B08-PITOL-W03','WEB-CE-B08','CAND-B08-PITOL-W03','V1-ENT-0256','create','B08 Reviewer pending; source-backed candidate'),
('V1-EMAP-0257','CAND-B08-ARREOLA-W01','WEB-CE-B08','CAND-B08-ARREOLA-W01','V1-ENT-0257','create','B08 Reviewer pending; source-backed candidate'),
('V1-EMAP-0258','CAND-B08-ARREOLA-W02','WEB-CE-B08','CAND-B08-ARREOLA-W02','V1-ENT-0258','create','B08 Reviewer pending; source-backed candidate'),
('V1-EMAP-0259','CAND-B08-ARREOLA-W03','WEB-CE-B08','CAND-B08-ARREOLA-W03','V1-ENT-0259','create','B08 Reviewer pending; source-backed candidate');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0136','','V1-ENT-0248','author','何塞·玛丽亚·阿格达斯','何塞·玛丽亚·阿格达斯','José María Arguedas','秘鲁','es','1911–1969','小说与人类学','WEB-CE-B08','meets','NONE','### 何塞·玛丽亚·阿格达斯｜José María Arguedas — 以 BNP 与 Casa de la Literatura 资料建立秘鲁安第斯小说入口。'),
('V1-CARD-0137','','V1-ENT-0249','author','塞尔希奥·皮托尔','塞尔希奥·皮托尔','Sergio Pitol','墨西哥','es','1933–2018','小说','WEB-CE-B08','meets','NONE','### 塞尔希奥·皮托尔｜Sergio Pitol — 以 Instituto Cervantes 传记与书目建立墨西哥小说入口。'),
('V1-CARD-0138','','V1-ENT-0250','author','胡安·何塞·阿雷奥拉','胡安·何塞·阿雷奥拉','Juan José Arreola','墨西哥','es','1918–2001','短篇与小说','WEB-CE-B08','meets','NONE','### 胡安·何塞·阿雷奥拉｜Juan José Arreola — 以 Fonoteca Nacional 与 CVC 资料区分作品集和小说。'),
('V1-CARD-0139','','V1-ENT-0251','work','《血的节日》','何塞·玛丽亚·阿格达斯','Yawar fiesta','秘鲁','es','1941','小说','WEB-CE-B08','meets','NONE','### 《血的节日》｜Yawar fiesta — Casa de la Literatura 记录 1941 年书目。'),
('V1-CARD-0140','','V1-ENT-0252','work','《深沉的河流》','何塞·玛丽亚·阿格达斯','Los ríos profundos','秘鲁','es','1958','小说','WEB-CE-B08','meets','NONE','### 《深沉的河流》｜Los ríos profundos — 机构书目与作品导读共同支持 1958 年和小说形态。'),
('V1-CARD-0141','','V1-ENT-0253','work','《所有的血》','何塞·玛丽亚·阿格达斯','Todas las sangres','秘鲁','es','1964','小说','WEB-CE-B08','meets','NONE','### 《所有的血》｜Todas las sangres — Casa de la Literatura 记录 1964 年书目。'),
('V1-CARD-0142','','V1-ENT-0254','work','《爱情游行》','塞尔希奥·皮托尔','El desfile del amor','墨西哥','es','1984','小说','WEB-CE-B08','meets','NONE','### 《爱情游行》｜El desfile del amor — Instituto Cervantes 传记与书目记录 1984 年小说。'),
('V1-CARD-0143','','V1-ENT-0255','work','《驯服神圣苍鹭》','塞尔希奥·皮托尔','Domar a la divina garza','墨西哥','es','1988','小说','WEB-CE-B08','meets','NONE','### 《驯服神圣苍鹭》｜Domar a la divina garza — 机构传记与书目记录 1988 年小说。'),
('V1-CARD-0144','','V1-ENT-0256','work','《婚姻生活》','塞尔希奥·皮托尔','La vida conyugal','墨西哥','es','1991','小说','WEB-CE-B08','meets','NONE','### 《婚姻生活》｜La vida conyugal — Instituto Cervantes 记录 1991 年小说。'),
('V1-CARD-0145','','V1-ENT-0257','collection','《孔法布拉里奥》','胡安·何塞·阿雷奥拉','Confabulario','墨西哥','es','1952','短篇作品集','WEB-CE-B08','meets','NONE','### 《孔法布拉里奥》｜Confabulario — CVC 与 Fonoteca 资料支持作品集层级和书目。'),
('V1-CARD-0146','','V1-ENT-0258','collection','《动物集》','胡安·何塞·阿雷奥拉','Bestiario','墨西哥','es','1972','作品集','WEB-CE-B08','meets','NONE','### 《动物集》｜Bestiario — Arreola 的同名作品保留作者锚点，与 Cortázar 实体分开。'),
('V1-CARD-0147','','V1-ENT-0259','work','《集市》','胡安·何塞·阿雷奥拉','La feria','墨西哥','es','1963','小说','WEB-CE-B08','meets','NONE','### 《集市》｜La feria — CVC 书目和 Fonoteca 资料支持 1963 年小说。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-0605','WEB-CE-B08','V1-CARD-0136','V1-ENT-0248','birth_year','1911','fact','SRC-0197','high','candidate_for_staging_review','BNP directly records Arguedas birth year.'),
('V1-FCT-0606','WEB-CE-B08','V1-CARD-0136','V1-ENT-0248','death_year','1969','fact','SRC-0197','high','candidate_for_staging_review','BNP directly records death year.'),
('V1-FCT-0607','WEB-CE-B08','V1-CARD-0136','V1-ENT-0248','country_or_region','秘鲁','fact','SRC-0199','high','candidate_for_staging_review','Casa de la Literatura identifies Arguedas as Peruvian.'),
('V1-FCT-0608','WEB-CE-B08','V1-CARD-0136','V1-ENT-0248','birth_place','安达韦拉斯（Andahuaylas）','fact','SRC-0197','high','candidate_for_staging_review','BNP names Andahuaylas as birthplace.'),
('V1-FCT-0609','WEB-CE-B08','V1-CARD-0136','V1-ENT-0248','career_note','作家、人类学家、诗人、教师','fact','SRC-0199','high','candidate_for_staging_review','Casa de la Literatura directly lists these roles.'),
('V1-FCT-0610','WEB-CE-B08','V1-CARD-0137','V1-ENT-0249','birth_year','1933','fact','SRC-0200','high','candidate_for_staging_review','Instituto Cervantes biography records 1933.'),
('V1-FCT-0611','WEB-CE-B08','V1-CARD-0137','V1-ENT-0249','death_year','2018','fact','SRC-0200','high','candidate_for_staging_review','Instituto Cervantes biography records 2018.'),
('V1-FCT-0612','WEB-CE-B08','V1-CARD-0137','V1-ENT-0249','country_or_region','墨西哥','fact','SRC-0200','high','candidate_for_staging_review','Biography identifies Pitol as Mexican.'),
('V1-FCT-0613','WEB-CE-B08','V1-CARD-0137','V1-ENT-0249','birth_place','普埃布拉（Puebla）','fact','SRC-0200','high','candidate_for_staging_review','Biography names Puebla.'),
('V1-FCT-0614','WEB-CE-B08','V1-CARD-0137','V1-ENT-0249','career_note','小说家、散文家、翻译家','fact','SRC-0200','high','candidate_for_staging_review','Instituto Cervantes directly calls Pitol narrator, essayist and translator.'),
('V1-FCT-0615','WEB-CE-B08','V1-CARD-0138','V1-ENT-0250','birth_year','1918','fact','SRC-0202','high','candidate_for_staging_review','Fonoteca Nacional records 1918.'),
('V1-FCT-0616','WEB-CE-B08','V1-CARD-0138','V1-ENT-0250','death_year','2001','fact','SRC-0202','high','candidate_for_staging_review','Fonoteca Nacional records 2001.'),
('V1-FCT-0617','WEB-CE-B08','V1-CARD-0138','V1-ENT-0250','country_or_region','墨西哥','fact','SRC-0202','high','candidate_for_staging_review','Fonoteca Nacional identifies Arreola as Mexican.'),
('V1-FCT-0618','WEB-CE-B08','V1-CARD-0138','V1-ENT-0250','birth_place','萨波特兰大（Zapotlán el Grande/Ciudad Guzmán）','fact','SRC-0202','high','candidate_for_staging_review','Fonoteca Nacional names Ciudad Guzmán, Jalisco.'),
('V1-FCT-0619','WEB-CE-B08','V1-CARD-0138','V1-ENT-0250','career_note','作家、叙事家、文化工作者','fact','SRC-0202','medium','candidate_for_staging_review','Fonoteca Nacional describes writing and public cultural work.'),
('V1-FCT-0620','WEB-CE-B08','V1-CARD-0139','V1-ENT-0251','entity_layer','work','metadata','SRC-0198','high','candidate_for_staging_review','Casa de la Literatura presents Yawar fiesta as a narrative novel entry.'),
('V1-FCT-0621','WEB-CE-B08','V1-CARD-0139','V1-ENT-0251','first_publication_year','1941','bibliographic','SRC-0198','high','candidate_for_staging_review','Institutional chronology records 1941.'),
('V1-FCT-0622','WEB-CE-B08','V1-CARD-0139','V1-ENT-0251','bibliographic_note','Casa de la Literatura 直接列出 Yawar fiesta 题名与 1941 年书目；本批不扩展主题判断。','bibliographic','SRC-0198','high','candidate_for_staging_review','Source supports title, form and year only.'),
('V1-FCT-0623','WEB-CE-B08','V1-CARD-0140','V1-ENT-0252','entity_layer','work','metadata','SRC-0199','high','candidate_for_staging_review','Casa de la Literatura describes Los ríos profundos as a novel.'),
('V1-FCT-0624','WEB-CE-B08','V1-CARD-0140','V1-ENT-0252','first_publication_year','1958','bibliographic','SRC-0198','high','candidate_for_staging_review','Institutional chronology records 1958.'),
('V1-FCT-0625','WEB-CE-B08','V1-CARD-0140','V1-ENT-0252','bibliographic_note','SRC-0198 与 SRC-0199 直接支持 Los ríos profundos 的题名、小说形态和 1958 年；故事导读不升级为 Research fact。','bibliographic','SRC-0199','high','candidate_for_staging_review','Sources support title, form, year and low-spoiler premise.'),
('V1-FCT-0626','WEB-CE-B08','V1-CARD-0141','V1-ENT-0253','entity_layer','work','metadata','SRC-0198','high','candidate_for_staging_review','Casa de la Literatura places Todas las sangres in the narrative chronology.'),
('V1-FCT-0627','WEB-CE-B08','V1-CARD-0141','V1-ENT-0253','first_publication_year','1964','bibliographic','SRC-0198','high','candidate_for_staging_review','Institutional chronology records 1964.'),
('V1-FCT-0628','WEB-CE-B08','V1-CARD-0141','V1-ENT-0253','bibliographic_note','Casa de la Literatura 直接列出 Todas las sangres 题名与 1964 年书目。','bibliographic','SRC-0198','high','candidate_for_staging_review','Source supports title, form and year only.'),
('V1-FCT-0629','WEB-CE-B08','V1-CARD-0142','V1-ENT-0254','entity_layer','work','metadata','SRC-0200','high','candidate_for_staging_review','Instituto Cervantes identifies El desfile del amor among Pitol novels.'),
('V1-FCT-0630','WEB-CE-B08','V1-CARD-0142','V1-ENT-0254','first_publication_year','1984','bibliographic','SRC-0200','high','candidate_for_staging_review','Biography gives 1984.'),
('V1-FCT-0631','WEB-CE-B08','V1-CARD-0142','V1-ENT-0254','bibliographic_note','SRC-0200 与 SRC-0201 直接列出 El desfile del amor 题名、小说形态和 1984 年。','bibliographic','SRC-0201','high','candidate_for_staging_review','Sources support title, form and year only.'),
('V1-FCT-0632','WEB-CE-B08','V1-CARD-0143','V1-ENT-0255','entity_layer','work','metadata','SRC-0200','high','candidate_for_staging_review','Instituto Cervantes identifies Domar a la divina garza among Pitol novels.'),
('V1-FCT-0633','WEB-CE-B08','V1-CARD-0143','V1-ENT-0255','first_publication_year','1988','bibliographic','SRC-0200','high','candidate_for_staging_review','Biography gives 1988.'),
('V1-FCT-0634','WEB-CE-B08','V1-CARD-0143','V1-ENT-0255','bibliographic_note','SRC-0200 与 SRC-0201 直接列出 Domar a la divina garza 题名、小说形态和 1988 年。','bibliographic','SRC-0201','high','candidate_for_staging_review','Sources support title, form and year only.'),
('V1-FCT-0635','WEB-CE-B08','V1-CARD-0144','V1-ENT-0256','entity_layer','work','metadata','SRC-0200','high','candidate_for_staging_review','Instituto Cervantes identifies La vida conyugal among Pitol novels.'),
('V1-FCT-0636','WEB-CE-B08','V1-CARD-0144','V1-ENT-0256','first_publication_year','1991','bibliographic','SRC-0200','high','candidate_for_staging_review','Biography gives 1991.'),
('V1-FCT-0637','WEB-CE-B08','V1-CARD-0144','V1-ENT-0256','bibliographic_note','SRC-0200 与 SRC-0201 直接列出 La vida conyugal 题名、小说形态和 1991 年。','bibliographic','SRC-0201','high','candidate_for_staging_review','Sources support title, form and year only.'),
('V1-FCT-0638','WEB-CE-B08','V1-CARD-0145','V1-ENT-0257','entity_layer','collection','metadata','SRC-0203','high','candidate_for_staging_review','CVC bibliography records Confabulario as a collection-level book.'),
('V1-FCT-0639','WEB-CE-B08','V1-CARD-0145','V1-ENT-0257','first_publication_year','1952','bibliographic','SRC-0202','high','candidate_for_staging_review','Fonoteca/CVC materials identify the 1952 book.'),
('V1-FCT-0640','WEB-CE-B08','V1-CARD-0145','V1-ENT-0257','bibliographic_note','SRC-0202 与 SRC-0203 直接列出 Confabulario 题名与作品集层级。','bibliographic','SRC-0203','high','candidate_for_staging_review','Sources support title and bibliographic layer.'),
('V1-FCT-0641','WEB-CE-B08','V1-CARD-0146','V1-ENT-0258','entity_layer','collection','metadata','SRC-0203','high','candidate_for_staging_review','CVC bibliography records Arreola Bestiario as a collection.'),
('V1-FCT-0642','WEB-CE-B08','V1-CARD-0146','V1-ENT-0258','first_publication_year','1972','bibliographic','SRC-0202','high','candidate_for_staging_review','Fonoteca source directly dates Arreola Bestiario to 1972.'),
('V1-FCT-0643','WEB-CE-B08','V1-CARD-0146','V1-ENT-0258','bibliographic_note','SRC-0202 与 SRC-0203 直接支持 Arreola 的 Bestiario；同名 Cortázar 作品保持独立作者实体。','bibliographic','SRC-0203','high','candidate_for_staging_review','Author-specific identity is retained.'),
('V1-FCT-0644','WEB-CE-B08','V1-CARD-0147','V1-ENT-0259','entity_layer','work','metadata','SRC-0202','high','candidate_for_staging_review','Fonoteca describes La feria as a novel.'),
('V1-FCT-0645','WEB-CE-B08','V1-CARD-0147','V1-ENT-0259','first_publication_year','1963','bibliographic','SRC-0203','high','candidate_for_staging_review','CVC bibliography records La feria in 1963.'),
('V1-FCT-0646','WEB-CE-B08','V1-CARD-0147','V1-ENT-0259','bibliographic_note','SRC-0202 与 SRC-0203 直接列出 La feria 题名、小说形态与 1963 年。','bibliographic','SRC-0203','high','candidate_for_staging_review','Sources support title, form and year only.');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-0605','SRC-0197','WEB-CE-B08 source SRC-0197'),('V1-FCT-0606','SRC-0197','WEB-CE-B08 source SRC-0197'),('V1-FCT-0607','SRC-0199','WEB-CE-B08 source SRC-0199'),('V1-FCT-0608','SRC-0197','WEB-CE-B08 source SRC-0197'),('V1-FCT-0609','SRC-0199','WEB-CE-B08 source SRC-0199'),
('V1-FCT-0610','SRC-0200','WEB-CE-B08 source SRC-0200'),('V1-FCT-0611','SRC-0200','WEB-CE-B08 source SRC-0200'),('V1-FCT-0612','SRC-0200','WEB-CE-B08 source SRC-0200'),('V1-FCT-0613','SRC-0200','WEB-CE-B08 source SRC-0200'),('V1-FCT-0614','SRC-0200','WEB-CE-B08 source SRC-0200'),
('V1-FCT-0615','SRC-0202','WEB-CE-B08 source SRC-0202'),('V1-FCT-0616','SRC-0202','WEB-CE-B08 source SRC-0202'),('V1-FCT-0617','SRC-0202','WEB-CE-B08 source SRC-0202'),('V1-FCT-0618','SRC-0202','WEB-CE-B08 source SRC-0202'),('V1-FCT-0619','SRC-0202','WEB-CE-B08 source SRC-0202'),
('V1-FCT-0620','SRC-0198','WEB-CE-B08 source SRC-0198'),('V1-FCT-0621','SRC-0198','WEB-CE-B08 source SRC-0198'),('V1-FCT-0622','SRC-0198','WEB-CE-B08 source SRC-0198'),
('V1-FCT-0623','SRC-0199','WEB-CE-B08 source SRC-0199'),('V1-FCT-0624','SRC-0198','WEB-CE-B08 source SRC-0198'),('V1-FCT-0625','SRC-0199','WEB-CE-B08 source SRC-0199'),
('V1-FCT-0626','SRC-0198','WEB-CE-B08 source SRC-0198'),('V1-FCT-0627','SRC-0198','WEB-CE-B08 source SRC-0198'),('V1-FCT-0628','SRC-0198','WEB-CE-B08 source SRC-0198'),
('V1-FCT-0629','SRC-0200','WEB-CE-B08 source SRC-0200'),('V1-FCT-0630','SRC-0200','WEB-CE-B08 source SRC-0200'),('V1-FCT-0631','SRC-0201','WEB-CE-B08 source SRC-0201'),
('V1-FCT-0632','SRC-0200','WEB-CE-B08 source SRC-0200'),('V1-FCT-0633','SRC-0200','WEB-CE-B08 source SRC-0200'),('V1-FCT-0634','SRC-0201','WEB-CE-B08 source SRC-0201'),
('V1-FCT-0635','SRC-0200','WEB-CE-B08 source SRC-0200'),('V1-FCT-0636','SRC-0200','WEB-CE-B08 source SRC-0200'),('V1-FCT-0637','SRC-0201','WEB-CE-B08 source SRC-0201'),
('V1-FCT-0638','SRC-0203','WEB-CE-B08 source SRC-0203'),('V1-FCT-0639','SRC-0202','WEB-CE-B08 source SRC-0202'),('V1-FCT-0640','SRC-0203','WEB-CE-B08 source SRC-0203'),
('V1-FCT-0641','SRC-0203','WEB-CE-B08 source SRC-0203'),('V1-FCT-0642','SRC-0202','WEB-CE-B08 source SRC-0202'),('V1-FCT-0643','SRC-0203','WEB-CE-B08 source SRC-0203'),
('V1-FCT-0644','SRC-0202','WEB-CE-B08 source SRC-0202'),('V1-FCT-0645','SRC-0203','WEB-CE-B08 source SRC-0203'),('V1-FCT-0646','SRC-0203','WEB-CE-B08 source SRC-0203');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0136','V1-FCT-0605','candidate_for_staging_review'),('V1-CARD-0136','V1-FCT-0606','candidate_for_staging_review'),('V1-CARD-0136','V1-FCT-0607','candidate_for_staging_review'),('V1-CARD-0136','V1-FCT-0608','candidate_for_staging_review'),('V1-CARD-0136','V1-FCT-0609','candidate_for_staging_review'),
('V1-CARD-0137','V1-FCT-0610','candidate_for_staging_review'),('V1-CARD-0137','V1-FCT-0611','candidate_for_staging_review'),('V1-CARD-0137','V1-FCT-0612','candidate_for_staging_review'),('V1-CARD-0137','V1-FCT-0613','candidate_for_staging_review'),('V1-CARD-0137','V1-FCT-0614','candidate_for_staging_review'),
('V1-CARD-0138','V1-FCT-0615','candidate_for_staging_review'),('V1-CARD-0138','V1-FCT-0616','candidate_for_staging_review'),('V1-CARD-0138','V1-FCT-0617','candidate_for_staging_review'),('V1-CARD-0138','V1-FCT-0618','candidate_for_staging_review'),('V1-CARD-0138','V1-FCT-0619','candidate_for_staging_review'),
('V1-CARD-0139','V1-FCT-0620','candidate_for_staging_review'),('V1-CARD-0139','V1-FCT-0621','candidate_for_staging_review'),('V1-CARD-0139','V1-FCT-0622','candidate_for_staging_review'),
('V1-CARD-0140','V1-FCT-0623','candidate_for_staging_review'),('V1-CARD-0140','V1-FCT-0624','candidate_for_staging_review'),('V1-CARD-0140','V1-FCT-0625','candidate_for_staging_review'),
('V1-CARD-0141','V1-FCT-0626','candidate_for_staging_review'),('V1-CARD-0141','V1-FCT-0627','candidate_for_staging_review'),('V1-CARD-0141','V1-FCT-0628','candidate_for_staging_review'),
('V1-CARD-0142','V1-FCT-0629','candidate_for_staging_review'),('V1-CARD-0142','V1-FCT-0630','candidate_for_staging_review'),('V1-CARD-0142','V1-FCT-0631','candidate_for_staging_review'),
('V1-CARD-0143','V1-FCT-0632','candidate_for_staging_review'),('V1-CARD-0143','V1-FCT-0633','candidate_for_staging_review'),('V1-CARD-0143','V1-FCT-0634','candidate_for_staging_review'),
('V1-CARD-0144','V1-FCT-0635','candidate_for_staging_review'),('V1-CARD-0144','V1-FCT-0636','candidate_for_staging_review'),('V1-CARD-0144','V1-FCT-0637','candidate_for_staging_review'),
('V1-CARD-0145','V1-FCT-0638','candidate_for_staging_review'),('V1-CARD-0145','V1-FCT-0639','candidate_for_staging_review'),('V1-CARD-0145','V1-FCT-0640','candidate_for_staging_review'),
('V1-CARD-0146','V1-FCT-0641','candidate_for_staging_review'),('V1-CARD-0146','V1-FCT-0642','candidate_for_staging_review'),('V1-CARD-0146','V1-FCT-0643','candidate_for_staging_review'),
('V1-CARD-0147','V1-FCT-0644','candidate_for_staging_review'),('V1-CARD-0147','V1-FCT-0645','candidate_for_staging_review'),('V1-CARD-0147','V1-FCT-0646','candidate_for_staging_review');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0261','','V1-CARD-0136','SRC-0197','B','both','yes','yes','SRC-0197','used','NONE'),('V1-CS-0262','','V1-CARD-0136','SRC-0199','B','both','yes','yes','SRC-0199','used','NONE'),
('V1-CS-0263','','V1-CARD-0137','SRC-0200','B','both','yes','yes','SRC-0200','used','NONE'),('V1-CS-0264','','V1-CARD-0137','SRC-0201','B','both','yes','yes','SRC-0201','used','NONE'),
('V1-CS-0265','','V1-CARD-0138','SRC-0202','B','both','yes','yes','SRC-0202','used','NONE'),('V1-CS-0266','','V1-CARD-0138','SRC-0203','B','both','yes','yes','SRC-0203','used','NONE'),('V1-CS-0267','','V1-CARD-0138','SRC-0204','B','both','yes','yes','SRC-0204','used','NONE'),
('V1-CS-0268','','V1-CARD-0139','SRC-0198','B','both','yes','yes','SRC-0198','used','NONE'),
('V1-CS-0269','','V1-CARD-0140','SRC-0198','B','both','yes','yes','SRC-0198','used','NONE'),('V1-CS-0270','','V1-CARD-0140','SRC-0199','B','both','yes','yes','SRC-0199','used','NONE'),
('V1-CS-0271','','V1-CARD-0141','SRC-0198','B','both','yes','yes','SRC-0198','used','NONE'),
('V1-CS-0272','','V1-CARD-0142','SRC-0200','B','both','yes','yes','SRC-0200','used','NONE'),('V1-CS-0273','','V1-CARD-0142','SRC-0201','B','both','yes','yes','SRC-0201','used','NONE'),
('V1-CS-0274','','V1-CARD-0143','SRC-0200','B','both','yes','yes','SRC-0200','used','NONE'),('V1-CS-0275','','V1-CARD-0143','SRC-0201','B','both','yes','yes','SRC-0201','used','NONE'),
('V1-CS-0276','','V1-CARD-0144','SRC-0200','B','both','yes','yes','SRC-0200','used','NONE'),('V1-CS-0277','','V1-CARD-0144','SRC-0201','B','both','yes','yes','SRC-0201','used','NONE'),
('V1-CS-0278','','V1-CARD-0145','SRC-0202','B','both','yes','yes','SRC-0202','used','NONE'),('V1-CS-0279','','V1-CARD-0145','SRC-0203','B','both','yes','yes','SRC-0203','used','NONE'),
('V1-CS-0280','','V1-CARD-0146','SRC-0202','B','both','yes','yes','SRC-0202','used','NONE'),('V1-CS-0281','','V1-CARD-0146','SRC-0203','B','both','yes','yes','SRC-0203','used','NONE'),
('V1-CS-0282','','V1-CARD-0147','SRC-0202','B','both','yes','yes','SRC-0202','used','NONE'),('V1-CS-0283','','V1-CARD-0147','SRC-0203','B','both','yes','yes','SRC-0203','used','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0176','WEB-CE-B08','CAND-B08-0176','V1-ENT-0248','CREATED','V1-ENT-0251','何塞·玛丽亚·阿格达斯 创作 《血的节日》（Yawar fiesta）','high','accepted','WEB-CE-B08','1','NONE'),
('V1-REL-0177','WEB-CE-B08','CAND-B08-0177','V1-ENT-0248','CREATED','V1-ENT-0252','何塞·玛丽亚·阿格达斯 创作 《深沉的河流》（Los ríos profundos）','high','accepted','WEB-CE-B08','1','NONE'),
('V1-REL-0178','WEB-CE-B08','CAND-B08-0178','V1-ENT-0248','CREATED','V1-ENT-0253','何塞·玛丽亚·阿格达斯 创作 《所有的血》（Todas las sangres）','high','accepted','WEB-CE-B08','1','NONE'),
('V1-REL-0179','WEB-CE-B08','CAND-B08-0179','V1-ENT-0249','CREATED','V1-ENT-0254','塞尔希奥·皮托尔 创作 《爱情游行》（El desfile del amor）','high','accepted','WEB-CE-B08','1','NONE'),
('V1-REL-0180','WEB-CE-B08','CAND-B08-0180','V1-ENT-0249','CREATED','V1-ENT-0255','塞尔希奥·皮托尔 创作 《驯服神圣苍鹭》（Domar a la divina garza）','high','accepted','WEB-CE-B08','1','NONE'),
('V1-REL-0181','WEB-CE-B08','CAND-B08-0181','V1-ENT-0249','CREATED','V1-ENT-0256','塞尔希奥·皮托尔 创作 《婚姻生活》（La vida conyugal）','high','accepted','WEB-CE-B08','1','NONE'),
('V1-REL-0182','WEB-CE-B08','CAND-B08-0182','V1-ENT-0250','CREATED','V1-ENT-0257','胡安·何塞·阿雷奥拉 创作 《孔法布拉里奥》（Confabulario）','high','accepted','WEB-CE-B08','1','NONE'),
('V1-REL-0183','WEB-CE-B08','CAND-B08-0183','V1-ENT-0250','CREATED','V1-ENT-0258','胡安·何塞·阿雷奥拉 创作 《动物集》（Bestiario）','high','accepted','WEB-CE-B08','1','NONE'),
('V1-REL-0184','WEB-CE-B08','CAND-B08-0184','V1-ENT-0250','CREATED','V1-ENT-0259','胡安·何塞·阿雷奥拉 创作 《集市》（La feria）','high','accepted','WEB-CE-B08','1','NONE'),
('V1-REL-0185','WEB-CE-B08','CAND-B08-0185','V1-ENT-0248','ASSOCIATED_WITH_PLACE','V1-ENT-0124','何塞·玛丽亚·阿格达斯与秘鲁关联','high','accepted','WEB-CE-B08','1','NONE'),
('V1-REL-0186','WEB-CE-B08','CAND-B08-0186','V1-ENT-0249','ASSOCIATED_WITH_PLACE','V1-ENT-0051','塞尔希奥·皮托尔与墨西哥关联','high','accepted','WEB-CE-B08','1','NONE'),
('V1-REL-0187','WEB-CE-B08','CAND-B08-0187','V1-ENT-0250','ASSOCIATED_WITH_PLACE','V1-ENT-0051','胡安·何塞·阿雷奥拉与墨西哥关联','high','accepted','WEB-CE-B08','1','NONE');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0201','V1-REL-0176','CAND-B08-0176','SRC-0198','WEB-CE-B08 source SRC-0198','','Casa de la Literatura chronology lists Yawar fiesta and author.','high','eligible_evidence','WEB-CE-B08'),
('V1-EV-0202','V1-REL-0177','CAND-B08-0177','SRC-0199','WEB-CE-B08 source SRC-0199','','Casa de la Literatura work page identifies Los ríos profundos and Arguedas.','high','eligible_evidence','WEB-CE-B08'),
('V1-EV-0203','V1-REL-0178','CAND-B08-0178','SRC-0198','WEB-CE-B08 source SRC-0198','','Casa de la Literatura chronology lists Todas las sangres.','high','eligible_evidence','WEB-CE-B08'),
('V1-EV-0204','V1-REL-0179','CAND-B08-0179','SRC-0200','WEB-CE-B08 source SRC-0200','','Instituto Cervantes biography lists El desfile del amor among Pitol novels.','high','eligible_evidence','WEB-CE-B08'),
('V1-EV-0205','V1-REL-0180','CAND-B08-0180','SRC-0200','WEB-CE-B08 source SRC-0200','','Instituto Cervantes biography lists Domar a la divina garza among Pitol novels.','high','eligible_evidence','WEB-CE-B08'),
('V1-EV-0206','V1-REL-0181','CAND-B08-0181','SRC-0200','WEB-CE-B08 source SRC-0200','','Instituto Cervantes biography lists La vida conyugal among Pitol novels.','high','eligible_evidence','WEB-CE-B08'),
('V1-EV-0207','V1-REL-0182','CAND-B08-0182','SRC-0203','WEB-CE-B08 source SRC-0203','','CVC bibliography lists Confabulario and Arreola.','high','eligible_evidence','WEB-CE-B08'),
('V1-EV-0208','V1-REL-0183','CAND-B08-0183','SRC-0202','WEB-CE-B08 source SRC-0202','','Fonoteca Nacional directly lists Arreola Bestiario.','high','eligible_evidence','WEB-CE-B08'),
('V1-EV-0209','V1-REL-0184','CAND-B08-0184','SRC-0202','WEB-CE-B08 source SRC-0202','','Fonoteca Nacional describes La feria as Arreola novel.','high','eligible_evidence','WEB-CE-B08'),
('V1-EV-0210','V1-REL-0185','CAND-B08-0185','SRC-0197','WEB-CE-B08 source SRC-0197','','BNP author article supports Arguedas and Peru association.','high','eligible_evidence','WEB-CE-B08'),
('V1-EV-0211','V1-REL-0186','CAND-B08-0186','SRC-0200','WEB-CE-B08 source SRC-0200','','Instituto Cervantes biography identifies Pitol as Mexican.','high','eligible_evidence','WEB-CE-B08'),
('V1-EV-0212','V1-REL-0187','CAND-B08-0187','SRC-0202','WEB-CE-B08 source SRC-0202','','Fonoteca Nacional identifies Arreola as Mexican.','high','eligible_evidence','WEB-CE-B08');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0176','SRC-0198'),('V1-REL-0177','SRC-0199'),('V1-REL-0178','SRC-0198'),('V1-REL-0179','SRC-0200'),('V1-REL-0180','SRC-0200'),('V1-REL-0181','SRC-0200'),('V1-REL-0182','SRC-0203'),('V1-REL-0183','SRC-0202'),('V1-REL-0184','SRC-0202'),('V1-REL-0185','SRC-0197'),('V1-REL-0186','SRC-0200'),('V1-REL-0187','SRC-0202');

UPDATE fact_sources SET source_title=(SELECT title FROM sources WHERE sources.source_id=fact_sources.source_id) WHERE fact_id BETWEEN 'V1-FCT-0605' AND 'V1-FCT-0646';
UPDATE relationship_evidence SET source_title=(SELECT title FROM sources WHERE sources.source_id=relationship_evidence.source_id) WHERE evidence_id BETWEEN 'V1-EV-0201' AND 'V1-EV-0212';
INSERT OR REPLACE INTO metadata (key,value) VALUES ('last_change_set','WEB-CE-B08'),('research_version','1.1.0');
UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';
