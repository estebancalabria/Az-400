# Clase Seis - 30 de Septiembre del 2026

# Repaso

* Github Actions
  * Usamos los pipielines de Github como alternativa a los Azure Devops
  * Sintaxis del Yaml en Github Actions (Que es distinta a la de Azure Devops)
  * Creacion del Service Pricipal en Azure
    * La autenticacion de Github -> Azure
  * Creacion de un Secreto en Gihub
  * Ejecucion de Pipeline en Github Actions
* Despliegue Azure
  * Pipepline Despliegue en Azure
  * Project Settings -> Service Connection
  * Contenedores Docker
  * Temas con las Policy del Laboratorio
 
# Despliegue rapido en Github

* Vamos a ver atentamente las instrucciones del LAB para evitar las policies

* Chequeo el portal y el aex.dev.azure.com

* Crear el RG de Azure usando las instrucciones del LAB

<img width="353" height="319" alt="image" src="https://github.com/user-attachments/assets/6a2191a5-54a5-452c-876c-34030a45ab32" />

* Importar el eshoponweb

* Crear el service connection siguiendo las instrucciones de lab

* Darle el rol del LOD_OWNER al service connection sobre la subscripcion de Azure

* Cargar el pipeline .ado/eshoponweb-ci-docker.yml
  * Modifica el SubscriptionID, RG Name y region de acuerdo a las instrucciones del lab
  * Ejecutar el pipeline
 
* Ahora si!

<img width="194" height="303" alt="image" src="https://github.com/user-attachments/assets/30a58075-4758-4da9-b478-ac04573dad80" />

* Luego vamos a Azure y confirmamos que esta el Container Registry y la imagen subida

<img width="788" height="317" alt="image" src="https://github.com/user-attachments/assets/bbd2bb34-0e73-4e79-a4d8-61da74800730" />

* Ahora hacemos lo mismo para el pipeline de despliegue(CD) .ado/eshoponweb-cd-webapp-docker.yml

* Verificamos luego en App Service que de desplego la APP y que la puedo ver en mi navegador

---
BREAK
HAsta y 15
---

# Release Gates

* Se utilizan cuando en el proceso de despliegue se debe hacer chequeos manuales (o automaticos) antes de continuar
 * Manuales : Un usuario tiene que aprobar el despliegue
 * Automatico : Mirar unos logs de aplicacion verificando que no hay erroes
   * Invoke Azure Function: Trigger execution of an Azure Function and ensure successful completion
   * Query Azure Monitor alerts: Observe configured Azure Monitor alert rules for active alerts
   * Invoke REST API: Make a call to a REST API and continue if it returns a successful response
   * Query work items: Ensure the number of matching work items returned from a query is within a threshold

* Vamos a inciiar el laboratorio

* Chequeamos que este el proyecto y el recurso de Azure

* Crear el service connection

* Importar el repo de git
  * https://github.com/MicrosoftLearning/eShopOnWeb.git
  * Pasarnos al branch main y setear el bach main como default
 
 * Project Settings -> Pipelines -> Sevice Connection -> Create Service Connection
    * Name: azure subs
    * El resto todo por defecto
  
* Ejecutar el pipeline de CI : .ado/eshoponweb-ci.yml

* Abrir un CLI de bash en el portal de Azure

* Seteamos variables. (Copiarlas del lab)
```
REGION='westus2'
RESOURCEGROUPNAME='az400m03l08-RG'
```

* Creo el App Service Plan

```
SERVICEPLANNAME='az400m03l08-sp1'
az appservice plan create -g $RESOURCEGROUPNAME -n $SERVICEPLANNAME --sku S1 --location $REGION
```

* Verificar la creacion del plan en otra solapa del portal de Azure

* Crear dos App Service, una prod y otra test

```
SUFFIX=65714603
az webapp create -g $RESOURCEGROUPNAME -p $SERVICEPLANNAME -n RGATES$SUFFIX-DevTest --runtime "DOTNETCORE:9.0"
az webapp create -g $RESOURCEGROUPNAME -p $SERVICEPLANNAME -n RGATES$SUFFIX-Prod --runtime "DOTNETCORE:9.0"
```

* Crear un recurso de Application Insights (log de la aplicacion) con el mismo nombre de la app de test

<img width="514" height="328" alt="image" src="https://github.com/user-attachments/assets/c5b32190-5af8-4899-9e02-551832f1bd2b" />

* Ir a la Web App de test  asociarla con el Application Insights
 * App Services -> App de Dev/Test -> Monitoring -> Application Insights -> "Turn On application Insights" -> Asociar con el recurso que creamos antes

* Activamos la alerta en el Application Insights
 * Application Insights -> (Elegimos la unica que tenemos) -> Monitoring -> Alerts -> "Create Alert Rule"
   * In the Condition section, select See all signals Type Requests and from the results, select Failed Requests
       * In the Condition section, leave Threshold set to Static and validate these defaults:
          * Aggregation Type: Count
          * Operator: Greater Than
          * Unit: Count
          * In the Threshold value textbox, type 0  
    * En actions le pongo None
    * En details le ponemos
      * Name  : RGATESDevTest_FailedRequests (El nombre del lab)
      * Tipo : Warning
  * Review and Create

* En el portal de devops -> Proyecto -> Pipeline -> Releases -> New
  * Elegir el template Azure App Service Deployment
  * El paso 1 se tiene que llamar DevTest luego cerramos popup
  * Cambiamos el nombre al pipeline como eshoponweb-cd
  * Clonar el paso de DEvTest y ponerle el nombre Production
  * Agregar el artefacto que viene del pipeline de CI que ejecutamos antes

<img width="352" height="377" alt="image" src="https://github.com/user-attachments/assets/9bbda46c-a496-4b3f-89ac-20a5749d6b28" />

* HAcer click en el rayido de artifacts y a habilitar el primer chechk

<img width="349" height="265" alt="image" src="https://github.com/user-attachments/assets/8267e03d-7d4d-4c6c-b5d6-25166c059de2" />

* Configurar el paso 1 de devTest

<img width="793" height="299" alt="image" src="https://github.com/user-attachments/assets/7023c982-7144-41ec-bd9e-b0ffdb73d5a8" />


* Despues voy a Deploy on AppService
  * Cambiarle Package Folder (copiarlos del lab)
     * $(System.DefaultWorkingDirectory)/**/Web.zip
  * Cambiarle app Settings (copiarlos del lab)
     * -UseOnlyInMemoryDatabase true -ASPNETCORE_ENVIRONMENT Development

<img width="792" height="365" alt="image" src="https://github.com/user-attachments/assets/e4f9194f-0717-4ca3-a484-c41808bdf783" />

* Similar ahora para el despliegue a produccion

* Save All

* Vamos a ejecutar el pipeline de CI que si esta ok deberia disparar solo el pipeline de CD que definimmos

<img width="355" height="300" alt="image" src="https://github.com/user-attachments/assets/23c92826-be7c-44c2-b20d-078a487e9848" />

(Completo esta parte de las instrucciones porque no llegue a completar(
---

## Test the release pipeline

In the Pipelines section, select Pipelines

Select the eshoponweb-ci build pipeline and then select Run Pipeline

Set Branch/tag to main and otherwise accept the default settings and select Run to trigger the pipeline

Wait for the build pipeline to finish

Note: After the build succeeds, the release will be triggered automatically and the application will be deployed to both environments.

In the Pipelines section, select Releases

On the eshoponweb-cd pane, select the entry representing the most recent release

Track the progress of the release and verify that deployment to both web apps completed successfully

Switch to the Azure portal, navigate to the az400m03l08-RG resource group

Select the DevTest web app, then select Browse

Verify that the web page loads successfully in a new browser tab

Repeat for the Production web app

Close the browser tabs displaying the EShopOnWeb web site

Configure Release Gates
You'll set up Quality Gates in the release pipeline.

Configure pre-deployment gates for approvals
In the Azure DevOps portal, open the eShopOnWeb project

In Pipelines > Releases, select eshoponweb-cd and then Edit

On the left edge of the DevTest Environment stage, select the oval shape representing Pre-deployment conditions

On the Pre-deployment conditions pane, set the Pre-deployment approvals slider to Enabled

In the Approvers text box, type and select your Azure DevOps account name

Note: In a real-life scenario, this should be a DevOps Team name alias instead of your own name.

Save the pre-approval settings and close the popup window

Select Create Release and confirm by pressing Create

Notice "Release-2" has been created. Select the "Release-2" link to navigate to its details

Notice the DevTest Stage is in a Pending Approval state

Select the Approve button to trigger the DevTest Stage

Configure post-deployment gates for Azure Monitor
Back on the eshoponweb-cd pane, on the right edge of the DevTest Environment stage, select the oval shape representing Post-deployment conditions

Set the Gates slider to Enabled

Select + Add and select Query Azure Monitor Alerts

In the Query Azure Monitor Alerts section:

Azure subscription: Select the service connection representing your Azure subscription
Resource group: Select az400m03l08-RG
Expand the Advanced section and configure:

Filter type: None
Severity: Sev0, Sev1, Sev2, Sev3, Sev4
Time Range: Past Hour
Alert State: Acknowledged, New
Monitor Condition: Fired
Expand Evaluation options and configure:

Time between re-evaluation of gates: 5 Minutes
Timeout after which gates fail: 8 Minutes
Select On successful gates, ask for approvals
Note: The sampling interval and timeout work together so that gates will call their functions at suitable intervals and reject the deployment if they don't succeed within the timeout period.

Close the Post-deployment conditions pane

Select Save and in the Save dialog box, select OK

Test Release Gates
You'll test the release gates by updating the application and triggering a deployment.

Generate alerts and test the release process
From the Azure Portal, browse to the DevTest Web App resource

From the Overview pane, notice the URL field showing the web application hyperlink

Select this link to open the eShopOnWeb web application

To simulate a Failed Request, add /discount to the URL, which will result in an error since that page doesn't exist

Refresh this page several times to generate multiple events

From the Azure Portal, search for Application Insights and select the DevTest-AppInsights resource

Navigate to Alerts

There should be at least 1 new alert with Severity 2 - Warning showing up

Note: If no Alert shows up yet, wait another few minutes.

Return to the Azure DevOps Portal and open the eShopOnWeb Project

Navigate to Pipelines > Releases and select eshoponweb-cd

Select the Create Release button

Wait for the Release pipeline to start and approve the DevTest Stage release action

Wait for the DevTest release Stage to complete successfully

Notice how the Post-deployment Gates switches to Evaluation Gates status

Select the Evaluation Gates icon

For Query Azure Monitor Alerts, notice an initial failed state

Let the Release pipeline remain in pending state for the next 5 minutes

After 5 minutes pass, notice the 2nd evaluation failing again

This is expected behavior, since there's an Application Insights Alert triggered for the DevTest Web App.

Note: Since there's an alert triggered by the exception, Query Azure Monitor gate will fail. This prevents deployment to the Production environment.

Wait a couple more minutes and validate the status of the Release Gates again

Within a few minutes after the initial Release Gates check, since the initial Application Insight Alert was triggered with "Fired" action, it should result in a successful Release Gate, allowing deployment to the Production Release Stage

Note: If your gate fails, close the alert in Azure Monitor.
