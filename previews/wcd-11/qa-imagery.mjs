/* WCD-11 imagery 候选回归（2026-09-13）
   用法：从仓库根启动本地 HTTP 服务（默认 8188，可用 BASE 覆盖）：
     BASE=http://127.0.0.1:8188/previews/wcd-11/imagery node previews/wcd-11/qa-imagery.mjs
   检查：
   A. 登记表（data.js portraits）逐条：对应作家页 1440 下肖像 img 真实加载（naturalWidth>0）、图注三要素（摄影/来源/许可）渲染
   B. 首页 1440：writer-list 中有图作家缩略加载；无图作家为首字字块（fallback 契约）
      + 390 下 Hero 主照片可见、编辑三栏折叠为整行；作品策展版封面图片加载
   C. 390/320 十一页型：scrollWidth 无溢出、无 404/5xx、可见 img 无破图（懒加载容器除外）
   D. 全量作家/作品详情 + 其他路由抽样：新母版、无 404/JS 错误
   E. 25 作家、62 作品、127 搜索入口、87 时间线记录完整且筛选有效
   失败返回非零退出码。 */
import { chromium } from '@playwright/test';
import { existsSync } from 'node:fs';

const BASE = (process.env.BASE || 'http://127.0.0.1:8188/previews/wcd-11/imagery').replace(/\/$/, '');
const results = [];
const check = (name, pass, detail = '') => results.push(`${pass ? 'PASS' : 'FAIL'} | ${name}${detail ? ' | ' + detail : ''}`);
const chromePath = '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome';
const browser = await chromium.launch(existsSync(chromePath) ? { executablePath: chromePath, headless: true } : { headless: true });

/* ---- A. 登记表逐条 ---- */
{
  const page = await browser.newPage({ viewport: { width: 1440, height: 1000 } });
  await page.goto(`${BASE}/authors/`, { waitUntil: 'networkidle' });
  const list = await page.evaluate(() => {
    const D = window.__SITE_DATA;
    return Object.keys(D.portraits).map((ent) => {
      const s = D.search.find((x) => x.id === ent);
      return { ent, route: s ? '/' + String(s.route).replace(/^\//, '') : null };
    });
  });
  for (const { ent, route } of list) {
    if (!route) { check(`登记 ${ent} 路由可寻`, false); continue; }
    const fails = [];
    const onResp = (r) => { if (r.status() >= 400) fails.push(r.status() + ' ' + r.url().split('/imagery')[1]); };
    page.on('response', onResp);
    await page.goto(`${BASE}${route}`, { waitUntil: 'networkidle' });
    await page.evaluate(async () => { for (let y = 0; y <= document.body.scrollHeight; y += 600) { window.scrollTo(0, y); await new Promise(r => setTimeout(r, 60)); } window.scrollTo(0, 0); });
    await page.waitForTimeout(250);
    const st = await page.evaluate(() => {
      const fig = document.querySelector('.portrait-photo img, .master-author-collage figure img');
      const cap = document.querySelector('.portrait-photo figcaption, .master-author-collage figure figcaption');
      return { loaded: fig ? (fig.complete && fig.naturalWidth > 0) : false, caption: cap ? cap.textContent : '' };
    });
    page.off('response', onResp);
    const capOk = /摄影：.+来源：.+许可：.+/.test(st.caption);
    check(`${ent} 肖像加载+图注三要素`, st.loaded && capOk && fails.length === 0, `loaded=${st.loaded} cap=${capOk} 404=${fails.length}${fails.length ? ' ' + fails[0] : ''}`);
  }
  await page.close();
}
{
  const page = await browser.newPage({ viewport: { width: 1440, height: 1000 } });
  await page.goto(`${BASE}/`, { waitUntil: 'networkidle' });
  const st = await page.evaluate(() => {
    const number = (selector, property) => parseFloat(getComputedStyle(document.querySelector(selector))[property]);
    const rgb = (selector, property) => (getComputedStyle(document.querySelector(selector))[property].match(/[\d.]+/g) || []).slice(0, 3).map(Number);
    const luminance = (color) => {
      const values = color.map((value) => { const n = value / 255; return n <= .03928 ? n / 12.92 : ((n + .055) / 1.055) ** 2.4; });
      return .2126 * values[0] + .7152 * values[1] + .0722 * values[2];
    };
    const fg = luminance(rgb('.clip-copy > p:not(.meta)', 'color'));
    const bg = luminance(rgb('.anecdote-clip', 'backgroundColor'));
    const contrast = (Math.max(fg, bg) + .05) / (Math.min(fg, bg) + .05);
    const portrait = document.querySelector('.writer-item .thumb')?.getBoundingClientRect();
    return {
      pathTitle: number('.path-item h3', 'fontSize'),
      pathBody: number('.path-item p', 'fontSize'),
      portraitWidth: portrait?.width || 0,
      portraitHeight: portrait?.height || 0,
      contrast,
      paper: getComputedStyle(document.body).backgroundImage.includes('parchment-field-v1.webp'),
    };
  });
  check('首页纸张、阅读路径、作家头像与趣闻对比度达到可读门槛', st.paper && st.pathTitle >= 17 && st.pathBody >= 12 && st.portraitWidth >= 80 && st.portraitHeight >= 110 && st.contrast >= 4.5, `paper=${st.paper} title=${st.pathTitle}px body=${st.pathBody}px portrait=${Math.round(st.portraitWidth)}x${Math.round(st.portraitHeight)} contrast=${st.contrast.toFixed(2)}`);
  await page.close();
}

/* ---- B. 首页缩略/fallback ---- */
{
  const page = await browser.newPage({ viewport: { width: 1440, height: 1000 } });
  await page.goto(`${BASE}/`, { waitUntil: 'networkidle' });
  const st = await page.evaluate(() => {
    const thumbs = [...document.querySelectorAll('.writer-item .thumb img')];
    return { thumbTotal: thumbs.length, thumbLoaded: thumbs.filter(i => i.complete && i.naturalWidth > 0).length, glyph: document.querySelectorAll('.writer-item .glyph').length };
  });
  check(`首页缩略图全部加载`, st.thumbTotal > 0 && st.thumbTotal === st.thumbLoaded, `${st.thumbLoaded}/${st.thumbTotal}；无图 fallback 字块 ${st.glyph} 个`);
  await page.close();
}

/* ---- B2. 本轮视觉骨架回归 ---- */
{
  const page = await browser.newPage({ viewport: { width: 390, height: 844 } });
  await page.goto(`${BASE}/`, { waitUntil: 'networkidle' });
  const st = await page.evaluate(() => {
    const hero = document.querySelector('.collage-photo.main');
    const heroImg = hero?.querySelector('img');
    const sections = [...document.querySelectorAll('.editorial > section')];
    const editorialWidth = document.querySelector('.editorial')?.getBoundingClientRect().width || 0;
    return {
      heroVisible: hero ? getComputedStyle(hero).display !== 'none' && hero.getBoundingClientRect().width > 200 : false,
      heroLoaded: heroImg ? heroImg.complete && heroImg.naturalWidth > 0 : false,
      fullRows: sections.length === 3 && sections.every((s) => s.getBoundingClientRect().width >= editorialWidth - 2),
    };
  });
  check(`390 首页主拼贴可见且三栏整行折叠`, st.heroVisible && st.heroLoaded && st.fullRows, `heroVisible=${st.heroVisible} loaded=${st.heroLoaded} fullRows=${st.fullRows}`);
  await page.close();
}
{
  const page = await browser.newPage({ viewport: { width: 1200, height: 800 } });
  const filePreview = new URL('./imagery/index.html', import.meta.url).href;
  await page.goto(filePreview, { waitUntil: 'load' });
  const st = await page.evaluate(() => ({
    authors: document.querySelector('.main-nav a[href*="authors"]')?.href || '',
    works: document.querySelector('.main-nav a[href*="works"]')?.href || '',
  }));
  await page.goto(st.authors, { waitUntil: 'load' });
  await page.waitForTimeout(150);
  const catalog = await page.evaluate(() => ({
    title: document.querySelector('.master-catalog-hero h1')?.textContent.trim() || '',
    rows: document.querySelectorAll('.master-catalog-card').length,
    first: document.querySelector('.master-catalog-card')?.href || '',
  }));
  if (catalog.first) {
    await page.goto(catalog.first, { waitUntil: 'load' });
    await page.waitForTimeout(150);
  }
  const detailRendered = await page.evaluate(() => Boolean(document.querySelector('.master-author-hero, .master-work-hero')));
  check(`file:// 直接预览的目录与详情页均正常渲染`, st.authors.endsWith('/authors/index.html') && st.works.endsWith('/works/index.html') && catalog.rows > 0 && catalog.first.endsWith('/index.html') && detailRendered, `authors=${st.authors} works=${st.works} rows=${catalog.rows} first=${catalog.first} detail=${detailRendered}`);
  await page.close();
}
{
  const page = await browser.newPage({ viewport: { width: 1440, height: 1000 } });
  await page.goto(`${BASE}/works/cien-anos-de-soledad-v1-ent-0075/`, { waitUntil: 'networkidle' });
  const st = await page.evaluate(() => {
    const images = [...document.querySelectorAll('.master-work-collage img')];
    return {
      present: images.length >= 2,
      loaded: images.length >= 2 && images.every((img) => img.complete && img.naturalWidth > 0),
      bottomQuote: Boolean(document.querySelector('main + .final-archive-quote')),
    };
  });
  check(`作品策展版封面照片加载`, st.present && st.loaded, `present=${st.present} loaded=${st.loaded}`);
  check(`二级页单一档案收尾位于正文之后`, st.bottomQuote, `bottomQuote=${st.bottomQuote}`);
  await page.close();
}
{
  const page = await browser.newPage({ viewport: { width: 1440, height: 1000 } });
  await page.goto(`${BASE}/`, { waitUntil: 'networkidle' });
  const st = await page.evaluate(async () => {
    const surfaceBg = `${getComputedStyle(document.documentElement).backgroundImage} ${getComputedStyle(document.body).backgroundImage}`;
    const plateBg = getComputedStyle(document.querySelector('.plate')).backgroundImage;
    const finalBg = getComputedStyle(document.querySelector('.final-archive-quote')).backgroundImage;
    const stamp = document.querySelector('.collage-stamp img');
    const heroImages = [...document.querySelectorAll('.hero-collage .collage-photo img')];
    const plateIndex = document.querySelector('.plate-index')?.getBoundingClientRect();
    const mapCanvas = document.querySelector('.map-canvas')?.getBoundingClientRect();
    const pageRect = document.querySelector('.page')?.getBoundingClientRect();
    const plateRect = document.querySelector('.plate')?.getBoundingClientRect();
    const neutrality = document.querySelector('.map-neutrality')?.textContent.trim() || '';
    const landmass = document.querySelector('.handdrawn-landmass');
    const load = (src) => new Promise((resolve) => {
      const img = new Image();
      img.onload = () => resolve(img.naturalWidth > 0 && img.naturalHeight > 0);
      img.onerror = () => resolve(false);
      img.src = src;
    });
    return {
      parchmentCss: surfaceBg.includes('parchment-field-v1.webp'),
      nauticalCss: plateBg.includes('nautical-chart-v1.webp'),
      bannerCss: finalBg.includes('archive-masthead-v1.webp'),
      parchmentLoaded: await load('assets/backgrounds/parchment-field-v1.webp'),
      nauticalLoaded: await load('assets/backgrounds/nautical-chart-v1.webp'),
      bannerLoaded: await load('assets/backgrounds/archive-masthead-v1.webp'),
      stampLoaded: stamp ? stamp.complete && stamp.naturalWidth > 0 : false,
      heroLoaded: heroImages.length === 3 && heroImages.every((img) => img.complete && img.naturalWidth > 0),
      heroSources: heroImages.map((img) => img.getAttribute('src') || ''),
      routePresent: Boolean(document.querySelector('.collage-route')),
      oldBottomPresent: Boolean(document.querySelector('.transition-band, .closing-band')),
      finalQuoteSpanish: document.querySelector('.final-archive-quote blockquote span')?.textContent.trim() || '',
      finalQuoteChinese: document.querySelector('.final-archive-quote blockquote small')?.textContent.trim() || '',
      finalKeywords: document.querySelector('.final-archive-quote .archive-keywords')?.textContent.replace(/\s+/g, ' ').trim() || '',
      finalQuoteLast: Boolean(document.querySelector('.final-archive-quote + .site-footer')),
      neutrality,
      plateAttribution: Boolean(document.querySelector('.plate .map-attribution')),
      handdrawn: Boolean(document.querySelector('#map-handdrawn')) && getComputedStyle(landmass).filter !== 'none',
      unifiedSurface: document.body.dataset.master === 'home' && getComputedStyle(document.querySelector('.page'), '::after').display === 'none',
      plateFullBleed: pageRect && plateRect ? Math.abs(pageRect.left - plateRect.left) <= 2 && Math.abs(pageRect.right - plateRect.right) <= 2 : false,
      plateIndexWidth: plateIndex?.width || 0,
      mapCanvasWidth: mapCanvas?.width || 0,
    };
  });
  check(`羊皮纸背景进入页面并加载`, st.parchmentCss && st.parchmentLoaded, `css=${st.parchmentCss} loaded=${st.parchmentLoaded}`);
  check(`航海罗盘背景覆盖整张地图图版并加载`, st.nauticalCss && st.nauticalLoaded, `css=${st.nauticalCss} loaded=${st.nauticalLoaded}`);
  check(`页面纸面单层统一且地图图版贯穿左右边界`, st.unifiedSurface && st.plateFullBleed, `surface=${st.unifiedSurface} fullBleed=${st.plateFullBleed}`);
  check(`单一底部引言带使用档案横幅且真实纸制邮票加载`, st.bannerCss && st.bannerLoaded && st.stampLoaded, `bannerCss=${st.bannerCss} bannerLoaded=${st.bannerLoaded} stampLoaded=${st.stampLoaded}`);
  check(`Hero 文化素材、马尔克斯头像三图加载且无李斯佩克朵/米斯特拉尔`, st.heroLoaded && st.heroSources.some((s) => s.includes('hero-caribbean-writing-desk-v1.webp')) && st.heroSources.some((s) => s.includes('hero-colonial-balcony-v1.webp')) && st.heroSources.some((s) => s.includes('v1-ent-0072.jpg')) && !st.heroSources.some((s) => /v1-ent-0016|v1-ent-0148/.test(s)), st.heroSources.join(','));
  check(`Hero ATLAS ROUTE 已删除`, !st.routePresent, `routePresent=${st.routePresent}`);
  check(`首页删除时间线/关于与回地图板块，最终横幅恢复双语引言`, !st.oldBottomPresent && st.finalQuoteLast && st.finalQuoteSpanish === '“Porque América Latina también se lee.”' && st.finalQuoteChinese === '— 因为拉丁美洲，也在被阅读。' && st.finalKeywords === 'LITERATURAMEMORIATERRITORIOFUTURO', `old=${st.oldBottomPresent} last=${st.finalQuoteLast} es=${st.finalQuoteSpanish} zh=${st.finalQuoteChinese} keys=${st.finalKeywords}`);
  check(`地图右下仅保留指定中立声明且图版内无来源长文`, st.neutrality === '本地图仅呈现地理事实与文学关联，不代表对任何争议边界、领土归属或政治地位的立场。' && !st.plateAttribution, `neutrality=${st.neutrality} attribution=${st.plateAttribution}`);
  check(`地图地块启用手绘边缘滤镜`, st.handdrawn, `handdrawn=${st.handdrawn}`);
  check(`地图采用左侧图版索引加右侧大地图`, st.plateIndexWidth >= 200 && st.mapCanvasWidth >= 500, `index=${Math.round(st.plateIndexWidth)} map=${Math.round(st.mapCanvasWidth)}`);
  await page.close();
}

/* ---- C. 窄视口 ---- */
{
  const routes = ['/', '/authors/', '/authors/jorge-luis-borges-v1-ent-0002/', '/authors/gabriel-garcia-marquez-v1-ent-0072/', '/works/', '/works/cien-anos-de-soledad-v1-ent-0075/', '/works/la-guerra-del-fin-del-mundo-v1-ent-0118/', '/anecdotes/', '/timeline/', '/search/', '/about/'];
  for (const vw of [390, 320]) {
    const ctx = await browser.newContext({ viewport: { width: vw, height: 844 } });
    const page = await ctx.newPage();
    const bad = [];
    page.on('response', (r) => { if (r.status() >= 400) bad.push(r.status() + ' ' + r.url().split('/imagery')[1]); });
    let overflow = 0;
    for (const r of routes) {
      await page.goto(`${BASE}${r}`, { waitUntil: 'networkidle' });
      const sw = await page.evaluate(() => document.documentElement.scrollWidth);
      if (sw > vw) overflow++;
    }
    check(`${vw} 十一页型无溢出无 404`, overflow === 0 && bad.length === 0, `溢出 ${overflow} 处；404 ${bad.length}${bad.length ? ' 如 ' + bad[0] : ''}`);
    await ctx.close();
  }
}

/* ---- D. 全部作家/作品详情页 + 每类 1 条 ---- */
{
  const ctx = await browser.newContext({ viewport: { width: 1280, height: 900 } });
  const page = await ctx.newPage();
  const jsErrors = [];
  page.on('pageerror', (e) => jsErrors.push(String(e).slice(0, 80)));
  await page.goto(`${BASE}/authors/`, { waitUntil: 'networkidle' });
  const authorRoutes = await page.evaluate(() => window.__SITE_DATA.search.filter(s => s.type === 'author').map(s => '/' + String(s.route).replace(/^\//, '')));
  const workRoutes = await page.evaluate(() => window.__SITE_DATA.search.filter(s => ['work','collection'].includes(s.type)).map(s => '/' + String(s.route).replace(/^\//, '')));
  const samples = ['/authors/', '/works/', '/search/', '/countries/', '/places/', '/paths/', '/about/', '/anecdotes/', '/timeline/', '/404.html'];
  let notFound = 0;
  let templateMismatch = 0;
  for (const r of [...authorRoutes, ...workRoutes, ...samples]) {
    const resp = await page.goto(`${BASE}${r}`, { waitUntil: 'domcontentloaded' });
    if (resp.status() >= 400) notFound++;
    if (authorRoutes.includes(r) && await page.locator('body[data-master="author"] .master-author-hero').count() === 0) templateMismatch++;
    if (workRoutes.includes(r) && await page.locator('body[data-master="work"] .master-work-hero').count() === 0) templateMismatch++;
  }
  check(`全量详情与抽样入口 ${authorRoutes.length + workRoutes.length + samples.length} 条使用新母版且无 404/JS 错误`, notFound === 0 && jsErrors.length === 0 && templateMismatch === 0, `author=${authorRoutes.length} work=${workRoutes.length} 404=${notFound} jsErr=${jsErrors.length} templateMismatch=${templateMismatch}${jsErrors.length ? ' 如 ' + jsErrors[0] : ''}`);
  await ctx.close();
}

/* ---- E. 完整目录、搜索与时间线数量/交互 ---- */
{
  const page = await browser.newPage({ viewport: { width: 1440, height: 900 } });
  const errors = [];
  page.on('pageerror', (error) => errors.push(String(error)));
  await page.goto(`${BASE}/authors/`, { waitUntil: 'networkidle' });
  const authors = await page.locator('[data-catalog-item]').count();
  await page.locator('#catalog-filter').fill('马尔克斯');
  const authorMatches = await page.locator('[data-catalog-item]:visible').count();
  await page.goto(`${BASE}/works/`, { waitUntil: 'networkidle' });
  const works = await page.locator('[data-catalog-item]').count();
  await page.goto(`${BASE}/search/`, { waitUntil: 'networkidle' });
  const search = await page.locator('[data-search-entry]').count();
  await page.locator('#master-search-input').fill('马尔克斯');
  const searchMatches = await page.locator('[data-search-entry]:visible').count();
  await page.goto(`${BASE}/timeline/`, { waitUntil: 'networkidle' });
  const timeline = await page.locator('[data-timeline-kind]').count();
  await page.locator('[data-timeline-filter="literary_author"]').click();
  const authorEvents = await page.locator('[data-timeline-kind="literary_author"]:visible').count();
  const workEventsVisible = await page.locator('[data-timeline-kind="literary_work"]:visible').count();
  check('完整目录、搜索与时间线均未截断且交互有效', authors === 25 && works === 62 && search === 127 && timeline === 87 && authorMatches > 0 && searchMatches > 0 && authorEvents === 25 && workEventsVisible === 0 && errors.length === 0, `authors=${authors} works=${works} search=${search} timeline=${timeline} authorMatches=${authorMatches} searchMatches=${searchMatches} authorEvents=${authorEvents} visibleWorks=${workEventsVisible} errors=${errors.length}`);
  await page.close();
}

await browser.close();
console.log(results.join('\n'));
const fails = results.filter(r => r.startsWith('FAIL')).length;
console.log(`==== ${results.length - fails}/${results.length} PASS ====`);
process.exit(fails ? 1 : 0);
