-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: wcd10_b01_review

-- Registration sha256: 0d55735033930f5914c5fe4e78f2437ed0e94fef3d914e3788ffd88cd4658bae

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1149 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 613 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 315 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 409 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 407 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 1246 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1170 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 98 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 38 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 422 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 451 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 376 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 378 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B03' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0381' OR canonical_url='https://www.memoriachilena.gob.cl/602/w3-article-97418.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0382' OR canonical_url='https://www.memoriachilena.gob.cl/602/w3-article-92668.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0383' OR canonical_url='https://www.curriculumnacional.cl/recursos/cien-sonetos-amor') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0384' OR canonical_url='https://www.memoriachilena.gob.cl/602/w3-article-96353.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0385' OR canonical_url='https://www.memoriachilena.gob.cl/602/w3-article-100859.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0386' OR canonical_url='https://editoriallosada.com/libro/los-versos-del-capitan/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0387' OR canonical_url='https://www.memoriachilena.gob.cl/602/w3-article-94082.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0388' OR canonical_url='https://www.memoriachilena.gob.cl/602/w3-article-100844.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0389' OR canonical_url='https://www.memoriachilena.gob.cl/602/w3-article-3655.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0390' OR canonical_url='https://www.agenciabalcells.com/en/authors/works/carlos-fuentes/los-dias-enmascarados/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0391' OR canonical_url='https://www.agenciabalcells.com/autores/obra/carlos-fuentes/las-buenas-conciencias/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0392' OR canonical_url='https://www.agenciabalcells.com/autores/obra/carlos-fuentes/gringo-viejo/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0393' OR canonical_url='https://www.agenciabalcells.com/autores/obra/carlos-fuentes/cristobal-nonato/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0394' OR canonical_url='https://www.neruda.uchile.cl/critica/hloyolamodos.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0412' OR (entity_type='collection' AND original_name='Crepusculario')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0413' OR (entity_type='collection' AND original_name='Odas elementales')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0414' OR (entity_type='collection' AND original_name='Los versos del capitán')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0415' OR (entity_type='collection' AND original_name='Los días enmascarados')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0416' OR (entity_type='work' AND original_name='Las buenas conciencias')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0417' OR (entity_type='work' AND original_name='Gringo viejo')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0418' OR (entity_type='work' AND original_name='Cristóbal Nonato')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0419' OR (entity_type='collection' AND original_name='Lagar')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0420' OR (entity_type='collection' AND original_name='Poema de Chile')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1177' OR (subject_id='V1-ENT-0412' AND fact_field='first_publication_year' AND value_text='1923')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1178' OR (subject_id='V1-ENT-0412' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1179' OR (subject_id='V1-ENT-0412' AND fact_field='one_sentence_summary' AND value_text='据智利国家图书馆介绍，初版由五部分组成，呈现聂鲁达早期诗歌；1926年版调整了编排。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1180' OR (subject_id='V1-ENT-0413' AND fact_field='first_publication_year' AND value_text='1954')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1181' OR (subject_id='V1-ENT-0413' AND fact_field='genre_or_form' AND value_text='诗集（颂歌）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1182' OR (subject_id='V1-ENT-0413' AND fact_field='one_sentence_summary' AND value_text='据智利国家图书馆介绍，诗集以颂歌书写书籍、海洋、食物等日常事物，把亲密生活与外部世界相联。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1183' OR (subject_id='V1-ENT-0414' AND fact_field='first_publication_year' AND value_text='1952')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1184' OR (subject_id='V1-ENT-0414' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1185' OR (subject_id='V1-ENT-0414' AND fact_field='one_sentence_summary' AND value_text='据洛萨达出版社介绍，这部起初未署作者姓名的诗集将爱情的亲密表达与革命热情相联。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1186' OR (subject_id='V1-ENT-0415' AND fact_field='first_publication_year' AND value_text='1954')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1187' OR (subject_id='V1-ENT-0415' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1188' OR (subject_id='V1-ENT-0415' AND fact_field='one_sentence_summary' AND value_text='据作者代理目录，书中收录六篇带有幻想色彩的故事。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1189' OR (subject_id='V1-ENT-0416' AND fact_field='first_publication_year' AND value_text='1959')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1190' OR (subject_id='V1-ENT-0416' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1191' OR (subject_id='V1-ENT-0416' AND fact_field='story_premise' AND value_text='少年海梅·塞瓦略斯在青春冲动、基督教道德、家族等级与独立愿望之间，面临决定人生方向的抉择。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1192' OR (subject_id='V1-ENT-0417' AND fact_field='first_publication_year' AND value_text='1985')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1193' OR (subject_id='V1-ENT-0417' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1194' OR (subject_id='V1-ENT-0417' AND fact_field='story_premise' AND value_text='小说想象作家兼记者安布罗斯·比尔斯在墨西哥革命期间越过边境，进入比利亚军队控制地区并寻找自身命运的旅程。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1195' OR (subject_id='V1-ENT-0418' AND fact_field='first_publication_year' AND value_text='1987')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1196' OR (subject_id='V1-ENT-0418' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1197' OR (subject_id='V1-ENT-0418' AND fact_field='story_premise' AND value_text='在污染严重、政治操纵无处不在的虚构城市Makesicko City，尚在母腹中的克里斯托瓦尔思考是否值得出生，外界正举行指定时刻降生婴儿的竞赛。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1198' OR (subject_id='V1-ENT-0419' AND fact_field='first_publication_year' AND value_text='1954')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1199' OR (subject_id='V1-ENT-0419' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1200' OR (subject_id='V1-ENT-0419' AND fact_field='one_sentence_summary' AND value_text='据智利国家图书馆介绍，1954年诗集包含十三部分、七十四首诗，以《另一个》开篇，以《最后的树》收束；部分诗此前已单独发表。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1201' OR (subject_id='V1-ENT-0420' AND fact_field='first_publication_year' AND value_text='1967')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1202' OR (subject_id='V1-ENT-0420' AND fact_field='genre_or_form' AND value_text='诗集（身后编辑出版）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1203' OR (subject_id='V1-ENT-0420' AND fact_field='one_sentence_summary' AND value_text='据智利国家图书馆的叙事概述，幽灵般的加夫列拉、阿塔卡马儿童与小鹿结伴从北向南穿行智利，对话沿途的自然与自身处境。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1204' OR (subject_id='V1-ENT-0420' AND fact_field='bibliographic_note' AND value_text='1967年由Doris Dana整理身后出版，收77首诗；2015年扩编版收131首，篇数不适用于所有版本。首版出版城市仍待核。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1205' OR (subject_id='V1-ENT-0120' AND fact_field='first_publication_year' AND value_text='1933')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1206' OR (subject_id='V1-ENT-0120' AND fact_field='bibliographic_note' AND value_text='首部Residencia en la tierra（1925–1931）1933年出版；1935年版扩展至1925–1935；Tercera residencia（1935–1945）1947年另行出版，不能把写作期当成出版年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1207' OR (subject_id='V1-ENT-0120' AND fact_field='one_sentence_summary' AND value_text='据智利国家图书馆介绍，这组跨时期的诗歌在智利、阿根廷、亚洲与西班牙的经历间展开，交错本土经验与异域感受；各部写作及出版时间不同。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1208' OR (subject_id='V1-ENT-0122' AND fact_field='first_book_edition_year' AND value_text='1947')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1209' OR (subject_id='V1-ENT-0122' AND fact_field='genre_or_form' AND value_text='长诗（组诗）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1210' OR (subject_id='V1-ENT-0122' AND fact_field='bibliographic_note' AND value_text='Alturas de Macchu Picchu有1947年独立书版，后收入1950年Canto general；首次期刊发表年仍待核，不能由独立书版或写作年反推。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1211' OR (subject_id='V1-ENT-0122' AND fact_field='research_note' AND value_text='据埃尔南·洛约拉的读法，诗的前五节回顾孤独、死亡与瓦解的经验，后七节转向马丘比丘劳动者的过去，并把个人的声音连向美洲共同生活。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1212' OR (subject_id='V1-ENT-0122' AND fact_field='one_sentence_summary' AND value_text='这首诗由十二节构成，有1947年独立书版，后收入1950年出版的《漫歌》；诗章与整个诗集保持独立对象。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1213' OR (subject_id='V1-ENT-0165' AND fact_field='first_publication_year' AND value_text='1959')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1214' OR (subject_id='V1-ENT-0165' AND fact_field='one_sentence_summary' AND value_text='据智利教育部课程资源介绍，诗集不拘于传统十四行诗的固定节律，以身体与自然元素的意象书写爱情经验。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1215' OR (subject_id='V1-ENT-0149' AND fact_field='one_sentence_summary' AND value_text='据智利国家图书馆介绍，1922年初版分为七部分：五部分诗歌与两部分散文，包含生活、学校、儿童、痛苦与自然等编排。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0379' OR (subject_id='V1-ENT-0115' AND relation_type='CREATED' AND object_id='V1-ENT-0412')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0380' OR (subject_id='V1-ENT-0115' AND relation_type='CREATED' AND object_id='V1-ENT-0413')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0381' OR (subject_id='V1-ENT-0115' AND relation_type='CREATED' AND object_id='V1-ENT-0414')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0382' OR (subject_id='V1-ENT-0145' AND relation_type='CREATED' AND object_id='V1-ENT-0415')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0383' OR (subject_id='V1-ENT-0145' AND relation_type='CREATED' AND object_id='V1-ENT-0416')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0384' OR (subject_id='V1-ENT-0145' AND relation_type='CREATED' AND object_id='V1-ENT-0417')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0385' OR (subject_id='V1-ENT-0145' AND relation_type='CREATED' AND object_id='V1-ENT-0418')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0386' OR (subject_id='V1-ENT-0148' AND relation_type='CREATED' AND object_id='V1-ENT-0419')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0387' OR (subject_id='V1-ENT-0148' AND relation_type='CREATED' AND object_id='V1-ENT-0420')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0388' OR (subject_id='V1-ENT-0417' AND relation_type='SET_IN' AND object_id='V1-ENT-0051')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0381','WCD10-B04-S02','Residencia en la tierra','Residencia en la tierra','Memoria Chilena / Biblioteca Nacional de Chile','','Biblioteca Nacional de Chile','','','institutional_commentary','','es','B','access_pass','WCD-10-B04','metadata_and_summary','remote_only','','https://www.memoriachilena.gob.cl/602/w3-article-97418.html'),
('SRC-0382','WCD10-B04-S03','Canto General','Canto General','Memoria Chilena / Biblioteca Nacional de Chile','','Biblioteca Nacional de Chile','','','institutional_commentary','','es','B','access_pass','WCD-10-B04','metadata_and_summary','remote_only','','https://www.memoriachilena.gob.cl/602/w3-article-92668.html'),
('SRC-0383','WCD10-B04-S04','Cien sonetos de amor','Cien sonetos de amor','Unidad de Currículum y Evaluación / Ministerio de Educación de Chile','','Ministerio de Educación de Chile','','','institutional_educational_resource','','es','B','access_pass','WCD-10-B04','metadata_and_summary','remote_only','','https://www.curriculumnacional.cl/recursos/cien-sonetos-amor'),
('SRC-0384','WCD10-B04-S05','Crepusculario','Crepusculario','Memoria Chilena / Biblioteca Nacional de Chile','','Biblioteca Nacional de Chile','','','institutional_commentary','','es','B','access_pass','WCD-10-B04','metadata_and_summary','remote_only','','https://www.memoriachilena.gob.cl/602/w3-article-96353.html'),
('SRC-0385','WCD10-B04-S06','Odas Elementales','Odas Elementales','Memoria Chilena / Biblioteca Nacional de Chile','','Biblioteca Nacional de Chile','','','institutional_commentary','','es','B','access_pass','WCD-10-B04','metadata_and_summary','remote_only','','https://www.memoriachilena.gob.cl/602/w3-article-100859.html'),
('SRC-0386','WCD10-B04-S07','Los versos del Capitán','Los versos del Capitán','Editorial Losada','','Editorial Losada','','9789500306171','publisher_catalog','','es','B','access_pass','WCD-10-B04','metadata_and_summary','remote_only','','https://editoriallosada.com/libro/los-versos-del-capitan/'),
('SRC-0387','WCD10-B04-S08','Desolación (1922)','Desolación (1922)','Memoria Chilena / Biblioteca Nacional de Chile','','Biblioteca Nacional de Chile','','','institutional_commentary','','es','B','access_pass','WCD-10-B04','metadata_and_summary','remote_only','','https://www.memoriachilena.gob.cl/602/w3-article-94082.html'),
('SRC-0388','WCD10-B04-S09','Lagar (1954)','Lagar (1954)','Memoria Chilena / Biblioteca Nacional de Chile','','Biblioteca Nacional de Chile','','','institutional_commentary','','es','B','access_pass','WCD-10-B04','metadata_and_summary','remote_only','','https://www.memoriachilena.gob.cl/602/w3-article-100844.html'),
('SRC-0389','WCD10-B04-S10','Poema de Chile (1967)','Poema de Chile (1967)','Memoria Chilena / Biblioteca Nacional de Chile','','Biblioteca Nacional de Chile','','','institutional_commentary','','es','B','access_pass','WCD-10-B04','metadata_and_summary','remote_only','','https://www.memoriachilena.gob.cl/602/w3-article-3655.html'),
('SRC-0390','WCD10-B04-S11','Los días enmascarados','Los días enmascarados','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','agency_work_catalog','','en/es','B','access_pass','WCD-10-B04','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/en/authors/works/carlos-fuentes/los-dias-enmascarados/'),
('SRC-0391','WCD10-B04-S12','Las buenas conciencias','Las buenas conciencias','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','agency_work_catalog','','es','B','access_pass','WCD-10-B04','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/autores/obra/carlos-fuentes/las-buenas-conciencias/'),
('SRC-0392','WCD10-B04-S13','Gringo viejo','Gringo viejo','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','agency_work_catalog','','es','B','access_pass','WCD-10-B04','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/autores/obra/carlos-fuentes/gringo-viejo/'),
('SRC-0393','WCD10-B04-S14','Cristóbal Nonato','Cristóbal Nonato','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','agency_work_catalog','','es','B','access_pass','WCD-10-B04','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/autores/obra/carlos-fuentes/cristobal-nonato/'),
('SRC-0394','WCD10-B04-S15','Los Modos de Autorreferencia en la Obra de Pablo Neruda','Los Modos de Autorreferencia en la Obra de Pablo Neruda','Hernán Loyola / Universidad de Chile (reproducción)','','Universidad de Chile','','','scholarly_lecture_reproduction','','es','B','access_pass','WCD-10-B04','metadata_and_summary','remote_only','','https://www.neruda.uchile.cl/critica/hloyolamodos.html');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0412','collection','黄昏集','Crepusculario','candidate','1','WCD10-B04-W01','补1923首部诗集，不创建1926重编版新作品。; 中文为候选显示暂译，未核实正式中文译本；原题为身份锚点。单篇/合集/再版分层。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0413','collection','元素颂歌','Odas elementales','candidate','1','WCD10-B04-W02','补1954诗集，与1956/1957续集分开。; 中文为候选显示暂译，未核实正式中文译本；原题为身份锚点。单篇/合集/再版分层。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0414','collection','船长的诗','Los versos del capitán','candidate','1','WCD10-B04-W03','补1952匿名初版诗集，不混同1963署名版或影视改编。; 中文为候选显示暂译，未核实正式中文译本；原题为身份锚点。单篇/合集/再版分层。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0415','collection','戴面具的日子','Los días enmascarados','candidate','1','WCD10-B04-W04','补1954六篇合集，不能以其中Chac Mool单篇替代。; 中文为候选显示暂译，未核实正式中文译本；原题为身份锚点。单篇/合集/再版分层。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0416','work','好良心','Las buenas conciencias','candidate','1','WCD10-B04-W05','补1959小说对象；少年伦理冲突保留文学边界。; 中文为候选显示暂译，未核实正式中文译本；原题为身份锚点。单篇/合集/再版分层。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0417','work','老美国佬','Gringo viejo','candidate','1','WCD10-B04-W06','补1985小说，只确认目录直接支持的文学背景。; 中文为候选显示暂译，未核实正式中文译本；原题为身份锚点。单篇/合集/再版分层。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0418','work','未出生的克里斯托瓦尔','Cristóbal Nonato','candidate','1','WCD10-B04-W07','补1987胎儿叙述小说，虚构城市不新增现实地理事实。; 中文为候选显示暂译，未核实正式中文译本；原题为身份锚点。单篇/合集/再版分层。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0419','collection','压榨场','Lagar','candidate','1','WCD10-B04-W08','补1954诗集，不把个别诗的先刊或Lagar II并为本书首年。; 中文为候选显示暂译，未核实正式中文译本；原题为身份锚点。单篇/合集/再版分层。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0420','collection','智利之诗','Poema de Chile','candidate','1','WCD10-B04-W09','补1967身后出版集合，77诗仅属Doris Dana整理版。; 中文为候选显示暂译，未核实正式中文译本；原题为身份锚点。单篇/合集/再版分层。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0408','WCD10-B04-W01','WCD-10-B04','WCD10-B04-W01','V1-ENT-0412','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0409','WCD10-B04-W02','WCD-10-B04','WCD10-B04-W02','V1-ENT-0413','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0410','WCD10-B04-W03','WCD-10-B04','WCD10-B04-W03','V1-ENT-0414','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0411','WCD10-B04-W04','WCD-10-B04','WCD10-B04-W04','V1-ENT-0415','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0412','WCD10-B04-W05','WCD-10-B04','WCD10-B04-W05','V1-ENT-0416','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0413','WCD10-B04-W06','WCD-10-B04','WCD10-B04-W06','V1-ENT-0417','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0414','WCD10-B04-W07','WCD-10-B04','WCD10-B04-W07','V1-ENT-0418','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0415','WCD10-B04-W08','WCD-10-B04','WCD10-B04-W08','V1-ENT-0419','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0416','WCD10-B04-W09','WCD-10-B04','WCD10-B04-W09','V1-ENT-0420','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0316','WCD-10-B04:V1-ENT-0412','V1-ENT-0412','collection','黄昏集','巴勃罗·聂鲁达','Crepusculario','智利','es','1923','诗集','WCD-10-B04','research_gap','RESEARCH-ONLY-NOT-CURATED','### 黄昏集｜Crepusculario

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1923
- genre_or_form：诗集
- one_sentence_summary：据智利国家图书馆介绍，初版由五部分组成，呈现聂鲁达早期诗歌；1926年版调整了编排。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0317','WCD-10-B04:V1-ENT-0413','V1-ENT-0413','collection','元素颂歌','巴勃罗·聂鲁达','Odas elementales','智利','es','1954','诗集（颂歌）','WCD-10-B04','research_gap','RESEARCH-ONLY-NOT-CURATED','### 元素颂歌｜Odas elementales

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1954
- genre_or_form：诗集（颂歌）
- one_sentence_summary：据智利国家图书馆介绍，诗集以颂歌书写书籍、海洋、食物等日常事物，把亲密生活与外部世界相联。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0318','WCD-10-B04:V1-ENT-0414','V1-ENT-0414','collection','船长的诗','巴勃罗·聂鲁达','Los versos del capitán','智利','es','1952','诗集','WCD-10-B04','research_gap','RESEARCH-ONLY-NOT-CURATED','### 船长的诗｜Los versos del capitán

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1952
- genre_or_form：诗集
- one_sentence_summary：据洛萨达出版社介绍，这部起初未署作者姓名的诗集将爱情的亲密表达与革命热情相联。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0319','WCD-10-B04:V1-ENT-0415','V1-ENT-0415','collection','戴面具的日子','卡洛斯·富恩特斯','Los días enmascarados','墨西哥','es','1954','短篇小说集','WCD-10-B04','research_gap','RESEARCH-ONLY-NOT-CURATED','### 戴面具的日子｜Los días enmascarados

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1954
- genre_or_form：短篇小说集
- one_sentence_summary：据作者代理目录，书中收录六篇带有幻想色彩的故事。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0320','WCD-10-B04:V1-ENT-0416','V1-ENT-0416','work','好良心','卡洛斯·富恩特斯','Las buenas conciencias','墨西哥','es','1959','小说','WCD-10-B04','research_gap','RESEARCH-ONLY-NOT-CURATED','### 好良心｜Las buenas conciencias

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1959
- genre_or_form：小说
- story_premise：少年海梅·塞瓦略斯在青春冲动、基督教道德、家族等级与独立愿望之间，面临决定人生方向的抉择。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0321','WCD-10-B04:V1-ENT-0417','V1-ENT-0417','work','老美国佬','卡洛斯·富恩特斯','Gringo viejo','墨西哥','es','1985','小说','WCD-10-B04','research_gap','RESEARCH-ONLY-NOT-CURATED','### 老美国佬｜Gringo viejo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1985
- genre_or_form：小说
- story_premise：小说想象作家兼记者安布罗斯·比尔斯在墨西哥革命期间越过边境，进入比利亚军队控制地区并寻找自身命运的旅程。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0322','WCD-10-B04:V1-ENT-0418','V1-ENT-0418','work','未出生的克里斯托瓦尔','卡洛斯·富恩特斯','Cristóbal Nonato','墨西哥','es','1987','小说','WCD-10-B04','research_gap','RESEARCH-ONLY-NOT-CURATED','### 未出生的克里斯托瓦尔｜Cristóbal Nonato

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1987
- genre_or_form：小说
- story_premise：在污染严重、政治操纵无处不在的虚构城市Makesicko City，尚在母腹中的克里斯托瓦尔思考是否值得出生，外界正举行指定时刻降生婴儿的竞赛。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0323','WCD-10-B04:V1-ENT-0419','V1-ENT-0419','collection','压榨场','加夫列拉·米斯特拉尔','Lagar','智利','es','1954','诗集','WCD-10-B04','research_gap','RESEARCH-ONLY-NOT-CURATED','### 压榨场｜Lagar

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1954
- genre_or_form：诗集
- one_sentence_summary：据智利国家图书馆介绍，1954年诗集包含十三部分、七十四首诗，以《另一个》开篇，以《最后的树》收束；部分诗此前已单独发表。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0324','WCD-10-B04:V1-ENT-0420','V1-ENT-0420','collection','智利之诗','加夫列拉·米斯特拉尔','Poema de Chile','智利','es','1967','诗集（身后编辑出版）','WCD-10-B04','research_gap','RESEARCH-ONLY-NOT-CURATED','### 智利之诗｜Poema de Chile

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1967
- genre_or_form：诗集（身后编辑出版）
- one_sentence_summary：据智利国家图书馆的叙事概述，幽灵般的加夫列拉、阿塔卡马儿童与小鹿结伴从北向南穿行智利，对话沿途的自然与自身处境。
- bibliographic_note：1967年由Doris Dana整理身后出版，收77首诗；2015年扩编版收131首，篇数不适用于所有版本。首版出版城市仍待核。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0325','WCD-10-B04:V1-ENT-0120','V1-ENT-0120','collection','《大地上的居所》','巴勃罗·聂鲁达','Residencia en la tierra','智利','es','1933','','WCD-10-B04','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《大地上的居所》｜Residencia en la tierra

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1933
- bibliographic_note：首部Residencia en la tierra（1925–1931）1933年出版；1935年版扩展至1925–1935；Tercera residencia（1935–1945）1947年另行出版，不能把写作期当成出版年。
- one_sentence_summary：据智利国家图书馆介绍，这组跨时期的诗歌在智利、阿根廷、亚洲与西班牙的经历间展开，交错本土经验与异域感受；各部写作及出版时间不同。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0326','WCD-10-B04:V1-ENT-0122','V1-ENT-0122','work','《马丘比丘高地》','巴勃罗·聂鲁达','Alturas de Macchu Picchu','智利','es','','长诗（组诗）','WCD-10-B04','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《马丘比丘高地》｜Alturas de Macchu Picchu

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_book_edition_year：1947
- genre_or_form：长诗（组诗）
- bibliographic_note：Alturas de Macchu Picchu有1947年独立书版，后收入1950年Canto general；首次期刊发表年仍待核，不能由独立书版或写作年反推。
- one_sentence_summary：这首诗由十二节构成，有1947年独立书版，后收入1950年出版的《漫歌》；诗章与整个诗集保持独立对象。

#### 署名研究说明（research_note_only）

- 据埃尔南·洛约拉的读法，诗的前五节回顾孤独、死亡与瓦解的经验，后七节转向马丘比丘劳动者的过去，并把个人的声音连向美洲共同生活。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0327','WCD-10-B04:V1-ENT-0165','V1-ENT-0165','collection','《一百首爱情十四行诗》','巴勃罗·聂鲁达','Cien sonetos de amor','智利','es','1959','','WCD-10-B04','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《一百首爱情十四行诗》｜Cien sonetos de amor

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1959
- one_sentence_summary：据智利教育部课程资源介绍，诗集不拘于传统十四行诗的固定节律，以身体与自然元素的意象书写爱情经验。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0328','WCD-10-B04:V1-ENT-0149','V1-ENT-0149','collection','《绝望集》','加夫列拉·米斯特拉尔','Desolación','智利','es','','','WCD-10-B04','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《绝望集》｜Desolación

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：据智利国家图书馆介绍，1922年初版分为七部分：五部分诗歌与两部分散文，包含生活、学校、儿童、痛苦与自然等编排。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-1177','WCD10-B04-W01-F01','V1-CARD-0316','V1-ENT-0412','first_publication_year','1923','bibliographic','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1178','WCD10-B04-W01-F02','V1-CARD-0316','V1-ENT-0412','genre_or_form','诗集','bibliographic','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1179','WCD10-B04-W01-F03','V1-CARD-0316','V1-ENT-0412','one_sentence_summary','据智利国家图书馆介绍，初版由五部分组成，呈现聂鲁达早期诗歌；1926年版调整了编排。','institutional_paraphrase','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1180','WCD10-B04-W02-F01','V1-CARD-0317','V1-ENT-0413','first_publication_year','1954','bibliographic','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1181','WCD10-B04-W02-F02','V1-CARD-0317','V1-ENT-0413','genre_or_form','诗集（颂歌）','bibliographic','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1182','WCD10-B04-W02-F03','V1-CARD-0317','V1-ENT-0413','one_sentence_summary','据智利国家图书馆介绍，诗集以颂歌书写书籍、海洋、食物等日常事物，把亲密生活与外部世界相联。','institutional_paraphrase','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1183','WCD10-B04-W03-F01','V1-CARD-0318','V1-ENT-0414','first_publication_year','1952','bibliographic','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1184','WCD10-B04-W03-F02','V1-CARD-0318','V1-ENT-0414','genre_or_form','诗集','bibliographic','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1185','WCD10-B04-W03-F03','V1-CARD-0318','V1-ENT-0414','one_sentence_summary','据洛萨达出版社介绍，这部起初未署作者姓名的诗集将爱情的亲密表达与革命热情相联。','institutional_paraphrase','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1186','WCD10-B04-W04-F01','V1-CARD-0319','V1-ENT-0415','first_publication_year','1954','bibliographic','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1187','WCD10-B04-W04-F02','V1-CARD-0319','V1-ENT-0415','genre_or_form','短篇小说集','bibliographic','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1188','WCD10-B04-W04-F03','V1-CARD-0319','V1-ENT-0415','one_sentence_summary','据作者代理目录，书中收录六篇带有幻想色彩的故事。','institutional_paraphrase','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1189','WCD10-B04-W05-F01','V1-CARD-0320','V1-ENT-0416','first_publication_year','1959','bibliographic','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1190','WCD10-B04-W05-F02','V1-CARD-0320','V1-ENT-0416','genre_or_form','小说','bibliographic','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1191','WCD10-B04-W05-F03','V1-CARD-0320','V1-ENT-0416','story_premise','少年海梅·塞瓦略斯在青春冲动、基督教道德、家族等级与独立愿望之间，面临决定人生方向的抉择。','institutional_paraphrase','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1192','WCD10-B04-W06-F01','V1-CARD-0321','V1-ENT-0417','first_publication_year','1985','bibliographic','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1193','WCD10-B04-W06-F02','V1-CARD-0321','V1-ENT-0417','genre_or_form','小说','bibliographic','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1194','WCD10-B04-W06-F03','V1-CARD-0321','V1-ENT-0417','story_premise','小说想象作家兼记者安布罗斯·比尔斯在墨西哥革命期间越过边境，进入比利亚军队控制地区并寻找自身命运的旅程。','institutional_paraphrase','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1195','WCD10-B04-W07-F01','V1-CARD-0322','V1-ENT-0418','first_publication_year','1987','bibliographic','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1196','WCD10-B04-W07-F02','V1-CARD-0322','V1-ENT-0418','genre_or_form','小说','bibliographic','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1197','WCD10-B04-W07-F03','V1-CARD-0322','V1-ENT-0418','story_premise','在污染严重、政治操纵无处不在的虚构城市Makesicko City，尚在母腹中的克里斯托瓦尔思考是否值得出生，外界正举行指定时刻降生婴儿的竞赛。','institutional_paraphrase','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1198','WCD10-B04-W08-F01','V1-CARD-0323','V1-ENT-0419','first_publication_year','1954','bibliographic','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1199','WCD10-B04-W08-F02','V1-CARD-0323','V1-ENT-0419','genre_or_form','诗集','bibliographic','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1200','WCD10-B04-W08-F03','V1-CARD-0323','V1-ENT-0419','one_sentence_summary','据智利国家图书馆介绍，1954年诗集包含十三部分、七十四首诗，以《另一个》开篇，以《最后的树》收束；部分诗此前已单独发表。','institutional_paraphrase','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1201','WCD10-B04-W09-F01','V1-CARD-0324','V1-ENT-0420','first_publication_year','1967','bibliographic','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1202','WCD10-B04-W09-F02','V1-CARD-0324','V1-ENT-0420','genre_or_form','诗集（身后编辑出版）','bibliographic','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1203','WCD10-B04-W09-F03','V1-CARD-0324','V1-ENT-0420','one_sentence_summary','据智利国家图书馆的叙事概述，幽灵般的加夫列拉、阿塔卡马儿童与小鹿结伴从北向南穿行智利，对话沿途的自然与自身处境。','institutional_paraphrase','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1204','WCD10-B04-W09-F04','V1-CARD-0324','V1-ENT-0420','bibliographic_note','1967年由Doris Dana整理身后出版，收77首诗；2015年扩编版收131首，篇数不适用于所有版本。首版出版城市仍待核。','bibliographic_note','WCD-10-B04','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1205','WCD10-B04-F01','V1-CARD-0325','V1-ENT-0120','first_publication_year','1933','bibliographic','WCD-10-B04','high','batch_retained_candidate','指首部1925–1931诗歌的初版；1935扩编/1947 Tercera单列说明，不改旧事实。'),
('V1-FCT-1206','WCD10-B04-F02','V1-CARD-0325','V1-ENT-0120','bibliographic_note','首部Residencia en la tierra（1925–1931）1933年出版；1935年版扩展至1925–1935；Tercera residencia（1935–1945）1947年另行出版，不能把写作期当成出版年。','bibliographic_note','WCD-10-B04','high','batch_retained_candidate','追加版本说明，不覆盖旧bibliographic_scope_note及研究待补历史措辞，不自动新建第三部对象。'),
('V1-FCT-1207','WCD10-B04-F03','V1-CARD-0325','V1-ENT-0120','one_sentence_summary','据智利国家图书馆介绍，这组跨时期的诗歌在智利、阿根廷、亚洲与西班牙的经历间展开，交错本土经验与异域感受；各部写作及出版时间不同。','institutional_paraphrase','WCD-10-B04','high','batch_retained_candidate','归属明确的机构描述，不作为新的独立A级研究或社会政治主题关系。'),
('V1-FCT-1208','WCD10-B04-F04','V1-CARD-0326','V1-ENT-0122','first_book_edition_year','1947','bibliographic','WCD-10-B04','high','batch_retained_candidate','只核实独立书版，不把1945写作年/1950总集收录年充作首刊。CVC与智利大学书目出版者信息有差异，出版社不准入。'),
('V1-FCT-1209','WCD10-B04-F05','V1-CARD-0326','V1-ENT-0122','genre_or_form','长诗（组诗）','bibliographic','WCD-10-B04','high','batch_retained_candidate','保持旧work层级；诗的十二节不是十二部作品，不改collection或小说。'),
('V1-FCT-1210','WCD10-B04-F06','V1-CARD-0326','V1-ENT-0122','bibliographic_note','Alturas de Macchu Picchu有1947年独立书版，后收入1950年Canto general；首次期刊发表年仍待核，不能由独立书版或写作年反推。','bibliographic_note','WCD-10-B04','high','batch_retained_candidate','Loyola讲演称1946发表但未核实首刊载体；保留明确gap，不使用原子first_publication_year。'),
('V1-FCT-1211','WCD10-B04-F07','V1-CARD-0326','V1-ENT-0122','research_note','据埃尔南·洛约拉的读法，诗的前五节回顾孤独、死亡与瓦解的经验，后七节转向马丘比丘劳动者的过去，并把个人的声音连向美洲共同生活。','scholarly_paraphrase','WCD-10-B04','high','research_note_only','仅署名研究释义；相关正文已读，不伪称全篇/原刊阅读全文，不新增确认主题/事件关系或现实人物身份。'),
('V1-FCT-1212','WCD10-B04-F11','V1-CARD-0326','V1-ENT-0122','one_sentence_summary','这首诗由十二节构成，有1947年独立书版，后收入1950年出版的《漫歌》；诗章与整个诗集保持独立对象。','institutional_paraphrase','WCD-10-B04','high','batch_retained_candidate','仅已核十二节结构、书版及总集收录的中性描述；不认定首次期刊发表年，也不把Loyola文学解释改成中性事实。'),
('V1-FCT-1213','WCD10-B04-F08','V1-CARD-0327','V1-ENT-0165','first_publication_year','1959','bibliographic','WCD-10-B04','high','batch_retained_candidate','CVC列1959Universitaria/1960Losada；旧BnF1992再版说明不覆盖。'),
('V1-FCT-1214','WCD10-B04-F09','V1-CARD-0327','V1-ENT-0165','one_sentence_summary','据智利教育部课程资源介绍，诗集不拘于传统十四行诗的固定节律，以身体与自然元素的意象书写爱情经验。','institutional_paraphrase','WCD-10-B04','high','batch_retained_candidate','机构资源释义保留归属，不当成原作全文或独立A级研究，不创建爱情主题边。'),
('V1-FCT-1215','WCD10-B04-F10','V1-CARD-0328','V1-ENT-0149','one_sentence_summary','据智利国家图书馆介绍，1922年初版分为七部分：五部分诗歌与两部分散文，包含生活、学校、儿童、痛苦与自然等编排。','institutional_paraphrase','WCD-10-B04','high','batch_retained_candidate','限定1922初版整体结构；不把单首诗奖项或传记痛苦因果下推全书。');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-1177','SRC-0070','CVC. Pablo Neruda. Bibliografía'),
('V1-FCT-1177','SRC-0384','Crepusculario'),
('V1-FCT-1178','SRC-0384','Crepusculario'),
('V1-FCT-1179','SRC-0384','Crepusculario'),
('V1-FCT-1180','SRC-0070','CVC. Pablo Neruda. Bibliografía'),
('V1-FCT-1180','SRC-0385','Odas Elementales'),
('V1-FCT-1181','SRC-0385','Odas Elementales'),
('V1-FCT-1182','SRC-0385','Odas Elementales'),
('V1-FCT-1183','SRC-0070','CVC. Pablo Neruda. Bibliografía'),
('V1-FCT-1184','SRC-0386','Los versos del Capitán'),
('V1-FCT-1185','SRC-0386','Los versos del Capitán'),
('V1-FCT-1186','SRC-0390','Los días enmascarados'),
('V1-FCT-1187','SRC-0390','Los días enmascarados'),
('V1-FCT-1188','SRC-0390','Los días enmascarados'),
('V1-FCT-1189','SRC-0391','Las buenas conciencias'),
('V1-FCT-1190','SRC-0391','Las buenas conciencias'),
('V1-FCT-1191','SRC-0391','Las buenas conciencias'),
('V1-FCT-1192','SRC-0392','Gringo viejo'),
('V1-FCT-1193','SRC-0392','Gringo viejo'),
('V1-FCT-1194','SRC-0392','Gringo viejo'),
('V1-FCT-1195','SRC-0393','Cristóbal Nonato'),
('V1-FCT-1196','SRC-0393','Cristóbal Nonato'),
('V1-FCT-1197','SRC-0393','Cristóbal Nonato'),
('V1-FCT-1198','SRC-0388','Lagar (1954)'),
('V1-FCT-1199','SRC-0388','Lagar (1954)'),
('V1-FCT-1200','SRC-0388','Lagar (1954)'),
('V1-FCT-1201','SRC-0389','Poema de Chile (1967)'),
('V1-FCT-1202','SRC-0389','Poema de Chile (1967)'),
('V1-FCT-1203','SRC-0389','Poema de Chile (1967)'),
('V1-FCT-1204','SRC-0389','Poema de Chile (1967)'),
('V1-FCT-1205','SRC-0070','CVC. Pablo Neruda. Bibliografía'),
('V1-FCT-1205','SRC-0381','Residencia en la tierra'),
('V1-FCT-1206','SRC-0070','CVC. Pablo Neruda. Bibliografía'),
('V1-FCT-1206','SRC-0381','Residencia en la tierra'),
('V1-FCT-1207','SRC-0381','Residencia en la tierra'),
('V1-FCT-1208','SRC-0070','CVC. Pablo Neruda. Bibliografía'),
('V1-FCT-1209','SRC-0382','Canto General'),
('V1-FCT-1209','SRC-0394','Los Modos de Autorreferencia en la Obra de Pablo Neruda'),
('V1-FCT-1210','SRC-0070','CVC. Pablo Neruda. Bibliografía'),
('V1-FCT-1210','SRC-0382','Canto General'),
('V1-FCT-1211','SRC-0394','Los Modos de Autorreferencia en la Obra de Pablo Neruda'),
('V1-FCT-1212','SRC-0070','CVC. Pablo Neruda. Bibliografía'),
('V1-FCT-1212','SRC-0382','Canto General'),
('V1-FCT-1212','SRC-0394','Los Modos de Autorreferencia en la Obra de Pablo Neruda'),
('V1-FCT-1213','SRC-0070','CVC. Pablo Neruda. Bibliografía'),
('V1-FCT-1214','SRC-0383','Cien sonetos de amor'),
('V1-FCT-1215','SRC-0387','Desolación (1922)');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0316','V1-FCT-1177','batch_retained_candidate'),
('V1-CARD-0316','V1-FCT-1178','batch_retained_candidate'),
('V1-CARD-0316','V1-FCT-1179','batch_retained_candidate'),
('V1-CARD-0317','V1-FCT-1180','batch_retained_candidate'),
('V1-CARD-0317','V1-FCT-1181','batch_retained_candidate'),
('V1-CARD-0317','V1-FCT-1182','batch_retained_candidate'),
('V1-CARD-0318','V1-FCT-1183','batch_retained_candidate'),
('V1-CARD-0318','V1-FCT-1184','batch_retained_candidate'),
('V1-CARD-0318','V1-FCT-1185','batch_retained_candidate'),
('V1-CARD-0319','V1-FCT-1186','batch_retained_candidate'),
('V1-CARD-0319','V1-FCT-1187','batch_retained_candidate'),
('V1-CARD-0319','V1-FCT-1188','batch_retained_candidate'),
('V1-CARD-0320','V1-FCT-1189','batch_retained_candidate'),
('V1-CARD-0320','V1-FCT-1190','batch_retained_candidate'),
('V1-CARD-0320','V1-FCT-1191','batch_retained_candidate'),
('V1-CARD-0321','V1-FCT-1192','batch_retained_candidate'),
('V1-CARD-0321','V1-FCT-1193','batch_retained_candidate'),
('V1-CARD-0321','V1-FCT-1194','batch_retained_candidate'),
('V1-CARD-0322','V1-FCT-1195','batch_retained_candidate'),
('V1-CARD-0322','V1-FCT-1196','batch_retained_candidate'),
('V1-CARD-0322','V1-FCT-1197','batch_retained_candidate'),
('V1-CARD-0323','V1-FCT-1198','batch_retained_candidate'),
('V1-CARD-0323','V1-FCT-1199','batch_retained_candidate'),
('V1-CARD-0323','V1-FCT-1200','batch_retained_candidate'),
('V1-CARD-0324','V1-FCT-1201','batch_retained_candidate'),
('V1-CARD-0324','V1-FCT-1202','batch_retained_candidate'),
('V1-CARD-0324','V1-FCT-1203','batch_retained_candidate'),
('V1-CARD-0324','V1-FCT-1204','batch_retained_candidate'),
('V1-CARD-0325','V1-FCT-1205','batch_retained_candidate'),
('V1-CARD-0325','V1-FCT-1206','batch_retained_candidate'),
('V1-CARD-0325','V1-FCT-1207','batch_retained_candidate'),
('V1-CARD-0326','V1-FCT-1208','batch_retained_candidate'),
('V1-CARD-0326','V1-FCT-1209','batch_retained_candidate'),
('V1-CARD-0326','V1-FCT-1210','batch_retained_candidate'),
('V1-CARD-0326','V1-FCT-1211','research_note_only'),
('V1-CARD-0326','V1-FCT-1212','batch_retained_candidate'),
('V1-CARD-0327','V1-FCT-1213','batch_retained_candidate'),
('V1-CARD-0327','V1-FCT-1214','batch_retained_candidate'),
('V1-CARD-0328','V1-FCT-1215','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0622','WCD10-B04-S01','V1-CARD-0316','SRC-0070','B','bibliography_or_bounded_description','yes','no','SRC-0070','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0623','WCD10-B04-S05','V1-CARD-0316','SRC-0384','B','bibliography_or_bounded_description','yes','no','SRC-0384','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0624','WCD10-B04-S01','V1-CARD-0317','SRC-0070','B','bibliography_or_bounded_description','yes','no','SRC-0070','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0625','WCD10-B04-S06','V1-CARD-0317','SRC-0385','B','bibliography_or_bounded_description','yes','no','SRC-0385','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0626','WCD10-B04-S01','V1-CARD-0318','SRC-0070','B','bibliography_or_bounded_description','yes','no','SRC-0070','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0627','WCD10-B04-S07','V1-CARD-0318','SRC-0386','B','bibliography_or_bounded_description','yes','no','SRC-0386','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0628','WCD10-B04-S11','V1-CARD-0319','SRC-0390','B','bibliography_or_bounded_description','yes','no','SRC-0390','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0629','WCD10-B04-S12','V1-CARD-0320','SRC-0391','B','bibliography_or_bounded_description','yes','no','SRC-0391','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0630','WCD10-B04-S13','V1-CARD-0321','SRC-0392','B','bibliography_or_bounded_description','yes','no','SRC-0392','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0631','WCD10-B04-S14','V1-CARD-0322','SRC-0393','B','bibliography_or_bounded_description','yes','no','SRC-0393','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0632','WCD10-B04-S09','V1-CARD-0323','SRC-0388','B','bibliography_or_bounded_description','yes','no','SRC-0388','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0633','WCD10-B04-S10','V1-CARD-0324','SRC-0389','B','bibliography_or_bounded_description','yes','no','SRC-0389','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0634','WCD10-B04-S01','V1-CARD-0325','SRC-0070','B','bibliography_or_bounded_description','yes','no','SRC-0070','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0635','WCD10-B04-S02','V1-CARD-0325','SRC-0381','B','bibliography_or_bounded_description','yes','no','SRC-0381','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0636','WCD10-B04-S01','V1-CARD-0326','SRC-0070','B','bibliography_or_bounded_description','yes','no','SRC-0070','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0637','WCD10-B04-S03','V1-CARD-0326','SRC-0382','B','bibliography_or_bounded_description','yes','no','SRC-0382','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0638','WCD10-B04-S15','V1-CARD-0326','SRC-0394','B','attributed_study','yes','yes','SRC-0394','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0639','WCD10-B04-S01','V1-CARD-0327','SRC-0070','B','bibliography_or_bounded_description','yes','no','SRC-0070','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0640','WCD10-B04-S04','V1-CARD-0327','SRC-0383','B','bibliography_or_bounded_description','no','no','SRC-0383','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0641','WCD10-B04-S08','V1-CARD-0328','SRC-0387','B','bibliography_or_bounded_description','no','no','SRC-0387','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0379','WCD-10-B04','WCD10-B04-W01-CREATED','V1-ENT-0115','CREATED','V1-ENT-0412','巴勃罗·聂鲁达创作 Crepusculario','high','accepted','wcd10_b01_review:PASS','2','NONE'),
('V1-REL-0380','WCD-10-B04','WCD10-B04-W02-CREATED','V1-ENT-0115','CREATED','V1-ENT-0413','巴勃罗·聂鲁达创作 Odas elementales','high','accepted','wcd10_b01_review:PASS','2','NONE'),
('V1-REL-0381','WCD-10-B04','WCD10-B04-W03-CREATED','V1-ENT-0115','CREATED','V1-ENT-0414','巴勃罗·聂鲁达创作 Los versos del capitán','high','accepted','wcd10_b01_review:PASS','2','NONE'),
('V1-REL-0382','WCD-10-B04','WCD10-B04-W04-CREATED','V1-ENT-0145','CREATED','V1-ENT-0415','卡洛斯·富恩特斯创作 Los días enmascarados','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0383','WCD-10-B04','WCD10-B04-W05-CREATED','V1-ENT-0145','CREATED','V1-ENT-0416','卡洛斯·富恩特斯创作 Las buenas conciencias','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0384','WCD-10-B04','WCD10-B04-W06-CREATED','V1-ENT-0145','CREATED','V1-ENT-0417','卡洛斯·富恩特斯创作 Gringo viejo','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0385','WCD-10-B04','WCD10-B04-W07-CREATED','V1-ENT-0145','CREATED','V1-ENT-0418','卡洛斯·富恩特斯创作 Cristóbal Nonato','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0386','WCD-10-B04','WCD10-B04-W08-CREATED','V1-ENT-0148','CREATED','V1-ENT-0419','加夫列拉·米斯特拉尔创作 Lagar','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0387','WCD-10-B04','WCD10-B04-W09-CREATED','V1-ENT-0148','CREATED','V1-ENT-0420','加夫列拉·米斯特拉尔创作 Poema de Chile','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0388','WCD-10-B04','WCD10-B04-R01','V1-ENT-0417','SET_IN','V1-ENT-0051','《Gringo viejo》的虚构故事以墨西哥为背景；不认证比尔斯现实轨迹或历史事件。','high','accepted','wcd10_b01_review:PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0379','SRC-0070'),
('V1-REL-0379','SRC-0384'),
('V1-REL-0380','SRC-0070'),
('V1-REL-0380','SRC-0385'),
('V1-REL-0381','SRC-0070'),
('V1-REL-0381','SRC-0386'),
('V1-REL-0382','SRC-0390'),
('V1-REL-0383','SRC-0391'),
('V1-REL-0384','SRC-0392'),
('V1-REL-0385','SRC-0393'),
('V1-REL-0386','SRC-0388'),
('V1-REL-0387','SRC-0389'),
('V1-REL-0388','SRC-0392');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0423','V1-REL-0379','WCD10-B04-S01','SRC-0070','CVC. Pablo Neruda. Bibliografía','Crepusculario/Residencia/Alturas/Los versos/Odas/Cien sonetos具体书目条目','巴勃罗·聂鲁达创作 Crepusculario','high','eligible_evidence','WCD-10-B04'),
('V1-EV-0424','V1-REL-0379','WCD10-B04-S05','SRC-0384','Crepusculario','主叙述1923及初版五章、1926改编说明','巴勃罗·聂鲁达创作 Crepusculario','high','eligible_evidence','WCD-10-B04'),
('V1-EV-0425','V1-REL-0380','WCD10-B04-S01','SRC-0070','CVC. Pablo Neruda. Bibliografía','Crepusculario/Residencia/Alturas/Los versos/Odas/Cien sonetos具体书目条目','巴勃罗·聂鲁达创作 Odas elementales','high','eligible_evidence','WCD-10-B04'),
('V1-EV-0426','V1-REL-0380','WCD10-B04-S06','SRC-0385','Odas Elementales','主叙述1954及日常对象；1956/1957其他书名','巴勃罗·聂鲁达创作 Odas elementales','high','eligible_evidence','WCD-10-B04'),
('V1-EV-0427','V1-REL-0381','WCD10-B04-S01','SRC-0070','CVC. Pablo Neruda. Bibliografía','Crepusculario/Residencia/Alturas/Los versos/Odas/Cien sonetos具体书目条目','巴勃罗·聂鲁达创作 Los versos del capitán','high','eligible_evidence','WCD-10-B04'),
('V1-EV-0428','V1-REL-0381','WCD10-B04-S07','SRC-0386','Los versos del Capitán','作品署名/ISBN9789500306171/两段简介','巴勃罗·聂鲁达创作 Los versos del capitán','high','eligible_evidence','WCD-10-B04'),
('V1-EV-0429','V1-REL-0382','WCD10-B04-S11','SRC-0390','Los días enmascarados','主条目Short stories1954；六篇简介','卡洛斯·富恩特斯创作 Los días enmascarados','high','eligible_evidence','WCD-10-B04'),
('V1-EV-0430','V1-REL-0383','WCD10-B04-S12','SRC-0391','Las buenas conciencias','主条目Novela1959；Jaime Ceballos完整简介','卡洛斯·富恩特斯创作 Las buenas conciencias','high','eligible_evidence','WCD-10-B04'),
('V1-EV-0431','V1-REL-0384','WCD10-B04-S13','SRC-0392','Gringo viejo','主条目Novela1985；Ambrose Bierce赴墨西哥段','卡洛斯·富恩特斯创作 Gringo viejo','high','eligible_evidence','WCD-10-B04'),
('V1-EV-0432','V1-REL-0385','WCD10-B04-S14','SRC-0393','Cristóbal Nonato','主条目Novela1987；Makesicko City/胎儿/出生竞赛段','卡洛斯·富恩特斯创作 Cristóbal Nonato','high','eligible_evidence','WCD-10-B04'),
('V1-EV-0433','V1-REL-0386','WCD10-B04-S09','SRC-0388','Lagar (1954)','主叙述1954/Editorial del Pacífico/13部分74诗；个别诗先刊说明','加夫列拉·米斯特拉尔创作 Lagar','high','eligible_evidence','WCD-10-B04'),
('V1-EV-0434','V1-REL-0387','WCD10-B04-S10','SRC-0389','Poema de Chile (1967)','主叙述Doris Dana/77诗/身后出版/三同行者/2015扩编','加夫列拉·米斯特拉尔创作 Poema de Chile','high','eligible_evidence','WCD-10-B04'),
('V1-EV-0435','V1-REL-0388','WCD10-B04-S13','SRC-0392','Gringo viejo','主条目Novela1985；Ambrose Bierce赴墨西哥段','《Gringo viejo》的虚构故事以墨西哥为背景；不认证比尔斯现实轨迹或历史事件。','high','eligible_evidence','WCD-10-B04');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0099','WCD-10-B04-G01','research_gap','WCD10:B04:Alturas:first_periodical_year','open','1947独立书版已核，Loyola称1946发表但首刊载体未核；保留first_publication/periodical year缺口，不静默填1947。','','Independent Reviewer: preserve publication_carrier_unverified','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0100','WCD-10-B04-G02','research_gap','WCD10:B04:poetic_containment','open','Alturas/Canto、诗集/单诗/续集的包含关系保留文字；APPEARS_IN/CONTAINS等需独立层级门禁，本批不扩Schema或借SET_IN编码。','','Independent Reviewer: preserve structural_path_not_admitted','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0101','WCD-10-B04-G03','research_gap','WCD10:B04:Poema_de_Chile:edition_city','open','同页1967书版城市Barcelona与引注Santiago不同；不选边、不填写城市，77/131诗版本范围显式。','','Independent Reviewer: preserve conflicting_source_detail','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0102','WCD-10-B04-G04','research_gap','WCD10:B04:legacy_holds:retain','open','Neruda vanguardia hold0036、Veinte爱情hold0040、Mistral modernismo hold0041等旧状态保留；已resolved Neruda modernismo hold0035/REL0319不回退。','','Independent Reviewer: preserve legacy_hold_retained','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0103','WCD-10-B04-G05','research_gap','WCD10:B04:additional_bibliography','open','España en el corazón、Tercera residencia、Lagar II、La cabeza de la hidra等不凑数新增；目录线索不是全部事实/描述/层级复核完成。','','Independent Reviewer: preserve future_object_layer_research','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0104','WCD-10-B04-G06','research_gap','WCD10:B04:places_and_history','open','Makesicko不静默匹配墨西哥城；马丘比丘无既有地点端点；collection Poema地理仅文字，本批不借work SET_IN规则扩边，不以诗人经历/真实人名生成历史事件边。','','Independent Reviewer: preserve no_inferred_endpoint_or_event','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0105','WCD-10-B04:V1-ENT-0122','research_gap','WCD10:work_level_research:V1-ENT-0122','open','Alturas首次发表载体仍OPEN；Loyola保守B、已读目标片段而非原刊全篇，独立A级及第二研究OPEN；无马丘比丘端点，不合并Canto。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0106','WCD-10-B04:V1-ENT-0165','research_gap','WCD10:work_level_research:V1-ENT-0165','open','Cien sonetos旧1992再版说明保留，1959新增直接首年；教育部评论不是独立A级研究，爱情主题边不确认。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0107','WCD-10-B04:V1-ENT-0146','research_gap','WCD10:work_level_research:V1-ENT-0146','open','La región既有1958/小说/群像/城市事实与关系保留；旧来源均B，作品级独立A级研究OPEN，不把作者总评下推。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0108','WCD-10-B04:V1-ENT-0147','research_gap','WCD10:work_level_research:V1-ENT-0147','open','Artemio旧1962/梗概/人称与人物沿用；现版/图书采购书目不替代作品级A级研究，不确认真实原型。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0109','WCD-10-B04:V1-ENT-0169','research_gap','WCD10:work_level_research:V1-ENT-0169','open','Aura旧1962/短小说（novella）及work层级/梗概/第二人称/城市保留；B/C链不称A级；不以作者代理旁支作为已读新作品研究。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0110','WCD-10-B04:V1-ENT-0374','research_gap','WCD10:work_level_research:V1-ENT-0374','open','Terra Nostra既有1975/三部结构和B/C来源保留；本批未读独立A级原文，明确作品研究gap，不用作者政治归属确认事件。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0111','WCD-10-B04:V1-ENT-0149','research_gap','WCD10:work_level_research:V1-ENT-0149','open','Desolación初版整体结构补齐；1923/1926再版不改1922，独立A级作品研究仍OPEN。Sonetos单篇不下推合集。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0112','WCD-10-B04:V1-ENT-0150','research_gap','WCD10:work_level_research:V1-ENT-0150','open','Ternura1924/摇篮曲歌谣描述保留；1945扩编不重建作品。旧Nobel两页不是两篇独立文学研究，A级缺口OPEN。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0113','WCD-10-B04:V1-ENT-0151','research_gap','WCD10:work_level_research:V1-ENT-0151','open','Tala1938及旧自由诗/意象描述保留，不称无描述；独立A级研究仍OPEN，不以modernismo作者hold下推。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0114','WCD-10-B04:WCD10-B04-W01','research_gap','WCD10:work_level_research:V1-ENT-0412','open','Crepusculario作品/合集级独立A级研究及需第二来源的解释关系仍OPEN。中文显示名暂译；只存当前已核对象级书目/有归属描述，不合并版本或单篇，不作公共准入。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0115','WCD-10-B04:WCD10-B04-W02','research_gap','WCD10:work_level_research:V1-ENT-0413','open','Odas elementales作品/合集级独立A级研究及需第二来源的解释关系仍OPEN。中文显示名暂译；只存当前已核对象级书目/有归属描述，不合并版本或单篇，不作公共准入。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0116','WCD-10-B04:WCD10-B04-W03','research_gap','WCD10:work_level_research:V1-ENT-0414','open','Los versos del capitán作品/合集级独立A级研究及需第二来源的解释关系仍OPEN。中文显示名暂译；只存当前已核对象级书目/有归属描述，不合并版本或单篇，不作公共准入。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0117','WCD-10-B04:WCD10-B04-W04','research_gap','WCD10:work_level_research:V1-ENT-0415','open','Los días enmascarados作品/合集级独立A级研究及需第二来源的解释关系仍OPEN。中文显示名暂译；只存当前已核对象级书目/有归属描述，不合并版本或单篇，不作公共准入。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0118','WCD-10-B04:WCD10-B04-W05','research_gap','WCD10:work_level_research:V1-ENT-0416','open','Las buenas conciencias作品/合集级独立A级研究及需第二来源的解释关系仍OPEN。中文显示名暂译；只存当前已核对象级书目/有归属描述，不合并版本或单篇，不作公共准入。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0119','WCD-10-B04:WCD10-B04-W06','research_gap','WCD10:work_level_research:V1-ENT-0417','open','Gringo viejo作品/合集级独立A级研究及需第二来源的解释关系仍OPEN。中文显示名暂译；只存当前已核对象级书目/有归属描述，不合并版本或单篇，不作公共准入。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0120','WCD-10-B04:WCD10-B04-W07','research_gap','WCD10:work_level_research:V1-ENT-0418','open','Cristóbal Nonato作品/合集级独立A级研究及需第二来源的解释关系仍OPEN。中文显示名暂译；只存当前已核对象级书目/有归属描述，不合并版本或单篇，不作公共准入。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0121','WCD-10-B04:WCD10-B04-W08','research_gap','WCD10:work_level_research:V1-ENT-0419','open','Lagar作品/合集级独立A级研究及需第二来源的解释关系仍OPEN。中文显示名暂译；只存当前已核对象级书目/有归属描述，不合并版本或单篇，不作公共准入。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0122','WCD-10-B04:WCD10-B04-W09','research_gap','WCD10:work_level_research:V1-ENT-0420','open','Poema de Chile作品/合集级独立A级研究及需第二来源的解释关系仍OPEN。中文显示名暂译；只存当前已核对象级书目/有归属描述，不合并版本或单篇，不作公共准入。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');

UPDATE metadata SET value='WCD-10-B04' WHERE key='last_change_set';

UPDATE metadata SET value='2026-09-29' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 392 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 418 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 416 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 328 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1209 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 1293 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1188 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 633 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 386 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 464 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 435 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 122 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
