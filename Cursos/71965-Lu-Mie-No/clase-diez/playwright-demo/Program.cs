//Hacer una busqueda con playwright en google
using Microsoft.Playwright;

var playwright = await Playwright.CreateAsync();
var browser = await playwright.Chromium.LaunchAsync(new BrowserTypeLaunchOptions
{
    Headless = false
});
var page = await browser.NewPageAsync();
await page.GotoAsync("https://www.google.com");
await page.FillAsync("*[name=q]", "Playwright");
await page.PressAsync("*[name=q]", "Enter");
//await page.WaitForNavigationAsync();
Thread.Sleep(10000);
var title = await page.TitleAsync();
Console.WriteLine(title);
await browser.CloseAsync();

