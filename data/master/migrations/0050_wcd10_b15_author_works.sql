-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: Codex-parent-independent-review

-- Registration sha256: 849146422dda35ed798d7c2c1c11115cfca176d6d96105443ced4837db80790e

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2304 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1391 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 686 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 696 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 694 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 2864 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2325 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 523 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 49 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 1012 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 1041 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 668 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 731 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B14' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0734' OR canonical_url='https://cvc.cervantes.es/literatura/escritores/arlt/bibliografia/bibliografia_01.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0735' OR canonical_url='https://books.google.com/books/about/El_n%C3%BAcleo_del_disturbio.html?id=mgBJAAAAYAAJ') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0736' OR canonical_url='https://www.penguinlibros.com/mx/literatura-contemporanea/464207-libro-pajaros-en-la-boca-9786073851008') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0737' OR canonical_url='https://www.penguinrandomhouse.com/books/607610/kentukis-spanish-edition-by-samanta-schweblin/9786073851022/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0738' OR canonical_url='https://www.planetadelibros.com/libro-el-buen-mal/414257') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0739' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/bajar-es-lo-peor/9788433999429/NH_689') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0740' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/como-desaparecer-completamente/9788433946720/NH_766') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0741' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/un-lugar-soleado-para-gente-sombria/9788433922861/NH_735') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0742' OR canonical_url='https://www.anagrama-ed.es/libro/cronicas/el-otro-lado/9788433926302/CR_126') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0743' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/alguien-camina-sobre-tu-tumba/9788433999238/NH_670') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0744' OR canonical_url='https://www.anagrama-ed.es/libro/biblioteca-de-la-memoria/la-hermana-menor/9788433908063/BM_36') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0699' OR (entity_type='collection' AND original_name='El jorobadito')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0700' OR (entity_type='collection' AND original_name='El criador de gorilas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0701' OR (entity_type='work' AND original_name='Trescientos millones')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0702' OR (entity_type='work' AND original_name='La isla desierta')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0703' OR (entity_type='work' AND original_name='El amor brujo')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0704' OR (entity_type='collection' AND original_name='El núcleo del disturbio')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0705' OR (entity_type='work' AND original_name='Kentukis')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0706' OR (entity_type='collection' AND original_name='El buen mal')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0707' OR (entity_type='work' AND original_name='Bajar es lo peor')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0708' OR (entity_type='work' AND original_name='Cómo desaparecer completamente')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0709' OR (entity_type='collection' AND original_name='Un lugar soleado para gente sombría')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0710' OR (entity_type='collection' AND original_name='El otro lado')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0711' OR (entity_type='collection' AND original_name='Alguien camina sobre tu tumba')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0712' OR (entity_type='work' AND original_name='La hermana menor')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2332' OR (subject_id='V1-ENT-0699' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2333' OR (subject_id='V1-ENT-0699' AND fact_field='one_sentence_summary' AND value_text='阿尔特短篇小说集；塞万提斯虚拟图书馆书目列其1933年布宜诺斯艾利斯Anaconda版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2334' OR (subject_id='V1-ENT-0699' AND fact_field='first_publication_year' AND value_text='1933')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2335' OR (subject_id='V1-ENT-0700' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2336' OR (subject_id='V1-ENT-0700' AND fact_field='one_sentence_summary' AND value_text='阿尔特短篇小说集；塞万提斯虚拟图书馆书目列其1941年圣地亚哥Zig-Zag版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2337' OR (subject_id='V1-ENT-0700' AND fact_field='first_publication_year' AND value_text='1941')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2338' OR (subject_id='V1-ENT-0701' AND fact_field='genre_or_form' AND value_text='戏剧')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2339' OR (subject_id='V1-ENT-0701' AND fact_field='one_sentence_summary' AND value_text='阿根廷国会图书馆将其列为戏剧作品，并记载1932年在人民剧院首演。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2340' OR (subject_id='V1-ENT-0701' AND fact_field='first_publication_year' AND value_text='1932')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2341' OR (subject_id='V1-ENT-0702' AND fact_field='genre_or_form' AND value_text='戏剧')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2342' OR (subject_id='V1-ENT-0702' AND fact_field='one_sentence_summary' AND value_text='阿根廷国会图书馆将其列为阿尔特戏剧作品；作者页面记其1937年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2343' OR (subject_id='V1-ENT-0702' AND fact_field='bibliographic_note' AND value_text='国会图书馆戏剧作品目录列1937年；Centro Virtual Cervantes书目记录1950年Futuro版及1965年EUDEBA版。现有依据分别描述作品列表年份与出版版本，故不据此断言首演或首版年份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2344' OR (subject_id='V1-ENT-0703' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2345' OR (subject_id='V1-ENT-0703' AND fact_field='one_sentence_summary' AND value_text='阿根廷国会图书馆将《El amor brujo》列为阿尔特最后一部小说，并记载其于1932年出版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2346' OR (subject_id='V1-ENT-0703' AND fact_field='first_publication_year' AND value_text='1932')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2347' OR (subject_id='V1-ENT-0704' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2348' OR (subject_id='V1-ENT-0704' AND fact_field='one_sentence_summary' AND value_text='这部短篇集以列车、变形、结伴女性、行李箱中的死亡和郊区酒吧等情境，写人物试图逃离突发困境或现实裂隙。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2349' OR (subject_id='V1-ENT-0704' AND fact_field='first_publication_year' AND value_text='2002')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2350' OR (subject_id='V1-ENT-0705' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2351' OR (subject_id='V1-ENT-0705' AND fact_field='one_sentence_summary' AND value_text='小说设想匿名陌生人进入不同地区他人的私人生活，借技术连接呈现窥视、亲密与信任的边界问题。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2352' OR (subject_id='V1-ENT-0705' AND fact_field='first_publication_year' AND value_text='2018')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2353' OR (subject_id='V1-ENT-0706' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2354' OR (subject_id='V1-ENT-0706' AND fact_field='one_sentence_summary' AND value_text='这部短篇集以突如其来的陌生感扰动熟悉生活，呈现人物面对意外变化的处境。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2355' OR (subject_id='V1-ENT-0706' AND fact_field='bibliographic_note' AND value_text='Seix Barral书目页将西班牙平装版出版日期列为2025年3月5日；此处仅记录该版书目日期，不推定作品首版年份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2356' OR (subject_id='V1-ENT-0707' AND fact_field='first_publication_year' AND value_text='1995')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2357' OR (subject_id='V1-ENT-0707' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2358' OR (subject_id='V1-ENT-0707' AND fact_field='one_sentence_summary' AND value_text='在20世纪90年代夜色弥漫的布宜诺斯艾利斯，Facundo、Narval与Carolina三个年轻人卷入毒品、暴力、毁灭与爱情。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2359' OR (subject_id='V1-ENT-0708' AND fact_field='first_publication_year' AND value_text='2004')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2360' OR (subject_id='V1-ENT-0708' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2361' OR (subject_id='V1-ENT-0708' AND fact_field='one_sentence_summary' AND value_text='十六岁的Matías Kovac借由哥哥留下的日记和音乐寻找离开边缘生活的路径；小说以其家庭处境和阿根廷经济危机后的社会失序为背景。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2362' OR (subject_id='V1-ENT-0709' AND fact_field='genre_or_form' AND value_text='恐怖短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2363' OR (subject_id='V1-ENT-0709' AND fact_field='one_sentence_summary' AND value_text='十二篇故事让鬼魂、失踪者、乡镇衰败和日常生活中的怪异威胁彼此交织。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2364' OR (subject_id='V1-ENT-0709' AND fact_field='bibliographic_note' AND value_text='Anagrama页面列本版出版日为2024-03-06；记为该出版社版本日期。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2365' OR (subject_id='V1-ENT-0710' AND fact_field='genre_or_form' AND value_text='新闻特写与个人随笔集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2366' OR (subject_id='V1-ENT-0710' AND fact_field='one_sentence_summary' AND value_text='汇集Enríquez的新闻写作，穿插文学与音乐人物肖像、个人经历和文化观察。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2367' OR (subject_id='V1-ENT-0710' AND fact_field='bibliographic_note' AND value_text='Anagrama页面列本版出版日为2022-10-05；记为该出版社版本日期。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2368' OR (subject_id='V1-ENT-0711' AND fact_field='first_publication_year' AND value_text='2014')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2369' OR (subject_id='V1-ENT-0711' AND fact_field='genre_or_form' AND value_text='旅行纪事')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2370' OR (subject_id='V1-ENT-0711' AND fact_field='one_sentence_summary' AND value_text='作者走访巴黎、伦敦、布拉格等地的墓园，以旅行见闻、历史细节和个人叙述记录各地墓地。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2371' OR (subject_id='V1-ENT-0711' AND fact_field='bibliographic_note' AND value_text='Anagrama指出本书于2014年先由阿根廷Galerna出版社出版；该版增补行程，墓园数从16处增至24处。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2372' OR (subject_id='V1-ENT-0712' AND fact_field='genre_or_form' AND value_text='文学人物传记/肖像')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2373' OR (subject_id='V1-ENT-0712' AND fact_field='one_sentence_summary' AND value_text='以书目资料及友人、评论者、亲属和遗嘱执行人的证言，勾勒阿根廷作家Silvina Ocampo的生平与文学形象。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2374' OR (subject_id='V1-ENT-0712' AND fact_field='bibliographic_note' AND value_text='Anagrama页面列本版出版日为2018-06-13；未据此推断原作首版年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2375' OR (subject_id='V1-ENT-0302' AND fact_field='one_sentence_summary' AND value_text='十二篇故事将暴力、身体、社会边缘处境与日常生活中的恐怖交织起来，人物包括试图帮助他人的学生、社工、警察和导游。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2376' OR (subject_id='V1-ENT-0303' AND fact_field='one_sentence_summary' AND value_text='一对父子穿越军事独裁时期的阿根廷；Gaspar被卷入一个借灵媒与黑暗力量追求永生的秘密组织。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2377' OR (subject_id='V1-ENT-0304' AND fact_field='one_sentence_summary' AND value_text='十二篇故事以鬼魂、女巫、降灵会和死者归来等恐怖传统为材料，关注潜伏于日常生活中的怪异、欲望与执念。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2378' OR (subject_id='V1-ENT-0304' AND fact_field='bibliographic_note' AND value_text='Anagrama页面列出该出版社版本的出版日为2017-02-01；现有来源未据此确认作品原始首版年份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0671' OR (subject_id='V1-ENT-0286' AND relation_type='CREATED' AND object_id='V1-ENT-0699')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0672' OR (subject_id='V1-ENT-0286' AND relation_type='CREATED' AND object_id='V1-ENT-0700')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0673' OR (subject_id='V1-ENT-0286' AND relation_type='CREATED' AND object_id='V1-ENT-0701')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0674' OR (subject_id='V1-ENT-0286' AND relation_type='CREATED' AND object_id='V1-ENT-0702')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0675' OR (subject_id='V1-ENT-0286' AND relation_type='CREATED' AND object_id='V1-ENT-0703')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0676' OR (subject_id='V1-ENT-0296' AND relation_type='CREATED' AND object_id='V1-ENT-0704')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0677' OR (subject_id='V1-ENT-0296' AND relation_type='CREATED' AND object_id='V1-ENT-0705')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0678' OR (subject_id='V1-ENT-0296' AND relation_type='CREATED' AND object_id='V1-ENT-0706')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0679' OR (subject_id='V1-ENT-0297' AND relation_type='CREATED' AND object_id='V1-ENT-0707')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0680' OR (subject_id='V1-ENT-0297' AND relation_type='CREATED' AND object_id='V1-ENT-0708')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0681' OR (subject_id='V1-ENT-0297' AND relation_type='CREATED' AND object_id='V1-ENT-0709')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0682' OR (subject_id='V1-ENT-0297' AND relation_type='CREATED' AND object_id='V1-ENT-0710')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0683' OR (subject_id='V1-ENT-0297' AND relation_type='CREATED' AND object_id='V1-ENT-0711')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0684' OR (subject_id='V1-ENT-0297' AND relation_type='CREATED' AND object_id='V1-ENT-0712')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0734','WCD10-B15-S002','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)','Centro Virtual Cervantes (Instituto Cervantes)','','Centro Virtual Cervantes (Instituto Cervantes)','','','institutional_author_bibliography','','es','A','access_pass','WCD-10-B15','仅Research候选包，不代表策展审核、正式Research准入或公开许可；作者原始边界保留在author_policies。','remote_only','','https://cvc.cervantes.es/literatura/escritores/arlt/bibliografia/bibliografia_01.htm'),
('SRC-0735','WCD10-B15-S101','El núcleo del disturbio — Google Books','El núcleo del disturbio — Google Books','Google Books; bibliographic record from Ediciones Destino and The University of Texas','','','2002','','google_books_bibliographic_record','','es','B','access_pass','WCD-10-B15','仅Research候选包，不代表策展审核、正式Research准入或公开许可；作者原始边界保留在author_policies。','remote_only','','https://books.google.com/books/about/El_n%C3%BAcleo_del_disturbio.html?id=mgBJAAAAYAAJ'),
('SRC-0736','WCD10-B15-S102','Pájaros en la boca — Penguin Libros','Pájaros en la boca — Penguin Libros','Penguin Random House Grupo Editorial','','Penguin Random House Grupo Editorial','2018','','publisher_author_catalogue','','es','B','access_pass','WCD-10-B15','仅Research候选包，不代表策展审核、正式Research准入或公开许可；作者原始边界保留在author_policies。','remote_only','','https://www.penguinlibros.com/mx/literatura-contemporanea/464207-libro-pajaros-en-la-boca-9786073851008'),
('SRC-0737','WCD10-B15-S103','Kentukis (Spanish Edition) — Penguin Random House','Kentukis (Spanish Edition) — Penguin Random House','Penguin Random House','','Penguin Random House','2026','','publisher_book_page','','es','B','access_pass','WCD-10-B15','仅Research候选包，不代表策展审核、正式Research准入或公开许可；作者原始边界保留在author_policies。','remote_only','','https://www.penguinrandomhouse.com/books/607610/kentukis-spanish-edition-by-samanta-schweblin/9786073851022/'),
('SRC-0738','WCD10-B15-S104','El buen mal — PlanetadeLibros / Seix Barral','El buen mal — PlanetadeLibros / Seix Barral','Editorial Planeta / Seix Barral','','Editorial Planeta / Seix Barral','2025','','publisher_book_page','','es','B','access_pass','WCD-10-B15','仅Research候选包，不代表策展审核、正式Research准入或公开许可；作者原始边界保留在author_policies。','remote_only','','https://www.planetadelibros.com/libro-el-buen-mal/414257'),
('SRC-0739','WCD10-B15-S201','Bajar es lo peor — Editorial Anagrama','Bajar es lo peor — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','','','publisher_book_page','','es','B','access_pass','WCD-10-B15','仅Research候选包，不代表策展审核、正式Research准入或公开许可；作者原始边界保留在author_policies。','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/bajar-es-lo-peor/9788433999429/NH_689'),
('SRC-0740','WCD10-B15-S202','Cómo desaparecer completamente — Editorial Anagrama','Cómo desaparecer completamente — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','','','publisher_book_page','','es','B','access_pass','WCD-10-B15','仅Research候选包，不代表策展审核、正式Research准入或公开许可；作者原始边界保留在author_policies。','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/como-desaparecer-completamente/9788433946720/NH_766'),
('SRC-0741','WCD10-B15-S203','Un lugar soleado para gente sombría — Editorial Anagrama','Un lugar soleado para gente sombría — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','','','publisher_book_page','','es','B','access_pass','WCD-10-B15','仅Research候选包，不代表策展审核、正式Research准入或公开许可；作者原始边界保留在author_policies。','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/un-lugar-soleado-para-gente-sombria/9788433922861/NH_735'),
('SRC-0742','WCD10-B15-S204','El otro lado — Editorial Anagrama','El otro lado — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','','','publisher_book_page','','es','B','access_pass','WCD-10-B15','仅Research候选包，不代表策展审核、正式Research准入或公开许可；作者原始边界保留在author_policies。','remote_only','','https://www.anagrama-ed.es/libro/cronicas/el-otro-lado/9788433926302/CR_126'),
('SRC-0743','WCD10-B15-S205','Alguien camina sobre tu tumba — Editorial Anagrama','Alguien camina sobre tu tumba — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','','','publisher_book_page','','es','B','access_pass','WCD-10-B15','仅Research候选包，不代表策展审核、正式Research准入或公开许可；作者原始边界保留在author_policies。','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/alguien-camina-sobre-tu-tumba/9788433999238/NH_670'),
('SRC-0744','WCD10-B15-S206','La hermana menor — Editorial Anagrama','La hermana menor — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','','','publisher_book_page','','es','B','access_pass','WCD-10-B15','仅Research候选包，不代表策展审核、正式Research准入或公开许可；作者原始边界保留在author_policies。','remote_only','','https://www.anagrama-ed.es/libro/biblioteca-de-la-memoria/la-hermana-menor/9788433908063/BM_36');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0699','collection','《小驼背》','El jorobadito','candidate','1','WCD10-B15-W001','冻结库未见该作品关联；可靠图书馆/大学文化机构书目直接列出作者与作品，补入重要作品目录。; 工作译名仅作检索显示，原题为身份锚点；不声称正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0700','collection','《大猩猩饲养者》','El criador de gorilas','candidate','1','WCD10-B15-W002','冻结库未见该作品关联；可靠图书馆/大学文化机构书目直接列出作者与作品，补入重要作品目录。; 工作译名仅作检索显示，原题为身份锚点；不声称正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0701','work','《三亿》','Trescientos millones','candidate','1','WCD10-B15-W003','冻结库未见该作品关联；可靠图书馆/大学文化机构书目直接列出作者与作品，补入重要作品目录。; 工作译名仅作检索显示，原题为身份锚点；不声称正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0702','work','《荒岛》','La isla desierta','candidate','1','WCD10-B15-W004','冻结库未见该作品关联；可靠图书馆/大学文化机构书目直接列出作者与作品，补入重要作品目录。; 工作译名仅作检索显示，原题为身份锚点；不声称正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0703','work','《魔恋》','El amor brujo','candidate','1','WCD10-B15-W005','阿根廷国会图书馆将其列为阿尔特最后一部小说并记1932年出版；CVC同时列出1932年版本，补入冻结库未见的主要小说。; 工作译名仅作检索显示，原题为身份锚点；不声称正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0704','collection','《El núcleo del disturbio》','El núcleo del disturbio','candidate','1','WCD10-B15-W101','出版社集团作者页将其列作2002年短篇集，Google Books藏书页提供题名、出版社版本和封套简介；此为作者目录中缺失的早期重要作品。; 未核得正式中文译名，保留原题作为展示候选，不自行翻译题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0705','work','《Kentukis》','Kentukis','candidate','1','WCD10-B15-W102','出版集团作品页直接确认作者、小说类型并提供内容简介；集团作者资料将Random House 2018列为作品版本信息。; 未核得正式中文译名，保留原题作为展示候选，不自行翻译题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0706','collection','《El buen mal》','El buen mal','candidate','1','WCD10-B15-W103','Seix Barral直接作品页将其列为2025年出版的短篇小说集，提供六篇故事及受限内容简介。; 未核得正式中文译名，保留原题作为展示候选，不自行翻译题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0707','work','《坠落是最糟的》','Bajar es lo peor','candidate','1','WCD10-B15-W201','出版社确认是作者首部长篇小说，直接提供出版年与情节简介。; 仅作检索用工作译名，原题为身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0708','work','《如何彻底消失》','Cómo desaparecer completamente','candidate','1','WCD10-B15-W202','出版社直接确认小说体裁、2004年出版及人物/情节。; 仅作检索用工作译名，原题为身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0709','collection','《阴郁者的阳光之地》','Un lugar soleado para gente sombría','candidate','1','WCD10-B15-W203','出版社直接确认由十二篇恐怖故事组成并给出多篇有限情节说明。; 仅作检索用工作译名，原题为身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0710','collection','《另一侧》','El otro lado','candidate','1','WCD10-B15-W204','出版社明确称其汇集作者新闻写作，并概述涉及文学、音乐与个人生活的文章。; 仅作检索用工作译名，原题为身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0711','collection','《有人走过你的坟墓》','Alguien camina sobre tu tumba','candidate','1','WCD10-B15-W205','出版社确认其为旅行纪事，并明确说明阿根廷初版于2014年及后续增补版本。; 仅作检索用工作译名，原题为身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0712','work','《小妹妹》','La hermana menor','candidate','1','WCD10-B15-W206','出版社副标题将其称为Silvina Ocampo肖像，并说明作者依托书目资料与证言展开叙述。; 仅作检索用工作译名，原题为身份锚点。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0695','WCD10-B15-W001','WCD-10-B15','WCD10-B15-W001','V1-ENT-0699','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0696','WCD10-B15-W002','WCD-10-B15','WCD10-B15-W002','V1-ENT-0700','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0697','WCD10-B15-W003','WCD-10-B15','WCD10-B15-W003','V1-ENT-0701','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0698','WCD10-B15-W004','WCD-10-B15','WCD10-B15-W004','V1-ENT-0702','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0699','WCD10-B15-W005','WCD-10-B15','WCD10-B15-W005','V1-ENT-0703','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0700','WCD10-B15-W101','WCD-10-B15','WCD10-B15-W101','V1-ENT-0704','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0701','WCD10-B15-W102','WCD-10-B15','WCD10-B15-W102','V1-ENT-0705','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0702','WCD10-B15-W103','WCD-10-B15','WCD10-B15-W103','V1-ENT-0706','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0703','WCD10-B15-W201','WCD-10-B15','WCD10-B15-W201','V1-ENT-0707','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0704','WCD10-B15-W202','WCD-10-B15','WCD10-B15-W202','V1-ENT-0708','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0705','WCD10-B15-W203','WCD-10-B15','WCD10-B15-W203','V1-ENT-0709','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0706','WCD10-B15-W204','WCD-10-B15','WCD10-B15-W204','V1-ENT-0710','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0707','WCD10-B15-W205','WCD-10-B15','WCD10-B15-W205','V1-ENT-0711','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0708','WCD10-B15-W206','WCD-10-B15','WCD10-B15-W206','V1-ENT-0712','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0687','WCD-10-B15:V1-ENT-0699','V1-ENT-0699','collection','《小驼背》','罗贝托·阿尔特','El jorobadito','阿根廷','es','1933','短篇小说集','WCD-10-B15','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《小驼背》｜El jorobadito

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- one_sentence_summary：阿尔特短篇小说集；塞万提斯虚拟图书馆书目列其1933年布宜诺斯艾利斯Anaconda版。
- first_publication_year：1933

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0688','WCD-10-B15:V1-ENT-0700','V1-ENT-0700','collection','《大猩猩饲养者》','罗贝托·阿尔特','El criador de gorilas','阿根廷','es','1941','短篇小说集','WCD-10-B15','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《大猩猩饲养者》｜El criador de gorilas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- one_sentence_summary：阿尔特短篇小说集；塞万提斯虚拟图书馆书目列其1941年圣地亚哥Zig-Zag版。
- first_publication_year：1941

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0689','WCD-10-B15:V1-ENT-0701','V1-ENT-0701','work','《三亿》','罗贝托·阿尔特','Trescientos millones','阿根廷','es','1932','戏剧','WCD-10-B15','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《三亿》｜Trescientos millones

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：戏剧
- one_sentence_summary：阿根廷国会图书馆将其列为戏剧作品，并记载1932年在人民剧院首演。
- first_publication_year：1932

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0690','WCD-10-B15:V1-ENT-0702','V1-ENT-0702','work','《荒岛》','罗贝托·阿尔特','La isla desierta','阿根廷','es','','戏剧','WCD-10-B15','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《荒岛》｜La isla desierta

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：戏剧
- one_sentence_summary：阿根廷国会图书馆将其列为阿尔特戏剧作品；作者页面记其1937年。
- bibliographic_note：国会图书馆戏剧作品目录列1937年；Centro Virtual Cervantes书目记录1950年Futuro版及1965年EUDEBA版。现有依据分别描述作品列表年份与出版版本，故不据此断言首演或首版年份。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0691','WCD-10-B15:V1-ENT-0703','V1-ENT-0703','work','《魔恋》','罗贝托·阿尔特','El amor brujo','阿根廷','es','1932','小说','WCD-10-B15','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《魔恋》｜El amor brujo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：阿根廷国会图书馆将《El amor brujo》列为阿尔特最后一部小说，并记载其于1932年出版。
- first_publication_year：1932

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0692','WCD-10-B15:V1-ENT-0704','V1-ENT-0704','collection','《El núcleo del disturbio》','萨曼塔·施维伯林','El núcleo del disturbio','阿根廷','es','2002','短篇小说集','WCD-10-B15','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《El núcleo del disturbio》｜El núcleo del disturbio

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- one_sentence_summary：这部短篇集以列车、变形、结伴女性、行李箱中的死亡和郊区酒吧等情境，写人物试图逃离突发困境或现实裂隙。
- first_publication_year：2002

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0693','WCD-10-B15:V1-ENT-0705','V1-ENT-0705','work','《Kentukis》','萨曼塔·施维伯林','Kentukis','阿根廷','es','2018','小说','WCD-10-B15','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Kentukis》｜Kentukis

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：小说设想匿名陌生人进入不同地区他人的私人生活，借技术连接呈现窥视、亲密与信任的边界问题。
- first_publication_year：2018

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0694','WCD-10-B15:V1-ENT-0706','V1-ENT-0706','collection','《El buen mal》','萨曼塔·施维伯林','El buen mal','阿根廷','es','','短篇小说集','WCD-10-B15','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《El buen mal》｜El buen mal

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- one_sentence_summary：这部短篇集以突如其来的陌生感扰动熟悉生活，呈现人物面对意外变化的处境。
- bibliographic_note：Seix Barral书目页将西班牙平装版出版日期列为2025年3月5日；此处仅记录该版书目日期，不推定作品首版年份。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0695','WCD-10-B15:V1-ENT-0707','V1-ENT-0707','work','《坠落是最糟的》','玛丽安娜·恩里克斯','Bajar es lo peor','阿根廷','es','1995','长篇小说','WCD-10-B15','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《坠落是最糟的》｜Bajar es lo peor

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1995
- genre_or_form：长篇小说
- one_sentence_summary：在20世纪90年代夜色弥漫的布宜诺斯艾利斯，Facundo、Narval与Carolina三个年轻人卷入毒品、暴力、毁灭与爱情。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0696','WCD-10-B15:V1-ENT-0708','V1-ENT-0708','work','《如何彻底消失》','玛丽安娜·恩里克斯','Cómo desaparecer completamente','阿根廷','es','2004','小说','WCD-10-B15','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《如何彻底消失》｜Cómo desaparecer completamente

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：2004
- genre_or_form：小说
- one_sentence_summary：十六岁的Matías Kovac借由哥哥留下的日记和音乐寻找离开边缘生活的路径；小说以其家庭处境和阿根廷经济危机后的社会失序为背景。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0697','WCD-10-B15:V1-ENT-0709','V1-ENT-0709','collection','《阴郁者的阳光之地》','玛丽安娜·恩里克斯','Un lugar soleado para gente sombría','阿根廷','es','','恐怖短篇小说集','WCD-10-B15','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《阴郁者的阳光之地》｜Un lugar soleado para gente sombría

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：恐怖短篇小说集
- one_sentence_summary：十二篇故事让鬼魂、失踪者、乡镇衰败和日常生活中的怪异威胁彼此交织。
- bibliographic_note：Anagrama页面列本版出版日为2024-03-06；记为该出版社版本日期。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0698','WCD-10-B15:V1-ENT-0710','V1-ENT-0710','collection','《另一侧》','玛丽安娜·恩里克斯','El otro lado','阿根廷','es','','新闻特写与个人随笔集','WCD-10-B15','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《另一侧》｜El otro lado

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：新闻特写与个人随笔集
- one_sentence_summary：汇集Enríquez的新闻写作，穿插文学与音乐人物肖像、个人经历和文化观察。
- bibliographic_note：Anagrama页面列本版出版日为2022-10-05；记为该出版社版本日期。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0699','WCD-10-B15:V1-ENT-0711','V1-ENT-0711','collection','《有人走过你的坟墓》','玛丽安娜·恩里克斯','Alguien camina sobre tu tumba','阿根廷','es','2014','旅行纪事','WCD-10-B15','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《有人走过你的坟墓》｜Alguien camina sobre tu tumba

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：2014
- genre_or_form：旅行纪事
- one_sentence_summary：作者走访巴黎、伦敦、布拉格等地的墓园，以旅行见闻、历史细节和个人叙述记录各地墓地。
- bibliographic_note：Anagrama指出本书于2014年先由阿根廷Galerna出版社出版；该版增补行程，墓园数从16处增至24处。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0700','WCD-10-B15:V1-ENT-0712','V1-ENT-0712','work','《小妹妹》','玛丽安娜·恩里克斯','La hermana menor','阿根廷','es','','文学人物传记/肖像','WCD-10-B15','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《小妹妹》｜La hermana menor

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：文学人物传记/肖像
- one_sentence_summary：以书目资料及友人、评论者、亲属和遗嘱执行人的证言，勾勒阿根廷作家Silvina Ocampo的生平与文学形象。
- bibliographic_note：Anagrama页面列本版出版日为2018-06-13；未据此推断原作首版年。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0701','WCD-10-B15:V1-ENT-0302','V1-ENT-0302','collection','《火中遗物》','玛丽安娜·恩里克斯','Las cosas que perdimos en el fuego','阿根廷','es','','','WCD-10-B15','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《火中遗物》｜Las cosas que perdimos en el fuego

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：十二篇故事将暴力、身体、社会边缘处境与日常生活中的恐怖交织起来，人物包括试图帮助他人的学生、社工、警察和导游。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0702','WCD-10-B15:V1-ENT-0303','V1-ENT-0303','work','《属于我们的夜晚》','玛丽安娜·恩里克斯','Nuestra parte de noche','阿根廷','es','','','WCD-10-B15','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《属于我们的夜晚》｜Nuestra parte de noche

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：一对父子穿越军事独裁时期的阿根廷；Gaspar被卷入一个借灵媒与黑暗力量追求永生的秘密组织。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0703','WCD-10-B15:V1-ENT-0304','V1-ENT-0304','collection','《床上抽烟危险》','玛丽安娜·恩里克斯','Los peligros de fumar en la cama','阿根廷','es','','','WCD-10-B15','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《床上抽烟危险》｜Los peligros de fumar en la cama

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：十二篇故事以鬼魂、女巫、降灵会和死者归来等恐怖传统为材料，关注潜伏于日常生活中的怪异、欲望与执念。
- bibliographic_note：Anagrama页面列出该出版社版本的出版日为2017-02-01；现有来源未据此确认作品原始首版年份。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-2332','WCD10-B15-W001-F01','V1-CARD-0687','V1-ENT-0699','genre_or_form','短篇小说集','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2333','WCD10-B15-W001-F02','V1-CARD-0687','V1-ENT-0699','one_sentence_summary','阿尔特短篇小说集；塞万提斯虚拟图书馆书目列其1933年布宜诺斯艾利斯Anaconda版。','institutional_paraphrase','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2334','WCD10-B15-W001-F03','V1-CARD-0687','V1-ENT-0699','first_publication_year','1933','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2335','WCD10-B15-W002-F01','V1-CARD-0688','V1-ENT-0700','genre_or_form','短篇小说集','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2336','WCD10-B15-W002-F02','V1-CARD-0688','V1-ENT-0700','one_sentence_summary','阿尔特短篇小说集；塞万提斯虚拟图书馆书目列其1941年圣地亚哥Zig-Zag版。','institutional_paraphrase','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2337','WCD10-B15-W002-F03','V1-CARD-0688','V1-ENT-0700','first_publication_year','1941','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2338','WCD10-B15-W003-F01','V1-CARD-0689','V1-ENT-0701','genre_or_form','戏剧','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2339','WCD10-B15-W003-F02','V1-CARD-0689','V1-ENT-0701','one_sentence_summary','阿根廷国会图书馆将其列为戏剧作品，并记载1932年在人民剧院首演。','institutional_paraphrase','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2340','WCD10-B15-W003-F03','V1-CARD-0689','V1-ENT-0701','first_publication_year','1932','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2341','WCD10-B15-W004-F01','V1-CARD-0690','V1-ENT-0702','genre_or_form','戏剧','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2342','WCD10-B15-W004-F02','V1-CARD-0690','V1-ENT-0702','one_sentence_summary','阿根廷国会图书馆将其列为阿尔特戏剧作品；作者页面记其1937年。','institutional_paraphrase','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2343','WCD10-B15-W004-F03','V1-CARD-0690','V1-ENT-0702','bibliographic_note','国会图书馆戏剧作品目录列1937年；Centro Virtual Cervantes书目记录1950年Futuro版及1965年EUDEBA版。现有依据分别描述作品列表年份与出版版本，故不据此断言首演或首版年份。','bibliographic_note','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2344','WCD10-B15-W005-F01','V1-CARD-0691','V1-ENT-0703','genre_or_form','小说','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2345','WCD10-B15-W005-F02','V1-CARD-0691','V1-ENT-0703','one_sentence_summary','阿根廷国会图书馆将《El amor brujo》列为阿尔特最后一部小说，并记载其于1932年出版。','institutional_paraphrase','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2346','WCD10-B15-W005-F03','V1-CARD-0691','V1-ENT-0703','first_publication_year','1932','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2347','WCD10-B15-W101-F01','V1-CARD-0692','V1-ENT-0704','genre_or_form','短篇小说集','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2348','WCD10-B15-W101-F02','V1-CARD-0692','V1-ENT-0704','one_sentence_summary','这部短篇集以列车、变形、结伴女性、行李箱中的死亡和郊区酒吧等情境，写人物试图逃离突发困境或现实裂隙。','institutional_paraphrase','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2349','WCD10-B15-W101-F03','V1-CARD-0692','V1-ENT-0704','first_publication_year','2002','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2350','WCD10-B15-W102-F01','V1-CARD-0693','V1-ENT-0705','genre_or_form','小说','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2351','WCD10-B15-W102-F02','V1-CARD-0693','V1-ENT-0705','one_sentence_summary','小说设想匿名陌生人进入不同地区他人的私人生活，借技术连接呈现窥视、亲密与信任的边界问题。','institutional_paraphrase','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2352','WCD10-B15-W102-F03','V1-CARD-0693','V1-ENT-0705','first_publication_year','2018','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2353','WCD10-B15-W103-F01','V1-CARD-0694','V1-ENT-0706','genre_or_form','短篇小说集','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2354','WCD10-B15-W103-F02','V1-CARD-0694','V1-ENT-0706','one_sentence_summary','这部短篇集以突如其来的陌生感扰动熟悉生活，呈现人物面对意外变化的处境。','institutional_paraphrase','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2355','WCD10-B15-W103-F03','V1-CARD-0694','V1-ENT-0706','bibliographic_note','Seix Barral书目页将西班牙平装版出版日期列为2025年3月5日；此处仅记录该版书目日期，不推定作品首版年份。','bibliographic_note','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2356','WCD10-B15-W201-F01','V1-CARD-0695','V1-ENT-0707','first_publication_year','1995','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2357','WCD10-B15-W201-F02','V1-CARD-0695','V1-ENT-0707','genre_or_form','长篇小说','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2358','WCD10-B15-W201-F03','V1-CARD-0695','V1-ENT-0707','one_sentence_summary','在20世纪90年代夜色弥漫的布宜诺斯艾利斯，Facundo、Narval与Carolina三个年轻人卷入毒品、暴力、毁灭与爱情。','institutional_paraphrase','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2359','WCD10-B15-W202-F01','V1-CARD-0696','V1-ENT-0708','first_publication_year','2004','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2360','WCD10-B15-W202-F02','V1-CARD-0696','V1-ENT-0708','genre_or_form','小说','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2361','WCD10-B15-W202-F03','V1-CARD-0696','V1-ENT-0708','one_sentence_summary','十六岁的Matías Kovac借由哥哥留下的日记和音乐寻找离开边缘生活的路径；小说以其家庭处境和阿根廷经济危机后的社会失序为背景。','institutional_paraphrase','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2362','WCD10-B15-W203-F01','V1-CARD-0697','V1-ENT-0709','genre_or_form','恐怖短篇小说集','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2363','WCD10-B15-W203-F02','V1-CARD-0697','V1-ENT-0709','one_sentence_summary','十二篇故事让鬼魂、失踪者、乡镇衰败和日常生活中的怪异威胁彼此交织。','institutional_paraphrase','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2364','WCD10-B15-W203-F03','V1-CARD-0697','V1-ENT-0709','bibliographic_note','Anagrama页面列本版出版日为2024-03-06；记为该出版社版本日期。','bibliographic_note','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2365','WCD10-B15-W204-F01','V1-CARD-0698','V1-ENT-0710','genre_or_form','新闻特写与个人随笔集','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2366','WCD10-B15-W204-F02','V1-CARD-0698','V1-ENT-0710','one_sentence_summary','汇集Enríquez的新闻写作，穿插文学与音乐人物肖像、个人经历和文化观察。','institutional_paraphrase','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2367','WCD10-B15-W204-F03','V1-CARD-0698','V1-ENT-0710','bibliographic_note','Anagrama页面列本版出版日为2022-10-05；记为该出版社版本日期。','bibliographic_note','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2368','WCD10-B15-W205-F01','V1-CARD-0699','V1-ENT-0711','first_publication_year','2014','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2369','WCD10-B15-W205-F02','V1-CARD-0699','V1-ENT-0711','genre_or_form','旅行纪事','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2370','WCD10-B15-W205-F03','V1-CARD-0699','V1-ENT-0711','one_sentence_summary','作者走访巴黎、伦敦、布拉格等地的墓园，以旅行见闻、历史细节和个人叙述记录各地墓地。','institutional_paraphrase','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2371','WCD10-B15-W205-F04','V1-CARD-0699','V1-ENT-0711','bibliographic_note','Anagrama指出本书于2014年先由阿根廷Galerna出版社出版；该版增补行程，墓园数从16处增至24处。','bibliographic_note','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2372','WCD10-B15-W206-F01','V1-CARD-0700','V1-ENT-0712','genre_or_form','文学人物传记/肖像','bibliographic','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2373','WCD10-B15-W206-F02','V1-CARD-0700','V1-ENT-0712','one_sentence_summary','以书目资料及友人、评论者、亲属和遗嘱执行人的证言，勾勒阿根廷作家Silvina Ocampo的生平与文学形象。','institutional_paraphrase','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2374','WCD10-B15-W206-F03','V1-CARD-0700','V1-ENT-0712','bibliographic_note','Anagrama页面列本版出版日为2018-06-13；未据此推断原作首版年。','bibliographic_note','WCD-10-B15','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2375','WCD10-B15-F201','V1-CARD-0701','V1-ENT-0302','one_sentence_summary','十二篇故事将暴力、身体、社会边缘处境与日常生活中的恐怖交织起来，人物包括试图帮助他人的学生、社工、警察和导游。','institutional_paraphrase','WCD-10-B15','high','batch_retained_candidate','仅补出版社直接概述的作品内容；完整保留既有事实V1-FCT-0802至V1-FCT-0804及来源链。'),
('V1-FCT-2376','WCD10-B15-F202','V1-CARD-0702','V1-ENT-0303','one_sentence_summary','一对父子穿越军事独裁时期的阿根廷；Gaspar被卷入一个借灵媒与黑暗力量追求永生的秘密组织。','institutional_paraphrase','WCD-10-B15','high','batch_retained_candidate','只补出版社简介直接支持的情节；2019只保留为奖项年，首发年份缺口维持开放。'),
('V1-FCT-2377','WCD10-B15-F203','V1-CARD-0703','V1-ENT-0304','one_sentence_summary','十二篇故事以鬼魂、女巫、降灵会和死者归来等恐怖传统为材料，关注潜伏于日常生活中的怪异、欲望与执念。','institutional_paraphrase','WCD-10-B15','high','batch_retained_candidate','只补出版社对故事集的直接概述；不推断首版年，原有首发年份缺口保持。'),
('V1-FCT-2378','WCD10-B15-F204','V1-CARD-0703','V1-ENT-0304','bibliographic_note','Anagrama页面列出该出版社版本的出版日为2017-02-01；现有来源未据此确认作品原始首版年份。','bibliographic_note','WCD-10-B15','high','batch_retained_candidate','该书目注记只记录出版社版本日，不替代或关闭首发年份缺口。');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-2332','SRC-0230','Roberto Arlt — Biblioteca del Congreso de la Nación'),
('V1-FCT-2332','SRC-0734','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)'),
('V1-FCT-2333','SRC-0230','Roberto Arlt — Biblioteca del Congreso de la Nación'),
('V1-FCT-2333','SRC-0734','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)'),
('V1-FCT-2334','SRC-0734','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)'),
('V1-FCT-2335','SRC-0230','Roberto Arlt — Biblioteca del Congreso de la Nación'),
('V1-FCT-2335','SRC-0734','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)'),
('V1-FCT-2336','SRC-0230','Roberto Arlt — Biblioteca del Congreso de la Nación'),
('V1-FCT-2336','SRC-0734','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)'),
('V1-FCT-2337','SRC-0734','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)'),
('V1-FCT-2338','SRC-0230','Roberto Arlt — Biblioteca del Congreso de la Nación'),
('V1-FCT-2338','SRC-0734','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)'),
('V1-FCT-2339','SRC-0230','Roberto Arlt — Biblioteca del Congreso de la Nación'),
('V1-FCT-2339','SRC-0734','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)'),
('V1-FCT-2340','SRC-0230','Roberto Arlt — Biblioteca del Congreso de la Nación'),
('V1-FCT-2340','SRC-0734','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)'),
('V1-FCT-2341','SRC-0230','Roberto Arlt — Biblioteca del Congreso de la Nación'),
('V1-FCT-2341','SRC-0734','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)'),
('V1-FCT-2342','SRC-0230','Roberto Arlt — Biblioteca del Congreso de la Nación'),
('V1-FCT-2342','SRC-0734','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)'),
('V1-FCT-2343','SRC-0230','Roberto Arlt — Biblioteca del Congreso de la Nación'),
('V1-FCT-2343','SRC-0734','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)'),
('V1-FCT-2344','SRC-0230','Roberto Arlt — Biblioteca del Congreso de la Nación'),
('V1-FCT-2344','SRC-0734','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)'),
('V1-FCT-2345','SRC-0230','Roberto Arlt — Biblioteca del Congreso de la Nación'),
('V1-FCT-2346','SRC-0230','Roberto Arlt — Biblioteca del Congreso de la Nación'),
('V1-FCT-2346','SRC-0734','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)'),
('V1-FCT-2347','SRC-0736','Pájaros en la boca — Penguin Libros'),
('V1-FCT-2348','SRC-0735','El núcleo del disturbio — Google Books'),
('V1-FCT-2349','SRC-0735','El núcleo del disturbio — Google Books'),
('V1-FCT-2349','SRC-0736','Pájaros en la boca — Penguin Libros'),
('V1-FCT-2350','SRC-0737','Kentukis (Spanish Edition) — Penguin Random House'),
('V1-FCT-2351','SRC-0737','Kentukis (Spanish Edition) — Penguin Random House'),
('V1-FCT-2352','SRC-0736','Pájaros en la boca — Penguin Libros'),
('V1-FCT-2353','SRC-0738','El buen mal — PlanetadeLibros / Seix Barral'),
('V1-FCT-2354','SRC-0738','El buen mal — PlanetadeLibros / Seix Barral'),
('V1-FCT-2355','SRC-0738','El buen mal — PlanetadeLibros / Seix Barral'),
('V1-FCT-2356','SRC-0739','Bajar es lo peor — Editorial Anagrama'),
('V1-FCT-2357','SRC-0739','Bajar es lo peor — Editorial Anagrama'),
('V1-FCT-2358','SRC-0739','Bajar es lo peor — Editorial Anagrama'),
('V1-FCT-2359','SRC-0740','Cómo desaparecer completamente — Editorial Anagrama'),
('V1-FCT-2360','SRC-0740','Cómo desaparecer completamente — Editorial Anagrama'),
('V1-FCT-2361','SRC-0740','Cómo desaparecer completamente — Editorial Anagrama'),
('V1-FCT-2362','SRC-0741','Un lugar soleado para gente sombría — Editorial Anagrama'),
('V1-FCT-2363','SRC-0741','Un lugar soleado para gente sombría — Editorial Anagrama'),
('V1-FCT-2364','SRC-0741','Un lugar soleado para gente sombría — Editorial Anagrama'),
('V1-FCT-2365','SRC-0742','El otro lado — Editorial Anagrama'),
('V1-FCT-2366','SRC-0742','El otro lado — Editorial Anagrama'),
('V1-FCT-2367','SRC-0742','El otro lado — Editorial Anagrama'),
('V1-FCT-2368','SRC-0743','Alguien camina sobre tu tumba — Editorial Anagrama'),
('V1-FCT-2369','SRC-0743','Alguien camina sobre tu tumba — Editorial Anagrama'),
('V1-FCT-2370','SRC-0743','Alguien camina sobre tu tumba — Editorial Anagrama'),
('V1-FCT-2371','SRC-0743','Alguien camina sobre tu tumba — Editorial Anagrama'),
('V1-FCT-2372','SRC-0744','La hermana menor — Editorial Anagrama'),
('V1-FCT-2373','SRC-0744','La hermana menor — Editorial Anagrama'),
('V1-FCT-2374','SRC-0744','La hermana menor — Editorial Anagrama'),
('V1-FCT-2375','SRC-0238','Las cosas que perdimos en el fuego — Mariana Enriquez'),
('V1-FCT-2376','SRC-0236','Nuestra parte de noche — Mariana Enriquez'),
('V1-FCT-2377','SRC-0237','Los peligros de fumar en la cama — Mariana Enriquez'),
('V1-FCT-2378','SRC-0237','Los peligros de fumar en la cama — Mariana Enriquez');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0687','V1-FCT-2332','batch_retained_candidate'),
('V1-CARD-0687','V1-FCT-2333','batch_retained_candidate'),
('V1-CARD-0687','V1-FCT-2334','batch_retained_candidate'),
('V1-CARD-0688','V1-FCT-2335','batch_retained_candidate'),
('V1-CARD-0688','V1-FCT-2336','batch_retained_candidate'),
('V1-CARD-0688','V1-FCT-2337','batch_retained_candidate'),
('V1-CARD-0689','V1-FCT-2338','batch_retained_candidate'),
('V1-CARD-0689','V1-FCT-2339','batch_retained_candidate'),
('V1-CARD-0689','V1-FCT-2340','batch_retained_candidate'),
('V1-CARD-0690','V1-FCT-2341','batch_retained_candidate'),
('V1-CARD-0690','V1-FCT-2342','batch_retained_candidate'),
('V1-CARD-0690','V1-FCT-2343','batch_retained_candidate'),
('V1-CARD-0691','V1-FCT-2344','batch_retained_candidate'),
('V1-CARD-0691','V1-FCT-2345','batch_retained_candidate'),
('V1-CARD-0691','V1-FCT-2346','batch_retained_candidate'),
('V1-CARD-0692','V1-FCT-2347','batch_retained_candidate'),
('V1-CARD-0692','V1-FCT-2348','batch_retained_candidate'),
('V1-CARD-0692','V1-FCT-2349','batch_retained_candidate'),
('V1-CARD-0693','V1-FCT-2350','batch_retained_candidate'),
('V1-CARD-0693','V1-FCT-2351','batch_retained_candidate'),
('V1-CARD-0693','V1-FCT-2352','batch_retained_candidate'),
('V1-CARD-0694','V1-FCT-2353','batch_retained_candidate'),
('V1-CARD-0694','V1-FCT-2354','batch_retained_candidate'),
('V1-CARD-0694','V1-FCT-2355','batch_retained_candidate'),
('V1-CARD-0695','V1-FCT-2356','batch_retained_candidate'),
('V1-CARD-0695','V1-FCT-2357','batch_retained_candidate'),
('V1-CARD-0695','V1-FCT-2358','batch_retained_candidate'),
('V1-CARD-0696','V1-FCT-2359','batch_retained_candidate'),
('V1-CARD-0696','V1-FCT-2360','batch_retained_candidate'),
('V1-CARD-0696','V1-FCT-2361','batch_retained_candidate'),
('V1-CARD-0697','V1-FCT-2362','batch_retained_candidate'),
('V1-CARD-0697','V1-FCT-2363','batch_retained_candidate'),
('V1-CARD-0697','V1-FCT-2364','batch_retained_candidate'),
('V1-CARD-0698','V1-FCT-2365','batch_retained_candidate'),
('V1-CARD-0698','V1-FCT-2366','batch_retained_candidate'),
('V1-CARD-0698','V1-FCT-2367','batch_retained_candidate'),
('V1-CARD-0699','V1-FCT-2368','batch_retained_candidate'),
('V1-CARD-0699','V1-FCT-2369','batch_retained_candidate'),
('V1-CARD-0699','V1-FCT-2370','batch_retained_candidate'),
('V1-CARD-0699','V1-FCT-2371','batch_retained_candidate'),
('V1-CARD-0700','V1-FCT-2372','batch_retained_candidate'),
('V1-CARD-0700','V1-FCT-2373','batch_retained_candidate'),
('V1-CARD-0700','V1-FCT-2374','batch_retained_candidate'),
('V1-CARD-0701','V1-FCT-2375','batch_retained_candidate'),
('V1-CARD-0702','V1-FCT-2376','batch_retained_candidate'),
('V1-CARD-0703','V1-FCT-2377','batch_retained_candidate'),
('V1-CARD-0703','V1-FCT-2378','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-1400','WCD10-B15-S001','V1-CARD-0687','SRC-0230','B','bibliography_or_bounded_description','yes','no','SRC-0230','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1401','WCD10-B15-S002','V1-CARD-0687','SRC-0734','A','bibliography_or_bounded_description','yes','no','SRC-0734','accepted','NONE'),
('V1-CS-1402','WCD10-B15-S001','V1-CARD-0688','SRC-0230','B','bibliography_or_bounded_description','yes','no','SRC-0230','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1403','WCD10-B15-S002','V1-CARD-0688','SRC-0734','A','bibliography_or_bounded_description','yes','no','SRC-0734','accepted','NONE'),
('V1-CS-1404','WCD10-B15-S001','V1-CARD-0689','SRC-0230','B','bibliography_or_bounded_description','yes','no','SRC-0230','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1405','WCD10-B15-S002','V1-CARD-0689','SRC-0734','A','bibliography_or_bounded_description','yes','no','SRC-0734','accepted','NONE'),
('V1-CS-1406','WCD10-B15-S001','V1-CARD-0690','SRC-0230','B','bibliography_or_bounded_description','yes','no','SRC-0230','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1407','WCD10-B15-S002','V1-CARD-0690','SRC-0734','A','bibliography_or_bounded_description','yes','no','SRC-0734','accepted','NONE'),
('V1-CS-1408','WCD10-B15-S001','V1-CARD-0691','SRC-0230','B','bibliography_or_bounded_description','yes','no','SRC-0230','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1409','WCD10-B15-S002','V1-CARD-0691','SRC-0734','A','bibliography_or_bounded_description','yes','no','SRC-0734','accepted','NONE'),
('V1-CS-1410','WCD10-B15-S101','V1-CARD-0692','SRC-0735','B','bibliography_or_bounded_description','yes','no','SRC-0735','accepted','NONE'),
('V1-CS-1411','WCD10-B15-S102','V1-CARD-0692','SRC-0736','B','bibliography_or_bounded_description','yes','no','SRC-0736','accepted','NONE'),
('V1-CS-1412','WCD10-B15-S102','V1-CARD-0693','SRC-0736','B','bibliography_or_bounded_description','yes','no','SRC-0736','accepted','NONE'),
('V1-CS-1413','WCD10-B15-S103','V1-CARD-0693','SRC-0737','B','bibliography_or_bounded_description','yes','no','SRC-0737','accepted','NONE'),
('V1-CS-1414','WCD10-B15-S104','V1-CARD-0694','SRC-0738','B','bibliography_or_bounded_description','yes','no','SRC-0738','accepted','NONE'),
('V1-CS-1415','WCD10-B15-S201','V1-CARD-0695','SRC-0739','B','bibliography_or_bounded_description','yes','no','SRC-0739','accepted','NONE'),
('V1-CS-1416','WCD10-B15-S202','V1-CARD-0696','SRC-0740','B','bibliography_or_bounded_description','yes','no','SRC-0740','accepted','NONE'),
('V1-CS-1417','WCD10-B15-S203','V1-CARD-0697','SRC-0741','B','bibliography_or_bounded_description','yes','no','SRC-0741','accepted','NONE'),
('V1-CS-1418','WCD10-B15-S204','V1-CARD-0698','SRC-0742','B','bibliography_or_bounded_description','yes','no','SRC-0742','accepted','NONE'),
('V1-CS-1419','WCD10-B15-S205','V1-CARD-0699','SRC-0743','B','bibliography_or_bounded_description','yes','no','SRC-0743','accepted','NONE'),
('V1-CS-1420','WCD10-B15-S206','V1-CARD-0700','SRC-0744','B','bibliography_or_bounded_description','yes','no','SRC-0744','accepted','NONE'),
('V1-CS-1421','WCD10-B15-S207','V1-CARD-0701','SRC-0238','B','bibliography_or_bounded_description','no','no','SRC-0238','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1422','WCD10-B15-S208','V1-CARD-0702','SRC-0236','B','bibliography_or_bounded_description','no','no','SRC-0236','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1423','WCD10-B15-S209','V1-CARD-0703','SRC-0237','B','bibliography_or_bounded_description','yes','no','SRC-0237','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0671','WCD-10-B15','WCD10-B15-W001-CREATED','V1-ENT-0286','CREATED','V1-ENT-0699','罗贝托·阿尔特创作 El jorobadito','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0672','WCD-10-B15','WCD10-B15-W002-CREATED','V1-ENT-0286','CREATED','V1-ENT-0700','罗贝托·阿尔特创作 El criador de gorilas','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0673','WCD-10-B15','WCD10-B15-W003-CREATED','V1-ENT-0286','CREATED','V1-ENT-0701','罗贝托·阿尔特创作 Trescientos millones','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0674','WCD-10-B15','WCD10-B15-W004-CREATED','V1-ENT-0286','CREATED','V1-ENT-0702','罗贝托·阿尔特创作 La isla desierta','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0675','WCD-10-B15','WCD10-B15-W005-CREATED','V1-ENT-0286','CREATED','V1-ENT-0703','罗贝托·阿尔特创作 El amor brujo','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0676','WCD-10-B15','WCD10-B15-W101-CREATED','V1-ENT-0296','CREATED','V1-ENT-0704','萨曼塔·施维伯林创作 El núcleo del disturbio','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0677','WCD-10-B15','WCD10-B15-W102-CREATED','V1-ENT-0296','CREATED','V1-ENT-0705','萨曼塔·施维伯林创作 Kentukis','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0678','WCD-10-B15','WCD10-B15-W103-CREATED','V1-ENT-0296','CREATED','V1-ENT-0706','萨曼塔·施维伯林创作 El buen mal','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0679','WCD-10-B15','WCD10-B15-W201-CREATED','V1-ENT-0297','CREATED','V1-ENT-0707','玛丽安娜·恩里克斯创作 Bajar es lo peor','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0680','WCD-10-B15','WCD10-B15-W202-CREATED','V1-ENT-0297','CREATED','V1-ENT-0708','玛丽安娜·恩里克斯创作 Cómo desaparecer completamente','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0681','WCD-10-B15','WCD10-B15-W203-CREATED','V1-ENT-0297','CREATED','V1-ENT-0709','玛丽安娜·恩里克斯创作 Un lugar soleado para gente sombría','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0682','WCD-10-B15','WCD10-B15-W204-CREATED','V1-ENT-0297','CREATED','V1-ENT-0710','玛丽安娜·恩里克斯创作 El otro lado','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0683','WCD-10-B15','WCD10-B15-W205-CREATED','V1-ENT-0297','CREATED','V1-ENT-0711','玛丽安娜·恩里克斯创作 Alguien camina sobre tu tumba','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0684','WCD-10-B15','WCD10-B15-W206-CREATED','V1-ENT-0297','CREATED','V1-ENT-0712','玛丽安娜·恩里克斯创作 La hermana menor','high','accepted','Codex-parent-independent-review:PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0671','SRC-0230'),
('V1-REL-0671','SRC-0734'),
('V1-REL-0672','SRC-0230'),
('V1-REL-0672','SRC-0734'),
('V1-REL-0673','SRC-0230'),
('V1-REL-0673','SRC-0734'),
('V1-REL-0674','SRC-0230'),
('V1-REL-0674','SRC-0734'),
('V1-REL-0675','SRC-0230'),
('V1-REL-0675','SRC-0734'),
('V1-REL-0676','SRC-0735'),
('V1-REL-0676','SRC-0736'),
('V1-REL-0677','SRC-0736'),
('V1-REL-0677','SRC-0737'),
('V1-REL-0678','SRC-0738'),
('V1-REL-0679','SRC-0739'),
('V1-REL-0680','SRC-0740'),
('V1-REL-0681','SRC-0741'),
('V1-REL-0682','SRC-0742'),
('V1-REL-0683','SRC-0743'),
('V1-REL-0684','SRC-0744');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-1005','V1-REL-0671','WCD10-B15-S001','SRC-0230','Roberto Arlt — Biblioteca del Congreso de la Nación','实读2026-10-13，第21-24行概述作品，第31-67行列出小说、短篇集与戏剧并提供若干年份。','罗贝托·阿尔特创作 El jorobadito','high','eligible_evidence','WCD-10-B15'),
('V1-EV-1006','V1-REL-0671','WCD10-B15-S002','SRC-0734','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)','实读2026-10-13，第13-54行列小说及所列出版版本；第81-108行列短篇集及版本；具体行号按作品条目定位。','罗贝托·阿尔特创作 El jorobadito','high','eligible_evidence','WCD-10-B15'),
('V1-EV-1007','V1-REL-0672','WCD10-B15-S001','SRC-0230','Roberto Arlt — Biblioteca del Congreso de la Nación','实读2026-10-13，第21-24行概述作品，第31-67行列出小说、短篇集与戏剧并提供若干年份。','罗贝托·阿尔特创作 El criador de gorilas','high','eligible_evidence','WCD-10-B15'),
('V1-EV-1008','V1-REL-0672','WCD10-B15-S002','SRC-0734','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)','实读2026-10-13，第13-54行列小说及所列出版版本；第81-108行列短篇集及版本；具体行号按作品条目定位。','罗贝托·阿尔特创作 El criador de gorilas','high','eligible_evidence','WCD-10-B15'),
('V1-EV-1009','V1-REL-0673','WCD10-B15-S001','SRC-0230','Roberto Arlt — Biblioteca del Congreso de la Nación','实读2026-10-13，第21-24行概述作品，第31-67行列出小说、短篇集与戏剧并提供若干年份。','罗贝托·阿尔特创作 Trescientos millones','high','eligible_evidence','WCD-10-B15'),
('V1-EV-1010','V1-REL-0673','WCD10-B15-S002','SRC-0734','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)','实读2026-10-13，第13-54行列小说及所列出版版本；第81-108行列短篇集及版本；具体行号按作品条目定位。','罗贝托·阿尔特创作 Trescientos millones','high','eligible_evidence','WCD-10-B15'),
('V1-EV-1011','V1-REL-0674','WCD10-B15-S001','SRC-0230','Roberto Arlt — Biblioteca del Congreso de la Nación','实读2026-10-13，第21-24行概述作品，第31-67行列出小说、短篇集与戏剧并提供若干年份。','罗贝托·阿尔特创作 La isla desierta','high','eligible_evidence','WCD-10-B15'),
('V1-EV-1012','V1-REL-0674','WCD10-B15-S002','SRC-0734','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)','实读2026-10-13，第13-54行列小说及所列出版版本；第81-108行列短篇集及版本；具体行号按作品条目定位。','罗贝托·阿尔特创作 La isla desierta','high','eligible_evidence','WCD-10-B15'),
('V1-EV-1013','V1-REL-0675','WCD10-B15-S001','SRC-0230','Roberto Arlt — Biblioteca del Congreso de la Nación','实读2026-10-13，第21-24行概述作品，第31-67行列出小说、短篇集与戏剧并提供若干年份。','罗贝托·阿尔特创作 El amor brujo','high','eligible_evidence','WCD-10-B15'),
('V1-EV-1014','V1-REL-0675','WCD10-B15-S002','SRC-0734','Obras de Roberto Arlt — Centro Virtual Cervantes (Instituto Cervantes)','实读2026-10-13，第13-54行列小说及所列出版版本；第81-108行列短篇集及版本；具体行号按作品条目定位。','罗贝托·阿尔特创作 El amor brujo','high','eligible_evidence','WCD-10-B15'),
('V1-EV-1015','V1-REL-0676','WCD10-B15-S101','SRC-0735','El núcleo del disturbio — Google Books','实读2026-10-13。第26–33、45–55行：书名、作者、Ediciones Destino 2002、185页及出版社简介；第52行标明Original de Universidade do Texas。','萨曼塔·施维伯林创作 El núcleo del disturbio','high','eligible_evidence','WCD-10-B15'),
('V1-EV-1016','V1-REL-0676','WCD10-B15-S102','SRC-0736','Pájaros en la boca — Penguin Libros','实读2026-10-13。第449–454行作者资料列El núcleo del disturbio为2002年短篇集、Kentukis为Random House 2018年作品并记录奖项；第364、427–433行另提供既有《吃鸟的女孩》内容简介，用于语义查重。','萨曼塔·施维伯林创作 El núcleo del disturbio','high','eligible_evidence','WCD-10-B15'),
('V1-EV-1017','V1-REL-0677','WCD10-B15-S102','SRC-0736','Pájaros en la boca — Penguin Libros','实读2026-10-13。第449–454行作者资料列El núcleo del disturbio为2002年短篇集、Kentukis为Random House 2018年作品并记录奖项；第364、427–433行另提供既有《吃鸟的女孩》内容简介，用于语义查重。','萨曼塔·施维伯林创作 Kentukis','high','eligible_evidence','WCD-10-B15'),
('V1-EV-1018','V1-REL-0677','WCD10-B15-S103','SRC-0737','Kentukis (Spanish Edition) — Penguin Random House','实读2026-10-13。第345–348行书名与作者；第368–374行出版社内容说明将其称为novela并描述智能设备/家庭隐私设定；此页面所列2026为本版销售日期，不作作品首发年份。','萨曼塔·施维伯林创作 Kentukis','high','eligible_evidence','WCD-10-B15'),
('V1-EV-1019','V1-REL-0678','WCD10-B15-S104','SRC-0738','El buen mal — PlanetadeLibros / Seix Barral','实读2026-10-13。第20–34行题名、作者及概要；第79–92行 ficha técnica列2025-03-05、Relatos、Seix Barral、ISBN；第94–98行作者资料。','萨曼塔·施维伯林创作 El buen mal','high','eligible_evidence','WCD-10-B15'),
('V1-EV-1020','V1-REL-0679','WCD10-B15-S201','SRC-0739','Bajar es lo peor — Editorial Anagrama','Published 1995 and primary novel; synopsis of three adolescents and the Buenos Aires night scene. Lines 84-104, especially 88, 101-104. Edition data lines 122-145. Read 2026-10-13.','玛丽安娜·恩里克斯创作 Bajar es lo peor','high','eligible_evidence','WCD-10-B15'),
('V1-EV-1021','V1-REL-0680','WCD10-B15-S202','SRC-0740','Cómo desaparecer completamente — Editorial Anagrama','Novel classification and synopsis at lines 61-80; 2004 publication stated at line 79; edition metadata further down. Read 2026-10-13.','玛丽安娜·恩里克斯创作 Cómo desaparecer completamente','high','eligible_evidence','WCD-10-B15'),
('V1-EV-1022','V1-REL-0681','WCD10-B15-S203','SRC-0741','Un lugar soleado para gente sombría — Editorial Anagrama','Twelve horror stories, bounded synopsis and author at lines 67-86; edition publication date at lines 100-120. Read 2026-10-13.','玛丽安娜·恩里克斯创作 Un lugar soleado para gente sombría','high','eligible_evidence','WCD-10-B15'),
('V1-EV-1023','V1-REL-0682','WCD10-B15-S204','SRC-0742','El otro lado — Editorial Anagrama','Author, journalistic collection and contents at lines 61-82; edition publication date at lines 97-121. Read 2026-10-13.','玛丽安娜·恩里克斯创作 El otro lado','high','eligible_evidence','WCD-10-B15'),
('V1-EV-1024','V1-REL-0683','WCD10-B15-S205','SRC-0743','Alguien camina sobre tu tumba — Editorial Anagrama','Author, travel chronicle form and cemetery visits at lines 61-84; original Argentina publication in 2014 at line 83; later edition data lines 99-123. Read 2026-10-13.','玛丽安娜·恩里克斯创作 Alguien camina sobre tu tumba','high','eligible_evidence','WCD-10-B15'),
('V1-EV-1025','V1-REL-0684','WCD10-B15-S206','SRC-0744','La hermana menor — Editorial Anagrama','Author/title and subtitle identify a portrait of Silvina Ocampo at lines 61-67; contents and approach at lines 79-83; edition date at lines 97-120. Read 2026-10-13.','玛丽安娜·恩里克斯创作 La hermana menor','high','eligible_evidence','WCD-10-B15');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0524','WCD-10-B15-G01','research_gap','WCD10:B15:ENRIQUEZ:remaining-bibliography','open','Anagrama作者目录列出更多出版物；本包聚焦已有主要小说/故事集、出版社直接概述的作品及代表性非虚构作品，未逐项打开其余作品页或排查全集。','','Independent Reviewer: preserve deferred','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0525','WCD-10-B15-G02','research_gap','WCD10:B15:ENRIQUEZ:coauthor-works','open','EDUVIM页面表明Chicos que vuelven存在图文版且含Laura Dattoli参与；本包未将该版与既有短作建模为同一对象或拆分参与角色，保留待后续专门核实。','','Independent Reviewer: preserve deferred','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0526','WCD-10-B15:V1-ENT-0293','research_gap','WCD10:work_level_research:V1-ENT-0293','open','既有对象，非本批新增。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0527','WCD-10-B15:V1-ENT-0294','research_gap','WCD10:work_level_research:V1-ENT-0294','open','既有对象，非本批新增。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0528','WCD-10-B15:V1-ENT-0295','research_gap','WCD10:work_level_research:V1-ENT-0295','open','既有对象，非本批新增。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0529','WCD-10-B15:WCD10-B15-W001','research_gap','WCD10:work_level_research:V1-ENT-0699','open','本候选不代表完整目录或学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0530','WCD-10-B15:WCD10-B15-W002','research_gap','WCD10:work_level_research:V1-ENT-0700','open','本候选不代表完整目录或学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0531','WCD-10-B15:WCD10-B15-W003','research_gap','WCD10:work_level_research:V1-ENT-0701','open','本候选不代表完整目录或学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0532','WCD-10-B15:WCD10-B15-W004','research_gap','WCD10:work_level_research:V1-ENT-0702','open','本候选不代表完整目录或学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0533','WCD-10-B15:WCD10-B15-W005','research_gap','WCD10:work_level_research:V1-ENT-0703','open','本候选不代表完整目录或学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0534','WCD-10-B15:V1-ENT-0299','research_gap','WCD10:work_level_research:V1-ENT-0299','open','本批不宣称全集或学术覆盖；仅保全冻结基库对象及完整来源/事实/卡片/关系闭包。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0535','WCD-10-B15:V1-ENT-0300','research_gap','WCD10:work_level_research:V1-ENT-0300','open','本批不宣称全集或学术覆盖；仅保全冻结基库对象及完整来源/事实/卡片/关系闭包。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0536','WCD-10-B15:V1-ENT-0301','research_gap','WCD10:work_level_research:V1-ENT-0301','open','本批不宣称全集或学术覆盖；仅保全冻结基库对象及完整来源/事实/卡片/关系闭包。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0537','WCD-10-B15:WCD10-B15-W101','research_gap','WCD10:work_level_research:V1-ENT-0704','open','仅为研究候选，未审定首版之外的完整书目、译名或学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0538','WCD-10-B15:WCD10-B15-W102','research_gap','WCD10:work_level_research:V1-ENT-0705','open','仅为研究候选，未审定首版之外的完整书目、译名或学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0539','WCD-10-B15:WCD10-B15-W103','research_gap','WCD10:work_level_research:V1-ENT-0706','open','仅为研究候选，未审定首版之外的完整书目、译名或学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0540','WCD-10-B15:V1-ENT-0302','research_gap','WCD10:work_level_research:V1-ENT-0302','open','Source-grade follow-up or exhaustive bibliography is deferred where not directly checked.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0541','WCD-10-B15:V1-ENT-0303','research_gap','WCD10:work_level_research:V1-ENT-0303','open','Source-grade follow-up or exhaustive bibliography is deferred where not directly checked.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0542','WCD-10-B15:V1-ENT-0304','research_gap','WCD10:work_level_research:V1-ENT-0304','open','Source-grade follow-up or exhaustive bibliography is deferred where not directly checked.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0543','WCD-10-B15:WCD10-B15-W201','research_gap','WCD10:work_level_research:V1-ENT-0707','open','Research candidates only; no automatic Curation or public admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0544','WCD-10-B15:WCD10-B15-W202','research_gap','WCD10:work_level_research:V1-ENT-0708','open','Research candidates only; no automatic Curation or public admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0545','WCD-10-B15:WCD10-B15-W203','research_gap','WCD10:work_level_research:V1-ENT-0709','open','Research candidates only; no automatic Curation or public admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0546','WCD-10-B15:WCD10-B15-W204','research_gap','WCD10:work_level_research:V1-ENT-0710','open','Research candidates only; no automatic Curation or public admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0547','WCD-10-B15:WCD10-B15-W205','research_gap','WCD10:work_level_research:V1-ENT-0711','open','Research candidates only; no automatic Curation or public admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0548','WCD-10-B15:WCD10-B15-W206','research_gap','WCD10:work_level_research:V1-ENT-0712','open','Research candidates only; no automatic Curation or public admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');

UPDATE metadata SET value='WCD-10-B15' WHERE key='last_change_set';

UPDATE metadata SET value='2026-10-13' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 742 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 710 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 708 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 703 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2372 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 2924 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2351 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1415 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 682 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 1062 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 1033 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 548 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
