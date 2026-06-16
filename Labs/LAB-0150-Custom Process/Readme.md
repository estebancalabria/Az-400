# 🧪 Laboratorio: Crear un proceso de IA en Azure DevOps (desde cero)

## 🎯 Contexto del ejercicio

En proyectos tradicionales de software usamos:

* Epic → Feature → User Story → Task

Pero en proyectos de **Inteligencia Artificial**, ese modelo se queda corto.

Porque en IA no solo “programás funcionalidades”, sino que:

* diseñás prompts
* probás modelos
* evaluás resultados
* gestionás datasets
* desplegás experimentos

Entonces necesitamos un flujo más cercano a este mundo:

```text
Idea → Prompt → Dataset → Evaluación → Deployment
```

Este laboratorio te enseña a adaptar Azure DevOps a ese flujo real.

---

# 🧠 ¿Qué representa cada concepto?

Antes de crear nada, entendamos los nombres:

## 🟣 Epic (Visión grande)

👉 Ejemplo:

```text
Asistente de IA para soporte técnico
```

📌 Es el objetivo global del sistema.

---

## 🔵 Caso de uso (Feature adaptada)

👉 Ejemplo:

```text
Responder preguntas de usuarios automáticamente
```

📌 Es una capacidad concreta dentro del sistema.

---

## 🟢 Prompt (nuevo Work Item)

👉 Ejemplo:

```text
Prompt para responder preguntas frecuentes
```

📌 Es el “cerebro” de la IA.

En IA, el prompt ES parte del sistema, no solo texto.

---

## 🟡 Dataset

👉 Ejemplo:

```text
Preguntas frecuentes reales de clientes
```

📌 Sin datos, no hay evaluación ni mejora.

---

## 🟠 Evaluación

👉 Ejemplo:

```text
Medir precisión de respuestas del modelo
```

📌 La IA no se “termina”, se evalúa continuamente.

---

## 🔴 Deployment

👉 Ejemplo:

```text
Publicar modelo en API
```

📌 Es llevar la IA a producción.

---

# 🧪 LABORATORIO PASO A PASO

---

## 🟩 PASO 1 — Entrar a Azure DevOps

Ir a:

[Azure DevOps](https://dev.azure.com?utm_source=chatgpt.com)

Iniciar sesión y entrar a tu organización.

---

## 🟩 PASO 2 — Crear proceso nuevo

1. Ir a ⚙️ **Organization Settings**
2. Seleccionar:

```text
Boards → Process
```

3. Elegir:

```text
Agile
```

4. Click en:

```text
Create inherited process
```

Nombre:

```text
AI Lab Process
```

---

## 🟩 PASO 3 — Crear los Work Items personalizados

Entrar al proceso recién creado:

```text
AI Lab Process
```

Y crear tipos nuevos.

---

### 🟣 Crear Epic (si no lo usás ya)

Lo dejamos igual porque es estándar:

```text
Epic → Visión del sistema
```

---

### 🔵 Crear: Case of Use

Click:

```text
New Work Item Type
```

Nombre:

```text
Case of Use
```

📌 ¿Por qué este nombre?

Porque en IA no trabajás solo con “features”, sino con **casos de uso del modelo**.

Ejemplo:

* “Responder preguntas”
* “Clasificar tickets”
* “Generar código”

---

### 🟢 Crear: Prompt

```text
Work Item Type: Prompt
```

📌 ¿Por qué?

Porque el prompt es:

* la lógica principal del sistema IA
* equivalente a una función crítica en software

---

### 🟡 Crear: Dataset

```text
Work Item Type: Dataset
```

📌 ¿Por qué?

Porque la IA depende de datos reales para mejorar.

Sin dataset no hay:

* testing
* tuning
* evaluación

---

### 🟠 Crear: Evaluation

```text
Work Item Type: Evaluation
```

📌 ¿Por qué?

Porque la IA no se “da por terminada”, se mide:

* precisión
* coherencia
* relevancia
* alucinaciones

---

### 🔴 Crear: Deployment

```text
Work Item Type: Deployment
```

📌 ¿Por qué?

Porque en IA el deployment no es solo “subir código”:

* exponer modelo
* versionar prompt
* monitorear respuestas

---

## 🟩 PASO 4 — Crear jerarquía del proyecto

Ahora armás el flujo mental:

```text
Epic
 └─ Case of Use
      └─ Prompt
      └─ Dataset
      └─ Evaluation
      └─ Deployment
```

---

## 🟩 PASO 5 — Crear proyecto en Azure DevOps

Ir a:

```text
New Project
```

Completar:

* Nombre: IA Lab Project
* Process: AI Lab Process
* Version Control: Git
* Visibility: Private

Crear.

---

## 🟩 PASO 6 — Crear primer Epic

Ir a:

```text
Boards → Work Items → New Epic
```

Título:

```text
Asistente de soporte con IA
```

---

## 🟩 PASO 7 — Crear Caso de Uso

Dentro del Epic:

```text
Add child → Case of Use
```

Ejemplo:

```text
Responder preguntas frecuentes de clientes
```

---

## 🟩 PASO 8 — Crear Prompt

Dentro del caso de uso:

```text
Prompt → “Responder de forma clara y breve preguntas técnicas”
```

---

## 🟩 PASO 9 — Dataset

```text
Dataset → FAQs reales del sistema de soporte
```

---

## 🟩 PASO 10 — Evaluation

```text
Evaluation → medir precisión de respuestas del modelo GPT
```

---

## 🟩 PASO 11 — Deployment

```text
Deployment → API del asistente en producción
```

---

# 🧪 Resultado final del laboratorio

Te queda un flujo real de IA:

```text
Asistente IA de soporte
 └─ Responder preguntas
      ├─ Prompt (cerebro)
      ├─ Dataset (datos)
      ├─ Evaluation (calidad)
      └─ Deployment (producción)
```

---

# 🚀 Qué aprendiste con esto

* Azure DevOps no es solo Scrum
* Podés modelar procesos de IA reales
* Los Work Items pueden representar conceptos técnicos modernos
* Podés diseñar pipelines mentales de experimentación

