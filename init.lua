---Neovim settings
---@module "init"
---@author sRavioli
---@license GPL-3.0
---@version 2.0.0

--- Enable syntax highlighting
vim.cmd [[syntax enable]]

---@type table Mimic the vimscript `set <option>=<value>`
local set = vim.opt
---@type table Mimic the vimscript `let <option>=<value>`
local let = vim.g

---Highlight the text line of the cursor with CursorLine. Useful to easily spot
---the cursor.  Will make screen redrawing slower.
set.cursorline = false

---Print the line number in front of each line.
set.number = true

---Show the line number relative to the line with the cursor in front of each
---line. Relative line numbers help you use the |count| you can precede some
---vertical motion commands (e.g. j k + -) with, without having to calculate it
---yourself.
set.relativenumber = true

---Override the 'ignorecase' option if the search pattern contains upper case
---characters.  Only used when the search pattern is typed and 'ignorecase'
---option is on.  Used for the commands "/", "?", "n", "N",
set.smartcase = true

---When there is a previous search pattern, highlight all its matches. The
---highlight group determines the highlighting for all matches not under the
---cursor while the highlight group (if defined) determines the highlighting for
---the match under the cursor.
set.hlsearch = false

---'colorcolumn' is a comma-separated list of screen columns that are highlighted
---with ColorColumn.  Useful to align text.  Will make screen redrawing slower.
set.colorcolumn = "80"

---If this many milliseconds nothing is typed the swap file will be written to
---disk (see crash-recovery).  Also used for the CursorHold autocommand event.
set.updatetime = 200

---Number of spaces that a <Tab> in the file counts for.  Also see the :retab
---command, and the 'softtabstop' option.
set.tabstop = 2

---Number of spaces to use for each step of (auto)indent.  Used for |'cindent'|,
---|>>|, |<<|, etc.
set.shiftwidth = 2

---In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
---Spaces are used in indents with the '>' and '<' commands and when 'autoindent'
---is on.
set.expandtab = true

--- Configure plugins settings and editor settings
---Enable editorconfig plugin
let.editorconfig = true

---Change the code actions menu border
let.code_action_menu_window_border = require "custom.assets.border"

---Load doxygen syntax
let.load_doxygen_syntax = 1

---Disable doxygen autobrief
let.doxygen_javadoc_autobrief = 0

---Path to LuaSnip snippets
let.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets"

--- nvim-markdown settings
let.vim_markdown_conceal = 2
let.tex_conceal = ""
let.vim_markdown_math = 1
let.vim_markdown_math = 1
let.vim_markdown_frontmatter = 1

---Load custom autocommands
require "custom.utils.autocommands"

---Detects the current OS
---@type function
local function get_os()
  ---@type string The OS separator
  local separator = package.config:sub(1, 1)
  if separator == "\\" then
    return "win"
  elseif separator == "/" then
    return "lnx"
  end
end

---Neovim providers
---@class Providers
---@field node    table Path to the nodejs provider executable
---@field ruby    table Path to the ruby provider executable
---@field perl    table Path to the perl provider executable
---@field python3 table Path to the python3 provider executable
local providers = {
  ---@enum node-paths
  node = {
    lnx = "/home/linuxbrew/.linuxbrew/bin/neovim-node-host",
    win = "C:/Users/fsimo/AppData/Roaming/npm/node_modules/neovim/bin/cli.js",
  },

  ---@enum ruby-paths
  ruby = {
    lnx = "/home/linuxbrew/.linuxbrew/bin/ruby",
    win = "C:/tools/ruby31/bin/ruby.exe",
  },

  ---@enum perl-paths,
  perl = {
    lnx = "/usr/bin/perl",
    win = "C:/Strawberry/perl/bin/perl.exe",
  },

  ---@enum python3-paths,
  python3 = {
    lnx = "/home/sravioli/.py-nvim/bin/python3",
    win = "C:/Users/fsimo/.py-nvim/Scripts/python.exe",
  },
}

---@param prov  string|table Current provider
---@param paths table        The paths to the provider
for prov, paths in pairs(providers) do
  let["loaded_" .. prov .. "_provider"] = nil
  let[prov .. "_host_prog"] = paths[get_os()]
end
