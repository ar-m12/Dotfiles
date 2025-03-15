
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

vim.o.background = 'dark' -- Moved outside the plugin list

require("lazy").setup({
  -- Required dependencies
  { "nvim-lua/plenary.nvim" },
  {
    "rktjmp/lush.nvim",
    lazy = false -- Make sure it's always loaded
  },

  -- nvim-tree
  { "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        view = { width = 30 },
        renderer = {
          add_trailing = true,  -- This adds a trailing slash (/) to folders
          icons = {
            show = {
              file = false,
              folder = false,
              folder_arrow = false,
              git = false,
            }
          }
        }
      })
    end
  },


    {"supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({})
      end,
    },

  -- git signs
  { "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  },

  -- nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "javascript", "typescript", "html", "css", "python",
          "bash", "json", "yaml", "markdown", "go", "zig"
        },
        sync_install = false, -- Install parsers asynchronously
        auto_install = true,  -- Auto-install missing parsers
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
      })
    end,
  },

  -- lualine
  { "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({ options = { theme = "cyberdream" } })
    end
  },

  -- transparent
  { "xiyaowong/nvim-transparent",
    config = function()
      require("transparent").setup({
        enable = true,
        extra_groups = {
          "NvimTreeNormal", "NvimTreeWinSeparator", "TelescopeNormal",
          "Normal", "NormalNC", "StatusLine", "SignColumn", "FoldColumn",
          "Pmenu", "CmpDoc", "LspDiagnosticsDefaultError", "LspDiagnosticsDefaultWarning", "LspDiagnosticsDefaultInformation"
        },
      })
    end
  },

  -- telescope
  { "nvim-telescope/telescope.nvim" },

  -- nvim-cmp
  { "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args) require("luasnip").lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "copilot" }, -- GitHub Copilot source
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end
  },

  -- CMP sources
  { "zbirenbaum/copilot-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "saadparwaiz1/cmp_luasnip" },

  -- GitHub Copilot
  { "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false }, -- Disable inline suggestions, using cmp instead
        panel = { enabled = false },
      })
    end
  },

  -- LuaSnip
  { "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },

  -- Friendly Snippets
  { "rafamadriz/friendly-snippets" },

  -- Themes
  {"nyoom-engineering/oxocarbon.nvim"},
  {"dgox16/oldworld.nvim"},
  {"zenbones-theme/zenbones.nvim"},
  { "Mofiqul/vscode.nvim" },
  { "morhetz/gruvbox" },
  { "folke/tokyonight.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        transparent = true,
        italic_comments = true,
        borderless_telescope = true,
      })
      vim.api.nvim_command("colorscheme cyberdream")
    end
  },

  -- Auto pairs
  { "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
  },

  -- null-ls (Prettier and ESLint integration) - TEMPORARILY DISABLED
  -- NOTE: null-ls is currently incompatible with Neovim v0.11.0-dev
  -- The error occurs because null-ls tries to access '_request_name_to_capability' which is nil in this version
  -- 
  -- ALTERNATIVES:
  -- 1. Use native LSP formatting (available through nvim-lspconfig)
  -- 2. Wait for null-ls to be updated for compatibility with Neovim v0.11.0-dev
  -- 3. Switch to conform.nvim or other formatting plugins that are compatible with Neovim v0.11.0-dev
  --
  -- To add back format-on-save with built-in LSP formatting:
  -- vim.api.nvim_create_autocmd("BufWritePre", {
  --   pattern = { "*.js", "*.ts", "*.json", "*.html", "*.css", "*.scss", "*.md" },
  --   callback = function() vim.lsp.buf.format() end,
  -- })
  --
  -- { "jose-elias-alvarez/null-ls.nvim",
  --   config = function()
  --     -- Configuration removed to prevent errors
  --   end
  -- },

  -- Mason and Mason-lspconfig
  { "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  { "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "gopls", "zls" },
      })
    end
  },

  -- LSP Config
  { "neovim/nvim-lspconfig" },

  -- vim-closetag
  { "alvan/vim-closetag" },
})

-- LSP Setup for clangd, gopls, and zls
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Clangd for C/C++
lspconfig.clangd.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

-- Gopls for Go
lspconfig.gopls.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

-- Zls for Zig
lspconfig.zls.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

