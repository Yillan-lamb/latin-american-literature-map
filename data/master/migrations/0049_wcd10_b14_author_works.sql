-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: Codex-parent-independent-review

-- Registration sha256: eb65dd4a747af52400aa4951ef2d5ff7f0f54ea40924f69df9648e58b54dcfcb

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2253 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1362 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 672 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 682 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 680 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 2768 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2274 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 498 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 48 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 984 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 1013 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 651 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 722 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B13' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0725' OR canonical_url='https://www.anagrama-ed.es/libro/narrativas-hispanicas/varamo/9788433924995/NH_328') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0726' OR canonical_url='https://www.ndbooks.com/book/how-i-became-a-nun/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0727' OR canonical_url='https://www.penguinlibros.com/es/literatura-contemporanea/28960-libro-un-episodio-en-la-vida-del-pintor-viajero-9788439711919') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0728' OR canonical_url='https://www.argentina.gob.ar/node/294856') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0729' OR canonical_url='https://www.planetadelibros.com.ar/libro-el-beso-de-la-mujer-arana/374416') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0730' OR canonical_url='https://www.planetadelibros.com.ar/libro-the-buenos-aires-affair-ne/354236') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0731' OR canonical_url='https://www.planetadelibros.com.ar/libro-maldicion-eterna-a-quien-lea-estas-paginas-ne/362422') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0732' OR canonical_url='https://www.planetadelibros.com.ar/libro-cae-la-noche-tropical/133554') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0733' OR canonical_url='https://rarebooks.library.nd.edu/collections/latin_american/south_american/southern_cone_lit/ocampo_s.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0685' OR (entity_type='work' AND original_name='Varamo')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0686' OR (entity_type='work' AND original_name='Cómo me hice monja')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0687' OR (entity_type='work' AND original_name='Un episodio en la vida del pintor viajero')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0688' OR (entity_type='work' AND original_name='The Buenos Aires Affair')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0689' OR (entity_type='work' AND original_name='Pubis angelical')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0690' OR (entity_type='work' AND original_name='Maldición eterna a quien lea estas páginas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0691' OR (entity_type='work' AND original_name='Sangre de amor correspondido')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0692' OR (entity_type='work' AND original_name='Cae la noche tropical')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0693' OR (entity_type='collection' AND original_name='Autobiografía de Irene')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0694' OR (entity_type='collection' AND original_name='Los días de la noche')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0695' OR (entity_type='collection' AND original_name='Y así sucesivamente')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0696' OR (entity_type='collection' AND original_name='Cornelia frente al espejo')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0697' OR (entity_type='collection' AND original_name='Enumeración de la patria')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0698' OR (entity_type='collection' AND original_name='Espacios métricos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2281' OR (subject_id='V1-ENT-0685' AND fact_field='genre_or_form' AND value_text='中篇小说（nouvelle）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2282' OR (subject_id='V1-ENT-0685' AND fact_field='one_sentence_summary' AND value_text='作品围绕巴拿马低级公务员瓦拉莫展开：他在领薪后经历一连串日常琐事，随后写出一部后来被称为中美洲现代诗歌杰作的作品。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2283' OR (subject_id='V1-ENT-0685' AND fact_field='bibliographic_note' AND value_text='Editorial Anagrama作品页将2002-02-01列为该版出版日期；此处作为出版社版本书目日期记录，不推定首版年份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2284' OR (subject_id='V1-ENT-0686' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2285' OR (subject_id='V1-ENT-0686' AND fact_field='one_sentence_summary' AND value_text='作品以第一人称讲述一个六岁儿童的成长经历，叙述在记忆、现实与虚构之间展开。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2286' OR (subject_id='V1-ENT-0686' AND fact_field='bibliographic_note' AND value_text='New Directions出版社的独立作品页将此作作为单独书名出版，记录该英文版平装本出版于2008年2月1日；此为译本版本日期，不推定西语首版年份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2287' OR (subject_id='V1-ENT-0687' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2288' OR (subject_id='V1-ENT-0687' AND fact_field='one_sentence_summary' AND value_text='作品以旅行画家约翰·莫里茨·鲁根达斯为中心，描写他第二次美洲之行中从门多萨继续穿越潘帕斯平原的经历；这段旅程重塑其身体、视觉与人生。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2289' OR (subject_id='V1-ENT-0687' AND fact_field='bibliographic_note' AND value_text='Penguin页面将本ISBN版本标为2005年6月；记录为出版社版本日期，不推定作品首发年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2290' OR (subject_id='V1-ENT-0688' AND fact_field='first_publication_year' AND value_text='1973')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2291' OR (subject_id='V1-ENT-0688' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2292' OR (subject_id='V1-ENT-0688' AND fact_field='one_sentence_summary' AND value_text='出版社简介将小说置于1930至1969年间，以Leo Druscovich生命最后两天及一系列失踪、误导线索和性执念之谜为叙事线索。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2293' OR (subject_id='V1-ENT-0688' AND fact_field='bibliographic_note' AND value_text='阿根廷文化部记载作品于1973年出版并遭查禁；出版社简介支持此处有限情节概述。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2294' OR (subject_id='V1-ENT-0689' AND fact_field='first_publication_year' AND value_text='1979')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2295' OR (subject_id='V1-ENT-0689' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2296' OR (subject_id='V1-ENT-0689' AND fact_field='one_sentence_summary' AND value_text='小说以住院的安娜及其情感经历为线索，联系阿根廷20世纪60至70年代生活；阿根廷文化部提供这一简要内容说明。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2297' OR (subject_id='V1-ENT-0689' AND fact_field='bibliographic_note' AND value_text='阿根廷文化部机构文章记载《Pubis angelical》于1979年出版并列为普伊格作品；出版社作者书目列有该书。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2298' OR (subject_id='V1-ENT-0690' AND fact_field='first_publication_year' AND value_text='1980')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2299' OR (subject_id='V1-ENT-0690' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2300' OR (subject_id='V1-ENT-0690' AND fact_field='one_sentence_summary' AND value_text='出版社简介写一名阿根廷病人与美国看护者在纽约相遇，两人的孤独与对缺席女性的记忆构成关系主线。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2301' OR (subject_id='V1-ENT-0690' AND fact_field='bibliographic_note' AND value_text='出版社作者书目记载作品于1980年出版；该书页面支持此处有限情节概述。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2302' OR (subject_id='V1-ENT-0691' AND fact_field='first_publication_year' AND value_text='1982')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2303' OR (subject_id='V1-ENT-0691' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2304' OR (subject_id='V1-ENT-0691' AND fact_field='one_sentence_summary' AND value_text='小说以巴西小镇为背景，讲述少女Maria da Gloria及其家庭经历；阿根廷文化部提供该书的概要。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2305' OR (subject_id='V1-ENT-0691' AND fact_field='bibliographic_note' AND value_text='阿根廷文化部机构文章记载《Sangre de amor correspondido》于1982年出版并列为普伊格作品；出版社作者书目列有该书。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2306' OR (subject_id='V1-ENT-0692' AND fact_field='first_publication_year' AND value_text='1988')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2307' OR (subject_id='V1-ENT-0692' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2308' OR (subject_id='V1-ENT-0692' AND fact_field='one_sentence_summary' AND value_text='出版社简介以里约热内卢为背景，写两位年长的阿根廷姐妹谈及一位年轻流亡邻居的情感经历，并以交谈和闲谈呈现故事。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2309' OR (subject_id='V1-ENT-0692' AND fact_field='bibliographic_note' AND value_text='阿根廷文化部与出版社书目均列作品及1988年；出版社作品页面支持此处有限情节概述。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2310' OR (subject_id='V1-ENT-0693' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2311' OR (subject_id='V1-ENT-0693' AND fact_field='one_sentence_summary' AND value_text='Notre Dame特藏馆确认该对象为短篇故事集；目录将出版年分别列作1946和1948，冲突保留，不填首发年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2312' OR (subject_id='V1-ENT-0693' AND fact_field='bibliographic_note' AND value_text='Educ.ar条目将Autobiografía de Irene置于1946，阿根廷文化部与Notre Dame特藏图书馆列其为1948；大学图书馆确认这是1948短篇集初版。不同机构年份冲突保留，首发年份原子值留空。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2313' OR (subject_id='V1-ENT-0694' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2314' OR (subject_id='V1-ENT-0694' AND fact_field='first_publication_year' AND value_text='1970')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2315' OR (subject_id='V1-ENT-0694' AND fact_field='one_sentence_summary' AND value_text='Notre Dame特藏馆将其列为1970年出版的短篇故事集。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2316' OR (subject_id='V1-ENT-0694' AND fact_field='bibliographic_note' AND value_text='Educ.ar列该题名；Notre Dame特藏馆将其列作短篇集并记录1970首版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2317' OR (subject_id='V1-ENT-0695' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2318' OR (subject_id='V1-ENT-0695' AND fact_field='first_publication_year' AND value_text='1987')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2319' OR (subject_id='V1-ENT-0695' AND fact_field='one_sentence_summary' AND value_text='Educ.ar列为1987年作品；以机构列示的题名和年份作有限书目记录。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2320' OR (subject_id='V1-ENT-0695' AND fact_field='bibliographic_note' AND value_text='Educ.ar在作者作品目录列出《如此等等》（Y así sucesivamente）及1987；此候选不推断版本或作品全集地位。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2321' OR (subject_id='V1-ENT-0696' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2322' OR (subject_id='V1-ENT-0696' AND fact_field='first_publication_year' AND value_text='1988')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2323' OR (subject_id='V1-ENT-0696' AND fact_field='one_sentence_summary' AND value_text='Educ.ar列为1988年作品；本描述限于书目和作品形态。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2324' OR (subject_id='V1-ENT-0696' AND fact_field='bibliographic_note' AND value_text='Educ.ar在作者作品目录列出《科内莉亚面对镜子》（Cornelia frente al espejo）及1988；此候选不推断版本或作品全集地位。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2325' OR (subject_id='V1-ENT-0697' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2326' OR (subject_id='V1-ENT-0697' AND fact_field='first_publication_year' AND value_text='1942')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2327' OR (subject_id='V1-ENT-0697' AND fact_field='one_sentence_summary' AND value_text='Educ.ar诗歌作品目录列出该题名和1942年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2328' OR (subject_id='V1-ENT-0697' AND fact_field='bibliographic_note' AND value_text='Educ.ar在作者作品目录列出《祖国列举》（Enumeración de la patria）及1942；此候选不推断版本或作品全集地位。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2329' OR (subject_id='V1-ENT-0698' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2330' OR (subject_id='V1-ENT-0698' AND fact_field='one_sentence_summary' AND value_text='Educ.ar列1942，文化部与Notre Dame特藏图书馆列1945；冲突保留，不填原子首发年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2331' OR (subject_id='V1-ENT-0698' AND fact_field='bibliographic_note' AND value_text='Educ.ar目录列《Espacios métricos》为1942，文化部与Notre Dame特藏图书馆列为1945；大学特藏记为1945首版。冲突保留，首发年份原子值留空。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0654' OR (subject_id='V1-ENT-0274' AND relation_type='CREATED' AND object_id='V1-ENT-0685')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0655' OR (subject_id='V1-ENT-0274' AND relation_type='CREATED' AND object_id='V1-ENT-0686')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0656' OR (subject_id='V1-ENT-0274' AND relation_type='CREATED' AND object_id='V1-ENT-0687')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0657' OR (subject_id='V1-ENT-0284' AND relation_type='CREATED' AND object_id='V1-ENT-0688')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0658' OR (subject_id='V1-ENT-0284' AND relation_type='CREATED' AND object_id='V1-ENT-0689')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0659' OR (subject_id='V1-ENT-0284' AND relation_type='CREATED' AND object_id='V1-ENT-0690')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0660' OR (subject_id='V1-ENT-0284' AND relation_type='CREATED' AND object_id='V1-ENT-0691')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0661' OR (subject_id='V1-ENT-0284' AND relation_type='CREATED' AND object_id='V1-ENT-0692')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0662' OR (subject_id='V1-ENT-0285' AND relation_type='CREATED' AND object_id='V1-ENT-0693')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0663' OR (subject_id='V1-ENT-0285' AND relation_type='CREATED' AND object_id='V1-ENT-0694')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0664' OR (subject_id='V1-ENT-0285' AND relation_type='CREATED' AND object_id='V1-ENT-0695')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0665' OR (subject_id='V1-ENT-0285' AND relation_type='CREATED' AND object_id='V1-ENT-0696')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0666' OR (subject_id='V1-ENT-0285' AND relation_type='CREATED' AND object_id='V1-ENT-0697')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0667' OR (subject_id='V1-ENT-0285' AND relation_type='CREATED' AND object_id='V1-ENT-0698')) THEN 1 ELSE 0 END);


-- Controlled coauthor reentry preconditions, bound to the reviewed attachment.
INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationship_evidence WHERE evidence_id='V1-EV-1005') THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationship_evidence WHERE evidence_id='V1-EV-1006') THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationship_evidence WHERE evidence_id='V1-EV-1007') THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationship_evidence WHERE evidence_id='V1-EV-1008') THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationship_evidence WHERE evidence_id='V1-EV-1009') THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationship_evidence WHERE evidence_id='V1-EV-1010') THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationship_evidence WHERE evidence_id='V1-EV-1011') THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationship_evidence WHERE evidence_id='V1-EV-1012') THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM entities WHERE entity_id='V1-ENT-0285')=1 AND (SELECT COUNT(*) FROM entities WHERE entity_id='V1-ENT-0493')=1 THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE subject_id='V1-ENT-0285' AND relation_type='CREATED' AND object_id='V1-ENT-0493') THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM entities WHERE entity_id='V1-ENT-0285')=1 AND (SELECT COUNT(*) FROM entities WHERE entity_id='V1-ENT-0494')=1 THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE subject_id='V1-ENT-0285' AND relation_type='CREATED' AND object_id='V1-ENT-0494') THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM entities WHERE entity_id='V1-ENT-0002')=1 AND (SELECT COUNT(*) FROM entities WHERE entity_id='V1-ENT-0494')=1 THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE subject_id='V1-ENT-0002' AND relation_type='CREATED' AND object_id='V1-ENT-0494') THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0668') THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0669') THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0670') THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0154' AND (source_id IS 'SRC-0154' AND temporary_id IS 'B04-SRC-0154' AND title IS 'Adolfo Bioy Casares. Cronología de obras' AND original_title IS 'Cronología de obras' AND author_or_editor IS 'Biblioteca Virtual Miguel de Cervantes' AND translator IS '' AND publisher IS 'Instituto Cervantes' AND publication_year IS '持续更新（2026-08-20 访问）' AND isbn IS '' AND format IS 'web_page' AND page_count IS '' AND language IS 'es' AND source_level IS 'B' AND processing_status IS 'access_pass' AND source_task IS 'WEB-CE-B04' AND public_content_scope IS '三部小说的书目年份' AND local_asset_status IS 'remote_only' AND persistent_id IS '' AND canonical_url IS 'https://www.cervantesvirtual.com/portales/adolfo_bioy_casares/autor_cronologia/')) THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0478' AND (source_id IS 'SRC-0478' AND temporary_id IS 'WCD10-B07-S101' AND title IS 'Bibliografía de Adolfo Bioy Casares' AND original_title IS 'Bibliografía de Adolfo Bioy Casares' AND author_or_editor IS 'Carlos Dámaso Martínez' AND translator IS '' AND publisher IS 'Biblioteca Virtual Miguel de Cervantes' AND publication_year IS '' AND isbn IS '' AND format IS 'institutional_bibliography_web_page' AND page_count IS '' AND language IS 'es' AND source_level IS 'B' AND processing_status IS 'access_pass' AND source_task IS 'WCD-10-B07' AND public_content_scope IS 'Research-only candidate; no Curation admission or public release.' AND local_asset_status IS 'remote_only' AND persistent_id IS '' AND canonical_url IS 'https://www.cervantesvirtual.com/portales/adolfo_bioy_casares/su_obra_bibliografia/')) THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0512' AND (source_id IS 'SRC-0512' AND temporary_id IS 'WCD10-B07-S140' AND title IS 'Biografía de Adolfo Bioy Casares' AND original_title IS 'Biografía de Adolfo Bioy Casares' AND author_or_editor IS 'Carlos Dámaso Martínez' AND translator IS '' AND publisher IS 'Biblioteca Virtual Miguel de Cervantes' AND publication_year IS '' AND isbn IS '' AND format IS 'web_page' AND page_count IS '' AND language IS 'es' AND source_level IS 'B' AND processing_status IS 'access_pass' AND source_task IS 'WCD-10-B07' AND public_content_scope IS 'Research-only candidate; no Curation admission or public release.' AND local_asset_status IS 'remote_only' AND persistent_id IS '' AND canonical_url IS 'https://www.cervantesvirtual.com/portales/adolfo_bioy_casares/autor_apunte/')) THEN 1 ELSE 0 END);
INSERT INTO wcd10_guard VALUES (CASE WHEN EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0519' AND (source_id IS 'SRC-0519' AND temporary_id IS 'WCD10-B07-S147' AND title IS 'Los que aman, odian' AND original_title IS 'Los que aman, odian' AND author_or_editor IS 'Silvina Ocampo; Adolfo Bioy Casares' AND translator IS '' AND publisher IS 'Emecé Editores' AND publication_year IS '' AND isbn IS '' AND format IS 'publisher_press_sheet_pdf' AND page_count IS '' AND language IS 'es' AND source_level IS 'B' AND processing_status IS 'access_pass' AND source_task IS 'WCD-10-B07' AND public_content_scope IS 'Research-only candidate; no Curation admission or public release.' AND local_asset_status IS 'remote_only' AND persistent_id IS '' AND canonical_url IS 'https://proapi.planetadelibros.com.ar/descargas/sala-prensa-libro/sinopsis-y-biografia/219757/los-que-aman-odian.pdf?_locale=ar')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0725','WCD10-B14-S001','Varamo — Editorial Anagrama','Varamo — Editorial Anagrama','Editorial Anagrama','','Editorial Anagrama','2002','','publisher_book_page','','es','B','access_pass','WCD-10-B14','Research candidates only; no automatic Curation or public admission. Original author scopes retained under author_policies.','remote_only','','https://www.anagrama-ed.es/libro/narrativas-hispanicas/varamo/9788433924995/NH_328'),
('SRC-0726','WCD10-B14-S002','How I Became a Nun — New Directions Publishing','How I Became a Nun — New Directions Publishing','New Directions Publishing','','New Directions Publishing','2008','','publisher_book_page','','en','B','access_pass','WCD-10-B14','Research candidates only; no automatic Curation or public admission. Original author scopes retained under author_policies.','remote_only','','https://www.ndbooks.com/book/how-i-became-a-nun/'),
('SRC-0727','WCD10-B14-S003','Un episodio en la vida del pintor viajero — Penguin Libros','Un episodio en la vida del pintor viajero — Penguin Libros','Penguin Random House Grupo Editorial','','Penguin Random House Grupo Editorial','2005','','publisher_book_page','','es','B','access_pass','WCD-10-B14','Research candidates only; no automatic Curation or public admission. Original author scopes retained under author_policies.','remote_only','','https://www.penguinlibros.com/es/literatura-contemporanea/28960-libro-un-episodio-en-la-vida-del-pintor-viajero-9788439711919'),
('SRC-0728','WCD10-B14-S101','Manuel Puig: pop, melodrama y literatura de vanguardia','Manuel Puig: pop, melodrama y literatura de vanguardia','Secretaría de Cultura de la Nación Argentina','','Argentina.gob.ar / Secretaría de Cultura','2022','','government_cultural_institution_web_article','','es','B','access_pass','WCD-10-B14','Research candidates only; no automatic Curation or public admission. Original author scopes retained under author_policies.','remote_only','','https://www.argentina.gob.ar/node/294856'),
('SRC-0729','WCD10-B14-S102','El beso de la mujer araña — PlanetadeLibros','El beso de la mujer araña — PlanetadeLibros','Editorial Planeta','','Grupo Planeta','','','publisher_author_bibliography','','es','B','access_pass','WCD-10-B14','Research candidates only; no automatic Curation or public admission. Original author scopes retained under author_policies.','remote_only','','https://www.planetadelibros.com.ar/libro-el-beso-de-la-mujer-arana/374416'),
('SRC-0730','WCD10-B14-S103','The Buenos Aires Affair (NE) — Manuel Puig | PlanetadeLibros','The Buenos Aires Affair (NE) — Manuel Puig | PlanetadeLibros','Editorial Planeta','','Grupo Planeta','','','publisher_work_page','','es','B','access_pass','WCD-10-B14','Research candidates only; no automatic Curation or public admission. Original author scopes retained under author_policies.','remote_only','','https://www.planetadelibros.com.ar/libro-the-buenos-aires-affair-ne/354236'),
('SRC-0731','WCD10-B14-S104','Maldición eterna a quien lea estas páginas (NE) — Manuel Puig | PlanetadeLibros','Maldición eterna a quien lea estas páginas (NE) — Manuel Puig | PlanetadeLibros','Editorial Planeta','','Grupo Planeta','','','publisher_work_page','','es','B','access_pass','WCD-10-B14','Research candidates only; no automatic Curation or public admission. Original author scopes retained under author_policies.','remote_only','','https://www.planetadelibros.com.ar/libro-maldicion-eterna-a-quien-lea-estas-paginas-ne/362422'),
('SRC-0732','WCD10-B14-S105','Cae la noche tropical — Manuel Puig | PlanetadeLibros','Cae la noche tropical — Manuel Puig | PlanetadeLibros','Editorial Planeta','','Grupo Planeta','','','publisher_work_page','','es','B','access_pass','WCD-10-B14','Research candidates only; no automatic Curation or public admission. Original author scopes retained under author_policies.','remote_only','','https://www.planetadelibros.com.ar/libro-cae-la-noche-tropical/133554'),
('SRC-0733','WCD10-B14-S203','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame','Hesburgh Libraries, University of Notre Dame','','University of Notre Dame','','','university_special_collections_web_page','','en','B','access_pass','WCD-10-B14','Research candidates only; no automatic Curation or public admission. Original author scopes retained under author_policies.','remote_only','','https://rarebooks.library.nd.edu/collections/latin_american/south_american/southern_cone_lit/ocampo_s.html');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0685','work','《瓦拉莫》','Varamo','candidate','1','WCD10-B14-W001','出版社直接列出作者、作品，并提供版本书目与内容简介；补入主要作品目录中未链接的作品。; 工作译名用于检索，原题为身份锚点，不声称正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0686','work','《我如何成为修女》','Cómo me hice monja','candidate','1','WCD10-B14-W002','出版社直接列出作者、作品，并提供版本书目与内容简介；补入主要作品目录中未链接的作品。; 工作译名用于检索，原题为身份锚点，不声称正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0687','work','《旅行画家生涯中的一段插曲》','Un episodio en la vida del pintor viajero','candidate','1','WCD10-B14-W003','出版社直接列出作者、作品，并提供版本书目与内容简介；补入主要作品目录中未链接的作品。; 工作译名用于检索，原题为身份锚点，不声称正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0688','work','《布宜诺斯艾利斯事件》','The Buenos Aires Affair','candidate','1','WCD10-B14-W101','DEC-070范围内的直接来源基础书目候选。; 工作中文译名，原题为身份锚点，不声称正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0689','work','《天使耻骨》','Pubis angelical','candidate','1','WCD10-B14-W102','DEC-070范围内的直接来源基础书目候选。; 工作中文译名，原题为身份锚点，不声称正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0690','work','《读此页者永受诅咒》','Maldición eterna a quien lea estas páginas','candidate','1','WCD10-B14-W103','DEC-070范围内的直接来源基础书目候选。; 工作中文译名，原题为身份锚点，不声称正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0691','work','《相互回应的爱情之血》','Sangre de amor correspondido','candidate','1','WCD10-B14-W104','DEC-070范围内的直接来源基础书目候选。; 工作中文译名，原题为身份锚点，不声称正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0692','work','《热带夜幕降临》','Cae la noche tropical','candidate','1','WCD10-B14-W105','DEC-070范围内的直接来源基础书目候选。; 工作中文译名，原题为身份锚点，不声称正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0693','collection','《艾琳的自传》','Autobiografía de Irene','candidate','1','WCD10-B14-W201','Ocampo冻结基线仅收录三部早期故事集；Educ.ar作者作品目录还直接列出该题名，按作品/合集对象增补，限定书目层级。; 沿用现有中文题名译法；来源未给中文题名时仅作工作候选。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0694','collection','《夜晚的日子》','Los días de la noche','candidate','1','WCD10-B14-W202','Ocampo冻结基线仅收录三部早期故事集；Educ.ar作者作品目录还直接列出该题名，按作品/合集对象增补，限定书目层级。; 沿用现有中文题名译法；来源未给中文题名时仅作工作候选。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0695','collection','《如此等等》','Y así sucesivamente','candidate','1','WCD10-B14-W203','Ocampo冻结基线仅收录三部早期故事集；Educ.ar作者作品目录还直接列出该题名，按作品/合集对象增补，限定书目层级。; 沿用现有中文题名译法；来源未给中文题名时仅作工作候选。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0696','collection','《科内莉亚面对镜子》','Cornelia frente al espejo','candidate','1','WCD10-B14-W204','Ocampo冻结基线仅收录三部早期故事集；Educ.ar作者作品目录还直接列出该题名，按作品/合集对象增补，限定书目层级。; 沿用现有中文题名译法；来源未给中文题名时仅作工作候选。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0697','collection','《祖国列举》','Enumeración de la patria','candidate','1','WCD10-B14-W205','Ocampo冻结基线仅收录三部早期故事集；Educ.ar作者作品目录还直接列出该题名，按作品/合集对象增补，限定书目层级。; 沿用现有中文题名译法；来源未给中文题名时仅作工作候选。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0698','collection','《格律空间》','Espacios métricos','candidate','1','WCD10-B14-W206','Ocampo冻结基线仅收录三部早期故事集；Educ.ar作者作品目录还直接列出该题名，按作品/合集对象增补，限定书目层级。; 沿用现有中文题名译法；来源未给中文题名时仅作工作候选。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0681','WCD10-B14-W001','WCD-10-B14','WCD10-B14-W001','V1-ENT-0685','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0682','WCD10-B14-W002','WCD-10-B14','WCD10-B14-W002','V1-ENT-0686','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0683','WCD10-B14-W003','WCD-10-B14','WCD10-B14-W003','V1-ENT-0687','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0684','WCD10-B14-W101','WCD-10-B14','WCD10-B14-W101','V1-ENT-0688','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0685','WCD10-B14-W102','WCD-10-B14','WCD10-B14-W102','V1-ENT-0689','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0686','WCD10-B14-W103','WCD-10-B14','WCD10-B14-W103','V1-ENT-0690','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0687','WCD10-B14-W104','WCD-10-B14','WCD10-B14-W104','V1-ENT-0691','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0688','WCD10-B14-W105','WCD-10-B14','WCD10-B14-W105','V1-ENT-0692','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0689','WCD10-B14-W201','WCD-10-B14','WCD10-B14-W201','V1-ENT-0693','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0690','WCD10-B14-W202','WCD-10-B14','WCD10-B14-W202','V1-ENT-0694','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0691','WCD10-B14-W203','WCD-10-B14','WCD10-B14-W203','V1-ENT-0695','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0692','WCD10-B14-W204','WCD-10-B14','WCD10-B14-W204','V1-ENT-0696','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0693','WCD10-B14-W205','WCD-10-B14','WCD10-B14-W205','V1-ENT-0697','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0694','WCD10-B14-W206','WCD-10-B14','WCD10-B14-W206','V1-ENT-0698','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0673','WCD-10-B14:V1-ENT-0685','V1-ENT-0685','work','《瓦拉莫》','塞萨尔·艾拉','Varamo','阿根廷','es','','中篇小说（nouvelle）','WCD-10-B14','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《瓦拉莫》｜Varamo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：中篇小说（nouvelle）
- one_sentence_summary：作品围绕巴拿马低级公务员瓦拉莫展开：他在领薪后经历一连串日常琐事，随后写出一部后来被称为中美洲现代诗歌杰作的作品。
- bibliographic_note：Editorial Anagrama作品页将2002-02-01列为该版出版日期；此处作为出版社版本书目日期记录，不推定首版年份。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0674','WCD-10-B14:V1-ENT-0686','V1-ENT-0686','work','《我如何成为修女》','塞萨尔·艾拉','Cómo me hice monja','阿根廷','es','','小说','WCD-10-B14','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《我如何成为修女》｜Cómo me hice monja

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：作品以第一人称讲述一个六岁儿童的成长经历，叙述在记忆、现实与虚构之间展开。
- bibliographic_note：New Directions出版社的独立作品页将此作作为单独书名出版，记录该英文版平装本出版于2008年2月1日；此为译本版本日期，不推定西语首版年份。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0675','WCD-10-B14:V1-ENT-0687','V1-ENT-0687','work','《旅行画家生涯中的一段插曲》','塞萨尔·艾拉','Un episodio en la vida del pintor viajero','阿根廷','es','','小说','WCD-10-B14','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《旅行画家生涯中的一段插曲》｜Un episodio en la vida del pintor viajero

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：作品以旅行画家约翰·莫里茨·鲁根达斯为中心，描写他第二次美洲之行中从门多萨继续穿越潘帕斯平原的经历；这段旅程重塑其身体、视觉与人生。
- bibliographic_note：Penguin页面将本ISBN版本标为2005年6月；记录为出版社版本日期，不推定作品首发年。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0676','WCD-10-B14:V1-ENT-0688','V1-ENT-0688','work','《布宜诺斯艾利斯事件》','曼努埃尔·普伊格','The Buenos Aires Affair','阿根廷','es','1973','小说','WCD-10-B14','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《布宜诺斯艾利斯事件》｜The Buenos Aires Affair

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1973
- genre_or_form：小说
- one_sentence_summary：出版社简介将小说置于1930至1969年间，以Leo Druscovich生命最后两天及一系列失踪、误导线索和性执念之谜为叙事线索。
- bibliographic_note：阿根廷文化部记载作品于1973年出版并遭查禁；出版社简介支持此处有限情节概述。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0677','WCD-10-B14:V1-ENT-0689','V1-ENT-0689','work','《天使耻骨》','曼努埃尔·普伊格','Pubis angelical','阿根廷','es','1979','小说','WCD-10-B14','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《天使耻骨》｜Pubis angelical

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1979
- genre_or_form：小说
- one_sentence_summary：小说以住院的安娜及其情感经历为线索，联系阿根廷20世纪60至70年代生活；阿根廷文化部提供这一简要内容说明。
- bibliographic_note：阿根廷文化部机构文章记载《Pubis angelical》于1979年出版并列为普伊格作品；出版社作者书目列有该书。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0678','WCD-10-B14:V1-ENT-0690','V1-ENT-0690','work','《读此页者永受诅咒》','曼努埃尔·普伊格','Maldición eterna a quien lea estas páginas','阿根廷','es','1980','小说','WCD-10-B14','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《读此页者永受诅咒》｜Maldición eterna a quien lea estas páginas

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1980
- genre_or_form：小说
- one_sentence_summary：出版社简介写一名阿根廷病人与美国看护者在纽约相遇，两人的孤独与对缺席女性的记忆构成关系主线。
- bibliographic_note：出版社作者书目记载作品于1980年出版；该书页面支持此处有限情节概述。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0679','WCD-10-B14:V1-ENT-0691','V1-ENT-0691','work','《相互回应的爱情之血》','曼努埃尔·普伊格','Sangre de amor correspondido','阿根廷','es','1982','小说','WCD-10-B14','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《相互回应的爱情之血》｜Sangre de amor correspondido

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1982
- genre_or_form：小说
- one_sentence_summary：小说以巴西小镇为背景，讲述少女Maria da Gloria及其家庭经历；阿根廷文化部提供该书的概要。
- bibliographic_note：阿根廷文化部机构文章记载《Sangre de amor correspondido》于1982年出版并列为普伊格作品；出版社作者书目列有该书。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0680','WCD-10-B14:V1-ENT-0692','V1-ENT-0692','work','《热带夜幕降临》','曼努埃尔·普伊格','Cae la noche tropical','阿根廷','es','1988','小说','WCD-10-B14','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《热带夜幕降临》｜Cae la noche tropical

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1988
- genre_or_form：小说
- one_sentence_summary：出版社简介以里约热内卢为背景，写两位年长的阿根廷姐妹谈及一位年轻流亡邻居的情感经历，并以交谈和闲谈呈现故事。
- bibliographic_note：阿根廷文化部与出版社书目均列作品及1988年；出版社作品页面支持此处有限情节概述。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0681','WCD-10-B14:V1-ENT-0693','V1-ENT-0693','collection','《艾琳的自传》','西尔维娜·奥坎波','Autobiografía de Irene','阿根廷','es','','短篇小说集','WCD-10-B14','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《艾琳的自传》｜Autobiografía de Irene

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- one_sentence_summary：Notre Dame特藏馆确认该对象为短篇故事集；目录将出版年分别列作1946和1948，冲突保留，不填首发年。
- bibliographic_note：Educ.ar条目将Autobiografía de Irene置于1946，阿根廷文化部与Notre Dame特藏图书馆列其为1948；大学图书馆确认这是1948短篇集初版。不同机构年份冲突保留，首发年份原子值留空。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0682','WCD-10-B14:V1-ENT-0694','V1-ENT-0694','collection','《夜晚的日子》','西尔维娜·奥坎波','Los días de la noche','阿根廷','es','1970','短篇小说集','WCD-10-B14','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《夜晚的日子》｜Los días de la noche

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- first_publication_year：1970
- one_sentence_summary：Notre Dame特藏馆将其列为1970年出版的短篇故事集。
- bibliographic_note：Educ.ar列该题名；Notre Dame特藏馆将其列作短篇集并记录1970首版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0683','WCD-10-B14:V1-ENT-0695','V1-ENT-0695','collection','《如此等等》','西尔维娜·奥坎波','Y así sucesivamente','阿根廷','es','1987','短篇小说集','WCD-10-B14','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《如此等等》｜Y así sucesivamente

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- first_publication_year：1987
- one_sentence_summary：Educ.ar列为1987年作品；以机构列示的题名和年份作有限书目记录。
- bibliographic_note：Educ.ar在作者作品目录列出《如此等等》（Y así sucesivamente）及1987；此候选不推断版本或作品全集地位。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0684','WCD-10-B14:V1-ENT-0696','V1-ENT-0696','collection','《科内莉亚面对镜子》','西尔维娜·奥坎波','Cornelia frente al espejo','阿根廷','es','1988','短篇小说集','WCD-10-B14','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《科内莉亚面对镜子》｜Cornelia frente al espejo

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- first_publication_year：1988
- one_sentence_summary：Educ.ar列为1988年作品；本描述限于书目和作品形态。
- bibliographic_note：Educ.ar在作者作品目录列出《科内莉亚面对镜子》（Cornelia frente al espejo）及1988；此候选不推断版本或作品全集地位。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0685','WCD-10-B14:V1-ENT-0697','V1-ENT-0697','collection','《祖国列举》','西尔维娜·奥坎波','Enumeración de la patria','阿根廷','es','1942','诗集','WCD-10-B14','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《祖国列举》｜Enumeración de la patria

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗集
- first_publication_year：1942
- one_sentence_summary：Educ.ar诗歌作品目录列出该题名和1942年。
- bibliographic_note：Educ.ar在作者作品目录列出《祖国列举》（Enumeración de la patria）及1942；此候选不推断版本或作品全集地位。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0686','WCD-10-B14:V1-ENT-0698','V1-ENT-0698','collection','《格律空间》','西尔维娜·奥坎波','Espacios métricos','阿根廷','es','','诗集','WCD-10-B14','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《格律空间》｜Espacios métricos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗集
- one_sentence_summary：Educ.ar列1942，文化部与Notre Dame特藏图书馆列1945；冲突保留，不填原子首发年。
- bibliographic_note：Educ.ar目录列《Espacios métricos》为1942，文化部与Notre Dame特藏图书馆列为1945；大学特藏记为1945首版。冲突保留，首发年份原子值留空。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-2281','WCD10-B14-W001-F01','V1-CARD-0673','V1-ENT-0685','genre_or_form','中篇小说（nouvelle）','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2282','WCD10-B14-W001-F02','V1-CARD-0673','V1-ENT-0685','one_sentence_summary','作品围绕巴拿马低级公务员瓦拉莫展开：他在领薪后经历一连串日常琐事，随后写出一部后来被称为中美洲现代诗歌杰作的作品。','institutional_paraphrase','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2283','WCD10-B14-W001-F03','V1-CARD-0673','V1-ENT-0685','bibliographic_note','Editorial Anagrama作品页将2002-02-01列为该版出版日期；此处作为出版社版本书目日期记录，不推定首版年份。','bibliographic_note','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2284','WCD10-B14-W002-F01','V1-CARD-0674','V1-ENT-0686','genre_or_form','小说','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2285','WCD10-B14-W002-F02','V1-CARD-0674','V1-ENT-0686','one_sentence_summary','作品以第一人称讲述一个六岁儿童的成长经历，叙述在记忆、现实与虚构之间展开。','institutional_paraphrase','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2286','WCD10-B14-W002-F03','V1-CARD-0674','V1-ENT-0686','bibliographic_note','New Directions出版社的独立作品页将此作作为单独书名出版，记录该英文版平装本出版于2008年2月1日；此为译本版本日期，不推定西语首版年份。','bibliographic_note','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2287','WCD10-B14-W003-F01','V1-CARD-0675','V1-ENT-0687','genre_or_form','小说','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2288','WCD10-B14-W003-F02','V1-CARD-0675','V1-ENT-0687','one_sentence_summary','作品以旅行画家约翰·莫里茨·鲁根达斯为中心，描写他第二次美洲之行中从门多萨继续穿越潘帕斯平原的经历；这段旅程重塑其身体、视觉与人生。','institutional_paraphrase','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2289','WCD10-B14-W003-F03','V1-CARD-0675','V1-ENT-0687','bibliographic_note','Penguin页面将本ISBN版本标为2005年6月；记录为出版社版本日期，不推定作品首发年。','bibliographic_note','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2290','WCD10-B14-W101-F01','V1-CARD-0676','V1-ENT-0688','first_publication_year','1973','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2291','WCD10-B14-W101-F02','V1-CARD-0676','V1-ENT-0688','genre_or_form','小说','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2292','WCD10-B14-W101-F03','V1-CARD-0676','V1-ENT-0688','one_sentence_summary','出版社简介将小说置于1930至1969年间，以Leo Druscovich生命最后两天及一系列失踪、误导线索和性执念之谜为叙事线索。','institutional_paraphrase','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2293','WCD10-B14-W101-F04','V1-CARD-0676','V1-ENT-0688','bibliographic_note','阿根廷文化部记载作品于1973年出版并遭查禁；出版社简介支持此处有限情节概述。','bibliographic_note','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2294','WCD10-B14-W102-F01','V1-CARD-0677','V1-ENT-0689','first_publication_year','1979','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2295','WCD10-B14-W102-F02','V1-CARD-0677','V1-ENT-0689','genre_or_form','小说','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2296','WCD10-B14-W102-F03','V1-CARD-0677','V1-ENT-0689','one_sentence_summary','小说以住院的安娜及其情感经历为线索，联系阿根廷20世纪60至70年代生活；阿根廷文化部提供这一简要内容说明。','institutional_paraphrase','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2297','WCD10-B14-W102-F04','V1-CARD-0677','V1-ENT-0689','bibliographic_note','阿根廷文化部机构文章记载《Pubis angelical》于1979年出版并列为普伊格作品；出版社作者书目列有该书。','bibliographic_note','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2298','WCD10-B14-W103-F01','V1-CARD-0678','V1-ENT-0690','first_publication_year','1980','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2299','WCD10-B14-W103-F02','V1-CARD-0678','V1-ENT-0690','genre_or_form','小说','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2300','WCD10-B14-W103-F03','V1-CARD-0678','V1-ENT-0690','one_sentence_summary','出版社简介写一名阿根廷病人与美国看护者在纽约相遇，两人的孤独与对缺席女性的记忆构成关系主线。','institutional_paraphrase','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2301','WCD10-B14-W103-F04','V1-CARD-0678','V1-ENT-0690','bibliographic_note','出版社作者书目记载作品于1980年出版；该书页面支持此处有限情节概述。','bibliographic_note','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2302','WCD10-B14-W104-F01','V1-CARD-0679','V1-ENT-0691','first_publication_year','1982','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2303','WCD10-B14-W104-F02','V1-CARD-0679','V1-ENT-0691','genre_or_form','小说','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2304','WCD10-B14-W104-F03','V1-CARD-0679','V1-ENT-0691','one_sentence_summary','小说以巴西小镇为背景，讲述少女Maria da Gloria及其家庭经历；阿根廷文化部提供该书的概要。','institutional_paraphrase','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2305','WCD10-B14-W104-F04','V1-CARD-0679','V1-ENT-0691','bibliographic_note','阿根廷文化部机构文章记载《Sangre de amor correspondido》于1982年出版并列为普伊格作品；出版社作者书目列有该书。','bibliographic_note','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2306','WCD10-B14-W105-F01','V1-CARD-0680','V1-ENT-0692','first_publication_year','1988','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2307','WCD10-B14-W105-F02','V1-CARD-0680','V1-ENT-0692','genre_or_form','小说','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2308','WCD10-B14-W105-F03','V1-CARD-0680','V1-ENT-0692','one_sentence_summary','出版社简介以里约热内卢为背景，写两位年长的阿根廷姐妹谈及一位年轻流亡邻居的情感经历，并以交谈和闲谈呈现故事。','institutional_paraphrase','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2309','WCD10-B14-W105-F04','V1-CARD-0680','V1-ENT-0692','bibliographic_note','阿根廷文化部与出版社书目均列作品及1988年；出版社作品页面支持此处有限情节概述。','bibliographic_note','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2310','WCD10-B14-W201-F01','V1-CARD-0681','V1-ENT-0693','genre_or_form','短篇小说集','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2311','WCD10-B14-W201-F02','V1-CARD-0681','V1-ENT-0693','one_sentence_summary','Notre Dame特藏馆确认该对象为短篇故事集；目录将出版年分别列作1946和1948，冲突保留，不填首发年。','institutional_paraphrase','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2312','WCD10-B14-W201-F03','V1-CARD-0681','V1-ENT-0693','bibliographic_note','Educ.ar条目将Autobiografía de Irene置于1946，阿根廷文化部与Notre Dame特藏图书馆列其为1948；大学图书馆确认这是1948短篇集初版。不同机构年份冲突保留，首发年份原子值留空。','bibliographic_note','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2313','WCD10-B14-W202-F01','V1-CARD-0682','V1-ENT-0694','genre_or_form','短篇小说集','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2314','WCD10-B14-W202-F02','V1-CARD-0682','V1-ENT-0694','first_publication_year','1970','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2315','WCD10-B14-W202-F03','V1-CARD-0682','V1-ENT-0694','one_sentence_summary','Notre Dame特藏馆将其列为1970年出版的短篇故事集。','institutional_paraphrase','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2316','WCD10-B14-W202-F04','V1-CARD-0682','V1-ENT-0694','bibliographic_note','Educ.ar列该题名；Notre Dame特藏馆将其列作短篇集并记录1970首版。','bibliographic_note','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2317','WCD10-B14-W203-F01','V1-CARD-0683','V1-ENT-0695','genre_or_form','短篇小说集','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2318','WCD10-B14-W203-F02','V1-CARD-0683','V1-ENT-0695','first_publication_year','1987','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2319','WCD10-B14-W203-F03','V1-CARD-0683','V1-ENT-0695','one_sentence_summary','Educ.ar列为1987年作品；以机构列示的题名和年份作有限书目记录。','institutional_paraphrase','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2320','WCD10-B14-W203-F04','V1-CARD-0683','V1-ENT-0695','bibliographic_note','Educ.ar在作者作品目录列出《如此等等》（Y así sucesivamente）及1987；此候选不推断版本或作品全集地位。','bibliographic_note','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2321','WCD10-B14-W204-F01','V1-CARD-0684','V1-ENT-0696','genre_or_form','短篇小说集','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2322','WCD10-B14-W204-F02','V1-CARD-0684','V1-ENT-0696','first_publication_year','1988','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2323','WCD10-B14-W204-F03','V1-CARD-0684','V1-ENT-0696','one_sentence_summary','Educ.ar列为1988年作品；本描述限于书目和作品形态。','institutional_paraphrase','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2324','WCD10-B14-W204-F04','V1-CARD-0684','V1-ENT-0696','bibliographic_note','Educ.ar在作者作品目录列出《科内莉亚面对镜子》（Cornelia frente al espejo）及1988；此候选不推断版本或作品全集地位。','bibliographic_note','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2325','WCD10-B14-W205-F01','V1-CARD-0685','V1-ENT-0697','genre_or_form','诗集','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2326','WCD10-B14-W205-F02','V1-CARD-0685','V1-ENT-0697','first_publication_year','1942','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2327','WCD10-B14-W205-F03','V1-CARD-0685','V1-ENT-0697','one_sentence_summary','Educ.ar诗歌作品目录列出该题名和1942年。','institutional_paraphrase','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2328','WCD10-B14-W205-F04','V1-CARD-0685','V1-ENT-0697','bibliographic_note','Educ.ar在作者作品目录列出《祖国列举》（Enumeración de la patria）及1942；此候选不推断版本或作品全集地位。','bibliographic_note','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2329','WCD10-B14-W206-F01','V1-CARD-0686','V1-ENT-0698','genre_or_form','诗集','bibliographic','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2330','WCD10-B14-W206-F02','V1-CARD-0686','V1-ENT-0698','one_sentence_summary','Educ.ar列1942，文化部与Notre Dame特藏图书馆列1945；冲突保留，不填原子首发年。','institutional_paraphrase','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2331','WCD10-B14-W206-F03','V1-CARD-0686','V1-ENT-0698','bibliographic_note','Educ.ar目录列《Espacios métricos》为1942，文化部与Notre Dame特藏图书馆列为1945；大学特藏记为1945首版。冲突保留，首发年份原子值留空。','bibliographic_note','WCD-10-B14','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-2281','SRC-0725','Varamo — Editorial Anagrama'),
('V1-FCT-2282','SRC-0725','Varamo — Editorial Anagrama'),
('V1-FCT-2283','SRC-0725','Varamo — Editorial Anagrama'),
('V1-FCT-2284','SRC-0726','How I Became a Nun — New Directions Publishing'),
('V1-FCT-2285','SRC-0726','How I Became a Nun — New Directions Publishing'),
('V1-FCT-2286','SRC-0726','How I Became a Nun — New Directions Publishing'),
('V1-FCT-2287','SRC-0727','Un episodio en la vida del pintor viajero — Penguin Libros'),
('V1-FCT-2288','SRC-0727','Un episodio en la vida del pintor viajero — Penguin Libros'),
('V1-FCT-2289','SRC-0727','Un episodio en la vida del pintor viajero — Penguin Libros'),
('V1-FCT-2290','SRC-0728','Manuel Puig: pop, melodrama y literatura de vanguardia'),
('V1-FCT-2291','SRC-0730','The Buenos Aires Affair (NE) — Manuel Puig | PlanetadeLibros'),
('V1-FCT-2292','SRC-0730','The Buenos Aires Affair (NE) — Manuel Puig | PlanetadeLibros'),
('V1-FCT-2293','SRC-0728','Manuel Puig: pop, melodrama y literatura de vanguardia'),
('V1-FCT-2293','SRC-0730','The Buenos Aires Affair (NE) — Manuel Puig | PlanetadeLibros'),
('V1-FCT-2294','SRC-0728','Manuel Puig: pop, melodrama y literatura de vanguardia'),
('V1-FCT-2295','SRC-0728','Manuel Puig: pop, melodrama y literatura de vanguardia'),
('V1-FCT-2296','SRC-0728','Manuel Puig: pop, melodrama y literatura de vanguardia'),
('V1-FCT-2297','SRC-0728','Manuel Puig: pop, melodrama y literatura de vanguardia'),
('V1-FCT-2298','SRC-0729','El beso de la mujer araña — PlanetadeLibros'),
('V1-FCT-2299','SRC-0731','Maldición eterna a quien lea estas páginas (NE) — Manuel Puig | PlanetadeLibros'),
('V1-FCT-2300','SRC-0731','Maldición eterna a quien lea estas páginas (NE) — Manuel Puig | PlanetadeLibros'),
('V1-FCT-2301','SRC-0729','El beso de la mujer araña — PlanetadeLibros'),
('V1-FCT-2301','SRC-0731','Maldición eterna a quien lea estas páginas (NE) — Manuel Puig | PlanetadeLibros'),
('V1-FCT-2302','SRC-0728','Manuel Puig: pop, melodrama y literatura de vanguardia'),
('V1-FCT-2303','SRC-0728','Manuel Puig: pop, melodrama y literatura de vanguardia'),
('V1-FCT-2304','SRC-0728','Manuel Puig: pop, melodrama y literatura de vanguardia'),
('V1-FCT-2305','SRC-0728','Manuel Puig: pop, melodrama y literatura de vanguardia'),
('V1-FCT-2306','SRC-0728','Manuel Puig: pop, melodrama y literatura de vanguardia'),
('V1-FCT-2307','SRC-0732','Cae la noche tropical — Manuel Puig | PlanetadeLibros'),
('V1-FCT-2308','SRC-0732','Cae la noche tropical — Manuel Puig | PlanetadeLibros'),
('V1-FCT-2309','SRC-0728','Manuel Puig: pop, melodrama y literatura de vanguardia'),
('V1-FCT-2309','SRC-0732','Cae la noche tropical — Manuel Puig | PlanetadeLibros'),
('V1-FCT-2310','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2310','SRC-0228','Fantástica y misteriosa Silvina — Cultura'),
('V1-FCT-2310','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2311','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2311','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2312','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2312','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2312','SRC-0228','Fantástica y misteriosa Silvina — Cultura'),
('V1-FCT-2313','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2313','SRC-0228','Fantástica y misteriosa Silvina — Cultura'),
('V1-FCT-2313','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2314','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2314','SRC-0228','Fantástica y misteriosa Silvina — Cultura'),
('V1-FCT-2314','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2315','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2315','SRC-0228','Fantástica y misteriosa Silvina — Cultura'),
('V1-FCT-2315','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2316','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2316','SRC-0228','Fantástica y misteriosa Silvina — Cultura'),
('V1-FCT-2316','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2317','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2317','SRC-0228','Fantástica y misteriosa Silvina — Cultura'),
('V1-FCT-2317','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2318','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2318','SRC-0228','Fantástica y misteriosa Silvina — Cultura'),
('V1-FCT-2318','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2319','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2319','SRC-0228','Fantástica y misteriosa Silvina — Cultura'),
('V1-FCT-2319','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2320','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2320','SRC-0228','Fantástica y misteriosa Silvina — Cultura'),
('V1-FCT-2320','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2321','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2321','SRC-0228','Fantástica y misteriosa Silvina — Cultura'),
('V1-FCT-2321','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2322','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2322','SRC-0228','Fantástica y misteriosa Silvina — Cultura'),
('V1-FCT-2322','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2323','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2323','SRC-0228','Fantástica y misteriosa Silvina — Cultura'),
('V1-FCT-2323','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2324','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2324','SRC-0228','Fantástica y misteriosa Silvina — Cultura'),
('V1-FCT-2324','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2325','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2325','SRC-0228','Fantástica y misteriosa Silvina — Cultura'),
('V1-FCT-2325','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2326','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2326','SRC-0228','Fantástica y misteriosa Silvina — Cultura'),
('V1-FCT-2326','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2327','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2327','SRC-0228','Fantástica y misteriosa Silvina — Cultura'),
('V1-FCT-2327','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2328','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2328','SRC-0228','Fantástica y misteriosa Silvina — Cultura'),
('V1-FCT-2328','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2329','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2329','SRC-0228','Fantástica y misteriosa Silvina — Cultura'),
('V1-FCT-2329','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2330','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2330','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2331','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar'),
('V1-FCT-2331','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame'),
('V1-FCT-2331','SRC-0228','Fantástica y misteriosa Silvina — Cultura');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0673','V1-FCT-2281','batch_retained_candidate'),
('V1-CARD-0673','V1-FCT-2282','batch_retained_candidate'),
('V1-CARD-0673','V1-FCT-2283','batch_retained_candidate'),
('V1-CARD-0674','V1-FCT-2284','batch_retained_candidate'),
('V1-CARD-0674','V1-FCT-2285','batch_retained_candidate'),
('V1-CARD-0674','V1-FCT-2286','batch_retained_candidate'),
('V1-CARD-0675','V1-FCT-2287','batch_retained_candidate'),
('V1-CARD-0675','V1-FCT-2288','batch_retained_candidate'),
('V1-CARD-0675','V1-FCT-2289','batch_retained_candidate'),
('V1-CARD-0676','V1-FCT-2290','batch_retained_candidate'),
('V1-CARD-0676','V1-FCT-2291','batch_retained_candidate'),
('V1-CARD-0676','V1-FCT-2292','batch_retained_candidate'),
('V1-CARD-0676','V1-FCT-2293','batch_retained_candidate'),
('V1-CARD-0677','V1-FCT-2294','batch_retained_candidate'),
('V1-CARD-0677','V1-FCT-2295','batch_retained_candidate'),
('V1-CARD-0677','V1-FCT-2296','batch_retained_candidate'),
('V1-CARD-0677','V1-FCT-2297','batch_retained_candidate'),
('V1-CARD-0678','V1-FCT-2298','batch_retained_candidate'),
('V1-CARD-0678','V1-FCT-2299','batch_retained_candidate'),
('V1-CARD-0678','V1-FCT-2300','batch_retained_candidate'),
('V1-CARD-0678','V1-FCT-2301','batch_retained_candidate'),
('V1-CARD-0679','V1-FCT-2302','batch_retained_candidate'),
('V1-CARD-0679','V1-FCT-2303','batch_retained_candidate'),
('V1-CARD-0679','V1-FCT-2304','batch_retained_candidate'),
('V1-CARD-0679','V1-FCT-2305','batch_retained_candidate'),
('V1-CARD-0680','V1-FCT-2306','batch_retained_candidate'),
('V1-CARD-0680','V1-FCT-2307','batch_retained_candidate'),
('V1-CARD-0680','V1-FCT-2308','batch_retained_candidate'),
('V1-CARD-0680','V1-FCT-2309','batch_retained_candidate'),
('V1-CARD-0681','V1-FCT-2310','batch_retained_candidate'),
('V1-CARD-0681','V1-FCT-2311','batch_retained_candidate'),
('V1-CARD-0681','V1-FCT-2312','batch_retained_candidate'),
('V1-CARD-0682','V1-FCT-2313','batch_retained_candidate'),
('V1-CARD-0682','V1-FCT-2314','batch_retained_candidate'),
('V1-CARD-0682','V1-FCT-2315','batch_retained_candidate'),
('V1-CARD-0682','V1-FCT-2316','batch_retained_candidate'),
('V1-CARD-0683','V1-FCT-2317','batch_retained_candidate'),
('V1-CARD-0683','V1-FCT-2318','batch_retained_candidate'),
('V1-CARD-0683','V1-FCT-2319','batch_retained_candidate'),
('V1-CARD-0683','V1-FCT-2320','batch_retained_candidate'),
('V1-CARD-0684','V1-FCT-2321','batch_retained_candidate'),
('V1-CARD-0684','V1-FCT-2322','batch_retained_candidate'),
('V1-CARD-0684','V1-FCT-2323','batch_retained_candidate'),
('V1-CARD-0684','V1-FCT-2324','batch_retained_candidate'),
('V1-CARD-0685','V1-FCT-2325','batch_retained_candidate'),
('V1-CARD-0685','V1-FCT-2326','batch_retained_candidate'),
('V1-CARD-0685','V1-FCT-2327','batch_retained_candidate'),
('V1-CARD-0685','V1-FCT-2328','batch_retained_candidate'),
('V1-CARD-0686','V1-FCT-2329','batch_retained_candidate'),
('V1-CARD-0686','V1-FCT-2330','batch_retained_candidate'),
('V1-CARD-0686','V1-FCT-2331','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-1371','WCD10-B14-S001','V1-CARD-0673','SRC-0725','B','bibliography_or_bounded_description','yes','no','SRC-0725','accepted','NONE'),
('V1-CS-1372','WCD10-B14-S002','V1-CARD-0674','SRC-0726','B','bibliography_or_bounded_description','yes','no','SRC-0726','accepted','NONE'),
('V1-CS-1373','WCD10-B14-S003','V1-CARD-0675','SRC-0727','B','bibliography_or_bounded_description','yes','no','SRC-0727','accepted','NONE'),
('V1-CS-1374','WCD10-B14-S101','V1-CARD-0676','SRC-0728','B','bibliography_or_bounded_description','yes','no','SRC-0728','accepted','NONE'),
('V1-CS-1375','WCD10-B14-S103','V1-CARD-0676','SRC-0730','B','bibliography_or_bounded_description','yes','no','SRC-0730','accepted','NONE'),
('V1-CS-1376','WCD10-B14-S101','V1-CARD-0677','SRC-0728','B','bibliography_or_bounded_description','yes','no','SRC-0728','accepted','NONE'),
('V1-CS-1377','WCD10-B14-S102','V1-CARD-0678','SRC-0729','B','bibliography_or_bounded_description','yes','no','SRC-0729','accepted','NONE'),
('V1-CS-1378','WCD10-B14-S104','V1-CARD-0678','SRC-0731','B','bibliography_or_bounded_description','yes','no','SRC-0731','accepted','NONE'),
('V1-CS-1379','WCD10-B14-S101','V1-CARD-0679','SRC-0728','B','bibliography_or_bounded_description','yes','no','SRC-0728','accepted','NONE'),
('V1-CS-1380','WCD10-B14-S101','V1-CARD-0680','SRC-0728','B','bibliography_or_bounded_description','yes','no','SRC-0728','accepted','NONE'),
('V1-CS-1381','WCD10-B14-S105','V1-CARD-0680','SRC-0732','B','bibliography_or_bounded_description','yes','no','SRC-0732','accepted','NONE'),
('V1-CS-1382','WCD10-B14-S201','V1-CARD-0681','SRC-0227','B','bibliography_or_bounded_description','yes','no','SRC-0227','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1383','WCD10-B14-S202','V1-CARD-0681','SRC-0228','B','bibliography_or_bounded_description','yes','no','SRC-0228','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1384','WCD10-B14-S203','V1-CARD-0681','SRC-0733','B','bibliography_or_bounded_description','yes','no','SRC-0733','accepted','NONE'),
('V1-CS-1385','WCD10-B14-S201','V1-CARD-0682','SRC-0227','B','bibliography_or_bounded_description','yes','no','SRC-0227','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1386','WCD10-B14-S202','V1-CARD-0682','SRC-0228','B','bibliography_or_bounded_description','yes','no','SRC-0228','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1387','WCD10-B14-S203','V1-CARD-0682','SRC-0733','B','bibliography_or_bounded_description','yes','no','SRC-0733','accepted','NONE'),
('V1-CS-1388','WCD10-B14-S201','V1-CARD-0683','SRC-0227','B','bibliography_or_bounded_description','yes','no','SRC-0227','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1389','WCD10-B14-S202','V1-CARD-0683','SRC-0228','B','bibliography_or_bounded_description','yes','no','SRC-0228','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1390','WCD10-B14-S203','V1-CARD-0683','SRC-0733','B','bibliography_or_bounded_description','yes','no','SRC-0733','accepted','NONE'),
('V1-CS-1391','WCD10-B14-S201','V1-CARD-0684','SRC-0227','B','bibliography_or_bounded_description','yes','no','SRC-0227','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1392','WCD10-B14-S202','V1-CARD-0684','SRC-0228','B','bibliography_or_bounded_description','yes','no','SRC-0228','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1393','WCD10-B14-S203','V1-CARD-0684','SRC-0733','B','bibliography_or_bounded_description','yes','no','SRC-0733','accepted','NONE'),
('V1-CS-1394','WCD10-B14-S201','V1-CARD-0685','SRC-0227','B','bibliography_or_bounded_description','yes','no','SRC-0227','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1395','WCD10-B14-S202','V1-CARD-0685','SRC-0228','B','bibliography_or_bounded_description','yes','no','SRC-0228','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1396','WCD10-B14-S203','V1-CARD-0685','SRC-0733','B','bibliography_or_bounded_description','yes','no','SRC-0733','accepted','NONE'),
('V1-CS-1397','WCD10-B14-S201','V1-CARD-0686','SRC-0227','B','bibliography_or_bounded_description','yes','no','SRC-0227','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1398','WCD10-B14-S202','V1-CARD-0686','SRC-0228','B','bibliography_or_bounded_description','yes','no','SRC-0228','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1399','WCD10-B14-S203','V1-CARD-0686','SRC-0733','B','bibliography_or_bounded_description','yes','no','SRC-0733','accepted','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0654','WCD-10-B14','WCD10-B14-W001-CREATED','V1-ENT-0274','CREATED','V1-ENT-0685','塞萨尔·艾拉创作 Varamo','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0655','WCD-10-B14','WCD10-B14-W002-CREATED','V1-ENT-0274','CREATED','V1-ENT-0686','塞萨尔·艾拉创作 Cómo me hice monja','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0656','WCD-10-B14','WCD10-B14-W003-CREATED','V1-ENT-0274','CREATED','V1-ENT-0687','塞萨尔·艾拉创作 Un episodio en la vida del pintor viajero','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0657','WCD-10-B14','WCD10-B14-W101-CREATED','V1-ENT-0284','CREATED','V1-ENT-0688','曼努埃尔·普伊格创作 The Buenos Aires Affair','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0658','WCD-10-B14','WCD10-B14-W102-CREATED','V1-ENT-0284','CREATED','V1-ENT-0689','曼努埃尔·普伊格创作 Pubis angelical','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0659','WCD-10-B14','WCD10-B14-W103-CREATED','V1-ENT-0284','CREATED','V1-ENT-0690','曼努埃尔·普伊格创作 Maldición eterna a quien lea estas páginas','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0660','WCD-10-B14','WCD10-B14-W104-CREATED','V1-ENT-0284','CREATED','V1-ENT-0691','曼努埃尔·普伊格创作 Sangre de amor correspondido','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0661','WCD-10-B14','WCD10-B14-W105-CREATED','V1-ENT-0284','CREATED','V1-ENT-0692','曼努埃尔·普伊格创作 Cae la noche tropical','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0662','WCD-10-B14','WCD10-B14-W201-CREATED','V1-ENT-0285','CREATED','V1-ENT-0693','Notre Dame特藏馆将本书确认列作短篇集；Educ.ar列1946年，大学特藏及政府文化目录列1948年，年份冲突故不填原子首发年。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0663','WCD-10-B14','WCD10-B14-W202-CREATED','V1-ENT-0285','CREATED','V1-ENT-0694','Notre Dame特藏馆将其列为1970年出版的短篇故事集；此候选只登记对象形态和书目年份。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0664','WCD-10-B14','WCD10-B14-W203-CREATED','V1-ENT-0285','CREATED','V1-ENT-0695','Educ.ar列为1987年作品；以机构列示的题名和年份作有限书目记录。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0665','WCD-10-B14','WCD10-B14-W204-CREATED','V1-ENT-0285','CREATED','V1-ENT-0696','Educ.ar列为1988年作品；本描述限于书目和作品形态。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0666','WCD-10-B14','WCD10-B14-W205-CREATED','V1-ENT-0285','CREATED','V1-ENT-0697','Educ.ar诗歌作品目录列出该题名和1942年。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0667','WCD-10-B14','WCD10-B14-W206-CREATED','V1-ENT-0285','CREATED','V1-ENT-0698','该对象为诗集；Educ.ar列1942，文化部与大学特藏图书馆列1945，年份冲突故不填原子首发年。','high','accepted','Codex-parent-independent-review:PASS','2','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0654','SRC-0725'),
('V1-REL-0655','SRC-0726'),
('V1-REL-0656','SRC-0727'),
('V1-REL-0657','SRC-0730'),
('V1-REL-0658','SRC-0728'),
('V1-REL-0659','SRC-0731'),
('V1-REL-0660','SRC-0728'),
('V1-REL-0661','SRC-0732'),
('V1-REL-0662','SRC-0227'),
('V1-REL-0662','SRC-0733'),
('V1-REL-0663','SRC-0227'),
('V1-REL-0663','SRC-0733'),
('V1-REL-0664','SRC-0227'),
('V1-REL-0664','SRC-0733'),
('V1-REL-0665','SRC-0227'),
('V1-REL-0665','SRC-0733'),
('V1-REL-0666','SRC-0227'),
('V1-REL-0666','SRC-0733'),
('V1-REL-0667','SRC-0227'),
('V1-REL-0667','SRC-0733');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0985','V1-REL-0654','WCD10-B14-S001','SRC-0725','Varamo — Editorial Anagrama','实读2026-10-13。Anagrama第480-510行；作品简介及Ficha técnica中的PUBLICACIÓN 01/02/2002。','塞萨尔·艾拉创作 Varamo','high','eligible_evidence','WCD-10-B14'),
('V1-EV-0986','V1-REL-0655','WCD10-B14-S002','SRC-0726','How I Became a Nun — New Directions Publishing','实读2026-10-13。第14-16行书名、作者；第35-39行小说体裁与六岁起叙事；第48-54行英文平装版2008-02-01及ISBN。','塞萨尔·艾拉创作 Cómo me hice monja','high','eligible_evidence','WCD-10-B14'),
('V1-EV-0987','V1-REL-0656','WCD10-B14-S003','SRC-0727','Un episodio en la vida del pintor viajero — Penguin Libros','实读2026-10-13。第348行标示Random House、2005年6月；第370行书名；第476-485行作品简介。','塞萨尔·艾拉创作 Un episodio en la vida del pintor viajero','high','eligible_evidence','WCD-10-B14'),
('V1-EV-0988','V1-REL-0657','WCD10-B14-S103','SRC-0730','The Buenos Aires Affair (NE) — Manuel Puig | PlanetadeLibros','sinopsis网页段落21-23；作者书目段落66-68','曼努埃尔·普伊格创作 The Buenos Aires Affair','high','eligible_evidence','WCD-10-B14'),
('V1-EV-0989','V1-REL-0658','WCD10-B14-S101','SRC-0728','Manuel Puig: pop, melodrama y literatura de vanguardia','网页段落34-37、41-58','曼努埃尔·普伊格创作 Pubis angelical','high','eligible_evidence','WCD-10-B14'),
('V1-EV-0990','V1-REL-0659','WCD10-B14-S104','SRC-0731','Maldición eterna a quien lea estas páginas (NE) — Manuel Puig | PlanetadeLibros','作者书目段落73-77；Novela literaria主题与作品信息段落59-70','曼努埃尔·普伊格创作 Maldición eterna a quien lea estas páginas','high','eligible_evidence','WCD-10-B14'),
('V1-EV-0991','V1-REL-0660','WCD10-B14-S101','SRC-0728','Manuel Puig: pop, melodrama y literatura de vanguardia','网页段落34-37、41-58','曼努埃尔·普伊格创作 Sangre de amor correspondido','high','eligible_evidence','WCD-10-B14'),
('V1-EV-0992','V1-REL-0661','WCD10-B14-S105','SRC-0732','Cae la noche tropical — Manuel Puig | PlanetadeLibros','sinopsis段落19-23；Novela literaria分类段落50-60；作者书目段落63-67','曼努埃尔·普伊格创作 Cae la noche tropical','high','eligible_evidence','WCD-10-B14'),
('V1-EV-0993','V1-REL-0662','WCD10-B14-S201','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar','“Para leer”段落第49-50行：列示作者代表作品/诗集题名与年份；第39-41行提及《被遗忘的旅程》及两部合著/合编作品。实读2026-10-13。','Notre Dame特藏馆将本书确认列作短篇集；Educ.ar列1946年，大学特藏及政府文化目录列1948年，年份冲突故不填原子首发年。','high','eligible_evidence','WCD-10-B14'),
('V1-EV-0994','V1-REL-0662','WCD10-B14-S203','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame','第42-47行列短篇集（含Autobiografía de Irene 1948、Los días de la noche 1970、Y así sucesivamente 1987、Cornelia frente al espejo 1988）；第52-54行列诗集年份（Enumeración de la patria 1942；Espacios métricos 1945）。实读2026-10-13。','Notre Dame特藏馆将本书确认列作短篇集；Educ.ar列1946年，大学特藏及政府文化目录列1948年，年份冲突故不填原子首发年。','high','eligible_evidence','WCD-10-B14'),
('V1-EV-0995','V1-REL-0663','WCD10-B14-S201','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar','“Para leer”段落第49-50行：列示作者代表作品/诗集题名与年份；第39-41行提及《被遗忘的旅程》及两部合著/合编作品。实读2026-10-13。','Notre Dame特藏馆将其列为1970年出版的短篇故事集；此候选只登记对象形态和书目年份。','high','eligible_evidence','WCD-10-B14'),
('V1-EV-0996','V1-REL-0663','WCD10-B14-S203','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame','第42-47行列短篇集（含Autobiografía de Irene 1948、Los días de la noche 1970、Y así sucesivamente 1987、Cornelia frente al espejo 1988）；第52-54行列诗集年份（Enumeración de la patria 1942；Espacios métricos 1945）。实读2026-10-13。','Notre Dame特藏馆将其列为1970年出版的短篇故事集；此候选只登记对象形态和书目年份。','high','eligible_evidence','WCD-10-B14'),
('V1-EV-0997','V1-REL-0664','WCD10-B14-S201','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar','“Para leer”段落第49-50行：列示作者代表作品/诗集题名与年份；第39-41行提及《被遗忘的旅程》及两部合著/合编作品。实读2026-10-13。','Educ.ar列为1987年作品；以机构列示的题名和年份作有限书目记录。','high','eligible_evidence','WCD-10-B14'),
('V1-EV-0998','V1-REL-0664','WCD10-B14-S203','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame','第42-47行列短篇集（含Autobiografía de Irene 1948、Los días de la noche 1970、Y así sucesivamente 1987、Cornelia frente al espejo 1988）；第52-54行列诗集年份（Enumeración de la patria 1942；Espacios métricos 1945）。实读2026-10-13。','Educ.ar列为1987年作品；以机构列示的题名和年份作有限书目记录。','high','eligible_evidence','WCD-10-B14'),
('V1-EV-0999','V1-REL-0665','WCD10-B14-S201','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar','“Para leer”段落第49-50行：列示作者代表作品/诗集题名与年份；第39-41行提及《被遗忘的旅程》及两部合著/合编作品。实读2026-10-13。','Educ.ar列为1988年作品；本描述限于书目和作品形态。','high','eligible_evidence','WCD-10-B14'),
('V1-EV-1000','V1-REL-0665','WCD10-B14-S203','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame','第42-47行列短篇集（含Autobiografía de Irene 1948、Los días de la noche 1970、Y así sucesivamente 1987、Cornelia frente al espejo 1988）；第52-54行列诗集年份（Enumeración de la patria 1942；Espacios métricos 1945）。实读2026-10-13。','Educ.ar列为1988年作品；本描述限于书目和作品形态。','high','eligible_evidence','WCD-10-B14'),
('V1-EV-1001','V1-REL-0666','WCD10-B14-S201','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar','“Para leer”段落第49-50行：列示作者代表作品/诗集题名与年份；第39-41行提及《被遗忘的旅程》及两部合著/合编作品。实读2026-10-13。','Educ.ar诗歌作品目录列出该题名和1942年。','high','eligible_evidence','WCD-10-B14'),
('V1-EV-1002','V1-REL-0666','WCD10-B14-S203','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame','第42-47行列短篇集（含Autobiografía de Irene 1948、Los días de la noche 1970、Y así sucesivamente 1987、Cornelia frente al espejo 1988）；第52-54行列诗集年份（Enumeración de la patria 1942；Espacios métricos 1945）。实读2026-10-13。','Educ.ar诗歌作品目录列出该题名和1942年。','high','eligible_evidence','WCD-10-B14'),
('V1-EV-1003','V1-REL-0667','WCD10-B14-S201','SRC-0227','Silvina Ocampo: el viaje olvidado — Educ.ar','“Para leer”段落第49-50行：列示作者代表作品/诗集题名与年份；第39-41行提及《被遗忘的旅程》及两部合著/合编作品。实读2026-10-13。','该对象为诗集；Educ.ar列1942，文化部与大学特藏图书馆列1945，年份冲突故不填原子首发年。','high','eligible_evidence','WCD-10-B14'),
('V1-EV-1004','V1-REL-0667','WCD10-B14-S203','SRC-0733','Silvina Ocampo — Hesburgh Libraries, University of Notre Dame','第42-47行列短篇集（含Autobiografía de Irene 1948、Los días de la noche 1970、Y así sucesivamente 1987、Cornelia frente al espejo 1988）；第52-54行列诗集年份（Enumeración de la patria 1942；Espacios métricos 1945）。实读2026-10-13。','该对象为诗集；Educ.ar列1942，文化部与大学特藏图书馆列1945，年份冲突故不填原子首发年。','high','eligible_evidence','WCD-10-B14');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0499','WCD-10-B14-G01','research_gap','WCD10:B14:AIRA:remaining-bibliography','open','Anagrama作者页将La liebre列为代表作，但本轮已打开页面未提供该书情节或版本级书目信息；避免由目录列名推断内容与年份。后续需打开具体出版社/图书馆书目页。','','Independent Reviewer: preserve deferred','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0500','WCD-10-B14-G02','research_gap','WCD10:B14:AIRA:El-tilo','open','虽已发现评论文献讨论其出版于2003年及内容，但未核验出版社/图书馆作品专页；本轮暂不把论文二手概述作为获准普通书目来源。','','Independent Reviewer: preserve deferred','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0501','WCD-10-B14:V1-ENT-0281','research_gap','WCD10:work_level_research:V1-ENT-0281','open','未在本轮完成作品全集/学术覆盖审查；仅保留冻结库已链接作品，后续继续查重补证。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0502','WCD-10-B14:V1-ENT-0282','research_gap','WCD10:work_level_research:V1-ENT-0282','open','未在本轮完成作品全集/学术覆盖审查；仅保留冻结库已链接作品，后续继续查重补证。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0503','WCD-10-B14:V1-ENT-0283','research_gap','WCD10:work_level_research:V1-ENT-0283','open','未在本轮完成作品全集/学术覆盖审查；仅保留冻结库已链接作品，后续继续查重补证。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0504','WCD-10-B14:WCD10-B14-W001','research_gap','WCD10:work_level_research:V1-ENT-0685','open','未独立核定作品原始首发年；出版社版本日期单独注明。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0505','WCD-10-B14:WCD10-B14-W002','research_gap','WCD10:work_level_research:V1-ENT-0686','open','未独立核定作品原始首发年；出版社版本日期单独注明。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0506','WCD-10-B14:WCD10-B14-W003','research_gap','WCD10:work_level_research:V1-ENT-0687','open','未独立核定作品原始首发年；出版社版本日期单独注明。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0507','WCD-10-B14:V1-ENT-0287','research_gap','WCD10:work_level_research:V1-ENT-0287','open','本轮未作学术性深入阐释；既有来源和目录信息仅支持基础书目。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0508','WCD-10-B14:V1-ENT-0288','research_gap','WCD10:work_level_research:V1-ENT-0288','open','本轮未作学术性深入阐释；既有来源和目录信息仅支持基础书目。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0509','WCD-10-B14:V1-ENT-0289','research_gap','WCD10:work_level_research:V1-ENT-0289','open','本轮未作学术性深入阐释；既有来源和目录信息仅支持基础书目。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0510','WCD-10-B14:WCD10-B14-W101','research_gap','WCD10:work_level_research:V1-ENT-0688','open','仅为机构书目与有限内容介绍；未声称作品研究覆盖完整。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0511','WCD-10-B14:WCD10-B14-W102','research_gap','WCD10:work_level_research:V1-ENT-0689','open','仅为机构书目与有限内容介绍；未声称作品研究覆盖完整。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0512','WCD-10-B14:WCD10-B14-W103','research_gap','WCD10:work_level_research:V1-ENT-0690','open','仅为机构书目与有限内容介绍；未声称作品研究覆盖完整。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0513','WCD-10-B14:WCD10-B14-W104','research_gap','WCD10:work_level_research:V1-ENT-0691','open','仅为机构书目与有限内容介绍；未声称作品研究覆盖完整。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0514','WCD-10-B14:WCD10-B14-W105','research_gap','WCD10:work_level_research:V1-ENT-0692','open','仅为机构书目与有限内容介绍；未声称作品研究覆盖完整。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0515','WCD-10-B14:V1-ENT-0290','research_gap','WCD10:work_level_research:V1-ENT-0290','open','仅逐值保留冻结基线；本轮未判定学术覆盖完整性。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0516','WCD-10-B14:V1-ENT-0291','research_gap','WCD10:work_level_research:V1-ENT-0291','open','仅逐值保留冻结基线；本轮未判定学术覆盖完整性。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0517','WCD-10-B14:V1-ENT-0292','research_gap','WCD10:work_level_research:V1-ENT-0292','open','仅逐值保留冻结基线；本轮未判定学术覆盖完整性。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0518','WCD-10-B14:WCD10-B14-W201','research_gap','WCD10:work_level_research:V1-ENT-0693','open','仅据Educ.ar已实读作者作品目录作有限书目登记；不声称全集覆盖，也未独立核实版本。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0519','WCD-10-B14:WCD10-B14-W202','research_gap','WCD10:work_level_research:V1-ENT-0694','open','仅据Educ.ar已实读作者作品目录作有限书目登记；不声称全集覆盖，也未独立核实版本。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0520','WCD-10-B14:WCD10-B14-W203','research_gap','WCD10:work_level_research:V1-ENT-0695','open','仅据Educ.ar已实读作者作品目录作有限书目登记；不声称全集覆盖，也未独立核实版本。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0521','WCD-10-B14:WCD10-B14-W204','research_gap','WCD10:work_level_research:V1-ENT-0696','open','仅据Educ.ar已实读作者作品目录作有限书目登记；不声称全集覆盖，也未独立核实版本。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0522','WCD-10-B14:WCD10-B14-W205','research_gap','WCD10:work_level_research:V1-ENT-0697','open','仅据Educ.ar已实读作者作品目录作有限书目登记；不声称全集覆盖，也未独立核实版本。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0523','WCD-10-B14:WCD10-B14-W206','research_gap','WCD10:work_level_research:V1-ENT-0698','open','仅据Educ.ar已实读作者作品目录作有限书目登记；不声称全集覆盖，也未独立核实版本。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');


-- Controlled reviewed coauthor reentry supplement; no entities, facts, cards, or sources are created.
INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0668','WCD-10-B14','WCD10-B14-R201','V1-ENT-0285','CREATED','V1-ENT-0493','西尔维娜·奥坎波与阿道夫·比奥伊·卡萨雷斯合著《Los que aman, odian》；此关系只记录奥坎波的共同创作身份，不表示独著。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0669','WCD-10-B14','WCD10-B14-R202','V1-ENT-0285','CREATED','V1-ENT-0494','西尔维娜·奥坎波与豪尔赫·路易斯·博尔赫斯共同编选《Antología de la literatura fantástica》；此关系仅说明奥坎波参与共同编选，不表示独著或单独编者身份。','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0670','WCD-10-B14','WCD10-B14-R203','V1-ENT-0002','CREATED','V1-ENT-0494','豪尔赫·路易斯·博尔赫斯与西尔维娜·奥坎波共同编选《Antología de la literatura fantástica》；此关系仅说明博尔赫斯参与共同编选，不表示独著或单独编者身份。','high','accepted','Codex-parent-independent-review:PASS','3','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0668','SRC-0154'),
('V1-REL-0668','SRC-0519'),
('V1-REL-0669','SRC-0154'),
('V1-REL-0669','SRC-0478'),
('V1-REL-0669','SRC-0512'),
('V1-REL-0670','SRC-0154'),
('V1-REL-0670','SRC-0478'),
('V1-REL-0670','SRC-0512');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('WCD10-B14-R201-SRC-0154','V1-REL-0668','WCD10-B14-R201-SRC-0154','SRC-0154','Adolfo Bioy Casares. Cronología de obras','Cronología de Adolfo Bioy Casares，1946节第196-200行，明载 Bioy 与 Silvina Ocampo 共同出版此书；实读2026-10-13。','西尔维娜·奥坎波与阿道夫·比奥伊·卡萨雷斯合著《Los que aman, odian》；此关系只记录奥坎波的共同创作身份，不表示独著。','high','eligible_evidence','WCD-10-B14'),
('WCD10-B14-R201-SRC-0519','V1-REL-0668','WCD10-B14-R201-SRC-0519','SRC-0519','Los que aman, odian','出版社 Emecé press sheet 第20-24行明称两位作者共同写作；第37-38行将其称为 Ocampo 与 Bioy 合作的侦探小说，并列出版年份1945；实读2026-10-13。','西尔维娜·奥坎波与阿道夫·比奥伊·卡萨雷斯合著《Los que aman, odian》；此关系只记录奥坎波的共同创作身份，不表示独著。','high','eligible_evidence','WCD-10-B14'),
('WCD10-B14-R202-SRC-0154','V1-REL-0669','WCD10-B14-R202-SRC-0154','SRC-0154','Adolfo Bioy Casares. Cronología de obras','Cronología，1940节第175-179行，明载 Bioy 与 Borges、Silvina Ocampo 共同完成该选集；实读2026-10-13。','西尔维娜·奥坎波与豪尔赫·路易斯·博尔赫斯共同编选《Antología de la literatura fantástica》；此关系仅说明奥坎波参与共同编选，不表示独著或单独编者身份。','high','eligible_evidence','WCD-10-B14'),
('WCD10-B14-R202-SRC-0478','V1-REL-0669','WCD10-B14-R202-SRC-0478','SRC-0478','Bibliografía de Adolfo Bioy Casares','Bibliografía 第88-90行，置于“与 Silvina Ocampo 和 Jorge Luis Borges 合作作品”标题下，列书名、共同选编及1940年；实读2026-10-13。','西尔维娜·奥坎波与豪尔赫·路易斯·博尔赫斯共同编选《Antología de la literatura fantástica》；此关系仅说明奥坎波参与共同编选，不表示独著或单独编者身份。','high','eligible_evidence','WCD-10-B14'),
('WCD10-B14-R202-SRC-0512','V1-REL-0669','WCD10-B14-R202-SRC-0512','SRC-0512','Biografía de Adolfo Bioy Casares','Biografía 第59–60行：1940年 Bioy、Borges 与 Silvina Ocampo 共同出版该选集，并说明编选与翻译工作；实读2026-10-13。','西尔维娜·奥坎波与豪尔赫·路易斯·博尔赫斯共同编选《Antología de la literatura fantástica》；此关系仅说明奥坎波参与共同编选，不表示独著或单独编者身份。','high','eligible_evidence','WCD-10-B14'),
('WCD10-B14-R203-SRC-0154','V1-REL-0670','WCD10-B14-R203-SRC-0154','SRC-0154','Adolfo Bioy Casares. Cronología de obras','Cronología，1940节第175-179行，明载 Bioy 与 Borges、Silvina Ocampo 共同完成该选集；实读2026-10-13。','豪尔赫·路易斯·博尔赫斯与西尔维娜·奥坎波共同编选《Antología de la literatura fantástica》；此关系仅说明博尔赫斯参与共同编选，不表示独著或单独编者身份。','high','eligible_evidence','WCD-10-B14'),
('WCD10-B14-R203-SRC-0478','V1-REL-0670','WCD10-B14-R203-SRC-0478','SRC-0478','Bibliografía de Adolfo Bioy Casares','Bibliografía 第88-90行，置于“与 Silvina Ocampo 和 Jorge Luis Borges 合作作品”标题下，列书名、共同选编及1940年；实读2026-10-13。','豪尔赫·路易斯·博尔赫斯与西尔维娜·奥坎波共同编选《Antología de la literatura fantástica》；此关系仅说明博尔赫斯参与共同编选，不表示独著或单独编者身份。','high','eligible_evidence','WCD-10-B14'),
('WCD10-B14-R203-SRC-0512','V1-REL-0670','WCD10-B14-R203-SRC-0512','SRC-0512','Biografía de Adolfo Bioy Casares','Biografía 第59–60行：1940年 Bioy、Borges 与 Silvina Ocampo 共同出版该选集，并说明编选与翻译工作；实读2026-10-13。','豪尔赫·路易斯·博尔赫斯与西尔维娜·奥坎波共同编选《Antología de la literatura fantástica》；此关系仅说明博尔赫斯参与共同编选，不表示独著或单独编者身份。','high','eligible_evidence','WCD-10-B14');

UPDATE metadata SET value='WCD-10-B14' WHERE key='last_change_set';

UPDATE metadata SET value='2026-10-13' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 731 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 696 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 694 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 686 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2325 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 2864 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2304 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1391 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 668 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 1041 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 1012 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 523 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
