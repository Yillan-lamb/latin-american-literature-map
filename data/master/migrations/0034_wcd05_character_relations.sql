-- WCD-05 CS04: USER-approved and independently reviewed APPEARS_IN relations.
-- Option A only: character -> work; no inverse relationship is stored.

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0321','WCD-05','WCD05-CS04-01','V1-ENT-0047','APPEARS_IN','V1-ENT-0032','弗朗西斯科·罗萨斯是《未来的回忆》中的人物','high','accepted','CODEX-REVIEW-WCD05-CS04-PASS','1','NONE'),
('V1-REL-0322','WCD-05','WCD05-CS04-02','V1-ENT-0048','APPEARS_IN','V1-ENT-0032','胡利娅·安德拉德是《未来的回忆》中的人物','high','accepted','CODEX-REVIEW-WCD05-CS04-PASS','1','NONE'),
('V1-REL-0323','WCD-05','WCD05-CS04-03','V1-ENT-0049','APPEARS_IN','V1-ENT-0038','胡安·普雷西亚多是《佩德罗·巴拉莫》中的人物','high','accepted','CODEX-REVIEW-WCD05-CS04-PASS','1','NONE'),
('V1-REL-0324','WCD-05','WCD05-CS04-04','V1-ENT-0050','APPEARS_IN','V1-ENT-0038','佩德罗·巴拉莫（人物）是《佩德罗·巴拉莫》中的人物','high','accepted','CODEX-REVIEW-WCD05-CS04-PASS','1','NONE'),
('V1-REL-0325','WCD-05','WCD05-CS04-05','V1-ENT-0091','APPEARS_IN','V1-ENT-0076','上校是《没有人给他写信的上校》中的人物','high','accepted','CODEX-REVIEW-WCD05-CS04-PASS','1','NONE'),
('V1-REL-0326','WCD-05','WCD05-CS04-06','V1-ENT-0092','APPEARS_IN','V1-ENT-0076','奥古斯丁是《没有人给他写信的上校》中的人物','high','accepted','CODEX-REVIEW-WCD05-CS04-PASS','1','NONE'),
('V1-REL-0327','WCD-05','WCD05-CS04-07','V1-ENT-0090','APPEARS_IN','V1-ENT-0077','圣地亚哥·纳萨尔是《一桩事先张扬的凶杀案》中的人物','high','accepted','CODEX-REVIEW-WCD05-CS04-PASS','1','NONE'),
('V1-REL-0328','WCD-05','WCD05-CS04-08','V1-ENT-0093','APPEARS_IN','V1-ENT-0079','马康达尔是《人间王国》中的人物','high','accepted','CODEX-REVIEW-WCD05-CS04-PASS','1','NONE'),
('V1-REL-0329','WCD-05','WCD05-CS04-09','V1-ENT-0094','APPEARS_IN','V1-ENT-0079','亨利·克里斯托夫是《人间王国》中的人物','high','accepted','CODEX-REVIEW-WCD05-CS04-PASS','1','NONE'),
('V1-REL-0330','WCD-05','WCD05-CS04-10','V1-ENT-0141','APPEARS_IN','V1-ENT-0118','劝世者是《世界末日之战》中的人物','high','accepted','CODEX-REVIEW-WCD05-CS04-PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0321','SRC-0020'),
('V1-REL-0322','SRC-0020'),
('V1-REL-0323','SRC-0029'),
('V1-REL-0324','SRC-0029'),
('V1-REL-0325','SRC-0033'),
('V1-REL-0326','SRC-0033'),
('V1-REL-0327','SRC-0034'),
('V1-REL-0328','SRC-0041'),
('V1-REL-0329','SRC-0041'),
('V1-REL-0330','SRC-0046');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0358','V1-REL-0321','WCD05-CS04-01','SRC-0020','','ELEM obra 3408, character discussion naming Francisco Rosas','The institutional work page directly identifies Francisco Rosas as a character in Los recuerdos del porvenir.','high','eligible_evidence','WCD05-CS04'),
('V1-EV-0359','V1-REL-0322','WCD05-CS04-02','SRC-0020','','ELEM obra 3408, character discussion naming Julia Andrade','The institutional work page directly identifies Julia Andrade as a character in Los recuerdos del porvenir.','high','eligible_evidence','WCD05-CS04'),
('V1-EV-0360','V1-REL-0323','WCD05-CS04-03','SRC-0029','','ELEM obra 2838, character and narrator discussion naming Juan Preciado','The institutional work page directly identifies Juan Preciado as a character and narrator in Pedro Páramo.','high','eligible_evidence','WCD05-CS04'),
('V1-EV-0361','V1-REL-0324','WCD05-CS04-04','SRC-0029','','ELEM obra 2838, title-character discussion naming Pedro Páramo','The institutional work page directly identifies the character Pedro Páramo; the character and same-name work remain distinct entities.','high','eligible_evidence','WCD05-CS04'),
('V1-EV-0362','V1-REL-0325','WCD05-CS04-05','SRC-0033','','article abstract, the colonel awaiting the letter','The work-specific scholarly abstract directly discusses the colonel as the central character.','high','eligible_evidence','WCD05-CS04'),
('V1-EV-0363','V1-REL-0326','WCD05-CS04-06','SRC-0033','','article abstract, identifies Agustín as the colonel''s dead son','The work-specific scholarly abstract directly identifies Agustín in El coronel no tiene quien le escriba.','high','eligible_evidence','WCD05-CS04'),
('V1-EV-0364','V1-REL-0327','WCD05-CS04-07','SRC-0034','','work-specific article, analysis naming Santiago Nasar','The work-specific scholarly source directly identifies Santiago Nasar in Crónica de una muerte anunciada.','high','eligible_evidence','WCD05-CS04'),
('V1-EV-0365','V1-REL-0328','WCD05-CS04-08','SRC-0041','','article full text, character discussion naming Mackandal','The work-specific scholarly article directly discusses Mackandal as a character in El reino de este mundo.','high','eligible_evidence','WCD05-CS04'),
('V1-EV-0366','V1-REL-0329','WCD05-CS04-09','SRC-0041','','article full text, character discussion naming Henri Christophe','The work-specific scholarly article directly discusses Henri Christophe as a character in El reino de este mundo.','high','eligible_evidence','WCD05-CS04'),
('V1-EV-0367','V1-REL-0330','WCD05-CS04-10','SRC-0046','','work-specific article, analysis naming el Consejero','The work-specific scholarly article directly discusses el Consejero as a character in La guerra del fin del mundo.','high','eligible_evidence','WCD05-CS04');

UPDATE relationship_evidence
SET source_title=(SELECT title FROM sources WHERE sources.source_id=relationship_evidence.source_id)
WHERE evidence_id BETWEEN 'V1-EV-0358' AND 'V1-EV-0367';

UPDATE metadata SET value='0.4' WHERE key='schema_version';
UPDATE metadata SET value='WCD-05' WHERE key='last_change_set';
UPDATE metadata SET value='1.4.0' WHERE key='research_version';
UPDATE metadata SET value='Data 1.4.0 development candidate package' WHERE key='package';
UPDATE metadata SET value='2026-08-31' WHERE key='generated_at';
UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';
