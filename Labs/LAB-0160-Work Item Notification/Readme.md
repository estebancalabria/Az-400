# 🧪 Laboratorio: Azure DevOps Work Item → Webhook → Node.js App (con validación)

## 🎯 Objetivo

Crear un sistema donde al crear un Work Item en Azure DevOps se envíe una notificación HTTP a una aplicación Node.js local que recibe y muestra el evento en consola.

---

# 🧠 FASE 0 — Preparación

---

## 🟩 0.1 — Requisitos

Verificar:

* Node.js instalado
* Acceso a Azure DevOps
* Un proyecto creado en Azure DevOps

---

## 🟩 0.2 — Obtener URL del proyecto

Entrar a:

[Azure DevOps](https://dev.azure.com?utm_source=chatgpt.com)

Identificar:

```text id="orgproj"
https://dev.azure.com/{org}/{project}
```

---

## 🧪 VALIDACIÓN 0.2

✔ Abrir el proyecto en el navegador sin error
✔ Ver Boards disponibles

---

# 🧠 FASE 1 — Crear aplicación Node.js (receiver)

---

## 🟩 1.1 — Crear proyecto

```bash id="n1"
mkdir ado-webhook-app
cd ado-webhook-app
npm init -y
```

---

## 🟩 1.2 — Instalar Express

```bash id="n2"
npm install express
```

---

## 🟩 1.3 — Crear servidor

Crear archivo:

```text id="file1"
index.js
```

Código:

```javascript id="n3"
const express = require("express");
const app = express();

app.use(express.json());

app.post("/webhook", (req, res) => {
  console.log("EVENT RECEIVED:");
  console.log(JSON.stringify(req.body, null, 2));

  res.status(200).send("OK");
});

app.listen(3000, () => {
  console.log("Server running on http://localhost:3000");
});
```

---

## 🟩 1.4 — Ejecutar servidor

```bash id="n4"
node index.js
```

---

## 🧪 VALIDACIÓN 1

✔ Debe aparecer:

```text id="v1"
Server running on http://localhost:3000
```

✔ Abrir en navegador:

```text id="v2"
http://localhost:3000
```

Debe responder (aunque sea error GET no esperado, el server debe estar activo)

---

# 🧠 FASE 2 — Exponer servidor

---

## 🟩 2.1 — Exponer localhost

Ejecutar:

```bash id="n5"
npx ngrok http 3000
```

---

## 🟩 2.2 — Obtener URL pública

Ejemplo:

```text id="ng1"
https://abc123.ngrok.io
```

---

## 🧪 VALIDACIÓN 2

✔ ngrok activo sin errores
✔ URL pública accesible desde navegador
✔ Debe mostrar pantalla de ngrok o respuesta del servidor

---

# 🧠 FASE 3 — Configurar Webhook en Azure DevOps

---

## 🟩 3.1 — Ir a Service Hooks

En Azure DevOps:

```text id="n6"
Project Settings → Service Hooks → Create Subscription
```

---

## 🟩 3.2 — Seleccionar evento

Elegir:

```text id="n7"
Work item created
```

---

## 🟩 3.3 — Seleccionar Webhook

Elegir:

```text id="n8"
Web Hooks
```

---

## 🟩 3.4 — Configurar URL

Ingresar:

```text id="n9"
https://YOUR_NGROK_URL/webhook
```

---

## 🟧 VALIDACIÓN 3

✔ Subscription creada sin error
✔ Endpoint guardado correctamente
✔ Azure DevOps permite “Test” de webhook

---

## 🟩 3.5 — Test del webhook

Ejecutar test desde Azure DevOps

---

## 🟧 VALIDACIÓN 3.5

✔ Debe llegar request al servidor Node.js
✔ En consola debe aparecer JSON del evento
✔ Status HTTP 200 en respuesta

---

# 🧠 FASE 4 — Prueba real (Work Item)

---

## 🟩 4.1 — Crear Work Item

Ir a:

```text id="n10"
Boards → Work Items → New Work Item
```

Crear:

```text id="n11"
Title: Test webhook event
```

Guardar.

---

## 🟧 VALIDACIÓN FINAL

### ✔ VALIDACIÓN 4.1 — Node.js console

Debe aparecer:

```json id="v3"
EVENT RECEIVED:
{
  "eventType": "workitem.created",
  "resource": {
    "id": 12345,
    "fields": {
      "System.Title": "Test webhook event"
    }
  }
}
```

---

### ✔ VALIDACIÓN 4.2 — Azure DevOps

Ir a:

```text id="v4"
Boards → Work Items
```

Verificar:

✔ Work Item creado
✔ Título visible
✔ ID asignado

---

### ✔ VALIDACIÓN 4.3 — Red

En ngrok console:

✔ Request POST recibido en `/webhook`
✔ Status 200 OK

---

# 🧠 FASE 5 — Validación de flujo completo

Verificar este flujo:

```text id="flow"
Azure DevOps → Service Hook → ngrok → Node.js → Console log
```

✔ Todos los pasos deben responder correctamente
✔ No debe haber errores 401 / 404 / timeout
✔ El evento debe reflejar el Work Item creado

---
