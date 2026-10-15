-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: Codex-parent-independent-review

-- Registration sha256: 8fa89220af1191bd8a5e3f1c9a5da3a4bc11d73306cdd06e8f9a0ace0cc70746

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2634 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1578 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 812 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 787 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 785 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 3283 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2655 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 678 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 55 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 1150 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 1179 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 760 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 791 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B20' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0794' OR canonical_url='https://www.anhvenezuela.org.ve/wp-content/uploads/2024/06/ROMULO-GALLEGOS-S.-A.-CONSALVI-BBV-41.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0795' OR canonical_url='https://catalogosiidca.csuca.org/Record/UP.96127/TOC') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0796' OR canonical_url='https://www.cervantesvirtual.com/portales/rosalia_de_castro_ga/obra/la-rebelion-1922--0/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0790' OR (entity_type='work' AND original_name='Reinaldo Solar')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0791' OR (entity_type='work' AND original_name='La Trepadora')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0792' OR (entity_type='work' AND original_name='Pobre Negro')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0793' OR (entity_type='work' AND original_name='El Forastero')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0794' OR (entity_type='work' AND original_name='Sobre la misma tierra')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0795' OR (entity_type='work' AND original_name='La brizna de paja en el viento')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0796' OR (entity_type='collection' AND original_name='Los aventureros')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0797' OR (entity_type='collection' AND original_name='La rebelión y otros cuentos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2662' OR (subject_id='V1-ENT-0790' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2663' OR (subject_id='V1-ENT-0790' AND fact_field='bibliographic_note' AND value_text='资料记载《El Último Solar》于1920年出版，之后经修改和删节后以《Reinaldo Solar》于1930年再版；本候选以修订再版题名作为作品身份，不把旧题名重复建成另一对象。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2664' OR (subject_id='V1-ENT-0790' AND fact_field='one_sentence_summary' AND value_text='小说围绕家族衰落后的最后代表Reinaldo展开，他在恢复家族庄园、公共理想与个人生活之间不断摇摆，最终走向未定的政治冒险。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2665' OR (subject_id='V1-ENT-0791' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2666' OR (subject_id='V1-ENT-0791' AND fact_field='first_publication_year' AND value_text='1925')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2667' OR (subject_id='V1-ENT-0791' AND fact_field='one_sentence_summary' AND value_text='小说以咖啡采收女子Modesta Guanipa之子Hilario及其女儿Victoria为中心，写家族继承、庄园权力与爱情关系交织的变化。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2668' OR (subject_id='V1-ENT-0792' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2669' OR (subject_id='V1-ENT-0792' AND fact_field='first_publication_year' AND value_text='1937')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2670' OR (subject_id='V1-ENT-0792' AND fact_field='one_sentence_summary' AND value_text='小说以联邦战争前后的委内瑞拉为背景，描写内战、废奴之后的社会冲突及普通民众在动荡历史中的处境。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2671' OR (subject_id='V1-ENT-0793' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2672' OR (subject_id='V1-ENT-0793' AND fact_field='first_publication_year' AND value_text='1942')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2673' OR (subject_id='V1-ENT-0793' AND fact_field='bibliographic_note' AND value_text='传记区分1921年写成而1980年才以“未刊小说”出版的早期稿本，与1942年刊行的重写版本；本候选只收1942年出版对象，不将两者误称为同一版本。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2674' OR (subject_id='V1-ENT-0793' AND fact_field='one_sentence_summary' AND value_text='小说以受压迫的小镇和横行的暴君为背景；传记强调1942年重写本与早期稿在故事情节上明显不同。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2675' OR (subject_id='V1-ENT-0794' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2676' OR (subject_id='V1-ENT-0794' AND fact_field='bibliographic_note' AND value_text='资料记载分歧：Fundación Empresas Polar列《Sobre la misma tierra》为1941年；Academia Nacional de la Historia传记以1943年为章节年份。现有来源在年份记载上不一致，暂不填写首版年；此处不据此断言存在不同版本。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2677' OR (subject_id='V1-ENT-0794' AND fact_field='one_sentence_summary' AND value_text='小说以苏利亚州和委内瑞拉瓜希拉地区为背景，通过Remota Montiel及当地牧民的生活，呈现贫困、土地处境与石油开发带来的变化。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2678' OR (subject_id='V1-ENT-0795' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2679' OR (subject_id='V1-ENT-0795' AND fact_field='bibliographic_note' AND value_text='CSUCA目录以《La brizna de paja en el viento》著录该题名，并列入Aguilar 1958年《Obras completas》第二卷；Academia传记以《Una brizna de paja en el viento》称该流亡时期小说。1958为汇编版出版年，不作为本作品首版年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2680' OR (subject_id='V1-ENT-0795' AND fact_field='one_sentence_summary' AND value_text='这部流亡时期创作的小说以古巴为题材，涉及大学生运动及马查多独裁政治遗留的问题。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2681' OR (subject_id='V1-ENT-0796' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2682' OR (subject_id='V1-ENT-0796' AND fact_field='first_publication_year' AND value_text='1913')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2683' OR (subject_id='V1-ENT-0796' AND fact_field='one_sentence_summary' AND value_text='这部早期短篇集收录七篇故事；同名篇章写律师Jacinto Ávila与山地首领Matías Rosalira策动起义的经历。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2684' OR (subject_id='V1-ENT-0797' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2685' OR (subject_id='V1-ENT-0797' AND fact_field='bibliographic_note' AND value_text='Cervantes数字记录所据《La rebelión y otros cuentos》为Caracas Librería y Editorial del Maestro 1946年版；不将单篇《La rebelión》页面题名中的1922年认定为合集首版年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2686' OR (subject_id='V1-ENT-0797' AND fact_field='one_sentence_summary' AND value_text='这部短篇小说集收录《La rebelión》等篇；图书馆数字目录将同名篇目定位在该集的页7至40。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2687' OR (subject_id='V1-ENT-0367' AND fact_field='one_sentence_summary' AND value_text='小说把Santos Luzardo重返阿普雷平原、接手Altamira庄园的经历，与Doña Bárbara所代表的土地权力和暴力相对照，呈现人物在冲突中的改变。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2688' OR (subject_id='V1-ENT-0368' AND fact_field='one_sentence_summary' AND value_text='小说以委内瑞拉平原为背景，围绕歌者Florentino展开；传记将作品描述为富有歌唱性、诗性叙述和传奇氛围。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2689' OR (subject_id='V1-ENT-0369' AND fact_field='one_sentence_summary' AND value_text='小说以圭亚那为背景，写冒险者Marcos Vargas遭遇的旅途、暴力冲突及其与当地人物的较量，并以壮阔景观构成叙事的重要部分。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0763' OR (subject_id='V1-ENT-0360' AND relation_type='CREATED' AND object_id='V1-ENT-0790')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0764' OR (subject_id='V1-ENT-0360' AND relation_type='CREATED' AND object_id='V1-ENT-0791')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0765' OR (subject_id='V1-ENT-0360' AND relation_type='CREATED' AND object_id='V1-ENT-0792')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0766' OR (subject_id='V1-ENT-0360' AND relation_type='CREATED' AND object_id='V1-ENT-0793')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0767' OR (subject_id='V1-ENT-0360' AND relation_type='CREATED' AND object_id='V1-ENT-0794')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0768' OR (subject_id='V1-ENT-0360' AND relation_type='CREATED' AND object_id='V1-ENT-0795')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0769' OR (subject_id='V1-ENT-0360' AND relation_type='CREATED' AND object_id='V1-ENT-0796')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0770' OR (subject_id='V1-ENT-0360' AND relation_type='CREATED' AND object_id='V1-ENT-0797')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0794','WCD10-B21-S002','Rómulo Gallegos','Rómulo Gallegos','Simón Alberto Consalvi','','C.A. Editora El Nacional','','','biographical_monograph_pdf','','es','B','access_pass','WCD-10-B21','Research候选，未经独立审核及Curation准入不得公开。','remote_only；未下载、保存网页、书籍或扫描件。','','https://www.anhvenezuela.org.ve/wp-content/uploads/2024/06/ROMULO-GALLEGOS-S.-A.-CONSALVI-BBV-41.pdf'),
('SRC-0795','WCD10-B21-S003','Obras completas /','Obras completas /','Sistema Integrado de Información Documental Centroamericano (SIIDCA-CSUCA)','','Sistema Integrado de Información Documental Centroamericano (SIIDCA-CSUCA)','','','library_catalog_record','','es','B','access_pass','WCD-10-B21','Research候选，未经独立审核及Curation准入不得公开。','remote_only；未下载、保存网页、书籍或扫描件。','','https://catalogosiidca.csuca.org/Record/UP.96127/TOC'),
('SRC-0796','WCD10-B21-S004','La rebelión (1922) / Rómulo Gallegos','La rebelión (1922) / Rómulo Gallegos','Biblioteca Virtual Miguel de Cervantes','','Biblioteca Virtual Miguel de Cervantes','2001','','digital_library_catalog_record','','es','B','access_pass','WCD-10-B21','Research候选，未经独立审核及Curation准入不得公开。','remote_only；未下载、保存网页、书籍或扫描件。','','https://www.cervantesvirtual.com/portales/rosalia_de_castro_ga/obra/la-rebelion-1922--0/');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0790','work','《雷纳尔多·索拉尔》（暂译）','Reinaldo Solar','candidate','1','WCD10-B21-W001','Fundación Empresas Polar记载《El Último Solar》于1920年出版，修改删节后以《Reinaldo Solar》于1930年再版；Academia Nacional de la Historia传记提供人物与小说脉络。按再版题名建立一项作品，不另建旧题名实体。; 中文名仅作检索用工作译名，保留西班牙语原题作为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0791','work','《攀援者》（暂译）','La Trepadora','candidate','1','WCD10-B21-W002','Academia Nacional de la Historia传记明确记载该小说于1925年由Tipografía Mercantil出版，并介绍Hilario Guanipa与女儿Victoria等主要人物。; 中文名仅作检索用工作译名，保留西班牙语原题作为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0792','work','《穷黑人》（暂译）','Pobre Negro','candidate','1','WCD10-B21-W003','Academia Nacional de la Historia传记记载该小说1937年出版，并将其内容与委内瑞拉联邦战争及其社会冲突相联系；CSUCA目录列入Gallegos作品汇编。; 中文名仅作检索用工作译名，保留西班牙语原题作为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0793','work','《异乡客》（暂译）','El Forastero','candidate','1','WCD10-B21-W004','Academia Nacional de la Historia传记说明1942年出版版本是作者重写的第二版，并区别于1921年写成、1980年才出版的早期版本；CSUCA目录列入其1958年作品汇编。; 中文名仅作检索用工作译名，保留西班牙语原题作为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0794','work','《在同一片土地上》（暂译）','Sobre la misma tierra','candidate','1','WCD10-B21-W005','Fundación Empresas Polar和Academia Nacional de la Historia均记载该作品并提供不同年份；Academia传记介绍瓜希拉地区、Remota Montiel与石油开发的相关内容；CSUCA目录确认该题名收入汇编。; 中文名仅作检索用工作译名，保留西班牙语原题作为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0795','work','《风中的一根稻草》（暂译）','La brizna de paja en el viento','candidate','1','WCD10-B21-W006','CSUCA图书馆目录将《La brizna de paja en el viento》列入1958年《Obras completas》第二卷；Academia Nacional de la Historia传记把题为《Una brizna de paja en el viento》的作品列作流亡时期小说之一，并概述其古巴题材。; 中文名仅作检索用工作译名，保留西班牙语原题作为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0796','collection','《冒险者们》（暂译）','Los aventureros','candidate','1','WCD10-B21-W007','Academia Nacional de la Historia传记明确称《Los aventureros》为Gallegos 1913年出版的第一本短篇小说集，并说明内含七篇故事。; 中文名仅作检索用工作译名，保留西班牙语原题作为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0797','collection','《叛乱及其他短篇》（暂译）','La rebelión y otros cuentos','candidate','1','WCD10-B21-W008','Biblioteca Virtual Miguel de Cervantes的书目记录将《La rebelión》标作该集所收篇目，并明确记录原始版本为1946年Caracas的Librería y Editorial del Maestro出版。; 中文名仅作检索用工作译名，保留西班牙语原题作为身份锚点；不声称存在正式中文译本。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0786','WCD10-B21-W001','WCD-10-B21','WCD10-B21-W001','V1-ENT-0790','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0787','WCD10-B21-W002','WCD-10-B21','WCD10-B21-W002','V1-ENT-0791','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0788','WCD10-B21-W003','WCD-10-B21','WCD10-B21-W003','V1-ENT-0792','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0789','WCD10-B21-W004','WCD-10-B21','WCD10-B21-W004','V1-ENT-0793','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0790','WCD10-B21-W005','WCD-10-B21','WCD10-B21-W005','V1-ENT-0794','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0791','WCD10-B21-W006','WCD-10-B21','WCD10-B21-W006','V1-ENT-0795','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0792','WCD10-B21-W007','WCD-10-B21','WCD10-B21-W007','V1-ENT-0796','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0793','WCD10-B21-W008','WCD-10-B21','WCD10-B21-W008','V1-ENT-0797','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0813','WCD-10-B21:V1-ENT-0790','V1-ENT-0790','work','《雷纳尔多·索拉尔》（暂译）','罗慕洛·加列戈斯','Reinaldo Solar','委内瑞拉','es','','小说','WCD-10-B21','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《雷纳尔多·索拉尔》（暂译）｜Reinaldo Solar

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- bibliographic_note：资料记载《El Último Solar》于1920年出版，之后经修改和删节后以《Reinaldo Solar》于1930年再版；本候选以修订再版题名作为作品身份，不把旧题名重复建成另一对象。
- one_sentence_summary：小说围绕家族衰落后的最后代表Reinaldo展开，他在恢复家族庄园、公共理想与个人生活之间不断摇摆，最终走向未定的政治冒险。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0814','WCD-10-B21:V1-ENT-0791','V1-ENT-0791','work','《攀援者》（暂译）','罗慕洛·加列戈斯','La Trepadora','委内瑞拉','es','1925','小说','WCD-10-B21','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《攀援者》（暂译）｜La Trepadora

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- first_publication_year：1925
- one_sentence_summary：小说以咖啡采收女子Modesta Guanipa之子Hilario及其女儿Victoria为中心，写家族继承、庄园权力与爱情关系交织的变化。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0815','WCD-10-B21:V1-ENT-0792','V1-ENT-0792','work','《穷黑人》（暂译）','罗慕洛·加列戈斯','Pobre Negro','委内瑞拉','es','1937','小说','WCD-10-B21','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《穷黑人》（暂译）｜Pobre Negro

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- first_publication_year：1937
- one_sentence_summary：小说以联邦战争前后的委内瑞拉为背景，描写内战、废奴之后的社会冲突及普通民众在动荡历史中的处境。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0816','WCD-10-B21:V1-ENT-0793','V1-ENT-0793','work','《异乡客》（暂译）','罗慕洛·加列戈斯','El Forastero','委内瑞拉','es','1942','小说','WCD-10-B21','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《异乡客》（暂译）｜El Forastero

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- first_publication_year：1942
- bibliographic_note：传记区分1921年写成而1980年才以“未刊小说”出版的早期稿本，与1942年刊行的重写版本；本候选只收1942年出版对象，不将两者误称为同一版本。
- one_sentence_summary：小说以受压迫的小镇和横行的暴君为背景；传记强调1942年重写本与早期稿在故事情节上明显不同。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0817','WCD-10-B21:V1-ENT-0794','V1-ENT-0794','work','《在同一片土地上》（暂译）','罗慕洛·加列戈斯','Sobre la misma tierra','委内瑞拉','es','','小说','WCD-10-B21','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《在同一片土地上》（暂译）｜Sobre la misma tierra

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- bibliographic_note：资料记载分歧：Fundación Empresas Polar列《Sobre la misma tierra》为1941年；Academia Nacional de la Historia传记以1943年为章节年份。现有来源在年份记载上不一致，暂不填写首版年；此处不据此断言存在不同版本。
- one_sentence_summary：小说以苏利亚州和委内瑞拉瓜希拉地区为背景，通过Remota Montiel及当地牧民的生活，呈现贫困、土地处境与石油开发带来的变化。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0818','WCD-10-B21:V1-ENT-0795','V1-ENT-0795','work','《风中的一根稻草》（暂译）','罗慕洛·加列戈斯','La brizna de paja en el viento','委内瑞拉','es','','小说','WCD-10-B21','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《风中的一根稻草》（暂译）｜La brizna de paja en el viento

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- bibliographic_note：CSUCA目录以《La brizna de paja en el viento》著录该题名，并列入Aguilar 1958年《Obras completas》第二卷；Academia传记以《Una brizna de paja en el viento》称该流亡时期小说。1958为汇编版出版年，不作为本作品首版年。
- one_sentence_summary：这部流亡时期创作的小说以古巴为题材，涉及大学生运动及马查多独裁政治遗留的问题。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0819','WCD-10-B21:V1-ENT-0796','V1-ENT-0796','collection','《冒险者们》（暂译）','罗慕洛·加列戈斯','Los aventureros','委内瑞拉','es','1913','短篇小说集','WCD-10-B21','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《冒险者们》（暂译）｜Los aventureros

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- first_publication_year：1913
- one_sentence_summary：这部早期短篇集收录七篇故事；同名篇章写律师Jacinto Ávila与山地首领Matías Rosalira策动起义的经历。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0820','WCD-10-B21:V1-ENT-0797','V1-ENT-0797','collection','《叛乱及其他短篇》（暂译）','罗慕洛·加列戈斯','La rebelión y otros cuentos','委内瑞拉','es','','短篇小说集','WCD-10-B21','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《叛乱及其他短篇》（暂译）｜La rebelión y otros cuentos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- bibliographic_note：Cervantes数字记录所据《La rebelión y otros cuentos》为Caracas Librería y Editorial del Maestro 1946年版；不将单篇《La rebelión》页面题名中的1922年认定为合集首版年。
- one_sentence_summary：这部短篇小说集收录《La rebelión》等篇；图书馆数字目录将同名篇目定位在该集的页7至40。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0821','WCD-10-B21:V1-ENT-0367','V1-ENT-0367','work','《堂娜·芭芭拉》','罗慕洛·加列戈斯','Doña Bárbara','委内瑞拉','es','','','WCD-10-B21','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《堂娜·芭芭拉》｜Doña Bárbara

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：小说把Santos Luzardo重返阿普雷平原、接手Altamira庄园的经历，与Doña Bárbara所代表的土地权力和暴力相对照，呈现人物在冲突中的改变。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0822','WCD-10-B21:V1-ENT-0368','V1-ENT-0368','work','《唱歌者》','罗慕洛·加列戈斯','Cantaclaro','委内瑞拉','es','','','WCD-10-B21','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《唱歌者》｜Cantaclaro

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：小说以委内瑞拉平原为背景，围绕歌者Florentino展开；传记将作品描述为富有歌唱性、诗性叙述和传奇氛围。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0823','WCD-10-B21:V1-ENT-0369','V1-ENT-0369','work','《卡奈玛》','罗慕洛·加列戈斯','Canaima','委内瑞拉','es','','','WCD-10-B21','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《卡奈玛》｜Canaima

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- one_sentence_summary：小说以圭亚那为背景，写冒险者Marcos Vargas遭遇的旅途、暴力冲突及其与当地人物的较量，并以壮阔景观构成叙事的重要部分。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-2662','WCD10-B21-W001-F01','V1-CARD-0813','V1-ENT-0790','genre_or_form','小说','bibliographic','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2663','WCD10-B21-W001-F02','V1-CARD-0813','V1-ENT-0790','bibliographic_note','资料记载《El Último Solar》于1920年出版，之后经修改和删节后以《Reinaldo Solar》于1930年再版；本候选以修订再版题名作为作品身份，不把旧题名重复建成另一对象。','bibliographic_note','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2664','WCD10-B21-W001-F03','V1-CARD-0813','V1-ENT-0790','one_sentence_summary','小说围绕家族衰落后的最后代表Reinaldo展开，他在恢复家族庄园、公共理想与个人生活之间不断摇摆，最终走向未定的政治冒险。','institutional_paraphrase','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2665','WCD10-B21-W002-F01','V1-CARD-0814','V1-ENT-0791','genre_or_form','小说','bibliographic','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2666','WCD10-B21-W002-F02','V1-CARD-0814','V1-ENT-0791','first_publication_year','1925','bibliographic','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2667','WCD10-B21-W002-F03','V1-CARD-0814','V1-ENT-0791','one_sentence_summary','小说以咖啡采收女子Modesta Guanipa之子Hilario及其女儿Victoria为中心，写家族继承、庄园权力与爱情关系交织的变化。','institutional_paraphrase','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2668','WCD10-B21-W003-F01','V1-CARD-0815','V1-ENT-0792','genre_or_form','小说','bibliographic','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2669','WCD10-B21-W003-F02','V1-CARD-0815','V1-ENT-0792','first_publication_year','1937','bibliographic','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2670','WCD10-B21-W003-F03','V1-CARD-0815','V1-ENT-0792','one_sentence_summary','小说以联邦战争前后的委内瑞拉为背景，描写内战、废奴之后的社会冲突及普通民众在动荡历史中的处境。','institutional_paraphrase','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2671','WCD10-B21-W004-F01','V1-CARD-0816','V1-ENT-0793','genre_or_form','小说','bibliographic','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2672','WCD10-B21-W004-F02','V1-CARD-0816','V1-ENT-0793','first_publication_year','1942','bibliographic','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2673','WCD10-B21-W004-F03','V1-CARD-0816','V1-ENT-0793','bibliographic_note','传记区分1921年写成而1980年才以“未刊小说”出版的早期稿本，与1942年刊行的重写版本；本候选只收1942年出版对象，不将两者误称为同一版本。','bibliographic_note','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2674','WCD10-B21-W004-F04','V1-CARD-0816','V1-ENT-0793','one_sentence_summary','小说以受压迫的小镇和横行的暴君为背景；传记强调1942年重写本与早期稿在故事情节上明显不同。','institutional_paraphrase','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2675','WCD10-B21-W005-F01','V1-CARD-0817','V1-ENT-0794','genre_or_form','小说','bibliographic','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2676','WCD10-B21-W005-F02','V1-CARD-0817','V1-ENT-0794','bibliographic_note','资料记载分歧：Fundación Empresas Polar列《Sobre la misma tierra》为1941年；Academia Nacional de la Historia传记以1943年为章节年份。现有来源在年份记载上不一致，暂不填写首版年；此处不据此断言存在不同版本。','bibliographic_note','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2677','WCD10-B21-W005-F03','V1-CARD-0817','V1-ENT-0794','one_sentence_summary','小说以苏利亚州和委内瑞拉瓜希拉地区为背景，通过Remota Montiel及当地牧民的生活，呈现贫困、土地处境与石油开发带来的变化。','institutional_paraphrase','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2678','WCD10-B21-W006-F01','V1-CARD-0818','V1-ENT-0795','genre_or_form','小说','bibliographic','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2679','WCD10-B21-W006-F02','V1-CARD-0818','V1-ENT-0795','bibliographic_note','CSUCA目录以《La brizna de paja en el viento》著录该题名，并列入Aguilar 1958年《Obras completas》第二卷；Academia传记以《Una brizna de paja en el viento》称该流亡时期小说。1958为汇编版出版年，不作为本作品首版年。','bibliographic_note','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2680','WCD10-B21-W006-F03','V1-CARD-0818','V1-ENT-0795','one_sentence_summary','这部流亡时期创作的小说以古巴为题材，涉及大学生运动及马查多独裁政治遗留的问题。','institutional_paraphrase','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2681','WCD10-B21-W007-F01','V1-CARD-0819','V1-ENT-0796','genre_or_form','短篇小说集','bibliographic','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2682','WCD10-B21-W007-F02','V1-CARD-0819','V1-ENT-0796','first_publication_year','1913','bibliographic','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2683','WCD10-B21-W007-F03','V1-CARD-0819','V1-ENT-0796','one_sentence_summary','这部早期短篇集收录七篇故事；同名篇章写律师Jacinto Ávila与山地首领Matías Rosalira策动起义的经历。','institutional_paraphrase','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2684','WCD10-B21-W008-F01','V1-CARD-0820','V1-ENT-0797','genre_or_form','短篇小说集','bibliographic','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2685','WCD10-B21-W008-F02','V1-CARD-0820','V1-ENT-0797','bibliographic_note','Cervantes数字记录所据《La rebelión y otros cuentos》为Caracas Librería y Editorial del Maestro 1946年版；不将单篇《La rebelión》页面题名中的1922年认定为合集首版年。','bibliographic_note','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2686','WCD10-B21-W008-F03','V1-CARD-0820','V1-ENT-0797','one_sentence_summary','这部短篇小说集收录《La rebelión》等篇；图书馆数字目录将同名篇目定位在该集的页7至40。','institutional_paraphrase','WCD-10-B21','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2687','WCD10-B21-F001','V1-CARD-0821','V1-ENT-0367','one_sentence_summary','小说把Santos Luzardo重返阿普雷平原、接手Altamira庄园的经历，与Doña Bárbara所代表的土地权力和暴力相对照，呈现人物在冲突中的改变。','institutional_paraphrase','WCD-10-B21','high','batch_retained_candidate','仅补充Academia Nacional de la Historia传记直接叙述的人物、地点与情节线索；保留原有1929年、小说体裁及CREATED记录和来源闭包，不增加主题解释关系。'),
('V1-FCT-2688','WCD10-B21-F002','V1-CARD-0822','V1-ENT-0368','one_sentence_summary','小说以委内瑞拉平原为背景，围绕歌者Florentino展开；传记将作品描述为富有歌唱性、诗性叙述和传奇氛围。','institutional_paraphrase','WCD-10-B21','high','batch_retained_candidate','仅补充Academia Nacional de la Historia传记对该作品人物与叙述气质的说明；保留既有作品年份、体裁和全部关系来源。'),
('V1-FCT-2689','WCD10-B21-F003','V1-CARD-0823','V1-ENT-0369','one_sentence_summary','小说以圭亚那为背景，写冒险者Marcos Vargas遭遇的旅途、暴力冲突及其与当地人物的较量，并以壮阔景观构成叙事的重要部分。','institutional_paraphrase','WCD-10-B21','high','batch_retained_candidate','仅补充Academia Nacional de la Historia传记直接讨论的Marcos Vargas、圭亚那景观与情节内容；保留既有1935年、小说体裁和CREATED记录及其原始来源。');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-2662','SRC-0275','Gallegos, Rómulo'),
('V1-FCT-2662','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2663','SRC-0275','Gallegos, Rómulo'),
('V1-FCT-2663','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2664','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2665','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2666','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2667','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2668','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2668','SRC-0795','Obras completas /'),
('V1-FCT-2669','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2670','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2671','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2671','SRC-0795','Obras completas /'),
('V1-FCT-2672','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2673','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2674','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2675','SRC-0275','Gallegos, Rómulo'),
('V1-FCT-2675','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2675','SRC-0795','Obras completas /'),
('V1-FCT-2676','SRC-0275','Gallegos, Rómulo'),
('V1-FCT-2676','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2677','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2678','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2678','SRC-0795','Obras completas /'),
('V1-FCT-2679','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2679','SRC-0795','Obras completas /'),
('V1-FCT-2680','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2681','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2682','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2683','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2684','SRC-0796','La rebelión (1922) / Rómulo Gallegos'),
('V1-FCT-2685','SRC-0796','La rebelión (1922) / Rómulo Gallegos'),
('V1-FCT-2686','SRC-0796','La rebelión (1922) / Rómulo Gallegos'),
('V1-FCT-2687','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2688','SRC-0794','Rómulo Gallegos'),
('V1-FCT-2689','SRC-0794','Rómulo Gallegos');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0813','V1-FCT-2662','batch_retained_candidate'),
('V1-CARD-0813','V1-FCT-2663','batch_retained_candidate'),
('V1-CARD-0813','V1-FCT-2664','batch_retained_candidate'),
('V1-CARD-0814','V1-FCT-2665','batch_retained_candidate'),
('V1-CARD-0814','V1-FCT-2666','batch_retained_candidate'),
('V1-CARD-0814','V1-FCT-2667','batch_retained_candidate'),
('V1-CARD-0815','V1-FCT-2668','batch_retained_candidate'),
('V1-CARD-0815','V1-FCT-2669','batch_retained_candidate'),
('V1-CARD-0815','V1-FCT-2670','batch_retained_candidate'),
('V1-CARD-0816','V1-FCT-2671','batch_retained_candidate'),
('V1-CARD-0816','V1-FCT-2672','batch_retained_candidate'),
('V1-CARD-0816','V1-FCT-2673','batch_retained_candidate'),
('V1-CARD-0816','V1-FCT-2674','batch_retained_candidate'),
('V1-CARD-0817','V1-FCT-2675','batch_retained_candidate'),
('V1-CARD-0817','V1-FCT-2676','batch_retained_candidate'),
('V1-CARD-0817','V1-FCT-2677','batch_retained_candidate'),
('V1-CARD-0818','V1-FCT-2678','batch_retained_candidate'),
('V1-CARD-0818','V1-FCT-2679','batch_retained_candidate'),
('V1-CARD-0818','V1-FCT-2680','batch_retained_candidate'),
('V1-CARD-0819','V1-FCT-2681','batch_retained_candidate'),
('V1-CARD-0819','V1-FCT-2682','batch_retained_candidate'),
('V1-CARD-0819','V1-FCT-2683','batch_retained_candidate'),
('V1-CARD-0820','V1-FCT-2684','batch_retained_candidate'),
('V1-CARD-0820','V1-FCT-2685','batch_retained_candidate'),
('V1-CARD-0820','V1-FCT-2686','batch_retained_candidate'),
('V1-CARD-0821','V1-FCT-2687','batch_retained_candidate'),
('V1-CARD-0822','V1-FCT-2688','batch_retained_candidate'),
('V1-CARD-0823','V1-FCT-2689','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-1587','WCD10-B21-S001','V1-CARD-0813','SRC-0275','B','bibliography_or_bounded_description','yes','no','SRC-0275','accepted','NONE'),
('V1-CS-1588','WCD10-B21-S002','V1-CARD-0813','SRC-0794','B','bibliography_or_bounded_description','yes','no','SRC-0794','accepted','NONE'),
('V1-CS-1589','WCD10-B21-S002','V1-CARD-0814','SRC-0794','B','bibliography_or_bounded_description','yes','no','SRC-0794','accepted','NONE'),
('V1-CS-1590','WCD10-B21-S002','V1-CARD-0815','SRC-0794','B','bibliography_or_bounded_description','yes','no','SRC-0794','accepted','NONE'),
('V1-CS-1591','WCD10-B21-S003','V1-CARD-0815','SRC-0795','B','bibliography_or_bounded_description','yes','no','SRC-0795','accepted','NONE'),
('V1-CS-1592','WCD10-B21-S002','V1-CARD-0816','SRC-0794','B','bibliography_or_bounded_description','yes','no','SRC-0794','accepted','NONE'),
('V1-CS-1593','WCD10-B21-S003','V1-CARD-0816','SRC-0795','B','bibliography_or_bounded_description','yes','no','SRC-0795','accepted','NONE'),
('V1-CS-1594','WCD10-B21-S001','V1-CARD-0817','SRC-0275','B','bibliography_or_bounded_description','yes','no','SRC-0275','accepted','NONE'),
('V1-CS-1595','WCD10-B21-S002','V1-CARD-0817','SRC-0794','B','bibliography_or_bounded_description','yes','no','SRC-0794','accepted','NONE'),
('V1-CS-1596','WCD10-B21-S003','V1-CARD-0817','SRC-0795','B','bibliography_or_bounded_description','yes','no','SRC-0795','accepted','NONE'),
('V1-CS-1597','WCD10-B21-S002','V1-CARD-0818','SRC-0794','B','bibliography_or_bounded_description','yes','no','SRC-0794','accepted','NONE'),
('V1-CS-1598','WCD10-B21-S003','V1-CARD-0818','SRC-0795','B','bibliography_or_bounded_description','yes','no','SRC-0795','accepted','NONE'),
('V1-CS-1599','WCD10-B21-S002','V1-CARD-0819','SRC-0794','B','bibliography_or_bounded_description','yes','no','SRC-0794','accepted','NONE'),
('V1-CS-1600','WCD10-B21-S004','V1-CARD-0820','SRC-0796','B','bibliography_or_bounded_description','yes','no','SRC-0796','accepted','NONE'),
('V1-CS-1601','WCD10-B21-S002','V1-CARD-0821','SRC-0794','B','bibliography_or_bounded_description','no','no','SRC-0794','accepted','NONE'),
('V1-CS-1602','WCD10-B21-S002','V1-CARD-0822','SRC-0794','B','bibliography_or_bounded_description','no','no','SRC-0794','accepted','NONE'),
('V1-CS-1603','WCD10-B21-S002','V1-CARD-0823','SRC-0794','B','bibliography_or_bounded_description','no','no','SRC-0794','accepted','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0763','WCD-10-B21','WCD10-B21-W001-CREATED','V1-ENT-0360','CREATED','V1-ENT-0790','罗慕洛·加列戈斯创作 Reinaldo Solar','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0764','WCD-10-B21','WCD10-B21-W002-CREATED','V1-ENT-0360','CREATED','V1-ENT-0791','罗慕洛·加列戈斯创作 La Trepadora','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0765','WCD-10-B21','WCD10-B21-W003-CREATED','V1-ENT-0360','CREATED','V1-ENT-0792','罗慕洛·加列戈斯创作 Pobre Negro','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0766','WCD-10-B21','WCD10-B21-W004-CREATED','V1-ENT-0360','CREATED','V1-ENT-0793','罗慕洛·加列戈斯创作 El Forastero','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0767','WCD-10-B21','WCD10-B21-W005-CREATED','V1-ENT-0360','CREATED','V1-ENT-0794','罗慕洛·加列戈斯创作 Sobre la misma tierra','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0768','WCD-10-B21','WCD10-B21-W006-CREATED','V1-ENT-0360','CREATED','V1-ENT-0795','罗慕洛·加列戈斯创作 La brizna de paja en el viento','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0769','WCD-10-B21','WCD10-B21-W007-CREATED','V1-ENT-0360','CREATED','V1-ENT-0796','罗慕洛·加列戈斯创作 Los aventureros','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0770','WCD-10-B21','WCD10-B21-W008-CREATED','V1-ENT-0360','CREATED','V1-ENT-0797','罗慕洛·加列戈斯创作 La rebelión y otros cuentos','high','accepted','Codex-parent-independent-review:PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0763','SRC-0275'),
('V1-REL-0763','SRC-0794'),
('V1-REL-0764','SRC-0794'),
('V1-REL-0765','SRC-0794'),
('V1-REL-0765','SRC-0795'),
('V1-REL-0766','SRC-0794'),
('V1-REL-0766','SRC-0795'),
('V1-REL-0767','SRC-0275'),
('V1-REL-0767','SRC-0794'),
('V1-REL-0767','SRC-0795'),
('V1-REL-0768','SRC-0794'),
('V1-REL-0768','SRC-0795'),
('V1-REL-0769','SRC-0794'),
('V1-REL-0770','SRC-0796');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-1141','V1-REL-0763','WCD10-B21-S001','SRC-0275','Gallegos, Rómulo','实读2026-10-15，条目第23–27行：第23行说明《El Último Solar》于1920年出版、修改删节后以《Reinaldo Solar》于1930年再版；第26行记《Pobre negro》(1937)；第27行记《Sobre la misma tierra》(1941)；第45–47行列直接书目。URL与基线SRC-0275完全一致，复用原行。','罗慕洛·加列戈斯创作 Reinaldo Solar','high','eligible_evidence','WCD-10-B21'),
('V1-EV-1142','V1-REL-0763','WCD10-B21-S002','SRC-0794','Rómulo Gallegos','实读2026-10-15，PDF《Biblioteca Biográfica Venezolana》印刷页53–56、66–72、74–77、91–95、102–104、115–121及140：列《Los aventureros》(1913)及作品简介、《El Último Solar》(1920)及后续《Reinaldo Solar》脉络、《La Trepadora》(1925)、《Doña Bárbara》(1929)、《Cantaclaro》(1934)、《Canaima》(1935)、《Pobre Negro》(1937)、《El Forastero》(1942)、《Sobre la misma tierra》(章节标1943)；第140页说明流亡时期两部小说的题材。','罗慕洛·加列戈斯创作 Reinaldo Solar','high','eligible_evidence','WCD-10-B21'),
('V1-EV-1143','V1-REL-0764','WCD10-B21-S002','SRC-0794','Rómulo Gallegos','实读2026-10-15，PDF《Biblioteca Biográfica Venezolana》印刷页53–56、66–72、74–77、91–95、102–104、115–121及140：列《Los aventureros》(1913)及作品简介、《El Último Solar》(1920)及后续《Reinaldo Solar》脉络、《La Trepadora》(1925)、《Doña Bárbara》(1929)、《Cantaclaro》(1934)、《Canaima》(1935)、《Pobre Negro》(1937)、《El Forastero》(1942)、《Sobre la misma tierra》(章节标1943)；第140页说明流亡时期两部小说的题材。','罗慕洛·加列戈斯创作 La Trepadora','high','eligible_evidence','WCD-10-B21'),
('V1-EV-1144','V1-REL-0765','WCD10-B21-S002','SRC-0794','Rómulo Gallegos','实读2026-10-15，PDF《Biblioteca Biográfica Venezolana》印刷页53–56、66–72、74–77、91–95、102–104、115–121及140：列《Los aventureros》(1913)及作品简介、《El Último Solar》(1920)及后续《Reinaldo Solar》脉络、《La Trepadora》(1925)、《Doña Bárbara》(1929)、《Cantaclaro》(1934)、《Canaima》(1935)、《Pobre Negro》(1937)、《El Forastero》(1942)、《Sobre la misma tierra》(章节标1943)；第140页说明流亡时期两部小说的题材。','罗慕洛·加列戈斯创作 Pobre Negro','high','eligible_evidence','WCD-10-B21'),
('V1-EV-1145','V1-REL-0765','WCD10-B21-S003','SRC-0795','Obras completas /','实读2026-10-15，目录页第26–45行：记录主作者Rómulo Gallegos、Aguilar 1958西班牙语版；第44–45行列两卷目录，包含《Reinaldo Solar》《La trepadora》《Pobre negro》《El forastero》《Sobre la misma tierra》《La brizna de paja en el viento》等。','罗慕洛·加列戈斯创作 Pobre Negro','high','eligible_evidence','WCD-10-B21'),
('V1-EV-1146','V1-REL-0766','WCD10-B21-S002','SRC-0794','Rómulo Gallegos','实读2026-10-15，PDF《Biblioteca Biográfica Venezolana》印刷页53–56、66–72、74–77、91–95、102–104、115–121及140：列《Los aventureros》(1913)及作品简介、《El Último Solar》(1920)及后续《Reinaldo Solar》脉络、《La Trepadora》(1925)、《Doña Bárbara》(1929)、《Cantaclaro》(1934)、《Canaima》(1935)、《Pobre Negro》(1937)、《El Forastero》(1942)、《Sobre la misma tierra》(章节标1943)；第140页说明流亡时期两部小说的题材。','罗慕洛·加列戈斯创作 El Forastero','high','eligible_evidence','WCD-10-B21'),
('V1-EV-1147','V1-REL-0766','WCD10-B21-S003','SRC-0795','Obras completas /','实读2026-10-15，目录页第26–45行：记录主作者Rómulo Gallegos、Aguilar 1958西班牙语版；第44–45行列两卷目录，包含《Reinaldo Solar》《La trepadora》《Pobre negro》《El forastero》《Sobre la misma tierra》《La brizna de paja en el viento》等。','罗慕洛·加列戈斯创作 El Forastero','high','eligible_evidence','WCD-10-B21'),
('V1-EV-1148','V1-REL-0767','WCD10-B21-S001','SRC-0275','Gallegos, Rómulo','实读2026-10-15，条目第23–27行：第23行说明《El Último Solar》于1920年出版、修改删节后以《Reinaldo Solar》于1930年再版；第26行记《Pobre negro》(1937)；第27行记《Sobre la misma tierra》(1941)；第45–47行列直接书目。URL与基线SRC-0275完全一致，复用原行。','罗慕洛·加列戈斯创作 Sobre la misma tierra','high','eligible_evidence','WCD-10-B21'),
('V1-EV-1149','V1-REL-0767','WCD10-B21-S002','SRC-0794','Rómulo Gallegos','实读2026-10-15，PDF《Biblioteca Biográfica Venezolana》印刷页53–56、66–72、74–77、91–95、102–104、115–121及140：列《Los aventureros》(1913)及作品简介、《El Último Solar》(1920)及后续《Reinaldo Solar》脉络、《La Trepadora》(1925)、《Doña Bárbara》(1929)、《Cantaclaro》(1934)、《Canaima》(1935)、《Pobre Negro》(1937)、《El Forastero》(1942)、《Sobre la misma tierra》(章节标1943)；第140页说明流亡时期两部小说的题材。','罗慕洛·加列戈斯创作 Sobre la misma tierra','high','eligible_evidence','WCD-10-B21'),
('V1-EV-1150','V1-REL-0767','WCD10-B21-S003','SRC-0795','Obras completas /','实读2026-10-15，目录页第26–45行：记录主作者Rómulo Gallegos、Aguilar 1958西班牙语版；第44–45行列两卷目录，包含《Reinaldo Solar》《La trepadora》《Pobre negro》《El forastero》《Sobre la misma tierra》《La brizna de paja en el viento》等。','罗慕洛·加列戈斯创作 Sobre la misma tierra','high','eligible_evidence','WCD-10-B21'),
('V1-EV-1151','V1-REL-0768','WCD10-B21-S002','SRC-0794','Rómulo Gallegos','实读2026-10-15，PDF《Biblioteca Biográfica Venezolana》印刷页53–56、66–72、74–77、91–95、102–104、115–121及140：列《Los aventureros》(1913)及作品简介、《El Último Solar》(1920)及后续《Reinaldo Solar》脉络、《La Trepadora》(1925)、《Doña Bárbara》(1929)、《Cantaclaro》(1934)、《Canaima》(1935)、《Pobre Negro》(1937)、《El Forastero》(1942)、《Sobre la misma tierra》(章节标1943)；第140页说明流亡时期两部小说的题材。','罗慕洛·加列戈斯创作 La brizna de paja en el viento','high','eligible_evidence','WCD-10-B21'),
('V1-EV-1152','V1-REL-0768','WCD10-B21-S003','SRC-0795','Obras completas /','实读2026-10-15，目录页第26–45行：记录主作者Rómulo Gallegos、Aguilar 1958西班牙语版；第44–45行列两卷目录，包含《Reinaldo Solar》《La trepadora》《Pobre negro》《El forastero》《Sobre la misma tierra》《La brizna de paja en el viento》等。','罗慕洛·加列戈斯创作 La brizna de paja en el viento','high','eligible_evidence','WCD-10-B21'),
('V1-EV-1153','V1-REL-0769','WCD10-B21-S002','SRC-0794','Rómulo Gallegos','实读2026-10-15，PDF《Biblioteca Biográfica Venezolana》印刷页53–56、66–72、74–77、91–95、102–104、115–121及140：列《Los aventureros》(1913)及作品简介、《El Último Solar》(1920)及后续《Reinaldo Solar》脉络、《La Trepadora》(1925)、《Doña Bárbara》(1929)、《Cantaclaro》(1934)、《Canaima》(1935)、《Pobre Negro》(1937)、《El Forastero》(1942)、《Sobre la misma tierra》(章节标1943)；第140页说明流亡时期两部小说的题材。','罗慕洛·加列戈斯创作 Los aventureros','high','eligible_evidence','WCD-10-B21'),
('V1-EV-1154','V1-REL-0770','WCD10-B21-S004','SRC-0796','La rebelión (1922) / Rómulo Gallegos','实读2026-10-15，第51–58行记作品作者、数字化目录信息、原始出版物《La rebelión y otros cuentos》(Caracas, Librería y Editorial del Maestro, 1946)及短篇叙事主题分类；第54–55行将《La rebelión》定位为该集页7–40。','罗慕洛·加列戈斯创作 La rebelión y otros cuentos','high','eligible_evidence','WCD-10-B21');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0679','WCD-10-B21-G01','research_gap','V1-ENT-0360.full_oeuvre','open','本轮围绕现有三部关联小说补充主要缺作、两部短篇集及有来源支持的简介；未穷尽Gallegos全部小说、短篇、戏剧、报刊作品与版本，研究范围仍开放。','','Independent Reviewer: preserve preserve_as_research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0680','WCD-10-B21:V1-ENT-0367','research_gap','WCD10:work_level_research:V1-ENT-0367','open','原有实体、事实、卡片与关系来源闭包仅按冻结基线保全；新摘要候选待独立审核。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0681','WCD-10-B21:V1-ENT-0368','research_gap','WCD10:work_level_research:V1-ENT-0368','open','原有实体、事实、卡片与关系来源闭包仅按冻结基线保全；新摘要候选待独立审核。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0682','WCD-10-B21:V1-ENT-0369','research_gap','WCD10:work_level_research:V1-ENT-0369','open','原有实体、事实、卡片与关系来源闭包仅按冻结基线保全；新摘要候选待独立审核。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0683','WCD-10-B21:WCD10-B21-W001','research_gap','WCD10:work_level_research:V1-ENT-0790','open','依据机构传记及馆藏目录形成有界书目与简介；未声称全集、版本穷尽或学术完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0684','WCD-10-B21:WCD10-B21-W002','research_gap','WCD10:work_level_research:V1-ENT-0791','open','依据机构传记及馆藏目录形成有界书目与简介；未声称全集、版本穷尽或学术完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0685','WCD-10-B21:WCD10-B21-W003','research_gap','WCD10:work_level_research:V1-ENT-0792','open','依据机构传记及馆藏目录形成有界书目与简介；未声称全集、版本穷尽或学术完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0686','WCD-10-B21:WCD10-B21-W004','research_gap','WCD10:work_level_research:V1-ENT-0793','open','依据机构传记及馆藏目录形成有界书目与简介；未声称全集、版本穷尽或学术完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0687','WCD-10-B21:WCD10-B21-W005','research_gap','WCD10:work_level_research:V1-ENT-0794','open','依据机构传记及馆藏目录形成有界书目与简介；未声称全集、版本穷尽或学术完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0688','WCD-10-B21:WCD10-B21-W006','research_gap','WCD10:work_level_research:V1-ENT-0795','open','依据机构传记及馆藏目录形成有界书目与简介；未声称全集、版本穷尽或学术完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0689','WCD-10-B21:WCD10-B21-W007','research_gap','WCD10:work_level_research:V1-ENT-0796','open','依据机构传记及馆藏目录形成有界书目与简介；未声称全集、版本穷尽或学术完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0690','WCD-10-B21:WCD10-B21-W008','research_gap','WCD10:work_level_research:V1-ENT-0797','open','依据机构传记及馆藏目录形成有界书目与简介；未声称全集、版本穷尽或学术完备。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');

UPDATE metadata SET value='WCD-10-B21' WHERE key='last_change_set';

UPDATE metadata SET value='2026-10-15' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 794 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 795 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 793 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 823 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2683 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 3320 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2662 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1595 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 768 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 1193 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 1164 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 690 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
