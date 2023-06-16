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

-- nvim-markdown settings
let.vim_markdown_conceal = 2
let.tex_conceal = ""
let.vim_markdown_math = 1
let.vim_markdown_math = 1
let.vim_markdown_frontmatter = 1

-- load custom autocommands
require "custom.utils.autocommands"

-- load the desired providers
local function get_os()
  local separator = package.config:sub(1, 1)
  if separator == "\\" then
    return "win"
  elseif separator == "/" then
    return "lnx"
  end
end

local providers = {
  node = {
    lnx = "/home/linuxbrew/.linuxbrew/bin/neovim-node-host",
    win = "C:/Program Files/nodejs/node.exe",
  },
  ruby = {
    lnx = "/home/linuxbrew/.linuxbrew/bin/ruby",
    win = "C:/tools/ruby31/bin/ruby.exe",
  },
  perl = {
    lnx = "/usr/bin/perl",
    win = "C:/Strawberry/perl/bin/perl.exe",
  },
  python3 = {
    lnx = "/home/sravioli/.py-nvim/bin/python3",
    win = "C:/Users/fsimo/.py-nvim/Scripts/python.exe",
  },
}
for prov, path in pairs(providers) do
  let["loaded_" .. prov .. "_provider"] = nil
  let[prov .. "_host_prog"] = path[get_os()]
end
