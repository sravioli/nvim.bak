return {
  n = {
    -- resize buffers
    ["<M-Up>"] = {
      "<cmd>lua require('smart-splits').resize_up()<CR>",
      "Resize window up",
    },
    ["<M-Down>"] = {
      "<cmd>lua require('smart-splits').resize_down()<CR>",
      "Resize window down",
    },
    ["<M-Left>"] = {
      "<cmd>lua require('smart-splits').resize_left()<CR>",
      "Resize window left",
    },
    ["<M-Right>"] = {
      "<cmd>lua require('smart-splits').resize_right()<CR>",
      "Resize window right",
    },

    -- swap buffers
    ["<leader>h"] = {
      "<cmd>lua require('smart-splits').swap_buf_left()<CR>",
      "Swap buffers left",
    },
    ["<leader>j"] = {
      "<cmd>lua require('smart-splits').swap_buf_down()<CR>",
      "Swap buffers down",
    },
    ["<leader>k"] = {
      "<cmd>lua require('smart-splits').swap_buf_up()<CR>",
      "Swap buffers up",
    },
    ["<leader>l"] = {
      "<cmd>lua require('smart-splits').swap_buf_right()<CR>",
      "Swap buffers right",
    },
  },
}
