# 🚀 GUÍA RÁPIDA: EJECUTAR CÓDIGO EN NEOVIM

## 📋 EJECUTAR ARCHIVO COMPLETO

### Método 1: Atajo Inteligente (RECOMENDADO) ⭐
**Detecta automáticamente el tipo de archivo y lo ejecuta**

- `<leader>x` - Ejecuta archivo, muestra resultado, presiona Enter para volver
- `<leader>xx` - Ejecuta en terminal flotante (terminal queda abierto)

**Funciona con:** Python, JavaScript, TypeScript, Lua, Bash, SQL

**Ejemplo:**
1. Abre `01_comentarios.py`
2. Presiona `<leader>xx`
3. Ve el resultado en la terminal flotante
4. Presiona `<C-t>` para ocultar terminal

---

### Método 2: SnipRun (con ventana de resultados)
- `<leader>rf` - Ejecuta TODO el archivo con SnipRun

**Ejemplo:**
1. Abre cualquier archivo .py, .js, .ts
2. Presiona `<leader>rf`
3. Ves resultados en ventana flotante

---

### Método 3: Iron REPL (interactivo)
**Primero inicia el REPL:**
- `<leader>py` - Python REPL
- `<leader>js` - JavaScript REPL
- `<leader>ts` - TypeScript REPL

**Luego envía el archivo completo:**
- `<space>sf` - Envía archivo completo al REPL

**Ejemplo:**
1. Abre `01_comentarios.py`
2. Presiona `<leader>py` (se abre REPL a la derecha)
3. Presiona `<space>sf` (envía todo el archivo)
4. Ves resultados en el REPL interactivo

---

### Método 4: ToggleTerm (manual)
- `<C-t>` - Abre terminal flotante
- Escribe: `python3 archivo.py` (o `node archivo.js`, etc.)
- `<C-t>` de nuevo para ocultar

---

## ⚡ EJECUTAR LÍNEAS INDIVIDUALES O SELECCIÓN

### SnipRun
- `<leader>r` - Ejecuta línea actual
- En Visual: selecciona código + `<leader>r` - Ejecuta selección
- `<leader>rl` - Modo Live (auto-ejecuta mientras escribes)
- `<leader>rc` - Cierra ventana de resultados

### Iron REPL (más control)
**Primero abre REPL:** `<leader>py` (o js/ts)

**Luego envía código:**
- `<space>sl` - Envía línea actual
- En Visual: `<space>sc` - Envía código seleccionado
- `<space>sp` - Envía párrafo completo
- `<space>su` - Envía desde inicio hasta cursor

**Controles REPL:**
- `<leader>ir` - Reiniciar REPL
- `<leader>ih` - Ocultar REPL
- `<space>cl` - Limpiar REPL
- `<space>sq` - Salir del REPL

---

## 🎯 CASOS DE USO ESPECÍFICOS

### Python
```vim
<leader>xx          " Ejecuta archivo completo
<leader>py          " Abre Python REPL
<space>sl           " Envía línea al REPL
```

### JavaScript/Node.js
```vim
<leader>xx          " Ejecuta con Node
<leader>js          " Abre Node REPL
<space>sf           " Envía archivo al REPL
```

### TypeScript
```vim
<leader>xx          " Ejecuta con ts-node
<leader>ts          " Abre TypeScript REPL
```

### SQL (SQLite)
```vim
<leader>x           " Te pedirá el archivo de base de datos
" O manualmente:
<C-t>               " Abre terminal
sqlite3 db.db < script.sql
```

### SQL (PostgreSQL)
```vim
<C-t>               " Abre terminal
psql -U usuario -d database -f script.sql
```

---

## 🔥 MI RECOMENDACIÓN PARA CADA SITUACIÓN

| Quiero... | Usa | Atajo |
|-----------|-----|-------|
| Ver resultado de TODO el archivo | Atajo inteligente | `<leader>xx` |
| Ejecutar línea por línea mientras aprendo | SnipRun | `<leader>r` |
| Probar código interactivo | Iron REPL | `<leader>py` → `<space>sl` |
| Ver output mientras escribo | SnipRun Live | `<leader>rl` |
| Ejecutar comandos complejos | ToggleTerm | `<C-t>` |

---

## 🆘 ATAJOS DE EMERGENCIA

- `<C-t>` - Abre/cierra terminal (el más simple)
- `<leader>rc` - Cierra ventanas de SnipRun
- `<leader>ih` - Oculta REPL
- `Esc` - Salir de modo terminal

---

## 📝 NOTAS IMPORTANTES

1. **ts-node debe estar instalado** para TypeScript:
   ```bash
   npm install -g ts-node
   ```

2. **<leader>** por defecto es la barra espaciadora o `\`
   - Verifica tu leader con: `:echo mapleader` en Neovim

3. **Recarga la configuración:**
   ```vim
   :source ~/.config/nvim/init.lua
   ```
   O reinicia Neovim

4. **Ver todos los atajos disponibles:**
   - En Neovim escribe: `<leader>` y espera un momento
   - Si tienes which-key verás todos los atajos disponibles
