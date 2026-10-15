-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: Codex-parent-independent-review

-- Registration sha256: 0169a44c9acf53e19813db32c0f93bf35cf6c1f89d272649f41b07adbc332a29

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2351 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1415 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 703 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 710 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 708 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 2924 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2372 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 548 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 50 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 1033 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 1062 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 682 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 742 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B15' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0745' OR canonical_url='https://ediciones.udp.cl/libro/no-leer/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0746' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/poeta-chileno/9788433998934/NH_641') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0747' OR canonical_url='https://www.anagrama-ed.es/libro/compactos/mis-documentos/9788433960252/CM_724') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0748' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/facsimil/9788433999122/NH_666') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0749' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/literatura-infantil/9788433905161/NH_715') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0750' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/bonsai/9788433932471/NH_391') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0751' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/la-vida-privada-de-los-arboles/9788433932525/NH_416') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0752' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/formas-de-volver-a-casa/9788433933041/EB_84') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0753' OR canonical_url='https://www2.academia.org.br/academicos/paulo-coelho/bibliografia') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0754' OR canonical_url='https://www.academia.org.br/academicos/paulo-coelho/discurso-de-recepcao') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0755' OR canonical_url='https://funag.gov.br/biblioteca-nova/produto/loc_pdf/314/1/biografias') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0756' OR canonical_url='https://www.record.com.br/products/sentimento-do-mundo/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0757' OR canonical_url='https://www.record.com.br/products/contos-de-aprendiz') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0713' OR (entity_type='work' AND original_name='Poeta chileno')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0714' OR (entity_type='collection' AND original_name='Mis documentos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0715' OR (entity_type='work' AND original_name='Facsímil')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0716' OR (entity_type='collection' AND original_name='Literatura infantil')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0717' OR (entity_type='collection' AND original_name='No leer')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0718' OR (entity_type='collection' AND original_name='Tema libre')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0719' OR (entity_type='work' AND original_name='O Diário de um Mago')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0720' OR (entity_type='work' AND original_name='Brida')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0721' OR (entity_type='work' AND original_name='As Valkírias')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0722' OR (entity_type='work' AND original_name='Na Margem do Rio Piedra Eu Sentei e Chorei')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0723' OR (entity_type='work' AND original_name='O Monte Cinco')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0724' OR (entity_type='collection' AND original_name='Brejo das almas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0725' OR (entity_type='collection' AND original_name='Sentimento do mundo')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0726' OR (entity_type='collection' AND original_name='José')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0727' OR (entity_type='collection' AND original_name='Contos de aprendiz')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0728' OR (entity_type='collection' AND original_name='Confissões de Minas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0729' OR (entity_type='collection' AND original_name='Passeios na ilha')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2379' OR (subject_id='V1-ENT-0713' AND fact_field='first_publication_year' AND value_text='2020')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2380' OR (subject_id='V1-ENT-0713' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2381' OR (subject_id='V1-ENT-0713' AND fact_field='one_sentence_summary' AND value_text='出版社简介围绕Gonzalo、继子Vicente及记者Pru等人物展开，并写到智利诗歌传统、诗人与“冒牌诗人”及诗歌制度声望。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2382' OR (subject_id='V1-ENT-0714' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2383' OR (subject_id='V1-ENT-0714' AND fact_field='one_sentence_summary' AND value_text='出版社称此书由短篇构成，并以“我的文件”文件夹为框架，涉及学生与教师生活、个人记忆以及智利共同历史。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2384' OR (subject_id='V1-ENT-0714' AND fact_field='bibliographic_note' AND value_text='Anagrama作者书目将《Mis documentos》列在2014年目录；本次打开的Compactos产品页为2018年再版。未将再版日期直接当作原始首版年份，因此原子首发年留空。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2385' OR (subject_id='V1-ENT-0715' AND fact_field='first_publication_year' AND value_text='2014')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2386' OR (subject_id='V1-ENT-0715' AND fact_field='genre_or_form' AND value_text='叙事、抒情片段与语言练习构成的混合文本')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2387' OR (subject_id='V1-ENT-0715' AND fact_field='one_sentence_summary' AND value_text='出版社简介指出本书借用智利大学入学多项选择考试的形式，以叙事、抒情片段和语言练习呈现教育体系及其不平等问题。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2388' OR (subject_id='V1-ENT-0716' AND fact_field='first_publication_year' AND value_text='2023')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2389' OR (subject_id='V1-ENT-0716' AND fact_field='genre_or_form' AND value_text='亲职日记、写给儿子的信与虚构叙事混合')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2390' OR (subject_id='V1-ENT-0716' AND fact_field='one_sentence_summary' AND value_text='出版社简介将本书联系到父职、童年与孩子成长，并说明其中交织亲职日记、写给儿子的信和虚构作品。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2391' OR (subject_id='V1-ENT-0717' AND fact_field='first_publication_year' AND value_text='2010')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2392' OR (subject_id='V1-ENT-0717' AND fact_field='genre_or_form' AND value_text='文学评论、编年与短篇随笔集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2393' OR (subject_id='V1-ENT-0717' AND fact_field='one_sentence_summary' AND value_text='大学出版社介绍该书由文学编年与短论构成，围绕书评、作者阅读札记及阅读行为展开。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2394' OR (subject_id='V1-ENT-0718' AND fact_field='first_publication_year' AND value_text='2019')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2395' OR (subject_id='V1-ENT-0718' AND fact_field='genre_or_form' AND value_text='随笔集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2396' OR (subject_id='V1-ENT-0718' AND fact_field='one_sentence_summary' AND value_text='Anagrama作者书目直接将《Tema libre》列为作者2019年出版的随笔集；本候选只作出版物层书目识别，不概述集内文本。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2397' OR (subject_id='V1-ENT-0719' AND fact_field='genre_or_form' AND value_text='著作（具体体裁未详）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2398' OR (subject_id='V1-ENT-0719' AND fact_field='one_sentence_summary' AND value_text='柯艾略关于圣地亚哥朝圣的作品；ABL接受演说称其以寻神之旅为精神主题。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2399' OR (subject_id='V1-ENT-0719' AND fact_field='bibliographic_note' AND value_text='ABL书目列Rocco于1987年出版；USP作者简介写1986年。不同来源提供的年份口径不一致，暂不填写作品首发年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2400' OR (subject_id='V1-ENT-0720' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2401' OR (subject_id='V1-ENT-0720' AND fact_field='one_sentence_summary' AND value_text='ABL接受演说称《Brida》为柯艾略最长的小说，并以女性寻求知识为主题。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2402' OR (subject_id='V1-ENT-0720' AND fact_field='first_publication_year' AND value_text='1990')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2403' OR (subject_id='V1-ENT-0721' AND fact_field='genre_or_form' AND value_text='著作（具体体裁未详）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2404' OR (subject_id='V1-ENT-0721' AND fact_field='one_sentence_summary' AND value_text='ABL接受演说将《As Valkírias》概述为围绕作者婚姻展开的作品，并澄清它并非单纯的天使题材书。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2405' OR (subject_id='V1-ENT-0721' AND fact_field='first_publication_year' AND value_text='1992')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2406' OR (subject_id='V1-ENT-0722' AND fact_field='genre_or_form' AND value_text='著作（具体体裁未详）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2407' OR (subject_id='V1-ENT-0722' AND fact_field='one_sentence_summary' AND value_text='ABL接受演说称该书关联作者接纳并运用女性一面的创作表达；此处仅记演说明确给出的作品说明。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2408' OR (subject_id='V1-ENT-0722' AND fact_field='first_publication_year' AND value_text='1994')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2409' OR (subject_id='V1-ENT-0723' AND fact_field='genre_or_form' AND value_text='著作（具体体裁未详）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2410' OR (subject_id='V1-ENT-0723' AND fact_field='one_sentence_summary' AND value_text='ABL接受演说称《O Monte Cinco》取材于圣经文本，写一名被迫追随命运的人物，并提到作品处理严厉与怜悯之间的平衡。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2411' OR (subject_id='V1-ENT-0723' AND fact_field='first_publication_year' AND value_text='1996')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2412' OR (subject_id='V1-ENT-0724' AND fact_field='first_publication_year' AND value_text='1934')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2413' OR (subject_id='V1-ENT-0724' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2414' OR (subject_id='V1-ENT-0724' AND fact_field='one_sentence_summary' AND value_text='FUNAG将《Brejo das almas》列为早期诗集之一，概括其诗句呈现失意、忧郁与对风俗的反讽；BNDigital也将其列入作者早期作品。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2415' OR (subject_id='V1-ENT-0724' AND fact_field='bibliographic_note' AND value_text='来源直接列出《Brejo das almas》为Drummond作品，记录年份1934；此处该年份按来源书目记录，不混同后续版本。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2416' OR (subject_id='V1-ENT-0725' AND fact_field='first_publication_year' AND value_text='1940')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2417' OR (subject_id='V1-ENT-0725' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2418' OR (subject_id='V1-ENT-0725' AND fact_field='one_sentence_summary' AND value_text='出版社将其介绍为Drummond第三部诗歌作品，诗篇呈现更广阔的人类视野与面向现实转变的政治参与。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2419' OR (subject_id='V1-ENT-0725' AND fact_field='bibliographic_note' AND value_text='来源直接列出《Sentimento do mundo》为Drummond作品，记录年份1940；此处该年份按来源书目记录，不混同后续版本。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2420' OR (subject_id='V1-ENT-0726' AND fact_field='first_publication_year' AND value_text='1942')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2421' OR (subject_id='V1-ENT-0726' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2422' OR (subject_id='V1-ENT-0726' AND fact_field='one_sentence_summary' AND value_text='BNDigital将《José》列为Drummond早期诗集，并概括其早期作品在日常生活及其反讽与超越日常现实的视野之间展开。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2423' OR (subject_id='V1-ENT-0726' AND fact_field='bibliographic_note' AND value_text='来源直接列出《José》为Drummond作品，记录年份1942；此处该年份按来源书目记录，不混同后续版本。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2424' OR (subject_id='V1-ENT-0727' AND fact_field='first_publication_year' AND value_text='1951')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2425' OR (subject_id='V1-ENT-0727' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2426' OR (subject_id='V1-ENT-0727' AND fact_field='one_sentence_summary' AND value_text='出版社记载本书于1951年出版，以15篇故事中的乡村生活与童年记忆为例，呈现对日常的观察。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2427' OR (subject_id='V1-ENT-0727' AND fact_field='bibliographic_note' AND value_text='来源直接列出《Contos de aprendiz》为Drummond作品，记录年份1951；此处该年份按来源书目记录，不混同后续版本。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2428' OR (subject_id='V1-ENT-0728' AND fact_field='first_publication_year' AND value_text='1944')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2429' OR (subject_id='V1-ENT-0728' AND fact_field='genre_or_form' AND value_text='编年随笔集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2430' OR (subject_id='V1-ENT-0728' AND fact_field='one_sentence_summary' AND value_text='FUNAG将《Confissões de Minas》列为Drummond 1944年出版的编年文集；本条限于来源直接给出的书目分类。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2431' OR (subject_id='V1-ENT-0728' AND fact_field='bibliographic_note' AND value_text='来源直接列出《Confissões de Minas》为Drummond作品，记录年份1944；此处该年份按来源书目记录，不混同后续版本。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2432' OR (subject_id='V1-ENT-0729' AND fact_field='first_publication_year' AND value_text='1952')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2433' OR (subject_id='V1-ENT-0729' AND fact_field='genre_or_form' AND value_text='编年随笔集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2434' OR (subject_id='V1-ENT-0729' AND fact_field='one_sentence_summary' AND value_text='FUNAG将《Passeios na ilha》列为Drummond 1952年出版的编年文集；本条限于来源直接给出的书目分类。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2435' OR (subject_id='V1-ENT-0729' AND fact_field='bibliographic_note' AND value_text='来源直接列出《Passeios na ilha》为Drummond作品，记录年份1952；此处该年份按来源书目记录，不混同后续版本。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2436' OR (subject_id='V1-ENT-0305' AND fact_field='one_sentence_summary' AND value_text='出版社简介描述《盆栽》中的Julio逐渐转向独自观察盆景生长，并把作品概括为一部压缩、近似“摘要式”的小说。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2437' OR (subject_id='V1-ENT-0306' AND fact_field='one_sentence_summary' AND value_text='出版社简介以Julián等待Verónica归来的一夜为叙事框架，写到他为Daniela讲述树的故事，并由此延展到她未来人生的想象。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2438' OR (subject_id='V1-ENT-0307' AND fact_field='one_sentence_summary' AND value_text='出版社简介将小说置于智利八十年代中期，以九岁男孩的成长和成年后的写作回望为线索，并指出作品以日记显露叙事建构。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2439' OR (subject_id='V1-ENT-0311' AND fact_field='one_sentence_summary' AND value_text='ABL接受演说将《牧羊少年奇幻之旅》概括为一段寓言式的历史朝圣，并提到其精神探索。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2440' OR (subject_id='V1-ENT-0312' AND fact_field='one_sentence_summary' AND value_text='ABL接受演说称《维罗妮卡决定去死》涉及接纳人类差异这一主题。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2441' OR (subject_id='V1-ENT-0314' AND fact_field='one_sentence_summary' AND value_text='ABL称《Alguma poesia》是Drummond尝试开创新诗歌语言的作品。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2442' OR (subject_id='V1-ENT-0315' AND fact_field='one_sentence_summary' AND value_text='FUNAG将《A rosa do povo》置于诗人社会政治参与与团结意识日渐鲜明的阶段。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2443' OR (subject_id='V1-ENT-0316' AND fact_field='one_sentence_summary' AND value_text='FUNAG概括《Claro enigma》之后的创作转向为对当代世界的怀疑，并转向诗艺实验与分析。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0685' OR (subject_id='V1-ENT-0298' AND relation_type='CREATED' AND object_id='V1-ENT-0713')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0686' OR (subject_id='V1-ENT-0298' AND relation_type='CREATED' AND object_id='V1-ENT-0714')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0687' OR (subject_id='V1-ENT-0298' AND relation_type='CREATED' AND object_id='V1-ENT-0715')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0688' OR (subject_id='V1-ENT-0298' AND relation_type='CREATED' AND object_id='V1-ENT-0716')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0689' OR (subject_id='V1-ENT-0298' AND relation_type='CREATED' AND object_id='V1-ENT-0717')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0690' OR (subject_id='V1-ENT-0298' AND relation_type='CREATED' AND object_id='V1-ENT-0718')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0691' OR (subject_id='V1-ENT-0308' AND relation_type='CREATED' AND object_id='V1-ENT-0719')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0692' OR (subject_id='V1-ENT-0308' AND relation_type='CREATED' AND object_id='V1-ENT-0720')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0693' OR (subject_id='V1-ENT-0308' AND relation_type='CREATED' AND object_id='V1-ENT-0721')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0694' OR (subject_id='V1-ENT-0308' AND relation_type='CREATED' AND object_id='V1-ENT-0722')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0695' OR (subject_id='V1-ENT-0308' AND relation_type='CREATED' AND object_id='V1-ENT-0723')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0696' OR (subject_id='V1-ENT-0309' AND relation_type='CREATED' AND object_id='V1-ENT-0724')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0697' OR (subject_id='V1-ENT-0309' AND relation_type='CREATED' AND object_id='V1-ENT-0725')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0698' OR (subject_id='V1-ENT-0309' AND relation_type='CREATED' AND object_id='V1-ENT-0726')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0699' OR (subject_id='V1-ENT-0309' AND relation_type='CREATED' AND object_id='V1-ENT-0727')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0700' OR (subject_id='V1-ENT-0309' AND relation_type='CREATED' AND object_id='V1-ENT-0728')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0701' OR (subject_id='V1-ENT-0309' AND relation_type='CREATED' AND object_id='V1-ENT-0729')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0745','WCD10-B16-S002','NO LEER — Ediciones UDP','NO LEER — Ediciones UDP','Alejandro Zambra','','Ediciones Universidad Diego Portales','','','university_press_book_catalog_page','','es','B','access_pass','WCD-10-B16','Research候选；未经独立Curation审核不进入reader或public层。','remote_only','','https://ediciones.udp.cl/libro/no-leer/'),
('SRC-0746','WCD10-B16-S003','Poeta chileno — Alejandro Zambra — Editorial Anagrama','Poeta chileno — Alejandro Zambra — Editorial Anagrama','Alejandro Zambra','','Editorial Anagrama','','','publisher_book_catalog_page','','es','B','access_pass','WCD-10-B16','Research候选；未经独立Curation审核不进入reader或public层。','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/poeta-chileno/9788433998934/NH_641'),
('SRC-0747','WCD10-B16-S004','Mis documentos — Alejandro Zambra — Editorial Anagrama','Mis documentos — Alejandro Zambra — Editorial Anagrama','Alejandro Zambra','','Editorial Anagrama','','','publisher_book_catalog_page','','es','B','access_pass','WCD-10-B16','Research候选；未经独立Curation审核不进入reader或public层。','remote_only','','https://www.anagrama-ed.es/libro/compactos/mis-documentos/9788433960252/CM_724'),
('SRC-0748','WCD10-B16-S005','Facsímil — Alejandro Zambra — Editorial Anagrama','Facsímil — Alejandro Zambra — Editorial Anagrama','Alejandro Zambra','','Editorial Anagrama','','','publisher_book_catalog_page','','es','B','access_pass','WCD-10-B16','Research候选；未经独立Curation审核不进入reader或public层。','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/facsimil/9788433999122/NH_666'),
('SRC-0749','WCD10-B16-S006','Literatura infantil — Alejandro Zambra — Editorial Anagrama','Literatura infantil — Alejandro Zambra — Editorial Anagrama','Alejandro Zambra','','Editorial Anagrama','','','publisher_book_catalog_page','','es','B','access_pass','WCD-10-B16','Research候选；未经独立Curation审核不进入reader或public层。','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/literatura-infantil/9788433905161/NH_715'),
('SRC-0750','WCD10-B16-S007','Bonsái — Alejandro Zambra — Editorial Anagrama','Bonsái — Alejandro Zambra — Editorial Anagrama','Alejandro Zambra','','Editorial Anagrama','','','publisher_book_catalog_page','','es','B','access_pass','WCD-10-B16','Research候选；未经独立Curation审核不进入reader或public层。','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/bonsai/9788433932471/NH_391'),
('SRC-0751','WCD10-B16-S008','La vida privada de los árboles — Alejandro Zambra — Editorial Anagrama','La vida privada de los árboles — Alejandro Zambra — Editorial Anagrama','Alejandro Zambra','','Editorial Anagrama','','','publisher_book_catalog_page','','es','B','access_pass','WCD-10-B16','Research候选；未经独立Curation审核不进入reader或public层。','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/la-vida-privada-de-los-arboles/9788433932525/NH_416'),
('SRC-0752','WCD10-B16-S009','Formas de volver a casa — Alejandro Zambra — Editorial Anagrama','Formas de volver a casa — Alejandro Zambra — Editorial Anagrama','Alejandro Zambra','','Editorial Anagrama','','','publisher_book_catalog_page','','es','B','access_pass','WCD-10-B16','Research候选；未经独立Curation审核不进入reader或public层。','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/formas-de-volver-a-casa/9788433933041/EB_84'),
('SRC-0753','WCD10-B16-S101','Paulo Coelho | Academia Brasileira de Letras — Bibliografia','Paulo Coelho | Academia Brasileira de Letras — Bibliografia','Academia Brasileira de Letras','','Academia Brasileira de Letras','','','institutional_bibliography_web_page','','pt','B','access_pass','WCD-10-B16','Research候选；未经独立Curation审核不进入reader或public层。','remote_only','','https://www2.academia.org.br/academicos/paulo-coelho/bibliografia'),
('SRC-0754','WCD10-B16-S102','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras','Arnaldo Niskier, Academia Brasileira de Letras','','Academia Brasileira de Letras','2002','','institutional_reception_speech_web_page','','pt','B','access_pass','WCD-10-B16','Research候选；未经独立Curation审核不进入reader或public层。','remote_only','','https://www.academia.org.br/academicos/paulo-coelho/discurso-de-recepcao'),
('SRC-0755','WCD10-B16-S201','Biografias — Fundação Alexandre de Gusmão (FUNAG)','Biografias — Fundação Alexandre de Gusmão (FUNAG)','Fundação Alexandre de Gusmão; Ministério das Relações Exteriores','','Fundação Alexandre de Gusmão','2009','','pdf','','pt','B','access_pass','WCD-10-B16','Research候选；未经独立Curation审核不进入reader或public层。','remote_only','','https://funag.gov.br/biblioteca-nova/produto/loc_pdf/314/1/biografias'),
('SRC-0756','WCD10-B16-S202','Sentimento do mundo — Editora Record','Sentimento do mundo — Editora Record','Editora Record','','Editora Record','','','publisher_product_page','','pt','B','access_pass','WCD-10-B16','Research候选；未经独立Curation审核不进入reader或public层。','remote_only','','https://www.record.com.br/products/sentimento-do-mundo/'),
('SRC-0757','WCD10-B16-S205','Contos de aprendiz — Editora Record','Contos de aprendiz — Editora Record','Editora Record','','Editora Record','','','publisher_product_page','','pt','B','access_pass','WCD-10-B16','Research候选；未经独立Curation审核不进入reader或public层。','remote_only','','https://www.record.com.br/products/contos-de-aprendiz');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0713','work','《智利诗人》（暂译）','Poeta chileno','candidate','1','WCD10-B16-W001','出版社或大学出版社直接书目确认作者归属；本候选只补有来源的普通书目、体裁和有界作品简介，不声称覆盖作者全部作品。; 中文名为检索用暂译，仅以西班牙语原题作为作品身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0714','collection','《我的文件》（暂译）','Mis documentos','candidate','1','WCD10-B16-W002','出版社或大学出版社直接书目确认作者归属；本候选只补有来源的普通书目、体裁和有界作品简介，不声称覆盖作者全部作品。; 中文名为检索用暂译，仅以西班牙语原题作为作品身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0715','work','《摹本》（暂译）','Facsímil','candidate','1','WCD10-B16-W003','出版社或大学出版社直接书目确认作者归属；本候选只补有来源的普通书目、体裁和有界作品简介，不声称覆盖作者全部作品。; 中文名为检索用暂译，仅以西班牙语原题作为作品身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0716','collection','《儿童文学》（暂译）','Literatura infantil','candidate','1','WCD10-B16-W004','出版社或大学出版社直接书目确认作者归属；本候选只补有来源的普通书目、体裁和有界作品简介，不声称覆盖作者全部作品。; 中文名为检索用暂译，仅以西班牙语原题作为作品身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0717','collection','《不读》（暂译）','No leer','candidate','1','WCD10-B16-W005','出版社或大学出版社直接书目确认作者归属；本候选只补有来源的普通书目、体裁和有界作品简介，不声称覆盖作者全部作品。; 中文名为检索用暂译，仅以西班牙语原题作为作品身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0718','collection','《自由主题》（暂译）','Tema libre','candidate','1','WCD10-B16-W006','出版社或大学出版社直接书目确认作者归属；本候选只补有来源的普通书目、体裁和有界作品简介，不声称覆盖作者全部作品。; 中文名为检索用暂译，仅以西班牙语原题作为作品身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0719','work','《魔法师的日记》','O Diário de um Mago','candidate','1','WCD10-B16-W101','冻结库仅见既有三部作品；Academia Brasileira de Letras直接书目及接受演说记录此重要作品，按DEC-070补入可直接支持的普通书目与有界简介。; 中文为检索工作译名，葡萄牙语原题为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0720','work','《布里达》','Brida','candidate','1','WCD10-B16-W102','冻结库仅见既有三部作品；Academia Brasileira de Letras直接书目及接受演说记录此重要作品，按DEC-070补入可直接支持的普通书目与有界简介。; 中文为检索工作译名，葡萄牙语原题为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0721','work','《女武神》','As Valkírias','candidate','1','WCD10-B16-W103','冻结库仅见既有三部作品；Academia Brasileira de Letras直接书目及接受演说记录此重要作品，按DEC-070补入可直接支持的普通书目与有界简介。; 中文为检索工作译名，葡萄牙语原题为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0722','work','《在皮埃特拉河畔我坐下并哭泣》','Na Margem do Rio Piedra Eu Sentei e Chorei','candidate','1','WCD10-B16-W104','冻结库仅见既有三部作品；Academia Brasileira de Letras直接书目及接受演说记录此重要作品，按DEC-070补入可直接支持的普通书目与有界简介。; 中文为检索工作译名，葡萄牙语原题为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0723','work','《第五座山》','O Monte Cinco','candidate','1','WCD10-B16-W105','冻结库仅见既有三部作品；Academia Brasileira de Letras直接书目及接受演说记录此重要作品，按DEC-070补入可直接支持的普通书目与有界简介。; 中文为检索工作译名，葡萄牙语原题为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0724','collection','《灵魂荒原》','Brejo das almas','candidate','1','WCD10-B16-W201','B16 冻结基线的作品目录仅列三部 Drummond 作品；本题名在冻结主库无同层命中，且机构/出版社来源直接列出并支持本条普通书目或有限内容描述。; 暂用中文工作译名以便检索，原文题名为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0725','collection','《世界的感觉》','Sentimento do mundo','candidate','1','WCD10-B16-W202','B16 冻结基线的作品目录仅列三部 Drummond 作品；本题名在冻结主库无同层命中，且机构/出版社来源直接列出并支持本条普通书目或有限内容描述。; 暂用中文工作译名以便检索，原文题名为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0726','collection','《何塞》','José','candidate','1','WCD10-B16-W203','B16 冻结基线的作品目录仅列三部 Drummond 作品；本题名在冻结主库无同层命中，且机构/出版社来源直接列出并支持本条普通书目或有限内容描述。; 中文名为原题名的音译工作标签，原文题名为身份锚点；不声称正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0727','collection','《学徒故事》','Contos de aprendiz','candidate','1','WCD10-B16-W204','B16 冻结基线的作品目录仅列三部 Drummond 作品；本题名在冻结主库无同层命中，且机构/出版社来源直接列出并支持本条普通书目或有限内容描述。; 暂用中文工作译名以便检索，原文题名为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0728','collection','《米纳斯的自白》','Confissões de Minas','candidate','1','WCD10-B16-W205','B16 冻结基线的作品目录仅列三部 Drummond 作品；本题名在冻结主库无同层命中，且机构/出版社来源直接列出并支持本条普通书目或有限内容描述。; 暂用中文工作译名以便检索，原文题名为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0729','collection','《岛上漫步》','Passeios na ilha','candidate','1','WCD10-B16-W206','B16 冻结基线的作品目录仅列三部 Drummond 作品；本题名在冻结主库无同层命中，且机构/出版社来源直接列出并支持本条普通书目或有限内容描述。; 暂用中文工作译名以便检索，原文题名为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0709','WCD10-B16-W001','WCD-10-B16','WCD10-B16-W001','V1-ENT-0713','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0710','WCD10-B16-W002','WCD-10-B16','WCD10-B16-W002','V1-ENT-0714','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0711','WCD10-B16-W003','WCD-10-B16','WCD10-B16-W003','V1-ENT-0715','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0712','WCD10-B16-W004','WCD-10-B16','WCD10-B16-W004','V1-ENT-0716','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0713','WCD10-B16-W005','WCD-10-B16','WCD10-B16-W005','V1-ENT-0717','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0714','WCD10-B16-W006','WCD-10-B16','WCD10-B16-W006','V1-ENT-0718','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0715','WCD10-B16-W101','WCD-10-B16','WCD10-B16-W101','V1-ENT-0719','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0716','WCD10-B16-W102','WCD-10-B16','WCD10-B16-W102','V1-ENT-0720','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0717','WCD10-B16-W103','WCD-10-B16','WCD10-B16-W103','V1-ENT-0721','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0718','WCD10-B16-W104','WCD-10-B16','WCD10-B16-W104','V1-ENT-0722','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0719','WCD10-B16-W105','WCD-10-B16','WCD10-B16-W105','V1-ENT-0723','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0720','WCD10-B16-W201','WCD-10-B16','WCD10-B16-W201','V1-ENT-0724','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0721','WCD10-B16-W202','WCD-10-B16','WCD10-B16-W202','V1-ENT-0725','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0722','WCD10-B16-W203','WCD-10-B16','WCD10-B16-W203','V1-ENT-0726','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0723','WCD10-B16-W204','WCD-10-B16','WCD10-B16-W204','V1-ENT-0727','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0724','WCD10-B16-W205','WCD-10-B16','WCD10-B16-W205','V1-ENT-0728','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0725','WCD10-B16-W206','WCD-10-B16','WCD10-B16-W206','V1-ENT-0729','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0704','WCD-10-B16:V1-ENT-0713','V1-ENT-0713','work','《智利诗人》（暂译）','亚历杭德罗·桑布拉','Poeta chileno','智利','es','2020','小说','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《智利诗人》（暂译）｜Poeta chileno

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：2020
- genre_or_form：小说
- one_sentence_summary：出版社简介围绕Gonzalo、继子Vicente及记者Pru等人物展开，并写到智利诗歌传统、诗人与“冒牌诗人”及诗歌制度声望。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0705','WCD-10-B16:V1-ENT-0714','V1-ENT-0714','collection','《我的文件》（暂译）','亚历杭德罗·桑布拉','Mis documentos','智利','es','','短篇小说集','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《我的文件》（暂译）｜Mis documentos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- one_sentence_summary：出版社称此书由短篇构成，并以“我的文件”文件夹为框架，涉及学生与教师生活、个人记忆以及智利共同历史。
- bibliographic_note：Anagrama作者书目将《Mis documentos》列在2014年目录；本次打开的Compactos产品页为2018年再版。未将再版日期直接当作原始首版年份，因此原子首发年留空。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0706','WCD-10-B16:V1-ENT-0715','V1-ENT-0715','work','《摹本》（暂译）','亚历杭德罗·桑布拉','Facsímil','智利','es','2014','叙事、抒情片段与语言练习构成的混合文本','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《摹本》（暂译）｜Facsímil

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：2014
- genre_or_form：叙事、抒情片段与语言练习构成的混合文本
- one_sentence_summary：出版社简介指出本书借用智利大学入学多项选择考试的形式，以叙事、抒情片段和语言练习呈现教育体系及其不平等问题。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0707','WCD-10-B16:V1-ENT-0716','V1-ENT-0716','collection','《儿童文学》（暂译）','亚历杭德罗·桑布拉','Literatura infantil','智利','es','2023','亲职日记、写给儿子的信与虚构叙事混合','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《儿童文学》（暂译）｜Literatura infantil

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：2023
- genre_or_form：亲职日记、写给儿子的信与虚构叙事混合
- one_sentence_summary：出版社简介将本书联系到父职、童年与孩子成长，并说明其中交织亲职日记、写给儿子的信和虚构作品。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0708','WCD-10-B16:V1-ENT-0717','V1-ENT-0717','collection','《不读》（暂译）','亚历杭德罗·桑布拉','No leer','智利','es','2010','文学评论、编年与短篇随笔集','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《不读》（暂译）｜No leer

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：2010
- genre_or_form：文学评论、编年与短篇随笔集
- one_sentence_summary：大学出版社介绍该书由文学编年与短论构成，围绕书评、作者阅读札记及阅读行为展开。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0709','WCD-10-B16:V1-ENT-0718','V1-ENT-0718','collection','《自由主题》（暂译）','亚历杭德罗·桑布拉','Tema libre','智利','es','2019','随笔集','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《自由主题》（暂译）｜Tema libre

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：2019
- genre_or_form：随笔集
- one_sentence_summary：Anagrama作者书目直接将《Tema libre》列为作者2019年出版的随笔集；本候选只作出版物层书目识别，不概述集内文本。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0710','WCD-10-B16:V1-ENT-0719','V1-ENT-0719','work','《魔法师的日记》','保罗·柯艾略','O Diário de um Mago','巴西','pt','','著作（具体体裁未详）','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《魔法师的日记》｜O Diário de um Mago

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：著作（具体体裁未详）
- one_sentence_summary：柯艾略关于圣地亚哥朝圣的作品；ABL接受演说称其以寻神之旅为精神主题。
- bibliographic_note：ABL书目列Rocco于1987年出版；USP作者简介写1986年。不同来源提供的年份口径不一致，暂不填写作品首发年。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0711','WCD-10-B16:V1-ENT-0720','V1-ENT-0720','work','《布里达》','保罗·柯艾略','Brida','巴西','pt','1990','长篇小说','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《布里达》｜Brida

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说
- one_sentence_summary：ABL接受演说称《Brida》为柯艾略最长的小说，并以女性寻求知识为主题。
- first_publication_year：1990

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0712','WCD-10-B16:V1-ENT-0721','V1-ENT-0721','work','《女武神》','保罗·柯艾略','As Valkírias','巴西','pt','1992','著作（具体体裁未详）','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《女武神》｜As Valkírias

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：著作（具体体裁未详）
- one_sentence_summary：ABL接受演说将《As Valkírias》概述为围绕作者婚姻展开的作品，并澄清它并非单纯的天使题材书。
- first_publication_year：1992

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0713','WCD-10-B16:V1-ENT-0722','V1-ENT-0722','work','《在皮埃特拉河畔我坐下并哭泣》','保罗·柯艾略','Na Margem do Rio Piedra Eu Sentei e Chorei','巴西','pt','1994','著作（具体体裁未详）','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《在皮埃特拉河畔我坐下并哭泣》｜Na Margem do Rio Piedra Eu Sentei e Chorei

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：著作（具体体裁未详）
- one_sentence_summary：ABL接受演说称该书关联作者接纳并运用女性一面的创作表达；此处仅记演说明确给出的作品说明。
- first_publication_year：1994

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0714','WCD-10-B16:V1-ENT-0723','V1-ENT-0723','work','《第五座山》','保罗·柯艾略','O Monte Cinco','巴西','pt','1996','著作（具体体裁未详）','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《第五座山》｜O Monte Cinco

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：著作（具体体裁未详）
- one_sentence_summary：ABL接受演说称《O Monte Cinco》取材于圣经文本，写一名被迫追随命运的人物，并提到作品处理严厉与怜悯之间的平衡。
- first_publication_year：1996

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0715','WCD-10-B16:V1-ENT-0724','V1-ENT-0724','collection','《灵魂荒原》','卡洛斯·德鲁蒙德·德·安德拉德','Brejo das almas','巴西','pt','1934','诗集','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《灵魂荒原》｜Brejo das almas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1934
- genre_or_form：诗集
- one_sentence_summary：FUNAG将《Brejo das almas》列为早期诗集之一，概括其诗句呈现失意、忧郁与对风俗的反讽；BNDigital也将其列入作者早期作品。
- bibliographic_note：来源直接列出《Brejo das almas》为Drummond作品，记录年份1934；此处该年份按来源书目记录，不混同后续版本。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0716','WCD-10-B16:V1-ENT-0725','V1-ENT-0725','collection','《世界的感觉》','卡洛斯·德鲁蒙德·德·安德拉德','Sentimento do mundo','巴西','pt','1940','诗集','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《世界的感觉》｜Sentimento do mundo

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1940
- genre_or_form：诗集
- one_sentence_summary：出版社将其介绍为Drummond第三部诗歌作品，诗篇呈现更广阔的人类视野与面向现实转变的政治参与。
- bibliographic_note：来源直接列出《Sentimento do mundo》为Drummond作品，记录年份1940；此处该年份按来源书目记录，不混同后续版本。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0717','WCD-10-B16:V1-ENT-0726','V1-ENT-0726','collection','《何塞》','卡洛斯·德鲁蒙德·德·安德拉德','José','巴西','pt','1942','诗集','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《何塞》｜José

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1942
- genre_or_form：诗集
- one_sentence_summary：BNDigital将《José》列为Drummond早期诗集，并概括其早期作品在日常生活及其反讽与超越日常现实的视野之间展开。
- bibliographic_note：来源直接列出《José》为Drummond作品，记录年份1942；此处该年份按来源书目记录，不混同后续版本。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0718','WCD-10-B16:V1-ENT-0727','V1-ENT-0727','collection','《学徒故事》','卡洛斯·德鲁蒙德·德·安德拉德','Contos de aprendiz','巴西','pt','1951','短篇小说集','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《学徒故事》｜Contos de aprendiz

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1951
- genre_or_form：短篇小说集
- one_sentence_summary：出版社记载本书于1951年出版，以15篇故事中的乡村生活与童年记忆为例，呈现对日常的观察。
- bibliographic_note：来源直接列出《Contos de aprendiz》为Drummond作品，记录年份1951；此处该年份按来源书目记录，不混同后续版本。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0719','WCD-10-B16:V1-ENT-0728','V1-ENT-0728','collection','《米纳斯的自白》','卡洛斯·德鲁蒙德·德·安德拉德','Confissões de Minas','巴西','pt','1944','编年随笔集','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《米纳斯的自白》｜Confissões de Minas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1944
- genre_or_form：编年随笔集
- one_sentence_summary：FUNAG将《Confissões de Minas》列为Drummond 1944年出版的编年文集；本条限于来源直接给出的书目分类。
- bibliographic_note：来源直接列出《Confissões de Minas》为Drummond作品，记录年份1944；此处该年份按来源书目记录，不混同后续版本。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0720','WCD-10-B16:V1-ENT-0729','V1-ENT-0729','collection','《岛上漫步》','卡洛斯·德鲁蒙德·德·安德拉德','Passeios na ilha','巴西','pt','1952','编年随笔集','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《岛上漫步》｜Passeios na ilha

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1952
- genre_or_form：编年随笔集
- one_sentence_summary：FUNAG将《Passeios na ilha》列为Drummond 1952年出版的编年文集；本条限于来源直接给出的书目分类。
- bibliographic_note：来源直接列出《Passeios na ilha》为Drummond作品，记录年份1952；此处该年份按来源书目记录，不混同后续版本。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0721','WCD-10-B16:V1-ENT-0305','V1-ENT-0305','work','《盆栽》','亚历杭德罗·桑布拉','Bonsái','智利','es','','','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《盆栽》｜Bonsái

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：出版社简介描述《盆栽》中的Julio逐渐转向独自观察盆景生长，并把作品概括为一部压缩、近似“摘要式”的小说。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0722','WCD-10-B16:V1-ENT-0306','V1-ENT-0306','work','《树的隐秘生活》','亚历杭德罗·桑布拉','La vida privada de los árboles','智利','es','','','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《树的隐秘生活》｜La vida privada de los árboles

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：出版社简介以Julián等待Verónica归来的一夜为叙事框架，写到他为Daniela讲述树的故事，并由此延展到她未来人生的想象。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0723','WCD-10-B16:V1-ENT-0307','V1-ENT-0307','work','《回家的路》','亚历杭德罗·桑布拉','Formas de volver a casa','智利','es','','','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《回家的路》｜Formas de volver a casa

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：出版社简介将小说置于智利八十年代中期，以九岁男孩的成长和成年后的写作回望为线索，并指出作品以日记显露叙事建构。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0724','WCD-10-B16:V1-ENT-0311','V1-ENT-0311','work','《牧羊少年奇幻之旅》','保罗·柯艾略','O Alquimista','巴西','pt','','','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《牧羊少年奇幻之旅》｜O Alquimista

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：ABL接受演说将《牧羊少年奇幻之旅》概括为一段寓言式的历史朝圣，并提到其精神探索。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0725','WCD-10-B16:V1-ENT-0312','V1-ENT-0312','work','《维罗妮卡决定去死》','保罗·柯艾略','Veronika Decide Morrer','巴西','pt','','','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《维罗妮卡决定去死》｜Veronika Decide Morrer

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：ABL接受演说称《维罗妮卡决定去死》涉及接纳人类差异这一主题。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0726','WCD-10-B16:V1-ENT-0314','V1-ENT-0314','collection','《某种诗》','卡洛斯·德鲁蒙德·德·安德拉德','Alguma poesia','巴西','pt','','','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《某种诗》｜Alguma poesia

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：ABL称《Alguma poesia》是Drummond尝试开创新诗歌语言的作品。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0727','WCD-10-B16:V1-ENT-0315','V1-ENT-0315','collection','《人民的玫瑰》','卡洛斯·德鲁蒙德·德·安德拉德','A rosa do povo','巴西','pt','','','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《人民的玫瑰》｜A rosa do povo

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：FUNAG将《A rosa do povo》置于诗人社会政治参与与团结意识日渐鲜明的阶段。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0728','WCD-10-B16:V1-ENT-0316','V1-ENT-0316','collection','《明晰之谜》','卡洛斯·德鲁蒙德·德·安德拉德','Claro enigma','巴西','pt','','','WCD-10-B16','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《明晰之谜》｜Claro enigma

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：FUNAG概括《Claro enigma》之后的创作转向为对当代世界的怀疑，并转向诗艺实验与分析。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-2379','WCD10-B16-W001-F01','V1-CARD-0704','V1-ENT-0713','first_publication_year','2020','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2380','WCD10-B16-W001-F02','V1-CARD-0704','V1-ENT-0713','genre_or_form','小说','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2381','WCD10-B16-W001-F03','V1-CARD-0704','V1-ENT-0713','one_sentence_summary','出版社简介围绕Gonzalo、继子Vicente及记者Pru等人物展开，并写到智利诗歌传统、诗人与“冒牌诗人”及诗歌制度声望。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2382','WCD10-B16-W002-F01','V1-CARD-0705','V1-ENT-0714','genre_or_form','短篇小说集','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2383','WCD10-B16-W002-F02','V1-CARD-0705','V1-ENT-0714','one_sentence_summary','出版社称此书由短篇构成，并以“我的文件”文件夹为框架，涉及学生与教师生活、个人记忆以及智利共同历史。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2384','WCD10-B16-W002-F03','V1-CARD-0705','V1-ENT-0714','bibliographic_note','Anagrama作者书目将《Mis documentos》列在2014年目录；本次打开的Compactos产品页为2018年再版。未将再版日期直接当作原始首版年份，因此原子首发年留空。','bibliographic_note','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2385','WCD10-B16-W003-F01','V1-CARD-0706','V1-ENT-0715','first_publication_year','2014','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2386','WCD10-B16-W003-F02','V1-CARD-0706','V1-ENT-0715','genre_or_form','叙事、抒情片段与语言练习构成的混合文本','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2387','WCD10-B16-W003-F03','V1-CARD-0706','V1-ENT-0715','one_sentence_summary','出版社简介指出本书借用智利大学入学多项选择考试的形式，以叙事、抒情片段和语言练习呈现教育体系及其不平等问题。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2388','WCD10-B16-W004-F01','V1-CARD-0707','V1-ENT-0716','first_publication_year','2023','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2389','WCD10-B16-W004-F02','V1-CARD-0707','V1-ENT-0716','genre_or_form','亲职日记、写给儿子的信与虚构叙事混合','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2390','WCD10-B16-W004-F03','V1-CARD-0707','V1-ENT-0716','one_sentence_summary','出版社简介将本书联系到父职、童年与孩子成长，并说明其中交织亲职日记、写给儿子的信和虚构作品。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2391','WCD10-B16-W005-F01','V1-CARD-0708','V1-ENT-0717','first_publication_year','2010','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2392','WCD10-B16-W005-F02','V1-CARD-0708','V1-ENT-0717','genre_or_form','文学评论、编年与短篇随笔集','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2393','WCD10-B16-W005-F03','V1-CARD-0708','V1-ENT-0717','one_sentence_summary','大学出版社介绍该书由文学编年与短论构成，围绕书评、作者阅读札记及阅读行为展开。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2394','WCD10-B16-W006-F01','V1-CARD-0709','V1-ENT-0718','first_publication_year','2019','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2395','WCD10-B16-W006-F02','V1-CARD-0709','V1-ENT-0718','genre_or_form','随笔集','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2396','WCD10-B16-W006-F03','V1-CARD-0709','V1-ENT-0718','one_sentence_summary','Anagrama作者书目直接将《Tema libre》列为作者2019年出版的随笔集；本候选只作出版物层书目识别，不概述集内文本。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2397','WCD10-B16-W101-F01','V1-CARD-0710','V1-ENT-0719','genre_or_form','著作（具体体裁未详）','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2398','WCD10-B16-W101-F02','V1-CARD-0710','V1-ENT-0719','one_sentence_summary','柯艾略关于圣地亚哥朝圣的作品；ABL接受演说称其以寻神之旅为精神主题。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2399','WCD10-B16-W101-F03','V1-CARD-0710','V1-ENT-0719','bibliographic_note','ABL书目列Rocco于1987年出版；USP作者简介写1986年。不同来源提供的年份口径不一致，暂不填写作品首发年。','bibliographic_note','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2400','WCD10-B16-W102-F01','V1-CARD-0711','V1-ENT-0720','genre_or_form','长篇小说','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2401','WCD10-B16-W102-F02','V1-CARD-0711','V1-ENT-0720','one_sentence_summary','ABL接受演说称《Brida》为柯艾略最长的小说，并以女性寻求知识为主题。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2402','WCD10-B16-W102-F03','V1-CARD-0711','V1-ENT-0720','first_publication_year','1990','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2403','WCD10-B16-W103-F01','V1-CARD-0712','V1-ENT-0721','genre_or_form','著作（具体体裁未详）','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2404','WCD10-B16-W103-F02','V1-CARD-0712','V1-ENT-0721','one_sentence_summary','ABL接受演说将《As Valkírias》概述为围绕作者婚姻展开的作品，并澄清它并非单纯的天使题材书。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2405','WCD10-B16-W103-F03','V1-CARD-0712','V1-ENT-0721','first_publication_year','1992','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2406','WCD10-B16-W104-F01','V1-CARD-0713','V1-ENT-0722','genre_or_form','著作（具体体裁未详）','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2407','WCD10-B16-W104-F02','V1-CARD-0713','V1-ENT-0722','one_sentence_summary','ABL接受演说称该书关联作者接纳并运用女性一面的创作表达；此处仅记演说明确给出的作品说明。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2408','WCD10-B16-W104-F03','V1-CARD-0713','V1-ENT-0722','first_publication_year','1994','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2409','WCD10-B16-W105-F01','V1-CARD-0714','V1-ENT-0723','genre_or_form','著作（具体体裁未详）','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2410','WCD10-B16-W105-F02','V1-CARD-0714','V1-ENT-0723','one_sentence_summary','ABL接受演说称《O Monte Cinco》取材于圣经文本，写一名被迫追随命运的人物，并提到作品处理严厉与怜悯之间的平衡。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2411','WCD10-B16-W105-F03','V1-CARD-0714','V1-ENT-0723','first_publication_year','1996','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2412','WCD10-B16-W201-F01','V1-CARD-0715','V1-ENT-0724','first_publication_year','1934','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2413','WCD10-B16-W201-F02','V1-CARD-0715','V1-ENT-0724','genre_or_form','诗集','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2414','WCD10-B16-W201-F03','V1-CARD-0715','V1-ENT-0724','one_sentence_summary','FUNAG将《Brejo das almas》列为早期诗集之一，概括其诗句呈现失意、忧郁与对风俗的反讽；BNDigital也将其列入作者早期作品。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2415','WCD10-B16-W201-F04','V1-CARD-0715','V1-ENT-0724','bibliographic_note','来源直接列出《Brejo das almas》为Drummond作品，记录年份1934；此处该年份按来源书目记录，不混同后续版本。','bibliographic_note','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2416','WCD10-B16-W202-F01','V1-CARD-0716','V1-ENT-0725','first_publication_year','1940','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2417','WCD10-B16-W202-F02','V1-CARD-0716','V1-ENT-0725','genre_or_form','诗集','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2418','WCD10-B16-W202-F03','V1-CARD-0716','V1-ENT-0725','one_sentence_summary','出版社将其介绍为Drummond第三部诗歌作品，诗篇呈现更广阔的人类视野与面向现实转变的政治参与。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2419','WCD10-B16-W202-F04','V1-CARD-0716','V1-ENT-0725','bibliographic_note','来源直接列出《Sentimento do mundo》为Drummond作品，记录年份1940；此处该年份按来源书目记录，不混同后续版本。','bibliographic_note','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2420','WCD10-B16-W203-F01','V1-CARD-0717','V1-ENT-0726','first_publication_year','1942','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2421','WCD10-B16-W203-F02','V1-CARD-0717','V1-ENT-0726','genre_or_form','诗集','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2422','WCD10-B16-W203-F03','V1-CARD-0717','V1-ENT-0726','one_sentence_summary','BNDigital将《José》列为Drummond早期诗集，并概括其早期作品在日常生活及其反讽与超越日常现实的视野之间展开。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2423','WCD10-B16-W203-F04','V1-CARD-0717','V1-ENT-0726','bibliographic_note','来源直接列出《José》为Drummond作品，记录年份1942；此处该年份按来源书目记录，不混同后续版本。','bibliographic_note','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2424','WCD10-B16-W204-F01','V1-CARD-0718','V1-ENT-0727','first_publication_year','1951','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2425','WCD10-B16-W204-F02','V1-CARD-0718','V1-ENT-0727','genre_or_form','短篇小说集','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2426','WCD10-B16-W204-F03','V1-CARD-0718','V1-ENT-0727','one_sentence_summary','出版社记载本书于1951年出版，以15篇故事中的乡村生活与童年记忆为例，呈现对日常的观察。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2427','WCD10-B16-W204-F04','V1-CARD-0718','V1-ENT-0727','bibliographic_note','来源直接列出《Contos de aprendiz》为Drummond作品，记录年份1951；此处该年份按来源书目记录，不混同后续版本。','bibliographic_note','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2428','WCD10-B16-W205-F01','V1-CARD-0719','V1-ENT-0728','first_publication_year','1944','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2429','WCD10-B16-W205-F02','V1-CARD-0719','V1-ENT-0728','genre_or_form','编年随笔集','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2430','WCD10-B16-W205-F03','V1-CARD-0719','V1-ENT-0728','one_sentence_summary','FUNAG将《Confissões de Minas》列为Drummond 1944年出版的编年文集；本条限于来源直接给出的书目分类。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2431','WCD10-B16-W205-F04','V1-CARD-0719','V1-ENT-0728','bibliographic_note','来源直接列出《Confissões de Minas》为Drummond作品，记录年份1944；此处该年份按来源书目记录，不混同后续版本。','bibliographic_note','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2432','WCD10-B16-W206-F01','V1-CARD-0720','V1-ENT-0729','first_publication_year','1952','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2433','WCD10-B16-W206-F02','V1-CARD-0720','V1-ENT-0729','genre_or_form','编年随笔集','bibliographic','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2434','WCD10-B16-W206-F03','V1-CARD-0720','V1-ENT-0729','one_sentence_summary','FUNAG将《Passeios na ilha》列为Drummond 1952年出版的编年文集；本条限于来源直接给出的书目分类。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2435','WCD10-B16-W206-F04','V1-CARD-0720','V1-ENT-0729','bibliographic_note','来源直接列出《Passeios na ilha》为Drummond作品，记录年份1952；此处该年份按来源书目记录，不混同后续版本。','bibliographic_note','WCD-10-B16','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2436','WCD10-B16-F001','V1-CARD-0721','V1-ENT-0305','one_sentence_summary','出版社简介描述《盆栽》中的Julio逐渐转向独自观察盆景生长，并把作品概括为一部压缩、近似“摘要式”的小说。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','仅追加来源直接支持的一句对象级简介；逐值保留冻结库既有全部事实、卡片与完整来源/关系闭包。'),
('V1-FCT-2437','WCD10-B16-F002','V1-CARD-0722','V1-ENT-0306','one_sentence_summary','出版社简介以Julián等待Verónica归来的一夜为叙事框架，写到他为Daniela讲述树的故事，并由此延展到她未来人生的想象。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','仅追加来源直接支持的一句对象级简介；逐值保留冻结库既有全部事实、卡片与完整来源/关系闭包。'),
('V1-FCT-2438','WCD10-B16-F003','V1-CARD-0723','V1-ENT-0307','one_sentence_summary','出版社简介将小说置于智利八十年代中期，以九岁男孩的成长和成年后的写作回望为线索，并指出作品以日记显露叙事建构。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','仅追加来源直接支持的一句对象级简介；逐值保留冻结库既有全部事实、卡片与完整来源/关系闭包。'),
('V1-FCT-2439','WCD10-B16-F101','V1-CARD-0724','V1-ENT-0311','one_sentence_summary','ABL接受演说将《牧羊少年奇幻之旅》概括为一段寓言式的历史朝圣，并提到其精神探索。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','仅按ABL接受演说的作品概述补一条有限简介；保留冻结库既有FCT-0822至0824及其SRC-0241来源链。'),
('V1-FCT-2440','WCD10-B16-F102','V1-CARD-0725','V1-ENT-0312','one_sentence_summary','ABL接受演说称《维罗妮卡决定去死》涉及接纳人类差异这一主题。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','仅按ABL接受演说的直接表述补有限主题简介；保留冻结库既有FCT-0825至0827及其SRC-0241来源链。'),
('V1-FCT-2441','WCD10-B16-F201','V1-CARD-0726','V1-ENT-0314','one_sentence_summary','ABL称《Alguma poesia》是Drummond尝试开创新诗歌语言的作品。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','仅追加来源直接支持的简短作品说明；旧事实、卡片、关系及其来源链逐值保全。'),
('V1-FCT-2442','WCD10-B16-F202','V1-CARD-0727','V1-ENT-0315','one_sentence_summary','FUNAG将《A rosa do povo》置于诗人社会政治参与与团结意识日渐鲜明的阶段。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','仅追加机构传记直接支持的有限阶段描述；不增加主题或现实关系推断，旧闭包逐值保全。'),
('V1-FCT-2443','WCD10-B16-F203','V1-CARD-0728','V1-ENT-0316','one_sentence_summary','FUNAG概括《Claro enigma》之后的创作转向为对当代世界的怀疑，并转向诗艺实验与分析。','institutional_paraphrase','WCD-10-B16','high','batch_retained_candidate','仅追加机构传记直接支持的有限作品阶段描述；旧闭包逐值保全。');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-2379','SRC-0239','Alejandro Zambra — Editorial Anagrama'),
('V1-FCT-2380','SRC-0746','Poeta chileno — Alejandro Zambra — Editorial Anagrama'),
('V1-FCT-2381','SRC-0746','Poeta chileno — Alejandro Zambra — Editorial Anagrama'),
('V1-FCT-2382','SRC-0239','Alejandro Zambra — Editorial Anagrama'),
('V1-FCT-2382','SRC-0747','Mis documentos — Alejandro Zambra — Editorial Anagrama'),
('V1-FCT-2383','SRC-0747','Mis documentos — Alejandro Zambra — Editorial Anagrama'),
('V1-FCT-2384','SRC-0239','Alejandro Zambra — Editorial Anagrama'),
('V1-FCT-2384','SRC-0747','Mis documentos — Alejandro Zambra — Editorial Anagrama'),
('V1-FCT-2385','SRC-0748','Facsímil — Alejandro Zambra — Editorial Anagrama'),
('V1-FCT-2386','SRC-0748','Facsímil — Alejandro Zambra — Editorial Anagrama'),
('V1-FCT-2387','SRC-0748','Facsímil — Alejandro Zambra — Editorial Anagrama'),
('V1-FCT-2388','SRC-0749','Literatura infantil — Alejandro Zambra — Editorial Anagrama'),
('V1-FCT-2389','SRC-0749','Literatura infantil — Alejandro Zambra — Editorial Anagrama'),
('V1-FCT-2390','SRC-0749','Literatura infantil — Alejandro Zambra — Editorial Anagrama'),
('V1-FCT-2391','SRC-0745','NO LEER — Ediciones UDP'),
('V1-FCT-2392','SRC-0745','NO LEER — Ediciones UDP'),
('V1-FCT-2393','SRC-0745','NO LEER — Ediciones UDP'),
('V1-FCT-2394','SRC-0239','Alejandro Zambra — Editorial Anagrama'),
('V1-FCT-2395','SRC-0239','Alejandro Zambra — Editorial Anagrama'),
('V1-FCT-2396','SRC-0239','Alejandro Zambra — Editorial Anagrama'),
('V1-FCT-2397','SRC-0753','Paulo Coelho | Academia Brasileira de Letras — Bibliografia'),
('V1-FCT-2397','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras'),
('V1-FCT-2397','SRC-0242','Coelho, Paulo - Portal Contemporâneo da América Latina e Caribe'),
('V1-FCT-2398','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras'),
('V1-FCT-2399','SRC-0753','Paulo Coelho | Academia Brasileira de Letras — Bibliografia'),
('V1-FCT-2399','SRC-0242','Coelho, Paulo - Portal Contemporâneo da América Latina e Caribe'),
('V1-FCT-2400','SRC-0753','Paulo Coelho | Academia Brasileira de Letras — Bibliografia'),
('V1-FCT-2400','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras'),
('V1-FCT-2401','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras'),
('V1-FCT-2402','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras'),
('V1-FCT-2403','SRC-0753','Paulo Coelho | Academia Brasileira de Letras — Bibliografia'),
('V1-FCT-2403','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras'),
('V1-FCT-2404','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras'),
('V1-FCT-2405','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras'),
('V1-FCT-2406','SRC-0753','Paulo Coelho | Academia Brasileira de Letras — Bibliografia'),
('V1-FCT-2406','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras'),
('V1-FCT-2407','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras'),
('V1-FCT-2408','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras'),
('V1-FCT-2409','SRC-0753','Paulo Coelho | Academia Brasileira de Letras — Bibliografia'),
('V1-FCT-2409','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras'),
('V1-FCT-2410','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras'),
('V1-FCT-2411','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras'),
('V1-FCT-2412','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)'),
('V1-FCT-2412','SRC-0244','Carlos Drummond de Andrade'),
('V1-FCT-2413','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)'),
('V1-FCT-2413','SRC-0244','Carlos Drummond de Andrade'),
('V1-FCT-2414','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)'),
('V1-FCT-2414','SRC-0244','Carlos Drummond de Andrade'),
('V1-FCT-2415','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)'),
('V1-FCT-2415','SRC-0244','Carlos Drummond de Andrade'),
('V1-FCT-2416','SRC-0756','Sentimento do mundo — Editora Record'),
('V1-FCT-2416','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)'),
('V1-FCT-2417','SRC-0756','Sentimento do mundo — Editora Record'),
('V1-FCT-2417','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)'),
('V1-FCT-2418','SRC-0756','Sentimento do mundo — Editora Record'),
('V1-FCT-2418','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)'),
('V1-FCT-2419','SRC-0756','Sentimento do mundo — Editora Record'),
('V1-FCT-2419','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)'),
('V1-FCT-2420','SRC-0244','Carlos Drummond de Andrade'),
('V1-FCT-2420','SRC-0243','O ano Drummond'),
('V1-FCT-2421','SRC-0244','Carlos Drummond de Andrade'),
('V1-FCT-2421','SRC-0243','O ano Drummond'),
('V1-FCT-2422','SRC-0244','Carlos Drummond de Andrade'),
('V1-FCT-2422','SRC-0243','O ano Drummond'),
('V1-FCT-2423','SRC-0244','Carlos Drummond de Andrade'),
('V1-FCT-2423','SRC-0243','O ano Drummond'),
('V1-FCT-2424','SRC-0757','Contos de aprendiz — Editora Record'),
('V1-FCT-2425','SRC-0757','Contos de aprendiz — Editora Record'),
('V1-FCT-2426','SRC-0757','Contos de aprendiz — Editora Record'),
('V1-FCT-2427','SRC-0757','Contos de aprendiz — Editora Record'),
('V1-FCT-2428','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)'),
('V1-FCT-2429','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)'),
('V1-FCT-2430','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)'),
('V1-FCT-2431','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)'),
('V1-FCT-2432','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)'),
('V1-FCT-2433','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)'),
('V1-FCT-2434','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)'),
('V1-FCT-2435','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)'),
('V1-FCT-2436','SRC-0750','Bonsái — Alejandro Zambra — Editorial Anagrama'),
('V1-FCT-2437','SRC-0751','La vida privada de los árboles — Alejandro Zambra — Editorial Anagrama'),
('V1-FCT-2438','SRC-0752','Formas de volver a casa — Alejandro Zambra — Editorial Anagrama'),
('V1-FCT-2439','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras'),
('V1-FCT-2440','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras'),
('V1-FCT-2441','SRC-0243','O ano Drummond'),
('V1-FCT-2442','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)'),
('V1-FCT-2443','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0704','V1-FCT-2379','batch_retained_candidate'),
('V1-CARD-0704','V1-FCT-2380','batch_retained_candidate'),
('V1-CARD-0704','V1-FCT-2381','batch_retained_candidate'),
('V1-CARD-0705','V1-FCT-2382','batch_retained_candidate'),
('V1-CARD-0705','V1-FCT-2383','batch_retained_candidate'),
('V1-CARD-0705','V1-FCT-2384','batch_retained_candidate'),
('V1-CARD-0706','V1-FCT-2385','batch_retained_candidate'),
('V1-CARD-0706','V1-FCT-2386','batch_retained_candidate'),
('V1-CARD-0706','V1-FCT-2387','batch_retained_candidate'),
('V1-CARD-0707','V1-FCT-2388','batch_retained_candidate'),
('V1-CARD-0707','V1-FCT-2389','batch_retained_candidate'),
('V1-CARD-0707','V1-FCT-2390','batch_retained_candidate'),
('V1-CARD-0708','V1-FCT-2391','batch_retained_candidate'),
('V1-CARD-0708','V1-FCT-2392','batch_retained_candidate'),
('V1-CARD-0708','V1-FCT-2393','batch_retained_candidate'),
('V1-CARD-0709','V1-FCT-2394','batch_retained_candidate'),
('V1-CARD-0709','V1-FCT-2395','batch_retained_candidate'),
('V1-CARD-0709','V1-FCT-2396','batch_retained_candidate'),
('V1-CARD-0710','V1-FCT-2397','batch_retained_candidate'),
('V1-CARD-0710','V1-FCT-2398','batch_retained_candidate'),
('V1-CARD-0710','V1-FCT-2399','batch_retained_candidate'),
('V1-CARD-0711','V1-FCT-2400','batch_retained_candidate'),
('V1-CARD-0711','V1-FCT-2401','batch_retained_candidate'),
('V1-CARD-0711','V1-FCT-2402','batch_retained_candidate'),
('V1-CARD-0712','V1-FCT-2403','batch_retained_candidate'),
('V1-CARD-0712','V1-FCT-2404','batch_retained_candidate'),
('V1-CARD-0712','V1-FCT-2405','batch_retained_candidate'),
('V1-CARD-0713','V1-FCT-2406','batch_retained_candidate'),
('V1-CARD-0713','V1-FCT-2407','batch_retained_candidate'),
('V1-CARD-0713','V1-FCT-2408','batch_retained_candidate'),
('V1-CARD-0714','V1-FCT-2409','batch_retained_candidate'),
('V1-CARD-0714','V1-FCT-2410','batch_retained_candidate'),
('V1-CARD-0714','V1-FCT-2411','batch_retained_candidate'),
('V1-CARD-0715','V1-FCT-2412','batch_retained_candidate'),
('V1-CARD-0715','V1-FCT-2413','batch_retained_candidate'),
('V1-CARD-0715','V1-FCT-2414','batch_retained_candidate'),
('V1-CARD-0715','V1-FCT-2415','batch_retained_candidate'),
('V1-CARD-0716','V1-FCT-2416','batch_retained_candidate'),
('V1-CARD-0716','V1-FCT-2417','batch_retained_candidate'),
('V1-CARD-0716','V1-FCT-2418','batch_retained_candidate'),
('V1-CARD-0716','V1-FCT-2419','batch_retained_candidate'),
('V1-CARD-0717','V1-FCT-2420','batch_retained_candidate'),
('V1-CARD-0717','V1-FCT-2421','batch_retained_candidate'),
('V1-CARD-0717','V1-FCT-2422','batch_retained_candidate'),
('V1-CARD-0717','V1-FCT-2423','batch_retained_candidate'),
('V1-CARD-0718','V1-FCT-2424','batch_retained_candidate'),
('V1-CARD-0718','V1-FCT-2425','batch_retained_candidate'),
('V1-CARD-0718','V1-FCT-2426','batch_retained_candidate'),
('V1-CARD-0718','V1-FCT-2427','batch_retained_candidate'),
('V1-CARD-0719','V1-FCT-2428','batch_retained_candidate'),
('V1-CARD-0719','V1-FCT-2429','batch_retained_candidate'),
('V1-CARD-0719','V1-FCT-2430','batch_retained_candidate'),
('V1-CARD-0719','V1-FCT-2431','batch_retained_candidate'),
('V1-CARD-0720','V1-FCT-2432','batch_retained_candidate'),
('V1-CARD-0720','V1-FCT-2433','batch_retained_candidate'),
('V1-CARD-0720','V1-FCT-2434','batch_retained_candidate'),
('V1-CARD-0720','V1-FCT-2435','batch_retained_candidate'),
('V1-CARD-0721','V1-FCT-2436','batch_retained_candidate'),
('V1-CARD-0722','V1-FCT-2437','batch_retained_candidate'),
('V1-CARD-0723','V1-FCT-2438','batch_retained_candidate'),
('V1-CARD-0724','V1-FCT-2439','batch_retained_candidate'),
('V1-CARD-0725','V1-FCT-2440','batch_retained_candidate'),
('V1-CARD-0726','V1-FCT-2441','batch_retained_candidate'),
('V1-CARD-0727','V1-FCT-2442','batch_retained_candidate'),
('V1-CARD-0728','V1-FCT-2443','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-1424','WCD10-B16-S001','V1-CARD-0704','SRC-0239','B','bibliography_or_bounded_description','yes','no','SRC-0239','accepted','NONE'),
('V1-CS-1425','WCD10-B16-S003','V1-CARD-0704','SRC-0746','B','bibliography_or_bounded_description','yes','no','SRC-0746','accepted','NONE'),
('V1-CS-1426','WCD10-B16-S001','V1-CARD-0705','SRC-0239','B','bibliography_or_bounded_description','yes','no','SRC-0239','accepted','NONE'),
('V1-CS-1427','WCD10-B16-S004','V1-CARD-0705','SRC-0747','B','bibliography_or_bounded_description','yes','no','SRC-0747','accepted','NONE'),
('V1-CS-1428','WCD10-B16-S005','V1-CARD-0706','SRC-0748','B','bibliography_or_bounded_description','yes','no','SRC-0748','accepted','NONE'),
('V1-CS-1429','WCD10-B16-S006','V1-CARD-0707','SRC-0749','B','bibliography_or_bounded_description','yes','no','SRC-0749','accepted','NONE'),
('V1-CS-1430','WCD10-B16-S002','V1-CARD-0708','SRC-0745','B','bibliography_or_bounded_description','yes','no','SRC-0745','accepted','NONE'),
('V1-CS-1431','WCD10-B16-S001','V1-CARD-0709','SRC-0239','B','bibliography_or_bounded_description','yes','no','SRC-0239','accepted','NONE'),
('V1-CS-1432','WCD10-B16-S101','V1-CARD-0710','SRC-0753','B','bibliography_or_bounded_description','yes','no','SRC-0753','accepted','NONE'),
('V1-CS-1433','WCD10-B16-S102','V1-CARD-0710','SRC-0754','B','bibliography_or_bounded_description','yes','no','SRC-0754','accepted','NONE'),
('V1-CS-1434','WCD10-B16-S103','V1-CARD-0710','SRC-0242','B','bibliography_or_bounded_description','yes','no','SRC-0242','accepted','NONE'),
('V1-CS-1435','WCD10-B16-S101','V1-CARD-0711','SRC-0753','B','bibliography_or_bounded_description','yes','no','SRC-0753','accepted','NONE'),
('V1-CS-1436','WCD10-B16-S102','V1-CARD-0711','SRC-0754','B','bibliography_or_bounded_description','yes','no','SRC-0754','accepted','NONE'),
('V1-CS-1437','WCD10-B16-S101','V1-CARD-0712','SRC-0753','B','bibliography_or_bounded_description','yes','no','SRC-0753','accepted','NONE'),
('V1-CS-1438','WCD10-B16-S102','V1-CARD-0712','SRC-0754','B','bibliography_or_bounded_description','yes','no','SRC-0754','accepted','NONE'),
('V1-CS-1439','WCD10-B16-S101','V1-CARD-0713','SRC-0753','B','bibliography_or_bounded_description','yes','no','SRC-0753','accepted','NONE'),
('V1-CS-1440','WCD10-B16-S102','V1-CARD-0713','SRC-0754','B','bibliography_or_bounded_description','yes','no','SRC-0754','accepted','NONE'),
('V1-CS-1441','WCD10-B16-S101','V1-CARD-0714','SRC-0753','B','bibliography_or_bounded_description','yes','no','SRC-0753','accepted','NONE'),
('V1-CS-1442','WCD10-B16-S102','V1-CARD-0714','SRC-0754','B','bibliography_or_bounded_description','yes','no','SRC-0754','accepted','NONE'),
('V1-CS-1443','WCD10-B16-S201','V1-CARD-0715','SRC-0755','B','bibliography_or_bounded_description','yes','no','SRC-0755','accepted','NONE'),
('V1-CS-1444','WCD10-B16-S204','V1-CARD-0715','SRC-0244','B','bibliography_or_bounded_description','yes','no','SRC-0244','accepted','NONE'),
('V1-CS-1445','WCD10-B16-S201','V1-CARD-0716','SRC-0755','B','bibliography_or_bounded_description','yes','no','SRC-0755','accepted','NONE'),
('V1-CS-1446','WCD10-B16-S202','V1-CARD-0716','SRC-0756','B','bibliography_or_bounded_description','yes','no','SRC-0756','accepted','NONE'),
('V1-CS-1447','WCD10-B16-S203','V1-CARD-0717','SRC-0243','B','bibliography_or_bounded_description','yes','no','SRC-0243','accepted','NONE'),
('V1-CS-1448','WCD10-B16-S204','V1-CARD-0717','SRC-0244','B','bibliography_or_bounded_description','yes','no','SRC-0244','accepted','NONE'),
('V1-CS-1449','WCD10-B16-S205','V1-CARD-0718','SRC-0757','B','bibliography_or_bounded_description','yes','no','SRC-0757','accepted','NONE'),
('V1-CS-1450','WCD10-B16-S201','V1-CARD-0719','SRC-0755','B','bibliography_or_bounded_description','yes','no','SRC-0755','accepted','NONE'),
('V1-CS-1451','WCD10-B16-S201','V1-CARD-0720','SRC-0755','B','bibliography_or_bounded_description','yes','no','SRC-0755','accepted','NONE'),
('V1-CS-1452','WCD10-B16-S007','V1-CARD-0721','SRC-0750','B','bibliography_or_bounded_description','no','no','SRC-0750','accepted','NONE'),
('V1-CS-1453','WCD10-B16-S008','V1-CARD-0722','SRC-0751','B','bibliography_or_bounded_description','no','no','SRC-0751','accepted','NONE'),
('V1-CS-1454','WCD10-B16-S009','V1-CARD-0723','SRC-0752','B','bibliography_or_bounded_description','no','no','SRC-0752','accepted','NONE'),
('V1-CS-1455','WCD10-B16-S102','V1-CARD-0724','SRC-0754','B','bibliography_or_bounded_description','no','no','SRC-0754','accepted','NONE'),
('V1-CS-1456','WCD10-B16-S102','V1-CARD-0725','SRC-0754','B','bibliography_or_bounded_description','no','no','SRC-0754','accepted','NONE'),
('V1-CS-1457','WCD10-B16-S203','V1-CARD-0726','SRC-0243','B','bibliography_or_bounded_description','no','no','SRC-0243','accepted','NONE'),
('V1-CS-1458','WCD10-B16-S201','V1-CARD-0727','SRC-0755','B','bibliography_or_bounded_description','no','no','SRC-0755','accepted','NONE'),
('V1-CS-1459','WCD10-B16-S201','V1-CARD-0728','SRC-0755','B','bibliography_or_bounded_description','no','no','SRC-0755','accepted','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0685','WCD-10-B16','WCD10-B16-W001-CREATED','V1-ENT-0298','CREATED','V1-ENT-0713','亚历杭德罗·桑布拉创作 Poeta chileno','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0686','WCD-10-B16','WCD10-B16-W002-CREATED','V1-ENT-0298','CREATED','V1-ENT-0714','亚历杭德罗·桑布拉创作 Mis documentos','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0687','WCD-10-B16','WCD10-B16-W003-CREATED','V1-ENT-0298','CREATED','V1-ENT-0715','亚历杭德罗·桑布拉创作 Facsímil','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0688','WCD-10-B16','WCD10-B16-W004-CREATED','V1-ENT-0298','CREATED','V1-ENT-0716','亚历杭德罗·桑布拉创作 Literatura infantil','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0689','WCD-10-B16','WCD10-B16-W005-CREATED','V1-ENT-0298','CREATED','V1-ENT-0717','亚历杭德罗·桑布拉创作 No leer','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0690','WCD-10-B16','WCD10-B16-W006-CREATED','V1-ENT-0298','CREATED','V1-ENT-0718','亚历杭德罗·桑布拉创作 Tema libre','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0691','WCD-10-B16','WCD10-B16-W101-CREATED','V1-ENT-0308','CREATED','V1-ENT-0719','保罗·柯艾略创作 O Diário de um Mago','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0692','WCD-10-B16','WCD10-B16-W102-CREATED','V1-ENT-0308','CREATED','V1-ENT-0720','保罗·柯艾略创作 Brida','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0693','WCD-10-B16','WCD10-B16-W103-CREATED','V1-ENT-0308','CREATED','V1-ENT-0721','保罗·柯艾略创作 As Valkírias','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0694','WCD-10-B16','WCD10-B16-W104-CREATED','V1-ENT-0308','CREATED','V1-ENT-0722','保罗·柯艾略创作 Na Margem do Rio Piedra Eu Sentei e Chorei','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0695','WCD-10-B16','WCD10-B16-W105-CREATED','V1-ENT-0308','CREATED','V1-ENT-0723','保罗·柯艾略创作 O Monte Cinco','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0696','WCD-10-B16','WCD10-B16-W201-CREATED','V1-ENT-0309','CREATED','V1-ENT-0724','卡洛斯·德鲁蒙德·德·安德拉德创作 Brejo das almas','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0697','WCD-10-B16','WCD10-B16-W202-CREATED','V1-ENT-0309','CREATED','V1-ENT-0725','卡洛斯·德鲁蒙德·德·安德拉德创作 Sentimento do mundo','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0698','WCD-10-B16','WCD10-B16-W203-CREATED','V1-ENT-0309','CREATED','V1-ENT-0726','卡洛斯·德鲁蒙德·德·安德拉德创作 José','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0699','WCD-10-B16','WCD10-B16-W204-CREATED','V1-ENT-0309','CREATED','V1-ENT-0727','卡洛斯·德鲁蒙德·德·安德拉德创作 Contos de aprendiz','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0700','WCD-10-B16','WCD10-B16-W205-CREATED','V1-ENT-0309','CREATED','V1-ENT-0728','卡洛斯·德鲁蒙德·德·安德拉德创作 Confissões de Minas','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0701','WCD-10-B16','WCD10-B16-W206-CREATED','V1-ENT-0309','CREATED','V1-ENT-0729','卡洛斯·德鲁蒙德·德·安德拉德创作 Passeios na ilha','high','accepted','Codex-parent-independent-review:PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0685','SRC-0746'),
('V1-REL-0686','SRC-0747'),
('V1-REL-0687','SRC-0748'),
('V1-REL-0688','SRC-0749'),
('V1-REL-0689','SRC-0745'),
('V1-REL-0690','SRC-0239'),
('V1-REL-0691','SRC-0753'),
('V1-REL-0691','SRC-0754'),
('V1-REL-0691','SRC-0242'),
('V1-REL-0692','SRC-0753'),
('V1-REL-0692','SRC-0754'),
('V1-REL-0693','SRC-0753'),
('V1-REL-0693','SRC-0754'),
('V1-REL-0694','SRC-0753'),
('V1-REL-0694','SRC-0754'),
('V1-REL-0695','SRC-0753'),
('V1-REL-0695','SRC-0754'),
('V1-REL-0696','SRC-0755'),
('V1-REL-0696','SRC-0244'),
('V1-REL-0697','SRC-0756'),
('V1-REL-0697','SRC-0755'),
('V1-REL-0698','SRC-0244'),
('V1-REL-0698','SRC-0243'),
('V1-REL-0699','SRC-0757'),
('V1-REL-0700','SRC-0755'),
('V1-REL-0701','SRC-0755');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-1026','V1-REL-0685','WCD10-B16-S003','SRC-0746','Poeta chileno — Alejandro Zambra — Editorial Anagrama','第61-65行识别题名/作者并描述小说主题；第77-83行人物与智利诗歌文化的出版社简介。作者年表见S001第62行。实读2026-10-13。','亚历杭德罗·桑布拉创作 Poeta chileno','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1027','V1-REL-0686','WCD10-B16-S004','SRC-0747','Mis documentos — Alejandro Zambra — Editorial Anagrama','第61-63行识别题名/作者；第77-82行称其为短篇集并说明作品结构、记忆与共同历史；第120-123行所示为2018年Compactos版。实读2026-10-13。','亚历杭德罗·桑布拉创作 Mis documentos','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1028','V1-REL-0687','WCD10-B16-S005','SRC-0748','Facsímil — Alejandro Zambra — Editorial Anagrama','第61-63行识别题名/作者；第77-80行说明其借用大学入学选择题形式、由叙事/抒情片段/语言练习构成且初刊于2014；第126-128行记录该Anagrama版日期2021-02-24。实读2026-10-13。','亚历杭德罗·桑布拉创作 Facsímil','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1029','V1-REL-0688','WCD10-B16-S006','SRC-0749','Literatura infantil — Alejandro Zambra — Editorial Anagrama','第61-65行识别题名/作者和日记、致子书信、虚构混合形式；第77-82行讨论童年、亲职与父子关系；第123-125行出版日期2023-05-10。实读2026-10-13。','亚历杭德罗·桑布拉创作 Literatura infantil','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1030','V1-REL-0689','WCD10-B16-S002','SRC-0745','NO LEER — Ediciones UDP','第45-58行：出版者、作者、2010、153页及由编年/文学短论组成、围绕阅读的说明。实读2026-10-13。','亚历杭德罗·桑布拉创作 No leer','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1031','V1-REL-0690','WCD10-B16-S001','SRC-0239','Alejandro Zambra — Editorial Anagrama','页面第61-63行：列出Anagrama出版的小说、短篇集、随笔集及年份；第62行把Tema libre称为随笔集并列2019。实读2026-10-13。','亚历杭德罗·桑布拉创作 Tema libre','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1032','V1-REL-0691','WCD10-B16-S101','SRC-0753','Paulo Coelho | Academia Brasileira de Letras — Bibliografia','实读2026-10-13。第13行列 O Diário de um Mago – O Peregrino，Rio de Janeiro: Rocco, 1987；第17行 Brida 1990；第21行 As Valkírias 1992；第22行 Na Margem do Rio Pedra Eu Sentei e Chorei 1994；第28行 O Monte Cinco 1996；第34/37行另列既有 Veronika Decide Morrer (1998)、O Demônio e a Srta. Prym (2000)。','保罗·柯艾略创作 O Diário de um Mago','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1033','V1-REL-0691','WCD10-B16-S102','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras','实读2026-10-13。第48-52行明确讲述 O Diário de um Mago (1987)、O Alquimista (1988)、Brida (1990，称为romance)、As Valkírias (1992)、Na Margem do Rio Piedra (1994)、Maktub (1994)、O Monte Cinco (1996)、Veronika Decide Morrer (1998)、O Demônio e a Srta. Prym (2000)；并分别简述Brida、Valkírias、Na Margem、Monte Cinco、Veronika、Prym。','保罗·柯艾略创作 O Diário de um Mago','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1034','V1-REL-0691','WCD10-B16-S103','SRC-0242','Coelho, Paulo - Portal Contemporâneo da América Latina e Caribe','实读2026-10-13，第45行列 O diário de um mago (1986)；第42行称其朝圣经历成为该书。','保罗·柯艾略创作 O Diário de um Mago','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1035','V1-REL-0692','WCD10-B16-S101','SRC-0753','Paulo Coelho | Academia Brasileira de Letras — Bibliografia','实读2026-10-13。第13行列 O Diário de um Mago – O Peregrino，Rio de Janeiro: Rocco, 1987；第17行 Brida 1990；第21行 As Valkírias 1992；第22行 Na Margem do Rio Pedra Eu Sentei e Chorei 1994；第28行 O Monte Cinco 1996；第34/37行另列既有 Veronika Decide Morrer (1998)、O Demônio e a Srta. Prym (2000)。','保罗·柯艾略创作 Brida','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1036','V1-REL-0692','WCD10-B16-S102','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras','实读2026-10-13。第48-52行明确讲述 O Diário de um Mago (1987)、O Alquimista (1988)、Brida (1990，称为romance)、As Valkírias (1992)、Na Margem do Rio Piedra (1994)、Maktub (1994)、O Monte Cinco (1996)、Veronika Decide Morrer (1998)、O Demônio e a Srta. Prym (2000)；并分别简述Brida、Valkírias、Na Margem、Monte Cinco、Veronika、Prym。','保罗·柯艾略创作 Brida','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1037','V1-REL-0693','WCD10-B16-S101','SRC-0753','Paulo Coelho | Academia Brasileira de Letras — Bibliografia','实读2026-10-13。第13行列 O Diário de um Mago – O Peregrino，Rio de Janeiro: Rocco, 1987；第17行 Brida 1990；第21行 As Valkírias 1992；第22行 Na Margem do Rio Pedra Eu Sentei e Chorei 1994；第28行 O Monte Cinco 1996；第34/37行另列既有 Veronika Decide Morrer (1998)、O Demônio e a Srta. Prym (2000)。','保罗·柯艾略创作 As Valkírias','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1038','V1-REL-0693','WCD10-B16-S102','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras','实读2026-10-13。第48-52行明确讲述 O Diário de um Mago (1987)、O Alquimista (1988)、Brida (1990，称为romance)、As Valkírias (1992)、Na Margem do Rio Piedra (1994)、Maktub (1994)、O Monte Cinco (1996)、Veronika Decide Morrer (1998)、O Demônio e a Srta. Prym (2000)；并分别简述Brida、Valkírias、Na Margem、Monte Cinco、Veronika、Prym。','保罗·柯艾略创作 As Valkírias','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1039','V1-REL-0694','WCD10-B16-S101','SRC-0753','Paulo Coelho | Academia Brasileira de Letras — Bibliografia','实读2026-10-13。第13行列 O Diário de um Mago – O Peregrino，Rio de Janeiro: Rocco, 1987；第17行 Brida 1990；第21行 As Valkírias 1992；第22行 Na Margem do Rio Pedra Eu Sentei e Chorei 1994；第28行 O Monte Cinco 1996；第34/37行另列既有 Veronika Decide Morrer (1998)、O Demônio e a Srta. Prym (2000)。','保罗·柯艾略创作 Na Margem do Rio Piedra Eu Sentei e Chorei','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1040','V1-REL-0694','WCD10-B16-S102','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras','实读2026-10-13。第48-52行明确讲述 O Diário de um Mago (1987)、O Alquimista (1988)、Brida (1990，称为romance)、As Valkírias (1992)、Na Margem do Rio Piedra (1994)、Maktub (1994)、O Monte Cinco (1996)、Veronika Decide Morrer (1998)、O Demônio e a Srta. Prym (2000)；并分别简述Brida、Valkírias、Na Margem、Monte Cinco、Veronika、Prym。','保罗·柯艾略创作 Na Margem do Rio Piedra Eu Sentei e Chorei','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1041','V1-REL-0695','WCD10-B16-S101','SRC-0753','Paulo Coelho | Academia Brasileira de Letras — Bibliografia','实读2026-10-13。第13行列 O Diário de um Mago – O Peregrino，Rio de Janeiro: Rocco, 1987；第17行 Brida 1990；第21行 As Valkírias 1992；第22行 Na Margem do Rio Pedra Eu Sentei e Chorei 1994；第28行 O Monte Cinco 1996；第34/37行另列既有 Veronika Decide Morrer (1998)、O Demônio e a Srta. Prym (2000)。','保罗·柯艾略创作 O Monte Cinco','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1042','V1-REL-0695','WCD10-B16-S102','SRC-0754','Discurso de recepção de Paulo Coelho — Academia Brasileira de Letras','实读2026-10-13。第48-52行明确讲述 O Diário de um Mago (1987)、O Alquimista (1988)、Brida (1990，称为romance)、As Valkírias (1992)、Na Margem do Rio Piedra (1994)、Maktub (1994)、O Monte Cinco (1996)、Veronika Decide Morrer (1998)、O Demônio e a Srta. Prym (2000)；并分别简述Brida、Valkírias、Na Margem、Monte Cinco、Veronika、Prym。','保罗·柯艾略创作 O Monte Cinco','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1043','V1-REL-0696','WCD10-B16-S201','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)','实读2026-10-13，PDF第29页（网页总行469–483）：Brejo das almas、Sentimento do mundo、A rosa do povo、Claro Enigma、Contos de aprendiz、Confissões de Minas、Passeios na ilha的题名/体裁/年份或作品描述；该段将诗歌转向、战时社会参与及散文/编年文分类直接并列。该书出版信息见网页总行16、41–45。','卡洛斯·德鲁蒙德·德·安德拉德创作 Brejo das almas','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1044','V1-REL-0696','WCD10-B16-S204','SRC-0244','Carlos Drummond de Andrade','实读2026-10-13，BNDigital人物页第45–46行列出《Brejo das Almas》(1934)、《Sentimento do Mundo》(1940)、《José》(1942)、《A Rosa do Povo》(1945)、《Claro Enigma》(1951)，并直接概括各阶段作品内容。','卡洛斯·德鲁蒙德·德·安德拉德创作 Brejo das almas','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1045','V1-REL-0697','WCD10-B16-S202','SRC-0756','Sentimento do mundo — Editora Record','实读2026-10-13，网页第104–127行列题名、作者、1940出版和简要内容；第144–152行是2022年新版本书目日期。','卡洛斯·德鲁蒙德·德·安德拉德创作 Sentimento do mundo','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1046','V1-REL-0697','WCD10-B16-S201','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)','实读2026-10-13，PDF第29页（网页总行469–483）：Brejo das almas、Sentimento do mundo、A rosa do povo、Claro Enigma、Contos de aprendiz、Confissões de Minas、Passeios na ilha的题名/体裁/年份或作品描述；该段将诗歌转向、战时社会参与及散文/编年文分类直接并列。该书出版信息见网页总行16、41–45。','卡洛斯·德鲁蒙德·德·安德拉德创作 Sentimento do mundo','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1047','V1-REL-0698','WCD10-B16-S204','SRC-0244','Carlos Drummond de Andrade','实读2026-10-13，BNDigital人物页第45–46行列出《Brejo das Almas》(1934)、《Sentimento do Mundo》(1940)、《José》(1942)、《A Rosa do Povo》(1945)、《Claro Enigma》(1951)，并直接概括各阶段作品内容。','卡洛斯·德鲁蒙德·德·安德拉德创作 José','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1048','V1-REL-0698','WCD10-B16-S203','SRC-0243','O ano Drummond','实读2026-10-13，Academia Brasileira de Letras《O ano Drummond》网页第20–35行诗歌目录列出《Alguma poesia》(1930)、《Brejo das almas》(1934)、《Sentimento do mundo》(1940)、《José》(1942)、《A rosa do povo》(1945)、《Claro enigma》(1951)。','卡洛斯·德鲁蒙德·德·安德拉德创作 José','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1049','V1-REL-0699','WCD10-B16-S205','SRC-0757','Contos de aprendiz — Editora Record','实读2026-10-13，网页第112–133行列题名、作者、1951年出版、首次进入纯文学虚构叙事及15篇故事和内容说明。','卡洛斯·德鲁蒙德·德·安德拉德创作 Contos de aprendiz','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1050','V1-REL-0700','WCD10-B16-S201','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)','实读2026-10-13，PDF第29页（网页总行469–483）：Brejo das almas、Sentimento do mundo、A rosa do povo、Claro Enigma、Contos de aprendiz、Confissões de Minas、Passeios na ilha的题名/体裁/年份或作品描述；该段将诗歌转向、战时社会参与及散文/编年文分类直接并列。该书出版信息见网页总行16、41–45。','卡洛斯·德鲁蒙德·德·安德拉德创作 Confissões de Minas','high','eligible_evidence','WCD-10-B16'),
('V1-EV-1051','V1-REL-0701','WCD10-B16-S201','SRC-0755','Biografias — Fundação Alexandre de Gusmão (FUNAG)','实读2026-10-13，PDF第29页（网页总行469–483）：Brejo das almas、Sentimento do mundo、A rosa do povo、Claro Enigma、Contos de aprendiz、Confissões de Minas、Passeios na ilha的题名/体裁/年份或作品描述；该段将诗歌转向、战时社会参与及散文/编年文分类直接并列。该书出版信息见网页总行16、41–45。','卡洛斯·德鲁蒙德·德·安德拉德创作 Passeios na ilha','high','eligible_evidence','WCD-10-B16');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0549','WCD-10-B16-G01','research_gap','zambra.full_author_oeuvre','open','本批只处理冻结库三部既有小说及Anagrama/大学出版社直接列示的主要缺项；未逐年穷尽作者早期诗集、其他出版社作品、译本或非图书篇目。','','Independent Reviewer: preserve preserve as out_of_scope; no claim of exhaustive bibliography or academic coverage','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0550','WCD-10-B16-G02','research_gap','WCD10:B16:COELHO:remaining-bibliography-and-form','open','本包已补录ABL/USP作者目录可直接支持的重要作品；未对其余所有书目逐项打开来源，也不以标题猜测体裁。O Diário年份在ABL书目与USP简介间存在1987/1986差异，暂用版本注记并保留首发年份空缺。','','Independent Reviewer: preserve deferred','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0551','WCD-10-B16:V1-ENT-0305','research_gap','WCD10:work_level_research:V1-ENT-0305','open','本行只补一条出版社直接支持的对象级简介；书目与来源闭包已保全，未作作者作品全集或学术研究覆盖完整性判断。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0552','WCD-10-B16:V1-ENT-0306','research_gap','WCD10:work_level_research:V1-ENT-0306','open','本行只补一条出版社直接支持的对象级简介；书目与来源闭包已保全，未作作者作品全集或学术研究覆盖完整性判断。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0553','WCD-10-B16:V1-ENT-0307','research_gap','WCD10:work_level_research:V1-ENT-0307','open','本行只补一条出版社直接支持的对象级简介；书目与来源闭包已保全，未作作者作品全集或学术研究覆盖完整性判断。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0554','WCD-10-B16:WCD10-B16-W001','research_gap','WCD10:work_level_research:V1-ENT-0713','open','出版社或大学出版社目录资料不等于学术研究覆盖；作者完整书目、版本谱系及文学阐释未在本批穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0555','WCD-10-B16:WCD10-B16-W002','research_gap','WCD10:work_level_research:V1-ENT-0714','open','出版社或大学出版社目录资料不等于学术研究覆盖；作者完整书目、版本谱系及文学阐释未在本批穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0556','WCD-10-B16:WCD10-B16-W003','research_gap','WCD10:work_level_research:V1-ENT-0715','open','出版社或大学出版社目录资料不等于学术研究覆盖；作者完整书目、版本谱系及文学阐释未在本批穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0557','WCD-10-B16:WCD10-B16-W004','research_gap','WCD10:work_level_research:V1-ENT-0716','open','出版社或大学出版社目录资料不等于学术研究覆盖；作者完整书目、版本谱系及文学阐释未在本批穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0558','WCD-10-B16:WCD10-B16-W005','research_gap','WCD10:work_level_research:V1-ENT-0717','open','出版社或大学出版社目录资料不等于学术研究覆盖；作者完整书目、版本谱系及文学阐释未在本批穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0559','WCD-10-B16:WCD10-B16-W006','research_gap','WCD10:work_level_research:V1-ENT-0718','open','出版社或大学出版社目录资料不等于学术研究覆盖；作者完整书目、版本谱系及文学阐释未在本批穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0560','WCD-10-B16:V1-ENT-0311','research_gap','WCD10:work_level_research:V1-ENT-0311','open','本行记录有界普通内容；未声称目录穷尽或学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0561','WCD-10-B16:V1-ENT-0312','research_gap','WCD10:work_level_research:V1-ENT-0312','open','本行记录有界普通内容；未声称目录穷尽或学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0562','WCD-10-B16:V1-ENT-0313','research_gap','WCD10:work_level_research:V1-ENT-0313','open','本行记录有界普通内容；未声称目录穷尽或学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0563','WCD-10-B16:WCD10-B16-W101','research_gap','WCD10:work_level_research:V1-ENT-0719','open','作品层学术研究未作完备性判断；保留其余作品和更细体裁研究缺口。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0564','WCD-10-B16:WCD10-B16-W102','research_gap','WCD10:work_level_research:V1-ENT-0720','open','作品层学术研究未作完备性判断；保留其余作品和更细体裁研究缺口。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0565','WCD-10-B16:WCD10-B16-W103','research_gap','WCD10:work_level_research:V1-ENT-0721','open','作品层学术研究未作完备性判断；保留其余作品和更细体裁研究缺口。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0566','WCD-10-B16:WCD10-B16-W104','research_gap','WCD10:work_level_research:V1-ENT-0722','open','作品层学术研究未作完备性判断；保留其余作品和更细体裁研究缺口。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0567','WCD-10-B16:WCD10-B16-W105','research_gap','WCD10:work_level_research:V1-ENT-0723','open','作品层学术研究未作完备性判断；保留其余作品和更细体裁研究缺口。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0568','WCD-10-B16:V1-ENT-0314','research_gap','WCD10:work_level_research:V1-ENT-0314','open','作品层学术研究尚未展开；该项不代表学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0569','WCD-10-B16:V1-ENT-0315','research_gap','WCD10:work_level_research:V1-ENT-0315','open','作品层学术研究尚未展开；该项不代表学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0570','WCD-10-B16:V1-ENT-0316','research_gap','WCD10:work_level_research:V1-ENT-0316','open','作品层学术研究尚未展开；该项不代表学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0571','WCD-10-B16:WCD10-B16-W201','research_gap','WCD10:work_level_research:V1-ENT-0724','open','作品层学术研究尚未展开；本条仅记录直接书目/机构说明，不声称学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0572','WCD-10-B16:WCD10-B16-W202','research_gap','WCD10:work_level_research:V1-ENT-0725','open','作品层学术研究尚未展开；本条仅记录直接书目/机构说明，不声称学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0573','WCD-10-B16:WCD10-B16-W203','research_gap','WCD10:work_level_research:V1-ENT-0726','open','作品层学术研究尚未展开；本条仅记录直接书目/机构说明，不声称学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0574','WCD-10-B16:WCD10-B16-W204','research_gap','WCD10:work_level_research:V1-ENT-0727','open','作品层学术研究尚未展开；本条仅记录直接书目/机构说明，不声称学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0575','WCD-10-B16:WCD10-B16-W205','research_gap','WCD10:work_level_research:V1-ENT-0728','open','作品层学术研究尚未展开；本条仅记录直接书目/机构说明，不声称学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0576','WCD-10-B16:WCD10-B16-W206','research_gap','WCD10:work_level_research:V1-ENT-0729','open','作品层学术研究尚未展开；本条仅记录直接书目/机构说明，不声称学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');

UPDATE metadata SET value='WCD-10-B16' WHERE key='last_change_set';

UPDATE metadata SET value='2026-10-13' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 755 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 727 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 725 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 728 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2437 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 3010 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2416 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1451 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 699 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 1088 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 1059 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 576 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
