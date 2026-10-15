-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: Codex-parent-independent-review

-- Registration sha256: 97ab3e5fbf1b10ad5510f0e41d324cad2c411cccf91958dd128b98309326ed47

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2547 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1524 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 777 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 764 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 762 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 3184 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2568 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 633 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 53 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 1111 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 1140 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 736 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 768 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B18' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0771' OR canonical_url='https://www.planetadelibros.com.mx/autor/reinaldo-arenas/000028899') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0772' OR canonical_url='https://www.planetadelibros.com/libro-el-color-del-verano/88440') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0773' OR canonical_url='https://www.planetadelibros.com/libro-el-portero/88609') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0774' OR canonical_url='https://www.planetadelibros.com/libro-el-palacio-de-las-blanquisimas-mofetas/88511') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0775' OR canonical_url='https://proapi.planetadelibros.com/descargas/sala-prensa-libro/sinopsis-y-biografia/291793/otra-vez-el-mar.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0776' OR canonical_url='https://proapi.planetadelibros.com/descargas/sala-prensa-libro/sinopsis-y-biografia/88580/el-asalto.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0777' OR canonical_url='https://proapi.planetadelibros.com/descargas/sala-prensa-libro/sinopsis-y-biografia/88421/diario-de-un-killer-sentimental-seguido-de-yacare.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0778' OR canonical_url='https://proapi.planetadelibros.com/descargas/sala-prensa-libro/sinopsis-y-biografia/91361/desencuentros.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0779' OR canonical_url='https://www.planetadelibros.com/libro-nombre-de-torero/88303') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0780' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/el-huesped/9788433944481/NH_390') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0781' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/el-cuerpo-en-que-naci/9788433933201/NH_491') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0782' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/despues-del-invierno/9788433932723/NH_539') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0783' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/los-divagantes/9788433908186/NH_719') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0767' OR (entity_type='work' AND original_name='El palacio de las blanquísimas mofetas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0768' OR (entity_type='work' AND original_name='Otra vez el mar')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0769' OR (entity_type='work' AND original_name='El color del verano')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0770' OR (entity_type='work' AND original_name='El asalto')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0771' OR (entity_type='work' AND original_name='El portero')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0772' OR (entity_type='work' AND original_name='Nombre de torero')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0773' OR (entity_type='work' AND original_name='Patagonia Express')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0774' OR (entity_type='collection' AND original_name='Desencuentros')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0775' OR (entity_type='collection' AND original_name='Diario de un killer sentimental seguido de Yacaré')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0776' OR (entity_type='work' AND original_name='El huésped')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0777' OR (entity_type='work' AND original_name='El cuerpo en que nací')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0778' OR (entity_type='work' AND original_name='Después del invierno')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0779' OR (entity_type='collection' AND original_name='Los divagantes')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2575' OR (subject_id='V1-ENT-0767' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2576' OR (subject_id='V1-ENT-0767' AND fact_field='one_sentence_summary' AND value_text='Tusquets简介称，本书以具有个人色彩的方式回顾作者自身经历与古巴历史。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2577' OR (subject_id='V1-ENT-0767' AND fact_field='bibliographic_note' AND value_text='Tusquets作者目录列出本书为pentagonía系列成员，但未在该目录段提供首版年份；本候选仅记录出版者书目列示，不推定首版年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2578' OR (subject_id='V1-ENT-0768' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2579' OR (subject_id='V1-ENT-0768' AND fact_field='bibliographic_note' AND value_text='Tusquets新闻资料称本页版本采用作者修订的1982年文本；出版社作者目录也列出本书。现有直接来源未能确定作品原始首版年份，因此first_publication_year留空。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2580' OR (subject_id='V1-ENT-0768' AND fact_field='one_sentence_summary' AND value_text='Tusquets资料介绍一对年轻夫妻在度假地的故事，并以妻子和丈夫Héctor的双重叙述呈现两人的挫折与对自由的渴望。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2581' OR (subject_id='V1-ENT-0769' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2582' OR (subject_id='V1-ENT-0769' AND fact_field='one_sentence_summary' AND value_text='Tusquets简介写到古巴为统治者在位五十周年举行狂欢庆典，并呈现庆典背后的青年地下生活及岛上的压迫处境。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2583' OR (subject_id='V1-ENT-0769' AND fact_field='bibliographic_note' AND value_text='出版者页面列出的1999年Tusquets版仅作为版本年份记录；未把它推定为作品首版年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2584' OR (subject_id='V1-ENT-0770' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2585' OR (subject_id='V1-ENT-0770' AND fact_field='one_sentence_summary' AND value_text='Tusquets简介中的叙述者身处严密控制的国家，借加入秘密行动机构寻找母亲并实施个人复仇。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2586' OR (subject_id='V1-ENT-0770' AND fact_field='bibliographic_note' AND value_text='Tusquets作者目录列出本书为pentagonía系列成员，但未在该目录段提供首版年份；本候选仅记录出版者书目列示，不推定首版年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2587' OR (subject_id='V1-ENT-0771' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2588' OR (subject_id='V1-ENT-0771' AND fact_field='one_sentence_summary' AND value_text='小说描写纽约大楼中的微观社会，并以一名古巴流亡门卫的观察展开；出版者称作品写于1984至1986年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2589' OR (subject_id='V1-ENT-0771' AND fact_field='bibliographic_note' AND value_text='Tusquets产品页列2004年版；此为所见版本年份，未作为首版年份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2590' OR (subject_id='V1-ENT-0772' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2591' OR (subject_id='V1-ENT-0772' AND fact_field='bibliographic_note' AND value_text='Memoria Chilena列Nombre de torero为Barcelona: Tusquets, 1994；PlanetadeLibros技术资料标注出版日期1994-10-01。此处保留来源所载书目/版本年份，不宣称已核定作者首版年份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2592' OR (subject_id='V1-ENT-0772' AND fact_field='one_sentence_summary' AND value_text='金币失窃近五十年后，柏林墙已经倒塌；Juan Belmonte与Frank Galinsky分别受雇追寻金币。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2593' OR (subject_id='V1-ENT-0773' AND fact_field='genre_or_form' AND value_text='旅行叙事')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2594' OR (subject_id='V1-ENT-0773' AND fact_field='bibliographic_note' AND value_text='BND文章将Patagonia Express列为1995年作品；Memoria Chilena列Barcelona: Tusquets, 1995。该年份按来源所列书目信息保留，不断言首版年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2595' OR (subject_id='V1-ENT-0773' AND fact_field='one_sentence_summary' AND value_text='这部旅行叙事围绕作者在智利和阿根廷南部经历的空间与冒险，并兼及发生在厄瓜多尔的故事展开。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2596' OR (subject_id='V1-ENT-0774' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2597' OR (subject_id='V1-ENT-0774' AND fact_field='bibliographic_note' AND value_text='BND文章将Desencuentros列为1997年故事集；该年份按来源所载书目信息保留，不断言首版年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2598' OR (subject_id='V1-ENT-0774' AND fact_field='one_sentence_summary' AND value_text='Tusquets材料称本书汇集作者偏爱的旧作及未刊故事，共二十七篇，围绕愿望、情感与命运的错位展开。中文为检索译名，不声称正式中译本。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2599' OR (subject_id='V1-ENT-0775' AND fact_field='genre_or_form' AND value_text='两部中篇小说合集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2600' OR (subject_id='V1-ENT-0775' AND fact_field='bibliographic_note' AND value_text='出版社资料注明Tusquets版于1998-06-01出版；BND文章亦列Diario…及Yacaré为1998年作品。本轮保留版本说明，不把合辑出版年原子化为两篇各自的首版年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2601' OR (subject_id='V1-ENT-0775' AND fact_field='one_sentence_summary' AND value_text='Tusquets称本册收入两部中篇小说：一篇写职业杀手因恋爱而违背行规；另一篇写保险调查员从苏黎世转往米兰，深入巴西南部 anaré 与 yacaré 的世界。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2602' OR (subject_id='V1-ENT-0776' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2603' OR (subject_id='V1-ENT-0776' AND fact_field='bibliographic_note' AND value_text='Anagrama产品页PUBLICACIÓN日期为2006-01-01；本值仅记录该页面所示版本日期，不宣称首版年份。首版年原子值留空。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2604' OR (subject_id='V1-ENT-0776' AND fact_field='one_sentence_summary' AND value_text='出版社将其称为内特尔的第一部小说：少女安娜与一个或许只是想象的“寄居者”抗衡，叙事延伸至成年后的失明经验与墨西哥城地下世界。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2605' OR (subject_id='V1-ENT-0777' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2606' OR (subject_id='V1-ENT-0777' AND fact_field='bibliographic_note' AND value_text='Anagrama产品页PUBLICACIÓN日期为2011-10-01；本值仅记录该页面所示版本日期，不宣称首版年份。首版年原子值留空。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2607' OR (subject_id='V1-ENT-0777' AND fact_field='one_sentence_summary' AND value_text='出版社简介称小说受作者童年启发，围绕一名眼部先天缺陷女孩的成长、家庭与自我接纳展开，并以咨询室独白框架回忆往事。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2608' OR (subject_id='V1-ENT-0778' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2609' OR (subject_id='V1-ENT-0778' AND fact_field='bibliographic_note' AND value_text='Anagrama产品页PUBLICACIÓN日期为2014-11-19；本值仅记录该页面所示版本日期，不宣称首版年份。首版年原子值留空。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2610' OR (subject_id='V1-ENT-0778' AND fact_field='one_sentence_summary' AND value_text='出版社简介交织古巴裔Claudio与墨西哥裔Cecilia在纽约、巴黎的生活，写两人的亲密关系、孤独与各自的过往。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2611' OR (subject_id='V1-ENT-0779' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2612' OR (subject_id='V1-ENT-0779' AND fact_field='bibliographic_note' AND value_text='Anagrama产品页PUBLICACIÓN日期为2023-09-06；本值仅记录该页面所示版本日期，不宣称首版年份。首版年原子值留空。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2613' OR (subject_id='V1-ENT-0779' AND fact_field='one_sentence_summary' AND value_text='出版社称本书收录八篇故事，人物因意外离开惯常生活，在现实与幻想之间遭遇陌生处境，并面对成功与失败的执念。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2614' OR (subject_id='V1-ENT-0350' AND fact_field='one_sentence_summary' AND value_text='出版社简介以三名女性及不同的母职经验为线索，涉及Alina在孕晚期被告知女儿出生后可能无法存活、夫妻由此经历预期丧失与哀悼，以及邻居单亲母子面对的处境。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2615' OR (subject_id='V1-ENT-0351' AND fact_field='one_sentence_summary' AND value_text='出版社称本集包含五篇叙事，以动物与人的世界交错书写伴侣关系、母职、青春期危机及亲密关系中的隐秘面向。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2616' OR (subject_id='V1-ENT-0352' AND fact_field='one_sentence_summary' AND value_text='出版社将其描述为六篇“令人不安的故事”，人物各有隐秘癖好或异于常态的生活方式，写被日常表象遮住的异质经验。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0739' OR (subject_id='V1-ENT-0334' AND relation_type='CREATED' AND object_id='V1-ENT-0767')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0740' OR (subject_id='V1-ENT-0334' AND relation_type='CREATED' AND object_id='V1-ENT-0768')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0741' OR (subject_id='V1-ENT-0334' AND relation_type='CREATED' AND object_id='V1-ENT-0769')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0742' OR (subject_id='V1-ENT-0334' AND relation_type='CREATED' AND object_id='V1-ENT-0770')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0743' OR (subject_id='V1-ENT-0334' AND relation_type='CREATED' AND object_id='V1-ENT-0771')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0744' OR (subject_id='V1-ENT-0344' AND relation_type='CREATED' AND object_id='V1-ENT-0772')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0745' OR (subject_id='V1-ENT-0344' AND relation_type='CREATED' AND object_id='V1-ENT-0773')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0746' OR (subject_id='V1-ENT-0344' AND relation_type='CREATED' AND object_id='V1-ENT-0774')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0747' OR (subject_id='V1-ENT-0344' AND relation_type='CREATED' AND object_id='V1-ENT-0775')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0748' OR (subject_id='V1-ENT-0345' AND relation_type='CREATED' AND object_id='V1-ENT-0776')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0749' OR (subject_id='V1-ENT-0345' AND relation_type='CREATED' AND object_id='V1-ENT-0777')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0750' OR (subject_id='V1-ENT-0345' AND relation_type='CREATED' AND object_id='V1-ENT-0778')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0751' OR (subject_id='V1-ENT-0345' AND relation_type='CREATED' AND object_id='V1-ENT-0779')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0771','WCD10-B19-S001','Reinaldo Arenas | PlanetadeLibros','Reinaldo Arenas | PlanetadeLibros','Tusquets Editores / Grupo Planeta','','Editorial Planeta','','','web_page','','es','B','access_pass','WCD-10-B19','Research候选；未经独立审核不得自动进入Curation或公开层，仅供普通书目、体裁和有界简介。；仅候选Research元数据和有限释义；未经独立审核不进入Curation或公开层。；仅候选Research内容；未经独立审核不自动进入Curation或公开层。','remote_only；未下载或保存网页、电子书、PDF或图像。；remote_only；未下载或保存来源文件。；remote_only；未下载或本地保存来源网页/作品文件。','','https://www.planetadelibros.com.mx/autor/reinaldo-arenas/000028899'),
('SRC-0772','WCD10-B19-S002','El color del verano - Reinaldo Arenas | PlanetadeLibros','El color del verano - Reinaldo Arenas | PlanetadeLibros','Tusquets Editores','','Tusquets Editores / Editorial Planeta','','','web_page','','es','B','access_pass','WCD-10-B19','Research候选；未经独立审核不得自动进入Curation或公开层，仅供普通书目、体裁和有界简介。；仅候选Research元数据和有限释义；未经独立审核不进入Curation或公开层。；仅候选Research内容；未经独立审核不自动进入Curation或公开层。','remote_only；未下载或保存网页、电子书、PDF或图像。；remote_only；未下载或保存来源文件。；remote_only；未下载或本地保存来源网页/作品文件。','','https://www.planetadelibros.com/libro-el-color-del-verano/88440'),
('SRC-0773','WCD10-B19-S003','El portero - Reinaldo Arenas | PlanetadeLibros','El portero - Reinaldo Arenas | PlanetadeLibros','Tusquets Editores','','Tusquets Editores / Editorial Planeta','','','web_page','','es','B','access_pass','WCD-10-B19','Research候选；未经独立审核不得自动进入Curation或公开层，仅供普通书目、体裁和有界简介。；仅候选Research元数据和有限释义；未经独立审核不进入Curation或公开层。；仅候选Research内容；未经独立审核不自动进入Curation或公开层。','remote_only；未下载或保存网页、电子书、PDF或图像。；remote_only；未下载或保存来源文件。；remote_only；未下载或本地保存来源网页/作品文件。','','https://www.planetadelibros.com/libro-el-portero/88609'),
('SRC-0774','WCD10-B19-S004','El palacio de las blanquísimas mofetas - Reinaldo Arenas | PlanetadeLibros','El palacio de las blanquísimas mofetas - Reinaldo Arenas | PlanetadeLibros','Tusquets Editores','','Tusquets Editores / Editorial Planeta','','','web_page','','es','B','access_pass','WCD-10-B19','Research候选；未经独立审核不得自动进入Curation或公开层，仅供普通书目、体裁和有界简介。；仅候选Research元数据和有限释义；未经独立审核不进入Curation或公开层。；仅候选Research内容；未经独立审核不自动进入Curation或公开层。','remote_only；未下载或保存网页、电子书、PDF或图像。；remote_only；未下载或保存来源文件。；remote_only；未下载或本地保存来源网页/作品文件。','','https://www.planetadelibros.com/libro-el-palacio-de-las-blanquisimas-mofetas/88511'),
('SRC-0775','WCD10-B19-S005','Otra vez el mar — sinopsis y biografía (press kit)','Otra vez el mar — sinopsis y biografía (press kit)','Tusquets Editores','','Tusquets Editores / Editorial Planeta','','','press_kit_pdf','','es','B','access_pass','WCD-10-B19','Research候选；未经独立审核不得自动进入Curation或公开层，仅供普通书目、体裁和有界简介。；仅候选Research元数据和有限释义；未经独立审核不进入Curation或公开层。；仅候选Research内容；未经独立审核不自动进入Curation或公开层。','remote_only；未下载或保存网页、电子书、PDF或图像。；remote_only；未下载或保存来源文件。；remote_only；未下载或本地保存来源网页/作品文件。','','https://proapi.planetadelibros.com/descargas/sala-prensa-libro/sinopsis-y-biografia/291793/otra-vez-el-mar.pdf'),
('SRC-0776','WCD10-B19-S006','El asalto — sinopsis y biografía (press kit)','El asalto — sinopsis y biografía (press kit)','Tusquets Editores','','Tusquets Editores / Editorial Planeta','','','press_kit_pdf','','es','B','access_pass','WCD-10-B19','Research候选；未经独立审核不得自动进入Curation或公开层，仅供普通书目、体裁和有界简介。；仅候选Research元数据和有限释义；未经独立审核不进入Curation或公开层。；仅候选Research内容；未经独立审核不自动进入Curation或公开层。','remote_only；未下载或保存网页、电子书、PDF或图像。；remote_only；未下载或保存来源文件。；remote_only；未下载或本地保存来源网页/作品文件。','','https://proapi.planetadelibros.com/descargas/sala-prensa-libro/sinopsis-y-biografia/88580/el-asalto.pdf'),
('SRC-0777','WCD10-B19-S103','Diario de un Killer sentimental seguido de Yacaré — Tusquets','Diario de un Killer sentimental seguido de Yacaré — Tusquets','Tusquets Editores / Grupo Planeta','','Tusquets Editores / Grupo Planeta','1998','','publisher_press_kit_pdf','','es','B','access_pass','WCD-10-B19','Research候选；未经独立审核不得自动进入Curation或公开层，仅供普通书目、体裁和有界简介。；仅候选Research元数据和有限释义；未经独立审核不进入Curation或公开层。；仅候选Research内容；未经独立审核不自动进入Curation或公开层。','remote_only；未下载或保存网页、电子书、PDF或图像。；remote_only；未下载或保存来源文件。；remote_only；未下载或本地保存来源网页/作品文件。','','https://proapi.planetadelibros.com/descargas/sala-prensa-libro/sinopsis-y-biografia/88421/diario-de-un-killer-sentimental-seguido-de-yacare.pdf'),
('SRC-0778','WCD10-B19-S104','Desencuentros — Tusquets','Desencuentros — Tusquets','Tusquets Editores / Grupo Planeta','','Tusquets Editores / Grupo Planeta','2013','','publisher_press_kit_pdf','','es','B','access_pass','WCD-10-B19','Research候选；未经独立审核不得自动进入Curation或公开层，仅供普通书目、体裁和有界简介。；仅候选Research元数据和有限释义；未经独立审核不进入Curation或公开层。；仅候选Research内容；未经独立审核不自动进入Curation或公开层。','remote_only；未下载或保存网页、电子书、PDF或图像。；remote_only；未下载或保存来源文件。；remote_only；未下载或本地保存来源网页/作品文件。','','https://proapi.planetadelibros.com/descargas/sala-prensa-libro/sinopsis-y-biografia/91361/desencuentros.pdf'),
('SRC-0779','WCD10-B19-S105','Nombre de torero — PlanetadeLibros / Tusquets','Nombre de torero — PlanetadeLibros / Tusquets','Tusquets Editores / Grupo Planeta','','Tusquets Editores / Grupo Planeta','1994','','publisher_book_page','','es','B','access_pass','WCD-10-B19','Research候选；未经独立审核不得自动进入Curation或公开层，仅供普通书目、体裁和有界简介。；仅候选Research元数据和有限释义；未经独立审核不进入Curation或公开层。；仅候选Research内容；未经独立审核不自动进入Curation或公开层。','remote_only；未下载或保存网页、电子书、PDF或图像。；remote_only；未下载或保存来源文件。；remote_only；未下载或本地保存来源网页/作品文件。','','https://www.planetadelibros.com/libro-nombre-de-torero/88303'),
('SRC-0780','WCD10-B19-S201','El huésped','El huésped','Editorial Anagrama','','Editorial Anagrama','','','web_page','','es','B','access_pass','WCD-10-B19','Research候选；未经独立审核不得自动进入Curation或公开层，仅供普通书目、体裁和有界简介。；仅候选Research元数据和有限释义；未经独立审核不进入Curation或公开层。；仅候选Research内容；未经独立审核不自动进入Curation或公开层。','remote_only；未下载或保存网页、电子书、PDF或图像。；remote_only；未下载或保存来源文件。；remote_only；未下载或本地保存来源网页/作品文件。','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/el-huesped/9788433944481/NH_390'),
('SRC-0781','WCD10-B19-S202','El cuerpo en que nací','El cuerpo en que nací','Editorial Anagrama','','Editorial Anagrama','','','web_page','','es','B','access_pass','WCD-10-B19','Research候选；未经独立审核不得自动进入Curation或公开层，仅供普通书目、体裁和有界简介。；仅候选Research元数据和有限释义；未经独立审核不进入Curation或公开层。；仅候选Research内容；未经独立审核不自动进入Curation或公开层。','remote_only；未下载或保存网页、电子书、PDF或图像。；remote_only；未下载或保存来源文件。；remote_only；未下载或本地保存来源网页/作品文件。','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/el-cuerpo-en-que-naci/9788433933201/NH_491'),
('SRC-0782','WCD10-B19-S203','Después del invierno','Después del invierno','Editorial Anagrama','','Editorial Anagrama','','','web_page','','es','B','access_pass','WCD-10-B19','Research候选；未经独立审核不得自动进入Curation或公开层，仅供普通书目、体裁和有界简介。；仅候选Research元数据和有限释义；未经独立审核不进入Curation或公开层。；仅候选Research内容；未经独立审核不自动进入Curation或公开层。','remote_only；未下载或保存网页、电子书、PDF或图像。；remote_only；未下载或保存来源文件。；remote_only；未下载或本地保存来源网页/作品文件。','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/despues-del-invierno/9788433932723/NH_539'),
('SRC-0783','WCD10-B19-S204','Los divagantes','Los divagantes','Editorial Anagrama','','Editorial Anagrama','','','web_page','','es','B','access_pass','WCD-10-B19','Research候选；未经独立审核不得自动进入Curation或公开层，仅供普通书目、体裁和有界简介。；仅候选Research元数据和有限释义；未经独立审核不进入Curation或公开层。；仅候选Research内容；未经独立审核不自动进入Curation或公开层。','remote_only；未下载或保存网页、电子书、PDF或图像。；remote_only；未下载或保存来源文件。；remote_only；未下载或本地保存来源网页/作品文件。','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/los-divagantes/9788433908186/NH_719');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0767','work','《白色臭鼬宫殿》（暂译）','El palacio de las blanquísimas mofetas','candidate','1','WCD10-B19-W001','出版者作者目录/图书产品页直接列出该作；只补有直接依据的普通书目、体裁与限缩简介，不声称全集或学术覆盖。; 中文题名仅为检索用暂译；以西班牙语原题识别作品，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0768','work','《再一次，大海》（暂译）','Otra vez el mar','candidate','1','WCD10-B19-W002','出版者作者目录/图书产品页直接列出该作；只补有直接依据的普通书目、体裁与限缩简介，不声称全集或学术覆盖。; 中文题名仅为检索用暂译；以西班牙语原题识别作品，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0769','work','《夏日的颜色》（暂译）','El color del verano','candidate','1','WCD10-B19-W003','出版者作者目录/图书产品页直接列出该作；只补有直接依据的普通书目、体裁与限缩简介，不声称全集或学术覆盖。; 中文题名仅为检索用暂译；以西班牙语原题识别作品，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0770','work','《袭击》（暂译）','El asalto','candidate','1','WCD10-B19-W004','出版者作者目录/图书产品页直接列出该作；只补有直接依据的普通书目、体裁与限缩简介，不声称全集或学术覆盖。; 中文题名仅为检索用暂译；以西班牙语原题识别作品，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0771','work','《门卫》（暂译）','El portero','candidate','1','WCD10-B19-W005','出版者作者目录/图书产品页直接列出该作；只补有直接依据的普通书目、体裁与限缩简介，不声称全集或学术覆盖。; 中文题名仅为检索用暂译；以西班牙语原题识别作品，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0772','work','《斗牛士之名》','Nombre de torero','candidate','1','WCD10-B19-W101','冻结B19基线语义查重后未发现同题既有作品；直接来源支持作品书目与本条限定的体裁/简介。; 保留西班牙语原题；中文为检索译名，不主张正式中译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0773','work','《巴塔哥尼亚快车》','Patagonia Express','candidate','1','WCD10-B19-W102','冻结B19基线语义查重后未发现同题既有作品；直接来源支持作品书目与本条限定的体裁/简介。; 保留西班牙语原题；中文为检索译名，不主张正式中译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0774','collection','《错过》（检索译名）','Desencuentros','candidate','1','WCD10-B19-W103','冻结B19基线语义查重后未发现同题既有作品；直接来源支持作品书目与本条限定的体裁/简介。; 以西班牙语原题为身份锚点；中文标题为检索译名，不主张已出版中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0775','collection','《一个多情杀手的日记》与《亚卡雷》（检索译名）','Diario de un killer sentimental seguido de Yacaré','candidate','1','WCD10-B19-W104','冻结B19基线语义查重后未发现同题既有作品；直接来源支持作品书目与本条限定的体裁/简介。; 以西班牙语原题为身份锚点；中文标题为检索译名，不主张已出版中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0776','work','El huésped','El huésped','candidate','1','WCD10-B19-W201','出版者直接列明作品题名、作者、作品类别、页面版本日期和有界简介；按书籍层级登记，不扩展到篇目或版次实体。; 沿用西班牙语原题作中文检索显示值，不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0777','work','El cuerpo en que nací','El cuerpo en que nací','candidate','1','WCD10-B19-W202','出版者直接列明作品题名、作者、作品类别、页面版本日期和有界简介；按书籍层级登记，不扩展到篇目或版次实体。; 沿用西班牙语原题作中文检索显示值，不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0778','work','Después del invierno','Después del invierno','candidate','1','WCD10-B19-W203','出版者直接列明作品题名、作者、作品类别、页面版本日期和有界简介；按书籍层级登记，不扩展到篇目或版次实体。; 沿用西班牙语原题作中文检索显示值，不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0779','collection','Los divagantes','Los divagantes','candidate','1','WCD10-B19-W204','出版者直接列明作品题名、作者、作品类别、页面版本日期和有界简介；按书籍层级登记，不扩展到篇目或版次实体。; 沿用西班牙语原题作中文检索显示值，不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0763','WCD10-B19-W001','WCD-10-B19','WCD10-B19-W001','V1-ENT-0767','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0764','WCD10-B19-W002','WCD-10-B19','WCD10-B19-W002','V1-ENT-0768','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0765','WCD10-B19-W003','WCD-10-B19','WCD10-B19-W003','V1-ENT-0769','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0766','WCD10-B19-W004','WCD-10-B19','WCD10-B19-W004','V1-ENT-0770','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0767','WCD10-B19-W005','WCD-10-B19','WCD10-B19-W005','V1-ENT-0771','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0768','WCD10-B19-W101','WCD-10-B19','WCD10-B19-W101','V1-ENT-0772','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0769','WCD10-B19-W102','WCD-10-B19','WCD10-B19-W102','V1-ENT-0773','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0770','WCD10-B19-W103','WCD-10-B19','WCD10-B19-W103','V1-ENT-0774','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0771','WCD10-B19-W104','WCD-10-B19','WCD10-B19-W104','V1-ENT-0775','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0772','WCD10-B19-W201','WCD-10-B19','WCD10-B19-W201','V1-ENT-0776','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0773','WCD10-B19-W202','WCD-10-B19','WCD10-B19-W202','V1-ENT-0777','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0774','WCD10-B19-W203','WCD-10-B19','WCD10-B19-W203','V1-ENT-0778','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0775','WCD10-B19-W204','WCD-10-B19','WCD10-B19-W204','V1-ENT-0779','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0778','WCD-10-B19:V1-ENT-0767','V1-ENT-0767','work','《白色臭鼬宫殿》（暂译）','雷纳尔多·阿雷纳斯','El palacio de las blanquísimas mofetas','古巴','es','','小说','WCD-10-B19','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《白色臭鼬宫殿》（暂译）｜El palacio de las blanquísimas mofetas

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：Tusquets简介称，本书以具有个人色彩的方式回顾作者自身经历与古巴历史。
- bibliographic_note：Tusquets作者目录列出本书为pentagonía系列成员，但未在该目录段提供首版年份；本候选仅记录出版者书目列示，不推定首版年。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0779','WCD-10-B19:V1-ENT-0768','V1-ENT-0768','work','《再一次，大海》（暂译）','雷纳尔多·阿雷纳斯','Otra vez el mar','古巴','es','','小说','WCD-10-B19','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《再一次，大海》（暂译）｜Otra vez el mar

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- bibliographic_note：Tusquets新闻资料称本页版本采用作者修订的1982年文本；出版社作者目录也列出本书。现有直接来源未能确定作品原始首版年份，因此first_publication_year留空。
- one_sentence_summary：Tusquets资料介绍一对年轻夫妻在度假地的故事，并以妻子和丈夫Héctor的双重叙述呈现两人的挫折与对自由的渴望。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0780','WCD-10-B19:V1-ENT-0769','V1-ENT-0769','work','《夏日的颜色》（暂译）','雷纳尔多·阿雷纳斯','El color del verano','古巴','es','','小说','WCD-10-B19','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《夏日的颜色》（暂译）｜El color del verano

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：Tusquets简介写到古巴为统治者在位五十周年举行狂欢庆典，并呈现庆典背后的青年地下生活及岛上的压迫处境。
- bibliographic_note：出版者页面列出的1999年Tusquets版仅作为版本年份记录；未把它推定为作品首版年。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0781','WCD-10-B19:V1-ENT-0770','V1-ENT-0770','work','《袭击》（暂译）','雷纳尔多·阿雷纳斯','El asalto','古巴','es','','小说','WCD-10-B19','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《袭击》（暂译）｜El asalto

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：Tusquets简介中的叙述者身处严密控制的国家，借加入秘密行动机构寻找母亲并实施个人复仇。
- bibliographic_note：Tusquets作者目录列出本书为pentagonía系列成员，但未在该目录段提供首版年份；本候选仅记录出版者书目列示，不推定首版年。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0782','WCD-10-B19:V1-ENT-0771','V1-ENT-0771','work','《门卫》（暂译）','雷纳尔多·阿雷纳斯','El portero','古巴','es','','小说','WCD-10-B19','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《门卫》（暂译）｜El portero

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：小说描写纽约大楼中的微观社会，并以一名古巴流亡门卫的观察展开；出版者称作品写于1984至1986年。
- bibliographic_note：Tusquets产品页列2004年版；此为所见版本年份，未作为首版年份。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0783','WCD-10-B19:V1-ENT-0772','V1-ENT-0772','work','《斗牛士之名》','路易斯·塞普尔维达','Nombre de torero','智利','es','','长篇小说','WCD-10-B19','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《斗牛士之名》｜Nombre de torero

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说
- bibliographic_note：Memoria Chilena列Nombre de torero为Barcelona: Tusquets, 1994；PlanetadeLibros技术资料标注出版日期1994-10-01。此处保留来源所载书目/版本年份，不宣称已核定作者首版年份。
- one_sentence_summary：金币失窃近五十年后，柏林墙已经倒塌；Juan Belmonte与Frank Galinsky分别受雇追寻金币。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0784','WCD-10-B19:V1-ENT-0773','V1-ENT-0773','work','《巴塔哥尼亚快车》','路易斯·塞普尔维达','Patagonia Express','智利','es','','旅行叙事','WCD-10-B19','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《巴塔哥尼亚快车》｜Patagonia Express

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：旅行叙事
- bibliographic_note：BND文章将Patagonia Express列为1995年作品；Memoria Chilena列Barcelona: Tusquets, 1995。该年份按来源所列书目信息保留，不断言首版年。
- one_sentence_summary：这部旅行叙事围绕作者在智利和阿根廷南部经历的空间与冒险，并兼及发生在厄瓜多尔的故事展开。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0785','WCD-10-B19:V1-ENT-0774','V1-ENT-0774','collection','《错过》（检索译名）','路易斯·塞普尔维达','Desencuentros','智利','es','','短篇小说集','WCD-10-B19','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《错过》（检索译名）｜Desencuentros

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- bibliographic_note：BND文章将Desencuentros列为1997年故事集；该年份按来源所载书目信息保留，不断言首版年。
- one_sentence_summary：Tusquets材料称本书汇集作者偏爱的旧作及未刊故事，共二十七篇，围绕愿望、情感与命运的错位展开。中文为检索译名，不声称正式中译本。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0786','WCD-10-B19:V1-ENT-0775','V1-ENT-0775','collection','《一个多情杀手的日记》与《亚卡雷》（检索译名）','路易斯·塞普尔维达','Diario de un killer sentimental seguido de Yacaré','智利','es','','两部中篇小说合集','WCD-10-B19','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《一个多情杀手的日记》与《亚卡雷》（检索译名）｜Diario de un killer sentimental seguido de Yacaré

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：两部中篇小说合集
- bibliographic_note：出版社资料注明Tusquets版于1998-06-01出版；BND文章亦列Diario…及Yacaré为1998年作品。本轮保留版本说明，不把合辑出版年原子化为两篇各自的首版年。
- one_sentence_summary：Tusquets称本册收入两部中篇小说：一篇写职业杀手因恋爱而违背行规；另一篇写保险调查员从苏黎世转往米兰，深入巴西南部 anaré 与 yacaré 的世界。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0787','WCD-10-B19:V1-ENT-0776','V1-ENT-0776','work','El huésped','瓜达卢佩·内特尔','El huésped','墨西哥','es','','小说','WCD-10-B19','research_gap','RESEARCH-ONLY-NOT-CURATED','### El huésped｜El huésped

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- bibliographic_note：Anagrama产品页PUBLICACIÓN日期为2006-01-01；本值仅记录该页面所示版本日期，不宣称首版年份。首版年原子值留空。
- one_sentence_summary：出版社将其称为内特尔的第一部小说：少女安娜与一个或许只是想象的“寄居者”抗衡，叙事延伸至成年后的失明经验与墨西哥城地下世界。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0788','WCD-10-B19:V1-ENT-0777','V1-ENT-0777','work','El cuerpo en que nací','瓜达卢佩·内特尔','El cuerpo en que nací','墨西哥','es','','小说','WCD-10-B19','research_gap','RESEARCH-ONLY-NOT-CURATED','### El cuerpo en que nací｜El cuerpo en que nací

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- bibliographic_note：Anagrama产品页PUBLICACIÓN日期为2011-10-01；本值仅记录该页面所示版本日期，不宣称首版年份。首版年原子值留空。
- one_sentence_summary：出版社简介称小说受作者童年启发，围绕一名眼部先天缺陷女孩的成长、家庭与自我接纳展开，并以咨询室独白框架回忆往事。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0789','WCD-10-B19:V1-ENT-0778','V1-ENT-0778','work','Después del invierno','瓜达卢佩·内特尔','Después del invierno','墨西哥','es','','小说','WCD-10-B19','research_gap','RESEARCH-ONLY-NOT-CURATED','### Después del invierno｜Después del invierno

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- bibliographic_note：Anagrama产品页PUBLICACIÓN日期为2014-11-19；本值仅记录该页面所示版本日期，不宣称首版年份。首版年原子值留空。
- one_sentence_summary：出版社简介交织古巴裔Claudio与墨西哥裔Cecilia在纽约、巴黎的生活，写两人的亲密关系、孤独与各自的过往。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0790','WCD-10-B19:V1-ENT-0779','V1-ENT-0779','collection','Los divagantes','瓜达卢佩·内特尔','Los divagantes','墨西哥','es','','短篇小说集','WCD-10-B19','research_gap','RESEARCH-ONLY-NOT-CURATED','### Los divagantes｜Los divagantes

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- bibliographic_note：Anagrama产品页PUBLICACIÓN日期为2023-09-06；本值仅记录该页面所示版本日期，不宣称首版年份。首版年原子值留空。
- one_sentence_summary：出版社称本书收录八篇故事，人物因意外离开惯常生活，在现实与幻想之间遭遇陌生处境，并面对成功与失败的执念。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0791','WCD-10-B19:V1-ENT-0350','V1-ENT-0350','work','《独生女儿》','瓜达卢佩·内特尔','La hija única','墨西哥','es','','','WCD-10-B19','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《独生女儿》｜La hija única

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：出版社简介以三名女性及不同的母职经验为线索，涉及Alina在孕晚期被告知女儿出生后可能无法存活、夫妻由此经历预期丧失与哀悼，以及邻居单亲母子面对的处境。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0792','WCD-10-B19:V1-ENT-0351','V1-ENT-0351','collection','《红鱼之姻》','瓜达卢佩·内特尔','El matrimonio de los peces rojos','墨西哥','es','','','WCD-10-B19','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《红鱼之姻》｜El matrimonio de los peces rojos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：出版社称本集包含五篇叙事，以动物与人的世界交错书写伴侣关系、母职、青春期危机及亲密关系中的隐秘面向。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0793','WCD-10-B19:V1-ENT-0352','V1-ENT-0352','collection','《真正的孤独》','瓜达卢佩·内特尔','Pétalos y otras historias incómodas','墨西哥','es','','','WCD-10-B19','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《真正的孤独》｜Pétalos y otras historias incómodas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：出版社将其描述为六篇“令人不安的故事”，人物各有隐秘癖好或异于常态的生活方式，写被日常表象遮住的异质经验。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-2575','WCD10-B19-W001-F01','V1-CARD-0778','V1-ENT-0767','genre_or_form','小说','bibliographic','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2576','WCD10-B19-W001-F02','V1-CARD-0778','V1-ENT-0767','one_sentence_summary','Tusquets简介称，本书以具有个人色彩的方式回顾作者自身经历与古巴历史。','institutional_paraphrase','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2577','WCD10-B19-W001-F03','V1-CARD-0778','V1-ENT-0767','bibliographic_note','Tusquets作者目录列出本书为pentagonía系列成员，但未在该目录段提供首版年份；本候选仅记录出版者书目列示，不推定首版年。','bibliographic_note','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2578','WCD10-B19-W002-F01','V1-CARD-0779','V1-ENT-0768','genre_or_form','小说','bibliographic','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2579','WCD10-B19-W002-F02','V1-CARD-0779','V1-ENT-0768','bibliographic_note','Tusquets新闻资料称本页版本采用作者修订的1982年文本；出版社作者目录也列出本书。现有直接来源未能确定作品原始首版年份，因此first_publication_year留空。','bibliographic_note','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2580','WCD10-B19-W002-F03','V1-CARD-0779','V1-ENT-0768','one_sentence_summary','Tusquets资料介绍一对年轻夫妻在度假地的故事，并以妻子和丈夫Héctor的双重叙述呈现两人的挫折与对自由的渴望。','institutional_paraphrase','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2581','WCD10-B19-W003-F01','V1-CARD-0780','V1-ENT-0769','genre_or_form','小说','bibliographic','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2582','WCD10-B19-W003-F02','V1-CARD-0780','V1-ENT-0769','one_sentence_summary','Tusquets简介写到古巴为统治者在位五十周年举行狂欢庆典，并呈现庆典背后的青年地下生活及岛上的压迫处境。','institutional_paraphrase','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2583','WCD10-B19-W003-F03','V1-CARD-0780','V1-ENT-0769','bibliographic_note','出版者页面列出的1999年Tusquets版仅作为版本年份记录；未把它推定为作品首版年。','bibliographic_note','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2584','WCD10-B19-W004-F01','V1-CARD-0781','V1-ENT-0770','genre_or_form','小说','bibliographic','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2585','WCD10-B19-W004-F02','V1-CARD-0781','V1-ENT-0770','one_sentence_summary','Tusquets简介中的叙述者身处严密控制的国家，借加入秘密行动机构寻找母亲并实施个人复仇。','institutional_paraphrase','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2586','WCD10-B19-W004-F03','V1-CARD-0781','V1-ENT-0770','bibliographic_note','Tusquets作者目录列出本书为pentagonía系列成员，但未在该目录段提供首版年份；本候选仅记录出版者书目列示，不推定首版年。','bibliographic_note','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2587','WCD10-B19-W005-F01','V1-CARD-0782','V1-ENT-0771','genre_or_form','小说','bibliographic','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2588','WCD10-B19-W005-F02','V1-CARD-0782','V1-ENT-0771','one_sentence_summary','小说描写纽约大楼中的微观社会，并以一名古巴流亡门卫的观察展开；出版者称作品写于1984至1986年。','institutional_paraphrase','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2589','WCD10-B19-W005-F03','V1-CARD-0782','V1-ENT-0771','bibliographic_note','Tusquets产品页列2004年版；此为所见版本年份，未作为首版年份。','bibliographic_note','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2590','WCD10-B19-W101-F01','V1-CARD-0783','V1-ENT-0772','genre_or_form','长篇小说','bibliographic','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2591','WCD10-B19-W101-F02','V1-CARD-0783','V1-ENT-0772','bibliographic_note','Memoria Chilena列Nombre de torero为Barcelona: Tusquets, 1994；PlanetadeLibros技术资料标注出版日期1994-10-01。此处保留来源所载书目/版本年份，不宣称已核定作者首版年份。','bibliographic_note','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2592','WCD10-B19-W101-F03','V1-CARD-0783','V1-ENT-0772','one_sentence_summary','金币失窃近五十年后，柏林墙已经倒塌；Juan Belmonte与Frank Galinsky分别受雇追寻金币。','institutional_paraphrase','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2593','WCD10-B19-W102-F01','V1-CARD-0784','V1-ENT-0773','genre_or_form','旅行叙事','bibliographic','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2594','WCD10-B19-W102-F02','V1-CARD-0784','V1-ENT-0773','bibliographic_note','BND文章将Patagonia Express列为1995年作品；Memoria Chilena列Barcelona: Tusquets, 1995。该年份按来源所列书目信息保留，不断言首版年。','bibliographic_note','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2595','WCD10-B19-W102-F03','V1-CARD-0784','V1-ENT-0773','one_sentence_summary','这部旅行叙事围绕作者在智利和阿根廷南部经历的空间与冒险，并兼及发生在厄瓜多尔的故事展开。','institutional_paraphrase','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2596','WCD10-B19-W103-F01','V1-CARD-0785','V1-ENT-0774','genre_or_form','短篇小说集','bibliographic','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2597','WCD10-B19-W103-F02','V1-CARD-0785','V1-ENT-0774','bibliographic_note','BND文章将Desencuentros列为1997年故事集；该年份按来源所载书目信息保留，不断言首版年。','bibliographic_note','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2598','WCD10-B19-W103-F03','V1-CARD-0785','V1-ENT-0774','one_sentence_summary','Tusquets材料称本书汇集作者偏爱的旧作及未刊故事，共二十七篇，围绕愿望、情感与命运的错位展开。中文为检索译名，不声称正式中译本。','institutional_paraphrase','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2599','WCD10-B19-W104-F01','V1-CARD-0786','V1-ENT-0775','genre_or_form','两部中篇小说合集','bibliographic','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2600','WCD10-B19-W104-F02','V1-CARD-0786','V1-ENT-0775','bibliographic_note','出版社资料注明Tusquets版于1998-06-01出版；BND文章亦列Diario…及Yacaré为1998年作品。本轮保留版本说明，不把合辑出版年原子化为两篇各自的首版年。','bibliographic_note','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2601','WCD10-B19-W104-F03','V1-CARD-0786','V1-ENT-0775','one_sentence_summary','Tusquets称本册收入两部中篇小说：一篇写职业杀手因恋爱而违背行规；另一篇写保险调查员从苏黎世转往米兰，深入巴西南部 anaré 与 yacaré 的世界。','institutional_paraphrase','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2602','WCD10-B19-W201-F01','V1-CARD-0787','V1-ENT-0776','genre_or_form','小说','bibliographic','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2603','WCD10-B19-W201-F02','V1-CARD-0787','V1-ENT-0776','bibliographic_note','Anagrama产品页PUBLICACIÓN日期为2006-01-01；本值仅记录该页面所示版本日期，不宣称首版年份。首版年原子值留空。','bibliographic_note','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2604','WCD10-B19-W201-F03','V1-CARD-0787','V1-ENT-0776','one_sentence_summary','出版社将其称为内特尔的第一部小说：少女安娜与一个或许只是想象的“寄居者”抗衡，叙事延伸至成年后的失明经验与墨西哥城地下世界。','institutional_paraphrase','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2605','WCD10-B19-W202-F01','V1-CARD-0788','V1-ENT-0777','genre_or_form','小说','bibliographic','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2606','WCD10-B19-W202-F02','V1-CARD-0788','V1-ENT-0777','bibliographic_note','Anagrama产品页PUBLICACIÓN日期为2011-10-01；本值仅记录该页面所示版本日期，不宣称首版年份。首版年原子值留空。','bibliographic_note','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2607','WCD10-B19-W202-F03','V1-CARD-0788','V1-ENT-0777','one_sentence_summary','出版社简介称小说受作者童年启发，围绕一名眼部先天缺陷女孩的成长、家庭与自我接纳展开，并以咨询室独白框架回忆往事。','institutional_paraphrase','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2608','WCD10-B19-W203-F01','V1-CARD-0789','V1-ENT-0778','genre_or_form','小说','bibliographic','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2609','WCD10-B19-W203-F02','V1-CARD-0789','V1-ENT-0778','bibliographic_note','Anagrama产品页PUBLICACIÓN日期为2014-11-19；本值仅记录该页面所示版本日期，不宣称首版年份。首版年原子值留空。','bibliographic_note','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2610','WCD10-B19-W203-F03','V1-CARD-0789','V1-ENT-0778','one_sentence_summary','出版社简介交织古巴裔Claudio与墨西哥裔Cecilia在纽约、巴黎的生活，写两人的亲密关系、孤独与各自的过往。','institutional_paraphrase','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2611','WCD10-B19-W204-F01','V1-CARD-0790','V1-ENT-0779','genre_or_form','短篇小说集','bibliographic','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2612','WCD10-B19-W204-F02','V1-CARD-0790','V1-ENT-0779','bibliographic_note','Anagrama产品页PUBLICACIÓN日期为2023-09-06；本值仅记录该页面所示版本日期，不宣称首版年份。首版年原子值留空。','bibliographic_note','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2613','WCD10-B19-W204-F03','V1-CARD-0790','V1-ENT-0779','one_sentence_summary','出版社称本书收录八篇故事，人物因意外离开惯常生活，在现实与幻想之间遭遇陌生处境，并面对成功与失败的执念。','institutional_paraphrase','WCD-10-B19','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2614','WCD10-B19-F213','V1-CARD-0791','V1-ENT-0350','one_sentence_summary','出版社简介以三名女性及不同的母职经验为线索，涉及Alina在孕晚期被告知女儿出生后可能无法存活、夫妻由此经历预期丧失与哀悼，以及邻居单亲母子面对的处境。','institutional_paraphrase','WCD-10-B19','high','batch_retained_candidate','仅追加出版者所载的有界作品简介；冻结基线中的实体、既有事实、卡片、CREATED关系、关系证据、来源链与hold/gap逐值保留。'),
('V1-FCT-2615','WCD10-B19-F214','V1-CARD-0792','V1-ENT-0351','one_sentence_summary','出版社称本集包含五篇叙事，以动物与人的世界交错书写伴侣关系、母职、青春期危机及亲密关系中的隐秘面向。','institutional_paraphrase','WCD-10-B19','high','batch_retained_candidate','仅追加出版者所载的有界作品简介；冻结基线中的实体、既有事实、卡片、CREATED关系、关系证据、来源链与hold/gap逐值保留。'),
('V1-FCT-2616','WCD10-B19-F215','V1-CARD-0793','V1-ENT-0352','one_sentence_summary','出版社将其描述为六篇“令人不安的故事”，人物各有隐秘癖好或异于常态的生活方式，写被日常表象遮住的异质经验。','institutional_paraphrase','WCD-10-B19','high','batch_retained_candidate','仅追加出版者所载的有界作品简介；冻结基线中的实体、既有事实、卡片、CREATED关系、关系证据、来源链与hold/gap逐值保留。');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-2575','SRC-0771','Reinaldo Arenas | PlanetadeLibros'),
('V1-FCT-2576','SRC-0774','El palacio de las blanquísimas mofetas - Reinaldo Arenas | PlanetadeLibros'),
('V1-FCT-2577','SRC-0771','Reinaldo Arenas | PlanetadeLibros'),
('V1-FCT-2578','SRC-0771','Reinaldo Arenas | PlanetadeLibros'),
('V1-FCT-2579','SRC-0771','Reinaldo Arenas | PlanetadeLibros'),
('V1-FCT-2579','SRC-0775','Otra vez el mar — sinopsis y biografía (press kit)'),
('V1-FCT-2580','SRC-0775','Otra vez el mar — sinopsis y biografía (press kit)'),
('V1-FCT-2581','SRC-0771','Reinaldo Arenas | PlanetadeLibros'),
('V1-FCT-2582','SRC-0772','El color del verano - Reinaldo Arenas | PlanetadeLibros'),
('V1-FCT-2583','SRC-0772','El color del verano - Reinaldo Arenas | PlanetadeLibros'),
('V1-FCT-2584','SRC-0771','Reinaldo Arenas | PlanetadeLibros'),
('V1-FCT-2585','SRC-0776','El asalto — sinopsis y biografía (press kit)'),
('V1-FCT-2586','SRC-0771','Reinaldo Arenas | PlanetadeLibros'),
('V1-FCT-2587','SRC-0771','Reinaldo Arenas | PlanetadeLibros'),
('V1-FCT-2588','SRC-0773','El portero - Reinaldo Arenas | PlanetadeLibros'),
('V1-FCT-2589','SRC-0773','El portero - Reinaldo Arenas | PlanetadeLibros'),
('V1-FCT-2590','SRC-0262','La narrativa del chileno Luis Sepúlveda'),
('V1-FCT-2590','SRC-0261','Sepúlveda, Luis'),
('V1-FCT-2591','SRC-0261','Sepúlveda, Luis'),
('V1-FCT-2591','SRC-0779','Nombre de torero — PlanetadeLibros / Tusquets'),
('V1-FCT-2592','SRC-0779','Nombre de torero — PlanetadeLibros / Tusquets'),
('V1-FCT-2593','SRC-0262','La narrativa del chileno Luis Sepúlveda'),
('V1-FCT-2593','SRC-0261','Sepúlveda, Luis'),
('V1-FCT-2594','SRC-0262','La narrativa del chileno Luis Sepúlveda'),
('V1-FCT-2594','SRC-0261','Sepúlveda, Luis'),
('V1-FCT-2595','SRC-0262','La narrativa del chileno Luis Sepúlveda'),
('V1-FCT-2596','SRC-0262','La narrativa del chileno Luis Sepúlveda'),
('V1-FCT-2597','SRC-0262','La narrativa del chileno Luis Sepúlveda'),
('V1-FCT-2598','SRC-0778','Desencuentros — Tusquets'),
('V1-FCT-2599','SRC-0777','Diario de un Killer sentimental seguido de Yacaré — Tusquets'),
('V1-FCT-2599','SRC-0262','La narrativa del chileno Luis Sepúlveda'),
('V1-FCT-2600','SRC-0777','Diario de un Killer sentimental seguido de Yacaré — Tusquets'),
('V1-FCT-2600','SRC-0262','La narrativa del chileno Luis Sepúlveda'),
('V1-FCT-2601','SRC-0777','Diario de un Killer sentimental seguido de Yacaré — Tusquets'),
('V1-FCT-2602','SRC-0780','El huésped'),
('V1-FCT-2603','SRC-0780','El huésped'),
('V1-FCT-2604','SRC-0780','El huésped'),
('V1-FCT-2605','SRC-0781','El cuerpo en que nací'),
('V1-FCT-2606','SRC-0781','El cuerpo en que nací'),
('V1-FCT-2607','SRC-0781','El cuerpo en que nací'),
('V1-FCT-2608','SRC-0782','Después del invierno'),
('V1-FCT-2609','SRC-0782','Después del invierno'),
('V1-FCT-2610','SRC-0782','Después del invierno'),
('V1-FCT-2611','SRC-0783','Los divagantes'),
('V1-FCT-2612','SRC-0783','Los divagantes'),
('V1-FCT-2613','SRC-0783','Los divagantes'),
('V1-FCT-2614','SRC-0264','La hija única'),
('V1-FCT-2615','SRC-0265','El matrimonio de los peces rojos'),
('V1-FCT-2616','SRC-0266','Petals and other awkward stories');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0778','V1-FCT-2575','batch_retained_candidate'),
('V1-CARD-0778','V1-FCT-2576','batch_retained_candidate'),
('V1-CARD-0778','V1-FCT-2577','batch_retained_candidate'),
('V1-CARD-0779','V1-FCT-2578','batch_retained_candidate'),
('V1-CARD-0779','V1-FCT-2579','batch_retained_candidate'),
('V1-CARD-0779','V1-FCT-2580','batch_retained_candidate'),
('V1-CARD-0780','V1-FCT-2581','batch_retained_candidate'),
('V1-CARD-0780','V1-FCT-2582','batch_retained_candidate'),
('V1-CARD-0780','V1-FCT-2583','batch_retained_candidate'),
('V1-CARD-0781','V1-FCT-2584','batch_retained_candidate'),
('V1-CARD-0781','V1-FCT-2585','batch_retained_candidate'),
('V1-CARD-0781','V1-FCT-2586','batch_retained_candidate'),
('V1-CARD-0782','V1-FCT-2587','batch_retained_candidate'),
('V1-CARD-0782','V1-FCT-2588','batch_retained_candidate'),
('V1-CARD-0782','V1-FCT-2589','batch_retained_candidate'),
('V1-CARD-0783','V1-FCT-2590','batch_retained_candidate'),
('V1-CARD-0783','V1-FCT-2591','batch_retained_candidate'),
('V1-CARD-0783','V1-FCT-2592','batch_retained_candidate'),
('V1-CARD-0784','V1-FCT-2593','batch_retained_candidate'),
('V1-CARD-0784','V1-FCT-2594','batch_retained_candidate'),
('V1-CARD-0784','V1-FCT-2595','batch_retained_candidate'),
('V1-CARD-0785','V1-FCT-2596','batch_retained_candidate'),
('V1-CARD-0785','V1-FCT-2597','batch_retained_candidate'),
('V1-CARD-0785','V1-FCT-2598','batch_retained_candidate'),
('V1-CARD-0786','V1-FCT-2599','batch_retained_candidate'),
('V1-CARD-0786','V1-FCT-2600','batch_retained_candidate'),
('V1-CARD-0786','V1-FCT-2601','batch_retained_candidate'),
('V1-CARD-0787','V1-FCT-2602','batch_retained_candidate'),
('V1-CARD-0787','V1-FCT-2603','batch_retained_candidate'),
('V1-CARD-0787','V1-FCT-2604','batch_retained_candidate'),
('V1-CARD-0788','V1-FCT-2605','batch_retained_candidate'),
('V1-CARD-0788','V1-FCT-2606','batch_retained_candidate'),
('V1-CARD-0788','V1-FCT-2607','batch_retained_candidate'),
('V1-CARD-0789','V1-FCT-2608','batch_retained_candidate'),
('V1-CARD-0789','V1-FCT-2609','batch_retained_candidate'),
('V1-CARD-0789','V1-FCT-2610','batch_retained_candidate'),
('V1-CARD-0790','V1-FCT-2611','batch_retained_candidate'),
('V1-CARD-0790','V1-FCT-2612','batch_retained_candidate'),
('V1-CARD-0790','V1-FCT-2613','batch_retained_candidate'),
('V1-CARD-0791','V1-FCT-2614','batch_retained_candidate'),
('V1-CARD-0792','V1-FCT-2615','batch_retained_candidate'),
('V1-CARD-0793','V1-FCT-2616','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-1533','WCD10-B19-S001','V1-CARD-0778','SRC-0771','B','bibliography_or_bounded_description','yes','no','SRC-0771','accepted','NONE'),
('V1-CS-1534','WCD10-B19-S004','V1-CARD-0778','SRC-0774','B','bibliography_or_bounded_description','no','no','SRC-0774','accepted','NONE'),
('V1-CS-1535','WCD10-B19-S001','V1-CARD-0779','SRC-0771','B','bibliography_or_bounded_description','yes','no','SRC-0771','accepted','NONE'),
('V1-CS-1536','WCD10-B19-S005','V1-CARD-0779','SRC-0775','B','bibliography_or_bounded_description','yes','no','SRC-0775','accepted','NONE'),
('V1-CS-1537','WCD10-B19-S001','V1-CARD-0780','SRC-0771','B','bibliography_or_bounded_description','yes','no','SRC-0771','accepted','NONE'),
('V1-CS-1538','WCD10-B19-S002','V1-CARD-0780','SRC-0772','B','bibliography_or_bounded_description','yes','no','SRC-0772','accepted','NONE'),
('V1-CS-1539','WCD10-B19-S001','V1-CARD-0781','SRC-0771','B','bibliography_or_bounded_description','yes','no','SRC-0771','accepted','NONE'),
('V1-CS-1540','WCD10-B19-S006','V1-CARD-0781','SRC-0776','B','bibliography_or_bounded_description','no','no','SRC-0776','accepted','NONE'),
('V1-CS-1541','WCD10-B19-S001','V1-CARD-0782','SRC-0771','B','bibliography_or_bounded_description','yes','no','SRC-0771','accepted','NONE'),
('V1-CS-1542','WCD10-B19-S003','V1-CARD-0782','SRC-0773','B','bibliography_or_bounded_description','yes','no','SRC-0773','accepted','NONE'),
('V1-CS-1543','WCD10-B19-S101','V1-CARD-0783','SRC-0261','B','bibliography_or_bounded_description','yes','no','SRC-0261','accepted','NONE'),
('V1-CS-1544','WCD10-B19-S102','V1-CARD-0783','SRC-0262','A','bibliography_or_bounded_description','yes','no','SRC-0262','accepted','NONE'),
('V1-CS-1545','WCD10-B19-S105','V1-CARD-0783','SRC-0779','B','bibliography_or_bounded_description','yes','no','SRC-0779','accepted','NONE'),
('V1-CS-1546','WCD10-B19-S101','V1-CARD-0784','SRC-0261','B','bibliography_or_bounded_description','yes','no','SRC-0261','accepted','NONE'),
('V1-CS-1547','WCD10-B19-S102','V1-CARD-0784','SRC-0262','A','bibliography_or_bounded_description','yes','no','SRC-0262','accepted','NONE'),
('V1-CS-1548','WCD10-B19-S102','V1-CARD-0785','SRC-0262','A','bibliography_or_bounded_description','yes','no','SRC-0262','accepted','NONE'),
('V1-CS-1549','WCD10-B19-S104','V1-CARD-0785','SRC-0778','B','bibliography_or_bounded_description','no','no','SRC-0778','accepted','NONE'),
('V1-CS-1550','WCD10-B19-S102','V1-CARD-0786','SRC-0262','A','bibliography_or_bounded_description','yes','no','SRC-0262','accepted','NONE'),
('V1-CS-1551','WCD10-B19-S103','V1-CARD-0786','SRC-0777','B','bibliography_or_bounded_description','yes','no','SRC-0777','accepted','NONE'),
('V1-CS-1552','WCD10-B19-S201','V1-CARD-0787','SRC-0780','B','bibliography_or_bounded_description','yes','no','SRC-0780','accepted','NONE'),
('V1-CS-1553','WCD10-B19-S202','V1-CARD-0788','SRC-0781','B','bibliography_or_bounded_description','yes','no','SRC-0781','accepted','NONE'),
('V1-CS-1554','WCD10-B19-S203','V1-CARD-0789','SRC-0782','B','bibliography_or_bounded_description','yes','no','SRC-0782','accepted','NONE'),
('V1-CS-1555','WCD10-B19-S204','V1-CARD-0790','SRC-0783','B','bibliography_or_bounded_description','yes','no','SRC-0783','accepted','NONE'),
('V1-CS-1556','WCD10-B19-S206','V1-CARD-0791','SRC-0264','B','bibliography_or_bounded_description','no','no','SRC-0264','accepted','NONE'),
('V1-CS-1557','WCD10-B19-S207','V1-CARD-0792','SRC-0265','B','bibliography_or_bounded_description','no','no','SRC-0265','accepted','NONE'),
('V1-CS-1558','WCD10-B19-S208','V1-CARD-0793','SRC-0266','B','bibliography_or_bounded_description','no','no','SRC-0266','accepted','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0739','WCD-10-B19','WCD10-B19-W001-CREATED','V1-ENT-0334','CREATED','V1-ENT-0767','雷纳尔多·阿雷纳斯创作 El palacio de las blanquísimas mofetas','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0740','WCD-10-B19','WCD10-B19-W002-CREATED','V1-ENT-0334','CREATED','V1-ENT-0768','雷纳尔多·阿雷纳斯创作 Otra vez el mar','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0741','WCD-10-B19','WCD10-B19-W003-CREATED','V1-ENT-0334','CREATED','V1-ENT-0769','雷纳尔多·阿雷纳斯创作 El color del verano','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0742','WCD-10-B19','WCD10-B19-W004-CREATED','V1-ENT-0334','CREATED','V1-ENT-0770','雷纳尔多·阿雷纳斯创作 El asalto','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0743','WCD-10-B19','WCD10-B19-W005-CREATED','V1-ENT-0334','CREATED','V1-ENT-0771','雷纳尔多·阿雷纳斯创作 El portero','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0744','WCD-10-B19','WCD10-B19-W101-CREATED','V1-ENT-0344','CREATED','V1-ENT-0772','路易斯·塞普尔维达创作 Nombre de torero','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0745','WCD-10-B19','WCD10-B19-W102-CREATED','V1-ENT-0344','CREATED','V1-ENT-0773','路易斯·塞普尔维达创作 Patagonia Express','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0746','WCD-10-B19','WCD10-B19-W103-CREATED','V1-ENT-0344','CREATED','V1-ENT-0774','路易斯·塞普尔维达创作 Desencuentros','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0747','WCD-10-B19','WCD10-B19-W104-CREATED','V1-ENT-0344','CREATED','V1-ENT-0775','路易斯·塞普尔维达创作 Diario de un killer sentimental seguido de Yacaré','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0748','WCD-10-B19','WCD10-B19-W201-CREATED','V1-ENT-0345','CREATED','V1-ENT-0776','瓜达卢佩·内特尔创作 El huésped','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0749','WCD-10-B19','WCD10-B19-W202-CREATED','V1-ENT-0345','CREATED','V1-ENT-0777','瓜达卢佩·内特尔创作 El cuerpo en que nací','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0750','WCD-10-B19','WCD10-B19-W203-CREATED','V1-ENT-0345','CREATED','V1-ENT-0778','瓜达卢佩·内特尔创作 Después del invierno','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0751','WCD-10-B19','WCD10-B19-W204-CREATED','V1-ENT-0345','CREATED','V1-ENT-0779','瓜达卢佩·内特尔创作 Los divagantes','high','accepted','Codex-parent-independent-review:PASS','2','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0739','SRC-0771'),
('V1-REL-0740','SRC-0771'),
('V1-REL-0741','SRC-0771'),
('V1-REL-0741','SRC-0772'),
('V1-REL-0742','SRC-0771'),
('V1-REL-0743','SRC-0771'),
('V1-REL-0743','SRC-0773'),
('V1-REL-0744','SRC-0262'),
('V1-REL-0744','SRC-0261'),
('V1-REL-0744','SRC-0779'),
('V1-REL-0745','SRC-0262'),
('V1-REL-0745','SRC-0261'),
('V1-REL-0746','SRC-0262'),
('V1-REL-0746','SRC-0778'),
('V1-REL-0747','SRC-0777'),
('V1-REL-0747','SRC-0262'),
('V1-REL-0748','SRC-0780'),
('V1-REL-0748','SRC-0263'),
('V1-REL-0749','SRC-0781'),
('V1-REL-0749','SRC-0263'),
('V1-REL-0750','SRC-0782'),
('V1-REL-0750','SRC-0263'),
('V1-REL-0751','SRC-0783'),
('V1-REL-0751','SRC-0263');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-1104','V1-REL-0739','WCD10-B19-S001','SRC-0771','Reinaldo Arenas | PlanetadeLibros','2026-10-14实际打开。第9-13行作者介绍并称Tusquets出版的pentagonía由Celestino antes del alba、El palacio de las blanquísimas mofetas、Otra vez el mar、El color del verano、El asalto构成；第12行亦将El mundo alucinante、El portero列为小说。第25-70行相关作品目录可交叉核验题名与novela分类。','雷纳尔多·阿雷纳斯创作 El palacio de las blanquísimas mofetas','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1105','V1-REL-0740','WCD10-B19-S001','SRC-0771','Reinaldo Arenas | PlanetadeLibros','2026-10-14实际打开。第9-13行作者介绍并称Tusquets出版的pentagonía由Celestino antes del alba、El palacio de las blanquísimas mofetas、Otra vez el mar、El color del verano、El asalto构成；第12行亦将El mundo alucinante、El portero列为小说。第25-70行相关作品目录可交叉核验题名与novela分类。','雷纳尔多·阿雷纳斯创作 Otra vez el mar','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1106','V1-REL-0741','WCD10-B19-S001','SRC-0771','Reinaldo Arenas | PlanetadeLibros','2026-10-14实际打开。第9-13行作者介绍并称Tusquets出版的pentagonía由Celestino antes del alba、El palacio de las blanquísimas mofetas、Otra vez el mar、El color del verano、El asalto构成；第12行亦将El mundo alucinante、El portero列为小说。第25-70行相关作品目录可交叉核验题名与novela分类。','雷纳尔多·阿雷纳斯创作 El color del verano','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1107','V1-REL-0741','WCD10-B19-S002','SRC-0772','El color del verano - Reinaldo Arenas | PlanetadeLibros','2026-10-14实际打开。第16-23行书名、作者与简介，写古巴岛上为独裁者在位五十周年举行狂欢节及地下青年生活；第51-64行现版技术书目（1999版），第67-70行作者简介和pentagonía归属。','雷纳尔多·阿雷纳斯创作 El color del verano','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1108','V1-REL-0742','WCD10-B19-S001','SRC-0771','Reinaldo Arenas | PlanetadeLibros','2026-10-14实际打开。第9-13行作者介绍并称Tusquets出版的pentagonía由Celestino antes del alba、El palacio de las blanquísimas mofetas、Otra vez el mar、El color del verano、El asalto构成；第12行亦将El mundo alucinante、El portero列为小说。第25-70行相关作品目录可交叉核验题名与novela分类。','雷纳尔多·阿雷纳斯创作 El asalto','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1109','V1-REL-0743','WCD10-B19-S001','SRC-0771','Reinaldo Arenas | PlanetadeLibros','2026-10-14实际打开。第9-13行作者介绍并称Tusquets出版的pentagonía由Celestino antes del alba、El palacio de las blanquísimas mofetas、Otra vez el mar、El color del verano、El asalto构成；第12行亦将El mundo alucinante、El portero列为小说。第25-70行相关作品目录可交叉核验题名与novela分类。','雷纳尔多·阿雷纳斯创作 El portero','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1110','V1-REL-0743','WCD10-B19-S003','SRC-0773','El portero - Reinaldo Arenas | PlanetadeLibros','2026-10-14实际打开。第16-23行书名、作者及简介：纽约写作（1984-1986）、大楼微观社会和古巴流亡门卫；第54-66行现版书目（2004年Tusquets版）及Novela literaria分类。','雷纳尔多·阿雷纳斯创作 El portero','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1111','V1-REL-0744','WCD10-B19-S102','SRC-0262','La narrativa del chileno Luis Sepúlveda','实读2026-10-14，PDF第1页/Lines 59–71：列四部初期作品的年份，明确Nombre de torero小说、Patagonia Express旅行叙事；第61–65行列Desencuentros (1997)故事集与两篇Diario…/Yacaré (1998)。','路易斯·塞普尔维达创作 Nombre de torero','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1112','V1-REL-0744','WCD10-B19-S101','SRC-0261','Sepúlveda, Luis','实读2026-10-14：网页“Referencias bibliográficas de Sepúlveda, Luis”逐项列出Nombre de torero（Barcelona: Tusquets, 1994）、Patagonia express（Barcelona: Tusquets, 1995）及Diario de un killer sentimental; Seguido de Yacaré（Barcelona: Tusquets, 1998），并列Un viejo…1989。','路易斯·塞普尔维达创作 Nombre de torero','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1113','V1-REL-0744','WCD10-B19-S105','SRC-0779','Nombre de torero — PlanetadeLibros / Tusquets','实读2026-10-14：第18–25行列出作品作者及书商梗概，纳粹时期失窃金币、柏林墙倒塌近五十年后、Juan Belmonte与Frank Galinsky被分别雇用；第67–80行技术资料列主题Novela literaria、出版日期1994-10-01、Tusquets出版社及ISBN。此出版日期记录版本数据，不将该书目字段表述为作者首版年份。','路易斯·塞普尔维达创作 Nombre de torero','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1114','V1-REL-0745','WCD10-B19-S102','SRC-0262','La narrativa del chileno Luis Sepúlveda','实读2026-10-14，PDF第1页/Lines 59–71：列四部初期作品的年份，明确Nombre de torero小说、Patagonia Express旅行叙事；第61–65行列Desencuentros (1997)故事集与两篇Diario…/Yacaré (1998)。','路易斯·塞普尔维达创作 Patagonia Express','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1115','V1-REL-0745','WCD10-B19-S101','SRC-0261','Sepúlveda, Luis','实读2026-10-14：网页“Referencias bibliográficas de Sepúlveda, Luis”逐项列出Nombre de torero（Barcelona: Tusquets, 1994）、Patagonia express（Barcelona: Tusquets, 1995）及Diario de un killer sentimental; Seguido de Yacaré（Barcelona: Tusquets, 1998），并列Un viejo…1989。','路易斯·塞普尔维达创作 Patagonia Express','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1116','V1-REL-0746','WCD10-B19-S102','SRC-0262','La narrativa del chileno Luis Sepúlveda','实读2026-10-14，PDF第1页/Lines 59–71：列四部初期作品的年份，明确Nombre de torero小说、Patagonia Express旅行叙事；第61–65行列Desencuentros (1997)故事集与两篇Diario…/Yacaré (1998)。','路易斯·塞普尔维达创作 Desencuentros','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1117','V1-REL-0746','WCD10-B19-S104','SRC-0778','Desencuentros — Tusquets','实读2026-10-14，Tusquets出版社新闻材料第0–7行标识作品和出版社；第9–17行说明该书汇集作者挑选的早期与未刊故事；第21–29行称为27篇故事并概述其围绕愿望、情感、友谊与命运错位展开；第40–46行作者简介将Desencuentros列为故事集。资料出版日期为2013-02-14，视为该资料所载再版/版本日期，不据此推断首版年。','路易斯·塞普尔维达创作 Desencuentros','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1118','V1-REL-0747','WCD10-B19-S103','SRC-0777','Diario de un Killer sentimental seguido de Yacaré — Tusquets','实读2026-10-14，Tusquets出版社新闻材料第0–20行载书目日期1998-06-01、将两篇称为短篇小说并概述其犯罪故事；第26–30行作者简介分类为故事集。仅采该版发布日，不将其误作作品首版年。','路易斯·塞普尔维达创作 Diario de un killer sentimental seguido de Yacaré','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1119','V1-REL-0747','WCD10-B19-S102','SRC-0262','La narrativa del chileno Luis Sepúlveda','实读2026-10-14，PDF第1页/Lines 59–71：列四部初期作品的年份，明确Nombre de torero小说、Patagonia Express旅行叙事；第61–65行列Desencuentros (1997)故事集与两篇Diario…/Yacaré (1998)。','路易斯·塞普尔维达创作 Diario de un killer sentimental seguido de Yacaré','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1120','V1-REL-0748','WCD10-B19-S201','SRC-0780','El huésped','实读2026-10-14，页面第61–73行标题、作者、小说形态与出版社简介；第95–97行该页面版本出版日期2006-01-01。','瓜达卢佩·内特尔创作 El huésped','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1121','V1-REL-0748','WCD10-B19-S205','SRC-0263','Guadalupe Nettel','实读2026-10-14，作者目录第62行列举《El huésped》《Pétalos y otras historias incómodas》《El cuerpo en que nací》《Después del invierno》《La hija única》《Los divagantes》及作者归属；用于交叉核对书目与作者。','瓜达卢佩·内特尔创作 El huésped','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1122','V1-REL-0749','WCD10-B19-S202','SRC-0781','El cuerpo en que nací','实读2026-10-14，页面第61–74行标题、作者、出版社简介及“novela”；第103–105行该页面版本出版日期2011-10-01。','瓜达卢佩·内特尔创作 El cuerpo en que nací','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1123','V1-REL-0749','WCD10-B19-S205','SRC-0263','Guadalupe Nettel','实读2026-10-14，作者目录第62行列举《El huésped》《Pétalos y otras historias incómodas》《El cuerpo en que nací》《Después del invierno》《La hija única》《Los divagantes》及作者归属；用于交叉核对书目与作者。','瓜达卢佩·内特尔创作 El cuerpo en que nací','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1124','V1-REL-0750','WCD10-B19-S203','SRC-0782','Después del invierno','实读2026-10-14，页面第73–76行小说体裁与限缩简介；第104–106行出版社版本出版日期2014-11-19。','瓜达卢佩·内特尔创作 Después del invierno','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1125','V1-REL-0750','WCD10-B19-S205','SRC-0263','Guadalupe Nettel','实读2026-10-14，作者目录第62行列举《El huésped》《Pétalos y otras historias incómodas》《El cuerpo en que nací》《Después del invierno》《La hija única》《Los divagantes》及作者归属；用于交叉核对书目与作者。','瓜达卢佩·内特尔创作 Después del invierno','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1126','V1-REL-0751','WCD10-B19-S204','SRC-0783','Los divagantes','实读2026-10-14，页面第78–81行八篇故事与内容概述；第113–115行页面版本日期2023-09-06。','瓜达卢佩·内特尔创作 Los divagantes','high','eligible_evidence','WCD-10-B19'),
('V1-EV-1127','V1-REL-0751','WCD10-B19-S205','SRC-0263','Guadalupe Nettel','实读2026-10-14，作者目录第62行列举《El huésped》《Pétalos y otras historias incómodas》《El cuerpo en que nací》《Después del invierno》《La hija única》《Los divagantes》及作者归属；用于交叉核对书目与作者。','瓜达卢佩·内特尔创作 Los divagantes','high','eligible_evidence','WCD-10-B19');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0634','WCD-10-B19-G01','research_gap','WCD10:B19:Nettel:bounded_uncovered_roster','open','本轮采用出版社直接书目补主要小说与集子并补现有核心对象简介；不追求全集或版本穷尽，未逐项登记的边缘/合集身份保持未决。','','Independent Reviewer: preserve deferred_research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0635','WCD-10-B19:V1-ENT-0341','research_gap','WCD10:work_level_research:V1-ENT-0341','open','仅有既有catalog/institutional commentary来源的限制；不作为学术覆盖完整结论。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0636','WCD-10-B19:V1-ENT-0342','research_gap','WCD10:work_level_research:V1-ENT-0342','open','仅有既有catalog/institutional commentary来源的限制；不作为学术覆盖完整结论。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0637','WCD-10-B19:V1-ENT-0343','research_gap','WCD10:work_level_research:V1-ENT-0343','open','仅有既有catalog/institutional commentary来源的限制；不作为学术覆盖完整结论。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0638','WCD-10-B19:WCD10-B19-W001','research_gap','WCD10:work_level_research:V1-ENT-0767','open','出版者目录提供普通书目/简介依据；原始首版年或更细研究阐释仍未证，保留空缺。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0639','WCD-10-B19:WCD10-B19-W002','research_gap','WCD10:work_level_research:V1-ENT-0768','open','出版者目录提供普通书目/简介依据；原始首版年或更细研究阐释仍未证，保留空缺。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0640','WCD-10-B19:WCD10-B19-W003','research_gap','WCD10:work_level_research:V1-ENT-0769','open','出版者目录提供普通书目/简介依据；原始首版年或更细研究阐释仍未证，保留空缺。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0641','WCD-10-B19:WCD10-B19-W004','research_gap','WCD10:work_level_research:V1-ENT-0770','open','出版者目录提供普通书目/简介依据；原始首版年或更细研究阐释仍未证，保留空缺。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0642','WCD-10-B19:WCD10-B19-W005','research_gap','WCD10:work_level_research:V1-ENT-0771','open','出版者目录提供普通书目/简介依据；原始首版年或更细研究阐释仍未证，保留空缺。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0643','WCD-10-B19:V1-ENT-0347','research_gap','WCD10:work_level_research:V1-ENT-0347','open','既有书目仅代表历史已收录，不表示完整目录。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0644','WCD-10-B19:V1-ENT-0348','research_gap','WCD10:work_level_research:V1-ENT-0348','open','既有书目仅代表历史已收录，不表示完整目录。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0645','WCD-10-B19:V1-ENT-0349','research_gap','WCD10:work_level_research:V1-ENT-0349','open','既有书目仅代表历史已收录，不表示完整目录。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0646','WCD-10-B19:WCD10-B19-W101','research_gap','WCD10:work_level_research:V1-ENT-0772','open','本轮只纳入来源可直接支持的重点作品，不声称目录穷尽或学术研究覆盖完整。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0647','WCD-10-B19:WCD10-B19-W102','research_gap','WCD10:work_level_research:V1-ENT-0773','open','本轮只纳入来源可直接支持的重点作品，不声称目录穷尽或学术研究覆盖完整。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0648','WCD-10-B19:WCD10-B19-W103','research_gap','WCD10:work_level_research:V1-ENT-0774','open','本轮只纳入来源可直接支持的重点作品，不声称目录穷尽或学术研究覆盖完整。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0649','WCD-10-B19:WCD10-B19-W104','research_gap','WCD10:work_level_research:V1-ENT-0775','open','本轮只纳入来源可直接支持的重点作品，不声称目录穷尽或学术研究覆盖完整。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0650','WCD-10-B19:V1-ENT-0350','research_gap','WCD10:work_level_research:V1-ENT-0350','open','已按本轮出版社直接来源增补短简介；不代表全集或学术研究覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0651','WCD-10-B19:V1-ENT-0351','research_gap','WCD10:work_level_research:V1-ENT-0351','open','已按本轮出版社直接来源增补短简介；不代表全集或学术研究覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0652','WCD-10-B19:V1-ENT-0352','research_gap','WCD10:work_level_research:V1-ENT-0352','open','已按本轮出版社直接来源增补短简介；不代表全集或学术研究覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0653','WCD-10-B19:WCD10-B19-W201','research_gap','WCD10:work_level_research:V1-ENT-0776','open','单一出版社目录直接支持书目、体裁与有界简介；未声称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0654','WCD-10-B19:WCD10-B19-W202','research_gap','WCD10:work_level_research:V1-ENT-0777','open','单一出版社目录直接支持书目、体裁与有界简介；未声称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0655','WCD-10-B19:WCD10-B19-W203','research_gap','WCD10:work_level_research:V1-ENT-0778','open','单一出版社目录直接支持书目、体裁与有界简介；未声称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0656','WCD-10-B19:WCD10-B19-W204','research_gap','WCD10:work_level_research:V1-ENT-0779','open','单一出版社目录直接支持书目、体裁与有界简介；未声称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');

UPDATE metadata SET value='WCD-10-B19' WHERE key='last_change_set';

UPDATE metadata SET value='2026-10-14' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 781 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 777 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 775 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 793 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2610 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 3233 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2589 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1550 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 749 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 1164 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 1135 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 656 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
