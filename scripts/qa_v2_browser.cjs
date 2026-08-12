const { chromium, firefox, webkit } = require("playwright");
const fs = require("node:fs");

const base = process.argv[2] || "http://127.0.0.1:4173/";
const outputPath = process.argv[3];
const forbidden = /\bV1\b|\bV2\b|\bN[1-4]\b|research_gap|auto_approved|user_review|candidate_for_staging_review|card_period_only|source_minimum_status|review_status|admission_status|map_status|entity_type|place_kind|\bschema\b|SQLite|Web Data|release candidate|完整测试站|测试站|当前样本/i;
const journeys = [
  ["home", "", "拉丁美洲文学地图"],
  ["country", "countries/mexico/", "墨西哥"],
  ["fictional-space", "places/comala/", "文学虚构空间"],
  ["author", "authors/juan-rulfo/", "读什么"],
  ["work", "works/pedro-paramo/", "为什么值得读"],
  ["search", "search/?q=马孔多", "马孔多"],
  ["timeline", "timeline/", "文学时间线"],
  ["about", "about/", "这个项目是什么"],
  ["not-found", "404.html", "这条文学路径尚未开放"],
];

async function run(engineName, engine, viewport) {
  const browser = await engine.launch({ headless: true });
  const page = await browser.newPage({ viewport });
  const errors = [];
  page.on("pageerror", (error) => errors.push(error.message));
  const results = [];
  for (const [name, path, expected] of journeys) {
    const response = await page.goto(new URL(path, base).href, { waitUntil: "networkidle" });
    const text = await page.locator("body").innerText();
    const links = await page.locator("a").count();
    results.push({ name, status: response?.status(), expected: text.includes(expected), internal_language: forbidden.test(text), links });
  }
  await page.goto(base, { waitUntil: "networkidle" });
  const mapShapes = await page.locator(".country-shape").count();
  const availableCountries = await page.locator(".country-shape.available").count();
  if (viewport.width < 500) {
    await page.locator(".menu-toggle").click();
    if (!(await page.locator(".main-nav").isVisible())) errors.push("mobile menu did not open");
  }
  await browser.close();
  return { engine: engineName, viewport, mapShapes, availableCountries, errors, journeys: results };
}

(async () => {
  const report = [];
  for (const [name, engine] of [["chromium", chromium], ["firefox", firefox], ["webkit", webkit]]) {
    try {
      report.push(await run(name, engine, { width: 1440, height: 1000 }));
      report.push(await run(name, engine, { width: 390, height: 844 }));
    } catch (error) {
      report.push({ engine: name, status: "NOT_RUN", reason: error.message.split("\n")[0] });
    }
  }
  const failed = report.some((item) => item.status === "NOT_RUN" || item.errors?.length || item.journeys?.some((journey) => journey.status >= 400 || !journey.expected || journey.internal_language));
  const result = JSON.stringify({ status: failed ? "FAIL" : "PASS", report }, null, 2);
  if (outputPath) fs.writeFileSync(outputPath, `${result}\n`, "utf8");
  console.log(result);
  process.exitCode = failed ? 1 : 0;
})();
