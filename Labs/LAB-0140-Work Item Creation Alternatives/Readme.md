# 🧪 Laboratorio completo: Crear Work Items en Azure DevOps (API, CLI y CSV) con validación

## 🎯 Objetivo

Aprender a crear Work Items en Azure DevOps sin usar el portal, usando 3 métodos reales de industria:

* 🔌 REST API (automatización y sistemas)
* ⚙️ Azure DevOps CLI (scripts rápidos)
* 📊 CSV / Excel (carga masiva)

Al final del laboratorio vas a poder:

* Crear Work Items desde código
* Validar que se crearon correctamente
* Entender jerarquía (Epic → Task)
* Detectar errores comunes

---

# 🧠 FASE 0 — Preparación obligatoria

Antes de ejecutar cualquier cosa, necesitás 3 datos.

---

## 🟩 0.1 — Obtener ORGANIZATION y PROJECT

Entrá a:

[Azure DevOps](https://dev.azure.com?utm_source=chatgpt.com)

Vas a ver una URL como:

```text id="org1"
https://dev.azure.com/my-company/AI-Lab-Project
```

📌 De acá obtenés:

* ORG = `my-company`
* PROJECT = `AI-Lab-Project`

---

## 🟩 0.2 — Crear Personal Access Token (PAT)

Ir a:

```text id="pat1"
User Settings → Personal Access Tokens
```

Crear token con:

* Scope: Work Items (Read & write)
* Expiration: 30–90 días

📌 Guardarlo como:

```text id="pat2"
YOUR_PAT
```

⚠️ Importante: solo se muestra una vez.

---

## 🟩 0.3 — Reglas del laboratorio

Siempre reemplazar:

```text id="rules1"
{org} → tu organización
{project} → tu proyecto
YOUR_PAT → tu token real
```

---

## 🟩 0.4 — Validación base del entorno

Antes de empezar, verificá:

✔ Podés abrir el proyecto en el navegador
✔ El PAT fue creado
✔ Tenés permisos de Work Items

---

# 🧪 PARTE 1 — REST API (nivel profesional)

---

## 🎯 Objetivo

Crear un Work Item usando HTTP.

---

## 🟩 1.1 — Endpoint

```text id="api1"
POST https://dev.azure.com/{org}/{project}/_apis/wit/workitems/$Task?api-version=7.1
```

Ejemplo real:

```text id="api2"
POST https://dev.azure.com/my-company/AI-Lab-Project/_apis/wit/workitems/$Task?api-version=7.1
```

---

## 🟩 1.2 — Body del request

```json id="api3"
[
  {
    "op": "add",
    "path": "/fields/System.Title",
    "value": "REST API Task"
  },
  {
    "op": "add",
    "path": "/fields/System.Description",
    "value": "Task created using Azure DevOps REST API"
  }
]
```

---

## 🟩 1.3 — Ejecutar con curl

```bash id="api4"
curl -u :YOUR_PAT \
  -X POST \
  -H "Content-Type: application/json-patch+json" \
  -d '[
    {
      "op": "add",
      "path": "/fields/System.Title",
      "value": "REST API Task"
    }
  ]' \
  https://dev.azure.com/my-company/AI-Lab-Project/_apis/wit/workitems/$Task?api-version=7.1
```

---

## 🧪 VALIDACIÓN (OBLIGATORIA)

### ✔ Validación 1 — HTTP Status

Debe ser:

```text id="val1"
200 o 201 = OK
```

Errores comunes:

* 401 → PAT incorrecto
* 403 → permisos insuficientes
* 404 → org o project mal

---

### ✔ Validación 2 — Response JSON

Debe incluir:

```json id="val2"
{
  "id": 12345,
  "fields": {
    "System.Title": "REST API Task"
  }
}
```

---

### ✔ Validación 3 — Azure DevOps UI

Ir a:

```text id="val3"
Boards → Work Items
```

Buscar:

```text id="val4"
REST API Task
```

✔ Debe aparecer

---

# 🧪 PARTE 2 — Azure DevOps CLI

---

## 🎯 Objetivo

Crear Work Items sin API manual.

---

## 🟩 2.1 — Instalar extensión

```bash id="cli1"
az extension add --name azure-devops
```

---

## 🟩 2.2 — Login

```bash id="cli2"
az login
```

---

## 🟩 2.3 — Configurar defaults

```bash id="cli3"
az devops configure --defaults organization=https://dev.azure.com/my-company project=AI-Lab-Project
```

---

## 🟩 2.4 — Crear Work Item

```bash id="cli4"
az boards work-item create \
  --title "CLI Task" \
  --type Task
```

---

## 🧪 VALIDACIÓN

### ✔ Validación 1 — Output CLI

Debe mostrar un ID:

```text id="cli5"
"id": 12345
```

---

### ✔ Validación 2 — Consultar item

```bash id="cli6"
az boards work-item show --id 12345
```

✔ Debe devolver el Work Item

---

### ✔ Validación 3 — UI

Ir a Boards y buscar la Task

---

# 🧪 PARTE 3 — CSV / Excel (carga masiva)

---

## 🎯 Objetivo

Crear múltiples Work Items sin código.

---

## 🟩 3.1 — Abrir Queries

```text id="csv1"
Boards → Queries
```

---

## 🟩 3.2 — Crear query

```text id="csv2"
Work Items and Direct Links
```

---

## 🟩 3.3 — Abrir en Excel

```text id="csv3"
Open in Excel
```

---

## 🟩 3.4 — Agregar datos

| Title  | Work Item Type | State |
| ------ | -------------- | ----- |
| Task 1 | Task           | New   |
| Task 2 | Task           | New   |
| Task 3 | Task           | New   |

---

## 🟩 3.5 — Publicar

```text id="csv4"
Publish
```

---

## 🧪 VALIDACIÓN

✔ Verificar en Azure DevOps UI
✔ Verificar IDs asignados
✔ Verificar sincronización en Excel

---

# 🧠 CONCEPTO IMPORTANTE — Jerarquía

En Azure DevOps:

```text id="hier1"
Epic
 └─ Feature / User Story
      └─ Task
```

---

## ❓ ¿Se puede crear una Task sin Epic?

✔ Sí, se puede.

Pero:

* No tiene trazabilidad
* No es buena práctica

---

## 🔒 ¿Se puede restringir?

✔ Sí, parcialmente:

* Work Item Rules
* Process customization
* Queries de control
* Automatización con API

Pero no es obligatorio por defecto.

---

# 🔥 COMPARACIÓN FINAL

| Método   | Uso                | Nivel |
| -------- | ------------------ | ----- |
| REST API | Automatización, IA | Alto  |
| CLI      | Scripts rápidos    | Medio |
| CSV      | Carga masiva       | Bajo  |

---

# 🚀 CONCLUSIÓN

Azure DevOps no es solo una herramienta web:

👉 Es una plataforma programable de gestión de trabajo

Esto permite:

* crear backlogs desde código
* integrar IA para generar tareas
* automatizar proyectos completos
* escalar gestión de equipos

