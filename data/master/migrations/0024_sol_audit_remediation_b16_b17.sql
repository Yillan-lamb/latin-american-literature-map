-- SOL-AUDIT-REMEDIATION B16-B17.
-- Corrects two false/open disputes, source-to-fact mappings, source grading,
-- and Chinese display names without rewriting Luna's historical migrations.

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0277','SOL-B16-B17-SRC-01','O registro civil de Lygia Fagundes Telles','O registro civil de Lygia Fagundes Telles','Arpen/SP; ANOREG/BR','','ANOREG/BR','2022','','web_page','','pt','B','access_pass','SOL-AUDIT-REMEDIATION-B16-B17','Civil-registry association report based on the 11th Civil Registry of São Paulo: Lygia Fagundes Telles was born on 19 April 1918','remote_only','','https://www.anoreg.org.br/site/o-registro-civil-de-lygia-fagundes-telles/'),
('SRC-0278','SOL-B16-B17-SRC-02','智利作家路易斯·塞普尔维达因新冠肺炎去世','智利作家路易斯·塞普尔维达因新冠肺炎去世','中国作家网','','中国作家协会','2020','','web_page','','zh','C','access_pass','SOL-AUDIT-REMEDIATION-B16-B17','Chinese display-name support for 路易斯·塞普尔维达, 《读爱情故事的老人》 and 《教海鸥飞翔的猫》; also supports death in 2020','remote_only','','https://www.chinawriter.com.cn/n1/2020/0416/c404090-31676734.html'),
('SRC-0279','SOL-B16-B17-SRC-03','湖南大学图书馆书目检索：Mundo del fin del mundo','湖南大学图书馆书目检索：Mundo del fin del mundo','湖南大学图书馆','','湖南大学图书馆','','','catalog_record','','zh','B','access_pass','SOL-AUDIT-REMEDIATION-B16-B17','Library-catalogue support for the published Chinese display title 《世界尽头的世界》','remote_only','','https://opac.hnu.edu.cn/opac/search?f_subject=%E7%8E%B0%E4%BB%A3&isFacet=true&logical0=AND&q=Mundo&rows=10&searchType=standard&searchWay0=marc&sortOrder=desc&sortWay=score&view=standard'),
('SRC-0280','SOL-B16-B17-SRC-04','瓜达卢佩·内特尔作品（三册）','瓜达卢佩·内特尔作品（三册）','新华文轩网络书店','','广西师范大学出版社','2025','','catalog_record','','zh','C','access_pass','SOL-AUDIT-REMEDIATION-B16-B17','Published Chinese-title support for 《独生女儿》《真正的孤独》《红鱼之姻》; display/bibliographic use only','remote_only','','https://www.96192.com/product/detail/1177695');

-- The Universidad de Carabobo page republishes a BuscaBiografias text. It is
-- usable for low-risk corroboration but is not an independent B-level source.
UPDATE sources
SET source_level='C',
    public_content_scope='Republished biographical note attributed on-page to BuscaBiografias; low-risk corroboration only, not independent support for strong claims'
WHERE source_id='SRC-0276';
UPDATE card_sources SET source_level='C' WHERE source_id='SRC-0276';

-- The 1989 Júcar and 1993 Tusquets records are distinct editions, not a date
-- conflict. Keep the correctly scoped first-book-edition fact and close the gap.
UPDATE facts
SET confidence='high',
    usage_note='BNE and Memoria Chilena identify the Madrid Júcar 1989 book edition; the 1993 Tusquets record is a later edition, not conflicting evidence.'
WHERE fact_id='V1-FCT-0930';
UPDATE entities
SET issue_codes='NONE',
    normalization_basis='BNE and Memoria Chilena identify the 1989 Madrid Júcar edition; the 1993 Tusquets record is a later edition. Published Chinese display title is supported by SRC-0278.'
WHERE entity_id='V1-ENT-0347';
UPDATE content_cards SET issue_code='NONE' WHERE card_id='V1-CARD-0233';
UPDATE relationships SET issue_code='NONE' WHERE relationship_id='V1-REL-0272';
UPDATE gaps
SET current_status='verified',
    evidence_basis='SRC-0261/BNE and Memoria Chilena identify a Madrid Júcar 1989 edition; SRC-0262 identifies a later 1993 Tusquets edition. The records describe distinct editions and do not conflict.',
    attempts_or_count='2',
    owner_decision='CODEX-SOL-AUDIT',
    downstream_effect='Use first_book_edition_year=1989; retain 1993 only as later-edition context.',
    issue_code='NONE'
WHERE gap_id='V1-GAP-0023';

-- Civil-registry evidence and the Biblioteca Nacional authority record resolve
-- Lygia's birth year as 1918; the ABL 1923 profile remains as historical context.
UPDATE facts
SET value_text='1918', origin_id='SRC-0277', confidence='high',
    usage_note='Civil-registry record reported by Arpen/SP and ANOREG/BR establishes 19 April 1918; Biblioteca Nacional authority data independently records 1918–2022.'
WHERE fact_id='V1-FCT-0962';
INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-0962','SRC-0277','O registro civil de Lygia Fagundes Telles');
UPDATE entities
SET issue_codes='NONE',
    normalization_basis='ABL bibliography establishes the author and selected works; civil-registry evidence and Biblioteca Nacional authority data resolve the birth year as 1918.'
WHERE entity_id='V1-ENT-0358';
UPDATE content_cards SET period_bucket='1918–2022', issue_code='NONE' WHERE card_id='V1-CARD-0244';
UPDATE relationships SET issue_code='NONE' WHERE relationship_id='V1-REL-0284';
UPDATE gaps
SET current_status='verified',
    evidence_basis='SRC-0277 reports the São Paulo civil-registry birth record dated 19 April 1918; SRC-0272 Biblioteca Nacional independently records 1918–2022. SRC-0270 preserves the older 1923 ABL profile as historical discrepancy, not an equal unresolved candidate.',
    attempts_or_count='2',
    owner_decision='CODEX-SOL-AUDIT',
    downstream_effect='Use birth_year=1918 at high confidence; remove public dispute markers while retaining the older ABL record in provenance.',
    issue_code='NONE'
WHERE gap_id='V1-GAP-0024';

-- The CCE catalogue proves title/author association, but the UCE thesis is the
-- source that explicitly supplies the three dates and forms.
UPDATE facts
SET origin_id='SRC-0274',
    usage_note=CASE fact_field
      WHEN 'first_publication_year' THEN 'UCE thesis explicitly lists the work and publication year.'
      WHEN 'genre_or_form' THEN 'UCE thesis explicitly lists the title among Jorge Icaza''s novels.'
      ELSE 'UCE thesis supports the work-level bibliographic entity.'
    END
WHERE fact_id BETWEEN 'V1-FCT-0981' AND 'V1-FCT-0989';
INSERT OR IGNORE INTO fact_sources (fact_id,source_id,source_title)
SELECT fact_id,'SRC-0274','Análisis comparativo dialectal de los cuentos El malo de Enrique Gil Gilbert y Barranca Grande de Jorge Icaza'
FROM facts WHERE fact_id BETWEEN 'V1-FCT-0981' AND 'V1-FCT-0989';

-- Add the missing formal fact behind the already displayed 1949–2020 period.
INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-1004','SOL-AUDIT-REMEDIATION-B16-B17','V1-CARD-0232','V1-ENT-0344','death_year','2020','fact','SRC-0278','high','candidate_for_staging_review','China Writers Net obituary records Luis Sepúlveda''s death in 2020.');
INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-1004','SRC-0278','智利作家路易斯·塞普尔维达因新冠肺炎去世');
INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0232','V1-FCT-1004','candidate_for_staging_review');

-- Replace provisional/awkward Chinese labels with documented published usage.
UPDATE entities SET name_zh='路易斯·塞普尔维达', normalization_basis='Published Chinese author spelling supported by China Writers Net; original name retained.' WHERE entity_id='V1-ENT-0344';
UPDATE entities SET name_zh='《读爱情故事的老人》', normalization_basis='Published Chinese title supported by China Writers Net; original title and 1989 edition evidence retained.', issue_codes='NONE' WHERE entity_id='V1-ENT-0347';
UPDATE entities SET name_zh='《教海鸥飞翔的猫》', normalization_basis='Published Chinese title supported by China Writers Net; original title retained.' WHERE entity_id='V1-ENT-0348';
UPDATE entities SET name_zh='《世界尽头的世界》', normalization_basis='Published Chinese title supported by a university library catalogue; original title retained.' WHERE entity_id='V1-ENT-0349';
UPDATE entities SET normalization_basis='Published Chinese title in the 2025 Guangxi Normal University Press three-volume set; original title and 2008 source record retained.' WHERE entity_id='V1-ENT-0352';

UPDATE content_cards
SET title_zh=CASE subject_id
      WHEN 'V1-ENT-0344' THEN '路易斯·塞普尔维达'
      WHEN 'V1-ENT-0347' THEN '《读爱情故事的老人》'
      WHEN 'V1-ENT-0348' THEN '《教海鸥飞翔的猫》'
      WHEN 'V1-ENT-0349' THEN '《世界尽头的世界》'
      ELSE title_zh END,
    author_label=REPLACE(author_label,'路易斯·塞普尔韦达','路易斯·塞普尔维达'),
    content_markdown=REPLACE(REPLACE(REPLACE(REPLACE(content_markdown,
      '路易斯·塞普尔韦达','路易斯·塞普尔维达'),
      '《一个老人读爱情小说》','《读爱情故事的老人》'),
      '《一只海鸥和教它飞翔的猫》','《教海鸥飞翔的猫》'),
      '《世界尽头》','《世界尽头的世界》')
WHERE subject_id IN ('V1-ENT-0344','V1-ENT-0347','V1-ENT-0348','V1-ENT-0349');

UPDATE relationships
SET description_zh=REPLACE(REPLACE(REPLACE(REPLACE(description_zh,
    '路易斯·塞普尔韦达','路易斯·塞普尔维达'),
    '《一个老人读爱情小说》','《读爱情故事的老人》'),
    '《一只海鸥和教它飞翔的猫》','《教海鸥飞翔的猫》'),
    '《世界尽头》','《世界尽头的世界》')
WHERE relationship_id IN ('V1-REL-0272','V1-REL-0273','V1-REL-0274','V1-REL-0281');
UPDATE relationship_evidence
SET evidence_note=REPLACE(REPLACE(REPLACE(REPLACE(evidence_note,
    '路易斯·塞普尔韦达','路易斯·塞普尔维达'),
    '《一个老人读爱情小说》','《读爱情故事的老人》'),
    '《一只海鸥和教它飞翔的猫》','《教海鸥飞翔的猫》'),
    '《世界尽头》','《世界尽头的世界》')
WHERE relationship_id IN ('V1-REL-0272','V1-REL-0273','V1-REL-0274','V1-REL-0281');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0498','SOL-AUDIT-B16-B17','V1-CARD-0244','SRC-0277','B','research','yes','yes','SRC-0277','used','NONE'),
('V1-CS-0499','SOL-AUDIT-B16-B17','V1-CARD-0232','SRC-0278','C','display_and_fact','yes','yes','SRC-0278','used','NONE'),
('V1-CS-0500','SOL-AUDIT-B16-B17','V1-CARD-0233','SRC-0278','C','display','yes','no','SRC-0278','used','NONE'),
('V1-CS-0501','SOL-AUDIT-B16-B17','V1-CARD-0234','SRC-0278','C','display','yes','no','SRC-0278','used','NONE'),
('V1-CS-0502','SOL-AUDIT-B16-B17','V1-CARD-0235','SRC-0279','B','display','yes','no','SRC-0279','used','NONE'),
('V1-CS-0503','SOL-AUDIT-B16-B17','V1-CARD-0237','SRC-0280','C','display','yes','no','SRC-0280','used','NONE'),
('V1-CS-0504','SOL-AUDIT-B16-B17','V1-CARD-0238','SRC-0280','C','display','yes','no','SRC-0280','used','NONE'),
('V1-CS-0505','SOL-AUDIT-B16-B17','V1-CARD-0239','SRC-0280','C','display','yes','no','SRC-0280','used','NONE');

UPDATE metadata SET value='SOL-AUDIT-REMEDIATION-B16-B17' WHERE key='last_change_set';
UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';
UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';
