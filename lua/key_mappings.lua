vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- runs python files
--vim.keymap.set('n', '<Leader>rm', ':! python3.10 %<CR>') -- % means current file
--vim.keymap.set('n', '<Leader>rp', ':! poetry run python3.10 %<CR>') -- % means current file

-- Runs Python files with poetry or without (horizontal bottom split)
vim.keymap.set('n', '<Leader>rm', function()
  local handle = io.popen("poetry env info --path 2>/dev/null")
  local poetry_env = handle and handle:read("*a") or ""
  if handle then handle:close() end

  local using_poetry = poetry_env ~= ""
  local filename = vim.fn.shellescape(vim.fn.expand("%:p"))  -- Get and escape file path
  local cmd = using_poetry and "poetry run python3.10 " .. filename
                          or "python3.10 " .. filename
  local msg = using_poetry and "echo 'Python 3.10 (Poetry)' && echo ''"
                          or "echo 'Python 3.10 (System)' && echo ''"

  -- Open terminal and run both the message + Python command
  vim.cmd("belowright split | terminal " .. msg .. " && " .. cmd)

  -- Exit insert mode immediately after opening terminal
  vim.cmd("stopinsert")
end, { silent = false })



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

-- quit window
vim.keymap.set('n', '<Leader>q', ':q <CR>', { noremap = true, silent = false })

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
