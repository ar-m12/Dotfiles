
local cmp = require'cmp'
local luasnip = require'luasnip'

-- Load VS Code-style snippets from friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- Expand snippets
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'copilot' }, -- GitHub Copilot source
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- Add LuaSnip as a source
    { name = 'buffer' },
    { name = 'path' },
  }),
})

-- Copilot integration setup
require("copilot").setup({})
require("copilot_cmp").setup()

