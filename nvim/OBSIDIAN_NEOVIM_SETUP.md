---
id: 1772508577-SJUE
aliases:
  - Obsidian Neovim Setup
  - obsidian.nvim config
tags:
  - tipo/referencia
  - tema/neovim
  - tema/obsidian
  - estado/arbol
---

# Obsidian Neovim Setup

Guia de referencia para configurar `obsidian.nvim` apuntando a este vault en cualquier maquina que use la misma configuracion de Neovim.

## Ubicacion de archivos relevantes

| Archivo | Rol |
|---|---|
| `~/Documents/git/github/Gentleman.Dots/nvim/lua/plugins/obsidian.lua` | Fuente de configuracion del plugin (Home Manager) |
| `~/Documents/git/github/Gentleman.Dots/nvim/lua/config/keymaps.lua` | Fuente de keymaps de Obsidian (Home Manager) |
| `~/Documents/git/github/Gentleman.Dots/nvim/lua/plugins/which-key.lua` | Grupo `<leader>o` para Obsidian |
| `~/.config/nvim/lua/plugins/obsidian.lua` | Archivo desplegado en runtime |
| `~/.config/davdaz-notes/` | Vault de notas |

## Configuracion clave en `obsidian.lua`

```lua
workspaces = {
  {
    name = "davdaz-notes",
    path = os.getenv("HOME") .. "/.config/davdaz-notes",
  },
},

new_notes_location = "notes_subdir",
notes_subdir = "00-Inbox",

templates = {
  folder = "99-Templates",
  date_format = "YYYY-MM-DD-ddd",
  time_format = "HH:mm",
},
```

### Por que estas opciones

- **`new_notes_location = "notes_subdir"`** - Necesario para que `notes_subdir` tenga efecto.
- **`notes_subdir = "00-Inbox"`** - Toda nota nueva cae en el inbox para procesar despues.
- **`templates.folder`** - La key correcta del plugin es `folder`.
- **`templates.date_format` y `templates.time_format`** - `obsidian.nvim` usa tokens estilo Moment.

### Lo que no se configura porque el plugin ya lo hace bien

- **`note_id_func`**: el default `zettel_id` genera `timestamp-CODE` (ej: `1763049939-BEUT`).
- **`frontmatter.func`**: el builtin genera `{id, aliases, tags}`.
- **`completion`**: el plugin detecta `blink.cmp` o `nvim-cmp` automaticamente.

## Keymaps configurados

Todos en `~/Documents/git/github/Gentleman.Dots/nvim/lua/config/keymaps.lua`, bajo el grupo `<leader>o` (Obsidian):

| Keymap | Comando | Descripcion |
|---|---|---|
| `<leader>oc` | `:Obsidian check` | Toggle checkbox |
| `<leader>ot` | `:Obsidian template` | Insertar template en nota actual |
| `<leader>oo` | `:Obsidian open` | Abrir nota en app Obsidian |
| `<leader>ob` | `:Obsidian backlinks` | Ver backlinks |
| `<leader>ol` | `:Obsidian links` | Ver links de la nota |
| `<leader>on` | `:Obsidian new` | Crear nota nueva (va a `00-Inbox/`) |
| `<leader>oN` | `:Obsidian new_from_template` | Crear nota desde template con picker |
| `<leader>os` | `:Obsidian search` | Buscar notas por contenido |
| `<leader>oq` | `:Obsidian quick_switch` | Switch rapido entre notas |

## Pasos para setup en maquina nueva

1. Clonar esta configuracion en `~/Documents/git/github/Gentleman.Dots/`.
2. Aplicar Home Manager para desplegar en `~/.config/nvim/`.
3. Clonar el vault en `~/.config/davdaz-notes/`.
4. Abrir Neovim y ejecutar `:checkhealth obsidian` para validar que detecta `davdaz-notes`.

### Prerequisitos del sistema

- `ripgrep` instalado (requerido para busqueda) - `brew install ripgrep` / `apt install ripgrep`
- Neovim >= 0.10.0

## Referencias

- https://github.com/obsidian-nvim/obsidian.nvim/wiki
- https://github.com/obsidian-nvim/obsidian.nvim/wiki/Commands
- https://github.com/obsidian-nvim/obsidian.nvim/wiki/Templates
