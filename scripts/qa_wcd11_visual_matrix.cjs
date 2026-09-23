const fs = require("node:fs");
const path = require("node:path");
const { chromium } = require("playwright");

const base = process.env.V2_QA_BASE_URL || "http://127.0.0.1:4173/";
const output = path.resolve(process.argv[2] || "artifacts/wcd-11/visual-matrix");
const routes = [
  ["home", ""],
  ["authors", "authors/"],
  ["author", "authors/gabriel-garcia-marquez-v1-ent-0072/"],
  ["works", "works/"],
  ["work", "works/cien-anos-de-soledad-v1-ent-0075/"],
  ["anecdotes", "anecdotes/"],
  ["search", "search/?q=马孔多"],
  ["timeline", "timeline/"],
  ["about", "about/"],
  ["country", "countries/argentina-v1-ent-0001/"],
  ["real-place", "places/rio-de-janeiro-v1-ent-0022/"],
  ["fictional-place", "places/macondo-v1-ent-0097/"],
  ["reading-path", "paths/three-fictional-towns/"],
  ["explore-node", "explore/realismo-magico-v1-ent-0099/"],
  ["not-found", "404.html"],
];
const viewports = [
  ["desktop", { width: 1440, height: 900 }, true],
  ["mobile", { width: 390, height: 844 }, true],
  ["narrow", { width: 320, height: 768 }, false],
];

(async () => {
  fs.mkdirSync(output, { recursive: true });
  const browser = await chromium.launch({ headless: true });
  const results = [];
  try {
    for (const [viewportName, viewport, capture] of viewports) {
      const page = await browser.newPage({ viewport, deviceScaleFactor: 1 });
      const errors = [];
      page.on("pageerror", (error) => errors.push(error.message));
      page.on("console", (message) => {
        if (message.type() === "error") errors.push(message.text());
      });
      for (const [name, route] of routes) {
        errors.length = 0;
        const response = await page.goto(new URL(route, base).href, { waitUntil: "networkidle" });
        await page.locator("img").evaluateAll((images) => images.forEach((image) => { image.loading = "eager"; }));
        await page.waitForFunction(() => [...document.images].every((image) => image.complete), null, { timeout: 15_000 });
        const metrics = await page.evaluate(() => ({
          viewportWidth: innerWidth,
          documentWidth: document.documentElement.scrollWidth,
          title: document.title,
          images: [...document.images].map((image) => ({ src: image.currentSrc, loaded: image.complete && image.naturalWidth > 0 })),
        }));
        let timelineKeyboardScroll = null;
        let mapPresentation = null;
        if (name === "home") {
          mapPresentation = await page.evaluate(() => {
            const canvas = document.querySelector(".map-canvas");
            const panel = document.querySelector(".map-context-panel");
            const svg = canvas?.querySelector("svg");
            const fictionalInset = canvas?.querySelector(".fictional-space-inset");
            return {
              compassUnderlay: !!canvas && getComputedStyle(canvas).backgroundImage.includes("compass-chart-underlay-v1.jpg"),
              interactiveCountries: document.querySelectorAll(".country-shape.available").length === 13,
              mobileInsetClearOfMap: innerWidth > 620 || (!!fictionalInset && !!svg && fictionalInset.getBoundingClientRect().top >= svg.getBoundingClientRect().bottom - 1),
              desktopPanelFillsMap: innerWidth <= 900 || (!!panel && !!canvas && panel.offsetHeight >= canvas.offsetHeight - 1),
            };
          });
        }
        if (name === "timeline") {
          const ledger = page.locator(".timeline-ledger");
          await ledger.focus();
          const before = await ledger.evaluate((element) => element.scrollLeft);
          await page.keyboard.press("ArrowRight");
          await page.waitForTimeout(250);
          timelineKeyboardScroll = await ledger.evaluate((element) => element.scrollLeft > 0);
          await ledger.evaluate((element, left) => { element.scrollLeft = left; element.blur(); }, before);
        }
        const screenshot = capture ? `${viewportName}-${name}.png` : null;
        if (screenshot) await page.screenshot({ path: path.join(output, screenshot), fullPage: true });
        results.push({ viewport: viewportName, name, route, status: response.status(), screenshot, overflow: metrics.documentWidth > metrics.viewportWidth + 1, title: metrics.title, brokenImages: metrics.images.filter((image) => !image.loaded), mapPresentation, timelineKeyboardScroll, errors: [...errors] });
      }
      await page.close();
    }
  } finally {
    await browser.close();
  }
  const failed = (item) => item.status !== 200 || item.overflow || item.brokenImages.length || (item.mapPresentation && Object.values(item.mapPresentation).some((value) => !value)) || item.timelineKeyboardScroll === false || item.errors.length;
  const status = results.every((item) => !failed(item)) ? "PASS" : "FAIL";
  const report = { status, base, routes: routes.length, checks: results.length, screenshots: results.filter((item) => item.screenshot).length, results };
  fs.writeFileSync(path.join(output, "report.json"), `${JSON.stringify(report, null, 2)}\n`);
  console.log(JSON.stringify({ status, checks: results.length, screenshots: report.screenshots, failures: results.filter(failed) }));
  process.exitCode = status === "PASS" ? 0 : 1;
})().catch((error) => { console.error(error); process.exitCode = 1; });
