# Clase Tres - 24 de septiembre del 2026

# Repaso

* Visual studio code
  * code .
* Git
  * Importar un repo en azure repo
  * Comandos CLI
    * git --version
    * git config ---global ...
    * git status
    * git log
    * Local
      * git clone
        * para bajar un repositorio localmente desde un remoto
      * git add
      * git commit -m "mensaje"
          * El devops debe educar al equipo para que ponga mensajes signinficativos
          * Muchas veces se obliga a ingresar un numero de work item con # en el mensaje del commit
    * Branches
      * git branch
      * git switch
      * git merge << ojo con este, no se usa casi nunca
    * Repo Remoto
      * git push
      * git pull
  * Manejo de ramas
    * Workflows de Branches
      * Trunk based
      * Git flow
    * Politicas
    * Pull Request
      * Cheque manual o con IA


# Dashboards (LAB1)

* Un espacio donde organizamos widgets (cartas) para tener un resumen visual del proyecto y un atajo a las opciones que mas voy a utilizar segun mi perfil

<img width="541" height="354" alt="image" src="https://github.com/user-attachments/assets/888fe44d-0614-4bfe-bc3a-0bcc2c948776" />

# Marketplace

* Un lugar donde comprar (a veces gratis) add ons para tu devops. Se pueden comprar Widgets y tambien opciones nuevas de Devops
* Vamos a probar por ejemplo una que se llama "Restrospectives"

# Opciones Para prestar atencion

* A nivel Proyecto
  * Proyect Settings

 <img width="166" height="49" alt="image" src="https://github.com/user-attachments/assets/56ca865e-cec6-49e5-8258-44a926612337" />

* A Nivel Organizacion
  * Organization Settings

<img width="158" height="38" alt="image" src="https://github.com/user-attachments/assets/0f9791e5-4f5b-4721-a1ef-67800ad752f6" />

* Permisos
  * Existen dos niveles de permisos
    * A Nivel Organizacion
        * Project Collection Administrators
    * A Nivel Proyecto
        * Project Administrators
        * Reader

---
# BREAK
---

# Laboatorio 3 : Automatizar pipelines de CI

## Proceso de compilacion manual

* Verifico si tengo instalado .net en la virtual y local

```
>dotnet --version
```

* Crear una carpeta

```
C:\>md  DemoCI
C:\>cd DemoCI
C:\DemoCI>
```

* Creamos una solucion

```
dotnet new sln -n DemoCI
```

* Creamos una aplicacion de consola

```
dotnet new console -n Calculadora
```

* Creamos un proyecto mas para las pruebas Unitarias

```
dotnet new xunit -n Calculadora.Tests
```

* Agrego los dos proyectos a la soucion

```
dotnet sln add Calculadora/Calculadora.csproj
dotnet sln add Calculadora.Tests/Calculadora.Tests.csproj
```

* Hacemos que el proyecto de los tests referencie al de la calculadora

```
dotnet add Calculadora.Tests/Calculadora.Tests.csproj reference Calculadora/Calculadora.csproj
```

* Crear el archivo Calculadora.cs

```
namespace Calculadora;

public class Calculadora
{
    public int Sumar(int a, int b)
    {
        return a + b;
    }
}
```

* Modificar el archivo de los tests

```
using Calculadora;

namespace Calculadora.Tests;

public class UnitTest1
{
    [Fact]
    public void Sumar_DosNumeros_DevuelveResultadoCorrecto()
    {
        var calculadora = new Calculadora();

        var resultado = calculadora.Sumar(2, 3);

        Assert.Equal(5, resultado);
    }
}
```

* Ejecutamos el proyecto de la calculadora

```
C:\DemoCI>cd Calculadora

C:\DemoCI\Calculadora>dotnet run
```

* Si ejecturara los tests en la raiz

```
C:\DemoCI\Calculadora>cd ..

C:\DemoCI>dotnet test
```

* Me mostraria algo como esto

<img width="593" height="517" alt="image" src="https://github.com/user-attachments/assets/a2df0fc5-a90e-4f37-8484-a8206604a23d" />


* Luego compilarimos el proyecto siempre con estos pasos
    * Bajo las librerias de nuget (repositorio de paquetes publico)
    * Compilo los fuentes
    * Ejecutlo los tests

```
dotnet restore
dotnet build
dotnet test
```

> [!NOTE]
> Cada vez que uno programador modifica algo en los fuentes y los sube a nuestro repo este proceso que hicimos manualmente se automatice un entorno sandbox

* Al automatizar el proyecto
  * Si el programador usa librerias que no existen
    * Falla el restore
  * Si sube codigo que no compila
    * Falla el build
  * Si el codigo rompe algo que antes funcionaba y estaba testeado
    * Falla el test
* A todo esto se le pueden agregar todos los pasos que quieras
  * Chequear dependencias con vulnerabilidades en internet
  * Chequear que el codigo subido cumple los estandares de calidad de la empresa
  * Chequear que el codigo subido esta probado y tenemos cierta cobertura
  * Chequear con la IA que el codigo no tiene vulnerabilidades
  * Chequear que lo que se agrego no rompa la performance

* Vamos a ver este proceso que hicimos manualmente como esta definido en un pipeline de CI
* Vamos a importar el proyecto de eShopOnWeb en los repos
    * https://github.com/MicrosoftLearning/eShopOnWeb
 
* Ver archivo .ado/eshoponweb-ci.yml
  * Corroborar los mismo pasos que hicimos antes estan definidos en el pipeline en yaml

```
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
    
    - task: DotNetCoreCLI@2
      displayName: Test
      inputs:
        command: 'test'
        projects: 'tests/UnitTests/*.csproj'
```

* Este pipeline lo podemos ejecutar de dos formas
  * Microsoft Hosted
    * Te cobran el uso del CPU
  * Self Hosted
 
* Ver Project Settings -> Pipelines
* Ver Proyect Settings -> Paralel Jobs

<img width="337" height="237" alt="image" src="https://github.com/user-attachments/assets/c74cacd9-8fa5-44c7-a03e-799184d4790f" />

* Vamos a probar si el laboratorio me deja ejecutar un pipeline "Microsoft Hosted"
  * Vamos a Pipelines -> Create Pipeline
  * Elegirmos el Repo del proyecto
  * Elegimos "Existing pipeline from YAML File"
  * Elegimos el archivo /.ado/eshoponweb-ci.yml
  * Le damos Run al pipeline

* Si quisiera que este pipeline se ejecute solo cuando alguien comitea algo al branch main descomentariams estas lineas (ahora lo ejecutamos manualmente)
```
#NAME THE PIPELINE SAME AS FILE (WITHOUT ".yml")
# trigger:
# - main
```

* Me muestra esto

<img width="782" height="326" alt="image" src="https://github.com/user-attachments/assets/eb0173a2-15f8-472f-b12f-4c2203dd1448" />

* Si le doy click en build puedo ver los pasos me muestra esto:

<img width="792" height="407" alt="image" src="https://github.com/user-attachments/assets/ab40142d-c1a9-48f3-8719-69de2c4d0dd6" />

* Todo esto en general ocurre en un segudno plano sin que nos enteremos, pero si podemos ir de vuelta a la parte de pipelines y mirar los que se ejecutaron

<img width="790" height="173" alt="image" src="https://github.com/user-attachments/assets/70412a4f-bab3-46d3-b361-4817e824629c" />

* Vayan a la parte de pipeline y revisen todo
    * Revisar que los test salieron ok
    * Revisar los artefactos que se subieron asociando al pipeline
