# 🧪 Laboratorio: Tests Funcionales con Selenium y Playwright  

## 🎯 Objetivo  
Aprender a utilizar **Selenium** y **Playwright** como herramientas para realizar tests funcionales automatizados en aplicaciones web.

---

## 🚀 Parte 1: Uso de Selenium para Tests Funcionales  

### 1️⃣ Crear un proyecto de .NET  
Primero, crearemos un proyecto de consola en .NET para alojar nuestro código de pruebas.  

```
dotnet new console --name selenium-demo
```

📂 Esto generará una carpeta llamada `selenium-demo` con los archivos necesarios.  

### 2️⃣ Agregar los paquetes de Selenium  
Agregaremos las bibliotecas necesarias para usar Selenium y el controlador de Chrome:  

```
dotnet add package Selenium.WebDriver
dotnet add package Selenium.WebDriver.ChromeDriver
```

🛠️ Estos paquetes permiten interactuar con navegadores web y realizar automatizaciones.  

### 3️⃣ Programar una automatización con Selenium  
Editaremos el archivo `Program.cs` para realizar una búsqueda en Google utilizando Selenium.  

```
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;

// Crear una instancia del navegador
IWebDriver driver = new ChromeDriver();

// Navegar a Google
driver.Navigate().GoToUrl("http://www.google.com");

// Buscar un término
IWebElement query = driver.FindElement(By.Name("q"));
query.SendKeys("Selenium");
query.Submit();

// Esperar unos segundos para observar el resultado
Thread.Sleep(10000);

// Cerrar el navegador
driver.Quit();
```

🔍 Este código abrirá Google, buscará "Selenium" y mostrará los resultados.

### 4️⃣ Ejecutar el proyecto  
Ejecuta el proyecto con el siguiente comando:  

```
dotnet run
```

🎉 ¡Observa cómo se abre el navegador y realiza la búsqueda automáticamente!  

---

## 🚀 Parte 2: Uso de Playwright para Tests Funcionales  

### 1️⃣ Crear un proyecto de .NET  
Crearemos un nuevo proyecto de consola en .NET para Playwright:  

```
dotnet new console --name playwright-demo
```

📂 Esto generará una carpeta llamada `playwright-demo` con los archivos necesarios.  

### 2️⃣ Agregar el paquete de Playwright  
Agregaremos la biblioteca necesaria para usar Playwright:  

```
dotnet add package Microsoft.Playwright
```

### 3️⃣ Instalar los navegadores  
Playwright requiere instalar los navegadores para realizar las pruebas:  

```
pwsh .\bin\Debug\net8.0\playwright.ps1 install
```

🖥️ Esto descargará los navegadores compatibles para las pruebas.  

### 4️⃣ Programar una automatización con Playwright  
Editaremos el archivo `Program.cs` para realizar una búsqueda en Google utilizando Playwright:  

```
using Microsoft.Playwright;

var playwright = await Playwright.CreateAsync();
var browser = await playwright.Chromium.LaunchAsync(new BrowserTypeLaunchOptions
{
    Headless = false // Cambiar a true si no quieres que el navegador sea visible
});
var page = await browser.NewPageAsync();

// Navegar a Google
await page.GotoAsync("https://www.google.com");

// Buscar un término
await page.FillAsync("*[name=q]", "Playwright");
await page.PressAsync("*[name=q]", "Enter");

// Esperar unos segundos para observar el resultado
Thread.Sleep(10000);

// Obtener y mostrar el título de la página
var title = await page.TitleAsync();
Console.WriteLine(title);

// Cerrar el navegador
await browser.CloseAsync();
```

🔍 Este código abrirá Google, buscará "Playwright" y mostrará el título de la página en la consola.  

### 5️⃣ Ejecutar el proyecto  
Ejecuta el proyecto con el siguiente comando:  

```
dotnet run
```

🎉 ¡Observa cómo se abre el navegador, realiza la búsqueda y muestra el título de la página!  

---

## 📝 Notas finales  
- **Selenium** y **Playwright** son herramientas poderosas para automatizar pruebas funcionales en aplicaciones web.  
- Selenium es ideal para escenarios con múltiples navegadores, mientras que Playwright ofrece funcionalidades avanzadas y modernas.  
- Usa la herramienta que mejor se adapte a tus necesidades y requisitos del proyecto.  

🚀 ¡Ahora estás listo para implementar tests funcionales en tus proyectos! 🌟  
