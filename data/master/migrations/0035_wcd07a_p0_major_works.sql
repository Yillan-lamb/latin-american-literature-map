-- WCD-07A: six independently reviewed P0 major-work omissions.
-- Reviewer gate: CODEX-REVIEW-WCD07A PASS. Audit-only S17 and deferred F025 are excluded.

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0374','work','《我们的土地》','Terra Nostra','candidate','3','WCD07A-W01','ELEM/UNAM establish the 1975 novel identity; China Writers supports the published Chinese display title','NONE'),
('V1-ENT-0375','work','《逃亡的艺术》','El arte de la fuga','candidate','3','WCD07A-W02','CVC and UNAM establish one 1996 hybrid work; China Reading Weekly supports the published Chinese display title','NONE'),
('V1-ENT-0376','collection','《自由诗》','Versos libres','candidate','2','WCD07A-W03','Two independently authored studies establish the posthumous 1913 poetry collection; Chinese is a display gloss, not a claimed edition','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0377','work','《公羊的节日》','La fiesta del Chivo','candidate','3','WCD07A-W04','Nobel and Alfaguara establish the 2000 novel identity; China Writers supports the published Chinese display title','NONE'),
('V1-ENT-0378','work','《山上的狐狸，山下的狐狸》','El zorro de arriba y el zorro de abajo','candidate','2','WCD07A-W05','Biblioteca Nacional del Perú and Editorial Losada establish one 1971 novel; the shorter electronic title remains audit-only','NONE'),
('V1-ENT-0379','work','《无边的土地》','Terras do sem-fim','candidate','3','WCD07A-W06','Brazilian National Library and independent SciELO scholarship converge on the 1943 novel; the 1942 dissent remains changeset-only','DISPUTED-YEAR-RESOLVED-1943');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0370','WCD07A-W01','WCD-07A','WCD07A-W01','V1-ENT-0374','retain_as_formal_candidate','fresh-context reviewer PASS; semantic duplicate check clear'),
('V1-EMAP-0371','WCD07A-W02','WCD-07A','WCD07A-W02','V1-ENT-0375','retain_as_formal_candidate','fresh-context reviewer PASS; single hybrid work'),
('V1-EMAP-0372','WCD07A-W03','WCD-07A','WCD07A-W03','V1-ENT-0376','retain_as_formal_candidate','fresh-context reviewer PASS; distinct posthumous collection'),
('V1-EMAP-0373','WCD07A-W04','WCD-07A','WCD07A-W04','V1-ENT-0377','retain_as_formal_candidate','fresh-context reviewer PASS; semantic duplicate check clear'),
('V1-EMAP-0374','WCD07A-W05','WCD-07A','WCD07A-W05','V1-ENT-0378','retain_as_formal_candidate','fresh-context reviewer PASS; novel and edition layers separated'),
('V1-EMAP-0375','WCD07A-W06','WCD-07A','WCD07A-W06','V1-ENT-0379','retain_as_formal_candidate','fresh-context reviewer PASS; 1943 resolved by two direct independent sources');

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0301','WCD07A-S01','Terra Nostra — Detalle de la obra','Terra Nostra — Detalle de la obra','Enciclopedia de la Literatura en México','','Fundación para las Letras Mexicanas','','','web_page','','es','A','access_pass','WCD-07A','metadata_and_summary','remote_only','','https://www.elem.mx/obra/datos/3344'),
('SRC-0302','WCD07A-S02','La Cátedra Carlos Fuentes celebrará el 50 aniversario de Terra Nostra','La Cátedra Carlos Fuentes celebrará el 50 aniversario de Terra Nostra','Gaceta UNAM','','UNAM','2025','','web_page','','es','A','access_pass','WCD-07A','metadata_and_summary','remote_only','','https://www.gaceta.unam.mx/la-catedra-carlos-fuentes-celebrara-el-50-aniversario-de-terra-nostra-de-carlos-fuentes/'),
('SRC-0303','WCD07A-S03','《我们的土地》—书汇','《我们的土地》—书汇','中国作家网','','作家出版社','2021','9787521211542','web_page','','zh','B','access_pass','WCD-07A','chinese_display_and_edition','remote_only','','https://www.chinawriter.com.cn/n1/2021/0825/c405084-32207463.html'),
('SRC-0304','WCD07A-S05','Sergio Pitol. El arte de la fuga','Sergio Pitol. El arte de la fuga','Revista Literatura Mexicana','','UNAM','1998','','journal_review','','es','A','access_pass','WCD-07A','metadata_and_summary','remote_only','','https://revistas-filologicas.unam.mx/literatura-mexicana/index.php/lm/article/view/324'),
('SRC-0305','WCD07A-S06','《作家的宿命就是逃亡》','《作家的宿命就是逃亡》','中华读书报','','光明日报','2006','','newspaper_review','','zh','B','access_pass','WCD-07A','chinese_display_and_edition','remote_only','','https://www.gmw.cn/01ds/2006-07/05/content_445692.htm'),
('SRC-0306','WCD07A-S07','Tradición y modernidad en los Versos libres','Tradición y modernidad en los Versos libres','Carlos Javier Morales','','Biblioteca Virtual Miguel de Cervantes','1995','','scholarly_article','','es','A','access_pass','WCD-07A','metadata_and_summary','remote_only','','https://www.cervantesvirtual.com/descargaPdf/tradicion-y-modernidad-en-los-versos-libres/'),
('SRC-0307','WCD07A-S08','Introducción a la literatura cubana','Introducción a la literatura cubana','Roberto Fernández Retamar','','Biblioteca Virtual Miguel de Cervantes','2000','','scholarly_article','','es','A','access_pass','WCD-07A','metadata_and_summary','remote_only','','https://www.cervantesvirtual.com/obra-visor/america-sin-nombre--11/html/0256666c-82b2-11df-acc7-002185ce6064_3.htm'),
('SRC-0308','WCD07A-S09','The Nobel Prize in Literature 2010 — Bio-bibliographical notes','The Nobel Prize in Literature 2010 — Bio-bibliographical notes','Nobel Prize Outreach','','Nobel Foundation','2010','','institutional_bibliography','','en','A','access_pass','WCD-07A','metadata_and_summary','remote_only','','https://www.nobelprize.org/prizes/literature/2010/bio-bibliography/'),
('SRC-0309','WCD07A-S10','La fiesta del Chivo','La fiesta del Chivo','Penguin Random House Grupo Editorial','','Alfaguara','','','publisher_catalog','','es','A','access_pass','WCD-07A','metadata_and_summary','remote_only','','https://www.penguinlibros.com/co/tematicas/15210-ebook-la-fiesta-del-chivo-9788420499437'),
('SRC-0310','WCD07A-S11','《公羊的节日》—书汇','《公羊的节日》—书汇','中国作家网','','上海译文出版社','2016','9787532741243','web_page','','zh','B','access_pass','WCD-07A','chinese_display_and_edition','remote_only','','http://www.chinawriter.com.cn/n1/2016/0627/c405068-28500637.html'),
('SRC-0311','WCD07A-S12','El zorro de arriba y el zorro de abajo — BNP Digital','El zorro de arriba y el zorro de abajo','Biblioteca Nacional del Perú','','Biblioteca Nacional del Perú','1971','','national_library_record','','es','A','access_pass','WCD-07A','metadata_and_summary','remote_only','hdl.handle.net/20.500.14428/79320','https://bibliotecadigital.bnp.gob.pe/items/72c6e3f4-b4a0-4e00-babd-9481cdb250fb'),
('SRC-0312','WCD07A-S13','El zorro de arriba y el zorro de abajo','El zorro de arriba y el zorro de abajo','Editorial Losada','','Editorial Losada','','','publisher_catalog','','es','A','access_pass','WCD-07A','metadata_and_summary','remote_only','','https://editoriallosada.com/libro/el-zorro-de-arriba-y-el-zorro-de-abajo/'),
('SRC-0313','WCD07A-S14','Literatura — Jorge Amado: um sem-fim de romances','Literatura — Jorge Amado: um sem-fim de romances','Biblioteca Nacional do Brasil','','BNDigital','2021','','national_library_article','','pt','A','access_pass','WCD-07A','metadata_and_summary','remote_only','','https://bndigital.bn.gov.br/artigos/literatura-jorge-amado-um-sem-fim-de-romances/'),
('SRC-0314','WCD07A-S15','Terras adubadas com sangue: o coronelismo em Terras do sem fim','Terras adubadas com sangue: o coronelismo em Terras do sem fim','João Paulo Mansur','','Revista Brasileira de Ciências Sociais','2021','','scholarly_article','','pt','A','access_pass','WCD-07A','metadata_and_summary','remote_only','DOI 10.1590/3610507/2020','https://www.scielo.br/j/rbcsoc/a/9qN3hjfWHPdxvpKbrhk8Gvv/?lang=pt');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0256','WCD07A-W01','V1-ENT-0374','work','《我们的土地》','卡洛斯·富恩特斯','Terra Nostra','墨西哥','es','1975','长篇小说','WCD-07A','meets','NONE','### 《我们的土地》｜Terra Nostra\n\n- 对象类型：`work`｜首版：1975｜体裁：长篇小说\n- 研究基线：ELEM 与 UNAM 支持书目身份和三部结构；不拆子实体。'),
('V1-CARD-0257','WCD07A-W02','V1-ENT-0375','work','《逃亡的艺术》','塞尔希奥·皮托尔','El arte de la fuga','墨西哥','es','1996','复合型散文','WCD-07A','meets','NONE','### 《逃亡的艺术》｜El arte de la fuga\n\n- 对象类型：`work`｜首版：1996｜体裁：复合型散文\n- 研究基线：一部在文学评论、阅读记忆与自传叙述间展开的独立著作。'),
('V1-CARD-0258','WCD07A-W03','V1-ENT-0376','collection','《自由诗》','何塞·马蒂','Versos libres','古巴','es','1913','诗集','WCD-07A','meets','PROVISIONAL-ZH-DISPLAY','### 《自由诗》｜Versos libres\n\n- 对象类型：`collection`｜首版：1913（身后出版）｜体裁：诗集\n- 研究基线：中文名仅作显示，不主张存在独立正式全本中译。'),
('V1-CARD-0259','WCD07A-W04','V1-ENT-0377','work','《公羊的节日》','马里奥·巴尔加斯·略萨','La fiesta del Chivo','秘鲁','es','2000','长篇小说','WCD-07A','meets','NONE','### 《公羊的节日》｜La fiesta del Chivo\n\n- 对象类型：`work`｜首版：2000｜体裁：长篇小说\n- 研究基线：小说围绕多米尼加共和国特鲁希略独裁统治及其余波展开。'),
('V1-CARD-0260','WCD07A-W05','V1-ENT-0378','work','《山上的狐狸，山下的狐狸》','何塞·玛丽亚·阿格达斯','El zorro de arriba y el zorro de abajo','秘鲁','es','1971','长篇小说','WCD-07A','meets','NONE','### 《山上的狐狸，山下的狐狸》｜El zorro de arriba y el zorro de abajo\n\n- 对象类型：`work`｜首版：1971｜体裁：长篇小说\n- 研究基线：作为单一作品保留；日记结构事实因证据不足未准入。'),
('V1-CARD-0261','WCD07A-W06','V1-ENT-0379','work','《无边的土地》','若热·亚马多','Terras do sem-fim','巴西','pt','1943','长篇小说','WCD-07A','meets','DISPUTED-YEAR-RESOLVED-1943','### 《无边的土地》｜Terras do sem-fim\n\n- 对象类型：`work`｜首版：1943｜体裁：长篇小说\n- 研究基线：巴西国家图书馆与独立学术来源收敛于1943；1942异说仅留审计。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-1005','WCD07A-F001','V1-CARD-0256','V1-ENT-0374','entity_layer','work','metadata','WCD07A-W01','high','batch_retained_candidate','single novel; sections not split'),
('V1-FCT-1006','WCD07A-F002','V1-CARD-0256','V1-ENT-0374','first_publication_year','1975','bibliographic','WCD07A-W01','high','batch_retained_candidate','original publication only'),
('V1-FCT-1007','WCD07A-F003','V1-CARD-0256','V1-ENT-0374','genre_or_form','长篇小说','bibliographic','WCD07A-W01','high','batch_retained_candidate','institutional classification'),
('V1-FCT-1008','WCD07A-F004','V1-CARD-0256','V1-ENT-0374','bibliographic_note','1975年由Joaquín Mortiz与Seix Barral在墨西哥出版。','bibliographic_note','WCD07A-W01','high','batch_retained_candidate','later edition dates excluded'),
('V1-FCT-1009','WCD07A-F005','V1-CARD-0256','V1-ENT-0374','story_premise','小说以三部结构交织旧世界、新世界与另一个世界的历史文化经验。','institutional_paraphrase','WCD07A-W01','medium','batch_retained_candidate','no theme or child relation inferred'),
('V1-FCT-1010','WCD07A-F006','V1-CARD-0257','V1-ENT-0375','entity_layer','work','metadata','WCD07A-W02','high','batch_retained_candidate','single hybrid book'),
('V1-FCT-1011','WCD07A-F007','V1-CARD-0257','V1-ENT-0375','first_publication_year','1996','bibliographic','WCD07A-W02','high','batch_retained_candidate','Era Mexico publication'),
('V1-FCT-1012','WCD07A-F008','V1-CARD-0257','V1-ENT-0375','genre_or_form','复合型散文','scholarly_paraphrase','WCD07A-W02','medium','batch_retained_candidate','not reduced to memoir'),
('V1-FCT-1013','WCD07A-F009','V1-CARD-0257','V1-ENT-0375','bibliographic_note','Instituto Cervantes书目记录该书由Era于1996年在墨西哥出版。','bibliographic_note','WCD07A-W02','high','batch_retained_candidate','reuses SRC-0201'),
('V1-FCT-1014','WCD07A-F010','V1-CARD-0257','V1-ENT-0375','story_premise','作品在文学评论、阅读记忆与自传叙述之间展开。','scholarly_paraphrase','WCD07A-W02','medium','batch_retained_candidate','bounded synthesis'),
('V1-FCT-1015','WCD07A-F011','V1-CARD-0258','V1-ENT-0376','entity_layer','collection','metadata','WCD07A-W03','high','batch_retained_candidate','posthumous original collection'),
('V1-FCT-1016','WCD07A-F012','V1-CARD-0258','V1-ENT-0376','first_publication_year','1913','bibliographic','WCD07A-W03','high','batch_retained_candidate','posthumous publication'),
('V1-FCT-1017','WCD07A-F013','V1-CARD-0258','V1-ENT-0376','genre_or_form','诗集','bibliographic','WCD07A-W03','high','batch_retained_candidate','original collection'),
('V1-FCT-1018','WCD07A-F014','V1-CARD-0258','V1-ENT-0376','bibliographic_note','诗作写于作者生前，几乎全部约作于1882年，并于1913年身后出版。','bibliographic_note','WCD07A-W03','high','batch_retained_candidate','composition and publication kept distinct'),
('V1-FCT-1019','WCD07A-F015','V1-CARD-0258','V1-ENT-0376','story_premise','诗集以无韵十一音节诗及强烈跨行、意象构成其形式特征。','scholarly_paraphrase','WCD07A-W03','medium','batch_retained_candidate','no movement relation inferred'),
('V1-FCT-1020','WCD07A-F016','V1-CARD-0259','V1-ENT-0377','entity_layer','work','metadata','WCD07A-W04','high','batch_retained_candidate','single novel'),
('V1-FCT-1021','WCD07A-F017','V1-CARD-0259','V1-ENT-0377','first_publication_year','2000','bibliographic','WCD07A-W04','high','batch_retained_candidate','Nobel bibliography'),
('V1-FCT-1022','WCD07A-F018','V1-CARD-0259','V1-ENT-0377','genre_or_form','长篇小说','bibliographic','WCD07A-W04','high','batch_retained_candidate','publisher classification'),
('V1-FCT-1023','WCD07A-F019','V1-CARD-0259','V1-ENT-0377','bibliographic_note','诺贝尔奖官方书目记录该书2000年由马德里Alfaguara出版。','bibliographic_note','WCD07A-W04','high','batch_retained_candidate','direct bibliography'),
('V1-FCT-1024','WCD07A-F020','V1-CARD-0259','V1-ENT-0377','story_premise','小说围绕多米尼加共和国特鲁希略独裁统治及其余波展开。','publisher_paraphrase','WCD07A-W04','high','batch_retained_candidate','no event or place edge inferred'),
('V1-FCT-1025','WCD07A-F021','V1-CARD-0260','V1-ENT-0378','entity_layer','work','metadata','WCD07A-W05','high','batch_retained_candidate','single novel'),
('V1-FCT-1026','WCD07A-F022','V1-CARD-0260','V1-ENT-0378','first_publication_year','1971','bibliographic','WCD07A-W05','high','batch_retained_candidate','posthumous publication'),
('V1-FCT-1027','WCD07A-F023','V1-CARD-0260','V1-ENT-0378','genre_or_form','长篇小说','bibliographic','WCD07A-W05','high','batch_retained_candidate','national library and publisher classification'),
('V1-FCT-1028','WCD07A-F024','V1-CARD-0260','V1-ENT-0378','bibliographic_note','作品于1971年出版；Editorial Losada将其作为作者的文学遗嘱介绍。','bibliographic_note','WCD07A-W05','high','batch_retained_candidate','unsupported diary-year claim excluded'),
('V1-FCT-1029','WCD07A-F026','V1-CARD-0261','V1-ENT-0379','entity_layer','work','metadata','WCD07A-W06','high','batch_retained_candidate','single novel'),
('V1-FCT-1030','WCD07A-F027','V1-CARD-0261','V1-ENT-0379','first_publication_year','1943','bibliographic','WCD07A-W06','high','batch_retained_candidate','two direct independent sources'),
('V1-FCT-1031','WCD07A-F028','V1-CARD-0261','V1-ENT-0379','genre_or_form','长篇小说','bibliographic','WCD07A-W06','high','batch_retained_candidate','both sources identify a novel'),
('V1-FCT-1032','WCD07A-F029','V1-CARD-0261','V1-ENT-0379','bibliographic_note','巴西国家图书馆与SciELO论文均记作品于1943年出版。','bibliographic_note','WCD07A-W06','high','batch_retained_candidate','1942 dissent remains audit-only'),
('V1-FCT-1033','WCD07A-F030','V1-CARD-0261','V1-ENT-0379','story_premise','小说以巴伊亚可可产区的土地争夺与地方上校政治为叙事背景。','scholarly_paraphrase','WCD07A-W06','high','batch_retained_candidate','no place or theme edge inferred');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-1005','SRC-0301',''),('V1-FCT-1005','SRC-0302',''),('V1-FCT-1006','SRC-0301',''),('V1-FCT-1006','SRC-0302',''),('V1-FCT-1007','SRC-0301',''),('V1-FCT-1008','SRC-0301',''),('V1-FCT-1009','SRC-0302',''),
('V1-FCT-1010','SRC-0201',''),('V1-FCT-1010','SRC-0304',''),('V1-FCT-1011','SRC-0201',''),('V1-FCT-1011','SRC-0304',''),('V1-FCT-1012','SRC-0304',''),('V1-FCT-1013','SRC-0201',''),('V1-FCT-1014','SRC-0304',''),
('V1-FCT-1015','SRC-0306',''),('V1-FCT-1015','SRC-0307',''),('V1-FCT-1016','SRC-0306',''),('V1-FCT-1016','SRC-0307',''),('V1-FCT-1017','SRC-0306',''),('V1-FCT-1017','SRC-0307',''),('V1-FCT-1018','SRC-0306',''),('V1-FCT-1018','SRC-0307',''),('V1-FCT-1019','SRC-0307',''),
('V1-FCT-1020','SRC-0308',''),('V1-FCT-1020','SRC-0309',''),('V1-FCT-1021','SRC-0308',''),('V1-FCT-1021','SRC-0309',''),('V1-FCT-1022','SRC-0309',''),('V1-FCT-1023','SRC-0308',''),('V1-FCT-1024','SRC-0309',''),
('V1-FCT-1025','SRC-0311',''),('V1-FCT-1025','SRC-0312',''),('V1-FCT-1026','SRC-0311',''),('V1-FCT-1027','SRC-0311',''),('V1-FCT-1027','SRC-0312',''),('V1-FCT-1028','SRC-0311',''),('V1-FCT-1028','SRC-0312',''),
('V1-FCT-1029','SRC-0313',''),('V1-FCT-1029','SRC-0314',''),('V1-FCT-1030','SRC-0313',''),('V1-FCT-1030','SRC-0314',''),('V1-FCT-1031','SRC-0313',''),('V1-FCT-1031','SRC-0314',''),('V1-FCT-1032','SRC-0313',''),('V1-FCT-1032','SRC-0314',''),('V1-FCT-1033','SRC-0313',''),('V1-FCT-1033','SRC-0314','');

UPDATE fact_sources SET source_title=(SELECT title FROM sources WHERE sources.source_id=fact_sources.source_id) WHERE fact_id BETWEEN 'V1-FCT-1005' AND 'V1-FCT-1033';

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0256','V1-FCT-1005','batch_retained_candidate'),('V1-CARD-0256','V1-FCT-1006','batch_retained_candidate'),('V1-CARD-0256','V1-FCT-1007','batch_retained_candidate'),('V1-CARD-0256','V1-FCT-1008','batch_retained_candidate'),('V1-CARD-0256','V1-FCT-1009','batch_retained_candidate'),
('V1-CARD-0257','V1-FCT-1010','batch_retained_candidate'),('V1-CARD-0257','V1-FCT-1011','batch_retained_candidate'),('V1-CARD-0257','V1-FCT-1012','batch_retained_candidate'),('V1-CARD-0257','V1-FCT-1013','batch_retained_candidate'),('V1-CARD-0257','V1-FCT-1014','batch_retained_candidate'),
('V1-CARD-0258','V1-FCT-1015','batch_retained_candidate'),('V1-CARD-0258','V1-FCT-1016','batch_retained_candidate'),('V1-CARD-0258','V1-FCT-1017','batch_retained_candidate'),('V1-CARD-0258','V1-FCT-1018','batch_retained_candidate'),('V1-CARD-0258','V1-FCT-1019','batch_retained_candidate'),
('V1-CARD-0259','V1-FCT-1020','batch_retained_candidate'),('V1-CARD-0259','V1-FCT-1021','batch_retained_candidate'),('V1-CARD-0259','V1-FCT-1022','batch_retained_candidate'),('V1-CARD-0259','V1-FCT-1023','batch_retained_candidate'),('V1-CARD-0259','V1-FCT-1024','batch_retained_candidate'),
('V1-CARD-0260','V1-FCT-1025','batch_retained_candidate'),('V1-CARD-0260','V1-FCT-1026','batch_retained_candidate'),('V1-CARD-0260','V1-FCT-1027','batch_retained_candidate'),('V1-CARD-0260','V1-FCT-1028','batch_retained_candidate'),
('V1-CARD-0261','V1-FCT-1029','batch_retained_candidate'),('V1-CARD-0261','V1-FCT-1030','batch_retained_candidate'),('V1-CARD-0261','V1-FCT-1031','batch_retained_candidate'),('V1-CARD-0261','V1-FCT-1032','batch_retained_candidate'),('V1-CARD-0261','V1-FCT-1033','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0519','WCD07A-S01','V1-CARD-0256','SRC-0301','A','identity_and_bibliography','yes','yes','ELEM','accepted','NONE'),
('V1-CS-0520','WCD07A-S02','V1-CARD-0256','SRC-0302','A','structure_and_context','yes','yes','UNAM-GACETA','accepted','NONE'),
('V1-CS-0521','WCD07A-S03','V1-CARD-0256','SRC-0303','B','chinese_display','yes','no','CHINA-WRITERS','accepted','NONE'),
('V1-CS-0522','WCD07A-S04','V1-CARD-0257','SRC-0201','B','identity_and_bibliography','yes','yes','CVC','accepted','REUSED-SOURCE'),
('V1-CS-0523','WCD07A-S05','V1-CARD-0257','SRC-0304','A','form_and_context','yes','yes','UNAM-LM','accepted','NONE'),
('V1-CS-0524','WCD07A-S06','V1-CARD-0257','SRC-0305','B','chinese_display','yes','no','GMW-ZHDSB','accepted','NONE'),
('V1-CS-0525','WCD07A-S07','V1-CARD-0258','SRC-0306','A','identity_and_bibliography','yes','yes','MORALES-1995','accepted','NONE'),
('V1-CS-0526','WCD07A-S08','V1-CARD-0258','SRC-0307','A','form_and_context','yes','yes','RETAMAR-2000','accepted','NONE'),
('V1-CS-0527','WCD07A-S09','V1-CARD-0259','SRC-0308','A','identity_and_bibliography','yes','yes','NOBEL','accepted','NONE'),
('V1-CS-0528','WCD07A-S10','V1-CARD-0259','SRC-0309','A','form_and_context','yes','yes','ALFAGUARA','accepted','NONE'),
('V1-CS-0529','WCD07A-S11','V1-CARD-0259','SRC-0310','B','chinese_display','yes','no','CHINA-WRITERS','accepted','NONE'),
('V1-CS-0530','WCD07A-S12','V1-CARD-0260','SRC-0311','A','identity_and_bibliography','yes','yes','BNP','accepted','NONE'),
('V1-CS-0531','WCD07A-S13','V1-CARD-0260','SRC-0312','A','form_and_context','yes','yes','LOSADA','accepted','NONE'),
('V1-CS-0532','WCD07A-S14','V1-CARD-0261','SRC-0313','A','identity_and_bibliography','yes','yes','BNDIGITAL','accepted','NONE'),
('V1-CS-0533','WCD07A-S15','V1-CARD-0261','SRC-0314','A','form_and_context','yes','yes','MANSUR-2021','accepted','NONE'),
('V1-CS-0534','WCD07A-S16','V1-CARD-0261','SRC-0281','C','chinese_name_context','no','no','CHINA-WRITERS','accepted','REUSED-SOURCE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0331','WCD-07A','WCD07A-R01','V1-ENT-0145','CREATED','V1-ENT-0374','卡洛斯·富恩特斯创作《我们的土地》','high','accepted','CODEX-REVIEW-WCD07A-PASS','2','NONE'),
('V1-REL-0332','WCD-07A','WCD07A-R02','V1-ENT-0249','CREATED','V1-ENT-0375','塞尔希奥·皮托尔创作《逃亡的艺术》','high','accepted','CODEX-REVIEW-WCD07A-PASS','2','NONE'),
('V1-REL-0333','WCD-07A','WCD07A-R03','V1-ENT-0225','CREATED','V1-ENT-0376','何塞·马蒂创作《自由诗》','high','accepted','CODEX-REVIEW-WCD07A-PASS','2','NONE'),
('V1-REL-0334','WCD-07A','WCD07A-R04','V1-ENT-0114','CREATED','V1-ENT-0377','马里奥·巴尔加斯·略萨创作《公羊的节日》','high','accepted','CODEX-REVIEW-WCD07A-PASS','2','NONE'),
('V1-REL-0335','WCD-07A','WCD07A-R05','V1-ENT-0248','CREATED','V1-ENT-0378','何塞·玛丽亚·阿格达斯创作《山上的狐狸，山下的狐狸》','high','accepted','CODEX-REVIEW-WCD07A-PASS','2','NONE'),
('V1-REL-0336','WCD-07A','WCD07A-R06','V1-ENT-0172','CREATED','V1-ENT-0379','若热·亚马多创作《无边的土地》','high','accepted','CODEX-REVIEW-WCD07A-PASS','2','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0331','SRC-0301'),('V1-REL-0331','SRC-0302'),('V1-REL-0332','SRC-0201'),('V1-REL-0332','SRC-0304'),('V1-REL-0333','SRC-0306'),('V1-REL-0333','SRC-0307'),('V1-REL-0334','SRC-0308'),('V1-REL-0334','SRC-0309'),('V1-REL-0335','SRC-0311'),('V1-REL-0335','SRC-0312'),('V1-REL-0336','SRC-0313'),('V1-REL-0336','SRC-0314');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0368','V1-REL-0331','WCD07A-S01','SRC-0301','','work record: author/title/1975/novel','ELEM directly attributes the 1975 novel to Carlos Fuentes.','high','eligible_evidence','WCD-07A'),
('V1-EV-0369','V1-REL-0331','WCD07A-S02','SRC-0302','','50th-anniversary article','UNAM independently identifies Fuentes as author of Terra Nostra.','high','eligible_evidence','WCD-07A'),
('V1-EV-0370','V1-REL-0332','WCD07A-S04','SRC-0201','','author bibliography','Instituto Cervantes lists El arte de la fuga in Sergio Pitol''s bibliography.','high','eligible_evidence','WCD-07A'),
('V1-EV-0371','V1-REL-0332','WCD07A-S05','SRC-0304','','book review bibliographic header','The independent UNAM review identifies Pitol and the 1996 Era book.','high','eligible_evidence','WCD-07A'),
('V1-EV-0372','V1-REL-0333','WCD07A-S07','SRC-0306','','opening bibliographic discussion','Morales studies Versos libres as Marti''s posthumously published collection.','high','eligible_evidence','WCD-07A'),
('V1-EV-0373','V1-REL-0333','WCD07A-S08','SRC-0307','','Marti poetry discussion','Retamar independently distinguishes Marti''s Versos libres from Versos sencillos.','high','eligible_evidence','WCD-07A'),
('V1-EV-0374','V1-REL-0334','WCD07A-S09','SRC-0308','','official bibliography','Nobel''s official bibliography lists Vargas Llosa''s La fiesta del Chivo.','high','eligible_evidence','WCD-07A'),
('V1-EV-0375','V1-REL-0334','WCD07A-S10','SRC-0309','','publisher work page','Alfaguara independently identifies the author and novel.','high','eligible_evidence','WCD-07A'),
('V1-EV-0376','V1-REL-0335','WCD07A-S12','SRC-0311','','national-library item record','BNP directly attributes the 1971 novel to Jose Maria Arguedas.','high','eligible_evidence','WCD-07A'),
('V1-EV-0377','V1-REL-0335','WCD07A-S13','SRC-0312','','publisher work page','Losada independently identifies Arguedas and the novel.','high','eligible_evidence','WCD-07A'),
('V1-EV-0378','V1-REL-0336','WCD07A-S14','SRC-0313','','author chronology and novel discussion','Brazil''s National Library identifies Terras do sem-fim as Jorge Amado''s 1943 novel.','high','eligible_evidence','WCD-07A'),
('V1-EV-0379','V1-REL-0336','WCD07A-S15','SRC-0314','','abstract and article text','Independent scholarship attributes the novel to Amado and dates publication to 1943.','high','eligible_evidence','WCD-07A');

UPDATE relationship_evidence SET source_title=(SELECT title FROM sources WHERE sources.source_id=relationship_evidence.source_id) WHERE evidence_id BETWEEN 'V1-EV-0368' AND 'V1-EV-0379';

UPDATE metadata SET value='WCD-07A' WHERE key='last_change_set';
UPDATE metadata SET value='1.5.0' WHERE key='research_version';
UPDATE metadata SET value='Data 1.5.0 development candidate package' WHERE key='package';
UPDATE metadata SET value='2026-09-02' WHERE key='generated_at';
UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';
