````markdown
# 🧪 Lab: Analytics Dashboards in Azure DevOps

## 🎯 Objective
Configure an Analytics dashboard in Azure DevOps with real widgets:
* Velocity
* Burndown
* Cumulative Flow Diagram
* Lead Time / Cycle Time
* Bug Trend

Verifying that each widget displays meaningful data based on manually created work items.

---

# 🧠 PHASE 0 — Project Setup

---

## 🟩 0.1 — Requirements

Verify:
* Access to Azure DevOps
* Available organization (personal or CDX tenant)
* Administrator permissions on the project

---

## 🟩 0.2 — Create the project

Go to:
```text id="p0"
https://dev.azure.com → New Project
Name: AnalyticsLab
Visibility: Private
Version control: Git
Work item process: Scrum
```

---

## 🧪 VALIDATION 0.2
✔ Project created with **Scrum** process
✔ Visible in the projects list
✔ Boards enabled

---

## 🟩 0.3 — Configure iterations (Sprints)

Go to:
```text id="p1"
Project Settings → Boards → Project configuration → Iterations
```

Create the following iterations under the root node `AnalyticsLab`:

```text id="p2"
Sprint 1 → Start: (6 weeks ago) → End: (5 weeks ago)
Sprint 2 → Start: (4 weeks ago) → End: (3 weeks ago)
Sprint 3 → Start: (2 weeks ago) → End: (1 week ago)
Sprint 4 → Start: (today)       → End: (in 1 week)
```

> 💡 Use real calendar dates at the time of the lab. Past dates are required so that Velocity and Burndown have historical data.

---

## 🧪 VALIDATION 0.3
✔ 4 sprints appear in the iterations list
✔ Sprint 1, 2 and 3 have past dates
✔ Sprint 4 has active (current) dates

---

## 🟩 0.4 — Configure the team

Go to:
```text id="p3"
Project Settings → Teams → AnalyticsLab Team → Iterations
```

Associate all 4 sprints to the team:
```text id="p4"
Select Sprint 1, Sprint 2, Sprint 3, Sprint 4 → Save
```

---

## 🧪 VALIDATION 0.4
✔ The team has all 4 sprints associated
✔ Boards → Sprints shows all 4 sprints

---

# 🧪 PHASE 1 — Create Work Items for Velocity

---

## 🟩 1.1 — Concept

The **Velocity** widget shows how many Story Points (or work items) were completed per sprint. It requires Product Backlog Items (PBIs) in **Done** state in past sprints.

---

## 🟩 1.2 — Create PBIs for Sprint 1

Go to:
```text id="w1"
Boards → Backlogs → select Sprint 1
```

Create the following Product Backlog Items:

```text id="pbi1"
PBI #1
  Title: Implement user login
  Effort: 5
  State: Done
  Iteration: AnalyticsLab\Sprint 1
```

```text id="pbi2"
PBI #2
  Title: Configure initial database
  Effort: 3
  State: Done
  Iteration: AnalyticsLab\Sprint 1
```

```text id="pbi3"
PBI #3
  Title: Design home screen
  Effort: 2
  State: Done
  Iteration: AnalyticsLab\Sprint 1
```

> 💡 Sprint 1 total: **10 points completed**

---

## 🟩 1.3 — Create PBIs for Sprint 2

```text id="pbi4"
PBI #4
  Title: Implement shopping cart
  Effort: 8
  State: Done
  Iteration: AnalyticsLab\Sprint 2
```

```text id="pbi5"
PBI #5
  Title: Integrate payment gateway
  Effort: 5
  State: Done
  Iteration: AnalyticsLab\Sprint 2
```

```text id="pbi6"
PBI #6
  Title: Email notifications
  Effort: 3
  State: Done
  Iteration: AnalyticsLab\Sprint 2
```

> 💡 Sprint 2 total: **16 points completed**

---

## 🟩 1.4 — Create PBIs for Sprint 3

```text id="pbi7"
PBI #7
  Title: Admin panel
  Effort: 8
  State: Done
  Iteration: AnalyticsLab\Sprint 3
```

```text id="pbi8"
PBI #8
  Title: Sales reports
  Effort: 5
  State: Done
  Iteration: AnalyticsLab\Sprint 3
```

```text id="pbi9"
PBI #9
  Title: Export data to CSV
  Effort: 2
  State: Done
  Iteration: AnalyticsLab\Sprint 3
```

> 💡 Sprint 3 total: **15 points completed**

---

## 🟩 1.5 — Create PBIs for Sprint 4 (active)

```text id="pbi10"
PBI #10
  Title: Billing module
  Effort: 8
  State: Committed
  Iteration: AnalyticsLab\Sprint 4
```

```text id="pbi11"
PBI #11
  Title: External system integration
  Effort: 5
  State: Committed
  Iteration: AnalyticsLab\Sprint 4
```

```text id="pbi12"
PBI #12
  Title: Metrics dashboard
  Effort: 3
  State: In Progress
  Iteration: AnalyticsLab\Sprint 4
```

---

## 🧪 VALIDATION PHASE 1
✔ Sprint 1 has 3 PBIs in Done with total Effort = 10
✔ Sprint 2 has 3 PBIs in Done with total Effort = 16
✔ Sprint 3 has 3 PBIs in Done with total Effort = 15
✔ Sprint 4 has 3 active PBIs

---

# 🧪 PHASE 2 — Create Work Items for Burndown

---

## 🟩 2.1 — Concept

The **Burndown** widget shows how remaining work decreases throughout the sprint. It requires Tasks linked to PBIs with **Remaining Work** and dates within the active sprint.

---

## 🟩 2.2 — Create Tasks for Sprint 4

Open **PBI #10** and add the following Tasks as children:

```text id="t1"
Task #1
  Title: Design invoice schema
  Remaining Work: 0
  Activity: Development
  State: Done
  Iteration: AnalyticsLab\Sprint 4
```

```text id="t2"
Task #2
  Title: Implement billing endpoint
  Remaining Work: 4
  Activity: Development
  State: In Progress
  Iteration: AnalyticsLab\Sprint 4
```

```text id="t3"
Task #3
  Title: Unit tests for billing
  Remaining Work: 6
  Activity: Testing
  State: To Do
  Iteration: AnalyticsLab\Sprint 4
```

Open **PBI #11** and add:

```text id="t4"
Task #4
  Title: Analyze external API
  Remaining Work: 0
  Activity: Design
  State: Done
  Iteration: AnalyticsLab\Sprint 4
```

```text id="t5"
Task #5
  Title: Implement REST connector
  Remaining Work: 8
  Activity: Development
  State: To Do
  Iteration: AnalyticsLab\Sprint 4
```

Open **PBI #12** and add:

```text id="t6"
Task #6
  Title: Create dashboard components
  Remaining Work: 3
  Activity: Development
  State: In Progress
  Iteration: AnalyticsLab\Sprint 4
```

---

## 🧪 VALIDATION PHASE 2
✔ PBI #10, #11 and #12 have Tasks as child items
✔ Some Tasks in Done, others In Progress, others To Do
✔ Total Remaining Work > 0 (pending work is visible)

---

# 🧪 PHASE 3 — Create Work Items for Cumulative Flow Diagram

---

## 🟩 3.1 — Concept

The **CFD** shows the distribution of work items across states over time. It needs items that have passed through multiple states at different moments. The PBIs already created contribute, but adding a few more will enrich the chart.

---

## 🟩 3.2 — Add PBIs in different states

```text id="pbi13"
PBI #13
  Title: Advanced user management
  Effort: 5
  State: Approved
  Iteration: AnalyticsLab\Sprint 4
```

```text id="pbi14"
PBI #14
  Title: Multi-language support
  Effort: 8
  State: New
  Iteration: AnalyticsLab\Sprint 4
```

```text id="pbi15"
PBI #15
  Title: WCAG 2.1 accessibility
  Effort: 3
  State: New
  Iteration: AnalyticsLab\Sprint 4
```

> 💡 The CFD will now have items in: **New, Approved, Committed, In Progress, Done**

---

## 🧪 VALIDATION PHASE 3
✔ PBIs exist in at least 4 different states
✔ The backlog has items in New, Approved, Committed, In Progress and Done

---

# 🧪 PHASE 4 — Create Work Items for Lead Time / Cycle Time

---

## 🟩 4.1 — Concept

**Cycle Time** measures the time from when an item moves to *In Progress* until *Done*.
**Lead Time** measures from creation until *Done*.
For the widget to have data, it needs items completed in the current or recent sprint.

> ⚠️ This widget requires **Azure DevOps Services** (not available in free Basic plan organizations without Analytics enabled). If it does not appear in the widget catalog, skip to Phase 5.

---

## 🟩 4.2 — Verify availability

Go to:
```text id="lt1"
Overview → Dashboards → Add Widget → search "Cycle Time" or "Lead Time"
```

If the widget appears → continue with 4.3
If it does not appear → go directly to Phase 5

---

## 🟩 4.3 — Create PBIs with simulated state history

Create the following PBIs and manually transition them through states:

```text id="pbi16"
PBI #16
  Title: SQL query optimization
  Effort: 3
  State flow:
    1. New (create in this state)
    2. Approved (edit and change)
    3. Committed (edit and change)
    4. Done (edit and change)
  Iteration: AnalyticsLab\Sprint 3
```

```text id="pbi17"
PBI #17
  Title: API response caching
  Effort: 5
  State flow:
    1. New
    2. Committed
    3. Done
  Iteration: AnalyticsLab\Sprint 3
```

```text id="pbi18"
PBI #18
  Title: Automatic image compression
  Effort: 2
  State flow:
    1. New
    2. Approved
    3. Done
  Iteration: AnalyticsLab\Sprint 3
```

> 💡 Each state change is recorded in the work item history, which is what Analytics uses to calculate times.

---

## 🧪 VALIDATION PHASE 4
✔ PBI #16, #17 and #18 are in Done state
✔ In each one, the **History** tab shows the state transitions
✔ The Cycle Time widget can detect the time between Committed and Done

---

# 🧪 PHASE 5 — Create Work Items for Bug Trend

---

## 🟩 5.1 — Concept

The **Bug Trend** widget shows the evolution of open, closed and active bugs per sprint. It requires Bugs created and resolved across different sprints.

---

## 🟩 5.2 — Create Bugs in Sprint 1

```text id="b1"
Bug #1
  Title: Login fails with special characters
  Priority: 1
  Severity: 2 - High
  State: Done
  Iteration: AnalyticsLab\Sprint 1
```

```text id="b2"
Bug #2
  Title: Home screen does not load in IE
  Priority: 2
  Severity: 3 - Medium
  State: Done
  Iteration: AnalyticsLab\Sprint 1
```

---

## 🟩 5.3 — Create Bugs in Sprint 2

```text id="b3"
Bug #3
  Title: 500 error when processing payment
  Priority: 1
  Severity: 1 - Critical
  State: Done
  Iteration: AnalyticsLab\Sprint 2
```

```text id="b4"
Bug #4
  Title: Cart loses items on page reload
  Priority: 2
  Severity: 2 - High
  State: Done
  Iteration: AnalyticsLab\Sprint 2
```

```text id="b5"
Bug #5
  Title: Confirmation email arrives duplicated
  Priority: 3
  Severity: 3 - Medium
  State: Done
  Iteration: AnalyticsLab\Sprint 2
```

---

## 🟩 5.4 — Create Bugs in Sprint 3

```text id="b6"
Bug #6
  Title: Admin panel does not filter by date
  Priority: 2
  Severity: 2 - High
  State: Done
  Iteration: AnalyticsLab\Sprint 3
```

```text id="b7"
Bug #7
  Title: CSV export fails with more than 1000 records
  Priority: 1
  Severity: 2 - High
  State: Active
  Iteration: AnalyticsLab\Sprint 3
```

---

## 🟩 5.5 — Create Bugs in Sprint 4 (active)

```text id="b8"
Bug #8
  Title: Invoice generates incorrect amount with discount
  Priority: 1
  Severity: 1 - Critical
  State: Active
  Iteration: AnalyticsLab\Sprint 4
```

```text id="b9"
Bug #9
  Title: Dashboard does not update in real time
  Priority: 2
  Severity: 3 - Medium
  State: Active
  Iteration: AnalyticsLab\Sprint 4
```

```text id="b10"
Bug #10
  Title: REST connector timeout under load
  Priority: 1
  Severity: 2 - High
  State: New
  Iteration: AnalyticsLab\Sprint 4
```

---

## 🧪 VALIDATION PHASE 5
✔ Sprint 1: 2 bugs, all Done
✔ Sprint 2: 3 bugs, all Done
✔ Sprint 3: 2 bugs, one Done and one Active
✔ Sprint 4: 3 active/new bugs
✔ All bugs appear in Boards → Backlogs → Bugs

---

# 🧪 PHASE 6 — Create the Dashboard

---

## 🟩 6.1 — Create a new dashboard

Go to:
```text id="d1"
Overview → Dashboards → New Dashboard
```

Configure:
```text id="d2"
Name: Sprint Health
Team: AnalyticsLab Team
Visibility: Team
```

---

## 🧪 VALIDATION 6.1
✔ Dashboard "Sprint Health" appears in the list
✔ It is empty and in edit mode

---

# 🧪 PHASE 7 — Widget: Velocity

---

## 🟩 7.1 — Add widget

In the dashboard in edit mode:
```text id="w_v1"
Add Widget → search "Velocity" → Add
```

---

## 🟩 7.2 — Configure widget

```text id="w_v2"
Team: AnalyticsLab Team
Backlog: Backlog items
Number of sprints: 3
Velocity based on: Effort
```

Save configuration.

---

## 🧪 VALIDATION 7
✔ The widget shows bars for Sprint 1, Sprint 2 and Sprint 3
✔ Sprint 1: ~10 points
✔ Sprint 2: ~16 points
✔ Sprint 3: ~15 points
✔ The trend between sprints is visually clear

---

# 🧪 PHASE 8 — Widget: Burndown

---

## 🟩 8.1 — Add widget

```text id="w_b1"
Add Widget → search "Burndown" → Add
```

---

## 🟩 8.2 — Configure widget

```text id="w_b2"
Team: AnalyticsLab Team
Backlog: Stories or Tasks
Iteration: AnalyticsLab\Sprint 4
Start date: (Sprint 4 start date)
Plot burndown based on: Remaining Work
```

Save configuration.

---

## 🧪 VALIDATION 8
✔ The widget shows the ideal burndown line
✔ Completed work is visible (Tasks in Done)
✔ Remaining work > 0 (pending work exists)
✔ The actual line is above or below the ideal line

---

# 🧪 PHASE 9 — Widget: Cumulative Flow Diagram

---

## 🟩 9.1 — Add widget

```text id="w_c1"
Add Widget → search "Cumulative Flow Diagram" → Add
```

---

## 🟩 9.2 — Configure widget

```text id="w_c2"
Team: AnalyticsLab Team
Backlog: Backlog items
Period: Last 4 weeks
States: New, Approved, Committed, In Progress, Done
```

Save configuration.

---

## 🧪 VALIDATION 9
✔ The widget shows colored bands per state
✔ At least 4 states have visible area
✔ The "Done" band grows toward the right of the chart
✔ No obvious bottleneck visible — or there is one, which is worth discussing

---

# 🧪 PHASE 10 — Widget: Lead Time / Cycle Time

---

## 🟩 10.1 — Verify widget availability

```text id="w_lt1"
Add Widget → search "Lead Time" or "Cycle Time"
```

If it appears → continue with 10.2
If it does not appear → document that the plan does not include it and skip to Phase 11

---

## 🟩 10.2 — Configure Cycle Time

```text id="w_lt2"
Team: AnalyticsLab Team
Backlog: Backlog items
Period: Last 30 days
Swimlane: (leave as default)
```

Save configuration.

---

## 🧪 VALIDATION 10
✔ The widget shows a scatter plot with data points
✔ Each point represents a completed PBI
✔ The average cycle time is visible
✔ PBI #16, #17 and #18 appear as points

---

# 🧪 PHASE 11 — Widget: Bug Trend

---

## 🟩 11.1 — Add widget

```text id="w_bt1"
Add Widget → search "Bug Trend" → Add
```

---

## 🟩 11.2 — Configure widget

```text id="w_bt2"
Team: AnalyticsLab Team
Period: Last 4 sprints
States: Active, Resolved, Closed
```

Save configuration.

---

## 🧪 VALIDATION 11
✔ 4 columns are visible (one per sprint)
✔ Sprint 1 and 2 show resolved bugs
✔ Sprint 4 shows active unresolved bugs
✔ The trend shows whether bugs are increasing or decreasing

---

# 🧠 PHASE 12 — Analysis and Interpretation

---

## 🟩 12.1 — Read the dashboard as an Engineering Manager

With the complete dashboard, answer the following questions:

```text id="q1"
1. Did the team improve its velocity between Sprint 1 and Sprint 3?
2. Is Sprint 4 on track to complete on time according to the Burndown?
3. Is there any state where work is accumulating according to the CFD?
4. Is the average Cycle Time acceptable for this type of work?
5. Is the number of active bugs in Sprint 4 concerning compared to previous sprints?
```

---

## 🧪 FINAL CHECK

✔ Dashboard "Sprint Health" has 5 widgets configured
✔ Velocity shows data from 3 historical sprints
✔ Burndown reflects the real state of Sprint 4
✔ CFD shows item distribution by state
✔ Lead Time / Cycle Time has visible data points (if plan allows)
✔ Bug Trend shows evolution across 4 sprints
✔ The student can interpret what each chart communicates

---

# 🚀 FINAL RESULT

After completing this lab:
* Azure DevOps Analytics has real data to process
* The "Sprint Health" dashboard tells the team's story at a glance
* The difference between operational queries (Boards) and Analytics (historical trends) is understood
* The student can replicate this process in a real project within their organization
````
