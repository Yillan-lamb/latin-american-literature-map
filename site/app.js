const DATA_URL = window.location.pathname.includes("/site/") ? "../data/v2/web/site_data.json" : "./data/v2/web/site_data.json";
const README_URL = window.location.pathname.includes("/site/") ? "../README.md" : "./README.md";
const app = document.querySelector("#app");
const nav = document.querySelector(".main-nav");
const menuToggle = document.querySelector(".menu-toggle");

let data = null;
let mapFilter = "all";
let activeCountry = null;
let searchFilter = "all";

const escapeHtml = (value) => String(value ?? "").replace(/[&<>"']/g, (character) => ({
  "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;",
}[character]));

const entity = (id) => data.research.entities.find((item) => item.entity_id === id);
const cardFor = (id) => data.research.content_cards.find((item) => item.subject_id === id);
const place = (id) => data.map.places.find((item) => item.place_id === id);
const relationTypeLabel = (value) => ({ CREATED: "创作", SET_IN: "故事空间", ASSOCIATED_WITH_PLACE: "作者地理", BASED_ON_EVENT: "事件关联" }[value] || value);
const typeLabel = (value) => ({ author: "作家", work: "作品", place: "地点", fictional_space: "虚构空间", country: "国家", event: "事件", collection: "作品集", theme: "主题", movement: "文学运动", adaptation: "改编节点", edition: "版本节点", character: "人物节点", institution: "机构节点", person: "人物关联" }[value] || "关联节点");

function hrefFor(type, id) {
  const resolvedType = type === "place" || type === "country" || type === "fictional_space" ? routeTypeFor(id) : type;
  if (resolvedType === "node") return `#/node/${encodeURIComponent(id)}`;
  if (resolvedType === "author") return `#/author/${encodeURIComponent(id)}`;
  if (resolvedType === "work") return `#/work/${encodeURIComponent(id)}`;
  if (resolvedType === "country") return `#/country/${encodeURIComponent(id)}`;
  return `#/place/${encodeURIComponent(id)}`;
}

function routeTypeFor(id) {
  const mappedPlace = place(id);
  if (mappedPlace) {
    if (mappedPlace.place_kind === "country") return "country";
    if (mappedPlace.reality_status === "fictional") return "fictional_space";
    return "place";
  }
  const item = entity(id);
  return item?.entity_type === "author" || item?.entity_type === "work" ? item.entity_type : "node";
}

function displayName(id) {
  return entity(id)?.name_zh || place(id)?.name_zh || id;
}

function cardMarkup(item, options = {}) {
  const { id, type, title, description, meta, kind = "" } = options;
  return `<a class="card ${kind}" href="${hrefFor(type, id)}">
    <div>
      <div class="card-meta"><span>${escapeHtml(meta || typeLabel(type))}</span><span>${escapeHtml(item?.original_name || "")}</span></div>
      <h3>${escapeHtml(title)}</h3>
      <p>${escapeHtml(description || "")}</p>
    </div>
    <span class="card-link">打开档案 →</span>
  </a>`;
}

function getCuration(group, predicate = () => true) {
  return (data.curation[group] || []).filter(predicate);
}

function curationFor(targetId, fieldKey) {
  return getCuration("entries", (item) => item.target_id === targetId && item.field_key === fieldKey)[0];
}

function selected(targetId, key) {
  return getCuration("selections", (item) => item.target_id === targetId && item.selection_key === key)[0];
}

function cardSummary(id) {
  const card = cardFor(id);
  return card?.content_markdown?.split("\n").find((line) => line.includes("一句话简介"))?.replace(/.*：/, "") || "";
}

function formatSources(ids) {
  if (!ids?.length) return "未附来源";
  return ids.map((id) => escapeHtml(id)).join("、");
}

function sourceFor(id) {
  return data.research.sources.find((source) => source.source_id === id);
}

function sourceMarkup(source) {
  if (!source) return "";
  const label = escapeHtml(source.title || source.source_id);
  return source.canonical_url ? `<a href="${escapeHtml(source.canonical_url)}" target="_blank" rel="noreferrer">${label}</a>` : label;
}

function sourceListMarkup(items = []) {
  if (!items.length) return "未附来源";
  return items.map((item) => { const sourceId = typeof item === "string" ? item : item.source_id; return sourceMarkup(sourceFor(sourceId) || { source_id: sourceId }); }).join("、");
}

function curationSourceNote(entry) {
  return entry?.source_refs?.length ? `<small class="curation-source">策展依据：${sourceListMarkup(entry.source_refs)}</small>` : "";
}

function researchPanel(targetId) {
  const item = entity(targetId);
  if (!item) return "";
  const facts = data.research.facts.filter((fact) => fact.subject_id === targetId);
  const relations = data.research.relationships.filter((relation) => relation.subject_id === targetId || relation.object_id === targetId);
  const factRows = facts.slice(0, 8).map((fact) => `<li><strong>${escapeHtml(fact.fact_field)}</strong>：${escapeHtml(fact.value_text)} <small>· ${escapeHtml(fact.admission_status)} · 来源：${sourceListMarkup(fact.sources)}</small></li>`).join("") || "<li>当前没有直接事实行</li>";
  const relationRows = relations.slice(0, 8).map((relation) => `<li>${escapeHtml(relationTypeLabel(relation.relation_type))}：${escapeHtml(displayName(relation.subject_id))} → ${escapeHtml(displayName(relation.object_id))} <small>· ${escapeHtml(relation.review_status)} · 来源：${sourceListMarkup(relation.evidence)}</small></li>`).join("") || "<li>当前没有正式关系行</li>";
  return `<details class="research-panel"><summary>展开研究层：事实、关系与审核状态</summary><div class="research-body">
    <section><h4>FACTS / 事实</h4><ul>${factRows}</ul></section>
    <section><h4>RELATIONS / 关系</h4><ul>${relationRows}</ul></section>
  </div></details>`;
}

function mapPosition(node, index) {
  if (node.latitude != null && node.longitude != null) {
    const x = Math.max(10, Math.min(90, ((node.longitude + 110) / 160) * 100));
    const y = Math.max(12, Math.min(88, ((45 - node.latitude) / 100) * 100));
    return { x, y };
  }
  const countryAnchors = {
    AR: { x: 24, y: 66 }, BR: { x: 40, y: 69 }, CL: { x: 23, y: 84 },
    CO: { x: 49, y: 43 }, CU: { x: 58, y: 31 }, MX: { x: 23, y: 34 }, PE: { x: 35, y: 56 },
  };
  const literaryAnchors = {
    "V1-ENT-0055": { x: 35, y: 23 },
    "V1-ENT-0097": { x: 61, y: 47 },
  };
  if (literaryAnchors[node.place_id]) return literaryAnchors[node.place_id];
  if (node.place_kind === "country" && countryAnchors[node.country_code]) return countryAnchors[node.country_code];
  const fallback = [{ x: 18, y: 22 }, { x: 31, y: 40 }, { x: 47, y: 58 }, { x: 63, y: 74 }, { x: 76, y: 29 }, { x: 84, y: 52 }];
  return fallback[index % fallback.length];
}

function mapPositions(nodes) {
  const offsets = [{ x: 0, y: 0 }, { x: 8, y: -7 }, { x: -8, y: 7 }, { x: 9, y: 8 }, { x: -9, y: -8 }, { x: 15, y: 0 }, { x: -15, y: 0 }, { x: 0, y: 15 }, { x: 0, y: -15 }];
  const placed = [];
  return nodes.map((node, index) => {
    const origin = mapPosition(node, index);
    const position = offsets.map((offset) => ({ x: Math.max(8, Math.min(92, origin.x + offset.x)), y: Math.max(10, Math.min(90, origin.y + offset.y)) }))
      .find((candidate) => placed.every((other) => Math.hypot(candidate.x - other.x, candidate.y - other.y) >= 9)) || origin;
    placed.push(position);
    return position;
  });
}

function mapMarkup() {
  const mapRelations = data.map.relations;
  const relationPlaceIds = new Set(mapRelations.map((item) => item.target_place_id));
  const roleForFilter = { author_geography: new Set(["author_geography"]), story_setting: new Set(["story_setting"]), fictional_space: new Set(["fictional_setting", "fictional_space"]) };
  let nodes = data.map.places.filter((item) => item.map_status !== "hidden");
  if (activeCountry) nodes = nodes.filter((item) => item.place_id === activeCountry || item.parent_place_id === activeCountry);
  if (mapFilter !== "all") {
    const roles = roleForFilter[mapFilter] || new Set();
    const matchingPlaces = new Set(mapRelations.filter((item) => roles.has(item.map_relation_role)).map((item) => item.target_place_id));
    nodes = nodes.filter((item) => item.place_kind === "country" || matchingPlaces.has(item.place_id));
  }
  nodes = nodes.filter((item) => relationPlaceIds.has(item.place_id) || item.place_kind === "country");
  const positions = mapPositions(nodes);
  const nodeMarkup = nodes.map((node, index) => {
    const position = positions[index];
    const kind = node.reality_status === "fictional" ? "fictional" : node.reality_status === "real" ? "real" : "";
    const label = node.reality_status === "fictional" ? "文学空间" : node.place_kind === "country" ? "国家" : "现实地点";
    const relationCount = mapRelations.filter((item) => item.target_place_id === node.place_id).length;
    return `<div class="map-node ${kind}" style="left:${position.x}%;top:${position.y}%"><button type="button" data-place-id="${escapeHtml(node.place_id)}" aria-label="打开 ${escapeHtml(node.name_zh)}">${node.reality_status === "fictional" ? "文" : node.place_kind === "country" ? "国" : "点"}</button><div class="map-node-label"><strong>${escapeHtml(node.name_zh)}</strong>${label} · ${relationCount} 条关系</div></div>`;
  }).join("");
  const countries = data.map.places.filter((item) => item.place_kind === "country" && item.map_status !== "hidden");
  const filterLabels = { all: "全部节点", author_geography: "作者地理", story_setting: "故事空间", fictional_space: "虚构空间" };
  const visibleChildCount = (countryId) => data.map.places.filter((item) => item.parent_place_id === countryId && item.map_status !== "hidden").length;
  return `<div class="map-shell">
    <div class="map-toolbar"><strong>从地点进入文学</strong><div class="map-legend"><span class="legend-item"><i class="legend-dot real"></i>现实地点</span><span class="legend-item"><i class="legend-dot fictional"></i>文学虚构空间</span><span class="legend-item"><i class="legend-dot"></i>国家入口</span></div></div>
    <div class="map-canvas"><div class="map-continent one"></div><div class="map-continent two"></div><div class="map-continent three"></div><div class="map-line a"></div><div class="map-line b"></div>${nodeMarkup || '<div class="map-empty">这一层暂时没有可展示节点</div>'}</div>
    <div class="map-footer"><div class="map-filter"><button class="chip ${mapFilter === "all" ? "active" : ""}" aria-pressed="${mapFilter === "all"}" data-map-filter="all">全部节点</button><button class="chip ${mapFilter === "author_geography" ? "active" : ""}" aria-pressed="${mapFilter === "author_geography"}" data-map-filter="author_geography">作者地理</button><button class="chip ${mapFilter === "story_setting" ? "active" : ""}" aria-pressed="${mapFilter === "story_setting"}" data-map-filter="story_setting">故事空间</button><button class="chip ${mapFilter === "fictional_space" ? "active" : ""}" aria-pressed="${mapFilter === "fictional_space"}" data-map-filter="fictional_space">虚构空间</button></div><span>${activeCountry ? `当前路径：${escapeHtml(displayName(activeCountry))}` : `完整地图 · ${escapeHtml(filterLabels[mapFilter])}`}</span></div>
  </div><div class="country-strip">${countries.map((country) => `<button class="country-button ${activeCountry === country.place_id ? "active" : ""}" aria-pressed="${activeCountry === country.place_id}" data-country-id="${escapeHtml(country.place_id)}"><strong>${escapeHtml(country.name_zh)}</strong><span>${visibleChildCount(country.place_id)} 个地点 →</span></button>`).join("")}</div>`;
}

function renderHome() {
  const authors = getCuration("selections", (item) => item.selection_key === "featured_author").sort((a, b) => a.sort_order - b.sort_order).slice(0, 4);
  const works = getCuration("selections", (item) => item.selection_key === "featured_work").sort((a, b) => a.sort_order - b.sort_order).slice(0, 6);
  const featuredAuthorIds = new Set(authors.map((selection) => selection.target_id));
  const featuredWorkIds = new Set(works.map((selection) => selection.target_id));
  const fullAuthors = data.pages.authors.filter((item) => cardFor(item.entity_id)?.source_minimum_status === "meets");
  const fullWorks = data.pages.works.filter((item) => cardFor(item.entity_id)?.source_minimum_status === "meets");
  const moreAuthors = fullAuthors.filter((item) => !featuredAuthorIds.has(item.entity_id)).slice(0, 6);
  const moreWorks = fullWorks.filter((item) => !featuredWorkIds.has(item.entity_id)).slice(0, 6);
  const timeline = data.timeline.slice(0, 2);
  const authorCard = (item, meta = "作家档案") => cardMarkup(item, { id: item.entity_id, type: "author", title: item.name_zh, description: curationFor(item.entity_id, "page_lede")?.content_zh || cardSummary(item.entity_id), meta });
  const workCard = (item, meta) => { const card = cardFor(item.entity_id); return cardMarkup(item, { id: item.entity_id, type: "work", title: item.name_zh, description: curationFor(item.entity_id, "one_line_summary")?.content_zh || cardSummary(item.entity_id), meta: meta || `${card?.country_or_region || "作品"} · ${card?.period_bucket || ""}` }); };
  app.innerHTML = `<section class="hero"><div><p class="eyebrow">A literary atlas in progress</p><h1 class="display-title">把文学放回<br /><em>它的地点。</em></h1><p class="lede">从一个国家、一座城市或一个虚构空间出发，进入作者、作品与它们留下的时间痕迹。</p></div><aside class="hero-note"><p>地图是入口，阅读是方向，研究层让每一步都能回到来源。</p><small>V2 完整测试站使用 V1 正式数据与 V2 地图数据。现实地点、文学空间和研究证据分别标注，不把文学想象伪装成地理事实。</small></aside></section>
  <section class="section"><div class="section-heading"><h2>文学地图</h2><p>先选择国家，再向下进入现实地点或文学虚构空间。地图展示完整可公开节点，筛选器对应三类文学空间关系。</p></div>${mapMarkup()}</section>
  <section class="section"><div class="section-heading"><h2>本期入口</h2><p>精选入口保留 N2 已确认的阅读顺序；完整作者与作品范围在下方继续展开。</p></div><div class="card-grid">${authors.map((selection) => authorCard(entity(selection.target_id))).join("")}</div></section>
  <section class="section"><div class="section-heading"><h2>从一部作品开始</h2><p>作品卡保留研究层的来源入口；阅读层先给你一个足够轻的进入点。</p></div><div class="card-grid">${works.map((selection) => workCard(entity(selection.target_id))).join("")}</div></section>
  <section class="section"><div class="section-heading"><h2>完整范围</h2><p>${fullAuthors.length} 位完整作者页、${fullWorks.length} 部完整作品页进入公开索引；研究缺口和关联节点仍保留各自状态。</p></div><div class="catalog-stat-grid"><div class="info-box"><strong>${fullAuthors.length}</strong><span>作者档案</span></div><div class="info-box"><strong>${fullWorks.length}</strong><span>作品档案</span></div><div class="info-box"><strong>${data.map.places.filter((item) => item.map_status !== "hidden").length}</strong><span>公开地图节点</span></div><div class="info-box"><strong>${data.timeline.length}</strong><span>时间线节点</span></div></div><div class="section-subheading"><h3>继续发现作家</h3><a class="card-link" href="#/search?q=">浏览完整索引 →</a></div><div class="card-grid">${moreAuthors.map((item) => authorCard(item, "完整作者页")).join("")}</div><div class="section-subheading"><h3>继续发现作品</h3><a class="card-link" href="#/search?q=">按类型筛选 →</a></div><div class="card-grid">${moreWorks.map((item) => workCard(item, "完整作品页")).join("")}</div></section>
  <section class="section split-layout"><div class="archive-note"><h3>时间不是背景板。</h3><p>它保存作品与历史之间可以被核查的连接，也保存那些暂时还不能被说得太满的地方。</p><a class="card-link" href="#/timeline">打开时间线 →</a></div><div class="timeline-mini">${timeline.map((item) => timelineItem(item)).join("")}</div></section>`;
  bindHomeInteractions();
}

function timelineItem(item) {
  const event = item.entity;
  const yearFact = (item.facts || []).find((fact) => fact.fact_field === "event_year_range" || fact.fact_field === "first_publication_year" || fact.fact_field === "publication_year");
  const kind = item.node_type === "historical_background" ? "历史背景" : item.node_type === "literary_author" ? "作家节点" : "作品节点";
  const status = item.status || yearFact?.admission_status || "card_period_only";
  const targetType = item.node_type === "literary_author" ? "author" : item.node_type === "literary_work" ? "work" : "node";
  const title = targetType === "node" ? escapeHtml(event.name_zh) : `<a href="${hrefFor(targetType, event.entity_id)}">${escapeHtml(event.name_zh)}</a>`;
  return `<div class="timeline-item"><time>${escapeHtml(item.year_label || yearFact?.value_text || "待核查")}</time><div><strong>${title}</strong><p>${kind} · 研究层状态：${escapeHtml(status)}</p></div></div>`;
}

function timelineGroups() {
  const groups = new Map();
  data.timeline.forEach((item) => {
    const key = item.period_bucket || "历史背景";
    if (!groups.has(key)) groups.set(key, []);
    groups.get(key).push(item);
  });
  return [...groups.entries()].sort((a, b) => {
    const year = (value) => Number.parseInt(String(value).slice(0, 4), 10) || 9999;
    return year(a[0]) - year(b[0]) || a[0].localeCompare(b[0]);
  });
}

function bindHomeInteractions() {
  document.querySelectorAll("[data-map-filter]").forEach((button) => button.addEventListener("click", () => { mapFilter = button.dataset.mapFilter; renderHome(); }));
  document.querySelectorAll("[data-country-id]").forEach((button) => button.addEventListener("click", () => { activeCountry = activeCountry === button.dataset.countryId ? null : button.dataset.countryId; renderHome(); }));
  document.querySelectorAll("[data-place-id]").forEach((button) => button.addEventListener("click", () => {
    const id = button.dataset.placeId;
    window.location.hash = hrefFor(routeTypeFor(id), id);
  }));
}

function renderCountry(id) {
  const country = place(id);
  if (!country || (country.source_kind === "technical_parent_node" && country.map_status === "hidden")) return renderNotFound();
  const childPlaces = data.map.places.filter((item) => item.parent_place_id === id && item.map_status !== "hidden");
  const countryScope = new Set([id, ...childPlaces.map((item) => item.place_id)]);
  const linkedRelations = data.map.relations.filter((item) => countryScope.has(item.target_place_id));
  const linkedWorks = [...new Set(linkedRelations.filter((item) => item.source_entity_id && entity(item.source_entity_id)?.entity_type === "work").map((item) => item.source_entity_id))];
  const linkedAuthors = [...new Set(linkedRelations.filter((item) => item.source_entity_id && entity(item.source_entity_id)?.entity_type === "author").map((item) => item.source_entity_id))];
  app.innerHTML = `<section class="page-header"><p class="eyebrow">Country / 国家入口</p><h1 class="display-title">${escapeHtml(country.name_zh)}</h1><div class="page-header-meta"><span class="tag coral">${escapeHtml(country.original_name || "")}</span><span class="tag">${childPlaces.length} 个地点节点</span><span class="tag">${linkedAuthors.length} 位作者</span></div></section><section class="content-grid"><div class="content-copy"><h2>从国家进入地点</h2><p>这里不是国家文学史的完整目录，而是一条由 V1 关系与 V2 策展选择共同组成的阅读路径。选择一个地点，继续向下。</p><div class="card-grid">${childPlaces.map((item) => placeCard(item)).join("")}</div></div><aside class="side-rail"><div class="info-box"><h3>关联作者</h3><dl class="info-list">${linkedAuthors.map((authorId) => `<div><dt>${escapeHtml(displayName(authorId))}</dt><dd><a class="card-link" href="#/author/${authorId}">打开</a></dd></div>`).join("") || "<div><dd>当前样本没有作者地理关系。</dd></div>"}</dl></div><div class="info-box"><h3>关联作品</h3><dl class="info-list">${linkedWorks.map((workId) => `<div><dt>${escapeHtml(displayName(workId))}</dt><dd><a class="card-link" href="#/work/${workId}">打开</a></dd></div>`).join("") || "<div><dd>当前样本没有作品地点关系。</dd></div>"}</dl></div></aside></section>`;
}

function placeCard(item) {
  const fictional = item.reality_status === "fictional";
  const unresolved = item.reality_status === "unknown";
  const relationCount = data.map.relations.filter((relation) => relation.target_place_id === item.place_id).length;
  return cardMarkup(item, { id: item.place_id, type: fictional ? "fictional_space" : item.place_kind === "country" ? "country" : "place", title: item.name_zh, description: fictional ? "文学空间 · 不使用现实坐标" : unresolved ? "现实/虚构分类待确认 · 不在默认地图展示" : `${relationCount} 条文学地点关系 · ${item.coordinate_precision || "无精确点位"}`, meta: fictional ? "虚构文学空间" : unresolved ? "待确认地点" : "现实地点", kind: fictional ? "fictional" : unresolved ? "gap" : "place" });
}

function renderPlace(id) {
  const item = place(id);
  if (!item || (item.source_kind === "technical_parent_node" && item.map_status === "hidden")) return renderNotFound();
  const relations = data.map.relations.filter((relation) => relation.target_place_id === id);
  const isFictional = item.reality_status === "fictional";
  const isUnknown = item.reality_status === "unknown";
  const entry = curationFor(id, isFictional ? "fictional_space_note" : "literary_place_note");
  const relatedCards = relations.map((relation) => { const source = entity(relation.source_entity_id); return source ? `<a class="search-result" href="${hrefFor(routeTypeFor(source.entity_id), source.entity_id)}"><div><strong>${escapeHtml(source.name_zh)}</strong><small>${escapeHtml(relationTypeLabel(relation.relation_type))} · ${escapeHtml(relation.map_relation_role)} · ${escapeHtml(relation.description_zh || "")}</small></div><span>→</span></a>` : ""; }).join("");
  const coords = item.latitude != null ? `${item.latitude.toFixed(4)}, ${item.longitude.toFixed(4)}` : isUnknown ? "未确认；不使用现实坐标" : "文学空间，不落现实坐标";
  const coordinateSource = item.coordinate_source_url ? `<a href="${escapeHtml(item.coordinate_source_url)}" target="_blank" rel="noreferrer">坐标来源</a>` : "坐标来源未登记";
  const classificationSource = item.classification_source_url ? `<a href="${escapeHtml(item.classification_source_url)}" target="_blank" rel="noreferrer">分类来源</a>` : "分类来源未登记";
  const placeLabel = isFictional ? "虚构文学空间" : isUnknown ? "待确认地点" : "现实地点";
  const defaultText = isFictional ? "这个空间保留在文学关系中，不与现实地图点位混同。" : isUnknown ? "该名称保留在已登记的文学关系中，但现实/虚构分类和可落点状态仍待确认；它不使用现实坐标，也不进入默认地图。" : "这个地点通过 V1 已审核关系进入地图。";
  const sourceText = isFictional ? `文学空间分类与关系来源已登记；没有现实坐标。${classificationSource}` : isUnknown ? `分类来源：${classificationSource}。坐标来源未登记，分类待确认。` : `${coordinateSource} · ${classificationSource}`;
  app.innerHTML = `<section class="page-header"><p class="eyebrow">${isFictional ? "Fictional space / 文学空间" : isUnknown ? "Unresolved place / 待确认地点" : "Place / 地点档案"}</p><h1 class="display-title">${escapeHtml(item.name_zh)}</h1><div class="page-header-meta"><span class="tag ${isFictional ? "blue" : isUnknown ? "yellow" : "green"}">${placeLabel}</span><span class="tag">${escapeHtml(item.original_name || "")}</span><span class="tag">${escapeHtml(item.map_status)}</span></div></section><section class="content-grid"><div class="content-copy"><h2>${isFictional ? "一处被写出来的地方" : isUnknown ? "一处仍待确认的文学空间" : "一处可以继续追踪的地点"}</h2><p>${escapeHtml(entry?.content_zh || defaultText)}</p>${curationSourceNote(entry)}<div class="search-results">${relatedCards || "<p>当前没有已登记的文学地点关系。</p>"}</div>${item.entity_id ? researchPanel(item.entity_id) : ""}</div><aside class="side-rail"><div class="info-box"><h3>地点层</h3><dl class="info-list"><div><dt>类型</dt><dd>${escapeHtml(item.place_kind)}</dd></div><div><dt>现实属性</dt><dd>${escapeHtml(item.reality_status)}</dd></div><div><dt>坐标</dt><dd>${escapeHtml(coords)}</dd></div><div><dt>精度</dt><dd>${escapeHtml(item.coordinate_precision || "none")}</dd></div><div><dt>父级</dt><dd>${escapeHtml(item.parent_place_id ? displayName(item.parent_place_id) : "—")}</dd></div></dl></div><div class="info-box"><h3>来源</h3><p>${sourceText}</p></div></aside></section>`;
}

function renderEntityPage(id, pageType) {
  const item = entity(id);
  if (!item) return renderNotFound();
  const card = cardFor(id);
  const entryKey = pageType === "work" ? "one_line_summary" : "page_lede";
  const entry = curationFor(id, entryKey);
  const outgoing = data.research.relationships.filter((relation) => relation.subject_id === id);
  const incoming = data.research.relationships.filter((relation) => relation.object_id === id);
  const works = pageType === "author" ? outgoing.filter((relation) => relation.relation_type === "CREATED").map((relation) => entity(relation.object_id)).filter(Boolean) : [];
  const authors = pageType === "work" ? incoming.filter((relation) => relation.relation_type === "CREATED").map((relation) => entity(relation.subject_id)).filter(Boolean) : [];
  const relationLinks = [...outgoing, ...incoming].filter((relation) => relation.relation_type !== "CREATED").slice(0, 12).map((relation) => { const otherId = relation.subject_id === id ? relation.object_id : relation.subject_id; const other = entity(otherId) || place(otherId); return other ? `<a class="search-result" href="${hrefFor(routeTypeFor(otherId), otherId)}"><div><strong>${escapeHtml(other.name_zh)}</strong><small>${escapeHtml(relationTypeLabel(relation.relation_type))} · ${escapeHtml(relation.description_zh || "")}</small></div><span>→</span></a>` : ""; }).join("");
  const collections = [...outgoing, ...incoming].map((relation) => entity(relation.subject_id === id ? relation.object_id : relation.subject_id)).filter((other) => other?.entity_type === "collection");
  const pageStatus = card?.source_minimum_status || "related_only";
  const isGap = pageStatus === "research_gap";
  const readingText = isGap ? "该作品被保留为研究缺口。页面展示已登记的实体、关系和事实状态，但暂不提供确定性策展导语。" : !card ? "当前节点只作为 V1 研究关系中的关联入口保留，不以策展文案补足完整档案。" : entry?.content_zh || cardSummary(id) || "当前页面以研究卡片为主，策展导语尚在补充。";
  const statusNote = isGap ? `<div class="status-note">研究缺口：普通阅读层不替它补写结论；请展开研究层查看已登记事实和来源。</div>` : !card ? `<div class="status-note">关联节点：当前没有满足最低来源门槛的内容卡。</div>` : "";
  const sourceNote = !isGap && entry ? curationSourceNote(entry) : "";
  const worksMarkup = works.map((work) => { const workCard = cardFor(work.entity_id); const workGap = workCard?.source_minimum_status === "research_gap"; return cardMarkup(workCard, { id: work.entity_id, type: "work", title: work.name_zh, description: workGap ? "研究缺口 · 打开查看已登记状态" : curationFor(work.entity_id, "one_line_summary")?.content_zh || cardSummary(work.entity_id), meta: workGap ? "作品 · 研究缺口" : "作品", kind: workGap ? "gap" : "" }); }).join("");
  const collectionsMarkup = collections.length ? `<h2>作品集模块</h2><div class="search-results">${collections.map((collection) => `<a class="search-result" href="${hrefFor("node", collection.entity_id)}"><div><strong>${escapeHtml(collection.name_zh)}</strong><small>作品集模块 · 进入研究节点</small></div><span>→</span></a>`).join("")}</div>` : "";
  app.innerHTML = `<section class="page-header"><p class="eyebrow">${pageType === "author" ? "Author / 作家档案" : "Work / 作品档案"}</p><h1 class="display-title">${escapeHtml(item.name_zh)}</h1><div class="page-header-meta"><span class="tag coral">${escapeHtml(item.original_name || "")}</span><span class="tag ${isGap ? "blue" : ""}">${escapeHtml(pageStatus)}</span>${card?.country_or_region ? `<span class="tag">${escapeHtml(card.country_or_region)}</span>` : ""}${card?.period_bucket ? `<span class="tag">${escapeHtml(card.period_bucket)}</span>` : ""}${card?.language ? `<span class="tag">${escapeHtml(card.language)}</span>` : ""}</div></section><section class="content-grid"><div class="content-copy"><h2>${pageType === "author" ? "一个作家入口" : "一部作品入口"}</h2><p>${escapeHtml(readingText)}</p>${sourceNote}${statusNote}${pageType === "author" ? `<h2>作品</h2><div class="card-grid">${worksMarkup || "<p>当前没有已登记的创作关系。</p>"}</div>` : `<h2>关联作者</h2><div class="search-results">${authors.map((author) => `<a class="search-result" href="${hrefFor("author", author.entity_id)}"><div><strong>${escapeHtml(author.name_zh)}</strong><small>打开作家档案</small></div><span>→</span></a>`).join("") || "<p>当前没有已登记的作者关系。</p>"}</div>`}${collectionsMarkup}<h2>地图与研究关系</h2><div class="search-results">${relationLinks || "<p>当前样本没有额外地点关系。</p>"}</div>${researchPanel(id)}</div><aside class="side-rail"><div class="info-box"><h3>研究卡片</h3><dl class="info-list"><div><dt>类型</dt><dd>${escapeHtml(item.entity_type)}</dd></div><div><dt>原文名</dt><dd>${escapeHtml(item.original_name || "—")}</dd></div><div><dt>卡片状态</dt><dd>${escapeHtml(pageStatus)}</dd></div><div><dt>研究问题</dt><dd>${escapeHtml(card?.issue_code || "NONE")}</dd></div></dl></div><div class="info-box"><h3>双层阅读</h3><p>上方是面向普通读者的入口；展开“研究层”可以查看事实字段、正式关系、来源和审核状态。</p></div></aside></section>`;
}

function renderSearch(query = "") {
  const normalized = query.trim().toLowerCase();
  const results = data.search_index.filter((item) => (!normalized || item.search_text.toLowerCase().includes(normalized)) && (searchFilter === "all" || item.target_type === searchFilter)).slice(0, 80);
  const grouped = new Map();
  results.forEach((item) => { if (!grouped.has(item.target_type)) grouped.set(item.target_type, []); grouped.get(item.target_type).push(item); });
  const groupedMarkup = [...grouped.entries()].map(([type, items]) => `<section class="search-group"><h2>${escapeHtml(typeLabel(type))}<span>${items.length}</span></h2><div class="search-results">${items.map((item) => `<a class="search-result" href="${hrefFor(item.target_type, item.target_id)}"><div><strong>${escapeHtml(item.name_zh)}</strong><small>${escapeHtml(typeLabel(item.target_type))} · ${escapeHtml(item.original_name || "")}</small></div><span>→</span></a>`).join("")}</div></section>`).join("");
  const filters = ["all", "author", "work", "country", "place", "fictional_space", "event"];
  app.innerHTML = `<section class="search-shell"><p class="eyebrow">Search / 检索</p><h1 class="display-title">找一条进入文学的路径。</h1><p class="lede">搜索作者、作品、地点、国家或关联节点。结果来自完整 Web Data，不是前端手写目录。</p><form class="search-form"><input id="search-input" type="search" value="${escapeHtml(query)}" placeholder="输入作者、作品、地点或原文名" aria-label="搜索作者、作品、地点或原文名" /><button class="primary-button" type="submit">检索</button></form><div class="search-filters" aria-label="按类型筛选">${filters.map((type) => `<button class="chip ${searchFilter === type ? "active" : ""}" aria-pressed="${searchFilter === type}" type="button" data-search-filter="${type}">${type === "all" ? "全部" : escapeHtml(typeLabel(type))}</button>`).join("")}</div><p class="search-count" aria-live="polite">${results.length} 条结果${normalized ? ` · “${escapeHtml(query)}”` : ""}</p>${groupedMarkup || "<p>没有找到匹配项。可以换一个中文名、原文名或地点名。</p>"}</section>`;
  document.querySelector(".search-form").addEventListener("submit", (event) => { event.preventDefault(); const value = document.querySelector("#search-input").value; window.location.hash = `#/search?q=${encodeURIComponent(value)}`; });
  document.querySelectorAll("[data-search-filter]").forEach((button) => button.addEventListener("click", () => { searchFilter = button.dataset.searchFilter; renderSearch(query); }));
}

function renderTimeline() {
  const groupsMarkup = timelineGroups().map(([period, items]) => `<section class="timeline-group"><div class="section-heading"><h2>${escapeHtml(period)}</h2><p>${items.length} 个文学/背景节点</p></div>${items.map((item) => `${timelineItem(item)}<div class="status-note">该节点的研究状态保留在研究层：${escapeHtml(item.status || "待补证")}。</div>`).join("")}</section>`).join("");
  app.innerHTML = `<section class="timeline-page"><p class="eyebrow">Timeline / 时间线</p><h1 class="display-title">文学与时间，<em>保留它的疑问。</em></h1><p class="lede">时间线按作者时期、作品节点和必要背景分组；历史事件只作为背景保留，不成为 V2 地图的独立空间层。</p><div class="timeline-full">${groupsMarkup}</div></section>`;
}

function renderAbout() {
  app.innerHTML = `<section class="page-header"><p class="eyebrow">Method / 方法</p><h1 class="display-title">一张地图，<br /><em>两种阅读。</em></h1></section><section class="content-grid"><div class="content-copy"><h2>它怎样工作</h2><p>研究数据保存作者、作品、地点、关系、事实和来源；策展数据决定哪些内容被重点呈现、如何排序；Web Data 把两者转换成页面可以消费的结构。</p><p>普通阅读层负责让人进入，研究层负责让人回查。现实地点有坐标来源，虚构空间不被强行放进现实地图。数据状态不确定时，页面会保留它的不确定。</p><h2>完整测试站范围</h2><p>当前站点已经接入完整页面覆盖、国家到地点地图、三类地图语义筛选、作家/作品/地点页面、研究缺口回退、类型分组搜索、时期时间线和来源证据层。待审策展推荐与 hold 记录仍留在独立队列，不进入公共阅读层。</p></div><aside class="side-rail"><div class="info-box"><h3>当前数据</h3><dl class="info-list"><div><dt>实体</dt><dd>${data.counts.entities}</dd></div><div><dt>作品/作者卡</dt><dd>${data.counts.content_cards}</dd></div><div><dt>正式关系</dt><dd>${data.counts.relationships}</dd></div><div><dt>来源</dt><dd>${data.counts.sources}</dd></div><div><dt>地图节点</dt><dd>${data.counts.places}</dd></div><div><dt>时间线节点</dt><dd>${data.timeline.length}</dd></div></dl></div><div class="info-box"><h3>数据入口</h3><p>本站读取 <code>${escapeHtml(DATA_URL)}</code>。来源、字段和构建规则见项目文档。</p></div></aside></section>`;
}

function renderRelatedNode(id) {
  const item = entity(id);
  if (!item) return renderNotFound();
  const relations = data.research.relationships.filter((relation) => relation.subject_id === id || relation.object_id === id).slice(0, 12);
  const relationMarkup = relations.map((relation) => { const otherId = relation.subject_id === id ? relation.object_id : relation.subject_id; const other = entity(otherId) || place(otherId); return other ? `<a class="search-result" href="${hrefFor(routeTypeFor(otherId), otherId)}"><div><strong>${escapeHtml(other.name_zh)}</strong><small>${escapeHtml(relationTypeLabel(relation.relation_type))} · ${escapeHtml(relation.description_zh || "")}</small></div><span>→</span></a>` : ""; }).join("");
  app.innerHTML = `<section class="page-header"><p class="eyebrow">Research node / 关联研究节点</p><h1 class="display-title">${escapeHtml(item.name_zh)}</h1><div class="page-header-meta"><span class="tag">${escapeHtml(typeLabel(item.entity_type))}</span><span class="tag blue">研究层入口</span></div></section><section class="content-grid"><div class="content-copy"><h2>关联节点，不是完整阅读页</h2><p>该节点保留在正式研究实体和关系中。当前没有独立策展页面模板，页面只呈现可回查的关系与事实状态。</p><div class="search-results">${relationMarkup || "<p>当前没有可展开的正式关系。</p>"}</div>${researchPanel(id)}</div><aside class="side-rail"><div class="info-box"><h3>节点状态</h3><dl class="info-list"><div><dt>实体类型</dt><dd>${escapeHtml(item.entity_type)}</dd></div><div><dt>原文名</dt><dd>${escapeHtml(item.original_name || "—")}</dd></div><div><dt>研究事实</dt><dd>${data.research.facts.filter((fact) => fact.subject_id === id).length}</dd></div><div><dt>正式关系</dt><dd>${relations.length}</dd></div></dl></div></aside></section>`;
}

function renderNotFound() {
  app.innerHTML = `<div class="error-box"><h1>这条路径还没有打开。</h1><p>当前数据包中没有找到对应的实体或地点。返回地图，从已有节点继续探索。</p><a class="back-link" href="#/">回到地图 →</a></div>`;
}

function renderRoute() {
  const hash = window.location.hash.replace(/^#\/?/, "");
  const [route, rawId] = hash.split("?");
  const params = new URLSearchParams(rawId || "");
  const parts = route.split("/").filter(Boolean);
  const [section, id] = parts;
  nav?.querySelectorAll("a").forEach((link) => link.removeAttribute("aria-current"));
  if (!section) { nav?.querySelector('a[href="#/"]')?.setAttribute("aria-current", "page"); renderHome(); return; }
  if (section === "search") { nav?.querySelector('a[href="#/search"]')?.setAttribute("aria-current", "page"); renderSearch(params.get("q") || ""); return; }
  if (section === "timeline") { nav?.querySelector('a[href="#/timeline"]')?.setAttribute("aria-current", "page"); renderTimeline(); return; }
  if (section === "about") { renderAbout(); return; }
  if (section === "country") { renderCountry(decodeURIComponent(id || "")); return; }
  if (section === "place") { renderPlace(decodeURIComponent(id || "")); return; }
  if (section === "author") { renderEntityPage(decodeURIComponent(id || ""), "author"); return; }
  if (section === "work") { renderEntityPage(decodeURIComponent(id || ""), "work"); return; }
  if (section === "node") { renderRelatedNode(decodeURIComponent(id || "")); return; }
  renderNotFound();
}

menuToggle?.addEventListener("click", () => { const open = nav.classList.toggle("open"); menuToggle.setAttribute("aria-expanded", String(open)); });
nav?.addEventListener("click", () => { nav.classList.remove("open"); menuToggle?.setAttribute("aria-expanded", "false"); });
window.addEventListener("hashchange", () => { if (data) { renderRoute(); const reduceMotion = window.matchMedia?.("(prefers-reduced-motion: reduce)").matches; window.scrollTo({ top: 0, behavior: reduceMotion ? "auto" : "smooth" }); window.requestAnimationFrame(() => app.focus({ preventScroll: true })); } });

fetch(DATA_URL)
  .then((response) => { if (!response.ok) throw new Error(`Web Data HTTP ${response.status}`); return response.json(); })
  .then((payload) => { data = payload; renderRoute(); })
  .catch((error) => { app.innerHTML = `<div class="error-box"><h1>数据包没有打开。</h1><p>请通过静态服务器访问网站，使它能够读取 <code>${escapeHtml(DATA_URL)}</code>。错误：${escapeHtml(error.message)}</p><a class="back-link" href="${README_URL}">查看项目说明 →</a></div>`; });
