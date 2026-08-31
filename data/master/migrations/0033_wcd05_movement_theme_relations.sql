-- WCD-05 CS03: independently reviewed movement and theme relationships.

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0296','WCD05-SRC-01','CVC. Borges 100 años. Obras. 1921','','Centro Virtual Cervantes','','Centro Virtual Cervantes','1999','','institutional_exhibition_page','','es','B','access_pass','WCD-05','Direct documentary record of Borges’s 1921 ultraismo participation','remote_only','','https://cvc.cervantes.es/actcult/borges/obras/1921b.htm'),
('SRC-0297','WCD05-SRC-05','Alejo Carpentier: teoría y práctica de lo real maravilloso','','Edmundo Paz Soldán','','Anales de Literatura Hispanoamericana 37 / Universidad Complutense de Madrid','2008','','journal_article','','es','A','access_pass_abstract_record','WCD-05','Journal record and abstract directly support Carpentier’s American expression and lo real maravilloso; not recorded as full-text access','remote_only','','https://revistas.ucm.es/index.php/ALHI/es/article/view/ALHI0808110035A'),
('SRC-0298','WCD05-SRC-06','La semana de Rayuela (Julio Cortázar)','','Antonio Chumbile','','Casa de la Literatura Peruana','2020','','institutional_critical_page','','es','B','access_pass','WCD-05','Active reader and combinable chapter structure in Rayuela','remote_only','','https://www.casadelaliteratura.gob.pe/libro-la-semana-rayuela-julio-cortazar/'),
('SRC-0299','WCD05-SRC-08','Introducción a la poesía de Pablo Neruda','','Luis Monguió','','Universidad de Chile','1963','','university_critical_archive','','es','B','access_pass','WCD-05','Modernist inheritance of Neruda’s early poetry','remote_only','','https://www.neruda.uchile.cl/critica/monguio.html'),
('SRC-0300','WCD05-SRC-09A','Octavio Paz – Biographical','','Nobel Prize Outreach','','NobelPrize.org','','','institutional_biography','','en','B','access_pass','WCD-05','Direct record of Paz’s activity with Breton and Péret','remote_only','','https://www.nobelprize.org/prizes/literature/1990/paz/biographical/');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0314','WCD-05','WCD05-CS03-01','V1-ENT-0002','ASSOCIATED_WITH_MOVEMENT','V1-ENT-0010','博尔赫斯在1919至1921年间参与并传播西语极端主义（ultraísmo）运动','high','accepted','CODEX-REVIEW-WCD05-PASS','2','NONE'),
('V1-REL-0315','WCD-05','WCD05-CS03-02','V1-ENT-0072','ASSOCIATED_WITH_MOVEMENT','V1-ENT-0099','加西亚·马尔克斯是魔幻现实主义最具代表性的作家之一','high','accepted','CODEX-REVIEW-WCD05-PASS','2','NONE'),
('V1-REL-0316','WCD-05','WCD05-CS03-03','V1-ENT-0074','ASSOCIATED_WITH_MOVEMENT','V1-ENT-0100','卡彭铁尔提出并发展“神奇现实”（lo real maravilloso）的美洲文学表达','high','accepted','CODEX-REVIEW-WCD05-PASS','2','NONE'),
('V1-REL-0317','WCD-05','WCD05-CS03-04','V1-ENT-0078','EXPLORES_THEME','V1-ENT-0105','《跳房子》的可组合结构要求读者主动参与并挑战传统线性叙事','high','accepted','CODEX-REVIEW-WCD05-PASS','2','NONE'),
('V1-REL-0318','WCD-05','WCD05-CS03-05','V1-ENT-0079','EXPLORES_THEME','V1-ENT-0108','《人间王国》通过跨文化人物与“神奇现实”表达复合的美洲身份','high','accepted','CODEX-REVIEW-WCD05-PASS','2','NONE'),
('V1-REL-0319','WCD-05','WCD05-CS03-06','V1-ENT-0115','ASSOCIATED_WITH_MOVEMENT','V1-ENT-0131','聂鲁达的早期诗歌创作与西语现代主义传统存在明确关联','high','accepted','CODEX-REVIEW-WCD05-PASS','2','NONE'),
('V1-REL-0320','WCD-05','WCD05-CS03-07','V1-ENT-0059','ASSOCIATED_WITH_MOVEMENT','V1-ENT-0132','帕斯曾直接参与以超现实主义为代表的先锋派文学活动','high','accepted','CODEX-REVIEW-WCD05-PASS','2','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0314','SRC-0002'),('V1-REL-0314','SRC-0296'),
('V1-REL-0315','SRC-0035'),('V1-REL-0315','SRC-0056'),
('V1-REL-0316','SRC-0041'),('V1-REL-0316','SRC-0297'),
('V1-REL-0317','SRC-0038'),('V1-REL-0317','SRC-0298'),
('V1-REL-0318','SRC-0041'),('V1-REL-0318','SRC-0297'),
('V1-REL-0319','SRC-0055'),('V1-REL-0319','SRC-0299'),
('V1-REL-0320','SRC-0100'),('V1-REL-0320','SRC-0300');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0344','V1-REL-0314','V1-HEV-0001','SRC-0002','','原书161小传','The textbook records the 1919 encounter and 1921 dissemination, while also delimiting later abandonment.','medium','eligible_evidence','WCD05-CS03'),
('V1-EV-0345','V1-REL-0314','WCD05-SRC-01','SRC-0296','','CVC 1921 works page','The page documents manifesto, Ultra magazine, and Prisma proclamation participation in 1921.','high','eligible_evidence','WCD05-CS03'),
('V1-EV-0346','V1-REL-0315','V1-HEV-0019','SRC-0035','','CVC institutional exhibition','CVC explicitly identifies García Márquez as one of magical realism’s greatest representatives.','high','eligible_evidence','WCD05-CS03'),
('V1-EV-0347','V1-REL-0315','WCD05-DUP-RS06','SRC-0056','','Nobel Facts page','Nobel independently identifies García Márquez as a foremost interpreter of magical realism.','high','eligible_evidence','WCD05-CS03'),
('V1-EV-0348','V1-REL-0316','V1-HEV-0020','SRC-0041','','article abstract','The independently authored article identifies lo real maravilloso as Carpentier’s instrument for Latin American expression.','high','eligible_evidence','WCD05-CS03'),
('V1-EV-0349','V1-REL-0316','WCD05-SRC-05','SRC-0297','','journal record and abstract','Paz Soldán directly describes lo real maravilloso as Carpentier’s central innovation and American expression.','high','eligible_evidence','WCD05-CS03'),
('V1-EV-0350','V1-REL-0317','V1-HEV-0025','SRC-0038','','article abstract','The article discusses fragmented narration and the importance of an active reader.','high','eligible_evidence','WCD05-CS03'),
('V1-EV-0351','V1-REL-0317','WCD05-SRC-06','SRC-0298','','institutional critical page','The page directly links the combinable 155-chapter structure to the active lector cómplice.','high','eligible_evidence','WCD05-CS03'),
('V1-EV-0352','V1-REL-0318','V1-HEV-0029','SRC-0041','','article abstract','The work-specific article reads Latin America in the novel as transcultural and represented through its characters.','high','eligible_evidence','WCD05-CS03'),
('V1-EV-0353','V1-REL-0318','WCD05-SRC-05','SRC-0297','','journal record and abstract','The independent article ties this work’s lo real maravilloso to rejecting European aesthetics in search of an American expression.','high','eligible_evidence','WCD05-CS03'),
('V1-EV-0354','V1-REL-0319','V1-HEV-0035','SRC-0055','','CVC biography page','CVC limits the modernist influence to Neruda’s early works.','medium','eligible_evidence','WCD05-CS03'),
('V1-EV-0355','V1-REL-0319','WCD05-SRC-08','SRC-0299','','university critical archive','Monguió independently describes the early works as strongly modernist before Neruda moved away from that inheritance.','high','eligible_evidence','WCD05-CS03'),
('V1-EV-0356','V1-REL-0320','V1-HEV-0042','SRC-0100','','Poets.org biography','The existing source places Paz’s early magazine work in an avant-garde context.','medium','eligible_evidence','WCD05-CS03'),
('V1-EV-0357','V1-REL-0320','WCD05-SRC-09A','SRC-0300','','Nobel biographical page','Nobel records direct activity and publication with surrealists André Breton and Benjamin Péret.','high','eligible_evidence','WCD05-CS03');

UPDATE relationship_evidence SET source_title=(SELECT title FROM sources WHERE sources.source_id=relationship_evidence.source_id) WHERE evidence_id BETWEEN 'V1-EV-0344' AND 'V1-EV-0357';

INSERT INTO relation_hold_evidence (evidence_id,relation_hold_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status) VALUES
('V1-HEV-0052','V1-HOLD-0001','WCD05-SRC-01','SRC-0296','','CVC 1921 works page','Independent release evidence for historically bounded ultraismo participation.','high','release_evidence'),
('V1-HEV-0053','V1-HOLD-0019','WCD05-DUP-RS06','SRC-0056','','Nobel Facts page','Independent institutional release evidence for magical-realism association.','high','release_evidence'),
('V1-HEV-0054','V1-HOLD-0020','WCD05-SRC-05','SRC-0297','','journal record and abstract','Independent research output supporting Carpentier’s lo real maravilloso relation.','high','release_evidence'),
('V1-HEV-0055','V1-HOLD-0025','WCD05-SRC-06','SRC-0298','','institutional critical page','Independent release evidence for active reader participation and non-linear structure.','high','release_evidence'),
('V1-HEV-0056','V1-HOLD-0029','WCD05-SRC-05','SRC-0297','','journal record and abstract','Independent work-linked American-expression evidence supporting the transcultural identity theme.','high','release_evidence'),
('V1-HEV-0057','V1-HOLD-0035','WCD05-SRC-08','SRC-0299','','university critical archive','Independent release evidence restricted to Neruda’s early modernist inheritance.','high','release_evidence'),
('V1-HEV-0058','V1-HOLD-0042','WCD05-SRC-09A','SRC-0300','','Nobel biographical page','Independent direct evidence for Paz’s surrealist avant-garde activity.','high','release_evidence');

UPDATE relation_hold_evidence SET source_title=(SELECT title FROM sources WHERE sources.source_id=relation_hold_evidence.source_id) WHERE evidence_id BETWEEN 'V1-HEV-0052' AND 'V1-HEV-0058';

UPDATE relation_holds SET review_status='resolved_to_relationship',evidence_count='2',issue_code='RESOLVED_TO_V1-REL-0314|CODEX-REVIEW-WCD05-PASS' WHERE relation_hold_id='V1-HOLD-0001';
UPDATE relation_holds SET review_status='resolved_to_relationship',evidence_count='2',issue_code='RESOLVED_TO_V1-REL-0315|CODEX-REVIEW-WCD05-PASS' WHERE relation_hold_id='V1-HOLD-0019';
UPDATE relation_holds SET review_status='resolved_to_relationship',evidence_count='2',issue_code='RESOLVED_TO_V1-REL-0316|CODEX-REVIEW-WCD05-PASS' WHERE relation_hold_id='V1-HOLD-0020';
UPDATE relation_holds SET review_status='resolved_to_relationship',evidence_count='2',issue_code='RESOLVED_TO_V1-REL-0317|CODEX-REVIEW-WCD05-PASS' WHERE relation_hold_id='V1-HOLD-0025';
UPDATE relation_holds SET review_status='resolved_to_relationship',evidence_count='2',issue_code='RESOLVED_TO_V1-REL-0318|CODEX-REVIEW-WCD05-PASS' WHERE relation_hold_id='V1-HOLD-0029';
UPDATE relation_holds SET review_status='resolved_to_relationship',evidence_count='2',issue_code='RESOLVED_TO_V1-REL-0319|CODEX-REVIEW-WCD05-PASS' WHERE relation_hold_id='V1-HOLD-0035';
UPDATE relation_holds SET review_status='resolved_to_relationship',evidence_count='2',issue_code='RESOLVED_TO_V1-REL-0320|CODEX-REVIEW-WCD05-PASS' WHERE relation_hold_id='V1-HOLD-0042';

UPDATE metadata SET value='WCD-05' WHERE key='last_change_set';
UPDATE metadata SET value='1.4.0' WHERE key='research_version';
UPDATE metadata SET value='Data 1.4.0 development candidate package' WHERE key='package';
UPDATE metadata SET value='2026-08-31' WHERE key='generated_at';
UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';
