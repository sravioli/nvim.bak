-- autocmds, nvim settings and more here
local __border = require "custom.assets.border"

-- mimic vimscript syntax
local let = vim.g
local set = vim.opt

set.cursorline = true
set.number = true
set.relativenumber = true
set.smartcase = true
set.hlsearch = false
set.colorcolumn = "80"
set.updatetime = 200
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true

let.code_action_menu_window_border = __border
let.load_doxygen_syntax = 1
let.doxygen_javadoc_autobrief = 0

-- load the desired providers
local providers = {
  { prov = "node", path = "/home/linuxbrew/.linuxbrew/bin/neovim-node-host" },
  { prov = "ruby", path = "/home/linuxbrew/.linuxbrew/bin/ruby" },
  { prov = "perl", path = "/usr/bin/perl" },
  { prov = "python3", path = "/home/sravioli/.py-nvim/bin/python3" },
}
for _, provider in ipairs(providers) do
  let["loaded_" .. provider.prov .. "_provider"] = nil
  let[provider.prov .. "_host_prog"] = provider.path
end

let.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets"

-- load custom autocommands
require "custom.autocommands"
