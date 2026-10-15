# WCD-10-B14 验证记录（TASK-119）

## 实际数据库

- 基线数据库SHA-256：`c7b5951beb2e2a30053b08d84e07931547b8909a1e5a180086fafeedebaea677`。
- 实际B14主库SHA-256：`651f89688eeba195a4332ee6611cc51478c2c3aeae7fd5b2391069283a0cea92`；迁移`0049_wcd10_b14_author_works.sql`只apply一次，exit code 0。
- 检查结论：母方实际数据审核411项全部PASS；SQLite integrity `ok`，foreign-key errors为0；旧行保全；migration log绑定TASK-119、reviewer和精确SQL SHA。
- 当前表总量与本批实际增量：

| 表 | 实际总量 | B14增量 |
| --- | ---: | ---: |
| `card_facts` | 2304 | +51 |
| `card_sources` | 1391 | +29 |
| `content_cards` | 686 | +14 |
| `entities` | 696 | +14 |
| `entity_id_map` | 694 | +14 |
| `fact_sources` | 2864 | +96 |
| `facts` | 2325 | +51 |
| `gaps` | 523 | +25 |
| `legacy_relation_groups` | 15 | +0 |
| `metadata` | 16 | +0 |
| `migration_log` | 49 | +1 |
| `n3_decisions` | 4 | +0 |
| `relation_hold_evidence` | 58 | +0 |
| `relation_holds` | 51 | +0 |
| `relationship_evidence` | 1012 | +28 |
| `relationship_sources` | 1041 | +28 |
| `relationships` | 668 | +17 |
| `source_holds` | 4 | +0 |
| `sources` | 731 | +9 |

逐表和字段级检查见[/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/ACTUAL_DATA_INDEPENDENT_REVIEW.json](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/ACTUAL_DATA_INDEPENDENT_REVIEW.json)。B14增量另核为14 entities、14 entity_id_map、14 content_cards、51 facts、96 fact_sources、29 card_sources、17 relationships、28 relationship_sources、28 relationship_evidence、25 gaps及9 sources；2条existing source reuse不增加sources总量。

## 必要QA

正式post-apply wrapper执行16步，全部exit code 0：`before_public_snapshot_compare`, `validate_master_before_export`, `checkpoint_export`, `repeat_export`, `export_repeat_compare`, `build_web_data`, `build_deploy_bundle`, `validate_generated_web_data`, `validate_deploy_bundle`, `validate_content_quality`, `reviewed_checkpoint_qa`, `public_artifact_byte_compare`, `copy_after_public_web_jsons`, `validate_copied_web_data`, `full_49_migration_replay`, `validate_master_final`。其检查覆盖checkpoint前后快照、主库验证、19表三格式导出及其确定性比较、部署包和内容质量、审核绑定、公共数据字节比较、两份Web JSON精确复制与验证、49个迁移全量重放和最终主库验证。QA报告为[/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/INTEGRATOR_APPLY_QA.json](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/INTEGRATOR_APPLY_QA.json)；checkpoint QA为[/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/work/codex-worktrees/latin-american-literature-map-wcd10/work/wcd10-qa/B14_CHECKPOINT_QA.json](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/work/codex-worktrees/latin-american-literature-map-wcd10/work/wcd10-qa/B14_CHECKPOINT_QA.json)。

- 全量迁移链：49 migrations / 19 tables，SQLite完整性正常、外键错误0；全量重放命令的实际流保存在[`B14_MIGRATION_REPLAY.log`](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/work/codex-worktrees/latin-american-literature-map-wcd10/work/wcd10-qa/B14_MIGRATION_REPLAY.log)。
- 导出：JSON、CSV、XLSX各19张表；22个重复导出文件逐字节一致。
- Web：177个公共部署文件逐字节一致；新增B14对象公开数为0，公开实体保持127；`manifest.json`和`site_data.json`的验证后副本逐字节一致。
- checkpoint：`Research 1.5.0 development candidate`，不代表正式Data release；未改变Public Release暂停状态。

SQL审查记录为[/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/SQL_INDEPENDENT_REVIEW.json](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/SQL_INDEPENDENT_REVIEW.json)（401项通过），实际数据审查记录为[/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/ACTUAL_DATA_INDEPENDENT_REVIEW.json](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/project/internal/WCD_10_WORKSPACE/B14/ACTUAL_DATA_INDEPENDENT_REVIEW.json)（411项通过）；审核Gate和checkpoint Gate分别见[/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/work/codex-worktrees/latin-american-literature-map-wcd10/data/changesets/WCD-10/B14/REVIEW_GATE.json](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/work/codex-worktrees/latin-american-literature-map-wcd10/data/changesets/WCD-10/B14/REVIEW_GATE.json)及[/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/work/codex-worktrees/latin-american-literature-map-wcd10/data/changesets/WCD-10/B14/CHECKPOINT_REVIEW.json](/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/work/codex-worktrees/latin-american-literature-map-wcd10/data/changesets/WCD-10/B14/CHECKPOINT_REVIEW.json)。本轮无apply失败或正式QA失败；合包和只读读取器的早期错误详见[AUDIT.md](./AUDIT.md)。
