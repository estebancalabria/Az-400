## LAB-0121 – Gestión de Iteraciones en Azure DevOps
### Caso: TechRetail S.A. – Proyecto Agile

---

**Speech introductorio:**

> "Ya organizamos TechRetail por equipos y módulos. Ahora necesitamos organizar el trabajo en el tiempo. En Agile, el trabajo se divide en Sprints — períodos fijos en los que el equipo se compromete a entregar algo. Vamos a configurar eso."

---

### Paso 1 – Crear un proyecto Agile

**Azure DevOps home → New Project**

| Campo | Valor |
|---|---|
| Name | `TechRetail-Agile` |
| Process | Agile |
| Visibility | Private |

---

### Paso 2 – Crear Iteraciones (Sprints)

> "Las iteraciones son los períodos de tiempo. Las definimos primero a nivel de proyecto, y después las asignamos a los teams."

**Project Settings → Boards → Project Configuration → Iterations → New child**

| Nombre | Fecha inicio | Fecha fin |
|---|---|---|
| `Sprint 1` | 7 de julio 2025 | 18 de julio 2025 |
| `Sprint 2` | 21 de julio 2025 | 1 de agosto 2025 |
| `Sprint 3` | 4 de agosto 2025 | 15 de agosto 2025 |

---

### Paso 3 – Asignar Iteraciones al Team

> "Igual que con las areas — las iteraciones existen a nivel de proyecto pero hay que asignarlas al team antes de que ese team pueda usarlas."

**Project Settings → Boards → Team configuration → Iterations**

Agregar Sprint 1, Sprint 2 y Sprint 3 al team por defecto.

---

### Paso 4 – Crear User Stories y asignarlas a sprints

> "En Agile el work item principal es la User Story. Creamos algunas y asignamos cada una a un sprint."

**Boards → Work Items → New Work Item → User Story**

| Título | Sprint asignado |
|---|---|
| `As a user, I want to pay with credit card` | Sprint 1 |
| `As a user, I want to see product details` | Sprint 1 |
| `As a user, I want to track my shipment` | Sprint 2 |
| `As a user, I want to register with my email` | Sprint 2 |
| `As an admin, I want to manage the product catalog` | Sprint 3 |

---

### Paso 5 – Verificar en la vista de Sprints

**Boards → Sprints**

> "Acá ven el trabajo organizado por período de tiempo. Seleccionen Sprint 1 — ven solo las dos stories comprometidas para ese período. Eso es en lo que el equipo se enfoca durante esas dos semanas. Para ellos, en ese sprint, no existe nada más."

Cambiar entre sprints para mostrar cómo el trabajo está distribuido en el tiempo.

---

### Paso 6 – Conectar las dos dimensiones

> "Ahora abran cualquier User Story y miren los campos. Tienen Area — a qué módulo pertenece — e Iteration — a qué sprint pertenece. Estos son los dos ejes que organizan todo el trabajo en Azure DevOps: dónde vive en el sistema, y cuándo se va a hacer."

