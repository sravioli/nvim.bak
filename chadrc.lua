---@diagnostic disable-next-line: undefined-doc-name
---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local hl = require "custom.hl"

M.ui = {
  theme = "kanagawa",
  theme_toggle = { "kanagawa", "everblush" },
  transparency = true,

  changed_themes = {
    yoru = {
      base_16 = { base00 = "#151515" },
      -- base_30 = { black = "#151515" },
    },
  },

  hl_override = hl.override,
  -- hl_add = hl.add,

  cmp = { style = "atom_colored" },
  telescope = { style = "bordered" },
  statusline = { separator_style = "arrow" },
}

M.plugins = "custom.plugins"

M.lazy_nvim = {
  ui = { border = require("custom.assets.border") },
  -- checker = { enabled = true },
}

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
