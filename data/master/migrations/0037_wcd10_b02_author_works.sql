-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: wcd10_b01_review

-- Registration sha256: dfb9371c05b0d74f4ecb7f282b14e745f356ad5a0915905e42cd4de748096e7d

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1055 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 554 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 280 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 387 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 385 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 1132 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1076 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 48 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 36 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 390 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 419 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 345 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 339 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B01' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0342' OR canonical_url='https://www.elem.mx/obra/datos/201070') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0343' OR canonical_url='https://www.elem.mx/obra/datos/450') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0344' OR canonical_url='https://www.elem.mx/obra/datos/451') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0345' OR canonical_url='https://www.elem.mx/obra/datos/207363') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0346' OR canonical_url='https://www.fcede.es/site/es/prensa/detalle.aspx?idNota=1703') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0347' OR canonical_url='https://utpress.utexas.edu/blog/2025/08/22/an-exploration-of-mexican-writer-juan-rulfo-through-literature-photography-film-and-music/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0348' OR canonical_url='https://www.lanovelacorta.com/images/ii-coloquio-novela-corta-mesa2-04.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0349' OR canonical_url='https://www.bibliotecanacional.gov.co/es-co/colecciones/biblioteca-digital/gaboteca/obras-de-ggm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0350' OR canonical_url='https://centrogabo.org/cronologia/la-hojarasca') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0351' OR canonical_url='https://www.agenciabalcells.com/autores/obra/gabriel-garcia-marquez/la-hojarasca/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0352' OR canonical_url='https://www.agenciabalcells.com/autores/obra/gabriel-garcia-marquez/la-mala-hora/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0353' OR canonical_url='https://www.agenciabalcells.com/autores/obra/gabriel-garcia-marquez/los-funerales-de-la-mama-grande/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0354' OR canonical_url='https://www.agenciabalcells.com/autores/obra/gabriel-garcia-marquez/la-increible-y-triste-historia-de-la-candida-erendira-y-de-su-abuela-desalmada/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0355' OR canonical_url='https://www.agenciabalcells.com/autores/obra/gabriel-garcia-marquez/doce-cuentos-peregrinos/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0356' OR canonical_url='https://www.agenciabalcells.com/autores/obra/gabriel-garcia-marquez/el-general-en-su-laberinto/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0357' OR canonical_url='https://www.penguinrandomhouse.com/books/324593/del-amor-y-otros-demonios-by-gabriel-garcia-marquez/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0358' OR canonical_url='https://www.agenciabalcells.com/autores/obra/gabriel-garcia-marquez/el-amor-en-los-tiempos-del-colera/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0359' OR canonical_url='https://www.agenciabalcells.com/autores/obra/gabriel-garcia-marquez/el-otono-del-patriarca/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0390' OR (entity_type='collection' AND original_name='Ciudad real')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0391' OR (entity_type='collection' AND original_name='Los convidados de agosto')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0392' OR (entity_type='collection' AND original_name='Álbum de familia')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0393' OR (entity_type='work' AND original_name='La hojarasca')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0394' OR (entity_type='work' AND original_name='La mala hora')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0395' OR (entity_type='collection' AND original_name='Los funerales de la Mamá Grande')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0396' OR (entity_type='collection' AND original_name='La increíble y triste historia de la cándida Eréndira y de su abuela desalmada')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0397' OR (entity_type='collection' AND original_name='Doce cuentos peregrinos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0398' OR (entity_type='work' AND original_name='El general en su laberinto')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0399' OR (entity_type='work' AND original_name='Del amor y otros demonios')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1083' OR (subject_id='V1-ENT-0390' AND fact_field='first_publication_year' AND value_text='1960')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1084' OR (subject_id='V1-ENT-0390' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1085' OR (subject_id='V1-ENT-0390' AND fact_field='one_sentence_summary' AND value_text='围绕恰帕斯原住民与拉迪诺人的生活展开，呈现地方社会中的偏见和不公。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1086' OR (subject_id='V1-ENT-0391' AND fact_field='first_publication_year' AND value_text='1964')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1087' OR (subject_id='V1-ENT-0391' AND fact_field='genre_or_form' AND value_text='短篇小说集（含中篇）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1088' OR (subject_id='V1-ENT-0391' AND fact_field='one_sentence_summary' AND value_text='由三篇短篇和中篇《鳏夫罗曼》组成，叙写外省中产阶层受传统与偏见约束的生活。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1089' OR (subject_id='V1-ENT-0392' AND fact_field='first_publication_year' AND value_text='1971')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1090' OR (subject_id='V1-ENT-0392' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1091' OR (subject_id='V1-ENT-0392' AND fact_field='one_sentence_summary' AND value_text='四篇故事分别触及新婚日常、周日聚会、母亲与子女以及女性知识分子的文学交往。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1092' OR (subject_id='V1-ENT-0393' AND fact_field='first_publication_year' AND value_text='1955')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1093' OR (subject_id='V1-ENT-0393' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1094' OR (subject_id='V1-ENT-0393' AND fact_field='story_premise' AND value_text='马孔多一位受憎恨的医生死后，上校坚持履行安葬他的承诺；上校、女儿和外孙的内心叙述交织呈现往事。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1095' OR (subject_id='V1-ENT-0394' AND fact_field='first_publication_year' AND value_text='1962')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1096' OR (subject_id='V1-ENT-0394' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1097' OR (subject_id='V1-ENT-0394' AND fact_field='story_premise' AND value_text='一座小镇出现揭露私人秘密的匿名告示，猜忌和谣言逐渐引发杀人及更广泛的暴力。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1098' OR (subject_id='V1-ENT-0395' AND fact_field='first_publication_year' AND value_text='1962')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1099' OR (subject_id='V1-ENT-0395' AND fact_field='genre_or_form' AND value_text='短篇小说集（含中篇）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1100' OR (subject_id='V1-ENT-0395' AND fact_field='one_sentence_summary' AND value_text='七篇故事与同名中篇组成的作品集；书名篇围绕一位地方女统治者的葬礼展开。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1101' OR (subject_id='V1-ENT-0396' AND fact_field='first_publication_year' AND value_text='1972')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1102' OR (subject_id='V1-ENT-0396' AND fact_field='genre_or_form' AND value_text='短篇小说集（含中篇）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1103' OR (subject_id='V1-ENT-0396' AND fact_field='one_sentence_summary' AND value_text='由同名中篇和另外六篇故事组成；书名篇讲述埃伦迪拉与祖母的故事，不代表全书只有这一条情节。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1104' OR (subject_id='V1-ENT-0397' AND fact_field='first_publication_year' AND value_text='1992')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1105' OR (subject_id='V1-ENT-0397' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1106' OR (subject_id='V1-ENT-0397' AND fact_field='one_sentence_summary' AND value_text='十二篇故事围绕生活在欧洲的拉丁美洲人展开，叙写他们在不同城市的生活与意外际遇。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1107' OR (subject_id='V1-ENT-0398' AND fact_field='first_publication_year' AND value_text='1989')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1108' OR (subject_id='V1-ENT-0398' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1109' OR (subject_id='V1-ENT-0398' AND fact_field='story_premise' AND value_text='病中的西蒙·玻利瓦尔从波哥大沿马格达莱纳河开始最后旅程，途中回顾政治理想和自己的过去。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1110' OR (subject_id='V1-ENT-0399' AND fact_field='first_publication_year' AND value_text='1994')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1111' OR (subject_id='V1-ENT-0399' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1112' OR (subject_id='V1-ENT-0399' AND fact_field='story_premise' AND value_text='故事发生在十八世纪殖民时期的哥伦比亚海岸，围绕少女西尔瓦·玛丽亚与神父卡耶塔诺·德劳拉的爱情及其毁灭展开。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1113' OR (subject_id='V1-ENT-0036' AND fact_field='story_premise' AND value_text='故事围绕恰帕斯原住民和拉迪诺人之间的土地、宗教与权力冲突展开。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1114' OR (subject_id='V1-ENT-0037' AND fact_field='one_sentence_summary' AND value_text='汇集卡斯特利亚诺斯1948至1971年的诗作，并收入她翻译的艾米莉·狄金森、保罗·克洛岱尔和圣琼·佩斯的诗。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1115' OR (subject_id='V1-ENT-0044' AND fact_field='genre_or_form' AND value_text='戏剧／讽剧')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1116' OR (subject_id='V1-ENT-0044' AND fact_field='story_premise' AND value_text='这部讽剧以幽默的方式呈现女性在男性主导的社会中面对的处境与角色期待。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1117' OR (subject_id='V1-ENT-0044' AND fact_field='bibliographic_note' AND value_text='ELEM登记墨西哥文化经济基金会1975年《墨西哥文学》系列第115号书版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1118' OR (subject_id='V1-ENT-0040' AND fact_field='first_publication_year' AND value_text='1980')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1119' OR (subject_id='V1-ENT-0040' AND fact_field='story_premise' AND value_text='迪奥尼西奥在市集与赌局间谋生，凭运气从贫穷走向富裕，最终又失去财富。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1120' OR (subject_id='V1-ENT-0040' AND fact_field='research_note' AND value_text='Françoise Perus 在《El gallo de oro, de Juan Rulfo: aproximaciones a una obra «olvidada»》中讨论 nouvelle 的体裁记忆及文学与电影的形式差异，指出与电影的关联并不抹去《金鸡》作为文学文本的性质。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1121' OR (subject_id='V1-ENT-0158' AND fact_field='story_premise' AND value_text='费尔米娜·达萨与弗洛伦蒂诺·阿里萨在加勒比港口城市经历相识、分离和漫长等待，半个世纪后再次面对彼此的感情。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1122' OR (subject_id='V1-ENT-0159' AND fact_field='story_premise' AND value_text='小说以循环展开的叙述回望一位独裁者的统治、衰老与死亡。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0348' OR (subject_id='V1-ENT-0030' AND relation_type='CREATED' AND object_id='V1-ENT-0390')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0349' OR (subject_id='V1-ENT-0030' AND relation_type='CREATED' AND object_id='V1-ENT-0391')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0350' OR (subject_id='V1-ENT-0030' AND relation_type='CREATED' AND object_id='V1-ENT-0392')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0351' OR (subject_id='V1-ENT-0072' AND relation_type='CREATED' AND object_id='V1-ENT-0393')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0352' OR (subject_id='V1-ENT-0072' AND relation_type='CREATED' AND object_id='V1-ENT-0394')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0353' OR (subject_id='V1-ENT-0072' AND relation_type='CREATED' AND object_id='V1-ENT-0395')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0354' OR (subject_id='V1-ENT-0072' AND relation_type='CREATED' AND object_id='V1-ENT-0396')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0355' OR (subject_id='V1-ENT-0072' AND relation_type='CREATED' AND object_id='V1-ENT-0397')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0356' OR (subject_id='V1-ENT-0072' AND relation_type='CREATED' AND object_id='V1-ENT-0398')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0357' OR (subject_id='V1-ENT-0072' AND relation_type='CREATED' AND object_id='V1-ENT-0399')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0358' OR (subject_id='V1-ENT-0393' AND relation_type='SET_IN' AND object_id='V1-ENT-0097')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0342','WCD10-B02-S01','Ciudad real - Detalle de la obra','Ciudad real - Detalle de la obra','Fundación para las Letras Mexicanas / ELEM','','Fundación para las Letras Mexicanas','','','institutional_work_record','','es','B','access_pass','WCD-10-B02','metadata_and_summary','remote_only','','https://www.elem.mx/obra/datos/201070'),
('SRC-0343','WCD10-B02-S02','Los convidados de agosto - Detalle de la obra','Los convidados de agosto - Detalle de la obra','Fundación para las Letras Mexicanas / ELEM','','Fundación para las Letras Mexicanas','','','institutional_work_record','','es','B','access_pass','WCD-10-B02','metadata_and_summary','remote_only','','https://www.elem.mx/obra/datos/450'),
('SRC-0344','WCD10-B02-S03','Álbum de familia - Detalle de la obra','Álbum de familia - Detalle de la obra','Fundación para las Letras Mexicanas / ELEM','','Fundación para las Letras Mexicanas','','','institutional_work_record','','es','B','access_pass','WCD-10-B02','metadata_and_summary','remote_only','','https://www.elem.mx/obra/datos/451'),
('SRC-0345','WCD10-B02-S04','El eterno femenino - Detalle de la obra','El eterno femenino - Detalle de la obra','Fundación para las Letras Mexicanas / ELEM','','Fundación para las Letras Mexicanas','','','institutional_work_record','','es','B','access_pass','WCD-10-B02','metadata_and_summary','remote_only','','https://www.elem.mx/obra/datos/207363'),
('SRC-0346','WCD10-B02-S06','Rosario Castellanos. Poesía no eres tú','Rosario Castellanos. Poesía no eres tú','Santos Domínguez / Encuentros de lecturas; Fondo de Cultura Económica转载','','Fondo de Cultura Económica (署名转载)','2018','','syndicated_book_commentary','','es','B','access_pass','WCD-10-B02','metadata_and_summary','remote_only','','https://www.fcede.es/site/es/prensa/detalle.aspx?idNota=1703'),
('SRC-0347','WCD10-B02-S07','An Exploration of Mexican Writer Juan Rulfo through Literature, Photography, Film, and Music','An Exploration of Mexican Writer Juan Rulfo through Literature, Photography, Film, and Music','Douglas J. Weatherford / University of Texas Press','','University of Texas Press','2025','','publisher_signed_article','','en','B','access_pass','WCD-10-B02','metadata_and_summary','remote_only','','https://utpress.utexas.edu/blog/2025/08/22/an-exploration-of-mexican-writer-juan-rulfo-through-literature-photography-film-and-music/'),
('SRC-0348','WCD10-B02-S08','El gallo de oro, de Juan Rulfo: aproximaciones a una obra «olvidada»','El gallo de oro, de Juan Rulfo: aproximaciones a una obra «olvidada»','Françoise Perus / CIALC-IIS-UNAM','','La Novela Corta / CIALC-IIS-UNAM','','','conference_paper','9','es','B','access_pass','WCD-10-B02','metadata_and_summary','remote_only','','https://www.lanovelacorta.com/images/ii-coloquio-novela-corta-mesa2-04.pdf'),
('SRC-0349','WCD10-B02-S09','Gaboteca: Obras de Ggm','Gaboteca: Obras de Ggm','Biblioteca Nacional de Colombia','','Biblioteca Nacional de Colombia','','','institutional_bibliography','','es','B','access_pass','WCD-10-B02','metadata_and_summary','remote_only','','https://www.bibliotecanacional.gov.co/es-co/colecciones/biblioteca-digital/gaboteca/obras-de-ggm'),
('SRC-0350','WCD10-B02-S10','La hojarasca | Centro Gabo','La hojarasca | Centro Gabo','Fundación Gabo / Centro Gabo','','Fundación Gabo / Centro Gabo','','','institutional_bibliography','','es','B','access_pass','WCD-10-B02','metadata_and_summary','remote_only','','https://centrogabo.org/cronologia/la-hojarasca'),
('SRC-0351','WCD10-B02-S11','La hojarasca: Agencia Literaria Carmen Balcells','La hojarasca: Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_catalog','','es','B','access_pass','WCD-10-B02','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/autores/obra/gabriel-garcia-marquez/la-hojarasca/'),
('SRC-0352','WCD10-B02-S12','La mala hora: Agencia Literaria Carmen Balcells','La mala hora: Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_catalog','','es','B','access_pass','WCD-10-B02','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/autores/obra/gabriel-garcia-marquez/la-mala-hora/'),
('SRC-0353','WCD10-B02-S13','Los funerales de la Mamá Grande: Agencia Literaria Carmen Balcells','Los funerales de la Mamá Grande: Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_catalog','','es','B','access_pass','WCD-10-B02','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/autores/obra/gabriel-garcia-marquez/los-funerales-de-la-mama-grande/'),
('SRC-0354','WCD10-B02-S14','La increíble y triste historia de la Cándida Eréndira y de su abuela desalmada: Agencia Literaria Carmen Balcells','La increíble y triste historia de la Cándida Eréndira y de su abuela desalmada: Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_catalog','','es','B','access_pass','WCD-10-B02','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/autores/obra/gabriel-garcia-marquez/la-increible-y-triste-historia-de-la-candida-erendira-y-de-su-abuela-desalmada/'),
('SRC-0355','WCD10-B02-S15','Doce cuentos peregrinos: Agencia Literaria Carmen Balcells','Doce cuentos peregrinos: Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_catalog','','es','B','access_pass','WCD-10-B02','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/autores/obra/gabriel-garcia-marquez/doce-cuentos-peregrinos/'),
('SRC-0356','WCD10-B02-S16','El general en su laberinto: Agencia Literaria Carmen Balcells','El general en su laberinto: Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_catalog','','es','B','access_pass','WCD-10-B02','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/autores/obra/gabriel-garcia-marquez/el-general-en-su-laberinto/'),
('SRC-0357','WCD10-B02-S17','Del Amor y Otros Demonios','Del Amor y Otros Demonios','Penguin Books / Penguin Random House','','Penguin Books / Penguin Random House','','','publisher_catalog','','en','B','access_pass','WCD-10-B02','metadata_and_summary','remote_only','','https://www.penguinrandomhouse.com/books/324593/del-amor-y-otros-demonios-by-gabriel-garcia-marquez/'),
('SRC-0358','WCD10-B02-S18','El amor en los tiempos del cólera: Agencia Literaria Carmen Balcells','El amor en los tiempos del cólera: Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_catalog','','es','B','access_pass','WCD-10-B02','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/autores/obra/gabriel-garcia-marquez/el-amor-en-los-tiempos-del-colera/'),
('SRC-0359','WCD10-B02-S19','El otoño del patriarca: Agencia Literaria Carmen Balcells','El otoño del patriarca: Agencia Literaria Carmen Balcells','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','publisher_catalog','','es','B','access_pass','WCD-10-B02','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/autores/obra/gabriel-garcia-marquez/el-otono-del-patriarca/');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0390','collection','《真实之城》（暂译）','Ciudad real','candidate','1','WCD10-B02-W01','补现有CREATED清单未收录的可识别原作/合集；来源对象、层级、年份分别核验，不设作品数量KPI。; 中文显示名仅为暂译，尚未核对中文译本；原文题名为查重依据，不新增edition或单篇子节点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0391','collection','《八月的宾客》（暂译）','Los convidados de agosto','candidate','1','WCD10-B02-W02','补现有CREATED清单未收录的可识别原作/合集；来源对象、层级、年份分别核验，不设作品数量KPI。; 中文显示名仅为暂译，尚未核对中文译本；原文题名为查重依据，不新增edition或单篇子节点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0392','collection','《家庭相册》（暂译）','Álbum de familia','candidate','1','WCD10-B02-W03','补现有CREATED清单未收录的可识别原作/合集；来源对象、层级、年份分别核验，不设作品数量KPI。; 中文显示名仅为暂译，尚未核对中文译本；原文题名为查重依据，不新增edition或单篇子节点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0393','work','《枯枝败叶》（暂译）','La hojarasca','candidate','1','WCD10-B02-W04','补现有CREATED清单未收录的可识别原作/合集；来源对象、层级、年份分别核验，不设作品数量KPI。; 中文显示名仅为暂译，尚未核对中文译本；原文题名为查重依据，不新增edition或单篇子节点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0394','work','《恶时辰》（暂译）','La mala hora','candidate','1','WCD10-B02-W05','补现有CREATED清单未收录的可识别原作/合集；来源对象、层级、年份分别核验，不设作品数量KPI。; 中文显示名仅为暂译，尚未核对中文译本；原文题名为查重依据，不新增edition或单篇子节点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0395','collection','《大妈妈的葬礼》（暂译）','Los funerales de la Mamá Grande','candidate','1','WCD10-B02-W06','补现有CREATED清单未收录的可识别原作/合集；来源对象、层级、年份分别核验，不设作品数量KPI。; 中文显示名仅为暂译，尚未核对中文译本；原文题名为查重依据，不新增edition或单篇子节点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0396','collection','《纯真的埃伦迪拉和她残忍的祖母令人难以置信的悲惨故事》（暂译）','La increíble y triste historia de la cándida Eréndira y de su abuela desalmada','candidate','1','WCD10-B02-W07','补现有CREATED清单未收录的可识别原作/合集；来源对象、层级、年份分别核验，不设作品数量KPI。; 中文显示名仅为暂译，尚未核对中文译本；原文题名为查重依据，不新增edition或单篇子节点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0397','collection','《十二个异乡故事》（暂译）','Doce cuentos peregrinos','candidate','1','WCD10-B02-W08','补现有CREATED清单未收录的可识别原作/合集；来源对象、层级、年份分别核验，不设作品数量KPI。; 中文显示名仅为暂译，尚未核对中文译本；原文题名为查重依据，不新增edition或单篇子节点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0398','work','《迷宫中的将军》（暂译）','El general en su laberinto','candidate','1','WCD10-B02-W09','补现有CREATED清单未收录的可识别原作/合集；来源对象、层级、年份分别核验，不设作品数量KPI。; 中文显示名仅为暂译，尚未核对中文译本；原文题名为查重依据，不新增edition或单篇子节点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0399','work','《爱情和其他魔鬼》（暂译）','Del amor y otros demonios','candidate','1','WCD10-B02-W10','补现有CREATED清单未收录的可识别原作/合集；来源对象、层级、年份分别核验，不设作品数量KPI。; 中文显示名仅为暂译，尚未核对中文译本；原文题名为查重依据，不新增edition或单篇子节点。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0386','WCD10-B02-W01','WCD-10-B02','WCD10-B02-W01','V1-ENT-0390','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0387','WCD10-B02-W02','WCD-10-B02','WCD10-B02-W02','V1-ENT-0391','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0388','WCD10-B02-W03','WCD-10-B02','WCD10-B02-W03','V1-ENT-0392','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0389','WCD10-B02-W04','WCD-10-B02','WCD10-B02-W04','V1-ENT-0393','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0390','WCD10-B02-W05','WCD-10-B02','WCD10-B02-W05','V1-ENT-0394','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0391','WCD10-B02-W06','WCD-10-B02','WCD10-B02-W06','V1-ENT-0395','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0392','WCD10-B02-W07','WCD-10-B02','WCD10-B02-W07','V1-ENT-0396','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0393','WCD10-B02-W08','WCD-10-B02','WCD10-B02-W08','V1-ENT-0397','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0394','WCD10-B02-W09','WCD-10-B02','WCD10-B02-W09','V1-ENT-0398','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0395','WCD10-B02-W10','WCD-10-B02','WCD10-B02-W10','V1-ENT-0399','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0281','WCD-10-B02:V1-ENT-0390','V1-ENT-0390','collection','《真实之城》（暂译）','罗萨里奥·卡斯特利亚诺斯','Ciudad real','墨西哥','es','1960','短篇小说集','WCD-10-B02','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《真实之城》（暂译）｜Ciudad real

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1960
- genre_or_form：短篇小说集
- one_sentence_summary：围绕恰帕斯原住民与拉迪诺人的生活展开，呈现地方社会中的偏见和不公。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0282','WCD-10-B02:V1-ENT-0391','V1-ENT-0391','collection','《八月的宾客》（暂译）','罗萨里奥·卡斯特利亚诺斯','Los convidados de agosto','墨西哥','es','1964','短篇小说集（含中篇）','WCD-10-B02','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《八月的宾客》（暂译）｜Los convidados de agosto

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1964
- genre_or_form：短篇小说集（含中篇）
- one_sentence_summary：由三篇短篇和中篇《鳏夫罗曼》组成，叙写外省中产阶层受传统与偏见约束的生活。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0283','WCD-10-B02:V1-ENT-0392','V1-ENT-0392','collection','《家庭相册》（暂译）','罗萨里奥·卡斯特利亚诺斯','Álbum de familia','墨西哥','es','1971','短篇小说集','WCD-10-B02','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《家庭相册》（暂译）｜Álbum de familia

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1971
- genre_or_form：短篇小说集
- one_sentence_summary：四篇故事分别触及新婚日常、周日聚会、母亲与子女以及女性知识分子的文学交往。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0284','WCD-10-B02:V1-ENT-0393','V1-ENT-0393','work','《枯枝败叶》（暂译）','加西亚·马尔克斯','La hojarasca','哥伦比亚','es','1955','小说','WCD-10-B02','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《枯枝败叶》（暂译）｜La hojarasca

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1955
- genre_or_form：小说
- story_premise：马孔多一位受憎恨的医生死后，上校坚持履行安葬他的承诺；上校、女儿和外孙的内心叙述交织呈现往事。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0285','WCD-10-B02:V1-ENT-0394','V1-ENT-0394','work','《恶时辰》（暂译）','加西亚·马尔克斯','La mala hora','哥伦比亚','es','1962','小说','WCD-10-B02','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《恶时辰》（暂译）｜La mala hora

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1962
- genre_or_form：小说
- story_premise：一座小镇出现揭露私人秘密的匿名告示，猜忌和谣言逐渐引发杀人及更广泛的暴力。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0286','WCD-10-B02:V1-ENT-0395','V1-ENT-0395','collection','《大妈妈的葬礼》（暂译）','加西亚·马尔克斯','Los funerales de la Mamá Grande','哥伦比亚','es','1962','短篇小说集（含中篇）','WCD-10-B02','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《大妈妈的葬礼》（暂译）｜Los funerales de la Mamá Grande

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1962
- genre_or_form：短篇小说集（含中篇）
- one_sentence_summary：七篇故事与同名中篇组成的作品集；书名篇围绕一位地方女统治者的葬礼展开。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0287','WCD-10-B02:V1-ENT-0396','V1-ENT-0396','collection','《纯真的埃伦迪拉和她残忍的祖母令人难以置信的悲惨故事》（暂译）','加西亚·马尔克斯','La increíble y triste historia de la cándida Eréndira y de su abuela desalmada','哥伦比亚','es','1972','短篇小说集（含中篇）','WCD-10-B02','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《纯真的埃伦迪拉和她残忍的祖母令人难以置信的悲惨故事》（暂译）｜La increíble y triste historia de la cándida Eréndira y de su abuela desalmada

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1972
- genre_or_form：短篇小说集（含中篇）
- one_sentence_summary：由同名中篇和另外六篇故事组成；书名篇讲述埃伦迪拉与祖母的故事，不代表全书只有这一条情节。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0288','WCD-10-B02:V1-ENT-0397','V1-ENT-0397','collection','《十二个异乡故事》（暂译）','加西亚·马尔克斯','Doce cuentos peregrinos','哥伦比亚','es','1992','短篇小说集','WCD-10-B02','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《十二个异乡故事》（暂译）｜Doce cuentos peregrinos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1992
- genre_or_form：短篇小说集
- one_sentence_summary：十二篇故事围绕生活在欧洲的拉丁美洲人展开，叙写他们在不同城市的生活与意外际遇。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0289','WCD-10-B02:V1-ENT-0398','V1-ENT-0398','work','《迷宫中的将军》（暂译）','加西亚·马尔克斯','El general en su laberinto','哥伦比亚','es','1989','小说','WCD-10-B02','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《迷宫中的将军》（暂译）｜El general en su laberinto

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1989
- genre_or_form：小说
- story_premise：病中的西蒙·玻利瓦尔从波哥大沿马格达莱纳河开始最后旅程，途中回顾政治理想和自己的过去。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0290','WCD-10-B02:V1-ENT-0399','V1-ENT-0399','work','《爱情和其他魔鬼》（暂译）','加西亚·马尔克斯','Del amor y otros demonios','哥伦比亚','es','1994','小说','WCD-10-B02','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《爱情和其他魔鬼》（暂译）｜Del amor y otros demonios

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1994
- genre_or_form：小说
- story_premise：故事发生在十八世纪殖民时期的哥伦比亚海岸，围绕少女西尔瓦·玛丽亚与神父卡耶塔诺·德劳拉的爱情及其毁灭展开。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0291','WCD-10-B02:V1-ENT-0036','V1-ENT-0036','work','《黑暗的职守》','罗萨里奥·卡斯特利亚诺斯','Oficio de tinieblas','墨西哥','es','','','WCD-10-B02','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《黑暗的职守》｜Oficio de tinieblas

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- story_premise：故事围绕恰帕斯原住民和拉迪诺人之间的土地、宗教与权力冲突展开。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0292','WCD-10-B02:V1-ENT-0037','V1-ENT-0037','collection','《诗歌不是你》','罗萨里奥·卡斯特利亚诺斯','Poesía no eres tú','墨西哥','es','','','WCD-10-B02','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《诗歌不是你》｜Poesía no eres tú

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：汇集卡斯特利亚诺斯1948至1971年的诗作，并收入她翻译的艾米莉·狄金森、保罗·克洛岱尔和圣琼·佩斯的诗。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0293','WCD-10-B02:V1-ENT-0044','V1-ENT-0044','work','《永恒的女性》','罗萨里奥·卡斯特利亚诺斯','El eterno femenino','墨西哥','es','','戏剧／讽剧','WCD-10-B02','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《永恒的女性》｜El eterno femenino

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：戏剧／讽剧
- story_premise：这部讽剧以幽默的方式呈现女性在男性主导的社会中面对的处境与角色期待。
- bibliographic_note：ELEM登记墨西哥文化经济基金会1975年《墨西哥文学》系列第115号书版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0294','WCD-10-B02:V1-ENT-0040','V1-ENT-0040','work','《金鸡》','胡安·鲁尔福','El gallo de oro','墨西哥','es','1980','','WCD-10-B02','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《金鸡》｜El gallo de oro

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1980
- story_premise：迪奥尼西奥在市集与赌局间谋生，凭运气从贫穷走向富裕，最终又失去财富。

#### 署名研究说明（research_note_only）

- Françoise Perus 在《El gallo de oro, de Juan Rulfo: aproximaciones a una obra «olvidada»》中讨论 nouvelle 的体裁记忆及文学与电影的形式差异，指出与电影的关联并不抹去《金鸡》作为文学文本的性质。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0295','WCD-10-B02:V1-ENT-0158','V1-ENT-0158','work','《霍乱时期的爱情》','加西亚·马尔克斯','El amor en los tiempos del cólera','哥伦比亚','es','','','WCD-10-B02','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《霍乱时期的爱情》｜El amor en los tiempos del cólera

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- story_premise：费尔米娜·达萨与弗洛伦蒂诺·阿里萨在加勒比港口城市经历相识、分离和漫长等待，半个世纪后再次面对彼此的感情。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0296','WCD-10-B02:V1-ENT-0159','V1-ENT-0159','work','《族长的秋天》','加西亚·马尔克斯','El otoño del patriarca','哥伦比亚','es','','','WCD-10-B02','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《族长的秋天》｜El otoño del patriarca

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- story_premise：小说以循环展开的叙述回望一位独裁者的统治、衰老与死亡。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-1083','WCD10-B02-W01-F01','V1-CARD-0281','V1-ENT-0390','first_publication_year','1960','bibliographic','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1084','WCD10-B02-W01-F02','V1-CARD-0281','V1-ENT-0390','genre_or_form','短篇小说集','bibliographic','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1085','WCD10-B02-W01-F03','V1-CARD-0281','V1-ENT-0390','one_sentence_summary','围绕恰帕斯原住民与拉迪诺人的生活展开，呈现地方社会中的偏见和不公。','institutional_paraphrase','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1086','WCD10-B02-W02-F01','V1-CARD-0282','V1-ENT-0391','first_publication_year','1964','bibliographic','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1087','WCD10-B02-W02-F02','V1-CARD-0282','V1-ENT-0391','genre_or_form','短篇小说集（含中篇）','bibliographic','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1088','WCD10-B02-W02-F03','V1-CARD-0282','V1-ENT-0391','one_sentence_summary','由三篇短篇和中篇《鳏夫罗曼》组成，叙写外省中产阶层受传统与偏见约束的生活。','institutional_paraphrase','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1089','WCD10-B02-W03-F01','V1-CARD-0283','V1-ENT-0392','first_publication_year','1971','bibliographic','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1090','WCD10-B02-W03-F02','V1-CARD-0283','V1-ENT-0392','genre_or_form','短篇小说集','bibliographic','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1091','WCD10-B02-W03-F03','V1-CARD-0283','V1-ENT-0392','one_sentence_summary','四篇故事分别触及新婚日常、周日聚会、母亲与子女以及女性知识分子的文学交往。','institutional_paraphrase','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1092','WCD10-B02-W04-F01','V1-CARD-0284','V1-ENT-0393','first_publication_year','1955','bibliographic','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1093','WCD10-B02-W04-F02','V1-CARD-0284','V1-ENT-0393','genre_or_form','小说','bibliographic','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1094','WCD10-B02-W04-F03','V1-CARD-0284','V1-ENT-0393','story_premise','马孔多一位受憎恨的医生死后，上校坚持履行安葬他的承诺；上校、女儿和外孙的内心叙述交织呈现往事。','institutional_paraphrase','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1095','WCD10-B02-W05-F01','V1-CARD-0285','V1-ENT-0394','first_publication_year','1962','bibliographic','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1096','WCD10-B02-W05-F02','V1-CARD-0285','V1-ENT-0394','genre_or_form','小说','bibliographic','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1097','WCD10-B02-W05-F03','V1-CARD-0285','V1-ENT-0394','story_premise','一座小镇出现揭露私人秘密的匿名告示，猜忌和谣言逐渐引发杀人及更广泛的暴力。','institutional_paraphrase','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1098','WCD10-B02-W06-F01','V1-CARD-0286','V1-ENT-0395','first_publication_year','1962','bibliographic','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1099','WCD10-B02-W06-F02','V1-CARD-0286','V1-ENT-0395','genre_or_form','短篇小说集（含中篇）','bibliographic','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1100','WCD10-B02-W06-F03','V1-CARD-0286','V1-ENT-0395','one_sentence_summary','七篇故事与同名中篇组成的作品集；书名篇围绕一位地方女统治者的葬礼展开。','institutional_paraphrase','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1101','WCD10-B02-W07-F01','V1-CARD-0287','V1-ENT-0396','first_publication_year','1972','bibliographic','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1102','WCD10-B02-W07-F02','V1-CARD-0287','V1-ENT-0396','genre_or_form','短篇小说集（含中篇）','bibliographic','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1103','WCD10-B02-W07-F03','V1-CARD-0287','V1-ENT-0396','one_sentence_summary','由同名中篇和另外六篇故事组成；书名篇讲述埃伦迪拉与祖母的故事，不代表全书只有这一条情节。','institutional_paraphrase','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1104','WCD10-B02-W08-F01','V1-CARD-0288','V1-ENT-0397','first_publication_year','1992','bibliographic','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1105','WCD10-B02-W08-F02','V1-CARD-0288','V1-ENT-0397','genre_or_form','短篇小说集','bibliographic','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1106','WCD10-B02-W08-F03','V1-CARD-0288','V1-ENT-0397','one_sentence_summary','十二篇故事围绕生活在欧洲的拉丁美洲人展开，叙写他们在不同城市的生活与意外际遇。','institutional_paraphrase','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1107','WCD10-B02-W09-F01','V1-CARD-0289','V1-ENT-0398','first_publication_year','1989','bibliographic','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1108','WCD10-B02-W09-F02','V1-CARD-0289','V1-ENT-0398','genre_or_form','小说','bibliographic','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1109','WCD10-B02-W09-F03','V1-CARD-0289','V1-ENT-0398','story_premise','病中的西蒙·玻利瓦尔从波哥大沿马格达莱纳河开始最后旅程，途中回顾政治理想和自己的过去。','institutional_paraphrase','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1110','WCD10-B02-W10-F01','V1-CARD-0290','V1-ENT-0399','first_publication_year','1994','bibliographic','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1111','WCD10-B02-W10-F02','V1-CARD-0290','V1-ENT-0399','genre_or_form','小说','bibliographic','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1112','WCD10-B02-W10-F03','V1-CARD-0290','V1-ENT-0399','story_premise','故事发生在十八世纪殖民时期的哥伦比亚海岸，围绕少女西尔瓦·玛丽亚与神父卡耶塔诺·德劳拉的爱情及其毁灭展开。','institutional_paraphrase','WCD-10-B02','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1113','WCD10-B02-F01','V1-CARD-0291','V1-ENT-0036','story_premise','故事围绕恰帕斯原住民和拉迪诺人之间的土地、宗教与权力冲突展开。','institutional_paraphrase','WCD-10-B02','high','batch_retained_candidate','按2013版封底作释义；不确定化历史十字架事件，不覆盖1962事实。'),
('V1-FCT-1114','WCD10-B02-F02','V1-CARD-0292','V1-ENT-0037','one_sentence_summary','汇集卡斯特利亚诺斯1948至1971年的诗作，并收入她翻译的艾米莉·狄金森、保罗·克洛岱尔和圣琼·佩斯的诗。','institutional_paraphrase','WCD-10-B02','high','batch_retained_candidate','书目层面的集合概述；保留旧bibliographic_note，不把转载评论定为独立A级研究。'),
('V1-FCT-1115','WCD10-B02-F03','V1-CARD-0293','V1-ENT-0044','genre_or_form','戏剧／讽剧','bibliographic','WCD-10-B02','high','batch_retained_candidate','依据Dramaturgia及1975封底farsa；不创建新合集或改编。'),
('V1-FCT-1116','WCD10-B02-F04','V1-CARD-0293','V1-ENT-0044','story_premise','这部讽剧以幽默的方式呈现女性在男性主导的社会中面对的处境与角色期待。','institutional_paraphrase','WCD-10-B02','high','batch_retained_candidate','封底作品级内容释义；不创建EXPLORES_THEME解释性关系。'),
('V1-FCT-1117','WCD10-B02-F05','V1-CARD-0293','V1-ENT-0044','bibliographic_note','ELEM登记墨西哥文化经济基金会1975年《墨西哥文学》系列第115号书版。','bibliographic_note','WCD-10-B02','high','batch_retained_candidate','1975是本来源可识别书版年；first_publication_year与首演年尚未核实，保留缺口。'),
('V1-FCT-1118','WCD10-B02-F06','V1-CARD-0294','V1-ENT-0040','first_publication_year','1980','bibliographic','WCD-10-B02','high','batch_retained_candidate','来源区分先有电影、1980书面刊行；保留旧publication_year1980与composition_year1958，写作年冲突不回填。'),
('V1-FCT-1119','WCD10-B02-F07','V1-CARD-0294','V1-ENT-0040','story_premise','迪奥尼西奥在市集与赌局间谋生，凭运气从贫穷走向富裕，最终又失去财富。','institutional_paraphrase','WCD-10-B02','high','batch_retained_candidate','小说人物的故事，不作为现实生平；不覆盖旧复合genre_or_form。'),
('V1-FCT-1120','WCD10-B02-F08','V1-CARD-0294','V1-ENT-0040','research_note','Françoise Perus 在《El gallo de oro, de Juan Rulfo: aproximaciones a una obra «olvidada»》中讨论 nouvelle 的体裁记忆及文学与电影的形式差异，指出与电影的关联并不抹去《金鸡》作为文学文本的性质。','scholarly_paraphrase','WCD-10-B02','high','research_note_only','署名会议研究说明，research_note_only；历史同行评议NOT_VERIFIED，不是已关闭A级学术覆盖，不改旧genre，不确认影响/改编关系。'),
('V1-FCT-1121','WCD10-B02-F09','V1-CARD-0295','V1-ENT-0158','story_premise','费尔米娜·达萨与弗洛伦蒂诺·阿里萨在加勒比港口城市经历相识、分离和漫长等待，半个世纪后再次面对彼此的感情。','institutional_paraphrase','WCD-10-B02','high','batch_retained_candidate','只补对象级梗概；保留1985书目、既有SET_IN和hold。'),
('V1-FCT-1122','WCD10-B02-F10','V1-CARD-0296','V1-ENT-0159','story_premise','小说以循环展开的叙述回望一位独裁者的统治、衰老与死亡。','institutional_paraphrase','WCD-10-B02','high','batch_retained_candidate','出版者小说释义不指定现实独裁者/国家，不旁路解释性关系门禁。');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-1083','SRC-0342','Ciudad real - Detalle de la obra'),
('V1-FCT-1084','SRC-0342','Ciudad real - Detalle de la obra'),
('V1-FCT-1085','SRC-0342','Ciudad real - Detalle de la obra'),
('V1-FCT-1086','SRC-0343','Los convidados de agosto - Detalle de la obra'),
('V1-FCT-1087','SRC-0343','Los convidados de agosto - Detalle de la obra'),
('V1-FCT-1088','SRC-0343','Los convidados de agosto - Detalle de la obra'),
('V1-FCT-1089','SRC-0344','Álbum de familia - Detalle de la obra'),
('V1-FCT-1090','SRC-0344','Álbum de familia - Detalle de la obra'),
('V1-FCT-1091','SRC-0344','Álbum de familia - Detalle de la obra'),
('V1-FCT-1092','SRC-0349','Gaboteca: Obras de Ggm'),
('V1-FCT-1092','SRC-0350','La hojarasca | Centro Gabo'),
('V1-FCT-1093','SRC-0351','La hojarasca: Agencia Literaria Carmen Balcells'),
('V1-FCT-1094','SRC-0351','La hojarasca: Agencia Literaria Carmen Balcells'),
('V1-FCT-1095','SRC-0349','Gaboteca: Obras de Ggm'),
('V1-FCT-1095','SRC-0352','La mala hora: Agencia Literaria Carmen Balcells'),
('V1-FCT-1096','SRC-0352','La mala hora: Agencia Literaria Carmen Balcells'),
('V1-FCT-1097','SRC-0352','La mala hora: Agencia Literaria Carmen Balcells'),
('V1-FCT-1098','SRC-0349','Gaboteca: Obras de Ggm'),
('V1-FCT-1098','SRC-0353','Los funerales de la Mamá Grande: Agencia Literaria Carmen Balcells'),
('V1-FCT-1099','SRC-0353','Los funerales de la Mamá Grande: Agencia Literaria Carmen Balcells'),
('V1-FCT-1100','SRC-0353','Los funerales de la Mamá Grande: Agencia Literaria Carmen Balcells'),
('V1-FCT-1101','SRC-0349','Gaboteca: Obras de Ggm'),
('V1-FCT-1101','SRC-0354','La increíble y triste historia de la Cándida Eréndira y de su abuela desalmada: Agencia Literaria Carmen Balcells'),
('V1-FCT-1102','SRC-0354','La increíble y triste historia de la Cándida Eréndira y de su abuela desalmada: Agencia Literaria Carmen Balcells'),
('V1-FCT-1103','SRC-0354','La increíble y triste historia de la Cándida Eréndira y de su abuela desalmada: Agencia Literaria Carmen Balcells'),
('V1-FCT-1104','SRC-0349','Gaboteca: Obras de Ggm'),
('V1-FCT-1104','SRC-0355','Doce cuentos peregrinos: Agencia Literaria Carmen Balcells'),
('V1-FCT-1105','SRC-0355','Doce cuentos peregrinos: Agencia Literaria Carmen Balcells'),
('V1-FCT-1106','SRC-0355','Doce cuentos peregrinos: Agencia Literaria Carmen Balcells'),
('V1-FCT-1107','SRC-0349','Gaboteca: Obras de Ggm'),
('V1-FCT-1107','SRC-0356','El general en su laberinto: Agencia Literaria Carmen Balcells'),
('V1-FCT-1108','SRC-0356','El general en su laberinto: Agencia Literaria Carmen Balcells'),
('V1-FCT-1109','SRC-0356','El general en su laberinto: Agencia Literaria Carmen Balcells'),
('V1-FCT-1110','SRC-0349','Gaboteca: Obras de Ggm'),
('V1-FCT-1111','SRC-0349','Gaboteca: Obras de Ggm'),
('V1-FCT-1111','SRC-0357','Del Amor y Otros Demonios'),
('V1-FCT-1112','SRC-0357','Del Amor y Otros Demonios'),
('V1-FCT-1113','SRC-0026','Oficio de tinieblas - Detalle de la obra'),
('V1-FCT-1114','SRC-0346','Rosario Castellanos. Poesía no eres tú'),
('V1-FCT-1115','SRC-0345','El eterno femenino - Detalle de la obra'),
('V1-FCT-1116','SRC-0345','El eterno femenino - Detalle de la obra'),
('V1-FCT-1117','SRC-0345','El eterno femenino - Detalle de la obra'),
('V1-FCT-1118','SRC-0347','An Exploration of Mexican Writer Juan Rulfo through Literature, Photography, Film, and Music'),
('V1-FCT-1118','SRC-0348','El gallo de oro, de Juan Rulfo: aproximaciones a una obra «olvidada»'),
('V1-FCT-1119','SRC-0347','An Exploration of Mexican Writer Juan Rulfo through Literature, Photography, Film, and Music'),
('V1-FCT-1120','SRC-0348','El gallo de oro, de Juan Rulfo: aproximaciones a una obra «olvidada»'),
('V1-FCT-1121','SRC-0358','El amor en los tiempos del cólera: Agencia Literaria Carmen Balcells'),
('V1-FCT-1122','SRC-0359','El otoño del patriarca: Agencia Literaria Carmen Balcells');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0281','V1-FCT-1083','batch_retained_candidate'),
('V1-CARD-0281','V1-FCT-1084','batch_retained_candidate'),
('V1-CARD-0281','V1-FCT-1085','batch_retained_candidate'),
('V1-CARD-0282','V1-FCT-1086','batch_retained_candidate'),
('V1-CARD-0282','V1-FCT-1087','batch_retained_candidate'),
('V1-CARD-0282','V1-FCT-1088','batch_retained_candidate'),
('V1-CARD-0283','V1-FCT-1089','batch_retained_candidate'),
('V1-CARD-0283','V1-FCT-1090','batch_retained_candidate'),
('V1-CARD-0283','V1-FCT-1091','batch_retained_candidate'),
('V1-CARD-0284','V1-FCT-1092','batch_retained_candidate'),
('V1-CARD-0284','V1-FCT-1093','batch_retained_candidate'),
('V1-CARD-0284','V1-FCT-1094','batch_retained_candidate'),
('V1-CARD-0285','V1-FCT-1095','batch_retained_candidate'),
('V1-CARD-0285','V1-FCT-1096','batch_retained_candidate'),
('V1-CARD-0285','V1-FCT-1097','batch_retained_candidate'),
('V1-CARD-0286','V1-FCT-1098','batch_retained_candidate'),
('V1-CARD-0286','V1-FCT-1099','batch_retained_candidate'),
('V1-CARD-0286','V1-FCT-1100','batch_retained_candidate'),
('V1-CARD-0287','V1-FCT-1101','batch_retained_candidate'),
('V1-CARD-0287','V1-FCT-1102','batch_retained_candidate'),
('V1-CARD-0287','V1-FCT-1103','batch_retained_candidate'),
('V1-CARD-0288','V1-FCT-1104','batch_retained_candidate'),
('V1-CARD-0288','V1-FCT-1105','batch_retained_candidate'),
('V1-CARD-0288','V1-FCT-1106','batch_retained_candidate'),
('V1-CARD-0289','V1-FCT-1107','batch_retained_candidate'),
('V1-CARD-0289','V1-FCT-1108','batch_retained_candidate'),
('V1-CARD-0289','V1-FCT-1109','batch_retained_candidate'),
('V1-CARD-0290','V1-FCT-1110','batch_retained_candidate'),
('V1-CARD-0290','V1-FCT-1111','batch_retained_candidate'),
('V1-CARD-0290','V1-FCT-1112','batch_retained_candidate'),
('V1-CARD-0291','V1-FCT-1113','batch_retained_candidate'),
('V1-CARD-0292','V1-FCT-1114','batch_retained_candidate'),
('V1-CARD-0293','V1-FCT-1115','batch_retained_candidate'),
('V1-CARD-0293','V1-FCT-1116','batch_retained_candidate'),
('V1-CARD-0293','V1-FCT-1117','batch_retained_candidate'),
('V1-CARD-0294','V1-FCT-1118','batch_retained_candidate'),
('V1-CARD-0294','V1-FCT-1119','batch_retained_candidate'),
('V1-CARD-0294','V1-FCT-1120','research_note_only'),
('V1-CARD-0295','V1-FCT-1121','batch_retained_candidate'),
('V1-CARD-0296','V1-FCT-1122','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0563','WCD10-B02-S01','V1-CARD-0281','SRC-0342','B','bibliography_or_bounded_description','yes','no','SRC-0022','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0564','WCD10-B02-S02','V1-CARD-0282','SRC-0343','B','bibliography_or_bounded_description','yes','no','SRC-0022','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0565','WCD10-B02-S03','V1-CARD-0283','SRC-0344','B','bibliography_or_bounded_description','yes','no','SRC-0022','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0566','WCD10-B02-S09','V1-CARD-0284','SRC-0349','B','bibliography_or_bounded_description','yes','no','SRC-0349','accepted','NONE'),
('V1-CS-0567','WCD10-B02-S10','V1-CARD-0284','SRC-0350','B','bibliography_or_bounded_description','yes','no','SRC-0350','accepted','NONE'),
('V1-CS-0568','WCD10-B02-S11','V1-CARD-0284','SRC-0351','B','bibliography_or_bounded_description','yes','no','SRC-0351','accepted','NONE'),
('V1-CS-0569','WCD10-B02-S09','V1-CARD-0285','SRC-0349','B','bibliography_or_bounded_description','yes','no','SRC-0349','accepted','NONE'),
('V1-CS-0570','WCD10-B02-S12','V1-CARD-0285','SRC-0352','B','bibliography_or_bounded_description','yes','no','SRC-0352','accepted','NONE'),
('V1-CS-0571','WCD10-B02-S09','V1-CARD-0286','SRC-0349','B','bibliography_or_bounded_description','yes','no','SRC-0349','accepted','NONE'),
('V1-CS-0572','WCD10-B02-S13','V1-CARD-0286','SRC-0353','B','bibliography_or_bounded_description','yes','no','SRC-0353','accepted','NONE'),
('V1-CS-0573','WCD10-B02-S09','V1-CARD-0287','SRC-0349','B','bibliography_or_bounded_description','yes','no','SRC-0349','accepted','NONE'),
('V1-CS-0574','WCD10-B02-S14','V1-CARD-0287','SRC-0354','B','bibliography_or_bounded_description','yes','no','SRC-0354','accepted','NONE'),
('V1-CS-0575','WCD10-B02-S09','V1-CARD-0288','SRC-0349','B','bibliography_or_bounded_description','yes','no','SRC-0349','accepted','NONE'),
('V1-CS-0576','WCD10-B02-S15','V1-CARD-0288','SRC-0355','B','bibliography_or_bounded_description','yes','no','SRC-0355','accepted','NONE'),
('V1-CS-0577','WCD10-B02-S09','V1-CARD-0289','SRC-0349','B','bibliography_or_bounded_description','yes','no','SRC-0349','accepted','NONE'),
('V1-CS-0578','WCD10-B02-S16','V1-CARD-0289','SRC-0356','B','bibliography_or_bounded_description','yes','no','SRC-0356','accepted','NONE'),
('V1-CS-0579','WCD10-B02-S09','V1-CARD-0290','SRC-0349','B','bibliography_or_bounded_description','yes','no','SRC-0349','accepted','NONE'),
('V1-CS-0580','WCD10-B02-S17','V1-CARD-0290','SRC-0357','B','bibliography_or_bounded_description','yes','no','SRC-0357','accepted','NONE'),
('V1-CS-0581','WCD10-B02-S05','V1-CARD-0291','SRC-0026','B','bibliography_or_bounded_description','no','no','SRC-0026','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0582','WCD10-B02-S06','V1-CARD-0292','SRC-0346','B','bibliography_or_bounded_description','no','no','SRC-0346','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0583','WCD10-B02-S04','V1-CARD-0293','SRC-0345','B','bibliography_or_bounded_description','yes','no','SRC-0022','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0584','WCD10-B02-S07','V1-CARD-0294','SRC-0347','B','bibliography_or_bounded_description','yes','no','SRC-0347','accepted','NONE'),
('V1-CS-0585','WCD10-B02-S08','V1-CARD-0294','SRC-0348','B','attributed_study','yes','yes','SRC-0348','accepted','NONE'),
('V1-CS-0586','WCD10-B02-S18','V1-CARD-0295','SRC-0358','B','bibliography_or_bounded_description','no','no','SRC-0358','accepted','NONE'),
('V1-CS-0587','WCD10-B02-S19','V1-CARD-0296','SRC-0359','B','bibliography_or_bounded_description','no','no','SRC-0359','accepted','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0348','WCD-10-B02','WCD10-B02-W01-CREATED','V1-ENT-0030','CREATED','V1-ENT-0390','罗萨里奥·卡斯特利亚诺斯创作 Ciudad real','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0349','WCD-10-B02','WCD10-B02-W02-CREATED','V1-ENT-0030','CREATED','V1-ENT-0391','罗萨里奥·卡斯特利亚诺斯创作 Los convidados de agosto','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0350','WCD-10-B02','WCD10-B02-W03-CREATED','V1-ENT-0030','CREATED','V1-ENT-0392','罗萨里奥·卡斯特利亚诺斯创作 Álbum de familia','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0351','WCD-10-B02','WCD10-B02-W04-CREATED','V1-ENT-0072','CREATED','V1-ENT-0393','加西亚·马尔克斯创作 La hojarasca','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0352','WCD-10-B02','WCD10-B02-W05-CREATED','V1-ENT-0072','CREATED','V1-ENT-0394','加西亚·马尔克斯创作 La mala hora','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0353','WCD-10-B02','WCD10-B02-W06-CREATED','V1-ENT-0072','CREATED','V1-ENT-0395','加西亚·马尔克斯创作 Los funerales de la Mamá Grande','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0354','WCD-10-B02','WCD10-B02-W07-CREATED','V1-ENT-0072','CREATED','V1-ENT-0396','加西亚·马尔克斯创作 La increíble y triste historia de la cándida Eréndira y de su abuela desalmada','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0355','WCD-10-B02','WCD10-B02-W08-CREATED','V1-ENT-0072','CREATED','V1-ENT-0397','加西亚·马尔克斯创作 Doce cuentos peregrinos','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0356','WCD-10-B02','WCD10-B02-W09-CREATED','V1-ENT-0072','CREATED','V1-ENT-0398','加西亚·马尔克斯创作 El general en su laberinto','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0357','WCD-10-B02','WCD10-B02-W10-CREATED','V1-ENT-0072','CREATED','V1-ENT-0399','加西亚·马尔克斯创作 Del amor y otros demonios','high','accepted','wcd10_b01_review:PASS','2','NONE'),
('V1-REL-0358','WCD-10-B02','WCD10-B02-R01','V1-ENT-0393','SET_IN','V1-ENT-0097','《La hojarasca》的安葬事件与三代人的叙述发生在文学虚构城镇马孔多。','high','accepted','wcd10_b01_review:PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0348','SRC-0342'),
('V1-REL-0349','SRC-0343'),
('V1-REL-0350','SRC-0344'),
('V1-REL-0351','SRC-0351'),
('V1-REL-0352','SRC-0352'),
('V1-REL-0353','SRC-0353'),
('V1-REL-0354','SRC-0354'),
('V1-REL-0355','SRC-0355'),
('V1-REL-0356','SRC-0356'),
('V1-REL-0357','SRC-0349'),
('V1-REL-0357','SRC-0357'),
('V1-REL-0358','SRC-0351');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0391','V1-REL-0348','WCD10-B02-S01','SRC-0342','Ciudad real - Detalle de la obra','PRIMERA EDICIÓN 1960; CONTRAPORTADA 1982','罗萨里奥·卡斯特利亚诺斯创作 Ciudad real','high','eligible_evidence','WCD-10-B02'),
('V1-EV-0392','V1-REL-0349','WCD10-B02-S02','SRC-0343','Los convidados de agosto - Detalle de la obra','PRIMERA EDICIÓN 1964; CONTRAPORTADA 2008','罗萨里奥·卡斯特利亚诺斯创作 Los convidados de agosto','high','eligible_evidence','WCD-10-B02'),
('V1-EV-0393','V1-REL-0350','WCD10-B02-S03','SRC-0344','Álbum de familia - Detalle de la obra','PRIMERA EDICIÓN 1971; CONTRAPORTADA 1971','罗萨里奥·卡斯特利亚诺斯创作 Álbum de familia','high','eligible_evidence','WCD-10-B02'),
('V1-EV-0394','V1-REL-0351','WCD10-B02-S11','SRC-0351','La hojarasca: Agencia Literaria Carmen Balcells','Book synopsis: Macondo; colonel, daughter and grandson','加西亚·马尔克斯创作 La hojarasca','high','eligible_evidence','WCD-10-B02'),
('V1-EV-0395','V1-REL-0352','WCD10-B02-S12','SRC-0352','La mala hora: Agencia Literaria Carmen Balcells','Novela 1962; synopsis opening pasquines paragraphs','加西亚·马尔克斯创作 La mala hora','high','eligible_evidence','WCD-10-B02'),
('V1-EV-0396','V1-REL-0353','WCD10-B02-S13','SRC-0353','Los funerales de la Mamá Grande: Agencia Literaria Carmen Balcells','Relatos 1962; synopsis seven stories and title novella','加西亚·马尔克斯创作 Los funerales de la Mamá Grande','high','eligible_evidence','WCD-10-B02'),
('V1-EV-0397','V1-REL-0354','WCD10-B02-S14','SRC-0354','La increíble y triste historia de la Cándida Eréndira y de su abuela desalmada: Agencia Literaria Carmen Balcells','Relatos 1972; Reúne la novela corta…y otros seis relatos','加西亚·马尔克斯创作 La increíble y triste historia de la cándida Eréndira y de su abuela desalmada','high','eligible_evidence','WCD-10-B02'),
('V1-EV-0398','V1-REL-0355','WCD10-B02-S15','SRC-0355','Doce cuentos peregrinos: Agencia Literaria Carmen Balcells','Relatos 1992; synopsis twelve Latin American characters in Europe','加西亚·马尔克斯创作 Doce cuentos peregrinos','high','eligible_evidence','WCD-10-B02'),
('V1-EV-0399','V1-REL-0356','WCD10-B02-S16','SRC-0356','El general en su laberinto: Agencia Literaria Carmen Balcells','Novela 1989; synopsis last journey Bogotá/Magdalena','加西亚·马尔克斯创作 El general en su laberinto','high','eligible_evidence','WCD-10-B02'),
('V1-EV-0400','V1-REL-0357','WCD10-B02-S09','SRC-0349','Gaboteca: Obras de Ggm','Novelas title/year entries; Cuentos collection paragraphs and title/year entries','加西亚·马尔克斯创作 Del amor y otros demonios','high','eligible_evidence','WCD-10-B02'),
('V1-EV-0401','V1-REL-0357','WCD10-B02-S17','SRC-0357','Del Amor y Otros Demonios','Book Description; ISBN 9780140245592','加西亚·马尔克斯创作 Del amor y otros demonios','high','eligible_evidence','WCD-10-B02'),
('V1-EV-0402','V1-REL-0358','WCD10-B02-S11','SRC-0351','La hojarasca: Agencia Literaria Carmen Balcells','Book synopsis: Macondo; colonel, daughter and grandson','《La hojarasca》的安葬事件与三代人的叙述发生在文学虚构城镇马孔多。','high','eligible_evidence','WCD-10-B02');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0049','WCD-10-B02-G01','research_gap','El gallo de oro: composition_year 1958 versus 1956–1957','open','旧库写作年1958，新来源1956–1957；本批只补1980书版/梗概，不改写既有事实。','','Independent Reviewer: preserve hold_preserve_existing_pending_conflict_review','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0050','WCD-10-B02-G02','research_gap','El eterno femenino: first publication and première','open','ELEM显示1975可识别书版，但本轮未取得首版/首演明确限定；不把1975书版直接提升首版年。','','Independent Reviewer: preserve research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0051','WCD-10-B02-G03','research_gap','La hojarasca: rejected agency 1954 year','open','Gaboteca与Centro Gabo直接书目列1955；代理页1954不作为准入年份，其他字段单独审。','','Independent Reviewer: preserve exclude_conflicting_source_field','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0052','WCD-10-B02-G04','research_gap','Collection versus title-story editions','open','书名篇或现代独立版本不下推至原合集；Álbum2002封底的novela corta不覆盖1971四篇集合对象。','','Independent Reviewer: preserve keep_collection_and_single_work_layers_separate','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0053','WCD-10-B02-G05','research_gap','B02 interpretive relationships and legacy holds','open','所有旧主题/文学运动hold保持；未获两个独立合格对象级研究及精确端点，不批量新增主题/影响/文学运动/事件关系。','','Independent Reviewer: preserve hold_needs_object_level_independent_evidence','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0054','WCD-10-B02-G06','research_gap','Further bibliography beyond this bounded B02 set','open','本批不是三位作者全集。论文/散文、新闻、回忆录、摄影、书信及身后出版物逐对象另核；不为鲁尔福强造第四部小说。','','Independent Reviewer: preserve defer_not_claim_exhaustive','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0055','WCD-10-B02-G07','research_gap','New Chinese display titles','open','中文显示名仅为暂译，尚未核对中文译本；原文题名为查重依据，不新增edition或单篇子节点。','','Independent Reviewer: preserve provisional_translation_only','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0056','WCD-10-B02:V1-ENT-0036','research_gap','WCD10:work_level_research:V1-ENT-0036','open','独立作品级A级研究OPEN；小说历史转置不确认为BASED_ON_EVENT。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0057','WCD-10-B02:V1-ENT-0037','research_gap','WCD10:work_level_research:V1-ENT-0037','open','转载概述不构成新独立学术研究；集合级研究OPEN。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0058','WCD-10-B02:V1-ENT-0044','research_gap','WCD10:work_level_research:V1-ENT-0044','open','首版/首演证据及A级研究OPEN；1975版不机械提升首版。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0059','WCD-10-B02:V1-ENT-0039','research_gap','WCD10:work_level_research:V1-ENT-0039','open','合集对象级独立A级研究OPEN；保留1953旧书目与乡村集合概述。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0060','WCD-10-B02:V1-ENT-0159','research_gap','WCD10:work_level_research:V1-ENT-0159','open','小说对象独立A级研究OPEN；不新增现实独裁者/国家或文学运动关系。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0061','WCD-10-B02:WCD10-B02-W01','research_gap','WCD10:work_level_research:V1-ENT-0390','open','独立对象级A级研究OPEN；出版者/目录简介仅用于书目和有边界的内容释义，中文显示名暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0062','WCD-10-B02:WCD10-B02-W02','research_gap','WCD10:work_level_research:V1-ENT-0391','open','独立对象级A级研究OPEN；出版者/目录简介仅用于书目和有边界的内容释义，中文显示名暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0063','WCD-10-B02:WCD10-B02-W03','research_gap','WCD10:work_level_research:V1-ENT-0392','open','独立对象级A级研究OPEN；出版者/目录简介仅用于书目和有边界的内容释义，中文显示名暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0064','WCD-10-B02:WCD10-B02-W04','research_gap','WCD10:work_level_research:V1-ENT-0393','open','独立对象级A级研究OPEN；出版者/目录简介仅用于书目和有边界的内容释义，中文显示名暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0065','WCD-10-B02:WCD10-B02-W05','research_gap','WCD10:work_level_research:V1-ENT-0394','open','独立对象级A级研究OPEN；出版者/目录简介仅用于书目和有边界的内容释义，中文显示名暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0066','WCD-10-B02:WCD10-B02-W06','research_gap','WCD10:work_level_research:V1-ENT-0395','open','独立对象级A级研究OPEN；出版者/目录简介仅用于书目和有边界的内容释义，中文显示名暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0067','WCD-10-B02:WCD10-B02-W07','research_gap','WCD10:work_level_research:V1-ENT-0396','open','独立对象级A级研究OPEN；出版者/目录简介仅用于书目和有边界的内容释义，中文显示名暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0068','WCD-10-B02:WCD10-B02-W08','research_gap','WCD10:work_level_research:V1-ENT-0397','open','独立对象级A级研究OPEN；出版者/目录简介仅用于书目和有边界的内容释义，中文显示名暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0069','WCD-10-B02:WCD10-B02-W09','research_gap','WCD10:work_level_research:V1-ENT-0398','open','独立对象级A级研究OPEN；出版者/目录简介仅用于书目和有边界的内容释义，中文显示名暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0070','WCD-10-B02:WCD10-B02-W10','research_gap','WCD10:work_level_research:V1-ENT-0399','open','独立对象级A级研究OPEN；出版者/目录简介仅用于书目和有边界的内容释义，中文显示名暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');

UPDATE metadata SET value='WCD-10-B02' WHERE key='last_change_set';

UPDATE metadata SET value='2026-09-28' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 357 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 397 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 395 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 296 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1116 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 1180 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1095 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 579 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 356 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 431 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 402 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 70 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
