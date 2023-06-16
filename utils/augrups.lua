-- augroups for neovim

local aug = vim.api.nvim_create_augroup
return {
  cursor = aug("CursorGroup", {}),
  exit_views = aug("ExitViews", {}),
  yank_highlight = aug("YankHighlight", {}),
  barbecue = aug("Barbecue", {}),
  custom_highlights = aug("CustomHighlights", {}),
  buf_detect = aug("BufDetect", {}),
  lua_functions = aug("LuaFunctions", {}),
}
