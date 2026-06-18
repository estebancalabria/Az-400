# LAB-0120 – Team Management en Azure DevOps

## Caso: TechRetail S.A. – E-commerce

---

**Speech introductorio:**

> "TechRetail es una empresa de e-commerce con tres equipos: desarrolladores, testers y operaciones. Su sistema tiene cuatro módulos principales. Vamos a organizar Azure DevOps para que cada equipo vea solo los work items que le corresponden. Antes de empezar, vamos a crear algunos work items y ver qué pasa cuando no hay nada configurado."

---

### Paso 1 – Crear work items sin area configurada

> "Primero creamos 4 work items, uno por módulo. Van a quedar todos con Area = raíz del proyecto."

**Boards → Work Items → New Work Item → Issue**

| Title | 
|---|
| `Implementar pasarela de pago` |
| `Crear página de detalle de producto` |
| `Calcular costo de envío` |
| `Registro de usuario con email` |

Dejarlos con los valores por defecto, sin tocar el campo Area.

Ahora ir a **Boards → Boards**.

> "¿Ven algo? No. Los work items existen, los vemos en Work Items, pero el board está vacío. Esto es porque ningún work item tiene un area asignada a este team. Ese es el problema que vamos a resolver."

---

### Paso 2 – Crear las Areas (módulos del sistema)

> "Las areas representan los módulos del producto. Son etiquetas que se le ponen a los work items para clasificarlos por componente del sistema."

**Project Settings → Boards → Project Configuration → Areas → New child**

Crear bajo el área raíz:

```
TechRetail-Core
├── Pagos
├── Catalogo
├── Envios
└── Usuarios
```

---

### Paso 3 – Crear los Teams

> "Ahora creamos los equipos. Noten que los nombres no tienen nada que ver con las areas — los teams son roles, las areas son módulos del sistema. Son dos dimensiones distintas."

**Project Settings → Teams → New Team**

Crear los siguientes teams, **sin tildar** "Create an area path":

| Team | Descripción |
|---|---|
| `Dev Team` | Desarrolladores |
| `QA Team` | Testers y analistas de calidad |
| `Ops Team` | Operaciones e infraestructura |

> "¿Por qué no tildamos el checkbox? Porque si lo tildamos, crea automáticamente un area con el mismo nombre del team, y eso genera confusión — parecería que team y area son la misma cosa."

---

### Paso 4 – Asociar Areas a cada Team

> "Acá está la clave: le decimos a cada team qué módulos del sistema le interesan."

**Project Settings → Boards → Team configuration**

Arriba de la página hay un selector de team. Seleccionan el team, van a la pestaña **Areas**, y agregan las areas correspondientes. Repetir para cada team.

| Team | Areas asignadas |
|---|---|
| `Dev Team` | Pagos, Catalogo |
| `QA Team` | Pagos, Catalogo, Envios, Usuarios |
| `Ops Team` | Envios, Usuarios |

> "QA tiene todas las areas porque testea todo el sistema. Dev y Ops se dividen los módulos. Un mismo módulo puede pertenecer a más de un team."

---

### Paso 5 – Agregar miembros a cada Team

**Project Settings → Teams → [seleccionar team] → Members → Add**

Asignar los usuarios creados en la Lesson 1 a cada team.

---

### Paso 6 – Asignar areas a los work items y verificar

> "Ahora vamos a editar los 4 work items que creamos al principio y asignarles el area correcta."

**Boards → Work Items → [abrir cada work item] → campo Area**

| Work Item | Area |
|---|---|
| `Implementar pasarela de pago` | Pagos |
| `Crear página de detalle de producto` | Catalogo |
| `Calcular costo de envío` | Envios |
| `Registro de usuario con email` | Usuarios |

Ahora ir a **Boards → Boards** y usar el selector de team arriba a la izquierda:

> "Seleccionen Dev Team. ¿Qué ven? Solo los issues de Pagos y Catalogo. Cambien a QA Team. Ven los 4. Cambien a Ops Team. Solo Envios y Usuarios. Mismo proyecto, mismos work items, vistas completamente distintas según el equipo."
=
