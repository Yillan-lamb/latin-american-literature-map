-- WCD-03 Chinese display-name consolidation.
-- Entity identity, original-language anchors, facts, relationships and schema remain unchanged.

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0281','WCD03-SRC-01','若热·亚马多中文作家名资料','Jorge Amado Chinese-name profile','中国作家网','','中国作家网','2016','','web_page','','zh','C','access_pass','WCD-03','Chinese display-name support for 若热·亚马多','remote_only','','https://www.chinawriter.com.cn/comm/2016/2016-02-24/265978.html'),
('SRC-0282','WCD03-SRC-11','政府采购书目中的短暂的生命','La vida breve','胡安·卡洛斯·奥内蒂','','作家出版社','2024','9787521229967','catalog_record','','zh','B','access_pass','WCD-03','Direct bibliographic support for the Writers Publishing House title 《短暂的生命》','remote_only','','https://zhengzhou.zfcg.henan.gov.cn/cmsweb81e27e/nas/webfile2024//nanyang/rootfiles/2024/11/15/caaec49ea4264e7990077622cd565e1d.pdf'),
('SRC-0283','WCD03-SRC-03','污秽的夜鸟','El obsceno pájaro de la noche','','','人民文学出版社','2022','9787020167647','catalog_record','','zh','B','access_pass','WCD-03','Published Chinese-title support for 《污秽的夜鸟》','remote_only','','https://zfcg.henan.gov.cn/cmsweb81e27e/nas/webfile2024/henan/rootfiles/2024/07/26/2f9f478cc1494af09a6cc32b574049b2.pdf'),
('SRC-0284','WCD03-SRC-04','政府采购书目中的毁灭者亚巴顿','Abaddón el exterminador','埃内斯托·萨瓦托','','四川文艺出版社','2021','9787541159299','catalog_record','','zh','B','access_pass','WCD-03','Direct bibliographic support for 《毁灭者亚巴顿》 and the Sichuan Literature and Art edition','remote_only','','https://www.ccgp-neimenggu.gov.cn/gpx-bid-file/150501/gpx-tender/2022/9/27/402881dd82f475a001837dd994c704ec.pdf?accessCode=6ee03dd5dfaa580f5676714376d8dec5'),
('SRC-0285','WCD03-SRC-05','政府采购书目中的营救距离','Distancia de rescate','萨曼塔·施维伯林','','人民文学出版社','2018','9787020134663','catalog_record','','zh','B','access_pass','WCD-03','Direct bibliographic support for 萨曼塔·施维伯林, 《营救距离》 and the People''s Literature edition','remote_only','','https://zfcg.henan.gov.cn/cmsweb81e27e/nas/webfile2024/hebi/rootfiles/2023/05/30/f9639cdc6cb440bdaeb5d6b138162c24.pdf'),
('SRC-0286','WCD03-SRC-06','吃鸟的女孩','Pájaros en la boca','','','对外经济贸易大学图书馆','2021','','catalog_record','','zh','B','access_pass','WCD-03','Library-catalogue support for 萨曼塔·施维伯林 and 《吃鸟的女孩》','remote_only','','https://opac.uibe.edu.cn/opac/book/483c06579a847d844526abb43bfd53f2'),
('SRC-0287','WCD03-SRC-07','Las cosas que perdimos en el fuego 文化活动页','Las cosas que perdimos en el fuego','','','塞万提斯学院北京','','','web_page','','zh','B','access_pass','WCD-03','Institutional Chinese-title support for 《火中遗物》','remote_only','','https://cultura.cervantes.es/pekin/zh/%C2%ABlas-cosas-que-perdimos-en-el-fuego%C2%BB/186195'),
('SRC-0288','WCD03-SRC-08','2024 外研社图书目录','2024 外研社图书目录','','','外语教学与研究出版社','2024','','catalog_record','','zh','B','access_pass','WCD-03','Publisher-catalogue support for 《属于我们的夜晚》','remote_only','','https://www.fltrp.com/ebook/zhcb/zhcb_tsml_gd_js_2024/files/basic-html/page37.html'),
('SRC-0289','WCD03-SRC-09','床上抽烟危险','Los peligros de fumar en la cama','','','对外经济贸易大学图书馆','2022','','catalog_record','','zh','B','access_pass','WCD-03','Library-catalogue support for 《床上抽烟危险》','remote_only','','https://opac.uibe.edu.cn/opac/book/1ad3b7b650abb95d05fd46424018d470'),
('SRC-0290','WCD03-SRC-10','桂冠诗人之后的新一代智利诗人','Alejandro Zambra Chinese publication profile','中国作家网','','中国作家网','2017','','web_page','','zh','C','access_pass','WCD-03','Chinese publication-name support for 《树的隐秘生活》 and 《回家的路》','remote_only','','https://www.chinawriter.com.cn/n1/2017/0721/c405171-29418970.html');

UPDATE entities SET name_zh='若热·亚马多', normalization_basis='Published Chinese author spelling supported by China Writers Net; original name and entity identity retained.' WHERE entity_id='V1-ENT-0172';
UPDATE entities SET name_zh='《污秽的夜鸟》', normalization_basis='Published Chinese title supported by a procurement catalogue identifying the People''s Literature edition; original title retained.' WHERE entity_id='V1-ENT-0190';
UPDATE entities SET name_zh='《毁灭者亚巴顿》', normalization_basis='Published Chinese title supported by the Sichuan Literature and Art edition catalogue; original title retained.' WHERE entity_id='V1-ENT-0195';
UPDATE entities SET name_zh='萨曼塔·施维伯林', normalization_basis='Published Chinese author spelling supported across two People''s Literature edition records; original name retained.' WHERE entity_id='V1-ENT-0296';
UPDATE entities SET name_zh='《营救距离》', normalization_basis='Published Chinese title supported by the People''s Literature edition record; original title retained.' WHERE entity_id='V1-ENT-0299';
UPDATE entities SET name_zh='《吃鸟的女孩》', normalization_basis='Published Chinese title supported by a university library catalogue; original title retained.' WHERE entity_id='V1-ENT-0300';
UPDATE entities SET name_zh='《火中遗物》', normalization_basis='Published Chinese title supported by Instituto Cervantes Beijing; original title retained.' WHERE entity_id='V1-ENT-0302';
UPDATE entities SET name_zh='《属于我们的夜晚》', normalization_basis='Published Chinese title supported by the FLTRP catalogue; original title retained.' WHERE entity_id='V1-ENT-0303';
UPDATE entities SET name_zh='《床上抽烟危险》', normalization_basis='Published Chinese title supported by a university library catalogue; original title retained.' WHERE entity_id='V1-ENT-0304';
UPDATE entities SET name_zh='《树的隐秘生活》', normalization_basis='Published Chinese title supported by China Writers Net; original title retained.' WHERE entity_id='V1-ENT-0306';
UPDATE entities SET name_zh='《回家的路》', normalization_basis='Published Chinese title supported by China Writers Net; original title retained.' WHERE entity_id='V1-ENT-0307';

UPDATE content_cards SET
  title_zh=CASE subject_id
    WHEN 'V1-ENT-0172' THEN '若热·亚马多'
    WHEN 'V1-ENT-0190' THEN '《污秽的夜鸟》' WHEN 'V1-ENT-0195' THEN '《毁灭者亚巴顿》'
    WHEN 'V1-ENT-0296' THEN '萨曼塔·施维伯林' WHEN 'V1-ENT-0299' THEN '《营救距离》'
    WHEN 'V1-ENT-0300' THEN '《吃鸟的女孩》' WHEN 'V1-ENT-0302' THEN '《火中遗物》'
    WHEN 'V1-ENT-0303' THEN '《属于我们的夜晚》' WHEN 'V1-ENT-0304' THEN '《床上抽烟危险》'
    WHEN 'V1-ENT-0306' THEN '《树的隐秘生活》' WHEN 'V1-ENT-0307' THEN '《回家的路》' ELSE title_zh END,
  author_label=REPLACE(REPLACE(author_label,'豪尔赫·亚马多','若热·亚马多'),'萨曼塔·施韦布林','萨曼塔·施维伯林'),
  content_markdown=REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(content_markdown,
    '豪尔赫·亚马多','若热·亚马多'),'《夜晚的淫鸟》','《污秽的夜鸟》'),'《阿巴顿，毁灭者》','《毁灭者亚巴顿》'),'萨曼塔·施韦布林','萨曼塔·施维伯林'),'《救援距离》','《营救距离》'),'《口中之鸟》','《吃鸟的女孩》'),'《我们在火中失去的东西》','《火中遗物》'),'《我们的夜晚》','《属于我们的夜晚》'),'《床上吸烟的危险》','《床上抽烟危险》'),'《树木的私生活》','《树的隐秘生活》'),'《回家的方式》','《回家的路》');

UPDATE relationships SET description_zh=REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(description_zh,
  '豪尔赫·亚马多','若热·亚马多'),'《夜晚的淫鸟》','《污秽的夜鸟》'),'《阿巴顿，毁灭者》','《毁灭者亚巴顿》'),'萨曼塔·施韦布林','萨曼塔·施维伯林'),'《救援距离》','《营救距离》'),'《口中之鸟》','《吃鸟的女孩》'),'《我们在火中失去的东西》','《火中遗物》'),'《我们的夜晚》','《属于我们的夜晚》'),'《床上吸烟的危险》','《床上抽烟危险》'),'《树木的私生活》','《树的隐秘生活》'),'《回家的方式》','《回家的路》');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0506','WCD-03','V1-CARD-0072','SRC-0281','C','display','yes','no','SRC-0281','used','NONE'),
('V1-CS-0507','WCD-03','V1-CARD-0077','SRC-0282','B','display','yes','no','SRC-0282','used','NONE'),
('V1-CS-0508','WCD-03','V1-CARD-0081','SRC-0283','B','display','yes','no','SRC-0283','used','NONE'),
('V1-CS-0509','WCD-03','V1-CARD-0087','SRC-0284','B','display','yes','no','SRC-0284','used','NONE'),
('V1-CS-0510','WCD-03','V1-CARD-0184','SRC-0285','B','display','yes','no','SRC-0285','used','NONE'),
('V1-CS-0511','WCD-03','V1-CARD-0184','SRC-0286','B','display','yes','no','SRC-0286','used','NONE'),
('V1-CS-0512','WCD-03','V1-CARD-0187','SRC-0285','B','display','yes','no','SRC-0285','used','NONE'),
('V1-CS-0513','WCD-03','V1-CARD-0188','SRC-0286','B','display','yes','no','SRC-0286','used','NONE'),
('V1-CS-0514','WCD-03','V1-CARD-0190','SRC-0287','B','display','yes','no','SRC-0287','used','NONE'),
('V1-CS-0515','WCD-03','V1-CARD-0191','SRC-0288','B','display','yes','no','SRC-0288','used','NONE'),
('V1-CS-0516','WCD-03','V1-CARD-0192','SRC-0289','B','display','yes','no','SRC-0289','used','NONE'),
('V1-CS-0517','WCD-03','V1-CARD-0194','SRC-0290','C','display','yes','no','SRC-0290','used','NONE'),
('V1-CS-0518','WCD-03','V1-CARD-0195','SRC-0290','C','display','yes','no','SRC-0290','used','NONE');

UPDATE metadata SET value='WCD-03' WHERE key='last_change_set';
UPDATE metadata SET value='Data 1.3.1 development candidate package' WHERE key='package';
UPDATE metadata SET value='1.3.1' WHERE key='research_version';
UPDATE metadata SET value='2026-08-30' WHERE key='generated_at';
UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';
