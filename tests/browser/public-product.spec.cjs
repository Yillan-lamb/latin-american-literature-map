const { test, expect } = require("@playwright/test");

const forbidden = /\bV1\b|\bV2\b|\bN[1-4]\b|research_gap|auto_approved|user_review|candidate_for_staging_review|card_period_only|source_minimum_status|review_status|admission_status|map_status|entity_type|place_kind|\bschema\b|SQLite|Web Data|release candidate|完整测试站|测试站|当前样本|Codex|REVIEW\s*[\d.]|待审核|未经审核|用户审核|候选包/i;
const paths = {
  country: "countries/mexico-v1-ent-0051/",
  realPlace: "places/rio-de-janeiro-v1-ent-0022/",
  fictionalPlace: "places/macondo-v1-ent-0097/",
  author: "authors/juan-rulfo-v1-ent-0031/",
  work: "works/pedro-paramo-v1-ent-0038/",
};

test.beforeEach(async ({ page }) => {
  const errors = [];
  page.on("pageerror", (error) => errors.push(error.message));
  page.on("console", (message) => { if (message.type() === "error") errors.push(message.text()); });
  page.__qaErrors = errors;
});

test.afterEach(async ({ page }) => {
  expect(page.__qaErrors, "console and page errors").toEqual([]);
  expect(await page.locator("body").innerText()).not.toMatch(forbidden);
});

test("home, map, country and mobile navigation", async ({ page, isMobile }) => {
  await page.goto("");
  await expect(page.getByRole("heading", { name: /文学地图/ }).first()).toBeVisible();
  await expect(page.getByRole("link", { name: /从地图开始/ })).toHaveAttribute("href", "#literary-map");
  await expect(page.locator(".path-card")).toHaveCount(10);
  await expect(page.locator(".country-shape.available")).toHaveCount(7);
  await expect(page.locator(".fictional-space-button")).toHaveCount(2);
  await expect(page.getByRole("heading", { name: "从一个地方开始" })).toBeVisible();
  await page.locator('[data-country-id="V1-ENT-0051"]').click();
  await expect(page).toHaveURL(/\/$/);
  await expect(page.locator(".map-context-panel")).toContainText("墨西哥");
  await expect(page.locator(".map-context-panel")).toContainText("胡安·鲁尔福");
  await expect(page.locator('[data-country-id="V1-ENT-0051"]')).toHaveAttribute("aria-pressed", "true");
  if (isMobile) {
    await page.locator(".menu-toggle").click();
    await expect(page.locator(".main-nav")).toBeVisible();
  }
  await page.goto(paths.country);
  await expect(page.getByRole("heading", { name: "墨西哥" })).toBeVisible();
  await expect(page.getByText("胡安·鲁尔福").first()).toBeVisible();
});

test("map selections update literary context without immediate navigation", async ({ page }) => {
  await page.goto("");
  await page.locator('[data-country-id="V1-ENT-0051"]').click();
  await page.locator('[data-place-id="V1-ENT-0057"]').click();
  await expect(page).toHaveURL(/\/$/);
  await expect(page.locator(".map-context-panel")).toContainText("圣加布里埃尔");
  await expect(page.locator(".map-context-panel")).toContainText("胡安·鲁尔福");
  await expect(page.locator('[data-place-id="V1-ENT-0057"]')).toHaveAttribute("aria-pressed", "true");

  const comala = page.locator('[data-fictional-space-id="V1-ENT-0055"]');
  await expect(comala).not.toHaveAttribute("data-latitude");
  await expect(comala).not.toHaveAttribute("data-longitude");
  await comala.click();
  await expect(page).toHaveURL(/\/$/);
  await expect(page.locator(".map-context-panel")).toContainText("文学虚构空间");
  await expect(page.locator(".map-context-panel")).toContainText("科马拉");
  await expect(page.locator(".map-context-panel")).toContainText("《佩德罗·巴拉莫》");
  await expect(page.locator(".map-context-panel")).toContainText("胡安·鲁尔福");
  await expect(page.locator(".map-context-panel")).toBeFocused();
});

test("map selection supports keyboard activation and announces context", async ({ page }) => {
  await page.goto("");
  const mexico = page.locator('[data-country-id="V1-ENT-0051"]');
  await mexico.focus();
  await page.keyboard.press("Enter");
  const panel = page.locator(".map-context-panel");
  await expect(panel).toHaveAttribute("aria-live", "polite");
  await expect(panel).toBeFocused();
  await expect(panel).toContainText("墨西哥");
  const sanGabriel = page.locator('[data-place-id="V1-ENT-0057"]');
  await sanGabriel.focus();
  await page.keyboard.press("Space");
  await expect(page.locator(".map-context-panel")).toContainText("圣加布里埃尔");
  await expect(page.locator('[data-place-id="V1-ENT-0057"]')).toHaveAttribute("aria-pressed", "true");
});

test("places, author, work, sources and navigation", async ({ page }) => {
  for (const [path, expected] of [[paths.realPlace, "里约热内卢"], [paths.fictionalPlace, "马孔多"], [paths.author, "为什么值得认识"], [paths.work, "为什么值得读"]]) {
    const response = await page.goto(path);
    expect(response.status()).toBe(200);
    await expect(page.getByText(expected).first()).toBeVisible();
  }
  await expect(page.getByText("读完之后读什么")).toBeVisible();
  await page.getByText("研究依据与延伸阅读").click();
  await expect(page.getByRole("heading", { name: "资料来源" })).toBeVisible();
  await page.goto(paths.author);
  await expect(page.getByText("如果你喜欢……")).toBeVisible();
  await expect(page.getByText("一条阅读路线")).toBeVisible();
  await expect(page.getByText("带着一个问题去读")).toBeVisible();
  await page.locator(`a[href="/${paths.work}"]`).first().click();
  await expect(page.getByText("为什么值得读")).toBeVisible();
  await expect(page.getByText("怎么读这本书")).toBeVisible();
  await expect(page.getByText("带着一个问题去读")).toBeVisible();
  await page.goBack();
  await expect(page.getByText("为什么值得认识")).toBeVisible();
});

test("search expands formal relationships", async ({ page }) => {
  await page.goto(`search/?q=${encodeURIComponent("马孔多")}`);
  for (const name of ["马孔多", "《百年孤独》", "加西亚·马尔克斯"]) await expect(page.getByText(name).first()).toBeVisible();
  await page.goto("search/?q=不存在的文学条目");
  await expect(page.getByText("没有找到匹配项")).toBeVisible();
});

test("timeline, semantic routes, metadata and 404", async ({ page }) => {
  await page.goto("timeline/");
  await expect(page.getByRole("heading", { name: /沿时间进入/ })).toBeVisible();
  const themeRoutes = ["explore/theme-v1-ent-0025/", "explore/destino-del-continente-epopeya-americana-v1-ent-0137/"];
  for (const route of themeRoutes) {
    const response = await page.goto(route);
    expect(response.status()).toBe(200);
    expect(await page.locator('link[rel="canonical"]').getAttribute("href")).toContain(route);
    expect(await page.locator('meta[property="og:url"]').getAttribute("content")).toContain(route);
  }
  await page.goto("404.html");
  await expect(page.getByText("这条文学路径尚未开放").first()).toBeVisible();
});

test("about page explains the reader journey", async ({ page }) => {
  await page.goto("about/");
  await expect(page.getByRole("heading", { name: /为什么做一张/ })).toBeVisible();
  for (const heading of ["这是什么", "为什么是一张地图", "你可以怎样探索", "不止魔幻现实主义", "一张持续生长的地图"]) {
    await expect(page.getByRole("heading", { name: heading })).toBeVisible();
  }
});

test("required author, work and place samples resolve through the public layer", async ({ page }) => {
  const samples = [
    ["authors/jorge-luis-borges-v1-ent-0002/", "豪尔赫·路易斯·博尔赫斯"],
    ["authors/gabriel-garcia-marquez-v1-ent-0072/", "加西亚·马尔克斯"],
    ["authors/juan-rulfo-v1-ent-0031/", "胡安·鲁尔福"],
    ["authors/mario-vargas-llosa-v1-ent-0114/", "马里奥·巴尔加斯·略萨"],
    ["works/cien-anos-de-soledad-v1-ent-0075/", "《百年孤独》"],
    ["works/el-aleph-v1-ent-0004/", "《阿莱夫》"],
    ["works/el-jardin-de-senderos-que-se-bifurcan-v1-ent-0003/", "《小径分岔的花园》"],
    ["works/a-hora-da-estrela-v1-ent-0018/", "《星辰时刻》"],
    ["works/rayuela-v1-ent-0078/", "《跳房子》"],
    ["works/la-guerra-del-fin-del-mundo-v1-ent-0118/", "《世界末日之战》"],
    ["countries/mexico-v1-ent-0051/", "墨西哥"],
    ["places/comala-v1-ent-0055/", "科马拉"],
    ["places/macondo-v1-ent-0097/", "马孔多"],
    ["places/aracataca-v1-ent-0098/", "阿卡塔卡"],
    ["countries/argentina-v1-ent-0001/", "阿根廷"],
    ["places/rio-de-janeiro-v1-ent-0022/", "里约热内卢"],
    ["places/lima-v1-ent-0125/", "利马"],
    ["places/santiago-de-chile-v1-ent-0128/", "圣地亚哥"],
  ];
  for (const [route, title] of samples) {
    const response = await page.goto(route);
    expect(response.status(), route).toBe(200);
    await expect(page.getByText(title).first()).toBeVisible();
  }
  for (const coreAuthor of ["克拉丽丝·李斯佩克朵", "巴勃罗·聂鲁达"]) {
    await page.goto(`search/?q=${encodeURIComponent(coreAuthor)}`);
    await expect(page.getByText(coreAuthor).first()).toBeVisible();
  }
});

test("keyboard focus and links stay inside the public scope", async ({ page }) => {
  await page.goto("");
  await page.keyboard.press("Tab");
  const focus = await page.evaluate(() => ({ tag: document.activeElement?.tagName, role: document.activeElement?.getAttribute("role") }));
  expect(["A", "BUTTON", "path"].includes(focus.tag) || focus.role === "button").toBe(true);
  const hrefs = await page.locator("a[href]").evaluateAll((links) => links.map((link) => String(link.getAttribute("href") || "")));
  expect(hrefs.some((href) => href.includes("undefined") || href.includes("literature/"))).toBe(false);
  const internal = [...new Set(hrefs.filter((href) => href.startsWith("/") && !href.startsWith("//")))];
  for (const href of internal) {
    const response = await page.request.get(href);
    expect(response.status(), `broken public link: ${href}`).toBeLessThan(400);
  }
  const boxes = await page.locator(".map-point text").evaluateAll((labels) => labels.map((label) => {
    const box = label.getBoundingClientRect();
    return { text: label.textContent, left: box.left, right: box.right, top: box.top, bottom: box.bottom };
  }));
  const overlaps = [];
  for (let first = 0; first < boxes.length; first += 1) for (let second = first + 1; second < boxes.length; second += 1) {
    const a = boxes[first]; const b = boxes[second];
    if (Math.min(a.right, b.right) - Math.max(a.left, b.left) > 4 && Math.min(a.bottom, b.bottom) - Math.max(a.top, b.top) > 4) overlaps.push([a.text, b.text]);
  }
  expect(overlaps, "map labels overlap materially").toEqual([]);
});

test("every sitemap route renders public reader text without governance language", async ({ page, request }) => {
  const sitemap = await (await request.get("sitemap.xml")).text();
  const routes = [...sitemap.matchAll(/<loc>https:\/\/example\.invalid\/(.*?)<\/loc>/g)].map((match) => match[1]);
  expect(routes.length).toBeGreaterThan(40);
  for (const route of routes) {
    const response = await page.goto(route);
    expect(response.status(), route).toBe(200);
    const text = await page.locator("body").innerText();
    expect(text, route).not.toContain("文学地图暂时没有打开");
    expect(text, route).not.toMatch(forbidden);
  }
});
