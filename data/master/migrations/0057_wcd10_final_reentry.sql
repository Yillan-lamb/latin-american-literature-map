-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: Codex-parent-independent-review

-- Registration sha256: cb6cf05e75336d8c64cb1cb769cb55f89737124d7f78f88a9687291b40256355

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2662 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1595 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 823 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 795 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 793 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 3320 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2683 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 690 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 56 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 1164 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 1193 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 768 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 794 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B21' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0797' OR canonical_url='https://www.elem.mx/obra/datos/8815') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0798' OR (entity_type='work' AND original_name='El mono gramático')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2690' OR (subject_id='V1-ENT-0798' AND fact_field='genre_or_form' AND value_text='跨文类散文诗（游记·随笔·散文诗）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2691' OR (subject_id='V1-ENT-0798' AND fact_field='one_sentence_summary' AND value_text='据ELEM作品页文章，本书横跨多种文类：既是前往印度加尔塔的旅行记述，也是关于创作过程与旅程的随笔，又是一首探索内在与视像的散文诗；印度加尔塔的小路与剑桥的花园两个场景在其中交汇。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-2692' OR (subject_id='V1-ENT-0798' AND fact_field='bibliographic_note' AND value_text='ELEM记载法语译本 Le singe grammairien（Claude Esteban译，Skira《Les Sentiers de la Création》丛书）于1972年先行出版；西班牙语原文版由Seix Barral于1974年出版。此处分别记录已证版本，不选择 first_publication_year 原子值。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0771' OR (subject_id='V1-ENT-0059' AND relation_type='CREATED' AND object_id='V1-ENT-0798')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0797','WCD10-B05-S18','El mono gramático - Detalle de la obra','El mono gramático - Detalle de la obra','Enciclopedia de la Literatura en México / FLM (artículo ELEM)','','Fundación de las Letras Mexicanas / elem.mx','','','encyclopedia_work_article','','es','B','access_pass','WCD-10-B05','Research候选，独立审核和Curation准入前不得公开。','remote_only；未下载或保存来源资产。','','https://www.elem.mx/obra/datos/8815');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0798','work','《语法家猴子》（暂译）','El mono gramático','candidate','1','WCD10-B05-W027','ELEM作品条目支持独立作品对象、跨文类内容和作者归属；保留原B05临时候选WCD10-B05-W03及原四条证据记录。按DEC-070不选择争议字段原子首发年，仅以书目注记记载1972法译本与1974西语原文版。; 中文显示名为暂译，未核实正式中文译本；保留西班牙语原题作为身份锚点。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0794','WCD10-B05-W027','WCD-10-B05','WCD10-B05-W027','V1-ENT-0798','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0824','WCD-10-B05:V1-ENT-0798','V1-ENT-0798','work','《语法家猴子》（暂译）','奥克塔维奥·帕斯','El mono gramático','墨西哥','es','','跨文类散文诗（游记·随笔·散文诗）','WCD-10-B05','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《语法家猴子》（暂译）｜El mono gramático

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：跨文类散文诗（游记·随笔·散文诗）
- one_sentence_summary：据ELEM作品页文章，本书横跨多种文类：既是前往印度加尔塔的旅行记述，也是关于创作过程与旅程的随笔，又是一首探索内在与视像的散文诗；印度加尔塔的小路与剑桥的花园两个场景在其中交汇。
- bibliographic_note：ELEM记载法语译本 Le singe grammairien（Claude Esteban译，Skira《Les Sentiers de la Création》丛书）于1972年先行出版；西班牙语原文版由Seix Barral于1974年出版。此处分别记录已证版本，不选择 first_publication_year 原子值。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-2690','WCD10-B05-W027-F01','V1-CARD-0824','V1-ENT-0798','genre_or_form','跨文类散文诗（游记·随笔·散文诗）','bibliographic','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2691','WCD10-B05-W027-F02','V1-CARD-0824','V1-ENT-0798','one_sentence_summary','据ELEM作品页文章，本书横跨多种文类：既是前往印度加尔塔的旅行记述，也是关于创作过程与旅程的随笔，又是一首探索内在与视像的散文诗；印度加尔塔的小路与剑桥的花园两个场景在其中交汇。','institutional_paraphrase','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-2692','WCD10-B05-W027-F03','V1-CARD-0824','V1-ENT-0798','bibliographic_note','ELEM记载法语译本 Le singe grammairien（Claude Esteban译，Skira《Les Sentiers de la Création》丛书）于1972年先行出版；西班牙语原文版由Seix Barral于1974年出版。此处分别记录已证版本，不选择 first_publication_year 原子值。','bibliographic_note','WCD-10-B05','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-2690','SRC-0797','El mono gramático - Detalle de la obra'),
('V1-FCT-2691','SRC-0797','El mono gramático - Detalle de la obra'),
('V1-FCT-2692','SRC-0797','El mono gramático - Detalle de la obra');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0824','V1-FCT-2690','batch_retained_candidate'),
('V1-CARD-0824','V1-FCT-2691','batch_retained_candidate'),
('V1-CARD-0824','V1-FCT-2692','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-1604','WCD10-B05-S18','V1-CARD-0824','SRC-0797','B','bibliography_or_bounded_description','yes','no','SRC-0797','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0771','WCD-10-B05','WCD10-B05-W027-CREATED','V1-ENT-0059','CREATED','V1-ENT-0798','奥克塔维奥·帕斯创作 El mono gramático','high','accepted','Codex-parent-independent-review:PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0771','SRC-0797');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-1155','V1-REL-0771','WCD10-B05-S18','SRC-0797','El mono gramático - Detalle de la obra','结构化字段：PRIMERA EDICIÓN=Barcelona, Seix Barral, 1974；Género=Poesía-Libros individuales；Lengua=原文西班牙语；OTRAS EDICIONES 1996/1999/2014/2016。正文全读：''Le singe grammairien…aparece por vez primera en 1972, traducido al francés por Claude Esteban para la colección Les Sentiers de la Création''；''participa de varios géneros…relato de un viaje a Galta…un ensayo…y un poema en prosa''；''Dos escenarios convergentes —el camino de Galta, en la India, y un jardín de Cambridge—''','奥克塔维奥·帕斯创作 El mono gramático','high','eligible_evidence','WCD-10-B05');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0691','WCD-10-B05:WCD10-B05-W027','research_gap','WCD10:work_level_research:V1-ENT-0798','open','仅一项直接机构来源；保留V1-GAP-0123记录的字段语义未决状态，原子首发年不选值。1972法译与1974西语原文版均在bibliographic_note说明；来源页本轮重开超时，依据历史2026-10-07阅读记录。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');

-- Parent-approved controlled append only: Amado is one of ten chapter authors; no chapter or exclusive authorship inferred.
INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0772','WCD-10-FINAL_REENTRY','WCD10-FINAL-REENTRY-AMADO0172-0591','V1-ENT-0172','CREATED','V1-ENT-0591','若热·亚马多是《O mistério dos MMM》十位章节作者之一；本关系不推断其具体章节或独著身份。','high','accepted','Codex-parent-independent-review:PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0772','SRC-0652');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-1156','V1-REL-0772','WCD10-FINAL-REENTRY-AMADO0172-0591','SRC-0652','A escrita em conjunto na literatura policial brasileira: um olhar sobre os arquivos de João Condé','PDF page 4 / printed p. 557 / lines 134–156','若热·亚马多是《O mistério dos MMM》十位章节作者之一；本关系不推断其具体章节或独著身份。','high','eligible_evidence','WCD-10-FINAL_REENTRY');

UPDATE metadata SET value='WCD-10-B05' WHERE key='last_change_set';

UPDATE metadata SET value='2026-10-15' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 795 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 796 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 794 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 824 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 2686 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 3323 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 2665 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1596 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 770 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 1195 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 1166 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 691 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
