# 🌐 Laboratorio: Configuración de un Pipeline en Azure DevOps con Key Vault y Agente

## Resumen de Pasos

1️⃣ **Crear el Resource Group en Azure**  
2️⃣ **Crear el Proyecto en Azure DevOps**  
3️⃣ **Crear un Key Vault en Azure**  
4️⃣ **Importar el Proyecto `eShopOnWeb` a Azure DevOps**  
5️⃣ **(Opción 1)** Obtener un PAT y **(Opción 2)** Activar el Billing en Azure  
6️⃣ **(Opción 1)** Instalar el Agente Self-hosted en Azure DevOps  
7️⃣ **Crear un Service Principal en Azure CLI**  
8️⃣ **Crear un Service Connection en Azure DevOps**  
9️⃣ **Crear un Secreto en el Key Vault**  
🔟 **Crear un Access Policy para el Key Vault**  
1️⃣1️⃣ **Crear y Ejecutar un Pipeline Manualmente en Azure DevOps**

## Detalle de los Pasos

### 1️⃣ **Crear el Resource Group en Azure**

1. Inicia sesión en tu cuenta de Azure.
2. Navega a **Resource Groups**.
3. Haz clic en **+ Add**.
4. Elige una **Subscription** y da un nombre a tu Resource Group (por ejemplo, `MyResourceGroup`).
5. Selecciona una región adecuada y haz clic en **Review + create**.

📝 **Tip**: Los Resource Groups ayudan a organizar tus recursos en Azure.

### 2️⃣ **Crear el Proyecto en Azure DevOps**

1. Inicia sesión en **Azure DevOps**.
2. Haz clic en **+ New Project**.
3. Asigna un nombre al proyecto (por ejemplo, `eShopOnWebProject`).
4. Configura las opciones necesarias (visibilidad, etc.) y haz clic en **Create**.

📝 **Tip**: Este proyecto contendrá tu código y pipelines.

### 3️⃣ **Crear un Key Vault en Azure**

1. En tu portal de Azure, busca **Key Vaults**.
2. Haz clic en **+ Add**.
3. Selecciona el Resource Group que creaste, asigna un nombre a tu Key Vault (por ejemplo, `MyKeyVault`), y selecciona la región.
4. Haz clic en **Review + create** y luego en **Create**.

🔑 **Tip**: Key Vault te permite almacenar secretos y certificados de forma segura.

### 4️⃣ **Importar el Proyecto `eShopOnWeb` a Azure DevOps**

1. Clona el proyecto `eShopOnWeb` desde su repositorio GitHub.
2. En tu proyecto de Azure DevOps, ve a **Repos > Import Repository**.
3. Ingresa la URL del repositorio de `eShopOnWeb` y haz clic en **Import**.

🔄 **Tip**: Importar el proyecto te permitirá trabajar con un código preexistente.

---

### **Opción 1**: Instalar un Agente Self-hosted en DevOps 🖥️

### 5️⃣ **Obtener un Personal Access Token (PAT)**

1. En Azure DevOps, ve a **User Settings > Personal Access Tokens**.
2. Crea un nuevo token con los permisos necesarios.
3. Guarda el token en un lugar seguro.

🔑 **Tip**: El PAT se utiliza para autenticar el agente en Azure DevOps.

### 6️⃣ **Instalar el Agente Self-hosted**

1. En tu proyecto de Azure DevOps, ve a **Organization Settings > Agent Pools**.
2. Haz clic en **New agent** y sigue las instrucciones para descargar y configurar el agente.
3. Utiliza el PAT obtenido anteriormente para registrar el agente.

🛠️ **Tip**: El agente ejecutará tus pipelines en una máquina específica.

---

### **Opción 2**: Activar el Billing en Azure para Servicios 🌐

### 5️⃣ **Activar el Billing en Azure**

1. Navega a **Cost Management + Billing** en el portal de Azure.
2. Configura un método de pago válido y asocia tus suscripciones.

💳 **Tip**: Es necesario tener el billing activo para utilizar ciertos servicios en Azure.

---

### 7️⃣ **Crear un Service Principal en Azure via CLI**

1. Abre la terminal de Azure CLI y ejecuta el siguiente comando:

'''powershell
az ad sp create-for-rbac --name "MyServicePrincipal" --role contributor --scopes /subscriptions/{subscription-id}/resourceGroups/MyResourceGroup
'''

2. Guarda los valores `appId`, `password`, y `tenant` que se generen.

🔄 **Tip**: El Service Principal permite que tu pipeline interactúe con Azure.

### 8️⃣ **Crear un Service Connection en Azure DevOps**

1. En tu proyecto de Azure DevOps, ve a **Project Settings > Service Connections**.
2. Haz clic en **New service connection** y selecciona **Azure Resource Manager**.
3. Configura la conexión utilizando el Service Principal creado.

🔧 **Tip**: Este paso vincula Azure DevOps con tu suscripción de Azure.

### 9️⃣ **Crear un Secreto en el Key Vault**

1. En el portal de Azure, ve a tu Key Vault y selecciona **Secrets**.
2. Haz clic en **+ Generate/Import** para crear un nuevo secreto.
3. Asigna un nombre (por ejemplo, `DevopsSecret`) y un valor (por ejemplo, un token de acceso).

🔐 **Tip**: Este secreto será utilizado en tu pipeline.

### 🔟 **Crear un Access Policy en Key Vault**

1. En tu Key Vault, ve a **Access Policies**.
2. Haz clic en **+ Add Access Policy**.
3. Selecciona las permisos de **Get** y **List** para **Secrets**.
4. Añade el Service Principal que creaste anteriormente y guarda los cambios.

🔒 **Tip**: Esta política permite al Service Principal acceder a los secretos en tu Key Vault.

### 1️⃣1️⃣ **Crear y Ejecutar un Pipeline Manualmente**

### **Archivo YAML del Pipeline**

'''yaml
trigger: none # Cambiado para ejecución manual

pool:
  name: Local

variables:
- group: Azure

steps:
- script: echo Hello, $(DevopsSecret)!
  displayName: 'Run a one-line script'
'''

1. En tu proyecto de Azure DevOps, ve a **Pipelines > Create Pipeline**.
2. Selecciona **YAML** y copia el contenido del archivo anterior.
3. Guarda y ejecuta el pipeline manualmente.

🎯 **Tip**: Ejecutar el pipeline manualmente te permite verificar cada paso antes de automatizar.

---

¡Felicidades! 🎉 Has completado el laboratorio. Has configurado un pipeline en Azure DevOps que utiliza un Key Vault para almacenar y gestionar secretos de manera segura. Además, has aprendido a configurar un agente self-hosted o activar el billing en Azure según la opción que elijas.
