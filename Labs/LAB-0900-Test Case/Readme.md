# Lab 0900: Azure Test Plans — Flujo básico de testing manual

**Curso:** AZ-400 — Designing and Implementing Microsoft DevOps Solutions  
**Duración estimada:** 45–60 minutos  
**Nivel:** Intermedio  

---

## Objetivos

Al finalizar este laboratorio vas a poder:

- Crear un proyecto en Azure DevOps con una User Story
- Configurar un Test Plan con una suite estática
- Crear un Test Case con pasos detallados
- Ejecutar el test case desde el Test Runner
- Registrar un bug directamente desde la ejecución
- Verificar trazabilidad y resultados en Progress report

---

## Prerrequisitos

- Cuenta en [dev.azure.com](https://dev.azure.com) (cuenta Microsoft gratuita alcanza)
- Organización de Azure DevOps creada (se puede crear en el momento)
- No se requiere suscripción de Azure

---

## Parte 1 — Crear el proyecto y la User Story

### Paso 1.1 — Crear el proyecto

1. Ingresá a [https://dev.azure.com](https://dev.azure.com) e iniciá sesión.
2. Hacé clic en **New project** (arriba a la derecha).
3. Completá los campos:
   - **Project name:** `TiendaOnline`
   - **Visibility:** Private
   - **Version control:** Git
   - **Work item process:** Scrum
4. Hacé clic en **Create**.

> ℹ️ El proceso **Scrum** incluye el tipo **Product Backlog Item (PBI)**, que en este lab usamos como User Story.

---

### Paso 1.2 — Crear una User Story

1. En el menú lateral, hacé clic en **Boards → Backlogs**.
2. Hacé clic en **+ New Work Item** y escribí:
   - `Como usuario quiero buscar productos por nombre`
   - Presioná Enter.
3. Abrí la User Story (clic sobre el título) y completá:
   - **State:** Approved
   - **Description:** El usuario puede ingresar texto en una barra de búsqueda y ver resultados filtrados en tiempo real.
4. Guardá con **Save & Close**.

---

## Parte 2 — Crear el Test Plan y la Test Suite

### Paso 2.1 — Acceder a Azure Test Plans

1. En el menú lateral, hacé clic en **Test Plans**.

> ℹ️ Si no aparece **Test Plans** en el menú, verificá en **Organization Settings → Billing** que tenés acceso habilitado. Hay un free tier disponible.

---

### Paso 2.2 — Crear el Test Plan

1. Hacé clic en **+ New Test Plan**.
2. Completá:
   - **Name:** `Sprint 1 - Regresión`
   - **Area path:** `TiendaOnline`
   - **Iteration:** `TiendaOnline\Sprint 1` (si no existe, seleccioná la raíz)
3. Hacé clic en **Create**.

> ℹ️ Al crear el Test Plan, Azure DevOps genera automáticamente una **suite raíz** con el mismo nombre. En este lab la usamos directamente, sin crear suites hijas.

---

### Paso 2.3 — Verificar la suite raíz

1. En el panel izquierdo vas a ver el árbol de suites con una única entrada: `Sprint 1 - Regresión`.
2. Hacé clic sobre ella para seleccionarla.
3. El panel derecho muestra la lista de test cases (vacía por ahora).

---

## Parte 3 — Crear el Test Case

### Paso 3.1 — Agregar el test case

1. Con la suite seleccionada, hacé clic en **+ New Test Case**.
2. Se abre el formulario del work item. Completá:
   - **Title:** `Verificar búsqueda con término válido`
3. En la sección **Steps**, cargá los siguientes pasos:

| # | Action | Expected Result |
|---|--------|-----------------|
| 1 | Abrir la página de inicio de TiendaOnline | La página carga correctamente |
| 2 | Hacer clic en la barra de búsqueda | La barra queda activa con cursor |
| 3 | Escribir "zapatillas" y presionar Enter | Se muestran resultados que contienen "zapatillas" |
| 4 | Verificar que al menos un resultado es visible | El listado muestra mínimo 1 producto |

4. Guardá con **Save & Close**.

> ℹ️ Cada fila en la grilla de Steps tiene dos campos: **Action** (qué hace el tester) y **Expected Result** (qué debería pasar). Completar ambos es fundamental para que el test sea reproducible.

---

## Parte 4 — Ejecutar el Test Case

### Paso 4.1 — Iniciar la ejecución

1. En el panel derecho, el test case `Verificar búsqueda con término válido` aparece con estado **Not Run**.
2. Seleccionalo con el checkbox y hacé clic en **Run → Run for web application**.
3. Se abre el **Test Runner** en una nueva ventana o panel lateral.

---

### Paso 4.2 — Ejecutar los pasos

1. El Test Runner muestra el test case con sus 4 pasos.
2. Para cada paso, marcá el resultado con los íconos a la derecha: ✓ Pass o ✗ Fail.
3. Marcá los pasos 1, 2 y 3 como **Pass**.
4. Marcá el paso 4 como **Fail**.

> ℹ️ En este lab no hay una aplicación real. Simulamos el resultado como lo haría un tester al encontrar un defecto.

---

### Paso 4.3 — Registrar un Bug desde el Test Runner

1. Con el paso 4 marcado como Fail, hacé clic en **Create bug** (aparece como botón o ícono en el panel).
2. Se abre el formulario de Bug con datos pre-completados:
   - **Title:** podés editarlo, por ejemplo: `[Búsqueda] El listado no muestra resultados con término válido`
   - **Repro Steps:** Azure copia automáticamente los pasos del test case
3. Completá:
   - **Priority:** 1
   - **Severity:** 2 - High
4. Hacé clic en **Save**.

> ℹ️ El bug queda vinculado automáticamente al Test Case y al Test Plan. No hace falta linkear nada a mano.

---

### Paso 4.4 — Cerrar el Test Runner

1. Hacé clic en **Save and close** en el Test Runner.
2. El test case ahora muestra estado **Failed** en el panel de la suite.

---

## Parte 5 — Verificar resultados y trazabilidad

### Paso 5.1 — Ver el Progress report

1. En el menú lateral de Test Plans, hacé clic en **Progress report**.
2. Seleccioná el plan `Sprint 1 - Regresión`.
3. Verificás:
   - 1 test case ejecutado
   - Estado: Failed
   - El gráfico muestra el desglose de resultados

---

### Paso 5.2 — Verificar la trazabilidad del Bug

1. Andá a **Boards → Work Items**.
2. Abrí el bug que creaste.
3. En la sección **Links** verificás:
   - Link al **Test Case** (tipo: *Tested by*)
   - Link al **Test Result**

---

### Paso 5.3 — Verificar la trazabilidad desde la User Story

1. Abrí la User Story `Como usuario quiero buscar productos por nombre`.
2. En la sección **Links** verificás que aparece el **Test Case** vinculado.
3. Desde ahí podés navegar al Test Case y al Bug.

La cadena completa es: **User Story → Test Case → Test Result → Bug**

---

## Resumen

| Actividad | Resultado |
|-----------|-----------|
| Proyecto + User Story | Work item listo en el backlog |
| Test Plan + suite raíz | Estructura mínima de pruebas creada |
| Test Case con 4 pasos | Escenario de búsqueda definido y reproducible |
| Ejecución con Test Runner | Resultado Failed registrado |
| Bug creado desde el runner | Bug vinculado automáticamente |
| Progress report + trazabilidad | Cadena US → TC → Bug verificada |

---

## Desafío opcional

- Volvé a ejecutar el test case y marcá todos los pasos como **Pass**. Observá cómo cambia el Progress report.
- Explorá la sección **Runs** para ver el historial de ejecuciones del plan.
- Revisá el bug y cambiá su estado a **Resolved**. Verificá si el cambio se refleja desde el Test Case.
