# 🧪 Lab: Creating an AI Process in Azure DevOps (from scratch)

## 🎯 Exercise Context

In traditional software projects we use:

```text
Epic → Feature → User Story → Task
```

But in **Artificial Intelligence projects**, this model becomes insufficient.

Because in AI you don’t only “build features”, you also:

* design prompts
* test models
* evaluate outputs
* manage datasets
* deploy experiments

So we need a workflow closer to this reality:

```text
Idea → Prompt → Dataset → Evaluation → Deployment
```

This lab teaches you how to adapt Azure DevOps to a real AI workflow.

---

# 🧠 What each concept represents

Before creating anything, let’s understand the meaning behind each item.

---

## 🟣 Epic (High-level vision)

👉 Example:

```text
AI-powered Technical Support Assistant
```

📌 This represents the global objective of the system.

---

## 🔵 Use Case (Feature equivalent)

👉 Example:

```text
Automatically answer user questions
```

📌 A concrete capability within the system.

---

## 🟢 Prompt (new Work Item type)

👉 Example:

```text
Prompt to answer frequently asked questions
```

📌 This is the “brain” of the AI system.

In AI, the prompt is not just text — it is part of the system logic.

---

## 🟡 Dataset

👉 Example:

```text
Real customer frequently asked questions dataset
```

📌 Without data, there is no evaluation or improvement.

---

## 🟠 Evaluation

👉 Example:

```text
Measure accuracy of model responses
```

📌 AI systems are never “finished” — they are continuously evaluated.

---

## 🔴 Deployment

👉 Example:

```text
Publish the model as a REST API
```

📌 This is how the AI system reaches production.

---

# 🧪 STEP-BY-STEP LAB

---

## 🟩 STEP 1 — Access Azure DevOps

Go to:

[Azure DevOps](https://dev.azure.com?utm_source=chatgpt.com)

Sign in and enter your organization.

---

## 🟩 STEP 2 — Create a new process

1. Go to ⚙️ **Organization Settings**
2. Select:

```text
Boards → Process
```

3. Choose:

```text
Agile
```

4. Click:

```text
Create inherited process
```

Name:

```text
AI Lab Process
```

---

## 🟩 STEP 3 — Create custom Work Item Types

Open your new process:

```text
AI Lab Process
```

Now create new work item types.

---

### 🟣 Epic (keep standard)

We keep Epic as-is:

```text
Epic → System vision
```

---

### 🔵 Create: Use Case

Click:

```text
New Work Item Type
```

Name:

```text
Use Case
```

📌 Why this name?

Because in AI we don’t only think in “features”, but in **model use cases**.

Examples:

* Answer questions
* Classify tickets
* Generate code

---

### 🟢 Create: Prompt

```text
Work Item Type: Prompt
```

📌 Why?

Because the prompt is:

* the core logic of the AI system
* equivalent to a critical function in software engineering

---

### 🟡 Create: Dataset

```text
Work Item Type: Dataset
```

📌 Why?

Because AI depends on real data to improve.

Without datasets there is no:

* testing
* tuning
* evaluation

---

### 🟠 Create: Evaluation

```text
Work Item Type: Evaluation
```

📌 Why?

Because AI is not “done”, it is measured:

* accuracy
* coherence
* relevance
* hallucinations

---

### 🔴 Create: Deployment

```text
Work Item Type: Deployment
```

📌 Why?

Because AI deployment is not just “pushing code”:

* exposing models
* versioning prompts
* monitoring responses

---

## 🟩 STEP 4 — Define the hierarchy

Now you define the mental model:

```text
Epic
 └─ Use Case
      └─ Prompt
      └─ Dataset
      └─ Evaluation
      └─ Deployment
```

---

## 🟩 STEP 5 — Create the project

Go to:

```text
New Project
```

Fill in:

* Name: AI Lab Project
* Process: AI Lab Process
* Version Control: Git
* Visibility: Private

Create it.

---

## 🟩 STEP 6 — Create first Epic

Go to:

```text
Boards → Work Items → New Epic
```

Title:

```text
AI-powered support assistant
```

---

## 🟩 STEP 7 — Create Use Case

Inside the Epic:

```text
Add child → Use Case
```

Example:

```text
Answer customer frequently asked questions
```

---

## 🟩 STEP 8 — Create Prompt

Inside the Use Case:

```text
Prompt → "Answer technical questions clearly and concisely"
```

---

## 🟩 STEP 9 — Dataset

```text
Dataset → Real FAQs from the support system
```

---

## 🟩 STEP 10 — Evaluation

```text
Evaluation → Measure accuracy of GPT model responses
```

---

## 🟩 STEP 11 — Deployment

```text
Deployment → REST API for the assistant in production
```

---

# 🧪 Final Result

You end up with a real AI workflow:

```text
AI Support Assistant
 └─ Answer Questions
      ├─ Prompt (brain)
      ├─ Dataset (data)
      ├─ Evaluation (quality)
      └─ Deployment (production)
```

---

# 🚀 What you learned

* Azure DevOps is not limited to Scrum
* You can model real AI systems
* Work Items can represent modern engineering concepts
* You can design experimental AI workflows like production systems
