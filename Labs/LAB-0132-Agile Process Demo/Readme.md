## LAB-0131 – Demo Proceso Agile
### Caso: MediBook – Plataforma de Turnos Médicos Online
### Proceso: Agile

---

**Speech introductorio:**

> "MediBook es una plataforma donde los pacientes pueden sacar turnos médicos online y los administradores de clínicas gestionan médicos, especialidades y reportes. El equipo elige Agile — trabajan con User Stories, sprints y un flujo de estados bien definido. Vamos a construir la estructura de trabajo."

---

### Paso 1 – Crear el proyecto

**Azure DevOps home → New Project**

| Campo | Valor |
|---|---|
| Name | `MediBook` |
| Process | Agile |
| Visibility | Private |

---

### Paso 2 – Crear Iteraciones (Sprints)

**Project Settings → Boards → Project Configuration → Iterations → New child**

| Nombre | Fecha inicio | Fecha fin |
|---|---|---|
| `Sprint 1` | 7 de julio 2025 | 18 de julio 2025 |
| `Sprint 2` | 21 de julio 2025 | 1 de agosto 2025 |
| `Sprint 3` | 4 de agosto 2025 | 15 de agosto 2025 |

**Project Settings → Boards → Team configuration → Iterations**

Agregar los 3 sprints al team por defecto.

---

### Paso 3 – Crear las Épicas

**Boards → Work Items → New Work Item → Epic**

| Título |
|---|
| `Portal del Paciente` |
| `Administración de la Clínica` |

---

### Paso 4 – Crear Features bajo cada Épica

> "En Agile, entre la Épica y la User Story existe una Feature — una agrupación funcional que organiza stories relacionadas."

**Abrir cada Epic → Add child → Feature**

**Epic: Portal del Paciente**

| Feature |
|---|
| `Reserva de Turnos` |
| `Gestión de Cuenta del Paciente` |

**Epic: Administración de la Clínica**

| Feature |
|---|
| `Gestión de Médicos` |
| `Reportes y Análisis` |

---

### Paso 5 – Crear User Stories bajo cada Feature

> "Las User Stories describen lo que el usuario necesita en sus propias palabras. Siguen el formato: Como [rol], quiero [acción], para [beneficio]."

**Abrir cada Feature → Add child → User Story**

**Feature: Reserva de Turnos**

| User Story | Sprint |
|---|---|
| `Como paciente, quiero buscar médicos por especialidad para encontrar al profesional adecuado` | Sprint 1 |
| `Como paciente, quiero reservar un turno disponible para confirmar mi cita` | Sprint 1 |
| `Como paciente, quiero recibir un email de confirmación para tener un registro de mi turno` | Sprint 2 |
| `Como paciente, quiero cancelar mi turno para que el horario quede disponible para otros` | Sprint 2 |

**Feature: Gestión de Cuenta del Paciente**

| User Story | Sprint |
|---|---|
| `Como paciente, quiero registrarme con mi email para acceder a la plataforma` | Sprint 1 |
| `Como paciente, quiero ver mi historial de turnos para hacer seguimiento de mis visitas médicas` | Sprint 2 |

**Feature: Gestión de Médicos**

| User Story | Sprint |
|---|---|
| `Como administrador, quiero agregar nuevos médicos para que aparezcan disponibles para reservas` | Sprint 2 |
| `Como administrador, quiero asignar especialidades a los médicos para que los pacientes puedan filtrar por especialidad` | Sprint 3 |

**Feature: Reportes y Análisis**

| User Story | Sprint |
|---|---|
| `Como administrador, quiero ver reportes diarios de turnos para monitorear la actividad de la clínica` | Sprint 3 |
| `Como administrador, quiero exportar reportes a Excel para compartirlos con la gerencia` | Sprint 3 |

---

### Paso 6 – Crear Tasks bajo una User Story

> "Las Tasks son el trabajo técnico concreto detrás de una User Story. Las agregamos a la primera story para mostrar la jerarquía completa."

**Abrir User Story → Add child → Task**

**User Story: Como paciente, quiero buscar médicos por especialidad**

| Task |
|---|
| `Diseñar UI del filtro de especialidades` |
| `Construir endpoint de búsqueda de médicos` |
| `Conectar frontend con la API de búsqueda` |
| `Escribir unit tests para el endpoint de búsqueda` |

---

### Paso 7 – Verificar la jerarquía

**Boards → Backlogs**

> "Expandan las Épicas. Ven las Features bajo cada Epic, las User Stories bajo cada Feature, y las Tasks bajo las Stories. Esta es la jerarquía completa de Agile: Epic → Feature → User Story → Task."

---

### Paso 8 – Verificar el trabajo organizado por Sprint

**Boards → Sprints**

> "Acá ven el trabajo organizado por período de tiempo, no por jerarquía. Seleccionen Sprint 1 — ven solo las stories comprometidas para esas dos semanas: buscar médicos, reservar turno y registrarse. Cambien a Sprint 2 — ven el email de confirmación, la cancelación, el historial y las primeras stories de admin. Sprint 3 es todo administración y reportes."

> "Esta es la vista de planificación. El backlog te dice la estructura del trabajo — qué pertenece a qué. La vista de sprint te dice el cronograma — qué se hace cuándo. Necesitás las dos."

---

### Paso 9 – Simular el flujo de estados

> "En Agile el flujo de estados es: New → Active → Resolved → Closed. Cada estado tiene un significado."

| Estado | Significado |
|---|---|
| New | Story identificada, aún no iniciada |
| Active | El equipo está trabajando en ella |
| Resolved | Desarrollo completo, pendiente de validación |
| Closed | Validada y aceptada |

Ir a **Boards → Boards** y mover los siguientes items:

| Work Item | Mover a |
|---|---|
| `Como paciente, quiero buscar médicos por especialidad` | Active |
| `Diseñar UI del filtro de especialidades` | Active |
| `Construir endpoint de búsqueda de médicos` | Active |

> "Ahora simulamos que las tasks terminan:"

| Work Item | Mover a |
|---|---|
| `Diseñar UI del filtro de especialidades` | Closed |
| `Construir endpoint de búsqueda de médicos` | Closed |
| `Conectar frontend con la API de búsqueda` | Closed |
| `Escribir unit tests para el endpoint de búsqueda` | Closed |

> "Todas las Tasks están terminadas. Ahora el desarrollador marca la Story como Resolved — significa que el desarrollo está completo pero todavía no fue validado."

| Work Item | Mover a |
|---|---|
| `Como paciente, quiero buscar médicos por especialidad` | Resolved |

> "El Product Owner o QA valida la story. Funciona como se esperaba."

| Work Item | Mover a |
|---|---|
| `Como paciente, quiero buscar médicos por especialidad` | Closed |

---

### Cierre

> "Eso es Agile. Jerarquía más rica que Basic, un flujo de estados que refleja etapas reales de validación, y trabajo organizado en sprints. La diferencia clave con Scrum es que acá el proceso es más flexible — no hay una ceremonia formal de compromiso. El equipo trabaja story por story, sprint a sprint, adaptándose sobre la marcha."
