# V1.0.0 发布快照数据字典

- Schema：0.3；N3 已批准并实现 BASED_ON_EVENT（work→event）加法升级。
- 所有 V1-ENT / V1-REL / V1-FCT / V1-CARD ID 在 V1.0.0 发布时冻结；后续修改必须通过版本化迁移、动态 QA 和新的版本记录，不得静默覆盖本快照。

## 逻辑表

### sources（74 行）

字段：source_id、temporary_id、title、original_title、author_or_editor、translator、publisher、publication_year、isbn、format、page_count、language、source_level、processing_status、source_task、public_content_scope、local_asset_status、persistent_id、canonical_url。

### source_holds（4 行）

字段：source_hold_id、candidate_id、title、source_level、source_task、hold_reason。

### entities（144 行）

字段：entity_id、entity_type、name_zh、original_name、canonical_status、origin_count、origin_refs、normalization_basis、issue_codes。

### entity_id_map（146 行）

字段：mapping_id、preview_entity_ref、origin_layer、origin_ref、entity_id、mapping_action、mapping_basis。

### relationships（76 行）

字段：relationship_id、origin_layer、origin_relation_group_id、subject_id、relation_type、object_id、description_zh、confidence、review_status、upstream_review_status、evidence_count、issue_code。

### relationship_evidence（91 行）

字段：evidence_id、relationship_id、origin_evidence_id、source_id、source_title、locator、evidence_note、confidence、evidence_status、evidence_origin。

### relationship_sources（88 行）

字段：relationship_id、source_id。

### relation_holds（40 行）

字段：relation_hold_id、origin_layer、origin_relation_group_id、subject_id、relation_type、object_id、description_zh、confidence、review_status、evidence_count、issue_code。

### relation_hold_evidence（40 行）

字段：evidence_id、relation_hold_id、origin_evidence_id、source_id、source_title、locator、evidence_note、confidence、evidence_status。

### facts（238 行）

字段：fact_id、origin_material_id、card_id、subject_id、fact_field、value_text、material_class、origin_id、confidence、admission_status、usage_note。

### fact_sources（238 行）

字段：fact_id、source_id、source_title。

### content_cards（40 行）

字段：card_id、origin_card_id、subject_id、card_type、title_zh、author_label、original_title、country_or_region、language、period_bucket、genre_or_form、input_layer、source_minimum_status、issue_code、content_markdown。

### card_facts（238 行）

字段：card_id、fact_id、admission_status。

### card_sources（80 行）

字段：card_source_id、origin_matrix_id、card_id、source_id、source_level、source_role、bibliographic_support、research_support、independent_source_key、usage_status、issue_code。

### gaps（13 行）

字段：gap_id、origin_gap_id、gap_type、gap_key、current_status、evidence_basis、attempts_or_count、owner_decision、downstream_effect、issue_code。

### n3_decisions（4 行）

字段：decision_id、decision_topic、current_state、evidence_summary、options、codex_recommendation、user_decision_required、downstream_effect、user_choice、decision_status、decided_at。

### legacy_relation_groups（15 行）

字段：legacy_group_id、subject_canonical_ref、subject_label、relation_type、object_canonical_ref、object_label、endpoint_signature、source_ids、independent_source_count、evidence_class、raw_row_ids、duplicate_of_current_group、group_status、net_new_eligible、issue_code、rationale。
