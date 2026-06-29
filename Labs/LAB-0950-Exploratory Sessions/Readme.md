# Lab 5: Azure Test Plans — Exploratory Sessions

**Curso:** AZ-400 — Designing and Implementing Microsoft DevOps Solutions  
**Duración estimada:** 40–50 minutos  
**Nivel:** Intermedio  

---

## Objetivos

Al finalizar este laboratorio vas a poder:

- Crear un proyecto en Azure DevOps con una User Story
- Iniciar una sesión de testing exploratorio desde Azure Test Plans
- Registrar bugs y notas durante la sesión
- Asociar hallazgos a una User Story
- Revisar el resumen de la sesión al cerrarla

---

## Prerrequisitos

- Cuenta en [dev.azure.com](https://dev.azure.com) (cuenta Microsoft gratuita alcanza)
- Organización de Azure DevOps creada (se puede crear en el momento)
- Navegador **Microsoft Edge** o **Google Chrome** con la extensión **Test & Feedback** instalada
- No se requiere suscripción de Azure

> ℹ️ **Extensión requerida:** Las exploratory sessions se ejecutan desde el browser con la extensión **Test & Feedback** de Microsoft. Instalala desde la Chrome Web Store o Edge Add-ons antes de comenzar el lab.  
> Link directo: [aka.ms/ATPExtension](https://aka.ms/ATPExtension)

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

---

### Paso 1.2 — Crear una User Story

1. En el menú lateral, hacé clic en **Boards → Backlogs**.
2. Hacé clic en **+ New Work Item** y escribí:
   - `Como usuario quiero buscar productos por nombre`
   - Presioná Enter.
3. Abrí la User Story (clic sobre el título) y completá:
   - **State:** Approved
   - **Description:** El usuario puede ingresar texto en una barra de búsqueda y ver resultados filtrados en tiempo real.
4. Hacé clic en **Save & Close**.

---

## Parte 2 — Configurar la extensión Test & Feedback

### Paso 2.1 — Verificar la instalación

1. En el browser, buscá el ícono de la extensión **Test & Feedback** en la barra de herramientas (ícono de un beaker/probeta).
2. Hacé clic sobre el ícono para abrirla.
3. Si es la primera vez, la extensión te pide conectarte a una organización de Azure DevOps.

---

### Paso 2.2 — Conectar la extensión al proyecto

1. En el panel de la extensión, seleccioná **Connected** (modo conectado).
2. Ingresá la URL de tu organización: `https://dev.azure.com/[tu-organización]`
3. Hacé clic en **Next**.
4. Seleccioná el proyecto `TiendaOnline`.
5. Hacé clic en **Save**.

> ℹ️ La extensión tiene dos modos: **Standalone** (sin conexión a Azure DevOps) y **Connected** (vinculado al proyecto). Para este lab usamos **Connected** porque necesitamos asociar los hallazgos a la User Story.

---

## Parte 3 — Iniciar la sesión exploratoria

### Paso 3.1 — Iniciar la sesión desde Test Plans

1. En Azure DevOps, andá a **Test Plans → Exploratory sessions**.
2. Hacé clic en **New session** (o el botón equivalente según la versión de la UI).
3. En el campo **Explore**, buscá y seleccioná la User Story:
   - `Como usuario quiero buscar productos por nombre`
4. Hacé clic en **Start session**.

> ℹ️ También podés iniciar la sesión directamente desde la extensión en el browser, haciendo clic en el ícono ▶ (Start session). Ambos caminos son equivalentes.

---

### Paso 3.2 — Verificar que la sesión está activa

1. El ícono de la extensión en el browser muestra un indicador de sesión activa (punto verde o contador de tiempo).
2. Navegá a cualquier sitio web para simular la exploración. En este lab usamos [https://www.bing.com](https://www.bing.com) como aplicación de prueba (tiene una barra de búsqueda).

---

## Parte 4 — Explorar y registrar hallazgos

### Paso 4.1 — Tomar una captura de pantalla con anotación

1. Con la sesión activa, hacé clic en el ícono de la extensión.
2. Seleccioná **Screenshot** (ícono de cámara).
3. Seleccioná el área de la pantalla que querés capturar (la barra de búsqueda).
4. Se abre el editor de anotaciones. Agregá:
   - Un rectángulo resaltando la barra de búsqueda
   - Un texto: `¿Qué pasa si el campo queda vacío?`
5. Hacé clic en **Save screenshot**.

> ℹ️ Las capturas quedan adjuntas al bug o nota que creés a continuación. No se pierden al cerrar la extensión.

---

### Paso 4.2 — Registrar un Bug

1. En el panel de la extensión, hacé clic en **Create bug** (ícono de bicho).
2. Completá el formulario:
   - **Title:** `La barra de búsqueda acepta entrada vacía sin mostrar error`
   - **Repro Steps:** Azure pre-completa con la URL actual y la captura adjunta
   - **Priority:** 2
   - **Severity:** 3 - Medium
3. Hacé clic en **Save**.

> ℹ️ El bug queda automáticamente vinculado a la User Story que seleccionaste al iniciar la sesión.

---

### Paso 4.3 — Agregar una nota

1. En el panel de la extensión, hacé clic en **Add note** (ícono de bloc de notas).
2. Escribí:
   - `Verificar comportamiento con caracteres especiales: <, >, ", '`
3. Hacé clic en **Save**.

> ℹ️ Las notas sirven para registrar ideas, dudas o casos a probar luego, sin necesidad de crear un bug formal.

---

### Paso 4.4 — Registrar un segundo Bug

1. Navegá a la página de resultados de búsqueda de Bing (hacé cualquier búsqueda).
2. Hacé clic en **Screenshot**, capturá los resultados y anotá: `Los resultados no muestran precio ni disponibilidad`.
3. Creá un bug:
   - **Title:** `Los resultados de búsqueda no incluyen información de precio`
   - **Priority:** 1
   - **Severity:** 2 - High
4. Hacé clic en **Save**.

---

## Parte 5 — Cerrar la sesión y revisar el resumen

### Paso 5.1 — Finalizar la sesión

1. En el panel de la extensión, hacé clic en **Stop session** (ícono de stop o cuadrado).
2. La extensión muestra un resumen de la sesión:
   - Tiempo total de exploración
   - Cantidad de bugs registrados
   - Cantidad de notas tomadas
   - Capturas adjuntas
3. Hacé clic en **Done**.

---

### Paso 5.2 — Ver la sesión en Azure Test Plans

1. En Azure DevOps, andá a **Test Plans → Exploratory sessions**.
2. Aparece la sesión que acabás de cerrar con:
   - Fecha y duración
   - Tu nombre como tester
   - La User Story explorada
   - Los bugs y notas registrados
3. Hacé clic sobre la sesión para ver el detalle completo.

---

### Paso 5.3 — Verificar la trazabilidad

1. Andá a **Boards → Work Items**.
2. Abrí cualquiera de los bugs que creaste.
3. En la sección **Links** verificás:
   - Link a la **User Story** (tipo: *Tested by* o *Found in*)
   - Link a la **Exploratory session**

---

## Resumen

| Actividad | Resultado |
|-----------|-----------|
| Proyecto + User Story | Work item listo en el backlog |
| Extensión conectada al proyecto | Sesión vinculada a Azure DevOps |
| Sesión exploratoria iniciada | Testing libre en curso con registro automático |
| Captura + anotación | Evidencia visual adjunta a los hallazgos |
| 2 bugs registrados | Bugs vinculados a la User Story automáticamente |
| Nota registrada | Idea para futura prueba documentada |
| Sesión cerrada | Resumen generado con tiempo y hallazgos |
| Trazabilidad verificada | User Story → Sesión → Bugs |

---

## Desafío opcional

- Iniciá una segunda sesión en modo **Standalone** (sin conectar al proyecto) y observá qué información se pierde respecto al modo Connected.
- Explorá la opción **Record screen** durante una sesión y adjuntá el video a un bug.
- Desde la User Story, verificá que los dos bugs aparecen en la sección Links y navegá hacia la sesión exploratoria.
