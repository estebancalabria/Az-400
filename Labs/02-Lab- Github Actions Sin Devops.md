## Laboratorio: Introducción a GitHub Actions con Pruebas Unitarias

### Paso 1: Crear un Repositorio en GitHub
1. Accede a tu cuenta de GitHub.
2. Haz clic en **New**.
3. Asigna un nombre al repositorio (ej. `github-actions-lab`).
4. Selecciona **Public** o **Private**.
5. Haz clic en **Create repository**.

### Paso 2: Clonar el Repositorio en Local
1. Abre tu terminal o línea de comandos.
2. Ejecuta el siguiente comando para clonar el repositorio:
   ```bash
   git clone https://github.com/tu_usuario/github-actions-lab.git
   ```
3. Navega al directorio del repositorio:
   ```bash
   cd github-actions-lab
   ```

### Paso 3: Crear un Proyecto Simple
1. Crea un archivo llamado `index.js`:
   ```bash
   touch index.js
   ```
2. Agrega el siguiente código en `index.js`:
   ```javascript
   function suma(a, b) {
     return a + b;
   }

   module.exports = { suma };
   ```

### Paso 4: Crear un Archivo de Pruebas
1. Crea un archivo de prueba llamado `index.test.js` en el mismo directorio:
   ```bash
   touch index.test.js
   ```
2. Agrega el siguiente contenido en `index.test.js`:

```javascript
const { suma } = require('./index');

test('suma de 1 y 2 debe ser 3', () => {
  expect(suma(1, 2)).toBe(3);
});

test('suma de -1 y 1 debe ser 0', () => {
  expect(suma(-1, 1)).toBe(0);
});
```

### Paso 5: Configurar Dependencias de Pruebas
1. Crea un archivo `package.json` para manejar dependencias (si no lo has hecho):
   ```bash
   npm init -y
   ```
2. Instala Jest como framework de pruebas:
   ```bash
   npm install --save-dev jest
   ```

### Paso 6: Modificar `package.json`
1. Abre `package.json` y agrega el siguiente script para las pruebas:

```json
"scripts": {
  "test": "jest"
}
```

### Paso 7: Crear un Archivo de Flujo de Trabajo
1. Crea un directorio para el flujo de trabajo:
   ```bash
   mkdir -p .github/workflows
   ```
2. Crea el archivo `ci.yml` dentro del directorio `workflows`:
   ```bash
   touch .github/workflows/ci.yml
   ```

### Paso 8: Definir el Flujo de Trabajo
1. Abre el archivo `ci.yml`.
2. Agrega el siguiente contenido:

```yaml
name: CI

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v2

    - name: Set up Node.js
      uses: actions/setup-node@v2
      with:
        node-version: '14'

    - name: Install dependencies
      run: npm install

    - name: Run tests
      run: npm test
```

### Paso 9: Guardar y Confirmar Cambios
1. Guarda los archivos `index.js`, `index.test.js` y `ci.yml`.
2. En la terminal, agrega los cambios:
   ```bash
   git add .
   ```
3. Realiza un **commit** de los cambios:
   ```bash
   git commit -m "Agregar proyecto y pruebas unitarias"
   ```
4. Envía (push) los cambios al repositorio:
   ```bash
   git push origin main
   ```

### Paso 10: Probar el Flujo de Trabajo
1. Ve a la pestaña **Actions** en tu repositorio de GitHub para ver la ejecución del flujo de trabajo y las pruebas unitarias.

### Paso 11: Modificar el Flujo de Trabajo
1. Puedes ajustar el flujo de trabajo según tus necesidades.
2. Realiza cambios en tu código o en las pruebas y repite los pasos 9 y 10 para verificar que se ejecute el flujo de trabajo y las pruebas en cada nuevo commit.

### Paso 12: Explorar Otras Acciones
1. Visita el [Marketplace de GitHub Actions](https://github.com/marketplace?type=actions) para explorar otras acciones.

