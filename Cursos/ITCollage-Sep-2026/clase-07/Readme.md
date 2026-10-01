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

* Save and Run
  * La primera vez que ejecuto el pipeline darle "Permit"

---
# BREAK
HAsta y 25
----
          
