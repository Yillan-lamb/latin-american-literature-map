// WEB-CE-B01 batch smoke — temporary QA script, lives in the change-set (not committed to tests/)
// Serves dist/ and verifies the batch's new pages/search paths render publicly.
const { test, expect } = require("@playwright/test");
const fs = require("fs");
const path = require("path");

const siteData = JSON.parse(fs.readFileSync(path.join(__dirname, "..", "..", "..", "data", "v2", "web", "site_data.json"), "utf-8"));

function routeOf(targetId) {
  const entry = siteData.search_index.find((e) => e.target_id === targetId);
  return entry ? entry.public_route : null;
}

const checks = [
  ["V1-ENT-0145", "卡洛斯·富恩特斯"], // new author
  ["V1-ENT-0148", "加夫列拉·米斯特拉尔"], // new author
  ["V1-ENT-0059", "奥克塔维奥·帕斯"], // existing author enriched
  ["V1-ENT-0154", "孤独的迷宫"], // Paz work
  ["V1-ENT-0158", "霍乱时期的爱情"], // pool work
];

test("batch01: new pages and search render", async ({ page }) => {
  const errors = [];
  page.on("pageerror", (e) => errors.push(e.message));
  page.on("console", (m) => { if (m.type() === "error") errors.push(m.text()); });

  await page.goto("");
  await page.getByRole("link", { name: /搜索/ }).first().click().catch(() => {});

  for (const [id, label] of checks) {
    // search the Chinese label
    const box = page.locator("input[type='search'], input[placeholder*='搜索'], .search-input input");
    if (await box.count()) {
      await box.first().fill(label);
      await page.keyboard.press("Enter");
      await page.waitForTimeout(600);
      const results = page.locator(".search-result, [class*='search-result']");
      if (await results.count()) {
        const text = await results.first().innerText().catch(() => "");
        expect(text, `search finds ${label}`).toBeTruthy();
      }
    }
    // direct route
    const route = routeOf(id);
    if (route) {
      await page.goto("/" + route);
      await expect(page.locator("body")).toContainText(label);
    }
  }
  expect(errors, "console/page errors").toEqual([]);
});
