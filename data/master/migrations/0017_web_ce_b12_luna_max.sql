-- WEB-CE-B12: Luna Max serial batch; Samanta Schweblin, Mariana Enriquez, and Alejandro Zambra.

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0231','B12-SRC-0231','Perdiendo velocidad — Historias x leer','Perdiendo velocidad','Ministerio de Educación de la Nación Argentina','','Ministerio de Educación de la Nación','','','web_pdf','','es','B','access_pass','WEB-CE-B12','Argentina Ministry PDF records ©2014 Distancia de rescate; Schweblin 1978; cuentista/novelista; Pájaros en la boca and Siete casas vacías','remote_only','','https://www.argentina.gob.ar/sites/default/files/2022/11/p700-_perdiendo_velocidad_micro.pdf'),
('SRC-0232','B12-SRC-0232','Samanta Schweblin — Penguin Random House author profile','Samanta Schweblin','Penguin Random House','','Penguin Random House','','','web_page','','en','B','access_pass','WEB-CE-B12','Publisher profile identifies Buenos Aires origin and lists Pájaros en la boca, Siete casas vacías / Seven Empty Houses, and Distancia de rescate','remote_only','','https://www.penguinrandomhouse.com/authors/2128471/samanta-schweblin/'),
('SRC-0233','B12-SRC-0233','Pájaros en la boca / Mouthful of Birds: Stories','Pájaros en la boca / Mouthful of Birds: Stories','Penguin Random House','','Penguin Random House','','','web_page','','es','B','access_pass','WEB-CE-B12','Publisher book page identifies title, author, and story-collection form; current edition date not used','remote_only','','https://www.penguinrandomhouse.com/books/787456/pajaros-en-la-boca--mouthful-of-birds-stories-by-samanta-schweblin/'),
('SRC-0234','B12-SRC-0234','Distancia de rescate / Fever Dream','Distancia de rescate / Fever Dream','Penguin Random House','','Penguin Random House','','','web_page','','es','B','access_pass','WEB-CE-B12','Publisher book page identifies title, author, and first-novel form; current edition date not used','remote_only','','https://www.penguinrandomhouse.com/books/652915/distancia-de-rescate--fever-dream-by-samanta-schweblin/'),
('SRC-0235','B12-SRC-0235','Mariana Enriquez gana el premio Ciutat de Barcelona en la categoría Literatura castellana','Mariana Enriquez gana el premio Ciutat de Barcelona','Editorial Anagrama','','Editorial Anagrama','','','web_page','','es','B','access_pass','WEB-CE-B12','Anagrama notice identifies Argentine author Buenos Aires 1973, journalist/subeditor/teacher; Las cosas collection published February 2016; Los peligros earlier Argentine story book','remote_only','','https://www.anagrama-ed.es/noticias/premios-y-distinciones/mariana-enriquez-gana-el-premio-ciutat-de-barcelona-en-la-categoria-literatura-castellana--282'),
('SRC-0236','B12-SRC-0236','Nuestra parte de noche — Mariana Enriquez','Nuestra parte de noche','Editorial Anagrama','','Editorial Anagrama','','','web_page','','es','B','access_pass','WEB-CE-B12','Publisher page identifies title, author, novel form, and Premio Herralde de Novela 2019','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/nuestra-parte-de-noche/9788433998859/NH_636'),
('SRC-0237','B12-SRC-0237','Los peligros de fumar en la cama — Mariana Enriquez','Los peligros de fumar en la cama','Editorial Anagrama','','Editorial Anagrama','','','web_page','','es','B','access_pass','WEB-CE-B12','Publisher page identifies title, author, and twelve-story collection form','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/los-peligros-de-fumar-en-la-cama/9788433998248/NH_580'),
('SRC-0238','B12-SRC-0238','Las cosas que perdimos en el fuego — Mariana Enriquez','Las cosas que perdimos en el fuego','Editorial Anagrama','','Editorial Anagrama','','','web_page','','es','B','access_pass','WEB-CE-B12','Publisher page identifies title and author; Anagrama notice supplies story-collection form and February 2016 publication','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/las-cosas-que-perdimos-en-el-fuego/9788433998064/NH_559'),
('SRC-0239','B12-SRC-0239','Alejandro Zambra — Editorial Anagrama','Alejandro Zambra','Editorial Anagrama','','Editorial Anagrama','','','web_page','','es','B','access_pass','WEB-CE-B12','Author profile states Santiago de Chile 1975 and lists Bonsái 2006, La vida privada de los árboles 2007, Formas de volver a casa 2011','remote_only','','https://www.anagrama-ed.es/autor/zambra-alejandro-1146'),
('SRC-0240','B12-SRC-0240','Sobre No leer. Crónicas y ensayos sobre literatura de Alejandro Zambra — Mapocho','Sobre No leer. Crónicas y ensayos sobre literatura de Alejandro Zambra','Paulina Andrade S.','','Memoria Chilena / Biblioteca Nacional de Chile','2011','','web_pdf','254','es','B','access_pass','WEB-CE-B12','Mapocho. Revista de Humanidades, N°69, Primer Semestre de 2011; article contents independently record Zambra 1975, the 2006/2007/2011 sequence, and novel forms','remote_only','','https://www.memoriachilena.gob.cl/archivos2/pdfs/MC0048557.pdf');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0296','author','萨曼塔·施韦布林','Samanta Schweblin','candidate','1','CAND-B12-SCHWEBLIN-AUTHOR','B12 Argentina Ministry and PRH profiles; Chinese display candidate','NONE'),
('V1-ENT-0297','author','玛丽安娜·恩里克斯','Mariana Enriquez','candidate','1','CAND-B12-ENRIQUEZ-AUTHOR','B12 Anagrama institutional profiles; Chinese display candidate','NONE'),
('V1-ENT-0298','author','亚历杭德罗·桑布拉','Alejandro Zambra','candidate','1','CAND-B12-ZAMBRA-AUTHOR','B12 Anagrama and Memoria Chilena profiles; Chinese display candidate','NONE'),
('V1-ENT-0299','work','《救援距离》','Distancia de rescate','candidate','1','CAND-B12-SCHWEBLIN-W01','B12 publisher/institutional bibliography; work layer','NONE'),
('V1-ENT-0300','collection','《口中之鸟》','Pájaros en la boca','candidate','1','CAND-B12-SCHWEBLIN-W02','B12 publisher/institutional bibliography; collection layer','NONE'),
('V1-ENT-0301','collection','《七座空屋》','Siete casas vacías','candidate','1','CAND-B12-SCHWEBLIN-W03','B12 institutional/publisher bibliography; collection layer','NONE'),
('V1-ENT-0302','collection','《我们在火中失去的东西》','Las cosas que perdimos en el fuego','candidate','1','CAND-B12-ENRIQUEZ-W01','B12 Anagrama bibliography; collection layer','NONE'),
('V1-ENT-0303','work','《我们的夜晚》','Nuestra parte de noche','candidate','1','CAND-B12-ENRIQUEZ-W02','B12 Anagrama bibliography; novel layer','NONE'),
('V1-ENT-0304','collection','《床上吸烟的危险》','Los peligros de fumar en la cama','candidate','1','CAND-B12-ENRIQUEZ-W03','B12 Anagrama bibliography; collection layer','NONE'),
('V1-ENT-0305','work','《盆栽》','Bonsái','candidate','1','CAND-B12-ZAMBRA-W01','B12 Anagrama and Memoria Chilena bibliography; work layer','NONE'),
('V1-ENT-0306','work','《树木的私生活》','La vida privada de los árboles','candidate','1','CAND-B12-ZAMBRA-W02','B12 Anagrama and Memoria Chilena bibliography; work layer','NONE'),
('V1-ENT-0307','work','《回家的方式》','Formas de volver a casa','candidate','1','CAND-B12-ZAMBRA-W03','B12 Anagrama and Memoria Chilena bibliography; work layer','NONE');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0296','CAND-B12-SCHWEBLIN-AUTHOR','WEB-CE-B12','CAND-B12-SCHWEBLIN-AUTHOR','V1-ENT-0296','create','B12 fresh-context Reviewer pending; source-backed candidate'),
('V1-EMAP-0297','CAND-B12-ENRIQUEZ-AUTHOR','WEB-CE-B12','CAND-B12-ENRIQUEZ-AUTHOR','V1-ENT-0297','create','B12 fresh-context Reviewer pending; source-backed candidate'),
('V1-EMAP-0298','CAND-B12-ZAMBRA-AUTHOR','WEB-CE-B12','CAND-B12-ZAMBRA-AUTHOR','V1-ENT-0298','create','B12 fresh-context Reviewer pending; source-backed candidate'),
('V1-EMAP-0299','CAND-B12-SCHWEBLIN-W01','WEB-CE-B12','CAND-B12-SCHWEBLIN-W01','V1-ENT-0299','create','B12 fresh-context Reviewer pending; source-backed candidate'),
('V1-EMAP-0300','CAND-B12-SCHWEBLIN-W02','WEB-CE-B12','CAND-B12-SCHWEBLIN-W02','V1-ENT-0300','create','B12 fresh-context Reviewer pending; source-backed candidate'),
('V1-EMAP-0301','CAND-B12-SCHWEBLIN-W03','WEB-CE-B12','CAND-B12-SCHWEBLIN-W03','V1-ENT-0301','create','B12 fresh-context Reviewer pending; source-backed candidate'),
('V1-EMAP-0302','CAND-B12-ENRIQUEZ-W01','WEB-CE-B12','CAND-B12-ENRIQUEZ-W01','V1-ENT-0302','create','B12 fresh-context Reviewer pending; source-backed candidate'),
('V1-EMAP-0303','CAND-B12-ENRIQUEZ-W02','WEB-CE-B12','CAND-B12-ENRIQUEZ-W02','V1-ENT-0303','create','B12 fresh-context Reviewer pending; source-backed candidate'),
('V1-EMAP-0304','CAND-B12-ENRIQUEZ-W03','WEB-CE-B12','CAND-B12-ENRIQUEZ-W03','V1-ENT-0304','create','B12 fresh-context Reviewer pending; source-backed candidate'),
('V1-EMAP-0305','CAND-B12-ZAMBRA-W01','WEB-CE-B12','CAND-B12-ZAMBRA-W01','V1-ENT-0305','create','B12 fresh-context Reviewer pending; source-backed candidate'),
('V1-EMAP-0306','CAND-B12-ZAMBRA-W02','WEB-CE-B12','CAND-B12-ZAMBRA-W02','V1-ENT-0306','create','B12 fresh-context Reviewer pending; source-backed candidate'),
('V1-EMAP-0307','CAND-B12-ZAMBRA-W03','WEB-CE-B12','CAND-B12-ZAMBRA-W03','V1-ENT-0307','create','B12 fresh-context Reviewer pending; source-backed candidate');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0184','','V1-ENT-0296','author','萨曼塔·施韦布林','萨曼塔·施韦布林','Samanta Schweblin','阿根廷','es','1978–','短篇小说与小说','WEB-CE-B12','meets','NONE','### 萨曼塔·施韦布林｜Samanta Schweblin — Argentina Ministry and PRH profiles establish the author entry.'),
('V1-CARD-0185','','V1-ENT-0297','author','玛丽安娜·恩里克斯','玛丽安娜·恩里克斯','Mariana Enriquez','阿根廷','es','1973–','小说与短篇故事','WEB-CE-B12','meets','NONE','### 玛丽安娜·恩里克斯｜Mariana Enriquez — Anagrama institutional material establishes the author entry.'),
('V1-CARD-0186','','V1-ENT-0298','author','亚历杭德罗·桑布拉','亚历杭德罗·桑布拉','Alejandro Zambra','智利','es','1975–','小说、短篇小说与随笔','WEB-CE-B12','meets','NONE','### 亚历杭德罗·桑布拉｜Alejandro Zambra — Anagrama and Memoria Chilena establish the author entry.'),
('V1-CARD-0187','','V1-ENT-0299','work','《救援距离》','萨曼塔·施韦布林','Distancia de rescate','阿根廷','es','首版年份待补','小说','WEB-CE-B12','meets','NONE','### 《救援距离》｜Distancia de rescate — The Ministry PDF marks ©2014 on the copyright page; first-publication year remains open.'),
('V1-CARD-0188','','V1-ENT-0300','work','《口中之鸟》','萨曼塔·施韦布林','Pájaros en la boca','阿根廷','es','出版年份待补','短篇小说集','WEB-CE-B12','meets','NONE','### 《口中之鸟》｜Pájaros en la boca — Institutional and publisher pages identify the title as a story collection; first year is an open gap.'),
('V1-CARD-0189','','V1-ENT-0301','work','《七座空屋》','萨曼塔·施韦布林','Siete casas vacías','阿根廷','es','出版年份待补','短篇小说集','WEB-CE-B12','meets','NONE','### 《七座空屋》｜Siete casas vacías — The Ministry bibliography and PRH page identify the story collection; current edition date is not first publication.'),
('V1-CARD-0190','','V1-ENT-0302','work','《我们在火中失去的东西》','玛丽安娜·恩里克斯','Las cosas que perdimos en el fuego','阿根廷','es','2016','短篇小说集','WEB-CE-B12','meets','NONE','### 《我们在火中失去的东西》｜Las cosas que perdimos en el fuego — Anagrama identifies a story collection published in February 2016.'),
('V1-CARD-0191','','V1-ENT-0303','work','《我们的夜晚》','玛丽安娜·恩里克斯','Nuestra parte de noche','阿根廷','es','2019奖项节点','小说','WEB-CE-B12','meets','NONE','### 《我们的夜晚》｜Nuestra parte de noche — Anagrama identifies a novel and the 2019 Herralde award; first-publication year remains a gap.'),
('V1-CARD-0192','','V1-ENT-0304','work','《床上吸烟的危险》','玛丽安娜·恩里克斯','Los peligros de fumar en la cama','阿根廷','es','出版年份待补','短篇小说集','WEB-CE-B12','meets','NONE','### 《床上吸烟的危险》｜Los peligros de fumar en la cama — Anagrama identifies an earlier Argentine story collection and twelve-story form.'),
('V1-CARD-0193','','V1-ENT-0305','work','《盆栽》','亚历杭德罗·桑布拉','Bonsái','智利','es','2006','小说','WEB-CE-B12','meets','NONE','### 《盆栽》｜Bonsái — Anagrama and Memoria Chilena record the 2006 novel.'),
('V1-CARD-0194','','V1-ENT-0306','work','《树木的私生活》','亚历杭德罗·桑布拉','La vida privada de los árboles','智利','es','2007','小说','WEB-CE-B12','meets','NONE','### 《树木的私生活》｜La vida privada de los árboles — Anagrama and Memoria Chilena record the 2007 novel.'),
('V1-CARD-0195','','V1-ENT-0307','work','《回家的方式》','亚历杭德罗·桑布拉','Formas de volver a casa','智利','es','2011','小说','WEB-CE-B12','meets','NONE','### 《回家的方式》｜Formas de volver a casa — Anagrama and Memoria Chilena record the 2011 novel.');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-0786','WEB-CE-B12','V1-CARD-0184','V1-ENT-0296','birth_year','1978','fact','SRC-0231','high','candidate_for_staging_review','Argentina Ministry biography identifies Schweblin as born in 1978.'),
('V1-FCT-0787','WEB-CE-B12','V1-CARD-0184','V1-ENT-0296','country_or_region','阿根廷','fact','SRC-0231','high','candidate_for_staging_review','Institutional Argentine source places Schweblin in the Argentine literary context.'),
('V1-FCT-0788','WEB-CE-B12','V1-CARD-0184','V1-ENT-0296','career_note','短篇小说家、小说家','fact','SRC-0231','high','candidate_for_staging_review','The source explicitly calls her cuentista y novelista.'),
('V1-FCT-0789','WEB-CE-B12','V1-CARD-0185','V1-ENT-0297','birth_year','1973','fact','SRC-0235','high','candidate_for_staging_review','Anagrama biography identifies Enriquez as Buenos Aires, 1973.'),
('V1-FCT-0790','WEB-CE-B12','V1-CARD-0185','V1-ENT-0297','country_or_region','阿根廷','fact','SRC-0235','high','candidate_for_staging_review','Anagrama calls her an Argentine writer.'),
('V1-FCT-0791','WEB-CE-B12','V1-CARD-0185','V1-ENT-0297','career_note','记者、教师与小说/故事作者','fact','SRC-0235','high','candidate_for_staging_review','Anagrama lists journalist, teacher, novels and collections of stories.'),
('V1-FCT-0792','WEB-CE-B12','V1-CARD-0186','V1-ENT-0298','birth_year','1975','fact','SRC-0239','high','candidate_for_staging_review','Anagrama identifies Zambra as Santiago de Chile, 1975.'),
('V1-FCT-0793','WEB-CE-B12','V1-CARD-0186','V1-ENT-0298','country_or_region','智利','fact','SRC-0239','high','candidate_for_staging_review','Anagrama biography identifies Santiago de Chile.'),
('V1-FCT-0794','WEB-CE-B12','V1-CARD-0186','V1-ENT-0298','career_note','小说家、短篇小说与随笔作者','fact','SRC-0239','high','candidate_for_staging_review','Anagrama lists novels, stories and essay collections.'),
('V1-FCT-0795','WEB-CE-B12','V1-CARD-0187','V1-ENT-0299','entity_layer','work','metadata','SRC-0234','high','candidate_for_staging_review','PRH identifies Distancia de rescate as a novel/first novel.'),
('V1-FCT-0796','WEB-CE-B12','V1-CARD-0187','V1-ENT-0299','bibliographic_note','版权页标注 ©2014（不等同于首版年份）','bibliographic','SRC-0231','medium','candidate_for_staging_review','Argentina Ministry PDF marks ©2014; no first-publication claim is made.'),
('V1-FCT-0797','WEB-CE-B12','V1-CARD-0187','V1-ENT-0299','genre_or_form','小说','bibliographic','SRC-0234','high','candidate_for_staging_review','PRH describes the book as Schweblin''s first novel.'),
('V1-FCT-0798','WEB-CE-B12','V1-CARD-0188','V1-ENT-0300','entity_layer','collection','metadata','SRC-0233','high','candidate_for_staging_review','PRH book page describes a story collection.'),
('V1-FCT-0799','WEB-CE-B12','V1-CARD-0188','V1-ENT-0300','genre_or_form','短篇小说集','bibliographic','SRC-0233','high','candidate_for_staging_review','PRH page identifies the volume as stories/collection.'),
('V1-FCT-0800','WEB-CE-B12','V1-CARD-0189','V1-ENT-0301','entity_layer','collection','metadata','SRC-0231','high','candidate_for_staging_review','Argentina Ministry biography lists Siete casas vacías among Schweblin''s story books.'),
('V1-FCT-0801','WEB-CE-B12','V1-CARD-0189','V1-ENT-0301','genre_or_form','短篇小说集','bibliographic','SRC-0232','high','candidate_for_staging_review','PRH author profile lists Siete casas vacías among Schweblin books; the selected form is a story collection.'),
('V1-FCT-0802','WEB-CE-B12','V1-CARD-0190','V1-ENT-0302','entity_layer','collection','metadata','SRC-0235','high','candidate_for_staging_review','Anagrama notice calls Las cosas que perdimos en el fuego a book of stories.'),
('V1-FCT-0803','WEB-CE-B12','V1-CARD-0190','V1-ENT-0302','first_publication_year','2016','bibliographic','SRC-0235','high','candidate_for_staging_review','Anagrama notice states publication by Anagrama in February 2016.'),
('V1-FCT-0804','WEB-CE-B12','V1-CARD-0190','V1-ENT-0302','genre_or_form','短篇小说集','bibliographic','SRC-0235','high','candidate_for_staging_review','Anagrama notice identifies the book as a collection of stories.'),
('V1-FCT-0805','WEB-CE-B12','V1-CARD-0191','V1-ENT-0303','entity_layer','work','metadata','SRC-0236','high','candidate_for_staging_review','Anagrama identifies Nuestra parte de noche as a novel.'),
('V1-FCT-0806','WEB-CE-B12','V1-CARD-0191','V1-ENT-0303','genre_or_form','小说','bibliographic','SRC-0236','high','candidate_for_staging_review','Publisher page explicitly says novela.'),
('V1-FCT-0807','WEB-CE-B12','V1-CARD-0191','V1-ENT-0303','award_year','2019','bibliographic','SRC-0236','high','candidate_for_staging_review','Anagrama page identifies the Premio Herralde de Novela 2019; this is not asserted as first publication.'),
('V1-FCT-0808','WEB-CE-B12','V1-CARD-0192','V1-ENT-0304','entity_layer','collection','metadata','SRC-0237','high','candidate_for_staging_review','Anagrama page identifies a twelve-story volume.'),
('V1-FCT-0809','WEB-CE-B12','V1-CARD-0192','V1-ENT-0304','genre_or_form','短篇小说集','bibliographic','SRC-0237','high','candidate_for_staging_review','Anagrama page describes twelve cuentos in the volume.'),
('V1-FCT-0810','WEB-CE-B12','V1-CARD-0193','V1-ENT-0305','entity_layer','work','metadata','SRC-0239','high','candidate_for_staging_review','Anagrama lists Bonsái among Zambra''s novels.'),
('V1-FCT-0811','WEB-CE-B12','V1-CARD-0193','V1-ENT-0305','first_publication_year','2006','bibliographic','SRC-0239','high','candidate_for_staging_review','Anagrama author profile gives Bonsái (2006).'),
('V1-FCT-0812','WEB-CE-B12','V1-CARD-0193','V1-ENT-0305','genre_or_form','小说','bibliographic','SRC-0240','high','candidate_for_staging_review','Memoria Chilena article calls Bonsái a novel.'),
('V1-FCT-0813','WEB-CE-B12','V1-CARD-0194','V1-ENT-0306','entity_layer','work','metadata','SRC-0239','high','candidate_for_staging_review','Anagrama lists La vida privada de los árboles among Zambra''s novels.'),
('V1-FCT-0814','WEB-CE-B12','V1-CARD-0194','V1-ENT-0306','first_publication_year','2007','bibliographic','SRC-0239','high','candidate_for_staging_review','Anagrama author profile gives La vida privada de los árboles (2007).'),
('V1-FCT-0815','WEB-CE-B12','V1-CARD-0194','V1-ENT-0306','genre_or_form','小说','bibliographic','SRC-0240','high','candidate_for_staging_review','Memoria Chilena article calls the work a novel.'),
('V1-FCT-0816','WEB-CE-B12','V1-CARD-0195','V1-ENT-0307','entity_layer','work','metadata','SRC-0239','high','candidate_for_staging_review','Anagrama lists Formas de volver a casa among Zambra''s novels.'),
('V1-FCT-0817','WEB-CE-B12','V1-CARD-0195','V1-ENT-0307','first_publication_year','2011','bibliographic','SRC-0239','high','candidate_for_staging_review','Anagrama author profile gives Formas de volver a casa (2011).'),
('V1-FCT-0818','WEB-CE-B12','V1-CARD-0195','V1-ENT-0307','genre_or_form','小说','bibliographic','SRC-0240','high','candidate_for_staging_review','Memoria Chilena article calls Formas de volver a casa a novel.');

INSERT INTO fact_sources (fact_id,source_id,source_title)
SELECT fact_id, origin_id, '' FROM facts WHERE fact_id BETWEEN 'V1-FCT-0786' AND 'V1-FCT-0818';
UPDATE fact_sources SET source_title=(SELECT title FROM sources WHERE sources.source_id=fact_sources.source_id) WHERE fact_id BETWEEN 'V1-FCT-0786' AND 'V1-FCT-0818';

INSERT INTO card_facts (card_id,fact_id,admission_status)
SELECT card_id, fact_id, 'candidate_for_staging_review' FROM facts WHERE fact_id BETWEEN 'V1-FCT-0786' AND 'V1-FCT-0818';

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0368','','V1-CARD-0184','SRC-0231','B','both','yes','yes','SRC-0231','used','NONE'),
('V1-CS-0369','','V1-CARD-0184','SRC-0232','B','both','yes','yes','SRC-0232','used','NONE'),
('V1-CS-0370','','V1-CARD-0185','SRC-0235','B','both','yes','yes','SRC-0235','used','NONE'),
('V1-CS-0371','','V1-CARD-0185','SRC-0236','B','both','yes','yes','SRC-0236','used','NONE'),
('V1-CS-0372','','V1-CARD-0186','SRC-0239','B','both','yes','yes','SRC-0239','used','NONE'),
('V1-CS-0373','','V1-CARD-0186','SRC-0240','B','both','yes','yes','SRC-0240','used','NONE'),
('V1-CS-0374','','V1-CARD-0187','SRC-0231','B','both','yes','yes','SRC-0231','used','NONE'),
('V1-CS-0375','','V1-CARD-0187','SRC-0234','B','both','yes','yes','SRC-0234','used','NONE'),
('V1-CS-0376','','V1-CARD-0188','SRC-0231','B','both','yes','yes','SRC-0231','used','NONE'),
('V1-CS-0377','','V1-CARD-0188','SRC-0233','B','both','yes','yes','SRC-0233','used','NONE'),
('V1-CS-0378','','V1-CARD-0189','SRC-0231','B','both','yes','yes','SRC-0231','used','NONE'),
('V1-CS-0379','','V1-CARD-0189','SRC-0232','B','both','yes','yes','SRC-0232','used','NONE'),
('V1-CS-0380','','V1-CARD-0190','SRC-0235','B','both','yes','yes','SRC-0235','used','NONE'),
('V1-CS-0381','','V1-CARD-0190','SRC-0238','B','both','yes','yes','SRC-0238','used','NONE'),
('V1-CS-0382','','V1-CARD-0191','SRC-0235','B','both','yes','yes','SRC-0235','used','NONE'),
('V1-CS-0383','','V1-CARD-0191','SRC-0236','B','both','yes','yes','SRC-0236','used','NONE'),
('V1-CS-0384','','V1-CARD-0192','SRC-0235','B','both','yes','yes','SRC-0235','used','NONE'),
('V1-CS-0385','','V1-CARD-0192','SRC-0237','B','both','yes','yes','SRC-0237','used','NONE'),
('V1-CS-0386','','V1-CARD-0193','SRC-0239','B','both','yes','yes','SRC-0239','used','NONE'),
('V1-CS-0387','','V1-CARD-0193','SRC-0240','B','both','yes','yes','SRC-0240','used','NONE'),
('V1-CS-0388','','V1-CARD-0194','SRC-0239','B','both','yes','yes','SRC-0239','used','NONE'),
('V1-CS-0389','','V1-CARD-0194','SRC-0240','B','both','yes','yes','SRC-0240','used','NONE'),
('V1-CS-0390','','V1-CARD-0195','SRC-0239','B','both','yes','yes','SRC-0239','used','NONE'),
('V1-CS-0391','','V1-CARD-0195','SRC-0240','B','both','yes','yes','SRC-0240','used','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0224','WEB-CE-B12','CAND-B12-0224','V1-ENT-0296','CREATED','V1-ENT-0299','萨曼塔·施韦布林创作《救援距离》（Distancia de rescate）','high','accepted','WEB-CE-B12','1','NONE'),
('V1-REL-0225','WEB-CE-B12','CAND-B12-0225','V1-ENT-0296','CREATED','V1-ENT-0300','萨曼塔·施韦布林创作《口中之鸟》（Pájaros en la boca）','high','accepted','WEB-CE-B12','1','NONE'),
('V1-REL-0226','WEB-CE-B12','CAND-B12-0226','V1-ENT-0296','CREATED','V1-ENT-0301','萨曼塔·施韦布林创作《七座空屋》（Siete casas vacías）','high','accepted','WEB-CE-B12','1','NONE'),
('V1-REL-0227','WEB-CE-B12','CAND-B12-0227','V1-ENT-0297','CREATED','V1-ENT-0302','玛丽安娜·恩里克斯创作《我们在火中失去的东西》（Las cosas que perdimos en el fuego）','high','accepted','WEB-CE-B12','1','NONE'),
('V1-REL-0228','WEB-CE-B12','CAND-B12-0228','V1-ENT-0297','CREATED','V1-ENT-0303','玛丽安娜·恩里克斯创作《我们的夜晚》（Nuestra parte de noche）','high','accepted','WEB-CE-B12','1','NONE'),
('V1-REL-0229','WEB-CE-B12','CAND-B12-0229','V1-ENT-0297','CREATED','V1-ENT-0304','玛丽安娜·恩里克斯创作《床上吸烟的危险》（Los peligros de fumar en la cama）','high','accepted','WEB-CE-B12','1','NONE'),
('V1-REL-0230','WEB-CE-B12','CAND-B12-0230','V1-ENT-0298','CREATED','V1-ENT-0305','亚历杭德罗·桑布拉创作《盆栽》（Bonsái）','high','accepted','WEB-CE-B12','1','NONE'),
('V1-REL-0231','WEB-CE-B12','CAND-B12-0231','V1-ENT-0298','CREATED','V1-ENT-0306','亚历杭德罗·桑布拉创作《树木的私生活》（La vida privada de los árboles）','high','accepted','WEB-CE-B12','1','NONE'),
('V1-REL-0232','WEB-CE-B12','CAND-B12-0232','V1-ENT-0298','CREATED','V1-ENT-0307','亚历杭德罗·桑布拉创作《回家的方式》（Formas de volver a casa）','high','accepted','WEB-CE-B12','1','NONE'),
('V1-REL-0233','WEB-CE-B12','CAND-B12-0233','V1-ENT-0296','ASSOCIATED_WITH_PLACE','V1-ENT-0001','萨曼塔·施韦布林与阿根廷关联','high','accepted','WEB-CE-B12','1','NONE'),
('V1-REL-0234','WEB-CE-B12','CAND-B12-0234','V1-ENT-0297','ASSOCIATED_WITH_PLACE','V1-ENT-0001','玛丽安娜·恩里克斯与阿根廷关联','high','accepted','WEB-CE-B12','1','NONE'),
('V1-REL-0235','WEB-CE-B12','CAND-B12-0235','V1-ENT-0298','ASSOCIATED_WITH_PLACE','V1-ENT-0123','亚历杭德罗·桑布拉与智利关联','high','accepted','WEB-CE-B12','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0224','SRC-0231'),
('V1-REL-0225','SRC-0231'),
('V1-REL-0226','SRC-0231'),
('V1-REL-0227','SRC-0235'),
('V1-REL-0228','SRC-0236'),
('V1-REL-0229','SRC-0235'),
('V1-REL-0230','SRC-0239'),
('V1-REL-0231','SRC-0239'),
('V1-REL-0232','SRC-0239'),
('V1-REL-0233','SRC-0231'),
('V1-REL-0234','SRC-0235'),
('V1-REL-0235','SRC-0239');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0249','V1-REL-0224','CAND-B12-0224','SRC-0231','','','Argentina Ministry bibliography links Distancia de rescate to Schweblin.','high','eligible_evidence','WEB-CE-B12'),
('V1-EV-0250','V1-REL-0225','CAND-B12-0225','SRC-0231','','','Argentina Ministry biography lists Pájaros en la boca under Schweblin.','high','eligible_evidence','WEB-CE-B12'),
('V1-EV-0251','V1-REL-0226','CAND-B12-0226','SRC-0231','','','Argentina Ministry biography lists Siete casas vacías under Schweblin.','high','eligible_evidence','WEB-CE-B12'),
('V1-EV-0252','V1-REL-0227','CAND-B12-0227','SRC-0235','','','Anagrama notice identifies Las cosas que perdimos en el fuego as an Enriquez story book.','high','eligible_evidence','WEB-CE-B12'),
('V1-EV-0253','V1-REL-0228','CAND-B12-0228','SRC-0236','','','Anagrama book page identifies Nuestra parte de noche under Enriquez.','high','eligible_evidence','WEB-CE-B12'),
('V1-EV-0254','V1-REL-0229','CAND-B12-0229','SRC-0235','','','Anagrama notice and book page identify Los peligros de fumar en la cama under Enriquez.','high','eligible_evidence','WEB-CE-B12'),
('V1-EV-0255','V1-REL-0230','CAND-B12-0230','SRC-0240','','impreso p. 91; PDF p. 79','Mapocho article lists Bonsái in the Zambra chronology; Anagrama supplies the author bibliography.','high','eligible_evidence','WEB-CE-B12'),
('V1-EV-0256','V1-REL-0231','CAND-B12-0231','SRC-0240','','impreso p. 91; PDF p. 79','Mapocho article lists La vida privada de los árboles in the Zambra chronology; Anagrama supplies the author bibliography.','high','eligible_evidence','WEB-CE-B12'),
('V1-EV-0257','V1-REL-0232','CAND-B12-0232','SRC-0240','','impreso p. 91; PDF p. 79','Mapocho article lists Formas de volver a casa in the Zambra chronology; Anagrama supplies the author bibliography.','high','eligible_evidence','WEB-CE-B12'),
('V1-EV-0258','V1-REL-0233','CAND-B12-0233','SRC-0231','','','Argentina Ministry biography identifies Schweblin in Argentine literary context.','high','eligible_evidence','WEB-CE-B12'),
('V1-EV-0259','V1-REL-0234','CAND-B12-0234','SRC-0235','','','Anagrama notice calls Enriquez an Argentine writer.','high','eligible_evidence','WEB-CE-B12'),
('V1-EV-0260','V1-REL-0235','CAND-B12-0235','SRC-0239','','','Anagrama author profile identifies Zambra as Santiago de Chile.','high','eligible_evidence','WEB-CE-B12');

UPDATE relationship_evidence SET source_title=(SELECT title FROM sources WHERE sources.source_id=relationship_evidence.source_id) WHERE evidence_id BETWEEN 'V1-EV-0249' AND 'V1-EV-0260';

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0230','SRC-0240'),
('V1-REL-0231','SRC-0240'),
('V1-REL-0232','SRC-0240');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0017','B12-GAP-01-0300','research_gap','V1-ENT-0300.first_publication_year','open_research','SRC-0231 and SRC-0233 establish title and story-collection form but not original first publication year.','1','SOL_REVIEW','Do not display an uncontested first-publication year; retain work and form in review package.','RESEARCH-GAP'),
('V1-GAP-0018','B12-GAP-01-0301','research_gap','V1-ENT-0301.first_publication_year','open_research','SRC-0231 and SRC-0232 establish title and story-collection form but not original first publication year.','1','SOL_REVIEW','Do not display an uncontested first-publication year; retain work and form in review package.','RESEARCH-GAP'),
('V1-GAP-0019','B12-GAP-01-0304','research_gap','V1-ENT-0304.first_publication_year','open_research','SRC-0235 and SRC-0237 establish an earlier story collection and form but not original first publication year.','1','SOL_REVIEW','Do not display an uncontested first-publication year; retain work and form in review package.','RESEARCH-GAP'),
('V1-GAP-0020','B12-GAP-02-0303','research_gap','V1-ENT-0303.first_publication_year','open_research','SRC-0236 establishes novel form and the 2019 Herralde award, not first publication year.','1','SOL_REVIEW','Keep 2019 as award year only; do not display it as an uncontested first-publication year.','RESEARCH-GAP'),
('V1-GAP-0021','B12-GAP-03-0299','bibliographic_hold','V1-ENT-0299.first_publication_year','open_research','SRC-0231 marks ©2014 and SRC-0234 identifies the first-novel form; neither source states first publication.','1','SOL_REVIEW','Keep copyright year separate and do not display an uncontested first-publication year.','HOLD-YEAR');

INSERT INTO metadata (key,value) VALUES ('last_change_set','WEB-CE-B12') ON CONFLICT(key) DO UPDATE SET value=excluded.value;
UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';
