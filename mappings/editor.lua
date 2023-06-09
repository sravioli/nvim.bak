return {
  n = {
    -- Save and undo
    ["<C-s>"] = { "<cmd>w<CR>", "Save File" },
    ["<C-z>"] = { "<cmd>undo<CR>", "Undo action" },

    -- do thing, then center screen to allow for better readability
    ["<C-u>"] = { "<C-u>zz" },
    ["<C-d>"] = { "<C-d>zz" },
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },

    -- open code actions kinda like VSCode
    ["<M-.>"] = { "<cmd>CodeActionMenu<CR>", "Open code actions" },

    ["<leader>rb"] = { "<cmd>ReachOpen buffers<CR>", "Open buffers with reach" },
    ["<leader>nf"] = { "<cmd>Neogen<CR>", "Generate docstrings with Neogen" },
  },

  i = {
    ["jk"] = { "<Esc>", "Exit insert mode", opts = { nowait = true } },

    -- same normal mappings for insert mode also
    ["<C-s>"] = { "<C-o><cmd>w<CR>", "Save file" },
    ["<C-z>"] = { "<C-o><cmd>undo<CR>", "Undo action" },

    ["<M-.>"] = { "<C-o><cmd>CodeActionMenu<CR>", "Open code actions" },

    -- delete line directily in insert mode
    ["<M-k>"] = { "<C-o>dd", "Delete line" },

    -- C-w but backwards
    ["<C-Del>"] = { "<C-o>dw", "Delete word backwards" },
    ["<S-Del>"] = { "<C-o><S-d>", "Delete everything from cursor to right" },
    ["<M-BS>"] = { "<C-u>", "Delete everything from cursor to left" },
  },
}

