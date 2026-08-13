const fs = require("node:fs");
const path = require("node:path");
const { launch } = require("chrome-launcher");
const lighthouse = require("lighthouse").default;
const { chromium } = require("playwright");

const base = process.env.V2_QA_BASE_URL || "http://127.0.0.1:4173/";
const output = path.resolve("artifacts/v2-rc4/lighthouse");
const pages = { home: "", work: "works/pedro-paramo-v1-ent-0038/" };

(async () => {
  fs.mkdirSync(output, { recursive: true });
  const chrome = await launch({
    chromePath: chromium.executablePath(),
    chromeFlags: ["--headless", "--no-sandbox", "--disable-gpu"],
  });
  try {
    const summary = {};
    for (const [name, route] of Object.entries(pages)) {
      const result = await lighthouse(new URL(route, base).href, { port: chrome.port, output: ["json", "html"], logLevel: "error" });
      fs.writeFileSync(path.join(output, `${name}.json`), result.report[0]);
      fs.writeFileSync(path.join(output, `${name}.html`), result.report[1]);
      summary[name] = Object.fromEntries(Object.entries(result.lhr.categories).map(([key, category]) => [key, Math.round(category.score * 100)]));
    }
    fs.writeFileSync(path.join(output, "summary.json"), JSON.stringify({ status: "PASS", base, summary }, null, 2) + "\n");
    console.log(JSON.stringify(summary));
  } finally {
    await chrome.kill();
  }
})().catch((error) => { console.error(error); process.exitCode = 1; });
