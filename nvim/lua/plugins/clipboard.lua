-- ~/.config/nvim/lua/plugins/clipboard.lua

-- Enable clipboard between Neovim and Windows
vim.opt.clipboard:append("unnamedplus")  -- Let Neovim use the system clipboard

if vim.fn.has('wsl') == 1 then
  -- Copy to Windows clipboard
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ["+"] = 'clip.exe',
      ["*"] = 'clip.exe',
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("r", ""))',
    },
    cache_enabled = true,
  }
end
