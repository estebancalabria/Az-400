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
