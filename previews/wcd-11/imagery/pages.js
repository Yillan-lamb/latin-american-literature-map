/* ============================================================
   WCD-11 阶段三 · 全站页面渲染库
   消费 data.js 公开投影；路由壳由 build.mjs 生成（body data-route-*）。
   语义对齐正式 app.js（板块顺序、白名单、公开过滤），视觉走本设计系统。
   ============================================================ */
(function () {
  "use strict";

  const D = window.__SITE_DATA;
  const BASE = window.__SITE_BASE__ || "";
  const ROUTE = window.__ROUTE__ || { kind: "not-found" };

  /* ---------- 基础访问 ---------- */
  const workName = (name) => (String(name || "").startsWith("《") ? name : `《${name}》`);
  const esc = (v) => String(v ?? "").replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]));
  const ent = (id) => D.entities.find((e) => e.id === id);
  const entName = (id) => ent(id)?.name || D.map.places.find((p) => p.place_id === id)?.name_zh || "未命名条目";
  const searchOf = (id) => D.search.find((s) => s.id === id);
  const isPublic = (id) => Boolean(searchOf(id)?.route);
  const href = (id) => BASE + (searchOf(id)?.route || "");
  const routeTypeOf = (id) => {
    const p = D.map.places.find((x) => x.place_id === id);
    if (p?.place_kind === "country") return "country";
    if (p?.reality_status === "fictional") return "fictional_space";
    if (p) return "place";
    const t = ent(id)?.type;
    return t === "author" || t === "work" ? t : "node";
  };
  const place = (id) => D.map.places.find((p) => p.place_id === id);
  const factsOf = (id) => D.facts.filter((f) => f.s === id);
  const fact = (id, ...fields) => factsOf(id).find((f) => fields.includes(f.f));
  const factv = (id, ...fields) => fact(id, ...fields)?.v || "";
  const relsOf = (id) => D.relations.filter((r) => r.s === id || r.o === id);
  const cardOf = (id) => D.cards[id] || {};
  const reader = (group, id) => (D.readers[group] || []).find((r) => r.target_id === id) || {};
  const sourceOf = (id) => D.sources.find((s) => s.id === id);
  const curationFor = (id, key) => (D.curation || []).find((c) => c.target_id === id && c.key === key);

  const typeLabel = { author: "作家", work: "作品", place: "地点", fictional_space: "文学空间", country: "国家", event: "历史背景", collection: "作品集", theme: "主题", movement: "文学运动", adaptation: "影视改编", edition: "版本", character: "人物", institution: "机构", person: "人物" };
  const relationLabel = { CREATED: "创作", SET_IN: "故事发生于", ASSOCIATED_WITH_PLACE: "生平与创作地理", BASED_ON_EVENT: "取材于", EXPLORES_THEME: "讨论", CONTAINS_WORK: "收录", ADAPTED_FROM: "改编自", EDITION_OF: "版本源自", DIRECTED: "执导" };
  const factLabel = { birth_year: "出生年份", death_year: "逝世年份", country_or_region: "国家或地区", language: "创作语言", first_publication_year: "首次出版或发表", publication_year: "出版年份", genre_or_form: "体裁", key_character: "主要人物", setting_place: "故事空间", one_sentence_summary: "内容简介" };

  function setMeta(title, description) {
    document.title = title === D.presentation.site.name ? title : `${title}｜${D.presentation.site.name}`;
    const desc = document.querySelector('meta[name="description"]');
    if (desc) desc.setAttribute("content", description);
  }

  /* ---------- 研究面板（白名单契约） ---------- */
  function sourceListHtml(ids) {
    const unique = [...new Set((ids || []).filter((i) => String(i).startsWith("SRC-")))].slice(0, 10);
    if (!unique.length) return `<p>本页没有单独列出的书目。</p>`;
    return `<ul class="source-list">${unique.map((id) => {
      const s = sourceOf(id);
      if (!s) return "";
      return `<li>${s.url ? `<a href="${esc(s.url)}" target="_blank" rel="noreferrer">${esc(s.title)}</a>` : esc(s.title)}${s.detail ? `<small>${esc(s.detail)}</small>` : ""}</li>`;
    }).join("")}</ul>`;
  }
  function evidenceRefs(targetId) {
    const ids = [];
    (D.curation || []).forEach((c) => { if (c.target_id === targetId) ids.push(...c.refs); });
    relsOf(targetId).forEach((r) => ids.push(...(r.src || [])));
    factsOf(targetId).forEach((f) => ids.push(...(f.src || [])));
    return ids;
  }
  function researchPanel(targetId, extraRefs = []) {
    const facts = factsOf(targetId).filter((f) => Object.keys(factLabel).includes(f.f)).slice(0, 8);
    const ids = [...extraRefs, ...evidenceRefs(targetId)];
    return `<details class="research-panel"><summary>研究依据与延伸阅读 ▸</summary><div class="research-body">
      <section><h3>为什么这样介绍</h3>
        <p class="why">页面依据公开研究记录与文学关系组织；仍待进一步核验的字段会在具体条目旁明确标示。</p>
        ${facts.length ? `<dl class="evidence-list">${facts.map((f) => `<div><dt>${factLabel[f.f]}${f.prov ? "（仍待进一步核验）" : ""}</dt><dd>${esc(f.v)}</dd></div>`).join("")}</dl>` : ""}
      </section>
      <section><h3>资料来源</h3>${sourceListHtml(ids)}</section>
    </div></details>`;
  }

  /* ---------- 目录行 ---------- */
  function discoveryItems(group) {
    return (D.presentation.discovery?.[group] || []).map((r) => ({ ...r, item: ent(r.target_id) })).filter((r) => r.item && isPublic(r.target_id));
  }
  function catalogRowAuthor(r) {
    const card = cardOf(r.item.id);
    const rc = reader("authors", r.item.id);
    const lede = rc.reader_lede || `${r.item.name}的生平、作品与文学关联。`;
    const birth = factv(r.item.id, "birth_year"), death = factv(r.item.id, "death_year");
    const pt = (D.portraits || {})[r.item.id];
    return `<a class="catalog-row" href="${href(r.item.id)}">
      <span class="rank">${String(r.rank).padStart(2, "0")}</span>
      ${pt ? `<span class="row-thumb"><img src="${BASE}assets/portraits/${pt.file}" alt="" width="48" height="64" loading="lazy" /></span>` : `<span class="row-thumb row-glyph" aria-hidden="true">${esc(r.item.name.replace('·', '').charAt(0))}</span>`}
      <span><h3>${esc(r.item.name)}${r.item.original ? ` <small>· ${esc(r.item.original)}</small>` : ""}</h3>
      <p class="meta">${[card.country || factv(r.item.id, "country_or_region"), birth && `${birth}${death ? `—${death}` : "—"}`].filter(Boolean).join(" · ") || "作家"}</p></span>
      <span class="side">${rc.anecdotes?.length ? `${rc.anecdotes.length} 则趣闻` : ""}</span>
      <p class="lede">${esc(lede)}</p>
    </a>`;
  }
  function catalogRowWork(r) {
    const card = cardOf(r.item.id);
    const year = factv(r.item.id, "first_publication_year", "publication_year");
    const premise = reader("works", r.item.id).reading_premise || `从《${r.item.name}》进入它的故事与文学关联。`;
    const coverChar = r.item.name.replace(/[《》·\s]/g, '').charAt(0) || '书';
    const creatorId = D.createdBy?.[r.item.id];
    const coverPortrait = creatorId ? (D.portraits || {})[creatorId] : null;
    return `<a class="catalog-row" href="${href(r.item.id)}">
      <span class="rank">${String(r.rank).padStart(2, "0")}</span>
      <span class="row-cover${coverPortrait ? " has-photo" : ""}" aria-hidden="true">
        ${coverPortrait ? `<img src="${BASE}assets/portraits/${coverPortrait.file}" alt="" width="48" height="64" loading="lazy" />` : ""}
        <i>${esc(coverChar)}</i>
      </span>
      <span><h3>${esc(workName(r.item.name))}${r.item.original ? ` <small>· ${esc(r.item.original)}</small>` : ""}</h3>
      <p class="meta">${[card.genre || factv(r.item.id, "genre_or_form"), year, card.country].filter(Boolean).join(" · ") || "作品"}</p></span>
      <span class="side">${year || ""}</span>
      <p class="lede">${esc(premise)}</p>
    </a>`;
  }
  function renderCatalog(group) {
    const items = discoveryItems(group);
    const isAuthors = group === "authors";
    const pageSize = 9;
    const pageCount = Math.max(1, Math.ceil(items.length / pageSize));
    const q = new URLSearchParams(location.search);
    let page = Math.min(Math.max(1, Number(q.get("page")) || 1), pageCount);
    const pageItems = items.slice((page - 1) * pageSize, page * pageSize);
    const title = isAuthors ? "作家" : "作品";
    const desc = isAuthors ? "从不同国家、年代与写作传统中认识拉丁美洲文学作家。" : "从故事、体裁与文学关联中选择下一本书。";
    setMeta(title, desc);
    document.getElementById("app").innerHTML = `
      <header class="subpage-header">
        <p class="eyebrow">文学目录 <span class="en">· ${isAuthors ? "WRITERS" : "WORKS"}</span></p>
        <h1 class="display-title">${title}目录</h1>
        <p class="lede">${desc} 当前共 ${items.length} 项。</p>
      </header>
      <div style="padding: clamp(26px,4vw,44px) 0;">
        <div class="catalog-note">
          第 ${page} / ${pageCount} 页，显示第 ${(page - 1) * pageSize + 1}—${Math.min(page * pageSize, items.length)} 项
          <details><summary>这些内容如何排序？</summary><p>顺序由一套固定规则生成：综合重要文学奖项、可继续阅读的公开作品、介绍完整度、延伸阅读丰富度和阅读路径连接；分数相同时使用稳定编号排序。它不采用实时流量，也不设置人工置顶。</p></details>
        </div>
        <div class="catalog-rows">${pageItems.map((r) => (isAuthors ? catalogRowAuthor(r) : catalogRowWork(r))).join("")}</div>
        <nav class="pagination" aria-label="${title}分页">
          ${page === 1 ? `<span class="disabled">上一页</span>` : `<a href="?page=${page - 1}">上一页</a>`}
          <div>${Array.from({ length: pageCount }, (_, i) => i + 1).map((n) => `<a href="?page=${n}" ${n === page ? 'aria-current="page"' : ""}>${n}</a>`).join("")}</div>
          ${page === pageCount ? `<span class="disabled">下一页</span>` : `<a href="?page=${page + 1}">下一页</a>`}
        </nav>
      </div>`;
  }

  /* ---------- 作家页（①–⑩ 顺序契约） ---------- */
  function anecdoteCardHtml(an) {
    return `<article class="anecdote-card">
      <p class="meta"><span>${esc(an.type_label)}</span><span>${esc(an.time_label)}</span><span>${esc(an.location_label)}</span></p>
      <h3>${esc(an.title)}</h3>
      <p class="teaser">${esc(an.teaser)}</p>
      <details><summary>展开读这个故事 ▾</summary>
        <div class="anecdote-body">${esc(an.story)}</div>
        ${an.sources_label ? `<p class="anecdote-src">来源与依据：${esc(an.sources_label)}</p>` : ""}
      </details>
    </article>`;
  }
  function placeCardHtml(p, noteOverride) {
    const fictional = p.reality_status === "fictional";
    const copy = reader("places", p.place_id);
    const kind = p.place_kind === "country" ? "国家文学入口" : fictional ? "文学虚构空间 · 不使用现实坐标" : "现实地点";
    const note = noteOverride || copy.literary_intro || (fictional ? "一处由作品创造的文学空间。" : `从${p.name_zh}的作家、作品与文学地点开始探索。`);
    return `<a class="place-card ${fictional ? "fictional" : ""}" href="${href(p.place_id)}">
      <p class="kind">${kind}</p><h3>${esc(p.name_zh)}</h3><p>${esc(note)}</p><span class="go">打开完整页面 →</span>
    </a>`;
  }
  function renderAuthor(id) {
    const item = ent(id);
    const rc = reader("authors", id);
    if (!item || item.type !== "author" || !isPublic(id)) return renderNotFound();
    const card = cardOf(id);
    const pt = (D.portraits || {})[id];
    const created = D.relations.filter((r) => r.s === id && r.t === "CREATED").map((r) => ent(r.o)).filter(Boolean)
      .sort((a, b) => Number(factv(a.id, "first_publication_year", "publication_year") || 9999) - Number(factv(b.id, "first_publication_year", "publication_year") || 9999));
    const works = created.filter((w) => isPublic(w.id));
    const bibliographic = created.filter((w) => !isPublic(w.id)).slice(0, Math.max(0, 3 - works.length));
    const placeRels = D.relations.filter((r) => r.s === id && r.t === "ASSOCIATED_WITH_PLACE").map((r) => place(r.o)).filter((p) => p && isPublic(p.place_id));
    const featured = (rc.anecdotes || []).slice(0, 2);
    const more = (rc.anecdotes || []).slice(2);
    setMeta(item.name, rc.reader_lede || `${item.name}的生平、作品与文学关联。`);
    document.getElementById("app").innerHTML = `
      <nav class="breadcrumb" aria-label="面包屑"><a href="${BASE}">首页</a> › <a href="${BASE}authors/">作家目录</a> › <span aria-current="page">${esc(item.name)}</span></nav>
      <header class="archive-header">
        <p class="eyebrow">作家档案 <span class="en">· WRITER ARCHIVE</span></p>
        <h1 class="display-title page-title">${esc(item.name)}</h1>
        <div class="tag-row">
          ${item.original ? `<span class="tag original">${esc(item.original)}</span>` : ""}
          ${card.country || factv(id, "country_or_region") ? `<span class="tag">${esc(card.country || factv(id, "country_or_region"))}</span>` : ""}
          ${factv(id, "birth_year") ? `<span class="tag">${esc(factv(id, "birth_year"))}${factv(id, "death_year") ? `—${esc(factv(id, "death_year"))}` : "—"}</span>` : ""}
        </div>
        ${(rc.signature_keywords || []).length ? `<div class="keyword-row">${rc.signature_keywords.map((k) => `<span>${esc(k)}</span>`).join("")}</div>` : ""}
        <p class="lede" style="margin-top:20px">${esc(rc.reader_lede || `${item.name}的生平、作品与文学关联。`)}</p>
      </header>
      <div class="archive-body">
        <aside class="identity-rail" aria-label="作家身份信息">
          <div class="rail-full">
            ${pt ? `<figure class="portrait-photo"><span class="photo-frame"><img src="${BASE}assets/portraits/${pt.file}" alt="${esc(item.name)}的肖像照片" width="${pt.w}" height="${pt.h}" loading="lazy" /></span><figcaption>摄影：${esc(pt.artist)}${pt.year ? `（${esc(pt.year)}）` : ''} · 来源：${esc(pt.source)} · 许可：${esc(pt.license)}</figcaption></figure>` : `<div class="portrait-block"><span class="glyph" aria-hidden="true">${esc(item.name.replace('·', '').charAt(0))}</span><span class="frame" aria-hidden="true"></span><span class="seal">ARCHIVE<br />LATAM</span></div>`}
            <p class="identity-original">${esc(item.original || "")}</p>
            <dl class="fact-list">
              ${factv(id, "birth_year") ? `<div><dt>出生年份</dt><dd>${esc(factv(id, "birth_year"))}</dd></div>` : ""}
              ${factv(id, "death_year") ? `<div><dt>逝世年份</dt><dd>${esc(factv(id, "death_year"))}</dd></div>` : ""}
              ${card.country || factv(id, "country_or_region") ? `<div><dt>国家或地区</dt><dd>${esc(card.country || factv(id, "country_or_region"))}</dd></div>` : ""}
              ${placeRels.length ? `<div><dt>相关地点</dt><dd>${placeRels.filter((p) => p.reality_status !== "fictional").slice(0, 2).map((p) => esc(p.name_zh)).join(" · ")}</dd></div>` : ""}
            </dl>
            <nav class="rail-toc" aria-label="本页目录">
              <h3>本页目录</h3>
              ${rc.why_know ? `<a href="#why-know">为什么值得认识<i>①</i></a>` : ""}
              ${rc.reader_fit ? `<a href="#reader-fit">如果你喜欢<i>②</i></a>` : ""}
              ${featured.length || more.length ? `<a href="#author-anecdotes">作家的另一面<i>③</i></a>` : ""}
              ${placeRels.length ? `<a href="#places">从哪里认识他 / 她<i>④</i></a>` : ""}
              ${works.length ? `<a href="#works">读什么<i>⑤</i></a>` : ""}
              ${(rc.themes || []).length ? `<a href="#themes">他 / 她在写什么<i>⑦</i></a>` : ""}
              ${(rc.reading_route || []).length ? `<a href="#route">一条阅读路线<i>⑧</i></a>` : ""}
              ${rc.guiding_question ? `<a href="#guiding">带着一个问题去读<i>⑨</i></a>` : ""}
              <a href="#relations">文学关系与研究依据<i>⑩</i></a>
            </nav>
          </div>
          <details class="mobile-archive"><summary>本页档案（生卒 · 地点 · 目录）▸</summary><div class="inner"></div></details>
        </aside>
        <div class="reader-col">
          ${rc.why_know ? `<section class="section" id="why-know"><div class="section-head"><h2>为什么值得认识</h2></div><p class="prose">${esc(rc.why_know)}</p></section>` : ""}
          ${rc.reader_fit ? `<section class="section fit-note" id="reader-fit"><p class="eyebrow">如果你喜欢……</p><p>${esc(rc.reader_fit)}</p></section>` : ""}
          ${(featured.length || more.length) ? `<section class="section" id="author-anecdotes">
            <div class="section-head"><h2>作家的另一面</h2><p>把作品放回具体的生活：这些人物故事照见写作之外的时刻。</p></div>
            ${featured.map(anecdoteCardHtml).join("")}
            ${more.length ? `<details class="anecdote-more"><summary>更多故事（${more.length}）▾</summary><div class="cards">${more.map(anecdoteCardHtml).join("")}</div></details>` : ""}
          </section>` : ""}
          ${placeRels.length ? `<section class="section" id="places">
            <div class="section-head"><h2>从哪里认识他 / 她</h2><p>沿生平、创作与地点之间的联系继续。</p></div>
            <div class="place-grid">${placeRels.map((p) => placeCardHtml(p)).join("")}</div>
          </section>` : ""}
          ${works.length ? `<section class="section" id="works">
            <div class="section-head"><h2>读什么</h2><p>从作品导读进入，也可以顺着代表书目了解创作脉络。</p></div>
            <div class="work-rows">${[
              ...works.map((w) => {
                const wc = cardOf(w.id);
                const y = factv(w.id, "first_publication_year", "publication_year");
                return `<a class="work-row" href="${href(w.id)}">
                  <span class="year">${esc(y || "—")}</span>
                  <span><h3>${esc(workName(w.name))}</h3><p class="original">${esc(w.original || "")}</p></span>
                  ${wc.genre ? `<span class="genre">${esc(wc.genre)}</span>` : "<span></span>"}
                </a>`;
              }),
              ...bibliographic.map((w) => {
                const y = factv(w.id, "first_publication_year", "publication_year");
                return `<div class="work-row" style="background:rgba(233,223,201,.4)">
                  <span class="year">${esc(y || "—")}</span>
                  <span><h3>${esc(workName(w.name))}</h3><p class="original">${esc(w.original || "")} · 代表书目</p></span>
                  <span></span>
                </div>`;
              }),
            ].join("")}</div>
          </section>` : ""}
          ${(rc.themes || []).length ? `<section class="section" id="themes">
            <div class="section-head"><h2>他 / 她在写什么</h2><p>沿核心主题继续理解作品。</p></div>
            <div class="theme-grid">${rc.themes.map((t) => `<article><h3>${esc(t.title)}</h3><p>${esc(t.text)}</p></article>`).join("")}</div>
          </section>` : ""}
          ${(rc.reading_route || []).length ? `<section class="section" id="route">
            <div class="section-head"><h2>一条阅读路线</h2><p>从入门到继续探索，每一步都指向下一层文学问题。</p></div>
            <ol class="route-steps">${rc.reading_route.map((s) => `<li>${esc(s)}</li>`).join("")}</ol>
          </section>` : ""}
          ${rc.guiding_question ? `<section class="section guiding" id="guiding"><p class="eyebrow">带着一个问题去读</p><blockquote>${esc(rc.guiding_question)}</blockquote></section>` : ""}
          <section class="section" id="relations">
            <div class="section-head"><h2>文学关系</h2><p>沿作品与地点之间的联系继续。</p></div>
            <div class="relation-list">
              ${works.slice(0, 3).map((w) => `<a href="${href(w.id)}"><strong>${esc(workName(w.name))}</strong><span>由${esc(item.name)}创作</span></a>`).join("")}
              ${placeRels.slice(0, 3).map((p) => `<a href="${href(p.place_id)}"><strong>${esc(p.name_zh)}</strong><span>与生平或创作有关的地点</span></a>`).join("")}
            </div>
            ${researchPanel(id, curationFor(id, "page_lede")?.refs || [])}
          </section>
        </div>
      </div>
      <section class="archive-foot">
        <p><b>继续探索</b>：<a class="text-link" href="${BASE}authors/">作家目录</a> ｜ <a class="text-link" href="${BASE}">回到地图</a></p>
        <p class="muted">沿既有公开关系与策展路径交叉导航。</p>
      </section>`;
    const inner = document.querySelector(".identity-rail .rail-full").innerHTML;
    document.querySelector(".mobile-archive .inner").innerHTML = inner;
  }

  /* ---------- 作品页 ---------- */
  function renderWork(id) {
    const item = ent(id);
    const rc = reader("works", id);
    if (!item || (item.type !== "work") || !isPublic(id)) return renderNotFound();
    const card = cardOf(id);
    const authors = D.relations.filter((r) => r.o === id && r.t === "CREATED").map((r) => ent(r.s)).filter(Boolean);
    const locations = D.relations.filter((r) => r.s === id && r.t === "SET_IN").map((r) => place(r.o)).filter((p) => p && p.map_status !== "hidden" && p.reality_status !== "unknown");
    const connections = D.relations.filter((r) => r.s === id || r.o === id).filter((r) => !["CREATED", "SET_IN", "EXPLORES_THEME"].includes(r.t));
    const summary = rc.reading_premise || `从《${item.name}》进入它的故事与文学关联。`;
    const year = factv(id, "first_publication_year", "publication_year");
    const genre = card.genre || factv(id, "genre_or_form");
    const why = rc.why?.length ? rc.why : (D.presentation.whyRead || []).find((w) => w.work_id === id)?.points || [];
    const nextReads = (rc.next_reads || []).map((n) => ({ target: ent(n.target_id), reason: n.reason })).filter((n) => n.target && isPublic(n.target.id));
    const coverPortrait = authors[0] ? (D.portraits || {})[authors[0].id] : null;
    setMeta(`《${item.name}》`, summary);
    document.getElementById("app").innerHTML = `
      <nav class="breadcrumb" aria-label="面包屑"><a href="${BASE}">首页</a> › <a href="${BASE}works/">作品目录</a> › <span aria-current="page">《${esc(item.name)}》</span></nav>
      <header class="archive-header work-archive">
        <p class="eyebrow">作品档案 <span class="en">· LITERARY EDITION</span></p>
        <div class="work-cover${coverPortrait ? " has-photo" : ""}" aria-hidden="true">
          ${coverPortrait ? `<img src="${BASE}assets/portraits/${coverPortrait.file}" alt="" width="96" height="128" loading="eager" />` : ""}
          <i>${esc(item.name.replace(/[《》·\s]/g, '').charAt(0) || '书')}</i>
        </div>
        <h1 class="display-title page-title">${esc(workName(item.name))}</h1>
        <div class="tag-row">
          ${item.original ? `<span class="tag original">${esc(item.original)}</span>` : ""}
          ${authors[0] && isPublic(authors[0].id) ? `<a class="tag" href="${href(authors[0].id)}">${esc(authors[0].name)}</a>` : authors[0] ? `<span class="tag">${esc(authors[0].name)}</span>` : ""}
          ${year ? `<span class="tag">${esc(year)}</span>` : ""}
          ${genre ? `<span class="tag">${esc(genre)}</span>` : ""}
          ${card.country ? `<span class="tag">${esc(card.country)}</span>` : ""}
        </div>
        <p class="lede" style="margin-top:20px">${esc(summary)}</p>
      </header>
      <div class="work-body">
        <div class="content-copy">
          <h2>它讲了什么</h2>
          <p class="prose">${esc(rc.story_intro || summary)}</p>
          ${why.length ? `<h2>为什么值得读</h2><div class="theme-grid">${why.map((p) => `<article><h3>${esc(p.title)}</h3><p>${esc(p.text)}</p></article>`).join("")}</div>` : ""}
          ${rc.features?.length ? `<h2>叙事与形式</h2><div class="theme-grid">${rc.features.map((p) => `<article><h3>${esc(p.title)}</h3><p>${esc(p.text)}</p></article>`).join("")}</div>` : ""}
        </div>
        <aside class="side-rail">
          <div class="info-box"><h3>作品概览</h3><dl class="info-list">
            ${authors[0] ? `<div><dt>作者</dt><dd>${esc(authors[0].name)}</dd></div>` : ""}
            ${year ? `<div><dt>首次出版/发表</dt><dd>${esc(year)}</dd></div>` : ""}
            ${genre ? `<div><dt>体裁</dt><dd>${esc(genre)}</dd></div>` : ""}
            ${card.country ? `<div><dt>国家或地区</dt><dd>${esc(card.country)}</dd></div>` : ""}
          </dl></div>
          ${rc.reading_approach ? `<div class="info-box"><h3>怎么读这本书</h3><p style="margin:0;font-size:13.5px;line-height:1.85">${esc(rc.reading_approach)}</p></div>` : ""}
          ${rc.location_note ? `<div class="info-box"><h3>空间说明</h3><p style="margin:0;font-size:13px;line-height:1.8">${esc(rc.location_note)}</p></div>` : ""}
        </aside>
      </div>
      ${(locations.length || rc.location_note) ? `<section class="section"><div class="section-head"><h2>它发生在哪里</h2></div><div class="linked-grid">${locations.map((p) => placeCardHtml(p)).join("")}</div></section>` : ""}
      ${rc.themes?.length ? `<section class="section"><div class="section-head"><h2>它在讨论什么</h2><p>沿核心主题继续理解作品。</p></div><div class="theme-grid">${rc.themes.map((t) => `<article><h3>${esc(t.title)}</h3><p>${esc(t.text)}</p></article>`).join("")}</div></section>` : ""}
      ${rc.significance ? `<section class="section"><div class="section-head"><h2>文学史位置</h2></div><p class="prose">${esc(rc.significance)}</p></section>` : ""}
      ${rc.guiding_question ? `<section class="section guiding"><p class="eyebrow">带着一个问题去读</p><blockquote>${esc(rc.guiding_question)}</blockquote></section>` : ""}
      <section class="section"><div class="section-head"><h2>文学关联</h2></div><div class="relation-list">
        ${authors.map((a) => isPublic(a.id) ? `<a href="${href(a.id)}"><strong>${esc(a.name)}</strong><span>作者</span></a>` : `<div><strong>${esc(a.name)}</strong><span>作者</span></div>`).join("")}
        ${connections.map((r) => {
          const otherId = r.s === id ? r.o : r.s;
          const other = ent(otherId) || place(otherId);
          if (!other || !isPublic(otherId)) return "";
          return `<a href="${href(otherId)}"><strong>${esc(other.name || other.name_zh)}</strong><span>${esc(r.d || relationLabel[r.t] || "文学关联")}</span></a>`;
        }).join("")}
      </div>${researchPanel(id, curationFor(id, "one_line_summary")?.refs || [])}</section>
      ${nextReads.length ? `<section class="section"><div class="section-head"><h2>读完之后读什么</h2><p>每条路径都说明它与本书的连接方式。</p></div><div class="linked-grid">${nextReads.map((n) => `<a class="place-card" href="${href(n.target.id)}"><p class="kind">继续阅读</p><h3>${esc(workName(n.target.name))}</h3><p>${esc(n.reason)}</p><span class="go">打开作品页 →</span></a>`).join("")}</div></section>` : ""}
      <section class="archive-foot"><p><b>继续探索</b>：<a class="text-link" href="${BASE}works/">作品目录</a> ｜ <a class="text-link" href="${authors[0] && isPublic(authors[0].id) ? href(authors[0].id) : BASE + "authors/"}">回到作者</a></p></section>`;
  }

  /* ---------- 地点 / 国家 / 虚构空间 ---------- */
  function literaryConnections(placeIds, includeWorkCreators = false) {
    const scope = new Set(placeIds);
    const rels = D.map.relations.filter((r) => scope.has(r.place));
    const authors = new Set(rels.filter((r) => ent(r.src)?.type === "author" && isPublic(r.src)).map((r) => r.src));
    const works = new Set(rels.filter((r) => ent(r.src)?.type === "work" && isPublic(r.src)).map((r) => r.src));
    if (includeWorkCreators) works.forEach((w) => { const a = D.createdBy[w]; if (a && isPublic(a)) authors.add(a); });
    return { authors: [...authors], works: [...works] };
  }
  function renderPlace(id) {
    const p = place(id);
    if (!p || p.map_status === "hidden" || p.reality_status === "unknown") return renderNotFound();
    const fictional = p.reality_status === "fictional";
    const isCountry = p.place_kind === "country";
    const copy = reader("places", id);
    const children = isCountry
      ? D.map.places.filter((x) => x.parent_place_id === id && x.map_status !== "hidden" && x.reality_status !== "unknown" && isPublic(x.place_id))
      : [];
    const realChildren = children.filter((x) => x.reality_status === "real");
    const ctx = isCountry ? literaryConnections([id, ...children.map((c) => c.place_id)]) : literaryConnections([id], fictional);
    const text = copy.literary_intro || (fictional ? "这是一处由文学作品创造的空间。" : isCountry ? `从${p.name_zh}的作家、作品与文学地点开始探索。` : `从${p.name_zh}的作家、作品与文学地点开始探索。`);
    const noteRefs = (curationFor(id, fictional ? "fictional_space_note" : "literary_place_note")?.refs) || [];
    const mapRefs = D.map.relations.filter((r) => r.place === id).flatMap((r) => r.refs || []);
    setMeta(fictional ? `${p.name_zh}（文学虚构空间）` : `${p.name_zh}`, text);
    document.getElementById("app").innerHTML = `
      <nav class="breadcrumb" aria-label="面包屑"><a href="${BASE}">首页</a> › <a href="${BASE}#literary-map">地图</a> › <span aria-current="page">${esc(p.name_zh)}</span></nav>
      <header class="subpage-header">
        <p class="eyebrow">${fictional ? "文学虚构空间" : isCountry ? "国家文学入口" : "文学地点"} <span class="en">· ${fictional ? "FICTIONAL SPACE" : isCountry ? "COUNTRY" : "PLACE"}</span></p>
        <h1 class="display-title">${esc(p.name_zh)}</h1>
        <div class="tag-row">
          <span class="tag ${fictional ? "fictional" : "real"}">${fictional ? "由作品创造的空间" : isCountry ? "国家" : "现实地点"}</span>
          ${p.original_name ? `<span class="tag">${esc(p.original_name)}</span>` : ""}
          ${isCountry && p.country_code ? `<span class="tag">${esc(p.country_code)}</span>` : ""}
        </div>
        <p class="lede" style="margin-top:18px">${esc(text)}</p>
      </header>
      <div class="work-body">
        <div class="content-copy">
          ${copy.spatial_meaning ? `<h2>这里为什么值得注意</h2><p class="prose">${esc(copy.spatial_meaning)}</p>` : ""}
          <h2>${fictional ? "它出现在哪里" : "这里为什么与文学有关"}</h2>
          <div class="relation-list place-links">
            ${[...ctx.works.map((w) => ({ id: w, kind: "作品" })), ...ctx.authors.map((a) => ({ id: a, kind: "作家" }))].map((x) =>
              `<a href="${href(x.id)}"><strong>${ent(x.id)?.type === "work" ? `《${esc(entName(x.id))}》` : esc(entName(x.id))}</strong><span>${x.kind} →</span></a>`).join("")
              || `<div><strong>还没有可展示的文学关联。</strong><span>—</span></div>`}
          </div>
          ${fictional ? `<p class="fictional-note">文学虚构空间不使用现实坐标。地图将它作为独立的文学入口呈现，不与任何真实经纬度对应。</p>` : ""}
        </div>
        <aside class="side-rail">
          ${copy.exploration_route ? `<div class="info-box"><h3>从这里继续</h3><p style="margin:0;font-size:13.5px;line-height:1.85">${esc(copy.exploration_route)}</p></div>` : ""}
          <div class="info-box"><h3>直接入口</h3><dl class="info-list">
            ${ctx.authors.slice(0, 5).map((a) => `<div><dt>作家</dt><dd><a class="text-link" href="${href(a)}">${esc(entName(a))} →</a></dd></div>`).join("")}
            ${ctx.works.slice(0, 5).map((w) => `<div><dt>作品</dt><dd><a class="text-link" href="${href(w)}">${esc(workName(entName(w)))} →</a></dd></div>`).join("")}
          </dl></div>
          <a class="hero-cta" href="${BASE}?select=${encodeURIComponent(id)}" style="min-height:46px;font-size:13px">在地图上查看 ${esc(p.name_zh)} →</a>
        </aside>
      </div>
      ${realChildren.length ? `<section class="section"><div class="section-head"><h2>重要地点与文学空间</h2><p>从这个国家继续进入具体地点。</p></div><div class="linked-grid">${realChildren.map((c) => placeCardHtml(c)).join("")}</div></section>` : ""}
      <section class="section">${researchPanel(p.entity_id || id, [...noteRefs, ...mapRefs])}</section>
      <section class="archive-foot"><p><b>继续探索</b>：<a class="text-link" href="${BASE}">回到地图</a>${isCountry ? ` ｜ <a class="text-link" href="${BASE}authors/">作家目录</a>` : ""}</p></section>`;
  }

  /* ---------- 阅读路径页 ---------- */
  function renderPath(slug) {
    const path = D.presentation.readingPaths.find((p) => p.slug === slug);
    if (!path) return renderNotFound();
    setMeta(path.title, path.description || path.intro || "");
    document.getElementById("app").innerHTML = `
      <nav class="breadcrumb" aria-label="面包屑"><a href="${BASE}">首页</a> › <span aria-current="page">阅读路径</span></nav>
      <header class="subpage-header">
        <p class="eyebrow">策展阅读路径 <span class="en">· READING PATH</span></p>
        <h1 class="display-title">${esc(path.title)}</h1>
        <p class="lede" style="margin-top:18px">${esc(path.intro || path.description || "")}</p>
      </header>
      <div style="padding: clamp(26px,4vw,44px) 0;">
        <div class="path-sequence">
          ${(path.target_ids || []).map((tid, i) => {
            const e = ent(tid) || place(tid);
            if (!e) return "";
            const isPlace = Boolean(place(tid));
            const kind = isPlace ? (place(tid).reality_status === "fictional" ? "文学虚构空间" : place(tid).place_kind === "country" ? "国家" : "现实地点") : typeLabel[e.type] || "条目";
            const note = isPlace ? (reader("places", tid).literary_intro || "") : (e.type === "work" ? (reader("works", tid).reading_premise || "") : (reader("authors", tid).reader_lede || ""));
            const name = e.type === "work" ? esc(workName(e.name)) : esc(e.name || e.name_zh);
            return `<div class="path-step"><span>${String(i + 1).padStart(2, "0")}</span>
              <a class="path-card" href="${href(tid)}"><p class="kind">${kind}</p><h3>${name}</h3>${note ? `<p>${esc(note)}</p>` : ""}<span class="go text-link" style="margin-top:10px;display:inline-block">打开条目 →</span></a>
            </div>`;
          }).join("")}
        </div>
        ${path.guiding_question ? `<section class="section guiding" style="margin-top:36px"><p class="eyebrow">带着一个问题继续</p><blockquote>${esc(path.guiding_question)}</blockquote></section>` : ""}
      </div>
      <section class="archive-foot"><p><b>继续探索</b>：<a class="text-link" href="${BASE}">回到地图</a> ｜ <a class="text-link" href="${BASE}timeline/">打开时间线</a></p></section>`;
  }

  /* ---------- 时间线 ---------- */
  function renderTimeline() {
    setMeta("文学时间线", "沿文学时期、作家与作品理解拉丁美洲文学的发展。");
    const yearOf = (t) => Number(String(t.year).match(/\d{4}/)?.[0] || 0);
    const groups = (D.presentation.timelinePeriods || []).map((period) => ({
      ...period,
      items: D.timeline.filter((t) => { const y = yearOf(t); return y && y >= period.start && y <= period.end && t.kind !== "historical_background" && isPublic(t.id); }),
    }));
    const backgrounds = D.timeline.filter((t) => t.kind === "historical_background" && D.relations.some((r) => r.t === "BASED_ON_EVENT" && (r.s === t.id || r.o === t.id)));
    document.getElementById("app").innerHTML = `
      <header class="subpage-header timeline-page" style="border-bottom:0;padding-bottom:0">
        <p class="eyebrow">文学时间线 <span class="en">· TIMELINE</span></p>
        <h1 class="display-title">沿时间进入<br /><em style="color:var(--burgundy);font-style:normal">拉丁美洲文学</em></h1>
        <p class="lede" style="margin-top:16px">${esc(D.presentation.timelineNote || "按作家的生卒年与作品的首次发表年份排列，帮助读者建立时间感。")}</p>
      </header>
      <div class="timeline-full timeline-page">
        ${groups.map((g) => `<section class="timeline-group">
          <div class="timeline-head"><h2>${esc(g.title)}</h2><span>${esc(g.display_range || `${g.start}—${g.end}`)}</span></div>
          ${g.items.slice(0, 12).map((t) => `<div class="timeline-item"><time>${esc(t.year)}</time><div><strong><a href="${href(t.id)}">${t.kind === "literary_work" ? esc(workName(t.name)) : esc(t.name)}</a></strong><p>${t.kind === "literary_author" ? "作家" : "作品"}</p></div></div>`).join("") || `<p class="search-empty">这一年代还没有可展示的条目。</p>`}
        </section>`).join("")}
        ${backgrounds.length ? `<section class="timeline-group"><div class="timeline-head"><h2>理解作品的历史背景</h2><span>与具体作品直接相连</span></div>
          ${backgrounds.map((t) => `<div class="timeline-item"><time>${esc(t.year)}</time><div><strong>${esc(t.name)}</strong><p>历史背景</p></div></div>`).join("")}
        </section>` : ""}
      </div>
      <section class="archive-foot"><p><b>继续探索</b>：<a class="text-link" href="${BASE}">回到地图</a> ｜ <a class="text-link" href="${BASE}authors/">作家目录</a></p></section>`;
  }

  /* ---------- About ---------- */
  function renderAbout() {
    setMeta("关于项目", "从地点进入拉丁美洲文学，理解真实地理、虚构空间、作家与作品如何彼此连接。");
    document.getElementById("app").innerHTML = `
      <header class="subpage-header" style="border-bottom:0;padding-bottom:0">
        <p class="eyebrow">关于项目 <span class="en">· ABOUT</span></p>
        <h1 class="display-title">为什么做一张<br /><em style="color:var(--burgundy);font-style:normal">文学地图？</em></h1>
        <p class="lede" style="margin-top:16px">因为文学从来不只发生在书页里。它也发生在城市、边境、河流、港口，以及作家创造出来的世界中。</p>
      </header>
      <div class="about-articles" style="padding-top:26px">
        <article><span>01</span><div><h2>这是什么</h2><p>拉丁美洲文学地图是一项面向中文读者的文学探索计划。你可以从一个地方开始，遇见与它有关的作家和作品，再沿着时间、主题与文学关系继续阅读。它不是一份必须按顺序读完的文学史，而是一组可以自由进入的路径。</p></div></article>
        <article><span>02</span><div><h2>为什么是一张地图</h2><p>地点不只是故事的背景。墨西哥的村庄、布宜诺斯艾利斯的街道、加勒比海岸的城镇，都可能塑造一种叙事声音；马孔多、科马拉这样的虚构空间，也会反过来改变我们理解现实的方式。地图让这些关系变得可见。</p></div></article>
        <article><span>03</span><div><h2>你可以怎样探索</h2><ul><li>从地图选择国家、城市或文学虚构空间；</li><li>从相关作家进入他的生平、作品与写作地点；</li><li>从一部作品继续寻找它发生在哪里、讨论什么；</li><li>也可以使用搜索与时间线，建立自己的阅读顺序。</li></ul></div></article>
        <article><span>04</span><div><h2>不止魔幻现实主义</h2><p>拉丁美洲文学远比一个标签更宽广。这里也有现代主义、先锋实验、城市小说、短篇传统、诗歌、历史叙事与当代写作。地图希望保留这些差异，让读者看见不同语言区域、年代与文学形式之间丰富而不整齐的联系。</p></div></article>
        <article><span>05</span><div><h2>一张持续生长的地图</h2><p>这张地图会继续增加新的地点、作家、作品与阅读路径。现实地点按它们所在的位置呈现；文学虚构空间则始终与现实坐标分开。某段联系尚不确定时，地图会暂时留下空白。</p></div></article>
        <details class="research-panel"><summary>研究依据与使用边界 ▸</summary><div class="research-body">
          <section><h3>资料与版权</h3><p class="why">基础事实与文学关系来自公开可追溯资料，页面书目尽可能保留原始访问链接。项目不提供受版权保护的作品全文，也不使用作品封面；地图边界来自公共领域的 Natural Earth 数据。内容页的“研究依据与延伸阅读”提供进一步核对入口。</p></section>
          <section><h3>地图范围与中立性</h3><p class="why">地图范围采用拉丁美洲历史文化口径；范围外的邻接陆地不在本图呈现。本地图仅呈现地理事实与文学关联，不代表对任何争议边界、领土归属或政治地位的立场；边界采用 Natural Earth（公有领域）的 de facto 数据呈现，不构成法律上的边界或地位裁决；文学地点坐标来自 GeoNames（CC BY 4.0）。</p></section>
        </div></details>
      </div>
      <section class="archive-foot"><p><b>继续探索</b>：<a class="text-link" href="${BASE}">回到地图</a></p></section>`;
  }

  /* ---------- 趣闻索引 ---------- */
  function renderAnecdotes() {
    setMeta("作家趣闻", "从人物故事进入作家的生活与写作。");
    const rankBy = new Map((D.presentation.discovery?.authors || []).map((r) => [r.target_id, r.rank]));
    const entries = D.readers.authors
      .filter((a) => isPublic(a.target_id) && (a.anecdotes || []).length)
      .map((a) => ({ a, e: ent(a.target_id), rank: rankBy.get(a.target_id) ?? 9999 }))
      .filter((x) => x.e)
      .sort((x, y) => x.rank - y.rank || x.a.target_id.localeCompare(y.a.target_id));
    document.getElementById("app").innerHTML = `
      <header class="subpage-header">
        <p class="eyebrow">作家的另一面 <span class="en">· ANECDOTES</span></p>
        <h1 class="display-title">作家趣闻</h1>
        <p class="lede">把作品放回具体的生活。从人物故事出发，再进入作家页阅读完整趣闻。${entries.length} 位作家已收录可公开的人物故事。</p>
      </header>
      <div style="padding: clamp(26px,4vw,44px) 0;">
        <div class="anecdote-grid">
          ${entries.map(({ a, e }) => {
            const f = a.anecdotes[0];
            return `<article class="anecdote-entry">
              <p class="meta"><span>作家趣闻</span><span>${a.anecdotes.length} 则故事</span></p>
              <h3>${esc(f.title)}</h3>
              <p class="who"><a href="${href(e.id)}#author-anecdotes">${esc(e.name)} →</a></p>
              <p class="teaser">${esc(f.teaser)}</p>
              <a class="go text-link" href="${href(e.id)}#author-anecdotes">在作家页继续阅读 →</a>
            </article>`; }).join("")}
        </div>
      </div>
      <section class="archive-foot"><p><b>继续探索</b>：<a class="text-link" href="${BASE}authors/">作家目录</a> ｜ <a class="text-link" href="${BASE}">回到地图</a></p></section>`;
  }

  /* ---------- 搜索页 ---------- */
  function renderSearch() {
    const q = new URLSearchParams(location.search).get("q") || "";
    const n = q.trim().toLowerCase();
    const direct = D.search.filter((s) => !n || (`${s.name} ${s.original}`.toLowerCase().includes(n)));
    const related = n ? new Set(direct.flatMap((s) => [])) : new Set(); /* related_ids 不在子集内：只展示直接匹配（与正式一致缺省关联扩展） */
    const results = direct.slice(0, 80);
    const grouped = new Map();
    results.forEach((s) => { if (!grouped.has(s.type)) grouped.set(s.type, []); grouped.get(s.type).push(s); });
    setMeta("搜索", "搜索作家、作品、国家、地点、文学空间、主题与文学运动。");
    document.getElementById("app").innerHTML = `
      <div class="search-page">
        <p class="eyebrow">文学搜索 <span class="en">· SEARCH</span></p>
        <h1 class="display-title" style="font-size:clamp(30px,3.6vw,48px)">找到你的下一条阅读路径。</h1>
        <form class="search-form" role="search">
          <label class="visually-hidden" for="q">搜索文学内容</label>
          <input id="q" type="search" value="${esc(q)}" placeholder="输入作者、作品、地点或原文名" />
          <button type="submit">搜索</button>
        </form>
        <p class="search-count" aria-live="polite">${n ? `找到 ${results.length} 条与“${esc(q)}”直接匹配的内容` : "浏览全部文学入口"}</p>
        ${[...grouped.entries()].map(([type, items]) => `<section class="search-group"><h2>${typeLabel[type] || "文学关联"}<span>${items.length}</span></h2>
          ${items.map((s) => `<a class="search-result" href="${href(s.id)}"><span><strong>${s.type === "work" || s.type === "collection" ? `《${esc(s.name)}》` : esc(s.name)}</strong><small>${typeLabel[s.type] || "文学关联"}${s.original ? ` · ${esc(s.original)}` : ""}</small></span><span aria-hidden="true" style="color:var(--burgundy)">→</span></a>`).join("")}
        </section>`).join("") || `<p class="search-empty">没有找到匹配项。可以换一个中文名、原文名或地点名。</p>`}
      </div>`;
    document.querySelector(".search-form")?.addEventListener("submit", (e) => {
      e.preventDefault();
      location.href = `?q=${encodeURIComponent(document.getElementById("q").value)}`;
    });
  }

  /* ---------- 节点页（主题/运动/合集外类型） ---------- */
  function renderNode(id) {
    const item = ent(id);
    if (!item || !isPublic(id)) return renderNotFound();
    setMeta(item.name, `${typeLabel[item.type] || "文学关联"}“${item.name}”及其相关文学内容。`);
    document.getElementById("app").innerHTML = `
      <nav class="breadcrumb" aria-label="面包屑"><a href="${BASE}">首页</a> › <span aria-current="page">${esc(item.name)}</span></nav>
      <header class="subpage-header">
        <p class="eyebrow">${typeLabel[item.type] || "文学关联"}</p>
        <h1 class="display-title">${esc(item.name)}</h1>
        ${item.original ? `<p class="lede" style="margin-top:14px;font-style:italic">${esc(item.original)}</p>` : ""}
      </header>
      <section class="section" style="padding-top:clamp(26px,4vw,44px)">
        <div class="section-head"><h2>从这里继续探索</h2><p>沿相关作家、作品、地点与主题继续。</p></div>
        <div class="relation-list">
          ${relsOf(id).map((r) => {
            const otherId = r.s === id ? r.o : r.s;
            const other = ent(otherId) || place(otherId);
            if (!other || !isPublic(otherId)) return "";
            const name = ent(otherId)?.type === "work" ? esc(workName(other.name || other.name_zh)) : esc(other.name || other.name_zh);
            return `<a href="${href(otherId)}"><strong>${name}</strong><span>${esc(r.d || relationLabel[r.t] || "文学关联")}</span></a>`;
          }).join("") || `<div><strong>还没有可展示的相关内容。</strong><span>—</span></div>`}
        </div>
        ${researchPanel(id)}
      </section>`;
  }

  /* ---------- 404 ---------- */
  function renderNotFound() {
    setMeta("页面未找到", "这条文学路径尚未开放。");
    document.getElementById("app").innerHTML = `
      <div class="error-box">
        <p class="eyebrow">404</p>
        <h1>这条文学路径尚未开放。</h1>
        <p>返回地图，选择一个国家、地点、作家或作品继续探索。</p>
        <a class="text-link" href="${BASE}">回到文学地图 →</a>
      </div>`;
    return;
  }

  /* ---------- 路由 ---------- */
  function render() {
    switch (ROUTE.kind) {
      case "authors": case "works": return renderCatalog(ROUTE.kind);
      case "anecdotes": return renderAnecdotes();
      case "search": return renderSearch();
      case "timeline": return renderTimeline();
      case "about": return renderAbout();
      case "path": return renderPath(ROUTE.slug);
      case "country": case "place": case "fictional_space": return renderPlace(ROUTE.id);
      case "author": return renderAuthor(ROUTE.id);
      case "work": return renderWork(ROUTE.id);
      case "node": return renderNode(ROUTE.id);
      default: return renderNotFound();
    }
  }
  render();
})();
