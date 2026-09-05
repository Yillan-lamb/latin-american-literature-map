// WCD-08 作者页趣闻板块预览测试（针对本地 USER_REVIEW 预览站点）。
// 运行：先 `python3 scripts/build_wcd08_user_review_preview.py`，再
// `V2_WCD08_PREVIEW=1 V2_QA_BASE_URL=http://127.0.0.1:4276 npx playwright test tests/browser/anecdote-preview.spec.cjs --project=chromium-desktop`
const { test, expect } = require("@playwright/test");

test.describe("WCD-08 anecdote preview", () => {
  test.beforeEach(() => {
    // 只有显式启用预览环境才运行；公共 dist 无论端口都必须跳过。
    test.skip(process.env.V2_WCD08_PREVIEW !== "1", "set V2_WCD08_PREVIEW=1 for the WCD-08 preview server");
  });

  test("author page renders anecdote section with expandable story", async ({ page }) => {
    await page.goto("/authors/V1-ENT-0072/", { waitUntil: "domcontentloaded" });
    const section = page.locator(".anecdotes-section");
    await expect(section).toHaveCount(1);
    await expect(section.locator(".section-heading h2")).toContainText("另一面");
    const first = section.locator(".anecdote-card").first();
    await expect(first.locator("h3")).toBeVisible();
    await expect(first.locator(".anecdote-teaser")).toBeVisible();
    await first.locator("details.anecdote-detail > summary").click();
    await expect(first.locator(".anecdote-body")).toBeVisible();
    await expect(page.locator("[data-review-preview-banner]")).toBeVisible();
    const bannerPosition = await page.locator("body").evaluate((body) => body.firstElementChild?.getAttribute("data-review-preview-banner"));
    expect(bannerPosition).toBe("");
  });

  test("anecdote detail expands with sources panel and home page has no section", async ({ page }) => {
    await page.goto("/authors/V1-ENT-0002/", { waitUntil: "domcontentloaded" });
    const section = page.locator(".anecdotes-section");
    await expect(section).toHaveCount(1);
    const cards = section.locator(".anecdote-card");
    expect(await cards.count()).toBeGreaterThanOrEqual(2);
    const more = section.locator("details.anecdote-more");
    if (await more.count()) await more.locator(":scope > summary").click();
    await expect(section.locator('[data-anecdote-status="hold"]').first()).toBeVisible();
    await expect(section.locator(".anecdote-gate-note").first()).toBeVisible();
    const teaser = await cards.nth(0).locator(".anecdote-teaser").innerText();
    await cards.nth(0).locator("details.anecdote-detail > summary").click();
    await expect(cards.nth(0).locator(".anecdote-body")).toBeVisible();
    const expanded = await cards.nth(0).locator(".anecdote-body").innerText();
    expect(expanded.startsWith(teaser)).toBe(false);
    await page.goto("/");
    await expect(page.locator(".anecdotes-section")).toHaveCount(0);
  });
});
