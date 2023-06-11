return {
  view = {
    mappings = {
      custom_only = false,
      list = {},
    },
    float = {
      enable = true,
      quit_on_focus_loss = true,
      open_win_config = { width = 35 },
    },
  },

  renderer = {
    indent_markers = { enable = true },
    root_folder_label = ":~:s?$?/..?",
    highlight_opened_files = "icon",
    icons = {
      git_placement = "after",
      show = { git = true },
    },
  },

  git = { enable = true },
  trash = { cmd = "rip" },

  actions = {
    file_popup = {
      open_win_config = { border = require "custom.assets.border" },
    },
  },
}
