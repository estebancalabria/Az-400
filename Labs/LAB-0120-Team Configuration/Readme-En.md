# LAB-0120 – Team Management in Azure DevOps
## Case: TechRetail S.A. – E-commerce

---

**Introductory speech:**

> "TechRetail is an e-commerce company with three teams: developers, testers, and operations. Their system has four main modules. We're going to organize Azure DevOps so that each team only sees the work items that belong to them. Before we start, we'll create some work items and see what happens when nothing is configured."

---

### Step 1 – Create work items with no area configured

> "First we create 4 work items, one per module. They will all default to Area = project root."

**Boards → Work Items → New Work Item → Issue**

| Title |
|---|
| `Implement payment gateway` |
| `Create product detail page` |
| `Calculate shipping cost` |
| `User registration with email` |

Leave them with default values, do not touch the Area field.

Now go to **Boards → Boards**.

> "Do you see anything? No. The work items exist — we can see them in Work Items — but the board is empty. That's because no work item has an area assigned to this team. That's the problem we're going to solve."

---

### Step 2 – Create Area Paths (system modules)

> "Areas represent the modules of the product. They are labels assigned to work items to classify them by system component."

**Project Settings → Boards → Project Configuration → Areas → New child**

Create the following under the root area:

```
TechRetail-Core
├── Payments
├── Catalog
├── Shipping
└── Users
```

---

### Step 3 – Create the Teams

> "Now we create the teams. Notice that the names have nothing to do with the areas — teams are roles, areas are system modules. They are two completely different dimensions."

**Project Settings → Teams → New Team**

Create the following teams, **without checking** "Create an area path":

| Team | Description |
|---|---|
| `Dev Team` | Developers |
| `QA Team` | Testers and quality analysts |
| `Ops Team` | Operations and infrastructure |

> "Why don't we check that box? Because if we do, it automatically creates an area with the same name as the team, which causes confusion — it would look like teams and areas are the same thing."

---

### Step 4 – Assign Area Paths to each Team

> "This is the key step: we tell each team which system modules they care about."

**Project Settings → Boards → Team configuration**

At the top of the page there is a team selector. Select the team, go to the **Areas** tab, and add the corresponding areas. Repeat for each team.

| Team | Assigned Areas |
|---|---|
| `Dev Team` | Payments, Catalog |
| `QA Team` | Payments, Catalog, Shipping, Users |
| `Ops Team` | Shipping, Users |

> "QA has all areas because they test the entire system. Dev and Ops split the modules. A single module can belong to more than one team."

---

### Step 5 – Add members to each Team

**Project Settings → Teams → [select team] → Members → Add**

Assign the users created in Lesson 1 to each team.

---

### Step 6 – Assign areas to work items and verify

> "Now we'll edit the 4 work items we created at the beginning and assign them the correct area."

**Boards → Work Items → [open each work item] → Area field**

| Work Item | Area |
|---|---|
| `Implement payment gateway` | Payments |
| `Create product detail page` | Catalog |
| `Calculate shipping cost` | Shipping |
| `User registration with email` | Users |

Now go to **Boards → Boards** and use the team selector at the top left:

> "Select Dev Team. What do you see? Only the Payments and Catalog issues. Switch to QA Team. You see all 4. Switch to Ops Team. Only Shipping and Users. Same project, same work items, completely different views depending on the team."
