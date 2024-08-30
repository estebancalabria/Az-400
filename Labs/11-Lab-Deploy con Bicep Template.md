# 🌐 Laboratorio: Despliegue de una Aplicación en Azure con Bicep y Azure DevOps

## Resumen de Pasos

1️⃣ **Crear el Resource Group en Azure**  
2️⃣ **Crear el Proyecto en Azure DevOps**  
3️⃣ **Importar el Proyecto `eShopOnWeb` en Azure DevOps**  
4️⃣ **Crear un Service Principal en Azure con Azure CLI**  
5️⃣ **Crear el Service Connection en Azure DevOps**  
6️⃣ **Actualizar el Billing o Configurar el Agente**  
7️⃣ **Crear localmente un archivo `.bicep` para desplegar una aplicación en Azure**  
   7.1 **Instalar la extensión de VS Code para escribir Bicep**  
   7.2 **Crear el archivo `deploy-webapp.bicep`**

   ***Opción 1: En Linux***

   ```bicep
   resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
     name: 'Plan-B1'
     location: resourceGroup().location
     properties: {
       reserved: true
     }
     sku: {
       name: 'B1'
       tier: 'Basic'
     }
   }

   resource appService 'Microsoft.Web/sites@2020-06-01' = {
     name: 'az400c114trainner2'
     kind: 'app'
     location: resourceGroup().location
     properties: {
       serverFarmId: appServicePlan.id
       siteConfig: {
         linuxFxVersion: 'DOTNETCORE|8.0'
         appSettings: [
           {
             name: 'ASPNETCORE_ENVIRONMENT'
             value: 'Development'
           }
           {
             name: 'UseOnlyInMemoryDatabase'
             value: 'true'
           }
         ]
       }
     }
   }
   ```

   ***Opción 2: Windows***

   ```bicep
   resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
     name: 'Plan-Win-B1'
     location: resourceGroup().location
     sku: {
       name: 'B1'
     }
     kind: 'app'
   }

   resource appService 'Microsoft.Web/sites@2020-06-01' = {
     name: 'az400c114trainnerwin'
     location: resourceGroup().location
     kind: 'app'
     properties: {
       serverFarmId: appServicePlan.id
       reserved: true
       siteConfig: {
         windowsFxVersion: 'DOTNETCORE|8.0'
         appSettings: [
           {
             name: 'ASPNETCORE_ENVIRONMENT'
             value: 'Development'
           }
           {
             name: 'UseOnlyInMemoryDatabase'
             value: 'true'
           }
         ]
       }
     }
   }
   ```

8️⃣ **Crear un pipeline para desplegar la aplicación en un App Service**

   ***Archivo YAML del Pipeline***

   ```yaml
   
   trigger:
   - main

   pool:
     name: Local

   steps:
     - task: DotNetCoreCLI@2
       displayName: Restore
       inputs:
         command: 'restore'
         projects: '**/*.sln'
         feedsToUse: 'select'

     - task: DotNetCoreCLI@2
       displayName: Build
       inputs:
         command: 'build'
         projects: '**/*.sln'
     
   #  - task: DotNetCoreCLI@2
   #    displayName: Test
   #    inputs:
   #      command: 'test'
   #      projects: 'tests/UnitTests/*.csproj'
     
     - task: DotNetCoreCLI@2
       displayName: Publish
       inputs:
         command: 'publish'
         publishWebProjects: true
         arguments: '-o $(Build.ArtifactStagingDirectory)'
     
     - task: PublishPipelineArtifact@1
       displayName: Publish Artifacts ADO - Website
       inputs:
         targetPath: '$(Build.ArtifactStagingDirectory)'
         artifact: 'Website'
         publishLocation: 'pipeline'

   #  - task: PublishPipelineArtifact@1
   #    displayName: Publish Artifacts ADO - Bicep
   #
   #    inputs:
   #      targetPath: '$(Build.SourcesDirectory)/infra/webapp.bicep'
   #      artifact: 'Bicep'
   #      publishLocation: 'pipeline'

     - task: AzureResourceManagerTemplateDeployment@3
       displayName: Crear app Service con Bicep
       inputs:
          deploymentScope: Resource Group
          azureResourceManagerConnection: AzureRM
          subscriptionId: '91dc3067-fd7a-4ed3-95eb-8c938f69cbfe'
          action: Create Or Update Resource Group
          resourceGroupName: Rg-Az400-Clase-Once
          location: eastus
          templateLocation: 'Linked artifact'
          csmFile: 'deploy-webapp.bicep'
          deploymentMode: Incremental
          deploymentOutputs: 'asp-json'


     - task: AzureRmWebAppDeployment@4
       inputs:
         ConnectionType: 'AzureRM'
         azureSubscription: 'AzureRM'
         appType: 'webApp'
         ResourceGroupName: Rg-Az400-Clase-Once
         WebAppName: 'az400c114trainner'
         packageForLinux: '$(Build.ArtifactStagingDirectory)/**/Web.zip'
         AppSettings: '-UseOnlyInMemoryDatabase true -ASPNETCORE_ENVIRONMENT Development'
   ```

9️⃣ **Verificar que la app funcione en Azure**


