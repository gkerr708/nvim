vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<Leader>fe', vim.cmd.Ex) -- opens file explorer
vim.keymap.set('n', '<Leader>rm', ':! clear; python3 %<CR>') -- % means current file
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<Leader><Tab>', '<C-w>w')
vim.keymap.set('n', '<Leader>j', ':NvimTreeToggle<CR>') -- opens nerdtree file explorer
-- Git commands
vim.keymap.set('n', '<Leader>ga', ':! git add .<CR>') -- opens nerdtree file explorer
vim.keymap.set('n', '<Leader>gc', ':! git commit -m "Laptop"<CR>') -- opens nerdtree file explorer
vim.keymap.set('n', '<Leader>gp', ':! git push<CR>') -- opens nerdtree file explorer
vim.keymap.set('n', '<Leader>gP', ':! git pull<CR>') -- opens nerdtree file explorer