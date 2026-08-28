INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0370','place','布宜诺斯艾利斯','Buenos Aires','canonical','3','V1-FCT-0440;V1-FCT-0752;V1-FCT-0243','已审核作者出生地与作品场景事实共同支持城市实体；与阿根廷国家实体及加雷街分层','NONE'),
('V1-ENT-0371','place','蒙得维的亚','Montevideo','canonical','2','V1-FCT-0399;V1-FCT-0691','两位作者的已审核出生地事实共同支持城市实体；与乌拉圭国家实体分层','NONE'),
('V1-ENT-0372','place','哈瓦那','La Habana','canonical','1','V1-FCT-0534','已审核作者出生地事实支持城市实体；与古巴国家实体分层','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0296','WCD02-CS01','WCD02-CS01-REL-01','V1-ENT-0171','ASSOCIATED_WITH_PLACE','V1-ENT-0125','伊莎贝尔·阿连德与出生地利马关联','high','accepted','WCD02-REVIEW-PASS','1','NONE'),
('V1-REL-0297','WCD02-CS01','WCD02-CS01-REL-02','V1-ENT-0261','ASSOCIATED_WITH_PLACE','V1-ENT-0056','何塞·埃米利奥·帕切科与出生地墨西哥城关联','high','accepted','WCD02-REVIEW-PASS','1','NONE'),
('V1-REL-0298','WCD02-CS01','WCD02-CS01-REL-03','V1-ENT-0262','ASSOCIATED_WITH_PLACE','V1-ENT-0128','罗贝托·波拉尼奥与出生地圣地亚哥关联','high','accepted','WCD02-REVIEW-PASS','1','NONE'),
('V1-REL-0299','WCD02-CS01','WCD02-CS01-REL-04','V1-ENT-0211','ASSOCIATED_WITH_PLACE','V1-ENT-0022','马查多·德·阿西斯与出生地里约热内卢关联','medium','accepted','WCD02-REVIEW-PASS','1','NONE'),
('V1-REL-0300','WCD02-CS01','WCD02-CS01-REL-05','V1-ENT-0198','ASSOCIATED_WITH_PLACE','V1-ENT-0370','阿道夫·比奥伊·卡萨雷斯与出生地布宜诺斯艾利斯关联','high','accepted','WCD02-REVIEW-PASS','1','NONE'),
('V1-REL-0301','WCD02-CS01','WCD02-CS01-REL-06','V1-ENT-0285','ASSOCIATED_WITH_PLACE','V1-ENT-0370','西尔维娜·奥坎波与出生地布宜诺斯艾利斯关联','high','accepted','WCD02-REVIEW-PASS','1','NONE'),
('V1-REL-0302','WCD02-CS01','WCD02-CS01-REL-07','V1-ENT-0184','ASSOCIATED_WITH_PLACE','V1-ENT-0371','胡安·卡洛斯·奥内蒂与出生地蒙得维的亚关联','high','accepted','WCD02-REVIEW-PASS','1','NONE'),
('V1-REL-0303','WCD02-CS01','WCD02-CS01-REL-08','V1-ENT-0272','ASSOCIATED_WITH_PLACE','V1-ENT-0371','爱德华多·加莱亚诺与出生地蒙得维的亚关联','high','accepted','WCD02-REVIEW-PASS','1','NONE'),
('V1-REL-0304','WCD02-CS01','WCD02-CS01-REL-09','V1-ENT-0225','ASSOCIATED_WITH_PLACE','V1-ENT-0372','何塞·马蒂与出生地哈瓦那关联','medium','accepted','WCD02-REVIEW-PASS','1','NONE'),
('V1-REL-0305','WCD02-CS01','WCD02-CS01-REL-10','V1-ENT-0078','SET_IN','V1-ENT-0370','《跳房子》的故事空间包含布宜诺斯艾利斯','high','accepted','WCD02-REVIEW-PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0296','SRC-0134'),('V1-REL-0297','SRC-0209'),('V1-REL-0298','SRC-0211'),('V1-REL-0299','SRC-0165'),('V1-REL-0300','SRC-0153'),('V1-REL-0301','SRC-0228'),('V1-REL-0302','SRC-0141'),('V1-REL-0303','SRC-0215'),('V1-REL-0304','SRC-0187'),('V1-REL-0305','SRC-0076');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0321','V1-REL-0296','V1-FCT-0371','SRC-0134','','','机构时间线直接记录伊莎贝尔·阿连德出生于利马；关系仅表达出生地关联。','high','eligible_evidence','WCD02-CS01'),
('V1-EV-0322','V1-REL-0297','V1-FCT-0664','SRC-0209','','','El Colegio Nacional 作者页直接记录何塞·埃米利奥·帕切科出生于墨西哥城；关系仅表达出生地关联。','high','eligible_evidence','WCD02-CS01'),
('V1-EV-0323','V1-REL-0298','V1-FCT-0678','SRC-0211','','','Memoria Chilena 作者页直接记录罗贝托·波拉尼奥出生于圣地亚哥；关系仅表达出生地关联。','high','eligible_evidence','WCD02-CS01'),
('V1-EV-0324','V1-REL-0299','V1-FCT-0482','SRC-0165','','','巴西文学院传记支持马查多·德·阿西斯出生于里约热内卢；沿用原事实的 medium 置信度。','medium','eligible_evidence','WCD02-CS01'),
('V1-EV-0325','V1-REL-0300','V1-FCT-0440','SRC-0153','','','Instituto Cervantes 传记直接记录比奥伊·卡萨雷斯出生于布宜诺斯艾利斯；关系仅表达出生地关联。','high','eligible_evidence','WCD02-CS01'),
('V1-EV-0326','V1-REL-0301','V1-FCT-0752','SRC-0228','','','阿根廷文化部页面直接记录西尔维娜·奥坎波出生于布宜诺斯艾利斯；关系仅表达出生地关联。','high','eligible_evidence','WCD02-CS01'),
('V1-EV-0327','V1-REL-0302','V1-FCT-0399','SRC-0141','','','Instituto Cervantes 传记直接记录奥内蒂出生于蒙得维的亚；关系仅表达出生地关联。','high','eligible_evidence','WCD02-CS01'),
('V1-EV-0328','V1-REL-0303','V1-FCT-0691','SRC-0215','','','阿根廷文化部页面直接记录加莱亚诺出生于蒙得维的亚；关系仅表达出生地关联。','high','eligible_evidence','WCD02-CS01'),
('V1-EV-0329','V1-REL-0304','V1-FCT-0534','SRC-0187','','','Biblioteca Virtual Miguel de Cervantes 作者页直接记录何塞·马蒂的哈瓦那出生地；沿用原事实的 medium 置信度。','medium','eligible_evidence','WCD02-CS01'),
('V1-EV-0330','V1-REL-0305','V1-FCT-0243','SRC-0076','','','出版社内容介绍直接支持奥利维拉返回布宜诺斯艾利斯，作品场景事实明确列出该城。','high','eligible_evidence','WCD02-CS01');

UPDATE relationship_evidence SET source_title=(SELECT title FROM sources WHERE sources.source_id=relationship_evidence.source_id) WHERE evidence_id BETWEEN 'V1-EV-0321' AND 'V1-EV-0330';
UPDATE metadata SET value='WCD02-CS01' WHERE key='last_change_set';
UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

