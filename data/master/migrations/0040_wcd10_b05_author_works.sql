-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: Codex-parent-independent-review

-- Registration sha256: 69665fa852a4cc978a8933768dbfa9f515234b25ba9fa832334c64271a90e050

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1188 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 633 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 328 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 418 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 416 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 1293 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1209 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 122 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 39 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 435 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 464 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 386 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 392 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B04' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0395' OR canonical_url='https://bvhumanidades.usac.edu.gt/items/show/3553') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0396' OR canonical_url='https://bvhumanidades.usac.edu.gt/items/show/3544') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0397' OR canonical_url='https://www.elem.mx/institucion/editorial/28/1406/false/genero/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0398' OR canonical_url='https://www.isabelallende.com/en/book/stories') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0399' OR canonical_url='https://www.isabelallende.com/en/book/paula') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0400' OR canonical_url='https://www.isabelallende.com/en/book/daughter') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0401' OR canonical_url='https://www.isabelallende.com/en/book/city') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0402' OR canonical_url='https://www.elem.mx/obra/datos/8687') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0403' OR canonical_url='https://www.elem.mx/obra/datos/5746') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0404' OR canonical_url='https://www.elem.mx/obra/datos/5745') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0405' OR canonical_url='https://www.elem.mx/obra/datos/5744') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0406' OR canonical_url='https://www.elem.mx/obra/datos/205027') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0407' OR canonical_url='https://www.fondodeculturaeconomica.com/Noticia/2290') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0408' OR canonical_url='https://www.fondodeculturaeconomica.com/Noticia/479') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0421' OR (entity_type='work' AND original_name='¿Águila o sol?')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0422' OR (entity_type='collection' AND original_name='Ladera este')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0423' OR (entity_type='collection' AND original_name='Cuentos de Eva Luna')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0424' OR (entity_type='work' AND original_name='Paula')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0425' OR (entity_type='work' AND original_name='Hija de la fortuna')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0426' OR (entity_type='work' AND original_name='La ciudad de las bestias')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0427' OR (entity_type='collection' AND original_name='Libertad bajo palabra')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0428' OR (entity_type='collection' AND original_name='La estación violenta')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1216' OR (subject_id='V1-ENT-0421' AND fact_field='first_publication_year' AND value_text='1951')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1217' OR (subject_id='V1-ENT-0421' AND fact_field='genre_or_form' AND value_text='散文诗集（prose poems）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1218' OR (subject_id='V1-ENT-0421' AND fact_field='one_sentence_summary' AND value_text='据美国诗人学会介绍，这个散文诗系列由画家鲁菲诺·塔马伊插图，是对墨西哥过去、现在与未来的幻象式测绘。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1219' OR (subject_id='V1-ENT-0422' AND fact_field='first_publication_year' AND value_text='1969')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1220' OR (subject_id='V1-ENT-0422' AND fact_field='genre_or_form' AND value_text='诗集（1962-1968，印度时期）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1221' OR (subject_id='V1-ENT-0422' AND fact_field='one_sentence_summary' AND value_text='据ELEM专文，诗集分三部分：题名部分收五十首诗，《Hacia el comienzo》十五首，另收1967年曾单独出版的长诗《Blanco》；除《Cuento de dos jardines》外，各诗写于阿富汗、锡兰与印度，可读作诗人面对东方的纪行，''Intermitencias del Oeste''四诗则记入墨西哥与法国的学生运动。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1222' OR (subject_id='V1-ENT-0422' AND fact_field='bibliographic_note' AND value_text='ELEM记初版Joaquín Mortiz（Las Dos Orillas丛书）1969年，印数3,150册，帕斯附东方术语注释；与诺贝尔书目页、Mortiz出版目录一致。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1223' OR (subject_id='V1-ENT-0423' AND fact_field='first_publication_year' AND value_text='1989')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1224' OR (subject_id='V1-ENT-0423' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1225' OR (subject_id='V1-ENT-0423' AND fact_field='one_sentence_summary' AND value_text='据作者官方网站简介，伊娃·露娜应恋人罗尔夫·卡莱''讲一个从未对人讲过的故事''之请讲述二十三则故事，爱情、复仇、乡愁、反讽诸般情感俱在其中。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1226' OR (subject_id='V1-ENT-0423' AND fact_field='bibliographic_note' AND value_text='官网时间线记西语版1989年出版、作品页记英译首版©1991；两版本年份分列，不以英译年代替。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1227' OR (subject_id='V1-ENT-0424' AND fact_field='first_publication_year' AND value_text='1994')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1228' OR (subject_id='V1-ENT-0424' AND fact_field='genre_or_form' AND value_text='回忆录')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1229' OR (subject_id='V1-ENT-0424' AND fact_field='one_sentence_summary' AND value_text='据作者官方网站简介，1991年12月女儿宝拉重病陷入昏迷后，阿连德在数月陪护中为失去意识的女儿写下家族故事，最终写成这部坦露生死的回忆录。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1230' OR (subject_id='V1-ENT-0424' AND fact_field='bibliographic_note' AND value_text='官网时间线记西语版1994年（与德语、荷兰语版同年）、作品页记英译首版©1995。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1231' OR (subject_id='V1-ENT-0425' AND fact_field='first_publication_year' AND value_text='1999')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1232' OR (subject_id='V1-ENT-0425' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1233' OR (subject_id='V1-ENT-0425' AND fact_field='one_sentence_summary' AND value_text='据作者官方网站简介，孤儿伊莉莎·萨默斯在智利瓦尔帕莱索的英国侨民家庭长大，与青年华金·安德烈塔相恋；1849年淘金热起，她在华人医生陶奇恩相助下藏身船舱北上旧金山寻人，并在新世界重塑自己的命运。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1234' OR (subject_id='V1-ENT-0425' AND fact_field='bibliographic_note' AND value_text='官网时间线记西语版1999年出版、同年稍晚出英译；作品页记英译首版©1999。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1235' OR (subject_id='V1-ENT-0426' AND fact_field='first_publication_year' AND value_text='2002')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1236' OR (subject_id='V1-ENT-0426' AND fact_field='genre_or_form' AND value_text='青少年小说（三部曲首部）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1237' OR (subject_id='V1-ENT-0426' AND fact_field='one_sentence_summary' AND value_text='据作者官方网站简介，十五岁的亚历山大·科尔德因母亲病重被送往随《国际地理》杂志远征亚马逊的无畏祖母身边，与向导之女娜迪亚一同深入雨林，寻找传说中的''野兽''并发现雨林与人性的隐秘世界。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1238' OR (subject_id='V1-ENT-0426' AND fact_field='bibliographic_note' AND value_text='官网时间线记西语版2002年出版、作品页记英译首版©2002；三部曲续卷El reino del dragón de oro、El bosque de los pigmeos见时间线2003/2005条目，本批未建对象。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1239' OR (subject_id='V1-ENT-0427' AND fact_field='first_publication_year' AND value_text='1949')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1240' OR (subject_id='V1-ENT-0427' AND fact_field='genre_or_form' AND value_text='诗集（1949-1990跨版本演进作品）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1241' OR (subject_id='V1-ENT-0427' AND fact_field='one_sentence_summary' AND value_text='据ELEM专文，1949年初版收九十首诗；帕斯1953年重返墨西哥时构成此书的大部分诗篇已经写成，而《El cántaro roto》（1955）与《太阳石》（1957）等名篇当时尚未写出、系其后完成并在后续重编版中收入。ELEM 对后续重编作品及 1990 年定本的讨论涉及爱情、语言、与自然相呼应的爱欲、城市、作为社会见证的记忆与对时间的反思。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1242' OR (subject_id='V1-ENT-0427' AND fact_field='bibliographic_note' AND value_text='ELEM记五版本：1949年初版90首（FCE，Tezontle丛书，印1,100册）；1960年obra poética（1935-1957）扩至225首（初拟题Todavía）；1968年三版删四十余首；1979年补回部分；1990年定本207首分五节。《El cántaro roto》（1955）与《Piedra de sol》（1957）系初版之后写出，仅见于后续重编版，不属1949初版内容。ELEM页内以1960为''首版''的字段/导语与传记节1949表述并存，候选锚1949并留差异记录。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1243' OR (subject_id='V1-ENT-0428' AND fact_field='first_publication_year' AND value_text='1958')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1244' OR (subject_id='V1-ENT-0428' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1245' OR (subject_id='V1-ENT-0428' AND fact_field='one_sentence_summary' AND value_text='据ELEM作品页（转初版封底文字），诗集汇集帕斯面对历史、城市、风景与同侪社群的诗作，为人的尊严作证；贯穿全书的主导主题是时间——既是个人的也是历史的。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1246' OR (subject_id='V1-ENT-0428' AND fact_field='bibliographic_note' AND value_text='初版FCE丛书Letras Mexicanas第42种（1958）。ELEM所引主题描述两段出自1958年版封底（页标注''Esta contraportada corresponde a la edición de 1958''）；九诗清单（''Himno entre ruinas''''Máscaras del alba''''Fuente''''Repaso nocturno''''Mutra''''¿No hay salida?''''El río''''El cántaro roto''''Piedra de sol''）出自2013年版封底（页标注''contraportada…edición de 2013''），未独立核证其与1958年初版目录逐项相同。后作为一节收入Libertad bajo palabra重编版（1990定本五节之一）。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1247' OR (subject_id='V1-ENT-0173' AND fact_field='genre_or_form' AND value_text='长篇小说（政治小说）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1248' OR (subject_id='V1-ENT-0173' AND fact_field='one_sentence_summary' AND value_text='据危地马拉圣卡洛斯大学人文学院虚拟图书馆介绍，这部政治与实验性并置的小说书写''总统先生''的决断如何左右他人命运，尤其''天使脸''米格尔·卡拉-德安赫尔。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1249' OR (subject_id='V1-ENT-0174' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1250' OR (subject_id='V1-ENT-0174' AND fact_field='one_sentence_summary' AND value_text='据危地马拉圣卡洛斯大学图书馆简介，小说以《波波尔·乌》''人由玉米所造''的玛雅神话为题旨，把日常事实与奇幻超自然相结，重写农民生活、其根源与新的历史境况。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1251' OR (subject_id='V1-ENT-0175' AND fact_field='genre_or_form' AND value_text='传说/短篇故事集（超现实主义实验笔法）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1252' OR (subject_id='V1-ENT-0175' AND fact_field='one_sentence_summary' AND value_text='据危地马拉圣卡洛斯大学人文学院虚拟图书馆介绍，阿斯图里亚斯以更接近超现实主义的实验技法重写危地马拉民间传说。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1253' OR (subject_id='V1-ENT-0176' AND fact_field='genre_or_form' AND value_text='长篇小说（家族史诗）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1254' OR (subject_id='V1-ENT-0176' AND fact_field='one_sentence_summary' AND value_text='据作者官方网站简介，特鲁埃瓦家族三代人的激情、斗争与秘密贯穿一个未具名拉美国家百年暴力变迁，最终危机使专横的家长与其外孙女在街垒两侧对峙。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1255' OR (subject_id='V1-ENT-0177' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1256' OR (subject_id='V1-ENT-0177' AND fact_field='one_sentence_summary' AND value_text='据作者官方网站简介，在任意逮捕、突然失踪与即决处决横行的军事独裁国家，女记者伊雷内·贝尔特兰与地下抵抗组织摄影师弗朗西斯科·莱阿尔调查少女埃万赫利娜·兰基莱奥的神秘病例，揭出挑战政权的罪行。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1257' OR (subject_id='V1-ENT-0178' AND fact_field='genre_or_form' AND value_text='长篇小说（流浪汉小说式自述）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1258' OR (subject_id='V1-ENT-0178' AND fact_field='one_sentence_summary' AND value_text='据作者官方网站简介，叙述者伊娃·露娜以与生俱来的讲故事天赋自述一生：生于贫寒、早年失怙，从女仆走到独特的影响力，串起一个南美洲国家的众生相。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1259' OR (subject_id='V1-ENT-0154' AND fact_field='bibliographic_note' AND value_text='首版：墨西哥城 Cuadernos Americanos，1950；Fondo de Cultura Económica 版，1959。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0389' OR (subject_id='V1-ENT-0059' AND relation_type='CREATED' AND object_id='V1-ENT-0421')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0390' OR (subject_id='V1-ENT-0059' AND relation_type='CREATED' AND object_id='V1-ENT-0422')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0391' OR (subject_id='V1-ENT-0171' AND relation_type='CREATED' AND object_id='V1-ENT-0423')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0392' OR (subject_id='V1-ENT-0171' AND relation_type='CREATED' AND object_id='V1-ENT-0424')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0393' OR (subject_id='V1-ENT-0171' AND relation_type='CREATED' AND object_id='V1-ENT-0425')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0394' OR (subject_id='V1-ENT-0171' AND relation_type='CREATED' AND object_id='V1-ENT-0426')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0395' OR (subject_id='V1-ENT-0059' AND relation_type='CREATED' AND object_id='V1-ENT-0427')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0396' OR (subject_id='V1-ENT-0059' AND relation_type='CREATED' AND object_id='V1-ENT-0428')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0397' OR (subject_id='V1-ENT-0425' AND relation_type='SET_IN' AND object_id='V1-ENT-0123')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0395','WCD10-B05-S09','El señor presidente · Biblioteca Virtual FAHUSAC（条目3553）','El señor presidente · Biblioteca Virtual FAHUSAC（条目3553）','Facultad de Humanidades, Universidad de San Carlos de Guatemala','','Facultad de Humanidades, USAC','','','university_virtual_library_item','','es','B','access_pass','WCD-10-B05','metadata_and_summary','remote_only','','https://bvhumanidades.usac.edu.gt/items/show/3553'),
('SRC-0396','WCD10-B05-S11','Leyendas de Guatemala · Biblioteca Virtual FAHUSAC（条目3544）','Leyendas de Guatemala · Biblioteca Virtual FAHUSAC（条目3544）','Facultad de Humanidades, Universidad de San Carlos de Guatemala','','Facultad de Humanidades, USAC','','','university_virtual_library_item','','es','B','access_pass','WCD-10-B05','metadata_and_summary','remote_only','','https://bvhumanidades.usac.edu.gt/items/show/3544'),
('SRC-0397','WCD10-B05-S13','Joaquín Mortiz（Las Dos Orillas）出版目录 – Enciclopedia de la Literatura en México','Joaquín Mortiz（Las Dos Orillas）出版目录 – Enciclopedia de la Literatura en México','Fundación de las Letras Mexicanas / elem.mx','','Fundación de las Letras Mexicanas / elem.mx','','','encyclopedia_publisher_catalog','','es','B','access_pass','WCD-10-B05','metadata_and_summary','remote_only','','https://www.elem.mx/institucion/editorial/28/1406/false/genero/'),
('SRC-0398','WCD10-B05-S14','Isabel Allende – The Stories of Eva Luna','Isabel Allende – The Stories of Eva Luna','Isabel Allende','','Isabel Allende（官网）','','','official_author_site_book_page','','en','B','access_pass','WCD-10-B05','metadata_and_summary','remote_only','','https://www.isabelallende.com/en/book/stories'),
('SRC-0399','WCD10-B05-S15','Isabel Allende – Paula','Isabel Allende – Paula','Isabel Allende','','Isabel Allende（官网）','','','official_author_site_book_page','','en','B','access_pass','WCD-10-B05','metadata_and_summary','remote_only','','https://www.isabelallende.com/en/book/paula'),
('SRC-0400','WCD10-B05-S16','Isabel Allende – Daughter of Fortune','Isabel Allende – Daughter of Fortune','Isabel Allende','','Isabel Allende（官网）','','','official_author_site_book_page','','en','B','access_pass','WCD-10-B05','metadata_and_summary','remote_only','','https://www.isabelallende.com/en/book/daughter'),
('SRC-0401','WCD10-B05-S17','Isabel Allende – City of the Beasts','Isabel Allende – City of the Beasts','Isabel Allende','','Isabel Allende（官网）','','','official_author_site_book_page','','en','B','access_pass','WCD-10-B05','metadata_and_summary','remote_only','','https://www.isabelallende.com/en/book/city'),
('SRC-0402','WCD10-B05-S19','Ladera este (1962-1968) - Detalle de la obra','Ladera este (1962-1968) - Detalle de la obra','Enciclopedia de la Literatura en México / FLM (artículo ELEM)','','Fundación de las Letras Mexicanas / elem.mx','','','encyclopedia_work_article','','es','B','access_pass','WCD-10-B05','metadata_and_summary','remote_only','','https://www.elem.mx/obra/datos/8687'),
('SRC-0403','WCD10-B05-S20','Libertad bajo palabra - Detalle de la obra','Libertad bajo palabra - Detalle de la obra','Enciclopedia de la Literatura en México / FLM (artículo ELEM)','','Fundación de las Letras Mexicanas / elem.mx','','','encyclopedia_work_article','','es','B','access_pass','WCD-10-B05','metadata_and_summary','remote_only','','https://www.elem.mx/obra/datos/5746'),
('SRC-0404','WCD10-B05-S21','La estación violenta - Detalle de la obra','La estación violenta - Detalle de la obra','Enciclopedia de la Literatura en México / FLM (artículo ELEM)','','Fundación de las Letras Mexicanas / elem.mx','','','encyclopedia_work_article','','es','B','access_pass','WCD-10-B05','metadata_and_summary','remote_only','','https://www.elem.mx/obra/datos/5745'),
('SRC-0405','WCD10-B05-S22','Piedra de sol - Detalle de la obra','Piedra de sol - Detalle de la obra','Enciclopedia de la Literatura en México / FLM','','Fundación de las Letras Mexicanas / elem.mx','','','encyclopedia_work_data','','es','B','access_pass','WCD-10-B05','metadata_and_summary','remote_only','','https://www.elem.mx/obra/datos/5744'),
('SRC-0406','WCD10-B05-S23','El laberinto de la soledad - Detalle de la obra','El laberinto de la soledad - Detalle de la obra','Enciclopedia de la Literatura en México / FLM','','Fundación de las Letras Mexicanas / elem.mx','','','encyclopedia_work_data','','es','B','access_pass','WCD-10-B05','metadata_and_summary','remote_only','','https://www.elem.mx/obra/datos/205027'),
('SRC-0407','WCD10-B05-S24','De libro maldito a libro de texto（FCE转载）','De libro maldito a libro de texto（FCE转载）','Javier Aranda Luna（原载La Jornada Maya）/ FCE官网转载','','Fondo de Cultura Económica（转载La Jornada Maya 2020-06-04）','2020','','publisher_hosted_reprint','','es','C','access_pass','WCD-10-B05','metadata_and_summary','remote_only','','https://www.fondodeculturaeconomica.com/Noticia/2290'),
('SRC-0408','WCD10-B05-S25','584 versos','584 versos','Juan José González Mejía（原载El Sol de Tampico）/ FCE官网转载','','Fondo de Cultura Económica（转载El Sol de Tampico专栏）','2019','','publisher_hosted_reprint','','es','C','access_pass','WCD-10-B05','metadata_and_summary','remote_only','','https://www.fondodeculturaeconomica.com/Noticia/479');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0421','work','鹰还是太阳？','¿Águila o sol?','candidate','1','WCD10-B05-W01','补1951年散文诗书，与诗集及论著分层；Tamayo插图版次信息保留在描述。; 中文为候选显示暂译，未核实正式中文译本；原题为身份锚点。单篇/合集/版本分层，不与既有对象或诗集收录混同。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0422','collection','东斜坡','Ladera este','candidate','1','WCD10-B05-W02','补1962-1968印度时期诗集（R1已按ELEM专文补足三部结构与内容描述）；Blanco等分册不另立对象。; 中文为候选显示暂译，未核实正式中文译本；原题为身份锚点。单篇/合集/版本分层，不与既有对象或诗集收录混同。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0423','collection','伊娃·露娜的故事','Cuentos de Eva Luna','candidate','1','WCD10-B05-W05','补1989年短篇小说集，与既有小说《伊娃·露娜》（0178）分立；罗尔夫·卡莱为两书共享人物但不建人物对象。; 中文为候选显示暂译，未核实正式中文译本；原题为身份锚点。单篇/合集/版本分层，不与既有对象或诗集收录混同。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0424','work','宝拉','Paula','candidate','1','WCD10-B05-W06','补1994年回忆录；与小说作品分层，女儿病事属本书写作背景，不另建事件对象。; 中文为候选显示暂译，未核实正式中文译本；原题为身份锚点。单篇/合集/版本分层，不与既有对象或诗集收录混同。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0425','work','幸运之女','Hija de la fortuna','candidate','1','WCD10-B05-W07','补1999年长篇小说；与Retrato en sepia等后续家族三部曲不合并，加州主场景暂无库内地点端点。; 中文为候选显示暂译，未核实正式中文译本；原题为身份锚点。单篇/合集/版本分层，不与既有对象或诗集收录混同。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0426','work','野兽之城','La ciudad de las bestias','candidate','1','WCD10-B05-W08','补2002年青少年小说三部曲首卷；续卷（王国/森林）不因三部曲归属自动入列。; 中文为候选显示暂译，未核实正式中文译本；原题为身份锚点。单篇/合集/版本分层，不与既有对象或诗集收录混同。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0427','collection','语词下的自由','Libertad bajo palabra','candidate','1','WCD10-B05-W09','R1按ELEM作品页解除R0暂缓：1949年FCE（Tezontle丛书）90首初版可与1960年obra poética重编版分层，形成可审候选。; 中文为候选显示暂译，未核实正式中文译本；原题为身份锚点。单篇/合集/版本分层，不与既有对象或诗集收录混同。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0428','collection','狂暴的季节','La estación violenta','candidate','1','WCD10-B05-W10','R1按ELEM作品页解除R0暂缓：1958年FCE（Letras Mexicanas丛书）初版、构成与内容描述齐备；与Libertad重编版收录关系只在注记，不建关系。; 中文为候选显示暂译，未核实正式中文译本；原题为身份锚点。单篇/合集/版本分层，不与既有对象或诗集收录混同。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0417','WCD10-B05-W01','WCD-10-B05','WCD10-B05-W01','V1-ENT-0421','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0418','WCD10-B05-W02','WCD-10-B05','WCD10-B05-W02','V1-ENT-0422','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0419','WCD10-B05-W05','WCD-10-B05','WCD10-B05-W05','V1-ENT-0423','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0420','WCD10-B05-W06','WCD-10-B05','WCD10-B05-W06','V1-ENT-0424','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0421','WCD10-B05-W07','WCD-10-B05','WCD10-B05-W07','V1-ENT-0425','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0422','WCD10-B05-W08','WCD-10-B05','WCD10-B05-W08','V1-ENT-0426','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0423','WCD10-B05-W09','WCD-10-B05','WCD10-B05-W09','V1-ENT-0427','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0424','WCD10-B05-W10','WCD-10-B05','WCD10-B05-W10','V1-ENT-0428','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0329','WCD-10-B05:V1-ENT-0421','V1-ENT-0421','work','鹰还是太阳？','奥克塔维奥·帕斯','¿Águila o sol?','墨西哥','es','1951','散文诗集（prose poems）','WCD-10-B05','research_gap','RESEARCH-ONLY-NOT-CURATED','### 鹰还是太阳？｜¿Águila o sol?

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1951
- genre_or_form：散文诗集（prose poems）
- one_sentence_summary：据美国诗人学会介绍，这个散文诗系列由画家鲁菲诺·塔马伊插图，是对墨西哥过去、现在与未来的幻象式测绘。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0330','WCD-10-B05:V1-ENT-0422','V1-ENT-0422','collection','东斜坡','奥克塔维奥·帕斯','Ladera este','墨西哥','es','1969','诗集（1962-1968，印度时期）','WCD-10-B05','research_gap','RESEARCH-ONLY-NOT-CURATED','### 东斜坡｜Ladera este

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1969
- genre_or_form：诗集（1962-1968，印度时期）
- one_sentence_summary：据ELEM专文，诗集分三部分：题名部分收五十首诗，《Hacia el comienzo》十五首，另收1967年曾单独出版的长诗《Blanco》；除《Cuento de dos jardines》外，各诗写于阿富汗、锡兰与印度，可读作诗人面对东方的纪行，''Intermitencias del Oeste''四诗则记入墨西哥与法国的学生运动。
- bibliographic_note：ELEM记初版Joaquín Mortiz（Las Dos Orillas丛书）1969年，印数3,150册，帕斯附东方术语注释；与诺贝尔书目页、Mortiz出版目录一致。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0331','WCD-10-B05:V1-ENT-0423','V1-ENT-0423','collection','伊娃·露娜的故事','伊莎贝尔·阿连德','Cuentos de Eva Luna','智利','es','1989','短篇小说集','WCD-10-B05','research_gap','RESEARCH-ONLY-NOT-CURATED','### 伊娃·露娜的故事｜Cuentos de Eva Luna

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1989
- genre_or_form：短篇小说集
- one_sentence_summary：据作者官方网站简介，伊娃·露娜应恋人罗尔夫·卡莱''讲一个从未对人讲过的故事''之请讲述二十三则故事，爱情、复仇、乡愁、反讽诸般情感俱在其中。
- bibliographic_note：官网时间线记西语版1989年出版、作品页记英译首版©1991；两版本年份分列，不以英译年代替。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0332','WCD-10-B05:V1-ENT-0424','V1-ENT-0424','work','宝拉','伊莎贝尔·阿连德','Paula','智利','es','1994','回忆录','WCD-10-B05','research_gap','RESEARCH-ONLY-NOT-CURATED','### 宝拉｜Paula

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1994
- genre_or_form：回忆录
- one_sentence_summary：据作者官方网站简介，1991年12月女儿宝拉重病陷入昏迷后，阿连德在数月陪护中为失去意识的女儿写下家族故事，最终写成这部坦露生死的回忆录。
- bibliographic_note：官网时间线记西语版1994年（与德语、荷兰语版同年）、作品页记英译首版©1995。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0333','WCD-10-B05:V1-ENT-0425','V1-ENT-0425','work','幸运之女','伊莎贝尔·阿连德','Hija de la fortuna','智利','es','1999','长篇小说','WCD-10-B05','research_gap','RESEARCH-ONLY-NOT-CURATED','### 幸运之女｜Hija de la fortuna

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1999
- genre_or_form：长篇小说
- one_sentence_summary：据作者官方网站简介，孤儿伊莉莎·萨默斯在智利瓦尔帕莱索的英国侨民家庭长大，与青年华金·安德烈塔相恋；1849年淘金热起，她在华人医生陶奇恩相助下藏身船舱北上旧金山寻人，并在新世界重塑自己的命运。
- bibliographic_note：官网时间线记西语版1999年出版、同年稍晚出英译；作品页记英译首版©1999。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0334','WCD-10-B05:V1-ENT-0426','V1-ENT-0426','work','野兽之城','伊莎贝尔·阿连德','La ciudad de las bestias','智利','es','2002','青少年小说（三部曲首部）','WCD-10-B05','research_gap','RESEARCH-ONLY-NOT-CURATED','### 野兽之城｜La ciudad de las bestias

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：2002
- genre_or_form：青少年小说（三部曲首部）
- one_sentence_summary：据作者官方网站简介，十五岁的亚历山大·科尔德因母亲病重被送往随《国际地理》杂志远征亚马逊的无畏祖母身边，与向导之女娜迪亚一同深入雨林，寻找传说中的''野兽''并发现雨林与人性的隐秘世界。
- bibliographic_note：官网时间线记西语版2002年出版、作品页记英译首版©2002；三部曲续卷El reino del dragón de oro、El bosque de los pigmeos见时间线2003/2005条目，本批未建对象。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0335','WCD-10-B05:V1-ENT-0427','V1-ENT-0427','collection','语词下的自由','奥克塔维奥·帕斯','Libertad bajo palabra','墨西哥','es','1949','诗集（1949-1990跨版本演进作品）','WCD-10-B05','research_gap','RESEARCH-ONLY-NOT-CURATED','### 语词下的自由｜Libertad bajo palabra

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1949
- genre_or_form：诗集（1949-1990跨版本演进作品）
- one_sentence_summary：据ELEM专文，1949年初版收九十首诗；帕斯1953年重返墨西哥时构成此书的大部分诗篇已经写成，而《El cántaro roto》（1955）与《太阳石》（1957）等名篇当时尚未写出、系其后完成并在后续重编版中收入。ELEM 对后续重编作品及 1990 年定本的讨论涉及爱情、语言、与自然相呼应的爱欲、城市、作为社会见证的记忆与对时间的反思。
- bibliographic_note：ELEM记五版本：1949年初版90首（FCE，Tezontle丛书，印1,100册）；1960年obra poética（1935-1957）扩至225首（初拟题Todavía）；1968年三版删四十余首；1979年补回部分；1990年定本207首分五节。《El cántaro roto》（1955）与《Piedra de sol》（1957）系初版之后写出，仅见于后续重编版，不属1949初版内容。ELEM页内以1960为''首版''的字段/导语与传记节1949表述并存，候选锚1949并留差异记录。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0336','WCD-10-B05:V1-ENT-0428','V1-ENT-0428','collection','狂暴的季节','奥克塔维奥·帕斯','La estación violenta','墨西哥','es','1958','诗集','WCD-10-B05','research_gap','RESEARCH-ONLY-NOT-CURATED','### 狂暴的季节｜La estación violenta

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1958
- genre_or_form：诗集
- one_sentence_summary：据ELEM作品页（转初版封底文字），诗集汇集帕斯面对历史、城市、风景与同侪社群的诗作，为人的尊严作证；贯穿全书的主导主题是时间——既是个人的也是历史的。
- bibliographic_note：初版FCE丛书Letras Mexicanas第42种（1958）。ELEM所引主题描述两段出自1958年版封底（页标注''Esta contraportada corresponde a la edición de 1958''）；九诗清单（''Himno entre ruinas''''Máscaras del alba''''Fuente''''Repaso nocturno''''Mutra''''¿No hay salida?''''El río''''El cántaro roto''''Piedra de sol''）出自2013年版封底（页标注''contraportada…edición de 2013''），未独立核证其与1958年初版目录逐项相同。后作为一节收入Libertad bajo palabra重编版（1990定本五节之一）。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0337','WCD-10-B05:V1-ENT-0173','V1-ENT-0173','work','《总统先生》','米格尔·安赫尔·阿斯图里亚斯','El Señor Presidente','危地马拉','es','','长篇小说（政治小说）','WCD-10-B05','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《总统先生》｜El Señor Presidente

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说（政治小说）
- one_sentence_summary：据危地马拉圣卡洛斯大学人文学院虚拟图书馆介绍，这部政治与实验性并置的小说书写''总统先生''的决断如何左右他人命运，尤其''天使脸''米格尔·卡拉-德安赫尔。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0338','WCD-10-B05:V1-ENT-0174','V1-ENT-0174','work','《玉米人》','米格尔·安赫尔·阿斯图里亚斯','Hombres de maíz','危地马拉','es','','长篇小说','WCD-10-B05','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《玉米人》｜Hombres de maíz

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说
- one_sentence_summary：据危地马拉圣卡洛斯大学图书馆简介，小说以《波波尔·乌》''人由玉米所造''的玛雅神话为题旨，把日常事实与奇幻超自然相结，重写农民生活、其根源与新的历史境况。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0339','WCD-10-B05:V1-ENT-0175','V1-ENT-0175','collection','《危地马拉传说》','米格尔·安赫尔·阿斯图里亚斯','Leyendas de Guatemala','危地马拉','es','','传说/短篇故事集（超现实主义实验笔法）','WCD-10-B05','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《危地马拉传说》｜Leyendas de Guatemala

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：传说/短篇故事集（超现实主义实验笔法）
- one_sentence_summary：据危地马拉圣卡洛斯大学人文学院虚拟图书馆介绍，阿斯图里亚斯以更接近超现实主义的实验技法重写危地马拉民间传说。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0340','WCD-10-B05:V1-ENT-0176','V1-ENT-0176','work','《幽灵之家》','伊莎贝尔·阿连德','La casa de los espíritus','智利','es','','长篇小说（家族史诗）','WCD-10-B05','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《幽灵之家》｜La casa de los espíritus

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说（家族史诗）
- one_sentence_summary：据作者官方网站简介，特鲁埃瓦家族三代人的激情、斗争与秘密贯穿一个未具名拉美国家百年暴力变迁，最终危机使专横的家长与其外孙女在街垒两侧对峙。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0341','WCD-10-B05:V1-ENT-0177','V1-ENT-0177','work','《爱情与阴影》','伊莎贝尔·阿连德','De amor y de sombras','智利','es','','长篇小说','WCD-10-B05','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《爱情与阴影》｜De amor y de sombras

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说
- one_sentence_summary：据作者官方网站简介，在任意逮捕、突然失踪与即决处决横行的军事独裁国家，女记者伊雷内·贝尔特兰与地下抵抗组织摄影师弗朗西斯科·莱阿尔调查少女埃万赫利娜·兰基莱奥的神秘病例，揭出挑战政权的罪行。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0342','WCD-10-B05:V1-ENT-0178','V1-ENT-0178','work','《伊娃·露娜》','伊莎贝尔·阿连德','Eva Luna','智利','es','','长篇小说（流浪汉小说式自述）','WCD-10-B05','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《伊娃·露娜》｜Eva Luna

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说（流浪汉小说式自述）
- one_sentence_summary：据作者官方网站简介，叙述者伊娃·露娜以与生俱来的讲故事天赋自述一生：生于贫寒、早年失怙，从女仆走到独特的影响力，串起一个南美洲国家的众生相。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0343','WCD-10-B05:V1-ENT-0154','V1-ENT-0154','work','《孤独的迷宫》','奥克塔维奥·帕斯','El laberinto de la soledad','墨西哥','es','','','WCD-10-B05','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《孤独的迷宫》｜El laberinto de la soledad

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- bibliographic_note：首版：墨西哥城 Cuadernos Americanos，1950；Fondo de Cultura Económica 版，1959。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-1216','WCD10-B05-W01-F01','V1-CARD-0329','V1-ENT-0421','first_publication_year','1951','bibliographic','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1217','WCD10-B05-W01-F02','V1-CARD-0329','V1-ENT-0421','genre_or_form','散文诗集（prose poems）','bibliographic','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1218','WCD10-B05-W01-F03','V1-CARD-0329','V1-ENT-0421','one_sentence_summary','据美国诗人学会介绍，这个散文诗系列由画家鲁菲诺·塔马伊插图，是对墨西哥过去、现在与未来的幻象式测绘。','institutional_paraphrase','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1219','WCD10-B05-W02-F01','V1-CARD-0330','V1-ENT-0422','first_publication_year','1969','bibliographic','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1220','WCD10-B05-W02-F02','V1-CARD-0330','V1-ENT-0422','genre_or_form','诗集（1962-1968，印度时期）','bibliographic','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1221','WCD10-B05-W02-F03','V1-CARD-0330','V1-ENT-0422','one_sentence_summary','据ELEM专文，诗集分三部分：题名部分收五十首诗，《Hacia el comienzo》十五首，另收1967年曾单独出版的长诗《Blanco》；除《Cuento de dos jardines》外，各诗写于阿富汗、锡兰与印度，可读作诗人面对东方的纪行，''Intermitencias del Oeste''四诗则记入墨西哥与法国的学生运动。','institutional_paraphrase','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1222','WCD10-B05-W02-F04','V1-CARD-0330','V1-ENT-0422','bibliographic_note','ELEM记初版Joaquín Mortiz（Las Dos Orillas丛书）1969年，印数3,150册，帕斯附东方术语注释；与诺贝尔书目页、Mortiz出版目录一致。','bibliographic_note','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1223','WCD10-B05-W05-F01','V1-CARD-0331','V1-ENT-0423','first_publication_year','1989','bibliographic','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1224','WCD10-B05-W05-F02','V1-CARD-0331','V1-ENT-0423','genre_or_form','短篇小说集','bibliographic','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1225','WCD10-B05-W05-F03','V1-CARD-0331','V1-ENT-0423','one_sentence_summary','据作者官方网站简介，伊娃·露娜应恋人罗尔夫·卡莱''讲一个从未对人讲过的故事''之请讲述二十三则故事，爱情、复仇、乡愁、反讽诸般情感俱在其中。','institutional_paraphrase','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1226','WCD10-B05-W05-F04','V1-CARD-0331','V1-ENT-0423','bibliographic_note','官网时间线记西语版1989年出版、作品页记英译首版©1991；两版本年份分列，不以英译年代替。','bibliographic_note','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1227','WCD10-B05-W06-F01','V1-CARD-0332','V1-ENT-0424','first_publication_year','1994','bibliographic','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1228','WCD10-B05-W06-F02','V1-CARD-0332','V1-ENT-0424','genre_or_form','回忆录','bibliographic','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1229','WCD10-B05-W06-F03','V1-CARD-0332','V1-ENT-0424','one_sentence_summary','据作者官方网站简介，1991年12月女儿宝拉重病陷入昏迷后，阿连德在数月陪护中为失去意识的女儿写下家族故事，最终写成这部坦露生死的回忆录。','institutional_paraphrase','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1230','WCD10-B05-W06-F04','V1-CARD-0332','V1-ENT-0424','bibliographic_note','官网时间线记西语版1994年（与德语、荷兰语版同年）、作品页记英译首版©1995。','bibliographic_note','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1231','WCD10-B05-W07-F01','V1-CARD-0333','V1-ENT-0425','first_publication_year','1999','bibliographic','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1232','WCD10-B05-W07-F02','V1-CARD-0333','V1-ENT-0425','genre_or_form','长篇小说','bibliographic','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1233','WCD10-B05-W07-F03','V1-CARD-0333','V1-ENT-0425','one_sentence_summary','据作者官方网站简介，孤儿伊莉莎·萨默斯在智利瓦尔帕莱索的英国侨民家庭长大，与青年华金·安德烈塔相恋；1849年淘金热起，她在华人医生陶奇恩相助下藏身船舱北上旧金山寻人，并在新世界重塑自己的命运。','institutional_paraphrase','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1234','WCD10-B05-W07-F04','V1-CARD-0333','V1-ENT-0425','bibliographic_note','官网时间线记西语版1999年出版、同年稍晚出英译；作品页记英译首版©1999。','bibliographic_note','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1235','WCD10-B05-W08-F01','V1-CARD-0334','V1-ENT-0426','first_publication_year','2002','bibliographic','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1236','WCD10-B05-W08-F02','V1-CARD-0334','V1-ENT-0426','genre_or_form','青少年小说（三部曲首部）','bibliographic','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1237','WCD10-B05-W08-F03','V1-CARD-0334','V1-ENT-0426','one_sentence_summary','据作者官方网站简介，十五岁的亚历山大·科尔德因母亲病重被送往随《国际地理》杂志远征亚马逊的无畏祖母身边，与向导之女娜迪亚一同深入雨林，寻找传说中的''野兽''并发现雨林与人性的隐秘世界。','institutional_paraphrase','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1238','WCD10-B05-W08-F04','V1-CARD-0334','V1-ENT-0426','bibliographic_note','官网时间线记西语版2002年出版、作品页记英译首版©2002；三部曲续卷El reino del dragón de oro、El bosque de los pigmeos见时间线2003/2005条目，本批未建对象。','bibliographic_note','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1239','WCD10-B05-W09-F01','V1-CARD-0335','V1-ENT-0427','first_publication_year','1949','bibliographic','WCD-10-B05','high','batch_retained_candidate','1949=FCE旗下Tezontle丛书90首初版（ELEM''Biografía del libro''节明称其为第一版；诺贝尔书目页1949一致）；ELEM结构化字段与导语以1960重编版为锚，页内差异已在bibliographic_note记录，不静默选边。'),
('V1-FCT-1240','WCD10-B05-W09-F02','V1-CARD-0335','V1-ENT-0427','genre_or_form','诗集（1949-1990跨版本演进作品）','bibliographic','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1241','WCD10-B05-W09-F03','V1-CARD-0335','V1-ENT-0427','one_sentence_summary','据ELEM专文，1949年初版收九十首诗；帕斯1953年重返墨西哥时构成此书的大部分诗篇已经写成，而《El cántaro roto》（1955）与《太阳石》（1957）等名篇当时尚未写出、系其后完成并在后续重编版中收入。ELEM 对后续重编作品及 1990 年定本的讨论涉及爱情、语言、与自然相呼应的爱欲、城市、作为社会见证的记忆与对时间的反思。','institutional_paraphrase','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1242','WCD10-B05-W09-F04','V1-CARD-0335','V1-ENT-0427','bibliographic_note','ELEM记五版本：1949年初版90首（FCE，Tezontle丛书，印1,100册）；1960年obra poética（1935-1957）扩至225首（初拟题Todavía）；1968年三版删四十余首；1979年补回部分；1990年定本207首分五节。《El cántaro roto》（1955）与《Piedra de sol》（1957）系初版之后写出，仅见于后续重编版，不属1949初版内容。ELEM页内以1960为''首版''的字段/导语与传记节1949表述并存，候选锚1949并留差异记录。','bibliographic_note','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1243','WCD10-B05-W10-F01','V1-CARD-0336','V1-ENT-0428','first_publication_year','1958','bibliographic','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1244','WCD10-B05-W10-F02','V1-CARD-0336','V1-ENT-0428','genre_or_form','诗集','bibliographic','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1245','WCD10-B05-W10-F03','V1-CARD-0336','V1-ENT-0428','one_sentence_summary','据ELEM作品页（转初版封底文字），诗集汇集帕斯面对历史、城市、风景与同侪社群的诗作，为人的尊严作证；贯穿全书的主导主题是时间——既是个人的也是历史的。','institutional_paraphrase','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1246','WCD10-B05-W10-F04','V1-CARD-0336','V1-ENT-0428','bibliographic_note','初版FCE丛书Letras Mexicanas第42种（1958）。ELEM所引主题描述两段出自1958年版封底（页标注''Esta contraportada corresponde a la edición de 1958''）；九诗清单（''Himno entre ruinas''''Máscaras del alba''''Fuente''''Repaso nocturno''''Mutra''''¿No hay salida?''''El río''''El cántaro roto''''Piedra de sol''）出自2013年版封底（页标注''contraportada…edición de 2013''），未独立核证其与1958年初版目录逐项相同。后作为一节收入Libertad bajo palabra重编版（1990定本五节之一）。','bibliographic_note','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1247','WCD10-B05-F03','V1-CARD-0337','V1-ENT-0173','genre_or_form','长篇小说（政治小说）','bibliographic','WCD-10-B05','high','batch_retained_candidate','体裁直书自USAC条目（Novela política y experimental、Etiquetas: Novela）；BnF''独裁者小说''归类另入research_note。'),
('V1-FCT-1248','WCD10-B05-F04','V1-CARD-0337','V1-ENT-0173','one_sentence_summary','据危地马拉圣卡洛斯大学人文学院虚拟图书馆介绍，这部政治与实验性并置的小说书写''总统先生''的决断如何左右他人命运，尤其''天使脸''米格尔·卡拉-德安赫尔。','institutional_paraphrase','WCD-10-B05','high','batch_retained_candidate','归属明确的机构释义；小说国度未具名，不作SET_IN危地马拉。'),
('V1-FCT-1249','WCD10-B05-F06','V1-CARD-0338','V1-ENT-0174','genre_or_form','长篇小说','bibliographic','WCD-10-B05','high','batch_retained_candidate','USAC封底简介称其为''拉美基础小说之一''，BnF书目列入小说；''魔幻现实主义''评价归简介原文不入枚举。'),
('V1-FCT-1250','WCD10-B05-F07','V1-CARD-0338','V1-ENT-0174','one_sentence_summary','据危地马拉圣卡洛斯大学图书馆简介，小说以《波波尔·乌》''人由玉米所造''的玛雅神话为题旨，把日常事实与奇幻超自然相结，重写农民生活、其根源与新的历史境况。','institutional_paraphrase','WCD-10-B05','high','batch_retained_candidate','封底文字由USAC转引，归属机构；不生成神话主题关系，不设SET_IN。'),
('V1-FCT-1251','WCD10-B05-F08','V1-CARD-0339','V1-ENT-0175','genre_or_form','传说/短篇故事集（超现实主义实验笔法）','bibliographic','WCD-10-B05','high','batch_retained_candidate','USAC标签（Leyenda/Narrativa/Surrealismo）与BnF引言''une série de contes''一致；保持collection层级。'),
('V1-FCT-1252','WCD10-B05-F09','V1-CARD-0339','V1-ENT-0175','one_sentence_summary','据危地马拉圣卡洛斯大学人文学院虚拟图书馆介绍，阿斯图里亚斯以更接近超现实主义的实验技法重写危地马拉民间传说。','institutional_paraphrase','WCD-10-B05','high','batch_retained_candidate','归属机构释义；BnF引言''首部书/玛雅宇宙观''为旁证，1930旧年份不变。'),
('V1-FCT-1253','WCD10-B05-F10','V1-CARD-0340','V1-ENT-0176','genre_or_form','长篇小说（家族史诗）','bibliographic','WCD-10-B05','high','batch_retained_candidate','官网简介直书''a symbolic family saga''；魔幻现实主义等标签不入枚举。'),
('V1-FCT-1254','WCD10-B05-F11','V1-CARD-0340','V1-ENT-0176','one_sentence_summary','据作者官方网站简介，特鲁埃瓦家族三代人的激情、斗争与秘密贯穿一个未具名拉美国家百年暴力变迁，最终危机使专横的家长与其外孙女在街垒两侧对峙。','institutional_paraphrase','WCD-10-B05','high','batch_retained_candidate','官网简介明确国家未具名；不据作者国籍生成SET_IN智利。'),
('V1-FCT-1255','WCD10-B05-F12','V1-CARD-0341','V1-ENT-0177','genre_or_form','长篇小说','bibliographic','WCD-10-B05','high','batch_retained_candidate','官网书籍页将其列为作者第二部小说；体裁仅此。'),
('V1-FCT-1256','WCD10-B05-F13','V1-CARD-0341','V1-ENT-0177','one_sentence_summary','据作者官方网站简介，在任意逮捕、突然失踪与即决处决横行的军事独裁国家，女记者伊雷内·贝尔特兰与地下抵抗组织摄影师弗朗西斯科·莱阿尔调查少女埃万赫利娜·兰基莱奥的神秘病例，揭出挑战政权的罪行。','institutional_paraphrase','WCD-10-B05','high','batch_retained_candidate','政权与国家均未具名；不生成BASED_ON_EVENT或SET_IN。'),
('V1-FCT-1257','WCD10-B05-F14','V1-CARD-0342','V1-ENT-0178','genre_or_form','长篇小说（流浪汉小说式自述）','bibliographic','WCD-10-B05','high','batch_retained_candidate','官网简介直书''picaresque tale of her own life''；叙述方式限定不入主题关系。'),
('V1-FCT-1258','WCD10-B05-F15','V1-CARD-0342','V1-ENT-0178','one_sentence_summary','据作者官方网站简介，叙述者伊娃·露娜以与生俱来的讲故事天赋自述一生：生于贫寒、早年失怙，从女仆走到独特的影响力，串起一个南美洲国家的众生相。','institutional_paraphrase','WCD-10-B05','high','batch_retained_candidate','''complex South American nation''未具名；不作SET_IN。'),
('V1-FCT-1259','WCD10-B05-F16','V1-CARD-0343','V1-ENT-0154','bibliographic_note','首版：墨西哥城 Cuadernos Americanos，1950；Fondo de Cultura Económica 版，1959。','bibliographic_note','WCD-10-B05','high','batch_retained_candidate','追加式追溯 V1-FCT-0309：旧值“poets.org 标初版 FCE 1950”仅记录该网站的来源说法，不作为首版出版社依据。S23 对应 ELEM 作品页明确列 Cuadernos Americanos 1950 为 PRIMERA EDICIÓN，并将 FCE 1959 列为 OTRAS EDICIONES。旧 V1-FCT-0309 行、其原 source links 及既有 hold 均原样保留；该旧行 origin_id=SRC-0128 实际错指 Aura（/obra/datos/2387），原 fact_sources 仅 SRC-0099（Nobel Bibliography），不足以支撑此出版者归属。本候选只增加更正事实及可追溯说明，不声称存在结构化 supersession。');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-1216','SRC-0099','Octavio Paz – Bibliography'),
('V1-FCT-1216','SRC-0100','About Octavio Paz'),
('V1-FCT-1217','SRC-0100','About Octavio Paz'),
('V1-FCT-1218','SRC-0100','About Octavio Paz'),
('V1-FCT-1219','SRC-0099','Octavio Paz – Bibliography'),
('V1-FCT-1219','SRC-0300','Octavio Paz – Biographical'),
('V1-FCT-1219','SRC-0397','Joaquín Mortiz（Las Dos Orillas）出版目录 – Enciclopedia de la Literatura en México'),
('V1-FCT-1219','SRC-0402','Ladera este (1962-1968) - Detalle de la obra'),
('V1-FCT-1220','SRC-0300','Octavio Paz – Biographical'),
('V1-FCT-1220','SRC-0402','Ladera este (1962-1968) - Detalle de la obra'),
('V1-FCT-1221','SRC-0402','Ladera este (1962-1968) - Detalle de la obra'),
('V1-FCT-1222','SRC-0397','Joaquín Mortiz（Las Dos Orillas）出版目录 – Enciclopedia de la Literatura en México'),
('V1-FCT-1222','SRC-0402','Ladera este (1962-1968) - Detalle de la obra'),
('V1-FCT-1223','SRC-0134','Isabel Allende – Timeline'),
('V1-FCT-1224','SRC-0398','Isabel Allende – The Stories of Eva Luna'),
('V1-FCT-1225','SRC-0398','Isabel Allende – The Stories of Eva Luna'),
('V1-FCT-1226','SRC-0134','Isabel Allende – Timeline'),
('V1-FCT-1226','SRC-0398','Isabel Allende – The Stories of Eva Luna'),
('V1-FCT-1227','SRC-0134','Isabel Allende – Timeline'),
('V1-FCT-1228','SRC-0399','Isabel Allende – Paula'),
('V1-FCT-1229','SRC-0399','Isabel Allende – Paula'),
('V1-FCT-1230','SRC-0134','Isabel Allende – Timeline'),
('V1-FCT-1230','SRC-0399','Isabel Allende – Paula'),
('V1-FCT-1231','SRC-0134','Isabel Allende – Timeline'),
('V1-FCT-1232','SRC-0400','Isabel Allende – Daughter of Fortune'),
('V1-FCT-1233','SRC-0400','Isabel Allende – Daughter of Fortune'),
('V1-FCT-1234','SRC-0134','Isabel Allende – Timeline'),
('V1-FCT-1234','SRC-0400','Isabel Allende – Daughter of Fortune'),
('V1-FCT-1235','SRC-0134','Isabel Allende – Timeline'),
('V1-FCT-1236','SRC-0401','Isabel Allende – City of the Beasts'),
('V1-FCT-1237','SRC-0401','Isabel Allende – City of the Beasts'),
('V1-FCT-1238','SRC-0134','Isabel Allende – Timeline'),
('V1-FCT-1238','SRC-0401','Isabel Allende – City of the Beasts'),
('V1-FCT-1239','SRC-0099','Octavio Paz – Bibliography'),
('V1-FCT-1239','SRC-0403','Libertad bajo palabra - Detalle de la obra'),
('V1-FCT-1240','SRC-0403','Libertad bajo palabra - Detalle de la obra'),
('V1-FCT-1241','SRC-0403','Libertad bajo palabra - Detalle de la obra'),
('V1-FCT-1242','SRC-0403','Libertad bajo palabra - Detalle de la obra'),
('V1-FCT-1243','SRC-0099','Octavio Paz – Bibliography'),
('V1-FCT-1243','SRC-0300','Octavio Paz – Biographical'),
('V1-FCT-1243','SRC-0404','La estación violenta - Detalle de la obra'),
('V1-FCT-1244','SRC-0404','La estación violenta - Detalle de la obra'),
('V1-FCT-1245','SRC-0404','La estación violenta - Detalle de la obra'),
('V1-FCT-1246','SRC-0404','La estación violenta - Detalle de la obra'),
('V1-FCT-1246','SRC-0403','Libertad bajo palabra - Detalle de la obra'),
('V1-FCT-1247','SRC-0395','El señor presidente · Biblioteca Virtual FAHUSAC（条目3553）'),
('V1-FCT-1247','SRC-0130','Miguel Ángel Asturias – Bibliografía'),
('V1-FCT-1248','SRC-0395','El señor presidente · Biblioteca Virtual FAHUSAC（条目3553）'),
('V1-FCT-1249','SRC-0132','Hombres de maíz – Biblioteca de Humanidades'),
('V1-FCT-1249','SRC-0130','Miguel Ángel Asturias – Bibliografía'),
('V1-FCT-1250','SRC-0132','Hombres de maíz – Biblioteca de Humanidades'),
('V1-FCT-1251','SRC-0396','Leyendas de Guatemala · Biblioteca Virtual FAHUSAC（条目3544）'),
('V1-FCT-1251','SRC-0130','Miguel Ángel Asturias – Bibliografía'),
('V1-FCT-1252','SRC-0396','Leyendas de Guatemala · Biblioteca Virtual FAHUSAC（条目3544）'),
('V1-FCT-1253','SRC-0135','Isabel Allende – The House of the Spirits'),
('V1-FCT-1254','SRC-0135','Isabel Allende – The House of the Spirits'),
('V1-FCT-1255','SRC-0136','Isabel Allende – Of Love and Shadows'),
('V1-FCT-1256','SRC-0136','Isabel Allende – Of Love and Shadows'),
('V1-FCT-1257','SRC-0137','Isabel Allende – Eva Luna'),
('V1-FCT-1258','SRC-0137','Isabel Allende – Eva Luna'),
('V1-FCT-1259','SRC-0406','El laberinto de la soledad - Detalle de la obra');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0329','V1-FCT-1216','batch_retained_candidate'),
('V1-CARD-0329','V1-FCT-1217','batch_retained_candidate'),
('V1-CARD-0329','V1-FCT-1218','batch_retained_candidate'),
('V1-CARD-0330','V1-FCT-1219','batch_retained_candidate'),
('V1-CARD-0330','V1-FCT-1220','batch_retained_candidate'),
('V1-CARD-0330','V1-FCT-1221','batch_retained_candidate'),
('V1-CARD-0330','V1-FCT-1222','batch_retained_candidate'),
('V1-CARD-0331','V1-FCT-1223','batch_retained_candidate'),
('V1-CARD-0331','V1-FCT-1224','batch_retained_candidate'),
('V1-CARD-0331','V1-FCT-1225','batch_retained_candidate'),
('V1-CARD-0331','V1-FCT-1226','batch_retained_candidate'),
('V1-CARD-0332','V1-FCT-1227','batch_retained_candidate'),
('V1-CARD-0332','V1-FCT-1228','batch_retained_candidate'),
('V1-CARD-0332','V1-FCT-1229','batch_retained_candidate'),
('V1-CARD-0332','V1-FCT-1230','batch_retained_candidate'),
('V1-CARD-0333','V1-FCT-1231','batch_retained_candidate'),
('V1-CARD-0333','V1-FCT-1232','batch_retained_candidate'),
('V1-CARD-0333','V1-FCT-1233','batch_retained_candidate'),
('V1-CARD-0333','V1-FCT-1234','batch_retained_candidate'),
('V1-CARD-0334','V1-FCT-1235','batch_retained_candidate'),
('V1-CARD-0334','V1-FCT-1236','batch_retained_candidate'),
('V1-CARD-0334','V1-FCT-1237','batch_retained_candidate'),
('V1-CARD-0334','V1-FCT-1238','batch_retained_candidate'),
('V1-CARD-0335','V1-FCT-1239','batch_retained_candidate'),
('V1-CARD-0335','V1-FCT-1240','batch_retained_candidate'),
('V1-CARD-0335','V1-FCT-1241','batch_retained_candidate'),
('V1-CARD-0335','V1-FCT-1242','batch_retained_candidate'),
('V1-CARD-0336','V1-FCT-1243','batch_retained_candidate'),
('V1-CARD-0336','V1-FCT-1244','batch_retained_candidate'),
('V1-CARD-0336','V1-FCT-1245','batch_retained_candidate'),
('V1-CARD-0336','V1-FCT-1246','batch_retained_candidate'),
('V1-CARD-0337','V1-FCT-1247','batch_retained_candidate'),
('V1-CARD-0337','V1-FCT-1248','batch_retained_candidate'),
('V1-CARD-0338','V1-FCT-1249','batch_retained_candidate'),
('V1-CARD-0338','V1-FCT-1250','batch_retained_candidate'),
('V1-CARD-0339','V1-FCT-1251','batch_retained_candidate'),
('V1-CARD-0339','V1-FCT-1252','batch_retained_candidate'),
('V1-CARD-0340','V1-FCT-1253','batch_retained_candidate'),
('V1-CARD-0340','V1-FCT-1254','batch_retained_candidate'),
('V1-CARD-0341','V1-FCT-1255','batch_retained_candidate'),
('V1-CARD-0341','V1-FCT-1256','batch_retained_candidate'),
('V1-CARD-0342','V1-FCT-1257','batch_retained_candidate'),
('V1-CARD-0342','V1-FCT-1258','batch_retained_candidate'),
('V1-CARD-0343','V1-FCT-1259','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0642','WCD10-B05-S07','V1-CARD-0329','SRC-0099','B','bibliography_or_bounded_description','yes','no','SRC-0099','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0643','WCD10-B05-S08','V1-CARD-0329','SRC-0100','B','bibliography_or_bounded_description','yes','no','SRC-0100','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0644','WCD10-B05-S07','V1-CARD-0330','SRC-0099','B','bibliography_or_bounded_description','yes','no','SRC-0099','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0645','WCD10-B05-S12','V1-CARD-0330','SRC-0300','B','bibliography_or_bounded_description','yes','no','SRC-0300','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0646','WCD10-B05-S13','V1-CARD-0330','SRC-0397','B','bibliography_or_bounded_description','yes','no','SRC-0397','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0647','WCD10-B05-S19','V1-CARD-0330','SRC-0402','B','bibliography_or_bounded_description','yes','no','SRC-0402','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0648','WCD10-B05-S01','V1-CARD-0331','SRC-0134','B','bibliography_or_bounded_description','yes','no','SRC-0134','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0649','WCD10-B05-S14','V1-CARD-0331','SRC-0398','B','bibliography_or_bounded_description','yes','no','SRC-0398','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0650','WCD10-B05-S01','V1-CARD-0332','SRC-0134','B','bibliography_or_bounded_description','yes','no','SRC-0134','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0651','WCD10-B05-S15','V1-CARD-0332','SRC-0399','B','bibliography_or_bounded_description','yes','no','SRC-0399','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0652','WCD10-B05-S01','V1-CARD-0333','SRC-0134','B','bibliography_or_bounded_description','yes','no','SRC-0134','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0653','WCD10-B05-S16','V1-CARD-0333','SRC-0400','B','bibliography_or_bounded_description','yes','no','SRC-0400','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0654','WCD10-B05-S01','V1-CARD-0334','SRC-0134','B','bibliography_or_bounded_description','yes','no','SRC-0134','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0655','WCD10-B05-S17','V1-CARD-0334','SRC-0401','B','bibliography_or_bounded_description','yes','no','SRC-0401','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0656','WCD10-B05-S07','V1-CARD-0335','SRC-0099','B','bibliography_or_bounded_description','yes','no','SRC-0099','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0657','WCD10-B05-S20','V1-CARD-0335','SRC-0403','B','bibliography_or_bounded_description','yes','no','SRC-0403','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0658','WCD10-B05-S07','V1-CARD-0336','SRC-0099','B','bibliography_or_bounded_description','yes','no','SRC-0099','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0659','WCD10-B05-S12','V1-CARD-0336','SRC-0300','B','bibliography_or_bounded_description','yes','no','SRC-0300','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0660','WCD10-B05-S20','V1-CARD-0336','SRC-0403','B','bibliography_or_bounded_description','yes','no','SRC-0403','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0661','WCD10-B05-S21','V1-CARD-0336','SRC-0404','B','bibliography_or_bounded_description','yes','no','SRC-0404','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0662','WCD10-B05-S05','V1-CARD-0337','SRC-0130','B','bibliography_or_bounded_description','yes','no','SRC-0130','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0663','WCD10-B05-S09','V1-CARD-0337','SRC-0395','B','bibliography_or_bounded_description','yes','no','SRC-0395','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0664','WCD10-B05-S05','V1-CARD-0338','SRC-0130','B','bibliography_or_bounded_description','yes','no','SRC-0130','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0665','WCD10-B05-S06','V1-CARD-0338','SRC-0132','B','bibliography_or_bounded_description','yes','no','SRC-0132','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0666','WCD10-B05-S05','V1-CARD-0339','SRC-0130','B','bibliography_or_bounded_description','yes','no','SRC-0130','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0667','WCD10-B05-S11','V1-CARD-0339','SRC-0396','B','bibliography_or_bounded_description','yes','no','SRC-0396','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0668','WCD10-B05-S02','V1-CARD-0340','SRC-0135','B','bibliography_or_bounded_description','yes','no','SRC-0135','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0669','WCD10-B05-S03','V1-CARD-0341','SRC-0136','B','bibliography_or_bounded_description','yes','no','SRC-0136','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0670','WCD10-B05-S04','V1-CARD-0342','SRC-0137','B','bibliography_or_bounded_description','yes','no','SRC-0137','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0671','WCD10-B05-S23','V1-CARD-0343','SRC-0406','B','bibliography_or_bounded_description','yes','no','SRC-0406','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0389','WCD-10-B05','WCD10-B05-W01-CREATED','V1-ENT-0059','CREATED','V1-ENT-0421','奥克塔维奥·帕斯创作 ¿Águila o sol?','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0390','WCD-10-B05','WCD10-B05-W02-CREATED','V1-ENT-0059','CREATED','V1-ENT-0422','奥克塔维奥·帕斯创作 Ladera este','high','accepted','Codex-parent-independent-review:PASS','4','NONE'),
('V1-REL-0391','WCD-10-B05','WCD10-B05-W05-CREATED','V1-ENT-0171','CREATED','V1-ENT-0423','伊莎贝尔·阿连德创作 Cuentos de Eva Luna','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0392','WCD-10-B05','WCD10-B05-W06-CREATED','V1-ENT-0171','CREATED','V1-ENT-0424','伊莎贝尔·阿连德创作 Paula','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0393','WCD-10-B05','WCD10-B05-W07-CREATED','V1-ENT-0171','CREATED','V1-ENT-0425','伊莎贝尔·阿连德创作 Hija de la fortuna','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0394','WCD-10-B05','WCD10-B05-W08-CREATED','V1-ENT-0171','CREATED','V1-ENT-0426','伊莎贝尔·阿连德创作 La ciudad de las bestias','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0395','WCD-10-B05','WCD10-B05-W09-CREATED','V1-ENT-0059','CREATED','V1-ENT-0427','奥克塔维奥·帕斯创作 Libertad bajo palabra','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0396','WCD-10-B05','WCD10-B05-W10-CREATED','V1-ENT-0059','CREATED','V1-ENT-0428','奥克塔维奥·帕斯创作 La estación violenta','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0397','WCD-10-B05','WCD10-B05-R01','V1-ENT-0425','SET_IN','V1-ENT-0123','《幸运之女》开篇于智利瓦尔帕莱索的英国侨民殖民地，主人公在该城成长后主体情节移往加州。','high','accepted','Codex-parent-independent-review:PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0389','SRC-0099'),
('V1-REL-0389','SRC-0100'),
('V1-REL-0390','SRC-0099'),
('V1-REL-0390','SRC-0300'),
('V1-REL-0390','SRC-0397'),
('V1-REL-0390','SRC-0402'),
('V1-REL-0391','SRC-0134'),
('V1-REL-0391','SRC-0398'),
('V1-REL-0392','SRC-0134'),
('V1-REL-0392','SRC-0399'),
('V1-REL-0393','SRC-0134'),
('V1-REL-0393','SRC-0400'),
('V1-REL-0394','SRC-0134'),
('V1-REL-0394','SRC-0401'),
('V1-REL-0395','SRC-0099'),
('V1-REL-0395','SRC-0300'),
('V1-REL-0395','SRC-0403'),
('V1-REL-0396','SRC-0099'),
('V1-REL-0396','SRC-0300'),
('V1-REL-0396','SRC-0404'),
('V1-REL-0397','SRC-0400');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0436','V1-REL-0389','WCD10-B05-S07','SRC-0099','Octavio Paz – Bibliography','Works in Spanish 诗歌与散文书目：Libertad bajo palabra Tezontle 1949、¿Águila o sol? 1951、Piedra de sol Tezontle 1957、La estación violenta FCE 1958、Ladera este (1962-1968) Mortiz 1969、El mono gramático Seix Barral 1974等','奥克塔维奥·帕斯创作 ¿Águila o sol?','high','eligible_evidence','WCD-10-B05'),
('V1-EV-0437','V1-REL-0389','WCD10-B05-S08','SRC-0100','About Octavio Paz','传记段：¿Águila o sol? (Tezontle, 1951)为散文诗系列、Tamayo插图、对墨西哥过去现在未来的幻象式描绘；Piedra de sol FCE 1957借阿兹特克历法结构；El laberinto FCE 1950','奥克塔维奥·帕斯创作 ¿Águila o sol?','high','eligible_evidence','WCD-10-B05'),
('V1-EV-0438','V1-REL-0390','WCD10-B05-S07','SRC-0099','Octavio Paz – Bibliography','Works in Spanish 诗歌与散文书目：Libertad bajo palabra Tezontle 1949、¿Águila o sol? 1951、Piedra de sol Tezontle 1957、La estación violenta FCE 1958、Ladera este (1962-1968) Mortiz 1969、El mono gramático Seix Barral 1974等','奥克塔维奥·帕斯创作 Ladera este','high','eligible_evidence','WCD-10-B05'),
('V1-EV-0439','V1-REL-0390','WCD10-B05-S12','SRC-0300','Octavio Paz – Biographical','自传正文（驻法期间写成The Labyrinth of Solitude、1962驻印大使、印度时期著作especially The Grammarian Monkey and East Slope、1968抗议辞职）与自传书目（El laberinto. Cuadernos Americanos 1950，二版FCE 1959；¿Águila o sol? 1951；Ladera Este (1962-1968) Mortiz 1969；El mono gramático Seix Barral 1974；Libertad bajo palabra FCE 1949）','奥克塔维奥·帕斯创作 Ladera este','high','eligible_evidence','WCD-10-B05'),
('V1-EV-0440','V1-REL-0390','WCD10-B05-S13','SRC-0397','Joaquín Mortiz（Las Dos Orillas）出版目录 – Enciclopedia de la Literatura en México','Mortiz目录列表第16条：Ladera este (1962-1968)，1969，Paz, Octavio. México, D. F.: Joaquín Mortiz (Las Dos Orillas)','奥克塔维奥·帕斯创作 Ladera este','high','eligible_evidence','WCD-10-B05'),
('V1-EV-0441','V1-REL-0390','WCD10-B05-S19','SRC-0402','Ladera este (1962-1968) - Detalle de la obra','结构化字段：PRIMERA EDICIÓN=México, D. F., Joaquín Mortiz (Las Dos Orillas), 1969。正文：''El libro está dividido en tres secciones: Ladera este, que contiene cincuenta poemas; Hacia el comienzo, compuesto por quince poemas, y Blanco, poema largo aparecido por primera vez de manera independiente en 1967''；驻印度大使任内1962-1968写作、除''Cuento de dos jardines''外均写于阿富汗/锡兰/印度、可读作东方纪行bitácora、''Intermitencias del Oeste''四诗涉墨西哥与法国学生运动','奥克塔维奥·帕斯创作 Ladera este','high','eligible_evidence','WCD-10-B05'),
('V1-EV-0442','V1-REL-0391','WCD10-B05-S01','SRC-0134','Isabel Allende – Timeline','1989 The Stories of Eva Luna、1994 Paula、1999 Daughter of Fortune、2002 City of the Beasts 四条西语出版条目；另核1982/1984/1987既有三条目','伊莎贝尔·阿连德创作 Cuentos de Eva Luna','high','eligible_evidence','WCD-10-B05'),
('V1-EV-0443','V1-REL-0391','WCD10-B05-S14','SRC-0398','Isabel Allende – The Stories of Eva Luna','主页 First English edition ©1991 标记；/en/book/stories/summary 正文（应Rolf Carlé之请讲述从未讲过的故事、twenty-three则）','伊莎贝尔·阿连德创作 Cuentos de Eva Luna','high','eligible_evidence','WCD-10-B05'),
('V1-EV-0444','V1-REL-0392','WCD10-B05-S01','SRC-0134','Isabel Allende – Timeline','1989 The Stories of Eva Luna、1994 Paula、1999 Daughter of Fortune、2002 City of the Beasts 四条西语出版条目；另核1982/1984/1987既有三条目','伊莎贝尔·阿连德创作 Paula','high','eligible_evidence','WCD-10-B05'),
('V1-EV-0445','V1-REL-0392','WCD10-B05-S15','SRC-0399','Isabel Allende – Paula','主页 First English edition ©1995 标记；/en/book/paula/summary 正文（1991年12月女儿昏迷后陪护中开始写作的memoir）','伊莎贝尔·阿连德创作 Paula','high','eligible_evidence','WCD-10-B05'),
('V1-EV-0446','V1-REL-0393','WCD10-B05-S01','SRC-0134','Isabel Allende – Timeline','1989 The Stories of Eva Luna、1994 Paula、1999 Daughter of Fortune、2002 City of the Beasts 四条西语出版条目；另核1982/1984/1987既有三条目','伊莎贝尔·阿连德创作 Hija de la fortuna','high','eligible_evidence','WCD-10-B05'),
('V1-EV-0447','V1-REL-0393','WCD10-B05-S16','SRC-0400','Isabel Allende – Daughter of Fortune','主页 First English edition ©1999 标记；/en/book/daughter/summary 正文（Eliza Sommers在智利Valparaíso英国侨民家庭成长、1849淘金热北上加州）','伊莎贝尔·阿连德创作 Hija de la fortuna','high','eligible_evidence','WCD-10-B05'),
('V1-EV-0448','V1-REL-0394','WCD10-B05-S01','SRC-0134','Isabel Allende – Timeline','1989 The Stories of Eva Luna、1994 Paula、1999 Daughter of Fortune、2002 City of the Beasts 四条西语出版条目；另核1982/1984/1987既有三条目','伊莎贝尔·阿连德创作 La ciudad de las bestias','high','eligible_evidence','WCD-10-B05'),
('V1-EV-0449','V1-REL-0394','WCD10-B05-S17','SRC-0401','Isabel Allende – City of the Beasts','主页 First English edition ©2002 标记；/en/book/city/summary 正文（15岁Alexander Cold随International Geographic远征亚马逊、与Nadia深入雨林）','伊莎贝尔·阿连德创作 La ciudad de las bestias','high','eligible_evidence','WCD-10-B05'),
('V1-EV-0450','V1-REL-0395','WCD10-B05-S07','SRC-0099','Octavio Paz – Bibliography','Works in Spanish 诗歌与散文书目：Libertad bajo palabra Tezontle 1949、¿Águila o sol? 1951、Piedra de sol Tezontle 1957、La estación violenta FCE 1958、Ladera este (1962-1968) Mortiz 1969、El mono gramático Seix Barral 1974等','奥克塔维奥·帕斯创作 Libertad bajo palabra','high','eligible_evidence','WCD-10-B05'),
('V1-EV-0451','V1-REL-0395','WCD10-B05-S12','SRC-0300','Octavio Paz – Biographical','自传正文（驻法期间写成The Labyrinth of Solitude、1962驻印大使、印度时期著作especially The Grammarian Monkey and East Slope、1968抗议辞职）与自传书目（El laberinto. Cuadernos Americanos 1950，二版FCE 1959；¿Águila o sol? 1951；Ladera Este (1962-1968) Mortiz 1969；El mono gramático Seix Barral 1974；Libertad bajo palabra FCE 1949）','奥克塔维奥·帕斯创作 Libertad bajo palabra','high','eligible_evidence','WCD-10-B05'),
('V1-EV-0452','V1-REL-0395','WCD10-B05-S20','SRC-0403','Libertad bajo palabra - Detalle de la obra','结构化字段：PRIMERA EDICIÓN=México, D. F., Fondo de Cultura Económica, 1960。''Biografía del libro''节：''En principio…se refería sólo a un libro de noventa poemas que publicó en 1949 la editorial Fondo de Cultura Económica, dentro de la colección Tezontle, con un tiraje de 1,100 ejemplares. Ésta es la que conocemos como primera edición''；1960年obra poética (1935-1957)收225首、初拟题Todavía；1968三版、1979、1990定本；导语''La primera edición data de 1960''与其传记节1949表述页内并存；1990版207诗分五节含''¿Águila o sol?''''La estación violenta''','奥克塔维奥·帕斯创作 Libertad bajo palabra','high','eligible_evidence','WCD-10-B05'),
('V1-EV-0453','V1-REL-0396','WCD10-B05-S07','SRC-0099','Octavio Paz – Bibliography','Works in Spanish 诗歌与散文书目：Libertad bajo palabra Tezontle 1949、¿Águila o sol? 1951、Piedra de sol Tezontle 1957、La estación violenta FCE 1958、Ladera este (1962-1968) Mortiz 1969、El mono gramático Seix Barral 1974等','奥克塔维奥·帕斯创作 La estación violenta','high','eligible_evidence','WCD-10-B05'),
('V1-EV-0454','V1-REL-0396','WCD10-B05-S12','SRC-0300','Octavio Paz – Biographical','自传正文（驻法期间写成The Labyrinth of Solitude、1962驻印大使、印度时期著作especially The Grammarian Monkey and East Slope、1968抗议辞职）与自传书目（El laberinto. Cuadernos Americanos 1950，二版FCE 1959；¿Águila o sol? 1951；Ladera Este (1962-1968) Mortiz 1969；El mono gramático Seix Barral 1974；Libertad bajo palabra FCE 1949）','奥克塔维奥·帕斯创作 La estación violenta','high','eligible_evidence','WCD-10-B05'),
('V1-EV-0455','V1-REL-0396','WCD10-B05-S21','SRC-0404','La estación violenta - Detalle de la obra','结构化字段（FCE Letras Mexicanas;42/1958）+正文：主题两段标''contraportada 1958''、九诗清单标''contraportada 2013''（ELEM页内明示两处版次归属）','奥克塔维奥·帕斯创作 La estación violenta','high','eligible_evidence','WCD-10-B05'),
('V1-EV-0456','V1-REL-0397','WCD10-B05-S16','SRC-0400','Isabel Allende – Daughter of Fortune','主页 First English edition ©1999 标记；/en/book/daughter/summary 正文（Eliza Sommers在智利Valparaíso英国侨民家庭成长、1849淘金热北上加州）','《幸运之女》开篇于智利瓦尔帕莱索的英国侨民殖民地，主人公在该城成长后主体情节移往加州。','high','eligible_evidence','WCD-10-B05');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0123','WCD-10-B05-G01','research_gap','WCD10:B05:Paz:El_mono_gramatico:first_publication_semantics','open','USER policy remains unresolved: ELEM 8815 documents a 1972 French translation and a 1974 Spanish-original first edition. The project field semantics await USER direction; neither year is selected here. Preserve the full W03 object/evidence in W03_DEFERRED_CANDIDATE.json, then re-enter it for independent review and integration after USER resolves the policy, before TASK-127 completion.','','Independent Reviewer: preserve field_policy_pending_user','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0124','WCD-10-B05-G02','research_gap','WCD10:B05:Paz:Laberinto:first_edition_layering_resolved','open','R1修订：1950年Cuadernos Americanos首版、1959年FCE后版的分层结论有来源支持。F16追加式更正已并入本整合候选；旧source错配仍留痕，实际apply状态见VALIDATION。保留本gap及历史source refs，不删旧行、不声称旧链接已修好或已建立结构化supersession。','','Independent Reviewer: preserve layered_conclusion_with_F16_append_only_correction_candidate_old_source_mismatch_retained','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0125','WCD-10-B05-G03','research_gap','WCD10:B05:Paz:Piedra:imprint_layering_resolved','open','R1修订：Tezontle系FCE旗下丛书（ELEM将''Tezontle''登记为Editorial、FCE转载文直书''colección Tezontle del Fondo de Cultura Económica''，1957-09-28印300册）；''Tezontle vs FCE''并非互斥首版冲突，旧FCT-0319''Tezontle 1957''在imprint层面成立、无需勘误；原R0的F02撤回。','','Independent Reviewer: preserve layered_conclusion_no_errata_needed','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0126','WCD-10-B05-G04','research_gap','WCD10:B05:Paz:Salamandra_further_bibliography','open','Salamandra 1962、Blanco 1967、Viento entero 1965、Topoemas 1971、Pasado en claro 1975、Árbol adentro 1987、Sor Juana o las trampas de la fe 1982等仍有书目年份而对象级证据未集，不凑数新增。','','Independent Reviewer: preserve future_object_layer_research','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0127','WCD-10-B05-G05','research_gap','WCD10:B05:Paz:HOLD0043_second_source','open','HOLD-0043（0154 EXPLORES_THEME面具/自我折叠0107）第二独立来源仍缺；本轮ELEM/FCE新增实读均未提供该主题直接表述，hold维持。','','Independent Reviewer: preserve legacy_hold_retained','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0128','WCD-10-B05-G06','research_gap','WCD10:B05:Asturias:Papa_Verde_object_deferred','open','R1修订（审计R4）：1954 Losada年份可核（BnF），但USAC条目仅''香蕉三部曲/魔幻现实主义/政治内容''系列级标签，两轮定向检索未获可实读且针对本书内容的合格机构页（仅scribd/二手书 commercial目录/搜索摘要，均不合格）；按审计指示暂缓对象、不以泛化标签充数。后续可核Cervantes Virtual学术文集或纸质文献。','','Independent Reviewer: preserve object_deferred_no_qualified_content_source','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0129','WCD-10-B05-G07','research_gap','WCD10:B05:Asturias:trilogy_volumes_year_conflicts','open','R1修订：Viento fuerte现有BnF书目[1949]与诺贝尔自传页1950两个年份位置（后者并给内容描述''对美国帝国主义影响其国家经济现实的控诉''），年份冲突不立对象；Week-end en Guatemala（[1956] 1958）、Los ojos de los enterrados（[1960] 1961）描述仍缺。','','Independent Reviewer: preserve object_deferred_description_unsourced','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0130','WCD-10-B05-G08','research_gap','WCD10:B05:Asturias:Hombres_1948_1949_conflict','open','BnF引言1948 vs 同PDF书目[1949]+USAC 1949：维持库内1949（FCT-0364）；R0曾以F05跨主体research_note承载，R1撤回该事实候选，冲突仅存本deferred。','','Independent Reviewer: preserve conflicting_source_detail','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0131','WCD-10-B05-G09','research_gap','WCD10:B05:Asturias:SET_IN_Guatemala_unsupported','open','Señor Presidente国度未具名；BnF''Estrada Cabrera联想''与诺贝尔自传页''写于旅法期间/因政治原因迟至1946面世''均为背景而非场景陈述；三对象描述无''以危地马拉为背景''直接表述，不建SET_IN。','','Independent Reviewer: preserve no_direct_setting_evidence','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0132','WCD-10-B05-G10','research_gap','WCD10:B05:Allende:unnamed_country_setin','open','官网简介三度明书未具名国家；0176/0177/0178不据作者国籍生成SET_IN智利。','','Independent Reviewer: preserve no_direct_setting_evidence','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0133','WCD-10-B05-G11','research_gap','WCD10:B05:Allende:further_bibliography','open','时间线另有El plan infinitivo 1991、Afrodita 1997、Retrato en sepia 2000、Inés del alma mía 2006等年份；本批仍仅按证据最全的四种立对象。','','Independent Reviewer: preserve future_object_layer_research','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0134','WCD-10-B05-G12','research_gap','WCD10:B05:builder_research_note_mapping','open','审计R3：build_wcd10_migration.py将任何research_note固定映射为scholarly_paraphrase/attributed_study；本R1包已撤回全部B级research_note事实候选（F01/F02/F05）以避免虚增学术支持，Codex须在任何B05 SQL prepare前审核该生成器的证据层级映射。','','Independent Reviewer: preserve codex_tooling_review_required','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0135','WCD-10-B05-G13','research_gap','WCD10:B05:R01_partial_scene_boundary','open','审计R6：R01（W07 Hija de la fortuna SET_IN Chile）有开篇瓦尔帕莱索直接证据但仅部分场景；候选自限于研究层，未来读者地图若无法表达''部分场景''不得投影为整部作品地点关系——保留候选并请二轮语义复核确认该边界措辞。','','Independent Reviewer: preserve reviewer_boundary_opinion','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0136','WCD-10-B05-G14','research_gap','WCD10:B05:failed_access_entries','open','R0失败项不变；R1新增：El Papa Verde两轮定向检索仅得scribd/二手书目录/搜索摘要（不合格，未采用任何未开内容），ELEM站内检索JS-only仍未解（本轮直接按ID打开6个obra页成功）。详见SOURCE_ACCESS_LOG.json。','','Independent Reviewer: preserve access_log_recorded','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0137','WCD-10-B05-G15','research_gap','WCD10:B05:Paz:Laberinto:V1-FCT-0309:append_only_errata','open','F16追加式更正已由独立Reviewer核支持并并入本整合候选。保留本追溯gap，旧FCT-0309行和原source links（含错配）供后续历史证据清理；此处不声称旧链接已修好，不声称建立结构化supersession或实际apply。执行状态见VALIDATION。','','Independent Reviewer: preserve append_only_errata_candidate_integrated_pending_policy','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0138','WCD-10-B05:V1-ENT-0173','research_gap','WCD10:work_level_research:V1-ENT-0173','open','体裁与对象级概述补齐；''独裁者小说''归类入F05署名research_note；SET_IN危地马拉无直接背景表述保持缺口；首刊载体未核。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0139','WCD-10-B05:V1-ENT-0174','research_gap','WCD10:work_level_research:V1-ENT-0174','open','体裁与概述补齐（USAC封底简介转引，归属明确）；BnF引言1948旁支不采；作品级独立A级研究仍OPEN。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0140','WCD-10-B05:V1-ENT-0175','research_gap','WCD10:work_level_research:V1-ENT-0175','open','collection层级保持；体裁与概述补齐；单篇传说不建对象；BnF''首部书''定位为旁证。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0141','WCD-10-B05:V1-ENT-0176','research_gap','WCD10:work_level_research:V1-ENT-0176','open','体裁与概述补齐（作者官网简介）；国家未具名不生成SET_IN；改编影视与公开准入不在本通道。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0142','WCD-10-B05:V1-ENT-0177','research_gap','WCD10:work_level_research:V1-ENT-0177','open','体裁与概述补齐；军事独裁背景为虚构国家表述，不生成BASED_ON_EVENT/SET_IN。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0143','WCD-10-B05:V1-ENT-0178','research_gap','WCD10:work_level_research:V1-ENT-0178','open','体裁（流浪汉式自述）与概述补齐；与新增Cuentos de Eva Luna两对象分立；南美国度未具名。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0144','WCD-10-B05:WCD10-B05-W01','research_gap','WCD10:work_level_research:V1-ENT-0421','open','R1未改动（审计未涉）；作品级独立A级研究仍OPEN。中文显示名暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0145','WCD-10-B05:WCD10-B05-W02','research_gap','WCD10:work_level_research:V1-ENT-0422','open','Ladera east作品级独立A级研究仍OPEN；三部构成（50+15诗+Blanco）与Intermitencias del Oeste表述均归属ELEM专文。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0146','WCD-10-B05:WCD10-B05-W05','research_gap','WCD10:work_level_research:V1-ENT-0423','open','Cuentos de Eva Luna作品级独立A级研究及需第二来源的解释关系仍OPEN；与0178人物共享不建人物对象；''23则''限定官网简介所述版本。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0147','WCD-10-B05:WCD10-B05-W06','research_gap','WCD10:work_level_research:V1-ENT-0424','open','Paula作品级独立A级研究仍OPEN；家族史与讣告性内容不在本通道展开；女儿病况仅作写作背景。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0148','WCD-10-B05:WCD10-B05-W07','research_gap','WCD10:work_level_research:V1-ENT-0425','open','Hija de la fortuna作品级独立A级研究仍OPEN；SET_IN智利仅表开篇（R01待审）；加州主场景无库内端点。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0149','WCD-10-B05:WCD10-B05-W08','research_gap','WCD10:work_level_research:V1-ENT-0426','open','La ciudad de las bestias作品级独立A级研究仍OPEN；亚马逊背景无地点端点；续卷两册未立对象。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0150','WCD-10-B05:WCD10-B05-W09','research_gap','WCD10:work_level_research:V1-ENT-0427','open','R2修订（二轮R1-01）：简介逐版本限定——《El cántaro roto》与《太阳石》系初版后写出、仅入后续重编版；ELEM页内字段/导语(1960)与传记节(1949)差异已登记；如需对1960/1990版独立细述应按Schema另做edition分层（本批不建）。独立A级研究仍OPEN。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0151','WCD-10-B05:WCD10-B05-W10','research_gap','WCD10:work_level_research:V1-ENT-0428','open','R2修订（二轮R1-05）：九诗清单出处更正为2013年版封底（ELEM页明标），未独立核证与1958年初版目录相同；1958出版与时间主题证据不受影响。独立A级研究仍OPEN。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');

UPDATE metadata SET value='WCD-10-B05' WHERE key='last_change_set';

UPDATE metadata SET value='2026-10-07' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 406 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 426 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 424 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 343 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1253 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 1354 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1232 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 663 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 395 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 485 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 456 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 151 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
