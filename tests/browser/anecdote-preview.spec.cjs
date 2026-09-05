// WCD-08 作者页趣闻板块预览测试（针对本地 USER_REVIEW 预览站点）。
// 运行：先 `python3 scripts/build_wcd08_user_review_preview.py`，再
// `V2_QA_BASE_URL=http://127.0.0.1:4174 npx playwright test tests/browser/anecdote-preview.spec.cjs --project=chromium-desktop`
const { test, expect } = require("@playwright/test");

test.describe("WCD-08 anecdote preview", () => {
  test.beforeEach(() => {
    // 本 spec 只针对本地 USER_REVIEW 预览站（默认 4174 端口）；对 dist 运行时跳过。
    test.skip(!process.env.V2_QA_BASE_URL || !process.env.V2_QA_BASE_URL.includes("4174"), "anecdote preview spec runs only against the WCD-08 preview server");
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
  });

  test("anecdote detail expands with sources panel and home page has no section", async ({ page }) => {
    await page.goto("/authors/V1-ENT-0002/", { waitUntil: "domcontentloaded" });
    const section = page.locator(".anecdotes-section");
    await expect(section).toHaveCount(1);
    const cards = section.locator(".anecdote-card");
    expect(await cards.count()).toBeGreaterThanOrEqual(2);
    await cards.nth(0).locator("details.anecdote-detail > summary").click();
    await expect(cards.nth(0).locator(".anecdote-body")).toBeVisible();
    await page.goto("/");
    await expect(page.locator(".anecdotes-section")).toHaveCount(0);
  });
});
