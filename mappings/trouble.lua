return {
  n = {
    ["<leader>tx"] = { "<cmd>TroubleToggle<CR>", "Toggle diagnostics" },
    ["<leader>tw"] = {
      "<cmd>TroubleToggle workspace_diagnostics<CR>",
      "Toggle workspace diagnostics",
    },
    ["<leader>td"] = {
      "<cmd>TroubleToggle document_diagnostics<CR>",
      "Toggle document diagnostics",
    },
    ["<leader>tq"] = { "<cmd>TroubleToggle quickfix", "Toggle QuickFix" },
    ["<leade>tl"] = { "<cmd>TroubleToggle loclist", "Toggle location list" },

    ["gR"] = { "<cmd>TroubleToggle lsp_references", "Toggle LSPs references" },
  },
}
