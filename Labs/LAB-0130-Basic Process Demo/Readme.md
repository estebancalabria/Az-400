## LAB-0130 - Basic Process Demo

### Case: QuickBite – Online Restaurant Reservation Startup

### Process: Basic

---

**Speech introductorio:**

> "QuickBite es una startup que permite a los clientes reservar mesas en restaurantes online. El equipo es chico y elige el proceso Basic — sin ceremonias, sin sprints, flujo simple. Vamos a ver cómo se organiza el trabajo usando la jerarquía Epic → Issue → Task y cómo los items avanzan por los estados."

---

### Paso 1 – Crear el proyecto

**Azure DevOps home → New Project**

| Campo | Valor |
|---|---|
| Name | `QuickBite` |
| Process | Basic |
| Visibility | Private |

---

### Paso 2 – Crear las Épicas

> "Las épicas son los grandes bloques de trabajo. En QuickBite tenemos dos: una para el cliente y una para el dueño del restaurante."

**Boards → Work Items → New Work Item → Epic**

| Título |
|---|
| `Online Reservation System` |
| `Restaurant Management Panel` |

---

### Paso 3 – Crear Issues bajo cada Épica

> "Los Issues son las funcionalidades concretas. Cada uno vive debajo de una épica. Para crearlos como hijos, abrimos la épica y usamos Add child."

**Abrir cada Epic → Add child → Issue**

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

### Paso 4 – Crear Tasks bajo cada Issue

> "Las Tasks son las tareas técnicas concretas que un desarrollador hace para resolver un Issue."

**Abrir cada Issue → Add child → Task**

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

### Paso 5 – Verificar la jerarquía

**Boards → Work Items**

> "Acá ven todos los items. Pero la jerarquía se ve mejor en el Backlog."

**Boards → Backlogs**

> "Expandan las épicas. Ven cómo los Issues cuelgan de cada Epic, y las Tasks de cada Issue. Esta es la estructura completa del trabajo de QuickBite."

---

### Paso 6 – Simular el flujo de estados

> "En Basic el flujo es simple: To Do → Doing → Done. Vamos a simular que el equipo avanza con el primer Issue."

Ir a **Boards → Boards** y mover los siguientes items:

| Work Item | Estado actual | Mover a |
|---|---|---|
| `Search available restaurants by date and time` | To Do | Doing |
| `Design search filter UI` | To Do | Doing |
| `Build search API endpoint` | To Do | Doing |

> "El Issue está en Doing porque el equipo está trabajando en él. Las Tasks también. Ahora simulamos que terminan las tasks."

| Work Item | Mover a |
|---|---|
| `Design search filter UI` | Done |
| `Build search API endpoint` | Done |
| `Connect frontend to search API` | Done |

> "Todas las Tasks están Done. ¿El Issue se cierra solo? No. En Azure DevOps Basic el estado del Issue es independiente. El equipo decide cuándo mover el Issue a Done. Eso refleja que 'Done' en un Issue significa que la funcionalidad está completa y validada, no solo que las tasks técnicas terminaron."

Mover el Issue a Done:

| Work Item | Mover a |
|---|---|
| `Search available restaurants by date and time` | Done |

---

### Cierre

> "Eso es Basic. Jerarquía simple, flujo simple. Cuando el negocio crezca y necesiten sprints, planning, story points y retrospectivas — ahí pasan a Scrum o Agile. Pero para una startup que recién arranca, Basic es suficiente."

