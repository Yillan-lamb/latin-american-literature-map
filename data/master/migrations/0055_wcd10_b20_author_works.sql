-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: Codex-parent-independent-review

-- Registration sha256: 1801cd01b03f09c1299b879762e3b4d8868a449bcc29f1d52bec300f1a8c5d60

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2589 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1550 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 793 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 777 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 775 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 3233 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2610 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 656 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 54 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 1135 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 1164 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 749 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 781 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B19' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0784' OR canonical_url='https://www.cristinaperirossi.es/novela.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0785' OR canonical_url='https://cvc.cervantes.es/el_rinconete/anteriores/enero_09/19012009_02.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0786' OR canonical_url='https://www.cristinaperirossi.es/web/?p=1066') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0787' OR canonical_url='https://www.cristinaperirossi.es/web/?p=522') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0788' OR canonical_url='https://www.cristinaperirossi.es/web/?page_id=142') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0789' OR canonical_url='https://www.academia.org.br/academicos/lygia-fagundes-telles/biografia') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0790' OR canonical_url='https://biblioteca.casadelacultura.gob.ec/bib/19710') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0791' OR canonical_url='https://repositorio.flacsoandes.edu.ec/bitstream/10469/10899/9/CCE-Revista-V3-N6-1948.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0792' OR canonical_url='https://biblioteca.casadelacultura.gob.ec/bib/61288') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0793' OR canonical_url='https://biblioteca.casadelacultura.gob.ec/bib/19713') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0780' OR (entity_type='work' AND original_name='El libro de mis primos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0781' OR (entity_type='work' AND original_name='La nave de los locos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0782' OR (entity_type='work' AND original_name='Verão no aquário')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0783' OR (entity_type='collection' AND original_name='Seminário dos ratos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0784' OR (entity_type='collection' AND original_name='A disciplina do amor')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0785' OR (entity_type='work' AND original_name='As horas nuas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0786' OR (entity_type='collection' AND original_name='A noite escura e mais eu')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0787' OR (entity_type='collection' AND original_name='Invenção e memória')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0788' OR (entity_type='collection' AND original_name='Barro de la sierra')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0789' OR (entity_type='work' AND original_name='Huairapamushcas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2617' OR (subject_id='V1-ENT-0780' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2618' OR (subject_id='V1-ENT-0780' AND fact_field='first_publication_year' AND value_text='1969')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2619' OR (subject_id='V1-ENT-0780' AND fact_field='one_sentence_summary' AND value_text='小说通过一个家族中多位表兄弟的声音，写传统家族秩序的衰落与城市游击运动的出现；年幼的Oliverio带领读者看见家庭关系、表象与欲望的变化。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2620' OR (subject_id='V1-ENT-0781' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2621' OR (subject_id='V1-ENT-0781' AND fact_field='first_publication_year' AND value_text='1984')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2622' OR (subject_id='V1-ENT-0781' AND fact_field='one_sentence_summary' AND value_text='围绕Equis的流亡旅行展开，小说以短章、插入文本和多重声音串联旅途片段，并借这些经历呈现流离失所与身份漂移。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2623' OR (subject_id='V1-ENT-0782' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2624' OR (subject_id='V1-ENT-0782' AND fact_field='first_publication_year' AND value_text='1963')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2625' OR (subject_id='V1-ENT-0782' AND fact_field='one_sentence_summary' AND value_text='ABL传记称其为第二部长篇小说，1963年出版；书目页列“romance”。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2626' OR (subject_id='V1-ENT-0782' AND fact_field='bibliographic_note' AND value_text='ABL书目页列示年份1963；保留其书目口径。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2627' OR (subject_id='V1-ENT-0783' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2628' OR (subject_id='V1-ENT-0783' AND fact_field='first_publication_year' AND value_text='1977')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2629' OR (subject_id='V1-ENT-0783' AND fact_field='one_sentence_summary' AND value_text='ABL传记称该书于1977年出版并获PEN Clube奖；书目页列“contos”。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2630' OR (subject_id='V1-ENT-0783' AND fact_field='bibliographic_note' AND value_text='ABL书目页列示年份1977；保留其书目口径。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2631' OR (subject_id='V1-ENT-0784' AND fact_field='genre_or_form' AND value_text='虚构与回忆文集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2632' OR (subject_id='V1-ENT-0784' AND fact_field='first_publication_year' AND value_text='1980')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2633' OR (subject_id='V1-ENT-0784' AND fact_field='one_sentence_summary' AND value_text='ABL书目页将其列为ficção e memória，1980；传记记载该书获奖。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2634' OR (subject_id='V1-ENT-0784' AND fact_field='bibliographic_note' AND value_text='ABL书目页列示年份1980；保留其书目口径。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2635' OR (subject_id='V1-ENT-0785' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2636' OR (subject_id='V1-ENT-0785' AND fact_field='first_publication_year' AND value_text='1989')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2637' OR (subject_id='V1-ENT-0785' AND fact_field='one_sentence_summary' AND value_text='ABL书目页列为romance，1989；传记称其获年度最佳图书奖。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2638' OR (subject_id='V1-ENT-0785' AND fact_field='bibliographic_note' AND value_text='ABL书目页列示年份1989；保留其书目口径。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2639' OR (subject_id='V1-ENT-0786' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2640' OR (subject_id='V1-ENT-0786' AND fact_field='first_publication_year' AND value_text='1995')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2641' OR (subject_id='V1-ENT-0786' AND fact_field='one_sentence_summary' AND value_text='ABL书目页列为contos，1995；传记说明其获国家图书馆奖等。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2642' OR (subject_id='V1-ENT-0786' AND fact_field='bibliographic_note' AND value_text='ABL书目页列示年份1995；保留其书目口径。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2643' OR (subject_id='V1-ENT-0787' AND fact_field='genre_or_form' AND value_text='虚构与回忆文集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2644' OR (subject_id='V1-ENT-0787' AND fact_field='first_publication_year' AND value_text='2000')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2645' OR (subject_id='V1-ENT-0787' AND fact_field='one_sentence_summary' AND value_text='ABL书目页列为ficção e memória，2000；传记称该书获Jabuti、APCA等奖。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2646' OR (subject_id='V1-ENT-0787' AND fact_field='bibliographic_note' AND value_text='ABL书目页列示年份2000；保留其书目口径。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2647' OR (subject_id='V1-ENT-0788' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2648' OR (subject_id='V1-ENT-0788' AND fact_field='first_publication_year' AND value_text='1933')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2649' OR (subject_id='V1-ENT-0788' AND fact_field='one_sentence_summary' AND value_text='1948年评论文章称本书收录五篇故事，并以《Cachorros》《Sed》《Éxodo》等篇目讨论儿童成长、印第安村庄的困境与社会压迫。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2650' OR (subject_id='V1-ENT-0789' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2651' OR (subject_id='V1-ENT-0789' AND fact_field='first_publication_year' AND value_text='1948')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2652' OR (subject_id='V1-ENT-0789' AND fact_field='one_sentence_summary' AND value_text='Casa de la Cultura目录将其著录为小说，并列出《La longa Juana》《Yatunyura y Guagraloma》《Huairapamushcas》等内容单元。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2653' OR (subject_id='V1-ENT-0353' AND fact_field='one_sentence_summary' AND value_text='这部短篇集围绕意外而强烈的诱惑展开，故事置于当代城市生活，呈现孤独者之间短暂相遇留下的痕迹。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2654' OR (subject_id='V1-ENT-0354' AND fact_field='bibliographic_note' AND value_text='作者官网所列版次包括Planeta 1976版、Plaza & Janés 1984版和TROPO 2008版；此处补充版次书目信息，保留基线1976原子年份及其原来源SRC-0268。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2655' OR (subject_id='V1-ENT-0355' AND fact_field='one_sentence_summary' AND value_text='作者在官网回顾，海难是她着迷的诗歌与绘画隐喻，因此将一本早期诗集命名为《Descripción de un naufragio》。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2656' OR (subject_id='V1-ENT-0361' AND fact_field='one_sentence_summary' AND value_text='ABL传记称《Ciranda de pedra》（1954）是作者达到文学成熟的作品，并被作者视作其全集创作的起点。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2657' OR (subject_id='V1-ENT-0362' AND fact_field='one_sentence_summary' AND value_text='ABL传记记载，同名短篇集于1970年出版，书中标题篇曾获法国国际女性作家比赛首奖。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2658' OR (subject_id='V1-ENT-0363' AND fact_field='one_sentence_summary' AND value_text='ABL传记称《As meninas》（1973）为小说，获Jabuti、ABL Coelho Neto及APCA小说奖。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2659' OR (subject_id='V1-ENT-0364' AND fact_field='one_sentence_summary' AND value_text='Casa de la Cultura馆藏简介称，小说围绕庄园主Alfonso Pereira与印第安农民Andrés Chiliquinga展开，写到安第斯地区的剥削、土地丧失及反抗。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2660' OR (subject_id='V1-ENT-0365' AND fact_field='one_sentence_summary' AND value_text='1948年评论文章将《En las calles》描述为写印第安人离开村庄、试图适应城市生活的小说，并讨论乡村人口迁移与社会阶层处境。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2661' OR (subject_id='V1-ENT-0366' AND fact_field='one_sentence_summary' AND value_text='Casa de la Cultura馆藏书目摘录以街区、街道与酒馆为故事场景，并将主人公描述为难以归入单一社会阶层的人物。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0752' OR (subject_id='V1-ENT-0346' AND relation_type='CREATED' AND object_id='V1-ENT-0780')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0753' OR (subject_id='V1-ENT-0346' AND relation_type='CREATED' AND object_id='V1-ENT-0781')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0754' OR (subject_id='V1-ENT-0358' AND relation_type='CREATED' AND object_id='V1-ENT-0782')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0755' OR (subject_id='V1-ENT-0358' AND relation_type='CREATED' AND object_id='V1-ENT-0783')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0756' OR (subject_id='V1-ENT-0358' AND relation_type='CREATED' AND object_id='V1-ENT-0784')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0757' OR (subject_id='V1-ENT-0358' AND relation_type='CREATED' AND object_id='V1-ENT-0785')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0758' OR (subject_id='V1-ENT-0358' AND relation_type='CREATED' AND object_id='V1-ENT-0786')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0759' OR (subject_id='V1-ENT-0358' AND relation_type='CREATED' AND object_id='V1-ENT-0787')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0760' OR (subject_id='V1-ENT-0359' AND relation_type='CREATED' AND object_id='V1-ENT-0788')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0761' OR (subject_id='V1-ENT-0359' AND relation_type='CREATED' AND object_id='V1-ENT-0789')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0784','WCD10-B20-S001','Cristina Peri Rossi - Novela','Cristina Peri Rossi - Novela','Cristina Peri Rossi','','Sitio Oficial de Cristina Peri Rossi','','','author_official_website','','es','B','access_pass','WCD-10-B20','仅Research候选，未经独立审核及Curation准入不得公开。；仅Research候选；未经独立审核不得自动进入Curation或公开层。；Research候选；未经独立审核不得自动进入Curation或公开层；作品简介限于来源直接支持的普通书目描述。','remote_only；未下载、保存网页或作品文件。；remote_only；未下载或保存网页或作品文件。；remote_only；未下载或保存网页、PDF、图书正文或图像。','','https://www.cristinaperirossi.es/novela.htm'),
('SRC-0785','WCD10-B20-S002','Libros clave de la narrativa uruguaya (XIV). La nave de los locos','Libros clave de la narrativa uruguaya (XIV). La nave de los locos','Reina Roffé','','Instituto Cervantes','2009','','cultural_institution_commentary','','es','B','access_pass','WCD-10-B20','仅Research候选，未经独立审核及Curation准入不得公开。；仅Research候选；未经独立审核不得自动进入Curation或公开层。；Research候选；未经独立审核不得自动进入Curation或公开层；作品简介限于来源直接支持的普通书目描述。','remote_only；未下载、保存网页或作品文件。；remote_only；未下载或保存网页或作品文件。；remote_only；未下载或保存网页、PDF、图书正文或图像。','','https://cvc.cervantes.es/el_rinconete/anteriores/enero_09/19012009_02.htm'),
('SRC-0786','WCD10-B20-S003','Los amores equivocados','Los amores equivocados','Cristina Peri Rossi','','Sitio Oficial de Cristina Peri Rossi','2015','','author_official_website','','es','B','access_pass','WCD-10-B20','仅Research候选，未经独立审核及Curation准入不得公开。；仅Research候选；未经独立审核不得自动进入Curation或公开层。；Research候选；未经独立审核不得自动进入Curation或公开层；作品简介限于来源直接支持的普通书目描述。','remote_only；未下载、保存网页或作品文件。；remote_only；未下载或保存网页或作品文件。；remote_only；未下载或保存网页、PDF、图书正文或图像。','','https://www.cristinaperirossi.es/web/?p=1066'),
('SRC-0787','WCD10-B20-S004','La Tarde del Dinosaurio','La Tarde del Dinosaurio','Cristina Peri Rossi','','Sitio Oficial de Cristina Peri Rossi','','','author_official_website','','es','B','access_pass','WCD-10-B20','仅Research候选，未经独立审核及Curation准入不得公开。；仅Research候选；未经独立审核不得自动进入Curation或公开层。；Research候选；未经独立审核不得自动进入Curation或公开层；作品简介限于来源直接支持的普通书目描述。','remote_only；未下载、保存网页或作品文件。；remote_only；未下载或保存网页或作品文件。；remote_only；未下载或保存网页、PDF、图书正文或图像。','','https://www.cristinaperirossi.es/web/?p=522'),
('SRC-0788','WCD10-B20-S005','Barcos','Barcos','Cristina Peri Rossi','','Sitio Oficial de Cristina Peri Rossi','','','author_statement_webpage','','es','B','access_pass','WCD-10-B20','仅Research候选，未经独立审核及Curation准入不得公开。；仅Research候选；未经独立审核不得自动进入Curation或公开层。；Research候选；未经独立审核不得自动进入Curation或公开层；作品简介限于来源直接支持的普通书目描述。','remote_only；未下载、保存网页或作品文件。；remote_only；未下载或保存网页或作品文件。；remote_only；未下载或保存网页、PDF、图书正文或图像。','','https://www.cristinaperirossi.es/web/?page_id=142'),
('SRC-0789','WCD10-B20-S102','Lygia Fagundes Telles | Academia Brasileira de Letras — Biografia','Lygia Fagundes Telles | Academia Brasileira de Letras — Biografia','Academia Brasileira de Letras','','Academia Brasileira de Letras','','','web_page','','pt','B','access_pass','WCD-10-B20','仅Research候选，未经独立审核及Curation准入不得公开。；仅Research候选；未经独立审核不得自动进入Curation或公开层。；Research候选；未经独立审核不得自动进入Curation或公开层；作品简介限于来源直接支持的普通书目描述。','remote_only；未下载、保存网页或作品文件。；remote_only；未下载或保存网页或作品文件。；remote_only；未下载或保存网页、PDF、图书正文或图像。','','https://www.academia.org.br/academicos/lygia-fagundes-telles/biografia'),
('SRC-0790','WCD10-B20-S201','Huairapamushcas : novela','Huairapamushcas : novela','Biblioteca y Archivo de la Casa de la Cultura Ecuatoriana','','Casa de la Cultura Ecuatoriana','','','web_page','','es','B','access_pass','WCD-10-B20','仅Research候选，未经独立审核及Curation准入不得公开。；仅Research候选；未经独立审核不得自动进入Curation或公开层。；Research候选；未经独立审核不得自动进入Curation或公开层；作品简介限于来源直接支持的普通书目描述。','remote_only；未下载、保存网页或作品文件。；remote_only；未下载或保存网页或作品文件。；remote_only；未下载或保存网页、PDF、图书正文或图像。','','https://biblioteca.casadelacultura.gob.ec/bib/19710'),
('SRC-0791','WCD10-B20-S202','A través de las novelas de Jorge Icaza','A través de las novelas de Jorge Icaza','J. Eugene Garro','','Casa de la Cultura Ecuatoriana','1948','','pdf','','es','B','access_pass','WCD-10-B20','仅Research候选，未经独立审核及Curation准入不得公开。；仅Research候选；未经独立审核不得自动进入Curation或公开层。；Research候选；未经独立审核不得自动进入Curation或公开层；作品简介限于来源直接支持的普通书目描述。','remote_only；未下载、保存网页或作品文件。；remote_only；未下载或保存网页或作品文件。；remote_only；未下载或保存网页、PDF、图书正文或图像。','','https://repositorio.flacsoandes.edu.ec/bitstream/10469/10899/9/CCE-Revista-V3-N6-1948.pdf'),
('SRC-0792','WCD10-B20-S203','Huasipungo','Huasipungo','Biblioteca y Archivo de la Casa de la Cultura Ecuatoriana','','Casa de la Cultura Ecuatoriana','','','web_page','','es','B','access_pass','WCD-10-B20','仅Research候选，未经独立审核及Curation准入不得公开。；仅Research候选；未经独立审核不得自动进入Curation或公开层。；Research候选；未经独立审核不得自动进入Curation或公开层；作品简介限于来源直接支持的普通书目描述。','remote_only；未下载、保存网页或作品文件。；remote_only；未下载或保存网页或作品文件。；remote_only；未下载或保存网页、PDF、图书正文或图像。','','https://biblioteca.casadelacultura.gob.ec/bib/61288'),
('SRC-0793','WCD10-B20-S204','El chulla Romero y Flores','El chulla Romero y Flores','Biblioteca y Archivo de la Casa de la Cultura Ecuatoriana','','Casa de la Cultura Ecuatoriana','','','web_page','','es','B','access_pass','WCD-10-B20','仅Research候选，未经独立审核及Curation准入不得公开。；仅Research候选；未经独立审核不得自动进入Curation或公开层。；Research候选；未经独立审核不得自动进入Curation或公开层；作品简介限于来源直接支持的普通书目描述。','remote_only；未下载、保存网页或作品文件。；remote_only；未下载或保存网页或作品文件。；remote_only；未下载或保存网页、PDF、图书正文或图像。','','https://biblioteca.casadelacultura.gob.ec/bib/19713');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0780','work','《我的表兄弟们》（暂译）','El libro de mis primos','candidate','1','WCD10-B20-W001','作者官网的小说页提供多声部家族小说简介；Instituto Cervantes生平与作品年表分别支持作者身份、首部小说属性及1969年作品年份。; 中文仅作检索用工作译名，保留西班牙语原题作为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0781','work','《愚人之船》（暂译）','La nave de los locos','candidate','1','WCD10-B20-W002','Instituto Cervantes年表将作品列作1984年小说；其文化中心评论直接讨论Equis的流亡旅程、作品的片段式多声叙事和《创世挂毯》线索。; 中文仅作检索用工作译名，保留西班牙语原题作为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0782','work','《水族馆之夏》（暂译）','Verão no aquário','candidate','1','WCD10-B20-W101','Academia Brasileira de Letras直接书目及传记列出该作、年份、体裁或简要信息；只补有依据的普通书目和有限简介，不声称全集或学术覆盖。; 中文题名仅为检索用暂译；原文题名为身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0783','collection','《老鼠研讨会》（暂译）','Seminário dos ratos','candidate','1','WCD10-B20-W102','Academia Brasileira de Letras直接书目及传记列出该作、年份、体裁或简要信息；只补有依据的普通书目和有限简介，不声称全集或学术覆盖。; 中文题名仅为检索用暂译；原文题名为身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0784','collection','《爱的规训》（暂译）','A disciplina do amor','candidate','1','WCD10-B20-W103','Academia Brasileira de Letras直接书目及传记列出该作、年份、体裁或简要信息；只补有依据的普通书目和有限简介，不声称全集或学术覆盖。; 中文题名仅为检索用暂译；原文题名为身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0785','work','《裸露的时光》（暂译）','As horas nuas','candidate','1','WCD10-B20-W104','Academia Brasileira de Letras直接书目及传记列出该作、年份、体裁或简要信息；只补有依据的普通书目和有限简介，不声称全集或学术覆盖。; 中文题名仅为检索用暂译；原文题名为身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0786','collection','《黑夜与我》（暂译）','A noite escura e mais eu','candidate','1','WCD10-B20-W105','Academia Brasileira de Letras直接书目及传记列出该作、年份、体裁或简要信息；只补有依据的普通书目和有限简介，不声称全集或学术覆盖。; 中文题名仅为检索用暂译；原文题名为身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0787','collection','《虚构与记忆》（暂译）','Invenção e memória','candidate','1','WCD10-B20-W106','Academia Brasileira de Letras直接书目及传记列出该作、年份、体裁或简要信息；只补有依据的普通书目和有限简介，不声称全集或学术覆盖。; 中文题名仅为检索用暂译；原文题名为身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0788','collection','《山间泥土》（暂译）','Barro de la sierra','candidate','1','WCD10-B20-W201','1948年Casa de la Cultura评论文章将该书列为Icaza的 cuentos 集，给出1933年书目年份并讨论其中故事；补录为合集，不拆分篇目。; 中文题名仅为检索用暂译；以西班牙语原题识别作品，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0789','work','《瓦伊拉帕穆什卡斯》（暂译）','Huairapamushcas','candidate','1','WCD10-B20-W202','厄瓜多尔Casa de la Cultura图书馆目录直接著录Icaza同名小说并列出1948年出版信息和内容单元。; 中文题名仅为检索用音译，原题用于唯一识别；不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0776','WCD10-B20-W001','WCD-10-B20','WCD10-B20-W001','V1-ENT-0780','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0777','WCD10-B20-W002','WCD-10-B20','WCD10-B20-W002','V1-ENT-0781','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0778','WCD10-B20-W101','WCD-10-B20','WCD10-B20-W101','V1-ENT-0782','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0779','WCD10-B20-W102','WCD-10-B20','WCD10-B20-W102','V1-ENT-0783','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0780','WCD10-B20-W103','WCD-10-B20','WCD10-B20-W103','V1-ENT-0784','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0781','WCD10-B20-W104','WCD-10-B20','WCD10-B20-W104','V1-ENT-0785','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0782','WCD10-B20-W105','WCD-10-B20','WCD10-B20-W105','V1-ENT-0786','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0783','WCD10-B20-W106','WCD-10-B20','WCD10-B20-W106','V1-ENT-0787','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0784','WCD10-B20-W201','WCD-10-B20','WCD10-B20-W201','V1-ENT-0788','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0785','WCD10-B20-W202','WCD-10-B20','WCD10-B20-W202','V1-ENT-0789','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0794','WCD-10-B20:V1-ENT-0780','V1-ENT-0780','work','《我的表兄弟们》（暂译）','克里斯蒂娜·佩里·罗西','El libro de mis primos','乌拉圭','es','1969','小说','WCD-10-B20','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《我的表兄弟们》（暂译）｜El libro de mis primos

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- first_publication_year：1969
- one_sentence_summary：小说通过一个家族中多位表兄弟的声音，写传统家族秩序的衰落与城市游击运动的出现；年幼的Oliverio带领读者看见家庭关系、表象与欲望的变化。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0795','WCD-10-B20:V1-ENT-0781','V1-ENT-0781','work','《愚人之船》（暂译）','克里斯蒂娜·佩里·罗西','La nave de los locos','乌拉圭','es','1984','小说','WCD-10-B20','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《愚人之船》（暂译）｜La nave de los locos

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- first_publication_year：1984
- one_sentence_summary：围绕Equis的流亡旅行展开，小说以短章、插入文本和多重声音串联旅途片段，并借这些经历呈现流离失所与身份漂移。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0796','WCD-10-B20:V1-ENT-0782','V1-ENT-0782','work','《水族馆之夏》（暂译）','莉吉娅·法贡德斯·特莱斯','Verão no aquário','巴西','pt','1963','小说','WCD-10-B20','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《水族馆之夏》（暂译）｜Verão no aquário

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- first_publication_year：1963
- one_sentence_summary：ABL传记称其为第二部长篇小说，1963年出版；书目页列“romance”。
- bibliographic_note：ABL书目页列示年份1963；保留其书目口径。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0797','WCD-10-B20:V1-ENT-0783','V1-ENT-0783','collection','《老鼠研讨会》（暂译）','莉吉娅·法贡德斯·特莱斯','Seminário dos ratos','巴西','pt','1977','短篇小说集','WCD-10-B20','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《老鼠研讨会》（暂译）｜Seminário dos ratos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- first_publication_year：1977
- one_sentence_summary：ABL传记称该书于1977年出版并获PEN Clube奖；书目页列“contos”。
- bibliographic_note：ABL书目页列示年份1977；保留其书目口径。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0798','WCD-10-B20:V1-ENT-0784','V1-ENT-0784','collection','《爱的规训》（暂译）','莉吉娅·法贡德斯·特莱斯','A disciplina do amor','巴西','pt','1980','虚构与回忆文集','WCD-10-B20','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《爱的规训》（暂译）｜A disciplina do amor

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：虚构与回忆文集
- first_publication_year：1980
- one_sentence_summary：ABL书目页将其列为ficção e memória，1980；传记记载该书获奖。
- bibliographic_note：ABL书目页列示年份1980；保留其书目口径。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0799','WCD-10-B20:V1-ENT-0785','V1-ENT-0785','work','《裸露的时光》（暂译）','莉吉娅·法贡德斯·特莱斯','As horas nuas','巴西','pt','1989','小说','WCD-10-B20','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《裸露的时光》（暂译）｜As horas nuas

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- first_publication_year：1989
- one_sentence_summary：ABL书目页列为romance，1989；传记称其获年度最佳图书奖。
- bibliographic_note：ABL书目页列示年份1989；保留其书目口径。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0800','WCD-10-B20:V1-ENT-0786','V1-ENT-0786','collection','《黑夜与我》（暂译）','莉吉娅·法贡德斯·特莱斯','A noite escura e mais eu','巴西','pt','1995','短篇小说集','WCD-10-B20','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《黑夜与我》（暂译）｜A noite escura e mais eu

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- first_publication_year：1995
- one_sentence_summary：ABL书目页列为contos，1995；传记说明其获国家图书馆奖等。
- bibliographic_note：ABL书目页列示年份1995；保留其书目口径。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0801','WCD-10-B20:V1-ENT-0787','V1-ENT-0787','collection','《虚构与记忆》（暂译）','莉吉娅·法贡德斯·特莱斯','Invenção e memória','巴西','pt','2000','虚构与回忆文集','WCD-10-B20','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《虚构与记忆》（暂译）｜Invenção e memória

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：虚构与回忆文集
- first_publication_year：2000
- one_sentence_summary：ABL书目页列为ficção e memória，2000；传记称该书获Jabuti、APCA等奖。
- bibliographic_note：ABL书目页列示年份2000；保留其书目口径。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0802','WCD-10-B20:V1-ENT-0788','V1-ENT-0788','collection','《山间泥土》（暂译）','豪尔赫·伊卡萨','Barro de la sierra','厄瓜多尔','es','1933','短篇小说集','WCD-10-B20','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《山间泥土》（暂译）｜Barro de la sierra

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- first_publication_year：1933
- one_sentence_summary：1948年评论文章称本书收录五篇故事，并以《Cachorros》《Sed》《Éxodo》等篇目讨论儿童成长、印第安村庄的困境与社会压迫。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0803','WCD-10-B20:V1-ENT-0789','V1-ENT-0789','work','《瓦伊拉帕穆什卡斯》（暂译）','豪尔赫·伊卡萨','Huairapamushcas','厄瓜多尔','es','1948','小说','WCD-10-B20','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《瓦伊拉帕穆什卡斯》（暂译）｜Huairapamushcas

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- first_publication_year：1948
- one_sentence_summary：Casa de la Cultura目录将其著录为小说，并列出《La longa Juana》《Yatunyura y Guagraloma》《Huairapamushcas》等内容单元。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0804','WCD-10-B20:V1-ENT-0353','V1-ENT-0353','collection','《错爱》','克里斯蒂娜·佩里·罗西','Los amores equivocados','乌拉圭','es','','','WCD-10-B20','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《错爱》｜Los amores equivocados

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：这部短篇集围绕意外而强烈的诱惑展开，故事置于当代城市生活，呈现孤独者之间短暂相遇留下的痕迹。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0805','WCD-10-B20:V1-ENT-0354','V1-ENT-0354','collection','《恐龙的下午》','克里斯蒂娜·佩里·罗西','La tarde del dinosaurio','乌拉圭','es','','','WCD-10-B20','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《恐龙的下午》｜La tarde del dinosaurio

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- bibliographic_note：作者官网所列版次包括Planeta 1976版、Plaza & Janés 1984版和TROPO 2008版；此处补充版次书目信息，保留基线1976原子年份及其原来源SRC-0268。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0806','WCD-10-B20:V1-ENT-0355','V1-ENT-0355','collection','《沉船记》','克里斯蒂娜·佩里·罗西','Descripción de un naufragio','乌拉圭','es','','','WCD-10-B20','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《沉船记》｜Descripción de un naufragio

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：作者在官网回顾，海难是她着迷的诗歌与绘画隐喻，因此将一本早期诗集命名为《Descripción de un naufragio》。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0807','WCD-10-B20:V1-ENT-0361','V1-ENT-0361','work','《石头圆舞》','莉吉娅·法贡德斯·特莱斯','Ciranda de pedra','巴西','pt','','','WCD-10-B20','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《石头圆舞》｜Ciranda de pedra

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：ABL传记称《Ciranda de pedra》（1954）是作者达到文学成熟的作品，并被作者视作其全集创作的起点。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0808','WCD-10-B20:V1-ENT-0362','V1-ENT-0362','collection','《绿色舞会之前》','莉吉娅·法贡德斯·特莱斯','Antes do baile verde','巴西','pt','','','WCD-10-B20','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《绿色舞会之前》｜Antes do baile verde

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：ABL传记记载，同名短篇集于1970年出版，书中标题篇曾获法国国际女性作家比赛首奖。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0809','WCD-10-B20:V1-ENT-0363','V1-ENT-0363','work','《姑娘们》','莉吉娅·法贡德斯·特莱斯','As meninas','巴西','pt','','','WCD-10-B20','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《姑娘们》｜As meninas

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：ABL传记称《As meninas》（1973）为小说，获Jabuti、ABL Coelho Neto及APCA小说奖。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0810','WCD-10-B20:V1-ENT-0364','V1-ENT-0364','work','《瓦西蓬戈》','豪尔赫·伊卡萨','Huasipungo','厄瓜多尔','es','','','WCD-10-B20','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《瓦西蓬戈》｜Huasipungo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：Casa de la Cultura馆藏简介称，小说围绕庄园主Alfonso Pereira与印第安农民Andrés Chiliquinga展开，写到安第斯地区的剥削、土地丧失及反抗。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0811','WCD-10-B20:V1-ENT-0365','V1-ENT-0365','work','《在街头》','豪尔赫·伊卡萨','En las calles','厄瓜多尔','es','','','WCD-10-B20','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《在街头》｜En las calles

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：1948年评论文章将《En las calles》描述为写印第安人离开村庄、试图适应城市生活的小说，并讨论乡村人口迁移与社会阶层处境。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0812','WCD-10-B20:V1-ENT-0366','V1-ENT-0366','work','《乔洛·罗梅罗与弗洛雷斯》','豪尔赫·伊卡萨','El chulla Romero y Flores','厄瓜多尔','es','','','WCD-10-B20','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《乔洛·罗梅罗与弗洛雷斯》｜El chulla Romero y Flores

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：Casa de la Cultura馆藏书目摘录以街区、街道与酒馆为故事场景，并将主人公描述为难以归入单一社会阶层的人物。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-2617','WCD10-B20-W001-F01','V1-CARD-0794','V1-ENT-0780','genre_or_form','小说','bibliographic','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2618','WCD10-B20-W001-F02','V1-CARD-0794','V1-ENT-0780','first_publication_year','1969','bibliographic','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2619','WCD10-B20-W001-F03','V1-CARD-0794','V1-ENT-0780','one_sentence_summary','小说通过一个家族中多位表兄弟的声音，写传统家族秩序的衰落与城市游击运动的出现；年幼的Oliverio带领读者看见家庭关系、表象与欲望的变化。','institutional_paraphrase','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2620','WCD10-B20-W002-F01','V1-CARD-0795','V1-ENT-0781','genre_or_form','小说','bibliographic','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2621','WCD10-B20-W002-F02','V1-CARD-0795','V1-ENT-0781','first_publication_year','1984','bibliographic','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2622','WCD10-B20-W002-F03','V1-CARD-0795','V1-ENT-0781','one_sentence_summary','围绕Equis的流亡旅行展开，小说以短章、插入文本和多重声音串联旅途片段，并借这些经历呈现流离失所与身份漂移。','institutional_paraphrase','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2623','WCD10-B20-W101-F01','V1-CARD-0796','V1-ENT-0782','genre_or_form','小说','bibliographic','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2624','WCD10-B20-W101-F02','V1-CARD-0796','V1-ENT-0782','first_publication_year','1963','bibliographic','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2625','WCD10-B20-W101-F03','V1-CARD-0796','V1-ENT-0782','one_sentence_summary','ABL传记称其为第二部长篇小说，1963年出版；书目页列“romance”。','institutional_paraphrase','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2626','WCD10-B20-W101-F04','V1-CARD-0796','V1-ENT-0782','bibliographic_note','ABL书目页列示年份1963；保留其书目口径。','bibliographic_note','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2627','WCD10-B20-W102-F01','V1-CARD-0797','V1-ENT-0783','genre_or_form','短篇小说集','bibliographic','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2628','WCD10-B20-W102-F02','V1-CARD-0797','V1-ENT-0783','first_publication_year','1977','bibliographic','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2629','WCD10-B20-W102-F03','V1-CARD-0797','V1-ENT-0783','one_sentence_summary','ABL传记称该书于1977年出版并获PEN Clube奖；书目页列“contos”。','institutional_paraphrase','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2630','WCD10-B20-W102-F04','V1-CARD-0797','V1-ENT-0783','bibliographic_note','ABL书目页列示年份1977；保留其书目口径。','bibliographic_note','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2631','WCD10-B20-W103-F01','V1-CARD-0798','V1-ENT-0784','genre_or_form','虚构与回忆文集','bibliographic','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2632','WCD10-B20-W103-F02','V1-CARD-0798','V1-ENT-0784','first_publication_year','1980','bibliographic','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2633','WCD10-B20-W103-F03','V1-CARD-0798','V1-ENT-0784','one_sentence_summary','ABL书目页将其列为ficção e memória，1980；传记记载该书获奖。','institutional_paraphrase','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2634','WCD10-B20-W103-F04','V1-CARD-0798','V1-ENT-0784','bibliographic_note','ABL书目页列示年份1980；保留其书目口径。','bibliographic_note','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2635','WCD10-B20-W104-F01','V1-CARD-0799','V1-ENT-0785','genre_or_form','小说','bibliographic','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2636','WCD10-B20-W104-F02','V1-CARD-0799','V1-ENT-0785','first_publication_year','1989','bibliographic','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2637','WCD10-B20-W104-F03','V1-CARD-0799','V1-ENT-0785','one_sentence_summary','ABL书目页列为romance，1989；传记称其获年度最佳图书奖。','institutional_paraphrase','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2638','WCD10-B20-W104-F04','V1-CARD-0799','V1-ENT-0785','bibliographic_note','ABL书目页列示年份1989；保留其书目口径。','bibliographic_note','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2639','WCD10-B20-W105-F01','V1-CARD-0800','V1-ENT-0786','genre_or_form','短篇小说集','bibliographic','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2640','WCD10-B20-W105-F02','V1-CARD-0800','V1-ENT-0786','first_publication_year','1995','bibliographic','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2641','WCD10-B20-W105-F03','V1-CARD-0800','V1-ENT-0786','one_sentence_summary','ABL书目页列为contos，1995；传记说明其获国家图书馆奖等。','institutional_paraphrase','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2642','WCD10-B20-W105-F04','V1-CARD-0800','V1-ENT-0786','bibliographic_note','ABL书目页列示年份1995；保留其书目口径。','bibliographic_note','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2643','WCD10-B20-W106-F01','V1-CARD-0801','V1-ENT-0787','genre_or_form','虚构与回忆文集','bibliographic','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2644','WCD10-B20-W106-F02','V1-CARD-0801','V1-ENT-0787','first_publication_year','2000','bibliographic','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2645','WCD10-B20-W106-F03','V1-CARD-0801','V1-ENT-0787','one_sentence_summary','ABL书目页列为ficção e memória，2000；传记称该书获Jabuti、APCA等奖。','institutional_paraphrase','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2646','WCD10-B20-W106-F04','V1-CARD-0801','V1-ENT-0787','bibliographic_note','ABL书目页列示年份2000；保留其书目口径。','bibliographic_note','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2647','WCD10-B20-W201-F01','V1-CARD-0802','V1-ENT-0788','genre_or_form','短篇小说集','bibliographic','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2648','WCD10-B20-W201-F02','V1-CARD-0802','V1-ENT-0788','first_publication_year','1933','bibliographic','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2649','WCD10-B20-W201-F03','V1-CARD-0802','V1-ENT-0788','one_sentence_summary','1948年评论文章称本书收录五篇故事，并以《Cachorros》《Sed》《Éxodo》等篇目讨论儿童成长、印第安村庄的困境与社会压迫。','institutional_paraphrase','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2650','WCD10-B20-W202-F01','V1-CARD-0803','V1-ENT-0789','genre_or_form','小说','bibliographic','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2651','WCD10-B20-W202-F02','V1-CARD-0803','V1-ENT-0789','first_publication_year','1948','bibliographic','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2652','WCD10-B20-W202-F03','V1-CARD-0803','V1-ENT-0789','one_sentence_summary','Casa de la Cultura目录将其著录为小说，并列出《La longa Juana》《Yatunyura y Guagraloma》《Huairapamushcas》等内容单元。','institutional_paraphrase','WCD-10-B20','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2653','WCD10-B20-F001','V1-CARD-0804','V1-ENT-0353','one_sentence_summary','这部短篇集围绕意外而强烈的诱惑展开，故事置于当代城市生活，呈现孤独者之间短暂相遇留下的痕迹。','institutional_paraphrase','WCD-10-B20','high','batch_retained_candidate','只补充作者官网直接描述的书目内容；保留已有first_publication_year=2015与genre_or_form=短篇小说集及其原始来源SRC-0268，不作替代或冲突修改。'),
('V1-FCT-2654','WCD10-B20-F002','V1-CARD-0805','V1-ENT-0354','bibliographic_note','作者官网所列版次包括Planeta 1976版、Plaza & Janés 1984版和TROPO 2008版；此处补充版次书目信息，保留基线1976原子年份及其原来源SRC-0268。','bibliographic_note','WCD-10-B20','high','batch_retained_candidate','仅增加官网明确列出的版本出版者/年份注记；不覆盖或改写原有first_publication_year=1976。'),
('V1-FCT-2655','WCD10-B20-F003','V1-CARD-0806','V1-ENT-0355','one_sentence_summary','作者在官网回顾，海难是她着迷的诗歌与绘画隐喻，因此将一本早期诗集命名为《Descripción de un naufragio》。','institutional_paraphrase','WCD-10-B20','high','batch_retained_candidate','按作者在官网的第一人称回顾记录为自述性诗集说明；不将其升级成独立学术结论，保留已有1975年份、诗集类别及其来源链。'),
('V1-FCT-2656','WCD10-B20-F181','V1-CARD-0807','V1-ENT-0361','one_sentence_summary','ABL传记称《Ciranda de pedra》（1954）是作者达到文学成熟的作品，并被作者视作其全集创作的起点。','institutional_paraphrase','WCD-10-B20','high','batch_retained_candidate','仅为冻结基线既有linked作品补充来源支持的限缩说明；保留原facts、完整卡片及其事实/来源连接、CREATED关系和关系证据及全部hold/gap。'),
('V1-FCT-2657','WCD10-B20-F182','V1-CARD-0808','V1-ENT-0362','one_sentence_summary','ABL传记记载，同名短篇集于1970年出版，书中标题篇曾获法国国际女性作家比赛首奖。','institutional_paraphrase','WCD-10-B20','high','batch_retained_candidate','仅为冻结基线既有linked作品补充来源支持的限缩说明；保留原facts、完整卡片及其事实/来源连接、CREATED关系和关系证据及全部hold/gap。'),
('V1-FCT-2658','WCD10-B20-F183','V1-CARD-0809','V1-ENT-0363','one_sentence_summary','ABL传记称《As meninas》（1973）为小说，获Jabuti、ABL Coelho Neto及APCA小说奖。','institutional_paraphrase','WCD-10-B20','high','batch_retained_candidate','仅为冻结基线既有linked作品补充来源支持的限缩说明；保留原facts、完整卡片及其事实/来源连接、CREATED关系和关系证据及全部hold/gap。'),
('V1-FCT-2659','WCD10-B20-F207','V1-CARD-0810','V1-ENT-0364','one_sentence_summary','Casa de la Cultura馆藏简介称，小说围绕庄园主Alfonso Pereira与印第安农民Andrés Chiliquinga展开，写到安第斯地区的剥削、土地丧失及反抗。','institutional_paraphrase','WCD-10-B20','high','batch_retained_candidate','仅追加该馆藏书目中的限缩简介；不改动基线既有首发年、体裁、卡片、CREATED关系及其来源闭包。'),
('V1-FCT-2660','WCD10-B20-F208','V1-CARD-0811','V1-ENT-0365','one_sentence_summary','1948年评论文章将《En las calles》描述为写印第安人离开村庄、试图适应城市生活的小说，并讨论乡村人口迁移与社会阶层处境。','institutional_paraphrase','WCD-10-B20','high','batch_retained_candidate','仅追加1948年评论文章直接支持的有界情节简介；保全基线原子年份及所有既有来源链。'),
('V1-FCT-2661','WCD10-B20-F209','V1-CARD-0812','V1-ENT-0366','one_sentence_summary','Casa de la Cultura馆藏书目摘录以街区、街道与酒馆为故事场景，并将主人公描述为难以归入单一社会阶层的人物。','institutional_paraphrase','WCD-10-B20','high','batch_retained_candidate','仅追加图书馆书目摘录的限缩释义；1958仅作该网页所列书目年份，不改动基线首发年、卡片、CREATED关系或来源链。');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-2617','SRC-0267','Cristina Peri Rossi. Biografía'),
('V1-FCT-2618','SRC-0268','Cristina Peri Rossi. Cronología de obras'),
('V1-FCT-2618','SRC-0267','Cristina Peri Rossi. Biografía'),
('V1-FCT-2619','SRC-0784','Cristina Peri Rossi - Novela'),
('V1-FCT-2620','SRC-0785','Libros clave de la narrativa uruguaya (XIV). La nave de los locos'),
('V1-FCT-2621','SRC-0785','Libros clave de la narrativa uruguaya (XIV). La nave de los locos'),
('V1-FCT-2621','SRC-0268','Cristina Peri Rossi. Cronología de obras'),
('V1-FCT-2622','SRC-0785','Libros clave de la narrativa uruguaya (XIV). La nave de los locos'),
('V1-FCT-2623','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2624','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2625','SRC-0789','Lygia Fagundes Telles | Academia Brasileira de Letras — Biografia'),
('V1-FCT-2626','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2627','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2628','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2629','SRC-0789','Lygia Fagundes Telles | Academia Brasileira de Letras — Biografia'),
('V1-FCT-2630','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2631','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2632','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2633','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2633','SRC-0789','Lygia Fagundes Telles | Academia Brasileira de Letras — Biografia'),
('V1-FCT-2634','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2635','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2636','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2637','SRC-0789','Lygia Fagundes Telles | Academia Brasileira de Letras — Biografia'),
('V1-FCT-2638','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2639','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2640','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2641','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2641','SRC-0789','Lygia Fagundes Telles | Academia Brasileira de Letras — Biografia'),
('V1-FCT-2642','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2643','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2644','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2645','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2645','SRC-0789','Lygia Fagundes Telles | Academia Brasileira de Letras — Biografia'),
('V1-FCT-2646','SRC-0271','Bibliografia | Lygia Fagundes Telles'),
('V1-FCT-2647','SRC-0791','A través de las novelas de Jorge Icaza'),
('V1-FCT-2648','SRC-0791','A través de las novelas de Jorge Icaza'),
('V1-FCT-2649','SRC-0791','A través de las novelas de Jorge Icaza'),
('V1-FCT-2650','SRC-0790','Huairapamushcas : novela'),
('V1-FCT-2651','SRC-0790','Huairapamushcas : novela'),
('V1-FCT-2652','SRC-0790','Huairapamushcas : novela'),
('V1-FCT-2653','SRC-0786','Los amores equivocados'),
('V1-FCT-2654','SRC-0787','La Tarde del Dinosaurio'),
('V1-FCT-2655','SRC-0788','Barcos'),
('V1-FCT-2656','SRC-0789','Lygia Fagundes Telles | Academia Brasileira de Letras — Biografia'),
('V1-FCT-2657','SRC-0789','Lygia Fagundes Telles | Academia Brasileira de Letras — Biografia'),
('V1-FCT-2658','SRC-0789','Lygia Fagundes Telles | Academia Brasileira de Letras — Biografia'),
('V1-FCT-2659','SRC-0792','Huasipungo'),
('V1-FCT-2660','SRC-0791','A través de las novelas de Jorge Icaza'),
('V1-FCT-2661','SRC-0793','El chulla Romero y Flores');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0794','V1-FCT-2617','batch_retained_candidate'),
('V1-CARD-0794','V1-FCT-2618','batch_retained_candidate'),
('V1-CARD-0794','V1-FCT-2619','batch_retained_candidate'),
('V1-CARD-0795','V1-FCT-2620','batch_retained_candidate'),
('V1-CARD-0795','V1-FCT-2621','batch_retained_candidate'),
('V1-CARD-0795','V1-FCT-2622','batch_retained_candidate'),
('V1-CARD-0796','V1-FCT-2623','batch_retained_candidate'),
('V1-CARD-0796','V1-FCT-2624','batch_retained_candidate'),
('V1-CARD-0796','V1-FCT-2625','batch_retained_candidate'),
('V1-CARD-0796','V1-FCT-2626','batch_retained_candidate'),
('V1-CARD-0797','V1-FCT-2627','batch_retained_candidate'),
('V1-CARD-0797','V1-FCT-2628','batch_retained_candidate'),
('V1-CARD-0797','V1-FCT-2629','batch_retained_candidate'),
('V1-CARD-0797','V1-FCT-2630','batch_retained_candidate'),
('V1-CARD-0798','V1-FCT-2631','batch_retained_candidate'),
('V1-CARD-0798','V1-FCT-2632','batch_retained_candidate'),
('V1-CARD-0798','V1-FCT-2633','batch_retained_candidate'),
('V1-CARD-0798','V1-FCT-2634','batch_retained_candidate'),
('V1-CARD-0799','V1-FCT-2635','batch_retained_candidate'),
('V1-CARD-0799','V1-FCT-2636','batch_retained_candidate'),
('V1-CARD-0799','V1-FCT-2637','batch_retained_candidate'),
('V1-CARD-0799','V1-FCT-2638','batch_retained_candidate'),
('V1-CARD-0800','V1-FCT-2639','batch_retained_candidate'),
('V1-CARD-0800','V1-FCT-2640','batch_retained_candidate'),
('V1-CARD-0800','V1-FCT-2641','batch_retained_candidate'),
('V1-CARD-0800','V1-FCT-2642','batch_retained_candidate'),
('V1-CARD-0801','V1-FCT-2643','batch_retained_candidate'),
('V1-CARD-0801','V1-FCT-2644','batch_retained_candidate'),
('V1-CARD-0801','V1-FCT-2645','batch_retained_candidate'),
('V1-CARD-0801','V1-FCT-2646','batch_retained_candidate'),
('V1-CARD-0802','V1-FCT-2647','batch_retained_candidate'),
('V1-CARD-0802','V1-FCT-2648','batch_retained_candidate'),
('V1-CARD-0802','V1-FCT-2649','batch_retained_candidate'),
('V1-CARD-0803','V1-FCT-2650','batch_retained_candidate'),
('V1-CARD-0803','V1-FCT-2651','batch_retained_candidate'),
('V1-CARD-0803','V1-FCT-2652','batch_retained_candidate'),
('V1-CARD-0804','V1-FCT-2653','batch_retained_candidate'),
('V1-CARD-0805','V1-FCT-2654','batch_retained_candidate'),
('V1-CARD-0806','V1-FCT-2655','batch_retained_candidate'),
('V1-CARD-0807','V1-FCT-2656','batch_retained_candidate'),
('V1-CARD-0808','V1-FCT-2657','batch_retained_candidate'),
('V1-CARD-0809','V1-FCT-2658','batch_retained_candidate'),
('V1-CARD-0810','V1-FCT-2659','batch_retained_candidate'),
('V1-CARD-0811','V1-FCT-2660','batch_retained_candidate'),
('V1-CARD-0812','V1-FCT-2661','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-1559','WCD10-B20-S001','V1-CARD-0794','SRC-0784','B','bibliography_or_bounded_description','no','no','SRC-0784','accepted','NONE'),
('V1-CS-1560','WCD10-B20-S006','V1-CARD-0794','SRC-0268','B','bibliography_or_bounded_description','yes','no','SRC-0268','accepted','NONE'),
('V1-CS-1561','WCD10-B20-S007','V1-CARD-0794','SRC-0267','B','bibliography_or_bounded_description','yes','no','SRC-0267','accepted','NONE'),
('V1-CS-1562','WCD10-B20-S002','V1-CARD-0795','SRC-0785','B','bibliography_or_bounded_description','yes','no','SRC-0785','accepted','NONE'),
('V1-CS-1563','WCD10-B20-S006','V1-CARD-0795','SRC-0268','B','bibliography_or_bounded_description','yes','no','SRC-0268','accepted','NONE'),
('V1-CS-1564','WCD10-B20-S101','V1-CARD-0796','SRC-0271','B','bibliography_or_bounded_description','yes','no','SRC-0271','accepted','NONE'),
('V1-CS-1565','WCD10-B20-S102','V1-CARD-0796','SRC-0789','B','bibliography_or_bounded_description','no','no','SRC-0789','accepted','NONE'),
('V1-CS-1566','WCD10-B20-S101','V1-CARD-0797','SRC-0271','B','bibliography_or_bounded_description','yes','no','SRC-0271','accepted','NONE'),
('V1-CS-1567','WCD10-B20-S102','V1-CARD-0797','SRC-0789','B','bibliography_or_bounded_description','no','no','SRC-0789','accepted','NONE'),
('V1-CS-1568','WCD10-B20-S101','V1-CARD-0798','SRC-0271','B','bibliography_or_bounded_description','yes','no','SRC-0271','accepted','NONE'),
('V1-CS-1569','WCD10-B20-S102','V1-CARD-0798','SRC-0789','B','bibliography_or_bounded_description','no','no','SRC-0789','accepted','NONE'),
('V1-CS-1570','WCD10-B20-S101','V1-CARD-0799','SRC-0271','B','bibliography_or_bounded_description','yes','no','SRC-0271','accepted','NONE'),
('V1-CS-1571','WCD10-B20-S102','V1-CARD-0799','SRC-0789','B','bibliography_or_bounded_description','no','no','SRC-0789','accepted','NONE'),
('V1-CS-1572','WCD10-B20-S101','V1-CARD-0800','SRC-0271','B','bibliography_or_bounded_description','yes','no','SRC-0271','accepted','NONE'),
('V1-CS-1573','WCD10-B20-S102','V1-CARD-0800','SRC-0789','B','bibliography_or_bounded_description','no','no','SRC-0789','accepted','NONE'),
('V1-CS-1574','WCD10-B20-S101','V1-CARD-0801','SRC-0271','B','bibliography_or_bounded_description','yes','no','SRC-0271','accepted','NONE'),
('V1-CS-1575','WCD10-B20-S102','V1-CARD-0801','SRC-0789','B','bibliography_or_bounded_description','no','no','SRC-0789','accepted','NONE'),
('V1-CS-1576','WCD10-B20-S202','V1-CARD-0802','SRC-0791','B','bibliography_or_bounded_description','yes','no','SRC-0791','accepted','NONE'),
('V1-CS-1577','WCD10-B20-S201','V1-CARD-0803','SRC-0790','B','bibliography_or_bounded_description','yes','no','SRC-0790','accepted','NONE'),
('V1-CS-1578','WCD10-B20-S003','V1-CARD-0804','SRC-0786','B','bibliography_or_bounded_description','no','no','SRC-0786','accepted','NONE'),
('V1-CS-1579','WCD10-B20-S004','V1-CARD-0805','SRC-0787','B','bibliography_or_bounded_description','yes','no','SRC-0787','accepted','NONE'),
('V1-CS-1580','WCD10-B20-S005','V1-CARD-0806','SRC-0788','B','bibliography_or_bounded_description','no','no','SRC-0788','accepted','NONE'),
('V1-CS-1581','WCD10-B20-S102','V1-CARD-0807','SRC-0789','B','bibliography_or_bounded_description','no','no','SRC-0789','accepted','NONE'),
('V1-CS-1582','WCD10-B20-S102','V1-CARD-0808','SRC-0789','B','bibliography_or_bounded_description','no','no','SRC-0789','accepted','NONE'),
('V1-CS-1583','WCD10-B20-S102','V1-CARD-0809','SRC-0789','B','bibliography_or_bounded_description','no','no','SRC-0789','accepted','NONE'),
('V1-CS-1584','WCD10-B20-S203','V1-CARD-0810','SRC-0792','B','bibliography_or_bounded_description','no','no','SRC-0792','accepted','NONE'),
('V1-CS-1585','WCD10-B20-S202','V1-CARD-0811','SRC-0791','B','bibliography_or_bounded_description','no','no','SRC-0791','accepted','NONE'),
('V1-CS-1586','WCD10-B20-S204','V1-CARD-0812','SRC-0793','B','bibliography_or_bounded_description','no','no','SRC-0793','accepted','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0752','WCD-10-B20','WCD10-B20-W001-CREATED','V1-ENT-0346','CREATED','V1-ENT-0780','克里斯蒂娜·佩里·罗西创作 El libro de mis primos','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0753','WCD-10-B20','WCD10-B20-W002-CREATED','V1-ENT-0346','CREATED','V1-ENT-0781','克里斯蒂娜·佩里·罗西创作 La nave de los locos','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0754','WCD-10-B20','WCD10-B20-W101-CREATED','V1-ENT-0358','CREATED','V1-ENT-0782','莉吉娅·法贡德斯·特莱斯创作 Verão no aquário','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0755','WCD-10-B20','WCD10-B20-W102-CREATED','V1-ENT-0358','CREATED','V1-ENT-0783','莉吉娅·法贡德斯·特莱斯创作 Seminário dos ratos','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0756','WCD-10-B20','WCD10-B20-W103-CREATED','V1-ENT-0358','CREATED','V1-ENT-0784','莉吉娅·法贡德斯·特莱斯创作 A disciplina do amor','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0757','WCD-10-B20','WCD10-B20-W104-CREATED','V1-ENT-0358','CREATED','V1-ENT-0785','莉吉娅·法贡德斯·特莱斯创作 As horas nuas','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0758','WCD-10-B20','WCD10-B20-W105-CREATED','V1-ENT-0358','CREATED','V1-ENT-0786','莉吉娅·法贡德斯·特莱斯创作 A noite escura e mais eu','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0759','WCD-10-B20','WCD10-B20-W106-CREATED','V1-ENT-0358','CREATED','V1-ENT-0787','莉吉娅·法贡德斯·特莱斯创作 Invenção e memória','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0760','WCD-10-B20','WCD10-B20-W201-CREATED','V1-ENT-0359','CREATED','V1-ENT-0788','豪尔赫·伊卡萨创作 Barro de la sierra','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0761','WCD-10-B20','WCD10-B20-W202-CREATED','V1-ENT-0359','CREATED','V1-ENT-0789','豪尔赫·伊卡萨创作 Huairapamushcas','high','accepted','Codex-parent-independent-review:PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0752','SRC-0784'),
('V1-REL-0752','SRC-0268'),
('V1-REL-0752','SRC-0267'),
('V1-REL-0753','SRC-0785'),
('V1-REL-0753','SRC-0268'),
('V1-REL-0754','SRC-0271'),
('V1-REL-0755','SRC-0271'),
('V1-REL-0756','SRC-0271'),
('V1-REL-0757','SRC-0271'),
('V1-REL-0758','SRC-0271'),
('V1-REL-0759','SRC-0271'),
('V1-REL-0760','SRC-0791'),
('V1-REL-0761','SRC-0790');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-1128','V1-REL-0752','WCD10-B20-S001','SRC-0784','Cristina Peri Rossi - Novela','实读2026-10-14，第1–4行列《El libro de mis primos》及Grijalbo 1989版本；第4行说明多位表兄弟的声音、家族衰落和城市游击运动，Oliverio的视角串起家庭关系与情欲变化。','克里斯蒂娜·佩里·罗西创作 El libro de mis primos','high','eligible_evidence','WCD-10-B20'),
('V1-EV-1129','V1-REL-0752','WCD10-B20-S006','SRC-0268','Cristina Peri Rossi. Cronología de obras','实读2026-10-14，Instituto Cervantes《Cronología de obras》第97–103行将《El libro de mis primos》列为1969年小说、《La nave de los locos》列为1984年小说；URL与冻结基线SRC-0268相同，整行复用。','克里斯蒂娜·佩里·罗西创作 El libro de mis primos','high','eligible_evidence','WCD-10-B20'),
('V1-EV-1130','V1-REL-0752','WCD10-B20-S007','SRC-0267','Cristina Peri Rossi. Biografía','实读2026-10-14，Instituto Cervantes《Biografía》第50行称《El libro de mis primos》(1969)为作者首部小说；URL与冻结基线SRC-0267相同，整行复用。','克里斯蒂娜·佩里·罗西创作 El libro de mis primos','high','eligible_evidence','WCD-10-B20'),
('V1-EV-1131','V1-REL-0753','WCD10-B20-S002','SRC-0785','Libros clave de la narrativa uruguaya (XIV). La nave de los locos','实读2026-10-14，第17–20行明载作品为1984年小说，描述Equis的流亡旅程、片段化多声叙事与流离失所经验，并说明作品围绕赫罗纳大教堂《创世挂毯》展开。','克里斯蒂娜·佩里·罗西创作 La nave de los locos','high','eligible_evidence','WCD-10-B20'),
('V1-EV-1132','V1-REL-0753','WCD10-B20-S006','SRC-0268','Cristina Peri Rossi. Cronología de obras','实读2026-10-14，Instituto Cervantes《Cronología de obras》第97–103行将《El libro de mis primos》列为1969年小说、《La nave de los locos》列为1984年小说；URL与冻结基线SRC-0268相同，整行复用。','克里斯蒂娜·佩里·罗西创作 La nave de los locos','high','eligible_evidence','WCD-10-B20'),
('V1-EV-1133','V1-REL-0754','WCD10-B20-S101','SRC-0271','Bibliografia | Lygia Fagundes Telles','2026-10-14实际打开。ABL书目页第7–36行列Rocco出版作品及体裁/年份；第112–125行列合作选集、合集参与篇目及其书目细节。已按原URL复用SRC-0271，不修改任何既有来源元数据。','莉吉娅·法贡德斯·特莱斯创作 Verão no aquário','high','eligible_evidence','WCD-10-B20'),
('V1-EV-1134','V1-REL-0755','WCD10-B20-S101','SRC-0271','Bibliografia | Lygia Fagundes Telles','2026-10-14实际打开。ABL书目页第7–36行列Rocco出版作品及体裁/年份；第112–125行列合作选集、合集参与篇目及其书目细节。已按原URL复用SRC-0271，不修改任何既有来源元数据。','莉吉娅·法贡德斯·特莱斯创作 Seminário dos ratos','high','eligible_evidence','WCD-10-B20'),
('V1-EV-1135','V1-REL-0756','WCD10-B20-S101','SRC-0271','Bibliografia | Lygia Fagundes Telles','2026-10-14实际打开。ABL书目页第7–36行列Rocco出版作品及体裁/年份；第112–125行列合作选集、合集参与篇目及其书目细节。已按原URL复用SRC-0271，不修改任何既有来源元数据。','莉吉娅·法贡德斯·特莱斯创作 A disciplina do amor','high','eligible_evidence','WCD-10-B20'),
('V1-EV-1136','V1-REL-0757','WCD10-B20-S101','SRC-0271','Bibliografia | Lygia Fagundes Telles','2026-10-14实际打开。ABL书目页第7–36行列Rocco出版作品及体裁/年份；第112–125行列合作选集、合集参与篇目及其书目细节。已按原URL复用SRC-0271，不修改任何既有来源元数据。','莉吉娅·法贡德斯·特莱斯创作 As horas nuas','high','eligible_evidence','WCD-10-B20'),
('V1-EV-1137','V1-REL-0758','WCD10-B20-S101','SRC-0271','Bibliografia | Lygia Fagundes Telles','2026-10-14实际打开。ABL书目页第7–36行列Rocco出版作品及体裁/年份；第112–125行列合作选集、合集参与篇目及其书目细节。已按原URL复用SRC-0271，不修改任何既有来源元数据。','莉吉娅·法贡德斯·特莱斯创作 A noite escura e mais eu','high','eligible_evidence','WCD-10-B20'),
('V1-EV-1138','V1-REL-0759','WCD10-B20-S101','SRC-0271','Bibliografia | Lygia Fagundes Telles','2026-10-14实际打开。ABL书目页第7–36行列Rocco出版作品及体裁/年份；第112–125行列合作选集、合集参与篇目及其书目细节。已按原URL复用SRC-0271，不修改任何既有来源元数据。','莉吉娅·法贡德斯·特莱斯创作 Invenção e memória','high','eligible_evidence','WCD-10-B20'),
('V1-EV-1139','V1-REL-0760','WCD10-B20-S202','SRC-0791','A través de las novelas de Jorge Icaza','2026-10-14实际打开PDF；印刷页148（网页PDF页148）列出《Barro de la sierra》(cuentos, 1933)、《Huasipungo》(1934)、《En las calles》(1935)、《Cholos》(1937)、《Media vida deslumbrados》(1942)；印刷页148–150讨论《Barro de la sierra》五篇故事及《Cachorros》《Sed》《Éxodo》等；印刷页158–159讨论《En las calles》及乡村移民至城市的情节。','豪尔赫·伊卡萨创作 Barro de la sierra','high','eligible_evidence','WCD-10-B20'),
('V1-EV-1140','V1-REL-0761','WCD10-B20-S201','SRC-0790','Huairapamushcas : novela','2026-10-14实际打开；第23-28行题名、Icaza署名、出版社及1948书目；第37-48行Novela ecuatoriana主题词及目录列出的叙事单元。','豪尔赫·伊卡萨创作 Huairapamushcas','high','eligible_evidence','WCD-10-B20');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0657','WCD-10-B20-G01','research_gap','V1-ENT-0346.full_oeuvre','open','本轮依据Instituto Cervantes年表、作者官网及Cervantes文化中心来源，补入两部主要小说，并更新三个既有linked works的有界书目描述；未穷尽其诗歌、散文、报刊文章、不同版次或全部作品，保持研究范围开放。','','Independent Reviewer: preserve preserve_as_research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0658','WCD-10-B20-G02','research_gap','WCD10:B20:Telles:bounded_uncovered_roster','open','本轮依据ABL机构书目补六项主要作品、为三项冻结linked作品增加有界说明；不声称全集完备，也未逐项核实所有书目与合作篇目。','','Independent Reviewer: preserve deferred_research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0659','WCD-10-B20-G03','research_gap','WCD10:B20:Icaza:uncovered_roster','open','本轮补入有直接书目及内容依据的《Barro de la sierra》《Huairapamushcas》，并为三项既有关联小说补有界简介；未将单篇、剧作、重版或研究文献目录当作必须穷尽的清单。','','Independent Reviewer: preserve deferred_research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0660','WCD-10-B20:V1-ENT-0353','research_gap','WCD10:work_level_research:V1-ENT-0353','open','只确认冻结基线事实/卡片/关系/来源链逐值保全；未重新评估原内容完整性或声称穷尽作品全集。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0661','WCD-10-B20:V1-ENT-0354','research_gap','WCD10:work_level_research:V1-ENT-0354','open','只确认冻结基线事实/卡片/关系/来源链逐值保全；未重新评估原内容完整性或声称穷尽作品全集。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0662','WCD-10-B20:V1-ENT-0355','research_gap','WCD10:work_level_research:V1-ENT-0355','open','只确认冻结基线事实/卡片/关系/来源链逐值保全；未重新评估原内容完整性或声称穷尽作品全集。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0663','WCD-10-B20:WCD10-B20-W001','research_gap','WCD10:work_level_research:V1-ENT-0780','open','普通书目与内容说明由直接来源支持；未声称作品全集或学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0664','WCD-10-B20:WCD10-B20-W002','research_gap','WCD10:work_level_research:V1-ENT-0781','open','普通书目与内容说明由直接来源支持；未声称作品全集或学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0665','WCD-10-B20:V1-ENT-0361','research_gap','WCD10:work_level_research:V1-ENT-0361','open','仅在冻结基线闭包上追加本批有界说明；未声称全集完备或学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0666','WCD-10-B20:V1-ENT-0362','research_gap','WCD10:work_level_research:V1-ENT-0362','open','仅在冻结基线闭包上追加本批有界说明；未声称全集完备或学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0667','WCD-10-B20:V1-ENT-0363','research_gap','WCD10:work_level_research:V1-ENT-0363','open','仅在冻结基线闭包上追加本批有界说明；未声称全集完备或学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0668','WCD-10-B20:WCD10-B20-W101','research_gap','WCD10:work_level_research:V1-ENT-0782','open','ABL书目及传记为直接机构依据；仅补普通书目与有界说明，不声称全集完备或学术研究覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0669','WCD-10-B20:WCD10-B20-W102','research_gap','WCD10:work_level_research:V1-ENT-0783','open','ABL书目及传记为直接机构依据；仅补普通书目与有界说明，不声称全集完备或学术研究覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0670','WCD-10-B20:WCD10-B20-W103','research_gap','WCD10:work_level_research:V1-ENT-0784','open','ABL书目及传记为直接机构依据；仅补普通书目与有界说明，不声称全集完备或学术研究覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0671','WCD-10-B20:WCD10-B20-W104','research_gap','WCD10:work_level_research:V1-ENT-0785','open','ABL书目及传记为直接机构依据；仅补普通书目与有界说明，不声称全集完备或学术研究覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0672','WCD-10-B20:WCD10-B20-W105','research_gap','WCD10:work_level_research:V1-ENT-0786','open','ABL书目及传记为直接机构依据；仅补普通书目与有界说明，不声称全集完备或学术研究覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0673','WCD-10-B20:WCD10-B20-W106','research_gap','WCD10:work_level_research:V1-ENT-0787','open','ABL书目及传记为直接机构依据；仅补普通书目与有界说明，不声称全集完备或学术研究覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0674','WCD-10-B20:V1-ENT-0364','research_gap','WCD10:work_level_research:V1-ENT-0364','open','仅对基线已有来源与卡片描述作快照；不宣称作者作品全集或学术覆盖完整。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0675','WCD-10-B20:V1-ENT-0365','research_gap','WCD10:work_level_research:V1-ENT-0365','open','仅对基线已有来源与卡片描述作快照；不宣称作者作品全集或学术覆盖完整。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0676','WCD-10-B20:V1-ENT-0366','research_gap','WCD10:work_level_research:V1-ENT-0366','open','仅对基线已有来源与卡片描述作快照；不宣称作者作品全集或学术覆盖完整。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0677','WCD-10-B20:WCD10-B20-W201','research_gap','WCD10:work_level_research:V1-ENT-0788','open','单一直接机构来源支持普通书目及有界说明；未声称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0678','WCD-10-B20:WCD10-B20-W202','research_gap','WCD10:work_level_research:V1-ENT-0789','open','单一直接机构来源支持普通书目及有界说明；未声称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');



-- Controlled B20 coauthor reentry; the reviewed attachment authorizes one role-limited append only.
INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM entities WHERE entity_id='V1-ENT-0358')=1 AND (SELECT COUNT(*) FROM entities WHERE entity_id='V1-ENT-0592')=1 THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE subject_id='V1-ENT-0358' AND relation_type='CREATED' AND object_id='V1-ENT-0592') THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0762') THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0638' AND canonical_url='https://sgpa.webhostusp.sti.usp.br/obra.php?cod=1165&s=grosa') THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0271' AND canonical_url='https://www.academia.org.br/academicos/lygia-fagundes-telles/bibliografia') THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationship_evidence WHERE evidence_id='WCD10-B20-R101-SRC-0638') THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationship_evidence WHERE evidence_id='WCD10-B20-R101-SRC-0271') THEN 1 ELSE 0 END);
INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0762','WCD-10-B20','WCD10-B20-R101','V1-ENT-0358','CREATED','V1-ENT-0592','作为《Os sete pecados capitais》的参与作者之一；此CREATED仅表示对集体作品的创作贡献，不表示独著。','high','accepted','Codex-parent-independent-review:PASS','2','NONE');
INSERT INTO relationship_sources (relationship_id,source_id) VALUES ('V1-REL-0762','SRC-0638'), ('V1-REL-0762','SRC-0271');
INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('WCD10-B20-R101-SRC-0638','V1-REL-0762','WCD10-B20-R101-SRC-0638','SRC-0638','Os sete pecados capitais | Banco de Dados Bibliográfico João Guimarães Rosa','USP页面第24–26行列出Os sete pecados capitais及作者名单，含Lygia Fagundes Telles；该页面只在具体篇目处展示Rosa的篇名，不据此推定Telles篇目；实读2026-10-14。','作为《Os sete pecados capitais》的参与作者之一；此CREATED仅表示对集体作品的创作贡献，不表示独著。','high','eligible_evidence','WCD-10-B20'),
('WCD10-B20-R101-SRC-0271','V1-REL-0762','WCD10-B20-R101-SRC-0271','SRC-0271','Bibliografia | Lygia Fagundes Telles','ABL书目页第112–114行：“Gaby (novela). In: ... Os Sete Pecados Capitais ... 1964, pp. 241-68.”；实读2026-10-14。','作为《Os sete pecados capitais》的参与作者之一；此CREATED仅表示对集体作品的创作贡献，不表示独著。','high','eligible_evidence','WCD-10-B20');

UPDATE metadata SET value='WCD-10-B20' WHERE key='last_change_set';

UPDATE metadata SET value='2026-10-14' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 791 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 787 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 785 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 812 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2655 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 3283 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2634 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1578 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 760 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 1179 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 1150 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 678 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
