const { defineConfig, devices } = require("@playwright/test");

module.exports = defineConfig({
  testDir: "./tests/browser",
  outputDir: "artifacts/v2-rc4/browser/failures",
  reporter: [["json", { outputFile: "artifacts/v2-rc4/browser/playwright-results.json" }], ["html", { outputFolder: "artifacts/v2-rc4/browser/html", open: "never" }]],
  use: {
    baseURL: process.env.V2_QA_BASE_URL || "http://127.0.0.1:4173/",
    trace: "retain-on-failure",
    screenshot: "only-on-failure",
    video: "retain-on-failure",
  },
  projects: [
    { name: "chromium-desktop", use: { ...devices["Desktop Chrome"], viewport: { width: 1440, height: 1000 } } },
    { name: "chromium-mobile", use: { browserName: "chromium", viewport: { width: 390, height: 844 }, isMobile: true, hasTouch: true } },
    { name: "firefox-desktop", use: { ...devices["Desktop Firefox"], viewport: { width: 1440, height: 1000 } } },
    { name: "webkit-mobile", use: { browserName: "webkit", viewport: { width: 390, height: 844 }, isMobile: true, hasTouch: true } }
  ],
  workers: 1,
  retries: 0,
});
