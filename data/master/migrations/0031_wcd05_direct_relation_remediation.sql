-- WCD-05 CS01: direct SET_IN remediation and preserved hold rejection history.

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0291','WCD05-SRC-09','Realismo decimonónico y novela sentimental como modos narrativos en El amor en los tiempos del cólera de Gabriel García Márquez','','Nini Johana Rivera Pulido','','Universidad Nacional de Colombia','2018','','masters_thesis','','es','A','access_pass','WCD-05','SET_IN Colombia: ch.2 §2 pp.50–51; contrary movement analysis: ch.1 §3 p.28, ch.2 pp.41–42, conclusions p.91','remote_only','','https://bffrepositorio.unal.edu.co/server/api/core/bitstreams/69020378-2940-4ae3-affd-d13b58363ebf/content'),
('SRC-0292','WCD05-SRC-10','La casa verde','','Instituto Nacional para Ciegos de Colombia','','INCI Biblioteca Virtual','2004','','institutional_library_record','','es','B','access_pass','WCD-05','Direct setting statement for Piura and Santa María de Nieva in the Amazon','remote_only','','https://biblioteca.inci.gov.co/handle/inci/20947');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0309','WCD-05','WCD05-CS01-01','V1-ENT-0158','SET_IN','V1-ENT-0095','《霍乱时期的爱情》的主要故事空间位于哥伦比亚加勒比地区','high','accepted','CODEX-REVIEW-WCD05-PASS','2','NONE'),
('V1-REL-0310','WCD-05','WCD05-CS01-02','V1-ENT-0160','SET_IN','V1-ENT-0124','《绿房子》的两组主要场景位于秘鲁的皮乌拉与亚马孙地区','high','accepted','CODEX-REVIEW-WCD05-PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0309','SRC-0064'),('V1-REL-0309','SRC-0291'),('V1-REL-0310','SRC-0292');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0335','V1-REL-0309','V1-HOLD-0044/SRC-0064','SRC-0064','','CVC prose page','Institutional essay links the novel specifically to Colombia and its Caribbean; used as auxiliary independent support.','medium','eligible_evidence','WCD05-CS01'),
('V1-EV-0336','V1-REL-0309','WCD05-SRC-09','SRC-0291','','Chapter 2 §2, printed/PDF pp. 50–51','The thesis directly identifies the unnamed composite city through cities and towns on Colombia’s Caribbean coast.','high','eligible_evidence','WCD05-CS01'),
('V1-EV-0337','V1-REL-0310','WCD05-SRC-10','SRC-0292','','Institutional record, Resumen','The catalogue record directly states that the novel occurs in Piura and Santa María de Nieva in the Amazon.','high','eligible_evidence','WCD05-CS01');

UPDATE relationship_evidence SET source_title=(SELECT title FROM sources WHERE sources.source_id=relationship_evidence.source_id) WHERE evidence_id BETWEEN 'V1-EV-0335' AND 'V1-EV-0337';

INSERT INTO relation_hold_evidence (evidence_id,relation_hold_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status) VALUES
('V1-HEV-0045','V1-HOLD-0044','WCD05-SRC-09','SRC-0291','','Chapter 2 §2, printed/PDF pp. 50–51','Direct release evidence: the principal spatial setting is on Colombia’s Caribbean coast.','high','release_evidence'),
('V1-HEV-0046','V1-HOLD-0044','V1-HOLD-0044/SRC-0064','SRC-0064','','CVC prose page','Auxiliary independent support linking the novel to Colombia and its Caribbean.','medium','release_evidence'),
('V1-HEV-0047','V1-HOLD-0045','WCD05-SRC-10','SRC-0292','','Institutional record, Resumen','Direct release evidence for Piura and the Peruvian Amazon settings.','high','release_evidence'),
('V1-HEV-0048','V1-HOLD-0046','WCD05-SRC-09','SRC-0291','','Chapter 1 §3 p. 28; Chapter 2 pp. 41–42; Conclusions p. 91','Contrary scholarship calls magical-realism classification fruitless and describes the novel’s return toward nineteenth-century realism.','high','contrary_evidence');

UPDATE relation_hold_evidence SET source_title=(SELECT title FROM sources WHERE sources.source_id=relation_hold_evidence.source_id) WHERE evidence_id BETWEEN 'V1-HEV-0045' AND 'V1-HEV-0048';

UPDATE relation_holds SET review_status='resolved_to_relationship',evidence_count='2',issue_code='RESOLVED_TO_V1-REL-0309|CODEX-REVIEW-WCD05-PASS' WHERE relation_hold_id='V1-HOLD-0044';
UPDATE relation_holds SET review_status='resolved_to_relationship',evidence_count='1',issue_code='RESOLVED_TO_V1-REL-0310|CODEX-REVIEW-WCD05-PASS' WHERE relation_hold_id='V1-HOLD-0045';
UPDATE relation_holds SET review_status='rejected',evidence_count='1',issue_code='REJECTED_WCD05_CONTRARY_SOURCE|CODEX-REVIEW-WCD05-PASS' WHERE relation_hold_id='V1-HOLD-0046';

UPDATE metadata SET value='WCD-05-CS01' WHERE key='last_change_set';
UPDATE metadata SET value='2026-08-31' WHERE key='generated_at';
UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';
