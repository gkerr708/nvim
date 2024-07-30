vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- runs python files
vim.keymap.set('n', '<Leader>rm', ':! python3.10 %<CR>') -- % means current file

-- complies cpp files
--vim.keymap.set('n', '<Leader>ro', ':!cmake -S . -B build && cmake --build build <CR>')
--vim.keymap.set('n', '<Leader>rp', ':!./build/%:t:r  <CR>')

-- Find and replace commands
local opts = {}
vim.api.nvim_set_keymap("v", "<C-r>", "<CMD>SearchReplaceSingleBufferVisualSelection<CR>", opts)
vim.api.nvim_set_keymap("v", "<C-s>", "<CMD>SearchReplaceWithinVisualSelection<CR>", opts)
vim.api.nvim_set_keymap("v", "<C-b>", "<CMD>SearchReplaceWithinVisualSelectionCWord<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>rs", "<CMD>SearchReplaceSingleBufferSelections<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ro", "<CMD>SearchReplaceSingleBufferOpen<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rw", "<CMD>SearchReplaceSingleBufferCWord<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rW", "<CMD>SearchReplaceSingleBufferCWORD<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>re", "<CMD>SearchReplaceSingleBufferCExpr<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rf", "<CMD>SearchReplaceSingleBufferCFile<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>rbs", "<CMD>SearchReplaceMultiBufferSelections<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rbo", "<CMD>SearchReplaceMultiBufferOpen<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rbw", "<CMD>SearchReplaceMultiBufferCWord<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rbW", "<CMD>SearchReplaceMultiBufferCWORD<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rbe", "<CMD>SearchReplaceMultiBufferCExpr<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rbf", "<CMD>SearchReplaceMultiBufferCFile<CR>", opts)

-- show the effects of a search / replace in a live preview window
vim.o.inccommand = "split"

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<Leader><Tab>', '<C-w>w')
vim.keymap.set('n', '<Leader>j', ':NvimTreeToggle<CR>') -- opens nerdtree file explorer
vim.keymap.set('n', '<Leader>wc', ':w !wc -w<CR>') -- gets word count

-- Git commands
vim.keymap.set('n', '<Leader>ga', ':! git add .<CR>') -- opens nerdtree file explorer
vim.keymap.set('n', '<Leader>gc', ':! git commit -m "Default Message"<CR>') -- opens nerdtree file explorer
vim.keymap.set('n', '<Leader>gp', ':! git push<CR>') -- opens nerdtree file explorer
vim.keymap.set('n', '<Leader>gP', ':! git pull<CR>') -- opens nerdtree file explorer
vim.keymap.set('n', '<Leader>gf', ':! git fetch<CR>') -- opens nerdtree file explorer
vim.keymap.set('n', '<Leader>gm', ':! git merge<CR>') -- opens nerdtree file explorer

-- Open a Terminal
vim.api.nvim_set_keymap('n', '<Leader>th', ':split | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tv', ':vsplit | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tt', ':tabnew | terminal<CR>', { noremap = true, silent = true })

-- Close the Current Terminal or Window
vim.api.nvim_set_keymap('t', '<Leader>tc', '<C-\\><C-n>:q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tc', ':q<CR>', { noremap = true, silent = true })

-- Switch between Terminal and Normal Mode
vim.api.nvim_set_keymap('t', '<Leader>tn', '<C-\\><C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ti', 'i', { noremap = true, silent = true })
---- Autocommand to enter insert mode on terminal open
vim.cmd([[
  augroup Terminal
    autocmd!
    autocmd TermOpen * startinsert
  augroup END
]])
