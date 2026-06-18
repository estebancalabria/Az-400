## LAB-0121 – Iteration Management in Azure DevOps
### Case: TechRetail S.A. – Agile Project

---

**Introductory speech:**

> "We already organized TechRetail by teams and modules. Now we need to organize the work in time. In Agile, work is divided into Sprints — fixed time boxes where the team commits to delivering something. Let's set this up."

---

### Step 1 – Create an Agile project

**Azure DevOps home → New Project**

| Field | Value |
|---|---|
| Name | `TechRetail-Agile` |
| Process | Agile |
| Visibility | Private |

---

### Step 2 – Create Iterations (Sprints)

> "Iterations are the time boxes. We define them at the project level first, then assign them to teams."

**Project Settings → Boards → Project Configuration → Iterations → New child**

| Name | Start Date | End Date |
|---|---|---|
| `Sprint 1` | July 7, 2025 | July 18, 2025 |
| `Sprint 2` | July 21, 2025 | August 1, 2025 |
| `Sprint 3` | August 4, 2025 | August 15, 2025 |

---

### Step 3 – Assign Iterations to the Team

> "Same as with areas — iterations exist at the project level but need to be assigned to a team before that team can use them."

**Project Settings → Boards → Team configuration → Iterations**

Add Sprint 1, Sprint 2, and Sprint 3 to the default team.

---

### Step 4 – Create User Stories and assign to sprints

> "In Agile the main work item is the User Story. We create a few and assign each one to a sprint."

**Boards → Work Items → New Work Item → User Story**

| Title | Assigned Sprint |
|---|---|
| `As a user, I want to pay with credit card` | Sprint 1 |
| `As a user, I want to see product details` | Sprint 1 |
| `As a user, I want to track my shipment` | Sprint 2 |
| `As a user, I want to register with my email` | Sprint 2 |
| `As an admin, I want to manage the product catalog` | Sprint 3 |

---

### Step 5 – Verify in Sprints view

**Boards → Sprints**

> "Here you see the work organized by time box. Select Sprint 1 — you see only the two stories committed for that period. This is what the team focuses on during those two weeks. Nothing else exists for them in that sprint."

Switch between sprints to show how the work is distributed across time.

---

### Step 6 – Connect both dimensions

> "Now open any User Story and look at the fields. You have Area — which module it belongs to — and Iteration — which sprint it belongs to. These are the two axes that organize all work in Azure DevOps: where it belongs in the system, and when it will be done."
