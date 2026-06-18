## LAB-0131 – Agile Process Demo

### Case: MediBook – Online Medical Appointment Platform
### Process: Agile

---

**Introductory speech:**

> "MediBook is a platform where patients can book medical appointments online and clinic administrators manage doctors, specialties, and reports. The team chooses Agile — they work with User Stories, sprints, and a well-defined state flow. Let's build the work structure."

---

### Step 1 – Create the project

**Azure DevOps home → New Project**

| Field | Value |
|---|---|
| Name | `MediBook` |
| Process | Agile |
| Visibility | Private |

---

### Step 2 – Create Iterations (Sprints)

**Project Settings → Boards → Project Configuration → Iterations → New child**

| Name | Start Date | End Date |
|---|---|---|
| `Sprint 1` | July 7, 2025 | July 18, 2025 |
| `Sprint 2` | July 21, 2025 | August 1, 2025 |
| `Sprint 3` | August 4, 2025 | August 15, 2025 |

**Project Settings → Boards → Team configuration → Iterations**

Add all 3 sprints to the default team.

---

### Step 3 – Create the Epics

**Boards → Work Items → New Work Item → Epic**

| Title |
|---|
| `Patient Portal` |
| `Clinic Administration` |

---

### Step 4 – Create Features under each Epic

> "In Agile, between the Epic and the User Story there is a Feature — a functional grouping that helps organize related stories."

**Open each Epic → Add child → Feature**

**Epic: Patient Portal**

| Feature |
|---|
| `Appointment Booking` |
| `Patient Account Management` |

**Epic: Clinic Administration**

| Feature |
|---|
| `Doctor Management` |
| `Reporting and Analytics` |

---

### Step 5 – Create User Stories under each Feature

> "User Stories describe what the user needs in their own words. They follow the format: As a [role], I want to [action], so that [benefit]."

**Open each Feature → Add child → User Story**

**Feature: Appointment Booking**

| User Story | Sprint |
|---|---|
| `As a patient, I want to search for doctors by specialty so that I can find the right professional` | Sprint 1 |
| `As a patient, I want to book an available time slot so that I can confirm my appointment` | Sprint 1 |
| `As a patient, I want to receive a confirmation email so that I have a record of my appointment` | Sprint 2 |
| `As a patient, I want to cancel my appointment so that the slot becomes available for others` | Sprint 2 |

**Feature: Patient Account Management**

| User Story | Sprint |
|---|---|
| `As a patient, I want to register with my email so that I can access the platform` | Sprint 1 |
| `As a patient, I want to view my appointment history so that I can track my medical visits` | Sprint 2 |

**Feature: Doctor Management**

| User Story | Sprint |
|---|---|
| `As an admin, I want to add new doctors so that they appear available for booking` | Sprint 2 |
| `As an admin, I want to assign specialties to doctors so that patients can filter by specialty` | Sprint 3 |

**Feature: Reporting and Analytics**

| User Story | Sprint |
|---|---|
| `As an admin, I want to see daily appointment reports so that I can monitor clinic activity` | Sprint 3 |
| `As an admin, I want to export reports to Excel so that I can share them with management` | Sprint 3 |

---

### Step 6 – Create Tasks under selected User Stories

> "Tasks are the technical work behind a User Story. Let's add them to the first story to show the full hierarchy."

**Open User Story → Add child → Task**

**User Story: As a patient, I want to search for doctors by specialty**

| Task |
|---|
| `Design specialty filter UI` |
| `Build doctor search API endpoint` |
| `Connect frontend to search API` |
| `Write unit tests for search endpoint` |

---

### Step 7 – Verify the hierarchy

**Boards → Backlogs**

> "Expand the Epics. You see Features under each Epic, User Stories under each Feature, and Tasks under the Stories. This is the full Agile hierarchy: Epic → Feature → User Story → Task."

---

### Step 8 – Verify work organized by Sprint

**Boards → Sprints**

> "Here you see the work organized by time box, not by hierarchy. Select Sprint 1 — you see only the stories committed for those two weeks: search for doctors, book a time slot, and register with email. Switch to Sprint 2 — you see the confirmation email, cancellation, appointment history, and the first admin stories. Sprint 3 is all about administration and reporting."

> "This is the planning view. The backlog tells you the structure of the work — what belongs to what. The sprint view tells you the schedule — what gets done when. You need both."

---

### Step 9 – Simulate the state flow

> "In Agile the state flow is: New → Active → Resolved → Closed. Each state has a meaning."

| State | Meaning |
|---|---|
| New | Story identified, not yet started |
| Active | Team is working on it |
| Resolved | Development complete, pending validation |
| Closed | Validated and accepted |

Go to **Boards → Boards** and move the following items:

| Work Item | Move to |
|---|---|
| `As a patient, I want to search for doctors by specialty` | Active |
| `Design specialty filter UI` | Active |
| `Build doctor search API endpoint` | Active |

> "Now simulate the tasks finishing:"

| Work Item | Move to |
|---|---|
| `Design specialty filter UI` | Closed |
| `Build doctor search API endpoint` | Closed |
| `Connect frontend to search API` | Closed |
| `Write unit tests for search endpoint` | Closed |

> "All tasks are done. Now the developer marks the Story as Resolved — meaning development is complete but it hasn't been validated yet."

| Work Item | Move to |
|---|---|
| `As a patient, I want to search for doctors by specialty` | Resolved |

> "The Product Owner or QA validates the story. It works as expected."

| Work Item | Move to |
|---|---|
| `As a patient, I want to search for doctors by specialty` | Closed |

---

### Closing

> "That's Agile. Richer hierarchy than Basic, a state flow that reflects real validation stages, and work organized in sprints. The key difference from Scrum is that here the process is more flexible — there's no formal commitment ceremony. The team works story by story, sprint by sprint, adapting as they go."

