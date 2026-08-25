# 网站架构与数据流

网站采用静态优先结构。Research Database 与策展数据先生成 Web Data，再由 `site/` 中的前端消费；研究事实不在 JavaScript 中维护第二份副本。

```text
Research Data + Curation Data + Geo Data
                    ↓
                 Web Data
                    ↓
          Static Frontend / Routes
                    ↓
              QA / Deployment
```

## 主要入口

- [技术选型与基础框架](./V2_TECHNICAL_FOUNDATION.md)
- [Web Data Schema 与构建流程](./V2_WEB_DATA_SCHEMA.md)
- [前端运行说明](../../site/README.md)
- [浏览器与部署工作流](../../.github/workflows/v2-ci.yml)

阶段性原型、RC、浏览器 QA 和发布门禁记录位于 [`project/audits/`](../../project/audits/)。
