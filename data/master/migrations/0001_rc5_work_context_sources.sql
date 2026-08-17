INSERT INTO sources (source_id, temporary_id, title, original_title, author_or_editor, publisher, publication_year, isbn, format, page_count, language, source_level, processing_status, source_task, public_content_scope, local_asset_status, persistent_id, canonical_url) VALUES
('SRC-0075','','《百年孤独》五十周年西文版书目与内容介绍','Cien años de soledad (50 Aniversario)','Gabriel García Márquez','Vintage Español','2017','9780525562443','publisher_page','400','es','B','access_pass','V2-N4-R04','metadata_and_paraphrase','remote_only','ISBN 9780525562443','https://www.penguinrandomhouse.com/books/196323/cien-anos-de-soledad-50-aniversario--one-hundred-years-of-solitude-by-gabriel-garcia-marquez/9780525562443/'),
('SRC-0076','','《跳房子》书目与内容介绍','Hopscotch','Julio Cortázar','Pantheon','1987','9780394752846','publisher_page','592','en','B','access_pass','V2-N4-R04','metadata_and_paraphrase','remote_only','ISBN 9780394752846','https://www.penguinrandomhouse.com/books/32202/hopscotch-national-book-award-winner-by-julio-cortazar/'),
('SRC-0077','','《消逝的足迹》书目与内容介绍','The Lost Steps','Alejo Carpentier','Penguin Classics','2023','9780143133896','publisher_page','256','en','B','access_pass','V2-N4-R04','metadata_and_paraphrase','remote_only','ISBN 9780143133896','https://www.penguinrandomhouse.com/books/599206/the-lost-steps-by-alejo-carpentier-translated-by-adrian-nathan-west-introduction-by-leonardo-padura/9780143133896/'),
('SRC-0078','','《酒吧长谈》书目与内容介绍','Conversación en la catedral','Mario Vargas Llosa','Debolsillo','2016','9788490625620','publisher_page','736','es','B','access_pass','V2-N4-R04','metadata_and_paraphrase','remote_only','ISBN 9788490625620','https://www.penguinrandomhouse.com/books/579322/conversacion-en-la-catedral--conversation-in-the-cathedral-by-mario-vargas-llosa/'),
('SRC-0080','','《一桩事先张扬的凶杀案》书目与阅读指南','Chronicle of a Death Foretold','Gabriel García Márquez','Vintage','2003','9781400034710','publisher_reading_guide','128','en','B','access_pass','V2-N4-R04','metadata_and_paraphrase','remote_only','ISBN 9781400034710','https://www.penguinrandomhouse.com/books/57980/chronicle-of-a-death-foretold-by-gabriel-garcia-marquez-translated-by-gregory-rabassa/9781400034710/'),
('SRC-0081','','《世界末日之战》书目与内容介绍','La guerra del fin del mundo','Mario Vargas Llosa','Debolsillo','2015','9788490625613','publisher_page','928','es','B','access_pass','V2-N4-R04','metadata_and_paraphrase','remote_only','ISBN 9788490625613','https://www.penguinrandomhouse.com/books/579320/la-guerra-del-fin-del-mundo--the-war-of-the-end-of-the-world-by-mario-vargas-llosa/'),
('SRC-0082','','《城市与狗》书目与内容介绍','La ciudad y los perros','Mario Vargas Llosa','Debolsillo','2017','9788490625934','publisher_page','448','es','B','access_pass','V2-N4-R04','metadata_and_paraphrase','remote_only','ISBN 9788490625934','https://www.penguinrandomhouse.com/books/579475/la-ciudad-y-los-perros--the-time-of-the-hero-by-mario-vargas-llosa/'),
('SRC-0083','','《没有人给他写信的上校》书目与内容介绍','El coronel no tiene quien le escriba','Gabriel García Márquez','Vintage Español','2010','9780307475442','publisher_page','112','es','B','access_pass','V2-N4-R04','metadata_and_paraphrase','remote_only','ISBN 9780307475442','https://www.penguinrandomhouse.com/books/196926/el-coronel-no-tiene-quien-le-escriba--no-one-writes-to-the-colonel-and-other-stories-by-gabriel-garcia-marquez/'),
('SRC-0084','','《佩德罗·巴拉莫》西文版书目与内容介绍','Pedro Páramo','Juan Rulfo','Vintage Español','2019','9780525566526','publisher_page','144','es','B','access_pass','V2-N4-R04','metadata_and_paraphrase','remote_only','ISBN 9780525566526','https://www.penguinrandomhouse.com/books/605926/pedro-paramo-spanish-edition-by-juan-rulfo/'),
('SRC-0085','','《星辰时刻》书目与内容介绍','La hora de la estrella','Clarice Lispector','Debolsillo','2026','9788466381697','publisher_page','104','es','B','access_pass','V2-N4-R04','metadata_and_paraphrase','remote_only','ISBN 9788466381697','https://www.penguinrandomhouse.com/books/826099/la-hora-de-la-estrella--the-hour-of-the-star-by-clarice-lispector/9788466381697/');

INSERT INTO facts (fact_id, origin_material_id, card_id, subject_id, fact_field, value_text, material_class, origin_id, confidence, admission_status, usage_note) VALUES
('V1-FCT-0239','V2-N4-R04','V1-CARD-0022','V1-ENT-0075','story_premise','布恩迪亚—伊瓜兰家族在马孔多延续数代；家族的奇迹、执念、战争、发现与孤独同时组织起这座虚构城镇的历史。','publisher_paraphrase','SRC-0075','high','batch_retained_candidate','低剧透公众导读基础；不替代主题关系'),
('V1-FCT-0240','V2-N4-R04','V1-CARD-0022','V1-ENT-0075','key_character','布恩迪亚—伊瓜兰家族','publisher_paraphrase','SRC-0075','high','batch_retained_candidate','家族级人物入口'),
('V1-FCT-0241','V2-N4-R04','V1-CARD-0025','V1-ENT-0078','story_premise','阿根廷作家奥拉西奥·奥利维拉在巴黎与拉玛伽及朋友们生活；一次失去打断这段生活，他随后返回布宜诺斯艾利斯。','publisher_paraphrase','SRC-0076','high','batch_retained_candidate','低剧透公众导读基础'),
('V1-FCT-0242','V2-N4-R04','V1-CARD-0025','V1-ENT-0078','key_character','奥拉西奥·奥利维拉、拉玛伽','publisher_paraphrase','SRC-0076','high','batch_retained_candidate','主要人物'),
('V1-FCT-0243','V2-N4-R04','V1-CARD-0025','V1-ENT-0078','setting_place','巴黎、布宜诺斯艾利斯','publisher_paraphrase','SRC-0076','high','batch_retained_candidate','文本情境；暂不自动新增地图关系'),
('V1-FCT-0244','V2-N4-R04','V1-CARD-0027','V1-ENT-0080','story_premise','一位在纽约从事商业广告工作的作曲家接受赴南美寻找原住民乐器的任务，也重新面对被搁置的创作愿望。','publisher_paraphrase','SRC-0077','high','batch_retained_candidate','低剧透公众导读基础'),
('V1-FCT-0245','V2-N4-R04','V1-CARD-0027','V1-ENT-0080','setting_place','纽约与南美洲内陆','publisher_paraphrase','SRC-0077','high','batch_retained_candidate','空间基础；不生成精确地图点'),
('V1-FCT-0246','V2-N4-R04','V1-CARD-0032','V1-ENT-0117','story_premise','圣地亚哥·萨瓦拉与安布罗西奥在名为“大教堂”的酒吧交谈，话题不断打开奥德里亚独裁时期的私人记忆与社会关系。','publisher_paraphrase','SRC-0078','high','batch_retained_candidate','低剧透公众导读基础'),
('V1-FCT-0247','V2-N4-R04','V1-CARD-0032','V1-ENT-0117','key_character','圣地亚哥·萨瓦拉、安布罗西奥','publisher_paraphrase','SRC-0078','high','batch_retained_candidate','主要人物'),
('V1-FCT-0248','V2-N4-R04','V1-CARD-0032','V1-ENT-0117','historical_context','秘鲁曼努埃尔·奥德里亚独裁时期','publisher_paraphrase','SRC-0078','high','batch_retained_candidate','背景说明；不自动新建事件关系'),
('V1-FCT-0249','V2-N4-R04','V1-CARD-0024','V1-ENT-0077','story_premise','叙述者在二十多年后重返小镇，重新调查所有人都预先知道、却无人阻止的圣地亚哥·纳萨尔之死。','publisher_paraphrase','SRC-0080','high','batch_retained_candidate','低剧透公众导读基础'),
('V1-FCT-0250','V2-N4-R04','V1-CARD-0033','V1-ENT-0118','story_premise','小说围绕十九世纪巴西腹地的卡努杜斯共同体展开，以历史事件写激情、理想与争取自由的斗争。','publisher_paraphrase','SRC-0081','high','batch_retained_candidate','低剧透公众导读基础'),
('V1-FCT-0251','V2-N4-R04','V1-CARD-0031','V1-ENT-0116','story_premise','利马莱昂西奥·普拉多军事学校的一群少年在严酷纪律、等级与同伴暴力中学习生存。','publisher_paraphrase','SRC-0082','high','batch_retained_candidate','低剧透公众导读基础'),
('V1-FCT-0252','V2-N4-R04','V1-CARD-0031','V1-ENT-0116','setting_place','利马莱昂西奥·普拉多军事学校','publisher_paraphrase','SRC-0082','high','batch_retained_candidate','细化现有利马地点关系'),
('V1-FCT-0253','V2-N4-R04','V1-CARD-0023','V1-ENT-0076','story_premise','一位退役上校每周到港口等待迟到多年的养老金批复；他与患病的妻子困于贫穷，也守着亡子留下的斗鸡。','publisher_paraphrase','SRC-0083','high','batch_retained_candidate','低剧透公众导读基础'),
('V1-FCT-0254','V2-N4-R04','V1-CARD-0023','V1-ENT-0076','setting_place','戒严中的哥伦比亚小村镇','publisher_paraphrase','SRC-0083','high','batch_retained_candidate','不生成精确地图点'),
('V1-FCT-0255','V2-N4-R04','V1-CARD-0018','V1-ENT-0038','story_premise','胡安·普雷西亚多遵照母亲遗愿前往科马拉寻找父亲佩德罗·巴拉莫，却在空荡街道与低语中逐渐听见这座村镇的过去。','publisher_paraphrase','SRC-0084','high','batch_retained_candidate','低剧透公众导读基础'),
('V1-FCT-0256','V2-N4-R04','V1-CARD-0007','V1-ENT-0018','story_premise','里约热内卢的贫穷打字员玛卡贝娅过着狭窄生活；叙述者罗德里戈·S.M.一边讲述她，一边不断暴露讲述本身的困难。','publisher_paraphrase','SRC-0085','high','batch_retained_candidate','低剧透公众导读基础');

INSERT INTO fact_sources (fact_id, source_id, source_title) VALUES
('V1-FCT-0239','SRC-0075','《百年孤独》五十周年西文版书目与内容介绍'),('V1-FCT-0240','SRC-0075','《百年孤独》五十周年西文版书目与内容介绍'),
('V1-FCT-0241','SRC-0076','《跳房子》书目与内容介绍'),('V1-FCT-0242','SRC-0076','《跳房子》书目与内容介绍'),('V1-FCT-0243','SRC-0076','《跳房子》书目与内容介绍'),
('V1-FCT-0244','SRC-0077','《消逝的足迹》书目与内容介绍'),('V1-FCT-0245','SRC-0077','《消逝的足迹》书目与内容介绍'),
('V1-FCT-0246','SRC-0078','《酒吧长谈》书目与内容介绍'),('V1-FCT-0247','SRC-0078','《酒吧长谈》书目与内容介绍'),('V1-FCT-0248','SRC-0078','《酒吧长谈》书目与内容介绍'),
('V1-FCT-0249','SRC-0080','《一桩事先张扬的凶杀案》书目与阅读指南'),('V1-FCT-0250','SRC-0081','《世界末日之战》书目与内容介绍'),
('V1-FCT-0251','SRC-0082','《城市与狗》书目与内容介绍'),('V1-FCT-0252','SRC-0082','《城市与狗》书目与内容介绍'),
('V1-FCT-0253','SRC-0083','《没有人给他写信的上校》书目与内容介绍'),('V1-FCT-0254','SRC-0083','《没有人给他写信的上校》书目与内容介绍'),
('V1-FCT-0255','SRC-0084','《佩德罗·巴拉莫》西文版书目与内容介绍'),('V1-FCT-0256','SRC-0085','《星辰时刻》书目与内容介绍');

UPDATE sources SET processing_status='access_pass' WHERE source_id BETWEEN 'SRC-0075' AND 'SRC-0085';
UPDATE facts SET admission_status='batch_retained_candidate' WHERE fact_id BETWEEN 'V1-FCT-0239' AND 'V1-FCT-0256';
UPDATE metadata SET value='84' WHERE key='source_count';
UPDATE metadata SET value='256' WHERE key='fact_count';
INSERT OR REPLACE INTO metadata (key,value) VALUES ('last_change_set','V2-N4-R04'),('research_version','1.0.1-rc5');
