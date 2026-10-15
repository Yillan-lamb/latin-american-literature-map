-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: Codex-parent-independent-review

-- Registration sha256: f3a9f1d0c2e39ea83c5c5d4140f9f7dea98a846ad51a3a8f4fd09959d4f1aaf5

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1968 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1232 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 580 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 619 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 617 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 2430 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1989 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 398 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 45 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 897 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 926 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 588 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 679 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B10' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0682' OR canonical_url='https://fundacionmariobenedetti.uy/obras/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0683' OR canonical_url='https://fundacionmariobenedetti.uy/obras-66-72/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0684' OR canonical_url='https://fundacionmariobenedetti.uy/obras-73-83/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0685' OR canonical_url='https://repositoriodigital.bnp.gob.pe/bnp/recursos/2/html/jose-maria-arguedas-recursos/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0686' OR canonical_url='https://biblioteca.casadelaliteratura.gob.pe/cgi-bin/koha/opac-detail.pl?biblionumber=6249') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0687' OR canonical_url='https://biblioteca.casadelaliteratura.gob.pe/cgi-bin/koha/opac-detail.pl?biblionumber=288&shelfbrowse_itemnumber=742') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0688' OR canonical_url='https://biblioteca.casadelaliteratura.gob.pe/cgi-bin/koha/opac-detail.pl?biblionumber=289+thumbnail-shelfbrowser') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0689' OR canonical_url='https://www.anagrama-ed.es/autor/pitol-sergio-858') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0690' OR canonical_url='https://www.anagrama-ed.es/libro/compactos/el-mago-de-viena/9788433951113/CM_883') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0622' OR (entity_type='work' AND original_name='Quién de nosotros')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0623' OR (entity_type='collection' AND original_name='Poemas de la oficina')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0624' OR (entity_type='collection' AND original_name='Esta mañana')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0625' OR (entity_type='work' AND original_name='El cumpleaños de Juan Ángel')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0626' OR (entity_type='collection' AND original_name='Con y sin nostalgia')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0627' OR (entity_type='work' AND original_name='Pedro y el capitán')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0628' OR (entity_type='work' AND original_name='Primavera con una esquina rota')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0629' OR (entity_type='collection' AND original_name='Agua')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0630' OR (entity_type='work' AND original_name='Diamantes y pedernales')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0631' OR (entity_type='work' AND original_name='El Sexto')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0632' OR (entity_type='work' AND original_name='La agonía de Rasu-Ñiti')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0633' OR (entity_type='work' AND original_name='El sueño del pongo')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0634' OR (entity_type='collection' AND original_name='Amor mundo y todos los cuentos de José María Arguedas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0635' OR (entity_type='work' AND original_name='El tañido de una flauta')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0636' OR (entity_type='work' AND original_name='Juegos florales')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0637' OR (entity_type='work' AND original_name='El viaje')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0638' OR (entity_type='work' AND original_name='El mago de Viena')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1996' OR (subject_id='V1-ENT-0622' AND fact_field='first_publication_year' AND value_text='1953')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1997' OR (subject_id='V1-ENT-0622' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1998' OR (subject_id='V1-ENT-0622' AND fact_field='one_sentence_summary' AND value_text='Benedetti早期小说创作的起点；基金会称其为作者第一部小说，并记录后续版本。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1999' OR (subject_id='V1-ENT-0622' AND fact_field='bibliographic_note' AND value_text='基金会将《Quién de nosotros》列为贝内德蒂的第一部小说，并记载1953年《Número》首版及其后的再版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2000' OR (subject_id='V1-ENT-0623' AND fact_field='first_publication_year' AND value_text='1956')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2001' OR (subject_id='V1-ENT-0623' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2002' OR (subject_id='V1-ENT-0623' AND fact_field='one_sentence_summary' AND value_text='基金会称该诗集是贝内德蒂的重要作品之一，并指出作者认为它是首部在读者中产生实际反响的书。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2003' OR (subject_id='V1-ENT-0623' AND fact_field='bibliographic_note' AND value_text='基金会称该诗集是贝内德蒂重要作品之一，并指出作者承认它是首部在读者中产生实际反响的书；首版为1956年《Número》。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2004' OR (subject_id='V1-ENT-0624' AND fact_field='first_publication_year' AND value_text='1949')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2005' OR (subject_id='V1-ENT-0624' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2006' OR (subject_id='V1-ENT-0624' AND fact_field='one_sentence_summary' AND value_text='短篇集收录九篇作品，基金会所列篇目从同名故事延伸至《Como un ladrón》《Idilio》等。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2007' OR (subject_id='V1-ENT-0624' AND fact_field='bibliographic_note' AND value_text='基金会列出本书收录的九篇短篇，包括同名篇、Como un ladrón、Idilio与La lluvia y los hongos。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2008' OR (subject_id='V1-ENT-0625' AND fact_field='first_publication_year' AND value_text='1971')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2009' OR (subject_id='V1-ENT-0625' AND fact_field='genre_or_form' AND value_text='诗体小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2010' OR (subject_id='V1-ENT-0625' AND fact_field='one_sentence_summary' AND value_text='作品以诗体小说形式展开；基金会称其具有形式实验性，并记录1971年首版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2011' OR (subject_id='V1-ENT-0625' AND fact_field='bibliographic_note' AND value_text='基金会将其称为诗体小说，并指出它是贝内德蒂较具形式实验性的作品；首版于1971年在墨西哥出版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2012' OR (subject_id='V1-ENT-0626' AND fact_field='first_publication_year' AND value_text='1977')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2013' OR (subject_id='V1-ENT-0626' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2014' OR (subject_id='V1-ENT-0626' AND fact_field='one_sentence_summary' AND value_text='短篇集收录多篇故事，基金会列出的篇目包括《Sobre el éxodo》《La vecina orilla》。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2015' OR (subject_id='V1-ENT-0626' AND fact_field='bibliographic_note' AND value_text='基金会记录其1977年由墨西哥Siglo XXI出版，并列出收录的短篇题名，包括Sobre el éxodo与La vecina orilla。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2016' OR (subject_id='V1-ENT-0627' AND fact_field='first_publication_year' AND value_text='1979')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2017' OR (subject_id='V1-ENT-0627' AND fact_field='genre_or_form' AND value_text='戏剧')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2018' OR (subject_id='V1-ENT-0627' AND fact_field='one_sentence_summary' AND value_text='戏剧作品于1979年在墨西哥出版并由流亡中的El Galpón剧团首演；基金会称其为贝内德蒂上演次数最多的戏剧。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2019' OR (subject_id='V1-ENT-0627' AND fact_field='bibliographic_note' AND value_text='基金会称这是贝内德蒂上演次数最多的戏剧，并记载1979年墨西哥出版及同年首演。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2020' OR (subject_id='V1-ENT-0628' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2021' OR (subject_id='V1-ENT-0628' AND fact_field='one_sentence_summary' AND value_text='基金会将本小说列为作者流亡期间的重要创作；本条只记录其直接归属及书目身份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2022' OR (subject_id='V1-ENT-0628' AND fact_field='bibliographic_note' AND value_text='基金会将其列为贝内德蒂流亡期间创作的代表小说之一。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2023' OR (subject_id='V1-ENT-0629' AND fact_field='first_publication_year' AND value_text='1935')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2024' OR (subject_id='V1-ENT-0629' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2025' OR (subject_id='V1-ENT-0629' AND fact_field='one_sentence_summary' AND value_text='《Agua》首版同册还收录《Los escoleros》和《Warma kuyay》；仅按目录记录说明该故事集。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2026' OR (subject_id='V1-ENT-0630' AND fact_field='first_publication_year' AND value_text='1954')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2027' OR (subject_id='V1-ENT-0630' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2028' OR (subject_id='V1-ENT-0630' AND fact_field='one_sentence_summary' AND value_text='Arguedas于1954年出版的小说；本条限于书目身份和体裁，不增加主题解释。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2029' OR (subject_id='V1-ENT-0631' AND fact_field='first_publication_year' AND value_text='1961')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2030' OR (subject_id='V1-ENT-0631' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2031' OR (subject_id='V1-ENT-0631' AND fact_field='one_sentence_summary' AND value_text='小说人物Gabriel讲述自己在利马El Sexto监狱的经历；简介限于馆藏版本封底所载。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2032' OR (subject_id='V1-ENT-0632' AND fact_field='bibliographic_note' AND value_text='BNP目录记录1962年版，Casa馆藏记录[1964?]版；版本首发口径未定，原子年份留空。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2033' OR (subject_id='V1-ENT-0632' AND fact_field='genre_or_form' AND value_text='短篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2034' OR (subject_id='V1-ENT-0632' AND fact_field='one_sentence_summary' AND value_text='短篇小说写剪刀舞者Rasu-Ñiti临终前最后一舞，并将Wamani精神传给徒弟；限于馆藏简介。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2035' OR (subject_id='V1-ENT-0633' AND fact_field='first_publication_year' AND value_text='1965')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2036' OR (subject_id='V1-ENT-0633' AND fact_field='genre_or_form' AND value_text='盖丘亚语故事')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2037' OR (subject_id='V1-ENT-0633' AND fact_field='one_sentence_summary' AND value_text='1965年版目录将其著录为盖丘亚语故事，并说明文本为盖丘亚语和西班牙语双语。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2038' OR (subject_id='V1-ENT-0633' AND fact_field='bibliographic_note' AND value_text='BNP说明该故事并非Arguedas原创；他记述自己在利马听一位Qatqa社区成员讲述后，将其以盖丘亚语和西班牙语出版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2039' OR (subject_id='V1-ENT-0634' AND fact_field='first_publication_year' AND value_text='1967')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2040' OR (subject_id='V1-ENT-0634' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2041' OR (subject_id='V1-ENT-0634' AND fact_field='one_sentence_summary' AND value_text='1967年首版的短篇小说集，馆藏目录列出其中包括Agua、Warma Kuyay、La agonía de Rasu-Ñiti等篇目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2042' OR (subject_id='V1-ENT-0635' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2043' OR (subject_id='V1-ENT-0635' AND fact_field='one_sentence_summary' AND value_text='塞万提斯学院书目将《El tañido de una flauta》列入皮托尔叙事作品；Anagrama也将其列作小说。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2044' OR (subject_id='V1-ENT-0635' AND fact_field='bibliographic_note' AND value_text='Centro Virtual Cervantes列Era（墨西哥）1972年版；Anagrama作者简介在小说清单中列1986年。两来源可能对应不同版本/书目口径，原子首发年暂留空，不将差异强行归并。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2045' OR (subject_id='V1-ENT-0636' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2046' OR (subject_id='V1-ENT-0636' AND fact_field='one_sentence_summary' AND value_text='塞万提斯学院与Anagrama均把《Juegos florales》列为皮托尔小说。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2047' OR (subject_id='V1-ENT-0636' AND fact_field='bibliographic_note' AND value_text='Centro Virtual Cervantes书目列Siglo XXI（墨西哥）1982年版，Anagrama作者简介列1985年；未核定原版与后续版次关系，原子首发年留空。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2048' OR (subject_id='V1-ENT-0637' AND fact_field='genre_or_form' AND value_text='跨文类记忆写作')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2049' OR (subject_id='V1-ENT-0637' AND fact_field='one_sentence_summary' AND value_text='Anagrama将《El viaje》与《El arte de la fuga》《El mago de Viena》并列为跨文类记忆三部曲。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2050' OR (subject_id='V1-ENT-0637' AND fact_field='first_publication_year' AND value_text='2000')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2051' OR (subject_id='V1-ENT-0637' AND fact_field='bibliographic_note' AND value_text='CVC作者书目列Era（墨西哥）2000年；Anagrama列2001年为其出版目录中的版本，故此候选仅采用CVC所列2000年墨西哥版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2052' OR (subject_id='V1-ENT-0638' AND fact_field='genre_or_form' AND value_text='散文/记忆写作')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2053' OR (subject_id='V1-ENT-0638' AND fact_field='one_sentence_summary' AND value_text='Anagrama介绍该书以片段交织记忆、写作、喜爱的作家与旅行，并呈现皮托尔对阅读和创作的思考。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2054' OR (subject_id='V1-ENT-0638' AND fact_field='first_publication_year' AND value_text='2005')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2055' OR (subject_id='V1-ENT-0638' AND fact_field='bibliographic_note' AND value_text='CVC列Pre-Textos（瓦伦西亚）2005年版；Anagrama将其与《El arte de la fuga》《El viaje》并列为记忆三部曲。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2056' OR (subject_id='V1-ENT-0245' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2057' OR (subject_id='V1-ENT-0245' AND fact_field='one_sentence_summary' AND value_text='基金会将《La tregua》列为贝内德蒂的知名小说，并记载其推动作者国际影响、曾有多次再版及影视改编。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2058' OR (subject_id='V1-ENT-0246' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2059' OR (subject_id='V1-ENT-0246' AND fact_field='one_sentence_summary' AND value_text='基金会记载《Gracias por el fuego》于1965年5月由蒙得维的亚Alfa首次出版，并于1972年达到第九版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2060' OR (subject_id='V1-ENT-0247' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2061' OR (subject_id='V1-ENT-0247' AND fact_field='one_sentence_summary' AND value_text='基金会列出《Montevideanos》所收短篇，包括“Puntero izquierdo”“Los pocillos”等篇目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2062' OR (subject_id='V1-ENT-0251' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2063' OR (subject_id='V1-ENT-0251' AND fact_field='one_sentence_summary' AND value_text='小说以安第斯地区传统与现代生活之间的冲突为背景。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2064' OR (subject_id='V1-ENT-0252' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2065' OR (subject_id='V1-ENT-0252' AND fact_field='one_sentence_summary' AND value_text='小说描写少年埃内斯托生活于安第斯与混血文化两个世界之间。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2066' OR (subject_id='V1-ENT-0253' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2067' OR (subject_id='V1-ENT-0253' AND fact_field='one_sentence_summary' AND value_text='小说通过不同地理和社会场景呈现秘鲁社会的地域与文化多样性。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2068' OR (subject_id='V1-ENT-0378' AND fact_field='one_sentence_summary' AND value_text='小说于作者逝世后出版；BNP介绍将作品与作者的个人危机及对秘鲁现代化的失望联系起来。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2069' OR (subject_id='V1-ENT-0254' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2070' OR (subject_id='V1-ENT-0254' AND fact_field='one_sentence_summary' AND value_text='Anagrama称该小说获1984年Herralde小说奖。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2071' OR (subject_id='V1-ENT-0255' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2072' OR (subject_id='V1-ENT-0255' AND fact_field='one_sentence_summary' AND value_text='Anagrama将本书与《爱情游行》《婚姻生活》并列组成Tríptico del Carnaval。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2073' OR (subject_id='V1-ENT-0256' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2074' OR (subject_id='V1-ENT-0256' AND fact_field='one_sentence_summary' AND value_text='Anagrama将本书与《爱情游行》《驯服神圣苍鹭》并列组成Tríptico del Carnaval。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2075' OR (subject_id='V1-ENT-0375' AND fact_field='one_sentence_summary' AND value_text='Armando Pereira的书评称本书以记忆为中心，并交织回忆、阅读、绘画和旅行片段。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0591' OR (subject_id='V1-ENT-0238' AND relation_type='CREATED' AND object_id='V1-ENT-0622')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0592' OR (subject_id='V1-ENT-0238' AND relation_type='CREATED' AND object_id='V1-ENT-0623')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0593' OR (subject_id='V1-ENT-0238' AND relation_type='CREATED' AND object_id='V1-ENT-0624')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0594' OR (subject_id='V1-ENT-0238' AND relation_type='CREATED' AND object_id='V1-ENT-0625')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0595' OR (subject_id='V1-ENT-0238' AND relation_type='CREATED' AND object_id='V1-ENT-0626')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0596' OR (subject_id='V1-ENT-0238' AND relation_type='CREATED' AND object_id='V1-ENT-0627')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0597' OR (subject_id='V1-ENT-0238' AND relation_type='CREATED' AND object_id='V1-ENT-0628')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0598' OR (subject_id='V1-ENT-0248' AND relation_type='CREATED' AND object_id='V1-ENT-0629')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0599' OR (subject_id='V1-ENT-0248' AND relation_type='CREATED' AND object_id='V1-ENT-0630')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0600' OR (subject_id='V1-ENT-0248' AND relation_type='CREATED' AND object_id='V1-ENT-0631')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0601' OR (subject_id='V1-ENT-0248' AND relation_type='CREATED' AND object_id='V1-ENT-0632')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0602' OR (subject_id='V1-ENT-0248' AND relation_type='CREATED' AND object_id='V1-ENT-0633')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0603' OR (subject_id='V1-ENT-0248' AND relation_type='CREATED' AND object_id='V1-ENT-0634')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0604' OR (subject_id='V1-ENT-0249' AND relation_type='CREATED' AND object_id='V1-ENT-0635')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0605' OR (subject_id='V1-ENT-0249' AND relation_type='CREATED' AND object_id='V1-ENT-0636')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0606' OR (subject_id='V1-ENT-0249' AND relation_type='CREATED' AND object_id='V1-ENT-0637')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0607' OR (subject_id='V1-ENT-0249' AND relation_type='CREATED' AND object_id='V1-ENT-0638')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0682','WCD10-B11-S001','Su obra: 1945-1958 — Fundación Mario Benedetti','Su obra: 1945-1958 — Fundación Mario Benedetti','Fundación Mario Benedetti','','Fundación Mario Benedetti','','','institutional_author_web_page','','es','B','access_pass','WCD-10-B11','B11 Research candidate metadata only; no public admission implied.','remote_only','','https://fundacionmariobenedetti.uy/obras/'),
('SRC-0683','WCD10-B11-S002','Su obra: 1966-1972 — Fundación Mario Benedetti','Su obra: 1966-1972 — Fundación Mario Benedetti','Fundación Mario Benedetti','','Fundación Mario Benedetti','','','institutional_author_web_page','','es','B','access_pass','WCD-10-B11','B11 Research candidate metadata only; no public admission implied.','remote_only','','https://fundacionmariobenedetti.uy/obras-66-72/'),
('SRC-0684','WCD10-B11-S003','Su obra: 1973-1983 — Fundación Mario Benedetti','Su obra: 1973-1983 — Fundación Mario Benedetti','Fundación Mario Benedetti','','Fundación Mario Benedetti','','','institutional_author_web_page','','es','B','access_pass','WCD-10-B11','B11 Research candidate metadata only; no public admission implied.','remote_only','','https://fundacionmariobenedetti.uy/obras-73-83/'),
('SRC-0685','WCD10-B11-S101','José María Arguedas; Recursos bibliográficos en la BNP','José María Arguedas; Recursos bibliográficos en la BNP','Biblioteca Nacional del Perú','','Biblioteca Nacional del Perú','','','web_page','','es','B','access_pass','WCD-10-B11','B11 Research candidate metadata only; no public admission implied.','remote_only','','https://repositoriodigital.bnp.gob.pe/bnp/recursos/2/html/jose-maria-arguedas-recursos/'),
('SRC-0686','WCD10-B11-S102','El sexto / José María Arguedas; prólogo de Alberto Escobar','El sexto / José María Arguedas; prólogo de Alberto Escobar','Biblioteca Mario Vargas Llosa - Casa de la Literatura Peruana','','Biblioteca Mario Vargas Llosa - Casa de la Literatura Peruana','','','web_page','','es','B','access_pass','WCD-10-B11','B11 Research candidate metadata only; no public admission implied.','remote_only','','https://biblioteca.casadelaliteratura.gob.pe/cgi-bin/koha/opac-detail.pl?biblionumber=6249'),
('SRC-0687','WCD10-B11-S103','La agonía de Rasu-Ñiti / José María Arguedas','La agonía de Rasu-Ñiti / José María Arguedas','Biblioteca Mario Vargas Llosa - Casa de la Literatura Peruana','','Biblioteca Mario Vargas Llosa - Casa de la Literatura Peruana','','','web_page','','es','B','access_pass','WCD-10-B11','B11 Research candidate metadata only; no public admission implied.','remote_only','','https://biblioteca.casadelaliteratura.gob.pe/cgi-bin/koha/opac-detail.pl?biblionumber=288&shelfbrowse_itemnumber=742'),
('SRC-0688','WCD10-B11-S104','Amor mundo y todos los cuentos de José María Arguedas','Amor mundo y todos los cuentos de José María Arguedas','Biblioteca Mario Vargas Llosa - Casa de la Literatura Peruana','','Biblioteca Mario Vargas Llosa - Casa de la Literatura Peruana','','','web_page','','es','B','access_pass','WCD-10-B11','B11 Research candidate metadata only; no public admission implied.','remote_only','','https://biblioteca.casadelaliteratura.gob.pe/cgi-bin/koha/opac-detail.pl?biblionumber=289+thumbnail-shelfbrowser'),
('SRC-0689','WCD10-B11-S202','Sergio Pitol — Editorial Anagrama','Sergio Pitol — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','undated (page accessed 2026-10-12)','','web_page','','es','B','access_pass','WCD-10-B11','B11 Research candidate metadata only; no public admission implied.','remote_only','','https://www.anagrama-ed.es/autor/pitol-sergio-858'),
('SRC-0690','WCD10-B11-S204','El mago de Viena — Sergio Pitol — Editorial Anagrama','El mago de Viena — Sergio Pitol — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','2026-10-21 (listed edition date; not first publication year)','','publisher_book_page','','es','B','access_pass','WCD-10-B11','B11 Research candidate metadata only; no public admission implied.','remote_only','','https://www.anagrama-ed.es/libro/compactos/el-mago-de-viena/9788433951113/CM_883');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0622','work','《我们之中的谁》','Quién de nosotros','candidate','1','WCD10-B11-W001','Fundación Mario Benedetti作者作品目录直接列出作品题名、类别及可用书目信息；仅作有来源的普通书目与内容补充。; 中文为检索工作译名，西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0623','collection','《办公室诗》','Poemas de la oficina','candidate','1','WCD10-B11-W002','Fundación Mario Benedetti作者作品目录直接列出作品题名、类别及可用书目信息；仅作有来源的普通书目与内容补充。; 中文为检索工作译名，西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0624','collection','《今天早晨》','Esta mañana','candidate','1','WCD10-B11-W003','Fundación Mario Benedetti作者作品目录直接列出作品题名、类别及可用书目信息；仅作有来源的普通书目与内容补充。; 中文为检索工作译名，西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0625','work','《胡安·安赫尔的生日》','El cumpleaños de Juan Ángel','candidate','1','WCD10-B11-W004','Fundación Mario Benedetti作者作品目录直接列出作品题名、类别及可用书目信息；仅作有来源的普通书目与内容补充。; 中文为检索工作译名，西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0626','collection','《有与无乡愁》','Con y sin nostalgia','candidate','1','WCD10-B11-W005','Fundación Mario Benedetti作者作品目录直接列出作品题名、类别及可用书目信息；仅作有来源的普通书目与内容补充。; 中文为检索工作译名，西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0627','work','《佩德罗与上尉》','Pedro y el capitán','candidate','1','WCD10-B11-W006','Fundación Mario Benedetti作者作品目录直接列出作品题名、类别及可用书目信息；仅作有来源的普通书目与内容补充。; 中文为检索工作译名，西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0628','work','《破碎一角的春天》','Primavera con una esquina rota','candidate','1','WCD10-B11-W007','Fundación Mario Benedetti作者作品目录直接列出作品题名、类别及可用书目信息；仅作有来源的普通书目与内容补充。; 中文为检索工作译名，西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0629','collection','《水》','Agua','candidate','1','WCD10-B11-W101','补入有直接馆藏或图书馆书目支持的Arguedas作品/合集；不追求全集或学术覆盖。; 中文为工作译名，西班牙语题名为身份锚点；未宣称为正式中文出版译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0630','work','《钻石与燧石》','Diamantes y pedernales','candidate','1','WCD10-B11-W102','补入有直接馆藏或图书馆书目支持的Arguedas作品/合集；不追求全集或学术覆盖。; 中文为工作译名，西班牙语题名为身份锚点；未宣称为正式中文出版译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0631','work','《第六监狱》','El Sexto','candidate','1','WCD10-B11-W103','补入有直接馆藏或图书馆书目支持的Arguedas作品/合集；不追求全集或学术覆盖。; 中文为工作译名，西班牙语题名为身份锚点；未宣称为正式中文出版译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0632','work','《拉苏-尼蒂的临终》','La agonía de Rasu-Ñiti','candidate','1','WCD10-B11-W104','补入有直接馆藏或图书馆书目支持的Arguedas作品/合集；不追求全集或学术覆盖。; 中文为工作译名，西班牙语题名为身份锚点；未宣称为正式中文出版译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0633','work','《仆人的梦》','El sueño del pongo','candidate','1','WCD10-B11-W105','补入有直接馆藏或图书馆书目支持的Arguedas作品/合集；不追求全集或学术覆盖。; 中文为工作译名，西班牙语题名为身份锚点；未宣称为正式中文出版译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0634','collection','《爱情世界与阿格达斯短篇集》','Amor mundo y todos los cuentos de José María Arguedas','candidate','1','WCD10-B11-W106','补入有直接馆藏或图书馆书目支持的Arguedas作品/合集；不追求全集或学术覆盖。; 中文为工作译名，西班牙语题名为身份锚点；未宣称为正式中文出版译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0635','work','《长笛之声》','El tañido de una flauta','candidate','1','WCD10-B11-W201','CVC作者书目直接列出该独立作品，且与既有皮托尔作品实体逐题去重后未发现相同对象；文类和简介限于直接来源所述。; 中文仅为本轮工作译名；以西班牙语原题识别，不主张已核实正式中文译本名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0636','work','《花卉节》','Juegos florales','candidate','1','WCD10-B11-W202','CVC作者书目直接列出该独立作品，且与既有皮托尔作品实体逐题去重后未发现相同对象；文类和简介限于直接来源所述。; 中文仅为本轮工作译名；以西班牙语原题识别，不主张已核实正式中文译本名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0637','work','《旅程》','El viaje','candidate','1','WCD10-B11-W203','CVC作者书目直接列出该独立作品，且与既有皮托尔作品实体逐题去重后未发现相同对象；文类和简介限于直接来源所述。; 中文仅为本轮工作译名；以西班牙语原题识别，不主张已核实正式中文译本名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0638','work','《维也纳魔法师》','El mago de Viena','candidate','1','WCD10-B11-W204','CVC作者书目直接列出该独立作品，且与既有皮托尔作品实体逐题去重后未发现相同对象；文类和简介限于直接来源所述。; 中文仅为本轮工作译名；以西班牙语原题识别，不主张已核实正式中文译本名。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0618','WCD10-B11-W001','WCD-10-B11','WCD10-B11-W001','V1-ENT-0622','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0619','WCD10-B11-W002','WCD-10-B11','WCD10-B11-W002','V1-ENT-0623','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0620','WCD10-B11-W003','WCD-10-B11','WCD10-B11-W003','V1-ENT-0624','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0621','WCD10-B11-W004','WCD-10-B11','WCD10-B11-W004','V1-ENT-0625','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0622','WCD10-B11-W005','WCD-10-B11','WCD10-B11-W005','V1-ENT-0626','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0623','WCD10-B11-W006','WCD-10-B11','WCD10-B11-W006','V1-ENT-0627','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0624','WCD10-B11-W007','WCD-10-B11','WCD10-B11-W007','V1-ENT-0628','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0625','WCD10-B11-W101','WCD-10-B11','WCD10-B11-W101','V1-ENT-0629','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0626','WCD10-B11-W102','WCD-10-B11','WCD10-B11-W102','V1-ENT-0630','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0627','WCD10-B11-W103','WCD-10-B11','WCD10-B11-W103','V1-ENT-0631','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0628','WCD10-B11-W104','WCD-10-B11','WCD10-B11-W104','V1-ENT-0632','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0629','WCD10-B11-W105','WCD-10-B11','WCD10-B11-W105','V1-ENT-0633','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0630','WCD10-B11-W106','WCD-10-B11','WCD10-B11-W106','V1-ENT-0634','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0631','WCD10-B11-W201','WCD-10-B11','WCD10-B11-W201','V1-ENT-0635','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0632','WCD10-B11-W202','WCD-10-B11','WCD10-B11-W202','V1-ENT-0636','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0633','WCD10-B11-W203','WCD-10-B11','WCD10-B11-W203','V1-ENT-0637','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0634','WCD10-B11-W204','WCD-10-B11','WCD10-B11-W204','V1-ENT-0638','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0581','WCD-10-B11:V1-ENT-0622','V1-ENT-0622','work','《我们之中的谁》','马里奥·贝内德蒂','Quién de nosotros','乌拉圭','es','1953','长篇小说','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《我们之中的谁》｜Quién de nosotros

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1953
- genre_or_form：长篇小说
- one_sentence_summary：Benedetti早期小说创作的起点；基金会称其为作者第一部小说，并记录后续版本。
- bibliographic_note：基金会将《Quién de nosotros》列为贝内德蒂的第一部小说，并记载1953年《Número》首版及其后的再版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0582','WCD-10-B11:V1-ENT-0623','V1-ENT-0623','collection','《办公室诗》','马里奥·贝内德蒂','Poemas de la oficina','乌拉圭','es','1956','诗集','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《办公室诗》｜Poemas de la oficina

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：诗集
- one_sentence_summary：基金会称该诗集是贝内德蒂的重要作品之一，并指出作者认为它是首部在读者中产生实际反响的书。
- bibliographic_note：基金会称该诗集是贝内德蒂重要作品之一，并指出作者承认它是首部在读者中产生实际反响的书；首版为1956年《Número》。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0583','WCD-10-B11:V1-ENT-0624','V1-ENT-0624','collection','《今天早晨》','马里奥·贝内德蒂','Esta mañana','乌拉圭','es','1949','短篇小说集','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《今天早晨》｜Esta mañana

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1949
- genre_or_form：短篇小说集
- one_sentence_summary：短篇集收录九篇作品，基金会所列篇目从同名故事延伸至《Como un ladrón》《Idilio》等。
- bibliographic_note：基金会列出本书收录的九篇短篇，包括同名篇、Como un ladrón、Idilio与La lluvia y los hongos。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0584','WCD-10-B11:V1-ENT-0625','V1-ENT-0625','work','《胡安·安赫尔的生日》','马里奥·贝内德蒂','El cumpleaños de Juan Ángel','乌拉圭','es','1971','诗体小说','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《胡安·安赫尔的生日》｜El cumpleaños de Juan Ángel

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1971
- genre_or_form：诗体小说
- one_sentence_summary：作品以诗体小说形式展开；基金会称其具有形式实验性，并记录1971年首版。
- bibliographic_note：基金会将其称为诗体小说，并指出它是贝内德蒂较具形式实验性的作品；首版于1971年在墨西哥出版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0585','WCD-10-B11:V1-ENT-0626','V1-ENT-0626','collection','《有与无乡愁》','马里奥·贝内德蒂','Con y sin nostalgia','乌拉圭','es','1977','短篇小说集','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《有与无乡愁》｜Con y sin nostalgia

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1977
- genre_or_form：短篇小说集
- one_sentence_summary：短篇集收录多篇故事，基金会列出的篇目包括《Sobre el éxodo》《La vecina orilla》。
- bibliographic_note：基金会记录其1977年由墨西哥Siglo XXI出版，并列出收录的短篇题名，包括Sobre el éxodo与La vecina orilla。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0586','WCD-10-B11:V1-ENT-0627','V1-ENT-0627','work','《佩德罗与上尉》','马里奥·贝内德蒂','Pedro y el capitán','乌拉圭','es','1979','戏剧','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《佩德罗与上尉》｜Pedro y el capitán

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1979
- genre_or_form：戏剧
- one_sentence_summary：戏剧作品于1979年在墨西哥出版并由流亡中的El Galpón剧团首演；基金会称其为贝内德蒂上演次数最多的戏剧。
- bibliographic_note：基金会称这是贝内德蒂上演次数最多的戏剧，并记载1979年墨西哥出版及同年首演。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0587','WCD-10-B11:V1-ENT-0628','V1-ENT-0628','work','《破碎一角的春天》','马里奥·贝内德蒂','Primavera con una esquina rota','乌拉圭','es','','小说','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《破碎一角的春天》｜Primavera con una esquina rota

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：基金会将本小说列为作者流亡期间的重要创作；本条只记录其直接归属及书目身份。
- bibliographic_note：基金会将其列为贝内德蒂流亡期间创作的代表小说之一。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0588','WCD-10-B11:V1-ENT-0629','V1-ENT-0629','collection','《水》','何塞·玛丽亚·阿格达斯','Agua','秘鲁','es','1935','短篇小说集','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《水》｜Agua

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1935
- genre_or_form：短篇小说集
- one_sentence_summary：《Agua》首版同册还收录《Los escoleros》和《Warma kuyay》；仅按目录记录说明该故事集。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0589','WCD-10-B11:V1-ENT-0630','V1-ENT-0630','work','《钻石与燧石》','何塞·玛丽亚·阿格达斯','Diamantes y pedernales','秘鲁','es','1954','小说','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《钻石与燧石》｜Diamantes y pedernales

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1954
- genre_or_form：小说
- one_sentence_summary：Arguedas于1954年出版的小说；本条限于书目身份和体裁，不增加主题解释。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0590','WCD-10-B11:V1-ENT-0631','V1-ENT-0631','work','《第六监狱》','何塞·玛丽亚·阿格达斯','El Sexto','秘鲁','es','1961','小说','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《第六监狱》｜El Sexto

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1961
- genre_or_form：小说
- one_sentence_summary：小说人物Gabriel讲述自己在利马El Sexto监狱的经历；简介限于馆藏版本封底所载。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0591','WCD-10-B11:V1-ENT-0632','V1-ENT-0632','work','《拉苏-尼蒂的临终》','何塞·玛丽亚·阿格达斯','La agonía de Rasu-Ñiti','秘鲁','es','','短篇小说','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《拉苏-尼蒂的临终》｜La agonía de Rasu-Ñiti

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- bibliographic_note：BNP目录记录1962年版，Casa馆藏记录[1964?]版；版本首发口径未定，原子年份留空。
- genre_or_form：短篇小说
- one_sentence_summary：短篇小说写剪刀舞者Rasu-Ñiti临终前最后一舞，并将Wamani精神传给徒弟；限于馆藏简介。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0592','WCD-10-B11:V1-ENT-0633','V1-ENT-0633','work','《仆人的梦》','何塞·玛丽亚·阿格达斯','El sueño del pongo','秘鲁','es','1965','盖丘亚语故事','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《仆人的梦》｜El sueño del pongo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1965
- genre_or_form：盖丘亚语故事
- one_sentence_summary：1965年版目录将其著录为盖丘亚语故事，并说明文本为盖丘亚语和西班牙语双语。
- bibliographic_note：BNP说明该故事并非Arguedas原创；他记述自己在利马听一位Qatqa社区成员讲述后，将其以盖丘亚语和西班牙语出版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0593','WCD-10-B11:V1-ENT-0634','V1-ENT-0634','collection','《爱情世界与阿格达斯短篇集》','何塞·玛丽亚·阿格达斯','Amor mundo y todos los cuentos de José María Arguedas','秘鲁','es','1967','短篇小说集','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《爱情世界与阿格达斯短篇集》｜Amor mundo y todos los cuentos de José María Arguedas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1967
- genre_or_form：短篇小说集
- one_sentence_summary：1967年首版的短篇小说集，馆藏目录列出其中包括Agua、Warma Kuyay、La agonía de Rasu-Ñiti等篇目。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0594','WCD-10-B11:V1-ENT-0635','V1-ENT-0635','work','《长笛之声》','塞尔希奥·皮托尔','El tañido de una flauta','墨西哥','es','','小说','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《长笛之声》｜El tañido de una flauta

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：塞万提斯学院书目将《El tañido de una flauta》列入皮托尔叙事作品；Anagrama也将其列作小说。
- bibliographic_note：Centro Virtual Cervantes列Era（墨西哥）1972年版；Anagrama作者简介在小说清单中列1986年。两来源可能对应不同版本/书目口径，原子首发年暂留空，不将差异强行归并。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0595','WCD-10-B11:V1-ENT-0636','V1-ENT-0636','work','《花卉节》','塞尔希奥·皮托尔','Juegos florales','墨西哥','es','','小说','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《花卉节》｜Juegos florales

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：塞万提斯学院与Anagrama均把《Juegos florales》列为皮托尔小说。
- bibliographic_note：Centro Virtual Cervantes书目列Siglo XXI（墨西哥）1982年版，Anagrama作者简介列1985年；未核定原版与后续版次关系，原子首发年留空。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0596','WCD-10-B11:V1-ENT-0637','V1-ENT-0637','work','《旅程》','塞尔希奥·皮托尔','El viaje','墨西哥','es','2000','跨文类记忆写作','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《旅程》｜El viaje

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：跨文类记忆写作
- one_sentence_summary：Anagrama将《El viaje》与《El arte de la fuga》《El mago de Viena》并列为跨文类记忆三部曲。
- first_publication_year：2000
- bibliographic_note：CVC作者书目列Era（墨西哥）2000年；Anagrama列2001年为其出版目录中的版本，故此候选仅采用CVC所列2000年墨西哥版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0597','WCD-10-B11:V1-ENT-0638','V1-ENT-0638','work','《维也纳魔法师》','塞尔希奥·皮托尔','El mago de Viena','墨西哥','es','2005','散文/记忆写作','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《维也纳魔法师》｜El mago de Viena

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：散文/记忆写作
- one_sentence_summary：Anagrama介绍该书以片段交织记忆、写作、喜爱的作家与旅行，并呈现皮托尔对阅读和创作的思考。
- first_publication_year：2005
- bibliographic_note：CVC列Pre-Textos（瓦伦西亚）2005年版；Anagrama将其与《El arte de la fuga》《El viaje》并列为记忆三部曲。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0598','WCD-10-B11:V1-ENT-0245','V1-ENT-0245','work','《休战》','马里奥·贝内德蒂','La tregua','乌拉圭','es','','小说','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《休战》｜La tregua

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：基金会将《La tregua》列为贝内德蒂的知名小说，并记载其推动作者国际影响、曾有多次再版及影视改编。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0599','WCD-10-B11:V1-ENT-0246','V1-ENT-0246','work','《谢谢你的火》','马里奥·贝内德蒂','Gracias por el fuego','乌拉圭','es','','小说','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《谢谢你的火》｜Gracias por el fuego

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：基金会记载《Gracias por el fuego》于1965年5月由蒙得维的亚Alfa首次出版，并于1972年达到第九版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0600','WCD-10-B11:V1-ENT-0247','V1-ENT-0247','collection','《蒙得维的亚人》','马里奥·贝内德蒂','Montevideanos','乌拉圭','es','','短篇小说集','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《蒙得维的亚人》｜Montevideanos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- one_sentence_summary：基金会列出《Montevideanos》所收短篇，包括“Puntero izquierdo”“Los pocillos”等篇目。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0601','WCD-10-B11:V1-ENT-0251','V1-ENT-0251','work','《血的节日》','何塞·玛丽亚·阿格达斯','Yawar fiesta','秘鲁','es','','小说','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《血的节日》｜Yawar fiesta

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：小说以安第斯地区传统与现代生活之间的冲突为背景。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0602','WCD-10-B11:V1-ENT-0252','V1-ENT-0252','work','《深沉的河流》','何塞·玛丽亚·阿格达斯','Los ríos profundos','秘鲁','es','','小说','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《深沉的河流》｜Los ríos profundos

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：小说描写少年埃内斯托生活于安第斯与混血文化两个世界之间。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0603','WCD-10-B11:V1-ENT-0253','V1-ENT-0253','work','《所有的血》','何塞·玛丽亚·阿格达斯','Todas las sangres','秘鲁','es','','小说','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《所有的血》｜Todas las sangres

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：小说通过不同地理和社会场景呈现秘鲁社会的地域与文化多样性。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0604','WCD-10-B11:V1-ENT-0378','V1-ENT-0378','work','《山上的狐狸，山下的狐狸》','何塞·玛丽亚·阿格达斯','El zorro de arriba y el zorro de abajo','秘鲁','es','','','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《山上的狐狸，山下的狐狸》｜El zorro de arriba y el zorro de abajo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：小说于作者逝世后出版；BNP介绍将作品与作者的个人危机及对秘鲁现代化的失望联系起来。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0605','WCD-10-B11:V1-ENT-0254','V1-ENT-0254','work','《爱情游行》','塞尔希奥·皮托尔','El desfile del amor','墨西哥','es','','小说','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《爱情游行》｜El desfile del amor

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：Anagrama称该小说获1984年Herralde小说奖。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0606','WCD-10-B11:V1-ENT-0255','V1-ENT-0255','work','《驯服神圣苍鹭》','塞尔希奥·皮托尔','Domar a la divina garza','墨西哥','es','','小说','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《驯服神圣苍鹭》｜Domar a la divina garza

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：Anagrama将本书与《爱情游行》《婚姻生活》并列组成Tríptico del Carnaval。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0607','WCD-10-B11:V1-ENT-0256','V1-ENT-0256','work','《婚姻生活》','塞尔希奥·皮托尔','La vida conyugal','墨西哥','es','','小说','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《婚姻生活》｜La vida conyugal

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：Anagrama将本书与《爱情游行》《驯服神圣苍鹭》并列组成Tríptico del Carnaval。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0608','WCD-10-B11:V1-ENT-0375','V1-ENT-0375','work','《逃亡的艺术》','塞尔希奥·皮托尔','El arte de la fuga','墨西哥','es','','','WCD-10-B11','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《逃亡的艺术》｜El arte de la fuga

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：Armando Pereira的书评称本书以记忆为中心，并交织回忆、阅读、绘画和旅行片段。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-1996','WCD10-B11-W001-F01','V1-CARD-0581','V1-ENT-0622','first_publication_year','1953','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1997','WCD10-B11-W001-F02','V1-CARD-0581','V1-ENT-0622','genre_or_form','长篇小说','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1998','WCD10-B11-W001-F03','V1-CARD-0581','V1-ENT-0622','one_sentence_summary','Benedetti早期小说创作的起点；基金会称其为作者第一部小说，并记录后续版本。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1999','WCD10-B11-W001-F04','V1-CARD-0581','V1-ENT-0622','bibliographic_note','基金会将《Quién de nosotros》列为贝内德蒂的第一部小说，并记载1953年《Número》首版及其后的再版。','bibliographic_note','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2000','WCD10-B11-W002-F01','V1-CARD-0582','V1-ENT-0623','first_publication_year','1956','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2001','WCD10-B11-W002-F02','V1-CARD-0582','V1-ENT-0623','genre_or_form','诗集','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2002','WCD10-B11-W002-F03','V1-CARD-0582','V1-ENT-0623','one_sentence_summary','基金会称该诗集是贝内德蒂的重要作品之一，并指出作者认为它是首部在读者中产生实际反响的书。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2003','WCD10-B11-W002-F04','V1-CARD-0582','V1-ENT-0623','bibliographic_note','基金会称该诗集是贝内德蒂重要作品之一，并指出作者承认它是首部在读者中产生实际反响的书；首版为1956年《Número》。','bibliographic_note','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2004','WCD10-B11-W003-F01','V1-CARD-0583','V1-ENT-0624','first_publication_year','1949','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2005','WCD10-B11-W003-F02','V1-CARD-0583','V1-ENT-0624','genre_or_form','短篇小说集','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2006','WCD10-B11-W003-F03','V1-CARD-0583','V1-ENT-0624','one_sentence_summary','短篇集收录九篇作品，基金会所列篇目从同名故事延伸至《Como un ladrón》《Idilio》等。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2007','WCD10-B11-W003-F04','V1-CARD-0583','V1-ENT-0624','bibliographic_note','基金会列出本书收录的九篇短篇，包括同名篇、Como un ladrón、Idilio与La lluvia y los hongos。','bibliographic_note','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2008','WCD10-B11-W004-F01','V1-CARD-0584','V1-ENT-0625','first_publication_year','1971','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2009','WCD10-B11-W004-F02','V1-CARD-0584','V1-ENT-0625','genre_or_form','诗体小说','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2010','WCD10-B11-W004-F03','V1-CARD-0584','V1-ENT-0625','one_sentence_summary','作品以诗体小说形式展开；基金会称其具有形式实验性，并记录1971年首版。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2011','WCD10-B11-W004-F04','V1-CARD-0584','V1-ENT-0625','bibliographic_note','基金会将其称为诗体小说，并指出它是贝内德蒂较具形式实验性的作品；首版于1971年在墨西哥出版。','bibliographic_note','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2012','WCD10-B11-W005-F01','V1-CARD-0585','V1-ENT-0626','first_publication_year','1977','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2013','WCD10-B11-W005-F02','V1-CARD-0585','V1-ENT-0626','genre_or_form','短篇小说集','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2014','WCD10-B11-W005-F03','V1-CARD-0585','V1-ENT-0626','one_sentence_summary','短篇集收录多篇故事，基金会列出的篇目包括《Sobre el éxodo》《La vecina orilla》。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2015','WCD10-B11-W005-F04','V1-CARD-0585','V1-ENT-0626','bibliographic_note','基金会记录其1977年由墨西哥Siglo XXI出版，并列出收录的短篇题名，包括Sobre el éxodo与La vecina orilla。','bibliographic_note','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2016','WCD10-B11-W006-F01','V1-CARD-0586','V1-ENT-0627','first_publication_year','1979','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2017','WCD10-B11-W006-F02','V1-CARD-0586','V1-ENT-0627','genre_or_form','戏剧','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2018','WCD10-B11-W006-F03','V1-CARD-0586','V1-ENT-0627','one_sentence_summary','戏剧作品于1979年在墨西哥出版并由流亡中的El Galpón剧团首演；基金会称其为贝内德蒂上演次数最多的戏剧。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2019','WCD10-B11-W006-F04','V1-CARD-0586','V1-ENT-0627','bibliographic_note','基金会称这是贝内德蒂上演次数最多的戏剧，并记载1979年墨西哥出版及同年首演。','bibliographic_note','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2020','WCD10-B11-W007-F01','V1-CARD-0587','V1-ENT-0628','genre_or_form','小说','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2021','WCD10-B11-W007-F02','V1-CARD-0587','V1-ENT-0628','one_sentence_summary','基金会将本小说列为作者流亡期间的重要创作；本条只记录其直接归属及书目身份。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2022','WCD10-B11-W007-F03','V1-CARD-0587','V1-ENT-0628','bibliographic_note','基金会将其列为贝内德蒂流亡期间创作的代表小说之一。','bibliographic_note','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2023','WCD10-B11-W101-F01','V1-CARD-0588','V1-ENT-0629','first_publication_year','1935','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2024','WCD10-B11-W101-F02','V1-CARD-0588','V1-ENT-0629','genre_or_form','短篇小说集','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2025','WCD10-B11-W101-F03','V1-CARD-0588','V1-ENT-0629','one_sentence_summary','《Agua》首版同册还收录《Los escoleros》和《Warma kuyay》；仅按目录记录说明该故事集。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2026','WCD10-B11-W102-F01','V1-CARD-0589','V1-ENT-0630','first_publication_year','1954','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2027','WCD10-B11-W102-F02','V1-CARD-0589','V1-ENT-0630','genre_or_form','小说','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2028','WCD10-B11-W102-F03','V1-CARD-0589','V1-ENT-0630','one_sentence_summary','Arguedas于1954年出版的小说；本条限于书目身份和体裁，不增加主题解释。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2029','WCD10-B11-W103-F01','V1-CARD-0590','V1-ENT-0631','first_publication_year','1961','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2030','WCD10-B11-W103-F02','V1-CARD-0590','V1-ENT-0631','genre_or_form','小说','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2031','WCD10-B11-W103-F03','V1-CARD-0590','V1-ENT-0631','one_sentence_summary','小说人物Gabriel讲述自己在利马El Sexto监狱的经历；简介限于馆藏版本封底所载。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2032','WCD10-B11-W104-F01','V1-CARD-0591','V1-ENT-0632','bibliographic_note','BNP目录记录1962年版，Casa馆藏记录[1964?]版；版本首发口径未定，原子年份留空。','bibliographic_note','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2033','WCD10-B11-W104-F02','V1-CARD-0591','V1-ENT-0632','genre_or_form','短篇小说','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2034','WCD10-B11-W104-F03','V1-CARD-0591','V1-ENT-0632','one_sentence_summary','短篇小说写剪刀舞者Rasu-Ñiti临终前最后一舞，并将Wamani精神传给徒弟；限于馆藏简介。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2035','WCD10-B11-W105-F01','V1-CARD-0592','V1-ENT-0633','first_publication_year','1965','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2036','WCD10-B11-W105-F02','V1-CARD-0592','V1-ENT-0633','genre_or_form','盖丘亚语故事','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2037','WCD10-B11-W105-F03','V1-CARD-0592','V1-ENT-0633','one_sentence_summary','1965年版目录将其著录为盖丘亚语故事，并说明文本为盖丘亚语和西班牙语双语。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2038','WCD10-B11-W105-F04','V1-CARD-0592','V1-ENT-0633','bibliographic_note','BNP说明该故事并非Arguedas原创；他记述自己在利马听一位Qatqa社区成员讲述后，将其以盖丘亚语和西班牙语出版。','bibliographic_note','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2039','WCD10-B11-W106-F01','V1-CARD-0593','V1-ENT-0634','first_publication_year','1967','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2040','WCD10-B11-W106-F02','V1-CARD-0593','V1-ENT-0634','genre_or_form','短篇小说集','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2041','WCD10-B11-W106-F03','V1-CARD-0593','V1-ENT-0634','one_sentence_summary','1967年首版的短篇小说集，馆藏目录列出其中包括Agua、Warma Kuyay、La agonía de Rasu-Ñiti等篇目。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2042','WCD10-B11-W201-F01','V1-CARD-0594','V1-ENT-0635','genre_or_form','小说','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2043','WCD10-B11-W201-F02','V1-CARD-0594','V1-ENT-0635','one_sentence_summary','塞万提斯学院书目将《El tañido de una flauta》列入皮托尔叙事作品；Anagrama也将其列作小说。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2044','WCD10-B11-W201-F03','V1-CARD-0594','V1-ENT-0635','bibliographic_note','Centro Virtual Cervantes列Era（墨西哥）1972年版；Anagrama作者简介在小说清单中列1986年。两来源可能对应不同版本/书目口径，原子首发年暂留空，不将差异强行归并。','bibliographic_note','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2045','WCD10-B11-W202-F01','V1-CARD-0595','V1-ENT-0636','genre_or_form','小说','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2046','WCD10-B11-W202-F02','V1-CARD-0595','V1-ENT-0636','one_sentence_summary','塞万提斯学院与Anagrama均把《Juegos florales》列为皮托尔小说。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2047','WCD10-B11-W202-F03','V1-CARD-0595','V1-ENT-0636','bibliographic_note','Centro Virtual Cervantes书目列Siglo XXI（墨西哥）1982年版，Anagrama作者简介列1985年；未核定原版与后续版次关系，原子首发年留空。','bibliographic_note','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2048','WCD10-B11-W203-F01','V1-CARD-0596','V1-ENT-0637','genre_or_form','跨文类记忆写作','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2049','WCD10-B11-W203-F02','V1-CARD-0596','V1-ENT-0637','one_sentence_summary','Anagrama将《El viaje》与《El arte de la fuga》《El mago de Viena》并列为跨文类记忆三部曲。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2050','WCD10-B11-W203-F03','V1-CARD-0596','V1-ENT-0637','first_publication_year','2000','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2051','WCD10-B11-W203-F04','V1-CARD-0596','V1-ENT-0637','bibliographic_note','CVC作者书目列Era（墨西哥）2000年；Anagrama列2001年为其出版目录中的版本，故此候选仅采用CVC所列2000年墨西哥版。','bibliographic_note','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2052','WCD10-B11-W204-F01','V1-CARD-0597','V1-ENT-0638','genre_or_form','散文/记忆写作','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2053','WCD10-B11-W204-F02','V1-CARD-0597','V1-ENT-0638','one_sentence_summary','Anagrama介绍该书以片段交织记忆、写作、喜爱的作家与旅行，并呈现皮托尔对阅读和创作的思考。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2054','WCD10-B11-W204-F03','V1-CARD-0597','V1-ENT-0638','first_publication_year','2005','bibliographic','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2055','WCD10-B11-W204-F04','V1-CARD-0597','V1-ENT-0638','bibliographic_note','CVC列Pre-Textos（瓦伦西亚）2005年版；Anagrama将其与《El arte de la fuga》《El viaje》并列为记忆三部曲。','bibliographic_note','WCD-10-B11','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2056','WCD10-B11-F001','V1-CARD-0598','V1-ENT-0245','genre_or_form','小说','bibliographic','WCD-10-B11','high','batch_retained_candidate','追加缺失体裁/有限简介；保留全部基线事实及其来源链。'),
('V1-FCT-2057','WCD10-B11-F002','V1-CARD-0598','V1-ENT-0245','one_sentence_summary','基金会将《La tregua》列为贝内德蒂的知名小说，并记载其推动作者国际影响、曾有多次再版及影视改编。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','追加缺失体裁/有限简介；保留全部基线事实及其来源链。'),
('V1-FCT-2058','WCD10-B11-F003','V1-CARD-0599','V1-ENT-0246','genre_or_form','小说','bibliographic','WCD-10-B11','high','batch_retained_candidate','追加缺失体裁/有限简介；保留全部基线事实及其来源链。'),
('V1-FCT-2059','WCD10-B11-F004','V1-CARD-0599','V1-ENT-0246','one_sentence_summary','基金会记载《Gracias por el fuego》于1965年5月由蒙得维的亚Alfa首次出版，并于1972年达到第九版。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','追加缺失体裁/有限简介；保留全部基线事实及其来源链。'),
('V1-FCT-2060','WCD10-B11-F005','V1-CARD-0600','V1-ENT-0247','genre_or_form','短篇小说集','bibliographic','WCD-10-B11','high','batch_retained_candidate','追加缺失体裁/有限简介；保留全部基线事实及其来源链。'),
('V1-FCT-2061','WCD10-B11-F006','V1-CARD-0600','V1-ENT-0247','one_sentence_summary','基金会列出《Montevideanos》所收短篇，包括“Puntero izquierdo”“Los pocillos”等篇目。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','追加缺失体裁/有限简介；保留全部基线事实及其来源链。'),
('V1-FCT-2062','WCD10-B11-F101','V1-CARD-0601','V1-ENT-0251','genre_or_form','小说','bibliographic','WCD-10-B11','high','batch_retained_candidate','仅采纳BNP同一作者资源页L36/L45/L52/L58的体裁和对象简介；不增加人物事实、主题关系或其他解释。'),
('V1-FCT-2063','WCD10-B11-F102','V1-CARD-0601','V1-ENT-0251','one_sentence_summary','小说以安第斯地区传统与现代生活之间的冲突为背景。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','仅采纳BNP同一作者资源页L36/L45/L52/L58的体裁和对象简介；不增加人物事实、主题关系或其他解释。'),
('V1-FCT-2064','WCD10-B11-F103','V1-CARD-0602','V1-ENT-0252','genre_or_form','小说','bibliographic','WCD-10-B11','high','batch_retained_candidate','仅采纳BNP同一作者资源页L36/L45/L52/L58的体裁和对象简介；不增加人物事实、主题关系或其他解释。'),
('V1-FCT-2065','WCD10-B11-F104','V1-CARD-0602','V1-ENT-0252','one_sentence_summary','小说描写少年埃内斯托生活于安第斯与混血文化两个世界之间。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','仅采纳BNP同一作者资源页L36/L45/L52/L58的体裁和对象简介；不增加人物事实、主题关系或其他解释。'),
('V1-FCT-2066','WCD10-B11-F105','V1-CARD-0603','V1-ENT-0253','genre_or_form','小说','bibliographic','WCD-10-B11','high','batch_retained_candidate','仅采纳BNP同一作者资源页L36/L45/L52/L58的体裁和对象简介；不增加人物事实、主题关系或其他解释。'),
('V1-FCT-2067','WCD10-B11-F106','V1-CARD-0603','V1-ENT-0253','one_sentence_summary','小说通过不同地理和社会场景呈现秘鲁社会的地域与文化多样性。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','仅采纳BNP同一作者资源页L36/L45/L52/L58的体裁和对象简介；不增加人物事实、主题关系或其他解释。'),
('V1-FCT-2068','WCD10-B11-F107','V1-CARD-0604','V1-ENT-0378','one_sentence_summary','小说于作者逝世后出版；BNP介绍将作品与作者的个人危机及对秘鲁现代化的失望联系起来。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','仅采纳BNP同一作者资源页L36/L45/L52/L58的体裁和对象简介；不增加人物事实、主题关系或其他解释。'),
('V1-FCT-2069','WCD10-B11-F215','V1-CARD-0605','V1-ENT-0254','genre_or_form','小说','bibliographic','WCD-10-B11','high','batch_retained_candidate','只追加此候选字段；保留该对象所有现存同字段/异字段事实及完整来源链，不执行覆盖或冲突裁决。'),
('V1-FCT-2070','WCD10-B11-F216','V1-CARD-0605','V1-ENT-0254','one_sentence_summary','Anagrama称该小说获1984年Herralde小说奖。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','只追加此候选字段；保留该对象所有现存同字段/异字段事实及完整来源链，不执行覆盖或冲突裁决。'),
('V1-FCT-2071','WCD10-B11-F217','V1-CARD-0606','V1-ENT-0255','genre_or_form','小说','bibliographic','WCD-10-B11','high','batch_retained_candidate','只追加此候选字段；保留该对象所有现存同字段/异字段事实及完整来源链，不执行覆盖或冲突裁决。'),
('V1-FCT-2072','WCD10-B11-F218','V1-CARD-0606','V1-ENT-0255','one_sentence_summary','Anagrama将本书与《爱情游行》《婚姻生活》并列组成Tríptico del Carnaval。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','只追加此候选字段；保留该对象所有现存同字段/异字段事实及完整来源链，不执行覆盖或冲突裁决。'),
('V1-FCT-2073','WCD10-B11-F219','V1-CARD-0607','V1-ENT-0256','genre_or_form','小说','bibliographic','WCD-10-B11','high','batch_retained_candidate','只追加此候选字段；保留该对象所有现存同字段/异字段事实及完整来源链，不执行覆盖或冲突裁决。'),
('V1-FCT-2074','WCD10-B11-F220','V1-CARD-0607','V1-ENT-0256','one_sentence_summary','Anagrama将本书与《爱情游行》《驯服神圣苍鹭》并列组成Tríptico del Carnaval。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','只追加此候选字段；保留该对象所有现存同字段/异字段事实及完整来源链，不执行覆盖或冲突裁决。'),
('V1-FCT-2075','WCD10-B11-F222','V1-CARD-0608','V1-ENT-0375','one_sentence_summary','Armando Pereira的书评称本书以记忆为中心，并交织回忆、阅读、绘画和旅行片段。','institutional_paraphrase','WCD-10-B11','high','batch_retained_candidate','只追加此候选字段；保留该对象所有现存同字段/异字段事实及完整来源链，不执行覆盖或冲突裁决。');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-1996','SRC-0682','Su obra: 1945-1958 — Fundación Mario Benedetti'),
('V1-FCT-1997','SRC-0682','Su obra: 1945-1958 — Fundación Mario Benedetti'),
('V1-FCT-1998','SRC-0682','Su obra: 1945-1958 — Fundación Mario Benedetti'),
('V1-FCT-1999','SRC-0682','Su obra: 1945-1958 — Fundación Mario Benedetti'),
('V1-FCT-2000','SRC-0682','Su obra: 1945-1958 — Fundación Mario Benedetti'),
('V1-FCT-2001','SRC-0682','Su obra: 1945-1958 — Fundación Mario Benedetti'),
('V1-FCT-2002','SRC-0682','Su obra: 1945-1958 — Fundación Mario Benedetti'),
('V1-FCT-2003','SRC-0682','Su obra: 1945-1958 — Fundación Mario Benedetti'),
('V1-FCT-2004','SRC-0682','Su obra: 1945-1958 — Fundación Mario Benedetti'),
('V1-FCT-2005','SRC-0682','Su obra: 1945-1958 — Fundación Mario Benedetti'),
('V1-FCT-2006','SRC-0682','Su obra: 1945-1958 — Fundación Mario Benedetti'),
('V1-FCT-2007','SRC-0682','Su obra: 1945-1958 — Fundación Mario Benedetti'),
('V1-FCT-2008','SRC-0683','Su obra: 1966-1972 — Fundación Mario Benedetti'),
('V1-FCT-2009','SRC-0683','Su obra: 1966-1972 — Fundación Mario Benedetti'),
('V1-FCT-2010','SRC-0683','Su obra: 1966-1972 — Fundación Mario Benedetti'),
('V1-FCT-2011','SRC-0683','Su obra: 1966-1972 — Fundación Mario Benedetti'),
('V1-FCT-2012','SRC-0684','Su obra: 1973-1983 — Fundación Mario Benedetti'),
('V1-FCT-2013','SRC-0684','Su obra: 1973-1983 — Fundación Mario Benedetti'),
('V1-FCT-2014','SRC-0684','Su obra: 1973-1983 — Fundación Mario Benedetti'),
('V1-FCT-2015','SRC-0684','Su obra: 1973-1983 — Fundación Mario Benedetti'),
('V1-FCT-2016','SRC-0684','Su obra: 1973-1983 — Fundación Mario Benedetti'),
('V1-FCT-2017','SRC-0684','Su obra: 1973-1983 — Fundación Mario Benedetti'),
('V1-FCT-2018','SRC-0684','Su obra: 1973-1983 — Fundación Mario Benedetti'),
('V1-FCT-2019','SRC-0684','Su obra: 1973-1983 — Fundación Mario Benedetti'),
('V1-FCT-2020','SRC-0684','Su obra: 1973-1983 — Fundación Mario Benedetti'),
('V1-FCT-2021','SRC-0684','Su obra: 1973-1983 — Fundación Mario Benedetti'),
('V1-FCT-2022','SRC-0684','Su obra: 1973-1983 — Fundación Mario Benedetti'),
('V1-FCT-2023','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2023','SRC-0198','Un recorrido por la obra literaria de José María Arguedas'),
('V1-FCT-2024','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2024','SRC-0198','Un recorrido por la obra literaria de José María Arguedas'),
('V1-FCT-2025','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2026','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2027','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2028','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2029','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2030','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2030','SRC-0686','El sexto / José María Arguedas; prólogo de Alberto Escobar'),
('V1-FCT-2031','SRC-0686','El sexto / José María Arguedas; prólogo de Alberto Escobar'),
('V1-FCT-2032','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2032','SRC-0687','La agonía de Rasu-Ñiti / José María Arguedas'),
('V1-FCT-2033','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2033','SRC-0687','La agonía de Rasu-Ñiti / José María Arguedas'),
('V1-FCT-2034','SRC-0687','La agonía de Rasu-Ñiti / José María Arguedas'),
('V1-FCT-2035','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2036','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2037','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2038','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2039','SRC-0688','Amor mundo y todos los cuentos de José María Arguedas'),
('V1-FCT-2040','SRC-0688','Amor mundo y todos los cuentos de José María Arguedas'),
('V1-FCT-2041','SRC-0688','Amor mundo y todos los cuentos de José María Arguedas'),
('V1-FCT-2042','SRC-0201','CVC. Sergio Pitol. Bibliografía'),
('V1-FCT-2042','SRC-0689','Sergio Pitol — Editorial Anagrama'),
('V1-FCT-2043','SRC-0201','CVC. Sergio Pitol. Bibliografía'),
('V1-FCT-2043','SRC-0689','Sergio Pitol — Editorial Anagrama'),
('V1-FCT-2044','SRC-0201','CVC. Sergio Pitol. Bibliografía'),
('V1-FCT-2044','SRC-0689','Sergio Pitol — Editorial Anagrama'),
('V1-FCT-2045','SRC-0201','CVC. Sergio Pitol. Bibliografía'),
('V1-FCT-2045','SRC-0689','Sergio Pitol — Editorial Anagrama'),
('V1-FCT-2046','SRC-0201','CVC. Sergio Pitol. Bibliografía'),
('V1-FCT-2046','SRC-0689','Sergio Pitol — Editorial Anagrama'),
('V1-FCT-2047','SRC-0201','CVC. Sergio Pitol. Bibliografía'),
('V1-FCT-2047','SRC-0689','Sergio Pitol — Editorial Anagrama'),
('V1-FCT-2048','SRC-0689','Sergio Pitol — Editorial Anagrama'),
('V1-FCT-2049','SRC-0689','Sergio Pitol — Editorial Anagrama'),
('V1-FCT-2050','SRC-0201','CVC. Sergio Pitol. Bibliografía'),
('V1-FCT-2051','SRC-0201','CVC. Sergio Pitol. Bibliografía'),
('V1-FCT-2051','SRC-0689','Sergio Pitol — Editorial Anagrama'),
('V1-FCT-2052','SRC-0201','CVC. Sergio Pitol. Bibliografía'),
('V1-FCT-2052','SRC-0689','Sergio Pitol — Editorial Anagrama'),
('V1-FCT-2053','SRC-0690','El mago de Viena — Sergio Pitol — Editorial Anagrama'),
('V1-FCT-2054','SRC-0201','CVC. Sergio Pitol. Bibliografía'),
('V1-FCT-2055','SRC-0201','CVC. Sergio Pitol. Bibliografía'),
('V1-FCT-2055','SRC-0689','Sergio Pitol — Editorial Anagrama'),
('V1-FCT-2056','SRC-0195','Su obra: 1959-1965'),
('V1-FCT-2057','SRC-0195','Su obra: 1959-1965'),
('V1-FCT-2058','SRC-0195','Su obra: 1959-1965'),
('V1-FCT-2059','SRC-0195','Su obra: 1959-1965'),
('V1-FCT-2060','SRC-0195','Su obra: 1959-1965'),
('V1-FCT-2061','SRC-0195','Su obra: 1959-1965'),
('V1-FCT-2062','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2063','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2064','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2065','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2066','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2067','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2068','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP'),
('V1-FCT-2069','SRC-0689','Sergio Pitol — Editorial Anagrama'),
('V1-FCT-2070','SRC-0689','Sergio Pitol — Editorial Anagrama'),
('V1-FCT-2071','SRC-0689','Sergio Pitol — Editorial Anagrama'),
('V1-FCT-2072','SRC-0689','Sergio Pitol — Editorial Anagrama'),
('V1-FCT-2073','SRC-0689','Sergio Pitol — Editorial Anagrama'),
('V1-FCT-2074','SRC-0689','Sergio Pitol — Editorial Anagrama'),
('V1-FCT-2075','SRC-0304','Sergio Pitol. El arte de la fuga');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0581','V1-FCT-1996','batch_retained_candidate'),
('V1-CARD-0581','V1-FCT-1997','batch_retained_candidate'),
('V1-CARD-0581','V1-FCT-1998','batch_retained_candidate'),
('V1-CARD-0581','V1-FCT-1999','batch_retained_candidate'),
('V1-CARD-0582','V1-FCT-2000','batch_retained_candidate'),
('V1-CARD-0582','V1-FCT-2001','batch_retained_candidate'),
('V1-CARD-0582','V1-FCT-2002','batch_retained_candidate'),
('V1-CARD-0582','V1-FCT-2003','batch_retained_candidate'),
('V1-CARD-0583','V1-FCT-2004','batch_retained_candidate'),
('V1-CARD-0583','V1-FCT-2005','batch_retained_candidate'),
('V1-CARD-0583','V1-FCT-2006','batch_retained_candidate'),
('V1-CARD-0583','V1-FCT-2007','batch_retained_candidate'),
('V1-CARD-0584','V1-FCT-2008','batch_retained_candidate'),
('V1-CARD-0584','V1-FCT-2009','batch_retained_candidate'),
('V1-CARD-0584','V1-FCT-2010','batch_retained_candidate'),
('V1-CARD-0584','V1-FCT-2011','batch_retained_candidate'),
('V1-CARD-0585','V1-FCT-2012','batch_retained_candidate'),
('V1-CARD-0585','V1-FCT-2013','batch_retained_candidate'),
('V1-CARD-0585','V1-FCT-2014','batch_retained_candidate'),
('V1-CARD-0585','V1-FCT-2015','batch_retained_candidate'),
('V1-CARD-0586','V1-FCT-2016','batch_retained_candidate'),
('V1-CARD-0586','V1-FCT-2017','batch_retained_candidate'),
('V1-CARD-0586','V1-FCT-2018','batch_retained_candidate'),
('V1-CARD-0586','V1-FCT-2019','batch_retained_candidate'),
('V1-CARD-0587','V1-FCT-2020','batch_retained_candidate'),
('V1-CARD-0587','V1-FCT-2021','batch_retained_candidate'),
('V1-CARD-0587','V1-FCT-2022','batch_retained_candidate'),
('V1-CARD-0588','V1-FCT-2023','batch_retained_candidate'),
('V1-CARD-0588','V1-FCT-2024','batch_retained_candidate'),
('V1-CARD-0588','V1-FCT-2025','batch_retained_candidate'),
('V1-CARD-0589','V1-FCT-2026','batch_retained_candidate'),
('V1-CARD-0589','V1-FCT-2027','batch_retained_candidate'),
('V1-CARD-0589','V1-FCT-2028','batch_retained_candidate'),
('V1-CARD-0590','V1-FCT-2029','batch_retained_candidate'),
('V1-CARD-0590','V1-FCT-2030','batch_retained_candidate'),
('V1-CARD-0590','V1-FCT-2031','batch_retained_candidate'),
('V1-CARD-0591','V1-FCT-2032','batch_retained_candidate'),
('V1-CARD-0591','V1-FCT-2033','batch_retained_candidate'),
('V1-CARD-0591','V1-FCT-2034','batch_retained_candidate'),
('V1-CARD-0592','V1-FCT-2035','batch_retained_candidate'),
('V1-CARD-0592','V1-FCT-2036','batch_retained_candidate'),
('V1-CARD-0592','V1-FCT-2037','batch_retained_candidate'),
('V1-CARD-0592','V1-FCT-2038','batch_retained_candidate'),
('V1-CARD-0593','V1-FCT-2039','batch_retained_candidate'),
('V1-CARD-0593','V1-FCT-2040','batch_retained_candidate'),
('V1-CARD-0593','V1-FCT-2041','batch_retained_candidate'),
('V1-CARD-0594','V1-FCT-2042','batch_retained_candidate'),
('V1-CARD-0594','V1-FCT-2043','batch_retained_candidate'),
('V1-CARD-0594','V1-FCT-2044','batch_retained_candidate'),
('V1-CARD-0595','V1-FCT-2045','batch_retained_candidate'),
('V1-CARD-0595','V1-FCT-2046','batch_retained_candidate'),
('V1-CARD-0595','V1-FCT-2047','batch_retained_candidate'),
('V1-CARD-0596','V1-FCT-2048','batch_retained_candidate'),
('V1-CARD-0596','V1-FCT-2049','batch_retained_candidate'),
('V1-CARD-0596','V1-FCT-2050','batch_retained_candidate'),
('V1-CARD-0596','V1-FCT-2051','batch_retained_candidate'),
('V1-CARD-0597','V1-FCT-2052','batch_retained_candidate'),
('V1-CARD-0597','V1-FCT-2053','batch_retained_candidate'),
('V1-CARD-0597','V1-FCT-2054','batch_retained_candidate'),
('V1-CARD-0597','V1-FCT-2055','batch_retained_candidate'),
('V1-CARD-0598','V1-FCT-2056','batch_retained_candidate'),
('V1-CARD-0598','V1-FCT-2057','batch_retained_candidate'),
('V1-CARD-0599','V1-FCT-2058','batch_retained_candidate'),
('V1-CARD-0599','V1-FCT-2059','batch_retained_candidate'),
('V1-CARD-0600','V1-FCT-2060','batch_retained_candidate'),
('V1-CARD-0600','V1-FCT-2061','batch_retained_candidate'),
('V1-CARD-0601','V1-FCT-2062','batch_retained_candidate'),
('V1-CARD-0601','V1-FCT-2063','batch_retained_candidate'),
('V1-CARD-0602','V1-FCT-2064','batch_retained_candidate'),
('V1-CARD-0602','V1-FCT-2065','batch_retained_candidate'),
('V1-CARD-0603','V1-FCT-2066','batch_retained_candidate'),
('V1-CARD-0603','V1-FCT-2067','batch_retained_candidate'),
('V1-CARD-0604','V1-FCT-2068','batch_retained_candidate'),
('V1-CARD-0605','V1-FCT-2069','batch_retained_candidate'),
('V1-CARD-0605','V1-FCT-2070','batch_retained_candidate'),
('V1-CARD-0606','V1-FCT-2071','batch_retained_candidate'),
('V1-CARD-0606','V1-FCT-2072','batch_retained_candidate'),
('V1-CARD-0607','V1-FCT-2073','batch_retained_candidate'),
('V1-CARD-0607','V1-FCT-2074','batch_retained_candidate'),
('V1-CARD-0608','V1-FCT-2075','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-1241','WCD10-B11-S001','V1-CARD-0581','SRC-0682','B','bibliography_or_bounded_description','yes','no','SRC-0682','accepted','NONE'),
('V1-CS-1242','WCD10-B11-S001','V1-CARD-0582','SRC-0682','B','bibliography_or_bounded_description','yes','no','SRC-0682','accepted','NONE'),
('V1-CS-1243','WCD10-B11-S001','V1-CARD-0583','SRC-0682','B','bibliography_or_bounded_description','yes','no','SRC-0682','accepted','NONE'),
('V1-CS-1244','WCD10-B11-S002','V1-CARD-0584','SRC-0683','B','bibliography_or_bounded_description','yes','no','SRC-0683','accepted','NONE'),
('V1-CS-1245','WCD10-B11-S003','V1-CARD-0585','SRC-0684','B','bibliography_or_bounded_description','yes','no','SRC-0684','accepted','NONE'),
('V1-CS-1246','WCD10-B11-S003','V1-CARD-0586','SRC-0684','B','bibliography_or_bounded_description','yes','no','SRC-0684','accepted','NONE'),
('V1-CS-1247','WCD10-B11-S003','V1-CARD-0587','SRC-0684','B','bibliography_or_bounded_description','yes','no','SRC-0684','accepted','NONE'),
('V1-CS-1248','WCD10-B11-S101','V1-CARD-0588','SRC-0685','B','bibliography_or_bounded_description','yes','no','SRC-0685','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1249','WCD10-B11-S105','V1-CARD-0588','SRC-0198','B','bibliography_or_bounded_description','yes','no','SRC-0198','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1250','WCD10-B11-S101','V1-CARD-0589','SRC-0685','B','bibliography_or_bounded_description','yes','no','SRC-0685','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1251','WCD10-B11-S101','V1-CARD-0590','SRC-0685','B','bibliography_or_bounded_description','yes','no','SRC-0685','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1252','WCD10-B11-S102','V1-CARD-0590','SRC-0686','B','bibliography_or_bounded_description','yes','no','SRC-0686','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1253','WCD10-B11-S101','V1-CARD-0591','SRC-0685','B','bibliography_or_bounded_description','yes','no','SRC-0685','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1254','WCD10-B11-S103','V1-CARD-0591','SRC-0687','B','bibliography_or_bounded_description','yes','no','SRC-0687','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1255','WCD10-B11-S101','V1-CARD-0592','SRC-0685','B','bibliography_or_bounded_description','yes','no','SRC-0685','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1256','WCD10-B11-S104','V1-CARD-0593','SRC-0688','B','bibliography_or_bounded_description','yes','no','SRC-0688','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1257','WCD10-B11-S201','V1-CARD-0594','SRC-0201','B','bibliography_or_bounded_description','yes','no','SRC-0201','accepted','NONE'),
('V1-CS-1258','WCD10-B11-S202','V1-CARD-0594','SRC-0689','B','bibliography_or_bounded_description','yes','no','SRC-0689','accepted','NONE'),
('V1-CS-1259','WCD10-B11-S201','V1-CARD-0595','SRC-0201','B','bibliography_or_bounded_description','yes','no','SRC-0201','accepted','NONE'),
('V1-CS-1260','WCD10-B11-S202','V1-CARD-0595','SRC-0689','B','bibliography_or_bounded_description','yes','no','SRC-0689','accepted','NONE'),
('V1-CS-1261','WCD10-B11-S201','V1-CARD-0596','SRC-0201','B','bibliography_or_bounded_description','yes','no','SRC-0201','accepted','NONE'),
('V1-CS-1262','WCD10-B11-S202','V1-CARD-0596','SRC-0689','B','bibliography_or_bounded_description','yes','no','SRC-0689','accepted','NONE'),
('V1-CS-1263','WCD10-B11-S201','V1-CARD-0597','SRC-0201','B','bibliography_or_bounded_description','yes','no','SRC-0201','accepted','NONE'),
('V1-CS-1264','WCD10-B11-S202','V1-CARD-0597','SRC-0689','B','bibliography_or_bounded_description','yes','no','SRC-0689','accepted','NONE'),
('V1-CS-1265','WCD10-B11-S204','V1-CARD-0597','SRC-0690','B','bibliography_or_bounded_description','no','no','SRC-0690','accepted','NONE'),
('V1-CS-1266','WCD10-B11-S004','V1-CARD-0598','SRC-0195','B','bibliography_or_bounded_description','yes','no','SRC-0195','accepted','NONE'),
('V1-CS-1267','WCD10-B11-S004','V1-CARD-0599','SRC-0195','B','bibliography_or_bounded_description','yes','no','SRC-0195','accepted','NONE'),
('V1-CS-1268','WCD10-B11-S004','V1-CARD-0600','SRC-0195','B','bibliography_or_bounded_description','yes','no','SRC-0195','accepted','NONE'),
('V1-CS-1269','WCD10-B11-S101','V1-CARD-0601','SRC-0685','B','bibliography_or_bounded_description','yes','no','SRC-0685','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1270','WCD10-B11-S101','V1-CARD-0602','SRC-0685','B','bibliography_or_bounded_description','yes','no','SRC-0685','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1271','WCD10-B11-S101','V1-CARD-0603','SRC-0685','B','bibliography_or_bounded_description','yes','no','SRC-0685','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1272','WCD10-B11-S101','V1-CARD-0604','SRC-0685','B','bibliography_or_bounded_description','no','no','SRC-0685','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1273','WCD10-B11-S202','V1-CARD-0605','SRC-0689','B','bibliography_or_bounded_description','yes','no','SRC-0689','accepted','NONE'),
('V1-CS-1274','WCD10-B11-S202','V1-CARD-0606','SRC-0689','B','bibliography_or_bounded_description','yes','no','SRC-0689','accepted','NONE'),
('V1-CS-1275','WCD10-B11-S202','V1-CARD-0607','SRC-0689','B','bibliography_or_bounded_description','yes','no','SRC-0689','accepted','NONE'),
('V1-CS-1276','WCD10-B11-S203','V1-CARD-0608','SRC-0304','C','bibliography_or_bounded_description','no','no','SRC-0304','accepted','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0591','WCD-10-B11','WCD10-B11-W001-CREATED','V1-ENT-0238','CREATED','V1-ENT-0622','马里奥·贝内德蒂创作 Quién de nosotros','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0592','WCD-10-B11','WCD10-B11-W002-CREATED','V1-ENT-0238','CREATED','V1-ENT-0623','马里奥·贝内德蒂创作 Poemas de la oficina','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0593','WCD-10-B11','WCD10-B11-W003-CREATED','V1-ENT-0238','CREATED','V1-ENT-0624','马里奥·贝内德蒂创作 Esta mañana','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0594','WCD-10-B11','WCD10-B11-W004-CREATED','V1-ENT-0238','CREATED','V1-ENT-0625','马里奥·贝内德蒂创作 El cumpleaños de Juan Ángel','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0595','WCD-10-B11','WCD10-B11-W005-CREATED','V1-ENT-0238','CREATED','V1-ENT-0626','马里奥·贝内德蒂创作 Con y sin nostalgia','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0596','WCD-10-B11','WCD10-B11-W006-CREATED','V1-ENT-0238','CREATED','V1-ENT-0627','马里奥·贝内德蒂创作 Pedro y el capitán','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0597','WCD-10-B11','WCD10-B11-W007-CREATED','V1-ENT-0238','CREATED','V1-ENT-0628','马里奥·贝内德蒂创作 Primavera con una esquina rota','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0598','WCD-10-B11','WCD10-B11-W101-CREATED','V1-ENT-0248','CREATED','V1-ENT-0629','何塞·玛丽亚·阿格达斯创作 Agua','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0599','WCD-10-B11','WCD10-B11-W102-CREATED','V1-ENT-0248','CREATED','V1-ENT-0630','何塞·玛丽亚·阿格达斯创作 Diamantes y pedernales','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0600','WCD-10-B11','WCD10-B11-W103-CREATED','V1-ENT-0248','CREATED','V1-ENT-0631','何塞·玛丽亚·阿格达斯创作 El Sexto','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0601','WCD-10-B11','WCD10-B11-W104-CREATED','V1-ENT-0248','CREATED','V1-ENT-0632','何塞·玛丽亚·阿格达斯创作 La agonía de Rasu-Ñiti','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0602','WCD-10-B11','WCD10-B11-W105-CREATED','V1-ENT-0248','CREATED','V1-ENT-0633','Arguedas整理并出版其听自Qatqa社区成员的盖丘亚传统故事，版本附盖丘亚语和西班牙语文本；不主张其为原创创作。','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0603','WCD-10-B11','WCD10-B11-W106-CREATED','V1-ENT-0248','CREATED','V1-ENT-0634','何塞·玛丽亚·阿格达斯创作 Amor mundo y todos los cuentos de José María Arguedas','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0604','WCD-10-B11','WCD10-B11-W201-CREATED','V1-ENT-0249','CREATED','V1-ENT-0635','塞尔希奥·皮托尔创作《长笛之声》（El tañido de una flauta）。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0605','WCD-10-B11','WCD10-B11-W202-CREATED','V1-ENT-0249','CREATED','V1-ENT-0636','塞尔希奥·皮托尔创作《花卉节》（Juegos florales）。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0606','WCD-10-B11','WCD10-B11-W203-CREATED','V1-ENT-0249','CREATED','V1-ENT-0637','塞尔希奥·皮托尔创作《旅程》（El viaje）。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0607','WCD-10-B11','WCD10-B11-W204-CREATED','V1-ENT-0249','CREATED','V1-ENT-0638','塞尔希奥·皮托尔创作《维也纳魔法师》（El mago de Viena）。','high','accepted','Codex-parent-independent-review:PASS','2','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0591','SRC-0682'),
('V1-REL-0592','SRC-0682'),
('V1-REL-0593','SRC-0682'),
('V1-REL-0594','SRC-0683'),
('V1-REL-0595','SRC-0684'),
('V1-REL-0596','SRC-0684'),
('V1-REL-0597','SRC-0684'),
('V1-REL-0598','SRC-0685'),
('V1-REL-0598','SRC-0198'),
('V1-REL-0599','SRC-0685'),
('V1-REL-0600','SRC-0685'),
('V1-REL-0600','SRC-0686'),
('V1-REL-0601','SRC-0685'),
('V1-REL-0601','SRC-0687'),
('V1-REL-0602','SRC-0685'),
('V1-REL-0603','SRC-0688'),
('V1-REL-0604','SRC-0201'),
('V1-REL-0604','SRC-0689'),
('V1-REL-0605','SRC-0201'),
('V1-REL-0605','SRC-0689'),
('V1-REL-0606','SRC-0201'),
('V1-REL-0606','SRC-0689'),
('V1-REL-0607','SRC-0201'),
('V1-REL-0607','SRC-0689');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0898','V1-REL-0591','WCD10-B11-S001','SRC-0682','Su obra: 1945-1958 — Fundación Mario Benedetti','第38-42行给出时期总述；第61-73行Esta mañana/Sólo mientras tanto；第91-108行Quién de nosotros、Poemas de la oficina的题名、类别、首次书目与内容说明。实读2026-10-12。','马里奥·贝内德蒂创作 Quién de nosotros','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0899','V1-REL-0592','WCD10-B11-S001','SRC-0682','Su obra: 1945-1958 — Fundación Mario Benedetti','第38-42行给出时期总述；第61-73行Esta mañana/Sólo mientras tanto；第91-108行Quién de nosotros、Poemas de la oficina的题名、类别、首次书目与内容说明。实读2026-10-12。','马里奥·贝内德蒂创作 Poemas de la oficina','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0900','V1-REL-0593','WCD10-B11-S001','SRC-0682','Su obra: 1945-1958 — Fundación Mario Benedetti','第38-42行给出时期总述；第61-73行Esta mañana/Sólo mientras tanto；第91-108行Quién de nosotros、Poemas de la oficina的题名、类别、首次书目与内容说明。实读2026-10-12。','马里奥·贝内德蒂创作 Esta mañana','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0901','V1-REL-0594','WCD10-B11-S002','SRC-0683','Su obra: 1966-1972 — Fundación Mario Benedetti','第38-42行时期概述；第153-160行El cumpleaños de Juan Ángel的1971首版、诗体小说和实验性描述。实读2026-10-12。','马里奥·贝内德蒂创作 El cumpleaños de Juan Ángel','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0902','V1-REL-0595','WCD10-B11-S003','SRC-0684','Su obra: 1973-1983 — Fundación Mario Benedetti','第38-40行提及流亡期间创作《Primavera con una esquina rota》；第92-96行Con y sin nostalgia及其篇目；第107-112行Pedro y el capitán戏剧作品及1979版/演出信息。实读2026-10-12。','马里奥·贝内德蒂创作 Con y sin nostalgia','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0903','V1-REL-0596','WCD10-B11-S003','SRC-0684','Su obra: 1973-1983 — Fundación Mario Benedetti','第38-40行提及流亡期间创作《Primavera con una esquina rota》；第92-96行Con y sin nostalgia及其篇目；第107-112行Pedro y el capitán戏剧作品及1979版/演出信息。实读2026-10-12。','马里奥·贝内德蒂创作 Pedro y el capitán','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0904','V1-REL-0597','WCD10-B11-S003','SRC-0684','Su obra: 1973-1983 — Fundación Mario Benedetti','第38-40行提及流亡期间创作《Primavera con una esquina rota》；第92-96行Con y sin nostalgia及其篇目；第107-112行Pedro y el capitán戏剧作品及1979版/演出信息。实读2026-10-12。','马里奥·贝内德蒂创作 Primavera con una esquina rota','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0905','V1-REL-0598','WCD10-B11-S101','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP','实读2026-10-12，第60行Agua及同册故事题名；第64–65行Diamantes y pedernales 1954；第73行El Sexto 1961、La agonía de Rasu Ñiti 1962；第78行El sueño del pongo 1965并标注cuento quechua和双语。','何塞·玛丽亚·阿格达斯创作 Agua','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0906','V1-REL-0598','WCD10-B11-S105','SRC-0198','Un recorrido por la obra literaria de José María Arguedas','实读2026-10-12，第30–40行列按时序展示的主要作品，并列Agua (1935)。规范化URL复用SRC-0198原B级。','何塞·玛丽亚·阿格达斯创作 Agua','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0907','V1-REL-0599','WCD10-B11-S101','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP','实读2026-10-12，第60行Agua及同册故事题名；第64–65行Diamantes y pedernales 1954；第73行El Sexto 1961、La agonía de Rasu Ñiti 1962；第78行El sueño del pongo 1965并标注cuento quechua和双语。','何塞·玛丽亚·阿格达斯创作 Diamantes y pedernales','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0908','V1-REL-0600','WCD10-B11-S101','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP','实读2026-10-12，第60行Agua及同册故事题名；第64–65行Diamantes y pedernales 1954；第73行El Sexto 1961、La agonía de Rasu Ñiti 1962；第78行El sueño del pongo 1965并标注cuento quechua和双语。','何塞·玛丽亚·阿格达斯创作 El Sexto','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0909','V1-REL-0600','WCD10-B11-S102','SRC-0686','El sexto / José María Arguedas; prólogo de Alberto Escobar','实读2026-10-12，第29–40行题名、责任者、小说分类与封底简介；仅该记录系2015再版，不据此确定首版年。','何塞·玛丽亚·阿格达斯创作 El Sexto','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0910','V1-REL-0601','WCD10-B11-S101','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP','实读2026-10-12，第60行Agua及同册故事题名；第64–65行Diamantes y pedernales 1954；第73行El Sexto 1961、La agonía de Rasu Ñiti 1962；第78行El sueño del pongo 1965并标注cuento quechua和双语。','何塞·玛丽亚·阿格达斯创作 La agonía de Rasu-Ñiti','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0911','V1-REL-0601','WCD10-B11-S103','SRC-0687','La agonía de Rasu-Ñiti / José María Arguedas','实读2026-10-12，第48–51行作者、馆藏版[1964?]、 cuentos peruanos 分类与内容摘要；与BNP的1962版并存，不能据该版裁定首版。','何塞·玛丽亚·阿格达斯创作 La agonía de Rasu-Ñiti','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0912','V1-REL-0602','WCD10-B11-S101','SRC-0685','José María Arguedas; Recursos bibliográficos en la BNP','实读2026-10-12，第60行Agua及同册故事题名；第64–65行Diamantes y pedernales 1954；第73行El Sexto 1961、La agonía de Rasu Ñiti 1962；第78行El sueño del pongo 1965并标注cuento quechua和双语。','Arguedas整理并出版其听自Qatqa社区成员的盖丘亚传统故事，版本附盖丘亚语和西班牙语文本；不主张其为原创创作。','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0913','V1-REL-0603','WCD10-B11-S104','SRC-0688','Amor mundo y todos los cuentos de José María Arguedas','实读2026-10-12，第48–54行作者、1967首版和Cuentos peruanos分类；第54行列收录篇目。','何塞·玛丽亚·阿格达斯创作 Amor mundo y todos los cuentos de José María Arguedas','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0914','V1-REL-0604','WCD10-B11-S201','SRC-0201','CVC. Sergio Pitol. Bibliografía','实读2026-10-12：Narrativa第7、11、13、24、28、30项列 El tañido de una flauta (1972)、Juegos florales (1982)、Vals de Mefisto (1984)、El viaje (2000)、El mago de Viena (2005)、Trilogía de la memoria (2007)；第51–57行列 Obras reunidas各卷。','塞尔希奥·皮托尔创作《长笛之声》（El tañido de una flauta）。','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0915','V1-REL-0604','WCD10-B11-S202','SRC-0689','Sergio Pitol — Editorial Anagrama','实读2026-10-12：作者简介第62–64行区分五部小说、短篇集与Trilogía de la Memoria；第63行说明El viaje、El mago de Viena属于跨文类记忆三部曲；第62行将El tañido/Juegos列为小说，所列1986/1985与CVC的原书目年份不同。','塞尔希奥·皮托尔创作《长笛之声》（El tañido de una flauta）。','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0916','V1-REL-0605','WCD10-B11-S201','SRC-0201','CVC. Sergio Pitol. Bibliografía','实读2026-10-12：Narrativa第7、11、13、24、28、30项列 El tañido de una flauta (1972)、Juegos florales (1982)、Vals de Mefisto (1984)、El viaje (2000)、El mago de Viena (2005)、Trilogía de la memoria (2007)；第51–57行列 Obras reunidas各卷。','塞尔希奥·皮托尔创作《花卉节》（Juegos florales）。','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0917','V1-REL-0605','WCD10-B11-S202','SRC-0689','Sergio Pitol — Editorial Anagrama','实读2026-10-12：作者简介第62–64行区分五部小说、短篇集与Trilogía de la Memoria；第63行说明El viaje、El mago de Viena属于跨文类记忆三部曲；第62行将El tañido/Juegos列为小说，所列1986/1985与CVC的原书目年份不同。','塞尔希奥·皮托尔创作《花卉节》（Juegos florales）。','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0918','V1-REL-0606','WCD10-B11-S201','SRC-0201','CVC. Sergio Pitol. Bibliografía','实读2026-10-12：Narrativa第7、11、13、24、28、30项列 El tañido de una flauta (1972)、Juegos florales (1982)、Vals de Mefisto (1984)、El viaje (2000)、El mago de Viena (2005)、Trilogía de la memoria (2007)；第51–57行列 Obras reunidas各卷。','塞尔希奥·皮托尔创作《旅程》（El viaje）。','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0919','V1-REL-0606','WCD10-B11-S202','SRC-0689','Sergio Pitol — Editorial Anagrama','实读2026-10-12：作者简介第62–64行区分五部小说、短篇集与Trilogía de la Memoria；第63行说明El viaje、El mago de Viena属于跨文类记忆三部曲；第62行将El tañido/Juegos列为小说，所列1986/1985与CVC的原书目年份不同。','塞尔希奥·皮托尔创作《旅程》（El viaje）。','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0920','V1-REL-0607','WCD10-B11-S201','SRC-0201','CVC. Sergio Pitol. Bibliografía','实读2026-10-12：Narrativa第7、11、13、24、28、30项列 El tañido de una flauta (1972)、Juegos florales (1982)、Vals de Mefisto (1984)、El viaje (2000)、El mago de Viena (2005)、Trilogía de la memoria (2007)；第51–57行列 Obras reunidas各卷。','塞尔希奥·皮托尔创作《维也纳魔法师》（El mago de Viena）。','high','eligible_evidence','WCD-10-B11'),
('V1-EV-0921','V1-REL-0607','WCD10-B11-S202','SRC-0689','Sergio Pitol — Editorial Anagrama','实读2026-10-12：作者简介第62–64行区分五部小说、短篇集与Trilogía de la Memoria；第63行说明El viaje、El mago de Viena属于跨文类记忆三部曲；第62行将El tañido/Juegos列为小说，所列1986/1985与CVC的原书目年份不同。','塞尔希奥·皮托尔创作《维也纳魔法师》（El mago de Viena）。','high','eligible_evidence','WCD-10-B11');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0399','WCD-10-B11-G01','research_gap','benedetti.primavera-con-una-esquina-rota.first_publication_year','open','已实读基金会1973-1983作品页，仅列作品及流亡期间创作背景，未提供1982首版年份；保留原有体裁、受限简介和非空书目注记，待有直接年份来源时再补。','','Independent Reviewer: preserve preserve year as research_gap; DEC-070 permits nonempty bibliographic_note without atomic year','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0400','WCD-10-B11-G02','research_gap','arguedas.rasu_niti.first_publication_year','open','BNP目录显示1962版，Casa馆藏Populibros记录标作[1964?]；单一首发值未定。','','Independent Reviewer: preserve bibliographic note records both observed versions; atomic year blank','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0401','WCD-10-B11-G03','research_gap','pitol.vals-de-mefisto.nocturno-de-bujara.identity-version','open','Anagrama称Vals de Mefisto原题Nocturno de Bujara；CVC却分别列1981年Nocturno与1984年Vals。为避免把重题/改版关系误当两件作品或未经审定合并，本轮不新建第二对象，交父审核决定是否作为一个作品对象及版本注记处理。','','Independent Reviewer: preserve preserve as catalog_only and research_gap; do not create duplicate work pending identity/version reconciliation','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0402','WCD-10-B11:V1-ENT-0245','research_gap','WCD10:work_level_research:V1-ENT-0245','open','该行仅补充基金会直接书目/作品介绍；学术研究深度未作完整性判断。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0403','WCD-10-B11:V1-ENT-0246','research_gap','WCD10:work_level_research:V1-ENT-0246','open','该行仅补充基金会直接书目/作品介绍；学术研究深度未作完整性判断。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0404','WCD-10-B11:V1-ENT-0247','research_gap','WCD10:work_level_research:V1-ENT-0247','open','该行仅补充基金会直接书目/作品介绍；学术研究深度未作完整性判断。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0405','WCD-10-B11:WCD10-B11-W001','research_gap','WCD10:work_level_research:V1-ENT-0622','open','作品层学术研究尚未展开；本条仅记录直接书目/机构说明，不声称学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0406','WCD-10-B11:WCD10-B11-W002','research_gap','WCD10:work_level_research:V1-ENT-0623','open','作品层学术研究尚未展开；本条仅记录直接书目/机构说明，不声称学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0407','WCD-10-B11:WCD10-B11-W003','research_gap','WCD10:work_level_research:V1-ENT-0624','open','作品层学术研究尚未展开；本条仅记录直接书目/机构说明，不声称学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0408','WCD-10-B11:WCD10-B11-W004','research_gap','WCD10:work_level_research:V1-ENT-0625','open','作品层学术研究尚未展开；本条仅记录直接书目/机构说明，不声称学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0409','WCD-10-B11:WCD10-B11-W005','research_gap','WCD10:work_level_research:V1-ENT-0626','open','作品层学术研究尚未展开；本条仅记录直接书目/机构说明，不声称学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0410','WCD-10-B11:WCD10-B11-W006','research_gap','WCD10:work_level_research:V1-ENT-0627','open','作品层学术研究尚未展开；本条仅记录直接书目/机构说明，不声称学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0411','WCD-10-B11:WCD10-B11-W007','research_gap','WCD10:work_level_research:V1-ENT-0628','open','作品层学术研究尚未展开；本条仅记录直接书目/机构说明，不声称学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0412','WCD-10-B11:WCD10-B11-W101','research_gap','WCD10:work_level_research:V1-ENT-0629','open','只据已打开机构书目/馆藏记录确认题名、版本及有界简介；不表示版本谱系或作品阐释已穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0413','WCD-10-B11:WCD10-B11-W102','research_gap','WCD10:work_level_research:V1-ENT-0630','open','只据已打开机构书目/馆藏记录确认题名、版本及有界简介；不表示版本谱系或作品阐释已穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0414','WCD-10-B11:WCD10-B11-W103','research_gap','WCD10:work_level_research:V1-ENT-0631','open','只据已打开机构书目/馆藏记录确认题名、版本及有界简介；不表示版本谱系或作品阐释已穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0415','WCD-10-B11:WCD10-B11-W104','research_gap','WCD10:work_level_research:V1-ENT-0632','open','只据已打开机构书目/馆藏记录确认题名、版本及有界简介；不表示版本谱系或作品阐释已穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0416','WCD-10-B11:WCD10-B11-W105','research_gap','WCD10:work_level_research:V1-ENT-0633','open','只据已打开机构书目/馆藏记录确认题名、版本及有界简介；不表示版本谱系或作品阐释已穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0417','WCD-10-B11:WCD10-B11-W106','research_gap','WCD10:work_level_research:V1-ENT-0634','open','只据已打开机构书目/馆藏记录确认题名、版本及有界简介；不表示版本谱系或作品阐释已穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0418','WCD-10-B11:V1-ENT-0254','research_gap','WCD10:work_level_research:V1-ENT-0254','open','本行是旧对象来源闭包快照，不声称补足对象级研究。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0419','WCD-10-B11:V1-ENT-0255','research_gap','WCD10:work_level_research:V1-ENT-0255','open','本行是旧对象来源闭包快照，不声称补足对象级研究。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0420','WCD-10-B11:V1-ENT-0256','research_gap','WCD10:work_level_research:V1-ENT-0256','open','本行是旧对象来源闭包快照，不声称补足对象级研究。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0421','WCD-10-B11:V1-ENT-0375','research_gap','WCD10:work_level_research:V1-ENT-0375','open','本行是旧对象来源闭包快照，不声称补足对象级研究。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0422','WCD-10-B11:WCD10-B11-W201','research_gap','WCD10:work_level_research:V1-ENT-0635','open','本条限于可直接核验的书目和简短文类/内容描述；作品专门研究不在本次范围。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0423','WCD-10-B11:WCD10-B11-W202','research_gap','WCD10:work_level_research:V1-ENT-0636','open','本条限于可直接核验的书目和简短文类/内容描述；作品专门研究不在本次范围。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0424','WCD-10-B11:WCD10-B11-W203','research_gap','WCD10:work_level_research:V1-ENT-0637','open','本条限于可直接核验的书目和简短文类/内容描述；作品专门研究不在本次范围。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0425','WCD-10-B11:WCD10-B11-W204','research_gap','WCD10:work_level_research:V1-ENT-0638','open','本条限于可直接核验的书目和简短文类/内容描述；作品专门研究不在本次范围。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');

UPDATE metadata SET value='WCD-10-B11' WHERE key='last_change_set';

UPDATE metadata SET value='2026-10-12' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 688 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 636 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 634 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 608 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2069 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 2524 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2048 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1268 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 605 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 950 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 921 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 425 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
