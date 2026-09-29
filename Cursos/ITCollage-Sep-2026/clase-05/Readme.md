# Clase Cinco - 29 de Septiembre de 2025

# Repaso

* Pipelines
  * Pipelines Self-Hosted
    * Creacion de Agent Pools
  * Creacion Manual Pipelines
    * Ayuda de Copilot
    * Sintaxis YAML
      * Tasks
* Obtencion del PAT
* Crecion de Work Items por HTTP

---

# Github Actions

## Requisitos

* Crear una Cuenta en Github

# Laboratorio

## Importar repositorio

* Importar repositorio
  * https://github.com/new/import
    * 	https://github.com/MicrosoftLearning/eShopOnWeb
    * 	eShopOnWeb
    * 	Public

<img width="610" height="398" alt="image" src="https://github.com/user-attachments/assets/5dfcf699-976f-41b2-8dd6-ba7de70b3aa0" />


## Entender el entorno

* Darle un vistazo a este pipeline
  * https://github.com/<USUARIO_GITHUB>/eShopOnWeb/blob/main/.github/workflows/eshoponweb-cicd.yml
    * Podemos usar nuestro asistente de IA favorito para que lo explique paso a pasao : "Eplicame este pipeline paso a paso. Explicame un paso y espera que lo entienda antes del siguiente ""
    * El pipeline tiene
      * Workflow (todo el archivo)
        * Job (buildandtest, deploy)
          * Step (cada tarea dentro de un job)
  * https://github.com/<USUARIO_GITHUB>/eShopOnWeb/blob/main/infra/webapp.bicep
    * Tambien podemos pedirle a la IA que explique : "Expliame que hace esto "https://github.com/estebancalabria/eShopOnWeb/blob/main/infra/webapp.bicep"
* Chusmear el portal de Azure
  * Ver los Resource Groups
      * Tiene que estar creado el RG "rg-eshoponweb"
      * Copiar el nombre de RG
  * Ver los App Serivce
      * Mirar que hay que completar al crear un app service
  * Ver los App Service Planes
  * Ver las subscripciones en mi caso
    * Ignite-lod53240021
    * xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
    * Copiar el ID de subscripcion al Bloc de Notas
  * Ver el entra ID y copiar el ID del tennant en el bloc de notas
    * xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

# Creacion del Service Principal

* Vamos a crearle un usuario (service Principal) a Github para que se pueda autenticar en AZURE y pueda crear la webapp segun lo dice el archivo webapp.bicep

* Vamos al portal de Azure y abrimos el CLI

<img width="527" height="178" alt="image" src="https://github.com/user-attachments/assets/63b26b74-6749-44db-b40c-6830c4c6cdda" />

```
az ad sp create-for-rbac --name GH-Action-eshoponweb --role contributor --scopes /subscriptions/<SUBSCRIPTION-ID>/resourceGroups/<RESOURCE-GROUP> --sdk-auth
```

* Reemplazar <SUBSCRIPTION-ID> por el ID de subscripcion que copiamos en el bloc de notas previamente
* Reemplazar <RESOURCE-GROUP> por el nombre del unico RG que tenemos
* Cambiar tambien el nombre (GH-Action-eshoponweb) yo use GH-Action-eshoponweb-4trainner porque seguro exite

* Esto devuelve un json que copiamos en el bloc de notas

```
{
  "clientId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "clientSecret": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "subscriptionId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "tenantId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}
```

* Por si las moscas poner luego este comand

```
az provider register --namespace Microsoft.Web
```

# Darle ese usuario en Github

* Ver que archivo https://github.com/<USUARIO_GITHUB>/eShopOnWeb/blob/main/.github/workflows/eshoponweb-cicd.yml incluye un secreto que se llama AZURE_CREDENTIALS

```
#Login in your azure subscription using a service principal (credentials stored as GitHub Secret in repo)
      - name: Azure Login
        uses: azure/login@v2
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS }}
```

* Vamos a Settings -> Secrets and Variables -> Actions
  * Crear un secreto nuevo llamado AZURE_CREDENTIALS
  * Como el contenido del secreto pegal el json que nos devolvio la creacion del service principal en el CLI de Azure

# Modificar el archivo del Pipeline

* Ubicar el archivo https://github.com/<USUARIO_GITHUB>/eShopOnWeb/blob/main/.github/workflows/eshoponweb-cicd.yml

* Desomentar linea 4 queda asi

```
#Triggers (uncomment line below to use it)
on: [push, workflow_dispatch]
```

* Modificamos la linea 8,11, 12

```
#Environment variables https://docs.github.com/en/actions/learn-github-actions/environment-variables
env:
  RESOURCE-GROUP: rg-eshoponweb
  LOCATION: westeurope
  TEMPLATE-FILE: infra/webapp.bicep
  SUBSCRIPTION-ID: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
  WEBAPP-NAME: eshoponweb-webapp-4trainner
```

* Le dejamos el nombre del RG que tenemos, el ID de subscripcion que copiamos en el bloc de notas y en WEBAPP-NAME cada uno pone un nombre

* Darle commit

# Verificar la ejecucion del Pipeline

* Ir a actions

<img width="658" height="365" alt="image" src="https://github.com/user-attachments/assets/58e9ec7c-6a71-41ff-a652-6c889cb78e8c" />

<img width="664" height="301" alt="image" src="https://github.com/user-attachments/assets/73a7e8e9-7ef6-49f5-b738-260cb4a0f8a4" />

<img width="665" height="338" alt="image" src="https://github.com/user-attachments/assets/00a8c00d-1695-4543-b3e2-ab3904ea28d5" />


---
# Break
# HAsta las 11
---

# Azure desde Devops

## Setup del proyecto

* Vamos a hacer algo parecido pero desde un pipeline de devops
 * Crear recursos de Azure desde el portal de devops
 * Probablmente tambien tengamos algun problmea con las Policies

* Ir al portal de Devops, ir al proyecto e importar el repo
  * https://github.com/MicrosoftLearning/eShopOnWeb.git

* Pararnos en el branch main
* Definir al branch main como mi branch principal

## Enterder el entorno

* Vamos a revisar
 * .ado/eshoponweb-ci-docker.yml
 * Lo miramos
 * Usamos la IA para explicarlo

* Explicacion
 * En docker uno crea una imagen de su aplicacion para desplegar
 * Un docker registry es un lugar donde se suben las imagenes de docker
    * Docker Hub es un repositorio publico de imagenes https://hub.docker.com/
    * Las imagenes nuestras se suben a un repositorio de imagenes privado en azure (ACR)
  * En Azure en el portal vamos a bucar la opcion "Container Registries"

* Mirar el archivo infra/acr.bicep

* La idea es ejecutar el pipeline .ado/eshoponweb-ci-docker.yml para que cree un ACR utilizando el template bicep infra/acr.bicep

* Vamos en Azure a Sucbriptions
  * Copiar el id de subscripcion en el bloc de notas

## Conectar Devops a Azure

* Crear en Azure el Resource Group (RG)
  * Name: rg-eshoponweb

<img width="304" height="353" alt="image" src="https://github.com/user-attachments/assets/5ce1c854-e296-4b3f-9dd4-df32bf0c19a9" />

* Vamos a crear un Service Connection
 * Es una conexion entre Devops y Azure
 * Project Settings -> Pipelines -> Service Connections -> "Create Service Connection"
   * Azure Resource Manager
   * Elegimos el RG que acabamos de crear
   * Le damos un nombre al service connectio en mi caso : azure-service-connection

* Antes de continuar necesitamos
  * Nombre del RG
  * Ubicacion del RG
  * ID de la subcripcion
  * Nombre del service Connection

# Ejecutar el Pipelin de CI

* Este pipeline deberia crear en Azure el ACR y subir una imagen de mi app
  * Vamos a ver si anda por el tema de las policies
 
* Crear un pipeline Nuevo
  * Elegimos el pipeline existente "/.ado/eshoponweb-ci-docker.yml"
 
* Cambiamos lo que dice en variables

```
variables:
  azureServiceConnection: 'azure subs'
  subscriptionId: 'YOUR-SUBSCRIPTION-ID'
  resourceGroup: 'rg-az400-container-NAME'
  location: 'centralus'
```

* Save and Run

> [!NOTE]
> Tal vez falla por policy

* PAra que no nos molesten las policies ver bien las instrucciones del lab

<img width="883" height="181" alt="image" src="https://github.com/user-attachments/assets/3a63588e-0942-4d67-a8ce-b27645e94462" />


---
# Break
# Hasta y 20
---
