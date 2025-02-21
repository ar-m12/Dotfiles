-- ~/.config/nvim/lua/plugins/cmp.lua

local cmp = require'cmp'
local luasnip = require'luasnip'

-- Load VS Code-style snippets from friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- Expand snippets
    end,
    mapping = {
                ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        },
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- Add LuaSnip as a source
    { name = 'buffer' },
    { name = 'path' },
  }),
})
