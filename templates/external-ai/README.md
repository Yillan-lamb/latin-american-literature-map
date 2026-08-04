# 外部 AI 模板目录

使用方法：为每个任务建立 `<TASK-ID>_<任务主题>/` 目录，将本目录模板复制进去，并按任务类型保留所需文件。

复制时按以下方式重命名：

| 模板 | 任务目录中的名称 |
|---|---|
| `TASK_README_TEMPLATE.md` | `README.md` |
| `STATUS_TEMPLATE.md` | `STATUS.md` |
| `QA_REPORT_TEMPLATE.md` | `QA_REPORT.md` |
| `ISSUES_TEMPLATE.md` | `ISSUES.md` |
| `HANDOFF_TEMPLATE.md` | `HANDOFF.md` |
| `MANIFEST_TEMPLATE.md` | `MANIFEST.md` |
| `SOURCE_RECORD_TEMPLATE.md` | `SOURCE_RECORD.md` |
| `OCR_TEMPLATE.md` | `OCR.md` |
| `REVIEW_TEMPLATE.md` | `REVIEW.md` |
| `ENTITY_CANDIDATES_TEMPLATE.csv` | `ENTITY_CANDIDATES.csv` |
| `RELATION_CANDIDATES_TEMPLATE.csv` | `RELATION_CANDIDATES.csv` |
| `SOURCE_MANIFEST_TEMPLATE.csv` | `SOURCE_MANIFEST.csv` |

最低必需文件：

- `README.md`
- `STATUS.md`
- `QA_REPORT.md`
- `ISSUES.md`
- `HANDOFF.md`
- `MANIFEST.md`

按任务增加：`SOURCE_RECORD.md`、`OCR.md`、`ENTITY_CANDIDATES.csv`、`RELATION_CANDIDATES.csv` 或 `REVIEW.md`。

外部 AI 不得修改本模板原件，应在任务目录中填写副本。
