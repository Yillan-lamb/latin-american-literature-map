-- WCD-05 CS02: independently reviewed Borges influence relationships.

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0293','WCD05-SRC-02','De Borges a Schopenhauer','','Iván Almeida','','Variaciones Borges 17 / Borges Center, University of Pittsburgh','2004','','journal_article','','es','A','access_pass','WCD-05','Systematic specialist study of Borges and Schopenhauer','remote_only','','https://www.borges.pitt.edu/sites/default/files/1706.pdf'),
('SRC-0294','WCD05-SRC-03','Borges y Kafka','','Carlos García','','Fragmentos 28/29 / Universidade Federal de Santa Catarina','2005','','journal_article','','es','A','access_pass_current_url_403','WCD-05','Full text was verified and captured before current URL returned 403; sustained Borges-Kafka engagement','remote_only','','https://periodicos.ufsc.br/index.php/fragmentos/article/viewFile/8119/7489'),
('SRC-0295','WCD05-SRC-04','Jorge Luis Borges y G. K. Chesterton','','Gillian Gayton','','Actas del Sexto Congreso de la Asociación Internacional de Hispanistas','1980','','conference_proceedings_article','','es','A','access_pass_current_url_403','WCD-05','Full text was verified and captured before current URL returned 403; explicit Chesterton influence','remote_only','','https://www.cervantesvirtual.com/research/jorge-luis-borges-y-g-k-chesterton/6f7ff248-27c8-4f78-ba23-583d375a33a1.pdf');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0311','WCD-05','WCD05-CS02-01','V1-ENT-0002','INFLUENCED_BY','V1-ENT-0005','叔本华的哲学构成博尔赫斯长期阅读与思想参照之一','high','accepted','CODEX-REVIEW-WCD05-PASS','2','NONE'),
('V1-REL-0312','WCD-05','WCD05-CS02-02','V1-ENT-0002','INFLUENCED_BY','V1-ENT-0006','卡夫卡的作品持续影响博尔赫斯的阅读、翻译与创作思考','high','accepted','CODEX-REVIEW-WCD05-PASS','2','NONE'),
('V1-REL-0313','WCD-05','WCD05-CS02-03','V1-ENT-0002','INFLUENCED_BY','V1-ENT-0007','切斯特顿对博尔赫斯的侦探叙事与小说观形成显著影响','high','accepted','CODEX-REVIEW-WCD05-PASS','2','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0311','SRC-0002'),('V1-REL-0311','SRC-0293'),
('V1-REL-0312','SRC-0002'),('V1-REL-0312','SRC-0294'),
('V1-REL-0313','SRC-0002'),('V1-REL-0313','SRC-0295');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0338','V1-REL-0311','V1-HEV-0008','SRC-0002','','原书161小传、原书168','The textbook explicitly records Schopenhauer as an intellectual influence and contextual reference.','medium','eligible_evidence','WCD05-CS02'),
('V1-EV-0339','V1-REL-0311','WCD05-SRC-02','SRC-0293','','Variaciones Borges 17, pp. 103–141','A specialist article systematically studies Borges’s long engagement with Schopenhauer.','high','eligible_evidence','WCD05-CS02'),
('V1-EV-0340','V1-REL-0312','V1-HEV-0009','SRC-0002','','原书161小传','The textbook explicitly identifies Kafka as an influence on Borges’s thought and literary career.','medium','eligible_evidence','WCD05-CS02'),
('V1-EV-0341','V1-REL-0312','WCD05-SRC-03','SRC-0294','','Fragmentos 28/29, pp. 49–59','The article documents roughly seven decades of reading, selection, commentary, and translation; it does not repeat the false title-story translation claim.','high','eligible_evidence','WCD05-CS02'),
('V1-EV-0342','V1-REL-0313','V1-HEV-0010','SRC-0002','','原书161小传','The textbook explicitly identifies Chesterton as an influence on Borges’s thought and literary career.','medium','eligible_evidence','WCD05-CS02'),
('V1-EV-0343','V1-REL-0313','WCD05-SRC-04','SRC-0295','','AIH proceedings article','The specialist study concludes that Chesterton’s influence on Borges’s fiction was notable and includes Borges’s own acknowledgement.','high','eligible_evidence','WCD05-CS02');

UPDATE relationship_evidence SET source_title=(SELECT title FROM sources WHERE sources.source_id=relationship_evidence.source_id) WHERE evidence_id BETWEEN 'V1-EV-0338' AND 'V1-EV-0343';

INSERT INTO relation_hold_evidence (evidence_id,relation_hold_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status) VALUES
('V1-HEV-0049','V1-HOLD-0008','WCD05-SRC-02','SRC-0293','','Variaciones Borges 17, pp. 103–141','Independent specialist release evidence for the Borges-Schopenhauer influence relation.','high','release_evidence'),
('V1-HEV-0050','V1-HOLD-0009','WCD05-SRC-03','SRC-0294','','Fragmentos 28/29, pp. 49–59','Independent specialist release evidence for sustained Kafka influence.','high','release_evidence'),
('V1-HEV-0051','V1-HOLD-0010','WCD05-SRC-04','SRC-0295','','AIH proceedings article','Independent specialist release evidence for notable Chesterton influence.','high','release_evidence');

UPDATE relation_hold_evidence SET source_title=(SELECT title FROM sources WHERE sources.source_id=relation_hold_evidence.source_id) WHERE evidence_id BETWEEN 'V1-HEV-0049' AND 'V1-HEV-0051';

UPDATE relation_holds SET review_status='resolved_to_relationship',evidence_count='2',issue_code='RESOLVED_TO_V1-REL-0311|CODEX-REVIEW-WCD05-PASS' WHERE relation_hold_id='V1-HOLD-0008';
UPDATE relation_holds SET review_status='resolved_to_relationship',evidence_count='2',issue_code='RESOLVED_TO_V1-REL-0312|CODEX-REVIEW-WCD05-PASS' WHERE relation_hold_id='V1-HOLD-0009';
UPDATE relation_holds SET review_status='resolved_to_relationship',evidence_count='2',issue_code='RESOLVED_TO_V1-REL-0313|CODEX-REVIEW-WCD05-PASS' WHERE relation_hold_id='V1-HOLD-0010';

UPDATE metadata SET value='WCD-05-CS02' WHERE key='last_change_set';
UPDATE metadata SET value='2026-08-31' WHERE key='generated_at';
UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';
