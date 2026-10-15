-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: Codex-parent-independent-review

-- Registration sha256: 1ea3087af4a6a2adf7754cb3018351f2e19851cdac528f6f892f9ad2b16e41bd

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2416 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1451 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 728 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 727 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 725 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 3010 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2437 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 576 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 1059 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 1088 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 699 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 755 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B16' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0758' OR canonical_url='https://www.anagrama-ed.es/autor/lezama-lima-jose-633') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0759' OR canonical_url='https://www.cervantesvirtual.com/obra-visor/la-escritura-de-lo-posible--el-sistema-potico-de-jos-lezama-lima-0/html/ff2fbdf8-82b1-11df-acc7-002185ce6064_60.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0760' OR canonical_url='https://www.cervantes.es/bibliotecas_documentacion_espanol/biografias/varsovia_guillermo_cabrera_infante_1.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0761' OR canonical_url='https://www.treccani.it/enciclopedia/guillermo-cabrera-infante/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0762' OR canonical_url='https://books.google.es/books/about/Vista_del_amanecer_en_el_tr%C3%B3pico.html?id=MnNAAAAAYAAJ') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0763' OR canonical_url='https://www.planetadelibros.com.ar/libro-la-habana-para-un-infante-difunto/125852') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0764' OR canonical_url='https://www.penguinlibros.com/us/67409-guillermo-cabrera-infante') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0730' OR (entity_type='collection' AND original_name='Cantos para soldados y sones para turistas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0731' OR (entity_type='collection' AND original_name='España. Poema en cuatro angustias y una esperanza')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0732' OR (entity_type='collection' AND original_name='La paloma de vuelo popular. Elegías')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0733' OR (entity_type='collection' AND original_name='El gran zoo')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0734' OR (entity_type='collection' AND original_name='Tengo')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0735' OR (entity_type='work' AND original_name='Muerte de Narciso')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0736' OR (entity_type='collection' AND original_name='Enemigo rumor')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0737' OR (entity_type='collection' AND original_name='Aventuras sigilosas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0738' OR (entity_type='collection' AND original_name='La fijeza')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0739' OR (entity_type='collection' AND original_name='Dador')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0740' OR (entity_type='collection' AND original_name='Tratados en La Habana')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0741' OR (entity_type='collection' AND original_name='La cantidad hechizada')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0742' OR (entity_type='collection' AND original_name='Fragmentos a su imán')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0743' OR (entity_type='collection' AND original_name='Así en la paz como en la guerra')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0744' OR (entity_type='collection' AND original_name='Un oficio del siglo XX')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0745' OR (entity_type='work' AND original_name='Cuerpos divinos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2444' OR (subject_id='V1-ENT-0730' AND fact_field='first_publication_year' AND value_text='1937')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2445' OR (subject_id='V1-ENT-0730' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2446' OR (subject_id='V1-ENT-0730' AND fact_field='one_sentence_summary' AND value_text='书中诗歌呼吁被征为士兵、服务于他人利益的工人重新认识自身的无产阶级出身，并与本阶级利益相连。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2447' OR (subject_id='V1-ENT-0731' AND fact_field='first_publication_year' AND value_text='1937')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2448' OR (subject_id='V1-ENT-0731' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2449' OR (subject_id='V1-ENT-0731' AND fact_field='bibliographic_note' AND value_text='书目副题为Poema en cuatro angustias y una esperanza；1937年墨西哥版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2450' OR (subject_id='V1-ENT-0731' AND fact_field='one_sentence_summary' AND value_text='作者传记将该诗集与作者声援受到威胁的西班牙共和国相联系。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2451' OR (subject_id='V1-ENT-0732' AND fact_field='first_publication_year' AND value_text='1958')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2452' OR (subject_id='V1-ENT-0732' AND fact_field='genre_or_form' AND value_text='挽歌诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2453' OR (subject_id='V1-ENT-0732' AND fact_field='one_sentence_summary' AND value_text='作品收录作者旅行经历；传记指出其中以不义、奴役与殖民主义为主题，并写到甘蔗田工人的劳动。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2454' OR (subject_id='V1-ENT-0733' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2455' OR (subject_id='V1-ENT-0733' AND fact_field='bibliographic_note' AND value_text='Cervantes Virtual作品书目列1967年《Unión》版；CVC作者传记记为1968年出版。两来源口径有差异，故不将任一版本年份直接确认为首版年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2456' OR (subject_id='V1-ENT-0733' AND fact_field='one_sentence_summary' AND value_text='作品以简洁、诙谐的风格，将安第斯山、飓风与加勒比海等拉美地理事物描写为想象动物园中的奇异生物。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2457' OR (subject_id='V1-ENT-0734' AND fact_field='first_publication_year' AND value_text='1964')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2458' OR (subject_id='V1-ENT-0734' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2459' OR (subject_id='V1-ENT-0734' AND fact_field='one_sentence_summary' AND value_text='诗人以作品见证革命后的生活变化；CVC传记指出，该书不再只是歌唱革命的承诺，而转向庆祝其成果。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2460' OR (subject_id='V1-ENT-0734' AND fact_field='bibliographic_note' AND value_text='Cervantes Virtual书目记载La Habana、Universidad de Las Villas、1964；CVC传记亦记1964年出版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2461' OR (subject_id='V1-ENT-0735' AND fact_field='first_publication_year' AND value_text='1937')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2462' OR (subject_id='V1-ENT-0735' AND fact_field='genre_or_form' AND value_text='长诗')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2463' OR (subject_id='V1-ENT-0735' AND fact_field='one_sentence_summary' AND value_text='1937年首刊于《Verbum》第二期并于同年单册印行的二十五节长诗。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2464' OR (subject_id='V1-ENT-0736' AND fact_field='first_publication_year' AND value_text='1941')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2465' OR (subject_id='V1-ENT-0736' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2466' OR (subject_id='V1-ENT-0736' AND fact_field='one_sentence_summary' AND value_text='作者书目将其列为诗集，并记录1941年出版；此处只作书目级描述。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2467' OR (subject_id='V1-ENT-0737' AND fact_field='first_publication_year' AND value_text='1945')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2468' OR (subject_id='V1-ENT-0737' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2469' OR (subject_id='V1-ENT-0737' AND fact_field='one_sentence_summary' AND value_text='作者书目将其列为诗集，并记录1945年出版；此处只作书目级描述。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2470' OR (subject_id='V1-ENT-0738' AND fact_field='first_publication_year' AND value_text='1949')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2471' OR (subject_id='V1-ENT-0738' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2472' OR (subject_id='V1-ENT-0738' AND fact_field='one_sentence_summary' AND value_text='机构作者页和研究书目均将其列为诗集；书目记录1949年版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2473' OR (subject_id='V1-ENT-0739' AND fact_field='first_publication_year' AND value_text='1960')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2474' OR (subject_id='V1-ENT-0739' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2475' OR (subject_id='V1-ENT-0739' AND fact_field='one_sentence_summary' AND value_text='作者书目将其列为诗集，并记录1960年出版；此处只作书目级描述。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2476' OR (subject_id='V1-ENT-0740' AND fact_field='first_publication_year' AND value_text='1958')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2477' OR (subject_id='V1-ENT-0740' AND fact_field='genre_or_form' AND value_text='随笔集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2478' OR (subject_id='V1-ENT-0740' AND fact_field='one_sentence_summary' AND value_text='作者书目将其列为随笔/论文著作，并记录1958年出版；此处只作书目级描述。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2479' OR (subject_id='V1-ENT-0741' AND fact_field='first_publication_year' AND value_text='1970')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2480' OR (subject_id='V1-ENT-0741' AND fact_field='genre_or_form' AND value_text='随笔集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2481' OR (subject_id='V1-ENT-0741' AND fact_field='one_sentence_summary' AND value_text='作者书目将其列为随笔/论文著作，并记录1970年出版；此处只作书目级描述。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2482' OR (subject_id='V1-ENT-0742' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2483' OR (subject_id='V1-ENT-0742' AND fact_field='one_sentence_summary' AND value_text='研究者将该书描述为莱萨马晚年处境的诗歌化表达，并指出它以更具情境性的诗篇呈现其诗学脉络。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2484' OR (subject_id='V1-ENT-0742' AND fact_field='bibliographic_note' AND value_text='塞万提斯虚拟图书馆书目列哈瓦那1977年版及墨西哥、巴塞罗那1978年版；Editorial Anagrama作者页标注1978年。来源年份口径不同，故保留版本记录并不指定原子首版年份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2485' OR (subject_id='V1-ENT-0743' AND fact_field='first_publication_year' AND value_text='1960')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2486' OR (subject_id='V1-ENT-0743' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2487' OR (subject_id='V1-ENT-0743' AND fact_field='one_sentence_summary' AND value_text='出版者将该书列为作者1960年的短篇小说集。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2488' OR (subject_id='V1-ENT-0744' AND fact_field='first_publication_year' AND value_text='1963')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2489' OR (subject_id='V1-ENT-0744' AND fact_field='genre_or_form' AND value_text='电影评论汇编')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2490' OR (subject_id='V1-ENT-0744' AND fact_field='one_sentence_summary' AND value_text='这部1963年作品汇集作者的电影评论。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2491' OR (subject_id='V1-ENT-0745' AND fact_field='bibliographic_note' AND value_text='Instituto Cervantes年表将Cuerpos divinos列于1979年；Penguin书目列2010年并说明身后出版。两来源未说明1979的年份口径，故本候选不填写原子首发年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2492' OR (subject_id='V1-ENT-0745' AND fact_field='genre_or_form' AND value_text='小说化回忆录')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2493' OR (subject_id='V1-ENT-0745' AND fact_field='one_sentence_summary' AND value_text='以小说化回忆重现作者在古巴度过的青年生活；Penguin书目注明该书身后出版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2494' OR (subject_id='V1-ENT-0317' AND fact_field='one_sentence_summary' AND value_text='《松调》｜Motivos de son — CVC传记称这本1930年的首部诗集以古巴黑人民众的独特言语和son节奏呈现其生活，使其成为岛屿文化与情感的核心主体。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2495' OR (subject_id='V1-ENT-0318' AND fact_field='one_sentence_summary' AND value_text='《桑戈罗·科松戈》｜Sóngoro cosongo — CVC传记称该诗集借助标题的拟声形式，表现诗人呈现古巴岛屿非洲根源、节奏与声音的意图。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2496' OR (subject_id='V1-ENT-0319' AND fact_field='one_sentence_summary' AND value_text='《西印度公司》｜West Indies, Ltd. — CVC传记将该诗集描述为延续古巴诗歌节奏与声音、同时加强社会批判的作品。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2497' OR (subject_id='V1-ENT-0323' AND fact_field='one_sentence_summary' AND value_text='AAP称其为1966年小说，并概述其位于二十世纪西语小说的重要作品之列。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2498' OR (subject_id='V1-ENT-0324' AND fact_field='one_sentence_summary' AND value_text='AAP称其为《天堂》中人物命名的未完成续作，并记录其1977年在墨西哥初版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2499' OR (subject_id='V1-ENT-0325' AND fact_field='one_sentence_summary' AND value_text='AAP记载该书源自作者1957年在哈瓦那所作的五部分讲演，内容表达其对拉丁美洲文化的看法。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2500' OR (subject_id='V1-ENT-0326' AND fact_field='one_sentence_summary' AND value_text='小说以巴蒂斯塔独裁时期的一群年轻人为中心，并通过强烈的语言与结构实验展开。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2501' OR (subject_id='V1-ENT-0326' AND fact_field='bibliographic_note' AND value_text='Instituto Cervantes作品年表列1967；Treccani条目将小说标注为1964年（并注明意大利语译本1976）。现存V1-FCT-0871仍按1967保留；两来源口径的对应版本/年份关系未能由本次来源厘清。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2502' OR (subject_id='V1-ENT-0327' AND fact_field='genre_or_form' AND value_text='历史题材叙事作品（Relatos）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2503' OR (subject_id='V1-ENT-0327' AND fact_field='one_sentence_summary' AND value_text='以诗性叙事片段巡览古巴历史、人民、地理与艺术，并涉及独立斗争、独裁暴力及革命后的冲突。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2504' OR (subject_id='V1-ENT-0328' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2505' OR (subject_id='V1-ENT-0328' AND fact_field='one_sentence_summary' AND value_text='出版社简介提及好莱坞电影，以及叙述者追寻金发女性的叙事线索。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0702' OR (subject_id='V1-ENT-0310' AND relation_type='CREATED' AND object_id='V1-ENT-0730')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0703' OR (subject_id='V1-ENT-0310' AND relation_type='CREATED' AND object_id='V1-ENT-0731')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0704' OR (subject_id='V1-ENT-0310' AND relation_type='CREATED' AND object_id='V1-ENT-0732')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0705' OR (subject_id='V1-ENT-0310' AND relation_type='CREATED' AND object_id='V1-ENT-0733')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0706' OR (subject_id='V1-ENT-0310' AND relation_type='CREATED' AND object_id='V1-ENT-0734')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0707' OR (subject_id='V1-ENT-0320' AND relation_type='CREATED' AND object_id='V1-ENT-0735')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0708' OR (subject_id='V1-ENT-0320' AND relation_type='CREATED' AND object_id='V1-ENT-0736')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0709' OR (subject_id='V1-ENT-0320' AND relation_type='CREATED' AND object_id='V1-ENT-0737')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0710' OR (subject_id='V1-ENT-0320' AND relation_type='CREATED' AND object_id='V1-ENT-0738')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0711' OR (subject_id='V1-ENT-0320' AND relation_type='CREATED' AND object_id='V1-ENT-0739')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0712' OR (subject_id='V1-ENT-0320' AND relation_type='CREATED' AND object_id='V1-ENT-0740')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0713' OR (subject_id='V1-ENT-0320' AND relation_type='CREATED' AND object_id='V1-ENT-0741')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0714' OR (subject_id='V1-ENT-0320' AND relation_type='CREATED' AND object_id='V1-ENT-0742')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0715' OR (subject_id='V1-ENT-0321' AND relation_type='CREATED' AND object_id='V1-ENT-0743')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0716' OR (subject_id='V1-ENT-0321' AND relation_type='CREATED' AND object_id='V1-ENT-0744')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0717' OR (subject_id='V1-ENT-0321' AND relation_type='CREATED' AND object_id='V1-ENT-0745')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0758','WCD10-B17-S102','José Lezama Lima — Editorial Anagrama','José Lezama Lima — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','','','web_page','','es','B','access_pass','WCD-10-B17','Research候选；未获独立Curation准入，不进入Reader/Public层。','remote_only','','https://www.anagrama-ed.es/autor/lezama-lima-jose-633'),
('SRC-0759','WCD10-B17-S103','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes','Remedios Mataix','','Biblioteca Virtual Miguel de Cervantes','','','web_page','','es','A','access_pass','WCD-10-B17','Research候选；未获独立Curation准入，不进入Reader/Public层。','remote_only','','https://www.cervantesvirtual.com/obra-visor/la-escritura-de-lo-posible--el-sistema-potico-de-jos-lezama-lima-0/html/ff2fbdf8-82b1-11df-acc7-002185ce6064_60.htm'),
('SRC-0760','WCD10-B17-S201','Guillermo Cabrera Infante. Cronología de obras — Instituto Cervantes','Guillermo Cabrera Infante. Cronología de obras — Instituto Cervantes','Instituto Cervantes, Bibliotecas y Documentación','','Instituto Cervantes','','','institutional_web_page','','es','B','access_pass','WCD-10-B17','Research候选；未获独立Curation准入，不进入Reader/Public层。','remote_only','','https://www.cervantes.es/bibliotecas_documentacion_espanol/biografias/varsovia_guillermo_cabrera_infante_1.htm'),
('SRC-0761','WCD10-B17-S202','Cabrera Infante, Guillermo — Enciclopedia Treccani','Cabrera Infante, Guillermo — Enciclopedia Treccani','Istituto della Enciclopedia Italiana','','Istituto della Enciclopedia Italiana','','','encyclopedia_web_page','','it','B','access_pass','WCD-10-B17','Research候选；未获独立Curation准入，不进入Reader/Public层。','remote_only','','https://www.treccani.it/enciclopedia/guillermo-cabrera-infante/'),
('SRC-0762','WCD10-B17-S203','Vista del amanecer en el trópico — Google Libros / Seix Barral record','Vista del amanecer en el trópico — Google Libros / Seix Barral record','Editorial Seix Barral (record hosted by Google Books)','','Editorial Seix Barral (record hosted by Google Books)','','','publisher_catalog_record','','es','B','access_pass','WCD-10-B17','Research候选；未获独立Curation准入，不进入Reader/Public层。','remote_only','','https://books.google.es/books/about/Vista_del_amanecer_en_el_tr%C3%B3pico.html?id=MnNAAAAAYAAJ'),
('SRC-0763','WCD10-B17-S204','La Habana para un infante difunto — PlanetadeLibros Argentina','La Habana para un infante difunto — PlanetadeLibros Argentina','Grupo Planeta / PlanetadeLibros','','Grupo Planeta / PlanetadeLibros','','','publisher_book_page','','es','B','access_pass','WCD-10-B17','Research候选；未获独立Curation准入，不进入Reader/Public层。','remote_only','','https://www.planetadelibros.com.ar/libro-la-habana-para-un-infante-difunto/125852'),
('SRC-0764','WCD10-B17-S205','Guillermo Cabrera Infante — Penguin Libros author page','Guillermo Cabrera Infante — Penguin Libros author page','Penguin Random House Grupo Editorial, S.A.U.','','Penguin Random House Grupo Editorial, S.A.U.','','','publisher_author_catalog_page','','es','B','access_pass','WCD-10-B17','Research候选；未获独立Curation准入，不进入Reader/Public层。','remote_only','','https://www.penguinlibros.com/us/67409-guillermo-cabrera-infante');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0730','collection','《献给士兵的歌与献给游客的颂》','Cantos para soldados y sones para turistas','candidate','1','WCD10-B17-W001','Cervantes Virtual书目列出1937年版本；CVC作者传记直接概述该书诗歌面向被征为士兵的工人与其阶级意识。 来源称其为多首诗的作品集，故归collection。; 中文为检索工作译名，原文题名为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0731','collection','《西班牙：四重忧思与一线希望之诗》','España. Poema en cuatro angustias y una esperanza','candidate','1','WCD10-B17-W002','CVC传记将其明确称为poemario（诗集），故归collection；副题“Poema en cuatro angustias y una esperanza”是书目所载题名的一部分，不据其单数形式把整册改作单首长诗。; 中文为检索工作译名；保留西班牙语副题作为作品身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0732','collection','《大众飞翔的鸽子：挽歌》','La paloma de vuelo popular. Elegías','candidate','1','WCD10-B17-W003','Cervantes Virtual作者书目列出该书1958年版；CVC作者传记概述作品汇集旅行经验，并提到其中的社会主题。 来源称其为多首诗的作品集，故归collection。; 中文为检索工作译名，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0733','collection','《大动物园》','El gran zoo','candidate','1','WCD10-B17-W004','Cervantes Virtual书目记录1967年版本，CVC传记称1968年出版；依年份冲突政策不填原子年份，保留版目与传记各自所载口径。; 中文为检索工作译名，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0734','collection','《我拥有》','Tengo','candidate','1','WCD10-B17-W005','Cervantes Virtual书目将Tengo列为1964年出版物；CVC传记同年明确记载该书，并概括其从见证革命转向庆祝其成果。; 中文为检索工作译名，西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0735','work','《纳西索之死》（暂译）','Muerte de Narciso','candidate','1','WCD10-B17-W101','直接书目来源确认其为Lezama Lima作品；本候选仅提出普通书目、体裁及简短有界说明，不声称穷尽作品全集或学术覆盖。; 中文题名仅作检索用暂译，西班牙语原题为作品身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0736','collection','《敌意的传闻》（暂译）','Enemigo rumor','candidate','1','WCD10-B17-W102','直接书目来源确认其为Lezama Lima作品；本候选仅提出普通书目、体裁及简短有界说明，不声称穷尽作品全集或学术覆盖。; 中文题名仅作检索用暂译，西班牙语原题为作品身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0737','collection','《隐秘的冒险》（暂译）','Aventuras sigilosas','candidate','1','WCD10-B17-W103','直接书目来源确认其为Lezama Lima作品；本候选仅提出普通书目、体裁及简短有界说明，不声称穷尽作品全集或学术覆盖。; 中文题名仅作检索用暂译，西班牙语原题为作品身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0738','collection','《固定》（暂译）','La fijeza','candidate','1','WCD10-B17-W104','直接书目来源确认其为Lezama Lima作品；本候选仅提出普通书目、体裁及简短有界说明，不声称穷尽作品全集或学术覆盖。; 中文题名仅作检索用暂译，西班牙语原题为作品身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0739','collection','《给予者》（暂译）','Dador','candidate','1','WCD10-B17-W105','直接书目来源确认其为Lezama Lima作品；本候选仅提出普通书目、体裁及简短有界说明，不声称穷尽作品全集或学术覆盖。; 中文题名仅作检索用暂译，西班牙语原题为作品身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0740','collection','《哈瓦那论稿》（暂译）','Tratados en La Habana','candidate','1','WCD10-B17-W106','直接书目来源确认其为Lezama Lima作品；本候选仅提出普通书目、体裁及简短有界说明，不声称穷尽作品全集或学术覆盖。; 中文题名仅作检索用暂译，西班牙语原题为作品身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0741','collection','《着魔的数量》（暂译）','La cantidad hechizada','candidate','1','WCD10-B17-W107','直接书目来源确认其为Lezama Lima作品；本候选仅提出普通书目、体裁及简短有界说明，不声称穷尽作品全集或学术覆盖。; 中文题名仅作检索用暂译，西班牙语原题为作品身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0742','collection','《献给磁石的片段》（暂译）','Fragmentos a su imán','candidate','1','WCD10-B17-W108','直接书目来源确认其为Lezama Lima作品；本候选仅提出普通书目、体裁及简短有界说明，不声称穷尽作品全集或学术覆盖。; 中文题名仅作检索用暂译，西班牙语原题为作品身份锚点，不表示存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0743','collection','《如此和平，如此战争》','Así en la paz como en la guerra','candidate','1','WCD10-B17-W201','Cervantes年表和作者出版社书目均列此1960年短篇小说集；补一项有来源的早期核心书目。; 中文仅作检索工作译名，保留西班牙语原题，不声称正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0744','collection','《二十世纪的行当》','Un oficio del siglo XX','candidate','1','WCD10-B17-W202','Instituto Cervantes年表和作者出版社书目均列此1963年作品，出版社将其分类为电影评论汇编。; 中文仅作检索工作译名，保留西班牙语原题，不声称正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0745','work','《神圣的肉身》','Cuerpos divinos','candidate','1','WCD10-B17-W203','Penguin列2010年身后出版，Instituto Cervantes年表列1979年；年份口径冲突如注记保留，原子首发年留空。Penguin说明其回望作者在古巴的青年生活。; 中文仅作检索工作译名，保留西班牙语原题，不声称正式中文译本。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0726','WCD10-B17-W001','WCD-10-B17','WCD10-B17-W001','V1-ENT-0730','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0727','WCD10-B17-W002','WCD-10-B17','WCD10-B17-W002','V1-ENT-0731','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0728','WCD10-B17-W003','WCD-10-B17','WCD10-B17-W003','V1-ENT-0732','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0729','WCD10-B17-W004','WCD-10-B17','WCD10-B17-W004','V1-ENT-0733','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0730','WCD10-B17-W005','WCD-10-B17','WCD10-B17-W005','V1-ENT-0734','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0731','WCD10-B17-W101','WCD-10-B17','WCD10-B17-W101','V1-ENT-0735','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0732','WCD10-B17-W102','WCD-10-B17','WCD10-B17-W102','V1-ENT-0736','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0733','WCD10-B17-W103','WCD-10-B17','WCD10-B17-W103','V1-ENT-0737','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0734','WCD10-B17-W104','WCD-10-B17','WCD10-B17-W104','V1-ENT-0738','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0735','WCD10-B17-W105','WCD-10-B17','WCD10-B17-W105','V1-ENT-0739','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0736','WCD10-B17-W106','WCD-10-B17','WCD10-B17-W106','V1-ENT-0740','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0737','WCD10-B17-W107','WCD-10-B17','WCD10-B17-W107','V1-ENT-0741','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0738','WCD10-B17-W108','WCD-10-B17','WCD10-B17-W108','V1-ENT-0742','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0739','WCD10-B17-W201','WCD-10-B17','WCD10-B17-W201','V1-ENT-0743','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0740','WCD10-B17-W202','WCD-10-B17','WCD10-B17-W202','V1-ENT-0744','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0741','WCD10-B17-W203','WCD-10-B17','WCD10-B17-W203','V1-ENT-0745','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0729','WCD-10-B17:V1-ENT-0730','V1-ENT-0730','collection','《献给士兵的歌与献给游客的颂》','尼古拉斯·纪廉','Cantos para soldados y sones para turistas','古巴','es','1937','诗集','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《献给士兵的歌与献给游客的颂》｜Cantos para soldados y sones para turistas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1937
- genre_or_form：诗集
- one_sentence_summary：书中诗歌呼吁被征为士兵、服务于他人利益的工人重新认识自身的无产阶级出身，并与本阶级利益相连。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0730','WCD-10-B17:V1-ENT-0731','V1-ENT-0731','collection','《西班牙：四重忧思与一线希望之诗》','尼古拉斯·纪廉','España. Poema en cuatro angustias y una esperanza','古巴','es','1937','诗集','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《西班牙：四重忧思与一线希望之诗》｜España. Poema en cuatro angustias y una esperanza

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1937
- genre_or_form：诗集
- bibliographic_note：书目副题为Poema en cuatro angustias y una esperanza；1937年墨西哥版。
- one_sentence_summary：作者传记将该诗集与作者声援受到威胁的西班牙共和国相联系。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0731','WCD-10-B17:V1-ENT-0732','V1-ENT-0732','collection','《大众飞翔的鸽子：挽歌》','尼古拉斯·纪廉','La paloma de vuelo popular. Elegías','古巴','es','1958','挽歌诗集','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《大众飞翔的鸽子：挽歌》｜La paloma de vuelo popular. Elegías

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1958
- genre_or_form：挽歌诗集
- one_sentence_summary：作品收录作者旅行经历；传记指出其中以不义、奴役与殖民主义为主题，并写到甘蔗田工人的劳动。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0732','WCD-10-B17:V1-ENT-0733','V1-ENT-0733','collection','《大动物园》','尼古拉斯·纪廉','El gran zoo','古巴','es','','诗集','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《大动物园》｜El gran zoo

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗集
- bibliographic_note：Cervantes Virtual作品书目列1967年《Unión》版；CVC作者传记记为1968年出版。两来源口径有差异，故不将任一版本年份直接确认为首版年。
- one_sentence_summary：作品以简洁、诙谐的风格，将安第斯山、飓风与加勒比海等拉美地理事物描写为想象动物园中的奇异生物。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0733','WCD-10-B17:V1-ENT-0734','V1-ENT-0734','collection','《我拥有》','尼古拉斯·纪廉','Tengo','古巴','es','1964','诗集','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《我拥有》｜Tengo

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1964
- genre_or_form：诗集
- one_sentence_summary：诗人以作品见证革命后的生活变化；CVC传记指出，该书不再只是歌唱革命的承诺，而转向庆祝其成果。
- bibliographic_note：Cervantes Virtual书目记载La Habana、Universidad de Las Villas、1964；CVC传记亦记1964年出版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0734','WCD-10-B17:V1-ENT-0735','V1-ENT-0735','work','《纳西索之死》（暂译）','何塞·莱萨马·利马','Muerte de Narciso','古巴','es','1937','长诗','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《纳西索之死》（暂译）｜Muerte de Narciso

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1937
- genre_or_form：长诗
- one_sentence_summary：1937年首刊于《Verbum》第二期并于同年单册印行的二十五节长诗。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0735','WCD-10-B17:V1-ENT-0736','V1-ENT-0736','collection','《敌意的传闻》（暂译）','何塞·莱萨马·利马','Enemigo rumor','古巴','es','1941','诗集','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《敌意的传闻》（暂译）｜Enemigo rumor

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1941
- genre_or_form：诗集
- one_sentence_summary：作者书目将其列为诗集，并记录1941年出版；此处只作书目级描述。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0736','WCD-10-B17:V1-ENT-0737','V1-ENT-0737','collection','《隐秘的冒险》（暂译）','何塞·莱萨马·利马','Aventuras sigilosas','古巴','es','1945','诗集','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《隐秘的冒险》（暂译）｜Aventuras sigilosas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1945
- genre_or_form：诗集
- one_sentence_summary：作者书目将其列为诗集，并记录1945年出版；此处只作书目级描述。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0737','WCD-10-B17:V1-ENT-0738','V1-ENT-0738','collection','《固定》（暂译）','何塞·莱萨马·利马','La fijeza','古巴','es','1949','诗集','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《固定》（暂译）｜La fijeza

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1949
- genre_or_form：诗集
- one_sentence_summary：机构作者页和研究书目均将其列为诗集；书目记录1949年版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0738','WCD-10-B17:V1-ENT-0739','V1-ENT-0739','collection','《给予者》（暂译）','何塞·莱萨马·利马','Dador','古巴','es','1960','诗集','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《给予者》（暂译）｜Dador

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1960
- genre_or_form：诗集
- one_sentence_summary：作者书目将其列为诗集，并记录1960年出版；此处只作书目级描述。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0739','WCD-10-B17:V1-ENT-0740','V1-ENT-0740','collection','《哈瓦那论稿》（暂译）','何塞·莱萨马·利马','Tratados en La Habana','古巴','es','1958','随笔集','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《哈瓦那论稿》（暂译）｜Tratados en La Habana

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1958
- genre_or_form：随笔集
- one_sentence_summary：作者书目将其列为随笔/论文著作，并记录1958年出版；此处只作书目级描述。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0740','WCD-10-B17:V1-ENT-0741','V1-ENT-0741','collection','《着魔的数量》（暂译）','何塞·莱萨马·利马','La cantidad hechizada','古巴','es','1970','随笔集','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《着魔的数量》（暂译）｜La cantidad hechizada

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1970
- genre_or_form：随笔集
- one_sentence_summary：作者书目将其列为随笔/论文著作，并记录1970年出版；此处只作书目级描述。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0741','WCD-10-B17:V1-ENT-0742','V1-ENT-0742','collection','《献给磁石的片段》（暂译）','何塞·莱萨马·利马','Fragmentos a su imán','古巴','es','','诗集','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《献给磁石的片段》（暂译）｜Fragmentos a su imán

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗集
- one_sentence_summary：研究者将该书描述为莱萨马晚年处境的诗歌化表达，并指出它以更具情境性的诗篇呈现其诗学脉络。
- bibliographic_note：塞万提斯虚拟图书馆书目列哈瓦那1977年版及墨西哥、巴塞罗那1978年版；Editorial Anagrama作者页标注1978年。来源年份口径不同，故保留版本记录并不指定原子首版年份。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0742','WCD-10-B17:V1-ENT-0743','V1-ENT-0743','collection','《如此和平，如此战争》','吉列尔莫·卡夫雷拉·因凡特','Así en la paz como en la guerra','古巴','es','1960','短篇小说集','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《如此和平，如此战争》｜Así en la paz como en la guerra

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1960
- genre_or_form：短篇小说集
- one_sentence_summary：出版者将该书列为作者1960年的短篇小说集。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0743','WCD-10-B17:V1-ENT-0744','V1-ENT-0744','collection','《二十世纪的行当》','吉列尔莫·卡夫雷拉·因凡特','Un oficio del siglo XX','古巴','es','1963','电影评论汇编','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《二十世纪的行当》｜Un oficio del siglo XX

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1963
- genre_or_form：电影评论汇编
- one_sentence_summary：这部1963年作品汇集作者的电影评论。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0744','WCD-10-B17:V1-ENT-0745','V1-ENT-0745','work','《神圣的肉身》','吉列尔莫·卡夫雷拉·因凡特','Cuerpos divinos','古巴','es','','小说化回忆录','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《神圣的肉身》｜Cuerpos divinos

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- bibliographic_note：Instituto Cervantes年表将Cuerpos divinos列于1979年；Penguin书目列2010年并说明身后出版。两来源未说明1979的年份口径，故本候选不填写原子首发年。
- genre_or_form：小说化回忆录
- one_sentence_summary：以小说化回忆重现作者在古巴度过的青年生活；Penguin书目注明该书身后出版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0745','WCD-10-B17:V1-ENT-0317','V1-ENT-0317','collection','《松调》','尼古拉斯·纪廉','Motivos de son','古巴','es','','','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《松调》｜Motivos de son

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：《松调》｜Motivos de son — CVC传记称这本1930年的首部诗集以古巴黑人民众的独特言语和son节奏呈现其生活，使其成为岛屿文化与情感的核心主体。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0746','WCD-10-B17:V1-ENT-0318','V1-ENT-0318','collection','《桑戈罗·科松戈》','尼古拉斯·纪廉','Sóngoro cosongo','古巴','es','','','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《桑戈罗·科松戈》｜Sóngoro cosongo

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：《桑戈罗·科松戈》｜Sóngoro cosongo — CVC传记称该诗集借助标题的拟声形式，表现诗人呈现古巴岛屿非洲根源、节奏与声音的意图。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0747','WCD-10-B17:V1-ENT-0319','V1-ENT-0319','collection','《西印度公司》','尼古拉斯·纪廉','West Indies, Ltd.','古巴','es','','','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《西印度公司》｜West Indies, Ltd.

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：《西印度公司》｜West Indies, Ltd. — CVC传记将该诗集描述为延续古巴诗歌节奏与声音、同时加强社会批判的作品。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0748','WCD-10-B17:V1-ENT-0323','V1-ENT-0323','work','《天堂》','何塞·莱萨马·利马','Paradiso','古巴','es','','','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《天堂》｜Paradiso

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：AAP称其为1966年小说，并概述其位于二十世纪西语小说的重要作品之列。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0749','WCD-10-B17:V1-ENT-0324','V1-ENT-0324','work','《奥皮亚诺·利卡里奥》','何塞·莱萨马·利马','Oppiano Licario','古巴','es','','','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《奥皮亚诺·利卡里奥》｜Oppiano Licario

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：AAP称其为《天堂》中人物命名的未完成续作，并记录其1977年在墨西哥初版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0750','WCD-10-B17:V1-ENT-0325','V1-ENT-0325','work','《美洲的表达》','何塞·莱萨马·利马','La expresión americana','古巴','es','','','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《美洲的表达》｜La expresión americana

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：AAP记载该书源自作者1957年在哈瓦那所作的五部分讲演，内容表达其对拉丁美洲文化的看法。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0751','WCD-10-B17:V1-ENT-0326','V1-ENT-0326','work','《三只忧伤的老虎》','吉列尔莫·卡夫雷拉·因凡特','Tres tristes tigres','古巴','es','','','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《三只忧伤的老虎》｜Tres tristes tigres

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：小说以巴蒂斯塔独裁时期的一群年轻人为中心，并通过强烈的语言与结构实验展开。
- bibliographic_note：Instituto Cervantes作品年表列1967；Treccani条目将小说标注为1964年（并注明意大利语译本1976）。现存V1-FCT-0871仍按1967保留；两来源口径的对应版本/年份关系未能由本次来源厘清。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0752','WCD-10-B17:V1-ENT-0327','V1-ENT-0327','work','《热带黎明景观》','吉列尔莫·卡夫雷拉·因凡特','Vista del amanecer en el trópico','古巴','es','','历史题材叙事作品（Relatos）','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《热带黎明景观》｜Vista del amanecer en el trópico

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：历史题材叙事作品（Relatos）
- one_sentence_summary：以诗性叙事片段巡览古巴历史、人民、地理与艺术，并涉及独立斗争、独裁暴力及革命后的冲突。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0753','WCD-10-B17:V1-ENT-0328','V1-ENT-0328','work','《哈瓦那，一个早夭婴儿的回忆》','吉列尔莫·卡夫雷拉·因凡特','La Habana para un infante difunto','古巴','es','','小说','WCD-10-B17','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《哈瓦那，一个早夭婴儿的回忆》｜La Habana para un infante difunto

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：出版社简介提及好莱坞电影，以及叙述者追寻金发女性的叙事线索。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-2444','WCD10-B17-W001-F01','V1-CARD-0729','V1-ENT-0730','first_publication_year','1937','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2445','WCD10-B17-W001-F02','V1-CARD-0729','V1-ENT-0730','genre_or_form','诗集','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2446','WCD10-B17-W001-F03','V1-CARD-0729','V1-ENT-0730','one_sentence_summary','书中诗歌呼吁被征为士兵、服务于他人利益的工人重新认识自身的无产阶级出身，并与本阶级利益相连。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2447','WCD10-B17-W002-F01','V1-CARD-0730','V1-ENT-0731','first_publication_year','1937','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2448','WCD10-B17-W002-F02','V1-CARD-0730','V1-ENT-0731','genre_or_form','诗集','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2449','WCD10-B17-W002-F03','V1-CARD-0730','V1-ENT-0731','bibliographic_note','书目副题为Poema en cuatro angustias y una esperanza；1937年墨西哥版。','bibliographic_note','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2450','WCD10-B17-W002-F04','V1-CARD-0730','V1-ENT-0731','one_sentence_summary','作者传记将该诗集与作者声援受到威胁的西班牙共和国相联系。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2451','WCD10-B17-W003-F01','V1-CARD-0731','V1-ENT-0732','first_publication_year','1958','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2452','WCD10-B17-W003-F02','V1-CARD-0731','V1-ENT-0732','genre_or_form','挽歌诗集','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2453','WCD10-B17-W003-F03','V1-CARD-0731','V1-ENT-0732','one_sentence_summary','作品收录作者旅行经历；传记指出其中以不义、奴役与殖民主义为主题，并写到甘蔗田工人的劳动。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2454','WCD10-B17-W004-F01','V1-CARD-0732','V1-ENT-0733','genre_or_form','诗集','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2455','WCD10-B17-W004-F02','V1-CARD-0732','V1-ENT-0733','bibliographic_note','Cervantes Virtual作品书目列1967年《Unión》版；CVC作者传记记为1968年出版。两来源口径有差异，故不将任一版本年份直接确认为首版年。','bibliographic_note','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2456','WCD10-B17-W004-F03','V1-CARD-0732','V1-ENT-0733','one_sentence_summary','作品以简洁、诙谐的风格，将安第斯山、飓风与加勒比海等拉美地理事物描写为想象动物园中的奇异生物。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2457','WCD10-B17-W005-F01','V1-CARD-0733','V1-ENT-0734','first_publication_year','1964','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2458','WCD10-B17-W005-F02','V1-CARD-0733','V1-ENT-0734','genre_or_form','诗集','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2459','WCD10-B17-W005-F03','V1-CARD-0733','V1-ENT-0734','one_sentence_summary','诗人以作品见证革命后的生活变化；CVC传记指出，该书不再只是歌唱革命的承诺，而转向庆祝其成果。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2460','WCD10-B17-W005-F04','V1-CARD-0733','V1-ENT-0734','bibliographic_note','Cervantes Virtual书目记载La Habana、Universidad de Las Villas、1964；CVC传记亦记1964年出版。','bibliographic_note','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2461','WCD10-B17-W101-F01','V1-CARD-0734','V1-ENT-0735','first_publication_year','1937','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2462','WCD10-B17-W101-F02','V1-CARD-0734','V1-ENT-0735','genre_or_form','长诗','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2463','WCD10-B17-W101-F03','V1-CARD-0734','V1-ENT-0735','one_sentence_summary','1937年首刊于《Verbum》第二期并于同年单册印行的二十五节长诗。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2464','WCD10-B17-W102-F01','V1-CARD-0735','V1-ENT-0736','first_publication_year','1941','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2465','WCD10-B17-W102-F02','V1-CARD-0735','V1-ENT-0736','genre_or_form','诗集','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2466','WCD10-B17-W102-F03','V1-CARD-0735','V1-ENT-0736','one_sentence_summary','作者书目将其列为诗集，并记录1941年出版；此处只作书目级描述。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2467','WCD10-B17-W103-F01','V1-CARD-0736','V1-ENT-0737','first_publication_year','1945','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2468','WCD10-B17-W103-F02','V1-CARD-0736','V1-ENT-0737','genre_or_form','诗集','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2469','WCD10-B17-W103-F03','V1-CARD-0736','V1-ENT-0737','one_sentence_summary','作者书目将其列为诗集，并记录1945年出版；此处只作书目级描述。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2470','WCD10-B17-W104-F01','V1-CARD-0737','V1-ENT-0738','first_publication_year','1949','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2471','WCD10-B17-W104-F02','V1-CARD-0737','V1-ENT-0738','genre_or_form','诗集','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2472','WCD10-B17-W104-F03','V1-CARD-0737','V1-ENT-0738','one_sentence_summary','机构作者页和研究书目均将其列为诗集；书目记录1949年版。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2473','WCD10-B17-W105-F01','V1-CARD-0738','V1-ENT-0739','first_publication_year','1960','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2474','WCD10-B17-W105-F02','V1-CARD-0738','V1-ENT-0739','genre_or_form','诗集','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2475','WCD10-B17-W105-F03','V1-CARD-0738','V1-ENT-0739','one_sentence_summary','作者书目将其列为诗集，并记录1960年出版；此处只作书目级描述。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2476','WCD10-B17-W106-F01','V1-CARD-0739','V1-ENT-0740','first_publication_year','1958','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2477','WCD10-B17-W106-F02','V1-CARD-0739','V1-ENT-0740','genre_or_form','随笔集','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2478','WCD10-B17-W106-F03','V1-CARD-0739','V1-ENT-0740','one_sentence_summary','作者书目将其列为随笔/论文著作，并记录1958年出版；此处只作书目级描述。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2479','WCD10-B17-W107-F01','V1-CARD-0740','V1-ENT-0741','first_publication_year','1970','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2480','WCD10-B17-W107-F02','V1-CARD-0740','V1-ENT-0741','genre_or_form','随笔集','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2481','WCD10-B17-W107-F03','V1-CARD-0740','V1-ENT-0741','one_sentence_summary','作者书目将其列为随笔/论文著作，并记录1970年出版；此处只作书目级描述。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2482','WCD10-B17-W108-F01','V1-CARD-0741','V1-ENT-0742','genre_or_form','诗集','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2483','WCD10-B17-W108-F02','V1-CARD-0741','V1-ENT-0742','one_sentence_summary','研究者将该书描述为莱萨马晚年处境的诗歌化表达，并指出它以更具情境性的诗篇呈现其诗学脉络。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2484','WCD10-B17-W108-F03','V1-CARD-0741','V1-ENT-0742','bibliographic_note','塞万提斯虚拟图书馆书目列哈瓦那1977年版及墨西哥、巴塞罗那1978年版；Editorial Anagrama作者页标注1978年。来源年份口径不同，故保留版本记录并不指定原子首版年份。','bibliographic_note','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2485','WCD10-B17-W201-F01','V1-CARD-0742','V1-ENT-0743','first_publication_year','1960','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2486','WCD10-B17-W201-F02','V1-CARD-0742','V1-ENT-0743','genre_or_form','短篇小说集','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2487','WCD10-B17-W201-F03','V1-CARD-0742','V1-ENT-0743','one_sentence_summary','出版者将该书列为作者1960年的短篇小说集。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2488','WCD10-B17-W202-F01','V1-CARD-0743','V1-ENT-0744','first_publication_year','1963','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2489','WCD10-B17-W202-F02','V1-CARD-0743','V1-ENT-0744','genre_or_form','电影评论汇编','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2490','WCD10-B17-W202-F03','V1-CARD-0743','V1-ENT-0744','one_sentence_summary','这部1963年作品汇集作者的电影评论。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2491','WCD10-B17-W203-F01','V1-CARD-0744','V1-ENT-0745','bibliographic_note','Instituto Cervantes年表将Cuerpos divinos列于1979年；Penguin书目列2010年并说明身后出版。两来源未说明1979的年份口径，故本候选不填写原子首发年。','bibliographic_note','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2492','WCD10-B17-W203-F02','V1-CARD-0744','V1-ENT-0745','genre_or_form','小说化回忆录','bibliographic','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2493','WCD10-B17-W203-F03','V1-CARD-0744','V1-ENT-0745','one_sentence_summary','以小说化回忆重现作者在古巴度过的青年生活；Penguin书目注明该书身后出版。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2494','WCD10-B17-F001','V1-CARD-0745','V1-ENT-0317','one_sentence_summary','《松调》｜Motivos de son — CVC传记称这本1930年的首部诗集以古巴黑人民众的独特言语和son节奏呈现其生活，使其成为岛屿文化与情感的核心主体。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','仅追加有界作品简介；不改动或替代冻结baseline中的任何旧事实值。'),
('V1-FCT-2495','WCD10-B17-F002','V1-CARD-0746','V1-ENT-0318','one_sentence_summary','《桑戈罗·科松戈》｜Sóngoro cosongo — CVC传记称该诗集借助标题的拟声形式，表现诗人呈现古巴岛屿非洲根源、节奏与声音的意图。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','仅追加有界作品简介；不改动或替代冻结baseline中的任何旧事实值。'),
('V1-FCT-2496','WCD10-B17-F003','V1-CARD-0747','V1-ENT-0319','one_sentence_summary','《西印度公司》｜West Indies, Ltd. — CVC传记将该诗集描述为延续古巴诗歌节奏与声音、同时加强社会批判的作品。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','仅追加有界作品简介；不改动或替代冻结baseline中的任何旧事实值。'),
('V1-FCT-2497','WCD10-B17-F101','V1-CARD-0748','V1-ENT-0323','one_sentence_summary','AAP称其为1966年小说，并概述其位于二十世纪西语小说的重要作品之列。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','只追加一条有界作品简介；不改写冻结事实、卡片或关联。'),
('V1-FCT-2498','WCD10-B17-F102','V1-CARD-0749','V1-ENT-0324','one_sentence_summary','AAP称其为《天堂》中人物命名的未完成续作，并记录其1977年在墨西哥初版。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','只追加一条有界作品简介；不改写冻结事实、卡片或关联。'),
('V1-FCT-2499','WCD10-B17-F103','V1-CARD-0750','V1-ENT-0325','one_sentence_summary','AAP记载该书源自作者1957年在哈瓦那所作的五部分讲演，内容表达其对拉丁美洲文化的看法。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','只追加一条有界作品简介；不改写冻结事实、卡片或关联。'),
('V1-FCT-2500','WCD10-B17-F201','V1-CARD-0751','V1-ENT-0326','one_sentence_summary','小说以巴蒂斯塔独裁时期的一群年轻人为中心，并通过强烈的语言与结构实验展开。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','只采纳Treccani对小说体裁、人物群像与语言/结构实验的有限概述；未补写具体人物或情节。'),
('V1-FCT-2501','WCD10-B17-F202','V1-CARD-0751','V1-ENT-0326','bibliographic_note','Instituto Cervantes作品年表列1967；Treccani条目将小说标注为1964年（并注明意大利语译本1976）。现存V1-FCT-0871仍按1967保留；两来源口径的对应版本/年份关系未能由本次来源厘清。','bibliographic_note','WCD-10-B17','high','batch_retained_candidate','仅增加来源口径并存说明，不覆盖既存原子年份事实V1-FCT-0871；不将1964或1967重定为已解决的唯一首发年。'),
('V1-FCT-2502','WCD10-B17-F203','V1-CARD-0752','V1-ENT-0327','genre_or_form','历史题材叙事作品（Relatos）','bibliographic','WCD-10-B17','high','batch_retained_candidate','按Seix Barral书目系列Relatos及作品简介作有限体裁描述，不推定更窄的体裁分类。'),
('V1-FCT-2503','WCD10-B17-F204','V1-CARD-0752','V1-ENT-0327','one_sentence_summary','以诗性叙事片段巡览古巴历史、人民、地理与艺术，并涉及独立斗争、独裁暴力及革命后的冲突。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','紧随出版社简介的主题范围；不把书中片段归并为完整或中立的古巴史。'),
('V1-FCT-2504','WCD10-B17-F205','V1-CARD-0753','V1-ENT-0328','genre_or_form','小说','bibliographic','WCD-10-B17','high','batch_retained_candidate','沿用出版社作品页的“Novela literaria”体裁标签。'),
('V1-FCT-2505','WCD10-B17-F206','V1-CARD-0753','V1-ENT-0328','one_sentence_summary','出版社简介提及好莱坞电影，以及叙述者追寻金发女性的叙事线索。','institutional_paraphrase','WCD-10-B17','high','batch_retained_candidate','转述出版社作品页简介；不扩展为作者生平事实或全书情节概括。');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-2444','SRC-0245','Bibliografía - Nicolás Guillén'),
('V1-FCT-2445','SRC-0245','Bibliografía - Nicolás Guillén'),
('V1-FCT-2446','SRC-0246','CVC. Nicolás Guillén. Biografía'),
('V1-FCT-2447','SRC-0245','Bibliografía - Nicolás Guillén'),
('V1-FCT-2448','SRC-0245','Bibliografía - Nicolás Guillén'),
('V1-FCT-2449','SRC-0245','Bibliografía - Nicolás Guillén'),
('V1-FCT-2450','SRC-0246','CVC. Nicolás Guillén. Biografía'),
('V1-FCT-2451','SRC-0245','Bibliografía - Nicolás Guillén'),
('V1-FCT-2452','SRC-0245','Bibliografía - Nicolás Guillén'),
('V1-FCT-2453','SRC-0246','CVC. Nicolás Guillén. Biografía'),
('V1-FCT-2454','SRC-0245','Bibliografía - Nicolás Guillén'),
('V1-FCT-2455','SRC-0245','Bibliografía - Nicolás Guillén'),
('V1-FCT-2455','SRC-0246','CVC. Nicolás Guillén. Biografía'),
('V1-FCT-2456','SRC-0246','CVC. Nicolás Guillén. Biografía'),
('V1-FCT-2457','SRC-0245','Bibliografía - Nicolás Guillén'),
('V1-FCT-2458','SRC-0245','Bibliografía - Nicolás Guillén'),
('V1-FCT-2459','SRC-0246','CVC. Nicolás Guillén. Biografía'),
('V1-FCT-2460','SRC-0245','Bibliografía - Nicolás Guillén'),
('V1-FCT-2460','SRC-0246','CVC. Nicolás Guillén. Biografía'),
('V1-FCT-2461','SRC-0248','About José Lezama Lima'),
('V1-FCT-2461','SRC-0758','José Lezama Lima — Editorial Anagrama'),
('V1-FCT-2461','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2462','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2463','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2464','SRC-0248','About José Lezama Lima'),
('V1-FCT-2464','SRC-0758','José Lezama Lima — Editorial Anagrama'),
('V1-FCT-2464','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2465','SRC-0248','About José Lezama Lima'),
('V1-FCT-2465','SRC-0758','José Lezama Lima — Editorial Anagrama'),
('V1-FCT-2465','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2466','SRC-0248','About José Lezama Lima'),
('V1-FCT-2466','SRC-0758','José Lezama Lima — Editorial Anagrama'),
('V1-FCT-2466','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2467','SRC-0248','About José Lezama Lima'),
('V1-FCT-2467','SRC-0758','José Lezama Lima — Editorial Anagrama'),
('V1-FCT-2467','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2468','SRC-0248','About José Lezama Lima'),
('V1-FCT-2468','SRC-0758','José Lezama Lima — Editorial Anagrama'),
('V1-FCT-2468','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2469','SRC-0248','About José Lezama Lima'),
('V1-FCT-2469','SRC-0758','José Lezama Lima — Editorial Anagrama'),
('V1-FCT-2469','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2470','SRC-0248','About José Lezama Lima'),
('V1-FCT-2470','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2471','SRC-0248','About José Lezama Lima'),
('V1-FCT-2471','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2472','SRC-0248','About José Lezama Lima'),
('V1-FCT-2472','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2473','SRC-0248','About José Lezama Lima'),
('V1-FCT-2473','SRC-0758','José Lezama Lima — Editorial Anagrama'),
('V1-FCT-2473','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2474','SRC-0248','About José Lezama Lima'),
('V1-FCT-2474','SRC-0758','José Lezama Lima — Editorial Anagrama'),
('V1-FCT-2474','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2475','SRC-0248','About José Lezama Lima'),
('V1-FCT-2475','SRC-0758','José Lezama Lima — Editorial Anagrama'),
('V1-FCT-2475','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2476','SRC-0758','José Lezama Lima — Editorial Anagrama'),
('V1-FCT-2476','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2477','SRC-0758','José Lezama Lima — Editorial Anagrama'),
('V1-FCT-2477','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2478','SRC-0758','José Lezama Lima — Editorial Anagrama'),
('V1-FCT-2478','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2479','SRC-0758','José Lezama Lima — Editorial Anagrama'),
('V1-FCT-2479','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2480','SRC-0758','José Lezama Lima — Editorial Anagrama'),
('V1-FCT-2480','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2481','SRC-0758','José Lezama Lima — Editorial Anagrama'),
('V1-FCT-2481','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2482','SRC-0758','José Lezama Lima — Editorial Anagrama'),
('V1-FCT-2482','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2483','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2484','SRC-0758','José Lezama Lima — Editorial Anagrama'),
('V1-FCT-2484','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-2485','SRC-0760','Guillermo Cabrera Infante. Cronología de obras — Instituto Cervantes'),
('V1-FCT-2485','SRC-0764','Guillermo Cabrera Infante — Penguin Libros author page'),
('V1-FCT-2486','SRC-0764','Guillermo Cabrera Infante — Penguin Libros author page'),
('V1-FCT-2487','SRC-0764','Guillermo Cabrera Infante — Penguin Libros author page'),
('V1-FCT-2488','SRC-0760','Guillermo Cabrera Infante. Cronología de obras — Instituto Cervantes'),
('V1-FCT-2488','SRC-0764','Guillermo Cabrera Infante — Penguin Libros author page'),
('V1-FCT-2489','SRC-0764','Guillermo Cabrera Infante — Penguin Libros author page'),
('V1-FCT-2490','SRC-0764','Guillermo Cabrera Infante — Penguin Libros author page'),
('V1-FCT-2491','SRC-0760','Guillermo Cabrera Infante. Cronología de obras — Instituto Cervantes'),
('V1-FCT-2491','SRC-0764','Guillermo Cabrera Infante — Penguin Libros author page'),
('V1-FCT-2492','SRC-0764','Guillermo Cabrera Infante — Penguin Libros author page'),
('V1-FCT-2493','SRC-0764','Guillermo Cabrera Infante — Penguin Libros author page'),
('V1-FCT-2494','SRC-0246','CVC. Nicolás Guillén. Biografía'),
('V1-FCT-2495','SRC-0246','CVC. Nicolás Guillén. Biografía'),
('V1-FCT-2496','SRC-0246','CVC. Nicolás Guillén. Biografía'),
('V1-FCT-2497','SRC-0248','About José Lezama Lima'),
('V1-FCT-2498','SRC-0248','About José Lezama Lima'),
('V1-FCT-2499','SRC-0248','About José Lezama Lima'),
('V1-FCT-2500','SRC-0761','Cabrera Infante, Guillermo — Enciclopedia Treccani'),
('V1-FCT-2501','SRC-0760','Guillermo Cabrera Infante. Cronología de obras — Instituto Cervantes'),
('V1-FCT-2501','SRC-0761','Cabrera Infante, Guillermo — Enciclopedia Treccani'),
('V1-FCT-2502','SRC-0762','Vista del amanecer en el trópico — Google Libros / Seix Barral record'),
('V1-FCT-2503','SRC-0762','Vista del amanecer en el trópico — Google Libros / Seix Barral record'),
('V1-FCT-2504','SRC-0763','La Habana para un infante difunto — PlanetadeLibros Argentina'),
('V1-FCT-2505','SRC-0763','La Habana para un infante difunto — PlanetadeLibros Argentina');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0729','V1-FCT-2444','batch_retained_candidate'),
('V1-CARD-0729','V1-FCT-2445','batch_retained_candidate'),
('V1-CARD-0729','V1-FCT-2446','batch_retained_candidate'),
('V1-CARD-0730','V1-FCT-2447','batch_retained_candidate'),
('V1-CARD-0730','V1-FCT-2448','batch_retained_candidate'),
('V1-CARD-0730','V1-FCT-2449','batch_retained_candidate'),
('V1-CARD-0730','V1-FCT-2450','batch_retained_candidate'),
('V1-CARD-0731','V1-FCT-2451','batch_retained_candidate'),
('V1-CARD-0731','V1-FCT-2452','batch_retained_candidate'),
('V1-CARD-0731','V1-FCT-2453','batch_retained_candidate'),
('V1-CARD-0732','V1-FCT-2454','batch_retained_candidate'),
('V1-CARD-0732','V1-FCT-2455','batch_retained_candidate'),
('V1-CARD-0732','V1-FCT-2456','batch_retained_candidate'),
('V1-CARD-0733','V1-FCT-2457','batch_retained_candidate'),
('V1-CARD-0733','V1-FCT-2458','batch_retained_candidate'),
('V1-CARD-0733','V1-FCT-2459','batch_retained_candidate'),
('V1-CARD-0733','V1-FCT-2460','batch_retained_candidate'),
('V1-CARD-0734','V1-FCT-2461','batch_retained_candidate'),
('V1-CARD-0734','V1-FCT-2462','batch_retained_candidate'),
('V1-CARD-0734','V1-FCT-2463','batch_retained_candidate'),
('V1-CARD-0735','V1-FCT-2464','batch_retained_candidate'),
('V1-CARD-0735','V1-FCT-2465','batch_retained_candidate'),
('V1-CARD-0735','V1-FCT-2466','batch_retained_candidate'),
('V1-CARD-0736','V1-FCT-2467','batch_retained_candidate'),
('V1-CARD-0736','V1-FCT-2468','batch_retained_candidate'),
('V1-CARD-0736','V1-FCT-2469','batch_retained_candidate'),
('V1-CARD-0737','V1-FCT-2470','batch_retained_candidate'),
('V1-CARD-0737','V1-FCT-2471','batch_retained_candidate'),
('V1-CARD-0737','V1-FCT-2472','batch_retained_candidate'),
('V1-CARD-0738','V1-FCT-2473','batch_retained_candidate'),
('V1-CARD-0738','V1-FCT-2474','batch_retained_candidate'),
('V1-CARD-0738','V1-FCT-2475','batch_retained_candidate'),
('V1-CARD-0739','V1-FCT-2476','batch_retained_candidate'),
('V1-CARD-0739','V1-FCT-2477','batch_retained_candidate'),
('V1-CARD-0739','V1-FCT-2478','batch_retained_candidate'),
('V1-CARD-0740','V1-FCT-2479','batch_retained_candidate'),
('V1-CARD-0740','V1-FCT-2480','batch_retained_candidate'),
('V1-CARD-0740','V1-FCT-2481','batch_retained_candidate'),
('V1-CARD-0741','V1-FCT-2482','batch_retained_candidate'),
('V1-CARD-0741','V1-FCT-2483','batch_retained_candidate'),
('V1-CARD-0741','V1-FCT-2484','batch_retained_candidate'),
('V1-CARD-0742','V1-FCT-2485','batch_retained_candidate'),
('V1-CARD-0742','V1-FCT-2486','batch_retained_candidate'),
('V1-CARD-0742','V1-FCT-2487','batch_retained_candidate'),
('V1-CARD-0743','V1-FCT-2488','batch_retained_candidate'),
('V1-CARD-0743','V1-FCT-2489','batch_retained_candidate'),
('V1-CARD-0743','V1-FCT-2490','batch_retained_candidate'),
('V1-CARD-0744','V1-FCT-2491','batch_retained_candidate'),
('V1-CARD-0744','V1-FCT-2492','batch_retained_candidate'),
('V1-CARD-0744','V1-FCT-2493','batch_retained_candidate'),
('V1-CARD-0745','V1-FCT-2494','batch_retained_candidate'),
('V1-CARD-0746','V1-FCT-2495','batch_retained_candidate'),
('V1-CARD-0747','V1-FCT-2496','batch_retained_candidate'),
('V1-CARD-0748','V1-FCT-2497','batch_retained_candidate'),
('V1-CARD-0749','V1-FCT-2498','batch_retained_candidate'),
('V1-CARD-0750','V1-FCT-2499','batch_retained_candidate'),
('V1-CARD-0751','V1-FCT-2500','batch_retained_candidate'),
('V1-CARD-0751','V1-FCT-2501','batch_retained_candidate'),
('V1-CARD-0752','V1-FCT-2502','batch_retained_candidate'),
('V1-CARD-0752','V1-FCT-2503','batch_retained_candidate'),
('V1-CARD-0753','V1-FCT-2504','batch_retained_candidate'),
('V1-CARD-0753','V1-FCT-2505','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-1460','WCD10-B17-S001','V1-CARD-0729','SRC-0245','B','bibliography_or_bounded_description','yes','no','SRC-0245','accepted','NONE'),
('V1-CS-1461','WCD10-B17-S002','V1-CARD-0729','SRC-0246','B','bibliography_or_bounded_description','no','no','SRC-0246','accepted','NONE'),
('V1-CS-1462','WCD10-B17-S001','V1-CARD-0730','SRC-0245','B','bibliography_or_bounded_description','yes','no','SRC-0245','accepted','NONE'),
('V1-CS-1463','WCD10-B17-S002','V1-CARD-0730','SRC-0246','B','bibliography_or_bounded_description','no','no','SRC-0246','accepted','NONE'),
('V1-CS-1464','WCD10-B17-S001','V1-CARD-0731','SRC-0245','B','bibliography_or_bounded_description','yes','no','SRC-0245','accepted','NONE'),
('V1-CS-1465','WCD10-B17-S002','V1-CARD-0731','SRC-0246','B','bibliography_or_bounded_description','no','no','SRC-0246','accepted','NONE'),
('V1-CS-1466','WCD10-B17-S001','V1-CARD-0732','SRC-0245','B','bibliography_or_bounded_description','yes','no','SRC-0245','accepted','NONE'),
('V1-CS-1467','WCD10-B17-S002','V1-CARD-0732','SRC-0246','B','bibliography_or_bounded_description','yes','no','SRC-0246','accepted','NONE'),
('V1-CS-1468','WCD10-B17-S001','V1-CARD-0733','SRC-0245','B','bibliography_or_bounded_description','yes','no','SRC-0245','accepted','NONE'),
('V1-CS-1469','WCD10-B17-S002','V1-CARD-0733','SRC-0246','B','bibliography_or_bounded_description','yes','no','SRC-0246','accepted','NONE'),
('V1-CS-1470','WCD10-B17-S101','V1-CARD-0734','SRC-0248','B','bibliography_or_bounded_description','yes','no','SRC-0248','accepted','NONE'),
('V1-CS-1471','WCD10-B17-S102','V1-CARD-0734','SRC-0758','B','bibliography_or_bounded_description','yes','no','SRC-0758','accepted','NONE'),
('V1-CS-1472','WCD10-B17-S103','V1-CARD-0734','SRC-0759','A','bibliography_or_bounded_description','yes','no','SRC-0759','accepted','NONE'),
('V1-CS-1473','WCD10-B17-S101','V1-CARD-0735','SRC-0248','B','bibliography_or_bounded_description','yes','no','SRC-0248','accepted','NONE'),
('V1-CS-1474','WCD10-B17-S102','V1-CARD-0735','SRC-0758','B','bibliography_or_bounded_description','yes','no','SRC-0758','accepted','NONE'),
('V1-CS-1475','WCD10-B17-S103','V1-CARD-0735','SRC-0759','A','bibliography_or_bounded_description','yes','no','SRC-0759','accepted','NONE'),
('V1-CS-1476','WCD10-B17-S101','V1-CARD-0736','SRC-0248','B','bibliography_or_bounded_description','yes','no','SRC-0248','accepted','NONE'),
('V1-CS-1477','WCD10-B17-S102','V1-CARD-0736','SRC-0758','B','bibliography_or_bounded_description','yes','no','SRC-0758','accepted','NONE'),
('V1-CS-1478','WCD10-B17-S103','V1-CARD-0736','SRC-0759','A','bibliography_or_bounded_description','yes','no','SRC-0759','accepted','NONE'),
('V1-CS-1479','WCD10-B17-S101','V1-CARD-0737','SRC-0248','B','bibliography_or_bounded_description','yes','no','SRC-0248','accepted','NONE'),
('V1-CS-1480','WCD10-B17-S103','V1-CARD-0737','SRC-0759','A','bibliography_or_bounded_description','yes','no','SRC-0759','accepted','NONE'),
('V1-CS-1481','WCD10-B17-S101','V1-CARD-0738','SRC-0248','B','bibliography_or_bounded_description','yes','no','SRC-0248','accepted','NONE'),
('V1-CS-1482','WCD10-B17-S102','V1-CARD-0738','SRC-0758','B','bibliography_or_bounded_description','yes','no','SRC-0758','accepted','NONE'),
('V1-CS-1483','WCD10-B17-S103','V1-CARD-0738','SRC-0759','A','bibliography_or_bounded_description','yes','no','SRC-0759','accepted','NONE'),
('V1-CS-1484','WCD10-B17-S102','V1-CARD-0739','SRC-0758','B','bibliography_or_bounded_description','yes','no','SRC-0758','accepted','NONE'),
('V1-CS-1485','WCD10-B17-S103','V1-CARD-0739','SRC-0759','A','bibliography_or_bounded_description','yes','no','SRC-0759','accepted','NONE'),
('V1-CS-1486','WCD10-B17-S102','V1-CARD-0740','SRC-0758','B','bibliography_or_bounded_description','yes','no','SRC-0758','accepted','NONE'),
('V1-CS-1487','WCD10-B17-S103','V1-CARD-0740','SRC-0759','A','bibliography_or_bounded_description','yes','no','SRC-0759','accepted','NONE'),
('V1-CS-1488','WCD10-B17-S102','V1-CARD-0741','SRC-0758','B','bibliography_or_bounded_description','yes','no','SRC-0758','accepted','NONE'),
('V1-CS-1489','WCD10-B17-S103','V1-CARD-0741','SRC-0759','A','bibliography_or_bounded_description','yes','no','SRC-0759','accepted','NONE'),
('V1-CS-1490','WCD10-B17-S201','V1-CARD-0742','SRC-0760','B','bibliography_or_bounded_description','yes','no','SRC-0760','accepted','NONE'),
('V1-CS-1491','WCD10-B17-S205','V1-CARD-0742','SRC-0764','B','bibliography_or_bounded_description','yes','no','SRC-0764','accepted','NONE'),
('V1-CS-1492','WCD10-B17-S201','V1-CARD-0743','SRC-0760','B','bibliography_or_bounded_description','yes','no','SRC-0760','accepted','NONE'),
('V1-CS-1493','WCD10-B17-S205','V1-CARD-0743','SRC-0764','B','bibliography_or_bounded_description','yes','no','SRC-0764','accepted','NONE'),
('V1-CS-1494','WCD10-B17-S201','V1-CARD-0744','SRC-0760','B','bibliography_or_bounded_description','yes','no','SRC-0760','accepted','NONE'),
('V1-CS-1495','WCD10-B17-S205','V1-CARD-0744','SRC-0764','B','bibliography_or_bounded_description','yes','no','SRC-0764','accepted','NONE'),
('V1-CS-1496','WCD10-B17-S002','V1-CARD-0745','SRC-0246','B','bibliography_or_bounded_description','no','no','SRC-0246','accepted','NONE'),
('V1-CS-1497','WCD10-B17-S002','V1-CARD-0746','SRC-0246','B','bibliography_or_bounded_description','no','no','SRC-0246','accepted','NONE'),
('V1-CS-1498','WCD10-B17-S002','V1-CARD-0747','SRC-0246','B','bibliography_or_bounded_description','no','no','SRC-0246','accepted','NONE'),
('V1-CS-1499','WCD10-B17-S101','V1-CARD-0748','SRC-0248','B','bibliography_or_bounded_description','no','no','SRC-0248','accepted','NONE'),
('V1-CS-1500','WCD10-B17-S101','V1-CARD-0749','SRC-0248','B','bibliography_or_bounded_description','no','no','SRC-0248','accepted','NONE'),
('V1-CS-1501','WCD10-B17-S101','V1-CARD-0750','SRC-0248','B','bibliography_or_bounded_description','no','no','SRC-0248','accepted','NONE'),
('V1-CS-1502','WCD10-B17-S201','V1-CARD-0751','SRC-0760','B','bibliography_or_bounded_description','yes','no','SRC-0760','accepted','NONE'),
('V1-CS-1503','WCD10-B17-S202','V1-CARD-0751','SRC-0761','B','bibliography_or_bounded_description','yes','no','SRC-0761','accepted','NONE'),
('V1-CS-1504','WCD10-B17-S203','V1-CARD-0752','SRC-0762','B','bibliography_or_bounded_description','yes','no','SRC-0762','accepted','NONE'),
('V1-CS-1505','WCD10-B17-S204','V1-CARD-0753','SRC-0763','B','bibliography_or_bounded_description','yes','no','SRC-0763','accepted','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0702','WCD-10-B17','WCD10-B17-W001-CREATED','V1-ENT-0310','CREATED','V1-ENT-0730','尼古拉斯·纪廉创作 Cantos para soldados y sones para turistas','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0703','WCD-10-B17','WCD10-B17-W002-CREATED','V1-ENT-0310','CREATED','V1-ENT-0731','尼古拉斯·纪廉创作 España. Poema en cuatro angustias y una esperanza','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0704','WCD-10-B17','WCD10-B17-W003-CREATED','V1-ENT-0310','CREATED','V1-ENT-0732','尼古拉斯·纪廉创作 La paloma de vuelo popular. Elegías','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0705','WCD-10-B17','WCD10-B17-W004-CREATED','V1-ENT-0310','CREATED','V1-ENT-0733','尼古拉斯·纪廉创作 El gran zoo','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0706','WCD-10-B17','WCD10-B17-W005-CREATED','V1-ENT-0310','CREATED','V1-ENT-0734','尼古拉斯·纪廉创作 Tengo','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0707','WCD-10-B17','WCD10-B17-W101-CREATED','V1-ENT-0320','CREATED','V1-ENT-0735','何塞·莱萨马·利马创作 Muerte de Narciso','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0708','WCD-10-B17','WCD10-B17-W102-CREATED','V1-ENT-0320','CREATED','V1-ENT-0736','何塞·莱萨马·利马创作 Enemigo rumor','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0709','WCD-10-B17','WCD10-B17-W103-CREATED','V1-ENT-0320','CREATED','V1-ENT-0737','何塞·莱萨马·利马创作 Aventuras sigilosas','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0710','WCD-10-B17','WCD10-B17-W104-CREATED','V1-ENT-0320','CREATED','V1-ENT-0738','何塞·莱萨马·利马创作 La fijeza','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0711','WCD-10-B17','WCD10-B17-W105-CREATED','V1-ENT-0320','CREATED','V1-ENT-0739','何塞·莱萨马·利马创作 Dador','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0712','WCD-10-B17','WCD10-B17-W106-CREATED','V1-ENT-0320','CREATED','V1-ENT-0740','何塞·莱萨马·利马创作 Tratados en La Habana','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0713','WCD-10-B17','WCD10-B17-W107-CREATED','V1-ENT-0320','CREATED','V1-ENT-0741','何塞·莱萨马·利马创作 La cantidad hechizada','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0714','WCD-10-B17','WCD10-B17-W108-CREATED','V1-ENT-0320','CREATED','V1-ENT-0742','何塞·莱萨马·利马创作 Fragmentos a su imán','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0715','WCD-10-B17','WCD10-B17-W201-CREATED','V1-ENT-0321','CREATED','V1-ENT-0743','吉列尔莫·卡夫雷拉·因凡特创作 Así en la paz como en la guerra','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0716','WCD-10-B17','WCD10-B17-W202-CREATED','V1-ENT-0321','CREATED','V1-ENT-0744','吉列尔莫·卡夫雷拉·因凡特创作 Un oficio del siglo XX','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0717','WCD-10-B17','WCD10-B17-W203-CREATED','V1-ENT-0321','CREATED','V1-ENT-0745','吉列尔莫·卡夫雷拉·因凡特创作 Cuerpos divinos','high','accepted','Codex-parent-independent-review:PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0702','SRC-0245'),
('V1-REL-0703','SRC-0245'),
('V1-REL-0704','SRC-0245'),
('V1-REL-0705','SRC-0245'),
('V1-REL-0706','SRC-0245'),
('V1-REL-0707','SRC-0759'),
('V1-REL-0708','SRC-0248'),
('V1-REL-0708','SRC-0758'),
('V1-REL-0708','SRC-0759'),
('V1-REL-0709','SRC-0248'),
('V1-REL-0709','SRC-0758'),
('V1-REL-0709','SRC-0759'),
('V1-REL-0710','SRC-0248'),
('V1-REL-0710','SRC-0759'),
('V1-REL-0711','SRC-0248'),
('V1-REL-0711','SRC-0758'),
('V1-REL-0711','SRC-0759'),
('V1-REL-0712','SRC-0758'),
('V1-REL-0712','SRC-0759'),
('V1-REL-0713','SRC-0758'),
('V1-REL-0713','SRC-0759'),
('V1-REL-0714','SRC-0758'),
('V1-REL-0714','SRC-0759'),
('V1-REL-0715','SRC-0760'),
('V1-REL-0715','SRC-0764'),
('V1-REL-0716','SRC-0760'),
('V1-REL-0716','SRC-0764'),
('V1-REL-0717','SRC-0764');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-1052','V1-REL-0702','WCD10-B17-S001','SRC-0245','Bibliografía - Nicolás Guillén','实读2026-10-14：第47–48行列Cantos para soldados y sones para turistas（1937）和España. Poema en cuatro angustias y una esperanza（1937）；第56行列La paloma de vuelo popular. Elegías（1958）；第62行列Tengo（1964）；第65行列El gran zoo的1967版。','尼古拉斯·纪廉创作 Cantos para soldados y sones para turistas','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1053','V1-REL-0703','WCD10-B17-S001','SRC-0245','Bibliografía - Nicolás Guillén','实读2026-10-14：第47–48行列Cantos para soldados y sones para turistas（1937）和España. Poema en cuatro angustias y una esperanza（1937）；第56行列La paloma de vuelo popular. Elegías（1958）；第62行列Tengo（1964）；第65行列El gran zoo的1967版。','尼古拉斯·纪廉创作 España. Poema en cuatro angustias y una esperanza','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1054','V1-REL-0704','WCD10-B17-S001','SRC-0245','Bibliografía - Nicolás Guillén','实读2026-10-14：第47–48行列Cantos para soldados y sones para turistas（1937）和España. Poema en cuatro angustias y una esperanza（1937）；第56行列La paloma de vuelo popular. Elegías（1958）；第62行列Tengo（1964）；第65行列El gran zoo的1967版。','尼古拉斯·纪廉创作 La paloma de vuelo popular. Elegías','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1055','V1-REL-0705','WCD10-B17-S001','SRC-0245','Bibliografía - Nicolás Guillén','实读2026-10-14：第47–48行列Cantos para soldados y sones para turistas（1937）和España. Poema en cuatro angustias y una esperanza（1937）；第56行列La paloma de vuelo popular. Elegías（1958）；第62行列Tengo（1964）；第65行列El gran zoo的1967版。','尼古拉斯·纪廉创作 El gran zoo','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1056','V1-REL-0706','WCD10-B17-S001','SRC-0245','Bibliografía - Nicolás Guillén','实读2026-10-14：第47–48行列Cantos para soldados y sones para turistas（1937）和España. Poema en cuatro angustias y una esperanza（1937）；第56行列La paloma de vuelo popular. Elegías（1958）；第62行列Tengo（1964）；第65行列El gran zoo的1967版。','尼古拉斯·纪廉创作 Tengo','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1057','V1-REL-0707','WCD10-B17-S103','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes','替代访问入口（同一研究专著的相邻章节，不新增来源对象）：第427行明确称Muerte de Narciso为长诗，记载1937年发表于Verbum第二期并于同年由Impresiones Úcar单册印行；第432行称其有二十五节。该入口由worker于2026-10-14实际打开。规范canonical bibliografía URL仍为本来源S103的https://www.cervantesvirtual.com/obra-visor/la-escritura-de-lo-posible--el-sistema-potico-de-jos-lezama-lima-0/html/ff2fbdf8-82b1-11df-acc7-002185ce6064_60.htm。','何塞·莱萨马·利马创作 Muerte de Narciso','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1058','V1-REL-0708','WCD10-B17-S101','SRC-0248','About José Lezama Lima','实际打开正文第37–40行：第37行列Muerte de Narciso为1937首部诗集；第38行列Paradiso (UNEAC, 1966)、Oppiano Licario (Mexico, 1977)；第39行列Dador (1960)、La Fijeza (1949)、Aventuras sigilosas (1945)、Enemigo rumor (1941)；第40行说明La expresión americana源自1957年五部分讲演。实读2026-10-14。','何塞·莱萨马·利马创作 Enemigo rumor','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1059','V1-REL-0708','WCD10-B17-S102','SRC-0758','José Lezama Lima — Editorial Anagrama','实际打开第65行：Fragmentos a su imán列于诗歌作品并标注1978年；第66行直接区分随笔与小说类别。实读2026-10-14。','何塞·莱萨马·利马创作 Enemigo rumor','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1060','V1-REL-0708','WCD10-B17-S103','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes','替代访问入口（同一研究专著的相邻章节，不新增来源对象）：第427行明确称Muerte de Narciso为长诗，记载1937年发表于Verbum第二期并于同年由Impresiones Úcar单册印行；第432行称其有二十五节。该入口由worker于2026-10-14实际打开。规范canonical bibliografía URL仍为本来源S103的https://www.cervantesvirtual.com/obra-visor/la-escritura-de-lo-posible--el-sistema-potico-de-jos-lezama-lima-0/html/ff2fbdf8-82b1-11df-acc7-002185ce6064_60.htm。','何塞·莱萨马·利马创作 Enemigo rumor','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1061','V1-REL-0709','WCD10-B17-S101','SRC-0248','About José Lezama Lima','实际打开正文第37–40行：第37行列Muerte de Narciso为1937首部诗集；第38行列Paradiso (UNEAC, 1966)、Oppiano Licario (Mexico, 1977)；第39行列Dador (1960)、La Fijeza (1949)、Aventuras sigilosas (1945)、Enemigo rumor (1941)；第40行说明La expresión americana源自1957年五部分讲演。实读2026-10-14。','何塞·莱萨马·利马创作 Aventuras sigilosas','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1062','V1-REL-0709','WCD10-B17-S102','SRC-0758','José Lezama Lima — Editorial Anagrama','实际打开第65行：Fragmentos a su imán列于诗歌作品并标注1978年；第66行直接区分随笔与小说类别。实读2026-10-14。','何塞·莱萨马·利马创作 Aventuras sigilosas','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1063','V1-REL-0709','WCD10-B17-S103','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes','替代访问入口（同一研究专著的相邻章节，不新增来源对象）：第427行明确称Muerte de Narciso为长诗，记载1937年发表于Verbum第二期并于同年由Impresiones Úcar单册印行；第432行称其有二十五节。该入口由worker于2026-10-14实际打开。规范canonical bibliografía URL仍为本来源S103的https://www.cervantesvirtual.com/obra-visor/la-escritura-de-lo-posible--el-sistema-potico-de-jos-lezama-lima-0/html/ff2fbdf8-82b1-11df-acc7-002185ce6064_60.htm。','何塞·莱萨马·利马创作 Aventuras sigilosas','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1064','V1-REL-0710','WCD10-B17-S101','SRC-0248','About José Lezama Lima','实际打开正文第37–40行：第37行列Muerte de Narciso为1937首部诗集；第38行列Paradiso (UNEAC, 1966)、Oppiano Licario (Mexico, 1977)；第39行列Dador (1960)、La Fijeza (1949)、Aventuras sigilosas (1945)、Enemigo rumor (1941)；第40行说明La expresión americana源自1957年五部分讲演。实读2026-10-14。','何塞·莱萨马·利马创作 La fijeza','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1065','V1-REL-0710','WCD10-B17-S103','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes','替代访问入口（同一研究专著的相邻章节，不新增来源对象）：第427行明确称Muerte de Narciso为长诗，记载1937年发表于Verbum第二期并于同年由Impresiones Úcar单册印行；第432行称其有二十五节。该入口由worker于2026-10-14实际打开。规范canonical bibliografía URL仍为本来源S103的https://www.cervantesvirtual.com/obra-visor/la-escritura-de-lo-posible--el-sistema-potico-de-jos-lezama-lima-0/html/ff2fbdf8-82b1-11df-acc7-002185ce6064_60.htm。','何塞·莱萨马·利马创作 La fijeza','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1066','V1-REL-0711','WCD10-B17-S101','SRC-0248','About José Lezama Lima','实际打开正文第37–40行：第37行列Muerte de Narciso为1937首部诗集；第38行列Paradiso (UNEAC, 1966)、Oppiano Licario (Mexico, 1977)；第39行列Dador (1960)、La Fijeza (1949)、Aventuras sigilosas (1945)、Enemigo rumor (1941)；第40行说明La expresión americana源自1957年五部分讲演。实读2026-10-14。','何塞·莱萨马·利马创作 Dador','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1067','V1-REL-0711','WCD10-B17-S102','SRC-0758','José Lezama Lima — Editorial Anagrama','实际打开第65行：Fragmentos a su imán列于诗歌作品并标注1978年；第66行直接区分随笔与小说类别。实读2026-10-14。','何塞·莱萨马·利马创作 Dador','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1068','V1-REL-0711','WCD10-B17-S103','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes','替代访问入口（同一研究专著的相邻章节，不新增来源对象）：第427行明确称Muerte de Narciso为长诗，记载1937年发表于Verbum第二期并于同年由Impresiones Úcar单册印行；第432行称其有二十五节。该入口由worker于2026-10-14实际打开。规范canonical bibliografía URL仍为本来源S103的https://www.cervantesvirtual.com/obra-visor/la-escritura-de-lo-posible--el-sistema-potico-de-jos-lezama-lima-0/html/ff2fbdf8-82b1-11df-acc7-002185ce6064_60.htm。','何塞·莱萨马·利马创作 Dador','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1069','V1-REL-0712','WCD10-B17-S102','SRC-0758','José Lezama Lima — Editorial Anagrama','实际打开第65行：Fragmentos a su imán列于诗歌作品并标注1978年；第66行直接区分随笔与小说类别。实读2026-10-14。','何塞·莱萨马·利马创作 Tratados en La Habana','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1070','V1-REL-0712','WCD10-B17-S103','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes','替代访问入口（同一研究专著的相邻章节，不新增来源对象）：第427行明确称Muerte de Narciso为长诗，记载1937年发表于Verbum第二期并于同年由Impresiones Úcar单册印行；第432行称其有二十五节。该入口由worker于2026-10-14实际打开。规范canonical bibliografía URL仍为本来源S103的https://www.cervantesvirtual.com/obra-visor/la-escritura-de-lo-posible--el-sistema-potico-de-jos-lezama-lima-0/html/ff2fbdf8-82b1-11df-acc7-002185ce6064_60.htm。','何塞·莱萨马·利马创作 Tratados en La Habana','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1071','V1-REL-0713','WCD10-B17-S102','SRC-0758','José Lezama Lima — Editorial Anagrama','实际打开第65行：Fragmentos a su imán列于诗歌作品并标注1978年；第66行直接区分随笔与小说类别。实读2026-10-14。','何塞·莱萨马·利马创作 La cantidad hechizada','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1072','V1-REL-0713','WCD10-B17-S103','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes','替代访问入口（同一研究专著的相邻章节，不新增来源对象）：第427行明确称Muerte de Narciso为长诗，记载1937年发表于Verbum第二期并于同年由Impresiones Úcar单册印行；第432行称其有二十五节。该入口由worker于2026-10-14实际打开。规范canonical bibliografía URL仍为本来源S103的https://www.cervantesvirtual.com/obra-visor/la-escritura-de-lo-posible--el-sistema-potico-de-jos-lezama-lima-0/html/ff2fbdf8-82b1-11df-acc7-002185ce6064_60.htm。','何塞·莱萨马·利马创作 La cantidad hechizada','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1073','V1-REL-0714','WCD10-B17-S102','SRC-0758','José Lezama Lima — Editorial Anagrama','实际打开第65行：Fragmentos a su imán列于诗歌作品并标注1978年；第66行直接区分随笔与小说类别。实读2026-10-14。','何塞·莱萨马·利马创作 Fragmentos a su imán','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1074','V1-REL-0714','WCD10-B17-S103','SRC-0759','La escritura de lo posible: el sistema poético de José Lezama Lima — Biblioteca Virtual Miguel de Cervantes','替代访问入口（同一研究专著的相邻章节，不新增来源对象）：第427行明确称Muerte de Narciso为长诗，记载1937年发表于Verbum第二期并于同年由Impresiones Úcar单册印行；第432行称其有二十五节。该入口由worker于2026-10-14实际打开。规范canonical bibliografía URL仍为本来源S103的https://www.cervantesvirtual.com/obra-visor/la-escritura-de-lo-posible--el-sistema-potico-de-jos-lezama-lima-0/html/ff2fbdf8-82b1-11df-acc7-002185ce6064_60.htm。','何塞·莱萨马·利马创作 Fragmentos a su imán','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1075','V1-REL-0715','WCD10-B17-S201','SRC-0760','Guillermo Cabrera Infante. Cronología de obras — Instituto Cervantes','实读2026-10-14；页面标题“Guillermo Cabrera Infante. Cronología de obras”；第47行列 Así en la paz como en la guerra (1960)，第49行列 Un oficio del siglo XX (1963)，第51/57/64/66行分别列Tres tristes tigres (1967)、Vista del amanecer en el trópico (1974)、Cuerpos divinos (1979)、La Habana para un infante difunto (1979)。','吉列尔莫·卡夫雷拉·因凡特创作 Así en la paz como en la guerra','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1076','V1-REL-0715','WCD10-B17-S205','SRC-0764','Guillermo Cabrera Infante — Penguin Libros author page','实读2026-10-14；第210—221行作者简介与作品类别：列出Así en la paz como en la guerra (1960)为短篇集、Un oficio del siglo XX (1963)为电影评论汇编、Cuerpos divinos (2010)为身后出版的自传性作品；第224—227行说明Cuerpos divinos回忆作者在古巴的青年生活。','吉列尔莫·卡夫雷拉·因凡特创作 Así en la paz como en la guerra','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1077','V1-REL-0716','WCD10-B17-S201','SRC-0760','Guillermo Cabrera Infante. Cronología de obras — Instituto Cervantes','实读2026-10-14；页面标题“Guillermo Cabrera Infante. Cronología de obras”；第47行列 Así en la paz como en la guerra (1960)，第49行列 Un oficio del siglo XX (1963)，第51/57/64/66行分别列Tres tristes tigres (1967)、Vista del amanecer en el trópico (1974)、Cuerpos divinos (1979)、La Habana para un infante difunto (1979)。','吉列尔莫·卡夫雷拉·因凡特创作 Un oficio del siglo XX','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1078','V1-REL-0716','WCD10-B17-S205','SRC-0764','Guillermo Cabrera Infante — Penguin Libros author page','实读2026-10-14；第210—221行作者简介与作品类别：列出Así en la paz como en la guerra (1960)为短篇集、Un oficio del siglo XX (1963)为电影评论汇编、Cuerpos divinos (2010)为身后出版的自传性作品；第224—227行说明Cuerpos divinos回忆作者在古巴的青年生活。','吉列尔莫·卡夫雷拉·因凡特创作 Un oficio del siglo XX','high','eligible_evidence','WCD-10-B17'),
('V1-EV-1079','V1-REL-0717','WCD10-B17-S205','SRC-0764','Guillermo Cabrera Infante — Penguin Libros author page','实读2026-10-14；第210—221行作者简介与作品类别：列出Así en la paz como en la guerra (1960)为短篇集、Un oficio del siglo XX (1963)为电影评论汇编、Cuerpos divinos (2010)为身后出版的自传性作品；第224—227行说明Cuerpos divinos回忆作者在古巴的青年生活。','吉列尔莫·卡夫雷拉·因凡特创作 Cuerpos divinos','high','eligible_evidence','WCD-10-B17');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0577','WCD-10-B17-G01','research_gap','guillen.full_author_oeuvre','open','本轮优先补入有直接依据的主要诗集与合集；尚未穷尽作者全部诗集、散文、评论和合集目录。','','Independent Reviewer: preserve preserve as out_of_scope','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0578','WCD-10-B17:V1-ENT-0317','research_gap','WCD10:work_level_research:V1-ENT-0317','open','现有B13来源主要为书目与传记页面，未据此宣称学术覆盖；尚可继续补查作品专门研究。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0579','WCD-10-B17:V1-ENT-0318','research_gap','WCD10:work_level_research:V1-ENT-0318','open','现有B13来源主要为书目与传记页面，未据此宣称学术覆盖；尚可继续补查作品专门研究。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0580','WCD-10-B17:V1-ENT-0319','research_gap','WCD10:work_level_research:V1-ENT-0319','open','现有B13来源主要为书目与传记页面，未据此宣称学术覆盖；尚可继续补查作品专门研究。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0581','WCD-10-B17:WCD10-B17-W001','research_gap','WCD10:work_level_research:V1-ENT-0730','open','目前依据为Cervantes Virtual作品书目与CVC作者传记；不据此宣称学术覆盖，作品专门研究仍可后续补充。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0582','WCD-10-B17:WCD10-B17-W002','research_gap','WCD10:work_level_research:V1-ENT-0731','open','目前依据为Cervantes Virtual作品书目与CVC作者传记；不据此宣称学术覆盖，作品专门研究仍可后续补充。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0583','WCD-10-B17:WCD10-B17-W003','research_gap','WCD10:work_level_research:V1-ENT-0732','open','目前依据为Cervantes Virtual作品书目与CVC作者传记；不据此宣称学术覆盖，作品专门研究仍可后续补充。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0584','WCD-10-B17:WCD10-B17-W004','research_gap','WCD10:work_level_research:V1-ENT-0733','open','目前依据为Cervantes Virtual作品书目与CVC作者传记；不据此宣称学术覆盖，作品专门研究仍可后续补充。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0585','WCD-10-B17:WCD10-B17-W005','research_gap','WCD10:work_level_research:V1-ENT-0734','open','目前依据为机构书目和作者传记；未据此宣称学术覆盖。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0586','WCD-10-B17:V1-ENT-0323','research_gap','WCD10:work_level_research:V1-ENT-0323','open','该作品既有卡片、事实、关系和来源链均按冻结清单保留；本批有界补一条来源可证作品简介。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0587','WCD-10-B17:V1-ENT-0324','research_gap','WCD10:work_level_research:V1-ENT-0324','open','该作品既有卡片、事实、关系和来源链均按冻结清单保留；本批有界补一条来源可证作品简介。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0588','WCD-10-B17:V1-ENT-0325','research_gap','WCD10:work_level_research:V1-ENT-0325','open','该作品既有卡片、事实、关系和来源链均按冻结清单保留；本批有界补一条来源可证作品简介。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0589','WCD-10-B17:WCD10-B17-W101','research_gap','WCD10:work_level_research:V1-ENT-0735','open','不声称作者全集；尚未以本来源作逐篇内容或学术研究综述。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0590','WCD-10-B17:WCD10-B17-W102','research_gap','WCD10:work_level_research:V1-ENT-0736','open','不声称作者全集；尚未以本来源作逐篇内容或学术研究综述。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0591','WCD-10-B17:WCD10-B17-W103','research_gap','WCD10:work_level_research:V1-ENT-0737','open','不声称作者全集；尚未以本来源作逐篇内容或学术研究综述。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0592','WCD-10-B17:WCD10-B17-W104','research_gap','WCD10:work_level_research:V1-ENT-0738','open','不声称作者全集；尚未以本来源作逐篇内容或学术研究综述。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0593','WCD-10-B17:WCD10-B17-W105','research_gap','WCD10:work_level_research:V1-ENT-0739','open','不声称作者全集；尚未以本来源作逐篇内容或学术研究综述。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0594','WCD-10-B17:WCD10-B17-W106','research_gap','WCD10:work_level_research:V1-ENT-0740','open','不声称作者全集；尚未以本来源作逐篇内容或学术研究综述。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0595','WCD-10-B17:WCD10-B17-W107','research_gap','WCD10:work_level_research:V1-ENT-0741','open','不声称作者全集；尚未以本来源作逐篇内容或学术研究综述。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0596','WCD-10-B17:WCD10-B17-W108','research_gap','WCD10:work_level_research:V1-ENT-0742','open','不声称作者全集；尚未以本来源作逐篇内容或学术研究综述。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0597','WCD-10-B17:V1-ENT-0326','research_gap','WCD10:work_level_research:V1-ENT-0326','open','保留其他未逐项调查的书目与现有User Review状态；不宣称作品目录或学术覆盖穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0598','WCD-10-B17:V1-ENT-0327','research_gap','WCD10:work_level_research:V1-ENT-0327','open','保留其他未逐项调查的书目与现有User Review状态；不宣称作品目录或学术覆盖穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0599','WCD-10-B17:V1-ENT-0328','research_gap','WCD10:work_level_research:V1-ENT-0328','open','保留其他未逐项调查的书目与现有User Review状态；不宣称作品目录或学术覆盖穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0600','WCD-10-B17:WCD10-B17-W201','research_gap','WCD10:work_level_research:V1-ENT-0743','open','仅保留当前来源可直接支持的书目/体裁/短描述；其余作品、版次和专业研究未穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0601','WCD-10-B17:WCD10-B17-W202','research_gap','WCD10:work_level_research:V1-ENT-0744','open','仅保留当前来源可直接支持的书目/体裁/短描述；其余作品、版次和专业研究未穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0602','WCD-10-B17:WCD10-B17-W203','research_gap','WCD10:work_level_research:V1-ENT-0745','open','仅保留当前来源可直接支持的书目/体裁/短描述；其余作品、版次和专业研究未穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');

UPDATE metadata SET value='WCD-10-B17' WHERE key='last_change_set';

UPDATE metadata SET value='2026-10-14' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 762 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 743 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 741 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 753 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2499 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 3109 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2478 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1497 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 715 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 1116 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 1087 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 602 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
