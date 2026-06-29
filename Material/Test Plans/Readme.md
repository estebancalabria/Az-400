# Azure Test Plans — Qué es y para qué sirve cada opción

**Curso:** AZ-400 — Designing and Implementing Microsoft DevOps Solutions

---

## ¿Qué es Azure Test Plans?

Azure Test Plans es el módulo de testing de Azure DevOps. Permite planificar, ejecutar y registrar pruebas manuales y exploratorias sobre una aplicación, manteniendo trazabilidad completa con el resto del proyecto (User Stories, bugs, pipelines).

A diferencia de las pruebas automatizadas (que corren en un pipeline), Test Plans está orientado a **testers humanos** que ejecutan escenarios paso a paso y registran lo que observan.

---

## Conceptos clave antes de arrancar

### Test Plan
Es el contenedor principal. Agrupa todas las pruebas de un período o sprint. Se asocia a un área y una iteración del proyecto.

Ejemplo: `Sprint 3 - Regresión`

### Test Suite
Es una agrupación de test cases dentro de un plan. Puede organizarse por funcionalidad, módulo o criterio técnico. Existen tres tipos:

- **Static suite:** se arman a mano, agregando test cases uno por uno.
- **Requirement-based suite:** se crea a partir de un work item (PBI, User Story). Los test cases dentro quedan automáticamente vinculados a ese requirement.
- **Query-based suite:** usa una query de Azure Boards para traer work items dinámicamente. Si un nuevo PBI cumple la condición de la query, aparece solo en la suite sin intervención manual.

### Test Case
Es un work item que describe un escenario de prueba con pasos detallados. Cada paso tiene una **Action** (qué hace el tester) y un **Expected Result** (qué debería pasar).

### Test Runner
Es la interfaz desde la que el tester ejecuta un test case en tiempo real, marcando cada paso como Pass o Fail, y registrando bugs o evidencia.

---

## Las opciones del menú

### Test plans

Es la vista principal del módulo. Desde acá se:

- Crean y gestionan los Test Plans
- Navega el árbol de suites
- Agregan y ejecutan test cases
- Asignan testers a cada caso

Es el punto de entrada para todo el flujo de testing manual.

---

### Progress report

Muestra el estado de ejecución de un Test Plan en tiempo real.

Incluye:
- Cuántos test cases hay en total
- Cuántos están en estado Not Run, Passed, Failed, Blocked
- Gráficos de avance por suite o por tester
- Filtros por configuración o período

Es útil para que el QA Lead o el Scrum Master vea de un vistazo si el sprint está en condiciones de cerrarse.

---

### Parameters

Permite definir valores reutilizables que se pueden insertar en los pasos de un test case.

Ejemplo: en vez de escribir `usuario@empresa.com` en cinco test cases distintos, definís el parámetro `@email` una sola vez y lo referenciás en todos. Si el dato cambia, lo actualizás en un solo lugar.

Se usan cuando los mismos pasos se repiten con datos distintos (pruebas con múltiples usuarios, entornos, etc.).

---

### Configurations

Permite definir combinaciones de entorno contra las que se ejecuta el mismo test case.

Ejemplos de configuraciones:
- `Windows 11 / Chrome`
- `Android 14 / Chrome`
- `iOS 17 / Safari`

Una vez asignadas a una suite, el mismo test case aparece duplicado: una instancia por configuración. Cada una puede tener resultado distinto (Pass en desktop, Fail en mobile, por ejemplo).

Es especialmente útil en proyectos con requisitos de compatibilidad multiplataforma.

---

### Runs

Muestra el historial de todas las ejecuciones de test cases del proyecto.

Cada vez que un tester ejecuta un test case (ya sea individual o en lote), se genera un **Test Run**. Desde esta sección se puede:

- Ver los runs anteriores con fecha, tester y resultado
- Abrir un run para revisar el detalle paso a paso
- Comparar resultados entre ejecuciones

Es útil para auditoría y para detectar flakiness (tests que a veces pasan y a veces fallan).

---

### Exploratory sessions

Permite registrar sesiones de **testing exploratorio**: pruebas sin pasos pre-definidos donde el tester navega la aplicación libremente buscando comportamientos inesperados.

Durante una sesión exploratoria el tester puede:
- Tomar capturas de pantalla o grabar video
- Registrar bugs directamente desde el browser
- Asociar los hallazgos a una User Story o feature específica

Al cerrar la sesión, Azure DevOps genera un resumen con el tiempo invertido, los bugs encontrados y las notas tomadas.

Se usa en etapas tempranas del desarrollo o cuando no hay tiempo para escribir casos formales pero igual se quiere dejar registro de lo probado.

---

## Resumen comparativo

| Opción | Para qué sirve | Quién la usa principalmente |
|--------|---------------|----------------------------|
| Test plans | Crear y gestionar planes, suites y casos | QA / Tester |
| Progress report | Ver avance de ejecución del sprint | QA Lead / Scrum Master |
| Parameters | Definir datos reutilizables en test cases | QA |
| Configurations | Ejecutar el mismo caso en múltiples entornos | QA / DevOps |
| Runs | Historial de ejecuciones | QA Lead / Auditoría |
| Exploratory sessions | Testing libre sin casos pre-escritos | QA / Desarrolladores |
