# 外部 AI 模板目录

所有任务在使用模板前必须先阅读仓库根目录 `PROJECT_CHARTER.md`。该文件未经用户明确授权不得修改、移动、重命名或删除。

使用方法：为每个任务建立 `<TASK-ID>_<任务主题>/` 目录，将本目录模板复制进去，并按任务类型保留所需文件。

复制时按以下方式重命名：

| 模板 | 任务目录中的名称 |
|---|---|
| `TASK_README_TEMPLATE.md` | `README.md` |
| `STATUS_TEMPLATE.md` | `STATUS.md` |
| `QA_REPORT_TEMPLATE.md` | `QA_REPORT.md` |
| `ISSUES_TEMPLATE.md` | `ISSUES.md` |
| `HANDOFF_TEMPLATE.md` | `HANDOFF.md` |
| `LITE_HANDOFF_TEMPLATE.md` | `HANDOFF.md`（LITE 任务） |
| `MANIFEST_TEMPLATE.md` | `MANIFEST.md` |
| `SOURCE_RECORD_TEMPLATE.md` | `SOURCE_RECORD.md` |
| `OCR_TEMPLATE.md` | `OCR.md` |
| `REVIEW_TEMPLATE.md` | `REVIEW.md` |
| `ENTITY_CANDIDATES_TEMPLATE.csv` | `ENTITY_CANDIDATES.csv` |
| `RELATION_CANDIDATES_TEMPLATE.csv` | `RELATION_CANDIDATES.csv` |
| `SOURCE_MANIFEST_TEMPLATE.csv` | `SOURCE_MANIFEST.csv` |

任务卡必须声明 `package_profile`：

- `LITE`：`README.md`、主体成果、`HANDOFF.md`；HANDOFF 合并状态、QA、问题和文件清单。
- `FULL`：`README.md`、`STATUS.md`、`QA_REPORT.md`、`ISSUES.md`、`HANDOFF.md`、`MANIFEST.md` 和主体成果；独立复核另含 `REVIEW.md`。

按任务增加：`SOURCE_RECORD.md`、`OCR.md`、`ENTITY_CANDIDATES.csv`、`RELATION_CANDIDATES.csv` 或 `REVIEW.md`。默认只要求来源级证据，页码和章节为可选增强信息。

交付前运行：

```bash
python3 scripts/validate_external_delivery.py <交付目录> --profile LITE
# 或 --profile FULL
```

将输出的 `result`、CSV 行列数、errors 和 warnings 摘要写入 HANDOFF。

外部 AI 不得修改本模板原件，应在任务目录中填写副本。
