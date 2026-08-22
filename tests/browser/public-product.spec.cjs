const { test, expect } = require("@playwright/test");

const forbidden = /\bV1\b|\bV2\b|\bN[1-4]\b|research_gap|auto_approved|user_review|candidate_for_staging_review|card_period_only|source_minimum_status|review_status|admission_status|map_status|entity_type|place_kind|\bschema\b|SQLite|Web Data|release candidate|完整测试站|测试站|当前样本|Codex|REVIEW\s*[\d.]|待审核|未经审核|用户审核|候选包/i;
const paths = {
  country: "countries/mexico-v1-ent-0051/",
  colombia: "countries/colombia-v1-ent-0095/",
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

test("home, map, country and mobile navigation", async ({ page, isMobile, request }) => {
  await page.goto("");
  await expect(page.getByRole("heading", { name: /文学地图/ }).first()).toBeVisible();
  await expect(page.getByRole("link", { name: /从地图开始/ })).toHaveAttribute("href", "#literary-map");
  // Formal public builds use four factual fallback paths while the explicit
  // user-review preview may expose up to ten draft paths. Assert the current
  // bundle's declared projection instead of freezing either count.
  const webData = await (await request.get("data/v2/web/site_data.json")).json();
  const projectedPaths = webData.presentation.reading_paths || [];
  const projectedCountries = new Set((webData.map?.places || [])
    .filter((item) => item.place_kind === "country" && item.map_status !== "hidden" && item.reality_status !== "unknown")
    .map((item) => item.country_code));
  await expect(page.locator(".path-card")).toHaveCount(projectedPaths.length ? Math.min(projectedPaths.length, 10) : 4);
  await expect(page.locator(".country-shape.available")).toHaveCount(projectedCountries.size);
  await expect(page.locator(".fictional-space-button")).toHaveCount(2);
  await expect(page.getByRole("heading", { name: "从一个地方开始" })).toBeVisible();
  await page.locator('[data-country-id="V1-ENT-0051"]').click();
  await expect(page).toHaveURL(/\/$/);
  await expect(page.locator(".map-context-panel")).toContainText("墨西哥");
  await expect(page.locator(".map-context-panel")).toContainText("胡安·鲁尔福");
  await expect(page.locator(".map-context-panel")).toContainText("《佩德罗·巴拉莫》");
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

test("fictional-space selection synchronizes its parent country", async ({ page }) => {
  await page.goto("");
  await page.locator('[data-country-id="V1-ENT-0051"]').click();
  await expect(page.locator('[data-country-id="V1-ENT-0051"]')).toHaveAttribute("aria-pressed", "true");
  await page.locator('[data-fictional-space-id="V1-ENT-0097"]').click();
  const panel = page.locator(".map-context-panel");
  await expect(panel).toContainText("马孔多");
  await expect(panel).toContainText("《百年孤独》");
  await expect(page.locator('[data-country-id="V1-ENT-0095"]')).toHaveAttribute("aria-pressed", "true");
  await expect(page.locator('[data-country-id="V1-ENT-0051"]')).toHaveAttribute("aria-pressed", "false");
});

test("country context aggregates works from fictional child spaces", async ({ page }) => {
  await page.goto("");
  await page.locator('[data-country-id="V1-ENT-0051"]').click();
  await expect(page.locator(".map-context-panel")).toContainText("《佩德罗·巴拉莫》");
  await page.locator('[data-country-id="V1-ENT-0095"]').click();
  await expect(page.locator(".map-context-panel")).toContainText("《百年孤独》");
  await page.goto(paths.country);
  await expect(page.getByText("《佩德罗·巴拉莫》").first()).toBeVisible();
  await page.goto(paths.colombia);
  await expect(page.getByText("《百年孤独》").first()).toBeVisible();
});

test("map filter falls back from an invisible place to its country context", async ({ page }) => {
  await page.goto("");
  await page.locator('[data-country-id="V1-ENT-0051"]').click();
  await page.locator('[data-place-id="V1-ENT-0057"]').click();
  await expect(page.locator(".map-context-panel")).toContainText("圣加布里埃尔");
  const homeUrl = page.url();
  await page.locator('[data-map-filter="story_setting"]').click();
  await expect(page.locator('[data-place-id="V1-ENT-0057"]')).toHaveCount(0);
  const panel = page.locator(".map-context-panel");
  await expect(panel.getByRole("heading", { name: "圣加布里埃尔" })).toHaveCount(0);
  await expect(panel).toContainText("国家文学入口");
  await expect(panel.getByRole("heading", { name: "墨西哥" })).toBeVisible();
  await expect(panel).toContainText("《佩德罗·巴拉莫》");
  await expect(panel).toBeFocused();
  await expect(page.locator('[data-country-id="V1-ENT-0051"]')).toHaveAttribute("aria-pressed", "true");
  await expect(page).toHaveURL(homeUrl);
});

test("map selection supports keyboard activation and announces context", async ({ page }) => {
  await page.goto("");
  const map = page.locator(".map-canvas svg");
  await expect(map).not.toHaveAttribute("role", "img");
  const mexico = page.getByRole("button", { name: "探索墨西哥文学" });
  await mexico.focus();
  await page.keyboard.press("Enter");
  const panel = page.locator(".map-context-panel");
  await expect(panel).toHaveAttribute("aria-live", "polite");
  await expect(panel).toBeFocused();
  await expect(panel).toContainText("墨西哥");
  const sanGabriel = page.getByRole("button", { name: "查看圣加布里埃尔的文学关联" });
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

test("audited WEB-CE-B01/B02/B03/B04/B05 authors, works, collections and Geo are searchable", async ({ page }) => {
  const samples = [
    ["authors/octavio-paz-v1-ent-0059/", "奥克塔维奥·帕斯"],
    ["authors/carlos-fuentes-v1-ent-0145/", "卡洛斯·富恩特斯"],
    ["authors/gabriela-mistral-v1-ent-0148/", "加夫列拉·米斯特拉尔"],
    ["works/desolacion-v1-ent-0149/", "《绝望集》"],
    ["works/el-laberinto-de-la-soledad-v1-ent-0154/", "《孤独的迷宫》"],
    ["works/aura-v1-ent-0169/", "《奥拉》"],
    ["places/vicuna-v1-ent-0153/", "比库尼亚"],
    ["authors/juan-carlos-onetti-v1-ent-0184/", "胡安·卡洛斯·奥内蒂"],
    ["authors/jose-donoso-v1-ent-0185/", "何塞·多诺索"],
    ["authors/ernesto-sabato-v1-ent-0186/", "埃内斯托·萨瓦托"],
    ["works/la-vida-breve-v1-ent-0187/", "《短暂的生命》"],
    ["works/el-obsceno-pajaro-de-la-noche-v1-ent-0190/", "《夜晚的淫鸟》"],
    ["works/el-tunel-v1-ent-0193/", "《隧道》"],
    ["countries/uruguay-v1-ent-0196/", "乌拉圭"],
    ["authors/adolfo-bioy-casares-v1-ent-0198/", "阿道夫·比奥伊·卡萨雷斯"],
    ["works/la-invencion-de-morel-v1-ent-0201/", "《莫雷尔的发明》"],
    ["authors/augusto-roa-bastos-v1-ent-0199/", "奥古斯托·罗亚·巴斯托斯"],
    ["works/hijo-de-hombre-v1-ent-0204/", "《人子》"],
    ["authors/horacio-quiroga-v1-ent-0200/", "奥拉西奥·基罗加"],
    ["works/cuentos-de-la-selva-v1-ent-0208/", "《丛林故事》"],
    ["countries/paraguay-v1-ent-0210/", "巴拉圭"],
    ["authors/machado-de-assis-v1-ent-0211/", "马查多·德·阿西斯"],
    ["works/memorias-postumas-de-bras-cubas-v1-ent-0214/", "《布拉斯·库巴斯死后的回忆》"],
    ["authors/joao-guimaraes-rosa-v1-ent-0212/", "若昂·吉马朗埃斯·罗萨"],
    ["works/grande-sertao-veredas-v1-ent-0217/", "《广阔腹地：条条小径》"],
    ["authors/graciliano-ramos-v1-ent-0213/", "格拉西利亚诺·拉莫斯"],
    ["works/vidas-secas-v1-ent-0220/", "《枯竭的生命》"],
    ["countries/brazil-v1-ent-0183/", "巴西"],
  ];
  for (const [route, title] of samples) {
    const response = await page.goto(route);
    expect(response.status(), route).toBe(200);
    await expect(page.getByText(title).first()).toBeVisible();
    await page.goto(`search/?q=${encodeURIComponent(title.replace(/[《》]/g, ""))}`);
    await expect(page.getByText(title).first()).toBeVisible();
  }
});

test("WEB-CE-B06-B10 obey the public boundary and remain fully testable in USER_REVIEW preview", async ({ page, request }) => {
  const webData = await (await request.get("data/v2/web/site_data.json")).json();
  const batchEntityIds = Array.from({ length: 61 }, (_, index) => `V1-ENT-${String(index + 223).padStart(4, "0")}`);
  const authorAndWorkIds = batchEntityIds.filter((targetId) => targetId !== "V1-ENT-0235");
  const searchableIds = new Set(webData.search_index.map((item) => item.target_id));
  const reviewQueue = webData.public_content_review_queue || { authors: [], works: [], places: [] };
  const reviewQueueIds = new Set(["authors", "works", "places"]
    .flatMap((group) => reviewQueue[group] || [])
    .map((item) => item.target_id));

  if (!searchableIds.has("V1-ENT-0223")) {
    expect(authorAndWorkIds.filter((targetId) => searchableIds.has(targetId)), "formal layer must not partially leak USER_REVIEW records").toEqual([]);
    expect(batchEntityIds.filter((targetId) => reviewQueueIds.has(targetId))).toHaveLength(61);
    return;
  }

  const samples = [
    ["authors/cesar-vallejo-v1-ent-0223/", "塞萨尔·巴列霍"],
    ["authors/alejandra-pizarnik-v1-ent-0237/", "阿莱杭德拉·皮扎尼克"],
    ["authors/jose-maria-arguedas-v1-ent-0248/", "何塞·玛丽亚·阿格达斯"],
    ["authors/roberto-bolano-v1-ent-0262/", "罗贝托·波拉尼奥"],
    ["authors/eduardo-galeano-v1-ent-0272/", "爱德华多·加莱亚诺"],
    ["works/2666-v1-ent-0270/", "《2666》"],
  ];
  for (const [route, title] of samples) {
    const response = await page.goto(route);
    expect(response.status(), route).toBe(200);
    await expect(page.getByText(title).first()).toBeVisible();
    await page.goto(`search/?q=${encodeURIComponent(title.replace(/[《》]/g, ""))}`);
    await expect(page.getByText(title).first()).toBeVisible();
  }

  await page.goto("");
  await page.locator('[data-country-id="V1-ENT-0235"]').click();
  await expect(page.locator(".map-context-panel")).toContainText("尼加拉瓜");
  await expect(page.locator(".map-context-panel")).toContainText("鲁文·达里奥");
  await page.goto("timeline/");
  const timelineEntry = page.locator('[data-target-id="V1-ENT-0270"], [data-entity-id="V1-ENT-0270"]').first();
  if (await timelineEntry.count()) {
    await expect(timelineEntry).toContainText("2004");
  } else {
    expect(webData.timeline.find((item) => item.entity.entity_id === "V1-ENT-0270")?.year_label).toBe("2004");
  }
});

test("WEB-CE-B11-B15 preserve the review boundary and expose complete preview routes", async ({ page, request }) => {
  const webData = await (await request.get("data/v2/web/site_data.json")).json();
  const batchEntityIds = Array.from({ length: 60 }, (_, index) => `V1-ENT-${String(index + 284).padStart(4, "0")}`);
  const searchableIds = new Set(webData.search_index.map((item) => item.target_id));
  const reviewQueue = webData.public_content_review_queue || { authors: [], works: [], places: [] };
  const reviewQueueRecords = ["authors", "works", "places"].flatMap((group) => reviewQueue[group] || []);
  const reviewQueueIds = new Set(reviewQueueRecords.map((item) => item.target_id));
  const serializedReviewQueue = JSON.stringify(reviewQueueRecords);

  expect(serializedReviewQueue).not.toContain("最后回到 1979 年《热带黎明景观》");
  expect(serializedReviewQueue).not.toContain("当不同目录给出 1985 或 1986 时");

  if (!searchableIds.has("V1-ENT-0284")) {
    expect(batchEntityIds.filter((targetId) => searchableIds.has(targetId)), "formal layer must not partially leak B11-B15 USER_REVIEW records").toEqual([]);
    expect(batchEntityIds.filter((targetId) => reviewQueueIds.has(targetId))).toHaveLength(60);
    return;
  }

  const samples = [
    ["authors/manuel-puig-v1-ent-0284/", "曼努埃尔·普伊格"],
    ["authors/samanta-schweblin-v1-ent-0296/", "萨曼塔·施韦布林"],
    ["authors/paulo-coelho-v1-ent-0308/", "保罗·柯艾略"],
    ["authors/jose-lezama-lima-v1-ent-0320/", "何塞·莱萨马·利马"],
    ["authors/julio-ramon-ribeyro-v1-ent-0332/", "胡利奥·拉蒙·里贝罗"],
    ["works/glosa-v1-ent-0340/", "《格洛萨》"],
  ];
  for (const [route, title] of samples) {
    const response = await page.goto(route);
    expect(response.status(), route).toBe(200);
    await expect(page.getByText(title).first()).toBeVisible();
    await page.goto(`search/?q=${encodeURIComponent(title.replace(/[《》]/g, ""))}`);
    await expect(page.getByText(title).first()).toBeVisible();
  }
});

test("WEB-CE-B16 preserves the review boundary and exposes complete preview routes", async ({ page, request }) => {
  const webData = await (await request.get("data/v2/web/site_data.json")).json();
  const batchEntityIds = Array.from({ length: 12 }, (_, index) => `V1-ENT-${String(index + 344).padStart(4, "0")}`);
  const searchableIds = new Set(webData.search_index.map((item) => item.target_id));
  const reviewQueue = webData.public_content_review_queue || { authors: [], works: [], places: [] };
  const reviewQueueRecords = ["authors", "works", "places"].flatMap((group) => reviewQueue[group] || []);
  const reviewQueueIds = new Set(reviewQueueRecords.map((item) => item.target_id));
  const b16Entities = new Map(webData.research.entities.filter((item) => batchEntityIds.includes(item.entity_id)).map((item) => [item.entity_id, item]));

  expect(b16Entities.get("V1-ENT-0344")?.name_zh).toBe("路易斯·塞普尔维达");
  expect(b16Entities.get("V1-ENT-0347")?.name_zh).toBe("《读爱情故事的老人》");
  expect(b16Entities.get("V1-ENT-0348")?.name_zh).toBe("《教海鸥飞翔的猫》");
  expect(b16Entities.get("V1-ENT-0349")?.name_zh).toBe("《世界尽头的世界》");

  // B16 curation is intentionally user_review; formal public projection must not leak it.
  if (!searchableIds.has("V1-ENT-0344")) {
    expect(batchEntityIds.filter((targetId) => searchableIds.has(targetId)), "formal layer must not partially leak B16 USER_REVIEW records").toEqual([]);
    expect(batchEntityIds.filter((targetId) => reviewQueueIds.has(targetId))).toHaveLength(12);
    await page.goto("404.html");
    await expect(page.getByText("这条文学路径尚未开放").first()).toBeVisible();
    return;
  }

  const samples = [
    ["authors/luis-sepulveda-v1-ent-0344/", "路易斯·塞普尔维达"],
    ["authors/guadalupe-nettel-v1-ent-0345/", "瓜达卢佩·内特尔"],
    ["authors/cristina-peri-rossi-v1-ent-0346/", "克里斯蒂娜·佩里·罗西"],
    ["works/un-viejo-que-leia-novelas-de-amor-v1-ent-0347/", "《读爱情故事的老人》"],
    ["works/la-hija-unica-v1-ent-0350/", "《独生女儿》"],
    ["works/descripcion-de-un-naufragio-v1-ent-0355/", "《沉船记》"],
  ];
  for (const [route, title] of samples) {
    const response = await page.goto(route);
    expect(response.status(), route).toBe(200);
    await expect(page.getByText(title).first()).toBeVisible();
    await page.goto(`search/?q=${encodeURIComponent(title.replace(/[《》]/g, ""))}`);
    await expect(page.getByText(title).first()).toBeVisible();
  }
  await page.goto("timeline/");
  await expect(page.locator("body")).toContainText(/1994|1996|2020/);
});

test("WEB-CE-B17 preserves the review boundary and exposes complete preview routes", async ({ page, request }) => {
  const webData = await (await request.get("data/v2/web/site_data.json")).json();
  const authorAndWorkIds = Array.from({ length: 12 }, (_, index) => `V1-ENT-${String(index + 358).padStart(4, "0")}`);
  const searchableIds = new Set(webData.search_index.map((item) => item.target_id));
  const reviewQueue = webData.public_content_review_queue || { authors: [], works: [], places: [] };
  const reviewQueueRecords = ["authors", "works", "places"].flatMap((group) => reviewQueue[group] || []);
  const reviewQueueIds = new Set(reviewQueueRecords.map((item) => item.target_id));

  // Country nodes are formal Geo projection; author/work cards remain USER_REVIEW in the normal build.
  for (const [route, title] of [["countries/ecuador-v1-ent-0356/", "厄瓜多尔"], ["countries/venezuela-v1-ent-0357/", "委内瑞拉"]]) {
    const response = await page.goto(route);
    expect(response.status(), route).toBe(200);
    await expect(page.getByRole("heading", { name: title }).first()).toBeVisible();
  }

  if (!searchableIds.has("V1-ENT-0358")) {
    expect(authorAndWorkIds.filter((targetId) => searchableIds.has(targetId)), "formal layer must not partially leak B17 USER_REVIEW records").toEqual([]);
    expect(authorAndWorkIds.filter((targetId) => reviewQueueIds.has(targetId))).toHaveLength(12);
    return;
  }

  const samples = [
    ["authors/lygia-fagundes-telles-v1-ent-0358/", "莉吉娅·法贡德斯·特莱斯"],
    ["authors/jorge-icaza-v1-ent-0359/", "豪尔赫·伊卡萨"],
    ["authors/romulo-gallegos-v1-ent-0360/", "罗慕洛·加列戈斯"],
    ["works/ciranda-de-pedra-v1-ent-0361/", "《石头圆舞》"],
    ["works/huasipungo-v1-ent-0364/", "《瓦西蓬戈》"],
    ["works/dona-barbara-v1-ent-0367/", "《堂娜·芭芭拉》"],
  ];
  for (const [route, title] of samples) {
    const response = await page.goto(route);
    expect(response.status(), route).toBe(200);
    await expect(page.getByText(title).first()).toBeVisible();
    await page.goto(`search/?q=${encodeURIComponent(title.replace(/[《》]/g, ""))}`);
    await expect(page.getByText(title).first()).toBeVisible();
  }
  await page.goto("authors/lygia-fagundes-telles-v1-ent-0358/");
  await expect(page.locator("body")).toContainText("1918");
  await page.goto("timeline/");
  await expect(page.locator("body")).toContainText(/1929|1934|1954/);
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
  const routes = [...sitemap.matchAll(/<loc>(.*?)<\/loc>/g)].map((match) => new URL(match[1]).pathname.replace(/^\/+/, ""));
  expect(routes.length).toBeGreaterThan(40);
  for (const route of routes) {
    const response = await page.goto(route);
    expect(response.status(), route).toBe(200);
    const text = await page.locator("body").innerText();
    expect(text, route).not.toContain("文学地图暂时没有打开");
    expect(text, route).not.toMatch(forbidden);
  }
});
