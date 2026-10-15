-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: Codex-parent-independent-review

-- Registration sha256: d05600ec245133639596a489608761fbc8436665a916f951958453a99ce74c99

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2478 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1497 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 753 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 743 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 741 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 3109 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2499 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 602 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 52 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 1087 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 1116 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 715 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 762 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B17' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0765' OR canonical_url='https://www.cervantesvirtual.com/portales/sor_juana_ines_de_la_cruz/obra/los-empenos-de-una-casa-923734/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0766' OR canonical_url='https://sibila.iib.unam.mx/index.php/Detail/Object/Show/object_id/1077') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0767' OR canonical_url='https://oceano.mx/obras/el-concepto-de-ficcion-juan-jose-saer-22874.aspx') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0768' OR canonical_url='https://fh.mdp.edu.ar/revistas/index.php/celehis/article/download/3109/3021') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0769' OR canonical_url='https://www.rayoverde.es/catalogo/nadie-nada-nunca/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0770' OR canonical_url='https://www.rayoverde.es/catalogo/el-entenado/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0746' OR (entity_type='work' AND original_name='Los empeños de una casa')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0747' OR (entity_type='collection' AND original_name='Inundación castálida')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0748' OR (entity_type='work' AND original_name='Carta Atenagórica')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0749' OR (entity_type='work' AND original_name='Crónica de San Gabriel')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0750' OR (entity_type='work' AND original_name='Los geniecillos dominicales')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0751' OR (entity_type='work' AND original_name='Cambio de guardia')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0752' OR (entity_type='collection' AND original_name='Prosas apátridas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0753' OR (entity_type='collection' AND original_name='La tentación del fracaso')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0754' OR (entity_type='collection' AND original_name='En la zona')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0755' OR (entity_type='collection' AND original_name='Palo y hueso')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0756' OR (entity_type='collection' AND original_name='Unidad de lugar')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0757' OR (entity_type='collection' AND original_name='La mayor')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0758' OR (entity_type='collection' AND original_name='Lugar')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0759' OR (entity_type='collection' AND original_name='El arte de narrar: poemas 1960/1975')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0760' OR (entity_type='work' AND original_name='Responso')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0761' OR (entity_type='work' AND original_name='Cicatrices')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0762' OR (entity_type='work' AND original_name='Nadie nada nunca')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0763' OR (entity_type='work' AND original_name='El río sin orillas: tratado imaginario')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0764' OR (entity_type='collection' AND original_name='El concepto de ficción')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0765' OR (entity_type='collection' AND original_name='La narración-objeto')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0766' OR (entity_type='work' AND original_name='La ocasión')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2506' OR (subject_id='V1-ENT-0746' AND fact_field='genre_or_form' AND value_text='戏剧')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2507' OR (subject_id='V1-ENT-0746' AND fact_field='one_sentence_summary' AND value_text='一连串爱情与婚姻安排在托莱多交错展开：安娜、佩德罗、胡安、卡洛斯与莱奥诺尔的追求和逃离计划引发多重误会。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2508' OR (subject_id='V1-ENT-0746' AND fact_field='bibliographic_note' AND value_text='Biblioteca Virtual Miguel de Cervantes的电子文本记录作者为Sor Juana Inés de la Cruz，并注明其重印底本为Dolores Bravo编《Teatro mexicano: historia y crítica》（1992），第71–116页；该记录没有给出原作首演或首刊年份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2509' OR (subject_id='V1-ENT-0747' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2510' OR (subject_id='V1-ENT-0747' AND fact_field='first_publication_year' AND value_text='1689')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2511' OR (subject_id='V1-ENT-0747' AND fact_field='one_sentence_summary' AND value_text='这部诗集汇集多种诗体作品，包括十四行诗、罗曼诗、十行诗与节庆颂歌；UNAM目录逐篇列出原版篇目及页码。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2512' OR (subject_id='V1-ENT-0747' AND fact_field='bibliographic_note' AND value_text='UNAM SIBILA将该书著录为索尔·胡安娜的古籍专著，原版印记为马德里 Juan García Infanzón，1689；目录记载328页并列有具体篇目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2513' OR (subject_id='V1-ENT-0748' AND fact_field='genre_or_form' AND value_text='书信/神学论辩散文')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2514' OR (subject_id='V1-ENT-0748' AND fact_field='one_sentence_summary' AND value_text='Sor Juana在文中对Antonio Vieyra关于1650年布道的论述作神学回应；该文随后引发她与自称Sor Filotea的主教之间的书信往来。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2515' OR (subject_id='V1-ENT-0748' AND fact_field='bibliographic_note' AND value_text='UNAM Global记载Carta Atenagórica（又称La crisis de un sermón）写于1690年；此处为写作年份，不作为首刊年份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2516' OR (subject_id='V1-ENT-0749' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2517' OR (subject_id='V1-ENT-0749' AND fact_field='first_publication_year' AND value_text='1960')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2518' OR (subject_id='V1-ENT-0749' AND fact_field='one_sentence_summary' AND value_text='外交部文化中心作品页将故事置于秘鲁内陆的圣加夫列尔庄园，描述一名在首都长大的少年因家庭原因来到庄园后所经历的人际冲突。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2519' OR (subject_id='V1-ENT-0750' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2520' OR (subject_id='V1-ENT-0750' AND fact_field='bibliographic_note' AND value_text='外交部文化中心作者简介第16行称本书于1964年发表；同页出版书目第134–138行列出Populibros Peruanos, Lima, 1965。由于同一页面存在年份口径冲突，本候选不填原子首发年份，保留两处来源表述供独立复核。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2521' OR (subject_id='V1-ENT-0750' AND fact_field='one_sentence_summary' AND value_text='外交部文化中心作品页介绍主人公Ludo Totem在利马社会中经历一连串交往与处境变化，并将其置于家庭、职业及文学圈人物之间。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2522' OR (subject_id='V1-ENT-0751' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2523' OR (subject_id='V1-ENT-0751' AND fact_field='first_publication_year' AND value_text='1976')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2524' OR (subject_id='V1-ENT-0751' AND fact_field='one_sentence_summary' AND value_text='外交部文化中心作品页将故事写作权力政变后，政治变动如何牵连普通人的生活；情节涉及一名糖果小贩被卷入权力人物之间的阴谋。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2525' OR (subject_id='V1-ENT-0752' AND fact_field='genre_or_form' AND value_text='短散文集（含格言、哲学随笔与日记式文本）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2526' OR (subject_id='V1-ENT-0752' AND fact_field='first_publication_year' AND value_text='1975')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2527' OR (subject_id='V1-ENT-0752' AND fact_field='bibliographic_note' AND value_text='外交部文化中心页面列Tusquets 1975版（89篇）、1978年扩充版（150篇）及1986年定本（200篇）；此候选记录首版年份1975，并在注记中保留后续版本篇数。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2528' OR (subject_id='V1-ENT-0752' AND fact_field='one_sentence_summary' AND value_text='外交部文化中心将本书描述为由短篇文本构成，内容介于格言、哲学随笔与日记之间，涉及文学、记忆、遗忘、年龄、童年和爱情等主题。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2529' OR (subject_id='V1-ENT-0753' AND fact_field='genre_or_form' AND value_text='日记集（多卷）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2530' OR (subject_id='V1-ENT-0753' AND fact_field='bibliographic_note' AND value_text='外交部文化中心页面称第一、二卷分别于1992、1993年出版，第三卷于1995年身后出版；另列2003年Seix Barral版并概述该版日记覆盖1950–1978年。因页面呈现多卷出版序列与后出的合版，本候选留空原子首版年份，不把2003年记作首版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2531' OR (subject_id='V1-ENT-0753' AND fact_field='one_sentence_summary' AND value_text='外交部文化中心将其描述为个人日记集，记录作者1950至1978年间在日常生活、旅行和写作过程中的经历。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2532' OR (subject_id='V1-ENT-0754' AND fact_field='genre_or_form' AND value_text='短篇集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2533' OR (subject_id='V1-ENT-0754' AND fact_field='first_publication_year' AND value_text='1960')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2534' OR (subject_id='V1-ENT-0754' AND fact_field='one_sentence_summary' AND value_text='政府文化文章称该书于1960年出版，包含14篇短篇；其中前13篇保留作者对博尔赫斯的敬仰痕迹，末篇“Algo se aproxima”则标记了作者个人文学路径的转折。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2535' OR (subject_id='V1-ENT-0755' AND fact_field='genre_or_form' AND value_text='短篇集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2536' OR (subject_id='V1-ENT-0755' AND fact_field='bibliographic_note' AND value_text='政府文化文章将Palo y hueso列作1965年的短篇集；本文按该条目记录年份，不主张具体版次。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2537' OR (subject_id='V1-ENT-0755' AND fact_field='one_sentence_summary' AND value_text='Argentina.gob.ar将该作品列入Juan José Saer的短篇集书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2538' OR (subject_id='V1-ENT-0756' AND fact_field='genre_or_form' AND value_text='短篇集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2539' OR (subject_id='V1-ENT-0756' AND fact_field='bibliographic_note' AND value_text='政府文化文章将Unidad de lugar列作1967年的短篇集；本文按该条目记录年份，不主张具体版次。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2540' OR (subject_id='V1-ENT-0756' AND fact_field='one_sentence_summary' AND value_text='Argentina.gob.ar将该作品列入Juan José Saer的短篇集书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2541' OR (subject_id='V1-ENT-0757' AND fact_field='genre_or_form' AND value_text='短篇集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2542' OR (subject_id='V1-ENT-0757' AND fact_field='bibliographic_note' AND value_text='政府文化文章将La mayor列作1976年的短篇集；本文按该条目记录年份，不主张具体版次。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2543' OR (subject_id='V1-ENT-0757' AND fact_field='one_sentence_summary' AND value_text='Argentina.gob.ar将该作品列入Juan José Saer的短篇集书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2544' OR (subject_id='V1-ENT-0758' AND fact_field='genre_or_form' AND value_text='短篇集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2545' OR (subject_id='V1-ENT-0758' AND fact_field='bibliographic_note' AND value_text='政府文化文章将Lugar列作2000年的短篇集；本文按该条目记录年份，不主张具体版次。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2546' OR (subject_id='V1-ENT-0758' AND fact_field='one_sentence_summary' AND value_text='Argentina.gob.ar将该作品列入Juan José Saer的短篇集书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2547' OR (subject_id='V1-ENT-0759' AND fact_field='genre_or_form' AND value_text='诗歌汇编')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2548' OR (subject_id='V1-ENT-0759' AND fact_field='bibliographic_note' AND value_text='政府文化文章列出El arte de narrar: poemas 1960/1975（1977）；题名中的1960/1975为诗歌时间范围，括号年份为文章所列书目年份，不主张具体版次。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2549' OR (subject_id='V1-ENT-0759' AND fact_field='one_sentence_summary' AND value_text='Argentina.gob.ar将该作品列入Juan José Saer的诗歌汇编书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2550' OR (subject_id='V1-ENT-0760' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2551' OR (subject_id='V1-ENT-0760' AND fact_field='bibliographic_note' AND value_text='政府文化文章将Responso列为1963年的小说；本文按该条目记录年份，不主张具体版次。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2552' OR (subject_id='V1-ENT-0760' AND fact_field='one_sentence_summary' AND value_text='Argentina.gob.ar将该作品列入Juan José Saer的小说书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2553' OR (subject_id='V1-ENT-0761' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2554' OR (subject_id='V1-ENT-0761' AND fact_field='bibliographic_note' AND value_text='政府文化文章将Cicatrices列为1969年的小说；本文按该条目记录年份，不主张具体版次。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2555' OR (subject_id='V1-ENT-0761' AND fact_field='one_sentence_summary' AND value_text='Argentina.gob.ar将该作品列入Juan José Saer的小说书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2556' OR (subject_id='V1-ENT-0762' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2557' OR (subject_id='V1-ENT-0762' AND fact_field='bibliographic_note' AND value_text='Argentina.gob.ar将错题“Nada nunca nada”列为1980年小说；Rayo Verde出版社页面题名为“Nadie nada nunca”，所示2014年为该版本年份。此处并列记录书目差异，不据此断言首版年份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2558' OR (subject_id='V1-ENT-0762' AND fact_field='one_sentence_summary' AND value_text='小说以河边的炎热夏日为背景，故事围绕一连串马匹被杀展开。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2559' OR (subject_id='V1-ENT-0763' AND fact_field='genre_or_form' AND value_text='随笔')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2560' OR (subject_id='V1-ENT-0763' AND fact_field='bibliographic_note' AND value_text='政府文化文章将El río sin orillas: tratado imaginario列为1991年的随笔/散文作品；本文按该条目记录年份，不主张具体版次。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2561' OR (subject_id='V1-ENT-0763' AND fact_field='one_sentence_summary' AND value_text='Argentina.gob.ar将该作品列入Juan José Saer的随笔书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2562' OR (subject_id='V1-ENT-0764' AND fact_field='genre_or_form' AND value_text='随笔集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2563' OR (subject_id='V1-ENT-0764' AND fact_field='bibliographic_note' AND value_text='Argentina.gob.ar列示1997年书目年份；Editorial Océano所示ISBN版本为2016年版。该差异只作为版本书目注记，不据此确定首版年份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2564' OR (subject_id='V1-ENT-0764' AND fact_field='one_sentence_summary' AND value_text='本书汇集多篇围绕虚构写作与文学思考的随笔。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2565' OR (subject_id='V1-ENT-0765' AND fact_field='genre_or_form' AND value_text='随笔集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2566' OR (subject_id='V1-ENT-0765' AND fact_field='bibliographic_note' AND value_text='Argentina.gob.ar列示1999年书目年份；本包按该书目记年，不推断特定版次。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2567' OR (subject_id='V1-ENT-0765' AND fact_field='one_sentence_summary' AND value_text='本书汇集讲演、序言及围绕文学作品的评论性文字。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2568' OR (subject_id='V1-ENT-0766' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2569' OR (subject_id='V1-ENT-0766' AND fact_field='bibliographic_note' AND value_text='Argentina.gob.ar记载该小说获1987年Nadal奖；奖项年份不据作首版年份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2570' OR (subject_id='V1-ENT-0766' AND fact_field='one_sentence_summary' AND value_text='Argentina.gob.ar将该作品列入Juan José Saer的小说书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2571' OR (subject_id='V1-ENT-0330' AND fact_field='one_sentence_summary' AND value_text='Sor Juana以书信回应自称Sor Filotea的主教对她的劝诫；该回应承接了她此前对Vieyra布道的神学批评。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2572' OR (subject_id='V1-ENT-0331' AND fact_field='one_sentence_summary' AND value_text='一部与Juan de Guevara合作写作、于1689年首演的喜剧。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2573' OR (subject_id='V1-ENT-0331' AND fact_field='bibliographic_note' AND value_text='UNAM Global记载该剧由Sor Juana与Juan de Guevara合作创作，并于1689年首演；现有事实只保留既有已证年份，不改其字段或来源链。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2574' OR (subject_id='V1-ENT-0339' AND fact_field='one_sentence_summary' AND value_text='16世纪西班牙探险队的一名船上少年抵达拉普拉塔河区域后，被Colastinés族捕获并收养。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0718' OR (subject_id='V1-ENT-0322' AND relation_type='CREATED' AND object_id='V1-ENT-0746')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0719' OR (subject_id='V1-ENT-0322' AND relation_type='CREATED' AND object_id='V1-ENT-0747')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0720' OR (subject_id='V1-ENT-0322' AND relation_type='CREATED' AND object_id='V1-ENT-0748')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0721' OR (subject_id='V1-ENT-0332' AND relation_type='CREATED' AND object_id='V1-ENT-0749')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0722' OR (subject_id='V1-ENT-0332' AND relation_type='CREATED' AND object_id='V1-ENT-0750')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0723' OR (subject_id='V1-ENT-0332' AND relation_type='CREATED' AND object_id='V1-ENT-0751')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0724' OR (subject_id='V1-ENT-0332' AND relation_type='CREATED' AND object_id='V1-ENT-0752')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0725' OR (subject_id='V1-ENT-0332' AND relation_type='CREATED' AND object_id='V1-ENT-0753')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0726' OR (subject_id='V1-ENT-0333' AND relation_type='CREATED' AND object_id='V1-ENT-0754')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0727' OR (subject_id='V1-ENT-0333' AND relation_type='CREATED' AND object_id='V1-ENT-0755')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0728' OR (subject_id='V1-ENT-0333' AND relation_type='CREATED' AND object_id='V1-ENT-0756')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0729' OR (subject_id='V1-ENT-0333' AND relation_type='CREATED' AND object_id='V1-ENT-0757')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0730' OR (subject_id='V1-ENT-0333' AND relation_type='CREATED' AND object_id='V1-ENT-0758')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0731' OR (subject_id='V1-ENT-0333' AND relation_type='CREATED' AND object_id='V1-ENT-0759')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0732' OR (subject_id='V1-ENT-0333' AND relation_type='CREATED' AND object_id='V1-ENT-0760')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0733' OR (subject_id='V1-ENT-0333' AND relation_type='CREATED' AND object_id='V1-ENT-0761')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0734' OR (subject_id='V1-ENT-0333' AND relation_type='CREATED' AND object_id='V1-ENT-0762')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0735' OR (subject_id='V1-ENT-0333' AND relation_type='CREATED' AND object_id='V1-ENT-0763')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0736' OR (subject_id='V1-ENT-0333' AND relation_type='CREATED' AND object_id='V1-ENT-0764')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0737' OR (subject_id='V1-ENT-0333' AND relation_type='CREATED' AND object_id='V1-ENT-0765')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0738' OR (subject_id='V1-ENT-0333' AND relation_type='CREATED' AND object_id='V1-ENT-0766')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0765','WCD10-B18-S001','Los empeños de una casa / Sor Juana Inés de la Cruz','Los empeños de una casa / Sor Juana Inés de la Cruz','Biblioteca Virtual Miguel de Cervantes','','Biblioteca Virtual Miguel de Cervantes','','','institutional_ebook_catalog_record','','es','B','access_pass','WCD-10-B18','仅Research候选；未获独立审核和Curation准入前不公开。；Research候选；未经独立审核不得自动进入Curation或公开层。仅书目、体裁与有界作品简介。；仅候选Research内容；未经独立审核不自动进入Curation或公开层。','remote_only；remote_only；未下载或保存来源网页/书籍文件。；remote_only；未下载或本地保存来源网页/作品文件。','','https://www.cervantesvirtual.com/portales/sor_juana_ines_de_la_cruz/obra/los-empenos-de-una-casa-923734/'),
('SRC-0766','WCD10-B18-S002','Inundación castálida de la única poetisa, musa décima, sóror Juana Inés de la Cruz','Inundación castálida de la única poetisa, musa décima, sóror Juana Inés de la Cruz','Sor Juana Inés de la Cruz','','Universidad Nacional Autónoma de México, Instituto de Investigaciones Bibliográficas','1689','','institutional_rare_book_catalog_record','','es','B','access_pass','WCD-10-B18','仅Research候选；未获独立审核和Curation准入前不公开。；Research候选；未经独立审核不得自动进入Curation或公开层。仅书目、体裁与有界作品简介。；仅候选Research内容；未经独立审核不自动进入Curation或公开层。','remote_only；remote_only；未下载或保存来源网页/书籍文件。；remote_only；未下载或本地保存来源网页/作品文件。','','https://sibila.iib.unam.mx/index.php/Detail/Object/Show/object_id/1077'),
('SRC-0767','WCD10-B18-S202','El concepto de ficción — Juan José Saer','El concepto de ficción — Juan José Saer','Editorial Océano','','Editorial Océano','2016','','web_page','','es','B','access_pass','WCD-10-B18','仅Research候选；未获独立审核和Curation准入前不公开。；Research候选；未经独立审核不得自动进入Curation或公开层。仅书目、体裁与有界作品简介。；仅候选Research内容；未经独立审核不自动进入Curation或公开层。','remote_only；remote_only；未下载或保存来源网页/书籍文件。；remote_only；未下载或本地保存来源网页/作品文件。','','https://oceano.mx/obras/el-concepto-de-ficcion-juan-jose-saer-22874.aspx'),
('SRC-0768','WCD10-B18-S203','Platicar cuesta. Juan Rulfo: una moral de la escritura','Platicar cuesta. Juan Rulfo: una moral de la escritura','Celina Manzoni; CeLeHis–Revista del Centro de Letras Hispanoamericanas, Universidad Nacional de Mar del Plata','','','2018','','journal_article_pdf','','es','A','access_pass','WCD-10-B18','仅Research候选；未获独立审核和Curation准入前不公开。；Research候选；未经独立审核不得自动进入Curation或公开层。仅书目、体裁与有界作品简介。；仅候选Research内容；未经独立审核不自动进入Curation或公开层。','remote_only；remote_only；未下载或保存来源网页/书籍文件。；remote_only；未下载或本地保存来源网页/作品文件。','','https://fh.mdp.edu.ar/revistas/index.php/celehis/article/download/3109/3021'),
('SRC-0769','WCD10-B18-S204','Nadie nada nunca — Juan José Saer','Nadie nada nunca — Juan José Saer','Editorial Rayo Verde','','Editorial Rayo Verde','','','web_page','','es','B','access_pass','WCD-10-B18','仅Research候选；未获独立审核和Curation准入前不公开。；Research候选；未经独立审核不得自动进入Curation或公开层。仅书目、体裁与有界作品简介。；仅候选Research内容；未经独立审核不自动进入Curation或公开层。','remote_only；remote_only；未下载或保存来源网页/书籍文件。；remote_only；未下载或本地保存来源网页/作品文件。','','https://www.rayoverde.es/catalogo/nadie-nada-nunca/'),
('SRC-0770','WCD10-B18-S205','El entenado — Juan José Saer','El entenado — Juan José Saer','Editorial Rayo Verde','','Editorial Rayo Verde','','','web_page','','es','B','access_pass','WCD-10-B18','仅Research候选；未获独立审核和Curation准入前不公开。；Research候选；未经独立审核不得自动进入Curation或公开层。仅书目、体裁与有界作品简介。；仅候选Research内容；未经独立审核不自动进入Curation或公开层。','remote_only；remote_only；未下载或保存来源网页/书籍文件。；remote_only；未下载或本地保存来源网页/作品文件。','','https://www.rayoverde.es/catalogo/el-entenado/');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0746','work','《一所房子的纠葛》','Los empeños de una casa','candidate','1','WCD10-B18-W001','Biblioteca Virtual Miguel de Cervantes的Sor Juana作品目录及作品记录直接给出题名、作者、戏剧分类，并提供情节摘要；原作年份未由该记录确认，留空。; 中文为检索工作译名，西班牙语原题是身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0747','collection','《卡斯塔利亚泉涌》','Inundación castálida','candidate','1','WCD10-B18-W002','UNAM SIBILA古籍目录直接著录作者、完整题名、1689年印记和篇目目录；对象为包含多种诗体的作品集。; 中文为检索工作译名，原文题名是身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0748','work','《阿特纳戈里卡书信》','Carta Atenagórica','candidate','1','WCD10-B18-W003','复用UNAM Global既有机构来源SRC-0253。来源称该文又名La crisis de un sermón，记载其于1690年写作，并直接说明它回应Antonio Vieyra于1650年所作布道；年份作为写作年代记入书目注记，不填首刊年。; 中文为检索工作译名，西班牙语原题为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0749','work','《圣加夫列尔纪事》（暂译）','Crónica de San Gabriel','candidate','1','WCD10-B18-W101','外交部文化中心作者专题直接列出作品、体裁/版本信息或作品内容。本候选只提出普通书目与有界释义，不声称全集或学术覆盖。; 中文题名仅作检索用暂译，西班牙语原题为作品身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0750','work','《星期日的小精灵们》（暂译）','Los geniecillos dominicales','candidate','1','WCD10-B18-W102','外交部文化中心作者专题直接列出作品、体裁/版本信息或作品内容。本候选只提出普通书目与有界释义，不声称全集或学术覆盖。; 中文题名仅作检索用暂译，西班牙语原题为作品身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0751','work','《换岗》（暂译）','Cambio de guardia','candidate','1','WCD10-B18-W103','外交部文化中心作者专题直接列出作品、体裁/版本信息或作品内容。本候选只提出普通书目与有界释义，不声称全集或学术覆盖。; 中文题名仅作检索用暂译，西班牙语原题为作品身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0752','collection','《无国籍散文》（暂译）','Prosas apátridas','candidate','1','WCD10-B18-W104','外交部文化中心作者专题直接列出版本书目及作品文本特征。本候选只提出普通书目与有界释义，不声称全集或学术覆盖。; 中文题名仅作检索用暂译，西班牙语原题为作品身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0753','collection','《失败的诱惑》（暂译）','La tentación del fracaso','candidate','1','WCD10-B18-W105','外交部文化中心作者专题直接列出版本书目及作品文本特征。本候选只提出普通书目与有界释义，不声称全集或学术覆盖。; 中文题名仅作检索用暂译，西班牙语原题为作品身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0754','collection','《En la zona》','En la zona','candidate','1','WCD10-B18-W201','Argentina.gob.ar政府文化页面直接记录《En la zona》1960年出版、由14篇短篇构成，并简述末篇“Algo se aproxima”的文学转折；未扩写为全书情节概括。; 中文字段保留西班牙语题名作为检索名，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0755','collection','《Palo y hueso》','Palo y hueso','candidate','1','WCD10-B18-W202','Argentina.gob.ar政府文化页面直接列出该作品及体裁/书目年份；候选仅保存有限书目与来源明确的短简介。; 中文字段保留西班牙语题名作为检索名，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0756','collection','《Unidad de lugar》','Unidad de lugar','candidate','1','WCD10-B18-W203','Argentina.gob.ar政府文化页面直接列出该作品及体裁/书目年份；候选仅保存有限书目与来源明确的短简介。; 中文字段保留西班牙语题名作为检索名，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0757','collection','《La mayor》','La mayor','candidate','1','WCD10-B18-W204','Argentina.gob.ar政府文化页面直接列出该作品及体裁/书目年份；候选仅保存有限书目与来源明确的短简介。; 中文字段保留西班牙语题名作为检索名，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0758','collection','《Lugar》','Lugar','candidate','1','WCD10-B18-W205','Argentina.gob.ar政府文化页面直接列出该作品及体裁/书目年份；候选仅保存有限书目与来源明确的短简介。; 中文字段保留西班牙语题名作为检索名，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0759','collection','《El arte de narrar: poemas 1960/1975》','El arte de narrar: poemas 1960/1975','candidate','1','WCD10-B18-W206','Argentina.gob.ar政府文化页面直接列出该作品及体裁/书目年份；候选仅保存有限书目与来源明确的短简介。; 中文字段保留西班牙语题名作为检索名，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0760','work','《Responso》','Responso','candidate','1','WCD10-B18-W207','Argentina.gob.ar政府文化页面直接列出该作品及体裁/书目年份；候选仅保存有限书目与来源明确的短简介。; 中文字段保留西班牙语题名作为检索名，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0761','work','《Cicatrices》','Cicatrices','candidate','1','WCD10-B18-W208','Argentina.gob.ar政府文化页面直接列出该作品及体裁/书目年份；候选仅保存有限书目与来源明确的短简介。; 中文字段保留西班牙语题名作为检索名，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0762','work','《Nadie nada nunca》','Nadie nada nunca','candidate','1','WCD10-B18-W209','政府文化页列出该小说书目但题名与出版社直接题名不一致；按出版社正式题名Nadie nada nunca规范化，年份冲突仅保留书目注记。; 中文字段保留西班牙语题名作为检索名，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0763','work','《El río sin orillas: tratado imaginario》','El río sin orillas: tratado imaginario','candidate','1','WCD10-B18-W210','Argentina.gob.ar政府文化页面直接列出该作品及体裁/书目年份；候选仅保存有限书目与来源明确的短简介。; 中文字段保留西班牙语题名作为检索名，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0764','collection','《El concepto de ficción》','El concepto de ficción','candidate','1','WCD10-B18-W211','Argentina.gob.ar提供书目线索；Editorial Océano直接说明该书汇集多篇围绕虚构与文学的随笔。; 中文字段保留西班牙语题名作为检索名，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0765','collection','《La narración-objeto》','La narración-objeto','candidate','1','WCD10-B18-W212','Argentina.gob.ar提供书目线索；CeLeHis期刊论文直接称该书汇集讲演、序言及评论性介入，明确本候选指文集层级。; 中文字段保留西班牙语题名作为检索名，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0766','work','《La ocasión》','La ocasión','candidate','1','WCD10-B18-W213','Argentina.gob.ar政府文化页面明确将La ocasión称作小说并记载其获1987年Nadal奖；奖项年份不推断为首版年份。; 中文字段保留西班牙语题名作为检索名，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0742','WCD10-B18-W001','WCD-10-B18','WCD10-B18-W001','V1-ENT-0746','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0743','WCD10-B18-W002','WCD-10-B18','WCD10-B18-W002','V1-ENT-0747','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0744','WCD10-B18-W003','WCD-10-B18','WCD10-B18-W003','V1-ENT-0748','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0745','WCD10-B18-W101','WCD-10-B18','WCD10-B18-W101','V1-ENT-0749','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0746','WCD10-B18-W102','WCD-10-B18','WCD10-B18-W102','V1-ENT-0750','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0747','WCD10-B18-W103','WCD-10-B18','WCD10-B18-W103','V1-ENT-0751','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0748','WCD10-B18-W104','WCD-10-B18','WCD10-B18-W104','V1-ENT-0752','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0749','WCD10-B18-W105','WCD-10-B18','WCD10-B18-W105','V1-ENT-0753','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0750','WCD10-B18-W201','WCD-10-B18','WCD10-B18-W201','V1-ENT-0754','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0751','WCD10-B18-W202','WCD-10-B18','WCD10-B18-W202','V1-ENT-0755','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0752','WCD10-B18-W203','WCD-10-B18','WCD10-B18-W203','V1-ENT-0756','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0753','WCD10-B18-W204','WCD-10-B18','WCD10-B18-W204','V1-ENT-0757','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0754','WCD10-B18-W205','WCD-10-B18','WCD10-B18-W205','V1-ENT-0758','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0755','WCD10-B18-W206','WCD-10-B18','WCD10-B18-W206','V1-ENT-0759','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0756','WCD10-B18-W207','WCD-10-B18','WCD10-B18-W207','V1-ENT-0760','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0757','WCD10-B18-W208','WCD-10-B18','WCD10-B18-W208','V1-ENT-0761','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0758','WCD10-B18-W209','WCD-10-B18','WCD10-B18-W209','V1-ENT-0762','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0759','WCD10-B18-W210','WCD-10-B18','WCD10-B18-W210','V1-ENT-0763','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0760','WCD10-B18-W211','WCD-10-B18','WCD10-B18-W211','V1-ENT-0764','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0761','WCD10-B18-W212','WCD-10-B18','WCD10-B18-W212','V1-ENT-0765','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0762','WCD10-B18-W213','WCD-10-B18','WCD10-B18-W213','V1-ENT-0766','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0754','WCD-10-B18:V1-ENT-0746','V1-ENT-0746','work','《一所房子的纠葛》','索尔·胡安娜·伊内斯·德·拉·克鲁斯','Los empeños de una casa','墨西哥','es','','戏剧','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《一所房子的纠葛》｜Los empeños de una casa

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：戏剧
- one_sentence_summary：一连串爱情与婚姻安排在托莱多交错展开：安娜、佩德罗、胡安、卡洛斯与莱奥诺尔的追求和逃离计划引发多重误会。
- bibliographic_note：Biblioteca Virtual Miguel de Cervantes的电子文本记录作者为Sor Juana Inés de la Cruz，并注明其重印底本为Dolores Bravo编《Teatro mexicano: historia y crítica》（1992），第71–116页；该记录没有给出原作首演或首刊年份。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0755','WCD-10-B18:V1-ENT-0747','V1-ENT-0747','collection','《卡斯塔利亚泉涌》','索尔·胡安娜·伊内斯·德·拉·克鲁斯','Inundación castálida','墨西哥','es','1689','诗集','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《卡斯塔利亚泉涌》｜Inundación castálida

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗集
- first_publication_year：1689
- one_sentence_summary：这部诗集汇集多种诗体作品，包括十四行诗、罗曼诗、十行诗与节庆颂歌；UNAM目录逐篇列出原版篇目及页码。
- bibliographic_note：UNAM SIBILA将该书著录为索尔·胡安娜的古籍专著，原版印记为马德里 Juan García Infanzón，1689；目录记载328页并列有具体篇目。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0756','WCD-10-B18:V1-ENT-0748','V1-ENT-0748','work','《阿特纳戈里卡书信》','索尔·胡安娜·伊内斯·德·拉·克鲁斯','Carta Atenagórica','墨西哥','es','','书信/神学论辩散文','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《阿特纳戈里卡书信》｜Carta Atenagórica

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：书信/神学论辩散文
- one_sentence_summary：Sor Juana在文中对Antonio Vieyra关于1650年布道的论述作神学回应；该文随后引发她与自称Sor Filotea的主教之间的书信往来。
- bibliographic_note：UNAM Global记载Carta Atenagórica（又称La crisis de un sermón）写于1690年；此处为写作年份，不作为首刊年份。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0757','WCD-10-B18:V1-ENT-0749','V1-ENT-0749','work','《圣加夫列尔纪事》（暂译）','胡利奥·拉蒙·里贝罗','Crónica de San Gabriel','秘鲁','es','1960','小说','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《圣加夫列尔纪事》（暂译）｜Crónica de San Gabriel

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- first_publication_year：1960
- one_sentence_summary：外交部文化中心作品页将故事置于秘鲁内陆的圣加夫列尔庄园，描述一名在首都长大的少年因家庭原因来到庄园后所经历的人际冲突。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0758','WCD-10-B18:V1-ENT-0750','V1-ENT-0750','work','《星期日的小精灵们》（暂译）','胡利奥·拉蒙·里贝罗','Los geniecillos dominicales','秘鲁','es','','小说','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《星期日的小精灵们》（暂译）｜Los geniecillos dominicales

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- bibliographic_note：外交部文化中心作者简介第16行称本书于1964年发表；同页出版书目第134–138行列出Populibros Peruanos, Lima, 1965。由于同一页面存在年份口径冲突，本候选不填原子首发年份，保留两处来源表述供独立复核。
- one_sentence_summary：外交部文化中心作品页介绍主人公Ludo Totem在利马社会中经历一连串交往与处境变化，并将其置于家庭、职业及文学圈人物之间。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0759','WCD-10-B18:V1-ENT-0751','V1-ENT-0751','work','《换岗》（暂译）','胡利奥·拉蒙·里贝罗','Cambio de guardia','秘鲁','es','1976','小说','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《换岗》（暂译）｜Cambio de guardia

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- first_publication_year：1976
- one_sentence_summary：外交部文化中心作品页将故事写作权力政变后，政治变动如何牵连普通人的生活；情节涉及一名糖果小贩被卷入权力人物之间的阴谋。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0760','WCD-10-B18:V1-ENT-0752','V1-ENT-0752','collection','《无国籍散文》（暂译）','胡利奥·拉蒙·里贝罗','Prosas apátridas','秘鲁','es','1975','短散文集（含格言、哲学随笔与日记式文本）','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《无国籍散文》（暂译）｜Prosas apátridas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短散文集（含格言、哲学随笔与日记式文本）
- first_publication_year：1975
- bibliographic_note：外交部文化中心页面列Tusquets 1975版（89篇）、1978年扩充版（150篇）及1986年定本（200篇）；此候选记录首版年份1975，并在注记中保留后续版本篇数。
- one_sentence_summary：外交部文化中心将本书描述为由短篇文本构成，内容介于格言、哲学随笔与日记之间，涉及文学、记忆、遗忘、年龄、童年和爱情等主题。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0761','WCD-10-B18:V1-ENT-0753','V1-ENT-0753','collection','《失败的诱惑》（暂译）','胡利奥·拉蒙·里贝罗','La tentación del fracaso','秘鲁','es','','日记集（多卷）','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《失败的诱惑》（暂译）｜La tentación del fracaso

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：日记集（多卷）
- bibliographic_note：外交部文化中心页面称第一、二卷分别于1992、1993年出版，第三卷于1995年身后出版；另列2003年Seix Barral版并概述该版日记覆盖1950–1978年。因页面呈现多卷出版序列与后出的合版，本候选留空原子首版年份，不把2003年记作首版。
- one_sentence_summary：外交部文化中心将其描述为个人日记集，记录作者1950至1978年间在日常生活、旅行和写作过程中的经历。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0762','WCD-10-B18:V1-ENT-0754','V1-ENT-0754','collection','《En la zona》','胡安·何塞·萨埃尔','En la zona','阿根廷','es','1960','短篇集','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《En la zona》｜En la zona

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇集
- first_publication_year：1960
- one_sentence_summary：政府文化文章称该书于1960年出版，包含14篇短篇；其中前13篇保留作者对博尔赫斯的敬仰痕迹，末篇“Algo se aproxima”则标记了作者个人文学路径的转折。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0763','WCD-10-B18:V1-ENT-0755','V1-ENT-0755','collection','《Palo y hueso》','胡安·何塞·萨埃尔','Palo y hueso','阿根廷','es','','短篇集','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Palo y hueso》｜Palo y hueso

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇集
- bibliographic_note：政府文化文章将Palo y hueso列作1965年的短篇集；本文按该条目记录年份，不主张具体版次。
- one_sentence_summary：Argentina.gob.ar将该作品列入Juan José Saer的短篇集书目。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0764','WCD-10-B18:V1-ENT-0756','V1-ENT-0756','collection','《Unidad de lugar》','胡安·何塞·萨埃尔','Unidad de lugar','阿根廷','es','','短篇集','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Unidad de lugar》｜Unidad de lugar

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇集
- bibliographic_note：政府文化文章将Unidad de lugar列作1967年的短篇集；本文按该条目记录年份，不主张具体版次。
- one_sentence_summary：Argentina.gob.ar将该作品列入Juan José Saer的短篇集书目。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0765','WCD-10-B18:V1-ENT-0757','V1-ENT-0757','collection','《La mayor》','胡安·何塞·萨埃尔','La mayor','阿根廷','es','','短篇集','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《La mayor》｜La mayor

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇集
- bibliographic_note：政府文化文章将La mayor列作1976年的短篇集；本文按该条目记录年份，不主张具体版次。
- one_sentence_summary：Argentina.gob.ar将该作品列入Juan José Saer的短篇集书目。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0766','WCD-10-B18:V1-ENT-0758','V1-ENT-0758','collection','《Lugar》','胡安·何塞·萨埃尔','Lugar','阿根廷','es','','短篇集','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Lugar》｜Lugar

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇集
- bibliographic_note：政府文化文章将Lugar列作2000年的短篇集；本文按该条目记录年份，不主张具体版次。
- one_sentence_summary：Argentina.gob.ar将该作品列入Juan José Saer的短篇集书目。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0767','WCD-10-B18:V1-ENT-0759','V1-ENT-0759','collection','《El arte de narrar: poemas 1960/1975》','胡安·何塞·萨埃尔','El arte de narrar: poemas 1960/1975','阿根廷','es','','诗歌汇编','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《El arte de narrar: poemas 1960/1975》｜El arte de narrar: poemas 1960/1975

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗歌汇编
- bibliographic_note：政府文化文章列出El arte de narrar: poemas 1960/1975（1977）；题名中的1960/1975为诗歌时间范围，括号年份为文章所列书目年份，不主张具体版次。
- one_sentence_summary：Argentina.gob.ar将该作品列入Juan José Saer的诗歌汇编书目。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0768','WCD-10-B18:V1-ENT-0760','V1-ENT-0760','work','《Responso》','胡安·何塞·萨埃尔','Responso','阿根廷','es','','小说','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Responso》｜Responso

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- bibliographic_note：政府文化文章将Responso列为1963年的小说；本文按该条目记录年份，不主张具体版次。
- one_sentence_summary：Argentina.gob.ar将该作品列入Juan José Saer的小说书目。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0769','WCD-10-B18:V1-ENT-0761','V1-ENT-0761','work','《Cicatrices》','胡安·何塞·萨埃尔','Cicatrices','阿根廷','es','','小说','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Cicatrices》｜Cicatrices

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- bibliographic_note：政府文化文章将Cicatrices列为1969年的小说；本文按该条目记录年份，不主张具体版次。
- one_sentence_summary：Argentina.gob.ar将该作品列入Juan José Saer的小说书目。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0770','WCD-10-B18:V1-ENT-0762','V1-ENT-0762','work','《Nadie nada nunca》','胡安·何塞·萨埃尔','Nadie nada nunca','阿根廷','es','','小说','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Nadie nada nunca》｜Nadie nada nunca

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- bibliographic_note：Argentina.gob.ar将错题“Nada nunca nada”列为1980年小说；Rayo Verde出版社页面题名为“Nadie nada nunca”，所示2014年为该版本年份。此处并列记录书目差异，不据此断言首版年份。
- one_sentence_summary：小说以河边的炎热夏日为背景，故事围绕一连串马匹被杀展开。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0771','WCD-10-B18:V1-ENT-0763','V1-ENT-0763','work','《El río sin orillas: tratado imaginario》','胡安·何塞·萨埃尔','El río sin orillas: tratado imaginario','阿根廷','es','','随笔','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《El río sin orillas: tratado imaginario》｜El río sin orillas: tratado imaginario

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：随笔
- bibliographic_note：政府文化文章将El río sin orillas: tratado imaginario列为1991年的随笔/散文作品；本文按该条目记录年份，不主张具体版次。
- one_sentence_summary：Argentina.gob.ar将该作品列入Juan José Saer的随笔书目。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0772','WCD-10-B18:V1-ENT-0764','V1-ENT-0764','collection','《El concepto de ficción》','胡安·何塞·萨埃尔','El concepto de ficción','阿根廷','es','','随笔集','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《El concepto de ficción》｜El concepto de ficción

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：随笔集
- bibliographic_note：Argentina.gob.ar列示1997年书目年份；Editorial Océano所示ISBN版本为2016年版。该差异只作为版本书目注记，不据此确定首版年份。
- one_sentence_summary：本书汇集多篇围绕虚构写作与文学思考的随笔。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0773','WCD-10-B18:V1-ENT-0765','V1-ENT-0765','collection','《La narración-objeto》','胡安·何塞·萨埃尔','La narración-objeto','阿根廷','es','','随笔集','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《La narración-objeto》｜La narración-objeto

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：随笔集
- bibliographic_note：Argentina.gob.ar列示1999年书目年份；本包按该书目记年，不推断特定版次。
- one_sentence_summary：本书汇集讲演、序言及围绕文学作品的评论性文字。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0774','WCD-10-B18:V1-ENT-0766','V1-ENT-0766','work','《La ocasión》','胡安·何塞·萨埃尔','La ocasión','阿根廷','es','','小说','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《La ocasión》｜La ocasión

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- bibliographic_note：Argentina.gob.ar记载该小说获1987年Nadal奖；奖项年份不据作首版年份。
- one_sentence_summary：Argentina.gob.ar将该作品列入Juan José Saer的小说书目。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0775','WCD-10-B18:V1-ENT-0330','V1-ENT-0330','work','《答索尔·菲洛特娅》','索尔·胡安娜·伊内斯·德·拉·克鲁斯','Respuesta a Sor Filotea de la Cruz','墨西哥','es','','','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《答索尔·菲洛特娅》｜Respuesta a Sor Filotea de la Cruz

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：Sor Juana以书信回应自称Sor Filotea的主教对她的劝诫；该回应承接了她此前对Vieyra布道的神学批评。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0776','WCD-10-B18:V1-ENT-0331','V1-ENT-0331','work','《爱情是更大的迷宫》','索尔·胡安娜·伊内斯·德·拉·克鲁斯','Amor es más laberinto','墨西哥','es','','','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《爱情是更大的迷宫》｜Amor es más laberinto

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：一部与Juan de Guevara合作写作、于1689年首演的喜剧。
- bibliographic_note：UNAM Global记载该剧由Sor Juana与Juan de Guevara合作创作，并于1689年首演；现有事实只保留既有已证年份，不改其字段或来源链。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0777','WCD-10-B18:V1-ENT-0339','V1-ENT-0339','work','《继子》','胡安·何塞·萨埃尔','El entenado','阿根廷','es','','','WCD-10-B18','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《继子》｜El entenado

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：16世纪西班牙探险队的一名船上少年抵达拉普拉塔河区域后，被Colastinés族捕获并收养。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-2506','WCD10-B18-W001-F01','V1-CARD-0754','V1-ENT-0746','genre_or_form','戏剧','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2507','WCD10-B18-W001-F02','V1-CARD-0754','V1-ENT-0746','one_sentence_summary','一连串爱情与婚姻安排在托莱多交错展开：安娜、佩德罗、胡安、卡洛斯与莱奥诺尔的追求和逃离计划引发多重误会。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2508','WCD10-B18-W001-F03','V1-CARD-0754','V1-ENT-0746','bibliographic_note','Biblioteca Virtual Miguel de Cervantes的电子文本记录作者为Sor Juana Inés de la Cruz，并注明其重印底本为Dolores Bravo编《Teatro mexicano: historia y crítica》（1992），第71–116页；该记录没有给出原作首演或首刊年份。','bibliographic_note','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2509','WCD10-B18-W002-F01','V1-CARD-0755','V1-ENT-0747','genre_or_form','诗集','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2510','WCD10-B18-W002-F02','V1-CARD-0755','V1-ENT-0747','first_publication_year','1689','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2511','WCD10-B18-W002-F03','V1-CARD-0755','V1-ENT-0747','one_sentence_summary','这部诗集汇集多种诗体作品，包括十四行诗、罗曼诗、十行诗与节庆颂歌；UNAM目录逐篇列出原版篇目及页码。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2512','WCD10-B18-W002-F04','V1-CARD-0755','V1-ENT-0747','bibliographic_note','UNAM SIBILA将该书著录为索尔·胡安娜的古籍专著，原版印记为马德里 Juan García Infanzón，1689；目录记载328页并列有具体篇目。','bibliographic_note','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2513','WCD10-B18-W003-F01','V1-CARD-0756','V1-ENT-0748','genre_or_form','书信/神学论辩散文','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2514','WCD10-B18-W003-F02','V1-CARD-0756','V1-ENT-0748','one_sentence_summary','Sor Juana在文中对Antonio Vieyra关于1650年布道的论述作神学回应；该文随后引发她与自称Sor Filotea的主教之间的书信往来。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2515','WCD10-B18-W003-F03','V1-CARD-0756','V1-ENT-0748','bibliographic_note','UNAM Global记载Carta Atenagórica（又称La crisis de un sermón）写于1690年；此处为写作年份，不作为首刊年份。','bibliographic_note','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2516','WCD10-B18-W101-F01','V1-CARD-0757','V1-ENT-0749','genre_or_form','小说','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2517','WCD10-B18-W101-F02','V1-CARD-0757','V1-ENT-0749','first_publication_year','1960','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2518','WCD10-B18-W101-F03','V1-CARD-0757','V1-ENT-0749','one_sentence_summary','外交部文化中心作品页将故事置于秘鲁内陆的圣加夫列尔庄园，描述一名在首都长大的少年因家庭原因来到庄园后所经历的人际冲突。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2519','WCD10-B18-W102-F01','V1-CARD-0758','V1-ENT-0750','genre_or_form','小说','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2520','WCD10-B18-W102-F02','V1-CARD-0758','V1-ENT-0750','bibliographic_note','外交部文化中心作者简介第16行称本书于1964年发表；同页出版书目第134–138行列出Populibros Peruanos, Lima, 1965。由于同一页面存在年份口径冲突，本候选不填原子首发年份，保留两处来源表述供独立复核。','bibliographic_note','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2521','WCD10-B18-W102-F03','V1-CARD-0758','V1-ENT-0750','one_sentence_summary','外交部文化中心作品页介绍主人公Ludo Totem在利马社会中经历一连串交往与处境变化，并将其置于家庭、职业及文学圈人物之间。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2522','WCD10-B18-W103-F01','V1-CARD-0759','V1-ENT-0751','genre_or_form','小说','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2523','WCD10-B18-W103-F02','V1-CARD-0759','V1-ENT-0751','first_publication_year','1976','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2524','WCD10-B18-W103-F03','V1-CARD-0759','V1-ENT-0751','one_sentence_summary','外交部文化中心作品页将故事写作权力政变后，政治变动如何牵连普通人的生活；情节涉及一名糖果小贩被卷入权力人物之间的阴谋。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2525','WCD10-B18-W104-F01','V1-CARD-0760','V1-ENT-0752','genre_or_form','短散文集（含格言、哲学随笔与日记式文本）','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2526','WCD10-B18-W104-F02','V1-CARD-0760','V1-ENT-0752','first_publication_year','1975','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2527','WCD10-B18-W104-F03','V1-CARD-0760','V1-ENT-0752','bibliographic_note','外交部文化中心页面列Tusquets 1975版（89篇）、1978年扩充版（150篇）及1986年定本（200篇）；此候选记录首版年份1975，并在注记中保留后续版本篇数。','bibliographic_note','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2528','WCD10-B18-W104-F04','V1-CARD-0760','V1-ENT-0752','one_sentence_summary','外交部文化中心将本书描述为由短篇文本构成，内容介于格言、哲学随笔与日记之间，涉及文学、记忆、遗忘、年龄、童年和爱情等主题。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2529','WCD10-B18-W105-F01','V1-CARD-0761','V1-ENT-0753','genre_or_form','日记集（多卷）','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2530','WCD10-B18-W105-F02','V1-CARD-0761','V1-ENT-0753','bibliographic_note','外交部文化中心页面称第一、二卷分别于1992、1993年出版，第三卷于1995年身后出版；另列2003年Seix Barral版并概述该版日记覆盖1950–1978年。因页面呈现多卷出版序列与后出的合版，本候选留空原子首版年份，不把2003年记作首版。','bibliographic_note','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2531','WCD10-B18-W105-F03','V1-CARD-0761','V1-ENT-0753','one_sentence_summary','外交部文化中心将其描述为个人日记集，记录作者1950至1978年间在日常生活、旅行和写作过程中的经历。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2532','WCD10-B18-W201-F01','V1-CARD-0762','V1-ENT-0754','genre_or_form','短篇集','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2533','WCD10-B18-W201-F02','V1-CARD-0762','V1-ENT-0754','first_publication_year','1960','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2534','WCD10-B18-W201-F03','V1-CARD-0762','V1-ENT-0754','one_sentence_summary','政府文化文章称该书于1960年出版，包含14篇短篇；其中前13篇保留作者对博尔赫斯的敬仰痕迹，末篇“Algo se aproxima”则标记了作者个人文学路径的转折。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2535','WCD10-B18-W202-F01','V1-CARD-0763','V1-ENT-0755','genre_or_form','短篇集','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2536','WCD10-B18-W202-F02','V1-CARD-0763','V1-ENT-0755','bibliographic_note','政府文化文章将Palo y hueso列作1965年的短篇集；本文按该条目记录年份，不主张具体版次。','bibliographic_note','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2537','WCD10-B18-W202-F03','V1-CARD-0763','V1-ENT-0755','one_sentence_summary','Argentina.gob.ar将该作品列入Juan José Saer的短篇集书目。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2538','WCD10-B18-W203-F01','V1-CARD-0764','V1-ENT-0756','genre_or_form','短篇集','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2539','WCD10-B18-W203-F02','V1-CARD-0764','V1-ENT-0756','bibliographic_note','政府文化文章将Unidad de lugar列作1967年的短篇集；本文按该条目记录年份，不主张具体版次。','bibliographic_note','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2540','WCD10-B18-W203-F03','V1-CARD-0764','V1-ENT-0756','one_sentence_summary','Argentina.gob.ar将该作品列入Juan José Saer的短篇集书目。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2541','WCD10-B18-W204-F01','V1-CARD-0765','V1-ENT-0757','genre_or_form','短篇集','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2542','WCD10-B18-W204-F02','V1-CARD-0765','V1-ENT-0757','bibliographic_note','政府文化文章将La mayor列作1976年的短篇集；本文按该条目记录年份，不主张具体版次。','bibliographic_note','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2543','WCD10-B18-W204-F03','V1-CARD-0765','V1-ENT-0757','one_sentence_summary','Argentina.gob.ar将该作品列入Juan José Saer的短篇集书目。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2544','WCD10-B18-W205-F01','V1-CARD-0766','V1-ENT-0758','genre_or_form','短篇集','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2545','WCD10-B18-W205-F02','V1-CARD-0766','V1-ENT-0758','bibliographic_note','政府文化文章将Lugar列作2000年的短篇集；本文按该条目记录年份，不主张具体版次。','bibliographic_note','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2546','WCD10-B18-W205-F03','V1-CARD-0766','V1-ENT-0758','one_sentence_summary','Argentina.gob.ar将该作品列入Juan José Saer的短篇集书目。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2547','WCD10-B18-W206-F01','V1-CARD-0767','V1-ENT-0759','genre_or_form','诗歌汇编','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2548','WCD10-B18-W206-F02','V1-CARD-0767','V1-ENT-0759','bibliographic_note','政府文化文章列出El arte de narrar: poemas 1960/1975（1977）；题名中的1960/1975为诗歌时间范围，括号年份为文章所列书目年份，不主张具体版次。','bibliographic_note','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2549','WCD10-B18-W206-F03','V1-CARD-0767','V1-ENT-0759','one_sentence_summary','Argentina.gob.ar将该作品列入Juan José Saer的诗歌汇编书目。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2550','WCD10-B18-W207-F01','V1-CARD-0768','V1-ENT-0760','genre_or_form','小说','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2551','WCD10-B18-W207-F02','V1-CARD-0768','V1-ENT-0760','bibliographic_note','政府文化文章将Responso列为1963年的小说；本文按该条目记录年份，不主张具体版次。','bibliographic_note','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2552','WCD10-B18-W207-F03','V1-CARD-0768','V1-ENT-0760','one_sentence_summary','Argentina.gob.ar将该作品列入Juan José Saer的小说书目。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2553','WCD10-B18-W208-F01','V1-CARD-0769','V1-ENT-0761','genre_or_form','小说','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2554','WCD10-B18-W208-F02','V1-CARD-0769','V1-ENT-0761','bibliographic_note','政府文化文章将Cicatrices列为1969年的小说；本文按该条目记录年份，不主张具体版次。','bibliographic_note','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2555','WCD10-B18-W208-F03','V1-CARD-0769','V1-ENT-0761','one_sentence_summary','Argentina.gob.ar将该作品列入Juan José Saer的小说书目。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2556','WCD10-B18-W209-F01','V1-CARD-0770','V1-ENT-0762','genre_or_form','小说','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2557','WCD10-B18-W209-F02','V1-CARD-0770','V1-ENT-0762','bibliographic_note','Argentina.gob.ar将错题“Nada nunca nada”列为1980年小说；Rayo Verde出版社页面题名为“Nadie nada nunca”，所示2014年为该版本年份。此处并列记录书目差异，不据此断言首版年份。','bibliographic_note','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2558','WCD10-B18-W209-F03','V1-CARD-0770','V1-ENT-0762','one_sentence_summary','小说以河边的炎热夏日为背景，故事围绕一连串马匹被杀展开。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2559','WCD10-B18-W210-F01','V1-CARD-0771','V1-ENT-0763','genre_or_form','随笔','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2560','WCD10-B18-W210-F02','V1-CARD-0771','V1-ENT-0763','bibliographic_note','政府文化文章将El río sin orillas: tratado imaginario列为1991年的随笔/散文作品；本文按该条目记录年份，不主张具体版次。','bibliographic_note','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2561','WCD10-B18-W210-F03','V1-CARD-0771','V1-ENT-0763','one_sentence_summary','Argentina.gob.ar将该作品列入Juan José Saer的随笔书目。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2562','WCD10-B18-W211-F01','V1-CARD-0772','V1-ENT-0764','genre_or_form','随笔集','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2563','WCD10-B18-W211-F02','V1-CARD-0772','V1-ENT-0764','bibliographic_note','Argentina.gob.ar列示1997年书目年份；Editorial Océano所示ISBN版本为2016年版。该差异只作为版本书目注记，不据此确定首版年份。','bibliographic_note','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2564','WCD10-B18-W211-F03','V1-CARD-0772','V1-ENT-0764','one_sentence_summary','本书汇集多篇围绕虚构写作与文学思考的随笔。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2565','WCD10-B18-W212-F01','V1-CARD-0773','V1-ENT-0765','genre_or_form','随笔集','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2566','WCD10-B18-W212-F02','V1-CARD-0773','V1-ENT-0765','bibliographic_note','Argentina.gob.ar列示1999年书目年份；本包按该书目记年，不推断特定版次。','bibliographic_note','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2567','WCD10-B18-W212-F03','V1-CARD-0773','V1-ENT-0765','one_sentence_summary','本书汇集讲演、序言及围绕文学作品的评论性文字。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2568','WCD10-B18-W213-F01','V1-CARD-0774','V1-ENT-0766','genre_or_form','小说','bibliographic','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2569','WCD10-B18-W213-F02','V1-CARD-0774','V1-ENT-0766','bibliographic_note','Argentina.gob.ar记载该小说获1987年Nadal奖；奖项年份不据作首版年份。','bibliographic_note','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2570','WCD10-B18-W213-F03','V1-CARD-0774','V1-ENT-0766','one_sentence_summary','Argentina.gob.ar将该作品列入Juan José Saer的小说书目。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2571','WCD10-B18-F001','V1-CARD-0775','V1-ENT-0330','one_sentence_summary','Sor Juana以书信回应自称Sor Filotea的主教对她的劝诫；该回应承接了她此前对Vieyra布道的神学批评。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','仅补充一个由直接机构来源支持的对象简介；旧作品、既有事实、来源链接和关联保持原样。'),
('V1-FCT-2572','WCD10-B18-F002','V1-CARD-0776','V1-ENT-0331','one_sentence_summary','一部与Juan de Guevara合作写作、于1689年首演的喜剧。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','来源只支持合作作者、喜剧类型和1689首演事实；不补写来源未提供的情节。'),
('V1-FCT-2573','WCD10-B18-F003','V1-CARD-0776','V1-ENT-0331','bibliographic_note','UNAM Global记载该剧由Sor Juana与Juan de Guevara合作创作，并于1689年首演；现有事实只保留既有已证年份，不改其字段或来源链。','bibliographic_note','WCD-10-B18','high','batch_retained_candidate','只追加来源明确支持的合作作者与演出地点说明；保留旧作品身份、旧facts与原有来源SRC-0253。'),
('V1-FCT-2574','WCD10-B18-F240','V1-CARD-0777','V1-ENT-0339','one_sentence_summary','16世纪西班牙探险队的一名船上少年抵达拉普拉塔河区域后，被Colastinés族捕获并收养。','institutional_paraphrase','WCD-10-B18','high','batch_retained_candidate','仅增补出版社直接支持的一句情节简介；保留既有实体、书目年1983、事实、卡片、关系、来源链与gap不变；2013仅为当前版年份。');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-2506','SRC-0765','Los empeños de una casa / Sor Juana Inés de la Cruz'),
('V1-FCT-2507','SRC-0765','Los empeños de una casa / Sor Juana Inés de la Cruz'),
('V1-FCT-2508','SRC-0765','Los empeños de una casa / Sor Juana Inés de la Cruz'),
('V1-FCT-2509','SRC-0766','Inundación castálida de la única poetisa, musa décima, sóror Juana Inés de la Cruz'),
('V1-FCT-2510','SRC-0766','Inundación castálida de la única poetisa, musa décima, sóror Juana Inés de la Cruz'),
('V1-FCT-2511','SRC-0766','Inundación castálida de la única poetisa, musa décima, sóror Juana Inés de la Cruz'),
('V1-FCT-2512','SRC-0766','Inundación castálida de la única poetisa, musa décima, sóror Juana Inés de la Cruz'),
('V1-FCT-2513','SRC-0253','Conversación sobre Sor Juana Inés de la Cruz, en Vindictas'),
('V1-FCT-2514','SRC-0253','Conversación sobre Sor Juana Inés de la Cruz, en Vindictas'),
('V1-FCT-2515','SRC-0253','Conversación sobre Sor Juana Inés de la Cruz, en Vindictas'),
('V1-FCT-2516','SRC-0254','Julio Ramón Ribeyro'),
('V1-FCT-2517','SRC-0254','Julio Ramón Ribeyro'),
('V1-FCT-2518','SRC-0254','Julio Ramón Ribeyro'),
('V1-FCT-2519','SRC-0254','Julio Ramón Ribeyro'),
('V1-FCT-2520','SRC-0254','Julio Ramón Ribeyro'),
('V1-FCT-2521','SRC-0254','Julio Ramón Ribeyro'),
('V1-FCT-2522','SRC-0254','Julio Ramón Ribeyro'),
('V1-FCT-2523','SRC-0254','Julio Ramón Ribeyro'),
('V1-FCT-2524','SRC-0254','Julio Ramón Ribeyro'),
('V1-FCT-2525','SRC-0254','Julio Ramón Ribeyro'),
('V1-FCT-2526','SRC-0254','Julio Ramón Ribeyro'),
('V1-FCT-2527','SRC-0254','Julio Ramón Ribeyro'),
('V1-FCT-2528','SRC-0254','Julio Ramón Ribeyro'),
('V1-FCT-2529','SRC-0254','Julio Ramón Ribeyro'),
('V1-FCT-2530','SRC-0254','Julio Ramón Ribeyro'),
('V1-FCT-2531','SRC-0254','Julio Ramón Ribeyro'),
('V1-FCT-2532','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2533','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2534','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2535','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2536','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2537','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2538','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2539','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2540','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2541','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2542','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2543','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2544','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2545','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2546','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2547','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2548','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2549','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2550','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2551','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2552','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2553','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2554','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2555','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2556','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2556','SRC-0769','Nadie nada nunca — Juan José Saer'),
('V1-FCT-2557','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2557','SRC-0769','Nadie nada nunca — Juan José Saer'),
('V1-FCT-2558','SRC-0769','Nadie nada nunca — Juan José Saer'),
('V1-FCT-2559','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2560','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2561','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2562','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2562','SRC-0767','El concepto de ficción — Juan José Saer'),
('V1-FCT-2563','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2563','SRC-0767','El concepto de ficción — Juan José Saer'),
('V1-FCT-2564','SRC-0767','El concepto de ficción — Juan José Saer'),
('V1-FCT-2565','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2565','SRC-0768','Platicar cuesta. Juan Rulfo: una moral de la escritura'),
('V1-FCT-2566','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2566','SRC-0768','Platicar cuesta. Juan Rulfo: una moral de la escritura'),
('V1-FCT-2567','SRC-0768','Platicar cuesta. Juan Rulfo: una moral de la escritura'),
('V1-FCT-2568','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2569','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2570','SRC-0256','Juan José Saer: un narrador en busca de poesía'),
('V1-FCT-2571','SRC-0253','Conversación sobre Sor Juana Inés de la Cruz, en Vindictas'),
('V1-FCT-2572','SRC-0253','Conversación sobre Sor Juana Inés de la Cruz, en Vindictas'),
('V1-FCT-2573','SRC-0253','Conversación sobre Sor Juana Inés de la Cruz, en Vindictas'),
('V1-FCT-2574','SRC-0770','El entenado — Juan José Saer');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0754','V1-FCT-2506','batch_retained_candidate'),
('V1-CARD-0754','V1-FCT-2507','batch_retained_candidate'),
('V1-CARD-0754','V1-FCT-2508','batch_retained_candidate'),
('V1-CARD-0755','V1-FCT-2509','batch_retained_candidate'),
('V1-CARD-0755','V1-FCT-2510','batch_retained_candidate'),
('V1-CARD-0755','V1-FCT-2511','batch_retained_candidate'),
('V1-CARD-0755','V1-FCT-2512','batch_retained_candidate'),
('V1-CARD-0756','V1-FCT-2513','batch_retained_candidate'),
('V1-CARD-0756','V1-FCT-2514','batch_retained_candidate'),
('V1-CARD-0756','V1-FCT-2515','batch_retained_candidate'),
('V1-CARD-0757','V1-FCT-2516','batch_retained_candidate'),
('V1-CARD-0757','V1-FCT-2517','batch_retained_candidate'),
('V1-CARD-0757','V1-FCT-2518','batch_retained_candidate'),
('V1-CARD-0758','V1-FCT-2519','batch_retained_candidate'),
('V1-CARD-0758','V1-FCT-2520','batch_retained_candidate'),
('V1-CARD-0758','V1-FCT-2521','batch_retained_candidate'),
('V1-CARD-0759','V1-FCT-2522','batch_retained_candidate'),
('V1-CARD-0759','V1-FCT-2523','batch_retained_candidate'),
('V1-CARD-0759','V1-FCT-2524','batch_retained_candidate'),
('V1-CARD-0760','V1-FCT-2525','batch_retained_candidate'),
('V1-CARD-0760','V1-FCT-2526','batch_retained_candidate'),
('V1-CARD-0760','V1-FCT-2527','batch_retained_candidate'),
('V1-CARD-0760','V1-FCT-2528','batch_retained_candidate'),
('V1-CARD-0761','V1-FCT-2529','batch_retained_candidate'),
('V1-CARD-0761','V1-FCT-2530','batch_retained_candidate'),
('V1-CARD-0761','V1-FCT-2531','batch_retained_candidate'),
('V1-CARD-0762','V1-FCT-2532','batch_retained_candidate'),
('V1-CARD-0762','V1-FCT-2533','batch_retained_candidate'),
('V1-CARD-0762','V1-FCT-2534','batch_retained_candidate'),
('V1-CARD-0763','V1-FCT-2535','batch_retained_candidate'),
('V1-CARD-0763','V1-FCT-2536','batch_retained_candidate'),
('V1-CARD-0763','V1-FCT-2537','batch_retained_candidate'),
('V1-CARD-0764','V1-FCT-2538','batch_retained_candidate'),
('V1-CARD-0764','V1-FCT-2539','batch_retained_candidate'),
('V1-CARD-0764','V1-FCT-2540','batch_retained_candidate'),
('V1-CARD-0765','V1-FCT-2541','batch_retained_candidate'),
('V1-CARD-0765','V1-FCT-2542','batch_retained_candidate'),
('V1-CARD-0765','V1-FCT-2543','batch_retained_candidate'),
('V1-CARD-0766','V1-FCT-2544','batch_retained_candidate'),
('V1-CARD-0766','V1-FCT-2545','batch_retained_candidate'),
('V1-CARD-0766','V1-FCT-2546','batch_retained_candidate'),
('V1-CARD-0767','V1-FCT-2547','batch_retained_candidate'),
('V1-CARD-0767','V1-FCT-2548','batch_retained_candidate'),
('V1-CARD-0767','V1-FCT-2549','batch_retained_candidate'),
('V1-CARD-0768','V1-FCT-2550','batch_retained_candidate'),
('V1-CARD-0768','V1-FCT-2551','batch_retained_candidate'),
('V1-CARD-0768','V1-FCT-2552','batch_retained_candidate'),
('V1-CARD-0769','V1-FCT-2553','batch_retained_candidate'),
('V1-CARD-0769','V1-FCT-2554','batch_retained_candidate'),
('V1-CARD-0769','V1-FCT-2555','batch_retained_candidate'),
('V1-CARD-0770','V1-FCT-2556','batch_retained_candidate'),
('V1-CARD-0770','V1-FCT-2557','batch_retained_candidate'),
('V1-CARD-0770','V1-FCT-2558','batch_retained_candidate'),
('V1-CARD-0771','V1-FCT-2559','batch_retained_candidate'),
('V1-CARD-0771','V1-FCT-2560','batch_retained_candidate'),
('V1-CARD-0771','V1-FCT-2561','batch_retained_candidate'),
('V1-CARD-0772','V1-FCT-2562','batch_retained_candidate'),
('V1-CARD-0772','V1-FCT-2563','batch_retained_candidate'),
('V1-CARD-0772','V1-FCT-2564','batch_retained_candidate'),
('V1-CARD-0773','V1-FCT-2565','batch_retained_candidate'),
('V1-CARD-0773','V1-FCT-2566','batch_retained_candidate'),
('V1-CARD-0773','V1-FCT-2567','batch_retained_candidate'),
('V1-CARD-0774','V1-FCT-2568','batch_retained_candidate'),
('V1-CARD-0774','V1-FCT-2569','batch_retained_candidate'),
('V1-CARD-0774','V1-FCT-2570','batch_retained_candidate'),
('V1-CARD-0775','V1-FCT-2571','batch_retained_candidate'),
('V1-CARD-0776','V1-FCT-2572','batch_retained_candidate'),
('V1-CARD-0776','V1-FCT-2573','batch_retained_candidate'),
('V1-CARD-0777','V1-FCT-2574','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-1506','WCD10-B18-S001','V1-CARD-0754','SRC-0765','B','bibliography_or_bounded_description','yes','no','SRC-0765','accepted','NONE'),
('V1-CS-1507','WCD10-B18-S002','V1-CARD-0755','SRC-0766','B','bibliography_or_bounded_description','yes','no','SRC-0766','accepted','NONE'),
('V1-CS-1508','WCD10-B18-S003','V1-CARD-0756','SRC-0253','B','bibliography_or_bounded_description','yes','no','SRC-0253','accepted','NONE'),
('V1-CS-1509','WCD10-B18-S101','V1-CARD-0757','SRC-0254','B','bibliography_or_bounded_description','yes','no','SRC-0254','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1510','WCD10-B18-S101','V1-CARD-0758','SRC-0254','B','bibliography_or_bounded_description','yes','no','SRC-0254','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1511','WCD10-B18-S101','V1-CARD-0759','SRC-0254','B','bibliography_or_bounded_description','yes','no','SRC-0254','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1512','WCD10-B18-S101','V1-CARD-0760','SRC-0254','B','bibliography_or_bounded_description','yes','no','SRC-0254','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1513','WCD10-B18-S101','V1-CARD-0761','SRC-0254','B','bibliography_or_bounded_description','yes','no','SRC-0254','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1514','WCD10-B18-S201','V1-CARD-0762','SRC-0256','B','bibliography_or_bounded_description','yes','no','SRC-0256','accepted','NONE'),
('V1-CS-1515','WCD10-B18-S201','V1-CARD-0763','SRC-0256','B','bibliography_or_bounded_description','yes','no','SRC-0256','accepted','NONE'),
('V1-CS-1516','WCD10-B18-S201','V1-CARD-0764','SRC-0256','B','bibliography_or_bounded_description','yes','no','SRC-0256','accepted','NONE'),
('V1-CS-1517','WCD10-B18-S201','V1-CARD-0765','SRC-0256','B','bibliography_or_bounded_description','yes','no','SRC-0256','accepted','NONE'),
('V1-CS-1518','WCD10-B18-S201','V1-CARD-0766','SRC-0256','B','bibliography_or_bounded_description','yes','no','SRC-0256','accepted','NONE'),
('V1-CS-1519','WCD10-B18-S201','V1-CARD-0767','SRC-0256','B','bibliography_or_bounded_description','yes','no','SRC-0256','accepted','NONE'),
('V1-CS-1520','WCD10-B18-S201','V1-CARD-0768','SRC-0256','B','bibliography_or_bounded_description','yes','no','SRC-0256','accepted','NONE'),
('V1-CS-1521','WCD10-B18-S201','V1-CARD-0769','SRC-0256','B','bibliography_or_bounded_description','yes','no','SRC-0256','accepted','NONE'),
('V1-CS-1522','WCD10-B18-S201','V1-CARD-0770','SRC-0256','B','bibliography_or_bounded_description','yes','no','SRC-0256','accepted','NONE'),
('V1-CS-1523','WCD10-B18-S204','V1-CARD-0770','SRC-0769','B','bibliography_or_bounded_description','yes','no','SRC-0769','accepted','NONE'),
('V1-CS-1524','WCD10-B18-S201','V1-CARD-0771','SRC-0256','B','bibliography_or_bounded_description','yes','no','SRC-0256','accepted','NONE'),
('V1-CS-1525','WCD10-B18-S201','V1-CARD-0772','SRC-0256','B','bibliography_or_bounded_description','yes','no','SRC-0256','accepted','NONE'),
('V1-CS-1526','WCD10-B18-S202','V1-CARD-0772','SRC-0767','B','bibliography_or_bounded_description','yes','no','SRC-0767','accepted','NONE'),
('V1-CS-1527','WCD10-B18-S201','V1-CARD-0773','SRC-0256','B','bibliography_or_bounded_description','yes','no','SRC-0256','accepted','NONE'),
('V1-CS-1528','WCD10-B18-S203','V1-CARD-0773','SRC-0768','A','bibliography_or_bounded_description','yes','no','SRC-0768','accepted','NONE'),
('V1-CS-1529','WCD10-B18-S201','V1-CARD-0774','SRC-0256','B','bibliography_or_bounded_description','yes','no','SRC-0256','accepted','NONE'),
('V1-CS-1530','WCD10-B18-S003','V1-CARD-0775','SRC-0253','B','bibliography_or_bounded_description','no','no','SRC-0253','accepted','NONE'),
('V1-CS-1531','WCD10-B18-S003','V1-CARD-0776','SRC-0253','B','bibliography_or_bounded_description','yes','no','SRC-0253','accepted','NONE'),
('V1-CS-1532','WCD10-B18-S205','V1-CARD-0777','SRC-0770','B','bibliography_or_bounded_description','no','no','SRC-0770','accepted','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0718','WCD-10-B18','WCD10-B18-W001-CREATED','V1-ENT-0322','CREATED','V1-ENT-0746','索尔·胡安娜·伊内斯·德·拉·克鲁斯创作 Los empeños de una casa','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0719','WCD-10-B18','WCD10-B18-W002-CREATED','V1-ENT-0322','CREATED','V1-ENT-0747','索尔·胡安娜·伊内斯·德·拉·克鲁斯创作 Inundación castálida','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0720','WCD-10-B18','WCD10-B18-W003-CREATED','V1-ENT-0322','CREATED','V1-ENT-0748','索尔·胡安娜·伊内斯·德·拉·克鲁斯创作 Carta Atenagórica','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0721','WCD-10-B18','WCD10-B18-W101-CREATED','V1-ENT-0332','CREATED','V1-ENT-0749','胡利奥·拉蒙·里贝罗创作 Crónica de San Gabriel','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0722','WCD-10-B18','WCD10-B18-W102-CREATED','V1-ENT-0332','CREATED','V1-ENT-0750','胡利奥·拉蒙·里贝罗创作 Los geniecillos dominicales','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0723','WCD-10-B18','WCD10-B18-W103-CREATED','V1-ENT-0332','CREATED','V1-ENT-0751','胡利奥·拉蒙·里贝罗创作 Cambio de guardia','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0724','WCD-10-B18','WCD10-B18-W104-CREATED','V1-ENT-0332','CREATED','V1-ENT-0752','胡利奥·拉蒙·里贝罗创作 Prosas apátridas','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0725','WCD-10-B18','WCD10-B18-W105-CREATED','V1-ENT-0332','CREATED','V1-ENT-0753','胡利奥·拉蒙·里贝罗创作 La tentación del fracaso','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0726','WCD-10-B18','WCD10-B18-W201-CREATED','V1-ENT-0333','CREATED','V1-ENT-0754','胡安·何塞·萨埃尔创作 En la zona','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0727','WCD-10-B18','WCD10-B18-W202-CREATED','V1-ENT-0333','CREATED','V1-ENT-0755','胡安·何塞·萨埃尔创作 Palo y hueso','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0728','WCD-10-B18','WCD10-B18-W203-CREATED','V1-ENT-0333','CREATED','V1-ENT-0756','胡安·何塞·萨埃尔创作 Unidad de lugar','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0729','WCD-10-B18','WCD10-B18-W204-CREATED','V1-ENT-0333','CREATED','V1-ENT-0757','胡安·何塞·萨埃尔创作 La mayor','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0730','WCD-10-B18','WCD10-B18-W205-CREATED','V1-ENT-0333','CREATED','V1-ENT-0758','胡安·何塞·萨埃尔创作 Lugar','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0731','WCD-10-B18','WCD10-B18-W206-CREATED','V1-ENT-0333','CREATED','V1-ENT-0759','胡安·何塞·萨埃尔创作 El arte de narrar: poemas 1960/1975','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0732','WCD-10-B18','WCD10-B18-W207-CREATED','V1-ENT-0333','CREATED','V1-ENT-0760','胡安·何塞·萨埃尔创作 Responso','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0733','WCD-10-B18','WCD10-B18-W208-CREATED','V1-ENT-0333','CREATED','V1-ENT-0761','胡安·何塞·萨埃尔创作 Cicatrices','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0734','WCD-10-B18','WCD10-B18-W209-CREATED','V1-ENT-0333','CREATED','V1-ENT-0762','胡安·何塞·萨埃尔创作 Nadie nada nunca','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0735','WCD-10-B18','WCD10-B18-W210-CREATED','V1-ENT-0333','CREATED','V1-ENT-0763','胡安·何塞·萨埃尔创作 El río sin orillas: tratado imaginario','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0736','WCD-10-B18','WCD10-B18-W211-CREATED','V1-ENT-0333','CREATED','V1-ENT-0764','胡安·何塞·萨埃尔创作 El concepto de ficción','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0737','WCD-10-B18','WCD10-B18-W212-CREATED','V1-ENT-0333','CREATED','V1-ENT-0765','胡安·何塞·萨埃尔创作 La narración-objeto','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0738','WCD-10-B18','WCD10-B18-W213-CREATED','V1-ENT-0333','CREATED','V1-ENT-0766','胡安·何塞·萨埃尔创作 La ocasión','high','accepted','Codex-parent-independent-review:PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0718','SRC-0765'),
('V1-REL-0719','SRC-0766'),
('V1-REL-0720','SRC-0253'),
('V1-REL-0721','SRC-0254'),
('V1-REL-0722','SRC-0254'),
('V1-REL-0723','SRC-0254'),
('V1-REL-0724','SRC-0254'),
('V1-REL-0725','SRC-0254'),
('V1-REL-0726','SRC-0256'),
('V1-REL-0727','SRC-0256'),
('V1-REL-0728','SRC-0256'),
('V1-REL-0729','SRC-0256'),
('V1-REL-0730','SRC-0256'),
('V1-REL-0731','SRC-0256'),
('V1-REL-0732','SRC-0256'),
('V1-REL-0733','SRC-0256'),
('V1-REL-0734','SRC-0256'),
('V1-REL-0734','SRC-0769'),
('V1-REL-0735','SRC-0256'),
('V1-REL-0736','SRC-0256'),
('V1-REL-0736','SRC-0767'),
('V1-REL-0737','SRC-0256'),
('V1-REL-0737','SRC-0768'),
('V1-REL-0738','SRC-0256');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-1080','V1-REL-0718','WCD10-B18-S001','SRC-0765','Los empeños de una casa / Sor Juana Inés de la Cruz','实读2026-10-14：第65–91行的电子书书目记录列出作品题名和Sor Juana作者、数字电子书出版年2022、1992年重印底本出处、剧场主题标目/戏剧分类号，并给出托莱多场景、人物及误会情节摘要。','索尔·胡安娜·伊内斯·德·拉·克鲁斯创作 Los empeños de una casa','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1081','V1-REL-0719','WCD10-B18-S002','SRC-0766','Inundación castálida de la única poetisa, musa décima, sóror Juana Inés de la Cruz','实读2026-10-14：第19–24行著录该对象为古籍专著，列作者、完整题名、马德里Juan García Infanzón 1689印记及328页；第25–121行展示具体作品及体裁目录，包括sonetos、romances、redondillas、loas和ovillejos。','索尔·胡安娜·伊内斯·德·拉·克鲁斯创作 Inundación castálida','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1082','V1-REL-0720','WCD10-B18-S003','SRC-0253','Conversación sobre Sor Juana Inés de la Cruz, en Vindictas','实读2026-10-14：第32–34行。第32行记《Los empeños de una casa》于1683年在墨西哥城演出、《Inundación Castálida》于1689年在马德里出版；第33行明确《Amor es más laberinto》为Sor Juana与Juan de Guevara合作创作、1689年首演；第34行记Carta Atenagórica于1690年写作、回应Vieyra于1650年所作布道，并与Respuesta的书信回应关系。','索尔·胡安娜·伊内斯·德·拉·克鲁斯创作 Carta Atenagórica','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1083','V1-REL-0721','WCD10-B18-S101','SRC-0254','Julio Ramón Ribeyro','实际打开外交部文化中心页面：正文第15–16行及出版书目段落第127–145行。第127–132行列Crónica de San Gabriel、Ediciones Tawantinsuyo、1960，并概述少年Lucho进入内陆庄园生活；第134–138行列Los geniecillos dominicales，书目为Lima, Populibros Peruanos, 1965，概述Ludo Totem在利马与不同社会人物交往；作者生平第16行称其1964年发表该小说，形成同页年份冲突；第139–145行列Cambio de guardia，Milla Batres, 1976，并概述政变后的权力更迭及个人遭际。实读2026-10-14。 实际打开外交部文化中心页面：第90–99行列La tentación del fracaso日记各卷，第一、二卷分别于1992、1993年出版，第三卷1995年身后出版；另列Seix Barral 2003年合版。第110–114行列Prosas apátridas，Tusquets 1975初版89篇，1978扩至150篇，1986定本200篇，并说明内容介于格言、哲学随笔和日记。实读2026-10-14。','胡利奥·拉蒙·里贝罗创作 Crónica de San Gabriel','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1084','V1-REL-0722','WCD10-B18-S101','SRC-0254','Julio Ramón Ribeyro','实际打开外交部文化中心页面：正文第15–16行及出版书目段落第127–145行。第127–132行列Crónica de San Gabriel、Ediciones Tawantinsuyo、1960，并概述少年Lucho进入内陆庄园生活；第134–138行列Los geniecillos dominicales，书目为Lima, Populibros Peruanos, 1965，概述Ludo Totem在利马与不同社会人物交往；作者生平第16行称其1964年发表该小说，形成同页年份冲突；第139–145行列Cambio de guardia，Milla Batres, 1976，并概述政变后的权力更迭及个人遭际。实读2026-10-14。 实际打开外交部文化中心页面：第90–99行列La tentación del fracaso日记各卷，第一、二卷分别于1992、1993年出版，第三卷1995年身后出版；另列Seix Barral 2003年合版。第110–114行列Prosas apátridas，Tusquets 1975初版89篇，1978扩至150篇，1986定本200篇，并说明内容介于格言、哲学随笔和日记。实读2026-10-14。','胡利奥·拉蒙·里贝罗创作 Los geniecillos dominicales','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1085','V1-REL-0723','WCD10-B18-S101','SRC-0254','Julio Ramón Ribeyro','实际打开外交部文化中心页面：正文第15–16行及出版书目段落第127–145行。第127–132行列Crónica de San Gabriel、Ediciones Tawantinsuyo、1960，并概述少年Lucho进入内陆庄园生活；第134–138行列Los geniecillos dominicales，书目为Lima, Populibros Peruanos, 1965，概述Ludo Totem在利马与不同社会人物交往；作者生平第16行称其1964年发表该小说，形成同页年份冲突；第139–145行列Cambio de guardia，Milla Batres, 1976，并概述政变后的权力更迭及个人遭际。实读2026-10-14。 实际打开外交部文化中心页面：第90–99行列La tentación del fracaso日记各卷，第一、二卷分别于1992、1993年出版，第三卷1995年身后出版；另列Seix Barral 2003年合版。第110–114行列Prosas apátridas，Tusquets 1975初版89篇，1978扩至150篇，1986定本200篇，并说明内容介于格言、哲学随笔和日记。实读2026-10-14。','胡利奥·拉蒙·里贝罗创作 Cambio de guardia','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1086','V1-REL-0724','WCD10-B18-S101','SRC-0254','Julio Ramón Ribeyro','实际打开外交部文化中心页面：正文第15–16行及出版书目段落第127–145行。第127–132行列Crónica de San Gabriel、Ediciones Tawantinsuyo、1960，并概述少年Lucho进入内陆庄园生活；第134–138行列Los geniecillos dominicales，书目为Lima, Populibros Peruanos, 1965，概述Ludo Totem在利马与不同社会人物交往；作者生平第16行称其1964年发表该小说，形成同页年份冲突；第139–145行列Cambio de guardia，Milla Batres, 1976，并概述政变后的权力更迭及个人遭际。实读2026-10-14。 实际打开外交部文化中心页面：第90–99行列La tentación del fracaso日记各卷，第一、二卷分别于1992、1993年出版，第三卷1995年身后出版；另列Seix Barral 2003年合版。第110–114行列Prosas apátridas，Tusquets 1975初版89篇，1978扩至150篇，1986定本200篇，并说明内容介于格言、哲学随笔和日记。实读2026-10-14。','胡利奥·拉蒙·里贝罗创作 Prosas apátridas','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1087','V1-REL-0725','WCD10-B18-S101','SRC-0254','Julio Ramón Ribeyro','实际打开外交部文化中心页面：正文第15–16行及出版书目段落第127–145行。第127–132行列Crónica de San Gabriel、Ediciones Tawantinsuyo、1960，并概述少年Lucho进入内陆庄园生活；第134–138行列Los geniecillos dominicales，书目为Lima, Populibros Peruanos, 1965，概述Ludo Totem在利马与不同社会人物交往；作者生平第16行称其1964年发表该小说，形成同页年份冲突；第139–145行列Cambio de guardia，Milla Batres, 1976，并概述政变后的权力更迭及个人遭际。实读2026-10-14。 实际打开外交部文化中心页面：第90–99行列La tentación del fracaso日记各卷，第一、二卷分别于1992、1993年出版，第三卷1995年身后出版；另列Seix Barral 2003年合版。第110–114行列Prosas apátridas，Tusquets 1975初版89篇，1978扩至150篇，1986定本200篇，并说明内容介于格言、哲学随笔和日记。实读2026-10-14。','胡利奥·拉蒙·里贝罗创作 La tentación del fracaso','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1088','V1-REL-0726','WCD10-B18-S201','SRC-0256','Juan José Saer: un narrador en busca de poesía','实读2026-10-14，Argentina.gob.ar正文第24–25行说明《En la zona》1960年出版、由14篇短篇构成并点出末篇“Algo se aproxima”；第32–33行列出短篇集Palo y hueso（1965）、Unidad de lugar（1967）、La mayor（1976）、Lugar（2000），诗歌汇编El arte de narrar: poemas 1960/1975（1977），小说Responso（1963）、Cicatrices（1969）、El limonero real（1974）、Nada nunca nada（1980）、El entenado（1983）、Glosa（1986）及散文集El río sin orillas: tratado imaginario（1991）、El concepto de ficción（1997）、La narración-objeto（1999）；第42行明确《La ocasión》获1987年Nadal奖，未据此推断首版年份。','胡安·何塞·萨埃尔创作 En la zona','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1089','V1-REL-0727','WCD10-B18-S201','SRC-0256','Juan José Saer: un narrador en busca de poesía','实读2026-10-14，Argentina.gob.ar正文第24–25行说明《En la zona》1960年出版、由14篇短篇构成并点出末篇“Algo se aproxima”；第32–33行列出短篇集Palo y hueso（1965）、Unidad de lugar（1967）、La mayor（1976）、Lugar（2000），诗歌汇编El arte de narrar: poemas 1960/1975（1977），小说Responso（1963）、Cicatrices（1969）、El limonero real（1974）、Nada nunca nada（1980）、El entenado（1983）、Glosa（1986）及散文集El río sin orillas: tratado imaginario（1991）、El concepto de ficción（1997）、La narración-objeto（1999）；第42行明确《La ocasión》获1987年Nadal奖，未据此推断首版年份。','胡安·何塞·萨埃尔创作 Palo y hueso','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1090','V1-REL-0728','WCD10-B18-S201','SRC-0256','Juan José Saer: un narrador en busca de poesía','实读2026-10-14，Argentina.gob.ar正文第24–25行说明《En la zona》1960年出版、由14篇短篇构成并点出末篇“Algo se aproxima”；第32–33行列出短篇集Palo y hueso（1965）、Unidad de lugar（1967）、La mayor（1976）、Lugar（2000），诗歌汇编El arte de narrar: poemas 1960/1975（1977），小说Responso（1963）、Cicatrices（1969）、El limonero real（1974）、Nada nunca nada（1980）、El entenado（1983）、Glosa（1986）及散文集El río sin orillas: tratado imaginario（1991）、El concepto de ficción（1997）、La narración-objeto（1999）；第42行明确《La ocasión》获1987年Nadal奖，未据此推断首版年份。','胡安·何塞·萨埃尔创作 Unidad de lugar','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1091','V1-REL-0729','WCD10-B18-S201','SRC-0256','Juan José Saer: un narrador en busca de poesía','实读2026-10-14，Argentina.gob.ar正文第24–25行说明《En la zona》1960年出版、由14篇短篇构成并点出末篇“Algo se aproxima”；第32–33行列出短篇集Palo y hueso（1965）、Unidad de lugar（1967）、La mayor（1976）、Lugar（2000），诗歌汇编El arte de narrar: poemas 1960/1975（1977），小说Responso（1963）、Cicatrices（1969）、El limonero real（1974）、Nada nunca nada（1980）、El entenado（1983）、Glosa（1986）及散文集El río sin orillas: tratado imaginario（1991）、El concepto de ficción（1997）、La narración-objeto（1999）；第42行明确《La ocasión》获1987年Nadal奖，未据此推断首版年份。','胡安·何塞·萨埃尔创作 La mayor','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1092','V1-REL-0730','WCD10-B18-S201','SRC-0256','Juan José Saer: un narrador en busca de poesía','实读2026-10-14，Argentina.gob.ar正文第24–25行说明《En la zona》1960年出版、由14篇短篇构成并点出末篇“Algo se aproxima”；第32–33行列出短篇集Palo y hueso（1965）、Unidad de lugar（1967）、La mayor（1976）、Lugar（2000），诗歌汇编El arte de narrar: poemas 1960/1975（1977），小说Responso（1963）、Cicatrices（1969）、El limonero real（1974）、Nada nunca nada（1980）、El entenado（1983）、Glosa（1986）及散文集El río sin orillas: tratado imaginario（1991）、El concepto de ficción（1997）、La narración-objeto（1999）；第42行明确《La ocasión》获1987年Nadal奖，未据此推断首版年份。','胡安·何塞·萨埃尔创作 Lugar','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1093','V1-REL-0731','WCD10-B18-S201','SRC-0256','Juan José Saer: un narrador en busca de poesía','实读2026-10-14，Argentina.gob.ar正文第24–25行说明《En la zona》1960年出版、由14篇短篇构成并点出末篇“Algo se aproxima”；第32–33行列出短篇集Palo y hueso（1965）、Unidad de lugar（1967）、La mayor（1976）、Lugar（2000），诗歌汇编El arte de narrar: poemas 1960/1975（1977），小说Responso（1963）、Cicatrices（1969）、El limonero real（1974）、Nada nunca nada（1980）、El entenado（1983）、Glosa（1986）及散文集El río sin orillas: tratado imaginario（1991）、El concepto de ficción（1997）、La narración-objeto（1999）；第42行明确《La ocasión》获1987年Nadal奖，未据此推断首版年份。','胡安·何塞·萨埃尔创作 El arte de narrar: poemas 1960/1975','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1094','V1-REL-0732','WCD10-B18-S201','SRC-0256','Juan José Saer: un narrador en busca de poesía','实读2026-10-14，Argentina.gob.ar正文第24–25行说明《En la zona》1960年出版、由14篇短篇构成并点出末篇“Algo se aproxima”；第32–33行列出短篇集Palo y hueso（1965）、Unidad de lugar（1967）、La mayor（1976）、Lugar（2000），诗歌汇编El arte de narrar: poemas 1960/1975（1977），小说Responso（1963）、Cicatrices（1969）、El limonero real（1974）、Nada nunca nada（1980）、El entenado（1983）、Glosa（1986）及散文集El río sin orillas: tratado imaginario（1991）、El concepto de ficción（1997）、La narración-objeto（1999）；第42行明确《La ocasión》获1987年Nadal奖，未据此推断首版年份。','胡安·何塞·萨埃尔创作 Responso','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1095','V1-REL-0733','WCD10-B18-S201','SRC-0256','Juan José Saer: un narrador en busca de poesía','实读2026-10-14，Argentina.gob.ar正文第24–25行说明《En la zona》1960年出版、由14篇短篇构成并点出末篇“Algo se aproxima”；第32–33行列出短篇集Palo y hueso（1965）、Unidad de lugar（1967）、La mayor（1976）、Lugar（2000），诗歌汇编El arte de narrar: poemas 1960/1975（1977），小说Responso（1963）、Cicatrices（1969）、El limonero real（1974）、Nada nunca nada（1980）、El entenado（1983）、Glosa（1986）及散文集El río sin orillas: tratado imaginario（1991）、El concepto de ficción（1997）、La narración-objeto（1999）；第42行明确《La ocasión》获1987年Nadal奖，未据此推断首版年份。','胡安·何塞·萨埃尔创作 Cicatrices','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1096','V1-REL-0734','WCD10-B18-S201','SRC-0256','Juan José Saer: un narrador en busca de poesía','实读2026-10-14，Argentina.gob.ar正文第24–25行说明《En la zona》1960年出版、由14篇短篇构成并点出末篇“Algo se aproxima”；第32–33行列出短篇集Palo y hueso（1965）、Unidad de lugar（1967）、La mayor（1976）、Lugar（2000），诗歌汇编El arte de narrar: poemas 1960/1975（1977），小说Responso（1963）、Cicatrices（1969）、El limonero real（1974）、Nada nunca nada（1980）、El entenado（1983）、Glosa（1986）及散文集El río sin orillas: tratado imaginario（1991）、El concepto de ficción（1997）、La narración-objeto（1999）；第42行明确《La ocasión》获1987年Nadal奖，未据此推断首版年份。','胡安·何塞·萨埃尔创作 Nadie nada nunca','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1097','V1-REL-0734','WCD10-B18-S204','SRC-0769','Nadie nada nunca — Juan José Saer','2026-10-14实读Rayo Verde出版社《Nadie nada nunca》页面第31–35行：标题、作者及novela体裁；页面简介称故事发生于河边炎热夏日，围绕一连串马匹被杀展开。页面第12行的2014为该版年份，不作为首版年。','胡安·何塞·萨埃尔创作 Nadie nada nunca','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1098','V1-REL-0735','WCD10-B18-S201','SRC-0256','Juan José Saer: un narrador en busca de poesía','实读2026-10-14，Argentina.gob.ar正文第24–25行说明《En la zona》1960年出版、由14篇短篇构成并点出末篇“Algo se aproxima”；第32–33行列出短篇集Palo y hueso（1965）、Unidad de lugar（1967）、La mayor（1976）、Lugar（2000），诗歌汇编El arte de narrar: poemas 1960/1975（1977），小说Responso（1963）、Cicatrices（1969）、El limonero real（1974）、Nada nunca nada（1980）、El entenado（1983）、Glosa（1986）及散文集El río sin orillas: tratado imaginario（1991）、El concepto de ficción（1997）、La narración-objeto（1999）；第42行明确《La ocasión》获1987年Nadal奖，未据此推断首版年份。','胡安·何塞·萨埃尔创作 El río sin orillas: tratado imaginario','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1099','V1-REL-0736','WCD10-B18-S201','SRC-0256','Juan José Saer: un narrador en busca de poesía','实读2026-10-14，Argentina.gob.ar正文第24–25行说明《En la zona》1960年出版、由14篇短篇构成并点出末篇“Algo se aproxima”；第32–33行列出短篇集Palo y hueso（1965）、Unidad de lugar（1967）、La mayor（1976）、Lugar（2000），诗歌汇编El arte de narrar: poemas 1960/1975（1977），小说Responso（1963）、Cicatrices（1969）、El limonero real（1974）、Nada nunca nada（1980）、El entenado（1983）、Glosa（1986）及散文集El río sin orillas: tratado imaginario（1991）、El concepto de ficción（1997）、La narración-objeto（1999）；第42行明确《La ocasión》获1987年Nadal奖，未据此推断首版年份。','胡安·何塞·萨埃尔创作 El concepto de ficción','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1100','V1-REL-0736','WCD10-B18-S202','SRC-0767','El concepto de ficción — Juan José Saer','2026-10-14实读Editorial Océano页面第37–39行：书籍说明围绕小说写作、虚构与文学思考，并明确说该书汇集多篇随笔（varios ensayos）；第49行的2016为所示版本信息，本包不据此推断首版年。','胡安·何塞·萨埃尔创作 El concepto de ficción','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1101','V1-REL-0737','WCD10-B18-S201','SRC-0256','Juan José Saer: un narrador en busca de poesía','实读2026-10-14，Argentina.gob.ar正文第24–25行说明《En la zona》1960年出版、由14篇短篇构成并点出末篇“Algo se aproxima”；第32–33行列出短篇集Palo y hueso（1965）、Unidad de lugar（1967）、La mayor（1976）、Lugar（2000），诗歌汇编El arte de narrar: poemas 1960/1975（1977），小说Responso（1963）、Cicatrices（1969）、El limonero real（1974）、Nada nunca nada（1980）、El entenado（1983）、Glosa（1986）及散文集El río sin orillas: tratado imaginario（1991）、El concepto de ficción（1997）、La narración-objeto（1999）；第42行明确《La ocasión》获1987年Nadal奖，未据此推断首版年份。','胡安·何塞·萨埃尔创作 La narración-objeto','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1102','V1-REL-0737','WCD10-B18-S203','SRC-0768','Platicar cuesta. Juan Rulfo: una moral de la escritura','2026-10-14实读CeLeHis–Revista del Centro de Letras Hispanoamericanas论文PDF零起算第5页（第6页/印页81），正文第256–257行：Celina Manzoni明确称《La narración-objeto》（1999）汇集Saer的讲演、序言及评论性介入；支持作品层级为文集，不把同题单篇作为独立候选。期刊出版信息见PDF第0页第1–8行（2018，76–85页）。','胡安·何塞·萨埃尔创作 La narración-objeto','high','eligible_evidence','WCD-10-B18'),
('V1-EV-1103','V1-REL-0738','WCD10-B18-S201','SRC-0256','Juan José Saer: un narrador en busca de poesía','实读2026-10-14，Argentina.gob.ar正文第24–25行说明《En la zona》1960年出版、由14篇短篇构成并点出末篇“Algo se aproxima”；第32–33行列出短篇集Palo y hueso（1965）、Unidad de lugar（1967）、La mayor（1976）、Lugar（2000），诗歌汇编El arte de narrar: poemas 1960/1975（1977），小说Responso（1963）、Cicatrices（1969）、El limonero real（1974）、Nada nunca nada（1980）、El entenado（1983）、Glosa（1986）及散文集El río sin orillas: tratado imaginario（1991）、El concepto de ficción（1997）、La narración-objeto（1999）；第42行明确《La ocasión》获1987年Nadal奖，未据此推断首版年份。','胡安·何塞·萨埃尔创作 La ocasión','high','eligible_evidence','WCD-10-B18');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0603','WCD-10-B18-G01','research_gap','saer.full_author_oeuvre','open','本轮只纳入单一政府文化来源直接列出的主要小说、短篇集、诗歌汇编与随笔；未穷尽Saer全部作品、诗歌、文章、遗稿及版本目录。','','Independent Reviewer: preserve preserve as out_of_scope','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0604','WCD-10-B18:V1-ENT-0329','research_gap','WCD10:work_level_research:V1-ENT-0329','open','保全既有B18研究快照；本轮仅候选新作品，不对旧作品扩充或重评。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0605','WCD-10-B18:V1-ENT-0330','research_gap','WCD10:work_level_research:V1-ENT-0330','open','本轮对既有作品只追加来源明确支持的简短简介或合作书目注记；B18基线实体、既有事实与全量来源链均保持。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0606','WCD-10-B18:V1-ENT-0331','research_gap','WCD10:work_level_research:V1-ENT-0331','open','本轮对既有作品只追加来源明确支持的简短简介或合作书目注记；B18基线实体、既有事实与全量来源链均保持。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0607','WCD-10-B18:WCD10-B18-W001','research_gap','WCD10:work_level_research:V1-ENT-0746','open','普通书目与有界情节简介由直接作品记录支持；未确定的原作年份保留空缺。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0608','WCD-10-B18:WCD10-B18-W002','research_gap','WCD10:work_level_research:V1-ENT-0747','open','本轮使用可识别机构书目支持普通作品身份/描述；不宣称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0609','WCD-10-B18:WCD10-B18-W003','research_gap','WCD10:work_level_research:V1-ENT-0748','open','写作年份1690直接来自UNAM Global；该来源没有给出原作首刊年份，故保留空缺。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0610','WCD-10-B18:V1-ENT-0335','research_gap','WCD10:work_level_research:V1-ENT-0335','open','catalog_only：已有本地研究候选仍待批次独立审查；本轮仅延续其研究来源链。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0611','WCD-10-B18:V1-ENT-0336','research_gap','WCD10:work_level_research:V1-ENT-0336','open','catalog_only：已有本地研究候选仍待批次独立审查；本轮仅延续其研究来源链。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0612','WCD-10-B18:V1-ENT-0337','research_gap','WCD10:work_level_research:V1-ENT-0337','open','catalog_only：已有本地研究候选仍待批次独立审查；本轮仅延续其研究来源链。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0613','WCD-10-B18:WCD10-B18-W101','research_gap','WCD10:work_level_research:V1-ENT-0749','open','候选实体、CREATED归属和事实须经独立批次Review；未准入Research主库或Curation。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0614','WCD-10-B18:WCD10-B18-W102','research_gap','WCD10:work_level_research:V1-ENT-0750','open','候选实体、CREATED归属和事实须经独立批次Review；未准入Research主库或Curation。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0615','WCD-10-B18:WCD10-B18-W103','research_gap','WCD10:work_level_research:V1-ENT-0751','open','候选实体、CREATED归属和事实须经独立批次Review；未准入Research主库或Curation。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0616','WCD-10-B18:WCD10-B18-W104','research_gap','WCD10:work_level_research:V1-ENT-0752','open','候选实体、CREATED归属、文体和版本注记须经独立批次Review；未准入Research主库或Curation。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0617','WCD-10-B18:WCD10-B18-W105','research_gap','WCD10:work_level_research:V1-ENT-0753','open','候选实体、CREATED归属、文体和版本注记须经独立批次Review；未准入Research主库或Curation。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0618','WCD-10-B18:V1-ENT-0338','research_gap','WCD10:work_level_research:V1-ENT-0338','open','本行只作基线闭包保全；作品级研究覆盖未作完整性判断。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0619','WCD-10-B18:V1-ENT-0339','research_gap','WCD10:work_level_research:V1-ENT-0339','open','本行只作基线闭包保全；作品级研究覆盖未作完整性判断。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0620','WCD-10-B18:V1-ENT-0340','research_gap','WCD10:work_level_research:V1-ENT-0340','open','本行只作基线闭包保全；作品级研究覆盖未作完整性判断。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0621','WCD-10-B18:WCD10-B18-W201','research_gap','WCD10:work_level_research:V1-ENT-0754','open','目前依据为一篇阿根廷政府文化文章，支持所列书目与有限描述；不据此宣称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0622','WCD-10-B18:WCD10-B18-W202','research_gap','WCD10:work_level_research:V1-ENT-0755','open','目前依据为一篇阿根廷政府文化文章，支持所列书目与有限描述；不据此宣称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0623','WCD-10-B18:WCD10-B18-W203','research_gap','WCD10:work_level_research:V1-ENT-0756','open','目前依据为一篇阿根廷政府文化文章，支持所列书目与有限描述；不据此宣称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0624','WCD-10-B18:WCD10-B18-W204','research_gap','WCD10:work_level_research:V1-ENT-0757','open','目前依据为一篇阿根廷政府文化文章，支持所列书目与有限描述；不据此宣称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0625','WCD-10-B18:WCD10-B18-W205','research_gap','WCD10:work_level_research:V1-ENT-0758','open','目前依据为一篇阿根廷政府文化文章，支持所列书目与有限描述；不据此宣称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0626','WCD-10-B18:WCD10-B18-W206','research_gap','WCD10:work_level_research:V1-ENT-0759','open','目前依据为一篇阿根廷政府文化文章，支持所列书目与有限描述；不据此宣称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0627','WCD-10-B18:WCD10-B18-W207','research_gap','WCD10:work_level_research:V1-ENT-0760','open','目前依据为一篇阿根廷政府文化文章，支持所列书目与有限描述；不据此宣称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0628','WCD-10-B18:WCD10-B18-W208','research_gap','WCD10:work_level_research:V1-ENT-0761','open','目前依据为一篇阿根廷政府文化文章，支持所列书目与有限描述；不据此宣称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0629','WCD-10-B18:WCD10-B18-W209','research_gap','WCD10:work_level_research:V1-ENT-0762','open','目前依据为一篇阿根廷政府文化文章，支持所列书目与有限描述；不据此宣称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0630','WCD-10-B18:WCD10-B18-W210','research_gap','WCD10:work_level_research:V1-ENT-0763','open','目前依据为一篇阿根廷政府文化文章，支持所列书目与有限描述；不据此宣称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0631','WCD-10-B18:WCD10-B18-W211','research_gap','WCD10:work_level_research:V1-ENT-0764','open','目前依据为一篇阿根廷政府文化文章，支持所列书目与有限描述；不据此宣称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0632','WCD-10-B18:WCD10-B18-W212','research_gap','WCD10:work_level_research:V1-ENT-0765','open','目前依据为一篇阿根廷政府文化文章，支持所列书目与有限描述；不据此宣称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0633','WCD-10-B18:WCD10-B18-W213','research_gap','WCD10:work_level_research:V1-ENT-0766','open','目前依据为一篇阿根廷政府文化文章，支持所列书目与有限描述；不据此宣称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');

UPDATE metadata SET value='WCD-10-B18' WHERE key='last_change_set';

UPDATE metadata SET value='2026-10-14' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 768 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 764 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 762 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 777 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2568 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 3184 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2547 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1524 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 736 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 1140 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 1111 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 633 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
