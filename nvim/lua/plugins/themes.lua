-- lua/plugins/themes.lua
return {
  {"nyoom-engineering/oxocarbon.nvim"},
  {"dgox16/oldworld.nvim"},
  {"zenbones-theme/zenbones.nvim"},
  {"Mofiqul/vscode.nvim"},
  {"morhetz/gruvbox"},
  {"folke/tokyonight.nvim"},
  {"rebelot/kanagawa.nvim"},
  {"catppuccin/nvim", name = "catppuccin"},
  {"scottmckendry/cyberdream.nvim"},
  -- Moonfly theme
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1001,
    config = function()
      vim.cmd("colorscheme moonfly")
    end,
  },
  -- Transparent plugin
  {
    "xiyaowong/nvim-transparent",
    lazy = false,
    priority = 1000,
    config = function()
      require("transparent").setup({
        groups = { -- Default groups for core transparency
          "Normal", "NormalNC", "Comment", "Constant", "Special", "Identifier",
          "Statement", "PreProc", "Type", "Underlined", "Todo", "String",
          "Function", "Conditional", "Repeat", "Operator", "Structure",
          "LineNr", "NonText", "SignColumn", "CursorLine", "CursorLineNr",
          "StatusLine", "StatusLineNC", "EndOfBuffer",
        },
        extra_groups = { -- Your plugin-specific groups
          "NvimTreeNormal", "NvimTreeWinSeparator", "TelescopeNormal",
          "Pmenu", "CmpDoc", "LspDiagnosticsDefaultError",
          "LspDiagnosticsDefaultWarning", "LspDiagnosticsDefaultInformation",
          "NormalFloat", "FoldColumn",
        },
        exclude_groups = {},
      })
        vim.cmd("TransparentEnable") -- Force transparency on startup
    end,
  },
}
