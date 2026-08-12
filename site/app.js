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
let searchFilter = "all";

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

const typeLabel = (value) => ({ author: "作家", work: "作品", place: "地点", fictional_space: "文学空间", country: "国家", event: "历史背景", collection: "作品集", theme: "主题", movement: "文学运动", adaptation: "影视改编", edition: "版本", character: "人物", institution: "机构", person: "人物" }[value] || "文学关联");
const relationLabel = (value) => ({ CREATED: "创作", SET_IN: "故事发生于", ASSOCIATED_WITH_PLACE: "生平与创作地理", BASED_ON_EVENT: "取材于", EXPLORES_THEME: "讨论", CONTAINS_WORK: "收录", ADAPTED_FROM: "改编自", EDITION_OF: "版本源自", DIRECTED: "执导" }[value] || "文学关联");
const factLabel = (value) => ({ birth_year: "出生年份", death_year: "逝世年份", country_or_region: "国家或地区", language: "创作语言", first_publication_year: "首次出版或发表", publication_year: "出版年份", genre_or_form: "体裁", key_character: "主要人物", setting_place: "故事空间", one_sentence_summary: "内容简介", research_note: "研究提示" }[value] || "资料说明");

function slugify(value) {
  return String(value || "literature").normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase().replace(/&/g, " and ").replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "") || "literature";
}

function routeTypeFor(id) {
  const mapped = place(id);
  if (mapped?.place_kind === "country") return "country";
  if (mapped?.reality_status === "fictional") return "fictional_space";
  if (mapped) return "place";
  const item = entity(id);
  return item?.entity_type === "author" || item?.entity_type === "work" ? item.entity_type : "node";
}

function routePath(type, id) {
  const item = entity(id) || place(id);
  const slug = slugify(item?.original_name || item?.name_zh || id);
  const folder = ({ author: "authors", work: "works", country: "countries", place: "places", fictional_space: "places", node: "explore" })[type] || "explore";
  return `${folder}/${slug}/`;
}

function hrefFor(type, id) {
  const resolved = ["place", "country", "fictional_space"].includes(type) ? routeTypeFor(id) : type;
  return new URL(routePath(resolved, id), SITE_ROOT).pathname;
}

const displayName = (id) => entity(id)?.name_zh || place(id)?.name_zh || "未命名条目";
const curationFor = (id, key) => (data.curation.entries || []).find((item) => item.target_id === id && item.field_key === key);
const publicText = (value) => String(value || "")
  .replace(/V1\s*已审核(?:的)?/g, "已核验的")
  .replace(/V1\s*关系/g, "已核验关系")
  .replace(/V2\s*不使用/g, "本地图不使用")
  .replace(/V2\s*/g, "本项目")
  .trim();
const cardSummary = (id) => publicText(fact(id, "one_sentence_summary")?.value_text);
const sourceFor = (id) => data.research.sources.find((item) => item.source_id === id);
const sourceIdsForFact = (item) => (item?.sources || []).map((source) => source.source_id);
const sourceIdsForRelation = (item) => (item?.evidence || []).map((source) => source.source_id);

function setMeta(title, description, canonicalPath = "") {
  document.title = title === data.presentation.site.name ? title : `${title}｜${data.presentation.site.name}`;
  document.querySelector('meta[name="description"]')?.setAttribute("content", description);
  document.querySelector('meta[property="og:title"]')?.setAttribute("content", title);
  document.querySelector('meta[property="og:description"]')?.setAttribute("content", description);
  document.querySelector('link[rel="canonical"]')?.setAttribute("href", new URL(canonicalPath, SITE_ROOT).href);
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
  const sourceIds = [...extraSourceIds, ...facts.flatMap(sourceIdsForFact), ...relations.flatMap(sourceIdsForRelation)];
  return `<details class="research-panel"><summary>研究依据与延伸阅读</summary><div class="research-body">
    <section><h3>为什么这样介绍</h3><p>页面依据已核验的基础资料与文学关系组织。只有资料确实不足时，页面才会用自然语言说明。</p>${facts.length ? `<dl class="evidence-list">${facts.slice(0, 8).map((item) => `<div><dt>${factLabel(item.fact_field)}</dt><dd>${escapeHtml(publicText(item.value_text))}</dd></div>`).join("")}</dl>` : ""}</section>
    <section><h3>资料来源</h3>${sourceList(sourceIds)}</section>
  </div></details>`;
}

function cardMarkup(item, { id, type, title, description, meta, kind = "" }) {
  return `<a class="card ${kind}" href="${hrefFor(type, id)}"><div><div class="card-meta"><span>${escapeHtml(meta || typeLabel(type))}</span><span>${escapeHtml(item?.original_name || "")}</span></div><h3>${escapeHtml(title)}</h3><p>${escapeHtml(description || "")}</p></div><span class="card-link">继续探索 →</span></a>`;
}

function authorCard(item) {
  const card = cardFor(item.entity_id);
  const lede = publicText(curationFor(item.entity_id, "page_lede")?.content_zh) || cardSummary(item.entity_id);
  return cardMarkup(item, { id: item.entity_id, type: "author", title: item.name_zh, description: lede, meta: card?.country_or_region || "作家" });
}

function workCard(item) {
  const card = cardFor(item.entity_id);
  return cardMarkup(item, { id: item.entity_id, type: "work", title: item.name_zh, description: publicText(curationFor(item.entity_id, "one_line_summary")?.content_zh) || cardSummary(item.entity_id), meta: [card?.genre_or_form, fact(item.entity_id, "first_publication_year", "publication_year")?.value_text].filter(Boolean).join(" · ") || "作品" });
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

function mapMarkup() {
  const countries = publicPlaces().filter((item) => item.place_kind === "country");
  const countryByCode = new Map(countries.map((item) => [item.country_code, item]));
  const selectedCode = place(activeCountry)?.country_code;
  const shapes = geography.features.map((feature) => {
    const code = feature.properties.ISO_A2;
    const country = countryByCode.get(code);
    const active = selectedCode === code;
    return `<path d="${featurePath(feature)}" class="country-shape ${country ? "available" : ""} ${active ? "active" : ""}" ${country ? `data-country-id="${escapeHtml(country.place_id)}" tabindex="0" role="button" aria-label="探索${escapeHtml(country.name_zh)}文学"` : `aria-hidden="true"`}><title>${escapeHtml(country?.name_zh || feature.properties.ADMIN)}</title></path>`;
  }).join("");
  const allowedRoles = { author_geography: ["author_geography"], story_setting: ["story_setting"], all: ["author_geography", "story_setting"] }[mapFilter] || [];
  const relatedPlaceIds = new Set(data.map.relations.filter((item) => allowedRoles.includes(item.map_relation_role)).map((item) => item.target_place_id));
  const realNodes = publicPlaces().filter((item) => item.reality_status === "real" && item.place_kind !== "country" && item.latitude != null && (!activeCountry || item.parent_place_id === activeCountry) && relatedPlaceIds.has(item.place_id));
  const points = realNodes.map((item) => { const [x, y] = project([item.longitude, item.latitude]); return `<a href="${hrefFor("place", item.place_id)}" class="map-point" aria-label="打开${escapeHtml(item.name_zh)}"><circle cx="${x}" cy="${y}" r="6"></circle><text x="${x + 10}" y="${y + 4}">${escapeHtml(item.name_zh)}</text></a>`; }).join("");
  const fictionalNodes = publicPlaces().filter((item) => item.reality_status === "fictional" && (!activeCountry || item.parent_place_id === activeCountry));
  return `<div class="map-shell"><div class="map-toolbar"><strong>从国家与地点进入文学</strong><div class="map-legend"><span><i class="legend-swatch country"></i>可探索国家</span><span><i class="legend-swatch place"></i>现实地点</span><span><i class="legend-swatch fictional"></i>文学虚构空间</span></div></div><div class="map-layout"><div class="map-canvas"><svg viewBox="0 0 880 560" role="img" aria-labelledby="map-title map-description"><title id="map-title">拉丁美洲文学地图</title><desc id="map-description">真实国家边界以及依据坐标投影的文学地点。点击高亮国家继续探索。</desc><g>${shapes}</g><g>${points}</g></svg></div><aside class="fictional-constellation"><p class="eyebrow">写出来的地方</p><h2>文学虚构空间</h2><p>它们属于作品，不被放置到现实坐标上。</p>${fictionalNodes.map((item) => `<a href="${hrefFor("fictional_space", item.place_id)}"><strong>${escapeHtml(item.name_zh)}</strong><span>${escapeHtml(item.original_name || "")}</span></a>`).join("") || "<span>选择国家后探索相关文学空间。</span>"}</aside></div><div class="map-footer"><div class="map-filter">${[["all","全部地点"],["author_geography","作家地理"],["story_setting","故事空间"]].map(([key,label]) => `<button class="chip ${mapFilter === key ? "active" : ""}" aria-pressed="${mapFilter === key}" data-map-filter="${key}">${label}</button>`).join("")}</div><button class="map-reset" type="button" data-map-reset>${activeCountry ? `返回完整地图 · 当前：${escapeHtml(displayName(activeCountry))}` : "点击高亮国家开始"}</button></div></div>`;
}

function renderHome() {
  const authors = (data.curation.selections || []).filter((item) => item.selection_key === "featured_author").sort((a, b) => a.sort_order - b.sort_order).slice(0, 8);
  const works = (data.curation.selections || []).filter((item) => item.selection_key === "featured_work").sort((a, b) => a.sort_order - b.sort_order).slice(0, 6);
  const periods = data.presentation.timeline_periods.slice(0, 5);
  setMeta(data.presentation.site.name, data.presentation.site.description);
  app.innerHTML = `<section class="hero home-hero"><div><p class="eyebrow">A literary map of Latin America</p><h1 class="display-title">拉丁美洲<br /><em>文学地图</em></h1><p class="lede">${escapeHtml(data.presentation.site.tagline)}</p></div><aside class="hero-note"><p>从一个国家开始，遇见一位作家，进入一部作品，再沿着地点、主题与时间继续阅读。</p></aside></section>
  <section class="map-first">${mapMarkup()}</section>
  <section class="section"><div class="section-heading"><h2>从这些作家开始</h2><p>他们来自不同国家，也提供了截然不同的文学入口。</p></div><div class="card-grid">${authors.map((selection) => authorCard(entity(selection.target_id))).join("")}</div></section>
  <section class="section"><div class="section-heading"><h2>如何进入拉美文学</h2><p>不必先读完文学史。选择一个问题、一种形式或一位作家就可以开始。</p></div><div class="path-grid">${data.presentation.reading_paths.slice(0, 5).map((path, index) => `<a class="path-card" href="${new URL(`paths/${path.slug}/`, SITE_ROOT).pathname}"><span>0${index + 1}</span><h3>${escapeHtml(path.title)}</h3><p>${escapeHtml(path.description)}</p><b>打开阅读路径 →</b></a>`).join("")}</div></section>
  <section class="section"><div class="section-heading"><h2>从一部作品开始</h2><p>先知道它讲什么，也知道为什么它可能值得你的时间。</p></div><div class="card-grid">${works.map((selection) => workCard(entity(selection.target_id))).join("")}</div></section>
  <section class="section timeline-preview"><div><p class="eyebrow">沿时间进入</p><h2>拉丁美洲文学如何走到今天？</h2><p>从世纪之交、文学实验到文学爆炸及其之后，沿作品与作家建立一条简明时间感。</p><a class="text-link" href="${new URL("timeline/", SITE_ROOT).pathname}">打开文学时间线 →</a></div><ol>${periods.map((period) => `<li><span>${period.start}—${period.end}</span><strong>${escapeHtml(period.title)}</strong></li>`).join("")}</ol></section>
  <section class="section about-preview"><div><p class="eyebrow">关于项目</p><h2>文学在前，研究依据在后。</h2></div><p>这张地图把可靠来源、事实与文学关系组织成普通读者可以进入的页面。现实地点使用可追溯坐标；马孔多、科马拉等文学空间则保留为作品创造的世界。</p><a class="text-link" href="${new URL("about/", SITE_ROOT).pathname}">了解项目与研究方法 →</a></section>`;
  bindMapInteractions();
}

function bindMapInteractions() {
  document.querySelectorAll("[data-map-filter]").forEach((button) => button.addEventListener("click", () => { mapFilter = button.dataset.mapFilter; renderHome(); }));
  document.querySelectorAll("[data-country-id]").forEach((shape) => {
    const activate = () => { activeCountry = shape.dataset.countryId; renderHome(); };
    shape.addEventListener("click", activate);
    shape.addEventListener("keydown", (event) => { if (["Enter", " "].includes(event.key)) activate(); });
  });
  document.querySelector("[data-map-reset]")?.addEventListener("click", () => { activeCountry = null; renderHome(); });
}

function renderPath(slug) {
  const path = data.presentation.reading_paths.find((item) => item.slug === slug);
  if (!path) return renderNotFound();
  const targets = path.target_ids.map((id) => entity(id)).filter(Boolean);
  setMeta(path.title, path.description, `paths/${slug}/`);
  app.innerHTML = `<section class="page-header"><p class="eyebrow">策展阅读路径</p><h1 class="display-title">${escapeHtml(path.title)}</h1><p class="lede">${escapeHtml(path.description)}</p></section><section class="section"><div class="reading-sequence">${targets.map((item, index) => `<div><span>0${index + 1}</span>${item.entity_type === "author" ? authorCard(item) : workCard(item)}</div>`).join("")}</div></section>`;
}

function renderCountry(id) {
  const country = place(id);
  if (!country || country.map_status === "hidden") return renderNotFound();
  const children = publicPlaces().filter((item) => item.parent_place_id === id);
  const scope = new Set([id, ...children.map((item) => item.place_id)]);
  const mapRelations = data.map.relations.filter((item) => scope.has(item.target_place_id));
  const authors = [...new Set(mapRelations.filter((item) => entity(item.source_entity_id)?.entity_type === "author").map((item) => item.source_entity_id))].map(entity);
  const works = [...new Set(mapRelations.filter((item) => entity(item.source_entity_id)?.entity_type === "work").map((item) => item.source_entity_id))].map(entity);
  const note = publicText(curationFor(id, "literary_place_note")?.content_zh) || `从${country.name_zh}的作家、作品与文学地点开始探索。`;
  setMeta(`${country.name_zh}文学`, note, routePath("country", id));
  app.innerHTML = `<section class="page-header"><p class="eyebrow">国家文学入口</p><h1 class="display-title">${escapeHtml(country.name_zh)}</h1><p class="lede">${escapeHtml(note)}</p></section><section class="section"><div class="section-heading"><h2>从这里认识作家</h2><p>与这个国家或其文学地点有正式资料关联的作家。</p></div><div class="card-grid">${authors.map(authorCard).join("") || "<p>相关作家资料仍在补充。</p>"}</div></section><section class="section"><div class="section-heading"><h2>重要地点与文学空间</h2></div><div class="card-grid">${children.map(placeCard).join("") || "<p>可继续探索的地点资料仍在补充。</p>"}</div></section><section class="section"><div class="section-heading"><h2>发生在这里的作品</h2></div><div class="card-grid">${works.map(workCard).join("") || "<p>相关作品资料仍在补充。</p>"}</div></section>`;
}

function placeCard(item) {
  const fictional = item.reality_status === "fictional";
  const note = publicText(curationFor(item.place_id, fictional ? "fictional_space_note" : "literary_place_note")?.content_zh) || (fictional ? "一处由作品创造的文学空间。" : "一处可以从文学关系继续探索的现实地点。");
  return cardMarkup(item, { id: item.place_id, type: fictional ? "fictional_space" : "place", title: item.name_zh, description: note, meta: fictional ? "文学虚构空间" : "现实地点", kind: fictional ? "fictional" : "place" });
}

function renderPlace(id) {
  const item = place(id);
  if (!item || item.map_status === "hidden" || item.reality_status === "unknown") return renderNotFound();
  const fictional = item.reality_status === "fictional";
  const entry = curationFor(id, fictional ? "fictional_space_note" : "literary_place_note");
  const mapRelations = data.map.relations.filter((relation) => relation.target_place_id === id);
  const authors = mapRelations.filter((relation) => entity(relation.source_entity_id)?.entity_type === "author");
  const works = mapRelations.filter((relation) => entity(relation.source_entity_id)?.entity_type === "work");
  const text = publicText(entry?.content_zh) || (fictional ? "这是一处由文学作品创造的空间。" : "这个地点因作家生平或作品故事而进入文学地图。");
  const sourceIds = [...(entry?.source_refs || []), ...mapRelations.flatMap((item) => item.source_refs || [])];
  setMeta(item.name_zh, text, routePath(fictional ? "fictional_space" : "place", id));
  app.innerHTML = `<section class="page-header ${fictional ? "fictional-header" : ""}"><p class="eyebrow">${fictional ? "文学虚构空间" : "文学地点"}</p><h1 class="display-title">${escapeHtml(item.name_zh)}</h1><div class="page-header-meta"><span class="tag ${fictional ? "blue" : "green"}">${fictional ? "由作品创造的空间" : "现实地点"}</span>${item.original_name ? `<span class="tag">${escapeHtml(item.original_name)}</span>` : ""}</div><p class="lede">${escapeHtml(text)}</p></section><section class="content-grid"><div class="content-copy"><h2>${fictional ? "它出现在哪里" : "这里为什么与文学有关"}</h2><div class="linked-list">${[...works, ...authors].map((relation) => { const source = entity(relation.source_entity_id); return `<a href="${hrefFor(routeTypeFor(source.entity_id), source.entity_id)}"><strong>${escapeHtml(source.name_zh)}</strong><span>${escapeHtml(relation.description_zh || relationLabel(relation.relation_type))}</span></a>`; }).join("") || "<p>相关文学资料仍在补充。</p>"}</div>${item.entity_id ? researchPanel(item.entity_id, sourceIds) : sourceList(sourceIds)}</div><aside class="side-rail"><div class="info-box"><h3>继续探索</h3>${works.map((relation) => `<a class="text-link block" href="${hrefFor("work", relation.source_entity_id)}">${escapeHtml(displayName(relation.source_entity_id))} →</a>`).join("")}${authors.map((relation) => `<a class="text-link block" href="${hrefFor("author", relation.source_entity_id)}">${escapeHtml(displayName(relation.source_entity_id))} →</a>`).join("")}</div>${fictional ? `<div class="info-box"><h3>空间说明</h3><p>文学虚构空间不使用现实坐标。地图将它作为独立的文学入口呈现。</p></div>` : ""}</aside></section>`;
}

function relationCards(items) {
  return items.map((relation) => {
    const otherId = relation.subject_id === relation._focus ? relation.object_id : relation.subject_id;
    const other = entity(otherId) || place(otherId);
    if (!other) return "";
    return `<a class="linked-item" href="${hrefFor(routeTypeFor(otherId), otherId)}"><strong>${escapeHtml(other.name_zh)}</strong><span>${escapeHtml(publicText(relation.description_zh) || relationLabel(relation.relation_type))}</span></a>`;
  }).join("");
}

function renderAuthor(id) {
  const item = entity(id);
  const card = cardFor(id);
  if (!item || item.entity_type !== "author") return renderNotFound();
  const allRelations = relationsFor(id);
  const works = allRelations.filter((relation) => relation.subject_id === id && relation.relation_type === "CREATED").map((relation) => entity(relation.object_id)).filter(Boolean);
  const places = allRelations.filter((relation) => relation.subject_id === id && relation.relation_type === "ASSOCIATED_WITH_PLACE").map((relation) => place(relation.object_id)).filter((mapped) => mapped && mapped.map_status !== "hidden" && mapped.reality_status !== "unknown");
  const themes = [...new Map(works.flatMap((work) => relationsFor(work.entity_id).filter((relation) => relation.subject_id === work.entity_id && relation.relation_type === "EXPLORES_THEME").map((relation) => entity(relation.object_id))).filter(Boolean).map((theme) => [theme.entity_id, theme])).values()].slice(0, 4);
  const movements = allRelations.map((relation) => entity(relation.subject_id === id ? relation.object_id : relation.subject_id)).filter((other) => other?.entity_type === "movement").slice(0, 3);
  const birth = fact(id, "birth_year")?.value_text;
  const death = fact(id, "death_year")?.value_text;
  const lede = publicText(curationFor(id, "page_lede")?.content_zh) || cardSummary(id);
  const keywords = [...themes.map((theme) => theme.name_zh), ...works.map((work) => fact(work.entity_id, "genre_or_form")?.value_text).filter(Boolean).map((value) => value.replace(/（.*?）/g, "")), ...movements.map((movement) => movement.name_zh)].filter(Boolean).slice(0, 4);
  setMeta(item.name_zh, lede, routePath("author", id));
  app.innerHTML = `<section class="page-header"><p class="eyebrow">作家</p><h1 class="display-title">${escapeHtml(item.name_zh)}</h1><div class="page-header-meta"><span class="tag coral">${escapeHtml(item.original_name || "")}</span>${card?.country_or_region ? `<span class="tag">${escapeHtml(card.country_or_region)}</span>` : ""}${birth ? `<span class="tag">${birth}${death ? `—${death}` : "—"}</span>` : ""}</div><div class="keyword-row">${keywords.map((keyword) => `<span>${escapeHtml(keyword)}</span>`).join("")}</div><p class="lede">${escapeHtml(lede)}</p></section>
  <section class="section"><div class="section-heading"><h2>从哪里认识他 / 她</h2><p>与生平和创作有可靠资料关联的地点。</p></div><div class="card-grid">${places.map(placeCard).join("") || "<p>地点资料仍在补充。</p>"}</div></section>
  <section class="section"><div class="section-heading"><h2>读什么</h2><p>先从目前有可靠资料支持的代表作品进入。</p></div><div class="card-grid">${works.map(workCard).join("") || "<p>作品资料仍在补充。</p>"}</div></section>
  <section class="section themes-section"><div class="section-heading"><h2>他 / 她在写什么</h2></div>${themes.length ? `<div class="theme-grid">${themes.map((theme) => `<a href="${hrefFor("node", theme.entity_id)}"><h3>${escapeHtml(theme.name_zh)}</h3><p>从相关作品与研究资料继续理解这一主题。</p></a>`).join("")}</div>` : `<p>现有资料尚不足以可靠筛选少量核心主题；页面不以标签堆砌代替解释。</p>`}</section>
  <section class="section"><div class="section-heading"><h2>文学关系</h2></div><div class="linked-list">${relationCards(allRelations.filter((relation) => ["EXPLORES_THEME", "BASED_ON_EVENT"].includes(relation.relation_type)).map((relation) => ({...relation, _focus:id}))) || movements.map((movement) => `<a class="linked-item" href="${hrefFor("node", movement.entity_id)}"><strong>${escapeHtml(movement.name_zh)}</strong><span>文学运动</span></a>`).join("") || "<p>可公开的精选文学关系仍在补充。</p>"}</div>${researchPanel(id, curationFor(id, "page_lede")?.source_refs)}</section>`;
}

function renderWork(id) {
  const item = entity(id);
  const card = cardFor(id);
  if (!item || item.entity_type !== "work") return renderNotFound();
  const allRelations = relationsFor(id);
  const authors = allRelations.filter((relation) => relation.object_id === id && relation.relation_type === "CREATED").map((relation) => entity(relation.subject_id)).filter(Boolean);
  const locations = allRelations.filter((relation) => relation.subject_id === id && relation.relation_type === "SET_IN").map((relation) => place(relation.object_id)).filter((mapped) => mapped && mapped.map_status !== "hidden" && mapped.reality_status !== "unknown");
  const themes = allRelations.filter((relation) => relation.subject_id === id && relation.relation_type === "EXPLORES_THEME").map((relation) => entity(relation.object_id)).filter(Boolean).slice(0, 5);
  const connections = allRelations.filter((relation) => !["CREATED", "SET_IN", "EXPLORES_THEME"].includes(relation.relation_type)).map((relation) => ({...relation, _focus:id}));
  const summary = publicText(curationFor(id, "one_line_summary")?.content_zh) || cardSummary(id);
  const introduction = cardSummary(id) || summary;
  const whyRead = data.presentation.why_read.find((entry) => entry.work_id === id);
  const nextReads = data.presentation.next_reads.filter((entry) => entry.from_id === id);
  const year = fact(id, "first_publication_year", "publication_year")?.value_text;
  const genre = fact(id, "genre_or_form")?.value_text || card?.genre_or_form;
  setMeta(item.name_zh, summary, routePath("work", id));
  app.innerHTML = `<section class="page-header"><p class="eyebrow">作品</p><h1 class="display-title">${escapeHtml(item.name_zh)}</h1><div class="page-header-meta"><span class="tag coral">${escapeHtml(item.original_name || "")}</span>${authors[0] ? `<a class="tag" href="${hrefFor("author", authors[0].entity_id)}">${escapeHtml(authors[0].name_zh)}</a>` : ""}${year ? `<span class="tag">${escapeHtml(year)}</span>` : ""}${genre ? `<span class="tag">${escapeHtml(genre)}</span>` : ""}${card?.country_or_region ? `<span class="tag">${escapeHtml(card.country_or_region)}</span>` : ""}</div><p class="lede">${escapeHtml(summary)}</p></section>
  <section class="content-grid"><div class="content-copy"><h2>它讲了什么</h2><p>${escapeHtml(introduction)}</p>${whyRead ? `<h2>为什么值得读</h2><div class="feature-grid">${whyRead.points.map((point) => `<article><h3>${escapeHtml(point.title)}</h3><p>${escapeHtml(point.text)}</p></article>`).join("")}</div>` : `<h2>为什么值得读</h2><p>关于这部作品的可靠研究资料仍较有限，本项目暂不补写未经审核的价值判断。</p>`}</div><aside class="side-rail"><div class="info-box"><h3>作品概览</h3><dl class="info-list">${authors[0] ? `<div><dt>作者</dt><dd>${escapeHtml(authors[0].name_zh)}</dd></div>` : ""}${year ? `<div><dt>首次出版/发表</dt><dd>${escapeHtml(year)}</dd></div>` : ""}${genre ? `<div><dt>体裁</dt><dd>${escapeHtml(genre)}</dd></div>` : ""}${card?.country_or_region ? `<div><dt>国家或地区</dt><dd>${escapeHtml(card.country_or_region)}</dd></div>` : ""}</dl></div></aside></section>
  <section class="section"><div class="section-heading"><h2>它发生在哪里</h2></div><div class="card-grid">${locations.map(placeCard).join("") || "<p>目前没有达到公开标准的故事地点资料。</p>"}</div></section>
  <section class="section"><div class="section-heading"><h2>它在讨论什么</h2></div>${themes.length ? `<div class="theme-grid">${themes.map((theme) => `<a href="${hrefFor("node", theme.entity_id)}"><h3>${escapeHtml(theme.name_zh)}</h3><p>进入主题页，查看与它相连的作品。</p></a>`).join("")}</div>` : `<p>现有正式主题关系尚不足以筛选 2—5 个核心主题；项目不会用未经核验的标签填满页面。</p>`}</section>
  <section class="section"><div class="section-heading"><h2>文学关联</h2></div><div class="linked-list">${authors.map((author) => `<a class="linked-item" href="${hrefFor("author", author.entity_id)}"><strong>${escapeHtml(author.name_zh)}</strong><span>作者</span></a>`).join("")}${relationCards(connections)}</div></section>
  <section class="section"><div class="section-heading"><h2>读完之后读什么</h2><p>沿形式、主题与文学空间，继续比较另一部作品。</p></div><div class="card-grid">${nextReads.map((entry) => { const next = entity(entry.to_id); return cardMarkup(next, { id: next.entity_id, type: "work", title: next.name_zh, description: entry.reason, meta: "延伸阅读" }); }).join("") || "<p>这部作品暂不提供强行拼接的推荐。</p>"}</div></section>
  <section class="section">${researchPanel(id, [...(curationFor(id, "one_line_summary")?.source_refs || []), ...(whyRead?.basis || [])])}</section>`;
}

function renderSearch(query = "") {
  const normalized = query.trim().toLowerCase();
  const hidden = new Set(data.map.places.filter((item) => item.map_status === "hidden" || item.reality_status === "unknown").map((item) => item.place_id));
  const results = data.search_index.filter((item) => !hidden.has(item.target_id) && (!normalized || item.search_text.toLowerCase().includes(normalized)) && (searchFilter === "all" || item.target_type === searchFilter)).slice(0, 80);
  const grouped = new Map();
  results.forEach((item) => { if (!grouped.has(item.target_type)) grouped.set(item.target_type, []); grouped.get(item.target_type).push(item); });
  const groups = [...grouped.entries()].map(([type, items]) => `<section class="search-group"><h2>${typeLabel(type)}<span>${items.length}</span></h2><div class="search-results">${items.map((item) => `<a class="search-result" href="${hrefFor(item.target_type, item.target_id)}"><div><strong>${escapeHtml(item.name_zh)}</strong><small>${escapeHtml(typeLabel(item.target_type))}${item.original_name ? ` · ${escapeHtml(item.original_name)}` : ""}</small></div><span>→</span></a>`).join("")}</div></section>`).join("");
  const filters = ["all", "author", "work", "country", "place", "fictional_space", "theme", "movement"];
  setMeta("搜索", "搜索作家、作品、国家、地点、文学空间、主题与文学运动。", "search/");
  app.innerHTML = `<section class="search-shell"><p class="eyebrow">文学搜索</p><h1 class="display-title">找到你的下一条阅读路径。</h1><p class="lede">搜索作家、作品、国家、地点、文学空间、主题与文学运动。</p><form class="search-form"><label for="search-input" class="visually-hidden">搜索文学内容</label><input id="search-input" type="search" value="${escapeHtml(query)}" placeholder="输入作者、作品、地点或原文名" /><button class="primary-button" type="submit">搜索</button></form><div class="search-filters">${filters.map((type) => `<button class="chip ${searchFilter === type ? "active" : ""}" aria-pressed="${searchFilter === type}" data-search-filter="${type}">${type === "all" ? "全部" : typeLabel(type)}</button>`).join("")}</div><p class="search-count" aria-live="polite">${normalized ? `找到 ${results.length} 条与“${escapeHtml(query)}”有关的内容` : "浏览全部文学入口"}</p>${groups || "<p>没有找到匹配项。可以换一个中文名、原文名或地点名。</p>"}</section>`;
  document.querySelector(".search-form")?.addEventListener("submit", (event) => { event.preventDefault(); const value = document.querySelector("#search-input").value; window.location.href = `${new URL("search/", SITE_ROOT).pathname}?q=${encodeURIComponent(value)}`; });
  document.querySelectorAll("[data-search-filter]").forEach((button) => button.addEventListener("click", () => { searchFilter = button.dataset.searchFilter; renderSearch(query); }));
}

function itemYear(item) {
  const numeric = String(item.year_label || "").match(/\d{4}/)?.[0];
  return numeric ? Number(numeric) : null;
}

function renderTimeline() {
  const periods = data.presentation.timeline_periods;
  const groups = periods.map((period) => ({ ...period, items: data.timeline.filter((item) => { const year = itemYear(item); return year && year >= period.start && year <= period.end && item.node_type !== "historical_background"; }) }));
  const backgrounds = data.timeline.filter((item) => item.node_type === "historical_background" && relationsFor(item.entity.entity_id).some((relation) => relation.relation_type === "BASED_ON_EVENT"));
  setMeta("文学时间线", "沿文学时期、作家与作品理解拉丁美洲文学的发展。", "timeline/");
  app.innerHTML = `<section class="timeline-page"><p class="eyebrow">文学时间线</p><h1 class="display-title">沿时间进入<br /><em>拉丁美洲文学</em></h1><p class="lede">这不是完整编年史，而是一条由文学时期、代表作家与作品组成的理解路径。</p><div class="timeline-full">${groups.map((group) => `<section class="timeline-group"><div class="section-heading"><h2>${escapeHtml(group.title)}</h2><p>${group.start}—${group.end}</p></div>${group.items.slice(0, 12).map((item) => { const targetType = item.node_type === "literary_author" ? "author" : "work"; return `<div class="timeline-item"><time>${escapeHtml(item.year_label)}</time><div><strong><a href="${hrefFor(targetType, item.entity.entity_id)}">${escapeHtml(item.entity.name_zh)}</a></strong><p>${targetType === "author" ? "作家" : "作品"}</p></div></div>`; }).join("") || "<p>这一时期的代表节点仍在补充。</p>"}</section>`).join("")}${backgrounds.length ? `<section class="timeline-group background"><div class="section-heading"><h2>理解作品的历史背景</h2><p>仅保留与具体作品直接相关的背景</p></div>${backgrounds.map((item) => `<div class="timeline-item"><time>${escapeHtml(item.year_label)}</time><div><strong>${escapeHtml(item.entity.name_zh)}</strong><p>历史背景</p></div></div>`).join("")}</section>` : ""}</div></section>`;
}

function renderAbout() {
  setMeta("关于项目", "了解拉丁美洲文学地图的使用方式、研究方法、空间区分与来源版权原则。", "about/");
  app.innerHTML = `<section class="page-header"><p class="eyebrow">关于项目</p><h1 class="display-title">让地点成为<br /><em>阅读的入口。</em></h1></section><section class="about-sections"><article><span>01</span><div><h2>这个项目是什么</h2><p>拉丁美洲文学地图是一项面向中文读者的文学探索计划。它把国家、城市、文学虚构空间、作家与作品放在同一条阅读路径上，帮助人们从地理直觉出发，逐渐进入文学形式、主题与历史。</p></div></article><article><span>02</span><div><h2>如何使用</h2><p>你可以从首页地图选择国家，再进入地点、作家与作品；也可以直接搜索名字，或沿时间线观察不同时期的代表作品。每个页面都尽量给出继续探索的方向。</p></div></article><article><span>03</span><div><h2>我们如何研究</h2><p>基础事实与文学关系来自公开可追溯资料。普通页面用自然语言介绍文学；如需继续研究，可展开“研究依据与延伸阅读”查看主要书目。事实、研究解释与编辑推荐彼此区分。</p></div></article><article><span>04</span><div><h2>为什么有些地方没有坐标</h2><p>里约热内卢、利马等现实地点依据地理资料投影到地图。马孔多、科马拉等文学虚构空间属于作品创造的世界，因此以独立方式呈现，不借用现实地点坐标。</p></div></article><article><span>05</span><div><h2>来源与版权</h2><p>项目使用公开研究资料进行事实核验与导读编写，不提供受版权保护作品全文，也不使用作品封面。地图边界来自公共领域的 Natural Earth 数据；页面书目尽可能保留原始访问链接。</p></div></article></section>`;
}

function renderNode(id) {
  const item = entity(id);
  if (!item) return renderNotFound();
  const relations = relationsFor(id).map((relation) => ({...relation, _focus:id}));
  const description = `${typeLabel(item.entity_type)}“${item.name_zh}”及其相关文学内容。`;
  setMeta(item.name_zh, description, routePath("node", id));
  app.innerHTML = `<section class="page-header"><p class="eyebrow">${escapeHtml(typeLabel(item.entity_type))}</p><h1 class="display-title">${escapeHtml(item.name_zh)}</h1>${item.original_name ? `<p class="lede">${escapeHtml(item.original_name)}</p>` : ""}</section><section class="section"><div class="section-heading"><h2>从这里继续探索</h2><p>以下内容来自已经核验的文学关系。</p></div><div class="linked-list">${relationCards(relations) || "<p>相关内容仍在补充。</p>"}</div>${researchPanel(id)}</section>`;
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
  app.innerHTML = `<div class="error-box"><h1>文学地图暂时没有打开。</h1><p>${escapeHtml(error.message)}。请稍后重试。</p></div>`;
});
