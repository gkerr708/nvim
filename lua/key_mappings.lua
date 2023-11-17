  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '
  vim.keymap.set('n', '<Leader>fe', vim.cmd.Ex) -- opens file explorer
  vim.keymap.set('n', '<Leader>rm', ':!python3 main.py<CR>')
  vim.keymap.set('n', '<Leader>rp', ':!python3 ')
  vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
  vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
  vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
  vim.keymap.set('n', '<Leader><Tab>', '<C-w>w')
  vim.keymap.set('n', '<Leader>j', ':NvimTreeToggle<CR>') -- opens nerdtree file explorer
