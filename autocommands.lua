----// AUTOCOMMANDS //-----------------------------------------------

-- Restore the >_ cursor when exiting nvim
local cursorGrp = vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd("VimLeave", {
  desc = "Restore WindowsTerminal cursor shape upon exit",
  pattern = "*",
  command = "set guicursor=a:hor20-blinkon1",
  group = cursorGrp,
})

-- Highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight selection on yank",
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "Search", timeout = 200 }
  end,
})

-- Quit from some windows by only pressing q
vim.api.nvim_create_autocmd("FileType", {
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
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "man",
  command = [[nnoremap <buffer><silent> q :quit<CR>]],
})

-- When having multiple buffers, show cursor only in the active one
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  desc = "Show cursor in current buffer",
  pattern = "*",
  command = "set cursorline",
  group = cursorGrp,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  desc = "Hide cursor in non active buffer",
  pattern = "*",
  command = "set nocursorline",
  group = cursorGrp,
})

-- Redefine and improve doxygen highlights groups
local doxygen_patterns = {
  { pattern = "doxygenComment", highlight = "Comment" },
  { pattern = "doxygenCommentWhite", highlight = "Comment" },
  { pattern = "doxygenParam ", highlight = "Conditional " },
  { pattern = "doxygenSpecial ", highlight = "Conditional " },
  { pattern = "doxygenBriefLine ", highlight = "Function " },
  { pattern = "doxygenSpecialMultilineDesc ", highlight = "Comment " },
  { pattern = "doxygenCodeWord ", highlight = "Float " },
  { pattern = "doxygenBody ", highlight = "String" },
}
vim.api.nvim_create_autocmd("FileType", {
  desc = "Apply new doxygen syntax",
  pattern = { "c", "cpp", "doxygen" },
  callback = function()
    for _, doxygen in ipairs(doxygen_patterns) do
      local pattern, highlight = doxygen.pattern, doxygen.highlight
      vim.cmd(string.format("highlight link %s %s", pattern, highlight)) -- Define highlighting attributes
    end
  end,
})

-- Set filetype to "pseudo"
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  desc = "Set custom filetype for `.pseudo` files",
  pattern = "*.pseudo",
  command = "set filetype=pseudo.text | set syntax=pseudo",
})
