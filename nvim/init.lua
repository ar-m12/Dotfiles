-- ~/.config/nvim/init.lua

-- Load core settings
require("core.options")   -- General Neovim settings
require("core.keymaps")   -- Key mappings

-- Load plugins
require("plugins.init")   -- Plugin manager (Lazy.nvim) and plugin configurations
require("plugins.lsp")    -- LSP configurations
require("plugins.cmp")    -- Autocompletion setup
require("plugins.themes") -- Theme configurations
require("plugins.clipboard") -- Clipboard setup

