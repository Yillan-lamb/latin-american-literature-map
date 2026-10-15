-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: Codex-parent-independent-review

-- Registration sha256: 6591b5403805573d50e30fd3c03973dd705b6df614a044ba5f0b77319c592c2c

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1232 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 663 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 343 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 426 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 424 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 1354 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1253 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 151 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 40 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 456 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 485 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 395 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 406 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B05' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0409' OR canonical_url='https://www.companhiadasletras.com.br/9788535913545-jubiaba-3559/p') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0410' OR canonical_url='https://www.companhiadasletras.com.br/9788535912906-tenda-dos-milagres-3088/p') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0411' OR canonical_url='https://www.scielo.br/j/ea/a/BnYZn9mHDH5MBG7mHjZ6QqS/?lang=pt') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0412' OR canonical_url='https://www.companhiadasletras.com.br/9788535911695-capitaes-da-areia/p') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0413' OR canonical_url='https://www.companhiadasletras.com.br/9788535911701-dona-flor-e-seus-dois-maridos-2712/p') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0414' OR canonical_url='https://www.companhiadasletras.com.br/9788535920987-gabriela-cravo-e-canela/p') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0415' OR canonical_url='https://www.companhiadasletras.com.br/9788535917260-cacau/p') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0416' OR canonical_url='https://seer.ufu.br/index.php/cdhis/article/view/49243') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0417' OR canonical_url='https://www.periodicos.ufpi.br/index.php/lingedusoc/article/view/6765') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0418' OR canonical_url='https://www.companhiadasletras.com.br/9788535911848-tocaia-grande-6498/p') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0419' OR canonical_url='https://www.companhiadasletras.com.br/9788535917987-o-pais-do-carnaval-1427/p') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0420' OR canonical_url='https://cvc.cervantes.es/literatura/escritores/onetti/obra.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0421' OR canonical_url='https://cvc.cervantes.es/literatura/aih/pdf/12/aih_12_7_024.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0422' OR canonical_url='https://cvc.cervantes.es/literatura/escritores/onetti/acerca/garcia.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0423' OR canonical_url='https://revistaliteratura.uchile.cl/index.php/RCL/article/view/39198') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0424' OR canonical_url='https://cvc.cervantes.es/literatura/aih/pdf/07/aih_07_2_011.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0425' OR canonical_url='https://cvc.cervantes.es/literatura/aih/pdf/03/aih_03_1_052.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0426' OR canonical_url='https://cvc.cervantes.es/literatura/aih/pdf/09/aih_09_2_082.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0427' OR canonical_url='https://cvc.cervantes.es/literatura/escritores/onetti/acerca/fernandez.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0428' OR canonical_url='https://www.memoriachilena.gob.cl/602/w3-article-94934.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0429' OR canonical_url='https://www.memoriachilena.gob.cl/602/w3-article-73146.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0430' OR canonical_url='https://www.agenciabalcells.com/en/authors/works/jose-donoso/veraneo-y-otros-cuentos/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0431' OR canonical_url='https://www.curriculumnacional.cl/portal/Palabras-Claves/Relaciones-familiares/88620:Este-domingo') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0432' OR canonical_url='https://www.agenciabalcells.com/autores/obra/jose-donoso/tres-novelitas-burguesas/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0433' OR canonical_url='https://www.memoriachilena.gob.cl/602/w3-article-94919.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0434' OR canonical_url='https://www.memoriachilena.gob.cl/602/w3-article-73167.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0435' OR canonical_url='https://www.memoriachilena.gob.cl/602/w3-article-94928.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0436' OR canonical_url='https://www.memoriachilena.gob.cl/602/w3-article-94931.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0437' OR canonical_url='https://www.memoriachilena.gob.cl/602/w3-article-94922.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0438' OR canonical_url='https://www.memoriachilena.gob.cl/602/w3-article-94920.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0439' OR canonical_url='https://web.uchile.cl/publicaciones/cyber/14/tx12ndejong.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0440' OR canonical_url='https://www.agenciabalcells.com/autores/obra/jose-donoso/casa-de-campo/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0441' OR canonical_url='https://www.agenciabalcells.com/autores/obra/jose-donoso/la-misteriosa-desaparicion-de-la-marquesita-de-loria/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0442' OR canonical_url='https://www.agenciabalcells.com/autores/obra/jose-donoso/taratuta-naturaleza-muerta-con-cachimba/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0443' OR canonical_url='https://www.agenciabalcells.com/autores/obra/jose-donoso/el-obsceno-pajaro-de-la-noche/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0444' OR canonical_url='https://www.agenciabalcells.com/autores/obra/jose-donoso/el-lugar-sin-limites/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0445' OR canonical_url='https://www.agenciabalcells.com/autores/obra/jose-donoso/coronacion/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0446' OR canonical_url='https://www.agenciabalcells.com/autores/obra/jose-donoso/este-domingo/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0447' OR canonical_url='https://www.agenciabalcells.com/autores/obra/jose-donoso/el-mocho/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0448' OR canonical_url='https://www.agenciabalcells.com/autores/obra/jose-donoso/lagartija-sin-cola/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0449' OR canonical_url='https://www.agenciabalcells.com/autores/obra/jose-donoso/cuentos/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0450' OR canonical_url='https://www.agenciabalcells.com/autores/obra/jose-donoso/charleston/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0451' OR canonical_url='https://www.memoriachilena.gob.cl/602/w3-article-73181.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0452' OR canonical_url='https://books.google.com/books/about/Nueve_novelas_breves.html?hl=en&id=LQNfAAAAMAAJ') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0453' OR canonical_url='https://revistanortegrande.uc.cl/index.php/alch/article/download/81310/61824/237132') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0454' OR canonical_url='https://www.agenciabalcells.com/autores/obra/jose-donoso/articulos-de-incierta-necesidad/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0455' OR canonical_url='https://ediciones.udp.cl/libro/el-escribidor-intruso/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0456' OR canonical_url='https://www.memoriachilena.gob.cl/602/w3-propertyvalue-1179072.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0457' OR canonical_url='https://www.agenciabalcells.com/autores/obra/jose-donoso/donde-van-a-morir-los-elefantes/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0458' OR canonical_url='https://www.agenciabalcells.com/autores/obra/jose-donoso/el-jardin-de-al-lado/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0429' OR (entity_type='work' AND original_name='Jubiabá')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0430' OR (entity_type='work' AND original_name='Tenda dos milagres')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0431' OR (entity_type='work' AND original_name='Cacau')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0432' OR (entity_type='work' AND original_name='O país do carnaval')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0433' OR (entity_type='work' AND original_name='Tocaia grande')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0434' OR (entity_type='work' AND original_name='El pozo')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0435' OR (entity_type='work' AND original_name='Juntacadáveres')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0436' OR (entity_type='work' AND original_name='Dejemos hablar al viento')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0437' OR (entity_type='collection' AND original_name='Veraneo y otros cuentos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0438' OR (entity_type='work' AND original_name='Este domingo')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0439' OR (entity_type='collection' AND original_name='Tres novelitas burguesas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0440' OR (entity_type='work' AND original_name='Casa de campo')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0441' OR (entity_type='work' AND original_name='El jardín de al lado')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0442' OR (entity_type='collection' AND original_name='Poemas de un novelista')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0443' OR (entity_type='work' AND original_name='La desesperanza')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0444' OR (entity_type='work' AND original_name='Donde van a morir los elefantes')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0445' OR (entity_type='work' AND original_name='Conjeturas sobre la memoria de mi tribu')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0446' OR (entity_type='work' AND original_name='Historia personal del ''boom''')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0447' OR (entity_type='work' AND original_name='La misteriosa desaparición de la Marquesita de Loria')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0448' OR (entity_type='collection' AND original_name='Taratuta. Naturaleza muerta con cachimba')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0449' OR (entity_type='work' AND original_name='El Mocho')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0450' OR (entity_type='work' AND original_name='Lagartija sin cola')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0451' OR (entity_type='collection' AND original_name='Charlestón')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0452' OR (entity_type='collection' AND original_name='Nueve novelas breves')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0453' OR (entity_type='collection' AND original_name='Dos cuentos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0454' OR (entity_type='collection' AND original_name='Artículos de incierta necesidad')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0455' OR (entity_type='collection' AND original_name='El escribidor intruso')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0456' OR (entity_type='collection' AND original_name='Los mejores cuentos de José Donoso')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1260' OR (subject_id='V1-ENT-0429' AND fact_field='first_publication_year' AND value_text='1935')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1261' OR (subject_id='V1-ENT-0429' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1262' OR (subject_id='V1-ENT-0429' AND fact_field='one_sentence_summary' AND value_text='据出版社简介，作品以孤儿安东尼奥·巴尔杜伊诺为中心，追写他在萨尔瓦多街头、烟草种植园、巡回马戏团和码头之间经历的生活转折，直至参加罢工。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1263' OR (subject_id='V1-ENT-0430' AND fact_field='first_publication_year' AND value_text='1969')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1264' OR (subject_id='V1-ENT-0430' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1265' OR (subject_id='V1-ENT-0430' AND fact_field='one_sentence_summary' AND value_text='据出版社简介，小说以萨尔瓦多一间印刷铺及其周边为场景，围绕自学研究非裔文化并主张混血社会的Pedro Archanjo展开，并以两个时代交错回望其生平。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1266' OR (subject_id='V1-ENT-0430' AND fact_field='research_note' AND value_text='Soleni Biscouto Fressato的文章同时研究1969年小说与1977年电影；此处只转述其明确涉及小说的分析：小说将candomblé呈现为黑人与混血群体的身份、抵抗及争取正义的场域，并以两个叙事时段展开。不得移用电影独有的人物、改编或场景细节。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1267' OR (subject_id='V1-ENT-0431' AND fact_field='first_publication_year' AND value_text='1933')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1268' OR (subject_id='V1-ENT-0431' AND fact_field='genre_or_form' AND value_text='小说（出版社称 pequeno romance；不据此细分篇幅类别）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1269' OR (subject_id='V1-ENT-0431' AND fact_field='one_sentence_summary' AND value_text='据出版社简介，小说由一名曾做过工厂工人的农场劳动者以第一人称叙述，写其在巴伊亚可可产区劳动并形成社会与政治意识的经历。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1270' OR (subject_id='V1-ENT-0431' AND fact_field='research_note' AND value_text='Matheus de Mesquita e Pontes将《Cacau》(1933)置于Amado早期“romances proletários”与阶级、地区、种族议题的出版脉络；Josiane Silva Calhau与Zulma Elizabete de Freitas Madruga则直接分析小说所写可可种植劳动者的实践知识及社会文化语境。以上为研究者归属明确的对象研究摘要，不把单一教学研究概括成作品唯一主题。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1271' OR (subject_id='V1-ENT-0432' AND fact_field='first_publication_year' AND value_text='1931')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1272' OR (subject_id='V1-ENT-0432' AND fact_field='genre_or_form' AND value_text='长篇小说（romance）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1273' OR (subject_id='V1-ENT-0432' AND fact_field='one_sentence_summary' AND value_text='据出版社简介，青年农场主之子Paulo Rigger从巴黎返巴西后，先在里约、后在萨尔瓦多与诗人和记者交往，周围人物在爱情、金钱、政治、资产阶级生活与宗教中寻找人生意义。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1274' OR (subject_id='V1-ENT-0433' AND fact_field='first_publication_year' AND value_text='1984')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1275' OR (subject_id='V1-ENT-0433' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1276' OR (subject_id='V1-ENT-0433' AND fact_field='one_sentence_summary' AND value_text='据出版社简介，小说写20世纪初一处因暴力伏击与土地争夺而兴起的村镇；Natário da Fonseca取得并经营土地，商贩、妓女、赶骡人和前奴隶等陆续聚居，形成聚落。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1277' OR (subject_id='V1-ENT-0433' AND fact_field='bibliographic_note' AND value_text='ABL书目列Tocaia Grande（1984），Companhia das Letras对象页直接写Publicado em 1984；BNDigital署名文章第54行则以将来式称作品将于1988出版。该差异保留作来源冲突记录，当前不推断其原因。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1278' OR (subject_id='V1-ENT-0434' AND fact_field='first_publication_year' AND value_text='1939')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1279' OR (subject_id='V1-ENT-0434' AND fact_field='genre_or_form' AND value_text='中篇小说（novela corta）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1280' OR (subject_id='V1-ENT-0434' AND fact_field='one_sentence_summary' AND value_text='Linacero在独处中借回忆、梦境与想象组织自己的内在故事，以此应对现实处境带来的倦怠。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1281' OR (subject_id='V1-ENT-0435' AND fact_field='first_publication_year' AND value_text='1964')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1282' OR (subject_id='V1-ENT-0435' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1283' OR (subject_id='V1-ENT-0435' AND fact_field='one_sentence_summary' AND value_text='拉森带着三名妓女乘火车抵达圣玛丽亚，获准在那里开设妓院；妓院依法关闭后，他与同伴离开。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1284' OR (subject_id='V1-ENT-0435' AND fact_field='research_note' AND value_text='Rodrigo Cánovas认为，小说把空间安排与人物功能组织成万花筒式结构，使看似对立的地点和人物彼此等同或映照。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1285' OR (subject_id='V1-ENT-0436' AND fact_field='first_publication_year' AND value_text='1979')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1286' OR (subject_id='V1-ENT-0436' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1287' OR (subject_id='V1-ENT-0436' AND fact_field='one_sentence_summary' AND value_text='警长Medina返回Santa María，试图与可能是其儿子的Julián重建关系并使他脱离Frieda的影响；结尾由Colorado在Medina、Díaz Grey等人的配合下纵火，Santa María陷入火焰。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1288' OR (subject_id='V1-ENT-0436' AND fact_field='research_note' AND value_text='Hugo J. Verani将《Dejemos hablar al viento》视为Santa María系列的收束，并指出作品吸收、改写奥内蒂先前叙事，形成互文结构。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1289' OR (subject_id='V1-ENT-0437' AND fact_field='first_publication_year' AND value_text='1955')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1290' OR (subject_id='V1-ENT-0437' AND fact_field='genre_or_form' AND value_text='短篇小说集（七则故事）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1291' OR (subject_id='V1-ENT-0437' AND fact_field='one_sentence_summary' AND value_text='Memoria Chilena的《Veraneo y otros cuentos》作品页列出《Veraneo》《Tocayos》《El Güero》《Una señora》《Fiesta en grande》《Dos cartas》和《Dinamanquero》七篇故事。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1292' OR (subject_id='V1-ENT-0437' AND fact_field='bibliographic_note' AND value_text='作者档案称1955年为其首部故事集；国家图书馆馆藏记录《Veraneo y otros cuentos》1955年、115页，但该条目没有“1a edición”标记。Balcells英文作品页年份栏列1951、正文却称首部故事集于1955年出版，差异照录待审。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1293' OR (subject_id='V1-ENT-0438' AND fact_field='first_publication_year' AND value_text='1966')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1294' OR (subject_id='V1-ENT-0438' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1295' OR (subject_id='V1-ENT-0438' AND fact_field='one_sentence_summary' AND value_text='Violeta常在雇主夫妇周日外出时与青年Álvaro相处；Álvaro与Chepa的婚姻及婚外关系也在孤独与沟通隔阂中展开。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1296' OR (subject_id='V1-ENT-0439' AND fact_field='first_publication_year' AND value_text='1973')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1297' OR (subject_id='V1-ENT-0439' AND fact_field='genre_or_form' AND value_text='中篇小说集（三部中篇小说）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1298' OR (subject_id='V1-ENT-0439' AND fact_field='one_sentence_summary' AND value_text='该书卷由三部中篇小说组成，叙事从现实主义渐向梦幻与怪诞；作品页称三部叙事围绕欧洲富裕专业人士的日常生活展开。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1299' OR (subject_id='V1-ENT-0440' AND fact_field='first_publication_year' AND value_text='1978')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1300' OR (subject_id='V1-ENT-0440' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1301' OR (subject_id='V1-ENT-0440' AND fact_field='one_sentence_summary' AND value_text='Ventura家族带着配偶和三十五名子女在远离文明的庄园度夏；父母安排成人野餐并把孩子留在宅邸，孩子们在宅院、广原和外部威胁之间展开自己的行动。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1302' OR (subject_id='V1-ENT-0440' AND fact_field='bibliographic_note' AND value_text='国家图书馆Casa de campo目录对象明确标“1a. edición. Barcelona: Seix Barral, 1978, 498 páginas”；作品页亦称1978出版并另记1979年获奖。Balcells作品页单独将作品列为1979，未解释字段。两项日期保留；首版候选基于明确第一版目录，不将获奖年与出版年混同。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1303' OR (subject_id='V1-ENT-0441' AND fact_field='first_publication_year' AND value_text='1981')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1304' OR (subject_id='V1-ENT-0441' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1305' OR (subject_id='V1-ENT-0441' AND fact_field='one_sentence_summary' AND value_text='流亡西班牙的智利小说家Julio Méndez渴望获得文学成功，却在创作受挫与接受自身局限之间挣扎；经纪人Núria Monclús和作家Marcelo Chiriboga也牵动他的处境。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1306' OR (subject_id='V1-ENT-0441' AND fact_field='research_note' AND value_text='研究者Nadine Dejong将《El jardín de al lado》视为《Historia personal del «boom»》的小说化版本，并分析小说家Julio如何经由对Boom圈子的观察呈现其挫败与排斥感。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1307' OR (subject_id='V1-ENT-0442' AND fact_field='first_publication_year' AND value_text='1981')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1308' OR (subject_id='V1-ENT-0442' AND fact_field='genre_or_form' AND value_text='诗集（约三十首诗）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1309' OR (subject_id='V1-ENT-0442' AND fact_field='one_sentence_summary' AND value_text='Memoria Chilena称该书为多诺索唯一的诗歌类作品，约收三十首诗，并按四个章节组织；目录同时列有写于1952年的三首诗，不能把全部诗作写作年概括为单一时期。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1310' OR (subject_id='V1-ENT-0443' AND fact_field='first_publication_year' AND value_text='1986')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1311' OR (subject_id='V1-ENT-0443' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1312' OR (subject_id='V1-ENT-0443' AND fact_field='one_sentence_summary' AND value_text='据Memoria Chilena引述的作者访谈，小说从Matilde Neruda醒来写起，随后跟随一对伴侣在Santiago的一次出行，并在Matilde葬礼收束；来源称全书时间跨度约八小时。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1313' OR (subject_id='V1-ENT-0444' AND fact_field='first_publication_year' AND value_text='1995')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1314' OR (subject_id='V1-ENT-0444' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1315' OR (subject_id='V1-ENT-0444' AND fact_field='one_sentence_summary' AND value_text='智利文学教授Gustavo Zuleta到美国一所小型大学任教，在妻儿抵达前经历学术圈的嫉妒、权力争斗、性关系与一起造成多人遇害的谋杀案；Ruby进入他的生活。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1316' OR (subject_id='V1-ENT-0444' AND fact_field='research_note' AND value_text='Dejong将《Donde van a morir los elefantes》称作《El jardín de al lado》的续篇，并比较Marcelo Chiriboga在两书中从“Boom代表性名字”到更具体人物的变化。此为该论文对两部作品的研究归属，不建立作品关系候选。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1317' OR (subject_id='V1-ENT-0445' AND fact_field='first_publication_year' AND value_text='1996')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1318' OR (subject_id='V1-ENT-0445' AND fact_field='genre_or_form' AND value_text='家族回忆/自传性叙事作品（具体体裁仍待作品专门研究）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1319' OR (subject_id='V1-ENT-0445' AND fact_field='one_sentence_summary' AND value_text='作者以小说化方式叙写家族史和祖先记忆。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1320' OR (subject_id='V1-ENT-0446' AND fact_field='first_publication_year' AND value_text='1972')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1321' OR (subject_id='V1-ENT-0446' AND fact_field='genre_or_form' AND value_text='自传性文学随笔（兼具文学史论述与传记性纪事）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1322' OR (subject_id='V1-ENT-0446' AND fact_field='one_sentence_summary' AND value_text='这部自传性文学随笔回顾拉美文学Boom，并在文学史论述与作者个人文学经历之间展开。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1323' OR (subject_id='V1-ENT-0446' AND fact_field='bibliographic_note' AND value_text='Dejong记载《Historia personal del «boom»》1972年首次出版；1983重版增补Donoso的附录《Diez años después》。1972为作品初版候选，1983为增补重版，不另列为第二部作品。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1324' OR (subject_id='V1-ENT-0447' AND fact_field='first_publication_year' AND value_text='1980')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1325' OR (subject_id='V1-ENT-0447' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1326' OR (subject_id='V1-ENT-0447' AND fact_field='one_sentence_summary' AND value_text='年轻寡妇Marquesita在1920年代马德里游走，在丧偶后的自由中经历诱惑与感官生活。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1327' OR (subject_id='V1-ENT-0448' AND fact_field='first_publication_year' AND value_text='1990')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1328' OR (subject_id='V1-ENT-0448' AND fact_field='genre_or_form' AND value_text='两部小说合卷（collection）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1329' OR (subject_id='V1-ENT-0448' AND fact_field='one_sentence_summary' AND value_text='《Taratuta》以马德里和布宜诺斯艾利斯为背景，写到逃离十月革命的俄国人及列宁；《Naturaleza muerta con cachimba》则以一处衰败海滨度假地为背景，描写沉浸在梦想中的小人物。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1330' OR (subject_id='V1-ENT-0449' AND fact_field='first_publication_year' AND value_text='1997')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1331' OR (subject_id='V1-ENT-0449' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1332' OR (subject_id='V1-ENT-0449' AND fact_field='one_sentence_summary' AND value_text='故事置于煤矿与军政府背景之下，并以妓院和马戏团作为日常生活的另一组场景；作者未及见书出版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1333' OR (subject_id='V1-ENT-0449' AND fact_field='bibliographic_note' AND value_text='国家图书馆书目记录Aguilar Chilena 1997年版；对象页也列1997，并说明作者未及见出版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1334' OR (subject_id='V1-ENT-0450' AND fact_field='first_publication_year' AND value_text='2007')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1335' OR (subject_id='V1-ENT-0450' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1336' OR (subject_id='V1-ENT-0450' AND fact_field='one_sentence_summary' AND value_text='画家Armando Muñoz-Roa与Luisa离开巴塞罗那后，回想他曾试图拯救的Dors小镇及家族衰落。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1337' OR (subject_id='V1-ENT-0450' AND fact_field='bibliographic_note' AND value_text='作品页称Donoso于1973年开始写作后搁置稿件，2007年出版；创作开始年份与出版年份不合并。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1338' OR (subject_id='V1-ENT-0451' AND fact_field='first_publication_year' AND value_text='1960')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1339' OR (subject_id='V1-ENT-0451' AND fact_field='genre_or_form' AND value_text='短篇小说集（六篇）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1340' OR (subject_id='V1-ENT-0451' AND fact_field='one_sentence_summary' AND value_text='该卷收录《El hombrecito》《Ana María》《El charlestón》《La puerta cerrada》《Paseo》和《Santelices》六篇短篇。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1341' OR (subject_id='V1-ENT-0452' AND fact_field='first_publication_year' AND value_text='1996')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1342' OR (subject_id='V1-ENT-0452' AND fact_field='genre_or_form' AND value_text='九部中篇小说的合辑（collection）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1343' OR (subject_id='V1-ENT-0452' AND fact_field='one_sentence_summary' AND value_text='该合辑重收九部此前分见三个独立书卷的中篇小说，包括《Tres novelitas burguesas》《Cuatro para Delfina》及Taratuta卷中的两部小说。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1344' OR (subject_id='V1-ENT-0452' AND fact_field='bibliographic_note' AND value_text='国家图书馆目录将1996年记录标为1a edición；Google Books同页版次元数据却标reprint。两个记录保留，未经独立审读不裁定字段差异。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1345' OR (subject_id='V1-ENT-0453' AND fact_field='first_publication_year' AND value_text='1956')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1346' OR (subject_id='V1-ENT-0453' AND fact_field='genre_or_form' AND value_text='短篇小说及版画合集（collection）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1347' OR (subject_id='V1-ENT-0453' AND fact_field='one_sentence_summary' AND value_text='这册45页、500册的限量卷收录《El hombrecito》和《Ana María》两篇故事，并配有Nemesio Antúnez三幅版画。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1348' OR (subject_id='V1-ENT-0454' AND fact_field='first_publication_year' AND value_text='1998')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1349' OR (subject_id='V1-ENT-0454' AND fact_field='genre_or_form' AND value_text='新闻文章、纪事选集（collection）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1350' OR (subject_id='V1-ENT-0454' AND fact_field='one_sentence_summary' AND value_text='本卷选收作者自1960年起的新闻作品，包括文章与纪事，由Cecilia García Huidobro按主题编排。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1351' OR (subject_id='V1-ENT-0455' AND fact_field='first_publication_year' AND value_text='2004')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1352' OR (subject_id='V1-ENT-0455' AND fact_field='genre_or_form' AND value_text='文章、纪事与访谈合集（collection）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1353' OR (subject_id='V1-ENT-0455' AND fact_field='one_sentence_summary' AND value_text='本卷收录Donoso 1960年代初的新闻文章、纪事与采访，涉及其观察环境、人群、文学和社会生活的文字。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1354' OR (subject_id='V1-ENT-0456' AND fact_field='first_publication_year' AND value_text='1966')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1355' OR (subject_id='V1-ENT-0456' AND fact_field='genre_or_form' AND value_text='短篇小说选集（collection）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1356' OR (subject_id='V1-ENT-0456' AND fact_field='one_sentence_summary' AND value_text='国家图书馆目录记录的Donoso短篇选集，由Zig-Zag于1966年在圣地亚哥出版，192页。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1357' OR (subject_id='V1-ENT-0456' AND fact_field='bibliographic_note' AND value_text='国家图书馆目录另列《Cuentos》Seix Barral, c1971, 284页；Balcells作品页将Cuentos列1970并称其距“原始出版”约三十年。Cuentos与本题名间的重编/复版关系、日期含义及独立合集层级未由直接对象证据裁定，保持待审。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1358' OR (subject_id='V1-ENT-0179' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1359' OR (subject_id='V1-ENT-0179' AND fact_field='one_sentence_summary' AND value_text='据出版社简介，Flor在Vadinho去世后与药剂师Teodoro再婚；第一任丈夫以鬼魂形态回返，使她重新面对激情与安稳并存的可能。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1360' OR (subject_id='V1-ENT-0180' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1361' OR (subject_id='V1-ENT-0180' AND fact_field='one_sentence_summary' AND value_text='据出版社简介，小说以20世纪20年代伊列乌斯的可可经济扩张为背景，写叙利亚裔纳西布与加布里埃拉的爱情，以及当地现代化与女性通奸惩罚法律之间的冲突。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1362' OR (subject_id='V1-ENT-0181' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1363' OR (subject_id='V1-ENT-0181' AND fact_field='one_sentence_summary' AND value_text='据出版社简介，作品写一群住在萨尔瓦多废弃码头仓库的贫困少年，他们在社会边缘生活；叙事借Pedro Bala、Pirulito、Sem-Pernas等人物展现各自处境与愿望。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1364' OR (subject_id='V1-ENT-0187' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1365' OR (subject_id='V1-ENT-0187' AND fact_field='one_sentence_summary' AND value_text='广告职员胡安·玛丽亚·布劳森在婚姻破裂之际听见邻居克卡的生活声响，一面以阿尔塞的身份试图进入她的生活，一面为电影脚本构想出圣玛丽亚及医生迪亚斯·格雷。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1366' OR (subject_id='V1-ENT-0188' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1367' OR (subject_id='V1-ENT-0188' AND fact_field='one_sentence_summary' AND value_text='拉森被驱逐后返回故地，试图取得废弃造船厂经理职位，并重新追求爱情。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1368' OR (subject_id='V1-ENT-0188' AND fact_field='research_note' AND value_text='Katalin Kulin指出，小说的叙述常由匿名的“我们”或与之认同的人物承担，叙述者像观众一样观看与评论；Larsen、Petrus、Gálvez与Kunz的举止和话语构成一种面向观众的表演，造船厂成为这一表演的舞台。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1369' OR (subject_id='V1-ENT-0189' AND fact_field='genre_or_form' AND value_text='中篇小说（novela corta）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1370' OR (subject_id='V1-ENT-0189' AND fact_field='one_sentence_summary' AND value_text='叙述者根据一位退役篮球运动员与两名女性之间的关系不断提出猜测，这些悬而未决的判断推动了故事。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1371' OR (subject_id='V1-ENT-0190' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1372' OR (subject_id='V1-ENT-0190' AND fact_field='one_sentence_summary' AND value_text='Humberto Peñaloza是Jerónimo Azcoitía的私人秘书，被交付照看其畸形儿并将孩子藏在Rinconada；另一重要场景为Azcoitía家族拥有、由孤儿与老人居住的La Encarnación de la Chumba。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1373' OR (subject_id='V1-ENT-0191' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1374' OR (subject_id='V1-ENT-0191' AND fact_field='one_sentence_summary' AND value_text='Manuela生活在乡镇妓院，小说围绕她与乡镇边缘空间中的人物关系展开，并涉及情色关系及支配。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1375' OR (subject_id='V1-ENT-0192' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1376' OR (subject_id='V1-ENT-0192' AND fact_field='one_sentence_summary' AND value_text='独居的Andrés Ábalos见证九十多岁祖母生命最后阶段及其痴呆；故事亦呈现圣地亚哥旧家族宅邸内的家庭生活。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0398' OR (subject_id='V1-ENT-0172' AND relation_type='CREATED' AND object_id='V1-ENT-0429')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0399' OR (subject_id='V1-ENT-0172' AND relation_type='CREATED' AND object_id='V1-ENT-0430')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0400' OR (subject_id='V1-ENT-0172' AND relation_type='CREATED' AND object_id='V1-ENT-0431')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0401' OR (subject_id='V1-ENT-0172' AND relation_type='CREATED' AND object_id='V1-ENT-0432')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0402' OR (subject_id='V1-ENT-0172' AND relation_type='CREATED' AND object_id='V1-ENT-0433')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0403' OR (subject_id='V1-ENT-0184' AND relation_type='CREATED' AND object_id='V1-ENT-0434')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0404' OR (subject_id='V1-ENT-0184' AND relation_type='CREATED' AND object_id='V1-ENT-0435')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0405' OR (subject_id='V1-ENT-0184' AND relation_type='CREATED' AND object_id='V1-ENT-0436')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0406' OR (subject_id='V1-ENT-0185' AND relation_type='CREATED' AND object_id='V1-ENT-0437')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0407' OR (subject_id='V1-ENT-0185' AND relation_type='CREATED' AND object_id='V1-ENT-0438')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0408' OR (subject_id='V1-ENT-0185' AND relation_type='CREATED' AND object_id='V1-ENT-0439')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0409' OR (subject_id='V1-ENT-0185' AND relation_type='CREATED' AND object_id='V1-ENT-0440')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0410' OR (subject_id='V1-ENT-0185' AND relation_type='CREATED' AND object_id='V1-ENT-0441')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0411' OR (subject_id='V1-ENT-0185' AND relation_type='CREATED' AND object_id='V1-ENT-0442')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0412' OR (subject_id='V1-ENT-0185' AND relation_type='CREATED' AND object_id='V1-ENT-0443')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0413' OR (subject_id='V1-ENT-0185' AND relation_type='CREATED' AND object_id='V1-ENT-0444')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0414' OR (subject_id='V1-ENT-0185' AND relation_type='CREATED' AND object_id='V1-ENT-0445')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0415' OR (subject_id='V1-ENT-0185' AND relation_type='CREATED' AND object_id='V1-ENT-0446')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0416' OR (subject_id='V1-ENT-0185' AND relation_type='CREATED' AND object_id='V1-ENT-0447')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0417' OR (subject_id='V1-ENT-0185' AND relation_type='CREATED' AND object_id='V1-ENT-0448')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0418' OR (subject_id='V1-ENT-0185' AND relation_type='CREATED' AND object_id='V1-ENT-0449')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0419' OR (subject_id='V1-ENT-0185' AND relation_type='CREATED' AND object_id='V1-ENT-0450')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0420' OR (subject_id='V1-ENT-0185' AND relation_type='CREATED' AND object_id='V1-ENT-0451')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0421' OR (subject_id='V1-ENT-0185' AND relation_type='CREATED' AND object_id='V1-ENT-0452')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0422' OR (subject_id='V1-ENT-0185' AND relation_type='CREATED' AND object_id='V1-ENT-0453')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0423' OR (subject_id='V1-ENT-0185' AND relation_type='CREATED' AND object_id='V1-ENT-0454')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0424' OR (subject_id='V1-ENT-0185' AND relation_type='CREATED' AND object_id='V1-ENT-0455')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0425' OR (subject_id='V1-ENT-0185' AND relation_type='CREATED' AND object_id='V1-ENT-0456')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0409','WCD10-B06-S003','Jubiabá','Jubiabá','Jorge Amado','','Companhia das Letras','','','publisher_work_page','','pt','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.companhiadasletras.com.br/9788535913545-jubiaba-3559/p'),
('SRC-0410','WCD10-B06-S004','Tenda dos milagres','Tenda dos milagres','Jorge Amado','','Companhia das Letras','','','publisher_work_page','','pt','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.companhiadasletras.com.br/9788535912906-tenda-dos-milagres-3088/p'),
('SRC-0411','WCD10-B06-S005','Aganju, Xangô, Alapalá. Racismo religioso, resistência e justiça em Tenda dos milagres (o romance e o filme)','Aganju, Xangô, Alapalá. Racismo religioso, resistência e justiça em Tenda dos milagres (o romance e o filme)','Soleni Biscouto Fressato','','SciELO / Estudos Avançados','2023','','scholarly_journal_article','','pt','A','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.scielo.br/j/ea/a/BnYZn9mHDH5MBG7mHjZ6QqS/?lang=pt'),
('SRC-0412','WCD10-B06-S006','Capitães da areia','Capitães da areia','Jorge Amado','','Companhia das Letras','','','publisher_work_page','','pt','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.companhiadasletras.com.br/9788535911695-capitaes-da-areia/p'),
('SRC-0413','WCD10-B06-S007','Dona Flor e seus dois maridos','Dona Flor e seus dois maridos','Jorge Amado','','Companhia das Letras','','','publisher_work_page','','pt','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.companhiadasletras.com.br/9788535911701-dona-flor-e-seus-dois-maridos-2712/p'),
('SRC-0414','WCD10-B06-S008','Gabriela cravo e canela','Gabriela cravo e canela','Jorge Amado','','Companhia das Letras','','','publisher_work_page','','pt','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.companhiadasletras.com.br/9788535920987-gabriela-cravo-e-canela/p'),
('SRC-0415','WCD10-B06-S009','Cacau','Cacau','Jorge Amado','','Companhia das Letras','','','publisher_work_page','','pt','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.companhiadasletras.com.br/9788535917260-cacau/p'),
('SRC-0416','WCD10-B06-S010','Jorge Amado na juventude (1932-1936): O Boletim de Ariel como espaço de reflexão intelectual','Jorge Amado na juventude (1932-1936): O Boletim de Ariel como espaço de reflexão intelectual','Matheus de Mesquita e Pontes','','Cadernos de Pesquisa do CDHIS / Universidade Federal de Uberlândia','2019','','scholarly_journal_article','','pt','A','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://seer.ufu.br/index.php/cdhis/article/view/49243'),
('SRC-0417','WCD10-B06-S011','Literatura e ensino de matemática: uma análise da obra Cacau (1933) de Jorge Amado, com base na Etnomatemática','Literatura e ensino de matemática: uma análise da obra Cacau (1933) de Jorge Amado, com base na Etnomatemática','Josiane Silva Calhau; Zulma Elizabete de Freitas Madruga','','Linguagens, Educação e Sociedade / Universidade Federal do Piauí','2026','','scholarly_journal_article','','pt','A','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.periodicos.ufpi.br/index.php/lingedusoc/article/view/6765'),
('SRC-0418','WCD10-B06-S013','Tocaia grande','Tocaia grande','Jorge Amado','','Companhia das Letras','','','publisher_work_page','','pt','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.companhiadasletras.com.br/9788535911848-tocaia-grande-6498/p'),
('SRC-0419','WCD10-B06-S014','O país do carnaval','O país do carnaval','Jorge Amado','','Companhia das Letras','','','publisher_work_page','','pt','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.companhiadasletras.com.br/9788535917987-o-pais-do-carnaval-1427/p'),
('SRC-0420','WCD10-B06-S103','Juan Carlos Onetti: Historias del otro lado','Juan Carlos Onetti: Historias del otro lado','Eduardo Becerra','','Centro Virtual Cervantes / Instituto Cervantes','','','institutional_critical_essay','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://cvc.cervantes.es/literatura/escritores/onetti/obra.htm'),
('SRC-0421','WCD10-B06-S104','La narrativa breve de Onetti','La narrativa breve de Onetti','Aurora M. Ocampo','','Asociación Internacional de Hispanistas / Centro Virtual Cervantes','','','peer_scholarly_conference_paper_pdf','','es','A','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://cvc.cervantes.es/literatura/aih/pdf/12/aih_12_7_024.pdf'),
('SRC-0422','WCD10-B06-S105','Pequeño dios Larsen','Pequeño dios Larsen','Juan-Manuel García Ramos','','Centro Virtual Cervantes / Instituto Cervantes','','','institutional_scholarly_commentary','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://cvc.cervantes.es/literatura/escritores/onetti/acerca/garcia.htm'),
('SRC-0423','WCD10-B06-S106','Volviendo la mirada hacia "Juntacadáveres" (1964), de Juan Carlos Onetti','Volviendo la mirada hacia "Juntacadáveres" (1964), de Juan Carlos Onetti','Rodrigo Cánovas','','Revista Chilena de Literatura, Facultad de Filosofía y Humanidades, Universidad de Chile','2000','','peer_reviewed_journal_article_and_full_pdf','','es','A','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://revistaliteratura.uchile.cl/index.php/RCL/article/view/39198'),
('SRC-0424','WCD10-B06-S107','Caracteres y estructura en El astillero de J. C. Onetti','Caracteres y estructura en El astillero de J. C. Onetti','KATALIN KULIN','','Asociación Internacional de Hispanistas / Centro Virtual Cervantes','','','peer_scholarly_conference_paper_pdf','','es','A','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://cvc.cervantes.es/literatura/aih/pdf/07/aih_07_2_011.pdf'),
('SRC-0425','WCD10-B06-S108','Aspectos formales de La vida breve de Juan Carlos Onetti','Aspectos formales de La vida breve de Juan Carlos Onetti','JAMES E. IRBY','','Asociación Internacional de Hispanistas / Centro Virtual Cervantes','','','peer_scholarly_conference_paper_pdf','','es','A','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://cvc.cervantes.es/literatura/aih/pdf/03/aih_03_1_052.pdf'),
('SRC-0426','WCD10-B06-S109','Onetti y el palimpsesto de la memoria','Onetti y el palimpsesto de la memoria','Hugo J. Verani','','Asociación Internacional de Hispanistas / Centro Virtual Cervantes','','','peer_scholarly_conference_paper_pdf','','es','A','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://cvc.cervantes.es/literatura/aih/pdf/09/aih_09_2_082.pdf'),
('SRC-0427','WCD10-B06-S110','El último Onetti, o el deber absurdo y sagrado de escribir hasta el final','El último Onetti, o el deber absurdo y sagrado de escribir hasta el final','Teodosio Fernández','','Centro Virtual Cervantes / Instituto Cervantes','','','institutional_scholarly_commentary','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://cvc.cervantes.es/literatura/escritores/onetti/acerca/fernandez.htm'),
('SRC-0428','WCD10-B06-S205','Veraneo y otros cuentos – Memoria Chilena','Veraneo y otros cuentos – Memoria Chilena','Biblioteca Nacional de Chile, Memoria Chilena','','Biblioteca Nacional de Chile / Memoria Chilena','','','institutional_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.memoriachilena.gob.cl/602/w3-article-94934.html'),
('SRC-0429','WCD10-B06-S206','Portada de Veraneo y otros cuentos, 1955 – Memoria Chilena','Portada de Veraneo y otros cuentos, 1955 – Memoria Chilena','Biblioteca Nacional de Chile, Memoria Chilena','','Biblioteca Nacional de Chile / Memoria Chilena','','','national_library_catalog_object','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.memoriachilena.gob.cl/602/w3-article-73146.html'),
('SRC-0430','WCD10-B06-S207','Veraneo y otros cuentos / Summer Vacation and Other Stories – Agencia Literaria Carmen Balcells','Veraneo y otros cuentos / Summer Vacation and Other Stories – Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','official_literary_agency_work_page','','en','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.agenciabalcells.com/en/authors/works/jose-donoso/veraneo-y-otros-cuentos/'),
('SRC-0431','WCD10-B06-S208','Este domingo – Curriculum Nacional, Ministerio de Educación de Chile','Este domingo – Curriculum Nacional, Ministerio de Educación de Chile','Ministerio de Educación de Chile, Unidad de Currículum y Evaluación','','Ministerio de Educación de Chile, Unidad de Currículum y Evaluación','','','government_education_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.curriculumnacional.cl/portal/Palabras-Claves/Relaciones-familiares/88620:Este-domingo'),
('SRC-0432','WCD10-B06-S209','Tres novelitas burguesas – Agencia Literaria Carmen Balcells','Tres novelitas burguesas – Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','official_literary_agency_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.agenciabalcells.com/autores/obra/jose-donoso/tres-novelitas-burguesas/'),
('SRC-0433','WCD10-B06-S210','Casa de campo – Memoria Chilena','Casa de campo – Memoria Chilena','Biblioteca Nacional de Chile, Memoria Chilena','','Biblioteca Nacional de Chile / Memoria Chilena','','','institutional_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.memoriachilena.gob.cl/602/w3-article-94919.html'),
('SRC-0434','WCD10-B06-S211','Portada de Casa de campo, 1978 – Memoria Chilena','Portada de Casa de campo, 1978 – Memoria Chilena','Biblioteca Nacional de Chile, Memoria Chilena','','Biblioteca Nacional de Chile / Memoria Chilena','','','national_library_catalog_object','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.memoriachilena.gob.cl/602/w3-article-73167.html'),
('SRC-0435','WCD10-B06-S212','El jardín de al lado – Memoria Chilena','El jardín de al lado – Memoria Chilena','Biblioteca Nacional de Chile, Memoria Chilena','','Biblioteca Nacional de Chile / Memoria Chilena','','','institutional_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.memoriachilena.gob.cl/602/w3-article-94928.html'),
('SRC-0436','WCD10-B06-S213','Poemas de un novelista – Memoria Chilena','Poemas de un novelista – Memoria Chilena','Biblioteca Nacional de Chile, Memoria Chilena','','Biblioteca Nacional de Chile / Memoria Chilena','','','institutional_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.memoriachilena.gob.cl/602/w3-article-94931.html'),
('SRC-0437','WCD10-B06-S214','La desesperanza – Memoria Chilena','La desesperanza – Memoria Chilena','Biblioteca Nacional de Chile, Memoria Chilena','','Biblioteca Nacional de Chile / Memoria Chilena','','','institutional_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.memoriachilena.gob.cl/602/w3-article-94922.html'),
('SRC-0438','WCD10-B06-S215','Escribió cinco novelas voluminosas – Memoria Chilena','Escribió cinco novelas voluminosas – Memoria Chilena','Biblioteca Nacional de Chile, Memoria Chilena','','Biblioteca Nacional de Chile / Memoria Chilena','','','institutional_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.memoriachilena.gob.cl/602/w3-article-94920.html'),
('SRC-0439','WCD10-B06-S216','A 25 AÑOS DE LA HISTORIA PERSONAL DEL «BOOM» DE JOSÉ DONOSO','A 25 AÑOS DE LA HISTORIA PERSONAL DEL «BOOM» DE JOSÉ DONOSO','Nadine Dejong','','CyberHumanitatis / Universidad de Chile','','','academic_article','','es','A','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://web.uchile.cl/publicaciones/cyber/14/tx12ndejong.html'),
('SRC-0440','WCD10-B06-S217','Casa de campo – Agencia Literaria Carmen Balcells','Casa de campo – Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.agenciabalcells.com/autores/obra/jose-donoso/casa-de-campo/'),
('SRC-0441','WCD10-B06-S218','La misteriosa desaparición de la Marquesita de Loria – Agencia Literaria Carmen Balcells','La misteriosa desaparición de la Marquesita de Loria – Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.agenciabalcells.com/autores/obra/jose-donoso/la-misteriosa-desaparicion-de-la-marquesita-de-loria/'),
('SRC-0442','WCD10-B06-S220','Taratuta. Naturaleza muerta con cachimba – Agencia Literaria Carmen Balcells','Taratuta. Naturaleza muerta con cachimba – Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.agenciabalcells.com/autores/obra/jose-donoso/taratuta-naturaleza-muerta-con-cachimba/'),
('SRC-0443','WCD10-B06-S221','El obsceno pájaro de la noche – Agencia Literaria Carmen Balcells','El obsceno pájaro de la noche – Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.agenciabalcells.com/autores/obra/jose-donoso/el-obsceno-pajaro-de-la-noche/'),
('SRC-0444','WCD10-B06-S222','El lugar sin límites – Agencia Literaria Carmen Balcells','El lugar sin límites – Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.agenciabalcells.com/autores/obra/jose-donoso/el-lugar-sin-limites/'),
('SRC-0445','WCD10-B06-S223','Coronación – Agencia Literaria Carmen Balcells','Coronación – Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.agenciabalcells.com/autores/obra/jose-donoso/coronacion/'),
('SRC-0446','WCD10-B06-S224','Este domingo – Agencia Literaria Carmen Balcells','Este domingo – Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.agenciabalcells.com/autores/obra/jose-donoso/este-domingo/'),
('SRC-0447','WCD10-B06-S225','El Mocho – Agencia Literaria Carmen Balcells','El Mocho – Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.agenciabalcells.com/autores/obra/jose-donoso/el-mocho/'),
('SRC-0448','WCD10-B06-S226','Lagartija sin cola – Agencia Literaria Carmen Balcells','Lagartija sin cola – Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.agenciabalcells.com/autores/obra/jose-donoso/lagartija-sin-cola/'),
('SRC-0449','WCD10-B06-S227','Cuentos – Agencia Literaria Carmen Balcells','Cuentos – Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.agenciabalcells.com/autores/obra/jose-donoso/cuentos/'),
('SRC-0450','WCD10-B06-S228','Charlestón – Agencia Literaria Carmen Balcells','Charlestón – Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.agenciabalcells.com/autores/obra/jose-donoso/charleston/'),
('SRC-0451','WCD10-B06-S229','Portada de Nueve novelas breves, 1996 – Memoria Chilena','Portada de Nueve novelas breves, 1996 – Memoria Chilena','Biblioteca Nacional de Chile, Memoria Chilena','','Biblioteca Nacional de Chile / Memoria Chilena','','','institutional_catalogue','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.memoriachilena.gob.cl/602/w3-article-73181.html'),
('SRC-0452','WCD10-B06-S230','Nueve novelas breves – Google Books','Nueve novelas breves – Google Books','Google Books / Alfaguara metadata','','Google Books / Alfaguara supplied metadata','','','publisher_bibliographic_record','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://books.google.com/books/about/Nueve_novelas_breves.html?hl=en&id=LQNfAAAAMAAJ'),
('SRC-0453','WCD10-B06-S231','Donoso & Antúnez. A propósito de algunos paratextos icónicos','Donoso & Antúnez. A propósito de algunos paratextos icónicos','Juan D. Cid Hidalgo','','Anales de Literatura Chilena','2024','','scholarly_article_pdf','','es','A','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://revistanortegrande.uc.cl/index.php/alch/article/download/81310/61824/237132'),
('SRC-0454','WCD10-B06-S232','Artículos de incierta necesidad – Agencia Literaria Carmen Balcells','Artículos de incierta necesidad – Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.agenciabalcells.com/autores/obra/jose-donoso/articulos-de-incierta-necesidad/'),
('SRC-0455','WCD10-B06-S233','EL ESCRIBIDOR INTRUSO – Ediciones UDP','EL ESCRIBIDOR INTRUSO – Ediciones UDP','Ediciones UDP','','Ediciones UDP','','','publisher_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://ediciones.udp.cl/libro/el-escribidor-intruso/'),
('SRC-0456','WCD10-B06-S234','Donoso, José, 1924-1996 – Referencias bibliográficas, Memoria Chilena','Donoso, José, 1924-1996 – Referencias bibliográficas, Memoria Chilena','Biblioteca Nacional de Chile, Memoria Chilena','','Biblioteca Nacional de Chile / Memoria Chilena','','','institutional_bibliography','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.memoriachilena.gob.cl/602/w3-propertyvalue-1179072.html'),
('SRC-0457','WCD10-B06-S235','Donde van a morir los elefantes – Agencia Literaria Carmen Balcells','Donde van a morir los elefantes – Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.agenciabalcells.com/autores/obra/jose-donoso/donde-van-a-morir-los-elefantes/'),
('SRC-0458','WCD10-B06-S236','El jardín de al lado – Agencia Literaria Carmen Balcells','El jardín de al lado – Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_work_page','','es','B','access_pass','WCD-10-B06','Research-only; package summaries/metadata remain outside Curation and public admission.','remote_only','','https://www.agenciabalcells.com/autores/obra/jose-donoso/el-jardin-de-al-lado/');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0429','work','《朱比亚巴》','Jubiabá','candidate','1','WCD10-B06-W001','ABL与国家图书馆书目显示其为作者早期重要长篇；当前Master无同名作品实体。出版机构对象页提供体裁和具体情节，可满足对象级释义。; 中文仅按原题音译作候选显示名，未核实正式中文译本/规范译名；以葡语原题为身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0430','work','《奇迹帐篷》','Tenda dos milagres','candidate','1','WCD10-B06-W002','ABL书目与直接研究论文支持1969出版年；出版社对象页支持小说体裁与情节，另有A层论文直接研究小说。当前Master无同名作品实体。; 中文仅为直译性质的候选显示名，未核实正式中文译本/规范译名；以葡语原题为身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0431','work','《可可》','Cacau','candidate','1','WCD10-B06-W003','ABL与两篇直接学术研究共同支持1933；出版社直接对象简介支持体裁措辞和具体释义。当前库无同名实体。; 中文暂译《可可》，未核实正式中文译本或规范译名；以葡语原题作身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0432','work','《狂欢节之国》','O país do carnaval','candidate','1','WCD10-B06-W004','ABL书目与出版社对象页共同支持1931；出版社页提供小说体裁和具体人物/叙事梗概。未发现主库同名对象。当前只有B级对象释义，明确保留A级独立对象研究缺口。; 中文暂译《狂欢节之国》，未核实正式中文译本或规范译名；以葡语原题作身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0433','work','《大伏击》','Tocaia grande','candidate','1','WCD10-B06-W005','ABL书目与出版社对象页支持1984；BNDigital页面直接称其为romance，支持体裁字段，并另记与作品出版年的差异说法。出版社页面提供具体情节。未发现主库同名对象。; 中文暂译《大伏击》，未核实正式中文译本或规范译名；以葡语原题作身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0434','work','《井》','El pozo','candidate','1','WCD10-B06-W101','补入奥内蒂首部中篇小说（novela corta）；CVC首版书目与直接研究分别支持首版年份、体裁及对象简介。; 中文名仅作暂译，未核定正式中文译本；西语原题为实体身份锚点。按独立小说作品建对象，不与首版或选集混层。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0435','work','《收尸人》','Juntacadáveres','candidate','1','WCD10-B06-W102','补入以Larsen为中心的圣玛丽亚系列重要小说；CVC首版目录与大学期刊的直接研究摘要可核原题、年份、小说类型及对象内容。; 中文名为暂译，未核定正式中文译本；保留西语原题，不与同名选集或版本混同。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0436','work','《让风说话》','Dejemos hablar al viento','candidate','1','WCD10-B06-W103','补入重要的Santa María系列小说；CVC首版书目与直接作品研究支持原题/年份/体裁和对象简介。当前提交本作品的书目及直接对象证据，不声称覆盖全部奥内蒂作品或研究。; 中文名仅作暂译，未核定正式中文译本；西语原题为实体身份锚点。按独立小说作品建对象，不与版本或选集混层。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0437','collection','《夏日度假及其他故事》','Veraneo y otros cuentos','candidate','1','WCD10-B06-W201','补入有作者档案“首部故事集”、作品对象“首书”及国家图书馆1955年/115页馆藏记录支撑的故事集候选。Agencia英文对象页年份栏列1951，而同页正文称首卷1955年出现；保留其内部冲突，不把S206称作明示1a edición。 作品清单末篇按Memoria Chilena页面拼写“Dinamanquero”照录；其他资料出现“Dinamarquero”，原书目录未独立逐字核验，不将拼写差异裁定为单篇作品实体。; 中文为直译候选，未核实正式中文译本或出版标题；原文题名为对象锚点。书卷/作品集层级不拆分单篇，也不把同名短篇与整部故事集混同。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0438','work','《这个星期日》','Este domingo','candidate','1','WCD10-B06-W202','补入作者1966年小说作品，并用智利教育部图书资源的作品级简介补足现有研究覆盖；不从家庭场景推断作品地点关系。; 中文为题名直译候选，未核实正式中文译本；保留西语原题。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0439','collection','《三部资产阶级中篇小说》','Tres novelitas burguesas','candidate','1','WCD10-B06-W203','1973年出版的合题书卷，作品页称其为tríptico、由三个relatos组成；Schema把收录多个作品的书卷建为collection。页面未列三个子作题名，故只记录合辑层，不拆建子作实体。; 暂译仅表达题名层级；“novelitas”按来源明确的三部短篇幅小说处理为合集，不声称存在已核实的正式中文书名；原题保持为collection名称。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0440','work','《乡间别墅》','Casa de campo','candidate','1','WCD10-B06-W204','补入有国家图书馆一版目录、专作介绍及故事简介支持的1978年小说。作者经纪机构作品导航列1979；此日期差异原样记录，不将其擅释为版次或奖项。; 中文为题名直译候选，未核实正式中文译本；保留西语原题。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0441','work','《隔壁的花园》','El jardín de al lado','candidate','1','WCD10-B06-W205','补入1981年小说及作品级简介；区分1981首版年份与小说内人物的叙述、流亡背景，不建立未受直接证据支持的SET_IN关系。; 中文为题名直译候选，未核实正式中文译本；保留西语原题。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0442','collection','《一位小说家的诗》','Poemas de un novelista','candidate','1','WCD10-B06-W206','补入多诺索唯一诗歌类书籍，区分1981年书籍出版年和各诗写作年份；不把其中单篇诗拆作作品，也不将写作地点延伸成作品地点关系。; 中文为题名直译候选，未核实正式中文译本；原文题名为书籍层级锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0443','work','《绝望》','La desesperanza','candidate','1','WCD10-B06-W207','补入1986年小说及对象级内容；将1985年的作者写作地点/时间与书籍出版年分开。; 中文为候选直译，未核实正式中文译本或出版用名；保留原文题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0444','work','《大象去往死亡之地》','Donde van a morir los elefantes','candidate','1','WCD10-B06-W208','补入1995年小说。作者档案书目可核验书籍出版记录，作品专页给出面向对象的概述；不把评论概述提升为主题关系。; 中文为候选直译，未核实正式中文译本；保留西语原题。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0445','work','《关于我族记忆的推想》','Conjeturas sobre la memoria de mi tribu','candidate','1','WCD10-B06-W209','补入1996年围绕家族史与祖先记忆的自传性作品；不将记忆题材写成主题关系。; 中文为候选直译，未核实正式中文译本；保留西语原题。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0446','work','《“Boom”的个人史》','Historia personal del ''boom''','candidate','1','WCD10-B06-W210','补入有直接学术研究明确首版年份及版本层次的文学随笔作品；只登记1972初版，不将1983重版中的附录当作1972首版内容或单独作品。; 中文为候选译题，未核实正式中文出版标题；原题中的boom保留，不与1983年增补版合并成另一新作。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0447','work','《洛丽亚侯爵小姐的神秘失踪》','La misteriosa desaparición de la Marquesita de Loria','candidate','1','WCD10-B06-W211','1980年对象页明确列为单部长篇小说，并给出主人公、城市、时代与人物弧线；按work候选，不拆题名。; 中文候选为工作性暂译，未核实正式中译；保留原题名及其书卷层级，审核前不作为正式显示名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0448','collection','《塔拉图塔：持烟斗的静物》（暂译）','Taratuta. Naturaleza muerta con cachimba','candidate','1','WCD10-B06-W213','1990合题书卷页面分别介绍Taratuta与Naturaleza muerta con cachimba两部小说；按collection记录该单册含两部作品，不拆单篇。; 中文候选为工作性暂译，未核实正式中译；保留原题名及其书卷层级，审核前不作为正式显示名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0449','work','《莫乔》','El Mocho','candidate','1','WCD10-B06-W214','直接作品页与国家馆藏书目支持1997年遗作小说，出版经纪对象页提供煤矿、军政府及人物群体的作品级概述。; 中文候选为工作性暂译，未核实正式中译；保留原题名及其书卷层级，审核前不作为正式显示名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0450','work','《无尾蜥蜴》','Lagartija sin cola','candidate','1','WCD10-B06-W215','对象页列2007年遗作小说并提供明确人物/情节介绍，另将1973年写作起点单独记为创作史。; 中文候选为工作性暂译，未核实正式中译；保留原题名及其书卷层级，审核前不作为正式显示名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0451','collection','《查尔斯顿》（原题保留）','Charlestón','candidate','1','WCD10-B06-W216','1960年作品对象页标明Relatos并明确书卷包含六篇短篇，符合Schema collection层级。; 中文候选为工作性暂译，未核实正式中译；保留原题名及其书卷层级，审核前不作为正式显示名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0452','collection','《九部中篇小说》','Nueve novelas breves','candidate','1','WCD10-B06-W217','国家馆藏明确记录此书卷1996年第一版；Google Books对卷内内容的直接出版说明称之收录此前刊于三个独立书卷的九部中篇，故按collection建合辑层、不拆子作。; 中文候选为工作性暂译，未核实正式中译；保留原题名及其书卷层级，审核前不作为正式显示名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0453','collection','《两个故事》（原题保留）','Dos cuentos','candidate','1','WCD10-B06-W218','1956对象由两篇故事构成并与三幅版画组成限量书卷；学术论文和国家馆藏记录直接给出层级与物理形态，按collection处理。; 中文候选为工作性暂译，未核实正式中译；保留原题名及其书卷层级，审核前不作为正式显示名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0454','collection','（暂用原题）','Artículos de incierta necesidad','candidate','1','WCD10-B06-W219','直接对象页标1998年出版，并说明为Cecilia García Huidobro按主题编排的Donoso新闻作品选集。; 中文候选为工作性暂译，未核实正式中译；保留原题名及其书卷层级，审核前不作为正式显示名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0455','collection','《闯入者写手》（暂译）','El escribidor intruso','candidate','1','WCD10-B06-W220','出版社页面提供副题、编辑出版元数据和文章/纪事/采访对象描述；按多篇新闻写作的合集层级处理。; 中文候选为工作性暂译，未核实正式中译；保留原题名及其书卷层级，审核前不作为正式显示名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0456','collection','（短篇选集；中文题名暂不定）','Los mejores cuentos de José Donoso','candidate','1','WCD10-B06-W221','国家图书馆作者书目直接著录该题名为Zig-Zag 1966年版、192页；作为明确题名的短篇选集候选，和后续Cuentos版次/重编的关系单列待审，不把1970或1971目录栏头移作其首版年。; 中文候选为工作性描述，未核实正式中译；原题用于检索和审核，待正式显示名审定。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0425','WCD10-B06-W001','WCD-10-B06','WCD10-B06-W001','V1-ENT-0429','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0426','WCD10-B06-W002','WCD-10-B06','WCD10-B06-W002','V1-ENT-0430','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0427','WCD10-B06-W003','WCD-10-B06','WCD10-B06-W003','V1-ENT-0431','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0428','WCD10-B06-W004','WCD-10-B06','WCD10-B06-W004','V1-ENT-0432','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0429','WCD10-B06-W005','WCD-10-B06','WCD10-B06-W005','V1-ENT-0433','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0430','WCD10-B06-W101','WCD-10-B06','WCD10-B06-W101','V1-ENT-0434','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0431','WCD10-B06-W102','WCD-10-B06','WCD10-B06-W102','V1-ENT-0435','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0432','WCD10-B06-W103','WCD-10-B06','WCD10-B06-W103','V1-ENT-0436','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0433','WCD10-B06-W201','WCD-10-B06','WCD10-B06-W201','V1-ENT-0437','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0434','WCD10-B06-W202','WCD-10-B06','WCD10-B06-W202','V1-ENT-0438','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0435','WCD10-B06-W203','WCD-10-B06','WCD10-B06-W203','V1-ENT-0439','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0436','WCD10-B06-W204','WCD-10-B06','WCD10-B06-W204','V1-ENT-0440','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0437','WCD10-B06-W205','WCD-10-B06','WCD10-B06-W205','V1-ENT-0441','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0438','WCD10-B06-W206','WCD-10-B06','WCD10-B06-W206','V1-ENT-0442','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0439','WCD10-B06-W207','WCD-10-B06','WCD10-B06-W207','V1-ENT-0443','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0440','WCD10-B06-W208','WCD-10-B06','WCD10-B06-W208','V1-ENT-0444','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0441','WCD10-B06-W209','WCD-10-B06','WCD10-B06-W209','V1-ENT-0445','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0442','WCD10-B06-W210','WCD-10-B06','WCD10-B06-W210','V1-ENT-0446','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0443','WCD10-B06-W211','WCD-10-B06','WCD10-B06-W211','V1-ENT-0447','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0444','WCD10-B06-W213','WCD-10-B06','WCD10-B06-W213','V1-ENT-0448','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0445','WCD10-B06-W214','WCD-10-B06','WCD10-B06-W214','V1-ENT-0449','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0446','WCD10-B06-W215','WCD-10-B06','WCD10-B06-W215','V1-ENT-0450','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0447','WCD10-B06-W216','WCD-10-B06','WCD10-B06-W216','V1-ENT-0451','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0448','WCD10-B06-W217','WCD-10-B06','WCD10-B06-W217','V1-ENT-0452','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0449','WCD10-B06-W218','WCD-10-B06','WCD10-B06-W218','V1-ENT-0453','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0450','WCD10-B06-W219','WCD-10-B06','WCD10-B06-W219','V1-ENT-0454','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0451','WCD10-B06-W220','WCD-10-B06','WCD10-B06-W220','V1-ENT-0455','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0452','WCD10-B06-W221','WCD-10-B06','WCD10-B06-W221','V1-ENT-0456','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0344','WCD-10-B06:V1-ENT-0429','V1-ENT-0429','work','《朱比亚巴》','若热·亚马多','Jubiabá','巴西','pt','1935','长篇小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《朱比亚巴》｜Jubiabá

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1935
- genre_or_form：长篇小说
- one_sentence_summary：据出版社简介，作品以孤儿安东尼奥·巴尔杜伊诺为中心，追写他在萨尔瓦多街头、烟草种植园、巡回马戏团和码头之间经历的生活转折，直至参加罢工。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0345','WCD-10-B06:V1-ENT-0430','V1-ENT-0430','work','《奇迹帐篷》','若热·亚马多','Tenda dos milagres','巴西','pt','1969','长篇小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《奇迹帐篷》｜Tenda dos milagres

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1969
- genre_or_form：长篇小说
- one_sentence_summary：据出版社简介，小说以萨尔瓦多一间印刷铺及其周边为场景，围绕自学研究非裔文化并主张混血社会的Pedro Archanjo展开，并以两个时代交错回望其生平。

#### 署名研究说明（research_note_only）

- Soleni Biscouto Fressato的文章同时研究1969年小说与1977年电影；此处只转述其明确涉及小说的分析：小说将candomblé呈现为黑人与混血群体的身份、抵抗及争取正义的场域，并以两个叙事时段展开。不得移用电影独有的人物、改编或场景细节。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0346','WCD-10-B06:V1-ENT-0431','V1-ENT-0431','work','《可可》','若热·亚马多','Cacau','巴西','pt','1933','小说（出版社称 pequeno romance；不据此细分篇幅类别）','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《可可》｜Cacau

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1933
- genre_or_form：小说（出版社称 pequeno romance；不据此细分篇幅类别）
- one_sentence_summary：据出版社简介，小说由一名曾做过工厂工人的农场劳动者以第一人称叙述，写其在巴伊亚可可产区劳动并形成社会与政治意识的经历。

#### 署名研究说明（research_note_only）

- Matheus de Mesquita e Pontes将《Cacau》(1933)置于Amado早期“romances proletários”与阶级、地区、种族议题的出版脉络；Josiane Silva Calhau与Zulma Elizabete de Freitas Madruga则直接分析小说所写可可种植劳动者的实践知识及社会文化语境。以上为研究者归属明确的对象研究摘要，不把单一教学研究概括成作品唯一主题。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0347','WCD-10-B06:V1-ENT-0432','V1-ENT-0432','work','《狂欢节之国》','若热·亚马多','O país do carnaval','巴西','pt','1931','长篇小说（romance）','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《狂欢节之国》｜O país do carnaval

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1931
- genre_or_form：长篇小说（romance）
- one_sentence_summary：据出版社简介，青年农场主之子Paulo Rigger从巴黎返巴西后，先在里约、后在萨尔瓦多与诗人和记者交往，周围人物在爱情、金钱、政治、资产阶级生活与宗教中寻找人生意义。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0348','WCD-10-B06:V1-ENT-0433','V1-ENT-0433','work','《大伏击》','若热·亚马多','Tocaia grande','巴西','pt','1984','长篇小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《大伏击》｜Tocaia grande

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1984
- genre_or_form：长篇小说
- one_sentence_summary：据出版社简介，小说写20世纪初一处因暴力伏击与土地争夺而兴起的村镇；Natário da Fonseca取得并经营土地，商贩、妓女、赶骡人和前奴隶等陆续聚居，形成聚落。
- bibliographic_note：ABL书目列Tocaia Grande（1984），Companhia das Letras对象页直接写Publicado em 1984；BNDigital署名文章第54行则以将来式称作品将于1988出版。该差异保留作来源冲突记录，当前不推断其原因。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0349','WCD-10-B06:V1-ENT-0434','V1-ENT-0434','work','《井》','胡安·卡洛斯·奥内蒂','El pozo','乌拉圭','es','1939','中篇小说（novela corta）','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《井》｜El pozo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1939
- genre_or_form：中篇小说（novela corta）
- one_sentence_summary：Linacero在独处中借回忆、梦境与想象组织自己的内在故事，以此应对现实处境带来的倦怠。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0350','WCD-10-B06:V1-ENT-0435','V1-ENT-0435','work','《收尸人》','胡安·卡洛斯·奥内蒂','Juntacadáveres','乌拉圭','es','1964','小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《收尸人》｜Juntacadáveres

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1964
- genre_or_form：小说
- one_sentence_summary：拉森带着三名妓女乘火车抵达圣玛丽亚，获准在那里开设妓院；妓院依法关闭后，他与同伴离开。

#### 署名研究说明（research_note_only）

- Rodrigo Cánovas认为，小说把空间安排与人物功能组织成万花筒式结构，使看似对立的地点和人物彼此等同或映照。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0351','WCD-10-B06:V1-ENT-0436','V1-ENT-0436','work','《让风说话》','胡安·卡洛斯·奥内蒂','Dejemos hablar al viento','乌拉圭','es','1979','小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《让风说话》｜Dejemos hablar al viento

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1979
- genre_or_form：小说
- one_sentence_summary：警长Medina返回Santa María，试图与可能是其儿子的Julián重建关系并使他脱离Frieda的影响；结尾由Colorado在Medina、Díaz Grey等人的配合下纵火，Santa María陷入火焰。

#### 署名研究说明（research_note_only）

- Hugo J. Verani将《Dejemos hablar al viento》视为Santa María系列的收束，并指出作品吸收、改写奥内蒂先前叙事，形成互文结构。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0352','WCD-10-B06:V1-ENT-0437','V1-ENT-0437','collection','《夏日度假及其他故事》','何塞·多诺索','Veraneo y otros cuentos','智利','es','1955','短篇小说集（七则故事）','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《夏日度假及其他故事》｜Veraneo y otros cuentos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1955
- genre_or_form：短篇小说集（七则故事）
- one_sentence_summary：Memoria Chilena的《Veraneo y otros cuentos》作品页列出《Veraneo》《Tocayos》《El Güero》《Una señora》《Fiesta en grande》《Dos cartas》和《Dinamanquero》七篇故事。
- bibliographic_note：作者档案称1955年为其首部故事集；国家图书馆馆藏记录《Veraneo y otros cuentos》1955年、115页，但该条目没有“1a edición”标记。Balcells英文作品页年份栏列1951、正文却称首部故事集于1955年出版，差异照录待审。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0353','WCD-10-B06:V1-ENT-0438','V1-ENT-0438','work','《这个星期日》','何塞·多诺索','Este domingo','智利','es','1966','小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《这个星期日》｜Este domingo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1966
- genre_or_form：小说
- one_sentence_summary：Violeta常在雇主夫妇周日外出时与青年Álvaro相处；Álvaro与Chepa的婚姻及婚外关系也在孤独与沟通隔阂中展开。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0354','WCD-10-B06:V1-ENT-0439','V1-ENT-0439','collection','《三部资产阶级中篇小说》','何塞·多诺索','Tres novelitas burguesas','智利','es','1973','中篇小说集（三部中篇小说）','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《三部资产阶级中篇小说》｜Tres novelitas burguesas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1973
- genre_or_form：中篇小说集（三部中篇小说）
- one_sentence_summary：该书卷由三部中篇小说组成，叙事从现实主义渐向梦幻与怪诞；作品页称三部叙事围绕欧洲富裕专业人士的日常生活展开。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0355','WCD-10-B06:V1-ENT-0440','V1-ENT-0440','work','《乡间别墅》','何塞·多诺索','Casa de campo','智利','es','1978','小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《乡间别墅》｜Casa de campo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1978
- genre_or_form：小说
- one_sentence_summary：Ventura家族带着配偶和三十五名子女在远离文明的庄园度夏；父母安排成人野餐并把孩子留在宅邸，孩子们在宅院、广原和外部威胁之间展开自己的行动。
- bibliographic_note：国家图书馆Casa de campo目录对象明确标“1a. edición. Barcelona: Seix Barral, 1978, 498 páginas”；作品页亦称1978出版并另记1979年获奖。Balcells作品页单独将作品列为1979，未解释字段。两项日期保留；首版候选基于明确第一版目录，不将获奖年与出版年混同。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0356','WCD-10-B06:V1-ENT-0441','V1-ENT-0441','work','《隔壁的花园》','何塞·多诺索','El jardín de al lado','智利','es','1981','小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《隔壁的花园》｜El jardín de al lado

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1981
- genre_or_form：小说
- one_sentence_summary：流亡西班牙的智利小说家Julio Méndez渴望获得文学成功，却在创作受挫与接受自身局限之间挣扎；经纪人Núria Monclús和作家Marcelo Chiriboga也牵动他的处境。

#### 署名研究说明（research_note_only）

- 研究者Nadine Dejong将《El jardín de al lado》视为《Historia personal del «boom»》的小说化版本，并分析小说家Julio如何经由对Boom圈子的观察呈现其挫败与排斥感。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0357','WCD-10-B06:V1-ENT-0442','V1-ENT-0442','collection','《一位小说家的诗》','何塞·多诺索','Poemas de un novelista','智利','es','1981','诗集（约三十首诗）','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《一位小说家的诗》｜Poemas de un novelista

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1981
- genre_or_form：诗集（约三十首诗）
- one_sentence_summary：Memoria Chilena称该书为多诺索唯一的诗歌类作品，约收三十首诗，并按四个章节组织；目录同时列有写于1952年的三首诗，不能把全部诗作写作年概括为单一时期。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0358','WCD-10-B06:V1-ENT-0443','V1-ENT-0443','work','《绝望》','何塞·多诺索','La desesperanza','智利','es','1986','小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《绝望》｜La desesperanza

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1986
- genre_or_form：小说
- one_sentence_summary：据Memoria Chilena引述的作者访谈，小说从Matilde Neruda醒来写起，随后跟随一对伴侣在Santiago的一次出行，并在Matilde葬礼收束；来源称全书时间跨度约八小时。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0359','WCD-10-B06:V1-ENT-0444','V1-ENT-0444','work','《大象去往死亡之地》','何塞·多诺索','Donde van a morir los elefantes','智利','es','1995','小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《大象去往死亡之地》｜Donde van a morir los elefantes

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1995
- genre_or_form：小说
- one_sentence_summary：智利文学教授Gustavo Zuleta到美国一所小型大学任教，在妻儿抵达前经历学术圈的嫉妒、权力争斗、性关系与一起造成多人遇害的谋杀案；Ruby进入他的生活。

#### 署名研究说明（research_note_only）

- Dejong将《Donde van a morir los elefantes》称作《El jardín de al lado》的续篇，并比较Marcelo Chiriboga在两书中从“Boom代表性名字”到更具体人物的变化。此为该论文对两部作品的研究归属，不建立作品关系候选。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0360','WCD-10-B06:V1-ENT-0445','V1-ENT-0445','work','《关于我族记忆的推想》','何塞·多诺索','Conjeturas sobre la memoria de mi tribu','智利','es','1996','家族回忆/自传性叙事作品（具体体裁仍待作品专门研究）','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《关于我族记忆的推想》｜Conjeturas sobre la memoria de mi tribu

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1996
- genre_or_form：家族回忆/自传性叙事作品（具体体裁仍待作品专门研究）
- one_sentence_summary：作者以小说化方式叙写家族史和祖先记忆。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0361','WCD-10-B06:V1-ENT-0446','V1-ENT-0446','work','《“Boom”的个人史》','何塞·多诺索','Historia personal del ''boom''','智利','es','1972','自传性文学随笔（兼具文学史论述与传记性纪事）','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《“Boom”的个人史》｜Historia personal del ''boom''

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1972
- genre_or_form：自传性文学随笔（兼具文学史论述与传记性纪事）
- one_sentence_summary：这部自传性文学随笔回顾拉美文学Boom，并在文学史论述与作者个人文学经历之间展开。
- bibliographic_note：Dejong记载《Historia personal del «boom»》1972年首次出版；1983重版增补Donoso的附录《Diez años después》。1972为作品初版候选，1983为增补重版，不另列为第二部作品。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0362','WCD-10-B06:V1-ENT-0447','V1-ENT-0447','work','《洛丽亚侯爵小姐的神秘失踪》','何塞·多诺索','La misteriosa desaparición de la Marquesita de Loria','智利','es','1980','小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《洛丽亚侯爵小姐的神秘失踪》｜La misteriosa desaparición de la Marquesita de Loria

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1980
- genre_or_form：小说
- one_sentence_summary：年轻寡妇Marquesita在1920年代马德里游走，在丧偶后的自由中经历诱惑与感官生活。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0363','WCD-10-B06:V1-ENT-0448','V1-ENT-0448','collection','《塔拉图塔：持烟斗的静物》（暂译）','何塞·多诺索','Taratuta. Naturaleza muerta con cachimba','智利','es','1990','两部小说合卷（collection）','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《塔拉图塔：持烟斗的静物》（暂译）｜Taratuta. Naturaleza muerta con cachimba

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1990
- genre_or_form：两部小说合卷（collection）
- one_sentence_summary：《Taratuta》以马德里和布宜诺斯艾利斯为背景，写到逃离十月革命的俄国人及列宁；《Naturaleza muerta con cachimba》则以一处衰败海滨度假地为背景，描写沉浸在梦想中的小人物。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0364','WCD-10-B06:V1-ENT-0449','V1-ENT-0449','work','《莫乔》','何塞·多诺索','El Mocho','智利','es','1997','小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《莫乔》｜El Mocho

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1997
- genre_or_form：小说
- one_sentence_summary：故事置于煤矿与军政府背景之下，并以妓院和马戏团作为日常生活的另一组场景；作者未及见书出版。
- bibliographic_note：国家图书馆书目记录Aguilar Chilena 1997年版；对象页也列1997，并说明作者未及见出版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0365','WCD-10-B06:V1-ENT-0450','V1-ENT-0450','work','《无尾蜥蜴》','何塞·多诺索','Lagartija sin cola','智利','es','2007','小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《无尾蜥蜴》｜Lagartija sin cola

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：2007
- genre_or_form：小说
- one_sentence_summary：画家Armando Muñoz-Roa与Luisa离开巴塞罗那后，回想他曾试图拯救的Dors小镇及家族衰落。
- bibliographic_note：作品页称Donoso于1973年开始写作后搁置稿件，2007年出版；创作开始年份与出版年份不合并。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0366','WCD-10-B06:V1-ENT-0451','V1-ENT-0451','collection','《查尔斯顿》（原题保留）','何塞·多诺索','Charlestón','智利','es','1960','短篇小说集（六篇）','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《查尔斯顿》（原题保留）｜Charlestón

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1960
- genre_or_form：短篇小说集（六篇）
- one_sentence_summary：该卷收录《El hombrecito》《Ana María》《El charlestón》《La puerta cerrada》《Paseo》和《Santelices》六篇短篇。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0367','WCD-10-B06:V1-ENT-0452','V1-ENT-0452','collection','《九部中篇小说》','何塞·多诺索','Nueve novelas breves','智利','es','1996','九部中篇小说的合辑（collection）','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《九部中篇小说》｜Nueve novelas breves

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1996
- genre_or_form：九部中篇小说的合辑（collection）
- one_sentence_summary：该合辑重收九部此前分见三个独立书卷的中篇小说，包括《Tres novelitas burguesas》《Cuatro para Delfina》及Taratuta卷中的两部小说。
- bibliographic_note：国家图书馆目录将1996年记录标为1a edición；Google Books同页版次元数据却标reprint。两个记录保留，未经独立审读不裁定字段差异。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0368','WCD-10-B06:V1-ENT-0453','V1-ENT-0453','collection','《两个故事》（原题保留）','何塞·多诺索','Dos cuentos','智利','es','1956','短篇小说及版画合集（collection）','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《两个故事》（原题保留）｜Dos cuentos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：短篇小说及版画合集（collection）
- one_sentence_summary：这册45页、500册的限量卷收录《El hombrecito》和《Ana María》两篇故事，并配有Nemesio Antúnez三幅版画。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0369','WCD-10-B06:V1-ENT-0454','V1-ENT-0454','collection','（暂用原题）','何塞·多诺索','Artículos de incierta necesidad','智利','es','1998','新闻文章、纪事选集（collection）','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### （暂用原题）｜Artículos de incierta necesidad

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1998
- genre_or_form：新闻文章、纪事选集（collection）
- one_sentence_summary：本卷选收作者自1960年起的新闻作品，包括文章与纪事，由Cecilia García Huidobro按主题编排。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0370','WCD-10-B06:V1-ENT-0455','V1-ENT-0455','collection','《闯入者写手》（暂译）','何塞·多诺索','El escribidor intruso','智利','es','2004','文章、纪事与访谈合集（collection）','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《闯入者写手》（暂译）｜El escribidor intruso

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：2004
- genre_or_form：文章、纪事与访谈合集（collection）
- one_sentence_summary：本卷收录Donoso 1960年代初的新闻文章、纪事与采访，涉及其观察环境、人群、文学和社会生活的文字。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0371','WCD-10-B06:V1-ENT-0456','V1-ENT-0456','collection','（短篇选集；中文题名暂不定）','何塞·多诺索','Los mejores cuentos de José Donoso','智利','es','1966','短篇小说选集（collection）','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### （短篇选集；中文题名暂不定）｜Los mejores cuentos de José Donoso

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1966
- genre_or_form：短篇小说选集（collection）
- one_sentence_summary：国家图书馆目录记录的Donoso短篇选集，由Zig-Zag于1966年在圣地亚哥出版，192页。
- bibliographic_note：国家图书馆目录另列《Cuentos》Seix Barral, c1971, 284页；Balcells作品页将Cuentos列1970并称其距“原始出版”约三十年。Cuentos与本题名间的重编/复版关系、日期含义及独立合集层级未由直接对象证据裁定，保持待审。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0372','WCD-10-B06:V1-ENT-0179','V1-ENT-0179','work','《弗洛尔和她的两个丈夫》','若热·亚马多','Dona Flor e seus dois maridos','巴西','pt','','长篇小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《弗洛尔和她的两个丈夫》｜Dona Flor e seus dois maridos

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说
- one_sentence_summary：据出版社简介，Flor在Vadinho去世后与药剂师Teodoro再婚；第一任丈夫以鬼魂形态回返，使她重新面对激情与安稳并存的可能。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0373','WCD-10-B06:V1-ENT-0180','V1-ENT-0180','work','《加布里埃拉》','若热·亚马多','Gabriela, cravo e canela','巴西','pt','','长篇小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《加布里埃拉》｜Gabriela, cravo e canela

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说
- one_sentence_summary：据出版社简介，小说以20世纪20年代伊列乌斯的可可经济扩张为背景，写叙利亚裔纳西布与加布里埃拉的爱情，以及当地现代化与女性通奸惩罚法律之间的冲突。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0374','WCD-10-B06:V1-ENT-0181','V1-ENT-0181','work','《沙滩船长》','若热·亚马多','Capitães da Areia','巴西','pt','','长篇小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《沙滩船长》｜Capitães da Areia

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说
- one_sentence_summary：据出版社简介，作品写一群住在萨尔瓦多废弃码头仓库的贫困少年，他们在社会边缘生活；叙事借Pedro Bala、Pirulito、Sem-Pernas等人物展现各自处境与愿望。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0375','WCD-10-B06:V1-ENT-0187','V1-ENT-0187','work','《短暂的生命》','胡安·卡洛斯·奥内蒂','La vida breve','乌拉圭','es','','小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《短暂的生命》｜La vida breve

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：广告职员胡安·玛丽亚·布劳森在婚姻破裂之际听见邻居克卡的生活声响，一面以阿尔塞的身份试图进入她的生活，一面为电影脚本构想出圣玛丽亚及医生迪亚斯·格雷。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0376','WCD-10-B06:V1-ENT-0188','V1-ENT-0188','work','《造船厂》','胡安·卡洛斯·奥内蒂','El astillero','乌拉圭','es','','小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《造船厂》｜El astillero

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：拉森被驱逐后返回故地，试图取得废弃造船厂经理职位，并重新追求爱情。

#### 署名研究说明（research_note_only）

- Katalin Kulin指出，小说的叙述常由匿名的“我们”或与之认同的人物承担，叙述者像观众一样观看与评论；Larsen、Petrus、Gálvez与Kunz的举止和话语构成一种面向观众的表演，造船厂成为这一表演的舞台。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0377','WCD-10-B06:V1-ENT-0189','V1-ENT-0189','work','《告别》','胡安·卡洛斯·奥内蒂','Los adioses','乌拉圭','es','','中篇小说（novela corta）','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《告别》｜Los adioses

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：中篇小说（novela corta）
- one_sentence_summary：叙述者根据一位退役篮球运动员与两名女性之间的关系不断提出猜测，这些悬而未决的判断推动了故事。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0378','WCD-10-B06:V1-ENT-0190','V1-ENT-0190','work','《污秽的夜鸟》','何塞·多诺索','El obsceno pájaro de la noche','智利','es','','小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《污秽的夜鸟》｜El obsceno pájaro de la noche

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：Humberto Peñaloza是Jerónimo Azcoitía的私人秘书，被交付照看其畸形儿并将孩子藏在Rinconada；另一重要场景为Azcoitía家族拥有、由孤儿与老人居住的La Encarnación de la Chumba。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0379','WCD-10-B06:V1-ENT-0191','V1-ENT-0191','work','《无尽的地方》','何塞·多诺索','El lugar sin límites','智利','es','','小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《无尽的地方》｜El lugar sin límites

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：Manuela生活在乡镇妓院，小说围绕她与乡镇边缘空间中的人物关系展开，并涉及情色关系及支配。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0380','WCD-10-B06:V1-ENT-0192','V1-ENT-0192','work','《加冕》','何塞·多诺索','Coronación','智利','es','','小说','WCD-10-B06','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《加冕》｜Coronación

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：独居的Andrés Ábalos见证九十多岁祖母生命最后阶段及其痴呆；故事亦呈现圣地亚哥旧家族宅邸内的家庭生活。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-1260','WCD10-B06-W001-F01','V1-CARD-0344','V1-ENT-0429','first_publication_year','1935','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1261','WCD10-B06-W001-F02','V1-CARD-0344','V1-ENT-0429','genre_or_form','长篇小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1262','WCD10-B06-W001-F03','V1-CARD-0344','V1-ENT-0429','one_sentence_summary','据出版社简介，作品以孤儿安东尼奥·巴尔杜伊诺为中心，追写他在萨尔瓦多街头、烟草种植园、巡回马戏团和码头之间经历的生活转折，直至参加罢工。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1263','WCD10-B06-W002-F01','V1-CARD-0345','V1-ENT-0430','first_publication_year','1969','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1264','WCD10-B06-W002-F02','V1-CARD-0345','V1-ENT-0430','genre_or_form','长篇小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1265','WCD10-B06-W002-F03','V1-CARD-0345','V1-ENT-0430','one_sentence_summary','据出版社简介，小说以萨尔瓦多一间印刷铺及其周边为场景，围绕自学研究非裔文化并主张混血社会的Pedro Archanjo展开，并以两个时代交错回望其生平。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1266','WCD10-B06-W002-F04','V1-CARD-0345','V1-ENT-0430','research_note','Soleni Biscouto Fressato的文章同时研究1969年小说与1977年电影；此处只转述其明确涉及小说的分析：小说将candomblé呈现为黑人与混血群体的身份、抵抗及争取正义的场域，并以两个叙事时段展开。不得移用电影独有的人物、改编或场景细节。','scholarly_paraphrase','WCD-10-B06','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1267','WCD10-B06-W003-F01','V1-CARD-0346','V1-ENT-0431','first_publication_year','1933','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1268','WCD10-B06-W003-F02','V1-CARD-0346','V1-ENT-0431','genre_or_form','小说（出版社称 pequeno romance；不据此细分篇幅类别）','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1269','WCD10-B06-W003-F03','V1-CARD-0346','V1-ENT-0431','one_sentence_summary','据出版社简介，小说由一名曾做过工厂工人的农场劳动者以第一人称叙述，写其在巴伊亚可可产区劳动并形成社会与政治意识的经历。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1270','WCD10-B06-W003-F04','V1-CARD-0346','V1-ENT-0431','research_note','Matheus de Mesquita e Pontes将《Cacau》(1933)置于Amado早期“romances proletários”与阶级、地区、种族议题的出版脉络；Josiane Silva Calhau与Zulma Elizabete de Freitas Madruga则直接分析小说所写可可种植劳动者的实践知识及社会文化语境。以上为研究者归属明确的对象研究摘要，不把单一教学研究概括成作品唯一主题。','scholarly_paraphrase','WCD-10-B06','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1271','WCD10-B06-W004-F01','V1-CARD-0347','V1-ENT-0432','first_publication_year','1931','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1272','WCD10-B06-W004-F02','V1-CARD-0347','V1-ENT-0432','genre_or_form','长篇小说（romance）','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1273','WCD10-B06-W004-F03','V1-CARD-0347','V1-ENT-0432','one_sentence_summary','据出版社简介，青年农场主之子Paulo Rigger从巴黎返巴西后，先在里约、后在萨尔瓦多与诗人和记者交往，周围人物在爱情、金钱、政治、资产阶级生活与宗教中寻找人生意义。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1274','WCD10-B06-W005-F01','V1-CARD-0348','V1-ENT-0433','first_publication_year','1984','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1275','WCD10-B06-W005-F02','V1-CARD-0348','V1-ENT-0433','genre_or_form','长篇小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1276','WCD10-B06-W005-F03','V1-CARD-0348','V1-ENT-0433','one_sentence_summary','据出版社简介，小说写20世纪初一处因暴力伏击与土地争夺而兴起的村镇；Natário da Fonseca取得并经营土地，商贩、妓女、赶骡人和前奴隶等陆续聚居，形成聚落。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1277','WCD10-B06-W005-F04','V1-CARD-0348','V1-ENT-0433','bibliographic_note','ABL书目列Tocaia Grande（1984），Companhia das Letras对象页直接写Publicado em 1984；BNDigital署名文章第54行则以将来式称作品将于1988出版。该差异保留作来源冲突记录，当前不推断其原因。','bibliographic_note','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1278','WCD10-B06-W101-F01','V1-CARD-0349','V1-ENT-0434','first_publication_year','1939','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1279','WCD10-B06-W101-F02','V1-CARD-0349','V1-ENT-0434','genre_or_form','中篇小说（novela corta）','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1280','WCD10-B06-W101-F03','V1-CARD-0349','V1-ENT-0434','one_sentence_summary','Linacero在独处中借回忆、梦境与想象组织自己的内在故事，以此应对现实处境带来的倦怠。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','只称Linacero，不扩写来源未直接证实的名字“Eladio”；概述限于Becerra作品段及Ocampo论文相关段。'),
('V1-FCT-1281','WCD10-B06-W102-F01','V1-CARD-0350','V1-ENT-0435','first_publication_year','1964','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1282','WCD10-B06-W102-F02','V1-CARD-0350','V1-ENT-0435','genre_or_form','小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1283','WCD10-B06-W102-F03','V1-CARD-0350','V1-ENT-0435','one_sentence_summary','拉森带着三名妓女乘火车抵达圣玛丽亚，获准在那里开设妓院；妓院依法关闭后，他与同伴离开。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','只作直接情节前提，依据Cánovas论文PDF第0页；圣玛丽亚作为虚构空间，不转换为现实地理坐标或SET_IN关系。'),
('V1-FCT-1284','WCD10-B06-W102-F04','V1-CARD-0350','V1-ENT-0435','research_note','Rodrigo Cánovas认为，小说把空间安排与人物功能组织成万花筒式结构，使看似对立的地点和人物彼此等同或映照。','scholarly_paraphrase','WCD-10-B06','high','research_note_only','署名研究释义，仅归属于Cánovas；不作为中性情节事实或主题三元组。全文已读。'),
('V1-FCT-1285','WCD10-B06-W103-F01','V1-CARD-0351','V1-ENT-0436','first_publication_year','1979','bibliographic','WCD-10-B06','high','batch_retained_candidate','CVC书目说明按叙事书籍首版列举；该年指书籍首版，不是写作年、连载年、引用版或网页年。'),
('V1-FCT-1286','WCD10-B06-W103-F02','V1-CARD-0351','V1-ENT-0436','genre_or_form','小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','Verani在论文首页直接称其为novela。'),
('V1-FCT-1287','WCD10-B06-W103-F03','V1-CARD-0351','V1-ENT-0436','one_sentence_summary','警长Medina返回Santa María，试图与可能是其儿子的Julián重建关系并使他脱离Frieda的影响；结尾由Colorado在Medina、Díaz Grey等人的配合下纵火，Santa María陷入火焰。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','短篇情节释义据Verani PDF第5—6页和Fernández网页首段；Santa María为虚构空间，不建立真实地点关系或坐标。'),
('V1-FCT-1288','WCD10-B06-W103-F04','V1-CARD-0351','V1-ENT-0436','research_note','Hugo J. Verani将《Dejemos hablar al viento》视为Santa María系列的收束，并指出作品吸收、改写奥内蒂先前叙事，形成互文结构。','scholarly_paraphrase','WCD-10-B06','high','research_note_only','署名学术释义；完整8页PDF已读，概括限于PDF第0页第3—13行及相关后文。'),
('V1-FCT-1289','WCD10-B06-W201-F01','V1-CARD-0352','V1-ENT-0437','first_publication_year','1955','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1290','WCD10-B06-W201-F02','V1-CARD-0352','V1-ENT-0437','genre_or_form','短篇小说集（七则故事）','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1291','WCD10-B06-W201-F03','V1-CARD-0352','V1-ENT-0437','one_sentence_summary','Memoria Chilena的《Veraneo y otros cuentos》作品页列出《Veraneo》《Tocayos》《El Güero》《Una señora》《Fiesta en grande》《Dos cartas》和《Dinamanquero》七篇故事。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','篇名按Memoria Chilena页面拼写照录；原书目录未独立逐字核对，不据此登记单篇作品身份。'),
('V1-FCT-1292','WCD10-B06-W201-F04','V1-CARD-0352','V1-ENT-0437','bibliographic_note','作者档案称1955年为其首部故事集；国家图书馆馆藏记录《Veraneo y otros cuentos》1955年、115页，但该条目没有“1a edición”标记。Balcells英文作品页年份栏列1951、正文却称首部故事集于1955年出版，差异照录待审。','bibliographic_note','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1293','WCD10-B06-W202-F01','V1-CARD-0353','V1-ENT-0438','first_publication_year','1966','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1294','WCD10-B06-W202-F02','V1-CARD-0353','V1-ENT-0438','genre_or_form','小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1295','WCD10-B06-W202-F03','V1-CARD-0353','V1-ENT-0438','one_sentence_summary','Violeta常在雇主夫妇周日外出时与青年Álvaro相处；Álvaro与Chepa的婚姻及婚外关系也在孤独与沟通隔阂中展开。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1296','WCD10-B06-W203-F01','V1-CARD-0354','V1-ENT-0439','first_publication_year','1973','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1297','WCD10-B06-W203-F02','V1-CARD-0354','V1-ENT-0439','genre_or_form','中篇小说集（三部中篇小说）','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1298','WCD10-B06-W203-F03','V1-CARD-0354','V1-ENT-0439','one_sentence_summary','该书卷由三部中篇小说组成，叙事从现实主义渐向梦幻与怪诞；作品页称三部叙事围绕欧洲富裕专业人士的日常生活展开。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1299','WCD10-B06-W204-F01','V1-CARD-0355','V1-ENT-0440','first_publication_year','1978','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1300','WCD10-B06-W204-F02','V1-CARD-0355','V1-ENT-0440','genre_or_form','小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1301','WCD10-B06-W204-F03','V1-CARD-0355','V1-ENT-0440','one_sentence_summary','Ventura家族带着配偶和三十五名子女在远离文明的庄园度夏；父母安排成人野餐并把孩子留在宅邸，孩子们在宅院、广原和外部威胁之间展开自己的行动。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1302','WCD10-B06-W204-F04','V1-CARD-0355','V1-ENT-0440','bibliographic_note','国家图书馆Casa de campo目录对象明确标“1a. edición. Barcelona: Seix Barral, 1978, 498 páginas”；作品页亦称1978出版并另记1979年获奖。Balcells作品页单独将作品列为1979，未解释字段。两项日期保留；首版候选基于明确第一版目录，不将获奖年与出版年混同。','bibliographic_note','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1303','WCD10-B06-W205-F01','V1-CARD-0356','V1-ENT-0441','first_publication_year','1981','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1304','WCD10-B06-W205-F02','V1-CARD-0356','V1-ENT-0441','genre_or_form','小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1305','WCD10-B06-W205-F03','V1-CARD-0356','V1-ENT-0441','one_sentence_summary','流亡西班牙的智利小说家Julio Méndez渴望获得文学成功，却在创作受挫与接受自身局限之间挣扎；经纪人Núria Monclús和作家Marcelo Chiriboga也牵动他的处境。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1306','WCD10-B06-W205-F04','V1-CARD-0356','V1-ENT-0441','research_note','研究者Nadine Dejong将《El jardín de al lado》视为《Historia personal del «boom»》的小说化版本，并分析小说家Julio如何经由对Boom圈子的观察呈现其挫败与排斥感。','scholarly_paraphrase','WCD-10-B06','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1307','WCD10-B06-W206-F01','V1-CARD-0357','V1-ENT-0442','first_publication_year','1981','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1308','WCD10-B06-W206-F02','V1-CARD-0357','V1-ENT-0442','genre_or_form','诗集（约三十首诗）','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1309','WCD10-B06-W206-F03','V1-CARD-0357','V1-ENT-0442','one_sentence_summary','Memoria Chilena称该书为多诺索唯一的诗歌类作品，约收三十首诗，并按四个章节组织；目录同时列有写于1952年的三首诗，不能把全部诗作写作年概括为单一时期。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1310','WCD10-B06-W207-F01','V1-CARD-0358','V1-ENT-0443','first_publication_year','1986','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1311','WCD10-B06-W207-F02','V1-CARD-0358','V1-ENT-0443','genre_or_form','小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1312','WCD10-B06-W207-F03','V1-CARD-0358','V1-ENT-0443','one_sentence_summary','据Memoria Chilena引述的作者访谈，小说从Matilde Neruda醒来写起，随后跟随一对伴侣在Santiago的一次出行，并在Matilde葬礼收束；来源称全书时间跨度约八小时。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1313','WCD10-B06-W208-F01','V1-CARD-0359','V1-ENT-0444','first_publication_year','1995','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1314','WCD10-B06-W208-F02','V1-CARD-0359','V1-ENT-0444','genre_or_form','小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1315','WCD10-B06-W208-F03','V1-CARD-0359','V1-ENT-0444','one_sentence_summary','智利文学教授Gustavo Zuleta到美国一所小型大学任教，在妻儿抵达前经历学术圈的嫉妒、权力争斗、性关系与一起造成多人遇害的谋杀案；Ruby进入他的生活。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1316','WCD10-B06-W208-F04','V1-CARD-0359','V1-ENT-0444','research_note','Dejong将《Donde van a morir los elefantes》称作《El jardín de al lado》的续篇，并比较Marcelo Chiriboga在两书中从“Boom代表性名字”到更具体人物的变化。此为该论文对两部作品的研究归属，不建立作品关系候选。','scholarly_paraphrase','WCD-10-B06','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1317','WCD10-B06-W209-F01','V1-CARD-0360','V1-ENT-0445','first_publication_year','1996','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1318','WCD10-B06-W209-F02','V1-CARD-0360','V1-ENT-0445','genre_or_form','家族回忆/自传性叙事作品（具体体裁仍待作品专门研究）','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1319','WCD10-B06-W209-F03','V1-CARD-0360','V1-ENT-0445','one_sentence_summary','作者以小说化方式叙写家族史和祖先记忆。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1320','WCD10-B06-W210-F01','V1-CARD-0361','V1-ENT-0446','first_publication_year','1972','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1321','WCD10-B06-W210-F02','V1-CARD-0361','V1-ENT-0446','genre_or_form','自传性文学随笔（兼具文学史论述与传记性纪事）','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1322','WCD10-B06-W210-F03','V1-CARD-0361','V1-ENT-0446','one_sentence_summary','这部自传性文学随笔回顾拉美文学Boom，并在文学史论述与作者个人文学经历之间展开。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1323','WCD10-B06-W210-F04','V1-CARD-0361','V1-ENT-0446','bibliographic_note','Dejong记载《Historia personal del «boom»》1972年首次出版；1983重版增补Donoso的附录《Diez años después》。1972为作品初版候选，1983为增补重版，不另列为第二部作品。','bibliographic_note','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1324','WCD10-B06-W211-F01','V1-CARD-0362','V1-ENT-0447','first_publication_year','1980','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1325','WCD10-B06-W211-F02','V1-CARD-0362','V1-ENT-0447','genre_or_form','小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1326','WCD10-B06-W211-F03','V1-CARD-0362','V1-ENT-0447','one_sentence_summary','年轻寡妇Marquesita在1920年代马德里游走，在丧偶后的自由中经历诱惑与感官生活。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1327','WCD10-B06-W213-F01','V1-CARD-0363','V1-ENT-0448','first_publication_year','1990','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1328','WCD10-B06-W213-F02','V1-CARD-0363','V1-ENT-0448','genre_or_form','两部小说合卷（collection）','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1329','WCD10-B06-W213-F03','V1-CARD-0363','V1-ENT-0448','one_sentence_summary','《Taratuta》以马德里和布宜诺斯艾利斯为背景，写到逃离十月革命的俄国人及列宁；《Naturaleza muerta con cachimba》则以一处衰败海滨度假地为背景，描写沉浸在梦想中的小人物。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1330','WCD10-B06-W214-F01','V1-CARD-0364','V1-ENT-0449','first_publication_year','1997','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1331','WCD10-B06-W214-F02','V1-CARD-0364','V1-ENT-0449','genre_or_form','小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1332','WCD10-B06-W214-F03','V1-CARD-0364','V1-ENT-0449','one_sentence_summary','故事置于煤矿与军政府背景之下，并以妓院和马戏团作为日常生活的另一组场景；作者未及见书出版。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1333','WCD10-B06-W214-F04','V1-CARD-0364','V1-ENT-0449','bibliographic_note','国家图书馆书目记录Aguilar Chilena 1997年版；对象页也列1997，并说明作者未及见出版。','bibliographic_note','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1334','WCD10-B06-W215-F01','V1-CARD-0365','V1-ENT-0450','first_publication_year','2007','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1335','WCD10-B06-W215-F02','V1-CARD-0365','V1-ENT-0450','genre_or_form','小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1336','WCD10-B06-W215-F03','V1-CARD-0365','V1-ENT-0450','one_sentence_summary','画家Armando Muñoz-Roa与Luisa离开巴塞罗那后，回想他曾试图拯救的Dors小镇及家族衰落。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1337','WCD10-B06-W215-F04','V1-CARD-0365','V1-ENT-0450','bibliographic_note','作品页称Donoso于1973年开始写作后搁置稿件，2007年出版；创作开始年份与出版年份不合并。','bibliographic_note','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1338','WCD10-B06-W216-F01','V1-CARD-0366','V1-ENT-0451','first_publication_year','1960','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1339','WCD10-B06-W216-F02','V1-CARD-0366','V1-ENT-0451','genre_or_form','短篇小说集（六篇）','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1340','WCD10-B06-W216-F03','V1-CARD-0366','V1-ENT-0451','one_sentence_summary','该卷收录《El hombrecito》《Ana María》《El charlestón》《La puerta cerrada》《Paseo》和《Santelices》六篇短篇。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1341','WCD10-B06-W217-F01','V1-CARD-0367','V1-ENT-0452','first_publication_year','1996','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1342','WCD10-B06-W217-F02','V1-CARD-0367','V1-ENT-0452','genre_or_form','九部中篇小说的合辑（collection）','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1343','WCD10-B06-W217-F03','V1-CARD-0367','V1-ENT-0452','one_sentence_summary','该合辑重收九部此前分见三个独立书卷的中篇小说，包括《Tres novelitas burguesas》《Cuatro para Delfina》及Taratuta卷中的两部小说。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1344','WCD10-B06-W217-F04','V1-CARD-0367','V1-ENT-0452','bibliographic_note','国家图书馆目录将1996年记录标为1a edición；Google Books同页版次元数据却标reprint。两个记录保留，未经独立审读不裁定字段差异。','bibliographic_note','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1345','WCD10-B06-W218-F01','V1-CARD-0368','V1-ENT-0453','first_publication_year','1956','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1346','WCD10-B06-W218-F02','V1-CARD-0368','V1-ENT-0453','genre_or_form','短篇小说及版画合集（collection）','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1347','WCD10-B06-W218-F03','V1-CARD-0368','V1-ENT-0453','one_sentence_summary','这册45页、500册的限量卷收录《El hombrecito》和《Ana María》两篇故事，并配有Nemesio Antúnez三幅版画。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1348','WCD10-B06-W219-F01','V1-CARD-0369','V1-ENT-0454','first_publication_year','1998','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1349','WCD10-B06-W219-F02','V1-CARD-0369','V1-ENT-0454','genre_or_form','新闻文章、纪事选集（collection）','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1350','WCD10-B06-W219-F03','V1-CARD-0369','V1-ENT-0454','one_sentence_summary','本卷选收作者自1960年起的新闻作品，包括文章与纪事，由Cecilia García Huidobro按主题编排。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1351','WCD10-B06-W220-F01','V1-CARD-0370','V1-ENT-0455','first_publication_year','2004','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1352','WCD10-B06-W220-F02','V1-CARD-0370','V1-ENT-0455','genre_or_form','文章、纪事与访谈合集（collection）','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1353','WCD10-B06-W220-F03','V1-CARD-0370','V1-ENT-0455','one_sentence_summary','本卷收录Donoso 1960年代初的新闻文章、纪事与采访，涉及其观察环境、人群、文学和社会生活的文字。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1354','WCD10-B06-W221-F01','V1-CARD-0371','V1-ENT-0456','first_publication_year','1966','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1355','WCD10-B06-W221-F02','V1-CARD-0371','V1-ENT-0456','genre_or_form','短篇小说选集（collection）','bibliographic','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1356','WCD10-B06-W221-F03','V1-CARD-0371','V1-ENT-0456','one_sentence_summary','国家图书馆目录记录的Donoso短篇选集，由Zig-Zag于1966年在圣地亚哥出版，192页。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1357','WCD10-B06-W221-F04','V1-CARD-0371','V1-ENT-0456','bibliographic_note','国家图书馆目录另列《Cuentos》Seix Barral, c1971, 284页；Balcells作品页将Cuentos列1970并称其距“原始出版”约三十年。Cuentos与本题名间的重编/复版关系、日期含义及独立合集层级未由直接对象证据裁定，保持待审。','bibliographic_note','WCD-10-B06','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1358','WCD10-B06-F001','V1-CARD-0372','V1-ENT-0179','genre_or_form','长篇小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','出版机构将该作品明确称为romance（长篇小说）；新增体裁补足既有genre_missing。保留首版旧事实V1-FCT-0388=1966及旧书目说明V1-FCT-0389，不重复写入年份。'),
('V1-FCT-1359','WCD10-B06-F002','V1-CARD-0372','V1-ENT-0179','one_sentence_summary','据出版社简介，Flor在Vadinho去世后与药剂师Teodoro再婚；第一任丈夫以鬼魂形态回返，使她重新面对激情与安稳并存的可能。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','出版社当前简介支持双重婚姻与Vadinho回返情节；删去该页未支持的“烹饪教师”。不重复首版年，不据简介建立主题或地点关系。'),
('V1-FCT-1360','WCD10-B06-F003','V1-CARD-0373','V1-ENT-0180','genre_or_form','长篇小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','出版机构明确称其为romance；新增体裁补足既有genre_missing。保留首版旧事实V1-FCT-0391=1958与旧书目说明V1-FCT-0392。'),
('V1-FCT-1361','WCD10-B06-F004','V1-CARD-0373','V1-ENT-0180','one_sentence_summary','据出版社简介，小说以20世纪20年代伊列乌斯的可可经济扩张为背景，写叙利亚裔纳西布与加布里埃拉的爱情，以及当地现代化与女性通奸惩罚法律之间的冲突。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','仅对出版社对象简介释义；已有库无故事地点SET_IN端点，不在本候选创建关系。'),
('V1-FCT-1362','WCD10-B06-F005','V1-CARD-0374','V1-ENT-0181','genre_or_form','长篇小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','出版机构将其称为romance de formação；基线旧事实未记录体裁。保留V1-FCT-0394=1937，且SRC-0140原有版本书目证据链不变。'),
('V1-FCT-1363','WCD10-B06-F006','V1-CARD-0374','V1-ENT-0181','one_sentence_summary','据出版社简介，作品写一群住在萨尔瓦多废弃码头仓库的贫困少年，他们在社会边缘生活；叙事借Pedro Bala、Pirulito、Sem-Pernas等人物展现各自处境与愿望。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','仅对出版机构对象介绍释义；不将情节地点自动升为新SET_IN关系，现有CREATED关系V1-REL-0111原样保留。'),
('V1-FCT-1364','WCD10-B06-F101','V1-CARD-0375','V1-ENT-0187','genre_or_form','小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','该作品卡已有“小说”标签，但无同字段事实行；本项仅候选补结构化类型，不重复既有first_publication_year=1950、bibliographic_note或改动任何旧事实。'),
('V1-FCT-1365','WCD10-B06-F102','V1-CARD-0375','V1-ENT-0187','one_sentence_summary','广告职员胡安·玛丽亚·布劳森在婚姻破裂之际听见邻居克卡的生活声响，一面以阿尔塞的身份试图进入她的生活，一面为电影脚本构想出圣玛丽亚及医生迪亚斯·格雷。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','新写的对象级简要释义；限于Eduardo Becerra作品段和James E. Irby直接研究对《La vida breve》双层情节的说明。Santa María为虚构空间，不据此生成SET_IN现实地点关系；保留V1-HOLD-0051。'),
('V1-FCT-1366','WCD10-B06-F103','V1-CARD-0376','V1-ENT-0188','genre_or_form','小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','该作品卡已有‘小说’，但无同字段事实行；本项只补结构化类型，不重复first_publication_year=1961或bibliographic_note，不改变版本或首版出版社差异。'),
('V1-FCT-1367','WCD10-B06-F104','V1-CARD-0376','V1-ENT-0188','one_sentence_summary','拉森被驱逐后返回故地，试图取得废弃造船厂经理职位，并重新追求爱情。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','中性作品情节前提仅由García Ramos的对象级段落支持；不把其对Larsen自我欺骗的解释写成无归属事实。Kulin的“其行为甚至没有欺骗自己”与García的自我欺骗解读存在解释分歧，分别保留，不判断哪一方胜出。'),
('V1-FCT-1368','WCD10-B06-F107','V1-CARD-0376','V1-ENT-0188','research_note','Katalin Kulin指出，小说的叙述常由匿名的“我们”或与之认同的人物承担，叙述者像观众一样观看与评论；Larsen、Petrus、Gálvez与Kunz的举止和话语构成一种面向观众的表演，造船厂成为这一表演的舞台。','scholarly_paraphrase','WCD-10-B06','high','research_note_only','署名研究说明，严格归属于Kulin论文PDF第0页第15—17行、第1页第22—28行及第2页第54—64行；不作为无归属的故事简介或关系事实。Kulin关于Larsen甚至不欺骗自己的判断与García Ramos对角色自我欺骗的判断并存，留作解释分歧。'),
('V1-FCT-1369','WCD10-B06-F105','V1-CARD-0377','V1-ENT-0189','genre_or_form','中篇小说（novela corta）','bibliographic','WCD-10-B06','high','batch_retained_candidate','卡片已有‘中篇小说 / novela corta’，但无同字段事实行；本项仅结构化已有对象类型，不更改first_publication_year=1954或旧bibliographic_note。'),
('V1-FCT-1370','WCD10-B06-F106','V1-CARD-0377','V1-ENT-0189','one_sentence_summary','叙述者根据一位退役篮球运动员与两名女性之间的关系不断提出猜测，这些悬而未决的判断推动了故事。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','Becerra对《Los adioses》的直接情节说明；S104另有A级novela corta类型/收入讨论，但本轮尚未直接读取足以深化本作情节或叙事结构的专项研究。'),
('V1-FCT-1371','WCD10-B06-F274','V1-CARD-0378','V1-ENT-0190','genre_or_form','小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','只补充本作品页面明确称作novela的体裁；不改变旧首版年1970、旧书目事实、卡片或作者CREATED关系。'),
('V1-FCT-1372','WCD10-B06-F275','V1-CARD-0378','V1-ENT-0190','one_sentence_summary','Humberto Peñaloza是Jerónimo Azcoitía的私人秘书，被交付照看其畸形儿并将孩子藏在Rinconada；另一重要场景为Azcoitía家族拥有、由孤儿与老人居住的La Encarnación de la Chumba。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','本摘要只记录经纪机构作品页直接提供的人物、情节和场景；旧源SRC-0146、SRC-0144、SRC-0283、旧facts/card/CREATED保留。'),
('V1-FCT-1373','WCD10-B06-F276','V1-CARD-0379','V1-ENT-0191','genre_or_form','小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','只补作品页面明确称novela的体裁；保留既有first_publication_year 1966与全部旧行。Agencia列表另列1965，冲突单列记录，不在本候选改年。'),
('V1-FCT-1374','WCD10-B06-F277','V1-CARD-0379','V1-ENT-0191','one_sentence_summary','Manuela生活在乡镇妓院，小说围绕她与乡镇边缘空间中的人物关系展开，并涉及情色关系及支配。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','据直接作品页描述主要人物与场景；不把经纪机构评论语句当作情节事实。旧SRC-0147、SRC-0144和旧事实/卡片/CREATED保留。'),
('V1-FCT-1375','WCD10-B06-F278','V1-CARD-0380','V1-ENT-0192','genre_or_form','小说','bibliographic','WCD-10-B06','high','batch_retained_candidate','补作品页明确novela体裁；保留1957既有年份及V1-REL-0120。Agencia列表的1958另作冲突记录，不覆盖旧fact。'),
('V1-FCT-1376','WCD10-B06-F279','V1-CARD-0380','V1-ENT-0192','one_sentence_summary','独居的Andrés Ábalos见证九十多岁祖母生命最后阶段及其痴呆；故事亦呈现圣地亚哥旧家族宅邸内的家庭生活。','institutional_paraphrase','WCD-10-B06','high','batch_retained_candidate','摘要依据经纪机构作品页的人物与情节介绍；旧SRC-0145、SRC-0144、facts/card/CREATED及旧年月冲突均保留。');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-1260','SRC-0139','Jorge Amado – Bibliografia'),
('V1-FCT-1260','SRC-0409','Jubiabá'),
('V1-FCT-1261','SRC-0409','Jubiabá'),
('V1-FCT-1262','SRC-0409','Jubiabá'),
('V1-FCT-1263','SRC-0139','Jorge Amado – Bibliografia'),
('V1-FCT-1263','SRC-0411','Aganju, Xangô, Alapalá. Racismo religioso, resistência e justiça em Tenda dos milagres (o romance e o filme)'),
('V1-FCT-1264','SRC-0411','Aganju, Xangô, Alapalá. Racismo religioso, resistência e justiça em Tenda dos milagres (o romance e o filme)'),
('V1-FCT-1265','SRC-0410','Tenda dos milagres'),
('V1-FCT-1266','SRC-0411','Aganju, Xangô, Alapalá. Racismo religioso, resistência e justiça em Tenda dos milagres (o romance e o filme)'),
('V1-FCT-1267','SRC-0139','Jorge Amado – Bibliografia'),
('V1-FCT-1267','SRC-0416','Jorge Amado na juventude (1932-1936): O Boletim de Ariel como espaço de reflexão intelectual'),
('V1-FCT-1267','SRC-0417','Literatura e ensino de matemática: uma análise da obra Cacau (1933) de Jorge Amado, com base na Etnomatemática'),
('V1-FCT-1268','SRC-0415','Cacau'),
('V1-FCT-1269','SRC-0415','Cacau'),
('V1-FCT-1270','SRC-0416','Jorge Amado na juventude (1932-1936): O Boletim de Ariel como espaço de reflexão intelectual'),
('V1-FCT-1270','SRC-0417','Literatura e ensino de matemática: uma análise da obra Cacau (1933) de Jorge Amado, com base na Etnomatemática'),
('V1-FCT-1271','SRC-0139','Jorge Amado – Bibliografia'),
('V1-FCT-1271','SRC-0419','O país do carnaval'),
('V1-FCT-1272','SRC-0419','O país do carnaval'),
('V1-FCT-1273','SRC-0419','O país do carnaval'),
('V1-FCT-1274','SRC-0139','Jorge Amado – Bibliografia'),
('V1-FCT-1274','SRC-0418','Tocaia grande'),
('V1-FCT-1275','SRC-0313','Literatura — Jorge Amado: um sem-fim de romances'),
('V1-FCT-1276','SRC-0418','Tocaia grande'),
('V1-FCT-1277','SRC-0139','Jorge Amado – Bibliografia'),
('V1-FCT-1277','SRC-0313','Literatura — Jorge Amado: um sem-fim de romances'),
('V1-FCT-1277','SRC-0418','Tocaia grande'),
('V1-FCT-1278','SRC-0142','Juan Carlos Onetti – Bibliografía'),
('V1-FCT-1279','SRC-0142','Juan Carlos Onetti – Bibliografía'),
('V1-FCT-1279','SRC-0421','La narrativa breve de Onetti'),
('V1-FCT-1280','SRC-0420','Juan Carlos Onetti: Historias del otro lado'),
('V1-FCT-1280','SRC-0421','La narrativa breve de Onetti'),
('V1-FCT-1281','SRC-0142','Juan Carlos Onetti – Bibliografía'),
('V1-FCT-1281','SRC-0423','Volviendo la mirada hacia "Juntacadáveres" (1964), de Juan Carlos Onetti'),
('V1-FCT-1282','SRC-0142','Juan Carlos Onetti – Bibliografía'),
('V1-FCT-1282','SRC-0423','Volviendo la mirada hacia "Juntacadáveres" (1964), de Juan Carlos Onetti'),
('V1-FCT-1283','SRC-0423','Volviendo la mirada hacia "Juntacadáveres" (1964), de Juan Carlos Onetti'),
('V1-FCT-1284','SRC-0423','Volviendo la mirada hacia "Juntacadáveres" (1964), de Juan Carlos Onetti'),
('V1-FCT-1285','SRC-0142','Juan Carlos Onetti – Bibliografía'),
('V1-FCT-1286','SRC-0426','Onetti y el palimpsesto de la memoria'),
('V1-FCT-1287','SRC-0426','Onetti y el palimpsesto de la memoria'),
('V1-FCT-1287','SRC-0427','El último Onetti, o el deber absurdo y sagrado de escribir hasta el final'),
('V1-FCT-1288','SRC-0426','Onetti y el palimpsesto de la memoria'),
('V1-FCT-1289','SRC-0144','José Donoso (1924-1996)'),
('V1-FCT-1289','SRC-0428','Veraneo y otros cuentos – Memoria Chilena'),
('V1-FCT-1289','SRC-0429','Portada de Veraneo y otros cuentos, 1955 – Memoria Chilena'),
('V1-FCT-1290','SRC-0428','Veraneo y otros cuentos – Memoria Chilena'),
('V1-FCT-1291','SRC-0428','Veraneo y otros cuentos – Memoria Chilena'),
('V1-FCT-1291','SRC-0144','José Donoso (1924-1996)'),
('V1-FCT-1292','SRC-0429','Portada de Veraneo y otros cuentos, 1955 – Memoria Chilena'),
('V1-FCT-1292','SRC-0430','Veraneo y otros cuentos / Summer Vacation and Other Stories – Agencia Literaria Carmen Balcells'),
('V1-FCT-1293','SRC-0144','José Donoso (1924-1996)'),
('V1-FCT-1294','SRC-0431','Este domingo – Curriculum Nacional, Ministerio de Educación de Chile'),
('V1-FCT-1294','SRC-0446','Este domingo – Agencia Literaria Carmen Balcells'),
('V1-FCT-1295','SRC-0446','Este domingo – Agencia Literaria Carmen Balcells'),
('V1-FCT-1296','SRC-0144','José Donoso (1924-1996)'),
('V1-FCT-1296','SRC-0432','Tres novelitas burguesas – Agencia Literaria Carmen Balcells'),
('V1-FCT-1297','SRC-0432','Tres novelitas burguesas – Agencia Literaria Carmen Balcells'),
('V1-FCT-1298','SRC-0432','Tres novelitas burguesas – Agencia Literaria Carmen Balcells'),
('V1-FCT-1299','SRC-0434','Portada de Casa de campo, 1978 – Memoria Chilena'),
('V1-FCT-1299','SRC-0433','Casa de campo – Memoria Chilena'),
('V1-FCT-1300','SRC-0433','Casa de campo – Memoria Chilena'),
('V1-FCT-1301','SRC-0440','Casa de campo – Agencia Literaria Carmen Balcells'),
('V1-FCT-1301','SRC-0433','Casa de campo – Memoria Chilena'),
('V1-FCT-1302','SRC-0434','Portada de Casa de campo, 1978 – Memoria Chilena'),
('V1-FCT-1302','SRC-0433','Casa de campo – Memoria Chilena'),
('V1-FCT-1302','SRC-0440','Casa de campo – Agencia Literaria Carmen Balcells'),
('V1-FCT-1303','SRC-0144','José Donoso (1924-1996)'),
('V1-FCT-1303','SRC-0435','El jardín de al lado – Memoria Chilena'),
('V1-FCT-1303','SRC-0439','A 25 AÑOS DE LA HISTORIA PERSONAL DEL «BOOM» DE JOSÉ DONOSO'),
('V1-FCT-1304','SRC-0435','El jardín de al lado – Memoria Chilena'),
('V1-FCT-1304','SRC-0439','A 25 AÑOS DE LA HISTORIA PERSONAL DEL «BOOM» DE JOSÉ DONOSO'),
('V1-FCT-1305','SRC-0458','El jardín de al lado – Agencia Literaria Carmen Balcells'),
('V1-FCT-1305','SRC-0435','El jardín de al lado – Memoria Chilena'),
('V1-FCT-1306','SRC-0439','A 25 AÑOS DE LA HISTORIA PERSONAL DEL «BOOM» DE JOSÉ DONOSO'),
('V1-FCT-1307','SRC-0144','José Donoso (1924-1996)'),
('V1-FCT-1307','SRC-0436','Poemas de un novelista – Memoria Chilena'),
('V1-FCT-1308','SRC-0436','Poemas de un novelista – Memoria Chilena'),
('V1-FCT-1309','SRC-0436','Poemas de un novelista – Memoria Chilena'),
('V1-FCT-1310','SRC-0144','José Donoso (1924-1996)'),
('V1-FCT-1310','SRC-0437','La desesperanza – Memoria Chilena'),
('V1-FCT-1311','SRC-0437','La desesperanza – Memoria Chilena'),
('V1-FCT-1312','SRC-0437','La desesperanza – Memoria Chilena'),
('V1-FCT-1313','SRC-0144','José Donoso (1924-1996)'),
('V1-FCT-1313','SRC-0439','A 25 AÑOS DE LA HISTORIA PERSONAL DEL «BOOM» DE JOSÉ DONOSO'),
('V1-FCT-1314','SRC-0438','Escribió cinco novelas voluminosas – Memoria Chilena'),
('V1-FCT-1314','SRC-0439','A 25 AÑOS DE LA HISTORIA PERSONAL DEL «BOOM» DE JOSÉ DONOSO'),
('V1-FCT-1315','SRC-0457','Donde van a morir los elefantes – Agencia Literaria Carmen Balcells'),
('V1-FCT-1315','SRC-0438','Escribió cinco novelas voluminosas – Memoria Chilena'),
('V1-FCT-1316','SRC-0439','A 25 AÑOS DE LA HISTORIA PERSONAL DEL «BOOM» DE JOSÉ DONOSO'),
('V1-FCT-1317','SRC-0144','José Donoso (1924-1996)'),
('V1-FCT-1317','SRC-0438','Escribió cinco novelas voluminosas – Memoria Chilena'),
('V1-FCT-1318','SRC-0438','Escribió cinco novelas voluminosas – Memoria Chilena'),
('V1-FCT-1319','SRC-0438','Escribió cinco novelas voluminosas – Memoria Chilena'),
('V1-FCT-1320','SRC-0439','A 25 AÑOS DE LA HISTORIA PERSONAL DEL «BOOM» DE JOSÉ DONOSO'),
('V1-FCT-1321','SRC-0439','A 25 AÑOS DE LA HISTORIA PERSONAL DEL «BOOM» DE JOSÉ DONOSO'),
('V1-FCT-1322','SRC-0439','A 25 AÑOS DE LA HISTORIA PERSONAL DEL «BOOM» DE JOSÉ DONOSO'),
('V1-FCT-1323','SRC-0439','A 25 AÑOS DE LA HISTORIA PERSONAL DEL «BOOM» DE JOSÉ DONOSO'),
('V1-FCT-1324','SRC-0144','José Donoso (1924-1996)'),
('V1-FCT-1324','SRC-0441','La misteriosa desaparición de la Marquesita de Loria – Agencia Literaria Carmen Balcells'),
('V1-FCT-1325','SRC-0441','La misteriosa desaparición de la Marquesita de Loria – Agencia Literaria Carmen Balcells'),
('V1-FCT-1326','SRC-0441','La misteriosa desaparición de la Marquesita de Loria – Agencia Literaria Carmen Balcells'),
('V1-FCT-1327','SRC-0438','Escribió cinco novelas voluminosas – Memoria Chilena'),
('V1-FCT-1327','SRC-0442','Taratuta. Naturaleza muerta con cachimba – Agencia Literaria Carmen Balcells'),
('V1-FCT-1327','SRC-0456','Donoso, José, 1924-1996 – Referencias bibliográficas, Memoria Chilena'),
('V1-FCT-1328','SRC-0442','Taratuta. Naturaleza muerta con cachimba – Agencia Literaria Carmen Balcells'),
('V1-FCT-1329','SRC-0442','Taratuta. Naturaleza muerta con cachimba – Agencia Literaria Carmen Balcells'),
('V1-FCT-1330','SRC-0144','José Donoso (1924-1996)'),
('V1-FCT-1330','SRC-0447','El Mocho – Agencia Literaria Carmen Balcells'),
('V1-FCT-1330','SRC-0456','Donoso, José, 1924-1996 – Referencias bibliográficas, Memoria Chilena'),
('V1-FCT-1331','SRC-0447','El Mocho – Agencia Literaria Carmen Balcells'),
('V1-FCT-1332','SRC-0447','El Mocho – Agencia Literaria Carmen Balcells'),
('V1-FCT-1333','SRC-0447','El Mocho – Agencia Literaria Carmen Balcells'),
('V1-FCT-1333','SRC-0456','Donoso, José, 1924-1996 – Referencias bibliográficas, Memoria Chilena'),
('V1-FCT-1334','SRC-0144','José Donoso (1924-1996)'),
('V1-FCT-1334','SRC-0448','Lagartija sin cola – Agencia Literaria Carmen Balcells'),
('V1-FCT-1335','SRC-0448','Lagartija sin cola – Agencia Literaria Carmen Balcells'),
('V1-FCT-1336','SRC-0448','Lagartija sin cola – Agencia Literaria Carmen Balcells'),
('V1-FCT-1337','SRC-0448','Lagartija sin cola – Agencia Literaria Carmen Balcells'),
('V1-FCT-1338','SRC-0450','Charlestón – Agencia Literaria Carmen Balcells'),
('V1-FCT-1338','SRC-0456','Donoso, José, 1924-1996 – Referencias bibliográficas, Memoria Chilena'),
('V1-FCT-1339','SRC-0450','Charlestón – Agencia Literaria Carmen Balcells'),
('V1-FCT-1340','SRC-0450','Charlestón – Agencia Literaria Carmen Balcells'),
('V1-FCT-1341','SRC-0451','Portada de Nueve novelas breves, 1996 – Memoria Chilena'),
('V1-FCT-1341','SRC-0452','Nueve novelas breves – Google Books'),
('V1-FCT-1342','SRC-0452','Nueve novelas breves – Google Books'),
('V1-FCT-1343','SRC-0452','Nueve novelas breves – Google Books'),
('V1-FCT-1344','SRC-0451','Portada de Nueve novelas breves, 1996 – Memoria Chilena'),
('V1-FCT-1344','SRC-0452','Nueve novelas breves – Google Books'),
('V1-FCT-1345','SRC-0453','Donoso & Antúnez. A propósito de algunos paratextos icónicos'),
('V1-FCT-1345','SRC-0456','Donoso, José, 1924-1996 – Referencias bibliográficas, Memoria Chilena'),
('V1-FCT-1345','SRC-0428','Veraneo y otros cuentos – Memoria Chilena'),
('V1-FCT-1346','SRC-0453','Donoso & Antúnez. A propósito de algunos paratextos icónicos'),
('V1-FCT-1347','SRC-0453','Donoso & Antúnez. A propósito de algunos paratextos icónicos'),
('V1-FCT-1348','SRC-0454','Artículos de incierta necesidad – Agencia Literaria Carmen Balcells'),
('V1-FCT-1348','SRC-0456','Donoso, José, 1924-1996 – Referencias bibliográficas, Memoria Chilena'),
('V1-FCT-1349','SRC-0454','Artículos de incierta necesidad – Agencia Literaria Carmen Balcells'),
('V1-FCT-1350','SRC-0454','Artículos de incierta necesidad – Agencia Literaria Carmen Balcells'),
('V1-FCT-1351','SRC-0455','EL ESCRIBIDOR INTRUSO – Ediciones UDP'),
('V1-FCT-1352','SRC-0455','EL ESCRIBIDOR INTRUSO – Ediciones UDP'),
('V1-FCT-1353','SRC-0455','EL ESCRIBIDOR INTRUSO – Ediciones UDP'),
('V1-FCT-1354','SRC-0456','Donoso, José, 1924-1996 – Referencias bibliográficas, Memoria Chilena'),
('V1-FCT-1355','SRC-0456','Donoso, José, 1924-1996 – Referencias bibliográficas, Memoria Chilena'),
('V1-FCT-1356','SRC-0456','Donoso, José, 1924-1996 – Referencias bibliográficas, Memoria Chilena'),
('V1-FCT-1357','SRC-0456','Donoso, José, 1924-1996 – Referencias bibliográficas, Memoria Chilena'),
('V1-FCT-1357','SRC-0449','Cuentos – Agencia Literaria Carmen Balcells'),
('V1-FCT-1358','SRC-0413','Dona Flor e seus dois maridos'),
('V1-FCT-1359','SRC-0413','Dona Flor e seus dois maridos'),
('V1-FCT-1360','SRC-0414','Gabriela cravo e canela'),
('V1-FCT-1361','SRC-0414','Gabriela cravo e canela'),
('V1-FCT-1362','SRC-0412','Capitães da areia'),
('V1-FCT-1363','SRC-0412','Capitães da areia'),
('V1-FCT-1364','SRC-0142','Juan Carlos Onetti – Bibliografía'),
('V1-FCT-1364','SRC-0425','Aspectos formales de La vida breve de Juan Carlos Onetti'),
('V1-FCT-1365','SRC-0420','Juan Carlos Onetti: Historias del otro lado'),
('V1-FCT-1365','SRC-0425','Aspectos formales de La vida breve de Juan Carlos Onetti'),
('V1-FCT-1366','SRC-0142','Juan Carlos Onetti – Bibliografía'),
('V1-FCT-1366','SRC-0424','Caracteres y estructura en El astillero de J. C. Onetti'),
('V1-FCT-1367','SRC-0422','Pequeño dios Larsen'),
('V1-FCT-1368','SRC-0424','Caracteres y estructura en El astillero de J. C. Onetti'),
('V1-FCT-1369','SRC-0143','Juan Carlos Onetti – Cronología de plenitud'),
('V1-FCT-1369','SRC-0421','La narrativa breve de Onetti'),
('V1-FCT-1370','SRC-0420','Juan Carlos Onetti: Historias del otro lado'),
('V1-FCT-1371','SRC-0146','El obsceno pájaro de la noche – Memoria Chilena'),
('V1-FCT-1372','SRC-0443','El obsceno pájaro de la noche – Agencia Literaria Carmen Balcells'),
('V1-FCT-1373','SRC-0147','El lugar sin límites – Memoria Chilena'),
('V1-FCT-1374','SRC-0444','El lugar sin límites – Agencia Literaria Carmen Balcells'),
('V1-FCT-1375','SRC-0145','Coronación – Memoria Chilena'),
('V1-FCT-1376','SRC-0445','Coronación – Agencia Literaria Carmen Balcells');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0344','V1-FCT-1260','batch_retained_candidate'),
('V1-CARD-0344','V1-FCT-1261','batch_retained_candidate'),
('V1-CARD-0344','V1-FCT-1262','batch_retained_candidate'),
('V1-CARD-0345','V1-FCT-1263','batch_retained_candidate'),
('V1-CARD-0345','V1-FCT-1264','batch_retained_candidate'),
('V1-CARD-0345','V1-FCT-1265','batch_retained_candidate'),
('V1-CARD-0345','V1-FCT-1266','research_note_only'),
('V1-CARD-0346','V1-FCT-1267','batch_retained_candidate'),
('V1-CARD-0346','V1-FCT-1268','batch_retained_candidate'),
('V1-CARD-0346','V1-FCT-1269','batch_retained_candidate'),
('V1-CARD-0346','V1-FCT-1270','research_note_only'),
('V1-CARD-0347','V1-FCT-1271','batch_retained_candidate'),
('V1-CARD-0347','V1-FCT-1272','batch_retained_candidate'),
('V1-CARD-0347','V1-FCT-1273','batch_retained_candidate'),
('V1-CARD-0348','V1-FCT-1274','batch_retained_candidate'),
('V1-CARD-0348','V1-FCT-1275','batch_retained_candidate'),
('V1-CARD-0348','V1-FCT-1276','batch_retained_candidate'),
('V1-CARD-0348','V1-FCT-1277','batch_retained_candidate'),
('V1-CARD-0349','V1-FCT-1278','batch_retained_candidate'),
('V1-CARD-0349','V1-FCT-1279','batch_retained_candidate'),
('V1-CARD-0349','V1-FCT-1280','batch_retained_candidate'),
('V1-CARD-0350','V1-FCT-1281','batch_retained_candidate'),
('V1-CARD-0350','V1-FCT-1282','batch_retained_candidate'),
('V1-CARD-0350','V1-FCT-1283','batch_retained_candidate'),
('V1-CARD-0350','V1-FCT-1284','research_note_only'),
('V1-CARD-0351','V1-FCT-1285','batch_retained_candidate'),
('V1-CARD-0351','V1-FCT-1286','batch_retained_candidate'),
('V1-CARD-0351','V1-FCT-1287','batch_retained_candidate'),
('V1-CARD-0351','V1-FCT-1288','research_note_only'),
('V1-CARD-0352','V1-FCT-1289','batch_retained_candidate'),
('V1-CARD-0352','V1-FCT-1290','batch_retained_candidate'),
('V1-CARD-0352','V1-FCT-1291','batch_retained_candidate'),
('V1-CARD-0352','V1-FCT-1292','batch_retained_candidate'),
('V1-CARD-0353','V1-FCT-1293','batch_retained_candidate'),
('V1-CARD-0353','V1-FCT-1294','batch_retained_candidate'),
('V1-CARD-0353','V1-FCT-1295','batch_retained_candidate'),
('V1-CARD-0354','V1-FCT-1296','batch_retained_candidate'),
('V1-CARD-0354','V1-FCT-1297','batch_retained_candidate'),
('V1-CARD-0354','V1-FCT-1298','batch_retained_candidate'),
('V1-CARD-0355','V1-FCT-1299','batch_retained_candidate'),
('V1-CARD-0355','V1-FCT-1300','batch_retained_candidate'),
('V1-CARD-0355','V1-FCT-1301','batch_retained_candidate'),
('V1-CARD-0355','V1-FCT-1302','batch_retained_candidate'),
('V1-CARD-0356','V1-FCT-1303','batch_retained_candidate'),
('V1-CARD-0356','V1-FCT-1304','batch_retained_candidate'),
('V1-CARD-0356','V1-FCT-1305','batch_retained_candidate'),
('V1-CARD-0356','V1-FCT-1306','research_note_only'),
('V1-CARD-0357','V1-FCT-1307','batch_retained_candidate'),
('V1-CARD-0357','V1-FCT-1308','batch_retained_candidate'),
('V1-CARD-0357','V1-FCT-1309','batch_retained_candidate'),
('V1-CARD-0358','V1-FCT-1310','batch_retained_candidate'),
('V1-CARD-0358','V1-FCT-1311','batch_retained_candidate'),
('V1-CARD-0358','V1-FCT-1312','batch_retained_candidate'),
('V1-CARD-0359','V1-FCT-1313','batch_retained_candidate'),
('V1-CARD-0359','V1-FCT-1314','batch_retained_candidate'),
('V1-CARD-0359','V1-FCT-1315','batch_retained_candidate'),
('V1-CARD-0359','V1-FCT-1316','research_note_only'),
('V1-CARD-0360','V1-FCT-1317','batch_retained_candidate'),
('V1-CARD-0360','V1-FCT-1318','batch_retained_candidate'),
('V1-CARD-0360','V1-FCT-1319','batch_retained_candidate'),
('V1-CARD-0361','V1-FCT-1320','batch_retained_candidate'),
('V1-CARD-0361','V1-FCT-1321','batch_retained_candidate'),
('V1-CARD-0361','V1-FCT-1322','batch_retained_candidate'),
('V1-CARD-0361','V1-FCT-1323','batch_retained_candidate'),
('V1-CARD-0362','V1-FCT-1324','batch_retained_candidate'),
('V1-CARD-0362','V1-FCT-1325','batch_retained_candidate'),
('V1-CARD-0362','V1-FCT-1326','batch_retained_candidate'),
('V1-CARD-0363','V1-FCT-1327','batch_retained_candidate'),
('V1-CARD-0363','V1-FCT-1328','batch_retained_candidate'),
('V1-CARD-0363','V1-FCT-1329','batch_retained_candidate'),
('V1-CARD-0364','V1-FCT-1330','batch_retained_candidate'),
('V1-CARD-0364','V1-FCT-1331','batch_retained_candidate'),
('V1-CARD-0364','V1-FCT-1332','batch_retained_candidate'),
('V1-CARD-0364','V1-FCT-1333','batch_retained_candidate'),
('V1-CARD-0365','V1-FCT-1334','batch_retained_candidate'),
('V1-CARD-0365','V1-FCT-1335','batch_retained_candidate'),
('V1-CARD-0365','V1-FCT-1336','batch_retained_candidate'),
('V1-CARD-0365','V1-FCT-1337','batch_retained_candidate'),
('V1-CARD-0366','V1-FCT-1338','batch_retained_candidate'),
('V1-CARD-0366','V1-FCT-1339','batch_retained_candidate'),
('V1-CARD-0366','V1-FCT-1340','batch_retained_candidate'),
('V1-CARD-0367','V1-FCT-1341','batch_retained_candidate'),
('V1-CARD-0367','V1-FCT-1342','batch_retained_candidate'),
('V1-CARD-0367','V1-FCT-1343','batch_retained_candidate'),
('V1-CARD-0367','V1-FCT-1344','batch_retained_candidate'),
('V1-CARD-0368','V1-FCT-1345','batch_retained_candidate'),
('V1-CARD-0368','V1-FCT-1346','batch_retained_candidate'),
('V1-CARD-0368','V1-FCT-1347','batch_retained_candidate'),
('V1-CARD-0369','V1-FCT-1348','batch_retained_candidate'),
('V1-CARD-0369','V1-FCT-1349','batch_retained_candidate'),
('V1-CARD-0369','V1-FCT-1350','batch_retained_candidate'),
('V1-CARD-0370','V1-FCT-1351','batch_retained_candidate'),
('V1-CARD-0370','V1-FCT-1352','batch_retained_candidate'),
('V1-CARD-0370','V1-FCT-1353','batch_retained_candidate'),
('V1-CARD-0371','V1-FCT-1354','batch_retained_candidate'),
('V1-CARD-0371','V1-FCT-1355','batch_retained_candidate'),
('V1-CARD-0371','V1-FCT-1356','batch_retained_candidate'),
('V1-CARD-0371','V1-FCT-1357','batch_retained_candidate'),
('V1-CARD-0372','V1-FCT-1358','batch_retained_candidate'),
('V1-CARD-0372','V1-FCT-1359','batch_retained_candidate'),
('V1-CARD-0373','V1-FCT-1360','batch_retained_candidate'),
('V1-CARD-0373','V1-FCT-1361','batch_retained_candidate'),
('V1-CARD-0374','V1-FCT-1362','batch_retained_candidate'),
('V1-CARD-0374','V1-FCT-1363','batch_retained_candidate'),
('V1-CARD-0375','V1-FCT-1364','batch_retained_candidate'),
('V1-CARD-0375','V1-FCT-1365','batch_retained_candidate'),
('V1-CARD-0376','V1-FCT-1366','batch_retained_candidate'),
('V1-CARD-0376','V1-FCT-1367','batch_retained_candidate'),
('V1-CARD-0376','V1-FCT-1368','research_note_only'),
('V1-CARD-0377','V1-FCT-1369','batch_retained_candidate'),
('V1-CARD-0377','V1-FCT-1370','batch_retained_candidate'),
('V1-CARD-0378','V1-FCT-1371','batch_retained_candidate'),
('V1-CARD-0378','V1-FCT-1372','batch_retained_candidate'),
('V1-CARD-0379','V1-FCT-1373','batch_retained_candidate'),
('V1-CARD-0379','V1-FCT-1374','batch_retained_candidate'),
('V1-CARD-0380','V1-FCT-1375','batch_retained_candidate'),
('V1-CARD-0380','V1-FCT-1376','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0672','WCD10-B06-S001','V1-CARD-0344','SRC-0139','B','bibliography_or_bounded_description','yes','no','SRC-0139','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0673','WCD10-B06-S003','V1-CARD-0344','SRC-0409','B','bibliography_or_bounded_description','yes','no','SRC-0409','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0674','WCD10-B06-S001','V1-CARD-0345','SRC-0139','B','bibliography_or_bounded_description','yes','no','SRC-0139','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0675','WCD10-B06-S004','V1-CARD-0345','SRC-0410','B','bibliography_or_bounded_description','no','no','SRC-0410','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0676','WCD10-B06-S005','V1-CARD-0345','SRC-0411','A','attributed_study','yes','yes','SRC-0411','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0677','WCD10-B06-S001','V1-CARD-0346','SRC-0139','B','bibliography_or_bounded_description','yes','no','SRC-0139','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0678','WCD10-B06-S009','V1-CARD-0346','SRC-0415','B','bibliography_or_bounded_description','yes','no','SRC-0415','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0679','WCD10-B06-S010','V1-CARD-0346','SRC-0416','A','attributed_study','yes','yes','SRC-0416','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0680','WCD10-B06-S011','V1-CARD-0346','SRC-0417','A','attributed_study','yes','yes','SRC-0417','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0681','WCD10-B06-S001','V1-CARD-0347','SRC-0139','B','bibliography_or_bounded_description','yes','no','SRC-0139','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0682','WCD10-B06-S014','V1-CARD-0347','SRC-0419','B','bibliography_or_bounded_description','yes','no','SRC-0419','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0683','WCD10-B06-S001','V1-CARD-0348','SRC-0139','B','bibliography_or_bounded_description','yes','no','SRC-0139','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0684','WCD10-B06-S002','V1-CARD-0348','SRC-0313','B','bibliography_or_bounded_description','yes','no','SRC-0313','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0685','WCD10-B06-S013','V1-CARD-0348','SRC-0418','B','bibliography_or_bounded_description','yes','no','SRC-0418','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0686','WCD10-B06-S101','V1-CARD-0349','SRC-0142','B','bibliography_or_bounded_description','yes','no','SRC-0142','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0687','WCD10-B06-S103','V1-CARD-0349','SRC-0420','B','bibliography_or_bounded_description','no','no','SRC-0420','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0688','WCD10-B06-S104','V1-CARD-0349','SRC-0421','A','bibliography_or_bounded_description','yes','no','SRC-0421','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0689','WCD10-B06-S101','V1-CARD-0350','SRC-0142','B','bibliography_or_bounded_description','yes','no','SRC-0142','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0690','WCD10-B06-S106','V1-CARD-0350','SRC-0423','A','attributed_study','yes','yes','SRC-0423','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0691','WCD10-B06-S101','V1-CARD-0351','SRC-0142','B','bibliography_or_bounded_description','yes','no','SRC-0142','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0692','WCD10-B06-S109','V1-CARD-0351','SRC-0426','A','attributed_study','yes','yes','SRC-0426','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0693','WCD10-B06-S110','V1-CARD-0351','SRC-0427','B','bibliography_or_bounded_description','no','no','SRC-0427','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0694','WCD10-B06-S201','V1-CARD-0352','SRC-0144','B','bibliography_or_bounded_description','yes','no','SRC-0144','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0695','WCD10-B06-S205','V1-CARD-0352','SRC-0428','B','bibliography_or_bounded_description','yes','no','SRC-0428','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0696','WCD10-B06-S206','V1-CARD-0352','SRC-0429','B','bibliography_or_bounded_description','yes','no','SRC-0429','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0697','WCD10-B06-S207','V1-CARD-0352','SRC-0430','B','bibliography_or_bounded_description','yes','no','SRC-0430','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0698','WCD10-B06-S201','V1-CARD-0353','SRC-0144','B','bibliography_or_bounded_description','yes','no','SRC-0144','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0699','WCD10-B06-S208','V1-CARD-0353','SRC-0431','B','bibliography_or_bounded_description','yes','no','SRC-0431','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0700','WCD10-B06-S224','V1-CARD-0353','SRC-0446','B','bibliography_or_bounded_description','yes','no','SRC-0446','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0701','WCD10-B06-S201','V1-CARD-0354','SRC-0144','B','bibliography_or_bounded_description','yes','no','SRC-0144','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0702','WCD10-B06-S209','V1-CARD-0354','SRC-0432','B','bibliography_or_bounded_description','yes','no','SRC-0432','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0703','WCD10-B06-S210','V1-CARD-0355','SRC-0433','B','bibliography_or_bounded_description','yes','no','SRC-0433','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0704','WCD10-B06-S211','V1-CARD-0355','SRC-0434','B','bibliography_or_bounded_description','yes','no','SRC-0434','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0705','WCD10-B06-S217','V1-CARD-0355','SRC-0440','B','bibliography_or_bounded_description','yes','no','SRC-0440','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0706','WCD10-B06-S201','V1-CARD-0356','SRC-0144','B','bibliography_or_bounded_description','yes','no','SRC-0144','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0707','WCD10-B06-S212','V1-CARD-0356','SRC-0435','B','bibliography_or_bounded_description','yes','no','SRC-0435','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0708','WCD10-B06-S216','V1-CARD-0356','SRC-0439','A','attributed_study','yes','yes','SRC-0439','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0709','WCD10-B06-S236','V1-CARD-0356','SRC-0458','B','bibliography_or_bounded_description','no','no','SRC-0458','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0710','WCD10-B06-S201','V1-CARD-0357','SRC-0144','B','bibliography_or_bounded_description','yes','no','SRC-0144','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0711','WCD10-B06-S213','V1-CARD-0357','SRC-0436','B','bibliography_or_bounded_description','yes','no','SRC-0436','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0712','WCD10-B06-S201','V1-CARD-0358','SRC-0144','B','bibliography_or_bounded_description','yes','no','SRC-0144','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0713','WCD10-B06-S214','V1-CARD-0358','SRC-0437','B','bibliography_or_bounded_description','yes','no','SRC-0437','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0714','WCD10-B06-S201','V1-CARD-0359','SRC-0144','B','bibliography_or_bounded_description','yes','no','SRC-0144','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0715','WCD10-B06-S215','V1-CARD-0359','SRC-0438','B','bibliography_or_bounded_description','yes','no','SRC-0438','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0716','WCD10-B06-S216','V1-CARD-0359','SRC-0439','A','attributed_study','yes','yes','SRC-0439','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0717','WCD10-B06-S235','V1-CARD-0359','SRC-0457','B','bibliography_or_bounded_description','no','no','SRC-0457','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0718','WCD10-B06-S201','V1-CARD-0360','SRC-0144','B','bibliography_or_bounded_description','yes','no','SRC-0144','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0719','WCD10-B06-S215','V1-CARD-0360','SRC-0438','B','bibliography_or_bounded_description','yes','no','SRC-0438','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0720','WCD10-B06-S216','V1-CARD-0361','SRC-0439','A','bibliography_or_bounded_description','yes','no','SRC-0439','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0721','WCD10-B06-S201','V1-CARD-0362','SRC-0144','B','bibliography_or_bounded_description','yes','no','SRC-0144','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0722','WCD10-B06-S218','V1-CARD-0362','SRC-0441','B','bibliography_or_bounded_description','yes','no','SRC-0441','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0723','WCD10-B06-S215','V1-CARD-0363','SRC-0438','B','bibliography_or_bounded_description','yes','no','SRC-0438','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0724','WCD10-B06-S220','V1-CARD-0363','SRC-0442','B','bibliography_or_bounded_description','yes','no','SRC-0442','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0725','WCD10-B06-S234','V1-CARD-0363','SRC-0456','B','bibliography_or_bounded_description','yes','no','SRC-0456','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0726','WCD10-B06-S201','V1-CARD-0364','SRC-0144','B','bibliography_or_bounded_description','yes','no','SRC-0144','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0727','WCD10-B06-S225','V1-CARD-0364','SRC-0447','B','bibliography_or_bounded_description','yes','no','SRC-0447','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0728','WCD10-B06-S234','V1-CARD-0364','SRC-0456','B','bibliography_or_bounded_description','yes','no','SRC-0456','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0729','WCD10-B06-S201','V1-CARD-0365','SRC-0144','B','bibliography_or_bounded_description','yes','no','SRC-0144','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0730','WCD10-B06-S226','V1-CARD-0365','SRC-0448','B','bibliography_or_bounded_description','yes','no','SRC-0448','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0731','WCD10-B06-S228','V1-CARD-0366','SRC-0450','B','bibliography_or_bounded_description','yes','no','SRC-0450','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0732','WCD10-B06-S234','V1-CARD-0366','SRC-0456','B','bibliography_or_bounded_description','yes','no','SRC-0456','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0733','WCD10-B06-S229','V1-CARD-0367','SRC-0451','B','bibliography_or_bounded_description','yes','no','SRC-0451','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0734','WCD10-B06-S230','V1-CARD-0367','SRC-0452','B','bibliography_or_bounded_description','yes','no','SRC-0452','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0735','WCD10-B06-S205','V1-CARD-0368','SRC-0428','B','bibliography_or_bounded_description','yes','no','SRC-0428','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0736','WCD10-B06-S231','V1-CARD-0368','SRC-0453','A','bibliography_or_bounded_description','yes','no','SRC-0453','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0737','WCD10-B06-S234','V1-CARD-0368','SRC-0456','B','bibliography_or_bounded_description','yes','no','SRC-0456','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0738','WCD10-B06-S232','V1-CARD-0369','SRC-0454','B','bibliography_or_bounded_description','yes','no','SRC-0454','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0739','WCD10-B06-S234','V1-CARD-0369','SRC-0456','B','bibliography_or_bounded_description','yes','no','SRC-0456','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0740','WCD10-B06-S233','V1-CARD-0370','SRC-0455','B','bibliography_or_bounded_description','yes','no','SRC-0455','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0741','WCD10-B06-S227','V1-CARD-0371','SRC-0449','B','bibliography_or_bounded_description','yes','no','SRC-0449','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0742','WCD10-B06-S234','V1-CARD-0371','SRC-0456','B','bibliography_or_bounded_description','yes','no','SRC-0456','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0743','WCD10-B06-S007','V1-CARD-0372','SRC-0413','B','bibliography_or_bounded_description','yes','no','SRC-0413','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0744','WCD10-B06-S008','V1-CARD-0373','SRC-0414','B','bibliography_or_bounded_description','yes','no','SRC-0414','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0745','WCD10-B06-S006','V1-CARD-0374','SRC-0412','B','bibliography_or_bounded_description','yes','no','SRC-0412','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0746','WCD10-B06-S101','V1-CARD-0375','SRC-0142','B','bibliography_or_bounded_description','yes','no','SRC-0142','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0747','WCD10-B06-S103','V1-CARD-0375','SRC-0420','B','bibliography_or_bounded_description','no','no','SRC-0420','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0748','WCD10-B06-S108','V1-CARD-0375','SRC-0425','A','bibliography_or_bounded_description','yes','no','SRC-0425','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0749','WCD10-B06-S101','V1-CARD-0376','SRC-0142','B','bibliography_or_bounded_description','yes','no','SRC-0142','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0750','WCD10-B06-S105','V1-CARD-0376','SRC-0422','B','bibliography_or_bounded_description','no','no','SRC-0422','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0751','WCD10-B06-S107','V1-CARD-0376','SRC-0424','A','attributed_study','yes','yes','SRC-0424','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0752','WCD10-B06-S102','V1-CARD-0377','SRC-0143','B','bibliography_or_bounded_description','yes','no','SRC-0143','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0753','WCD10-B06-S103','V1-CARD-0377','SRC-0420','B','bibliography_or_bounded_description','no','no','SRC-0420','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0754','WCD10-B06-S104','V1-CARD-0377','SRC-0421','A','bibliography_or_bounded_description','yes','no','SRC-0421','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0755','WCD10-B06-S203','V1-CARD-0378','SRC-0146','B','bibliography_or_bounded_description','yes','no','SRC-0146','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0756','WCD10-B06-S221','V1-CARD-0378','SRC-0443','B','bibliography_or_bounded_description','no','no','SRC-0443','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0757','WCD10-B06-S204','V1-CARD-0379','SRC-0147','B','bibliography_or_bounded_description','yes','no','SRC-0147','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0758','WCD10-B06-S222','V1-CARD-0379','SRC-0444','B','bibliography_or_bounded_description','no','no','SRC-0444','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0759','WCD10-B06-S202','V1-CARD-0380','SRC-0145','B','bibliography_or_bounded_description','yes','no','SRC-0145','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0760','WCD10-B06-S223','V1-CARD-0380','SRC-0445','B','bibliography_or_bounded_description','no','no','SRC-0445','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0398','WCD-10-B06','WCD10-B06-W001-CREATED','V1-ENT-0172','CREATED','V1-ENT-0429','若热·亚马多创作 Jubiabá','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0399','WCD-10-B06','WCD10-B06-W002-CREATED','V1-ENT-0172','CREATED','V1-ENT-0430','若热·亚马多创作 Tenda dos milagres','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0400','WCD-10-B06','WCD10-B06-W003-CREATED','V1-ENT-0172','CREATED','V1-ENT-0431','若热·亚马多创作 Cacau','high','accepted','Codex-parent-independent-review:PASS','4','NONE'),
('V1-REL-0401','WCD-10-B06','WCD10-B06-W004-CREATED','V1-ENT-0172','CREATED','V1-ENT-0432','若热·亚马多创作 O país do carnaval','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0402','WCD-10-B06','WCD10-B06-W005-CREATED','V1-ENT-0172','CREATED','V1-ENT-0433','若热·亚马多创作 Tocaia grande','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0403','WCD-10-B06','WCD10-B06-W101-CREATED','V1-ENT-0184','CREATED','V1-ENT-0434','胡安·卡洛斯·奥内蒂创作 El pozo','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0404','WCD-10-B06','WCD10-B06-W102-CREATED','V1-ENT-0184','CREATED','V1-ENT-0435','胡安·卡洛斯·奥内蒂创作 Juntacadáveres','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0405','WCD-10-B06','WCD10-B06-W103-CREATED','V1-ENT-0184','CREATED','V1-ENT-0436','胡安·卡洛斯·奥内蒂创作 Dejemos hablar al viento','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0406','WCD-10-B06','WCD10-B06-W201-CREATED','V1-ENT-0185','CREATED','V1-ENT-0437','何塞·多诺索创作 Veraneo y otros cuentos','high','accepted','Codex-parent-independent-review:PASS','4','NONE'),
('V1-REL-0407','WCD-10-B06','WCD10-B06-W202-CREATED','V1-ENT-0185','CREATED','V1-ENT-0438','何塞·多诺索创作 Este domingo','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0408','WCD-10-B06','WCD10-B06-W203-CREATED','V1-ENT-0185','CREATED','V1-ENT-0439','何塞·多诺索创作 Tres novelitas burguesas','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0409','WCD-10-B06','WCD10-B06-W204-CREATED','V1-ENT-0185','CREATED','V1-ENT-0440','何塞·多诺索创作 Casa de campo','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0410','WCD-10-B06','WCD10-B06-W205-CREATED','V1-ENT-0185','CREATED','V1-ENT-0441','何塞·多诺索创作 El jardín de al lado','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0411','WCD-10-B06','WCD10-B06-W206-CREATED','V1-ENT-0185','CREATED','V1-ENT-0442','何塞·多诺索创作 Poemas de un novelista','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0412','WCD-10-B06','WCD10-B06-W207-CREATED','V1-ENT-0185','CREATED','V1-ENT-0443','何塞·多诺索创作 La desesperanza','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0413','WCD-10-B06','WCD10-B06-W208-CREATED','V1-ENT-0185','CREATED','V1-ENT-0444','何塞·多诺索创作 Donde van a morir los elefantes','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0414','WCD-10-B06','WCD10-B06-W209-CREATED','V1-ENT-0185','CREATED','V1-ENT-0445','何塞·多诺索创作 Conjeturas sobre la memoria de mi tribu','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0415','WCD-10-B06','WCD10-B06-W210-CREATED','V1-ENT-0185','CREATED','V1-ENT-0446','何塞·多诺索创作 Historia personal del ''boom''','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0416','WCD-10-B06','WCD10-B06-W211-CREATED','V1-ENT-0185','CREATED','V1-ENT-0447','何塞·多诺索创作 La misteriosa desaparición de la Marquesita de Loria','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0417','WCD-10-B06','WCD10-B06-W213-CREATED','V1-ENT-0185','CREATED','V1-ENT-0448','何塞·多诺索创作 Taratuta. Naturaleza muerta con cachimba','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0418','WCD-10-B06','WCD10-B06-W214-CREATED','V1-ENT-0185','CREATED','V1-ENT-0449','何塞·多诺索创作 El Mocho','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0419','WCD-10-B06','WCD10-B06-W215-CREATED','V1-ENT-0185','CREATED','V1-ENT-0450','何塞·多诺索创作 Lagartija sin cola','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0420','WCD-10-B06','WCD10-B06-W216-CREATED','V1-ENT-0185','CREATED','V1-ENT-0451','何塞·多诺索创作 Charlestón','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0421','WCD-10-B06','WCD10-B06-W217-CREATED','V1-ENT-0185','CREATED','V1-ENT-0452','何塞·多诺索创作 Nueve novelas breves','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0422','WCD-10-B06','WCD10-B06-W218-CREATED','V1-ENT-0185','CREATED','V1-ENT-0453','何塞·多诺索创作 Dos cuentos','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0423','WCD-10-B06','WCD10-B06-W219-CREATED','V1-ENT-0185','CREATED','V1-ENT-0454','何塞·多诺索创作 Artículos de incierta necesidad','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0424','WCD-10-B06','WCD10-B06-W220-CREATED','V1-ENT-0185','CREATED','V1-ENT-0455','何塞·多诺索创作 El escribidor intruso','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0425','WCD-10-B06','WCD10-B06-W221-CREATED','V1-ENT-0185','CREATED','V1-ENT-0456','何塞·多诺索创作 Los mejores cuentos de José Donoso','high','accepted','Codex-parent-independent-review:PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0398','SRC-0139'),
('V1-REL-0398','SRC-0409'),
('V1-REL-0399','SRC-0139'),
('V1-REL-0399','SRC-0410'),
('V1-REL-0400','SRC-0139'),
('V1-REL-0400','SRC-0415'),
('V1-REL-0400','SRC-0416'),
('V1-REL-0400','SRC-0417'),
('V1-REL-0401','SRC-0139'),
('V1-REL-0401','SRC-0419'),
('V1-REL-0402','SRC-0139'),
('V1-REL-0402','SRC-0313'),
('V1-REL-0402','SRC-0418'),
('V1-REL-0403','SRC-0142'),
('V1-REL-0403','SRC-0421'),
('V1-REL-0404','SRC-0142'),
('V1-REL-0404','SRC-0420'),
('V1-REL-0404','SRC-0423'),
('V1-REL-0405','SRC-0142'),
('V1-REL-0405','SRC-0426'),
('V1-REL-0405','SRC-0427'),
('V1-REL-0406','SRC-0144'),
('V1-REL-0406','SRC-0428'),
('V1-REL-0406','SRC-0429'),
('V1-REL-0406','SRC-0430'),
('V1-REL-0407','SRC-0144'),
('V1-REL-0407','SRC-0431'),
('V1-REL-0408','SRC-0144'),
('V1-REL-0408','SRC-0432'),
('V1-REL-0409','SRC-0433'),
('V1-REL-0409','SRC-0434'),
('V1-REL-0410','SRC-0144'),
('V1-REL-0410','SRC-0435'),
('V1-REL-0410','SRC-0439'),
('V1-REL-0411','SRC-0144'),
('V1-REL-0411','SRC-0436'),
('V1-REL-0412','SRC-0144'),
('V1-REL-0412','SRC-0437'),
('V1-REL-0413','SRC-0144'),
('V1-REL-0413','SRC-0438'),
('V1-REL-0413','SRC-0439'),
('V1-REL-0414','SRC-0144'),
('V1-REL-0414','SRC-0438'),
('V1-REL-0415','SRC-0439'),
('V1-REL-0416','SRC-0144'),
('V1-REL-0416','SRC-0441'),
('V1-REL-0417','SRC-0438'),
('V1-REL-0417','SRC-0442'),
('V1-REL-0417','SRC-0456'),
('V1-REL-0418','SRC-0144'),
('V1-REL-0418','SRC-0447'),
('V1-REL-0418','SRC-0456'),
('V1-REL-0419','SRC-0144'),
('V1-REL-0419','SRC-0448'),
('V1-REL-0420','SRC-0450'),
('V1-REL-0420','SRC-0456'),
('V1-REL-0421','SRC-0451'),
('V1-REL-0421','SRC-0452'),
('V1-REL-0422','SRC-0428'),
('V1-REL-0422','SRC-0453'),
('V1-REL-0422','SRC-0456'),
('V1-REL-0423','SRC-0454'),
('V1-REL-0423','SRC-0456'),
('V1-REL-0424','SRC-0455'),
('V1-REL-0425','SRC-0456');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0457','V1-REL-0398','WCD10-B06-S001','SRC-0139','Jorge Amado – Bibliografia','浏览器实读：书目清单第7–77行；亚马多旧作与新增对象对应题名、年份逐项核对；页面无网页发表日期。','若热·亚马多创作 Jubiabá','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0458','V1-REL-0398','WCD10-B06-S003','SRC-0409','Jubiabá','页面标题和作者署名第10–12行；安东尼奥·巴尔杜伊诺情节简介第19–20行；出版年份及体裁第21行。网页无明确发表日期。','若热·亚马多创作 Jubiabá','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0459','V1-REL-0399','WCD10-B06-S001','SRC-0139','Jorge Amado – Bibliografia','浏览器实读：书目清单第7–77行；亚马多旧作与新增对象对应题名、年份逐项核对；页面无网页发表日期。','若热·亚马多创作 Tenda dos milagres','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0460','V1-REL-0399','WCD10-B06-S004','SRC-0410','Tenda dos milagres','页面标题/作者第10–12行；Pedro Archanjo及双时代结构第14–18行；页面写作年份第19行（仅作写作年，不作首发年）。','若热·亚马多创作 Tenda dos milagres','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0461','V1-REL-0400','WCD10-B06-S001','SRC-0139','Jorge Amado – Bibliografia','浏览器实读：书目清单第7–77行；亚马多旧作与新增对象对应题名、年份逐项核对；页面无网页发表日期。','若热·亚马多创作 Cacau','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0462','V1-REL-0400','WCD10-B06-S009','SRC-0415','Cacau','页面标题/作者行10–12；简介行14–19：第一人称lavrador叙述、出版社称pequeno romance、社会政治意识及巴伊亚可可区作品脉络。页面未给网页发布日期；“written”年份不用于出版年。','若热·亚马多创作 Cacau','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0463','V1-REL-0400','WCD10-B06-S010','SRC-0416','Jorge Amado na juventude (1932-1936): O Boletim de Ariel como espaço de reflexão intelectual','期刊文章页：题名/作者行25–30；摘要直接逐列Cacau (1933)、Suor (1934)、Jubiabá (1935)、Mar morto (1936)、Capitães da areia (1937)行34–36；页面标Published 17-06-2019行42–49；DOI 10.14393/cdhis.v32n1.2019.49243。','若热·亚马多创作 Cacau','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0464','V1-REL-0400','WCD10-B06-S011','SRC-0417','Literatura e ensino de matemática: uma análise da obra Cacau (1933) de Jorge Amado, com base na Etnomatemática','题名/作者/DOI行29–38；摘要直接说明研究整本Cacau、可可种植社会文化实践和数学使用，并提到农场劳动者知识与社会批判，行43–46。页面Published 2026-05-10（页面元数据）。DOI 10.26694/rles.v30i63.6765。','若热·亚马多创作 Cacau','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0465','V1-REL-0401','WCD10-B06-S001','SRC-0139','Jorge Amado – Bibliografia','浏览器实读：书目清单第7–77行；亚马多旧作与新增对象对应题名、年份逐项核对；页面无网页发表日期。','若热·亚马多创作 O país do carnaval','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0466','V1-REL-0401','WCD10-B06-S014','SRC-0419','O país do carnaval','本次直接open成功：题名/作者行10–12；页面称首作/romance并标(1931)，给Paulo Rigger返巴、巴黎学习、萨尔瓦多诗人与记者群体及其意义追寻的简介行14–18。无网页发布日期。','若热·亚马多创作 O país do carnaval','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0467','V1-REL-0402','WCD10-B06-S001','SRC-0139','Jorge Amado – Bibliografia','浏览器实读：书目清单第7–77行；亚马多旧作与新增对象对应题名、年份逐项核对；页面无网页发表日期。','若热·亚马多创作 Tocaia grande','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0468','V1-REL-0402','WCD10-B06-S002','SRC-0313','Literatura — Jorge Amado: um sem-fim de romances','本轮直接成功打开；署名/页面日期行29–34；Tocaia Grande条目第54行直称“um romance”并称书将于1988出版。','若热·亚马多创作 Tocaia grande','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0469','V1-REL-0402','WCD10-B06-S013','SRC-0418','Tocaia grande','本次经旧产品URL成功重定向至当前canonical并实读：题名/作者行10–12；页面明确Publicado em 1984、建镇、土地争夺及Natário行14–19。','若热·亚马多创作 Tocaia grande','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0470','V1-REL-0403','WCD10-B06-S101','SRC-0142','Juan Carlos Onetti – Bibliografía','作品目录开头声明仅列叙事作品书籍首版；Novelas y novelas cortas 第1、4、5、8、10条，分别 El pozo (1939)、La vida breve (1950)、Los adioses (1954)、El astillero (1961)、Juntacadáveres (1964)；章节列作品类型范围及出版社/地点；同一首版书目在后续 Novelas y novelas cortas 条目列 Dejemos hablar al viento（1979）。','胡安·卡洛斯·奥内蒂创作 El pozo','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0471','V1-REL-0403','WCD10-B06-S104','SRC-0421','La narrativa breve de Onetti','PDF首页题名/作者/Universidad Nacional Autónoma de México署名；PDF P0（PDF第1页）L12–18说明Novelas cortas completas收录El pozo、Los adioses等并指出若干作品在不同版本中的分类变化；PDF P2（PDF第3页）L97–100称Linacero为El pozo主角并引其叙述目标；全文6页已实际打开阅读。页码为PDF页序，不是期刊印刷页码。','胡安·卡洛斯·奥内蒂创作 El pozo','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0472','V1-REL-0404','WCD10-B06-S101','SRC-0142','Juan Carlos Onetti – Bibliografía','作品目录开头声明仅列叙事作品书籍首版；Novelas y novelas cortas 第1、4、5、8、10条，分别 El pozo (1939)、La vida breve (1950)、Los adioses (1954)、El astillero (1961)、Juntacadáveres (1964)；章节列作品类型范围及出版社/地点；同一首版书目在后续 Novelas y novelas cortas 条目列 Dejemos hablar al viento（1979）。','胡安·卡洛斯·奥内蒂创作 Juntacadáveres','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0473','V1-REL-0404','WCD10-B06-S103','SRC-0420','Juan Carlos Onetti: Historias del otro lado','标题署名 Eduardo Becerra；正文《La vida breve》段（Brausen、Queca、Arce、电影脚本与Santa María）；《El pozo》段（孤独者以梦、回忆、想象纾解倦怠）；《Los adioses》段（退役篮球运动员及两名女性、叙述者猜测）；Larsen段明确列 Juntacadáveres 与 El astillero','胡安·卡洛斯·奥内蒂创作 Juntacadáveres','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0474','V1-REL-0404','WCD10-B06-S106','SRC-0423','Volviendo la mirada hacia "Juntacadáveres" (1964), de Juan Carlos Onetti','期刊原刊canonical页：Vol. 56 (2000): Abril，标题、作者及Pontificia Universidad Católica de Chile署名；摘要（西语）关于空间与人物功能“igualándose así”。全文PDF实际打开并读20页，直接下载端点：https://revistaliteratura.uchile.cl/index.php/RCL/article/download/39198/40826/135606；PDF第0页第4—15行，开篇列Larsen携三名妓女抵达、获准设妓院、后全组因妓院依法关闭离开；同页第16—21行及全文后文为学术分析。平台引文显示2016，但卷期首页与PDF页脚均为2000。','胡安·卡洛斯·奥内蒂创作 Juntacadáveres','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0475','V1-REL-0405','WCD10-B06-S101','SRC-0142','Juan Carlos Onetti – Bibliografía','作品目录开头声明仅列叙事作品书籍首版；Novelas y novelas cortas 第1、4、5、8、10条，分别 El pozo (1939)、La vida breve (1950)、Los adioses (1954)、El astillero (1961)、Juntacadáveres (1964)；章节列作品类型范围及出版社/地点；同一首版书目在后续 Novelas y novelas cortas 条目列 Dejemos hablar al viento（1979）。','胡安·卡洛斯·奥内蒂创作 Dejemos hablar al viento','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0476','V1-REL-0405','WCD10-B06-S109','SRC-0426','Onetti y el palimpsesto de la memoria','AIH论文完整8页PDF已读；首页署名Hugo J. Verani、University of California, Davis；PDF第0页第3—13行直接讨论Dejemos及其1979年/小说身份、Santa María系列收束及重写结构；PDF第5—6页第204—245行讨论Medina返Santa María及焚城结尾；PDF第7页书目列1979 Bruguera版。','胡安·卡洛斯·奥内蒂创作 Dejemos hablar al viento','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0477','V1-REL-0405','WCD10-B06-S110','SRC-0427','El último Onetti, o el deber absurdo y sagrado de escribir hasta el final','网页标题署名Teodosio Fernández；正文首段直接点名Dejemos hablar al viento (1979)、Santa María、comisario Medina与Colorado及毁城；页末作者说明其为Universidad Autónoma de Madrid西语美洲文学教授。','胡安·卡洛斯·奥内蒂创作 Dejemos hablar al viento','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0478','V1-REL-0406','WCD10-B06-S201','SRC-0144','José Donoso (1924-1996)','实读：简介L102-L112；作品时间线L104-L111、L478-L528；书目L127-L204。用于作者/作品目录、年版书目及明确标示体裁；页面持续更新日期未实证。','何塞·多诺索创作 Veraneo y otros cuentos','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0479','V1-REL-0406','WCD10-B06-S205','SRC-0428','Veraneo y otros cuentos – Memoria Chilena','实读L72-L87：作品标题；说明为七篇故事的书卷及七个篇名；说明其为Donoso首书；指向1955年封面。','何塞·多诺索创作 Veraneo y otros cuentos','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0480','V1-REL-0406','WCD10-B06-S206','SRC-0429','Portada de Veraneo y otros cuentos, 1955 – Memoria Chilena','实读L70-L72：题名、José Donoso署名、1955年、115页；此馆藏对象仅据现有文字记录年份与页数，未标“1a edición”。馆藏号/分类见L85-L99。','何塞·多诺索创作 Veraneo y otros cuentos','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0481','V1-REL-0406','WCD10-B06-S207','SRC-0430','Veraneo y otros cuentos / Summer Vacation and Other Stories – Agencia Literaria Carmen Balcells','实读L40-L47：页眉将作品类型/年份列作Short stories and novellas, 1951；正文另称Donoso首部故事集于1955年出版，并列出篇名。页面内部年份不一致。','何塞·多诺索创作 Veraneo y otros cuentos','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0482','V1-REL-0407','WCD10-B06-S201','SRC-0144','José Donoso (1924-1996)','实读：简介L102-L112；作品时间线L104-L111、L478-L528；书目L127-L204。用于作者/作品目录、年版书目及明确标示体裁；页面持续更新日期未实证。','何塞·多诺索创作 Este domingo','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0483','V1-REL-0407','WCD10-B06-S208','SRC-0431','Este domingo – Curriculum Nacional, Ministerio de Educación de Chile','实读L127-L147及重复简介L154-L156：作品名、José Donoso署名、novelas chilenas关键词/ISBN与读者向内容简介；不标首版年份。','何塞·多诺索创作 Este domingo','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0484','V1-REL-0408','WCD10-B06-S201','SRC-0144','José Donoso (1924-1996)','实读：简介L102-L112；作品时间线L104-L111、L478-L528；书目L127-L204。用于作者/作品目录、年版书目及明确标示体裁；页面持续更新日期未实证。','何塞·多诺索创作 Tres novelitas burguesas','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0485','V1-REL-0408','WCD10-B06-S209','SRC-0432','Tres novelitas burguesas – Agencia Literaria Carmen Balcells','实读L11-L22：作品名、Novela、1973、Alfaguara页数信息及三联篇/三段叙事的机构对象说明；L33-L75为作品导航列表（其中有多项不同年份）。','何塞·多诺索创作 Tres novelitas burguesas','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0486','V1-REL-0409','WCD10-B06-S210','SRC-0433','Casa de campo – Memoria Chilena','实读L72-L84：作品名、novela、明载1978出版与故事对象简介；页面并述1979获Premio de la Crítica de España。','何塞·多诺索创作 Casa de campo','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0487','V1-REL-0409','WCD10-B06-S211','SRC-0434','Portada de Casa de campo, 1978 – Memoria Chilena','实读L70-L73：题名、José Donoso署名及“1a. edición. Barcelona: Seix Barral, 1978, 498 páginas”；馆藏分类L85-L99。','何塞·多诺索创作 Casa de campo','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0488','V1-REL-0410','WCD10-B06-S201','SRC-0144','José Donoso (1924-1996)','实读：简介L102-L112；作品时间线L104-L111、L478-L528；书目L127-L204。用于作者/作品目录、年版书目及明确标示体裁；页面持续更新日期未实证。','何塞·多诺索创作 El jardín de al lado','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0489','V1-REL-0410','WCD10-B06-S212','SRC-0435','El jardín de al lado – Memoria Chilena','实读L72-L88：作品名/novela；Carlos Morand评论与对象介绍L81-L85，称Julio与Gloria夫妇离乡生活、流亡、远乡与出版处境；封面1981。','何塞·多诺索创作 El jardín de al lado','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0490','V1-REL-0410','WCD10-B06-S216','SRC-0439','A 25 AÑOS DE LA HISTORIA PERSONAL DEL «BOOM» DE JOSÉ DONOSO','实读L0-L3及L8-L18：文章署名Nadine Dejong（Université de Liège）；称《Historia personal del boom》是自传性文学随笔，1972初版，1983重版加Donoso附录《Diez años después》；并分别讨论1981《El jardín de al lado》与1995《Donde van a morir los elefantes》。','何塞·多诺索创作 El jardín de al lado','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0491','V1-REL-0411','WCD10-B06-S201','SRC-0144','José Donoso (1924-1996)','实读：简介L102-L112；作品时间线L104-L111、L478-L528；书目L127-L204。用于作者/作品目录、年版书目及明确标示体裁；页面持续更新日期未实证。','何塞·多诺索创作 Poemas de un novelista','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0492','V1-REL-0411','WCD10-B06-S213','SRC-0436','Poemas de un novelista – Memoria Chilena','实读L72-L93：唯一诗歌类作品；约三十首、按四章节组织；目录列出写作地点/年份并单列Tres poemas de 1952；封面1981。','何塞·多诺索创作 Poemas de un novelista','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0493','V1-REL-0412','WCD10-B06-S201','SRC-0144','José Donoso (1924-1996)','实读：简介L102-L112；作品时间线L104-L111、L478-L528；书目L127-L204。用于作者/作品目录、年版书目及明确标示体裁；页面持续更新日期未实证。','何塞·多诺索创作 La desesperanza','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0494','V1-REL-0412','WCD10-B06-S214','SRC-0437','La desesperanza – Memoria Chilena','实读L72-L89：novela；写作背景/故事对象L81-L86；页面列1986封面；作者档案书目另列1986 Seix Barral。','何塞·多诺索创作 La desesperanza','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0495','V1-REL-0413','WCD10-B06-S201','SRC-0144','José Donoso (1924-1996)','实读：简介L102-L112；作品时间线L104-L111、L478-L528；书目L127-L204。用于作者/作品目录、年版书目及明确标示体裁；页面持续更新日期未实证。','何塞·多诺索创作 Donde van a morir los elefantes','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0496','V1-REL-0413','WCD10-B06-S215','SRC-0438','Escribió cinco novelas voluminosas – Memoria Chilena','实读L72-L96：Conjeturas (1996) 的家族史/祖先记忆说明；Donde van a morir los elefantes为小说（1995）及对象级主题概述；另记录Taratuta衍生背景、El mocho为1997遗作小说。','何塞·多诺索创作 Donde van a morir los elefantes','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0497','V1-REL-0413','WCD10-B06-S216','SRC-0439','A 25 AÑOS DE LA HISTORIA PERSONAL DEL «BOOM» DE JOSÉ DONOSO','实读L0-L3及L8-L18：文章署名Nadine Dejong（Université de Liège）；称《Historia personal del boom》是自传性文学随笔，1972初版，1983重版加Donoso附录《Diez años después》；并分别讨论1981《El jardín de al lado》与1995《Donde van a morir los elefantes》。','何塞·多诺索创作 Donde van a morir los elefantes','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0498','V1-REL-0414','WCD10-B06-S201','SRC-0144','José Donoso (1924-1996)','实读：简介L102-L112；作品时间线L104-L111、L478-L528；书目L127-L204。用于作者/作品目录、年版书目及明确标示体裁；页面持续更新日期未实证。','何塞·多诺索创作 Conjeturas sobre la memoria de mi tribu','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0499','V1-REL-0414','WCD10-B06-S215','SRC-0438','Escribió cinco novelas voluminosas – Memoria Chilena','实读L72-L96：Conjeturas (1996) 的家族史/祖先记忆说明；Donde van a morir los elefantes为小说（1995）及对象级主题概述；另记录Taratuta衍生背景、El mocho为1997遗作小说。','何塞·多诺索创作 Conjeturas sobre la memoria de mi tribu','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0500','V1-REL-0415','WCD10-B06-S216','SRC-0439','A 25 AÑOS DE LA HISTORIA PERSONAL DEL «BOOM» DE JOSÉ DONOSO','实读L0-L3及L8-L18：文章署名Nadine Dejong（Université de Liège）；称《Historia personal del boom》是自传性文学随笔，1972初版，1983重版加Donoso附录《Diez años después》；并分别讨论1981《El jardín de al lado》与1995《Donde van a morir los elefantes》。','何塞·多诺索创作 Historia personal del ''boom''','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0501','V1-REL-0416','WCD10-B06-S201','SRC-0144','José Donoso (1924-1996)','实读：简介L102-L112；作品时间线L104-L111、L478-L528；书目L127-L204。用于作者/作品目录、年版书目及明确标示体裁；页面持续更新日期未实证。','何塞·多诺索创作 La misteriosa desaparición de la Marquesita de Loria','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0502','V1-REL-0416','WCD10-B06-S218','SRC-0441','La misteriosa desaparición de la Marquesita de Loria – Agencia Literaria Carmen Balcells','实读L42-L53：novela、1980、165页；年轻寡妇在1920年代马德里游走，简介叙述其感官/欲望经历。','何塞·多诺索创作 La misteriosa desaparición de la Marquesita de Loria','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0503','V1-REL-0417','WCD10-B06-S215','SRC-0438','Escribió cinco novelas voluminosas – Memoria Chilena','实读L72-L96：Conjeturas (1996) 的家族史/祖先记忆说明；Donde van a morir los elefantes为小说（1995）及对象级主题概述；另记录Taratuta衍生背景、El mocho为1997遗作小说。','何塞·多诺索创作 Taratuta. Naturaleza muerta con cachimba','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0504','V1-REL-0417','WCD10-B06-S220','SRC-0442','Taratuta. Naturaleza muerta con cachimba – Agencia Literaria Carmen Balcells','实读L11-L18：页面以合题标Novela、1990、Fondo de Cultura Económica；正文分别叙述Taratuta与Naturaleza muerta con cachimba两部小说的地点和故事背景。','何塞·多诺索创作 Taratuta. Naturaleza muerta con cachimba','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0505','V1-REL-0417','WCD10-B06-S234','SRC-0456','Donoso, José, 1924-1996 – Referencias bibliográficas, Memoria Chilena','实读L127-L142、L188-L200、L227-L238、L261-L284及L334-L354：国家馆藏分条著录Cuatro para Delfina (c1982)、Los mejores cuentos de José Donoso (1966)、Cuentos (c1971)、Dos cuentos (1956)、Taratuta; Naturaleza muerta con cachimba (c1990)、Nueve novelas breves (1996)、Artículos de incierta necesidad (c1998)等版本/页数。','何塞·多诺索创作 Taratuta. Naturaleza muerta con cachimba','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0506','V1-REL-0418','WCD10-B06-S201','SRC-0144','José Donoso (1924-1996)','实读：简介L102-L112；作品时间线L104-L111、L478-L528；书目L127-L204。用于作者/作品目录、年版书目及明确标示体裁；页面持续更新日期未实证。','何塞·多诺索创作 El Mocho','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0507','V1-REL-0418','WCD10-B06-S225','SRC-0447','El Mocho – Agencia Literaria Carmen Balcells','实读L11-L20：Novela、1997、Alfaguara；煤矿、军政府背景、妓院与马戏团构成叙事场景，并注明作者未及见出版。','何塞·多诺索创作 El Mocho','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0508','V1-REL-0418','WCD10-B06-S234','SRC-0456','Donoso, José, 1924-1996 – Referencias bibliográficas, Memoria Chilena','实读L127-L142、L188-L200、L227-L238、L261-L284及L334-L354：国家馆藏分条著录Cuatro para Delfina (c1982)、Los mejores cuentos de José Donoso (1966)、Cuentos (c1971)、Dos cuentos (1956)、Taratuta; Naturaleza muerta con cachimba (c1990)、Nueve novelas breves (1996)、Artículos de incierta necesidad (c1998)等版本/页数。','何塞·多诺索创作 El Mocho','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0509','V1-REL-0419','WCD10-B06-S201','SRC-0144','José Donoso (1924-1996)','实读：简介L102-L112；作品时间线L104-L111、L478-L528；书目L127-L204。用于作者/作品目录、年版书目及明确标示体裁；页面持续更新日期未实证。','何塞·多诺索创作 Lagartija sin cola','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0510','V1-REL-0419','WCD10-B06-S226','SRC-0448','Lagartija sin cola – Agencia Literaria Carmen Balcells','实读L11-L19：Novela、2007、Aguilar Chilena；Armando Muñoz-Roa为画家，叙述其离开非形式主义运动、与Luisa逃离及回望Dors；页面另称作者1973年开始写作后搁置。','何塞·多诺索创作 Lagartija sin cola','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0511','V1-REL-0420','WCD10-B06-S228','SRC-0450','Charlestón – Agencia Literaria Carmen Balcells','实读L12-L18：Relatos、1960、Nascimento；该卷明确收六篇短篇并逐篇列名。','何塞·多诺索创作 Charlestón','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0512','V1-REL-0420','WCD10-B06-S234','SRC-0456','Donoso, José, 1924-1996 – Referencias bibliográficas, Memoria Chilena','实读L127-L142、L188-L200、L227-L238、L261-L284及L334-L354：国家馆藏分条著录Cuatro para Delfina (c1982)、Los mejores cuentos de José Donoso (1966)、Cuentos (c1971)、Dos cuentos (1956)、Taratuta; Naturaleza muerta con cachimba (c1990)、Nueve novelas breves (1996)、Artículos de incierta necesidad (c1998)等版本/页数。','何塞·多诺索创作 Charlestón','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0513','V1-REL-0421','WCD10-B06-S229','SRC-0451','Portada de Nueve novelas breves, 1996 – Memoria Chilena','实读L70-L73及L85-L99：馆藏记录“Nueve novelas breves / Donoso. 1a edición, Santiago: Alfaguara, impresión de 1996, 606 páginas”。','何塞·多诺索创作 Nueve novelas breves','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0514','V1-REL-0421','WCD10-B06-S230','SRC-0452','Nueve novelas breves – Google Books','实读L16-L18、L30-L39：Alfaguara 1996、606页；描述称本卷收录九部先前分见三个独立书卷的中篇，并点名Tres novelitas burguesas、Cuatro para Delfina及Taratuta两部。','何塞·多诺索创作 Nueve novelas breves','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0515','V1-REL-0422','WCD10-B06-S205','SRC-0428','Veraneo y otros cuentos – Memoria Chilena','实读L72-L87：作品标题；说明为七篇故事的书卷及七个篇名；说明其为Donoso首书；指向1955年封面。','何塞·多诺索创作 Dos cuentos','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0516','V1-REL-0422','WCD10-B06-S231','SRC-0453','Donoso & Antúnez. A propósito de algunos paratextos icónicos','实读PDF L0-L19、L352-L379：Anales de Literatura Chilena 2024年第41期；作者Juan D. Cid Hidalgo；直接分析1956《Dos cuentos》卷，列“两篇故事+三幅版画”、45页、500册。','何塞·多诺索创作 Dos cuentos','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0517','V1-REL-0422','WCD10-B06-S234','SRC-0456','Donoso, José, 1924-1996 – Referencias bibliográficas, Memoria Chilena','实读L127-L142、L188-L200、L227-L238、L261-L284及L334-L354：国家馆藏分条著录Cuatro para Delfina (c1982)、Los mejores cuentos de José Donoso (1966)、Cuentos (c1971)、Dos cuentos (1956)、Taratuta; Naturaleza muerta con cachimba (c1990)、Nueve novelas breves (1996)、Artículos de incierta necesidad (c1998)等版本/页数。','何塞·多诺索创作 Dos cuentos','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0518','V1-REL-0423','WCD10-B06-S232','SRC-0454','Artículos de incierta necesidad – Agencia Literaria Carmen Balcells','实读L42-L47：Otros géneros、1998、Alfaguara；说明卷内精选自1960年起的新闻作品，由Cecilia García Huidobro按主题编排。','何塞·多诺索创作 Artículos de incierta necesidad','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0519','V1-REL-0423','WCD10-B06-S234','SRC-0456','Donoso, José, 1924-1996 – Referencias bibliográficas, Memoria Chilena','实读L127-L142、L188-L200、L227-L238、L261-L284及L334-L354：国家馆藏分条著录Cuatro para Delfina (c1982)、Los mejores cuentos de José Donoso (1966)、Cuentos (c1971)、Dos cuentos (1956)、Taratuta; Naturaleza muerta con cachimba (c1990)、Nueve novelas breves (1996)、Artículos de incierta necesidad (c1998)等版本/页数。','何塞·多诺索创作 Artículos de incierta necesidad','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0520','V1-REL-0424','WCD10-B06-S233','SRC-0455','EL ESCRIBIDOR INTRUSO – Ediciones UDP','实读L44-L68：书名、副题“Artículos, crónicas y entrevistas”、José Donoso、381页、2004；出版社介绍其收录1960年代初期文章、纪事和采访。','何塞·多诺索创作 El escribidor intruso','high','eligible_evidence','WCD-10-B06'),
('V1-EV-0521','V1-REL-0425','WCD10-B06-S234','SRC-0456','Donoso, José, 1924-1996 – Referencias bibliográficas, Memoria Chilena','实读L127-L142、L188-L200、L227-L238、L261-L284及L334-L354：国家馆藏分条著录Cuatro para Delfina (c1982)、Los mejores cuentos de José Donoso (1966)、Cuentos (c1971)、Dos cuentos (1956)、Taratuta; Naturaleza muerta con cachimba (c1990)、Nueve novelas breves (1996)、Artículos de incierta necesidad (c1998)等版本/页数。','何塞·多诺索创作 Los mejores cuentos de José Donoso','high','eligible_evidence','WCD-10-B06');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0152','WCD-10-B06-G01','research_gap','WCD10:B06:Amado:Suor','open','ABL列1934；UFU 2019摘要逐名列出Suor (1934)，但本轮未取得其出版社对象页的可读正文（仅搜索结果/旧摘录不当作实读）。目前缺直接对象简介，也未为该单作找到直接A层研究；不凭书目行写梗概。作品级释义待后续核验。','','Independent Reviewer: preserve deferred_work_level_summary_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0153','WCD-10-B06-G02','research_gap','WCD10:B06:Amado:Mar_morto','open','ABL列1936，UFU直接学术文章目录摘要列1936；出版社已知当前及旧ISBN对象路由本轮直开均Cache miss，官方搜索结果仅作访问线索，不用完整搜索摘录代替可复核页。尚无可实际核读的对象释义或足够对象层A研究用于建卡。','','Independent Reviewer: preserve deferred_work_level_summary_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0154','WCD-10-B06-G03','research_gap','WCD10:B06:Amado:São_Jorge_dos_Ilhéus','open','ABL书目可确认题名/书目年；出版社已知对象URL本轮direct-open Cache miss，官方搜索结果不作为已实读证据。对象释义及直接对象层学术研究均未达到提交标准。','','Independent Reviewer: preserve deferred_work_level_summary_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0155','WCD-10-B06-G04','research_gap','WCD10:B06:Amado:Seara_vermelha','open','ABL书目列出该作品；本轮未取得可实际核读的出版者对象简介或直接对象研究，故不以作者总体介绍补写作品层描述。','','Independent Reviewer: preserve deferred_work_level_summary_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0156','WCD-10-B06-G05','research_gap','WCD10:B06:Amado:Os_pastores_da_noite','open','ABL书目列出该作品；本轮未取得可实际核读的出版者对象简介或直接对象研究，故不以作者总体介绍补写作品层描述。','','Independent Reviewer: preserve deferred_work_level_summary_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0157','WCD-10-B06-G06','research_gap','WCD10:B06:Amado:Tereza_Batista','open','ABL书目列1972；已知Companhia对象页URL本轮direct-open Cache miss，仅检索结果不能用作可审计实读；无来源可支撑对象简介。','','Independent Reviewer: preserve deferred_work_level_summary_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0158','WCD-10-B06-G07','research_gap','WCD10:B06:Amado:Tieta_do_Agreste','open','ABL书目列1977；已知Companhia对象页URL本轮direct-open Cache miss，另一路旧页面返回404。官方搜索结果只作访问线索，不直接填补梗概/体裁字段；需取得对象正文并核其元数据。','','Independent Reviewer: preserve deferred_work_level_summary_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0159','WCD-10-B06-G08','research_gap','WCD10:B06:Amado:O_sumico_da_santa','open','书目可查；本轮未实际取得可核读的对象层释义/直接研究，留题名层研究缺口。','','Independent Reviewer: preserve deferred_work_level_summary_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0160','WCD-10-B06-G09','research_gap','WCD10:B06:Amado:A_descoberta_da_America_pelos_turcos','open','书目可查；本轮未实际取得可核读的对象层释义/直接研究，留题名层研究缺口。','','Independent Reviewer: preserve deferred_work_level_summary_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0161','WCD-10-B06-G10','research_gap','WCD10:B06:Amado:source_backed_additions_not_exhaustive','open','本轮新增O país do carnaval、Cacau和Tocaia Grande；其余ABL书目候选如Os subterrâneos da liberdade、Os velhos marinheiros、Farda fardão camisola de dormir等尚未逐对象检索，不能据此称作者作品谱系已充分扩展。未完成对象必须保留为后续研究范围。','','Independent Reviewer: preserve bounded_research_not_exhaustive','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0162','WCD-10-B06-G11','research_gap','WCD10:B06:Amado:story_places_unresolved','open','对象页直接出现Salvador、Ilhéus或fictional town情节空间；当前候选只提交CREATED，不创建SET_IN或关联地点关系。规范place端点和符合Schema的对象居所证据仍须逐项核验。','','Independent Reviewer: preserve hold_no_valid_place_endpoint','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0163','WCD-10-B06-G12','research_gap','WCD10:B06:Amado:interpretive_relations','open','直接学术材料仅转换为归属明确的作品research_note；没有为任一解释关系准备两项独立来源与规范端点，不提交EXPLORES_THEME等关系。','','Independent Reviewer: preserve no_relationship_proposed','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0164','WCD-10-B06-G13','research_gap','WCD10:B06:Amado:chinese_title_authority','open','新增作品所示中文名均明确为暂译，尚未查获正式中文译本/权威规范题名；原文题名为实体身份锚点。','','Independent Reviewer: preserve translation_titles_unverified','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0165','WCD-10-B06-G14','research_gap','WCD10:B06:Onetti:los_adioses_plot_structure_study','open','S104是A级学术来源，直接讨论Los adioses的novela corta分类及其在不同选集/版本中的归类（本包S104 locator标PDF页序）；本轮尚无已直接读取、足以深化该作剧情或叙事结构的专项研究。S103 B级具名评论只支持当前简要情节摘要。此缺口仅针对深化剧情/结构，不表示该作品没有A级来源。','','Independent Reviewer: preserve research_gap_limited','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0166','WCD-10-B06-G15','research_gap','WCD10:B06:Onetti:additional_work_object_triage','open','本包逐对象深查范围为三部旧对象La vida breve、El astillero、Los adioses及三部候选El pozo、Juntacadáveres、Dejemos hablar al viento，共六部，不声称覆盖全集。S101 CVC书目列出Tierra de nadie及Una tumba sin nombre；并注明Para una tumba sin nombre是Una tumba sin nombre（1959）的改题第二版（1967），因此仅作为后续对象/版本层级核查线索，不新增重复作品实体。后续逐对象取得层级、版次及简介材料；本条是有边界的书目线索，不表示剩余全集仅限这些书，也不把现有候选暂译当成规范中文名。','','Independent Reviewer: preserve bounded_follow_up_object_research','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0167','WCD-10-B06-G16','research_gap','WCD10:B06:Donoso:Cuatro_para_Delfina_first_edition_conflict','open','已实读Agency直接作品页，确认题名卷含四部novelas cortas；其栏头列1981。BNC作者书目实读为Seix Barral c1982。尚未取得可确认首版的目录/实物对象。依冲突处理规则，本轮不把栏头裁为首发年，也不提交entity candidate；仅保留已核书卷层级与分篇线索，待独立版次核验。','','Independent Reviewer: preserve bounded_gap_defer_entity','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0168','WCD-10-B06-G17','research_gap','WCD10:B06:Donoso:Cuentos_and_Los_mejores_cuentos_identity','open','BNC书目分列《Los mejores cuentos de José Donoso》(Zig-Zag 1966, 192页)与《Cuentos》(Seix Barral c1971, 284页)；Agency《Cuentos》页头列1970并称与“原始出版”相隔约30年。当前只提精确书名《Los mejores cuentos de José Donoso》候选，另一个Cuentos版次/重编身份待直接目录或版本页确认，不以同页导航合并。','','Independent Reviewer: preserve bounded_gap_preserve_exact_title_only','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0169','WCD-10-B06-G18','research_gap','WCD10:B06:Donoso:Traducciones_direct_object','open','作者经纪导航出现Traducciones，但其直接对象URL尝试两次仍无法打开；没有作品简介、出版对象或Donoso原创/编译身份实证。不得由导航项推实体。','','Independent Reviewer: preserve NOT_VERIFIED_bounded_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0170','WCD-10-B06:V1-ENT-0179','research_gap','WCD10:work_level_research:V1-ENT-0179','open','作品级直接释义目前仅B级出版社简介；作品级A级研究缺口OPEN。旧事实FCT-0387/0388/0389、CARD-0073、REL-0109均保留。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0171','WCD-10-B06:V1-ENT-0180','research_gap','WCD10:work_level_research:V1-ENT-0180','open','作品级直接释义目前仅B级出版社简介；作品级A级研究缺口OPEN。旧事实FCT-0390/0391/0392、CARD-0074、REL-0110均保留。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0172','WCD-10-B06:V1-ENT-0181','research_gap','WCD10:work_level_research:V1-ENT-0181','open','作品级直接释义目前仅B级出版社简介；作品级A级研究缺口OPEN。旧FCT-0395仍由SRC-0140支持；注意旧note曾将题名变体记录，未改写。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0173','WCD-10-B06:WCD10-B06-W001','research_gap','WCD10:work_level_research:V1-ENT-0429','open','作品级A级研究缺口OPEN；现有对象简介/书目为B层来源。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0174','WCD-10-B06:WCD10-B06-W004','research_gap','WCD10:work_level_research:V1-ENT-0432','open','作品级A级研究缺口OPEN；现有对象简介/书目为B层来源。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0175','WCD-10-B06:WCD10-B06-W005','research_gap','WCD10:work_level_research:V1-ENT-0433','open','作品级A级研究缺口OPEN；现有对象简介/书目为B层来源。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0176','WCD-10-B06:V1-ENT-0190','research_gap','WCD10:work_level_research:V1-ENT-0190','open','旧事实、卡片、CREATED和来源链不改；本次仅添work genre及直接人物/情节来源描述。年份差异在EVIDENCE_MATRIX明确保留。 具体A类研究缺口：本轮补入经纪机构直接对象简介，但未取得可直接支持这些故事简介的A类研究；既有来源及卡片链全保留。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0177','WCD-10-B06:V1-ENT-0191','research_gap','WCD10:work_level_research:V1-ENT-0191','open','旧事实、卡片、CREATED和来源链不改；本次仅添work genre及直接人物/情节来源描述。年份差异在EVIDENCE_MATRIX明确保留。 具体A类研究缺口：本轮补入经纪机构直接对象简介，但未取得可直接支持这些故事简介的A类研究；既有来源及卡片链全保留。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0178','WCD-10-B06:V1-ENT-0192','research_gap','WCD10:work_level_research:V1-ENT-0192','open','旧事实、卡片、CREATED和来源链不改；本次仅添work genre及直接人物/情节来源描述。年份差异在EVIDENCE_MATRIX明确保留。 具体A类研究缺口：本轮补入经纪机构直接对象简介，但未取得可直接支持这些故事简介的A类研究；既有来源及卡片链全保留。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0179','WCD-10-B06:WCD10-B06-W201','research_gap','WCD10:work_level_research:V1-ENT-0437','open','Candidate only; not formal entity/card/relation/public content. Unresolved edition/year issue is listed in EVIDENCE_MATRIX.edition_conflicts. 具体A类研究缺口：本轮未取得直接研究该对象（或本卷具体篇目/版本）的学术来源；本行来源仅支持所列书目、体裁或对象简介，不据此生成学术解释。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0180','WCD-10-B06:WCD10-B06-W202','research_gap','WCD10:work_level_research:V1-ENT-0438','open','具体A类研究缺口：本轮未取得直接研究该对象（或本卷具体篇目/版本）的学术来源；本行来源仅支持所列书目、体裁或对象简介，不据此生成学术解释。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0181','WCD-10-B06:WCD10-B06-W203','research_gap','WCD10:work_level_research:V1-ENT-0439','open','具体A类研究缺口：本轮未取得直接研究该对象（或本卷具体篇目/版本）的学术来源；本行来源仅支持所列书目、体裁或对象简介，不据此生成学术解释。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0182','WCD-10-B06:WCD10-B06-W204','research_gap','WCD10:work_level_research:V1-ENT-0440','open','Candidate only; not formal entity/card/relation/public content. Unresolved edition/year issue is listed in EVIDENCE_MATRIX.edition_conflicts. 具体A类研究缺口：本轮未取得直接研究该对象（或本卷具体篇目/版本）的学术来源；本行来源仅支持所列书目、体裁或对象简介，不据此生成学术解释。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0183','WCD-10-B06:WCD10-B06-W206','research_gap','WCD10:work_level_research:V1-ENT-0442','open','具体A类研究缺口：本轮未取得直接研究该对象（或本卷具体篇目/版本）的学术来源；本行来源仅支持所列书目、体裁或对象简介，不据此生成学术解释。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0184','WCD-10-B06:WCD10-B06-W207','research_gap','WCD10:work_level_research:V1-ENT-0443','open','具体A类研究缺口：本轮未取得直接研究该对象（或本卷具体篇目/版本）的学术来源；本行来源仅支持所列书目、体裁或对象简介，不据此生成学术解释。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0185','WCD-10-B06:WCD10-B06-W209','research_gap','WCD10:work_level_research:V1-ENT-0445','open','具体A类研究缺口：本轮未取得直接研究该对象（或本卷具体篇目/版本）的学术来源；本行来源仅支持所列书目、体裁或对象简介，不据此生成学术解释。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0186','WCD-10-B06:WCD10-B06-W211','research_gap','WCD10:work_level_research:V1-ENT-0447','open','具体A类研究缺口：本轮未取得直接研究该对象（或本卷具体篇目/版本）的学术来源；本行来源仅支持所列书目、体裁或对象简介，不据此生成学术解释。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0187','WCD-10-B06:WCD10-B06-W213','research_gap','WCD10:work_level_research:V1-ENT-0448','open','具体A类研究缺口：本轮未取得直接研究该对象（或本卷具体篇目/版本）的学术来源；本行来源仅支持所列书目、体裁或对象简介，不据此生成学术解释。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0188','WCD-10-B06:WCD10-B06-W214','research_gap','WCD10:work_level_research:V1-ENT-0449','open','具体A类研究缺口：本轮未取得直接研究该对象（或本卷具体篇目/版本）的学术来源；本行来源仅支持所列书目、体裁或对象简介，不据此生成学术解释。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0189','WCD-10-B06:WCD10-B06-W215','research_gap','WCD10:work_level_research:V1-ENT-0450','open','具体A类研究缺口：本轮未取得直接研究该对象（或本卷具体篇目/版本）的学术来源；本行来源仅支持所列书目、体裁或对象简介，不据此生成学术解释。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0190','WCD-10-B06:WCD10-B06-W216','research_gap','WCD10:work_level_research:V1-ENT-0451','open','具体A类研究缺口：本轮未取得直接研究该对象（或本卷具体篇目/版本）的学术来源；本行来源仅支持所列书目、体裁或对象简介，不据此生成学术解释。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0191','WCD-10-B06:WCD10-B06-W217','research_gap','WCD10:work_level_research:V1-ENT-0452','open','Candidate only; not formal entity/card/relation/public content. Unresolved edition/year issue is listed in EVIDENCE_MATRIX.edition_conflicts. 具体A类研究缺口：本轮未取得直接研究该对象（或本卷具体篇目/版本）的学术来源；本行来源仅支持所列书目、体裁或对象简介，不据此生成学术解释。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0192','WCD-10-B06:WCD10-B06-W219','research_gap','WCD10:work_level_research:V1-ENT-0454','open','具体A类研究缺口：本轮未取得直接研究该对象（或本卷具体篇目/版本）的学术来源；本行来源仅支持所列书目、体裁或对象简介，不据此生成学术解释。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0193','WCD-10-B06:WCD10-B06-W220','research_gap','WCD10:work_level_research:V1-ENT-0455','open','具体A类研究缺口：本轮未取得直接研究该对象（或本卷具体篇目/版本）的学术来源；本行来源仅支持所列书目、体裁或对象简介，不据此生成学术解释。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0194','WCD-10-B06:WCD10-B06-W221','research_gap','WCD10:work_level_research:V1-ENT-0456','open','Candidate only; not formal entity/card/relation/public content. Unresolved edition/year issue is listed in EVIDENCE_MATRIX.edition_conflicts. 具体A类研究缺口：本轮未取得直接研究该对象（或本卷具体篇目/版本）的学术来源；本行来源仅支持所列书目、体裁或对象简介，不据此生成学术解释。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');

UPDATE metadata SET value='WCD-10-B06' WHERE key='last_change_set';

UPDATE metadata SET value='2026-10-08' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 456 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 454 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 452 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 380 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1370 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 1523 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1349 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 752 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 423 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 550 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 521 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 194 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
