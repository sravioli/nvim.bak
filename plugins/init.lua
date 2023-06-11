local __border = require "custom.assets.border"

return {
  ----// OVERRIDE DEFAULTS //-----------------------------------------------
  { "NvChad/nvterm", opts = require "custom.plugins.overrides.nvterm" },
  { "williamboman/mason.nvim", opts = require "custom.plugins.overrides.mason" },
  { "folke/which-key.nvim", opts = require "custom.plugins.overrides.which-key" },
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "custom.plugins.overrides.nvim-tree",
  },

  ----// LSCONFIG //--------------------------------------------------------
  {
    -- Quickstart configs for Nvim LSP
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Neovim as language server to inject diagnostics, code actions, etc.
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.plugins.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lsp"
    end,
  },
  {
    -- VSCode 💡 for neovim's built-in LSP.
    "kosayoda/nvim-lightbulb",
    config = function()
      require("nvim-lightbulb").setup { autocmd = { enabled = true } }
    end,
    event = "BufWinEnter",
  },
  {
    -- A small Neovim plugin for previewing definitions using floating windows.
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup { border = __border }
    end,
    event = "BufWinEnter",
  },
  {
    -- Tree like view for symbols in Neovim using LSP.
    "simrat39/symbols-outline.nvim",
    config = true,
    cmd = "SymbolsOutline",
  },
  {
    -- Pop-up menu for code actions to show meta-information and diff preview.
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  },
  {
    -- Standalone UI for nvim-lsp progress.
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup {
        text = { spinner = "arc" },
        window = { blend = 0 },
      }
    end,
    event = "LspAttach",
    tag = "legacy",
  },
  {
    -- A pretty window for previewing, navigating & editing your LSP locations.
    "dnlhc/glance.nvim",
    config = function()
      require("glance").setup { border = { enabled = true } }
    end,
    cmd = "Glance",
  },
  {
    -- 🚦 A pretty diagnostics, references, telescope results, quickfix and
    -- location list to help you solve all the trouble your code is causing.
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup { use_diagnostic_signs = true }
    end,
  },
  {
    -- A markdown preview directly in your neovim.
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup {
        border = __border,
        style = "dark",
      }
    end,
    cmd = "Glow",
  },
  {
    -- Catalyze your Fenced Markdown Code-block editing!
    "AckslD/nvim-FeMaco.lua",
    config = true,
    cmd = "FeMaco",
  },
  {
    -- Neovim plugin for dimming the highlights of unused functions, variables,
    -- parameters, and more
    "zbirenbaum/neodim",
    event = "LspAttach",
    config = function()
      require("neodim").setup {
        blend_color = require("base46").get_theme_tb("base_30").bg,
      }
    end,
  },
  {
    -- An extremely lightweight plugin (~ 120loc) that highlights ranges you
    -- have entered in commandline.
    "winston0410/range-highlight.nvim",
    dependencies = "winston0410/cmd-parser.nvim",
    config = true,
    event = "CmdlineEnter",
  },
  {
    -- 🌅 Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions
    -- of the code you're editing using TreeSitter.
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup { dimming = { inactive = true } }
    end,
    cmd = "Twilight",
  },
  {
    -- 🦝 Clean and elegant distraction-free writing for NeoVim.
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup {
        modes = {
          ataraxis = {
            minimum_writing_area = {
              width = 81,
              height = 44,
            },
          },
        },
        integrations = {
          twilight = false,
        },
      }
    end,
    cmd = { "TZAtaraxis", "TZMinimalist", "TZNarrow", "TZFocus" },
  },
  {
    -- Simple winbar/statusline plugin that shows your current code context.
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
    config = true,
  },
  {
    -- A simple popup display that provides breadcrumbs feature using LSP
    -- server.
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("nvim-navbuddy").setup {
        window = { border = __border },
      }
    end,
    cmd = "Navbuddy",
  },
  {
    -- A VSCode like winbar for Neovim
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function()
      require("barbecue").setup {
        attach_navic = false,
        create_autocmd = false,
      }
    end,
  },
  {
    -- A plugin for neovim that highlights cursor words and lines.
    "yamatsum/nvim-cursorline",
    config = true,
    event = "BufWinEnter",
  },
  {
    -- Neovim port of Assorted Biscuits. Ends up with more supported languages
    -- too.
    "code-biscuits/nvim-biscuits",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
    },
    config = function()
      require("nvim-biscuits").setup {
        default_config = { prefix_string = " 󰆘 " },
        cursor_line_only = true,
      }
    end,
    event = "BufWinEnter",
  },
  {
    -- Multiple cursors plugin for vim/neovim.
    "mg979/vim-visual-multi",
    branch = "master",
    event = "BufWinEnter",
  },
  {
    -- Invert text in vim, purely with lua.
    "nguyenvukhang/nvim-toggler",
    config = function()
      require "custom.plugs.config.toggler"
    end,
    keys = { "<leader>i" },
  },
  {
    -- Extensible Neovim Scrollbar.
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup { hide_if_all_visible = true }
    end,
    event = "BufWinEnter",
  },
  {
    -- Add/change/delete surrounding delimiter pairs with ease.
    -- Written with ❤️ in Lua.
    "kylechui/nvim-surround",
    -- tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
    event = "BufWinEnter",
  },
  {
    -- ✅ Highlight, list and search todo comments in your projects.
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    cmd = { "TodoQuickFix", "TodoLocList", "TodoTrouble", "TodoTelescope" },
    event = "VeryLazy",
  },
  {
    -- A small (Neo)Vim wrapper for zoxide.
    "nanotee/zoxide.vim",
    cmd = { "Z" },
  },
  {
    -- tabout plugin for neovim.
    "abecodes/tabout.nvim",
    config = true,
    event = "InsertEnter",
  },
  {
    -- Discord Rich Presence for Neovim.
    "andweeb/presence.nvim",
    config = true,
    event = "BufWinEnter",
  },
  {
    -- abolish.vim: Work with several variants of a word at once.
    "tpope/vim-abolish",
    event = "CmdlineEnter",
  },
  {
    -- Vim script for text filtering and alignment.
    "godlygeek/tabular",
    cmd = "Tabularize",
  },
  {
    -- Peek lines just when you intend.
    "nacro90/numb.nvim",
    config = true,
    event = "CmdlineEnter",
  },
  {
    -- Neovim's answer to the mouse 🦘
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    -- A better annotation generator. Supports multiple languages and
    -- annotation conventions.
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("neogen").setup { snippet_engine = "luasnip" }
    end,
    cmd = "Neogen",
  },
  {
    -- Describe the regexp under the cursor.
    "bennypowers/nvim-regexplainer",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("regexplainer").setup {
        auto = true,
        popup = { boder = __border },
      }
    end,
    build = ":TSInstall regex",
    event = "CursorHold",
  },
  {
    -- 🧠 Smart, directional Neovim and tmux split resizing and navigation.
    -- Think about splits in terms of "up/down/left/right".
    "mrjones2014/smart-splits.nvim",
    config = true,
    event = "BufAdd",
  },
  {
    -- EditorConfig plugin for Vim.
    "editorconfig/editorconfig-vim",
  },
}
