INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0373','place','巴黎','Paris','canonical','2','V1-FCT-0241;V1-FCT-0243','已审核《跳房子》故事前提与场景事实共同支持城市实体；作为拉美文学跨洋故事空间保留','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0306','WCD02-CS02','WCD02-CS02-REL-01','V1-ENT-0078','SET_IN','V1-ENT-0373','《跳房子》的故事空间包含巴黎','high','accepted','WCD02-REVIEW-PASS','1','NONE'),
('V1-REL-0307','WCD02-CS02','WCD02-CS02-REL-02','V1-ENT-0146','SET_IN','V1-ENT-0056','《最明净的地区》的故事空间为墨西哥城','high','accepted','WCD02-REVIEW-PASS','2','NONE'),
('V1-REL-0308','WCD02-CS02','WCD02-CS02-REL-03','V1-ENT-0081','SET_IN','V1-ENT-0096','《光明世纪》的故事空间包含十八世纪末的古巴','high','accepted','WCD02-REVIEW-PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0306','SRC-0076'),('V1-REL-0307','SRC-0089'),('V1-REL-0307','SRC-0090'),('V1-REL-0308','SRC-0086');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0331','V1-REL-0306','V1-FCT-0243','SRC-0076','','','出版社内容介绍直接支持巴黎生活段落，作品场景事实明确列出巴黎。','high','eligible_evidence','WCD02-CS02'),
('V1-EV-0332','V1-REL-0307','V1-FCT-0267','SRC-0089','','','墨西哥文学百科作品页直接把墨西哥城作为小说空间与城市主体。','high','eligible_evidence','WCD02-CS02'),
('V1-EV-0333','V1-REL-0307','V1-FCT-0267','SRC-0090','','','Fondo de Cultura Económica 作品页独立支持小说对墨西哥城的城市书写。','high','eligible_evidence','WCD02-CS02'),
('V1-EV-0334','V1-REL-0308','V1-FCT-0259','SRC-0086','','','出版社内容介绍直接支持十八世纪末古巴与加勒比海故事空间；本关系只正式化到古巴国家层。','high','eligible_evidence','WCD02-CS02');

UPDATE relationship_evidence SET source_title=(SELECT title FROM sources WHERE sources.source_id=relationship_evidence.source_id) WHERE evidence_id BETWEEN 'V1-EV-0331' AND 'V1-EV-0334';
UPDATE metadata SET value='WCD-02' WHERE key='last_change_set';
UPDATE metadata SET value='1.3.0' WHERE key='research_version';
UPDATE metadata SET value='Data 1.3.0 development candidate package' WHERE key='package';
UPDATE metadata SET value='2026-08-27' WHERE key='generated_at';
UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';
