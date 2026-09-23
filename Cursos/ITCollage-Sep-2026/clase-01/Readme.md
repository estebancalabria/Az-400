# Clase Uno - 22 de Septiembre 2026

# Ropadmap

* Organizacion Devops
  * Organizacion
   * Proyectos
    * https://dev.azure.com/<ORGANIZACION>/<PROYECTO>
* Administracion del Proyecto con Azure Boards
  * Tipos de Proyectos en Azure Devos
* Documentacion del Proyecto
  * Uso de Wikkis
* Administracion de Repositorios de Fuentes
  * Control de Versiones
  * Azure Repos
  * Github Repos
* Pipepelines
  * Un "algoritmo" que se ejecuta cuando se suben fuentes al repositorio git o se decide crear una version para produccion
  * CI (Continuous Integration)
  * CD (Continuous Deployment)
  * Github Actions
  * Configuracion Dinamica con Feature Flags
  * Ejecucion de Pipelines locales o en La nube
* Pruebas
  * Pruebas Unitarias
  * Pruebas Funcionales/Integracion
  * Pruebas de Stress
  * Aprobaciones Manuales (Release Gates)
* Azure
  * Overview General
  * Recursos Claves como AppService, KeyVaults
  * IAC (Infraestructura como codigo)
    * ARM / Bicep Template / Terraform
    * DEfinir un archivo que especifica la ifraestructura (VM, AppService, BD necesarias para desplegar tu app)
* Administracion paquetes internos en nuestra organizacion
  
# Recursos

* Microsoft Learn
  * https://learn.microsoft.com/es-es/credentials/certifications/exams/az-400/
* Github Oficial
  * https://github.com/MicrosoftLearning/AZ400-DesigningandImplementingMicrosoftDevOpsSolutions
  * https://microsoftlearning.github.io/AZ400-DesigningandImplementingMicrosoftDevOpsSolutions/
* Contacto
  * https://www.instagram.com/mct.esteban.calabria/
  * https://www.linkedin.com/in/esteban-calabria-7a44401a/

# Links

* Portal de Azure
    * https://portal.azure.com/
* Portal de Devops
    * https://aex.dev.azure.com/

# Setup

* Login Skillabe
  * https://alh.learnondemand.net/User/Login
* Registrarse con la Trainning Key que le pasa el profe
* POR FAVOR NO PIERDAN EL USUARIO Y CLAVE QUE INGRESA
* Inciar el primer laboratoroio
* Esperar y ver la solapa resouces
  
* <img width="654" height="279" alt="image" src="https://github.com/user-attachments/assets/5662c0aa-71ca-419a-904c-0ba0a6bc80f4" />

* Abrir una venta de incognito
  * Ir a https://portal.azure.com/
* Ingresar el usuario y el TAP de Skillable

# Laboratoio 1 : Work Items

* Un Work Items En un Ticket que le asignas a un usuario (como en Jira o en InvGate)
* Hay distintos tipos de Work Items dependiento el tipo de proyecto (Basic, Scrum, Agile, CMMI)
   * https://www.instagram.com/p/DC2rhqgvern/?img_index=2
* El proyecto que viene por defectos es SCRUMM
* Vamos a crear una epica
   * "Gestion de Inventario"
     * Creamos unna Feature dentro de la epica
          * "Administracion de productos"
             * Creamos el PBI (Product Backlock item)
               * "Como usuario quiero registrar un producto para incoporar al inventario"
                  * Creamos tareas para ese PBI
                   * "Crear Clase Producto"
                   * "Crear API de Productos"
                   * "Crear Pruebas Unitarias"  

* En Project Settings -> Boards -> Project Configuration
   * Defino mis Sprints con sus correspondientes Fechas
   * Defino Areas para organizar la distribucion de trabajos (Backend, Frontend, BD, Testing)
 
* En Project Settings -> General -> Teams
   * Aqui defino los equipos de mi proyecto
     * Dentro de los equipos puedo agregar usuarios a mi proyecto
     * Se pueden incorporar usuarios de mi Tennant 365
    
* En permisions se le puede asignar Permisos a los dititnos Equipos
* Hay Grupos creados por defecto cuando queremos dar permisos individuales sin crear un equipo

* Primeros Pasoss
  * Creamos el proyecto (elegimos el tipo de proyecto adecuado)
  * Vamo a Project Configuration y definimos
    * Sprint con Fechas
    * Areas con las que vamos a trabajar
  * Vamos a Teams
    * Definimos los distintos equipos
    * Agregamos los usuarios usuarios de nuestro tennant a nuestros equipos
  * Vamos a Permission
    * Asingar permisos a los equipos
    * Asignar permisos a usuarios individiaules mediante los grupos de permisos ya creados (Ej : Reader)
