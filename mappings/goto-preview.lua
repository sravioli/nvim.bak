return {
  n = {
    ["gpd"] = {
      "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
      "Preview definition",
    },
    ["gpt"] = {
      "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
      "Preview type definition",
    },
    ["gpi"] = {
      "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
      "Preview implementation",
    },
    ["gP"] = {
      "<cmd>lua require('goto-preview').close_all_win()<CR>",
      "Close all preview windows",
    },
    ["gpr"] = {
      "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
      "Preview with Telescope",
    },
  },
}
