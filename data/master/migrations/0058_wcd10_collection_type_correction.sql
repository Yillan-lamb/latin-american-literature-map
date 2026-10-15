-- TASK-127 F01: correct existing multi-text container classifications.
-- New additive migration; old SQL/packages remain immutable; no facts or relationships changed.
CREATE TEMP TABLE wcd10_type_guard (ok INTEGER NOT NULL CHECK(ok=1));
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM migration_log)=57 THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT value FROM metadata WHERE key='schema_version')='0.4' THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set')='WCD-10-B05' THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM entities WHERE "entity_id" IS 'V1-ENT-0460' AND "entity_type" IS 'work' AND "name_zh" IS '《辩护与拒绝》' AND "original_name" IS 'Apologías y rechazos' AND "canonical_status" IS 'candidate' AND "origin_count" IS '1' AND "origin_refs" IS 'WCD10-B07-W004' AND "normalization_basis" IS '与基线作者/作品及所见书目交叉核对；为萨瓦托书目中有机构/出版社记录的独立书籍对象。只提议此作品本身，不将版本、合集、单篇文章或章节拆为新对象。; 工作中文显示名为可读性工作译名；原西班牙语题名作为身份锚点，不据此主张已出版的正式中文译名。' AND "issue_codes" IS 'PROVISIONAL-ZH-DISPLAY')=1 THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM content_cards WHERE "card_id" IS 'V1-CARD-0384' AND "origin_card_id" IS 'WCD-10-B07:V1-ENT-0460' AND "subject_id" IS 'V1-ENT-0460' AND "card_type" IS 'work' AND "title_zh" IS '《辩护与拒绝》' AND "author_label" IS '埃内斯托·萨瓦托' AND "original_title" IS 'Apologías y rechazos' AND "country_or_region" IS '阿根廷' AND "language" IS 'es' AND "period_bucket" IS '1979' AND "genre_or_form" IS 'essay collection' AND "input_layer" IS 'WCD-10-B07' AND "source_minimum_status" IS 'research_gap' AND "issue_code" IS 'RESEARCH-ONLY-NOT-CURATED' AND "content_markdown" IS '### 《辩护与拒绝》｜Apologías y rechazos

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1979
- genre_or_form：essay collection
- one_sentence_summary：出版社简介称本书汇集七篇较长文章；作者书目将其列为1979年出版的现代性与文学论说类作品。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。')=1 THEN 1 ELSE 0 END);
UPDATE entities SET entity_type='collection' WHERE entity_id='V1-ENT-0460';
UPDATE content_cards SET card_type='collection',content_markdown='### 《辩护与拒绝》｜Apologías y rechazos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1979
- genre_or_form：essay collection
- one_sentence_summary：出版社简介称本书汇集七篇较长文章；作者书目将其列为1979年出版的现代性与文学论说类作品。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。' WHERE card_id='V1-CARD-0384';
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT entity_type FROM entities WHERE entity_id='V1-ENT-0460')='collection' THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM entities WHERE "entity_id" IS 'V1-ENT-0465' AND "entity_type" IS 'work' AND "name_zh" IS '《关于我们时代文学的三种探讨》' AND "original_name" IS 'Tres aproximaciones a la literatura de nuestro tiempo' AND "canonical_status" IS 'candidate' AND "origin_count" IS '1' AND "origin_refs" IS 'WCD10-B07-W009' AND "normalization_basis" IS 'Institutional Cervantes chronology lists the 1968 essay; University of Córdoba catalog independently identifies the 1968 Spanish-language book by Sábato in the Letras de América series and indexes it as essays/literary criticism on Robbe-Grillet, Borges and Sartre.; 工作中文显示名为可读性工作译名；原西班牙语题名及副题Robbe-Grillet, Borges, Sartre作为身份锚点，不据此主张已出版的正式中文译名。' AND "issue_codes" IS 'PROVISIONAL-ZH-DISPLAY')=1 THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM content_cards WHERE "card_id" IS 'V1-CARD-0389' AND "origin_card_id" IS 'WCD-10-B07:V1-ENT-0465' AND "subject_id" IS 'V1-ENT-0465' AND "card_type" IS 'work' AND "title_zh" IS '《关于我们时代文学的三种探讨》' AND "author_label" IS '埃内斯托·萨瓦托' AND "original_title" IS 'Tres aproximaciones a la literatura de nuestro tiempo' AND "country_or_region" IS '阿根廷' AND "language" IS 'es' AND "period_bucket" IS '1968' AND "genre_or_form" IS 'literary-critical essay collection' AND "input_layer" IS 'WCD-10-B07' AND "source_minimum_status" IS 'research_gap' AND "issue_code" IS 'RESEARCH-ONLY-NOT-CURATED' AND "content_markdown" IS '### 《关于我们时代文学的三种探讨》｜Tres aproximaciones a la literatura de nuestro tiempo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1968
- genre_or_form：literary-critical essay collection
- one_sentence_summary：据馆藏编目题名、副题和主题词，本书由围绕Robbe-Grillet、Jorge Luis Borges与Jean-Paul Sartre的文学批评论说构成。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。')=1 THEN 1 ELSE 0 END);
UPDATE entities SET entity_type='collection' WHERE entity_id='V1-ENT-0465';
UPDATE content_cards SET card_type='collection',content_markdown='### 《关于我们时代文学的三种探讨》｜Tres aproximaciones a la literatura de nuestro tiempo

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1968
- genre_or_form：literary-critical essay collection
- one_sentence_summary：据馆藏编目题名、副题和主题词，本书由围绕Robbe-Grillet、Jorge Luis Borges与Jean-Paul Sartre的文学批评论说构成。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。' WHERE card_id='V1-CARD-0389';
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT entity_type FROM entities WHERE entity_id='V1-ENT-0465')='collection' THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM entities WHERE "entity_id" IS 'V1-ENT-0489' AND "entity_type" IS 'work' AND "name_zh" IS '《La estatua casera》' AND "original_name" IS 'La estatua casera' AND "canonical_status" IS 'candidate' AND "origin_count" IS '1' AND "origin_refs" IS 'WCD10-B07-W124' AND "normalization_basis" IS 'CVC chronology (S102) identifies La estatua casera as a Bioy book published in 1936; García’s direct study (S131, printed pp.81–82) analyzes the independent book and describes its mixed contents. It is absent from the frozen baseline and is not conflated with later collections or the individual pieces discussed within it.; 中文暂以原文题名作显示候选，避免未经核实的译名；原文题名是身份锚点。' AND "issue_codes" IS 'PROVISIONAL-ZH-DISPLAY')=1 THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM content_cards WHERE "card_id" IS 'V1-CARD-0413' AND "origin_card_id" IS 'WCD-10-B07:V1-ENT-0489' AND "subject_id" IS 'V1-ENT-0489' AND "card_type" IS 'work' AND "title_zh" IS '《La estatua casera》' AND "author_label" IS '阿道夫·比奥伊·卡萨雷斯' AND "original_title" IS 'La estatua casera' AND "country_or_region" IS '阿根廷' AND "language" IS 'es' AND "period_bucket" IS '1936' AND "genre_or_form" IS '杂集（混合散文、短篇叙事与短篇文论；不归为单一小说体裁）' AND "input_layer" IS 'WCD-10-B07' AND "source_minimum_status" IS 'research_gap' AND "issue_code" IS 'RESEARCH-ONLY-NOT-CURATED' AND "content_markdown" IS '### 《La estatua casera》｜La estatua casera

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1936
- genre_or_form：杂集（混合散文、短篇叙事与短篇文论；不归为单一小说体裁）
- one_sentence_summary：据García对原书的直接讨论，本书由实验性短篇叙事和反思性文字构成，包含《El hermano de la nonata》《Locus》《Utilidad y fin práctico》及《Sobre la técnica de los cuentos fantásticos》等不同文本；此说明概括其杂集构成，不把任何单篇另作合集身份。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。')=1 THEN 1 ELSE 0 END);
UPDATE entities SET entity_type='collection' WHERE entity_id='V1-ENT-0489';
UPDATE content_cards SET card_type='collection',content_markdown='### 《La estatua casera》｜La estatua casera

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1936
- genre_or_form：杂集（混合散文、短篇叙事与短篇文论；不归为单一小说体裁）
- one_sentence_summary：据García对原书的直接讨论，本书由实验性短篇叙事和反思性文字构成，包含《El hermano de la nonata》《Locus》《Utilidad y fin práctico》及《Sobre la técnica de los cuentos fantásticos》等不同文本；此说明概括其杂集构成，不把任何单篇另作合集身份。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。' WHERE card_id='V1-CARD-0413';
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT entity_type FROM entities WHERE entity_id='V1-ENT-0489')='collection' THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM entities WHERE "entity_id" IS 'V1-ENT-0494' AND "entity_type" IS 'work' AND "name_zh" IS '《Antología de la literatura fantástica》' AND "original_name" IS 'Antología de la literatura fantástica' AND "canonical_status" IS 'candidate' AND "origin_count" IS '1' AND "origin_refs" IS 'WCD10-B07-W129' AND "normalization_basis" IS 'CVC页面署名Carlos Dámaso Martínez，直接记1940年由Bioy、Borges与Silvina Ocampo共同编译选、Bioy作序，并列部分收录作者/文本；1965为扩充版，作为同一选集对象的后续版本，不重复建物件。; 以原文题名保留书目身份；中文显示暂作直书题名。' AND "issue_codes" IS 'PROVISIONAL-ZH-DISPLAY')=1 THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM content_cards WHERE "card_id" IS 'V1-CARD-0418' AND "origin_card_id" IS 'WCD-10-B07:V1-ENT-0494' AND "subject_id" IS 'V1-ENT-0494' AND "card_type" IS 'work' AND "title_zh" IS '《Antología de la literatura fantástica》' AND "author_label" IS '阿道夫·比奥伊·卡萨雷斯' AND "original_title" IS 'Antología de la literatura fantástica' AND "country_or_region" IS '阿根廷' AND "language" IS 'es' AND "period_bucket" IS '1940' AND "genre_or_form" IS '奇幻文学选集（共同编选、翻译）' AND "input_layer" IS 'WCD-10-B07' AND "source_minimum_status" IS 'research_gap' AND "issue_code" IS 'RESEARCH-ONLY-NOT-CURATED' AND "content_markdown" IS '### 《Antología de la literatura fantástica》｜Antología de la literatura fantástica

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1940
- genre_or_form：奇幻文学选集（共同编选、翻译）
- one_sentence_summary：该选集汇集H. G. Wells、Franz Kafka、Rudyard Kipling等作者作品，并收入Macedonio Fernández、Silvina Ocampo与Jorge Luis Borges的文本；Bioy另撰序。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。')=1 THEN 1 ELSE 0 END);
UPDATE entities SET entity_type='collection' WHERE entity_id='V1-ENT-0494';
UPDATE content_cards SET card_type='collection',content_markdown='### 《Antología de la literatura fantástica》｜Antología de la literatura fantástica

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1940
- genre_or_form：奇幻文学选集（共同编选、翻译）
- one_sentence_summary：该选集汇集H. G. Wells、Franz Kafka、Rudyard Kipling等作者作品，并收入Macedonio Fernández、Silvina Ocampo与Jorge Luis Borges的文本；Bioy另撰序。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。' WHERE card_id='V1-CARD-0418';
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT entity_type FROM entities WHERE entity_id='V1-ENT-0494')='collection' THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM entities WHERE "entity_id" IS 'V1-ENT-0573' AND "entity_type" IS 'work' AND "name_zh" IS '《散篇故事》' AND "original_name" IS 'Contos esparsos' AND "canonical_status" IS 'candidate' AND "origin_count" IS '1' AND "origin_refs" IS 'WCD10-B08-W127' AND "normalization_basis" IS '后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。' AND "issue_codes" IS 'PROVISIONAL-ZH-DISPLAY')=1 THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM content_cards WHERE "card_id" IS 'V1-CARD-0506' AND "origin_card_id" IS 'WCD-10-B08:V1-ENT-0573' AND "subject_id" IS 'V1-ENT-0573' AND "card_type" IS 'work' AND "title_zh" IS '《散篇故事》' AND "author_label" IS '马查多·德·阿西斯' AND "original_title" IS 'Contos esparsos' AND "country_or_region" IS '巴西' AND "language" IS 'pt' AND "period_bucket" IS '1956' AND "genre_or_form" IS 'short_story_collection' AND "input_layer" IS 'WCD-10-B08' AND "source_minimum_status" IS 'research_gap' AND "issue_code" IS 'RESEARCH-ONLY-NOT-CURATED' AND "content_markdown" IS '### 《散篇故事》｜Contos esparsos

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：short_story_collection
- one_sentence_summary：Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“O anjo Rafael”。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。')=1 THEN 1 ELSE 0 END);
UPDATE entities SET entity_type='collection' WHERE entity_id='V1-ENT-0573';
UPDATE content_cards SET card_type='collection',content_markdown='### 《散篇故事》｜Contos esparsos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：short_story_collection
- one_sentence_summary：Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“O anjo Rafael”。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。' WHERE card_id='V1-CARD-0506';
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT entity_type FROM entities WHERE entity_id='V1-ENT-0573')='collection' THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM entities WHERE "entity_id" IS 'V1-ENT-0574' AND "entity_type" IS 'work' AND "name_zh" IS '《遗忘的故事》' AND "original_name" IS 'Contos esquecidos' AND "canonical_status" IS 'candidate' AND "origin_count" IS '1' AND "origin_refs" IS 'WCD10-B08-W128' AND "normalization_basis" IS '后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。' AND "issue_codes" IS 'PROVISIONAL-ZH-DISPLAY')=1 THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM content_cards WHERE "card_id" IS 'V1-CARD-0507' AND "origin_card_id" IS 'WCD-10-B08:V1-ENT-0574' AND "subject_id" IS 'V1-ENT-0574' AND "card_type" IS 'work' AND "title_zh" IS '《遗忘的故事》' AND "author_label" IS '马查多·德·阿西斯' AND "original_title" IS 'Contos esquecidos' AND "country_or_region" IS '巴西' AND "language" IS 'pt' AND "period_bucket" IS '1956' AND "genre_or_form" IS 'short_story_collection' AND "input_layer" IS 'WCD-10-B08' AND "source_minimum_status" IS 'research_gap' AND "issue_code" IS 'RESEARCH-ONLY-NOT-CURATED' AND "content_markdown" IS '### 《遗忘的故事》｜Contos esquecidos

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：short_story_collection
- one_sentence_summary：Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“Decadência de dois grandes homens”与“Um esqueleto”。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。')=1 THEN 1 ELSE 0 END);
UPDATE entities SET entity_type='collection' WHERE entity_id='V1-ENT-0574';
UPDATE content_cards SET card_type='collection',content_markdown='### 《遗忘的故事》｜Contos esquecidos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：short_story_collection
- one_sentence_summary：Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“Decadência de dois grandes homens”与“Um esqueleto”。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。' WHERE card_id='V1-CARD-0507';
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT entity_type FROM entities WHERE entity_id='V1-ENT-0574')='collection' THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM entities WHERE "entity_id" IS 'V1-ENT-0575' AND "entity_type" IS 'work' AND "name_zh" IS '《辑录故事》' AND "original_name" IS 'Contos recolhidos' AND "canonical_status" IS 'candidate' AND "origin_count" IS '1' AND "origin_refs" IS 'WCD10-B08-W129' AND "normalization_basis" IS '后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。' AND "issue_codes" IS 'PROVISIONAL-ZH-DISPLAY')=1 THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM content_cards WHERE "card_id" IS 'V1-CARD-0508' AND "origin_card_id" IS 'WCD-10-B08:V1-ENT-0575' AND "subject_id" IS 'V1-ENT-0575' AND "card_type" IS 'work' AND "title_zh" IS '《辑录故事》' AND "author_label" IS '马查多·德·阿西斯' AND "original_title" IS 'Contos recolhidos' AND "country_or_region" IS '巴西' AND "language" IS 'pt' AND "period_bucket" IS '1956' AND "genre_or_form" IS 'short_story_collection' AND "input_layer" IS 'WCD-10-B08' AND "source_minimum_status" IS 'research_gap' AND "issue_code" IS 'RESEARCH-ONLY-NOT-CURATED' AND "content_markdown" IS '### 《辑录故事》｜Contos recolhidos

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：short_story_collection
- one_sentence_summary：Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“O capitão Mendonça”。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。')=1 THEN 1 ELSE 0 END);
UPDATE entities SET entity_type='collection' WHERE entity_id='V1-ENT-0575';
UPDATE content_cards SET card_type='collection',content_markdown='### 《辑录故事》｜Contos recolhidos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：short_story_collection
- one_sentence_summary：Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“O capitão Mendonça”。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。' WHERE card_id='V1-CARD-0508';
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT entity_type FROM entities WHERE entity_id='V1-ENT-0575')='collection' THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM entities WHERE "entity_id" IS 'V1-ENT-0576' AND "entity_type" IS 'work' AND "name_zh" IS '《零篇故事》' AND "original_name" IS 'Contos avulsos' AND "canonical_status" IS 'candidate' AND "origin_count" IS '1' AND "origin_refs" IS 'WCD10-B08-W130' AND "normalization_basis" IS '后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。' AND "issue_codes" IS 'PROVISIONAL-ZH-DISPLAY')=1 THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM content_cards WHERE "card_id" IS 'V1-CARD-0509' AND "origin_card_id" IS 'WCD-10-B08:V1-ENT-0576' AND "subject_id" IS 'V1-ENT-0576' AND "card_type" IS 'work' AND "title_zh" IS '《零篇故事》' AND "author_label" IS '马查多·德·阿西斯' AND "original_title" IS 'Contos avulsos' AND "country_or_region" IS '巴西' AND "language" IS 'pt' AND "period_bucket" IS '1956' AND "genre_or_form" IS 'short_story_collection' AND "input_layer" IS 'WCD-10-B08' AND "source_minimum_status" IS 'research_gap' AND "issue_code" IS 'RESEARCH-ONLY-NOT-CURATED' AND "content_markdown" IS '### 《零篇故事》｜Contos avulsos

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：short_story_collection
- one_sentence_summary：Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“A vida eterna”与“Os óculos de Pedro Antão”。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。')=1 THEN 1 ELSE 0 END);
UPDATE entities SET entity_type='collection' WHERE entity_id='V1-ENT-0576';
UPDATE content_cards SET card_type='collection',content_markdown='### 《零篇故事》｜Contos avulsos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：short_story_collection
- one_sentence_summary：Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“A vida eterna”与“Os óculos de Pedro Antão”。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。' WHERE card_id='V1-CARD-0509';
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT entity_type FROM entities WHERE entity_id='V1-ENT-0576')='collection' THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM entities WHERE "entity_id" IS 'V1-ENT-0577' AND "entity_type" IS 'work' AND "name_zh" IS '《无日期故事》' AND "original_name" IS 'Contos sem data' AND "canonical_status" IS 'candidate' AND "origin_count" IS '1' AND "origin_refs" IS 'WCD10-B08-W131' AND "normalization_basis" IS '后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。' AND "issue_codes" IS 'PROVISIONAL-ZH-DISPLAY')=1 THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM content_cards WHERE "card_id" IS 'V1-CARD-0510' AND "origin_card_id" IS 'WCD-10-B08:V1-ENT-0577' AND "subject_id" IS 'V1-ENT-0577' AND "card_type" IS 'work' AND "title_zh" IS '《无日期故事》' AND "author_label" IS '马查多·德·阿西斯' AND "original_title" IS 'Contos sem data' AND "country_or_region" IS '巴西' AND "language" IS 'pt' AND "period_bucket" IS '1956' AND "genre_or_form" IS 'short_story_collection' AND "input_layer" IS 'WCD-10-B08' AND "source_minimum_status" IS 'research_gap' AND "issue_code" IS 'RESEARCH-ONLY-NOT-CURATED' AND "content_markdown" IS '### 《无日期故事》｜Contos sem data

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：short_story_collection
- one_sentence_summary：Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“A mulher pálida”。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。')=1 THEN 1 ELSE 0 END);
UPDATE entities SET entity_type='collection' WHERE entity_id='V1-ENT-0577';
UPDATE content_cards SET card_type='collection',content_markdown='### 《无日期故事》｜Contos sem data

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：short_story_collection
- one_sentence_summary：Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“A mulher pálida”。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。' WHERE card_id='V1-CARD-0510';
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT entity_type FROM entities WHERE entity_id='V1-ENT-0577')='collection' THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM entities WHERE "entity_id" IS 'V1-ENT-0578' AND "entity_type" IS 'work' AND "name_zh" IS '《短篇与编年文》' AND "original_name" IS 'Contos e crônicas' AND "canonical_status" IS 'candidate' AND "origin_count" IS '1' AND "origin_refs" IS 'WCD10-B08-W132' AND "normalization_basis" IS '后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。' AND "issue_codes" IS 'PROVISIONAL-ZH-DISPLAY')=1 THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM content_cards WHERE "card_id" IS 'V1-CARD-0511' AND "origin_card_id" IS 'WCD-10-B08:V1-ENT-0578' AND "subject_id" IS 'V1-ENT-0578' AND "card_type" IS 'work' AND "title_zh" IS '《短篇与编年文》' AND "author_label" IS '马查多·德·阿西斯' AND "original_title" IS 'Contos e crônicas' AND "country_or_region" IS '巴西' AND "language" IS 'pt' AND "period_bucket" IS '1958' AND "genre_or_form" IS 'short_story_and_chronicle_collection' AND "input_layer" IS 'WCD-10-B08' AND "source_minimum_status" IS 'research_gap' AND "issue_code" IS 'RESEARCH-ONLY-NOT-CURATED' AND "content_markdown" IS '### 《短篇与编年文》｜Contos e crônicas

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1958
- genre_or_form：short_story_and_chronicle_collection
- one_sentence_summary：目录示例列《O Teles e o Tobias》和《O carro nº 13》；Google Books 记录该卷由 Raimundo Magalhães Júnior 编，Civilização Brasileira 于1958年出版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。')=1 THEN 1 ELSE 0 END);
UPDATE entities SET entity_type='collection' WHERE entity_id='V1-ENT-0578';
UPDATE content_cards SET card_type='collection',content_markdown='### 《短篇与编年文》｜Contos e crônicas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1958
- genre_or_form：short_story_and_chronicle_collection
- one_sentence_summary：目录示例列《O Teles e o Tobias》和《O carro nº 13》；Google Books 记录该卷由 Raimundo Magalhães Júnior 编，Civilização Brasileira 于1958年出版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。' WHERE card_id='V1-CARD-0511';
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT entity_type FROM entities WHERE entity_id='V1-ENT-0578')='collection' THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM entities WHERE "entity_id" IS 'V1-ENT-0579' AND "entity_type" IS 'work' AND "name_zh" IS '《马查多·德·阿西斯奇幻故事集》' AND "original_name" IS 'Contos fantásticos de Machado de Assis' AND "canonical_status" IS 'candidate' AND "origin_count" IS '1' AND "origin_refs" IS 'WCD10-B08-W133' AND "normalization_basis" IS '后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。' AND "issue_codes" IS 'PROVISIONAL-ZH-DISPLAY')=1 THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM content_cards WHERE "card_id" IS 'V1-CARD-0512' AND "origin_card_id" IS 'WCD-10-B08:V1-ENT-0579' AND "subject_id" IS 'V1-ENT-0579' AND "card_type" IS 'work' AND "title_zh" IS '《马查多·德·阿西斯奇幻故事集》' AND "author_label" IS '马查多·德·阿西斯' AND "original_title" IS 'Contos fantásticos de Machado de Assis' AND "country_or_region" IS '巴西' AND "language" IS 'pt' AND "period_bucket" IS '1973' AND "genre_or_form" IS 'short_story_collection' AND "input_layer" IS 'WCD-10-B08' AND "source_minimum_status" IS 'research_gap' AND "issue_code" IS 'RESEARCH-ONLY-NOT-CURATED' AND "content_markdown" IS '### 《马查多·德·阿西斯奇幻故事集》｜Contos fantásticos de Machado de Assis

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1973
- genre_or_form：short_story_collection
- one_sentence_summary：Raimundo Magalhães Júnior 1973年编选的十一篇故事，包括《A chinela turca》《A mulher pálida》《O anjo Rafael》与《O capitão Mendonça》；研究指出其中仅两篇曾由 Machado 自行选入生前单行本。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。')=1 THEN 1 ELSE 0 END);
UPDATE entities SET entity_type='collection' WHERE entity_id='V1-ENT-0579';
UPDATE content_cards SET card_type='collection',content_markdown='### 《马查多·德·阿西斯奇幻故事集》｜Contos fantásticos de Machado de Assis

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1973
- genre_or_form：short_story_collection
- one_sentence_summary：Raimundo Magalhães Júnior 1973年编选的十一篇故事，包括《A chinela turca》《A mulher pálida》《O anjo Rafael》与《O capitão Mendonça》；研究指出其中仅两篇曾由 Machado 自行选入生前单行本。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。' WHERE card_id='V1-CARD-0512';
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT entity_type FROM entities WHERE entity_id='V1-ENT-0579')='collection' THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM entities WHERE "entity_id" IS 'V1-ENT-0580' AND "entity_type" IS 'work' AND "name_zh" IS '《批评文集》' AND "original_name" IS 'Crítica' AND "canonical_status" IS 'candidate' AND "origin_count" IS '1' AND "origin_refs" IS 'WCD10-B08-W134' AND "normalization_basis" IS '后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。' AND "issue_codes" IS 'PROVISIONAL-ZH-DISPLAY')=1 THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM content_cards WHERE "card_id" IS 'V1-CARD-0513' AND "origin_card_id" IS 'WCD-10-B08:V1-ENT-0580' AND "subject_id" IS 'V1-ENT-0580' AND "card_type" IS 'work' AND "title_zh" IS '《批评文集》' AND "author_label" IS '马查多·德·阿西斯' AND "original_title" IS 'Crítica' AND "country_or_region" IS '巴西' AND "language" IS 'pt' AND "period_bucket" IS '1910' AND "genre_or_form" IS 'critical_anthology' AND "input_layer" IS 'WCD-10-B08' AND "source_minimum_status" IS 'research_gap' AND "issue_code" IS 'RESEARCH-ONLY-NOT-CURATED' AND "content_markdown" IS '### 《批评文集》｜Crítica

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1910
- genre_or_form：critical_anthology
- one_sentence_summary：Mário de Alencar 编辑的1910年遗著选集；目录从《Instinto de nacionalidade》《Guilherme Malta》《Castro Alves》列至评论与序文，篇目性质为文学批评及序言。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。')=1 THEN 1 ELSE 0 END);
UPDATE entities SET entity_type='collection' WHERE entity_id='V1-ENT-0580';
UPDATE content_cards SET card_type='collection',content_markdown='### 《批评文集》｜Crítica

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1910
- genre_or_form：critical_anthology
- one_sentence_summary：Mário de Alencar 编辑的1910年遗著选集；目录从《Instinto de nacionalidade》《Guilherme Malta》《Castro Alves》列至评论与序文，篇目性质为文学批评及序言。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。' WHERE card_id='V1-CARD-0513';
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT entity_type FROM entities WHERE entity_id='V1-ENT-0580')='collection' THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM entities WHERE "entity_id" IS 'V1-ENT-0581' AND "entity_type" IS 'work' AND "name_zh" IS '《其他遗珍》' AND "original_name" IS 'Outras relíquias' AND "canonical_status" IS 'candidate' AND "origin_count" IS '1' AND "origin_refs" IS 'WCD10-B08-W135' AND "normalization_basis" IS '后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。' AND "issue_codes" IS 'PROVISIONAL-ZH-DISPLAY')=1 THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM content_cards WHERE "card_id" IS 'V1-CARD-0514' AND "origin_card_id" IS 'WCD-10-B08:V1-ENT-0581' AND "subject_id" IS 'V1-ENT-0581' AND "card_type" IS 'work' AND "title_zh" IS '《其他遗珍》' AND "author_label" IS '马查多·德·阿西斯' AND "original_title" IS 'Outras relíquias' AND "country_or_region" IS '巴西' AND "language" IS 'pt' AND "period_bucket" IS '1910' AND "genre_or_form" IS 'mixed_prose_poetry_collection' AND "input_layer" IS 'WCD-10-B08' AND "source_minimum_status" IS 'research_gap' AND "issue_code" IS 'RESEARCH-ONLY-NOT-CURATED' AND "content_markdown" IS '### 《其他遗珍》｜Outras relíquias

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1910
- genre_or_form：mixed_prose_poetry_collection
- one_sentence_summary：1910年Garnier卷的目录列八篇散文及六篇诗作（含《O Almada》《Réfus》）；卷首说明称收录故事、诗和散页，来自作者创作较成熟作品的时期。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。')=1 THEN 1 ELSE 0 END);
UPDATE entities SET entity_type='collection' WHERE entity_id='V1-ENT-0581';
UPDATE content_cards SET card_type='collection',content_markdown='### 《其他遗珍》｜Outras relíquias

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1910
- genre_or_form：mixed_prose_poetry_collection
- one_sentence_summary：1910年Garnier卷的目录列八篇散文及六篇诗作（含《O Almada》《Réfus》）；卷首说明称收录故事、诗和散页，来自作者创作较成熟作品的时期。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。' WHERE card_id='V1-CARD-0514';
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT entity_type FROM entities WHERE entity_id='V1-ENT-0581')='collection' THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM entities WHERE "entity_id" IS 'V1-ENT-0582' AND "entity_type" IS 'work' AND "name_zh" IS '《马查多·德·阿西斯书信集》' AND "original_name" IS 'Correspondência de Machado de Assis' AND "canonical_status" IS 'candidate' AND "origin_count" IS '1' AND "origin_refs" IS 'WCD10-B08-W136' AND "normalization_basis" IS '后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。' AND "issue_codes" IS 'PROVISIONAL-ZH-DISPLAY')=1 THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM content_cards WHERE "card_id" IS 'V1-CARD-0515' AND "origin_card_id" IS 'WCD-10-B08:V1-ENT-0582' AND "subject_id" IS 'V1-ENT-0582' AND "card_type" IS 'work' AND "title_zh" IS '《马查多·德·阿西斯书信集》' AND "author_label" IS '马查多·德·阿西斯' AND "original_title" IS 'Correspondência de Machado de Assis' AND "country_or_region" IS '巴西' AND "language" IS 'pt' AND "period_bucket" IS '1932' AND "genre_or_form" IS 'correspondence_collection' AND "input_layer" IS 'WCD-10-B08' AND "source_minimum_status" IS 'research_gap' AND "issue_code" IS 'RESEARCH-ONLY-NOT-CURATED' AND "content_markdown" IS '### 《马查多·德·阿西斯书信集》｜Correspondência de Machado de Assis

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1932
- genre_or_form：correspondence_collection
- one_sentence_summary：Fernando Nery 1932年编注的通信集，约232项，收入 Machado 致 Nabuco、Veríssimo、Mário de Alencar、Lúcio de Mendonça等人的信，也包括若干收信人的回复。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。')=1 THEN 1 ELSE 0 END);
UPDATE entities SET entity_type='collection' WHERE entity_id='V1-ENT-0582';
UPDATE content_cards SET card_type='collection',content_markdown='### 《马查多·德·阿西斯书信集》｜Correspondência de Machado de Assis

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1932
- genre_or_form：correspondence_collection
- one_sentence_summary：Fernando Nery 1932年编注的通信集，约232项，收入 Machado 致 Nabuco、Veríssimo、Mário de Alencar、Lúcio de Mendonça等人的信，也包括若干收信人的回复。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。' WHERE card_id='V1-CARD-0515';
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT entity_type FROM entities WHERE entity_id='V1-ENT-0582')='collection' THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM entities WHERE "entity_id" IS 'V1-ENT-0583' AND "entity_type" IS 'work' AND "name_zh" IS '《钟表匠的对话与随想》' AND "original_name" IS 'Diálogos e reflexões de um relojoeiro' AND "canonical_status" IS 'candidate' AND "origin_count" IS '1' AND "origin_refs" IS 'WCD10-B08-W137' AND "normalization_basis" IS '后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。' AND "issue_codes" IS 'PROVISIONAL-ZH-DISPLAY')=1 THEN 1 ELSE 0 END);
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT COUNT(*) FROM content_cards WHERE "card_id" IS 'V1-CARD-0516' AND "origin_card_id" IS 'WCD-10-B08:V1-ENT-0583' AND "subject_id" IS 'V1-ENT-0583' AND "card_type" IS 'work' AND "title_zh" IS '《钟表匠的对话与随想》' AND "author_label" IS '马查多·德·阿西斯' AND "original_title" IS 'Diálogos e reflexões de um relojoeiro' AND "country_or_region" IS '巴西' AND "language" IS 'pt' AND "period_bucket" IS '1956' AND "genre_or_form" IS 'chronicle_collection' AND "input_layer" IS 'WCD-10-B08' AND "source_minimum_status" IS 'research_gap' AND "issue_code" IS 'RESEARCH-ONLY-NOT-CURATED' AND "content_markdown" IS '### 《钟表匠的对话与随想》｜Diálogos e reflexões de um relojoeiro

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：chronicle_collection
- one_sentence_summary：1956年卷的副题说明其从《Gazeta de notícias》辑录1886年的“A + B”及1888—1889年的“Bons dias”；学术研究称收全“A + B”与除一篇外的“Bons Dias”，为“A + B”首个书本版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。')=1 THEN 1 ELSE 0 END);
UPDATE entities SET entity_type='collection' WHERE entity_id='V1-ENT-0583';
UPDATE content_cards SET card_type='collection',content_markdown='### 《钟表匠的对话与随想》｜Diálogos e reflexões de um relojoeiro

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：chronicle_collection
- one_sentence_summary：1956年卷的副题说明其从《Gazeta de notícias》辑录1886年的“A + B”及1888—1889年的“Bons dias”；学术研究称收全“A + B”与除一篇外的“Bons Dias”，为“A + B”首个书本版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。' WHERE card_id='V1-CARD-0516';
INSERT INTO wcd10_type_guard VALUES(CASE WHEN (SELECT entity_type FROM entities WHERE entity_id='V1-ENT-0583')='collection' THEN 1 ELSE 0 END);
UPDATE metadata SET value='WCD-10-TYPE-CORRECTION' WHERE key='last_change_set';
DROP TABLE wcd10_type_guard;
