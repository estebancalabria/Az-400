# Clase 8 - 2 de Octubre 2026

# Repaso

* Devops-Azure
  * Manejo de Secretos con Key Vault
  * Leer secretos desde el pipeline
  * Feature Flags
    * App Configurations
    * App Serivce
        * Despliegue desde pipeline
        * Enviroment Variables
    * Permisos RBAC
        * App Service -> (RBAC) -> App Configurations
      

# Package Manager


* Iniciar el Lab

* Ir a Artifacts y poner Create Feed
  * Name :contoso-internal6578756
 
* Ir a Connecto To feed y copiarse la URL

```
<add key="contoso-internal65787565" value="https://pkgs.dev.azure.com/ADOCourseOrg01/Contoso.Microservices65787565/_packaging/contoso-internal65787565/nuget/v3/index.json" />
```

* Cambiarle los permisos a Contoso.MicroServices Build Service  a Contributor

* En la terminal ir a una carpeta X y tirar este CLI

```
dotnet nuget add source https://api.nuget.org/v3/index.json --name nuget.org
dotnet new sln --name Contoso.Shared
dotnet new classlib --name Contoso.Shared.Core --framework net10.0
dotnet sln add Contoso.Shared.Core
dotnet new gitignore
```

* Editar el proyecto con vscode

```
code .
```

* Agregar al csproj la descripcion del paquete

```xml
<Project Sdk="Microsoft.NET.Sdk">
	<PropertyGroup>
		<TargetFramework>net10.0</TargetFramework>
		<ImplicitUsings>enable</ImplicitUsings>
		<Nullable>enable</Nullable>
		<!-- Package metadata -->
		<PackageId>Contoso.Shared.Core</PackageId>
		<Version>1.0.0</Version>
		<Authors>Contoso DevOps Team</Authors>
		<Company>Contoso Retail</Company>
		<Description>Core shared utilities for Contoso microservices including API response models, logging helpers, and common extensions.</Description>
		<PackageTags>contoso;shared;utilities;microservices</PackageTags>
		<RepositoryType>git</RepositoryType>
	</PropertyGroup>
```

* Crear el archivo \Contoso.Shared.Core\Models\ApiResponse.cs

```
namespace Contoso.Shared.Core.Models;

public class ApiResponse<T>
{
    public bool Success { get; set; }
    public T? Data { get; set; }
    public ApiError? Error { get; set; }
    public string CorrelationId { get; set; } = Guid.NewGuid().ToString();
    public DateTime Timestamp { get; set; } = DateTime.UtcNow;

    public static ApiResponse<T> Ok(T data, string? correlationId = null)
    {
        return new ApiResponse<T>
        {
            Success = true,
            Data = data,
            CorrelationId = correlationId ?? Guid.NewGuid().ToString()
        };
    }

    public static ApiResponse<T> Fail(string errorCode, string message, string? correlationId = null)
    {
        return new ApiResponse<T>
        {
            Success = false,
            Error = new ApiError(errorCode, message),
            CorrelationId = correlationId ?? Guid.NewGuid().ToString()
        };
    }
}

public record ApiError(string Code, string Message)
{
    public string? Details { get; init; }
    public Dictionary<string, string[]>? ValidationErrors { get; init; }
}
```

* Crear el archivo Contoso.Shared.Core\Logging\LogContext.cs

```
namespace Contoso.Shared.Core.Logging;

public class LogContext
{
    public string CorrelationId { get; set; } = Guid.NewGuid().ToString();
    public required string ServiceName { get; set; }
    public string? Operation { get; set; }
    public string? UserId { get; set; }
    public string? TenantId { get; set; }

    public Dictionary<string, object?> ToDictionary()
    {
        return new Dictionary<string, object?>
        {
            ["CorrelationId"] = CorrelationId,
            ["ServiceName"] = ServiceName,
            ["Operation"] = Operation,
            ["UserId"] = UserId,
            ["TenantId"] = TenantId,
            ["Timestamp"] = DateTime.UtcNow.ToString("O")
        };
    }
}
```

* Crear el archivo C:\ContosoMicroservices\Contoso.Shared.Core\Extensions\StringExtensions.cs

```
namespace Contoso.Shared.Core.Extensions;

public static class StringExtensions
{
    public static string Truncate(this string value, int maxLength, string suffix = "...")
    {
        if (string.IsNullOrEmpty(value)) return value;
        if (maxLength <= 0) return string.Empty;
        if (value.Length <= maxLength) return value;

        return string.Concat(value.AsSpan(0, maxLength - suffix.Length), suffix);
    }

    public static string Mask(this string value, int visibleChars = 4, char maskChar = '*')
    {
        if (string.IsNullOrEmpty(value)) return value;
        if (value.Length <= visibleChars * 2) return new string(maskChar, value.Length);

        var start = value[..visibleChars];
        var end = value[^visibleChars..];
        var masked = new string(maskChar, value.Length - (visibleChars * 2));

        return $"{start}{masked}{end}";
    }

    public static string ToSlug(this string value)
    {
        if (string.IsNullOrEmpty(value)) return value;

        return value
            .ToLowerInvariant()
            .Replace(" ", "-")
            .Replace("_", "-");
    }
}
```

* Compilo el proyecto

```
dotnet build
```

* Subir al repo

```
cd C:\ContosoMicroservices
git init
git add .
git config --global user.email "User1-65787565@LODSPRODMCA.onmicrosoft.com"
git config --global user.name "User1-65787565"
git commit -m "Initial commit: Contoso.Shared.Core library"
git branch -M main
git remote add origin https://dev.azure.com/<your-org>/Contoso.Microservices/_git/Contoso.Microservices
git push -u origin main
```

> [!NOTE]
> Cambiar el remote por el del portal de devos

* Crear un pipeline azure-pipeline.yml en el proyecto con vscode en la raiz

```
trigger:
  branches:
    include:
      - main
  paths:
    include:
      - Contoso.Shared.Core/**

pool:
  vmImage: 'ubuntu-latest'

variables:
  buildConfiguration: 'Release'
  projectPath: 'Contoso.Shared.Core/Contoso.Shared.Core.csproj'

stages:
- stage: Build
  displayName: 'Build and Pack'
  jobs:
  - job: BuildJob
    displayName: 'Build Library'
    steps:
    - task: UseDotNet@2
      displayName: 'Use .NET 10 SDK'
      inputs:
        packageType: 'sdk'
        version: '10.x'

    - task: DotNetCoreCLI@2
      displayName: 'Restore packages'
      inputs:
        command: 'restore'
        projects: '$(projectPath)'

    - task: DotNetCoreCLI@2
      displayName: 'Build'
      inputs:
        command: 'build'
        projects: '$(projectPath)'
        arguments: '--configuration $(buildConfiguration) --no-restore'

    - task: DotNetCoreCLI@2
      displayName: 'Pack NuGet package'
      inputs:
        command: 'pack'
        packagesToPack: '$(projectPath)'
        configuration: '$(buildConfiguration)'
        packDirectory: '$(Build.ArtifactStagingDirectory)'

    - publish: '$(Build.ArtifactStagingDirectory)'
      artifact: 'nuget-package'
      displayName: 'Publish artifact'

- stage: Publish
  displayName: 'Publish to Azure Artifacts'
  dependsOn: Build
  condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/main'))
  jobs:
  - job: PublishJob
    displayName: 'Push to Feed'
    steps:
    - download: current
      artifact: 'nuget-package'

    - task: NuGetAuthenticate@1
      displayName: 'Authenticate to Azure Artifacts'

    - task: DotNetCoreCLI@2
      displayName: 'Push to contoso-internal feed'
      inputs:
        command: 'push'
        packagesToPush: '$(Pipeline.Workspace)/nuget-package/*.nupkg'
        nuGetFeedType: 'internal'
        publishVstsFeed: 'Contoso.Microservices65787565/contoso-internal65787565'
```

* Subir al repo y ejecutar el pipeline

* Verificamos que el pipeline aparece en la parte de Artifacts

* Crear un nuevo proyecto en la solucion

```
   cd C:\ContosoMicroservices
   dotnet nuget add source https://api.nuget.org/v3/index.json --name nuget.org
   dotnet new webapi --name Contoso.OrderService --framework net10.0 --use-controllers
   dotnet sln add Contoso.OrderService
```

* Crear el nuget.config en la rais

```
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="nuget.org" value="https://api.nuget.org/v3/index.json" />
    <add key="contoso-internal65787565" value="https://pkgs.dev.azure.com/ADOCourseOrg01/Contoso.Microservices65787565/_packaging/contoso-internal65787565/nuget/v3/index.json" />
  </packageSources>
</configuration>
```

* Instalamos el Azure Package Credential Provide

```
iex "& { $(irm https://aka.ms/install-artifacts-credprovider.ps1) }"
```

* Modificar el csproj del OrderService

```xml
<Project Sdk="Microsoft.NET.Sdk.Web">
	<PropertyGroup>
		<TargetFramework>net10.0</TargetFramework>
		<Nullable>enable</Nullable>
		<ImplicitUsings>enable</ImplicitUsings>
	</PropertyGroup>
	<ItemGroup>
		<PackageReference Include="Microsoft.AspNetCore.OpenApi" Version="10.0.2" />
		<PackageReference Include="Contoso.Shared.Core" Version="1.0.0" />
		<ProjectReference Include="..\Contoso.Shared.Core\Contoso.Shared.Core.csproj" />
	</ItemGroup>
</Project>
```

* En ese proyecto agregar un controlador OrdersController.cs

```
using Contoso.Shared.Core.Models;
using Contoso.Shared.Core.Extensions;
using Microsoft.AspNetCore.Mvc;

namespace Contoso.OrderService.Controllers;

[ApiController]
[Route("api/[controller]")]
public class OrdersController : ControllerBase
{
    [HttpGet("{id}")]
    public ActionResult<ApiResponse<OrderDto>> GetOrder(int id)
    {
        if (id <= 0)
        {
            return BadRequest(ApiResponse<OrderDto>.Fail(
                "INVALID_ORDER_ID",
                "Order ID must be a positive number"));
        }

        if (id == 999)
        {
            return NotFound(ApiResponse<OrderDto>.Fail(
                "ORDER_NOT_FOUND",
                $"Order with ID {id} was not found"));
        }

        var order = new OrderDto
        {
            OrderId = id,
            CustomerName = "John Doe",
            CustomerEmail = "john.doe@example.com".Mask(3),
            TotalAmount = 299.99m,
            Status = "Processing",
            Description = "This is a sample order with a very long description that should be truncated".Truncate(50)
        };

        return Ok(ApiResponse<OrderDto>.Ok(order));
    }

    [HttpGet]
    public ActionResult<ApiResponse<List<OrderDto>>> GetOrders()
    {
        var orders = new List<OrderDto>
        {
            new() { OrderId = 1, CustomerName = "John Doe", TotalAmount = 299.99m, Status = "Completed" },
            new() { OrderId = 2, CustomerName = "Jane Smith", TotalAmount = 149.50m, Status = "Processing" }
        };

        return Ok(ApiResponse<List<OrderDto>>.Ok(orders));
    }
}

public class OrderDto
{
    public int OrderId { get; set; }
    public string CustomerName { get; set; } = string.Empty;
    public string? CustomerEmail { get; set; }
    public decimal TotalAmount { get; set; }
    public string Status { get; set; } = string.Empty;
    public string? Description { get; set; }
}
```

----
# Break hasta y 30!
----

# Share Team Knowledge using Azure DevOps Wiki

**Estimated time:** 45 minutes

## Lab Overview

In this lab, you will learn how to create and manage Azure DevOps Wikis, publish repository content as documentation, work with Markdown, add Mermaid diagrams, insert images, and manage wiki revisions.

### Objectives

By the end of this lab, you will be able to:

- Create a Project Wiki
- Publish repository content as a Code Wiki
- Write and format content using Markdown
- Create Mermaid diagrams
- Add images to Wiki pages
- Manage revisions and restore previous versions
- Organize Wiki pages and navigation

---

# Before You Start

You need:

- Microsoft Edge or another supported browser
- An Azure DevOps organization
- An eShopOnWeb project

> If you are using a CloudSlice environment, skip the organization and project creation tasks when instructed.

---

# About Azure DevOps Wikis

Azure DevOps supports two wiki types:

## Project Wiki

A wiki stored independently of source code repositories.

## Code Wiki

A wiki generated from Markdown files stored in a Git repository.

### Key Features

- Markdown support
- Mermaid diagram support
- Image uploads and embedding
- Revision history
- Links to work items, repositories, and wiki pages
- Collaborative editing

---

# Prepare the Repository

## Import the eShopOnWeb Repository

1. Open the project.
2. Navigate to:
   - Repos
   - Files
   - Import Repository
3. Import:

   https://github.com/MicrosoftLearning/eShopOnWeb.git

4. Wait until the import completes.

### Repository Structure

- `.ado` → Azure DevOps Pipelines
- `.azure` → ARM and Bicep templates
- `.devcontainer` → Development container configuration
- `.github` → GitHub workflow definitions
- `src` → Application source code

---

## Set Main as Default Branch

1. Go to:
   - Repos
   - Branches
2. Locate the `main` branch.
3. Open the context menu.
4. Select **Set as default branch**.

---

# Download a Brand Image

1. Navigate to:

   `src/Web/wwwroot/images`

2. Locate:

   `brand.png`

3. Download the file.

You will use this image later in the lab.

---

# Create a Documentation Folder

1. Go to:
   - Repos
   - Files
2. Open the repository menu.
3. Select:
   - New
   - Folder
4. Create:

   `Documents`

5. Create:

   `README.md`

6. Commit the change.

---

# Publish Code as a Wiki

## Create a Code Wiki

1. Navigate to:
   - Overview
   - Wiki
2. Select **Publish code as wiki**.
3. Configure:

| Setting | Value |
|----------|----------|
| Repository | eShopOnWeb |
| Branch | main |
| Folder | /Documents |
| Wiki Name | eShopOnWeb (Documents) |

4. Select **Publish**.

---

# Create Wiki Content

Create a page called:

**Welcome to our Online Retail Store!**

Paste:

## Welcome to Our Online Retail Store!

At our online retail store, we offer a **wide range of products** to meet the **needs of our customers**.

Our selection includes everything from *clothing and accessories to electronics, home decor, and more*.

We pride ourselves on providing a seamless shopping experience.

Benefits of shopping with us:

1. User-friendly experience
2. Easy navigation
3. Fast product discovery
4. Convenient purchasing process

We also offer a range of **payment and shipping options**.

### About the Team

Our team is dedicated to providing exceptional customer service.

### Physical Stores

| Location | Area | Hours |
|-----------|-----------|-----------|
| New Orleans | Home and DIY | 07:30-21:30 |
| Seattle | Gardening | 10:00-20:30 |
| New York | Furniture Specialists | 10:00-21:00 |

## Our Store Qualities

- High quality products
- Affordable prices
- Trusted suppliers
- Strict quality standards
- Frequent promotions and discounts

# Summary

Thank you for choosing our online retail store.

We look forward to serving you.

---

# Create a Project Wiki

1. Open **Wiki**.
2. Open the Wiki selector.
3. Select **Create new project wiki**.
4. Create a page called:

   Project Design

5. Add:

# Authentication and Authorization

## Azure DevOps OAuth 2.0 Authorization Flow

---
# Break hasta y 15
---

# Laboratorio: Azure Load Testing con Azure DevOps

## Objetivo

Desplegar la aplicación eShopOnWeb en Azure App Service y validar su rendimiento utilizando Azure Load Testing.

## Preparación

- Crear o utilizar el proyecto Azure DevOps **eShopOnWeb**.
- Importar el repositorio de eShopOnWeb.
- Configurar **main** como rama predeterminada.

## Infraestructura Azure

Crear:

- Resource Group: az400m08l14-RG
- App Service Plan: az400l14-sp
- Web App: az400eshoponwebXXXXX

Verificar que la aplicación sea accesible desde el navegador.

## Pipeline CI/CD

Crear un pipeline YAML con dos etapas:

### Build

- Restore
- Build
- Publish
- Publicar artefactos

### Deploy

- Descargar artefactos
- Azure App Service Deploy
- Desplegar en la Web App

Configurar:

- Tipo: Web App on Windows
- Aplicación: az400eshoponwebXXXXX
- Entorno: Development
- Base de datos en memoria

Ejecutar el pipeline y verificar que la aplicación quede publicada correctamente.

## Azure Load Testing

Crear un recurso Azure Load Testing:

- Nombre: eShopOnWebLoadTesting-XXXXX
- Resource Group: az400m08l14-RG

## Prueba de Carga

Crear una prueba URL-based:

- URL: Web App desplegada
- Tipo: Virtual Users
- Usuarios: 50
- Duración: 5 minutos
- Ramp-Up: 1 minuto

Ejecutar la prueba.

## Análisis de Resultados

Revisar:

- Total de solicitudes
- Throughput
- Tiempo de respuesta (P90)
- Duración
- Porcentaje de errores

Identificar el comportamiento de la aplicación bajo carga.

## Conceptos Aprendidos

- Despliegue de aplicaciones con Azure Pipelines
- Creación de recursos Azure Load Testing
- Ejecución de pruebas de carga con usuarios virtuales
- Análisis de métricas de rendimiento
- Evaluación de capacidad y tiempos de respuesta de una aplicación web

<img width="579" height="476" alt="image" src="https://github.com/user-attachments/assets/fe417fbd-10c4-4dbc-8955-d2aa60c15d75" />
