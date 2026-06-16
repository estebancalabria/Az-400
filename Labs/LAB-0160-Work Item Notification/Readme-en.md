# � Lab: Azure DevOps Work Item → Webhook → Node.js App (with validation)

## 🎯 Objective

Create a system where a Work Item created in Azure DevOps sends an HTTP notification to a local Node.js application, which receives and logs the event.

---

# 🧠 PHASE 0 — Setup

---

## 🟩 0.1 — Requirements

Verify:

* Node.js installed
* Access to Azure DevOps
* A created Azure DevOps project

---

## 🟩 0.2 — Get project URL

Go to:

[Azure DevOps](https://dev.azure.com?utm_source=chatgpt.com)

Identify:

```text id="orgproj"
https://dev.azure.com/{org}/{project}
```

---

## 🧪 VALIDATION 0.2

✔ Project opens in browser without errors
✔ Boards section is accessible

---

# 🧠 PHASE 1 — Create Node.js receiver app

---

## 🟩 1.1 — Create project

```bash id="n1"
mkdir ado-webhook-app
cd ado-webhook-app
npm init -y
```

---

## 🟩 1.2 — Install Express

```bash id="n2"
npm install express
```

---

## 🟩 1.3 — Create server

Create file:

```text id="file1"
index.js
```

Code:

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

## 🟩 1.4 — Run server

```bash id="n4"
node index.js
```

---

## 🧪 VALIDATION 1

✔ Output must show:

```text id="v1"
Server running on http://localhost:3000
```

✔ Server must be reachable at:

```text id="v2"
http://localhost:3000
```

---

# 🧠 PHASE 2 — Expose local server

---

## 🟩 2.1 — Expose localhost

```bash id="n5"
npx ngrok http 3000
```

---

## 🟩 2.2 — Get public URL

Example:

```text id="ng1"
https://abc123.ngrok.io
```

---

## 🧪 VALIDATION 2

✔ ngrok runs without errors
✔ Public URL opens successfully in browser
✔ Server responds via ngrok tunnel

---

# 🧠 PHASE 3 — Configure Azure DevOps Webhook

---

## 🟩 3.1 — Open Service Hooks

In Azure DevOps:

```text id="n6"
Project Settings → Service Hooks → Create Subscription
```

---

## 🟩 3.2 — Select event

Choose:

```text id="n7"
Work item created
```

---

## 🟩 3.3 — Select Webhook

Choose:

```text id="n8"
Web Hooks
```

---

## 🟩 3.4 — Configure URL

Set:

```text id="n9"
https://YOUR_NGROK_URL/webhook
```

---

## 🟧 VALIDATION 3

✔ Subscription is created successfully
✔ Webhook configuration is saved
✔ Test button is available

---

## 🟩 3.5 — Test webhook

Trigger test event from Azure DevOps

---

## 🟧 VALIDATION 3.5

✔ Request is received by Node.js app
✔ Console prints JSON payload
✔ HTTP 200 response is returned

---

# 🧠 PHASE 4 — Create real Work Item

---

## 🟩 4.1 — Create Work Item

Go to:

```text id="n10"
Boards → Work Items → New Work Item
```

Create:

```text id="n11"
Title: Test webhook event
```

Save it.

---

## 🟧 FINAL VALIDATION

---

### ✔ VALIDATION 4.1 — Node.js console

Expected output:

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

### ✔ VALIDATION 4.2 — Azure DevOps UI

Go to:

```text id="v4"
Boards → Work Items
```

Verify:

✔ Work Item exists
✔ Title is visible
✔ ID is assigned

---

### ✔ VALIDATION 4.3 — Network validation

In ngrok terminal:

✔ POST request received on `/webhook`
✔ Status 200 OK returned

---

# 🧠 PHASE 5 — End-to-end flow validation

Verify full pipeline:

```text id="flow"
Azure DevOps → Service Hook → ngrok → Node.js → Console log
```

✔ All steps executed successfully
✔ No 401 / 404 / timeout errors
✔ Event payload matches created Work Item
