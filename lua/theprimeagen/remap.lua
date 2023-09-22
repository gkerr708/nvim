-- See `:help vim.keymap.set()`
-- Set <space> as the leader key
vim.g.mapleader = ' '

vim.keymap.set('n', '<Leader>fe', vim.cmd.Ex) -- opens file explorer

vim.keymap.set('n', '<Leader>rm', ':!python3 main.py')
vim.keymap.set('n', '<Leader>rp', ':!python3 ')


-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

