# 🧪 Laboratorio: Work Item Rules en Azure DevOps (con casos de prueba reales)

## 🎯 Objetivo

Configurar Work Item Rules en Azure DevOps y validarlas usando **Work Items reales de prueba**, verificando:

* validaciones de campos
* reglas condicionales
* restricciones por estado

---

# 🧠 FASE 0 — Preparación

---

## 🟩 0.1 — Requisitos

Verificar:

* Acceso a Azure DevOps
* Proyecto creado
* Permisos para editar Process

---

## 🟩 0.2 — Ir a Process

[Azure DevOps](https://dev.azure.com?utm_source=chatgpt.com)

Ir a:

```text id="p0"
Organization Settings → Boards → Process
```

---

## 🧪 VALIDACIÓN 0.2

✔ Ves lista de procesos
✔ Existe Agile o Scrum

---

## 🟩 0.3 — Crear proceso heredado

```text id="p1"
Agile → Create inherited process
Name: AI-Lab-Process
```

---

## 🧪 VALIDACIÓN 0.3

✔ El proceso aparece como editable
✔ No es “system”

---

## 🟩 0.4 — Entrar a Task

```text id="p2"
AI-Lab-Process → Work Item Types → Task
```

---

## 🧪 VALIDACIÓN 0.4

✔ Ves pestañas: Layout / States / Rules

---

# 🧪 FASE 1 — RULE 1: Assigned To obligatorio

---

## 🟩 1.1 — Crear regla

```text id="r1"
IF Work Item is created
THEN Assigned To = Required
```

---

## 🧪 CASO DE PRUEBA 1 (ANTES DE VALIDAR)

Crear Work Item:

```text id="t1"
Type: Task
Title: Task without assignee (test case 1)
Assigned To: EMPTY
```

---

## 🧪 VALIDACIÓN 1

✔ Intentar guardar Task
✔ Debe bloquear guardado
✔ Mensaje: Assigned To required

---

# 🧪 FASE 2 — RULE 2: Priority → Due Date obligatorio

---

## 🟩 2.1 — Crear regla

```text id="r2"
IF Priority = 1
THEN Due Date = Required
```

---

## 🧪 CASO DE PRUEBA 2

Crear Work Item:

```text id="t2"
Type: Task
Title: Priority 1 without due date
Priority: 1
Due Date: EMPTY
```

---

## 🧪 VALIDACIÓN 2

✔ Intentar guardar
✔ Debe bloquear
✔ Campo Due Date requerido

---

# 🧪 FASE 3 — RULE 3: Done requiere Remaining Work = 0

---

## 🟩 3.1 — Crear regla

```text id="r3"
IF State = Done
THEN Remaining Work = 0
```

---

## 🧪 CASO DE PRUEBA 3

Crear Work Item:

```text id="t3"
Type: Task
Title: Done with remaining work
State: Done
Remaining Work: 5
```

---

## 🧪 VALIDACIÓN 3

✔ No debe permitir cambiar a Done
✔ O debe forzar Remaining Work = 0
✔ Estado queda bloqueado o revertido

---

# 🧪 FASE 4 — RULE 4: Closed requiere Reason

---

## 🟩 4.1 — Crear regla

```text id="r4"
IF State = Closed
THEN Reason = Required
```

---

## 🧪 CASO DE PRUEBA 4

Crear Work Item:

```text id="t4"
Type: Task
Title: Closed without reason
State: Closed
Reason: EMPTY
```

---

## 🧪 VALIDACIÓN 4

✔ No permite cerrar Task
✔ Reason obligatorio

---

# 🧪 FASE 5 — CASO POSITIVO (control de regresión)

---

## 🟩 5.1 — Crear Work Item válido

```text id="t5"
Type: Task
Title: Valid Task
Assigned To: OK_USER
Priority: 1
Due Date: 2026-06-20
Remaining Work: 0
State: Active
```

---

## 🧪 VALIDACIÓN 5

✔ Se guarda sin errores
✔ No bloqueos de reglas
✔ Work Item aparece en Boards

---

# 🧠 FASE 6 — VALIDACIÓN GLOBAL DEL SISTEMA

---

Verificar comportamiento completo:

```text id="flow"
Create Work Item → Apply Rules → Block invalid cases → Allow valid case
```

---

## 🧪 CHECK FINAL

✔ Caso 1 bloqueado
✔ Caso 2 bloqueado
✔ Caso 3 bloqueado
✔ Caso 4 bloqueado
✔ Caso 5 permitido

---

# 🚀 RESULTADO FINAL

Al terminar este laboratorio:

* Azure DevOps está validando Work Items automáticamente
* Las reglas funcionan en creación y transición
* Se comprobó con casos reales (no teoría)


