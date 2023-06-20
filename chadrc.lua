---NvChad defaults configuration
---@module "chadrc"
---@author sRavioli
---@license GPL-3.0
---@version 1.0.0

--- User defined highlight groups
---@class HighlightGroups
---@field add      table User defined Highlight groups
---@field override table User overridden Highlight groups
local hl = require "custom.hl"

--- NvChad configuration settings
---@class ChadrcConfig
---@field ui        table  Config for NvChad.
---@field plugins   string Path tho the plugins to install.
---@field lazy_nvim table  Config for Lazy.nvim plugin.
---@field mappings  table  User defined mappings.
local M = {}

---@class NvChadUI
---@field theme          string  The theme that NvChad will use.
---@field theme_toggle   table   The two themes that can be toggled
---@field transparency   boolean Whether to enable transparency in the terminal.
---@field changed_themes table   Color overrides for specific themes.
---@field hl_override    table   The highlight override table from the custom.hl module.
---@field hl_add         table   The highlight add table from the custom.hl module.
---@field cmp            table   Completion style for the cmp plugin.
---@field telescope      table   Style for the Telescope plugin.
---@field statusline     table   Style for the statusline.
M.ui = {
  theme = "kanagawa",
  theme_toggle = { "kanagawa", "everblush" },
  transparency = true,

  changed_themes = {
    yoru = {
      base_16 = { base00 = "#151515" },
      base_30 = { black = "#151515" },
    },
  },

  hl_override = hl.override,
  hl_add = hl.add,

  cmp = { style = "atom_colored" },
  telescope = { style = "bordered" },
  statusline = { separator_style = "arrow" },
}

M.plugins = "custom.plugins"

M.lazy_nvim = {
  ui = { border = require "custom.assets.border" },
  checker = { enabled = false },
}

M.mappings = require "custom.mappings"

return M
