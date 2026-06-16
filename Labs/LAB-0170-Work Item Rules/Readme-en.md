# 🧪 Lab: Work Item Rules in Azure DevOps (with real test cases)

## 🎯 Objective

Configure Work Item Rules in Azure DevOps and validate them using **real test Work Items**, verifying:

* field validations
* conditional rules
* state-based restrictions

---

# 🧠 PHASE 0 — Preparation

---

## 🟩 0.1 — Requirements

Verify:

* Azure DevOps access
* A project is created
* Permissions to edit Process

---

## 🟩 0.2 — Go to Process

[Azure DevOps](https://dev.azure.com?utm_source=chatgpt.com)

Navigate to:

```text id="p0"
Organization Settings → Boards → Process
```

---

## 🧪 VALIDATION 0.2

✔ You can see the list of processes
✔ Agile or Scrum process exists

---

## 🟩 0.3 — Create inherited process

```text id="p1"
Agile → Create inherited process
Name: AI-Lab-Process
```

---

## 🧪 VALIDATION 0.3

✔ Process appears as editable
✔ It is not a “system” process

---

## 🟩 0.4 — Open Task Work Item Type

```text id="p2"
AI-Lab-Process → Work Item Types → Task
```

---

## 🧪 VALIDATION 0.4

✔ You can see tabs: Layout / States / Rules

---

# 🧪 PHASE 1 — RULE 1: Assigned To is required

---

## 🟩 1.1 — Create rule

```text id="r1"
IF Work Item is created
THEN Assigned To = Required
```

---

## 🧪 TEST CASE 1 (BEFORE VALIDATION)

Create Work Item:

```text id="t1"
Type: Task
Title: Task without assignee (test case 1)
Assigned To: EMPTY
```

---

## 🧪 VALIDATION 1

✔ Try saving the Task
✔ It must be blocked
✔ Message: Assigned To required

---

# 🧪 PHASE 2 — RULE 2: Priority → Due Date required

---

## 🟩 2.1 — Create rule

```text id="r2"
IF Priority = 1
THEN Due Date = Required
```

---

## 🧪 TEST CASE 2

Create Work Item:

```text id="t2"
Type: Task
Title: Priority 1 without due date
Priority: 1
Due Date: EMPTY
```

---

## 🧪 VALIDATION 2

✔ Try saving
✔ It must be blocked
✔ Due Date must be required

---

# 🧪 PHASE 3 — RULE 3: Done requires Remaining Work = 0

---

## 🟩 3.1 — Create rule

```text id="r3"
IF State = Done
THEN Remaining Work = 0
```

---

## 🧪 TEST CASE 3

Create Work Item:

```text id="t3"
Type: Task
Title: Done with remaining work
State: Done
Remaining Work: 5
```

---

## 🧪 VALIDATION 3

✔ It must NOT allow moving to Done
OR
✔ It must force Remaining Work = 0
✔ State is blocked or reverted

---

# 🧪 PHASE 4 — RULE 4: Closed requires Reason

---

## 🟩 4.1 — Create rule

```text id="r4"
IF State = Closed
THEN Reason = Required
```

---

## 🧪 TEST CASE 4

Create Work Item:

```text id="t4"
Type: Task
Title: Closed without reason
State: Closed
Reason: EMPTY
```

---

## 🧪 VALIDATION 4

✔ Task cannot be closed
✔ Reason field is required

---

# 🧪 PHASE 5 — POSITIVE CASE (regression control)

---

## 🟩 5.1 — Create valid Work Item

```text id="t5"
Type: Task
Title: Valid Task
Assigned To: OK_USER
Priority: 1
Due Date: 2026-06-20
Remaining Work: 0
State: Active
```

---

## 🧪 VALIDATION 5

✔ Saved successfully
✔ No rule violations
✔ Work Item appears in Boards

---

# 🧠 PHASE 6 — GLOBAL SYSTEM VALIDATION

---

Verify full behavior:

```text id="flow"
Create Work Item → Apply Rules → Block invalid cases → Allow valid case
```

---

## 🧪 FINAL CHECK

✔ Case 1 blocked
✔ Case 2 blocked
✔ Case 3 blocked
✔ Case 4 blocked
✔ Case 5 allowed

---

# 🚀 FINAL RESULT

After completing this lab:

* Azure DevOps enforces Work Item Rules automatically
* Rules apply during creation and transitions
* Behavior is validated using real test cases (not theory)
