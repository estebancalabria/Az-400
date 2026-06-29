# Lab 5: Azure Test Plans — Exploratory Sessions

**Course:** AZ-400 — Designing and Implementing Microsoft DevOps Solutions  
**Estimated duration:** 40–50 minutes  
**Level:** Intermediate  

---

## Objectives

By the end of this lab you will be able to:

- Create an Azure DevOps project with a User Story
- Start an exploratory testing session from Azure Test Plans
- Record bugs and notes during the session
- Associate findings to a User Story
- Review the session summary after closing it

---

## Prerequisites

- An account at [dev.azure.com](https://dev.azure.com) (a free Microsoft account is enough)
- An Azure DevOps organization (can be created on the spot)
- **Microsoft Edge** or **Google Chrome** with the **Test & Feedback** extension installed
- No Azure subscription required

> ℹ️ **Required extension:** Exploratory sessions run from the browser using the Microsoft **Test & Feedback** extension. Install it from the Chrome Web Store or Edge Add-ons before starting the lab.  
> Direct link: [aka.ms/ATPExtension](https://aka.ms/ATPExtension)

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

## Part 2 — Configure the Test & Feedback Extension

### Step 2.1 — Verify the installation

1. In the browser, find the **Test & Feedback** extension icon in the toolbar (beaker/flask icon).
2. Click on it to open the extension.
3. If it's the first time, the extension will ask you to connect to an Azure DevOps organization.

---

### Step 2.2 — Connect the extension to the project

1. In the extension panel, select **Connected** mode.
2. Enter your organization URL: `https://dev.azure.com/[your-organization]`
3. Click **Next**.
4. Select the project `OnlineStore`.
5. Click **Save**.

> ℹ️ The extension has two modes: **Standalone** (no connection to Azure DevOps) and **Connected** (linked to the project). This lab uses **Connected** because we need to associate findings to the User Story.

---

## Part 3 — Start the Exploratory Session

### Step 3.1 — Start the session from Test Plans

1. In Azure DevOps, go to **Test Plans → Exploratory sessions**.
2. Click **New session**.
3. In the **Explore** field, search for and select the User Story:
   - `As a user I want to search for products by name`
4. Click **Start session**.

> ℹ️ You can also start the session directly from the browser extension by clicking the ▶ (Start session) button. Both approaches are equivalent.

---

### Step 3.2 — Verify the session is active

1. The extension icon in the browser shows an active session indicator (green dot or time counter).
2. Navigate to any website to simulate exploration. In this lab we use [https://www.bing.com](https://www.bing.com) as a test application (it has a search bar).

---

## Part 4 — Explore and Record Findings

### Step 4.1 — Take an annotated screenshot

1. With the session active, click on the extension icon.
2. Select **Screenshot** (camera icon).
3. Select the area of the screen you want to capture (the search bar).
4. The annotation editor opens. Add:
   - A rectangle highlighting the search bar
   - A text label: `What happens if the field is left empty?`
5. Click **Save screenshot**.

> ℹ️ Screenshots are attached to the bug or note you create next. They are not lost when closing the extension.

---

### Step 4.2 — File a Bug

1. In the extension panel, click **Create bug** (bug icon).
2. Fill in the form:
   - **Title:** `Search bar accepts empty input without showing an error`
   - **Repro Steps:** Azure pre-fills with the current URL and the attached screenshot
   - **Priority:** 2
   - **Severity:** 3 - Medium
3. Click **Save**.

> ℹ️ The bug is automatically linked to the User Story you selected when starting the session.

---

### Step 4.3 — Add a note

1. In the extension panel, click **Add note** (notepad icon).
2. Type:
   - `Check behavior with special characters: <, >, ", '`
3. Click **Save**.

> ℹ️ Notes are used to record ideas, questions, or scenarios to test later, without creating a formal bug.

---

### Step 4.4 — File a second Bug

1. Navigate to Bing's search results page (run any search).
2. Click **Screenshot**, capture the results and annotate: `Results do not show price or availability`.
3. Create a bug:
   - **Title:** `Search results do not include product price information`
   - **Priority:** 1
   - **Severity:** 2 - High
4. Click **Save**.

---

## Part 5 — Close the Session and Review the Summary

### Step 5.1 — End the session

1. In the extension panel, click **Stop session** (stop/square icon).
2. The extension displays a session summary:
   - Total exploration time
   - Number of bugs filed
   - Number of notes taken
   - Attached screenshots
3. Click **Done**.

---

### Step 5.2 — View the session in Azure Test Plans

1. In Azure DevOps, go to **Test Plans → Exploratory sessions**.
2. The session you just closed appears with:
   - Date and duration
   - Your name as the tester
   - The explored User Story
   - The bugs and notes recorded
3. Click on the session to see the full details.

---

### Step 5.3 — Verify traceability

1. Go to **Boards → Work Items**.
2. Open any of the bugs you created.
3. In the **Links** section verify:
   - Link to the **User Story** (type: *Tested by* or *Found in*)
   - Link to the **Exploratory session**

---

## Summary

| Activity | Outcome |
|----------|---------|
| Project + User Story | Work item ready in the backlog |
| Extension connected to project | Session linked to Azure DevOps |
| Exploratory session started | Free-form testing in progress with automatic recording |
| Screenshot + annotation | Visual evidence attached to findings |
| 2 bugs filed | Bugs automatically linked to the User Story |
| Note recorded | Future test idea documented |
| Session closed | Summary generated with time and findings |
| Traceability verified | User Story → Session → Bugs |

---

## Optional Challenge

- Start a second session in **Standalone** mode (without connecting to the project) and observe what information is lost compared to Connected mode.
- Use the **Record screen** option during a session and attach the video to a bug.
- From the User Story, verify that both bugs appear in the Links section and navigate to the exploratory session.
