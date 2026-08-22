-- WEB-CE-B10: Luna Max serial batch; Galeano, Piglia and Aira.

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0214','B10-SRC-0214','Nace Eduardo Galeano — Uruguay Educa','Nace Eduardo Galeano','Uruguay Educa','','Administración Nacional de Educación Pública','','','web_page','','es','B','access_pass','WEB-CE-B10','Galeano biography and chronology: 1971, 1982, 1989','remote_only','','https://uruguayeduca.anep.edu.uy/efemerides/nace-eduardo-galeano'),
('SRC-0215','B10-SRC-0215','Eduardo Galeano: uruguayo de nacimiento, latinoamericano por opción','Eduardo Galeano: uruguayo de nacimiento, latinoamericano por opción','Ministerio de Cultura de la Nación Argentina','','Ministerio de Cultura de la Nación Argentina','','','web_page','','es','B','access_pass','WEB-CE-B10','Galeano birth/death, Uruguay identity and highlighted works','remote_only','','https://www.cultura.gob.ar/eduardo-galeano-uruguayo-de-nacimiento-latinoamericano-por-opcion-11057/'),
('SRC-0216','B10-SRC-0216','Catálogo en línea — Biblioteca del Poder Legislativo del Uruguay','Catálogo en línea','Biblioteca del Poder Legislativo del Uruguay','','Biblioteca del Poder Legislativo del Uruguay','','','web_catalog','','es','B','access_pass','WEB-CE-B10','El libro de los abrazos and Memoria del fuego catalog records','remote_only','','https://pmb.parlamento.gub.uy/pmb/opac_css/index.php?id=315&l_typdoc=&lvl=author_see&nb_per_page_custom=25&nbr_lignes=100&page=3'),
('SRC-0217','B10-SRC-0217','Ricardo Piglia — obra y biografía','Ricardo Piglia','Ricardo Piglia','','Piglia digital archive','','','web_page','','es','B','access_pass','WEB-CE-B10','Piglia biography and works: Respiración artificial, Plata quemada, Blanco nocturno','remote_only','','https://piglia.pubpub.org/'),
('SRC-0218','B10-SRC-0218','Now open for research: the papers of Ricardo Piglia','Now open for research: the papers of Ricardo Piglia','Princeton University Library','','Princeton University Library','2018','','web_page','','en','B','access_pass','WEB-CE-B10','Piglia Argentine identity and celebrated works','remote_only','','https://library.princeton.edu/about/library-news/2018/now-open-research-papers-ricardo-piglia-distinguished-latin-american'),
('SRC-0219','B10-SRC-0219','La Plata: Una geografía literaria','La Plata: Una geografía literaria','Universidad Nacional de La Plata','','Universidad Nacional de La Plata','','','pdf','','es','A','access_pass','WEB-CE-B10','Piglia biography and novel bibliography with years','remote_only','','https://www.memoria.fahce.unlp.edu.ar/libros/pm.895/pm.895.pdf'),
('SRC-0220','B10-SRC-0220','23 de febrero de 1949: nace César Aira — Biblioteca Nacional','23 de febrero de 1949: nace César Aira','Biblioteca Nacional Mariano Moreno','','Biblioteca Nacional Mariano Moreno','2026','','web_page','','es','B','access_pass','WEB-CE-B10','Aira birth, Coronel Pringles and poetics','remote_only','','https://www.bn.gov.ar/noticias/23-de-febrero-de-1949-nace-cesar-aira'),
('SRC-0221','B10-SRC-0221','César Aira — Fundación Konex','César Aira','Fundación Konex','','Fundación Konex','','','web_page','','es','B','access_pass','WEB-CE-B10','Aira identity and works catalogue','remote_only','','https://www.fundacionkonex.org/b2344-cesar-aira'),
('SRC-0222','B10-SRC-0222','Orientalismo, globalización e imaginarios transpacíficos en la novela latinoamericana actual','Orientalismo, globalización e imaginarios transpacíficos en la novela latinoamericana actual','Héctor Hoyos','','Pontificia Universidad Javeriana','2013','','pdf','','es','A','access_pass','WEB-CE-B10','Una novela china title and 1987 publication year','remote_only','','https://dialnet.unirioja.es/descarga/articulo/5228514.pdf'),
('SRC-0223','B10-SRC-0223','La trayectoria temprana de César Aira en textos de publicaciones periódicas','La trayectoria temprana de César Aira en textos de publicaciones periódicas','María Belén Riveiro','','Universidad Nacional de La Plata','2018','','pdf','','es','A','access_pass','WEB-CE-B10','Ema la cautiva first publication in 1981','remote_only','','https://www.memoria.fahce.unlp.edu.ar/trab_eventos/ev.11711/ev.11711.pdf'),
('SRC-0224','B10-SRC-0224','La figura del gran autor o Carlos Fuentes devenido monstruosidad genética en El congreso de literatura de César Aira','La figura del gran autor','Enrique Schmukler','','Universidad Técnica de Manabí','2017','','pdf','','es','A','access_pass','WEB-CE-B10','El congreso de literatura 1997, first edition context and narrative setting','remote_only','','https://dialnet.unirioja.es/descarga/articulo/7047139.pdf');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0272','author','爱德华多·加莱亚诺','Eduardo Galeano','candidate','2','CAND-B10-GALEANO-AUTHOR','B10 Uruguay Educa and Argentina Culture sources; Chinese display candidate','NONE'),
('V1-ENT-0273','author','里卡多·皮格利亚','Ricardo Piglia','candidate','3','CAND-B10-PIGLIA-AUTHOR','B10 Piglia archive, Princeton and UNLP sources; Chinese display candidate','NONE'),
('V1-ENT-0274','author','塞萨尔·艾拉','César Aira','candidate','2','CAND-B10-AIRA-AUTHOR','B10 Biblioteca Nacional and Konex sources; Chinese display candidate','NONE'),
('V1-ENT-0275','work','《拉丁美洲被切开的血管》','Las venas abiertas de América Latina','candidate','1','CAND-B10-GALEANO-W01','B10 Uruguay Educa and Argentina Culture sources; work layer','NONE'),
('V1-ENT-0276','collection','《火的记忆Ⅰ：创世纪》','Memoria del fuego I. Los nacimientos','candidate','1','CAND-B10-GALEANO-W02','B10 Uruguay Educa chronology and Uruguay catalog; collection layer','NONE'),
('V1-ENT-0277','collection','《拥抱之书》','El libro de los abrazos','candidate','1','CAND-B10-GALEANO-W03','B10 Uruguay Educa chronology and Uruguay catalog; collection layer','NONE'),
('V1-ENT-0278','work','《人工呼吸》','Respiración artificial','candidate','1','CAND-B10-PIGLIA-W01','B10 Piglia archive and UNLP bibliography; work layer','NONE'),
('V1-ENT-0279','work','《燃烧的钱》','Plata quemada','candidate','1','CAND-B10-PIGLIA-W02','B10 Piglia archive, Princeton and UNLP bibliography; work layer','NONE'),
('V1-ENT-0280','work','《夜间目标》','Blanco nocturno','candidate','1','CAND-B10-PIGLIA-W03','B10 Piglia archive, Princeton and UNLP bibliography; work layer','NONE'),
('V1-ENT-0281','work','《女俘爱玛》','Ema la cautiva','candidate','1','CAND-B10-AIRA-W01','B10 Konex and UNLP research; work layer','NONE'),
('V1-ENT-0282','work','《中国小说》','Una novela china','candidate','1','CAND-B10-AIRA-W02','B10 Konex and university journal research; work layer','NONE'),
('V1-ENT-0283','work','《文学大会》','El congreso de literatura','candidate','1','CAND-B10-AIRA-W03','B10 Konex and peer-reviewed research; work layer','NONE');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0272','CAND-B10-GALEANO-AUTHOR','WEB-CE-B10','CAND-B10-GALEANO-AUTHOR','V1-ENT-0272','create','B10 Reviewer pending; source-backed candidate'),
('V1-EMAP-0273','CAND-B10-PIGLIA-AUTHOR','WEB-CE-B10','CAND-B10-PIGLIA-AUTHOR','V1-ENT-0273','create','B10 Reviewer pending; source-backed candidate'),
('V1-EMAP-0274','CAND-B10-AIRA-AUTHOR','WEB-CE-B10','CAND-B10-AIRA-AUTHOR','V1-ENT-0274','create','B10 Reviewer pending; source-backed candidate'),
('V1-EMAP-0275','CAND-B10-GALEANO-W01','WEB-CE-B10','CAND-B10-GALEANO-W01','V1-ENT-0275','create','B10 Reviewer pending; source-backed candidate'),
('V1-EMAP-0276','CAND-B10-GALEANO-W02','WEB-CE-B10','CAND-B10-GALEANO-W02','V1-ENT-0276','create','B10 Reviewer pending; source-backed candidate'),
('V1-EMAP-0277','CAND-B10-GALEANO-W03','WEB-CE-B10','CAND-B10-GALEANO-W03','V1-ENT-0277','create','B10 Reviewer pending; source-backed candidate'),
('V1-EMAP-0278','CAND-B10-PIGLIA-W01','WEB-CE-B10','CAND-B10-PIGLIA-W01','V1-ENT-0278','create','B10 Reviewer pending; source-backed candidate'),
('V1-EMAP-0279','CAND-B10-PIGLIA-W02','WEB-CE-B10','CAND-B10-PIGLIA-W02','V1-ENT-0279','create','B10 Reviewer pending; source-backed candidate'),
('V1-EMAP-0280','CAND-B10-PIGLIA-W03','WEB-CE-B10','CAND-B10-PIGLIA-W03','V1-ENT-0280','create','B10 Reviewer pending; source-backed candidate'),
('V1-EMAP-0281','CAND-B10-AIRA-W01','WEB-CE-B10','CAND-B10-AIRA-W01','V1-ENT-0281','create','B10 Reviewer pending; source-backed candidate'),
('V1-EMAP-0282','CAND-B10-AIRA-W02','WEB-CE-B10','CAND-B10-AIRA-W02','V1-ENT-0282','create','B10 Reviewer pending; source-backed candidate'),
('V1-EMAP-0283','CAND-B10-AIRA-W03','WEB-CE-B10','CAND-B10-AIRA-W03','V1-ENT-0283','create','B10 Reviewer pending; source-backed candidate');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0160','','V1-ENT-0272','author','爱德华多·加莱亚诺','爱德华多·加莱亚诺','Eduardo Galeano','乌拉圭','es','1940–2015','历史书写与纪实散文','WEB-CE-B10','meets','NONE','### 爱德华多·加莱亚诺｜Eduardo Galeano — 以乌拉圭教育与文化机构资料建立历史书写入口。'),
('V1-CARD-0161','','V1-ENT-0273','author','里卡多·皮格利亚','里卡多·皮格利亚','Ricardo Piglia','阿根廷','es','1940–2017','小说与文学批评','WEB-CE-B10','meets','NONE','### 里卡多·皮格利亚｜Ricardo Piglia — 以作者档案、Princeton 与 UNLP 资料连接阿根廷小说。'),
('V1-CARD-0162','','V1-ENT-0274','author','塞萨尔·艾拉','塞萨尔·艾拉','César Aira','阿根廷','es','1949–','小说与翻译','WEB-CE-B10','meets','NONE','### 塞萨尔·艾拉｜César Aira — 以国家图书馆、Konex 与大学研究资料建立当代小说入口。'),
('V1-CARD-0163','','V1-ENT-0275','work','《拉丁美洲被切开的血管》','爱德华多·加莱亚诺','Las venas abiertas de América Latina','乌拉圭','es','1971','历史/纪实写作','WEB-CE-B10','meets','NONE','### 《拉丁美洲被切开的血管》｜Las venas abiertas de América Latina — 机构年表记录 1971 年出版。'),
('V1-CARD-0164','','V1-ENT-0276','collection','《火的记忆Ⅰ：创世纪》','爱德华多·加莱亚诺','Memoria del fuego I. Los nacimientos','乌拉圭','es','1982','历史卷册','WEB-CE-B10','meets','NONE','### 《火的记忆Ⅰ：创世纪》｜Memoria del fuego I. Los nacimientos — 年表与目录保留第一卷层级。'),
('V1-CARD-0165','','V1-ENT-0277','collection','《拥抱之书》','爱德华多·加莱亚诺','El libro de los abrazos','乌拉圭','es','1989','片段散文集','WEB-CE-B10','meets','NONE','### 《拥抱之书》｜El libro de los abrazos — 年表记录 1989 年书目。'),
('V1-CARD-0166','','V1-ENT-0278','work','《人工呼吸》','里卡多·皮格利亚','Respiración artificial','阿根廷','es','1980','小说','WEB-CE-B10','meets','NONE','### 《人工呼吸》｜Respiración artificial — 作者页与 UNLP 书目记录 1980 年。'),
('V1-CARD-0167','','V1-ENT-0279','work','《燃烧的钱》','里卡多·皮格利亚','Plata quemada','阿根廷','es','1997','小说','WEB-CE-B10','meets','NONE','### 《燃烧的钱》｜Plata quemada — 作者页、Princeton 与 UNLP 书目记录 1997 年。'),
('V1-CARD-0168','','V1-ENT-0280','work','《夜间目标》','里卡多·皮格利亚','Blanco nocturno','阿根廷','es','2010','小说','WEB-CE-B10','meets','NONE','### 《夜间目标》｜Blanco nocturno — 作者页、Princeton 与 UNLP 书目记录 2010 年。'),
('V1-CARD-0169','','V1-ENT-0281','work','《女俘爱玛》','塞萨尔·艾拉','Ema la cautiva','阿根廷','es','1981','小说','WEB-CE-B10','meets','NONE','### 《女俘爱玛》｜Ema la cautiva — UNLP 研究资料记录 1981 年出版。'),
('V1-CARD-0170','','V1-ENT-0282','work','《中国小说》','塞萨尔·艾拉','Una novela china','阿根廷','es','1987','小说','WEB-CE-B10','meets','NONE','### 《中国小说》｜Una novela china — 大学文学研究记录 1987 年出版。'),
('V1-CARD-0171','','V1-ENT-0283','work','《文学大会》','塞萨尔·艾拉','El congreso de literatura','阿根廷','es','1997','小说','WEB-CE-B10','meets','NONE','### 《文学大会》｜El congreso de literatura — 学术研究记录 1997 年梅里达首版。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-0689','WEB-CE-B10','V1-CARD-0160','V1-ENT-0272','birth_year','1940','fact','SRC-0215','high','candidate_for_staging_review','Argentina Culture page records Galeano born in Montevideo in 1940.'),
('V1-FCT-0690','WEB-CE-B10','V1-CARD-0160','V1-ENT-0272','death_year','2015','fact','SRC-0215','high','candidate_for_staging_review','Argentina Culture page records death in Montevideo in 2015.'),
('V1-FCT-0691','WEB-CE-B10','V1-CARD-0160','V1-ENT-0272','birth_place','蒙得维的亚（Montevideo）','fact','SRC-0215','high','candidate_for_staging_review','Argentina Culture page names Montevideo as birthplace.'),
('V1-FCT-0692','WEB-CE-B10','V1-CARD-0160','V1-ENT-0272','career_note','作家、记者','fact','SRC-0215','high','candidate_for_staging_review','Argentina Culture page records his journalism and writing.'),
('V1-FCT-0693','WEB-CE-B10','V1-CARD-0160','V1-ENT-0272','literary_identity','历史书写、纪实散文与片段写作作者','fact','SRC-0214','medium','candidate_for_staging_review','Uruguay Educa chronology and highlighted works support the descriptive identity without claiming a movement.'),
('V1-FCT-0694','WEB-CE-B10','V1-CARD-0163','V1-ENT-0275','entity_layer','work','metadata','SRC-0214','high','candidate_for_staging_review','Uruguay Educa chronology lists the title as a standalone book.'),
('V1-FCT-0695','WEB-CE-B10','V1-CARD-0163','V1-ENT-0275','first_publication_year','1971','bibliographic','SRC-0214','high','candidate_for_staging_review','Uruguay Educa chronology records 1971.'),
('V1-FCT-0696','WEB-CE-B10','V1-CARD-0163','V1-ENT-0275','bibliographic_note','Uruguay Educa 与阿根廷文化部均列出 Las venas abiertas de América Latina 题名与 1971 年。','bibliographic','SRC-0215','high','candidate_for_staging_review','Sources support title, year and descriptive form only.'),
('V1-FCT-0697','WEB-CE-B10','V1-CARD-0164','V1-ENT-0276','entity_layer','collection','metadata','SRC-0216','high','candidate_for_staging_review','Uruguay catalog identifies Los nacimientos as volume one of Memoria del fuego.'),
('V1-FCT-0698','WEB-CE-B10','V1-CARD-0164','V1-ENT-0276','first_publication_year','1982','bibliographic','SRC-0214','high','candidate_for_staging_review','Uruguay Educa chronology records 1982.'),
('V1-FCT-0699','WEB-CE-B10','V1-CARD-0164','V1-ENT-0276','bibliographic_note','年表与乌拉圭目录共同保留 Memoria del fuego I. Los nacimientos 的卷册题名。','bibliographic','SRC-0216','high','candidate_for_staging_review','Sources support title, volume layer and year only.'),
('V1-FCT-0700','WEB-CE-B10','V1-CARD-0165','V1-ENT-0277','entity_layer','collection','metadata','SRC-0216','high','candidate_for_staging_review','Uruguay catalog records El libro de los abrazos as a Galeano book entry.'),
('V1-FCT-0701','WEB-CE-B10','V1-CARD-0165','V1-ENT-0277','first_publication_year','1989','bibliographic','SRC-0214','high','candidate_for_staging_review','Uruguay Educa chronology records 1989.'),
('V1-FCT-0702','WEB-CE-B10','V1-CARD-0165','V1-ENT-0277','bibliographic_note','Uruguay 年表与议会图书馆目录直接列出 El libro de los abrazos 题名。','bibliographic','SRC-0216','high','candidate_for_staging_review','Sources support title, collection layer and chronology only.'),
('V1-FCT-0703','WEB-CE-B10','V1-CARD-0161','V1-ENT-0273','birth_year','1940','fact','SRC-0217','high','candidate_for_staging_review','Piglia archive biography records birth in 1940.'),
('V1-FCT-0704','WEB-CE-B10','V1-CARD-0161','V1-ENT-0273','death_year','2017','fact','SRC-0219','high','candidate_for_staging_review','UNLP literary geography records death in Buenos Aires in 2017.'),
('V1-FCT-0705','WEB-CE-B10','V1-CARD-0161','V1-ENT-0273','birth_place','阿德罗格（Adrogué）','fact','SRC-0217','high','candidate_for_staging_review','Piglia archive biography names Adrogué, Buenos Aires Province.'),
('V1-FCT-0706','WEB-CE-B10','V1-CARD-0161','V1-ENT-0273','country_or_region','阿根廷','fact','SRC-0218','high','candidate_for_staging_review','Princeton University Library identifies Piglia as an Argentine author.'),
('V1-FCT-0707','WEB-CE-B10','V1-CARD-0161','V1-ENT-0273','career_note','作家、文学评论家','fact','SRC-0218','high','candidate_for_staging_review','Princeton page describes his fiction, essays and criticism.'),
('V1-FCT-0708','WEB-CE-B10','V1-CARD-0166','V1-ENT-0278','entity_layer','work','metadata','SRC-0219','high','candidate_for_staging_review','UNLP bibliography identifies Respiración artificial as a novel.'),
('V1-FCT-0709','WEB-CE-B10','V1-CARD-0166','V1-ENT-0278','first_publication_year','1980','bibliographic','SRC-0219','high','candidate_for_staging_review','UNLP bibliography records 1980.'),
('V1-FCT-0710','WEB-CE-B10','V1-CARD-0166','V1-ENT-0278','bibliographic_note','作者作品页与 UNLP 书目直接列出 Respiración artificial 题名与 1980 年。','bibliographic','SRC-0217','high','candidate_for_staging_review','Sources support title, novel layer and year only.'),
('V1-FCT-0711','WEB-CE-B10','V1-CARD-0167','V1-ENT-0279','entity_layer','work','metadata','SRC-0219','high','candidate_for_staging_review','UNLP bibliography identifies Plata quemada as a novel.'),
('V1-FCT-0712','WEB-CE-B10','V1-CARD-0167','V1-ENT-0279','first_publication_year','1997','bibliographic','SRC-0219','high','candidate_for_staging_review','UNLP bibliography records 1997.'),
('V1-FCT-0713','WEB-CE-B10','V1-CARD-0167','V1-ENT-0279','bibliographic_note','作者页、Princeton 页面与 UNLP 书目共同列出 Plata quemada 题名。','bibliographic','SRC-0218','high','candidate_for_staging_review','Sources support title, novel layer and year only.'),
('V1-FCT-0714','WEB-CE-B10','V1-CARD-0168','V1-ENT-0280','entity_layer','work','metadata','SRC-0219','high','candidate_for_staging_review','UNLP bibliography identifies Blanco nocturno as a novel.'),
('V1-FCT-0715','WEB-CE-B10','V1-CARD-0168','V1-ENT-0280','first_publication_year','2010','bibliographic','SRC-0219','high','candidate_for_staging_review','UNLP bibliography records 2010.'),
('V1-FCT-0716','WEB-CE-B10','V1-CARD-0168','V1-ENT-0280','bibliographic_note','作者页、Princeton 页面与 UNLP 书目共同列出 Blanco nocturno 题名与年份。','bibliographic','SRC-0217','high','candidate_for_staging_review','Sources support title, novel layer and year only.'),
('V1-FCT-0717','WEB-CE-B10','V1-CARD-0162','V1-ENT-0274','birth_year','1949','fact','SRC-0220','high','candidate_for_staging_review','Biblioteca Nacional records birth in 1949.'),
('V1-FCT-0718','WEB-CE-B10','V1-CARD-0162','V1-ENT-0274','country_or_region','阿根廷','fact','SRC-0220','high','candidate_for_staging_review','Biblioteca Nacional presents Aira as an Argentine writer.'),
('V1-FCT-0719','WEB-CE-B10','V1-CARD-0162','V1-ENT-0274','birth_place','科罗内尔·普林格尔斯（Coronel Pringles）','fact','SRC-0220','high','candidate_for_staging_review','Biblioteca Nacional names Coronel Pringles as birthplace.'),
('V1-FCT-0720','WEB-CE-B10','V1-CARD-0162','V1-ENT-0274','career_note','小说家、翻译家','fact','SRC-0221','high','candidate_for_staging_review','Fundación Konex describes Aira as translator and novelist.'),
('V1-FCT-0721','WEB-CE-B10','V1-CARD-0162','V1-ENT-0274','literary_identity','小说、短篇、散文与戏剧作者','fact','SRC-0221','medium','candidate_for_staging_review','Fundación Konex lists novels, stories, essays and theatre without assigning a movement.'),
('V1-FCT-0722','WEB-CE-B10','V1-CARD-0169','V1-ENT-0281','entity_layer','work','metadata','SRC-0223','high','candidate_for_staging_review','UNLP research identifies Ema la cautiva as a novel.'),
('V1-FCT-0723','WEB-CE-B10','V1-CARD-0169','V1-ENT-0281','first_publication_year','1981','bibliographic','SRC-0223','high','candidate_for_staging_review','UNLP research records first publication in 1981.'),
('V1-FCT-0724','WEB-CE-B10','V1-CARD-0169','V1-ENT-0281','bibliographic_note','Konex 目录与 UNLP 研究直接列出 Ema la cautiva 题名与 1981 年。','bibliographic','SRC-0223','high','candidate_for_staging_review','Sources support title, novel layer and year only.'),
('V1-FCT-0725','WEB-CE-B10','V1-CARD-0170','V1-ENT-0282','entity_layer','work','metadata','SRC-0222','high','candidate_for_staging_review','University literature article identifies Una novela china as a novel.'),
('V1-FCT-0726','WEB-CE-B10','V1-CARD-0170','V1-ENT-0282','first_publication_year','1987','bibliographic','SRC-0222','high','candidate_for_staging_review','University literature article records 1987.'),
('V1-FCT-0727','WEB-CE-B10','V1-CARD-0170','V1-ENT-0282','bibliographic_note','Konex 目录与大学文学论文直接列出 Una novela china 题名。','bibliographic','SRC-0222','high','candidate_for_staging_review','Sources support title, novel layer and year only.'),
('V1-FCT-0728','WEB-CE-B10','V1-CARD-0171','V1-ENT-0283','entity_layer','work','metadata','SRC-0224','high','candidate_for_staging_review','Peer-reviewed article identifies El congreso de literatura as a short novel.'),
('V1-FCT-0729','WEB-CE-B10','V1-CARD-0171','V1-ENT-0283','first_publication_year','1997','bibliographic','SRC-0224','high','candidate_for_staging_review','Peer-reviewed article records 1997 and the Mérida first edition context.'),
('V1-FCT-0730','WEB-CE-B10','V1-CARD-0171','V1-ENT-0283','bibliographic_note','Konex 目录与学术论文直接列出 El congreso de literatura 题名；论文补充 1997 年首版地点。','bibliographic','SRC-0224','high','candidate_for_staging_review','Sources support title, novel layer and year only.'),
('V1-FCT-0731','WEB-CE-B10','V1-CARD-0160','V1-ENT-0272','country_or_region','乌拉圭','fact','SRC-0215','high','candidate_for_staging_review','Argentina Culture page identifies Galeano as Uruguayan and born in Montevideo.');

INSERT INTO fact_sources (fact_id,source_id,source_title)
SELECT fact_id, origin_id, '' FROM facts WHERE fact_id BETWEEN 'V1-FCT-0689' AND 'V1-FCT-0731';
UPDATE fact_sources SET source_title=(SELECT title FROM sources WHERE sources.source_id=fact_sources.source_id) WHERE fact_id BETWEEN 'V1-FCT-0689' AND 'V1-FCT-0731';

INSERT INTO card_facts (card_id,fact_id,admission_status)
SELECT card_id, fact_id, 'candidate_for_staging_review' FROM facts WHERE fact_id BETWEEN 'V1-FCT-0689' AND 'V1-FCT-0731';

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0316','','V1-CARD-0160','SRC-0214','B','both','yes','yes','SRC-0214','used','NONE'),('V1-CS-0317','','V1-CARD-0160','SRC-0215','B','both','yes','yes','SRC-0215','used','NONE'),
('V1-CS-0318','','V1-CARD-0161','SRC-0217','B','both','yes','yes','SRC-0217','used','NONE'),('V1-CS-0319','','V1-CARD-0161','SRC-0218','B','both','yes','yes','SRC-0218','used','NONE'),('V1-CS-0320','','V1-CARD-0161','SRC-0219','A','both','yes','yes','SRC-0219','used','NONE'),
('V1-CS-0321','','V1-CARD-0162','SRC-0220','B','both','yes','yes','SRC-0220','used','NONE'),('V1-CS-0322','','V1-CARD-0162','SRC-0221','B','both','yes','yes','SRC-0221','used','NONE'),
('V1-CS-0323','','V1-CARD-0163','SRC-0214','B','both','yes','yes','SRC-0214','used','NONE'),('V1-CS-0324','','V1-CARD-0163','SRC-0215','B','both','yes','yes','SRC-0215','used','NONE'),
('V1-CS-0325','','V1-CARD-0164','SRC-0214','B','both','yes','yes','SRC-0214','used','NONE'),('V1-CS-0326','','V1-CARD-0164','SRC-0216','B','both','yes','yes','SRC-0216','used','NONE'),
('V1-CS-0327','','V1-CARD-0165','SRC-0214','B','both','yes','yes','SRC-0214','used','NONE'),('V1-CS-0328','','V1-CARD-0165','SRC-0216','B','both','yes','yes','SRC-0216','used','NONE'),('V1-CS-0343','','V1-CARD-0165','SRC-0215','B','both','yes','yes','SRC-0215','used','NONE'),
('V1-CS-0329','','V1-CARD-0166','SRC-0217','B','both','yes','yes','SRC-0217','used','NONE'),('V1-CS-0330','','V1-CARD-0166','SRC-0219','A','both','yes','yes','SRC-0219','used','NONE'),
('V1-CS-0331','','V1-CARD-0167','SRC-0217','B','both','yes','yes','SRC-0217','used','NONE'),('V1-CS-0332','','V1-CARD-0167','SRC-0218','B','both','yes','yes','SRC-0218','used','NONE'),('V1-CS-0333','','V1-CARD-0167','SRC-0219','A','both','yes','yes','SRC-0219','used','NONE'),
('V1-CS-0334','','V1-CARD-0168','SRC-0217','B','both','yes','yes','SRC-0217','used','NONE'),('V1-CS-0335','','V1-CARD-0168','SRC-0218','B','both','yes','yes','SRC-0218','used','NONE'),('V1-CS-0336','','V1-CARD-0168','SRC-0219','A','both','yes','yes','SRC-0219','used','NONE'),
('V1-CS-0337','','V1-CARD-0169','SRC-0221','B','both','yes','yes','SRC-0221','used','NONE'),('V1-CS-0338','','V1-CARD-0169','SRC-0223','A','both','yes','yes','SRC-0223','used','NONE'),
('V1-CS-0339','','V1-CARD-0170','SRC-0221','B','both','yes','yes','SRC-0221','used','NONE'),('V1-CS-0340','','V1-CARD-0170','SRC-0222','A','both','yes','yes','SRC-0222','used','NONE'),
('V1-CS-0341','','V1-CARD-0171','SRC-0221','B','both','yes','yes','SRC-0221','used','NONE'),('V1-CS-0342','','V1-CARD-0171','SRC-0224','A','both','yes','yes','SRC-0224','used','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0200','WEB-CE-B10','CAND-B10-0200','V1-ENT-0272','CREATED','V1-ENT-0275','爱德华多·加莱亚诺 创作 《拉丁美洲被切开的血管》（Las venas abiertas de América Latina）','high','accepted','WEB-CE-B10','1','NONE'),
('V1-REL-0201','WEB-CE-B10','CAND-B10-0201','V1-ENT-0272','CREATED','V1-ENT-0276','爱德华多·加莱亚诺 创作 《火的记忆Ⅰ：创世纪》（Memoria del fuego I. Los nacimientos）','high','accepted','WEB-CE-B10','1','NONE'),
('V1-REL-0202','WEB-CE-B10','CAND-B10-0202','V1-ENT-0272','CREATED','V1-ENT-0277','爱德华多·加莱亚诺 创作 《拥抱之书》（El libro de los abrazos）','high','accepted','WEB-CE-B10','1','NONE'),
('V1-REL-0203','WEB-CE-B10','CAND-B10-0203','V1-ENT-0273','CREATED','V1-ENT-0278','里卡多·皮格利亚 创作 《人工呼吸》（Respiración artificial）','high','accepted','WEB-CE-B10','1','NONE'),
('V1-REL-0204','WEB-CE-B10','CAND-B10-0204','V1-ENT-0273','CREATED','V1-ENT-0279','里卡多·皮格利亚 创作 《燃烧的钱》（Plata quemada）','high','accepted','WEB-CE-B10','1','NONE'),
('V1-REL-0205','WEB-CE-B10','CAND-B10-0205','V1-ENT-0273','CREATED','V1-ENT-0280','里卡多·皮格利亚 创作 《夜间目标》（Blanco nocturno）','high','accepted','WEB-CE-B10','1','NONE'),
('V1-REL-0206','WEB-CE-B10','CAND-B10-0206','V1-ENT-0274','CREATED','V1-ENT-0281','塞萨尔·艾拉 创作 《女俘爱玛》（Ema la cautiva）','high','accepted','WEB-CE-B10','1','NONE'),
('V1-REL-0207','WEB-CE-B10','CAND-B10-0207','V1-ENT-0274','CREATED','V1-ENT-0282','塞萨尔·艾拉 创作 《中国小说》（Una novela china）','high','accepted','WEB-CE-B10','1','NONE'),
('V1-REL-0208','WEB-CE-B10','CAND-B10-0208','V1-ENT-0274','CREATED','V1-ENT-0283','塞萨尔·艾拉 创作 《文学大会》（El congreso de literatura）','high','accepted','WEB-CE-B10','1','NONE'),
('V1-REL-0209','WEB-CE-B10','CAND-B10-0209','V1-ENT-0272','ASSOCIATED_WITH_PLACE','V1-ENT-0196','爱德华多·加莱亚诺与乌拉圭关联','high','accepted','WEB-CE-B10','1','NONE'),
('V1-REL-0210','WEB-CE-B10','CAND-B10-0210','V1-ENT-0273','ASSOCIATED_WITH_PLACE','V1-ENT-0001','里卡多·皮格利亚与阿根廷关联','high','accepted','WEB-CE-B10','1','NONE'),
('V1-REL-0211','WEB-CE-B10','CAND-B10-0211','V1-ENT-0274','ASSOCIATED_WITH_PLACE','V1-ENT-0001','塞萨尔·艾拉与阿根廷关联','high','accepted','WEB-CE-B10','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0200','SRC-0215'),('V1-REL-0201','SRC-0214'),('V1-REL-0202','SRC-0216'),
('V1-REL-0203','SRC-0217'),('V1-REL-0204','SRC-0217'),('V1-REL-0205','SRC-0217'),
('V1-REL-0206','SRC-0223'),('V1-REL-0207','SRC-0222'),('V1-REL-0208','SRC-0224'),
('V1-REL-0209','SRC-0215'),('V1-REL-0210','SRC-0218'),('V1-REL-0211','SRC-0220');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0225','V1-REL-0200','CAND-B10-0200','SRC-0215','WEB-CE-B10 source SRC-0215','','Argentina Culture page identifies Las venas abiertas de América Latina as Galeano work.','high','eligible_evidence','WEB-CE-B10'),
('V1-EV-0226','V1-REL-0201','CAND-B10-0201','SRC-0214','WEB-CE-B10 source SRC-0214','','Uruguay Educa chronology lists Memoria del fuego I. Los nacimientos.','high','eligible_evidence','WEB-CE-B10'),
('V1-EV-0227','V1-REL-0202','CAND-B10-0202','SRC-0216','WEB-CE-B10 source SRC-0216','','Uruguay catalog records El libro de los abrazos under Galeano.','high','eligible_evidence','WEB-CE-B10'),
('V1-EV-0228','V1-REL-0203','CAND-B10-0203','SRC-0217','WEB-CE-B10 source SRC-0217','','Piglia archive work list names Respiración artificial.','high','eligible_evidence','WEB-CE-B10'),
('V1-EV-0229','V1-REL-0204','CAND-B10-0204','SRC-0217','WEB-CE-B10 source SRC-0217','','Piglia archive work list names Plata quemada.','high','eligible_evidence','WEB-CE-B10'),
('V1-EV-0230','V1-REL-0205','CAND-B10-0205','SRC-0217','WEB-CE-B10 source SRC-0217','','Piglia archive work list names Blanco nocturno.','high','eligible_evidence','WEB-CE-B10'),
('V1-EV-0231','V1-REL-0206','CAND-B10-0206','SRC-0223','WEB-CE-B10 source SRC-0223','','UNLP research identifies Ema la cautiva as Aira work.','high','eligible_evidence','WEB-CE-B10'),
('V1-EV-0232','V1-REL-0207','CAND-B10-0207','SRC-0222','WEB-CE-B10 source SRC-0222','','University literature article identifies Una novela china by Aira.','high','eligible_evidence','WEB-CE-B10'),
('V1-EV-0233','V1-REL-0208','CAND-B10-0208','SRC-0224','WEB-CE-B10 source SRC-0224','','Peer-reviewed article identifies El congreso de literatura by Aira.','high','eligible_evidence','WEB-CE-B10'),
('V1-EV-0234','V1-REL-0209','CAND-B10-0209','SRC-0215','WEB-CE-B10 source SRC-0215','','Argentina Culture page identifies Galeano as Uruguayan and born in Montevideo.','high','eligible_evidence','WEB-CE-B10'),
('V1-EV-0235','V1-REL-0210','CAND-B10-0210','SRC-0218','WEB-CE-B10 source SRC-0218','','Princeton University Library identifies Piglia as Argentine.','high','eligible_evidence','WEB-CE-B10'),
('V1-EV-0236','V1-REL-0211','CAND-B10-0211','SRC-0220','WEB-CE-B10 source SRC-0220','','Biblioteca Nacional identifies Aira as an Argentine writer.','high','eligible_evidence','WEB-CE-B10');

UPDATE relationship_evidence SET source_title=(SELECT title FROM sources WHERE sources.source_id=relationship_evidence.source_id) WHERE evidence_id BETWEEN 'V1-EV-0225' AND 'V1-EV-0236';

INSERT INTO metadata (key,value) VALUES ('last_change_set','WEB-CE-B10') ON CONFLICT(key) DO UPDATE SET value=excluded.value;
UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';
