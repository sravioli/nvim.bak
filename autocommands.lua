----// AUTOCOMMANDS //-----------------------------------------------
local au = vim.api.nvim_create_autocmd
local aug = vim.api.nvim_create_augroup

-- Restore the >_ cursor when exiting nvim
local CursorGrp = aug("CursorLine", { clear = true })
au("VimLeave", {
  desc = "Restore WindowsTerminal cursor shape upon exit",
  pattern = "*",
  command = "set guicursor=a:hor20-blinkon1",
  group = CursorGrp,
})

-- Highlight text on yank
au("TextYankPost", {
  desc = "Highlight selection on yank",
  group = aug("HighlightYank", {}),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "Search", timeout = 200 }
  end,
})

-- Quit from some windows by only pressing q
local EasyExit = aug("EasyExit", {})
au("FileType", {
  desc = "Exit some views with 'q'",
  pattern = {
    "help",
    "startuptime",
    "qf",
    "fugitive",
    "null-ls-info",
    "dap-float",
  },
  command = [[nnoremap <buffer><silent> q :quit<CR>]],
  group = EasyExit,
})
au("FileType", {
  pattern = "man",
  command = [[nnoremap <buffer><silent> q :quit<CR>]],
  group = EasyExit,
})

-- When having multiple buffers, show cursor only in the active one
au({ "InsertLeave", "WinEnter" }, {
  desc = "Show cursor in current buffer",
  pattern = "*",
  command = "set cursorline",
  group = CursorGrp,
})
au({ "InsertEnter", "WinLeave" }, {
  desc = "Hide cursor in non active buffer",
  pattern = "*",
  command = "set nocursorline",
  group = CursorGrp,
})

-- (Barbecue) Gain better performance when moving the cursor around
au({
  "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",

  -- include these if you have set `show_modified` to `true`
  "BufWritePost",
  "TextChanged",
  "TextChangedI",
}, {
  desc = "Update Barbecue winbar",
  group = aug("barbecue.updater", {}),
  callback = function()
    require("barbecue.ui").update()
  end,
})

-- Redefine and improve doxygen highlights groups
local CustomHighlights = aug("CustomHighlights", {})
local doxygen_patterns = {
  { pattern = "doxygenComment", highlight = "Comment" },
  { pattern = "doxygenCommentWhite", highlight = "Comment" },
  { pattern = "doxygenParam", highlight = "Conditional" },
  { pattern = "doxygenSpecial", highlight = "Conditional" },
  { pattern = "doxygenBriefLine", highlight = "Function" },
  { pattern = "doxygenSpecialMultilineDesc", highlight = "Comment" },
  { pattern = "doxygenCodeWord", highlight = "Float" },
  { pattern = "doxygenBody", highlight = "String" },
}
au("FileType", {
  desc = "Apply new doxygen syntax",
  pattern = { "c", "cpp", "doxygen" },
  callback = function()
    vim.cmd [[set filetype=doxygen]]
    vim.cmd [[set syntax=c.doxygen]]

    for _, doxygen in ipairs(doxygen_patterns) do
      local pattern, highlight = doxygen.pattern, doxygen.highlight
      vim.cmd(string.format("highlight link %s %s", pattern, highlight)) -- Define highlighting attributes
    end
  end,
  group = CustomHighlights,
})

-- Set filetype to "pseudo"
au({ "BufNewFile", "BufRead" }, {
  desc = "Set custom filetype for `.pseudo` files",
  pattern = "*.pseudo",
  command = "set filetype=pseudo.text | set syntax=pseudo",
})

-- Change some highlight groups for markdown
au("FileType", {
  desc = "Highlight comments in markdown",
  pattern = "markdown",
  command = [[syntax match @comment :<!--.*-->:]],
  group = CustomHighlights,
})
au("FileType", {
  desc = "Change highlight groups",
  pattern = "markdown",
  command = [[highlight! link @text.emphasis Italic]],
  group = CustomHighlights,
})

-- Enable markdown auto-align table
au("FileType", {
  desc = "Align markdown tables as you type",
  pattern = "markdown",
  callback = function()
    vim.keymap.set("i", "<Bar>", "<Bar> <C-o>:lua align_table()<CR>")
  end,
  group = aug("AutoAlignTable", {}),
})
