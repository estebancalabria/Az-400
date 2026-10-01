# Clase 08 - 01 de Octubre del 2026

# Repaso

* Despliegue en Azure
  * Miramos las instrucciones de lab
  * Usamos los checkeos de lab
* Azure
  * Creamos recursos desde el CLI
    * Creamos el App Service Plan y App Service
  * Creamos el Application Insights
    * Creamos Alert Rule
* Devops
  * Creamos el service connection
  * Le dimos permiso sonre la subscripcion
* Release Gates
  * (cambio repo) -> (disparaba pipeline ci) -> (generacion artefactos) -> (trigger generacion release pipieline) -> (release gate)
  * Pre y Post deployment Gates
  * Gates
    * Query Azure Monitor Alerts
    * Query work Items
    * Api rest
    * Azure Function
    * Aprobacion Manual

---

# Manejo de Secretos con Key Vault

* Lab
  * https://microsoftlearning.github.io/AZ400-DesigningandImplementingMicrosoftDevOpsSolutions/Instructions/Labs/AZ400_M04_L10_Integrate_Azure_Key_Vault_with_Azure_DevOps.html

* Importar el Repo
  * https://github.com/MicrosoftLearning/eShopOnWeb.git
* Crear el Service Connections
  * Name : azure subs
  * Resource Group :  AZ400-EWebShop
  * Check : Grant access permission to all pipelines
 
* Una vez creado ir al "Manage app Registration" del service connection y copiar el nombre
  * En este caso : ADOCourseOrg01-eShopOnWeb-65753882-618d2dec-4449-4ea3-809d-24f16f52f538
  * Con esta Identity le vamos a dar permiso a un pipeline para acceder a la Key Vault
 
* Crear un Key vault en el portal
  * Basic
    * Name : ewebshop-kv-65753882
    * Location : eastus
    * Pricing : Standard
    * Days to retain deleted vaults :	7
  * Access Configuration
    * Check Vault Access Policy
   
* Darle permiso a la Identity del Service connection sobre el Key Vault
  * (key Vault) -> Acess Policy -> Create Access Policy
    * Persmiso
      * Check Get y List sobre secretos
    * Principal
      * Elegir el del service connection
        * ADOCourseOrg01-eShopOnWeb-65753882-618d2dec-4449-4ea3-809d-24f16f52f538
    * Crear el Permiso

* Crear un Secreto
  * (Key Vault) -> Object -> Secrets -> Generate
    * Name : Passs
    * Valor : "Ken Sent Me"
   
* Crear una variable group en devops
  * (devops) -> (Proyecto) -> Pipeline -> Library -> Create Variable Group
    * Name : eshopweb-vg
    * Check : Link to Azure Key Vault
      * Elegir el service connection
      * Elegir el key Vault
      * +Add
        * Elegir el secreto del desplegable
       
* Crear un pipeline para leer la variable
  * Elegimos el Repo
  * Starter Pipeline

* Copiaos y corregimos este codigo
```
trigger: none

variables:
- group: <VARIABLE GROUP CREADP>

pool:
  vmImage: ubuntu-latest

steps:

- script: |
    echo "El pipeline logró recuperar el secreto."
    echo "Contenido del secreto:"
    echo "$(<SECRETO>)"
  displayName: "Mostrar secreto"

- bash: |
    if [ -n "$(<SECRETO>)" ]; then
      echo "Secreto recuperado correctamente"
    else
      echo "Secreto vacío"
    fi
   displayName: "Verificar Recuperar Secreto"

- bash: |
    echo "Longitud: ${#<SECRETO>}"
  env:
    PASSS: $(<SECRETO>)
  displayName: "Mostrar Longitud secreto"
```

> [!NOTE]
> El secreto no se muestra por la pantalla, sale con *** por un tema de seguridad

* Save and Run
  * La primera vez que ejecuto el pipeline darle "Permit"

---
# BREAK
HAsta y 25
----
          
# Feature Flags

* Importar el proyecto

* Crear el service connection

* Chequear la region a utilizar en el laboratorio de Skillable
  * Probar con westus2
 
* Ejecutar el pipeline basico de CI que viene
   * \.ado\eshoponweb-ci.yml

* Renombrar el pipeline como eshoponweb-ci

* Verificar los artefactos generados y guardados en la ejecucion del pipeline

 <img width="440" height="186" alt="image" src="https://github.com/user-attachments/assets/2fc3a08f-f927-40d5-b3fc-035f96d0540b" />

* Vamos a ejecutar el pipeline de cd para hacer deploy de una webapp en azure
  * \.ado\eshoponweb-cd-webapp-code.yml

* Actualizar las variables del pipeline anteior de cd de acuerdo a las instrucciones de lan

```yaml
variables:
  resource-group: 'AZ400-RG1'
  location: 'westus2'
  templateFile: 'webapp.bicep'
  subscriptionid: 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
  azureserviceconnection: 'azure subs'
  webappname: 'az400-webapp-65756324'
  # webappname: 'webapp-windows-eshop'
```

* Save and Run
 * Renombrar el pipeline a eshoponweb-cd-webapp-code

* Vamos a ver si publico en el portal de azure

* Crear servicio App Configuration
  * In the Azure portal, search for App Configuration and select Create app configuration
  * Select the same Resource Group you used for the App Service deployment earlier
  * Specify the same location you used for the App Service deployment for the app configuration resource
  * Enter name: appcs-65756324
  * Select the Standard pricing tier for this lab (required for feature flags)
  * Click Next: Access settings and select Enable Access Keys under Authentication type
  * Select Pass-through (Recommended) as Authentication Method

* Crear un feature flag
 * In the left pane of the App Configuration service, select Feature manager
 * Select Create:
    * What will you be using your feature flag for: Switch
    * Enable feature flag: toggle to enable
    * Feature flag name: SalesWeekend
    * Key: .appconfig.featureflag/SalesWeekend (Gets filled automatically)
    * Label: leave empty
    * Description: Enables the SalesWeekend promotion banner
 * Confirm the creation with Review + Create and once more Create

<img width="530" height="350" alt="image" src="https://github.com/user-attachments/assets/b7f1d84e-1e76-4a70-92f8-ffb76f299d0c" />
 
* Asociar el App Configuration con la Webapp
   * En el App Services crear el managed identity
      * In the Azure Portal, App Services, go to the WebApp you deployed earlier
      * From Settings / Identity, System Assigned tab, click the Status toggle to On
      * Click Save to save the changes
      * Confirm the popup message enable system assigned managed identity with Yes
      * Wait for the Object (principal) ID to get created
   * En el App configuration le vamos a dar permiso para que pueda ser leido por el app service
   * In the Azure Portal, App Services, go to the WebApp you deployed earlier
      * From Settings / Identity, System Assigned tab, click the Status toggle to On
      * Click Save to save the changes
      * Confirm the popup message enable system assigned managed identity with Yes
      * Wait for the Object (principal) ID to get created
      * Navigate to the App Configuration resource, Access Control (IAM) tab
      * Click Add+ / Add Role Assignment
      * In the Search by role name, description, permission, or ID, field, search for App Configuration Data Reader and select it
      * in the Add Role Assignment page / Members tab, Assign Access To, select Managed Identity
      * click the + Select Members link, which opens the Select Managed Identities blade
      * Under Managed Identity, select App Service (x), and select your App Service Identity
      * Confirm by clicking Select
      * Confirm by clicking Review + Assign twice
      * You can validate the RBAC permission, by navigating back to the Access Control (IAM) tab of the App Configuration resource, select Role Assignments and search/filter on App Configuration. This will show the App Configuration Data Reader role, and your App Service Managed Identity
       
* Copiar el endpoint del app configuration en overview
  * https://appcs-65756324.azconfig.io
 
* Crear dos variables de entorno en el App Service para conectar ambos servicios
* In this step, you'll define several App Service Environment Variables to connect to Azure App Configuration.
  * In the Azure Portal, go to your deployed App Services Web App
  * Navigate to Settings / Environment Variables
  * Notice a few Variables are already defined; don't make any changes to the values or parameters
  * Click + Add, to create the following 2 new variables:
  * Note: use the "Show Values" option (the eye icon) to unhide the characters while typing
     * Name: AppConfigEndPoint
     * Value: The URL of the App Configuration resource, including https:// (_https://%yourappconfigname%.azconfig.io)
     * Name: UseAppConfig
     * Value: true
   
* Ejecutar la app con y sin el feture flag para ver como aparece o desaparce el mensaje

---
# Break
Hastaa y 10
----
