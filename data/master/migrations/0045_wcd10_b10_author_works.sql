-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: Codex-parent-independent-review

-- Registration sha256: 720e1dd27c48773aff5b6ce0f3d15765090b1f1a645289986eaca6a887208c52

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1914 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1197 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 560 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 607 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 605 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 2371 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1935 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 373 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 44 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 875 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 904 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 576 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 660 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B09' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0663' OR canonical_url='https://www.cervantesvirtual.com/obra/amistad-funesta-novela--0/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0664' OR canonical_url='https://www.cervantesvirtual.com/obra/la-edad-de-oro-publicacion-mensual-dedicada-a-los-ninos--0/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0665' OR canonical_url='https://catalogo.bnphu.gob.do/cgi-bin/koha/opac-detail.pl?biblionumber=11683&query_desc=') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0666' OR canonical_url='https://cervantesvirtual.com/obra/abdala--0/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0667' OR canonical_url='https://www.cervantesvirtual.com/obra-visor/amistad-funesta-novela--0/html/fef79342-82b1-11df-acc7-002185ce6064_2.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0668' OR canonical_url='https://www.cervantesvirtual.com/obra-visor/diccionario-de-la-literatura-cubana--0/html/254m.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0669' OR canonical_url='https://www.educ.ar/recursos/151773/versos-sencillos-de-jose-marti') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0670' OR canonical_url='https://bcn.gob.ar/la-biblioteca/publicaciones/coleccion-pensamiento-del-bicentenario/nuestra-america') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0671' OR canonical_url='https://www.poeticous.com/marti/books/ismaelillo?locale=es') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0672' OR canonical_url='https://www.cervantesvirtual.com/obra-visor/amistad-funesta-novela--0/html/fef79342-82b1-11df-acc7-002185ce6064_3.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0673' OR canonical_url='https://www.cervantesvirtual.com/obra-visor/abdala--0/html/fef77c2c-82b1-11df-acc7-002185ce6064_2.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0674' OR canonical_url='https://cvc.cervantes.es/literatura/escritores/pizarnik/obra/arbol.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0675' OR canonical_url='https://cvc.cervantes.es/literatura/escritores/pizarnik/obra/trabajos.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0676' OR canonical_url='https://cvc.cervantes.es/literatura/escritores/pizarnik/biografia.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0677' OR canonical_url='https://cvc.cervantes.es/literatura/escritores/pizarnik/obra/inocencia.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0678' OR canonical_url='https://cvc.cervantes.es/literatura/escritores/pizarnik/obra/aventuras.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0679' OR canonical_url='https://cvc.cervantes.es/literatura/escritores/pizarnik/obra/condesa.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0680' OR canonical_url='https://cvc.cervantes.es/literatura/escritores/pizarnik/acerca/martinez.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0681' OR canonical_url='https://cvc.cervantes.es/literatura/escritores/pizarnik/acerca/barella.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0610' OR (entity_type='work' AND original_name='Amistad funesta')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0611' OR (entity_type='collection' AND original_name='La Edad de Oro')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0612' OR (entity_type='work' AND original_name='Abdala')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0613' OR (entity_type='collection' AND original_name='La cueca larga')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0614' OR (entity_type='collection' AND original_name='Obra gruesa')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0615' OR (entity_type='collection' AND original_name='Sermones y prédicas del Cristo de Elqui')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0616' OR (entity_type='collection' AND original_name='Artefactos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0617' OR (entity_type='collection' AND original_name='La tierra más ajena')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0618' OR (entity_type='collection' AND original_name='La última inocencia')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0619' OR (entity_type='collection' AND original_name='Las aventuras perdidas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0620' OR (entity_type='work' AND original_name='La condesa sangrienta')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0621' OR (entity_type='collection' AND original_name='El infierno musical')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1942' OR (subject_id='V1-ENT-0610' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1943' OR (subject_id='V1-ENT-0610' AND fact_field='bibliographic_note' AND value_text='BVMC将该作品著录为Martí所作小说；数字文本据柏林1911年版制作，1911年是所据版本信息，本候选不将其认作首刊年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1944' OR (subject_id='V1-ENT-0610' AND fact_field='first_publication_year' AND value_text='1885')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1945' OR (subject_id='V1-ENT-0610' AND fact_field='one_sentence_summary' AND value_text='小说第一章围绕Lucía Jerez、Juan Jerez、Ana与Adela等人的交往展开，并写到Juan为Sol del Valle母亲求情。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1946' OR (subject_id='V1-ENT-0611' AND fact_field='first_publication_year' AND value_text='1889')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1947' OR (subject_id='V1-ENT-0611' AND fact_field='one_sentence_summary' AND value_text='这份面向美洲儿童的刊物由Martí撰写，共刊四期，1889年7月至10月在纽约出版，内容包含故事、历史与艺术等栏目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1948' OR (subject_id='V1-ENT-0611' AND fact_field='genre_or_form' AND value_text='面向儿童的月刊（四期）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1949' OR (subject_id='V1-ENT-0612' AND fact_field='genre_or_form' AND value_text='戏剧')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1950' OR (subject_id='V1-ENT-0612' AND fact_field='first_publication_year' AND value_text='1869')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1951' OR (subject_id='V1-ENT-0612' AND fact_field='one_sentence_summary' AND value_text='戏剧以Nubia遭征服者威胁为背景，写Abdala率军出战保卫祖国。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1952' OR (subject_id='V1-ENT-0613' AND fact_field='first_publication_year' AND value_text='1958')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1953' OR (subject_id='V1-ENT-0613' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1954' OR (subject_id='V1-ENT-0613' AND fact_field='one_sentence_summary' AND value_text='智利国家图书馆专题指出，此书取材于智利民间欢庆节奏，并以戏仿方式加以呈现。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1955' OR (subject_id='V1-ENT-0613' AND fact_field='bibliographic_note' AND value_text='智利大学目录列1958年《La Cueca Larga》；国家图书馆专题同年列入作者作品序列。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1956' OR (subject_id='V1-ENT-0614' AND fact_field='first_publication_year' AND value_text='1969')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1957' OR (subject_id='V1-ENT-0614' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1958' OR (subject_id='V1-ENT-0614' AND fact_field='one_sentence_summary' AND value_text='智利国家图书馆将其列入帕拉的诗作序列，并概括这些作品呈现反诗模式及其演进。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1959' OR (subject_id='V1-ENT-0614' AND fact_field='bibliographic_note' AND value_text='智利大学作者主要作品目录列《Obra Gruesa》（1969，Universitaria）。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1960' OR (subject_id='V1-ENT-0615' AND fact_field='first_publication_year' AND value_text='1977')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1961' OR (subject_id='V1-ENT-0615' AND fact_field='genre_or_form' AND value_text='诗歌作品集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1962' OR (subject_id='V1-ENT-0615' AND fact_field='one_sentence_summary' AND value_text='智利国家图书馆将此书列为1977年作品，并置于呈现反诗模式及其演进的诗作序列中。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1963' OR (subject_id='V1-ENT-0615' AND fact_field='bibliographic_note' AND value_text='智利大学目录记1979年版本，并注明初版为1977年；国家图书馆作者专题亦列1977年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1964' OR (subject_id='V1-ENT-0616' AND fact_field='first_publication_year' AND value_text='1972')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1965' OR (subject_id='V1-ENT-0616' AND fact_field='genre_or_form' AND value_text='明信片形式的诗歌作品集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1966' OR (subject_id='V1-ENT-0616' AND fact_field='one_sentence_summary' AND value_text='《Artefactos》于1972年以明信片形式出版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1967' OR (subject_id='V1-ENT-0617' AND fact_field='first_publication_year' AND value_text='1955')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1968' OR (subject_id='V1-ENT-0617' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1969' OR (subject_id='V1-ENT-0617' AND fact_field='one_sentence_summary' AND value_text='CVC资料称本作为皮扎尼克1955年出版的第一部诗集。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1970' OR (subject_id='V1-ENT-0618' AND fact_field='first_publication_year' AND value_text='1956')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1971' OR (subject_id='V1-ENT-0618' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1972' OR (subject_id='V1-ENT-0618' AND fact_field='one_sentence_summary' AND value_text='CVC评论将书名联系到兰波《地狱一季》中的“最后的纯真”表述，并围绕梦境与记忆意象展开讨论。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1973' OR (subject_id='V1-ENT-0619' AND fact_field='first_publication_year' AND value_text='1958')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1974' OR (subject_id='V1-ENT-0619' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1975' OR (subject_id='V1-ENT-0619' AND fact_field='one_sentence_summary' AND value_text='CVC评论以精神分析、超现实主义意象及镜像联想介绍本集，并提到诗中迷失方向的意象。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1976' OR (subject_id='V1-ENT-0620' AND fact_field='first_book_edition_year' AND value_text='1971')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1977' OR (subject_id='V1-ENT-0620' AND fact_field='genre_or_form' AND value_text='散文（CVC称essay-poem-novel）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1978' OR (subject_id='V1-ENT-0620' AND fact_field='one_sentence_summary' AND value_text='CVC评论称文本围绕Erzsébet Báthory展开，并将其称作essay-poem-novel。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1979' OR (subject_id='V1-ENT-0620' AND fact_field='bibliographic_note' AND value_text='CVC记载该作品曾于1965年有一次“primer avance mexicano”，后于1966年刊于Testigo，并于1971年以单行本出版。因来源没有说明1965年预告与1966年刊载的文本关系，本候选不填原子first_publication_year。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1980' OR (subject_id='V1-ENT-0621' AND fact_field='first_publication_year' AND value_text='1971')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1981' OR (subject_id='V1-ENT-0621' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1982' OR (subject_id='V1-ENT-0621' AND fact_field='one_sentence_summary' AND value_text='CVC文章将“Cold in hand blues”标为本集诗篇，并讨论皮扎尼克如何以语言承载诗歌意象；概述限于该评论范围。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1983' OR (subject_id='V1-ENT-0232' AND fact_field='one_sentence_summary' AND value_text='本诗集由面向儿子的抒情诗篇组成，诗中多次直接呼唤儿子并写父子亲情。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1984' OR (subject_id='V1-ENT-0233' AND fact_field='one_sentence_summary' AND value_text='这些短诗以简洁明白的语言书写伦理理想、友情与个人悲痛。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1985' OR (subject_id='V1-ENT-0234' AND fact_field='one_sentence_summary' AND value_text='这篇抒情政论文章借历史与现实分析阐述Martí对拉丁美洲社会政治及其未来的思考。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1986' OR (subject_id='V1-ENT-0239' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1987' OR (subject_id='V1-ENT-0239' AND fact_field='one_sentence_summary' AND value_text='智利国家图书馆称《诗歌与反诗歌》（1954）开启帕拉的反诗模式，其诗句带有讽刺，采用日常、直接的语言。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1988' OR (subject_id='V1-ENT-0240' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1989' OR (subject_id='V1-ENT-0240' AND fact_field='one_sentence_summary' AND value_text='国家图书馆作者专题将《沙龙篇》（1962）列入《诗歌与反诗歌》之后的作品，并概述帕拉此后诗作延展反诗模式。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1990' OR (subject_id='V1-ENT-0242' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1991' OR (subject_id='V1-ENT-0242' AND fact_field='one_sentence_summary' AND value_text='CVC评论借奥克塔维奥·帕斯的序言讨论书名象征，并提到作品中的色彩意象与绘画题献；此处仅概述该评论内容。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1992' OR (subject_id='V1-ENT-0243' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1993' OR (subject_id='V1-ENT-0243' AND fact_field='one_sentence_summary' AND value_text='CVC评论指出，本集以爱情表达和对话、静默意象交织，并特别提到作品对语音与节奏的经营。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1994' OR (subject_id='V1-ENT-0244' AND fact_field='genre_or_form' AND value_text='诗集（含散文化表达）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1995' OR (subject_id='V1-ENT-0244' AND fact_field='one_sentence_summary' AND value_text='CVC评论以象征意象描述本书中的痛苦与无力，并指出作品从韵文化表达延展到散文形式。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0579' OR (subject_id='V1-ENT-0225' AND relation_type='CREATED' AND object_id='V1-ENT-0610')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0580' OR (subject_id='V1-ENT-0225' AND relation_type='CREATED' AND object_id='V1-ENT-0611')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0581' OR (subject_id='V1-ENT-0225' AND relation_type='CREATED' AND object_id='V1-ENT-0612')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0582' OR (subject_id='V1-ENT-0236' AND relation_type='CREATED' AND object_id='V1-ENT-0613')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0583' OR (subject_id='V1-ENT-0236' AND relation_type='CREATED' AND object_id='V1-ENT-0614')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0584' OR (subject_id='V1-ENT-0236' AND relation_type='CREATED' AND object_id='V1-ENT-0615')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0585' OR (subject_id='V1-ENT-0236' AND relation_type='CREATED' AND object_id='V1-ENT-0616')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0586' OR (subject_id='V1-ENT-0237' AND relation_type='CREATED' AND object_id='V1-ENT-0617')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0587' OR (subject_id='V1-ENT-0237' AND relation_type='CREATED' AND object_id='V1-ENT-0618')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0588' OR (subject_id='V1-ENT-0237' AND relation_type='CREATED' AND object_id='V1-ENT-0619')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0589' OR (subject_id='V1-ENT-0237' AND relation_type='CREATED' AND object_id='V1-ENT-0620')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0590' OR (subject_id='V1-ENT-0237' AND relation_type='CREATED' AND object_id='V1-ENT-0621')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0663','WCD10-B10-S001','Amistad funesta : novela / José Martí | Biblioteca Virtual Miguel de Cervantes','Amistad funesta : novela / José Martí | Biblioteca Virtual Miguel de Cervantes','Biblioteca Virtual Miguel de Cervantes','','Biblioteca Virtual Miguel de Cervantes','','','institutional_catalog_web_page','','es','B','access_pass','WCD-10-B10','B10 Research candidate metadata only; no public admission implied.','remote_only','','https://www.cervantesvirtual.com/obra/amistad-funesta-novela--0/'),
('SRC-0664','WCD10-B10-S002','La Edad de Oro : publicación mensual ... dedicada a los niños / José Martí | Biblioteca Virtual Miguel de Cervantes','La Edad de Oro : publicación mensual ... dedicada a los niños / José Martí | Biblioteca Virtual Miguel de Cervantes','Biblioteca Virtual Miguel de Cervantes','','Biblioteca Virtual Miguel de Cervantes','','','institutional_catalog_web_page','','es','B','access_pass','WCD-10-B10','B10 Research candidate metadata only; no public admission implied.','remote_only','','https://www.cervantesvirtual.com/obra/la-edad-de-oro-publicacion-mensual-dedicada-a-los-ninos--0/'),
('SRC-0665','WCD10-B10-S003','La edad de oro / José Martí | Biblioteca Pedro Henríquez Ureña catalog','La edad de oro / José Martí | Biblioteca Pedro Henríquez Ureña catalog','Biblioteca Pedro Henríquez Ureña','','Biblioteca Pedro Henríquez Ureña','','','institutional_catalog_web_page','','es','B','access_pass','WCD-10-B10','B10 Research candidate metadata only; no public admission implied.','remote_only','','https://catalogo.bnphu.gob.do/cgi-bin/koha/opac-detail.pl?biblionumber=11683&query_desc='),
('SRC-0666','WCD10-B10-S004','Abdala / José Martí | Biblioteca Virtual Miguel de Cervantes','Abdala / José Martí | Biblioteca Virtual Miguel de Cervantes','Biblioteca Virtual Miguel de Cervantes','','Biblioteca Virtual Miguel de Cervantes','','','institutional_catalog_web_page','','es','B','access_pass','WCD-10-B10','B10 Research candidate metadata only; no public admission implied.','remote_only','','https://cervantesvirtual.com/obra/abdala--0/'),
('SRC-0667','WCD10-B10-S005','Amistad funesta : novela | Biblioteca Virtual Miguel de Cervantes (texto e introducción)','Amistad funesta : novela | Biblioteca Virtual Miguel de Cervantes (texto e introducción)','Biblioteca Virtual Miguel de Cervantes','','Biblioteca Virtual Miguel de Cervantes','','','institutional_digital_text_or_reference_web_page','','es','B','access_pass','WCD-10-B10','B10 Research candidate metadata only; no public admission implied.','remote_only','','https://www.cervantesvirtual.com/obra-visor/amistad-funesta-novela--0/html/fef79342-82b1-11df-acc7-002185ce6064_2.html'),
('SRC-0668','WCD10-B10-S006','Diccionario de la literatura cubana | Biblioteca Virtual Miguel de Cervantes','Diccionario de la literatura cubana | Biblioteca Virtual Miguel de Cervantes','Biblioteca Virtual Miguel de Cervantes','','Biblioteca Virtual Miguel de Cervantes','','','institutional_digital_text_or_reference_web_page','','es','B','access_pass','WCD-10-B10','B10 Research candidate metadata only; no public admission implied.','remote_only','','https://www.cervantesvirtual.com/obra-visor/diccionario-de-la-literatura-cubana--0/html/254m.htm'),
('SRC-0669','WCD10-B10-S008','Versos sencillos, de José Martí | Educ.ar','Versos sencillos, de José Martí | Educ.ar','Educ.ar, Portal educativo de la Secretaría de Educación','','Educ.ar, Portal educativo de la Secretaría de Educación','','','institutional_education_web_page','','es','B','access_pass','WCD-10-B10','B10 Research candidate metadata only; no public admission implied.','remote_only','','https://www.educ.ar/recursos/151773/versos-sencillos-de-jose-marti'),
('SRC-0670','WCD10-B10-S009','Nuestra América | Biblioteca del Congreso de la Nación','Nuestra América | Biblioteca del Congreso de la Nación','Biblioteca del Congreso de la Nación','','Biblioteca del Congreso de la Nación','','','institutional_library_web_page','','es','B','access_pass','WCD-10-B10','B10 Research candidate metadata only; no public admission implied.','remote_only','','https://bcn.gob.ar/la-biblioteca/publicaciones/coleccion-pensamiento-del-bicentenario/nuestra-america'),
('SRC-0671','WCD10-B10-S010','Ismaelillo | José Martí | Poeticous','Ismaelillo | José Martí | Poeticous','Poeticous','','Poeticous','','','digital_literary_text_web_page','','es','B','access_pass','WCD-10-B10','B10 Research candidate metadata only; no public admission implied.','remote_only','','https://www.poeticous.com/marti/books/ismaelillo?locale=es'),
('SRC-0672','WCD10-B10-S011','Amistad funesta : novela, Capítulo I | Biblioteca Virtual Miguel de Cervantes','Amistad funesta : novela, Capítulo I | Biblioteca Virtual Miguel de Cervantes','Biblioteca Virtual Miguel de Cervantes','','Biblioteca Virtual Miguel de Cervantes','','','institutional_digital_literary_text_web_page','','es','B','access_pass','WCD-10-B10','B10 Research candidate metadata only; no public admission implied.','remote_only','','https://www.cervantesvirtual.com/obra-visor/amistad-funesta-novela--0/html/fef79342-82b1-11df-acc7-002185ce6064_3.html'),
('SRC-0673','WCD10-B10-S012','Abdala, Escena I-II | Biblioteca Virtual Miguel de Cervantes','Abdala, Escena I-II | Biblioteca Virtual Miguel de Cervantes','Biblioteca Virtual Miguel de Cervantes','','Biblioteca Virtual Miguel de Cervantes','','','institutional_digital_literary_text_web_page','','es','B','access_pass','WCD-10-B10','B10 Research candidate metadata only; no public admission implied.','remote_only','','https://www.cervantesvirtual.com/obra-visor/abdala--0/html/fef77c2c-82b1-11df-acc7-002185ce6064_2.html'),
('SRC-0674','WCD10-B10-S202','CVC. Alejandra Pizarnik. Obra. Árbol de Diana','CVC. Alejandra Pizarnik. Obra. Árbol de Diana','Antonio Beneyto；Centro Virtual Cervantes','','Instituto Cervantes','','','institutional_author_commentary_web_page','','es','B','access_pass','WCD-10-B10','B10 Research candidate metadata only; no public admission implied.','remote_only','','https://cvc.cervantes.es/literatura/escritores/pizarnik/obra/arbol.htm'),
('SRC-0675','WCD10-B10-S203','CVC. Alejandra Pizarnik. Obra. Los trabajos y las noches','CVC. Alejandra Pizarnik. Obra. Los trabajos y las noches','Antonio Beneyto；Centro Virtual Cervantes','','Instituto Cervantes','','','institutional_author_commentary_web_page','','es','B','access_pass','WCD-10-B10','B10 Research candidate metadata only; no public admission implied.','remote_only','','https://cvc.cervantes.es/literatura/escritores/pizarnik/obra/trabajos.htm'),
('SRC-0676','WCD10-B10-S204','CVC. Alejandra Pizarnik. Biografía literaria','CVC. Alejandra Pizarnik. Biografía literaria','Centro Virtual Cervantes','','Instituto Cervantes','','','institutional_author_commentary_web_page','','es','B','access_pass','WCD-10-B10','B10 Research candidate metadata only; no public admission implied.','remote_only','','https://cvc.cervantes.es/literatura/escritores/pizarnik/biografia.htm'),
('SRC-0677','WCD10-B10-S205','CVC. Alejandra Pizarnik. Obra. La última inocencia','CVC. Alejandra Pizarnik. Obra. La última inocencia','Antonio Beneyto；Centro Virtual Cervantes','','Instituto Cervantes','','','institutional_author_commentary_web_page','','es','B','access_pass','WCD-10-B10','B10 Research candidate metadata only; no public admission implied.','remote_only','','https://cvc.cervantes.es/literatura/escritores/pizarnik/obra/inocencia.htm'),
('SRC-0678','WCD10-B10-S206','CVC. Alejandra Pizarnik. Obra. Las aventuras perdidas','CVC. Alejandra Pizarnik. Obra. Las aventuras perdidas','Antonio Beneyto；Centro Virtual Cervantes','','Instituto Cervantes','','','institutional_author_commentary_web_page','','es','B','access_pass','WCD-10-B10','B10 Research candidate metadata only; no public admission implied.','remote_only','','https://cvc.cervantes.es/literatura/escritores/pizarnik/obra/aventuras.htm'),
('SRC-0679','WCD10-B10-S207','CVC. Alejandra Pizarnik. Obra. La condesa sangrienta','CVC. Alejandra Pizarnik. Obra. La condesa sangrienta','Centro Virtual Cervantes','','Instituto Cervantes','','','institutional_author_commentary_web_page','','es','B','access_pass','WCD-10-B10','B10 Research candidate metadata only; no public admission implied.','remote_only','','https://cvc.cervantes.es/literatura/escritores/pizarnik/obra/condesa.htm'),
('SRC-0680','WCD10-B10-S208','CVC. Alejandra Pizarnik: leyenda de una vida tras de su obra','CVC. Alejandra Pizarnik: leyenda de una vida tras de su obra','Gustavo Martínez González；Centro Virtual Cervantes','','Instituto Cervantes','','','institutional_author_commentary_web_page','','es','B','access_pass','WCD-10-B10','B10 Research candidate metadata only; no public admission implied.','remote_only','','https://cvc.cervantes.es/literatura/escritores/pizarnik/acerca/martinez.htm'),
('SRC-0681','WCD10-B10-S209','CVC. Alejandra Pizarnik escondida en el lenguaje','CVC. Alejandra Pizarnik escondida en el lenguaje','Julia Barella；Centro Virtual Cervantes','','Instituto Cervantes','','','institutional_author_commentary_web_page','','es','B','access_pass','WCD-10-B10','B10 Research candidate metadata only; no public admission implied.','remote_only','','https://cvc.cervantes.es/literatura/escritores/pizarnik/acerca/barella.htm');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0610','work','《不幸的友谊》','Amistad funesta','candidate','1','WCD10-B10-W001','Martí重要小说；BVMC馆藏目录直接署名并标注小说层级。; 中文名为检索暂译，西班牙语原题为身份锚点，不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0611','collection','《黄金时代》','La Edad de Oro','candidate','1','WCD10-B10-W002','Martí面向儿童的重要刊物；BVMC和国家图书馆目录支持作者、形态及刊行信息。; 中文名作为检索译名；保留西班牙语原题。目录说明其为儿童月刊，合计四期。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0612','work','《阿卜达拉》','Abdala','candidate','1','WCD10-B10-W003','Martí早期戏剧作品；BVMC馆藏记录直接署名并分类为19世纪古巴戏剧。; 中文名为暂译，保留原题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0613','collection','《长奎卡舞曲》','La cueca larga','candidate','1','WCD10-B10-W101','智利国家图书馆作者专题与智利大学作者主要作品书目直接列出该独立书名；按作品集/诗集对象保留。; 中文为工作译名，西班牙语原题为身份锚点；cueca按智利民间舞曲名称音译，不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0614','collection','《厚重作品》','Obra gruesa','candidate','1','WCD10-B10-W102','智利国家图书馆作者专题与智利大学作者主要作品书目直接列出该独立书名；按作品集/诗集对象保留。; 中文为工作译名，西班牙语原题为身份锚点；不声称存在正式中文译本名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0615','collection','《埃尔基基督的布道与讲道》','Sermones y prédicas del Cristo de Elqui','candidate','1','WCD10-B10-W103','智利国家图书馆作者专题与智利大学作者主要作品书目直接列出该独立书名；按作品集/诗集对象保留。; 中文为工作译名，保留地名Elqui音译为埃尔基；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0616','collection','《明信片诗作集》','Artefactos','candidate','1','WCD10-B10-W104','国家图书馆专题正文记其1972年以明信片形式出版，智利大学主要作品目录也直接标注 tarjetas postales；与同题单篇/实物卡片内容不混同。; 中文为工作描述性译名，西班牙语原题为身份锚点；形式依来源注明为明信片，不声称该中文名为正式译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0617','collection','《最遥远的土地》','La tierra más ajena','candidate','1','WCD10-B10-W201','CVC直接称本作为皮扎尼克1955年在布宜诺斯艾利斯出版的第一部诗集。; 中文为工作译名，西班牙语原题为身份锚点；不声称存在正式中文译本名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0618','collection','《最后的纯真》','La última inocencia','candidate','1','WCD10-B10-W202','CVC作品评论直接讨论本作及其题名、梦境和记忆意象。; 中文为工作译名，西班牙语原题为身份锚点；不声称存在正式中文译本名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0619','collection','《失落的冒险》','Las aventuras perdidas','candidate','1','WCD10-B10-W203','CVC作品评论直接介绍本集及精神分析、超现实主义意象。; 中文为工作译名，西班牙语原题为身份锚点；不声称存在正式中文译本名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0620','work','《嗜血伯爵夫人》','La condesa sangrienta','candidate','1','WCD10-B10-W204','CVC称该文本为essay-poem-novel，围绕Erzsébet Báthory展开。; 中文为工作译名，西班牙语原题为身份锚点；不声称存在正式中文译本名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0621','collection','《音乐地狱》','El infierno musical','candidate','1','WCD10-B10-W205','CVC评论直接将“Cold in hand blues”标为本集诗篇并讨论皮扎尼克的语言写作。; 中文为工作译名，西班牙语原题为身份锚点；不声称存在正式中文译本名。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0606','WCD10-B10-W001','WCD-10-B10','WCD10-B10-W001','V1-ENT-0610','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0607','WCD10-B10-W002','WCD-10-B10','WCD10-B10-W002','V1-ENT-0611','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0608','WCD10-B10-W003','WCD-10-B10','WCD10-B10-W003','V1-ENT-0612','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0609','WCD10-B10-W101','WCD-10-B10','WCD10-B10-W101','V1-ENT-0613','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0610','WCD10-B10-W102','WCD-10-B10','WCD10-B10-W102','V1-ENT-0614','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0611','WCD10-B10-W103','WCD-10-B10','WCD10-B10-W103','V1-ENT-0615','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0612','WCD10-B10-W104','WCD-10-B10','WCD10-B10-W104','V1-ENT-0616','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0613','WCD10-B10-W201','WCD-10-B10','WCD10-B10-W201','V1-ENT-0617','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0614','WCD10-B10-W202','WCD-10-B10','WCD10-B10-W202','V1-ENT-0618','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0615','WCD10-B10-W203','WCD-10-B10','WCD10-B10-W203','V1-ENT-0619','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0616','WCD10-B10-W204','WCD-10-B10','WCD10-B10-W204','V1-ENT-0620','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0617','WCD10-B10-W205','WCD-10-B10','WCD10-B10-W205','V1-ENT-0621','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0561','WCD-10-B10:V1-ENT-0610','V1-ENT-0610','work','《不幸的友谊》','何塞·马蒂','Amistad funesta','古巴','es','1885','长篇小说','WCD-10-B10','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《不幸的友谊》｜Amistad funesta

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说
- bibliographic_note：BVMC将该作品著录为Martí所作小说；数字文本据柏林1911年版制作，1911年是所据版本信息，本候选不将其认作首刊年。
- first_publication_year：1885
- one_sentence_summary：小说第一章围绕Lucía Jerez、Juan Jerez、Ana与Adela等人的交往展开，并写到Juan为Sol del Valle母亲求情。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0562','WCD-10-B10:V1-ENT-0611','V1-ENT-0611','collection','《黄金时代》','何塞·马蒂','La Edad de Oro','古巴','es','1889','面向儿童的月刊（四期）','WCD-10-B10','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《黄金时代》｜La Edad de Oro

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1889
- one_sentence_summary：这份面向美洲儿童的刊物由Martí撰写，共刊四期，1889年7月至10月在纽约出版，内容包含故事、历史与艺术等栏目。
- genre_or_form：面向儿童的月刊（四期）

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0563','WCD-10-B10:V1-ENT-0612','V1-ENT-0612','work','《阿卜达拉》','何塞·马蒂','Abdala','古巴','es','1869','戏剧','WCD-10-B10','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《阿卜达拉》｜Abdala

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：戏剧
- first_publication_year：1869
- one_sentence_summary：戏剧以Nubia遭征服者威胁为背景，写Abdala率军出战保卫祖国。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0564','WCD-10-B10:V1-ENT-0613','V1-ENT-0613','collection','《长奎卡舞曲》','尼卡诺尔·帕拉','La cueca larga','智利','es','1958','诗集','WCD-10-B10','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《长奎卡舞曲》｜La cueca larga

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1958
- genre_or_form：诗集
- one_sentence_summary：智利国家图书馆专题指出，此书取材于智利民间欢庆节奏，并以戏仿方式加以呈现。
- bibliographic_note：智利大学目录列1958年《La Cueca Larga》；国家图书馆专题同年列入作者作品序列。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0565','WCD-10-B10:V1-ENT-0614','V1-ENT-0614','collection','《厚重作品》','尼卡诺尔·帕拉','Obra gruesa','智利','es','1969','诗集','WCD-10-B10','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《厚重作品》｜Obra gruesa

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1969
- genre_or_form：诗集
- one_sentence_summary：智利国家图书馆将其列入帕拉的诗作序列，并概括这些作品呈现反诗模式及其演进。
- bibliographic_note：智利大学作者主要作品目录列《Obra Gruesa》（1969，Universitaria）。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0566','WCD-10-B10:V1-ENT-0615','V1-ENT-0615','collection','《埃尔基基督的布道与讲道》','尼卡诺尔·帕拉','Sermones y prédicas del Cristo de Elqui','智利','es','1977','诗歌作品集','WCD-10-B10','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《埃尔基基督的布道与讲道》｜Sermones y prédicas del Cristo de Elqui

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1977
- genre_or_form：诗歌作品集
- one_sentence_summary：智利国家图书馆将此书列为1977年作品，并置于呈现反诗模式及其演进的诗作序列中。
- bibliographic_note：智利大学目录记1979年版本，并注明初版为1977年；国家图书馆作者专题亦列1977年。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0567','WCD-10-B10:V1-ENT-0616','V1-ENT-0616','collection','《明信片诗作集》','尼卡诺尔·帕拉','Artefactos','智利','es','1972','明信片形式的诗歌作品集','WCD-10-B10','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《明信片诗作集》｜Artefactos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1972
- genre_or_form：明信片形式的诗歌作品集
- one_sentence_summary：《Artefactos》于1972年以明信片形式出版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0568','WCD-10-B10:V1-ENT-0617','V1-ENT-0617','collection','《最遥远的土地》','阿莱杭德拉·皮扎尼克','La tierra más ajena','阿根廷','es','1955','诗集','WCD-10-B10','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《最遥远的土地》｜La tierra más ajena

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1955
- genre_or_form：诗集
- one_sentence_summary：CVC资料称本作为皮扎尼克1955年出版的第一部诗集。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0569','WCD-10-B10:V1-ENT-0618','V1-ENT-0618','collection','《最后的纯真》','阿莱杭德拉·皮扎尼克','La última inocencia','阿根廷','es','1956','诗集','WCD-10-B10','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《最后的纯真》｜La última inocencia

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：诗集
- one_sentence_summary：CVC评论将书名联系到兰波《地狱一季》中的“最后的纯真”表述，并围绕梦境与记忆意象展开讨论。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0570','WCD-10-B10:V1-ENT-0619','V1-ENT-0619','collection','《失落的冒险》','阿莱杭德拉·皮扎尼克','Las aventuras perdidas','阿根廷','es','1958','诗集','WCD-10-B10','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《失落的冒险》｜Las aventuras perdidas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1958
- genre_or_form：诗集
- one_sentence_summary：CVC评论以精神分析、超现实主义意象及镜像联想介绍本集，并提到诗中迷失方向的意象。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0571','WCD-10-B10:V1-ENT-0620','V1-ENT-0620','work','《嗜血伯爵夫人》','阿莱杭德拉·皮扎尼克','La condesa sangrienta','阿根廷','es','','散文（CVC称essay-poem-novel）','WCD-10-B10','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《嗜血伯爵夫人》｜La condesa sangrienta

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_book_edition_year：1971
- genre_or_form：散文（CVC称essay-poem-novel）
- one_sentence_summary：CVC评论称文本围绕Erzsébet Báthory展开，并将其称作essay-poem-novel。
- bibliographic_note：CVC记载该作品曾于1965年有一次“primer avance mexicano”，后于1966年刊于Testigo，并于1971年以单行本出版。因来源没有说明1965年预告与1966年刊载的文本关系，本候选不填原子first_publication_year。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0572','WCD-10-B10:V1-ENT-0621','V1-ENT-0621','collection','《音乐地狱》','阿莱杭德拉·皮扎尼克','El infierno musical','阿根廷','es','1971','诗集','WCD-10-B10','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《音乐地狱》｜El infierno musical

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1971
- genre_or_form：诗集
- one_sentence_summary：CVC文章将“Cold in hand blues”标为本集诗篇，并讨论皮扎尼克如何以语言承载诗歌意象；概述限于该评论范围。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0573','WCD-10-B10:V1-ENT-0232','V1-ENT-0232','collection','《伊斯梅利约》','何塞·马蒂','Ismaelillo','古巴','es','','','WCD-10-B10','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《伊斯梅利约》｜Ismaelillo

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：本诗集由面向儿子的抒情诗篇组成，诗中多次直接呼唤儿子并写父子亲情。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0574','WCD-10-B10:V1-ENT-0233','V1-ENT-0233','collection','《纯朴的诗》','何塞·马蒂','Versos sencillos','古巴','es','','','WCD-10-B10','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《纯朴的诗》｜Versos sencillos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：这些短诗以简洁明白的语言书写伦理理想、友情与个人悲痛。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0575','WCD-10-B10:V1-ENT-0234','V1-ENT-0234','work','《我们的美洲》','何塞·马蒂','Nuestra América','古巴','es','','','WCD-10-B10','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《我们的美洲》｜Nuestra América

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：这篇抒情政论文章借历史与现实分析阐述Martí对拉丁美洲社会政治及其未来的思考。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0576','WCD-10-B10:V1-ENT-0239','V1-ENT-0239','collection','《诗歌与反诗歌》','尼卡诺尔·帕拉','Poemas y antipoemas','智利','es','','诗集','WCD-10-B10','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《诗歌与反诗歌》｜Poemas y antipoemas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗集
- one_sentence_summary：智利国家图书馆称《诗歌与反诗歌》（1954）开启帕拉的反诗模式，其诗句带有讽刺，采用日常、直接的语言。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0577','WCD-10-B10:V1-ENT-0240','V1-ENT-0240','collection','《沙龙篇》','尼卡诺尔·帕拉','Versos de salón','智利','es','','诗集','WCD-10-B10','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《沙龙篇》｜Versos de salón

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗集
- one_sentence_summary：国家图书馆作者专题将《沙龙篇》（1962）列入《诗歌与反诗歌》之后的作品，并概述帕拉此后诗作延展反诗模式。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0578','WCD-10-B10:V1-ENT-0242','V1-ENT-0242','collection','《狄安娜之树》','阿莱杭德拉·皮扎尼克','Árbol de Diana','阿根廷','es','','诗集','WCD-10-B10','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《狄安娜之树》｜Árbol de Diana

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗集
- one_sentence_summary：CVC评论借奥克塔维奥·帕斯的序言讨论书名象征，并提到作品中的色彩意象与绘画题献；此处仅概述该评论内容。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0579','WCD-10-B10:V1-ENT-0243','V1-ENT-0243','collection','《作品与夜晚》','阿莱杭德拉·皮扎尼克','Los trabajos y las noches','阿根廷','es','','诗集','WCD-10-B10','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《作品与夜晚》｜Los trabajos y las noches

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗集
- one_sentence_summary：CVC评论指出，本集以爱情表达和对话、静默意象交织，并特别提到作品对语音与节奏的经营。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0580','WCD-10-B10:V1-ENT-0244','V1-ENT-0244','collection','《取出疯石》','阿莱杭德拉·皮扎尼克','Extracción de la piedra de locura','阿根廷','es','','诗集（含散文化表达）','WCD-10-B10','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《取出疯石》｜Extracción de la piedra de locura

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：诗集（含散文化表达）
- one_sentence_summary：CVC评论以象征意象描述本书中的痛苦与无力，并指出作品从韵文化表达延展到散文形式。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-1942','WCD10-B10-W001-F01','V1-CARD-0561','V1-ENT-0610','genre_or_form','长篇小说','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1943','WCD10-B10-W001-F02','V1-CARD-0561','V1-ENT-0610','bibliographic_note','BVMC将该作品著录为Martí所作小说；数字文本据柏林1911年版制作，1911年是所据版本信息，本候选不将其认作首刊年。','bibliographic_note','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1944','WCD10-B10-W001-F03','V1-CARD-0561','V1-ENT-0610','first_publication_year','1885','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1945','WCD10-B10-W001-F04','V1-CARD-0561','V1-ENT-0610','one_sentence_summary','小说第一章围绕Lucía Jerez、Juan Jerez、Ana与Adela等人的交往展开，并写到Juan为Sol del Valle母亲求情。','institutional_paraphrase','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1946','WCD10-B10-W002-F01','V1-CARD-0562','V1-ENT-0611','first_publication_year','1889','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1947','WCD10-B10-W002-F02','V1-CARD-0562','V1-ENT-0611','one_sentence_summary','这份面向美洲儿童的刊物由Martí撰写，共刊四期，1889年7月至10月在纽约出版，内容包含故事、历史与艺术等栏目。','institutional_paraphrase','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1948','WCD10-B10-W002-F03','V1-CARD-0562','V1-ENT-0611','genre_or_form','面向儿童的月刊（四期）','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1949','WCD10-B10-W003-F01','V1-CARD-0563','V1-ENT-0612','genre_or_form','戏剧','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1950','WCD10-B10-W003-F02','V1-CARD-0563','V1-ENT-0612','first_publication_year','1869','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1951','WCD10-B10-W003-F03','V1-CARD-0563','V1-ENT-0612','one_sentence_summary','戏剧以Nubia遭征服者威胁为背景，写Abdala率军出战保卫祖国。','institutional_paraphrase','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1952','WCD10-B10-W101-F01','V1-CARD-0564','V1-ENT-0613','first_publication_year','1958','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1953','WCD10-B10-W101-F02','V1-CARD-0564','V1-ENT-0613','genre_or_form','诗集','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1954','WCD10-B10-W101-F03','V1-CARD-0564','V1-ENT-0613','one_sentence_summary','智利国家图书馆专题指出，此书取材于智利民间欢庆节奏，并以戏仿方式加以呈现。','institutional_paraphrase','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1955','WCD10-B10-W101-F04','V1-CARD-0564','V1-ENT-0613','bibliographic_note','智利大学目录列1958年《La Cueca Larga》；国家图书馆专题同年列入作者作品序列。','bibliographic_note','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1956','WCD10-B10-W102-F01','V1-CARD-0565','V1-ENT-0614','first_publication_year','1969','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1957','WCD10-B10-W102-F02','V1-CARD-0565','V1-ENT-0614','genre_or_form','诗集','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1958','WCD10-B10-W102-F03','V1-CARD-0565','V1-ENT-0614','one_sentence_summary','智利国家图书馆将其列入帕拉的诗作序列，并概括这些作品呈现反诗模式及其演进。','institutional_paraphrase','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1959','WCD10-B10-W102-F04','V1-CARD-0565','V1-ENT-0614','bibliographic_note','智利大学作者主要作品目录列《Obra Gruesa》（1969，Universitaria）。','bibliographic_note','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1960','WCD10-B10-W103-F01','V1-CARD-0566','V1-ENT-0615','first_publication_year','1977','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1961','WCD10-B10-W103-F02','V1-CARD-0566','V1-ENT-0615','genre_or_form','诗歌作品集','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1962','WCD10-B10-W103-F03','V1-CARD-0566','V1-ENT-0615','one_sentence_summary','智利国家图书馆将此书列为1977年作品，并置于呈现反诗模式及其演进的诗作序列中。','institutional_paraphrase','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1963','WCD10-B10-W103-F04','V1-CARD-0566','V1-ENT-0615','bibliographic_note','智利大学目录记1979年版本，并注明初版为1977年；国家图书馆作者专题亦列1977年。','bibliographic_note','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1964','WCD10-B10-W104-F01','V1-CARD-0567','V1-ENT-0616','first_publication_year','1972','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1965','WCD10-B10-W104-F02','V1-CARD-0567','V1-ENT-0616','genre_or_form','明信片形式的诗歌作品集','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1966','WCD10-B10-W104-F03','V1-CARD-0567','V1-ENT-0616','one_sentence_summary','《Artefactos》于1972年以明信片形式出版。','institutional_paraphrase','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1967','WCD10-B10-W201-F01','V1-CARD-0568','V1-ENT-0617','first_publication_year','1955','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1968','WCD10-B10-W201-F02','V1-CARD-0568','V1-ENT-0617','genre_or_form','诗集','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1969','WCD10-B10-W201-F03','V1-CARD-0568','V1-ENT-0617','one_sentence_summary','CVC资料称本作为皮扎尼克1955年出版的第一部诗集。','institutional_paraphrase','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1970','WCD10-B10-W202-F01','V1-CARD-0569','V1-ENT-0618','first_publication_year','1956','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1971','WCD10-B10-W202-F02','V1-CARD-0569','V1-ENT-0618','genre_or_form','诗集','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1972','WCD10-B10-W202-F03','V1-CARD-0569','V1-ENT-0618','one_sentence_summary','CVC评论将书名联系到兰波《地狱一季》中的“最后的纯真”表述，并围绕梦境与记忆意象展开讨论。','institutional_paraphrase','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1973','WCD10-B10-W203-F01','V1-CARD-0570','V1-ENT-0619','first_publication_year','1958','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1974','WCD10-B10-W203-F02','V1-CARD-0570','V1-ENT-0619','genre_or_form','诗集','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1975','WCD10-B10-W203-F03','V1-CARD-0570','V1-ENT-0619','one_sentence_summary','CVC评论以精神分析、超现实主义意象及镜像联想介绍本集，并提到诗中迷失方向的意象。','institutional_paraphrase','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1976','WCD10-B10-W204-F01','V1-CARD-0571','V1-ENT-0620','first_book_edition_year','1971','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1977','WCD10-B10-W204-F02','V1-CARD-0571','V1-ENT-0620','genre_or_form','散文（CVC称essay-poem-novel）','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1978','WCD10-B10-W204-F03','V1-CARD-0571','V1-ENT-0620','one_sentence_summary','CVC评论称文本围绕Erzsébet Báthory展开，并将其称作essay-poem-novel。','institutional_paraphrase','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1979','WCD10-B10-W204-F04','V1-CARD-0571','V1-ENT-0620','bibliographic_note','CVC记载该作品曾于1965年有一次“primer avance mexicano”，后于1966年刊于Testigo，并于1971年以单行本出版。因来源没有说明1965年预告与1966年刊载的文本关系，本候选不填原子first_publication_year。','bibliographic_note','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1980','WCD10-B10-W205-F01','V1-CARD-0572','V1-ENT-0621','first_publication_year','1971','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1981','WCD10-B10-W205-F02','V1-CARD-0572','V1-ENT-0621','genre_or_form','诗集','bibliographic','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1982','WCD10-B10-W205-F03','V1-CARD-0572','V1-ENT-0621','one_sentence_summary','CVC文章将“Cold in hand blues”标为本集诗篇，并讨论皮扎尼克如何以语言承载诗歌意象；概述限于该评论范围。','institutional_paraphrase','WCD-10-B10','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1983','WCD10-B10-F001','V1-CARD-0573','V1-ENT-0232','one_sentence_summary','本诗集由面向儿子的抒情诗篇组成，诗中多次直接呼唤儿子并写父子亲情。','institutional_paraphrase','WCD-10-B10','high','batch_retained_candidate','仅新增普通作品简介；所有基线实体、事实、内容卡、关系和来源链原样保留。'),
('V1-FCT-1984','WCD10-B10-F002','V1-CARD-0574','V1-ENT-0233','one_sentence_summary','这些短诗以简洁明白的语言书写伦理理想、友情与个人悲痛。','institutional_paraphrase','WCD-10-B10','high','batch_retained_candidate','仅新增普通作品简介；不改写基线已记录的1891年书目事实。'),
('V1-FCT-1985','WCD10-B10-F003','V1-CARD-0575','V1-ENT-0234','one_sentence_summary','这篇抒情政论文章借历史与现实分析阐述Martí对拉丁美洲社会政治及其未来的思考。','institutional_paraphrase','WCD-10-B10','high','batch_retained_candidate','仅新增普通作品简介；不改写基线已有的题名、体裁、年份或来源。'),
('V1-FCT-1986','WCD10-B10-F111','V1-CARD-0576','V1-ENT-0239','genre_or_form','诗集','bibliographic','WCD-10-B10','high','batch_retained_candidate','inventory中该字段缺失；只追加书目与形式字段，不改写V1-FCT-0578–0580。'),
('V1-FCT-1987','WCD10-B10-F112','V1-CARD-0576','V1-ENT-0239','one_sentence_summary','智利国家图书馆称《诗歌与反诗歌》（1954）开启帕拉的反诗模式，其诗句带有讽刺，采用日常、直接的语言。','institutional_paraphrase','WCD-10-B10','high','batch_retained_candidate','仅追加国家图书馆作者专题对该书的明确描述，不扩张为完整反诗理论。'),
('V1-FCT-1988','WCD10-B10-F113','V1-CARD-0577','V1-ENT-0240','genre_or_form','诗集','bibliographic','WCD-10-B10','high','batch_retained_candidate','inventory中该字段缺失；只追加形式字段，保留基线1962首版事实及所有版次来源链。'),
('V1-FCT-1989','WCD10-B10-F114','V1-CARD-0577','V1-ENT-0240','one_sentence_summary','国家图书馆作者专题将《沙龙篇》（1962）列入《诗歌与反诗歌》之后的作品，并概述帕拉此后诗作延展反诗模式。','institutional_paraphrase','WCD-10-B10','high','batch_retained_candidate','只采用作者专题对列举作品序列的概述；不将图版中1971版误作1962首版，也不声称单书研究结论。'),
('V1-FCT-1990','WCD10-B10-F201','V1-CARD-0578','V1-ENT-0242','genre_or_form','诗集','bibliographic','WCD-10-B10','high','batch_retained_candidate','仅补旧对象缺失字段；保全基线实体、事实、卡片、关系及完整来源闭包。'),
('V1-FCT-1991','WCD10-B10-F202','V1-CARD-0578','V1-ENT-0242','one_sentence_summary','CVC评论借奥克塔维奥·帕斯的序言讨论书名象征，并提到作品中的色彩意象与绘画题献；此处仅概述该评论内容。','institutional_paraphrase','WCD-10-B10','high','batch_retained_candidate','仅补旧对象缺失字段；保全基线实体、事实、卡片、关系及完整来源闭包。'),
('V1-FCT-1992','WCD10-B10-F203','V1-CARD-0579','V1-ENT-0243','genre_or_form','诗集','bibliographic','WCD-10-B10','high','batch_retained_candidate','仅补旧对象缺失字段；保全基线实体、事实、卡片、关系及完整来源闭包。'),
('V1-FCT-1993','WCD10-B10-F204','V1-CARD-0579','V1-ENT-0243','one_sentence_summary','CVC评论指出，本集以爱情表达和对话、静默意象交织，并特别提到作品对语音与节奏的经营。','institutional_paraphrase','WCD-10-B10','high','batch_retained_candidate','仅补旧对象缺失字段；保全基线实体、事实、卡片、关系及完整来源闭包。'),
('V1-FCT-1994','WCD10-B10-F205','V1-CARD-0580','V1-ENT-0244','genre_or_form','诗集（含散文化表达）','bibliographic','WCD-10-B10','high','batch_retained_candidate','仅补旧对象缺失字段；保全基线实体、事实、卡片、关系及完整来源闭包。'),
('V1-FCT-1995','WCD10-B10-F206','V1-CARD-0580','V1-ENT-0244','one_sentence_summary','CVC评论以象征意象描述本书中的痛苦与无力，并指出作品从韵文化表达延展到散文形式。','institutional_paraphrase','WCD-10-B10','high','batch_retained_candidate','仅补旧对象缺失字段；保全基线实体、事实、卡片、关系及完整来源闭包。');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-1942','SRC-0663','Amistad funesta : novela / José Martí | Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-1943','SRC-0663','Amistad funesta : novela / José Martí | Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-1944','SRC-0667','Amistad funesta : novela | Biblioteca Virtual Miguel de Cervantes (texto e introducción)'),
('V1-FCT-1945','SRC-0672','Amistad funesta : novela, Capítulo I | Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-1946','SRC-0665','La edad de oro / José Martí | Biblioteca Pedro Henríquez Ureña catalog'),
('V1-FCT-1947','SRC-0665','La edad de oro / José Martí | Biblioteca Pedro Henríquez Ureña catalog'),
('V1-FCT-1948','SRC-0665','La edad de oro / José Martí | Biblioteca Pedro Henríquez Ureña catalog'),
('V1-FCT-1949','SRC-0666','Abdala / José Martí | Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-1950','SRC-0668','Diccionario de la literatura cubana | Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-1951','SRC-0673','Abdala, Escena I-II | Biblioteca Virtual Miguel de Cervantes'),
('V1-FCT-1952','SRC-0189','Fichas bibliográficas I — Nicanor Parra'),
('V1-FCT-1953','SRC-0189','Fichas bibliográficas I — Nicanor Parra'),
('V1-FCT-1954','SRC-0188','Nicanor Parra (1914-2018)'),
('V1-FCT-1955','SRC-0189','Fichas bibliográficas I — Nicanor Parra'),
('V1-FCT-1956','SRC-0189','Fichas bibliográficas I — Nicanor Parra'),
('V1-FCT-1957','SRC-0189','Fichas bibliográficas I — Nicanor Parra'),
('V1-FCT-1958','SRC-0188','Nicanor Parra (1914-2018)'),
('V1-FCT-1959','SRC-0189','Fichas bibliográficas I — Nicanor Parra'),
('V1-FCT-1960','SRC-0189','Fichas bibliográficas I — Nicanor Parra'),
('V1-FCT-1961','SRC-0189','Fichas bibliográficas I — Nicanor Parra'),
('V1-FCT-1962','SRC-0188','Nicanor Parra (1914-2018)'),
('V1-FCT-1963','SRC-0189','Fichas bibliográficas I — Nicanor Parra'),
('V1-FCT-1964','SRC-0188','Nicanor Parra (1914-2018)'),
('V1-FCT-1964','SRC-0189','Fichas bibliográficas I — Nicanor Parra'),
('V1-FCT-1965','SRC-0189','Fichas bibliográficas I — Nicanor Parra'),
('V1-FCT-1965','SRC-0188','Nicanor Parra (1914-2018)'),
('V1-FCT-1966','SRC-0188','Nicanor Parra (1914-2018)'),
('V1-FCT-1966','SRC-0189','Fichas bibliográficas I — Nicanor Parra'),
('V1-FCT-1967','SRC-0192','CVC. Alejandra Pizarnik. Bibliografía. Obras'),
('V1-FCT-1968','SRC-0680','CVC. Alejandra Pizarnik: leyenda de una vida tras de su obra'),
('V1-FCT-1969','SRC-0680','CVC. Alejandra Pizarnik: leyenda de una vida tras de su obra'),
('V1-FCT-1970','SRC-0192','CVC. Alejandra Pizarnik. Bibliografía. Obras'),
('V1-FCT-1971','SRC-0677','CVC. Alejandra Pizarnik. Obra. La última inocencia'),
('V1-FCT-1972','SRC-0677','CVC. Alejandra Pizarnik. Obra. La última inocencia'),
('V1-FCT-1973','SRC-0192','CVC. Alejandra Pizarnik. Bibliografía. Obras'),
('V1-FCT-1974','SRC-0678','CVC. Alejandra Pizarnik. Obra. Las aventuras perdidas'),
('V1-FCT-1975','SRC-0678','CVC. Alejandra Pizarnik. Obra. Las aventuras perdidas'),
('V1-FCT-1976','SRC-0679','CVC. Alejandra Pizarnik. Obra. La condesa sangrienta'),
('V1-FCT-1977','SRC-0679','CVC. Alejandra Pizarnik. Obra. La condesa sangrienta'),
('V1-FCT-1978','SRC-0679','CVC. Alejandra Pizarnik. Obra. La condesa sangrienta'),
('V1-FCT-1979','SRC-0679','CVC. Alejandra Pizarnik. Obra. La condesa sangrienta'),
('V1-FCT-1980','SRC-0192','CVC. Alejandra Pizarnik. Bibliografía. Obras'),
('V1-FCT-1981','SRC-0681','CVC. Alejandra Pizarnik escondida en el lenguaje'),
('V1-FCT-1982','SRC-0681','CVC. Alejandra Pizarnik escondida en el lenguaje'),
('V1-FCT-1983','SRC-0671','Ismaelillo | José Martí | Poeticous'),
('V1-FCT-1984','SRC-0669','Versos sencillos, de José Martí | Educ.ar'),
('V1-FCT-1985','SRC-0670','Nuestra América | Biblioteca del Congreso de la Nación'),
('V1-FCT-1986','SRC-0188','Nicanor Parra (1914-2018)'),
('V1-FCT-1986','SRC-0189','Fichas bibliográficas I — Nicanor Parra'),
('V1-FCT-1987','SRC-0188','Nicanor Parra (1914-2018)'),
('V1-FCT-1988','SRC-0189','Fichas bibliográficas I — Nicanor Parra'),
('V1-FCT-1989','SRC-0188','Nicanor Parra (1914-2018)'),
('V1-FCT-1990','SRC-0674','CVC. Alejandra Pizarnik. Obra. Árbol de Diana'),
('V1-FCT-1991','SRC-0674','CVC. Alejandra Pizarnik. Obra. Árbol de Diana'),
('V1-FCT-1992','SRC-0675','CVC. Alejandra Pizarnik. Obra. Los trabajos y las noches'),
('V1-FCT-1993','SRC-0675','CVC. Alejandra Pizarnik. Obra. Los trabajos y las noches'),
('V1-FCT-1994','SRC-0680','CVC. Alejandra Pizarnik: leyenda de una vida tras de su obra'),
('V1-FCT-1995','SRC-0676','CVC. Alejandra Pizarnik. Biografía literaria'),
('V1-FCT-1995','SRC-0680','CVC. Alejandra Pizarnik: leyenda de una vida tras de su obra');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0561','V1-FCT-1942','batch_retained_candidate'),
('V1-CARD-0561','V1-FCT-1943','batch_retained_candidate'),
('V1-CARD-0561','V1-FCT-1944','batch_retained_candidate'),
('V1-CARD-0561','V1-FCT-1945','batch_retained_candidate'),
('V1-CARD-0562','V1-FCT-1946','batch_retained_candidate'),
('V1-CARD-0562','V1-FCT-1947','batch_retained_candidate'),
('V1-CARD-0562','V1-FCT-1948','batch_retained_candidate'),
('V1-CARD-0563','V1-FCT-1949','batch_retained_candidate'),
('V1-CARD-0563','V1-FCT-1950','batch_retained_candidate'),
('V1-CARD-0563','V1-FCT-1951','batch_retained_candidate'),
('V1-CARD-0564','V1-FCT-1952','batch_retained_candidate'),
('V1-CARD-0564','V1-FCT-1953','batch_retained_candidate'),
('V1-CARD-0564','V1-FCT-1954','batch_retained_candidate'),
('V1-CARD-0564','V1-FCT-1955','batch_retained_candidate'),
('V1-CARD-0565','V1-FCT-1956','batch_retained_candidate'),
('V1-CARD-0565','V1-FCT-1957','batch_retained_candidate'),
('V1-CARD-0565','V1-FCT-1958','batch_retained_candidate'),
('V1-CARD-0565','V1-FCT-1959','batch_retained_candidate'),
('V1-CARD-0566','V1-FCT-1960','batch_retained_candidate'),
('V1-CARD-0566','V1-FCT-1961','batch_retained_candidate'),
('V1-CARD-0566','V1-FCT-1962','batch_retained_candidate'),
('V1-CARD-0566','V1-FCT-1963','batch_retained_candidate'),
('V1-CARD-0567','V1-FCT-1964','batch_retained_candidate'),
('V1-CARD-0567','V1-FCT-1965','batch_retained_candidate'),
('V1-CARD-0567','V1-FCT-1966','batch_retained_candidate'),
('V1-CARD-0568','V1-FCT-1967','batch_retained_candidate'),
('V1-CARD-0568','V1-FCT-1968','batch_retained_candidate'),
('V1-CARD-0568','V1-FCT-1969','batch_retained_candidate'),
('V1-CARD-0569','V1-FCT-1970','batch_retained_candidate'),
('V1-CARD-0569','V1-FCT-1971','batch_retained_candidate'),
('V1-CARD-0569','V1-FCT-1972','batch_retained_candidate'),
('V1-CARD-0570','V1-FCT-1973','batch_retained_candidate'),
('V1-CARD-0570','V1-FCT-1974','batch_retained_candidate'),
('V1-CARD-0570','V1-FCT-1975','batch_retained_candidate'),
('V1-CARD-0571','V1-FCT-1976','batch_retained_candidate'),
('V1-CARD-0571','V1-FCT-1977','batch_retained_candidate'),
('V1-CARD-0571','V1-FCT-1978','batch_retained_candidate'),
('V1-CARD-0571','V1-FCT-1979','batch_retained_candidate'),
('V1-CARD-0572','V1-FCT-1980','batch_retained_candidate'),
('V1-CARD-0572','V1-FCT-1981','batch_retained_candidate'),
('V1-CARD-0572','V1-FCT-1982','batch_retained_candidate'),
('V1-CARD-0573','V1-FCT-1983','batch_retained_candidate'),
('V1-CARD-0574','V1-FCT-1984','batch_retained_candidate'),
('V1-CARD-0575','V1-FCT-1985','batch_retained_candidate'),
('V1-CARD-0576','V1-FCT-1986','batch_retained_candidate'),
('V1-CARD-0576','V1-FCT-1987','batch_retained_candidate'),
('V1-CARD-0577','V1-FCT-1988','batch_retained_candidate'),
('V1-CARD-0577','V1-FCT-1989','batch_retained_candidate'),
('V1-CARD-0578','V1-FCT-1990','batch_retained_candidate'),
('V1-CARD-0578','V1-FCT-1991','batch_retained_candidate'),
('V1-CARD-0579','V1-FCT-1992','batch_retained_candidate'),
('V1-CARD-0579','V1-FCT-1993','batch_retained_candidate'),
('V1-CARD-0580','V1-FCT-1994','batch_retained_candidate'),
('V1-CARD-0580','V1-FCT-1995','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-1206','WCD10-B10-S001','V1-CARD-0561','SRC-0663','B','bibliography_or_bounded_description','yes','no','SRC-0663','accepted','NONE'),
('V1-CS-1207','WCD10-B10-S005','V1-CARD-0561','SRC-0667','B','bibliography_or_bounded_description','yes','no','SRC-0667','accepted','NONE'),
('V1-CS-1208','WCD10-B10-S011','V1-CARD-0561','SRC-0672','B','bibliography_or_bounded_description','no','no','SRC-0672','accepted','NONE'),
('V1-CS-1209','WCD10-B10-S003','V1-CARD-0562','SRC-0665','B','bibliography_or_bounded_description','yes','no','SRC-0665','accepted','NONE'),
('V1-CS-1210','WCD10-B10-S004','V1-CARD-0563','SRC-0666','B','bibliography_or_bounded_description','yes','no','SRC-0666','accepted','NONE'),
('V1-CS-1211','WCD10-B10-S006','V1-CARD-0563','SRC-0668','B','bibliography_or_bounded_description','yes','no','SRC-0668','accepted','NONE'),
('V1-CS-1212','WCD10-B10-S012','V1-CARD-0563','SRC-0673','B','bibliography_or_bounded_description','no','no','SRC-0673','accepted','NONE'),
('V1-CS-1213','WCD10-B10-S101','V1-CARD-0564','SRC-0188','B','bibliography_or_bounded_description','no','no','SRC-0188','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1214','WCD10-B10-S102','V1-CARD-0564','SRC-0189','B','bibliography_or_bounded_description','yes','no','SRC-0189','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1215','WCD10-B10-S101','V1-CARD-0565','SRC-0188','B','bibliography_or_bounded_description','no','no','SRC-0188','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1216','WCD10-B10-S102','V1-CARD-0565','SRC-0189','B','bibliography_or_bounded_description','yes','no','SRC-0189','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1217','WCD10-B10-S101','V1-CARD-0566','SRC-0188','B','bibliography_or_bounded_description','no','no','SRC-0188','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1218','WCD10-B10-S102','V1-CARD-0566','SRC-0189','B','bibliography_or_bounded_description','yes','no','SRC-0189','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1219','WCD10-B10-S101','V1-CARD-0567','SRC-0188','B','bibliography_or_bounded_description','yes','no','SRC-0188','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1220','WCD10-B10-S102','V1-CARD-0567','SRC-0189','B','bibliography_or_bounded_description','yes','no','SRC-0189','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1221','WCD10-B10-S201','V1-CARD-0568','SRC-0192','B','bibliography_or_bounded_description','yes','no','SRC-0192','accepted','NONE'),
('V1-CS-1222','WCD10-B10-S208','V1-CARD-0568','SRC-0680','B','bibliography_or_bounded_description','yes','no','SRC-0680','accepted','NONE'),
('V1-CS-1223','WCD10-B10-S201','V1-CARD-0569','SRC-0192','B','bibliography_or_bounded_description','yes','no','SRC-0192','accepted','NONE'),
('V1-CS-1224','WCD10-B10-S205','V1-CARD-0569','SRC-0677','B','bibliography_or_bounded_description','yes','no','SRC-0677','accepted','NONE'),
('V1-CS-1225','WCD10-B10-S201','V1-CARD-0570','SRC-0192','B','bibliography_or_bounded_description','yes','no','SRC-0192','accepted','NONE'),
('V1-CS-1226','WCD10-B10-S206','V1-CARD-0570','SRC-0678','B','bibliography_or_bounded_description','yes','no','SRC-0678','accepted','NONE'),
('V1-CS-1227','WCD10-B10-S207','V1-CARD-0571','SRC-0679','B','bibliography_or_bounded_description','yes','no','SRC-0679','accepted','NONE'),
('V1-CS-1228','WCD10-B10-S201','V1-CARD-0572','SRC-0192','B','bibliography_or_bounded_description','yes','no','SRC-0192','accepted','NONE'),
('V1-CS-1229','WCD10-B10-S209','V1-CARD-0572','SRC-0681','B','bibliography_or_bounded_description','yes','no','SRC-0681','accepted','NONE'),
('V1-CS-1230','WCD10-B10-S010','V1-CARD-0573','SRC-0671','B','bibliography_or_bounded_description','no','no','SRC-0671','accepted','NONE'),
('V1-CS-1231','WCD10-B10-S008','V1-CARD-0574','SRC-0669','B','bibliography_or_bounded_description','no','no','SRC-0669','accepted','NONE'),
('V1-CS-1232','WCD10-B10-S009','V1-CARD-0575','SRC-0670','B','bibliography_or_bounded_description','no','no','SRC-0670','accepted','NONE'),
('V1-CS-1233','WCD10-B10-S101','V1-CARD-0576','SRC-0188','B','bibliography_or_bounded_description','yes','no','SRC-0188','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1234','WCD10-B10-S102','V1-CARD-0576','SRC-0189','B','bibliography_or_bounded_description','yes','no','SRC-0189','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1235','WCD10-B10-S101','V1-CARD-0577','SRC-0188','B','bibliography_or_bounded_description','no','no','SRC-0188','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1236','WCD10-B10-S102','V1-CARD-0577','SRC-0189','B','bibliography_or_bounded_description','yes','no','SRC-0189','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1237','WCD10-B10-S202','V1-CARD-0578','SRC-0674','B','bibliography_or_bounded_description','yes','no','SRC-0674','accepted','NONE'),
('V1-CS-1238','WCD10-B10-S203','V1-CARD-0579','SRC-0675','B','bibliography_or_bounded_description','yes','no','SRC-0675','accepted','NONE'),
('V1-CS-1239','WCD10-B10-S204','V1-CARD-0580','SRC-0676','B','bibliography_or_bounded_description','no','no','SRC-0676','accepted','NONE'),
('V1-CS-1240','WCD10-B10-S208','V1-CARD-0580','SRC-0680','B','bibliography_or_bounded_description','yes','no','SRC-0680','accepted','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0579','WCD-10-B10','WCD10-B10-W001-CREATED','V1-ENT-0225','CREATED','V1-ENT-0610','何塞·马蒂创作 Amistad funesta','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0580','WCD-10-B10','WCD10-B10-W002-CREATED','V1-ENT-0225','CREATED','V1-ENT-0611','何塞·马蒂创作 La Edad de Oro','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0581','WCD-10-B10','WCD10-B10-W003-CREATED','V1-ENT-0225','CREATED','V1-ENT-0612','何塞·马蒂创作 Abdala','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0582','WCD-10-B10','WCD10-B10-W101-CREATED','V1-ENT-0236','CREATED','V1-ENT-0613','尼卡诺尔·帕拉创作《长奎卡舞曲》（La cueca larga）。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0583','WCD-10-B10','WCD10-B10-W102-CREATED','V1-ENT-0236','CREATED','V1-ENT-0614','尼卡诺尔·帕拉创作《厚重作品》（Obra gruesa）。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0584','WCD-10-B10','WCD10-B10-W103-CREATED','V1-ENT-0236','CREATED','V1-ENT-0615','尼卡诺尔·帕拉创作《埃尔基基督的布道与讲道》（Sermones y prédicas del Cristo de Elqui）。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0585','WCD-10-B10','WCD10-B10-W104-CREATED','V1-ENT-0236','CREATED','V1-ENT-0616','尼卡诺尔·帕拉创作《明信片诗作集》（Artefactos），1972年以明信片形式出版。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0586','WCD-10-B10','WCD10-B10-W201-CREATED','V1-ENT-0237','CREATED','V1-ENT-0617','阿莱杭德拉·皮扎尼克创作 La tierra más ajena','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0587','WCD-10-B10','WCD10-B10-W202-CREATED','V1-ENT-0237','CREATED','V1-ENT-0618','阿莱杭德拉·皮扎尼克创作 La última inocencia','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0588','WCD-10-B10','WCD10-B10-W203-CREATED','V1-ENT-0237','CREATED','V1-ENT-0619','阿莱杭德拉·皮扎尼克创作 Las aventuras perdidas','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0589','WCD-10-B10','WCD10-B10-W204-CREATED','V1-ENT-0237','CREATED','V1-ENT-0620','阿莱杭德拉·皮扎尼克创作 La condesa sangrienta','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0590','WCD-10-B10','WCD10-B10-W205-CREATED','V1-ENT-0237','CREATED','V1-ENT-0621','阿莱杭德拉·皮扎尼克创作 El infierno musical','high','accepted','Codex-parent-independent-review:PASS','2','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0579','SRC-0663'),
('V1-REL-0580','SRC-0664'),
('V1-REL-0580','SRC-0665'),
('V1-REL-0581','SRC-0666'),
('V1-REL-0582','SRC-0188'),
('V1-REL-0582','SRC-0189'),
('V1-REL-0583','SRC-0188'),
('V1-REL-0583','SRC-0189'),
('V1-REL-0584','SRC-0188'),
('V1-REL-0584','SRC-0189'),
('V1-REL-0585','SRC-0188'),
('V1-REL-0585','SRC-0189'),
('V1-REL-0586','SRC-0192'),
('V1-REL-0586','SRC-0680'),
('V1-REL-0587','SRC-0192'),
('V1-REL-0587','SRC-0677'),
('V1-REL-0588','SRC-0192'),
('V1-REL-0588','SRC-0678'),
('V1-REL-0589','SRC-0192'),
('V1-REL-0589','SRC-0679'),
('V1-REL-0590','SRC-0192'),
('V1-REL-0590','SRC-0681');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0876','V1-REL-0579','WCD10-B10-S001','SRC-0663','Amistad funesta : novela / José Martí | Biblioteca Virtual Miguel de Cervantes','Registro bibliográfico lines 8-22: title, author Martí, digital publication 1999, reproduced edition based on Berlin 1911, Spanish language, Cuban 19th-century novel subject; line 26 confirms source edition.','何塞·马蒂创作 Amistad funesta','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0877','V1-REL-0580','WCD10-B10-S002','SRC-0664','La Edad de Oro : publicación mensual ... dedicada a los niños / José Martí | Biblioteca Virtual Miguel de Cervantes','Bibliographic record lines 8-22: title, Martí authorship, children literature classification, reproduction from Obras Completas vol. 18; no original first-publication date in this record.','何塞·马蒂创作 La Edad de Oro','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0878','V1-REL-0580','WCD10-B10-S003','SRC-0665','La edad de oro / José Martí | Biblioteca Pedro Henríquez Ureña catalog','Catalog lines 23-42 and 50-56: Martí authorship; 1978 collection edition; note says four issues for children of America, published in New York July-October 1889; contents list stories, history, art.','何塞·马蒂创作 La Edad de Oro','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0879','V1-REL-0581','WCD10-B10-S004','SRC-0666','Abdala / José Martí | Biblioteca Virtual Miguel de Cervantes','Bibliographic record lines 8-22 and 25: title, Martí authorship, reproduction from Obras Completas vol. 18 Teatro-Novela-La Edad de Oro pages 11-24, Spanish language, Cuban 19th-century theatre classification.','何塞·马蒂创作 Abdala','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0880','V1-REL-0582','WCD10-B10-S101','SRC-0188','Nicanor Parra (1914-2018)','正文第80、108–112行及时间线第475–491、510–526行，实读日期2026-10-12。第108–109行直接说明 Poemas y antipoemas (1954) 开启反诗模式，其诗句带有讽刺、使用日常直接语言；第110行说明 La cueca larga (1958) 取材于智利民间欢庆节奏并予以戏仿；第111–112行列出 Obra gruesa (1969)、Sermones y prédicas del Cristo de Elqui (1977) 等作品，并称这些书展示反诗模式及其演进。','尼卡诺尔·帕拉创作《长奎卡舞曲》（La cueca larga）。','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0881','V1-REL-0582','WCD10-B10-S102','SRC-0189','Fichas bibliográficas I — Nicanor Parra','正文第0–4行标题署Federico Schopf；第12、19、29–30、49行列La Cueca Larga、Obra Gruesa、Sermones y Prédicas del Cristo de Elqui、Discursos de Sobremesa的书目信息及版本注记。实读日期2026-10-12。','尼卡诺尔·帕拉创作《长奎卡舞曲》（La cueca larga）。','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0882','V1-REL-0583','WCD10-B10-S101','SRC-0188','Nicanor Parra (1914-2018)','正文第80、108–112行及时间线第475–491、510–526行，实读日期2026-10-12。第108–109行直接说明 Poemas y antipoemas (1954) 开启反诗模式，其诗句带有讽刺、使用日常直接语言；第110行说明 La cueca larga (1958) 取材于智利民间欢庆节奏并予以戏仿；第111–112行列出 Obra gruesa (1969)、Sermones y prédicas del Cristo de Elqui (1977) 等作品，并称这些书展示反诗模式及其演进。','尼卡诺尔·帕拉创作《厚重作品》（Obra gruesa）。','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0883','V1-REL-0583','WCD10-B10-S102','SRC-0189','Fichas bibliográficas I — Nicanor Parra','正文第0–4行标题署Federico Schopf；第12、19、29–30、49行列La Cueca Larga、Obra Gruesa、Sermones y Prédicas del Cristo de Elqui、Discursos de Sobremesa的书目信息及版本注记。实读日期2026-10-12。','尼卡诺尔·帕拉创作《厚重作品》（Obra gruesa）。','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0884','V1-REL-0584','WCD10-B10-S101','SRC-0188','Nicanor Parra (1914-2018)','正文第80、108–112行及时间线第475–491、510–526行，实读日期2026-10-12。第108–109行直接说明 Poemas y antipoemas (1954) 开启反诗模式，其诗句带有讽刺、使用日常直接语言；第110行说明 La cueca larga (1958) 取材于智利民间欢庆节奏并予以戏仿；第111–112行列出 Obra gruesa (1969)、Sermones y prédicas del Cristo de Elqui (1977) 等作品，并称这些书展示反诗模式及其演进。','尼卡诺尔·帕拉创作《埃尔基基督的布道与讲道》（Sermones y prédicas del Cristo de Elqui）。','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0885','V1-REL-0584','WCD10-B10-S102','SRC-0189','Fichas bibliográficas I — Nicanor Parra','正文第0–4行标题署Federico Schopf；第12、19、29–30、49行列La Cueca Larga、Obra Gruesa、Sermones y Prédicas del Cristo de Elqui、Discursos de Sobremesa的书目信息及版本注记。实读日期2026-10-12。','尼卡诺尔·帕拉创作《埃尔基基督的布道与讲道》（Sermones y prédicas del Cristo de Elqui）。','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0886','V1-REL-0585','WCD10-B10-S101','SRC-0188','Nicanor Parra (1914-2018)','正文第80、108–112行及时间线第475–491、510–526行，实读日期2026-10-12。第108–109行直接说明 Poemas y antipoemas (1954) 开启反诗模式，其诗句带有讽刺、使用日常直接语言；第110行说明 La cueca larga (1958) 取材于智利民间欢庆节奏并予以戏仿；第111–112行列出 Obra gruesa (1969)、Sermones y prédicas del Cristo de Elqui (1977) 等作品，并称这些书展示反诗模式及其演进。','尼卡诺尔·帕拉创作《明信片诗作集》（Artefactos），1972年以明信片形式出版。','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0887','V1-REL-0585','WCD10-B10-S102','SRC-0189','Fichas bibliográficas I — Nicanor Parra','正文第0–4行标题署Federico Schopf；第12、19、29–30、49行列La Cueca Larga、Obra Gruesa、Sermones y Prédicas del Cristo de Elqui、Discursos de Sobremesa的书目信息及版本注记。实读日期2026-10-12。','尼卡诺尔·帕拉创作《明信片诗作集》（Artefactos），1972年以明信片形式出版。','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0888','V1-REL-0586','WCD10-B10-S201','SRC-0192','CVC. Alejandra Pizarnik. Bibliografía. Obras','网页全文第13-21、27-30、44-47、66-70、81-84行；直接列作品书目、出版年与部分出版信息。2026-10-12实读。','阿莱杭德拉·皮扎尼克创作 La tierra más ajena','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0889','V1-REL-0586','WCD10-B10-S208','SRC-0680','CVC. Alejandra Pizarnik: leyenda de una vida tras de su obra','网页全文第14-17行；直接称《La tierra más ajena》为1955年首部诗集；第15行评论写作由韵文向散文延展。2026-10-12实读。','阿莱杭德拉·皮扎尼克创作 La tierra más ajena','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0890','V1-REL-0587','WCD10-B10-S201','SRC-0192','CVC. Alejandra Pizarnik. Bibliografía. Obras','网页全文第13-21、27-30、44-47、66-70、81-84行；直接列作品书目、出版年与部分出版信息。2026-10-12实读。','阿莱杭德拉·皮扎尼克创作 La última inocencia','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0891','V1-REL-0587','WCD10-B10-S205','SRC-0677','CVC. Alejandra Pizarnik. Obra. La última inocencia','网页全文第5-17行；明示1956年，并评论书名来源、梦境与记忆意象。2026-10-12实读。','阿莱杭德拉·皮扎尼克创作 La última inocencia','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0892','V1-REL-0588','WCD10-B10-S201','SRC-0192','CVC. Alejandra Pizarnik. Bibliografía. Obras','网页全文第13-21、27-30、44-47、66-70、81-84行；直接列作品书目、出版年与部分出版信息。2026-10-12实读。','阿莱杭德拉·皮扎尼克创作 Las aventuras perdidas','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0893','V1-REL-0588','WCD10-B10-S206','SRC-0678','CVC. Alejandra Pizarnik. Obra. Las aventuras perdidas','网页全文第5-17行；明示1958年，评论精神分析、超现实主义意象及镜像/迷失方向。2026-10-12实读。','阿莱杭德拉·皮扎尼克创作 Las aventuras perdidas','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0894','V1-REL-0589','WCD10-B10-S201','SRC-0192','CVC. Alejandra Pizarnik. Bibliografía. Obras','网页全文第13-21、27-30、44-47、66-70、81-84行；直接列作品书目、出版年与部分出版信息。2026-10-12实读。','阿莱杭德拉·皮扎尼克创作 La condesa sangrienta','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0895','V1-REL-0589','WCD10-B10-S207','SRC-0679','CVC. Alejandra Pizarnik. Obra. La condesa sangrienta','网页全文第12-13、20行；记1965年墨西哥首次预告、1966年发表于Testigo、1971年以书本版出版，并称为essay-poem-novel。2026-10-12实读。','阿莱杭德拉·皮扎尼克创作 La condesa sangrienta','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0896','V1-REL-0590','WCD10-B10-S201','SRC-0192','CVC. Alejandra Pizarnik. Bibliografía. Obras','网页全文第13-21、27-30、44-47、66-70、81-84行；直接列作品书目、出版年与部分出版信息。2026-10-12实读。','阿莱杭德拉·皮扎尼克创作 El infierno musical','high','eligible_evidence','WCD-10-B10'),
('V1-EV-0897','V1-REL-0590','WCD10-B10-S209','SRC-0681','CVC. Alejandra Pizarnik escondida en el lenguaje','网页全文第14-21行；将“Cold in hand blues”标为El infierno musical（1971）中的诗，并概述语言写作。2026-10-12实读。','阿莱杭德拉·皮扎尼克创作 El infierno musical','high','eligible_evidence','WCD-10-B10');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0374','WCD-10-B10-G01','research_gap','parra.discursos-de-sobremesa.work-description','open','当前已打开机构来源只给出作者作品目录、版本状态及书目封面；没有直接作品层内容介绍，暂不推断主题或体裁。','','Independent Reviewer: preserve preserve as catalog_only and research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0375','WCD-10-B10-G02','research_gap','parra.cancionero-sin-nombre.first-publication-year','open','Memoria Chilena正文叙述称1935，页面书目/封面及智利大学目录记录1937；未据初版实物或权威馆藏裁决首版年，不提原子年份候选。','','Independent Reviewer: preserve preserve disputed year as research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0376','WCD-10-B10-G03','research_gap','V1-ENT-0237:完整作品谱系/单篇/手稿/全部版本未穷尽','open','按DEC-070聚焦主要作品和有直接依据的描述，不追全集、所有单篇及全部版次。','','Independent Reviewer: preserve 保留合理研究缺口；本包不宣称作品目录完整。','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0377','WCD-10-B10:V1-ENT-0232','research_gap','WCD10:work_level_research:V1-ENT-0232','open','仍可扩充作品层研究；本批不声称学术穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0378','WCD-10-B10:V1-ENT-0233','research_gap','WCD10:work_level_research:V1-ENT-0233','open','仍可扩充作品层研究；本批不声称学术穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0379','WCD-10-B10:V1-ENT-0234','research_gap','WCD10:work_level_research:V1-ENT-0234','open','仍可扩充作品层研究；本批不声称学术穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0380','WCD-10-B10:V1-ENT-0376','research_gap','WCD10:work_level_research:V1-ENT-0376','open','仍可补充直接作品研究/说明；本批保留此缺口，不声称穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0381','WCD-10-B10:WCD10-B10-W001','research_gap','WCD10:work_level_research:V1-ENT-0610','open','作品层研究尚未展开；不声称学术研究完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0382','WCD-10-B10:WCD10-B10-W002','research_gap','WCD10:work_level_research:V1-ENT-0611','open','作品层研究尚未展开；不声称学术研究完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0383','WCD-10-B10:WCD10-B10-W003','research_gap','WCD10:work_level_research:V1-ENT-0612','open','作品层研究尚未展开；不声称学术研究完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0384','WCD-10-B10:V1-ENT-0239','research_gap','WCD10:work_level_research:V1-ENT-0239','open','未加入该书专门论文；目前机构作者专题已足以支持本条有限作品简介。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0385','WCD-10-B10:V1-ENT-0240','research_gap','WCD10:work_level_research:V1-ENT-0240','open','未加入单书专门研究；保留基线1962年首版，页面图版另有1971版不改变此值。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0386','WCD-10-B10:V1-ENT-0241','research_gap','WCD10:work_level_research:V1-ENT-0241','open','仍缺作品层内容描述的直接机构来源；现仅补充书目版本注记。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0387','WCD-10-B10:WCD10-B10-W101','research_gap','WCD10:work_level_research:V1-ENT-0613','open','作品个别版本及专门研究未穷尽；候选仅记录来源直接支持的书目、体裁和短描述。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0388','WCD-10-B10:WCD10-B10-W102','research_gap','WCD10:work_level_research:V1-ENT-0614','open','作品个别版本及专门研究未穷尽；候选仅记录来源直接支持的书目、体裁和短描述。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0389','WCD-10-B10:WCD10-B10-W103','research_gap','WCD10:work_level_research:V1-ENT-0615','open','作品个别版本及专门研究未穷尽；候选仅记录来源直接支持的书目、体裁和短描述。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0390','WCD-10-B10:WCD10-B10-W104','research_gap','WCD10:work_level_research:V1-ENT-0616','open','作品内部具体卡片与诗作内容未逐项建模；不把媒介形式下推为每张卡片的完整内容说明。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0391','WCD-10-B10:V1-ENT-0242','research_gap','WCD10:work_level_research:V1-ENT-0242','open','本条为归属明确的CVC机构评论；作品专门研究、版本及单篇谱系仍可继续核实。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0392','WCD-10-B10:V1-ENT-0243','research_gap','WCD10:work_level_research:V1-ENT-0243','open','本条为归属明确的CVC机构评论；作品专门研究、版本及单篇谱系仍可继续核实。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0393','WCD-10-B10:V1-ENT-0244','research_gap','WCD10:work_level_research:V1-ENT-0244','open','本条为归属明确的CVC机构评论；作品专门研究、版本及单篇谱系仍可继续核实。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0394','WCD-10-B10:WCD10-B10-W201','research_gap','WCD10:work_level_research:V1-ENT-0617','open','作品专门学术研究、诗集内部单篇、手稿及所有版本谱系未穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0395','WCD-10-B10:WCD10-B10-W202','research_gap','WCD10:work_level_research:V1-ENT-0618','open','作品专门学术研究、诗集内部单篇、手稿及所有版本谱系未穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0396','WCD-10-B10:WCD10-B10-W203','research_gap','WCD10:work_level_research:V1-ENT-0619','open','作品专门学术研究、诗集内部单篇、手稿及所有版本谱系未穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0397','WCD-10-B10:WCD10-B10-W204','research_gap','WCD10:work_level_research:V1-ENT-0620','open','核定1965年首次预告与1966年Testigo刊载的文本关系；专门研究、手稿及版本谱系亦未穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0398','WCD-10-B10:WCD10-B10-W205','research_gap','WCD10:work_level_research:V1-ENT-0621','open','作品专门学术研究、诗集内部单篇、手稿及所有版本谱系未穷尽。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');

UPDATE metadata SET value='WCD-10-B10' WHERE key='last_change_set';

UPDATE metadata SET value='2026-10-12' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 679 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 619 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 617 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 580 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1989 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 2430 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1968 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1232 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 588 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 926 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 897 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 398 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
