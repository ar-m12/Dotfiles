-- ~/.config/nvim/lua/core/options.lua

-- Set leader key
vim.g.mapleader = " "

-- General settings
vim.o.number = true                -- Show line numbers
vim.o.cursorline = false           -- line Highlight
vim.o.relativenumber = false       -- Disable relative line numbers (static line numbers)
vim.o.smartcase = true             -- Smart case matching
vim.o.ignorecase = true            -- Ignore case in search
vim.o.tabstop = 4                  -- Number of spaces for a tab
vim.o.shiftwidth = 4               -- Indentation width
vim.o.expandtab = true             -- Use spaces instead of tabs
vim.o.cursorline = true            -- Highlight current line
vim.o.termguicolors = true         -- Enable true color support
vim.o.hlsearch = true              -- Highlight search results
vim.o.incsearch = true             -- Incremental search
vim.o.scrolloff = 8                -- Minimal number of screen lines to keep above and below the cursor
vim.o.sidescrolloff = 8            -- Minimal number of screen columns to keep to the left and right of the cursor
vim.o.wrap = false                 -- Disable line wrapping
vim.o.splitright = true            -- Force vertical splits to open to the right
vim.o.splitbelow = true            -- Force horizontal splits to open below
