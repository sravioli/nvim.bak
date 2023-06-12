-- autocmds, nvim settings and more here

vim.cmd [[syntax enable]]

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

let.editorconfig = true
let.code_action_menu_window_border = require "custom.assets.border"
let.load_doxygen_syntax = 1
let.doxygen_javadoc_autobrief = 0
let.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets"

-- load custom autocommands
require "custom.autocommands"

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

function _G.align_markdown_table()
  local pattern = "^%s*|%s.*%s|%s*$"
  local linenr, colnr = vim.fn.line ".", vim.fn.col "."
  local curr_line = vim.fn.getline "."
  local prev_line, next_line = vim.fn.getline(linenr - 1), vim.fn.getline(linenr + 1)

  if
    vim.fn.exists ":Tabularize"
    and curr_line:match "^%s*|"
    and (prev_line:match(pattern) or next_line:match(pattern))
  then
    local col = #curr_line:sub(1, colnr):gsub("[^|]", "")
    local pos = #vim.fn.matchstr(curr_line:sub(1, colnr), ".*|\\s*\\zs.*")
    vim.cmd "Tabularize/|/l1" -- `l` means left aligned and `1` means one space of cell padding
    vim.cmd "normal! 0"
    vim.fn.search(("[^|]*|"):rep(col) .. ("\\s\\{-\\}"):rep(pos), "ce", linenr)
  end
end
