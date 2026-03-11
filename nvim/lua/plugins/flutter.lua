-- This file contains the configuration for flutter-tools.nvim plugin.

return {
  {
    -- Plugin: flutter-tools.nvim
    -- URL: https://github.com/nvim-flutter/flutter-tools.nvim
    -- Description: Tools to help create flutter apps in Neovim using the native LSP.
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- UI mejorada para selección de dispositivos
    },

    keys = {
      { "<leader>F", "", desc = "+flutter", mode = { "n" } },
      { "<leader>Fr", "<cmd>FlutterRun<cr>", desc = "Flutter Run" },
      { "<leader>Fq", "<cmd>FlutterQuit<cr>", desc = "Flutter Quit" },
      { "<leader>FR", "<cmd>FlutterRestart<cr>", desc = "Flutter Restart" },
      { "<leader>Fl", "<cmd>FlutterReload<cr>", desc = "Flutter Reload (Hot)" },
      { "<leader>Fd", "<cmd>FlutterDevices<cr>", desc = "Flutter Devices" },
      { "<leader>Fe", "<cmd>FlutterEmulators<cr>", desc = "Flutter Emulators" },
      { "<leader>Fo", "<cmd>FlutterOutlineToggle<cr>", desc = "Flutter Outline" },
      { "<leader>FD", "<cmd>FlutterDevTools<cr>", desc = "Flutter DevTools" },
      { "<leader>Fc", "<cmd>FlutterLogClear<cr>", desc = "Flutter Log Clear" },
      { "<leader>Ft", "<cmd>FlutterTest<cr>", desc = "Flutter Test" },
    },

    config = function()
      require("flutter-tools").setup({
        ui = {
          border = "rounded",
          notification_style = "native",
        },
        decorations = {
          statusline = {
            app_version = true,
            device = true,
            project_config = false,
          },
        },
        debugger = {
          enabled = false, -- Poné true si querés usar nvim-dap con Flutter
          run_via_dap = false,
        },
        flutter_path = nil,   -- Se detecta automáticamente desde PATH
        flutter_lookup_cmd = nil,
        fvm = false,          -- Poné true si usás FVM (Flutter Version Manager)
        widget_guides = {
          enabled = true,     -- Muestra líneas guía en el árbol de widgets
        },
        closing_tags = {
          highlight = "ErrorMsg",
          prefix = "//",
          priority = 10,
          enabled = true,     -- Muestra etiquetas de cierre en widgets
        },
        dev_log = {
          enabled = true,
          filter = nil,
          notify_errors = true,
          open_cmd = "15new", -- Abre el log en split horizontal
        },
        dev_tools = {
          autostart = false,
          auto_open_browser = false,
        },
        outline = {
          open_cmd = "30vnew",
          auto_open = false,
        },
        lsp = {
          color = {
            enabled = true,   -- Muestra los colores inline en el código
            background = false,
            background_color = nil,
            foreground = false,
            virtual_text = true,
            virtual_text_str = "■",
          },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            analysisExcludedFolders = {
              vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
              vim.fn.expand("$HOME/.pub-cache"),
              vim.fn.expand("/opt/homebrew/"),
            },
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
            updateImportsOnRename = true,
          },
        },
      })
    end,
  },
}
