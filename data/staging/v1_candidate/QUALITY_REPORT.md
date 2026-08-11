# V1 候选包质量报告

- 构建结果：pass
- SQLite integrity_check：ok
- SQLite foreign_key_check：0
- 关系词：全部属于 Schema 0.3 的 13 词；BASED_ON_EVENT 仅有 1 条 work→event。
- 关系规模：76/75，V1 门槛满足；150 为 V1.1 扩展目标；hold、legacy 和 pending 均未补数。
- 事实分层：accepted_for_n2×50、batch_retained_candidate×161、candidate_for_staging_review×20、hold×2、research_note_only×1、gap×2、not_work_level×1、pending_n3×1。

## 表计数与规范化 SHA-256

| 表 | 行数 | SHA-256 |
|---|---:|---|
| sources | 74 | 53fe7745c72347aacf3be4f7203402728f9d15a6e90e2ff5e77e8e21e0069d13 |
| source_holds | 4 | bf3f5d77090f6e12b837c1ee1db68e1bf1e8ddc01d690f4b23ff2b429af840ff |
| entities | 144 | 05f80fb895d9a43d26834c3d6a32259cc0697adc5c114c927a680e936563b870 |
| entity_id_map | 146 | fe6d44e5cda551e871b85b3899dc6c57b72bcf6e97b6aff274091ebfe28d5b2a |
| relationships | 76 | bbe2ee45932d0773b3021416bc3637dd21a7304df2c28089d6c720a3634d3371 |
| relationship_evidence | 91 | ac4cd0a22f8d1fe458b44c230f2382f68696bf2026ebab43a505cd812646195d |
| relationship_sources | 88 | 26266986f0dc6cbdb3944d74b0b5c7685dd9e05fdafc9da5e8474e58e06d7fe4 |
| relation_holds | 40 | edad5e5c2393860ec0b447c5b7de38bb8b41a98bed4fdaae435905a6b093fbd4 |
| relation_hold_evidence | 40 | ed2810e8b8c77e97e221cbb44a05441194b0b77ad83317764e97743cec473c10 |
| facts | 238 | 69e46539f3e1302a95b3e7be7aaeeee011a9ee3a828b877b0a8ddab47f2335c0 |
| fact_sources | 238 | 75ece4518058ebb2098dffc74f07d0d09d6cb435dade0e3e7cccbc7f6d67eae0 |
| content_cards | 40 | 490e1a60bc08e4493de95cbda09dcfec6161a4cc754bb3c378fb26ffe892c237 |
| card_facts | 238 | 90925a1b6ede79f181cc959a3006ae8fce6aa8f3bd323ec2bc9ad76ae2ef990f |
| card_sources | 80 | 5d9ae1c8554733985b6a8537c99d68ddd65f0a693f1a258c4e90ea1663435848 |
| gaps | 13 | 34ce334b06236b6a0c4284f7fd954be97bb095bdb23908ac0e310d5782f4ffa6 |
| n3_decisions | 4 | 09843f68afbda0391d3f5dfc42352b10a5488f1fd0e23e0b94ea2cb8364dcf63 |
| legacy_relation_groups | 15 | c3253516ca7b2c04200aee79e060a0487ab2ff41179a30077136e7ce6d762bb9 |