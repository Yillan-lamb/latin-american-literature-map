# SOURCE_NOTES：V1-S3-B02 文学爆炸与加勒比三作家来源级材料整理

- task_id: `V1-S3-B02`；produced_by: `EXT-AI-02`（ZCode / deepseek-v4-flash，版本 unknown）；2026-08-10；R1 修订同日
- 原则：只整理固定三作家（加西亚·马尔克斯、胡利奥·科塔萨尔、阿莱霍·卡彭铁尔）与九部固定作品直接相关的来源；每个来源记录页面标题、机构、URL、访问日期、语言、建议等级与访问状态；A/B 级共 12 个（A×10、B×2），D 级索引 3 个仅作发现线索；页码/章节为可选增强，未逐页录入。
- 访问核验：全部 15 个 URL 于 2026-08-10 实测（HTTP 200 或 DOI 重定向后 200 核验落地页；A 级论文另抓取摘要/PDF 首页核验内容；不下载全文交付）。

## B02-SRC-0001：Gabriel García Márquez y la ética en Cien años de soledad – I

- 机构/作者：Luis Carlos Herrera Molina, S.J. / Universitas Philosophica（Pontificia Universidad Javeriana, Bogotá）；语言：es；建议等级：A；类型：journal_article
- URL：http://revistas.javeriana.edu.co/index.php/vniphilosophica/article/view/13340
- 访问：2026-08-10 实测，状态 `ok`（落地页 200，摘要核验；不下载全文）
- 涉及作品：Cien años de soledad
- 中文释义：哥伦比亚哈维里亚纳大学《哲学大学》期刊 2015 年论文（vol.32 n.64）：以互文方法梳理《百年孤独》结构、人物与主题，论证其伦理源自圣经神话、构成作品统一工具并照见人性境况；分两期发表（本篇为第一期）。
- 说明：同行评审期刊；DOI 10.11144/javeriana.uph32-64.ggmc

## B02-SRC-0002：Miseria y violencia en El Coronel no tiene quien le escriba

- 机构/作者：Gloria Escobar Soriano / Encuentro（Universidad Centroamericana, Managua）；语言：es；建议等级：A；类型：journal_article
- URL：https://revistas.uca.edu.ni/index.php/Encuentro/article/view/3782
- 访问：2026-08-10 实测，状态 `ok`（DOI 重定向落地页 200，摘要核验）
- 涉及作品：El coronel no tiene quien le escriba
- 中文释义：尼加拉瓜中美洲大学《相遇》期刊 1999 年论文（n.48）：描述哥伦比亚社会某阶层的边缘化与贫困——上校等待来信、儿子奥古斯丁死于革命活动、抵押房屋与斗鸡维生、政治暴力加剧经济危机、拒绝卖鸡的被动抵抗。
- 说明：同行评审期刊；DOI 10.5377/encuentro.v0i48.3782

## B02-SRC-0003：Un relato sospechoso: Crónica de una muerte anunciada

- 机构/作者：René Campos / Atenea（Universidad de Concepción）；语言：es；建议等级：A；类型：journal_article
- URL：https://revistas.udec.cl/index.php/atenea/article/view/17898
- 访问：2026-08-10 实测，状态 `ok`（落地页 200；开放 PDF 首页核验内容）
- 涉及作品：Crónica de una muerte anunciada
- 中文释义：智利康塞普西翁大学《雅典娜》期刊 1998 年论文（n.477, pp.221-238）：表面侦探小说结构实为反讽——重建的凶案只是前文本，真正探究导致圣地亚哥·纳萨尔（原文 Santiago Nazar）被复仇杀害的原始之罪，罪责归属悬空；开篇引 P.D. James 论“死者之谜的中心”。
- 说明：同行评审期刊；DOI 10.29393/At477-11RSRC10011

## B02-SRC-0004：CVC. Actos culturales. Gabriel García Márquez

- 机构/作者：Centro Virtual Cervantes（Instituto Cervantes）；语言：es；建议等级：B；类型：institutional_web
- URL：https://cvc.cervantes.es/actcult/garcia_marquez/
- 访问：2026-08-10 实测，状态 `ok`（HTTP 200，页面正文核验）
- 涉及作品：Cien años de soledad
- 中文释义：塞万提斯虚拟中心 GGM 数字展览页：1982 年诺贝尔文学奖得主；生于加勒比哥伦比亚阿卡塔卡，该村落以马孔多之名“重生”；明确判断其为魔幻现实主义与西语文学最伟大代表之一；提供生平年表、作品轨迹（Aracataca→Macondo）与评论；展览 CD ISBN 84-689-6914-1。
- 说明：机构数字展页；“魔幻现实主义代表”为文学史判断（单来源，关系候选标 needs_second_source）

## B02-SRC-0005：The Nobel Prize in Literature 1982

- 机构/作者：NobelPrize.org（Nobel Prize Outreach）；语言：en；建议等级：B；类型：institutional_web
- URL：https://www.nobelprize.org/prizes/literature/1982/
- 访问：2026-08-10 实测，状态 `ok`（HTTP 200，页面内容核验）
- 涉及作品：Cien años de soledad
- 中文释义：诺贝尔奖官网 1982 年文学奖页：加西亚·马尔克斯获奖，获奖理由“for his novels and short stories, in which the fantastic and the realistic are combined in a richly composed world of imagination, reflecting a continent's life and conflicts”；附新闻稿与颁奖演讲链接。
- 说明：权威机构页；获奖理由原文可作为“奇幻与现实结合”主题的 B 级依据（未单独建主题关系，写入研究说明）

## B02-SRC-0006：Esto no es un sueño: los personajes frente al concepto onírico en los primeros cuentos fantásticos de Julio Cortázar

- 机构/作者：Jérôme Dulou / Orbis Tertius（Universidad Nacional de La Plata）；语言：es；建议等级：A；类型：journal_article
- URL：https://www.orbistertius.unlp.edu.ar/article/view/ote250
- 访问：2026-08-10 实测，状态 `ok`（落地页 200，摘要核验）
- 涉及作品：Bestiario;Final del juego
- 中文释义：阿根廷国立拉普拉塔大学《第三世界》（Orbis Tertius）期刊 2022 年论文（vol.27 n.36）：以经典叙述学方法分析科塔萨尔早期幻想故事（La otra orilla、Bestiario、Final del juego）中人物与梦境概念的虚假关系，兼及读者的主动角色；细读《Las manos que crecen》《Distante espejo》《Retorno de la noche》《La noche boca arriba》。
- 说明：同行评审期刊；DOI 10.24215/18517811e250；R1：作者名按 UNLP 官方页面统一为 Jérôme Dulou（REVIEW §3.1）

## B02-SRC-0007：Cortázar: los relatos fragmentados y la importancia de un lector activo

- 机构/作者：Eduardo Huarag Álvarez / Passagens（Universidade Federal Fluminense）；语言：es；建议等级：A；类型：journal_article
- URL：https://periodicos.uff.br/revistapassagens/article/view/54497
- 访问：2026-08-10 实测，状态 `ok`（落地页 200，摘要核验）
- 涉及作品：Rayuela
- 中文释义：巴西弗鲁米嫩塞联邦大学《Passagens》期刊 2022 年论文（vol.14 n.3）：科塔萨尔自早期小说起即对抗既定文学规范，《跳房子》揭示其对传统小说观念的突破；碎片叙事与多种话语交替指向需要积极参与的读者；并讨论《Último round》的影格式“叙述”。
- 说明：同行评审期刊；DOI 10.15175/1984-2503-202214302

## B02-SRC-0008：Romance y azar en la ciudad: dos transposiciones de cuentos de Julio Cortázar

- 机构/作者：Alfredo Dillon / Anclajes（Universidad Nacional de La Pampa）；语言：es；建议等级：A；类型：journal_article
- URL：https://cerac.unlpam.edu.ar/index.php/anclajes/article/view/7247
- 访问：2026-08-10 实测，状态 `ok`（落地页 200，摘要核验）
- 涉及作品：（短篇改编：El otro cielo;Manuscrito hallado en un bolsillo）
- 中文释义：阿根廷国立拉潘帕大学《Anclajes》期刊 2024 年论文（vol.28 n.2）：科塔萨尔叙事中“由偶然标记的城市漫游式理想爱情”为反复出现主题；比较两部改编长片——Nina Grosse《Der gläserne Himmel》（德国 1987，改编自《El otro cielo》）与 Roberto Gervitz《Jogo subterraneo》（巴西 2005，改编自《Manuscrito hallado en un bolsillo》），并讨论科塔萨尔故事与类型、时代、语境的跨媒介重构。
- 说明：同行评审期刊；DOI 10.19137/anclajes-2024-2829

## B02-SRC-0009：Jogos de máscaras e dobras do eu: encruzilhadas de leitura(s) a partir de "Final de juego" de Julio Cortázar

- 机构/作者：Stanis David Lacowicz / Anuari de Filologia. Literatures Contemporànies（Universitat de Barcelona）；语言：pt；建议等级：A；类型：journal_article
- URL：https://revistes.ub.edu/index.php/AFLC/article/view/52790
- 访问：2026-08-10 实测，状态 `ok`（落地页 200；标题与元数据核验，正文摘要不可得）
- 涉及作品：Final del juego
- 中文释义：巴塞罗那大学《语文学年鉴·当代文学》2025 年论文（n.15）：以《游戏的终结》为对象展开“面具游戏与自我之折叠”的阅读路径研究（标题即主题判断；正文摘要本站不可得，主题候选置信度 medium）。
- 说明：同行评审期刊；DOI 10.1344/aflc2025.15.3

## B02-SRC-0010：Dialnet: búsqueda «Cortázar»

- 机构/作者：Dialnet（Universidad de La Rioja）；语言：es；建议等级：D；类型：reference
- URL：https://dialnet.unirioja.es/buscar/documentos?querysDismax.DOCUMENTAL_TODO=cortazar
- 访问：2026-08-10 实测，状态 `ok`（检索页 200，4,684 条命中）
- 涉及作品：Bestiario;Final del juego;Rayuela
- 中文释义：西班牙里奥哈大学综合学术文献索引；仅作发现线索与书目交叉核验，不作为解释性关系依据。
- 说明：D 级索引；不用于任何解释性关系

## B02-SRC-0011：Alejo Carpentier, autor transcultural. El caso de "El reino de este mundo"

- 机构/作者：Isabel Araújo Branco / Revista de Filología Románica（Universidad Complutense de Madrid）；语言：es；建议等级：A；类型：journal_article
- URL：https://revistas.ucm.es/index.php/RFRM/es/article/view/42604
- 访问：2026-08-10 实测，状态 `ok`（落地页 200，摘要核验）
- 涉及作品：El reino de este mundo
- 中文释义：马德里康普顿斯大学《罗曼语文学杂志》2013 年论文（vol.30 n.1）：首句明确“古巴人阿莱霍·卡彭铁尔是跨文化作者”；为呈现拉美本质发展出 lo real maravilloso 与 neobarroco 工具；在《人间王国》中呈现作为跨文化产物的次大陆，Monsieur Lenormand de Mezy、Paulina、Henri Christophe 代表“新世界”，Mackandal 体现神奇现实。
- 说明：同行评审期刊；DOI 10.5209/rev_rfrm.2013.v30.n1.42604

## B02-SRC-0012：De los pasos perdidos de Alvar Núñez a los Pasos de Alejo Carpentier a través del concepto de la Kehre heideggeriana

- 机构/作者：Graciela Maturo / Atenea（Universidad de Concepción）；语言：es；建议等级：A；类型：journal_article
- URL：https://revistas.udec.cl/index.php/atenea/article/view/17896
- 访问：2026-08-10 实测，状态 `ok`（落地页 200；开放 PDF 首页核验内容）
- 涉及作品：Los pasos perdidos
- 中文释义：智利康塞普西翁大学《雅典娜》期刊 1998 年论文（n.477, pp.181-200）：以海德格尔 Kehre（转向）概念解读《消逝的足迹》，“美洲作为去蔽与西方传统的新起点”；从阿尔瓦尔·努涅斯《遇难记》到卡彭铁尔的谱系。
- 说明：同行评审期刊；DOI 10.29393/At477-9PPGM10009

## B02-SRC-0013：Objetos de arte, écfrasis y regímenes escópicos en El siglo de las luces (1962) de Alejo Carpentier

- 机构/作者：Carolina Toledo / Letras（Universidad Nacional Mayor de San Marcos, Lima）；语言：es；建议等级：A；类型：journal_article
- URL：https://revistaletras.unmsm.edu.pe/index.php/le/article/view/2397
- 访问：2026-08-10 实测，状态 `ok`（落地页 200，摘要核验）
- 涉及作品：El siglo de las luces
- 中文释义：秘鲁圣马科斯国立大学《文学》期刊 2024 年论文（vol.95 n.142）：以艺术物件与视觉体制（regímenes escópicos）的 ecfrasis 解读《光明世纪》(1962)，批判启蒙现代性及其对拉丁美洲的影响，并重思艺术概念本身。
- 说明：同行评审期刊；DOI 10.30920/letras.95.142.13

## B02-SRC-0014：Dialnet: búsqueda «Carpentier»

- 机构/作者：Dialnet（Universidad de La Rioja）；语言：es；建议等级：D；类型：reference
- URL：https://dialnet.unirioja.es/buscar/documentos?querysDismax.DOCUMENTAL_TODO=carpentier
- 访问：2026-08-10 实测，状态 `ok`（检索页 200）
- 涉及作品：El reino de este mundo;Los pasos perdidos;El siglo de las luces
- 中文释义：综合学术文献索引；仅作发现线索与书目交叉核验，不作为解释性关系依据。
- 说明：D 级索引

## B02-SRC-0015：Dialnet: búsqueda «El reino de este mundo»

- 机构/作者：Dialnet（Universidad de La Rioja）；语言：es；建议等级：D；类型：reference
- URL：https://dialnet.unirioja.es/buscar/documentos?querysDismax.DOCUMENTAL_TODO=%22el+reino+de+este+mundo%22
- 访问：2026-08-10 实测，状态 `ok`（检索页 200）
- 涉及作品：El reino de este mundo
- 中文释义：综合学术文献索引；仅作发现线索与书目交叉核验，不作为解释性关系依据。
- 说明：D 级索引

## 被拦截/不可达来源记录（未计入来源候选）

以下站点于 2026-08-10 实测不可达或反爬拦截，已用等价 A/B 级来源替代，**未绕过访问限制**：

1. Fundación Gabo（fundaciongabo.org）——Cloudflare“Just a moment”403 拦截；GGM 官方基金会页，替代为 CVC 数字展 + Nobel 官网。
2. banrepcultural.org（哥伦比亚共和国银行/路易斯·安赫尔·阿朗戈图书馆）——Radware Bot Manager 验证码；GGM 私人藏书捐赠相关页面不可取，替代为 Javeriana 论文。
3. Biblioteca Nacional de Colombia（bibliotecanacional.gov.co）——403。
4. Fundación Alejo Carpentier（fundacioncarpentier.cult.cu）——古巴域名连接超时；替代为 RFRM 论文 + Dialnet 索引。
5. Casa de las Américas（casadelasamericas.org）——古巴域名连接超时。
6. Biblioteca Nacional de Cuba José Martí（bnjm.cu）——连接超时。
7. Biblioteca Nacional Mariano Moreno 目录（catalogo.bn.gov.ar）——IP 地址被拒绝（403 Forbidden, access from IP 112.81.12.80 not allowed）。
8. cultura.gob.ar（阿根廷文化部）——Cloudflare 拦截。
9. scielo.org.ar / ri.conicet.gov.ar——连接超时。
10. Cervantes Virtual / BNE / RAE / LOC——Cloudflare 拦截。

（以上记录同步写入 ISSUES.md；未为绕过任何限制做尝试。）
