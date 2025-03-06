
local lspconfig = require('lspconfig')
-- null-ls import removed - incompatible with Neovim v0.11.0-dev
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Global on_attach and capabilities
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  if vim.lsp.buf.declaration then
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  end

  if vim.lsp.buf.definition then
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  end

  if vim.lsp.buf.hover then
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  end

  if vim.lsp.buf.implementation then
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  end

  if vim.lsp.buf.signature_help then
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  end

  if vim.lsp.buf.add_workspace_folder then
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  end

  if vim.lsp.buf.remove_workspace_folder then
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  end

  if vim.lsp.buf.list_workspace_folders then
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
  end

  if vim.lsp.buf.type_definition then
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  end

  if vim.lsp.buf.rename then
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  end

  if vim.lsp.buf.code_action then
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  end

  if vim.lsp.buf.references then
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  end

  if vim.lsp.buf.formatting then
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
  end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- Mason setup
mason.setup()
mason_lspconfig.setup({
  ensure_installed = { "ts_ls", "html", "cssls", "eslint", "pyright", "clangd" },
})

-- Python (using pyright)
lspconfig.pyright.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

-- TypeScript / JavaScript (using ts_ls)
lspconfig.ts_ls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
}

-- NOTE: null-ls has been completely disabled due to incompatibility with Neovim v0.11.0-dev
-- The error occurs because null-ls tries to access '_request_name_to_capability' which is nil
-- Consider using native LSP formatting instead

-- HTML
lspconfig.html.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

-- CSS
lspconfig.cssls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

-- C++ (using clangd)
lspconfig.clangd.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

