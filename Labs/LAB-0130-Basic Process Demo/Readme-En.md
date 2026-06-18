## LAB-0130 - Basic Process Demo
### Case: QuickBite – Online Restaurant Reservation Startup
### Process: Basic

---

**Introductory speech:**

> "QuickBite is a startup that allows customers to book restaurant tables online. The team is small and chooses the Basic process — no ceremonies, no sprints, simple flow. We're going to see how work is organized using the Epic → Issue → Task hierarchy and how items move through states."

---

### Step 1 – Create the project

**Azure DevOps home → New Project**

| Field | Value |
|---|---|
| Name | `QuickBite` |
| Process | Basic |
| Visibility | Private |

---

### Step 2 – Create the Epics

> "Epics are the large blocks of work. In QuickBite we have two: one for the customer and one for the restaurant owner."

**Boards → Work Items → New Work Item → Epic**

| Title |
|---|
| `Online Reservation System` |
| `Restaurant Management Panel` |

---

### Step 3 – Create Issues under each Epic

> "Issues are the concrete features. Each one lives under an epic. To create them as children, open the epic and use Add child."

**Open each Epic → Add child → Issue**

**Epic: Online Reservation System**

| Issue |
|---|
| `Search available restaurants by date and time` |
| `Select table and confirm reservation` |
| `Send confirmation email to customer` |

**Epic: Restaurant Management Panel**

| Issue |
|---|
| `View daily reservation list` |
| `Cancel or modify a reservation` |
| `Configure restaurant availability schedule` |

---

### Step 4 – Create Tasks under each Issue

> "Tasks are the concrete technical work that a developer does to resolve an Issue."

**Open each Issue → Add child → Task**

**Issue: Search available restaurants by date and time**

| Task |
|---|
| `Design search filter UI` |
| `Build search API endpoint` |
| `Connect frontend to search API` |

**Issue: Send confirmation email to customer**

| Task |
|---|
| `Integrate email service provider` |
| `Design confirmation email template` |

**Issue: View daily reservation list**

| Task |
|---|
| `Build reservations list API` |
| `Design dashboard table view` |

---

### Step 5 – Verify the hierarchy

**Boards → Work Items**

> "Here you can see all items. But the hierarchy is better visualized in the Backlog."

**Boards → Backlogs**

> "Expand the epics. You can see how Issues hang under each Epic, and Tasks under each Issue. This is the complete work structure for QuickBite."

---

### Step 6 – Simulate the state flow

> "In Basic the flow is simple: To Do → Doing → Done. We're going to simulate the team making progress on the first Issue."

Go to **Boards → Boards** and move the following items:

| Work Item | Current State | Move to |
|---|---|---|
| `Search available restaurants by date and time` | To Do | Doing |
| `Design search filter UI` | To Do | Doing |
| `Build search API endpoint` | To Do | Doing |

> "The Issue is in Doing because the team is working on it. The Tasks are too. Now let's simulate the tasks getting completed."

| Work Item | Move to |
|---|---|
| `Design search filter UI` | Done |
| `Build search API endpoint` | Done |
| `Connect frontend to search API` | Done |

> "All Tasks are Done. Does the Issue close automatically? No. In Azure DevOps Basic the Issue state is independent. The team decides when to move the Issue to Done. This reflects that 'Done' on an Issue means the feature is complete and validated — not just that the technical tasks are finished."

Move the Issue to Done:

| Work Item | Move to |
|---|---|
| `Search available restaurants by date and time` | Done |

---

### Closing

> "That's Basic. Simple hierarchy, simple flow. When the business grows and they need sprints, planning, story points, and retrospectives — that's when they move to Scrum or Agile. But for a startup just getting started, Basic is enough."
