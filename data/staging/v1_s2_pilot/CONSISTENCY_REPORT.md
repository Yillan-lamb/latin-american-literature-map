# V1-S2 试点正式暂存一致性报告

- schema_version: `0.2-n2-review`
- sqlite_version: `3.53.1`
- SQLite integrity_check: `ok`
- SQLite foreign_key_check: `0`

## 表计数与规范化 SHA-256

| 逻辑表 | 行数 | SHA-256 |
|---|---:|---|
| sources | 11 | `9f7b044af50320dbc3af83a4e8b532be14e0ed94780782824cb718aca6ef148f` |
| entities | 28 | `b7a096e50beba5b1a1cc86bb57a4e525d7bfc6132cbd21209f268b90ee521d86` |
| entity_id_map | 28 | `ed35d83d434ba3ecb5d3c9b03e7864757df630a4f00369c595051f0835d531b0` |
| relationships | 15 | `3fca5c55c8120f67810969947dadac4c096bdf77c4410e48bde4c61c245c0fde` |
| relationship_evidence | 16 | `dc198eb67df7054c72c82c62f2599141a1c5501eebf4cbcbc9b3d16aaaad2347` |
| relationship_sources | 16 | `34a953662cc1b508349956f06fe614231188ecc7ece84abf2b8471b4791e5a5a` |
| relation_holds | 11 | `172b23182c40faeaa5fee4ef4ecc00f99dccf7560e1bd040ce0b76a27201d066` |
| relation_hold_evidence | 11 | `6c8fc5be3138533f991b47d0306716faba3141e02ba8587a5dd817e51204c952` |
| facts | 52 | `fa0ff1e6a4129c8c434717c24410aee698712be6ea75b78eb82125badc93cd28` |
| fact_sources | 52 | `d78251d768fe67dd116ebf52b2deded467e0f327f3d39804d9bb185663e7b99d` |
| content_cards | 9 | `0b18c836845c1db6602fd85676ca7cdf0e8a6cee60738999ef2c292123a4b4b6` |
| card_facts | 49 | `e32922940338294edd886ff33c6399b9e60285b529f55accde7c4bfed6fc3e5a` |
| card_sources | 15 | `6ae79787361440ce375611a57eb2100b0156829f6c31b33c7462daa71c09e97a` |

## 门禁结论

- 28 个实体、15 个 N2 可审核关系、11 个待第二来源关系。
- 52 条事实、9 张内容卡、11 个来源。
- 所有来源、端点、事实和卡片引用由 SQLite 外键约束。
- 跨环境可重复构建以逐表规范化哈希、完整性和外键结果为准，不要求 SQLite 文件原始哈希一致。
