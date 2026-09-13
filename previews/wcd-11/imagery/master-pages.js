/* WCD-11 visual master pages.
   The editorial system covers every public author/work route plus the complete
   catalog, search and timeline indexes. Other route families remain on the
   existing data-driven renderer until formal integration is approved. */
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
    const hrefPart = { author: "authors/", authors: "authors/", work: "works/", works: "works/", search: "search/", anecdotes: "anecdotes/", timeline: "timeline/", about: "about/" }[kind];
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

  const publicCreated = (authorId) => D.relations
    .filter((rel) => rel.s === authorId && rel.t === "CREATED")
    .map((rel) => entity(rel.o))
    .filter((item) => item && isPublic(item.id));
  const publicPlaces = (targetId, relationType) => D.relations
    .filter((rel) => rel.s === targetId && rel.t === relationType)
    .map((rel) => place(rel.o))
    .filter((item) => item && isPublic(item.place_id));
  const publicCreators = (workId) => D.relations
    .filter((rel) => rel.o === workId && rel.t === "CREATED")
    .map((rel) => entity(rel.s))
    .filter(Boolean);

  function portraitCredit(id) {
    const item = portrait(id);
    if (!item) return "项目档案字块 · 无公开肖像";
    return `摄影：${esc(item.artist || "档案肖像")} · 来源：${esc(item.source || "项目登记表")} · 许可：${esc(item.license || "见来源记录")}`;
  }

  function renderCatalog(kind) {
    const authors = kind === "authors";
    const ranking = D.presentation.discovery?.[kind] || [];
    const items = ranking.map((entry, index) => ({
      rank: Number(entry.rank) || index + 1,
      item: entity(entry.target_id),
    })).filter(({ item }) => item && isPublic(item.id));
    const title = authors ? "作家目录" : "作品目录";
    const intro = authors
      ? "从不同国家、年代与写作传统中认识拉丁美洲文学作家。"
      : "从故事、体裁与文学关联中选择下一本书。";
    setMeta(title, `${intro} 当前完整收录 ${items.length} 项。`);
    activate(kind);
    app().innerHTML = `
      <header class="master-catalog-hero ${authors ? "author-catalog" : "work-catalog"}">
        <div><p class="master-kicker">文学目录 · ${authors ? "WRITERS" : "WORKS"}</p><h1>${title}</h1><p>${intro}</p><small>当前完整展示 ${items.length} 项 · 不分页</small></div>
        <figure><img src="${BASE}assets/backgrounds/archive-masthead-v1.webp" alt="热带植物与山脉档案拼贴" width="1667" height="604" /></figure>
      </header>
      <div class="catalog-toolbar"><label for="catalog-filter">在本目录中查找</label><input id="catalog-filter" type="search" placeholder="输入中文名或原文名" autocomplete="off" /><p aria-live="polite">显示 <b>${items.length}</b> / ${items.length} 项</p></div>
      <section class="master-catalog-grid ${authors ? "authors" : "works"}" aria-label="${title}">${items.map(({ item, rank }) => {
        const c = card(item.id);
        const y = fact(item.id, "first_publication_year", "publication_year");
        const authorCopy = reader("authors", item.id);
        const workCopy = reader("works", item.id);
        const creatorId = D.createdBy?.[item.id];
        const imageId = authors ? item.id : creatorId;
        const meta = authors
          ? [c.country || fact(item.id, "country_or_region"), fact(item.id, "birth_year") && `${fact(item.id, "birth_year")}—${fact(item.id, "death_year") || ""}`].filter(Boolean).join(" · ")
          : [y, c.genre || fact(item.id, "genre_or_form"), c.country].filter(Boolean).join(" · ");
        const text = authors ? authorCopy.reader_lede : workCopy.reading_premise;
        return `<a class="master-catalog-card" data-catalog-item data-search="${esc(`${item.name} ${item.original || ""}`.toLowerCase())}" href="${route(item.id)}"><span class="catalog-rank">${String(rank).padStart(2, "0")}</span><figure>${portraitHtml(imageId, "", "", false)}<figcaption>${authors ? portraitCredit(item.id) : esc(entity(creatorId)?.name || "作品档案")}</figcaption></figure><div><p>${authors ? "AUTHOR ARCHIVE" : "LITERARY EDITION"}</p><h2>${authors ? esc(item.name) : esc(workName(item.name))}</h2><em>${esc(item.original || "")}</em><small>${esc(meta || (authors ? "拉丁美洲作家" : "文学作品"))}</small><span>${esc(text || "沿作品、地点与文学关系继续阅读。")}</span><b>打开档案 →</b></div></a>`;
      }).join("")}</section>
      <p class="catalog-empty" hidden>没有匹配项。可以换一个中文名或原文名。</p>`;
    const input = app().querySelector("#catalog-filter");
    const status = app().querySelector(".catalog-toolbar p");
    const empty = app().querySelector(".catalog-empty");
    input?.addEventListener("input", () => {
      const query = input.value.trim().toLowerCase();
      let visible = 0;
      app().querySelectorAll("[data-catalog-item]").forEach((item) => {
        item.hidden = query && !item.dataset.search.includes(query);
        if (!item.hidden) visible += 1;
      });
      status.innerHTML = `显示 <b>${visible}</b> / ${items.length} 项`;
      empty.hidden = visible !== 0;
    });
  }

  function renderAuthorArchive(id) {
    if (id === "V1-ENT-0002") { renderBorges(); return true; }
    const item = entity(id);
    const copy = reader("authors", id);
    if (!item || !isPublic(id)) return false;
    const works = publicCreated(id);
    const places = publicPlaces(id, "ASSOCIATED_WITH_PLACE");
    const anecdotes = copy.anecdotes || [];
    const country = card(id).country || fact(id, "country_or_region");
    const life = [fact(id, "birth_year"), fact(id, "death_year")].filter(Boolean).join("—");
    setMeta(item.name, copy.reader_lede || `${item.name}的作家档案。`);
    activate("author");
    app().innerHTML = `
      ${breadcrumbs(item.name, "作家", "authors/")}
      <header class="master-author-hero master-profile-hero">
        <div class="master-author-copy"><p class="master-kicker">作家档案 · AUTHOR ARCHIVE</p><h1>${esc(item.name)}</h1><p class="master-latin-name">${esc(item.original || "")}</p><p class="master-life">${esc(life || "作家档案")} <span>${esc(country || "拉丁美洲")}</span></p><blockquote><b>“</b>${esc(copy.guiding_question || copy.reader_lede || "从作品与地点进入这位作家的文学世界。")}</blockquote><p class="master-intro">${esc(copy.reader_lede || "")} ${esc(copy.why_know || "")}</p></div>
        <div class="master-author-collage"><div class="author-architecture"><img src="${BASE}assets/editorial/hero-colonial-balcony-v1.webp" alt="拉丁美洲城市档案图像" width="720" height="960" /></div><div class="author-red-paper"></div><div class="author-blue-paper"></div><figure>${portraitHtml(id, "", `${item.name}的档案肖像`, true)}<figcaption>${portraitCredit(id)}</figcaption></figure><p class="author-script">Las palabras<br />también trazan<br />territorios.</p><p class="author-stamp">${esc((country || "LATAM").toUpperCase())}<br /><b>50</b></p><p class="author-keywords">LITERATURA<br />MEMORIA<br />TERRITORIO<br />FUTURO</p></div>
      </header>
      <nav class="master-index" aria-label="本页目录"><a href="#biography"><b>01</b><span>生平与写作<small>Biography</small></span></a><a href="#key-works"><b>02</b><span>代表作品<small>Key Works</small></span></a><a href="#author-places"><b>03</b><span>地点<small>Places</small></span></a><a href="#themes"><b>04</b><span>主题<small>Themes</small></span></a><a href="#author-anecdotes"><b>05</b><span>趣闻<small>Anecdotes</small></span></a></nav>
      <div class="master-author-spread master-profile-spread">
        <section id="biography" class="master-biography">${sectionTitle("01", "生平与写作", "BIOGRAPHY")}<div class="biography-layout"><figure class="archive-side-photo">${portraitHtml(id, "", `${item.name}的档案肖像`, false)}<figcaption>${esc(item.original || item.name)}</figcaption></figure><div><p>${esc(copy.why_know || copy.reader_lede || "")}</p><p>${esc(copy.reader_fit || "")}</p></div></div></section>
        <section id="key-works" class="master-key-works">${sectionTitle("02", "代表作品", "KEY WORKS")}<div class="book-stack">${works.map((work) => `<a href="${route(work.id)}"><span class="mini-cover"><i>${esc(work.name.replace(/[《》\s]/g, "").charAt(0))}</i><small>${esc(item.original || item.name)}</small></span><span><b>${esc(workName(work.name))}</b><em>${esc(work.original || "")}</em><small>${esc(fact(work.id, "first_publication_year", "publication_year") || "作品档案")}</small></span></a>`).join("") || `<p class="master-empty">当前公开投影暂未收录可链接作品。</p>`}</div></section>
        <section id="author-places" class="master-author-places">${sectionTitle("03", "地点", "PLACES")}<div class="place-ledger">${places.map((entry) => `<a href="${route(entry.place_id)}"><i></i><span><b>${esc(entry.name_zh)}</b><small>${esc(entry.original_name || (entry.reality_status === "fictional" ? "文学虚构空间" : "现实地点"))}</small></span></a>`).join("") || `<p class="master-empty">当前公开投影暂未收录地点关系。</p>`}</div></section>
        <section id="themes" class="master-connections">${sectionTitle("04", "主题", "THEMES")}<div class="theme-ledger">${(copy.themes || []).map((theme) => `<article><h3>${esc(theme.title)}</h3><p>${esc(theme.text)}</p></article>`).join("") || `<p class="master-empty">主题说明仍在策展中。</p>`}</div></section>
        <section id="author-anecdotes" class="master-author-anecdote">${sectionTitle("05", "趣闻", "ANECDOTES")}<div class="anecdote-ledger">${anecdotes.map((story, index) => `<article><h3><span>${String(index + 1).padStart(2, "0")}</span>${esc(story.title)}</h3><p>${esc(story.teaser)}</p><details><summary>展开完整故事</summary><div>${esc(story.story)}</div><small>来源与依据：${esc(story.sources_label || "见项目登记")}</small></details></article>`).join("") || `<p class="master-empty">当前没有可公开的趣闻。</p>`}</div></section>
      </div>`;
    return true;
  }

  function renderWorkArchive(id) {
    if (id === "V1-ENT-0075") { renderCienAnos(); return true; }
    const item = entity(id);
    const copy = reader("works", id);
    if (!item || !isPublic(id)) return false;
    const authors = publicCreators(id);
    const author = authors[0];
    const locations = publicPlaces(id, "SET_IN");
    const related = (copy.next_reads || []).map((entry) => ({ entry, target: entity(entry.target_id) })).filter(({ target }) => target && isPublic(target.id));
    const year = fact(id, "first_publication_year", "publication_year");
    const genre = card(id).genre || fact(id, "genre_or_form");
    setMeta(item.name, copy.reading_premise || `${item.name}作品档案。`);
    activate("work");
    app().innerHTML = `
      ${breadcrumbs(item.name, "作品", "works/")}
      <header class="master-work-hero master-edition-hero"><div class="master-work-copy"><p class="master-kicker">作品档案 · LITERARY EDITION</p><h1>${esc(item.name.replace(/[《》]/g, ""))}</h1><p class="work-original">${esc(item.original || "")}</p><p class="work-author">${author ? `<a href="${route(author.id)}">${esc(author.original || author.name)}</a><br /><span>${esc(author.name)}</span>` : "拉丁美洲文学"}</p><p class="work-meta">${esc(year || "年代待查")} <i></i> ${esc(card(id).country || "拉丁美洲")} <i></i> ${esc(genre || "文学作品")}</p><blockquote>${esc(copy.guiding_question || copy.reading_premise || "这部作品如何重新组织现实与叙事？")}</blockquote></div><div class="master-work-collage edition-collage"><img class="work-landscape" src="${BASE}assets/editorial/hero-caribbean-writing-desk-v1.webp" alt="拉丁美洲写作档案图像" width="1440" height="1080" /><div class="work-paper-red"></div><span class="edition-cover">${portraitHtml(author?.id, "", "", true)}<i>${esc(item.name.replace(/[《》\s]/g, "").charAt(0) || "书")}</i><small>A LITERARY EDITION</small></span><p class="work-script">${esc((item.original || item.name).split(" ").slice(0, 4).join(" "))}</p><p class="work-postage">LATAM<br /><b>${esc(year || "—")}</b></p></div></header>
      <div class="master-work-spread master-edition-spread">
        <section class="work-overview">${sectionTitle("01", "作品简介", "OVERVIEW")}<p>${esc(copy.story_intro || copy.reading_premise || "")}</p><p class="work-summary-en">${esc(copy.reading_premise || "")}</p></section>
        <section class="work-family">${sectionTitle("02", "为什么值得读", "WHY READ IT")}<div class="why-ledger">${(copy.why || []).map((point) => `<article><h3>${esc(point.title)}</h3><p>${esc(point.text)}</p></article>`).join("") || `<p>${esc(copy.reading_approach || "沿叙事、人物与历史语境进入这部作品。")}</p>`}</div></section>
        <section class="work-place">${sectionTitle("03", "地点与空间", "PLACES")}<div class="place-ledger">${locations.map((entry) => `<a href="${route(entry.place_id)}"><i></i><span><b>${esc(entry.name_zh)}</b><small>${entry.reality_status === "fictional" ? "文学虚构空间 · 不使用现实坐标" : "现实地点"}</small></span></a>`).join("") || `<p>${esc(copy.location_note || "当前公开投影未登记可链接地点。")}</p>`}</div></section>
        <section class="work-themes">${sectionTitle("04", "主题", "THEMES")}<div>${(copy.themes || []).map((theme) => `<article><i aria-hidden="true"></i><b>${esc(theme.title)}</b><p>${esc(theme.text)}</p></article>`).join("") || `<p class="master-empty">主题说明仍在策展中。</p>`}</div></section>
        <section class="work-quote-note">${sectionTitle("05", "阅读方法", "READING NOTE")}<blockquote>“${esc(copy.guiding_question || copy.reading_premise || "带着问题进入作品。") }”</blockquote><p>${esc(copy.reading_approach || copy.reading_tips || "")}</p></section>
        <section class="work-related">${sectionTitle("06", "相关阅读", "RELATED READING")}<div>${related.map(({ entry, target }) => `<a href="${route(target.id)}"><span class="related-cover">${portraitHtml(D.createdBy?.[target.id], "", "", false)}</span><b>${esc(workName(target.name))}</b><small>${esc(entry.reason)}</small></a>`).join("") || `<a href="${BASE}works/"><span class="related-cover master-glyph">书</span><b>浏览作品目录</b><small>从完整目录继续选择。</small></a>`}</div></section>
      </div>`;
    return true;
  }

  function renderSearch() {
    const entries = D.search.filter((item) => item.route);
    const typeLabel = { author: "作家", work: "作品", collection: "作品集", country: "国家", place: "现实地点", fictional_space: "文学空间", movement: "文学运动", theme: "主题" };
    const order = ["author", "work", "collection", "country", "place", "fictional_space", "movement", "theme"];
    setMeta("搜索", `搜索全部 ${entries.length} 个公开文学入口。`);
    activate("search");
    app().innerHTML = `<header class="master-search-hero"><p class="master-kicker">文学搜索 · SEARCH</p><h1>找到你的下一条阅读路径。</h1><p>搜索作家、作品、国家、现实地点、文学虚构空间、主题与文学运动。</p><form role="search"><label for="master-search-input">搜索全部公开内容</label><div><input id="master-search-input" type="search" placeholder="输入作者、作品、地点或原文名" autocomplete="off" /><button type="submit">搜索</button></div></form><small aria-live="polite">当前展示全部 ${entries.length} 项</small></header><nav class="search-type-filter" aria-label="搜索类型筛选"><button type="button" data-search-type="all" aria-pressed="true">全部 <b>${entries.length}</b></button>${order.map((type) => `<button type="button" data-search-type="${type}" aria-pressed="false">${typeLabel[type]} <b>${entries.filter((entry) => entry.type === type).length}</b></button>`).join("")}</nav><div class="master-search-results">${order.map((type) => { const items = entries.filter((entry) => entry.type === type); return `<section data-search-group="${type}"><header><h2>${typeLabel[type]}</h2><span>${items.length}</span></header><div>${items.map((entry) => `<a data-search-entry data-type="${type}" data-query="${esc(`${entry.name} ${entry.original || ""}`.toLowerCase())}" href="${route(entry.id)}"><span><b>${["work", "collection"].includes(type) ? esc(workName(entry.name)) : esc(entry.name)}</b><small>${esc(entry.original || typeLabel[type])}</small></span><i>→</i></a>`).join("")}</div></section>`; }).join("")}</div><p class="search-no-results" hidden>没有找到匹配项。请换一个中文名、原文名或地点名。</p>`;
    const input = app().querySelector("#master-search-input");
    const status = app().querySelector(".master-search-hero > small");
    let activeType = "all";
    const update = () => {
      const query = input.value.trim().toLowerCase();
      let visible = 0;
      app().querySelectorAll("[data-search-entry]").forEach((entry) => {
        entry.hidden = (activeType !== "all" && entry.dataset.type !== activeType) || (query && !entry.dataset.query.includes(query));
        if (!entry.hidden) visible += 1;
      });
      app().querySelectorAll("[data-search-group]").forEach((group) => { group.hidden = ![...group.querySelectorAll("[data-search-entry]")].some((entry) => !entry.hidden); });
      app().querySelector(".search-no-results").hidden = visible !== 0;
      status.textContent = query || activeType !== "all" ? `找到 ${visible} 项` : `当前展示全部 ${entries.length} 项`;
    };
    app().querySelector("form")?.addEventListener("submit", (event) => { event.preventDefault(); update(); });
    input?.addEventListener("input", update);
    app().querySelectorAll("[data-search-type]").forEach((button) => button.addEventListener("click", () => {
      activeType = button.dataset.searchType;
      app().querySelectorAll("[data-search-type]").forEach((item) => item.setAttribute("aria-pressed", String(item === button)));
      update();
    }));
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
    return D.timeline
      .filter((item) => ["literary_author", "literary_work"].includes(item.kind) && isPublic(item.id))
      .sort((a, b) => Number(String(a.year).match(/\d{4}/)?.[0] || 9999) - Number(String(b.year).match(/\d{4}/)?.[0] || 9999));
  }

  function renderTimeline() {
    const entries = timelineItems();
    setMeta("时间线", "一部文学的大陆编年史。");
    activate("timeline");
    app().innerHTML = `
      <header class="master-timeline-hero"><div><h1>时间线</h1><p>TIMELINE</p></div><div><h2>一部文学的大陆编年史</h2><em>A Literary Chronicle<br />of a Continent</em><p>从作品、作家与历史相遇的时刻进入拉丁美洲文学。</p></div><figure><img src="${BASE}assets/backgrounds/archive-masthead-v1.webp" alt="热带植物与山脉档案拼贴" width="1667" height="604" /></figure></header>
      <div class="timeline-toolbar"><p><b>筛选时间线</b><small>FILTER TIMELINE</small></p><div role="group" aria-label="按类型筛选时间线"><button type="button" data-timeline-filter="all" aria-pressed="true">全部 ${entries.length}</button><button type="button" data-timeline-filter="literary_work" aria-pressed="false">作品 / 出版 ${entries.filter((item) => item.kind === "literary_work").length}</button><button type="button" data-timeline-filter="literary_author" aria-pressed="false">作家生平 ${entries.filter((item) => item.kind === "literary_author").length}</button></div><a class="master-button" href="${BASE}#literary-map">探索地图视图 →</a></div>
      <div class="timeline-legend"><span><i></i>完整公开编年：${entries.length} 条</span><blockquote>“La literatura también es una forma de habitar el mundo.”</blockquote></div>
      <section class="horizontal-timeline" style="--timeline-count:${entries.length}" aria-label="横向文学时间线">${entries.map((entry, index) => {
        const creator = entry.kind === "literary_author" ? entry.id : D.createdBy?.[entry.id];
        const target = entity(entry.id);
        const note = entry.kind === "literary_author" ? reader("authors", entry.id).reader_lede : reader("works", entry.id).reading_premise;
        return `<article data-timeline-kind="${esc(entry.kind)}" class="timeline-card ${index === Math.floor(entries.length / 2) ? "featured" : ""}"><time>${esc(entry.year)}</time><i class="timeline-dot"></i><a href="${route(entry.id)}"><span class="timeline-cover">${creator ? portraitHtml(creator, "", "", false) : `<b>${esc(target?.name?.replace(/[《》\s]/g, "").charAt(0) || "文")}</b>`}<em>${esc(target?.name || entry.name)}</em></span><h3>${esc(entry.name)}</h3><p>${entry.kind === "literary_author" ? "作家生平" : esc(entity(creator)?.name || card(entry.id).country || "拉丁美洲文学")}</p><small>${esc(note || (entry.kind === "literary_author" ? "沿生平与作品进入文学史。" : "作品首次出版或发表。"))}</small></a></article>`;
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
    if (routeInfo.kind === "authors" || routeInfo.kind === "works") { renderCatalog(routeInfo.kind); return true; }
    if (routeInfo.kind === "author") return renderAuthorArchive(routeInfo.id);
    if (routeInfo.kind === "work") return renderWorkArchive(routeInfo.id);
    if (routeInfo.kind === "search") { renderSearch(); return true; }
    if (routeInfo.kind === "anecdotes") { renderAnecdotes(); return true; }
    if (routeInfo.kind === "timeline") { renderTimeline(); return true; }
    if (routeInfo.kind === "about") { renderAbout(); return true; }
    return false;
  }

  window.__WCD11_MASTER__ = { render };
})();
