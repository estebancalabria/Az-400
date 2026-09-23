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
