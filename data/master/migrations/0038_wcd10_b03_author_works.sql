-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: wcd10_b01_review

-- Registration sha256: 8a4df4eaafb32555eaf301649ccae8ba17cf8c46b8f5bd3203b17fc8bacc2f9b

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1095 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 579 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 296 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 397 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 395 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 1180 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1116 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 70 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 37 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 402 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 431 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 356 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 357 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B02' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0360' OR canonical_url='https://www.cervantes.es/bibliotecas_documentacion_espanol/creadores/cortazar_julio_1.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0361' OR canonical_url='https://www.agenciabalcells.com/en/authors/works/julio-cortazar/los-premios/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0362' OR canonical_url='https://www.agenciabalcells.com/ca/autors/obra/julio-cortazar/62-modelo-para-armar/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0363' OR canonical_url='https://www.agenciabalcells.com/autores/obra/julio-cortazar/libro-de-manuel/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0364' OR canonical_url='https://www.penguinlibros.com/es/literatura-contemporanea/33498-libro-historias-de-cronopios-y-de-famas-9788466331890') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0365' OR canonical_url='https://www.agenciabalcells.com/en/authors/works/julio-cortazar/todos-los-fuegos-el-fuego/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0366' OR canonical_url='https://www.agenciabalcells.com/en/authors/works/julio-cortazar/octaedro/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0367' OR canonical_url='https://www.penguinrandomhouse.com/books/768435/las-armas-secretas--the-secret-weapons-by-julio-cortazar/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0368' OR canonical_url='https://www.cervantes.es/bibliotecas_documentacion_espanol/creadores/argel_alejo_carpentier_1.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0369' OR canonical_url='https://www.fcede.es/site/es/libros/detalles.aspx?id_libro=20412') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0370' OR canonical_url='https://www.agenciabalcells.com/ca/autors/obra/alejo-carpentier/concierto-barroco/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0371' OR canonical_url='https://www.alianzaeditorial.es/libro/bibliotecas-de-autor/el-recurso-del-metodo-alejo-carpentier-9788420683263/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0372' OR canonical_url='https://www.alianzaeditorial.es/libro/bibliotecas-de-autor/el-arpa-y-la-sombra-alejo-carpentier-9788420676647/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0373' OR canonical_url='https://www.agenciabalcells.com/en/authors/works/alejo-carpentier/el-arpa-y-la-sombra/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0374' OR canonical_url='https://www.cervantes.es/bibliotecas_documentacion_espanol/biografias/berlin_mario_vargas_llosa_1.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0375' OR canonical_url='https://www.agenciabalcells.com/en/authors/works/mario-vargas-llosa/la-casa-verde/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0376' OR canonical_url='https://www.penguinlibros.com/es/literatura-contemporanea/6935-libro-pantaleon-y-las-visitadoras-9788420432793') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0377' OR canonical_url='https://www.penguinlibros.com/es/literatura-contemporanea/34789-libro-la-tia-julia-y-el-escribidor-9788490625675') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0378' OR canonical_url='https://www.agenciabalcells.com/en/authors/works/mario-vargas-llosa/el-hablador/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0379' OR canonical_url='https://www.agenciabalcells.com/en/authors/works/mario-vargas-llosa/historia-de-mayta/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0380' OR canonical_url='https://www.penguinlibros.com/ar/literatura-contemporanea/163896-libro-libro-de-manuel-9789877383089') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0400' OR (entity_type='work' AND original_name='Los premios')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0401' OR (entity_type='work' AND original_name='62: Modelo para armar')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0402' OR (entity_type='work' AND original_name='Libro de Manuel')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0403' OR (entity_type='collection' AND original_name='Historias de cronopios y de famas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0404' OR (entity_type='collection' AND original_name='Todos los fuegos el fuego')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0405' OR (entity_type='collection' AND original_name='Octaedro')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0406' OR (entity_type='work' AND original_name='Concierto barroco')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0407' OR (entity_type='work' AND original_name='El recurso del método')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0408' OR (entity_type='work' AND original_name='El arpa y la sombra')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0409' OR (entity_type='work' AND original_name='La tía Julia y el escribidor')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0410' OR (entity_type='work' AND original_name='El hablador')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0411' OR (entity_type='work' AND original_name='Historia de Mayta')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1123' OR (subject_id='V1-ENT-0400' AND fact_field='first_publication_year' AND value_text='1960')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1124' OR (subject_id='V1-ENT-0400' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1125' OR (subject_id='V1-ENT-0400' AND fact_field='story_premise' AND value_text='一艘驶向未知目的地的豪华邮轮发生失控的变故，乘客的生活在这趟航程中交错。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1126' OR (subject_id='V1-ENT-0401' AND fact_field='first_publication_year' AND value_text='1968')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1127' OR (subject_id='V1-ENT-0401' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1128' OR (subject_id='V1-ENT-0401' AND fact_field='one_sentence_summary' AND value_text='据代理目录介绍，小说穿行于伦敦、巴黎和布宜诺斯艾利斯，交错人物的对话与独白，要求读者拼接叙事片段。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1129' OR (subject_id='V1-ENT-0402' AND fact_field='first_publication_year' AND value_text='1973')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1130' OR (subject_id='V1-ENT-0402' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1131' OR (subject_id='V1-ENT-0402' AND fact_field='story_premise' AND value_text='小说把人物的三角恋与一场革命行动的幕后过程交织起来，并穿插涉及镇压的剪报材料。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1132' OR (subject_id='V1-ENT-0403' AND fact_field='first_publication_year' AND value_text='1962')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1133' OR (subject_id='V1-ENT-0403' AND fact_field='genre_or_form' AND value_text='短篇与小品集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1134' OR (subject_id='V1-ENT-0403' AND fact_field='one_sentence_summary' AND value_text='据出版者介绍，这部短篇与小品集用想象力和幽默重新观看日常惯例与常识。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1135' OR (subject_id='V1-ENT-0404' AND fact_field='first_publication_year' AND value_text='1966')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1136' OR (subject_id='V1-ENT-0404' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1137' OR (subject_id='V1-ENT-0404' AND fact_field='one_sentence_summary' AND value_text='由八篇小说组成的合集，收录《南方高速公路》《另一个天空》以及书名同名短篇等作品。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1138' OR (subject_id='V1-ENT-0405' AND fact_field='first_publication_year' AND value_text='1974')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1139' OR (subject_id='V1-ENT-0405' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1140' OR (subject_id='V1-ENT-0405' AND fact_field='one_sentence_summary' AND value_text='据代理目录介绍，八篇故事相互映照，把爱、疾病、死亡等遭遇与日常和幻想的边界交织起来。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1141' OR (subject_id='V1-ENT-0406' AND fact_field='first_publication_year' AND value_text='1974')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1142' OR (subject_id='V1-ENT-0406' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1143' OR (subject_id='V1-ENT-0406' AND fact_field='story_premise' AND value_text='一名来自美洲的旅客与仆人赴欧洲寻找乐器，旅程展开了两个大陆之间的音乐相遇。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1144' OR (subject_id='V1-ENT-0407' AND fact_field='first_publication_year' AND value_text='1974')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1145' OR (subject_id='V1-ENT-0407' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1146' OR (subject_id='V1-ENT-0407' AND fact_field='one_sentence_summary' AND value_text='小说围绕虚构的“第一行政长官”展开，描写一名表面有教养却腐败无能的拉美独裁者。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1147' OR (subject_id='V1-ENT-0408' AND fact_field='first_publication_year' AND value_text='1979')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1148' OR (subject_id='V1-ENT-0408' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1149' OR (subject_id='V1-ENT-0408' AND fact_field='story_premise' AND value_text='小说围绕克里斯托弗·哥伦布及庇护九世提出为他封圣的计划展开，重新审视人物及其历史形象。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1150' OR (subject_id='V1-ENT-0409' AND fact_field='first_publication_year' AND value_text='1977')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1151' OR (subject_id='V1-ENT-0409' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1152' OR (subject_id='V1-ENT-0409' AND fact_field='story_premise' AND value_text='年轻的瓦尔吉塔斯与年长姨妈胡利娅的恋情，和同一电台编剧佩德罗·卡马乔的广播故事交替展开，背景是二十世纪五十年代的利马。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1153' OR (subject_id='V1-ENT-0410' AND fact_field='first_publication_year' AND value_text='1987')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1154' OR (subject_id='V1-ENT-0410' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1155' OR (subject_id='V1-ENT-0410' AND fact_field='story_premise' AND value_text='一位秘鲁作家在佛罗伦萨的展览照片中认出大学同学萨乌尔·苏拉塔斯，进而回忆并想象他成为亚马逊马奇根加人说书者的过程。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1156' OR (subject_id='V1-ENT-0411' AND fact_field='first_publication_year' AND value_text='1984')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1157' OR (subject_id='V1-ENT-0411' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1158' OR (subject_id='V1-ENT-0411' AND fact_field='story_premise' AND value_text='在小说想象的、陷入动乱的近未来秘鲁，叙述者试图重构一位革命者朋友的经历。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1159' OR (subject_id='V1-ENT-0084' AND fact_field='genre_or_form' AND value_text='短篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1160' OR (subject_id='V1-ENT-0084' AND fact_field='story_premise' AND value_text='布宜诺斯艾利斯一名证券交易所职员通过市中心的拱廊往来于日常生活与十九世纪巴黎，在另一座城市与若西亚娜相遇；他的另一种生活最终消失。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1161' OR (subject_id='V1-ENT-0084' AND fact_field='bibliographic_note' AND value_text='Dillon在125页将本篇标为收录于Todos los fuegos el fuego（1966），133页引用的是Norma于1994年出版的该合集135–159页；131页回指年份1959与上述条目存在疑点，因此本批不确定本篇首刊年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1162' OR (subject_id='V1-ENT-0084' AND fact_field='research_note' AND value_text='Dillon（2024，126–129、132页）把两城之间的穿行解读为日常责任与理想化欲望的对置，并指出原作女性形象受男性叙述视角支配；这里保存其有归属解释，不代表独立双源关系已获准。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1163' OR (subject_id='V1-ENT-0085' AND fact_field='genre_or_form' AND value_text='短篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1164' OR (subject_id='V1-ENT-0085' AND fact_field='story_premise' AND value_text='第一人称叙述者在巴黎地铁设定寻找理想女性的游戏：先决定路线，再期待一名女性与自己同路；遇见玛丽－克洛德后，他必须在自定规则与相遇之间作出选择。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1165' OR (subject_id='V1-ENT-0085' AND fact_field='bibliographic_note' AND value_text='Dillon（2024，129、133页）明确本篇收录于Octaedro，并引用Buenos Aires: Sudamericana,1974版55–74页；这只确认1974书版收录，未独立核实更早首刊或首次书版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1166' OR (subject_id='V1-ENT-0085' AND fact_field='research_note' AND value_text='Dillon（2024，129–132页）认为地铁游戏把偶然、欲望和城市路线联系起来，同时指出规则由男性主角单方面设定、女性被要求配合的权力不对称。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1167' OR (subject_id='V1-ENT-0164' AND fact_field='one_sentence_summary' AND value_text='五篇小说组成的合集，收录《母亲的来信》《良好的服务》《秘密武器》《魔鬼的涎液》与《追寻者》；此处仅作篇目构成说明。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1168' OR (subject_id='V1-ENT-0167' AND fact_field='first_publication_year' AND value_text='1958')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1169' OR (subject_id='V1-ENT-0167' AND fact_field='one_sentence_summary' AND value_text='塞万提斯学院年表中的1958年版由三个短篇与一部小说组成：El camino de Santiago、Viaje a la semilla、Semejante a la noche及El acoso；后续扩编本不据此固定篇目。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1170' OR (subject_id='V1-ENT-0168' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1171' OR (subject_id='V1-ENT-0168' AND fact_field='story_premise' AND value_text='在哈瓦那，一名建筑学生为逃避追捕躲进剧院；贝多芬《英雄交响曲》的演奏期间，他回顾自己的家庭、爱情与政治经历。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1172' OR (subject_id='V1-ENT-0160' AND fact_field='first_publication_year' AND value_text='1966')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1173' OR (subject_id='V1-ENT-0160' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1174' OR (subject_id='V1-ENT-0160' AND fact_field='story_premise' AND value_text='外来者唐·安塞尔莫在秘鲁一座城镇郊外建立名为“绿房子”的妓院，邦妮菲西亚、神父与几位好友的命运在这里交织。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1175' OR (subject_id='V1-ENT-0161' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1176' OR (subject_id='V1-ENT-0161' AND fact_field='story_premise' AND value_text='军官潘塔莱昂·潘托哈奉密令为秘鲁军队组织卖淫服务，前往伊基托斯执行任务；他过度执着于履行职责，反而危及自己建立的运作体系。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0359' OR (subject_id='V1-ENT-0073' AND relation_type='CREATED' AND object_id='V1-ENT-0400')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0360' OR (subject_id='V1-ENT-0073' AND relation_type='CREATED' AND object_id='V1-ENT-0401')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0361' OR (subject_id='V1-ENT-0073' AND relation_type='CREATED' AND object_id='V1-ENT-0402')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0362' OR (subject_id='V1-ENT-0073' AND relation_type='CREATED' AND object_id='V1-ENT-0403')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0363' OR (subject_id='V1-ENT-0073' AND relation_type='CREATED' AND object_id='V1-ENT-0404')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0364' OR (subject_id='V1-ENT-0073' AND relation_type='CREATED' AND object_id='V1-ENT-0405')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0365' OR (subject_id='V1-ENT-0074' AND relation_type='CREATED' AND object_id='V1-ENT-0406')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0366' OR (subject_id='V1-ENT-0074' AND relation_type='CREATED' AND object_id='V1-ENT-0407')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0367' OR (subject_id='V1-ENT-0074' AND relation_type='CREATED' AND object_id='V1-ENT-0408')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0368' OR (subject_id='V1-ENT-0114' AND relation_type='CREATED' AND object_id='V1-ENT-0409')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0369' OR (subject_id='V1-ENT-0114' AND relation_type='CREATED' AND object_id='V1-ENT-0410')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0370' OR (subject_id='V1-ENT-0114' AND relation_type='CREATED' AND object_id='V1-ENT-0411')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0371' OR (subject_id='V1-ENT-0084' AND relation_type='SET_IN' AND object_id='V1-ENT-0370')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0372' OR (subject_id='V1-ENT-0084' AND relation_type='SET_IN' AND object_id='V1-ENT-0373')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0373' OR (subject_id='V1-ENT-0085' AND relation_type='SET_IN' AND object_id='V1-ENT-0373')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0374' OR (subject_id='V1-ENT-0401' AND relation_type='SET_IN' AND object_id='V1-ENT-0373')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0375' OR (subject_id='V1-ENT-0401' AND relation_type='SET_IN' AND object_id='V1-ENT-0370')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0376' OR (subject_id='V1-ENT-0168' AND relation_type='SET_IN' AND object_id='V1-ENT-0372')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0377' OR (subject_id='V1-ENT-0409' AND relation_type='SET_IN' AND object_id='V1-ENT-0125')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0378' OR (subject_id='V1-ENT-0411' AND relation_type='SET_IN' AND object_id='V1-ENT-0124')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0360','WCD10-B03-S01','Julio Cortázar. Cronología de obras','Julio Cortázar. Cronología de obras','Instituto Cervantes / Departamento de Bibliotecas y Documentación','','Instituto Cervantes','','','institutional_bibliography','','es','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.cervantes.es/bibliotecas_documentacion_espanol/creadores/cortazar_julio_1.htm'),
('SRC-0361','WCD10-B03-S02','Los premios / The Winners','Los premios / The Winners','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','agency_work_catalog','','en','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/en/authors/works/julio-cortazar/los-premios/'),
('SRC-0362','WCD10-B03-S03','62: Modelo para armar','62: Modelo para armar','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','agency_work_catalog','','ca/es','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/ca/autors/obra/julio-cortazar/62-modelo-para-armar/'),
('SRC-0363','WCD10-B03-S04','Libro de Manuel','Libro de Manuel','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','agency_work_catalog','','es','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/autores/obra/julio-cortazar/libro-de-manuel/'),
('SRC-0364','WCD10-B03-S05','Historias de cronopios y de famas','Historias de cronopios y de famas','Penguin Random House Grupo Editorial / DEBOLSILLO','','Penguin Random House Grupo Editorial / DEBOLSILLO','','9788466331890','publisher_catalog','','es','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.penguinlibros.com/es/literatura-contemporanea/33498-libro-historias-de-cronopios-y-de-famas-9788466331890'),
('SRC-0365','WCD10-B03-S06','Todos los fuegos el fuego / All Fires the Fire','Todos los fuegos el fuego / All Fires the Fire','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','agency_work_catalog','','en','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/en/authors/works/julio-cortazar/todos-los-fuegos-el-fuego/'),
('SRC-0366','WCD10-B03-S07','Octaedro / Octahedron','Octaedro / Octahedron','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','agency_work_catalog','','en','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/en/authors/works/julio-cortazar/octaedro/'),
('SRC-0367','WCD10-B03-S08','Las armas secretas / The Secret Weapons','Las armas secretas / The Secret Weapons','Penguin Random House / Alfaguara','','Penguin Random House / Alfaguara','','9789505111930','publisher_catalog','','es/en','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.penguinrandomhouse.com/books/768435/las-armas-secretas--the-secret-weapons-by-julio-cortazar/'),
('SRC-0368','WCD10-B03-S10','Alejo Carpentier. Cronología de obras','Alejo Carpentier. Cronología de obras','Instituto Cervantes / Departamento de Bibliotecas y Documentación','','Instituto Cervantes','','','institutional_bibliography','','es','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.cervantes.es/bibliotecas_documentacion_espanol/creadores/argel_alejo_carpentier_1.htm'),
('SRC-0369','WCD10-B03-S11','El acoso','El acoso','Fondo de Cultura Económica','','Fondo de Cultura Económica','','9786071683090','publisher_catalog','','es','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.fcede.es/site/es/libros/detalles.aspx?id_libro=20412'),
('SRC-0370','WCD10-B03-S12','Concierto barroco','Concierto barroco','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','agency_work_catalog','','ca/es','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/ca/autors/obra/alejo-carpentier/concierto-barroco/'),
('SRC-0371','WCD10-B03-S13','El recurso del método','El recurso del método','Alianza Editorial','','Alianza Editorial','','9788420683263','publisher_catalog','','es','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.alianzaeditorial.es/libro/bibliotecas-de-autor/el-recurso-del-metodo-alejo-carpentier-9788420683263/'),
('SRC-0372','WCD10-B03-S14','El arpa y la sombra','El arpa y la sombra','Alianza Editorial','','Alianza Editorial','','9788420676647','publisher_catalog','','es','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.alianzaeditorial.es/libro/bibliotecas-de-autor/el-arpa-y-la-sombra-alejo-carpentier-9788420676647/'),
('SRC-0373','WCD10-B03-S15','El arpa y la sombra / The Harp and the Shadow','El arpa y la sombra / The Harp and the Shadow','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','agency_work_catalog','','en','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/en/authors/works/alejo-carpentier/el-arpa-y-la-sombra/'),
('SRC-0374','WCD10-B03-S16','Mario Vargas Llosa. Cronología de obras','Mario Vargas Llosa. Cronología de obras','Instituto Cervantes / Departamento de Bibliotecas y Documentación','','Instituto Cervantes','','','institutional_bibliography','','es','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.cervantes.es/bibliotecas_documentacion_espanol/biografias/berlin_mario_vargas_llosa_1.htm'),
('SRC-0375','WCD10-B03-S17','La casa verde / The Green House','La casa verde / The Green House','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','agency_work_catalog','','en','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/en/authors/works/mario-vargas-llosa/la-casa-verde/'),
('SRC-0376','WCD10-B03-S18','Pantaleón y las visitadoras','Pantaleón y las visitadoras','Penguin Random House Grupo Editorial / Alfaguara','','Penguin Random House Grupo Editorial / Alfaguara','','9788420432793','publisher_catalog','','es','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.penguinlibros.com/es/literatura-contemporanea/6935-libro-pantaleon-y-las-visitadoras-9788420432793'),
('SRC-0377','WCD10-B03-S19','La tía Julia y el escribidor','La tía Julia y el escribidor','Penguin Random House Grupo Editorial / DEBOLSILLO','','Penguin Random House Grupo Editorial / DEBOLSILLO','','9788490625675','publisher_catalog','','es','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.penguinlibros.com/es/literatura-contemporanea/34789-libro-la-tia-julia-y-el-escribidor-9788490625675'),
('SRC-0378','WCD10-B03-S20','El hablador / The Storyteller','El hablador / The Storyteller','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','agency_work_catalog','','en','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/en/authors/works/mario-vargas-llosa/el-hablador/'),
('SRC-0379','WCD10-B03-S21','Historia de Mayta / The Real Life of Alejandro Mayta','Historia de Mayta / The Real Life of Alejandro Mayta','Agencia Literaria Carmen Balcells','','Agencia Literaria Carmen Balcells','','','agency_work_catalog','','en','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.agenciabalcells.com/en/authors/works/mario-vargas-llosa/historia-de-mayta/'),
('SRC-0380','WCD10-B03-S22','Libro de Manuel','Libro de Manuel','Penguin Random House Grupo Editorial / Alfaguara','','Penguin Random House Grupo Editorial / Alfaguara','','9789877383089','publisher_catalog','','es','B','access_pass','WCD-10-B03','metadata_and_summary','remote_only','','https://www.penguinlibros.com/ar/literatura-contemporanea/163896-libro-libro-de-manuel-9789877383089');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0400','work','奖品','Los premios','candidate','1','WCD10-B03-W01','补科塔萨尔1960小说对象，不是四作品合辑或当前再版。; 中文仅候选显示名；原题为身份锚点，未核实正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0401','work','62：可拼装的模型','62: Modelo para armar','candidate','1','WCD10-B03-W02','补1968独立小说，不与Rayuela或译本混层。; 中文暂译，原题标点及62数字保留，不等于Rayuela第62章对象。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0402','work','曼努埃尔之书','Libro de Manuel','candidate','1','WCD10-B03-W03','补1973小说，不新建革命事件/运动归属。; 中文暂译；不将Manuel Puig作者节点与题名人物匹配。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0403','collection','克罗诺皮奥与法玛的故事','Historias de cronopios y de famas','candidate','1','WCD10-B03-W04','短篇与小品混合合集，区别单篇与各地再版。; 中文音译暂定；Cervantes省略第二de不作另一个作品。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0404','collection','所有的火都是火','Todos los fuegos el fuego','candidate','1','WCD10-B03-W05','补1966合集作为单篇收录的书目锚点；收录关系暂不结构化。; 中文暂译；本对象为八篇合集，不合并书名同名单篇，不合并既有El otro cielo。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0405','collection','八面体','Octaedro','candidate','1','WCD10-B03-W06','补1974八篇合集，不把单篇论文当整本研究。; 中文暂译，合集与既有Manuscrito单篇分层；不等于Octaedro出版机构。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0406','work','巴洛克音乐会','Concierto barroco','candidate','1','WCD10-B03-W07','补1974小说，历史歌剧年份疑点不入库。; 中文暂译，不等于同名音乐作品或当前版。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0407','work','方法的求助','El recurso del método','candidate','1','WCD10-B03-W08','补1974独立小说；虚构独裁者与现实原型分层。; 中文暂译；不把与笛卡尔题名的呼应作确认RESPONDS_TO_WORK。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0408','work','竖琴与影子','El arpa y la sombra','candidate','1','WCD10-B03-W09','补1979独立小说，以直接代理书目和出版者简介支持。; 中文暂译；小说与哥伦布现实传记/宗教事件分层。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0409','work','胡利娅姨妈与写作人','La tía Julia y el escribidor','candidate','1','WCD10-B03-W10','补1977小说；只建立明确利马背景关系。; 中文暂译，不把小说爱情直接转成作者婚姻事实。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0410','work','说话人','El hablador','candidate','1','WCD10-B03-W11','补1987小说；叙述者记忆和想象保留，不转人类学事实。; 中文暂译；Saul人物不匹配任何现实作者。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0411','work','迈塔的故事','Historia de Mayta','candidate','1','WCD10-B03-W12','补1984小说；限定为虚构将来秘鲁背景。; 中文暂译；小说重构不当成真实革命事件或人物传记。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0396','WCD10-B03-W01','WCD-10-B03','WCD10-B03-W01','V1-ENT-0400','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0397','WCD10-B03-W02','WCD-10-B03','WCD10-B03-W02','V1-ENT-0401','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0398','WCD10-B03-W03','WCD-10-B03','WCD10-B03-W03','V1-ENT-0402','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0399','WCD10-B03-W04','WCD-10-B03','WCD10-B03-W04','V1-ENT-0403','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0400','WCD10-B03-W05','WCD-10-B03','WCD10-B03-W05','V1-ENT-0404','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0401','WCD10-B03-W06','WCD-10-B03','WCD10-B03-W06','V1-ENT-0405','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0402','WCD10-B03-W07','WCD-10-B03','WCD10-B03-W07','V1-ENT-0406','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0403','WCD10-B03-W08','WCD-10-B03','WCD10-B03-W08','V1-ENT-0407','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0404','WCD10-B03-W09','WCD-10-B03','WCD10-B03-W09','V1-ENT-0408','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0405','WCD10-B03-W10','WCD-10-B03','WCD10-B03-W10','V1-ENT-0409','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0406','WCD10-B03-W11','WCD-10-B03','WCD10-B03-W11','V1-ENT-0410','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0407','WCD10-B03-W12','WCD-10-B03','WCD10-B03-W12','V1-ENT-0411','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0297','WCD-10-B03:V1-ENT-0400','V1-ENT-0400','work','奖品','胡利奥·科塔萨尔','Los premios','阿根廷','es','1960','小说','WCD-10-B03','research_gap','RESEARCH-ONLY-NOT-CURATED','### 奖品｜Los premios

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1960
- genre_or_form：小说
- story_premise：一艘驶向未知目的地的豪华邮轮发生失控的变故，乘客的生活在这趟航程中交错。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0298','WCD-10-B03:V1-ENT-0401','V1-ENT-0401','work','62：可拼装的模型','胡利奥·科塔萨尔','62: Modelo para armar','阿根廷','es','1968','小说','WCD-10-B03','research_gap','RESEARCH-ONLY-NOT-CURATED','### 62：可拼装的模型｜62: Modelo para armar

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1968
- genre_or_form：小说
- one_sentence_summary：据代理目录介绍，小说穿行于伦敦、巴黎和布宜诺斯艾利斯，交错人物的对话与独白，要求读者拼接叙事片段。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0299','WCD-10-B03:V1-ENT-0402','V1-ENT-0402','work','曼努埃尔之书','胡利奥·科塔萨尔','Libro de Manuel','阿根廷','es','1973','小说','WCD-10-B03','research_gap','RESEARCH-ONLY-NOT-CURATED','### 曼努埃尔之书｜Libro de Manuel

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1973
- genre_or_form：小说
- story_premise：小说把人物的三角恋与一场革命行动的幕后过程交织起来，并穿插涉及镇压的剪报材料。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0300','WCD-10-B03:V1-ENT-0403','V1-ENT-0403','collection','克罗诺皮奥与法玛的故事','胡利奥·科塔萨尔','Historias de cronopios y de famas','阿根廷','es','1962','短篇与小品集','WCD-10-B03','research_gap','RESEARCH-ONLY-NOT-CURATED','### 克罗诺皮奥与法玛的故事｜Historias de cronopios y de famas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1962
- genre_or_form：短篇与小品集
- one_sentence_summary：据出版者介绍，这部短篇与小品集用想象力和幽默重新观看日常惯例与常识。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0301','WCD-10-B03:V1-ENT-0404','V1-ENT-0404','collection','所有的火都是火','胡利奥·科塔萨尔','Todos los fuegos el fuego','阿根廷','es','1966','短篇小说集','WCD-10-B03','research_gap','RESEARCH-ONLY-NOT-CURATED','### 所有的火都是火｜Todos los fuegos el fuego

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1966
- genre_or_form：短篇小说集
- one_sentence_summary：由八篇小说组成的合集，收录《南方高速公路》《另一个天空》以及书名同名短篇等作品。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0302','WCD-10-B03:V1-ENT-0405','V1-ENT-0405','collection','八面体','胡利奥·科塔萨尔','Octaedro','阿根廷','es','1974','短篇小说集','WCD-10-B03','research_gap','RESEARCH-ONLY-NOT-CURATED','### 八面体｜Octaedro

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1974
- genre_or_form：短篇小说集
- one_sentence_summary：据代理目录介绍，八篇故事相互映照，把爱、疾病、死亡等遭遇与日常和幻想的边界交织起来。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0303','WCD-10-B03:V1-ENT-0406','V1-ENT-0406','work','巴洛克音乐会','阿莱霍·卡彭铁尔','Concierto barroco','古巴','es','1974','小说','WCD-10-B03','research_gap','RESEARCH-ONLY-NOT-CURATED','### 巴洛克音乐会｜Concierto barroco

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1974
- genre_or_form：小说
- story_premise：一名来自美洲的旅客与仆人赴欧洲寻找乐器，旅程展开了两个大陆之间的音乐相遇。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0304','WCD-10-B03:V1-ENT-0407','V1-ENT-0407','work','方法的求助','阿莱霍·卡彭铁尔','El recurso del método','古巴','es','1974','小说','WCD-10-B03','research_gap','RESEARCH-ONLY-NOT-CURATED','### 方法的求助｜El recurso del método

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1974
- genre_or_form：小说
- one_sentence_summary：小说围绕虚构的“第一行政长官”展开，描写一名表面有教养却腐败无能的拉美独裁者。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0305','WCD-10-B03:V1-ENT-0408','V1-ENT-0408','work','竖琴与影子','阿莱霍·卡彭铁尔','El arpa y la sombra','古巴','es','1979','小说','WCD-10-B03','research_gap','RESEARCH-ONLY-NOT-CURATED','### 竖琴与影子｜El arpa y la sombra

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1979
- genre_or_form：小说
- story_premise：小说围绕克里斯托弗·哥伦布及庇护九世提出为他封圣的计划展开，重新审视人物及其历史形象。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0306','WCD-10-B03:V1-ENT-0409','V1-ENT-0409','work','胡利娅姨妈与写作人','马里奥·巴尔加斯·略萨','La tía Julia y el escribidor','秘鲁','es','1977','小说','WCD-10-B03','research_gap','RESEARCH-ONLY-NOT-CURATED','### 胡利娅姨妈与写作人｜La tía Julia y el escribidor

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1977
- genre_or_form：小说
- story_premise：年轻的瓦尔吉塔斯与年长姨妈胡利娅的恋情，和同一电台编剧佩德罗·卡马乔的广播故事交替展开，背景是二十世纪五十年代的利马。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0307','WCD-10-B03:V1-ENT-0410','V1-ENT-0410','work','说话人','马里奥·巴尔加斯·略萨','El hablador','秘鲁','es','1987','小说','WCD-10-B03','research_gap','RESEARCH-ONLY-NOT-CURATED','### 说话人｜El hablador

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1987
- genre_or_form：小说
- story_premise：一位秘鲁作家在佛罗伦萨的展览照片中认出大学同学萨乌尔·苏拉塔斯，进而回忆并想象他成为亚马逊马奇根加人说书者的过程。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0308','WCD-10-B03:V1-ENT-0411','V1-ENT-0411','work','迈塔的故事','马里奥·巴尔加斯·略萨','Historia de Mayta','秘鲁','es','1984','小说','WCD-10-B03','research_gap','RESEARCH-ONLY-NOT-CURATED','### 迈塔的故事｜Historia de Mayta

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1984
- genre_or_form：小说
- story_premise：在小说想象的、陷入动乱的近未来秘鲁，叙述者试图重构一位革命者朋友的经历。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0309','WCD-10-B03:V1-ENT-0084','V1-ENT-0084','work','《另一个天空》','胡利奥·科塔萨尔','El otro cielo','阿根廷','es','','短篇小说','WCD-10-B03','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《另一个天空》｜El otro cielo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说
- story_premise：布宜诺斯艾利斯一名证券交易所职员通过市中心的拱廊往来于日常生活与十九世纪巴黎，在另一座城市与若西亚娜相遇；他的另一种生活最终消失。
- bibliographic_note：Dillon在125页将本篇标为收录于Todos los fuegos el fuego（1966），133页引用的是Norma于1994年出版的该合集135–159页；131页回指年份1959与上述条目存在疑点，因此本批不确定本篇首刊年。

#### 署名研究说明（research_note_only）

- Dillon（2024，126–129、132页）把两城之间的穿行解读为日常责任与理想化欲望的对置，并指出原作女性形象受男性叙述视角支配；这里保存其有归属解释，不代表独立双源关系已获准。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0310','WCD-10-B03:V1-ENT-0085','V1-ENT-0085','work','《口袋里发现的手稿》','胡利奥·科塔萨尔','Manuscrito hallado en un bolsillo','阿根廷','es','','短篇小说','WCD-10-B03','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《口袋里发现的手稿》｜Manuscrito hallado en un bolsillo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说
- story_premise：第一人称叙述者在巴黎地铁设定寻找理想女性的游戏：先决定路线，再期待一名女性与自己同路；遇见玛丽－克洛德后，他必须在自定规则与相遇之间作出选择。
- bibliographic_note：Dillon（2024，129、133页）明确本篇收录于Octaedro，并引用Buenos Aires: Sudamericana,1974版55–74页；这只确认1974书版收录，未独立核实更早首刊或首次书版。

#### 署名研究说明（research_note_only）

- Dillon（2024，129–132页）认为地铁游戏把偶然、欲望和城市路线联系起来，同时指出规则由男性主角单方面设定、女性被要求配合的权力不对称。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0311','WCD-10-B03:V1-ENT-0164','V1-ENT-0164','collection','《秘密武器》','胡利奥·科塔萨尔','Las armas secretas','阿根廷','es','','','WCD-10-B03','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《秘密武器》｜Las armas secretas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：五篇小说组成的合集，收录《母亲的来信》《良好的服务》《秘密武器》《魔鬼的涎液》与《追寻者》；此处仅作篇目构成说明。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0312','WCD-10-B03:V1-ENT-0167','V1-ENT-0167','collection','《时间之战》','阿莱霍·卡彭铁尔','Guerra del tiempo','古巴','es','1958','','WCD-10-B03','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《时间之战》｜Guerra del tiempo

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1958
- one_sentence_summary：塞万提斯学院年表中的1958年版由三个短篇与一部小说组成：El camino de Santiago、Viaje a la semilla、Semejante a la noche及El acoso；后续扩编本不据此固定篇目。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0313','WCD-10-B03:V1-ENT-0168','V1-ENT-0168','work','《追击》','阿莱霍·卡彭铁尔','El acoso','古巴','es','','小说','WCD-10-B03','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《追击》｜El acoso

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- story_premise：在哈瓦那，一名建筑学生为逃避追捕躲进剧院；贝多芬《英雄交响曲》的演奏期间，他回顾自己的家庭、爱情与政治经历。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0314','WCD-10-B03:V1-ENT-0160','V1-ENT-0160','work','《绿房子》','马里奥·巴尔加斯·略萨','La casa verde','秘鲁','es','1966','小说','WCD-10-B03','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《绿房子》｜La casa verde

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1966
- genre_or_form：小说
- story_premise：外来者唐·安塞尔莫在秘鲁一座城镇郊外建立名为“绿房子”的妓院，邦妮菲西亚、神父与几位好友的命运在这里交织。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0315','WCD-10-B03:V1-ENT-0161','V1-ENT-0161','work','《潘达雷昂上尉与劳军女郎》','马里奥·巴尔加斯·略萨','Pantaleón y las visitadoras','秘鲁','es','','小说','WCD-10-B03','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《潘达雷昂上尉与劳军女郎》｜Pantaleón y las visitadoras

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- story_premise：军官潘塔莱昂·潘托哈奉密令为秘鲁军队组织卖淫服务，前往伊基托斯执行任务；他过度执着于履行职责，反而危及自己建立的运作体系。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-1123','WCD10-B03-W01-F01','V1-CARD-0297','V1-ENT-0400','first_publication_year','1960','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1124','WCD10-B03-W01-F02','V1-CARD-0297','V1-ENT-0400','genre_or_form','小说','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1125','WCD10-B03-W01-F03','V1-CARD-0297','V1-ENT-0400','story_premise','一艘驶向未知目的地的豪华邮轮发生失控的变故，乘客的生活在这趟航程中交错。','institutional_paraphrase','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1126','WCD10-B03-W02-F01','V1-CARD-0298','V1-ENT-0401','first_publication_year','1968','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1127','WCD10-B03-W02-F02','V1-CARD-0298','V1-ENT-0401','genre_or_form','小说','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1128','WCD10-B03-W02-F03','V1-CARD-0298','V1-ENT-0401','one_sentence_summary','据代理目录介绍，小说穿行于伦敦、巴黎和布宜诺斯艾利斯，交错人物的对话与独白，要求读者拼接叙事片段。','institutional_paraphrase','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1129','WCD10-B03-W03-F01','V1-CARD-0299','V1-ENT-0402','first_publication_year','1973','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1130','WCD10-B03-W03-F02','V1-CARD-0299','V1-ENT-0402','genre_or_form','小说','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1131','WCD10-B03-W03-F03','V1-CARD-0299','V1-ENT-0402','story_premise','小说把人物的三角恋与一场革命行动的幕后过程交织起来，并穿插涉及镇压的剪报材料。','institutional_paraphrase','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1132','WCD10-B03-W04-F01','V1-CARD-0300','V1-ENT-0403','first_publication_year','1962','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1133','WCD10-B03-W04-F02','V1-CARD-0300','V1-ENT-0403','genre_or_form','短篇与小品集','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1134','WCD10-B03-W04-F03','V1-CARD-0300','V1-ENT-0403','one_sentence_summary','据出版者介绍，这部短篇与小品集用想象力和幽默重新观看日常惯例与常识。','institutional_paraphrase','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1135','WCD10-B03-W05-F01','V1-CARD-0301','V1-ENT-0404','first_publication_year','1966','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1136','WCD10-B03-W05-F02','V1-CARD-0301','V1-ENT-0404','genre_or_form','短篇小说集','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1137','WCD10-B03-W05-F03','V1-CARD-0301','V1-ENT-0404','one_sentence_summary','由八篇小说组成的合集，收录《南方高速公路》《另一个天空》以及书名同名短篇等作品。','institutional_paraphrase','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1138','WCD10-B03-W06-F01','V1-CARD-0302','V1-ENT-0405','first_publication_year','1974','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1139','WCD10-B03-W06-F02','V1-CARD-0302','V1-ENT-0405','genre_or_form','短篇小说集','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1140','WCD10-B03-W06-F03','V1-CARD-0302','V1-ENT-0405','one_sentence_summary','据代理目录介绍，八篇故事相互映照，把爱、疾病、死亡等遭遇与日常和幻想的边界交织起来。','institutional_paraphrase','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1141','WCD10-B03-W07-F01','V1-CARD-0303','V1-ENT-0406','first_publication_year','1974','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1142','WCD10-B03-W07-F02','V1-CARD-0303','V1-ENT-0406','genre_or_form','小说','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1143','WCD10-B03-W07-F03','V1-CARD-0303','V1-ENT-0406','story_premise','一名来自美洲的旅客与仆人赴欧洲寻找乐器，旅程展开了两个大陆之间的音乐相遇。','institutional_paraphrase','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1144','WCD10-B03-W08-F01','V1-CARD-0304','V1-ENT-0407','first_publication_year','1974','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1145','WCD10-B03-W08-F02','V1-CARD-0304','V1-ENT-0407','genre_or_form','小说','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1146','WCD10-B03-W08-F03','V1-CARD-0304','V1-ENT-0407','one_sentence_summary','小说围绕虚构的“第一行政长官”展开，描写一名表面有教养却腐败无能的拉美独裁者。','institutional_paraphrase','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1147','WCD10-B03-W09-F01','V1-CARD-0305','V1-ENT-0408','first_publication_year','1979','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1148','WCD10-B03-W09-F02','V1-CARD-0305','V1-ENT-0408','genre_or_form','小说','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1149','WCD10-B03-W09-F03','V1-CARD-0305','V1-ENT-0408','story_premise','小说围绕克里斯托弗·哥伦布及庇护九世提出为他封圣的计划展开，重新审视人物及其历史形象。','institutional_paraphrase','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1150','WCD10-B03-W10-F01','V1-CARD-0306','V1-ENT-0409','first_publication_year','1977','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1151','WCD10-B03-W10-F02','V1-CARD-0306','V1-ENT-0409','genre_or_form','小说','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1152','WCD10-B03-W10-F03','V1-CARD-0306','V1-ENT-0409','story_premise','年轻的瓦尔吉塔斯与年长姨妈胡利娅的恋情，和同一电台编剧佩德罗·卡马乔的广播故事交替展开，背景是二十世纪五十年代的利马。','institutional_paraphrase','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1153','WCD10-B03-W11-F01','V1-CARD-0307','V1-ENT-0410','first_publication_year','1987','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1154','WCD10-B03-W11-F02','V1-CARD-0307','V1-ENT-0410','genre_or_form','小说','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1155','WCD10-B03-W11-F03','V1-CARD-0307','V1-ENT-0410','story_premise','一位秘鲁作家在佛罗伦萨的展览照片中认出大学同学萨乌尔·苏拉塔斯，进而回忆并想象他成为亚马逊马奇根加人说书者的过程。','institutional_paraphrase','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1156','WCD10-B03-W12-F01','V1-CARD-0308','V1-ENT-0411','first_publication_year','1984','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1157','WCD10-B03-W12-F02','V1-CARD-0308','V1-ENT-0411','genre_or_form','小说','bibliographic','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1158','WCD10-B03-W12-F03','V1-CARD-0308','V1-ENT-0411','story_premise','在小说想象的、陷入动乱的近未来秘鲁，叙述者试图重构一位革命者朋友的经历。','institutional_paraphrase','WCD-10-B03','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1159','WCD10-B03-F01','V1-CARD-0309','V1-ENT-0084','genre_or_form','短篇小说','bibliographic','WCD-10-B03','high','batch_retained_candidate','Dillon正文称cuento；复用既有单篇，不建同名对象。'),
('V1-FCT-1160','WCD10-B03-F02','V1-CARD-0309','V1-ENT-0084','story_premise','布宜诺斯艾利斯一名证券交易所职员通过市中心的拱廊往来于日常生活与十九世纪巴黎，在另一座城市与若西亚娜相遇；他的另一种生活最终消失。','institutional_paraphrase','WCD-10-B03','high','batch_retained_candidate','只按原作段落126–129释义，不引入电影Julien/Bichette的名字或结局。'),
('V1-FCT-1161','WCD10-B03-F03','V1-CARD-0309','V1-ENT-0084','bibliographic_note','Dillon在125页将本篇标为收录于Todos los fuegos el fuego（1966），133页引用的是Norma于1994年出版的该合集135–159页；131页回指年份1959与上述条目存在疑点，因此本批不确定本篇首刊年。','bibliographic_note','WCD-10-B03','high','batch_retained_candidate','收录/引用版/首次发表分层；1966或1994不填作first_publication_year。'),
('V1-FCT-1162','WCD10-B03-F04','V1-CARD-0309','V1-ENT-0084','research_note','Dillon（2024，126–129、132页）把两城之间的穿行解读为日常责任与理想化欲望的对置，并指出原作女性形象受男性叙述视角支配；这里保存其有归属解释，不代表独立双源关系已获准。','scholarly_paraphrase','WCD-10-B03','high','research_note_only','research_note_only；同一SRC-0039不是第二独立研究，主题hold保持。'),
('V1-FCT-1163','WCD10-B03-F05','V1-CARD-0310','V1-ENT-0085','genre_or_form','短篇小说','bibliographic','WCD-10-B03','high','batch_retained_candidate','原作cuento层级，不混电影Jogo subterraneo。'),
('V1-FCT-1164','WCD10-B03-F06','V1-CARD-0310','V1-ENT-0085','story_premise','第一人称叙述者在巴黎地铁设定寻找理想女性的游戏：先决定路线，再期待一名女性与自己同路；遇见玛丽－克洛德后，他必须在自定规则与相遇之间作出选择。','institutional_paraphrase','WCD-10-B03','high','batch_retained_candidate','129–131原作段落；不倒灌São Paulo、Martín、Ana、卖淫职业或电影团圆结局。'),
('V1-FCT-1165','WCD10-B03-F07','V1-CARD-0310','V1-ENT-0085','bibliographic_note','Dillon（2024，129、133页）明确本篇收录于Octaedro，并引用Buenos Aires: Sudamericana,1974版55–74页；这只确认1974书版收录，未独立核实更早首刊或首次书版。','bibliographic_note','WCD-10-B03','high','batch_retained_candidate','1974引用版不提升为first_publication_year或first_book_edition_year。'),
('V1-FCT-1166','WCD10-B03-F08','V1-CARD-0310','V1-ENT-0085','research_note','Dillon（2024，129–132页）认为地铁游戏把偶然、欲望和城市路线联系起来，同时指出规则由男性主角单方面设定、女性被要求配合的权力不对称。','scholarly_paraphrase','WCD-10-B03','high','research_note_only','research_note_only；署名转述不是本项目的无归属评价，也不解除旧主题hold。'),
('V1-FCT-1167','WCD10-B03-F09','V1-CARD-0311','V1-ENT-0164','one_sentence_summary','五篇小说组成的合集，收录《母亲的来信》《良好的服务》《秘密武器》《魔鬼的涎液》与《追寻者》；此处仅作篇目构成说明。','institutional_paraphrase','WCD-10-B03','high','batch_retained_candidate','现有1959与genre保留；不把同名单篇、电影或爵士主题推广给整个合集，中文篇目暂译。'),
('V1-FCT-1168','WCD10-B03-F10','V1-CARD-0312','V1-ENT-0167','first_publication_year','1958','bibliographic','WCD-10-B03','high','batch_retained_candidate','只补1958作品书目；既有1982/1998扩编版bibliographic_note保留。'),
('V1-FCT-1169','WCD10-B03-F11','V1-CARD-0312','V1-ENT-0167','one_sentence_summary','塞万提斯学院年表中的1958年版由三个短篇与一部小说组成：El camino de Santiago、Viaje a la semilla、Semejante a la noche及El acoso；后续扩编本不据此固定篇目。','institutional_paraphrase','WCD-10-B03','high','batch_retained_candidate','限定1958版本集合描述；不覆盖旧genre或扩编书目，不新建四个单篇。'),
('V1-FCT-1170','WCD10-B03-F12','V1-CARD-0313','V1-ENT-0168','genre_or_form','小说','bibliographic','WCD-10-B03','high','batch_retained_candidate','novela只登记小说，不自行断定长篇；旧关系称中篇保持不覆盖。'),
('V1-FCT-1171','WCD10-B03-F13','V1-CARD-0313','V1-ENT-0168','story_premise','在哈瓦那，一名建筑学生为逃避追捕躲进剧院；贝多芬《英雄交响曲》的演奏期间，他回顾自己的家庭、爱情与政治经历。','institutional_paraphrase','WCD-10-B03','high','batch_retained_candidate','只取文学梗概；现实1933事件不结构化，现版2024不改作品1956。'),
('V1-FCT-1172','WCD10-B03-F14','V1-CARD-0314','V1-ENT-0160','first_publication_year','1966','bibliographic','WCD-10-B03','high','batch_retained_candidate','Cervantes直接1966；代理目录1967冲突明确排除，BnF旧再版书目及INCI地点研究保持。'),
('V1-FCT-1173','WCD10-B03-F15','V1-CARD-0314','V1-ENT-0160','genre_or_form','小说','bibliographic','WCD-10-B03','high','batch_retained_candidate','只用主条目Novel，不用该页年份或作者通用侧栏。'),
('V1-FCT-1174','WCD10-B03-F16','V1-CARD-0314','V1-ENT-0160','story_premise','外来者唐·安塞尔莫在秘鲁一座城镇郊外建立名为“绿房子”的妓院，邦妮菲西亚、神父与几位好友的命运在这里交织。','institutional_paraphrase','WCD-10-B03','high','batch_retained_candidate','只补直接人物/叙事概述，不重复INCI支持的SET_IN，不将推广二元主题作确认关系。'),
('V1-FCT-1175','WCD10-B03-F17','V1-CARD-0315','V1-ENT-0161','genre_or_form','小说','bibliographic','WCD-10-B03','high','batch_retained_candidate','保留旧1973与书目卡；现版2017不作首版。'),
('V1-FCT-1176','WCD10-B03-F18','V1-CARD-0315','V1-ENT-0161','story_premise','军官潘塔莱昂·潘托哈奉密令为秘鲁军队组织卖淫服务，前往伊基托斯执行任务；他过度执着于履行职责，反而危及自己建立的运作体系。','institutional_paraphrase','WCD-10-B03','high','batch_retained_candidate','只补直接梗概，Iquitos无既有端点暂不建SET_IN；不创建现实军队/人物。');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-1123','SRC-0360','Julio Cortázar. Cronología de obras'),
('V1-FCT-1123','SRC-0361','Los premios / The Winners'),
('V1-FCT-1124','SRC-0361','Los premios / The Winners'),
('V1-FCT-1125','SRC-0361','Los premios / The Winners'),
('V1-FCT-1126','SRC-0360','Julio Cortázar. Cronología de obras'),
('V1-FCT-1126','SRC-0362','62: Modelo para armar'),
('V1-FCT-1127','SRC-0362','62: Modelo para armar'),
('V1-FCT-1128','SRC-0362','62: Modelo para armar'),
('V1-FCT-1129','SRC-0360','Julio Cortázar. Cronología de obras'),
('V1-FCT-1129','SRC-0363','Libro de Manuel'),
('V1-FCT-1129','SRC-0380','Libro de Manuel'),
('V1-FCT-1130','SRC-0363','Libro de Manuel'),
('V1-FCT-1130','SRC-0380','Libro de Manuel'),
('V1-FCT-1131','SRC-0380','Libro de Manuel'),
('V1-FCT-1132','SRC-0360','Julio Cortázar. Cronología de obras'),
('V1-FCT-1133','SRC-0364','Historias de cronopios y de famas'),
('V1-FCT-1134','SRC-0364','Historias de cronopios y de famas'),
('V1-FCT-1135','SRC-0360','Julio Cortázar. Cronología de obras'),
('V1-FCT-1135','SRC-0365','Todos los fuegos el fuego / All Fires the Fire'),
('V1-FCT-1136','SRC-0365','Todos los fuegos el fuego / All Fires the Fire'),
('V1-FCT-1137','SRC-0365','Todos los fuegos el fuego / All Fires the Fire'),
('V1-FCT-1138','SRC-0360','Julio Cortázar. Cronología de obras'),
('V1-FCT-1138','SRC-0366','Octaedro / Octahedron'),
('V1-FCT-1139','SRC-0366','Octaedro / Octahedron'),
('V1-FCT-1140','SRC-0366','Octaedro / Octahedron'),
('V1-FCT-1141','SRC-0368','Alejo Carpentier. Cronología de obras'),
('V1-FCT-1141','SRC-0370','Concierto barroco'),
('V1-FCT-1142','SRC-0370','Concierto barroco'),
('V1-FCT-1143','SRC-0370','Concierto barroco'),
('V1-FCT-1144','SRC-0368','Alejo Carpentier. Cronología de obras'),
('V1-FCT-1145','SRC-0371','El recurso del método'),
('V1-FCT-1146','SRC-0371','El recurso del método'),
('V1-FCT-1147','SRC-0368','Alejo Carpentier. Cronología de obras'),
('V1-FCT-1147','SRC-0373','El arpa y la sombra / The Harp and the Shadow'),
('V1-FCT-1148','SRC-0373','El arpa y la sombra / The Harp and the Shadow'),
('V1-FCT-1149','SRC-0372','El arpa y la sombra'),
('V1-FCT-1150','SRC-0374','Mario Vargas Llosa. Cronología de obras'),
('V1-FCT-1150','SRC-0377','La tía Julia y el escribidor'),
('V1-FCT-1151','SRC-0377','La tía Julia y el escribidor'),
('V1-FCT-1152','SRC-0377','La tía Julia y el escribidor'),
('V1-FCT-1153','SRC-0374','Mario Vargas Llosa. Cronología de obras'),
('V1-FCT-1153','SRC-0378','El hablador / The Storyteller'),
('V1-FCT-1154','SRC-0378','El hablador / The Storyteller'),
('V1-FCT-1155','SRC-0378','El hablador / The Storyteller'),
('V1-FCT-1156','SRC-0374','Mario Vargas Llosa. Cronología de obras'),
('V1-FCT-1156','SRC-0379','Historia de Mayta / The Real Life of Alejandro Mayta'),
('V1-FCT-1157','SRC-0379','Historia de Mayta / The Real Life of Alejandro Mayta'),
('V1-FCT-1158','SRC-0379','Historia de Mayta / The Real Life of Alejandro Mayta'),
('V1-FCT-1159','SRC-0039','Romance y azar en la ciudad: dos transposiciones de cuentos de Julio Cortázar'),
('V1-FCT-1160','SRC-0039','Romance y azar en la ciudad: dos transposiciones de cuentos de Julio Cortázar'),
('V1-FCT-1161','SRC-0039','Romance y azar en la ciudad: dos transposiciones de cuentos de Julio Cortázar'),
('V1-FCT-1162','SRC-0039','Romance y azar en la ciudad: dos transposiciones de cuentos de Julio Cortázar'),
('V1-FCT-1163','SRC-0039','Romance y azar en la ciudad: dos transposiciones de cuentos de Julio Cortázar'),
('V1-FCT-1164','SRC-0039','Romance y azar en la ciudad: dos transposiciones de cuentos de Julio Cortázar'),
('V1-FCT-1165','SRC-0039','Romance y azar en la ciudad: dos transposiciones de cuentos de Julio Cortázar'),
('V1-FCT-1166','SRC-0039','Romance y azar en la ciudad: dos transposiciones de cuentos de Julio Cortázar'),
('V1-FCT-1167','SRC-0367','Las armas secretas / The Secret Weapons'),
('V1-FCT-1168','SRC-0368','Alejo Carpentier. Cronología de obras'),
('V1-FCT-1169','SRC-0368','Alejo Carpentier. Cronología de obras'),
('V1-FCT-1170','SRC-0369','El acoso'),
('V1-FCT-1171','SRC-0369','El acoso'),
('V1-FCT-1172','SRC-0374','Mario Vargas Llosa. Cronología de obras'),
('V1-FCT-1173','SRC-0375','La casa verde / The Green House'),
('V1-FCT-1174','SRC-0375','La casa verde / The Green House'),
('V1-FCT-1175','SRC-0376','Pantaleón y las visitadoras'),
('V1-FCT-1176','SRC-0376','Pantaleón y las visitadoras');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0297','V1-FCT-1123','batch_retained_candidate'),
('V1-CARD-0297','V1-FCT-1124','batch_retained_candidate'),
('V1-CARD-0297','V1-FCT-1125','batch_retained_candidate'),
('V1-CARD-0298','V1-FCT-1126','batch_retained_candidate'),
('V1-CARD-0298','V1-FCT-1127','batch_retained_candidate'),
('V1-CARD-0298','V1-FCT-1128','batch_retained_candidate'),
('V1-CARD-0299','V1-FCT-1129','batch_retained_candidate'),
('V1-CARD-0299','V1-FCT-1130','batch_retained_candidate'),
('V1-CARD-0299','V1-FCT-1131','batch_retained_candidate'),
('V1-CARD-0300','V1-FCT-1132','batch_retained_candidate'),
('V1-CARD-0300','V1-FCT-1133','batch_retained_candidate'),
('V1-CARD-0300','V1-FCT-1134','batch_retained_candidate'),
('V1-CARD-0301','V1-FCT-1135','batch_retained_candidate'),
('V1-CARD-0301','V1-FCT-1136','batch_retained_candidate'),
('V1-CARD-0301','V1-FCT-1137','batch_retained_candidate'),
('V1-CARD-0302','V1-FCT-1138','batch_retained_candidate'),
('V1-CARD-0302','V1-FCT-1139','batch_retained_candidate'),
('V1-CARD-0302','V1-FCT-1140','batch_retained_candidate'),
('V1-CARD-0303','V1-FCT-1141','batch_retained_candidate'),
('V1-CARD-0303','V1-FCT-1142','batch_retained_candidate'),
('V1-CARD-0303','V1-FCT-1143','batch_retained_candidate'),
('V1-CARD-0304','V1-FCT-1144','batch_retained_candidate'),
('V1-CARD-0304','V1-FCT-1145','batch_retained_candidate'),
('V1-CARD-0304','V1-FCT-1146','batch_retained_candidate'),
('V1-CARD-0305','V1-FCT-1147','batch_retained_candidate'),
('V1-CARD-0305','V1-FCT-1148','batch_retained_candidate'),
('V1-CARD-0305','V1-FCT-1149','batch_retained_candidate'),
('V1-CARD-0306','V1-FCT-1150','batch_retained_candidate'),
('V1-CARD-0306','V1-FCT-1151','batch_retained_candidate'),
('V1-CARD-0306','V1-FCT-1152','batch_retained_candidate'),
('V1-CARD-0307','V1-FCT-1153','batch_retained_candidate'),
('V1-CARD-0307','V1-FCT-1154','batch_retained_candidate'),
('V1-CARD-0307','V1-FCT-1155','batch_retained_candidate'),
('V1-CARD-0308','V1-FCT-1156','batch_retained_candidate'),
('V1-CARD-0308','V1-FCT-1157','batch_retained_candidate'),
('V1-CARD-0308','V1-FCT-1158','batch_retained_candidate'),
('V1-CARD-0309','V1-FCT-1159','batch_retained_candidate'),
('V1-CARD-0309','V1-FCT-1160','batch_retained_candidate'),
('V1-CARD-0309','V1-FCT-1161','batch_retained_candidate'),
('V1-CARD-0309','V1-FCT-1162','research_note_only'),
('V1-CARD-0310','V1-FCT-1163','batch_retained_candidate'),
('V1-CARD-0310','V1-FCT-1164','batch_retained_candidate'),
('V1-CARD-0310','V1-FCT-1165','batch_retained_candidate'),
('V1-CARD-0310','V1-FCT-1166','research_note_only'),
('V1-CARD-0311','V1-FCT-1167','batch_retained_candidate'),
('V1-CARD-0312','V1-FCT-1168','batch_retained_candidate'),
('V1-CARD-0312','V1-FCT-1169','batch_retained_candidate'),
('V1-CARD-0313','V1-FCT-1170','batch_retained_candidate'),
('V1-CARD-0313','V1-FCT-1171','batch_retained_candidate'),
('V1-CARD-0314','V1-FCT-1172','batch_retained_candidate'),
('V1-CARD-0314','V1-FCT-1173','batch_retained_candidate'),
('V1-CARD-0314','V1-FCT-1174','batch_retained_candidate'),
('V1-CARD-0315','V1-FCT-1175','batch_retained_candidate'),
('V1-CARD-0315','V1-FCT-1176','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0588','WCD10-B03-S01','V1-CARD-0297','SRC-0360','B','bibliography_or_bounded_description','yes','no','SRC-0360','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0589','WCD10-B03-S02','V1-CARD-0297','SRC-0361','B','bibliography_or_bounded_description','yes','no','SRC-0361','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0590','WCD10-B03-S01','V1-CARD-0298','SRC-0360','B','bibliography_or_bounded_description','yes','no','SRC-0360','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0591','WCD10-B03-S03','V1-CARD-0298','SRC-0362','B','bibliography_or_bounded_description','yes','no','SRC-0362','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0592','WCD10-B03-S01','V1-CARD-0299','SRC-0360','B','bibliography_or_bounded_description','yes','no','SRC-0360','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0593','WCD10-B03-S04','V1-CARD-0299','SRC-0363','B','bibliography_or_bounded_description','yes','no','SRC-0363','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0594','WCD10-B03-S22','V1-CARD-0299','SRC-0380','B','bibliography_or_bounded_description','yes','no','SRC-0380','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0595','WCD10-B03-S01','V1-CARD-0300','SRC-0360','B','bibliography_or_bounded_description','yes','no','SRC-0360','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0596','WCD10-B03-S05','V1-CARD-0300','SRC-0364','B','bibliography_or_bounded_description','yes','no','SRC-0364','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0597','WCD10-B03-S01','V1-CARD-0301','SRC-0360','B','bibliography_or_bounded_description','yes','no','SRC-0360','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0598','WCD10-B03-S06','V1-CARD-0301','SRC-0365','B','bibliography_or_bounded_description','yes','no','SRC-0365','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0599','WCD10-B03-S01','V1-CARD-0302','SRC-0360','B','bibliography_or_bounded_description','yes','no','SRC-0360','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0600','WCD10-B03-S07','V1-CARD-0302','SRC-0366','B','bibliography_or_bounded_description','yes','no','SRC-0366','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0601','WCD10-B03-S10','V1-CARD-0303','SRC-0368','B','bibliography_or_bounded_description','yes','no','SRC-0368','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0602','WCD10-B03-S12','V1-CARD-0303','SRC-0370','B','bibliography_or_bounded_description','yes','no','SRC-0370','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0603','WCD10-B03-S10','V1-CARD-0304','SRC-0368','B','bibliography_or_bounded_description','yes','no','SRC-0368','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0604','WCD10-B03-S13','V1-CARD-0304','SRC-0371','B','bibliography_or_bounded_description','yes','no','SRC-0371','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0605','WCD10-B03-S10','V1-CARD-0305','SRC-0368','B','bibliography_or_bounded_description','yes','no','SRC-0368','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0606','WCD10-B03-S14','V1-CARD-0305','SRC-0372','B','bibliography_or_bounded_description','no','no','SRC-0372','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0607','WCD10-B03-S15','V1-CARD-0305','SRC-0373','B','bibliography_or_bounded_description','yes','no','SRC-0373','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0608','WCD10-B03-S16','V1-CARD-0306','SRC-0374','B','bibliography_or_bounded_description','yes','no','SRC-0374','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0609','WCD10-B03-S19','V1-CARD-0306','SRC-0377','B','bibliography_or_bounded_description','yes','no','SRC-0377','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0610','WCD10-B03-S16','V1-CARD-0307','SRC-0374','B','bibliography_or_bounded_description','yes','no','SRC-0374','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0611','WCD10-B03-S20','V1-CARD-0307','SRC-0378','B','bibliography_or_bounded_description','yes','no','SRC-0378','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0612','WCD10-B03-S16','V1-CARD-0308','SRC-0374','B','bibliography_or_bounded_description','yes','no','SRC-0374','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0613','WCD10-B03-S21','V1-CARD-0308','SRC-0379','B','bibliography_or_bounded_description','yes','no','SRC-0379','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0614','WCD10-B03-S09','V1-CARD-0309','SRC-0039','A','attributed_study','yes','yes','SRC-0039','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0615','WCD10-B03-S09','V1-CARD-0310','SRC-0039','A','attributed_study','yes','yes','SRC-0039','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0616','WCD10-B03-S08','V1-CARD-0311','SRC-0367','B','bibliography_or_bounded_description','no','no','SRC-0367','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0617','WCD10-B03-S10','V1-CARD-0312','SRC-0368','B','bibliography_or_bounded_description','yes','no','SRC-0368','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0618','WCD10-B03-S11','V1-CARD-0313','SRC-0369','B','bibliography_or_bounded_description','yes','no','SRC-0369','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0619','WCD10-B03-S16','V1-CARD-0314','SRC-0374','B','bibliography_or_bounded_description','yes','no','SRC-0374','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0620','WCD10-B03-S17','V1-CARD-0314','SRC-0375','B','bibliography_or_bounded_description','yes','no','SRC-0375','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0621','WCD10-B03-S18','V1-CARD-0315','SRC-0376','B','bibliography_or_bounded_description','yes','no','SRC-0376','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0359','WCD-10-B03','WCD10-B03-W01-CREATED','V1-ENT-0073','CREATED','V1-ENT-0400','胡利奥·科塔萨尔创作 Los premios','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0360','WCD-10-B03','WCD10-B03-W02-CREATED','V1-ENT-0073','CREATED','V1-ENT-0401','胡利奥·科塔萨尔创作 62: Modelo para armar','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0361','WCD-10-B03','WCD10-B03-W03-CREATED','V1-ENT-0073','CREATED','V1-ENT-0402','胡利奥·科塔萨尔创作 Libro de Manuel','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0362','WCD-10-B03','WCD10-B03-W04-CREATED','V1-ENT-0073','CREATED','V1-ENT-0403','胡利奥·科塔萨尔创作 Historias de cronopios y de famas','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0363','WCD-10-B03','WCD10-B03-W05-CREATED','V1-ENT-0073','CREATED','V1-ENT-0404','胡利奥·科塔萨尔创作 Todos los fuegos el fuego','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0364','WCD-10-B03','WCD10-B03-W06-CREATED','V1-ENT-0073','CREATED','V1-ENT-0405','胡利奥·科塔萨尔创作 Octaedro','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0365','WCD-10-B03','WCD10-B03-W07-CREATED','V1-ENT-0074','CREATED','V1-ENT-0406','阿莱霍·卡彭铁尔创作 Concierto barroco','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0366','WCD-10-B03','WCD10-B03-W08-CREATED','V1-ENT-0074','CREATED','V1-ENT-0407','阿莱霍·卡彭铁尔创作 El recurso del método','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0367','WCD-10-B03','WCD10-B03-W09-CREATED','V1-ENT-0074','CREATED','V1-ENT-0408','阿莱霍·卡彭铁尔创作 El arpa y la sombra','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0368','WCD-10-B03','WCD10-B03-W10-CREATED','V1-ENT-0114','CREATED','V1-ENT-0409','马里奥·巴尔加斯·略萨创作 La tía Julia y el escribidor','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0369','WCD-10-B03','WCD10-B03-W11-CREATED','V1-ENT-0114','CREATED','V1-ENT-0410','马里奥·巴尔加斯·略萨创作 El hablador','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0370','WCD-10-B03','WCD10-B03-W12-CREATED','V1-ENT-0114','CREATED','V1-ENT-0411','马里奥·巴尔加斯·略萨创作 Historia de Mayta','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0371','WCD-10-B03','WCD10-B03-R01','V1-ENT-0084','SET_IN','V1-ENT-0370','El otro cielo的原作叙事在布宜诺斯艾利斯日常生活与十九世纪巴黎之间穿行；这里只连接城市，不将幻想通道落现实坐标。','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0372','WCD-10-B03','WCD10-B03-R02','V1-ENT-0084','SET_IN','V1-ENT-0373','El otro cielo原作的另一城市场景为十九世纪巴黎，不与电影的全巴黎时空等同。','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0373','WCD-10-B03','WCD10-B03-R03','V1-ENT-0085','SET_IN','V1-ENT-0373','Manuscrito hallado en un bolsillo原作的游戏发生在巴黎地铁；São Paulo仅电影改编，未纳入此关系。','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0374','WCD-10-B03','WCD10-B03-R04','V1-ENT-0401','SET_IN','V1-ENT-0373','代理作品页明确62: Modelo para armar叙事经过巴黎；不把写作地当作背景。','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0375','WCD-10-B03','WCD10-B03-R05','V1-ENT-0401','SET_IN','V1-ENT-0370','代理作品页明确62: Modelo para armar叙事经过布宜诺斯艾利斯；这是作品城市背景。','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0376','WCD-10-B03','WCD10-B03-R06','V1-ENT-0168','SET_IN','V1-ENT-0372','FCE具体作品页明确El acoso剧院避难情节位于哈瓦那；不据此确认真实政治事件。','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0377','WCD-10-B03','WCD10-B03-R07','V1-ENT-0409','SET_IN','V1-ENT-0125','出版者明确La tía Julia y el escribidor爱情与广播叙事置于五十年代利马社会。','high','accepted','wcd10_b01_review:PASS','1','NONE'),
('V1-REL-0378','WCD-10-B03','WCD10-B03-R08','V1-ENT-0411','SET_IN','V1-ENT-0124','Historia de Mayta目录简介把叙事置于想象的近未来秘鲁；只关联国家背景，不认定该战争为现实事件。','high','accepted','wcd10_b01_review:PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0359','SRC-0361'),
('V1-REL-0360','SRC-0362'),
('V1-REL-0361','SRC-0363'),
('V1-REL-0362','SRC-0364'),
('V1-REL-0363','SRC-0365'),
('V1-REL-0364','SRC-0366'),
('V1-REL-0365','SRC-0370'),
('V1-REL-0366','SRC-0371'),
('V1-REL-0367','SRC-0373'),
('V1-REL-0368','SRC-0377'),
('V1-REL-0369','SRC-0378'),
('V1-REL-0370','SRC-0379'),
('V1-REL-0371','SRC-0039'),
('V1-REL-0372','SRC-0039'),
('V1-REL-0373','SRC-0039'),
('V1-REL-0374','SRC-0362'),
('V1-REL-0375','SRC-0362'),
('V1-REL-0376','SRC-0369'),
('V1-REL-0377','SRC-0377'),
('V1-REL-0378','SRC-0379');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0403','V1-REL-0359','WCD10-B03-S02','SRC-0361','Los premios / The Winners','作品主条目Novel1960及开头cruise简介','胡利奥·科塔萨尔创作 Los premios','high','eligible_evidence','WCD-10-B03'),
('V1-EV-0404','V1-REL-0360','WCD10-B03-S03','SRC-0362','62: Modelo para armar','主条目Novel·la1968；简介Londres/París/Buenos Aires','胡利奥·科塔萨尔创作 62: Modelo para armar','high','eligible_evidence','WCD-10-B03'),
('V1-EV-0405','V1-REL-0361','WCD10-B03-S04','SRC-0363','Libro de Manuel','主条目Novela1973','胡利奥·科塔萨尔创作 Libro de Manuel','high','eligible_evidence','WCD-10-B03'),
('V1-EV-0406','V1-REL-0362','WCD10-B03-S05','SRC-0364','Historias de cronopios y de famas','colección de cuentos y viñetas；完整编辑简介；ISBN9788466331890','胡利奥·科塔萨尔创作 Historias de cronopios y de famas','high','eligible_evidence','WCD-10-B03'),
('V1-EV-0407','V1-REL-0363','WCD10-B03-S06','SRC-0365','Todos los fuegos el fuego / All Fires the Fire','主条目1966；eight stories及El otro cielo篇目表','胡利奥·科塔萨尔创作 Todos los fuegos el fuego','high','eligible_evidence','WCD-10-B03'),
('V1-EV-0408','V1-REL-0364','WCD10-B03-S07','SRC-0366','Octaedro / Octahedron','主条目1974；eight stories简介','胡利奥·科塔萨尔创作 Octaedro','high','eligible_evidence','WCD-10-B03'),
('V1-EV-0409','V1-REL-0365','WCD10-B03-S12','SRC-0370','Concierto barroco','主条目Novel·la1974；indiano与criado赴欧寻找乐器','阿莱霍·卡彭铁尔创作 Concierto barroco','high','eligible_evidence','WCD-10-B03'),
('V1-EV-0410','V1-REL-0366','WCD10-B03-S13','SRC-0371','El recurso del método','Sinopsis：acción de la novela/Primer Magistrado；现版2014','阿莱霍·卡彭铁尔创作 El recurso del método','high','eligible_evidence','WCD-10-B03'),
('V1-EV-0411','V1-REL-0367','WCD10-B03-S15','SRC-0373','El arpa y la sombra / The Harp and the Shadow','主条目Novel1979','阿莱霍·卡彭铁尔创作 El arpa y la sombra','high','eligible_evidence','WCD-10-B03'),
('V1-EV-0412','V1-REL-0368','WCD10-B03-S19','SRC-0377','La tía Julia y el escribidor','完整编辑简介：novela/publicada1977；Varguitas/Julia/Pedro Camacho/sociedad limeña años cincuenta','马里奥·巴尔加斯·略萨创作 La tía Julia y el escribidor','high','eligible_evidence','WCD-10-B03'),
('V1-EV-0413','V1-REL-0369','WCD10-B03-S20','SRC-0378','El hablador / The Storyteller','主条目Novel1987；Florence照片/大学同学Saul Zuratas/Machiguenga介绍','马里奥·巴尔加斯·略萨创作 El hablador','high','eligible_evidence','WCD-10-B03'),
('V1-EV-0414','V1-REL-0370','WCD10-B03-S21','SRC-0379','Historia de Mayta / The Real Life of Alejandro Mayta','主条目Novel1984；near-future Peru/narrator reconstructs revolutionary friend','马里奥·巴尔加斯·略萨创作 Historia de Mayta','high','eligible_evidence','WCD-10-B03'),
('V1-EV-0415','V1-REL-0371','WCD10-B03-S09','SRC-0039','Romance y azar en la ciudad: dos transposiciones de cuentos de Julio Cortázar','Anclajes28(2),2024,123–135；El otro cielo125–129；Manuscrito129–132；参考书目133；DOI10.19137/anclajes-2024-2829','El otro cielo的原作叙事在布宜诺斯艾利斯日常生活与十九世纪巴黎之间穿行；这里只连接城市，不将幻想通道落现实坐标。','high','eligible_evidence','WCD-10-B03'),
('V1-EV-0416','V1-REL-0372','WCD10-B03-S09','SRC-0039','Romance y azar en la ciudad: dos transposiciones de cuentos de Julio Cortázar','Anclajes28(2),2024,123–135；El otro cielo125–129；Manuscrito129–132；参考书目133；DOI10.19137/anclajes-2024-2829','El otro cielo原作的另一城市场景为十九世纪巴黎，不与电影的全巴黎时空等同。','high','eligible_evidence','WCD-10-B03'),
('V1-EV-0417','V1-REL-0373','WCD10-B03-S09','SRC-0039','Romance y azar en la ciudad: dos transposiciones de cuentos de Julio Cortázar','Anclajes28(2),2024,123–135；El otro cielo125–129；Manuscrito129–132；参考书目133；DOI10.19137/anclajes-2024-2829','Manuscrito hallado en un bolsillo原作的游戏发生在巴黎地铁；São Paulo仅电影改编，未纳入此关系。','high','eligible_evidence','WCD-10-B03'),
('V1-EV-0418','V1-REL-0374','WCD10-B03-S03','SRC-0362','62: Modelo para armar','主条目Novel·la1968；简介Londres/París/Buenos Aires','代理作品页明确62: Modelo para armar叙事经过巴黎；不把写作地当作背景。','high','eligible_evidence','WCD-10-B03'),
('V1-EV-0419','V1-REL-0375','WCD10-B03-S03','SRC-0362','62: Modelo para armar','主条目Novel·la1968；简介Londres/París/Buenos Aires','代理作品页明确62: Modelo para armar叙事经过布宜诺斯艾利斯；这是作品城市背景。','high','eligible_evidence','WCD-10-B03'),
('V1-EV-0420','V1-REL-0376','WCD10-B03-S11','SRC-0369','El acoso','Reseña建筑学生/La Habana/剧院；ISBN9786071683090；Primera edición2024','FCE具体作品页明确El acoso剧院避难情节位于哈瓦那；不据此确认真实政治事件。','high','eligible_evidence','WCD-10-B03'),
('V1-EV-0421','V1-REL-0377','WCD10-B03-S19','SRC-0377','La tía Julia y el escribidor','完整编辑简介：novela/publicada1977；Varguitas/Julia/Pedro Camacho/sociedad limeña años cincuenta','出版者明确La tía Julia y el escribidor爱情与广播叙事置于五十年代利马社会。','high','eligible_evidence','WCD-10-B03'),
('V1-EV-0422','V1-REL-0378','WCD10-B03-S21','SRC-0379','Historia de Mayta / The Real Life of Alejandro Mayta','主条目Novel1984；near-future Peru/narrator reconstructs revolutionary friend','Historia de Mayta目录简介把叙事置于想象的近未来秘鲁；只关联国家背景，不认定该战争为现实事件。','high','eligible_evidence','WCD-10-B03');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0071','WCD-10-B03-G01','research_gap','WCD10:B03:El_otro_cielo:first_publication_year','open','Dillon125页1966合集收录、133页1994引用版与131页1959回指不能证明首次发表；保留年份缺口。','','Independent Reviewer: preserve research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0072','WCD-10-B03-G02','research_gap','WCD10:B03:Manuscrito:first_publication_year','open','1974是被引用的Octaedro书版；没有独立排除首刊，故不填泛化首版或first_book_edition_year。','','Independent Reviewer: preserve research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0073','WCD-10-B03-G03','research_gap','WCD10:B03:Cortazar:single_story_collection_edges','open','收录出处保存在bibliographic_note；当前候选工具无已复核单篇—合集边路径，本批不修改词表或建立未评审APPEARS_IN。','','Independent Reviewer: preserve research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0074','WCD-10-B03-G04','research_gap','WCD10:B03:Ultimo_round:year_conflict','open','Cervantes1968与上轮实际打开SigloXXI1969冲突；1969代理侧栏仍不足解除版本边界，本批不建对象。','','Independent Reviewer: preserve research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0075','WCD-10-B03-G05','research_gap','WCD10:B03:Deshoras_La_otra_orilla:year_layer','open','Deshoras1982/1983冲突；La otra orilla1945可能写作年，不当作首印；范围先保留六个可靠新对象。','','Independent Reviewer: preserve research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0076','WCD-10-B03-G06','research_gap','WCD10:B03:Concierto_barroco:historical_opera_date','open','代理介绍歌剧1773存在明显核查疑点；本批只用人物旅程，排除历史断言与BASED_ON_EVENT。','','Independent Reviewer: preserve research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0077','WCD-10-B03-G07','research_gap','WCD10:B03:La_casa_verde:agency_1967','open','Cervantes明确1966且旧BnF4e1967再版链支持区分；代理1967不用于首次出版，旧书目不覆盖，仍保留冲突记录。','','Independent Reviewer: preserve excluded_conflicting_catalog_year','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0078','WCD-10-B03-G08','research_gap','WCD10:B03:La_consagracion_Los_jefes_Los_cachorros:next_research','open','只有年表线索或具体页未成功打开，尚无本轮已读的对象级简介/版本构成；不凑新增数量。','','Independent Reviewer: preserve research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0079','WCD-10-B03-G09','research_gap','WCD10:B03:London_Iquitos_Florence:missing_endpoints','open','文字中保留明确城市，但当前库没有对应端点，本批不扩地点范围或用国家关系替代城市。','','Independent Reviewer: preserve research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0080','WCD-10-B03-G10','research_gap','WCD10:B03:legacy_holds:retain','open','同一论文fresh全文不成为第二来源；Cortázar单源主题、Carpentier/Vargas文学运动等旧holds保持，不追加确认解释型关系。','','Independent Reviewer: preserve legacy_hold_retained','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0081','WCD-10-B03:V1-ENT-0164','research_gap','WCD10:work_level_research:V1-ENT-0164','open','Las armas secretas集合级独立A级研究OPEN；五篇构成不等于爵士/电影或文学爆炸解释确认；旧hold0048保持。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0082','WCD-10-B03:V1-ENT-0167','research_gap','WCD10:work_level_research:V1-ENT-0167','open','Guerra del tiempo集合级A级研究OPEN；保留后续Guerra del tiempo y otros relatos版本差异，不称四项固定全版本目录。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0083','WCD-10-B03:V1-ENT-0168','research_gap','WCD10:work_level_research:V1-ENT-0168','open','El acosoA级研究OPEN；2024现版不改1956，小说故事不确认现实政治事件。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0084','WCD-10-B03:V1-ENT-0160','research_gap','WCD10:work_level_research:V1-ENT-0160','open','旧INCI(B)地点关系REL-0310及resolved hold0045沿用，不称缺来源或重复SET_IN；独立A级作品研究与运动hold0049保持，1967代理目录冲突排除。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0085','WCD-10-B03:V1-ENT-0161','research_gap','WCD10:work_level_research:V1-ENT-0161','open','Pantaleón作品A级研究OPEN；Iquitos仅文字、不新增地点端点或以作者国家替代。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0086','WCD-10-B03:V1-ENT-0377','research_gap','WCD10:work_level_research:V1-ENT-0377','open','La fiesta del Chivo已有2000、genre和梗概保留；旧B/B/C不是A级研究，Nobel本轮403不自动撤销历史来源或伪称fresh open。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0087','WCD-10-B03:WCD10-B03-W01','research_gap','WCD10:work_level_research:V1-ENT-0400','open','Los premios作品级A级研究OPEN；只存小说/航程梗概，不用四作合辑代替对象；中文显示名暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0088','WCD-10-B03:WCD10-B03-W02','research_gap','WCD10:work_level_research:V1-ENT-0401','open','62作品级A级研究OPEN；两个直接城市SET_IN不确认读者参与文学解释关系，London端点缺失；中文暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0089','WCD-10-B03:WCD10-B03-W03','research_gap','WCD10:work_level_research:V1-ENT-0402','open','Libro de Manuel作品级A级研究OPEN；剪报/革命情节不确认现实事件或流派；中文暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0090','WCD-10-B03:WCD10-B03-W04','research_gap','WCD10:work_level_research:V1-ENT-0403','open','Historias集合级A级研究OPEN；体裁为短篇与小品，不用推广总评补独立研究；中文暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0091','WCD-10-B03:WCD10-B03-W05','research_gap','WCD10:work_level_research:V1-ENT-0404','open','Todos los fuegos合集级A级研究OPEN；Dillon对El otro cielo的研究不下推整本；同名单篇/收录边保持分层；中文暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0092','WCD-10-B03:WCD10-B03-W06','research_gap','WCD10:work_level_research:V1-ENT-0405','open','Octaedro合集级A级研究OPEN；Dillon对Manuscrito的研究不当整本研究；不生成梦境/政治主题；中文暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0093','WCD-10-B03:WCD10-B03-W07','research_gap','WCD10:work_level_research:V1-ENT-0406','open','Concierto作品级A级研究OPEN；歌剧1773疑点/事件关系不准入；中文暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0094','WCD-10-B03:WCD10-B03-W08','research_gap','WCD10:work_level_research:V1-ENT-0407','open','Recurso作品级A级研究OPEN；代理/出版目录不确认人物原型或笛卡尔作品回应关系；中文暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0095','WCD-10-B03:WCD10-B03-W09','research_gap','WCD10:work_level_research:V1-ENT-0408','open','Arpa作品级A级研究OPEN；UFSM论文落地页未成功打开，不登记A级fresh来源；宗教历史事件不结构化，中文暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0096','WCD-10-B03:WCD10-B03-W10','research_gap','WCD10:work_level_research:V1-ENT-0409','open','Tía Julia作品级A级研究OPEN；利马SET_IN不把小说直接升为作者婚姻事实；中文暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0097','WCD-10-B03:WCD10-B03-W11','research_gap','WCD10:work_level_research:V1-ENT-0410','open','Hablador作品级A级研究OPEN；Machiguenga只为文学叙事，不生成族群事实；Florence无端点，中文暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0098','WCD-10-B03:WCD10-B03-W12','research_gap','WCD10:work_level_research:V1-ENT-0411','open','Mayta作品级A级研究OPEN；秘鲁SET_IN是虚构背景，不认定现实革命事件；中文暂译。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');

UPDATE metadata SET value='WCD-10-B03' WHERE key='last_change_set';

UPDATE metadata SET value='2026-09-29' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 378 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 409 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 407 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 315 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1170 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 1246 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1149 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 613 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 376 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 451 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 422 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 98 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
