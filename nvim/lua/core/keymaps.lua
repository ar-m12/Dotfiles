-- ~/.config/nvim/lua/core/keymaps.lua

-- Key mappings
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true })  -- Save file
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true })  -- Quit Neovim
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true })  -- Toggle NvimTree with Ctrl + n
vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", { noremap = true })  -- Focus NvimTree
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true })  -- Find files with Telescope
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true })  -- Live grep with Telescope
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true })  -- List buffers with Telescope
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true })  -- List help tags with Telescope

-- Map Ctrl+Backspace to delete the previous word in insert mode
vim.keymap.set('i', '<C-h>', '<C-w>', { noremap = true })
vim.keymap.set('i', '<C-BS>', '<C-w>', { noremap = true })
