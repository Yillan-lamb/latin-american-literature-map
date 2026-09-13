/* ============================================================
   WCD-11 阶段二 · 共享交互（两页统一）
   1) 原型范围提示（未实现目标的不可用状态，替代假链接）
   2) 移动菜单（Esc 关闭、焦点返回）
   3) 搜索浮层（打开聚焦输入；Tab/Shift+Tab 圈禁在层内；背景 inert；
      Esc/遮罩关闭并还焦触发器）
   4) 阅读字号（默认关闭；用户触发后将普通文本的实际计算字号放大 2×）
   ============================================================ */
(function () {
  "use strict";

  const D = window.__SITE_DATA;
  const esc = (v) => String(v ?? "").replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]));
  const typeLabel = { author: "作家", work: "作品", place: "地点", country: "国家", fictional_space: "文学空间", collection: "作品集", movement: "文学运动", theme: "主题", event: "历史背景", person: "人物", character: "人物", institution: "机构", adaptation: "影视改编", edition: "版本" };
  const BASE = () => window.__SITE_BASE__ || "";

  /* ---------- 1) 范围提示 toast ---------- */
  let toast, toastTimer = null, toastTrigger = null;
  function ensureToast() {
    if (toast) return;
    toast = document.createElement("div");
    toast.className = "scope-toast";
    toast.setAttribute("role", "status");
    toast.setAttribute("aria-live", "polite");
    toast.hidden = true;
    toast.innerHTML = `<span>此内容页未包含在当前原型中。<small>当前原型范围：首页 · 作家档案（加西亚·马尔克斯）</small></span><button type="button">知道了</button>`;
    document.body.appendChild(toast);
    toast.querySelector("button").addEventListener("click", hideToast);
    document.addEventListener("keydown", (e) => { if (e.key === "Escape" && !toast.hidden) hideToast(); });
  }
  function showToast(triggerEl) {
    ensureToast();
    toastTrigger = triggerEl || null;
    toast.hidden = false;
    clearTimeout(toastTimer);
    toastTimer = setTimeout(hideToast, 3200);
  }
  function hideToast() {
    if (!toast || toast.hidden) return;
    toast.hidden = true;
    clearTimeout(toastTimer);
    toastTrigger?.focus?.();
    toastTrigger = null;
  }
  /* 一处委托：所有 [data-scope] 点击即提示，不做跳转 */
  document.addEventListener("click", (e) => {
    const el = e.target.closest("[data-scope]");
    if (el) { e.preventDefault(); showToast(el); }
  });

  /* ---------- 2) 移动菜单 ---------- */
  function normalizeFileRouteLinks() {
    if (window.location.protocol !== "file:") return;
    document.querySelectorAll("a[href]").forEach((link) => {
      const raw = link.getAttribute("href");
      if (!raw || raw.startsWith("#") || /^(?:https?:|mailto:|tel:)/i.test(raw)) return;
      const target = new URL(raw, window.location.href);
      if (target.protocol === "file:" && target.pathname.endsWith("/")) {
        target.pathname += "index.html";
        link.href = target.href;
      }
    });
  }

  function initMenu() {
    normalizeFileRouteLinks();
    const nav = document.getElementById("main-nav");
    const btn = document.getElementById("menu-toggle");
    if (!nav || !btn) return;
    btn.addEventListener("click", () => {
      const open = nav.classList.toggle("open");
      btn.setAttribute("aria-expanded", String(open));
      if (open) nav.querySelector("a, button")?.focus();
    });
    nav.addEventListener("click", (e) => {
      if (e.target.closest("a") || e.target.closest("[data-scope]")) {
        nav.classList.remove("open");
        btn.setAttribute("aria-expanded", "false");
      }
    });
    document.addEventListener("keydown", (e) => {
      if (e.key === "Escape" && nav.classList.contains("open")) {
        nav.classList.remove("open");
        btn.setAttribute("aria-expanded", "false");
        btn.focus();
      }
    });
  }

  /* ---------- 3) 搜索浮层（焦点圈禁 + 背景 inert） ---------- */
  const layer = () => document.getElementById("search-layer");
  const pageEl = () => document.querySelector(".page");

  function focusablesIn(root) {
    return [...root.querySelectorAll("a[href], button:not([disabled]), input, [tabindex]:not([tabindex='-1'])")];
  }
  function trapTab(e, root) {
    const items = focusablesIn(root);
    if (!items.length) return;
    const first = items[0];
    const last = items[items.length - 1];
    const active = document.activeElement;
    if (e.shiftKey) {
      if (active === first || !root.contains(active)) { e.preventDefault(); last.focus(); }
    } else if (active === last || !root.contains(active)) {
      e.preventDefault(); first.focus();
    }
  }

  function renderResults(q) {
    const results = document.getElementById("search-results");
    const n = q.trim().toLowerCase();
    const hits = (n
      ? D.search.filter((s) => (s.name + " " + (s.original || "")).toLowerCase().includes(n))
      : D.search).slice(0, 24);
    results.innerHTML = hits.length ? hits.map((s) => {
      const label = `${typeLabel[s.type] || "文学关联"}${s.original ? " · " + esc(s.original) : ""}`;
      const shown = (s.type === "work" || s.type === "collection") ? `《${esc(s.name)}》` : esc(s.name);
      return `<a class="search-item" href="${BASE()}${esc(s.route)}"><strong>${shown}</strong><small>${label}</small></a>`;
    }).join("") : `<p class="search-empty">没有找到匹配项。可以换一个中文名、原文名或地点名。</p>`;
  }

  function initSearch() {
    const ly = layer();
    if (!ly) return;
    const input = document.getElementById("search-input");
    const openers = [...document.querySelectorAll("#search-open, #search-open-m")];
    const backdrop = ly.querySelector("[data-close]");
    let lastFocus = null;

    function open() {
      lastFocus = document.activeElement;
      ly.classList.add("open");
      pageEl().inert = true;                       /* 背景不可操作 */
      input.value = "";
      renderResults("");
      input.focus();
    }
    function close() {
      ly.classList.remove("open");
      pageEl().inert = false;
      lastFocus?.focus?.();
    }
    openers.forEach((b) => b.addEventListener("click", open));
    backdrop.addEventListener("click", close);
    document.getElementById("search-go").addEventListener("click", () => renderResults(input.value));
    input.addEventListener("input", () => renderResults(input.value));
    ly.addEventListener("keydown", (e) => {
      if (e.key === "Escape") { e.stopPropagation(); close(); }
      if (e.key === "Tab") trapTab(e, ly);
    });
    /* 点击真实结果后正常跳转；点击不可用项由全局 [data-scope] 委托提示，此处负责收层还焦 */
    ly.addEventListener("click", (e) => {
      if (e.target.closest("[data-scope]")) setTimeout(close, 60);
    });
  }

  /* ---------- 4) 阅读字号（真实页面文字放大） ----------
     该控制只在用户主动点击后生效，默认不改变原型的视觉基线。
     用当前页面的计算字号作为基线，再写回 2× 的 px 值，因此包含
     clamp 标题、媒体查询字号和动态渲染内容；SVG 地图文字保留其
     坐标系统，由同一页面的地点索引和阅读面板提供可放大的文字入口。
  */
  const TEXT_SCALE_KEY = "wcd11-reading-scale";
  let readingScale = 1, fontOverrides = new Map(), fontObserver, fontTimer;
  function applyTextScale(scale) {
    fontObserver?.disconnect();
    readingScale = scale;
    // Restore the stylesheet baseline before measuring: newly inserted children
    // must not inherit an already doubled parent, and resize must re-evaluate clamp.
    for (const [el, original] of fontOverrides) {
      if (original.value) el.style.setProperty("font-size", original.value, original.priority);
      else el.style.removeProperty("font-size");
    }
    fontOverrides.clear();
    document.documentElement.dataset.textScale = "1";
    const button = document.getElementById("text-size-toggle");
    if (button) {
      button.textContent = scale === 2 ? "恢复字号" : "放大文字";
      button.setAttribute("aria-pressed", String(scale === 2));
      button.setAttribute("aria-label", scale === 2 ? "恢复字号" : "放大文字");
    }
    if (scale === 2) {
      const measured = [...document.body.querySelectorAll("*")]
        .filter(el => el instanceof HTMLElement && !el.closest("svg") &&
          !["SCRIPT", "STYLE", "LINK", "META"].includes(el.tagName))
        .map(el => ({el, size: parseFloat(getComputedStyle(el).fontSize),
          value: el.style.getPropertyValue("font-size"), priority: el.style.getPropertyPriority("font-size")}));
      document.documentElement.dataset.textScale = "2";
      for (const {el, size, value, priority} of measured) {
        if (!Number.isFinite(size)) continue;
        fontOverrides.set(el, {value, priority});
        el.style.setProperty("font-size", `${size * 2}px`);
      }
    }
    fontObserver?.observe(document.body, {childList: true, subtree: true});
  }
  function scheduleTextScale() {
    if (readingScale !== 2) return;
    clearTimeout(fontTimer);
    fontTimer = setTimeout(() => applyTextScale(2), 30);
  }
  function initTextZoom() {
    const masthead = document.querySelector(".masthead");
    if (!masthead || document.getElementById("text-size-toggle")) return;
    const button = document.createElement("button");
    button.type = "button";
    button.id = "text-size-toggle";
    button.className = "text-size-toggle";
    masthead.appendChild(button);
    button.addEventListener("click", () => {
      clearTimeout(fontTimer);
      const next = readingScale === 2 ? 1 : 2;
      try { localStorage.setItem(TEXT_SCALE_KEY, String(next)); } catch (_) {}
      applyTextScale(next);
    });
    try { readingScale = localStorage.getItem(TEXT_SCALE_KEY) === "2" ? 2 : 1; } catch (_) {}
    fontObserver = new MutationObserver(scheduleTextScale);
    applyTextScale(readingScale);
    window.addEventListener("resize", scheduleTextScale);
  }

  /* 2026-09-10 USER 指示：刊头不再注入「放大文字」按钮（S3 机制代码保留，复审时重定验收口径） */
  window.__WCD11_UI__ = { initMenu, initSearch, initTextZoom, showToast };
})();
