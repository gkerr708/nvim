vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.hlsearch = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false    -- Disable text wrapping
vim.o.mouse = 'a'
vim.opt.clipboard = 'unnamedplus' -- not sure which one is correct
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.spelllang = 'en_us'
vim.o.spell = true
vim.g.netrw_liststyle = 0
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.background = "dark" -- or "light" for light mode
--vim.cmd([[colorscheme gruvbox]])

-- Ensure the signcolumn is always visible
vim.wo.signcolumn = 'yes'

-- Set the highlight group for SignColumn
vim.cmd [[highlight SignColumn guibg=bg]]

-- Enable text wrapping for .tex files
vim.cmd[[autocmd FileType tex,markdown setlocal wrap]]
vim.cmd[[autocmd FileType tex setlocal noautoindent]] -- Stops auto indent for .tex files


-- Enable text wrapping for .tex and .md files


vim.g.WebDevIconsNerdTreeAfterGlyphPadding = '  '

