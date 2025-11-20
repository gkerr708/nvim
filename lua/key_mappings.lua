local paths = require("util.paths")

vim = vim or {}

-- Python
vim.keymap.set('n', '<Leader>rp', function()
  local python_cmd = paths.get_python_path()
  local filename = vim.fn.shellescape(paths.get_current_file_path())
  local project_root = vim.fn.getcwd()

  local cmd = "cd " .. vim.fn.shellescape(project_root) .. " && PYTHONPATH=. " .. python_cmd .. " " .. filename
  vim.cmd("belowright split | terminal echo '" .. python_cmd .. " " .. filename .. "' && echo '' && " .. cmd)
  vim.cmd("stopinsert")
end, { silent = false })

vim.keymap.set('n', '<Leader>rm', function()
  local file = vim.fn.expand("%:p")          -- full path of current file
  local ext = vim.fn.expand("%:e")           -- file extension
  local project_root = vim.fn.getcwd()
  local module_name = paths.get_module_name()

  -- If file is an R script, run with Rscript
  if ext == "r" or ext == "R" then
    local cmd = "cd " .. project_root .. " && Rscript " .. file
    vim.cmd("belowright split | terminal echo 'Rscript " .. file .. "' && echo '' && " .. cmd)
    vim.cmd("stopinsert")
    return
  end

  -- Otherwise assume it's a Python module (your original logic)
  local python_cmd
  if vim.fn.filereadable(project_root .. "/uv.lock") == 1 then
    python_cmd = "uv run"
  elseif vim.fn.filereadable(project_root .. "/poetry.lock") == 1 then
    python_cmd = "poetry run python3"
  else
    python_cmd = "python3"
  end

  local cmd = "cd " .. project_root .. " && PYTHONPATH=. " .. python_cmd .. " -m " .. module_name
  vim.cmd("belowright split | terminal echo '" .. python_cmd .. " -m " .. module_name .. "' && echo '' && " .. cmd)
  vim.cmd("stopinsert")
end, { silent = false })

vim.keymap.set('n', '<Leader>rt', function()
  local cmd = "poetry run pytest -v -s"
  vim.cmd("belowright split | terminal echo '" .. cmd .. "' && echo '' && " .. cmd)
  vim.cmd("stopinsert")
end, { silent = false })

-- Rust 
vim.keymap.set('n', '<Leader>ru', function()
  local cmd = "cargo run"
  vim.cmd("belowright split | terminal echo '" .. cmd .. "' && echo '' && " .. cmd)
  vim.cmd("stopinsert")
end, { silent = false })

vim.keymap.set('n', '<Leader>ri', function()
  local cmd = "cargo run --bin"
  local file_name = vim.fn.expand("%:t:r")
  cmd = cmd .. " " .. file_name
  vim.cmd("belowright split | terminal echo '" .. cmd .. "' && echo '' && " .. cmd)
  vim.cmd("stopinsert")
end, { silent = false })

-- C/C++
vim.keymap.set('n', '<Leader>cp', function()
  local project_root = vim.fn.getcwd()
  local build_dir = project_root .. "/build"
  if vim.fn.isdirectory(build_dir) == 0 then
    vim.fn.mkdir(build_dir, "p")
  end
  local detect_cmd = "cd " .. build_dir .. " && cmake .. && make && find . -maxdepth 1 -type f -executable ! -name '*.*' -printf '%T@ %p\\n' | sort -n | tail -1 | cut -d' ' -f2"
  local cmd = "cd " .. build_dir .. " && exe=$(" .. detect_cmd .. ") && echo Running $exe && $exe"
  local msg = "Building and auto-running latest executable"
  vim.cmd("belowright split | terminal echo '" .. msg .. "' && echo '' && " .. cmd)
  vim.cmd("stopinsert")
end, { silent = false })

vim.keymap.set('n', '<Leader>cc', function()
  local project_root = vim.fn.getcwd()
  local build_dir = project_root .. "/build/Release"
  if vim.fn.isdirectory(build_dir) == 0 then
    vim.fn.mkdir(build_dir, "p")
  end

  local cmd = table.concat({
    "cd " .. build_dir,
    "conan install ../.. --build=missing -of .",
    "cmake ../.. -DCMAKE_TOOLCHAIN_FILE=generators/conan_toolchain.cmake",
    "cmake --build .",
    "echo Running ./myapp",
    "./myapp"
  }, " && ")

  vim.cmd("belowright split | terminal " .. cmd)
  vim.cmd("stopinsert")
end, { silent = false })

-- vimtex
vim.keymap.set('n', '<leader>lv', '<cmd>VimtexView<CR>', { desc = 'View PDF in Zathura' })
vim.keymap.set('n', '<leader>lb', function()
  -- Bibtex build command
  vim.cmd('!bibtex main')
end, { desc = "bibtex main" })


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
vim.keymap.set('n', '<Leader>wc', ':w !wc -w<CR>') -- gets word count

-- quit window
vim.keymap.set('n', '<Leader>q', ':q <CR>', { noremap = true, silent = false })

-- Markdown files 
vim.keymap.set('n', '<Leader>mp', ':MarkdownPreview<CR>') -- % means current file
vim.keymap.set('n', '<Leader>ms', ':MarkdownPreviewStop<CR>') -- % means current file
vim.keymap.set('n', '<Leader>mt', ':MarkdownPreviewToggle<CR>') -- % means current file

-- Show diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Show diagnostics" })

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
