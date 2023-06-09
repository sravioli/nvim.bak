local border = require("custom.assets.border")

return {
  ----// OVERRIDE DEFAULTS //-----------------------------------------------
  { "NvChad/nvterm", opts = require "custom.plugins.overrides.nvterm" },
  { "williamboman/mason.nvim", opts = require("custom.plugins.overrides.mason") },
  { "folke/which-key.nvim", opts = require "custom.plugins.overrides.which-key" },


  ----// LSCONFIG //--------------------------------------------------------
  {
    -- Quickstart configs for Nvim LSP
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Neovim as language server to inject diagnostics, code actions, etc.
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.plugins.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lsp"
    end,
  },
}
