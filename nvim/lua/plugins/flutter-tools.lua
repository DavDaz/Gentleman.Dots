-- This file contains the configuration for flutter-tools.nvim
-- URL: https://github.com/nvim-flutter/flutter-tools.nvim
-- Description: Tools to help create flutter apps in Neovim using the native LSP.

return {
  {
    "nvim-flutter/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "dart" }, -- Load only when opening a Dart file
    keys = {
      { "<leader>Fr", "<cmd>FlutterRun<CR>", desc = "Flutter Run" },
      { "<leader>Fq", "<cmd>FlutterQuit<CR>", desc = "Flutter Quit" },
      { "<leader>FR", "<cmd>FlutterRestart<CR>", desc = "Flutter Restart" },
      { "<leader>Fh", "<cmd>FlutterReload<CR>", desc = "Flutter Hot Reload" },
      { "<leader>Fd", "<cmd>FlutterDevices<CR>", desc = "Flutter Devices" },
      { "<leader>Fe", "<cmd>FlutterEmulators<CR>", desc = "Flutter Emulators" },
      { "<leader>Fo", "<cmd>FlutterOutlineToggle<CR>", desc = "Flutter Outline Toggle" },
      { "<leader>Fl", "<cmd>FlutterLogToggle<CR>", desc = "Flutter Log Toggle" },
      { "<leader>Fc", "<cmd>FlutterLogClear<CR>", desc = "Flutter Log Clear" },
      { "<leader>Fs", "<cmd>FlutterSuper<CR>", desc = "Flutter Go to Super" },
      { "<leader>Fa", "<cmd>FlutterReanalyze<CR>", desc = "Flutter Reanalyze LSP" },
    },
    config = function()
      require("flutter-tools").setup({
        ui = {
          border = "rounded", -- rounded borders on floating windows
          notification_style = "native", -- use vim.notify
        },

        widget_guides = {
          enabled = true, -- show visual lines connecting parent/child widgets
        },

        closing_tags = {
          enabled = true, -- show virtual text at end of widget blocks e.g. `> MyWidget`
          prefix = " ", -- prefix for the closing tag virtual text
          highlight = "Comment", -- highlight group (Comment is subtle and readable)
        },

        dev_log = {
          enabled = true,
          notify_errors = true, -- notify on flutter errors
          open_cmd = "15split", -- open log in a horizontal split
          focus_on_open = false, -- don't steal focus when log opens
        },

        dev_tools = {
          autostart = false, -- don't autostart devtools server
          auto_open_browser = false,
        },

        outline = {
          open_cmd = "30vnew", -- open outline in a vertical split
          auto_open = false, -- toggle manually with <leader>Fo
        },

        lsp = {
          color = {
            enabled = true, -- show colour preview for Color() values
            background = false,
            foreground = false,
            virtual_text = true, -- show color as virtual text ■
            virtual_text_str = "■",
          },
          settings = {
            showTodos = true, -- show TODO comments in diagnostics
            completeFunctionCalls = true, -- auto-complete function call parens
            renameFilesWithClasses = "prompt", -- ask before renaming files with classes
            enableSnippets = true,
            updateImportsOnRename = true, -- update imports when renaming files
          },
        },
      })
    end,
  },
}
