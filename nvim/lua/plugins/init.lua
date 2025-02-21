
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Plugin setup
  { "nvim-lua/plenary.nvim" },                    -- Plenary required by nvim-tree
  { "kyazdani42/nvim-tree.lua",                   -- NvimTree setup
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30,
        },
      })
    end
  },
  { "nvim-treesitter/nvim-treesitter",            -- Treesitter for syntax highlighting
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "javascript", "typescript", "html", "css", "python", "bash", "json", "yaml", "markdown"
        },
        highlight = {
          enable = true,                          -- Enable syntax highlighting
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,                          -- Enable indentation
        },
        incremental_selection = {
          enable = true,                          -- Enable incremental selection
          keymaps = {
            init_selection = "gnn",               -- Start incremental selection
            node_incremental = "grn",             -- Incrementally select nodes
            scope_incremental = "grc",            -- Incrementally select scope
            node_decremental = "grm",             -- Decrementally select nodes
          },
        },
        textobjects = {
          enable = true,                          -- Enable text objects
          select = {
            enable = true,
            keymaps = {
              ["af"] = "@function.outer",         -- Select around a function
              ["if"] = "@function.inner",         -- Select inside a function
              ["ac"] = "@class.outer",            -- Select around a class
              ["ic"] = "@class.inner",            -- Select inside a class
            },
          },
        },
      })
    end
  },
  { "nvim-lualine/lualine.nvim",                  -- Status line
    config = function()
      require("lualine").setup({
        options = {
          theme = "cyberdream",                   -- Match your colorscheme
        },
      })
    end
  },
  { "xiyaowong/nvim-transparent",                -- Transparent background plugin
    config = function()
      require('transparent').setup({
  enable = true,          -- Enable transparency
  extra_groups = {        -- Add UI groups for transparency
    "NvimTreeNormal", "NvimTreeWinSeparator", "TelescopeNormal",
    "Normal", "StatusLine" -- Add more groups as needed
  },
  exclude_groups = {}     -- Groups to exclude from transparency
})
    end
  },
  { "nvim-telescope/telescope.nvim" },            -- Fuzzy finder
  { "hrsh7th/nvim-cmp" },                         -- Autocompletion plugin
  { "hrsh7th/cmp-nvim-lsp" },                     -- LSP completion source
  { "hrsh7th/cmp-buffer" },                       -- Buffer completion source
  { "hrsh7th/cmp-path" },                         -- Path completion source
  { "saadparwaiz1/cmp_luasnip" },                 -- LuaSnip completion source for nvim-cmp
  { "L3MON4D3/LuaSnip" },                         -- Snippet engine
  { "rafamadriz/friendly-snippets" },             -- VS Code-style snippets for React/React Native
  { "morhetz/gruvbox" },                          -- Color scheme (Gruvbox)
  { "folke/tokyonight.nvim" },                    -- Optional: Another color scheme if you want
  { "neovim/nvim-lspconfig" },                    -- LSP configuration plugin
  { "rebelot/kanagawa.nvim"},                     -- Color scheme Kanagawa
  { "scottmckendry/cyberdream.nvim",              -- Cyberdream theme
    lazy = false,                                 -- Load immediately
    priority = 1000,                              -- Load before other plugins
    config = function()
      vim.cmd("colorscheme cyberdream")           -- Set Cyberdream as the default colorscheme
    end,
  },
  { "windwp/nvim-autopairs",                      -- Auto-pair plugin for brackets, quotes, etc.
    config = function()
      require("nvim-autopairs").setup({})
    end
  },
  { "jose-elias-alvarez/null-ls.nvim" },          -- null-ls for ESLint and other tools
  { "williamboman/mason.nvim" },                  -- Mason for managing LSP servers
  { "williamboman/mason-lspconfig.nvim" },        -- Mason integration with lspconfig
})
