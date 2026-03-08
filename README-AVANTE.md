# Avante.nvim - Agente de IA para Neovim

Plugin de IA integrado en Neovim con soporte para Ollama. Similar a Cursor/GitHub Copilot Chat.

## Modelo Configurado

**Proveedor:** Ollama
**Modelo actual:** `qwen2.5-coder:1.5b` (optimizado para velocidad)
**Endpoint:** `http://127.0.0.1:11434`
**GPU:** NVIDIA GeForce RTX 4080 (16GB VRAM)

## Comandos Principales

| Comando                 | Descripción                      |
| ----------------------- | -------------------------------- |
| `:AvanteAsk`            | Abre el chat AI para consultas   |
| `:AvanteEdit`           | Edita código seleccionado con IA |
| `:AvanteToggle`         | Muestra/oculta el panel lateral  |
| `:AvanteSwitchProvider` | Cambia entre modelos/proveedores |
| `:AvanteRefresh`        | Recarga la configuración         |

## Keymaps

### Navegación y Ventanas

| Atajo     | Modo   | Acción                             |
| --------- | ------ | ---------------------------------- |
| `<Tab>`   | Normal | Cambiar entre ventanas del sidebar |
| `<S-Tab>` | Normal | Cambiar ventanas en reversa        |
| `]]`      | Normal | Saltar a siguiente sugerencia      |
| `[[`      | Normal | Saltar a sugerencia anterior       |

### Enviar Mensajes

| Atajo                  | Modo          | Acción                 |
| ---------------------- | ------------- | ---------------------- |
| `<CR>` (Enter)         | Normal/Insert | Enviar mensaje al chat |
| `<S-CR>` (Shift+Enter) | Normal/Insert | Nueva línea sin enviar |

### Diff y Cambios

| Atajo | Modo   | Acción                                            |
| ----- | ------ | ------------------------------------------------- |
| `co`  | Normal | Keep **O**urs (mantener tu versión)               |
| `ct`  | Normal | Accept **T**heirs (aceptar cambio de IA)          |
| `ca`  | Normal | Accept **A**ll theirs (aceptar todos los cambios) |
| `cb`  | Normal | Accept **B**oth (mantener ambas versiones)        |
| `cc`  | Normal | Accept **C**ursor (usar versión bajo cursor)      |
| `]x`  | Normal | Siguiente conflicto de diff                       |
| `[x`  | Normal | Conflicto de diff anterior                        |

### Sugerencias

| Atajo   | Modo   | Acción                       |
| ------- | ------ | ---------------------------- |
| `<M-l>` | Insert | Aceptar sugerencia (Alt+l)   |
| `<M-]>` | Insert | Siguiente sugerencia (Alt+]) |
| `<M-[>` | Insert | Sugerencia anterior (Alt+[)  |
| `<C-]>` | Insert | Descartar sugerencia         |

## Flujo de Trabajo Típico

### 1. Chat con IA

```vim
:AvanteAsk
" Escribe tu pregunta
" Presiona <CR> para enviar
```

### 2. Editar Código con IA

```vim
" 1. Selecciona código en visual mode (V)
" 2. Ejecuta :AvanteEdit
" 3. Escribe lo que quieres cambiar
" 4. Presiona <CR>
" 5. Revisa cambios: 'ct' para aceptar, 'co' para rechazar
```

### 3. Navegación de Cambios

```vim
" ]x - siguiente cambio
" [x - cambio anterior
" ]] - siguiente sugerencia
" [[ - sugerencia anterior
```

## Modelos Ollama Disponibles

### Instalados

- `qwen2.5-coder:1.5b` (986 MB) - **Actual** ⚡ Rápido
- `qwen2.5-coder:7b` (4.7 GB) - Más potente pero lento en CPU
- `arcee-ai/arcee-agent:latest` (5.4 GB)
- `snowflake-arctic-embed2:latest` (1.2 GB)

### Otros Modelos Recomendados

```bash
# Más ligero y rápido
ollama pull qwen2.5-coder:1.5b

# Más potente
ollama pull qwen2.5-coder:14b

# DeepSeek Coder
ollama pull deepseek-coder-v2:16b

# CodeLlama
ollama pull codellama:13b
```

## Cambiar Modelo

**Opción 1: Editar configuración**

```lua
-- Editar: ~/.config/nvim/lua/plugins/avante.lua
-- Dentro de providers.ollama, cambiar 'model'
providers = {
    ollama = {
        endpoint = "http://127.0.0.1:11434",
        model = "qwen2.5-coder:1.5b",  -- Cambiar aquí
        ...
    },
},
```

**Opción 2: Comando en runtime**

```vim
:AvanteSwitchProvider
```

## Características

- Chat AI integrado en el editor
- Edición de código asistida por IA
- Sistema de diff inteligente
- Soporte para imágenes (paste screenshots)
- Sugerencias automáticas (desactivadas por defecto)
- Streaming de respuestas
- Múltiples proveedores (Ollama, OpenAI, Claude, etc.)

## Configuración

Archivo: `~/.config/nvim/lua/plugins/avante.lua`

### Configuración Actual (Nueva Estructura)

```lua
opts = {
    provider = "ollama",
    providers = {
        ollama = {
            endpoint = "http://127.0.0.1:11434",
            model = "qwen2.5-coder:1.5b",
            timeout = 30000,
            temperature = 0.7,
            max_tokens = 4096,
        },
    },
    behaviour = {
        auto_suggestions = false,        -- Sugerencias automáticas OFF
        auto_apply_diff_after_generation = false,  -- No aplicar cambios
    },
    mappings = {
        submit = {
            normal = "<CR>",
            insert = "<CR>",             -- Enter para enviar
        },
    },
    windows = {
        position = "right",              -- Panel a la derecha
        width = 30,                      -- 30% de ancho
    },
}
```

**IMPORTANTE:** La configuración usa el nuevo formato `providers.ollama` (no `ollama` directamente).

## Dependencias

- nvim-treesitter
- plenary.nvim
- nui.nvim
- dressing.nvim
- nvim-web-devicons
- img-clip.nvim (para imágenes)
- render-markdown.nvim (para renderizar markdown)

## Tips

1. **Contexto**: Selecciona el código relevante antes de usar `:AvanteEdit` para mejores resultados
2. **Prompts específicos**: Sé claro y específico en tus instrucciones
3. **Iteración**: Puedes hacer múltiples ediciones consecutivas
4. **Diff cuidadoso**: Revisa siempre los cambios antes de aceptarlos con `ct`
5. **Performance**: Si el modelo es lento, considera usar `qwen2.5-coder:1.5b`

## Solución de Problemas

### Error 404 - Page not found

Este error ocurre por configuración incorrecta. **Solución:**

1. Asegúrate de usar la nueva estructura `providers.ollama`
2. Endpoint debe ser `http://127.0.0.1:11434` (sin `/api` ni `/v1`)
3. Recarga Neovim completamente después de cambiar la configuración

### Ollama no responde

```bash
# Verificar que Ollama está corriendo
ollama list

# Verificar endpoint y modelos disponibles
curl http://127.0.0.1:11434/api/tags

# Verificar que el modelo está cargado
curl http://127.0.0.1:11434/api/ps
```

### Modelo muy lento en CPU

Si Ollama no usa la GPU (RTX 4080), reinícialo:

```bash
# Reiniciar Ollama para habilitar GPU
sudo snap restart ollama

# Verificar que usa GPU (size_vram > 0)
curl -s http://127.0.0.1:11434/api/ps | grep size_vram
```

Con GPU, el modelo `qwen2.5-coder:1.5b` responde en **segundos** en lugar de minutos.

### Se queda en "Generating..."

Causas comunes:

1. Modelo muy grande para CPU (usar `1.5b` en lugar de `7b`)
2. GPU no habilitada (ver arriba)
3. Timeout muy corto (aumentar a 30000-60000ms)

### Reinstalar dependencias

```vim
:Lazy sync
```

### Verificar configuración

```vim
:checkhealth avante
:messages
```

## Recursos

- [Repositorio oficial](https://github.com/yetone/avante.nvim)
- [Ollama](https://ollama.ai)
- [Qwen2.5-Coder](https://github.com/QwenLM/Qwen2.5-Coder)
