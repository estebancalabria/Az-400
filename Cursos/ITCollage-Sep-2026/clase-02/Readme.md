# Clase Dos - 23 de Septiembre del 2026

# Repaso

* Creacion del Tennant -> Organizacion -> Proyecto
  * Project Settings -> General -> Teams / Permissions
    * Definimos Equipos
      * Agregamos usuarios de mi tennant a los equipos
      * Dar permisos a los equipos / usuarios individuales
  * * Project Settings -> Boards -> Project Configuration
      * Definimos Areas de Trabajo
      * Definimos sprints / Iteraciones
* CI / CD
* Tipo De Proceso
  * Basic
  * Agile
  * Scrumm
  * CMMI
* Work Items
    * Epica ...
    * Los tipos de Work Items dependen del proceso elegido
    * Los estados del Work Item tambien depende del proceso elegido
 * Boards
   * -> Work Items
   * -> Borads / Backlogs / Springs -> Diagramas Kanban

---

# Adm Proyecto

## Dashboards

## MarketPlace

## CLI

---

# Laboratorio 2 : Repositorios Git 

* URl Lab Oficial
  * https://microsoftlearning.github.io/AZ400-DesigningandImplementingMicrosoftDevOpsSolutions/Instructions/Labs/AZ400_M01_L02_Version_Control_with_Git_in_Azure_Repos.html
 
* URL Lab GIT
  * https://github.com/MicrosoftLearning/eShopOnWeb
  * Lo vamos a utilizar casi todas las clases
 
*  Verificar la instalacion de git

```
git --version
```

> [!NOTE]
> En caso de no tener GIT se puede instalar desde
> https://git-scm.com/install/windows

> [!NOTE]
> Si por temas de permisos  no se puede usar git o no se puede instalar git for windows. Usar la virtual del laboratorio de Skillabe

 * Configuramos las credenciales de git (solo la primera vez)

```
 git config --global credential.helper wincred
 git config --global user.name "<John Doe>"
 git config --global user.email <johndoe@example.com>
```

* En Repos -> Files importar el repo :https://github.com/MicrosoftLearning/eShopOnWeb
  * En la carpeta .ado tenemos pipelines de devops en formato yaml
      * Explorar el que dice -ci
  * En la carpeta infra tenemos nuestros archivos de IAC (los templates bicep)
      * Aca vemos los .bicep
  * scr -> Aca estan los fuentes
  * tests -> Los test unitarios
 
* Branches
    * Una rama paralela del codigo
    * Vamos a ir al repo y asegurarnos de que estemos parados en el branch "main"

---
# BREAK KAHOOT
---

## Funcionamiento GIT

* Si una carpeta local esta bajo un control de versiones GIT hay una carpeta oculta .git
* Funcionamiento GIT
  * (local)    <---->  (Repo local)   <-----> (Repo Remoto)

## Trabajando con el Repo Localmente

* En la parte de repos copiar la URL del Reo (Ej : https://ADOCourseOrg03@dev.azure.com/ADOCourseOrg03/eShopOnWeb-65433932/_git/eShopOnWeb-65433932)

* Bajamos (clonamos) el repo localmente

```
git clone <URL_AZURE_REPO>
```

* Nos paramos en la carpeta del repo

```
cd <NOMBRE_REPO>
```

> [!NOTE]
> Va a mostrar un popup para ingresar las credenciales

* Edito el proyecto con vscode

```
code .
```

* Editamos el archivo /src/Web/constants.cs

```cs
namespace Microsoft.eShopWeb.Web;

public static class Constants{
    public const string BASKET_COOKIENAME = "eShop";
    public const int ITEMS_PER_PAGE = 10;
    public const string DEFAULT_USERNAME = "Guest";
    public const string BASKET_ID = "BasketId";
    public const string SALUDO = "Hola que tal";
}
```

* Ahora vamos a subir el cambio al repositorio
  
* Primero cheuqeamos las modicaciones que no estan subids

```powershell
git status
```

* Agregamos archivos nuevos al repo local

```
git add *
```

* Commit : Confirmo en el repo local los cambios para tener el historial de versionado y digo que se hizo con un mensaje significado

```
git commit -m "Modfico el archivo Constants.cs agregando la constante nueva"
```

* Para ver el historial de commits

```
git log
```

>[!NOTE]
> q para saliri y volver al prompt

* Para ver en que branch estoy trabajando

```
git branch
```

* Subir los cambios al repo remoto

```
git push
```

* Verifiar los cambios del archivo en el Repo en el portal de devops y ver la solapa history que muestra los cambios

<img width="529" height="229" alt="image" src="https://github.com/user-attachments/assets/050dfe2e-146c-4d39-8b46-93483b38943c" />

> [!NOTE]
> Yo me confundi. Creia que estaba modificando el branch mail pero en realida estaba trabajando con otro branch copilot/add-kubernetes-terraform-support. Lo que quiero ahora es hacer un merge entre el main y  ese branch, para que me queden todos mis cambios en la linea principal

* Me cambio al branch main

```
git switch main
```

* Bajo/Actualizo el repositorio local con los ultimos cambios del repositorio remoto

```
git pull
```

* Fusiono la rama actual (main) con la rama copilot/add-kubernetes-terraform-support

```
git merge copilot/add-kubernetes-terraform-support -m "Confirmao cambios"
```

* Subimos los cambios al remoto

```
git push
```

* Verificamos que en el banch main ahora si esten los cambios

> [!NOTA]
> Esto que hicimos de mergear dos branch es algo que  en general requiere una aprobacion.
> En la practica no se suele hacer de esta manera sino que se hace mediante un PULL REQUEST
> (Un merge formal entre dos branch que requiere la supervision)

---
# BREAK KAHOOT
---

## Trabajo con GIT

* El devops tiene como resposabilidad definir como va a trabajar el equipo usando Git segun el proyecto
* Hay varias formas estandarizadas de trabajo

 ### Trunk Based

 <img width="1000" height="500" alt="image" src="https://github.com/user-attachments/assets/85c02bb4-5032-48fc-8b04-8de956cf2b91" />

 * Cambios pequenios que se fusionan constantemente con la rama principal

#### Git Flow

<img width="1100" height="619" alt="image" src="https://github.com/user-attachments/assets/603cc369-a7bd-4612-8f3c-6e21ea1e581f" />

 * Una forma de trabajo con mas ramas, una con un objetivo distint
