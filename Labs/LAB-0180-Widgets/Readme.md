# 🧪 Laboratorio: Analytics Dashboards en Azure DevOps

## 🎯 Objetivo
Configurar un dashboard de Analytics en Azure DevOps con widgets reales:
* Velocity
* Burndown
* Cumulative Flow Diagram
* Lead Time / Cycle Time
* Bug Trend

Verificando que cada widget muestra datos significativos a partir de work items creados manualmente.

---

# 🧠 FASE 0 — Preparación del proyecto

---

## 🟩 0.1 — Requisitos

Verificar:
* Acceso a Azure DevOps
* Organización disponible (propia o CDX tenant)
* Permisos de administrador en el proyecto

---

## 🟩 0.2 — Crear el proyecto

Ir a:
```text id="p0"
https://dev.azure.com → New Project
Name: AnalyticsLab
Visibility: Private
Version control: Git
Work item process: Scrum
```

---

## 🧪 VALIDACIÓN 0.2
✔ Proyecto creado con proceso **Scrum**
✔ Visible en el listado de proyectos
✔ Boards habilitado

---

## 🟩 0.3 — Configurar iteraciones (Sprints)

Ir a:
```text id="p1"
Project Settings → Boards → Project configuration → Iterations
```

Crear las siguientes iteraciones bajo el nodo raíz `AnalyticsLab`:

```text id="p2"
Sprint 1 → Start: (hace 6 semanas) → End: (hace 5 semanas)
Sprint 2 → Start: (hace 4 semanas) → End: (hace 3 semanas)
Sprint 3 → Start: (hace 2 semanas) → End: (hace 1 semana)
Sprint 4 → Start: (hoy)           → End: (en 1 semana)
```

> 💡 Usar fechas reales del calendario al momento de hacer el lab. Las fechas pasadas son necesarias para que Velocity y Burndown tengan datos históricos.

---

## 🧪 VALIDACIÓN 0.3
✔ Aparecen 4 sprints en la lista de iteraciones
✔ Sprint 1, 2 y 3 tienen fechas pasadas
✔ Sprint 4 tiene fechas activas (actuales)

---

## 🟩 0.4 — Configurar el equipo

Ir a:
```text id="p3"
Project Settings → Teams → AnalyticsLab Team → Iterations
```

Asociar los 4 sprints al equipo:
```text id="p4"
Seleccionar Sprint 1, Sprint 2, Sprint 3, Sprint 4 → Save
```

---

## 🧪 VALIDACIÓN 0.4
✔ El equipo tiene los 4 sprints asociados
✔ En Boards → Sprints aparecen los 4 sprints

---

# 🧪 FASE 1 — Crear Work Items para Velocity

---

## 🟩 1.1 — Concepto

El widget **Velocity** muestra cuántos Story Points (o work items) se completaron por sprint. Necesita Product Backlog Items (PBI) en estado **Done** en sprints pasados.

---

## 🟩 1.2 — Crear PBIs para Sprint 1

Ir a:
```text id="w1"
Boards → Backlogs → seleccionar Sprint 1
```

Crear los siguientes Product Backlog Items:

```text id="pbi1"
PBI #1
  Title: Implementar login de usuarios
  Effort: 5
  State: Done
  Iteration: AnalyticsLab\Sprint 1
```

```text id="pbi2"
PBI #2
  Title: Configurar base de datos inicial
  Effort: 3
  State: Done
  Iteration: AnalyticsLab\Sprint 1
```

```text id="pbi3"
PBI #3
  Title: Diseñar pantalla de inicio
  Effort: 2
  State: Done
  Iteration: AnalyticsLab\Sprint 1
```

> 💡 Total Sprint 1: **10 puntos completados**

---

## 🟩 1.3 — Crear PBIs para Sprint 2

```text id="pbi4"
PBI #4
  Title: Implementar carrito de compras
  Effort: 8
  State: Done
  Iteration: AnalyticsLab\Sprint 2
```

```text id="pbi5"
PBI #5
  Title: Integrar pasarela de pago
  Effort: 5
  State: Done
  Iteration: AnalyticsLab\Sprint 2
```

```text id="pbi6"
PBI #6
  Title: Notificaciones por email
  Effort: 3
  State: Done
  Iteration: AnalyticsLab\Sprint 2
```

> 💡 Total Sprint 2: **16 puntos completados**

---

## 🟩 1.4 — Crear PBIs para Sprint 3

```text id="pbi7"
PBI #7
  Title: Panel de administración
  Effort: 8
  State: Done
  Iteration: AnalyticsLab\Sprint 3
```

```text id="pbi8"
PBI #8
  Title: Reportes de ventas
  Effort: 5
  State: Done
  Iteration: AnalyticsLab\Sprint 3
```

```text id="pbi9"
PBI #9
  Title: Exportar datos a CSV
  Effort: 2
  State: Done
  Iteration: AnalyticsLab\Sprint 3
```

> 💡 Total Sprint 3: **15 puntos completados**

---

## 🟩 1.5 — Crear PBIs para Sprint 4 (activo)

```text id="pbi10"
PBI #10
  Title: Módulo de facturación
  Effort: 8
  State: Committed
  Iteration: AnalyticsLab\Sprint 4
```

```text id="pbi11"
PBI #11
  Title: Integración con sistema externo
  Effort: 5
  State: Committed
  Iteration: AnalyticsLab\Sprint 4
```

```text id="pbi12"
PBI #12
  Title: Dashboard de métricas
  Effort: 3
  State: In Progress
  Iteration: AnalyticsLab\Sprint 4
```

---

## 🧪 VALIDACIÓN FASE 1
✔ Sprint 1 tiene 3 PBIs en Done con Effort total = 10
✔ Sprint 2 tiene 3 PBIs en Done con Effort total = 16
✔ Sprint 3 tiene 3 PBIs en Done con Effort total = 15
✔ Sprint 4 tiene 3 PBIs activos

---

# 🧪 FASE 2 — Crear Work Items para Burndown

---

## 🟩 2.1 — Concepto

El widget **Burndown** muestra cómo el trabajo pendiente disminuye a lo largo del sprint. Necesita Tasks asociadas a PBIs con **Remaining Work** y fechas dentro del sprint activo.

---

## 🟩 2.2 — Crear Tasks para Sprint 4

Abrir **PBI #10** y agregar las siguientes Tasks como child:

```text id="t1"
Task #1
  Title: Diseñar esquema de factura
  Remaining Work: 0
  Activity: Development
  State: Done
  Iteration: AnalyticsLab\Sprint 4
```

```text id="t2"
Task #2
  Title: Implementar endpoint de facturación
  Remaining Work: 4
  Activity: Development
  State: In Progress
  Iteration: AnalyticsLab\Sprint 4
```

```text id="t3"
Task #3
  Title: Tests unitarios de facturación
  Remaining Work: 6
  Activity: Testing
  State: To Do
  Iteration: AnalyticsLab\Sprint 4
```

Abrir **PBI #11** y agregar:

```text id="t4"
Task #4
  Title: Analizar API externa
  Remaining Work: 0
  Activity: Design
  State: Done
  Iteration: AnalyticsLab\Sprint 4
```

```text id="t5"
Task #5
  Title: Implementar conector REST
  Remaining Work: 8
  Activity: Development
  State: To Do
  Iteration: AnalyticsLab\Sprint 4
```

Abrir **PBI #12** y agregar:

```text id="t6"
Task #6
  Title: Crear componentes de dashboard
  Remaining Work: 3
  Activity: Development
  State: In Progress
  Iteration: AnalyticsLab\Sprint 4
```

---

## 🧪 VALIDACIÓN FASE 2
✔ PBI #10, #11 y #12 tienen Tasks como child items
✔ Algunas Tasks en Done, otras In Progress, otras To Do
✔ Remaining Work total > 0 (trabajo pendiente visible)

---

# 🧪 FASE 3 — Crear Work Items para Cumulative Flow Diagram

---

## 🟩 3.1 — Concepto

El **CFD** muestra la distribución de work items entre estados a lo largo del tiempo. Necesita ítems que hayan pasado por varios estados en diferentes momentos. Los PBIs ya creados sirven, pero conviene agregar algunos más para enriquecer el gráfico.

---

## 🟩 3.2 — Agregar PBIs adicionales en distintos estados

```text id="pbi13"
PBI #13
  Title: Gestión de usuarios avanzada
  Effort: 5
  State: Approved
  Iteration: AnalyticsLab\Sprint 4
```

```text id="pbi14"
PBI #14
  Title: Soporte multi-idioma
  Effort: 8
  State: New
  Iteration: AnalyticsLab\Sprint 4
```

```text id="pbi15"
PBI #15
  Title: Accesibilidad WCAG 2.1
  Effort: 3
  State: New
  Iteration: AnalyticsLab\Sprint 4
```

> 💡 El CFD ahora tendrá ítems en: **New, Approved, Committed, In Progress, Done**

---

## 🧪 VALIDACIÓN FASE 3
✔ Hay PBIs en al menos 4 estados distintos
✔ El backlog tiene ítems en New, Approved, Committed, In Progress y Done

---

# 🧪 FASE 4 — Crear Work Items para Lead Time / Cycle Time

---

## 🟩 4.1 — Concepto

**Cycle Time** mide el tiempo desde que un ítem pasa a *In Progress* hasta *Done*.
**Lead Time** mide desde que se crea hasta *Done*.
Para que el widget tenga datos, necesita ítems completados en el sprint actual o reciente.

> ⚠️ Este widget requiere el plan **Azure DevOps Services** (no está disponible en planes Basic de organizaciones gratuitas sin Analytics habilitado). Si no aparece en el catálogo de widgets, saltar a Fase 5.

---

## 🟩 4.2 — Verificar disponibilidad

Ir a:
```text id="lt1"
Overview → Dashboards → Add Widget → buscar "Cycle Time" o "Lead Time"
```

Si aparece el widget → continuar con 4.3
Si no aparece → ir directamente a Fase 5

---

## 🟩 4.3 — Crear PBIs con historial de estados simulado

Crear los siguientes PBIs y transicionarlos manualmente por los estados:

```text id="pbi16"
PBI #16
  Title: Optimización de consultas SQL
  Effort: 3
  Flujo de estados:
    1. New (crear así)
    2. Approved (editar y cambiar)
    3. Committed (editar y cambiar)
    4. Done (editar y cambiar)
  Iteration: AnalyticsLab\Sprint 3
```

```text id="pbi17"
PBI #17
  Title: Cache de respuestas API
  Effort: 5
  Flujo de estados:
    1. New
    2. Committed
    3. Done
  Iteration: AnalyticsLab\Sprint 3
```

```text id="pbi18"
PBI #18
  Title: Compresión de imágenes automática
  Effort: 2
  Flujo de estados:
    1. New
    2. Approved
    3. Done
  Iteration: AnalyticsLab\Sprint 3
```

> 💡 Cada cambio de estado queda registrado en el historial del work item, que es lo que usa Analytics para calcular tiempos.

---

## 🧪 VALIDACIÓN FASE 4
✔ PBI #16, #17 y #18 están en estado Done
✔ En cada uno, la pestaña **History** muestra las transiciones de estado
✔ El widget de Cycle Time puede detectar el tiempo entre Committed y Done

---

# 🧪 FASE 5 — Crear Work Items para Bug Trend

---

## 🟩 5.1 — Concepto

El widget **Bug Trend** muestra la evolución de bugs abiertos, cerrados y activos por sprint. Necesita Bugs creados y resueltos en distintos sprints.

---

## 🟩 5.2 — Crear Bugs en Sprint 1

```text id="b1"
Bug #1
  Title: Login falla con caracteres especiales
  Priority: 1
  Severity: 2 - High
  State: Done
  Iteration: AnalyticsLab\Sprint 1
```

```text id="b2"
Bug #2
  Title: Pantalla de inicio no carga en IE
  Priority: 2
  Severity: 3 - Medium
  State: Done
  Iteration: AnalyticsLab\Sprint 1
```

---

## 🟩 5.3 — Crear Bugs en Sprint 2

```text id="b3"
Bug #3
  Title: Error 500 al procesar pago
  Priority: 1
  Severity: 1 - Critical
  State: Done
  Iteration: AnalyticsLab\Sprint 2
```

```text id="b4"
Bug #4
  Title: Carrito pierde items al recargar
  Priority: 2
  Severity: 2 - High
  State: Done
  Iteration: AnalyticsLab\Sprint 2
```

```text id="b5">
Bug #5
  Title: Email de confirmación llega duplicado
  Priority: 3
  Severity: 3 - Medium
  State: Done
  Iteration: AnalyticsLab\Sprint 2
```

---

## 🟩 5.4 — Crear Bugs en Sprint 3

```text id="b6"
Bug #6
  Title: Panel admin no filtra por fecha
  Priority: 2
  Severity: 2 - High
  State: Done
  Iteration: AnalyticsLab\Sprint 3
```

```text id="b7"
Bug #7
  Title: Exportar CSV falla con más de 1000 registros
  Priority: 1
  Severity: 2 - High
  State: Active
  Iteration: AnalyticsLab\Sprint 3
```

---

## 🟩 5.5 — Crear Bugs en Sprint 4 (activos)

```text id="b8"
Bug #8
  Title: Factura genera monto incorrecto con descuento
  Priority: 1
  Severity: 1 - Critical
  State: Active
  Iteration: AnalyticsLab\Sprint 4
```

```text id="b9"
Bug #9
  Title: Dashboard no actualiza en tiempo real
  Priority: 2
  Severity: 3 - Medium
  State: Active
  Iteration: AnalyticsLab\Sprint 4
```

```text id="b10"
Bug #10
  Title: Conector REST timeout bajo carga
  Priority: 1
  Severity: 2 - High
  State: New
  Iteration: AnalyticsLab\Sprint 4
```

---

## 🧪 VALIDACIÓN FASE 5
✔ Sprint 1: 2 bugs, todos Done
✔ Sprint 2: 3 bugs, todos Done
✔ Sprint 3: 2 bugs, uno Done y uno Active
✔ Sprint 4: 3 bugs activos/nuevos
✔ En Boards → Backlogs → Bugs aparecen todos

---

# 🧪 FASE 6 — Crear el Dashboard

---

## 🟩 6.1 — Crear dashboard nuevo

Ir a:
```text id="d1"
Overview → Dashboards → New Dashboard
```

Configurar:
```text id="d2"
Name: Sprint Health
Team: AnalyticsLab Team
Visibility: Team
```

---

## 🧪 VALIDACIÓN 6.1
✔ Dashboard "Sprint Health" aparece en la lista
✔ Está vacío y en modo edición

---

# 🧪 FASE 7 — Widget: Velocity

---

## 🟩 7.1 — Agregar widget

En el dashboard en modo edición:
```text id="w_v1"
Add Widget → buscar "Velocity" → Add
```

---

## 🟩 7.2 — Configurar widget

```text id="w_v2"
Team: AnalyticsLab Team
Backlog: Backlog items
Number of sprints: 3
Velocity based on: Effort
```

Guardar configuración.

---

## 🧪 VALIDACIÓN 7
✔ El widget muestra barras para Sprint 1, Sprint 2 y Sprint 3
✔ Sprint 1: ~10 puntos
✔ Sprint 2: ~16 puntos
✔ Sprint 3: ~15 puntos
✔ Se distingue visualmente la tendencia entre sprints

---

# 🧪 FASE 8 — Widget: Burndown

---

## 🟩 8.1 — Agregar widget

```text id="w_b1"
Add Widget → buscar "Burndown" → Add
```

---

## 🟩 8.2 — Configurar widget

```text id="w_b2"
Team: AnalyticsLab Team
Backlog: Stories o Tasks
Iteration: AnalyticsLab\Sprint 4
Start date: (fecha de inicio del Sprint 4)
Plot burndown based on: Remaining Work
```

Guardar configuración.

---

## 🧪 VALIDACIÓN 8
✔ El widget muestra la línea ideal de burndown
✔ Hay trabajo completado (Tasks en Done)
✔ Hay trabajo pendiente (Remaining Work > 0)
✔ La línea real está por encima o por debajo de la ideal

---

# 🧪 FASE 9 — Widget: Cumulative Flow Diagram

---

## 🟩 9.1 — Agregar widget

```text id="w_c1"
Add Widget → buscar "Cumulative Flow Diagram" → Add
```

---

## 🟩 9.2 — Configurar widget

```text id="w_c2"
Team: AnalyticsLab Team
Backlog: Backlog items
Period: Last 4 weeks
States: New, Approved, Committed, In Progress, Done
```

Guardar configuración.

---

## 🧪 VALIDACIÓN 9
✔ El widget muestra bandas de colores por estado
✔ Se distinguen al menos 4 estados con área visible
✔ La banda "Done" crece hacia la derecha del gráfico
✔ No hay cuello de botella evidente (o sí, y eso es interesante discutirlo)

---

# 🧪 FASE 10 — Widget: Lead Time / Cycle Time

---

## 🟩 10.1 — Verificar disponibilidad del widget

```text id="w_lt1"
Add Widget → buscar "Lead Time" o "Cycle Time"
```

Si aparece → continuar con 10.2
Si no aparece → documentar que el plan no lo incluye y saltar a Fase 11

---

## 🟩 10.2 — Configurar Cycle Time

```text id="w_lt2"
Team: AnalyticsLab Team
Backlog: Backlog items
Period: Last 30 days
Swimlane: (dejar en default)
```

Guardar configuración.

---

## 🧪 VALIDACIÓN 10
✔ El widget muestra puntos dispersos (scatter plot)
✔ Cada punto representa un PBI completado
✔ Se puede ver el tiempo promedio de ciclo
✔ PBI #16, #17 y #18 aparecen como puntos

---

# 🧪 FASE 11 — Widget: Bug Trend

---

## 🟩 11.1 — Agregar widget

```text id="w_bt1"
Add Widget → buscar "Bug Trend" → Add
```

---

## 🟩 11.2 — Configurar widget

```text id="w_bt2"
Team: AnalyticsLab Team
Period: Last 4 sprints
States: Active, Resolved, Closed
```

Guardar configuración.

---

## 🧪 VALIDACIÓN 11
✔ Se ven 4 columnas (una por sprint)
✔ Sprint 1 y 2 muestran bugs resueltos
✔ Sprint 4 muestra bugs activos sin resolver
✔ La tendencia muestra si los bugs aumentan o disminuyen

---

# 🧠 FASE 12 — Análisis e interpretación

---

## 🟩 12.1 — Leer el dashboard como un Engineering Manager

Con el dashboard completo, responder las siguientes preguntas:

```text id="q1"
1. ¿El equipo mejoró su velocity entre Sprint 1 y Sprint 3?
2. ¿El Sprint 4 está en camino de completarse a tiempo según el Burndown?
3. ¿Hay algún estado donde se acumula trabajo según el CFD?
4. ¿El Cycle Time promedio es aceptable para el tipo de trabajo?
5. ¿La cantidad de bugs activos es preocupante comparada con los sprints anteriores?
```

---

## 🧪 CHECK FINAL

✔ Dashboard "Sprint Health" tiene 5 widgets configurados
✔ Velocity muestra datos de 3 sprints históricos
✔ Burndown refleja el estado real del Sprint 4
✔ CFD muestra distribución de ítems por estado
✔ Lead Time / Cycle Time tiene puntos visibles (si el plan lo permite)
✔ Bug Trend muestra evolución de 4 sprints
✔ El alumno puede interpretar qué dice cada gráfico

---

# 🚀 RESULTADO FINAL

Al terminar este laboratorio:
* Azure DevOps Analytics tiene datos reales para procesar
* El dashboard "Sprint Health" cuenta la historia del equipo en un vistazo
* Se entiende la diferencia entre queries operacionales (Boards) y Analytics (tendencias históricas)
* El alumno puede replicar este proceso en un proyecto real de su organización
