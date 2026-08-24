const SITE_ROOT = new URL("./", import.meta.url);
const SITE_PATH = SITE_ROOT.pathname;
const DATA_URL = new URL(SITE_ROOT.pathname.endsWith("/site/") ? "../data/v2/web/site_data.json" : "data/v2/web/site_data.json", SITE_ROOT);
const MAP_URL = new URL("assets/latin-america-countries.geojson", SITE_ROOT);
const app = document.querySelector("#app");
const nav = document.querySelector(".main-nav");
const menuToggle = document.querySelector(".menu-toggle");

let data;
let geography;
let mapFilter = "all";
let activeCountry = null;
let activeMapTarget = null;
let searchFilter = "all";
let authorPage = 1;
let workPage = 1;

// Most labels are derived from the GeoJSON geometry.  Overrides are only for
// crowded, island, or unusually narrow shapes; their anchors remain automatic.
const COUNTRY_LABEL_OVERRIDES = {
  GT: [245, 94],
  NI: [326, 148],
  CU: [410, 53],
  VE: [536, 150],
  EC: [379, 230],
  CL: [448, 407],
  UY: [675, 427],
};

const escapeHtml = (value) => String(value ?? "").replace(/[&<>"']/g, (character) => ({
  "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;",
}[character]));
const entity = (id) => data.research.entities.find((item) => item.entity_id === id);
const cardFor = (id) => data.research.content_cards.find((item) => item.subject_id === id);
const place = (id) => data.map.places.find((item) => item.place_id === id);
const factsFor = (id) => data.research.facts.filter((item) => item.subject_id === id);
const fact = (id, ...fields) => factsFor(id).find((item) => fields.includes(item.fact_field));
const relationsFor = (id) => data.research.relationships.filter((item) => item.subject_id === id || item.object_id === id);
const publicPlaces = () => data.map.places.filter((item) => item.map_status !== "hidden" && item.reality_status !== "unknown");
const indexed = (id) => data.search_index.find((item) => item.target_id === id);
const isPublic = (id) => Boolean(indexed(id));

const typeLabel = (value) => ({ author: "作家", work: "作品", place: "地点", fictional_space: "文学空间", country: "国家", event: "历史背景", collection: "作品集", theme: "主题", movement: "文学运动", adaptation: "影视改编", edition: "版本", character: "人物", institution: "机构", person: "人物" }[value] || "文学关联");
const relationLabel = (value) => ({ CREATED: "创作", SET_IN: "故事发生于", ASSOCIATED_WITH_PLACE: "生平与创作地理", BASED_ON_EVENT: "取材于", EXPLORES_THEME: "讨论", CONTAINS_WORK: "收录", ADAPTED_FROM: "改编自", EDITION_OF: "版本源自", DIRECTED: "执导" }[value] || "文学关联");
const factLabel = (value) => ({ birth_year: "出生年份", death_year: "逝世年份", country_or_region: "国家或地区", language: "创作语言", first_publication_year: "首次出版或发表", publication_year: "出版年份", genre_or_form: "体裁", key_character: "主要人物", setting_place: "故事空间", one_sentence_summary: "内容简介", research_note: "研究提示" }[value] || "资料说明");

function routeTypeFor(id) {
  const mapped = place(id);
  if (mapped?.place_kind === "country") return "country";
  if (mapped?.reality_status === "fictional") return "fictional_space";
  if (mapped) return "place";
  const item = entity(id);
  return item?.entity_type === "author" || item?.entity_type === "work" ? item.entity_type : "node";
}

function routePath(type, id) {
  const item = indexed(id);
  if (!item?.public_route) throw new Error(`这条文学路径尚未开放：${id}`);
  return item.public_route;
}

function hrefFor(type, id) {
  const resolved = ["place", "country", "fictional_space"].includes(type) ? routeTypeFor(id) : type;
  return new URL(routePath(resolved, id), SITE_ROOT).pathname;
}

const displayName = (id) => entity(id)?.name_zh || place(id)?.name_zh || "未命名条目";
const curationFor = (id, key) => (data.curation.entries || []).find((item) => item.target_id === id && item.field_key === key);
const contentFor = (group, id) => (data.reader_content?.[group] || []).find((item) => item.target_id === id) || {};
const contentEvidenceFor = (targetId) => Object.values(data.content_evidence || {}).flat()
  .filter((item) => item.target_id === targetId)
  .flatMap((item) => Object.entries(item)
    .filter(([key]) => key !== "target_id")
    .flatMap(([, value]) => value?.source_refs || []));
const publicText = (value) => String(value || "")
  .replace(/\bV1-[A-Z]+-\d+\b/g, "")
  .replace(/V1\s*已审核(?:的)?/g, "已核验的")
  .replace(/V1\s*关系/g, "已核验关系")
  .replace(/V2\s*不使用/g, "本地图不使用")
  .replace(/V2\s*/g, "本项目")
  .replace(/（Codex[^）]*）/gi, "")
  .replace(/Codex[^；。]*[；。]?/gi, "")
  .replace(/（?REVIEW\s*[\d.]+）?/gi, "")
  .trim();
const publicGenre = (value) => {
  const normalized = publicText(value).replace(/\s*\/\s*collection\b/gi, "").trim();
  return /^collection$/i.test(normalized) ? "作品集" : normalized;
};
const cardSummary = (id) => publicText(fact(id, "one_sentence_summary")?.value_text);
const sourceFor = (id) => data.research.sources.find((item) => item.source_id === id);
const sourceIdsForFact = (item) => (item?.sources || []).map((source) => source.source_id);
const sourceIdsForRelation = (item) => (item?.evidence || []).map((source) => source.source_id);

function setMeta(title, description, canonicalPath = "") {
  document.title = title === data.presentation.site.name ? title : `${title}｜${data.presentation.site.name}`;
  document.querySelector('meta[name="description"]')?.setAttribute("content", description);
  document.querySelector('meta[property="og:title"]')?.setAttribute("content", title);
  document.querySelector('meta[property="og:description"]')?.setAttribute("content", description);
  const absolute = new URL(canonicalPath, SITE_ROOT).href;
  document.querySelector('link[rel="canonical"]')?.setAttribute("href", absolute);
  document.querySelector('meta[property="og:url"]')?.setAttribute("content", absolute);
}

function sourceList(ids) {
  const unique = [...new Set((ids || []).filter((id) => String(id).startsWith("SRC-")))];
  if (!unique.length) return "<p>本页没有单独列出的书目。</p>";
  return `<ul class="source-list">${unique.map((id) => {
    const source = sourceFor(id);
    if (!source) return "";
    const title = escapeHtml(source.title);
    const details = [source.author_or_editor, source.publisher, source.publication_year].filter(Boolean).map(escapeHtml).join(" · ");
    return `<li>${source.canonical_url ? `<a href="${escapeHtml(source.canonical_url)}" target="_blank" rel="noreferrer">${title}</a>` : title}${details ? `<small>${details}</small>` : ""}</li>`;
  }).join("")}</ul>`;
}

function researchPanel(targetId, extraSourceIds = []) {
  const facts = factsFor(targetId).filter((item) => ["birth_year", "death_year", "country_or_region", "language", "first_publication_year", "publication_year", "genre_or_form", "key_character", "setting_place"].includes(item.fact_field));
  const relations = relationsFor(targetId).filter((item) => ["CREATED", "SET_IN", "ASSOCIATED_WITH_PLACE", "BASED_ON_EVENT", "EXPLORES_THEME"].includes(item.relation_type));
  const sourceIds = [...extraSourceIds, ...contentEvidenceFor(targetId), ...facts.flatMap(sourceIdsForFact), ...relations.flatMap(sourceIdsForRelation)];
  return `<details class="research-panel"><summary>研究依据与延伸阅读</summary><div class="research-body">
    <section><h3>为什么这样介绍</h3><p>页面依据已核验的基础资料与文学关系组织。只有资料确实不足时，页面才会用自然语言说明。</p>${facts.length ? `<dl class="evidence-list">${facts.slice(0, 8).map((item) => `<div><dt>${factLabel(item.fact_field)}</dt><dd>${escapeHtml(publicText(item.value_text))}</dd></div>`).join("")}</dl>` : ""}</section>
    <section><h3>资料来源</h3>${sourceList(sourceIds)}</section>
  </div></details>`;
}

function cardMarkup(item, { id, type, title, description, meta, kind = "", rank = null }) {
  return `<a class="card ${kind}" data-card-id="${escapeHtml(id)}"${rank ? ` data-discovery-rank="${rank}"` : ""} href="${hrefFor(type, id)}"><div><div class="card-meta"><span>${escapeHtml(meta || typeLabel(type))}</span><span>${escapeHtml(item?.original_name || "")}</span></div><h3>${escapeHtml(title)}</h3><p>${escapeHtml(description || "")}</p></div><span class="card-link">继续探索 →</span></a>`;
}

function authorCard(item, { rank = null } = {}) {
  const card = cardFor(item.entity_id);
  const lede = contentFor("authors", item.entity_id).reader_lede || `${item.name_zh}的生平、作品与文学关联。`;
  return cardMarkup(item, { id: item.entity_id, type: "author", title: item.name_zh, description: lede, meta: card?.country_or_region || "作家", rank });
}

function workCard(item, { rank = null } = {}) {
  const card = cardFor(item.entity_id);
  return cardMarkup(item, { id: item.entity_id, type: "work", title: item.name_zh, description: contentFor("works", item.entity_id).reading_premise || `从《${item.name_zh}》进入它的故事与文学关联。`, meta: [publicGenre(card?.genre_or_form), fact(item.entity_id, "first_publication_year", "publication_year")?.value_text].filter(Boolean).join(" · ") || "作品", rank });
}

function project([longitude, latitude]) {
  return [((longitude + 118) / 86) * 880, ((33 - latitude) / 89) * 560];
}

function polygonPath(coordinates) {
  return coordinates.map((ring) => ring.map((point, index) => `${index ? "L" : "M"}${project(point).map((value) => value.toFixed(1)).join(" ")}`).join("") + "Z").join("");
}

function featurePath(feature) {
  const coordinates = feature.geometry.coordinates;
  return feature.geometry.type === "Polygon" ? polygonPath(coordinates) : coordinates.map(polygonPath).join("");
}

function polygonLabelPoint(ring) {
  const points = ring.map(project);
  let areaTwice = 0;
  let centroidX = 0;
  let centroidY = 0;
  points.forEach((point, index) => {
    const next = points[(index + 1) % points.length];
    const cross = point[0] * next[1] - next[0] * point[1];
    areaTwice += cross;
    centroidX += (point[0] + next[0]) * cross;
    centroidY += (point[1] + next[1]) * cross;
  });
  if (Math.abs(areaTwice) < 0.001) {
    const xs = points.map((point) => point[0]);
    const ys = points.map((point) => point[1]);
    return { area: 0, point: [(Math.min(...xs) + Math.max(...xs)) / 2, (Math.min(...ys) + Math.max(...ys)) / 2] };
  }
  return {
    area: Math.abs(areaTwice / 2),
    point: [centroidX / (3 * areaTwice), centroidY / (3 * areaTwice)],
  };
}

function automaticCountryLabelPoint(feature) {
  // For island groups, label the largest land mass instead of averaging across
  // remote islands.  This calculation is presentation-only and never writes to
  // Research Data or the literary-place coordinate layer.
  const polygons = feature.geometry.type === "Polygon"
    ? [feature.geometry.coordinates]
    : feature.geometry.coordinates;
  return polygons
    .map((polygon) => polygonLabelPoint(polygon[0]))
    .sort((first, second) => second.area - first.area)[0].point;
}

function literaryConnectionsFor(placeIds, includeWorkCreators = false) {
  const scope = new Set(placeIds);
  const mapRelations = data.map.relations.filter((item) => scope.has(item.target_place_id));
  const authorIds = new Set(mapRelations
    .filter((item) => entity(item.source_entity_id)?.entity_type === "author" && isPublic(item.source_entity_id))
    .map((item) => item.source_entity_id));
  const workIds = new Set(mapRelations
    .filter((item) => entity(item.source_entity_id)?.entity_type === "work" && isPublic(item.source_entity_id))
    .map((item) => item.source_entity_id));
  if (includeWorkCreators) {
    data.research.relationships
      .filter((item) => item.relation_type === "CREATED" && workIds.has(item.object_id) && isPublic(item.subject_id))
      .forEach((item) => authorIds.add(item.subject_id));
  }
  return {
    authors: [...authorIds].map(entity).filter(Boolean),
    works: [...workIds].map(entity).filter(Boolean),
  };
}

function countryLiteraryContext(countryId) {
  const allChildren = publicPlaces().filter((item) => item.parent_place_id === countryId && isPublic(item.place_id));
  const children = allChildren.filter((item) => item.reality_status === "real");
  return {
    allChildren,
    children,
    ...literaryConnectionsFor([countryId, ...allChildren.map((item) => item.place_id)]),
  };
}

function allowedMapRoles(filter = mapFilter) {
  return { author_geography: ["author_geography"], story_setting: ["story_setting"], all: ["author_geography", "story_setting"] }[filter] || [];
}

function visibleRealMapPlaces(filter = mapFilter) {
  const roles = allowedMapRoles(filter);
  const relatedPlaceIds = new Set(data.map.relations.filter((item) => roles.includes(item.map_relation_role)).map((item) => item.target_place_id));
  return publicPlaces().filter((item) => item.reality_status === "real" && item.place_kind !== "country" && item.latitude != null && (!activeCountry || item.parent_place_id === activeCountry) && relatedPlaceIds.has(item.place_id));
}

function mapContextFor(target) {
  if (!target) return null;
  const mapped = place(target.id);
  if (!mapped) return null;
  const fictional = target.type === "fictional_space";
  const connections = target.type === "country"
    ? countryLiteraryContext(target.id)
    : { children: [], ...literaryConnectionsFor([target.id], fictional) };
  const copy = contentFor("places", target.id);
  const curationKey = fictional ? "fictional_space_note" : "literary_place_note";
  const description = copy.literary_intro
    || (fictional ? "这是一处由文学作品创造的空间。" : `从${mapped.name_zh}的作家、作品与文学地点开始探索。`);
  return {
    mapped,
    type: target.type,
    description,
    children: connections.children,
    authors: connections.authors,
    works: connections.works,
  };
}

function mapContextPanelMarkup() {
  const context = mapContextFor(activeMapTarget);
  if (!context) return `<aside class="map-context-panel is-empty" tabindex="-1" aria-live="polite" aria-labelledby="map-context-title"><p class="eyebrow">地图上的阅读入口</p><h2 id="map-context-title">从一个地方开始</h2><p>选择一个国家、现实地点或文学虚构空间，看看有哪些作家和作品从这里展开。</p><div class="context-prompt"><span>01</span><p>先点选地图，再沿文学关系继续阅读。</p></div></aside>`;
  const { mapped, type, description, children, authors, works } = context;
  const label = type === "country" ? "国家文学入口" : type === "fictional_space" ? "文学虚构空间" : "现实地点";
  const routeType = type === "country" ? "country" : type === "fictional_space" ? "fictional_space" : "place";
  return `<aside class="map-context-panel" tabindex="-1" aria-live="polite" aria-labelledby="map-context-title"><p class="eyebrow">${label}</p><h2 id="map-context-title">${escapeHtml(mapped.name_zh)}</h2>${mapped.original_name ? `<p class="context-original">${escapeHtml(mapped.original_name)}</p>` : ""}<p>${escapeHtml(description)}</p>
    <section><h3>从这里认识作家</h3><div class="context-links">${authors.slice(0, 4).map((item) => `<a href="${hrefFor("author", item.entity_id)}"><strong>${escapeHtml(item.name_zh)}</strong><span>作家 →</span></a>`).join("") || "<p>还没有可展示的相关作家。</p>"}</div></section>
    <section><h3>${type === "fictional_space" ? "它出现在哪些作品中" : "与这里相关的作品"}</h3><div class="context-links">${works.slice(0, 4).map((item) => `<a href="${hrefFor("work", item.entity_id)}"><strong>${escapeHtml(item.name_zh)}</strong><span>作品 →</span></a>`).join("") || "<p>还没有可展示的相关作品。</p>"}</div></section>
    ${children.length ? `<section><h3>继续探索地点</h3><div class="context-links compact">${children.slice(0, 5).map((item) => `<a href="${hrefFor("place", item.place_id)}"><strong>${escapeHtml(item.name_zh)}</strong><span>地点 →</span></a>`).join("")}</div></section>` : ""}
    <a class="context-detail-link" href="${hrefFor(routeType, mapped.place_id)}">打开${escapeHtml(mapped.name_zh)}完整页面 →</a></aside>`;
}

function mapMarkup() {
  const countries = publicPlaces().filter((item) => item.place_kind === "country");
  const countryByCode = new Map(countries.map((item) => [item.country_code, item]));
  const featureByCode = new Map(geography.features.map((feature) => [feature.properties.ISO_A2, feature]));
  const selectedCode = place(activeCountry)?.country_code;
  const shapes = geography.features.map((feature) => {
    const code = feature.properties.ISO_A2;
    const country = countryByCode.get(code);
    const active = selectedCode === code;
    return `<path d="${featurePath(feature)}" class="country-shape ${country ? "available" : ""} ${active ? "active" : ""}" ${country ? `data-country-id="${escapeHtml(country.place_id)}" tabindex="0" role="button" aria-pressed="${active}" aria-label="探索${escapeHtml(country.name_zh)}文学"` : `aria-hidden="true"`}><title>${escapeHtml(country?.name_zh || feature.properties.ADMIN)}</title></path>`;
  }).join("");
  const countryLabels = [...countryByCode.entries()].map(([code, country]) => {
    const feature = featureByCode.get(code);
    if (!feature) return "";
    const anchor = automaticCountryLabelPoint(feature);
    const override = COUNTRY_LABEL_OVERRIDES[code];
    const [x, y] = override || anchor;
    const leader = override
      ? `<line x1="${anchor[0].toFixed(1)}" y1="${anchor[1].toFixed(1)}" x2="${x}" y2="${y - 4}"></line>`
      : "";
    return `<g class="country-label-group" aria-hidden="true">${leader}<text class="country-label" data-country-label-code="${escapeHtml(code)}" data-label-position="${override ? "override" : "automatic"}" x="${x.toFixed(1)}" y="${y.toFixed(1)}" text-anchor="middle">${escapeHtml(country.name_zh)}</text></g>`;
  }).join("");
  const realNodes = visibleRealMapPlaces();
  const labelOffsets = { "V1-ENT-0052": [10, -12], "V1-ENT-0053": [10, 16], "V1-ENT-0054": [-72, 16], "V1-ENT-0056": [10, -20] };
  const points = realNodes.map((item) => {
    const [x, y] = project([item.longitude, item.latitude]);
    const [dx, dy] = labelOffsets[item.place_id] || [10, 4];
    const active = activeMapTarget?.type === "place" && activeMapTarget.id === item.place_id;
    return `<g class="map-point ${active ? "active" : ""}" data-place-id="${escapeHtml(item.place_id)}" tabindex="0" role="button" aria-pressed="${active}" aria-label="查看${escapeHtml(item.name_zh)}的文学关联"><circle cx="${x}" cy="${y}" r="6"></circle><text x="${x + dx}" y="${y + dy}">${escapeHtml(item.name_zh)}</text></g>`;
  }).join("");
  const fictionalNodes = publicPlaces().filter((item) => item.reality_status === "fictional" && isPublic(item.place_id));
  const fictionalInset = `<section class="fictional-space-inset" aria-labelledby="fictional-space-title"><p id="fictional-space-title">写出来的地方</p><span>不使用现实坐标</span><div>${fictionalNodes.map((item) => { const active = activeMapTarget?.type === "fictional_space" && activeMapTarget.id === item.place_id; return `<button type="button" class="fictional-space-button ${active ? "active" : ""}" data-fictional-space-id="${escapeHtml(item.place_id)}" aria-pressed="${active}"><i aria-hidden="true"></i><strong>${escapeHtml(item.name_zh)}</strong></button>`; }).join("")}</div></section>`;
  return `<div class="map-shell"><div class="map-toolbar"><strong>从国家与地点进入文学</strong><div class="map-legend"><span><i class="legend-swatch country"></i>可探索国家</span><span><i class="legend-swatch place"></i>现实地点</span><span><i class="legend-swatch fictional"></i>文学虚构空间</span></div></div><div class="map-layout"><div class="map-canvas"><svg viewBox="0 0 880 560" aria-labelledby="map-title map-description"><title id="map-title">拉丁美洲文学地图</title><desc id="map-description">真实国家边界以及依据坐标投影的文学地点。地图持续显示可探索国家的中文名称；选择国家、现实地点或文学虚构空间，在右侧查看相关作家和作品。</desc><g>${shapes}</g><g>${countryLabels}</g><g>${points}</g></svg>${fictionalInset}</div>${mapContextPanelMarkup()}</div><div class="map-footer"><div class="map-filter">${[["all","全部地点"],["author_geography","作家地理"],["story_setting","故事空间"]].map(([key,label]) => `<button class="chip ${mapFilter === key ? "active" : ""}" aria-pressed="${mapFilter === key}" data-map-filter="${key}">${label}</button>`).join("")}</div><button class="map-reset" type="button" data-map-reset>${activeMapTarget ? "清除选择，返回完整地图" : "点击地图上的地点开始"}</button></div></div>`;
}

function discoveryItems(group) {
  return (data.presentation.discovery?.[group] || [])
    .map((ranking) => ({ ...ranking, item: entity(ranking.target_id) }))
    .filter((ranking) => ranking.item && isPublic(ranking.target_id));
}

function paginationMarkup(group, currentPage, totalItems) {
  const pageSize = data.presentation.discovery?.page_size || 9;
  const pageCount = Math.max(1, Math.ceil(totalItems / pageSize));
  const label = group === "authors" ? "作家" : "作品";
  return `<nav class="catalog-pagination" aria-label="${label}分页"><button type="button" data-catalog-page="${group}" data-page="${currentPage - 1}" ${currentPage === 1 ? "disabled" : ""}>上一页</button><div>${Array.from({ length: pageCount }, (_, index) => index + 1).map((pageNumber) => `<button type="button" data-catalog-page="${group}" data-page="${pageNumber}" ${pageNumber === currentPage ? `aria-current="page"` : ""} aria-label="${label}第 ${pageNumber} 页">${pageNumber}</button>`).join("")}</div><button type="button" data-catalog-page="${group}" data-page="${currentPage + 1}" ${currentPage === pageCount ? "disabled" : ""}>下一页</button></nav>`;
}

function catalogMarkup(group, currentPage) {
  const ranked = discoveryItems(group);
  const pageSize = data.presentation.discovery?.page_size || 9;
  const pageCount = Math.max(1, Math.ceil(ranked.length / pageSize));
  const safePage = Math.min(Math.max(1, currentPage), pageCount);
  const pageItems = ranked.slice((safePage - 1) * pageSize, safePage * pageSize);
  const authorGroup = group === "authors";
  const heading = authorGroup ? "浏览全部作家" : "浏览全部作品";
  const description = authorGroup ? "从不同国家与写作传统中选择你的入口。" : "从故事、体裁与文学关联中选择下一本书。";
  return `<section class="section catalog-browser" data-catalog="${group}"><div class="section-heading"><h2 id="${group}-catalog-heading" tabindex="-1">${heading}</h2><p>${description} 当前共 ${ranked.length} 项。</p></div><details class="ranking-note"><summary>这些内容如何排序？</summary><p>顺序由一套固定规则生成：综合重要文学奖项、可继续阅读的公开作品、介绍完整度、延伸阅读丰富度和阅读路径连接；分数相同时使用稳定编号排序。它不采用实时流量，也不设置人工置顶。</p></details><p class="catalog-status" aria-live="polite">第 ${safePage} / ${pageCount} 页，显示第 ${(safePage - 1) * pageSize + 1}—${Math.min(safePage * pageSize, ranked.length)} 项</p><div class="card-grid">${pageItems.map((ranking) => authorGroup ? authorCard(ranking.item, { rank: ranking.rank }) : workCard(ranking.item, { rank: ranking.rank })).join("")}</div>${paginationMarkup(group, safePage, ranked.length)}</section>`;
}

function renderHome(focusContext = false) {
  const periods = data.presentation.timeline_periods.slice(0, 5);
  const publicPaths = data.presentation.reading_paths || [];
  const navigationPaths = publicPaths.length ? publicPaths.map((path) => ({ ...path, href: new URL(`paths/${path.slug}/`, SITE_ROOT).pathname })) : [
    { title: "从文学虚构空间进入", description: "先认识马孔多与科马拉，再回到创造它们的作品和作家。", href: hrefFor("fictional_space", "V1-ENT-0097") },
    { title: "从一篇短篇小说进入", description: "从篇幅较短的作品开始，认识叙事形式与文学空间。", href: `${new URL("search/", SITE_ROOT).pathname}?q=${encodeURIComponent("短篇小说")}` },
    { title: "从巴西文学进入", description: "沿里约热内卢、作品与作家认识葡萄牙语文学。", href: hrefFor("country", "V2-GEO-BR") },
    { title: "沿时间进入", description: "按首次发表年份查看作家和作品，在年代之间建立阅读线索。", href: new URL("timeline/", SITE_ROOT).pathname },
  ];
  setMeta(data.presentation.site.name, data.presentation.site.description);
  app.innerHTML = `<section class="hero home-hero"><div><p class="eyebrow">A literary map of Latin America</p><h1 class="display-title">拉丁美洲<br /><em>文学地图</em></h1><p class="lede">从一个地方开始，进入拉丁美洲文学。</p><a class="hero-map-link" href="#literary-map">从地图开始 →</a></div><aside class="hero-note"><p>在地图上发现国家、城市、作家和作品，再沿着时间、主题与文学关系继续阅读。</p></aside></section>
  <section class="map-first" id="literary-map">${mapMarkup()}</section>
  ${catalogMarkup("authors", authorPage)}
  <section class="section"><div class="section-heading"><h2>如何进入拉美文学</h2><p>不必先读完文学史。可以从空间、篇幅、语言区域或时间开始。</p></div><div class="path-grid">${navigationPaths.slice(0, 10).map((path, index) => `<a class="path-card" href="${path.href}"><span>${String(index + 1).padStart(2, "0")}</span><h3>${escapeHtml(path.title)}</h3><p>${escapeHtml(path.description)}</p><b>打开探索入口 →</b></a>`).join("")}</div></section>
  ${catalogMarkup("works", workPage)}
  <section class="section timeline-preview"><div><p class="eyebrow">沿时间进入</p><h2>把作家和作品放回时间中。</h2><p>${escapeHtml(data.presentation.timeline_note || "先按作家的生卒年与作品的发表年份建立时间感，再沿年代继续阅读。")}</p><a class="text-link" href="${new URL("timeline/", SITE_ROOT).pathname}">打开文学时间线 →</a></div>${periods.length ? `<ol>${periods.map((period) => `<li><span>${escapeHtml(period.display_range || `${period.start}—${period.end}`)}</span><strong>${escapeHtml(period.title)}</strong></li>`).join("")}</ol>` : ""}</section>
  <section class="section about-preview"><div><p class="eyebrow">关于项目</p><h2>地点怎样进入文学，文学又怎样重新创造地点？</h2></div><p>这张地图不是把作家简单钉在出生地上，而是邀请你观察：一座城市如何塑造写作，一段历史如何进入故事，一个虚构空间又如何改变我们理解现实的方式。</p><a class="text-link" href="${new URL("about/", SITE_ROOT).pathname}">为什么做这张地图 →</a></section>`;
  bindMapInteractions();
  bindCatalogPagination();
  if (focusContext) document.querySelector(".map-context-panel")?.focus({ preventScroll: true });
}

function bindCatalogPagination() {
  document.querySelectorAll("[data-catalog-page]").forEach((button) => button.addEventListener("click", () => {
    const group = button.dataset.catalogPage;
    const nextPage = Number(button.dataset.page);
    if (group === "authors") authorPage = nextPage;
    if (group === "works") workPage = nextPage;
    renderHome();
    requestAnimationFrame(() => {
      const heading = document.querySelector(`#${group}-catalog-heading`);
      heading?.scrollIntoView({ block: "start" });
      heading?.focus({ preventScroll: true });
    });
  }));
}

function bindMapInteractions() {
  const bindSelection = (selector, type, idKey) => document.querySelectorAll(selector).forEach((element) => {
    const activate = () => {
      const id = element.dataset[idKey];
      activeMapTarget = { type, id };
      if (type === "country") activeCountry = id;
      else activeCountry = place(id)?.parent_place_id || null;
      renderHome(true);
    };
    element.addEventListener("click", activate);
    element.addEventListener("keydown", (event) => { if (["Enter", " "].includes(event.key)) { event.preventDefault(); activate(); } });
  });
  document.querySelectorAll("[data-map-filter]").forEach((button) => button.addEventListener("click", () => {
    mapFilter = button.dataset.mapFilter;
    const selectedPlaceIsVisible = activeMapTarget?.type !== "place" || visibleRealMapPlaces().some((item) => item.place_id === activeMapTarget.id);
    if (!selectedPlaceIsVisible) {
      const currentCountry = place(activeCountry);
      activeMapTarget = currentCountry?.place_kind === "country" && isPublic(activeCountry) ? { type: "country", id: activeCountry } : null;
    }
    renderHome(!selectedPlaceIsVisible);
  }));
  bindSelection("[data-country-id]", "country", "countryId");
  bindSelection("[data-place-id]", "place", "placeId");
  bindSelection("[data-fictional-space-id]", "fictional_space", "fictionalSpaceId");
  document.querySelector("[data-map-reset]")?.addEventListener("click", () => { activeCountry = null; activeMapTarget = null; renderHome(); });
}

function renderPath(slug) {
  const path = data.presentation.reading_paths.find((item) => item.slug === slug);
  if (!path) return renderNotFound();
  const targets = path.target_ids.map((id) => entity(id) || place(id)).filter(Boolean);
  setMeta(path.title, path.description, `paths/${slug}/`);
  app.innerHTML = `<section class="page-header"><p class="eyebrow">策展阅读路径</p><h1 class="display-title">${escapeHtml(path.title)}</h1><p class="lede">${escapeHtml(path.intro || path.description)}</p></section><section class="section"><div class="reading-sequence">${targets.map((item, index) => `<div><span>${String(index + 1).padStart(2, "0")}</span>${item.entity_type === "author" ? authorCard(item) : item.entity_type === "work" ? workCard(item) : placeCard(place(item.entity_id || item.place_id))}</div>`).join("")}</div></section>${path.guiding_question ? `<section class="section guiding-question"><p class="eyebrow">带着一个问题继续</p><blockquote>${escapeHtml(path.guiding_question)}</blockquote></section>` : ""}`;
}

function renderCountry(id) {
  const country = place(id);
  if (!country || country.map_status === "hidden") return renderNotFound();
  const copy = contentFor("places", id);
  const { allChildren: children, authors, works } = countryLiteraryContext(id);
  const note = copy.literary_intro || `从${country.name_zh}的作家、作品与文学地点开始探索。`;
  setMeta(`${country.name_zh}文学`, note, routePath("country", id));
  app.innerHTML = `<section class="page-header"><p class="eyebrow">国家文学入口</p><h1 class="display-title">${escapeHtml(country.name_zh)}</h1><p class="lede">${escapeHtml(note)}</p></section>${copy.spatial_meaning ? `<section class="section"><div class="section-heading"><h2>这里为什么值得注意</h2></div><p class="lede compact">${escapeHtml(copy.spatial_meaning)}</p></section>` : ""}<section class="section"><div class="section-heading"><h2>从这里认识作家</h2><p>从这个国家及其文学地点继续认识相关作家。</p></div><div class="card-grid">${authors.map(authorCard).join("") || "<p>还没有可展示的相关作家。</p>"}</div></section><section class="section"><div class="section-heading"><h2>重要地点与文学空间</h2></div><div class="card-grid">${children.map(placeCard).join("") || "<p>还没有可继续探索的地点。</p>"}</div></section><section class="section"><div class="section-heading"><h2>发生在这里的作品</h2></div><div class="card-grid">${works.map(workCard).join("") || "<p>还没有可展示的相关作品。</p>"}</div></section>${copy.exploration_route ? `<section class="section guiding-question"><p class="eyebrow">从这里继续</p><blockquote>${escapeHtml(copy.exploration_route)}</blockquote></section>` : ""}`;
}

function placeCard(item) {
  const fictional = item.reality_status === "fictional";
  const note = contentFor("places", item.place_id).literary_intro || (fictional ? "一处由作品创造的文学空间。" : "一处可以从文学关系继续探索的现实地点。");
  return cardMarkup(item, { id: item.place_id, type: fictional ? "fictional_space" : "place", title: item.name_zh, description: note, meta: fictional ? "文学虚构空间" : "现实地点", kind: fictional ? "fictional" : "place" });
}

function renderPlace(id) {
  const item = place(id);
  if (!item || item.map_status === "hidden" || item.reality_status === "unknown") return renderNotFound();
  const fictional = item.reality_status === "fictional";
  const entry = curationFor(id, fictional ? "fictional_space_note" : "literary_place_note");
  const mapRelations = data.map.relations.filter((relation) => relation.target_place_id === id);
  const authors = mapRelations.filter((relation) => entity(relation.source_entity_id)?.entity_type === "author" && isPublic(relation.source_entity_id));
  const works = mapRelations.filter((relation) => entity(relation.source_entity_id)?.entity_type === "work" && isPublic(relation.source_entity_id));
  const copy = contentFor("places", id);
  const text = copy.literary_intro || (fictional ? "这是一处由文学作品创造的空间。" : "这个地点因作家生平或作品故事而进入文学地图。");
  const sourceIds = [...(entry?.source_refs || []), ...mapRelations.flatMap((item) => item.source_refs || [])];
  setMeta(item.name_zh, text, routePath(fictional ? "fictional_space" : "place", id));
  app.innerHTML = `<section class="page-header ${fictional ? "fictional-header" : ""}"><p class="eyebrow">${fictional ? "文学虚构空间" : "文学地点"}</p><h1 class="display-title">${escapeHtml(item.name_zh)}</h1><div class="page-header-meta"><span class="tag ${fictional ? "blue" : "green"}">${fictional ? "由作品创造的空间" : "现实地点"}</span>${item.original_name ? `<span class="tag">${escapeHtml(item.original_name)}</span>` : ""}</div><p class="lede">${escapeHtml(text)}</p></section><section class="content-grid"><div class="content-copy">${copy.spatial_meaning ? `<h2>这里为什么值得注意</h2><p>${escapeHtml(copy.spatial_meaning)}</p>` : ""}<h2>${fictional ? "它出现在哪里" : "这里为什么与文学有关"}</h2><div class="linked-list">${[...works, ...authors].map((relation) => { const source = entity(relation.source_entity_id); return `<a href="${hrefFor(routeTypeFor(source.entity_id), source.entity_id)}"><strong>${escapeHtml(source.name_zh)}</strong><span>${escapeHtml(relation.description_zh || relationLabel(relation.relation_type))}</span></a>`; }).join("") || "<p>还没有可展示的文学关联。</p>"}</div>${item.entity_id ? researchPanel(item.entity_id, sourceIds) : sourceList(sourceIds)}</div><aside class="side-rail">${copy.exploration_route ? `<div class="info-box"><h3>从这里继续</h3><p>${escapeHtml(copy.exploration_route)}</p></div>` : ""}<div class="info-box"><h3>直接入口</h3>${works.map((relation) => `<a class="text-link block" href="${hrefFor("work", relation.source_entity_id)}">${escapeHtml(displayName(relation.source_entity_id))} →</a>`).join("")}${authors.map((relation) => `<a class="text-link block" href="${hrefFor("author", relation.source_entity_id)}">${escapeHtml(displayName(relation.source_entity_id))} →</a>`).join("")}</div>${fictional ? `<div class="info-box"><h3>空间说明</h3><p>文学虚构空间不使用现实坐标。地图将它作为独立的文学入口呈现。</p></div>` : ""}</aside></section>`;
}

function relationCards(items) {
  return items.map((relation) => {
    const otherId = relation.subject_id === relation._focus ? relation.object_id : relation.subject_id;
    const other = entity(otherId) || place(otherId);
    if (!other || !isPublic(otherId)) return "";
    return `<a class="linked-item" href="${hrefFor(routeTypeFor(otherId), otherId)}"><strong>${escapeHtml(other.name_zh)}</strong><span>${escapeHtml(publicText(relation.description_zh) || relationLabel(relation.relation_type))}</span></a>`;
  }).join("");
}

function renderAuthor(id) {
  const item = entity(id);
  const card = cardFor(id);
  if (!item || item.entity_type !== "author" || !isPublic(id)) return renderNotFound();
  const copy = contentFor("authors", id);
  const allRelations = relationsFor(id);
  const allWorks = allRelations.filter((relation) => relation.subject_id === id && relation.relation_type === "CREATED").map((relation) => entity(relation.object_id)).filter(Boolean).sort((first, second) => Number(fact(first.entity_id, "first_publication_year", "publication_year")?.value_text || 9999) - Number(fact(second.entity_id, "first_publication_year", "publication_year")?.value_text || 9999));
  const works = allWorks.filter((work) => isPublic(work.entity_id));
  const places = allRelations.filter((relation) => relation.subject_id === id && relation.relation_type === "ASSOCIATED_WITH_PLACE").map((relation) => place(relation.object_id)).filter((mapped) => mapped && isPublic(mapped.place_id));
  const birth = fact(id, "birth_year")?.value_text;
  const death = fact(id, "death_year")?.value_text;
  const lede = copy.reader_lede || `${item.name_zh}的生平、作品与文学关联。`;
  const keywords = copy.signature_keywords || (copy.literary_features || []).map((feature) => feature.title).slice(0, 3);
  const bibliographicWorks = allWorks.filter((work) => !isPublic(work.entity_id)).slice(0, Math.max(0, 3 - works.length));
  setMeta(item.name_zh, lede, routePath("author", id));
  app.innerHTML = `<section class="page-header"><p class="eyebrow">作家</p><h1 class="display-title">${escapeHtml(item.name_zh)}</h1><div class="page-header-meta"><span class="tag coral">${escapeHtml(item.original_name || "")}</span>${card?.country_or_region ? `<span class="tag">${escapeHtml(card.country_or_region)}</span>` : ""}${birth ? `<span class="tag">${birth}${death ? `—${death}` : "—"}</span>` : ""}</div><div class="keyword-row">${keywords.map((keyword) => `<span>${escapeHtml(keyword)}</span>`).join("")}</div><p class="lede">${escapeHtml(lede)}</p></section>
  ${copy.why_know ? `<section class="section"><div class="section-heading"><h2>为什么值得认识</h2></div><p class="lede compact">${escapeHtml(copy.why_know)}</p></section>` : ""}
  ${copy.reader_fit ? `<section class="section reader-fit"><p class="eyebrow">如果你喜欢……</p><p class="lede compact">${escapeHtml(copy.reader_fit)}</p></section>` : ""}
  <section class="section"><div class="section-heading"><h2>从哪里认识他 / 她</h2><p>沿生平、创作与地点之间的联系继续。</p></div><div class="card-grid">${places.map(placeCard).join("") || "<p>还没有可展示的相关地点。</p>"}</div></section>
  <section class="section"><div class="section-heading"><h2>读什么</h2><p>从作品导读进入，也可以顺着代表书目了解创作脉络。</p></div><div class="card-grid">${works.map(workCard).join("")}${bibliographicWorks.map((work) => `<article class="card bibliography-card"><div><div class="card-meta"><span>代表作品</span><span>${escapeHtml(fact(work.entity_id, "first_publication_year", "publication_year")?.value_text || "")}</span></div><h3>${escapeHtml(work.name_zh)}</h3><p>${escapeHtml(work.original_name || "")}</p></div></article>`).join("")}</div></section>
  ${copy.literary_features ? `<section class="section"><div class="section-heading"><h2>写作的辨识度</h2><p>从叙事方式与语言特征进入。</p></div><div class="feature-grid">${copy.literary_features.map((feature) => `<article><h3>${escapeHtml(feature.title)}</h3><p>${escapeHtml(feature.text)}</p></article>`).join("")}</div></section>` : ""}
  ${copy.core_themes ? `<section class="section themes-section"><div class="section-heading"><h2>他 / 她在写什么</h2><p>沿核心主题继续理解作品。</p></div><div class="theme-grid">${copy.core_themes.map((topic) => `<article><h3>${escapeHtml(topic.title)}</h3><p>${escapeHtml(topic.text)}</p></article>`).join("")}</div></section>` : ""}
  ${copy.reading_route ? `<section class="section"><div class="section-heading"><h2>一条阅读路线</h2><p>从入门到继续探索，每一步都指向下一层文学问题。</p></div><ol class="route-steps">${copy.reading_route.map((step) => `<li>${escapeHtml(step)}</li>`).join("")}</ol></section>` : ""}
  ${copy.guiding_question ? `<section class="section guiding-question"><p class="eyebrow">带着一个问题去读</p><blockquote>${escapeHtml(copy.guiding_question)}</blockquote></section>` : ""}
  <section class="section"><div class="section-heading"><h2>文学关系</h2><p>沿作品与地点之间的联系继续。</p></div><div class="linked-list">${works.slice(0, 3).map((work) => `<a class="linked-item" href="${hrefFor("work", work.entity_id)}"><strong>${escapeHtml(work.name_zh)}</strong><span>由${escapeHtml(item.name_zh)}创作</span></a>`).join("")}${places.slice(0, 3).map((mapped) => `<a class="linked-item" href="${hrefFor(routeTypeFor(mapped.place_id), mapped.place_id)}"><strong>${escapeHtml(mapped.name_zh)}</strong><span>与生平或创作有关的地点</span></a>`).join("")}</div>${researchPanel(id, curationFor(id, "page_lede")?.source_refs)}</section>`;
}

function renderWork(id) {
  const item = entity(id);
  const card = cardFor(id);
  if (!item || item.entity_type !== "work" || !isPublic(id)) return renderNotFound();
  const copy = contentFor("works", id);
  const allRelations = relationsFor(id);
  const authors = allRelations.filter((relation) => relation.object_id === id && relation.relation_type === "CREATED").map((relation) => entity(relation.subject_id)).filter(Boolean);
  const locations = allRelations.filter((relation) => relation.subject_id === id && relation.relation_type === "SET_IN").map((relation) => place(relation.object_id)).filter((mapped) => mapped && mapped.map_status !== "hidden" && mapped.reality_status !== "unknown");
  const connections = allRelations.filter((relation) => !["CREATED", "SET_IN", "EXPLORES_THEME"].includes(relation.relation_type)).map((relation) => ({...relation, _focus:id}));
  const summary = copy.reading_premise || `从《${item.name_zh}》进入它的故事与文学关联。`;
  const introduction = copy.story_intro || summary;
  const year = fact(id, "first_publication_year", "publication_year")?.value_text;
  const genre = publicGenre(fact(id, "genre_or_form")?.value_text || card?.genre_or_form);
  const whyRead = copy.why_read || data.presentation.why_read.find((entry) => entry.work_id === id)?.points;
  const nextReads = (copy.next_reads || data.presentation.next_reads.filter((entry) => entry.from_id === id).map((entry) => ({ target_id: entry.to_id, reason: entry.reason }))).map((entry) => ({ target: entity(entry.target_id), reason: entry.reason }));
  const authorLabel = authors[0] ? (isPublic(authors[0].entity_id) ? `<a class="tag" href="${hrefFor("author", authors[0].entity_id)}">${escapeHtml(authors[0].name_zh)}</a>` : `<span class="tag">${escapeHtml(authors[0].name_zh)}</span>`) : "";
  const authorConnections = authors.map((author) => isPublic(author.entity_id)
    ? `<a class="linked-item" href="${hrefFor("author", author.entity_id)}"><strong>${escapeHtml(author.name_zh)}</strong><span>作者</span></a>`
    : `<article class="linked-item"><strong>${escapeHtml(author.name_zh)}</strong><span>作者</span></article>`).join("");
  setMeta(item.name_zh, summary, routePath("work", id));
  app.innerHTML = `<section class="page-header"><p class="eyebrow">作品</p><h1 class="display-title">${escapeHtml(item.name_zh)}</h1><div class="page-header-meta"><span class="tag coral">${escapeHtml(item.original_name || "")}</span>${authorLabel}${year ? `<span class="tag">${escapeHtml(year)}</span>` : ""}${genre ? `<span class="tag">${escapeHtml(genre)}</span>` : ""}${card?.country_or_region ? `<span class="tag">${escapeHtml(card.country_or_region)}</span>` : ""}</div><p class="lede">${escapeHtml(summary)}</p></section>
  <section class="content-grid"><div class="content-copy"><h2>它讲了什么</h2><p>${escapeHtml(introduction)}</p>${whyRead ? `<h2>为什么值得读</h2><div class="feature-grid">${whyRead.map((point) => `<article><h3>${escapeHtml(point.title)}</h3><p>${escapeHtml(point.text)}</p></article>`).join("")}</div>` : ""}</div><aside class="side-rail"><div class="info-box"><h3>作品概览</h3><dl class="info-list">${authors[0] ? `<div><dt>作者</dt><dd>${escapeHtml(authors[0].name_zh)}</dd></div>` : ""}${year ? `<div><dt>首次出版/发表</dt><dd>${escapeHtml(year)}</dd></div>` : ""}${genre ? `<div><dt>体裁</dt><dd>${escapeHtml(genre)}</dd></div>` : ""}${card?.country_or_region ? `<div><dt>国家或地区</dt><dd>${escapeHtml(card.country_or_region)}</dd></div>` : ""}</dl></div>${copy.reading_approach ? `<div class="info-box"><h3>怎么读这本书</h3><p>${escapeHtml(copy.reading_approach)}</p></div>` : ""}</aside></section>
  ${copy.narrative_features ? `<section class="section"><div class="section-heading"><h2>叙事与形式</h2><p>从叙事结构与语言方式进入。</p></div><div class="feature-grid">${copy.narrative_features.map((feature) => `<article><h3>${escapeHtml(feature.title)}</h3><p>${escapeHtml(feature.text)}</p></article>`).join("")}</div></section>` : ""}
  ${locations.length || copy.location_note ? `<section class="section"><div class="section-heading"><h2>它发生在哪里</h2>${copy.location_note ? `<p>${escapeHtml(copy.location_note)}</p>` : ""}</div><div class="card-grid">${locations.map(placeCard).join("")}</div></section>` : ""}
  ${copy.theme_explanations ? `<section class="section"><div class="section-heading"><h2>它在讨论什么</h2><p>沿核心主题继续理解作品。</p></div><div class="theme-grid">${copy.theme_explanations.map((clue) => `<article><h3>${escapeHtml(clue.title)}</h3><p>${escapeHtml(clue.text)}</p></article>`).join("")}</div></section>` : ""}
  ${copy.literary_significance ? `<section class="section significance"><div class="section-heading"><h2>文学史位置</h2></div><p class="lede compact">${escapeHtml(copy.literary_significance)}</p></section>` : ""}
  ${copy.guiding_question ? `<section class="section guiding-question"><p class="eyebrow">带着一个问题去读</p><blockquote>${escapeHtml(copy.guiding_question)}</blockquote></section>` : ""}
  <section class="section"><div class="section-heading"><h2>文学关联</h2></div><div class="linked-list">${authorConnections}${relationCards(connections)}</div></section>
  ${nextReads.length ? `<section class="section"><div class="section-heading"><h2>读完之后读什么</h2><p>每条路径都说明它与本书的连接方式。</p></div><div class="card-grid">${nextReads.map((entry) => entry.target && isPublic(entry.target.entity_id) ? cardMarkup(entry.target, { id: entry.target.entity_id, type: "work", title: entry.target.name_zh, description: entry.reason, meta: "继续阅读" }) : "").join("")}</div></section>` : ""}
  <section class="section">${researchPanel(id, curationFor(id, "one_line_summary")?.source_refs || [])}</section>`;
}

function renderSearch(query = "") {
  const normalized = query.trim().toLowerCase();
  const hidden = new Set(data.map.places.filter((item) => item.map_status === "hidden" || item.reality_status === "unknown").map((item) => item.place_id));
  const direct = data.search_index.filter((item) => !hidden.has(item.target_id) && (!normalized || item.search_text.toLowerCase().includes(normalized)));
  const expandedIds = normalized ? new Set(direct.flatMap((item) => item.related_ids || [])) : new Set();
  const ranked = data.search_index.filter((item) => direct.includes(item) || expandedIds.has(item.target_id)).sort((a, b) => Number(direct.includes(b)) - Number(direct.includes(a)));
  const results = ranked.filter((item) => searchFilter === "all" || item.target_type === searchFilter).slice(0, 80);
  const grouped = new Map();
  results.forEach((item) => { if (!grouped.has(item.target_type)) grouped.set(item.target_type, []); grouped.get(item.target_type).push(item); });
  const groups = [...grouped.entries()].map(([type, items]) => `<section class="search-group"><h2>${typeLabel(type)}<span>${items.length}</span></h2><div class="search-results">${items.map((item) => `<a class="search-result" href="${hrefFor(item.target_type, item.target_id)}"><div><strong>${escapeHtml(item.name_zh)}</strong><small>${escapeHtml(typeLabel(item.target_type))}${item.original_name ? ` · ${escapeHtml(item.original_name)}` : ""}</small></div><span>→</span></a>`).join("")}</div></section>`).join("");
  const filters = ["all", "author", "work", "country", "place", "fictional_space", "theme", "movement"];
  setMeta("搜索", "搜索作家、作品、国家、地点、文学空间、主题与文学运动。", "search/");
  app.innerHTML = `<section class="search-shell"><p class="eyebrow">文学搜索</p><h1 class="display-title">找到你的下一条阅读路径。</h1><p class="lede">搜索作家、作品、国家、地点、文学空间、主题与文学运动；结果也会带出与它们相连的文学入口。</p><form class="search-form"><label for="search-input" class="visually-hidden">搜索文学内容</label><input id="search-input" type="search" value="${escapeHtml(query)}" placeholder="输入作者、作品、地点或原文名" /><button class="primary-button" type="submit">搜索</button></form><div class="search-filters">${filters.map((type) => `<button class="chip ${searchFilter === type ? "active" : ""}" aria-pressed="${searchFilter === type}" data-search-filter="${type}">${type === "all" ? "全部" : typeLabel(type)}</button>`).join("")}</div><p class="search-count" aria-live="polite">${normalized ? `找到 ${results.length} 条与“${escapeHtml(query)}”直接匹配或有关联的内容` : "浏览全部文学入口"}</p>${groups || "<p>没有找到匹配项。可以换一个中文名、原文名或地点名。</p>"}</section>`;
  document.querySelector(".search-form")?.addEventListener("submit", (event) => { event.preventDefault(); const value = document.querySelector("#search-input").value; window.location.href = `${new URL("search/", SITE_ROOT).pathname}?q=${encodeURIComponent(value)}`; });
  document.querySelectorAll("[data-search-filter]").forEach((button) => button.addEventListener("click", () => { searchFilter = button.dataset.searchFilter; renderSearch(query); }));
}

function itemYear(item) {
  const numeric = String(item.year_label || "").match(/\d{4}/)?.[0];
  return numeric ? Number(numeric) : null;
}

function renderTimeline() {
  const periods = data.presentation.timeline_periods;
  const fallbackPeriods = [
    { id: "years-before-1940", title: "1940 年以前", start: 1800, end: 1939 },
    { id: "years-1940-1959", title: "1940—1959", start: 1940, end: 1959 },
    { id: "years-1960-1979", title: "1960—1979", start: 1960, end: 1979 },
    { id: "years-after-1980", title: "1980 年以后", start: 1980, end: 2100 },
  ];
  const groups = (periods.length ? periods : fallbackPeriods).map((period) => ({ ...period, items: data.timeline.filter((item) => { const year = itemYear(item); return year && year >= period.start && year <= period.end && item.node_type !== "historical_background" && isPublic(item.entity.entity_id); }) }));
  const backgrounds = data.timeline.filter((item) => item.node_type === "historical_background" && relationsFor(item.entity.entity_id).some((relation) => relation.relation_type === "BASED_ON_EVENT"));
  setMeta("文学时间线", "沿文学时期、作家与作品理解拉丁美洲文学的发展。", "timeline/");
  app.innerHTML = `<section class="timeline-page"><p class="eyebrow">文学时间线</p><h1 class="display-title">沿时间进入<br /><em>拉丁美洲文学</em></h1><p class="lede">${escapeHtml(data.presentation.timeline_note || "按作家的生卒年与作品的首次发表年份排列，帮助读者建立时间感。")}</p><div class="timeline-full">${groups.map((group) => `<section class="timeline-group"><div class="section-heading"><h2>${escapeHtml(group.title)}</h2><p>${escapeHtml(group.display_range || `${group.start}—${group.end}`)}</p></div>${group.items.slice(0, 12).map((item) => { const targetType = item.node_type === "literary_author" ? "author" : "work"; return `<div class="timeline-item"><time>${escapeHtml(item.year_label)}</time><div><strong><a href="${hrefFor(targetType, item.entity.entity_id)}">${escapeHtml(item.entity.name_zh)}</a></strong><p>${targetType === "author" ? "作家" : "作品"}</p></div></div>`; }).join("") || "<p>这一年代还没有可展示的条目。</p>"}</section>`).join("")}${backgrounds.length ? `<section class="timeline-group background"><div class="section-heading"><h2>理解作品的历史背景</h2><p>与具体作品直接相连的历史背景</p></div>${backgrounds.map((item) => `<div class="timeline-item"><time>${escapeHtml(item.year_label)}</time><div><strong>${escapeHtml(item.entity.name_zh)}</strong><p>历史背景</p></div></div>`).join("")}</section>` : ""}</div></section>`;
}

function renderAbout() {
  setMeta("关于项目", "从地点进入拉丁美洲文学，理解真实地理、虚构空间、作家与作品如何彼此连接。", "about/");
  app.innerHTML = `<section class="page-header"><p class="eyebrow">关于项目</p><h1 class="display-title">为什么做一张<br /><em>文学地图？</em></h1><p class="lede">因为文学从来不只发生在书页里。它也发生在城市、边境、河流、港口，以及作家创造出来的世界中。</p></section><section class="about-sections"><article><span>01</span><div><h2>这是什么</h2><p>拉丁美洲文学地图是一项面向中文读者的文学探索计划。你可以从一个地方开始，遇见与它有关的作家和作品，再沿着时间、主题与文学关系继续阅读。它不是一份必须按顺序读完的文学史，而是一组可以自由进入的路径。</p></div></article><article><span>02</span><div><h2>为什么是一张地图</h2><p>地点不只是故事的背景。墨西哥的村庄、布宜诺斯艾利斯的街道、加勒比海岸的城镇，都可能塑造一种叙事声音；马孔多、科马拉这样的虚构空间，也会反过来改变我们理解现实的方式。地图让这些关系变得可见。</p></div></article><article><span>03</span><div><h2>你可以怎样探索</h2><ul><li>从地图选择国家、城市或文学虚构空间；</li><li>从相关作家进入他的生平、作品与写作地点；</li><li>从一部作品继续寻找它发生在哪里、讨论什么；</li><li>也可以使用搜索与时间线，建立自己的阅读顺序。</li></ul></div></article><article><span>04</span><div><h2>不止魔幻现实主义</h2><p>拉丁美洲文学远比一个标签更宽广。这里也有现代主义、先锋实验、城市小说、短篇传统、诗歌、历史叙事与当代写作。地图希望保留这些差异，让读者看见不同语言区域、年代与文学形式之间丰富而不整齐的联系。</p></div></article><article><span>05</span><div><h2>一张持续生长的地图</h2><p>这张地图会继续增加新的地点、作家、作品与阅读路径。现实地点按它们所在的位置呈现；文学虚构空间则始终与现实坐标分开。某段联系尚不确定时，地图会暂时留下空白。</p></div></article><details class="research-panel about-research"><summary>研究依据与使用边界</summary><div class="research-body"><section><h3>资料与版权</h3><p>基础事实与文学关系来自公开可追溯资料，页面书目尽可能保留原始访问链接。项目不提供受版权保护的作品全文，也不使用作品封面；地图边界来自公共领域的 Natural Earth 数据。内容页的“研究依据与延伸阅读”提供进一步核对入口。</p></section></div></details></section>`;
}

function renderNode(id) {
  const item = entity(id);
  if (!item || !isPublic(id)) return renderNotFound();
  const relations = relationsFor(id).map((relation) => ({...relation, _focus:id}));
  const description = `${typeLabel(item.entity_type)}“${item.name_zh}”及其相关文学内容。`;
  setMeta(item.name_zh, description, routePath("node", id));
  app.innerHTML = `<section class="page-header"><p class="eyebrow">${escapeHtml(typeLabel(item.entity_type))}</p><h1 class="display-title">${escapeHtml(item.name_zh)}</h1>${item.original_name ? `<p class="lede">${escapeHtml(item.original_name)}</p>` : ""}</section><section class="section"><div class="section-heading"><h2>从这里继续探索</h2><p>沿相关作家、作品、地点与主题继续。</p></div><div class="linked-list">${relationCards(relations) || "<p>还没有可展示的相关内容。</p>"}</div>${researchPanel(id)}</section>`;
}

function renderNotFound() {
  setMeta("页面未找到", "这条文学路径尚未开放。");
  app.innerHTML = `<div class="error-box"><p class="eyebrow">404</p><h1>这条文学路径尚未开放。</h1><p>返回地图，选择一个国家、地点、作家或作品继续探索。</p><a class="back-link" href="${SITE_ROOT.pathname}">回到文学地图 →</a></div>`;
}

function initialRoute() {
  const kind = document.body.dataset.routeKind;
  const id = document.body.dataset.routeId;
  const pathSlug = document.body.dataset.pathSlug;
  if (kind) return { kind, id, pathSlug };
  const segments = window.location.pathname.startsWith(SITE_PATH) ? window.location.pathname.slice(SITE_PATH.length).split("/").filter(Boolean) : [];
  if (!segments.length) return { kind: "home" };
  if (segments[0] === "search") return { kind: "search" };
  if (segments[0] === "timeline") return { kind: "timeline" };
  if (segments[0] === "about") return { kind: "about" };
  if (segments[0] === "paths") return { kind: "path", pathSlug: segments[1] };
  return { kind: "not-found" };
}

function renderRoute() {
  const route = initialRoute();
  nav?.querySelectorAll("a").forEach((link) => link.removeAttribute("aria-current"));
  if (route.kind === "home") return renderHome();
  if (route.kind === "search") return renderSearch(new URLSearchParams(window.location.search).get("q") || "");
  if (route.kind === "timeline") return renderTimeline();
  if (route.kind === "about") return renderAbout();
  if (route.kind === "path") return renderPath(route.pathSlug);
  if (route.kind === "country") return renderCountry(route.id);
  if (route.kind === "place" || route.kind === "fictional_space") return renderPlace(route.id);
  if (route.kind === "author") return renderAuthor(route.id);
  if (route.kind === "work") return renderWork(route.id);
  if (route.kind === "node") return renderNode(route.id);
  return renderNotFound();
}

menuToggle?.addEventListener("click", () => { const open = nav.classList.toggle("open"); menuToggle.setAttribute("aria-expanded", String(open)); });
nav?.addEventListener("click", () => { nav.classList.remove("open"); menuToggle?.setAttribute("aria-expanded", "false"); });

Promise.all([fetch(DATA_URL), fetch(MAP_URL)]).then(async ([dataResponse, mapResponse]) => {
  if (!dataResponse.ok || !mapResponse.ok) throw new Error("公开内容暂时无法载入");
  [data, geography] = await Promise.all([dataResponse.json(), mapResponse.json()]);
  renderRoute();
}).catch((error) => {
  console.error("Public application failed to render", error);
  app.innerHTML = `<div class="error-box"><h1>文学地图暂时没有打开。</h1><p>公开内容暂时无法载入。请稍后重试。</p></div>`;
});
