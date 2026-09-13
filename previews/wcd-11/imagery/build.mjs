/* ============================================================
   WCD-11 阶段三 · 静态路由壳生成器
   用法：node prototype/hifi/build.mjs（在仓库内任意目录均可）
   读取同目录 data.js（公开投影），按真实 public_route 生成
   当前脚本所在目录的 <route>index.html 壳（body data-route-* + 相对资源路径）。
   页面内容由 pages.js 在浏览器端渲染（与正式站点同构）。
   ============================================================ */
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const here = path.dirname(fileURLToPath(import.meta.url));

/* 载入 data.js（window shim） */
globalThis.window = {};
const code = fs.readFileSync(path.join(here, 'data.js'), 'utf8');
new Function(code)();
const D = window.__SITE_DATA;

const esc = (v) => String(v ?? '').replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));
const ent = (id) => D.entities.find((e) => e.id === id);
const desc = (s) => (s.description || s.intro || `${s.name} · 文学条目。`).slice(0, 110);

/* 路由清单 */
const routes = [];
for (const group of ['authors', 'works', 'anecdotes', 'search', 'timeline', 'about']) {
  routes.push({ route: `${group}/`, kind: group, id: null, title: { authors: '作家目录', works: '作品目录', anecdotes: '作家趣闻', search: '搜索', timeline: '文学时间线', about: '关于项目' }[group], description: { authors: '从不同国家、年代与写作传统中认识拉丁美洲文学作家。', works: '从故事、体裁与文学关联中选择下一本书。', anecdotes: '从人物故事进入作家的生活与写作。', search: '搜索作家、作品、国家、地点、文学空间、主题与文学运动。', timeline: '沿文学时期、作家与作品理解拉丁美洲文学的发展。', about: '从地点进入拉丁美洲文学。' }[group] });
}
for (const s of D.search) {
  let kind = s.type;
  if (s.type === 'collection') kind = 'work';
  if (['movement', 'theme', 'event', 'person', 'character', 'institution', 'adaptation', 'edition'].includes(s.type)) kind = 'node';
  routes.push({ route: s.route, kind, id: s.id, title: s.type === 'work' || s.type === 'collection' ? `《${s.name}》` : s.name, description: desc(s) });
}
for (const p of D.presentation.readingPaths) {
  routes.push({ route: `paths/${p.slug}/`, kind: 'path', slug: p.slug, id: null, title: p.title, description: (p.description || p.intro || '').slice(0, 110) });
}
routes.push({ route: '404.html', kind: 'not-found', id: null, title: '页面未找到', description: '这条文学路径尚未开放。' });

/* 壳模板 */
const navItems = [
  ['home', '地图', ''],
  ['authors', '作家', 'authors/'],
  ['works', '作品', 'works/'],
  ['anecdotes', '趣闻', 'anecdotes/'],
  ['timeline', '时间线', 'timeline/'],
  ['about', '关于项目', 'about/'],
  ['search', '搜索', 'search/'],
];
const genericNavItems = [
  ['home', '地图', ''],
  ['authors', '作家', 'authors/'],
  ['works', '作品', 'works/'],
  ['anecdotes', '趣闻', 'anecdotes/'],
  ['search', '搜索', 'search/'],
  ['timeline', '时间线', 'timeline/'],
  ['about', '关于项目', 'about/'],
];
const navKind = (kind) => ({ author: 'authors', work: 'works', collection: 'works', node: 'works', path: 'home', country: 'home', place: 'home', fictional_space: 'home', 'not-found': 'home' }[kind] || kind);
const isVisualMaster = (r) => ['authors', 'works', 'search', 'anecdotes', 'timeline', 'about', 'author', 'work'].includes(r.kind);

function shell(r) {
  const depth = r.route.endsWith('.html') ? r.route.split('/').length - 1 : r.route.split('/').filter(Boolean).length;
  const base = '../'.repeat(depth);
  const current = navKind(r.kind);
  const visualMaster = isVisualMaster(r);
  const nav = (visualMaster ? navItems : genericNavItems).map(([k, label, href]) => {
    if (!visualMaster) return `<a ${k === current ? 'aria-current="page"' : ''} href="${base}${href}">${label}</a>`;
    const english = { home: 'Map', authors: 'Authors', works: 'Works', anecdotes: 'Anecdotes', timeline: 'Timeline', about: 'About' }[k];
    const body = k === 'search' ? `<i aria-hidden="true"></i><span>${label}</span>` : `<span>${label}</span><small>${english}</small>`;
    return `<a class="${k === 'search' ? 'nav-search' : ''}" ${k === current ? 'aria-current="page"' : ''} href="${base}${href}">${body}</a>`;
  }).join('\n      ');
  const brand = visualMaster
    ? `<span class="brand-mark">LATAM</span>
      <span class="brand-sep" aria-hidden="true"></span>
      <span class="brand-title"><span class="brand-name">拉丁美洲文学地图</span><span class="brand-en">Latin American Literature Map</span></span>`
    : `<span class="brand-mark">LATAM</span>
      <span class="brand-name">拉丁美洲文学地图</span>
      <span class="brand-sep" aria-hidden="true"></span>
      <span class="brand-en">A Literary Atlas</span>`;
  const favicon = visualMaster ? `<link rel="icon" href="${base}assets/backgrounds/literary-postage-stamp-v1.webp" />\n` : '';
  const masterStyle = visualMaster ? `\n<link rel="stylesheet" href="${base}../styles/master.css" />` : '';
  const masterScript = visualMaster ? `\n<script src="${base}master-pages.js"></script>` : '';
  return `<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="${esc(r.description)}" />
<title>${esc(r.title)}｜拉丁美洲文学地图</title>
${favicon}<link rel="stylesheet" href="${base}../tokens.css" />
<link rel="stylesheet" href="${base}site.css" />${masterStyle}
</head>
<body>
<a class="skip-link" href="#app">跳到主要内容</a>
<div class="page">
  <header class="masthead">
    <a class="brand" href="${base}" aria-label="LATAM 拉丁美洲文学地图 · 回到首页">
      ${brand}
    </a>
    <nav id="main-nav" class="main-nav" aria-label="主要导航">
      ${nav}
    </nav>
    <button type="button" class="menu-toggle" id="menu-toggle" aria-expanded="false" aria-controls="main-nav">菜单</button>
  </header>
  <main id="app" tabindex="-1">
    <div class="loading-state" style="min-height:50vh;display:grid;place-items:center;color:var(--muted);font-size:14px">正在打开文学地图……</div>
  </main>
  <aside class="final-archive-quote" aria-label="拉丁美洲文学档案引言">
    <blockquote>
      <span>“Porque América Latina también se lee.”</span>
      <small>— 因为拉丁美洲，也在被阅读。</small>
    </blockquote>
    <p class="archive-keywords">LITERATURA<br />MEMORIA<br />TERRITORIO<br />FUTURO</p>
  </aside>
  <footer class="site-footer">
    <div><b>A literary map of Latin America</b><br />从地点进入文学，从作品继续阅读 · <a href="${base}about/">关于这张地图</a></div>
    <div>底图几何：Natural Earth（公有领域）· 坐标：GeoNames<br />© 拉丁美洲文学地图 · <a href="${base}about/">来源与依据</a></div>
  </footer>
</div>
<script>window.__SITE_BASE__ = ${JSON.stringify(base)};</script>
<script>window.__ROUTE__ = ${JSON.stringify({ kind: r.kind, id: r.id, slug: r.slug })};</script>
<script src="${base}data.js"></script>
<script src="${base}ui.js"></script>${masterScript}
<script src="${base}pages.js"></script>
<script>
  window.__WCD11_UI__.initMenu();
</script>
</body>
</html>
`;
}

let count = 0;
const manifest = [];
for (const r of routes) {
  const file = r.route.endsWith('.html')
    ? path.join(here, r.route)
    : path.join(here, r.route, 'index.html');
  fs.mkdirSync(path.dirname(file), { recursive: true });
  fs.writeFileSync(file, shell(r));
  manifest.push({ route: r.route, kind: r.kind, id: r.id });
  count++;
}
fs.writeFileSync(path.join(here, 'route-manifest.json'), JSON.stringify(manifest, null, 1));
console.log(`generated ${count} route shells → ${here} (+ route-manifest.json)`);
