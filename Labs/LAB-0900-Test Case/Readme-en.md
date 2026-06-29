# Lab 1: Azure Test Plans — Basic Manual Testing Workflow

**Course:** AZ-400 — Designing and Implementing Microsoft DevOps Solutions  
**Estimated duration:** 45–60 minutes  
**Level:** Intermediate  

---

## Objectives

By the end of this lab you will be able to:

- Create an Azure DevOps project with a User Story
- Configure a Test Plan with a static suite
- Create a Test Case with detailed steps
- Run the test case using the Test Runner
- File a bug directly from the test execution
- Verify traceability and results in the Progress report

---

## Prerequisites

- An account at [dev.azure.com](https://dev.azure.com) (a free Microsoft account is enough)
- An Azure DevOps organization (can be created on the spot)
- No Azure subscription required

---

## Part 1 — Create the Project and User Story

### Step 1.1 — Create the project

1. Go to [https://dev.azure.com](https://dev.azure.com) and sign in.
2. Click **New project** (top right).
3. Fill in the fields:
   - **Project name:** `OnlineStore`
   - **Visibility:** Private
   - **Version control:** Git
   - **Work item process:** Scrum
4. Click **Create**.

> ℹ️ The **Scrum** process includes the **Product Backlog Item (PBI)** work item type, which we use as a User Story in this lab.

---

### Step 1.2 — Create a User Story

1. In the left menu, click **Boards → Backlogs**.
2. Click **+ New Work Item** and type:
   - `As a user I want to search for products by name`
   - Press Enter.
3. Open the User Story (click on the title) and fill in:
   - **State:** Approved
   - **Description:** The user can type text into a search bar and see filtered results in real time.
4. Click **Save & Close**.

---

## Part 2 — Create the Test Plan and Test Suite

### Step 2.1 — Access Azure Test Plans

1. In the left menu, click **Test Plans**.

> ℹ️ If **Test Plans** is not visible in the menu, check **Organization Settings → Billing** to confirm access is enabled. A free tier is available.

---

### Step 2.2 — Create the Test Plan

1. Click **+ New Test Plan**.
2. Fill in:
   - **Name:** `Sprint 1 - Regression`
   - **Area path:** `OnlineStore`
   - **Iteration:** `OnlineStore\Sprint 1` (if it doesn't exist, select the root)
3. Click **Create**.

> ℹ️ When a Test Plan is created, Azure DevOps automatically generates a **root suite** with the same name. In this lab we use it directly, without creating child suites.

---

### Step 2.3 — Verify the root suite

1. In the left panel you will see the suite tree with a single entry: `Sprint 1 - Regression`.
2. Click on it to select it.
3. The right panel shows the list of test cases (empty for now).

---

## Part 3 — Create the Test Case

### Step 3.1 — Add the test case

1. With the suite selected, click **+ New Test Case**.
2. Fill in:
   - **Title:** `Verify search with a valid term`
3. In the **Steps** section, add the following steps:

| # | Action | Expected Result |
|---|--------|-----------------|
| 1 | Open the OnlineStore home page | The page loads correctly |
| 2 | Click on the search bar | The search bar is active with cursor focus |
| 3 | Type "sneakers" and press Enter | Results containing "sneakers" are displayed |
| 4 | Verify that at least one result is visible | The list shows a minimum of 1 product |

4. Click **Save & Close**.

> ℹ️ Each row in the Steps grid has two fields: **Action** (what the tester does) and **Expected Result** (what should happen). Filling in both is essential for the test to be reproducible.

---

## Part 4 — Run the Test Case

### Step 4.1 — Start the test run

1. In the right panel, the test case `Verify search with a valid term` shows status **Not Run**.
2. Select it with the checkbox and click **Run → Run for web application**.
3. The **Test Runner** opens in a new window or side panel.

---

### Step 4.2 — Execute the steps

1. The Test Runner displays the test case with its 4 steps.
2. Mark each step using the icons on the right: ✓ Pass or ✗ Fail.
3. Mark steps 1, 2, and 3 as **Pass**.
4. Mark step 4 as **Fail**.

> ℹ️ There is no real application in this lab. We simulate the outcome as a tester would when finding a defect.

---

### Step 4.3 — File a Bug from the Test Runner

1. With step 4 marked as Fail, click **Create bug** (shown as a button or icon in the panel).
2. The Bug form opens with pre-filled data:
   - **Title:** you can edit it, for example: `[Search] Product list does not show results for a valid search term`
   - **Repro Steps:** Azure automatically copies the test case steps
3. Fill in:
   - **Priority:** 1
   - **Severity:** 2 - High
4. Click **Save**.

> ℹ️ The bug is automatically linked to the Test Case and the Test Plan. No manual linking required.

---

### Step 4.4 — Close the Test Runner

1. Click **Save and close** in the Test Runner.
2. The test case now shows status **Failed** in the suite panel.

---

## Part 5 — Review Results and Traceability

### Step 5.1 — Check the Progress report

1. In the Test Plans left menu, click **Progress report**.
2. Select the plan `Sprint 1 - Regression`.
3. You should see:
   - 1 test case executed
   - Status: Failed
   - A chart showing the breakdown of results

---

### Step 5.2 — Verify bug traceability

1. Go to **Boards → Work Items**.
2. Open the bug you created.
3. In the **Links** section verify:
   - Link to the **Test Case** (type: *Tested by*)
   - Link to the **Test Result**

---

### Step 5.3 — Verify traceability from the User Story

1. Open the User Story `As a user I want to search for products by name`.
2. In the **Links** section verify that the **Test Case** is linked.
3. From there you can navigate to the Test Case and the Bug.

The full chain is: **User Story → Test Case → Test Result → Bug**

---

## Summary

| Activity | Outcome |
|----------|---------|
| Project + User Story | Work item ready in the backlog |
| Test Plan + root suite | Minimal test structure created |
| Test Case with 4 steps | Search scenario defined and reproducible |
| Test Runner execution | Failed result recorded |
| Bug filed from the runner | Bug automatically linked |
| Progress report + traceability | US → TC → Bug chain verified |

---

## Optional Challenge

- Re-run the test case and mark all steps as **Pass**. Observe how the Progress report changes.
- Browse the **Runs** section to see the execution history of the plan.
- Open the bug and change its state to **Resolved**. Check whether the change is reflected from the Test Case.
