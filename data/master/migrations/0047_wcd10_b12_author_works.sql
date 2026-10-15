-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: Codex-parent-independent-review

-- Registration sha256: bc8d33bb60cdd1797261ce93315f57b562e56f04bab9812497eb16c31b0522d1

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2048 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1268 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 608 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 636 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 634 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 2524 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2069 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 425 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 46 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 921 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 950 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 605 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 688 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B11' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0691' OR canonical_url='https://cvc.cervantes.es/actcult/arreola/biografia.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0692' OR canonical_url='https://cvc.cervantes.es/actcult/arreola/indice.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0693' OR canonical_url='https://www.elem.mx/obra/datos/151') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0694' OR canonical_url='https://www.elem.mx/obra/datos/147') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0695' OR canonical_url='https://fundacionelenaponiatowska.org/hasta-no-verte-jesus-mio') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0696' OR canonical_url='https://fundacionelenaponiatowska.org/la-noche-de-tlatelolco') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0697' OR canonical_url='https://www.elem.mx/obra/datos/2566') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0698' OR canonical_url='https://fundacionelenaponiatowska.org/tinisima') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0699' OR canonical_url='https://fundacionelenaponiatowska.org/querido-diego') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0700' OR canonical_url='https://www.elem.mx/obra/datos/204493') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0701' OR canonical_url='https://www.elem.mx/obra/datos/5751') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0702' OR canonical_url='https://cvc.cervantes.es/el_rinconete/anteriores/mayo_06/11052006_02.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0639' OR (entity_type='work' AND original_name='La hora de todos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0640' OR (entity_type='collection' AND original_name='Varia invención')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0641' OR (entity_type='collection' AND original_name='Palindroma')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0642' OR (entity_type='work' AND original_name='Querido Diego, te abraza Quiela')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0643' OR (entity_type='work' AND original_name='Fuerte es el silencio')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0644' OR (entity_type='collection' AND original_name='Los elementos de la noche')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0645' OR (entity_type='work' AND original_name='El reposo del fuego')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0646' OR (entity_type='collection' AND original_name='Irás y no volverás')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0647' OR (entity_type='collection' AND original_name='Islas a la deriva')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0648' OR (entity_type='collection' AND original_name='Desde entonces')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0649' OR (entity_type='collection' AND original_name='Los trabajos del mar')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0650' OR (entity_type='collection' AND original_name='Miro la tierra')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0651' OR (entity_type='collection' AND original_name='Ciudad de la memoria')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0652' OR (entity_type='collection' AND original_name='El silencio de la luna')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0653' OR (entity_type='collection' AND original_name='La arena errante')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0654' OR (entity_type='collection' AND original_name='Siglo pasado')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0655' OR (entity_type='collection' AND original_name='En resumidas cuentas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0656' OR (entity_type='collection' AND original_name='Como la lluvia')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0657' OR (entity_type='collection' AND original_name='La edad de las tinieblas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0658' OR (entity_type='collection' AND original_name='El viento distante')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0659' OR (entity_type='work' AND original_name='Morirás lejos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0660' OR (entity_type='work' AND original_name='El derecho a la lectura')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2076' OR (subject_id='V1-ENT-0639' AND fact_field='first_publication_year' AND value_text='1954')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2077' OR (subject_id='V1-ENT-0639' AND fact_field='genre_or_form' AND value_text='独幕喜剧剧本')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2078' OR (subject_id='V1-ENT-0639' AND fact_field='one_sentence_summary' AND value_text='一部独幕喜剧剧本；CVC所列书目未提供具体剧情概要。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2079' OR (subject_id='V1-ENT-0639' AND fact_field='bibliographic_note' AND value_text='CVC基本书目列作 La hora de todos [Juguete cómico en un acto]，墨西哥 Ediciones Los Presentes，1954。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2080' OR (subject_id='V1-ENT-0640' AND fact_field='first_publication_year' AND value_text='1949')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2081' OR (subject_id='V1-ENT-0640' AND fact_field='genre_or_form' AND value_text='短篇叙事作品集（Narrativa - Cuento）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2082' OR (subject_id='V1-ENT-0640' AND fact_field='one_sentence_summary' AND value_text='ELEM将《Confabulario》与《Varia invención》一并归入叙事短篇，并称1955年合刊汇集了多篇不同形态与意图的叙事文本。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2083' OR (subject_id='V1-ENT-0640' AND fact_field='bibliographic_note' AND value_text='CVC记录《Varia invención》1949年Fondo de Cultura Económica版；ELEM另载《Confabulario ; Varia invención : 1951-1955》1955年合刊，两条书目不改变1949年单行本年份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2084' OR (subject_id='V1-ENT-0641' AND fact_field='first_publication_year' AND value_text='1971')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2085' OR (subject_id='V1-ENT-0641' AND fact_field='genre_or_form' AND value_text='短篇叙事作品集（Narrativa - Cuento）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2086' OR (subject_id='V1-ENT-0641' AND fact_field='one_sentence_summary' AND value_text='ELEM的2016年版封底称书中部分篇章可以正读或倒读；此简介限于该版封底对文字游戏形式的描述。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2087' OR (subject_id='V1-ENT-0641' AND fact_field='bibliographic_note' AND value_text='CVC基本书目列 México, Joaquín Mortiz, 1971。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2088' OR (subject_id='V1-ENT-0642' AND fact_field='genre_or_form' AND value_text='书信体小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2089' OR (subject_id='V1-ENT-0642' AND fact_field='one_sentence_summary' AND value_text='作品以Angelina Beloff写给Diego Rivera的想象书信为叙述形式，描写她在巴黎的孤独、创作与被遗弃处境。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2090' OR (subject_id='V1-ENT-0642' AND fact_field='bibliographic_note' AND value_text='作者基金会页面列出Ediciones Era于1978年出版的版本；本候选据此记录版本信息，不据此单独断定首版年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2091' OR (subject_id='V1-ENT-0643' AND fact_field='first_publication_year' AND value_text='1980')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2092' OR (subject_id='V1-ENT-0643' AND fact_field='genre_or_form' AND value_text='纪实编年（crónica）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2093' OR (subject_id='V1-ENT-0643' AND fact_field='one_sentence_summary' AND value_text='全书以五组纪实叙事记录城市移民、1968运动记忆、政治犯家属及Cuernavaca社区行动。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2094' OR (subject_id='V1-ENT-0643' AND fact_field='bibliographic_note' AND value_text='墨西哥文学百科列1980年Era首版，并标为Narrativa-Crónica。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2095' OR (subject_id='V1-ENT-0644' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2096' OR (subject_id='V1-ENT-0644' AND fact_field='one_sentence_summary' AND value_text='Cervantes年表将其列入帕切科诗歌书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2097' OR (subject_id='V1-ENT-0644' AND fact_field='bibliographic_note' AND value_text='Instituto Cervantes年表列1963，Colegio Nacional列1962；首发年份口径待核，暂不填原子年份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2098' OR (subject_id='V1-ENT-0645' AND fact_field='first_publication_year' AND value_text='1966')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2099' OR (subject_id='V1-ENT-0645' AND fact_field='genre_or_form' AND value_text='长诗')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2100' OR (subject_id='V1-ENT-0645' AND fact_field='one_sentence_summary' AND value_text='全诗由三个部分（歌章）构成，是一首结构统一的长诗。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2101' OR (subject_id='V1-ENT-0645' AND fact_field='bibliographic_note' AND value_text='Enciclopedia de la Literatura en México记录1966年墨西哥城Fondo de Cultura Económica首版；该页将作品归为单首、分三部分的长诗。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2102' OR (subject_id='V1-ENT-0646' AND fact_field='first_publication_year' AND value_text='1973')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2103' OR (subject_id='V1-ENT-0646' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2104' OR (subject_id='V1-ENT-0646' AND fact_field='one_sentence_summary' AND value_text='Cervantes年表将其列入帕切科诗歌书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2105' OR (subject_id='V1-ENT-0646' AND fact_field='bibliographic_note' AND value_text='Cervantes年表将其列入帕切科诗歌书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2106' OR (subject_id='V1-ENT-0647' AND fact_field='first_publication_year' AND value_text='1976')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2107' OR (subject_id='V1-ENT-0647' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2108' OR (subject_id='V1-ENT-0647' AND fact_field='one_sentence_summary' AND value_text='Cervantes年表将其列入帕切科诗歌书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2109' OR (subject_id='V1-ENT-0647' AND fact_field='bibliographic_note' AND value_text='Cervantes年表将其列入帕切科诗歌书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2110' OR (subject_id='V1-ENT-0648' AND fact_field='first_publication_year' AND value_text='1980')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2111' OR (subject_id='V1-ENT-0648' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2112' OR (subject_id='V1-ENT-0648' AND fact_field='one_sentence_summary' AND value_text='Cervantes年表将其列入帕切科诗歌书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2113' OR (subject_id='V1-ENT-0648' AND fact_field='bibliographic_note' AND value_text='Cervantes年表将其列入帕切科诗歌书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2114' OR (subject_id='V1-ENT-0649' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2115' OR (subject_id='V1-ENT-0649' AND fact_field='one_sentence_summary' AND value_text='Cervantes年表将其列入诗歌书目；Colegio Nacional写作1984，首发年份暂不确定。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2116' OR (subject_id='V1-ENT-0649' AND fact_field='bibliographic_note' AND value_text='Instituto Cervantes年表列1983，Colegio Nacional列1984；首发年份口径待核，暂不填原子年份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2117' OR (subject_id='V1-ENT-0650' AND fact_field='first_publication_year' AND value_text='1987')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2118' OR (subject_id='V1-ENT-0650' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2119' OR (subject_id='V1-ENT-0650' AND fact_field='one_sentence_summary' AND value_text='Cervantes年表将其列入帕切科诗歌书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2120' OR (subject_id='V1-ENT-0650' AND fact_field='bibliographic_note' AND value_text='Cervantes年表将其列入帕切科诗歌书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2121' OR (subject_id='V1-ENT-0651' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2122' OR (subject_id='V1-ENT-0651' AND fact_field='one_sentence_summary' AND value_text='Cervantes年表将其列入诗歌书目；Colegio Nacional记为1989，保留年份差异。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2123' OR (subject_id='V1-ENT-0651' AND fact_field='bibliographic_note' AND value_text='Instituto Cervantes年表列1990，Colegio Nacional列1989；首发年份口径待核，暂不填原子年份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2124' OR (subject_id='V1-ENT-0652' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2125' OR (subject_id='V1-ENT-0652' AND fact_field='one_sentence_summary' AND value_text='Cervantes年表将其列入诗歌书目；Colegio Nacional记为1994，保留年份差异。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2126' OR (subject_id='V1-ENT-0652' AND fact_field='bibliographic_note' AND value_text='Instituto Cervantes年表列1996，Colegio Nacional列1994；首发年份口径待核，暂不填原子年份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2127' OR (subject_id='V1-ENT-0653' AND fact_field='first_publication_year' AND value_text='1999')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2128' OR (subject_id='V1-ENT-0653' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2129' OR (subject_id='V1-ENT-0653' AND fact_field='one_sentence_summary' AND value_text='Cervantes年表将其列入诗歌书目；Colegio Nacional将其列作1999诗作。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2130' OR (subject_id='V1-ENT-0653' AND fact_field='bibliographic_note' AND value_text='Cervantes年表将其列入诗歌书目；Colegio Nacional将其列作1999诗作。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2131' OR (subject_id='V1-ENT-0654' AND fact_field='first_publication_year' AND value_text='2000')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2132' OR (subject_id='V1-ENT-0654' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2133' OR (subject_id='V1-ENT-0654' AND fact_field='one_sentence_summary' AND value_text='Cervantes年表将其列入帕切科诗歌书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2134' OR (subject_id='V1-ENT-0654' AND fact_field='bibliographic_note' AND value_text='Cervantes年表将其列入帕切科诗歌书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2135' OR (subject_id='V1-ENT-0655' AND fact_field='first_publication_year' AND value_text='2005')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2136' OR (subject_id='V1-ENT-0655' AND fact_field='genre_or_form' AND value_text='诗集选集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2137' OR (subject_id='V1-ENT-0655' AND fact_field='one_sentence_summary' AND value_text='2005年诗选，收录帕切科1958年至2000年间创作的诗歌选篇。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2138' OR (subject_id='V1-ENT-0655' AND fact_field='bibliographic_note' AND value_text='Cervantes年表将其列入帕切科诗歌书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2139' OR (subject_id='V1-ENT-0656' AND fact_field='first_publication_year' AND value_text='2009')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2140' OR (subject_id='V1-ENT-0656' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2141' OR (subject_id='V1-ENT-0656' AND fact_field='one_sentence_summary' AND value_text='Cervantes年表将其列入帕切科诗歌书目；Colegio Nacional同列2009年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2142' OR (subject_id='V1-ENT-0656' AND fact_field='bibliographic_note' AND value_text='Cervantes年表将其列入帕切科诗歌书目；Colegio Nacional同列2009年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2143' OR (subject_id='V1-ENT-0657' AND fact_field='first_publication_year' AND value_text='2009')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2144' OR (subject_id='V1-ENT-0657' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2145' OR (subject_id='V1-ENT-0657' AND fact_field='one_sentence_summary' AND value_text='Cervantes年表将其列入帕切科诗歌书目；Colegio Nacional同列2009年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2146' OR (subject_id='V1-ENT-0657' AND fact_field='bibliographic_note' AND value_text='Cervantes年表将其列入帕切科诗歌书目；Colegio Nacional同列2009年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2147' OR (subject_id='V1-ENT-0658' AND fact_field='first_publication_year' AND value_text='1963')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2148' OR (subject_id='V1-ENT-0658' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2149' OR (subject_id='V1-ENT-0658' AND fact_field='one_sentence_summary' AND value_text='Cervantes年表列为1963年小说类作品；Colegio Nacional将其与早期短篇作品并列。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2150' OR (subject_id='V1-ENT-0658' AND fact_field='bibliographic_note' AND value_text='Cervantes年表列为1963年小说类作品；Colegio Nacional将其与早期短篇作品并列。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2151' OR (subject_id='V1-ENT-0659' AND fact_field='first_publication_year' AND value_text='1967')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2152' OR (subject_id='V1-ENT-0659' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2153' OR (subject_id='V1-ENT-0659' AND fact_field='one_sentence_summary' AND value_text='Cervantes年表列于小说类；Colegio Nacional明确称其为小说。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2154' OR (subject_id='V1-ENT-0659' AND fact_field='bibliographic_note' AND value_text='Cervantes年表列于小说类；Colegio Nacional明确称其为小说。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2155' OR (subject_id='V1-ENT-0660' AND fact_field='first_publication_year' AND value_text='1994')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2156' OR (subject_id='V1-ENT-0660' AND fact_field='genre_or_form' AND value_text='散文')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2157' OR (subject_id='V1-ENT-0660' AND fact_field='one_sentence_summary' AND value_text='Cervantes年表将其列入散文书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2158' OR (subject_id='V1-ENT-0660' AND fact_field='bibliographic_note' AND value_text='Cervantes年表将其列入散文书目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2159' OR (subject_id='V1-ENT-0257' AND fact_field='genre_or_form' AND value_text='短篇叙事作品集（Narrativa - Cuento）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2160' OR (subject_id='V1-ENT-0257' AND fact_field='one_sentence_summary' AND value_text='ELEM将《Confabulario》与《Varia invención》并列为1955年合刊中的两部作品，并称该卷汇聚多篇不同形态与意图的叙事文本；不据此另建合刊实体。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2161' OR (subject_id='V1-ENT-0258' AND fact_field='genre_or_form' AND value_text='动物题材短篇文本集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2162' OR (subject_id='V1-ENT-0258' AND fact_field='one_sentence_summary' AND value_text='目录列有《El rinoceronte》《Aves de rapiña》《El oso》《La jirafa》等动物题名；CVC生平记载该系列1958年以《Punta de plata》为名初版，基本书目另列1972年《Bestiario》版本。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2163' OR (subject_id='V1-ENT-0259' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2164' OR (subject_id='V1-ENT-0259' AND fact_field='one_sentence_summary' AND value_text='阿雷奥拉唯一小说，围绕Zapotlán及作者父亲展开，材料源自早年笔记；不扩写具体情节。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2165' OR (subject_id='V1-ENT-0264' AND fact_field='genre_or_form' AND value_text='证言小说（relato-testimonio）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2166' OR (subject_id='V1-ENT-0264' AND fact_field='one_sentence_summary' AND value_text='小说借Jesusa Palancares的讲述，呈现她随革命军辗转、在墨西哥城谋生并以灵性信念寻求慰藉的经历。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2167' OR (subject_id='V1-ENT-0263' AND fact_field='genre_or_form' AND value_text='纪实编年（crónica）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2168' OR (subject_id='V1-ENT-0263' AND fact_field='one_sentence_summary' AND value_text='作品汇集多方声音与证言，重构1968年墨西哥学生运动及10月2日事件的经历与记忆。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2169' OR (subject_id='V1-ENT-0265' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2170' OR (subject_id='V1-ENT-0265' AND fact_field='one_sentence_summary' AND value_text='小说以Tina Modotti为中心，写她在摄影创作、政治活动与私人关系之间经历的生命历程。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2171' OR (subject_id='V1-ENT-0266' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2172' OR (subject_id='V1-ENT-0266' AND fact_field='one_sentence_summary' AND value_text='Colegio Nacional将其列为帕切科的两部小说之一。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2173' OR (subject_id='V1-ENT-0267' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2174' OR (subject_id='V1-ENT-0267' AND fact_field='one_sentence_summary' AND value_text='Colegio Nacional将其列在帕切科的早期短篇作品中。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2175' OR (subject_id='V1-ENT-0268' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2176' OR (subject_id='V1-ENT-0268' AND fact_field='one_sentence_summary' AND value_text='帕切科1969年诗集；Colegio Nacional将其列入作者诗歌作品序列。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0608' OR (subject_id='V1-ENT-0250' AND relation_type='CREATED' AND object_id='V1-ENT-0639')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0609' OR (subject_id='V1-ENT-0250' AND relation_type='CREATED' AND object_id='V1-ENT-0640')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0610' OR (subject_id='V1-ENT-0250' AND relation_type='CREATED' AND object_id='V1-ENT-0641')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0611' OR (subject_id='V1-ENT-0260' AND relation_type='CREATED' AND object_id='V1-ENT-0642')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0612' OR (subject_id='V1-ENT-0260' AND relation_type='CREATED' AND object_id='V1-ENT-0643')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0613' OR (subject_id='V1-ENT-0261' AND relation_type='CREATED' AND object_id='V1-ENT-0644')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0614' OR (subject_id='V1-ENT-0261' AND relation_type='CREATED' AND object_id='V1-ENT-0645')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0615' OR (subject_id='V1-ENT-0261' AND relation_type='CREATED' AND object_id='V1-ENT-0646')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0616' OR (subject_id='V1-ENT-0261' AND relation_type='CREATED' AND object_id='V1-ENT-0647')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0617' OR (subject_id='V1-ENT-0261' AND relation_type='CREATED' AND object_id='V1-ENT-0648')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0618' OR (subject_id='V1-ENT-0261' AND relation_type='CREATED' AND object_id='V1-ENT-0649')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0619' OR (subject_id='V1-ENT-0261' AND relation_type='CREATED' AND object_id='V1-ENT-0650')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0620' OR (subject_id='V1-ENT-0261' AND relation_type='CREATED' AND object_id='V1-ENT-0651')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0621' OR (subject_id='V1-ENT-0261' AND relation_type='CREATED' AND object_id='V1-ENT-0652')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0622' OR (subject_id='V1-ENT-0261' AND relation_type='CREATED' AND object_id='V1-ENT-0653')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0623' OR (subject_id='V1-ENT-0261' AND relation_type='CREATED' AND object_id='V1-ENT-0654')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0624' OR (subject_id='V1-ENT-0261' AND relation_type='CREATED' AND object_id='V1-ENT-0655')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0625' OR (subject_id='V1-ENT-0261' AND relation_type='CREATED' AND object_id='V1-ENT-0656')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0626' OR (subject_id='V1-ENT-0261' AND relation_type='CREATED' AND object_id='V1-ENT-0657')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0627' OR (subject_id='V1-ENT-0261' AND relation_type='CREATED' AND object_id='V1-ENT-0658')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0628' OR (subject_id='V1-ENT-0261' AND relation_type='CREATED' AND object_id='V1-ENT-0659')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0629' OR (subject_id='V1-ENT-0261' AND relation_type='CREATED' AND object_id='V1-ENT-0660')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0691','WCD10-B12-S002','CVC. Juan José Arreola. Biografía','CVC. Juan José Arreola. Biografía','Centro Virtual Cervantes；作者署名 Luis Miguel Madrid','','Instituto Cervantes','','','institutional_web_biography','','es','B','access_pass','WCD-10-B12','B12 Research candidate metadata only; no public admission implied','remote_only','','https://cvc.cervantes.es/actcult/arreola/biografia.htm'),
('SRC-0692','WCD10-B12-S003','CVC. Juan José Arreola. Índice','CVC. Juan José Arreola. Índice','Centro Virtual Cervantes','','Instituto Cervantes','','','institutional_web_contents_index','','es','B','access_pass','WCD-10-B12','B12 Research candidate metadata only; no public admission implied','remote_only','','https://cvc.cervantes.es/actcult/arreola/indice.htm'),
('SRC-0693','WCD10-B12-S004','Palindroma - Detalle de la obra - Enciclopedia de la Literatura en México','Palindroma - Detalle de la obra - Enciclopedia de la Literatura en México','Fundación para las Letras Mexicanas; Secretaría General Iberoamericana','','Fundación para las Letras Mexicanas / Secretaría General Iberoamericana','','','institutional_literary_catalog_entry','','es','B','access_pass','WCD-10-B12','B12 Research candidate metadata only; no public admission implied','remote_only','','https://www.elem.mx/obra/datos/151'),
('SRC-0694','WCD10-B12-S005','Confabulario ; Varia invención : 1951-1955 - Detalle de la obra - Enciclopedia de la Literatura en México','Confabulario ; Varia invención : 1951-1955 - Detalle de la obra - Enciclopedia de la Literatura en México','Fundación para las Letras Mexicanas; Secretaría General Iberoamericana','','Fundación para las Letras Mexicanas / Secretaría General Iberoamericana','','','institutional_literary_catalog_entry','','es','B','access_pass','WCD-10-B12','B12 Research candidate metadata only; no public admission implied','remote_only','','https://www.elem.mx/obra/datos/147'),
('SRC-0695','WCD10-B12-S101','Hasta no verte jesus mio | Fundación Elena Poniatowska Amor A.C.','Hasta no verte jesus mio | Fundación Elena Poniatowska Amor A.C.','Fundación Elena Poniatowska Amor A.C.','','Fundación Elena Poniatowska Amor A.C.','','','institutional_web_page','','es','B','access_pass','WCD-10-B12','B12 Research candidate metadata only; no public admission implied','remote_only','','https://fundacionelenaponiatowska.org/hasta-no-verte-jesus-mio'),
('SRC-0696','WCD10-B12-S102','La noche de Tlatelolco | Fundación Elena Poniatowska Amor A.C.','La noche de Tlatelolco | Fundación Elena Poniatowska Amor A.C.','Fundación Elena Poniatowska Amor A.C.','','Fundación Elena Poniatowska Amor A.C.','','','institutional_web_page','','es','B','access_pass','WCD-10-B12','B12 Research candidate metadata only; no public admission implied','remote_only','','https://fundacionelenaponiatowska.org/la-noche-de-tlatelolco'),
('SRC-0697','WCD10-B12-S103','Tinísima - Detalle de la obra - Enciclopedia de la Literatura en México - FLM','Tinísima - Detalle de la obra - Enciclopedia de la Literatura en México - FLM','Fundación para las Letras Mexicanas / Enciclopedia de la Literatura en México','','Fundación para las Letras Mexicanas / Enciclopedia de la Literatura en México','','','institutional_web_page','','es','B','access_pass','WCD-10-B12','B12 Research candidate metadata only; no public admission implied','remote_only','','https://www.elem.mx/obra/datos/2566'),
('SRC-0698','WCD10-B12-S104','Tinísima | Fundación Elena Poniatowska Amor A.C.','Tinísima | Fundación Elena Poniatowska Amor A.C.','Fundación Elena Poniatowska Amor A.C.','','Fundación Elena Poniatowska Amor A.C.','','','institutional_web_page','','es','B','access_pass','WCD-10-B12','B12 Research candidate metadata only; no public admission implied','remote_only','','https://fundacionelenaponiatowska.org/tinisima'),
('SRC-0699','WCD10-B12-S105','Querido Diego | Fundación Elena Poniatowska Amor A.C.','Querido Diego | Fundación Elena Poniatowska Amor A.C.','Fundación Elena Poniatowska Amor A.C.','','Fundación Elena Poniatowska Amor A.C.','','','institutional_web_page','','es','B','access_pass','WCD-10-B12','B12 Research candidate metadata only; no public admission implied','remote_only','','https://fundacionelenaponiatowska.org/querido-diego'),
('SRC-0700','WCD10-B12-S106','Fuerte es el silencio - Detalle de la obra - Enciclopedia de la Literatura en México - FLM','Fuerte es el silencio - Detalle de la obra - Enciclopedia de la Literatura en México - FLM','Fundación para las Letras Mexicanas / Enciclopedia de la Literatura en México','','Fundación para las Letras Mexicanas / Enciclopedia de la Literatura en México','','','institutional_web_page','','es','B','access_pass','WCD-10-B12','B12 Research candidate metadata only; no public admission implied','remote_only','','https://www.elem.mx/obra/datos/204493'),
('SRC-0701','WCD10-B12-S204','El reposo del fuego — Detalle de la obra — Enciclopedia de la Literatura en México','El reposo del fuego — Detalle de la obra — Enciclopedia de la Literatura en México','Enciclopedia de la Literatura en México','','Fundación para las Letras Mexicanas / Enciclopedia de la Literatura en México','2018','','institutional_bibliographic_entry','','es','B','access_pass','WCD-10-B12','B12 Research candidate metadata only; no public admission implied','remote_only','','https://www.elem.mx/obra/datos/5751'),
('SRC-0702','WCD10-B12-S205','José Emilio Pacheco — Rinconete, Centro Virtual Cervantes','José Emilio Pacheco — Rinconete, Centro Virtual Cervantes','Concepción Bados Ciria','','Instituto Cervantes','2006','','institutional_literary_essay','','es','B','access_pass','WCD-10-B12','B12 Research candidate metadata only; no public admission implied','remote_only','','https://cvc.cervantes.es/el_rinconete/anteriores/mayo_06/11052006_02.htm');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0639','work','《众人的时刻》','La hora de todos','candidate','1','WCD10-B12-W001','CVC基本书目直接列出作品和1954书目，注明为独幕喜剧；补录一部有直接书目依据的戏剧作品。; 中文为检索工作译名，西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0640','collection','《多种发明》','Varia invención','candidate','1','WCD10-B12-W002','CVC基本书目列出1949年Fondo de Cultura Económica版；CVC生平指出该书为作者获得认可的早期作品之一。按DEC-070补主要作品的基本书目与受限内容。; 中文为检索工作译名，西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0641','collection','《回文》','Palindroma','candidate','1','WCD10-B12-W003','CVC基本书目直接列出1971年Joaquín Mortiz版。纳入主要作品书目；简介限于作品集身份，不推测篇目和主题。; 中文为检索工作译名，西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0642','work','《亲爱的迭戈，奎埃拉致意》','Querido Diego, te abraza Quiela','candidate','1','WCD10-B12-W101','基线作者作品清单仅有三部既有作品；此项是可由作者基金会或墨西哥文学百科直接核对的主要独立作品，按DEC-070有界补录，不表示全集完备。; 中文为检索工作译名，西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0643','work','《沉默坚如磐石》','Fuerte es el silencio','candidate','1','WCD10-B12-W102','基线作者作品清单仅有三部既有作品；此项是可由作者基金会或墨西哥文学百科直接核对的主要独立作品，按DEC-070有界补录，不表示全集完备。; 中文为检索工作译名，西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0644','collection','《夜的元素》','Los elementos de la noche','candidate','1','WCD10-B12-W201','Cervantes机构年表直接列出题名、分类与书目年份；只补有来源的书目、体裁和边界简介。; 中文为检索工作译名；西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0645','work','《火的安息》','El reposo del fuego','candidate','1','WCD10-B12-W202','Enciclopedia de la Literatura en México直接记录1966年首版和出版者，并将作品说明为分三部分/歌章的单一长诗；Cervantes与Colegio Nacional也直接列诗作/1966书目。; 中文为检索工作译名；西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0646','collection','《你将去而不返》','Irás y no volverás','candidate','1','WCD10-B12-W203','Cervantes机构年表直接列出题名、分类与书目年份；只补有来源的书目、体裁和边界简介。; 中文为检索工作译名；西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0647','collection','《漂流的群岛》','Islas a la deriva','candidate','1','WCD10-B12-W204','Cervantes机构年表直接列出题名、分类与书目年份；只补有来源的书目、体裁和边界简介。; 中文为检索工作译名；西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0648','collection','《从那时起》','Desde entonces','candidate','1','WCD10-B12-W205','Cervantes机构年表直接列出题名、分类与书目年份；只补有来源的书目、体裁和边界简介。; 中文为检索工作译名；西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0649','collection','《海的劳作》','Los trabajos del mar','candidate','1','WCD10-B12-W206','Cervantes机构年表直接列出题名、分类与书目年份；只补有来源的书目、体裁和边界简介。; 中文为检索工作译名；西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0650','collection','《我望向大地》','Miro la tierra','candidate','1','WCD10-B12-W207','Cervantes机构年表直接列出题名、分类与书目年份；只补有来源的书目、体裁和边界简介。; 中文为检索工作译名；西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0651','collection','《记忆之城》','Ciudad de la memoria','candidate','1','WCD10-B12-W208','Cervantes机构年表直接列出题名、分类与书目年份；只补有来源的书目、体裁和边界简介。; 中文为检索工作译名；西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0652','collection','《月亮的沉默》','El silencio de la luna','candidate','1','WCD10-B12-W209','Cervantes机构年表直接列出题名、分类与书目年份；只补有来源的书目、体裁和边界简介。; 中文为检索工作译名；西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0653','collection','《流动的沙》','La arena errante','candidate','1','WCD10-B12-W210','Cervantes机构年表直接列出题名、分类与书目年份；只补有来源的书目、体裁和边界简介。; 中文为检索工作译名；西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0654','collection','《上个世纪》','Siglo pasado','candidate','1','WCD10-B12-W211','Cervantes机构年表直接列出题名、分类与书目年份；只补有来源的书目、体裁和边界简介。; 中文为检索工作译名；西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0655','collection','《总而言之》','En resumidas cuentas','candidate','1','WCD10-B12-W212','Cervantes机构年表直接列出题名、分类与书目年份；只补有来源的书目、体裁和边界简介。; 中文为检索工作译名；西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0656','collection','《如同雨》','Como la lluvia','candidate','1','WCD10-B12-W213','Cervantes机构年表直接列出题名、分类与书目年份；只补有来源的书目、体裁和边界简介。; 中文为检索工作译名；西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0657','collection','《黑暗的年代》','La edad de las tinieblas','candidate','1','WCD10-B12-W214','Cervantes机构年表直接列出题名、分类与书目年份；只补有来源的书目、体裁和边界简介。; 中文为检索工作译名；西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0658','collection','《远方的风》','El viento distante','candidate','1','WCD10-B12-W215','Cervantes机构年表直接列出题名、分类与书目年份；只补有来源的书目、体裁和边界简介。; 中文为检索工作译名；西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0659','work','《你将在远方死去》','Morirás lejos','candidate','1','WCD10-B12-W216','Cervantes机构年表直接列出题名、分类与书目年份；只补有来源的书目、体裁和边界简介。; 中文为检索工作译名；西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0660','work','《阅读的权利》','El derecho a la lectura','candidate','1','WCD10-B12-W218','Cervantes机构年表直接列出题名、分类与书目年份；只补有来源的书目、体裁和边界简介。; 中文为检索工作译名；西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0635','WCD10-B12-W001','WCD-10-B12','WCD10-B12-W001','V1-ENT-0639','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0636','WCD10-B12-W002','WCD-10-B12','WCD10-B12-W002','V1-ENT-0640','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0637','WCD10-B12-W003','WCD-10-B12','WCD10-B12-W003','V1-ENT-0641','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0638','WCD10-B12-W101','WCD-10-B12','WCD10-B12-W101','V1-ENT-0642','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0639','WCD10-B12-W102','WCD-10-B12','WCD10-B12-W102','V1-ENT-0643','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0640','WCD10-B12-W201','WCD-10-B12','WCD10-B12-W201','V1-ENT-0644','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0641','WCD10-B12-W202','WCD-10-B12','WCD10-B12-W202','V1-ENT-0645','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0642','WCD10-B12-W203','WCD-10-B12','WCD10-B12-W203','V1-ENT-0646','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0643','WCD10-B12-W204','WCD-10-B12','WCD10-B12-W204','V1-ENT-0647','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0644','WCD10-B12-W205','WCD-10-B12','WCD10-B12-W205','V1-ENT-0648','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0645','WCD10-B12-W206','WCD-10-B12','WCD10-B12-W206','V1-ENT-0649','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0646','WCD10-B12-W207','WCD-10-B12','WCD10-B12-W207','V1-ENT-0650','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0647','WCD10-B12-W208','WCD-10-B12','WCD10-B12-W208','V1-ENT-0651','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0648','WCD10-B12-W209','WCD-10-B12','WCD10-B12-W209','V1-ENT-0652','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0649','WCD10-B12-W210','WCD-10-B12','WCD10-B12-W210','V1-ENT-0653','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0650','WCD10-B12-W211','WCD-10-B12','WCD10-B12-W211','V1-ENT-0654','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0651','WCD10-B12-W212','WCD-10-B12','WCD10-B12-W212','V1-ENT-0655','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0652','WCD10-B12-W213','WCD-10-B12','WCD10-B12-W213','V1-ENT-0656','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0653','WCD10-B12-W214','WCD-10-B12','WCD10-B12-W214','V1-ENT-0657','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0654','WCD10-B12-W215','WCD-10-B12','WCD10-B12-W215','V1-ENT-0658','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0655','WCD10-B12-W216','WCD-10-B12','WCD10-B12-W216','V1-ENT-0659','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0656','WCD10-B12-W218','WCD-10-B12','WCD10-B12-W218','V1-ENT-0660','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0609','WCD-10-B12:V1-ENT-0639','V1-ENT-0639','work','《众人的时刻》','胡安·何塞·阿雷奥拉','La hora de todos','墨西哥','es','1954','独幕喜剧剧本','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《众人的时刻》｜La hora de todos

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1954
- genre_or_form：独幕喜剧剧本
- one_sentence_summary：一部独幕喜剧剧本；CVC所列书目未提供具体剧情概要。
- bibliographic_note：CVC基本书目列作 La hora de todos [Juguete cómico en un acto]，墨西哥 Ediciones Los Presentes，1954。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0610','WCD-10-B12:V1-ENT-0640','V1-ENT-0640','collection','《多种发明》','胡安·何塞·阿雷奥拉','Varia invención','墨西哥','es','1949','短篇叙事作品集（Narrativa - Cuento）','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《多种发明》｜Varia invención

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1949
- genre_or_form：短篇叙事作品集（Narrativa - Cuento）
- one_sentence_summary：ELEM将《Confabulario》与《Varia invención》一并归入叙事短篇，并称1955年合刊汇集了多篇不同形态与意图的叙事文本。
- bibliographic_note：CVC记录《Varia invención》1949年Fondo de Cultura Económica版；ELEM另载《Confabulario ; Varia invención : 1951-1955》1955年合刊，两条书目不改变1949年单行本年份。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0611','WCD-10-B12:V1-ENT-0641','V1-ENT-0641','collection','《回文》','胡安·何塞·阿雷奥拉','Palindroma','墨西哥','es','1971','短篇叙事作品集（Narrativa - Cuento）','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《回文》｜Palindroma

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1971
- genre_or_form：短篇叙事作品集（Narrativa - Cuento）
- one_sentence_summary：ELEM的2016年版封底称书中部分篇章可以正读或倒读；此简介限于该版封底对文字游戏形式的描述。
- bibliographic_note：CVC基本书目列 México, Joaquín Mortiz, 1971。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0612','WCD-10-B12:V1-ENT-0642','V1-ENT-0642','work','《亲爱的迭戈，奎埃拉致意》','埃莱娜·波尼亚托夫斯卡','Querido Diego, te abraza Quiela','墨西哥','es','','书信体小说','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《亲爱的迭戈，奎埃拉致意》｜Querido Diego, te abraza Quiela

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：书信体小说
- one_sentence_summary：作品以Angelina Beloff写给Diego Rivera的想象书信为叙述形式，描写她在巴黎的孤独、创作与被遗弃处境。
- bibliographic_note：作者基金会页面列出Ediciones Era于1978年出版的版本；本候选据此记录版本信息，不据此单独断定首版年。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0613','WCD-10-B12:V1-ENT-0643','V1-ENT-0643','work','《沉默坚如磐石》','埃莱娜·波尼亚托夫斯卡','Fuerte es el silencio','墨西哥','es','1980','纪实编年（crónica）','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《沉默坚如磐石》｜Fuerte es el silencio

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1980
- genre_or_form：纪实编年（crónica）
- one_sentence_summary：全书以五组纪实叙事记录城市移民、1968运动记忆、政治犯家属及Cuernavaca社区行动。
- bibliographic_note：墨西哥文学百科列1980年Era首版，并标为Narrativa-Crónica。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0614','WCD-10-B12:V1-ENT-0644','V1-ENT-0644','collection','《夜的元素》','何塞·埃米利奥·帕切科','Los elementos de la noche','墨西哥','es','','诗集','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《夜的元素》｜Los elementos de la noche

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗集
- one_sentence_summary：Cervantes年表将其列入帕切科诗歌书目。
- bibliographic_note：Instituto Cervantes年表列1963，Colegio Nacional列1962；首发年份口径待核，暂不填原子年份。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0615','WCD-10-B12:V1-ENT-0645','V1-ENT-0645','work','《火的安息》','何塞·埃米利奥·帕切科','El reposo del fuego','墨西哥','es','1966','长诗','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《火的安息》｜El reposo del fuego

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1966
- genre_or_form：长诗
- one_sentence_summary：全诗由三个部分（歌章）构成，是一首结构统一的长诗。
- bibliographic_note：Enciclopedia de la Literatura en México记录1966年墨西哥城Fondo de Cultura Económica首版；该页将作品归为单首、分三部分的长诗。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0616','WCD-10-B12:V1-ENT-0646','V1-ENT-0646','collection','《你将去而不返》','何塞·埃米利奥·帕切科','Irás y no volverás','墨西哥','es','1973','诗集','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《你将去而不返》｜Irás y no volverás

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1973
- genre_or_form：诗集
- one_sentence_summary：Cervantes年表将其列入帕切科诗歌书目。
- bibliographic_note：Cervantes年表将其列入帕切科诗歌书目。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0617','WCD-10-B12:V1-ENT-0647','V1-ENT-0647','collection','《漂流的群岛》','何塞·埃米利奥·帕切科','Islas a la deriva','墨西哥','es','1976','诗集','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《漂流的群岛》｜Islas a la deriva

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1976
- genre_or_form：诗集
- one_sentence_summary：Cervantes年表将其列入帕切科诗歌书目。
- bibliographic_note：Cervantes年表将其列入帕切科诗歌书目。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0618','WCD-10-B12:V1-ENT-0648','V1-ENT-0648','collection','《从那时起》','何塞·埃米利奥·帕切科','Desde entonces','墨西哥','es','1980','诗集','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《从那时起》｜Desde entonces

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1980
- genre_or_form：诗集
- one_sentence_summary：Cervantes年表将其列入帕切科诗歌书目。
- bibliographic_note：Cervantes年表将其列入帕切科诗歌书目。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0619','WCD-10-B12:V1-ENT-0649','V1-ENT-0649','collection','《海的劳作》','何塞·埃米利奥·帕切科','Los trabajos del mar','墨西哥','es','','诗集','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《海的劳作》｜Los trabajos del mar

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗集
- one_sentence_summary：Cervantes年表将其列入诗歌书目；Colegio Nacional写作1984，首发年份暂不确定。
- bibliographic_note：Instituto Cervantes年表列1983，Colegio Nacional列1984；首发年份口径待核，暂不填原子年份。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0620','WCD-10-B12:V1-ENT-0650','V1-ENT-0650','collection','《我望向大地》','何塞·埃米利奥·帕切科','Miro la tierra','墨西哥','es','1987','诗集','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《我望向大地》｜Miro la tierra

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1987
- genre_or_form：诗集
- one_sentence_summary：Cervantes年表将其列入帕切科诗歌书目。
- bibliographic_note：Cervantes年表将其列入帕切科诗歌书目。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0621','WCD-10-B12:V1-ENT-0651','V1-ENT-0651','collection','《记忆之城》','何塞·埃米利奥·帕切科','Ciudad de la memoria','墨西哥','es','','诗集','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《记忆之城》｜Ciudad de la memoria

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗集
- one_sentence_summary：Cervantes年表将其列入诗歌书目；Colegio Nacional记为1989，保留年份差异。
- bibliographic_note：Instituto Cervantes年表列1990，Colegio Nacional列1989；首发年份口径待核，暂不填原子年份。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0622','WCD-10-B12:V1-ENT-0652','V1-ENT-0652','collection','《月亮的沉默》','何塞·埃米利奥·帕切科','El silencio de la luna','墨西哥','es','','诗集','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《月亮的沉默》｜El silencio de la luna

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗集
- one_sentence_summary：Cervantes年表将其列入诗歌书目；Colegio Nacional记为1994，保留年份差异。
- bibliographic_note：Instituto Cervantes年表列1996，Colegio Nacional列1994；首发年份口径待核，暂不填原子年份。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0623','WCD-10-B12:V1-ENT-0653','V1-ENT-0653','collection','《流动的沙》','何塞·埃米利奥·帕切科','La arena errante','墨西哥','es','1999','诗集','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《流动的沙》｜La arena errante

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1999
- genre_or_form：诗集
- one_sentence_summary：Cervantes年表将其列入诗歌书目；Colegio Nacional将其列作1999诗作。
- bibliographic_note：Cervantes年表将其列入诗歌书目；Colegio Nacional将其列作1999诗作。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0624','WCD-10-B12:V1-ENT-0654','V1-ENT-0654','collection','《上个世纪》','何塞·埃米利奥·帕切科','Siglo pasado','墨西哥','es','2000','诗集','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《上个世纪》｜Siglo pasado

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：2000
- genre_or_form：诗集
- one_sentence_summary：Cervantes年表将其列入帕切科诗歌书目。
- bibliographic_note：Cervantes年表将其列入帕切科诗歌书目。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0625','WCD-10-B12:V1-ENT-0655','V1-ENT-0655','collection','《总而言之》','何塞·埃米利奥·帕切科','En resumidas cuentas','墨西哥','es','2005','诗集选集','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《总而言之》｜En resumidas cuentas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：2005
- genre_or_form：诗集选集
- one_sentence_summary：2005年诗选，收录帕切科1958年至2000年间创作的诗歌选篇。
- bibliographic_note：Cervantes年表将其列入帕切科诗歌书目。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0626','WCD-10-B12:V1-ENT-0656','V1-ENT-0656','collection','《如同雨》','何塞·埃米利奥·帕切科','Como la lluvia','墨西哥','es','2009','诗集','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《如同雨》｜Como la lluvia

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：2009
- genre_or_form：诗集
- one_sentence_summary：Cervantes年表将其列入帕切科诗歌书目；Colegio Nacional同列2009年。
- bibliographic_note：Cervantes年表将其列入帕切科诗歌书目；Colegio Nacional同列2009年。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0627','WCD-10-B12:V1-ENT-0657','V1-ENT-0657','collection','《黑暗的年代》','何塞·埃米利奥·帕切科','La edad de las tinieblas','墨西哥','es','2009','诗集','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《黑暗的年代》｜La edad de las tinieblas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：2009
- genre_or_form：诗集
- one_sentence_summary：Cervantes年表将其列入帕切科诗歌书目；Colegio Nacional同列2009年。
- bibliographic_note：Cervantes年表将其列入帕切科诗歌书目；Colegio Nacional同列2009年。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0628','WCD-10-B12:V1-ENT-0658','V1-ENT-0658','collection','《远方的风》','何塞·埃米利奥·帕切科','El viento distante','墨西哥','es','1963','短篇小说集','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《远方的风》｜El viento distante

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1963
- genre_or_form：短篇小说集
- one_sentence_summary：Cervantes年表列为1963年小说类作品；Colegio Nacional将其与早期短篇作品并列。
- bibliographic_note：Cervantes年表列为1963年小说类作品；Colegio Nacional将其与早期短篇作品并列。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0629','WCD-10-B12:V1-ENT-0659','V1-ENT-0659','work','《你将在远方死去》','何塞·埃米利奥·帕切科','Morirás lejos','墨西哥','es','1967','小说','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《你将在远方死去》｜Morirás lejos

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1967
- genre_or_form：小说
- one_sentence_summary：Cervantes年表列于小说类；Colegio Nacional明确称其为小说。
- bibliographic_note：Cervantes年表列于小说类；Colegio Nacional明确称其为小说。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0630','WCD-10-B12:V1-ENT-0660','V1-ENT-0660','work','《阅读的权利》','何塞·埃米利奥·帕切科','El derecho a la lectura','墨西哥','es','1994','散文','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《阅读的权利》｜El derecho a la lectura

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1994
- genre_or_form：散文
- one_sentence_summary：Cervantes年表将其列入散文书目。
- bibliographic_note：Cervantes年表将其列入散文书目。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0631','WCD-10-B12:V1-ENT-0257','V1-ENT-0257','collection','《孔法布拉里奥》','胡安·何塞·阿雷奥拉','Confabulario','墨西哥','es','','短篇叙事作品集（Narrativa - Cuento）','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《孔法布拉里奥》｜Confabulario

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇叙事作品集（Narrativa - Cuento）
- one_sentence_summary：ELEM将《Confabulario》与《Varia invención》并列为1955年合刊中的两部作品，并称该卷汇聚多篇不同形态与意图的叙事文本；不据此另建合刊实体。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0632','WCD-10-B12:V1-ENT-0258','V1-ENT-0258','collection','《动物集》','胡安·何塞·阿雷奥拉','Bestiario','墨西哥','es','','动物题材短篇文本集','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《动物集》｜Bestiario

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：动物题材短篇文本集
- one_sentence_summary：目录列有《El rinoceronte》《Aves de rapiña》《El oso》《La jirafa》等动物题名；CVC生平记载该系列1958年以《Punta de plata》为名初版，基本书目另列1972年《Bestiario》版本。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0633','WCD-10-B12:V1-ENT-0259','V1-ENT-0259','work','《集市》','胡安·何塞·阿雷奥拉','La feria','墨西哥','es','','长篇小说','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《集市》｜La feria

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说
- one_sentence_summary：阿雷奥拉唯一小说，围绕Zapotlán及作者父亲展开，材料源自早年笔记；不扩写具体情节。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0634','WCD-10-B12:V1-ENT-0264','V1-ENT-0264','work','《直到见到你，我的赫苏斯》','埃莱娜·波尼亚托夫斯卡','Hasta no verte Jesús mío','墨西哥','es','','证言小说（relato-testimonio）','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《直到见到你，我的赫苏斯》｜Hasta no verte Jesús mío

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：证言小说（relato-testimonio）
- one_sentence_summary：小说借Jesusa Palancares的讲述，呈现她随革命军辗转、在墨西哥城谋生并以灵性信念寻求慰藉的经历。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0635','WCD-10-B12:V1-ENT-0263','V1-ENT-0263','work','《特拉特洛尔科之夜》','埃莱娜·波尼亚托夫斯卡','La noche de Tlatelolco','墨西哥','es','','纪实编年（crónica）','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《特拉特洛尔科之夜》｜La noche de Tlatelolco

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：纪实编年（crónica）
- one_sentence_summary：作品汇集多方声音与证言，重构1968年墨西哥学生运动及10月2日事件的经历与记忆。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0636','WCD-10-B12:V1-ENT-0265','V1-ENT-0265','work','《蒂娜》','埃莱娜·波尼亚托夫斯卡','Tinísima','墨西哥','es','','长篇小说','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《蒂娜》｜Tinísima

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说
- one_sentence_summary：小说以Tina Modotti为中心，写她在摄影创作、政治活动与私人关系之间经历的生命历程。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0637','WCD-10-B12:V1-ENT-0266','V1-ENT-0266','work','《沙漠中的战斗》','何塞·埃米利奥·帕切科','Las batallas en el desierto','墨西哥','es','','小说','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《沙漠中的战斗》｜Las batallas en el desierto

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：Colegio Nacional将其列为帕切科的两部小说之一。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0638','WCD-10-B12:V1-ENT-0267','V1-ENT-0267','collection','《快乐原则》','何塞·埃米利奥·帕切科','El principio del placer','墨西哥','es','','短篇小说集','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《快乐原则》｜El principio del placer

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- one_sentence_summary：Colegio Nacional将其列在帕切科的早期短篇作品中。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0639','WCD-10-B12:V1-ENT-0268','V1-ENT-0268','collection','《不要问我时间如何流逝》','何塞·埃米利奥·帕切科','No me preguntes cómo pasa el tiempo','墨西哥','es','','诗集','WCD-10-B12','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《不要问我时间如何流逝》｜No me preguntes cómo pasa el tiempo

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗集
- one_sentence_summary：帕切科1969年诗集；Colegio Nacional将其列入作者诗歌作品序列。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-2076','WCD10-B12-W001-F01','V1-CARD-0609','V1-ENT-0639','first_publication_year','1954','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2077','WCD10-B12-W001-F02','V1-CARD-0609','V1-ENT-0639','genre_or_form','独幕喜剧剧本','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2078','WCD10-B12-W001-F03','V1-CARD-0609','V1-ENT-0639','one_sentence_summary','一部独幕喜剧剧本；CVC所列书目未提供具体剧情概要。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2079','WCD10-B12-W001-F04','V1-CARD-0609','V1-ENT-0639','bibliographic_note','CVC基本书目列作 La hora de todos [Juguete cómico en un acto]，墨西哥 Ediciones Los Presentes，1954。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2080','WCD10-B12-W002-F01','V1-CARD-0610','V1-ENT-0640','first_publication_year','1949','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2081','WCD10-B12-W002-F02','V1-CARD-0610','V1-ENT-0640','genre_or_form','短篇叙事作品集（Narrativa - Cuento）','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2082','WCD10-B12-W002-F03','V1-CARD-0610','V1-ENT-0640','one_sentence_summary','ELEM将《Confabulario》与《Varia invención》一并归入叙事短篇，并称1955年合刊汇集了多篇不同形态与意图的叙事文本。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2083','WCD10-B12-W002-F04','V1-CARD-0610','V1-ENT-0640','bibliographic_note','CVC记录《Varia invención》1949年Fondo de Cultura Económica版；ELEM另载《Confabulario ; Varia invención : 1951-1955》1955年合刊，两条书目不改变1949年单行本年份。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2084','WCD10-B12-W003-F01','V1-CARD-0611','V1-ENT-0641','first_publication_year','1971','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2085','WCD10-B12-W003-F02','V1-CARD-0611','V1-ENT-0641','genre_or_form','短篇叙事作品集（Narrativa - Cuento）','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2086','WCD10-B12-W003-F03','V1-CARD-0611','V1-ENT-0641','one_sentence_summary','ELEM的2016年版封底称书中部分篇章可以正读或倒读；此简介限于该版封底对文字游戏形式的描述。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2087','WCD10-B12-W003-F04','V1-CARD-0611','V1-ENT-0641','bibliographic_note','CVC基本书目列 México, Joaquín Mortiz, 1971。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2088','WCD10-B12-W101-F01','V1-CARD-0612','V1-ENT-0642','genre_or_form','书信体小说','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2089','WCD10-B12-W101-F02','V1-CARD-0612','V1-ENT-0642','one_sentence_summary','作品以Angelina Beloff写给Diego Rivera的想象书信为叙述形式，描写她在巴黎的孤独、创作与被遗弃处境。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2090','WCD10-B12-W101-F03','V1-CARD-0612','V1-ENT-0642','bibliographic_note','作者基金会页面列出Ediciones Era于1978年出版的版本；本候选据此记录版本信息，不据此单独断定首版年。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2091','WCD10-B12-W102-F01','V1-CARD-0613','V1-ENT-0643','first_publication_year','1980','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2092','WCD10-B12-W102-F02','V1-CARD-0613','V1-ENT-0643','genre_or_form','纪实编年（crónica）','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2093','WCD10-B12-W102-F03','V1-CARD-0613','V1-ENT-0643','one_sentence_summary','全书以五组纪实叙事记录城市移民、1968运动记忆、政治犯家属及Cuernavaca社区行动。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2094','WCD10-B12-W102-F04','V1-CARD-0613','V1-ENT-0643','bibliographic_note','墨西哥文学百科列1980年Era首版，并标为Narrativa-Crónica。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2095','WCD10-B12-W201-F01','V1-CARD-0614','V1-ENT-0644','genre_or_form','诗集','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2096','WCD10-B12-W201-F02','V1-CARD-0614','V1-ENT-0644','one_sentence_summary','Cervantes年表将其列入帕切科诗歌书目。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2097','WCD10-B12-W201-F03','V1-CARD-0614','V1-ENT-0644','bibliographic_note','Instituto Cervantes年表列1963，Colegio Nacional列1962；首发年份口径待核，暂不填原子年份。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2098','WCD10-B12-W202-F01','V1-CARD-0615','V1-ENT-0645','first_publication_year','1966','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2099','WCD10-B12-W202-F02','V1-CARD-0615','V1-ENT-0645','genre_or_form','长诗','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2100','WCD10-B12-W202-F03','V1-CARD-0615','V1-ENT-0645','one_sentence_summary','全诗由三个部分（歌章）构成，是一首结构统一的长诗。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2101','WCD10-B12-W202-F04','V1-CARD-0615','V1-ENT-0645','bibliographic_note','Enciclopedia de la Literatura en México记录1966年墨西哥城Fondo de Cultura Económica首版；该页将作品归为单首、分三部分的长诗。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2102','WCD10-B12-W203-F01','V1-CARD-0616','V1-ENT-0646','first_publication_year','1973','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2103','WCD10-B12-W203-F02','V1-CARD-0616','V1-ENT-0646','genre_or_form','诗集','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2104','WCD10-B12-W203-F03','V1-CARD-0616','V1-ENT-0646','one_sentence_summary','Cervantes年表将其列入帕切科诗歌书目。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2105','WCD10-B12-W203-F04','V1-CARD-0616','V1-ENT-0646','bibliographic_note','Cervantes年表将其列入帕切科诗歌书目。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2106','WCD10-B12-W204-F01','V1-CARD-0617','V1-ENT-0647','first_publication_year','1976','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2107','WCD10-B12-W204-F02','V1-CARD-0617','V1-ENT-0647','genre_or_form','诗集','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2108','WCD10-B12-W204-F03','V1-CARD-0617','V1-ENT-0647','one_sentence_summary','Cervantes年表将其列入帕切科诗歌书目。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2109','WCD10-B12-W204-F04','V1-CARD-0617','V1-ENT-0647','bibliographic_note','Cervantes年表将其列入帕切科诗歌书目。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2110','WCD10-B12-W205-F01','V1-CARD-0618','V1-ENT-0648','first_publication_year','1980','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2111','WCD10-B12-W205-F02','V1-CARD-0618','V1-ENT-0648','genre_or_form','诗集','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2112','WCD10-B12-W205-F03','V1-CARD-0618','V1-ENT-0648','one_sentence_summary','Cervantes年表将其列入帕切科诗歌书目。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2113','WCD10-B12-W205-F04','V1-CARD-0618','V1-ENT-0648','bibliographic_note','Cervantes年表将其列入帕切科诗歌书目。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2114','WCD10-B12-W206-F01','V1-CARD-0619','V1-ENT-0649','genre_or_form','诗集','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2115','WCD10-B12-W206-F02','V1-CARD-0619','V1-ENT-0649','one_sentence_summary','Cervantes年表将其列入诗歌书目；Colegio Nacional写作1984，首发年份暂不确定。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2116','WCD10-B12-W206-F03','V1-CARD-0619','V1-ENT-0649','bibliographic_note','Instituto Cervantes年表列1983，Colegio Nacional列1984；首发年份口径待核，暂不填原子年份。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2117','WCD10-B12-W207-F01','V1-CARD-0620','V1-ENT-0650','first_publication_year','1987','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2118','WCD10-B12-W207-F02','V1-CARD-0620','V1-ENT-0650','genre_or_form','诗集','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2119','WCD10-B12-W207-F03','V1-CARD-0620','V1-ENT-0650','one_sentence_summary','Cervantes年表将其列入帕切科诗歌书目。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2120','WCD10-B12-W207-F04','V1-CARD-0620','V1-ENT-0650','bibliographic_note','Cervantes年表将其列入帕切科诗歌书目。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2121','WCD10-B12-W208-F01','V1-CARD-0621','V1-ENT-0651','genre_or_form','诗集','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2122','WCD10-B12-W208-F02','V1-CARD-0621','V1-ENT-0651','one_sentence_summary','Cervantes年表将其列入诗歌书目；Colegio Nacional记为1989，保留年份差异。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2123','WCD10-B12-W208-F03','V1-CARD-0621','V1-ENT-0651','bibliographic_note','Instituto Cervantes年表列1990，Colegio Nacional列1989；首发年份口径待核，暂不填原子年份。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2124','WCD10-B12-W209-F01','V1-CARD-0622','V1-ENT-0652','genre_or_form','诗集','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2125','WCD10-B12-W209-F02','V1-CARD-0622','V1-ENT-0652','one_sentence_summary','Cervantes年表将其列入诗歌书目；Colegio Nacional记为1994，保留年份差异。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2126','WCD10-B12-W209-F03','V1-CARD-0622','V1-ENT-0652','bibliographic_note','Instituto Cervantes年表列1996，Colegio Nacional列1994；首发年份口径待核，暂不填原子年份。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2127','WCD10-B12-W210-F01','V1-CARD-0623','V1-ENT-0653','first_publication_year','1999','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2128','WCD10-B12-W210-F02','V1-CARD-0623','V1-ENT-0653','genre_or_form','诗集','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2129','WCD10-B12-W210-F03','V1-CARD-0623','V1-ENT-0653','one_sentence_summary','Cervantes年表将其列入诗歌书目；Colegio Nacional将其列作1999诗作。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2130','WCD10-B12-W210-F04','V1-CARD-0623','V1-ENT-0653','bibliographic_note','Cervantes年表将其列入诗歌书目；Colegio Nacional将其列作1999诗作。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2131','WCD10-B12-W211-F01','V1-CARD-0624','V1-ENT-0654','first_publication_year','2000','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2132','WCD10-B12-W211-F02','V1-CARD-0624','V1-ENT-0654','genre_or_form','诗集','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2133','WCD10-B12-W211-F03','V1-CARD-0624','V1-ENT-0654','one_sentence_summary','Cervantes年表将其列入帕切科诗歌书目。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2134','WCD10-B12-W211-F04','V1-CARD-0624','V1-ENT-0654','bibliographic_note','Cervantes年表将其列入帕切科诗歌书目。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2135','WCD10-B12-W212-F01','V1-CARD-0625','V1-ENT-0655','first_publication_year','2005','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2136','WCD10-B12-W212-F02','V1-CARD-0625','V1-ENT-0655','genre_or_form','诗集选集','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2137','WCD10-B12-W212-F03','V1-CARD-0625','V1-ENT-0655','one_sentence_summary','2005年诗选，收录帕切科1958年至2000年间创作的诗歌选篇。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2138','WCD10-B12-W212-F04','V1-CARD-0625','V1-ENT-0655','bibliographic_note','Cervantes年表将其列入帕切科诗歌书目。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2139','WCD10-B12-W213-F01','V1-CARD-0626','V1-ENT-0656','first_publication_year','2009','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2140','WCD10-B12-W213-F02','V1-CARD-0626','V1-ENT-0656','genre_or_form','诗集','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2141','WCD10-B12-W213-F03','V1-CARD-0626','V1-ENT-0656','one_sentence_summary','Cervantes年表将其列入帕切科诗歌书目；Colegio Nacional同列2009年。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2142','WCD10-B12-W213-F04','V1-CARD-0626','V1-ENT-0656','bibliographic_note','Cervantes年表将其列入帕切科诗歌书目；Colegio Nacional同列2009年。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2143','WCD10-B12-W214-F01','V1-CARD-0627','V1-ENT-0657','first_publication_year','2009','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2144','WCD10-B12-W214-F02','V1-CARD-0627','V1-ENT-0657','genre_or_form','诗集','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2145','WCD10-B12-W214-F03','V1-CARD-0627','V1-ENT-0657','one_sentence_summary','Cervantes年表将其列入帕切科诗歌书目；Colegio Nacional同列2009年。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2146','WCD10-B12-W214-F04','V1-CARD-0627','V1-ENT-0657','bibliographic_note','Cervantes年表将其列入帕切科诗歌书目；Colegio Nacional同列2009年。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2147','WCD10-B12-W215-F01','V1-CARD-0628','V1-ENT-0658','first_publication_year','1963','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2148','WCD10-B12-W215-F02','V1-CARD-0628','V1-ENT-0658','genre_or_form','短篇小说集','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2149','WCD10-B12-W215-F03','V1-CARD-0628','V1-ENT-0658','one_sentence_summary','Cervantes年表列为1963年小说类作品；Colegio Nacional将其与早期短篇作品并列。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2150','WCD10-B12-W215-F04','V1-CARD-0628','V1-ENT-0658','bibliographic_note','Cervantes年表列为1963年小说类作品；Colegio Nacional将其与早期短篇作品并列。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2151','WCD10-B12-W216-F01','V1-CARD-0629','V1-ENT-0659','first_publication_year','1967','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2152','WCD10-B12-W216-F02','V1-CARD-0629','V1-ENT-0659','genre_or_form','小说','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2153','WCD10-B12-W216-F03','V1-CARD-0629','V1-ENT-0659','one_sentence_summary','Cervantes年表列于小说类；Colegio Nacional明确称其为小说。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2154','WCD10-B12-W216-F04','V1-CARD-0629','V1-ENT-0659','bibliographic_note','Cervantes年表列于小说类；Colegio Nacional明确称其为小说。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2155','WCD10-B12-W218-F01','V1-CARD-0630','V1-ENT-0660','first_publication_year','1994','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2156','WCD10-B12-W218-F02','V1-CARD-0630','V1-ENT-0660','genre_or_form','散文','bibliographic','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2157','WCD10-B12-W218-F03','V1-CARD-0630','V1-ENT-0660','one_sentence_summary','Cervantes年表将其列入散文书目。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2158','WCD10-B12-W218-F04','V1-CARD-0630','V1-ENT-0660','bibliographic_note','Cervantes年表将其列入散文书目。','bibliographic_note','WCD-10-B12','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2159','WCD10-B12-F001','V1-CARD-0631','V1-ENT-0257','genre_or_form','短篇叙事作品集（Narrativa - Cuento）','bibliographic','WCD-10-B12','high','batch_retained_candidate','ELEM将1955年Confabulario与Varia invención合刊归为Narrativa - Cuento；沿用到Confabulario的作品层级分类。'),
('V1-FCT-2160','WCD10-B12-F002','V1-CARD-0631','V1-ENT-0257','one_sentence_summary','ELEM将《Confabulario》与《Varia invención》并列为1955年合刊中的两部作品，并称该卷汇聚多篇不同形态与意图的叙事文本；不据此另建合刊实体。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','仅采用ELEM对合刊文本集合的简介，不把1955合刊误作两部作品的共同首版。'),
('V1-FCT-2161','WCD10-B12-F003','V1-CARD-0632','V1-ENT-0258','genre_or_form','动物题材短篇文本集','bibliographic','WCD-10-B12','high','batch_retained_candidate','目录列出以动物为题的短篇标题；不延伸象征含义。'),
('V1-FCT-2162','WCD10-B12-F004','V1-CARD-0632','V1-ENT-0258','one_sentence_summary','目录列有《El rinoceronte》《Aves de rapiña》《El oso》《La jirafa》等动物题名；CVC生平记载该系列1958年以《Punta de plata》为名初版，基本书目另列1972年《Bestiario》版本。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','版本按原书名与版本年份并列保留，不合并为单一首发年。'),
('V1-FCT-2163','WCD10-B12-F005','V1-CARD-0633','V1-ENT-0259','genre_or_form','长篇小说','bibliographic','WCD-10-B12','high','batch_retained_candidate','CVC生平称其为作者唯一小说。'),
('V1-FCT-2164','WCD10-B12-F006','V1-CARD-0633','V1-ENT-0259','one_sentence_summary','阿雷奥拉唯一小说，围绕Zapotlán及作者父亲展开，材料源自早年笔记；不扩写具体情节。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','简介只据机构生平页。'),
('V1-FCT-2165','WCD10-B12-F101','V1-CARD-0634','V1-ENT-0264','genre_or_form','证言小说（relato-testimonio）','bibliographic','WCD-10-B12','high','batch_retained_candidate','补缺失体裁；原子年份、旧事实及所有旧来源链逐值保留。'),
('V1-FCT-2166','WCD10-B12-F102','V1-CARD-0634','V1-ENT-0264','one_sentence_summary','小说借Jesusa Palancares的讲述，呈现她随革命军辗转、在墨西哥城谋生并以灵性信念寻求慰藉的经历。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','仅按作者基金会书目简介概括，不扩展文学史判断。'),
('V1-FCT-2167','WCD10-B12-F103','V1-CARD-0635','V1-ENT-0263','genre_or_form','纪实编年（crónica）','bibliographic','WCD-10-B12','high','batch_retained_candidate','补缺失体裁；原子年份、旧事实及所有旧来源链逐值保留。'),
('V1-FCT-2168','WCD10-B12-F104','V1-CARD-0635','V1-ENT-0263','one_sentence_summary','作品汇集多方声音与证言，重构1968年墨西哥学生运动及10月2日事件的经历与记忆。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','仅按作者基金会简介概括，避免添加未经来源支持的评价。'),
('V1-FCT-2169','WCD10-B12-F105','V1-CARD-0636','V1-ENT-0265','genre_or_form','长篇小说','bibliographic','WCD-10-B12','high','batch_retained_candidate','补缺失体裁；保留既有年份差异标记及全部旧事实、来源闭包。'),
('V1-FCT-2170','WCD10-B12-F106','V1-CARD-0636','V1-ENT-0265','one_sentence_summary','小说以Tina Modotti为中心，写她在摄影创作、政治活动与私人关系之间经历的生命历程。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','只补普通内容简介；不改写原子年份或已有版本差异注记。'),
('V1-FCT-2171','WCD10-B12-F270','V1-CARD-0637','V1-ENT-0266','genre_or_form','小说','bibliographic','WCD-10-B12','high','batch_retained_candidate','Append-only enrichment; baseline facts and card wording remain preserved. This field was absent from the baseline record.'),
('V1-FCT-2172','WCD10-B12-F271','V1-CARD-0637','V1-ENT-0266','one_sentence_summary','Colegio Nacional将其列为帕切科的两部小说之一。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Append-only enrichment; baseline facts and card wording remain preserved. This field was absent from the baseline record.'),
('V1-FCT-2173','WCD10-B12-F272','V1-CARD-0638','V1-ENT-0267','genre_or_form','短篇小说集','bibliographic','WCD-10-B12','high','batch_retained_candidate','Append-only enrichment; baseline facts and card wording remain preserved. This field was absent from the baseline record.'),
('V1-FCT-2174','WCD10-B12-F273','V1-CARD-0638','V1-ENT-0267','one_sentence_summary','Colegio Nacional将其列在帕切科的早期短篇作品中。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Append-only enrichment; baseline facts and card wording remain preserved. This field was absent from the baseline record.'),
('V1-FCT-2175','WCD10-B12-F274','V1-CARD-0639','V1-ENT-0268','genre_or_form','诗集','bibliographic','WCD-10-B12','high','batch_retained_candidate','Append-only enrichment; baseline facts and card wording remain preserved. This field was absent from the baseline record.'),
('V1-FCT-2176','WCD10-B12-F275','V1-CARD-0639','V1-ENT-0268','one_sentence_summary','帕切科1969年诗集；Colegio Nacional将其列入作者诗歌作品序列。','institutional_paraphrase','WCD-10-B12','high','batch_retained_candidate','Append-only enrichment; baseline facts and card wording remain preserved. This field was absent from the baseline record.');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-2076','SRC-0203','CVC. Juan José Arreola. Bibliografía'),
('V1-FCT-2077','SRC-0203','CVC. Juan José Arreola. Bibliografía'),
('V1-FCT-2078','SRC-0203','CVC. Juan José Arreola. Bibliografía'),
('V1-FCT-2079','SRC-0203','CVC. Juan José Arreola. Bibliografía'),
('V1-FCT-2080','SRC-0203','CVC. Juan José Arreola. Bibliografía'),
('V1-FCT-2081','SRC-0694','Confabulario ; Varia invención : 1951-1955 - Detalle de la obra - Enciclopedia de la Literatura en México'),
('V1-FCT-2082','SRC-0694','Confabulario ; Varia invención : 1951-1955 - Detalle de la obra - Enciclopedia de la Literatura en México'),
('V1-FCT-2083','SRC-0203','CVC. Juan José Arreola. Bibliografía'),
('V1-FCT-2083','SRC-0694','Confabulario ; Varia invención : 1951-1955 - Detalle de la obra - Enciclopedia de la Literatura en México'),
('V1-FCT-2084','SRC-0203','CVC. Juan José Arreola. Bibliografía'),
('V1-FCT-2085','SRC-0693','Palindroma - Detalle de la obra - Enciclopedia de la Literatura en México'),
('V1-FCT-2086','SRC-0693','Palindroma - Detalle de la obra - Enciclopedia de la Literatura en México'),
('V1-FCT-2087','SRC-0203','CVC. Juan José Arreola. Bibliografía'),
('V1-FCT-2088','SRC-0699','Querido Diego | Fundación Elena Poniatowska Amor A.C.'),
('V1-FCT-2089','SRC-0699','Querido Diego | Fundación Elena Poniatowska Amor A.C.'),
('V1-FCT-2090','SRC-0699','Querido Diego | Fundación Elena Poniatowska Amor A.C.'),
('V1-FCT-2091','SRC-0700','Fuerte es el silencio - Detalle de la obra - Enciclopedia de la Literatura en México - FLM'),
('V1-FCT-2092','SRC-0700','Fuerte es el silencio - Detalle de la obra - Enciclopedia de la Literatura en México - FLM'),
('V1-FCT-2093','SRC-0700','Fuerte es el silencio - Detalle de la obra - Enciclopedia de la Literatura en México - FLM'),
('V1-FCT-2094','SRC-0700','Fuerte es el silencio - Detalle de la obra - Enciclopedia de la Literatura en México - FLM'),
('V1-FCT-2095','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2096','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2097','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2097','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2098','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2098','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2098','SRC-0701','El reposo del fuego — Detalle de la obra — Enciclopedia de la Literatura en México'),
('V1-FCT-2099','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2099','SRC-0701','El reposo del fuego — Detalle de la obra — Enciclopedia de la Literatura en México'),
('V1-FCT-2100','SRC-0701','El reposo del fuego — Detalle de la obra — Enciclopedia de la Literatura en México'),
('V1-FCT-2101','SRC-0701','El reposo del fuego — Detalle de la obra — Enciclopedia de la Literatura en México'),
('V1-FCT-2102','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2103','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2104','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2105','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2106','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2107','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2108','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2109','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2110','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2111','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2112','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2113','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2114','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2115','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2115','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2116','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2116','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2117','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2118','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2119','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2120','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2121','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2122','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2122','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2123','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2123','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2124','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2125','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2125','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2126','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2126','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2127','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2128','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2129','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2129','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2130','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2130','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2131','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2132','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2133','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2134','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2135','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2135','SRC-0702','José Emilio Pacheco — Rinconete, Centro Virtual Cervantes'),
('V1-FCT-2136','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2136','SRC-0702','José Emilio Pacheco — Rinconete, Centro Virtual Cervantes'),
('V1-FCT-2137','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2137','SRC-0702','José Emilio Pacheco — Rinconete, Centro Virtual Cervantes'),
('V1-FCT-2138','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2138','SRC-0702','José Emilio Pacheco — Rinconete, Centro Virtual Cervantes'),
('V1-FCT-2139','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2140','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2141','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2141','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2142','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2142','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2143','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2144','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2145','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2145','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2146','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2146','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2147','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2148','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2148','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2149','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2149','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2150','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2150','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2151','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2152','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2153','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2153','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2154','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2154','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2155','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2156','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2157','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2158','SRC-0208','José Emilio Pacheco. Cronología de obras'),
('V1-FCT-2159','SRC-0694','Confabulario ; Varia invención : 1951-1955 - Detalle de la obra - Enciclopedia de la Literatura en México'),
('V1-FCT-2160','SRC-0694','Confabulario ; Varia invención : 1951-1955 - Detalle de la obra - Enciclopedia de la Literatura en México'),
('V1-FCT-2161','SRC-0203','CVC. Juan José Arreola. Bibliografía'),
('V1-FCT-2161','SRC-0692','CVC. Juan José Arreola. Índice'),
('V1-FCT-2162','SRC-0203','CVC. Juan José Arreola. Bibliografía'),
('V1-FCT-2162','SRC-0691','CVC. Juan José Arreola. Biografía'),
('V1-FCT-2162','SRC-0692','CVC. Juan José Arreola. Índice'),
('V1-FCT-2163','SRC-0203','CVC. Juan José Arreola. Bibliografía'),
('V1-FCT-2163','SRC-0691','CVC. Juan José Arreola. Biografía'),
('V1-FCT-2164','SRC-0691','CVC. Juan José Arreola. Biografía'),
('V1-FCT-2165','SRC-0695','Hasta no verte jesus mio | Fundación Elena Poniatowska Amor A.C.'),
('V1-FCT-2166','SRC-0695','Hasta no verte jesus mio | Fundación Elena Poniatowska Amor A.C.'),
('V1-FCT-2167','SRC-0696','La noche de Tlatelolco | Fundación Elena Poniatowska Amor A.C.'),
('V1-FCT-2168','SRC-0696','La noche de Tlatelolco | Fundación Elena Poniatowska Amor A.C.'),
('V1-FCT-2169','SRC-0697','Tinísima - Detalle de la obra - Enciclopedia de la Literatura en México - FLM'),
('V1-FCT-2170','SRC-0697','Tinísima - Detalle de la obra - Enciclopedia de la Literatura en México - FLM'),
('V1-FCT-2170','SRC-0698','Tinísima | Fundación Elena Poniatowska Amor A.C.'),
('V1-FCT-2171','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2172','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2173','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2174','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2175','SRC-0209','José Emilio Pacheco — El Colegio Nacional'),
('V1-FCT-2176','SRC-0209','José Emilio Pacheco — El Colegio Nacional');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0609','V1-FCT-2076','batch_retained_candidate'),
('V1-CARD-0609','V1-FCT-2077','batch_retained_candidate'),
('V1-CARD-0609','V1-FCT-2078','batch_retained_candidate'),
('V1-CARD-0609','V1-FCT-2079','batch_retained_candidate'),
('V1-CARD-0610','V1-FCT-2080','batch_retained_candidate'),
('V1-CARD-0610','V1-FCT-2081','batch_retained_candidate'),
('V1-CARD-0610','V1-FCT-2082','batch_retained_candidate'),
('V1-CARD-0610','V1-FCT-2083','batch_retained_candidate'),
('V1-CARD-0611','V1-FCT-2084','batch_retained_candidate'),
('V1-CARD-0611','V1-FCT-2085','batch_retained_candidate'),
('V1-CARD-0611','V1-FCT-2086','batch_retained_candidate'),
('V1-CARD-0611','V1-FCT-2087','batch_retained_candidate'),
('V1-CARD-0612','V1-FCT-2088','batch_retained_candidate'),
('V1-CARD-0612','V1-FCT-2089','batch_retained_candidate'),
('V1-CARD-0612','V1-FCT-2090','batch_retained_candidate'),
('V1-CARD-0613','V1-FCT-2091','batch_retained_candidate'),
('V1-CARD-0613','V1-FCT-2092','batch_retained_candidate'),
('V1-CARD-0613','V1-FCT-2093','batch_retained_candidate'),
('V1-CARD-0613','V1-FCT-2094','batch_retained_candidate'),
('V1-CARD-0614','V1-FCT-2095','batch_retained_candidate'),
('V1-CARD-0614','V1-FCT-2096','batch_retained_candidate'),
('V1-CARD-0614','V1-FCT-2097','batch_retained_candidate'),
('V1-CARD-0615','V1-FCT-2098','batch_retained_candidate'),
('V1-CARD-0615','V1-FCT-2099','batch_retained_candidate'),
('V1-CARD-0615','V1-FCT-2100','batch_retained_candidate'),
('V1-CARD-0615','V1-FCT-2101','batch_retained_candidate'),
('V1-CARD-0616','V1-FCT-2102','batch_retained_candidate'),
('V1-CARD-0616','V1-FCT-2103','batch_retained_candidate'),
('V1-CARD-0616','V1-FCT-2104','batch_retained_candidate'),
('V1-CARD-0616','V1-FCT-2105','batch_retained_candidate'),
('V1-CARD-0617','V1-FCT-2106','batch_retained_candidate'),
('V1-CARD-0617','V1-FCT-2107','batch_retained_candidate'),
('V1-CARD-0617','V1-FCT-2108','batch_retained_candidate'),
('V1-CARD-0617','V1-FCT-2109','batch_retained_candidate'),
('V1-CARD-0618','V1-FCT-2110','batch_retained_candidate'),
('V1-CARD-0618','V1-FCT-2111','batch_retained_candidate'),
('V1-CARD-0618','V1-FCT-2112','batch_retained_candidate'),
('V1-CARD-0618','V1-FCT-2113','batch_retained_candidate'),
('V1-CARD-0619','V1-FCT-2114','batch_retained_candidate'),
('V1-CARD-0619','V1-FCT-2115','batch_retained_candidate'),
('V1-CARD-0619','V1-FCT-2116','batch_retained_candidate'),
('V1-CARD-0620','V1-FCT-2117','batch_retained_candidate'),
('V1-CARD-0620','V1-FCT-2118','batch_retained_candidate'),
('V1-CARD-0620','V1-FCT-2119','batch_retained_candidate'),
('V1-CARD-0620','V1-FCT-2120','batch_retained_candidate'),
('V1-CARD-0621','V1-FCT-2121','batch_retained_candidate'),
('V1-CARD-0621','V1-FCT-2122','batch_retained_candidate'),
('V1-CARD-0621','V1-FCT-2123','batch_retained_candidate'),
('V1-CARD-0622','V1-FCT-2124','batch_retained_candidate'),
('V1-CARD-0622','V1-FCT-2125','batch_retained_candidate'),
('V1-CARD-0622','V1-FCT-2126','batch_retained_candidate'),
('V1-CARD-0623','V1-FCT-2127','batch_retained_candidate'),
('V1-CARD-0623','V1-FCT-2128','batch_retained_candidate'),
('V1-CARD-0623','V1-FCT-2129','batch_retained_candidate'),
('V1-CARD-0623','V1-FCT-2130','batch_retained_candidate'),
('V1-CARD-0624','V1-FCT-2131','batch_retained_candidate'),
('V1-CARD-0624','V1-FCT-2132','batch_retained_candidate'),
('V1-CARD-0624','V1-FCT-2133','batch_retained_candidate'),
('V1-CARD-0624','V1-FCT-2134','batch_retained_candidate'),
('V1-CARD-0625','V1-FCT-2135','batch_retained_candidate'),
('V1-CARD-0625','V1-FCT-2136','batch_retained_candidate'),
('V1-CARD-0625','V1-FCT-2137','batch_retained_candidate'),
('V1-CARD-0625','V1-FCT-2138','batch_retained_candidate'),
('V1-CARD-0626','V1-FCT-2139','batch_retained_candidate'),
('V1-CARD-0626','V1-FCT-2140','batch_retained_candidate'),
('V1-CARD-0626','V1-FCT-2141','batch_retained_candidate'),
('V1-CARD-0626','V1-FCT-2142','batch_retained_candidate'),
('V1-CARD-0627','V1-FCT-2143','batch_retained_candidate'),
('V1-CARD-0627','V1-FCT-2144','batch_retained_candidate'),
('V1-CARD-0627','V1-FCT-2145','batch_retained_candidate'),
('V1-CARD-0627','V1-FCT-2146','batch_retained_candidate'),
('V1-CARD-0628','V1-FCT-2147','batch_retained_candidate'),
('V1-CARD-0628','V1-FCT-2148','batch_retained_candidate'),
('V1-CARD-0628','V1-FCT-2149','batch_retained_candidate'),
('V1-CARD-0628','V1-FCT-2150','batch_retained_candidate'),
('V1-CARD-0629','V1-FCT-2151','batch_retained_candidate'),
('V1-CARD-0629','V1-FCT-2152','batch_retained_candidate'),
('V1-CARD-0629','V1-FCT-2153','batch_retained_candidate'),
('V1-CARD-0629','V1-FCT-2154','batch_retained_candidate'),
('V1-CARD-0630','V1-FCT-2155','batch_retained_candidate'),
('V1-CARD-0630','V1-FCT-2156','batch_retained_candidate'),
('V1-CARD-0630','V1-FCT-2157','batch_retained_candidate'),
('V1-CARD-0630','V1-FCT-2158','batch_retained_candidate'),
('V1-CARD-0631','V1-FCT-2159','batch_retained_candidate'),
('V1-CARD-0631','V1-FCT-2160','batch_retained_candidate'),
('V1-CARD-0632','V1-FCT-2161','batch_retained_candidate'),
('V1-CARD-0632','V1-FCT-2162','batch_retained_candidate'),
('V1-CARD-0633','V1-FCT-2163','batch_retained_candidate'),
('V1-CARD-0633','V1-FCT-2164','batch_retained_candidate'),
('V1-CARD-0634','V1-FCT-2165','batch_retained_candidate'),
('V1-CARD-0634','V1-FCT-2166','batch_retained_candidate'),
('V1-CARD-0635','V1-FCT-2167','batch_retained_candidate'),
('V1-CARD-0635','V1-FCT-2168','batch_retained_candidate'),
('V1-CARD-0636','V1-FCT-2169','batch_retained_candidate'),
('V1-CARD-0636','V1-FCT-2170','batch_retained_candidate'),
('V1-CARD-0637','V1-FCT-2171','batch_retained_candidate'),
('V1-CARD-0637','V1-FCT-2172','batch_retained_candidate'),
('V1-CARD-0638','V1-FCT-2173','batch_retained_candidate'),
('V1-CARD-0638','V1-FCT-2174','batch_retained_candidate'),
('V1-CARD-0639','V1-FCT-2175','batch_retained_candidate'),
('V1-CARD-0639','V1-FCT-2176','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-1277','WCD10-B12-S001','V1-CARD-0609','SRC-0203','B','bibliography_or_bounded_description','yes','no','SRC-0203','accepted','NONE'),
('V1-CS-1278','WCD10-B12-S001','V1-CARD-0610','SRC-0203','B','bibliography_or_bounded_description','yes','no','SRC-0203','accepted','NONE'),
('V1-CS-1279','WCD10-B12-S005','V1-CARD-0610','SRC-0694','B','bibliography_or_bounded_description','yes','no','SRC-0694','accepted','NONE'),
('V1-CS-1280','WCD10-B12-S001','V1-CARD-0611','SRC-0203','B','bibliography_or_bounded_description','yes','no','SRC-0203','accepted','NONE'),
('V1-CS-1281','WCD10-B12-S004','V1-CARD-0611','SRC-0693','B','bibliography_or_bounded_description','yes','no','SRC-0693','accepted','NONE'),
('V1-CS-1282','WCD10-B12-S105','V1-CARD-0612','SRC-0699','B','bibliography_or_bounded_description','yes','no','SRC-0699','accepted','NONE'),
('V1-CS-1283','WCD10-B12-S106','V1-CARD-0613','SRC-0700','B','bibliography_or_bounded_description','yes','no','SRC-0700','accepted','NONE'),
('V1-CS-1284','WCD10-B12-S201','V1-CARD-0614','SRC-0208','B','bibliography_or_bounded_description','yes','no','SRC-0208','accepted','NONE'),
('V1-CS-1285','WCD10-B12-S202','V1-CARD-0614','SRC-0209','B','bibliography_or_bounded_description','yes','no','SRC-0209','accepted','NONE'),
('V1-CS-1286','WCD10-B12-S201','V1-CARD-0615','SRC-0208','B','bibliography_or_bounded_description','yes','no','SRC-0208','accepted','NONE'),
('V1-CS-1287','WCD10-B12-S202','V1-CARD-0615','SRC-0209','B','bibliography_or_bounded_description','yes','no','SRC-0209','accepted','NONE'),
('V1-CS-1288','WCD10-B12-S204','V1-CARD-0615','SRC-0701','B','bibliography_or_bounded_description','yes','no','SRC-0701','accepted','NONE'),
('V1-CS-1289','WCD10-B12-S201','V1-CARD-0616','SRC-0208','B','bibliography_or_bounded_description','yes','no','SRC-0208','accepted','NONE'),
('V1-CS-1290','WCD10-B12-S201','V1-CARD-0617','SRC-0208','B','bibliography_or_bounded_description','yes','no','SRC-0208','accepted','NONE'),
('V1-CS-1291','WCD10-B12-S201','V1-CARD-0618','SRC-0208','B','bibliography_or_bounded_description','yes','no','SRC-0208','accepted','NONE'),
('V1-CS-1292','WCD10-B12-S201','V1-CARD-0619','SRC-0208','B','bibliography_or_bounded_description','yes','no','SRC-0208','accepted','NONE'),
('V1-CS-1293','WCD10-B12-S202','V1-CARD-0619','SRC-0209','B','bibliography_or_bounded_description','yes','no','SRC-0209','accepted','NONE'),
('V1-CS-1294','WCD10-B12-S201','V1-CARD-0620','SRC-0208','B','bibliography_or_bounded_description','yes','no','SRC-0208','accepted','NONE'),
('V1-CS-1295','WCD10-B12-S201','V1-CARD-0621','SRC-0208','B','bibliography_or_bounded_description','yes','no','SRC-0208','accepted','NONE'),
('V1-CS-1296','WCD10-B12-S202','V1-CARD-0621','SRC-0209','B','bibliography_or_bounded_description','yes','no','SRC-0209','accepted','NONE'),
('V1-CS-1297','WCD10-B12-S201','V1-CARD-0622','SRC-0208','B','bibliography_or_bounded_description','yes','no','SRC-0208','accepted','NONE'),
('V1-CS-1298','WCD10-B12-S202','V1-CARD-0622','SRC-0209','B','bibliography_or_bounded_description','yes','no','SRC-0209','accepted','NONE'),
('V1-CS-1299','WCD10-B12-S201','V1-CARD-0623','SRC-0208','B','bibliography_or_bounded_description','yes','no','SRC-0208','accepted','NONE'),
('V1-CS-1300','WCD10-B12-S202','V1-CARD-0623','SRC-0209','B','bibliography_or_bounded_description','yes','no','SRC-0209','accepted','NONE'),
('V1-CS-1301','WCD10-B12-S201','V1-CARD-0624','SRC-0208','B','bibliography_or_bounded_description','yes','no','SRC-0208','accepted','NONE'),
('V1-CS-1302','WCD10-B12-S201','V1-CARD-0625','SRC-0208','B','bibliography_or_bounded_description','yes','no','SRC-0208','accepted','NONE'),
('V1-CS-1303','WCD10-B12-S205','V1-CARD-0625','SRC-0702','B','bibliography_or_bounded_description','yes','no','SRC-0702','accepted','NONE'),
('V1-CS-1304','WCD10-B12-S201','V1-CARD-0626','SRC-0208','B','bibliography_or_bounded_description','yes','no','SRC-0208','accepted','NONE'),
('V1-CS-1305','WCD10-B12-S202','V1-CARD-0626','SRC-0209','B','bibliography_or_bounded_description','yes','no','SRC-0209','accepted','NONE'),
('V1-CS-1306','WCD10-B12-S201','V1-CARD-0627','SRC-0208','B','bibliography_or_bounded_description','yes','no','SRC-0208','accepted','NONE'),
('V1-CS-1307','WCD10-B12-S202','V1-CARD-0627','SRC-0209','B','bibliography_or_bounded_description','yes','no','SRC-0209','accepted','NONE'),
('V1-CS-1308','WCD10-B12-S201','V1-CARD-0628','SRC-0208','B','bibliography_or_bounded_description','yes','no','SRC-0208','accepted','NONE'),
('V1-CS-1309','WCD10-B12-S202','V1-CARD-0628','SRC-0209','B','bibliography_or_bounded_description','yes','no','SRC-0209','accepted','NONE'),
('V1-CS-1310','WCD10-B12-S201','V1-CARD-0629','SRC-0208','B','bibliography_or_bounded_description','yes','no','SRC-0208','accepted','NONE'),
('V1-CS-1311','WCD10-B12-S202','V1-CARD-0629','SRC-0209','B','bibliography_or_bounded_description','yes','no','SRC-0209','accepted','NONE'),
('V1-CS-1312','WCD10-B12-S201','V1-CARD-0630','SRC-0208','B','bibliography_or_bounded_description','yes','no','SRC-0208','accepted','NONE'),
('V1-CS-1313','WCD10-B12-S005','V1-CARD-0631','SRC-0694','B','bibliography_or_bounded_description','yes','no','SRC-0694','accepted','NONE'),
('V1-CS-1314','WCD10-B12-S001','V1-CARD-0632','SRC-0203','B','bibliography_or_bounded_description','yes','no','SRC-0203','accepted','NONE'),
('V1-CS-1315','WCD10-B12-S002','V1-CARD-0632','SRC-0691','B','bibliography_or_bounded_description','no','no','SRC-0691','accepted','NONE'),
('V1-CS-1316','WCD10-B12-S003','V1-CARD-0632','SRC-0692','B','bibliography_or_bounded_description','yes','no','SRC-0692','accepted','NONE'),
('V1-CS-1317','WCD10-B12-S001','V1-CARD-0633','SRC-0203','B','bibliography_or_bounded_description','yes','no','SRC-0203','accepted','NONE'),
('V1-CS-1318','WCD10-B12-S002','V1-CARD-0633','SRC-0691','B','bibliography_or_bounded_description','yes','no','SRC-0691','accepted','NONE'),
('V1-CS-1319','WCD10-B12-S101','V1-CARD-0634','SRC-0695','B','bibliography_or_bounded_description','yes','no','SRC-0695','accepted','NONE'),
('V1-CS-1320','WCD10-B12-S102','V1-CARD-0635','SRC-0696','B','bibliography_or_bounded_description','yes','no','SRC-0696','accepted','NONE'),
('V1-CS-1321','WCD10-B12-S103','V1-CARD-0636','SRC-0697','B','bibliography_or_bounded_description','yes','no','SRC-0697','accepted','NONE'),
('V1-CS-1322','WCD10-B12-S104','V1-CARD-0636','SRC-0698','B','bibliography_or_bounded_description','no','no','SRC-0698','accepted','NONE'),
('V1-CS-1323','WCD10-B12-S202','V1-CARD-0637','SRC-0209','B','bibliography_or_bounded_description','yes','no','SRC-0209','accepted','NONE'),
('V1-CS-1324','WCD10-B12-S202','V1-CARD-0638','SRC-0209','B','bibliography_or_bounded_description','yes','no','SRC-0209','accepted','NONE'),
('V1-CS-1325','WCD10-B12-S202','V1-CARD-0639','SRC-0209','B','bibliography_or_bounded_description','yes','no','SRC-0209','accepted','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0608','WCD-10-B12','WCD10-B12-W001-CREATED','V1-ENT-0250','CREATED','V1-ENT-0639','胡安·何塞·阿雷奥拉创作 La hora de todos','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0609','WCD-10-B12','WCD10-B12-W002-CREATED','V1-ENT-0250','CREATED','V1-ENT-0640','胡安·何塞·阿雷奥拉创作 Varia invención','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0610','WCD-10-B12','WCD10-B12-W003-CREATED','V1-ENT-0250','CREATED','V1-ENT-0641','胡安·何塞·阿雷奥拉创作 Palindroma','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0611','WCD-10-B12','WCD10-B12-W101-CREATED','V1-ENT-0260','CREATED','V1-ENT-0642','埃莱娜·波尼亚托夫斯卡创作 Querido Diego, te abraza Quiela','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0612','WCD-10-B12','WCD10-B12-W102-CREATED','V1-ENT-0260','CREATED','V1-ENT-0643','埃莱娜·波尼亚托夫斯卡创作 Fuerte es el silencio','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0613','WCD-10-B12','WCD10-B12-W201-CREATED','V1-ENT-0261','CREATED','V1-ENT-0644','何塞·埃米利奥·帕切科创作 Los elementos de la noche','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0614','WCD-10-B12','WCD10-B12-W202-CREATED','V1-ENT-0261','CREATED','V1-ENT-0645','何塞·埃米利奥·帕切科创作 El reposo del fuego','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0615','WCD-10-B12','WCD10-B12-W203-CREATED','V1-ENT-0261','CREATED','V1-ENT-0646','何塞·埃米利奥·帕切科创作 Irás y no volverás','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0616','WCD-10-B12','WCD10-B12-W204-CREATED','V1-ENT-0261','CREATED','V1-ENT-0647','何塞·埃米利奥·帕切科创作 Islas a la deriva','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0617','WCD-10-B12','WCD10-B12-W205-CREATED','V1-ENT-0261','CREATED','V1-ENT-0648','何塞·埃米利奥·帕切科创作 Desde entonces','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0618','WCD-10-B12','WCD10-B12-W206-CREATED','V1-ENT-0261','CREATED','V1-ENT-0649','何塞·埃米利奥·帕切科创作 Los trabajos del mar','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0619','WCD-10-B12','WCD10-B12-W207-CREATED','V1-ENT-0261','CREATED','V1-ENT-0650','何塞·埃米利奥·帕切科创作 Miro la tierra','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0620','WCD-10-B12','WCD10-B12-W208-CREATED','V1-ENT-0261','CREATED','V1-ENT-0651','何塞·埃米利奥·帕切科创作 Ciudad de la memoria','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0621','WCD-10-B12','WCD10-B12-W209-CREATED','V1-ENT-0261','CREATED','V1-ENT-0652','何塞·埃米利奥·帕切科创作 El silencio de la luna','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0622','WCD-10-B12','WCD10-B12-W210-CREATED','V1-ENT-0261','CREATED','V1-ENT-0653','何塞·埃米利奥·帕切科创作 La arena errante','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0623','WCD-10-B12','WCD10-B12-W211-CREATED','V1-ENT-0261','CREATED','V1-ENT-0654','何塞·埃米利奥·帕切科创作 Siglo pasado','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0624','WCD-10-B12','WCD10-B12-W212-CREATED','V1-ENT-0261','CREATED','V1-ENT-0655','何塞·埃米利奥·帕切科创作 En resumidas cuentas','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0625','WCD-10-B12','WCD10-B12-W213-CREATED','V1-ENT-0261','CREATED','V1-ENT-0656','何塞·埃米利奥·帕切科创作 Como la lluvia','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0626','WCD-10-B12','WCD10-B12-W214-CREATED','V1-ENT-0261','CREATED','V1-ENT-0657','何塞·埃米利奥·帕切科创作 La edad de las tinieblas','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0627','WCD-10-B12','WCD10-B12-W215-CREATED','V1-ENT-0261','CREATED','V1-ENT-0658','何塞·埃米利奥·帕切科创作 El viento distante','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0628','WCD-10-B12','WCD10-B12-W216-CREATED','V1-ENT-0261','CREATED','V1-ENT-0659','何塞·埃米利奥·帕切科创作 Morirás lejos','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0629','WCD-10-B12','WCD10-B12-W218-CREATED','V1-ENT-0261','CREATED','V1-ENT-0660','何塞·埃米利奥·帕切科创作 El derecho a la lectura','high','accepted','Codex-parent-independent-review:PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0608','SRC-0203'),
('V1-REL-0608','SRC-0691'),
('V1-REL-0609','SRC-0203'),
('V1-REL-0609','SRC-0691'),
('V1-REL-0610','SRC-0203'),
('V1-REL-0611','SRC-0699'),
('V1-REL-0612','SRC-0700'),
('V1-REL-0613','SRC-0208'),
('V1-REL-0613','SRC-0209'),
('V1-REL-0614','SRC-0208'),
('V1-REL-0614','SRC-0209'),
('V1-REL-0614','SRC-0701'),
('V1-REL-0615','SRC-0208'),
('V1-REL-0616','SRC-0208'),
('V1-REL-0617','SRC-0208'),
('V1-REL-0618','SRC-0208'),
('V1-REL-0618','SRC-0209'),
('V1-REL-0619','SRC-0208'),
('V1-REL-0620','SRC-0208'),
('V1-REL-0620','SRC-0209'),
('V1-REL-0621','SRC-0208'),
('V1-REL-0621','SRC-0209'),
('V1-REL-0622','SRC-0208'),
('V1-REL-0623','SRC-0208'),
('V1-REL-0624','SRC-0208'),
('V1-REL-0624','SRC-0702'),
('V1-REL-0625','SRC-0208'),
('V1-REL-0626','SRC-0208'),
('V1-REL-0627','SRC-0208'),
('V1-REL-0628','SRC-0208'),
('V1-REL-0629','SRC-0208');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0922','V1-REL-0608','WCD10-B12-S001','SRC-0203','CVC. Juan José Arreola. Bibliografía','页面行8-11列出Confabulario（1952）、La hora de todos [Juguete cómico en un acto]（1954）、La feria（1963）、Palindroma（1971）、Bestiario（1972）等作者作品及版本书目；实读2026-10-13。','胡安·何塞·阿雷奥拉创作 La hora de todos','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0923','V1-REL-0608','WCD10-B12-S002','SRC-0691','CVC. Juan José Arreola. Biografía','页面行22-29及注释行38-39：说明La hora de todos为1954戏剧文本、Bestiario首版名Punta de plata、La feria为Arreola唯一小说并源自关于父亲及Zapotlán的笔记；实读2026-10-13。','胡安·何塞·阿雷奥拉创作 La hora de todos','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0924','V1-REL-0609','WCD10-B12-S001','SRC-0203','CVC. Juan José Arreola. Bibliografía','页面行8-11列出Confabulario（1952）、La hora de todos [Juguete cómico en un acto]（1954）、La feria（1963）、Palindroma（1971）、Bestiario（1972）等作者作品及版本书目；实读2026-10-13。','胡安·何塞·阿雷奥拉创作 Varia invención','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0925','V1-REL-0609','WCD10-B12-S002','SRC-0691','CVC. Juan José Arreola. Biografía','页面行22-29及注释行38-39：说明La hora de todos为1954戏剧文本、Bestiario首版名Punta de plata、La feria为Arreola唯一小说并源自关于父亲及Zapotlán的笔记；实读2026-10-13。','胡安·何塞·阿雷奥拉创作 Varia invención','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0926','V1-REL-0610','WCD10-B12-S001','SRC-0203','CVC. Juan José Arreola. Bibliografía','页面行8-11列出Confabulario（1952）、La hora de todos [Juguete cómico en un acto]（1954）、La feria（1963）、Palindroma（1971）、Bestiario（1972）等作者作品及版本书目；实读2026-10-13。','胡安·何塞·阿雷奥拉创作 Palindroma','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0927','V1-REL-0611','WCD10-B12-S105','SRC-0699','Querido Diego | Fundación Elena Poniatowska Amor A.C.','第90-97行列作者，简述Angelina Beloff写信给Diego Rivera的虚构书信框架，并称其为短篇小说；第110-122行列Era 1978版本。 实读日期2026-10-13。','埃莱娜·波尼亚托夫斯卡创作 Querido Diego, te abraza Quiela','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0928','V1-REL-0612','WCD10-B12-S106','SRC-0700','Fuerte es el silencio - Detalle de la obra - Enciclopedia de la Literatura en México - FLM','第4-20行列作者、1980年首版、出版社及Narrativa-Crónica分类；第40-48行介绍书中五组关于城市移民、1968运动、政治犯及Cuernavaca社区的纪实叙事。 实读日期2026-10-13。','埃莱娜·波尼亚托夫斯卡创作 Fuerte es el silencio','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0929','V1-REL-0613','WCD10-B12-S201','SRC-0208','José Emilio Pacheco. Cronología de obras','Cervantes年表第47-100行按诗歌、小说与散文列出题名及年份；第104行标明2015年8月更新。实读2026-10-13。','何塞·埃米利奥·帕切科创作 Los elementos de la noche','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0930','V1-REL-0613','WCD10-B12-S202','SRC-0209','José Emilio Pacheco — El Colegio Nacional','El Colegio Nacional页面第26-27、38-42行直接列作品体裁、精选作品、年份及诗集/小说/短篇集/散文集信息。实读2026-10-13。','何塞·埃米利奥·帕切科创作 Los elementos de la noche','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0931','V1-REL-0614','WCD10-B12-S201','SRC-0208','José Emilio Pacheco. Cronología de obras','Cervantes年表第47-100行按诗歌、小说与散文列出题名及年份；第104行标明2015年8月更新。实读2026-10-13。','何塞·埃米利奥·帕切科创作 El reposo del fuego','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0932','V1-REL-0614','WCD10-B12-S202','SRC-0209','José Emilio Pacheco — El Colegio Nacional','El Colegio Nacional页面第26-27、38-42行直接列作品体裁、精选作品、年份及诗集/小说/短篇集/散文集信息。实读2026-10-13。','何塞·埃米利奥·帕切科创作 El reposo del fuego','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0933','V1-REL-0614','WCD10-B12-S204','SRC-0701','El reposo del fuego — Detalle de la obra — Enciclopedia de la Literatura en México','第9-19行给作者、首版墨西哥城/Fondo de Cultura Económica、1966年、诗歌个人诗集；第37-43行为1966版和2009版封底文字，明确作品为分三部分/歌章的单一长诗及其简要内容。实读2026-10-13。','何塞·埃米利奥·帕切科创作 El reposo del fuego','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0934','V1-REL-0615','WCD10-B12-S201','SRC-0208','José Emilio Pacheco. Cronología de obras','Cervantes年表第47-100行按诗歌、小说与散文列出题名及年份；第104行标明2015年8月更新。实读2026-10-13。','何塞·埃米利奥·帕切科创作 Irás y no volverás','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0935','V1-REL-0616','WCD10-B12-S201','SRC-0208','José Emilio Pacheco. Cronología de obras','Cervantes年表第47-100行按诗歌、小说与散文列出题名及年份；第104行标明2015年8月更新。实读2026-10-13。','何塞·埃米利奥·帕切科创作 Islas a la deriva','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0936','V1-REL-0617','WCD10-B12-S201','SRC-0208','José Emilio Pacheco. Cronología de obras','Cervantes年表第47-100行按诗歌、小说与散文列出题名及年份；第104行标明2015年8月更新。实读2026-10-13。','何塞·埃米利奥·帕切科创作 Desde entonces','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0937','V1-REL-0618','WCD10-B12-S201','SRC-0208','José Emilio Pacheco. Cronología de obras','Cervantes年表第47-100行按诗歌、小说与散文列出题名及年份；第104行标明2015年8月更新。实读2026-10-13。','何塞·埃米利奥·帕切科创作 Los trabajos del mar','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0938','V1-REL-0618','WCD10-B12-S202','SRC-0209','José Emilio Pacheco — El Colegio Nacional','El Colegio Nacional页面第26-27、38-42行直接列作品体裁、精选作品、年份及诗集/小说/短篇集/散文集信息。实读2026-10-13。','何塞·埃米利奥·帕切科创作 Los trabajos del mar','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0939','V1-REL-0619','WCD10-B12-S201','SRC-0208','José Emilio Pacheco. Cronología de obras','Cervantes年表第47-100行按诗歌、小说与散文列出题名及年份；第104行标明2015年8月更新。实读2026-10-13。','何塞·埃米利奥·帕切科创作 Miro la tierra','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0940','V1-REL-0620','WCD10-B12-S201','SRC-0208','José Emilio Pacheco. Cronología de obras','Cervantes年表第47-100行按诗歌、小说与散文列出题名及年份；第104行标明2015年8月更新。实读2026-10-13。','何塞·埃米利奥·帕切科创作 Ciudad de la memoria','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0941','V1-REL-0620','WCD10-B12-S202','SRC-0209','José Emilio Pacheco — El Colegio Nacional','El Colegio Nacional页面第26-27、38-42行直接列作品体裁、精选作品、年份及诗集/小说/短篇集/散文集信息。实读2026-10-13。','何塞·埃米利奥·帕切科创作 Ciudad de la memoria','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0942','V1-REL-0621','WCD10-B12-S201','SRC-0208','José Emilio Pacheco. Cronología de obras','Cervantes年表第47-100行按诗歌、小说与散文列出题名及年份；第104行标明2015年8月更新。实读2026-10-13。','何塞·埃米利奥·帕切科创作 El silencio de la luna','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0943','V1-REL-0621','WCD10-B12-S202','SRC-0209','José Emilio Pacheco — El Colegio Nacional','El Colegio Nacional页面第26-27、38-42行直接列作品体裁、精选作品、年份及诗集/小说/短篇集/散文集信息。实读2026-10-13。','何塞·埃米利奥·帕切科创作 El silencio de la luna','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0944','V1-REL-0622','WCD10-B12-S201','SRC-0208','José Emilio Pacheco. Cronología de obras','Cervantes年表第47-100行按诗歌、小说与散文列出题名及年份；第104行标明2015年8月更新。实读2026-10-13。','何塞·埃米利奥·帕切科创作 La arena errante','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0945','V1-REL-0623','WCD10-B12-S201','SRC-0208','José Emilio Pacheco. Cronología de obras','Cervantes年表第47-100行按诗歌、小说与散文列出题名及年份；第104行标明2015年8月更新。实读2026-10-13。','何塞·埃米利奥·帕切科创作 Siglo pasado','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0946','V1-REL-0624','WCD10-B12-S201','SRC-0208','José Emilio Pacheco. Cronología de obras','Cervantes年表第47-100行按诗歌、小说与散文列出题名及年份；第104行标明2015年8月更新。实读2026-10-13。','何塞·埃米利奥·帕切科创作 En resumidas cuentas','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0947','V1-REL-0624','WCD10-B12-S205','SRC-0702','José Emilio Pacheco — Rinconete, Centro Virtual Cervantes','第13-19行列诗集、诗选与叙述作品；第14行明确En resumidas cuentas (2005)为选集，收录1958至2000年作品。实读2026-10-13。','何塞·埃米利奥·帕切科创作 En resumidas cuentas','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0948','V1-REL-0625','WCD10-B12-S201','SRC-0208','José Emilio Pacheco. Cronología de obras','Cervantes年表第47-100行按诗歌、小说与散文列出题名及年份；第104行标明2015年8月更新。实读2026-10-13。','何塞·埃米利奥·帕切科创作 Como la lluvia','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0949','V1-REL-0626','WCD10-B12-S201','SRC-0208','José Emilio Pacheco. Cronología de obras','Cervantes年表第47-100行按诗歌、小说与散文列出题名及年份；第104行标明2015年8月更新。实读2026-10-13。','何塞·埃米利奥·帕切科创作 La edad de las tinieblas','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0950','V1-REL-0627','WCD10-B12-S201','SRC-0208','José Emilio Pacheco. Cronología de obras','Cervantes年表第47-100行按诗歌、小说与散文列出题名及年份；第104行标明2015年8月更新。实读2026-10-13。','何塞·埃米利奥·帕切科创作 El viento distante','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0951','V1-REL-0628','WCD10-B12-S201','SRC-0208','José Emilio Pacheco. Cronología de obras','Cervantes年表第47-100行按诗歌、小说与散文列出题名及年份；第104行标明2015年8月更新。实读2026-10-13。','何塞·埃米利奥·帕切科创作 Morirás lejos','high','eligible_evidence','WCD-10-B12'),
('V1-EV-0952','V1-REL-0629','WCD10-B12-S201','SRC-0208','José Emilio Pacheco. Cronología de obras','Cervantes年表第47-100行按诗歌、小说与散文列出题名及年份；第104行标明2015年8月更新。实读2026-10-13。','何塞·埃米利奥·帕切科创作 El derecho a la lectura','high','eligible_evidence','WCD-10-B12');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0426','WCD-10-B12-G01','research_gap','V1-ENT-0265.first_publication_year','open','基线已有年份与版本讨论；本候选未改原子年份，只补体裁和受限简介。','','Independent Reviewer: preserve preserve all baseline facts and disputed-year markers; no unsupported version adjudication','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0427','WCD-10-B12-G02','research_gap','V1-ENT-0261.Los trabajos del mar.first_publication_year','open','Cervantes年表列1983、Colegio Nacional列1984；首发年份口径待核，不填原子年份。','','Independent Reviewer: preserve preserve bibliographic_note and defer atomic year','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0428','WCD-10-B12-G03','research_gap','V1-ENT-0261.Ciudad de la memoria.first_publication_year','open','Cervantes年表列1990、Colegio Nacional列1989；首发年份口径待核，不填原子年份。','','Independent Reviewer: preserve preserve bibliographic_note and defer atomic year','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0429','WCD-10-B12-G04','research_gap','V1-ENT-0261.El silencio de la luna.first_publication_year','open','Cervantes年表列1996、Colegio Nacional列1994；首发年份口径待核，不填原子年份。','','Independent Reviewer: preserve preserve bibliographic_note and defer atomic year','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0430','WCD-10-B12-G05','research_gap','V1-ENT-0261.Tarde de agosto.work_identity_and_first_publication_year','open','Cervantes chronology lists this title under the narrative heading in 1992, but that evidence does not establish an independent work unit or first publication; omit this candidate pending direct bibliographic evidence.','','Independent Reviewer: preserve defer work candidate; do not infer first publication','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0431','WCD-10-B12-G06','research_gap','V1-ENT-0261.Los elementos de la noche.first_publication_year','open','Instituto Cervantes年表列1963，Colegio Nacional列1962；首发年份口径待核，不填原子年份。','','Independent Reviewer: preserve preserve bibliographic_note and defer atomic year','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0432','WCD-10-B12:V1-ENT-0257','research_gap','WCD10:work_level_research:V1-ENT-0257','open','当前来源为机构书目/生平资料，未进行专门学术研究；后续如需专题研究再补。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0433','WCD-10-B12:V1-ENT-0258','research_gap','WCD10:work_level_research:V1-ENT-0258','open','当前来源为机构书目/生平资料，未进行专门学术研究；后续如需专题研究再补。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0434','WCD-10-B12:V1-ENT-0259','research_gap','WCD10:work_level_research:V1-ENT-0259','open','当前来源为机构书目/生平资料，未进行专门学术研究；后续如需专题研究再补。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0435','WCD-10-B12:WCD10-B12-W001','research_gap','WCD10:work_level_research:V1-ENT-0639','open','仅有直接机构书目/生平描述，未进行专门学术研究。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0436','WCD-10-B12:WCD10-B12-W002','research_gap','WCD10:work_level_research:V1-ENT-0640','open','仅有直接机构书目/生平描述，未进行专门学术研究。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0437','WCD-10-B12:WCD10-B12-W003','research_gap','WCD10:work_level_research:V1-ENT-0641','open','仅有直接机构书目/生平描述，未进行专门学术研究。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0438','WCD-10-B12:V1-ENT-0263','research_gap','WCD10:work_level_research:V1-ENT-0263','open','仅作已直接支持的普通机构资料补充；作品级学术研究覆盖未作完整性判断。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0439','WCD-10-B12:V1-ENT-0264','research_gap','WCD10:work_level_research:V1-ENT-0264','open','仅作已直接支持的普通机构资料补充；作品级学术研究覆盖未作完整性判断。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0440','WCD-10-B12:V1-ENT-0265','research_gap','WCD10:work_level_research:V1-ENT-0265','open','仅作已直接支持的普通机构资料补充；作品级学术研究覆盖未作完整性判断。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0441','WCD-10-B12:WCD10-B12-W102','research_gap','WCD10:work_level_research:V1-ENT-0643','open','目录与机构作品介绍支持普通书目和内容描述；作品级学术研究覆盖仍开放。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0442','WCD-10-B12:WCD10-B12-W101','research_gap','WCD10:work_level_research:V1-ENT-0642','open','目录与机构作品介绍支持普通书目和内容描述；作品级学术研究覆盖仍开放。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0443','WCD-10-B12:V1-ENT-0268','research_gap','WCD10:work_level_research:V1-ENT-0268','open','仅补充直接来源支持的目录级书目与体裁；不声称学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0444','WCD-10-B12:V1-ENT-0267','research_gap','WCD10:work_level_research:V1-ENT-0267','open','仅补充直接来源支持的目录级书目与体裁；不声称学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0445','WCD-10-B12:V1-ENT-0266','research_gap','WCD10:work_level_research:V1-ENT-0266','open','仅补充直接来源支持的目录级书目与体裁；不声称学术覆盖完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0446','WCD-10-B12:WCD10-B12-W201','research_gap','WCD10:work_level_research:V1-ENT-0644','open','目前仅有机构书目/分类支持；无据以扩展情节、主题或学术阐释的来源。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0447','WCD-10-B12:WCD10-B12-W202','research_gap','WCD10:work_level_research:V1-ENT-0645','open','仅依据机构书目与出版物说明概述作品形式；无情节外推。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0448','WCD-10-B12:WCD10-B12-W203','research_gap','WCD10:work_level_research:V1-ENT-0646','open','目前仅有机构书目/分类支持；无据以扩展情节、主题或学术阐释的来源。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0449','WCD-10-B12:WCD10-B12-W204','research_gap','WCD10:work_level_research:V1-ENT-0647','open','目前仅有机构书目/分类支持；无据以扩展情节、主题或学术阐释的来源。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0450','WCD-10-B12:WCD10-B12-W205','research_gap','WCD10:work_level_research:V1-ENT-0648','open','目前仅有机构书目/分类支持；无据以扩展情节、主题或学术阐释的来源。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0451','WCD-10-B12:WCD10-B12-W206','research_gap','WCD10:work_level_research:V1-ENT-0649','open','目前仅有机构书目/分类支持；无据以扩展情节、主题或学术阐释的来源。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0452','WCD-10-B12:WCD10-B12-W207','research_gap','WCD10:work_level_research:V1-ENT-0650','open','目前仅有机构书目/分类支持；无据以扩展情节、主题或学术阐释的来源。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0453','WCD-10-B12:WCD10-B12-W208','research_gap','WCD10:work_level_research:V1-ENT-0651','open','目前仅有机构书目/分类支持；无据以扩展情节、主题或学术阐释的来源。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0454','WCD-10-B12:WCD10-B12-W209','research_gap','WCD10:work_level_research:V1-ENT-0652','open','目前仅有机构书目/分类支持；无据以扩展情节、主题或学术阐释的来源。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0455','WCD-10-B12:WCD10-B12-W210','research_gap','WCD10:work_level_research:V1-ENT-0653','open','目前仅有机构书目/分类支持；无据以扩展情节、主题或学术阐释的来源。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0456','WCD-10-B12:WCD10-B12-W211','research_gap','WCD10:work_level_research:V1-ENT-0654','open','目前仅有机构书目/分类支持；无据以扩展情节、主题或学术阐释的来源。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0457','WCD-10-B12:WCD10-B12-W212','research_gap','WCD10:work_level_research:V1-ENT-0655','open','目前仅有机构书目/分类支持；无据以扩展情节、主题或学术阐释的来源。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0458','WCD-10-B12:WCD10-B12-W213','research_gap','WCD10:work_level_research:V1-ENT-0656','open','目前仅有机构书目/分类支持；无据以扩展情节、主题或学术阐释的来源。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0459','WCD-10-B12:WCD10-B12-W214','research_gap','WCD10:work_level_research:V1-ENT-0657','open','目前仅有机构书目/分类支持；无据以扩展情节、主题或学术阐释的来源。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0460','WCD-10-B12:WCD10-B12-W215','research_gap','WCD10:work_level_research:V1-ENT-0658','open','目前仅有机构书目/分类支持；无据以扩展情节、主题或学术阐释的来源。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0461','WCD-10-B12:WCD10-B12-W216','research_gap','WCD10:work_level_research:V1-ENT-0659','open','目前仅有机构书目/分类支持；无据以扩展情节、主题或学术阐释的来源。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0462','WCD-10-B12:WCD10-B12-W218','research_gap','WCD10:work_level_research:V1-ENT-0660','open','目前仅有机构书目/分类支持；无据以扩展情节、主题或学术阐释的来源。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');

UPDATE metadata SET value='WCD-10-B12' WHERE key='last_change_set';

UPDATE metadata SET value='2026-10-13' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 700 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 658 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 656 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 639 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2170 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 2656 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2149 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1317 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 627 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 981 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 952 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 462 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
