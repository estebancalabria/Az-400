# 🧪 Complete Lab: Creating Work Items in Azure DevOps (API, CLI and CSV) with Validation

## 🎯 Objective

Learn how to create Work Items in Azure DevOps without using the portal, using 3 real industry methods:

* 🔌 REST API (automation and systems)
* ⚙️ Azure DevOps CLI (quick scripts)
* 📊 CSV / Excel (bulk import)

By the end of this lab you will be able to:

* Create Work Items from code
* Validate that they were created correctly
* Understand hierarchy (Epic → Task)
* Detect common errors

---

# 🧠 PHASE 0 — Required Setup

Before running anything, you need 3 key values.

---

## 🟩 0.1 — Get ORGANIZATION and PROJECT

Go to:

[Azure DevOps](https://dev.azure.com?utm_source=chatgpt.com)

You will see a URL like:

```text id="org1"
https://dev.azure.com/my-company/AI-Lab-Project
```

📌 From this you get:

* ORG = `my-company`
* PROJECT = `AI-Lab-Project`

---

## 🟩 0.2 — Create a Personal Access Token (PAT)

Go to:

```text id="pat1"
User Settings → Personal Access Tokens
```

Create a token with:

* Scope: Work Items (Read & write)
* Expiration: 30–90 days

📌 Save it as:

```text id="pat2"
YOUR_PAT
```

⚠️ Important: it is only shown once.

---

## 🟩 0.3 — Lab rules

Always replace:

```text id="rules1"
{org} → your organization
{project} → your project
YOUR_PAT → your real token
```

---

## 🟩 0.4 — Base environment validation

Before starting, verify:

✔ You can open the project in the browser
✔ The PAT was created
✔ You have Work Items permissions

---

# 🧪 PART 1 — REST API (professional level)

---

## 🎯 Objective

Create a Work Item using HTTP.

---

## 🟩 1.1 — Endpoint

```text id="api1"
POST https://dev.azure.com/{org}/{project}/_apis/wit/workitems/$Task?api-version=7.1
```

Example:

```text id="api2"
POST https://dev.azure.com/my-company/AI-Lab-Project/_apis/wit/workitems/$Task?api-version=7.1
```

---

## 🟩 1.2 — Request body

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

## 🟩 1.3 — Execute with curl

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

## 🧪 VALIDATION (MANDATORY)

### ✔ Validation 1 — HTTP Status

Must be:

```text id="val1"
200 or 201 = OK
```

Common errors:

* 401 → incorrect PAT
* 403 → insufficient permissions
* 404 → wrong org or project

---

### ✔ Validation 2 — Response JSON

Must include:

```json id="val2"
{
  "id": 12345,
  "fields": {
    "System.Title": "REST API Task"
  }
}
```

---

### ✔ Validation 3 — Azure DevOps UI

Go to:

```text id="val3"
Boards → Work Items
```

Search:

```text id="val4"
REST API Task
```

✔ It must appear in the list

---

# 🧪 PART 2 — Azure DevOps CLI

---

## 🎯 Objective

Create Work Items without manually using the API.

---

## 🟩 2.1 — Install extension

```bash id="cli1"
az extension add --name azure-devops
```

---

## 🟩 2.2 — Login

```bash id="cli2"
az login
```

---

## 🟩 2.3 — Set defaults

```bash id="cli3"
az devops configure --defaults organization=https://dev.azure.com/my-company project=AI-Lab-Project
```

---

## 🟩 2.4 — Create Work Item

```bash id="cli4"
az boards work-item create \
  --title "CLI Task" \
  --type Task
```

---

## 🧪 VALIDATION

### ✔ Validation 1 — CLI output

Must show an ID:

```text id="cli5"
"id": 12345
```

---

### ✔ Validation 2 — Query item

```bash id="cli6"
az boards work-item show --id 12345
```

✔ Must return the Work Item

---

### ✔ Validation 3 — UI check

Go to Boards and search the Task

---

# 🧪 PART 3 — CSV / Excel (bulk import)

---

## 🎯 Objective

Create multiple Work Items without code.

---

## 🟩 3.1 — Open Queries

```text id="csv1"
Boards → Queries
```

---

## 🟩 3.2 — Create query

```text id="csv2"
Work Items and Direct Links
```

---

## 🟩 3.3 — Open in Excel

```text id="csv3"
Open in Excel
```

---

## 🟩 3.4 — Add data

| Title  | Work Item Type | State |
| ------ | -------------- | ----- |
| Task 1 | Task           | New   |
| Task 2 | Task           | New   |
| Task 3 | Task           | New   |

---

## 🟩 3.5 — Publish

```text id="csv4"
Publish
```

---

## 🧪 VALIDATION

✔ Verify in Azure DevOps UI
✔ Verify assigned IDs
✔ Verify Excel synchronization

---

# 🧠 IMPORTANT CONCEPT — Hierarchy

In Azure DevOps:

```text id="hier1"
Epic
 └─ Feature / User Story
      └─ Task
```

---

## ❓ Can a Task be created without an Epic?

✔ Yes, it can.

But:

* It loses traceability
* It is not a good practice

---

## 🔒 Can this be restricted?

✔ Partially yes:

* Work Item Rules
* Process customization
* Control queries
* API automation

But it is not enforced by default.

---

# 🔥 FINAL COMPARISON

| Method   | Use case       | Level  |
| -------- | -------------- | ------ |
| REST API | Automation, AI | High   |
| CLI      | Quick scripts  | Medium |
| CSV      | Bulk import    | Low    |

---

# 🚀 CONCLUSION

Azure DevOps is not just a web tool:

👉 It is a programmable work management platform

This enables:

* creating backlogs from code
* integrating AI to generate tasks
* automating entire projects
* scaling team management
