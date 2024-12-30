using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;

//Hago una busqueda en google con Selenium
IWebDriver driver = new ChromeDriver();
driver.Navigate().GoToUrl("http://www.google.com");
IWebElement query = driver.FindElement(By.Name("q"));
query.SendKeys("Selenium");
query.Submit();
Thread.Sleep(10000);
driver.Quit();