-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: Codex-parent-independent-review

-- Registration sha256: 3b226132ed73a02a3abfbd31c3666d9dfd861ae33d2be0af2173ba10d0e937f0

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1872 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1176 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 543 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 599 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 597 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 2319 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1893 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 356 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 43 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 863 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 892 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 568 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 656 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B08' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0659' OR canonical_url='https://www.casadelaliteratura.gob.pe/cesar-vallejo-la-historia-detras-la-publicacion-obras/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0660' OR canonical_url='https://www.casadelaliteratura.gob.pe/wp-content/uploads/2023/03/Historia-de-la-literatura-Vol-5-final.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0661' OR canonical_url='https://memoriaypapel.bnp.gob.pe/items/4665561f-5d41-4b28-a9cc-1bbeeb8fcfed') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0662' OR canonical_url='https://cervantesvirtual.com/portales/ruben_dario/ruben_dario_y_su_obra/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0602' OR (entity_type='work' AND original_name='Caetés')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0603' OR (entity_type='work' AND original_name='Memórias do Cárcere')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0604' OR (entity_type='work' AND original_name='Infância')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0605' OR (entity_type='work' AND original_name='El tungsteno')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0606' OR (entity_type='collection' AND original_name='España, aparta de mí este cáliz')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0607' OR (entity_type='collection' AND original_name='Escalas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0608' OR (entity_type='collection' AND original_name='El canto errante')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0609' OR (entity_type='collection' AND original_name='Poema del otoño y otros poemas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1900' OR (subject_id='V1-ENT-0602' AND fact_field='first_publication_year' AND value_text='1933')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1901' OR (subject_id='V1-ENT-0602' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1902' OR (subject_id='V1-ENT-0602' AND fact_field='one_sentence_summary' AND value_text='圣保罗市文化部门称这是拉莫斯的小说处女作，并将其描述为带有心理内省的叙事，呈现个体在社会与个人困境中的挣扎。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1903' OR (subject_id='V1-ENT-0603' AND fact_field='first_publication_year' AND value_text='1953')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1904' OR (subject_id='V1-ENT-0603' AND fact_field='genre_or_form' AND value_text='回忆录 / 狱中回忆')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1905' OR (subject_id='V1-ENT-0603' AND fact_field='one_sentence_summary' AND value_text='国家图书馆数字馆藏记载该书于作者去世后出版，写其狱中经历。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1906' OR (subject_id='V1-ENT-0604' AND fact_field='first_publication_year' AND value_text='1945')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1907' OR (subject_id='V1-ENT-0604' AND fact_field='genre_or_form' AND value_text='自传 / 回忆录')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1908' OR (subject_id='V1-ENT-0604' AND fact_field='one_sentence_summary' AND value_text='国家图书馆数字馆藏将《童年》列为1945年出版的作品，并明确称其为自传性叙述。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1909' OR (subject_id='V1-ENT-0605' AND fact_field='first_publication_year' AND value_text='1931')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1910' OR (subject_id='V1-ENT-0605' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1911' OR (subject_id='V1-ENT-0605' AND fact_field='one_sentence_summary' AND value_text='小说以库斯科地区的钨矿和Mining Society为背景，描写Soras社区遭到土地剥夺并被迫进入矿井劳动的处境。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1912' OR (subject_id='V1-ENT-0606' AND fact_field='first_publication_year' AND value_text='1939')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1913' OR (subject_id='V1-ENT-0606' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1914' OR (subject_id='V1-ENT-0606' AND fact_field='one_sentence_summary' AND value_text='这部诗集由15首与西班牙内战相关的诗组成；机构出版史同时记录其独立题名及诗作被编入1939年《Poemas humanos》卷的情况。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1915' OR (subject_id='V1-ENT-0607' AND fact_field='first_publication_year' AND value_text='1923')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1916' OR (subject_id='V1-ENT-0607' AND fact_field='genre_or_form' AND value_text='故事与叙事作品集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1917' OR (subject_id='V1-ENT-0607' AND fact_field='one_sentence_summary' AND value_text='作品分为Cuneiformes与Coro de Vientos两部分，各收六篇文本；机构介绍将前部与作者的监狱经历相连，并将后部描述为怪诞、幻想故事。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1918' OR (subject_id='V1-ENT-0608' AND fact_field='first_publication_year' AND value_text='1907')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1919' OR (subject_id='V1-ENT-0608' AND fact_field='genre_or_form' AND value_text='诗集（抒情诗）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1920' OR (subject_id='V1-ENT-0608' AND fact_field='one_sentence_summary' AND value_text='国家图书馆研究将此书列入达里奥主要抒情作品，并记于《生命与希望之歌》之后出版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1921' OR (subject_id='V1-ENT-0609' AND fact_field='first_publication_year' AND value_text='1910')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1922' OR (subject_id='V1-ENT-0609' AND fact_field='genre_or_form' AND value_text='诗歌作品集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1923' OR (subject_id='V1-ENT-0609' AND fact_field='one_sentence_summary' AND value_text='塞万提斯虚拟图书馆将本书列为达里奥晚期诗歌作品，并记载于1910年出版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1924' OR (subject_id='V1-ENT-0220' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1925' OR (subject_id='V1-ENT-0220' AND fact_field='one_sentence_summary' AND value_text='据巴拉那州公共图书馆页面，小说围绕因旱灾迁徙的牧人法比亚诺一家展开，成员包括妻子辛哈·维多利亚、两个孩子与狗巴莱娅。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1926' OR (subject_id='V1-ENT-0221' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1927' OR (subject_id='V1-ENT-0221' AND fact_field='one_sentence_summary' AND value_text='圣保罗市文化部门通过农场主保罗·奥诺里奥的故事，介绍作品对野心、权力与道德败坏的呈现。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1928' OR (subject_id='V1-ENT-0222' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1929' OR (subject_id='V1-ENT-0222' AND fact_field='one_sentence_summary' AND value_text='圣保罗市文化部门将小说概括为路易斯·达·席尔瓦的内心叙事，聚焦其执念、挫折与恐惧。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1930' OR (subject_id='V1-ENT-0226' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1931' OR (subject_id='V1-ENT-0226' AND fact_field='one_sentence_summary' AND value_text='这部早期诗集围绕家庭、故土、宗教与日常生活展开，机构展览资料将其描述为带有乡愁色彩的亲密作品。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1932' OR (subject_id='V1-ENT-0227' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1933' OR (subject_id='V1-ENT-0227' AND fact_field='one_sentence_summary' AND value_text='机构展览资料记载，该诗集大部分写于Vallejo在特鲁希略服刑期间，并将诗中监禁空间与自由愿望的张力联系起来。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1934' OR (subject_id='V1-ENT-0228' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1935' OR (subject_id='V1-ENT-0228' AND fact_field='one_sentence_summary' AND value_text='这部诗集由1931至1937年间写作的诗作构成，Vallejo逝世后于1939年出版；机构文章指出Georgette Vallejo与Raúl Porras Barrenechea参与编排诗作。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1936' OR (subject_id='V1-ENT-0229' AND fact_field='genre_or_form' AND value_text='诗歌与短篇叙事并收的作品集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1937' OR (subject_id='V1-ENT-0229' AND fact_field='one_sentence_summary' AND value_text='本书兼收诗与短篇叙事；国家图书馆专题指出，作品吸收了其他文学传统与文化元素，并呈现艺术家面对当时社会结构的立场。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1938' OR (subject_id='V1-ENT-0230' AND fact_field='genre_or_form' AND value_text='诗集（抒情诗）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1939' OR (subject_id='V1-ENT-0230' AND fact_field='one_sentence_summary' AND value_text='书中强调词语的音乐性、异域色彩与暗示能力，体现达里奥对诗歌形式和用词的精细锤炼。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1940' OR (subject_id='V1-ENT-0231' AND fact_field='genre_or_form' AND value_text='诗集（抒情诗）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1941' OR (subject_id='V1-ENT-0231' AND fact_field='one_sentence_summary' AND value_text='该书为达里奥1905年出版的主要抒情诗集；国家图书馆书目研究将其置于《世俗的颂歌》之后。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0571' OR (subject_id='V1-ENT-0213' AND relation_type='CREATED' AND object_id='V1-ENT-0602')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0572' OR (subject_id='V1-ENT-0213' AND relation_type='CREATED' AND object_id='V1-ENT-0603')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0573' OR (subject_id='V1-ENT-0213' AND relation_type='CREATED' AND object_id='V1-ENT-0604')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0574' OR (subject_id='V1-ENT-0223' AND relation_type='CREATED' AND object_id='V1-ENT-0605')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0575' OR (subject_id='V1-ENT-0223' AND relation_type='CREATED' AND object_id='V1-ENT-0606')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0576' OR (subject_id='V1-ENT-0223' AND relation_type='CREATED' AND object_id='V1-ENT-0607')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0577' OR (subject_id='V1-ENT-0224' AND relation_type='CREATED' AND object_id='V1-ENT-0608')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0578' OR (subject_id='V1-ENT-0224' AND relation_type='CREATED' AND object_id='V1-ENT-0609')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0659','WCD10-B09-S101','César Vallejo: la historia detrás de la publicación de sus obras','César Vallejo: la historia detrás de la publicación de sus obras','Micaela Montes Reyes / Casa de la Literatura Peruana','','Casa de la Literatura Peruana','2022','','institutional_exhibition_article','','es','B','access_pass','WCD-10-B09','Research candidate metadata only; no public admission implied.','remote_only','','https://www.casadelaliteratura.gob.pe/cesar-vallejo-la-historia-detras-la-publicacion-obras/'),
('SRC-0660','WCD10-B09-S102','La narrativa peruana contemporánea. Cuento y novela (1920-2000)','La narrativa peruana contemporánea. Cuento y novela (1920-2000)','Estelle Tarica; Jorge Marcone y José Alberto Portugal (coordinadores); Raquel Chang-Rodríguez y Marcel Velázquez Castro (directores generales)','','Fondo Editorial de la Pontificia Universidad Católica del Perú / Casa de la Literatura / Ministerio de Educación del Perú','2022','','institutional_literary_history_pdf','','es','B','access_pass','WCD-10-B09','Research candidate metadata only; no public admission implied.','remote_only','','https://www.casadelaliteratura.gob.pe/wp-content/uploads/2023/03/Historia-de-la-literatura-Vol-5-final.pdf'),
('SRC-0661','WCD10-B09-S103','España, aparta de mí este cáliz : poemas','España, aparta de mí este cáliz : poemas','Biblioteca Nacional del Perú','','Biblioteca Nacional del Perú','','','national_library_catalog_record','','es','B','access_pass','WCD-10-B09','Research candidate metadata only; no public admission implied.','remote_only','','https://memoriaypapel.bnp.gob.pe/items/4665561f-5d41-4b28-a9cc-1bbeeb8fcfed'),
('SRC-0662','WCD10-B09-S203','Rubén Darío y su obra','Rubén Darío y su obra','Pedro Mendiola (Universidad de Alicante)','','Biblioteca Virtual Miguel de Cervantes','','','institutional_author_research_web_page','','es','B','access_pass','WCD-10-B09','Research candidate metadata only; no public admission implied.','remote_only','','https://cervantesvirtual.com/portales/ruben_dario/ruben_dario_y_su_obra/');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0602','work','《卡埃特斯》','Caetés','candidate','1','WCD10-B09-W001','补入拉莫斯主要作品；由国家图书馆/市级文化机构直接书目或内容介绍支持；普通简介按来源范围转述。; 中文名为便于检索的暂译；葡萄牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0603','work','《狱中回忆》','Memórias do Cárcere','candidate','1','WCD10-B09-W002','补入拉莫斯主要作品；由国家图书馆/市级文化机构直接书目或内容介绍支持；普通简介按来源范围转述。; 中文名为便于检索的暂译；葡萄牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0604','work','《童年》','Infância','candidate','1','WCD10-B09-W003','补入拉莫斯主要作品；由国家图书馆/市级文化机构直接书目或内容介绍支持；普通简介按来源范围转述。; 中文名为便于检索的暂译；葡萄牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0605','work','《钨矿》','El tungsteno','candidate','1','WCD10-B09-W101','主要小说，机构参与出版的文学史记录1931年马德里出版，并直接介绍矿业公司、矿工与Soras社区处境；中文名仅作工作译名。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0606','collection','《西班牙，离开我的这只圣杯》','España, aparta de mí este cáliz','candidate','1','WCD10-B09-W102','重要的独立题名诗集。国家图书馆有1939年单独书目项；Casa de la Literatura说明其由15首诗组成、与西班牙内战相关，并记录其印本及被编入《Poemas humanos》卷的复杂出版史。; 中文为检索/展示工作译名，保留西班牙语原题；不声称存在正式中文译本或固定译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0607','collection','《阶梯》','Escalas','candidate','1','WCD10-B09-W103','1923年短篇/叙事作品集，机构出版史直接区分原题《Escalas》与后来的《Escalas melografiadas》误称，并说明其两部分结构；按原始题名建立作品集对象。; 中文为检索/展示工作译名，保留西班牙语原题；此题名不是《Escalas melografiadas》的规范化替代名，不声称正式译本名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0608','collection','《流浪之歌》','El canto errante','candidate','1','WCD10-B09-W201','智利国家图书馆书目研究直接将其列为达里奥的主要抒情作品之一；按独立诗集处理。; 中文为工作译名，西班牙语原题为身份锚点；不声称存在正式中文译本名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0609','collection','《秋之诗篇及其他诗作》','Poema del otoño y otros poemas','candidate','1','WCD10-B09-W202','塞万提斯虚拟图书馆大学专题直接列出完整书名及1910年出版信息；按诗歌合集处理，与同题单篇诗保持区分。; 中文为工作译名，西班牙语原题为身份锚点；不声称存在正式中文译本名。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0598','WCD10-B09-W001','WCD-10-B09','WCD10-B09-W001','V1-ENT-0602','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0599','WCD10-B09-W002','WCD-10-B09','WCD10-B09-W002','V1-ENT-0603','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0600','WCD10-B09-W003','WCD-10-B09','WCD10-B09-W003','V1-ENT-0604','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0601','WCD10-B09-W101','WCD-10-B09','WCD10-B09-W101','V1-ENT-0605','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0602','WCD10-B09-W102','WCD-10-B09','WCD10-B09-W102','V1-ENT-0606','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0603','WCD10-B09-W103','WCD-10-B09','WCD10-B09-W103','V1-ENT-0607','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0604','WCD10-B09-W201','WCD-10-B09','WCD10-B09-W201','V1-ENT-0608','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0605','WCD10-B09-W202','WCD-10-B09','WCD10-B09-W202','V1-ENT-0609','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0544','WCD-10-B09:V1-ENT-0602','V1-ENT-0602','work','《卡埃特斯》','格拉西利亚诺·拉莫斯','Caetés','巴西','pt','1933','长篇小说','WCD-10-B09','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《卡埃特斯》｜Caetés

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1933
- genre_or_form：长篇小说
- one_sentence_summary：圣保罗市文化部门称这是拉莫斯的小说处女作，并将其描述为带有心理内省的叙事，呈现个体在社会与个人困境中的挣扎。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0545','WCD-10-B09:V1-ENT-0603','V1-ENT-0603','work','《狱中回忆》','格拉西利亚诺·拉莫斯','Memórias do Cárcere','巴西','pt','1953','回忆录 / 狱中回忆','WCD-10-B09','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《狱中回忆》｜Memórias do Cárcere

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1953
- genre_or_form：回忆录 / 狱中回忆
- one_sentence_summary：国家图书馆数字馆藏记载该书于作者去世后出版，写其狱中经历。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0546','WCD-10-B09:V1-ENT-0604','V1-ENT-0604','work','《童年》','格拉西利亚诺·拉莫斯','Infância','巴西','pt','1945','自传 / 回忆录','WCD-10-B09','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《童年》｜Infância

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1945
- genre_or_form：自传 / 回忆录
- one_sentence_summary：国家图书馆数字馆藏将《童年》列为1945年出版的作品，并明确称其为自传性叙述。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0547','WCD-10-B09:V1-ENT-0605','V1-ENT-0605','work','《钨矿》','塞萨尔·巴列霍','El tungsteno','秘鲁','es','1931','小说','WCD-10-B09','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《钨矿》｜El tungsteno

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1931
- genre_or_form：小说
- one_sentence_summary：小说以库斯科地区的钨矿和Mining Society为背景，描写Soras社区遭到土地剥夺并被迫进入矿井劳动的处境。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0548','WCD-10-B09:V1-ENT-0606','V1-ENT-0606','collection','《西班牙，离开我的这只圣杯》','塞萨尔·巴列霍','España, aparta de mí este cáliz','秘鲁','es','1939','诗集','WCD-10-B09','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《西班牙，离开我的这只圣杯》｜España, aparta de mí este cáliz

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1939
- genre_or_form：诗集
- one_sentence_summary：这部诗集由15首与西班牙内战相关的诗组成；机构出版史同时记录其独立题名及诗作被编入1939年《Poemas humanos》卷的情况。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0549','WCD-10-B09:V1-ENT-0607','V1-ENT-0607','collection','《阶梯》','塞萨尔·巴列霍','Escalas','秘鲁','es','1923','故事与叙事作品集','WCD-10-B09','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《阶梯》｜Escalas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1923
- genre_or_form：故事与叙事作品集
- one_sentence_summary：作品分为Cuneiformes与Coro de Vientos两部分，各收六篇文本；机构介绍将前部与作者的监狱经历相连，并将后部描述为怪诞、幻想故事。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0550','WCD-10-B09:V1-ENT-0608','V1-ENT-0608','collection','《流浪之歌》','鲁文·达里奥','El canto errante','尼加拉瓜','es','1907','诗集（抒情诗）','WCD-10-B09','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《流浪之歌》｜El canto errante

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1907
- genre_or_form：诗集（抒情诗）
- one_sentence_summary：国家图书馆研究将此书列入达里奥主要抒情作品，并记于《生命与希望之歌》之后出版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0551','WCD-10-B09:V1-ENT-0609','V1-ENT-0609','collection','《秋之诗篇及其他诗作》','鲁文·达里奥','Poema del otoño y otros poemas','尼加拉瓜','es','1910','诗歌作品集','WCD-10-B09','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《秋之诗篇及其他诗作》｜Poema del otoño y otros poemas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1910
- genre_or_form：诗歌作品集
- one_sentence_summary：塞万提斯虚拟图书馆将本书列为达里奥晚期诗歌作品，并记载于1910年出版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0552','WCD-10-B09:V1-ENT-0220','V1-ENT-0220','work','《枯竭的生命》','格拉西利亚诺·拉莫斯','Vidas Secas','巴西','pt','','长篇小说','WCD-10-B09','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《枯竭的生命》｜Vidas Secas

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说
- one_sentence_summary：据巴拉那州公共图书馆页面，小说围绕因旱灾迁徙的牧人法比亚诺一家展开，成员包括妻子辛哈·维多利亚、两个孩子与狗巴莱娅。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0553','WCD-10-B09:V1-ENT-0221','V1-ENT-0221','work','《圣贝尔纳多》','格拉西利亚诺·拉莫斯','São Bernardo','巴西','pt','','长篇小说','WCD-10-B09','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《圣贝尔纳多》｜São Bernardo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说
- one_sentence_summary：圣保罗市文化部门通过农场主保罗·奥诺里奥的故事，介绍作品对野心、权力与道德败坏的呈现。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0554','WCD-10-B09:V1-ENT-0222','V1-ENT-0222','work','《苦闷》','格拉西利亚诺·拉莫斯','Angústia','巴西','pt','','长篇小说','WCD-10-B09','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《苦闷》｜Angústia

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说
- one_sentence_summary：圣保罗市文化部门将小说概括为路易斯·达·席尔瓦的内心叙事，聚焦其执念、挫折与恐惧。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0555','WCD-10-B09:V1-ENT-0226','V1-ENT-0226','collection','《黑色使者》','塞萨尔·巴列霍','Los heraldos negros','秘鲁','es','','诗集','WCD-10-B09','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《黑色使者》｜Los heraldos negros

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗集
- one_sentence_summary：这部早期诗集围绕家庭、故土、宗教与日常生活展开，机构展览资料将其描述为带有乡愁色彩的亲密作品。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0556','WCD-10-B09:V1-ENT-0227','V1-ENT-0227','collection','《特里尔塞》','塞萨尔·巴列霍','Trilce','秘鲁','es','','诗集','WCD-10-B09','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《特里尔塞》｜Trilce

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗集
- one_sentence_summary：机构展览资料记载，该诗集大部分写于Vallejo在特鲁希略服刑期间，并将诗中监禁空间与自由愿望的张力联系起来。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0557','WCD-10-B09:V1-ENT-0228','V1-ENT-0228','collection','《人类的诗篇》','塞萨尔·巴列霍','Poemas humanos','秘鲁','es','','诗集','WCD-10-B09','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《人类的诗篇》｜Poemas humanos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗集
- one_sentence_summary：这部诗集由1931至1937年间写作的诗作构成，Vallejo逝世后于1939年出版；机构文章指出Georgette Vallejo与Raúl Porras Barrenechea参与编排诗作。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0558','WCD-10-B09:V1-ENT-0229','V1-ENT-0229','collection','《蓝……》','鲁文·达里奥','Azul...','尼加拉瓜','es','','诗歌与短篇叙事并收的作品集','WCD-10-B09','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《蓝……》｜Azul...

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗歌与短篇叙事并收的作品集
- one_sentence_summary：本书兼收诗与短篇叙事；国家图书馆专题指出，作品吸收了其他文学传统与文化元素，并呈现艺术家面对当时社会结构的立场。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0559','WCD-10-B09:V1-ENT-0230','V1-ENT-0230','collection','《世俗的颂歌》','鲁文·达里奥','Prosas profanas','尼加拉瓜','es','','诗集（抒情诗）','WCD-10-B09','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《世俗的颂歌》｜Prosas profanas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗集（抒情诗）
- one_sentence_summary：书中强调词语的音乐性、异域色彩与暗示能力，体现达里奥对诗歌形式和用词的精细锤炼。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0560','WCD-10-B09:V1-ENT-0231','V1-ENT-0231','collection','《生命与希望之歌》','鲁文·达里奥','Cantos de vida y esperanza','尼加拉瓜','es','','诗集（抒情诗）','WCD-10-B09','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《生命与希望之歌》｜Cantos de vida y esperanza

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗集（抒情诗）
- one_sentence_summary：该书为达里奥1905年出版的主要抒情诗集；国家图书馆书目研究将其置于《世俗的颂歌》之后。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-1900','WCD10-B09-W001-F01','V1-CARD-0544','V1-ENT-0602','first_publication_year','1933','bibliographic','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1901','WCD10-B09-W001-F02','V1-CARD-0544','V1-ENT-0602','genre_or_form','长篇小说','bibliographic','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1902','WCD10-B09-W001-F03','V1-CARD-0544','V1-ENT-0602','one_sentence_summary','圣保罗市文化部门称这是拉莫斯的小说处女作，并将其描述为带有心理内省的叙事，呈现个体在社会与个人困境中的挣扎。','institutional_paraphrase','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1903','WCD10-B09-W002-F01','V1-CARD-0545','V1-ENT-0603','first_publication_year','1953','bibliographic','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1904','WCD10-B09-W002-F02','V1-CARD-0545','V1-ENT-0603','genre_or_form','回忆录 / 狱中回忆','bibliographic','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1905','WCD10-B09-W002-F03','V1-CARD-0545','V1-ENT-0603','one_sentence_summary','国家图书馆数字馆藏记载该书于作者去世后出版，写其狱中经历。','institutional_paraphrase','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1906','WCD10-B09-W003-F01','V1-CARD-0546','V1-ENT-0604','first_publication_year','1945','bibliographic','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1907','WCD10-B09-W003-F02','V1-CARD-0546','V1-ENT-0604','genre_or_form','自传 / 回忆录','bibliographic','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1908','WCD10-B09-W003-F03','V1-CARD-0546','V1-ENT-0604','one_sentence_summary','国家图书馆数字馆藏将《童年》列为1945年出版的作品，并明确称其为自传性叙述。','institutional_paraphrase','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1909','WCD10-B09-W101-F01','V1-CARD-0547','V1-ENT-0605','first_publication_year','1931','bibliographic','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1910','WCD10-B09-W101-F02','V1-CARD-0547','V1-ENT-0605','genre_or_form','小说','bibliographic','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1911','WCD10-B09-W101-F03','V1-CARD-0547','V1-ENT-0605','one_sentence_summary','小说以库斯科地区的钨矿和Mining Society为背景，描写Soras社区遭到土地剥夺并被迫进入矿井劳动的处境。','institutional_paraphrase','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1912','WCD10-B09-W102-F01','V1-CARD-0548','V1-ENT-0606','first_publication_year','1939','bibliographic','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1913','WCD10-B09-W102-F02','V1-CARD-0548','V1-ENT-0606','genre_or_form','诗集','bibliographic','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1914','WCD10-B09-W102-F03','V1-CARD-0548','V1-ENT-0606','one_sentence_summary','这部诗集由15首与西班牙内战相关的诗组成；机构出版史同时记录其独立题名及诗作被编入1939年《Poemas humanos》卷的情况。','institutional_paraphrase','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1915','WCD10-B09-W103-F01','V1-CARD-0549','V1-ENT-0607','first_publication_year','1923','bibliographic','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1916','WCD10-B09-W103-F02','V1-CARD-0549','V1-ENT-0607','genre_or_form','故事与叙事作品集','bibliographic','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1917','WCD10-B09-W103-F03','V1-CARD-0549','V1-ENT-0607','one_sentence_summary','作品分为Cuneiformes与Coro de Vientos两部分，各收六篇文本；机构介绍将前部与作者的监狱经历相连，并将后部描述为怪诞、幻想故事。','institutional_paraphrase','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1918','WCD10-B09-W201-F01','V1-CARD-0550','V1-ENT-0608','first_publication_year','1907','bibliographic','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1919','WCD10-B09-W201-F02','V1-CARD-0550','V1-ENT-0608','genre_or_form','诗集（抒情诗）','bibliographic','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1920','WCD10-B09-W201-F03','V1-CARD-0550','V1-ENT-0608','one_sentence_summary','国家图书馆研究将此书列入达里奥主要抒情作品，并记于《生命与希望之歌》之后出版。','institutional_paraphrase','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1921','WCD10-B09-W202-F01','V1-CARD-0551','V1-ENT-0609','first_publication_year','1910','bibliographic','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1922','WCD10-B09-W202-F02','V1-CARD-0551','V1-ENT-0609','genre_or_form','诗歌作品集','bibliographic','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1923','WCD10-B09-W202-F03','V1-CARD-0551','V1-ENT-0609','one_sentence_summary','塞万提斯虚拟图书馆将本书列为达里奥晚期诗歌作品，并记载于1910年出版。','institutional_paraphrase','WCD-10-B09','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1924','WCD10-B09-F001','V1-CARD-0552','V1-ENT-0220','genre_or_form','长篇小说','bibliographic','WCD-10-B09','high','batch_retained_candidate','补充基线缺失的体裁/简介字段；逐值保留原有实体、全部旧facts/cards/relations及其来源与证据链，不更改既有值。'),
('V1-FCT-1925','WCD10-B09-F002','V1-CARD-0552','V1-ENT-0220','one_sentence_summary','据巴拉那州公共图书馆页面，小说围绕因旱灾迁徙的牧人法比亚诺一家展开，成员包括妻子辛哈·维多利亚、两个孩子与狗巴莱娅。','institutional_paraphrase','WCD-10-B09','high','batch_retained_candidate','补充基线缺失的体裁/简介字段；逐值保留原有实体、全部旧facts/cards/relations及其来源与证据链，不更改既有值。'),
('V1-FCT-1926','WCD10-B09-F003','V1-CARD-0553','V1-ENT-0221','genre_or_form','长篇小说','bibliographic','WCD-10-B09','high','batch_retained_candidate','补充基线缺失的体裁/简介字段；逐值保留原有实体、全部旧facts/cards/relations及其来源与证据链，不更改既有值。'),
('V1-FCT-1927','WCD10-B09-F004','V1-CARD-0553','V1-ENT-0221','one_sentence_summary','圣保罗市文化部门通过农场主保罗·奥诺里奥的故事，介绍作品对野心、权力与道德败坏的呈现。','institutional_paraphrase','WCD-10-B09','high','batch_retained_candidate','补充基线缺失的体裁/简介字段；逐值保留原有实体、全部旧facts/cards/relations及其来源与证据链，不更改既有值。'),
('V1-FCT-1928','WCD10-B09-F005','V1-CARD-0554','V1-ENT-0222','genre_or_form','长篇小说','bibliographic','WCD-10-B09','high','batch_retained_candidate','补充基线缺失的体裁/简介字段；逐值保留原有实体、全部旧facts/cards/relations及其来源与证据链，不更改既有值。'),
('V1-FCT-1929','WCD10-B09-F006','V1-CARD-0554','V1-ENT-0222','one_sentence_summary','圣保罗市文化部门将小说概括为路易斯·达·席尔瓦的内心叙事，聚焦其执念、挫折与恐惧。','institutional_paraphrase','WCD-10-B09','high','batch_retained_candidate','补充基线缺失的体裁/简介字段；逐值保留原有实体、全部旧facts/cards/relations及其来源与证据链，不更改既有值。'),
('V1-FCT-1930','WCD10-B09-F101','V1-CARD-0555','V1-ENT-0226','genre_or_form','诗集','bibliographic','WCD-10-B09','high','batch_retained_candidate','仅补基线缺失的作品类型/普通机构简介；保留基线 entity、全部旧 facts/cards/CREATED relation、holds/gaps 及可用 source/evidence/source_objects 链不变。 已有卡片标注诗集；此处补入事实字段，不重复写出版年份。'),
('V1-FCT-1931','WCD10-B09-F102','V1-CARD-0555','V1-ENT-0226','one_sentence_summary','这部早期诗集围绕家庭、故土、宗教与日常生活展开，机构展览资料将其描述为带有乡愁色彩的亲密作品。','institutional_paraphrase','WCD-10-B09','high','batch_retained_candidate','仅补基线缺失的作品类型/普通机构简介；保留基线 entity、全部旧 facts/cards/CREATED relation、holds/gaps 及可用 source/evidence/source_objects 链不变。 只转述该机构对作品本身的介绍，不裁决《黑色使者》1918/1919首版与印行冲突。'),
('V1-FCT-1932','WCD10-B09-F103','V1-CARD-0556','V1-ENT-0227','genre_or_form','诗集','bibliographic','WCD-10-B09','high','batch_retained_candidate','仅补基线缺失的作品类型/普通机构简介；保留基线 entity、全部旧 facts/cards/CREATED relation、holds/gaps 及可用 source/evidence/source_objects 链不变。 不重复现有1922年份事实。'),
('V1-FCT-1933','WCD10-B09-F104','V1-CARD-0556','V1-ENT-0227','one_sentence_summary','机构展览资料记载，该诗集大部分写于Vallejo在特鲁希略服刑期间，并将诗中监禁空间与自由愿望的张力联系起来。','institutional_paraphrase','WCD-10-B09','high','batch_retained_candidate','仅补基线缺失的作品类型/普通机构简介；保留基线 entity、全部旧 facts/cards/CREATED relation、holds/gaps 及可用 source/evidence/source_objects 链不变。 这是对该作品的有归属概述，不把它提升为作者总体创作结论。'),
('V1-FCT-1934','WCD10-B09-F105','V1-CARD-0557','V1-ENT-0228','genre_or_form','诗集','bibliographic','WCD-10-B09','high','batch_retained_candidate','仅补基线缺失的作品类型/普通机构简介；保留基线 entity、全部旧 facts/cards/CREATED relation、holds/gaps 及可用 source/evidence/source_objects 链不变。 不重复现有1939出版序列年份事实。'),
('V1-FCT-1935','WCD10-B09-F106','V1-CARD-0557','V1-ENT-0228','one_sentence_summary','这部诗集由1931至1937年间写作的诗作构成，Vallejo逝世后于1939年出版；机构文章指出Georgette Vallejo与Raúl Porras Barrenechea参与编排诗作。','institutional_paraphrase','WCD-10-B09','high','batch_retained_candidate','仅补基线缺失的作品类型/普通机构简介；保留基线 entity、全部旧 facts/cards/CREATED relation、holds/gaps 及可用 source/evidence/source_objects 链不变。 明确区分诗作写作时段与诗集出版年份，不新增写作或出版日期事实。'),
('V1-FCT-1936','WCD10-B09-F201','V1-CARD-0558','V1-ENT-0229','genre_or_form','诗歌与短篇叙事并收的作品集','bibliographic','WCD-10-B09','high','batch_retained_candidate','仅补基线缺失字段；逐字保全该作品既有facts/cards/CREATED关系及完整来源链，不改写已有值。'),
('V1-FCT-1937','WCD10-B09-F202','V1-CARD-0558','V1-ENT-0229','one_sentence_summary','本书兼收诗与短篇叙事；国家图书馆专题指出，作品吸收了其他文学传统与文化元素，并呈现艺术家面对当时社会结构的立场。','institutional_paraphrase','WCD-10-B09','high','batch_retained_candidate','仅补基线缺失字段；逐字保全该作品既有facts/cards/CREATED关系及完整来源链，不改写已有值。'),
('V1-FCT-1938','WCD10-B09-F203','V1-CARD-0559','V1-ENT-0230','genre_or_form','诗集（抒情诗）','bibliographic','WCD-10-B09','high','batch_retained_candidate','仅补基线缺失字段；逐字保全该作品既有facts/cards/CREATED关系及完整来源链，不改写已有值。'),
('V1-FCT-1939','WCD10-B09-F204','V1-CARD-0559','V1-ENT-0230','one_sentence_summary','书中强调词语的音乐性、异域色彩与暗示能力，体现达里奥对诗歌形式和用词的精细锤炼。','institutional_paraphrase','WCD-10-B09','high','batch_retained_candidate','仅补基线缺失字段；逐字保全该作品既有facts/cards/CREATED关系及完整来源链，不改写已有值。'),
('V1-FCT-1940','WCD10-B09-F205','V1-CARD-0560','V1-ENT-0231','genre_or_form','诗集（抒情诗）','bibliographic','WCD-10-B09','high','batch_retained_candidate','仅补基线缺失字段；逐字保全该作品既有facts/cards/CREATED关系及完整来源链，不改写已有值。'),
('V1-FCT-1941','WCD10-B09-F206','V1-CARD-0560','V1-ENT-0231','one_sentence_summary','该书为达里奥1905年出版的主要抒情诗集；国家图书馆书目研究将其置于《世俗的颂歌》之后。','institutional_paraphrase','WCD-10-B09','high','batch_retained_candidate','仅补基线缺失字段；逐字保全该作品既有facts/cards/CREATED关系及完整来源链，不改写已有值。');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-1900','SRC-0171','Graciliano Ramos – BNDigital'),
('V1-FCT-1900','SRC-0173','133 anos de Graciliano Ramos – Prefeitura de São Paulo'),
('V1-FCT-1901','SRC-0171','Graciliano Ramos – BNDigital'),
('V1-FCT-1901','SRC-0173','133 anos de Graciliano Ramos – Prefeitura de São Paulo'),
('V1-FCT-1902','SRC-0171','Graciliano Ramos – BNDigital'),
('V1-FCT-1902','SRC-0173','133 anos de Graciliano Ramos – Prefeitura de São Paulo'),
('V1-FCT-1903','SRC-0171','Graciliano Ramos – BNDigital'),
('V1-FCT-1903','SRC-0173','133 anos de Graciliano Ramos – Prefeitura de São Paulo'),
('V1-FCT-1904','SRC-0171','Graciliano Ramos – BNDigital'),
('V1-FCT-1904','SRC-0173','133 anos de Graciliano Ramos – Prefeitura de São Paulo'),
('V1-FCT-1905','SRC-0171','Graciliano Ramos – BNDigital'),
('V1-FCT-1905','SRC-0173','133 anos de Graciliano Ramos – Prefeitura de São Paulo'),
('V1-FCT-1906','SRC-0171','Graciliano Ramos – BNDigital'),
('V1-FCT-1907','SRC-0171','Graciliano Ramos – BNDigital'),
('V1-FCT-1908','SRC-0171','Graciliano Ramos – BNDigital'),
('V1-FCT-1909','SRC-0660','La narrativa peruana contemporánea. Cuento y novela (1920-2000)'),
('V1-FCT-1910','SRC-0660','La narrativa peruana contemporánea. Cuento y novela (1920-2000)'),
('V1-FCT-1911','SRC-0660','La narrativa peruana contemporánea. Cuento y novela (1920-2000)'),
('V1-FCT-1912','SRC-0661','España, aparta de mí este cáliz : poemas'),
('V1-FCT-1913','SRC-0659','César Vallejo: la historia detrás de la publicación de sus obras'),
('V1-FCT-1913','SRC-0661','España, aparta de mí este cáliz : poemas'),
('V1-FCT-1914','SRC-0659','César Vallejo: la historia detrás de la publicación de sus obras'),
('V1-FCT-1914','SRC-0661','España, aparta de mí este cáliz : poemas'),
('V1-FCT-1915','SRC-0659','César Vallejo: la historia detrás de la publicación de sus obras'),
('V1-FCT-1915','SRC-0660','La narrativa peruana contemporánea. Cuento y novela (1920-2000)'),
('V1-FCT-1916','SRC-0659','César Vallejo: la historia detrás de la publicación de sus obras'),
('V1-FCT-1916','SRC-0660','La narrativa peruana contemporánea. Cuento y novela (1920-2000)'),
('V1-FCT-1917','SRC-0659','César Vallejo: la historia detrás de la publicación de sus obras'),
('V1-FCT-1918','SRC-0182','El modernismo y Rubén Darío'),
('V1-FCT-1919','SRC-0182','El modernismo y Rubén Darío'),
('V1-FCT-1920','SRC-0182','El modernismo y Rubén Darío'),
('V1-FCT-1921','SRC-0662','Rubén Darío y su obra'),
('V1-FCT-1922','SRC-0662','Rubén Darío y su obra'),
('V1-FCT-1923','SRC-0662','Rubén Darío y su obra'),
('V1-FCT-1924','SRC-0172','Making of Vidas Secas'),
('V1-FCT-1925','SRC-0172','Making of Vidas Secas'),
('V1-FCT-1926','SRC-0173','133 anos de Graciliano Ramos – Prefeitura de São Paulo'),
('V1-FCT-1927','SRC-0173','133 anos de Graciliano Ramos – Prefeitura de São Paulo'),
('V1-FCT-1928','SRC-0173','133 anos de Graciliano Ramos – Prefeitura de São Paulo'),
('V1-FCT-1929','SRC-0173','133 anos de Graciliano Ramos – Prefeitura de São Paulo'),
('V1-FCT-1930','SRC-0659','César Vallejo: la historia detrás de la publicación de sus obras'),
('V1-FCT-1931','SRC-0659','César Vallejo: la historia detrás de la publicación de sus obras'),
('V1-FCT-1932','SRC-0659','César Vallejo: la historia detrás de la publicación de sus obras'),
('V1-FCT-1933','SRC-0659','César Vallejo: la historia detrás de la publicación de sus obras'),
('V1-FCT-1934','SRC-0659','César Vallejo: la historia detrás de la publicación de sus obras'),
('V1-FCT-1935','SRC-0659','César Vallejo: la historia detrás de la publicación de sus obras'),
('V1-FCT-1936','SRC-0181','Azul de Rubén Darío'),
('V1-FCT-1937','SRC-0181','Azul de Rubén Darío'),
('V1-FCT-1938','SRC-0182','El modernismo y Rubén Darío'),
('V1-FCT-1939','SRC-0182','El modernismo y Rubén Darío'),
('V1-FCT-1940','SRC-0182','El modernismo y Rubén Darío'),
('V1-FCT-1941','SRC-0182','El modernismo y Rubén Darío');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0544','V1-FCT-1900','batch_retained_candidate'),
('V1-CARD-0544','V1-FCT-1901','batch_retained_candidate'),
('V1-CARD-0544','V1-FCT-1902','batch_retained_candidate'),
('V1-CARD-0545','V1-FCT-1903','batch_retained_candidate'),
('V1-CARD-0545','V1-FCT-1904','batch_retained_candidate'),
('V1-CARD-0545','V1-FCT-1905','batch_retained_candidate'),
('V1-CARD-0546','V1-FCT-1906','batch_retained_candidate'),
('V1-CARD-0546','V1-FCT-1907','batch_retained_candidate'),
('V1-CARD-0546','V1-FCT-1908','batch_retained_candidate'),
('V1-CARD-0547','V1-FCT-1909','batch_retained_candidate'),
('V1-CARD-0547','V1-FCT-1910','batch_retained_candidate'),
('V1-CARD-0547','V1-FCT-1911','batch_retained_candidate'),
('V1-CARD-0548','V1-FCT-1912','batch_retained_candidate'),
('V1-CARD-0548','V1-FCT-1913','batch_retained_candidate'),
('V1-CARD-0548','V1-FCT-1914','batch_retained_candidate'),
('V1-CARD-0549','V1-FCT-1915','batch_retained_candidate'),
('V1-CARD-0549','V1-FCT-1916','batch_retained_candidate'),
('V1-CARD-0549','V1-FCT-1917','batch_retained_candidate'),
('V1-CARD-0550','V1-FCT-1918','batch_retained_candidate'),
('V1-CARD-0550','V1-FCT-1919','batch_retained_candidate'),
('V1-CARD-0550','V1-FCT-1920','batch_retained_candidate'),
('V1-CARD-0551','V1-FCT-1921','batch_retained_candidate'),
('V1-CARD-0551','V1-FCT-1922','batch_retained_candidate'),
('V1-CARD-0551','V1-FCT-1923','batch_retained_candidate'),
('V1-CARD-0552','V1-FCT-1924','batch_retained_candidate'),
('V1-CARD-0552','V1-FCT-1925','batch_retained_candidate'),
('V1-CARD-0553','V1-FCT-1926','batch_retained_candidate'),
('V1-CARD-0553','V1-FCT-1927','batch_retained_candidate'),
('V1-CARD-0554','V1-FCT-1928','batch_retained_candidate'),
('V1-CARD-0554','V1-FCT-1929','batch_retained_candidate'),
('V1-CARD-0555','V1-FCT-1930','batch_retained_candidate'),
('V1-CARD-0555','V1-FCT-1931','batch_retained_candidate'),
('V1-CARD-0556','V1-FCT-1932','batch_retained_candidate'),
('V1-CARD-0556','V1-FCT-1933','batch_retained_candidate'),
('V1-CARD-0557','V1-FCT-1934','batch_retained_candidate'),
('V1-CARD-0557','V1-FCT-1935','batch_retained_candidate'),
('V1-CARD-0558','V1-FCT-1936','batch_retained_candidate'),
('V1-CARD-0558','V1-FCT-1937','batch_retained_candidate'),
('V1-CARD-0559','V1-FCT-1938','batch_retained_candidate'),
('V1-CARD-0559','V1-FCT-1939','batch_retained_candidate'),
('V1-CARD-0560','V1-FCT-1940','batch_retained_candidate'),
('V1-CARD-0560','V1-FCT-1941','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-1185','WCD10-B09-S001','V1-CARD-0544','SRC-0171','B','bibliography_or_bounded_description','yes','no','SRC-0171','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1186','WCD10-B09-S002','V1-CARD-0544','SRC-0173','B','bibliography_or_bounded_description','yes','no','SRC-0173','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1187','WCD10-B09-S001','V1-CARD-0545','SRC-0171','B','bibliography_or_bounded_description','yes','no','SRC-0171','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1188','WCD10-B09-S002','V1-CARD-0545','SRC-0173','B','bibliography_or_bounded_description','yes','no','SRC-0173','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1189','WCD10-B09-S001','V1-CARD-0546','SRC-0171','B','bibliography_or_bounded_description','yes','no','SRC-0171','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1190','WCD10-B09-S102','V1-CARD-0547','SRC-0660','B','bibliography_or_bounded_description','yes','no','SRC-0660','accepted','NONE'),
('V1-CS-1191','WCD10-B09-S101','V1-CARD-0548','SRC-0659','B','bibliography_or_bounded_description','yes','no','SRC-0659','accepted','NONE'),
('V1-CS-1192','WCD10-B09-S103','V1-CARD-0548','SRC-0661','B','bibliography_or_bounded_description','yes','no','SRC-0661','accepted','NONE'),
('V1-CS-1193','WCD10-B09-S101','V1-CARD-0549','SRC-0659','B','bibliography_or_bounded_description','yes','no','SRC-0659','accepted','NONE'),
('V1-CS-1194','WCD10-B09-S102','V1-CARD-0549','SRC-0660','B','bibliography_or_bounded_description','yes','no','SRC-0660','accepted','NONE'),
('V1-CS-1195','WCD10-B09-S201','V1-CARD-0550','SRC-0182','B','bibliography_or_bounded_description','yes','no','SRC-0182','accepted','NONE'),
('V1-CS-1196','WCD10-B09-S203','V1-CARD-0551','SRC-0662','B','bibliography_or_bounded_description','yes','no','SRC-0662','accepted','NONE'),
('V1-CS-1197','WCD10-B09-S003','V1-CARD-0552','SRC-0172','B','bibliography_or_bounded_description','yes','no','SRC-0172','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1198','WCD10-B09-S002','V1-CARD-0553','SRC-0173','B','bibliography_or_bounded_description','yes','no','SRC-0173','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1199','WCD10-B09-S002','V1-CARD-0554','SRC-0173','B','bibliography_or_bounded_description','yes','no','SRC-0173','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1200','WCD10-B09-S101','V1-CARD-0555','SRC-0659','B','bibliography_or_bounded_description','yes','no','SRC-0659','accepted','NONE'),
('V1-CS-1201','WCD10-B09-S101','V1-CARD-0556','SRC-0659','B','bibliography_or_bounded_description','yes','no','SRC-0659','accepted','NONE'),
('V1-CS-1202','WCD10-B09-S101','V1-CARD-0557','SRC-0659','B','bibliography_or_bounded_description','yes','no','SRC-0659','accepted','NONE'),
('V1-CS-1203','WCD10-B09-S202','V1-CARD-0558','SRC-0181','B','bibliography_or_bounded_description','yes','no','SRC-0181','accepted','NONE'),
('V1-CS-1204','WCD10-B09-S201','V1-CARD-0559','SRC-0182','B','bibliography_or_bounded_description','yes','no','SRC-0182','accepted','NONE'),
('V1-CS-1205','WCD10-B09-S201','V1-CARD-0560','SRC-0182','B','bibliography_or_bounded_description','yes','no','SRC-0182','accepted','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0571','WCD-10-B09','WCD10-B09-W001-CREATED','V1-ENT-0213','CREATED','V1-ENT-0602','格拉西利亚诺·拉莫斯创作 Caetés','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0572','WCD-10-B09','WCD10-B09-W002-CREATED','V1-ENT-0213','CREATED','V1-ENT-0603','格拉西利亚诺·拉莫斯创作 Memórias do Cárcere','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0573','WCD-10-B09','WCD10-B09-W003-CREATED','V1-ENT-0213','CREATED','V1-ENT-0604','格拉西利亚诺·拉莫斯创作 Infância','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0574','WCD-10-B09','WCD10-B09-W101-CREATED','V1-ENT-0223','CREATED','V1-ENT-0605','塞萨尔·巴列霍创作《El tungsteno》','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0575','WCD-10-B09','WCD10-B09-W102-CREATED','V1-ENT-0223','CREATED','V1-ENT-0606','塞萨尔·巴列霍创作《España, aparta de mí este cáliz》','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0576','WCD-10-B09','WCD10-B09-W103-CREATED','V1-ENT-0223','CREATED','V1-ENT-0607','塞萨尔·巴列霍创作《Escalas》','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0577','WCD-10-B09','WCD10-B09-W201-CREATED','V1-ENT-0224','CREATED','V1-ENT-0608','达里奥后期主要抒情诗集之一，1907年出版。','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0578','WCD-10-B09','WCD10-B09-W202-CREATED','V1-ENT-0224','CREATED','V1-ENT-0609','达里奥1910年出版的诗歌作品集，书名含“及其他诗作”。','high','accepted','Codex-parent-independent-review:PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0571','SRC-0171'),
('V1-REL-0571','SRC-0173'),
('V1-REL-0572','SRC-0171'),
('V1-REL-0572','SRC-0173'),
('V1-REL-0573','SRC-0171'),
('V1-REL-0574','SRC-0660'),
('V1-REL-0575','SRC-0659'),
('V1-REL-0575','SRC-0661'),
('V1-REL-0576','SRC-0659'),
('V1-REL-0576','SRC-0660'),
('V1-REL-0577','SRC-0182'),
('V1-REL-0578','SRC-0662');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0864','V1-REL-0571','WCD10-B09-S001','SRC-0171','Graciliano Ramos – BNDigital','direct bibliographic and biographical authority; opened lines 47–50 directly list Caetés (1933), São Bernardo (1934), Angústia (1936), Vidas Secas (1938), Memórias do Cárcere (1953, posthumous), Infância (1945), and Viagem (1954); line 49 describes prison memoir; line 50 identifies Infância as autobiographical.','格拉西利亚诺·拉莫斯创作 Caetés','high','eligible_evidence','WCD-10-B09'),
('V1-EV-0865','V1-REL-0571','WCD10-B09-S002','SRC-0173','133 anos de Graciliano Ramos – Prefeitura de São Paulo','opened lines 109–123: Caetés 1933 novel debut and description; São Bernardo story of farmer Paulo Honório; Angústia protagonist Luís da Silva; Vidas Secas family of retirantes; Memórias do Cárcere posthumous and prison experience.','格拉西利亚诺·拉莫斯创作 Caetés','high','eligible_evidence','WCD-10-B09'),
('V1-EV-0866','V1-REL-0572','WCD10-B09-S001','SRC-0171','Graciliano Ramos – BNDigital','direct bibliographic and biographical authority; opened lines 47–50 directly list Caetés (1933), São Bernardo (1934), Angústia (1936), Vidas Secas (1938), Memórias do Cárcere (1953, posthumous), Infância (1945), and Viagem (1954); line 49 describes prison memoir; line 50 identifies Infância as autobiographical.','格拉西利亚诺·拉莫斯创作 Memórias do Cárcere','high','eligible_evidence','WCD-10-B09'),
('V1-EV-0867','V1-REL-0572','WCD10-B09-S002','SRC-0173','133 anos de Graciliano Ramos – Prefeitura de São Paulo','opened lines 109–123: Caetés 1933 novel debut and description; São Bernardo story of farmer Paulo Honório; Angústia protagonist Luís da Silva; Vidas Secas family of retirantes; Memórias do Cárcere posthumous and prison experience.','格拉西利亚诺·拉莫斯创作 Memórias do Cárcere','high','eligible_evidence','WCD-10-B09'),
('V1-EV-0868','V1-REL-0573','WCD10-B09-S001','SRC-0171','Graciliano Ramos – BNDigital','direct bibliographic and biographical authority; opened lines 47–50 directly list Caetés (1933), São Bernardo (1934), Angústia (1936), Vidas Secas (1938), Memórias do Cárcere (1953, posthumous), Infância (1945), and Viagem (1954); line 49 describes prison memoir; line 50 identifies Infância as autobiographical.','格拉西利亚诺·拉莫斯创作 Infância','high','eligible_evidence','WCD-10-B09'),
('V1-EV-0869','V1-REL-0574','WCD10-B09-S102','SRC-0660','La narrativa peruana contemporánea. Cuento y novela (1920-2000)','已直接打开PDF；P39第1109–1119行讨论《El tungsteno》及矿区、Mining Society与Soras；P4版权页列出版机构/协调人；访问日期2026-10-12。','塞萨尔·巴列霍创作《El tungsteno》','high','eligible_evidence','WCD-10-B09'),
('V1-EV-0870','V1-REL-0575','WCD10-B09-S101','SRC-0659','César Vallejo: la historia detrás de la publicación de sus obras','已直接打开；网页第41–44行《Los heraldos negros》，第48–53行《Trilce》，第56–60行《Escalas》，第68–75行《Poemas humanos》与《España, aparta de mí este cáliz》；访问日期2026-10-12。','塞萨尔·巴列霍创作《España, aparta de mí este cáliz》','high','eligible_evidence','WCD-10-B09'),
('V1-EV-0871','V1-REL-0575','WCD10-B09-S103','SRC-0661','España, aparta de mí este cáliz : poemas','已直接打开BNP数字馆藏书目项；第18–20行显示题名与PDF，第35–47行显示1939、作者及西班牙内战诗歌主题；访问日期2026-10-12。','塞萨尔·巴列霍创作《España, aparta de mí este cáliz》','high','eligible_evidence','WCD-10-B09'),
('V1-EV-0872','V1-REL-0576','WCD10-B09-S101','SRC-0659','César Vallejo: la historia detrás de la publicación de sus obras','已直接打开；网页第41–44行《Los heraldos negros》，第48–53行《Trilce》，第56–60行《Escalas》，第68–75行《Poemas humanos》与《España, aparta de mí este cáliz》；访问日期2026-10-12。','塞萨尔·巴列霍创作《Escalas》','high','eligible_evidence','WCD-10-B09'),
('V1-EV-0873','V1-REL-0576','WCD10-B09-S102','SRC-0660','La narrativa peruana contemporánea. Cuento y novela (1920-2000)','已直接打开PDF；P39第1109–1119行讨论《El tungsteno》及矿区、Mining Society与Soras；P4版权页列出版机构/协调人；访问日期2026-10-12。','塞萨尔·巴列霍创作《Escalas》','high','eligible_evidence','WCD-10-B09'),
('V1-EV-0874','V1-REL-0577','WCD10-B09-S201','SRC-0182','El modernismo y Rubén Darío','PDF第31页（Memoria Chilena全文行625–643；实读日期2026-10-12）。直接列1896《世俗的颂歌》、1905《生命与希望之歌》、1907《流浪之歌》、1910《秋之诗篇》，称后两者与前书为主要抒情作品；亦说明其散文报刊作品集。','达里奥后期主要抒情诗集之一，1907年出版。','high','eligible_evidence','WCD-10-B09'),
('V1-EV-0875','V1-REL-0578','WCD10-B09-S203','SRC-0662','Rubén Darío y su obra','正文第86行；实读日期2026-10-12。页面以链接条目标明 Poema del otoño y otros poemas (1910)。','达里奥1910年出版的诗歌作品集，书名含“及其他诗作”。','high','eligible_evidence','WCD-10-B09');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0357','WCD-10-B09:V1-ENT-0220','research_gap','WCD10:work_level_research:V1-ENT-0220','open','No dedicated work-specific academic study added; institutional description is sufficient for this bounded candidate.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0358','WCD-10-B09:V1-ENT-0221','research_gap','WCD10:work_level_research:V1-ENT-0221','open','No dedicated work-specific academic study added; institutional description is sufficient for this bounded candidate.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0359','WCD-10-B09:V1-ENT-0222','research_gap','WCD10:work_level_research:V1-ENT-0222','open','No dedicated work-specific academic study added; institutional description is sufficient for this bounded candidate.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0360','WCD-10-B09:WCD10-B09-W001','research_gap','WCD10:work_level_research:V1-ENT-0602','open','No dedicated work-specific academic study added; institutional description is sufficient for this bounded candidate.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0361','WCD-10-B09:WCD10-B09-W002','research_gap','WCD10:work_level_research:V1-ENT-0603','open','No dedicated work-specific academic study added; institutional description is sufficient for this bounded candidate.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0362','WCD-10-B09:WCD10-B09-W003','research_gap','WCD10:work_level_research:V1-ENT-0604','open','No dedicated work-specific academic study added; institutional description is sufficient for this bounded candidate.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0363','WCD-10-B09:V1-ENT-0226','research_gap','WCD10:work_level_research:V1-ENT-0226','open','作品描述依据机构展览页；沿用基线 V1-GAP-0015，1918题名年份与1919实际印行的冲突本批继续保留、不作裁定；对象级学术研究缺口仍开放。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0364','WCD-10-B09:V1-ENT-0227','research_gap','WCD10:work_level_research:V1-ENT-0227','open','保留原有书目事实与来源链；本轮仅补有归属的机构概述，未核验该对象的专门学术研究，作品级研究范围仍开放。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0365','WCD-10-B09:V1-ENT-0228','research_gap','WCD10:work_level_research:V1-ENT-0228','open','说明诗作写作时段与诗集出版年份不同；保留基线1939出版序列书目事实与完整来源链。机构概述不替代对象级专门研究，后者保持开放。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0366','WCD-10-B09:WCD10-B09-W101','research_gap','WCD10:work_level_research:V1-ENT-0605','open','本条是来源明确的普通书目/机构描述候选，尚无独立专门作品研究核验；保持作品级研究与策展准入开放。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0367','WCD-10-B09:WCD10-B09-W102','research_gap','WCD10:work_level_research:V1-ENT-0606','open','本条是来源明确的普通书目/机构描述候选，尚无独立专门作品研究核验；保持作品级研究与策展准入开放。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0368','WCD-10-B09:WCD10-B09-W103','research_gap','WCD10:work_level_research:V1-ENT-0607','open','本条是来源明确的普通书目/机构描述候选，尚无独立专门作品研究核验；保持作品级研究与策展准入开放。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0369','WCD-10-B09:V1-ENT-0229','research_gap','WCD10:work_level_research:V1-ENT-0229','open','Parent batch review; all old entity facts, cards, relations, and source chains remain intact.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0370','WCD-10-B09:V1-ENT-0230','research_gap','WCD10:work_level_research:V1-ENT-0230','open','Parent batch review; all old entity facts, cards, relations, and source chains remain intact.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0371','WCD-10-B09:V1-ENT-0231','research_gap','WCD10:work_level_research:V1-ENT-0231','open','Parent batch review; all old entity facts, cards, relations, and source chains remain intact.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0372','WCD-10-B09:WCD10-B09-W201','research_gap','WCD10:work_level_research:V1-ENT-0608','open','Confirm duplicate identity and perform centralized batch review before admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0373','WCD-10-B09:WCD10-B09-W202','research_gap','WCD10:work_level_research:V1-ENT-0609','open','Parent review should confirm collective title distinction; no separate same-title poem is asserted.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');

UPDATE metadata SET value='WCD-10-B09' WHERE key='last_change_set';

UPDATE metadata SET value='2026-10-12' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 660 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 607 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 605 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 560 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1935 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 2371 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1914 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1197 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 576 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 904 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 875 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 373 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
