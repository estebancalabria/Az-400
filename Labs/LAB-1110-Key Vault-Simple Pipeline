# Laboratorio: Leer un Secreto de Azure Key Vault desde Azure DevOps

## Objetivos

Al finalizar este laboratorio podrás:

- Crear un Azure Key Vault.
- Crear un secreto dentro de Azure Key Vault.
- Crear una Service Connection entre Azure DevOps y Azure.
- Configurar permisos para que Azure DevOps pueda leer secretos.
- Crear un Variable Group conectado a Azure Key Vault.
- Recuperar un secreto dentro de un pipeline YAML.
- Utilizar el secreto como una variable dentro de una tarea del pipeline.

**Duración estimada:** 25 minutos

---

# Escenario

Una organización necesita almacenar información sensible de forma segura.

En lugar de guardar contraseñas o secretos dentro del código fuente o directamente en un pipeline, utilizará Azure Key Vault.

Azure DevOps recuperará el secreto desde Azure Key Vault durante la ejecución del pipeline y lo utilizará como una variable.

---

# Requisitos

Antes de comenzar debes disponer de:

- Una suscripción de Azure.
- Una organización de Azure DevOps.
- Permisos para crear recursos en Azure.
- Permisos para crear pipelines en Azure DevOps.
- Microsoft Edge o cualquier navegador compatible.

---

# Ejercicio 1: Crear un Azure Key Vault

## Tarea 1: Crear un Resource Group

### Paso 1

Abrir Azure Portal.

- [BROWSER] https://portal.azure.com

Iniciar sesión con una cuenta que tenga acceso a una suscripción de Azure.

### Paso 2

En la barra de búsqueda superior escribir:

- Resource Groups

Seleccionar:

- Resource Groups
- Create

### Paso 3

Completar la información:

| Campo | Valor |
|---------|---------|
| Subscription | Tu suscripción |
| Resource Group Name | rg-keyvault-lab |
| Region | Región más cercana |

### Paso 4

Seleccionar:

- Review + Create
- Create

Esperar a que finalice la implementación.

---

## Tarea 2: Crear un Azure Key Vault

### Paso 1

En la barra de búsqueda superior escribir:

- Key Vaults

Seleccionar:

- Key Vaults
- Create

### Paso 2

Configurar los siguientes valores:

| Campo | Valor |
|---------|---------|
| Subscription | Tu suscripción |
| Resource Group | rg-keyvault-lab |
| Key Vault Name | kv-lab-XXXX |
| Region | La misma región elegida anteriormente |
| Pricing Tier | Standard |

> Reemplazar XXXX por un valor único.

Ejemplo:

- kv-lab-esteban
- kv-lab-demo01

### Paso 3

Seleccionar:

- Review + Create
- Create

Esperar a que la implementación finalice.

### Paso 4

Seleccionar:

- Go to resource

---

# Ejercicio 2: Crear un Secreto

## Tarea 1: Almacenar un valor en Azure Key Vault

### Paso 1

Dentro del Key Vault recién creado, navegar a:

- Objects
  - Secrets

### Paso 2

Seleccionar:

- Generate / Import

### Paso 3

Completar la información:

| Campo | Valor |
|---------|---------|
| Upload options | Manual |
| Name | mensaje-secreto |
| Secret Value | Hola desde Azure Key Vault |

### Paso 4

Seleccionar:

- Create

### Paso 5

Verificar que el secreto aparezca en la lista.

Deberías visualizar:

- mensaje-secreto

---

# Ejercicio 3: Crear una Service Connection

Azure DevOps necesita una identidad para conectarse a Azure y acceder a los recursos.

## Tarea 1: Crear la conexión

### Paso 1

Abrir Azure DevOps.

- [BROWSER] https://dev.azure.com

### Paso 2

Entrar al proyecto donde se realizará el laboratorio.

### Paso 3

Navegar a:

- Project Settings
  - Service Connections

### Paso 4

Seleccionar:

- New Service Connection

### Paso 5

Seleccionar:

- Azure Resource Manager

### Paso 6

Seleccionar:

- Service Principal (Automatic)

### Paso 7

Completar los siguientes valores:

| Campo | Valor |
|---------|---------|
| Subscription | Tu suscripción |
| Resource Group | rg-keyvault-lab |
| Service Connection Name | Azure-Lab |

### Paso 8

Seleccionar:

- Save

Verificar que la conexión aparezca en la lista.

---

# Ejercicio 4: Asignar permisos al Key Vault

## Tarea 1: Permitir que Azure DevOps lea secretos

### Paso 1

Volver al portal de Azure.

Abrir:

- kv-lab-XXXX

### Paso 2

Seleccionar:

- Access Configuration

Verificar que esté seleccionado:

- Vault Access Policy

### Paso 3

Seleccionar:

- Create

### Paso 4

En la sección Secret Permissions habilitar:

- Get
- List

### Paso 5

Seleccionar:

- Next

### Paso 6

Buscar el Service Principal asociado a la Service Connection:

- Azure-Lab

Seleccionarlo.

### Paso 7

Seleccionar:

- Next
- Next
- Create

### Paso 8

Guardar los cambios.

Ahora Azure DevOps podrá leer secretos almacenados en este Key Vault.

---

# Ejercicio 5: Crear un Variable Group

## Tarea 1: Conectar Azure DevOps con Azure Key Vault

### Paso 1

Volver a Azure DevOps.

### Paso 2

Navegar a:

- Pipelines
  - Library

### Paso 3

Seleccionar:

- + Variable Group

### Paso 4

Configurar:

| Campo | Valor |
|---------|---------|
| Variable Group Name | KeyVaultLab |

### Paso 5

Habilitar:

- Link secrets from an Azure Key Vault as variables

### Paso 6

Seleccionar:

| Campo | Valor |
|---------|---------|
| Azure Subscription | Azure-Lab |
| Key Vault Name | Tu Key Vault |

### Paso 7

Seleccionar:

- Authorize

### Paso 8

Seleccionar:

- Add

### Paso 9

Marcar:

- mensaje-secreto

### Paso 10

Seleccionar:

- OK
- Save

El secreto de Azure Key Vault ahora está disponible para los pipelines mediante el Variable Group.

---

# Ejercicio 6: Crear un Pipeline YAML

## Tarea 1: Crear el Pipeline

### Paso 1

Navegar a:

- Pipelines
  - Pipelines

### Paso 2

Seleccionar:

- New Pipeline

### Paso 3

Seleccionar:

- Azure Repos Git

### Paso 4

Seleccionar el repositorio del proyecto.

### Paso 5

Seleccionar:

- Starter Pipeline

### Paso 6

Reemplazar todo el contenido por el siguiente YAML:

```yaml
trigger: none

variables:
- group: KeyVaultLab

pool:
  vmImage: ubuntu-latest

steps:

- script: |
    echo "El pipeline logró recuperar el secreto."
    echo "Contenido del secreto:"
    echo "$(mensaje-secreto)"
  displayName: "Mostrar secreto"
```

### Paso 7

Seleccionar:

- Save and Run

### Paso 8

Seleccionar nuevamente:

- Save and Run

Esperar a que finalice la ejecución.

---

# Ejercicio 7: Verificar el resultado

## Tarea 1: Revisar los logs

### Paso 1

Abrir la ejecución del pipeline.

### Paso 2

Abrir el Job.

### Paso 3

Seleccionar el paso:

- Mostrar secreto

### Paso 4

Revisar la salida.

Deberías observar algo similar a:

```text
El pipeline logró recuperar el secreto.
Contenido del secreto:
***
```

---

## ¿Por qué aparecen asteriscos?

Azure DevOps detecta automáticamente que la variable proviene de Azure Key Vault.

Por razones de seguridad:

- El secreto es recuperado correctamente.
- El valor real no se muestra en los logs.
- Azure DevOps reemplaza automáticamente el valor por "***".

Esto evita la exposición accidental de contraseñas y secretos.

---

# Desafío opcional

Modificar el valor del secreto en Azure Key Vault.

Por ejemplo:

```text
Azure DevOps y Key Vault funcionan juntos
```

Guardar el cambio.

Volver a ejecutar el pipeline.

Comprobar que el pipeline sigue funcionando sin necesidad de modificar el archivo YAML.

---

# Resumen

En este laboratorio:

- Creaste un Resource Group.
- Creaste un Azure Key Vault.
- Almacenaste un secreto llamado `mensaje-secreto`.
- Creaste una Service Connection entre Azure DevOps y Azure.
- Asignaste permisos para leer secretos.
- Creaste un Variable Group conectado a Azure Key Vault.
- Recuperaste el secreto dentro de un pipeline YAML.
- Verificaste que Azure DevOps protege automáticamente los secretos mostrando `***` en los logs.
