-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: wcd10_b01_review

-- Registration sha256: adb2a168f2b82bffcdddef563b27d1af00e88d0a94d961f5c87e161a280ac65a

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1006 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 528 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 261 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 377 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 375 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 1081 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1027 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 24 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 35 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 379 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 408 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 334 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 314 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-07A' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0317' OR canonical_url='https://cvc.cervantes.es/actcult/borges/obras/1923b.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0318' OR canonical_url='https://cvc.cervantes.es/actcult/borges/obras/1935b.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0319' OR canonical_url='https://cvc.cervantes.es/actcult/borges/obras/1960b.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0320' OR canonical_url='https://www.cervantes.es/bibliotecas_documentacion_espanol/biografias/nueva_york_jorge_luis_borges.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0321' OR canonical_url='https://www.planetadelibros.com/libro-historia-universal-de-la-infamia/1182') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0322' OR canonical_url='https://www.penguinrandomhouse.com/books/219798/el-hacedor--dreamtigers-by-jorge-luis-borges/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0323' OR canonical_url='https://site.claricelispector.ims.com.br/livro/perto-do-coracao-selvagem/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0324' OR canonical_url='https://site.claricelispector.ims.com.br/livro/a-maca-no-escuro/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0325' OR canonical_url='https://site.claricelispector.ims.com.br/livro/uma-aprendizagem-ou-o-livro-dos-prazeres/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0326' OR canonical_url='https://www.elem.mx/obra/datos/850') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0327' OR canonical_url='https://www.elem.mx/obra/datos/3410') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0328' OR canonical_url='https://www.elem.mx/obra/datos/124026') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0329' OR canonical_url='https://cvc.cervantes.es/actcult/borges/obras/1949b.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0330' OR canonical_url='https://site.claricelispector.ims.com.br/livro/a-paixao-segundo-g-h/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0331' OR canonical_url='https://site.claricelispector.ims.com.br/livro/um-sopro-de-vida/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0332' OR canonical_url='https://www.elem.mx/obra/datos/93746') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0333' OR canonical_url='https://cvc.cervantes.es/actcult/borges/crono/37b.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0334' OR canonical_url='https://site.claricelispector.ims.com.br/livro/felicidade-clandestina/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0335' OR canonical_url='https://www.penguinlibros.com/es/literatura-contemporanea/30631-libro-ficciones-9788426405739') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0336' OR canonical_url='https://www.penguinlibros.com/es/literatura-contemporanea/626388-libro-el-aleph-9791387846114') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0337' OR canonical_url='https://www.penguinlibros.com/es/literatura-contemporanea/626389-libro-el-informe-brodie-9791387846152') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0338' OR canonical_url='https://erevistas.uacj.mx/ojs/index.php/cuadfront/article/view/3194') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0339' OR canonical_url='https://cvc.cervantes.es/actcult/borges/obras/1952b.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0340' OR canonical_url='https://www.library.rochester.edu/rbscp/blog/borges') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0341' OR canonical_url='https://www.penguinlibros.com/es/literatura-contemporanea/324267-libro-el-libro-de-arena-9788426407504') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0380' OR (entity_type='collection' AND original_name='Fervor de Buenos Aires')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0381' OR (entity_type='collection' AND original_name='Historia universal de la infamia')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0382' OR (entity_type='collection' AND original_name='El hacedor')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0383' OR (entity_type='work' AND original_name='Perto do coração selvagem')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0384' OR (entity_type='work' AND original_name='A maçã no escuro')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0385' OR (entity_type='work' AND original_name='Uma aprendizagem ou o livro dos prazeres')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0386' OR (entity_type='collection' AND original_name='Andamos huyendo Lola')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0387' OR (entity_type='work' AND original_name='Reencuentro de personajes')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0388' OR (entity_type='work' AND original_name='La casa junto al río')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0389' OR (entity_type='collection' AND original_name='Otras inquisiciones')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1034' OR (subject_id='V1-ENT-0380' AND fact_field='first_publication_year' AND value_text='1923')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1035' OR (subject_id='V1-ENT-0380' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1036' OR (subject_id='V1-ENT-0380' AND fact_field='one_sentence_summary' AND value_text='博尔赫斯于 1923 年出版的首部诗集。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1037' OR (subject_id='V1-ENT-0381' AND fact_field='first_publication_year' AND value_text='1935')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1038' OR (subject_id='V1-ENT-0381' AND fact_field='genre_or_form' AND value_text='短篇叙事集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1039' OR (subject_id='V1-ENT-0381' AND fact_field='story_premise' AND value_text='以不同文化背景中的恶人传记和轶事为素材，改写成一组短篇叙事。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1040' OR (subject_id='V1-ENT-0382' AND fact_field='first_publication_year' AND value_text='1960')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1041' OR (subject_id='V1-ENT-0382' AND fact_field='genre_or_form' AND value_text='诗、短篇与随笔合集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1042' OR (subject_id='V1-ENT-0382' AND fact_field='one_sentence_summary' AND value_text='由诗、短篇与随笔组成的文集，收录《博尔赫斯与我》等文本。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1043' OR (subject_id='V1-ENT-0383' AND fact_field='first_publication_year' AND value_text='1943')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1044' OR (subject_id='V1-ENT-0383' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1045' OR (subject_id='V1-ENT-0383' AND fact_field='story_premise' AND value_text='围绕乔安娜的内心经验展开，在过去的回忆与当下的感知之间推进叙述。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1046' OR (subject_id='V1-ENT-0384' AND fact_field='first_publication_year' AND value_text='1961')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1047' OR (subject_id='V1-ENT-0384' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1048' OR (subject_id='V1-ENT-0384' AND fact_field='story_premise' AND value_text='以第三人称叙述马丁的逃亡：他相信自己犯下了罪行，在恐惧与渴望自由之间徘徊。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1049' OR (subject_id='V1-ENT-0385' AND fact_field='first_publication_year' AND value_text='1969')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1050' OR (subject_id='V1-ENT-0385' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1051' OR (subject_id='V1-ENT-0385' AND fact_field='story_premise' AND value_text='小学教师洛丽从坎波斯来到里约热内卢，与哲学教师尤利西斯相识，故事围绕两人的亲密关系展开。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1052' OR (subject_id='V1-ENT-0386' AND fact_field='first_publication_year' AND value_text='1980')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1053' OR (subject_id='V1-ENT-0386' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1054' OR (subject_id='V1-ENT-0386' AND fact_field='one_sentence_summary' AND value_text='加罗于 1980 年由 Joaquín Mortiz 出版的短篇小说集。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1055' OR (subject_id='V1-ENT-0387' AND fact_field='first_publication_year' AND value_text='1982')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1056' OR (subject_id='V1-ENT-0387' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1057' OR (subject_id='V1-ENT-0387' AND fact_field='story_premise' AND value_text='弗兰克与维罗妮卡在欧洲辗转逃亡；他自称认识菲茨杰拉德夫妇，她却怀疑他已成为杀人犯。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1058' OR (subject_id='V1-ENT-0388' AND fact_field='first_publication_year' AND value_text='1983')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1059' OR (subject_id='V1-ENT-0388' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1060' OR (subject_id='V1-ENT-0388' AND fact_field='story_premise' AND value_text='一位女人试图返回童年和过去，却在与周围人物的接触中遭遇敌意。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1061' OR (subject_id='V1-ENT-0389' AND fact_field='first_publication_year' AND value_text='1952')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1062' OR (subject_id='V1-ENT-0389' AND fact_field='genre_or_form' AND value_text='随笔集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1063' OR (subject_id='V1-ENT-0389' AND fact_field='one_sentence_summary' AND value_text='汇集此前在文学期刊发表的随笔，内容涉及文学、语言、历史、宗教与哲学问题。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1064' OR (subject_id='V1-ENT-0012' AND fact_field='first_publication_year' AND value_text='1949')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1065' OR (subject_id='V1-ENT-0012' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1066' OR (subject_id='V1-ENT-0012' AND fact_field='one_sentence_summary' AND value_text='短篇小说集，收录同名短篇、《不朽者》和《艾玛·宗兹》等故事，以不同叙事呈现幻想、人物命运与时间经验。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1067' OR (subject_id='V1-ENT-0020' AND fact_field='first_publication_year' AND value_text='1964')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1068' OR (subject_id='V1-ENT-0020' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1069' OR (subject_id='V1-ENT-0020' AND fact_field='story_premise' AND value_text='G.H. 以第一人称回忆打扫佣人房间时遇见蟑螂的经历，以及这一遭遇引起的内心震动。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1070' OR (subject_id='V1-ENT-0026' AND fact_field='first_publication_year' AND value_text='1978')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1071' OR (subject_id='V1-ENT-0026' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1072' OR (subject_id='V1-ENT-0026' AND fact_field='story_premise' AND value_text='一位作家叙述者与他笔下的安热拉·普拉利尼相互映照，叙述围绕作者与人物的边界展开。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1073' OR (subject_id='V1-ENT-0045' AND fact_field='first_periodical_publication_year' AND value_text='1967')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1074' OR (subject_id='V1-ENT-0045' AND fact_field='bibliographic_note' AND value_text='1979 年由墨西哥国立自治大学（UNAM）出版书版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1075' OR (subject_id='V1-ENT-0045' AND fact_field='genre_or_form' AND value_text='戏剧')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1076' OR (subject_id='V1-ENT-0045' AND fact_field='story_premise' AND value_text='戏剧重现费利佩·安赫莱斯将军的军事审判及其被处决前的经历。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1077' OR (subject_id='V1-ENT-0163' AND fact_field='first_publication_year' AND value_text='1970')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1078' OR (subject_id='V1-ENT-0163' AND fact_field='one_sentence_summary' AND value_text='由十一篇故事组成的短篇集，叙述人物之间的对峙、决斗，以及对陌生他者的恐惧与吸引。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1079' OR (subject_id='V1-ENT-0011' AND fact_field='one_sentence_summary' AND value_text='短篇作品集，收录《死亡与罗盘》《环形废墟》和《特隆、乌克巴尔、奥比斯·特蒂乌斯》等故事，将侦探叙事与幻想叙事并置。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1080' OR (subject_id='V1-ENT-0166' AND fact_field='one_sentence_summary' AND value_text='短篇集，以阅读、亲吻和日常感知中的细小经历展开不同人物的经验。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1081' OR (subject_id='V1-ENT-0034' AND fact_field='research_note' AND value_text='Patricia Rosas Lopátegui 在《Cuestiones en torno a Testimonios sobre Mariana, de Elena Garro》中以副文本理论对照作家日记与小说片段，讨论生活经验在小说叙述中的转化。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1082' OR (subject_id='V1-ENT-0162' AND fact_field='one_sentence_summary' AND value_text='短篇小说集，收录《另一个人》《乌尔里卡》《大会》和同名短篇等故事，叙述自我相遇、爱情与幻想中的经历。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0337' OR (subject_id='V1-ENT-0002' AND relation_type='CREATED' AND object_id='V1-ENT-0380')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0338' OR (subject_id='V1-ENT-0002' AND relation_type='CREATED' AND object_id='V1-ENT-0381')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0339' OR (subject_id='V1-ENT-0002' AND relation_type='CREATED' AND object_id='V1-ENT-0382')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0340' OR (subject_id='V1-ENT-0016' AND relation_type='CREATED' AND object_id='V1-ENT-0383')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0341' OR (subject_id='V1-ENT-0016' AND relation_type='CREATED' AND object_id='V1-ENT-0384')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0342' OR (subject_id='V1-ENT-0016' AND relation_type='CREATED' AND object_id='V1-ENT-0385')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0343' OR (subject_id='V1-ENT-0029' AND relation_type='CREATED' AND object_id='V1-ENT-0386')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0344' OR (subject_id='V1-ENT-0029' AND relation_type='CREATED' AND object_id='V1-ENT-0387')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0345' OR (subject_id='V1-ENT-0029' AND relation_type='CREATED' AND object_id='V1-ENT-0388')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0346' OR (subject_id='V1-ENT-0002' AND relation_type='CREATED' AND object_id='V1-ENT-0389')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0347' OR (subject_id='V1-ENT-0385' AND relation_type='SET_IN' AND object_id='V1-ENT-0022')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0317','WCD10-B01-S01','CVC. Borges 100 años. Obras. 1923.','CVC. Borges 100 años. Obras. 1923.','Instituto Cervantes','','Instituto Cervantes','','','institutional_bibliography','','es','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://cvc.cervantes.es/actcult/borges/obras/1923b.htm'),
('SRC-0318','WCD10-B01-S02','CVC. Borges 100 años. Obras. 1935.','CVC. Borges 100 años. Obras. 1935.','Instituto Cervantes','','Instituto Cervantes','','','institutional_bibliography','','es','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://cvc.cervantes.es/actcult/borges/obras/1935b.htm'),
('SRC-0319','WCD10-B01-S03','CVC. Borges 100 años. Obras. 1960.','CVC. Borges 100 años. Obras. 1960.','Instituto Cervantes','','Instituto Cervantes','','','institutional_bibliography','','es','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://cvc.cervantes.es/actcult/borges/obras/1960b.htm'),
('SRC-0320','WCD10-B01-S04','Jorge Luis Borges. Biografía','Jorge Luis Borges. Biografía','Instituto Cervantes','','Instituto Cervantes','','','institutional_biography','','es','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://www.cervantes.es/bibliotecas_documentacion_espanol/biografias/nueva_york_jorge_luis_borges.htm'),
('SRC-0321','WCD10-B01-S05','Historia universal de la infamia - Jorge Luis Borges','Historia universal de la infamia - Jorge Luis Borges','Ediciones Destino / Grupo Planeta','','Ediciones Destino / Grupo Planeta','','','publisher_catalog','','es','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://www.planetadelibros.com/libro-historia-universal-de-la-infamia/1182'),
('SRC-0322','WCD10-B01-S06','El hacedor / Dreamtigers','El hacedor / Dreamtigers','Vintage Español / Penguin Random House','','Vintage Español / Penguin Random House','','','publisher_catalog','','es','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://www.penguinrandomhouse.com/books/219798/el-hacedor--dreamtigers-by-jorge-luis-borges/'),
('SRC-0323','WCD10-B01-S07','Perto do coração selvagem','Perto do coração selvagem','Martha Alkmin / Instituto Moreira Salles','','Instituto Moreira Salles','','','institutional_work_commentary','','pt','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://site.claricelispector.ims.com.br/livro/perto-do-coracao-selvagem/'),
('SRC-0324','WCD10-B01-S08','A maçã no escuro','A maçã no escuro','Martha Alkmin / Instituto Moreira Salles','','Instituto Moreira Salles','','','institutional_work_commentary','','pt','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://site.claricelispector.ims.com.br/livro/a-maca-no-escuro/'),
('SRC-0325','WCD10-B01-S09','Uma aprendizagem ou o livro dos prazeres','Uma aprendizagem ou o livro dos prazeres','Clarisse Fukelman / Instituto Moreira Salles','','Instituto Moreira Salles','','','institutional_work_commentary','','pt','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://site.claricelispector.ims.com.br/livro/uma-aprendizagem-ou-o-livro-dos-prazeres/'),
('SRC-0326','WCD10-B01-S10','Andamos huyendo Lola - Detalle de la obra','Andamos huyendo Lola - Detalle de la obra','Fundación para las Letras Mexicanas / ELEM','','Fundación para las Letras Mexicanas','','','institutional_work_record','','es','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://www.elem.mx/obra/datos/850'),
('SRC-0327','WCD10-B01-S11','Reencuentro de personajes - Detalle de la obra','Reencuentro de personajes - Detalle de la obra','Fundación para las Letras Mexicanas / ELEM','','Fundación para las Letras Mexicanas','','','institutional_work_record','','es','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://www.elem.mx/obra/datos/3410'),
('SRC-0328','WCD10-B01-S12','La casa junto al río - Detalle de la obra','La casa junto al río - Detalle de la obra','Fundación para las Letras Mexicanas / ELEM','','Fundación para las Letras Mexicanas','','','institutional_work_record','','es','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://www.elem.mx/obra/datos/124026'),
('SRC-0329','WCD10-B01-S13','CVC. Borges 100 años. Obras. 1949.','CVC. Borges 100 años. Obras. 1949.','Instituto Cervantes','','Instituto Cervantes','','','institutional_bibliography','','es','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://cvc.cervantes.es/actcult/borges/obras/1949b.htm'),
('SRC-0330','WCD10-B01-S14','A paixão segundo G.H.','A paixão segundo G.H.','Martha Alkmin / Instituto Moreira Salles','','Instituto Moreira Salles','','','institutional_work_commentary','','pt','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://site.claricelispector.ims.com.br/livro/a-paixao-segundo-g-h/'),
('SRC-0331','WCD10-B01-S15','Um sopro de vida','Um sopro de vida','Clarisse Fukelman / Instituto Moreira Salles','','Instituto Moreira Salles','','','institutional_work_commentary','','pt','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://site.claricelispector.ims.com.br/livro/um-sopro-de-vida/'),
('SRC-0332','WCD10-B01-S16','Felipe Ángeles - Detalle de la obra','Felipe Ángeles - Detalle de la obra','Eleonora Luna / Fundación para las Letras Mexicanas / ELEM','','Fundación para las Letras Mexicanas','','','institutional_work_commentary','','es','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://www.elem.mx/obra/datos/93746'),
('SRC-0333','WCD10-B01-S17','CVC. Borges 100 años. Cronología. 1970.','CVC. Borges 100 años. Cronología. 1970.','Instituto Cervantes','','Instituto Cervantes','','','institutional_chronology','','es','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://cvc.cervantes.es/actcult/borges/crono/37b.htm'),
('SRC-0334','WCD10-B01-S18','Felicidade clandestina','Felicidade clandestina','Martha Alkmin / Instituto Moreira Salles','','Instituto Moreira Salles','','','institutional_work_commentary','','pt','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://site.claricelispector.ims.com.br/livro/felicidade-clandestina/'),
('SRC-0335','WCD10-B01-S21','Ficciones','Ficciones','Penguin Random House Grupo Editorial','','Penguin Random House Grupo Editorial','','','publisher_catalog','','es','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://www.penguinlibros.com/es/literatura-contemporanea/30631-libro-ficciones-9788426405739'),
('SRC-0336','WCD10-B01-S22','El Aleph','El Aleph','Alfaguara / Penguin Random House Grupo Editorial','','Alfaguara / Penguin Random House Grupo Editorial','','','publisher_catalog','','es','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://www.penguinlibros.com/es/literatura-contemporanea/626388-libro-el-aleph-9791387846114'),
('SRC-0337','WCD10-B01-S23','El informe Brodie','El informe Brodie','Alfaguara / Penguin Random House Grupo Editorial','','Alfaguara / Penguin Random House Grupo Editorial','','','publisher_catalog','','es','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://www.penguinlibros.com/es/literatura-contemporanea/626389-libro-el-informe-brodie-9791387846152'),
('SRC-0338','WCD10-B01-S24','Cuestiones en torno a Testimonios sobre Mariana, de Elena Garro','Cuestiones en torno a Testimonios sobre Mariana, de Elena Garro','Patricia Rosas Lopátegui / Revista de las Fronteras, UACJ','','Revista de las Fronteras, UACJ; current archive Cuadernos Fronterizos','2007','','scholarly_article','5','es','A','access_pass','WCD-10-B01','metadata_and_summary','remote_only','Revista de las Fronteras, no. 8, pp. 8–12; OJS article 3194','https://erevistas.uacj.mx/ojs/index.php/cuadfront/article/view/3194'),
('SRC-0339','WCD10-B01-S25','CVC. Borges 100 años. Obras. 1952.','CVC. Borges 100 años. Obras. 1952.','Instituto Cervantes','','Instituto Cervantes','','','institutional_bibliography','','es','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://cvc.cervantes.es/actcult/borges/obras/1952b.htm'),
('SRC-0340','WCD10-B01-S26','Collection Highlight: Borges'' Otras inquisiciones (1952)','Collection Highlight: Borges'' Otras inquisiciones (1952)','Pablo Alvarez / River Campus Libraries, University of Rochester','','River Campus Libraries, University of Rochester','2008','','university_library_article','','en','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://www.library.rochester.edu/rbscp/blog/borges'),
('SRC-0341','WCD10-B01-S27','El libro de arena','El libro de arena','Lumen / Penguin Random House Grupo Editorial','','Lumen / Penguin Random House Grupo Editorial','','','publisher_catalog','','es','B','access_pass','WCD-10-B01','metadata_and_summary','remote_only','','https://www.penguinlibros.com/es/literatura-contemporanea/324267-libro-el-libro-de-arena-9788426407504');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0380','collection','《布宜诺斯艾利斯的激情》（暂译）','Fervor de Buenos Aires','candidate','1','WCD10-B01-W01','补足现有作品谱系的诗歌起点，而不是继续只扩短篇。; 暂译，不声明为已核实中文版本名','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0381','collection','《世界恶人史》（暂译）','Historia universal de la infamia','candidate','1','WCD10-B01-W02','补足早期短篇集合；保留其与后期小说集的书目边界。; 暂译，不声明为已核实中文版本名','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0382','collection','《造物者》（暂译）','El hacedor','candidate','1','WCD10-B01-W03','补足诗、短篇与随笔交织的集合层级，不能降为同名单篇。; 暂译，不声明为已核实中文版本名','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0383','work','《靠近狂野的心》（暂译）','Perto do coração selvagem','candidate','1','WCD10-B01-W04','补足作者首部长篇小说及 Joana 的内在叙事。; 暂译，不声明为已核实中文版本名','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0384','work','《暗处的苹果》（暂译）','A maçã no escuro','candidate','1','WCD10-B01-W05','补足 1961 年长篇；不采用源页涉及 G.H. 的旁支错年。; 暂译，不声明为已核实中文版本名','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0385','work','《一种学习，或快乐之书》（暂译）','Uma aprendizagem ou o livro dos prazeres','candidate','1','WCD10-B01-W06','补足 1969 年长篇及直接支持的里约场景。; 暂译，不声明为已核实中文版本名','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0386','collection','《我们在逃亡，洛拉》（暂译）','Andamos huyendo Lola','candidate','1','WCD10-B01-W07','补足加罗 1980 年的短篇集合；不与《彩色的一周》合并。; 暂译，不声明为已核实中文版本名','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0387','work','《人物重逢》（暂译）','Reencuentro de personajes','candidate','1','WCD10-B01-W08','补足 1982 年长篇；不把封底文学比较自动转成作品回应关系。; 暂译，不声明为已核实中文版本名','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0388','work','《河边的房子》（暂译）','La casa junto al río','candidate','1','WCD10-B01-W09','补足 1983 年长篇；不将 1993 再版误作首版。; 暂译，不声明为已核实中文版本名','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0389','collection','《其他探讨》（暂译）','Otras inquisiciones','candidate','1','WCD10-B01-W10','补足作者的随笔谱系，与 1925 年 Inquisiciones 及再版/译本分开；最终语义查重待 Reviewer。; 暂译，不声明为已核实中文版本名','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0376','WCD10-B01-W01','WCD-10-B01','WCD10-B01-W01','V1-ENT-0380','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0377','WCD10-B01-W02','WCD-10-B01','WCD10-B01-W02','V1-ENT-0381','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0378','WCD10-B01-W03','WCD-10-B01','WCD10-B01-W03','V1-ENT-0382','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0379','WCD10-B01-W04','WCD-10-B01','WCD10-B01-W04','V1-ENT-0383','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0380','WCD10-B01-W05','WCD-10-B01','WCD10-B01-W05','V1-ENT-0384','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0381','WCD10-B01-W06','WCD-10-B01','WCD10-B01-W06','V1-ENT-0385','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0382','WCD10-B01-W07','WCD-10-B01','WCD10-B01-W07','V1-ENT-0386','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0383','WCD10-B01-W08','WCD-10-B01','WCD10-B01-W08','V1-ENT-0387','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0384','WCD10-B01-W09','WCD-10-B01','WCD10-B01-W09','V1-ENT-0388','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0385','WCD10-B01-W10','WCD-10-B01','WCD10-B01-W10','V1-ENT-0389','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0262','WCD-10-B01:V1-ENT-0380','V1-ENT-0380','collection','《布宜诺斯艾利斯的激情》（暂译）','豪尔赫·路易斯·博尔赫斯','Fervor de Buenos Aires','阿根廷','es','1923','诗集','WCD-10-B01','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《布宜诺斯艾利斯的激情》（暂译）｜Fervor de Buenos Aires

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1923
- genre_or_form：诗集
- one_sentence_summary：博尔赫斯于 1923 年出版的首部诗集。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0263','WCD-10-B01:V1-ENT-0381','V1-ENT-0381','collection','《世界恶人史》（暂译）','豪尔赫·路易斯·博尔赫斯','Historia universal de la infamia','阿根廷','es','1935','短篇叙事集','WCD-10-B01','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《世界恶人史》（暂译）｜Historia universal de la infamia

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1935
- genre_or_form：短篇叙事集
- story_premise：以不同文化背景中的恶人传记和轶事为素材，改写成一组短篇叙事。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0264','WCD-10-B01:V1-ENT-0382','V1-ENT-0382','collection','《造物者》（暂译）','豪尔赫·路易斯·博尔赫斯','El hacedor','阿根廷','es','1960','诗、短篇与随笔合集','WCD-10-B01','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《造物者》（暂译）｜El hacedor

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1960
- genre_or_form：诗、短篇与随笔合集
- one_sentence_summary：由诗、短篇与随笔组成的文集，收录《博尔赫斯与我》等文本。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0265','WCD-10-B01:V1-ENT-0383','V1-ENT-0383','work','《靠近狂野的心》（暂译）','克拉丽丝·李斯佩克朵','Perto do coração selvagem','巴西','pt','1943','长篇小说','WCD-10-B01','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《靠近狂野的心》（暂译）｜Perto do coração selvagem

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1943
- genre_or_form：长篇小说
- story_premise：围绕乔安娜的内心经验展开，在过去的回忆与当下的感知之间推进叙述。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0266','WCD-10-B01:V1-ENT-0384','V1-ENT-0384','work','《暗处的苹果》（暂译）','克拉丽丝·李斯佩克朵','A maçã no escuro','巴西','pt','1961','长篇小说','WCD-10-B01','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《暗处的苹果》（暂译）｜A maçã no escuro

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1961
- genre_or_form：长篇小说
- story_premise：以第三人称叙述马丁的逃亡：他相信自己犯下了罪行，在恐惧与渴望自由之间徘徊。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0267','WCD-10-B01:V1-ENT-0385','V1-ENT-0385','work','《一种学习，或快乐之书》（暂译）','克拉丽丝·李斯佩克朵','Uma aprendizagem ou o livro dos prazeres','巴西','pt','1969','长篇小说','WCD-10-B01','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《一种学习，或快乐之书》（暂译）｜Uma aprendizagem ou o livro dos prazeres

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1969
- genre_or_form：长篇小说
- story_premise：小学教师洛丽从坎波斯来到里约热内卢，与哲学教师尤利西斯相识，故事围绕两人的亲密关系展开。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0268','WCD-10-B01:V1-ENT-0386','V1-ENT-0386','collection','《我们在逃亡，洛拉》（暂译）','埃莱娜·加罗','Andamos huyendo Lola','墨西哥','es','1980','短篇小说集','WCD-10-B01','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《我们在逃亡，洛拉》（暂译）｜Andamos huyendo Lola

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1980
- genre_or_form：短篇小说集
- one_sentence_summary：加罗于 1980 年由 Joaquín Mortiz 出版的短篇小说集。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0269','WCD-10-B01:V1-ENT-0387','V1-ENT-0387','work','《人物重逢》（暂译）','埃莱娜·加罗','Reencuentro de personajes','墨西哥','es','1982','长篇小说','WCD-10-B01','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《人物重逢》（暂译）｜Reencuentro de personajes

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1982
- genre_or_form：长篇小说
- story_premise：弗兰克与维罗妮卡在欧洲辗转逃亡；他自称认识菲茨杰拉德夫妇，她却怀疑他已成为杀人犯。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0270','WCD-10-B01:V1-ENT-0388','V1-ENT-0388','work','《河边的房子》（暂译）','埃莱娜·加罗','La casa junto al río','墨西哥','es','1983','长篇小说','WCD-10-B01','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《河边的房子》（暂译）｜La casa junto al río

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1983
- genre_or_form：长篇小说
- story_premise：一位女人试图返回童年和过去，却在与周围人物的接触中遭遇敌意。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0271','WCD-10-B01:V1-ENT-0389','V1-ENT-0389','collection','《其他探讨》（暂译）','豪尔赫·路易斯·博尔赫斯','Otras inquisiciones','阿根廷','es','1952','随笔集','WCD-10-B01','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《其他探讨》（暂译）｜Otras inquisiciones

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1952
- genre_or_form：随笔集
- one_sentence_summary：汇集此前在文学期刊发表的随笔，内容涉及文学、语言、历史、宗教与哲学问题。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0272','WCD-10-B01:V1-ENT-0012','V1-ENT-0012','collection','《阿莱夫》','豪尔赫·路易斯·博尔赫斯','El Aleph','阿根廷','es','1949','短篇小说集','WCD-10-B01','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《阿莱夫》｜El Aleph

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1949
- genre_or_form：短篇小说集
- one_sentence_summary：短篇小说集，收录同名短篇、《不朽者》和《艾玛·宗兹》等故事，以不同叙事呈现幻想、人物命运与时间经验。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0273','WCD-10-B01:V1-ENT-0020','V1-ENT-0020','work','《G.H. 受难》','克拉丽丝·李斯佩克朵','A paixão segundo G.H.','巴西','pt','1964','长篇小说','WCD-10-B01','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《G.H. 受难》｜A paixão segundo G.H.

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1964
- genre_or_form：长篇小说
- story_premise：G.H. 以第一人称回忆打扫佣人房间时遇见蟑螂的经历，以及这一遭遇引起的内心震动。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0274','WCD-10-B01:V1-ENT-0026','V1-ENT-0026','work','《生命的气息》','克拉丽丝·李斯佩克朵','Um sopro de vida','巴西','pt','1978','长篇小说','WCD-10-B01','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《生命的气息》｜Um sopro de vida

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1978
- genre_or_form：长篇小说
- story_premise：一位作家叙述者与他笔下的安热拉·普拉利尼相互映照，叙述围绕作者与人物的边界展开。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0275','WCD-10-B01:V1-ENT-0045','V1-ENT-0045','work','《费利佩·安赫莱斯》','埃莱娜·加罗','Felipe Ángeles','墨西哥','es','','戏剧','WCD-10-B01','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《费利佩·安赫莱斯》｜Felipe Ángeles

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_periodical_publication_year：1967
- bibliographic_note：1979 年由墨西哥国立自治大学（UNAM）出版书版。
- genre_or_form：戏剧
- story_premise：戏剧重现费利佩·安赫莱斯将军的军事审判及其被处决前的经历。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0276','WCD-10-B01:V1-ENT-0163','V1-ENT-0163','collection','《布罗迪报告》','豪尔赫·路易斯·博尔赫斯','El informe de Brodie','阿根廷','es','1970','','WCD-10-B01','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《布罗迪报告》｜El informe de Brodie

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1970
- one_sentence_summary：由十一篇故事组成的短篇集，叙述人物之间的对峙、决斗，以及对陌生他者的恐惧与吸引。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0277','WCD-10-B01:V1-ENT-0011','V1-ENT-0011','collection','《虚构集》','豪尔赫·路易斯·博尔赫斯','Ficciones','阿根廷','es','','','WCD-10-B01','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《虚构集》｜Ficciones

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：短篇作品集，收录《死亡与罗盘》《环形废墟》和《特隆、乌克巴尔、奥比斯·特蒂乌斯》等故事，将侦探叙事与幻想叙事并置。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0278','WCD-10-B01:V1-ENT-0166','V1-ENT-0166','collection','《隐秘的幸福》','克拉丽丝·李斯佩克朵','Felicidade clandestina','巴西','pt','','','WCD-10-B01','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《隐秘的幸福》｜Felicidade clandestina

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：短篇集，以阅读、亲吻和日常感知中的细小经历展开不同人物的经验。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0279','WCD-10-B01:V1-ENT-0034','V1-ENT-0034','work','《关于玛丽安娜的证词》','埃莱娜·加罗','Testimonios sobre Mariana','墨西哥','es','','','WCD-10-B01','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《关于玛丽安娜的证词》｜Testimonios sobre Mariana

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。

#### 署名研究说明（research_note_only）

- Patricia Rosas Lopátegui 在《Cuestiones en torno a Testimonios sobre Mariana, de Elena Garro》中以副文本理论对照作家日记与小说片段，讨论生活经验在小说叙述中的转化。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0280','WCD-10-B01:V1-ENT-0162','V1-ENT-0162','collection','《沙之书》','豪尔赫·路易斯·博尔赫斯','El libro de arena','阿根廷','es','','','WCD-10-B01','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《沙之书》｜El libro de arena

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：短篇小说集，收录《另一个人》《乌尔里卡》《大会》和同名短篇等故事，叙述自我相遇、爱情与幻想中的经历。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-1034','WCD10-B01-W01-F01','V1-CARD-0262','V1-ENT-0380','first_publication_year','1923','bibliographic','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1035','WCD10-B01-W01-F02','V1-CARD-0262','V1-ENT-0380','genre_or_form','诗集','bibliographic','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1036','WCD10-B01-W01-F03','V1-CARD-0262','V1-ENT-0380','one_sentence_summary','博尔赫斯于 1923 年出版的首部诗集。','institutional_paraphrase','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1037','WCD10-B01-W02-F01','V1-CARD-0263','V1-ENT-0381','first_publication_year','1935','bibliographic','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1038','WCD10-B01-W02-F02','V1-CARD-0263','V1-ENT-0381','genre_or_form','短篇叙事集','bibliographic','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1039','WCD10-B01-W02-F03','V1-CARD-0263','V1-ENT-0381','story_premise','以不同文化背景中的恶人传记和轶事为素材，改写成一组短篇叙事。','institutional_paraphrase','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1040','WCD10-B01-W03-F01','V1-CARD-0264','V1-ENT-0382','first_publication_year','1960','bibliographic','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1041','WCD10-B01-W03-F02','V1-CARD-0264','V1-ENT-0382','genre_or_form','诗、短篇与随笔合集','bibliographic','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1042','WCD10-B01-W03-F03','V1-CARD-0264','V1-ENT-0382','one_sentence_summary','由诗、短篇与随笔组成的文集，收录《博尔赫斯与我》等文本。','institutional_paraphrase','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1043','WCD10-B01-W04-F01','V1-CARD-0265','V1-ENT-0383','first_publication_year','1943','bibliographic','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1044','WCD10-B01-W04-F02','V1-CARD-0265','V1-ENT-0383','genre_or_form','长篇小说','bibliographic','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1045','WCD10-B01-W04-F03','V1-CARD-0265','V1-ENT-0383','story_premise','围绕乔安娜的内心经验展开，在过去的回忆与当下的感知之间推进叙述。','institutional_paraphrase','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1046','WCD10-B01-W05-F01','V1-CARD-0266','V1-ENT-0384','first_publication_year','1961','bibliographic','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1047','WCD10-B01-W05-F02','V1-CARD-0266','V1-ENT-0384','genre_or_form','长篇小说','bibliographic','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1048','WCD10-B01-W05-F03','V1-CARD-0266','V1-ENT-0384','story_premise','以第三人称叙述马丁的逃亡：他相信自己犯下了罪行，在恐惧与渴望自由之间徘徊。','institutional_paraphrase','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1049','WCD10-B01-W06-F01','V1-CARD-0267','V1-ENT-0385','first_publication_year','1969','bibliographic','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1050','WCD10-B01-W06-F02','V1-CARD-0267','V1-ENT-0385','genre_or_form','长篇小说','bibliographic','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1051','WCD10-B01-W06-F03','V1-CARD-0267','V1-ENT-0385','story_premise','小学教师洛丽从坎波斯来到里约热内卢，与哲学教师尤利西斯相识，故事围绕两人的亲密关系展开。','institutional_paraphrase','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1052','WCD10-B01-W07-F01','V1-CARD-0268','V1-ENT-0386','first_publication_year','1980','bibliographic','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1053','WCD10-B01-W07-F02','V1-CARD-0268','V1-ENT-0386','genre_or_form','短篇小说集','bibliographic','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1054','WCD10-B01-W07-F03','V1-CARD-0268','V1-ENT-0386','one_sentence_summary','加罗于 1980 年由 Joaquín Mortiz 出版的短篇小说集。','institutional_paraphrase','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1055','WCD10-B01-W08-F01','V1-CARD-0269','V1-ENT-0387','first_publication_year','1982','bibliographic','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1056','WCD10-B01-W08-F02','V1-CARD-0269','V1-ENT-0387','genre_or_form','长篇小说','bibliographic','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1057','WCD10-B01-W08-F03','V1-CARD-0269','V1-ENT-0387','story_premise','弗兰克与维罗妮卡在欧洲辗转逃亡；他自称认识菲茨杰拉德夫妇，她却怀疑他已成为杀人犯。','institutional_paraphrase','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1058','WCD10-B01-W09-F01','V1-CARD-0270','V1-ENT-0388','first_publication_year','1983','bibliographic','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1059','WCD10-B01-W09-F02','V1-CARD-0270','V1-ENT-0388','genre_or_form','长篇小说','bibliographic','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1060','WCD10-B01-W09-F03','V1-CARD-0270','V1-ENT-0388','story_premise','一位女人试图返回童年和过去，却在与周围人物的接触中遭遇敌意。','institutional_paraphrase','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1061','WCD10-B01-W10-F01','V1-CARD-0271','V1-ENT-0389','first_publication_year','1952','bibliographic','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1062','WCD10-B01-W10-F02','V1-CARD-0271','V1-ENT-0389','genre_or_form','随笔集','bibliographic','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1063','WCD10-B01-W10-F03','V1-CARD-0271','V1-ENT-0389','one_sentence_summary','汇集此前在文学期刊发表的随笔，内容涉及文学、语言、历史、宗教与哲学问题。','institutional_paraphrase','WCD-10-B01','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1064','WCD10-B01-F01','V1-CARD-0272','V1-ENT-0012','first_publication_year','1949','bibliographic','WCD-10-B01','high','batch_retained_candidate','collection，仅补缺，不影响 1945 年短篇'),
('V1-FCT-1065','WCD10-B01-F14','V1-CARD-0272','V1-ENT-0012','genre_or_form','短篇小说集','bibliographic','WCD-10-B01','high','batch_retained_candidate','collection，不覆盖 V1-ENT-0004 的短篇体裁'),
('V1-FCT-1066','WCD10-B01-F15','V1-CARD-0272','V1-ENT-0012','one_sentence_summary','短篇小说集，收录同名短篇、《不朽者》和《艾玛·宗兹》等故事，以不同叙事呈现幻想、人物命运与时间经验。','institutional_paraphrase','WCD-10-B01','high','batch_retained_candidate','出版者所列故事及题材的集合释义，非作品级主题关系裁决'),
('V1-FCT-1067','WCD10-B01-F02','V1-CARD-0273','V1-ENT-0020','first_publication_year','1964','bibliographic','WCD-10-B01','high','batch_retained_candidate','对象级页面，不取 A maçã 页错年'),
('V1-FCT-1068','WCD10-B01-F03','V1-CARD-0273','V1-ENT-0020','genre_or_form','长篇小说','bibliographic','WCD-10-B01','high','batch_retained_candidate','Romance'),
('V1-FCT-1069','WCD10-B01-F04','V1-CARD-0273','V1-ENT-0020','story_premise','G.H. 以第一人称回忆打扫佣人房间时遇见蟑螂的经历，以及这一遭遇引起的内心震动。','institutional_paraphrase','WCD-10-B01','high','batch_retained_candidate','故事释义，不建立主题或影响关系'),
('V1-FCT-1070','WCD10-B01-F05','V1-CARD-0274','V1-ENT-0026','first_publication_year','1978','bibliographic','WCD-10-B01','high','batch_retained_candidate','身后出版，不取 1974 写作年'),
('V1-FCT-1071','WCD10-B01-F06','V1-CARD-0274','V1-ENT-0026','genre_or_form','长篇小说','bibliographic','WCD-10-B01','high','batch_retained_candidate','机构 Romance 分类；不因此补常规情节评价'),
('V1-FCT-1072','WCD10-B01-F07','V1-CARD-0274','V1-ENT-0026','story_premise','一位作家叙述者与他笔下的安热拉·普拉利尼相互映照，叙述围绕作者与人物的边界展开。','institutional_paraphrase','WCD-10-B01','high','batch_retained_candidate','不将虚构作家当作现实 author'),
('V1-FCT-1073','WCD10-B01-F08','V1-CARD-0275','V1-ENT-0045','first_periodical_publication_year','1967','bibliographic','WCD-10-B01','high','batch_retained_candidate','Coatl 首刊，不与 UNAM 书版合并'),
('V1-FCT-1074','WCD10-B01-F09','V1-CARD-0275','V1-ENT-0045','bibliographic_note','1979 年由墨西哥国立自治大学（UNAM）出版书版。','bibliographic_note','WCD-10-B01','high','batch_retained_candidate','来源不直接确认首个书版；只记录这一次书版，不使用1955写作年或1978演出年替代出版年。'),
('V1-FCT-1075','WCD10-B01-F10','V1-CARD-0275','V1-ENT-0045','genre_or_form','戏剧','bibliographic','WCD-10-B01','high','batch_retained_candidate','Dramaturgia'),
('V1-FCT-1076','WCD10-B01-F11','V1-CARD-0275','V1-ENT-0045','story_premise','戏剧重现费利佩·安赫莱斯将军的军事审判及其被处决前的经历。','institutional_paraphrase','WCD-10-B01','high','batch_retained_candidate','保留题材释义；没有 A 级直接证据，暂不建 BASED_ON_EVENT'),
('V1-FCT-1077','WCD10-B01-F12','V1-CARD-0276','V1-ENT-0163','first_publication_year','1970','bibliographic','WCD-10-B01','high','batch_retained_candidate','补现有 collection，不新增同名短篇'),
('V1-FCT-1078','WCD10-B01-F16','V1-CARD-0276','V1-ENT-0163','one_sentence_summary','由十一篇故事组成的短篇集，叙述人物之间的对峙、决斗，以及对陌生他者的恐惧与吸引。','institutional_paraphrase','WCD-10-B01','high','batch_retained_candidate','collection 内容描述；不把集合各篇都指向同一个主题或现实地点'),
('V1-FCT-1079','WCD10-B01-F13','V1-CARD-0277','V1-ENT-0011','one_sentence_summary','短篇作品集，收录《死亡与罗盘》《环形废墟》和《特隆、乌克巴尔、奥比斯·特蒂乌斯》等故事，将侦探叙事与幻想叙事并置。','institutional_paraphrase','WCD-10-B01','high','batch_retained_candidate','集合层级描述；不把当前再版篇数倒推为 1944 初版目录，不生成主题关系'),
('V1-FCT-1080','WCD10-B01-F17','V1-CARD-0278','V1-ENT-0166','one_sentence_summary','短篇集，以阅读、亲吻和日常感知中的细小经历展开不同人物的经验。','institutional_paraphrase','WCD-10-B01','high','batch_retained_candidate','机构署名介绍中的内容释义；不确定为作者亲身经历，不建立自传关系'),
('V1-FCT-1081','WCD10-B01-F18','V1-CARD-0279','V1-ENT-0034','research_note','Patricia Rosas Lopátegui 在《Cuestiones en torno a Testimonios sobre Mariana, de Elena Garro》中以副文本理论对照作家日记与小说片段，讨论生活经验在小说叙述中的转化。','scholarly_paraphrase','WCD-10-B01','high','research_note_only','明确归属于研究者的作品级解读，不把其自传对应或现实人物评价作为已证事实；不据单源建立解释性关系'),
('V1-FCT-1082','WCD10-B01-F19','V1-CARD-0280','V1-ENT-0162','one_sentence_summary','短篇小说集，收录《另一个人》《乌尔里卡》《大会》和同名短篇等故事，叙述自我相遇、爱情与幻想中的经历。','institutional_paraphrase','WCD-10-B01','high','batch_retained_candidate','collection 内容释义，不把同名短篇的无限书本情节当作整个集合的单一情节；不新建单篇或主题关系');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-1034','SRC-0317','CVC. Borges 100 años. Obras. 1923.'),
('V1-FCT-1035','SRC-0320','Jorge Luis Borges. Biografía'),
('V1-FCT-1036','SRC-0320','Jorge Luis Borges. Biografía'),
('V1-FCT-1037','SRC-0318','CVC. Borges 100 años. Obras. 1935.'),
('V1-FCT-1038','SRC-0320','Jorge Luis Borges. Biografía'),
('V1-FCT-1038','SRC-0321','Historia universal de la infamia - Jorge Luis Borges'),
('V1-FCT-1039','SRC-0321','Historia universal de la infamia - Jorge Luis Borges'),
('V1-FCT-1040','SRC-0319','CVC. Borges 100 años. Obras. 1960.'),
('V1-FCT-1041','SRC-0322','El hacedor / Dreamtigers'),
('V1-FCT-1042','SRC-0322','El hacedor / Dreamtigers'),
('V1-FCT-1043','SRC-0323','Perto do coração selvagem'),
('V1-FCT-1044','SRC-0323','Perto do coração selvagem'),
('V1-FCT-1045','SRC-0323','Perto do coração selvagem'),
('V1-FCT-1046','SRC-0324','A maçã no escuro'),
('V1-FCT-1047','SRC-0324','A maçã no escuro'),
('V1-FCT-1048','SRC-0324','A maçã no escuro'),
('V1-FCT-1049','SRC-0325','Uma aprendizagem ou o livro dos prazeres'),
('V1-FCT-1050','SRC-0325','Uma aprendizagem ou o livro dos prazeres'),
('V1-FCT-1051','SRC-0325','Uma aprendizagem ou o livro dos prazeres'),
('V1-FCT-1052','SRC-0326','Andamos huyendo Lola - Detalle de la obra'),
('V1-FCT-1053','SRC-0326','Andamos huyendo Lola - Detalle de la obra'),
('V1-FCT-1054','SRC-0326','Andamos huyendo Lola - Detalle de la obra'),
('V1-FCT-1055','SRC-0327','Reencuentro de personajes - Detalle de la obra'),
('V1-FCT-1056','SRC-0327','Reencuentro de personajes - Detalle de la obra'),
('V1-FCT-1057','SRC-0327','Reencuentro de personajes - Detalle de la obra'),
('V1-FCT-1058','SRC-0328','La casa junto al río - Detalle de la obra'),
('V1-FCT-1059','SRC-0328','La casa junto al río - Detalle de la obra'),
('V1-FCT-1060','SRC-0328','La casa junto al río - Detalle de la obra'),
('V1-FCT-1061','SRC-0339','CVC. Borges 100 años. Obras. 1952.'),
('V1-FCT-1061','SRC-0340','Collection Highlight: Borges'' Otras inquisiciones (1952)'),
('V1-FCT-1062','SRC-0340','Collection Highlight: Borges'' Otras inquisiciones (1952)'),
('V1-FCT-1063','SRC-0340','Collection Highlight: Borges'' Otras inquisiciones (1952)'),
('V1-FCT-1064','SRC-0329','CVC. Borges 100 años. Obras. 1949.'),
('V1-FCT-1065','SRC-0336','El Aleph'),
('V1-FCT-1066','SRC-0336','El Aleph'),
('V1-FCT-1067','SRC-0330','A paixão segundo G.H.'),
('V1-FCT-1068','SRC-0330','A paixão segundo G.H.'),
('V1-FCT-1069','SRC-0330','A paixão segundo G.H.'),
('V1-FCT-1070','SRC-0331','Um sopro de vida'),
('V1-FCT-1071','SRC-0331','Um sopro de vida'),
('V1-FCT-1072','SRC-0331','Um sopro de vida'),
('V1-FCT-1073','SRC-0332','Felipe Ángeles - Detalle de la obra'),
('V1-FCT-1074','SRC-0332','Felipe Ángeles - Detalle de la obra'),
('V1-FCT-1075','SRC-0332','Felipe Ángeles - Detalle de la obra'),
('V1-FCT-1076','SRC-0332','Felipe Ángeles - Detalle de la obra'),
('V1-FCT-1077','SRC-0333','CVC. Borges 100 años. Cronología. 1970.'),
('V1-FCT-1078','SRC-0337','El informe Brodie'),
('V1-FCT-1079','SRC-0335','Ficciones'),
('V1-FCT-1080','SRC-0334','Felicidade clandestina'),
('V1-FCT-1081','SRC-0338','Cuestiones en torno a Testimonios sobre Mariana, de Elena Garro'),
('V1-FCT-1082','SRC-0341','El libro de arena');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0262','V1-FCT-1034','batch_retained_candidate'),
('V1-CARD-0262','V1-FCT-1035','batch_retained_candidate'),
('V1-CARD-0262','V1-FCT-1036','batch_retained_candidate'),
('V1-CARD-0263','V1-FCT-1037','batch_retained_candidate'),
('V1-CARD-0263','V1-FCT-1038','batch_retained_candidate'),
('V1-CARD-0263','V1-FCT-1039','batch_retained_candidate'),
('V1-CARD-0264','V1-FCT-1040','batch_retained_candidate'),
('V1-CARD-0264','V1-FCT-1041','batch_retained_candidate'),
('V1-CARD-0264','V1-FCT-1042','batch_retained_candidate'),
('V1-CARD-0265','V1-FCT-1043','batch_retained_candidate'),
('V1-CARD-0265','V1-FCT-1044','batch_retained_candidate'),
('V1-CARD-0265','V1-FCT-1045','batch_retained_candidate'),
('V1-CARD-0266','V1-FCT-1046','batch_retained_candidate'),
('V1-CARD-0266','V1-FCT-1047','batch_retained_candidate'),
('V1-CARD-0266','V1-FCT-1048','batch_retained_candidate'),
('V1-CARD-0267','V1-FCT-1049','batch_retained_candidate'),
('V1-CARD-0267','V1-FCT-1050','batch_retained_candidate'),
('V1-CARD-0267','V1-FCT-1051','batch_retained_candidate'),
('V1-CARD-0268','V1-FCT-1052','batch_retained_candidate'),
('V1-CARD-0268','V1-FCT-1053','batch_retained_candidate'),
('V1-CARD-0268','V1-FCT-1054','batch_retained_candidate'),
('V1-CARD-0269','V1-FCT-1055','batch_retained_candidate'),
('V1-CARD-0269','V1-FCT-1056','batch_retained_candidate'),
('V1-CARD-0269','V1-FCT-1057','batch_retained_candidate'),
('V1-CARD-0270','V1-FCT-1058','batch_retained_candidate'),
('V1-CARD-0270','V1-FCT-1059','batch_retained_candidate'),
('V1-CARD-0270','V1-FCT-1060','batch_retained_candidate'),
('V1-CARD-0271','V1-FCT-1061','batch_retained_candidate'),
('V1-CARD-0271','V1-FCT-1062','batch_retained_candidate'),
('V1-CARD-0271','V1-FCT-1063','batch_retained_candidate'),
('V1-CARD-0272','V1-FCT-1064','batch_retained_candidate'),
('V1-CARD-0272','V1-FCT-1065','batch_retained_candidate'),
('V1-CARD-0272','V1-FCT-1066','batch_retained_candidate'),
('V1-CARD-0273','V1-FCT-1067','batch_retained_candidate'),
('V1-CARD-0273','V1-FCT-1068','batch_retained_candidate'),
('V1-CARD-0273','V1-FCT-1069','batch_retained_candidate'),
('V1-CARD-0274','V1-FCT-1070','batch_retained_candidate'),
('V1-CARD-0274','V1-FCT-1071','batch_retained_candidate'),
('V1-CARD-0274','V1-FCT-1072','batch_retained_candidate'),
('V1-CARD-0275','V1-FCT-1073','batch_retained_candidate'),
('V1-CARD-0275','V1-FCT-1074','batch_retained_candidate'),
('V1-CARD-0275','V1-FCT-1075','batch_retained_candidate'),
('V1-CARD-0275','V1-FCT-1076','batch_retained_candidate'),
('V1-CARD-0276','V1-FCT-1077','batch_retained_candidate'),
('V1-CARD-0276','V1-FCT-1078','batch_retained_candidate'),
('V1-CARD-0277','V1-FCT-1079','batch_retained_candidate'),
('V1-CARD-0278','V1-FCT-1080','batch_retained_candidate'),
('V1-CARD-0279','V1-FCT-1081','research_note_only'),
('V1-CARD-0280','V1-FCT-1082','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0537','WCD10-B01-S01','V1-CARD-0262','SRC-0317','B','bibliography_or_bounded_description','yes','no','SRC-0296','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0538','WCD10-B01-S04','V1-CARD-0262','SRC-0320','B','bibliography_or_bounded_description','yes','no','SRC-0320','accepted','NONE'),
('V1-CS-0539','WCD10-B01-S02','V1-CARD-0263','SRC-0318','B','bibliography_or_bounded_description','yes','no','SRC-0296','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0540','WCD10-B01-S04','V1-CARD-0263','SRC-0320','B','bibliography_or_bounded_description','yes','no','SRC-0320','accepted','NONE'),
('V1-CS-0541','WCD10-B01-S05','V1-CARD-0263','SRC-0321','B','bibliography_or_bounded_description','yes','no','SRC-0321','accepted','NONE'),
('V1-CS-0542','WCD10-B01-S03','V1-CARD-0264','SRC-0319','B','bibliography_or_bounded_description','yes','no','SRC-0296','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0543','WCD10-B01-S06','V1-CARD-0264','SRC-0322','B','bibliography_or_bounded_description','yes','no','SRC-0322','accepted','NONE'),
('V1-CS-0544','WCD10-B01-S07','V1-CARD-0265','SRC-0323','B','bibliography_or_bounded_description','yes','no','SRC-0009','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0545','WCD10-B01-S08','V1-CARD-0266','SRC-0324','B','bibliography_or_bounded_description','yes','no','SRC-0009','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0546','WCD10-B01-S09','V1-CARD-0267','SRC-0325','B','bibliography_or_bounded_description','yes','no','SRC-0009','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0547','WCD10-B01-S10','V1-CARD-0268','SRC-0326','B','bibliography_or_bounded_description','yes','no','SRC-0326','accepted','NONE'),
('V1-CS-0548','WCD10-B01-S11','V1-CARD-0269','SRC-0327','B','bibliography_or_bounded_description','yes','no','SRC-0327','accepted','NONE'),
('V1-CS-0549','WCD10-B01-S12','V1-CARD-0270','SRC-0328','B','bibliography_or_bounded_description','yes','no','SRC-0328','accepted','NONE'),
('V1-CS-0550','WCD10-B01-S25','V1-CARD-0271','SRC-0339','B','bibliography_or_bounded_description','yes','no','SRC-0296','accepted','NONE'),
('V1-CS-0551','WCD10-B01-S26','V1-CARD-0271','SRC-0340','B','bibliography_or_bounded_description','yes','no','SRC-0340','accepted','NONE'),
('V1-CS-0552','WCD10-B01-S13','V1-CARD-0272','SRC-0329','B','bibliography_or_bounded_description','yes','no','SRC-0296','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0553','WCD10-B01-S22','V1-CARD-0272','SRC-0336','B','bibliography_or_bounded_description','yes','no','SRC-0336','accepted','NONE'),
('V1-CS-0554','WCD10-B01-S14','V1-CARD-0273','SRC-0330','B','bibliography_or_bounded_description','yes','no','SRC-0009','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0555','WCD10-B01-S15','V1-CARD-0274','SRC-0331','B','bibliography_or_bounded_description','yes','no','SRC-0009','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0556','WCD10-B01-S16','V1-CARD-0275','SRC-0332','B','bibliography_or_bounded_description','yes','no','SRC-0332','accepted','NONE'),
('V1-CS-0557','WCD10-B01-S17','V1-CARD-0276','SRC-0333','B','bibliography_or_bounded_description','yes','no','SRC-0296','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0558','WCD10-B01-S23','V1-CARD-0276','SRC-0337','B','bibliography_or_bounded_description','no','no','SRC-0337','accepted','NONE'),
('V1-CS-0559','WCD10-B01-S21','V1-CARD-0277','SRC-0335','B','bibliography_or_bounded_description','no','no','SRC-0335','accepted','NONE'),
('V1-CS-0560','WCD10-B01-S18','V1-CARD-0278','SRC-0334','B','bibliography_or_bounded_description','no','no','SRC-0009','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0561','WCD10-B01-S24','V1-CARD-0279','SRC-0338','A','attributed_study','no','yes','SRC-0338','accepted','NONE'),
('V1-CS-0562','WCD10-B01-S27','V1-CARD-0280','SRC-0341','B','bibliography_or_bounded_description','no','no','SRC-0103','accepted','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0337','WCD-10-B01','WCD10-B01-W01-CREATED','V1-ENT-0002','CREATED','V1-ENT-0380','豪尔赫·路易斯·博尔赫斯创作 Fervor de Buenos Aires','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0338','WCD-10-B01','WCD10-B01-W02-CREATED','V1-ENT-0002','CREATED','V1-ENT-0381','豪尔赫·路易斯·博尔赫斯创作 Historia universal de la infamia','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0339','WCD-10-B01','WCD10-B01-W03-CREATED','V1-ENT-0002','CREATED','V1-ENT-0382','豪尔赫·路易斯·博尔赫斯创作 El hacedor','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0340','WCD-10-B01','WCD10-B01-W04-CREATED','V1-ENT-0016','CREATED','V1-ENT-0383','克拉丽丝·李斯佩克朵创作 Perto do coração selvagem','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0341','WCD-10-B01','WCD10-B01-W05-CREATED','V1-ENT-0016','CREATED','V1-ENT-0384','克拉丽丝·李斯佩克朵创作 A maçã no escuro','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0342','WCD-10-B01','WCD10-B01-W06-CREATED','V1-ENT-0016','CREATED','V1-ENT-0385','克拉丽丝·李斯佩克朵创作 Uma aprendizagem ou o livro dos prazeres','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0343','WCD-10-B01','WCD10-B01-W07-CREATED','V1-ENT-0029','CREATED','V1-ENT-0386','埃莱娜·加罗创作 Andamos huyendo Lola','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0344','WCD-10-B01','WCD10-B01-W08-CREATED','V1-ENT-0029','CREATED','V1-ENT-0387','埃莱娜·加罗创作 Reencuentro de personajes','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0345','WCD-10-B01','WCD10-B01-W09-CREATED','V1-ENT-0029','CREATED','V1-ENT-0388','埃莱娜·加罗创作 La casa junto al río','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0346','WCD-10-B01','WCD10-B01-W10-CREATED','V1-ENT-0002','CREATED','V1-ENT-0389','豪尔赫·路易斯·博尔赫斯创作 Otras inquisiciones','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0347','WCD-10-B01','WCD10-B01-R01','V1-ENT-0385','SET_IN','V1-ENT-0022','故事中洛丽来到里约热内卢生活和任教，并与尤利西斯相识。','high','accepted','wcd10_b01_review:PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0337','SRC-0317'),
('V1-REL-0338','SRC-0318'),
('V1-REL-0339','SRC-0319'),
('V1-REL-0340','SRC-0323'),
('V1-REL-0341','SRC-0324'),
('V1-REL-0342','SRC-0325'),
('V1-REL-0343','SRC-0326'),
('V1-REL-0344','SRC-0327'),
('V1-REL-0345','SRC-0328'),
('V1-REL-0346','SRC-0339'),
('V1-REL-0347','SRC-0325');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0380','V1-REL-0337','WCD10-B01-S01','SRC-0317','CVC. Borges 100 años. Obras. 1923.','Obras de Borges, 1923; Fervor de Buenos Aires entry','豪尔赫·路易斯·博尔赫斯创作 Fervor de Buenos Aires','high','eligible_evidence','WCD-10-B01'),
('V1-EV-0381','V1-REL-0338','WCD10-B01-S02','SRC-0318','CVC. Borges 100 años. Obras. 1935.','Historia universal de la infamia entry','豪尔赫·路易斯·博尔赫斯创作 Historia universal de la infamia','high','eligible_evidence','WCD-10-B01'),
('V1-EV-0382','V1-REL-0339','WCD10-B01-S03','SRC-0319','CVC. Borges 100 años. Obras. 1960.','El hacedor, Emecé, 1960 entry','豪尔赫·路易斯·博尔赫斯创作 El hacedor','high','eligible_evidence','WCD-10-B01'),
('V1-EV-0383','V1-REL-0340','WCD10-B01-S07','SRC-0323','Perto do coração selvagem','Romance / 1943; Joana paragraph','克拉丽丝·李斯佩克朵创作 Perto do coração selvagem','high','eligible_evidence','WCD-10-B01'),
('V1-EV-0384','V1-REL-0341','WCD10-B01-S08','SRC-0324','A maçã no escuro','Romance / 1961; Martim paragraph','克拉丽丝·李斯佩克朵创作 A maçã no escuro','high','eligible_evidence','WCD-10-B01'),
('V1-EV-0385','V1-REL-0342','WCD10-B01-S09','SRC-0325','Uma aprendizagem ou o livro dos prazeres','Romance / 1969; opening Loreley paragraph','克拉丽丝·李斯佩克朵创作 Uma aprendizagem ou o livro dos prazeres','high','eligible_evidence','WCD-10-B01'),
('V1-EV-0386','V1-REL-0343','WCD10-B01-S10','SRC-0326','Andamos huyendo Lola - Detalle de la obra','PRIMERA EDICIÓN; CONTRAPORTADA 1980','埃莱娜·加罗创作 Andamos huyendo Lola','high','eligible_evidence','WCD-10-B01'),
('V1-EV-0387','V1-REL-0344','WCD10-B01-S11','SRC-0327','Reencuentro de personajes - Detalle de la obra','PRIMERA EDICIÓN; CONTRAPORTADA 2019','埃莱娜·加罗创作 Reencuentro de personajes','high','eligible_evidence','WCD-10-B01'),
('V1-EV-0388','V1-REL-0345','WCD10-B01-S12','SRC-0328','La casa junto al río - Detalle de la obra','PRIMERA EDICIÓN; CONTRAPORTADA 1993','埃莱娜·加罗创作 La casa junto al río','high','eligible_evidence','WCD-10-B01'),
('V1-EV-0389','V1-REL-0346','WCD10-B01-S25','SRC-0339','CVC. Borges 100 años. Obras. 1952.','Otras inquisiciones, Buenos Aires, Sur, 1952','豪尔赫·路易斯·博尔赫斯创作 Otras inquisiciones','high','eligible_evidence','WCD-10-B01'),
('V1-EV-0390','V1-REL-0347','WCD10-B01-S09','SRC-0325','Uma aprendizagem ou o livro dos prazeres','Romance / 1969; opening Loreley paragraph','故事中洛丽来到里约热内卢生活和任教，并与尤利西斯相识。','high','eligible_evidence','WCD-10-B01');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0025','WCD-10-B01-G01','research_gap','first_book_edition_year: Felipe Ángeles','open','撤回原 F09 的首个书版限定；1979 UNAM书版有证据，但首书版尚未直接核定。','','Independent Reviewer: preserve hold_first_book_edition_not_proven','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0026','WCD-10-B01-G02','research_gap','Un hogar sólido','open','ELEM 并置 1957 同名独幕剧和 1958 书目；UV 页面明确为 1983 扩充剧集。不可把 1983 收录目录倒推 1958，也不可将独幕剧/剧集/版本合并。需补 1958 目录或实体层级证据。','','Independent Reviewer: preserve hold_object_layer_and_edition_scope','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0027','WCD-10-B01-G03','research_gap','RESPONDS_TO_WORK: Reencuentro de personajes','open','出版者封底仅提示菲茨杰拉德/沃的文学人物，未确认具体作品端点及双独立解释证据。','','Independent Reviewer: preserve hold_needs_second_source_and_endpoints','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0028','WCD-10-B01-G04','research_gap','BASED_ON_EVENT: Felipe Ángeles','open','B 级机构介绍足以支持有归属的题材释义，不满足 A 级事件关系门槛。','','Independent Reviewer: preserve hold_needs_A_direct_source_and_event_endpoint','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0029','WCD-10-B01-G05','research_gap','Chinese display names for new works','open','保留原文名为规范化依据；未核对中文译本的标题明确暂译，不新增 edition。','','Independent Reviewer: preserve provisional_translation_only','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0030','WCD-10-B01:V1-ENT-0011','research_gap','WCD10:work_level_research:V1-ENT-0011','open','合集级独立学术研究OPEN；当代再版篇数不倒推1944初版。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0031','WCD-10-B01:V1-ENT-0012','research_gap','WCD10:work_level_research:V1-ENT-0012','open','合集级学术研究OPEN；同名短篇研究不能替代。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0032','WCD-10-B01:V1-ENT-0162','research_gap','WCD10:work_level_research:V1-ENT-0162','open','El libro de arena合集级A级研究OPEN，不下推同名单篇情节或场景。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0033','WCD-10-B01:V1-ENT-0163','research_gap','WCD10:work_level_research:V1-ENT-0163','open','合集级学术研究OPEN，1986合订书目不作1970首版依据。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0034','WCD-10-B01:V1-ENT-0020','research_gap','WCD10:work_level_research:V1-ENT-0020','open','新增专门作品介绍为B级；既有作者简介不是独立第二研究，学术研究OPEN。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0035','WCD-10-B01:V1-ENT-0026','research_gap','WCD10:work_level_research:V1-ENT-0026','open','身后出版与虚构叙述者边界已审；独立学术研究OPEN。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0036','WCD-10-B01:V1-ENT-0166','research_gap','WCD10:work_level_research:V1-ENT-0166','open','合集级学术研究OPEN；不作作者自传确定性声明。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0037','WCD-10-B01:V1-ENT-0033','research_gap','WCD10:work_level_research:V1-ENT-0033','open','La semana de colores作品集级A级研究OPEN；不把单篇或会议活动页当作合集研究。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0038','WCD-10-B01:V1-ENT-0045','research_gap','WCD10:work_level_research:V1-ENT-0045','open','首书版、A级事件关系证据及事件端点仍hold；独立学术研究OPEN。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0039','WCD-10-B01:WCD10-B01-W01','research_gap','WCD10:work_level_research:V1-ENT-0380','open','诗集对象级学术研究OPEN；首部诗集概述不冒充主题研究。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0040','WCD-10-B01:WCD10-B01-W02','research_gap','WCD10:work_level_research:V1-ENT-0381','open','集合对象级学术研究OPEN；出版者简介不形成解释性关系。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0041','WCD-10-B01:WCD10-B01-W03','research_gap','WCD10:work_level_research:V1-ENT-0382','open','复合合集对象级学术研究OPEN；不拆无证据子实体。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0042','WCD-10-B01:WCD10-B01-W04','research_gap','WCD10:work_level_research:V1-ENT-0383','open','机构署名作品介绍，不伪称同行评議；独立学术研究OPEN。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0043','WCD-10-B01:WCD10-B01-W05','research_gap','WCD10:work_level_research:V1-ENT-0384','open','源站旁支G.H.错年排除；独立学术研究OPEN。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0044','WCD-10-B01:WCD10-B01-W06','research_gap','WCD10:work_level_research:V1-ENT-0385','open','直接SET_IN可准入，亲密关系解释不升级主题；独立学术研究OPEN。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0045','WCD-10-B01:WCD10-B01-W07','research_gap','WCD10:work_level_research:V1-ENT-0386','open','1980合集对象级学术研究OPEN；封底不作ELEM独立学术结论。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0046','WCD-10-B01:WCD10-B01-W08','research_gap','WCD10:work_level_research:V1-ENT-0387','open','独立学术研究及回应作品的双源/端点OPEN。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0047','WCD-10-B01:WCD10-B01-W09','research_gap','WCD10:work_level_research:V1-ENT-0388','open','独立学术研究OPEN；1993版封底不冒充1983初版目录。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0048','WCD-10-B01:WCD10-B01-W10','research_gap','WCD10:work_level_research:V1-ENT-0389','open','馆藏随笔介绍为B级；合集级学术研究OPEN，不混1925同类题名作品。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');

UPDATE metadata SET value='WCD-10-B01' WHERE key='last_change_set';

UPDATE metadata SET value='2026-09-28' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 339 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 387 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 385 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 280 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1076 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 1132 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1055 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 554 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 345 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 419 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 390 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 48 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
