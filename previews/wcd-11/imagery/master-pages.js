/* WCD-11 visual master pages.
   Only the six USER-approved candidate routes are intercepted here. Generic
   author/work routes continue through pages.js until the visual masters pass. */
(function () {
  "use strict";

  const D = window.__SITE_DATA;
  const BASE = window.__SITE_BASE__ || "";
  const esc = (value) => String(value ?? "").replace(/[&<>"']/g, (char) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[char]));
  const entity = (id) => D.entities.find((item) => item.id === id);
  const reader = (group, id) => (D.readers[group] || []).find((item) => item.target_id === id) || {};
  const portrait = (id) => (D.portraits || {})[id];
  const route = (id) => BASE + (D.search.find((item) => item.id === id)?.route || "");
  const isPublic = (id) => Boolean(D.search.find((item) => item.id === id)?.route);
  const facts = (id) => D.facts.filter((item) => item.s === id);
  const fact = (id, ...keys) => facts(id).find((item) => keys.includes(item.f))?.v || "";
  const card = (id) => D.cards[id] || {};
  const place = (id) => D.map.places.find((item) => item.place_id === id);
  const workName = (name) => String(name || "").startsWith("《") ? name : `《${name}》`;
  const app = () => document.getElementById("app");

  function setMeta(title, description) {
    document.title = `${title}｜${D.presentation.site.name}`;
    document.querySelector('meta[name="description"]')?.setAttribute("content", description);
  }

  function activate(kind) {
    document.body.dataset.master = kind;
    document.querySelectorAll(".main-nav a").forEach((item) => item.removeAttribute("aria-current"));
    const hrefPart = { author: "authors/", work: "works/", anecdotes: "anecdotes/", timeline: "timeline/", about: "about/" }[kind];
    document.querySelector(`.main-nav a[href*="${hrefPart}"]`)?.setAttribute("aria-current", "page");
  }

  function portraitHtml(id, className, alt, eager = false) {
    const item = portrait(id);
    if (!item) return `<span class="master-glyph" aria-hidden="true">${esc((entity(id)?.name || "文").replace(/·/g, "").charAt(0))}</span>`;
    return `<img class="${className}" src="${BASE}assets/portraits/${esc(item.file)}" alt="${esc(alt)}" width="${item.w}" height="${item.h}" loading="${eager ? "eager" : "lazy"}" />`;
  }

  function sectionTitle(number, title, english) {
    return `<header class="master-section-title"><span>${number}</span><h2>${title}</h2><small>${english}</small></header>`;
  }

  function breadcrumbs(current, parent, parentHref) {
    return `<nav class="breadcrumb master-breadcrumb" aria-label="面包屑"><a href="${BASE}">首页</a><span>›</span>${parent ? `<a href="${BASE}${parentHref}">${parent}</a><span>›</span>` : ""}<b aria-current="page">${esc(current)}</b></nav>`;
  }

  function renderBorges() {
    const id = "V1-ENT-0002";
    const item = entity(id);
    const copy = reader("authors", id);
    const created = D.relations.filter((rel) => rel.s === id && rel.t === "CREATED").map((rel) => entity(rel.o)).filter((work) => work && isPublic(work.id)).slice(0, 3);
    const places = D.relations.filter((rel) => rel.s === id && rel.t === "ASSOCIATED_WITH_PLACE").map((rel) => place(rel.o)).filter((entry) => entry && isPublic(entry.place_id)).slice(0, 3);
    const life = `${fact(id, "birth_year")} – ${fact(id, "death_year")}`;
    setMeta(item.name, copy.reader_lede);
    activate("author");
    app().innerHTML = `
      ${breadcrumbs(item.name, "作家", "authors/")}
      <header class="master-author-hero">
        <div class="master-author-copy">
          <p class="master-kicker">作家档案 · AUTHOR ARCHIVE</p>
          <h1>${esc(item.name)}</h1>
          <p class="master-latin-name">${esc(item.original)}</p>
          <p class="master-life">${esc(life)} <span>${esc(card(id).country || fact(id, "country_or_region"))} · Argentina</span></p>
          <blockquote><b>“</b>${esc(copy.guiding_question)}</blockquote>
          <p class="master-intro">${esc(copy.reader_lede)} ${esc(copy.why_know)}</p>
        </div>
        <div class="master-author-collage" aria-label="博尔赫斯档案拼贴">
          <div class="author-architecture"><img src="${BASE}assets/editorial/hero-colonial-balcony-v1.webp" alt="档案建筑图像" width="720" height="960" /></div>
          <div class="author-red-paper"></div><div class="author-blue-paper"></div>
          <figure>${portraitHtml(id, "", `${item.name}的档案肖像`, true)}<figcaption>摄影：${esc(portrait(id)?.artist || "档案肖像")} · 来源：${esc(portrait(id)?.source || "项目登记表")} · 许可：${esc(portrait(id)?.license || "见来源记录")}</figcaption></figure>
          <p class="author-script">Los libros<br />también son<br />laberintos.</p>
          <p class="author-stamp">ARGENTINA<br /><b>50</b></p>
          <p class="author-keywords">LITERATURA<br />MEMORIA<br />LABERINTO<br />INFINITO</p>
        </div>
      </header>
      <nav class="master-index" aria-label="本页目录">
        <a href="#biography"><b>01</b><span>生平<small>Biography</small></span></a>
        <a href="#key-works"><b>02</b><span>代表作品<small>Key Works</small></span></a>
        <a href="#author-places"><b>03</b><span>地点<small>Places</small></span></a>
        <a href="#connections"><b>04</b><span>文学关系<small>Connections</small></span></a>
        <a href="#author-anecdotes"><b>05</b><span>趣闻<small>Anecdote</small></span></a>
      </nav>
      <div class="master-author-spread">
        <section id="biography" class="master-biography">
          ${sectionTitle("01", "生平", "BIOGRAPHY")}
          <div class="biography-layout"><figure class="archive-side-photo"><img src="${BASE}assets/editorial/hero-colonial-balcony-v1.webp" alt="档案城市图像" width="720" height="960" loading="lazy" /><figcaption>Buenos Aires, siempre.</figcaption></figure><div><p>${esc(copy.why_know)}</p><p>${esc(copy.reader_fit)}</p><p>${esc(copy.reader_lede)}</p></div></div>
        </section>
        <section id="key-works" class="master-key-works">
          ${sectionTitle("02", "代表作品", "KEY WORKS")}
          <div class="book-stack">${created.map((work) => `<a href="${route(work.id)}"><span class="mini-cover"><i>${esc(work.name.replace(/[《》\s]/g, "").charAt(0))}</i><small>JORGE LUIS<br />BORGES</small></span><span><b>${esc(workName(work.name))}</b><em>${esc(work.original)}</em><small>${esc(fact(work.id, "first_publication_year", "publication_year") || "作品")}</small></span></a>`).join("")}</div>
        </section>
        <section id="author-places" class="master-author-places">
          ${sectionTitle("03", "地点", "PLACES")}
          <div class="travel-map"><span class="travel-line"></span>${places.map((entry, index) => `<a style="--i:${index}" href="${route(entry.place_id)}"><i></i><b>${esc(entry.name_zh)}</b><small>${esc(entry.original_name || "")}</small></a>`).join("")}</div>
          <ul>${places.map((entry) => `<li><a href="${route(entry.place_id)}">${esc(entry.name_zh)}</a><span>${entry.reality_status === "fictional" ? "文学虚构空间" : "现实地点"}</span></li>`).join("")}</ul>
        </section>
        <section id="connections" class="master-connections">
          ${sectionTitle("04", "文学关系", "CONNECTIONS")}
          <div class="connection-strip">${created.map((work) => `<a href="${route(work.id)}"><span class="connection-portrait">${portraitHtml(id, "", "", false)}</span><b>${esc(workName(work.name))}</b><small>${esc(work.original)}</small></a>`).join("")}</div>
        </section>
        <section id="author-anecdotes" class="master-author-anecdote">
          ${sectionTitle("05", "趣闻", "ANECDOTE")}
          ${copy.anecdotes?.[0] ? `<article><div class="anecdote-object">∞</div><div><h3>${esc(copy.anecdotes[0].title)}</h3><p>${esc(copy.anecdotes[0].teaser)}</p><details><summary>读完整故事</summary><p>${esc(copy.anecdotes[0].story)}</p><small>来源与依据：${esc(copy.anecdotes[0].sources_label)}</small></details></div></article>` : ""}
        </section>
      </div>`;
  }

  function renderCienAnos() {
    const id = "V1-ENT-0075";
    const authorId = "V1-ENT-0072";
    const item = entity(id);
    const author = entity(authorId);
    const copy = reader("works", id);
    const locations = D.relations.filter((rel) => rel.s === id && rel.t === "SET_IN").map((rel) => place(rel.o)).filter(Boolean);
    const year = fact(id, "first_publication_year", "publication_year");
    const related = (copy.next_reads || []).map((entry) => ({ entry, target: entity(entry.target_id) })).filter((entry) => entry.target && isPublic(entry.target.id));
    setMeta(item.name, copy.reading_premise);
    activate("work");
    app().innerHTML = `
      ${breadcrumbs(item.name, "作品", "works/")}
      <header class="master-work-hero">
        <div class="master-work-copy">
          <p class="master-kicker">作品档案 · WORK ARCHIVE</p>
          <h1>${esc(item.name.replace(/[《》]/g, ""))}</h1>
          <p class="work-original">${esc(item.original)}</p>
          <p class="work-english">One Hundred Years of Solitude</p>
          <p class="work-author"><a href="${route(authorId)}">${esc(author.original)}</a><br /><span>${esc(author.name)}</span></p>
          <p class="work-meta">${esc(year)} <i></i> ${esc(card(id).country || "哥伦比亚")} <i></i> ${esc(card(id).genre || fact(id, "genre_or_form"))}</p>
          <blockquote>${esc(copy.guiding_question)}</blockquote>
        </div>
        <div class="master-work-collage" aria-label="《百年孤独》档案拼贴">
          <img class="work-landscape" src="${BASE}assets/editorial/hero-caribbean-writing-desk-v1.webp" alt="加勒比写作空间图像" width="1440" height="1080" />
          <div class="work-paper-red"></div>
          ${portraitHtml(authorId, "work-author-photo", `${author.name}的档案肖像`, true)}
          <p class="work-script">Macondo<br />siempre regresa.</p>
          <p class="work-note">La realidad<br />también puede<br />ser maravillosa.</p>
          <p class="work-postage">COLOMBIA<br /><b>50</b></p>
        </div>
      </header>
      <div class="master-work-spread">
        <section class="work-overview">
          ${sectionTitle("01", "作品简介", "OVERVIEW")}
          <p>${esc(copy.story_intro)}</p>
          <p class="work-summary-en">${esc(copy.reading_premise)}</p>
          ${locations[0] ? `<a class="master-button" href="${route(locations[0].place_id)}">在地图中查看${esc(locations[0].name_zh)} →</a>` : ""}
        </section>
        <section class="work-family">
          ${sectionTitle("02", "人物与家族", "CHARACTERS & FAMILY")}
          <div class="family-tree"><div class="family-root"><b>布恩迪亚—伊瓜兰家族</b><small>七代人的循环</small></div><div class="family-line"></div><div class="family-nodes"><span>建立马孔多</span><span>战争与繁荣</span><span>记忆与重复</span></div></div>
          <p>${esc(copy.reading_approach)}</p>
        </section>
        <section class="work-place">
          ${sectionTitle("03", "地点与空间", "PLACES")}
          ${locations.map((entry) => `<a class="macondo-plate" href="${route(entry.place_id)}"><span class="macondo-map"></span><b>${esc(entry.name_zh)}</b><small>${entry.reality_status === "fictional" ? "文学虚构空间 · 不使用现实坐标" : "现实地点"}</small><p>${esc(copy.location_note)}</p></a>`).join("") || `<div class="macondo-plate"><b>马孔多</b><small>文学虚构空间</small><p>${esc(copy.location_note)}</p></div>`}
        </section>
        <section class="work-themes">
          ${sectionTitle("04", "主题", "THEMES")}
          <div>${(copy.themes || []).map((theme) => `<article><i aria-hidden="true"></i><b>${esc(theme.title)}</b><p>${esc(theme.text)}</p></article>`).join("")}</div>
        </section>
        <section class="work-quote-note">
          ${sectionTitle("05", "阅读问题", "READING NOTE")}
          <blockquote>“${esc(copy.guiding_question)}”</blockquote>
          <p>${esc(copy.reading_approach)}</p>
        </section>
        <section class="work-related">
          ${sectionTitle("06", "相关阅读", "RELATED READING")}
          <div>${related.map(({ entry, target }) => `<a href="${route(target.id)}"><span class="related-cover">${portraitHtml(D.createdBy?.[target.id], "", "", false)}</span><b>${esc(workName(target.name))}</b><small>${esc(entry.reason)}</small></a>`).join("")}</div>
        </section>
      </div>`;
  }

  function renderAnecdotes() {
    const authorIds = ["V1-ENT-0002", "V1-ENT-0073", "V1-ENT-0031", "V1-ENT-0115"];
    const marquez = reader("authors", "V1-ENT-0072");
    const featured = marquez.anecdotes?.find((entry) => entry.title.includes("押")) || marquez.anecdotes?.[0];
    const notes = authorIds.map((id) => ({ id, author: entity(id), story: reader("authors", id).anecdotes?.[0] })).filter((entry) => entry.author && entry.story);
    setMeta("文学趣闻", "伟大的文学，也有生活的另一面。");
    activate("anecdotes");
    app().innerHTML = `
      <header class="master-anecdote-hero">
        <div class="anecdote-title"><h1>文学趣闻</h1><p>ANECDOTES</p><b>伟大的文学，也有生活的另一面。</b><span>Behind great literature lie extraordinary real lives.</span><a class="master-button" href="#archive-notes">在故事中遇见作家 →</a></div>
        <div class="featured-story">
          <p class="master-kicker">热门故事 · FEATURED STORY</p>
          <figure>${portraitHtml("V1-ENT-0072", "", "加西亚·马尔克斯的档案肖像", true)}<figcaption>Mexico City · 1965—1966</figcaption></figure>
          <div><h2>${esc(featured?.title || "为了写《百年孤独》，马尔克斯几乎把整个家都押了进去")}</h2><p>${esc(featured?.teaser || "")}</p><a href="${route("V1-ENT-0072")}#author-anecdotes">读完整故事 →</a></div>
        </div>
        <blockquote>Detrás de cada obra,<br />hay una vida que también cuenta.<small>ARCHIVO LITERARIO</small></blockquote>
      </header>
      <section class="archive-notes" id="archive-notes">
        <header><div><h2>今日档案</h2><span>ARCHIVE NOTES</span><p>一些不为人熟知的时刻，拼贴出更真实的文学地图。</p></div><a href="${BASE}authors/">探索更多趣闻 →</a></header>
        <div class="clipping-grid">${notes.map(({ id, author, story }, index) => `<article style="--tilt:${index % 2 ? 1 : -1}deg"><figure>${portraitHtml(id, "", `${author.name}的档案肖像`, false)}</figure><div><h3>${esc(story.title)}</h3><p>${esc(story.teaser)}</p><small>${esc(author.original)} · ${esc(story.time_label)}</small><a href="${route(id)}#author-anecdotes" aria-label="阅读${esc(author.name)}的趣闻">→</a></div></article>`).join("")}</div>
      </section>
      <section class="anecdote-authors"><header><h2>按作家浏览</h2><span>BROWSE BY AUTHOR</span></header><div>${["V1-ENT-0002", "V1-ENT-0072", "V1-ENT-0073", "V1-ENT-0031", "V1-ENT-0115"].map((id) => `<a href="${route(id)}#author-anecdotes"><span>${portraitHtml(id, "", "", false)}</span><b>${esc(entity(id)?.original || "")}</b><small>${esc(entity(id)?.name || "")}</small></a>`).join("")}</div></section>`;
  }

  function timelineItems() {
    const works = D.timeline.filter((item) => item.kind === "literary_work" && isPublic(item.id) && Number(String(item.year).match(/\d{4}/)?.[0] || 0) >= 1940 && Number(String(item.year).match(/\d{4}/)?.[0] || 0) <= 1989);
    if (works.length <= 8) return works;
    const selected = [];
    for (let index = 0; index < 8; index += 1) selected.push(works[Math.round(index * (works.length - 1) / 7)]);
    return [...new Map(selected.map((item) => [item.id, item])).values()];
  }

  function renderTimeline() {
    const entries = timelineItems();
    setMeta("时间线", "一部文学的大陆编年史。");
    activate("timeline");
    app().innerHTML = `
      <header class="master-timeline-hero"><div><h1>时间线</h1><p>TIMELINE</p></div><div><h2>一部文学的大陆编年史</h2><em>A Literary Chronicle<br />of a Continent</em><p>从作品、作家与历史相遇的时刻进入拉丁美洲文学。</p></div><figure><img src="${BASE}assets/backgrounds/archive-masthead-v1.webp" alt="热带植物与山脉档案拼贴" width="1667" height="604" /></figure></header>
      <div class="timeline-toolbar"><p><b>筛选时间线</b><small>FILTER TIMELINE</small></p><div role="group" aria-label="按类型筛选时间线"><button type="button" data-timeline-filter="all" aria-pressed="true">全部</button><button type="button" data-timeline-filter="literary_work" aria-pressed="false">作品 / 出版</button></div><a class="master-button" href="${BASE}#literary-map">探索地图视图 →</a></div>
      <div class="timeline-legend"><span><i></i>作品 / 出版</span><blockquote>“La literatura también es una forma de habitar el mundo.”</blockquote></div>
      <section class="horizontal-timeline" aria-label="横向文学时间线">${entries.map((entry, index) => {
        const creator = D.createdBy?.[entry.id];
        const target = entity(entry.id);
        return `<article data-timeline-kind="${esc(entry.kind)}" class="timeline-card ${index === Math.floor(entries.length / 2) ? "featured" : ""}"><time>${esc(entry.year)}</time><i class="timeline-dot"></i><a href="${route(entry.id)}"><span class="timeline-cover">${creator ? portraitHtml(creator, "", "", false) : `<b>${esc(target?.name?.replace(/[《》\s]/g, "").charAt(0) || "文")}</b>`}<em>${esc(target?.name || entry.name)}</em></span><h3>${esc(entry.name)}</h3><p>${esc(entity(creator)?.name || card(entry.id).country || "拉丁美洲文学")}</p><small>${esc(reader("works", entry.id).reading_premise || "作品首次出版或发表")}</small></a></article>`;
      }).join("")}</section>`;
    app().querySelectorAll("[data-timeline-filter]").forEach((button) => button.addEventListener("click", () => {
      const filter = button.dataset.timelineFilter;
      app().querySelectorAll("[data-timeline-filter]").forEach((item) => item.setAttribute("aria-pressed", String(item === button)));
      app().querySelectorAll("[data-timeline-kind]").forEach((item) => { item.hidden = filter !== "all" && item.dataset.timelineKind !== filter; });
    }));
  }

  function renderAbout() {
    setMeta("关于项目", "在地图上阅读拉丁美洲，在文学中遇见一个更大的世界。");
    activate("about");
    const cards = [
      ["01", "项目介绍", "PROJECT OVERVIEW", "拉丁美洲文学地图是一项面向中文读者的文学探索计划。它把真实地点、文学虚构空间、作家、作品、时间与研究依据组织在同一张可追溯的阅读地图上。"],
      ["02", "我们为什么做这个", "WHY THIS PROJECT", "拉丁美洲文学承载殖民与独立、记忆与抵抗、混融与创造的复杂历史。地图让分散在书页、城市与档案中的声音彼此可见。"],
      ["03", "内容结构", "WHAT YOU CAN EXPLORE", "从地图、作家、作品、趣闻和时间线五个入口开始，再沿地点与文学关系建立自己的阅读顺序。"],
      ["04", "数据与方法", "DATA & METHOD", "项目以可识别来源、研究数据、策展数据与读者展示分层工作；不能核验的关系保留空白，不用视觉文案替代证据。"],
      ["05", "如何使用", "HOW TO USE", "从地图出发，认识作家与作品；再用趣闻、时间线、搜索和关系入口延伸阅读。移动端保留同样的语义与数据边界。"],
      ["06", "致谢 / 参考", "ACKNOWLEDGEMENTS & SOURCES", "感谢作家、研究者、译者、图书馆与开放数据维护者。项目不提供受版权保护的作品全文，第三方素材按各自许可使用。"],
    ];
    activate("about");
    app().innerHTML = `
      <header class="master-about-hero"><div><h1>关于项目</h1><p>ABOUT THE PROJECT</p><b>在地图上阅读拉丁美洲，<br />在文学中遇见一个更大的世界。</b><span>Reading Latin America on the map,<br />encountering a larger world through literature.</span></div><figure><img src="${BASE}assets/editorial/hero-caribbean-writing-desk-v1.webp" alt="拉丁美洲文学档案拼贴" width="1440" height="1080" /><span>${portraitHtml("V1-ENT-0148", "", "加夫列拉·米斯特拉尔的档案肖像", true)}</span><figcaption>Nuestra América<br />también escribe.</figcaption></figure></header>
      <div class="about-grid">${cards.map(([no, title, en, text], index) => `<article class="about-cell about-${index + 1}">${sectionTitle(no, title, en)}<p>${esc(text)}</p>${index === 2 ? `<nav class="about-explore"><a href="${BASE}#literary-map">地图</a><a href="${BASE}authors/">作家</a><a href="${BASE}works/">作品</a><a href="${BASE}anecdotes/">趣闻</a><a href="${BASE}timeline/">时间线</a></nav>` : ""}${index === 3 ? `<div class="method-strip"><span>学术来源</span><span>开放数据</span><span>地理信息</span><span>编辑核验</span></div>` : ""}${index === 4 ? `<ol><li>从地图出发</li><li>认识作家与作品</li><li>延伸阅读与发现</li><li>沿来源继续核对</li></ol>` : ""}${index === 5 ? `<details><summary>地图范围与中立性</summary><p>地图采用 Natural Earth 公共领域底图与 GeoNames 地点坐标；仅呈现地理事实与文学关联，不代表对争议边界、领土归属或政治地位的立场。</p></details>` : ""}</article>`).join("")}</div>`;
  }

  function render(routeInfo) {
    if (routeInfo.kind === "author" && routeInfo.id === "V1-ENT-0002") { renderBorges(); return true; }
    if (routeInfo.kind === "work" && routeInfo.id === "V1-ENT-0075") { renderCienAnos(); return true; }
    if (routeInfo.kind === "anecdotes") { renderAnecdotes(); return true; }
    if (routeInfo.kind === "timeline") { renderTimeline(); return true; }
    if (routeInfo.kind === "about") { renderAbout(); return true; }
    return false;
  }

  window.__WCD11_MASTER__ = { render };
})();
