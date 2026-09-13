/* ============================================================
   WCD-11 阶段二 · 地图模块
   投影 / 视口适配 / 标签碰撞 / L1-L2 渲染 / 选择语义：
   忠实移植自 6e1d882 site/app.js（Web 0.5.0，已审计实现），
   仅容器与面板渲染适配原型结构。地理事实不重画。
   ============================================================ */
(function () {
  "use strict";

  const D = window.__SITE_DATA;
  const GEO = window.__NE50M;

  /* ---- 常量（与正式实现一致） ---- */
  const MAP_WIDTH = 880;
  const MAP_HEIGHT = 560;
  const MAP_PADDING = 22;
  const MAP_WINDOW = { west: -118, south: -56, east: -32, north: 33 };
  const LAEA = { centralLongitude: -75, centralLatitude: -11.5 };

  let mapProjectionViewport;

  /* ---- 数据访问（公开投影语义） ---- */
  const place = (id) => D.map.places.find((p) => p.place_id === id);
  const indexEntry = (id) => D.search.find((s) => s.id === id);
  const isPublic = (id) => Boolean(indexEntry(id)?.route);
  const hrefOf = (id) => indexEntry(id)?.route || "#";   /* 真实 public_route */
  const publicPlaces = () => D.map.places.filter((p) => p.map_status !== "hidden" && p.reality_status !== "unknown");
  const entityType = (id) => indexEntry(id)?.type;

  /* ---- 投影（LAEA + 统一 fit；逐行移植） ---- */
  function projectLaeaRaw([longitude, latitude]) {
    const radians = Math.PI / 180;
    const lambda = longitude * radians;
    const phi = latitude * radians;
    const lambda0 = LAEA.centralLongitude * radians;
    const phi0 = LAEA.centralLatitude * radians;
    const delta = lambda - lambda0;
    const denominator = 1 + Math.sin(phi0) * Math.sin(phi) + Math.cos(phi0) * Math.cos(phi) * Math.cos(delta);
    const k = Math.sqrt(2 / denominator);
    return [
      k * Math.cos(phi) * Math.sin(delta),
      k * (Math.cos(phi0) * Math.sin(phi) - Math.sin(phi0) * Math.cos(phi) * Math.cos(delta)),
    ];
  }
  function eachCoordinate(geometry, callback) {
    const visit = (value) => {
      if (typeof value?.[0] === "number") callback(value);
      else value.forEach(visit);
    };
    visit(geometry.coordinates);
  }
  function projectionViewport(featureCollection) {
    const projected = [];
    featureCollection.features.forEach((f) => eachCoordinate(f.geometry, (p) => projected.push(projectLaeaRaw(p))));
    const xs = projected.map((p) => p[0]);
    const ys = projected.map((p) => p[1]);
    const bounds = { minX: Math.min(...xs), maxX: Math.max(...xs), minY: Math.min(...ys), maxY: Math.max(...ys) };
    const scale = Math.min((MAP_WIDTH - 2 * MAP_PADDING) / (bounds.maxX - bounds.minX), (MAP_HEIGHT - 2 * MAP_PADDING) / (bounds.maxY - bounds.minY));
    return {
      ...bounds, scale,
      offsetX: (MAP_WIDTH - (bounds.maxX - bounds.minX) * scale) / 2,
      offsetY: (MAP_HEIGHT - (bounds.maxY - bounds.minY) * scale) / 2,
    };
  }
  function project(point) {
    const [rawX, rawY] = projectLaeaRaw(point);
    return [
      mapProjectionViewport.offsetX + (rawX - mapProjectionViewport.minX) * mapProjectionViewport.scale,
      MAP_HEIGHT - mapProjectionViewport.offsetY - (rawY - mapProjectionViewport.minY) * mapProjectionViewport.scale,
    ];
  }
  function isInsideMapWindow(item) {
    return item.longitude >= MAP_WINDOW.west && item.longitude <= MAP_WINDOW.east
      && item.latitude >= MAP_WINDOW.south && item.latitude <= MAP_WINDOW.north;
  }

  /* ---- 几何路径 ---- */
  function polygonPath(coordinates) {
    return coordinates.map((ring) => ring.map((point, index) => `${index ? "L" : "M"}${project(point).map((v) => v.toFixed(1)).join(" ")}`).join("") + "Z").join("");
  }
  function featurePath(feature) {
    const coordinates = feature.geometry.coordinates;
    return feature.geometry.type === "Polygon" ? polygonPath(coordinates) : coordinates.map(polygonPath).join("");
  }
  function polygonLabelPoint(ring) {
    const points = ring.map(project);
    let areaTwice = 0, centroidX = 0, centroidY = 0;
    points.forEach((point, index) => {
      const next = points[(index + 1) % points.length];
      const cross = point[0] * next[1] - next[0] * point[1];
      areaTwice += cross;
      centroidX += (point[0] + next[0]) * cross;
      centroidY += (point[1] + next[1]) * cross;
    });
    if (Math.abs(areaTwice) < 0.001) {
      const xs = points.map((p) => p[0]);
      const ys = points.map((p) => p[1]);
      return { area: 0, point: [(Math.min(...xs) + Math.max(...xs)) / 2, (Math.min(...ys) + Math.max(...ys)) / 2] };
    }
    return { area: Math.abs(areaTwice / 2), point: [centroidX / (3 * areaTwice), centroidY / (3 * areaTwice)] };
  }
  function automaticCountryLabelPoint(feature) {
    const polygons = feature.geometry.type === "Polygon" ? [feature.geometry.coordinates] : feature.geometry.coordinates;
    return polygons.map((polygon) => polygonLabelPoint(polygon[0])).sort((a, b) => b.area - a.area)[0].point;
  }

  /* ---- 标签碰撞布局（逐行移植） ---- */
  function overlapsLabelBox(first, second) {
    return !(first.right + 4 < second.left || first.left > second.right + 4 || first.bottom + 4 < second.top || first.top > second.bottom + 4);
  }
  function countryLabelLayout(countries, featureByCode) {
    const occupied = [];
    const labels = new Map();
    const offsets = [[0, 0], [0, -22], [0, 22], [-34, 0], [34, 0], [-34, -22], [34, 22], [-34, 22], [34, -22]];
    [...countries.entries()].sort(([a], [b]) => a.localeCompare(b)).forEach(([code, country]) => {
      const feature = featureByCode.get(code);
      if (!feature) return;
      const sourceAnchor = [feature.properties.LABEL_LONGITUDE, feature.properties.LABEL_LATITUDE];
      const anchor = sourceAnchor.every(Number.isFinite) ? project(sourceAnchor) : automaticCountryLabelPoint(feature);
      const width = Math.max(42, country.name_zh.length * 16);
      const choice = offsets.map(([dx, dy]) => ({
        x: anchor[0] + dx, y: anchor[1] + dy, dx, dy,
        box: { left: anchor[0] + dx - width / 2, right: anchor[0] + dx + width / 2, top: anchor[1] + dy - 15, bottom: anchor[1] + dy + 6 },
      })).find((c) => c.box.left >= 0 && c.box.right <= MAP_WIDTH && c.box.top >= 0 && c.box.bottom <= MAP_HEIGHT && !occupied.some((o) => overlapsLabelBox(c.box, o)));
      const selected = choice || { x: anchor[0], y: anchor[1], dx: 0, dy: 0, box: { left: anchor[0] - width / 2, right: anchor[0] + width / 2, top: anchor[1] - 15, bottom: anchor[1] + 6 } };
      occupied.push(selected.box);
      labels.set(code, { ...selected, anchor });
    });
    return { labels, occupied };
  }
  function mapPointLabelLayout(nodes, occupiedLabels = []) {
    const occupied = [...occupiedLabels];
    const layout = new Map();
    [...nodes].sort((a, b) => Number(b.map_status === "featured") - Number(a.map_status === "featured") || a.place_id.localeCompare(b.place_id)).forEach((item) => {
      const [x, y] = project([item.longitude, item.latitude]);
      const width = Math.max(42, item.name_zh.length * 13);
      const box = { left: x + 9, right: x + 9 + width, top: y - 13, bottom: y + 7 };
      const visible = item.map_status === "featured" && !occupied.some((o) => overlapsLabelBox(box, o));
      if (visible) occupied.push(box);
      layout.set(item.place_id, { x, y, visible });
    });
    return layout;
  }

  /* ---- 资格（与正式实现同规则；计数由此动态计算，不硬编码） ---- */
  function allowedMapRoles(filter) {
    return { author_geography: ["author_geography"], story_setting: ["story_setting"], all: ["author_geography", "story_setting"] }[filter] || [];
  }
  function eligiblePlaces(filter) {
    const roles = allowedMapRoles(filter);
    const relatedPlaceIds = new Set(D.map.relations.filter((r) => roles.includes(r.role)).map((r) => r.place));
    return publicPlaces().filter((p) => p.reality_status === "real" && p.place_kind !== "country" && p.latitude != null && isInsideMapWindow(p) && relatedPlaceIds.has(p.place_id));
  }
  function visibleRealMapPlaces(filter, activeCountry) {
    return eligiblePlaces(filter).filter((p) => !activeCountry || p.parent_place_id === activeCountry);
  }

  function displayNameOf(id) {
    return indexEntry(id)?.name || place(id)?.name_zh || "";
  }

  /* ---- 文学连接（面板数据；语义同 literaryConnectionsFor/countryLiteraryContext） ---- */
  /* 阶段三：全部条目接真实 public_route */
  function entryLink(id, name, kind) {
    return `<a href="${hrefOf(id)}"><strong>${esc(name)}</strong><span>${kind} →</span></a>`;
  }
  function literaryConnectionsFor(placeIds, includeWorkCreators = false) {
    const scope = new Set(placeIds);
    const rels = D.map.relations.filter((r) => scope.has(r.place));
    const authorIds = new Set(rels.filter((r) => entityType(r.src) === "author" && isPublic(r.src)).map((r) => r.src));
    const workIds = new Set(rels.filter((r) => entityType(r.src) === "work" && isPublic(r.src)).map((r) => r.src));
    if (includeWorkCreators) {
      workIds.forEach((wid) => {
        const aid = D.createdBy[wid];
        if (aid && isPublic(aid)) authorIds.add(aid);
      });
    }
    return { authors: [...authorIds], works: [...workIds] };
  }
  function countryLiteraryContext(countryId) {
    const allChildren = publicPlaces().filter((p) => p.parent_place_id === countryId && isPublic(p.place_id));
    const children = allChildren.filter((p) => p.reality_status === "real");
    return { allChildren, children, ...literaryConnectionsFor([countryId, ...allChildren.map((p) => p.place_id)]) };
  }

  /* ---- 状态与渲染 ---- */
  const state = { filter: "all", activeCountry: null, target: null };

  function esc(v) {
    return String(v ?? "").replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]));
  }

  function panelMarkup() {
    const t = state.target;
    if (!t) {
      return `<p class="panel-eyebrow">地图上的阅读入口</p>
        <h3>从一个地方开始</h3>
        <p class="desc">选择一个国家、现实地点或文学虚构空间，看看有哪些作家和作品从这里展开。</p>
        <div class="panel-prompt"><b>01</b><p>先点选地图，再沿文学关系继续阅读。</p></div>`;
    }
    const p = place(t.id);
    const fictional = t.type === "fictional_space";
    const isCountry = t.type === "country";
    const ctx = isCountry ? countryLiteraryContext(t.id) : { children: [], ...literaryConnectionsFor([t.id], fictional) };
    const label = isCountry ? "国家文学入口" : fictional ? "文学虚构空间" : "现实地点";
    const desc = isCountry
      ? `从${p.name_zh}的作家、作品与文学地点开始探索。`
      : fictional ? "这是一处由文学作品创造的空间。" : `从${p.name_zh}的作家、作品与文学地点开始探索。`;
    const links = (ids, kind) => ids.slice(0, 4).map((id) =>
      entryLink(id, displayNameOf(id), kind)).join("")
      || `<p>还没有可展示的相关${kind}。</p>`;
    return `<p class="panel-eyebrow">${label}</p>
      <h3>${esc(p.name_zh)}</h3>
      ${p.original_name ? `<p class="original">${esc(p.original_name)}</p>` : ""}
      <p class="desc">${esc(desc)}</p>
      <div class="panel-section"><h4>从这里认识作家</h4><div class="panel-links">${links(ctx.authors, "作家")}</div></div>
      <div class="panel-section"><h4>${fictional ? "它出现在哪些作品中" : "与这里相关的作品"}</h4><div class="panel-links">${links(ctx.works, "作品")}</div></div>
      ${ctx.children.length ? `<div class="panel-section"><h4>继续探索地点</h4><div class="panel-links">${ctx.children.slice(0, 5).map((c) => `<a href="index.html#literary-map" data-select-place="${esc(c.place_id)}"><strong>${esc(c.name_zh)}</strong><span>地点 →</span></a>`).join("")}</div></div>` : ""}
      <a class="panel-detail-link" href="${hrefOf(t.id)}">打开${esc(p.name_zh)}完整页面 →</a>`;
  }

  function mapSvgMarkup() {
    const countries = publicPlaces().filter((p) => p.place_kind === "country" && isPublic(p.place_id));
    const countryByCode = new Map(countries.map((p) => [p.country_code, p]));
    const featureByCode = new Map(GEO.features.map((f) => [f.properties.ISO_A2, f]));
    const countryLabelPositions = countryLabelLayout(countryByCode, featureByCode);
    const selectedCode = place(state.activeCountry)?.country_code;
    const shapes = GEO.features.map((f) => {
      const code = f.properties.ISO_A2;
      const country = countryByCode.get(code);
      const active = selectedCode === code;
      const title = country ? `<title>${esc(country.name_zh)}</title>` : "";
      return `<path d="${featurePath(f)}" class="country-shape ${country ? "l2-interactive" : "l1-only"} ${active ? "active" : ""}" data-feature-id="${esc(f.properties.FEATURE_ID)}" data-part-count="${f.properties.PART_IDS.length}" ${country ? `data-country-id="${esc(country.place_id)}" tabindex="0" role="button" aria-pressed="${active}" aria-label="探索${esc(country.name_zh)}文学"` : `aria-hidden="true"`}>${title}</path>`;
    }).join("");
    const countryLabels = [...countryByCode.entries()].map(([code, country]) => {
      const pos = countryLabelPositions.labels.get(code);
      if (!pos) return "";
      const leader = pos.dx || pos.dy ? `<line x1="${pos.anchor[0].toFixed(1)}" y1="${pos.anchor[1].toFixed(1)}" x2="${pos.x.toFixed(1)}" y2="${(pos.y - 4).toFixed(1)}"></line>` : "";
      return `<g class="country-label-group" aria-hidden="true">${leader}<text class="country-label" x="${pos.x.toFixed(1)}" y="${pos.y.toFixed(1)}" text-anchor="middle">${esc(country.name_zh)}</text></g>`;
    }).join("");
    const realNodes = visibleRealMapPlaces(state.filter, state.activeCountry);
    const pointLabels = mapPointLabelLayout(realNodes, countryLabelPositions.occupied);
    const points = realNodes.map((item) => {
      const { x, y, visible } = pointLabels.get(item.place_id);
      const active = state.target?.type === "place" && state.target.id === item.place_id;
      return `<g class="map-point ${active ? "active" : ""}" data-place-id="${esc(item.place_id)}" tabindex="0" role="button" aria-pressed="${active}" aria-label="查看${esc(item.name_zh)}的文学关联"><circle cx="${x.toFixed(1)}" cy="${y.toFixed(1)}" r="6"></circle>${visible ? `<text x="${(x + 10).toFixed(1)}" y="${(y + 4).toFixed(1)}">${esc(item.name_zh)}</text>` : ""}</g>`;
    }).join("");
    const fictionalNodes = publicPlaces().filter((p) => p.reality_status === "fictional" && isPublic(p.place_id));
    const ficBtns = fictionalNodes.map((item) => {
      const active = state.target?.type === "fictional_space" && state.target.id === item.place_id;
      return `<button type="button" class="fic-btn ${active ? "active" : ""}" data-fictional-id="${esc(item.place_id)}" aria-pressed="${active}"><i aria-hidden="true"></i>${esc(item.name_zh)}</button>`;
    }).join("");
    return {
      svg: `<svg viewBox="0 0 ${MAP_WIDTH} ${MAP_HEIGHT}" preserveAspectRatio="xMidYMid meet" data-projection="LAEA" data-projection-center="-75,-11.5" aria-labelledby="map-title map-desc" role="img"><title id="map-title">拉丁美洲文学地图</title><desc id="map-desc">以历史文化口径呈现拉丁美洲背景，并以兰伯特方位等积投影显示有公开文学内容的可交互国家与地点。灰色几何仅作中性地理背景，不表示已有文学内容。</desc><defs><filter id="map-handdrawn" x="-5%" y="-5%" width="110%" height="110%" color-interpolation-filters="sRGB"><feTurbulence type="fractalNoise" baseFrequency="0.018 0.045" numOctaves="2" seed="17" result="paperNoise"/><feDisplacementMap in="SourceGraphic" in2="paperNoise" scale="1.4" xChannelSelector="R" yChannelSelector="G"/></filter></defs><g data-map-layer="l1" class="handdrawn-landmass">${shapes}</g><g data-map-layer="l2-labels">${countryLabels}</g><g data-map-layer="literary-places">${points}</g></svg>`,
      ficInset: `<aside class="fictional-inset" aria-label="文学虚构空间"><p>写出来的地方</p><span>不使用现实坐标</span><div class="fic-list">${ficBtns}</div></aside>`,
    };
  }

  /* ---- 地点索引（桌面/手机同一组件；计数动态计算） ---- */
  function indexMarkup() {
    const eligible = eligiblePlaces(state.filter);
    const countries = publicPlaces().filter((p) => p.place_kind === "country" && isPublic(p.place_id));
    const countryById = new Map(countries.map((c) => [c.place_id, c]));
    const codeToCountry = new Map(countries.map((c) => [c.country_code, c]));
    const groups = new Map();
    for (const p of eligible) {
      const country = countryById.get(p.parent_place_id) || codeToCountry.get(p.country_code);
      const key = country ? country.place_id : "_none";
      if (!groups.has(key)) groups.set(key, { country, items: [] });
      groups.get(key).items.push(p);
    }
    const withPlaces = [...groups.values()].filter((g) => g.country).sort((a, b) => b.items.length - a.items.length || (a.country.name_zh.localeCompare(b.country.name_zh, "zh")));
    const covered = new Set(withPlaces.map((g) => g.country.place_id));
    const countryOnly = countries.filter((c) => !covered.has(c.place_id)).sort((a, b) => a.name_zh.localeCompare(b.name_zh, "zh"));
    const fictional = publicPlaces().filter((p) => p.reality_status === "fictional" && isPublic(p.place_id));
    const chip = (p) => `<button type="button" class="place-chip" data-index-place="${esc(p.place_id)}" aria-pressed="${state.target?.id === p.place_id}">${esc(p.name_zh)}</button>`;
    const groupHtml = withPlaces.map((g) => `<div class="index-group"><h4>${esc(g.country.name_zh)}<small>${g.items.length} 处</small></h4><div class="index-chips">${g.items.map(chip).join("")}</div></div>`).join("");
    const onlyHtml = countryOnly.length ? `<div class="index-group country-only"><h4>国家入口<small>当前筛选下暂无下属地点</small></h4><div class="index-chips">${countryOnly.map((c) => `<button type="button" class="place-chip country-chip" data-index-country="${esc(c.place_id)}">${esc(c.name_zh)}</button>`).join("")}</div></div>` : "";
    const ficHtml = fictional.length ? `<div class="index-group"><h4>写出来的地方<small>不使用现实坐标</small></h4><div class="index-chips">${fictional.map((f) => `<button type="button" class="place-chip fic-chip" data-index-fictional="${esc(f.place_id)}" aria-pressed="${state.target?.id === f.place_id}" style="border-color:rgba(24,60,75,.4)"><i aria-hidden="true" style="width:8px;height:8px;background:var(--navy);transform:rotate(45deg)"></i>${esc(f.name_zh)}</button>`).join("")}</div></div>` : "";
    return { count: eligible.length, countries: countries.length, body: groupHtml + onlyHtml + ficHtml };
  }

  /* ---- 渲染入口 ---- */
  let root, panelEl, indexEl, mapCanvas, resetBtn;

  function render(focusPanel = false) {
    const { svg, ficInset } = mapSvgMarkup();
    mapCanvas.innerHTML = svg + ficInset;
    panelEl.innerHTML = panelMarkup();
    const idx = indexMarkup();
    indexEl.querySelector(".index-body").innerHTML = idx.body;
    indexEl.querySelector(".index-count").textContent = `${idx.countries} 国 · ${idx.count} 处现实地点`;
    resetBtn.textContent = state.target ? "清除选择，返回完整地图" : "点击地图上的地点开始";
    document.querySelectorAll("[data-map-filter]").forEach((b) => {
      b.setAttribute("aria-pressed", String(state.filter === b.dataset.mapFilter));
    });
    bindMapEvents();
    if (focusPanel) {
      panelEl.focus({ preventScroll: true });
      if (window.matchMedia("(max-width: 900px)").matches) {
        panelEl.scrollIntoView({ behavior: "smooth", block: "nearest" });
      }
    }
  }

  function select(type, id, focusPanel = true) {
    state.target = { type, id };
    if (type === "country") state.activeCountry = id;
    else state.activeCountry = place(id)?.parent_place_id || null;   /* 语义同正式实现：无父级地点清空国家筛选，保证目标可见 */
    render(focusPanel);
  }

  function bindMapEvents() {
    mapCanvas.querySelectorAll("[data-country-id]").forEach((el) => {
      const act = () => select("country", el.dataset.countryId);
      el.addEventListener("click", act);
      el.addEventListener("keydown", (e) => { if (e.key === "Enter" || e.key === " ") { e.preventDefault(); act(); } });
    });
    mapCanvas.querySelectorAll("[data-place-id]").forEach((el) => {
      const act = () => select("place", el.dataset.placeId);
      el.addEventListener("click", (e) => { e.stopPropagation(); act(); });
      el.addEventListener("keydown", (e) => { if (e.key === "Enter" || e.key === " ") { e.preventDefault(); act(); } });
    });
    mapCanvas.querySelectorAll("[data-fictional-id]").forEach((el) => {
      el.addEventListener("click", () => select("fictional_space", el.dataset.fictionalId));
    });
  }

  function init(options) {
    root = options.root;
    panelEl = options.panel;
    mapCanvas = options.canvas;
    indexEl = options.index;
    resetBtn = options.reset;
    mapProjectionViewport = projectionViewport(GEO);

    document.querySelectorAll("[data-map-filter]").forEach((b) => {
      b.addEventListener("click", () => {
        state.filter = b.dataset.mapFilter;
        const stillVisible = state.target?.type !== "place" || visibleRealMapPlaces(state.filter, state.activeCountry).some((p) => p.place_id === state.target.id);
        if (!stillVisible) {
          const c = place(state.activeCountry);
          state.target = c?.place_kind === "country" && isPublic(c.place_id) ? { type: "country", id: c.place_id } : null;
        }
        render(!stillVisible);
      });
    });
    resetBtn.addEventListener("click", () => { state.activeCountry = null; state.target = null; render(); });
    indexEl.addEventListener("click", (e) => {
      const p = e.target.closest("[data-index-place]");
      const c = e.target.closest("[data-index-country]");
      const f = e.target.closest("[data-index-fictional]");
      if (p) { select("place", p.dataset.indexPlace); if (window.matchMedia("(max-width: 900px)").matches) indexEl.removeAttribute("open"); }
      if (c) { select("country", c.dataset.indexCountry); }
      if (f) { select("fictional_space", f.dataset.indexFictional); }
    });
    panelEl.addEventListener("click", (e) => {
      const inner = e.target.closest("[data-select-place]");
      if (inner) { e.preventDefault(); select("place", inner.dataset.selectPlace); }
    });

    const preset = new URLSearchParams(location.search).get("select");
    render();
    if (preset) {
      const c = D.map.places.find((p) => p.country_code === preset.toUpperCase() && p.place_kind === "country");
      if (c) select("country", c.place_id, false);
      else if (place(preset)) select(place(preset).reality_status === "fictional" ? "fictional_space" : "place", preset, false);
    }
  }

  window.__WCD11_MAP__ = { init, select, eligiblePlaces };
})();
