# Clase Tres - 25 de Septiembre del 2026

# Repaso

* Azure Dashboards
* MarketPlace
* Poject Settigs / Organization Settigs
* Proceso de Compilacion
  * En .NET
    * Restore -> Bajar las dependencias
    * Build -> Compilar fuentes
    * Test -> Ejecutar test
* Pipieline
  * Se escriben en YAML
  * Modos de Ejecucion
    * Self-Hosted
    * Microsoft Hosted
      * Me cobran los recursos compputacionales
* Azure
  * Plataorma
  * Creacion Fallida de la VM
  * Politcy

---

# Pipeline Self Hosted

## Crear Agent Pool y Descargar Agente

* Vamos a ejecutar el pipeline en la virtual de Skillable
* Entrar a la maquina virtual del LAB
* Crear la carpeta c:\agent
* Abrie el edge y loguearnos a devops en la virutal
* En la virtual vamos a ir al Proyecto
    * Proyect Settings -> Pipelines -> Agent Pools
      * Add Pools -> Self Hosted
        * Name : vm-lab-4trainner
        * Check Grant access pemissio to all pipelines
    * Elegimos el que acabamos de crear y le damos new agent
    * Descargamos el agente
    * Descomprimirlo e la carpeta c:\agents

## Obtener un PAT (Personal Access Token)

* Es una clave que permtie a otro programa (como el agente) autenticarse dentro de nuestro azure devops
* Ir a User Settings -> Personal Access Tokens -> New Token

<img width="350" height="381" alt="image" src="https://github.com/user-attachments/assets/a0de10f3-1240-4563-81d1-c5fce8af35ea" />

  * Name : Token4AgentPool
  * Permiso : Read and Manage Agent Pools

> [!NOTE]
> Copiar el pat en un lugar seguro no perderlo sino hay que repetir todo el proceso. No se va a volver a mostrar mas

* Vamos a abrir una linea de comando en la carpeta c:\agent

```
.\config
```

Enter Server URL -> Url de la organizacion de devops (https://dev.azure.com/ADOCourseOrg04/)
Enter Authentication Type -> PAT
PAT -> (El que copiamos en el block de notas)

```

  ___                      ______ _            _ _
 / _ \                     | ___ (_)          | (_)
/ /_\ \_____   _ _ __ ___  | |_/ /_ _ __   ___| |_ _ __   ___  ___
|  _  |_  / | | | '__/ _ \ |  __/| | '_ \ / _ \ | | '_ \ / _ \/ __|
| | | |/ /| |_| | | |  __/ | |   | | |_) |  __/ | | | | |  __/\__ \
\_| |_/___|\__,_|_|  \___| \_|   |_| .__/ \___|_|_|_| |_|\___||___/
                                   | |
        agent v5.279.0             |_|          (commit 3898f97)


>> Connect:

Enter server URL > https://dev.azure.com/ADOCourseOrg04/
Enter authentication type (press enter for PAT) >
Enter personal access token > ************************************************************************************
Connecting to server ...

>> Register Agent:

Enter agent pool (press enter for default) > vm-lab-4trainner
Enter agent name (press enter for BASE22C) > vm-lab
Scanning for tool capabilities.
Connecting to the server.
Successfully added the agent
Testing agent connection.
Enter work folder (press enter for _work) >
2026-09-25 13:09:12Z: Settings Saved.
Enter run agent as service? (Y/N) (press enter for N) > Y
Enter a valid value for enable SERVICE_SID_TYPE_UNRESTRICTED for agent service (Y/N).
Enter enable SERVICE_SID_TYPE_UNRESTRICTED for agent service (Y/N) (press enter for N) > Y
Error reported in diagnostic logs. Please examine the log for more details.
    - C:\agent\_diag\Agent_20260925-130704-utc.log
Needs Administrator privileges for configuring agent as windows service.
```

<img width="899" height="188" alt="image" src="https://github.com/user-attachments/assets/d02d7ff4-eac6-45e9-aadc-ff985e0a33e1" />

```
run.cmd
```

## Ejecutar el pipeline en el agente Self Hosted

* Ejecutar el pipeline /.ado/eshoponweb-ci.yml

* Cambiar el pipeline para que use el pool que acabamos de crear. Queda asi??

```
resources:
  repositories:
    - repository: self
      trigger: none

stages:
- stage: Build
  displayName: Build .Net Core Solution
  jobs:
  - job: Build
    pool:
      name: vm-lab-4trainner
    steps:
    - task: DotNetCoreCLI@2
      displayName: Restore
      inputs:
```

* Ejecutar el pipeline

* Veo en la terminal de cms de la virtual que lo esta haciendo

```
C:\agent>run.cmd
Scanning for tool capabilities.
Connecting to the server.
2026-09-25 13:14:01Z: Listening for Jobs
2026-09-25 13:20:32Z: Running job: Build
```

* Y tambien lo puedo verificar en la web en el potal de devops

<img width="419" height="215" alt="image" src="https://github.com/user-attachments/assets/387fd689-b93b-457c-8773-600665242100" />

---
# Break
Hasta y 55
---

# Crear un pipeline Nostoros

* Crear una carpeta Proyecto

* Editarla con VSCode

```cmd
code .
```

* Crear un archivo index.html

```html
<!DOCTYPE html>
<html>
<head>
    <title>DevOps Lab</title>
</head>
<body>
    <h1>Mi primer proyecto DevOps</h1>
</body>
</html>
```

* Creo un repo de git local

```
git init
git add *
git config --global user.email User1-65527555@LODSPRODMCA.onmicrosoft.com
git config --global user.name User1-65527555
git commit -m "Commit Inicial"
```

* Asociamos con el repo remoto
  * Me fijo los comandos en la seccion Repos del portal de DEvops

<img width="405" height="119" alt="image" src="https://github.com/user-attachments/assets/7793b912-9d91-4872-acad-202872eceebe" />

```cmd
C:\Proyecto>git remote add origin https://ADOCourseOrg01@dev.azure.com/ADOCourseOrg01/eShopOnWeb-65527555/_git/eShopOnWeb-65527555
C:\Proyecto>git push -u origin --all
```

* Refresco el repo y veo mi archivo idex.html

* Crear un primer pipeline de prueba en este caso elegimos "starte pipeline" que se llame "pipeline-hola-mundo.yml"

```
trigger:
- master

pool:
  vmImage: ubuntu-latest

steps:
- script: echo "Hola Mundo"
  displayName: "Mostrar Mensaje"

- script: ls
  displayName: "Mira mis archivos"

```

* Save and Run
  *Corroborar la ejecucion


* Mirar en repos que se agrego el archivo yml\


* Mirar los pipelines que se ejecutan (de paso el ponemos un nombre mas significativo proque el que pone por defecto no es tan lindo)
  * De paso chusmeamos los permisos del Pipeline

* Modifiquemos el index.html localmente y luego (hacer antes git pull para bajar el pipeline que agregamos al repo)

```
git pull
git add *
git commit -m "version 2"
git push
```
