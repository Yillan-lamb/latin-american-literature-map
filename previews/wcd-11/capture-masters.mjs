/* Capture and verify the six WCD-11 visual master routes.
   Run against a local repository server, for example:
   BASE=http://127.0.0.1:8188/previews/wcd-11/imagery node previews/wcd-11/capture-masters.mjs
*/
import { chromium } from "@playwright/test";
import { existsSync, mkdirSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const HERE = dirname(fileURLToPath(import.meta.url));
const OUTPUT = join(HERE, "screenshots");
const BASE = (process.env.BASE || "http://127.0.0.1:8188/previews/wcd-11/imagery").replace(/\/$/, "");
const CHROME = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome";

const routes = [
  { key: "home", path: "/", master: "home" },
  { key: "author-borges", path: "/authors/jorge-luis-borges-v1-ent-0002/", master: "author" },
  { key: "work-cien-anos", path: "/works/cien-anos-de-soledad-v1-ent-0075/", master: "work" },
  { key: "anecdotes", path: "/anecdotes/", master: "anecdotes" },
  { key: "timeline", path: "/timeline/", master: "timeline" },
  { key: "about", path: "/about/", master: "about" },
];

const viewports = [
  { key: "desktop", width: 1440, height: 900 },
  { key: "mobile", width: 390, height: 844 },
];

async function launchBrowser() {
  const attempts = [
    () => chromium.launch({ channel: "chrome", headless: true }),
    ...(existsSync(CHROME) ? [() => chromium.launch({ executablePath: CHROME, headless: true })] : []),
    () => chromium.launch({ headless: true }),
  ];
  let lastError;
  for (const attempt of attempts) {
    try { return await attempt(); } catch (error) { lastError = error; }
  }
  throw lastError;
}

function assert(condition, message) {
  if (!condition) throw new Error(message);
}

mkdirSync(OUTPUT, { recursive: true });
const browser = await launchBrowser();
const report = [];

try {
  for (const viewport of viewports) {
    const context = await browser.newContext({ viewport, deviceScaleFactor: 1, reducedMotion: "reduce" });
    for (const item of routes) {
      const page = await context.newPage();
      const runtimeErrors = [];
      page.on("pageerror", (error) => runtimeErrors.push(`pageerror: ${String(error)}`));
      page.on("console", (message) => { if (message.type() === "error") runtimeErrors.push(`console: ${message.text()}`); });
      page.on("response", (response) => {
        if (response.status() >= 400) runtimeErrors.push(`${response.status()} ${response.url()}`);
      });

      const response = await page.goto(`${BASE}${item.path}`, { waitUntil: "networkidle" });
      assert(response?.ok(), `${item.key} returned HTTP ${response?.status()}`);
      await page.evaluate(async () => {
        await document.fonts.ready;
        for (let y = 0; y <= document.body.scrollHeight; y += 700) {
          window.scrollTo(0, y);
          await new Promise((resolve) => setTimeout(resolve, 20));
        }
        window.scrollTo(0, 0);
      });
      await page.waitForTimeout(120);

      const state = await page.evaluate(() => ({
        master: document.body.dataset.master,
        width: document.documentElement.scrollWidth,
        viewport: document.documentElement.clientWidth,
        brokenImages: [...document.images]
          .filter((image) => image.complete && image.naturalWidth === 0)
          .map((image) => image.getAttribute("src")),
      }));
      assert(state.master === item.master, `${item.key} rendered master=${state.master || "none"}`);
      assert(state.width <= state.viewport + 1, `${item.key} document overflow ${state.width}px > ${state.viewport}px`);
      assert(state.brokenImages.length === 0, `${item.key} broken images: ${state.brokenImages.join(", ")}`);

      const selectors = {
        home: [".hero-collage", "#literary-map", ".editorial"],
        author: [".master-author-hero", ".master-author-spread", "#author-anecdotes"],
        work: [".master-work-hero", ".master-work-spread", ".work-related"],
        anecdotes: [".master-anecdote-hero", ".clipping-grid", ".anecdote-authors"],
        timeline: [".master-timeline-hero", ".horizontal-timeline", ".timeline-toolbar"],
        about: [".master-about-hero", ".about-grid", ".about-explore"],
      }[item.master];
      for (const selector of selectors) assert(await page.locator(selector).count(), `${item.key} missing ${selector}`);

      if (item.master === "home") {
        const marker = page.locator("#map-handdrawn [data-place-id]").first();
        if (await marker.count()) {
          await marker.click();
          assert(await marker.getAttribute("aria-pressed") !== "false", "home map marker did not respond");
        }
      }
      if (item.master === "timeline") {
        const worksButton = page.locator('[data-timeline-filter="literary_work"]');
        await worksButton.click();
        assert(await worksButton.getAttribute("aria-pressed") === "true", "timeline filter did not activate");
      }

      const output = join(OUTPUT, `${item.key}-${viewport.key}.png`);
      await page.screenshot({ path: output, fullPage: true });
      assert(runtimeErrors.length === 0, `${item.key} runtime errors: ${runtimeErrors.join(" | ")}`);
      report.push({ route: item.path, master: item.master, viewport, output, status: "PASS" });
      console.log(`PASS | ${item.key} | ${viewport.width}x${viewport.height} | ${output}`);
      await page.close();
    }
    await context.close();
  }
} finally {
  await browser.close();
}

writeFileSync(join(OUTPUT, "visual-regression.json"), `${JSON.stringify({ base: BASE, report }, null, 2)}\n`);
console.log(`==== ${report.length}/${routes.length * viewports.length} MASTER CAPTURES PASS ====`);
