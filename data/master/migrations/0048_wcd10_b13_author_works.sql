-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: Codex-parent-independent-review

-- Registration sha256: f42bb5195b490dcf4d0b02618c2ed094a9c62903b8593f1bc6ec6749bbc11ccc

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2149 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1317 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 639 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 658 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 656 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 2656 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2170 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 462 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 47 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 952 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 981 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 627 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 700 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B12' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0703' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/los-detectives-salvajes/9788433910868/NH_256') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0704' OR canonical_url='https://www.anagrama-ed.es/libro/compactos/2666/9788433973184/CM_462') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0705' OR canonical_url='https://www.anagrama-ed.es/libro/compactos/estrella-distante/9788433966735/CM_242') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0706' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/la-literatura-nazi-en-america/9788433972194/NH_480') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0707' OR canonical_url='https://www.anagrama-ed.es/libro/compactos/amuleto/9788433973559/CM_499') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0708' OR canonical_url='https://www.anagrama-ed.es/libro/compactos/nocturno-de-chile/9788433977489/CM_645') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0709' OR canonical_url='https://www.anagrama-ed.es/libro/compactos/el-gaucho-insufrible/9788433973252/CM_469') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0710' OR canonical_url='https://www.anagrama-ed.es/libro/compactos/la-pista-de-hielo/9788433977038/CM_601') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0711' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/llamadas-telefonicas/9788433910660/NH_236') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0712' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/putas-asesinas/9788433924858/NH_314') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0713' OR canonical_url='https://www.sigloxxieditores.com/libro/memoria-del-fuego-2-las-caras-y-las-mascaras_53908/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0714' OR canonical_url='https://www.sigloxxieditores.com/libro/memoria-del-fuego-3-el-siglo-del-viento_53910/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0715' OR canonical_url='https://www.sigloxxieditores.com/libro/el-libro-de-los-abrazos_53558/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0716' OR canonical_url='https://www.sigloxxieditores.com/libro/el-futbol-a-sol-y-sombra_53031/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0717' OR canonical_url='https://www.sigloxxieditores.com/libro/las-venas-abiertas-de-america-latina_52766/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0718' OR canonical_url='https://www.sigloxxieditores.com/libro/memoria-del-fuego-1-los-nacimientos_53906/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0719' OR canonical_url='https://www.sigloxxieditores.com/libro/espejos_16488/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0720' OR canonical_url='https://piglia.pubpub.org/bio') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0721' OR canonical_url='https://www.anagrama-ed.es/autor/piglia-ricardo-856') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0722' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/la-ciudad-ausente/9788433968418/NH_340') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0723' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/el-camino-de-ida/9788433997647/NH_517') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0724' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/los-casos-del-comisario-croce/9788433998606/NH_611') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0661' OR (entity_type='work' AND original_name='La literatura nazi en América')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0662' OR (entity_type='work' AND original_name='Amuleto')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0663' OR (entity_type='work' AND original_name='Nocturno de Chile')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0664' OR (entity_type='collection' AND original_name='El gaucho insufrible')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0665' OR (entity_type='work' AND original_name='La pista de hielo')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0666' OR (entity_type='collection' AND original_name='Llamadas telefónicas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0667' OR (entity_type='collection' AND original_name='Putas asesinas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0668' OR (entity_type='work' AND original_name='Los días siguientes')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0669' OR (entity_type='work' AND original_name='El fútbol a sol y sombra')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0670' OR (entity_type='collection' AND original_name='Memoria del fuego II. Las caras y las máscaras')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0671' OR (entity_type='collection' AND original_name='Memoria del fuego III. El siglo del viento')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0672' OR (entity_type='work' AND original_name='Espejos. Una historia casi universal')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0673' OR (entity_type='work' AND original_name='La ciudad ausente')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0674' OR (entity_type='work' AND original_name='El camino de ida')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0675' OR (entity_type='collection' AND original_name='Los casos del comisario Croce')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0676' OR (entity_type='collection' AND original_name='La invasión')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0677' OR (entity_type='collection' AND original_name='Nombre falso')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0678' OR (entity_type='collection' AND original_name='Prisión perpetua')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0679' OR (entity_type='collection' AND original_name='Crítica y ficción')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0680' OR (entity_type='work' AND original_name='Formas breves')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0681' OR (entity_type='work' AND original_name='El último lector')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0682' OR (entity_type='work' AND original_name='Los diarios de Emilio Renzi. Años de formación')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0683' OR (entity_type='work' AND original_name='Los diarios de Emilio Renzi. Los años felices')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0684' OR (entity_type='work' AND original_name='Los diarios de Emilio Renzi. Un día en la vida')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2177' OR (subject_id='V1-ENT-0661' AND fact_field='genre_or_form' AND value_text='仿文学辞典形式的虚构作品集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2178' OR (subject_id='V1-ENT-0661' AND fact_field='first_publication_year' AND value_text='1996')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2179' OR (subject_id='V1-ENT-0661' AND fact_field='one_sentence_summary' AND value_text='出版方称本书仿照文学辞典，以虚构作家的生平与作品条目构成一部“伪装成手册的虚构作品”，并戏仿伊比利亚美洲文学史。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2180' OR (subject_id='V1-ENT-0662' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2181' OR (subject_id='V1-ENT-0662' AND fact_field='first_publication_year' AND value_text='1999')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2182' OR (subject_id='V1-ENT-0662' AND fact_field='one_sentence_summary' AND value_text='出版方简介由乌拉圭人Auxilio Lacouture的声音展开：她在1968年墨西哥大学遭警方占领时躲入女厕，并回望在墨西哥的生活。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2183' OR (subject_id='V1-ENT-0663' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2184' OR (subject_id='V1-ENT-0663' AND fact_field='first_publication_year' AND value_text='2000')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2185' OR (subject_id='V1-ENT-0663' AND fact_field='one_sentence_summary' AND value_text='出版方简介写神父兼文学评论家Sebastián Urrutia Lacroix在一场高烧之夜回顾人生，并触及智利文学圈和戒严下圣地亚哥的生活。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2186' OR (subject_id='V1-ENT-0664' AND fact_field='genre_or_form' AND value_text='短篇小说集与演讲合集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2187' OR (subject_id='V1-ENT-0664' AND fact_field='first_publication_year' AND value_text='2003')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2188' OR (subject_id='V1-ENT-0664' AND fact_field='one_sentence_summary' AND value_text='出版方说明本书收录五篇小说和两篇演讲，简介举及阿根廷律师转为潘帕斯高乔人、下水道侦探及虚构作家等故事。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2189' OR (subject_id='V1-ENT-0665' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2190' OR (subject_id='V1-ENT-0665' AND fact_field='first_publication_year' AND value_text='1993')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2191' OR (subject_id='V1-ENT-0665' AND fact_field='one_sentence_summary' AND value_text='出版方简介以一宗犯罪的三种叙述为线索，分别由一名智利写作者、一名在露营地做夜间保安的墨西哥诗人和一名加泰罗尼亚商人讲述。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2192' OR (subject_id='V1-ENT-0666' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2193' OR (subject_id='V1-ENT-0666' AND fact_field='first_publication_year' AND value_text='1997')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2194' OR (subject_id='V1-ENT-0666' AND fact_field='one_sentence_summary' AND value_text='Sensini、Joanna Silvestri、Henry Simon Leprince等故事以作家、流亡经历和现实与虚构交错为线索，出版方简介概述其开放叙事及文学互文。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2195' OR (subject_id='V1-ENT-0667' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2196' OR (subject_id='V1-ENT-0667' AND fact_field='first_publication_year' AND value_text='2001')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2197' OR (subject_id='V1-ENT-0667' AND fact_field='one_sentence_summary' AND value_text='出版方简介提及阿卡普尔科之旅、足球故事、与毒品和电影有关的故事，以及重现《荒野侦探》人物Arturo Belano的篇章。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2198' OR (subject_id='V1-ENT-0668' AND fact_field='first_publication_year' AND value_text='1963')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2199' OR (subject_id='V1-ENT-0668' AND fact_field='genre_or_form' AND value_text='小说（作者首部小说）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2200' OR (subject_id='V1-ENT-0668' AND fact_field='one_sentence_summary' AND value_text='Uruguay Educa将其记为Galeano于1963年出版的首部小说；现有来源未给出情节，简介限于作品书目位置。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2201' OR (subject_id='V1-ENT-0668' AND fact_field='bibliographic_note' AND value_text='Uruguay Educa列出《Los días siguientes》（1963），并说明这是Galeano的第一部小说。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2202' OR (subject_id='V1-ENT-0669' AND fact_field='first_publication_year' AND value_text='1995')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2203' OR (subject_id='V1-ENT-0669' AND fact_field='genre_or_form' AND value_text='足球主题散文/叙事')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2204' OR (subject_id='V1-ENT-0669' AND fact_field='one_sentence_summary' AND value_text='作品一面礼赞足球，一面揭示这项商业产业中的权力结构，并批评职业体育的技术官僚化压抑快乐、想象与冒险。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2205' OR (subject_id='V1-ENT-0669' AND fact_field='bibliographic_note' AND value_text='Uruguay Educa年表列1995年；出版社当前页提供后续版本资料，不能据再版日期改定初版年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2206' OR (subject_id='V1-ENT-0670' AND fact_field='first_publication_year' AND value_text='1984')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2207' OR (subject_id='V1-ENT-0670' AND fact_field='genre_or_form' AND value_text='历史叙事卷册')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2208' OR (subject_id='V1-ENT-0670' AND fact_field='one_sentence_summary' AND value_text='三部曲第二卷以一系列有文献依据的故事呈现拉丁美洲18至19世纪的独立战争、革命和国家形成。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2209' OR (subject_id='V1-ENT-0670' AND fact_field='bibliographic_note' AND value_text='Uruguay Educa年表记录作品年；Siglo XXI页面打开的是后续版（2024年），本候选不以出版社再版年替代首版年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2210' OR (subject_id='V1-ENT-0671' AND fact_field='first_publication_year' AND value_text='1986')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2211' OR (subject_id='V1-ENT-0671' AND fact_field='genre_or_form' AND value_text='历史叙事卷册')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2212' OR (subject_id='V1-ENT-0671' AND fact_field='one_sentence_summary' AND value_text='三部曲第三卷以日常小故事叙述美洲20世纪的动荡，尝试让历史脱离静止的纪念叙述并重新进入当下。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2213' OR (subject_id='V1-ENT-0671' AND fact_field='bibliographic_note' AND value_text='Uruguay Educa年表记录作品年；Siglo XXI页面打开的是后续版（2024年），本候选不以出版社再版年替代首版年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2214' OR (subject_id='V1-ENT-0672' AND fact_field='first_publication_year' AND value_text='2008')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2215' OR (subject_id='V1-ENT-0672' AND fact_field='genre_or_form' AND value_text='历史叙事/散文')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2216' OR (subject_id='V1-ENT-0672' AND fact_field='one_sentence_summary' AND value_text='作品将过去与现在连接，转向被忽略的普通人、女性以及南方和东方等群体。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2217' OR (subject_id='V1-ENT-0672' AND fact_field='bibliographic_note' AND value_text='Uruguay Educa年表记录2008年；Siglo XXI出版社页面也列2008版信息。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2218' OR (subject_id='V1-ENT-0673' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2219' OR (subject_id='V1-ENT-0673' AND fact_field='one_sentence_summary' AND value_text='Junior追索线索进入一个不断消失、又由秘密故事构成的布宜诺斯艾利斯；出版社将作品描述为交织爱情、政治与城市叙事的小说。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2220' OR (subject_id='V1-ENT-0673' AND fact_field='first_publication_year' AND value_text='1992')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2221' OR (subject_id='V1-ENT-0673' AND fact_field='bibliographic_note' AND value_text='Piglia作者档案将 La ciudad ausente 列为1992年小说；本包所查Anagrama版本页面标示2003年3月1日出版（ISBN 978-84-339-6841-8）。两者分别记录作品目录年份与该版日期。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2222' OR (subject_id='V1-ENT-0674' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2223' OR (subject_id='V1-ENT-0674' AND fact_field='one_sentence_summary' AND value_text='Emilio Renzi赴新泽西大学授课后卷入Ida Brown之死及针对学界人士的袭击调查；出版社称小说在侦探叙事中交织情感关系与重塑人生的主题。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2224' OR (subject_id='V1-ENT-0674' AND fact_field='first_publication_year' AND value_text='2013')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2225' OR (subject_id='V1-ENT-0674' AND fact_field='bibliographic_note' AND value_text='作者档案与Anagrama页面均记录2013年；Anagrama版页面标示2013年9月4日出版（ISBN 978-84-339-9764-7）。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2226' OR (subject_id='V1-ENT-0675' AND fact_field='genre_or_form' AND value_text='侦探短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2227' OR (subject_id='V1-ENT-0675' AND fact_field='one_sentence_summary' AND value_text='作品由警长Croce处理的一组疑案构成，包括港口命案、疑似涉及Eva Perón的影片谜团及珠宝盗窃案；出版社称其致意于侦探小说传统。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2228' OR (subject_id='V1-ENT-0675' AND fact_field='first_publication_year' AND value_text='2018')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2229' OR (subject_id='V1-ENT-0675' AND fact_field='bibliographic_note' AND value_text='Piglia作者档案列2018年；Anagrama版页面标示2018年9月12日出版（ISBN 978-84-339-9860-6）。出版方将该书称为警探短篇故事集。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2230' OR (subject_id='V1-ENT-0676' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2231' OR (subject_id='V1-ENT-0676' AND fact_field='one_sentence_summary' AND value_text='作者作品目录将 La invasión 列为短篇小说集，并记录其出版年份为 1967；本条仅说明体裁与书目身份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2232' OR (subject_id='V1-ENT-0676' AND fact_field='first_publication_year' AND value_text='1967')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2233' OR (subject_id='V1-ENT-0676' AND fact_field='bibliographic_note' AND value_text='Piglia作者档案分别列 Jaulario 与 La invasión，均为1967年；本包仅收《La invasión》对象，不据该目录认定两书等同或仅为版本关系。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2234' OR (subject_id='V1-ENT-0677' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2235' OR (subject_id='V1-ENT-0677' AND fact_field='one_sentence_summary' AND value_text='作者作品目录将 Nombre falso 列为短篇小说集，并记录其出版年份为 1975；本条仅说明体裁与书目身份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2236' OR (subject_id='V1-ENT-0677' AND fact_field='first_publication_year' AND value_text='1975')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2237' OR (subject_id='V1-ENT-0677' AND fact_field='bibliographic_note' AND value_text='作者作品目录列为短篇小说集，书目年份为1975。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2238' OR (subject_id='V1-ENT-0678' AND fact_field='genre_or_form' AND value_text='小说集（含两部中篇）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2239' OR (subject_id='V1-ENT-0678' AND fact_field='one_sentence_summary' AND value_text='作者作品目录将 Prisión perpetua 列为小说集（含两部中篇），并记录其出版年份为 1988；本条仅说明体裁与书目身份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2240' OR (subject_id='V1-ENT-0678' AND fact_field='first_publication_year' AND value_text='1988')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2241' OR (subject_id='V1-ENT-0678' AND fact_field='bibliographic_note' AND value_text='作者作品目录列为小说集（含两部中篇），书目年份为1988。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2242' OR (subject_id='V1-ENT-0679' AND fact_field='genre_or_form' AND value_text='评论与访谈集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2243' OR (subject_id='V1-ENT-0679' AND fact_field='one_sentence_summary' AND value_text='作者作品目录将 Crítica y ficción 列为评论与访谈集，并记录其出版年份为 1986；本条仅说明体裁与书目身份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2244' OR (subject_id='V1-ENT-0679' AND fact_field='first_publication_year' AND value_text='1986')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2245' OR (subject_id='V1-ENT-0679' AND fact_field='bibliographic_note' AND value_text='作者作品目录列为评论与访谈集，书目年份为1986。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2246' OR (subject_id='V1-ENT-0680' AND fact_field='genre_or_form' AND value_text='文学评论')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2247' OR (subject_id='V1-ENT-0680' AND fact_field='one_sentence_summary' AND value_text='作者作品目录将 Formas breves 列为文学评论，并记录其出版年份为 1999；本条仅说明体裁与书目身份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2248' OR (subject_id='V1-ENT-0680' AND fact_field='bibliographic_note' AND value_text='作者档案简介将 Formas breves 列为2000年；作品目录第85行列1999年。年份口径未解，本包不填写原子首版年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2249' OR (subject_id='V1-ENT-0681' AND fact_field='genre_or_form' AND value_text='文学评论')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2250' OR (subject_id='V1-ENT-0681' AND fact_field='one_sentence_summary' AND value_text='作者作品目录将 El último lector 列为文学评论，并记录其出版年份为 2005；本条仅说明体裁与书目身份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2251' OR (subject_id='V1-ENT-0681' AND fact_field='first_publication_year' AND value_text='2005')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2252' OR (subject_id='V1-ENT-0681' AND fact_field='bibliographic_note' AND value_text='作者作品目录列为文学评论，书目年份为2005。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2253' OR (subject_id='V1-ENT-0682' AND fact_field='genre_or_form' AND value_text='日记／自传性作品')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2254' OR (subject_id='V1-ENT-0682' AND fact_field='one_sentence_summary' AND value_text='作者作品目录将 Los diarios de Emilio Renzi. Años de formación 列为日记／自传性作品，并记录其出版年份为 2015；本条仅说明体裁与书目身份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2255' OR (subject_id='V1-ENT-0682' AND fact_field='first_publication_year' AND value_text='2015')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2256' OR (subject_id='V1-ENT-0682' AND fact_field='bibliographic_note' AND value_text='作者作品目录列为日记／自传性作品，书目年份为2015。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2257' OR (subject_id='V1-ENT-0683' AND fact_field='genre_or_form' AND value_text='日记／自传性作品')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2258' OR (subject_id='V1-ENT-0683' AND fact_field='one_sentence_summary' AND value_text='作者作品目录将 Los diarios de Emilio Renzi. Los años felices 列为日记／自传性作品，并记录其出版年份为 2016；本条仅说明体裁与书目身份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2259' OR (subject_id='V1-ENT-0683' AND fact_field='first_publication_year' AND value_text='2016')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2260' OR (subject_id='V1-ENT-0683' AND fact_field='bibliographic_note' AND value_text='作者作品目录列为日记／自传性作品，书目年份为2016。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2261' OR (subject_id='V1-ENT-0684' AND fact_field='genre_or_form' AND value_text='日记／自传性作品')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2262' OR (subject_id='V1-ENT-0684' AND fact_field='one_sentence_summary' AND value_text='作者作品目录将 Los diarios de Emilio Renzi. Un día en la vida 列为日记／自传性作品，并记录其出版年份为 2017；本条仅说明体裁与书目身份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2263' OR (subject_id='V1-ENT-0684' AND fact_field='first_publication_year' AND value_text='2017')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2264' OR (subject_id='V1-ENT-0684' AND fact_field='bibliographic_note' AND value_text='作者作品目录列为日记／自传性作品，书目年份为2017。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2265' OR (subject_id='V1-ENT-0269' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2266' OR (subject_id='V1-ENT-0269' AND fact_field='one_sentence_summary' AND value_text='两位诗人沿着寻找墨西哥女诗人塞萨雷娅·蒂纳赫罗的线索展开旅程；出版方简介称叙事跨越1976至1996年及多个国家。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2267' OR (subject_id='V1-ENT-0270' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2268' OR (subject_id='V1-ENT-0270' AND fact_field='one_sentence_summary' AND value_text='出版方简介以四位研究德国作家阿尔钦博尔迪的文学教授为线索，写他们前往虚构的圣特雷莎，并展开跨越两大洲和欧洲二十世纪历史的叙事。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2269' OR (subject_id='V1-ENT-0271' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2270' OR (subject_id='V1-ENT-0271' AND fact_field='one_sentence_summary' AND value_text='出版方简介围绕诗人鲁伊斯-塔格莱与飞行员魏德尔身份重合展开，叙述者在智利政变前后追索其暴力艺术实践。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2271' OR (subject_id='V1-ENT-0276' AND fact_field='one_sentence_summary' AND value_text='出版社简介称本卷以有文献依据的片段重述征服前至1700年的美洲历史，并写到原住民遭受的压迫。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2272' OR (subject_id='V1-ENT-0277' AND fact_field='genre_or_form' AND value_text='短篇叙事/图文散文')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2273' OR (subject_id='V1-ENT-0277' AND fact_field='one_sentence_summary' AND value_text='由庆典、逸事、编年、梦与记忆组成的短篇叙事，并结合作者版画和绘图。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2274' OR (subject_id='V1-ENT-0275' AND fact_field='one_sentence_summary' AND value_text='作者说明本书旨在传播被官方历史遮蔽或歪曲的事实，并以通俗、面向读者的方式讨论政治经济问题。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2275' OR (subject_id='V1-ENT-0278' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2276' OR (subject_id='V1-ENT-0278' AND fact_field='one_sentence_summary' AND value_text='作者作品目录将 Respiración artificial 列为小说，并列出相关版本信息；本条仅作体裁与书目范围说明。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2277' OR (subject_id='V1-ENT-0279' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2278' OR (subject_id='V1-ENT-0279' AND fact_field='one_sentence_summary' AND value_text='作者作品目录将 Plata quemada 列为小说，并列出相关版本信息；本条仅作体裁与书目范围说明。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2279' OR (subject_id='V1-ENT-0280' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2280' OR (subject_id='V1-ENT-0280' AND fact_field='one_sentence_summary' AND value_text='作者作品目录将 Blanco nocturno 列为小说，并列出相关版本信息；本条仅作体裁与书目范围说明。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0630' OR (subject_id='V1-ENT-0262' AND relation_type='CREATED' AND object_id='V1-ENT-0661')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0631' OR (subject_id='V1-ENT-0262' AND relation_type='CREATED' AND object_id='V1-ENT-0662')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0632' OR (subject_id='V1-ENT-0262' AND relation_type='CREATED' AND object_id='V1-ENT-0663')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0633' OR (subject_id='V1-ENT-0262' AND relation_type='CREATED' AND object_id='V1-ENT-0664')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0634' OR (subject_id='V1-ENT-0262' AND relation_type='CREATED' AND object_id='V1-ENT-0665')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0635' OR (subject_id='V1-ENT-0262' AND relation_type='CREATED' AND object_id='V1-ENT-0666')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0636' OR (subject_id='V1-ENT-0262' AND relation_type='CREATED' AND object_id='V1-ENT-0667')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0637' OR (subject_id='V1-ENT-0272' AND relation_type='CREATED' AND object_id='V1-ENT-0668')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0638' OR (subject_id='V1-ENT-0272' AND relation_type='CREATED' AND object_id='V1-ENT-0669')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0639' OR (subject_id='V1-ENT-0272' AND relation_type='CREATED' AND object_id='V1-ENT-0670')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0640' OR (subject_id='V1-ENT-0272' AND relation_type='CREATED' AND object_id='V1-ENT-0671')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0641' OR (subject_id='V1-ENT-0272' AND relation_type='CREATED' AND object_id='V1-ENT-0672')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0642' OR (subject_id='V1-ENT-0273' AND relation_type='CREATED' AND object_id='V1-ENT-0673')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0643' OR (subject_id='V1-ENT-0273' AND relation_type='CREATED' AND object_id='V1-ENT-0674')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0644' OR (subject_id='V1-ENT-0273' AND relation_type='CREATED' AND object_id='V1-ENT-0675')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0645' OR (subject_id='V1-ENT-0273' AND relation_type='CREATED' AND object_id='V1-ENT-0676')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0646' OR (subject_id='V1-ENT-0273' AND relation_type='CREATED' AND object_id='V1-ENT-0677')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0647' OR (subject_id='V1-ENT-0273' AND relation_type='CREATED' AND object_id='V1-ENT-0678')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0648' OR (subject_id='V1-ENT-0273' AND relation_type='CREATED' AND object_id='V1-ENT-0679')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0649' OR (subject_id='V1-ENT-0273' AND relation_type='CREATED' AND object_id='V1-ENT-0680')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0650' OR (subject_id='V1-ENT-0273' AND relation_type='CREATED' AND object_id='V1-ENT-0681')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0651' OR (subject_id='V1-ENT-0273' AND relation_type='CREATED' AND object_id='V1-ENT-0682')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0652' OR (subject_id='V1-ENT-0273' AND relation_type='CREATED' AND object_id='V1-ENT-0683')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0653' OR (subject_id='V1-ENT-0273' AND relation_type='CREATED' AND object_id='V1-ENT-0684')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0703','WCD10-B13-S003','Los detectives salvajes — Editorial Anagrama','Los detectives salvajes — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','','','publisher_book_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/los-detectives-salvajes/9788433910868/NH_256'),
('SRC-0704','WCD10-B13-S004','2666 — Editorial Anagrama','2666 — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','','','publisher_book_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.anagrama-ed.es/libro/compactos/2666/9788433973184/CM_462'),
('SRC-0705','WCD10-B13-S005','Estrella distante — Editorial Anagrama','Estrella distante — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','','','publisher_book_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.anagrama-ed.es/libro/compactos/estrella-distante/9788433966735/CM_242'),
('SRC-0706','WCD10-B13-S006','La literatura nazi en América — Editorial Anagrama','La literatura nazi en América — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','','','publisher_book_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/la-literatura-nazi-en-america/9788433972194/NH_480'),
('SRC-0707','WCD10-B13-S007','Amuleto — Editorial Anagrama','Amuleto — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','','','publisher_book_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.anagrama-ed.es/libro/compactos/amuleto/9788433973559/CM_499'),
('SRC-0708','WCD10-B13-S008','Nocturno de Chile — Editorial Anagrama','Nocturno de Chile — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','','','publisher_book_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.anagrama-ed.es/libro/compactos/nocturno-de-chile/9788433977489/CM_645'),
('SRC-0709','WCD10-B13-S009','El gaucho insufrible — Editorial Anagrama','El gaucho insufrible — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','','','publisher_book_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.anagrama-ed.es/libro/compactos/el-gaucho-insufrible/9788433973252/CM_469'),
('SRC-0710','WCD10-B13-S010','La pista de hielo — Editorial Anagrama','La pista de hielo — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','','','publisher_book_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.anagrama-ed.es/libro/compactos/la-pista-de-hielo/9788433977038/CM_601'),
('SRC-0711','WCD10-B13-S011','Llamadas telefónicas — Editorial Anagrama','Llamadas telefónicas — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','','','publisher_book_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/llamadas-telefonicas/9788433910660/NH_236'),
('SRC-0712','WCD10-B13-S012','Putas asesinas — Editorial Anagrama','Putas asesinas — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','','','publisher_book_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/putas-asesinas/9788433924858/NH_314'),
('SRC-0713','WCD10-B13-S103','Memoria del fuego. 2. Las caras y las máscaras — Siglo XXI Editores','Memoria del fuego. 2. Las caras y las máscaras — Siglo XXI Editores','Siglo XXI Editores','','Siglo XXI Editores','','','publisher_book_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.sigloxxieditores.com/libro/memoria-del-fuego-2-las-caras-y-las-mascaras_53908/'),
('SRC-0714','WCD10-B13-S104','Memoria del fuego. 3. El siglo del viento — Siglo XXI Editores','Memoria del fuego. 3. El siglo del viento — Siglo XXI Editores','Siglo XXI Editores','','Siglo XXI Editores','','','publisher_book_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.sigloxxieditores.com/libro/memoria-del-fuego-3-el-siglo-del-viento_53910/'),
('SRC-0715','WCD10-B13-S105','El libro de los abrazos — Siglo XXI Editores','El libro de los abrazos — Siglo XXI Editores','Siglo XXI Editores','','Siglo XXI Editores','','','publisher_book_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.sigloxxieditores.com/libro/el-libro-de-los-abrazos_53558/'),
('SRC-0716','WCD10-B13-S106','El fútbol a sol y sombra — Siglo XXI Editores','El fútbol a sol y sombra — Siglo XXI Editores','Siglo XXI Editores','','Siglo XXI Editores','','','publisher_book_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.sigloxxieditores.com/libro/el-futbol-a-sol-y-sombra_53031/'),
('SRC-0717','WCD10-B13-S107','Las venas abiertas de América Latina — Siglo XXI Editores','Las venas abiertas de América Latina — Siglo XXI Editores','Siglo XXI Editores','','Siglo XXI Editores','','','publisher_book_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.sigloxxieditores.com/libro/las-venas-abiertas-de-america-latina_52766/'),
('SRC-0718','WCD10-B13-S108','Memoria del fuego. 1. Los nacimientos — Siglo XXI Editores','Memoria del fuego. 1. Los nacimientos — Siglo XXI Editores','Siglo XXI Editores','','Siglo XXI Editores','','','publisher_book_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.sigloxxieditores.com/libro/memoria-del-fuego-1-los-nacimientos_53906/'),
('SRC-0719','WCD10-B13-S109','Espejos. Una historia casi universal — Siglo XXI Editores','Espejos. Una historia casi universal — Siglo XXI Editores','Siglo XXI Editores','','Siglo XXI Editores','','','publisher_book_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.sigloxxieditores.com/libro/espejos_16488/'),
('SRC-0720','WCD10-B13-S201','OBRA · Ricardo Piglia','OBRA · Ricardo Piglia','Ricardo Piglia / OBRA digital archive','','','','','author_web_archive','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://piglia.pubpub.org/bio'),
('SRC-0721','WCD10-B13-S202','Ricardo Piglia — Editorial Anagrama','Ricardo Piglia — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','','','publisher_author_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.anagrama-ed.es/autor/piglia-ricardo-856'),
('SRC-0722','WCD10-B13-S203','La ciudad ausente — Editorial Anagrama','La ciudad ausente — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','2003','','publisher_book_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/la-ciudad-ausente/9788433968418/NH_340'),
('SRC-0723','WCD10-B13-S204','El camino de Ida — Editorial Anagrama','El camino de Ida — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','2013','','publisher_book_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/el-camino-de-ida/9788433997647/NH_517'),
('SRC-0724','WCD10-B13-S205','Los casos del comisario Croce — Editorial Anagrama','Los casos del comisario Croce — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','2018','','publisher_book_page','','es','B','access_pass','WCD-10-B13','Research candidate bibliographic facts and bounded descriptions only; no automatic Curation or public admission.','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/los-casos-del-comisario-croce/9788433998606/NH_611');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0661','work','《美洲纳粹文学》','La literatura nazi en América','candidate','1','WCD10-B13-W001','出版机构作品目录/作品页直接列示；与该作者三项冻结旧作品不同，基线精确查重后新增。; 沿用西文出版题名；中文名为工作译名，不声称正式译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0662','work','《护身符》','Amuleto','candidate','1','WCD10-B13-W002','出版机构作品目录/作品页直接列示；与该作者三项冻结旧作品不同，基线精确查重后新增。; 沿用西文出版题名；中文名为工作译名，不声称正式译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0663','work','《智利之夜》','Nocturno de Chile','candidate','1','WCD10-B13-W003','出版机构作品目录/作品页直接列示；与该作者三项冻结旧作品不同，基线精确查重后新增。; 沿用西文出版题名；中文名为工作译名，不声称正式译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0664','collection','《难驯的高乔人》','El gaucho insufrible','candidate','1','WCD10-B13-W004','出版机构作品目录/作品页直接列示；与该作者三项冻结旧作品不同，基线精确查重后新增。; 沿用西文出版题名；中文名为工作译名，不声称正式译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0665','work','《冰场》','La pista de hielo','candidate','1','WCD10-B13-W005','出版机构作品目录/作品页直接列示；与该作者三项冻结旧作品不同，基线精确查重后新增。; 沿用西文出版题名；中文名为工作译名，不声称正式译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0666','collection','《电话来访》','Llamadas telefónicas','candidate','1','WCD10-B13-W006','出版商目录直接确认作品归属、短篇集性质、版本日期及内容概述。; 沿用出版商西文题名；中文仅为工作译名，不主张正式译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0667','collection','《杀手娼妓》','Putas asesinas','candidate','1','WCD10-B13-W007','出版商目录直接确认作品归属、短篇集性质、版本日期及内容概述。; 沿用出版商西文题名；中文仅为工作译名，不主张正式译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0668','work','《接下来的日子》','Los días siguientes','candidate','1','WCD10-B13-W101','Uruguay Educa直接称其为Galeano首部小说并列出1963年；补入有明确体裁和首年的重要早期作品。; 中文仅为检索工作译名，原题作为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0669','work','《足球：阳光与阴影》','El fútbol a sol y sombra','candidate','1','WCD10-B13-W102','早期馆藏目录检索曾提示该题名及散文分类，仅作检索历史背景；本包实际采用证据为Uruguay Educa年表（1995）与Siglo XXI出版社单书页（作者、足球主题及权力结构描述）。; 中文仅为检索工作译名，西班牙语原题作为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0670','collection','《火的记忆Ⅱ：面孔与面具》','Memoria del fuego II. Las caras y las máscaras','candidate','1','WCD10-B13-W103','Uruguay Educa年表直接列出原题与年；Siglo XXI Editores的单书页直接确认作者、卷次与内容简介；仅作有依据的卷册/作品记录。; 中文为检索工作译名，西班牙语原题作为身份锚点；不声称正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0671','collection','《火的记忆Ⅲ：风之世纪》','Memoria del fuego III. El siglo del viento','candidate','1','WCD10-B13-W104','Uruguay Educa年表直接列出原题与年；Siglo XXI Editores的单书页直接确认作者、卷次与内容简介；仅作有依据的卷册/作品记录。; 中文为检索工作译名，西班牙语原题作为身份锚点；不声称正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0672','work','《镜子：一部近乎普世的历史》','Espejos. Una historia casi universal','candidate','1','WCD10-B13-W105','Uruguay Educa年表直接列出原题与年；Siglo XXI Editores的单书页直接确认作者、卷次与内容简介；仅作有依据的卷册/作品记录。; 中文为检索工作译名，西班牙语原题作为身份锚点；不声称正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0673','work','《缺席的城市》','La ciudad ausente','candidate','1','WCD10-B13-W201','作者本人数字档案的作品目录将其列入明确体裁和出版年份。; 按原文题名建立作品对象；中文名为检索显示译名，父审可窄修。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0674','work','《艾达之路》（工作译名）','El camino de ida','candidate','1','WCD10-B13-W202','作者本人数字档案的作品目录将其列入明确体裁和出版年份。; 按原文题名建立作品对象；中文名为检索显示译名，父审可窄修。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0675','collection','《克罗采警长案》','Los casos del comisario Croce','candidate','1','WCD10-B13-W203','作者本人数字档案的作品目录将其列入明确体裁和出版年份。; 按原文题名建立作品对象；中文名为检索显示译名，父审可窄修。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0676','collection','《入侵》','La invasión','candidate','1','WCD10-B13-W205','作者本人数字档案的作品目录将其列入明确体裁和出版年份。; 按原文题名建立作品对象；中文名为检索显示译名，父审可窄修。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0677','collection','《假名》','Nombre falso','candidate','1','WCD10-B13-W206','作者本人数字档案的作品目录将其列入明确体裁和出版年份。; 按原文题名建立作品对象；中文名为检索显示译名，父审可窄修。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0678','collection','《无期徒刑》','Prisión perpetua','candidate','1','WCD10-B13-W207','作者本人数字档案的作品目录将其列入明确体裁和出版年份。; 按原文题名建立作品对象；中文名为检索显示译名，父审可窄修。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0679','collection','《批评与虚构》','Crítica y ficción','candidate','1','WCD10-B13-W208','作者本人数字档案的作品目录将其列入明确体裁和出版年份。; 按原文题名建立作品对象；中文名为检索显示译名，父审可窄修。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0680','work','《短形式》','Formas breves','candidate','1','WCD10-B13-W209','作者本人数字档案的作品目录将其列入明确体裁和出版年份。; 按原文题名建立作品对象；中文名为检索显示译名，父审可窄修。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0681','work','《最后的读者》','El último lector','candidate','1','WCD10-B13-W210','作者本人数字档案的作品目录将其列入明确体裁和出版年份。; 按原文题名建立作品对象；中文名为检索显示译名，父审可窄修。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0682','work','《埃米利奥·伦齐日记：成长岁月》','Los diarios de Emilio Renzi. Años de formación','candidate','1','WCD10-B13-W211','作者本人数字档案的作品目录将其列入明确体裁和出版年份。; 按原文题名建立作品对象；中文名为检索显示译名，父审可窄修。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0683','work','《埃米利奥·伦齐日记：幸福岁月》','Los diarios de Emilio Renzi. Los años felices','candidate','1','WCD10-B13-W212','作者本人数字档案的作品目录将其列入明确体裁和出版年份。; 按原文题名建立作品对象；中文名为检索显示译名，父审可窄修。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0684','work','《埃米利奥·伦齐日记：生命中的一天》','Los diarios de Emilio Renzi. Un día en la vida','candidate','1','WCD10-B13-W213','作者本人数字档案的作品目录将其列入明确体裁和出版年份。; 按原文题名建立作品对象；中文名为检索显示译名，父审可窄修。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0657','WCD10-B13-W001','WCD-10-B13','WCD10-B13-W001','V1-ENT-0661','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0658','WCD10-B13-W002','WCD-10-B13','WCD10-B13-W002','V1-ENT-0662','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0659','WCD10-B13-W003','WCD-10-B13','WCD10-B13-W003','V1-ENT-0663','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0660','WCD10-B13-W004','WCD-10-B13','WCD10-B13-W004','V1-ENT-0664','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0661','WCD10-B13-W005','WCD-10-B13','WCD10-B13-W005','V1-ENT-0665','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0662','WCD10-B13-W006','WCD-10-B13','WCD10-B13-W006','V1-ENT-0666','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0663','WCD10-B13-W007','WCD-10-B13','WCD10-B13-W007','V1-ENT-0667','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0664','WCD10-B13-W101','WCD-10-B13','WCD10-B13-W101','V1-ENT-0668','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0665','WCD10-B13-W102','WCD-10-B13','WCD10-B13-W102','V1-ENT-0669','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0666','WCD10-B13-W103','WCD-10-B13','WCD10-B13-W103','V1-ENT-0670','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0667','WCD10-B13-W104','WCD-10-B13','WCD10-B13-W104','V1-ENT-0671','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0668','WCD10-B13-W105','WCD-10-B13','WCD10-B13-W105','V1-ENT-0672','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0669','WCD10-B13-W201','WCD-10-B13','WCD10-B13-W201','V1-ENT-0673','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0670','WCD10-B13-W202','WCD-10-B13','WCD10-B13-W202','V1-ENT-0674','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0671','WCD10-B13-W203','WCD-10-B13','WCD10-B13-W203','V1-ENT-0675','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0672','WCD10-B13-W205','WCD-10-B13','WCD10-B13-W205','V1-ENT-0676','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0673','WCD10-B13-W206','WCD-10-B13','WCD10-B13-W206','V1-ENT-0677','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0674','WCD10-B13-W207','WCD-10-B13','WCD10-B13-W207','V1-ENT-0678','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0675','WCD10-B13-W208','WCD-10-B13','WCD10-B13-W208','V1-ENT-0679','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0676','WCD10-B13-W209','WCD-10-B13','WCD10-B13-W209','V1-ENT-0680','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0677','WCD10-B13-W210','WCD-10-B13','WCD10-B13-W210','V1-ENT-0681','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0678','WCD10-B13-W211','WCD-10-B13','WCD10-B13-W211','V1-ENT-0682','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0679','WCD10-B13-W212','WCD-10-B13','WCD10-B13-W212','V1-ENT-0683','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0680','WCD10-B13-W213','WCD-10-B13','WCD10-B13-W213','V1-ENT-0684','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0640','WCD-10-B13:V1-ENT-0661','V1-ENT-0661','work','《美洲纳粹文学》','罗贝托·波拉尼奥','La literatura nazi en América','智利','es','1996','仿文学辞典形式的虚构作品集','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《美洲纳粹文学》｜La literatura nazi en América

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：仿文学辞典形式的虚构作品集
- first_publication_year：1996
- one_sentence_summary：出版方称本书仿照文学辞典，以虚构作家的生平与作品条目构成一部“伪装成手册的虚构作品”，并戏仿伊比利亚美洲文学史。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0641','WCD-10-B13:V1-ENT-0662','V1-ENT-0662','work','《护身符》','罗贝托·波拉尼奥','Amuleto','智利','es','1999','小说','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《护身符》｜Amuleto

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- first_publication_year：1999
- one_sentence_summary：出版方简介由乌拉圭人Auxilio Lacouture的声音展开：她在1968年墨西哥大学遭警方占领时躲入女厕，并回望在墨西哥的生活。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0642','WCD-10-B13:V1-ENT-0663','V1-ENT-0663','work','《智利之夜》','罗贝托·波拉尼奥','Nocturno de Chile','智利','es','2000','小说','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《智利之夜》｜Nocturno de Chile

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- first_publication_year：2000
- one_sentence_summary：出版方简介写神父兼文学评论家Sebastián Urrutia Lacroix在一场高烧之夜回顾人生，并触及智利文学圈和戒严下圣地亚哥的生活。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0643','WCD-10-B13:V1-ENT-0664','V1-ENT-0664','collection','《难驯的高乔人》','罗贝托·波拉尼奥','El gaucho insufrible','智利','es','2003','短篇小说集与演讲合集','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《难驯的高乔人》｜El gaucho insufrible

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集与演讲合集
- first_publication_year：2003
- one_sentence_summary：出版方说明本书收录五篇小说和两篇演讲，简介举及阿根廷律师转为潘帕斯高乔人、下水道侦探及虚构作家等故事。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0644','WCD-10-B13:V1-ENT-0665','V1-ENT-0665','work','《冰场》','罗贝托·波拉尼奥','La pista de hielo','智利','es','1993','小说','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《冰场》｜La pista de hielo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- first_publication_year：1993
- one_sentence_summary：出版方简介以一宗犯罪的三种叙述为线索，分别由一名智利写作者、一名在露营地做夜间保安的墨西哥诗人和一名加泰罗尼亚商人讲述。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0645','WCD-10-B13:V1-ENT-0666','V1-ENT-0666','collection','《电话来访》','罗贝托·波拉尼奥','Llamadas telefónicas','智利','es','1997','短篇小说集','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《电话来访》｜Llamadas telefónicas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- first_publication_year：1997
- one_sentence_summary：Sensini、Joanna Silvestri、Henry Simon Leprince等故事以作家、流亡经历和现实与虚构交错为线索，出版方简介概述其开放叙事及文学互文。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0646','WCD-10-B13:V1-ENT-0667','V1-ENT-0667','collection','《杀手娼妓》','罗贝托·波拉尼奥','Putas asesinas','智利','es','2001','短篇小说集','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《杀手娼妓》｜Putas asesinas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- first_publication_year：2001
- one_sentence_summary：出版方简介提及阿卡普尔科之旅、足球故事、与毒品和电影有关的故事，以及重现《荒野侦探》人物Arturo Belano的篇章。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0647','WCD-10-B13:V1-ENT-0668','V1-ENT-0668','work','《接下来的日子》','爱德华多·加莱亚诺','Los días siguientes','乌拉圭','es','1963','小说（作者首部小说）','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《接下来的日子》｜Los días siguientes

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1963
- genre_or_form：小说（作者首部小说）
- one_sentence_summary：Uruguay Educa将其记为Galeano于1963年出版的首部小说；现有来源未给出情节，简介限于作品书目位置。
- bibliographic_note：Uruguay Educa列出《Los días siguientes》（1963），并说明这是Galeano的第一部小说。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0648','WCD-10-B13:V1-ENT-0669','V1-ENT-0669','work','《足球：阳光与阴影》','爱德华多·加莱亚诺','El fútbol a sol y sombra','乌拉圭','es','1995','足球主题散文/叙事','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《足球：阳光与阴影》｜El fútbol a sol y sombra

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1995
- genre_or_form：足球主题散文/叙事
- one_sentence_summary：作品一面礼赞足球，一面揭示这项商业产业中的权力结构，并批评职业体育的技术官僚化压抑快乐、想象与冒险。
- bibliographic_note：Uruguay Educa年表列1995年；出版社当前页提供后续版本资料，不能据再版日期改定初版年。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0649','WCD-10-B13:V1-ENT-0670','V1-ENT-0670','collection','《火的记忆Ⅱ：面孔与面具》','爱德华多·加莱亚诺','Memoria del fuego II. Las caras y las máscaras','乌拉圭','es','1984','历史叙事卷册','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《火的记忆Ⅱ：面孔与面具》｜Memoria del fuego II. Las caras y las máscaras

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1984
- genre_or_form：历史叙事卷册
- one_sentence_summary：三部曲第二卷以一系列有文献依据的故事呈现拉丁美洲18至19世纪的独立战争、革命和国家形成。
- bibliographic_note：Uruguay Educa年表记录作品年；Siglo XXI页面打开的是后续版（2024年），本候选不以出版社再版年替代首版年。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0650','WCD-10-B13:V1-ENT-0671','V1-ENT-0671','collection','《火的记忆Ⅲ：风之世纪》','爱德华多·加莱亚诺','Memoria del fuego III. El siglo del viento','乌拉圭','es','1986','历史叙事卷册','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《火的记忆Ⅲ：风之世纪》｜Memoria del fuego III. El siglo del viento

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1986
- genre_or_form：历史叙事卷册
- one_sentence_summary：三部曲第三卷以日常小故事叙述美洲20世纪的动荡，尝试让历史脱离静止的纪念叙述并重新进入当下。
- bibliographic_note：Uruguay Educa年表记录作品年；Siglo XXI页面打开的是后续版（2024年），本候选不以出版社再版年替代首版年。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0651','WCD-10-B13:V1-ENT-0672','V1-ENT-0672','work','《镜子：一部近乎普世的历史》','爱德华多·加莱亚诺','Espejos. Una historia casi universal','乌拉圭','es','2008','历史叙事/散文','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《镜子：一部近乎普世的历史》｜Espejos. Una historia casi universal

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：2008
- genre_or_form：历史叙事/散文
- one_sentence_summary：作品将过去与现在连接，转向被忽略的普通人、女性以及南方和东方等群体。
- bibliographic_note：Uruguay Educa年表记录2008年；Siglo XXI出版社页面也列2008版信息。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0652','WCD-10-B13:V1-ENT-0673','V1-ENT-0673','work','《缺席的城市》','里卡多·皮格利亚','La ciudad ausente','阿根廷','es','1992','小说','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《缺席的城市》｜La ciudad ausente

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：Junior追索线索进入一个不断消失、又由秘密故事构成的布宜诺斯艾利斯；出版社将作品描述为交织爱情、政治与城市叙事的小说。
- first_publication_year：1992
- bibliographic_note：Piglia作者档案将 La ciudad ausente 列为1992年小说；本包所查Anagrama版本页面标示2003年3月1日出版（ISBN 978-84-339-6841-8）。两者分别记录作品目录年份与该版日期。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0653','WCD-10-B13:V1-ENT-0674','V1-ENT-0674','work','《艾达之路》（工作译名）','里卡多·皮格利亚','El camino de ida','阿根廷','es','2013','小说','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《艾达之路》（工作译名）｜El camino de ida

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：Emilio Renzi赴新泽西大学授课后卷入Ida Brown之死及针对学界人士的袭击调查；出版社称小说在侦探叙事中交织情感关系与重塑人生的主题。
- first_publication_year：2013
- bibliographic_note：作者档案与Anagrama页面均记录2013年；Anagrama版页面标示2013年9月4日出版（ISBN 978-84-339-9764-7）。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0654','WCD-10-B13:V1-ENT-0675','V1-ENT-0675','collection','《克罗采警长案》','里卡多·皮格利亚','Los casos del comisario Croce','阿根廷','es','2018','侦探短篇小说集','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《克罗采警长案》｜Los casos del comisario Croce

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：侦探短篇小说集
- one_sentence_summary：作品由警长Croce处理的一组疑案构成，包括港口命案、疑似涉及Eva Perón的影片谜团及珠宝盗窃案；出版社称其致意于侦探小说传统。
- first_publication_year：2018
- bibliographic_note：Piglia作者档案列2018年；Anagrama版页面标示2018年9月12日出版（ISBN 978-84-339-9860-6）。出版方将该书称为警探短篇故事集。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0655','WCD-10-B13:V1-ENT-0676','V1-ENT-0676','collection','《入侵》','里卡多·皮格利亚','La invasión','阿根廷','es','1967','短篇小说集','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《入侵》｜La invasión

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- one_sentence_summary：作者作品目录将 La invasión 列为短篇小说集，并记录其出版年份为 1967；本条仅说明体裁与书目身份。
- first_publication_year：1967
- bibliographic_note：Piglia作者档案分别列 Jaulario 与 La invasión，均为1967年；本包仅收《La invasión》对象，不据该目录认定两书等同或仅为版本关系。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0656','WCD-10-B13:V1-ENT-0677','V1-ENT-0677','collection','《假名》','里卡多·皮格利亚','Nombre falso','阿根廷','es','1975','短篇小说集','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《假名》｜Nombre falso

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- one_sentence_summary：作者作品目录将 Nombre falso 列为短篇小说集，并记录其出版年份为 1975；本条仅说明体裁与书目身份。
- first_publication_year：1975
- bibliographic_note：作者作品目录列为短篇小说集，书目年份为1975。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0657','WCD-10-B13:V1-ENT-0678','V1-ENT-0678','collection','《无期徒刑》','里卡多·皮格利亚','Prisión perpetua','阿根廷','es','1988','小说集（含两部中篇）','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《无期徒刑》｜Prisión perpetua

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说集（含两部中篇）
- one_sentence_summary：作者作品目录将 Prisión perpetua 列为小说集（含两部中篇），并记录其出版年份为 1988；本条仅说明体裁与书目身份。
- first_publication_year：1988
- bibliographic_note：作者作品目录列为小说集（含两部中篇），书目年份为1988。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0658','WCD-10-B13:V1-ENT-0679','V1-ENT-0679','collection','《批评与虚构》','里卡多·皮格利亚','Crítica y ficción','阿根廷','es','1986','评论与访谈集','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《批评与虚构》｜Crítica y ficción

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：评论与访谈集
- one_sentence_summary：作者作品目录将 Crítica y ficción 列为评论与访谈集，并记录其出版年份为 1986；本条仅说明体裁与书目身份。
- first_publication_year：1986
- bibliographic_note：作者作品目录列为评论与访谈集，书目年份为1986。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0659','WCD-10-B13:V1-ENT-0680','V1-ENT-0680','work','《短形式》','里卡多·皮格利亚','Formas breves','阿根廷','es','','文学评论','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《短形式》｜Formas breves

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：文学评论
- one_sentence_summary：作者作品目录将 Formas breves 列为文学评论，并记录其出版年份为 1999；本条仅说明体裁与书目身份。
- bibliographic_note：作者档案简介将 Formas breves 列为2000年；作品目录第85行列1999年。年份口径未解，本包不填写原子首版年。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0660','WCD-10-B13:V1-ENT-0681','V1-ENT-0681','work','《最后的读者》','里卡多·皮格利亚','El último lector','阿根廷','es','2005','文学评论','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《最后的读者》｜El último lector

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：文学评论
- one_sentence_summary：作者作品目录将 El último lector 列为文学评论，并记录其出版年份为 2005；本条仅说明体裁与书目身份。
- first_publication_year：2005
- bibliographic_note：作者作品目录列为文学评论，书目年份为2005。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0661','WCD-10-B13:V1-ENT-0682','V1-ENT-0682','work','《埃米利奥·伦齐日记：成长岁月》','里卡多·皮格利亚','Los diarios de Emilio Renzi. Años de formación','阿根廷','es','2015','日记／自传性作品','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《埃米利奥·伦齐日记：成长岁月》｜Los diarios de Emilio Renzi. Años de formación

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：日记／自传性作品
- one_sentence_summary：作者作品目录将 Los diarios de Emilio Renzi. Años de formación 列为日记／自传性作品，并记录其出版年份为 2015；本条仅说明体裁与书目身份。
- first_publication_year：2015
- bibliographic_note：作者作品目录列为日记／自传性作品，书目年份为2015。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0662','WCD-10-B13:V1-ENT-0683','V1-ENT-0683','work','《埃米利奥·伦齐日记：幸福岁月》','里卡多·皮格利亚','Los diarios de Emilio Renzi. Los años felices','阿根廷','es','2016','日记／自传性作品','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《埃米利奥·伦齐日记：幸福岁月》｜Los diarios de Emilio Renzi. Los años felices

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：日记／自传性作品
- one_sentence_summary：作者作品目录将 Los diarios de Emilio Renzi. Los años felices 列为日记／自传性作品，并记录其出版年份为 2016；本条仅说明体裁与书目身份。
- first_publication_year：2016
- bibliographic_note：作者作品目录列为日记／自传性作品，书目年份为2016。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0663','WCD-10-B13:V1-ENT-0684','V1-ENT-0684','work','《埃米利奥·伦齐日记：生命中的一天》','里卡多·皮格利亚','Los diarios de Emilio Renzi. Un día en la vida','阿根廷','es','2017','日记／自传性作品','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《埃米利奥·伦齐日记：生命中的一天》｜Los diarios de Emilio Renzi. Un día en la vida

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：日记／自传性作品
- one_sentence_summary：作者作品目录将 Los diarios de Emilio Renzi. Un día en la vida 列为日记／自传性作品，并记录其出版年份为 2017；本条仅说明体裁与书目身份。
- first_publication_year：2017
- bibliographic_note：作者作品目录列为日记／自传性作品，书目年份为2017。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0664','WCD-10-B13:V1-ENT-0269','V1-ENT-0269','work','《荒野侦探》','罗贝托·波拉尼奥','Los detectives salvajes','智利','es','','长篇小说','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《荒野侦探》｜Los detectives salvajes

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说
- one_sentence_summary：两位诗人沿着寻找墨西哥女诗人塞萨雷娅·蒂纳赫罗的线索展开旅程；出版方简介称叙事跨越1976至1996年及多个国家。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0665','WCD-10-B13:V1-ENT-0270','V1-ENT-0270','work','《2666》','罗贝托·波拉尼奥','2666','智利','es','','长篇小说','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《2666》｜2666

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说
- one_sentence_summary：出版方简介以四位研究德国作家阿尔钦博尔迪的文学教授为线索，写他们前往虚构的圣特雷莎，并展开跨越两大洲和欧洲二十世纪历史的叙事。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0666','WCD-10-B13:V1-ENT-0271','V1-ENT-0271','work','《遥远的星辰》','罗贝托·波拉尼奥','Estrella distante','智利','es','','长篇小说','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《遥远的星辰》｜Estrella distante

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说
- one_sentence_summary：出版方简介围绕诗人鲁伊斯-塔格莱与飞行员魏德尔身份重合展开，叙述者在智利政变前后追索其暴力艺术实践。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0667','WCD-10-B13:V1-ENT-0276','V1-ENT-0276','collection','《火的记忆Ⅰ：创世纪》','爱德华多·加莱亚诺','Memoria del fuego I. Los nacimientos','乌拉圭','es','','','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《火的记忆Ⅰ：创世纪》｜Memoria del fuego I. Los nacimientos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：出版社简介称本卷以有文献依据的片段重述征服前至1700年的美洲历史，并写到原住民遭受的压迫。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0668','WCD-10-B13:V1-ENT-0277','V1-ENT-0277','collection','《拥抱之书》','爱德华多·加莱亚诺','El libro de los abrazos','乌拉圭','es','','短篇叙事/图文散文','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《拥抱之书》｜El libro de los abrazos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇叙事/图文散文
- one_sentence_summary：由庆典、逸事、编年、梦与记忆组成的短篇叙事，并结合作者版画和绘图。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0669','WCD-10-B13:V1-ENT-0275','V1-ENT-0275','work','《拉丁美洲被切开的血管》','爱德华多·加莱亚诺','Las venas abiertas de América Latina','乌拉圭','es','','','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《拉丁美洲被切开的血管》｜Las venas abiertas de América Latina

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：作者说明本书旨在传播被官方历史遮蔽或歪曲的事实，并以通俗、面向读者的方式讨论政治经济问题。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0670','WCD-10-B13:V1-ENT-0278','V1-ENT-0278','work','《人工呼吸》','里卡多·皮格利亚','Respiración artificial','阿根廷','es','','小说','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《人工呼吸》｜Respiración artificial

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：作者作品目录将 Respiración artificial 列为小说，并列出相关版本信息；本条仅作体裁与书目范围说明。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0671','WCD-10-B13:V1-ENT-0279','V1-ENT-0279','work','《燃烧的钱》','里卡多·皮格利亚','Plata quemada','阿根廷','es','','小说','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《燃烧的钱》｜Plata quemada

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：作者作品目录将 Plata quemada 列为小说，并列出相关版本信息；本条仅作体裁与书目范围说明。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0672','WCD-10-B13:V1-ENT-0280','V1-ENT-0280','work','《夜间目标》','里卡多·皮格利亚','Blanco nocturno','阿根廷','es','','小说','WCD-10-B13','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《夜间目标》｜Blanco nocturno

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：作者作品目录将 Blanco nocturno 列为小说，并列出相关版本信息；本条仅作体裁与书目范围说明。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-2177','WCD10-B13-W001-F01','V1-CARD-0640','V1-ENT-0661','genre_or_form','仿文学辞典形式的虚构作品集','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2178','WCD10-B13-W001-F02','V1-CARD-0640','V1-ENT-0661','first_publication_year','1996','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2179','WCD10-B13-W001-F03','V1-CARD-0640','V1-ENT-0661','one_sentence_summary','出版方称本书仿照文学辞典，以虚构作家的生平与作品条目构成一部“伪装成手册的虚构作品”，并戏仿伊比利亚美洲文学史。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2180','WCD10-B13-W002-F01','V1-CARD-0641','V1-ENT-0662','genre_or_form','小说','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2181','WCD10-B13-W002-F02','V1-CARD-0641','V1-ENT-0662','first_publication_year','1999','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2182','WCD10-B13-W002-F03','V1-CARD-0641','V1-ENT-0662','one_sentence_summary','出版方简介由乌拉圭人Auxilio Lacouture的声音展开：她在1968年墨西哥大学遭警方占领时躲入女厕，并回望在墨西哥的生活。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2183','WCD10-B13-W003-F01','V1-CARD-0642','V1-ENT-0663','genre_or_form','小说','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2184','WCD10-B13-W003-F02','V1-CARD-0642','V1-ENT-0663','first_publication_year','2000','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2185','WCD10-B13-W003-F03','V1-CARD-0642','V1-ENT-0663','one_sentence_summary','出版方简介写神父兼文学评论家Sebastián Urrutia Lacroix在一场高烧之夜回顾人生，并触及智利文学圈和戒严下圣地亚哥的生活。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2186','WCD10-B13-W004-F01','V1-CARD-0643','V1-ENT-0664','genre_or_form','短篇小说集与演讲合集','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2187','WCD10-B13-W004-F02','V1-CARD-0643','V1-ENT-0664','first_publication_year','2003','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2188','WCD10-B13-W004-F03','V1-CARD-0643','V1-ENT-0664','one_sentence_summary','出版方说明本书收录五篇小说和两篇演讲，简介举及阿根廷律师转为潘帕斯高乔人、下水道侦探及虚构作家等故事。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2189','WCD10-B13-W005-F01','V1-CARD-0644','V1-ENT-0665','genre_or_form','小说','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2190','WCD10-B13-W005-F02','V1-CARD-0644','V1-ENT-0665','first_publication_year','1993','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2191','WCD10-B13-W005-F03','V1-CARD-0644','V1-ENT-0665','one_sentence_summary','出版方简介以一宗犯罪的三种叙述为线索，分别由一名智利写作者、一名在露营地做夜间保安的墨西哥诗人和一名加泰罗尼亚商人讲述。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2192','WCD10-B13-W006-F01','V1-CARD-0645','V1-ENT-0666','genre_or_form','短篇小说集','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2193','WCD10-B13-W006-F02','V1-CARD-0645','V1-ENT-0666','first_publication_year','1997','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2194','WCD10-B13-W006-F03','V1-CARD-0645','V1-ENT-0666','one_sentence_summary','Sensini、Joanna Silvestri、Henry Simon Leprince等故事以作家、流亡经历和现实与虚构交错为线索，出版方简介概述其开放叙事及文学互文。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2195','WCD10-B13-W007-F01','V1-CARD-0646','V1-ENT-0667','genre_or_form','短篇小说集','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2196','WCD10-B13-W007-F02','V1-CARD-0646','V1-ENT-0667','first_publication_year','2001','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2197','WCD10-B13-W007-F03','V1-CARD-0646','V1-ENT-0667','one_sentence_summary','出版方简介提及阿卡普尔科之旅、足球故事、与毒品和电影有关的故事，以及重现《荒野侦探》人物Arturo Belano的篇章。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2198','WCD10-B13-W101-F01','V1-CARD-0647','V1-ENT-0668','first_publication_year','1963','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2199','WCD10-B13-W101-F02','V1-CARD-0647','V1-ENT-0668','genre_or_form','小说（作者首部小说）','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2200','WCD10-B13-W101-F03','V1-CARD-0647','V1-ENT-0668','one_sentence_summary','Uruguay Educa将其记为Galeano于1963年出版的首部小说；现有来源未给出情节，简介限于作品书目位置。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2201','WCD10-B13-W101-F04','V1-CARD-0647','V1-ENT-0668','bibliographic_note','Uruguay Educa列出《Los días siguientes》（1963），并说明这是Galeano的第一部小说。','bibliographic_note','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2202','WCD10-B13-W102-F01','V1-CARD-0648','V1-ENT-0669','first_publication_year','1995','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2203','WCD10-B13-W102-F02','V1-CARD-0648','V1-ENT-0669','genre_or_form','足球主题散文/叙事','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2204','WCD10-B13-W102-F03','V1-CARD-0648','V1-ENT-0669','one_sentence_summary','作品一面礼赞足球，一面揭示这项商业产业中的权力结构，并批评职业体育的技术官僚化压抑快乐、想象与冒险。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2205','WCD10-B13-W102-F04','V1-CARD-0648','V1-ENT-0669','bibliographic_note','Uruguay Educa年表列1995年；出版社当前页提供后续版本资料，不能据再版日期改定初版年。','bibliographic_note','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2206','WCD10-B13-W103-F01','V1-CARD-0649','V1-ENT-0670','first_publication_year','1984','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2207','WCD10-B13-W103-F02','V1-CARD-0649','V1-ENT-0670','genre_or_form','历史叙事卷册','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2208','WCD10-B13-W103-F03','V1-CARD-0649','V1-ENT-0670','one_sentence_summary','三部曲第二卷以一系列有文献依据的故事呈现拉丁美洲18至19世纪的独立战争、革命和国家形成。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2209','WCD10-B13-W103-F04','V1-CARD-0649','V1-ENT-0670','bibliographic_note','Uruguay Educa年表记录作品年；Siglo XXI页面打开的是后续版（2024年），本候选不以出版社再版年替代首版年。','bibliographic_note','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2210','WCD10-B13-W104-F01','V1-CARD-0650','V1-ENT-0671','first_publication_year','1986','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2211','WCD10-B13-W104-F02','V1-CARD-0650','V1-ENT-0671','genre_or_form','历史叙事卷册','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2212','WCD10-B13-W104-F03','V1-CARD-0650','V1-ENT-0671','one_sentence_summary','三部曲第三卷以日常小故事叙述美洲20世纪的动荡，尝试让历史脱离静止的纪念叙述并重新进入当下。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2213','WCD10-B13-W104-F04','V1-CARD-0650','V1-ENT-0671','bibliographic_note','Uruguay Educa年表记录作品年；Siglo XXI页面打开的是后续版（2024年），本候选不以出版社再版年替代首版年。','bibliographic_note','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2214','WCD10-B13-W105-F01','V1-CARD-0651','V1-ENT-0672','first_publication_year','2008','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2215','WCD10-B13-W105-F02','V1-CARD-0651','V1-ENT-0672','genre_or_form','历史叙事/散文','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2216','WCD10-B13-W105-F03','V1-CARD-0651','V1-ENT-0672','one_sentence_summary','作品将过去与现在连接，转向被忽略的普通人、女性以及南方和东方等群体。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2217','WCD10-B13-W105-F04','V1-CARD-0651','V1-ENT-0672','bibliographic_note','Uruguay Educa年表记录2008年；Siglo XXI出版社页面也列2008版信息。','bibliographic_note','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2218','WCD10-B13-W201-F01','V1-CARD-0652','V1-ENT-0673','genre_or_form','小说','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2219','WCD10-B13-W201-F02','V1-CARD-0652','V1-ENT-0673','one_sentence_summary','Junior追索线索进入一个不断消失、又由秘密故事构成的布宜诺斯艾利斯；出版社将作品描述为交织爱情、政治与城市叙事的小说。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2220','WCD10-B13-W201-F03','V1-CARD-0652','V1-ENT-0673','first_publication_year','1992','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2221','WCD10-B13-W201-F04','V1-CARD-0652','V1-ENT-0673','bibliographic_note','Piglia作者档案将 La ciudad ausente 列为1992年小说；本包所查Anagrama版本页面标示2003年3月1日出版（ISBN 978-84-339-6841-8）。两者分别记录作品目录年份与该版日期。','bibliographic_note','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2222','WCD10-B13-W202-F01','V1-CARD-0653','V1-ENT-0674','genre_or_form','小说','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2223','WCD10-B13-W202-F02','V1-CARD-0653','V1-ENT-0674','one_sentence_summary','Emilio Renzi赴新泽西大学授课后卷入Ida Brown之死及针对学界人士的袭击调查；出版社称小说在侦探叙事中交织情感关系与重塑人生的主题。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2224','WCD10-B13-W202-F03','V1-CARD-0653','V1-ENT-0674','first_publication_year','2013','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2225','WCD10-B13-W202-F04','V1-CARD-0653','V1-ENT-0674','bibliographic_note','作者档案与Anagrama页面均记录2013年；Anagrama版页面标示2013年9月4日出版（ISBN 978-84-339-9764-7）。','bibliographic_note','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2226','WCD10-B13-W203-F01','V1-CARD-0654','V1-ENT-0675','genre_or_form','侦探短篇小说集','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2227','WCD10-B13-W203-F02','V1-CARD-0654','V1-ENT-0675','one_sentence_summary','作品由警长Croce处理的一组疑案构成，包括港口命案、疑似涉及Eva Perón的影片谜团及珠宝盗窃案；出版社称其致意于侦探小说传统。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2228','WCD10-B13-W203-F03','V1-CARD-0654','V1-ENT-0675','first_publication_year','2018','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2229','WCD10-B13-W203-F04','V1-CARD-0654','V1-ENT-0675','bibliographic_note','Piglia作者档案列2018年；Anagrama版页面标示2018年9月12日出版（ISBN 978-84-339-9860-6）。出版方将该书称为警探短篇故事集。','bibliographic_note','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2230','WCD10-B13-W205-F01','V1-CARD-0655','V1-ENT-0676','genre_or_form','短篇小说集','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2231','WCD10-B13-W205-F02','V1-CARD-0655','V1-ENT-0676','one_sentence_summary','作者作品目录将 La invasión 列为短篇小说集，并记录其出版年份为 1967；本条仅说明体裁与书目身份。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2232','WCD10-B13-W205-F03','V1-CARD-0655','V1-ENT-0676','first_publication_year','1967','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2233','WCD10-B13-W205-F04','V1-CARD-0655','V1-ENT-0676','bibliographic_note','Piglia作者档案分别列 Jaulario 与 La invasión，均为1967年；本包仅收《La invasión》对象，不据该目录认定两书等同或仅为版本关系。','bibliographic_note','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2234','WCD10-B13-W206-F01','V1-CARD-0656','V1-ENT-0677','genre_or_form','短篇小说集','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2235','WCD10-B13-W206-F02','V1-CARD-0656','V1-ENT-0677','one_sentence_summary','作者作品目录将 Nombre falso 列为短篇小说集，并记录其出版年份为 1975；本条仅说明体裁与书目身份。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2236','WCD10-B13-W206-F03','V1-CARD-0656','V1-ENT-0677','first_publication_year','1975','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2237','WCD10-B13-W206-F04','V1-CARD-0656','V1-ENT-0677','bibliographic_note','作者作品目录列为短篇小说集，书目年份为1975。','bibliographic_note','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2238','WCD10-B13-W207-F01','V1-CARD-0657','V1-ENT-0678','genre_or_form','小说集（含两部中篇）','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2239','WCD10-B13-W207-F02','V1-CARD-0657','V1-ENT-0678','one_sentence_summary','作者作品目录将 Prisión perpetua 列为小说集（含两部中篇），并记录其出版年份为 1988；本条仅说明体裁与书目身份。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2240','WCD10-B13-W207-F03','V1-CARD-0657','V1-ENT-0678','first_publication_year','1988','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2241','WCD10-B13-W207-F04','V1-CARD-0657','V1-ENT-0678','bibliographic_note','作者作品目录列为小说集（含两部中篇），书目年份为1988。','bibliographic_note','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2242','WCD10-B13-W208-F01','V1-CARD-0658','V1-ENT-0679','genre_or_form','评论与访谈集','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2243','WCD10-B13-W208-F02','V1-CARD-0658','V1-ENT-0679','one_sentence_summary','作者作品目录将 Crítica y ficción 列为评论与访谈集，并记录其出版年份为 1986；本条仅说明体裁与书目身份。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2244','WCD10-B13-W208-F03','V1-CARD-0658','V1-ENT-0679','first_publication_year','1986','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2245','WCD10-B13-W208-F04','V1-CARD-0658','V1-ENT-0679','bibliographic_note','作者作品目录列为评论与访谈集，书目年份为1986。','bibliographic_note','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2246','WCD10-B13-W209-F01','V1-CARD-0659','V1-ENT-0680','genre_or_form','文学评论','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2247','WCD10-B13-W209-F02','V1-CARD-0659','V1-ENT-0680','one_sentence_summary','作者作品目录将 Formas breves 列为文学评论，并记录其出版年份为 1999；本条仅说明体裁与书目身份。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2248','WCD10-B13-W209-F03','V1-CARD-0659','V1-ENT-0680','bibliographic_note','作者档案简介将 Formas breves 列为2000年；作品目录第85行列1999年。年份口径未解，本包不填写原子首版年。','bibliographic_note','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2249','WCD10-B13-W210-F01','V1-CARD-0660','V1-ENT-0681','genre_or_form','文学评论','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2250','WCD10-B13-W210-F02','V1-CARD-0660','V1-ENT-0681','one_sentence_summary','作者作品目录将 El último lector 列为文学评论，并记录其出版年份为 2005；本条仅说明体裁与书目身份。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2251','WCD10-B13-W210-F03','V1-CARD-0660','V1-ENT-0681','first_publication_year','2005','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2252','WCD10-B13-W210-F04','V1-CARD-0660','V1-ENT-0681','bibliographic_note','作者作品目录列为文学评论，书目年份为2005。','bibliographic_note','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2253','WCD10-B13-W211-F01','V1-CARD-0661','V1-ENT-0682','genre_or_form','日记／自传性作品','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2254','WCD10-B13-W211-F02','V1-CARD-0661','V1-ENT-0682','one_sentence_summary','作者作品目录将 Los diarios de Emilio Renzi. Años de formación 列为日记／自传性作品，并记录其出版年份为 2015；本条仅说明体裁与书目身份。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2255','WCD10-B13-W211-F03','V1-CARD-0661','V1-ENT-0682','first_publication_year','2015','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2256','WCD10-B13-W211-F04','V1-CARD-0661','V1-ENT-0682','bibliographic_note','作者作品目录列为日记／自传性作品，书目年份为2015。','bibliographic_note','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2257','WCD10-B13-W212-F01','V1-CARD-0662','V1-ENT-0683','genre_or_form','日记／自传性作品','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2258','WCD10-B13-W212-F02','V1-CARD-0662','V1-ENT-0683','one_sentence_summary','作者作品目录将 Los diarios de Emilio Renzi. Los años felices 列为日记／自传性作品，并记录其出版年份为 2016；本条仅说明体裁与书目身份。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2259','WCD10-B13-W212-F03','V1-CARD-0662','V1-ENT-0683','first_publication_year','2016','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2260','WCD10-B13-W212-F04','V1-CARD-0662','V1-ENT-0683','bibliographic_note','作者作品目录列为日记／自传性作品，书目年份为2016。','bibliographic_note','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2261','WCD10-B13-W213-F01','V1-CARD-0663','V1-ENT-0684','genre_or_form','日记／自传性作品','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2262','WCD10-B13-W213-F02','V1-CARD-0663','V1-ENT-0684','one_sentence_summary','作者作品目录将 Los diarios de Emilio Renzi. Un día en la vida 列为日记／自传性作品，并记录其出版年份为 2017；本条仅说明体裁与书目身份。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2263','WCD10-B13-W213-F03','V1-CARD-0663','V1-ENT-0684','first_publication_year','2017','bibliographic','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2264','WCD10-B13-W213-F04','V1-CARD-0663','V1-ENT-0684','bibliographic_note','作者作品目录列为日记／自传性作品，书目年份为2017。','bibliographic_note','WCD-10-B13','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2265','WCD10-B13-F001','V1-CARD-0664','V1-ENT-0269','genre_or_form','长篇小说','bibliographic','WCD-10-B13','high','batch_retained_candidate','仅增补当前来源支持的新字段，不覆盖或重述冻结基线既有字段。'),
('V1-FCT-2266','WCD10-B13-F002','V1-CARD-0664','V1-ENT-0269','one_sentence_summary','两位诗人沿着寻找墨西哥女诗人塞萨雷娅·蒂纳赫罗的线索展开旅程；出版方简介称叙事跨越1976至1996年及多个国家。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','仅增补当前来源支持的新字段，不覆盖或重述冻结基线既有字段。'),
('V1-FCT-2267','WCD10-B13-F003','V1-CARD-0665','V1-ENT-0270','genre_or_form','长篇小说','bibliographic','WCD-10-B13','high','batch_retained_candidate','仅增补当前来源支持的新字段，不覆盖或重述冻结基线既有字段。'),
('V1-FCT-2268','WCD10-B13-F004','V1-CARD-0665','V1-ENT-0270','one_sentence_summary','出版方简介以四位研究德国作家阿尔钦博尔迪的文学教授为线索，写他们前往虚构的圣特雷莎，并展开跨越两大洲和欧洲二十世纪历史的叙事。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','仅增补当前来源支持的新字段，不覆盖或重述冻结基线既有字段。'),
('V1-FCT-2269','WCD10-B13-F005','V1-CARD-0666','V1-ENT-0271','genre_or_form','长篇小说','bibliographic','WCD-10-B13','high','batch_retained_candidate','仅增补当前来源支持的新字段，不覆盖或重述冻结基线既有字段。'),
('V1-FCT-2270','WCD10-B13-F006','V1-CARD-0666','V1-ENT-0271','one_sentence_summary','出版方简介围绕诗人鲁伊斯-塔格莱与飞行员魏德尔身份重合展开，叙述者在智利政变前后追索其暴力艺术实践。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','仅增补当前来源支持的新字段，不覆盖或重述冻结基线既有字段。'),
('V1-FCT-2271','WCD10-B13-F101','V1-CARD-0667','V1-ENT-0276','one_sentence_summary','出版社简介称本卷以有文献依据的片段重述征服前至1700年的美洲历史，并写到原住民遭受的压迫。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','不改既有1982原子年份；出版社当前版信息不作为初版年。'),
('V1-FCT-2272','WCD10-B13-F102','V1-CARD-0668','V1-ENT-0277','genre_or_form','短篇叙事/图文散文','bibliographic','WCD-10-B13','high','batch_retained_candidate','补充体裁描述；保留既有1989首版原子事实。'),
('V1-FCT-2273','WCD10-B13-F103','V1-CARD-0668','V1-ENT-0277','one_sentence_summary','由庆典、逸事、编年、梦与记忆组成的短篇叙事，并结合作者版画和绘图。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','受限复述出版者简介；当前2023版日期不作为初版年。'),
('V1-FCT-2274','WCD10-B13-F104','V1-CARD-0669','V1-ENT-0275','one_sentence_summary','作者说明本书旨在传播被官方历史遮蔽或歪曲的事实，并以通俗、面向读者的方式讨论政治经济问题。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','保留旧有1971原子年份；出版社当前纪念版信息不改初版年。'),
('V1-FCT-2275','WCD10-B13-F253','V1-CARD-0670','V1-ENT-0278','genre_or_form','小说','bibliographic','WCD-10-B13','high','batch_retained_candidate','仅追加基线缺失的体裁和有界书目说明；逐项保留以下全部旧事实、卡片、关系、来源链、hold与gap。'),
('V1-FCT-2276','WCD10-B13-F254','V1-CARD-0670','V1-ENT-0278','one_sentence_summary','作者作品目录将 Respiración artificial 列为小说，并列出相关版本信息；本条仅作体裁与书目范围说明。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','仅追加基线缺失的体裁和有界书目说明；逐项保留以下全部旧事实、卡片、关系、来源链、hold与gap。'),
('V1-FCT-2277','WCD10-B13-F255','V1-CARD-0671','V1-ENT-0279','genre_or_form','小说','bibliographic','WCD-10-B13','high','batch_retained_candidate','仅追加基线缺失的体裁和有界书目说明；逐项保留以下全部旧事实、卡片、关系、来源链、hold与gap。'),
('V1-FCT-2278','WCD10-B13-F256','V1-CARD-0671','V1-ENT-0279','one_sentence_summary','作者作品目录将 Plata quemada 列为小说，并列出相关版本信息；本条仅作体裁与书目范围说明。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','仅追加基线缺失的体裁和有界书目说明；逐项保留以下全部旧事实、卡片、关系、来源链、hold与gap。'),
('V1-FCT-2279','WCD10-B13-F257','V1-CARD-0672','V1-ENT-0280','genre_or_form','小说','bibliographic','WCD-10-B13','high','batch_retained_candidate','仅追加基线缺失的体裁和有界书目说明；逐项保留以下全部旧事实、卡片、关系、来源链、hold与gap。'),
('V1-FCT-2280','WCD10-B13-F258','V1-CARD-0672','V1-ENT-0280','one_sentence_summary','作者作品目录将 Blanco nocturno 列为小说，并列出相关版本信息；本条仅作体裁与书目范围说明。','institutional_paraphrase','WCD-10-B13','high','batch_retained_candidate','仅追加基线缺失的体裁和有界书目说明；逐项保留以下全部旧事实、卡片、关系、来源链、hold与gap。');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-2177','SRC-0706','La literatura nazi en América — Editorial Anagrama'),
('V1-FCT-2178','SRC-0706','La literatura nazi en América — Editorial Anagrama'),
('V1-FCT-2179','SRC-0706','La literatura nazi en América — Editorial Anagrama'),
('V1-FCT-2180','SRC-0707','Amuleto — Editorial Anagrama'),
('V1-FCT-2181','SRC-0211','Roberto Bolaño (1953-2003) — Memoria Chilena'),
('V1-FCT-2182','SRC-0707','Amuleto — Editorial Anagrama'),
('V1-FCT-2183','SRC-0708','Nocturno de Chile — Editorial Anagrama'),
('V1-FCT-2184','SRC-0211','Roberto Bolaño (1953-2003) — Memoria Chilena'),
('V1-FCT-2185','SRC-0708','Nocturno de Chile — Editorial Anagrama'),
('V1-FCT-2186','SRC-0709','El gaucho insufrible — Editorial Anagrama'),
('V1-FCT-2187','SRC-0211','Roberto Bolaño (1953-2003) — Memoria Chilena'),
('V1-FCT-2188','SRC-0709','El gaucho insufrible — Editorial Anagrama'),
('V1-FCT-2189','SRC-0710','La pista de hielo — Editorial Anagrama'),
('V1-FCT-2190','SRC-0211','Roberto Bolaño (1953-2003) — Memoria Chilena'),
('V1-FCT-2191','SRC-0710','La pista de hielo — Editorial Anagrama'),
('V1-FCT-2192','SRC-0711','Llamadas telefónicas — Editorial Anagrama'),
('V1-FCT-2193','SRC-0711','Llamadas telefónicas — Editorial Anagrama'),
('V1-FCT-2194','SRC-0711','Llamadas telefónicas — Editorial Anagrama'),
('V1-FCT-2195','SRC-0712','Putas asesinas — Editorial Anagrama'),
('V1-FCT-2196','SRC-0712','Putas asesinas — Editorial Anagrama'),
('V1-FCT-2197','SRC-0712','Putas asesinas — Editorial Anagrama'),
('V1-FCT-2198','SRC-0214','Nace Eduardo Galeano — Uruguay Educa'),
('V1-FCT-2199','SRC-0214','Nace Eduardo Galeano — Uruguay Educa'),
('V1-FCT-2200','SRC-0214','Nace Eduardo Galeano — Uruguay Educa'),
('V1-FCT-2201','SRC-0214','Nace Eduardo Galeano — Uruguay Educa'),
('V1-FCT-2202','SRC-0214','Nace Eduardo Galeano — Uruguay Educa'),
('V1-FCT-2203','SRC-0716','El fútbol a sol y sombra — Siglo XXI Editores'),
('V1-FCT-2204','SRC-0716','El fútbol a sol y sombra — Siglo XXI Editores'),
('V1-FCT-2205','SRC-0214','Nace Eduardo Galeano — Uruguay Educa'),
('V1-FCT-2205','SRC-0716','El fútbol a sol y sombra — Siglo XXI Editores'),
('V1-FCT-2206','SRC-0214','Nace Eduardo Galeano — Uruguay Educa'),
('V1-FCT-2207','SRC-0713','Memoria del fuego. 2. Las caras y las máscaras — Siglo XXI Editores'),
('V1-FCT-2208','SRC-0713','Memoria del fuego. 2. Las caras y las máscaras — Siglo XXI Editores'),
('V1-FCT-2209','SRC-0214','Nace Eduardo Galeano — Uruguay Educa'),
('V1-FCT-2209','SRC-0713','Memoria del fuego. 2. Las caras y las máscaras — Siglo XXI Editores'),
('V1-FCT-2210','SRC-0214','Nace Eduardo Galeano — Uruguay Educa'),
('V1-FCT-2211','SRC-0714','Memoria del fuego. 3. El siglo del viento — Siglo XXI Editores'),
('V1-FCT-2212','SRC-0714','Memoria del fuego. 3. El siglo del viento — Siglo XXI Editores'),
('V1-FCT-2213','SRC-0214','Nace Eduardo Galeano — Uruguay Educa'),
('V1-FCT-2213','SRC-0714','Memoria del fuego. 3. El siglo del viento — Siglo XXI Editores'),
('V1-FCT-2214','SRC-0214','Nace Eduardo Galeano — Uruguay Educa'),
('V1-FCT-2215','SRC-0719','Espejos. Una historia casi universal — Siglo XXI Editores'),
('V1-FCT-2216','SRC-0719','Espejos. Una historia casi universal — Siglo XXI Editores'),
('V1-FCT-2217','SRC-0214','Nace Eduardo Galeano — Uruguay Educa'),
('V1-FCT-2217','SRC-0719','Espejos. Una historia casi universal — Siglo XXI Editores'),
('V1-FCT-2218','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2219','SRC-0722','La ciudad ausente — Editorial Anagrama'),
('V1-FCT-2220','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2221','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2221','SRC-0722','La ciudad ausente — Editorial Anagrama'),
('V1-FCT-2222','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2223','SRC-0723','El camino de Ida — Editorial Anagrama'),
('V1-FCT-2224','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2225','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2225','SRC-0723','El camino de Ida — Editorial Anagrama'),
('V1-FCT-2226','SRC-0724','Los casos del comisario Croce — Editorial Anagrama'),
('V1-FCT-2226','SRC-0721','Ricardo Piglia — Editorial Anagrama'),
('V1-FCT-2227','SRC-0724','Los casos del comisario Croce — Editorial Anagrama'),
('V1-FCT-2228','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2229','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2229','SRC-0724','Los casos del comisario Croce — Editorial Anagrama'),
('V1-FCT-2230','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2231','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2232','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2233','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2234','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2235','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2236','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2237','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2238','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2239','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2240','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2241','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2242','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2243','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2244','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2245','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2246','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2247','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2248','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2249','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2250','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2251','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2252','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2253','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2254','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2255','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2256','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2257','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2258','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2259','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2260','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2261','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2262','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2263','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2264','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2265','SRC-0703','Los detectives salvajes — Editorial Anagrama'),
('V1-FCT-2266','SRC-0703','Los detectives salvajes — Editorial Anagrama'),
('V1-FCT-2267','SRC-0704','2666 — Editorial Anagrama'),
('V1-FCT-2268','SRC-0704','2666 — Editorial Anagrama'),
('V1-FCT-2269','SRC-0705','Estrella distante — Editorial Anagrama'),
('V1-FCT-2270','SRC-0705','Estrella distante — Editorial Anagrama'),
('V1-FCT-2271','SRC-0718','Memoria del fuego. 1. Los nacimientos — Siglo XXI Editores'),
('V1-FCT-2272','SRC-0715','El libro de los abrazos — Siglo XXI Editores'),
('V1-FCT-2273','SRC-0715','El libro de los abrazos — Siglo XXI Editores'),
('V1-FCT-2274','SRC-0717','Las venas abiertas de América Latina — Siglo XXI Editores'),
('V1-FCT-2275','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2276','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2277','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2278','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2279','SRC-0720','OBRA · Ricardo Piglia'),
('V1-FCT-2280','SRC-0720','OBRA · Ricardo Piglia');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0640','V1-FCT-2177','batch_retained_candidate'),
('V1-CARD-0640','V1-FCT-2178','batch_retained_candidate'),
('V1-CARD-0640','V1-FCT-2179','batch_retained_candidate'),
('V1-CARD-0641','V1-FCT-2180','batch_retained_candidate'),
('V1-CARD-0641','V1-FCT-2181','batch_retained_candidate'),
('V1-CARD-0641','V1-FCT-2182','batch_retained_candidate'),
('V1-CARD-0642','V1-FCT-2183','batch_retained_candidate'),
('V1-CARD-0642','V1-FCT-2184','batch_retained_candidate'),
('V1-CARD-0642','V1-FCT-2185','batch_retained_candidate'),
('V1-CARD-0643','V1-FCT-2186','batch_retained_candidate'),
('V1-CARD-0643','V1-FCT-2187','batch_retained_candidate'),
('V1-CARD-0643','V1-FCT-2188','batch_retained_candidate'),
('V1-CARD-0644','V1-FCT-2189','batch_retained_candidate'),
('V1-CARD-0644','V1-FCT-2190','batch_retained_candidate'),
('V1-CARD-0644','V1-FCT-2191','batch_retained_candidate'),
('V1-CARD-0645','V1-FCT-2192','batch_retained_candidate'),
('V1-CARD-0645','V1-FCT-2193','batch_retained_candidate'),
('V1-CARD-0645','V1-FCT-2194','batch_retained_candidate'),
('V1-CARD-0646','V1-FCT-2195','batch_retained_candidate'),
('V1-CARD-0646','V1-FCT-2196','batch_retained_candidate'),
('V1-CARD-0646','V1-FCT-2197','batch_retained_candidate'),
('V1-CARD-0647','V1-FCT-2198','batch_retained_candidate'),
('V1-CARD-0647','V1-FCT-2199','batch_retained_candidate'),
('V1-CARD-0647','V1-FCT-2200','batch_retained_candidate'),
('V1-CARD-0647','V1-FCT-2201','batch_retained_candidate'),
('V1-CARD-0648','V1-FCT-2202','batch_retained_candidate'),
('V1-CARD-0648','V1-FCT-2203','batch_retained_candidate'),
('V1-CARD-0648','V1-FCT-2204','batch_retained_candidate'),
('V1-CARD-0648','V1-FCT-2205','batch_retained_candidate'),
('V1-CARD-0649','V1-FCT-2206','batch_retained_candidate'),
('V1-CARD-0649','V1-FCT-2207','batch_retained_candidate'),
('V1-CARD-0649','V1-FCT-2208','batch_retained_candidate'),
('V1-CARD-0649','V1-FCT-2209','batch_retained_candidate'),
('V1-CARD-0650','V1-FCT-2210','batch_retained_candidate'),
('V1-CARD-0650','V1-FCT-2211','batch_retained_candidate'),
('V1-CARD-0650','V1-FCT-2212','batch_retained_candidate'),
('V1-CARD-0650','V1-FCT-2213','batch_retained_candidate'),
('V1-CARD-0651','V1-FCT-2214','batch_retained_candidate'),
('V1-CARD-0651','V1-FCT-2215','batch_retained_candidate'),
('V1-CARD-0651','V1-FCT-2216','batch_retained_candidate'),
('V1-CARD-0651','V1-FCT-2217','batch_retained_candidate'),
('V1-CARD-0652','V1-FCT-2218','batch_retained_candidate'),
('V1-CARD-0652','V1-FCT-2219','batch_retained_candidate'),
('V1-CARD-0652','V1-FCT-2220','batch_retained_candidate'),
('V1-CARD-0652','V1-FCT-2221','batch_retained_candidate'),
('V1-CARD-0653','V1-FCT-2222','batch_retained_candidate'),
('V1-CARD-0653','V1-FCT-2223','batch_retained_candidate'),
('V1-CARD-0653','V1-FCT-2224','batch_retained_candidate'),
('V1-CARD-0653','V1-FCT-2225','batch_retained_candidate'),
('V1-CARD-0654','V1-FCT-2226','batch_retained_candidate'),
('V1-CARD-0654','V1-FCT-2227','batch_retained_candidate'),
('V1-CARD-0654','V1-FCT-2228','batch_retained_candidate'),
('V1-CARD-0654','V1-FCT-2229','batch_retained_candidate'),
('V1-CARD-0655','V1-FCT-2230','batch_retained_candidate'),
('V1-CARD-0655','V1-FCT-2231','batch_retained_candidate'),
('V1-CARD-0655','V1-FCT-2232','batch_retained_candidate'),
('V1-CARD-0655','V1-FCT-2233','batch_retained_candidate'),
('V1-CARD-0656','V1-FCT-2234','batch_retained_candidate'),
('V1-CARD-0656','V1-FCT-2235','batch_retained_candidate'),
('V1-CARD-0656','V1-FCT-2236','batch_retained_candidate'),
('V1-CARD-0656','V1-FCT-2237','batch_retained_candidate'),
('V1-CARD-0657','V1-FCT-2238','batch_retained_candidate'),
('V1-CARD-0657','V1-FCT-2239','batch_retained_candidate'),
('V1-CARD-0657','V1-FCT-2240','batch_retained_candidate'),
('V1-CARD-0657','V1-FCT-2241','batch_retained_candidate'),
('V1-CARD-0658','V1-FCT-2242','batch_retained_candidate'),
('V1-CARD-0658','V1-FCT-2243','batch_retained_candidate'),
('V1-CARD-0658','V1-FCT-2244','batch_retained_candidate'),
('V1-CARD-0658','V1-FCT-2245','batch_retained_candidate'),
('V1-CARD-0659','V1-FCT-2246','batch_retained_candidate'),
('V1-CARD-0659','V1-FCT-2247','batch_retained_candidate'),
('V1-CARD-0659','V1-FCT-2248','batch_retained_candidate'),
('V1-CARD-0660','V1-FCT-2249','batch_retained_candidate'),
('V1-CARD-0660','V1-FCT-2250','batch_retained_candidate'),
('V1-CARD-0660','V1-FCT-2251','batch_retained_candidate'),
('V1-CARD-0660','V1-FCT-2252','batch_retained_candidate'),
('V1-CARD-0661','V1-FCT-2253','batch_retained_candidate'),
('V1-CARD-0661','V1-FCT-2254','batch_retained_candidate'),
('V1-CARD-0661','V1-FCT-2255','batch_retained_candidate'),
('V1-CARD-0661','V1-FCT-2256','batch_retained_candidate'),
('V1-CARD-0662','V1-FCT-2257','batch_retained_candidate'),
('V1-CARD-0662','V1-FCT-2258','batch_retained_candidate'),
('V1-CARD-0662','V1-FCT-2259','batch_retained_candidate'),
('V1-CARD-0662','V1-FCT-2260','batch_retained_candidate'),
('V1-CARD-0663','V1-FCT-2261','batch_retained_candidate'),
('V1-CARD-0663','V1-FCT-2262','batch_retained_candidate'),
('V1-CARD-0663','V1-FCT-2263','batch_retained_candidate'),
('V1-CARD-0663','V1-FCT-2264','batch_retained_candidate'),
('V1-CARD-0664','V1-FCT-2265','batch_retained_candidate'),
('V1-CARD-0664','V1-FCT-2266','batch_retained_candidate'),
('V1-CARD-0665','V1-FCT-2267','batch_retained_candidate'),
('V1-CARD-0665','V1-FCT-2268','batch_retained_candidate'),
('V1-CARD-0666','V1-FCT-2269','batch_retained_candidate'),
('V1-CARD-0666','V1-FCT-2270','batch_retained_candidate'),
('V1-CARD-0667','V1-FCT-2271','batch_retained_candidate'),
('V1-CARD-0668','V1-FCT-2272','batch_retained_candidate'),
('V1-CARD-0668','V1-FCT-2273','batch_retained_candidate'),
('V1-CARD-0669','V1-FCT-2274','batch_retained_candidate'),
('V1-CARD-0670','V1-FCT-2275','batch_retained_candidate'),
('V1-CARD-0670','V1-FCT-2276','batch_retained_candidate'),
('V1-CARD-0671','V1-FCT-2277','batch_retained_candidate'),
('V1-CARD-0671','V1-FCT-2278','batch_retained_candidate'),
('V1-CARD-0672','V1-FCT-2279','batch_retained_candidate'),
('V1-CARD-0672','V1-FCT-2280','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-1326','WCD10-B13-S006','V1-CARD-0640','SRC-0706','B','bibliography_or_bounded_description','yes','no','SRC-0706','accepted','NONE'),
('V1-CS-1327','WCD10-B13-S001','V1-CARD-0641','SRC-0211','B','bibliography_or_bounded_description','yes','no','SRC-0211','accepted','NONE'),
('V1-CS-1328','WCD10-B13-S007','V1-CARD-0641','SRC-0707','B','bibliography_or_bounded_description','yes','no','SRC-0707','accepted','NONE'),
('V1-CS-1329','WCD10-B13-S001','V1-CARD-0642','SRC-0211','B','bibliography_or_bounded_description','yes','no','SRC-0211','accepted','NONE'),
('V1-CS-1330','WCD10-B13-S008','V1-CARD-0642','SRC-0708','B','bibliography_or_bounded_description','yes','no','SRC-0708','accepted','NONE'),
('V1-CS-1331','WCD10-B13-S001','V1-CARD-0643','SRC-0211','B','bibliography_or_bounded_description','yes','no','SRC-0211','accepted','NONE'),
('V1-CS-1332','WCD10-B13-S009','V1-CARD-0643','SRC-0709','B','bibliography_or_bounded_description','yes','no','SRC-0709','accepted','NONE'),
('V1-CS-1333','WCD10-B13-S001','V1-CARD-0644','SRC-0211','B','bibliography_or_bounded_description','yes','no','SRC-0211','accepted','NONE'),
('V1-CS-1334','WCD10-B13-S010','V1-CARD-0644','SRC-0710','B','bibliography_or_bounded_description','yes','no','SRC-0710','accepted','NONE'),
('V1-CS-1335','WCD10-B13-S011','V1-CARD-0645','SRC-0711','B','bibliography_or_bounded_description','yes','no','SRC-0711','accepted','NONE'),
('V1-CS-1336','WCD10-B13-S012','V1-CARD-0646','SRC-0712','B','bibliography_or_bounded_description','yes','no','SRC-0712','accepted','NONE'),
('V1-CS-1337','WCD10-B13-S101','V1-CARD-0647','SRC-0214','B','bibliography_or_bounded_description','yes','no','SRC-0214','accepted','NONE'),
('V1-CS-1338','WCD10-B13-S101','V1-CARD-0648','SRC-0214','B','bibliography_or_bounded_description','yes','no','SRC-0214','accepted','NONE'),
('V1-CS-1339','WCD10-B13-S106','V1-CARD-0648','SRC-0716','B','bibliography_or_bounded_description','yes','no','SRC-0716','accepted','NONE'),
('V1-CS-1340','WCD10-B13-S101','V1-CARD-0649','SRC-0214','B','bibliography_or_bounded_description','yes','no','SRC-0214','accepted','NONE'),
('V1-CS-1341','WCD10-B13-S103','V1-CARD-0649','SRC-0713','B','bibliography_or_bounded_description','yes','no','SRC-0713','accepted','NONE'),
('V1-CS-1342','WCD10-B13-S101','V1-CARD-0650','SRC-0214','B','bibliography_or_bounded_description','yes','no','SRC-0214','accepted','NONE'),
('V1-CS-1343','WCD10-B13-S104','V1-CARD-0650','SRC-0714','B','bibliography_or_bounded_description','yes','no','SRC-0714','accepted','NONE'),
('V1-CS-1344','WCD10-B13-S101','V1-CARD-0651','SRC-0214','B','bibliography_or_bounded_description','yes','no','SRC-0214','accepted','NONE'),
('V1-CS-1345','WCD10-B13-S109','V1-CARD-0651','SRC-0719','B','bibliography_or_bounded_description','yes','no','SRC-0719','accepted','NONE'),
('V1-CS-1346','WCD10-B13-S201','V1-CARD-0652','SRC-0720','B','bibliography_or_bounded_description','yes','no','SRC-0217','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1347','WCD10-B13-S203','V1-CARD-0652','SRC-0722','B','bibliography_or_bounded_description','yes','no','SRC-0722','accepted','NONE'),
('V1-CS-1348','WCD10-B13-S201','V1-CARD-0653','SRC-0720','B','bibliography_or_bounded_description','yes','no','SRC-0217','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1349','WCD10-B13-S204','V1-CARD-0653','SRC-0723','B','bibliography_or_bounded_description','yes','no','SRC-0723','accepted','NONE'),
('V1-CS-1350','WCD10-B13-S201','V1-CARD-0654','SRC-0720','B','bibliography_or_bounded_description','yes','no','SRC-0217','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1351','WCD10-B13-S202','V1-CARD-0654','SRC-0721','B','bibliography_or_bounded_description','yes','no','SRC-0721','accepted','NONE'),
('V1-CS-1352','WCD10-B13-S205','V1-CARD-0654','SRC-0724','B','bibliography_or_bounded_description','yes','no','SRC-0724','accepted','NONE'),
('V1-CS-1353','WCD10-B13-S201','V1-CARD-0655','SRC-0720','B','bibliography_or_bounded_description','yes','no','SRC-0217','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1354','WCD10-B13-S201','V1-CARD-0656','SRC-0720','B','bibliography_or_bounded_description','yes','no','SRC-0217','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1355','WCD10-B13-S201','V1-CARD-0657','SRC-0720','B','bibliography_or_bounded_description','yes','no','SRC-0217','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1356','WCD10-B13-S201','V1-CARD-0658','SRC-0720','B','bibliography_or_bounded_description','yes','no','SRC-0217','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1357','WCD10-B13-S201','V1-CARD-0659','SRC-0720','B','bibliography_or_bounded_description','yes','no','SRC-0217','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1358','WCD10-B13-S201','V1-CARD-0660','SRC-0720','B','bibliography_or_bounded_description','yes','no','SRC-0217','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1359','WCD10-B13-S201','V1-CARD-0661','SRC-0720','B','bibliography_or_bounded_description','yes','no','SRC-0217','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1360','WCD10-B13-S201','V1-CARD-0662','SRC-0720','B','bibliography_or_bounded_description','yes','no','SRC-0217','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1361','WCD10-B13-S201','V1-CARD-0663','SRC-0720','B','bibliography_or_bounded_description','yes','no','SRC-0217','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1362','WCD10-B13-S003','V1-CARD-0664','SRC-0703','B','bibliography_or_bounded_description','yes','no','SRC-0703','accepted','NONE'),
('V1-CS-1363','WCD10-B13-S004','V1-CARD-0665','SRC-0704','B','bibliography_or_bounded_description','yes','no','SRC-0704','accepted','NONE'),
('V1-CS-1364','WCD10-B13-S005','V1-CARD-0666','SRC-0705','B','bibliography_or_bounded_description','yes','no','SRC-0705','accepted','NONE'),
('V1-CS-1365','WCD10-B13-S108','V1-CARD-0667','SRC-0718','B','bibliography_or_bounded_description','no','no','SRC-0718','accepted','NONE'),
('V1-CS-1366','WCD10-B13-S105','V1-CARD-0668','SRC-0715','B','bibliography_or_bounded_description','yes','no','SRC-0715','accepted','NONE'),
('V1-CS-1367','WCD10-B13-S107','V1-CARD-0669','SRC-0717','B','bibliography_or_bounded_description','no','no','SRC-0717','accepted','NONE'),
('V1-CS-1368','WCD10-B13-S201','V1-CARD-0670','SRC-0720','B','bibliography_or_bounded_description','yes','no','SRC-0217','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1369','WCD10-B13-S201','V1-CARD-0671','SRC-0720','B','bibliography_or_bounded_description','yes','no','SRC-0217','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1370','WCD10-B13-S201','V1-CARD-0672','SRC-0720','B','bibliography_or_bounded_description','yes','no','SRC-0217','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0630','WCD-10-B13','WCD10-B13-W001-CREATED','V1-ENT-0262','CREATED','V1-ENT-0661','罗贝托·波拉尼奥创作《La literatura nazi en América》。','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0631','WCD-10-B13','WCD10-B13-W002-CREATED','V1-ENT-0262','CREATED','V1-ENT-0662','罗贝托·波拉尼奥创作《Amuleto》。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0632','WCD-10-B13','WCD10-B13-W003-CREATED','V1-ENT-0262','CREATED','V1-ENT-0663','罗贝托·波拉尼奥创作《Nocturno de Chile》。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0633','WCD-10-B13','WCD10-B13-W004-CREATED','V1-ENT-0262','CREATED','V1-ENT-0664','罗贝托·波拉尼奥创作《El gaucho insufrible》。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0634','WCD-10-B13','WCD10-B13-W005-CREATED','V1-ENT-0262','CREATED','V1-ENT-0665','罗贝托·波拉尼奥创作《La pista de hielo》。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0635','WCD-10-B13','WCD10-B13-W006-CREATED','V1-ENT-0262','CREATED','V1-ENT-0666','罗贝托·波拉尼奥创作《Llamadas telefónicas》。','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0636','WCD-10-B13','WCD10-B13-W007-CREATED','V1-ENT-0262','CREATED','V1-ENT-0667','罗贝托·波拉尼奥创作《Putas asesinas》。','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0637','WCD-10-B13','WCD10-B13-W101-CREATED','V1-ENT-0272','CREATED','V1-ENT-0668','爱德华多·加莱亚诺创作 Los días siguientes','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0638','WCD-10-B13','WCD10-B13-W102-CREATED','V1-ENT-0272','CREATED','V1-ENT-0669','爱德华多·加莱亚诺创作 El fútbol a sol y sombra','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0639','WCD-10-B13','WCD10-B13-W103-CREATED','V1-ENT-0272','CREATED','V1-ENT-0670','爱德华多·加莱亚诺创作 Memoria del fuego II. Las caras y las máscaras','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0640','WCD-10-B13','WCD10-B13-W104-CREATED','V1-ENT-0272','CREATED','V1-ENT-0671','爱德华多·加莱亚诺创作 Memoria del fuego III. El siglo del viento','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0641','WCD-10-B13','WCD10-B13-W105-CREATED','V1-ENT-0272','CREATED','V1-ENT-0672','爱德华多·加莱亚诺创作 Espejos. Una historia casi universal','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0642','WCD-10-B13','WCD10-B13-W201-CREATED','V1-ENT-0273','CREATED','V1-ENT-0673','里卡多·皮格利亚创作 La ciudad ausente','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0643','WCD-10-B13','WCD10-B13-W202-CREATED','V1-ENT-0273','CREATED','V1-ENT-0674','里卡多·皮格利亚创作 El camino de ida','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0644','WCD-10-B13','WCD10-B13-W203-CREATED','V1-ENT-0273','CREATED','V1-ENT-0675','里卡多·皮格利亚创作 Los casos del comisario Croce','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0645','WCD-10-B13','WCD10-B13-W205-CREATED','V1-ENT-0273','CREATED','V1-ENT-0676','里卡多·皮格利亚创作 La invasión','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0646','WCD-10-B13','WCD10-B13-W206-CREATED','V1-ENT-0273','CREATED','V1-ENT-0677','里卡多·皮格利亚创作 Nombre falso','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0647','WCD-10-B13','WCD10-B13-W207-CREATED','V1-ENT-0273','CREATED','V1-ENT-0678','里卡多·皮格利亚创作 Prisión perpetua','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0648','WCD-10-B13','WCD10-B13-W208-CREATED','V1-ENT-0273','CREATED','V1-ENT-0679','里卡多·皮格利亚创作 Crítica y ficción','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0649','WCD-10-B13','WCD10-B13-W209-CREATED','V1-ENT-0273','CREATED','V1-ENT-0680','里卡多·皮格利亚创作 Formas breves','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0650','WCD-10-B13','WCD10-B13-W210-CREATED','V1-ENT-0273','CREATED','V1-ENT-0681','里卡多·皮格利亚创作 El último lector','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0651','WCD-10-B13','WCD10-B13-W211-CREATED','V1-ENT-0273','CREATED','V1-ENT-0682','里卡多·皮格利亚创作 Los diarios de Emilio Renzi. Años de formación','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0652','WCD-10-B13','WCD10-B13-W212-CREATED','V1-ENT-0273','CREATED','V1-ENT-0683','里卡多·皮格利亚创作 Los diarios de Emilio Renzi. Los años felices','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0653','WCD-10-B13','WCD10-B13-W213-CREATED','V1-ENT-0273','CREATED','V1-ENT-0684','里卡多·皮格利亚创作 Los diarios de Emilio Renzi. Un día en la vida','high','accepted','Codex-parent-independent-review:PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0630','SRC-0706'),
('V1-REL-0631','SRC-0211'),
('V1-REL-0631','SRC-0707'),
('V1-REL-0632','SRC-0211'),
('V1-REL-0632','SRC-0708'),
('V1-REL-0633','SRC-0211'),
('V1-REL-0633','SRC-0709'),
('V1-REL-0634','SRC-0211'),
('V1-REL-0634','SRC-0710'),
('V1-REL-0635','SRC-0711'),
('V1-REL-0636','SRC-0712'),
('V1-REL-0637','SRC-0214'),
('V1-REL-0638','SRC-0214'),
('V1-REL-0638','SRC-0716'),
('V1-REL-0639','SRC-0214'),
('V1-REL-0639','SRC-0713'),
('V1-REL-0640','SRC-0214'),
('V1-REL-0640','SRC-0714'),
('V1-REL-0641','SRC-0214'),
('V1-REL-0641','SRC-0719'),
('V1-REL-0642','SRC-0720'),
('V1-REL-0643','SRC-0720'),
('V1-REL-0644','SRC-0720'),
('V1-REL-0645','SRC-0720'),
('V1-REL-0646','SRC-0720'),
('V1-REL-0647','SRC-0720'),
('V1-REL-0648','SRC-0720'),
('V1-REL-0649','SRC-0720'),
('V1-REL-0650','SRC-0720'),
('V1-REL-0651','SRC-0720'),
('V1-REL-0652','SRC-0720'),
('V1-REL-0653','SRC-0720');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0953','V1-REL-0630','WCD10-B13-S006','SRC-0706','La literatura nazi en América — Editorial Anagrama','第73-78、150-157行：作品体裁、结构描述及1996出版陈述；实读2026-10-13。','罗贝托·波拉尼奥创作《La literatura nazi en América》。','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0954','V1-REL-0631','WCD10-B13-S001','SRC-0211','Roberto Bolaño (1953-2003) — Memoria Chilena','第105-111行：作品出版时间、合作创作及身后出版；实读2026-10-13。','罗贝托·波拉尼奥创作《Amuleto》。','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0955','V1-REL-0631','WCD10-B13-S007','SRC-0707','Amuleto — Editorial Anagrama','第75-78、141-144行：作品简介；实读2026-10-13。','罗贝托·波拉尼奥创作《Amuleto》。','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0956','V1-REL-0632','WCD10-B13-S001','SRC-0211','Roberto Bolaño (1953-2003) — Memoria Chilena','第105-111行：作品出版时间、合作创作及身后出版；实读2026-10-13。','罗贝托·波拉尼奥创作《Nocturno de Chile》。','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0957','V1-REL-0632','WCD10-B13-S008','SRC-0708','Nocturno de Chile — Editorial Anagrama','第75-78行：出版方作品简介；实读2026-10-13。','罗贝托·波拉尼奥创作《Nocturno de Chile》。','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0958','V1-REL-0633','WCD10-B13-S001','SRC-0211','Roberto Bolaño (1953-2003) — Memoria Chilena','第105-111行：作品出版时间、合作创作及身后出版；实读2026-10-13。','罗贝托·波拉尼奥创作《El gaucho insufrible》。','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0959','V1-REL-0633','WCD10-B13-S009','SRC-0709','El gaucho insufrible — Editorial Anagrama','第75-79、142-144行：五篇小说与两篇演讲的目录性说明；实读2026-10-13。','罗贝托·波拉尼奥创作《El gaucho insufrible》。','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0960','V1-REL-0634','WCD10-B13-S001','SRC-0211','Roberto Bolaño (1953-2003) — Memoria Chilena','第105-111行：作品出版时间、合作创作及身后出版；实读2026-10-13。','罗贝托·波拉尼奥创作《La pista de hielo》。','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0961','V1-REL-0634','WCD10-B13-S010','SRC-0710','La pista de hielo — Editorial Anagrama','第75-78、141-144行：三种叙述版本和谋杀线索；实读2026-10-13。','罗贝托·波拉尼奥创作《La pista de hielo》。','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0962','V1-REL-0635','WCD10-B13-S011','SRC-0711','Llamadas telefónicas — Editorial Anagrama','第77-83、87-112、147-153行：短篇集简介及本版1997-09-01出版信息；实读2026-10-13。','罗贝托·波拉尼奥创作《Llamadas telefónicas》。','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0963','V1-REL-0636','WCD10-B13-S012','SRC-0712','Putas asesinas — Editorial Anagrama','第75-81、85-109、145-151行：短篇集简介及本版2001-09-01出版信息；实读2026-10-13。','罗贝托·波拉尼奥创作《Putas asesinas》。','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0964','V1-REL-0637','WCD10-B13-S101','SRC-0214','Nace Eduardo Galeano — Uruguay Educa','实读2026-10-13。第17行：Los días siguientes为Galeano于1963年出版的第一部小说；第61行：El fútbol a sol y sombra列于1995年。','爱德华多·加莱亚诺创作 Los días siguientes','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0965','V1-REL-0638','WCD10-B13-S101','SRC-0214','Nace Eduardo Galeano — Uruguay Educa','实读2026-10-13。第17行：Los días siguientes为Galeano于1963年出版的第一部小说；第61行：El fútbol a sol y sombra列于1995年。','爱德华多·加莱亚诺创作 El fútbol a sol y sombra','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0966','V1-REL-0638','WCD10-B13-S106','SRC-0716','El fútbol a sol y sombra — Siglo XXI Editores','实读2026-10-13。第27-34行：作者；作品向足球致意，也批评足球商业权力结构，批判职业体育技术官僚化压制快乐、想象和冒险；当前版含2014世界杯相关文字。第37-48行当前版信息。','爱德华多·加莱亚诺创作 El fútbol a sol y sombra','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0967','V1-REL-0639','WCD10-B13-S101','SRC-0214','Nace Eduardo Galeano — Uruguay Educa','实读2026-10-13。第17行：Los días siguientes为Galeano于1963年出版的第一部小说；第61行：El fútbol a sol y sombra列于1995年。','爱德华多·加莱亚诺创作 Memoria del fuego II. Las caras y las máscaras','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0968','V1-REL-0639','WCD10-B13-S103','SRC-0713','Memoria del fuego. 2. Las caras y las máscaras — Siglo XXI Editores','实读2026-10-13。第27-31行：作者、第二卷身份；以有据小故事讲述拉美18—19世纪独立战争、革命及国家形成过程。第38-45行当前版书目信息。','爱德华多·加莱亚诺创作 Memoria del fuego II. Las caras y las máscaras','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0969','V1-REL-0640','WCD10-B13-S101','SRC-0214','Nace Eduardo Galeano — Uruguay Educa','实读2026-10-13。第17行：Los días siguientes为Galeano于1963年出版的第一部小说；第61行：El fútbol a sol y sombra列于1995年。','爱德华多·加莱亚诺创作 Memoria del fuego III. El siglo del viento','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0970','V1-REL-0640','WCD10-B13-S104','SRC-0714','Memoria del fuego. 3. El siglo del viento — Siglo XXI Editores','实读2026-10-13。第27-30行：作者、第三卷身份；以日常小故事叙述美洲20世纪动荡，并呈现历史从博物馆走回现实的写作意图。第37-44行当前版书目信息。','爱德华多·加莱亚诺创作 Memoria del fuego III. El siglo del viento','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0971','V1-REL-0641','WCD10-B13-S101','SRC-0214','Nace Eduardo Galeano — Uruguay Educa','实读2026-10-13。第17行：Los días siguientes为Galeano于1963年出版的第一部小说；第61行：El fútbol a sol y sombra列于1995年。','爱德华多·加莱亚诺创作 Espejos. Una historia casi universal','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0972','V1-REL-0641','WCD10-B13-S109','SRC-0719','Espejos. Una historia casi universal — Siglo XXI Editores','实读2026-10-13。第27-38行：作者；叙述将过去与现在连接，关注被忽略的普通人、女性、南方和东方等群体；馆方分类含历史/叙事。第43-50行当前版2008出版信息。','爱德华多·加莱亚诺创作 Espejos. Una historia casi universal','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0973','V1-REL-0642','WCD10-B13-S201','SRC-0720','OBRA · Ricardo Piglia','页面第15-18行列作者身份、代表小说与文集；第20-110行按体裁列作品目录及出版者/年份。实读2026-10-13。','里卡多·皮格利亚创作 La ciudad ausente','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0974','V1-REL-0643','WCD10-B13-S201','SRC-0720','OBRA · Ricardo Piglia','页面第15-18行列作者身份、代表小说与文集；第20-110行按体裁列作品目录及出版者/年份。实读2026-10-13。','里卡多·皮格利亚创作 El camino de ida','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0975','V1-REL-0644','WCD10-B13-S201','SRC-0720','OBRA · Ricardo Piglia','页面第15-18行列作者身份、代表小说与文集；第20-110行按体裁列作品目录及出版者/年份。实读2026-10-13。','里卡多·皮格利亚创作 Los casos del comisario Croce','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0976','V1-REL-0645','WCD10-B13-S201','SRC-0720','OBRA · Ricardo Piglia','页面第15-18行列作者身份、代表小说与文集；第20-110行按体裁列作品目录及出版者/年份。实读2026-10-13。','里卡多·皮格利亚创作 La invasión','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0977','V1-REL-0646','WCD10-B13-S201','SRC-0720','OBRA · Ricardo Piglia','页面第15-18行列作者身份、代表小说与文集；第20-110行按体裁列作品目录及出版者/年份。实读2026-10-13。','里卡多·皮格利亚创作 Nombre falso','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0978','V1-REL-0647','WCD10-B13-S201','SRC-0720','OBRA · Ricardo Piglia','页面第15-18行列作者身份、代表小说与文集；第20-110行按体裁列作品目录及出版者/年份。实读2026-10-13。','里卡多·皮格利亚创作 Prisión perpetua','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0979','V1-REL-0648','WCD10-B13-S201','SRC-0720','OBRA · Ricardo Piglia','页面第15-18行列作者身份、代表小说与文集；第20-110行按体裁列作品目录及出版者/年份。实读2026-10-13。','里卡多·皮格利亚创作 Crítica y ficción','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0980','V1-REL-0649','WCD10-B13-S201','SRC-0720','OBRA · Ricardo Piglia','页面第15-18行列作者身份、代表小说与文集；第20-110行按体裁列作品目录及出版者/年份。实读2026-10-13。','里卡多·皮格利亚创作 Formas breves','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0981','V1-REL-0650','WCD10-B13-S201','SRC-0720','OBRA · Ricardo Piglia','页面第15-18行列作者身份、代表小说与文集；第20-110行按体裁列作品目录及出版者/年份。实读2026-10-13。','里卡多·皮格利亚创作 El último lector','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0982','V1-REL-0651','WCD10-B13-S201','SRC-0720','OBRA · Ricardo Piglia','页面第15-18行列作者身份、代表小说与文集；第20-110行按体裁列作品目录及出版者/年份。实读2026-10-13。','里卡多·皮格利亚创作 Los diarios de Emilio Renzi. Años de formación','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0983','V1-REL-0652','WCD10-B13-S201','SRC-0720','OBRA · Ricardo Piglia','页面第15-18行列作者身份、代表小说与文集；第20-110行按体裁列作品目录及出版者/年份。实读2026-10-13。','里卡多·皮格利亚创作 Los diarios de Emilio Renzi. Los años felices','high','eligible_evidence','WCD-10-B13'),
('V1-EV-0984','V1-REL-0653','WCD10-B13-S201','SRC-0720','OBRA · Ricardo Piglia','页面第15-18行列作者身份、代表小说与文集；第20-110行按体裁列作品目录及出版者/年份。实读2026-10-13。','里卡多·皮格利亚创作 Los diarios de Emilio Renzi. Un día en la vida','high','eligible_evidence','WCD-10-B13');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0463','WCD-10-B13-G01','research_gap','V1-ENT-0262::Consejos de un discípulo de Morrison a un fanático de Joyce','open','Memoria Chilena明确记载1984年首部长篇小说为与Antoni García Porta合著，但当前作者baseline仅有三部链接作品；本包只做本任务单作者，不改作者关系层或替其他作者建立共著归属。建议integrator/后续受控任务检查作品对象和双作者CREATED关系。','','Independent Reviewer: preserve deferred','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0464','WCD-10-B13-G02','research_gap','V1-ENT-0273.Jaulario','open','作者档案分别列 Jaulario 与 La invasión，均为1967年；两者可能有版本关联，本包资料未足以确认独立身份或等同。','','Independent Reviewer: preserve deferred edition identity; retain source-reported 1967 listing only','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0465','WCD-10-B13-G03','research_gap','WCD10-B13-W209.first_publication_year','open','作者档案简介称Formas breves为2000年，作品目录第85行列1999年；未能解决口径，原子首版年留空，书目注记保留两处版本表述。','','Independent Reviewer: preserve deferred year conflict','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0466','WCD-10-B13:V1-ENT-0269','research_gap','WCD10:work_level_research:V1-ENT-0269','open','来源覆盖侧重机构书目/出版方简介，不代表全面学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0467','WCD-10-B13:V1-ENT-0270','research_gap','WCD10:work_level_research:V1-ENT-0270','open','来源覆盖侧重机构书目/出版方简介，不代表全面学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0468','WCD-10-B13:V1-ENT-0271','research_gap','WCD10:work_level_research:V1-ENT-0271','open','来源覆盖侧重机构书目/出版方简介，不代表全面学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0469','WCD-10-B13:WCD10-B13-W001','research_gap','WCD10:work_level_research:V1-ENT-0661','open','出版方说明仅作bounded institutional commentary，不等于学术研究覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0470','WCD-10-B13:WCD10-B13-W002','research_gap','WCD10:work_level_research:V1-ENT-0662','open','出版方说明仅作bounded institutional commentary，不等于学术研究覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0471','WCD-10-B13:WCD10-B13-W003','research_gap','WCD10:work_level_research:V1-ENT-0663','open','出版方说明仅作bounded institutional commentary，不等于学术研究覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0472','WCD-10-B13:WCD10-B13-W004','research_gap','WCD10:work_level_research:V1-ENT-0664','open','出版方说明仅作bounded institutional commentary，不等于学术研究覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0473','WCD-10-B13:WCD10-B13-W005','research_gap','WCD10:work_level_research:V1-ENT-0665','open','出版方说明仅作bounded institutional commentary，不等于学术研究覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0474','WCD-10-B13:WCD10-B13-W006','research_gap','WCD10:work_level_research:V1-ENT-0666','open','出版商简介作为有边界机构评论使用，不代表学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0475','WCD-10-B13:WCD10-B13-W007','research_gap','WCD10:work_level_research:V1-ENT-0667','open','出版商简介作为有边界机构评论使用，不代表学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0476','WCD-10-B13:V1-ENT-0275','research_gap','WCD10:work_level_research:V1-ENT-0275','open','既有事实/卡片/关系及其证据保持基线原值。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0477','WCD-10-B13:V1-ENT-0276','research_gap','WCD10:work_level_research:V1-ENT-0276','open','既有事实/卡片/关系及其证据保持基线原值。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0478','WCD-10-B13:V1-ENT-0277','research_gap','WCD10:work_level_research:V1-ENT-0277','open','既有事实/卡片/关系及其证据保持基线原值。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0479','WCD-10-B13:WCD10-B13-W101','research_gap','WCD10:work_level_research:V1-ENT-0668','open','未完成的体裁/情节细节保持空缺，不据年表推断。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0480','WCD-10-B13:WCD10-B13-W102','research_gap','WCD10:work_level_research:V1-ENT-0669','open','未完成的体裁/情节细节保持空缺，不据年表推断。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0481','WCD-10-B13:WCD10-B13-W103','research_gap','WCD10:work_level_research:V1-ENT-0670','open','卷册初版年依据Uruguay Educa年表；出版社2024再版日期保留为版本信息，不代表初版。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0482','WCD-10-B13:WCD10-B13-W104','research_gap','WCD10:work_level_research:V1-ENT-0671','open','卷册初版年依据Uruguay Educa年表；出版社2024再版日期保留为版本信息，不代表初版。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0483','WCD-10-B13:WCD10-B13-W105','research_gap','WCD10:work_level_research:V1-ENT-0672','open','卷册初版年依据Uruguay Educa年表；出版社2024再版日期保留为版本信息，不代表初版。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0484','WCD-10-B13:V1-ENT-0278','research_gap','WCD10:work_level_research:V1-ENT-0278','open','catalog_only；现有卡片/来源链/关系全部保留；无新增学术覆盖断言。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0485','WCD-10-B13:V1-ENT-0279','research_gap','WCD10:work_level_research:V1-ENT-0279','open','catalog_only；现有卡片/来源链/关系全部保留；无新增学术覆盖断言。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0486','WCD-10-B13:V1-ENT-0280','research_gap','WCD10:work_level_research:V1-ENT-0280','open','catalog_only；现有卡片/来源链/关系全部保留；无新增学术覆盖断言。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0487','WCD-10-B13:WCD10-B13-W201','research_gap','WCD10:work_level_research:V1-ENT-0673','open','出版社目录/版本书目可定位；本条说明限于已登记来源，未声称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0488','WCD-10-B13:WCD10-B13-W202','research_gap','WCD10:work_level_research:V1-ENT-0674','open','出版社目录/版本书目可定位；本条说明限于已登记来源，未声称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0489','WCD-10-B13:WCD10-B13-W203','research_gap','WCD10:work_level_research:V1-ENT-0675','open','出版社目录/版本书目可定位；本条说明限于已登记来源，未声称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0490','WCD-10-B13:WCD10-B13-W205','research_gap','WCD10:work_level_research:V1-ENT-0676','open','出版社目录/版本书目可定位；本条说明限于已登记来源，未声称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0491','WCD-10-B13:WCD10-B13-W206','research_gap','WCD10:work_level_research:V1-ENT-0677','open','出版社目录/版本书目可定位；本条说明限于已登记来源，未声称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0492','WCD-10-B13:WCD10-B13-W207','research_gap','WCD10:work_level_research:V1-ENT-0678','open','出版社目录/版本书目可定位；本条说明限于已登记来源，未声称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0493','WCD-10-B13:WCD10-B13-W208','research_gap','WCD10:work_level_research:V1-ENT-0679','open','出版社目录/版本书目可定位；本条说明限于已登记来源，未声称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0494','WCD-10-B13:WCD10-B13-W209','research_gap','WCD10:work_level_research:V1-ENT-0680','open','出版社目录/版本书目可定位；本条说明限于已登记来源，未声称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0495','WCD-10-B13:WCD10-B13-W210','research_gap','WCD10:work_level_research:V1-ENT-0681','open','出版社目录/版本书目可定位；本条说明限于已登记来源，未声称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0496','WCD-10-B13:WCD10-B13-W211','research_gap','WCD10:work_level_research:V1-ENT-0682','open','出版社目录/版本书目可定位；本条说明限于已登记来源，未声称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0497','WCD-10-B13:WCD10-B13-W212','research_gap','WCD10:work_level_research:V1-ENT-0683','open','出版社目录/版本书目可定位；本条说明限于已登记来源，未声称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0498','WCD-10-B13:WCD10-B13-W213','research_gap','WCD10:work_level_research:V1-ENT-0684','open','出版社目录/版本书目可定位；本条说明限于已登记来源，未声称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');

UPDATE metadata SET value='WCD-10-B13' WHERE key='last_change_set';

UPDATE metadata SET value='2026-10-13' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 722 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 682 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 680 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 672 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2274 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 2768 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2253 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1362 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 651 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 1013 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 984 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 498 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
