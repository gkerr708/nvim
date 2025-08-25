return {
-- lua/plugins/vimtex.lua
  {
    "lervag/vimtex",
    lazy = false, -- load at startup (recommended for filetype detection)
    init = function()
      -- Set localleader BEFORE plugin loads (VimTeX maps use it)
      --vim.g.maplocalleader = " "

      -- Viewer (pick ONE). Zathura with SyncTeX via nvr:
      vim.g.vimtex_view_method = "zathura"
      -- If you prefer Okular instead, comment the line above and use:
      -- vim.g.vimtex_view_method = "general"
      -- vim.g.vimtex_view_general_viewer = "okular"
      -- vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"

      -- Compiler (latexmk is default & recommended)
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        build_dir = "",
        callback = 1,
        continuous = 1,
        executable = "latexmk",
        options = {
          "-pdf",
          "-pdflatex=lualatex",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }

      -- Quality-of-life
      vim.g.vimtex_quickfix_mode = 1
      vim.g.vimtex_fold_enabled = 0

	  -- Shortcuts
	  vim.cmd([[
		nmap <localleader>ll <cmd>VimtexCompile<CR>
		nmap <localleader>lv <cmd>VimtexView<CR>
		nmap <localleader>lk <cmd>VimtexStop<CR>
		nmap <localleader>le <cmd>VimtexErrors<CR>
		nmap <localleader>li <cmd>VimtexInfo<CR>
		nmap <localleader>lc <cmd>VimtexClean<CR>
	  ]])
    end,
    ft = { "tex" },
  },
}
