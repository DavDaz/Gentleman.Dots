-- This file contains the configuration for flutter-tools.nvim
-- URL: https://github.com/nvim-flutter/flutter-tools.nvim
-- Description: Tools to help create flutter apps in Neovim using the native LSP.

return {
  {
    "nvim-flutter/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "dart" }, -- Load only when opening a Dart file
    config = function()
      require("flutter-tools").setup({})
    end,
  },
}
