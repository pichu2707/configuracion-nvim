# Guia de Configuracion de Neovim

## Estructura del Proyecto

```
~/.config/nvim/
├── init.lua                 # Punto de entrada principal
├── lazy-lock.json           # Versiones bloqueadas de plugins
└── lua/
    ├── config/
    │   ├── lazy.lua         # Configuracion de lazy.nvim
    │   ├── options.lua      # Opciones de Neovim (vim.opt)
    │   └── keymaps.lua      # Atajos de teclado globales
    └── plugins/
        ├── mi-plugin.lua    # Un archivo por plugin
        └── ...
```

---

## Instalacion de Plugins

### Metodo 1: Plugin Simple

Crea un archivo en `lua/plugins/nombre-plugin.lua`:

```lua
return {
    "usuario/nombre-repo",
}
```

### Metodo 2: Plugin con Configuracion

```lua
return {
    "usuario/nombre-repo",
    -- Cargar solo para ciertos tipos de archivo
    ft = { "python", "lua" },

    -- O cargar de forma diferida
    lazy = true,

    -- Cargar cuando se ejecute un comando
    cmd = { "MiComando" },

    -- Cargar cuando se presione una tecla
    keys = {
        { "<leader>x", "<cmd>MiComando<cr>", desc = "Descripcion" },
    },

    -- Dependencias
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    -- Configuracion del plugin
    opts = {
        opcion1 = true,
        opcion2 = "valor",
    },
}
```

### Metodo 3: Plugin con Funcion config

Para configuraciones mas complejas:

```lua
return {
    "usuario/nombre-repo",
    config = function()
        require("nombre-plugin").setup({
            opcion1 = true,
        })

        -- Configuracion adicional
        vim.keymap.set("n", "<leader>x", function()
            require("nombre-plugin").mi_funcion()
        end, { desc = "Mi atajo" })
    end,
}
```

### Metodo 4: Multiples Plugins en un Archivo

```lua
return {
    { "plugin1/repo" },
    { "plugin2/repo", opts = {} },
    {
        "plugin3/repo",
        dependencies = { "plugin1/repo" },
    },
}
```

---

## Opciones Comunes de Plugins

| Opcion | Descripcion |
|--------|-------------|
| `lazy = true` | Carga diferida (no carga al iniciar) |
| `priority = 1000` | Prioridad de carga (mayor = primero) |
| `event = "VeryLazy"` | Cargar despues del inicio |
| `event = "BufRead"` | Cargar al abrir un archivo |
| `ft = {"lua"}` | Cargar solo para tipos de archivo |
| `cmd = {"Cmd"}` | Cargar cuando se use el comando |
| `keys = {}` | Cargar cuando se presione la tecla |
| `opts = {}` | Opciones pasadas a setup() |
| `config = function` | Funcion de configuracion |
| `build = "comando"` | Comando a ejecutar tras instalar |
| `enabled = false` | Deshabilitar el plugin |

---

## Comandos de Lazy.nvim

| Comando | Descripcion |
|---------|-------------|
| `:Lazy` | Abrir panel de Lazy |
| `:Lazy sync` | Instalar/actualizar/limpiar plugins |
| `:Lazy update` | Actualizar plugins |
| `:Lazy clean` | Eliminar plugins no usados |
| `:Lazy health` | Verificar estado |
| `:Lazy profile` | Ver tiempos de carga |

---

## Personalizacion del Dashboard (snacks.nvim)

Tu dashboard se configura en `lua/plugins/snacks.lua`.

### Configuracion Basica

```lua
return {
    "folke/snacks.nvim",
    opts = {
        dashboard = {
            enabled = true,
            width = 60,

            preset = {
                -- Teclas predefinidas
                keys = {
                    { icon = " ", key = "f", desc = "Buscar archivo", action = ":lua Snacks.picker.files()" },
                    { icon = " ", key = "n", desc = "Nuevo archivo", action = ":ene | startinsert" },
                    { icon = " ", key = "g", desc = "Buscar texto", action = ":lua Snacks.picker.grep()" },
                    { icon = " ", key = "r", desc = "Recientes", action = ":lua Snacks.picker.recent()" },
                    { icon = " ", key = "c", desc = "Configuracion", action = ":lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })" },
                    { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy" },
                    { icon = " ", key = "q", desc = "Salir", action = ":qa" },
                },
            },

            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { section = "startup" },
            },
        },
    },
}
```

### Header Personalizado

```lua
dashboard = {
    preset = {
        header = [[
    ███╗   ██╗██╗   ██╗██╗███╗   ███╗
    ████╗  ██║██║   ██║██║████╗ ████║
    ██╔██╗ ██║██║   ██║██║██╔████╔██║
    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
        ]],
    },
}
```

### Secciones Disponibles

| Seccion | Descripcion |
|---------|-------------|
| `header` | Logo/texto de cabecera |
| `keys` | Atajos de teclado |
| `recent_files` | Archivos recientes |
| `projects` | Proyectos recientes |
| `startup` | Tiempo de inicio |
| `terminal` | Salida de terminal |

### Ejemplo: Dashboard con Archivos Recientes

```lua
dashboard = {
    sections = {
        { section = "header" },
        { section = "keys", gap = 1 },
        { icon = " ", title = "Archivos Recientes", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Proyectos", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
    },
},
```

### Ejemplo: Dashboard con Imagen ASCII

```lua
dashboard = {
    sections = {
        {
            section = "terminal",
            cmd = "chafa ~/.config/nvim/logo.png --size 40x20 --symbols vhalf",
            height = 20,
            padding = 1,
        },
        { section = "keys", gap = 1 },
        { section = "startup" },
    },
},
```

### Ejemplo: Dashboard Multi-Panel

```lua
dashboard = {
    sections = {
        -- Panel izquierdo
        { section = "header", pane = 1 },
        { section = "keys", pane = 1 },

        -- Panel derecho
        { icon = " ", title = "Recientes", section = "recent_files", pane = 2 },
        { icon = " ", title = "Proyectos", section = "projects", pane = 2 },

        -- Footer (ambos paneles)
        { section = "startup" },
    },
    pane_gap = 4,
},
```

---

## Ejemplo Completo de Dashboard

Aqui tienes un ejemplo listo para usar:

```lua
-- lua/plugins/snacks.lua
return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        dashboard = {
            enabled = true,
            width = 60,

            preset = {
                header = [[
   ██████╗ ██╗ ██████╗██╗  ██╗██╗   ██╗
   ██╔══██╗██║██╔════╝██║  ██║██║   ██║
   ██████╔╝██║██║     ███████║██║   ██║
   ██╔═══╝ ██║██║     ██╔══██║██║   ██║
   ██║     ██║╚██████╗██║  ██║╚██████╔╝
   ╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝
                ]],

                keys = {
                    { icon = " ", key = "f", desc = "Buscar archivo", action = ":lua Snacks.picker.files()" },
                    { icon = " ", key = "e", desc = "Explorador", action = ":lua Snacks.explorer()" },
                    { icon = " ", key = "g", desc = "Buscar texto", action = ":lua Snacks.picker.grep()" },
                    { icon = " ", key = "r", desc = "Recientes", action = ":lua Snacks.picker.recent()" },
                    { icon = " ", key = "c", desc = "Configuracion", action = ":lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })" },
                    { icon = " ", key = "p", desc = "Proyectos", action = ":lua Snacks.picker.projects()" },
                    { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy" },
                    { icon = " ", key = "q", desc = "Salir", action = ":qa" },
                },
            },

            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { section = "recent_files", icon = " ", title = "Archivos Recientes", limit = 5, padding = 1 },
                { section = "startup" },
            },
        },

        -- Otros modulos de snacks
        bigfile = { enabled = true },
        explorer = { enabled = true },
        indent = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
    },
}
```

---

## Crear tu Propio Plugin Local

### Paso 1: Crear la Estructura

```
~/.config/nvim/lua/mi-plugin/
├── init.lua
└── modulo.lua
```

### Paso 2: Codigo del Plugin

```lua
-- lua/mi-plugin/init.lua
local M = {}

M.config = {
    mensaje = "Hola desde mi plugin!",
}

function M.setup(opts)
    M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.saludar()
    print(M.config.mensaje)
end

return M
```

### Paso 3: Registrar en Lazy

```lua
-- lua/plugins/mi-plugin.lua
return {
    dir = vim.fn.stdpath("config") .. "/lua/mi-plugin",
    name = "mi-plugin",
    config = function()
        require("mi-plugin").setup({
            mensaje = "Mi mensaje personalizado!",
        })

        vim.keymap.set("n", "<leader>hh", function()
            require("mi-plugin").saludar()
        end, { desc = "Saludar" })
    end,
}
```

---

## Tips y Trucos

### Ver que plugins estan cargados
```vim
:Lazy
```

### Depurar tiempos de carga
```vim
:Lazy profile
```

### Recargar configuracion sin reiniciar
```vim
:source $MYVIMRC
:Lazy sync
```

### Ver errores de plugins
```vim
:checkhealth
:messages
```

### Deshabilitar un plugin temporalmente
```lua
return {
    "plugin/repo",
    enabled = false,  -- Deshabilitado
}
```

---

## Recursos Utiles

- [Documentacion de Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Documentacion de Snacks.nvim](https://github.com/folke/snacks.nvim)
- [Awesome Neovim](https://github.com/rockerBOO/awesome-neovim)
- [Nerd Fonts](https://www.nerdfonts.com/) - Para iconos
